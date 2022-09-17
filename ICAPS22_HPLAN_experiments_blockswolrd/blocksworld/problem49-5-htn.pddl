( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b901 - block
    b110 - block
    b830 - block
    b415 - block
    b720 - block
    b193 - block
    b158 - block
    b994 - block
    b893 - block
    b261 - block
    b461 - block
    b527 - block
    b510 - block
    b969 - block
    b38 - block
    b683 - block
    b931 - block
    b268 - block
    b359 - block
    b610 - block
    b389 - block
    b701 - block
    b398 - block
    b191 - block
    b426 - block
    b495 - block
    b75 - block
    b950 - block
    b14 - block
    b335 - block
    b959 - block
    b548 - block
    b584 - block
    b717 - block
    b40 - block
    b645 - block
    b378 - block
    b454 - block
    b132 - block
    b853 - block
    b185 - block
    b397 - block
    b767 - block
    b593 - block
    b614 - block
    b195 - block
    b145 - block
    b878 - block
    b862 - block
    b49 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b901 )
    ( on b110 b901 )
    ( on b830 b110 )
    ( on b415 b830 )
    ( on b720 b415 )
    ( on b193 b720 )
    ( on b158 b193 )
    ( on b994 b158 )
    ( on b893 b994 )
    ( on b261 b893 )
    ( on b461 b261 )
    ( on b527 b461 )
    ( on b510 b527 )
    ( on b969 b510 )
    ( on b38 b969 )
    ( on b683 b38 )
    ( on b931 b683 )
    ( on b268 b931 )
    ( on b359 b268 )
    ( on b610 b359 )
    ( on b389 b610 )
    ( on b701 b389 )
    ( on b398 b701 )
    ( on b191 b398 )
    ( on b426 b191 )
    ( on b495 b426 )
    ( on b75 b495 )
    ( on b950 b75 )
    ( on b14 b950 )
    ( on b335 b14 )
    ( on b959 b335 )
    ( on b548 b959 )
    ( on b584 b548 )
    ( on b717 b584 )
    ( on b40 b717 )
    ( on b645 b40 )
    ( on b378 b645 )
    ( on b454 b378 )
    ( on b132 b454 )
    ( on b853 b132 )
    ( on b185 b853 )
    ( on b397 b185 )
    ( on b767 b397 )
    ( on b593 b767 )
    ( on b614 b593 )
    ( on b195 b614 )
    ( on b145 b195 )
    ( on b878 b145 )
    ( on b862 b878 )
    ( on b49 b862 )
    ( clear b49 )
  )
  ( :tasks
    ( Make-49Pile b110 b830 b415 b720 b193 b158 b994 b893 b261 b461 b527 b510 b969 b38 b683 b931 b268 b359 b610 b389 b701 b398 b191 b426 b495 b75 b950 b14 b335 b959 b548 b584 b717 b40 b645 b378 b454 b132 b853 b185 b397 b767 b593 b614 b195 b145 b878 b862 b49 )
  )
)
