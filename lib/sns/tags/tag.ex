defmodule Sns.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string

    belongs_to :user, Sns.Users.User
    many_to_many :posts,
                 Sns.Posts.Post,
                 join_through: "tags_posts",
                 on_replace: :delete,
                 on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
