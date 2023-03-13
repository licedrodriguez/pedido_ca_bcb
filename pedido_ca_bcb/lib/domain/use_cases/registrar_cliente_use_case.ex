defmodule PedidoCaBcb.Domain.UseCase.RegistrarClienteUseCase do
  alias PedidoCaBcb.Domain.Model.Cliente
  require Logger


  @spec register(map()) :: {:error, atom()} | {:ok, Cliente.t()}
  def register(info) do
    with  {:ok, cliente } <- Cliente.new(info[:id], info[:name], info[:lastname], info[:phone], info[:address], info[:email]),
          {:ok, _} <- validation(cliente),
          {:ok, new_cliente} <- register_cliente(cliente)do
            Logger.info("New cliente #{inspect(new_cliente)}")
            {:ok, new_cliente}
    end

  end

  defp validation(cliente) do
    {:ok, cliente}
  end

  defp register_cliente(cliente) do
  {:ok, cliente}
  end

end
