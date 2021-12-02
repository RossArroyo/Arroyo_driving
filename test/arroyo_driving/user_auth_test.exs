defmodule ArroyoDriving.UserAuthTest do
  use ArroyoDriving.DataCase
  alias ArroyoDriving.{Accounts, Users}
  alias ArroyoDriving.Accounts.UserAuth

  describe "UserAauth.login/2" do
    test "Login should go through allow user access" do
      password= "ThisPassword"
      params = %{
        username: "rossarroyo1",
        password: password,
        name: "Ross Arroyo",
        phone: "956-371-4887",
        email: "rossarroyo@ucwv.edu"
      }
      assert {:ok,  %{email: email}} = Accounts.create(params)
      assert %Users{email: ^email} = UserAuth.login(email, password)
    end
  end
end
