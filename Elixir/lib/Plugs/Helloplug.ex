defmodule Helloplug do
  # Called once when the server is started
  def init(default_opts) do
    IO.puts("starting up Helloplug...")
    default_opts
  end

  # Called everytime a request comes in
  def call(conn, _opts) do
    # _opts here is the output of the init function. this doesn't change from request to request
    IO.puts("saying hello!")
    # connection with the client
    conn
    |> Plug.Conn.put_resp_header("Server", "Plug")
    |> Plug.Conn.send_resp(200, "Hello, world!")
  end
end

# In the REPL type "{:ok, _} = Plug.Adapters.Cowboy.http Helloplug, []" to connect Helloplug to cowboy
