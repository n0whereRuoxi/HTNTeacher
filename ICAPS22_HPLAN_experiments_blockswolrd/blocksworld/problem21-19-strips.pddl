( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b417 - block
    b806 - block
    b196 - block
    b377 - block
    b852 - block
    b128 - block
    b524 - block
    b602 - block
    b504 - block
    b711 - block
    b617 - block
    b402 - block
    b293 - block
    b635 - block
    b22 - block
    b163 - block
    b700 - block
    b122 - block
    b305 - block
    b54 - block
    b618 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b417 b871 )
    ( on b806 b417 )
    ( on b196 b806 )
    ( on b377 b196 )
    ( on b852 b377 )
    ( on b128 b852 )
    ( on b524 b128 )
    ( on b602 b524 )
    ( on b504 b602 )
    ( on b711 b504 )
    ( on b617 b711 )
    ( on b402 b617 )
    ( on b293 b402 )
    ( on b635 b293 )
    ( on b22 b635 )
    ( on b163 b22 )
    ( on b700 b163 )
    ( on b122 b700 )
    ( on b305 b122 )
    ( on b54 b305 )
    ( on b618 b54 )
    ( clear b618 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
