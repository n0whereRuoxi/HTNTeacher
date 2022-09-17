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
      ?auto_11849 - SURFACE
      ?auto_11850 - SURFACE
    )
    :vars
    (
      ?auto_11851 - HOIST
      ?auto_11852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11851 ?auto_11852 ) ( SURFACE-AT ?auto_11850 ?auto_11852 ) ( CLEAR ?auto_11850 ) ( LIFTING ?auto_11851 ?auto_11849 ) ( IS-CRATE ?auto_11849 ) ( not ( = ?auto_11849 ?auto_11850 ) ) )
    :subtasks
    ( ( !DROP ?auto_11851 ?auto_11849 ?auto_11850 ?auto_11852 )
      ( MAKE-ON-VERIFY ?auto_11849 ?auto_11850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11853 - SURFACE
      ?auto_11854 - SURFACE
    )
    :vars
    (
      ?auto_11856 - HOIST
      ?auto_11855 - PLACE
      ?auto_11857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11856 ?auto_11855 ) ( SURFACE-AT ?auto_11854 ?auto_11855 ) ( CLEAR ?auto_11854 ) ( IS-CRATE ?auto_11853 ) ( not ( = ?auto_11853 ?auto_11854 ) ) ( TRUCK-AT ?auto_11857 ?auto_11855 ) ( AVAILABLE ?auto_11856 ) ( IN ?auto_11853 ?auto_11857 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11856 ?auto_11853 ?auto_11857 ?auto_11855 )
      ( MAKE-ON ?auto_11853 ?auto_11854 )
      ( MAKE-ON-VERIFY ?auto_11853 ?auto_11854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11858 - SURFACE
      ?auto_11859 - SURFACE
    )
    :vars
    (
      ?auto_11862 - HOIST
      ?auto_11861 - PLACE
      ?auto_11860 - TRUCK
      ?auto_11863 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11862 ?auto_11861 ) ( SURFACE-AT ?auto_11859 ?auto_11861 ) ( CLEAR ?auto_11859 ) ( IS-CRATE ?auto_11858 ) ( not ( = ?auto_11858 ?auto_11859 ) ) ( AVAILABLE ?auto_11862 ) ( IN ?auto_11858 ?auto_11860 ) ( TRUCK-AT ?auto_11860 ?auto_11863 ) ( not ( = ?auto_11863 ?auto_11861 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11860 ?auto_11863 ?auto_11861 )
      ( MAKE-ON ?auto_11858 ?auto_11859 )
      ( MAKE-ON-VERIFY ?auto_11858 ?auto_11859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11864 - SURFACE
      ?auto_11865 - SURFACE
    )
    :vars
    (
      ?auto_11866 - HOIST
      ?auto_11868 - PLACE
      ?auto_11869 - TRUCK
      ?auto_11867 - PLACE
      ?auto_11870 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11866 ?auto_11868 ) ( SURFACE-AT ?auto_11865 ?auto_11868 ) ( CLEAR ?auto_11865 ) ( IS-CRATE ?auto_11864 ) ( not ( = ?auto_11864 ?auto_11865 ) ) ( AVAILABLE ?auto_11866 ) ( TRUCK-AT ?auto_11869 ?auto_11867 ) ( not ( = ?auto_11867 ?auto_11868 ) ) ( HOIST-AT ?auto_11870 ?auto_11867 ) ( LIFTING ?auto_11870 ?auto_11864 ) ( not ( = ?auto_11866 ?auto_11870 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11870 ?auto_11864 ?auto_11869 ?auto_11867 )
      ( MAKE-ON ?auto_11864 ?auto_11865 )
      ( MAKE-ON-VERIFY ?auto_11864 ?auto_11865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11871 - SURFACE
      ?auto_11872 - SURFACE
    )
    :vars
    (
      ?auto_11873 - HOIST
      ?auto_11876 - PLACE
      ?auto_11875 - TRUCK
      ?auto_11874 - PLACE
      ?auto_11877 - HOIST
      ?auto_11878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11873 ?auto_11876 ) ( SURFACE-AT ?auto_11872 ?auto_11876 ) ( CLEAR ?auto_11872 ) ( IS-CRATE ?auto_11871 ) ( not ( = ?auto_11871 ?auto_11872 ) ) ( AVAILABLE ?auto_11873 ) ( TRUCK-AT ?auto_11875 ?auto_11874 ) ( not ( = ?auto_11874 ?auto_11876 ) ) ( HOIST-AT ?auto_11877 ?auto_11874 ) ( not ( = ?auto_11873 ?auto_11877 ) ) ( AVAILABLE ?auto_11877 ) ( SURFACE-AT ?auto_11871 ?auto_11874 ) ( ON ?auto_11871 ?auto_11878 ) ( CLEAR ?auto_11871 ) ( not ( = ?auto_11871 ?auto_11878 ) ) ( not ( = ?auto_11872 ?auto_11878 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11877 ?auto_11871 ?auto_11878 ?auto_11874 )
      ( MAKE-ON ?auto_11871 ?auto_11872 )
      ( MAKE-ON-VERIFY ?auto_11871 ?auto_11872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11879 - SURFACE
      ?auto_11880 - SURFACE
    )
    :vars
    (
      ?auto_11881 - HOIST
      ?auto_11886 - PLACE
      ?auto_11883 - PLACE
      ?auto_11882 - HOIST
      ?auto_11885 - SURFACE
      ?auto_11884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11881 ?auto_11886 ) ( SURFACE-AT ?auto_11880 ?auto_11886 ) ( CLEAR ?auto_11880 ) ( IS-CRATE ?auto_11879 ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( AVAILABLE ?auto_11881 ) ( not ( = ?auto_11883 ?auto_11886 ) ) ( HOIST-AT ?auto_11882 ?auto_11883 ) ( not ( = ?auto_11881 ?auto_11882 ) ) ( AVAILABLE ?auto_11882 ) ( SURFACE-AT ?auto_11879 ?auto_11883 ) ( ON ?auto_11879 ?auto_11885 ) ( CLEAR ?auto_11879 ) ( not ( = ?auto_11879 ?auto_11885 ) ) ( not ( = ?auto_11880 ?auto_11885 ) ) ( TRUCK-AT ?auto_11884 ?auto_11886 ) )
    :subtasks
    ( ( !DRIVE ?auto_11884 ?auto_11886 ?auto_11883 )
      ( MAKE-ON ?auto_11879 ?auto_11880 )
      ( MAKE-ON-VERIFY ?auto_11879 ?auto_11880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11927 - SURFACE
      ?auto_11928 - SURFACE
    )
    :vars
    (
      ?auto_11930 - HOIST
      ?auto_11934 - PLACE
      ?auto_11932 - PLACE
      ?auto_11931 - HOIST
      ?auto_11933 - SURFACE
      ?auto_11929 - TRUCK
      ?auto_11935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11930 ?auto_11934 ) ( IS-CRATE ?auto_11927 ) ( not ( = ?auto_11927 ?auto_11928 ) ) ( not ( = ?auto_11932 ?auto_11934 ) ) ( HOIST-AT ?auto_11931 ?auto_11932 ) ( not ( = ?auto_11930 ?auto_11931 ) ) ( AVAILABLE ?auto_11931 ) ( SURFACE-AT ?auto_11927 ?auto_11932 ) ( ON ?auto_11927 ?auto_11933 ) ( CLEAR ?auto_11927 ) ( not ( = ?auto_11927 ?auto_11933 ) ) ( not ( = ?auto_11928 ?auto_11933 ) ) ( TRUCK-AT ?auto_11929 ?auto_11934 ) ( SURFACE-AT ?auto_11935 ?auto_11934 ) ( CLEAR ?auto_11935 ) ( LIFTING ?auto_11930 ?auto_11928 ) ( IS-CRATE ?auto_11928 ) ( not ( = ?auto_11927 ?auto_11935 ) ) ( not ( = ?auto_11928 ?auto_11935 ) ) ( not ( = ?auto_11933 ?auto_11935 ) ) )
    :subtasks
    ( ( !DROP ?auto_11930 ?auto_11928 ?auto_11935 ?auto_11934 )
      ( MAKE-ON ?auto_11927 ?auto_11928 )
      ( MAKE-ON-VERIFY ?auto_11927 ?auto_11928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11936 - SURFACE
      ?auto_11937 - SURFACE
    )
    :vars
    (
      ?auto_11942 - HOIST
      ?auto_11944 - PLACE
      ?auto_11941 - PLACE
      ?auto_11940 - HOIST
      ?auto_11943 - SURFACE
      ?auto_11939 - TRUCK
      ?auto_11938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11942 ?auto_11944 ) ( IS-CRATE ?auto_11936 ) ( not ( = ?auto_11936 ?auto_11937 ) ) ( not ( = ?auto_11941 ?auto_11944 ) ) ( HOIST-AT ?auto_11940 ?auto_11941 ) ( not ( = ?auto_11942 ?auto_11940 ) ) ( AVAILABLE ?auto_11940 ) ( SURFACE-AT ?auto_11936 ?auto_11941 ) ( ON ?auto_11936 ?auto_11943 ) ( CLEAR ?auto_11936 ) ( not ( = ?auto_11936 ?auto_11943 ) ) ( not ( = ?auto_11937 ?auto_11943 ) ) ( TRUCK-AT ?auto_11939 ?auto_11944 ) ( SURFACE-AT ?auto_11938 ?auto_11944 ) ( CLEAR ?auto_11938 ) ( IS-CRATE ?auto_11937 ) ( not ( = ?auto_11936 ?auto_11938 ) ) ( not ( = ?auto_11937 ?auto_11938 ) ) ( not ( = ?auto_11943 ?auto_11938 ) ) ( AVAILABLE ?auto_11942 ) ( IN ?auto_11937 ?auto_11939 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11942 ?auto_11937 ?auto_11939 ?auto_11944 )
      ( MAKE-ON ?auto_11936 ?auto_11937 )
      ( MAKE-ON-VERIFY ?auto_11936 ?auto_11937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11951 - SURFACE
      ?auto_11952 - SURFACE
    )
    :vars
    (
      ?auto_11954 - HOIST
      ?auto_11953 - PLACE
      ?auto_11958 - PLACE
      ?auto_11955 - HOIST
      ?auto_11956 - SURFACE
      ?auto_11957 - TRUCK
      ?auto_11959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11954 ?auto_11953 ) ( SURFACE-AT ?auto_11952 ?auto_11953 ) ( CLEAR ?auto_11952 ) ( IS-CRATE ?auto_11951 ) ( not ( = ?auto_11951 ?auto_11952 ) ) ( AVAILABLE ?auto_11954 ) ( not ( = ?auto_11958 ?auto_11953 ) ) ( HOIST-AT ?auto_11955 ?auto_11958 ) ( not ( = ?auto_11954 ?auto_11955 ) ) ( AVAILABLE ?auto_11955 ) ( SURFACE-AT ?auto_11951 ?auto_11958 ) ( ON ?auto_11951 ?auto_11956 ) ( CLEAR ?auto_11951 ) ( not ( = ?auto_11951 ?auto_11956 ) ) ( not ( = ?auto_11952 ?auto_11956 ) ) ( TRUCK-AT ?auto_11957 ?auto_11959 ) ( not ( = ?auto_11959 ?auto_11953 ) ) ( not ( = ?auto_11958 ?auto_11959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11957 ?auto_11959 ?auto_11953 )
      ( MAKE-ON ?auto_11951 ?auto_11952 )
      ( MAKE-ON-VERIFY ?auto_11951 ?auto_11952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12124 - SURFACE
      ?auto_12125 - SURFACE
    )
    :vars
    (
      ?auto_12131 - HOIST
      ?auto_12130 - PLACE
      ?auto_12128 - TRUCK
      ?auto_12129 - PLACE
      ?auto_12127 - HOIST
      ?auto_12126 - SURFACE
      ?auto_12132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12131 ?auto_12130 ) ( SURFACE-AT ?auto_12125 ?auto_12130 ) ( CLEAR ?auto_12125 ) ( IS-CRATE ?auto_12124 ) ( not ( = ?auto_12124 ?auto_12125 ) ) ( AVAILABLE ?auto_12131 ) ( TRUCK-AT ?auto_12128 ?auto_12129 ) ( not ( = ?auto_12129 ?auto_12130 ) ) ( HOIST-AT ?auto_12127 ?auto_12129 ) ( not ( = ?auto_12131 ?auto_12127 ) ) ( SURFACE-AT ?auto_12124 ?auto_12129 ) ( ON ?auto_12124 ?auto_12126 ) ( CLEAR ?auto_12124 ) ( not ( = ?auto_12124 ?auto_12126 ) ) ( not ( = ?auto_12125 ?auto_12126 ) ) ( LIFTING ?auto_12127 ?auto_12132 ) ( IS-CRATE ?auto_12132 ) ( not ( = ?auto_12124 ?auto_12132 ) ) ( not ( = ?auto_12125 ?auto_12132 ) ) ( not ( = ?auto_12126 ?auto_12132 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12127 ?auto_12132 ?auto_12128 ?auto_12129 )
      ( MAKE-ON ?auto_12124 ?auto_12125 )
      ( MAKE-ON-VERIFY ?auto_12124 ?auto_12125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12240 - SURFACE
      ?auto_12241 - SURFACE
    )
    :vars
    (
      ?auto_12245 - HOIST
      ?auto_12242 - PLACE
      ?auto_12244 - PLACE
      ?auto_12247 - HOIST
      ?auto_12243 - SURFACE
      ?auto_12246 - TRUCK
      ?auto_12248 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12245 ?auto_12242 ) ( SURFACE-AT ?auto_12241 ?auto_12242 ) ( CLEAR ?auto_12241 ) ( IS-CRATE ?auto_12240 ) ( not ( = ?auto_12240 ?auto_12241 ) ) ( not ( = ?auto_12244 ?auto_12242 ) ) ( HOIST-AT ?auto_12247 ?auto_12244 ) ( not ( = ?auto_12245 ?auto_12247 ) ) ( AVAILABLE ?auto_12247 ) ( SURFACE-AT ?auto_12240 ?auto_12244 ) ( ON ?auto_12240 ?auto_12243 ) ( CLEAR ?auto_12240 ) ( not ( = ?auto_12240 ?auto_12243 ) ) ( not ( = ?auto_12241 ?auto_12243 ) ) ( TRUCK-AT ?auto_12246 ?auto_12242 ) ( LIFTING ?auto_12245 ?auto_12248 ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12240 ?auto_12248 ) ) ( not ( = ?auto_12241 ?auto_12248 ) ) ( not ( = ?auto_12243 ?auto_12248 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12245 ?auto_12248 ?auto_12246 ?auto_12242 )
      ( MAKE-ON ?auto_12240 ?auto_12241 )
      ( MAKE-ON-VERIFY ?auto_12240 ?auto_12241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12444 - SURFACE
      ?auto_12445 - SURFACE
    )
    :vars
    (
      ?auto_12452 - HOIST
      ?auto_12450 - PLACE
      ?auto_12449 - PLACE
      ?auto_12446 - HOIST
      ?auto_12451 - SURFACE
      ?auto_12448 - SURFACE
      ?auto_12447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12452 ?auto_12450 ) ( IS-CRATE ?auto_12444 ) ( not ( = ?auto_12444 ?auto_12445 ) ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( HOIST-AT ?auto_12446 ?auto_12449 ) ( not ( = ?auto_12452 ?auto_12446 ) ) ( AVAILABLE ?auto_12446 ) ( SURFACE-AT ?auto_12444 ?auto_12449 ) ( ON ?auto_12444 ?auto_12451 ) ( CLEAR ?auto_12444 ) ( not ( = ?auto_12444 ?auto_12451 ) ) ( not ( = ?auto_12445 ?auto_12451 ) ) ( SURFACE-AT ?auto_12448 ?auto_12450 ) ( CLEAR ?auto_12448 ) ( IS-CRATE ?auto_12445 ) ( not ( = ?auto_12444 ?auto_12448 ) ) ( not ( = ?auto_12445 ?auto_12448 ) ) ( not ( = ?auto_12451 ?auto_12448 ) ) ( AVAILABLE ?auto_12452 ) ( IN ?auto_12445 ?auto_12447 ) ( TRUCK-AT ?auto_12447 ?auto_12449 ) )
    :subtasks
    ( ( !DRIVE ?auto_12447 ?auto_12449 ?auto_12450 )
      ( MAKE-ON ?auto_12444 ?auto_12445 )
      ( MAKE-ON-VERIFY ?auto_12444 ?auto_12445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12453 - SURFACE
      ?auto_12454 - SURFACE
    )
    :vars
    (
      ?auto_12457 - HOIST
      ?auto_12459 - PLACE
      ?auto_12460 - PLACE
      ?auto_12461 - HOIST
      ?auto_12455 - SURFACE
      ?auto_12456 - SURFACE
      ?auto_12458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12457 ?auto_12459 ) ( IS-CRATE ?auto_12453 ) ( not ( = ?auto_12453 ?auto_12454 ) ) ( not ( = ?auto_12460 ?auto_12459 ) ) ( HOIST-AT ?auto_12461 ?auto_12460 ) ( not ( = ?auto_12457 ?auto_12461 ) ) ( SURFACE-AT ?auto_12453 ?auto_12460 ) ( ON ?auto_12453 ?auto_12455 ) ( CLEAR ?auto_12453 ) ( not ( = ?auto_12453 ?auto_12455 ) ) ( not ( = ?auto_12454 ?auto_12455 ) ) ( SURFACE-AT ?auto_12456 ?auto_12459 ) ( CLEAR ?auto_12456 ) ( IS-CRATE ?auto_12454 ) ( not ( = ?auto_12453 ?auto_12456 ) ) ( not ( = ?auto_12454 ?auto_12456 ) ) ( not ( = ?auto_12455 ?auto_12456 ) ) ( AVAILABLE ?auto_12457 ) ( TRUCK-AT ?auto_12458 ?auto_12460 ) ( LIFTING ?auto_12461 ?auto_12454 ) )
    :subtasks
    ( ( !LOAD ?auto_12461 ?auto_12454 ?auto_12458 ?auto_12460 )
      ( MAKE-ON ?auto_12453 ?auto_12454 )
      ( MAKE-ON-VERIFY ?auto_12453 ?auto_12454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12462 - SURFACE
      ?auto_12463 - SURFACE
    )
    :vars
    (
      ?auto_12469 - HOIST
      ?auto_12470 - PLACE
      ?auto_12467 - PLACE
      ?auto_12466 - HOIST
      ?auto_12464 - SURFACE
      ?auto_12468 - SURFACE
      ?auto_12465 - TRUCK
      ?auto_12471 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12469 ?auto_12470 ) ( IS-CRATE ?auto_12462 ) ( not ( = ?auto_12462 ?auto_12463 ) ) ( not ( = ?auto_12467 ?auto_12470 ) ) ( HOIST-AT ?auto_12466 ?auto_12467 ) ( not ( = ?auto_12469 ?auto_12466 ) ) ( SURFACE-AT ?auto_12462 ?auto_12467 ) ( ON ?auto_12462 ?auto_12464 ) ( CLEAR ?auto_12462 ) ( not ( = ?auto_12462 ?auto_12464 ) ) ( not ( = ?auto_12463 ?auto_12464 ) ) ( SURFACE-AT ?auto_12468 ?auto_12470 ) ( CLEAR ?auto_12468 ) ( IS-CRATE ?auto_12463 ) ( not ( = ?auto_12462 ?auto_12468 ) ) ( not ( = ?auto_12463 ?auto_12468 ) ) ( not ( = ?auto_12464 ?auto_12468 ) ) ( AVAILABLE ?auto_12469 ) ( TRUCK-AT ?auto_12465 ?auto_12467 ) ( AVAILABLE ?auto_12466 ) ( SURFACE-AT ?auto_12463 ?auto_12467 ) ( ON ?auto_12463 ?auto_12471 ) ( CLEAR ?auto_12463 ) ( not ( = ?auto_12462 ?auto_12471 ) ) ( not ( = ?auto_12463 ?auto_12471 ) ) ( not ( = ?auto_12464 ?auto_12471 ) ) ( not ( = ?auto_12468 ?auto_12471 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12466 ?auto_12463 ?auto_12471 ?auto_12467 )
      ( MAKE-ON ?auto_12462 ?auto_12463 )
      ( MAKE-ON-VERIFY ?auto_12462 ?auto_12463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12472 - SURFACE
      ?auto_12473 - SURFACE
    )
    :vars
    (
      ?auto_12477 - HOIST
      ?auto_12476 - PLACE
      ?auto_12474 - PLACE
      ?auto_12480 - HOIST
      ?auto_12481 - SURFACE
      ?auto_12478 - SURFACE
      ?auto_12475 - SURFACE
      ?auto_12479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12477 ?auto_12476 ) ( IS-CRATE ?auto_12472 ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( not ( = ?auto_12474 ?auto_12476 ) ) ( HOIST-AT ?auto_12480 ?auto_12474 ) ( not ( = ?auto_12477 ?auto_12480 ) ) ( SURFACE-AT ?auto_12472 ?auto_12474 ) ( ON ?auto_12472 ?auto_12481 ) ( CLEAR ?auto_12472 ) ( not ( = ?auto_12472 ?auto_12481 ) ) ( not ( = ?auto_12473 ?auto_12481 ) ) ( SURFACE-AT ?auto_12478 ?auto_12476 ) ( CLEAR ?auto_12478 ) ( IS-CRATE ?auto_12473 ) ( not ( = ?auto_12472 ?auto_12478 ) ) ( not ( = ?auto_12473 ?auto_12478 ) ) ( not ( = ?auto_12481 ?auto_12478 ) ) ( AVAILABLE ?auto_12477 ) ( AVAILABLE ?auto_12480 ) ( SURFACE-AT ?auto_12473 ?auto_12474 ) ( ON ?auto_12473 ?auto_12475 ) ( CLEAR ?auto_12473 ) ( not ( = ?auto_12472 ?auto_12475 ) ) ( not ( = ?auto_12473 ?auto_12475 ) ) ( not ( = ?auto_12481 ?auto_12475 ) ) ( not ( = ?auto_12478 ?auto_12475 ) ) ( TRUCK-AT ?auto_12479 ?auto_12476 ) )
    :subtasks
    ( ( !DRIVE ?auto_12479 ?auto_12476 ?auto_12474 )
      ( MAKE-ON ?auto_12472 ?auto_12473 )
      ( MAKE-ON-VERIFY ?auto_12472 ?auto_12473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12482 - SURFACE
      ?auto_12483 - SURFACE
    )
    :vars
    (
      ?auto_12485 - HOIST
      ?auto_12491 - PLACE
      ?auto_12487 - PLACE
      ?auto_12484 - HOIST
      ?auto_12488 - SURFACE
      ?auto_12490 - SURFACE
      ?auto_12489 - SURFACE
      ?auto_12486 - TRUCK
      ?auto_12492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12485 ?auto_12491 ) ( IS-CRATE ?auto_12482 ) ( not ( = ?auto_12482 ?auto_12483 ) ) ( not ( = ?auto_12487 ?auto_12491 ) ) ( HOIST-AT ?auto_12484 ?auto_12487 ) ( not ( = ?auto_12485 ?auto_12484 ) ) ( SURFACE-AT ?auto_12482 ?auto_12487 ) ( ON ?auto_12482 ?auto_12488 ) ( CLEAR ?auto_12482 ) ( not ( = ?auto_12482 ?auto_12488 ) ) ( not ( = ?auto_12483 ?auto_12488 ) ) ( IS-CRATE ?auto_12483 ) ( not ( = ?auto_12482 ?auto_12490 ) ) ( not ( = ?auto_12483 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( AVAILABLE ?auto_12484 ) ( SURFACE-AT ?auto_12483 ?auto_12487 ) ( ON ?auto_12483 ?auto_12489 ) ( CLEAR ?auto_12483 ) ( not ( = ?auto_12482 ?auto_12489 ) ) ( not ( = ?auto_12483 ?auto_12489 ) ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( not ( = ?auto_12490 ?auto_12489 ) ) ( TRUCK-AT ?auto_12486 ?auto_12491 ) ( SURFACE-AT ?auto_12492 ?auto_12491 ) ( CLEAR ?auto_12492 ) ( LIFTING ?auto_12485 ?auto_12490 ) ( IS-CRATE ?auto_12490 ) ( not ( = ?auto_12482 ?auto_12492 ) ) ( not ( = ?auto_12483 ?auto_12492 ) ) ( not ( = ?auto_12488 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) )
    :subtasks
    ( ( !DROP ?auto_12485 ?auto_12490 ?auto_12492 ?auto_12491 )
      ( MAKE-ON ?auto_12482 ?auto_12483 )
      ( MAKE-ON-VERIFY ?auto_12482 ?auto_12483 ) )
  )

)

