import { Binding } from "@rbxts/react";

declare namespace UIScaler {
	export function useScaler(baseResolution: Vector2): ScalerApi;

	export interface ScalerApi {
		scale: Binding<number>;
		calculate: (value: number) => number;
		unscale: (value: number) => number;
		usePx: () => usePxApi;
		useUnscale: () => (value: number) => number;
	}

	export interface usePxApi {
		(value: number): number;
		position: (x: number, y: number) => UDim2;
		udim2: (x: number, y: number) => UDim2;
		udim: (value: number) => UDim;
	}
}

export = UIScaler;
export as namespace UIScaler;
