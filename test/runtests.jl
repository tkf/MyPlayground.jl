using MyPlayground
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@info "display(ENV)" ans=display(ENV)

@testset "ENV canse-(in)sensitivity" begin
    ENV["SomeKey"] = "value"
    @test ENV["somekey"] == "value"
    @test ENV["SomeKey"] == "value"

    @testset "merge!(ENV, case-sensitive Dict)" begin
        @test_throws Exception merge!(ENV, Dict(
            "key" => "1",
            "KEY" => "2",
        ))
        try
            @show ENV["key"]
        catch exception
            @info "ENV[\"key\"] yields:" exception
        end
    end

    @show setdiff(keys(ENV), Set(map(uppercase, collect(keys(ENV)))))

    script = """
    import os
    import pprint
    pprint.pprint(os.environ)
    """
    cmd = `python -c $script`
    env = copy(ENV)
    env["key"] = "1"
    env["KEY"] = "2"
    env["kEy"] = "3"
    @test_throws Exception cmd = setenv(cmd, env)
    @info "Environment variables:"
    run(cmd)
end
