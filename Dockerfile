# Step 1: Maven vaitchu project-ai build seivatharku
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Build aana JAR file-ai run seivatharku
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /app/target/*.jar pillmate.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "pillmate.jar"]