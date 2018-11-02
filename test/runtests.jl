using MyPlayground
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@testset for src in [Int32[1], Int32[65536], Int32[1, 2], [1, 2]]
    dest = copy(reinterpret(UInt8, src))
    fill!(dest, 0)
    dest_rint = reinterpret(eltype(src), dest)
    copyto!(dest_rint, src)
    @show dest
    @show dest_rint
    @test dest_rint == src
end
