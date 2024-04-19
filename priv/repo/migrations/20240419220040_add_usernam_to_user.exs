defmodule Pento.Repo.Migrations.AddUsernamToUser do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add :username, :text, required: true
    end
  end

  def down do
    alter table(:users) do
      remove :username
    end 
  end
end
