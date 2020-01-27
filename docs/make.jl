using Documenter
using JSON
using MyPlayground

makedocs(
    sitename = "MyPlayground",
    modules = [MyPlayground],
    strict = true,
)

function should_push_preview(event_path = get(ENV, "GITHUB_EVENT_PATH", nothing))
    event_path === nothing && return false
    event = JSON.parsefile(event_path)
    labels = event["pull_request"]["labels"]
    # https://developer.github.com/v3/activity/events/types/#pullrequestevent
    yes = "push_preview" in labels
    if yes
        @info "Trying to push preview as label `push_preview` is specified." labels
    else
        @info "Not pushing preview as label `push_preview` is not specified." labels
    end
    return yes
end

deploydocs(
    repo = "github.com/tkf/MyPlayground.jl",
    push_preview = should_push_preview(),
)
