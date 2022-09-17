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
      ?auto_45329 - SURFACE
      ?auto_45330 - SURFACE
    )
    :vars
    (
      ?auto_45331 - HOIST
      ?auto_45332 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45331 ?auto_45332 ) ( SURFACE-AT ?auto_45330 ?auto_45332 ) ( CLEAR ?auto_45330 ) ( LIFTING ?auto_45331 ?auto_45329 ) ( IS-CRATE ?auto_45329 ) ( not ( = ?auto_45329 ?auto_45330 ) ) )
    :subtasks
    ( ( !DROP ?auto_45331 ?auto_45329 ?auto_45330 ?auto_45332 )
      ( MAKE-ON-VERIFY ?auto_45329 ?auto_45330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45333 - SURFACE
      ?auto_45334 - SURFACE
    )
    :vars
    (
      ?auto_45336 - HOIST
      ?auto_45335 - PLACE
      ?auto_45337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45336 ?auto_45335 ) ( SURFACE-AT ?auto_45334 ?auto_45335 ) ( CLEAR ?auto_45334 ) ( IS-CRATE ?auto_45333 ) ( not ( = ?auto_45333 ?auto_45334 ) ) ( TRUCK-AT ?auto_45337 ?auto_45335 ) ( AVAILABLE ?auto_45336 ) ( IN ?auto_45333 ?auto_45337 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45336 ?auto_45333 ?auto_45337 ?auto_45335 )
      ( MAKE-ON ?auto_45333 ?auto_45334 )
      ( MAKE-ON-VERIFY ?auto_45333 ?auto_45334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45338 - SURFACE
      ?auto_45339 - SURFACE
    )
    :vars
    (
      ?auto_45342 - HOIST
      ?auto_45341 - PLACE
      ?auto_45340 - TRUCK
      ?auto_45343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45342 ?auto_45341 ) ( SURFACE-AT ?auto_45339 ?auto_45341 ) ( CLEAR ?auto_45339 ) ( IS-CRATE ?auto_45338 ) ( not ( = ?auto_45338 ?auto_45339 ) ) ( AVAILABLE ?auto_45342 ) ( IN ?auto_45338 ?auto_45340 ) ( TRUCK-AT ?auto_45340 ?auto_45343 ) ( not ( = ?auto_45343 ?auto_45341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45340 ?auto_45343 ?auto_45341 )
      ( MAKE-ON ?auto_45338 ?auto_45339 )
      ( MAKE-ON-VERIFY ?auto_45338 ?auto_45339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45344 - SURFACE
      ?auto_45345 - SURFACE
    )
    :vars
    (
      ?auto_45346 - HOIST
      ?auto_45348 - PLACE
      ?auto_45349 - TRUCK
      ?auto_45347 - PLACE
      ?auto_45350 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45346 ?auto_45348 ) ( SURFACE-AT ?auto_45345 ?auto_45348 ) ( CLEAR ?auto_45345 ) ( IS-CRATE ?auto_45344 ) ( not ( = ?auto_45344 ?auto_45345 ) ) ( AVAILABLE ?auto_45346 ) ( TRUCK-AT ?auto_45349 ?auto_45347 ) ( not ( = ?auto_45347 ?auto_45348 ) ) ( HOIST-AT ?auto_45350 ?auto_45347 ) ( LIFTING ?auto_45350 ?auto_45344 ) ( not ( = ?auto_45346 ?auto_45350 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45350 ?auto_45344 ?auto_45349 ?auto_45347 )
      ( MAKE-ON ?auto_45344 ?auto_45345 )
      ( MAKE-ON-VERIFY ?auto_45344 ?auto_45345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45351 - SURFACE
      ?auto_45352 - SURFACE
    )
    :vars
    (
      ?auto_45354 - HOIST
      ?auto_45356 - PLACE
      ?auto_45355 - TRUCK
      ?auto_45353 - PLACE
      ?auto_45357 - HOIST
      ?auto_45358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45354 ?auto_45356 ) ( SURFACE-AT ?auto_45352 ?auto_45356 ) ( CLEAR ?auto_45352 ) ( IS-CRATE ?auto_45351 ) ( not ( = ?auto_45351 ?auto_45352 ) ) ( AVAILABLE ?auto_45354 ) ( TRUCK-AT ?auto_45355 ?auto_45353 ) ( not ( = ?auto_45353 ?auto_45356 ) ) ( HOIST-AT ?auto_45357 ?auto_45353 ) ( not ( = ?auto_45354 ?auto_45357 ) ) ( AVAILABLE ?auto_45357 ) ( SURFACE-AT ?auto_45351 ?auto_45353 ) ( ON ?auto_45351 ?auto_45358 ) ( CLEAR ?auto_45351 ) ( not ( = ?auto_45351 ?auto_45358 ) ) ( not ( = ?auto_45352 ?auto_45358 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45357 ?auto_45351 ?auto_45358 ?auto_45353 )
      ( MAKE-ON ?auto_45351 ?auto_45352 )
      ( MAKE-ON-VERIFY ?auto_45351 ?auto_45352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45359 - SURFACE
      ?auto_45360 - SURFACE
    )
    :vars
    (
      ?auto_45365 - HOIST
      ?auto_45366 - PLACE
      ?auto_45361 - PLACE
      ?auto_45363 - HOIST
      ?auto_45362 - SURFACE
      ?auto_45364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45365 ?auto_45366 ) ( SURFACE-AT ?auto_45360 ?auto_45366 ) ( CLEAR ?auto_45360 ) ( IS-CRATE ?auto_45359 ) ( not ( = ?auto_45359 ?auto_45360 ) ) ( AVAILABLE ?auto_45365 ) ( not ( = ?auto_45361 ?auto_45366 ) ) ( HOIST-AT ?auto_45363 ?auto_45361 ) ( not ( = ?auto_45365 ?auto_45363 ) ) ( AVAILABLE ?auto_45363 ) ( SURFACE-AT ?auto_45359 ?auto_45361 ) ( ON ?auto_45359 ?auto_45362 ) ( CLEAR ?auto_45359 ) ( not ( = ?auto_45359 ?auto_45362 ) ) ( not ( = ?auto_45360 ?auto_45362 ) ) ( TRUCK-AT ?auto_45364 ?auto_45366 ) )
    :subtasks
    ( ( !DRIVE ?auto_45364 ?auto_45366 ?auto_45361 )
      ( MAKE-ON ?auto_45359 ?auto_45360 )
      ( MAKE-ON-VERIFY ?auto_45359 ?auto_45360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45407 - SURFACE
      ?auto_45408 - SURFACE
    )
    :vars
    (
      ?auto_45414 - HOIST
      ?auto_45409 - PLACE
      ?auto_45411 - PLACE
      ?auto_45413 - HOIST
      ?auto_45412 - SURFACE
      ?auto_45410 - TRUCK
      ?auto_45415 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45414 ?auto_45409 ) ( IS-CRATE ?auto_45407 ) ( not ( = ?auto_45407 ?auto_45408 ) ) ( not ( = ?auto_45411 ?auto_45409 ) ) ( HOIST-AT ?auto_45413 ?auto_45411 ) ( not ( = ?auto_45414 ?auto_45413 ) ) ( AVAILABLE ?auto_45413 ) ( SURFACE-AT ?auto_45407 ?auto_45411 ) ( ON ?auto_45407 ?auto_45412 ) ( CLEAR ?auto_45407 ) ( not ( = ?auto_45407 ?auto_45412 ) ) ( not ( = ?auto_45408 ?auto_45412 ) ) ( TRUCK-AT ?auto_45410 ?auto_45409 ) ( SURFACE-AT ?auto_45415 ?auto_45409 ) ( CLEAR ?auto_45415 ) ( LIFTING ?auto_45414 ?auto_45408 ) ( IS-CRATE ?auto_45408 ) ( not ( = ?auto_45407 ?auto_45415 ) ) ( not ( = ?auto_45408 ?auto_45415 ) ) ( not ( = ?auto_45412 ?auto_45415 ) ) )
    :subtasks
    ( ( !DROP ?auto_45414 ?auto_45408 ?auto_45415 ?auto_45409 )
      ( MAKE-ON ?auto_45407 ?auto_45408 )
      ( MAKE-ON-VERIFY ?auto_45407 ?auto_45408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45416 - SURFACE
      ?auto_45417 - SURFACE
    )
    :vars
    (
      ?auto_45422 - HOIST
      ?auto_45421 - PLACE
      ?auto_45424 - PLACE
      ?auto_45423 - HOIST
      ?auto_45419 - SURFACE
      ?auto_45420 - TRUCK
      ?auto_45418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45422 ?auto_45421 ) ( IS-CRATE ?auto_45416 ) ( not ( = ?auto_45416 ?auto_45417 ) ) ( not ( = ?auto_45424 ?auto_45421 ) ) ( HOIST-AT ?auto_45423 ?auto_45424 ) ( not ( = ?auto_45422 ?auto_45423 ) ) ( AVAILABLE ?auto_45423 ) ( SURFACE-AT ?auto_45416 ?auto_45424 ) ( ON ?auto_45416 ?auto_45419 ) ( CLEAR ?auto_45416 ) ( not ( = ?auto_45416 ?auto_45419 ) ) ( not ( = ?auto_45417 ?auto_45419 ) ) ( TRUCK-AT ?auto_45420 ?auto_45421 ) ( SURFACE-AT ?auto_45418 ?auto_45421 ) ( CLEAR ?auto_45418 ) ( IS-CRATE ?auto_45417 ) ( not ( = ?auto_45416 ?auto_45418 ) ) ( not ( = ?auto_45417 ?auto_45418 ) ) ( not ( = ?auto_45419 ?auto_45418 ) ) ( AVAILABLE ?auto_45422 ) ( IN ?auto_45417 ?auto_45420 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45422 ?auto_45417 ?auto_45420 ?auto_45421 )
      ( MAKE-ON ?auto_45416 ?auto_45417 )
      ( MAKE-ON-VERIFY ?auto_45416 ?auto_45417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45431 - SURFACE
      ?auto_45432 - SURFACE
    )
    :vars
    (
      ?auto_45434 - HOIST
      ?auto_45433 - PLACE
      ?auto_45438 - PLACE
      ?auto_45435 - HOIST
      ?auto_45437 - SURFACE
      ?auto_45436 - TRUCK
      ?auto_45439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45434 ?auto_45433 ) ( SURFACE-AT ?auto_45432 ?auto_45433 ) ( CLEAR ?auto_45432 ) ( IS-CRATE ?auto_45431 ) ( not ( = ?auto_45431 ?auto_45432 ) ) ( AVAILABLE ?auto_45434 ) ( not ( = ?auto_45438 ?auto_45433 ) ) ( HOIST-AT ?auto_45435 ?auto_45438 ) ( not ( = ?auto_45434 ?auto_45435 ) ) ( AVAILABLE ?auto_45435 ) ( SURFACE-AT ?auto_45431 ?auto_45438 ) ( ON ?auto_45431 ?auto_45437 ) ( CLEAR ?auto_45431 ) ( not ( = ?auto_45431 ?auto_45437 ) ) ( not ( = ?auto_45432 ?auto_45437 ) ) ( TRUCK-AT ?auto_45436 ?auto_45439 ) ( not ( = ?auto_45439 ?auto_45433 ) ) ( not ( = ?auto_45438 ?auto_45439 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45436 ?auto_45439 ?auto_45433 )
      ( MAKE-ON ?auto_45431 ?auto_45432 )
      ( MAKE-ON-VERIFY ?auto_45431 ?auto_45432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45725 - SURFACE
      ?auto_45726 - SURFACE
    )
    :vars
    (
      ?auto_45728 - HOIST
      ?auto_45729 - PLACE
      ?auto_45731 - TRUCK
      ?auto_45727 - PLACE
      ?auto_45730 - HOIST
      ?auto_45732 - SURFACE
      ?auto_45733 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45728 ?auto_45729 ) ( SURFACE-AT ?auto_45726 ?auto_45729 ) ( CLEAR ?auto_45726 ) ( IS-CRATE ?auto_45725 ) ( not ( = ?auto_45725 ?auto_45726 ) ) ( AVAILABLE ?auto_45728 ) ( TRUCK-AT ?auto_45731 ?auto_45727 ) ( not ( = ?auto_45727 ?auto_45729 ) ) ( HOIST-AT ?auto_45730 ?auto_45727 ) ( not ( = ?auto_45728 ?auto_45730 ) ) ( SURFACE-AT ?auto_45725 ?auto_45727 ) ( ON ?auto_45725 ?auto_45732 ) ( CLEAR ?auto_45725 ) ( not ( = ?auto_45725 ?auto_45732 ) ) ( not ( = ?auto_45726 ?auto_45732 ) ) ( LIFTING ?auto_45730 ?auto_45733 ) ( IS-CRATE ?auto_45733 ) ( not ( = ?auto_45725 ?auto_45733 ) ) ( not ( = ?auto_45726 ?auto_45733 ) ) ( not ( = ?auto_45732 ?auto_45733 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45730 ?auto_45733 ?auto_45731 ?auto_45727 )
      ( MAKE-ON ?auto_45725 ?auto_45726 )
      ( MAKE-ON-VERIFY ?auto_45725 ?auto_45726 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45853 - SURFACE
      ?auto_45854 - SURFACE
    )
    :vars
    (
      ?auto_45855 - HOIST
      ?auto_45857 - PLACE
      ?auto_45856 - PLACE
      ?auto_45858 - HOIST
      ?auto_45860 - SURFACE
      ?auto_45859 - TRUCK
      ?auto_45861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45855 ?auto_45857 ) ( SURFACE-AT ?auto_45854 ?auto_45857 ) ( CLEAR ?auto_45854 ) ( IS-CRATE ?auto_45853 ) ( not ( = ?auto_45853 ?auto_45854 ) ) ( not ( = ?auto_45856 ?auto_45857 ) ) ( HOIST-AT ?auto_45858 ?auto_45856 ) ( not ( = ?auto_45855 ?auto_45858 ) ) ( AVAILABLE ?auto_45858 ) ( SURFACE-AT ?auto_45853 ?auto_45856 ) ( ON ?auto_45853 ?auto_45860 ) ( CLEAR ?auto_45853 ) ( not ( = ?auto_45853 ?auto_45860 ) ) ( not ( = ?auto_45854 ?auto_45860 ) ) ( TRUCK-AT ?auto_45859 ?auto_45857 ) ( LIFTING ?auto_45855 ?auto_45861 ) ( IS-CRATE ?auto_45861 ) ( not ( = ?auto_45853 ?auto_45861 ) ) ( not ( = ?auto_45854 ?auto_45861 ) ) ( not ( = ?auto_45860 ?auto_45861 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45855 ?auto_45861 ?auto_45859 ?auto_45857 )
      ( MAKE-ON ?auto_45853 ?auto_45854 )
      ( MAKE-ON-VERIFY ?auto_45853 ?auto_45854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46057 - SURFACE
      ?auto_46058 - SURFACE
    )
    :vars
    (
      ?auto_46063 - HOIST
      ?auto_46060 - PLACE
      ?auto_46059 - PLACE
      ?auto_46062 - HOIST
      ?auto_46065 - SURFACE
      ?auto_46064 - SURFACE
      ?auto_46061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46063 ?auto_46060 ) ( IS-CRATE ?auto_46057 ) ( not ( = ?auto_46057 ?auto_46058 ) ) ( not ( = ?auto_46059 ?auto_46060 ) ) ( HOIST-AT ?auto_46062 ?auto_46059 ) ( not ( = ?auto_46063 ?auto_46062 ) ) ( AVAILABLE ?auto_46062 ) ( SURFACE-AT ?auto_46057 ?auto_46059 ) ( ON ?auto_46057 ?auto_46065 ) ( CLEAR ?auto_46057 ) ( not ( = ?auto_46057 ?auto_46065 ) ) ( not ( = ?auto_46058 ?auto_46065 ) ) ( SURFACE-AT ?auto_46064 ?auto_46060 ) ( CLEAR ?auto_46064 ) ( IS-CRATE ?auto_46058 ) ( not ( = ?auto_46057 ?auto_46064 ) ) ( not ( = ?auto_46058 ?auto_46064 ) ) ( not ( = ?auto_46065 ?auto_46064 ) ) ( AVAILABLE ?auto_46063 ) ( IN ?auto_46058 ?auto_46061 ) ( TRUCK-AT ?auto_46061 ?auto_46059 ) )
    :subtasks
    ( ( !DRIVE ?auto_46061 ?auto_46059 ?auto_46060 )
      ( MAKE-ON ?auto_46057 ?auto_46058 )
      ( MAKE-ON-VERIFY ?auto_46057 ?auto_46058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46066 - SURFACE
      ?auto_46067 - SURFACE
    )
    :vars
    (
      ?auto_46073 - HOIST
      ?auto_46068 - PLACE
      ?auto_46072 - PLACE
      ?auto_46071 - HOIST
      ?auto_46069 - SURFACE
      ?auto_46074 - SURFACE
      ?auto_46070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46073 ?auto_46068 ) ( IS-CRATE ?auto_46066 ) ( not ( = ?auto_46066 ?auto_46067 ) ) ( not ( = ?auto_46072 ?auto_46068 ) ) ( HOIST-AT ?auto_46071 ?auto_46072 ) ( not ( = ?auto_46073 ?auto_46071 ) ) ( SURFACE-AT ?auto_46066 ?auto_46072 ) ( ON ?auto_46066 ?auto_46069 ) ( CLEAR ?auto_46066 ) ( not ( = ?auto_46066 ?auto_46069 ) ) ( not ( = ?auto_46067 ?auto_46069 ) ) ( SURFACE-AT ?auto_46074 ?auto_46068 ) ( CLEAR ?auto_46074 ) ( IS-CRATE ?auto_46067 ) ( not ( = ?auto_46066 ?auto_46074 ) ) ( not ( = ?auto_46067 ?auto_46074 ) ) ( not ( = ?auto_46069 ?auto_46074 ) ) ( AVAILABLE ?auto_46073 ) ( TRUCK-AT ?auto_46070 ?auto_46072 ) ( LIFTING ?auto_46071 ?auto_46067 ) )
    :subtasks
    ( ( !LOAD ?auto_46071 ?auto_46067 ?auto_46070 ?auto_46072 )
      ( MAKE-ON ?auto_46066 ?auto_46067 )
      ( MAKE-ON-VERIFY ?auto_46066 ?auto_46067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46075 - SURFACE
      ?auto_46076 - SURFACE
    )
    :vars
    (
      ?auto_46078 - HOIST
      ?auto_46077 - PLACE
      ?auto_46079 - PLACE
      ?auto_46080 - HOIST
      ?auto_46082 - SURFACE
      ?auto_46083 - SURFACE
      ?auto_46081 - TRUCK
      ?auto_46084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46078 ?auto_46077 ) ( IS-CRATE ?auto_46075 ) ( not ( = ?auto_46075 ?auto_46076 ) ) ( not ( = ?auto_46079 ?auto_46077 ) ) ( HOIST-AT ?auto_46080 ?auto_46079 ) ( not ( = ?auto_46078 ?auto_46080 ) ) ( SURFACE-AT ?auto_46075 ?auto_46079 ) ( ON ?auto_46075 ?auto_46082 ) ( CLEAR ?auto_46075 ) ( not ( = ?auto_46075 ?auto_46082 ) ) ( not ( = ?auto_46076 ?auto_46082 ) ) ( SURFACE-AT ?auto_46083 ?auto_46077 ) ( CLEAR ?auto_46083 ) ( IS-CRATE ?auto_46076 ) ( not ( = ?auto_46075 ?auto_46083 ) ) ( not ( = ?auto_46076 ?auto_46083 ) ) ( not ( = ?auto_46082 ?auto_46083 ) ) ( AVAILABLE ?auto_46078 ) ( TRUCK-AT ?auto_46081 ?auto_46079 ) ( AVAILABLE ?auto_46080 ) ( SURFACE-AT ?auto_46076 ?auto_46079 ) ( ON ?auto_46076 ?auto_46084 ) ( CLEAR ?auto_46076 ) ( not ( = ?auto_46075 ?auto_46084 ) ) ( not ( = ?auto_46076 ?auto_46084 ) ) ( not ( = ?auto_46082 ?auto_46084 ) ) ( not ( = ?auto_46083 ?auto_46084 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46080 ?auto_46076 ?auto_46084 ?auto_46079 )
      ( MAKE-ON ?auto_46075 ?auto_46076 )
      ( MAKE-ON-VERIFY ?auto_46075 ?auto_46076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46085 - SURFACE
      ?auto_46086 - SURFACE
    )
    :vars
    (
      ?auto_46087 - HOIST
      ?auto_46091 - PLACE
      ?auto_46094 - PLACE
      ?auto_46090 - HOIST
      ?auto_46089 - SURFACE
      ?auto_46088 - SURFACE
      ?auto_46092 - SURFACE
      ?auto_46093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46087 ?auto_46091 ) ( IS-CRATE ?auto_46085 ) ( not ( = ?auto_46085 ?auto_46086 ) ) ( not ( = ?auto_46094 ?auto_46091 ) ) ( HOIST-AT ?auto_46090 ?auto_46094 ) ( not ( = ?auto_46087 ?auto_46090 ) ) ( SURFACE-AT ?auto_46085 ?auto_46094 ) ( ON ?auto_46085 ?auto_46089 ) ( CLEAR ?auto_46085 ) ( not ( = ?auto_46085 ?auto_46089 ) ) ( not ( = ?auto_46086 ?auto_46089 ) ) ( SURFACE-AT ?auto_46088 ?auto_46091 ) ( CLEAR ?auto_46088 ) ( IS-CRATE ?auto_46086 ) ( not ( = ?auto_46085 ?auto_46088 ) ) ( not ( = ?auto_46086 ?auto_46088 ) ) ( not ( = ?auto_46089 ?auto_46088 ) ) ( AVAILABLE ?auto_46087 ) ( AVAILABLE ?auto_46090 ) ( SURFACE-AT ?auto_46086 ?auto_46094 ) ( ON ?auto_46086 ?auto_46092 ) ( CLEAR ?auto_46086 ) ( not ( = ?auto_46085 ?auto_46092 ) ) ( not ( = ?auto_46086 ?auto_46092 ) ) ( not ( = ?auto_46089 ?auto_46092 ) ) ( not ( = ?auto_46088 ?auto_46092 ) ) ( TRUCK-AT ?auto_46093 ?auto_46091 ) )
    :subtasks
    ( ( !DRIVE ?auto_46093 ?auto_46091 ?auto_46094 )
      ( MAKE-ON ?auto_46085 ?auto_46086 )
      ( MAKE-ON-VERIFY ?auto_46085 ?auto_46086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46095 - SURFACE
      ?auto_46096 - SURFACE
    )
    :vars
    (
      ?auto_46098 - HOIST
      ?auto_46097 - PLACE
      ?auto_46101 - PLACE
      ?auto_46100 - HOIST
      ?auto_46103 - SURFACE
      ?auto_46099 - SURFACE
      ?auto_46104 - SURFACE
      ?auto_46102 - TRUCK
      ?auto_46105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46098 ?auto_46097 ) ( IS-CRATE ?auto_46095 ) ( not ( = ?auto_46095 ?auto_46096 ) ) ( not ( = ?auto_46101 ?auto_46097 ) ) ( HOIST-AT ?auto_46100 ?auto_46101 ) ( not ( = ?auto_46098 ?auto_46100 ) ) ( SURFACE-AT ?auto_46095 ?auto_46101 ) ( ON ?auto_46095 ?auto_46103 ) ( CLEAR ?auto_46095 ) ( not ( = ?auto_46095 ?auto_46103 ) ) ( not ( = ?auto_46096 ?auto_46103 ) ) ( IS-CRATE ?auto_46096 ) ( not ( = ?auto_46095 ?auto_46099 ) ) ( not ( = ?auto_46096 ?auto_46099 ) ) ( not ( = ?auto_46103 ?auto_46099 ) ) ( AVAILABLE ?auto_46100 ) ( SURFACE-AT ?auto_46096 ?auto_46101 ) ( ON ?auto_46096 ?auto_46104 ) ( CLEAR ?auto_46096 ) ( not ( = ?auto_46095 ?auto_46104 ) ) ( not ( = ?auto_46096 ?auto_46104 ) ) ( not ( = ?auto_46103 ?auto_46104 ) ) ( not ( = ?auto_46099 ?auto_46104 ) ) ( TRUCK-AT ?auto_46102 ?auto_46097 ) ( SURFACE-AT ?auto_46105 ?auto_46097 ) ( CLEAR ?auto_46105 ) ( LIFTING ?auto_46098 ?auto_46099 ) ( IS-CRATE ?auto_46099 ) ( not ( = ?auto_46095 ?auto_46105 ) ) ( not ( = ?auto_46096 ?auto_46105 ) ) ( not ( = ?auto_46103 ?auto_46105 ) ) ( not ( = ?auto_46099 ?auto_46105 ) ) ( not ( = ?auto_46104 ?auto_46105 ) ) )
    :subtasks
    ( ( !DROP ?auto_46098 ?auto_46099 ?auto_46105 ?auto_46097 )
      ( MAKE-ON ?auto_46095 ?auto_46096 )
      ( MAKE-ON-VERIFY ?auto_46095 ?auto_46096 ) )
  )

)

