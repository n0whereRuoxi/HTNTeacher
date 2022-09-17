( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b721 - block
    b327 - block
    b811 - block
    b615 - block
    b512 - block
    b918 - block
    b56 - block
    b399 - block
    b433 - block
    b63 - block
    b232 - block
    b696 - block
    b888 - block
    b796 - block
    b24 - block
    b452 - block
    b494 - block
    b413 - block
    b486 - block
    b203 - block
    b39 - block
    b528 - block
    b473 - block
    b967 - block
    b859 - block
    b397 - block
    b833 - block
    b551 - block
    b474 - block
    b681 - block
    b919 - block
    b807 - block
    b975 - block
    b618 - block
    b492 - block
    b163 - block
    b333 - block
    b34 - block
    b586 - block
    b656 - block
    b282 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b327 b721 )
    ( on b811 b327 )
    ( on b615 b811 )
    ( on b512 b615 )
    ( on b918 b512 )
    ( on b56 b918 )
    ( on b399 b56 )
    ( on b433 b399 )
    ( on b63 b433 )
    ( on b232 b63 )
    ( on b696 b232 )
    ( on b888 b696 )
    ( on b796 b888 )
    ( on b24 b796 )
    ( on b452 b24 )
    ( on b494 b452 )
    ( on b413 b494 )
    ( on b486 b413 )
    ( on b203 b486 )
    ( on b39 b203 )
    ( on b528 b39 )
    ( on b473 b528 )
    ( on b967 b473 )
    ( on b859 b967 )
    ( on b397 b859 )
    ( on b833 b397 )
    ( on b551 b833 )
    ( on b474 b551 )
    ( on b681 b474 )
    ( on b919 b681 )
    ( on b807 b919 )
    ( on b975 b807 )
    ( on b618 b975 )
    ( on b492 b618 )
    ( on b163 b492 )
    ( on b333 b163 )
    ( on b34 b333 )
    ( on b586 b34 )
    ( on b656 b586 )
    ( on b282 b656 )
    ( clear b282 )
  )
  ( :goal
    ( and
      ( clear b721 )
    )
  )
)
