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

builder:
	rm -rf build
	polymer.js build --include-dependencies=bower_components/webcomponentsjs/webcomponents-lite.min.js bower_components/iron-ajax/iron-ajax.html bower_components/iron-icons/iron-icons.html bower_components/iron-ajax/iron-request.html bower_components/promise-polyfill/promise-polyfill-lite.html bower_components/promise-polyfill/Promise.js service-worker.js -v
	cp -r images build/bundled
	cp -r images build/unbundled

deploy:
	rm -rf ../tuxeatpi-server/ui; cp -r build/unbundled ../tuxeatpi-server/ui
