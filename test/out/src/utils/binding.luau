--[[
	*
	 * Returns whether the given value is a binding.
	 * @param value The value to check.
	 * @returns Whether the value is a binding.
	 
]]
local function isBinding(value)
	local _value = value
	local _condition = type(_value) == "table"
	if _condition then
		_condition = value.getValue ~= nil and value.map ~= nil
	end
	return _condition
end

--[[
	*
	 * Returns the value of a binding. If the given value is not a binding, it will
	 * be returned as-is.
	 * @param binding The binding to get the value of.
	 * @returns The value of the binding.
	 
]]
local function getBindingValue(binding)
	if isBinding(binding) then
		return binding:getValue()
	else
		return binding
	end
end


--[[
	*
	 * Gets the internal API of a binding. This is a hacky way to get access to the
	 * `BindingInternalApi` object of a binding, which is not exposed by React.
	 * @param binding The binding to get the internal API of.
	 * @returns The binding's API.
	 
]]
local function getBindingApi(binding)
	for key, value in pairs(binding) do
		local name = tostring(key)
		if name == "Symbol(BindingImpl)" or string.sub(name, 1, 12) == "RoactBinding" then
			return value
		end
	end
end

return {
	isBinding = isBinding,
	getBindingValue = getBindingValue,
	getBindingApi = getBindingApi,
}
