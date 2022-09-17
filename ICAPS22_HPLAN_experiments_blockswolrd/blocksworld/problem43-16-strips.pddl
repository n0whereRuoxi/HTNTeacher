( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b443 - block
    b293 - block
    b472 - block
    b957 - block
    b454 - block
    b306 - block
    b20 - block
    b794 - block
    b655 - block
    b687 - block
    b204 - block
    b165 - block
    b340 - block
    b279 - block
    b541 - block
    b508 - block
    b439 - block
    b151 - block
    b875 - block
    b795 - block
    b402 - block
    b740 - block
    b280 - block
    b753 - block
    b396 - block
    b296 - block
    b814 - block
    b502 - block
    b925 - block
    b442 - block
    b16 - block
    b256 - block
    b83 - block
    b348 - block
    b631 - block
    b896 - block
    b952 - block
    b247 - block
    b320 - block
    b614 - block
    b365 - block
    b47 - block
    b699 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b443 b902 )
    ( on b293 b443 )
    ( on b472 b293 )
    ( on b957 b472 )
    ( on b454 b957 )
    ( on b306 b454 )
    ( on b20 b306 )
    ( on b794 b20 )
    ( on b655 b794 )
    ( on b687 b655 )
    ( on b204 b687 )
    ( on b165 b204 )
    ( on b340 b165 )
    ( on b279 b340 )
    ( on b541 b279 )
    ( on b508 b541 )
    ( on b439 b508 )
    ( on b151 b439 )
    ( on b875 b151 )
    ( on b795 b875 )
    ( on b402 b795 )
    ( on b740 b402 )
    ( on b280 b740 )
    ( on b753 b280 )
    ( on b396 b753 )
    ( on b296 b396 )
    ( on b814 b296 )
    ( on b502 b814 )
    ( on b925 b502 )
    ( on b442 b925 )
    ( on b16 b442 )
    ( on b256 b16 )
    ( on b83 b256 )
    ( on b348 b83 )
    ( on b631 b348 )
    ( on b896 b631 )
    ( on b952 b896 )
    ( on b247 b952 )
    ( on b320 b247 )
    ( on b614 b320 )
    ( on b365 b614 )
    ( on b47 b365 )
    ( on b699 b47 )
    ( clear b699 )
  )
  ( :goal
    ( and
      ( clear b902 )
    )
  )
)
