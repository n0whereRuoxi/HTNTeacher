( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b405 - block
    b511 - block
    b456 - block
    b687 - block
    b482 - block
    b507 - block
    b292 - block
    b595 - block
    b169 - block
    b876 - block
    b523 - block
    b882 - block
    b793 - block
    b992 - block
    b453 - block
    b881 - block
    b318 - block
    b487 - block
    b538 - block
    b686 - block
    b626 - block
    b656 - block
    b999 - block
    b924 - block
    b131 - block
    b846 - block
    b597 - block
    b398 - block
    b727 - block
    b250 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b405 )
    ( on b511 b405 )
    ( on b456 b511 )
    ( on b687 b456 )
    ( on b482 b687 )
    ( on b507 b482 )
    ( on b292 b507 )
    ( on b595 b292 )
    ( on b169 b595 )
    ( on b876 b169 )
    ( on b523 b876 )
    ( on b882 b523 )
    ( on b793 b882 )
    ( on b992 b793 )
    ( on b453 b992 )
    ( on b881 b453 )
    ( on b318 b881 )
    ( on b487 b318 )
    ( on b538 b487 )
    ( on b686 b538 )
    ( on b626 b686 )
    ( on b656 b626 )
    ( on b999 b656 )
    ( on b924 b999 )
    ( on b131 b924 )
    ( on b846 b131 )
    ( on b597 b846 )
    ( on b398 b597 )
    ( on b727 b398 )
    ( on b250 b727 )
    ( clear b250 )
  )
  ( :tasks
    ( Make-29Pile b511 b456 b687 b482 b507 b292 b595 b169 b876 b523 b882 b793 b992 b453 b881 b318 b487 b538 b686 b626 b656 b999 b924 b131 b846 b597 b398 b727 b250 )
  )
)
