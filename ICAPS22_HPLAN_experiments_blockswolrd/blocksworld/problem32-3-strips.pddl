( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b345 - block
    b105 - block
    b897 - block
    b149 - block
    b374 - block
    b520 - block
    b88 - block
    b46 - block
    b28 - block
    b318 - block
    b255 - block
    b48 - block
    b263 - block
    b117 - block
    b94 - block
    b494 - block
    b55 - block
    b294 - block
    b365 - block
    b316 - block
    b752 - block
    b363 - block
    b261 - block
    b940 - block
    b1 - block
    b778 - block
    b795 - block
    b555 - block
    b963 - block
    b252 - block
    b692 - block
    b839 - block
    b720 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b345 )
    ( on b105 b345 )
    ( on b897 b105 )
    ( on b149 b897 )
    ( on b374 b149 )
    ( on b520 b374 )
    ( on b88 b520 )
    ( on b46 b88 )
    ( on b28 b46 )
    ( on b318 b28 )
    ( on b255 b318 )
    ( on b48 b255 )
    ( on b263 b48 )
    ( on b117 b263 )
    ( on b94 b117 )
    ( on b494 b94 )
    ( on b55 b494 )
    ( on b294 b55 )
    ( on b365 b294 )
    ( on b316 b365 )
    ( on b752 b316 )
    ( on b363 b752 )
    ( on b261 b363 )
    ( on b940 b261 )
    ( on b1 b940 )
    ( on b778 b1 )
    ( on b795 b778 )
    ( on b555 b795 )
    ( on b963 b555 )
    ( on b252 b963 )
    ( on b692 b252 )
    ( on b839 b692 )
    ( on b720 b839 )
    ( clear b720 )
  )
  ( :goal
    ( and
      ( clear b345 )
    )
  )
)
