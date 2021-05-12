defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  alias ExmealWeb.MealsView

  describe "render/2" do
    test "renders create.json" do
      params = %{meal: build(:meal)}

      response = MealsView.render("create.json", params)

      assert %{
               meal: %Exmeal.Meal{
                 calories: 123,
                 date: _date,
                 description: "pizza",
                 id: _id,
                 inserted_at: nil,
                 updated_at: nil
               },
               message: "Meal created!"
             } = response
    end

    test "renders meal.json" do
      params = %{meal: build(:meal)}

      response = MealsView.render("meal.json", params)

      assert %{
               meal: %Exmeal.Meal{
                 calories: 123,
                 date: _date,
                 description: "pizza",
                 id: _id,
                 inserted_at: nil,
                 updated_at: nil
               }
             } = response
    end
  end
end
