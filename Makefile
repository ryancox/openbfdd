USER=ryancox
REPO=openbfdd
BUILDERREPO=build_openbfdd
VERSION=0.5.3
TAG=$(USER)/$(REPO):$(VERSION)
BUILDERTAG=$(BUILDERREPO):$(VERSION)
TARGET=package/target

clean:
	rm -rf $(TARGET)
	-docker rmi -f $(TAG) $(BUILDERTAG)

build:
	mkdir -p package/target
	docker build --build-arg VERSION=$(VERSION) -t $(BUILDERTAG) builder
	docker run --rm -it -v `pwd`/$(TARGET):/target $(BUILDERTAG)
	docker build -t $(TAG) package

push: 
	docker login
	docker push $(TAG)

start:
	docker-compose up

connect:
	docker exec -it openbfdd_a_1 bfdd-control allow 192.168.100.3
	docker exec -it openbfdd_b_1 bfdd-control connect local 192.168.100.3 remote 192.168.100.2
	docker exec -it openbfdd_b_1 bfdd-control status
	docker exec -it openbfdd_a_1 bfdd-control status

kill:
	docker exec -it openbfdd_b_1 bfdd-control session all kill

tcpdump-on:
	tcpdump -i any port 3784 -U -w bfd.pcap& 

tcpdump-off:
	kill -2 $(shell pgrep tcpdump)

all: clean build push
