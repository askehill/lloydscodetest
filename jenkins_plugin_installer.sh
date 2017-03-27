#!/usr/bin/env bash

# Assumes jenkins running on localhost  with user admin password admin
curl -O http://localhost:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ install-plugin   --username admin --password admin git
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ restart  --username admin --password admin