FROM jenkinsciinfra/plugin-site-api:latest

USER root

# Install Git and other tools (already includes Java + Maven)
RUN apt-get update && apt-get install -y git curl

# Set workdir
WORKDIR /app

# Copy Jenkins settings.xml (if needed)
COPY settings.xml /root/.m2/settings.xml

# Copy plugin code
COPY . .

# Build with Jenkins plugin goals
RUN mvn -B -ntp clean verify -DskipTests
