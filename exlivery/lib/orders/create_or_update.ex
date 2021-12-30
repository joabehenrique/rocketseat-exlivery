defmodule Exlivery.Orders.CreateOrUpdate do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Item
  alias Exlivery.Orders.Order
  alias Exlivery.Users.Agent, as: UserAgent

  def call(%{user_cpf: user_cpf, item: items}) do
    with {:ok, user} <- UserAgent.get_user(user_cpf),
         {:ok, item} <- build_items(items),
         {:ok, order} <- Order.build(user, item) do
      OrderAgent.increment_order(order)
    else
      error -> error
    end
  end

  defp build_items(items) do
    items
    |> Enum.map(fn item -> build_item(item) end)
    |> validade_items()
  end

  defp build_item(%{
         description: description,
         category: category,
         unity_price: unity_price,
         quantity: quantity
       }) do
    case Item.build(description, category, unity_price, quantity) do
      {:ok, item} -> item
      {:error, _} = error -> error
    end
  end

  defp validade_items(items) do
    if Enum.all?(items, fn item -> is_struct(item) end),
      do: {:ok, items},
      else: {:error, "Invalid Items"}
  end
end
