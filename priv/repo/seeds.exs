alias BhubClients.Data.Client
alias BhubClients.Repo

client1 = %{
  company_name: "Julio e Raul Contábil ME",
  phone: "19987591184",
  postal_code: "66050105",
  district: "Jardim Paulistano",
  state: "SP",
  city: "Americana",
  address: "Rua Itália",
  number: "441",
  complement: nil,
  invoicing: 5840.20,
  bank_data: %{
    accounts: [
      %{
        account: "54815",
        agency: "0001",
        bank: "Itaú"
      }
    ]
  }
}

Repo.insert!(client1)

client2 = %Client{
  company_name: "Oliver e Fernanda Doces & Salgados ME",
  phone: "98993100245",
  postal_code: "65086289",
  district: "Anjo da Guarda",
  state: "MA",
  city: "São Luís",
  address: "Rua Síria",
  number: "130",
  complement: nil,
  invoicing: 8574.20
}

Repo.insert!(client2)

client3 = %Client{
  company_name: "Andreia e Maya Telecomunicações Ltda",
  phone: "71985142972",
  postal_code: "41680410",
  district: "Patamares",
  state: "BA",
  city: "Salvador",
  address: "Rua Pequiá",
  number: "767",
  complement: nil,
  invoicing: 12000.00,
  bank_data: %{
    accounts: [
      %{
        account: "98751",
        agency: "0001",
        bank: "Bradesco"
      }
    ]
  }
}

Repo.insert!(client3)
