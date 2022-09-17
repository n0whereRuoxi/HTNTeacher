( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b418 - block
    b709 - block
    b68 - block
    b958 - block
    b982 - block
    b929 - block
    b107 - block
    b245 - block
    b647 - block
    b808 - block
    b696 - block
    b329 - block
    b167 - block
    b739 - block
    b498 - block
    b296 - block
    b78 - block
    b672 - block
    b290 - block
    b496 - block
    b83 - block
    b986 - block
    b594 - block
    b959 - block
    b899 - block
    b451 - block
    b584 - block
    b437 - block
    b431 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b418 )
    ( on b709 b418 )
    ( on b68 b709 )
    ( on b958 b68 )
    ( on b982 b958 )
    ( on b929 b982 )
    ( on b107 b929 )
    ( on b245 b107 )
    ( on b647 b245 )
    ( on b808 b647 )
    ( on b696 b808 )
    ( on b329 b696 )
    ( on b167 b329 )
    ( on b739 b167 )
    ( on b498 b739 )
    ( on b296 b498 )
    ( on b78 b296 )
    ( on b672 b78 )
    ( on b290 b672 )
    ( on b496 b290 )
    ( on b83 b496 )
    ( on b986 b83 )
    ( on b594 b986 )
    ( on b959 b594 )
    ( on b899 b959 )
    ( on b451 b899 )
    ( on b584 b451 )
    ( on b437 b584 )
    ( on b431 b437 )
    ( clear b431 )
  )
  ( :tasks
    ( Make-28Pile b709 b68 b958 b982 b929 b107 b245 b647 b808 b696 b329 b167 b739 b498 b296 b78 b672 b290 b496 b83 b986 b594 b959 b899 b451 b584 b437 b431 )
  )
)
