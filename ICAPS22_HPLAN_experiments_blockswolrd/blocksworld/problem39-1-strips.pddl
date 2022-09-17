( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b956 - block
    b134 - block
    b328 - block
    b921 - block
    b164 - block
    b619 - block
    b578 - block
    b455 - block
    b315 - block
    b419 - block
    b529 - block
    b655 - block
    b561 - block
    b634 - block
    b784 - block
    b345 - block
    b97 - block
    b8 - block
    b670 - block
    b63 - block
    b978 - block
    b822 - block
    b731 - block
    b635 - block
    b160 - block
    b199 - block
    b881 - block
    b681 - block
    b72 - block
    b770 - block
    b724 - block
    b431 - block
    b794 - block
    b414 - block
    b463 - block
    b105 - block
    b696 - block
    b845 - block
    b494 - block
    b564 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b956 )
    ( on b134 b956 )
    ( on b328 b134 )
    ( on b921 b328 )
    ( on b164 b921 )
    ( on b619 b164 )
    ( on b578 b619 )
    ( on b455 b578 )
    ( on b315 b455 )
    ( on b419 b315 )
    ( on b529 b419 )
    ( on b655 b529 )
    ( on b561 b655 )
    ( on b634 b561 )
    ( on b784 b634 )
    ( on b345 b784 )
    ( on b97 b345 )
    ( on b8 b97 )
    ( on b670 b8 )
    ( on b63 b670 )
    ( on b978 b63 )
    ( on b822 b978 )
    ( on b731 b822 )
    ( on b635 b731 )
    ( on b160 b635 )
    ( on b199 b160 )
    ( on b881 b199 )
    ( on b681 b881 )
    ( on b72 b681 )
    ( on b770 b72 )
    ( on b724 b770 )
    ( on b431 b724 )
    ( on b794 b431 )
    ( on b414 b794 )
    ( on b463 b414 )
    ( on b105 b463 )
    ( on b696 b105 )
    ( on b845 b696 )
    ( on b494 b845 )
    ( on b564 b494 )
    ( clear b564 )
  )
  ( :goal
    ( and
      ( clear b956 )
    )
  )
)
