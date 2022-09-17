( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b872 - block
    b508 - block
    b712 - block
    b883 - block
    b67 - block
    b963 - block
    b179 - block
    b586 - block
    b946 - block
    b372 - block
    b834 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b872 )
    ( on b508 b872 )
    ( on b712 b508 )
    ( on b883 b712 )
    ( on b67 b883 )
    ( on b963 b67 )
    ( on b179 b963 )
    ( on b586 b179 )
    ( on b946 b586 )
    ( on b372 b946 )
    ( on b834 b372 )
    ( clear b834 )
  )
  ( :goal
    ( and
      ( clear b872 )
    )
  )
)
