using Documenter
using MyPlayground

makedocs(
    sitename = "MyPlayground",
    format = :html,
    modules = [MyPlayground]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
