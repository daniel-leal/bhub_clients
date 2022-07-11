defmodule BhubClients.Repo.Migrations.AddDisabledAtToClients do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add(:disabled_at, :utc_datetime_usec)
    end
  end
end
