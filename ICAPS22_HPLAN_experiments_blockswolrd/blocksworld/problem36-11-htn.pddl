( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b701 - block
    b401 - block
    b26 - block
    b785 - block
    b334 - block
    b530 - block
    b518 - block
    b955 - block
    b316 - block
    b500 - block
    b437 - block
    b219 - block
    b953 - block
    b976 - block
    b946 - block
    b663 - block
    b659 - block
    b766 - block
    b403 - block
    b397 - block
    b923 - block
    b84 - block
    b728 - block
    b684 - block
    b978 - block
    b568 - block
    b948 - block
    b567 - block
    b526 - block
    b409 - block
    b982 - block
    b413 - block
    b965 - block
    b490 - block
    b536 - block
    b862 - block
    b745 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b701 )
    ( on b401 b701 )
    ( on b26 b401 )
    ( on b785 b26 )
    ( on b334 b785 )
    ( on b530 b334 )
    ( on b518 b530 )
    ( on b955 b518 )
    ( on b316 b955 )
    ( on b500 b316 )
    ( on b437 b500 )
    ( on b219 b437 )
    ( on b953 b219 )
    ( on b976 b953 )
    ( on b946 b976 )
    ( on b663 b946 )
    ( on b659 b663 )
    ( on b766 b659 )
    ( on b403 b766 )
    ( on b397 b403 )
    ( on b923 b397 )
    ( on b84 b923 )
    ( on b728 b84 )
    ( on b684 b728 )
    ( on b978 b684 )
    ( on b568 b978 )
    ( on b948 b568 )
    ( on b567 b948 )
    ( on b526 b567 )
    ( on b409 b526 )
    ( on b982 b409 )
    ( on b413 b982 )
    ( on b965 b413 )
    ( on b490 b965 )
    ( on b536 b490 )
    ( on b862 b536 )
    ( on b745 b862 )
    ( clear b745 )
  )
  ( :tasks
    ( Make-36Pile b401 b26 b785 b334 b530 b518 b955 b316 b500 b437 b219 b953 b976 b946 b663 b659 b766 b403 b397 b923 b84 b728 b684 b978 b568 b948 b567 b526 b409 b982 b413 b965 b490 b536 b862 b745 )
  )
)
