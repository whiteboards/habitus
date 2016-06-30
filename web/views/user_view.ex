defmodule Habitus.UserView do
  use Habitus.Web, :view
  attributes [:id, :firstName, :lastName, :displayName, :email, :role]
  def render("index.json", %{users: users}) do
    %{data: render_many(users, Habitus.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Habitus.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      displayName: user.displayName,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      encryptedPassword: user.encryptedPassword,
      role: user.role}
  end
end
