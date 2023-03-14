defmodule PedidoCaBcb.Infrastructure.EntryPoint.ApiRest do

  @moduledoc """
  Access point to the rest exposed services
  """
  alias PedidoCaBcb.Domain.UseCase.DeleteClienteUseCase
  alias PedidoCaBcb.Domain.UseCase.UpdateClienteUseCase
  alias PedidoCaBcb.Domain.UseCase.GetClienteUseCase
  alias PedidoCaBcb.Infrastructure.EntryPoint.ErrorHandler
  alias PedidoCaBcb.Domain.UseCase.RegistrarClienteUseCase
  require Logger
  use Plug.Router
  use Timex

  plug(CORSPlug,
    methods: ["GET", "POST", "PUT", "DELETE"],
    origin: [~r/.*/],
    headers: ["Content-Type", "Accept", "User-Agent"]
  )

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(Plug.Parsers, parsers: [:urlencoded, :json], json_decoder: Poison)
  plug(Plug.Telemetry, event_prefix: [:pedido_ca_bcb, :plug])
  plug(:dispatch)

  forward(
    "/pedido_ca_bcb/api/health",
    to: PlugCheckup,
    init_opts: PlugCheckup.Options.new(json_encoder: Jason, checks: PedidoCaBcb.Infrastructure.EntryPoint.HealthCheck.checks)
  )

  get "/pedido_ca_bcb/api/hello/" do
    build_response("Hello World", conn)
  end

  get "/pedido_ca_bcb/api/clientes/" do
    case GetClienteUseCase.find_all() do
      {:ok, clientes} -> clientes |> build_response(conn)
    end
  end

  get "/pedido_ca_bcb/api/clientes/:id" do
    case GetClienteUseCase.find_by_id(%{id: id}) do
      {:ok, clientes} -> clientes |> build_response(conn)
    end
  end

  post "/pedido_ca_bcb/api/cliente/" do
    params_map = conn.params |> Map.new(fn {key, value} -> {String.to_atom(key), value} end)
    case RegistrarClienteUseCase.register(params_map) do
      {:ok, cliente} -> cliente |> build_response(conn)
      {:error, error} -> %{status: 500, body: error} |> build_response(conn)
    end
  end

  put "/pedido_ca_bcb/api/cliente/:id" do
    params_map = conn.params |> Map.new(fn {key, value} -> {String.to_atom(key), value} end)

    case UpdateClienteUseCase.update(%{id: id}, params_map) do
      {:ok, cliente} -> cliente |> build_response(conn)
      {:error, error} -> %{status: 500, body: error} |> build_response(conn)
    end
  end

  delete "/pedido_ca_bcb/api/cliente/:id" do
    case DeleteClienteUseCase.delete(%{id: id}) do
      {:ok, clientes} -> clientes |> build_response(conn)
      {:error, error} -> %{status: 500, body: error} |> build_response(conn)
    end
  end


  def build_response(%{status: status, body: body}, conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Poison.encode!(body))
  end

  def build_response(response, conn), do: build_response(%{status: 200, body: response}, conn)

  match _ do
    conn
    |> handle_not_found(Logger.level())
  end

  defp handle_error(error, conn) do
    error
    |> ErrorHandler.build_error_response()
    |> build_response(conn)
  end

  defp handle_bad_request(error, conn) do
    error
    |> ErrorHandler.build_error_response()
    |> build_bad_request_response(conn)
  end

  defp build_bad_request_response(response, conn) do
    response |> IO.inspect()
    conn |> IO.inspect()
    build_response(%{status: 400, body: response}, conn)
  end

  defp handle_not_found(conn, :debug) do
    %{request_path: path} = conn
    body = Poison.encode!(%{status: 404, path: path})
    send_resp(conn, 404, body)
  end

  defp handle_not_found(conn, _level) do
    send_resp(conn, 404, "")
  end
end
