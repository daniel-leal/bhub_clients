defmodule BhubClients.Clients.Disable do
  alias BhubClients.Data.Client
  alias BhubClients.{Error, Repo}

  def call(id) do
    with %Client{} = client <- Repo.get!(Client, id) do
      case client.disabled_at do
        nil ->
          client
          |> Client.changeset(%{disabled_at: DateTime.utc_now()})
          |> Repo.update()
          |> handle_disable()

        _disabled ->
          {:ok, client}
      end
    end
  end

  defp handle_disable({:ok, %Client{} = result}), do: {:ok, result}

  defp handle_disable({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
