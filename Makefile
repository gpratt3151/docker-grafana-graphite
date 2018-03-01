# docker-grafana-graphite makefile

# Environment Varibles
CONTAINER = kamon-grafana-dashboard

.PHONY: up

prep :
	mkdir -p \
		data/whisper \
		data/elasticsearch \
		data/grafana \
		log/graphite \
		log/graphite/webapp \
		log/elasticsearch

pull :
	sudo /usr/local/bin/docker-compose pull

up : prep pull
	sudo /usr/local/bin/docker-compose up -d

down :
	sudo /usr/local/bin/docker-compose down

shell :
	sudo docker exec -ti $(CONTAINER) /bin/bash

tail :
	sudo docker logs -f $(CONTAINER)
