defmodule ArroyoDriving.Courses do
  use Ecto.Schema
  import Ecto.Changeset


  schema "courses" do
    field :title, :string
    field :price, :decimal
    field :instructor, :string

    belongs_to :user, User
  end



def changeset(game, attrs \\ %{}) do
  game
  |> cast(attrs, [:name, :publisher, :cover_art_url])
  end
end
