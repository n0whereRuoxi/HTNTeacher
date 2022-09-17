( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b32 - block
    b149 - block
    b12 - block
    b776 - block
    b354 - block
    b830 - block
    b361 - block
    b467 - block
    b815 - block
    b804 - block
    b46 - block
    b849 - block
    b360 - block
    b61 - block
    b771 - block
    b174 - block
    b388 - block
    b245 - block
    b638 - block
    b143 - block
    b329 - block
    b657 - block
    b850 - block
    b229 - block
    b273 - block
    b740 - block
    b247 - block
    b886 - block
    b644 - block
    b981 - block
    b748 - block
    b584 - block
    b438 - block
    b286 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b32 )
    ( on b149 b32 )
    ( on b12 b149 )
    ( on b776 b12 )
    ( on b354 b776 )
    ( on b830 b354 )
    ( on b361 b830 )
    ( on b467 b361 )
    ( on b815 b467 )
    ( on b804 b815 )
    ( on b46 b804 )
    ( on b849 b46 )
    ( on b360 b849 )
    ( on b61 b360 )
    ( on b771 b61 )
    ( on b174 b771 )
    ( on b388 b174 )
    ( on b245 b388 )
    ( on b638 b245 )
    ( on b143 b638 )
    ( on b329 b143 )
    ( on b657 b329 )
    ( on b850 b657 )
    ( on b229 b850 )
    ( on b273 b229 )
    ( on b740 b273 )
    ( on b247 b740 )
    ( on b886 b247 )
    ( on b644 b886 )
    ( on b981 b644 )
    ( on b748 b981 )
    ( on b584 b748 )
    ( on b438 b584 )
    ( on b286 b438 )
    ( clear b286 )
  )
  ( :tasks
    ( Make-33Pile b149 b12 b776 b354 b830 b361 b467 b815 b804 b46 b849 b360 b61 b771 b174 b388 b245 b638 b143 b329 b657 b850 b229 b273 b740 b247 b886 b644 b981 b748 b584 b438 b286 )
  )
)
