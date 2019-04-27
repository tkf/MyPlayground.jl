using Documenter
using MyPlayground

makedocs(
    sitename = "MyPlayground",
    modules = [MyPlayground],
    strict = true,
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
