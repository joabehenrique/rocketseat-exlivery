defmodule Exlivery.Users.User do
  @keys [:name, :email, :cpf, :age, :address]
  @enforce_keys @keys

  defstruct @keys

  def build(nome, email, idade, cpf, address) when idade >= 18 do
    {:ok,
     %__MODULE__{
       name: nome,
       email: email,
       age: idade,
       cpf: cpf,
       address: address
     }}
  end

  def build(_nome, _email, _idade, _cpf, _address), do: {:error, "Entrada Invalida."}
end
