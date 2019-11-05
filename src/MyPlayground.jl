module MyPlayground

using DataAPI: DataAPI, describe

struct MyType end

"""
    DataAPI.describe(::MyType)

(... adding some documentation ...)
"""
DataAPI.describe(::MyType) = nothing

end # module
