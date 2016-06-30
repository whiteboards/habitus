defmodule Habitus.Tag do
  use Habitus.Web, :model

  schema "tags" do
    field :content, :string
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
