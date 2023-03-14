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
       database: "pedidos_bd",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       pool_size: 10

config :pedido,
        cliente_behavior: PedidoCaBcb.Infrastructure.Adapters.Repository.Cliente.ClienteDataRepository,
        generate_uuid_behavior: PedidoCaBcb.Infrastructure.DrivenAdapters.Repository.Generic.UuidData
