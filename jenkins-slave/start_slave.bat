docker run -d --rm --name j-deploy-agent -v //var/run/docker.sock:/var/run/docker.sock  robin/jenkins-agent-s390x -url http://192.168.0.159:8080 faf0bfcec0201d619b63f494fa4479e57660f8168169fd64caaf9b28b2f0e957 j-deploy-agent
docker run -d --rm --name j-build-agent -v //var/run/docker.sock:/var/run/docker.sock robin/jenkins-agent-s390x -url http://192.168.0.159:8080 7f932d274a468ecbaa12fee588138dbc65721a95dfa60d056499980553c7ca0c j-build-agent