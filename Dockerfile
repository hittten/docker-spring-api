#Builder
FROM maven:3.3-jdk-8 as builder

WORKDIR /app

COPY . .
RUN mvn clean package

#Server
FROM openjdk:8-jdk-alpine
VOLUME /tmp

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]
