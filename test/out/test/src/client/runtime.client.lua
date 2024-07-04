-- Compiled with roblox-ts v2.3.0-dev-3a89c93
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local React = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local _react_roblox = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-roblox")
local createPortal = _react_roblox.createPortal
local createRoot = _react_roblox.createRoot
local useScaler = TS.import(script, game:GetService("ReplicatedStorage"), "library").useScaler
local root = createRoot(Instance.new("Folder"))
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local BASE_RESOLUTION = Vector2.new(1920, 1080)
local function TestFrame(_param)
	local scaler = _param.scaler
	local px = scaler.usePx()
	print(px(100))
	return React.createElement("frame")
end
local function App()
	local scaler = useScaler(BASE_RESOLUTION)
	return React.createElement("screengui", nil, React.createElement(TestFrame, {
		scaler = scaler,
	}))
end
root:render(createPortal(React.createElement(App), PlayerGui))
