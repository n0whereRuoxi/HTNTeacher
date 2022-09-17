( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b825 - block
    b951 - block
    b129 - block
    b538 - block
    b136 - block
    b626 - block
    b678 - block
    b147 - block
    b741 - block
    b436 - block
    b931 - block
    b616 - block
    b55 - block
    b302 - block
    b886 - block
    b725 - block
    b877 - block
    b116 - block
    b651 - block
    b865 - block
    b612 - block
    b691 - block
    b925 - block
    b677 - block
    b781 - block
    b199 - block
    b481 - block
    b956 - block
    b721 - block
    b905 - block
    b859 - block
    b860 - block
    b711 - block
    b901 - block
    b364 - block
    b803 - block
    b736 - block
    b14 - block
    b602 - block
    b664 - block
    b780 - block
    b496 - block
    b179 - block
    b797 - block
    b146 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b951 b825 )
    ( on b129 b951 )
    ( on b538 b129 )
    ( on b136 b538 )
    ( on b626 b136 )
    ( on b678 b626 )
    ( on b147 b678 )
    ( on b741 b147 )
    ( on b436 b741 )
    ( on b931 b436 )
    ( on b616 b931 )
    ( on b55 b616 )
    ( on b302 b55 )
    ( on b886 b302 )
    ( on b725 b886 )
    ( on b877 b725 )
    ( on b116 b877 )
    ( on b651 b116 )
    ( on b865 b651 )
    ( on b612 b865 )
    ( on b691 b612 )
    ( on b925 b691 )
    ( on b677 b925 )
    ( on b781 b677 )
    ( on b199 b781 )
    ( on b481 b199 )
    ( on b956 b481 )
    ( on b721 b956 )
    ( on b905 b721 )
    ( on b859 b905 )
    ( on b860 b859 )
    ( on b711 b860 )
    ( on b901 b711 )
    ( on b364 b901 )
    ( on b803 b364 )
    ( on b736 b803 )
    ( on b14 b736 )
    ( on b602 b14 )
    ( on b664 b602 )
    ( on b780 b664 )
    ( on b496 b780 )
    ( on b179 b496 )
    ( on b797 b179 )
    ( on b146 b797 )
    ( clear b146 )
  )
  ( :goal
    ( and
      ( clear b825 )
    )
  )
)
