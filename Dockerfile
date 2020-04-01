FROM openjdk:8-alpine
COPY ./target/Docker01.jar app.jar

CMD ["java", "-jar", "app.jar"]