FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY target/myapp-1.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
