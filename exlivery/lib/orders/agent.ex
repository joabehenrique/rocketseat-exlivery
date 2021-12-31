defmodule Exlivery.Orders.Agent do
  use Agent

  alias Exlivery.Orders.Order

  def start_link, do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def increment_order(%Order{} = order) do
    uuid = UUID.uuid4()
    Agent.update(__MODULE__, fn agent_state -> Map.put(agent_state, uuid, order) end)
    {:ok, uuid}
  end

  def get_order(uuid),
    do: Agent.get(__MODULE__, fn agent_state -> get_order_uuid(agent_state, uuid) end)

  def get_all_orders, do: Agent.get(__MODULE__, fn agent_state -> agent_state end)

  defp get_order_uuid(agent_state, uuid) do
    case Map.get(agent_state, uuid) do
      nil -> {:error, "Order not found"}
      order -> {:ok, order}
    end
  end
end
