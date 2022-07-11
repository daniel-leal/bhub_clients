defmodule BhubClientsWeb.Router do
  use BhubClientsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BhubClientsWeb do
    pipe_through :api

    resources "/clients", ClientsController, except: [:new, :edit]
  end

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :bhub_clients,
      swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      basePath: "/api",
      schemes: ["http"],
      info: %{
        version: "1.0",
        title: "Bhub Clients",
        description: "API Documentation for BHub Clients v1",
        termsOfService: "Open for public",
        contact: %{
          name: "Daniel Leal",
          email: "danielleal94@gmail.com"
        }
      },
      consumes: ["application/json"],
      produces: ["application/json"],
      tags: [
        %{name: "Clients", description: "Client resources"}
      ]
    }
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BhubClientsWeb.Telemetry
    end
  end

  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
