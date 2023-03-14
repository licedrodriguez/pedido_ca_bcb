defmodule PedidoCaBcb.Infrastructure.Adapters.Repository.Cliente.ClienteDataRepository do
  alias PedidoCaBcb.Infrastructure.Adapters.Repository.Repo
  alias PedidoCaBcb.Infrastructure.Adapters.Repository.Cliente.Data.ClienteData
  alias PedidoCaBcb.Domain.Model.Cliente

  ## TODO: Update behaviour
  @behaviour PedidoCaBcb.Domain.Behaviours.ClienteBehaviour

  def find_all do
    ClienteData |> Repo.all() |> to_entity_all
    #Repo.all(ClienteData) |> IO.inspect()
  end

  def find_by_id(id), do: ClienteData |> Repo.get(id) |> to_entity

  def register(entity) do
    case to_data(entity) |> Repo.insert do
      {:ok, entity} -> {:ok, entity |> to_entity()}
      error -> error
    end
  end

  def update(entity, params) do
    case to_data(entity) |> ClienteData.changeset(params |> Map.from_struct) |> Repo.update() do
      {:ok, entity} -> {:ok, entity |> to_entity()}
      error -> error
    end
  end

  def delete(entity) do
    case to_data(entity) |> Repo.delete() do
      :ok -> :ok
      error -> error
    end
  end

  defp to_entity_all(nil), do: nil
  defp to_entity_all(data) do
    list = Enum.map(data, fn cliente ->
      struct(Cliente, cliente |> Map.from_struct)
    end)
    list |> IO.inspect()
  end

  defp to_entity(nil), do: nil
  defp to_entity(data) do
    data |> IO.inspect()
    struct(Cliente, data |> Map.from_struct)
  end

  defp to_data(entity) do
    struct(ClienteData, entity |> Map.from_struct)
  end
end
