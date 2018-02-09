defmodule ElixirDevopsGcp.DataTest do
  use ElixirDevopsGcp.DataCase

  alias ElixirDevopsGcp.Data

  describe "todo" do
    alias ElixirDevopsGcp.Data.Todo

    @valid_attrs %{comp: true, desc: "some desc", name: "some name"}
    @update_attrs %{comp: false, desc: "some updated desc", name: "some updated name"}
    @invalid_attrs %{comp: nil, desc: nil, name: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_todo()

      todo
    end

    test "list_todo/0 returns all todo" do
      todo = todo_fixture()
      assert Data.list_todo() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Data.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Data.create_todo(@valid_attrs)
      assert todo.comp == true
      assert todo.desc == "some desc"
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, todo} = Data.update_todo(todo, @update_attrs)
      assert %Todo{} = todo
      assert todo.comp == false
      assert todo.desc == "some updated desc"
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_todo(todo, @invalid_attrs)
      assert todo == Data.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Data.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Data.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Data.change_todo(todo)
    end
  end
end
