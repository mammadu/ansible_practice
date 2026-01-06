# ansible_practice

repo for practicing ansible

## requirements

- docker and docker-compose

## installation

1. Clone and navigate to the root of the repo
2. Create ssh keys in the repo with the following command: `ssh-keygen -t ed25519 -C "control node" -f ./id_ed25519 -N ""`
3. Launch the containers with the docker compose command: `docker compose up --build`
4. from inside the control container, ping the managed nodes: `ansible all -i inventory.yaml -m ping`
