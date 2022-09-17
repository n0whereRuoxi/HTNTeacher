( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b68 - block
    b914 - block
    b78 - block
    b390 - block
    b435 - block
    b753 - block
    b179 - block
    b13 - block
    b459 - block
    b290 - block
    b694 - block
    b849 - block
    b190 - block
    b522 - block
    b407 - block
    b916 - block
    b236 - block
    b445 - block
    b331 - block
    b244 - block
    b602 - block
    b662 - block
    b484 - block
    b866 - block
    b967 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b68 )
    ( on b914 b68 )
    ( on b78 b914 )
    ( on b390 b78 )
    ( on b435 b390 )
    ( on b753 b435 )
    ( on b179 b753 )
    ( on b13 b179 )
    ( on b459 b13 )
    ( on b290 b459 )
    ( on b694 b290 )
    ( on b849 b694 )
    ( on b190 b849 )
    ( on b522 b190 )
    ( on b407 b522 )
    ( on b916 b407 )
    ( on b236 b916 )
    ( on b445 b236 )
    ( on b331 b445 )
    ( on b244 b331 )
    ( on b602 b244 )
    ( on b662 b602 )
    ( on b484 b662 )
    ( on b866 b484 )
    ( on b967 b866 )
    ( clear b967 )
  )
  ( :goal
    ( and
      ( clear b68 )
    )
  )
)
