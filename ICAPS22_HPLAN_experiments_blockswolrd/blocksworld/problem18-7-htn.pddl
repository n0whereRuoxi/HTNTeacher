( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b75 - block
    b590 - block
    b450 - block
    b25 - block
    b797 - block
    b841 - block
    b181 - block
    b940 - block
    b423 - block
    b163 - block
    b346 - block
    b389 - block
    b395 - block
    b354 - block
    b21 - block
    b536 - block
    b429 - block
    b840 - block
    b129 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b75 )
    ( on b590 b75 )
    ( on b450 b590 )
    ( on b25 b450 )
    ( on b797 b25 )
    ( on b841 b797 )
    ( on b181 b841 )
    ( on b940 b181 )
    ( on b423 b940 )
    ( on b163 b423 )
    ( on b346 b163 )
    ( on b389 b346 )
    ( on b395 b389 )
    ( on b354 b395 )
    ( on b21 b354 )
    ( on b536 b21 )
    ( on b429 b536 )
    ( on b840 b429 )
    ( on b129 b840 )
    ( clear b129 )
  )
  ( :tasks
    ( Make-18Pile b590 b450 b25 b797 b841 b181 b940 b423 b163 b346 b389 b395 b354 b21 b536 b429 b840 b129 )
  )
)
