import Config

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.19.10",
  default: [
    args:
      ~w(app.js --bundle --target=es2017 --outdir=../../dist/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets/js", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../dist/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

