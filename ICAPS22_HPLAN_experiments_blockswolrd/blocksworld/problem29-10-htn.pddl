( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b678 - block
    b388 - block
    b251 - block
    b308 - block
    b901 - block
    b970 - block
    b785 - block
    b93 - block
    b150 - block
    b327 - block
    b966 - block
    b282 - block
    b752 - block
    b27 - block
    b841 - block
    b435 - block
    b483 - block
    b819 - block
    b461 - block
    b206 - block
    b146 - block
    b943 - block
    b352 - block
    b214 - block
    b104 - block
    b609 - block
    b255 - block
    b4 - block
    b549 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b678 )
    ( on b388 b678 )
    ( on b251 b388 )
    ( on b308 b251 )
    ( on b901 b308 )
    ( on b970 b901 )
    ( on b785 b970 )
    ( on b93 b785 )
    ( on b150 b93 )
    ( on b327 b150 )
    ( on b966 b327 )
    ( on b282 b966 )
    ( on b752 b282 )
    ( on b27 b752 )
    ( on b841 b27 )
    ( on b435 b841 )
    ( on b483 b435 )
    ( on b819 b483 )
    ( on b461 b819 )
    ( on b206 b461 )
    ( on b146 b206 )
    ( on b943 b146 )
    ( on b352 b943 )
    ( on b214 b352 )
    ( on b104 b214 )
    ( on b609 b104 )
    ( on b255 b609 )
    ( on b4 b255 )
    ( on b549 b4 )
    ( on b457 b549 )
    ( clear b457 )
  )
  ( :tasks
    ( Make-29Pile b388 b251 b308 b901 b970 b785 b93 b150 b327 b966 b282 b752 b27 b841 b435 b483 b819 b461 b206 b146 b943 b352 b214 b104 b609 b255 b4 b549 b457 )
  )
)
