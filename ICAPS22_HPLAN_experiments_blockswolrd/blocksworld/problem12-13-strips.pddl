( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b860 - block
    b853 - block
    b148 - block
    b252 - block
    b993 - block
    b369 - block
    b558 - block
    b876 - block
    b579 - block
    b257 - block
    b703 - block
    b819 - block
    b909 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b860 )
    ( on b853 b860 )
    ( on b148 b853 )
    ( on b252 b148 )
    ( on b993 b252 )
    ( on b369 b993 )
    ( on b558 b369 )
    ( on b876 b558 )
    ( on b579 b876 )
    ( on b257 b579 )
    ( on b703 b257 )
    ( on b819 b703 )
    ( on b909 b819 )
    ( clear b909 )
  )
  ( :goal
    ( and
      ( clear b860 )
    )
  )
)
