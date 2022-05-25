defmodule PhoenixCounterWeb.Counter do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0)}
  end

  def handle_event("increase_counter", _, socket) do
    counter = socket.assigns[:counter] + 1
    {:noreply, assign(socket, counter: counter)}
  end

  def handle_event("decrease_counter", _, socket) do
    counter = socket.assigns[:counter] - 1
    {:noreply, assign(socket, counter: counter)}
  end

  def render(assigns) do
    ~L"""
    <div id="livecount_container">
      <h1>The count is: <%= @counter %></h1>
      <button phx-click="decrease_counter">-</button>
      <button phx-click="increase_counter">+</button>
    </div>
    """
  end

end
