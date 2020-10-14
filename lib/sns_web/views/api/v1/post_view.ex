defmodule SnsWeb.Api.V1.PostView do
  use SnsWeb, :view
  alias SnsWeb.Api.V1.PostView
  alias SnsWeb.Api.V1.ImageView
  alias SnsWeb.Api.V1.TagView
  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("tags.json", %{post: post}) do
    %{data: render_many(post.tags, TagView, "tag.json")}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      body: post.body,
      images: render_many(post.images, ImageView, "image.json"),
    }
  end
end
