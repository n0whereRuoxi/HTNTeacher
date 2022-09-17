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
      ?auto_62922 - SURFACE
      ?auto_62923 - SURFACE
    )
    :vars
    (
      ?auto_62924 - HOIST
      ?auto_62925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62924 ?auto_62925 ) ( SURFACE-AT ?auto_62923 ?auto_62925 ) ( CLEAR ?auto_62923 ) ( LIFTING ?auto_62924 ?auto_62922 ) ( IS-CRATE ?auto_62922 ) ( not ( = ?auto_62922 ?auto_62923 ) ) )
    :subtasks
    ( ( !DROP ?auto_62924 ?auto_62922 ?auto_62923 ?auto_62925 )
      ( MAKE-ON-VERIFY ?auto_62922 ?auto_62923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62926 - SURFACE
      ?auto_62927 - SURFACE
    )
    :vars
    (
      ?auto_62929 - HOIST
      ?auto_62928 - PLACE
      ?auto_62930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62929 ?auto_62928 ) ( SURFACE-AT ?auto_62927 ?auto_62928 ) ( CLEAR ?auto_62927 ) ( IS-CRATE ?auto_62926 ) ( not ( = ?auto_62926 ?auto_62927 ) ) ( TRUCK-AT ?auto_62930 ?auto_62928 ) ( AVAILABLE ?auto_62929 ) ( IN ?auto_62926 ?auto_62930 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62929 ?auto_62926 ?auto_62930 ?auto_62928 )
      ( MAKE-ON ?auto_62926 ?auto_62927 )
      ( MAKE-ON-VERIFY ?auto_62926 ?auto_62927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62931 - SURFACE
      ?auto_62932 - SURFACE
    )
    :vars
    (
      ?auto_62935 - HOIST
      ?auto_62934 - PLACE
      ?auto_62933 - TRUCK
      ?auto_62936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62935 ?auto_62934 ) ( SURFACE-AT ?auto_62932 ?auto_62934 ) ( CLEAR ?auto_62932 ) ( IS-CRATE ?auto_62931 ) ( not ( = ?auto_62931 ?auto_62932 ) ) ( AVAILABLE ?auto_62935 ) ( IN ?auto_62931 ?auto_62933 ) ( TRUCK-AT ?auto_62933 ?auto_62936 ) ( not ( = ?auto_62936 ?auto_62934 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62933 ?auto_62936 ?auto_62934 )
      ( MAKE-ON ?auto_62931 ?auto_62932 )
      ( MAKE-ON-VERIFY ?auto_62931 ?auto_62932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62937 - SURFACE
      ?auto_62938 - SURFACE
    )
    :vars
    (
      ?auto_62940 - HOIST
      ?auto_62939 - PLACE
      ?auto_62942 - TRUCK
      ?auto_62941 - PLACE
      ?auto_62943 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62940 ?auto_62939 ) ( SURFACE-AT ?auto_62938 ?auto_62939 ) ( CLEAR ?auto_62938 ) ( IS-CRATE ?auto_62937 ) ( not ( = ?auto_62937 ?auto_62938 ) ) ( AVAILABLE ?auto_62940 ) ( TRUCK-AT ?auto_62942 ?auto_62941 ) ( not ( = ?auto_62941 ?auto_62939 ) ) ( HOIST-AT ?auto_62943 ?auto_62941 ) ( LIFTING ?auto_62943 ?auto_62937 ) ( not ( = ?auto_62940 ?auto_62943 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62943 ?auto_62937 ?auto_62942 ?auto_62941 )
      ( MAKE-ON ?auto_62937 ?auto_62938 )
      ( MAKE-ON-VERIFY ?auto_62937 ?auto_62938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62944 - SURFACE
      ?auto_62945 - SURFACE
    )
    :vars
    (
      ?auto_62947 - HOIST
      ?auto_62948 - PLACE
      ?auto_62949 - TRUCK
      ?auto_62950 - PLACE
      ?auto_62946 - HOIST
      ?auto_62951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62947 ?auto_62948 ) ( SURFACE-AT ?auto_62945 ?auto_62948 ) ( CLEAR ?auto_62945 ) ( IS-CRATE ?auto_62944 ) ( not ( = ?auto_62944 ?auto_62945 ) ) ( AVAILABLE ?auto_62947 ) ( TRUCK-AT ?auto_62949 ?auto_62950 ) ( not ( = ?auto_62950 ?auto_62948 ) ) ( HOIST-AT ?auto_62946 ?auto_62950 ) ( not ( = ?auto_62947 ?auto_62946 ) ) ( AVAILABLE ?auto_62946 ) ( SURFACE-AT ?auto_62944 ?auto_62950 ) ( ON ?auto_62944 ?auto_62951 ) ( CLEAR ?auto_62944 ) ( not ( = ?auto_62944 ?auto_62951 ) ) ( not ( = ?auto_62945 ?auto_62951 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62946 ?auto_62944 ?auto_62951 ?auto_62950 )
      ( MAKE-ON ?auto_62944 ?auto_62945 )
      ( MAKE-ON-VERIFY ?auto_62944 ?auto_62945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62952 - SURFACE
      ?auto_62953 - SURFACE
    )
    :vars
    (
      ?auto_62957 - HOIST
      ?auto_62956 - PLACE
      ?auto_62955 - PLACE
      ?auto_62959 - HOIST
      ?auto_62958 - SURFACE
      ?auto_62954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62957 ?auto_62956 ) ( SURFACE-AT ?auto_62953 ?auto_62956 ) ( CLEAR ?auto_62953 ) ( IS-CRATE ?auto_62952 ) ( not ( = ?auto_62952 ?auto_62953 ) ) ( AVAILABLE ?auto_62957 ) ( not ( = ?auto_62955 ?auto_62956 ) ) ( HOIST-AT ?auto_62959 ?auto_62955 ) ( not ( = ?auto_62957 ?auto_62959 ) ) ( AVAILABLE ?auto_62959 ) ( SURFACE-AT ?auto_62952 ?auto_62955 ) ( ON ?auto_62952 ?auto_62958 ) ( CLEAR ?auto_62952 ) ( not ( = ?auto_62952 ?auto_62958 ) ) ( not ( = ?auto_62953 ?auto_62958 ) ) ( TRUCK-AT ?auto_62954 ?auto_62956 ) )
    :subtasks
    ( ( !DRIVE ?auto_62954 ?auto_62956 ?auto_62955 )
      ( MAKE-ON ?auto_62952 ?auto_62953 )
      ( MAKE-ON-VERIFY ?auto_62952 ?auto_62953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63000 - SURFACE
      ?auto_63001 - SURFACE
    )
    :vars
    (
      ?auto_63006 - HOIST
      ?auto_63004 - PLACE
      ?auto_63005 - PLACE
      ?auto_63003 - HOIST
      ?auto_63007 - SURFACE
      ?auto_63002 - TRUCK
      ?auto_63008 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63006 ?auto_63004 ) ( IS-CRATE ?auto_63000 ) ( not ( = ?auto_63000 ?auto_63001 ) ) ( not ( = ?auto_63005 ?auto_63004 ) ) ( HOIST-AT ?auto_63003 ?auto_63005 ) ( not ( = ?auto_63006 ?auto_63003 ) ) ( AVAILABLE ?auto_63003 ) ( SURFACE-AT ?auto_63000 ?auto_63005 ) ( ON ?auto_63000 ?auto_63007 ) ( CLEAR ?auto_63000 ) ( not ( = ?auto_63000 ?auto_63007 ) ) ( not ( = ?auto_63001 ?auto_63007 ) ) ( TRUCK-AT ?auto_63002 ?auto_63004 ) ( SURFACE-AT ?auto_63008 ?auto_63004 ) ( CLEAR ?auto_63008 ) ( LIFTING ?auto_63006 ?auto_63001 ) ( IS-CRATE ?auto_63001 ) ( not ( = ?auto_63000 ?auto_63008 ) ) ( not ( = ?auto_63001 ?auto_63008 ) ) ( not ( = ?auto_63007 ?auto_63008 ) ) )
    :subtasks
    ( ( !DROP ?auto_63006 ?auto_63001 ?auto_63008 ?auto_63004 )
      ( MAKE-ON ?auto_63000 ?auto_63001 )
      ( MAKE-ON-VERIFY ?auto_63000 ?auto_63001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63009 - SURFACE
      ?auto_63010 - SURFACE
    )
    :vars
    (
      ?auto_63014 - HOIST
      ?auto_63017 - PLACE
      ?auto_63011 - PLACE
      ?auto_63012 - HOIST
      ?auto_63013 - SURFACE
      ?auto_63015 - TRUCK
      ?auto_63016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63014 ?auto_63017 ) ( IS-CRATE ?auto_63009 ) ( not ( = ?auto_63009 ?auto_63010 ) ) ( not ( = ?auto_63011 ?auto_63017 ) ) ( HOIST-AT ?auto_63012 ?auto_63011 ) ( not ( = ?auto_63014 ?auto_63012 ) ) ( AVAILABLE ?auto_63012 ) ( SURFACE-AT ?auto_63009 ?auto_63011 ) ( ON ?auto_63009 ?auto_63013 ) ( CLEAR ?auto_63009 ) ( not ( = ?auto_63009 ?auto_63013 ) ) ( not ( = ?auto_63010 ?auto_63013 ) ) ( TRUCK-AT ?auto_63015 ?auto_63017 ) ( SURFACE-AT ?auto_63016 ?auto_63017 ) ( CLEAR ?auto_63016 ) ( IS-CRATE ?auto_63010 ) ( not ( = ?auto_63009 ?auto_63016 ) ) ( not ( = ?auto_63010 ?auto_63016 ) ) ( not ( = ?auto_63013 ?auto_63016 ) ) ( AVAILABLE ?auto_63014 ) ( IN ?auto_63010 ?auto_63015 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63014 ?auto_63010 ?auto_63015 ?auto_63017 )
      ( MAKE-ON ?auto_63009 ?auto_63010 )
      ( MAKE-ON-VERIFY ?auto_63009 ?auto_63010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63024 - SURFACE
      ?auto_63025 - SURFACE
    )
    :vars
    (
      ?auto_63028 - HOIST
      ?auto_63030 - PLACE
      ?auto_63029 - PLACE
      ?auto_63027 - HOIST
      ?auto_63031 - SURFACE
      ?auto_63026 - TRUCK
      ?auto_63032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63028 ?auto_63030 ) ( SURFACE-AT ?auto_63025 ?auto_63030 ) ( CLEAR ?auto_63025 ) ( IS-CRATE ?auto_63024 ) ( not ( = ?auto_63024 ?auto_63025 ) ) ( AVAILABLE ?auto_63028 ) ( not ( = ?auto_63029 ?auto_63030 ) ) ( HOIST-AT ?auto_63027 ?auto_63029 ) ( not ( = ?auto_63028 ?auto_63027 ) ) ( AVAILABLE ?auto_63027 ) ( SURFACE-AT ?auto_63024 ?auto_63029 ) ( ON ?auto_63024 ?auto_63031 ) ( CLEAR ?auto_63024 ) ( not ( = ?auto_63024 ?auto_63031 ) ) ( not ( = ?auto_63025 ?auto_63031 ) ) ( TRUCK-AT ?auto_63026 ?auto_63032 ) ( not ( = ?auto_63032 ?auto_63030 ) ) ( not ( = ?auto_63029 ?auto_63032 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63026 ?auto_63032 ?auto_63030 )
      ( MAKE-ON ?auto_63024 ?auto_63025 )
      ( MAKE-ON-VERIFY ?auto_63024 ?auto_63025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63306 - SURFACE
      ?auto_63307 - SURFACE
    )
    :vars
    (
      ?auto_63310 - HOIST
      ?auto_63312 - PLACE
      ?auto_63309 - TRUCK
      ?auto_63313 - PLACE
      ?auto_63308 - HOIST
      ?auto_63311 - SURFACE
      ?auto_63314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63310 ?auto_63312 ) ( SURFACE-AT ?auto_63307 ?auto_63312 ) ( CLEAR ?auto_63307 ) ( IS-CRATE ?auto_63306 ) ( not ( = ?auto_63306 ?auto_63307 ) ) ( AVAILABLE ?auto_63310 ) ( TRUCK-AT ?auto_63309 ?auto_63313 ) ( not ( = ?auto_63313 ?auto_63312 ) ) ( HOIST-AT ?auto_63308 ?auto_63313 ) ( not ( = ?auto_63310 ?auto_63308 ) ) ( SURFACE-AT ?auto_63306 ?auto_63313 ) ( ON ?auto_63306 ?auto_63311 ) ( CLEAR ?auto_63306 ) ( not ( = ?auto_63306 ?auto_63311 ) ) ( not ( = ?auto_63307 ?auto_63311 ) ) ( LIFTING ?auto_63308 ?auto_63314 ) ( IS-CRATE ?auto_63314 ) ( not ( = ?auto_63306 ?auto_63314 ) ) ( not ( = ?auto_63307 ?auto_63314 ) ) ( not ( = ?auto_63311 ?auto_63314 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63308 ?auto_63314 ?auto_63309 ?auto_63313 )
      ( MAKE-ON ?auto_63306 ?auto_63307 )
      ( MAKE-ON-VERIFY ?auto_63306 ?auto_63307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63434 - SURFACE
      ?auto_63435 - SURFACE
    )
    :vars
    (
      ?auto_63441 - HOIST
      ?auto_63439 - PLACE
      ?auto_63436 - PLACE
      ?auto_63438 - HOIST
      ?auto_63437 - SURFACE
      ?auto_63440 - TRUCK
      ?auto_63442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63441 ?auto_63439 ) ( SURFACE-AT ?auto_63435 ?auto_63439 ) ( CLEAR ?auto_63435 ) ( IS-CRATE ?auto_63434 ) ( not ( = ?auto_63434 ?auto_63435 ) ) ( not ( = ?auto_63436 ?auto_63439 ) ) ( HOIST-AT ?auto_63438 ?auto_63436 ) ( not ( = ?auto_63441 ?auto_63438 ) ) ( AVAILABLE ?auto_63438 ) ( SURFACE-AT ?auto_63434 ?auto_63436 ) ( ON ?auto_63434 ?auto_63437 ) ( CLEAR ?auto_63434 ) ( not ( = ?auto_63434 ?auto_63437 ) ) ( not ( = ?auto_63435 ?auto_63437 ) ) ( TRUCK-AT ?auto_63440 ?auto_63439 ) ( LIFTING ?auto_63441 ?auto_63442 ) ( IS-CRATE ?auto_63442 ) ( not ( = ?auto_63434 ?auto_63442 ) ) ( not ( = ?auto_63435 ?auto_63442 ) ) ( not ( = ?auto_63437 ?auto_63442 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63441 ?auto_63442 ?auto_63440 ?auto_63439 )
      ( MAKE-ON ?auto_63434 ?auto_63435 )
      ( MAKE-ON-VERIFY ?auto_63434 ?auto_63435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63517 - SURFACE
      ?auto_63518 - SURFACE
    )
    :vars
    (
      ?auto_63524 - HOIST
      ?auto_63522 - PLACE
      ?auto_63521 - PLACE
      ?auto_63523 - HOIST
      ?auto_63520 - SURFACE
      ?auto_63519 - SURFACE
      ?auto_63525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63524 ?auto_63522 ) ( IS-CRATE ?auto_63517 ) ( not ( = ?auto_63517 ?auto_63518 ) ) ( not ( = ?auto_63521 ?auto_63522 ) ) ( HOIST-AT ?auto_63523 ?auto_63521 ) ( not ( = ?auto_63524 ?auto_63523 ) ) ( AVAILABLE ?auto_63523 ) ( SURFACE-AT ?auto_63517 ?auto_63521 ) ( ON ?auto_63517 ?auto_63520 ) ( CLEAR ?auto_63517 ) ( not ( = ?auto_63517 ?auto_63520 ) ) ( not ( = ?auto_63518 ?auto_63520 ) ) ( SURFACE-AT ?auto_63519 ?auto_63522 ) ( CLEAR ?auto_63519 ) ( IS-CRATE ?auto_63518 ) ( not ( = ?auto_63517 ?auto_63519 ) ) ( not ( = ?auto_63518 ?auto_63519 ) ) ( not ( = ?auto_63520 ?auto_63519 ) ) ( AVAILABLE ?auto_63524 ) ( IN ?auto_63518 ?auto_63525 ) ( TRUCK-AT ?auto_63525 ?auto_63521 ) )
    :subtasks
    ( ( !DRIVE ?auto_63525 ?auto_63521 ?auto_63522 )
      ( MAKE-ON ?auto_63517 ?auto_63518 )
      ( MAKE-ON-VERIFY ?auto_63517 ?auto_63518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63526 - SURFACE
      ?auto_63527 - SURFACE
    )
    :vars
    (
      ?auto_63529 - HOIST
      ?auto_63528 - PLACE
      ?auto_63534 - PLACE
      ?auto_63530 - HOIST
      ?auto_63531 - SURFACE
      ?auto_63532 - SURFACE
      ?auto_63533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63529 ?auto_63528 ) ( IS-CRATE ?auto_63526 ) ( not ( = ?auto_63526 ?auto_63527 ) ) ( not ( = ?auto_63534 ?auto_63528 ) ) ( HOIST-AT ?auto_63530 ?auto_63534 ) ( not ( = ?auto_63529 ?auto_63530 ) ) ( SURFACE-AT ?auto_63526 ?auto_63534 ) ( ON ?auto_63526 ?auto_63531 ) ( CLEAR ?auto_63526 ) ( not ( = ?auto_63526 ?auto_63531 ) ) ( not ( = ?auto_63527 ?auto_63531 ) ) ( SURFACE-AT ?auto_63532 ?auto_63528 ) ( CLEAR ?auto_63532 ) ( IS-CRATE ?auto_63527 ) ( not ( = ?auto_63526 ?auto_63532 ) ) ( not ( = ?auto_63527 ?auto_63532 ) ) ( not ( = ?auto_63531 ?auto_63532 ) ) ( AVAILABLE ?auto_63529 ) ( TRUCK-AT ?auto_63533 ?auto_63534 ) ( LIFTING ?auto_63530 ?auto_63527 ) )
    :subtasks
    ( ( !LOAD ?auto_63530 ?auto_63527 ?auto_63533 ?auto_63534 )
      ( MAKE-ON ?auto_63526 ?auto_63527 )
      ( MAKE-ON-VERIFY ?auto_63526 ?auto_63527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63535 - SURFACE
      ?auto_63536 - SURFACE
    )
    :vars
    (
      ?auto_63539 - HOIST
      ?auto_63537 - PLACE
      ?auto_63543 - PLACE
      ?auto_63540 - HOIST
      ?auto_63542 - SURFACE
      ?auto_63538 - SURFACE
      ?auto_63541 - TRUCK
      ?auto_63544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63539 ?auto_63537 ) ( IS-CRATE ?auto_63535 ) ( not ( = ?auto_63535 ?auto_63536 ) ) ( not ( = ?auto_63543 ?auto_63537 ) ) ( HOIST-AT ?auto_63540 ?auto_63543 ) ( not ( = ?auto_63539 ?auto_63540 ) ) ( SURFACE-AT ?auto_63535 ?auto_63543 ) ( ON ?auto_63535 ?auto_63542 ) ( CLEAR ?auto_63535 ) ( not ( = ?auto_63535 ?auto_63542 ) ) ( not ( = ?auto_63536 ?auto_63542 ) ) ( SURFACE-AT ?auto_63538 ?auto_63537 ) ( CLEAR ?auto_63538 ) ( IS-CRATE ?auto_63536 ) ( not ( = ?auto_63535 ?auto_63538 ) ) ( not ( = ?auto_63536 ?auto_63538 ) ) ( not ( = ?auto_63542 ?auto_63538 ) ) ( AVAILABLE ?auto_63539 ) ( TRUCK-AT ?auto_63541 ?auto_63543 ) ( AVAILABLE ?auto_63540 ) ( SURFACE-AT ?auto_63536 ?auto_63543 ) ( ON ?auto_63536 ?auto_63544 ) ( CLEAR ?auto_63536 ) ( not ( = ?auto_63535 ?auto_63544 ) ) ( not ( = ?auto_63536 ?auto_63544 ) ) ( not ( = ?auto_63542 ?auto_63544 ) ) ( not ( = ?auto_63538 ?auto_63544 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63540 ?auto_63536 ?auto_63544 ?auto_63543 )
      ( MAKE-ON ?auto_63535 ?auto_63536 )
      ( MAKE-ON-VERIFY ?auto_63535 ?auto_63536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63545 - SURFACE
      ?auto_63546 - SURFACE
    )
    :vars
    (
      ?auto_63553 - HOIST
      ?auto_63548 - PLACE
      ?auto_63549 - PLACE
      ?auto_63547 - HOIST
      ?auto_63554 - SURFACE
      ?auto_63551 - SURFACE
      ?auto_63550 - SURFACE
      ?auto_63552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63553 ?auto_63548 ) ( IS-CRATE ?auto_63545 ) ( not ( = ?auto_63545 ?auto_63546 ) ) ( not ( = ?auto_63549 ?auto_63548 ) ) ( HOIST-AT ?auto_63547 ?auto_63549 ) ( not ( = ?auto_63553 ?auto_63547 ) ) ( SURFACE-AT ?auto_63545 ?auto_63549 ) ( ON ?auto_63545 ?auto_63554 ) ( CLEAR ?auto_63545 ) ( not ( = ?auto_63545 ?auto_63554 ) ) ( not ( = ?auto_63546 ?auto_63554 ) ) ( SURFACE-AT ?auto_63551 ?auto_63548 ) ( CLEAR ?auto_63551 ) ( IS-CRATE ?auto_63546 ) ( not ( = ?auto_63545 ?auto_63551 ) ) ( not ( = ?auto_63546 ?auto_63551 ) ) ( not ( = ?auto_63554 ?auto_63551 ) ) ( AVAILABLE ?auto_63553 ) ( AVAILABLE ?auto_63547 ) ( SURFACE-AT ?auto_63546 ?auto_63549 ) ( ON ?auto_63546 ?auto_63550 ) ( CLEAR ?auto_63546 ) ( not ( = ?auto_63545 ?auto_63550 ) ) ( not ( = ?auto_63546 ?auto_63550 ) ) ( not ( = ?auto_63554 ?auto_63550 ) ) ( not ( = ?auto_63551 ?auto_63550 ) ) ( TRUCK-AT ?auto_63552 ?auto_63548 ) )
    :subtasks
    ( ( !DRIVE ?auto_63552 ?auto_63548 ?auto_63549 )
      ( MAKE-ON ?auto_63545 ?auto_63546 )
      ( MAKE-ON-VERIFY ?auto_63545 ?auto_63546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63555 - SURFACE
      ?auto_63556 - SURFACE
    )
    :vars
    (
      ?auto_63563 - HOIST
      ?auto_63562 - PLACE
      ?auto_63559 - PLACE
      ?auto_63558 - HOIST
      ?auto_63557 - SURFACE
      ?auto_63561 - SURFACE
      ?auto_63564 - SURFACE
      ?auto_63560 - TRUCK
      ?auto_63565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63563 ?auto_63562 ) ( IS-CRATE ?auto_63555 ) ( not ( = ?auto_63555 ?auto_63556 ) ) ( not ( = ?auto_63559 ?auto_63562 ) ) ( HOIST-AT ?auto_63558 ?auto_63559 ) ( not ( = ?auto_63563 ?auto_63558 ) ) ( SURFACE-AT ?auto_63555 ?auto_63559 ) ( ON ?auto_63555 ?auto_63557 ) ( CLEAR ?auto_63555 ) ( not ( = ?auto_63555 ?auto_63557 ) ) ( not ( = ?auto_63556 ?auto_63557 ) ) ( IS-CRATE ?auto_63556 ) ( not ( = ?auto_63555 ?auto_63561 ) ) ( not ( = ?auto_63556 ?auto_63561 ) ) ( not ( = ?auto_63557 ?auto_63561 ) ) ( AVAILABLE ?auto_63558 ) ( SURFACE-AT ?auto_63556 ?auto_63559 ) ( ON ?auto_63556 ?auto_63564 ) ( CLEAR ?auto_63556 ) ( not ( = ?auto_63555 ?auto_63564 ) ) ( not ( = ?auto_63556 ?auto_63564 ) ) ( not ( = ?auto_63557 ?auto_63564 ) ) ( not ( = ?auto_63561 ?auto_63564 ) ) ( TRUCK-AT ?auto_63560 ?auto_63562 ) ( SURFACE-AT ?auto_63565 ?auto_63562 ) ( CLEAR ?auto_63565 ) ( LIFTING ?auto_63563 ?auto_63561 ) ( IS-CRATE ?auto_63561 ) ( not ( = ?auto_63555 ?auto_63565 ) ) ( not ( = ?auto_63556 ?auto_63565 ) ) ( not ( = ?auto_63557 ?auto_63565 ) ) ( not ( = ?auto_63561 ?auto_63565 ) ) ( not ( = ?auto_63564 ?auto_63565 ) ) )
    :subtasks
    ( ( !DROP ?auto_63563 ?auto_63561 ?auto_63565 ?auto_63562 )
      ( MAKE-ON ?auto_63555 ?auto_63556 )
      ( MAKE-ON-VERIFY ?auto_63555 ?auto_63556 ) )
  )

)

