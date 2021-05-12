defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.Meal
  alias Exmeal.Meals.Create
  alias Exmeal.Meals.Get

  describe "get/1" do
    setup do
      params = build(:meal_params)

      {:ok, %Meal{id: id}} = Create.call(params)

      {:ok, id: id}
    end

    test "when the meal exists, returns the meal", %{id: id} do
      response = Get.by_id(id)

      assert {:ok,
              %Exmeal.Meal{
                calories: 123,
                date: _date,
                description: "pizza",
                id: _id,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "when the meal doesnt exists, returns an error" do
      id = "5484b227-0f8f-4e84-ab01-41fd7c4c43de"
      response = Get.by_id(id)

      expected_response = {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
