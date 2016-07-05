defmodule Habitus.UserView do
  use Habitus.Web, :view
  use JaSerializer.PhoenixView

  attributes [:display_name, :first_name, :last_name, :email, :password_hash, :inserted_at, :updated_at]
  

end
