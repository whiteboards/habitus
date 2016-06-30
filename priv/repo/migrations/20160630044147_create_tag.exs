defmodule Habitus.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :content, :string
      add :page, references(:pages, on_delete: :nothing)

      timestamps()
    end
    create index(:tags, [:page])

  end
end
