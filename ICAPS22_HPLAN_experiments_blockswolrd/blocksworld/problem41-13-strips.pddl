( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b687 - block
    b767 - block
    b534 - block
    b353 - block
    b623 - block
    b617 - block
    b618 - block
    b510 - block
    b771 - block
    b147 - block
    b758 - block
    b620 - block
    b282 - block
    b337 - block
    b605 - block
    b29 - block
    b710 - block
    b927 - block
    b368 - block
    b159 - block
    b31 - block
    b718 - block
    b169 - block
    b502 - block
    b860 - block
    b692 - block
    b727 - block
    b439 - block
    b112 - block
    b598 - block
    b563 - block
    b396 - block
    b262 - block
    b592 - block
    b939 - block
    b721 - block
    b507 - block
    b474 - block
    b616 - block
    b645 - block
    b676 - block
    b327 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b687 )
    ( on b767 b687 )
    ( on b534 b767 )
    ( on b353 b534 )
    ( on b623 b353 )
    ( on b617 b623 )
    ( on b618 b617 )
    ( on b510 b618 )
    ( on b771 b510 )
    ( on b147 b771 )
    ( on b758 b147 )
    ( on b620 b758 )
    ( on b282 b620 )
    ( on b337 b282 )
    ( on b605 b337 )
    ( on b29 b605 )
    ( on b710 b29 )
    ( on b927 b710 )
    ( on b368 b927 )
    ( on b159 b368 )
    ( on b31 b159 )
    ( on b718 b31 )
    ( on b169 b718 )
    ( on b502 b169 )
    ( on b860 b502 )
    ( on b692 b860 )
    ( on b727 b692 )
    ( on b439 b727 )
    ( on b112 b439 )
    ( on b598 b112 )
    ( on b563 b598 )
    ( on b396 b563 )
    ( on b262 b396 )
    ( on b592 b262 )
    ( on b939 b592 )
    ( on b721 b939 )
    ( on b507 b721 )
    ( on b474 b507 )
    ( on b616 b474 )
    ( on b645 b616 )
    ( on b676 b645 )
    ( on b327 b676 )
    ( clear b327 )
  )
  ( :goal
    ( and
      ( clear b687 )
    )
  )
)
