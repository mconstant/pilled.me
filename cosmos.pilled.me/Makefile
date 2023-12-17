default: dev

build:
	yarn install
	yarn --offline --frozen-lockfile build

dev:
	yarn dev

docker:
	docker build --build-arg CORES=6 --build-arg JOBS=4 -t pilled:dev .