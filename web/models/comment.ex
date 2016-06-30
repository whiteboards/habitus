defmodule Habitus.Comment do
  use Habitus.Web, :model

  schema "comments" do
    field :content, :string
    belongs_to :user, Habitus.User
    belongs_to :page, Habitus.Page

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
