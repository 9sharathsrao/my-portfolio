# Step 1: Use Maven to build the app
FROM maven:3.8.4-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Run the app using OpenJDK
FROM openjdk:17-jdk-slim
COPY --from=build /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]