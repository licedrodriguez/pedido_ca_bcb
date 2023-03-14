defmodule PedidoCaBcb.Domain.UseCase.DeleteClienteUseCase do
  alias PedidoCaBcb.Domain.Model.Cliente
  require Logger

  @cliente_bahavior Application.compile_env(:pedido, :cliente_behavior)

  def delete(id) do
    cliente = find_by_id_cliente(Map.get(id, :id))
    with  :ok <- delete_cliente(cliente) do
            Logger.info("Cliente eliminado")
    end

  end

  def delete_cliente(id) do
    @cliente_bahavior.delete(id)
  end

  defp find_by_id_cliente(id) do
    @cliente_bahavior.find_by_id(id)
  end
end
