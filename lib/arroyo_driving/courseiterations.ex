defmodule ArroyoDriving.CourseIterations do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArroyoDriving.Courses

  ############################# schema function
  schema "course_iterations" do
    field :title, :string
    field :season, :string
    field :instructor, :string

    belongs_to :user, Courses

    timestamps()
  end

def changeset(course_iteration, attrs \\ %{}) do
  course_iteration
  |> cast(attrs, [:title, :season, :instructor])
  end
end
