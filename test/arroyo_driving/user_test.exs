defmodule ArroyoDriving.UserTest do
  use ArroyoDriving.DataCase
  alias ArroyoDriving.Accounts

 describe "module Users.create/1" do
 #   test "should create a new user with correct params" do
  #    params = %{
   #     username: "rossarroyo1",
    #    password: "12345678",
     #   name: "Ross Arroyo",
      #  phone: "956-371-4887",
       # email: "rossarroyo@ucwv.edu"
        # }

      #assert {:ok, %{}} = Accounts.create(params)
   # end

    test "should reject creating a user with no password" do
      params = %{
        username: "rossarroyo1",
        name: "Ross Arroyo",
        phone: "956-371-4887",
        email: "rossarroyo@ucwv.edu"
      }

      assert {:error, changeset} = Accounts.create(params)
      assert "can't be blank" in errors_on(changeset).password
    end
  end
end
