defmodule Habitus.CommentView do
  use Habitus.Web, :view
  use JaSerializer.PhoenixView

  attributes [:content, :inserted_at, :updated_at]
  
  has_one :user,
    field: :user_id,
    type: "user"
  has_one :page,
    field: :page_id,
    type: "page"

end
