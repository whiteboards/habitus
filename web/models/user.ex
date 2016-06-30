defmodule Habitus.User do
  use Habitus.Web, :model

  schema "users" do
    field :displayName, :string
    field :firstName, :string
    field :lastName, :string
    field :email, :string
    field :encryptedPassword, :string
    field :role, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:displayName, :firstName, :lastName, :email, :encryptedPassword, :role])
    |> validate_required([:displayName, :firstName, :lastName, :email, :encryptedPassword, :role])
  end
end
