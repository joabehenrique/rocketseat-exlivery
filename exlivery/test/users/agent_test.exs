defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent
  alias Exlivery.Users.User

  describe "increment_user/1" do
    setup do
      Agent.start_link()

      :ok
    end

    test "increment the user" do
      user = build(:user)

      assert Agent.increment_user(user) == :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build()
      |> Agent.increment_user()

      response = Agent.get_user("12345678900")

      expected_response =
        {:ok,
         %User{
           address: "Avenida Professor Duarte, n 89",
           age: 22,
           cpf: "12345678900",
           email: "joabe.souza@hotmail.com",
           name: "JOabe Henrique"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      :user
      |> build()
      |> Agent.increment_user()

      response = Agent.get_user("000000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
