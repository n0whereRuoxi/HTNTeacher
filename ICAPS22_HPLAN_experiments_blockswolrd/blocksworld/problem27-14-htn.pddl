( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b488 - block
    b436 - block
    b887 - block
    b266 - block
    b668 - block
    b29 - block
    b134 - block
    b633 - block
    b622 - block
    b829 - block
    b225 - block
    b428 - block
    b525 - block
    b883 - block
    b477 - block
    b39 - block
    b575 - block
    b943 - block
    b573 - block
    b782 - block
    b945 - block
    b515 - block
    b687 - block
    b997 - block
    b153 - block
    b288 - block
    b159 - block
    b451 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b488 )
    ( on b436 b488 )
    ( on b887 b436 )
    ( on b266 b887 )
    ( on b668 b266 )
    ( on b29 b668 )
    ( on b134 b29 )
    ( on b633 b134 )
    ( on b622 b633 )
    ( on b829 b622 )
    ( on b225 b829 )
    ( on b428 b225 )
    ( on b525 b428 )
    ( on b883 b525 )
    ( on b477 b883 )
    ( on b39 b477 )
    ( on b575 b39 )
    ( on b943 b575 )
    ( on b573 b943 )
    ( on b782 b573 )
    ( on b945 b782 )
    ( on b515 b945 )
    ( on b687 b515 )
    ( on b997 b687 )
    ( on b153 b997 )
    ( on b288 b153 )
    ( on b159 b288 )
    ( on b451 b159 )
    ( clear b451 )
  )
  ( :tasks
    ( Make-27Pile b436 b887 b266 b668 b29 b134 b633 b622 b829 b225 b428 b525 b883 b477 b39 b575 b943 b573 b782 b945 b515 b687 b997 b153 b288 b159 b451 )
  )
)
