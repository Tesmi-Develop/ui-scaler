local Workspace = game:GetService("Workspace")
local React = require(script.Parent.Parent.modules.React)
local useEventListener = require(script.Parent.useEventListener).useEventListener

local function useCamera()
	local camera, setCamera = React.useState(Workspace.CurrentCamera)
	useEventListener(Workspace:GetPropertyChangedSignal("CurrentCamera"), function()
		if Workspace.CurrentCamera then
			setCamera(Workspace.CurrentCamera)
		end
	end)
	return camera
end

return useCamera