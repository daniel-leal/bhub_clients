defmodule BhubClients.Data.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [
    :company_name,
    :phone,
    :invoicing
  ]

  @derive {Jason.Encoder, except: [:__meta__]}

  schema "clients" do
    field(:company_name, :string)
    field(:phone, :string)
    field(:postal_code, :string)
    field(:district, :string)
    field(:state, :string)
    field(:city, :string)
    field(:address, :string)
    field(:number, :string)
    field(:complement, :string)
    field(:invoicing, :decimal)
    field(:bank_data, :map)
    field(:disabled_at, :utc_datetime_usec)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(
      params,
      @required_params ++
        [
          :postal_code,
          :district,
          :state,
          :city,
          :address,
          :number,
          :complement,
          :bank_data,
          :complement,
          :disabled_at
        ]
    )
    |> validate_required(@required_params)
    |> validate_format(:postal_code, ~r/\d{8}$/)
    |> unique_constraint([:company_name])
  end
end
