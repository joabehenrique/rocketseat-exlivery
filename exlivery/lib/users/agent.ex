defmodule Exlivery.Users.Agent do
  use Agent

  alias Exlivery.Users.User

  def start_link(), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def increment_user(%User{} = user),
    do: Agent.update(__MODULE__, fn agent_state -> increment(agent_state, user) end)

  def get_user(cpf),
    do: Agent.get(__MODULE__, fn agent_state -> get_user_cpf(agent_state, cpf) end)

  defp increment(agent_state, %User{cpf: cpf} = user), do: Map.put(agent_state, cpf, user)

  defp get_user_cpf(agent_state, cpf) do
    case Map.get(agent_state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
