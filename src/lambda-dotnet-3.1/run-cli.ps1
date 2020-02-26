Write-Host 'Compile + Zip + Deploy' -ForegroundColor Yellow
dotnet lambda deploy-function --region ap-southeast-1 --function-name uat-custom-runtime-net-core-31-cli --function-role core-lambda-role

Write-Host 'Invoke the Lambda' -ForegroundColor Yellow
dotnet lambda invoke-function -p "hello world" --region ap-southeast-1 --function-name uat-custom-runtime-net-core-31-cli