( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b892 - block
    b216 - block
    b842 - block
    b532 - block
    b39 - block
    b856 - block
    b337 - block
    b320 - block
    b587 - block
    b321 - block
    b487 - block
    b722 - block
    b385 - block
    b662 - block
    b165 - block
    b812 - block
    b984 - block
    b149 - block
    b236 - block
    b274 - block
    b885 - block
    b759 - block
    b182 - block
    b122 - block
    b536 - block
    b31 - block
    b947 - block
    b664 - block
    b919 - block
    b69 - block
    b859 - block
    b205 - block
    b941 - block
    b50 - block
    b382 - block
    b830 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b216 b892 )
    ( on b842 b216 )
    ( on b532 b842 )
    ( on b39 b532 )
    ( on b856 b39 )
    ( on b337 b856 )
    ( on b320 b337 )
    ( on b587 b320 )
    ( on b321 b587 )
    ( on b487 b321 )
    ( on b722 b487 )
    ( on b385 b722 )
    ( on b662 b385 )
    ( on b165 b662 )
    ( on b812 b165 )
    ( on b984 b812 )
    ( on b149 b984 )
    ( on b236 b149 )
    ( on b274 b236 )
    ( on b885 b274 )
    ( on b759 b885 )
    ( on b182 b759 )
    ( on b122 b182 )
    ( on b536 b122 )
    ( on b31 b536 )
    ( on b947 b31 )
    ( on b664 b947 )
    ( on b919 b664 )
    ( on b69 b919 )
    ( on b859 b69 )
    ( on b205 b859 )
    ( on b941 b205 )
    ( on b50 b941 )
    ( on b382 b50 )
    ( on b830 b382 )
    ( clear b830 )
  )
  ( :goal
    ( and
      ( clear b892 )
    )
  )
)
