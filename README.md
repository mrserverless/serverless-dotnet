# Serverless C# Hello World

A sample project based on servlerss [Hello World C# Example](https://serverless.com/framework/docs/providers/aws/examples/hello-world/csharp/)

With the following enhancments:

* Use `make` to simplify command line arguments for dotnet `restore`, `publish` and zipping up `deploy-package.zip` 
* Rely purely on docker containers to run `servlerless` and `dotnet` commands, so no local dependencies are necessary.