defmodule Habitus.PageControllerTest do
  use Habitus.ConnCase

  alias Habitus.Page
  alias Habitus.Repo

  @valid_attrs %{alias: "some content", content: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end
  
  defp relationships do 
    user = Repo.insert!(%Habitus.User{})

    %{
      "user" => %{
        "data" => %{
          "type" => "user",
          "id" => user.id
        }
      },
    }
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, page_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = get conn, page_path(conn, :show, page)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{page.id}"
    assert data["type"] == "page"
    assert data["attributes"]["title"] == page.title
    assert data["attributes"]["content"] == page.content
    assert data["attributes"]["alias"] == page.alias
    assert data["attributes"]["user_id"] == page.user_id
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, page_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, page_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "page",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Page, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, page_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "page",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = put conn, page_path(conn, :update, page), %{
      "meta" => %{},
      "data" => %{
        "type" => "page",
        "id" => page.id,
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Page, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = put conn, page_path(conn, :update, page), %{
      "meta" => %{},
      "data" => %{
        "type" => "page",
        "id" => page.id,
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = delete conn, page_path(conn, :delete, page)
    assert response(conn, 204)
    refute Repo.get(Page, page.id)
  end

end
