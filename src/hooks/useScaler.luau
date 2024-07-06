local React = require(script.Parent.Parent.modules.React)
local useCamera = require(script.Parent.useCamera)
local useEventListener = require(script.Parent.useEventListener).useEventListener
local Math = require(script.Parent.Parent.utils.math)
local usePx = require(script.Parent.usePx)
local useUnscale = require(script.Parent.useUnscale)
local api = require(script.Parent.Parent.utils.api)

local function useScaler(baseResolution: Vector2)
    local camera = useCamera()
	local bindingScale, setScale = React.useBinding(Math.CalculateScale(camera.ViewportSize, baseResolution))
    local bindingVectorScale, setVectorScale = React.useBinding(Math.CalculateScale(camera.ViewportSize, baseResolution))

    useEventListener(camera:GetPropertyChangedSignal("ViewportSize"), function()
        setScale(Math.CalculateScale(camera.ViewportSize, baseResolution))
        setVectorScale(Math.CalculateScaleVector(camera.ViewportSize, baseResolution))
    end)

	return React.useMemo(function()
        return {
            scale = bindingScale;
            scaleVector = bindingVectorScale;

            px = api.GeneratePxApi(bindingScale, baseResolution, camera);
            unscale = api.GenerateUnscaleApi(bindingScale, baseResolution, camera);

            usePx = usePx(bindingScale, camera, baseResolution);
            useUnscale = useUnscale(bindingScale, camera, baseResolution);
        }
    end)
end

return useScaler