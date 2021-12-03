defmodule ArroyoDrivingWeb.DashboardController do
  use ArroyoDrivingWeb, :controller
  alias ArroyoDriving.{Accounts, Users}

  plug :authenticate_user

  def index(%{assigns: %{authenticated_user: users}} = conn, _params) do
    render(conn, "index.html", account: users)
  end

  def authenticate_user(conn, _opts) do
    token = get_session(conn, :user_token)
    {:ok, id} = Phoenix.Token.verify(ArroyoDrivingWeb.Endpoint, "randomized_salt", token)
    assign(conn, :authenticated_user, Accounts.get(id))
  end
end
