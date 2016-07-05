defmodule Habitus.User do
  use Habitus.Web, :model

  schema "users" do
    field :display_name, :string
    field :first_name, :string
    field :last_name, :string
    field :encrypted_password, :string
    field :email, :string
    has_many :comments, Habitus.Comment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:display_name, :first_name, :last_name, :encrypted_password, :email])
    |> validate_required([:display_name, :first_name, :last_name, :encrypted_password, :email])
  end
end
