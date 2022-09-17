( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b771 - block
    b78 - block
    b782 - block
    b701 - block
    b568 - block
    b728 - block
    b967 - block
    b277 - block
    b347 - block
    b551 - block
    b467 - block
    b27 - block
    b581 - block
    b501 - block
    b42 - block
    b504 - block
    b732 - block
    b884 - block
    b665 - block
    b123 - block
    b754 - block
    b828 - block
    b493 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b78 b771 )
    ( on b782 b78 )
    ( on b701 b782 )
    ( on b568 b701 )
    ( on b728 b568 )
    ( on b967 b728 )
    ( on b277 b967 )
    ( on b347 b277 )
    ( on b551 b347 )
    ( on b467 b551 )
    ( on b27 b467 )
    ( on b581 b27 )
    ( on b501 b581 )
    ( on b42 b501 )
    ( on b504 b42 )
    ( on b732 b504 )
    ( on b884 b732 )
    ( on b665 b884 )
    ( on b123 b665 )
    ( on b754 b123 )
    ( on b828 b754 )
    ( on b493 b828 )
    ( clear b493 )
  )
  ( :goal
    ( and
      ( clear b771 )
    )
  )
)
