defmodule Habitus.Page do
  use Habitus.Web, :model

  schema "pages" do
    field :title, :string
    field :content, :string
    belongs_to :user, Habitus.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :content])
    |> validate_required([:title, :content])
  end
end
