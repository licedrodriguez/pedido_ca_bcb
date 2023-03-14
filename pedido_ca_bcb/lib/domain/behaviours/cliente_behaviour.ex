defmodule PedidoCaBcb.Domain.Behaviours.ClienteBehaviour do
  alias PedidoCaBcb.Domain.Model.Cliente

  @callback find_all() :: {:ok, Cliente.t()} | {:error, reason::atom()}

  @callback find_by_id(String.t()) :: {:ok, Cliente.t()} | {:error, reason::atom()}

  @callback register(Cliente.t()) :: {:ok, Cliente.t()} | {:error, reason::atom()}

  @callback update(Cliente.t(), Cliente.t()) :: {:ok, Cliente.t()} | {:error, reason::atom()}

  @callback delete(Cliente.t()) :: {:ok, String.t()} | {:error, reason::atom()}
end
