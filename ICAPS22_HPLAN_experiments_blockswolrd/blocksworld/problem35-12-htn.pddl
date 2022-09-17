( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b892 - block
    b619 - block
    b229 - block
    b530 - block
    b924 - block
    b91 - block
    b219 - block
    b691 - block
    b583 - block
    b271 - block
    b381 - block
    b66 - block
    b430 - block
    b441 - block
    b610 - block
    b103 - block
    b868 - block
    b38 - block
    b824 - block
    b325 - block
    b22 - block
    b544 - block
    b968 - block
    b578 - block
    b788 - block
    b159 - block
    b454 - block
    b814 - block
    b397 - block
    b852 - block
    b853 - block
    b660 - block
    b193 - block
    b819 - block
    b205 - block
    b278 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b619 b892 )
    ( on b229 b619 )
    ( on b530 b229 )
    ( on b924 b530 )
    ( on b91 b924 )
    ( on b219 b91 )
    ( on b691 b219 )
    ( on b583 b691 )
    ( on b271 b583 )
    ( on b381 b271 )
    ( on b66 b381 )
    ( on b430 b66 )
    ( on b441 b430 )
    ( on b610 b441 )
    ( on b103 b610 )
    ( on b868 b103 )
    ( on b38 b868 )
    ( on b824 b38 )
    ( on b325 b824 )
    ( on b22 b325 )
    ( on b544 b22 )
    ( on b968 b544 )
    ( on b578 b968 )
    ( on b788 b578 )
    ( on b159 b788 )
    ( on b454 b159 )
    ( on b814 b454 )
    ( on b397 b814 )
    ( on b852 b397 )
    ( on b853 b852 )
    ( on b660 b853 )
    ( on b193 b660 )
    ( on b819 b193 )
    ( on b205 b819 )
    ( on b278 b205 )
    ( clear b278 )
  )
  ( :tasks
    ( Make-35Pile b619 b229 b530 b924 b91 b219 b691 b583 b271 b381 b66 b430 b441 b610 b103 b868 b38 b824 b325 b22 b544 b968 b578 b788 b159 b454 b814 b397 b852 b853 b660 b193 b819 b205 b278 )
  )
)
