FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build
WORKDIR /src
EXPOSE 80

COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet build -c release --no-restore

FROM build AS publish
RUN dotnet publish -c release --no-build -o /app

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "docker-sample-api.dll"]