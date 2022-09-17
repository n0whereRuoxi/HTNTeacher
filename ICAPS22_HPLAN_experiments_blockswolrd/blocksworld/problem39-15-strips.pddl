( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b720 - block
    b849 - block
    b686 - block
    b923 - block
    b5 - block
    b271 - block
    b222 - block
    b475 - block
    b883 - block
    b429 - block
    b922 - block
    b194 - block
    b114 - block
    b575 - block
    b733 - block
    b598 - block
    b360 - block
    b818 - block
    b479 - block
    b273 - block
    b225 - block
    b237 - block
    b181 - block
    b601 - block
    b646 - block
    b406 - block
    b311 - block
    b1 - block
    b253 - block
    b33 - block
    b260 - block
    b582 - block
    b708 - block
    b6 - block
    b899 - block
    b251 - block
    b788 - block
    b42 - block
    b675 - block
    b879 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b720 )
    ( on b849 b720 )
    ( on b686 b849 )
    ( on b923 b686 )
    ( on b5 b923 )
    ( on b271 b5 )
    ( on b222 b271 )
    ( on b475 b222 )
    ( on b883 b475 )
    ( on b429 b883 )
    ( on b922 b429 )
    ( on b194 b922 )
    ( on b114 b194 )
    ( on b575 b114 )
    ( on b733 b575 )
    ( on b598 b733 )
    ( on b360 b598 )
    ( on b818 b360 )
    ( on b479 b818 )
    ( on b273 b479 )
    ( on b225 b273 )
    ( on b237 b225 )
    ( on b181 b237 )
    ( on b601 b181 )
    ( on b646 b601 )
    ( on b406 b646 )
    ( on b311 b406 )
    ( on b1 b311 )
    ( on b253 b1 )
    ( on b33 b253 )
    ( on b260 b33 )
    ( on b582 b260 )
    ( on b708 b582 )
    ( on b6 b708 )
    ( on b899 b6 )
    ( on b251 b899 )
    ( on b788 b251 )
    ( on b42 b788 )
    ( on b675 b42 )
    ( on b879 b675 )
    ( clear b879 )
  )
  ( :goal
    ( and
      ( clear b720 )
    )
  )
)
