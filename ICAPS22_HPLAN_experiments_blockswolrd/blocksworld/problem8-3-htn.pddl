( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b619 - block
    b361 - block
    b524 - block
    b320 - block
    b386 - block
    b327 - block
    b618 - block
    b267 - block
    b44 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b619 )
    ( on b361 b619 )
    ( on b524 b361 )
    ( on b320 b524 )
    ( on b386 b320 )
    ( on b327 b386 )
    ( on b618 b327 )
    ( on b267 b618 )
    ( on b44 b267 )
    ( clear b44 )
  )
  ( :tasks
    ( Make-8Pile b361 b524 b320 b386 b327 b618 b267 b44 )
  )
)
