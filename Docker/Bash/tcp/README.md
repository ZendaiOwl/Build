Bash Docker image that uses `/dev/tcp` to check if a port is open on a remote host

```bash
docker run --rm -it zendai/checkport:tcp ipv4.google.com 443
open

docker run --rm -it zendai/checkport:tcp ipv4.google.com 444
Terminated
closed

docker run --rm -it zendai/checkport:tcp 
Requires 2 arguments: [HOST] [PORT]
[HOST]: Can be FQDN, IPv4 or IPv6
[PORT]: Can be any valid port integer
```
