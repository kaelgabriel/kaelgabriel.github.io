export DOCKER=docker
export IMAGE_NAME=bretfisher/jekyll-serve
export PORT=4000
export CONTAINER_NAME=my_jekyll_gabriel


serve:
	sudo docker run -it --rm \
  -v "$(PWD):/home/appuser/myapp" -p 4000:4000 \
  --name $(CONTAINER_NAME) \
	jekyll-docker bundle exec jekyll serve -H 0.0.0.0 --incremental

build:
	sudo docker run -it --rm \
  -v "$(PWD):/home/appuser/myapp" -p 4000:4000 \
 -v "$(PWD)/vendor/bundle:/usr/local/bundle" \
  --name $(CONTAINER_NAME) \
	jekyll-docker bundle exec jekyll build

COMMAND="cat _pages/about.md"
COMMAND=cat _sass/_variables.scss
COMMAND=bundle exec
COMMAND=cat /home/appuser/myapp/_config.yml
check:

	sudo docker run -it --rm \
   -v "$(PWD):/home/appuser/myapp" -p 4000:4000 \
   -v "$(PWD)/vendor/bundle:/usr/local/bundle" \
   --name $(CONTAINER_NAME) jekyll-docker $(COMMAND)

image:
	sudo docker build --tag jekyll-docker .


