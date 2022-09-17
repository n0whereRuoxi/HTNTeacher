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
      ?auto_5502 - SURFACE
      ?auto_5503 - SURFACE
    )
    :vars
    (
      ?auto_5504 - HOIST
      ?auto_5505 - PLACE
      ?auto_5507 - PLACE
      ?auto_5508 - HOIST
      ?auto_5509 - SURFACE
      ?auto_5506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5504 ?auto_5505 ) ( SURFACE-AT ?auto_5503 ?auto_5505 ) ( CLEAR ?auto_5503 ) ( IS-CRATE ?auto_5502 ) ( AVAILABLE ?auto_5504 ) ( not ( = ?auto_5507 ?auto_5505 ) ) ( HOIST-AT ?auto_5508 ?auto_5507 ) ( AVAILABLE ?auto_5508 ) ( SURFACE-AT ?auto_5502 ?auto_5507 ) ( ON ?auto_5502 ?auto_5509 ) ( CLEAR ?auto_5502 ) ( TRUCK-AT ?auto_5506 ?auto_5505 ) ( not ( = ?auto_5502 ?auto_5503 ) ) ( not ( = ?auto_5502 ?auto_5509 ) ) ( not ( = ?auto_5503 ?auto_5509 ) ) ( not ( = ?auto_5504 ?auto_5508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5506 ?auto_5505 ?auto_5507 )
      ( !LIFT ?auto_5508 ?auto_5502 ?auto_5509 ?auto_5507 )
      ( !LOAD ?auto_5508 ?auto_5502 ?auto_5506 ?auto_5507 )
      ( !DRIVE ?auto_5506 ?auto_5507 ?auto_5505 )
      ( !UNLOAD ?auto_5504 ?auto_5502 ?auto_5506 ?auto_5505 )
      ( !DROP ?auto_5504 ?auto_5502 ?auto_5503 ?auto_5505 )
      ( MAKE-ON-VERIFY ?auto_5502 ?auto_5503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5512 - SURFACE
      ?auto_5513 - SURFACE
    )
    :vars
    (
      ?auto_5514 - HOIST
      ?auto_5515 - PLACE
      ?auto_5517 - PLACE
      ?auto_5518 - HOIST
      ?auto_5519 - SURFACE
      ?auto_5516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5514 ?auto_5515 ) ( SURFACE-AT ?auto_5513 ?auto_5515 ) ( CLEAR ?auto_5513 ) ( IS-CRATE ?auto_5512 ) ( AVAILABLE ?auto_5514 ) ( not ( = ?auto_5517 ?auto_5515 ) ) ( HOIST-AT ?auto_5518 ?auto_5517 ) ( AVAILABLE ?auto_5518 ) ( SURFACE-AT ?auto_5512 ?auto_5517 ) ( ON ?auto_5512 ?auto_5519 ) ( CLEAR ?auto_5512 ) ( TRUCK-AT ?auto_5516 ?auto_5515 ) ( not ( = ?auto_5512 ?auto_5513 ) ) ( not ( = ?auto_5512 ?auto_5519 ) ) ( not ( = ?auto_5513 ?auto_5519 ) ) ( not ( = ?auto_5514 ?auto_5518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5516 ?auto_5515 ?auto_5517 )
      ( !LIFT ?auto_5518 ?auto_5512 ?auto_5519 ?auto_5517 )
      ( !LOAD ?auto_5518 ?auto_5512 ?auto_5516 ?auto_5517 )
      ( !DRIVE ?auto_5516 ?auto_5517 ?auto_5515 )
      ( !UNLOAD ?auto_5514 ?auto_5512 ?auto_5516 ?auto_5515 )
      ( !DROP ?auto_5514 ?auto_5512 ?auto_5513 ?auto_5515 )
      ( MAKE-ON-VERIFY ?auto_5512 ?auto_5513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5522 - SURFACE
      ?auto_5523 - SURFACE
    )
    :vars
    (
      ?auto_5524 - HOIST
      ?auto_5525 - PLACE
      ?auto_5527 - PLACE
      ?auto_5528 - HOIST
      ?auto_5529 - SURFACE
      ?auto_5526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5524 ?auto_5525 ) ( SURFACE-AT ?auto_5523 ?auto_5525 ) ( CLEAR ?auto_5523 ) ( IS-CRATE ?auto_5522 ) ( AVAILABLE ?auto_5524 ) ( not ( = ?auto_5527 ?auto_5525 ) ) ( HOIST-AT ?auto_5528 ?auto_5527 ) ( AVAILABLE ?auto_5528 ) ( SURFACE-AT ?auto_5522 ?auto_5527 ) ( ON ?auto_5522 ?auto_5529 ) ( CLEAR ?auto_5522 ) ( TRUCK-AT ?auto_5526 ?auto_5525 ) ( not ( = ?auto_5522 ?auto_5523 ) ) ( not ( = ?auto_5522 ?auto_5529 ) ) ( not ( = ?auto_5523 ?auto_5529 ) ) ( not ( = ?auto_5524 ?auto_5528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5526 ?auto_5525 ?auto_5527 )
      ( !LIFT ?auto_5528 ?auto_5522 ?auto_5529 ?auto_5527 )
      ( !LOAD ?auto_5528 ?auto_5522 ?auto_5526 ?auto_5527 )
      ( !DRIVE ?auto_5526 ?auto_5527 ?auto_5525 )
      ( !UNLOAD ?auto_5524 ?auto_5522 ?auto_5526 ?auto_5525 )
      ( !DROP ?auto_5524 ?auto_5522 ?auto_5523 ?auto_5525 )
      ( MAKE-ON-VERIFY ?auto_5522 ?auto_5523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5532 - SURFACE
      ?auto_5533 - SURFACE
    )
    :vars
    (
      ?auto_5534 - HOIST
      ?auto_5535 - PLACE
      ?auto_5537 - PLACE
      ?auto_5538 - HOIST
      ?auto_5539 - SURFACE
      ?auto_5536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5534 ?auto_5535 ) ( SURFACE-AT ?auto_5533 ?auto_5535 ) ( CLEAR ?auto_5533 ) ( IS-CRATE ?auto_5532 ) ( AVAILABLE ?auto_5534 ) ( not ( = ?auto_5537 ?auto_5535 ) ) ( HOIST-AT ?auto_5538 ?auto_5537 ) ( AVAILABLE ?auto_5538 ) ( SURFACE-AT ?auto_5532 ?auto_5537 ) ( ON ?auto_5532 ?auto_5539 ) ( CLEAR ?auto_5532 ) ( TRUCK-AT ?auto_5536 ?auto_5535 ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5532 ?auto_5539 ) ) ( not ( = ?auto_5533 ?auto_5539 ) ) ( not ( = ?auto_5534 ?auto_5538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5536 ?auto_5535 ?auto_5537 )
      ( !LIFT ?auto_5538 ?auto_5532 ?auto_5539 ?auto_5537 )
      ( !LOAD ?auto_5538 ?auto_5532 ?auto_5536 ?auto_5537 )
      ( !DRIVE ?auto_5536 ?auto_5537 ?auto_5535 )
      ( !UNLOAD ?auto_5534 ?auto_5532 ?auto_5536 ?auto_5535 )
      ( !DROP ?auto_5534 ?auto_5532 ?auto_5533 ?auto_5535 )
      ( MAKE-ON-VERIFY ?auto_5532 ?auto_5533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5542 - SURFACE
      ?auto_5543 - SURFACE
    )
    :vars
    (
      ?auto_5544 - HOIST
      ?auto_5545 - PLACE
      ?auto_5547 - PLACE
      ?auto_5548 - HOIST
      ?auto_5549 - SURFACE
      ?auto_5546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5544 ?auto_5545 ) ( SURFACE-AT ?auto_5543 ?auto_5545 ) ( CLEAR ?auto_5543 ) ( IS-CRATE ?auto_5542 ) ( AVAILABLE ?auto_5544 ) ( not ( = ?auto_5547 ?auto_5545 ) ) ( HOIST-AT ?auto_5548 ?auto_5547 ) ( AVAILABLE ?auto_5548 ) ( SURFACE-AT ?auto_5542 ?auto_5547 ) ( ON ?auto_5542 ?auto_5549 ) ( CLEAR ?auto_5542 ) ( TRUCK-AT ?auto_5546 ?auto_5545 ) ( not ( = ?auto_5542 ?auto_5543 ) ) ( not ( = ?auto_5542 ?auto_5549 ) ) ( not ( = ?auto_5543 ?auto_5549 ) ) ( not ( = ?auto_5544 ?auto_5548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5546 ?auto_5545 ?auto_5547 )
      ( !LIFT ?auto_5548 ?auto_5542 ?auto_5549 ?auto_5547 )
      ( !LOAD ?auto_5548 ?auto_5542 ?auto_5546 ?auto_5547 )
      ( !DRIVE ?auto_5546 ?auto_5547 ?auto_5545 )
      ( !UNLOAD ?auto_5544 ?auto_5542 ?auto_5546 ?auto_5545 )
      ( !DROP ?auto_5544 ?auto_5542 ?auto_5543 ?auto_5545 )
      ( MAKE-ON-VERIFY ?auto_5542 ?auto_5543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5552 - SURFACE
      ?auto_5553 - SURFACE
    )
    :vars
    (
      ?auto_5554 - HOIST
      ?auto_5555 - PLACE
      ?auto_5557 - PLACE
      ?auto_5558 - HOIST
      ?auto_5559 - SURFACE
      ?auto_5556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5554 ?auto_5555 ) ( SURFACE-AT ?auto_5553 ?auto_5555 ) ( CLEAR ?auto_5553 ) ( IS-CRATE ?auto_5552 ) ( AVAILABLE ?auto_5554 ) ( not ( = ?auto_5557 ?auto_5555 ) ) ( HOIST-AT ?auto_5558 ?auto_5557 ) ( AVAILABLE ?auto_5558 ) ( SURFACE-AT ?auto_5552 ?auto_5557 ) ( ON ?auto_5552 ?auto_5559 ) ( CLEAR ?auto_5552 ) ( TRUCK-AT ?auto_5556 ?auto_5555 ) ( not ( = ?auto_5552 ?auto_5553 ) ) ( not ( = ?auto_5552 ?auto_5559 ) ) ( not ( = ?auto_5553 ?auto_5559 ) ) ( not ( = ?auto_5554 ?auto_5558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5556 ?auto_5555 ?auto_5557 )
      ( !LIFT ?auto_5558 ?auto_5552 ?auto_5559 ?auto_5557 )
      ( !LOAD ?auto_5558 ?auto_5552 ?auto_5556 ?auto_5557 )
      ( !DRIVE ?auto_5556 ?auto_5557 ?auto_5555 )
      ( !UNLOAD ?auto_5554 ?auto_5552 ?auto_5556 ?auto_5555 )
      ( !DROP ?auto_5554 ?auto_5552 ?auto_5553 ?auto_5555 )
      ( MAKE-ON-VERIFY ?auto_5552 ?auto_5553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5562 - SURFACE
      ?auto_5563 - SURFACE
    )
    :vars
    (
      ?auto_5564 - HOIST
      ?auto_5565 - PLACE
      ?auto_5567 - PLACE
      ?auto_5568 - HOIST
      ?auto_5569 - SURFACE
      ?auto_5566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5564 ?auto_5565 ) ( SURFACE-AT ?auto_5563 ?auto_5565 ) ( CLEAR ?auto_5563 ) ( IS-CRATE ?auto_5562 ) ( AVAILABLE ?auto_5564 ) ( not ( = ?auto_5567 ?auto_5565 ) ) ( HOIST-AT ?auto_5568 ?auto_5567 ) ( AVAILABLE ?auto_5568 ) ( SURFACE-AT ?auto_5562 ?auto_5567 ) ( ON ?auto_5562 ?auto_5569 ) ( CLEAR ?auto_5562 ) ( TRUCK-AT ?auto_5566 ?auto_5565 ) ( not ( = ?auto_5562 ?auto_5563 ) ) ( not ( = ?auto_5562 ?auto_5569 ) ) ( not ( = ?auto_5563 ?auto_5569 ) ) ( not ( = ?auto_5564 ?auto_5568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5566 ?auto_5565 ?auto_5567 )
      ( !LIFT ?auto_5568 ?auto_5562 ?auto_5569 ?auto_5567 )
      ( !LOAD ?auto_5568 ?auto_5562 ?auto_5566 ?auto_5567 )
      ( !DRIVE ?auto_5566 ?auto_5567 ?auto_5565 )
      ( !UNLOAD ?auto_5564 ?auto_5562 ?auto_5566 ?auto_5565 )
      ( !DROP ?auto_5564 ?auto_5562 ?auto_5563 ?auto_5565 )
      ( MAKE-ON-VERIFY ?auto_5562 ?auto_5563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5572 - SURFACE
      ?auto_5573 - SURFACE
    )
    :vars
    (
      ?auto_5574 - HOIST
      ?auto_5575 - PLACE
      ?auto_5577 - PLACE
      ?auto_5578 - HOIST
      ?auto_5579 - SURFACE
      ?auto_5576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5574 ?auto_5575 ) ( SURFACE-AT ?auto_5573 ?auto_5575 ) ( CLEAR ?auto_5573 ) ( IS-CRATE ?auto_5572 ) ( AVAILABLE ?auto_5574 ) ( not ( = ?auto_5577 ?auto_5575 ) ) ( HOIST-AT ?auto_5578 ?auto_5577 ) ( AVAILABLE ?auto_5578 ) ( SURFACE-AT ?auto_5572 ?auto_5577 ) ( ON ?auto_5572 ?auto_5579 ) ( CLEAR ?auto_5572 ) ( TRUCK-AT ?auto_5576 ?auto_5575 ) ( not ( = ?auto_5572 ?auto_5573 ) ) ( not ( = ?auto_5572 ?auto_5579 ) ) ( not ( = ?auto_5573 ?auto_5579 ) ) ( not ( = ?auto_5574 ?auto_5578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5576 ?auto_5575 ?auto_5577 )
      ( !LIFT ?auto_5578 ?auto_5572 ?auto_5579 ?auto_5577 )
      ( !LOAD ?auto_5578 ?auto_5572 ?auto_5576 ?auto_5577 )
      ( !DRIVE ?auto_5576 ?auto_5577 ?auto_5575 )
      ( !UNLOAD ?auto_5574 ?auto_5572 ?auto_5576 ?auto_5575 )
      ( !DROP ?auto_5574 ?auto_5572 ?auto_5573 ?auto_5575 )
      ( MAKE-ON-VERIFY ?auto_5572 ?auto_5573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5582 - SURFACE
      ?auto_5583 - SURFACE
    )
    :vars
    (
      ?auto_5584 - HOIST
      ?auto_5585 - PLACE
      ?auto_5587 - PLACE
      ?auto_5588 - HOIST
      ?auto_5589 - SURFACE
      ?auto_5586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5584 ?auto_5585 ) ( SURFACE-AT ?auto_5583 ?auto_5585 ) ( CLEAR ?auto_5583 ) ( IS-CRATE ?auto_5582 ) ( AVAILABLE ?auto_5584 ) ( not ( = ?auto_5587 ?auto_5585 ) ) ( HOIST-AT ?auto_5588 ?auto_5587 ) ( AVAILABLE ?auto_5588 ) ( SURFACE-AT ?auto_5582 ?auto_5587 ) ( ON ?auto_5582 ?auto_5589 ) ( CLEAR ?auto_5582 ) ( TRUCK-AT ?auto_5586 ?auto_5585 ) ( not ( = ?auto_5582 ?auto_5583 ) ) ( not ( = ?auto_5582 ?auto_5589 ) ) ( not ( = ?auto_5583 ?auto_5589 ) ) ( not ( = ?auto_5584 ?auto_5588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5586 ?auto_5585 ?auto_5587 )
      ( !LIFT ?auto_5588 ?auto_5582 ?auto_5589 ?auto_5587 )
      ( !LOAD ?auto_5588 ?auto_5582 ?auto_5586 ?auto_5587 )
      ( !DRIVE ?auto_5586 ?auto_5587 ?auto_5585 )
      ( !UNLOAD ?auto_5584 ?auto_5582 ?auto_5586 ?auto_5585 )
      ( !DROP ?auto_5584 ?auto_5582 ?auto_5583 ?auto_5585 )
      ( MAKE-ON-VERIFY ?auto_5582 ?auto_5583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5592 - SURFACE
      ?auto_5593 - SURFACE
    )
    :vars
    (
      ?auto_5594 - HOIST
      ?auto_5595 - PLACE
      ?auto_5597 - PLACE
      ?auto_5598 - HOIST
      ?auto_5599 - SURFACE
      ?auto_5596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5594 ?auto_5595 ) ( SURFACE-AT ?auto_5593 ?auto_5595 ) ( CLEAR ?auto_5593 ) ( IS-CRATE ?auto_5592 ) ( AVAILABLE ?auto_5594 ) ( not ( = ?auto_5597 ?auto_5595 ) ) ( HOIST-AT ?auto_5598 ?auto_5597 ) ( AVAILABLE ?auto_5598 ) ( SURFACE-AT ?auto_5592 ?auto_5597 ) ( ON ?auto_5592 ?auto_5599 ) ( CLEAR ?auto_5592 ) ( TRUCK-AT ?auto_5596 ?auto_5595 ) ( not ( = ?auto_5592 ?auto_5593 ) ) ( not ( = ?auto_5592 ?auto_5599 ) ) ( not ( = ?auto_5593 ?auto_5599 ) ) ( not ( = ?auto_5594 ?auto_5598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5596 ?auto_5595 ?auto_5597 )
      ( !LIFT ?auto_5598 ?auto_5592 ?auto_5599 ?auto_5597 )
      ( !LOAD ?auto_5598 ?auto_5592 ?auto_5596 ?auto_5597 )
      ( !DRIVE ?auto_5596 ?auto_5597 ?auto_5595 )
      ( !UNLOAD ?auto_5594 ?auto_5592 ?auto_5596 ?auto_5595 )
      ( !DROP ?auto_5594 ?auto_5592 ?auto_5593 ?auto_5595 )
      ( MAKE-ON-VERIFY ?auto_5592 ?auto_5593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5602 - SURFACE
      ?auto_5603 - SURFACE
    )
    :vars
    (
      ?auto_5604 - HOIST
      ?auto_5605 - PLACE
      ?auto_5607 - PLACE
      ?auto_5608 - HOIST
      ?auto_5609 - SURFACE
      ?auto_5606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5604 ?auto_5605 ) ( SURFACE-AT ?auto_5603 ?auto_5605 ) ( CLEAR ?auto_5603 ) ( IS-CRATE ?auto_5602 ) ( AVAILABLE ?auto_5604 ) ( not ( = ?auto_5607 ?auto_5605 ) ) ( HOIST-AT ?auto_5608 ?auto_5607 ) ( AVAILABLE ?auto_5608 ) ( SURFACE-AT ?auto_5602 ?auto_5607 ) ( ON ?auto_5602 ?auto_5609 ) ( CLEAR ?auto_5602 ) ( TRUCK-AT ?auto_5606 ?auto_5605 ) ( not ( = ?auto_5602 ?auto_5603 ) ) ( not ( = ?auto_5602 ?auto_5609 ) ) ( not ( = ?auto_5603 ?auto_5609 ) ) ( not ( = ?auto_5604 ?auto_5608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5606 ?auto_5605 ?auto_5607 )
      ( !LIFT ?auto_5608 ?auto_5602 ?auto_5609 ?auto_5607 )
      ( !LOAD ?auto_5608 ?auto_5602 ?auto_5606 ?auto_5607 )
      ( !DRIVE ?auto_5606 ?auto_5607 ?auto_5605 )
      ( !UNLOAD ?auto_5604 ?auto_5602 ?auto_5606 ?auto_5605 )
      ( !DROP ?auto_5604 ?auto_5602 ?auto_5603 ?auto_5605 )
      ( MAKE-ON-VERIFY ?auto_5602 ?auto_5603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5612 - SURFACE
      ?auto_5613 - SURFACE
    )
    :vars
    (
      ?auto_5614 - HOIST
      ?auto_5615 - PLACE
      ?auto_5617 - PLACE
      ?auto_5618 - HOIST
      ?auto_5619 - SURFACE
      ?auto_5616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5614 ?auto_5615 ) ( SURFACE-AT ?auto_5613 ?auto_5615 ) ( CLEAR ?auto_5613 ) ( IS-CRATE ?auto_5612 ) ( AVAILABLE ?auto_5614 ) ( not ( = ?auto_5617 ?auto_5615 ) ) ( HOIST-AT ?auto_5618 ?auto_5617 ) ( AVAILABLE ?auto_5618 ) ( SURFACE-AT ?auto_5612 ?auto_5617 ) ( ON ?auto_5612 ?auto_5619 ) ( CLEAR ?auto_5612 ) ( TRUCK-AT ?auto_5616 ?auto_5615 ) ( not ( = ?auto_5612 ?auto_5613 ) ) ( not ( = ?auto_5612 ?auto_5619 ) ) ( not ( = ?auto_5613 ?auto_5619 ) ) ( not ( = ?auto_5614 ?auto_5618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5616 ?auto_5615 ?auto_5617 )
      ( !LIFT ?auto_5618 ?auto_5612 ?auto_5619 ?auto_5617 )
      ( !LOAD ?auto_5618 ?auto_5612 ?auto_5616 ?auto_5617 )
      ( !DRIVE ?auto_5616 ?auto_5617 ?auto_5615 )
      ( !UNLOAD ?auto_5614 ?auto_5612 ?auto_5616 ?auto_5615 )
      ( !DROP ?auto_5614 ?auto_5612 ?auto_5613 ?auto_5615 )
      ( MAKE-ON-VERIFY ?auto_5612 ?auto_5613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5622 - SURFACE
      ?auto_5623 - SURFACE
    )
    :vars
    (
      ?auto_5624 - HOIST
      ?auto_5625 - PLACE
      ?auto_5627 - PLACE
      ?auto_5628 - HOIST
      ?auto_5629 - SURFACE
      ?auto_5626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5624 ?auto_5625 ) ( SURFACE-AT ?auto_5623 ?auto_5625 ) ( CLEAR ?auto_5623 ) ( IS-CRATE ?auto_5622 ) ( AVAILABLE ?auto_5624 ) ( not ( = ?auto_5627 ?auto_5625 ) ) ( HOIST-AT ?auto_5628 ?auto_5627 ) ( AVAILABLE ?auto_5628 ) ( SURFACE-AT ?auto_5622 ?auto_5627 ) ( ON ?auto_5622 ?auto_5629 ) ( CLEAR ?auto_5622 ) ( TRUCK-AT ?auto_5626 ?auto_5625 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( not ( = ?auto_5622 ?auto_5629 ) ) ( not ( = ?auto_5623 ?auto_5629 ) ) ( not ( = ?auto_5624 ?auto_5628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5626 ?auto_5625 ?auto_5627 )
      ( !LIFT ?auto_5628 ?auto_5622 ?auto_5629 ?auto_5627 )
      ( !LOAD ?auto_5628 ?auto_5622 ?auto_5626 ?auto_5627 )
      ( !DRIVE ?auto_5626 ?auto_5627 ?auto_5625 )
      ( !UNLOAD ?auto_5624 ?auto_5622 ?auto_5626 ?auto_5625 )
      ( !DROP ?auto_5624 ?auto_5622 ?auto_5623 ?auto_5625 )
      ( MAKE-ON-VERIFY ?auto_5622 ?auto_5623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5632 - SURFACE
      ?auto_5633 - SURFACE
    )
    :vars
    (
      ?auto_5634 - HOIST
      ?auto_5635 - PLACE
      ?auto_5637 - PLACE
      ?auto_5638 - HOIST
      ?auto_5639 - SURFACE
      ?auto_5636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5634 ?auto_5635 ) ( SURFACE-AT ?auto_5633 ?auto_5635 ) ( CLEAR ?auto_5633 ) ( IS-CRATE ?auto_5632 ) ( AVAILABLE ?auto_5634 ) ( not ( = ?auto_5637 ?auto_5635 ) ) ( HOIST-AT ?auto_5638 ?auto_5637 ) ( AVAILABLE ?auto_5638 ) ( SURFACE-AT ?auto_5632 ?auto_5637 ) ( ON ?auto_5632 ?auto_5639 ) ( CLEAR ?auto_5632 ) ( TRUCK-AT ?auto_5636 ?auto_5635 ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5639 ) ) ( not ( = ?auto_5633 ?auto_5639 ) ) ( not ( = ?auto_5634 ?auto_5638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5636 ?auto_5635 ?auto_5637 )
      ( !LIFT ?auto_5638 ?auto_5632 ?auto_5639 ?auto_5637 )
      ( !LOAD ?auto_5638 ?auto_5632 ?auto_5636 ?auto_5637 )
      ( !DRIVE ?auto_5636 ?auto_5637 ?auto_5635 )
      ( !UNLOAD ?auto_5634 ?auto_5632 ?auto_5636 ?auto_5635 )
      ( !DROP ?auto_5634 ?auto_5632 ?auto_5633 ?auto_5635 )
      ( MAKE-ON-VERIFY ?auto_5632 ?auto_5633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_5642 - SURFACE
      ?auto_5643 - SURFACE
    )
    :vars
    (
      ?auto_5644 - HOIST
      ?auto_5645 - PLACE
      ?auto_5647 - PLACE
      ?auto_5648 - HOIST
      ?auto_5649 - SURFACE
      ?auto_5646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5644 ?auto_5645 ) ( SURFACE-AT ?auto_5643 ?auto_5645 ) ( CLEAR ?auto_5643 ) ( IS-CRATE ?auto_5642 ) ( AVAILABLE ?auto_5644 ) ( not ( = ?auto_5647 ?auto_5645 ) ) ( HOIST-AT ?auto_5648 ?auto_5647 ) ( AVAILABLE ?auto_5648 ) ( SURFACE-AT ?auto_5642 ?auto_5647 ) ( ON ?auto_5642 ?auto_5649 ) ( CLEAR ?auto_5642 ) ( TRUCK-AT ?auto_5646 ?auto_5645 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( not ( = ?auto_5642 ?auto_5649 ) ) ( not ( = ?auto_5643 ?auto_5649 ) ) ( not ( = ?auto_5644 ?auto_5648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5646 ?auto_5645 ?auto_5647 )
      ( !LIFT ?auto_5648 ?auto_5642 ?auto_5649 ?auto_5647 )
      ( !LOAD ?auto_5648 ?auto_5642 ?auto_5646 ?auto_5647 )
      ( !DRIVE ?auto_5646 ?auto_5647 ?auto_5645 )
      ( !UNLOAD ?auto_5644 ?auto_5642 ?auto_5646 ?auto_5645 )
      ( !DROP ?auto_5644 ?auto_5642 ?auto_5643 ?auto_5645 )
      ( MAKE-ON-VERIFY ?auto_5642 ?auto_5643 ) )
  )

)

