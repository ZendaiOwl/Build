# syntax=docker/dockerfile:1
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
FROM bash:5.2.15
COPY getIP.sh /
RUN apk add --no-cache curl
ENTRYPOINT ["bash", "/getIP.sh"]
