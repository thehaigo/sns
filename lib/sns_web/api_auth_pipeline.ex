defmodule SnsWeb.ApiAuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :sns,
    module: Sns.Guardian,
    error_handler: SnsWeb.ApiAuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
