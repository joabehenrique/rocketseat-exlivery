defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent

  describe "increment_order/1" do
    setup do
      Agent.start_link()

      :ok
    end

    test "increment the order, returns ok and the uuid from de order" do
      order = build(:order)

      assert {:ok, _uuid} = Agent.increment_order(order)
    end
  end

  describe "get_order/1" do
    setup do
      Agent.start_link()

      :ok
    end

    test "when the order is found, returns the order" do
      order = build(:order)
      {:ok, uuid} = Agent.increment_order(order)

      response = Agent.get_order(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = Agent.get_order("aaabbbbccc")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
