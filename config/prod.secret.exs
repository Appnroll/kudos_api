use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :kudos_api, KudosApiWeb.Endpoint,
  secret_key_base: "PHU1+6Ww8KyiI2zJztVp/tonfVuik2PtjAdCaFKRaTD0osd3d2kji9k1+0pAe5+R"

# Configure your database
config :kudos_api, KudosApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "kudos_api_prod",
  pool_size: 15
