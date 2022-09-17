( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b262 - block
    b694 - block
    b586 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b262 )
    ( on b694 b262 )
    ( on b586 b694 )
    ( clear b586 )
  )
  ( :goal
    ( and
      ( clear b262 )
    )
  )
)
