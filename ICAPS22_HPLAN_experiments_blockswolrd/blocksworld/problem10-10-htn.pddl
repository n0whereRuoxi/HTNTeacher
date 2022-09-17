( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b241 - block
    b886 - block
    b540 - block
    b317 - block
    b5 - block
    b798 - block
    b387 - block
    b13 - block
    b695 - block
    b643 - block
    b466 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b241 )
    ( on b886 b241 )
    ( on b540 b886 )
    ( on b317 b540 )
    ( on b5 b317 )
    ( on b798 b5 )
    ( on b387 b798 )
    ( on b13 b387 )
    ( on b695 b13 )
    ( on b643 b695 )
    ( on b466 b643 )
    ( clear b466 )
  )
  ( :tasks
    ( Make-10Pile b886 b540 b317 b5 b798 b387 b13 b695 b643 b466 )
  )
)
