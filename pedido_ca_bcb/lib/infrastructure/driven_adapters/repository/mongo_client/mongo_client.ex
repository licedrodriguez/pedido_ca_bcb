defmodule Infrastructure.DrivenAdapters.Repository.MongoClient.MongoClient do
  @moduledoc """

  """

  @doc """

  """
  def client do
    options = [
      database: Application.get_env(:pedido_ca_bcb, MyApp.Repo)[:database],
      hostname: Application.get_env(:pedido_ca_bcb, MyApp.Repo)[:hostname],
      port: Application.get_env(:pedido_ca_bcb, MyApp.Repo)[:port]
    ]
    
    Mongo.Client.new(options)
  end
end
