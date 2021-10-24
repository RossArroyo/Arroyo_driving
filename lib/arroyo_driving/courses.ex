defmodule ArroyoDriving.Courses do
  use Ecto.Schema
  import Ecto.Changeset


  schema "courses" do
    field :title, :string
    field :price, :decimal
    field :instructor, :string
  end

end
