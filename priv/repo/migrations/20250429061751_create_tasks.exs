defmodule Things.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :body, :text
      add :schedule_date, :date
      add :dead_date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
