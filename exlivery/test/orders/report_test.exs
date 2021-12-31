defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent
  alias Exlivery.Orders.Report

  describe "create/1" do
    setup do
      Agent.start_link()

      :ok
    end

    test "create the report file" do
      :order
      |> build()
      |> Agent.increment_order()

      :order
      |> build()
      |> Agent.increment_order()

      Report.create()

      response = File.read!("./lib/generated_reports/report.csv")

      expected_response =
        "12345678900,prato_feito,2,56.89,hamburguer,2,56.89,227.56\n12345678900,prato_feito,2,56.89,hamburguer,2,56.89,227.56\n"

      assert response == expected_response
    end
  end
end
