defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.{Meal, User}

  def meal_params_factory do
    %{
      description: "pizza",
      calories: 123
    }
  end

  def meal_body_factory do
    %{
      "description" => "pizza",
      "calories" => 123
    }
  end

  def meal_factory do
    {:ok, date} = NaiveDateTime.new(2021, 6, 23, 13, 23, 45)

    %Meal{
      id: "5484b227-0f8f-4e84-ab01-41fd7c4c43dc",
      description: "pizza",
      date: date,
      calories: 123
    }
  end

  def user_params_factory do
    %{
      name: "grhamm",
      email: "grhamm@email.com",
      cpf: "86373533557"
    }
  end

  def user_body_factory do
    %{
      "name" => "grhamm",
      "cpf" => "86373533557",
      "email" => "grhamm@email.com"
    }
  end

  def user_factory do
    %User{
      id: "5484b227-0f8f-4e84-ab01-41fd7c4c43de",
      name: "grhamm",
      email: "grhamm@email.com",
      cpf: "86373533557"
    }
  end
end
