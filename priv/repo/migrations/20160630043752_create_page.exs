defmodule Habitus.Repo.Migrations.CreatePage do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :title, :string
      add :content, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:pages, [:user_id])

  end
end
