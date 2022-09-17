( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b841 - block
    b615 - block
    b770 - block
    b178 - block
    b693 - block
    b179 - block
    b899 - block
    b486 - block
    b976 - block
    b5 - block
    b493 - block
    b354 - block
    b810 - block
    b202 - block
    b546 - block
    b609 - block
    b92 - block
    b987 - block
    b752 - block
    b994 - block
    b18 - block
    b611 - block
    b813 - block
    b995 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b841 )
    ( on b615 b841 )
    ( on b770 b615 )
    ( on b178 b770 )
    ( on b693 b178 )
    ( on b179 b693 )
    ( on b899 b179 )
    ( on b486 b899 )
    ( on b976 b486 )
    ( on b5 b976 )
    ( on b493 b5 )
    ( on b354 b493 )
    ( on b810 b354 )
    ( on b202 b810 )
    ( on b546 b202 )
    ( on b609 b546 )
    ( on b92 b609 )
    ( on b987 b92 )
    ( on b752 b987 )
    ( on b994 b752 )
    ( on b18 b994 )
    ( on b611 b18 )
    ( on b813 b611 )
    ( on b995 b813 )
    ( clear b995 )
  )
  ( :tasks
    ( Make-23Pile b615 b770 b178 b693 b179 b899 b486 b976 b5 b493 b354 b810 b202 b546 b609 b92 b987 b752 b994 b18 b611 b813 b995 )
  )
)
