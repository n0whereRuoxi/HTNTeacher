( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b336 - block
    b437 - block
    b624 - block
    b263 - block
    b740 - block
    b701 - block
    b146 - block
    b878 - block
    b755 - block
    b18 - block
    b252 - block
    b479 - block
    b101 - block
    b863 - block
    b809 - block
    b859 - block
    b499 - block
    b94 - block
    b644 - block
    b477 - block
    b974 - block
    b650 - block
    b188 - block
    b735 - block
    b242 - block
    b549 - block
    b62 - block
    b298 - block
    b462 - block
    b369 - block
    b922 - block
    b145 - block
    b910 - block
    b754 - block
    b929 - block
    b546 - block
    b640 - block
    b949 - block
    b26 - block
    b347 - block
    b686 - block
    b209 - block
    b770 - block
    b251 - block
    b632 - block
    b235 - block
    b481 - block
    b894 - block
    b144 - block
    b893 - block
    b913 - block
    b905 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b336 )
    ( on b437 b336 )
    ( on b624 b437 )
    ( on b263 b624 )
    ( on b740 b263 )
    ( on b701 b740 )
    ( on b146 b701 )
    ( on b878 b146 )
    ( on b755 b878 )
    ( on b18 b755 )
    ( on b252 b18 )
    ( on b479 b252 )
    ( on b101 b479 )
    ( on b863 b101 )
    ( on b809 b863 )
    ( on b859 b809 )
    ( on b499 b859 )
    ( on b94 b499 )
    ( on b644 b94 )
    ( on b477 b644 )
    ( on b974 b477 )
    ( on b650 b974 )
    ( on b188 b650 )
    ( on b735 b188 )
    ( on b242 b735 )
    ( on b549 b242 )
    ( on b62 b549 )
    ( on b298 b62 )
    ( on b462 b298 )
    ( on b369 b462 )
    ( on b922 b369 )
    ( on b145 b922 )
    ( on b910 b145 )
    ( on b754 b910 )
    ( on b929 b754 )
    ( on b546 b929 )
    ( on b640 b546 )
    ( on b949 b640 )
    ( on b26 b949 )
    ( on b347 b26 )
    ( on b686 b347 )
    ( on b209 b686 )
    ( on b770 b209 )
    ( on b251 b770 )
    ( on b632 b251 )
    ( on b235 b632 )
    ( on b481 b235 )
    ( on b894 b481 )
    ( on b144 b894 )
    ( on b893 b144 )
    ( on b913 b893 )
    ( on b905 b913 )
    ( clear b905 )
  )
  ( :goal
    ( and
      ( clear b336 )
    )
  )
)
