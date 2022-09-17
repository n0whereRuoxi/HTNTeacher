( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b373 - block
    b129 - block
    b49 - block
    b736 - block
    b853 - block
    b123 - block
    b678 - block
    b509 - block
    b228 - block
    b507 - block
    b567 - block
    b184 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b373 )
    ( on b129 b373 )
    ( on b49 b129 )
    ( on b736 b49 )
    ( on b853 b736 )
    ( on b123 b853 )
    ( on b678 b123 )
    ( on b509 b678 )
    ( on b228 b509 )
    ( on b507 b228 )
    ( on b567 b507 )
    ( on b184 b567 )
    ( clear b184 )
  )
  ( :tasks
    ( Make-11Pile b129 b49 b736 b853 b123 b678 b509 b228 b507 b567 b184 )
  )
)
