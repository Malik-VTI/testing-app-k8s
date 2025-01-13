# Base image
FROM openjdk:17-jdk-slim

# Copy JAR file
ARG JAR_FILE=target/ecommerce-app-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

# Expose port
EXPOSE 7070

# Run application
ENTRYPOINT ["java", "-jar", "/app.jar"]