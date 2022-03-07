# Use SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build-env

# Copy csproj and restore as distinct layers
WORKDIR /src
COPY *.csproj ./
RUN dotnet restore

# Copy repository to base image and publish your application
COPY . .
RUN dotnet publish -c Release -o /app

# Copy published app to the runtime image to save space
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS final

# Copy published application from build environment to final image
WORKDIR /app
COPY --from=build-env /app .

# Use the following for Heroku
CMD ASPNETCORE_URLS=http://*:$PORT dotnet dotnet-mvc.dll
