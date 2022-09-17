( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b110 - block
    b237 - block
    b631 - block
    b850 - block
    b97 - block
    b920 - block
    b118 - block
    b11 - block
    b141 - block
    b26 - block
    b285 - block
    b578 - block
    b717 - block
    b984 - block
    b953 - block
    b382 - block
    b76 - block
    b852 - block
    b671 - block
    b786 - block
    b291 - block
    b856 - block
    b49 - block
    b723 - block
    b34 - block
    b486 - block
    b995 - block
    b195 - block
    b586 - block
    b666 - block
    b523 - block
    b629 - block
    b593 - block
    b72 - block
    b797 - block
    b990 - block
    b982 - block
    b139 - block
    b9 - block
    b122 - block
    b492 - block
    b271 - block
    b573 - block
    b907 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b110 )
    ( on b237 b110 )
    ( on b631 b237 )
    ( on b850 b631 )
    ( on b97 b850 )
    ( on b920 b97 )
    ( on b118 b920 )
    ( on b11 b118 )
    ( on b141 b11 )
    ( on b26 b141 )
    ( on b285 b26 )
    ( on b578 b285 )
    ( on b717 b578 )
    ( on b984 b717 )
    ( on b953 b984 )
    ( on b382 b953 )
    ( on b76 b382 )
    ( on b852 b76 )
    ( on b671 b852 )
    ( on b786 b671 )
    ( on b291 b786 )
    ( on b856 b291 )
    ( on b49 b856 )
    ( on b723 b49 )
    ( on b34 b723 )
    ( on b486 b34 )
    ( on b995 b486 )
    ( on b195 b995 )
    ( on b586 b195 )
    ( on b666 b586 )
    ( on b523 b666 )
    ( on b629 b523 )
    ( on b593 b629 )
    ( on b72 b593 )
    ( on b797 b72 )
    ( on b990 b797 )
    ( on b982 b990 )
    ( on b139 b982 )
    ( on b9 b139 )
    ( on b122 b9 )
    ( on b492 b122 )
    ( on b271 b492 )
    ( on b573 b271 )
    ( on b907 b573 )
    ( clear b907 )
  )
  ( :tasks
    ( Make-43Pile b237 b631 b850 b97 b920 b118 b11 b141 b26 b285 b578 b717 b984 b953 b382 b76 b852 b671 b786 b291 b856 b49 b723 b34 b486 b995 b195 b586 b666 b523 b629 b593 b72 b797 b990 b982 b139 b9 b122 b492 b271 b573 b907 )
  )
)
