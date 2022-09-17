( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b560 - block
    b517 - block
    b662 - block
    b498 - block
    b823 - block
    b102 - block
    b863 - block
    b634 - block
    b504 - block
    b825 - block
    b130 - block
    b650 - block
    b101 - block
    b276 - block
    b882 - block
    b396 - block
    b211 - block
    b830 - block
    b923 - block
    b325 - block
    b477 - block
    b967 - block
    b370 - block
    b438 - block
    b557 - block
    b135 - block
    b216 - block
    b669 - block
    b469 - block
    b668 - block
    b421 - block
    b809 - block
    b41 - block
    b853 - block
    b810 - block
    b457 - block
    b872 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b560 )
    ( on b517 b560 )
    ( on b662 b517 )
    ( on b498 b662 )
    ( on b823 b498 )
    ( on b102 b823 )
    ( on b863 b102 )
    ( on b634 b863 )
    ( on b504 b634 )
    ( on b825 b504 )
    ( on b130 b825 )
    ( on b650 b130 )
    ( on b101 b650 )
    ( on b276 b101 )
    ( on b882 b276 )
    ( on b396 b882 )
    ( on b211 b396 )
    ( on b830 b211 )
    ( on b923 b830 )
    ( on b325 b923 )
    ( on b477 b325 )
    ( on b967 b477 )
    ( on b370 b967 )
    ( on b438 b370 )
    ( on b557 b438 )
    ( on b135 b557 )
    ( on b216 b135 )
    ( on b669 b216 )
    ( on b469 b669 )
    ( on b668 b469 )
    ( on b421 b668 )
    ( on b809 b421 )
    ( on b41 b809 )
    ( on b853 b41 )
    ( on b810 b853 )
    ( on b457 b810 )
    ( on b872 b457 )
    ( clear b872 )
  )
  ( :tasks
    ( Make-36Pile b517 b662 b498 b823 b102 b863 b634 b504 b825 b130 b650 b101 b276 b882 b396 b211 b830 b923 b325 b477 b967 b370 b438 b557 b135 b216 b669 b469 b668 b421 b809 b41 b853 b810 b457 b872 )
  )
)
