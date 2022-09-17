( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b224 - block
    b714 - block
    b97 - block
    b84 - block
    b721 - block
    b169 - block
    b65 - block
    b403 - block
    b277 - block
    b752 - block
    b675 - block
    b838 - block
    b777 - block
    b485 - block
    b580 - block
    b638 - block
    b932 - block
    b20 - block
    b921 - block
    b226 - block
    b531 - block
    b966 - block
    b591 - block
    b336 - block
    b592 - block
    b817 - block
    b799 - block
    b977 - block
    b327 - block
    b412 - block
    b667 - block
    b1 - block
    b627 - block
    b751 - block
    b657 - block
    b191 - block
    b100 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b224 )
    ( on b714 b224 )
    ( on b97 b714 )
    ( on b84 b97 )
    ( on b721 b84 )
    ( on b169 b721 )
    ( on b65 b169 )
    ( on b403 b65 )
    ( on b277 b403 )
    ( on b752 b277 )
    ( on b675 b752 )
    ( on b838 b675 )
    ( on b777 b838 )
    ( on b485 b777 )
    ( on b580 b485 )
    ( on b638 b580 )
    ( on b932 b638 )
    ( on b20 b932 )
    ( on b921 b20 )
    ( on b226 b921 )
    ( on b531 b226 )
    ( on b966 b531 )
    ( on b591 b966 )
    ( on b336 b591 )
    ( on b592 b336 )
    ( on b817 b592 )
    ( on b799 b817 )
    ( on b977 b799 )
    ( on b327 b977 )
    ( on b412 b327 )
    ( on b667 b412 )
    ( on b1 b667 )
    ( on b627 b1 )
    ( on b751 b627 )
    ( on b657 b751 )
    ( on b191 b657 )
    ( on b100 b191 )
    ( clear b100 )
  )
  ( :goal
    ( and
      ( clear b224 )
    )
  )
)
