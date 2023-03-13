defmodule PedidoCaBcb.Domain.Behaviours.ClienteBehaviour do
  alias PedidoCaBcb.Domain.Model.Cliente

  @callback register(Cliente.t())::{:ok, Cliente.t()} | {:error, atom()}
end
