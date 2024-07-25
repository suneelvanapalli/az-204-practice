resourceGroup=$(az group list --query "[1].{id:name}" -o tsv)
appName=ASP-rgsuneeldemo-a652


echo resourceGroup: $resourceGroup

cd html-docs-hello-world-master

az webapp up -g $resourceGroup -n $appName --html
