( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b170 - block
    b489 - block
    b10 - block
    b250 - block
    b554 - block
    b436 - block
    b567 - block
    b297 - block
    b833 - block
    b673 - block
    b402 - block
    b167 - block
    b651 - block
    b852 - block
    b194 - block
    b655 - block
    b811 - block
    b378 - block
    b849 - block
    b634 - block
    b255 - block
    b235 - block
    b678 - block
    b617 - block
    b753 - block
    b514 - block
    b964 - block
    b20 - block
    b570 - block
    b981 - block
    b694 - block
    b338 - block
    b379 - block
    b794 - block
    b524 - block
    b930 - block
    b936 - block
    b654 - block
    b543 - block
    b76 - block
    b919 - block
    b451 - block
    b403 - block
    b165 - block
    b986 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b170 )
    ( on b489 b170 )
    ( on b10 b489 )
    ( on b250 b10 )
    ( on b554 b250 )
    ( on b436 b554 )
    ( on b567 b436 )
    ( on b297 b567 )
    ( on b833 b297 )
    ( on b673 b833 )
    ( on b402 b673 )
    ( on b167 b402 )
    ( on b651 b167 )
    ( on b852 b651 )
    ( on b194 b852 )
    ( on b655 b194 )
    ( on b811 b655 )
    ( on b378 b811 )
    ( on b849 b378 )
    ( on b634 b849 )
    ( on b255 b634 )
    ( on b235 b255 )
    ( on b678 b235 )
    ( on b617 b678 )
    ( on b753 b617 )
    ( on b514 b753 )
    ( on b964 b514 )
    ( on b20 b964 )
    ( on b570 b20 )
    ( on b981 b570 )
    ( on b694 b981 )
    ( on b338 b694 )
    ( on b379 b338 )
    ( on b794 b379 )
    ( on b524 b794 )
    ( on b930 b524 )
    ( on b936 b930 )
    ( on b654 b936 )
    ( on b543 b654 )
    ( on b76 b543 )
    ( on b919 b76 )
    ( on b451 b919 )
    ( on b403 b451 )
    ( on b165 b403 )
    ( on b986 b165 )
    ( on b716 b986 )
    ( clear b716 )
  )
  ( :goal
    ( and
      ( clear b170 )
    )
  )
)
