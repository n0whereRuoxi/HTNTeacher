( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b243 - block
    b647 - block
    b255 - block
    b681 - block
    b688 - block
    b146 - block
    b766 - block
    b704 - block
    b550 - block
    b956 - block
    b894 - block
    b439 - block
    b54 - block
    b215 - block
    b914 - block
    b462 - block
    b154 - block
    b797 - block
    b791 - block
    b159 - block
    b100 - block
    b998 - block
    b344 - block
    b675 - block
    b746 - block
    b13 - block
    b237 - block
    b187 - block
    b280 - block
    b992 - block
    b130 - block
    b584 - block
    b567 - block
    b903 - block
    b126 - block
    b622 - block
    b911 - block
    b91 - block
    b629 - block
    b261 - block
    b499 - block
    b999 - block
    b609 - block
    b231 - block
    b107 - block
    b837 - block
    b316 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b243 )
    ( on b647 b243 )
    ( on b255 b647 )
    ( on b681 b255 )
    ( on b688 b681 )
    ( on b146 b688 )
    ( on b766 b146 )
    ( on b704 b766 )
    ( on b550 b704 )
    ( on b956 b550 )
    ( on b894 b956 )
    ( on b439 b894 )
    ( on b54 b439 )
    ( on b215 b54 )
    ( on b914 b215 )
    ( on b462 b914 )
    ( on b154 b462 )
    ( on b797 b154 )
    ( on b791 b797 )
    ( on b159 b791 )
    ( on b100 b159 )
    ( on b998 b100 )
    ( on b344 b998 )
    ( on b675 b344 )
    ( on b746 b675 )
    ( on b13 b746 )
    ( on b237 b13 )
    ( on b187 b237 )
    ( on b280 b187 )
    ( on b992 b280 )
    ( on b130 b992 )
    ( on b584 b130 )
    ( on b567 b584 )
    ( on b903 b567 )
    ( on b126 b903 )
    ( on b622 b126 )
    ( on b911 b622 )
    ( on b91 b911 )
    ( on b629 b91 )
    ( on b261 b629 )
    ( on b499 b261 )
    ( on b999 b499 )
    ( on b609 b999 )
    ( on b231 b609 )
    ( on b107 b231 )
    ( on b837 b107 )
    ( on b316 b837 )
    ( clear b316 )
  )
  ( :goal
    ( and
      ( clear b243 )
    )
  )
)
