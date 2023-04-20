# copilot-telemetry-collector

This project is a custom image of [`mitmproxy`](https://mitmproxy.org/),
designed to capture telemetry requests from
[Github Copilot Business](https://github.com/features/copilot) and store
them in a log file.

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

Configure your IDE to use the proxy on `http://locahost:8080`:

- [Visual Studio Code](https://docs.mend.io/en-US/bundle/wsk/page/how_to_set_up_proxy_settings_for_advise_for_visual_studio_code.html)
- [Jetbrains IDEs](https://www.jetbrains.com/help/idea/settings-http-proxy.html)
- [Visual Studio](https://learn.microsoft.com/en-us/answers/questions/1059735/is-it-possible-to-set-proxy-in-vs-2022)
