( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b335 - block
    b404 - block
    b190 - block
    b1 - block
    b780 - block
    b798 - block
    b380 - block
    b932 - block
    b840 - block
    b325 - block
    b486 - block
    b294 - block
    b458 - block
    b819 - block
    b57 - block
    b580 - block
    b173 - block
    b51 - block
    b201 - block
    b72 - block
    b81 - block
    b102 - block
    b907 - block
    b148 - block
    b922 - block
    b277 - block
    b439 - block
    b391 - block
    b745 - block
    b765 - block
    b870 - block
    b697 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b335 )
    ( on b404 b335 )
    ( on b190 b404 )
    ( on b1 b190 )
    ( on b780 b1 )
    ( on b798 b780 )
    ( on b380 b798 )
    ( on b932 b380 )
    ( on b840 b932 )
    ( on b325 b840 )
    ( on b486 b325 )
    ( on b294 b486 )
    ( on b458 b294 )
    ( on b819 b458 )
    ( on b57 b819 )
    ( on b580 b57 )
    ( on b173 b580 )
    ( on b51 b173 )
    ( on b201 b51 )
    ( on b72 b201 )
    ( on b81 b72 )
    ( on b102 b81 )
    ( on b907 b102 )
    ( on b148 b907 )
    ( on b922 b148 )
    ( on b277 b922 )
    ( on b439 b277 )
    ( on b391 b439 )
    ( on b745 b391 )
    ( on b765 b745 )
    ( on b870 b765 )
    ( on b697 b870 )
    ( clear b697 )
  )
  ( :goal
    ( and
      ( clear b335 )
    )
  )
)
