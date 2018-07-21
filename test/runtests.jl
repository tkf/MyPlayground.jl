@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

function read_stdout(cmd, input)
    stdout, stdin, process = readandwrite(cmd)
    reader = @async read(stdout)
    write(stdin, input)
    close(stdin)
    return fetch(reader)
end

for _ in 1:100
    @test begin
        read_stdout(`true`, "some input")
        true
    end
end
