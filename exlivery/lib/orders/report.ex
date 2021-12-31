defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent
  alias Exlivery.Orders.Item
  alias Exlivery.Orders.Order

  def create(filename \\ "report.csv") do
    order_list = build_order()

    File.write("./lib/generated_reports/#{filename}", order_list)
  end

  defp build_order do
    Agent.get_all_orders()
    |> Map.values()
    |> Enum.map(fn order -> build_order_string(order) end)
  end

  defp build_order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    string_items = Enum.map(items, fn item -> build_items_string(item) end)
    "#{cpf},#{string_items}#{total_price}\n"
  end

  defp build_items_string(%Item{category: category, quantity: quantity, unity_price: unity_price}) do
    "#{category},#{quantity},#{unity_price},"
  end
end
