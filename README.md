Varnish
-------
A very simple Docker image for running Varnish with quite limited configuration
options. Please note that it is *experimental* and shouldn't be used in production.

## Build & Run

```
$ docker build -t varnish .
$ docker run \
	-d \
	-p 80:80 \
	-e VARNISH_PORT=80 \
	-e VARNISH_BACKEND_HOST=127.0.0.1 \
	-e VARNISH_BACKEND_PORT=8080 \
	--name my-varnish \
	varnish:latest
```

## Acknowledgements
This image is based on [newsdev/docker-varnish](https://github.com/newsdev/docker-varnish).
Its original license is reproduced below:

```
Copyright (c) 2015 The New York Times Company

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this library except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

### Changes from `newsdev/docker-varnish`

  - The default build version is `4.1.2` instead of `4.1.0`.
  - The storage backend is completely configurable by setting
    VARNISH_STORAGE_BACKEND, but defaults to `malloc,100m` as it did before.
  - A `default.vcl` is automatically generated based on the `VARNISH_BACKEND_*`
    environment variables, so that users do not have to derive a custom image
    to use it.
