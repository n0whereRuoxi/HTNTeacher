( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b406 - block
    b342 - block
    b577 - block
    b451 - block
    b72 - block
    b979 - block
    b927 - block
    b679 - block
    b111 - block
    b778 - block
    b351 - block
    b268 - block
    b456 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b406 )
    ( on b342 b406 )
    ( on b577 b342 )
    ( on b451 b577 )
    ( on b72 b451 )
    ( on b979 b72 )
    ( on b927 b979 )
    ( on b679 b927 )
    ( on b111 b679 )
    ( on b778 b111 )
    ( on b351 b778 )
    ( on b268 b351 )
    ( on b456 b268 )
    ( clear b456 )
  )
  ( :tasks
    ( Make-12Pile b342 b577 b451 b72 b979 b927 b679 b111 b778 b351 b268 b456 )
  )
)
