# Use the AdoptOpenJDK Java 17 image as the base image
FROM adoptopenjdk/openjdk17:jre-17.0.2_8-alpine

# Set the working directory
WORKDIR /app

# Copy the built JAR file
COPY build/libs/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Set the entrypoint to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
