( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city833 - city
    city139 - city
    city946 - city
    city879 - city
    city607 - city
    city64 - city
    city880 - city
    city75 - city
    person700 - person
    person183 - person
    person2 - person
    person160 - person
    person295 - person
    person57 - person
    person844 - person
    person546 - person
    person143 - person
    person817 - person
    person95 - person
    person264 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person700 city607 )
    ( person-at person183 city607 )
    ( person-at person2 city607 )
    ( person-at person160 city64 )
    ( person-at person295 city833 )
    ( person-at person57 city607 )
    ( person-at person844 city75 )
    ( person-at person546 city946 )
    ( person-at person143 city75 )
    ( person-at person817 city139 )
    ( person-at person95 city879 )
    ( person-at person264 city880 )
  )
  ( :tasks
    ( Fly-12Ppl person700 person183 person2 person160 person295 person57 person844 person546 person143 person817 person95 person264 city000 )
  )
)
