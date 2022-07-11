ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(BhubClients.Repo, :manual)

ExUnit.configure(timeout: :infinity)
ExUnit.start(exclude: [:skip])

{:ok, _} = Application.ensure_all_started(:ex_machina)
