module MyPlayground

immutable BadStruct{T}
    x::T
end

bad_identity{T}(x::T) = x

typealias BadVec{T} Array{T, 1}

function bad_underscore(x)
    _ = x
    return _
end

end # module
