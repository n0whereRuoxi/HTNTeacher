( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b909 - block
    b401 - block
    b566 - block
    b593 - block
    b158 - block
    b759 - block
    b173 - block
    b435 - block
    b914 - block
    b733 - block
    b581 - block
    b549 - block
    b226 - block
    b393 - block
    b702 - block
    b553 - block
    b99 - block
    b348 - block
    b982 - block
    b660 - block
    b920 - block
    b74 - block
    b222 - block
    b960 - block
    b78 - block
    b39 - block
    b256 - block
    b946 - block
    b690 - block
    b983 - block
    b624 - block
    b130 - block
    b11 - block
    b634 - block
    b697 - block
    b608 - block
    b543 - block
    b323 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b909 )
    ( on b401 b909 )
    ( on b566 b401 )
    ( on b593 b566 )
    ( on b158 b593 )
    ( on b759 b158 )
    ( on b173 b759 )
    ( on b435 b173 )
    ( on b914 b435 )
    ( on b733 b914 )
    ( on b581 b733 )
    ( on b549 b581 )
    ( on b226 b549 )
    ( on b393 b226 )
    ( on b702 b393 )
    ( on b553 b702 )
    ( on b99 b553 )
    ( on b348 b99 )
    ( on b982 b348 )
    ( on b660 b982 )
    ( on b920 b660 )
    ( on b74 b920 )
    ( on b222 b74 )
    ( on b960 b222 )
    ( on b78 b960 )
    ( on b39 b78 )
    ( on b256 b39 )
    ( on b946 b256 )
    ( on b690 b946 )
    ( on b983 b690 )
    ( on b624 b983 )
    ( on b130 b624 )
    ( on b11 b130 )
    ( on b634 b11 )
    ( on b697 b634 )
    ( on b608 b697 )
    ( on b543 b608 )
    ( on b323 b543 )
    ( clear b323 )
  )
  ( :tasks
    ( Make-37Pile b401 b566 b593 b158 b759 b173 b435 b914 b733 b581 b549 b226 b393 b702 b553 b99 b348 b982 b660 b920 b74 b222 b960 b78 b39 b256 b946 b690 b983 b624 b130 b11 b634 b697 b608 b543 b323 )
  )
)
