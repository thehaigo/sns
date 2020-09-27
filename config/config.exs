# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sns,
  ecto_repos: [Sns.Repo]

config :sns, Sns.Guardian,
    issuer: "sns",
    secret_key: "T1apLIv4RGNIr4DiOBHu+XWpeWhi0JRtz30uUsX5+4YaXCAfHPLiMEuEd6IKifsj"

# Configures the endpoint
config :sns, SnsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hnJnluA4p0IkbIhziwnEvjWSNWxoJy89sSxsQiu8lsxivboPSki8JmRcjU7Qlqy/",
  render_errors: [view: SnsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sns.PubSub,
  live_view: [signing_salt: "O2wAI+SJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
