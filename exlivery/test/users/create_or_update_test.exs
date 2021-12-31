defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      Agent.start_link()

      :ok
    end

    test "when the params are valid, increment the user" do
      params = %{
        name: "Joabe",
        email: "henriqueciido@hotmail.com",
        age: 22,
        cpf: "12345678900",
        address: "Avenida Paulista"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Sucessful User Creation or Update"}

      assert response == expected_response
    end

    test "when there params is invalid, returns an error" do
      params = %{
        name: "Joabe",
        email: "henriqueciido@hotmail.com",
        age: 12,
        cpf: "12345678900",
        address: "Avenida Paulista"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
