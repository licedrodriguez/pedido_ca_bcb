defmodule PedidoCaBcb.Domain.Behaviours.ProductoBehavior do
  alias PedidoCaBcb.Domain.Model.Producto

  @callback register(Producto.t()) :: {:ok, Producto.t()} | {:error, reason::atom()}

end
