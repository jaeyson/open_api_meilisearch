defmodule OpenApiMeilisearch.TaskView do
  @moduledoc """
  Provides struct and type for a TaskView
  """

  @type t :: %__MODULE__{
          batchUid: integer | nil,
          canceledBy: integer | nil,
          details: OpenApiMeilisearch.DetailsView.t() | nil,
          duration: String.t() | nil,
          enqueuedAt: String.t(),
          error: OpenApiMeilisearch.ResponseError.t() | nil,
          finishedAt: String.t() | nil,
          indexUid: String.t() | nil,
          startedAt: String.t() | nil,
          status: String.t(),
          type: String.t(),
          uid: integer
        }

  defstruct [
    :batchUid,
    :canceledBy,
    :details,
    :duration,
    :enqueuedAt,
    :error,
    :finishedAt,
    :indexUid,
    :startedAt,
    :status,
    :type,
    :uid
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      batchUid: {:union, [{:integer, "u-int32"}, :null]},
      canceledBy: {:union, [{:integer, "u-int32"}, :null]},
      details: {:union, [{OpenApiMeilisearch.DetailsView, :t}, :null]},
      duration: {:union, [:string, :null]},
      enqueuedAt: :string,
      error: {:union, [{OpenApiMeilisearch.ResponseError, :t}, :null]},
      finishedAt: :string,
      indexUid: {:union, [:string, :null]},
      startedAt: :string,
      status: {:enum, ["enqueued", "processing", "succeeded", "failed", "canceled"]},
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
         ]},
      uid: {:integer, "u-int32"}
    ]
  end
end
