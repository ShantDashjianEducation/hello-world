# Use a base image with Java 17 and a lightweight Linux distribution
FROM adoptopenjdk/openjdk17:jre-17.0.2_8-alpine
WORKDIR /app
COPY . .
RUN gradle clean build

# Copy the compiled JAR file from the Gradle build stage
COPY --from=build /app/build/libs/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world-0.0.1-SNAPSHOT.jar

# Expose the port that your Spring Boot application runs on
EXPOSE 8080

# Define the command to run your application when the container starts
CMD ["java", "-jar", "hello-world-0.0.1-SNAPSHOT.jar"]
