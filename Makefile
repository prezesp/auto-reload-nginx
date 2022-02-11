IMG := prezesp/auto-reload-nginx

build:
	docker build -t $(IMG) .

clean:
	docker image rm $(IMG)