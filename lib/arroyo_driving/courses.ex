defmodule ArroyoDriving.Courses do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArroyoDriving.Users

  ################################## schema function
  schema "courses" do
    field :title, :string
    field :price, :decimal
    field :instructor, :string

    belongs_to :user, Users
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(courses, attrs \\ %{}) do
    courses
    |> cast(attrs, [:title, :price, :instructor])
  end
end
