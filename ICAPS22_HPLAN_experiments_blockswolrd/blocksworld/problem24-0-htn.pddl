( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b421 - block
    b528 - block
    b154 - block
    b506 - block
    b178 - block
    b902 - block
    b540 - block
    b397 - block
    b557 - block
    b943 - block
    b742 - block
    b720 - block
    b309 - block
    b379 - block
    b550 - block
    b851 - block
    b622 - block
    b285 - block
    b93 - block
    b815 - block
    b694 - block
    b258 - block
    b65 - block
    b900 - block
    b615 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b421 )
    ( on b528 b421 )
    ( on b154 b528 )
    ( on b506 b154 )
    ( on b178 b506 )
    ( on b902 b178 )
    ( on b540 b902 )
    ( on b397 b540 )
    ( on b557 b397 )
    ( on b943 b557 )
    ( on b742 b943 )
    ( on b720 b742 )
    ( on b309 b720 )
    ( on b379 b309 )
    ( on b550 b379 )
    ( on b851 b550 )
    ( on b622 b851 )
    ( on b285 b622 )
    ( on b93 b285 )
    ( on b815 b93 )
    ( on b694 b815 )
    ( on b258 b694 )
    ( on b65 b258 )
    ( on b900 b65 )
    ( on b615 b900 )
    ( clear b615 )
  )
  ( :tasks
    ( Make-24Pile b528 b154 b506 b178 b902 b540 b397 b557 b943 b742 b720 b309 b379 b550 b851 b622 b285 b93 b815 b694 b258 b65 b900 b615 )
  )
)
