defmodule PedidoCaBcb.Domain.Model.Cliente do

  @moduledoc """
  TODO Updates module description
  """
    
  defstruct [
    :id,
    :name, 
    :lastname,
    :phone,
    :address,
    :email
  ]

  @type t() :: %__MODULE__{id: String.t(), name: String.t(), lastname: String.t(), phone: number(), address: String.t(), email: String.t()}

  @spec new(String.t(), String.t(), String.t(), number(), String.t(), String.t()) :: {:error, :invalid_customer} | {:ok, __MODULE__.t()}
  def new(_, name, _, _, _, _) when is_nil(name), do: {:error, :invalid_customer}
  def new(id, name, lastname, phone, address, email) do
    {:ok, %__MODULE__{id: id, name: name, lastname: lastname, phone: phone, address: address, email: email}}
  end
   

end
