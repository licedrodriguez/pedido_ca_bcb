defmodule PedidoCaBcb.Domain.Model.Cliente do

  @moduledoc """
  TODO Updates module description
  """

  defstruct [
    :id,
    :identificacion,
    :nombres,
    :apellidos,
    :telefono,
    :direccion,
    :email
  ]

  @type t() :: %__MODULE__{id: binary(), identificacion: String.t(), nombres: String.t(), apellidos: String.t(), telefono: String.t(), direccion: String.t(), email: String.t()}

  @spec new(binary(), String.t(), String.t(), String.t(), String.t(), String.t(), String.t()) :: {:error, :invalid_customer} | {:ok, __MODULE__.t()}
  def new(_, _, nombres, _, _, _, _) when is_nil(nombres), do: {:error, :invalid_customer}
  def new(id, identificacion, nombres, apellidos, telefono, direccion, email) do
    {:ok, %__MODULE__{id: id, identificacion: identificacion, nombres: nombres, apellidos: apellidos, telefono: telefono, direccion: direccion, email: email}}
  end

  def find_by_id(id) do
    {:ok, %__MODULE__{id: id}}
  end


end
