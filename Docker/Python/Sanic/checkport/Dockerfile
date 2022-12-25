# syntax=docker/dockerfile:1
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
FROM sanicframework/sanic:LTS
COPY ./server.py ./requirements.txt /srv/
RUN pip install --upgrade pip; pip install -r /srv/requirements.txt
EXPOSE 8080
CMD ["python", "/srv/server.py"]
