defmodule ExmealWeb.MealsControllerTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  alias Exmeal.Meal

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = build(:meal_body)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Meal created!",
               "meal" => %{
                 "id" => _id,
                 "date" => _date,
                 "description" => "pizza",
                 "calories" => 123
               }
             } = response
    end

    test "when there is some error, returns an error", %{conn: conn} do
      params = %{"description" => "banana"}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"calories" => ["can't be blank"]}}

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a meal with the given id, deletes the meal", %{conn: conn} do
      insert(:meal)
      id = "5484b227-0f8f-4e84-ab01-41fd7c4c43dc"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end

  describe "update/2" do
    test "when all params are valid, updates the meal", %{conn: conn} do
      meal = insert(:meal)

      %Meal{id: id} = meal

      params = %{
        "description" => "banana"
      }

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 123,
                 "date" => _date,
                 "description" => "banana",
                 "id" => _id
               }
             } = response
    end
  end

  describe "show/2" do
    test "when the meal exists, returns the meal", %{conn: conn} do
      meal = insert(:meal)

      %Meal{id: id} = meal

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 123,
                 "date" => _date,
                 "description" => "pizza",
                 "id" => _id
               }
             } = response
    end
  end
end
