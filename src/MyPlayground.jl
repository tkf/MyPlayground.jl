module MyPlayground

struct BadStruct{T}
    x::T
end

bad_identity(x::T) where {T} = x

BadVec{T} = Array{T, 1}

function bad_underscore(x)
    _ = x
    return _
end

end # module
