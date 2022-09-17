( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b269 - block
    b27 - block
    b601 - block
    b837 - block
    b779 - block
    b259 - block
    b74 - block
    b93 - block
    b332 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b269 )
    ( on b27 b269 )
    ( on b601 b27 )
    ( on b837 b601 )
    ( on b779 b837 )
    ( on b259 b779 )
    ( on b74 b259 )
    ( on b93 b74 )
    ( on b332 b93 )
    ( clear b332 )
  )
  ( :goal
    ( and
      ( clear b269 )
    )
  )
)
