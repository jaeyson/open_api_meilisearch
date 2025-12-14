defmodule OpenApiMeilisearch.SummarizedTaskView do
  @moduledoc """
  Provides struct and type for a SummarizedTaskView
  """

  @type t :: %__MODULE__{
          enqueuedAt: DateTime.t(),
          indexUid: String.t() | nil,
          status: String.t(),
          taskUid: integer,
          type: String.t()
        }

  defstruct [:enqueuedAt, :indexUid, :status, :taskUid, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      enqueuedAt: {:string, "date-time"},
      indexUid: {:union, [:string, :null]},
      status: {:enum, ["enqueued", "processing", "succeeded", "failed", "canceled"]},
      taskUid: {:integer, "u-int32"},
      type:
        {:enum,
         [
           "documentAdditionOrUpdate",
           "documentEdition",
           "documentDeletion",
           "settingsUpdate",
           "indexCreation",
           "indexDeletion",
           "indexUpdate",
           "indexSwap",
           "taskCancelation",
           "taskDeletion",
           "dumpCreation",
           "snapshotCreation",
           "upgradeDatabase"
         ]}
    ]
  end
end
