using Pkg
empty!(Base.LOAD_PATH)
append!(Base.LOAD_PATH, ["@", "@stdlib"])
Pkg.activate(@__DIR__)
using BinaryProvider
