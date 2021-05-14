defmodule ExmealWeb.UsersViewTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory

  alias ExmealWeb.UsersView

  describe "render/2" do
    test "renders create.json" do
      params = %{user: build(:user)}

      response = UsersView.render("create.json", params)

      assert %{
               user: %Exmeal.User{
                 id: _id,
                 name: "grhamm",
                 email: "grhamm@email.com",
                 cpf: "86373533557"
               },
               message: "User created!"
             } = response
    end
  end
end
