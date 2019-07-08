# vagrant

## Kafka Monitoring UI Case 1


### Install Docker-CE in VMBox

`$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

`$ sudo yum install -y docker-ce

-- permission denied /var/run/docker.sock

`$ sudo groupadd docker

`$ sudo usermod -aG docker ecube

`$ sudo systemctl start docker.service

-- to apply, must logout


[Kafdrop 3](https://github.com/obsidiandynamics/kafdrop) 

