defmodule ArroyoDriving.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  ############################## schema function
  schema "user" do
    field :username, :string
    field :password, :string
    field :password_hash, :string

    field :name, :string
    field :phone, :string
    field :email, :string
  end

  def changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :name, :phone, :email])
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :name, :phone, :email])
    |> validate_required([:username, :password, :name, :phone, :email])
    |> validate_length(:password, min: 8)
    |> validate_length(:phone, min: 10)
    |> validate_format(:email, ~r/@/)
  end

defp put_password_hash(
  %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
) do
put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
end

defp put_password_hash(changeset) do
changeset
end
end
