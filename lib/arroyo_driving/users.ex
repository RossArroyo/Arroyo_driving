defmodule ArroyoDriving.Users do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  ############################## schema function
  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    field :name, :string
    field :phone, :string
    field :email, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = users, attrs) do
    users
    |> cast(attrs, [:username, :password, :name, :phone, :email])
    |> put_password_hash()
  end

  def create_changeset(%__MODULE__{} = users, attrs) do
    users
    |> cast(attrs, [:username, :password, :name, :phone, :email])
    |> validate_required([:username, :password, :name, :phone, :email])
    |> validate_length(:password, min: 8)
    |> validate_length(:phone, min: 10)
    |> validate_format(:email, ~r/@/)
    |> put_password_hash()
    |> unique_constraint(:email)
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
