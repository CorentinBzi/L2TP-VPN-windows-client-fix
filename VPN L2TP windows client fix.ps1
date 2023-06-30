Add-VpnConnection -Name "VPN" -ServerAddress YOUR_PUBLIC_IP -TunnelType L2tp -RememberCredential -L2tpPsk YOUR_PRIVATE_KEY -AuthenticationMethod MSChapv2 -EncryptionLevel Maximum -Force
Write-Host "VPN Connection added"


# Store path to registry key
$basePath = "HKLM:\SYSTEM\CurrentControlSet\Services\PolicyAgent\"

# Check if property exists
if (-not(Get-ItemProperty -Name 'AssumeUDPEncapsulationContextOnSendRule' -Path $basePath -ErrorAction SilentlyContinue)){
    # If it doesn't exist, create it and set the value to 00000002
    New-ItemProperty -Name AssumeUDPEncapsulationContextOnSendRule -PropertyType dword -Value 00000002 -Path $basePath
} else {
    # If it does exist, set the value to 00000002
    Set-ItemProperty -Name AssumeUDPEncapsulationContextOnSendRule -Value 00000002 -Path $basePath
}


Write-Host "Regedit Done [VPN Allowed through Modem NAT]"