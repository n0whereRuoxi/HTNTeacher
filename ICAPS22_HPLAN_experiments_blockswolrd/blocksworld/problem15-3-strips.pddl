( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b289 - block
    b627 - block
    b543 - block
    b758 - block
    b419 - block
    b230 - block
    b92 - block
    b409 - block
    b188 - block
    b817 - block
    b423 - block
    b968 - block
    b408 - block
    b680 - block
    b573 - block
    b32 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b289 )
    ( on b627 b289 )
    ( on b543 b627 )
    ( on b758 b543 )
    ( on b419 b758 )
    ( on b230 b419 )
    ( on b92 b230 )
    ( on b409 b92 )
    ( on b188 b409 )
    ( on b817 b188 )
    ( on b423 b817 )
    ( on b968 b423 )
    ( on b408 b968 )
    ( on b680 b408 )
    ( on b573 b680 )
    ( on b32 b573 )
    ( clear b32 )
  )
  ( :goal
    ( and
      ( clear b289 )
    )
  )
)
