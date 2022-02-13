﻿FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["CatsApi.csproj", "./"]
RUN dotnet restore "CatsApi.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "CatsApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CatsApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CatsApi.dll"]