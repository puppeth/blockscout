defmodule Explorer.Chain.Block.Reward do
  @moduledoc """
  Represents the total reward given to an address in a block.
  """

  use Explorer.Schema

  alias Explorer.Chain.Block.Reward
  alias Explorer.Chain.Block.Reward.AddressType
  alias Explorer.Chain.Hash.Address
  alias Explorer.Chain.{Block, Wei}

  @required_attrs ~w(address_hash address_type block_number reward)a

  @typedoc """
  The validation reward given related to a block.

  * `:address_hash` - Hash of address who received the reward
  * `:address_type` - Type of the address_hash, either emission_funds, uncle or validator
  * `:block_number` - Number of the block validation
  * `:reward` - Total block reward
  """
  @type t :: %Reward{
          address_hash: Address.t(),
          address_type: AddressType.t(),
          block_number: Block.block_number(),
          reward: Wei.t()
        }

  @primary_key false
  schema "block_rewards" do
    field(:address_hash, Address)
    field(:address_type, AddressType)
    field(:block_number, :integer)
    field(:reward, Wei)

    timestamps()
  end

  def changeset(%__MODULE__{} = reward, attrs) do
    reward
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
  end
end
