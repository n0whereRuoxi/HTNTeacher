( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b461 - block
    b181 - block
    b671 - block
    b898 - block
    b921 - block
    b36 - block
    b465 - block
    b632 - block
    b933 - block
    b400 - block
    b180 - block
    b208 - block
    b634 - block
    b484 - block
    b763 - block
    b902 - block
    b86 - block
    b725 - block
    b864 - block
    b747 - block
    b559 - block
    b123 - block
    b504 - block
    b981 - block
    b887 - block
    b103 - block
    b91 - block
    b769 - block
    b619 - block
    b737 - block
    b171 - block
    b528 - block
    b145 - block
    b45 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b461 )
    ( on b181 b461 )
    ( on b671 b181 )
    ( on b898 b671 )
    ( on b921 b898 )
    ( on b36 b921 )
    ( on b465 b36 )
    ( on b632 b465 )
    ( on b933 b632 )
    ( on b400 b933 )
    ( on b180 b400 )
    ( on b208 b180 )
    ( on b634 b208 )
    ( on b484 b634 )
    ( on b763 b484 )
    ( on b902 b763 )
    ( on b86 b902 )
    ( on b725 b86 )
    ( on b864 b725 )
    ( on b747 b864 )
    ( on b559 b747 )
    ( on b123 b559 )
    ( on b504 b123 )
    ( on b981 b504 )
    ( on b887 b981 )
    ( on b103 b887 )
    ( on b91 b103 )
    ( on b769 b91 )
    ( on b619 b769 )
    ( on b737 b619 )
    ( on b171 b737 )
    ( on b528 b171 )
    ( on b145 b528 )
    ( on b45 b145 )
    ( clear b45 )
  )
  ( :tasks
    ( Make-33Pile b181 b671 b898 b921 b36 b465 b632 b933 b400 b180 b208 b634 b484 b763 b902 b86 b725 b864 b747 b559 b123 b504 b981 b887 b103 b91 b769 b619 b737 b171 b528 b145 b45 )
  )
)
