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
      ?auto_50725 - SURFACE
      ?auto_50726 - SURFACE
    )
    :vars
    (
      ?auto_50727 - HOIST
      ?auto_50728 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50727 ?auto_50728 ) ( SURFACE-AT ?auto_50726 ?auto_50728 ) ( CLEAR ?auto_50726 ) ( LIFTING ?auto_50727 ?auto_50725 ) ( IS-CRATE ?auto_50725 ) ( not ( = ?auto_50725 ?auto_50726 ) ) )
    :subtasks
    ( ( !DROP ?auto_50727 ?auto_50725 ?auto_50726 ?auto_50728 )
      ( MAKE-ON-VERIFY ?auto_50725 ?auto_50726 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50729 - SURFACE
      ?auto_50730 - SURFACE
    )
    :vars
    (
      ?auto_50732 - HOIST
      ?auto_50731 - PLACE
      ?auto_50733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50732 ?auto_50731 ) ( SURFACE-AT ?auto_50730 ?auto_50731 ) ( CLEAR ?auto_50730 ) ( IS-CRATE ?auto_50729 ) ( not ( = ?auto_50729 ?auto_50730 ) ) ( TRUCK-AT ?auto_50733 ?auto_50731 ) ( AVAILABLE ?auto_50732 ) ( IN ?auto_50729 ?auto_50733 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50732 ?auto_50729 ?auto_50733 ?auto_50731 )
      ( MAKE-ON ?auto_50729 ?auto_50730 )
      ( MAKE-ON-VERIFY ?auto_50729 ?auto_50730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50734 - SURFACE
      ?auto_50735 - SURFACE
    )
    :vars
    (
      ?auto_50737 - HOIST
      ?auto_50738 - PLACE
      ?auto_50736 - TRUCK
      ?auto_50739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50737 ?auto_50738 ) ( SURFACE-AT ?auto_50735 ?auto_50738 ) ( CLEAR ?auto_50735 ) ( IS-CRATE ?auto_50734 ) ( not ( = ?auto_50734 ?auto_50735 ) ) ( AVAILABLE ?auto_50737 ) ( IN ?auto_50734 ?auto_50736 ) ( TRUCK-AT ?auto_50736 ?auto_50739 ) ( not ( = ?auto_50739 ?auto_50738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50736 ?auto_50739 ?auto_50738 )
      ( MAKE-ON ?auto_50734 ?auto_50735 )
      ( MAKE-ON-VERIFY ?auto_50734 ?auto_50735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50740 - SURFACE
      ?auto_50741 - SURFACE
    )
    :vars
    (
      ?auto_50745 - HOIST
      ?auto_50742 - PLACE
      ?auto_50743 - TRUCK
      ?auto_50744 - PLACE
      ?auto_50746 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50745 ?auto_50742 ) ( SURFACE-AT ?auto_50741 ?auto_50742 ) ( CLEAR ?auto_50741 ) ( IS-CRATE ?auto_50740 ) ( not ( = ?auto_50740 ?auto_50741 ) ) ( AVAILABLE ?auto_50745 ) ( TRUCK-AT ?auto_50743 ?auto_50744 ) ( not ( = ?auto_50744 ?auto_50742 ) ) ( HOIST-AT ?auto_50746 ?auto_50744 ) ( LIFTING ?auto_50746 ?auto_50740 ) ( not ( = ?auto_50745 ?auto_50746 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50746 ?auto_50740 ?auto_50743 ?auto_50744 )
      ( MAKE-ON ?auto_50740 ?auto_50741 )
      ( MAKE-ON-VERIFY ?auto_50740 ?auto_50741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50747 - SURFACE
      ?auto_50748 - SURFACE
    )
    :vars
    (
      ?auto_50753 - HOIST
      ?auto_50751 - PLACE
      ?auto_50749 - TRUCK
      ?auto_50752 - PLACE
      ?auto_50750 - HOIST
      ?auto_50754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50753 ?auto_50751 ) ( SURFACE-AT ?auto_50748 ?auto_50751 ) ( CLEAR ?auto_50748 ) ( IS-CRATE ?auto_50747 ) ( not ( = ?auto_50747 ?auto_50748 ) ) ( AVAILABLE ?auto_50753 ) ( TRUCK-AT ?auto_50749 ?auto_50752 ) ( not ( = ?auto_50752 ?auto_50751 ) ) ( HOIST-AT ?auto_50750 ?auto_50752 ) ( not ( = ?auto_50753 ?auto_50750 ) ) ( AVAILABLE ?auto_50750 ) ( SURFACE-AT ?auto_50747 ?auto_50752 ) ( ON ?auto_50747 ?auto_50754 ) ( CLEAR ?auto_50747 ) ( not ( = ?auto_50747 ?auto_50754 ) ) ( not ( = ?auto_50748 ?auto_50754 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50750 ?auto_50747 ?auto_50754 ?auto_50752 )
      ( MAKE-ON ?auto_50747 ?auto_50748 )
      ( MAKE-ON-VERIFY ?auto_50747 ?auto_50748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50755 - SURFACE
      ?auto_50756 - SURFACE
    )
    :vars
    (
      ?auto_50757 - HOIST
      ?auto_50758 - PLACE
      ?auto_50762 - PLACE
      ?auto_50761 - HOIST
      ?auto_50760 - SURFACE
      ?auto_50759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50757 ?auto_50758 ) ( SURFACE-AT ?auto_50756 ?auto_50758 ) ( CLEAR ?auto_50756 ) ( IS-CRATE ?auto_50755 ) ( not ( = ?auto_50755 ?auto_50756 ) ) ( AVAILABLE ?auto_50757 ) ( not ( = ?auto_50762 ?auto_50758 ) ) ( HOIST-AT ?auto_50761 ?auto_50762 ) ( not ( = ?auto_50757 ?auto_50761 ) ) ( AVAILABLE ?auto_50761 ) ( SURFACE-AT ?auto_50755 ?auto_50762 ) ( ON ?auto_50755 ?auto_50760 ) ( CLEAR ?auto_50755 ) ( not ( = ?auto_50755 ?auto_50760 ) ) ( not ( = ?auto_50756 ?auto_50760 ) ) ( TRUCK-AT ?auto_50759 ?auto_50758 ) )
    :subtasks
    ( ( !DRIVE ?auto_50759 ?auto_50758 ?auto_50762 )
      ( MAKE-ON ?auto_50755 ?auto_50756 )
      ( MAKE-ON-VERIFY ?auto_50755 ?auto_50756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50803 - SURFACE
      ?auto_50804 - SURFACE
    )
    :vars
    (
      ?auto_50809 - HOIST
      ?auto_50807 - PLACE
      ?auto_50808 - PLACE
      ?auto_50806 - HOIST
      ?auto_50805 - SURFACE
      ?auto_50810 - TRUCK
      ?auto_50811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50809 ?auto_50807 ) ( IS-CRATE ?auto_50803 ) ( not ( = ?auto_50803 ?auto_50804 ) ) ( not ( = ?auto_50808 ?auto_50807 ) ) ( HOIST-AT ?auto_50806 ?auto_50808 ) ( not ( = ?auto_50809 ?auto_50806 ) ) ( AVAILABLE ?auto_50806 ) ( SURFACE-AT ?auto_50803 ?auto_50808 ) ( ON ?auto_50803 ?auto_50805 ) ( CLEAR ?auto_50803 ) ( not ( = ?auto_50803 ?auto_50805 ) ) ( not ( = ?auto_50804 ?auto_50805 ) ) ( TRUCK-AT ?auto_50810 ?auto_50807 ) ( SURFACE-AT ?auto_50811 ?auto_50807 ) ( CLEAR ?auto_50811 ) ( LIFTING ?auto_50809 ?auto_50804 ) ( IS-CRATE ?auto_50804 ) ( not ( = ?auto_50803 ?auto_50811 ) ) ( not ( = ?auto_50804 ?auto_50811 ) ) ( not ( = ?auto_50805 ?auto_50811 ) ) )
    :subtasks
    ( ( !DROP ?auto_50809 ?auto_50804 ?auto_50811 ?auto_50807 )
      ( MAKE-ON ?auto_50803 ?auto_50804 )
      ( MAKE-ON-VERIFY ?auto_50803 ?auto_50804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50812 - SURFACE
      ?auto_50813 - SURFACE
    )
    :vars
    (
      ?auto_50816 - HOIST
      ?auto_50820 - PLACE
      ?auto_50815 - PLACE
      ?auto_50818 - HOIST
      ?auto_50814 - SURFACE
      ?auto_50817 - TRUCK
      ?auto_50819 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50816 ?auto_50820 ) ( IS-CRATE ?auto_50812 ) ( not ( = ?auto_50812 ?auto_50813 ) ) ( not ( = ?auto_50815 ?auto_50820 ) ) ( HOIST-AT ?auto_50818 ?auto_50815 ) ( not ( = ?auto_50816 ?auto_50818 ) ) ( AVAILABLE ?auto_50818 ) ( SURFACE-AT ?auto_50812 ?auto_50815 ) ( ON ?auto_50812 ?auto_50814 ) ( CLEAR ?auto_50812 ) ( not ( = ?auto_50812 ?auto_50814 ) ) ( not ( = ?auto_50813 ?auto_50814 ) ) ( TRUCK-AT ?auto_50817 ?auto_50820 ) ( SURFACE-AT ?auto_50819 ?auto_50820 ) ( CLEAR ?auto_50819 ) ( IS-CRATE ?auto_50813 ) ( not ( = ?auto_50812 ?auto_50819 ) ) ( not ( = ?auto_50813 ?auto_50819 ) ) ( not ( = ?auto_50814 ?auto_50819 ) ) ( AVAILABLE ?auto_50816 ) ( IN ?auto_50813 ?auto_50817 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50816 ?auto_50813 ?auto_50817 ?auto_50820 )
      ( MAKE-ON ?auto_50812 ?auto_50813 )
      ( MAKE-ON-VERIFY ?auto_50812 ?auto_50813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50827 - SURFACE
      ?auto_50828 - SURFACE
    )
    :vars
    (
      ?auto_50832 - HOIST
      ?auto_50834 - PLACE
      ?auto_50829 - PLACE
      ?auto_50833 - HOIST
      ?auto_50830 - SURFACE
      ?auto_50831 - TRUCK
      ?auto_50835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50832 ?auto_50834 ) ( SURFACE-AT ?auto_50828 ?auto_50834 ) ( CLEAR ?auto_50828 ) ( IS-CRATE ?auto_50827 ) ( not ( = ?auto_50827 ?auto_50828 ) ) ( AVAILABLE ?auto_50832 ) ( not ( = ?auto_50829 ?auto_50834 ) ) ( HOIST-AT ?auto_50833 ?auto_50829 ) ( not ( = ?auto_50832 ?auto_50833 ) ) ( AVAILABLE ?auto_50833 ) ( SURFACE-AT ?auto_50827 ?auto_50829 ) ( ON ?auto_50827 ?auto_50830 ) ( CLEAR ?auto_50827 ) ( not ( = ?auto_50827 ?auto_50830 ) ) ( not ( = ?auto_50828 ?auto_50830 ) ) ( TRUCK-AT ?auto_50831 ?auto_50835 ) ( not ( = ?auto_50835 ?auto_50834 ) ) ( not ( = ?auto_50829 ?auto_50835 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50831 ?auto_50835 ?auto_50834 )
      ( MAKE-ON ?auto_50827 ?auto_50828 )
      ( MAKE-ON-VERIFY ?auto_50827 ?auto_50828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51472 - SURFACE
      ?auto_51473 - SURFACE
    )
    :vars
    (
      ?auto_51479 - HOIST
      ?auto_51476 - PLACE
      ?auto_51477 - TRUCK
      ?auto_51478 - PLACE
      ?auto_51475 - HOIST
      ?auto_51474 - SURFACE
      ?auto_51480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51479 ?auto_51476 ) ( SURFACE-AT ?auto_51473 ?auto_51476 ) ( CLEAR ?auto_51473 ) ( IS-CRATE ?auto_51472 ) ( not ( = ?auto_51472 ?auto_51473 ) ) ( AVAILABLE ?auto_51479 ) ( TRUCK-AT ?auto_51477 ?auto_51478 ) ( not ( = ?auto_51478 ?auto_51476 ) ) ( HOIST-AT ?auto_51475 ?auto_51478 ) ( not ( = ?auto_51479 ?auto_51475 ) ) ( SURFACE-AT ?auto_51472 ?auto_51478 ) ( ON ?auto_51472 ?auto_51474 ) ( CLEAR ?auto_51472 ) ( not ( = ?auto_51472 ?auto_51474 ) ) ( not ( = ?auto_51473 ?auto_51474 ) ) ( LIFTING ?auto_51475 ?auto_51480 ) ( IS-CRATE ?auto_51480 ) ( not ( = ?auto_51472 ?auto_51480 ) ) ( not ( = ?auto_51473 ?auto_51480 ) ) ( not ( = ?auto_51474 ?auto_51480 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51475 ?auto_51480 ?auto_51477 ?auto_51478 )
      ( MAKE-ON ?auto_51472 ?auto_51473 )
      ( MAKE-ON-VERIFY ?auto_51472 ?auto_51473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51643 - SURFACE
      ?auto_51644 - SURFACE
    )
    :vars
    (
      ?auto_51647 - HOIST
      ?auto_51646 - PLACE
      ?auto_51649 - PLACE
      ?auto_51645 - HOIST
      ?auto_51648 - SURFACE
      ?auto_51650 - TRUCK
      ?auto_51651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51647 ?auto_51646 ) ( SURFACE-AT ?auto_51644 ?auto_51646 ) ( CLEAR ?auto_51644 ) ( IS-CRATE ?auto_51643 ) ( not ( = ?auto_51643 ?auto_51644 ) ) ( not ( = ?auto_51649 ?auto_51646 ) ) ( HOIST-AT ?auto_51645 ?auto_51649 ) ( not ( = ?auto_51647 ?auto_51645 ) ) ( AVAILABLE ?auto_51645 ) ( SURFACE-AT ?auto_51643 ?auto_51649 ) ( ON ?auto_51643 ?auto_51648 ) ( CLEAR ?auto_51643 ) ( not ( = ?auto_51643 ?auto_51648 ) ) ( not ( = ?auto_51644 ?auto_51648 ) ) ( TRUCK-AT ?auto_51650 ?auto_51646 ) ( LIFTING ?auto_51647 ?auto_51651 ) ( IS-CRATE ?auto_51651 ) ( not ( = ?auto_51643 ?auto_51651 ) ) ( not ( = ?auto_51644 ?auto_51651 ) ) ( not ( = ?auto_51648 ?auto_51651 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51647 ?auto_51651 ?auto_51650 ?auto_51646 )
      ( MAKE-ON ?auto_51643 ?auto_51644 )
      ( MAKE-ON-VERIFY ?auto_51643 ?auto_51644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52312 - SURFACE
      ?auto_52313 - SURFACE
    )
    :vars
    (
      ?auto_52319 - HOIST
      ?auto_52316 - PLACE
      ?auto_52315 - PLACE
      ?auto_52317 - HOIST
      ?auto_52314 - SURFACE
      ?auto_52318 - SURFACE
      ?auto_52320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52319 ?auto_52316 ) ( IS-CRATE ?auto_52312 ) ( not ( = ?auto_52312 ?auto_52313 ) ) ( not ( = ?auto_52315 ?auto_52316 ) ) ( HOIST-AT ?auto_52317 ?auto_52315 ) ( not ( = ?auto_52319 ?auto_52317 ) ) ( AVAILABLE ?auto_52317 ) ( SURFACE-AT ?auto_52312 ?auto_52315 ) ( ON ?auto_52312 ?auto_52314 ) ( CLEAR ?auto_52312 ) ( not ( = ?auto_52312 ?auto_52314 ) ) ( not ( = ?auto_52313 ?auto_52314 ) ) ( SURFACE-AT ?auto_52318 ?auto_52316 ) ( CLEAR ?auto_52318 ) ( IS-CRATE ?auto_52313 ) ( not ( = ?auto_52312 ?auto_52318 ) ) ( not ( = ?auto_52313 ?auto_52318 ) ) ( not ( = ?auto_52314 ?auto_52318 ) ) ( AVAILABLE ?auto_52319 ) ( IN ?auto_52313 ?auto_52320 ) ( TRUCK-AT ?auto_52320 ?auto_52315 ) )
    :subtasks
    ( ( !DRIVE ?auto_52320 ?auto_52315 ?auto_52316 )
      ( MAKE-ON ?auto_52312 ?auto_52313 )
      ( MAKE-ON-VERIFY ?auto_52312 ?auto_52313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52321 - SURFACE
      ?auto_52322 - SURFACE
    )
    :vars
    (
      ?auto_52329 - HOIST
      ?auto_52327 - PLACE
      ?auto_52323 - PLACE
      ?auto_52325 - HOIST
      ?auto_52324 - SURFACE
      ?auto_52326 - SURFACE
      ?auto_52328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52329 ?auto_52327 ) ( IS-CRATE ?auto_52321 ) ( not ( = ?auto_52321 ?auto_52322 ) ) ( not ( = ?auto_52323 ?auto_52327 ) ) ( HOIST-AT ?auto_52325 ?auto_52323 ) ( not ( = ?auto_52329 ?auto_52325 ) ) ( SURFACE-AT ?auto_52321 ?auto_52323 ) ( ON ?auto_52321 ?auto_52324 ) ( CLEAR ?auto_52321 ) ( not ( = ?auto_52321 ?auto_52324 ) ) ( not ( = ?auto_52322 ?auto_52324 ) ) ( SURFACE-AT ?auto_52326 ?auto_52327 ) ( CLEAR ?auto_52326 ) ( IS-CRATE ?auto_52322 ) ( not ( = ?auto_52321 ?auto_52326 ) ) ( not ( = ?auto_52322 ?auto_52326 ) ) ( not ( = ?auto_52324 ?auto_52326 ) ) ( AVAILABLE ?auto_52329 ) ( TRUCK-AT ?auto_52328 ?auto_52323 ) ( LIFTING ?auto_52325 ?auto_52322 ) )
    :subtasks
    ( ( !LOAD ?auto_52325 ?auto_52322 ?auto_52328 ?auto_52323 )
      ( MAKE-ON ?auto_52321 ?auto_52322 )
      ( MAKE-ON-VERIFY ?auto_52321 ?auto_52322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52330 - SURFACE
      ?auto_52331 - SURFACE
    )
    :vars
    (
      ?auto_52338 - HOIST
      ?auto_52335 - PLACE
      ?auto_52336 - PLACE
      ?auto_52334 - HOIST
      ?auto_52333 - SURFACE
      ?auto_52337 - SURFACE
      ?auto_52332 - TRUCK
      ?auto_52339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52338 ?auto_52335 ) ( IS-CRATE ?auto_52330 ) ( not ( = ?auto_52330 ?auto_52331 ) ) ( not ( = ?auto_52336 ?auto_52335 ) ) ( HOIST-AT ?auto_52334 ?auto_52336 ) ( not ( = ?auto_52338 ?auto_52334 ) ) ( SURFACE-AT ?auto_52330 ?auto_52336 ) ( ON ?auto_52330 ?auto_52333 ) ( CLEAR ?auto_52330 ) ( not ( = ?auto_52330 ?auto_52333 ) ) ( not ( = ?auto_52331 ?auto_52333 ) ) ( SURFACE-AT ?auto_52337 ?auto_52335 ) ( CLEAR ?auto_52337 ) ( IS-CRATE ?auto_52331 ) ( not ( = ?auto_52330 ?auto_52337 ) ) ( not ( = ?auto_52331 ?auto_52337 ) ) ( not ( = ?auto_52333 ?auto_52337 ) ) ( AVAILABLE ?auto_52338 ) ( TRUCK-AT ?auto_52332 ?auto_52336 ) ( AVAILABLE ?auto_52334 ) ( SURFACE-AT ?auto_52331 ?auto_52336 ) ( ON ?auto_52331 ?auto_52339 ) ( CLEAR ?auto_52331 ) ( not ( = ?auto_52330 ?auto_52339 ) ) ( not ( = ?auto_52331 ?auto_52339 ) ) ( not ( = ?auto_52333 ?auto_52339 ) ) ( not ( = ?auto_52337 ?auto_52339 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52334 ?auto_52331 ?auto_52339 ?auto_52336 )
      ( MAKE-ON ?auto_52330 ?auto_52331 )
      ( MAKE-ON-VERIFY ?auto_52330 ?auto_52331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52340 - SURFACE
      ?auto_52341 - SURFACE
    )
    :vars
    (
      ?auto_52345 - HOIST
      ?auto_52348 - PLACE
      ?auto_52347 - PLACE
      ?auto_52343 - HOIST
      ?auto_52342 - SURFACE
      ?auto_52346 - SURFACE
      ?auto_52344 - SURFACE
      ?auto_52349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52345 ?auto_52348 ) ( IS-CRATE ?auto_52340 ) ( not ( = ?auto_52340 ?auto_52341 ) ) ( not ( = ?auto_52347 ?auto_52348 ) ) ( HOIST-AT ?auto_52343 ?auto_52347 ) ( not ( = ?auto_52345 ?auto_52343 ) ) ( SURFACE-AT ?auto_52340 ?auto_52347 ) ( ON ?auto_52340 ?auto_52342 ) ( CLEAR ?auto_52340 ) ( not ( = ?auto_52340 ?auto_52342 ) ) ( not ( = ?auto_52341 ?auto_52342 ) ) ( SURFACE-AT ?auto_52346 ?auto_52348 ) ( CLEAR ?auto_52346 ) ( IS-CRATE ?auto_52341 ) ( not ( = ?auto_52340 ?auto_52346 ) ) ( not ( = ?auto_52341 ?auto_52346 ) ) ( not ( = ?auto_52342 ?auto_52346 ) ) ( AVAILABLE ?auto_52345 ) ( AVAILABLE ?auto_52343 ) ( SURFACE-AT ?auto_52341 ?auto_52347 ) ( ON ?auto_52341 ?auto_52344 ) ( CLEAR ?auto_52341 ) ( not ( = ?auto_52340 ?auto_52344 ) ) ( not ( = ?auto_52341 ?auto_52344 ) ) ( not ( = ?auto_52342 ?auto_52344 ) ) ( not ( = ?auto_52346 ?auto_52344 ) ) ( TRUCK-AT ?auto_52349 ?auto_52348 ) )
    :subtasks
    ( ( !DRIVE ?auto_52349 ?auto_52348 ?auto_52347 )
      ( MAKE-ON ?auto_52340 ?auto_52341 )
      ( MAKE-ON-VERIFY ?auto_52340 ?auto_52341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52350 - SURFACE
      ?auto_52351 - SURFACE
    )
    :vars
    (
      ?auto_52358 - HOIST
      ?auto_52353 - PLACE
      ?auto_52354 - PLACE
      ?auto_52357 - HOIST
      ?auto_52355 - SURFACE
      ?auto_52359 - SURFACE
      ?auto_52356 - SURFACE
      ?auto_52352 - TRUCK
      ?auto_52360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52358 ?auto_52353 ) ( IS-CRATE ?auto_52350 ) ( not ( = ?auto_52350 ?auto_52351 ) ) ( not ( = ?auto_52354 ?auto_52353 ) ) ( HOIST-AT ?auto_52357 ?auto_52354 ) ( not ( = ?auto_52358 ?auto_52357 ) ) ( SURFACE-AT ?auto_52350 ?auto_52354 ) ( ON ?auto_52350 ?auto_52355 ) ( CLEAR ?auto_52350 ) ( not ( = ?auto_52350 ?auto_52355 ) ) ( not ( = ?auto_52351 ?auto_52355 ) ) ( IS-CRATE ?auto_52351 ) ( not ( = ?auto_52350 ?auto_52359 ) ) ( not ( = ?auto_52351 ?auto_52359 ) ) ( not ( = ?auto_52355 ?auto_52359 ) ) ( AVAILABLE ?auto_52357 ) ( SURFACE-AT ?auto_52351 ?auto_52354 ) ( ON ?auto_52351 ?auto_52356 ) ( CLEAR ?auto_52351 ) ( not ( = ?auto_52350 ?auto_52356 ) ) ( not ( = ?auto_52351 ?auto_52356 ) ) ( not ( = ?auto_52355 ?auto_52356 ) ) ( not ( = ?auto_52359 ?auto_52356 ) ) ( TRUCK-AT ?auto_52352 ?auto_52353 ) ( SURFACE-AT ?auto_52360 ?auto_52353 ) ( CLEAR ?auto_52360 ) ( LIFTING ?auto_52358 ?auto_52359 ) ( IS-CRATE ?auto_52359 ) ( not ( = ?auto_52350 ?auto_52360 ) ) ( not ( = ?auto_52351 ?auto_52360 ) ) ( not ( = ?auto_52355 ?auto_52360 ) ) ( not ( = ?auto_52359 ?auto_52360 ) ) ( not ( = ?auto_52356 ?auto_52360 ) ) )
    :subtasks
    ( ( !DROP ?auto_52358 ?auto_52359 ?auto_52360 ?auto_52353 )
      ( MAKE-ON ?auto_52350 ?auto_52351 )
      ( MAKE-ON-VERIFY ?auto_52350 ?auto_52351 ) )
  )

)

