### mod_mruby

- docker
- boot2docker

```sh

docker build -t mod_mruby:base base/

docker build -t mod_mruby:build build/

docker run -p 8080:80 -d mod_mruby:build

open http://localhost:8080/
```

- basic auth = http://localhost:8080/basic/
- mod_rewrite = http://localhost:8080/base/
- cache control = http://localhost:8080/cache_control/
