module MyPlayground

export my_public_function

"""
    my_public_function()

This function is exported.
"""
my_public_function() = nothing

"""
    my_private_function()

This function is _not_ exported.
"""
my_private_function() = nothing

end # module
