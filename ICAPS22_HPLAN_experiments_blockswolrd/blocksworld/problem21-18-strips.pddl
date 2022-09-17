( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b530 - block
    b172 - block
    b101 - block
    b707 - block
    b973 - block
    b161 - block
    b452 - block
    b453 - block
    b292 - block
    b614 - block
    b62 - block
    b446 - block
    b768 - block
    b905 - block
    b438 - block
    b461 - block
    b993 - block
    b651 - block
    b396 - block
    b323 - block
    b31 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b530 )
    ( on b172 b530 )
    ( on b101 b172 )
    ( on b707 b101 )
    ( on b973 b707 )
    ( on b161 b973 )
    ( on b452 b161 )
    ( on b453 b452 )
    ( on b292 b453 )
    ( on b614 b292 )
    ( on b62 b614 )
    ( on b446 b62 )
    ( on b768 b446 )
    ( on b905 b768 )
    ( on b438 b905 )
    ( on b461 b438 )
    ( on b993 b461 )
    ( on b651 b993 )
    ( on b396 b651 )
    ( on b323 b396 )
    ( on b31 b323 )
    ( on b15 b31 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b530 )
    )
  )
)
