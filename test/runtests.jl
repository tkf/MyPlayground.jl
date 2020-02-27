using MyPlayground
using Test

@show MyPlayground.stdout_isatty()

@show Sys.CPU_THREADS
Sys.cpu_summary()

@testset begin
    @test true
    @test true
    @test true
    @test true
    @test true
end
