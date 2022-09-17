( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b356 - block
    b588 - block
    b327 - block
    b322 - block
    b342 - block
    b256 - block
    b472 - block
    b226 - block
    b90 - block
    b137 - block
    b971 - block
    b932 - block
    b859 - block
    b984 - block
    b781 - block
    b251 - block
    b862 - block
    b77 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b356 )
    ( on b588 b356 )
    ( on b327 b588 )
    ( on b322 b327 )
    ( on b342 b322 )
    ( on b256 b342 )
    ( on b472 b256 )
    ( on b226 b472 )
    ( on b90 b226 )
    ( on b137 b90 )
    ( on b971 b137 )
    ( on b932 b971 )
    ( on b859 b932 )
    ( on b984 b859 )
    ( on b781 b984 )
    ( on b251 b781 )
    ( on b862 b251 )
    ( on b77 b862 )
    ( clear b77 )
  )
  ( :goal
    ( and
      ( clear b356 )
    )
  )
)
