local useBindingState = require(script.Parent.useBindingState).useBindingState
local React = require(script.Parent.Parent.modules.React)
local api = require(script.Parent.Parent.utils.api)

return function(bindingScale, camera, baseResolution) 
	return function()
		local scale = useBindingState(bindingScale)

		return React.useMemo(function() 
			return api.GenerateUnscaleApi(scale, baseResolution, camera) 
		end, { scale, baseResolution })
	end
end