defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_date()
  end

  defp put_date(%Changeset{valid?: true, changes: %{}} = changeset) do
    change(changeset, %{date: NaiveDateTime.local_now()})
  end

  defp put_date(changeset), do: changeset
end
