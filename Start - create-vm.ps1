﻿
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$vmName = Read-Host -Prompt "Enter the VM Name"
$dnsLabelPrefix = Read-Host -Prompt "Enter an unique DNS name for the public IP"
$vmSize = Read-Host -Prompt "Enter the VM Size"
$adminUsername = Read-Host -Prompt "Enter the administrator username"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$windowsOSVersion = Read-Host -Prompt "Enter the Windows version for the VM"

New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/vms/create-vm.json" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix `
    -windowsOSVersion $windowsOSVersion  `
    -vmSize $vmSize  `
    -vmName $vmName

 (Get-AzVm -ResourceGroupName $resourceGroupName).name
