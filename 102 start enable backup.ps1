#Set Varriables
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$virtualMachineName = Read-Host -Prompt "Enter the name of the VM to be backed up"

#Build Resources
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/backup/102-enable-backup.json" `
    -location $location `
    -virtualMachineName $virtualMachineName

(Get-AzVm -ResourceGroupName $resourceGroupName).name
