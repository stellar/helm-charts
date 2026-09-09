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
