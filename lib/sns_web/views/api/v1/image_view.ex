defmodule SnsWeb.Api.V1.ImageView do
  use SnsWeb, :view
  alias SnsWeb.Api.V1.ImageView

  def render("index.json", %{images: images}) do
    %{data: render_many(images, ImageView, "image.json")}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{
      id: image.id,
      file: Sns.Image.url({image.file, image}, :thumb),
      post_id: image.post_id,
      user_id: image.user_id
    }
  end
end
