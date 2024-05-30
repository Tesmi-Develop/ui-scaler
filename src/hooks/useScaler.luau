local React = require(script.Parent.Parent.Parent.React)
local useBindingState = require(script.Parent.useBindingState)
local useCamera = require(script.Parent.useCamera)
local useEventListener = require(script.Parent.useEventListener)

function GetDominantAxis(viewport: Vector2, baseAspectRatio: number)
    local aspectRatio = viewport.Y / viewport.X
    
    if baseAspectRatio > aspectRatio then
        return 1
    end
    
    return aspectRatio > baseAspectRatio and 0 or 0.5
end

function CalculateScale(viewport: Vector2, baseResolution: Vector2)
    local width = math.log(viewport.X / baseResolution.X, 2)
    local height = math.log(viewport.Y / baseResolution.Y, 2)
    local dominantAxis = GetDominantAxis(viewport, baseResolution.Y / baseResolution.X)
    local centered = width + (height - width) * dominantAxis

    return 2 ^ centered
end

local function useScaler(baseResolution: Vector2)
    local camera = useCamera()
	local bindingScale, setScale = React.useBinding(CalculateScale(camera.ViewportSize, baseResolution))

    useEventListener(camera:GetPropertyChangedSignal("ViewportSize"), function()
        setScale(CalculateScale(camera.ViewportSize, baseResolution))
    end)

	return React.useMemo(function()
        return {
            scale = bindingScale;
            usePx = function()
                local scale = useBindingState(bindingScale)

                return React.useMemo(function()
                    local api = {

                    }

                    setmetatable(api, {
                        __call = function(_, value)
                            return math.round(value * scale)
                        end
                    })

                    return api
                end)
            end;
        }
    end)
end

return useScaler