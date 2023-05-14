# copilot-telemetry-collector

This project is a custom image of [`mitmproxy`](https://mitmproxy.org/),
designed to capture telemetry requests from
[Github Copilot Business](https://github.com/features/copilot) and store
them in a log file.

It requires VSCode with the Github Copilot extension installed on it.

## Usage

To use the Copilot Telemetry Collector, follow these steps:

Install Docker on your machine, if it is not already installed.

Pull the Copilot Telemetry Collector image from Docker Hub by running
the following command (replace `copilot-telemetry-collector` with the
full name of the image):

```
docker pull ghcr.io/primary-idtech/copilot-telemetry-collector:main
```

Create a working directory for this project, and then create a subfolder
named `log` whitin it:

```
mkdir -p ~/github-copilot-collector/log
cd ~/github-copilot-collector
```

Run the container with the following command:

```
docker run -it --rm -p 8080:8080 -v "$PWD/log:/output" ghcr.io/primary-idtech/copilot-telemetry-collector:main
```

This will start the container and map port 8080 of the container to 
port 8080 of your local machine. Generated log will be stored in the
`./log` directory.

Configure VSCode to use the proxy on `http://locahost:8080` following
[this doc](https://docs.mend.io/en-US/bundle/wsk/page/how_to_set_up_proxy_settings_for_advise_for_visual_studio_code.html).