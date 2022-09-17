( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b742 - block
    b499 - block
    b265 - block
    b10 - block
    b636 - block
    b182 - block
    b456 - block
    b855 - block
    b344 - block
    b105 - block
    b709 - block
    b333 - block
    b951 - block
    b443 - block
    b786 - block
    b372 - block
    b799 - block
    b875 - block
    b120 - block
    b910 - block
    b378 - block
    b516 - block
    b716 - block
    b671 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b742 )
    ( on b499 b742 )
    ( on b265 b499 )
    ( on b10 b265 )
    ( on b636 b10 )
    ( on b182 b636 )
    ( on b456 b182 )
    ( on b855 b456 )
    ( on b344 b855 )
    ( on b105 b344 )
    ( on b709 b105 )
    ( on b333 b709 )
    ( on b951 b333 )
    ( on b443 b951 )
    ( on b786 b443 )
    ( on b372 b786 )
    ( on b799 b372 )
    ( on b875 b799 )
    ( on b120 b875 )
    ( on b910 b120 )
    ( on b378 b910 )
    ( on b516 b378 )
    ( on b716 b516 )
    ( on b671 b716 )
    ( clear b671 )
  )
  ( :goal
    ( and
      ( clear b742 )
    )
  )
)
