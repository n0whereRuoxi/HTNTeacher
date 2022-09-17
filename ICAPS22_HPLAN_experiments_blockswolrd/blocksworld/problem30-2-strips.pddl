( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b408 - block
    b273 - block
    b255 - block
    b794 - block
    b561 - block
    b7 - block
    b619 - block
    b251 - block
    b102 - block
    b842 - block
    b867 - block
    b759 - block
    b926 - block
    b804 - block
    b451 - block
    b385 - block
    b587 - block
    b806 - block
    b797 - block
    b641 - block
    b182 - block
    b831 - block
    b161 - block
    b168 - block
    b441 - block
    b184 - block
    b139 - block
    b646 - block
    b112 - block
    b697 - block
    b956 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b408 )
    ( on b273 b408 )
    ( on b255 b273 )
    ( on b794 b255 )
    ( on b561 b794 )
    ( on b7 b561 )
    ( on b619 b7 )
    ( on b251 b619 )
    ( on b102 b251 )
    ( on b842 b102 )
    ( on b867 b842 )
    ( on b759 b867 )
    ( on b926 b759 )
    ( on b804 b926 )
    ( on b451 b804 )
    ( on b385 b451 )
    ( on b587 b385 )
    ( on b806 b587 )
    ( on b797 b806 )
    ( on b641 b797 )
    ( on b182 b641 )
    ( on b831 b182 )
    ( on b161 b831 )
    ( on b168 b161 )
    ( on b441 b168 )
    ( on b184 b441 )
    ( on b139 b184 )
    ( on b646 b139 )
    ( on b112 b646 )
    ( on b697 b112 )
    ( on b956 b697 )
    ( clear b956 )
  )
  ( :goal
    ( and
      ( clear b408 )
    )
  )
)
