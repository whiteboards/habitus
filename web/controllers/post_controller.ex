defmodule Habitus.PostController do
  use Habitus.Web, :controller

  alias Habitus.Post
  alias JaSerializer.Params
  plug Guardian.Plug.EnsureAuthenticated, handler: Habitus.AuthErrorHandler
  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.json", data: posts)
  end

  def create(conn, %{"data" => data = %{"type" => "post", "attributes" => _post_params}}) do
    changeset = Post.changeset(%Post{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", post_path(conn, :show, post))
        |> render("show.json", data: post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", data: post)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "post", "attributes" => _post_params}}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, post} ->
        render(conn, "show.json", data: post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(post)

    send_resp(conn, :no_content, "")
  end

end
