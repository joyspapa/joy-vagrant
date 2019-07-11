# vagrant

## Kafka Monitoring UI Case 1


### Install Docker-CE in VMBox

```bash
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

$ sudo yum install -y docker-ce

$ sudo usermod -aG docker ecube

$ sudo systemctl start docker.service
```
***(if happened this messeage "permission denied /var/run/docker.sock", you have to re-login to vmbox)***  

`to apply, must logout`



### Kafka Monitoring Reference Site  

[Kafdrop 3](https://github.com/obsidiandynamics/kafdrop) 

