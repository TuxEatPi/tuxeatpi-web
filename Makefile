dep:
	sudo apt-get install nodejs
	# For debian
	# https://deb.nodesource.com/node_4.x/pool/main/n/nodejs/nodejs_4.4.7-1nodesource1~sid1_amd64.deb

npm:
	npm install polymer-cli
	npm install bower
	node_modules/bower/bin/bower install

env:
	echo source dev_virtualenv

builder:
	rm -rf build
	polymer.js build --entrypoint app/index.html 
	#polymer.js build --include-dependencies=bower_components/webcomponentsjs/webcomponents-lite.min.js bower_components/iron-ajax/iron-ajax.html bower_components/iron-icons/iron-icons.html bower_components/iron-ajax/iron-request.html bower_components/promise-polyfill/promise-polyfill-lite.html bower_components/promise-polyfill/Promise.js service-worker.js -v
	cp -r images build/bundled
	cp -r images build/unbundled

deploy:
	rm -rf ../tuxeatpi-server/ui; cp -r build/unbundled/app ../tuxeatpi-server/ui
