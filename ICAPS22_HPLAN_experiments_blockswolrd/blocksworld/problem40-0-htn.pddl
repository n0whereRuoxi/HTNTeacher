( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b693 - block
    b851 - block
    b26 - block
    b184 - block
    b447 - block
    b432 - block
    b463 - block
    b313 - block
    b840 - block
    b753 - block
    b300 - block
    b502 - block
    b736 - block
    b989 - block
    b221 - block
    b464 - block
    b158 - block
    b201 - block
    b385 - block
    b204 - block
    b429 - block
    b608 - block
    b488 - block
    b400 - block
    b200 - block
    b482 - block
    b555 - block
    b821 - block
    b807 - block
    b521 - block
    b426 - block
    b519 - block
    b81 - block
    b36 - block
    b742 - block
    b534 - block
    b671 - block
    b743 - block
    b564 - block
    b953 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b693 )
    ( on b851 b693 )
    ( on b26 b851 )
    ( on b184 b26 )
    ( on b447 b184 )
    ( on b432 b447 )
    ( on b463 b432 )
    ( on b313 b463 )
    ( on b840 b313 )
    ( on b753 b840 )
    ( on b300 b753 )
    ( on b502 b300 )
    ( on b736 b502 )
    ( on b989 b736 )
    ( on b221 b989 )
    ( on b464 b221 )
    ( on b158 b464 )
    ( on b201 b158 )
    ( on b385 b201 )
    ( on b204 b385 )
    ( on b429 b204 )
    ( on b608 b429 )
    ( on b488 b608 )
    ( on b400 b488 )
    ( on b200 b400 )
    ( on b482 b200 )
    ( on b555 b482 )
    ( on b821 b555 )
    ( on b807 b821 )
    ( on b521 b807 )
    ( on b426 b521 )
    ( on b519 b426 )
    ( on b81 b519 )
    ( on b36 b81 )
    ( on b742 b36 )
    ( on b534 b742 )
    ( on b671 b534 )
    ( on b743 b671 )
    ( on b564 b743 )
    ( on b953 b564 )
    ( on b846 b953 )
    ( clear b846 )
  )
  ( :tasks
    ( Make-40Pile b851 b26 b184 b447 b432 b463 b313 b840 b753 b300 b502 b736 b989 b221 b464 b158 b201 b385 b204 b429 b608 b488 b400 b200 b482 b555 b821 b807 b521 b426 b519 b81 b36 b742 b534 b671 b743 b564 b953 b846 )
  )
)
