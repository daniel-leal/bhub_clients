defmodule Support.Factory do
  use ExMachina.Ecto, repo: BhubClients.Repo

  def client_factory do
    %BhubClients.Data.Client{
      company_name: sequence(:company_name, &"Company #{&1}"),
      phone: "#{BhubClients.Util.Random.generate_number(11)}",
      postal_code: "66113010",
      district: "Cremação",
      state: "PA",
      city: "Belém",
      address: "Av. Conselheiro Furtado",
      number: "2312",
      complement: "Apt 1104",
      invoicing: 891_813.11,
      disabled_at: nil
    }
  end
end
