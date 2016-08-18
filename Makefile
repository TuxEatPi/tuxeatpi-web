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
	node_modules/polymer-cli/bin/polymer.js build --entrypoint app/index.html
	cp -r app/images build/bundled/app
	cp -r app/images build/unbundled/app
	cp -r app/elements/tep-tux/images build/unbundled/app/elements/tep-tux

deploy:
	rm -rf ../tuxeatpi-server/ui; cp -r build/unbundled/app ../tuxeatpi-server/ui
	sed -i 's#o.baseUrl="[^"]*"\,#o.baseUrl="/ui/",#g' ../tuxeatpi-server/ui/scripts/app.js
