( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b789 - block
    b219 - block
    b906 - block
    b637 - block
    b497 - block
    b134 - block
    b287 - block
    b989 - block
    b897 - block
    b226 - block
    b289 - block
    b541 - block
    b959 - block
    b199 - block
    b585 - block
    b301 - block
    b799 - block
    b655 - block
    b881 - block
    b760 - block
    b732 - block
    b807 - block
    b885 - block
    b891 - block
    b751 - block
    b821 - block
    b739 - block
    b236 - block
    b452 - block
    b94 - block
    b742 - block
    b536 - block
    b471 - block
    b402 - block
    b333 - block
    b359 - block
    b883 - block
    b812 - block
    b484 - block
    b814 - block
    b85 - block
    b699 - block
    b298 - block
    b922 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b789 )
    ( on b219 b789 )
    ( on b906 b219 )
    ( on b637 b906 )
    ( on b497 b637 )
    ( on b134 b497 )
    ( on b287 b134 )
    ( on b989 b287 )
    ( on b897 b989 )
    ( on b226 b897 )
    ( on b289 b226 )
    ( on b541 b289 )
    ( on b959 b541 )
    ( on b199 b959 )
    ( on b585 b199 )
    ( on b301 b585 )
    ( on b799 b301 )
    ( on b655 b799 )
    ( on b881 b655 )
    ( on b760 b881 )
    ( on b732 b760 )
    ( on b807 b732 )
    ( on b885 b807 )
    ( on b891 b885 )
    ( on b751 b891 )
    ( on b821 b751 )
    ( on b739 b821 )
    ( on b236 b739 )
    ( on b452 b236 )
    ( on b94 b452 )
    ( on b742 b94 )
    ( on b536 b742 )
    ( on b471 b536 )
    ( on b402 b471 )
    ( on b333 b402 )
    ( on b359 b333 )
    ( on b883 b359 )
    ( on b812 b883 )
    ( on b484 b812 )
    ( on b814 b484 )
    ( on b85 b814 )
    ( on b699 b85 )
    ( on b298 b699 )
    ( on b922 b298 )
    ( clear b922 )
  )
  ( :goal
    ( and
      ( clear b789 )
    )
  )
)
