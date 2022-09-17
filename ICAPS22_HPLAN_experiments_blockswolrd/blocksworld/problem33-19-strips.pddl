( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b808 - block
    b329 - block
    b284 - block
    b394 - block
    b819 - block
    b513 - block
    b489 - block
    b650 - block
    b23 - block
    b368 - block
    b937 - block
    b638 - block
    b622 - block
    b213 - block
    b455 - block
    b243 - block
    b120 - block
    b818 - block
    b441 - block
    b540 - block
    b423 - block
    b703 - block
    b955 - block
    b299 - block
    b349 - block
    b733 - block
    b737 - block
    b96 - block
    b712 - block
    b342 - block
    b374 - block
    b851 - block
    b724 - block
    b860 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b808 )
    ( on b329 b808 )
    ( on b284 b329 )
    ( on b394 b284 )
    ( on b819 b394 )
    ( on b513 b819 )
    ( on b489 b513 )
    ( on b650 b489 )
    ( on b23 b650 )
    ( on b368 b23 )
    ( on b937 b368 )
    ( on b638 b937 )
    ( on b622 b638 )
    ( on b213 b622 )
    ( on b455 b213 )
    ( on b243 b455 )
    ( on b120 b243 )
    ( on b818 b120 )
    ( on b441 b818 )
    ( on b540 b441 )
    ( on b423 b540 )
    ( on b703 b423 )
    ( on b955 b703 )
    ( on b299 b955 )
    ( on b349 b299 )
    ( on b733 b349 )
    ( on b737 b733 )
    ( on b96 b737 )
    ( on b712 b96 )
    ( on b342 b712 )
    ( on b374 b342 )
    ( on b851 b374 )
    ( on b724 b851 )
    ( on b860 b724 )
    ( clear b860 )
  )
  ( :goal
    ( and
      ( clear b808 )
    )
  )
)
