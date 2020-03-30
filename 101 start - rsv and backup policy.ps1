#Set Varriables
$resourceGroupName = "backups-rg"
$location = Read-Host -Prompt "Enter the location (i.e. uksouth, northeurope)"

#Build Resources
New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/backup/101-create-rsv-bkup-policy.json"

(Get-AzVm -ResourceGroupName $resourceGroupName).name
