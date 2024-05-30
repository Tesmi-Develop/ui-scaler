local React = require(script.Parent.Parent.modules.React)
local useCallback = React.useCallback
local useRef = React.useRef
--[[
	*
	 * Returns a memoized callback that wraps the latest version of the input
	 * callback.
	 * @param callback The callback to memoize.
	 * @returns The memoized callback.
	 
]]
local function useLatestCallback(callback)
	local callbackRef = useRef(callback)
	callbackRef.current = callback
	
	return useCallback(function(...)
		local args = { ... }
		return callbackRef.current(unpack(args))
	end, {})
end
return {
	useLatestCallback = useLatestCallback,
}
