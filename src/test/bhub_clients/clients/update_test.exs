defmodule BhubClients.Clients.UpdateTest do
  use BhubClients.DataCase, async: true

  alias BhubClients.Clients
  alias BhubClients.Error

  describe "update/2" do
    setup do
      client = insert(:client, phone: "91992727944", company_name: "Sophie e Brenda Ferragens ME")

      {:ok, client: client}
    end

    test "when all params are valid, update client", %{client: client} do
      # act
      response =
        Clients.update(client.id, %{
          phone: "91998547715",
          company_name: "Felipe e Caroline Pães e Doces Ltda"
        })

      # assert
      assert {:ok, result} = response
      assert result.company_name == "Felipe e Caroline Pães e Doces Ltda"
      assert result.phone == "91998547715"
    end

    test "invalid postal_code", %{client: client} do
      # act
      response = Clients.update(client.id, %{postal_code: "6611301"})

      # assert
      assert {:error, %Error{} = _changeset} = response
    end

    test "company_name already been taken" do
      # arrange
      client2 = insert(:client, company_name: "Company 1")

      # act
      response = Clients.update(client2.id, %{company_name: "Sophie e Brenda Ferragens ME"})

      # assert
      assert {:error, %Error{} = _changeset} = response
    end
  end
end
