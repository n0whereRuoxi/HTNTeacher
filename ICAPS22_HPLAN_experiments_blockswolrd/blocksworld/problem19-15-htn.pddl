( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b182 - block
    b624 - block
    b395 - block
    b61 - block
    b281 - block
    b549 - block
    b510 - block
    b197 - block
    b835 - block
    b785 - block
    b289 - block
    b782 - block
    b449 - block
    b318 - block
    b839 - block
    b337 - block
    b628 - block
    b283 - block
    b69 - block
    b649 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b182 )
    ( on b624 b182 )
    ( on b395 b624 )
    ( on b61 b395 )
    ( on b281 b61 )
    ( on b549 b281 )
    ( on b510 b549 )
    ( on b197 b510 )
    ( on b835 b197 )
    ( on b785 b835 )
    ( on b289 b785 )
    ( on b782 b289 )
    ( on b449 b782 )
    ( on b318 b449 )
    ( on b839 b318 )
    ( on b337 b839 )
    ( on b628 b337 )
    ( on b283 b628 )
    ( on b69 b283 )
    ( on b649 b69 )
    ( clear b649 )
  )
  ( :tasks
    ( Make-19Pile b624 b395 b61 b281 b549 b510 b197 b835 b785 b289 b782 b449 b318 b839 b337 b628 b283 b69 b649 )
  )
)
