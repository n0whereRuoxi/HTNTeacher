( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b75 - block
    b753 - block
    b770 - block
    b960 - block
    b781 - block
    b517 - block
    b747 - block
    b935 - block
    b255 - block
    b290 - block
    b574 - block
    b899 - block
    b515 - block
    b168 - block
    b212 - block
    b42 - block
    b479 - block
    b235 - block
    b672 - block
    b177 - block
    b644 - block
    b261 - block
    b701 - block
    b344 - block
    b96 - block
    b328 - block
    b184 - block
    b760 - block
    b897 - block
    b205 - block
    b673 - block
    b624 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b75 )
    ( on b753 b75 )
    ( on b770 b753 )
    ( on b960 b770 )
    ( on b781 b960 )
    ( on b517 b781 )
    ( on b747 b517 )
    ( on b935 b747 )
    ( on b255 b935 )
    ( on b290 b255 )
    ( on b574 b290 )
    ( on b899 b574 )
    ( on b515 b899 )
    ( on b168 b515 )
    ( on b212 b168 )
    ( on b42 b212 )
    ( on b479 b42 )
    ( on b235 b479 )
    ( on b672 b235 )
    ( on b177 b672 )
    ( on b644 b177 )
    ( on b261 b644 )
    ( on b701 b261 )
    ( on b344 b701 )
    ( on b96 b344 )
    ( on b328 b96 )
    ( on b184 b328 )
    ( on b760 b184 )
    ( on b897 b760 )
    ( on b205 b897 )
    ( on b673 b205 )
    ( on b624 b673 )
    ( clear b624 )
  )
  ( :goal
    ( and
      ( clear b75 )
    )
  )
)
