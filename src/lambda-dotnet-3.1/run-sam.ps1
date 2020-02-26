Write-Host 'Compile' -ForegroundColor Yellow
dotnet publish Lambda.CustomRuntime.Dotnet31.csproj --configuration Release --self-contained true /p:AssemblyName=bootstrap --output publishLambda -r rhel.7.2-x64
Write-Host 'Package to S3' -ForegroundColor Yellow
sam package --template-file .\publishLambda\package.yaml --output-template-file .\publishLambda\deploy.yaml --s3-bucket etg-core-lambda-deployment
Write-Host 'Deploy with CloudFormation' -ForegroundColor Yellow
aws cloudformation deploy --template-file .\publishLambda\deploy.yaml --stack-name custom-runtime-test

Write-Host 'Invoke the Lambda' -ForegroundColor Yellow
dotnet lambda invoke-function -p "hello world" --region ap-southeast-1 --function-name uat-custom-runtime-net-core-31-sam