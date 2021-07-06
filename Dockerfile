FROM openjdk:latest

COPY target/calculator-0.0.1-SNAPSHOT.jar calculator-0.0.1-SNAPSHOT.jar

EXPOSE 5000

ENTRYPOINT ["java","-jar","/calculator-0.0.1-SNAPSHOT.jar"]
