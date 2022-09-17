( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b41 - block
    b799 - block
    b975 - block
    b126 - block
    b350 - block
    b725 - block
    b991 - block
    b93 - block
    b694 - block
    b962 - block
    b413 - block
    b14 - block
    b982 - block
    b287 - block
    b894 - block
    b557 - block
    b630 - block
    b55 - block
    b157 - block
    b268 - block
    b451 - block
    b654 - block
    b888 - block
    b854 - block
    b83 - block
    b899 - block
    b960 - block
    b254 - block
    b433 - block
    b11 - block
    b124 - block
    b121 - block
    b253 - block
    b275 - block
    b796 - block
    b16 - block
    b957 - block
    b913 - block
    b101 - block
    b712 - block
    b30 - block
    b824 - block
    b405 - block
    b793 - block
    b131 - block
    b84 - block
    b317 - block
    b988 - block
    b647 - block
    b358 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b41 b902 )
    ( on b799 b41 )
    ( on b975 b799 )
    ( on b126 b975 )
    ( on b350 b126 )
    ( on b725 b350 )
    ( on b991 b725 )
    ( on b93 b991 )
    ( on b694 b93 )
    ( on b962 b694 )
    ( on b413 b962 )
    ( on b14 b413 )
    ( on b982 b14 )
    ( on b287 b982 )
    ( on b894 b287 )
    ( on b557 b894 )
    ( on b630 b557 )
    ( on b55 b630 )
    ( on b157 b55 )
    ( on b268 b157 )
    ( on b451 b268 )
    ( on b654 b451 )
    ( on b888 b654 )
    ( on b854 b888 )
    ( on b83 b854 )
    ( on b899 b83 )
    ( on b960 b899 )
    ( on b254 b960 )
    ( on b433 b254 )
    ( on b11 b433 )
    ( on b124 b11 )
    ( on b121 b124 )
    ( on b253 b121 )
    ( on b275 b253 )
    ( on b796 b275 )
    ( on b16 b796 )
    ( on b957 b16 )
    ( on b913 b957 )
    ( on b101 b913 )
    ( on b712 b101 )
    ( on b30 b712 )
    ( on b824 b30 )
    ( on b405 b824 )
    ( on b793 b405 )
    ( on b131 b793 )
    ( on b84 b131 )
    ( on b317 b84 )
    ( on b988 b317 )
    ( on b647 b988 )
    ( on b358 b647 )
    ( clear b358 )
  )
  ( :goal
    ( and
      ( clear b902 )
    )
  )
)
