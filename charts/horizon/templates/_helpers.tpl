{{- define "common.name" -}}
{{- default .Chart.Name .Values.global.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.fullname" -}}
{{- if .Values.global.fullnameOverride -}}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.global.nameOverride -}}
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

{{- define "common.horizonImage" -}}
{{ .Values.global.image.horizon.registry }}/{{ .Values.global.image.horizon.repository }}:{{ default .Chart.AppVersion .Values.global.image.horizon.tag }}
{{- end -}}

{{- define "core.config" -}}
{{- if eq .Values.global.network "testnet" -}}
{{- include "core.testnetConfig" . }}
{{- else if eq .Values.global.network "pubnet" -}}
{{- include "core.pubnetConfig" . }}
{{- else -}}
{{- .Values.ingest.coreConfig }}
{{- end -}}
{{- end -}}

{{- define "horizon.historyArchiveUrls" -}}
{{- if eq .Values.global.network "testnet" -}}
https://history.stellar.org/prd/core-testnet/core_testnet_001,https://history.stellar.org/prd/core-testnet/core_testnet_002,https://history.stellar.org/prd/core-testnet/core_testnet_003
{{- else if eq .Values.global.network "pubnet" -}}
https://history.stellar.org/prd/core-live/core_live_001,https://history.stellar.org/prd/core-live/core_live_002,https://history.stellar.org/prd/core-live/core_live_003
{{- else  -}}
{{- .Values.global.historyArchiveUrls }}
{{- end -}}
{{- end -}}

{{- define "horizon.networkPassphrase" -}}
{{- if eq .Values.global.network "testnet" -}}
Test SDF Network ; September 2015
{{- else if eq .Values.global.network "pubnet" -}}
Public Global Stellar Network ; September 2015
{{- else -}}
{{- .Values.global.networkPassphrase }}
{{- end -}}
{{- end -}}
