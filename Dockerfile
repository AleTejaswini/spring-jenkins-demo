FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests -B


#-- stage 2 --
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN addgroup -S appgroup &&  adduser -S appuser -G appgroup
RUN mkdir -p /app /logs && chown -R appuser:appgroup /app /logs
COPY --from=build /app/target/*.jar /app/app.jar
RUN chown -R appuser:appgroup /app
USER appuser
EXPOSE 8081
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost:8081/actuator/health || exit 1
ENTRYPOINT ["java","-jar","/app/app.jar"]
	 
