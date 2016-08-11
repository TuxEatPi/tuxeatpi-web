dep:
	sudo apt-get install nodejs
	# https://deb.nodesource.com/node_4.x/pool/main/n/nodejs/nodejs_4.4.7-1nodesource1~sid1_amd64.deb

creation:
	mkdir -p tuxeatpi-web
	cd tuxeatpi-web && npm install generator-polymer
	yo polymer

env:
	mkdir -p tuxeatpi-web
	cd tuxeatpi-web && npm install polymer-cli
	cd tuxeatpi-web && npm install bower
