( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b682 - block
    b843 - block
    b836 - block
    b296 - block
    b326 - block
    b617 - block
    b328 - block
    b753 - block
    b395 - block
    b256 - block
    b890 - block
    b458 - block
    b356 - block
    b624 - block
    b465 - block
    b784 - block
    b907 - block
    b517 - block
    b731 - block
    b522 - block
    b71 - block
    b135 - block
    b774 - block
    b978 - block
    b460 - block
    b114 - block
    b823 - block
    b711 - block
    b200 - block
    b174 - block
    b748 - block
    b193 - block
    b564 - block
    b293 - block
    b493 - block
    b125 - block
    b12 - block
    b430 - block
    b988 - block
    b246 - block
    b690 - block
    b166 - block
    b651 - block
    b253 - block
    b927 - block
    b96 - block
    b531 - block
    b701 - block
    b691 - block
    b663 - block
    b297 - block
    b176 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b682 )
    ( on b843 b682 )
    ( on b836 b843 )
    ( on b296 b836 )
    ( on b326 b296 )
    ( on b617 b326 )
    ( on b328 b617 )
    ( on b753 b328 )
    ( on b395 b753 )
    ( on b256 b395 )
    ( on b890 b256 )
    ( on b458 b890 )
    ( on b356 b458 )
    ( on b624 b356 )
    ( on b465 b624 )
    ( on b784 b465 )
    ( on b907 b784 )
    ( on b517 b907 )
    ( on b731 b517 )
    ( on b522 b731 )
    ( on b71 b522 )
    ( on b135 b71 )
    ( on b774 b135 )
    ( on b978 b774 )
    ( on b460 b978 )
    ( on b114 b460 )
    ( on b823 b114 )
    ( on b711 b823 )
    ( on b200 b711 )
    ( on b174 b200 )
    ( on b748 b174 )
    ( on b193 b748 )
    ( on b564 b193 )
    ( on b293 b564 )
    ( on b493 b293 )
    ( on b125 b493 )
    ( on b12 b125 )
    ( on b430 b12 )
    ( on b988 b430 )
    ( on b246 b988 )
    ( on b690 b246 )
    ( on b166 b690 )
    ( on b651 b166 )
    ( on b253 b651 )
    ( on b927 b253 )
    ( on b96 b927 )
    ( on b531 b96 )
    ( on b701 b531 )
    ( on b691 b701 )
    ( on b663 b691 )
    ( on b297 b663 )
    ( on b176 b297 )
    ( clear b176 )
  )
  ( :goal
    ( and
      ( clear b682 )
    )
  )
)
