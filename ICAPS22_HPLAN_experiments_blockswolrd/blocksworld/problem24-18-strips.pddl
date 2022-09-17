( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b191 - block
    b510 - block
    b319 - block
    b258 - block
    b639 - block
    b175 - block
    b525 - block
    b374 - block
    b435 - block
    b192 - block
    b844 - block
    b462 - block
    b832 - block
    b922 - block
    b83 - block
    b114 - block
    b963 - block
    b137 - block
    b33 - block
    b734 - block
    b101 - block
    b107 - block
    b632 - block
    b707 - block
    b292 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b191 )
    ( on b510 b191 )
    ( on b319 b510 )
    ( on b258 b319 )
    ( on b639 b258 )
    ( on b175 b639 )
    ( on b525 b175 )
    ( on b374 b525 )
    ( on b435 b374 )
    ( on b192 b435 )
    ( on b844 b192 )
    ( on b462 b844 )
    ( on b832 b462 )
    ( on b922 b832 )
    ( on b83 b922 )
    ( on b114 b83 )
    ( on b963 b114 )
    ( on b137 b963 )
    ( on b33 b137 )
    ( on b734 b33 )
    ( on b101 b734 )
    ( on b107 b101 )
    ( on b632 b107 )
    ( on b707 b632 )
    ( on b292 b707 )
    ( clear b292 )
  )
  ( :goal
    ( and
      ( clear b191 )
    )
  )
)
