module MyPlayground

# Use README as the docstring of the module:
@doc read(joinpath(dirname(@__DIR__), "README.md"), String) MyPlayground

stdout_isatty() = ccall(:isatty, Cint, (Cint,), Base._fd(stdout))

end # module
