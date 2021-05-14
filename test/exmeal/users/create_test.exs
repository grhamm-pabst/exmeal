defmodule Exmeal.Users.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.Users.Create

  describe "call/1" do
    test "when all params are valid, returns a created user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok,
              %Exmeal.User{
                name: "grhamm",
                email: "grhamm@email.com",
                cpf: "86373533557",
                id: _id,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{"name" => "grhamm"}

      response = Create.call(params)

      assert {:error, %Exmeal.Error{result: _result, status: :bad_request}} = response
    end
  end
end
