( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b118 - block
    b313 - block
    b549 - block
    b720 - block
    b705 - block
    b787 - block
    b556 - block
    b551 - block
    b543 - block
    b967 - block
    b34 - block
    b719 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b118 )
    ( on b313 b118 )
    ( on b549 b313 )
    ( on b720 b549 )
    ( on b705 b720 )
    ( on b787 b705 )
    ( on b556 b787 )
    ( on b551 b556 )
    ( on b543 b551 )
    ( on b967 b543 )
    ( on b34 b967 )
    ( on b719 b34 )
    ( clear b719 )
  )
  ( :tasks
    ( Make-11Pile b313 b549 b720 b705 b787 b556 b551 b543 b967 b34 b719 )
  )
)
