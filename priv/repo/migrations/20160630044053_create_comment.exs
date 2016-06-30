defmodule Habitus.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :string
      add :user, references(:users, on_delete: :nothing)
      add :page, references(:pages, on_delete: :nothing)

      timestamps()
    end
    create index(:comments, [:user])
    create index(:comments, [:page])

  end
end
