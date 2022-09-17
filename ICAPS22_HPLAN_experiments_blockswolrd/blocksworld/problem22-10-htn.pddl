( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b583 - block
    b541 - block
    b963 - block
    b692 - block
    b384 - block
    b405 - block
    b331 - block
    b2 - block
    b131 - block
    b366 - block
    b514 - block
    b918 - block
    b656 - block
    b412 - block
    b845 - block
    b148 - block
    b161 - block
    b806 - block
    b85 - block
    b682 - block
    b280 - block
    b178 - block
    b659 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b583 )
    ( on b541 b583 )
    ( on b963 b541 )
    ( on b692 b963 )
    ( on b384 b692 )
    ( on b405 b384 )
    ( on b331 b405 )
    ( on b2 b331 )
    ( on b131 b2 )
    ( on b366 b131 )
    ( on b514 b366 )
    ( on b918 b514 )
    ( on b656 b918 )
    ( on b412 b656 )
    ( on b845 b412 )
    ( on b148 b845 )
    ( on b161 b148 )
    ( on b806 b161 )
    ( on b85 b806 )
    ( on b682 b85 )
    ( on b280 b682 )
    ( on b178 b280 )
    ( on b659 b178 )
    ( clear b659 )
  )
  ( :tasks
    ( Make-22Pile b541 b963 b692 b384 b405 b331 b2 b131 b366 b514 b918 b656 b412 b845 b148 b161 b806 b85 b682 b280 b178 b659 )
  )
)
