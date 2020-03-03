#Set Varriables
$subscriptionId = Read-Host -Prompt "Enter Azure subscription ID, from Get-AzSubscription command"

#Build Resources
az role definition create --role-definition `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/roles/VM-Operator-Role.json" `
    -subscriptionId $subscriptionId
