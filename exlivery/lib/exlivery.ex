defmodule Exlivery do
  alias Exlivery.Users.Agent
  alias Exlivery.Users.CreateOrUpdate

  def start_agents, do: Agent.start_link()

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
end
