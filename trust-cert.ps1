param (
    [string]$certFile = "code-sign-test.cert"
)


# Make it a trusted publisher
Import-Certificate -FilePath $certFile -Cert cert:\LocalMachine\TrustedPublisher
# MAke it a root certificate authority
Import-Certificate -FilePath $certFile -Cert cert:\LocalMachine\Root
