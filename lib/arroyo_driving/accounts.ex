defmodule ArroyoDriving.Accounts do
  alias ArroyoDriving.User
  alias ArroyoDriving.Repo

  @spec create(:invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) :: any
  def create(params) do
    %User{}
    |> User.create_changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    Repo.get(User, id)
  end
end
