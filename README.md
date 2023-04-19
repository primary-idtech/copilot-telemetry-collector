# copilot-telemetry-collector

This project is a custom image of [`mitmproxy`](https://mitmproxy.org/),
designed to capture telemetry requests from
[Github Copilot Business](https://github.com/features/copilot) and store
them in a log file.

It allows users to monitor and analyze the telemetry data generated
by Copilot Business, which can be useful for debugging and optimization.

## Usage

To use the Copilot Telemetry Collector, follow these steps:

Install Docker on your machine, if it is not already installed.

Pull the Copilot Telemetry Collector image from Docker Hub by running
the following command (replace `copilot-telemetry-collector` with the
full name of the image):

```
docker pull ghcr.io/primary-idtech/copilot-telemetry-collector:main
```

Run the container with the following command:

```
docker run -it --rm -p 8080:8080 -v "$PWD/log:/output" ghcr.io/primary-idtech/copilot-telemetry-collector:main
```

This will start the container and map port 8080 of the container to 
port 8080 of your local machine. Generated log will be stored in the
`./log` directory.

Configure your IDE to use the proxy by setting the `http_proxy` and 
`https_proxy` environment variables to http://localhost:8080.

For example, to configure Visual Studio Code, run the following command:

```
http_proxy=http://localhost:8080 https_proxy=$http_proxy code .
```

This will launch Visual Studio Code with the proxy settings configured.
