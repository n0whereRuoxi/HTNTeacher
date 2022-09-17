( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b443 - block
    b574 - block
    b913 - block
    b55 - block
    b169 - block
    b502 - block
    b931 - block
    b794 - block
    b733 - block
    b420 - block
    b60 - block
    b622 - block
    b466 - block
    b858 - block
    b665 - block
    b334 - block
    b203 - block
    b235 - block
    b893 - block
    b272 - block
    b159 - block
    b271 - block
    b122 - block
    b606 - block
    b427 - block
    b629 - block
    b27 - block
    b657 - block
    b132 - block
    b942 - block
    b201 - block
    b547 - block
    b103 - block
    b524 - block
    b670 - block
    b648 - block
    b867 - block
    b915 - block
    b175 - block
    b682 - block
    b654 - block
    b206 - block
    b811 - block
    b472 - block
    b838 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b443 )
    ( on b574 b443 )
    ( on b913 b574 )
    ( on b55 b913 )
    ( on b169 b55 )
    ( on b502 b169 )
    ( on b931 b502 )
    ( on b794 b931 )
    ( on b733 b794 )
    ( on b420 b733 )
    ( on b60 b420 )
    ( on b622 b60 )
    ( on b466 b622 )
    ( on b858 b466 )
    ( on b665 b858 )
    ( on b334 b665 )
    ( on b203 b334 )
    ( on b235 b203 )
    ( on b893 b235 )
    ( on b272 b893 )
    ( on b159 b272 )
    ( on b271 b159 )
    ( on b122 b271 )
    ( on b606 b122 )
    ( on b427 b606 )
    ( on b629 b427 )
    ( on b27 b629 )
    ( on b657 b27 )
    ( on b132 b657 )
    ( on b942 b132 )
    ( on b201 b942 )
    ( on b547 b201 )
    ( on b103 b547 )
    ( on b524 b103 )
    ( on b670 b524 )
    ( on b648 b670 )
    ( on b867 b648 )
    ( on b915 b867 )
    ( on b175 b915 )
    ( on b682 b175 )
    ( on b654 b682 )
    ( on b206 b654 )
    ( on b811 b206 )
    ( on b472 b811 )
    ( on b838 b472 )
    ( clear b838 )
  )
  ( :goal
    ( and
      ( clear b443 )
    )
  )
)
