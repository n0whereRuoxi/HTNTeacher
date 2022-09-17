( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b380 - block
    b246 - block
    b95 - block
    b633 - block
    b711 - block
    b607 - block
    b861 - block
    b709 - block
    b159 - block
    b977 - block
    b111 - block
    b500 - block
    b921 - block
    b386 - block
    b695 - block
    b131 - block
    b914 - block
    b568 - block
    b646 - block
    b177 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b380 )
    ( on b246 b380 )
    ( on b95 b246 )
    ( on b633 b95 )
    ( on b711 b633 )
    ( on b607 b711 )
    ( on b861 b607 )
    ( on b709 b861 )
    ( on b159 b709 )
    ( on b977 b159 )
    ( on b111 b977 )
    ( on b500 b111 )
    ( on b921 b500 )
    ( on b386 b921 )
    ( on b695 b386 )
    ( on b131 b695 )
    ( on b914 b131 )
    ( on b568 b914 )
    ( on b646 b568 )
    ( on b177 b646 )
    ( clear b177 )
  )
  ( :tasks
    ( Make-19Pile b246 b95 b633 b711 b607 b861 b709 b159 b977 b111 b500 b921 b386 b695 b131 b914 b568 b646 b177 )
  )
)
