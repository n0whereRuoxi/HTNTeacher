( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b573 - block
    b501 - block
    b675 - block
    b601 - block
    b737 - block
    b147 - block
    b7 - block
    b508 - block
    b131 - block
    b83 - block
    b645 - block
    b765 - block
    b80 - block
    b795 - block
    b127 - block
    b965 - block
    b662 - block
    b658 - block
    b275 - block
    b112 - block
    b947 - block
    b335 - block
    b760 - block
    b307 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b573 )
    ( on b501 b573 )
    ( on b675 b501 )
    ( on b601 b675 )
    ( on b737 b601 )
    ( on b147 b737 )
    ( on b7 b147 )
    ( on b508 b7 )
    ( on b131 b508 )
    ( on b83 b131 )
    ( on b645 b83 )
    ( on b765 b645 )
    ( on b80 b765 )
    ( on b795 b80 )
    ( on b127 b795 )
    ( on b965 b127 )
    ( on b662 b965 )
    ( on b658 b662 )
    ( on b275 b658 )
    ( on b112 b275 )
    ( on b947 b112 )
    ( on b335 b947 )
    ( on b760 b335 )
    ( on b307 b760 )
    ( clear b307 )
  )
  ( :goal
    ( and
      ( clear b573 )
    )
  )
)
