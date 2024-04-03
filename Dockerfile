FROM eclipse-temurin:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the Gradle build files
COPY build.gradle .
COPY settings.gradle .
COPY gradlew .

# Copy the Gradle wrapper
COPY gradle gradle

# Copy the source code
COPY src src

# Build the JAR file using Gradle
RUN ./gradlew clean build --no-daemon

# Set the working directory for runtime
WORKDIR /app

# Copy the built JAR file
COPY build/libs/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Set the entrypoint to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
