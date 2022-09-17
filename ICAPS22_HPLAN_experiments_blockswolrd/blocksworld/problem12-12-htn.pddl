( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b100 - block
    b763 - block
    b161 - block
    b437 - block
    b849 - block
    b652 - block
    b158 - block
    b241 - block
    b171 - block
    b574 - block
    b495 - block
    b358 - block
    b18 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b100 )
    ( on b763 b100 )
    ( on b161 b763 )
    ( on b437 b161 )
    ( on b849 b437 )
    ( on b652 b849 )
    ( on b158 b652 )
    ( on b241 b158 )
    ( on b171 b241 )
    ( on b574 b171 )
    ( on b495 b574 )
    ( on b358 b495 )
    ( on b18 b358 )
    ( clear b18 )
  )
  ( :tasks
    ( Make-12Pile b763 b161 b437 b849 b652 b158 b241 b171 b574 b495 b358 b18 )
  )
)
