defmodule ElixirDevopsGcp.Data.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirDevopsGcp.Data.Todo

  schema "todo" do
    field(:comp, :boolean, default: false)
    field(:desc, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:name, :desc, :comp])
    |> validate_required([:name, :desc, :comp])
  end
end
