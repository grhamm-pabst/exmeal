defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.Meal
  alias Exmeal.Meals.Create
  alias Exmeal.Meals.Update

  describe "call/1" do
    setup do
      params = build(:meal_params)

      {:ok, %Meal{id: id}} = Create.call(params)

      {:ok, id: id}
    end

    test "when all params are valid and the meal exists, updates the meal", %{id: id} do
      params = %{"description" => "banana", "id" => id}

      response = Update.call(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: 123,
                date: _date,
                description: "banana",
                id: _id,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "when the meal doesnt exists, returns an error" do
      id = "5484b227-0f8f-4e84-ab01-41fd7c4c43de"
      params = %{"description" => "banana", "id" => id}

      response = Update.call(params)

      assert {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
