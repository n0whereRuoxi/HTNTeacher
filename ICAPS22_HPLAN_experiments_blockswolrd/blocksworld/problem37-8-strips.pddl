( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b290 - block
    b414 - block
    b273 - block
    b777 - block
    b861 - block
    b277 - block
    b843 - block
    b698 - block
    b461 - block
    b754 - block
    b68 - block
    b316 - block
    b702 - block
    b889 - block
    b798 - block
    b621 - block
    b176 - block
    b572 - block
    b158 - block
    b587 - block
    b53 - block
    b784 - block
    b897 - block
    b535 - block
    b203 - block
    b750 - block
    b43 - block
    b633 - block
    b821 - block
    b104 - block
    b574 - block
    b779 - block
    b39 - block
    b822 - block
    b831 - block
    b237 - block
    b760 - block
    b845 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b290 )
    ( on b414 b290 )
    ( on b273 b414 )
    ( on b777 b273 )
    ( on b861 b777 )
    ( on b277 b861 )
    ( on b843 b277 )
    ( on b698 b843 )
    ( on b461 b698 )
    ( on b754 b461 )
    ( on b68 b754 )
    ( on b316 b68 )
    ( on b702 b316 )
    ( on b889 b702 )
    ( on b798 b889 )
    ( on b621 b798 )
    ( on b176 b621 )
    ( on b572 b176 )
    ( on b158 b572 )
    ( on b587 b158 )
    ( on b53 b587 )
    ( on b784 b53 )
    ( on b897 b784 )
    ( on b535 b897 )
    ( on b203 b535 )
    ( on b750 b203 )
    ( on b43 b750 )
    ( on b633 b43 )
    ( on b821 b633 )
    ( on b104 b821 )
    ( on b574 b104 )
    ( on b779 b574 )
    ( on b39 b779 )
    ( on b822 b39 )
    ( on b831 b822 )
    ( on b237 b831 )
    ( on b760 b237 )
    ( on b845 b760 )
    ( clear b845 )
  )
  ( :goal
    ( and
      ( clear b290 )
    )
  )
)
