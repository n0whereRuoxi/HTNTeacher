( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b522 - block
    b949 - block
    b835 - block
    b130 - block
    b916 - block
    b249 - block
    b928 - block
    b871 - block
    b902 - block
    b83 - block
    b90 - block
    b315 - block
    b734 - block
    b790 - block
    b671 - block
    b256 - block
    b476 - block
    b253 - block
    b99 - block
    b731 - block
    b272 - block
    b472 - block
    b847 - block
    b513 - block
    b2 - block
    b758 - block
    b516 - block
    b302 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b522 )
    ( on b949 b522 )
    ( on b835 b949 )
    ( on b130 b835 )
    ( on b916 b130 )
    ( on b249 b916 )
    ( on b928 b249 )
    ( on b871 b928 )
    ( on b902 b871 )
    ( on b83 b902 )
    ( on b90 b83 )
    ( on b315 b90 )
    ( on b734 b315 )
    ( on b790 b734 )
    ( on b671 b790 )
    ( on b256 b671 )
    ( on b476 b256 )
    ( on b253 b476 )
    ( on b99 b253 )
    ( on b731 b99 )
    ( on b272 b731 )
    ( on b472 b272 )
    ( on b847 b472 )
    ( on b513 b847 )
    ( on b2 b513 )
    ( on b758 b2 )
    ( on b516 b758 )
    ( on b302 b516 )
    ( clear b302 )
  )
  ( :goal
    ( and
      ( clear b522 )
    )
  )
)
