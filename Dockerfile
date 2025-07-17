FROM maven:3.9.6-eclipse-temurin-11

# Install necessary tools
RUN apt-get update && apt-get install -y git curl

# Set working directory
WORKDIR /app

# Copy settings.xml to the correct Maven location
COPY settings.xml /root/.m2/settings.xml

# Copy project files
COPY . .

# Run Maven build with the Jenkins repo from settings.xml
RUN mvn -B -ntp verify -DskipTests=true
