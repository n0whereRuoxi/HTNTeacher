( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city775 - city
    city484 - city
    city845 - city
    city698 - city
    city660 - city
    city880 - city
    city860 - city
    city12 - city
    city515 - city
    city636 - city
    city530 - city
    city165 - city
    city838 - city
    city674 - city
    city767 - city
    city17 - city
    city516 - city
    person178 - person
    person770 - person
    person984 - person
    person36 - person
    person245 - person
    person519 - person
    person241 - person
    person577 - person
    person448 - person
    person963 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person178 city880 )
    ( person-at person770 city845 )
    ( person-at person984 city530 )
    ( person-at person36 city515 )
    ( person-at person245 city838 )
    ( person-at person519 city767 )
    ( person-at person241 city165 )
    ( person-at person577 city880 )
    ( person-at person448 city845 )
    ( person-at person963 city17 )
  )
  ( :tasks
    ( Fly-10Ppl person178 person770 person984 person36 person245 person519 person241 person577 person448 person963 city000 )
  )
)
