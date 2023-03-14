defmodule PedidoCaBcb.Domain.UseCase.RegistrarProductoUseCase do
  alias PedidoCaBcb.Domain.Model.Producto
  require Logger

  @generate_uuid_behavior Application.compile_env(:pedido, :generate_uuid_behavior)

  def register(data) do
    new_map = Map.put(data, :id, generate_uuid_producto())
    with {:ok, producto} <- Producto.new(new_map[:id], new_map[:num_prod], new_map[:nombre], new_map[:descripcion], new_map[:tipo], new_map[:valor]),
         {:ok, new_producto} <- register_producto(producto) do
          Logger.info("New producto #{inspect(new_producto)}")
          {:ok, new_producto}
    end
  end

  defp register_producto(producto) do
    {:ok, producto}

  end

  defp generate_uuid_producto() do
    @generate_uuid_behavior.generate_uuid()
  end

end
