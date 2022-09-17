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
      ?auto_195393 - PERSON
      ?auto_195392 - CITY
    )
    :vars
    (
      ?auto_195396 - FLEVEL
      ?auto_195395 - FLEVEL
      ?auto_195397 - CITY
      ?auto_195394 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_195396 ?auto_195395 ) ( PERSON-AT ?auto_195393 ?auto_195397 ) ( AIRCRAFT-AT ?auto_195394 ?auto_195392 ) ( FUEL-LEVEL ?auto_195394 ?auto_195396 ) ( not ( = ?auto_195392 ?auto_195397 ) ) ( not ( = ?auto_195396 ?auto_195395 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_195394 ?auto_195392 ?auto_195396 ?auto_195395 )
      ( !FLY ?auto_195394 ?auto_195392 ?auto_195397 ?auto_195395 ?auto_195396 )
      ( !REFUEL ?auto_195394 ?auto_195397 ?auto_195396 ?auto_195395 )
      ( !BOARD ?auto_195393 ?auto_195394 ?auto_195397 )
      ( !FLY ?auto_195394 ?auto_195397 ?auto_195392 ?auto_195395 ?auto_195396 )
      ( !DEBARK ?auto_195393 ?auto_195394 ?auto_195392 )
      ( FLY-1PPL-VERIFY ?auto_195393 ?auto_195392 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_195416 - PERSON
      ?auto_195417 - PERSON
      ?auto_195415 - CITY
    )
    :vars
    (
      ?auto_195419 - FLEVEL
      ?auto_195418 - FLEVEL
      ?auto_195420 - CITY
      ?auto_195421 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_195419 ?auto_195418 ) ( PERSON-AT ?auto_195417 ?auto_195420 ) ( not ( = ?auto_195415 ?auto_195420 ) ) ( not ( = ?auto_195419 ?auto_195418 ) ) ( PERSON-AT ?auto_195416 ?auto_195420 ) ( AIRCRAFT-AT ?auto_195421 ?auto_195415 ) ( FUEL-LEVEL ?auto_195421 ?auto_195419 ) ( not ( = ?auto_195416 ?auto_195417 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_195416 ?auto_195415 )
      ( FLY-1PPL ?auto_195417 ?auto_195415 )
      ( FLY-2PPL-VERIFY ?auto_195416 ?auto_195417 ?auto_195415 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_195528 - PERSON
      ?auto_195529 - PERSON
      ?auto_195530 - PERSON
      ?auto_195527 - CITY
    )
    :vars
    (
      ?auto_195532 - FLEVEL
      ?auto_195534 - FLEVEL
      ?auto_195533 - CITY
      ?auto_195535 - CITY
      ?auto_195531 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_195532 ?auto_195534 ) ( PERSON-AT ?auto_195530 ?auto_195533 ) ( not ( = ?auto_195527 ?auto_195533 ) ) ( not ( = ?auto_195532 ?auto_195534 ) ) ( PERSON-AT ?auto_195529 ?auto_195535 ) ( not ( = ?auto_195527 ?auto_195535 ) ) ( PERSON-AT ?auto_195528 ?auto_195535 ) ( AIRCRAFT-AT ?auto_195531 ?auto_195527 ) ( FUEL-LEVEL ?auto_195531 ?auto_195532 ) ( not ( = ?auto_195528 ?auto_195529 ) ) ( not ( = ?auto_195528 ?auto_195530 ) ) ( not ( = ?auto_195529 ?auto_195530 ) ) ( not ( = ?auto_195533 ?auto_195535 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_195528 ?auto_195529 ?auto_195527 )
      ( FLY-1PPL ?auto_195530 ?auto_195527 )
      ( FLY-3PPL-VERIFY ?auto_195528 ?auto_195529 ?auto_195530 ?auto_195527 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_195547 - PERSON
      ?auto_195548 - PERSON
      ?auto_195549 - PERSON
      ?auto_195546 - CITY
    )
    :vars
    (
      ?auto_195552 - FLEVEL
      ?auto_195551 - FLEVEL
      ?auto_195554 - CITY
      ?auto_195550 - CITY
      ?auto_195553 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_195552 ?auto_195551 ) ( PERSON-AT ?auto_195548 ?auto_195554 ) ( not ( = ?auto_195546 ?auto_195554 ) ) ( not ( = ?auto_195552 ?auto_195551 ) ) ( PERSON-AT ?auto_195549 ?auto_195550 ) ( not ( = ?auto_195546 ?auto_195550 ) ) ( PERSON-AT ?auto_195547 ?auto_195550 ) ( AIRCRAFT-AT ?auto_195553 ?auto_195546 ) ( FUEL-LEVEL ?auto_195553 ?auto_195552 ) ( not ( = ?auto_195547 ?auto_195549 ) ) ( not ( = ?auto_195547 ?auto_195548 ) ) ( not ( = ?auto_195549 ?auto_195548 ) ) ( not ( = ?auto_195554 ?auto_195550 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_195547 ?auto_195549 ?auto_195548 ?auto_195546 )
      ( FLY-3PPL-VERIFY ?auto_195547 ?auto_195548 ?auto_195549 ?auto_195546 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_195614 - PERSON
      ?auto_195615 - PERSON
      ?auto_195616 - PERSON
      ?auto_195613 - CITY
    )
    :vars
    (
      ?auto_195619 - FLEVEL
      ?auto_195617 - FLEVEL
      ?auto_195618 - CITY
      ?auto_195620 - CITY
      ?auto_195621 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_195619 ?auto_195617 ) ( PERSON-AT ?auto_195614 ?auto_195618 ) ( not ( = ?auto_195613 ?auto_195618 ) ) ( not ( = ?auto_195619 ?auto_195617 ) ) ( PERSON-AT ?auto_195616 ?auto_195620 ) ( not ( = ?auto_195613 ?auto_195620 ) ) ( PERSON-AT ?auto_195615 ?auto_195620 ) ( AIRCRAFT-AT ?auto_195621 ?auto_195613 ) ( FUEL-LEVEL ?auto_195621 ?auto_195619 ) ( not ( = ?auto_195615 ?auto_195616 ) ) ( not ( = ?auto_195615 ?auto_195614 ) ) ( not ( = ?auto_195616 ?auto_195614 ) ) ( not ( = ?auto_195618 ?auto_195620 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_195615 ?auto_195614 ?auto_195616 ?auto_195613 )
      ( FLY-3PPL-VERIFY ?auto_195614 ?auto_195615 ?auto_195616 ?auto_195613 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_196673 - PERSON
      ?auto_196674 - PERSON
      ?auto_196675 - PERSON
      ?auto_196676 - PERSON
      ?auto_196672 - CITY
    )
    :vars
    (
      ?auto_196677 - FLEVEL
      ?auto_196679 - FLEVEL
      ?auto_196680 - CITY
      ?auto_196681 - CITY
      ?auto_196678 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_196677 ?auto_196679 ) ( PERSON-AT ?auto_196676 ?auto_196680 ) ( not ( = ?auto_196672 ?auto_196680 ) ) ( not ( = ?auto_196677 ?auto_196679 ) ) ( PERSON-AT ?auto_196675 ?auto_196681 ) ( not ( = ?auto_196672 ?auto_196681 ) ) ( PERSON-AT ?auto_196674 ?auto_196680 ) ( PERSON-AT ?auto_196673 ?auto_196680 ) ( AIRCRAFT-AT ?auto_196678 ?auto_196672 ) ( FUEL-LEVEL ?auto_196678 ?auto_196677 ) ( not ( = ?auto_196673 ?auto_196674 ) ) ( not ( = ?auto_196673 ?auto_196675 ) ) ( not ( = ?auto_196674 ?auto_196675 ) ) ( not ( = ?auto_196681 ?auto_196680 ) ) ( not ( = ?auto_196673 ?auto_196676 ) ) ( not ( = ?auto_196674 ?auto_196676 ) ) ( not ( = ?auto_196675 ?auto_196676 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_196673 ?auto_196675 ?auto_196674 ?auto_196672 )
      ( FLY-1PPL ?auto_196676 ?auto_196672 )
      ( FLY-4PPL-VERIFY ?auto_196673 ?auto_196674 ?auto_196675 ?auto_196676 ?auto_196672 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_196705 - PERSON
      ?auto_196706 - PERSON
      ?auto_196707 - PERSON
      ?auto_196708 - PERSON
      ?auto_196704 - CITY
    )
    :vars
    (
      ?auto_196711 - FLEVEL
      ?auto_196712 - FLEVEL
      ?auto_196710 - CITY
      ?auto_196713 - CITY
      ?auto_196709 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_196711 ?auto_196712 ) ( PERSON-AT ?auto_196707 ?auto_196710 ) ( not ( = ?auto_196704 ?auto_196710 ) ) ( not ( = ?auto_196711 ?auto_196712 ) ) ( PERSON-AT ?auto_196708 ?auto_196713 ) ( not ( = ?auto_196704 ?auto_196713 ) ) ( PERSON-AT ?auto_196706 ?auto_196710 ) ( PERSON-AT ?auto_196705 ?auto_196710 ) ( AIRCRAFT-AT ?auto_196709 ?auto_196704 ) ( FUEL-LEVEL ?auto_196709 ?auto_196711 ) ( not ( = ?auto_196705 ?auto_196706 ) ) ( not ( = ?auto_196705 ?auto_196708 ) ) ( not ( = ?auto_196706 ?auto_196708 ) ) ( not ( = ?auto_196713 ?auto_196710 ) ) ( not ( = ?auto_196705 ?auto_196707 ) ) ( not ( = ?auto_196706 ?auto_196707 ) ) ( not ( = ?auto_196708 ?auto_196707 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_196705 ?auto_196706 ?auto_196708 ?auto_196707 ?auto_196704 )
      ( FLY-4PPL-VERIFY ?auto_196705 ?auto_196706 ?auto_196707 ?auto_196708 ?auto_196704 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_196737 - PERSON
      ?auto_196738 - PERSON
      ?auto_196739 - PERSON
      ?auto_196740 - PERSON
      ?auto_196736 - CITY
    )
    :vars
    (
      ?auto_196741 - FLEVEL
      ?auto_196742 - FLEVEL
      ?auto_196744 - CITY
      ?auto_196745 - CITY
      ?auto_196743 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_196741 ?auto_196742 ) ( PERSON-AT ?auto_196740 ?auto_196744 ) ( not ( = ?auto_196736 ?auto_196744 ) ) ( not ( = ?auto_196741 ?auto_196742 ) ) ( PERSON-AT ?auto_196738 ?auto_196745 ) ( not ( = ?auto_196736 ?auto_196745 ) ) ( PERSON-AT ?auto_196739 ?auto_196744 ) ( PERSON-AT ?auto_196737 ?auto_196744 ) ( AIRCRAFT-AT ?auto_196743 ?auto_196736 ) ( FUEL-LEVEL ?auto_196743 ?auto_196741 ) ( not ( = ?auto_196737 ?auto_196739 ) ) ( not ( = ?auto_196737 ?auto_196738 ) ) ( not ( = ?auto_196739 ?auto_196738 ) ) ( not ( = ?auto_196745 ?auto_196744 ) ) ( not ( = ?auto_196737 ?auto_196740 ) ) ( not ( = ?auto_196739 ?auto_196740 ) ) ( not ( = ?auto_196738 ?auto_196740 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_196737 ?auto_196739 ?auto_196740 ?auto_196738 ?auto_196736 )
      ( FLY-4PPL-VERIFY ?auto_196737 ?auto_196738 ?auto_196739 ?auto_196740 ?auto_196736 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_197353 - PERSON
      ?auto_197354 - PERSON
      ?auto_197355 - PERSON
      ?auto_197356 - PERSON
      ?auto_197352 - CITY
    )
    :vars
    (
      ?auto_197357 - FLEVEL
      ?auto_197358 - FLEVEL
      ?auto_197360 - CITY
      ?auto_197361 - CITY
      ?auto_197359 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_197357 ?auto_197358 ) ( PERSON-AT ?auto_197356 ?auto_197360 ) ( not ( = ?auto_197352 ?auto_197360 ) ) ( not ( = ?auto_197357 ?auto_197358 ) ) ( PERSON-AT ?auto_197353 ?auto_197361 ) ( not ( = ?auto_197352 ?auto_197361 ) ) ( PERSON-AT ?auto_197355 ?auto_197360 ) ( PERSON-AT ?auto_197354 ?auto_197360 ) ( AIRCRAFT-AT ?auto_197359 ?auto_197352 ) ( FUEL-LEVEL ?auto_197359 ?auto_197357 ) ( not ( = ?auto_197354 ?auto_197355 ) ) ( not ( = ?auto_197354 ?auto_197353 ) ) ( not ( = ?auto_197355 ?auto_197353 ) ) ( not ( = ?auto_197361 ?auto_197360 ) ) ( not ( = ?auto_197354 ?auto_197356 ) ) ( not ( = ?auto_197355 ?auto_197356 ) ) ( not ( = ?auto_197353 ?auto_197356 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_197354 ?auto_197355 ?auto_197356 ?auto_197353 ?auto_197352 )
      ( FLY-4PPL-VERIFY ?auto_197353 ?auto_197354 ?auto_197355 ?auto_197356 ?auto_197352 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_212156 - PERSON
      ?auto_212157 - PERSON
      ?auto_212158 - PERSON
      ?auto_212159 - PERSON
      ?auto_212160 - PERSON
      ?auto_212155 - CITY
    )
    :vars
    (
      ?auto_212164 - FLEVEL
      ?auto_212162 - FLEVEL
      ?auto_212161 - CITY
      ?auto_212165 - CITY
      ?auto_212166 - CITY
      ?auto_212163 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_212164 ?auto_212162 ) ( PERSON-AT ?auto_212160 ?auto_212161 ) ( not ( = ?auto_212155 ?auto_212161 ) ) ( not ( = ?auto_212164 ?auto_212162 ) ) ( PERSON-AT ?auto_212159 ?auto_212165 ) ( not ( = ?auto_212155 ?auto_212165 ) ) ( PERSON-AT ?auto_212158 ?auto_212166 ) ( not ( = ?auto_212155 ?auto_212166 ) ) ( PERSON-AT ?auto_212157 ?auto_212165 ) ( PERSON-AT ?auto_212156 ?auto_212165 ) ( AIRCRAFT-AT ?auto_212163 ?auto_212155 ) ( FUEL-LEVEL ?auto_212163 ?auto_212164 ) ( not ( = ?auto_212156 ?auto_212157 ) ) ( not ( = ?auto_212156 ?auto_212158 ) ) ( not ( = ?auto_212157 ?auto_212158 ) ) ( not ( = ?auto_212166 ?auto_212165 ) ) ( not ( = ?auto_212156 ?auto_212159 ) ) ( not ( = ?auto_212157 ?auto_212159 ) ) ( not ( = ?auto_212158 ?auto_212159 ) ) ( not ( = ?auto_212156 ?auto_212160 ) ) ( not ( = ?auto_212157 ?auto_212160 ) ) ( not ( = ?auto_212158 ?auto_212160 ) ) ( not ( = ?auto_212159 ?auto_212160 ) ) ( not ( = ?auto_212161 ?auto_212165 ) ) ( not ( = ?auto_212161 ?auto_212166 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_212156 ?auto_212157 ?auto_212159 ?auto_212158 ?auto_212155 )
      ( FLY-1PPL ?auto_212160 ?auto_212155 )
      ( FLY-5PPL-VERIFY ?auto_212156 ?auto_212157 ?auto_212158 ?auto_212159 ?auto_212160 ?auto_212155 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_212207 - PERSON
      ?auto_212208 - PERSON
      ?auto_212209 - PERSON
      ?auto_212210 - PERSON
      ?auto_212211 - PERSON
      ?auto_212206 - CITY
    )
    :vars
    (
      ?auto_212213 - FLEVEL
      ?auto_212214 - FLEVEL
      ?auto_212212 - CITY
      ?auto_212216 - CITY
      ?auto_212217 - CITY
      ?auto_212215 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_212213 ?auto_212214 ) ( PERSON-AT ?auto_212210 ?auto_212212 ) ( not ( = ?auto_212206 ?auto_212212 ) ) ( not ( = ?auto_212213 ?auto_212214 ) ) ( PERSON-AT ?auto_212211 ?auto_212216 ) ( not ( = ?auto_212206 ?auto_212216 ) ) ( PERSON-AT ?auto_212209 ?auto_212217 ) ( not ( = ?auto_212206 ?auto_212217 ) ) ( PERSON-AT ?auto_212208 ?auto_212216 ) ( PERSON-AT ?auto_212207 ?auto_212216 ) ( AIRCRAFT-AT ?auto_212215 ?auto_212206 ) ( FUEL-LEVEL ?auto_212215 ?auto_212213 ) ( not ( = ?auto_212207 ?auto_212208 ) ) ( not ( = ?auto_212207 ?auto_212209 ) ) ( not ( = ?auto_212208 ?auto_212209 ) ) ( not ( = ?auto_212217 ?auto_212216 ) ) ( not ( = ?auto_212207 ?auto_212211 ) ) ( not ( = ?auto_212208 ?auto_212211 ) ) ( not ( = ?auto_212209 ?auto_212211 ) ) ( not ( = ?auto_212207 ?auto_212210 ) ) ( not ( = ?auto_212208 ?auto_212210 ) ) ( not ( = ?auto_212209 ?auto_212210 ) ) ( not ( = ?auto_212211 ?auto_212210 ) ) ( not ( = ?auto_212212 ?auto_212216 ) ) ( not ( = ?auto_212212 ?auto_212217 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_212207 ?auto_212208 ?auto_212209 ?auto_212211 ?auto_212210 ?auto_212206 )
      ( FLY-5PPL-VERIFY ?auto_212207 ?auto_212208 ?auto_212209 ?auto_212210 ?auto_212211 ?auto_212206 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_212258 - PERSON
      ?auto_212259 - PERSON
      ?auto_212260 - PERSON
      ?auto_212261 - PERSON
      ?auto_212262 - PERSON
      ?auto_212257 - CITY
    )
    :vars
    (
      ?auto_212265 - FLEVEL
      ?auto_212264 - FLEVEL
      ?auto_212268 - CITY
      ?auto_212267 - CITY
      ?auto_212263 - CITY
      ?auto_212266 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_212265 ?auto_212264 ) ( PERSON-AT ?auto_212262 ?auto_212268 ) ( not ( = ?auto_212257 ?auto_212268 ) ) ( not ( = ?auto_212265 ?auto_212264 ) ) ( PERSON-AT ?auto_212260 ?auto_212267 ) ( not ( = ?auto_212257 ?auto_212267 ) ) ( PERSON-AT ?auto_212261 ?auto_212263 ) ( not ( = ?auto_212257 ?auto_212263 ) ) ( PERSON-AT ?auto_212259 ?auto_212267 ) ( PERSON-AT ?auto_212258 ?auto_212267 ) ( AIRCRAFT-AT ?auto_212266 ?auto_212257 ) ( FUEL-LEVEL ?auto_212266 ?auto_212265 ) ( not ( = ?auto_212258 ?auto_212259 ) ) ( not ( = ?auto_212258 ?auto_212261 ) ) ( not ( = ?auto_212259 ?auto_212261 ) ) ( not ( = ?auto_212263 ?auto_212267 ) ) ( not ( = ?auto_212258 ?auto_212260 ) ) ( not ( = ?auto_212259 ?auto_212260 ) ) ( not ( = ?auto_212261 ?auto_212260 ) ) ( not ( = ?auto_212258 ?auto_212262 ) ) ( not ( = ?auto_212259 ?auto_212262 ) ) ( not ( = ?auto_212261 ?auto_212262 ) ) ( not ( = ?auto_212260 ?auto_212262 ) ) ( not ( = ?auto_212268 ?auto_212267 ) ) ( not ( = ?auto_212268 ?auto_212263 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_212258 ?auto_212259 ?auto_212261 ?auto_212262 ?auto_212260 ?auto_212257 )
      ( FLY-5PPL-VERIFY ?auto_212258 ?auto_212259 ?auto_212260 ?auto_212261 ?auto_212262 ?auto_212257 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_212822 - PERSON
      ?auto_212823 - PERSON
      ?auto_212824 - PERSON
      ?auto_212825 - PERSON
      ?auto_212826 - PERSON
      ?auto_212821 - CITY
    )
    :vars
    (
      ?auto_212829 - FLEVEL
      ?auto_212828 - FLEVEL
      ?auto_212832 - CITY
      ?auto_212831 - CITY
      ?auto_212827 - CITY
      ?auto_212830 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_212829 ?auto_212828 ) ( PERSON-AT ?auto_212826 ?auto_212832 ) ( not ( = ?auto_212821 ?auto_212832 ) ) ( not ( = ?auto_212829 ?auto_212828 ) ) ( PERSON-AT ?auto_212825 ?auto_212831 ) ( not ( = ?auto_212821 ?auto_212831 ) ) ( PERSON-AT ?auto_212823 ?auto_212827 ) ( not ( = ?auto_212821 ?auto_212827 ) ) ( PERSON-AT ?auto_212824 ?auto_212831 ) ( PERSON-AT ?auto_212822 ?auto_212831 ) ( AIRCRAFT-AT ?auto_212830 ?auto_212821 ) ( FUEL-LEVEL ?auto_212830 ?auto_212829 ) ( not ( = ?auto_212822 ?auto_212824 ) ) ( not ( = ?auto_212822 ?auto_212823 ) ) ( not ( = ?auto_212824 ?auto_212823 ) ) ( not ( = ?auto_212827 ?auto_212831 ) ) ( not ( = ?auto_212822 ?auto_212825 ) ) ( not ( = ?auto_212824 ?auto_212825 ) ) ( not ( = ?auto_212823 ?auto_212825 ) ) ( not ( = ?auto_212822 ?auto_212826 ) ) ( not ( = ?auto_212824 ?auto_212826 ) ) ( not ( = ?auto_212823 ?auto_212826 ) ) ( not ( = ?auto_212825 ?auto_212826 ) ) ( not ( = ?auto_212832 ?auto_212831 ) ) ( not ( = ?auto_212832 ?auto_212827 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_212822 ?auto_212824 ?auto_212823 ?auto_212826 ?auto_212825 ?auto_212821 )
      ( FLY-5PPL-VERIFY ?auto_212822 ?auto_212823 ?auto_212824 ?auto_212825 ?auto_212826 ?auto_212821 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_212873 - PERSON
      ?auto_212874 - PERSON
      ?auto_212875 - PERSON
      ?auto_212876 - PERSON
      ?auto_212877 - PERSON
      ?auto_212872 - CITY
    )
    :vars
    (
      ?auto_212880 - FLEVEL
      ?auto_212879 - FLEVEL
      ?auto_212883 - CITY
      ?auto_212882 - CITY
      ?auto_212878 - CITY
      ?auto_212881 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_212880 ?auto_212879 ) ( PERSON-AT ?auto_212876 ?auto_212883 ) ( not ( = ?auto_212872 ?auto_212883 ) ) ( not ( = ?auto_212880 ?auto_212879 ) ) ( PERSON-AT ?auto_212877 ?auto_212882 ) ( not ( = ?auto_212872 ?auto_212882 ) ) ( PERSON-AT ?auto_212874 ?auto_212878 ) ( not ( = ?auto_212872 ?auto_212878 ) ) ( PERSON-AT ?auto_212875 ?auto_212882 ) ( PERSON-AT ?auto_212873 ?auto_212882 ) ( AIRCRAFT-AT ?auto_212881 ?auto_212872 ) ( FUEL-LEVEL ?auto_212881 ?auto_212880 ) ( not ( = ?auto_212873 ?auto_212875 ) ) ( not ( = ?auto_212873 ?auto_212874 ) ) ( not ( = ?auto_212875 ?auto_212874 ) ) ( not ( = ?auto_212878 ?auto_212882 ) ) ( not ( = ?auto_212873 ?auto_212877 ) ) ( not ( = ?auto_212875 ?auto_212877 ) ) ( not ( = ?auto_212874 ?auto_212877 ) ) ( not ( = ?auto_212873 ?auto_212876 ) ) ( not ( = ?auto_212875 ?auto_212876 ) ) ( not ( = ?auto_212874 ?auto_212876 ) ) ( not ( = ?auto_212877 ?auto_212876 ) ) ( not ( = ?auto_212883 ?auto_212882 ) ) ( not ( = ?auto_212883 ?auto_212878 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_212873 ?auto_212875 ?auto_212874 ?auto_212876 ?auto_212877 ?auto_212872 )
      ( FLY-5PPL-VERIFY ?auto_212873 ?auto_212874 ?auto_212875 ?auto_212876 ?auto_212877 ?auto_212872 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_213230 - PERSON
      ?auto_213231 - PERSON
      ?auto_213232 - PERSON
      ?auto_213233 - PERSON
      ?auto_213234 - PERSON
      ?auto_213229 - CITY
    )
    :vars
    (
      ?auto_213237 - FLEVEL
      ?auto_213236 - FLEVEL
      ?auto_213240 - CITY
      ?auto_213239 - CITY
      ?auto_213235 - CITY
      ?auto_213238 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_213237 ?auto_213236 ) ( PERSON-AT ?auto_213232 ?auto_213240 ) ( not ( = ?auto_213229 ?auto_213240 ) ) ( not ( = ?auto_213237 ?auto_213236 ) ) ( PERSON-AT ?auto_213234 ?auto_213239 ) ( not ( = ?auto_213229 ?auto_213239 ) ) ( PERSON-AT ?auto_213231 ?auto_213235 ) ( not ( = ?auto_213229 ?auto_213235 ) ) ( PERSON-AT ?auto_213233 ?auto_213239 ) ( PERSON-AT ?auto_213230 ?auto_213239 ) ( AIRCRAFT-AT ?auto_213238 ?auto_213229 ) ( FUEL-LEVEL ?auto_213238 ?auto_213237 ) ( not ( = ?auto_213230 ?auto_213233 ) ) ( not ( = ?auto_213230 ?auto_213231 ) ) ( not ( = ?auto_213233 ?auto_213231 ) ) ( not ( = ?auto_213235 ?auto_213239 ) ) ( not ( = ?auto_213230 ?auto_213234 ) ) ( not ( = ?auto_213233 ?auto_213234 ) ) ( not ( = ?auto_213231 ?auto_213234 ) ) ( not ( = ?auto_213230 ?auto_213232 ) ) ( not ( = ?auto_213233 ?auto_213232 ) ) ( not ( = ?auto_213231 ?auto_213232 ) ) ( not ( = ?auto_213234 ?auto_213232 ) ) ( not ( = ?auto_213240 ?auto_213239 ) ) ( not ( = ?auto_213240 ?auto_213235 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_213230 ?auto_213233 ?auto_213231 ?auto_213232 ?auto_213234 ?auto_213229 )
      ( FLY-5PPL-VERIFY ?auto_213230 ?auto_213231 ?auto_213232 ?auto_213233 ?auto_213234 ?auto_213229 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_220845 - PERSON
      ?auto_220846 - PERSON
      ?auto_220847 - PERSON
      ?auto_220848 - PERSON
      ?auto_220849 - PERSON
      ?auto_220844 - CITY
    )
    :vars
    (
      ?auto_220852 - FLEVEL
      ?auto_220851 - FLEVEL
      ?auto_220855 - CITY
      ?auto_220854 - CITY
      ?auto_220850 - CITY
      ?auto_220853 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_220852 ?auto_220851 ) ( PERSON-AT ?auto_220849 ?auto_220855 ) ( not ( = ?auto_220844 ?auto_220855 ) ) ( not ( = ?auto_220852 ?auto_220851 ) ) ( PERSON-AT ?auto_220848 ?auto_220854 ) ( not ( = ?auto_220844 ?auto_220854 ) ) ( PERSON-AT ?auto_220845 ?auto_220850 ) ( not ( = ?auto_220844 ?auto_220850 ) ) ( PERSON-AT ?auto_220847 ?auto_220854 ) ( PERSON-AT ?auto_220846 ?auto_220854 ) ( AIRCRAFT-AT ?auto_220853 ?auto_220844 ) ( FUEL-LEVEL ?auto_220853 ?auto_220852 ) ( not ( = ?auto_220846 ?auto_220847 ) ) ( not ( = ?auto_220846 ?auto_220845 ) ) ( not ( = ?auto_220847 ?auto_220845 ) ) ( not ( = ?auto_220850 ?auto_220854 ) ) ( not ( = ?auto_220846 ?auto_220848 ) ) ( not ( = ?auto_220847 ?auto_220848 ) ) ( not ( = ?auto_220845 ?auto_220848 ) ) ( not ( = ?auto_220846 ?auto_220849 ) ) ( not ( = ?auto_220847 ?auto_220849 ) ) ( not ( = ?auto_220845 ?auto_220849 ) ) ( not ( = ?auto_220848 ?auto_220849 ) ) ( not ( = ?auto_220855 ?auto_220854 ) ) ( not ( = ?auto_220855 ?auto_220850 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_220846 ?auto_220847 ?auto_220845 ?auto_220849 ?auto_220848 ?auto_220844 )
      ( FLY-5PPL-VERIFY ?auto_220845 ?auto_220846 ?auto_220847 ?auto_220848 ?auto_220849 ?auto_220844 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_220896 - PERSON
      ?auto_220897 - PERSON
      ?auto_220898 - PERSON
      ?auto_220899 - PERSON
      ?auto_220900 - PERSON
      ?auto_220895 - CITY
    )
    :vars
    (
      ?auto_220903 - FLEVEL
      ?auto_220902 - FLEVEL
      ?auto_220906 - CITY
      ?auto_220905 - CITY
      ?auto_220901 - CITY
      ?auto_220904 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_220903 ?auto_220902 ) ( PERSON-AT ?auto_220899 ?auto_220906 ) ( not ( = ?auto_220895 ?auto_220906 ) ) ( not ( = ?auto_220903 ?auto_220902 ) ) ( PERSON-AT ?auto_220900 ?auto_220905 ) ( not ( = ?auto_220895 ?auto_220905 ) ) ( PERSON-AT ?auto_220896 ?auto_220901 ) ( not ( = ?auto_220895 ?auto_220901 ) ) ( PERSON-AT ?auto_220898 ?auto_220905 ) ( PERSON-AT ?auto_220897 ?auto_220905 ) ( AIRCRAFT-AT ?auto_220904 ?auto_220895 ) ( FUEL-LEVEL ?auto_220904 ?auto_220903 ) ( not ( = ?auto_220897 ?auto_220898 ) ) ( not ( = ?auto_220897 ?auto_220896 ) ) ( not ( = ?auto_220898 ?auto_220896 ) ) ( not ( = ?auto_220901 ?auto_220905 ) ) ( not ( = ?auto_220897 ?auto_220900 ) ) ( not ( = ?auto_220898 ?auto_220900 ) ) ( not ( = ?auto_220896 ?auto_220900 ) ) ( not ( = ?auto_220897 ?auto_220899 ) ) ( not ( = ?auto_220898 ?auto_220899 ) ) ( not ( = ?auto_220896 ?auto_220899 ) ) ( not ( = ?auto_220900 ?auto_220899 ) ) ( not ( = ?auto_220906 ?auto_220905 ) ) ( not ( = ?auto_220906 ?auto_220901 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_220897 ?auto_220898 ?auto_220896 ?auto_220899 ?auto_220900 ?auto_220895 )
      ( FLY-5PPL-VERIFY ?auto_220896 ?auto_220897 ?auto_220898 ?auto_220899 ?auto_220900 ?auto_220895 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_221253 - PERSON
      ?auto_221254 - PERSON
      ?auto_221255 - PERSON
      ?auto_221256 - PERSON
      ?auto_221257 - PERSON
      ?auto_221252 - CITY
    )
    :vars
    (
      ?auto_221260 - FLEVEL
      ?auto_221259 - FLEVEL
      ?auto_221263 - CITY
      ?auto_221262 - CITY
      ?auto_221258 - CITY
      ?auto_221261 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_221260 ?auto_221259 ) ( PERSON-AT ?auto_221255 ?auto_221263 ) ( not ( = ?auto_221252 ?auto_221263 ) ) ( not ( = ?auto_221260 ?auto_221259 ) ) ( PERSON-AT ?auto_221257 ?auto_221262 ) ( not ( = ?auto_221252 ?auto_221262 ) ) ( PERSON-AT ?auto_221253 ?auto_221258 ) ( not ( = ?auto_221252 ?auto_221258 ) ) ( PERSON-AT ?auto_221256 ?auto_221262 ) ( PERSON-AT ?auto_221254 ?auto_221262 ) ( AIRCRAFT-AT ?auto_221261 ?auto_221252 ) ( FUEL-LEVEL ?auto_221261 ?auto_221260 ) ( not ( = ?auto_221254 ?auto_221256 ) ) ( not ( = ?auto_221254 ?auto_221253 ) ) ( not ( = ?auto_221256 ?auto_221253 ) ) ( not ( = ?auto_221258 ?auto_221262 ) ) ( not ( = ?auto_221254 ?auto_221257 ) ) ( not ( = ?auto_221256 ?auto_221257 ) ) ( not ( = ?auto_221253 ?auto_221257 ) ) ( not ( = ?auto_221254 ?auto_221255 ) ) ( not ( = ?auto_221256 ?auto_221255 ) ) ( not ( = ?auto_221253 ?auto_221255 ) ) ( not ( = ?auto_221257 ?auto_221255 ) ) ( not ( = ?auto_221263 ?auto_221262 ) ) ( not ( = ?auto_221263 ?auto_221258 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_221254 ?auto_221256 ?auto_221253 ?auto_221255 ?auto_221257 ?auto_221252 )
      ( FLY-5PPL-VERIFY ?auto_221253 ?auto_221254 ?auto_221255 ?auto_221256 ?auto_221257 ?auto_221252 ) )
  )

  ( :method FLY-5PPL
    :parameters
    (
      ?auto_223962 - PERSON
      ?auto_223963 - PERSON
      ?auto_223964 - PERSON
      ?auto_223965 - PERSON
      ?auto_223966 - PERSON
      ?auto_223961 - CITY
    )
    :vars
    (
      ?auto_223969 - FLEVEL
      ?auto_223968 - FLEVEL
      ?auto_223972 - CITY
      ?auto_223971 - CITY
      ?auto_223967 - CITY
      ?auto_223970 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_223969 ?auto_223968 ) ( PERSON-AT ?auto_223963 ?auto_223972 ) ( not ( = ?auto_223961 ?auto_223972 ) ) ( not ( = ?auto_223969 ?auto_223968 ) ) ( PERSON-AT ?auto_223966 ?auto_223971 ) ( not ( = ?auto_223961 ?auto_223971 ) ) ( PERSON-AT ?auto_223962 ?auto_223967 ) ( not ( = ?auto_223961 ?auto_223967 ) ) ( PERSON-AT ?auto_223965 ?auto_223971 ) ( PERSON-AT ?auto_223964 ?auto_223971 ) ( AIRCRAFT-AT ?auto_223970 ?auto_223961 ) ( FUEL-LEVEL ?auto_223970 ?auto_223969 ) ( not ( = ?auto_223964 ?auto_223965 ) ) ( not ( = ?auto_223964 ?auto_223962 ) ) ( not ( = ?auto_223965 ?auto_223962 ) ) ( not ( = ?auto_223967 ?auto_223971 ) ) ( not ( = ?auto_223964 ?auto_223966 ) ) ( not ( = ?auto_223965 ?auto_223966 ) ) ( not ( = ?auto_223962 ?auto_223966 ) ) ( not ( = ?auto_223964 ?auto_223963 ) ) ( not ( = ?auto_223965 ?auto_223963 ) ) ( not ( = ?auto_223962 ?auto_223963 ) ) ( not ( = ?auto_223966 ?auto_223963 ) ) ( not ( = ?auto_223972 ?auto_223971 ) ) ( not ( = ?auto_223972 ?auto_223967 ) ) )
    :subtasks
    ( ( FLY-5PPL ?auto_223964 ?auto_223965 ?auto_223962 ?auto_223963 ?auto_223966 ?auto_223961 )
      ( FLY-5PPL-VERIFY ?auto_223962 ?auto_223963 ?auto_223964 ?auto_223965 ?auto_223966 ?auto_223961 ) )
  )

)

