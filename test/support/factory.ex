defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.Meal

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
    %Meal{
      id: "5484b227-0f8f-4e84-ab01-41fd7c4c43dc",
      description: "pizza",
      date: NaiveDateTime.new(2021, 6, 23, 13, 23, 45),
      calories: 123
    }
  end
end
