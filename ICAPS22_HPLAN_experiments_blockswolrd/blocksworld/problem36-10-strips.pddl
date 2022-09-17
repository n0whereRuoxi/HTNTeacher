( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b817 - block
    b696 - block
    b261 - block
    b892 - block
    b30 - block
    b611 - block
    b48 - block
    b212 - block
    b619 - block
    b216 - block
    b211 - block
    b857 - block
    b561 - block
    b375 - block
    b584 - block
    b425 - block
    b458 - block
    b547 - block
    b721 - block
    b127 - block
    b281 - block
    b765 - block
    b568 - block
    b828 - block
    b713 - block
    b625 - block
    b153 - block
    b493 - block
    b306 - block
    b736 - block
    b897 - block
    b510 - block
    b231 - block
    b544 - block
    b678 - block
    b26 - block
    b543 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b817 )
    ( on b696 b817 )
    ( on b261 b696 )
    ( on b892 b261 )
    ( on b30 b892 )
    ( on b611 b30 )
    ( on b48 b611 )
    ( on b212 b48 )
    ( on b619 b212 )
    ( on b216 b619 )
    ( on b211 b216 )
    ( on b857 b211 )
    ( on b561 b857 )
    ( on b375 b561 )
    ( on b584 b375 )
    ( on b425 b584 )
    ( on b458 b425 )
    ( on b547 b458 )
    ( on b721 b547 )
    ( on b127 b721 )
    ( on b281 b127 )
    ( on b765 b281 )
    ( on b568 b765 )
    ( on b828 b568 )
    ( on b713 b828 )
    ( on b625 b713 )
    ( on b153 b625 )
    ( on b493 b153 )
    ( on b306 b493 )
    ( on b736 b306 )
    ( on b897 b736 )
    ( on b510 b897 )
    ( on b231 b510 )
    ( on b544 b231 )
    ( on b678 b544 )
    ( on b26 b678 )
    ( on b543 b26 )
    ( clear b543 )
  )
  ( :goal
    ( and
      ( clear b817 )
    )
  )
)
