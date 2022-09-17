( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b761 - block
    b137 - block
    b71 - block
    b496 - block
    b637 - block
    b957 - block
    b379 - block
    b458 - block
    b606 - block
    b317 - block
    b418 - block
    b67 - block
    b198 - block
    b738 - block
    b206 - block
    b713 - block
    b55 - block
    b220 - block
    b721 - block
    b284 - block
    b664 - block
    b24 - block
    b398 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b761 )
    ( on b137 b761 )
    ( on b71 b137 )
    ( on b496 b71 )
    ( on b637 b496 )
    ( on b957 b637 )
    ( on b379 b957 )
    ( on b458 b379 )
    ( on b606 b458 )
    ( on b317 b606 )
    ( on b418 b317 )
    ( on b67 b418 )
    ( on b198 b67 )
    ( on b738 b198 )
    ( on b206 b738 )
    ( on b713 b206 )
    ( on b55 b713 )
    ( on b220 b55 )
    ( on b721 b220 )
    ( on b284 b721 )
    ( on b664 b284 )
    ( on b24 b664 )
    ( on b398 b24 )
    ( clear b398 )
  )
  ( :tasks
    ( Make-22Pile b137 b71 b496 b637 b957 b379 b458 b606 b317 b418 b67 b198 b738 b206 b713 b55 b220 b721 b284 b664 b24 b398 )
  )
)
