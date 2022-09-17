( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b889 - block
    b466 - block
    b485 - block
    b373 - block
    b359 - block
    b608 - block
    b150 - block
    b268 - block
    b944 - block
    b791 - block
    b221 - block
    b759 - block
    b92 - block
    b223 - block
    b95 - block
    b970 - block
    b258 - block
    b353 - block
    b6 - block
    b254 - block
    b668 - block
    b263 - block
    b805 - block
    b516 - block
    b698 - block
    b700 - block
    b301 - block
    b155 - block
    b287 - block
    b669 - block
    b685 - block
    b404 - block
    b528 - block
    b13 - block
    b851 - block
    b647 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b889 )
    ( on b466 b889 )
    ( on b485 b466 )
    ( on b373 b485 )
    ( on b359 b373 )
    ( on b608 b359 )
    ( on b150 b608 )
    ( on b268 b150 )
    ( on b944 b268 )
    ( on b791 b944 )
    ( on b221 b791 )
    ( on b759 b221 )
    ( on b92 b759 )
    ( on b223 b92 )
    ( on b95 b223 )
    ( on b970 b95 )
    ( on b258 b970 )
    ( on b353 b258 )
    ( on b6 b353 )
    ( on b254 b6 )
    ( on b668 b254 )
    ( on b263 b668 )
    ( on b805 b263 )
    ( on b516 b805 )
    ( on b698 b516 )
    ( on b700 b698 )
    ( on b301 b700 )
    ( on b155 b301 )
    ( on b287 b155 )
    ( on b669 b287 )
    ( on b685 b669 )
    ( on b404 b685 )
    ( on b528 b404 )
    ( on b13 b528 )
    ( on b851 b13 )
    ( on b647 b851 )
    ( clear b647 )
  )
  ( :tasks
    ( Make-35Pile b466 b485 b373 b359 b608 b150 b268 b944 b791 b221 b759 b92 b223 b95 b970 b258 b353 b6 b254 b668 b263 b805 b516 b698 b700 b301 b155 b287 b669 b685 b404 b528 b13 b851 b647 )
  )
)
