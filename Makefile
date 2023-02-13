install:
	sudo yum install -y yum-utils
	sudo yum-config-manager \
		--add-repo \
		https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	sudo systemctl enable docker
	sudo systemctl start docker
setup:
	docker compose up -d
	sleep 7
	docker ps -a | grep jenkins | docker logs $$(awk '{print $$1}')
restart:
	docker compose up -d --force-recreate
