defmodule BhubClients.Repo do
  use Ecto.Repo,
    otp_app: :bhub_clients,
    adapter: Ecto.Adapters.Postgres
end
