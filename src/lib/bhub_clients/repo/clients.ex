defmodule BhubClients.Repo.Clients do
  import Ecto.Query, only: [from: 2]

  alias BhubClients.Data.Client

  def list(:without_address) do
    from(
      client in Client,
      order_by: [desc: client.company_name],
      where: is_nil(client.disabled_at),
      select: %{
        id: client.id,
        company_name: client.company_name,
        phone: client.phone,
        invoicing: client.invoicing
      }
    )
  end
end
