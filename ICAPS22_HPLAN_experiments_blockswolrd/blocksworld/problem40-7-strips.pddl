( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b870 - block
    b931 - block
    b409 - block
    b458 - block
    b597 - block
    b346 - block
    b257 - block
    b885 - block
    b662 - block
    b565 - block
    b929 - block
    b321 - block
    b474 - block
    b958 - block
    b549 - block
    b28 - block
    b49 - block
    b125 - block
    b732 - block
    b985 - block
    b356 - block
    b13 - block
    b11 - block
    b407 - block
    b460 - block
    b372 - block
    b617 - block
    b616 - block
    b762 - block
    b897 - block
    b658 - block
    b872 - block
    b251 - block
    b21 - block
    b246 - block
    b482 - block
    b693 - block
    b661 - block
    b392 - block
    b736 - block
    b334 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b870 )
    ( on b931 b870 )
    ( on b409 b931 )
    ( on b458 b409 )
    ( on b597 b458 )
    ( on b346 b597 )
    ( on b257 b346 )
    ( on b885 b257 )
    ( on b662 b885 )
    ( on b565 b662 )
    ( on b929 b565 )
    ( on b321 b929 )
    ( on b474 b321 )
    ( on b958 b474 )
    ( on b549 b958 )
    ( on b28 b549 )
    ( on b49 b28 )
    ( on b125 b49 )
    ( on b732 b125 )
    ( on b985 b732 )
    ( on b356 b985 )
    ( on b13 b356 )
    ( on b11 b13 )
    ( on b407 b11 )
    ( on b460 b407 )
    ( on b372 b460 )
    ( on b617 b372 )
    ( on b616 b617 )
    ( on b762 b616 )
    ( on b897 b762 )
    ( on b658 b897 )
    ( on b872 b658 )
    ( on b251 b872 )
    ( on b21 b251 )
    ( on b246 b21 )
    ( on b482 b246 )
    ( on b693 b482 )
    ( on b661 b693 )
    ( on b392 b661 )
    ( on b736 b392 )
    ( on b334 b736 )
    ( clear b334 )
  )
  ( :goal
    ( and
      ( clear b870 )
    )
  )
)
