defmodule Habitus.UserView do
  use Habitus.Web, :view
  use JaSerializer.PhoenixView

  attributes [:display_name, :first_name, :last_name, :email, :password_hash, :role, :inserted_at, :updated_at]
  

end
