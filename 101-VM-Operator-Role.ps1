#Get Variables
$subscriptions = Get-AzSubscription

#Set Variables
$subscriptionId = $subscriptions.id

#Build Resources
az role definition create --role-definition `
    -TemplateUri "https://raw.githubusercontent.com/jonathan-harris-uk/azure/roles/VirtualMachineOperatorRole.json" `
    -subscriptionId $subscriptionId
