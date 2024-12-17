defmodule Store.Item do
  use Ecto.Schema

  schema "item" do
    field(:name, :string)
    field(:price, :float)
    field(:picture_url, :string)
  end

  def changeset(item, params \\ %{}) do
    item
    |> Ecto.Changeset.cast(params, [:name, :price, :picture_url])
    |> Ecto.Changeset.validate_required([:name, :price])
  end
end
