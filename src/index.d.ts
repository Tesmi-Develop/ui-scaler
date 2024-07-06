import { Binding } from "@rbxts/react";

declare namespace UIScaler {
	export function useScaler(baseResolution: Vector2): ScalerApi;

	export interface ScalerApi {
		// Binding
		scale: Binding<number>;
		scaleVector: Binding<Vector2>;

		// Calculation
		px: СalculatorApi;
		unscale: СalculatorApi;

		// Hooks
		usePx: () => СalculatorApi;
		useUnscale: () => СalculatorApi;
	}

	export interface СalculatorApi {
		(value: number): number;
		position: (x: number, y: number) => UDim2;
		udim2: (x: number, y: number) => UDim2;
		udim: (value: number) => UDim;
	}
}

export = UIScaler;
export as namespace UIScaler;
