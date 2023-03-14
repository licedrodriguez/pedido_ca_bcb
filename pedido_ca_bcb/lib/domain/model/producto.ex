defmodule PedidoCaBcb.Domain.Model.Producto do

  defstruct [
    :id,
    :num_prod,
    :nombre,
    :descripcion,
    :tipo,
    :valor
  ]

  @type t() :: %__MODULE__{id: binary(), num_prod: String.t(), nombre: String.t(), descripcion: String.t(), tipo: String.t(), valor: integer()}

  def new(_, num_prod, _, _, _, _) when is_nil(num_prod), do: {:error, :invalid_producto}
  def new(id, num_prod, nombre, descripcion, tipo, valor) do
    {:ok, %__MODULE__{id: id,
                num_prod: num_prod,
                nombre: nombre,
                descripcion: descripcion,
                tipo: tipo,
                valor: valor}}
  end

  def find_by_id(id) do
    {:ok, %__MODULE__{id: id}}
  end

end
