# Nomad playground

```bash
vagrant up
vagrant ssh
sudo nomad agent -dev

cd nomad
nomad job run docker.nomad
nomad job run java.nomad

nomad ui
```
