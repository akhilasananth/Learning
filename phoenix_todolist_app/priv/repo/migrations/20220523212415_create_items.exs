defmodule ToDoListApp.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end
  end
end
