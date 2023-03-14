defmodule PedidoCaBcb.Infrastructure.DrivenAdapters.Repository.Generic.UuidData do
  alias PedidoCaBcb.Utils.GeneratorId

  @behaviour PedidoCaBcb.Domain.Behaviours.GenericBehavior

  def generate_uuid do
    GeneratorId.generate_uuid()
  end
end
