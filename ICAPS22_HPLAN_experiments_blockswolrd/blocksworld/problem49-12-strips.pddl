( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b263 - block
    b763 - block
    b886 - block
    b248 - block
    b231 - block
    b39 - block
    b779 - block
    b234 - block
    b772 - block
    b71 - block
    b652 - block
    b850 - block
    b495 - block
    b730 - block
    b312 - block
    b829 - block
    b789 - block
    b982 - block
    b814 - block
    b198 - block
    b640 - block
    b82 - block
    b849 - block
    b843 - block
    b813 - block
    b469 - block
    b186 - block
    b482 - block
    b608 - block
    b927 - block
    b797 - block
    b684 - block
    b126 - block
    b36 - block
    b574 - block
    b756 - block
    b282 - block
    b931 - block
    b144 - block
    b483 - block
    b838 - block
    b960 - block
    b377 - block
    b928 - block
    b494 - block
    b187 - block
    b271 - block
    b528 - block
    b910 - block
    b590 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b263 )
    ( on b763 b263 )
    ( on b886 b763 )
    ( on b248 b886 )
    ( on b231 b248 )
    ( on b39 b231 )
    ( on b779 b39 )
    ( on b234 b779 )
    ( on b772 b234 )
    ( on b71 b772 )
    ( on b652 b71 )
    ( on b850 b652 )
    ( on b495 b850 )
    ( on b730 b495 )
    ( on b312 b730 )
    ( on b829 b312 )
    ( on b789 b829 )
    ( on b982 b789 )
    ( on b814 b982 )
    ( on b198 b814 )
    ( on b640 b198 )
    ( on b82 b640 )
    ( on b849 b82 )
    ( on b843 b849 )
    ( on b813 b843 )
    ( on b469 b813 )
    ( on b186 b469 )
    ( on b482 b186 )
    ( on b608 b482 )
    ( on b927 b608 )
    ( on b797 b927 )
    ( on b684 b797 )
    ( on b126 b684 )
    ( on b36 b126 )
    ( on b574 b36 )
    ( on b756 b574 )
    ( on b282 b756 )
    ( on b931 b282 )
    ( on b144 b931 )
    ( on b483 b144 )
    ( on b838 b483 )
    ( on b960 b838 )
    ( on b377 b960 )
    ( on b928 b377 )
    ( on b494 b928 )
    ( on b187 b494 )
    ( on b271 b187 )
    ( on b528 b271 )
    ( on b910 b528 )
    ( on b590 b910 )
    ( clear b590 )
  )
  ( :goal
    ( and
      ( clear b263 )
    )
  )
)
