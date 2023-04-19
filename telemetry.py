from mitmproxy import http
import json

class DumpCopilotTelemetry:
    def __init__(self):
        self.output_file = open('/output/copilot-telemetry.txt', 'a')

    def request(self, flow: http.HTTPFlow) -> None:
        if flow.request.host == "copilot-telemetry.githubusercontent.com":
            if not self.output_file or self.output_file.closed:
                self.output_file = open('/output/copilot-telemetry.txt', 'a')
            self.output_file.write(flow.request.content.decode())
            self.output_file.write('\n')

    def __del__(self):
        if self.output_file:
            self.output_file.close()

addons = [
    DumpCopilotTelemetry()
]
