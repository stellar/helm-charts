{{- define "common.name" -}}
{{- default .Chart.Name (.Values.global).nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.fullname" -}}
{{- if (.Values.global).fullnameOverride -}}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name (.Values.global).nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.sorobanRpcImage" -}}
{{ .Values.global.image.sorobanRpc.registry }}/{{ .Values.global.image.sorobanRpc.repository }}:{{ default .Chart.AppVersion .Values.global.image.sorobanRpc.tag }}
{{- end -}}

{{- define "common.tlsSecretName" -}}
{{- if (.Values.sorobanRpc.ingress).tlsSecretName -}}
{{- .Values.sorobanRpc.ingress.tlsSecretName -}}
{{- else -}}
{{ template "common.fullname" . }}-cert
{{- end -}}
{{- end -}}

{{/*
Port the RPC JSON-RPC endpoint listens on. Shared by the config file, the Service,
the container port and the readiness probe so they cannot drift apart.
*/}}
{{- define "common.rpcPort" -}}
{{- .Values.sorobanRpc.port | default 8000 -}}
{{- end -}}

{{/*
File name of the generated RPC config. Used as the ConfigMap key and in --config-path.
*/}}
{{- define "common.rpcConfigFileName" -}}
{{- $name := .Values.sorobanRpc.configFileName | default "soroban-rpc.cfg" -}}
{{- if eq $name "stellar-captive-core.cfg" -}}
{{- fail "sorobanRpc.configFileName must not be stellar-captive-core.cfg because that key is reserved for the captive-core config" -}}
{{- end -}}
{{- $name -}}
{{- end -}}

{{/*
Checks that fail the render early, with a clear message, instead of producing a pod
that cannot start. Called once at the top of the StatefulSet template.
*/}}
{{- define "common.validate" -}}
{{- $v := .Values.sorobanRpc.rpcVersion | default "v1" -}}
{{- if not (or (eq $v "v1") (eq $v "v2")) -}}
{{- fail (printf "sorobanRpc.rpcVersion must be v1 or v2, got %q" $v) -}}
{{- end -}}
{{- if eq $v "v2" -}}
{{- if not .Values.sorobanRpc.rpcv2Config -}}
{{- fail "sorobanRpc.rpcVersion is v2 but sorobanRpc.rpcv2Config is empty" -}}
{{- end -}}
{{- if not ((.Values.global).image).sorobanRpc.tag -}}
{{- fail "sorobanRpc.rpcVersion is v2 but global.image.sorobanRpc.tag is not set. The default image refuses --enable-rpcv2; set the tag of an image built with rpcv2 enabled" -}}
{{- end -}}
{{- $endpoint := ((.Values.sorobanRpc.rpcv2Config).service).endpoint -}}
{{- $port := printf ":%s" (include "common.rpcPort" .) -}}
{{- if not (and $endpoint (hasSuffix $port (toString $endpoint))) -}}
{{- fail (printf "sorobanRpc.rpcv2Config.service.endpoint must be set and end with %q so the Service and the readiness probe reach the daemon, got %q" $port (toString $endpoint)) -}}
{{- end -}}
{{- end -}}
{{- $t := (.Values.sorobanRpc.persistence).type | default "pvc" -}}
{{- if not (or (eq $t "pvc") (eq $t "emptyDir")) -}}
{{- fail (printf "sorobanRpc.persistence.type must be pvc or emptyDir, got %q" $t) -}}
{{- end -}}
{{- end -}}

{{/*
Helm reads every YAML number as a float, and toToml writes a float as "15.0".
rpcv2 refuses a float where it expects an integer ("Can't convert 15(float64) to
uint32"). This walks a map and turns every float with no fraction back into an
integer, in place, so toToml writes "15". A real fraction such as 1.5 is kept.
Running it twice is harmless.
*/}}
{{- define "common.intifyWholeFloats" -}}
{{- range $k, $v := . -}}
  {{- if kindIs "map" $v -}}
    {{- include "common.intifyWholeFloats" $v -}}
  {{- else if kindIs "slice" $v -}}
    {{- $out := list -}}
    {{- range $v -}}
      {{- if and (kindIs "float64" .) (eq (float64 (int64 .)) .) -}}
        {{- $out = append $out (int64 .) -}}
      {{- else -}}
        {{- $out = append $out . -}}
      {{- end -}}
    {{- end -}}
    {{- $_ := set $ $k $out -}}
  {{- else if and (kindIs "float64" $v) (eq (float64 (int64 $v)) $v) -}}
    {{- $_ := set $ $k (int64 $v) -}}
  {{- end -}}
{{- end -}}
{{- end -}}

{{/*
True when the StatefulSet has at least one volumeClaimTemplate: the /var/lib/stellar
PVC, or the cold-storage PVC.
*/}}
{{- define "common.hasVolumeClaimTemplates" -}}
{{- $p := .Values.sorobanRpc.persistence -}}
{{- if or (and $p.enabled (eq ($p.type | default "pvc") "pvc")) ($p.coldStorage).enabled -}}true{{- end -}}
{{- end -}}
