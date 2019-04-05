if get(ARGS, 1, "") == "call-init"
    Base.__init__()
    Sys.__init__() #fix https://github.com/JuliaLang/julia/issues/30479
    @info "{Base,Sys}.__init__() are manually called"

    @info "Tweaking Libdl.DL_LOAD_PATH..."
    using Libdl
    push!(Libdl.DL_LOAD_PATH, joinpath(dirname(Sys.BINDIR), "lib"))
end
using Libdl
@show Libdl.DL_LOAD_PATH

found = []
basepath = expanduser("~/.julia/packages/SpecialFunctions")
for p in readdir(basepath)
    libpath = joinpath(basepath, p, "deps/usr/lib/libopenspecfun.so")
    if isfile(libpath)
        push!(found, libpath)
    end
end
@info "Libraries found" found
@assert length(found) == 1

libpath, = found
@info "Loading $libpath ..."
@show Libdl.dlopen(libpath)
@info "Loading $libpath ... DONE"
