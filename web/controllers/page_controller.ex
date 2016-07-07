defmodule Habitus.PageController do
  use Habitus.Web, :controller

  alias Habitus.Page
  alias JaSerializer.Params
  #plug Guardian.Plug.EnsureAuthenticated, handler: Habitus.AuthErrorHandler
  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    pages = Repo.all(Page)
    render(conn, "index.json", data: pages)
  end

  def create(conn, %{"data" => data = %{"type" => "pages", "attributes" => _page_params}}) do
    changeset = Page.changeset(%Page{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, page} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", page_path(conn, :show, page))
        |> render("show.json", data: page)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    page = Repo.get_by!(Page, alias: id)
    render(conn, "show.json", data: page)
  end
  
  #def show_alias(conn, %{"alias" => alias}) do
  #  page = Repo.get!(Page, alias)
  #  render(conn, "show.json", data: page)
  #end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "pages", "attributes" => _page_params}}) do
    page = Repo.get!(Page, id)
    changeset = Page.changeset(page, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, page} ->
        render(conn, "show.json", data: page)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Habitus.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    page = Repo.get!(Page, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(page)

    send_resp(conn, :no_content, "")
  end

end
