defmodule Bible.Repo do
  use Ecto.Repo,
    otp_app: :bible,
    adapter: Ecto.Adapters.Postgres
end
