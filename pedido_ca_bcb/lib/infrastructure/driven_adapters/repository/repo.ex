defmodule PedidoCaBcb.Infrastructure.Adapters.Repository.Repo do
  use Ecto.Repo,
  otp_app: :pedido_ca_bcb,
  adapter: Ecto.Adapters.Postgres
end
