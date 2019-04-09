#!/bin/bash
# -*- mode: julia -*-
#=
exec "${JULIA:-julia}" "$@" ${BASH_SOURCE[0]}
=#

using PackageCompiler
systmp, _curr_syso = compile_incremental(
    joinpath(@__DIR__, "Project.toml"),
    joinpath(@__DIR__, "precompile.jl"),
)

sysout = joinpath(@__DIR__, basename(systmp))
cp(systmp, sysout, force=true)

@info "System image: $sysout"
