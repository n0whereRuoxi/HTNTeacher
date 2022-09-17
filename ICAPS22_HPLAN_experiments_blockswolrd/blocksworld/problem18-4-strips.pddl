( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b205 - block
    b518 - block
    b995 - block
    b199 - block
    b388 - block
    b478 - block
    b258 - block
    b168 - block
    b614 - block
    b164 - block
    b121 - block
    b280 - block
    b833 - block
    b892 - block
    b83 - block
    b502 - block
    b930 - block
    b143 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b205 b965 )
    ( on b518 b205 )
    ( on b995 b518 )
    ( on b199 b995 )
    ( on b388 b199 )
    ( on b478 b388 )
    ( on b258 b478 )
    ( on b168 b258 )
    ( on b614 b168 )
    ( on b164 b614 )
    ( on b121 b164 )
    ( on b280 b121 )
    ( on b833 b280 )
    ( on b892 b833 )
    ( on b83 b892 )
    ( on b502 b83 )
    ( on b930 b502 )
    ( on b143 b930 )
    ( clear b143 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
