{{/*
  Build the CNPG Cluster .spec.

  The primary source of truth is .Values.cnpg.cluster.spec, which is a
  free-form pass-through mapping any field on the CNPG Cluster CRD (e.g.
  instances, storage, enablePDB, monitoring, backup, resources, affinity,
  postgresql, primaryUpdateStrategy, ...).

  Precedence (low -> high, deep merge):
    1. Built-in defaults seeded in this helper (instances: 1, storage.size: 50Gi).
    2. Legacy shortcut keys under .Values.cnpg.cluster (deprecated, prefer
       .Values.cnpg.cluster.spec):
         - instances
         - imageName
         - storage.size
         - storage.storageClass
    3. .Values.cnpg.cluster.spec (wins on conflict).

  `bootstrap` is injected from .Values.cnpg.auth and the chart-managed app
  secret only when .Values.cnpg.cluster.spec.bootstrap is not provided.

  Returns the spec as YAML (without indentation); callers should pipe it
  through `nindent` at the desired indent level.

  Usage:
    spec:
      {{- include "horizon.cnpgClusterSpec" . | nindent 2 }}
*/}}
{{- define "horizon.cnpgClusterSpec" -}}
{{- $extra := default (dict) .Values.cnpg.cluster.spec -}}
{{- /* Built-in defaults (lowest priority; overridable by legacy shortcuts or by cnpg.cluster.spec) */ -}}
{{- $shortcuts := dict
    "instances" 1
    "storage"   (dict "size" "50Gi")
-}}
{{- /* Legacy shortcuts (deprecated, prefer cnpg.cluster.spec) */ -}}
{{- if hasKey .Values.cnpg.cluster "instances" -}}
  {{- $_ := set $shortcuts "instances" .Values.cnpg.cluster.instances -}}
{{- end -}}
{{- if .Values.cnpg.cluster.imageName -}}
  {{- $_ := set $shortcuts "imageName" .Values.cnpg.cluster.imageName -}}
{{- end -}}
{{- $legacyStorage := default (dict) .Values.cnpg.cluster.storage -}}
{{- if $legacyStorage.size -}}
  {{- $_ := set (index $shortcuts "storage") "size" $legacyStorage.size -}}
{{- end -}}
{{- if $legacyStorage.storageClass -}}
  {{- $_ := set (index $shortcuts "storage") "storageClass" $legacyStorage.storageClass -}}
{{- end -}}
{{- /* Inject bootstrap defaults only when caller did not provide cluster.spec.bootstrap */ -}}
{{- if not (hasKey $extra "bootstrap") -}}
  {{- $_ := set $shortcuts "bootstrap" (dict "initdb" (dict
      "database" (required "cnpg.auth.database is required when cnpg.enabled=true" .Values.cnpg.auth.database)
  "owner"    (default "horizon" .Values.cnpg.auth.username)
      "secret"   (dict "name" (include "horizon.cnpgAppSecretName" .)))) -}}
{{- end -}}
{{- $spec := mergeOverwrite $shortcuts (deepCopy $extra) -}}
{{- toYaml $spec }}
{{- end -}}
