@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
    const fetch = wait
else
    using Test
end

"""
    read_stdout(cmd, input)

Julia implementation of "echo {input} | {cmd}".
"""
function read_stdout(cmd, input)
    stdout, stdin, process = readandwrite(cmd)
    reader = @async read(stdout)
    write(stdin, input)
    close(stdin)
    return fetch(reader)
end

let input = "some input"
    desired = Vector{UInt8}(input)
    for _ in 1:100
        actual = read_stdout(`cat`, input)
        @test actual == desired
    end
end
