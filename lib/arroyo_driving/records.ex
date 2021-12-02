defmodule ArroyoDriving.Records do
  use Ecto.Schema
  import Ecto.Changeset

  ################################# schema function
  schema "records" do
    field :balance, :decimal
    field :coursescompleted, :string
    field :goodstanding, :boolean
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(records, attrs \\ %{}) do
    records
    |> cast(attrs, [:balance, :goodstanding])
  end
end
