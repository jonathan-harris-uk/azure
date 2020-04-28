#Test Cloud Server
Connect-AzAccount -Tenant 2efc9b84-92e4-42e3-b5af-5e5975bb0bc5 -SubscriptionId 1b9e8993-94f5-4204-a739-8b4c1e31e115
Disconnect-AzAccount

$Subscription = Get-AzSubscription -SubscriptionName 'Azure subscription 1'

$Policy = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed locations'}
New-AzPolicyAssignment -Name 'Restrict Location' -PolicyDefinition $Policy -Scope "/subscriptions/$($Subscription.Id)" -PolicyParameter .\AllowedLocations.json

$Policy2 = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed virtual machine SKUs'}
New-AzPolicyAssignment -Name 'Restrict VM SKUs' -PolicyDefinition $Policy2 -Scope "/subscriptions/$($Subscription.Id)" -PolicyParameter .\AllowedVmSKUs.json