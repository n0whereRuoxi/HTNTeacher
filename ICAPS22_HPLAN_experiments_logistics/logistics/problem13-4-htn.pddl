( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-515 - location
    l000-612 - location
    l000-272 - location
    l000-724 - location
    l000-514 - location
    l000-991 - location
    l000-230 - location
    l000-686 - location
    l000-872 - location
    l000-5 - location
    l000-725 - location
    l000-987 - location
    l000-629 - location
    l000-568 - location
    l000-661 - location
    l000-315 - location
    l000-621 - location
    l000-894 - location
    l000-528 - location
    l000-500 - location
    l000-503 - location
    l000-100 - location
    l000-865 - location
    l000-937 - location
    l000-64 - location
    p291 - obj
    p923 - obj
    p546 - obj
    p911 - obj
    p339 - obj
    p471 - obj
    p994 - obj
    p439 - obj
    p184 - obj
    p482 - obj
    p744 - obj
    p35 - obj
    p560 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-515 c000 )
    ( in-city l000-612 c000 )
    ( in-city l000-272 c000 )
    ( in-city l000-724 c000 )
    ( in-city l000-514 c000 )
    ( in-city l000-991 c000 )
    ( in-city l000-230 c000 )
    ( in-city l000-686 c000 )
    ( in-city l000-872 c000 )
    ( in-city l000-5 c000 )
    ( in-city l000-725 c000 )
    ( in-city l000-987 c000 )
    ( in-city l000-629 c000 )
    ( in-city l000-568 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-315 c000 )
    ( in-city l000-621 c000 )
    ( in-city l000-894 c000 )
    ( in-city l000-528 c000 )
    ( in-city l000-500 c000 )
    ( in-city l000-503 c000 )
    ( in-city l000-100 c000 )
    ( in-city l000-865 c000 )
    ( in-city l000-937 c000 )
    ( in-city l000-64 c000 )
    ( obj-at p291 l000-64 )
    ( obj-at p923 l000-5 )
    ( obj-at p546 l000-503 )
    ( obj-at p911 l000-5 )
    ( obj-at p339 l000-686 )
    ( obj-at p471 l000-894 )
    ( obj-at p994 l000-661 )
    ( obj-at p439 l000-500 )
    ( obj-at p184 l000-64 )
    ( obj-at p482 l000-686 )
    ( obj-at p744 l000-230 )
    ( obj-at p35 l000-503 )
    ( obj-at p560 l000-629 )
    ( greater-than p923 p291 )
    ( greater-than p546 p291 )
    ( greater-than p546 p923 )
    ( greater-than p911 p291 )
    ( greater-than p911 p923 )
    ( greater-than p911 p546 )
    ( greater-than p339 p291 )
    ( greater-than p339 p923 )
    ( greater-than p339 p546 )
    ( greater-than p339 p911 )
    ( greater-than p471 p291 )
    ( greater-than p471 p923 )
    ( greater-than p471 p546 )
    ( greater-than p471 p911 )
    ( greater-than p471 p339 )
    ( greater-than p994 p291 )
    ( greater-than p994 p923 )
    ( greater-than p994 p546 )
    ( greater-than p994 p911 )
    ( greater-than p994 p339 )
    ( greater-than p994 p471 )
    ( greater-than p439 p291 )
    ( greater-than p439 p923 )
    ( greater-than p439 p546 )
    ( greater-than p439 p911 )
    ( greater-than p439 p339 )
    ( greater-than p439 p471 )
    ( greater-than p439 p994 )
    ( greater-than p184 p291 )
    ( greater-than p184 p923 )
    ( greater-than p184 p546 )
    ( greater-than p184 p911 )
    ( greater-than p184 p339 )
    ( greater-than p184 p471 )
    ( greater-than p184 p994 )
    ( greater-than p184 p439 )
    ( greater-than p482 p291 )
    ( greater-than p482 p923 )
    ( greater-than p482 p546 )
    ( greater-than p482 p911 )
    ( greater-than p482 p339 )
    ( greater-than p482 p471 )
    ( greater-than p482 p994 )
    ( greater-than p482 p439 )
    ( greater-than p482 p184 )
    ( greater-than p744 p291 )
    ( greater-than p744 p923 )
    ( greater-than p744 p546 )
    ( greater-than p744 p911 )
    ( greater-than p744 p339 )
    ( greater-than p744 p471 )
    ( greater-than p744 p994 )
    ( greater-than p744 p439 )
    ( greater-than p744 p184 )
    ( greater-than p744 p482 )
    ( greater-than p35 p291 )
    ( greater-than p35 p923 )
    ( greater-than p35 p546 )
    ( greater-than p35 p911 )
    ( greater-than p35 p339 )
    ( greater-than p35 p471 )
    ( greater-than p35 p994 )
    ( greater-than p35 p439 )
    ( greater-than p35 p184 )
    ( greater-than p35 p482 )
    ( greater-than p35 p744 )
    ( greater-than p560 p291 )
    ( greater-than p560 p923 )
    ( greater-than p560 p546 )
    ( greater-than p560 p911 )
    ( greater-than p560 p339 )
    ( greater-than p560 p471 )
    ( greater-than p560 p994 )
    ( greater-than p560 p439 )
    ( greater-than p560 p184 )
    ( greater-than p560 p482 )
    ( greater-than p560 p744 )
    ( greater-than p560 p35 )
  )
  ( :tasks
    ( Deliver-13Pkg p291 p923 p546 p911 p339 p471 p994 p439 p184 p482 p744 p35 p560 l000-000 )
  )
)
