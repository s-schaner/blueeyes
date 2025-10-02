#!/usr/bin/env bash
# Entrypoint for launching the FastVLM demo inside the blueeyes container.
#
# The image demo asset used by the notebook/UI is no longer vendored in this
# repository. Instead, we rely on the copy that ships with the upstream
# apple/ml-fastvlm repository under `assets/demo.jpg`.
set -euo pipefail

FASTVLM_ROOT=${FASTVLM_ROOT:-/opt/apple/ml-fastvlm}
UPSTREAM_DEMO_RELATIVE="assets/demo.jpg"
UPSTREAM_DEMO_ASSET="${FASTVLM_ROOT}/${UPSTREAM_DEMO_RELATIVE}"

if [[ ! -f "${UPSTREAM_DEMO_ASSET}" ]]; then
  cat <<EOM >&2
[blueeyes] Unable to find the upstream demo asset at:
  ${UPSTREAM_DEMO_ASSET}
Please make sure the apple/ml-fastvlm repository is available in the
container (or mount it) so that the demo image can be served.
EOM
  exit 1
fi

export BLUEEYES_DEMO_ASSET="${UPSTREAM_DEMO_ASSET}"

if [[ $# -eq 0 ]]; then
  exec bash
else
  exec "$@"
fi
