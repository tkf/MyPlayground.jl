module MyPlayground

using Pkg
using Requires

const gluepkg = Base.PkgId(Base.UUID("197e495a-9878-11e9-311c-51fb68a00c9c"),
                           "GlueModule")

function __init__()
    @require JSON="682c06a0-de6a-54ab-a142-c8b1cf79cde6" begin
        const GlueModule = let
            glueloader = joinpath(dirname(@__DIR__), "GlueModule", "loader", "Project.toml")
            origpath = copy(Base.LOAD_PATH)
            pushfirst!(Base.LOAD_PATH, glueloader)
            try
                Base.require(gluepkg)
            finally
                append!(empty!(Base.LOAD_PATH), origpath)
            end
        end
    end
end

end # module
