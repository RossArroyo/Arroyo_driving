defmodule ArroyoDriving.Accounts do
  alias ArroyoDriving.Users
  alias ArroyoDriving.Repo



  def create(params) do
    %Users{}
    |> Users.create_changeset(params)
    |> Repo.insert()
  end


  def get(id) do
    Repo.get(Users, id)
  end
end




#Accounts.create(%{email: "rossarroyo@ucwv.edu", name: "Ross Arroyo", password: "ThisPassword", phone: "956-371-4887", username: "rossa"})
