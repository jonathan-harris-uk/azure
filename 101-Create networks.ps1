#Login to customer tenant
Connect-AzAccount

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"


New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/master/azuredeploy.json"

 (Get-AzVm -ResourceGroupName $resourceGroupName).name
