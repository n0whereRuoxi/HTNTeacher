( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b667 - block
    b464 - block
    b805 - block
    b133 - block
    b682 - block
    b555 - block
    b470 - block
    b336 - block
    b843 - block
    b576 - block
    b84 - block
    b289 - block
    b455 - block
    b897 - block
    b763 - block
    b396 - block
    b319 - block
    b323 - block
    b344 - block
    b615 - block
    b853 - block
    b259 - block
    b421 - block
    b47 - block
    b983 - block
    b941 - block
    b690 - block
    b673 - block
    b796 - block
    b304 - block
    b405 - block
    b412 - block
    b66 - block
    b693 - block
    b886 - block
    b232 - block
    b980 - block
    b195 - block
    b670 - block
    b159 - block
    b403 - block
    b844 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b667 )
    ( on b464 b667 )
    ( on b805 b464 )
    ( on b133 b805 )
    ( on b682 b133 )
    ( on b555 b682 )
    ( on b470 b555 )
    ( on b336 b470 )
    ( on b843 b336 )
    ( on b576 b843 )
    ( on b84 b576 )
    ( on b289 b84 )
    ( on b455 b289 )
    ( on b897 b455 )
    ( on b763 b897 )
    ( on b396 b763 )
    ( on b319 b396 )
    ( on b323 b319 )
    ( on b344 b323 )
    ( on b615 b344 )
    ( on b853 b615 )
    ( on b259 b853 )
    ( on b421 b259 )
    ( on b47 b421 )
    ( on b983 b47 )
    ( on b941 b983 )
    ( on b690 b941 )
    ( on b673 b690 )
    ( on b796 b673 )
    ( on b304 b796 )
    ( on b405 b304 )
    ( on b412 b405 )
    ( on b66 b412 )
    ( on b693 b66 )
    ( on b886 b693 )
    ( on b232 b886 )
    ( on b980 b232 )
    ( on b195 b980 )
    ( on b670 b195 )
    ( on b159 b670 )
    ( on b403 b159 )
    ( on b844 b403 )
    ( clear b844 )
  )
  ( :goal
    ( and
      ( clear b667 )
    )
  )
)
