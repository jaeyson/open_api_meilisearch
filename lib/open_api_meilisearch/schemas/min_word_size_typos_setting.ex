defmodule OpenApiMeilisearch.MinWordSizeTyposSetting do
  @moduledoc """
  Provides struct and type for a MinWordSizeTyposSetting
  """

  @type t :: %__MODULE__{oneTypo: integer | nil, twoTypos: integer | nil}

  defstruct [:oneTypo, :twoTypos]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      oneTypo: {:union, [{:integer, "u-int8"}, :null]},
      twoTypos: {:union, [{:integer, "u-int8"}, :null]}
    ]
  end
end
