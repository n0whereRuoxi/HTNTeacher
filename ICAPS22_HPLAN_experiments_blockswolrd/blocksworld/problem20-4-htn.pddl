( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b10 - block
    b691 - block
    b847 - block
    b890 - block
    b427 - block
    b558 - block
    b671 - block
    b929 - block
    b571 - block
    b878 - block
    b258 - block
    b92 - block
    b717 - block
    b382 - block
    b846 - block
    b215 - block
    b923 - block
    b206 - block
    b116 - block
    b930 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b10 )
    ( on b691 b10 )
    ( on b847 b691 )
    ( on b890 b847 )
    ( on b427 b890 )
    ( on b558 b427 )
    ( on b671 b558 )
    ( on b929 b671 )
    ( on b571 b929 )
    ( on b878 b571 )
    ( on b258 b878 )
    ( on b92 b258 )
    ( on b717 b92 )
    ( on b382 b717 )
    ( on b846 b382 )
    ( on b215 b846 )
    ( on b923 b215 )
    ( on b206 b923 )
    ( on b116 b206 )
    ( on b930 b116 )
    ( on b3 b930 )
    ( clear b3 )
  )
  ( :tasks
    ( Make-20Pile b691 b847 b890 b427 b558 b671 b929 b571 b878 b258 b92 b717 b382 b846 b215 b923 b206 b116 b930 b3 )
  )
)
