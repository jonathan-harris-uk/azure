#Set Varriables
Get-AzSubscription
$subscriptionId = Read-Host -Prompt "Enter Azure subscription ID, from Get-AzSubscription command"
$resourceGroupName = "vms-rg"
$location = Read-Host -Prompt "Enter the location (i.e. uksouth, northeurope)"
$vmName = Read-Host -Prompt "Enter the VM Name (i.e. aznevm1)"
$dnsLabelPrefix = $vmName
$vmSize = Read-Host -Prompt "Enter the VM Size (i.e. Standard_B2s, Standard_B4ms, Standard_B8ms)"
$adminUsername = Read-Host -Prompt "Enter the administrator username"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$windowsOSVersion = Read-Host -Prompt "Enter the Windows version for the VM (i.e. 2012-R2-Datacenter-smalldisk, 2016-Datacenter-smalldisk, 2012-R2-Datacenter, 2016-Datacenter, 2016-Datacenter)"
$osDiskSize = Read-Host -Prompt "Enter the OS disk size (i.e. 64, 128, 256, 512, 1024, 2048)"

#Build Resources
New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/vms/101-create-vm.json" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix `
    -windowsOSVersion $windowsOSVersion  `
    -vmSize $vmSize  `
    -vmName $vmName  `
    -osDiskSize $osDiskSize  `
    -subscriptionId $subscriptionId

 (Get-AzVm -ResourceGroupName $resourceGroupName).name
