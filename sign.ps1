param (
    [string]$exe = "morphic-app.exe",
    [string]$pfxFile = "code-sign-test.pfx"
)

if (Test-Path $pfxFile) {
    $cert = Get-PfxCertificate -FilePath $pfxFile
    Set-AuthenticodeSignature $exe -Certificate $cert
} else {
    echo "$pfxFile does not exist - run generate-cert.ps1"
}
