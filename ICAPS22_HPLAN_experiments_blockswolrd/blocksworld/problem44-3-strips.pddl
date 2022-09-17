( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b43 - block
    b470 - block
    b913 - block
    b881 - block
    b407 - block
    b678 - block
    b719 - block
    b191 - block
    b664 - block
    b109 - block
    b340 - block
    b591 - block
    b299 - block
    b968 - block
    b933 - block
    b140 - block
    b319 - block
    b551 - block
    b499 - block
    b842 - block
    b179 - block
    b160 - block
    b143 - block
    b415 - block
    b647 - block
    b29 - block
    b26 - block
    b562 - block
    b654 - block
    b726 - block
    b877 - block
    b30 - block
    b335 - block
    b549 - block
    b846 - block
    b229 - block
    b141 - block
    b677 - block
    b859 - block
    b805 - block
    b984 - block
    b510 - block
    b540 - block
    b251 - block
    b559 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b43 )
    ( on b470 b43 )
    ( on b913 b470 )
    ( on b881 b913 )
    ( on b407 b881 )
    ( on b678 b407 )
    ( on b719 b678 )
    ( on b191 b719 )
    ( on b664 b191 )
    ( on b109 b664 )
    ( on b340 b109 )
    ( on b591 b340 )
    ( on b299 b591 )
    ( on b968 b299 )
    ( on b933 b968 )
    ( on b140 b933 )
    ( on b319 b140 )
    ( on b551 b319 )
    ( on b499 b551 )
    ( on b842 b499 )
    ( on b179 b842 )
    ( on b160 b179 )
    ( on b143 b160 )
    ( on b415 b143 )
    ( on b647 b415 )
    ( on b29 b647 )
    ( on b26 b29 )
    ( on b562 b26 )
    ( on b654 b562 )
    ( on b726 b654 )
    ( on b877 b726 )
    ( on b30 b877 )
    ( on b335 b30 )
    ( on b549 b335 )
    ( on b846 b549 )
    ( on b229 b846 )
    ( on b141 b229 )
    ( on b677 b141 )
    ( on b859 b677 )
    ( on b805 b859 )
    ( on b984 b805 )
    ( on b510 b984 )
    ( on b540 b510 )
    ( on b251 b540 )
    ( on b559 b251 )
    ( clear b559 )
  )
  ( :goal
    ( and
      ( clear b43 )
    )
  )
)
