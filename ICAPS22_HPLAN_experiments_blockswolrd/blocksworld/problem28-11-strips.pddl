( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b780 - block
    b466 - block
    b789 - block
    b143 - block
    b349 - block
    b879 - block
    b76 - block
    b221 - block
    b899 - block
    b145 - block
    b370 - block
    b60 - block
    b893 - block
    b336 - block
    b598 - block
    b83 - block
    b784 - block
    b69 - block
    b92 - block
    b85 - block
    b86 - block
    b379 - block
    b285 - block
    b67 - block
    b266 - block
    b653 - block
    b954 - block
    b897 - block
    b806 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b780 )
    ( on b466 b780 )
    ( on b789 b466 )
    ( on b143 b789 )
    ( on b349 b143 )
    ( on b879 b349 )
    ( on b76 b879 )
    ( on b221 b76 )
    ( on b899 b221 )
    ( on b145 b899 )
    ( on b370 b145 )
    ( on b60 b370 )
    ( on b893 b60 )
    ( on b336 b893 )
    ( on b598 b336 )
    ( on b83 b598 )
    ( on b784 b83 )
    ( on b69 b784 )
    ( on b92 b69 )
    ( on b85 b92 )
    ( on b86 b85 )
    ( on b379 b86 )
    ( on b285 b379 )
    ( on b67 b285 )
    ( on b266 b67 )
    ( on b653 b266 )
    ( on b954 b653 )
    ( on b897 b954 )
    ( on b806 b897 )
    ( clear b806 )
  )
  ( :goal
    ( and
      ( clear b780 )
    )
  )
)
