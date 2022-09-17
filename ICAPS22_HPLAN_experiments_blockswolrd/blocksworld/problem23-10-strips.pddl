( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b663 - block
    b420 - block
    b406 - block
    b963 - block
    b825 - block
    b366 - block
    b776 - block
    b268 - block
    b507 - block
    b894 - block
    b381 - block
    b710 - block
    b477 - block
    b113 - block
    b484 - block
    b447 - block
    b586 - block
    b904 - block
    b874 - block
    b670 - block
    b186 - block
    b9 - block
    b319 - block
    b293 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b663 )
    ( on b420 b663 )
    ( on b406 b420 )
    ( on b963 b406 )
    ( on b825 b963 )
    ( on b366 b825 )
    ( on b776 b366 )
    ( on b268 b776 )
    ( on b507 b268 )
    ( on b894 b507 )
    ( on b381 b894 )
    ( on b710 b381 )
    ( on b477 b710 )
    ( on b113 b477 )
    ( on b484 b113 )
    ( on b447 b484 )
    ( on b586 b447 )
    ( on b904 b586 )
    ( on b874 b904 )
    ( on b670 b874 )
    ( on b186 b670 )
    ( on b9 b186 )
    ( on b319 b9 )
    ( on b293 b319 )
    ( clear b293 )
  )
  ( :goal
    ( and
      ( clear b663 )
    )
  )
)
