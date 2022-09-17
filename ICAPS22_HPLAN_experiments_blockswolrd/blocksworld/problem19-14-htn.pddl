( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b587 - block
    b589 - block
    b611 - block
    b399 - block
    b77 - block
    b461 - block
    b10 - block
    b940 - block
    b597 - block
    b230 - block
    b68 - block
    b49 - block
    b132 - block
    b634 - block
    b845 - block
    b785 - block
    b380 - block
    b857 - block
    b118 - block
    b117 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b587 )
    ( on b589 b587 )
    ( on b611 b589 )
    ( on b399 b611 )
    ( on b77 b399 )
    ( on b461 b77 )
    ( on b10 b461 )
    ( on b940 b10 )
    ( on b597 b940 )
    ( on b230 b597 )
    ( on b68 b230 )
    ( on b49 b68 )
    ( on b132 b49 )
    ( on b634 b132 )
    ( on b845 b634 )
    ( on b785 b845 )
    ( on b380 b785 )
    ( on b857 b380 )
    ( on b118 b857 )
    ( on b117 b118 )
    ( clear b117 )
  )
  ( :tasks
    ( Make-19Pile b589 b611 b399 b77 b461 b10 b940 b597 b230 b68 b49 b132 b634 b845 b785 b380 b857 b118 b117 )
  )
)
