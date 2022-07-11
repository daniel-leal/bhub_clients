defmodule BhubClients.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :company_name, :string
      add :phone, :string
      add :postal_code, :string
      add :district, :string
      add :state, :string
      add :city, :string
      add :address, :string
      add :number, :string
      add :complement, :string
      add :invoicing, :decimal
      add :bank_data, :jsonb, null: false, default: "{}"

      timestamps()
    end

    create unique_index(:clients, [:company_name])
  end
end
