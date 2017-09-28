default: install

install: build-static

build-static:
	docker run -v $PWD/app cloudfoundry/cflinuxfs2 ./scripts/dep.sh

clean:
	rm -rf vendor/
	go clean