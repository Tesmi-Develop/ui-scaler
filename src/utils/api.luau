local Math = require(script.Parent.Parent.utils.math)
local binding = require(script.Parent.binding)

local function GeneratePxApi(scale, baseResolution, camera)
	local api = {
		position = function(x: number, y: number)
			local vector = Math.CalculateScaleVector(camera.ViewportSize, baseResolution)
			return UDim2.fromOffset(x * vector.X, y * vector.Y)
		end;
		udim2 = function(x: number, y: number)
			return UDim2.fromOffset(math.round(x * binding.getBindingValue(scale)), math.round(y * binding.getBindingValue(scale)))
		end;
		udim = function(value: number)
			return UDim.new(0, math.round(value * binding.getBindingValue(scale)))
		end
	}

	setmetatable(api, {
		__call = function(_, value)
			return math.round(value * binding.getBindingValue(scale))
		end
	})

	return api
end

local function GenerateUnscaleApi(scale, baseResolution, camera)
	local api = {
		position = function(x: number, y: number)
			local vector = Math.CalculateScaleVector(camera.ViewportSize, baseResolution)
			return UDim2.fromOffset(x / vector.X, y / vector.Y)
		end;
		udim2 = function(x: number, y: number)
			return UDim2.fromOffset(math.round(x / binding.getBindingValue(scale)), math.round(y / binding.getBindingValue(scale)))
		end;
		udim = function(value: number)
			return UDim.new(0, math.round(value / binding.getBindingValue(scale)))
		end
	}

	setmetatable(api, {
		__call = function(_, value)
			return math.round(value / binding.getBindingValue(scale))
		end
	})

	return api
end

return {
	GeneratePxApi = GeneratePxApi;
	GenerateUnscaleApi = GenerateUnscaleApi;
}