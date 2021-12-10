defmodule ArroyoDrivingWeb.SessionController do
  use ArroyoDrivingWeb, :controller
  alias ArroyoDriving.Accounts.UserAuth
  alias ArroyoDriving.Users

  def new(conn, _param) do
    render(conn, "new.html", em: nil)
  end


  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    with %Users{id: id} <- UserAuth.login(email, password),
         token <- Phoenix.Token.sign(ArroyoDrivingWeb.Endpoint, "randomized_salt", id) do
      conn
      |> clear_session()
      |> configure_session(renew: true)
      |> put_session(:user_token, token)
      |> redirect(to: Routes.dashboard_path(conn, :index))
    else
      nil ->
        conn
        |> render("new.html", em: "Invalid Username and/or Password")
    end
  end


  def delete(conn, _params) do
    conn
    |> clear_session()
    |> render("new.html")
    |> halt()
  end
end
