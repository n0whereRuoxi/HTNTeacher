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
      ?auto_5534 - SURFACE
      ?auto_5535 - SURFACE
    )
    :vars
    (
      ?auto_5536 - HOIST
      ?auto_5537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5536 ?auto_5537 ) ( SURFACE-AT ?auto_5535 ?auto_5537 ) ( CLEAR ?auto_5535 ) ( LIFTING ?auto_5536 ?auto_5534 ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5534 ?auto_5535 ) ) )
    :subtasks
    ( ( !DROP ?auto_5536 ?auto_5534 ?auto_5535 ?auto_5537 )
      ( MAKE-ON-VERIFY ?auto_5534 ?auto_5535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5538 - SURFACE
      ?auto_5539 - SURFACE
    )
    :vars
    (
      ?auto_5540 - HOIST
      ?auto_5541 - PLACE
      ?auto_5542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5540 ?auto_5541 ) ( SURFACE-AT ?auto_5539 ?auto_5541 ) ( CLEAR ?auto_5539 ) ( IS-CRATE ?auto_5538 ) ( not ( = ?auto_5538 ?auto_5539 ) ) ( TRUCK-AT ?auto_5542 ?auto_5541 ) ( AVAILABLE ?auto_5540 ) ( IN ?auto_5538 ?auto_5542 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5540 ?auto_5538 ?auto_5542 ?auto_5541 )
      ( MAKE-ON ?auto_5538 ?auto_5539 )
      ( MAKE-ON-VERIFY ?auto_5538 ?auto_5539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5543 - SURFACE
      ?auto_5544 - SURFACE
    )
    :vars
    (
      ?auto_5545 - HOIST
      ?auto_5546 - PLACE
      ?auto_5547 - TRUCK
      ?auto_5548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5545 ?auto_5546 ) ( SURFACE-AT ?auto_5544 ?auto_5546 ) ( CLEAR ?auto_5544 ) ( IS-CRATE ?auto_5543 ) ( not ( = ?auto_5543 ?auto_5544 ) ) ( AVAILABLE ?auto_5545 ) ( IN ?auto_5543 ?auto_5547 ) ( TRUCK-AT ?auto_5547 ?auto_5548 ) ( not ( = ?auto_5548 ?auto_5546 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5547 ?auto_5548 ?auto_5546 )
      ( MAKE-ON ?auto_5543 ?auto_5544 )
      ( MAKE-ON-VERIFY ?auto_5543 ?auto_5544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5549 - SURFACE
      ?auto_5550 - SURFACE
    )
    :vars
    (
      ?auto_5552 - HOIST
      ?auto_5553 - PLACE
      ?auto_5554 - TRUCK
      ?auto_5551 - PLACE
      ?auto_5555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5552 ?auto_5553 ) ( SURFACE-AT ?auto_5550 ?auto_5553 ) ( CLEAR ?auto_5550 ) ( IS-CRATE ?auto_5549 ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( AVAILABLE ?auto_5552 ) ( TRUCK-AT ?auto_5554 ?auto_5551 ) ( not ( = ?auto_5551 ?auto_5553 ) ) ( HOIST-AT ?auto_5555 ?auto_5551 ) ( LIFTING ?auto_5555 ?auto_5549 ) ( not ( = ?auto_5552 ?auto_5555 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5555 ?auto_5549 ?auto_5554 ?auto_5551 )
      ( MAKE-ON ?auto_5549 ?auto_5550 )
      ( MAKE-ON-VERIFY ?auto_5549 ?auto_5550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5556 - SURFACE
      ?auto_5557 - SURFACE
    )
    :vars
    (
      ?auto_5559 - HOIST
      ?auto_5560 - PLACE
      ?auto_5562 - TRUCK
      ?auto_5558 - PLACE
      ?auto_5561 - HOIST
      ?auto_5563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5559 ?auto_5560 ) ( SURFACE-AT ?auto_5557 ?auto_5560 ) ( CLEAR ?auto_5557 ) ( IS-CRATE ?auto_5556 ) ( not ( = ?auto_5556 ?auto_5557 ) ) ( AVAILABLE ?auto_5559 ) ( TRUCK-AT ?auto_5562 ?auto_5558 ) ( not ( = ?auto_5558 ?auto_5560 ) ) ( HOIST-AT ?auto_5561 ?auto_5558 ) ( not ( = ?auto_5559 ?auto_5561 ) ) ( AVAILABLE ?auto_5561 ) ( SURFACE-AT ?auto_5556 ?auto_5558 ) ( ON ?auto_5556 ?auto_5563 ) ( CLEAR ?auto_5556 ) ( not ( = ?auto_5556 ?auto_5563 ) ) ( not ( = ?auto_5557 ?auto_5563 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5561 ?auto_5556 ?auto_5563 ?auto_5558 )
      ( MAKE-ON ?auto_5556 ?auto_5557 )
      ( MAKE-ON-VERIFY ?auto_5556 ?auto_5557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5564 - SURFACE
      ?auto_5565 - SURFACE
    )
    :vars
    (
      ?auto_5571 - HOIST
      ?auto_5569 - PLACE
      ?auto_5567 - PLACE
      ?auto_5570 - HOIST
      ?auto_5568 - SURFACE
      ?auto_5566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5571 ?auto_5569 ) ( SURFACE-AT ?auto_5565 ?auto_5569 ) ( CLEAR ?auto_5565 ) ( IS-CRATE ?auto_5564 ) ( not ( = ?auto_5564 ?auto_5565 ) ) ( AVAILABLE ?auto_5571 ) ( not ( = ?auto_5567 ?auto_5569 ) ) ( HOIST-AT ?auto_5570 ?auto_5567 ) ( not ( = ?auto_5571 ?auto_5570 ) ) ( AVAILABLE ?auto_5570 ) ( SURFACE-AT ?auto_5564 ?auto_5567 ) ( ON ?auto_5564 ?auto_5568 ) ( CLEAR ?auto_5564 ) ( not ( = ?auto_5564 ?auto_5568 ) ) ( not ( = ?auto_5565 ?auto_5568 ) ) ( TRUCK-AT ?auto_5566 ?auto_5569 ) )
    :subtasks
    ( ( !DRIVE ?auto_5566 ?auto_5569 ?auto_5567 )
      ( MAKE-ON ?auto_5564 ?auto_5565 )
      ( MAKE-ON-VERIFY ?auto_5564 ?auto_5565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5612 - SURFACE
      ?auto_5613 - SURFACE
    )
    :vars
    (
      ?auto_5616 - HOIST
      ?auto_5617 - PLACE
      ?auto_5618 - PLACE
      ?auto_5619 - HOIST
      ?auto_5614 - SURFACE
      ?auto_5615 - TRUCK
      ?auto_5620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5616 ?auto_5617 ) ( IS-CRATE ?auto_5612 ) ( not ( = ?auto_5612 ?auto_5613 ) ) ( not ( = ?auto_5618 ?auto_5617 ) ) ( HOIST-AT ?auto_5619 ?auto_5618 ) ( not ( = ?auto_5616 ?auto_5619 ) ) ( AVAILABLE ?auto_5619 ) ( SURFACE-AT ?auto_5612 ?auto_5618 ) ( ON ?auto_5612 ?auto_5614 ) ( CLEAR ?auto_5612 ) ( not ( = ?auto_5612 ?auto_5614 ) ) ( not ( = ?auto_5613 ?auto_5614 ) ) ( TRUCK-AT ?auto_5615 ?auto_5617 ) ( SURFACE-AT ?auto_5620 ?auto_5617 ) ( CLEAR ?auto_5620 ) ( LIFTING ?auto_5616 ?auto_5613 ) ( IS-CRATE ?auto_5613 ) ( not ( = ?auto_5612 ?auto_5620 ) ) ( not ( = ?auto_5613 ?auto_5620 ) ) ( not ( = ?auto_5614 ?auto_5620 ) ) )
    :subtasks
    ( ( !DROP ?auto_5616 ?auto_5613 ?auto_5620 ?auto_5617 )
      ( MAKE-ON ?auto_5612 ?auto_5613 )
      ( MAKE-ON-VERIFY ?auto_5612 ?auto_5613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5621 - SURFACE
      ?auto_5622 - SURFACE
    )
    :vars
    (
      ?auto_5629 - HOIST
      ?auto_5624 - PLACE
      ?auto_5628 - PLACE
      ?auto_5625 - HOIST
      ?auto_5623 - SURFACE
      ?auto_5627 - TRUCK
      ?auto_5626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5629 ?auto_5624 ) ( IS-CRATE ?auto_5621 ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5628 ?auto_5624 ) ) ( HOIST-AT ?auto_5625 ?auto_5628 ) ( not ( = ?auto_5629 ?auto_5625 ) ) ( AVAILABLE ?auto_5625 ) ( SURFACE-AT ?auto_5621 ?auto_5628 ) ( ON ?auto_5621 ?auto_5623 ) ( CLEAR ?auto_5621 ) ( not ( = ?auto_5621 ?auto_5623 ) ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( TRUCK-AT ?auto_5627 ?auto_5624 ) ( SURFACE-AT ?auto_5626 ?auto_5624 ) ( CLEAR ?auto_5626 ) ( IS-CRATE ?auto_5622 ) ( not ( = ?auto_5621 ?auto_5626 ) ) ( not ( = ?auto_5622 ?auto_5626 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( AVAILABLE ?auto_5629 ) ( IN ?auto_5622 ?auto_5627 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5629 ?auto_5622 ?auto_5627 ?auto_5624 )
      ( MAKE-ON ?auto_5621 ?auto_5622 )
      ( MAKE-ON-VERIFY ?auto_5621 ?auto_5622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5636 - SURFACE
      ?auto_5637 - SURFACE
    )
    :vars
    (
      ?auto_5641 - HOIST
      ?auto_5643 - PLACE
      ?auto_5642 - PLACE
      ?auto_5638 - HOIST
      ?auto_5640 - SURFACE
      ?auto_5639 - TRUCK
      ?auto_5644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5641 ?auto_5643 ) ( SURFACE-AT ?auto_5637 ?auto_5643 ) ( CLEAR ?auto_5637 ) ( IS-CRATE ?auto_5636 ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( AVAILABLE ?auto_5641 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( HOIST-AT ?auto_5638 ?auto_5642 ) ( not ( = ?auto_5641 ?auto_5638 ) ) ( AVAILABLE ?auto_5638 ) ( SURFACE-AT ?auto_5636 ?auto_5642 ) ( ON ?auto_5636 ?auto_5640 ) ( CLEAR ?auto_5636 ) ( not ( = ?auto_5636 ?auto_5640 ) ) ( not ( = ?auto_5637 ?auto_5640 ) ) ( TRUCK-AT ?auto_5639 ?auto_5644 ) ( not ( = ?auto_5644 ?auto_5643 ) ) ( not ( = ?auto_5642 ?auto_5644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5639 ?auto_5644 ?auto_5643 )
      ( MAKE-ON ?auto_5636 ?auto_5637 )
      ( MAKE-ON-VERIFY ?auto_5636 ?auto_5637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5821 - SURFACE
      ?auto_5822 - SURFACE
    )
    :vars
    (
      ?auto_5823 - HOIST
      ?auto_5827 - PLACE
      ?auto_5824 - TRUCK
      ?auto_5828 - PLACE
      ?auto_5825 - HOIST
      ?auto_5826 - SURFACE
      ?auto_5829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5823 ?auto_5827 ) ( SURFACE-AT ?auto_5822 ?auto_5827 ) ( CLEAR ?auto_5822 ) ( IS-CRATE ?auto_5821 ) ( not ( = ?auto_5821 ?auto_5822 ) ) ( AVAILABLE ?auto_5823 ) ( TRUCK-AT ?auto_5824 ?auto_5828 ) ( not ( = ?auto_5828 ?auto_5827 ) ) ( HOIST-AT ?auto_5825 ?auto_5828 ) ( not ( = ?auto_5823 ?auto_5825 ) ) ( SURFACE-AT ?auto_5821 ?auto_5828 ) ( ON ?auto_5821 ?auto_5826 ) ( CLEAR ?auto_5821 ) ( not ( = ?auto_5821 ?auto_5826 ) ) ( not ( = ?auto_5822 ?auto_5826 ) ) ( LIFTING ?auto_5825 ?auto_5829 ) ( IS-CRATE ?auto_5829 ) ( not ( = ?auto_5821 ?auto_5829 ) ) ( not ( = ?auto_5822 ?auto_5829 ) ) ( not ( = ?auto_5826 ?auto_5829 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5825 ?auto_5829 ?auto_5824 ?auto_5828 )
      ( MAKE-ON ?auto_5821 ?auto_5822 )
      ( MAKE-ON-VERIFY ?auto_5821 ?auto_5822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5937 - SURFACE
      ?auto_5938 - SURFACE
    )
    :vars
    (
      ?auto_5942 - HOIST
      ?auto_5940 - PLACE
      ?auto_5943 - PLACE
      ?auto_5944 - HOIST
      ?auto_5939 - SURFACE
      ?auto_5941 - TRUCK
      ?auto_5945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5942 ?auto_5940 ) ( SURFACE-AT ?auto_5938 ?auto_5940 ) ( CLEAR ?auto_5938 ) ( IS-CRATE ?auto_5937 ) ( not ( = ?auto_5937 ?auto_5938 ) ) ( not ( = ?auto_5943 ?auto_5940 ) ) ( HOIST-AT ?auto_5944 ?auto_5943 ) ( not ( = ?auto_5942 ?auto_5944 ) ) ( AVAILABLE ?auto_5944 ) ( SURFACE-AT ?auto_5937 ?auto_5943 ) ( ON ?auto_5937 ?auto_5939 ) ( CLEAR ?auto_5937 ) ( not ( = ?auto_5937 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( TRUCK-AT ?auto_5941 ?auto_5940 ) ( LIFTING ?auto_5942 ?auto_5945 ) ( IS-CRATE ?auto_5945 ) ( not ( = ?auto_5937 ?auto_5945 ) ) ( not ( = ?auto_5938 ?auto_5945 ) ) ( not ( = ?auto_5939 ?auto_5945 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5942 ?auto_5945 ?auto_5941 ?auto_5940 )
      ( MAKE-ON ?auto_5937 ?auto_5938 )
      ( MAKE-ON-VERIFY ?auto_5937 ?auto_5938 ) )
  )

)

