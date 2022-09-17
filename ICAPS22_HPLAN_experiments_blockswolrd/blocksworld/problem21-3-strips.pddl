( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b425 - block
    b186 - block
    b224 - block
    b34 - block
    b287 - block
    b706 - block
    b434 - block
    b264 - block
    b986 - block
    b250 - block
    b206 - block
    b580 - block
    b961 - block
    b404 - block
    b275 - block
    b618 - block
    b115 - block
    b417 - block
    b118 - block
    b197 - block
    b265 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b425 )
    ( on b186 b425 )
    ( on b224 b186 )
    ( on b34 b224 )
    ( on b287 b34 )
    ( on b706 b287 )
    ( on b434 b706 )
    ( on b264 b434 )
    ( on b986 b264 )
    ( on b250 b986 )
    ( on b206 b250 )
    ( on b580 b206 )
    ( on b961 b580 )
    ( on b404 b961 )
    ( on b275 b404 )
    ( on b618 b275 )
    ( on b115 b618 )
    ( on b417 b115 )
    ( on b118 b417 )
    ( on b197 b118 )
    ( on b265 b197 )
    ( on b231 b265 )
    ( clear b231 )
  )
  ( :goal
    ( and
      ( clear b425 )
    )
  )
)
