defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      OrderAgent.start_link()
      UserAgent.start_link()

      :ok
    end

    test "when the params are valid, increment the order" do
      user = build(:user)
      item = build(:item)

      UserAgent.increment_user(user)

      response = CreateOrUpdate.call(%{user_cpf: "12345678900", item: [item]})

      assert {:ok, __uuid} = response
    end

    test "when there is no user with given cpf, returns an error" do
      item = build(:item)

      response = CreateOrUpdate.call(%{user_cpf: "00000000000", item: [item]})

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end

    test "when there are invalid itens, returns an error" do
      user = build(:user)
      item = build(:item)

      UserAgent.increment_user(user)

      response = CreateOrUpdate.call(%{user_cpf: "12345678900", item: [%{item | quantity: 0}]})

      expected_response = {:error, "Invalid Items"}

      assert response == expected_response
    end

    test "when no items are passed as params, returns an error" do
      user = build(:user)

      UserAgent.increment_user(user)

      response = CreateOrUpdate.call(%{user_cpf: "12345678900", item: []})

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
