# Nomad playground

In the node:

```bash
vagrant up
vagrant ssh
sudo nomad agent -bind 0.0.0.0 -dev
```

then from the host:

```bash
cd nomad
nomad job run docker.nomad
nomad job run java.nomad

nomad ui
```
