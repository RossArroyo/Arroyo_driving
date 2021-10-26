defmodule ArroyoDriving.Repo.Migrations.Courses do
  use Ecto.Migration

  def change do
    create table ("courses") do
      add :title, :string, null false
      add :price, :decimal, null false
      add :instructor, :string, default: "No decided yet"
    end
  end
end
