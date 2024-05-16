defmodule :"Elixir.Pento.Repo.Migrations.Update rating index to unique" do
  use Ecto.Migration

  def up do
    drop_if_exists index(:ratings, [:user_id, :product_id], name: :index_ratings_on_user_product)
    create unique_index(:ratings, [:user_id, :product_id], name: :index_ratings_on_user_product)
  end

  def down do
    drop_if_exists unique_index(:ratings, [:user_id, :product_id],
                     name: :index_ratings_on_user_product
                   )

    create index(:ratings, [:user_id, :product_id], name: :index_ratings_on_user_product)
  end
end
