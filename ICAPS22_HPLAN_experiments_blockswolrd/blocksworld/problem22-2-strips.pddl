( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b629 - block
    b829 - block
    b222 - block
    b899 - block
    b743 - block
    b82 - block
    b583 - block
    b575 - block
    b955 - block
    b625 - block
    b688 - block
    b606 - block
    b694 - block
    b478 - block
    b712 - block
    b696 - block
    b117 - block
    b894 - block
    b41 - block
    b792 - block
    b514 - block
    b759 - block
    b957 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b629 )
    ( on b829 b629 )
    ( on b222 b829 )
    ( on b899 b222 )
    ( on b743 b899 )
    ( on b82 b743 )
    ( on b583 b82 )
    ( on b575 b583 )
    ( on b955 b575 )
    ( on b625 b955 )
    ( on b688 b625 )
    ( on b606 b688 )
    ( on b694 b606 )
    ( on b478 b694 )
    ( on b712 b478 )
    ( on b696 b712 )
    ( on b117 b696 )
    ( on b894 b117 )
    ( on b41 b894 )
    ( on b792 b41 )
    ( on b514 b792 )
    ( on b759 b514 )
    ( on b957 b759 )
    ( clear b957 )
  )
  ( :goal
    ( and
      ( clear b629 )
    )
  )
)
