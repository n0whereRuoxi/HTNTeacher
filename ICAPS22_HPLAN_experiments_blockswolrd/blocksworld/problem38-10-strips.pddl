( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b89 - block
    b286 - block
    b861 - block
    b985 - block
    b871 - block
    b362 - block
    b754 - block
    b885 - block
    b541 - block
    b96 - block
    b97 - block
    b486 - block
    b696 - block
    b18 - block
    b760 - block
    b666 - block
    b313 - block
    b973 - block
    b998 - block
    b736 - block
    b715 - block
    b523 - block
    b631 - block
    b211 - block
    b638 - block
    b643 - block
    b562 - block
    b683 - block
    b900 - block
    b923 - block
    b842 - block
    b170 - block
    b938 - block
    b128 - block
    b500 - block
    b623 - block
    b542 - block
    b662 - block
    b5 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b89 )
    ( on b286 b89 )
    ( on b861 b286 )
    ( on b985 b861 )
    ( on b871 b985 )
    ( on b362 b871 )
    ( on b754 b362 )
    ( on b885 b754 )
    ( on b541 b885 )
    ( on b96 b541 )
    ( on b97 b96 )
    ( on b486 b97 )
    ( on b696 b486 )
    ( on b18 b696 )
    ( on b760 b18 )
    ( on b666 b760 )
    ( on b313 b666 )
    ( on b973 b313 )
    ( on b998 b973 )
    ( on b736 b998 )
    ( on b715 b736 )
    ( on b523 b715 )
    ( on b631 b523 )
    ( on b211 b631 )
    ( on b638 b211 )
    ( on b643 b638 )
    ( on b562 b643 )
    ( on b683 b562 )
    ( on b900 b683 )
    ( on b923 b900 )
    ( on b842 b923 )
    ( on b170 b842 )
    ( on b938 b170 )
    ( on b128 b938 )
    ( on b500 b128 )
    ( on b623 b500 )
    ( on b542 b623 )
    ( on b662 b542 )
    ( on b5 b662 )
    ( clear b5 )
  )
  ( :goal
    ( and
      ( clear b89 )
    )
  )
)
