defmodule Things.Repo do
  use Ecto.Repo,
    otp_app: :things,
    adapter: Ecto.Adapters.SQLite3
end
