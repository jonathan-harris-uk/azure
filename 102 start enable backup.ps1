#Get Variables
$resourceGroup = Get-AzResourceGroup backups-rg

#Set Variables
$location = $resourceGroup.location
$resourceGroupName = $resourcegroup.ResourceGroupName
$virtualMachineName = Read-Host -Prompt "Enter the name of the VM to be backed up"

#Build Resources
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/backup/102-enable-backup.json" `
    -location $location `
    -virtualMachineName $virtualMachineName

(Get-AzVm -ResourceGroupName $resourceGroupName).name
