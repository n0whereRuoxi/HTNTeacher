( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b618 - block
    b930 - block
    b353 - block
    b50 - block
    b330 - block
    b684 - block
    b556 - block
    b813 - block
    b926 - block
    b535 - block
    b512 - block
    b706 - block
    b835 - block
    b296 - block
    b555 - block
    b372 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b618 )
    ( on b930 b618 )
    ( on b353 b930 )
    ( on b50 b353 )
    ( on b330 b50 )
    ( on b684 b330 )
    ( on b556 b684 )
    ( on b813 b556 )
    ( on b926 b813 )
    ( on b535 b926 )
    ( on b512 b535 )
    ( on b706 b512 )
    ( on b835 b706 )
    ( on b296 b835 )
    ( on b555 b296 )
    ( on b372 b555 )
    ( clear b372 )
  )
  ( :goal
    ( and
      ( clear b618 )
    )
  )
)
