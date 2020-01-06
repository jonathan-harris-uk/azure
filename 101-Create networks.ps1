#Login to customer tenant
Connect-AzAccount

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$adminUsername = Read-Host -Prompt "Enter the administrator username"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$dnsLabelPrefix = Read-Host -Prompt "Enter an unique DNS name for the public IP"
$windowsOSVersion = Read-Host -Prompt "Enter the Windows version for the VM"
$vmSize = Read-Host -Prompt "Enter the VM Size"

New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/master/azuredeploy.json" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix `
    -windowsOSVersion $windowsOSVersion  `
    -vmSize $vmSize

 (Get-AzVm -ResourceGroupName $resourceGroupName).name