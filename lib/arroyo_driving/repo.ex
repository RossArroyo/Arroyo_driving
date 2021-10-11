defmodule ArroyoDriving.Repo do
  use Ecto.Repo,
    otp_app: :arroyo_driving,
    adapter: Ecto.Adapters.Postgres
end
