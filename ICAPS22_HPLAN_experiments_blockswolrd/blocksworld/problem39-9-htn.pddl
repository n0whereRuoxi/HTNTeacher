( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b707 - block
    b88 - block
    b623 - block
    b970 - block
    b132 - block
    b440 - block
    b594 - block
    b300 - block
    b714 - block
    b701 - block
    b599 - block
    b872 - block
    b62 - block
    b162 - block
    b213 - block
    b515 - block
    b620 - block
    b387 - block
    b228 - block
    b68 - block
    b769 - block
    b915 - block
    b944 - block
    b423 - block
    b700 - block
    b192 - block
    b338 - block
    b573 - block
    b1 - block
    b260 - block
    b242 - block
    b313 - block
    b514 - block
    b233 - block
    b279 - block
    b818 - block
    b479 - block
    b672 - block
    b494 - block
    b657 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b88 b707 )
    ( on b623 b88 )
    ( on b970 b623 )
    ( on b132 b970 )
    ( on b440 b132 )
    ( on b594 b440 )
    ( on b300 b594 )
    ( on b714 b300 )
    ( on b701 b714 )
    ( on b599 b701 )
    ( on b872 b599 )
    ( on b62 b872 )
    ( on b162 b62 )
    ( on b213 b162 )
    ( on b515 b213 )
    ( on b620 b515 )
    ( on b387 b620 )
    ( on b228 b387 )
    ( on b68 b228 )
    ( on b769 b68 )
    ( on b915 b769 )
    ( on b944 b915 )
    ( on b423 b944 )
    ( on b700 b423 )
    ( on b192 b700 )
    ( on b338 b192 )
    ( on b573 b338 )
    ( on b1 b573 )
    ( on b260 b1 )
    ( on b242 b260 )
    ( on b313 b242 )
    ( on b514 b313 )
    ( on b233 b514 )
    ( on b279 b233 )
    ( on b818 b279 )
    ( on b479 b818 )
    ( on b672 b479 )
    ( on b494 b672 )
    ( on b657 b494 )
    ( clear b657 )
  )
  ( :tasks
    ( Make-39Pile b88 b623 b970 b132 b440 b594 b300 b714 b701 b599 b872 b62 b162 b213 b515 b620 b387 b228 b68 b769 b915 b944 b423 b700 b192 b338 b573 b1 b260 b242 b313 b514 b233 b279 b818 b479 b672 b494 b657 )
  )
)
