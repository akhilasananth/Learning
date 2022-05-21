defmodule ElixirChatWeb.PageController do
  use ElixirChatWeb, :controller
  require Logger

  def index(conn, _params) do
    Logger.info("Here in the controller")
    render(conn, "index.html")
  end
end
