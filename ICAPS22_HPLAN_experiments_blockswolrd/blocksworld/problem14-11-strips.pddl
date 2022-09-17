( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b199 - block
    b125 - block
    b972 - block
    b902 - block
    b248 - block
    b850 - block
    b712 - block
    b318 - block
    b47 - block
    b945 - block
    b251 - block
    b774 - block
    b498 - block
    b34 - block
    b70 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b199 )
    ( on b125 b199 )
    ( on b972 b125 )
    ( on b902 b972 )
    ( on b248 b902 )
    ( on b850 b248 )
    ( on b712 b850 )
    ( on b318 b712 )
    ( on b47 b318 )
    ( on b945 b47 )
    ( on b251 b945 )
    ( on b774 b251 )
    ( on b498 b774 )
    ( on b34 b498 )
    ( on b70 b34 )
    ( clear b70 )
  )
  ( :goal
    ( and
      ( clear b199 )
    )
  )
)
