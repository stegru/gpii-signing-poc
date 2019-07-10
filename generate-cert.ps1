param (
    [string]$output = "code-sign-test"
)

$pfxFile = "$output.pfx"
$certFile = "$output.cert"

# Generate the certificate
$cert = New-SelfSignedCertificate -DnsName testing@self-signed.example -Type CodeSigningCert -CertStoreLocation cert:\CurrentUser\My -KeyDescription "FOR TESTING ONLY - DO NOT TRUST IN PRODUCTION"

# Set the password for the private key
$password = ConvertTo-SecureString -String "I'm only testing" -AsPlainText -Force 

# Export it - this contains the certificate and the private key
Export-PfxCertificate -Cert "cert:\CurrentUser\My\$($cert.ThumbPrint)" -Password $password -FilePath $pfxFile

# Export just the certificate (can be distributed)
Export-Certificate -Cert "cert:\CurrentUser\My\$($cert.ThumbPrint)" -FilePath $certFile

