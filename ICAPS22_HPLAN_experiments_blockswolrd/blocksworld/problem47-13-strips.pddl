( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b159 - block
    b429 - block
    b914 - block
    b805 - block
    b560 - block
    b661 - block
    b714 - block
    b732 - block
    b271 - block
    b841 - block
    b195 - block
    b324 - block
    b275 - block
    b528 - block
    b437 - block
    b483 - block
    b460 - block
    b88 - block
    b43 - block
    b220 - block
    b648 - block
    b192 - block
    b235 - block
    b125 - block
    b325 - block
    b891 - block
    b270 - block
    b390 - block
    b261 - block
    b452 - block
    b202 - block
    b688 - block
    b330 - block
    b970 - block
    b833 - block
    b759 - block
    b720 - block
    b142 - block
    b769 - block
    b194 - block
    b537 - block
    b727 - block
    b200 - block
    b290 - block
    b384 - block
    b635 - block
    b760 - block
    b836 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b159 )
    ( on b429 b159 )
    ( on b914 b429 )
    ( on b805 b914 )
    ( on b560 b805 )
    ( on b661 b560 )
    ( on b714 b661 )
    ( on b732 b714 )
    ( on b271 b732 )
    ( on b841 b271 )
    ( on b195 b841 )
    ( on b324 b195 )
    ( on b275 b324 )
    ( on b528 b275 )
    ( on b437 b528 )
    ( on b483 b437 )
    ( on b460 b483 )
    ( on b88 b460 )
    ( on b43 b88 )
    ( on b220 b43 )
    ( on b648 b220 )
    ( on b192 b648 )
    ( on b235 b192 )
    ( on b125 b235 )
    ( on b325 b125 )
    ( on b891 b325 )
    ( on b270 b891 )
    ( on b390 b270 )
    ( on b261 b390 )
    ( on b452 b261 )
    ( on b202 b452 )
    ( on b688 b202 )
    ( on b330 b688 )
    ( on b970 b330 )
    ( on b833 b970 )
    ( on b759 b833 )
    ( on b720 b759 )
    ( on b142 b720 )
    ( on b769 b142 )
    ( on b194 b769 )
    ( on b537 b194 )
    ( on b727 b537 )
    ( on b200 b727 )
    ( on b290 b200 )
    ( on b384 b290 )
    ( on b635 b384 )
    ( on b760 b635 )
    ( on b836 b760 )
    ( clear b836 )
  )
  ( :goal
    ( and
      ( clear b159 )
    )
  )
)
