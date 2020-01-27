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
    return "push_preview" in labels
end

deploydocs(
    repo = "github.com/tkf/MyPlayground.jl",
    push_preview = should_push_preview(),
)
