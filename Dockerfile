FROM maven:3.9.6-eclipse-temurin-11

RUN apt-get update && apt-get install -y git curl && \
    echo "✅ Tools Installed"

WORKDIR /app

COPY . .

# Copy custom settings.xml
COPY settings.xml /root/.m2/settings.xml

RUN mvn -B -ntp verify -DskipTests=true
