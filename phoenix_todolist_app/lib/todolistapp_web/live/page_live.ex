defmodule ToDoListAppWeb.PageLive do
  use ToDoListAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
