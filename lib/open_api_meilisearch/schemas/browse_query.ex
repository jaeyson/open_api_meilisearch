defmodule OpenApiMeilisearch.BrowseQuery do
  @moduledoc """
  Provides struct and type for a BrowseQuery
  """

  @type t :: %__MODULE__{
          fields: [String.t()] | nil,
          filter: map | nil,
          ids: [String.t()] | nil,
          limit: integer,
          offset: integer,
          retrieveVectors: boolean
        }

  defstruct [:fields, :filter, :ids, :limit, :offset, :retrieveVectors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fields: {:union, [[:string], :null]},
      filter: :map,
      ids: {:union, [[:string], :null]},
      limit: :integer,
      offset: :integer,
      retrieveVectors: :boolean
    ]
  end
end
