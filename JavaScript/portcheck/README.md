## Portcheck

Note: I've deployed another project for this instead which uses a different hosting provider which has IPv4 & IPv6 support and Python Sanic web server framework.

---

A little project I made for [Nextcloudpi][ncp] that checks if ports are open and properly configured in the router for port-forwarding.

It uses Express.js & npm port-scanner to check if port 80 & 443 are open on an IP-address or URL, due to restrictions on the hosting provider I'm using for this only IPv4 addresses can be resolved & checked if port 80 & 443 is open.

[ncp]: https://github.com/nextcloud/nextcloudpi

It takes a POST method payload with a JSON object as below

```json
{
  "key": "Host-URL"
}
```

```json
{
  "key": "IP-address"
}
```

and returns a JSON object response as below

```json
{
    "80": "open",
    "443": "open"
}
```

Or if the ports are closed

```json
{
    "80": "closed",
    "443": "closed"
}
```
