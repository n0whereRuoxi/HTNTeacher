( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b966 - block
    b262 - block
    b67 - block
    b959 - block
    b471 - block
    b813 - block
    b6 - block
    b469 - block
    b658 - block
    b808 - block
    b392 - block
    b656 - block
    b854 - block
    b564 - block
    b287 - block
    b670 - block
    b910 - block
    b781 - block
    b182 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b966 )
    ( on b262 b966 )
    ( on b67 b262 )
    ( on b959 b67 )
    ( on b471 b959 )
    ( on b813 b471 )
    ( on b6 b813 )
    ( on b469 b6 )
    ( on b658 b469 )
    ( on b808 b658 )
    ( on b392 b808 )
    ( on b656 b392 )
    ( on b854 b656 )
    ( on b564 b854 )
    ( on b287 b564 )
    ( on b670 b287 )
    ( on b910 b670 )
    ( on b781 b910 )
    ( on b182 b781 )
    ( clear b182 )
  )
  ( :goal
    ( and
      ( clear b966 )
    )
  )
)
