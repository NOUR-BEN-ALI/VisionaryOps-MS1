### Use an OpenJDK base image
#FROM openjdk:21-jdk
#ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.33.2/opentelemetry-javaagent.jar /opentelemetry-javaagent.jar
#
### Copy the JAR file from your project into the container
#COPY target/microservice1.jar /app/microservice1.jar
###COPY target/opentelemetry-javaagent-2.1.0.jar /app/opentelemetry-javaagent-2.1.0.jar
#WORKDIR /app
# #COPY --from=build /build/target/*.jar /app/microservice1.jar
# # Entry point to run the application
# ENTRYPOINT ["java", "-javaagent:/opentelemetry-javaagent.jar", "-jar", "/app/microservice1.jar"]
### Expose the port your Spring Boot application runs on (change to the actual port)
##
#EXPOSE 9989
##
#ENV JAVA_OPTS="-javaagent:/app/opentelemetry-javaagent.jar \
#    -Dotel.exporter.otlp.protocol=grpc \
#    -Dotel.metrics.exporter=prometheus \
#    -Dotel.exporter.prometheus.port=9090 \
#    -Dotel.logs.exporter=otlp \
#    -Dotel.exporter.otlp.logs.endpoint=http://collector:4317 \
#    -Dotel.exporter.otlp.endpoint=http://collector:4317 \
#    -Dotel.exporter.otlp.traces.endpoint=http://tempo:4317 \
#    -Dotel.service.name=Microservice1 "

## Use an OpenJDK base image
FROM openjdk:21-jdk
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.33.2/opentelemetry-javaagent.jar /opentelemetry-javaagent.jar

## Copy the JAR file from your project into the container
COPY target/microservice1.jar /app/microservice1.jar
#COPY opentelemetry-javaagent.jar /app/opentelemetry-javaagent.jar
WORKDIR /app
 #COPY --from=build /build/target/*.jar /app/microservice1.jar
 #
ENTRYPOINT ["java", "-javaagent:/opentelemetry-javaagent.jar","-Dotel.exporter.otlp.protocol=grpc","-Dotel.metrics.exporter=prometheus","-Dotel.exporter.prometheus.port=9090","-Dotel.logs.exporter=otlp","-Dotel.exporter.otlp.logs.endpoint=http://collector:4317","-Dotel.exporter.otlp.traces.endpoint=http://tempo:4317","-jar", "/app/microservice1.jar"]
#ENTRYPOINT ["java","-javaagent:/javaagent.jar","-Dotel.exporter.otlp.protocol=grpc","-Dotel.metrics.exporter=prometheus","-Dotel.exporter.prometheus.port=9090","-Dotel.logs.exporter=otlp","-Dotel.exporter.otlp.logs.endpoint=http://collector:4317","-Dotel.exporter.otlp.traces.endpoint=http://microview-v3-tempo-1:4317","-jar","/app.jar"]
## Expose the port your Spring Boot application runs on (change to the actual port)
#
EXPOSE 9989
#
#ENV JAVA_OPTS="-javaagent:/app/opentelemetry-javaagent.jar \
#    -Dotel.exporter=otlp \
#    -Dotel.spans.exporter=none \
#    -Dotel.otlp.tracing.endpoint=http://tempo:4317\
#    -Dotel.logs.exporter=otlp \
#    -Dotel.exporter.otlp.logs.endpoint=http://collector:4317 \
#    -Dotel.service.name=Microservice1"