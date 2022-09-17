( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b30 - block
    b2 - block
    b921 - block
    b683 - block
    b480 - block
    b509 - block
    b201 - block
    b932 - block
    b335 - block
    b179 - block
    b217 - block
    b538 - block
    b468 - block
    b505 - block
    b302 - block
    b83 - block
    b312 - block
    b384 - block
    b129 - block
    b430 - block
    b803 - block
    b796 - block
    b940 - block
    b253 - block
    b199 - block
    b543 - block
    b98 - block
    b388 - block
    b493 - block
    b4 - block
    b275 - block
    b496 - block
    b369 - block
    b346 - block
    b618 - block
    b293 - block
    b995 - block
    b920 - block
    b494 - block
    b889 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b30 )
    ( on b2 b30 )
    ( on b921 b2 )
    ( on b683 b921 )
    ( on b480 b683 )
    ( on b509 b480 )
    ( on b201 b509 )
    ( on b932 b201 )
    ( on b335 b932 )
    ( on b179 b335 )
    ( on b217 b179 )
    ( on b538 b217 )
    ( on b468 b538 )
    ( on b505 b468 )
    ( on b302 b505 )
    ( on b83 b302 )
    ( on b312 b83 )
    ( on b384 b312 )
    ( on b129 b384 )
    ( on b430 b129 )
    ( on b803 b430 )
    ( on b796 b803 )
    ( on b940 b796 )
    ( on b253 b940 )
    ( on b199 b253 )
    ( on b543 b199 )
    ( on b98 b543 )
    ( on b388 b98 )
    ( on b493 b388 )
    ( on b4 b493 )
    ( on b275 b4 )
    ( on b496 b275 )
    ( on b369 b496 )
    ( on b346 b369 )
    ( on b618 b346 )
    ( on b293 b618 )
    ( on b995 b293 )
    ( on b920 b995 )
    ( on b494 b920 )
    ( on b889 b494 )
    ( clear b889 )
  )
  ( :goal
    ( and
      ( clear b30 )
    )
  )
)
