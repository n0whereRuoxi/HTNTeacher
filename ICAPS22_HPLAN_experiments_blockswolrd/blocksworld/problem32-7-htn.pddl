( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b626 - block
    b683 - block
    b718 - block
    b791 - block
    b559 - block
    b734 - block
    b828 - block
    b815 - block
    b75 - block
    b613 - block
    b885 - block
    b537 - block
    b491 - block
    b776 - block
    b810 - block
    b344 - block
    b827 - block
    b37 - block
    b153 - block
    b305 - block
    b159 - block
    b493 - block
    b606 - block
    b375 - block
    b981 - block
    b469 - block
    b575 - block
    b5 - block
    b701 - block
    b139 - block
    b371 - block
    b594 - block
    b723 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b626 )
    ( on b683 b626 )
    ( on b718 b683 )
    ( on b791 b718 )
    ( on b559 b791 )
    ( on b734 b559 )
    ( on b828 b734 )
    ( on b815 b828 )
    ( on b75 b815 )
    ( on b613 b75 )
    ( on b885 b613 )
    ( on b537 b885 )
    ( on b491 b537 )
    ( on b776 b491 )
    ( on b810 b776 )
    ( on b344 b810 )
    ( on b827 b344 )
    ( on b37 b827 )
    ( on b153 b37 )
    ( on b305 b153 )
    ( on b159 b305 )
    ( on b493 b159 )
    ( on b606 b493 )
    ( on b375 b606 )
    ( on b981 b375 )
    ( on b469 b981 )
    ( on b575 b469 )
    ( on b5 b575 )
    ( on b701 b5 )
    ( on b139 b701 )
    ( on b371 b139 )
    ( on b594 b371 )
    ( on b723 b594 )
    ( clear b723 )
  )
  ( :tasks
    ( Make-32Pile b683 b718 b791 b559 b734 b828 b815 b75 b613 b885 b537 b491 b776 b810 b344 b827 b37 b153 b305 b159 b493 b606 b375 b981 b469 b575 b5 b701 b139 b371 b594 b723 )
  )
)
