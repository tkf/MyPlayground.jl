#!/bin/bash

code_print_image_file="print(unsafe_string(Base.JLOptions().image_file))"

JULIA="${JULIA:-julia}"
IMAGE="$("$JULIA" -e "$code_print_image_file")"

set -ex

${JULIA} --output-o=sys.a \
    -g1 --startup-file=no --code-coverage=none \
    --history-file=yes --inline=yes --math-mode=ieee --handle-signals=yes \
    --startup-file=no --warn-overwrite=no --compile=yes --depwarn=yes \
    --cpu-target=native --track-allocation=none --sysimage-native-code=yes \
    --sysimage="$IMAGE" \
    --compiled-modules=yes --optimize=2 \
    ./compile.jl
