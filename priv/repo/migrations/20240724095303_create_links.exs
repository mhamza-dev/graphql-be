defmodule Community.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end

    create unique_index(:links, [:url])
  end
end
