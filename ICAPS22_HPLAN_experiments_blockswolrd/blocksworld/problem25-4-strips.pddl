( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b239 - block
    b93 - block
    b630 - block
    b629 - block
    b350 - block
    b449 - block
    b180 - block
    b424 - block
    b443 - block
    b548 - block
    b401 - block
    b591 - block
    b86 - block
    b805 - block
    b945 - block
    b703 - block
    b955 - block
    b482 - block
    b678 - block
    b539 - block
    b925 - block
    b618 - block
    b422 - block
    b877 - block
    b785 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b239 b71 )
    ( on b93 b239 )
    ( on b630 b93 )
    ( on b629 b630 )
    ( on b350 b629 )
    ( on b449 b350 )
    ( on b180 b449 )
    ( on b424 b180 )
    ( on b443 b424 )
    ( on b548 b443 )
    ( on b401 b548 )
    ( on b591 b401 )
    ( on b86 b591 )
    ( on b805 b86 )
    ( on b945 b805 )
    ( on b703 b945 )
    ( on b955 b703 )
    ( on b482 b955 )
    ( on b678 b482 )
    ( on b539 b678 )
    ( on b925 b539 )
    ( on b618 b925 )
    ( on b422 b618 )
    ( on b877 b422 )
    ( on b785 b877 )
    ( clear b785 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)
