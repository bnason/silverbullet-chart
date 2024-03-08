{{/*
Expand the name of the chart.
*/}}
{{- define "silverbullet.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "silverbullet.fullname" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "silverbullet.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "silverbullet.labels" -}}
helm.sh/chart: {{ include "silverbullet.chart" . }}
{{ include "silverbullet.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "silverbullet.selectorLabels" -}}
app.kubernetes.io/name: {{ include "silverbullet.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "silverbullet.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "silverbullet.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
