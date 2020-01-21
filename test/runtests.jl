using MyPlayground
using Test

@show Sys.CPU_THREADS
Sys.cpu_summary()

@testset begin
    @test true
    @test true
    @test true
    @test true
    @test false
end
