( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b717 - block
    b544 - block
    b699 - block
    b456 - block
    b207 - block
    b477 - block
    b370 - block
    b304 - block
    b87 - block
    b206 - block
    b53 - block
    b196 - block
    b328 - block
    b330 - block
    b217 - block
    b505 - block
    b912 - block
    b2 - block
    b761 - block
    b508 - block
    b703 - block
    b227 - block
    b959 - block
    b271 - block
    b888 - block
    b268 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b717 )
    ( on b544 b717 )
    ( on b699 b544 )
    ( on b456 b699 )
    ( on b207 b456 )
    ( on b477 b207 )
    ( on b370 b477 )
    ( on b304 b370 )
    ( on b87 b304 )
    ( on b206 b87 )
    ( on b53 b206 )
    ( on b196 b53 )
    ( on b328 b196 )
    ( on b330 b328 )
    ( on b217 b330 )
    ( on b505 b217 )
    ( on b912 b505 )
    ( on b2 b912 )
    ( on b761 b2 )
    ( on b508 b761 )
    ( on b703 b508 )
    ( on b227 b703 )
    ( on b959 b227 )
    ( on b271 b959 )
    ( on b888 b271 )
    ( on b268 b888 )
    ( clear b268 )
  )
  ( :tasks
    ( Make-25Pile b544 b699 b456 b207 b477 b370 b304 b87 b206 b53 b196 b328 b330 b217 b505 b912 b2 b761 b508 b703 b227 b959 b271 b888 b268 )
  )
)
