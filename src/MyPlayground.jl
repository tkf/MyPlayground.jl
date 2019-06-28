module MyPlayground

using Pkg
using Requires

const gluepkg = Base.PkgId(Base.UUID("197e495a-9878-11e9-311c-51fb68a00c9c"),
                           "GlueModule")

function __init__()
    pushfirst!(Base.LOAD_PATH, dirname(@__DIR__))
    @require JSON="682c06a0-de6a-54ab-a142-c8b1cf79cde6" begin
        const GlueModule = Base.require(gluepkg)
    end
end

end # module
