( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b930 - block
    b594 - block
    b839 - block
    b83 - block
    b856 - block
    b846 - block
    b521 - block
    b912 - block
    b500 - block
    b226 - block
    b571 - block
    b550 - block
    b621 - block
    b355 - block
    b759 - block
    b669 - block
    b633 - block
    b807 - block
    b731 - block
    b133 - block
    b990 - block
    b236 - block
    b782 - block
    b576 - block
    b645 - block
    b542 - block
    b381 - block
    b866 - block
    b916 - block
    b792 - block
    b454 - block
    b439 - block
    b172 - block
    b339 - block
    b673 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b930 )
    ( on b594 b930 )
    ( on b839 b594 )
    ( on b83 b839 )
    ( on b856 b83 )
    ( on b846 b856 )
    ( on b521 b846 )
    ( on b912 b521 )
    ( on b500 b912 )
    ( on b226 b500 )
    ( on b571 b226 )
    ( on b550 b571 )
    ( on b621 b550 )
    ( on b355 b621 )
    ( on b759 b355 )
    ( on b669 b759 )
    ( on b633 b669 )
    ( on b807 b633 )
    ( on b731 b807 )
    ( on b133 b731 )
    ( on b990 b133 )
    ( on b236 b990 )
    ( on b782 b236 )
    ( on b576 b782 )
    ( on b645 b576 )
    ( on b542 b645 )
    ( on b381 b542 )
    ( on b866 b381 )
    ( on b916 b866 )
    ( on b792 b916 )
    ( on b454 b792 )
    ( on b439 b454 )
    ( on b172 b439 )
    ( on b339 b172 )
    ( on b673 b339 )
    ( clear b673 )
  )
  ( :tasks
    ( Make-34Pile b594 b839 b83 b856 b846 b521 b912 b500 b226 b571 b550 b621 b355 b759 b669 b633 b807 b731 b133 b990 b236 b782 b576 b645 b542 b381 b866 b916 b792 b454 b439 b172 b339 b673 )
  )
)
