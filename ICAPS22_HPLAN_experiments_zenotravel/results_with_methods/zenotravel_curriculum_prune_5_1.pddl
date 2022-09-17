( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-5PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?p5 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) ( PERSON-AT ?p5 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_60996 - PERSON
      ?auto_60995 - CITY
    )
    :vars
    (
      ?auto_60999 - FLEVEL
      ?auto_60998 - FLEVEL
      ?auto_61000 - CITY
      ?auto_60997 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_60999 ?auto_60998 ) ( PERSON-AT ?auto_60996 ?auto_61000 ) ( AIRCRAFT-AT ?auto_60997 ?auto_60995 ) ( FUEL-LEVEL ?auto_60997 ?auto_60999 ) ( not ( = ?auto_60995 ?auto_61000 ) ) ( not ( = ?auto_60999 ?auto_60998 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_60997 ?auto_60995 ?auto_60999 ?auto_60998 )
      ( !FLY ?auto_60997 ?auto_60995 ?auto_61000 ?auto_60998 ?auto_60999 )
      ( !REFUEL ?auto_60997 ?auto_61000 ?auto_60999 ?auto_60998 )
      ( !BOARD ?auto_60996 ?auto_60997 ?auto_61000 )
      ( !FLY ?auto_60997 ?auto_61000 ?auto_60995 ?auto_60998 ?auto_60999 )
      ( !DEBARK ?auto_60996 ?auto_60997 ?auto_60995 )
      ( FLY-1PPL-VERIFY ?auto_60996 ?auto_60995 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_61019 - PERSON
      ?auto_61020 - PERSON
      ?auto_61018 - CITY
    )
    :vars
    (
      ?auto_61021 - FLEVEL
      ?auto_61022 - FLEVEL
      ?auto_61024 - CITY
      ?auto_61025 - CITY
      ?auto_61023 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_61021 ?auto_61022 ) ( PERSON-AT ?auto_61020 ?auto_61024 ) ( not ( = ?auto_61018 ?auto_61024 ) ) ( not ( = ?auto_61021 ?auto_61022 ) ) ( PERSON-AT ?auto_61019 ?auto_61025 ) ( AIRCRAFT-AT ?auto_61023 ?auto_61018 ) ( FUEL-LEVEL ?auto_61023 ?auto_61021 ) ( not ( = ?auto_61018 ?auto_61025 ) ) ( not ( = ?auto_61019 ?auto_61020 ) ) ( not ( = ?auto_61024 ?auto_61025 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_61019 ?auto_61018 )
      ( FLY-1PPL ?auto_61020 ?auto_61018 )
      ( FLY-2PPL-VERIFY ?auto_61019 ?auto_61020 ?auto_61018 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_61134 - PERSON
      ?auto_61135 - PERSON
      ?auto_61136 - PERSON
      ?auto_61133 - CITY
    )
    :vars
    (
      ?auto_61137 - FLEVEL
      ?auto_61138 - FLEVEL
      ?auto_61139 - CITY
      ?auto_61142 - CITY
      ?auto_61141 - CITY
      ?auto_61140 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_61137 ?auto_61138 ) ( PERSON-AT ?auto_61136 ?auto_61139 ) ( not ( = ?auto_61133 ?auto_61139 ) ) ( not ( = ?auto_61137 ?auto_61138 ) ) ( PERSON-AT ?auto_61135 ?auto_61142 ) ( not ( = ?auto_61133 ?auto_61142 ) ) ( PERSON-AT ?auto_61134 ?auto_61141 ) ( AIRCRAFT-AT ?auto_61140 ?auto_61133 ) ( FUEL-LEVEL ?auto_61140 ?auto_61137 ) ( not ( = ?auto_61133 ?auto_61141 ) ) ( not ( = ?auto_61134 ?auto_61135 ) ) ( not ( = ?auto_61142 ?auto_61141 ) ) ( not ( = ?auto_61134 ?auto_61136 ) ) ( not ( = ?auto_61135 ?auto_61136 ) ) ( not ( = ?auto_61139 ?auto_61142 ) ) ( not ( = ?auto_61139 ?auto_61141 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_61134 ?auto_61135 ?auto_61133 )
      ( FLY-1PPL ?auto_61136 ?auto_61133 )
      ( FLY-3PPL-VERIFY ?auto_61134 ?auto_61135 ?auto_61136 ?auto_61133 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_62291 - PERSON
      ?auto_62292 - PERSON
      ?auto_62293 - PERSON
      ?auto_62294 - PERSON
      ?auto_62290 - CITY
    )
    :vars
    (
      ?auto_62298 - FLEVEL
      ?auto_62296 - FLEVEL
      ?auto_62297 - CITY
      ?auto_62299 - CITY
      ?auto_62300 - CITY
      ?auto_62295 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_62298 ?auto_62296 ) ( PERSON-AT ?auto_62294 ?auto_62297 ) ( not ( = ?auto_62290 ?auto_62297 ) ) ( not ( = ?auto_62298 ?auto_62296 ) ) ( PERSON-AT ?auto_62293 ?auto_62299 ) ( not ( = ?auto_62290 ?auto_62299 ) ) ( PERSON-AT ?auto_62292 ?auto_62297 ) ( PERSON-AT ?auto_62291 ?auto_62300 ) ( AIRCRAFT-AT ?auto_62295 ?auto_62290 ) ( FUEL-LEVEL ?auto_62295 ?auto_62298 ) ( not ( = ?auto_62290 ?auto_62300 ) ) ( not ( = ?auto_62291 ?auto_62292 ) ) ( not ( = ?auto_62297 ?auto_62300 ) ) ( not ( = ?auto_62291 ?auto_62293 ) ) ( not ( = ?auto_62292 ?auto_62293 ) ) ( not ( = ?auto_62299 ?auto_62297 ) ) ( not ( = ?auto_62299 ?auto_62300 ) ) ( not ( = ?auto_62291 ?auto_62294 ) ) ( not ( = ?auto_62292 ?auto_62294 ) ) ( not ( = ?auto_62293 ?auto_62294 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_62291 ?auto_62292 ?auto_62293 ?auto_62290 )
      ( FLY-1PPL ?auto_62294 ?auto_62290 )
      ( FLY-4PPL-VERIFY ?auto_62291 ?auto_62292 ?auto_62293 ?auto_62294 ?auto_62290 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_62326 - PERSON
      ?auto_62327 - PERSON
      ?auto_62328 - PERSON
      ?auto_62329 - PERSON
      ?auto_62325 - CITY
    )
    :vars
    (
      ?auto_62333 - FLEVEL
      ?auto_62332 - FLEVEL
      ?auto_62330 - CITY
      ?auto_62331 - CITY
      ?auto_62335 - CITY
      ?auto_62334 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_62333 ?auto_62332 ) ( PERSON-AT ?auto_62328 ?auto_62330 ) ( not ( = ?auto_62325 ?auto_62330 ) ) ( not ( = ?auto_62333 ?auto_62332 ) ) ( PERSON-AT ?auto_62329 ?auto_62331 ) ( not ( = ?auto_62325 ?auto_62331 ) ) ( PERSON-AT ?auto_62327 ?auto_62330 ) ( PERSON-AT ?auto_62326 ?auto_62335 ) ( AIRCRAFT-AT ?auto_62334 ?auto_62325 ) ( FUEL-LEVEL ?auto_62334 ?auto_62333 ) ( not ( = ?auto_62325 ?auto_62335 ) ) ( not ( = ?auto_62326 ?auto_62327 ) ) ( not ( = ?auto_62330 ?auto_62335 ) ) ( not ( = ?auto_62326 ?auto_62329 ) ) ( not ( = ?auto_62327 ?auto_62329 ) ) ( not ( = ?auto_62331 ?auto_62330 ) ) ( not ( = ?auto_62331 ?auto_62335 ) ) ( not ( = ?auto_62326 ?auto_62328 ) ) ( not ( = ?auto_62327 ?auto_62328 ) ) ( not ( = ?auto_62329 ?auto_62328 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_62326 ?auto_62327 ?auto_62329 ?auto_62328 ?auto_62325 )
      ( FLY-4PPL-VERIFY ?auto_62326 ?auto_62327 ?auto_62328 ?auto_62329 ?auto_62325 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_62361 - PERSON
      ?auto_62362 - PERSON
      ?auto_62363 - PERSON
      ?auto_62364 - PERSON
      ?auto_62360 - CITY
    )
    :vars
    (
      ?auto_62370 - FLEVEL
      ?auto_62369 - FLEVEL
      ?auto_62368 - CITY
      ?auto_62367 - CITY
      ?auto_62366 - CITY
      ?auto_62365 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_62370 ?auto_62369 ) ( PERSON-AT ?auto_62364 ?auto_62368 ) ( not ( = ?auto_62360 ?auto_62368 ) ) ( not ( = ?auto_62370 ?auto_62369 ) ) ( PERSON-AT ?auto_62362 ?auto_62367 ) ( not ( = ?auto_62360 ?auto_62367 ) ) ( PERSON-AT ?auto_62363 ?auto_62368 ) ( PERSON-AT ?auto_62361 ?auto_62366 ) ( AIRCRAFT-AT ?auto_62365 ?auto_62360 ) ( FUEL-LEVEL ?auto_62365 ?auto_62370 ) ( not ( = ?auto_62360 ?auto_62366 ) ) ( not ( = ?auto_62361 ?auto_62363 ) ) ( not ( = ?auto_62368 ?auto_62366 ) ) ( not ( = ?auto_62361 ?auto_62362 ) ) ( not ( = ?auto_62363 ?auto_62362 ) ) ( not ( = ?auto_62367 ?auto_62368 ) ) ( not ( = ?auto_62367 ?auto_62366 ) ) ( not ( = ?auto_62361 ?auto_62364 ) ) ( not ( = ?auto_62363 ?auto_62364 ) ) ( not ( = ?auto_62362 ?auto_62364 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_62361 ?auto_62363 ?auto_62364 ?auto_62362 ?auto_62360 )
      ( FLY-4PPL-VERIFY ?auto_62361 ?auto_62362 ?auto_62363 ?auto_62364 ?auto_62360 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_62631 - PERSON
      ?auto_62632 - PERSON
      ?auto_62633 - PERSON
      ?auto_62634 - PERSON
      ?auto_62630 - CITY
    )
    :vars
    (
      ?auto_62640 - FLEVEL
      ?auto_62639 - FLEVEL
      ?auto_62638 - CITY
      ?auto_62637 - CITY
      ?auto_62636 - CITY
      ?auto_62635 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_62640 ?auto_62639 ) ( PERSON-AT ?auto_62634 ?auto_62638 ) ( not ( = ?auto_62630 ?auto_62638 ) ) ( not ( = ?auto_62640 ?auto_62639 ) ) ( PERSON-AT ?auto_62633 ?auto_62637 ) ( not ( = ?auto_62630 ?auto_62637 ) ) ( PERSON-AT ?auto_62631 ?auto_62638 ) ( PERSON-AT ?auto_62632 ?auto_62636 ) ( AIRCRAFT-AT ?auto_62635 ?auto_62630 ) ( FUEL-LEVEL ?auto_62635 ?auto_62640 ) ( not ( = ?auto_62630 ?auto_62636 ) ) ( not ( = ?auto_62632 ?auto_62631 ) ) ( not ( = ?auto_62638 ?auto_62636 ) ) ( not ( = ?auto_62632 ?auto_62633 ) ) ( not ( = ?auto_62631 ?auto_62633 ) ) ( not ( = ?auto_62637 ?auto_62638 ) ) ( not ( = ?auto_62637 ?auto_62636 ) ) ( not ( = ?auto_62632 ?auto_62634 ) ) ( not ( = ?auto_62631 ?auto_62634 ) ) ( not ( = ?auto_62633 ?auto_62634 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_62632 ?auto_62631 ?auto_62634 ?auto_62633 ?auto_62630 )
      ( FLY-4PPL-VERIFY ?auto_62631 ?auto_62632 ?auto_62633 ?auto_62634 ?auto_62630 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_62666 - PERSON
      ?auto_62667 - PERSON
      ?auto_62668 - PERSON
      ?auto_62669 - PERSON
      ?auto_62665 - CITY
    )
    :vars
    (
      ?auto_62675 - FLEVEL
      ?auto_62674 - FLEVEL
      ?auto_62673 - CITY
      ?auto_62672 - CITY
      ?auto_62671 - CITY
      ?auto_62670 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_62675 ?auto_62674 ) ( PERSON-AT ?auto_62668 ?auto_62673 ) ( not ( = ?auto_62665 ?auto_62673 ) ) ( not ( = ?auto_62675 ?auto_62674 ) ) ( PERSON-AT ?auto_62669 ?auto_62672 ) ( not ( = ?auto_62665 ?auto_62672 ) ) ( PERSON-AT ?auto_62666 ?auto_62673 ) ( PERSON-AT ?auto_62667 ?auto_62671 ) ( AIRCRAFT-AT ?auto_62670 ?auto_62665 ) ( FUEL-LEVEL ?auto_62670 ?auto_62675 ) ( not ( = ?auto_62665 ?auto_62671 ) ) ( not ( = ?auto_62667 ?auto_62666 ) ) ( not ( = ?auto_62673 ?auto_62671 ) ) ( not ( = ?auto_62667 ?auto_62669 ) ) ( not ( = ?auto_62666 ?auto_62669 ) ) ( not ( = ?auto_62672 ?auto_62673 ) ) ( not ( = ?auto_62672 ?auto_62671 ) ) ( not ( = ?auto_62667 ?auto_62668 ) ) ( not ( = ?auto_62666 ?auto_62668 ) ) ( not ( = ?auto_62669 ?auto_62668 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_62667 ?auto_62666 ?auto_62668 ?auto_62669 ?auto_62665 )
      ( FLY-4PPL-VERIFY ?auto_62666 ?auto_62667 ?auto_62668 ?auto_62669 ?auto_62665 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_62870 - PERSON
      ?auto_62871 - PERSON
      ?auto_62872 - PERSON
      ?auto_62873 - PERSON
      ?auto_62869 - CITY
    )
    :vars
    (
      ?auto_62879 - FLEVEL
      ?auto_62878 - FLEVEL
      ?auto_62877 - CITY
      ?auto_62876 - CITY
      ?auto_62875 - CITY
      ?auto_62874 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_62879 ?auto_62878 ) ( PERSON-AT ?auto_62871 ?auto_62877 ) ( not ( = ?auto_62869 ?auto_62877 ) ) ( not ( = ?auto_62879 ?auto_62878 ) ) ( PERSON-AT ?auto_62873 ?auto_62876 ) ( not ( = ?auto_62869 ?auto_62876 ) ) ( PERSON-AT ?auto_62870 ?auto_62877 ) ( PERSON-AT ?auto_62872 ?auto_62875 ) ( AIRCRAFT-AT ?auto_62874 ?auto_62869 ) ( FUEL-LEVEL ?auto_62874 ?auto_62879 ) ( not ( = ?auto_62869 ?auto_62875 ) ) ( not ( = ?auto_62872 ?auto_62870 ) ) ( not ( = ?auto_62877 ?auto_62875 ) ) ( not ( = ?auto_62872 ?auto_62873 ) ) ( not ( = ?auto_62870 ?auto_62873 ) ) ( not ( = ?auto_62876 ?auto_62877 ) ) ( not ( = ?auto_62876 ?auto_62875 ) ) ( not ( = ?auto_62872 ?auto_62871 ) ) ( not ( = ?auto_62870 ?auto_62871 ) ) ( not ( = ?auto_62873 ?auto_62871 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_62872 ?auto_62870 ?auto_62871 ?auto_62873 ?auto_62869 )
      ( FLY-4PPL-VERIFY ?auto_62870 ?auto_62871 ?auto_62872 ?auto_62873 ?auto_62869 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_78014 - PERSON
      ?auto_78015 - PERSON
      ?auto_78016 - PERSON
      ?auto_78017 - PERSON
      ?auto_78018 - PERSON
      ?auto_78013 - CITY
    )
    :vars
    (
      ?auto_78022 - FLEVEL
      ?auto_78020 - FLEVEL
      ?auto_78019 - CITY
      ?auto_78025 - CITY
      ?auto_78024 - CITY
      ?auto_78023 - CITY
      ?auto_78021 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_78022 ?auto_78020 ) ( PERSON-AT ?auto_78018 ?auto_78019 ) ( not ( = ?auto_78013 ?auto_78019 ) ) ( not ( = ?auto_78022 ?auto_78020 ) ) ( PERSON-AT ?auto_78017 ?auto_78025 ) ( not ( = ?auto_78013 ?auto_78025 ) ) ( PERSON-AT ?auto_78016 ?auto_78024 ) ( not ( = ?auto_78013 ?auto_78024 ) ) ( PERSON-AT ?auto_78015 ?auto_78025 ) ( PERSON-AT ?auto_78014 ?auto_78023 ) ( AIRCRAFT-AT ?auto_78021 ?auto_78013 ) ( FUEL-LEVEL ?auto_78021 ?auto_78022 ) ( not ( = ?auto_78013 ?auto_78023 ) ) ( not ( = ?auto_78014 ?auto_78015 ) ) ( not ( = ?auto_78025 ?auto_78023 ) ) ( not ( = ?auto_78014 ?auto_78016 ) ) ( not ( = ?auto_78015 ?auto_78016 ) ) ( not ( = ?auto_78024 ?auto_78025 ) ) ( not ( = ?auto_78024 ?auto_78023 ) ) ( not ( = ?auto_78014 ?auto_78017 ) ) ( not ( = ?auto_78015 ?auto_78017 ) ) ( not ( = ?auto_78016 ?auto_78017 ) ) ( not ( = ?auto_78014 ?auto_78018 ) ) ( not ( = ?auto_78015 ?auto_78018 ) ) ( not ( = ?auto_78016 ?auto_78018 ) ) ( not ( = ?auto_78017 ?auto_78018 ) ) ( not ( = ?auto_78019 ?auto_78025 ) ) ( not ( = ?auto_78019 ?auto_78024 ) ) ( not ( = ?auto_78019 ?auto_78023 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_78014 ?auto_78015 ?auto_78017 ?auto_78016 ?auto_78013 )
      ( FLY-1PPL ?auto_78018 ?auto_78013 )
      ( FLY-5PPL-VERIFY ?auto_78014 ?auto_78015 ?auto_78016 ?auto_78017 ?auto_78018 ?auto_78013 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_78069 - PERSON
      ?auto_78070 - PERSON
      ?auto_78071 - PERSON
      ?auto_78072 - PERSON
      ?auto_78073 - PERSON
      ?auto_78068 - CITY
    )
    :vars
    (
      ?auto_78075 - FLEVEL
      ?auto_78077 - FLEVEL
      ?auto_78079 - CITY
      ?auto_78076 - CITY
      ?auto_78074 - CITY
      ?auto_78080 - CITY
      ?auto_78078 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_78075 ?auto_78077 ) ( PERSON-AT ?auto_78072 ?auto_78079 ) ( not ( = ?auto_78068 ?auto_78079 ) ) ( not ( = ?auto_78075 ?auto_78077 ) ) ( PERSON-AT ?auto_78073 ?auto_78076 ) ( not ( = ?auto_78068 ?auto_78076 ) ) ( PERSON-AT ?auto_78071 ?auto_78074 ) ( not ( = ?auto_78068 ?auto_78074 ) ) ( PERSON-AT ?auto_78070 ?auto_78076 ) ( PERSON-AT ?auto_78069 ?auto_78080 ) ( AIRCRAFT-AT ?auto_78078 ?auto_78068 ) ( FUEL-LEVEL ?auto_78078 ?auto_78075 ) ( not ( = ?auto_78068 ?auto_78080 ) ) ( not ( = ?auto_78069 ?auto_78070 ) ) ( not ( = ?auto_78076 ?auto_78080 ) ) ( not ( = ?auto_78069 ?auto_78071 ) ) ( not ( = ?auto_78070 ?auto_78071 ) ) ( not ( = ?auto_78074 ?auto_78076 ) ) ( not ( = ?auto_78074 ?auto_78080 ) ) ( not ( = ?auto_78069 ?auto_78073 ) ) ( not ( = ?auto_78070 ?auto_78073 ) ) ( not ( = ?auto_78071 ?auto_78073 ) ) ( not ( = ?auto_78069 ?auto_78072 ) ) ( not ( = ?auto_78070 ?auto_78072 ) ) ( not ( = ?auto_78071 ?auto_78072 ) ) ( not ( = ?auto_78073 ?auto_78072 ) ) ( not ( = ?auto_78079 ?auto_78076 ) ) ( not ( = ?auto_78079 ?auto_78074 ) ) ( not ( = ?auto_78079 ?auto_78080 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_78069 ?auto_78070 ?auto_78071 ?auto_78073 ?auto_78072 ?auto_78068 )
      ( FLY-5PPL-VERIFY ?auto_78069 ?auto_78070 ?auto_78071 ?auto_78072 ?auto_78073 ?auto_78068 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_78124 - PERSON
      ?auto_78125 - PERSON
      ?auto_78126 - PERSON
      ?auto_78127 - PERSON
      ?auto_78128 - PERSON
      ?auto_78123 - CITY
    )
    :vars
    (
      ?auto_78131 - FLEVEL
      ?auto_78135 - FLEVEL
      ?auto_78129 - CITY
      ?auto_78134 - CITY
      ?auto_78130 - CITY
      ?auto_78133 - CITY
      ?auto_78132 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_78131 ?auto_78135 ) ( PERSON-AT ?auto_78128 ?auto_78129 ) ( not ( = ?auto_78123 ?auto_78129 ) ) ( not ( = ?auto_78131 ?auto_78135 ) ) ( PERSON-AT ?auto_78126 ?auto_78134 ) ( not ( = ?auto_78123 ?auto_78134 ) ) ( PERSON-AT ?auto_78127 ?auto_78130 ) ( not ( = ?auto_78123 ?auto_78130 ) ) ( PERSON-AT ?auto_78125 ?auto_78134 ) ( PERSON-AT ?auto_78124 ?auto_78133 ) ( AIRCRAFT-AT ?auto_78132 ?auto_78123 ) ( FUEL-LEVEL ?auto_78132 ?auto_78131 ) ( not ( = ?auto_78123 ?auto_78133 ) ) ( not ( = ?auto_78124 ?auto_78125 ) ) ( not ( = ?auto_78134 ?auto_78133 ) ) ( not ( = ?auto_78124 ?auto_78127 ) ) ( not ( = ?auto_78125 ?auto_78127 ) ) ( not ( = ?auto_78130 ?auto_78134 ) ) ( not ( = ?auto_78130 ?auto_78133 ) ) ( not ( = ?auto_78124 ?auto_78126 ) ) ( not ( = ?auto_78125 ?auto_78126 ) ) ( not ( = ?auto_78127 ?auto_78126 ) ) ( not ( = ?auto_78124 ?auto_78128 ) ) ( not ( = ?auto_78125 ?auto_78128 ) ) ( not ( = ?auto_78127 ?auto_78128 ) ) ( not ( = ?auto_78126 ?auto_78128 ) ) ( not ( = ?auto_78129 ?auto_78134 ) ) ( not ( = ?auto_78129 ?auto_78130 ) ) ( not ( = ?auto_78129 ?auto_78133 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_78124 ?auto_78125 ?auto_78127 ?auto_78128 ?auto_78126 ?auto_78123 )
      ( FLY-5PPL-VERIFY ?auto_78124 ?auto_78125 ?auto_78126 ?auto_78127 ?auto_78128 ?auto_78123 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_78729 - PERSON
      ?auto_78730 - PERSON
      ?auto_78731 - PERSON
      ?auto_78732 - PERSON
      ?auto_78733 - PERSON
      ?auto_78728 - CITY
    )
    :vars
    (
      ?auto_78736 - FLEVEL
      ?auto_78740 - FLEVEL
      ?auto_78734 - CITY
      ?auto_78739 - CITY
      ?auto_78735 - CITY
      ?auto_78738 - CITY
      ?auto_78737 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_78736 ?auto_78740 ) ( PERSON-AT ?auto_78733 ?auto_78734 ) ( not ( = ?auto_78728 ?auto_78734 ) ) ( not ( = ?auto_78736 ?auto_78740 ) ) ( PERSON-AT ?auto_78732 ?auto_78739 ) ( not ( = ?auto_78728 ?auto_78739 ) ) ( PERSON-AT ?auto_78730 ?auto_78735 ) ( not ( = ?auto_78728 ?auto_78735 ) ) ( PERSON-AT ?auto_78731 ?auto_78739 ) ( PERSON-AT ?auto_78729 ?auto_78738 ) ( AIRCRAFT-AT ?auto_78737 ?auto_78728 ) ( FUEL-LEVEL ?auto_78737 ?auto_78736 ) ( not ( = ?auto_78728 ?auto_78738 ) ) ( not ( = ?auto_78729 ?auto_78731 ) ) ( not ( = ?auto_78739 ?auto_78738 ) ) ( not ( = ?auto_78729 ?auto_78730 ) ) ( not ( = ?auto_78731 ?auto_78730 ) ) ( not ( = ?auto_78735 ?auto_78739 ) ) ( not ( = ?auto_78735 ?auto_78738 ) ) ( not ( = ?auto_78729 ?auto_78732 ) ) ( not ( = ?auto_78731 ?auto_78732 ) ) ( not ( = ?auto_78730 ?auto_78732 ) ) ( not ( = ?auto_78729 ?auto_78733 ) ) ( not ( = ?auto_78731 ?auto_78733 ) ) ( not ( = ?auto_78730 ?auto_78733 ) ) ( not ( = ?auto_78732 ?auto_78733 ) ) ( not ( = ?auto_78734 ?auto_78739 ) ) ( not ( = ?auto_78734 ?auto_78735 ) ) ( not ( = ?auto_78734 ?auto_78738 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_78729 ?auto_78731 ?auto_78730 ?auto_78733 ?auto_78732 ?auto_78728 )
      ( FLY-5PPL-VERIFY ?auto_78729 ?auto_78730 ?auto_78731 ?auto_78732 ?auto_78733 ?auto_78728 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_78784 - PERSON
      ?auto_78785 - PERSON
      ?auto_78786 - PERSON
      ?auto_78787 - PERSON
      ?auto_78788 - PERSON
      ?auto_78783 - CITY
    )
    :vars
    (
      ?auto_78791 - FLEVEL
      ?auto_78795 - FLEVEL
      ?auto_78789 - CITY
      ?auto_78794 - CITY
      ?auto_78790 - CITY
      ?auto_78793 - CITY
      ?auto_78792 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_78791 ?auto_78795 ) ( PERSON-AT ?auto_78787 ?auto_78789 ) ( not ( = ?auto_78783 ?auto_78789 ) ) ( not ( = ?auto_78791 ?auto_78795 ) ) ( PERSON-AT ?auto_78788 ?auto_78794 ) ( not ( = ?auto_78783 ?auto_78794 ) ) ( PERSON-AT ?auto_78785 ?auto_78790 ) ( not ( = ?auto_78783 ?auto_78790 ) ) ( PERSON-AT ?auto_78786 ?auto_78794 ) ( PERSON-AT ?auto_78784 ?auto_78793 ) ( AIRCRAFT-AT ?auto_78792 ?auto_78783 ) ( FUEL-LEVEL ?auto_78792 ?auto_78791 ) ( not ( = ?auto_78783 ?auto_78793 ) ) ( not ( = ?auto_78784 ?auto_78786 ) ) ( not ( = ?auto_78794 ?auto_78793 ) ) ( not ( = ?auto_78784 ?auto_78785 ) ) ( not ( = ?auto_78786 ?auto_78785 ) ) ( not ( = ?auto_78790 ?auto_78794 ) ) ( not ( = ?auto_78790 ?auto_78793 ) ) ( not ( = ?auto_78784 ?auto_78788 ) ) ( not ( = ?auto_78786 ?auto_78788 ) ) ( not ( = ?auto_78785 ?auto_78788 ) ) ( not ( = ?auto_78784 ?auto_78787 ) ) ( not ( = ?auto_78786 ?auto_78787 ) ) ( not ( = ?auto_78785 ?auto_78787 ) ) ( not ( = ?auto_78788 ?auto_78787 ) ) ( not ( = ?auto_78789 ?auto_78794 ) ) ( not ( = ?auto_78789 ?auto_78790 ) ) ( not ( = ?auto_78789 ?auto_78793 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_78784 ?auto_78786 ?auto_78785 ?auto_78787 ?auto_78788 ?auto_78783 )
      ( FLY-5PPL-VERIFY ?auto_78784 ?auto_78785 ?auto_78786 ?auto_78787 ?auto_78788 ?auto_78783 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_79167 - PERSON
      ?auto_79168 - PERSON
      ?auto_79169 - PERSON
      ?auto_79170 - PERSON
      ?auto_79171 - PERSON
      ?auto_79166 - CITY
    )
    :vars
    (
      ?auto_79174 - FLEVEL
      ?auto_79178 - FLEVEL
      ?auto_79172 - CITY
      ?auto_79177 - CITY
      ?auto_79173 - CITY
      ?auto_79176 - CITY
      ?auto_79175 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_79174 ?auto_79178 ) ( PERSON-AT ?auto_79169 ?auto_79172 ) ( not ( = ?auto_79166 ?auto_79172 ) ) ( not ( = ?auto_79174 ?auto_79178 ) ) ( PERSON-AT ?auto_79171 ?auto_79177 ) ( not ( = ?auto_79166 ?auto_79177 ) ) ( PERSON-AT ?auto_79168 ?auto_79173 ) ( not ( = ?auto_79166 ?auto_79173 ) ) ( PERSON-AT ?auto_79170 ?auto_79177 ) ( PERSON-AT ?auto_79167 ?auto_79176 ) ( AIRCRAFT-AT ?auto_79175 ?auto_79166 ) ( FUEL-LEVEL ?auto_79175 ?auto_79174 ) ( not ( = ?auto_79166 ?auto_79176 ) ) ( not ( = ?auto_79167 ?auto_79170 ) ) ( not ( = ?auto_79177 ?auto_79176 ) ) ( not ( = ?auto_79167 ?auto_79168 ) ) ( not ( = ?auto_79170 ?auto_79168 ) ) ( not ( = ?auto_79173 ?auto_79177 ) ) ( not ( = ?auto_79173 ?auto_79176 ) ) ( not ( = ?auto_79167 ?auto_79171 ) ) ( not ( = ?auto_79170 ?auto_79171 ) ) ( not ( = ?auto_79168 ?auto_79171 ) ) ( not ( = ?auto_79167 ?auto_79169 ) ) ( not ( = ?auto_79170 ?auto_79169 ) ) ( not ( = ?auto_79168 ?auto_79169 ) ) ( not ( = ?auto_79171 ?auto_79169 ) ) ( not ( = ?auto_79172 ?auto_79177 ) ) ( not ( = ?auto_79172 ?auto_79173 ) ) ( not ( = ?auto_79172 ?auto_79176 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_79167 ?auto_79170 ?auto_79168 ?auto_79169 ?auto_79171 ?auto_79166 )
      ( FLY-5PPL-VERIFY ?auto_79167 ?auto_79168 ?auto_79169 ?auto_79170 ?auto_79171 ?auto_79166 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_82306 - PERSON
      ?auto_82307 - PERSON
      ?auto_82308 - PERSON
      ?auto_82309 - PERSON
      ?auto_82310 - PERSON
      ?auto_82305 - CITY
    )
    :vars
    (
      ?auto_82313 - FLEVEL
      ?auto_82317 - FLEVEL
      ?auto_82311 - CITY
      ?auto_82316 - CITY
      ?auto_82312 - CITY
      ?auto_82315 - CITY
      ?auto_82314 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_82313 ?auto_82317 ) ( PERSON-AT ?auto_82310 ?auto_82311 ) ( not ( = ?auto_82305 ?auto_82311 ) ) ( not ( = ?auto_82313 ?auto_82317 ) ) ( PERSON-AT ?auto_82309 ?auto_82316 ) ( not ( = ?auto_82305 ?auto_82316 ) ) ( PERSON-AT ?auto_82308 ?auto_82312 ) ( not ( = ?auto_82305 ?auto_82312 ) ) ( PERSON-AT ?auto_82306 ?auto_82316 ) ( PERSON-AT ?auto_82307 ?auto_82315 ) ( AIRCRAFT-AT ?auto_82314 ?auto_82305 ) ( FUEL-LEVEL ?auto_82314 ?auto_82313 ) ( not ( = ?auto_82305 ?auto_82315 ) ) ( not ( = ?auto_82307 ?auto_82306 ) ) ( not ( = ?auto_82316 ?auto_82315 ) ) ( not ( = ?auto_82307 ?auto_82308 ) ) ( not ( = ?auto_82306 ?auto_82308 ) ) ( not ( = ?auto_82312 ?auto_82316 ) ) ( not ( = ?auto_82312 ?auto_82315 ) ) ( not ( = ?auto_82307 ?auto_82309 ) ) ( not ( = ?auto_82306 ?auto_82309 ) ) ( not ( = ?auto_82308 ?auto_82309 ) ) ( not ( = ?auto_82307 ?auto_82310 ) ) ( not ( = ?auto_82306 ?auto_82310 ) ) ( not ( = ?auto_82308 ?auto_82310 ) ) ( not ( = ?auto_82309 ?auto_82310 ) ) ( not ( = ?auto_82311 ?auto_82316 ) ) ( not ( = ?auto_82311 ?auto_82312 ) ) ( not ( = ?auto_82311 ?auto_82315 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_82307 ?auto_82306 ?auto_82308 ?auto_82310 ?auto_82309 ?auto_82305 )
      ( FLY-5PPL-VERIFY ?auto_82306 ?auto_82307 ?auto_82308 ?auto_82309 ?auto_82310 ?auto_82305 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_82361 - PERSON
      ?auto_82362 - PERSON
      ?auto_82363 - PERSON
      ?auto_82364 - PERSON
      ?auto_82365 - PERSON
      ?auto_82360 - CITY
    )
    :vars
    (
      ?auto_82368 - FLEVEL
      ?auto_82372 - FLEVEL
      ?auto_82366 - CITY
      ?auto_82371 - CITY
      ?auto_82367 - CITY
      ?auto_82370 - CITY
      ?auto_82369 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_82368 ?auto_82372 ) ( PERSON-AT ?auto_82364 ?auto_82366 ) ( not ( = ?auto_82360 ?auto_82366 ) ) ( not ( = ?auto_82368 ?auto_82372 ) ) ( PERSON-AT ?auto_82365 ?auto_82371 ) ( not ( = ?auto_82360 ?auto_82371 ) ) ( PERSON-AT ?auto_82363 ?auto_82367 ) ( not ( = ?auto_82360 ?auto_82367 ) ) ( PERSON-AT ?auto_82361 ?auto_82371 ) ( PERSON-AT ?auto_82362 ?auto_82370 ) ( AIRCRAFT-AT ?auto_82369 ?auto_82360 ) ( FUEL-LEVEL ?auto_82369 ?auto_82368 ) ( not ( = ?auto_82360 ?auto_82370 ) ) ( not ( = ?auto_82362 ?auto_82361 ) ) ( not ( = ?auto_82371 ?auto_82370 ) ) ( not ( = ?auto_82362 ?auto_82363 ) ) ( not ( = ?auto_82361 ?auto_82363 ) ) ( not ( = ?auto_82367 ?auto_82371 ) ) ( not ( = ?auto_82367 ?auto_82370 ) ) ( not ( = ?auto_82362 ?auto_82365 ) ) ( not ( = ?auto_82361 ?auto_82365 ) ) ( not ( = ?auto_82363 ?auto_82365 ) ) ( not ( = ?auto_82362 ?auto_82364 ) ) ( not ( = ?auto_82361 ?auto_82364 ) ) ( not ( = ?auto_82363 ?auto_82364 ) ) ( not ( = ?auto_82365 ?auto_82364 ) ) ( not ( = ?auto_82366 ?auto_82371 ) ) ( not ( = ?auto_82366 ?auto_82367 ) ) ( not ( = ?auto_82366 ?auto_82370 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_82362 ?auto_82361 ?auto_82363 ?auto_82364 ?auto_82365 ?auto_82360 )
      ( FLY-5PPL-VERIFY ?auto_82361 ?auto_82362 ?auto_82363 ?auto_82364 ?auto_82365 ?auto_82360 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_82416 - PERSON
      ?auto_82417 - PERSON
      ?auto_82418 - PERSON
      ?auto_82419 - PERSON
      ?auto_82420 - PERSON
      ?auto_82415 - CITY
    )
    :vars
    (
      ?auto_82423 - FLEVEL
      ?auto_82427 - FLEVEL
      ?auto_82421 - CITY
      ?auto_82426 - CITY
      ?auto_82422 - CITY
      ?auto_82425 - CITY
      ?auto_82424 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_82423 ?auto_82427 ) ( PERSON-AT ?auto_82420 ?auto_82421 ) ( not ( = ?auto_82415 ?auto_82421 ) ) ( not ( = ?auto_82423 ?auto_82427 ) ) ( PERSON-AT ?auto_82418 ?auto_82426 ) ( not ( = ?auto_82415 ?auto_82426 ) ) ( PERSON-AT ?auto_82419 ?auto_82422 ) ( not ( = ?auto_82415 ?auto_82422 ) ) ( PERSON-AT ?auto_82416 ?auto_82426 ) ( PERSON-AT ?auto_82417 ?auto_82425 ) ( AIRCRAFT-AT ?auto_82424 ?auto_82415 ) ( FUEL-LEVEL ?auto_82424 ?auto_82423 ) ( not ( = ?auto_82415 ?auto_82425 ) ) ( not ( = ?auto_82417 ?auto_82416 ) ) ( not ( = ?auto_82426 ?auto_82425 ) ) ( not ( = ?auto_82417 ?auto_82419 ) ) ( not ( = ?auto_82416 ?auto_82419 ) ) ( not ( = ?auto_82422 ?auto_82426 ) ) ( not ( = ?auto_82422 ?auto_82425 ) ) ( not ( = ?auto_82417 ?auto_82418 ) ) ( not ( = ?auto_82416 ?auto_82418 ) ) ( not ( = ?auto_82419 ?auto_82418 ) ) ( not ( = ?auto_82417 ?auto_82420 ) ) ( not ( = ?auto_82416 ?auto_82420 ) ) ( not ( = ?auto_82419 ?auto_82420 ) ) ( not ( = ?auto_82418 ?auto_82420 ) ) ( not ( = ?auto_82421 ?auto_82426 ) ) ( not ( = ?auto_82421 ?auto_82422 ) ) ( not ( = ?auto_82421 ?auto_82425 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_82417 ?auto_82416 ?auto_82419 ?auto_82420 ?auto_82418 ?auto_82415 )
      ( FLY-5PPL-VERIFY ?auto_82416 ?auto_82417 ?auto_82418 ?auto_82419 ?auto_82420 ?auto_82415 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_84605 - PERSON
      ?auto_84606 - PERSON
      ?auto_84607 - PERSON
      ?auto_84608 - PERSON
      ?auto_84609 - PERSON
      ?auto_84604 - CITY
    )
    :vars
    (
      ?auto_84612 - FLEVEL
      ?auto_84616 - FLEVEL
      ?auto_84610 - CITY
      ?auto_84615 - CITY
      ?auto_84611 - CITY
      ?auto_84614 - CITY
      ?auto_84613 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_84612 ?auto_84616 ) ( PERSON-AT ?auto_84609 ?auto_84610 ) ( not ( = ?auto_84604 ?auto_84610 ) ) ( not ( = ?auto_84612 ?auto_84616 ) ) ( PERSON-AT ?auto_84606 ?auto_84615 ) ( not ( = ?auto_84604 ?auto_84615 ) ) ( PERSON-AT ?auto_84608 ?auto_84611 ) ( not ( = ?auto_84604 ?auto_84611 ) ) ( PERSON-AT ?auto_84605 ?auto_84615 ) ( PERSON-AT ?auto_84607 ?auto_84614 ) ( AIRCRAFT-AT ?auto_84613 ?auto_84604 ) ( FUEL-LEVEL ?auto_84613 ?auto_84612 ) ( not ( = ?auto_84604 ?auto_84614 ) ) ( not ( = ?auto_84607 ?auto_84605 ) ) ( not ( = ?auto_84615 ?auto_84614 ) ) ( not ( = ?auto_84607 ?auto_84608 ) ) ( not ( = ?auto_84605 ?auto_84608 ) ) ( not ( = ?auto_84611 ?auto_84615 ) ) ( not ( = ?auto_84611 ?auto_84614 ) ) ( not ( = ?auto_84607 ?auto_84606 ) ) ( not ( = ?auto_84605 ?auto_84606 ) ) ( not ( = ?auto_84608 ?auto_84606 ) ) ( not ( = ?auto_84607 ?auto_84609 ) ) ( not ( = ?auto_84605 ?auto_84609 ) ) ( not ( = ?auto_84608 ?auto_84609 ) ) ( not ( = ?auto_84606 ?auto_84609 ) ) ( not ( = ?auto_84610 ?auto_84615 ) ) ( not ( = ?auto_84610 ?auto_84611 ) ) ( not ( = ?auto_84610 ?auto_84614 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_84607 ?auto_84605 ?auto_84608 ?auto_84609 ?auto_84606 ?auto_84604 )
      ( FLY-5PPL-VERIFY ?auto_84605 ?auto_84606 ?auto_84607 ?auto_84608 ?auto_84609 ?auto_84604 ) )
  )

)

