defmodule ArroyoDriving.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table("users") do
      add :username, :string, null: false
      add :password, :string, null: false
      add :name, :string, null: false
      add :phone, :string, null: false
      add :email, :string, null: false


    end



  end
end
