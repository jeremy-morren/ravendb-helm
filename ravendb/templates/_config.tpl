{{- define "config" -}}

# Generate json config for each node
# The main thing we are adding is PublicServerUrl and PublicServerUrl.Tcp
  
{{- range $k, $v := .Values.hosts }}
'{{- $k | toString }}':
  'Setup.Mode': 'None'
  'DataDir': '/data/RavenData'
  'ServerUrl': 'https://0.0.0.0'
  'ServerUrl.Tcp': 'tcp://0.0.0.0:38888'
  'License.Path': '/license/license.json'
  'License.Eula.Accepted': 'true'

  'Security.Certificate.Load.Exec': 'openssl'
  'Security.Certificate.Load.Exec.Arguments': 'pkcs12 -inkey /tls/tls.key -in /tls/tls.crt -export -out - -nodes -passout pass:'

  'PublicServerUrl': 'https://{{ $v.http }}/'
  'PublicServerUrl.Tcp': 'https://{{ $v.tcp }}:443/'
{{- end }}
{{- end }}