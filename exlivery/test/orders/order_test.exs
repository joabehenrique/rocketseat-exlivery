defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, return the order" do
      user = build(:user)

      # items = build_list(3, :item)
      items = [
        build(:item),
        build(:item,
          description: "Churrasco no tempero",
          category: :hamburguer
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is not items in the order, returns an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
