( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city785 - city
    city359 - city
    city627 - city
    city697 - city
    city879 - city
    city145 - city
    city505 - city
    city342 - city
    city606 - city
    city375 - city
    city455 - city
    city225 - city
    city749 - city
    city106 - city
    city824 - city
    person501 - person
    person206 - person
    person637 - person
    person207 - person
    person379 - person
    person552 - person
    person912 - person
    person197 - person
    person231 - person
    person450 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person501 city455 )
    ( person-at person206 city606 )
    ( person-at person637 city106 )
    ( person-at person207 city785 )
    ( person-at person379 city342 )
    ( person-at person552 city342 )
    ( person-at person912 city359 )
    ( person-at person197 city824 )
    ( person-at person231 city505 )
    ( person-at person450 city879 )
  )
  ( :tasks
    ( Fly-10Ppl person501 person206 person637 person207 person379 person552 person912 person197 person231 person450 city000 )
  )
)
