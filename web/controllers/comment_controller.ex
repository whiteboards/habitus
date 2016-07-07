defmodule Habitus.CommentController do
  use Habitus.Web, :controller

  alias Habitus.Comment
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    comments = Repo.all(Comment)
    render(conn, "index.json", data: comments)
  end

  def create(conn, %{"data" => data = %{"type" => "comment", "attributes" => _comment_params}}) do
    changeset = Comment.changeset(%Comment{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, comment} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", comment_path(conn, :show, comment))
        |> render("show.json", data: comment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    comment = Repo.get!(Comment, id)
    render(conn, "show.json", data: comment)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "comment", "attributes" => _comment_params}}) do
    comment = Repo.get!(Comment, id)
    changeset = Comment.changeset(comment, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, comment} ->
        render(conn, "show.json", data: comment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Repo.get!(Comment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(comment)

    send_resp(conn, :no_content, "")
  end

end
