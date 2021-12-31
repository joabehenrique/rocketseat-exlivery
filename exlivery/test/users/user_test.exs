defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, return the user" do
      response =
        User.build(
          "JOabe Henrique",
          "joabe.souza@hotmail.com",
          22,
          "12345678900",
          "Avenida Professor Duarte, n 89"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "JOabe Henrique",
          "joabe.souza@hotmail.com",
          14,
          "12345678900",
          "Avenida Professor Duarte, n 89"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
