defmodule ArroyoDriving.Repo.Migrations.Rmpass do
  use Ecto.Migration

  def change do
    alter table("users") do
      remove :password
    end
  end
end
