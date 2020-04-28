$Subscription = Get-AzSubscription

$Policy = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed locations'}
New-AzPolicyAssignment -Name 'Restrict Location' -PolicyDefinition $Policy -Scope "/subscriptions/$($Subscription.Id)" -PolicyParameter https://raw.githubusercontent.com/jonathan-harris-uk/azure/Policy/AllowedLocations.json

$Policy2 = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed virtual machine SKUs'}
New-AzPolicyAssignment -Name 'Restrict VM SKUs' -PolicyDefinition $Policy2 -Scope "/subscriptions/$($Subscription.Id)" -PolicyParameter https://raw.githubusercontent.com/jonathan-harris-uk/azure/Policy/AllowedVmSKUs.json
