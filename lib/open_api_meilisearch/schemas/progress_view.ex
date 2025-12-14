defmodule OpenApiMeilisearch.ProgressView do
  @moduledoc """
  Provides struct and type for a ProgressView
  """

  @type t :: %__MODULE__{percentage: number, steps: [OpenApiMeilisearch.ProgressStepView.t()]}

  defstruct [:percentage, :steps]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [percentage: {:number, "float"}, steps: [{OpenApiMeilisearch.ProgressStepView, :t}]]
  end
end
