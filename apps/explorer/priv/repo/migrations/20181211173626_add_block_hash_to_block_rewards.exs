defmodule Explorer.Repo.Migrations.AddBlockHashToBlockRewards do
  use Ecto.Migration

  def change do
    alter table(:block_rewards) do
      add(:block_hash, references(:blocks, column: :hash, on_delete: :delete_all, type: :bytea), null: false)
      remove(:block_number)
    end
  end
end
