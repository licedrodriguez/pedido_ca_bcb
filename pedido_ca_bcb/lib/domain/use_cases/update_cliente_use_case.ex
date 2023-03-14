defmodule PedidoCaBcb.Domain.UseCase.UpdateClienteUseCase do
  alias PedidoCaBcb.Domain.Model.Cliente
  require Logger

  @cliente_bahavior Application.compile_env(:pedido, :cliente_behavior)

  def update(id, data) do
    cliente = find_by_id_cliente(Map.get(id, :id))
    with {:ok, cliente_params} <- Cliente.new(data[:id], data[:identificacion], data[:nombres], data[:apellidos], data[:telefono], data[:direccion], data[:email]),
         {:ok, _} <- validation(cliente),
         {:ok, up_cliente} <- update_cliente(cliente, cliente_params)  do
          Logger.info("Cliente actualizado : #{inspect(up_cliente)}")
          {:ok, up_cliente}

    end
  end

  defp validation(cliente) do
    {:ok, cliente}
  end

  defp update_cliente(cliente, cliente_params) do
    @cliente_bahavior.update(cliente, cliente_params)
  end

  defp find_by_id_cliente(id) do
    @cliente_bahavior.find_by_id(id)
  end

end
