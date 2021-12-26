defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Orders.Order
  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Avenida Professor Duarte, n 89",
      age: 22,
      cpf: "16295096719",
      email: "joabe.souza@hotmail.com",
      name: "JOabe Henrique"
    }
  end

  def item_factory do
    %Item{
      description: "Burito de Frango",
      category: :prato_feito,
      unity_price: Decimal.new("56.89"),
      quantity: 2
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Avenida Professor Duarte, n 89",
      items: [
        %Item{
          category: :prato_feito,
          description: "Burito de Frango",
          quantity: 2,
          unity_price: Decimal.new("56.89")
        },
        %Item{
          category: :hamburguer,
          description: "Churrasco no tempero",
          quantity: 2,
          unity_price: Decimal.new("56.89")
        }
      ],
      total_price: Decimal.new("227.56"),
      user_cpf: "16295096719"
    }
  end
end
