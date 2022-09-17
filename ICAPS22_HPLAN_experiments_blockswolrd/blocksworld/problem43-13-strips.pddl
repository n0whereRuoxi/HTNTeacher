( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b247 - block
    b181 - block
    b496 - block
    b511 - block
    b394 - block
    b921 - block
    b687 - block
    b465 - block
    b561 - block
    b5 - block
    b897 - block
    b712 - block
    b799 - block
    b962 - block
    b907 - block
    b869 - block
    b714 - block
    b242 - block
    b385 - block
    b606 - block
    b220 - block
    b532 - block
    b761 - block
    b13 - block
    b484 - block
    b626 - block
    b190 - block
    b738 - block
    b488 - block
    b927 - block
    b747 - block
    b749 - block
    b295 - block
    b843 - block
    b681 - block
    b183 - block
    b314 - block
    b575 - block
    b312 - block
    b530 - block
    b443 - block
    b949 - block
    b515 - block
    b49 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b247 )
    ( on b181 b247 )
    ( on b496 b181 )
    ( on b511 b496 )
    ( on b394 b511 )
    ( on b921 b394 )
    ( on b687 b921 )
    ( on b465 b687 )
    ( on b561 b465 )
    ( on b5 b561 )
    ( on b897 b5 )
    ( on b712 b897 )
    ( on b799 b712 )
    ( on b962 b799 )
    ( on b907 b962 )
    ( on b869 b907 )
    ( on b714 b869 )
    ( on b242 b714 )
    ( on b385 b242 )
    ( on b606 b385 )
    ( on b220 b606 )
    ( on b532 b220 )
    ( on b761 b532 )
    ( on b13 b761 )
    ( on b484 b13 )
    ( on b626 b484 )
    ( on b190 b626 )
    ( on b738 b190 )
    ( on b488 b738 )
    ( on b927 b488 )
    ( on b747 b927 )
    ( on b749 b747 )
    ( on b295 b749 )
    ( on b843 b295 )
    ( on b681 b843 )
    ( on b183 b681 )
    ( on b314 b183 )
    ( on b575 b314 )
    ( on b312 b575 )
    ( on b530 b312 )
    ( on b443 b530 )
    ( on b949 b443 )
    ( on b515 b949 )
    ( on b49 b515 )
    ( clear b49 )
  )
  ( :goal
    ( and
      ( clear b247 )
    )
  )
)
