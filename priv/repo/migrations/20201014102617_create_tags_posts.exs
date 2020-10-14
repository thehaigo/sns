defmodule Sns.Repo.Migrations.CreateTagsPosts do
  use Ecto.Migration

  def change do
    create table(:tags_posts) do
      add :tag_id, references(:tags)
      add :post_id, references(:posts)
    end

    create unique_index(:tags_posts, [:tag_id, :post_id])
  end
end
