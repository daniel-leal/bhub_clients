defmodule BhubClients.Clients.DisableTest do
  use BhubClients.DataCase, async: true

  alias BhubClients.Clients

  describe "disable/1" do
    test "when all params are valid, disables a client" do
      # arrange
      client = insert(:client)

      # act
      response = Clients.disable(client.id)

      # assert
      assert {:ok, result} = response
      assert result.disabled_at != nil
    end

    test "already disabled client" do
      # arrange
      three_days_ago = DateTime.add(DateTime.utc_now(), -3 * 24 * 60 * 60, :second)
      client = insert(:client, disabled_at: three_days_ago)

      # act
      response = Clients.disable(client.id)

      # assert
      assert {:ok, result} = response
      assert result.disabled_at == three_days_ago
    end

    test "invalid client id" do
      # assert
      assert_raise(Ecto.NoResultsError, fn ->
        Clients.disable(Ecto.UUID.generate())
      end)
    end
  end
end
