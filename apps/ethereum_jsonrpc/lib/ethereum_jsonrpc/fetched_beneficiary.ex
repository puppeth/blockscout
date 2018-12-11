defmodule EthereumJSONRPC.FetchedBeneficiary do
  @moduledoc """
  A single balance request params for the beneficiary of a block.
  """

  alias Explorer.Chain.Block.Reward.AddressType
  alias Explorer.Chain.Hash

  @type params :: %{
    address_hash: EthereumJSONRPC.hash(),
    block_number: non_neg_integer(),
    block_hash: Hash.Full.t(),
    reward: String.t(),
    address_type: AddressType.t()
  }
  @type error :: %{code: integer(), message: String.t(), data: %{block_number: non_neg_integer()}}
end
