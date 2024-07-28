defmodule Community.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :full_name, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
