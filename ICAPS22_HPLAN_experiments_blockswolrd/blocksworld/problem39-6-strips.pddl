( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b286 - block
    b456 - block
    b808 - block
    b888 - block
    b251 - block
    b748 - block
    b182 - block
    b503 - block
    b699 - block
    b628 - block
    b14 - block
    b499 - block
    b732 - block
    b930 - block
    b405 - block
    b424 - block
    b506 - block
    b570 - block
    b190 - block
    b809 - block
    b302 - block
    b694 - block
    b995 - block
    b77 - block
    b662 - block
    b376 - block
    b919 - block
    b765 - block
    b245 - block
    b175 - block
    b590 - block
    b346 - block
    b882 - block
    b389 - block
    b436 - block
    b298 - block
    b484 - block
    b673 - block
    b524 - block
    b879 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b286 )
    ( on b456 b286 )
    ( on b808 b456 )
    ( on b888 b808 )
    ( on b251 b888 )
    ( on b748 b251 )
    ( on b182 b748 )
    ( on b503 b182 )
    ( on b699 b503 )
    ( on b628 b699 )
    ( on b14 b628 )
    ( on b499 b14 )
    ( on b732 b499 )
    ( on b930 b732 )
    ( on b405 b930 )
    ( on b424 b405 )
    ( on b506 b424 )
    ( on b570 b506 )
    ( on b190 b570 )
    ( on b809 b190 )
    ( on b302 b809 )
    ( on b694 b302 )
    ( on b995 b694 )
    ( on b77 b995 )
    ( on b662 b77 )
    ( on b376 b662 )
    ( on b919 b376 )
    ( on b765 b919 )
    ( on b245 b765 )
    ( on b175 b245 )
    ( on b590 b175 )
    ( on b346 b590 )
    ( on b882 b346 )
    ( on b389 b882 )
    ( on b436 b389 )
    ( on b298 b436 )
    ( on b484 b298 )
    ( on b673 b484 )
    ( on b524 b673 )
    ( on b879 b524 )
    ( clear b879 )
  )
  ( :goal
    ( and
      ( clear b286 )
    )
  )
)
