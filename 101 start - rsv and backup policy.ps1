#Get Variables
$resourceGroup = Get-AzResourceGroup networks-rg

#Set Variables
$location = $resourceGroup.location
$resourceGroupName = "backups-rg"

#Build Resources
New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/backup/101-create-rsv-bkup-policy.json"

(Get-AzVm -ResourceGroupName $resourceGroupName).name
