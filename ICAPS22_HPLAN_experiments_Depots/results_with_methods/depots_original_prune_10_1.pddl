( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22305 - SURFACE
      ?auto_22306 - SURFACE
    )
    :vars
    (
      ?auto_22307 - HOIST
      ?auto_22308 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22307 ?auto_22308 ) ( SURFACE-AT ?auto_22306 ?auto_22308 ) ( CLEAR ?auto_22306 ) ( LIFTING ?auto_22307 ?auto_22305 ) ( IS-CRATE ?auto_22305 ) ( not ( = ?auto_22305 ?auto_22306 ) ) )
    :subtasks
    ( ( !DROP ?auto_22307 ?auto_22305 ?auto_22306 ?auto_22308 )
      ( MAKE-ON-VERIFY ?auto_22305 ?auto_22306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22309 - SURFACE
      ?auto_22310 - SURFACE
    )
    :vars
    (
      ?auto_22311 - HOIST
      ?auto_22312 - PLACE
      ?auto_22313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22311 ?auto_22312 ) ( SURFACE-AT ?auto_22310 ?auto_22312 ) ( CLEAR ?auto_22310 ) ( IS-CRATE ?auto_22309 ) ( not ( = ?auto_22309 ?auto_22310 ) ) ( TRUCK-AT ?auto_22313 ?auto_22312 ) ( AVAILABLE ?auto_22311 ) ( IN ?auto_22309 ?auto_22313 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22311 ?auto_22309 ?auto_22313 ?auto_22312 )
      ( MAKE-ON ?auto_22309 ?auto_22310 )
      ( MAKE-ON-VERIFY ?auto_22309 ?auto_22310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22314 - SURFACE
      ?auto_22315 - SURFACE
    )
    :vars
    (
      ?auto_22318 - HOIST
      ?auto_22316 - PLACE
      ?auto_22317 - TRUCK
      ?auto_22319 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22318 ?auto_22316 ) ( SURFACE-AT ?auto_22315 ?auto_22316 ) ( CLEAR ?auto_22315 ) ( IS-CRATE ?auto_22314 ) ( not ( = ?auto_22314 ?auto_22315 ) ) ( AVAILABLE ?auto_22318 ) ( IN ?auto_22314 ?auto_22317 ) ( TRUCK-AT ?auto_22317 ?auto_22319 ) ( not ( = ?auto_22319 ?auto_22316 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22317 ?auto_22319 ?auto_22316 )
      ( MAKE-ON ?auto_22314 ?auto_22315 )
      ( MAKE-ON-VERIFY ?auto_22314 ?auto_22315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22320 - SURFACE
      ?auto_22321 - SURFACE
    )
    :vars
    (
      ?auto_22322 - HOIST
      ?auto_22323 - PLACE
      ?auto_22325 - TRUCK
      ?auto_22324 - PLACE
      ?auto_22326 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22322 ?auto_22323 ) ( SURFACE-AT ?auto_22321 ?auto_22323 ) ( CLEAR ?auto_22321 ) ( IS-CRATE ?auto_22320 ) ( not ( = ?auto_22320 ?auto_22321 ) ) ( AVAILABLE ?auto_22322 ) ( TRUCK-AT ?auto_22325 ?auto_22324 ) ( not ( = ?auto_22324 ?auto_22323 ) ) ( HOIST-AT ?auto_22326 ?auto_22324 ) ( LIFTING ?auto_22326 ?auto_22320 ) ( not ( = ?auto_22322 ?auto_22326 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22326 ?auto_22320 ?auto_22325 ?auto_22324 )
      ( MAKE-ON ?auto_22320 ?auto_22321 )
      ( MAKE-ON-VERIFY ?auto_22320 ?auto_22321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22327 - SURFACE
      ?auto_22328 - SURFACE
    )
    :vars
    (
      ?auto_22333 - HOIST
      ?auto_22329 - PLACE
      ?auto_22332 - TRUCK
      ?auto_22331 - PLACE
      ?auto_22330 - HOIST
      ?auto_22334 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22333 ?auto_22329 ) ( SURFACE-AT ?auto_22328 ?auto_22329 ) ( CLEAR ?auto_22328 ) ( IS-CRATE ?auto_22327 ) ( not ( = ?auto_22327 ?auto_22328 ) ) ( AVAILABLE ?auto_22333 ) ( TRUCK-AT ?auto_22332 ?auto_22331 ) ( not ( = ?auto_22331 ?auto_22329 ) ) ( HOIST-AT ?auto_22330 ?auto_22331 ) ( not ( = ?auto_22333 ?auto_22330 ) ) ( AVAILABLE ?auto_22330 ) ( SURFACE-AT ?auto_22327 ?auto_22331 ) ( ON ?auto_22327 ?auto_22334 ) ( CLEAR ?auto_22327 ) ( not ( = ?auto_22327 ?auto_22334 ) ) ( not ( = ?auto_22328 ?auto_22334 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22330 ?auto_22327 ?auto_22334 ?auto_22331 )
      ( MAKE-ON ?auto_22327 ?auto_22328 )
      ( MAKE-ON-VERIFY ?auto_22327 ?auto_22328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22335 - SURFACE
      ?auto_22336 - SURFACE
    )
    :vars
    (
      ?auto_22338 - HOIST
      ?auto_22342 - PLACE
      ?auto_22340 - PLACE
      ?auto_22341 - HOIST
      ?auto_22337 - SURFACE
      ?auto_22339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22338 ?auto_22342 ) ( SURFACE-AT ?auto_22336 ?auto_22342 ) ( CLEAR ?auto_22336 ) ( IS-CRATE ?auto_22335 ) ( not ( = ?auto_22335 ?auto_22336 ) ) ( AVAILABLE ?auto_22338 ) ( not ( = ?auto_22340 ?auto_22342 ) ) ( HOIST-AT ?auto_22341 ?auto_22340 ) ( not ( = ?auto_22338 ?auto_22341 ) ) ( AVAILABLE ?auto_22341 ) ( SURFACE-AT ?auto_22335 ?auto_22340 ) ( ON ?auto_22335 ?auto_22337 ) ( CLEAR ?auto_22335 ) ( not ( = ?auto_22335 ?auto_22337 ) ) ( not ( = ?auto_22336 ?auto_22337 ) ) ( TRUCK-AT ?auto_22339 ?auto_22342 ) )
    :subtasks
    ( ( !DRIVE ?auto_22339 ?auto_22342 ?auto_22340 )
      ( MAKE-ON ?auto_22335 ?auto_22336 )
      ( MAKE-ON-VERIFY ?auto_22335 ?auto_22336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22383 - SURFACE
      ?auto_22384 - SURFACE
    )
    :vars
    (
      ?auto_22385 - HOIST
      ?auto_22387 - PLACE
      ?auto_22390 - PLACE
      ?auto_22386 - HOIST
      ?auto_22389 - SURFACE
      ?auto_22388 - TRUCK
      ?auto_22391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22385 ?auto_22387 ) ( IS-CRATE ?auto_22383 ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( not ( = ?auto_22390 ?auto_22387 ) ) ( HOIST-AT ?auto_22386 ?auto_22390 ) ( not ( = ?auto_22385 ?auto_22386 ) ) ( AVAILABLE ?auto_22386 ) ( SURFACE-AT ?auto_22383 ?auto_22390 ) ( ON ?auto_22383 ?auto_22389 ) ( CLEAR ?auto_22383 ) ( not ( = ?auto_22383 ?auto_22389 ) ) ( not ( = ?auto_22384 ?auto_22389 ) ) ( TRUCK-AT ?auto_22388 ?auto_22387 ) ( SURFACE-AT ?auto_22391 ?auto_22387 ) ( CLEAR ?auto_22391 ) ( LIFTING ?auto_22385 ?auto_22384 ) ( IS-CRATE ?auto_22384 ) ( not ( = ?auto_22383 ?auto_22391 ) ) ( not ( = ?auto_22384 ?auto_22391 ) ) ( not ( = ?auto_22389 ?auto_22391 ) ) )
    :subtasks
    ( ( !DROP ?auto_22385 ?auto_22384 ?auto_22391 ?auto_22387 )
      ( MAKE-ON ?auto_22383 ?auto_22384 )
      ( MAKE-ON-VERIFY ?auto_22383 ?auto_22384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22392 - SURFACE
      ?auto_22393 - SURFACE
    )
    :vars
    (
      ?auto_22397 - HOIST
      ?auto_22396 - PLACE
      ?auto_22400 - PLACE
      ?auto_22398 - HOIST
      ?auto_22399 - SURFACE
      ?auto_22394 - TRUCK
      ?auto_22395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22397 ?auto_22396 ) ( IS-CRATE ?auto_22392 ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22400 ?auto_22396 ) ) ( HOIST-AT ?auto_22398 ?auto_22400 ) ( not ( = ?auto_22397 ?auto_22398 ) ) ( AVAILABLE ?auto_22398 ) ( SURFACE-AT ?auto_22392 ?auto_22400 ) ( ON ?auto_22392 ?auto_22399 ) ( CLEAR ?auto_22392 ) ( not ( = ?auto_22392 ?auto_22399 ) ) ( not ( = ?auto_22393 ?auto_22399 ) ) ( TRUCK-AT ?auto_22394 ?auto_22396 ) ( SURFACE-AT ?auto_22395 ?auto_22396 ) ( CLEAR ?auto_22395 ) ( IS-CRATE ?auto_22393 ) ( not ( = ?auto_22392 ?auto_22395 ) ) ( not ( = ?auto_22393 ?auto_22395 ) ) ( not ( = ?auto_22399 ?auto_22395 ) ) ( AVAILABLE ?auto_22397 ) ( IN ?auto_22393 ?auto_22394 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22397 ?auto_22393 ?auto_22394 ?auto_22396 )
      ( MAKE-ON ?auto_22392 ?auto_22393 )
      ( MAKE-ON-VERIFY ?auto_22392 ?auto_22393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22407 - SURFACE
      ?auto_22408 - SURFACE
    )
    :vars
    (
      ?auto_22414 - HOIST
      ?auto_22410 - PLACE
      ?auto_22413 - PLACE
      ?auto_22411 - HOIST
      ?auto_22409 - SURFACE
      ?auto_22412 - TRUCK
      ?auto_22415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22414 ?auto_22410 ) ( SURFACE-AT ?auto_22408 ?auto_22410 ) ( CLEAR ?auto_22408 ) ( IS-CRATE ?auto_22407 ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( AVAILABLE ?auto_22414 ) ( not ( = ?auto_22413 ?auto_22410 ) ) ( HOIST-AT ?auto_22411 ?auto_22413 ) ( not ( = ?auto_22414 ?auto_22411 ) ) ( AVAILABLE ?auto_22411 ) ( SURFACE-AT ?auto_22407 ?auto_22413 ) ( ON ?auto_22407 ?auto_22409 ) ( CLEAR ?auto_22407 ) ( not ( = ?auto_22407 ?auto_22409 ) ) ( not ( = ?auto_22408 ?auto_22409 ) ) ( TRUCK-AT ?auto_22412 ?auto_22415 ) ( not ( = ?auto_22415 ?auto_22410 ) ) ( not ( = ?auto_22413 ?auto_22415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22412 ?auto_22415 ?auto_22410 )
      ( MAKE-ON ?auto_22407 ?auto_22408 )
      ( MAKE-ON-VERIFY ?auto_22407 ?auto_22408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22656 - SURFACE
      ?auto_22657 - SURFACE
    )
    :vars
    (
      ?auto_22658 - HOIST
      ?auto_22662 - PLACE
      ?auto_22661 - PLACE
      ?auto_22663 - HOIST
      ?auto_22659 - SURFACE
      ?auto_22664 - SURFACE
      ?auto_22660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22658 ?auto_22662 ) ( IS-CRATE ?auto_22656 ) ( not ( = ?auto_22656 ?auto_22657 ) ) ( not ( = ?auto_22661 ?auto_22662 ) ) ( HOIST-AT ?auto_22663 ?auto_22661 ) ( not ( = ?auto_22658 ?auto_22663 ) ) ( AVAILABLE ?auto_22663 ) ( SURFACE-AT ?auto_22656 ?auto_22661 ) ( ON ?auto_22656 ?auto_22659 ) ( CLEAR ?auto_22656 ) ( not ( = ?auto_22656 ?auto_22659 ) ) ( not ( = ?auto_22657 ?auto_22659 ) ) ( SURFACE-AT ?auto_22664 ?auto_22662 ) ( CLEAR ?auto_22664 ) ( IS-CRATE ?auto_22657 ) ( not ( = ?auto_22656 ?auto_22664 ) ) ( not ( = ?auto_22657 ?auto_22664 ) ) ( not ( = ?auto_22659 ?auto_22664 ) ) ( AVAILABLE ?auto_22658 ) ( IN ?auto_22657 ?auto_22660 ) ( TRUCK-AT ?auto_22660 ?auto_22661 ) )
    :subtasks
    ( ( !DRIVE ?auto_22660 ?auto_22661 ?auto_22662 )
      ( MAKE-ON ?auto_22656 ?auto_22657 )
      ( MAKE-ON-VERIFY ?auto_22656 ?auto_22657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22665 - SURFACE
      ?auto_22666 - SURFACE
    )
    :vars
    (
      ?auto_22672 - HOIST
      ?auto_22667 - PLACE
      ?auto_22671 - PLACE
      ?auto_22668 - HOIST
      ?auto_22670 - SURFACE
      ?auto_22673 - SURFACE
      ?auto_22669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22672 ?auto_22667 ) ( IS-CRATE ?auto_22665 ) ( not ( = ?auto_22665 ?auto_22666 ) ) ( not ( = ?auto_22671 ?auto_22667 ) ) ( HOIST-AT ?auto_22668 ?auto_22671 ) ( not ( = ?auto_22672 ?auto_22668 ) ) ( SURFACE-AT ?auto_22665 ?auto_22671 ) ( ON ?auto_22665 ?auto_22670 ) ( CLEAR ?auto_22665 ) ( not ( = ?auto_22665 ?auto_22670 ) ) ( not ( = ?auto_22666 ?auto_22670 ) ) ( SURFACE-AT ?auto_22673 ?auto_22667 ) ( CLEAR ?auto_22673 ) ( IS-CRATE ?auto_22666 ) ( not ( = ?auto_22665 ?auto_22673 ) ) ( not ( = ?auto_22666 ?auto_22673 ) ) ( not ( = ?auto_22670 ?auto_22673 ) ) ( AVAILABLE ?auto_22672 ) ( TRUCK-AT ?auto_22669 ?auto_22671 ) ( LIFTING ?auto_22668 ?auto_22666 ) )
    :subtasks
    ( ( !LOAD ?auto_22668 ?auto_22666 ?auto_22669 ?auto_22671 )
      ( MAKE-ON ?auto_22665 ?auto_22666 )
      ( MAKE-ON-VERIFY ?auto_22665 ?auto_22666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22674 - SURFACE
      ?auto_22675 - SURFACE
    )
    :vars
    (
      ?auto_22679 - HOIST
      ?auto_22681 - PLACE
      ?auto_22678 - PLACE
      ?auto_22682 - HOIST
      ?auto_22680 - SURFACE
      ?auto_22676 - SURFACE
      ?auto_22677 - TRUCK
      ?auto_22683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22679 ?auto_22681 ) ( IS-CRATE ?auto_22674 ) ( not ( = ?auto_22674 ?auto_22675 ) ) ( not ( = ?auto_22678 ?auto_22681 ) ) ( HOIST-AT ?auto_22682 ?auto_22678 ) ( not ( = ?auto_22679 ?auto_22682 ) ) ( SURFACE-AT ?auto_22674 ?auto_22678 ) ( ON ?auto_22674 ?auto_22680 ) ( CLEAR ?auto_22674 ) ( not ( = ?auto_22674 ?auto_22680 ) ) ( not ( = ?auto_22675 ?auto_22680 ) ) ( SURFACE-AT ?auto_22676 ?auto_22681 ) ( CLEAR ?auto_22676 ) ( IS-CRATE ?auto_22675 ) ( not ( = ?auto_22674 ?auto_22676 ) ) ( not ( = ?auto_22675 ?auto_22676 ) ) ( not ( = ?auto_22680 ?auto_22676 ) ) ( AVAILABLE ?auto_22679 ) ( TRUCK-AT ?auto_22677 ?auto_22678 ) ( AVAILABLE ?auto_22682 ) ( SURFACE-AT ?auto_22675 ?auto_22678 ) ( ON ?auto_22675 ?auto_22683 ) ( CLEAR ?auto_22675 ) ( not ( = ?auto_22674 ?auto_22683 ) ) ( not ( = ?auto_22675 ?auto_22683 ) ) ( not ( = ?auto_22680 ?auto_22683 ) ) ( not ( = ?auto_22676 ?auto_22683 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22682 ?auto_22675 ?auto_22683 ?auto_22678 )
      ( MAKE-ON ?auto_22674 ?auto_22675 )
      ( MAKE-ON-VERIFY ?auto_22674 ?auto_22675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22684 - SURFACE
      ?auto_22685 - SURFACE
    )
    :vars
    (
      ?auto_22689 - HOIST
      ?auto_22693 - PLACE
      ?auto_22687 - PLACE
      ?auto_22688 - HOIST
      ?auto_22690 - SURFACE
      ?auto_22691 - SURFACE
      ?auto_22686 - SURFACE
      ?auto_22692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22689 ?auto_22693 ) ( IS-CRATE ?auto_22684 ) ( not ( = ?auto_22684 ?auto_22685 ) ) ( not ( = ?auto_22687 ?auto_22693 ) ) ( HOIST-AT ?auto_22688 ?auto_22687 ) ( not ( = ?auto_22689 ?auto_22688 ) ) ( SURFACE-AT ?auto_22684 ?auto_22687 ) ( ON ?auto_22684 ?auto_22690 ) ( CLEAR ?auto_22684 ) ( not ( = ?auto_22684 ?auto_22690 ) ) ( not ( = ?auto_22685 ?auto_22690 ) ) ( SURFACE-AT ?auto_22691 ?auto_22693 ) ( CLEAR ?auto_22691 ) ( IS-CRATE ?auto_22685 ) ( not ( = ?auto_22684 ?auto_22691 ) ) ( not ( = ?auto_22685 ?auto_22691 ) ) ( not ( = ?auto_22690 ?auto_22691 ) ) ( AVAILABLE ?auto_22689 ) ( AVAILABLE ?auto_22688 ) ( SURFACE-AT ?auto_22685 ?auto_22687 ) ( ON ?auto_22685 ?auto_22686 ) ( CLEAR ?auto_22685 ) ( not ( = ?auto_22684 ?auto_22686 ) ) ( not ( = ?auto_22685 ?auto_22686 ) ) ( not ( = ?auto_22690 ?auto_22686 ) ) ( not ( = ?auto_22691 ?auto_22686 ) ) ( TRUCK-AT ?auto_22692 ?auto_22693 ) )
    :subtasks
    ( ( !DRIVE ?auto_22692 ?auto_22693 ?auto_22687 )
      ( MAKE-ON ?auto_22684 ?auto_22685 )
      ( MAKE-ON-VERIFY ?auto_22684 ?auto_22685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22694 - SURFACE
      ?auto_22695 - SURFACE
    )
    :vars
    (
      ?auto_22698 - HOIST
      ?auto_22696 - PLACE
      ?auto_22697 - PLACE
      ?auto_22701 - HOIST
      ?auto_22700 - SURFACE
      ?auto_22699 - SURFACE
      ?auto_22703 - SURFACE
      ?auto_22702 - TRUCK
      ?auto_22704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22698 ?auto_22696 ) ( IS-CRATE ?auto_22694 ) ( not ( = ?auto_22694 ?auto_22695 ) ) ( not ( = ?auto_22697 ?auto_22696 ) ) ( HOIST-AT ?auto_22701 ?auto_22697 ) ( not ( = ?auto_22698 ?auto_22701 ) ) ( SURFACE-AT ?auto_22694 ?auto_22697 ) ( ON ?auto_22694 ?auto_22700 ) ( CLEAR ?auto_22694 ) ( not ( = ?auto_22694 ?auto_22700 ) ) ( not ( = ?auto_22695 ?auto_22700 ) ) ( IS-CRATE ?auto_22695 ) ( not ( = ?auto_22694 ?auto_22699 ) ) ( not ( = ?auto_22695 ?auto_22699 ) ) ( not ( = ?auto_22700 ?auto_22699 ) ) ( AVAILABLE ?auto_22701 ) ( SURFACE-AT ?auto_22695 ?auto_22697 ) ( ON ?auto_22695 ?auto_22703 ) ( CLEAR ?auto_22695 ) ( not ( = ?auto_22694 ?auto_22703 ) ) ( not ( = ?auto_22695 ?auto_22703 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( not ( = ?auto_22699 ?auto_22703 ) ) ( TRUCK-AT ?auto_22702 ?auto_22696 ) ( SURFACE-AT ?auto_22704 ?auto_22696 ) ( CLEAR ?auto_22704 ) ( LIFTING ?auto_22698 ?auto_22699 ) ( IS-CRATE ?auto_22699 ) ( not ( = ?auto_22694 ?auto_22704 ) ) ( not ( = ?auto_22695 ?auto_22704 ) ) ( not ( = ?auto_22700 ?auto_22704 ) ) ( not ( = ?auto_22699 ?auto_22704 ) ) ( not ( = ?auto_22703 ?auto_22704 ) ) )
    :subtasks
    ( ( !DROP ?auto_22698 ?auto_22699 ?auto_22704 ?auto_22696 )
      ( MAKE-ON ?auto_22694 ?auto_22695 )
      ( MAKE-ON-VERIFY ?auto_22694 ?auto_22695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22818 - SURFACE
      ?auto_22819 - SURFACE
    )
    :vars
    (
      ?auto_22825 - HOIST
      ?auto_22820 - PLACE
      ?auto_22823 - PLACE
      ?auto_22822 - HOIST
      ?auto_22821 - SURFACE
      ?auto_22824 - TRUCK
      ?auto_22826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22825 ?auto_22820 ) ( SURFACE-AT ?auto_22819 ?auto_22820 ) ( CLEAR ?auto_22819 ) ( IS-CRATE ?auto_22818 ) ( not ( = ?auto_22818 ?auto_22819 ) ) ( not ( = ?auto_22823 ?auto_22820 ) ) ( HOIST-AT ?auto_22822 ?auto_22823 ) ( not ( = ?auto_22825 ?auto_22822 ) ) ( AVAILABLE ?auto_22822 ) ( SURFACE-AT ?auto_22818 ?auto_22823 ) ( ON ?auto_22818 ?auto_22821 ) ( CLEAR ?auto_22818 ) ( not ( = ?auto_22818 ?auto_22821 ) ) ( not ( = ?auto_22819 ?auto_22821 ) ) ( TRUCK-AT ?auto_22824 ?auto_22820 ) ( LIFTING ?auto_22825 ?auto_22826 ) ( IS-CRATE ?auto_22826 ) ( not ( = ?auto_22818 ?auto_22826 ) ) ( not ( = ?auto_22819 ?auto_22826 ) ) ( not ( = ?auto_22821 ?auto_22826 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22825 ?auto_22826 ?auto_22824 ?auto_22820 )
      ( MAKE-ON ?auto_22818 ?auto_22819 )
      ( MAKE-ON-VERIFY ?auto_22818 ?auto_22819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22861 - SURFACE
      ?auto_22862 - SURFACE
    )
    :vars
    (
      ?auto_22863 - HOIST
      ?auto_22868 - PLACE
      ?auto_22865 - TRUCK
      ?auto_22867 - PLACE
      ?auto_22864 - HOIST
      ?auto_22866 - SURFACE
      ?auto_22869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22863 ?auto_22868 ) ( SURFACE-AT ?auto_22862 ?auto_22868 ) ( CLEAR ?auto_22862 ) ( IS-CRATE ?auto_22861 ) ( not ( = ?auto_22861 ?auto_22862 ) ) ( AVAILABLE ?auto_22863 ) ( TRUCK-AT ?auto_22865 ?auto_22867 ) ( not ( = ?auto_22867 ?auto_22868 ) ) ( HOIST-AT ?auto_22864 ?auto_22867 ) ( not ( = ?auto_22863 ?auto_22864 ) ) ( SURFACE-AT ?auto_22861 ?auto_22867 ) ( ON ?auto_22861 ?auto_22866 ) ( CLEAR ?auto_22861 ) ( not ( = ?auto_22861 ?auto_22866 ) ) ( not ( = ?auto_22862 ?auto_22866 ) ) ( LIFTING ?auto_22864 ?auto_22869 ) ( IS-CRATE ?auto_22869 ) ( not ( = ?auto_22861 ?auto_22869 ) ) ( not ( = ?auto_22862 ?auto_22869 ) ) ( not ( = ?auto_22866 ?auto_22869 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22864 ?auto_22869 ?auto_22865 ?auto_22867 )
      ( MAKE-ON ?auto_22861 ?auto_22862 )
      ( MAKE-ON-VERIFY ?auto_22861 ?auto_22862 ) )
  )

)

