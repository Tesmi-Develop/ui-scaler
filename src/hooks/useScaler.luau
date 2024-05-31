local React = require(script.Parent.Parent.modules.React)
local useCamera = require(script.Parent.useCamera)
local useEventListener = require(script.Parent.useEventListener).useEventListener
local Math = require(script.Parent.Parent.utils.math)
local usePx = require(script.Parent.usePx)

local function useScaler(baseResolution: Vector2)
    local camera = useCamera()
	local bindingScale, setScale = React.useBinding(React.useMemo(function() 
        return Math.CalculateScale(camera.ViewportSize, baseResolution) 
    end, {}))

    useEventListener(camera:GetPropertyChangedSignal("ViewportSize"), function()
        setScale(Math.CalculateScale(camera.ViewportSize, baseResolution))
    end)

	return React.useMemo(function()
        return {
            scale = bindingScale;
            usePx = usePx(bindingScale, camera, baseResolution)
        }
    end)
end

return useScaler