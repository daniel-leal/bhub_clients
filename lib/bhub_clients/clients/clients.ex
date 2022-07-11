defmodule BhubClients.Clients do
  @moduledoc """
  The Clients Context
  """

  alias BhubClients.Clients.Create
  alias BhubClients.Clients.Disable
  alias BhubClients.Clients.Update

  @doc """
  Creates a client

  ## Parameters

    - company_name: String that represents `Razão Social`
    - phone: String that represents `Telefone`
    - postal_code: String that represents `CEP`
    - district: String that represents `Bairro`
    - state: String that represents `Estado`
    - city: String that represents `Cidade`
    - address: String that represents `Endereço`
    - number: String that represents `Número`
    - complement: String that represents `Complemento`
    - invoicing: Decimal that represents `Faturamento`
    - bank_data: String that represents `Dados bancários`
  """
  defdelegate create(params), to: Create, as: :call

  @doc """
  Disables a client by id. e.g Set disabled_at to now()
  """
  defdelegate disable(id), to: Disable, as: :call

  @doc """
  Updates a client

  ## Parameters

    - id: Binary Id tha represents `client id`
    - company_name: String that represents `Razão Social`
    - phone: String that represents `Telefone`
    - postal_code: String that represents `CEP`
    - district: String that represents `Bairro`
    - state: String that represents `Estado`
    - city: String that represents `Cidade`
    - address: String that represents `Endereço`
    - number: String that represents `Número`
    - complement: String that represents `Complemento`
    - invoicing: Decimal that represents `Faturamento`
    - bank_data: String that represents `Dados bancários`
  """
  defdelegate update(id, params), to: Update, as: :call
end
