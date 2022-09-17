( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b339 - block
    b19 - block
    b705 - block
    b285 - block
    b501 - block
    b709 - block
    b3 - block
    b253 - block
    b731 - block
    b391 - block
    b380 - block
    b376 - block
    b113 - block
    b33 - block
    b897 - block
    b103 - block
    b565 - block
    b947 - block
    b414 - block
    b460 - block
    b944 - block
    b879 - block
    b25 - block
    b902 - block
    b929 - block
    b645 - block
    b626 - block
    b229 - block
    b598 - block
    b543 - block
    b383 - block
    b109 - block
    b35 - block
    b644 - block
    b104 - block
    b638 - block
    b200 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b19 b339 )
    ( on b705 b19 )
    ( on b285 b705 )
    ( on b501 b285 )
    ( on b709 b501 )
    ( on b3 b709 )
    ( on b253 b3 )
    ( on b731 b253 )
    ( on b391 b731 )
    ( on b380 b391 )
    ( on b376 b380 )
    ( on b113 b376 )
    ( on b33 b113 )
    ( on b897 b33 )
    ( on b103 b897 )
    ( on b565 b103 )
    ( on b947 b565 )
    ( on b414 b947 )
    ( on b460 b414 )
    ( on b944 b460 )
    ( on b879 b944 )
    ( on b25 b879 )
    ( on b902 b25 )
    ( on b929 b902 )
    ( on b645 b929 )
    ( on b626 b645 )
    ( on b229 b626 )
    ( on b598 b229 )
    ( on b543 b598 )
    ( on b383 b543 )
    ( on b109 b383 )
    ( on b35 b109 )
    ( on b644 b35 )
    ( on b104 b644 )
    ( on b638 b104 )
    ( on b200 b638 )
    ( clear b200 )
  )
  ( :tasks
    ( Make-36Pile b19 b705 b285 b501 b709 b3 b253 b731 b391 b380 b376 b113 b33 b897 b103 b565 b947 b414 b460 b944 b879 b25 b902 b929 b645 b626 b229 b598 b543 b383 b109 b35 b644 b104 b638 b200 )
  )
)
