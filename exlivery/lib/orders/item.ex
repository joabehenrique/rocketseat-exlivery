defmodule Exlivery.Orders.Item do
  @keys [:description, :category, :unity_price, :quantity]
  @categories [:pizza, :hamburguer, :carne, :prato_feito, :japonesa, :sobremesa]

  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when quantity > 0 and category in @categories do
    unity_price
    |> Decimal.cast()
    |> build_item(description, category, quantity)
  end

  def build(_description, _category, _unity_price, _quantity), do: {:error, "Entrada Invalida."}

  defp build_item({:ok, unity_price}, description, category, quantity) do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end

  defp build_item(:error, _description, _category, _quantity),
    do: {:error, "Preço Invalido."}
end
