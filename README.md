[![Build Status](https://travis-ci.org/tiangolo/uvicorn-gunicorn-machine-learning-docker.svg?branch=master)](https://travis-ci.org/tiangolo/uvicorn-gunicorn-machine-learning-docker)

## Supported tags and respective `Dockerfile` links

* [`python3.7`, `latest` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/python3.7/Dockerfile)
* [`python3.6` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/python3.6/Dockerfile)
* [`python3.6-tensorflow` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/python3.6-tensorflow/Dockerfile)
* [`cuda9.1-python3.7` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/cuda9.1-python3.7/Dockerfile)
* [`cuda9.1-python3.6` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/cuda9.1-python3.6/Dockerfile)
* [`cuda9.1-devel-python3.6` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/cuda9.1-devel-python3.6/Dockerfile)
* [`cuda9.1-cudnn7-devel-python3.6` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/cuda9.1-cudnn7-devel-python3.6/Dockerfile)
* [`cuda9.1-python3.6-tensorflow` _(Dockerfile)_](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/blob/master/cuda9.1-python3.6-tensorflow/Dockerfile)

## Deprecation Warning 🚨

I'm currently not using this Docker image, so I won't be able to keep it updated or add changes any time soon.

You might still find some internal pieces of code useful for your own use cases and your own Docker images.

# uvicorn-gunicorn-machine-learning

[**Docker**](https://www.docker.com/) image with [**Uvicorn**](https://www.uvicorn.org/) managed by [**Gunicorn**](https://gunicorn.org/) for high-performance web applications in **[Python](https://www.python.org/) 3.7** and **3.6** with performance auto-tuning.

Uses [**Conda**](https://conda.io/en/latest/) (installed with [Miniconda](https://docs.conda.io/en/latest/miniconda.html)).

Includes optional variants with [**Nvidia CUDA**](https://www.geforce.com/hardware/technology/cuda).

And optional variants with [**TensorFlow**](https://www.tensorflow.org/).

**GitHub repo**: [https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker)

**Docker Hub image**: [https://hub.docker.com/r/tiangolo/uvicorn-gunicorn-machine-learning/](https://hub.docker.com/r/tiangolo/uvicorn-gunicorn-machine-learning/)

## Description

Python web applications running with **Uvicorn** (using the "ASGI" specification for Python asynchronous web applications) have shown to have [some of the best performances, as measured by third-party benchmarks](https://www.techempower.com/benchmarks/#section=test&runid=7464e520-0dc2-473d-bd34-dbdfd7e85911&hw=ph&test=query&l=zijzen-7).

The achievable performance is on par with (and in many cases superior to) **Go** and **Node.js** frameworks.

This image has an "auto-tuning" mechanism included, so that you can just add your code and get that same **high performance** automatically. And without making sacrifices.

This Docker image is made to serve web applications and APIs for Machine Learning, Data Science, Deep Learning, etc.

It does not try to include every possible package. On the contrary, it tries to be as slim as possible, but having the minimal common requirements (the difficult parts) for most projects.

By being slim, apart from reducing the size, it can be kept current more easily, and it can be tailored for each project, being equally useful for development and production.

## Technical Details

### Uvicorn

**Uvicorn** is a lightning-fast "ASGI" server.

It runs asynchronous Python web code in a single process.

### Gunicorn

You can use **Gunicorn** to manage Uvicorn and run multiple of these concurrent processes.

That way, you get the best of concurrency and parallelism.

### Conda

It includes [**Conda**](https://conda.io/en/latest/) (Miniconda, the package manager from Anaconda).

Conda is, more or less, the "de-facto" standard package manager for Machine Learning Python projects (Data Science, Deep Learning, etc).

With it, you can install most of the packages used in Machine Learning with a simple command.

For example, to install Pandas, you can run:

```bash
conda install pandas
```

In a `Dockerfile` you would add that with:

```Dockerfile
RUN conda install -y pandas
```

`conda` is especially useful for Machine Learning and Data Science (compared to other package managers like `pip`, `pipenv`) because in many cases it installs optimized versions, compiled with **Intel MKL** (which is not available via `pip`).

For example, TensorFlow is compiled with [**Intel MKL-DNN**](https://www.anaconda.com/tensorflow-in-anaconda/), which gives up to 8x the performance achievable with `pip`.

### Nvidia CUDA

[**Nvidia CUDA**](https://www.geforce.com/hardware/technology/cuda) is needed to be able to use the GPU, mainly for Deep Learning. There are optional image versions (tags) including CUDA.

For these versions to work, you need to have an Nvidia GPU and have [**nvidia-docker**](https://github.com/NVIDIA/nvidia-docker) installed.

**nvidia-docker** is in many cases easier to install and use than installing the full set of dependencies (CUDA, CuDNN, etc) in your local machine.

This is especially true when you have more than one project, with different dependencies/versions.

### TensorFlow

[**TensorFlow**](https://www.tensorflow.org/) is Google's very popular Deep Learning framework.

There are versions (tags) of this image with **TensorFlow** already installed with `conda` (with its performance gains). Contrary to the official TensorFlow Docker images, that are installed with `pip`.

There are also versions with TensorFlow and CUDA. So, you can run TensorFlow (built with the `conda` optimizations) on your GPU, from Docker.

### `tiangolo/uvicorn-gunicorn-machine-learning`

This image will set a sensible configuration based on the server it is running on (the amount of CPU cores available) without making sacrifices.

It has sensible defaults, but you can configure it with environment variables or override the configuration files.

<!--

### Frameworks

This image was created to be the base image for:

* [**tiangolo/uvicorn-gunicorn-fastapi-machine-learning**](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-machine-learning-docker)

But could be used as the base image to run any Python web application that uses the ASGI specification for Machine Learning.

If you are creating a new [**FastAPI**](https://fastapi.tiangolo.com/) web application you should use [**tiangolo/uvicorn-gunicorn-fastapi**](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker) instead.

**Note**: FastAPI is based on Starlette and adds several features on top of it. Useful for APIs and other cases: data validation, data conversion, documentation with OpenAPI, dependency injection, security/authentication and others.

**Note**: Unless you are doing something more technically advanced, you probably should be using [**Starlette**](https://www.starlette.io/) with [**tiangolo/uvicorn-gunicorn-starlette**](https://github.com/tiangolo/uvicorn-gunicorn-starlette-docker) or [**FastAPI**](https://fastapi.tiangolo.com/) with [**tiangolo/uvicorn-gunicorn-fastapi**](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker).

-->

## How to use

* You don't need to clone the GitHub repo. You can use this image as a base image for other images, using this in your `Dockerfile`:

```Dockerfile
FROM tiangolo/uvicorn-gunicorn-machine-learning:python3.7

COPY ./app /app
```

It will expect a file at `/app/app/main.py`.

Or otherwise a file at `/app/main.py`.

And will expect it to contain a variable `app` with your "ASGI" application.

Then you can build your image from the directory that has your `Dockerfile`, e.g:

```bash
docker build -t myimage ./
```

* Run a container based on your image:

```bash
docker run -d --name mycontainer -p 80:80 myimage
```

You should be able to check it in your Docker container's URL, for example: http://192.168.99.100/ or http://127.0.0.1/ (or equivalent, using your Docker host).

## Advanced usage

### Environment variables

These are the environment variables that you can set in the container to configure it and their default values:

#### `MODULE_NAME`

The Python "module" (file) to be imported by Gunicorn, this module would contain the actual application in a variable.

By default:

* `app.main` if there's a file `/app/app/main.py` or
* `main` if there's a file `/app/main.py`

For example, if your main file was at `/app/custom_app/custom_main.py`, you could set it like:

```bash
docker run -d -p 80:80 -e MODULE_NAME="custom_app.custom_main" myimage
```

#### `VARIABLE_NAME`

The variable inside of the Python module that contains the ASGI application.

By default:

* `app`

For example, if your main Python file has something like:

```Python
from fastapi import FastAPI

api = FastAPI()

@api.get("/")
def read_root():
    return {"message": "Hello world!"}
```

In this case `api` would be the variable with the "ASGI application". You could set it like:

```bash
docker run -d -p 80:80 -e VARIABLE_NAME="api" myimage
```

#### `APP_MODULE`

The string with the Python module and the variable name passed to Gunicorn.

By default, set based on the variables `MODULE_NAME` and `VARIABLE_NAME`:

* `app.main:app` or
* `main:app`

You can set it like:

```bash
docker run -d -p 80:80 -e APP_MODULE="custom_app.custom_main:api" myimage
```

#### `GUNICORN_CONF`

The path to a Gunicorn Python configuration file.

By default:

* `/app/gunicorn_conf.py` if it exists
* `/app/app/gunicorn_conf.py` if it exists
* `/gunicorn_conf.py` (the included default)

You can set it like:

```bash
docker run -d -p 80:80 -e GUNICORN_CONF="/app/custom_gunicorn_conf.py" myimage
```

#### `WORKERS_PER_CORE`

This image will check how many CPU cores are available in the current server running your container.

It will set the number of workers to the number of CPU cores multiplied by this value.

By default:

* `1`

You can set it like:

```bash
docker run -d -p 80:80 -e WORKERS_PER_CORE="3" myimage
```

If you used the value `3` in a server with 2 CPU cores, it would run 6 worker processes.

You can use floating point values too.

So, for example, if you have a big server (let's say, with 8 CPU cores) running several applications, and you have an ASGI application that you know won't need high performance. And you don't want to waste server resources. You could make it use `0.5` workers per CPU core. For example:

```bash
docker run -d -p 80:80 -e WORKERS_PER_CORE="0.5" myimage
```

In a server with 8 CPU cores, this would make it start only 4 worker processes.

**Note**: By default, if `WORKERS_PER_CORE` is `1` and the server has only 1 CPU core, instead of starting 1 single worker, it will start 2. This is to avoid bad performance and blocking applications (server application) on small machines (server machine/cloud/etc). This can be overridden using `WEB_CONCURRENCY`.

#### `WEB_CONCURRENCY`

Override the automatic definition of number of workers.

By default:

* Set to the number of CPU cores in the current server multiplied by the environment variable `WORKERS_PER_CORE`. So, in a server with 2 cores, by default it will be set to `2`.

You can set it like:

```bash
docker run -d -p 80:80 -e WEB_CONCURRENCY="2" myimage
```

This would make the image start 2 worker processes, independent of how many CPU cores are available in the server.

#### `HOST`

The "host" used by Gunicorn, the IP where Gunicorn will listen for requests.

It is the host inside of the container.

So, for example, if you set this variable to `127.0.0.1`, it will only be available inside the container, not in the host running it.

It's is provided for completeness, but you probably shouldn't change it.

By default:

* `0.0.0.0`

#### `PORT`

The port the container should listen on.

If you are running your container in a restrictive environment that forces you to use some specific port (like `8080`) you can set it with this variable.

By default:

* `80`

You can set it like:

```bash
docker run -d -p 80:8080 -e PORT="8080" myimage
```

#### `BIND`

The actual host and port passed to Gunicorn.

By default, set based on the variables `HOST` and `PORT`.

So, if you didn't change anything, it will be set by default to:

* `0.0.0.0:80`

You can set it like:

```bash
docker run -d -p 80:8080 -e BIND="0.0.0.0:8080" myimage
```

#### `LOG_LEVEL`

The log level for Gunicorn.

One of:

* `debug`
* `info`
* `warning`
* `error`
* `critical`

By default, set to `info`.

If you need to squeeze more performance sacrificing logging, set it to `warning`, for example:

You can set it like:

```bash
docker run -d -p 80:8080 -e LOG_LEVEL="warning" myimage
```

### Custom Gunicorn configuration file

The image includes a default Gunicorn Python config file at `/gunicorn_conf.py`.

It uses the environment variables declared above to set all the configurations.

You can override it by including a file in:

* `/app/gunicorn_conf.py`
* `/app/app/gunicorn_conf.py`
* `/gunicorn_conf.py`

### Custom `/app/prestart.sh`

If you need to run anything before starting the app, you can add a file `prestart.sh` to the directory `/app`. The image will automatically detect and run it before starting everything. 

For example, if you want to add Alembic SQL migrations (with SQLALchemy), you could create a `./app/prestart.sh` file in your code directory (that will be copied by your `Dockerfile`) with:

```bash
#! /usr/bin/env bash

# Let the DB start
sleep 10;
# Run migrations
alembic upgrade head
```

and it would wait 10 seconds to give the database some time to start and then run that `alembic` command.

If you need to run a Python script before starting the app, you could make the `/app/prestart.sh` file run your Python script, with something like:

```bash
#! /usr/bin/env bash

# Run custom Python script before starting
python /app/my_custom_prestart_script.py
```

### Development live reload

The default program that is run is at `/start.sh`. It does everything described above.

There's also a version for development with live auto-reload at:

```bash
/start-reload.sh
```

#### Details

For development, it's useful to be able to mount the contents of the application code inside of the container as a Docker "host volume", to be able to change the code and test it live, without having to build the image every time.

In that case, it's also useful to run the server with live auto-reload, so that it re-starts automatically at every code change.

The additional script `/start-reload.sh` runs Uvicorn alone (without Gunicorn) and in a single process.

It is ideal for development.

#### Usage

For example, instead of running:

```bash
docker run -d -p 80:80 myimage
```

You could run:

```bash
docker run -d -p 80:80 -v $(pwd):/app myimage /start-reload.sh
```

* `-v $(pwd):/app`: means that the directory `$(pwd)` should be mounted as a volume inside of the container at `/app`.
    * `$(pwd)`: runs `pwd` ("print working directory") and puts it as part of the string.
* `/start-reload.sh`: adding something (like `/start-reload.sh`) at the end of the command, replaces the default "command" with this one. In this case, it replaces the default (`/start.sh`) with the development alternative `/start-reload.sh`.

#### Technical Details

As `/start-reload.sh` doesn't run with Gunicorn, any of the configurations you put in a `gunicorn_conf.py` file won't apply.

But these environment variables will work the same as described above:

* `MODULE_NAME`
* `VARIABLE_NAME`
* `APP_MODULE`
* `HOST`
* `PORT`
* `LOG_LEVEL`

## CUDA Technical details

First, to be able to run the CUDA versions with Docker you need to be on Linux, have Docker and an Nvidia GPU.

Then, there are compatibility requirements between versions.

### CUDA, GPU Driver, Nvidia Model

**CUDA** has to be a version that is compatible with the **Nvidia GPU driver**, which is compatible with a **GPU architecture** (a series of specific GPU models). The CUDA versions require Nvidia GPU driver versions "superior to" some driver number (they are backward compatible).

You can see the [compatibility table](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) at the **nvidia-docker** site.

### GPU Driver availability in Linux

As of 2019-03-06, the latest Nvidia driver for Linux is `418`, you can check in the [Nvidia Unix Drivers page](https://www.nvidia.com/object/unix.html).

But the latest driver officially available for Ubuntu is `390`, check in the [Ubuntu Nvidia drivers page](https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia).

#### GPU Beta Drivers

There is a more technical option to install beta drivers.

You can [add the PPA (Personal Package Archive) for the user `~graphics-drivers`](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa) and then you can install (as of 2019-03-06) up to version `410`.

### TensorFlow

**TensorFlow** versions are compatible with specific versions of **CUDA**.

There doesn't seem to be a single page specifying which versions of TensorFlow are compatible with which versions of CUDA, apart from the [GitHub releases page](https://github.com/tensorflow/tensorflow/releases).

The latest requirements (including CUDA version) (for the latest version of TensorFlow) can be found at the [GPU support section](https://www.tensorflow.org/install/gpu) in the official docs.

### Conda

**Conda** has TensorFlow pre-compiled (with the optimizations) in specific versions, compiled with specific versions of **CUDA**.

You can install TensorFlow with a specific CUDA version with, e.g.:

```bash
conda install tensorflow-gpu cudatoolkit=9.0
```

that will install TensorFlow compiled with GPU support (with CUDA) using a CUDA version of 9.0.

To see the available `cudatoolkit` versions in `conda`, you can run:

```bash
conda search cudatoolkit
```

### Current state

As of 2019-03-06, as the latest Nvidia driver officially [available for Ubuntu is `390`](https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia), this limits the [compatible version of CUDA to max `9.1`](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) (unless using the beta drivers).

That's why the current CUDA flavor is version `9.1`. Even though there are superior base image versions, but those wouldn't run on an Ubuntu machine unless using the beta drivers (or drivers installed by hand, directly from the Nvidia site).

Then, Conda has `cudatoolkit` available in several versions, the latest are `9.0`, `9.2` and `10.0`. But as the base image is `9.1`, the latest version that is still compatible is `9.0`. That's the version used in the image tag with TensorFlow and CUDA. But as they are backward compatible, it works.

### Decide your versions

**Note**: this will apply when this image has more CUDA versions (tags). As of now, it only describes the process to decide versions and build this image.

First, check what is the architecture of your GPU, then what is the most recent driver you can install (deciding if you want to have beta drivers).

This applies for local development or cloud (if you use a cloud server with GPU).

Then, see what is the latest CUDA version you can have with that driver.

Then you can get the latest tag (version) of this image that is less than or equal to your driver.

Next, find which versions of `cudatoolkit` (CUDA) are available in `conda`. Choose the latest one that is less than or equal to the image you chose.

Then you can install TensorFlow with that `cudatoolkit`.

## Tests

All the image tags are tested.

CUDA (GPU usage) is tested locally (as CI systems don't provide GPUs easily).

To run the tests, you need to have the [`Docker SDK for Python`](https://docker-py.readthedocs.io/en/stable/index.html) installed.

If you are using Pipenv locally, you can install the development dependencies with:

```bash
pipenv shell
pipenv install --dev
```

Then you can run the tests locally:

```bash
bash scripts/test.sh
```

You can also run the CUDA (GPU) tests:

```bash
bash scripts/test-cuda.sh
```

## Release Notes

### Next Release

* Upgrade Travis. PR [#2](https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/pull/2).

* Add CUDA and cuDNN image tags for projects that require building with CUDA toolkit (like [dlib](http://dlib.net/)). PR <a href="https://github.com/tiangolo/uvicorn-gunicorn-machine-learning-docker/pull/1" target="_blank">#1</a>.

### 0.1.0

* First release.

## License

This project is licensed under the terms of the MIT license.
