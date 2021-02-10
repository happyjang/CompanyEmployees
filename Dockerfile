#FROM mcr.microsoft.com/dotnet/sdk:5.0
#WORKDIR /app 
#COPY . . 
#RUN dotnet restore
#RUN dotnet publish ./CompanyEmployees/CompanyEmployees.csproj -o out 
#WORKDIR /app/out
#ENTRYPOINT ["dotnet", "CompanyEmployees.dll"]

#FROM mcr.microsoft.com/dotnet/sdk:5.0
#WORKDIR /app 
#COPY ./CompanyEmployees/CompanyEmployees.csproj ./CompanyEmployees/ 
#COPY ./Contracts/Contracts.csproj ./Contracts/ 
#COPY ./Repository/Repository.csproj ./Repository/ 
#COPY ./Entities/Entities.csproj ./Entities/ 
#COPY ./LoggerService/LoggerService.csproj ./LoggerService/ 
#COPY ./CompanyEmployees.sln .
#RUN dotnet restore
#COPY . . 
#RUN dotnet publish ./CompanyEmployees/CompanyEmployees.csproj -o out 
#WORKDIR /app/out
#ENTRYPOINT ["dotnet", "CompanyEmployees.dll"]
#
FROM mcr.microsoft.com/dotnet/sdk:5.0 as build-image
WORKDIR /app 
COPY ./CompanyEmployees/CompanyEmployees.csproj ./CompanyEmployees/ 
COPY ./Contracts/Contracts.csproj ./Contracts/ 
COPY ./Repository/Repository.csproj ./Repository/ 
COPY ./Entities/Entities.csproj ./Entities/ 
COPY ./LoggerService/LoggerService.csproj ./LoggerService/ 
COPY ./CompanyEmployees.sln .

RUN dotnet restore 
COPY . . 
RUN dotnet publish ./CompanyEmployees/CompanyEmployees.csproj -o out 
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-image /app/out .
ENTRYPOINT ["dotnet", "CompanyEmployees.dll"]