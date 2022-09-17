( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b650 - block
    b878 - block
    b748 - block
    b967 - block
    b61 - block
    b264 - block
    b799 - block
    b728 - block
    b427 - block
    b894 - block
    b75 - block
    b144 - block
    b34 - block
    b94 - block
    b413 - block
    b611 - block
    b312 - block
    b689 - block
    b395 - block
    b284 - block
    b463 - block
    b637 - block
    b489 - block
    b122 - block
    b59 - block
    b240 - block
    b253 - block
    b733 - block
    b70 - block
    b374 - block
    b587 - block
    b858 - block
    b476 - block
    b250 - block
    b128 - block
    b430 - block
    b865 - block
    b331 - block
    b435 - block
    b421 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b650 )
    ( on b878 b650 )
    ( on b748 b878 )
    ( on b967 b748 )
    ( on b61 b967 )
    ( on b264 b61 )
    ( on b799 b264 )
    ( on b728 b799 )
    ( on b427 b728 )
    ( on b894 b427 )
    ( on b75 b894 )
    ( on b144 b75 )
    ( on b34 b144 )
    ( on b94 b34 )
    ( on b413 b94 )
    ( on b611 b413 )
    ( on b312 b611 )
    ( on b689 b312 )
    ( on b395 b689 )
    ( on b284 b395 )
    ( on b463 b284 )
    ( on b637 b463 )
    ( on b489 b637 )
    ( on b122 b489 )
    ( on b59 b122 )
    ( on b240 b59 )
    ( on b253 b240 )
    ( on b733 b253 )
    ( on b70 b733 )
    ( on b374 b70 )
    ( on b587 b374 )
    ( on b858 b587 )
    ( on b476 b858 )
    ( on b250 b476 )
    ( on b128 b250 )
    ( on b430 b128 )
    ( on b865 b430 )
    ( on b331 b865 )
    ( on b435 b331 )
    ( on b421 b435 )
    ( clear b421 )
  )
  ( :goal
    ( and
      ( clear b650 )
    )
  )
)
