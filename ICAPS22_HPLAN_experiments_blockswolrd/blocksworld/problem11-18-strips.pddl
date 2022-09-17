( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b990 - block
    b743 - block
    b367 - block
    b872 - block
    b640 - block
    b694 - block
    b466 - block
    b649 - block
    b722 - block
    b416 - block
    b813 - block
    b570 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b990 )
    ( on b743 b990 )
    ( on b367 b743 )
    ( on b872 b367 )
    ( on b640 b872 )
    ( on b694 b640 )
    ( on b466 b694 )
    ( on b649 b466 )
    ( on b722 b649 )
    ( on b416 b722 )
    ( on b813 b416 )
    ( on b570 b813 )
    ( clear b570 )
  )
  ( :goal
    ( and
      ( clear b990 )
    )
  )
)
