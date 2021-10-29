defmodule ArroyoDriving.Repo.Migrations.Courses do
  use Ecto.Migration

  def change do
    create table("instructors") do
      add :name, :string, null: false
      add :phone, :string
      add :email, :string, null: false
      timestamps()
    end

    create table("courses") do
      add :title, :string, null: false
      add :price, :decimal, null: false
      add :instructor, references("instructors")
      timestamps()
    end
  end
end
