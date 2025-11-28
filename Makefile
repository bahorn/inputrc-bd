build:
	./build.sh


test: build
	HOME=`pwd` bash
