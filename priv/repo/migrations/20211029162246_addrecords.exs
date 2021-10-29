defmodule ArroyoDriving.Repo.Migrations.Addrecords do
  use Ecto.Migration

  def change do
    create table("records") do
      add :balance, :decimal, null: false
      add :goodstanding, :boolean, null: false

      timestamps()
    end

  end
end
