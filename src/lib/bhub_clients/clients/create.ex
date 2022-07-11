defmodule BhubClients.Clients.Create do
  alias BhubClients.Data.Client
  alias BhubClients.{Error, Repo}

  def call(params) do
    params
    |> Client.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Client{} = result}), do: {:ok, result}

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
