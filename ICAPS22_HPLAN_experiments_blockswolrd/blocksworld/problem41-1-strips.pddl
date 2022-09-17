( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b462 - block
    b921 - block
    b529 - block
    b972 - block
    b44 - block
    b909 - block
    b359 - block
    b496 - block
    b713 - block
    b85 - block
    b297 - block
    b467 - block
    b590 - block
    b167 - block
    b100 - block
    b514 - block
    b812 - block
    b667 - block
    b331 - block
    b15 - block
    b450 - block
    b899 - block
    b519 - block
    b269 - block
    b953 - block
    b361 - block
    b964 - block
    b595 - block
    b78 - block
    b974 - block
    b366 - block
    b601 - block
    b941 - block
    b282 - block
    b622 - block
    b286 - block
    b863 - block
    b320 - block
    b721 - block
    b866 - block
    b791 - block
    b652 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b462 )
    ( on b921 b462 )
    ( on b529 b921 )
    ( on b972 b529 )
    ( on b44 b972 )
    ( on b909 b44 )
    ( on b359 b909 )
    ( on b496 b359 )
    ( on b713 b496 )
    ( on b85 b713 )
    ( on b297 b85 )
    ( on b467 b297 )
    ( on b590 b467 )
    ( on b167 b590 )
    ( on b100 b167 )
    ( on b514 b100 )
    ( on b812 b514 )
    ( on b667 b812 )
    ( on b331 b667 )
    ( on b15 b331 )
    ( on b450 b15 )
    ( on b899 b450 )
    ( on b519 b899 )
    ( on b269 b519 )
    ( on b953 b269 )
    ( on b361 b953 )
    ( on b964 b361 )
    ( on b595 b964 )
    ( on b78 b595 )
    ( on b974 b78 )
    ( on b366 b974 )
    ( on b601 b366 )
    ( on b941 b601 )
    ( on b282 b941 )
    ( on b622 b282 )
    ( on b286 b622 )
    ( on b863 b286 )
    ( on b320 b863 )
    ( on b721 b320 )
    ( on b866 b721 )
    ( on b791 b866 )
    ( on b652 b791 )
    ( clear b652 )
  )
  ( :goal
    ( and
      ( clear b462 )
    )
  )
)
