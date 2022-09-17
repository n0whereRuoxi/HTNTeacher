( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b450 - block
    b680 - block
    b989 - block
    b380 - block
    b870 - block
    b624 - block
    b899 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b450 )
    ( on b680 b450 )
    ( on b989 b680 )
    ( on b380 b989 )
    ( on b870 b380 )
    ( on b624 b870 )
    ( on b899 b624 )
    ( clear b899 )
  )
  ( :goal
    ( and
      ( clear b450 )
    )
  )
)
