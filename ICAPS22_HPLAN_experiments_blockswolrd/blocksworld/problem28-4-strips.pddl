( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b635 - block
    b186 - block
    b399 - block
    b771 - block
    b248 - block
    b532 - block
    b81 - block
    b681 - block
    b646 - block
    b394 - block
    b792 - block
    b275 - block
    b487 - block
    b47 - block
    b943 - block
    b37 - block
    b58 - block
    b419 - block
    b851 - block
    b486 - block
    b988 - block
    b925 - block
    b934 - block
    b156 - block
    b540 - block
    b659 - block
    b824 - block
    b294 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b635 )
    ( on b186 b635 )
    ( on b399 b186 )
    ( on b771 b399 )
    ( on b248 b771 )
    ( on b532 b248 )
    ( on b81 b532 )
    ( on b681 b81 )
    ( on b646 b681 )
    ( on b394 b646 )
    ( on b792 b394 )
    ( on b275 b792 )
    ( on b487 b275 )
    ( on b47 b487 )
    ( on b943 b47 )
    ( on b37 b943 )
    ( on b58 b37 )
    ( on b419 b58 )
    ( on b851 b419 )
    ( on b486 b851 )
    ( on b988 b486 )
    ( on b925 b988 )
    ( on b934 b925 )
    ( on b156 b934 )
    ( on b540 b156 )
    ( on b659 b540 )
    ( on b824 b659 )
    ( on b294 b824 )
    ( on b437 b294 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b635 )
    )
  )
)
