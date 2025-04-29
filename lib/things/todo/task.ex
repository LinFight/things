defmodule Things.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :title, :string
    field :body, :string
    field :schedule_date, :date
    field :dead_date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :body, :schedule_date, :dead_date])
    |> validate_required([:title, :body, :schedule_date, :dead_date])
  end
end
