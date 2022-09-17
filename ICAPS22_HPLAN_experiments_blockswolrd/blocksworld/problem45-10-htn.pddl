( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b61 - block
    b830 - block
    b308 - block
    b398 - block
    b908 - block
    b45 - block
    b418 - block
    b124 - block
    b720 - block
    b967 - block
    b43 - block
    b468 - block
    b270 - block
    b407 - block
    b410 - block
    b213 - block
    b241 - block
    b692 - block
    b976 - block
    b622 - block
    b98 - block
    b689 - block
    b232 - block
    b414 - block
    b936 - block
    b670 - block
    b137 - block
    b400 - block
    b653 - block
    b637 - block
    b516 - block
    b797 - block
    b576 - block
    b810 - block
    b189 - block
    b648 - block
    b900 - block
    b646 - block
    b787 - block
    b135 - block
    b181 - block
    b277 - block
    b557 - block
    b631 - block
    b704 - block
    b893 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b61 )
    ( on b830 b61 )
    ( on b308 b830 )
    ( on b398 b308 )
    ( on b908 b398 )
    ( on b45 b908 )
    ( on b418 b45 )
    ( on b124 b418 )
    ( on b720 b124 )
    ( on b967 b720 )
    ( on b43 b967 )
    ( on b468 b43 )
    ( on b270 b468 )
    ( on b407 b270 )
    ( on b410 b407 )
    ( on b213 b410 )
    ( on b241 b213 )
    ( on b692 b241 )
    ( on b976 b692 )
    ( on b622 b976 )
    ( on b98 b622 )
    ( on b689 b98 )
    ( on b232 b689 )
    ( on b414 b232 )
    ( on b936 b414 )
    ( on b670 b936 )
    ( on b137 b670 )
    ( on b400 b137 )
    ( on b653 b400 )
    ( on b637 b653 )
    ( on b516 b637 )
    ( on b797 b516 )
    ( on b576 b797 )
    ( on b810 b576 )
    ( on b189 b810 )
    ( on b648 b189 )
    ( on b900 b648 )
    ( on b646 b900 )
    ( on b787 b646 )
    ( on b135 b787 )
    ( on b181 b135 )
    ( on b277 b181 )
    ( on b557 b277 )
    ( on b631 b557 )
    ( on b704 b631 )
    ( on b893 b704 )
    ( clear b893 )
  )
  ( :tasks
    ( Make-45Pile b830 b308 b398 b908 b45 b418 b124 b720 b967 b43 b468 b270 b407 b410 b213 b241 b692 b976 b622 b98 b689 b232 b414 b936 b670 b137 b400 b653 b637 b516 b797 b576 b810 b189 b648 b900 b646 b787 b135 b181 b277 b557 b631 b704 b893 )
  )
)
