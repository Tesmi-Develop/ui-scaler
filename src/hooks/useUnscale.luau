local useBindingState = require(script.Parent.useBindingState).useBindingState

return function(bindingScale) 
	return function()
		local scale = useBindingState(bindingScale)
		return function(value: number)
			return math.round(value / scale)
		end
	end
end