using MyPlayground
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@test_approx_eq 1 1
