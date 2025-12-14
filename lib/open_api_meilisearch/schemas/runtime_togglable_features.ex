defmodule OpenApiMeilisearch.RuntimeTogglableFeatures do
  @moduledoc """
  Provides struct and type for a RuntimeTogglableFeatures
  """

  @type t :: %__MODULE__{
          chatCompletions: boolean | nil,
          compositeEmbedders: boolean | nil,
          containsFilter: boolean | nil,
          editDocumentsByFunction: boolean | nil,
          getTaskDocumentsRoute: boolean | nil,
          logsRoute: boolean | nil,
          metrics: boolean | nil,
          network: boolean | nil
        }

  defstruct [
    :chatCompletions,
    :compositeEmbedders,
    :containsFilter,
    :editDocumentsByFunction,
    :getTaskDocumentsRoute,
    :logsRoute,
    :metrics,
    :network
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chatCompletions: {:union, [:boolean, :null]},
      compositeEmbedders: {:union, [:boolean, :null]},
      containsFilter: {:union, [:boolean, :null]},
      editDocumentsByFunction: {:union, [:boolean, :null]},
      getTaskDocumentsRoute: {:union, [:boolean, :null]},
      logsRoute: {:union, [:boolean, :null]},
      metrics: {:union, [:boolean, :null]},
      network: {:union, [:boolean, :null]}
    ]
  end
end
