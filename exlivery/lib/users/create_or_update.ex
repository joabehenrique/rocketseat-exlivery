defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users.Agent
  alias Exlivery.Users.User

  def call(%{name: name, email: email, age: age, cpf: cpf, address: address}) do
    name
    |> User.build(email, age, cpf, address)
    |> create_user()
  end

  def create_user({:ok, user}), do: Agent.increment_user(user)
  def create_user({:error, _user}), do: {:error, "Invalid parameters"}
end
