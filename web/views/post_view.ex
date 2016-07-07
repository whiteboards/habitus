defmodule Habitus.PostView do
  use Habitus.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :content, :inserted_at, :updated_at]
  
  has_one :user,
    field: :user_id,
    type: "user"
    
  has_many :comment,
    field: :comments,
    type: "comment"
    
  has_many :tag,
    field: :tags,
    type: "tag"

end
