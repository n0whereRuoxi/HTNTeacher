( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b910 - block
    b634 - block
    b236 - block
    b182 - block
    b351 - block
    b308 - block
    b761 - block
    b777 - block
    b387 - block
    b701 - block
    b352 - block
    b69 - block
    b233 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b910 )
    ( on b634 b910 )
    ( on b236 b634 )
    ( on b182 b236 )
    ( on b351 b182 )
    ( on b308 b351 )
    ( on b761 b308 )
    ( on b777 b761 )
    ( on b387 b777 )
    ( on b701 b387 )
    ( on b352 b701 )
    ( on b69 b352 )
    ( on b233 b69 )
    ( on b21 b233 )
    ( clear b21 )
  )
  ( :tasks
    ( Make-13Pile b634 b236 b182 b351 b308 b761 b777 b387 b701 b352 b69 b233 b21 )
  )
)
