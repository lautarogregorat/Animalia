FROM openjdk:17 
WORKDIR /app
COPY ./AnimaliaBackJava-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java","-jar", "-Dspring.profiles.active=docker", "/app/app.jar"]
