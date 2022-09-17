( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b102 - block
    b128 - block
    b299 - block
    b951 - block
    b184 - block
    b456 - block
    b4 - block
    b976 - block
    b986 - block
    b864 - block
    b525 - block
    b120 - block
    b233 - block
    b621 - block
    b272 - block
    b768 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b102 )
    ( on b128 b102 )
    ( on b299 b128 )
    ( on b951 b299 )
    ( on b184 b951 )
    ( on b456 b184 )
    ( on b4 b456 )
    ( on b976 b4 )
    ( on b986 b976 )
    ( on b864 b986 )
    ( on b525 b864 )
    ( on b120 b525 )
    ( on b233 b120 )
    ( on b621 b233 )
    ( on b272 b621 )
    ( on b768 b272 )
    ( clear b768 )
  )
  ( :tasks
    ( Make-15Pile b128 b299 b951 b184 b456 b4 b976 b986 b864 b525 b120 b233 b621 b272 b768 )
  )
)
