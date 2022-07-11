defmodule BhubClients.Clients.CreateTest do
  use BhubClients.DataCase, async: true

  alias BhubClients.Clients
  alias BhubClients.Error

  describe "create/1" do
    test "when all params are valid, create a client" do
      # arrange
      client_params = params_for(:client)

      # act
      response = Clients.create(client_params)

      # assert
      assert {:ok, result} = response
      assert result.id != nil
    end

    test "invalid postal_code format" do
      # arrange
      client_params = params_for(:client, postal_code: "aaaaaaaa")

      # act
      response = Clients.create(client_params)

      # assert
      assert {:error, %Error{} = _changeset} = response
    end

    test "invalid postal_code size" do
      # arrange
      client_params = params_for(:client, postal_code: "6611304")

      # act
      response = Clients.create(client_params)

      # assert
      assert {:error, %Error{} = _changeset} = response
    end

    test "company_name already been taken" do
      # arrange
      insert(:client, company_name: "Company 1")
      client_params = params_for(:client, company_name: "Company 1")

      # act
      response = Clients.create(client_params)

      # assert
      assert {:error, %Error{} = _changeset} = response
    end

    test "required params" do
      # arrange
      client_params = params_for(:client, company_name: nil)

      # act
      response = Clients.create(client_params)

      # assert
      assert {:error, %Error{} = _changeset} = response
    end
  end
end
