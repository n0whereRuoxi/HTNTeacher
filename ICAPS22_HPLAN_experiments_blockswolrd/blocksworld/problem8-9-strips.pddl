( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b576 - block
    b533 - block
    b990 - block
    b722 - block
    b993 - block
    b322 - block
    b994 - block
    b124 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b576 )
    ( on b533 b576 )
    ( on b990 b533 )
    ( on b722 b990 )
    ( on b993 b722 )
    ( on b322 b993 )
    ( on b994 b322 )
    ( on b124 b994 )
    ( on b721 b124 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b576 )
    )
  )
)
