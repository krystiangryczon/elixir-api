defmodule Store do
  def get_all do
    Store.Item
    |> Store.Repo.all()
    |> Enum.map(fn item -> %{name: item.name, price: item.price} end)
  end
end
