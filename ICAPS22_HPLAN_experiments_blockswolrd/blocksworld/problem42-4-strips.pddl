( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b634 - block
    b402 - block
    b565 - block
    b917 - block
    b988 - block
    b762 - block
    b770 - block
    b826 - block
    b447 - block
    b390 - block
    b608 - block
    b249 - block
    b51 - block
    b658 - block
    b888 - block
    b827 - block
    b557 - block
    b935 - block
    b25 - block
    b133 - block
    b616 - block
    b513 - block
    b439 - block
    b396 - block
    b569 - block
    b945 - block
    b255 - block
    b325 - block
    b350 - block
    b336 - block
    b675 - block
    b771 - block
    b223 - block
    b517 - block
    b606 - block
    b1 - block
    b38 - block
    b567 - block
    b800 - block
    b152 - block
    b925 - block
    b250 - block
    b617 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b634 )
    ( on b402 b634 )
    ( on b565 b402 )
    ( on b917 b565 )
    ( on b988 b917 )
    ( on b762 b988 )
    ( on b770 b762 )
    ( on b826 b770 )
    ( on b447 b826 )
    ( on b390 b447 )
    ( on b608 b390 )
    ( on b249 b608 )
    ( on b51 b249 )
    ( on b658 b51 )
    ( on b888 b658 )
    ( on b827 b888 )
    ( on b557 b827 )
    ( on b935 b557 )
    ( on b25 b935 )
    ( on b133 b25 )
    ( on b616 b133 )
    ( on b513 b616 )
    ( on b439 b513 )
    ( on b396 b439 )
    ( on b569 b396 )
    ( on b945 b569 )
    ( on b255 b945 )
    ( on b325 b255 )
    ( on b350 b325 )
    ( on b336 b350 )
    ( on b675 b336 )
    ( on b771 b675 )
    ( on b223 b771 )
    ( on b517 b223 )
    ( on b606 b517 )
    ( on b1 b606 )
    ( on b38 b1 )
    ( on b567 b38 )
    ( on b800 b567 )
    ( on b152 b800 )
    ( on b925 b152 )
    ( on b250 b925 )
    ( on b617 b250 )
    ( clear b617 )
  )
  ( :goal
    ( and
      ( clear b634 )
    )
  )
)
