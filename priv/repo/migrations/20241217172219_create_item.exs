defmodule Store.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:item) do
      add :name, :string
      add :price, :float
      add :picture_url, :string
    end
  end
end
