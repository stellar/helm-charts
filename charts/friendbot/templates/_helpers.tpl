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

{{- define "common.friendbotImage" -}}
{{ .Values.global.image.friendbot.registry }}/{{ .Values.global.image.friendbot.repository }}{{ .Values.global.image.friendbot.name }}:{{ .Values.global.image.friendbot.tag | default .Chart.AppVersion }}
{{- end -}}

{{- define "core.config" -}}
{{- if eq .Values.global.network "testnet" -}}
{{- template "core.testnetConfig" }}
{{- else if eq .Values.global.network "pubnet" -}}
{{- template "core.pubnetConfig" }}
{{- else -}}
{{- .Values.ingest.coreConfig }}
{{- end -}}
{{- end -}}

