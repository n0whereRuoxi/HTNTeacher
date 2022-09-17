( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b618 - block
    b327 - block
    b620 - block
    b436 - block
    b645 - block
    b791 - block
    b134 - block
    b709 - block
    b659 - block
    b885 - block
    b415 - block
    b980 - block
    b840 - block
    b692 - block
    b263 - block
    b284 - block
    b724 - block
    b636 - block
    b826 - block
    b837 - block
    b547 - block
    b541 - block
    b349 - block
    b297 - block
    b1 - block
    b726 - block
    b719 - block
    b565 - block
    b716 - block
    b841 - block
    b997 - block
    b892 - block
    b164 - block
    b324 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b618 )
    ( on b327 b618 )
    ( on b620 b327 )
    ( on b436 b620 )
    ( on b645 b436 )
    ( on b791 b645 )
    ( on b134 b791 )
    ( on b709 b134 )
    ( on b659 b709 )
    ( on b885 b659 )
    ( on b415 b885 )
    ( on b980 b415 )
    ( on b840 b980 )
    ( on b692 b840 )
    ( on b263 b692 )
    ( on b284 b263 )
    ( on b724 b284 )
    ( on b636 b724 )
    ( on b826 b636 )
    ( on b837 b826 )
    ( on b547 b837 )
    ( on b541 b547 )
    ( on b349 b541 )
    ( on b297 b349 )
    ( on b1 b297 )
    ( on b726 b1 )
    ( on b719 b726 )
    ( on b565 b719 )
    ( on b716 b565 )
    ( on b841 b716 )
    ( on b997 b841 )
    ( on b892 b997 )
    ( on b164 b892 )
    ( on b324 b164 )
    ( on b98 b324 )
    ( clear b98 )
  )
  ( :goal
    ( and
      ( clear b618 )
    )
  )
)
