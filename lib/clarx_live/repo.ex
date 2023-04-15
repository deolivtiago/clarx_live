defmodule ClarxLive.Repo do
  use Ecto.Repo,
    otp_app: :clarx_live,
    adapter: Ecto.Adapters.Postgres
end
