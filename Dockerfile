FROM maven:3.8.5-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENV MONGO_URL=mongodb://mongo:muQcgcusjPXFpCxFkjzfjbOjBsWRPKYJ@roundhouse.proxy.rlwy.net:36842
ENV MONGOUSER=mongo
ENV MONGOPASSWORD=muQcgcusjPXFpCxFkjzfjbOjBsWRPKYJ
ENV MONGOHOST=roundhouse.proxy.rlwy.net
ENV MONGOPORT=36842
ENV MONGO_DBNAME=test

ENTRYPOINT ["java", "-jar", "app.jar"]
