@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

for _ in 1:100
    @test begin
        run(`echo hello`)
        true
    end
end
