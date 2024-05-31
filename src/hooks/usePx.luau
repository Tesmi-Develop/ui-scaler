local React = require(script.Parent.Parent.modules.React)
local Math = require(script.Parent.Parent.utils.math)
local useBindingState = require(script.Parent.useBindingState).useBindingState

return function(bindingScale, camera, baseResolution) 
	return function()
		local scale = useBindingState(bindingScale)
		
		return React.useMemo(function()
			local api = {
				position = function(x: number, y: number)
					local vector = Math.CalculatePosition(Vector2.new(x, y), camera.ViewportSize, baseResolution)
					return UDim2.fromOffset(vector.X, vector.Y)
				end;
				unscale = function(value: number)
					return math.round(value / scale)
				end;
				udim2 = function(x: number, y: number)
					return UDim2.fromOffset(math.round(x * scale), math.round(y * scale))
				end;
				udim = function(value: number)
					return UDim.new(0, math.round(value * scale))
				end
			}

			setmetatable(api, {
				__call = function(_, value)
					return math.round(value * scale)
				end
			})

			return api
		end, { scale, baseResolution })
	end
end