# How to use ?

You need build PearProject docker image.

choise php version , and `cd` to dir.

```
# build
docker build -t pear-docker:1.0.0 .

# cd to root path
cd ../..

# attach container install composer vendor
docker run --rm -it --mount type=bind,source="$(pwd)",target=/app pear-docker:1.0.0 /bin/bash
composer install
exit

# run your docker
docker run --mount type=bind,source="$(pwd)",target=/app -p 1234:8081 pear-docker:1.0.0
```

Right , now visit http://127.0.0.1:1234 