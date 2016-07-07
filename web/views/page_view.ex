defmodule Habitus.PageView do
  use Habitus.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :content, :alias, :inserted_at, :updated_at]
  
  has_one :user,
    field: :user_id,
    type: "user"

end
