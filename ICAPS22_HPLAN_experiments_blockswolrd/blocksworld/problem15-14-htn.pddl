( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b606 - block
    b436 - block
    b266 - block
    b431 - block
    b717 - block
    b696 - block
    b224 - block
    b901 - block
    b722 - block
    b381 - block
    b11 - block
    b571 - block
    b753 - block
    b150 - block
    b103 - block
    b289 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b606 )
    ( on b436 b606 )
    ( on b266 b436 )
    ( on b431 b266 )
    ( on b717 b431 )
    ( on b696 b717 )
    ( on b224 b696 )
    ( on b901 b224 )
    ( on b722 b901 )
    ( on b381 b722 )
    ( on b11 b381 )
    ( on b571 b11 )
    ( on b753 b571 )
    ( on b150 b753 )
    ( on b103 b150 )
    ( on b289 b103 )
    ( clear b289 )
  )
  ( :tasks
    ( Make-15Pile b436 b266 b431 b717 b696 b224 b901 b722 b381 b11 b571 b753 b150 b103 b289 )
  )
)
