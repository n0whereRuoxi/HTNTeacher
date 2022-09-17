( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b210 - block
    b945 - block
    b797 - block
    b165 - block
    b571 - block
    b853 - block
    b194 - block
    b683 - block
    b477 - block
    b818 - block
    b880 - block
    b65 - block
    b441 - block
    b303 - block
    b236 - block
    b796 - block
    b463 - block
    b14 - block
    b665 - block
    b99 - block
    b68 - block
    b202 - block
    b497 - block
    b457 - block
    b530 - block
    b919 - block
    b492 - block
    b873 - block
    b843 - block
    b615 - block
    b523 - block
    b867 - block
    b496 - block
    b205 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b945 b210 )
    ( on b797 b945 )
    ( on b165 b797 )
    ( on b571 b165 )
    ( on b853 b571 )
    ( on b194 b853 )
    ( on b683 b194 )
    ( on b477 b683 )
    ( on b818 b477 )
    ( on b880 b818 )
    ( on b65 b880 )
    ( on b441 b65 )
    ( on b303 b441 )
    ( on b236 b303 )
    ( on b796 b236 )
    ( on b463 b796 )
    ( on b14 b463 )
    ( on b665 b14 )
    ( on b99 b665 )
    ( on b68 b99 )
    ( on b202 b68 )
    ( on b497 b202 )
    ( on b457 b497 )
    ( on b530 b457 )
    ( on b919 b530 )
    ( on b492 b919 )
    ( on b873 b492 )
    ( on b843 b873 )
    ( on b615 b843 )
    ( on b523 b615 )
    ( on b867 b523 )
    ( on b496 b867 )
    ( on b205 b496 )
    ( clear b205 )
  )
  ( :goal
    ( and
      ( clear b210 )
    )
  )
)
