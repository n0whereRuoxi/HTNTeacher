( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b187 - block
    b340 - block
    b260 - block
    b876 - block
    b481 - block
    b636 - block
    b312 - block
    b97 - block
    b890 - block
    b201 - block
    b509 - block
    b446 - block
    b286 - block
    b51 - block
    b803 - block
    b925 - block
    b661 - block
    b662 - block
    b814 - block
    b664 - block
    b417 - block
    b910 - block
    b541 - block
    b511 - block
    b24 - block
    b95 - block
    b947 - block
    b540 - block
    b631 - block
    b708 - block
    b181 - block
    b550 - block
    b767 - block
    b30 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b187 )
    ( on b340 b187 )
    ( on b260 b340 )
    ( on b876 b260 )
    ( on b481 b876 )
    ( on b636 b481 )
    ( on b312 b636 )
    ( on b97 b312 )
    ( on b890 b97 )
    ( on b201 b890 )
    ( on b509 b201 )
    ( on b446 b509 )
    ( on b286 b446 )
    ( on b51 b286 )
    ( on b803 b51 )
    ( on b925 b803 )
    ( on b661 b925 )
    ( on b662 b661 )
    ( on b814 b662 )
    ( on b664 b814 )
    ( on b417 b664 )
    ( on b910 b417 )
    ( on b541 b910 )
    ( on b511 b541 )
    ( on b24 b511 )
    ( on b95 b24 )
    ( on b947 b95 )
    ( on b540 b947 )
    ( on b631 b540 )
    ( on b708 b631 )
    ( on b181 b708 )
    ( on b550 b181 )
    ( on b767 b550 )
    ( on b30 b767 )
    ( clear b30 )
  )
  ( :goal
    ( and
      ( clear b187 )
    )
  )
)
