defmodule Exmeal do
  alias Exmeal.Meals.Create, as: MealsCreate
  alias Exmeal.Meals.Delete, as: MealsDelete
  alias Exmeal.Meals.Get, as: MealsGet
  alias Exmeal.Meals.Update, as: MealsUpdate

  alias Exmeal.Users.Create, as: UsersCreate

  @moduledoc """
  Exmeal keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_meal(params), to: MealsCreate, as: :call
  defdelegate update_meal(params), to: MealsUpdate, as: :call
  defdelegate get_meal(id), to: MealsGet, as: :by_id
  defdelegate delete_meal(id), to: MealsDelete, as: :by_id

  defdelegate create_user(params), to: UsersCreate, as: :call
end
