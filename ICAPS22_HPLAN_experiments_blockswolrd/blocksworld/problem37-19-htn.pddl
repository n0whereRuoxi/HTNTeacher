( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b1 - block
    b576 - block
    b610 - block
    b962 - block
    b649 - block
    b99 - block
    b933 - block
    b142 - block
    b350 - block
    b914 - block
    b917 - block
    b342 - block
    b897 - block
    b555 - block
    b105 - block
    b600 - block
    b541 - block
    b643 - block
    b271 - block
    b906 - block
    b558 - block
    b941 - block
    b718 - block
    b904 - block
    b734 - block
    b144 - block
    b480 - block
    b703 - block
    b22 - block
    b801 - block
    b266 - block
    b769 - block
    b257 - block
    b272 - block
    b899 - block
    b931 - block
    b232 - block
    b29 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b1 )
    ( on b576 b1 )
    ( on b610 b576 )
    ( on b962 b610 )
    ( on b649 b962 )
    ( on b99 b649 )
    ( on b933 b99 )
    ( on b142 b933 )
    ( on b350 b142 )
    ( on b914 b350 )
    ( on b917 b914 )
    ( on b342 b917 )
    ( on b897 b342 )
    ( on b555 b897 )
    ( on b105 b555 )
    ( on b600 b105 )
    ( on b541 b600 )
    ( on b643 b541 )
    ( on b271 b643 )
    ( on b906 b271 )
    ( on b558 b906 )
    ( on b941 b558 )
    ( on b718 b941 )
    ( on b904 b718 )
    ( on b734 b904 )
    ( on b144 b734 )
    ( on b480 b144 )
    ( on b703 b480 )
    ( on b22 b703 )
    ( on b801 b22 )
    ( on b266 b801 )
    ( on b769 b266 )
    ( on b257 b769 )
    ( on b272 b257 )
    ( on b899 b272 )
    ( on b931 b899 )
    ( on b232 b931 )
    ( on b29 b232 )
    ( clear b29 )
  )
  ( :tasks
    ( Make-37Pile b576 b610 b962 b649 b99 b933 b142 b350 b914 b917 b342 b897 b555 b105 b600 b541 b643 b271 b906 b558 b941 b718 b904 b734 b144 b480 b703 b22 b801 b266 b769 b257 b272 b899 b931 b232 b29 )
  )
)
