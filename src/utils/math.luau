local function GetDominantAxis(viewport: Vector2, baseAspectRatio: number)
    local aspectRatio = viewport.Y / viewport.X
    
    if baseAspectRatio > aspectRatio then
        return 1
    end
    
    return aspectRatio > baseAspectRatio and 0 or 0.5
end

local function CalculateScale(viewport: Vector2, baseResolution: Vector2)
    local width = math.log(viewport.X / baseResolution.X, 2)
    local height = math.log(viewport.Y / baseResolution.Y, 2)
    local dominantAxis = GetDominantAxis(viewport, baseResolution.Y / baseResolution.X)
    local centered = width + (height - width) * dominantAxis

    return 2 ^ centered
end

local function CalculateScaleVector(viewport: Vector2, baseResolution: Vector2)
    local width = math.log(viewport.X / baseResolution.X, 2)
    local height = math.log(viewport.Y / baseResolution.Y, 2)

    return Vector2.new(2 ^ width, 2 ^ height)
end

return {
	CalculateScale = CalculateScale;
    CalculateScaleVector = CalculateScaleVector;
}