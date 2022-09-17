( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b876 - block
    b293 - block
    b95 - block
    b478 - block
    b925 - block
    b399 - block
    b970 - block
    b148 - block
    b705 - block
    b531 - block
    b236 - block
    b423 - block
    b556 - block
    b579 - block
    b289 - block
    b562 - block
    b107 - block
    b106 - block
    b908 - block
    b511 - block
    b902 - block
    b618 - block
    b749 - block
    b349 - block
    b428 - block
    b394 - block
    b8 - block
    b996 - block
    b624 - block
    b932 - block
    b512 - block
    b957 - block
    b625 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b876 b965 )
    ( on b293 b876 )
    ( on b95 b293 )
    ( on b478 b95 )
    ( on b925 b478 )
    ( on b399 b925 )
    ( on b970 b399 )
    ( on b148 b970 )
    ( on b705 b148 )
    ( on b531 b705 )
    ( on b236 b531 )
    ( on b423 b236 )
    ( on b556 b423 )
    ( on b579 b556 )
    ( on b289 b579 )
    ( on b562 b289 )
    ( on b107 b562 )
    ( on b106 b107 )
    ( on b908 b106 )
    ( on b511 b908 )
    ( on b902 b511 )
    ( on b618 b902 )
    ( on b749 b618 )
    ( on b349 b749 )
    ( on b428 b349 )
    ( on b394 b428 )
    ( on b8 b394 )
    ( on b996 b8 )
    ( on b624 b996 )
    ( on b932 b624 )
    ( on b512 b932 )
    ( on b957 b512 )
    ( on b625 b957 )
    ( clear b625 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
