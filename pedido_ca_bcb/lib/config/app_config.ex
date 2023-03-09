defmodule PedidoCaBcb.Config.AppConfig do

  @moduledoc """
   Provides strcut for app-config
  """

   defstruct [
     :enable_server,
     :http_port
   ]

   def load_config do
     %__MODULE__{
       enable_server: load(:enable_server),
       http_port: load(:http_port)
     }
   end

   defp load(property_name), do: Application.fetch_env!(:pedido_ca_bcb, property_name)
 end
