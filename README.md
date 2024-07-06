# 📐 UI Scaler
This library will allow you to scalable ui

# ☄️ Installation

## NPM(https://www.npmjs.com/package/@rbxts/ui-scaler)
``npm i @rbxts/ui-scaler``

# 📚 Documentation

## Scaler
You need to create a scaler

```tsx
const BASE_RESOLUTION = new Vector2(1920, 1080);
const scaleApi = useScaler(BASE_RESOLUTION);
```

## Scale calculator

You can now use the scale-aware counting functions

```tsx
scaleApi.px(100);
scaleApi.unscale(100);
```

## Hooks

You can also use hooks that will re-render your component, after changing the scale

```tsx
scaleApi.usePx();
scaleApi.useUnscale();
```

# ❤️ Credits
SUMER (Discord: sumer_real)\
Tesmi (Discord: tesmi)