defmodule Sns.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string

    belongs_to :user, Sns.Users.User
    has_many :images, Sns.Images.Image
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body, :user_id])
  end

  def changeset_with_image(post, attrs) do
    post
    |> cast(attrs, [:body, :user_id])
    |> cast_assoc(:images, with: { Sns.Images.Image, :insert_ids, [post] })
  end
end
