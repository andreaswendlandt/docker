#ansible


ssh-keygen -t ed25519

docker-compose build --build-arg SSH_KEY="$(cat .ssh/id_ed25519)" --build-arg SSH_KEY_PUB="$(cat .ssh/id_ed25519.pub)"
docker-compose up --no-build -d
