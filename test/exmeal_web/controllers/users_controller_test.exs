defmodule ExmealWeb.UsersControllerTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  alias Exmeal.Meal

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_body)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "name" => "grhamm",
                 "cpf" => "86373533557",
                 "email" => "grhamm@email.com",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns an error", %{conn: conn} do
      params = %{"name" => "grhamm"}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end
end
