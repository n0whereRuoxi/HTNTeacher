( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b855 - block
    b993 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b855 )
    ( on b993 b855 )
    ( on b803 b993 )
    ( clear b803 )
  )
  ( :goal
    ( and
      ( clear b855 )
    )
  )
)
