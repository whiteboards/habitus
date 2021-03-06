defmodule Habitus.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :content, :string
      add :page_id, references(:pages, on_delete: :nothing)

      timestamps()
    end
    create index(:tags, [:page_id])

  end
end
