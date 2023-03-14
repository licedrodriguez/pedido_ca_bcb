import Config

config :pedido_ca_bcb, timezone: "America/Bogota"

config :pedido_ca_bcb,
       http_port: 8083,
       enable_server: true,
       secret_name: "",
       region: "",
       version: "0.0.1",
       in_test: false,
       custom_metrics_prefix_name: "pedido_ca_bcb_local"

config :logger,
       level: :debug

config :pedido_ca_bcb, PedidoCaBcb.Infrastructure.Adapters.Repository.Repo,
database: "",
username: "",
password: "",
hostname: "",
pool_size: 10
