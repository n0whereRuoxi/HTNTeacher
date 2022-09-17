( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b172 - block
    b98 - block
    b754 - block
    b768 - block
    b327 - block
    b865 - block
    b562 - block
    b279 - block
    b497 - block
    b428 - block
    b831 - block
    b631 - block
    b115 - block
    b333 - block
    b955 - block
    b233 - block
    b826 - block
    b256 - block
    b307 - block
    b994 - block
    b813 - block
    b163 - block
    b205 - block
    b933 - block
    b939 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b172 )
    ( on b98 b172 )
    ( on b754 b98 )
    ( on b768 b754 )
    ( on b327 b768 )
    ( on b865 b327 )
    ( on b562 b865 )
    ( on b279 b562 )
    ( on b497 b279 )
    ( on b428 b497 )
    ( on b831 b428 )
    ( on b631 b831 )
    ( on b115 b631 )
    ( on b333 b115 )
    ( on b955 b333 )
    ( on b233 b955 )
    ( on b826 b233 )
    ( on b256 b826 )
    ( on b307 b256 )
    ( on b994 b307 )
    ( on b813 b994 )
    ( on b163 b813 )
    ( on b205 b163 )
    ( on b933 b205 )
    ( on b939 b933 )
    ( clear b939 )
  )
  ( :goal
    ( and
      ( clear b172 )
    )
  )
)
