FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app
COPY backend ./backend
WORKDIR /app/backend
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/backend/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]