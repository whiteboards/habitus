defmodule Habitus.RegistrationController do
  use Habitus.Web, :controller

  alias Habitus.User

  def create(conn, %{"data" => %{"type" => "user",
    "attributes" => %{"display_name" => display_name,
    "first_name" => first_name,
    "last_name" => last_name,
    "email" => email,
    "password" => password,
    "password-confirmation" => password_confirmation}}}) do
    changeset = User.changeset %User{}, %{display_name: display_name,
      first_name: first_name,
      last_name: last_name,
      email: email,
      password_confirmation: password_confirmation,
      password: password}
    
    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Habitus.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end

  end
end