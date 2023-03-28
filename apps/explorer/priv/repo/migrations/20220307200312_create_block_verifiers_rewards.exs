defmodule Explorer.Repo.Migrations.CreateNewBlockVerifiersRewards do
  use Ecto.Migration

  def change do
    create table(:block_verifiers_rewards, primary_key: false) do
        # addresses for hash
      #add(:address, references(:addresses, column: :hash, on_delete: :delete_all, type: :bytea), null: false)

      add(:address, :string, null: false)
      add(:block_hash, references(:blocks, column: :hash, on_delete: :delete_all, type: :bytea), null: false)
      add(:public_key, :string, null: false)
      timestamps(null: false, type: :utc_datetime)
    end

    create(unique_index(:block_verifiers_rewards, [:address, :block_hash]))
  end
end
