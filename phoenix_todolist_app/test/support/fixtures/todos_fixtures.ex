defmodule ToDoListApp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ToDoListApp.Todos` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        done: true,
        name: "some name"
      })
      |> ToDoListApp.Todos.create_item()

    item
  end
end
