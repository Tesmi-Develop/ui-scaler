local React = if script.Parent.Parent.Parent.Parent:FindFirstChild("react")
    then require(script.Parent.Parent.Parent.Parent.react) :: never
    else require(script.Parent.Parent.Parent.Parent.React)

type React = typeof(require(script.Parent.Parent.Parent.Parent.React))

export type Context<T> = typeof((function()
    local React = require(script.Parent.Parent.Parent.Parent.React)
    return {} :: React.Context<T>
end)())

return React :: React