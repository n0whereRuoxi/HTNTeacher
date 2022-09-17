( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b950 - block
    b225 - block
    b935 - block
    b170 - block
    b568 - block
    b713 - block
    b550 - block
    b795 - block
    b675 - block
    b483 - block
    b307 - block
    b918 - block
    b544 - block
    b239 - block
    b309 - block
    b44 - block
    b465 - block
    b68 - block
    b973 - block
    b546 - block
    b833 - block
    b853 - block
    b71 - block
    b626 - block
    b63 - block
    b285 - block
    b893 - block
    b458 - block
    b334 - block
    b715 - block
    b441 - block
    b389 - block
    b912 - block
    b887 - block
    b823 - block
    b124 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b950 )
    ( on b225 b950 )
    ( on b935 b225 )
    ( on b170 b935 )
    ( on b568 b170 )
    ( on b713 b568 )
    ( on b550 b713 )
    ( on b795 b550 )
    ( on b675 b795 )
    ( on b483 b675 )
    ( on b307 b483 )
    ( on b918 b307 )
    ( on b544 b918 )
    ( on b239 b544 )
    ( on b309 b239 )
    ( on b44 b309 )
    ( on b465 b44 )
    ( on b68 b465 )
    ( on b973 b68 )
    ( on b546 b973 )
    ( on b833 b546 )
    ( on b853 b833 )
    ( on b71 b853 )
    ( on b626 b71 )
    ( on b63 b626 )
    ( on b285 b63 )
    ( on b893 b285 )
    ( on b458 b893 )
    ( on b334 b458 )
    ( on b715 b334 )
    ( on b441 b715 )
    ( on b389 b441 )
    ( on b912 b389 )
    ( on b887 b912 )
    ( on b823 b887 )
    ( on b124 b823 )
    ( clear b124 )
  )
  ( :tasks
    ( Make-35Pile b225 b935 b170 b568 b713 b550 b795 b675 b483 b307 b918 b544 b239 b309 b44 b465 b68 b973 b546 b833 b853 b71 b626 b63 b285 b893 b458 b334 b715 b441 b389 b912 b887 b823 b124 )
  )
)
