FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source
# copy csproj and restore as distinct layers
COPY *.sln .
COPY . .
RUN dotnet restore -r linux-musl-x64

# copy everything else and build app
COPY . ./aspnetapp/
WORKDIR /source/aspnetapp
RUN dotnet build "WepAPI/WepAPI.csproj" -c Release -o /app/build

# copy app and run
FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine-amd64
WORKDIR /app
COPY --from=build /app ./

EXPOSE 5001
EXPOSE 5000

ENTRYPOINT ["dotnet","/app/build/WepAPI.dll"]