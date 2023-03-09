import Config

config :pedido_ca_bcb, timezone: "America/Bogota"

config :pedido_ca_bcb,
       http_port: 8083,
       enable_server: true,
       secret_name: "",
       region: "",
       version: "0.0.1",
       in_test: true,
       custom_metrics_prefix_name: "pedido_ca_bcb_local"

config :logger,
       level: :debug
