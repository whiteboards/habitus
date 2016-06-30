defmodule Habitus.CommentView do
  use Habitus.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, Habitus.CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, Habitus.CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      content: comment.content,
      user_id: comment.user_id,
      page: comment.page}
  end
end
