( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city803 - city
    city514 - city
    city451 - city
    city869 - city
    city917 - city
    city725 - city
    city951 - city
    person4 - person
    person676 - person
    person307 - person
    person733 - person
    person281 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person4 city514 )
    ( person-at person676 city451 )
    ( person-at person307 city951 )
    ( person-at person733 city451 )
    ( person-at person281 city917 )
  )
  ( :tasks
    ( Fly-5Ppl person4 person676 person307 person733 person281 city000 )
  )
)
