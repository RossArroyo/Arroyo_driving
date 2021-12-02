defmodule ArroyoDrivingWeb.DashboardController do
  use ArroyoDrivingWeb, :controller
  alias ArroyoDriving.{Accounts, Users}

  def index(conn, %{"users_id" => users_id} = _params) do
    with %Users{} = users <- Accounts.get(users_id) do

      render(conn, "index.html", account: users)
    else
      nil ->
        conn
        |> put_status(404)
        |> render(:"404")



    end
  end
end
