defmodule Habitus.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :page_id, references(:pages, on_delete: :nothing)

      timestamps()
    end
    create index(:comments, [:user_id])
    create index(:comments, [:page_id])

  end
end
