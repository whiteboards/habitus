defmodule Habitus.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :displayName, :string
      add :firstName, :string
      add :lastName, :string
      add :email, :string
      add :encryptedPassword, :string
      add :role, :string

      timestamps()
    end

  end
end
