defmodule Sns.Images.Image do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :file, Sns.Image.Type

    belongs_to :post, Sns.Posts.Post
    belongs_to :user, Sns.Users.User

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:post_id, :user_id])
    |> cast_attachments(attrs,[:file])
    |> validate_required([:file])
  end

  def insert_ids(image, params, post) do
    image
    |> Map.put(:user_id, post.user_id)
    |> Map.put(:post_id, post.id)
    |> changeset(params)
  end
end
