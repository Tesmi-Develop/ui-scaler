local React = require(script.Parent.Parent.modules.React)
local binding = require(script.Parent.Parent.utils.binding)
local useBindingListener = require(script.Parent.useBindingListener)
local useState = React.useState
local getBindingValue = binding.getBindingValue

--[[
	*
	 * Returns the value of a binding. If the binding updates, the component will
	 * be re-rendered. Non-binding values will be returned as-is.
	 * @param binding The binding to get the value of.
	 * @returns The value of the binding.
	 
]]
local function useBindingState(binding)
	local value, setValue = useState(function()
		return getBindingValue(binding)
	end)
	useBindingListener(binding, setValue)
	return value
end

return {
	useBindingState = useBindingState,
}
