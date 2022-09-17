( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b707 - block
    b511 - block
    b792 - block
    b81 - block
    b780 - block
    b392 - block
    b340 - block
    b109 - block
    b577 - block
    b305 - block
    b585 - block
    b839 - block
    b829 - block
    b878 - block
    b755 - block
    b170 - block
    b390 - block
    b429 - block
    b21 - block
    b312 - block
    b629 - block
    b292 - block
    b280 - block
    b604 - block
    b230 - block
    b448 - block
    b924 - block
    b668 - block
    b589 - block
    b725 - block
    b774 - block
    b324 - block
    b695 - block
    b854 - block
    b161 - block
    b123 - block
    b270 - block
    b126 - block
    b416 - block
    b940 - block
    b225 - block
    b875 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b511 b707 )
    ( on b792 b511 )
    ( on b81 b792 )
    ( on b780 b81 )
    ( on b392 b780 )
    ( on b340 b392 )
    ( on b109 b340 )
    ( on b577 b109 )
    ( on b305 b577 )
    ( on b585 b305 )
    ( on b839 b585 )
    ( on b829 b839 )
    ( on b878 b829 )
    ( on b755 b878 )
    ( on b170 b755 )
    ( on b390 b170 )
    ( on b429 b390 )
    ( on b21 b429 )
    ( on b312 b21 )
    ( on b629 b312 )
    ( on b292 b629 )
    ( on b280 b292 )
    ( on b604 b280 )
    ( on b230 b604 )
    ( on b448 b230 )
    ( on b924 b448 )
    ( on b668 b924 )
    ( on b589 b668 )
    ( on b725 b589 )
    ( on b774 b725 )
    ( on b324 b774 )
    ( on b695 b324 )
    ( on b854 b695 )
    ( on b161 b854 )
    ( on b123 b161 )
    ( on b270 b123 )
    ( on b126 b270 )
    ( on b416 b126 )
    ( on b940 b416 )
    ( on b225 b940 )
    ( on b875 b225 )
    ( on b797 b875 )
    ( clear b797 )
  )
  ( :tasks
    ( Make-42Pile b511 b792 b81 b780 b392 b340 b109 b577 b305 b585 b839 b829 b878 b755 b170 b390 b429 b21 b312 b629 b292 b280 b604 b230 b448 b924 b668 b589 b725 b774 b324 b695 b854 b161 b123 b270 b126 b416 b940 b225 b875 b797 )
  )
)
