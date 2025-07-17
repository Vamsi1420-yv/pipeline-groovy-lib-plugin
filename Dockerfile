FROM maven:3.9.6-eclipse-temurin-11

# Install any additional tools (if needed)
RUN apt-get update && apt-get install -y git curl

# Set workdir
WORKDIR /app

# Copy your project files
COPY . .

# Copy settings.xml to Maven config
COPY settings.xml /root/.m2/settings.xml

# Run build
RUN mvn -B -ntp verify -DskipTests=true
