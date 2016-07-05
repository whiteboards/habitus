defmodule Habitus.AuthErrorHandler do
 use Habitus.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(Habitus.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(Habitus.ErrorView, "403.json")
 end
end