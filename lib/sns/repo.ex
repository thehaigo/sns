defmodule Sns.Repo do
  use Ecto.Repo,
    otp_app: :sns,
    adapter: Ecto.Adapters.Postgres
end
