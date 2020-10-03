const CI = lowercase(get(ENV, "CI", "false")) == "true"

function lx_testcode(com, _)
    code = Franklin.content(com.braces[1])
    if !CI
        return """
        @@test_code
        @@title 🔬 Test Code@@
        ```julia
        $code
        ```
        @@
        """
    end
    return ""
end

function lx_testcheck(com, _)
    testname = Franklin.content(com.braces[1])
    respath = joinpath(@__DIR__, "__site", "-test-", "output", testname * ".res")
    outpath = joinpath(@__DIR__, "__site", "-test-", "output", testname * ".out")
    result = read(respath, String)
    ok = result == "OK"
    if !ok
        @error(
            "Test `$testname` failed!",
            result = Text(result),
            output = Text(read(outpath, String))
        )
        CI && exit(99)
        # Ref: Exit Codes With Special Meanings
        # https://tldp.org/LDP/abs/html/exitcodes.html
    end
    if ok
        return """
        @@test_ok
        @@title  ☑ Pass@@
        \\output{/-test-/$testname}
        @@
        """
    else
        return """
        @@test_failure
        @@title  ⚠ Failure@@
        \\show{/-test-/$testname}
        @@
        """
    end
end

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end
