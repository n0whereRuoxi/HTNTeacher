( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b158 - block
    b856 - block
    b349 - block
    b652 - block
    b405 - block
    b864 - block
    b924 - block
    b849 - block
    b992 - block
    b171 - block
    b35 - block
    b423 - block
    b288 - block
    b921 - block
    b292 - block
    b492 - block
    b209 - block
    b827 - block
    b961 - block
    b380 - block
    b31 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b158 )
    ( on b856 b158 )
    ( on b349 b856 )
    ( on b652 b349 )
    ( on b405 b652 )
    ( on b864 b405 )
    ( on b924 b864 )
    ( on b849 b924 )
    ( on b992 b849 )
    ( on b171 b992 )
    ( on b35 b171 )
    ( on b423 b35 )
    ( on b288 b423 )
    ( on b921 b288 )
    ( on b292 b921 )
    ( on b492 b292 )
    ( on b209 b492 )
    ( on b827 b209 )
    ( on b961 b827 )
    ( on b380 b961 )
    ( on b31 b380 )
    ( clear b31 )
  )
  ( :tasks
    ( Make-20Pile b856 b349 b652 b405 b864 b924 b849 b992 b171 b35 b423 b288 b921 b292 b492 b209 b827 b961 b380 b31 )
  )
)
