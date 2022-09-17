( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b653 - block
    b600 - block
    b143 - block
    b900 - block
    b673 - block
    b431 - block
    b343 - block
    b114 - block
    b668 - block
    b910 - block
    b262 - block
    b792 - block
    b448 - block
    b365 - block
    b675 - block
    b723 - block
    b357 - block
    b463 - block
    b103 - block
    b743 - block
    b526 - block
    b185 - block
    b858 - block
    b648 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b653 )
    ( on b600 b653 )
    ( on b143 b600 )
    ( on b900 b143 )
    ( on b673 b900 )
    ( on b431 b673 )
    ( on b343 b431 )
    ( on b114 b343 )
    ( on b668 b114 )
    ( on b910 b668 )
    ( on b262 b910 )
    ( on b792 b262 )
    ( on b448 b792 )
    ( on b365 b448 )
    ( on b675 b365 )
    ( on b723 b675 )
    ( on b357 b723 )
    ( on b463 b357 )
    ( on b103 b463 )
    ( on b743 b103 )
    ( on b526 b743 )
    ( on b185 b526 )
    ( on b858 b185 )
    ( on b648 b858 )
    ( clear b648 )
  )
  ( :tasks
    ( Make-23Pile b600 b143 b900 b673 b431 b343 b114 b668 b910 b262 b792 b448 b365 b675 b723 b357 b463 b103 b743 b526 b185 b858 b648 )
  )
)
