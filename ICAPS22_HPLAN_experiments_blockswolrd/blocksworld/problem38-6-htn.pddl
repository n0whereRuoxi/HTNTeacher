( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b238 - block
    b328 - block
    b408 - block
    b291 - block
    b579 - block
    b121 - block
    b192 - block
    b894 - block
    b687 - block
    b220 - block
    b350 - block
    b889 - block
    b389 - block
    b457 - block
    b102 - block
    b289 - block
    b590 - block
    b143 - block
    b933 - block
    b130 - block
    b94 - block
    b366 - block
    b249 - block
    b843 - block
    b365 - block
    b90 - block
    b881 - block
    b31 - block
    b714 - block
    b800 - block
    b580 - block
    b692 - block
    b131 - block
    b361 - block
    b667 - block
    b594 - block
    b168 - block
    b955 - block
    b169 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b238 )
    ( on b328 b238 )
    ( on b408 b328 )
    ( on b291 b408 )
    ( on b579 b291 )
    ( on b121 b579 )
    ( on b192 b121 )
    ( on b894 b192 )
    ( on b687 b894 )
    ( on b220 b687 )
    ( on b350 b220 )
    ( on b889 b350 )
    ( on b389 b889 )
    ( on b457 b389 )
    ( on b102 b457 )
    ( on b289 b102 )
    ( on b590 b289 )
    ( on b143 b590 )
    ( on b933 b143 )
    ( on b130 b933 )
    ( on b94 b130 )
    ( on b366 b94 )
    ( on b249 b366 )
    ( on b843 b249 )
    ( on b365 b843 )
    ( on b90 b365 )
    ( on b881 b90 )
    ( on b31 b881 )
    ( on b714 b31 )
    ( on b800 b714 )
    ( on b580 b800 )
    ( on b692 b580 )
    ( on b131 b692 )
    ( on b361 b131 )
    ( on b667 b361 )
    ( on b594 b667 )
    ( on b168 b594 )
    ( on b955 b168 )
    ( on b169 b955 )
    ( clear b169 )
  )
  ( :tasks
    ( Make-38Pile b328 b408 b291 b579 b121 b192 b894 b687 b220 b350 b889 b389 b457 b102 b289 b590 b143 b933 b130 b94 b366 b249 b843 b365 b90 b881 b31 b714 b800 b580 b692 b131 b361 b667 b594 b168 b955 b169 )
  )
)
