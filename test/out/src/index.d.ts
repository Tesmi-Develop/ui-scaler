import { Binding } from "@rbxts/react";

declare namespace UIScaler {
	export function useScaler(baseResolution: Vector2): ScalerApi;

	function usePx(): usePxApi;

	export interface ScalerApi {
		scale: Binding<number>;
		usePx: typeof usePx;
	}

	export interface usePxApi {
		(value: number): number;
	}
}

export = UIScaler;
export as namespace Charm;
