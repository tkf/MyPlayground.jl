using MyPlayground
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@testset for src in [
        Int32[67, 58, 92, 80, 121, 116, 104, 111, 110, 51, 55, 0],
        Int32[1], Int32[65536], Int32[1, 2], [1, 2]]

    @testset "reinterpret dest" begin
        dest = copy(reinterpret(UInt8, src))
        fill!(dest, 0)
        dest_rint = reinterpret(eltype(src), dest)
        copyto!(dest_rint, src)
        @info "reinterpret dest" dest dest_rint src
        @test dest_rint == src
    end

    @testset "reinterpret source" begin
        dest = copy(reinterpret(UInt8, src))
        fill!(dest, 0)
        copyto!(dest, reinterpret(UInt8, src))
        dest_rint = reinterpret(eltype(src), dest)
        @info "reinterpret source" dest dest_rint src
        @test dest_rint == src
    end
end
