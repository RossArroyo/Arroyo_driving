defmodule ArroyoDrivingWeb.LayoutView do
  use ArroyoDrivingWeb, :view

  alias ArroyoDriving.Users
  def is_signed_in?(conn) do
    case Map.get(conn.assigns, :authenticated_user, nil) do
      %Users{} -> true
      _ -> false
    end
  end

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
