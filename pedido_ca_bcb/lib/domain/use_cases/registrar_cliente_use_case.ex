defmodule PedidoCaBcb.Domain.UseCase.RegistrarClienteUseCase do
  alias PedidoCaBcb.Domain.Model.Cliente
  require Logger

  @cliente_bahavior Application.compile_env(:pedido, :cliente_behavior)
  @generate_uuid_behavior Application.compile_env(:pedido, :generate_uuid_behavior)

  @spec register(map()) :: {:error, atom()} | {:ok, Cliente.t()}
  def register(data) do
    new_map = Map.put(data, :id, generate_uuid_cliente())
    with  {:ok, cliente } <- Cliente.new(new_map[:id], new_map[:identificacion], new_map[:nombres], new_map[:apellidos], new_map[:telefono], new_map[:direccion], new_map[:email]),
          {:ok, _} <- validation(cliente),
          {:ok, new_cliente} <- register_cliente(cliente) do
            Logger.info("New cliente #{inspect(new_cliente)}")
          {:ok, new_cliente}
    end

  end

  defp validation(cliente) do
    {:ok, cliente}
  end

  defp register_cliente(cliente) do
    @cliente_bahavior.register(cliente)
  end

  defp generate_uuid_cliente() do
    @generate_uuid_behavior.generate_uuid()
  end

end
