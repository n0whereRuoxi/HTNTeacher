( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b64 - block
    b383 - block
    b240 - block
    b43 - block
    b496 - block
    b631 - block
    b434 - block
    b959 - block
    b257 - block
    b410 - block
    b325 - block
    b545 - block
    b195 - block
    b624 - block
    b839 - block
    b791 - block
    b77 - block
    b380 - block
    b531 - block
    b55 - block
    b464 - block
    b76 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b64 )
    ( on b383 b64 )
    ( on b240 b383 )
    ( on b43 b240 )
    ( on b496 b43 )
    ( on b631 b496 )
    ( on b434 b631 )
    ( on b959 b434 )
    ( on b257 b959 )
    ( on b410 b257 )
    ( on b325 b410 )
    ( on b545 b325 )
    ( on b195 b545 )
    ( on b624 b195 )
    ( on b839 b624 )
    ( on b791 b839 )
    ( on b77 b791 )
    ( on b380 b77 )
    ( on b531 b380 )
    ( on b55 b531 )
    ( on b464 b55 )
    ( on b76 b464 )
    ( clear b76 )
  )
  ( :goal
    ( and
      ( clear b64 )
    )
  )
)
