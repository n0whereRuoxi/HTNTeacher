( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b168 - block
    b936 - block
    b165 - block
    b180 - block
    b371 - block
    b68 - block
    b539 - block
    b312 - block
    b831 - block
    b592 - block
    b570 - block
    b816 - block
    b661 - block
    b219 - block
    b480 - block
    b713 - block
    b253 - block
    b622 - block
    b976 - block
    b310 - block
    b158 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b168 )
    ( on b936 b168 )
    ( on b165 b936 )
    ( on b180 b165 )
    ( on b371 b180 )
    ( on b68 b371 )
    ( on b539 b68 )
    ( on b312 b539 )
    ( on b831 b312 )
    ( on b592 b831 )
    ( on b570 b592 )
    ( on b816 b570 )
    ( on b661 b816 )
    ( on b219 b661 )
    ( on b480 b219 )
    ( on b713 b480 )
    ( on b253 b713 )
    ( on b622 b253 )
    ( on b976 b622 )
    ( on b310 b976 )
    ( on b158 b310 )
    ( clear b158 )
  )
  ( :goal
    ( and
      ( clear b168 )
    )
  )
)
