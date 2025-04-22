# Reset-UserPassword.ps1
param(
    [string]$username,
    [string]$newPassword = "TempPass123!"
)

Import-Module ActiveDirectory

Set-ADAccountPassword -Identity $username -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $newPassword -Force)
Set-ADUser -Identity $username -ChangePasswordAtLogon $true

Write-Host "Password for $username has been reset."
