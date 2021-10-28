defmodule ArroyoDriving.Courses do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArroyoDriving.User

  schema "courses" do
    field :title, :string
    field :price, :decimal
    field :instructor, :string

    belongs_to :user, User
  end



def changeset(game, attrs \\ %{}) do
  game
  |> cast(attrs, [:title, :price, :instructor])
  end
end
