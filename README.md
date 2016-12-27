# Serverless C# Hello World

A sample project based on servlerss [Hello World C# Example](https://serverless.com/framework/docs/providers/aws/examples/hello-world/csharp/)

With the following enhancments:

* Use `make` to simplify command line arguments for dotnet `restore`, `publish` and zipping up `deploy-package.zip` 
* Rely purely on docker containers to run `servlerless` and `dotnet` commands, so no local dependencies are necessary.

## Instructions

Update `env.list.template` with your AWS credentials and save it as `env.list`. This file contains the environment variables required by the `serverless` docker container. Do not check this file in. 

The simply:

    make deploy

## Under the Hood

This sample application's `Makefile` leverages the following containers:

* [microsoft/dotnet](https://github.com/dotnet/dotnet-docker) - to build the C# code
* [amaysim-au/aws-serverless](https://github.com/amaysim-au/docker-aws-serverless) - awesome docker serverless container written by my colleague [@flemay](https://github.com/flemay)

## To Do

* detect if native dotnet exists and use that instead of dotnet docker.
