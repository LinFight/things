defmodule Things.TodoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Things.Todo` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        body: "some body",
        dead_date: ~D[2025-04-28],
        schedule_date: ~D[2025-04-28],
        title: "some title"
      })
      |> Things.Todo.create_task()

    task
  end
end
