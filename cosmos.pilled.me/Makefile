default: build

build:
	yarn install
	yarn --offline --frozen-lockfile build

dev:
	npm run dev

docker:
	docker build --build-arg CORES=6 --build-arg JOBS=4 -t pilled:dev .