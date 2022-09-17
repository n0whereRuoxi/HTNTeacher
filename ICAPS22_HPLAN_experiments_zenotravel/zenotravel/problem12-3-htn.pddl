( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city813 - city
    city616 - city
    city649 - city
    city479 - city
    city483 - city
    city691 - city
    city768 - city
    city398 - city
    city136 - city
    city192 - city
    city994 - city
    city225 - city
    city174 - city
    city689 - city
    city292 - city
    city335 - city
    person203 - person
    person940 - person
    person473 - person
    person852 - person
    person220 - person
    person309 - person
    person549 - person
    person661 - person
    person529 - person
    person950 - person
    person96 - person
    person530 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person203 city616 )
    ( person-at person940 city479 )
    ( person-at person473 city335 )
    ( person-at person852 city768 )
    ( person-at person220 city335 )
    ( person-at person309 city689 )
    ( person-at person549 city398 )
    ( person-at person661 city813 )
    ( person-at person529 city225 )
    ( person-at person950 city398 )
    ( person-at person96 city174 )
    ( person-at person530 city398 )
  )
  ( :tasks
    ( Fly-12Ppl person203 person940 person473 person852 person220 person309 person549 person661 person529 person950 person96 person530 city000 )
  )
)
