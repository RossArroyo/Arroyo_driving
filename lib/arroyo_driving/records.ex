defmodule ArroyoDriving.Records do
  use Ecto.Schema
  import Ecto.Changeset

  ################################# schema function
  schema "records" do
    field :balance, :decimal
    field :coursescompleted, :string
    field :goodstanding, :boolean
  end


  def changeset(records, attrs \\ %{}) do
    records
    |> cast(attrs, [:balance, :goodstanding])
  end
end
