## 配置DNS服务

进入容器

```
docker exec -it dns-server /bin/sh
```

首先配置上行的真正的dns服务器地址，毕竟你只是个本地代理，不了解外部规则。创建文件：

vi /etc/resolv.dnsmasq

添加内容：

nameserver 114.114.114.114
nameserver 8.8.8.8

配置本地解析规则，这才是我们的真实目的。新建配置文件


vi /etc/dnsmasqhosts

添加解析规则,其中192.168.33.10是gitlab服务器地址

192.168.33.10 gitlab.example.com

修改dnsmasq配置文件，指定使用上述我们自定义的配置文件,

vi /etc/dnsmasq.conf
修改下述两个配置

resolv-file=/etc/resolv.dnsmasq
addn-hosts=/etc/dnsmasqhosts


回到宿主，重启dns-server容器服务。

docker restart dns-server


这时候这台docker host就是一个DNS服务器了，假如他的地址是192.168.33.13