local React = require(script.Parent.Parent.modules.React)
local useBindingState = require(script.Parent.useBindingState).useBindingState
local api = require(script.Parent.Parent.utils.api)

return function(bindingScale, camera, baseResolution) 
	return function()
		local scale = useBindingState(bindingScale)
		
		return React.useMemo(function() 
			return api.GeneratePxApi(scale, baseResolution, camera) 
		end, { scale, baseResolution })
	end
end