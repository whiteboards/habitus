defmodule Habitus.TagControllerTest do
  use Habitus.ConnCase

  alias Habitus.Tag
  alias Habitus.Repo

  @valid_attrs %{content: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end
  
  defp relationships do 
    page = Repo.insert!(%Habitus.Page{})

    %{
      "page" => %{
        "data" => %{
          "type" => "page",
          "id" => page.id
        }
      },
    }
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tag_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = get conn, tag_path(conn, :show, tag)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{tag.id}"
    assert data["type"] == "tag"
    assert data["attributes"]["content"] == tag.content
    assert data["attributes"]["page_id"] == tag.page_id
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, tag_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, tag_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "tag",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Tag, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tag_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "tag",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = put conn, tag_path(conn, :update, tag), %{
      "meta" => %{},
      "data" => %{
        "type" => "tag",
        "id" => tag.id,
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Tag, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = put conn, tag_path(conn, :update, tag), %{
      "meta" => %{},
      "data" => %{
        "type" => "tag",
        "id" => tag.id,
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = delete conn, tag_path(conn, :delete, tag)
    assert response(conn, 204)
    refute Repo.get(Tag, tag.id)
  end

end
