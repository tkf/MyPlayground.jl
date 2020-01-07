using Documenter
using MyPlayground

makedocs(sitename = "MyPlayground", modules = [MyPlayground])

deploydocs(repo = "github.com/tkf/MyPlayground.jl", push_preview = true)
