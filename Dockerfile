FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /workspace

COPY config-server/gradle gradle
COPY config-server/gradlew gradlew
COPY config-server/build.gradle build.gradle
COPY config-server/settings.gradle settings.gradle
COPY config-server/src src

RUN chmod +x gradlew && ./gradlew bootJar -x test --no-daemon

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=builder /workspace/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]