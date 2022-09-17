( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b725 - block
    b73 - block
    b989 - block
    b335 - block
    b671 - block
    b506 - block
    b813 - block
    b928 - block
    b775 - block
    b727 - block
    b831 - block
    b290 - block
    b681 - block
    b819 - block
    b631 - block
    b581 - block
    b449 - block
    b791 - block
    b568 - block
    b563 - block
    b782 - block
    b770 - block
    b637 - block
    b162 - block
    b298 - block
    b247 - block
    b627 - block
    b993 - block
    b456 - block
    b976 - block
    b706 - block
    b859 - block
    b944 - block
    b116 - block
    b492 - block
    b296 - block
    b651 - block
    b967 - block
    b122 - block
    b308 - block
    b398 - block
    b12 - block
    b323 - block
    b455 - block
    b289 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b73 b725 )
    ( on b989 b73 )
    ( on b335 b989 )
    ( on b671 b335 )
    ( on b506 b671 )
    ( on b813 b506 )
    ( on b928 b813 )
    ( on b775 b928 )
    ( on b727 b775 )
    ( on b831 b727 )
    ( on b290 b831 )
    ( on b681 b290 )
    ( on b819 b681 )
    ( on b631 b819 )
    ( on b581 b631 )
    ( on b449 b581 )
    ( on b791 b449 )
    ( on b568 b791 )
    ( on b563 b568 )
    ( on b782 b563 )
    ( on b770 b782 )
    ( on b637 b770 )
    ( on b162 b637 )
    ( on b298 b162 )
    ( on b247 b298 )
    ( on b627 b247 )
    ( on b993 b627 )
    ( on b456 b993 )
    ( on b976 b456 )
    ( on b706 b976 )
    ( on b859 b706 )
    ( on b944 b859 )
    ( on b116 b944 )
    ( on b492 b116 )
    ( on b296 b492 )
    ( on b651 b296 )
    ( on b967 b651 )
    ( on b122 b967 )
    ( on b308 b122 )
    ( on b398 b308 )
    ( on b12 b398 )
    ( on b323 b12 )
    ( on b455 b323 )
    ( on b289 b455 )
    ( clear b289 )
  )
  ( :goal
    ( and
      ( clear b725 )
    )
  )
)
