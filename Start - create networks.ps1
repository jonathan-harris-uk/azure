#Set Varriables
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$publicIP = Read-Host -Prompt "Enter the customer's Public IP Address - used to lock down RDP access"

#Build Resources
New-AzResourceGroup -Name $resourceGroupName -Location "$location"
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/network/create-network.json"
    -publicIP $publicIP
    
 (Get-AzVm -ResourceGroupName $resourceGroupName).name
