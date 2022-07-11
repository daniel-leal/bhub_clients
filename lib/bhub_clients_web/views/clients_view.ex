defmodule BhubClientsWeb.ClientsView do
  use BhubClientsWeb, :view

  def render("index.json", %{pagination: pagination}) do
    %{
      clients: pagination.entries,
      total_entries: pagination.total_entries,
      page_number: pagination.page_number,
      per_page: pagination.per_page,
      total_pages: pagination.pages
    }
  end

  def render("show.json", %{client: client}) do
    %{
      id: client.id,
      company_name: client.company_name,
      phone: client.phone,
      postal_code: client.postal_code,
      district: client.district,
      state: client.state,
      city: client.city,
      address: client.address,
      number: client.number,
      complement: client.complement,
      invoicing: client.invoicing,
      bank_data: client.bank_data
    }
  end
end
