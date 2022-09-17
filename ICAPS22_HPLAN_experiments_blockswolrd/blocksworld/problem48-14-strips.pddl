( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b612 - block
    b104 - block
    b173 - block
    b578 - block
    b465 - block
    b474 - block
    b625 - block
    b208 - block
    b527 - block
    b933 - block
    b434 - block
    b875 - block
    b33 - block
    b439 - block
    b127 - block
    b778 - block
    b428 - block
    b84 - block
    b529 - block
    b765 - block
    b528 - block
    b63 - block
    b24 - block
    b889 - block
    b387 - block
    b696 - block
    b304 - block
    b648 - block
    b59 - block
    b763 - block
    b301 - block
    b888 - block
    b725 - block
    b168 - block
    b193 - block
    b791 - block
    b624 - block
    b154 - block
    b31 - block
    b282 - block
    b450 - block
    b530 - block
    b891 - block
    b313 - block
    b819 - block
    b489 - block
    b728 - block
    b311 - block
    b533 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b612 )
    ( on b104 b612 )
    ( on b173 b104 )
    ( on b578 b173 )
    ( on b465 b578 )
    ( on b474 b465 )
    ( on b625 b474 )
    ( on b208 b625 )
    ( on b527 b208 )
    ( on b933 b527 )
    ( on b434 b933 )
    ( on b875 b434 )
    ( on b33 b875 )
    ( on b439 b33 )
    ( on b127 b439 )
    ( on b778 b127 )
    ( on b428 b778 )
    ( on b84 b428 )
    ( on b529 b84 )
    ( on b765 b529 )
    ( on b528 b765 )
    ( on b63 b528 )
    ( on b24 b63 )
    ( on b889 b24 )
    ( on b387 b889 )
    ( on b696 b387 )
    ( on b304 b696 )
    ( on b648 b304 )
    ( on b59 b648 )
    ( on b763 b59 )
    ( on b301 b763 )
    ( on b888 b301 )
    ( on b725 b888 )
    ( on b168 b725 )
    ( on b193 b168 )
    ( on b791 b193 )
    ( on b624 b791 )
    ( on b154 b624 )
    ( on b31 b154 )
    ( on b282 b31 )
    ( on b450 b282 )
    ( on b530 b450 )
    ( on b891 b530 )
    ( on b313 b891 )
    ( on b819 b313 )
    ( on b489 b819 )
    ( on b728 b489 )
    ( on b311 b728 )
    ( on b533 b311 )
    ( clear b533 )
  )
  ( :goal
    ( and
      ( clear b612 )
    )
  )
)
