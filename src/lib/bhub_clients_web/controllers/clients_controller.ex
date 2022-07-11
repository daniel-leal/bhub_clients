defmodule BhubClientsWeb.ClientsController do
  use BhubClientsWeb, :controller
  use PhoenixSwagger
  import Plug.Conn.Status, only: [code: 1]

  alias BhubClients.Clients
  alias BhubClients.Data.Client
  alias BhubClients.Repo
  alias Repo.Clients, as: ClientsRepo
  alias Repo.Pagination
  alias BhubClientsWeb.FallbackController

  action_fallback FallbackController

  swagger_path :index do
    get("/clients")
    description("List of clients")
    response(code(:ok), "Success")
  end

  def index(conn, params) do
    filter = set_filter(params)

    pagination =
      ClientsRepo.list(:without_address)
      |> Repo.Filter.fetch(filter)
      |> Pagination.new(params)

    render(conn, "index.json", pagination: pagination)
  end

  swagger_path :show do
    get("/clients/{id}")
    description("Client info")

    parameters do
      id(:path, :string, "Client ID", required: true)
    end

    response(code(:ok), "Success")
    response(code(:not_found), "Not Found")
  end

  def show(conn, %{"id" => id}) do
    with %Client{} = client <- Repo.get!(Client, id) do
      render(conn, "show.json", client: client)
    end
  end

  def create(conn, params) do
    with {:ok, client} <- Clients.create(params) do
      conn
      |> put_status(:created)
      |> render("show.json", client: client)
    end
  end

  def update(conn, %{"id" => id, "disable" => "true"}) do
    with {:ok, client} <- Clients.disable(id) do
      render(conn, "show.json", client: client)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, client} <- Clients.update(id, params) do
      render(conn, "show.json", client: client)
    end
  end

  defp set_filter(params) do
    %{
      company_name_ilike: Map.get(params, "company_name", ""),
      city_ilike: Map.get(params, "city", ""),
      invoicing_gt: Map.get(params, "invoicing_gt", ""),
      invoicing_lt: Map.get(params, "invoicing_lt", "")
    }
  end
end
