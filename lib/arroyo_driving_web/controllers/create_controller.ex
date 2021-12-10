defmodule ArroyoDrivingWeb.CreateController do
  use ArroyoDrivingWeb, :controller
  alias ArroyoDriving.Accounts

  def new(conn, _params) do
    render(conn, "create.html")

  end

  def put_token(conn, user_id) do
     token = Phoenix.Token.sign(ArroyoDrivingWeb.Endpoint, "randomized_salt", user_id)
      conn
      |> clear_session()
      |> configure_session(renew: true)
      |> put_session(:user_token, token)
  end
  def create(conn, %{"users" => %{"email" => _email, "name" => _name, "password" => _password}} = params
    ) do
      user_params = params["users"]
      {:ok, %{id: id}}=Accounts.create(user_params)
      conn
      |> put_token(id)
      |> redirect(to: Routes.dashboard_path(conn,:index))
    end


  end
