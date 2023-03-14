defmodule PedidoCaBcb.Domain.UseCase.GetClienteUseCase do

  alias PedidoCaBcb.Domain.Model.Cliente
  require Logger

  @cliente_bahavior Application.compile_env(:pedido, :cliente_behavior)

  def find_by_id(data) do
    with {:ok, cliente} <- Cliente.find_by_id(data[:id]),
          result_cliente <- find_by_id_cliente(Map.get(cliente, :id))  do
          Logger.info("Cliente obtenido: #{inspect(result_cliente)}")
         {:ok, result_cliente}
    end
  end

  def find_all() do
    with result_cliente <- list_clientes()  do
          Logger.info("Cliente obtenido: #{inspect(result_cliente)}")
         {:ok, result_cliente}
    end
  end

  def find_by_id_cliente(id) do
    @cliente_bahavior.find_by_id(id)
  end

  def list_clientes do
    @cliente_bahavior.find_all()
  end

end
