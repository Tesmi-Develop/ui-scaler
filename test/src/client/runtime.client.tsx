import React from "@rbxts/react";
import { createPortal, createRoot } from "@rbxts/react-roblox";
import { ScalerApi, useScaler } from "@rbxts/ui-scaler";

const root = createRoot(new Instance("Folder"));
const PlayerGui = game.GetService("Players").LocalPlayer.WaitForChild("PlayerGui") as PlayerGui;

const BASE_RESOLUTION = new Vector2(1920, 1080);

function TestFrame({ scaler }: { scaler: ScalerApi }) {
	const px = scaler.usePx();
	print(px(100));

	return <frame></frame>;
}

function App() {
	const scaler = useScaler(BASE_RESOLUTION);
	return (
		<screengui>
			<TestFrame scaler={scaler} />
		</screengui>
	);
}

root.render(createPortal(<App />, PlayerGui));
