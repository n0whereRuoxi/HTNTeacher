( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b76 - block
    b573 - block
    b54 - block
    b978 - block
    b594 - block
    b352 - block
    b414 - block
    b748 - block
    b107 - block
    b507 - block
    b542 - block
    b696 - block
    b990 - block
    b78 - block
    b458 - block
    b421 - block
    b183 - block
    b117 - block
    b545 - block
    b480 - block
    b979 - block
    b11 - block
    b818 - block
    b977 - block
    b168 - block
    b508 - block
    b519 - block
    b776 - block
    b794 - block
    b783 - block
    b315 - block
    b609 - block
    b129 - block
    b888 - block
    b586 - block
    b993 - block
    b750 - block
    b685 - block
    b697 - block
    b102 - block
    b126 - block
    b502 - block
    b353 - block
    b940 - block
    b227 - block
    b541 - block
    b599 - block
    b938 - block
    b885 - block
    b473 - block
    b205 - block
    b814 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b76 )
    ( on b573 b76 )
    ( on b54 b573 )
    ( on b978 b54 )
    ( on b594 b978 )
    ( on b352 b594 )
    ( on b414 b352 )
    ( on b748 b414 )
    ( on b107 b748 )
    ( on b507 b107 )
    ( on b542 b507 )
    ( on b696 b542 )
    ( on b990 b696 )
    ( on b78 b990 )
    ( on b458 b78 )
    ( on b421 b458 )
    ( on b183 b421 )
    ( on b117 b183 )
    ( on b545 b117 )
    ( on b480 b545 )
    ( on b979 b480 )
    ( on b11 b979 )
    ( on b818 b11 )
    ( on b977 b818 )
    ( on b168 b977 )
    ( on b508 b168 )
    ( on b519 b508 )
    ( on b776 b519 )
    ( on b794 b776 )
    ( on b783 b794 )
    ( on b315 b783 )
    ( on b609 b315 )
    ( on b129 b609 )
    ( on b888 b129 )
    ( on b586 b888 )
    ( on b993 b586 )
    ( on b750 b993 )
    ( on b685 b750 )
    ( on b697 b685 )
    ( on b102 b697 )
    ( on b126 b102 )
    ( on b502 b126 )
    ( on b353 b502 )
    ( on b940 b353 )
    ( on b227 b940 )
    ( on b541 b227 )
    ( on b599 b541 )
    ( on b938 b599 )
    ( on b885 b938 )
    ( on b473 b885 )
    ( on b205 b473 )
    ( on b814 b205 )
    ( clear b814 )
  )
  ( :goal
    ( and
      ( clear b76 )
    )
  )
)
