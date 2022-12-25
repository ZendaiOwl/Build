Bash Docker image with `curl` that checks for your networks public IP.

Note: Docker needs to have `IPv6` enabled for this image to be able to detect an IPv6 address.

`docker run --rm -it zendai/checkport:getIP`
