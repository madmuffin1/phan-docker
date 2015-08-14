phan-docker
==

A docker image to run phan on your machine. To build it execute:

	docker build -t phan .

In order to have phan run against your code, you need to mount your code into the `/data` volume, e.g.

	docker run -v $PWD:/data/ phan

Enjoy!