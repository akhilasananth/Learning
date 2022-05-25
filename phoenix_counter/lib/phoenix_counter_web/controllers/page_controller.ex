defmodule PhoenixCounterWeb.PageController do
  use PhoenixCounterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
