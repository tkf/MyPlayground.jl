#!/bin/bash
# -*- mode: julia -*-
#=
JULIA="${JULIA:-julia}"
JULIA_CMD="${JULIA_CMD:-$JULIA --color=yes --startup-file=no --compile=min}"
exec $JULIA_CMD "${BASH_SOURCE[0]}" "$@"
=#

generate_mergify(path::AbstractString) = open(generate_mergify, path, write = true)
function generate_mergify(io::IO)
    header = """
    # [NOTE] This setting relies on "required status check":
    # https://docs.github.com/en/github/administering-a-repository/about-required-status-checks

    pull_request_rules:
      - name: remove outdated reviews
        conditions:
          - base=master
        actions:
          dismiss_reviews: {}
    """
    print(io, header)

    for (method_type, method_name) in [
            # https://doc.mergify.io/actions.html#merge
            ("squash", "squash-merge"),
            ("rebase", "rebase-merge"),
            ("merge", "merge"),
        ],
        (condition, name_suffix) in [
            # https://doc.mergify.io/conditions.html
            ("\"#approved-reviews-by>=1\"", ""),
            ("author=tkf", " (@tkf)"),
        ]

        rule = """
        - name: automatic $(method_name) when CI passes$(name_suffix)
          conditions:
            - base=master
            - $(condition)
            - label=ready-to-merge:$(method_type)
            - label!=work-in-progress
          actions:
            merge:
              method: $(method_type)
        """

        for ln in eachline(IOBuffer(rule))
            println(io, "  ", ln)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    generate_mergify(joinpath(@__DIR__, ".mergify.yml"))
end

generate_mergify
