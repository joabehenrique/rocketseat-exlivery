# Exlivery

![GitHub repo size](https://img.shields.io/github/repo-size/joabehenrique/rocketseat-exlivery?style=flat)
![GitHub language count](https://img.shields.io/github/languages/count/joabehenrique/rocketseat-exlivery?style=flat)
![GitHub forks](https://img.shields.io/github/forks/joabehenrique/rocketseat-exlivery?style=flat)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/joabehenrique/rocketseat-exlivery?style=flat)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/joabehenrique/rocketseat-exlivery?style=flat)

> Simple project developed during the Elixir track on the Rocketseat platform.

## 💻 Requirements

Before you begin, make sure you have met the following requirements:

- You need the latest version of `Elixir\Erlang` on your machine.

If you need installation instructions, [click here]("https://elixir-lang.org/install.html").

## 🚀 Installing Exlivery

To install Exlivery, follow these steps:

1º Clone the repository.

```
>  git clone https://github.com/joabehenrique/rocketseat-exlivery.git
```

2º Navigate to the project folder.

```
>  cd rocketseat-exlivery/exlivery
```

3º Use the command below to download the dependencies.

```
>  mix deps.get
```

4º Use the command below to run the project.

```
>  iex -S mix
```

## ☕ Using Exlivery

To use Exlivery, follow these steps:

Creating a user and your application. _(Age >=18)_

```
>  Exlivery.start_agents()
```

```
>  {:ok, user} = Exlivery.Users.User.build("name", "email", age, "cpf", "address")

>  Exlivery.create_or_update_user(user)
```

Before creating my order I need to tell you what I want in this order.

(_Possible Categories_ `:pizza`, `:hamburguer`, `:carne`, `:prato_feito`, `:japonesa`, `:sobremesa`.)

```
>  {:ok, item} = Exlivery.Orders.Item.build("description-item", category, "price-unity", "quantity")
```

Creating the order for my user.

```
>  Exlivery.create_or_update_order(%{user_cpf: "cpf", item: [item]})
```

Generating a report with my user information and their order.

_( File name is optional. It is saved inside ./lib/generated-reports/name-report.csv)_

```
>  Exlivery.Orders.Report.create("name-report.csv")
```

## 📫 Contributing to Exlivery

To contribute to Exlivery, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <nome_branch>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Send to the original branch: `git push origin Exlivery / <local>`
5. Create the pull request.

Alternatively, see the GitHub documentation at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)..

## 🤝 Author and Contributors

We thank the following people who contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="#">
        <img src="https://avatars3.githubusercontent.com/u/64988299" width="100px" style="border-radius: 90px" alt="Foto do Joabe Henrique no GitHub"/><br>
        <sub>
          <b>Joabe Henrique [Author]</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 😄 Be one of the contributors<br>

Do you want to be part of this project? Click [here](https://github.com/joabehenrique/rocketseat-exlivery/blob/master/exlivery/CONTRIBUTING.md) and read how to contribute.

## 📝 Licença

This project is under license. See the [license](https://github.com/joabehenrique/rocketseat-exlivery/blob/master/exlivery/LICENSE.md) file for more details.

[⬆ Back to top](#Exlivery)<br>
