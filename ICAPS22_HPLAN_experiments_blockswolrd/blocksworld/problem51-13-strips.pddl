( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b628 - block
    b105 - block
    b381 - block
    b52 - block
    b141 - block
    b312 - block
    b254 - block
    b811 - block
    b807 - block
    b886 - block
    b837 - block
    b379 - block
    b456 - block
    b93 - block
    b589 - block
    b656 - block
    b332 - block
    b245 - block
    b48 - block
    b204 - block
    b701 - block
    b869 - block
    b313 - block
    b242 - block
    b942 - block
    b768 - block
    b790 - block
    b810 - block
    b11 - block
    b343 - block
    b167 - block
    b288 - block
    b342 - block
    b231 - block
    b726 - block
    b825 - block
    b432 - block
    b469 - block
    b461 - block
    b71 - block
    b977 - block
    b669 - block
    b678 - block
    b738 - block
    b453 - block
    b816 - block
    b442 - block
    b777 - block
    b872 - block
    b819 - block
    b123 - block
    b86 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b628 )
    ( on b105 b628 )
    ( on b381 b105 )
    ( on b52 b381 )
    ( on b141 b52 )
    ( on b312 b141 )
    ( on b254 b312 )
    ( on b811 b254 )
    ( on b807 b811 )
    ( on b886 b807 )
    ( on b837 b886 )
    ( on b379 b837 )
    ( on b456 b379 )
    ( on b93 b456 )
    ( on b589 b93 )
    ( on b656 b589 )
    ( on b332 b656 )
    ( on b245 b332 )
    ( on b48 b245 )
    ( on b204 b48 )
    ( on b701 b204 )
    ( on b869 b701 )
    ( on b313 b869 )
    ( on b242 b313 )
    ( on b942 b242 )
    ( on b768 b942 )
    ( on b790 b768 )
    ( on b810 b790 )
    ( on b11 b810 )
    ( on b343 b11 )
    ( on b167 b343 )
    ( on b288 b167 )
    ( on b342 b288 )
    ( on b231 b342 )
    ( on b726 b231 )
    ( on b825 b726 )
    ( on b432 b825 )
    ( on b469 b432 )
    ( on b461 b469 )
    ( on b71 b461 )
    ( on b977 b71 )
    ( on b669 b977 )
    ( on b678 b669 )
    ( on b738 b678 )
    ( on b453 b738 )
    ( on b816 b453 )
    ( on b442 b816 )
    ( on b777 b442 )
    ( on b872 b777 )
    ( on b819 b872 )
    ( on b123 b819 )
    ( on b86 b123 )
    ( clear b86 )
  )
  ( :goal
    ( and
      ( clear b628 )
    )
  )
)
