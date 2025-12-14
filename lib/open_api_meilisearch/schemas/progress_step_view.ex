defmodule OpenApiMeilisearch.ProgressStepView do
  @moduledoc """
  Provides struct and type for a ProgressStepView
  """

  @type t :: %__MODULE__{currentStep: String.t(), finished: integer, total: integer}

  defstruct [:currentStep, :finished, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [currentStep: :string, finished: {:integer, "u-int32"}, total: {:integer, "u-int32"}]
  end
end
