defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, return the user" do
      response = Item.build("Burito de Frango", :prato_feito, "56.89", 2)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there are invalid category, returns an error" do
      response = Item.build("Burito de Frango", :americana, "56.89", 2)

      expected_response = {:error, "Invalid quantity or category"}

      assert response == expected_response
    end

    test "when there is invalid price, return an error" do
      response = Item.build("Burito de Frango", :pizza, "price_pizza", 2)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is invalid quantity, return an error" do
      response = Item.build("Burito de Frango", :pizza, "56.89", -12)

      expected_response = {:error, "Invalid quantity or category"}

      assert response == expected_response
    end
  end
end
