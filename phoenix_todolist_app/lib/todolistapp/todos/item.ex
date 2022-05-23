defmodule ToDoListApp.Todos.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :done, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :done])
    |> validate_required([:name, :done])
  end
end
