defmodule Exmeal.MealTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Ecto.Changeset
  alias Exmeal.Meal

  describe "changeset/2" do
    test "when the params are valid and no struct is provided, returns a new valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "pizza",
                 date: _date,
                 calories: 123
               },
               valid?: true
             } = response
    end

    test "when the params are invalid, returns an error" do
      params = %{description: "banana"}

      response = Meal.changeset(params)

      assert %Changeset{
               changes: _changes,
               valid?: false
             } = response
    end
  end
end
