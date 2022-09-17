( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b907 - block
    b245 - block
    b117 - block
    b297 - block
    b130 - block
    b929 - block
    b345 - block
    b512 - block
    b307 - block
    b86 - block
    b407 - block
    b158 - block
    b759 - block
    b236 - block
    b823 - block
    b932 - block
    b865 - block
    b720 - block
    b53 - block
    b877 - block
    b457 - block
    b658 - block
    b174 - block
    b572 - block
    b471 - block
    b631 - block
    b599 - block
    b237 - block
    b772 - block
    b856 - block
    b507 - block
    b722 - block
    b355 - block
    b561 - block
    b665 - block
    b110 - block
    b138 - block
    b131 - block
    b719 - block
    b179 - block
    b504 - block
    b527 - block
    b21 - block
    b511 - block
    b539 - block
    b545 - block
    b2 - block
    b499 - block
    b976 - block
    b983 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b907 )
    ( on b245 b907 )
    ( on b117 b245 )
    ( on b297 b117 )
    ( on b130 b297 )
    ( on b929 b130 )
    ( on b345 b929 )
    ( on b512 b345 )
    ( on b307 b512 )
    ( on b86 b307 )
    ( on b407 b86 )
    ( on b158 b407 )
    ( on b759 b158 )
    ( on b236 b759 )
    ( on b823 b236 )
    ( on b932 b823 )
    ( on b865 b932 )
    ( on b720 b865 )
    ( on b53 b720 )
    ( on b877 b53 )
    ( on b457 b877 )
    ( on b658 b457 )
    ( on b174 b658 )
    ( on b572 b174 )
    ( on b471 b572 )
    ( on b631 b471 )
    ( on b599 b631 )
    ( on b237 b599 )
    ( on b772 b237 )
    ( on b856 b772 )
    ( on b507 b856 )
    ( on b722 b507 )
    ( on b355 b722 )
    ( on b561 b355 )
    ( on b665 b561 )
    ( on b110 b665 )
    ( on b138 b110 )
    ( on b131 b138 )
    ( on b719 b131 )
    ( on b179 b719 )
    ( on b504 b179 )
    ( on b527 b504 )
    ( on b21 b527 )
    ( on b511 b21 )
    ( on b539 b511 )
    ( on b545 b539 )
    ( on b2 b545 )
    ( on b499 b2 )
    ( on b976 b499 )
    ( on b983 b976 )
    ( clear b983 )
  )
  ( :goal
    ( and
      ( clear b907 )
    )
  )
)
