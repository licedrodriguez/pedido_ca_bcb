defmodule PedidoCaBcb.Utils.GeneratorId do
alias Ecto.UUID

  def generate_uuid do
    UUID.generate()
  end
end
