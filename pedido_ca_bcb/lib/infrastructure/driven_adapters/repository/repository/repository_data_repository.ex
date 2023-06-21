defmodule PedidoCaBcb.Infrastructure.Adapters.Repository.Repository.RepositoryDataRepository do
  alias PedidoCaBcb.Infrastructure.Adapters.Repository.Repo
  alias PedidoCaBcb.Infrastructure.Adapters.Repository.Repository.Data.RepositoryData
  # alias PedidoCaBcb.Domain.Model.Repository

  ## TODO: Update behaviour
  # @behaviour PedidoCaBcb.Domain.Behaviours.RepositoryBehaviour

  def find_by_id(id), do: RepositoryData |> Repo.get(id) |> to_entity

  def insert(entity) do
    case to_data(entity) |> Repo.insert do
      {:ok, entity} -> entity |> to_entity()
      error -> error
    end
  end

  defp to_entity(nil), do: nil
  defp to_entity(data) do
    ## TODO: Update Entity
    # struct(Repository, data |> Map.from_struct)
    %{}
  end

  defp to_data(entity) do
    struct(RepositoryData, entity |> Map.from_struct)
  end
end
