defmodule OpenApiMeilisearch.GetLogs do
  @moduledoc """
  Provides struct and type for a GetLogs
  """

  @type t :: %__MODULE__{mode: String.t(), profileMemory: boolean, target: String.t()}

  defstruct [:mode, :profileMemory, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mode: {:enum, ["human", "json", "profile"]}, profileMemory: :boolean, target: :string]
  end
end
