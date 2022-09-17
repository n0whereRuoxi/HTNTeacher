( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b700 - block
    b403 - block
    b76 - block
    b913 - block
    b370 - block
    b789 - block
    b676 - block
    b436 - block
    b226 - block
    b493 - block
    b575 - block
    b662 - block
    b897 - block
    b396 - block
    b35 - block
    b114 - block
    b9 - block
    b231 - block
    b569 - block
    b860 - block
    b576 - block
    b730 - block
    b592 - block
    b405 - block
    b801 - block
    b976 - block
    b597 - block
    b589 - block
    b643 - block
    b810 - block
    b666 - block
    b653 - block
    b895 - block
    b443 - block
    b674 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b700 )
    ( on b403 b700 )
    ( on b76 b403 )
    ( on b913 b76 )
    ( on b370 b913 )
    ( on b789 b370 )
    ( on b676 b789 )
    ( on b436 b676 )
    ( on b226 b436 )
    ( on b493 b226 )
    ( on b575 b493 )
    ( on b662 b575 )
    ( on b897 b662 )
    ( on b396 b897 )
    ( on b35 b396 )
    ( on b114 b35 )
    ( on b9 b114 )
    ( on b231 b9 )
    ( on b569 b231 )
    ( on b860 b569 )
    ( on b576 b860 )
    ( on b730 b576 )
    ( on b592 b730 )
    ( on b405 b592 )
    ( on b801 b405 )
    ( on b976 b801 )
    ( on b597 b976 )
    ( on b589 b597 )
    ( on b643 b589 )
    ( on b810 b643 )
    ( on b666 b810 )
    ( on b653 b666 )
    ( on b895 b653 )
    ( on b443 b895 )
    ( on b674 b443 )
    ( on b437 b674 )
    ( clear b437 )
  )
  ( :tasks
    ( Make-35Pile b403 b76 b913 b370 b789 b676 b436 b226 b493 b575 b662 b897 b396 b35 b114 b9 b231 b569 b860 b576 b730 b592 b405 b801 b976 b597 b589 b643 b810 b666 b653 b895 b443 b674 b437 )
  )
)
