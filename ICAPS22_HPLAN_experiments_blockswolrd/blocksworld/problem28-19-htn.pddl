( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b221 - block
    b133 - block
    b227 - block
    b147 - block
    b440 - block
    b144 - block
    b621 - block
    b143 - block
    b225 - block
    b153 - block
    b355 - block
    b117 - block
    b751 - block
    b374 - block
    b753 - block
    b659 - block
    b766 - block
    b947 - block
    b233 - block
    b564 - block
    b913 - block
    b335 - block
    b350 - block
    b561 - block
    b137 - block
    b857 - block
    b983 - block
    b35 - block
    b617 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b133 b221 )
    ( on b227 b133 )
    ( on b147 b227 )
    ( on b440 b147 )
    ( on b144 b440 )
    ( on b621 b144 )
    ( on b143 b621 )
    ( on b225 b143 )
    ( on b153 b225 )
    ( on b355 b153 )
    ( on b117 b355 )
    ( on b751 b117 )
    ( on b374 b751 )
    ( on b753 b374 )
    ( on b659 b753 )
    ( on b766 b659 )
    ( on b947 b766 )
    ( on b233 b947 )
    ( on b564 b233 )
    ( on b913 b564 )
    ( on b335 b913 )
    ( on b350 b335 )
    ( on b561 b350 )
    ( on b137 b561 )
    ( on b857 b137 )
    ( on b983 b857 )
    ( on b35 b983 )
    ( on b617 b35 )
    ( clear b617 )
  )
  ( :tasks
    ( Make-28Pile b133 b227 b147 b440 b144 b621 b143 b225 b153 b355 b117 b751 b374 b753 b659 b766 b947 b233 b564 b913 b335 b350 b561 b137 b857 b983 b35 b617 )
  )
)
