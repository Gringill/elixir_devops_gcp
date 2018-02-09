defmodule ElixirDevopsGcp.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todo) do
      add :name, :string
      add :desc, :string
      add :comp, :boolean, default: false, null: false

      timestamps()
    end

  end
end
