( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city899 - city
    city806 - city
    city361 - city
    city606 - city
    city96 - city
    city922 - city
    city274 - city
    person17 - person
    person650 - person
    person517 - person
    person796 - person
    person235 - person
    person756 - person
    person762 - person
    person90 - person
    person767 - person
    person499 - person
    person666 - person
    person754 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person17 city274 )
    ( person-at person650 city899 )
    ( person-at person517 city899 )
    ( person-at person796 city899 )
    ( person-at person235 city606 )
    ( person-at person756 city606 )
    ( person-at person762 city96 )
    ( person-at person90 city274 )
    ( person-at person767 city96 )
    ( person-at person499 city606 )
    ( person-at person666 city96 )
    ( person-at person754 city361 )
  )
  ( :tasks
    ( Fly-12Ppl person17 person650 person517 person796 person235 person756 person762 person90 person767 person499 person666 person754 city000 )
  )
)
