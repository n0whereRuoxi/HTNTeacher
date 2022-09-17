( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b463 - block
    b884 - block
    b744 - block
    b862 - block
    b413 - block
    b304 - block
    b412 - block
    b325 - block
    b709 - block
    b932 - block
    b892 - block
    b850 - block
    b59 - block
    b115 - block
    b453 - block
    b36 - block
    b429 - block
    b675 - block
    b28 - block
    b101 - block
    b66 - block
    b427 - block
    b156 - block
    b539 - block
    b183 - block
    b42 - block
    b27 - block
    b129 - block
    b216 - block
    b213 - block
    b54 - block
    b77 - block
    b931 - block
    b723 - block
    b824 - block
    b885 - block
    b10 - block
    b638 - block
    b208 - block
    b278 - block
    b282 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b463 )
    ( on b884 b463 )
    ( on b744 b884 )
    ( on b862 b744 )
    ( on b413 b862 )
    ( on b304 b413 )
    ( on b412 b304 )
    ( on b325 b412 )
    ( on b709 b325 )
    ( on b932 b709 )
    ( on b892 b932 )
    ( on b850 b892 )
    ( on b59 b850 )
    ( on b115 b59 )
    ( on b453 b115 )
    ( on b36 b453 )
    ( on b429 b36 )
    ( on b675 b429 )
    ( on b28 b675 )
    ( on b101 b28 )
    ( on b66 b101 )
    ( on b427 b66 )
    ( on b156 b427 )
    ( on b539 b156 )
    ( on b183 b539 )
    ( on b42 b183 )
    ( on b27 b42 )
    ( on b129 b27 )
    ( on b216 b129 )
    ( on b213 b216 )
    ( on b54 b213 )
    ( on b77 b54 )
    ( on b931 b77 )
    ( on b723 b931 )
    ( on b824 b723 )
    ( on b885 b824 )
    ( on b10 b885 )
    ( on b638 b10 )
    ( on b208 b638 )
    ( on b278 b208 )
    ( on b282 b278 )
    ( clear b282 )
  )
  ( :goal
    ( and
      ( clear b463 )
    )
  )
)
