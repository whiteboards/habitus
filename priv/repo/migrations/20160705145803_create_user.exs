defmodule Habitus.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :display_name, :string
      add :first_name, :string
      add :last_name, :string
      add :encrypted_password, :string
      add :email, :string

      timestamps()
    end

  end
end
