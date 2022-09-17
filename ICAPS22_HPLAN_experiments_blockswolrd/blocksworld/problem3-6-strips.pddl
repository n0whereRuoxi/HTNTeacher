( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b175 - block
    b535 - block
    b410 - block
    b460 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b175 )
    ( on b535 b175 )
    ( on b410 b535 )
    ( on b460 b410 )
    ( clear b460 )
  )
  ( :goal
    ( and
      ( clear b175 )
    )
  )
)
