#!/bin/bash

# Script to run the StorageSystem application with proper environment setup

# Source SDKMAN and set Java 8
source ~/.sdkman/bin/sdkman-init.sh
sdk env

# Navigate to project directory
cd StoreManagement

# Build the project
echo "Building project..."
mvn clean compile -q

# Build classpath
mvn dependency:build-classpath -Dmdep.outputFile=classpath.txt -q

# Run the application with proper classpath and JavaFX settings
echo "Starting StorageSystem application..."
java -Djava.awt.headless=false \
     -Dprism.order=sw \
     -cp "target/classes:$(cat classpath.txt)" \
     gui.Main
