# A Plug doesn’t need to be a router—we could use this technique to include Plugs that do authentication, DOS protection, logging, and more.

defmodule Router do
  defmacro __using__(_opts) do
    quote do
      def init(options) do
        options
      end

      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end

defmodule UserRouter do
  use Router

  def route("GET", ["users", user_id], conn) do
    # this route is for /users/<user_id>
    conn |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
  end

  def route("POST", ["users"], conn) do
    # do some sort of database insertion here maybe
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end

defmodule WebsiteRouter do
  use Router
  # Output from UserRouter.init([]) is stored when WebsiteRouter is compiled
  # Compile time constant: Inserts UserRouter.init([]) output everywhere @user_router_options is used
  @user_router_options UserRouter.init([])
  def route("GET", ["users" | path], conn) do
    UserRouter.call(conn, @user_router_options)
  end

  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end

defmodule BasicTemplate do
  def route("GET", ["users", user_id], conn) do
    # template location and map of variables we can use inside the template
    page_contents = EEx.eval_file("templates/show_user.eex", user_id: user_id)

    conn
    |> Plug.Conn.put_resp_content_type("text/html")
    |> Plug.Conn.send_resp(200, page_contents)
  end
end

# In the REPL type "{:ok, _} = Plug.Adapters.Cowboy.http Helloplug, []" to connect Helloplug to cowboy
