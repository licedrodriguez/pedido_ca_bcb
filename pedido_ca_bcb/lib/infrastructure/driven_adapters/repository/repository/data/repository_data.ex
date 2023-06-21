defmodule PedidoCaBcb.Infrastructure.Adapters.Repository.Repository.Data.RepositoryData do
  use Ecto.Schema

  ## TODO: Add schema definition
  # Types https://hexdocs.pm/ecto/Ecto.Schema.html#module-primitive-types

  schema "repository" do
    field :name, :string
    #field :creation_date, :utc_datetime
    #field :update_date, :utc_datetime
  end
end
