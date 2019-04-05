Base.__init__()
Sys.__init__() #fix https://github.com/JuliaLang/julia/issues/30479

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
@info "Loading $libpath"
using Libdl
@show Libdl.dlopen(libpath)
