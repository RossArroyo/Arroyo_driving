defmodule ArroyoDriving.Repo.Migrations.CourseIterations do
  use Ecto.Migration

  def change do
    create table("course_iterations") do
      add :title, :string, null: false
      add :season, :string, null: false
      add :instructor, :string, null: false
      timestamps()
    end
  end
end
