FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
WORKDIR /app
COPY . .
RUN ./gradlew clean build
COPY --from=build /app/build/libs/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "hello-world-0.0.1-SNAPSHOT.jar"]

