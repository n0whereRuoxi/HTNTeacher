( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b503 - block
    b10 - block
    b219 - block
    b260 - block
    b544 - block
    b407 - block
    b553 - block
    b644 - block
    b167 - block
    b655 - block
    b64 - block
    b111 - block
    b362 - block
    b986 - block
    b679 - block
    b203 - block
    b870 - block
    b523 - block
    b684 - block
    b664 - block
    b944 - block
    b528 - block
    b627 - block
    b478 - block
    b210 - block
    b692 - block
    b225 - block
    b667 - block
    b282 - block
    b437 - block
    b179 - block
    b400 - block
    b376 - block
    b404 - block
    b469 - block
    b149 - block
    b132 - block
    b292 - block
    b504 - block
    b621 - block
    b612 - block
    b799 - block
    b386 - block
    b542 - block
    b358 - block
    b971 - block
    b372 - block
    b457 - block
    b607 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b503 )
    ( on b10 b503 )
    ( on b219 b10 )
    ( on b260 b219 )
    ( on b544 b260 )
    ( on b407 b544 )
    ( on b553 b407 )
    ( on b644 b553 )
    ( on b167 b644 )
    ( on b655 b167 )
    ( on b64 b655 )
    ( on b111 b64 )
    ( on b362 b111 )
    ( on b986 b362 )
    ( on b679 b986 )
    ( on b203 b679 )
    ( on b870 b203 )
    ( on b523 b870 )
    ( on b684 b523 )
    ( on b664 b684 )
    ( on b944 b664 )
    ( on b528 b944 )
    ( on b627 b528 )
    ( on b478 b627 )
    ( on b210 b478 )
    ( on b692 b210 )
    ( on b225 b692 )
    ( on b667 b225 )
    ( on b282 b667 )
    ( on b437 b282 )
    ( on b179 b437 )
    ( on b400 b179 )
    ( on b376 b400 )
    ( on b404 b376 )
    ( on b469 b404 )
    ( on b149 b469 )
    ( on b132 b149 )
    ( on b292 b132 )
    ( on b504 b292 )
    ( on b621 b504 )
    ( on b612 b621 )
    ( on b799 b612 )
    ( on b386 b799 )
    ( on b542 b386 )
    ( on b358 b542 )
    ( on b971 b358 )
    ( on b372 b971 )
    ( on b457 b372 )
    ( on b607 b457 )
    ( clear b607 )
  )
  ( :goal
    ( and
      ( clear b503 )
    )
  )
)
