# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the fat jar into the container at /app
COPY /target/java-rest-api-calculator.jar /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run jar file when the container launches
CMD ["java", "-jar", "java-rest-api-claculator.jar"]