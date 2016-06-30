defmodule Habitus.TagView do
  use Habitus.Web, :view

  def render("index.json", %{tags: tags}) do
    %{data: render_many(tags, Habitus.TagView, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{data: render_one(tag, Habitus.TagView, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    %{id: tag.id,
      content: tag.content,
      page: tag.page}
  end
end
