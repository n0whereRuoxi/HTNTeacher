( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b498 - block
    b468 - block
    b750 - block
    b525 - block
    b891 - block
    b36 - block
    b336 - block
    b423 - block
    b558 - block
    b901 - block
    b635 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b498 )
    ( on b468 b498 )
    ( on b750 b468 )
    ( on b525 b750 )
    ( on b891 b525 )
    ( on b36 b891 )
    ( on b336 b36 )
    ( on b423 b336 )
    ( on b558 b423 )
    ( on b901 b558 )
    ( on b635 b901 )
    ( clear b635 )
  )
  ( :goal
    ( and
      ( clear b498 )
    )
  )
)
