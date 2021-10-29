defmodule ArroyoDriving.Instructors do
  use Ecto.Schema
  import Ecto.Changeset

  ################################# schema function
  schema "instructors" do
   field :name, :string
   field :phone, :string
   field :email, :string

  end

def changeset(instructors, attrs \\ %{}) do
  instructors
  |> cast(attrs, [:name, :phone, :email])
  end
end
