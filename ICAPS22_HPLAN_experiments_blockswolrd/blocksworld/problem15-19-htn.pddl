( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b462 - block
    b77 - block
    b636 - block
    b426 - block
    b892 - block
    b328 - block
    b787 - block
    b312 - block
    b136 - block
    b611 - block
    b962 - block
    b657 - block
    b692 - block
    b434 - block
    b323 - block
    b911 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b462 )
    ( on b77 b462 )
    ( on b636 b77 )
    ( on b426 b636 )
    ( on b892 b426 )
    ( on b328 b892 )
    ( on b787 b328 )
    ( on b312 b787 )
    ( on b136 b312 )
    ( on b611 b136 )
    ( on b962 b611 )
    ( on b657 b962 )
    ( on b692 b657 )
    ( on b434 b692 )
    ( on b323 b434 )
    ( on b911 b323 )
    ( clear b911 )
  )
  ( :tasks
    ( Make-15Pile b77 b636 b426 b892 b328 b787 b312 b136 b611 b962 b657 b692 b434 b323 b911 )
  )
)
