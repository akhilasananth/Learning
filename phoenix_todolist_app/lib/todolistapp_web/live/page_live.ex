defmodule ToDoListAppWeb.PageLive do
  use ToDoListAppWeb, :live_view
  alias ToDoListApp.Todos

  @impl true
  def mount(_params, _session, socket) do
    items = ToDos.list_items()

    {:ok, assign(socket, items: items, editing: %{id: 0, name: ""})}
  end
end
