docker volume create gitea || true
docker run -d -p 3008:3008 -p 22:22 -v gitea:/data --name gitea gitea/gitea