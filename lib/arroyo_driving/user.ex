defmodule Arroyo_Driving.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  schema "user" do
    field :username, :string
    field :password, :string
    field :name, :string
    field :phone, :string
    field :email, :string
    field :balance, :decimal
  end

  def changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :name, :phone, :email, :balance])
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :name, :phone, :email])
    |> validate_required([:username, :password, :name, :phone, :email])
    |> validate_length(:password, min: 8)
    |> validate_length(:phone, min: 10)
    |> validate_format(:email, ~r/@/)
  end
end
