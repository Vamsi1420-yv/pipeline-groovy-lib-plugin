FROM maven:3.9.6-eclipse-temurin-21 as build

# Set workdir
WORKDIR /app

# Copy Maven settings file (adjust path if needed)
COPY settings.xml /root/.m2/settings.xml

# Copy project files
COPY . .

# Build the project (skip tests)
RUN mvn -B -ntp clean verify -DskipTests
