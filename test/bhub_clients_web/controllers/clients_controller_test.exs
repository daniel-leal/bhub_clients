defmodule BhubClientsWeb.ClientsControllerTest do
  use BhubClientsWeb.ConnCase

  describe "index" do
    test "list all clients", %{conn: conn} do
      insert_list(3, :client)

      conn = get(conn, Routes.clients_path(conn, :index))

      assert response = json_response(conn, 200)
      assert length(response["clients"]) == 3

      assert %{
               "clients" => _clients,
               "page_number" => _page_number,
               "per_page" => _per_page,
               "total_entries" => _total_entries,
               "total_pages" => _total_pages
             } = response
    end
  end

  describe "create" do
    test "create client, when all params are valid", %{conn: conn} do
      client_params = params_for(:client)

      conn = post(conn, Routes.clients_path(conn, :create, client_params))

      assert json_response(conn, 201)
    end

    test "when there are invalid params, should return bad request", %{conn: conn} do
      client_params = params_for(:client, company_name: nil)

      conn = post(conn, Routes.clients_path(conn, :create, client_params))

      assert json_response(conn, 400)
    end
  end

  describe "show" do
    test "get client", %{conn: conn} do
      client = insert(:client)

      conn = get(conn, Routes.clients_path(conn, :show, client.id))

      assert json_response(conn, 200)
    end

    test "invalid client", %{conn: conn} do
      assert_raise Ecto.NoResultsError, fn ->
        conn = get(conn, Routes.clients_path(conn, :show, Ecto.UUID.generate()))

        assert json_response(conn, 404)
      end
    end
  end

  describe "update" do
    setup do
      client = insert(:client)

      {:ok, client: client}
    end

    test "update client, when all params are valid", %{conn: conn, client: client} do
      conn =
        patch(conn, Routes.clients_path(conn, :update, client.id, %{company_name: "Company 55"}))

      assert json_response(conn, 200)
    end

    test "disable client", %{conn: conn, client: client} do
      conn = patch(conn, Routes.clients_path(conn, :update, client.id, %{disable: true}))

      assert json_response(conn, 200)

      client = BhubClients.Repo.get(BhubClients.Data.Client, client.id)

      refute client.disabled_at == nil
    end

    test "when there are invalid params, should return bad request", %{conn: conn, client: client} do
      conn = patch(conn, Routes.clients_path(conn, :update, client.id, %{postal_code: "6611204"}))

      assert json_response(conn, 400)
    end
  end
end
