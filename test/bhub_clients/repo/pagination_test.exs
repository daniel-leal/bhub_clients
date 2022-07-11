defmodule BhubClients.Repo.PaginationTest do
  use BhubClients.DataCase, async: true

  alias BhubClients.Repo
  alias Repo.{Clients, Pagination}

  describe "new/3" do
    setup do
      insert_list(105, :client)

      :ok
    end

    test "success without params" do
      pagination = Pagination.new(Clients.list(:without_address), %{})

      assert %{
               entries: _entries,
               total_entries: 105,
               page_number: 1,
               per_page: 10,
               pages: 11
             } = pagination
    end

    test "success with params" do
      pagination =
        Pagination.new(Clients.list(:without_address), %{"page" => 3, "per_page" => 20})

      assert %{
               entries: _entries,
               total_entries: 105,
               page_number: 3,
               per_page: 20,
               pages: 6
             } = pagination
    end
  end
end
