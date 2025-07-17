# === Stage 1: Build Jenkins Plugin using Maven with HPI support ===
FROM maven:3.9.6-eclipse-temurin-11 AS build

# Install Jenkins Plugin Tools (for hpi packaging)
RUN apt-get update && apt-get install -y git curl && \
    curl -fsSL https://repo.jenkins-ci.org/public/org/jenkins-ci/tools/plugin-compat-tester-cli/ \
    && echo "✅ Plugin Tools Installed"

# Set workdir
WORKDIR /app

# Copy code
COPY . .

# Download plugin parent first
RUN mvn -B -ntp verify -DskipTests=true -Dmaven.test.skip=true

# === Optional: Copy final artifacts ===
# COPY target/*.hpi /output/

# === Stage 2 (optional): runtime Jenkins plugin test ===
# You can extend a Jenkins base image and copy the plugin in
