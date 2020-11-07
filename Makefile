export DOCKER=docker
export IMAGE_NAME=bretfisher/jekyll-serve
export PORT=4000
export CONTAINER_NAME=my_jekyll_gabriel


serve:
	sudo docker run -it --rm \
  -v "$(PWD):/home/appuser/myapp" -p 4000:4000 \
  --name $(CONTAINER_NAME) \
	jekyll-docker bundle exec jekyll serve -H 0.0.0.0

build:
	sudo docker run -it --rm \
  -v "$(PWD):/home/appuser/myapp" \
  --name $(CONTAINER_NAME) jekyll-docker jekyll build


  # -v "$(PWD)/vendor/bundle:/usr/local/bundle" \
# 

COMMAND=./bin/deploy
check:
	git checkout master
	sudo docker run -it --rm \
  -v "$(PWD):/home/appuser/myapp" -p 4000:4000 \
  --name $(CONTAINER_NAME) \
	jekyll-docker $(COMMAND)


deploy:
	git checkout master
	sudo docker run -it --rm \
  -v "$(PWD):/home/appuser/myapp" -p 4000:4000 \
  --name $(CONTAINER_NAME) \
	jekyll-docker ./bin/deploy


image:
	sudo docker build --tag jekyll-docker .


deploy-after:
	git checkout master
	./bin/deploy_after