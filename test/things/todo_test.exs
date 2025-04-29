defmodule Things.TodoTest do
  use Things.DataCase

  alias Things.Todo

  describe "tasks" do
    alias Things.Todo.Task

    import Things.TodoFixtures

    @invalid_attrs %{title: nil, body: nil, schedule_date: nil, dead_date: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Todo.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Todo.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{title: "some title", body: "some body", schedule_date: ~D[2025-04-28], dead_date: ~D[2025-04-28]}

      assert {:ok, %Task{} = task} = Todo.create_task(valid_attrs)
      assert task.title == "some title"
      assert task.body == "some body"
      assert task.schedule_date == ~D[2025-04-28]
      assert task.dead_date == ~D[2025-04-28]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todo.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body", schedule_date: ~D[2025-04-29], dead_date: ~D[2025-04-29]}

      assert {:ok, %Task{} = task} = Todo.update_task(task, update_attrs)
      assert task.title == "some updated title"
      assert task.body == "some updated body"
      assert task.schedule_date == ~D[2025-04-29]
      assert task.dead_date == ~D[2025-04-29]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Todo.update_task(task, @invalid_attrs)
      assert task == Todo.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Todo.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todo.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Todo.change_task(task)
    end
  end
end
