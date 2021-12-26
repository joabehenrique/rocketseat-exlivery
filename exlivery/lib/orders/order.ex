defmodule Exlivery.Orders.Order do
  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys

  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       items: items,
       total_price: calculate_total_price_items(items)
     }}
  end

  def build(_user, _items), do: {:error, "Entrada Invalida."}

  defp calculate_total_price_items(items) do
    Enum.reduce(items, Decimal.new("0.00"), fn item, acc -> sum_prices(item, acc) end)
  end

  defp sum_prices(%Item{unity_price: unity_price, quantity: quantity}, acc) do
    unity_price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)
  end
end
