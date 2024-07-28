defmodule Community.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :text, :string
    field :body, :string
    belongs_to :user, Community.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:text, :body, :user_id])
    |> validate_required([:text, :body])
    |> validate_length(:text, min: 4)
  end
end
