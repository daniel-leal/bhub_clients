defmodule BhubClients.Clients.Update do
  alias BhubClients.Data.Client
  alias BhubClients.{Error, Repo}

  def call(id, params) do
    with %Client{} = client <- Repo.get!(Client, id) do
      client
      |> Client.changeset(params)
      |> Repo.update()
      |> handle_update()
    end
  end

  defp handle_update({:ok, %Client{} = result}), do: {:ok, result}

  defp handle_update({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
