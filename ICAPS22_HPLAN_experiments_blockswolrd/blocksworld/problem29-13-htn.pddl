( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b464 - block
    b668 - block
    b460 - block
    b387 - block
    b146 - block
    b406 - block
    b55 - block
    b585 - block
    b555 - block
    b383 - block
    b880 - block
    b530 - block
    b694 - block
    b895 - block
    b790 - block
    b59 - block
    b845 - block
    b793 - block
    b905 - block
    b102 - block
    b975 - block
    b104 - block
    b693 - block
    b726 - block
    b548 - block
    b230 - block
    b340 - block
    b898 - block
    b584 - block
    b611 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b464 )
    ( on b668 b464 )
    ( on b460 b668 )
    ( on b387 b460 )
    ( on b146 b387 )
    ( on b406 b146 )
    ( on b55 b406 )
    ( on b585 b55 )
    ( on b555 b585 )
    ( on b383 b555 )
    ( on b880 b383 )
    ( on b530 b880 )
    ( on b694 b530 )
    ( on b895 b694 )
    ( on b790 b895 )
    ( on b59 b790 )
    ( on b845 b59 )
    ( on b793 b845 )
    ( on b905 b793 )
    ( on b102 b905 )
    ( on b975 b102 )
    ( on b104 b975 )
    ( on b693 b104 )
    ( on b726 b693 )
    ( on b548 b726 )
    ( on b230 b548 )
    ( on b340 b230 )
    ( on b898 b340 )
    ( on b584 b898 )
    ( on b611 b584 )
    ( clear b611 )
  )
  ( :tasks
    ( Make-29Pile b668 b460 b387 b146 b406 b55 b585 b555 b383 b880 b530 b694 b895 b790 b59 b845 b793 b905 b102 b975 b104 b693 b726 b548 b230 b340 b898 b584 b611 )
  )
)
