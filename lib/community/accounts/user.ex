defmodule Community.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :full_name, :string
    field :email, :string

    has_many :posts, Community.Blogs.Post

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:full_name, :email])
    |> validate_required([:full_name, :email])
    |> validate_length(:full_name, min: 3)
  end
end
