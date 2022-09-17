( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b769 - block
    b377 - block
    b419 - block
    b259 - block
    b448 - block
    b994 - block
    b825 - block
    b290 - block
    b622 - block
    b155 - block
    b407 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b769 )
    ( on b377 b769 )
    ( on b419 b377 )
    ( on b259 b419 )
    ( on b448 b259 )
    ( on b994 b448 )
    ( on b825 b994 )
    ( on b290 b825 )
    ( on b622 b290 )
    ( on b155 b622 )
    ( on b407 b155 )
    ( clear b407 )
  )
  ( :tasks
    ( Make-10Pile b377 b419 b259 b448 b994 b825 b290 b622 b155 b407 )
  )
)
