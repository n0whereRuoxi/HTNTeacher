( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b423 - block
    b518 - block
    b640 - block
    b728 - block
    b764 - block
    b769 - block
    b555 - block
    b299 - block
    b972 - block
    b222 - block
    b60 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b423 )
    ( on b518 b423 )
    ( on b640 b518 )
    ( on b728 b640 )
    ( on b764 b728 )
    ( on b769 b764 )
    ( on b555 b769 )
    ( on b299 b555 )
    ( on b972 b299 )
    ( on b222 b972 )
    ( on b60 b222 )
    ( clear b60 )
  )
  ( :tasks
    ( Make-10Pile b518 b640 b728 b764 b769 b555 b299 b972 b222 b60 )
  )
)
