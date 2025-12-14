defmodule OpenApiMeilisearch.UpdateStderrLogs do
  @moduledoc """
  Provides struct and type for a UpdateStderrLogs
  """

  @type t :: %__MODULE__{target: String.t()}

  defstruct [:target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [target: :string]
  end
end
