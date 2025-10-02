# blueeyes

FastVLM container for image and video inferencing.

## Demo asset

The container no longer vendors the demo image at `assets/demo.jpg`. Instead,
the startup script expects the upstream `apple/ml-fastvlm` repository to be
available (for example at `/opt/apple/ml-fastvlm`) and reuses the demo asset
shipped there at `assets/demo.jpg`. The resolved path is exposed to downstream
processes via the `BLUEEYES_DEMO_ASSET` environment variable.

Use `scripts/start.sh` to bootstrap the container environment; the script will
validate the upstream asset path before running the requested command.
