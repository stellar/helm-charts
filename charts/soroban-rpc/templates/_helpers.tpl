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

{{- define "common.stellarCoreUrl" -}}
{{- if (.Values.sorobanRpc).stellarCoreUrl }}
{{- .Values.sorobanRpc.stellarCoreUrl }}
{{- else -}}
{{- printf "http://%s-core:%s" .Release.Name "11626" -}}
{{- end -}}
{{- end -}}
