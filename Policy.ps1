$Subscription = Get-AzSubscription -SubscriptionName 'Azure subscription 1'

$Policy = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed locations'}
New-AzPolicyAssignment -Name 'Restrict Location' -PolicyDefinition $Policy -Scope "/subscriptions/$($Subscription.Id)" -PolicyParameter .\AllowedLocations.json

$Policy2 = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed virtual machine SKUs'}
New-AzPolicyAssignment -Name 'Restrict VM SKUs' -PolicyDefinition $Policy2 -Scope "/subscriptions/$($Subscription.Id)" -PolicyParameter .\AllowedVmSKUs.json
