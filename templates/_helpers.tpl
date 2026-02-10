{{/*
Create the name of the service account to use
*/}}
{{- define "helmet-extended.serviceAccountName" -}}
{{- $renderedName := include "common.tplvalues.render" (dict "value" .Values.serviceAccount.name "context" $) -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "common.names.fullname" .) $renderedName }}
{{- else }}
{{- default "default" $renderedName }}
{{- end }}
{{- end }}