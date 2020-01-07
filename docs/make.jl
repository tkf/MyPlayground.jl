using Documenter
using MyPlayground

makedocs(
    sitename = "MyPlayground",
    modules = [MyPlayground],
    strict = true,
)

deploydocs(
    repo = "github.com/tkf/MyPlayground.jl",
    push_preview = true,
)
