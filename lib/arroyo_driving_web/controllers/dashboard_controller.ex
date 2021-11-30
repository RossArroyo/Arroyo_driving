defmodule ArroyoDrivingWeb.DashboardController do
  use ArroyoDrivingWeb, :controller
  alias ArroyoDriving.Accounts

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
