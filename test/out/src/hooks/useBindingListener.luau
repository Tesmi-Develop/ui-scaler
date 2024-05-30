local React = require(script.Parent.Parent.modules.React)
local binding = require(script.Parent.Parent.utils.binding)
local useLatestCallback = require(script.Parent.useLatestCallback)
local useEffect = React.useEffect
local useMemo = React.useMemo
local getBindingApi = binding.getBindingApi
local isBinding = binding.isBinding
--[[
	*
	 * Subscribes to a binding and calls the given listener when the binding
	 * updates. If the value passed is not a binding, the listener will be called
	 * with the value.
	 *
	 * The `listener` function is safe to not be memoized, as it will only be
	 * called when the binding updates.
	 *
	 * @param binding The binding to subscribe to.
	 * @param listener The function to call when the binding updates.
	 
]]
local function useBindingListener(binding, listener)
	local api = useMemo(function()
		return if isBinding(binding) then getBindingApi(binding) else nil
	end, { binding })
	local listenerCallback = useLatestCallback(listener)
	useEffect(function()
		if api then
			listenerCallback(api.getValue())
			return api.subscribe(listenerCallback)
		else
			listenerCallback(binding)
		end
	end, { binding })
end

return {
	useBindingListener = useBindingListener,
}
