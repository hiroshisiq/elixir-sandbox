defmodule Discuss.Model.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.Model.User
    belongs_to :topic, Discuss.Model.Topic

    timestamps()
  end

  @doc false
  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
