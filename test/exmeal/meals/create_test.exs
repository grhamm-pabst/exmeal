defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.Meals.Create

  describe "call/1" do
    test "when all params are valid, returns a create meal" do
      params = build(:meal_params)

      response = Create.call(params)

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

    test "when there are invalid params, returns an error" do
      params = %{"description" => "banana"}

      response = Create.call(params)

      assert {:error, %Exmeal.Error{result: _result, status: :bad_request}} = response
    end
  end
end
