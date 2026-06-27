FROM eclipse-temurin:17-jre-jammy

COPY target/*.jar /app/

EXPOSE 8081

CMD ["tail", "-f", "/dev/null"]
