defmodule ArroyoDriving.Accounts.UserAuth do
  alias ArroyoDriving.Users
  alias ArroyoDriving.Repo
  import Ecto.Query

  def login(%Users{} = users, password) do
    password_hash = users.password_hash

    if password_matches?(password, password_hash) do
      users
    else
      nil
    end
  end

  def login(email, password) do
    query =
      from u in Users,
        where: u.email == ^email

    case Repo.one(query) do
      nil -> nil
      users -> login(users, password)
    end
  end

  defp password_matches?(password, password_hash) do
    Bcrypt.verify_pass(password, password_hash)
  end
end
