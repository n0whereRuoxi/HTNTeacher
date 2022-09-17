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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441651 - SURFACE
      ?auto_441652 - SURFACE
    )
    :vars
    (
      ?auto_441653 - HOIST
      ?auto_441654 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441653 ?auto_441654 ) ( SURFACE-AT ?auto_441651 ?auto_441654 ) ( CLEAR ?auto_441651 ) ( LIFTING ?auto_441653 ?auto_441652 ) ( IS-CRATE ?auto_441652 ) ( not ( = ?auto_441651 ?auto_441652 ) ) )
    :subtasks
    ( ( !DROP ?auto_441653 ?auto_441652 ?auto_441651 ?auto_441654 )
      ( MAKE-1CRATE-VERIFY ?auto_441651 ?auto_441652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441655 - SURFACE
      ?auto_441656 - SURFACE
    )
    :vars
    (
      ?auto_441658 - HOIST
      ?auto_441657 - PLACE
      ?auto_441659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441658 ?auto_441657 ) ( SURFACE-AT ?auto_441655 ?auto_441657 ) ( CLEAR ?auto_441655 ) ( IS-CRATE ?auto_441656 ) ( not ( = ?auto_441655 ?auto_441656 ) ) ( TRUCK-AT ?auto_441659 ?auto_441657 ) ( AVAILABLE ?auto_441658 ) ( IN ?auto_441656 ?auto_441659 ) )
    :subtasks
    ( ( !UNLOAD ?auto_441658 ?auto_441656 ?auto_441659 ?auto_441657 )
      ( MAKE-1CRATE ?auto_441655 ?auto_441656 )
      ( MAKE-1CRATE-VERIFY ?auto_441655 ?auto_441656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441660 - SURFACE
      ?auto_441661 - SURFACE
    )
    :vars
    (
      ?auto_441662 - HOIST
      ?auto_441663 - PLACE
      ?auto_441664 - TRUCK
      ?auto_441665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441662 ?auto_441663 ) ( SURFACE-AT ?auto_441660 ?auto_441663 ) ( CLEAR ?auto_441660 ) ( IS-CRATE ?auto_441661 ) ( not ( = ?auto_441660 ?auto_441661 ) ) ( AVAILABLE ?auto_441662 ) ( IN ?auto_441661 ?auto_441664 ) ( TRUCK-AT ?auto_441664 ?auto_441665 ) ( not ( = ?auto_441665 ?auto_441663 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_441664 ?auto_441665 ?auto_441663 )
      ( MAKE-1CRATE ?auto_441660 ?auto_441661 )
      ( MAKE-1CRATE-VERIFY ?auto_441660 ?auto_441661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441666 - SURFACE
      ?auto_441667 - SURFACE
    )
    :vars
    (
      ?auto_441670 - HOIST
      ?auto_441668 - PLACE
      ?auto_441671 - TRUCK
      ?auto_441669 - PLACE
      ?auto_441672 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441670 ?auto_441668 ) ( SURFACE-AT ?auto_441666 ?auto_441668 ) ( CLEAR ?auto_441666 ) ( IS-CRATE ?auto_441667 ) ( not ( = ?auto_441666 ?auto_441667 ) ) ( AVAILABLE ?auto_441670 ) ( TRUCK-AT ?auto_441671 ?auto_441669 ) ( not ( = ?auto_441669 ?auto_441668 ) ) ( HOIST-AT ?auto_441672 ?auto_441669 ) ( LIFTING ?auto_441672 ?auto_441667 ) ( not ( = ?auto_441670 ?auto_441672 ) ) )
    :subtasks
    ( ( !LOAD ?auto_441672 ?auto_441667 ?auto_441671 ?auto_441669 )
      ( MAKE-1CRATE ?auto_441666 ?auto_441667 )
      ( MAKE-1CRATE-VERIFY ?auto_441666 ?auto_441667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441673 - SURFACE
      ?auto_441674 - SURFACE
    )
    :vars
    (
      ?auto_441678 - HOIST
      ?auto_441677 - PLACE
      ?auto_441676 - TRUCK
      ?auto_441675 - PLACE
      ?auto_441679 - HOIST
      ?auto_441680 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441678 ?auto_441677 ) ( SURFACE-AT ?auto_441673 ?auto_441677 ) ( CLEAR ?auto_441673 ) ( IS-CRATE ?auto_441674 ) ( not ( = ?auto_441673 ?auto_441674 ) ) ( AVAILABLE ?auto_441678 ) ( TRUCK-AT ?auto_441676 ?auto_441675 ) ( not ( = ?auto_441675 ?auto_441677 ) ) ( HOIST-AT ?auto_441679 ?auto_441675 ) ( not ( = ?auto_441678 ?auto_441679 ) ) ( AVAILABLE ?auto_441679 ) ( SURFACE-AT ?auto_441674 ?auto_441675 ) ( ON ?auto_441674 ?auto_441680 ) ( CLEAR ?auto_441674 ) ( not ( = ?auto_441673 ?auto_441680 ) ) ( not ( = ?auto_441674 ?auto_441680 ) ) )
    :subtasks
    ( ( !LIFT ?auto_441679 ?auto_441674 ?auto_441680 ?auto_441675 )
      ( MAKE-1CRATE ?auto_441673 ?auto_441674 )
      ( MAKE-1CRATE-VERIFY ?auto_441673 ?auto_441674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441681 - SURFACE
      ?auto_441682 - SURFACE
    )
    :vars
    (
      ?auto_441685 - HOIST
      ?auto_441683 - PLACE
      ?auto_441687 - PLACE
      ?auto_441688 - HOIST
      ?auto_441686 - SURFACE
      ?auto_441684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441685 ?auto_441683 ) ( SURFACE-AT ?auto_441681 ?auto_441683 ) ( CLEAR ?auto_441681 ) ( IS-CRATE ?auto_441682 ) ( not ( = ?auto_441681 ?auto_441682 ) ) ( AVAILABLE ?auto_441685 ) ( not ( = ?auto_441687 ?auto_441683 ) ) ( HOIST-AT ?auto_441688 ?auto_441687 ) ( not ( = ?auto_441685 ?auto_441688 ) ) ( AVAILABLE ?auto_441688 ) ( SURFACE-AT ?auto_441682 ?auto_441687 ) ( ON ?auto_441682 ?auto_441686 ) ( CLEAR ?auto_441682 ) ( not ( = ?auto_441681 ?auto_441686 ) ) ( not ( = ?auto_441682 ?auto_441686 ) ) ( TRUCK-AT ?auto_441684 ?auto_441683 ) )
    :subtasks
    ( ( !DRIVE ?auto_441684 ?auto_441683 ?auto_441687 )
      ( MAKE-1CRATE ?auto_441681 ?auto_441682 )
      ( MAKE-1CRATE-VERIFY ?auto_441681 ?auto_441682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441698 - SURFACE
      ?auto_441699 - SURFACE
      ?auto_441700 - SURFACE
    )
    :vars
    (
      ?auto_441701 - HOIST
      ?auto_441702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441701 ?auto_441702 ) ( SURFACE-AT ?auto_441699 ?auto_441702 ) ( CLEAR ?auto_441699 ) ( LIFTING ?auto_441701 ?auto_441700 ) ( IS-CRATE ?auto_441700 ) ( not ( = ?auto_441699 ?auto_441700 ) ) ( ON ?auto_441699 ?auto_441698 ) ( not ( = ?auto_441698 ?auto_441699 ) ) ( not ( = ?auto_441698 ?auto_441700 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441699 ?auto_441700 )
      ( MAKE-2CRATE-VERIFY ?auto_441698 ?auto_441699 ?auto_441700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441708 - SURFACE
      ?auto_441709 - SURFACE
      ?auto_441710 - SURFACE
    )
    :vars
    (
      ?auto_441713 - HOIST
      ?auto_441712 - PLACE
      ?auto_441711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441713 ?auto_441712 ) ( SURFACE-AT ?auto_441709 ?auto_441712 ) ( CLEAR ?auto_441709 ) ( IS-CRATE ?auto_441710 ) ( not ( = ?auto_441709 ?auto_441710 ) ) ( TRUCK-AT ?auto_441711 ?auto_441712 ) ( AVAILABLE ?auto_441713 ) ( IN ?auto_441710 ?auto_441711 ) ( ON ?auto_441709 ?auto_441708 ) ( not ( = ?auto_441708 ?auto_441709 ) ) ( not ( = ?auto_441708 ?auto_441710 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441709 ?auto_441710 )
      ( MAKE-2CRATE-VERIFY ?auto_441708 ?auto_441709 ?auto_441710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441714 - SURFACE
      ?auto_441715 - SURFACE
    )
    :vars
    (
      ?auto_441717 - HOIST
      ?auto_441716 - PLACE
      ?auto_441719 - TRUCK
      ?auto_441718 - SURFACE
      ?auto_441720 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441717 ?auto_441716 ) ( SURFACE-AT ?auto_441714 ?auto_441716 ) ( CLEAR ?auto_441714 ) ( IS-CRATE ?auto_441715 ) ( not ( = ?auto_441714 ?auto_441715 ) ) ( AVAILABLE ?auto_441717 ) ( IN ?auto_441715 ?auto_441719 ) ( ON ?auto_441714 ?auto_441718 ) ( not ( = ?auto_441718 ?auto_441714 ) ) ( not ( = ?auto_441718 ?auto_441715 ) ) ( TRUCK-AT ?auto_441719 ?auto_441720 ) ( not ( = ?auto_441720 ?auto_441716 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_441719 ?auto_441720 ?auto_441716 )
      ( MAKE-2CRATE ?auto_441718 ?auto_441714 ?auto_441715 )
      ( MAKE-1CRATE-VERIFY ?auto_441714 ?auto_441715 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441721 - SURFACE
      ?auto_441722 - SURFACE
      ?auto_441723 - SURFACE
    )
    :vars
    (
      ?auto_441726 - HOIST
      ?auto_441725 - PLACE
      ?auto_441727 - TRUCK
      ?auto_441724 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441726 ?auto_441725 ) ( SURFACE-AT ?auto_441722 ?auto_441725 ) ( CLEAR ?auto_441722 ) ( IS-CRATE ?auto_441723 ) ( not ( = ?auto_441722 ?auto_441723 ) ) ( AVAILABLE ?auto_441726 ) ( IN ?auto_441723 ?auto_441727 ) ( ON ?auto_441722 ?auto_441721 ) ( not ( = ?auto_441721 ?auto_441722 ) ) ( not ( = ?auto_441721 ?auto_441723 ) ) ( TRUCK-AT ?auto_441727 ?auto_441724 ) ( not ( = ?auto_441724 ?auto_441725 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441722 ?auto_441723 )
      ( MAKE-2CRATE-VERIFY ?auto_441721 ?auto_441722 ?auto_441723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441728 - SURFACE
      ?auto_441729 - SURFACE
    )
    :vars
    (
      ?auto_441733 - HOIST
      ?auto_441730 - PLACE
      ?auto_441732 - SURFACE
      ?auto_441731 - TRUCK
      ?auto_441734 - PLACE
      ?auto_441735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441733 ?auto_441730 ) ( SURFACE-AT ?auto_441728 ?auto_441730 ) ( CLEAR ?auto_441728 ) ( IS-CRATE ?auto_441729 ) ( not ( = ?auto_441728 ?auto_441729 ) ) ( AVAILABLE ?auto_441733 ) ( ON ?auto_441728 ?auto_441732 ) ( not ( = ?auto_441732 ?auto_441728 ) ) ( not ( = ?auto_441732 ?auto_441729 ) ) ( TRUCK-AT ?auto_441731 ?auto_441734 ) ( not ( = ?auto_441734 ?auto_441730 ) ) ( HOIST-AT ?auto_441735 ?auto_441734 ) ( LIFTING ?auto_441735 ?auto_441729 ) ( not ( = ?auto_441733 ?auto_441735 ) ) )
    :subtasks
    ( ( !LOAD ?auto_441735 ?auto_441729 ?auto_441731 ?auto_441734 )
      ( MAKE-2CRATE ?auto_441732 ?auto_441728 ?auto_441729 )
      ( MAKE-1CRATE-VERIFY ?auto_441728 ?auto_441729 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441736 - SURFACE
      ?auto_441737 - SURFACE
      ?auto_441738 - SURFACE
    )
    :vars
    (
      ?auto_441739 - HOIST
      ?auto_441740 - PLACE
      ?auto_441743 - TRUCK
      ?auto_441742 - PLACE
      ?auto_441741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441739 ?auto_441740 ) ( SURFACE-AT ?auto_441737 ?auto_441740 ) ( CLEAR ?auto_441737 ) ( IS-CRATE ?auto_441738 ) ( not ( = ?auto_441737 ?auto_441738 ) ) ( AVAILABLE ?auto_441739 ) ( ON ?auto_441737 ?auto_441736 ) ( not ( = ?auto_441736 ?auto_441737 ) ) ( not ( = ?auto_441736 ?auto_441738 ) ) ( TRUCK-AT ?auto_441743 ?auto_441742 ) ( not ( = ?auto_441742 ?auto_441740 ) ) ( HOIST-AT ?auto_441741 ?auto_441742 ) ( LIFTING ?auto_441741 ?auto_441738 ) ( not ( = ?auto_441739 ?auto_441741 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441737 ?auto_441738 )
      ( MAKE-2CRATE-VERIFY ?auto_441736 ?auto_441737 ?auto_441738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441744 - SURFACE
      ?auto_441745 - SURFACE
    )
    :vars
    (
      ?auto_441748 - HOIST
      ?auto_441746 - PLACE
      ?auto_441749 - SURFACE
      ?auto_441750 - TRUCK
      ?auto_441747 - PLACE
      ?auto_441751 - HOIST
      ?auto_441752 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441748 ?auto_441746 ) ( SURFACE-AT ?auto_441744 ?auto_441746 ) ( CLEAR ?auto_441744 ) ( IS-CRATE ?auto_441745 ) ( not ( = ?auto_441744 ?auto_441745 ) ) ( AVAILABLE ?auto_441748 ) ( ON ?auto_441744 ?auto_441749 ) ( not ( = ?auto_441749 ?auto_441744 ) ) ( not ( = ?auto_441749 ?auto_441745 ) ) ( TRUCK-AT ?auto_441750 ?auto_441747 ) ( not ( = ?auto_441747 ?auto_441746 ) ) ( HOIST-AT ?auto_441751 ?auto_441747 ) ( not ( = ?auto_441748 ?auto_441751 ) ) ( AVAILABLE ?auto_441751 ) ( SURFACE-AT ?auto_441745 ?auto_441747 ) ( ON ?auto_441745 ?auto_441752 ) ( CLEAR ?auto_441745 ) ( not ( = ?auto_441744 ?auto_441752 ) ) ( not ( = ?auto_441745 ?auto_441752 ) ) ( not ( = ?auto_441749 ?auto_441752 ) ) )
    :subtasks
    ( ( !LIFT ?auto_441751 ?auto_441745 ?auto_441752 ?auto_441747 )
      ( MAKE-2CRATE ?auto_441749 ?auto_441744 ?auto_441745 )
      ( MAKE-1CRATE-VERIFY ?auto_441744 ?auto_441745 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441753 - SURFACE
      ?auto_441754 - SURFACE
      ?auto_441755 - SURFACE
    )
    :vars
    (
      ?auto_441757 - HOIST
      ?auto_441759 - PLACE
      ?auto_441758 - TRUCK
      ?auto_441756 - PLACE
      ?auto_441761 - HOIST
      ?auto_441760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441757 ?auto_441759 ) ( SURFACE-AT ?auto_441754 ?auto_441759 ) ( CLEAR ?auto_441754 ) ( IS-CRATE ?auto_441755 ) ( not ( = ?auto_441754 ?auto_441755 ) ) ( AVAILABLE ?auto_441757 ) ( ON ?auto_441754 ?auto_441753 ) ( not ( = ?auto_441753 ?auto_441754 ) ) ( not ( = ?auto_441753 ?auto_441755 ) ) ( TRUCK-AT ?auto_441758 ?auto_441756 ) ( not ( = ?auto_441756 ?auto_441759 ) ) ( HOIST-AT ?auto_441761 ?auto_441756 ) ( not ( = ?auto_441757 ?auto_441761 ) ) ( AVAILABLE ?auto_441761 ) ( SURFACE-AT ?auto_441755 ?auto_441756 ) ( ON ?auto_441755 ?auto_441760 ) ( CLEAR ?auto_441755 ) ( not ( = ?auto_441754 ?auto_441760 ) ) ( not ( = ?auto_441755 ?auto_441760 ) ) ( not ( = ?auto_441753 ?auto_441760 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441754 ?auto_441755 )
      ( MAKE-2CRATE-VERIFY ?auto_441753 ?auto_441754 ?auto_441755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441762 - SURFACE
      ?auto_441763 - SURFACE
    )
    :vars
    (
      ?auto_441767 - HOIST
      ?auto_441769 - PLACE
      ?auto_441766 - SURFACE
      ?auto_441764 - PLACE
      ?auto_441765 - HOIST
      ?auto_441768 - SURFACE
      ?auto_441770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441767 ?auto_441769 ) ( SURFACE-AT ?auto_441762 ?auto_441769 ) ( CLEAR ?auto_441762 ) ( IS-CRATE ?auto_441763 ) ( not ( = ?auto_441762 ?auto_441763 ) ) ( AVAILABLE ?auto_441767 ) ( ON ?auto_441762 ?auto_441766 ) ( not ( = ?auto_441766 ?auto_441762 ) ) ( not ( = ?auto_441766 ?auto_441763 ) ) ( not ( = ?auto_441764 ?auto_441769 ) ) ( HOIST-AT ?auto_441765 ?auto_441764 ) ( not ( = ?auto_441767 ?auto_441765 ) ) ( AVAILABLE ?auto_441765 ) ( SURFACE-AT ?auto_441763 ?auto_441764 ) ( ON ?auto_441763 ?auto_441768 ) ( CLEAR ?auto_441763 ) ( not ( = ?auto_441762 ?auto_441768 ) ) ( not ( = ?auto_441763 ?auto_441768 ) ) ( not ( = ?auto_441766 ?auto_441768 ) ) ( TRUCK-AT ?auto_441770 ?auto_441769 ) )
    :subtasks
    ( ( !DRIVE ?auto_441770 ?auto_441769 ?auto_441764 )
      ( MAKE-2CRATE ?auto_441766 ?auto_441762 ?auto_441763 )
      ( MAKE-1CRATE-VERIFY ?auto_441762 ?auto_441763 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441771 - SURFACE
      ?auto_441772 - SURFACE
      ?auto_441773 - SURFACE
    )
    :vars
    (
      ?auto_441776 - HOIST
      ?auto_441777 - PLACE
      ?auto_441779 - PLACE
      ?auto_441775 - HOIST
      ?auto_441778 - SURFACE
      ?auto_441774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441776 ?auto_441777 ) ( SURFACE-AT ?auto_441772 ?auto_441777 ) ( CLEAR ?auto_441772 ) ( IS-CRATE ?auto_441773 ) ( not ( = ?auto_441772 ?auto_441773 ) ) ( AVAILABLE ?auto_441776 ) ( ON ?auto_441772 ?auto_441771 ) ( not ( = ?auto_441771 ?auto_441772 ) ) ( not ( = ?auto_441771 ?auto_441773 ) ) ( not ( = ?auto_441779 ?auto_441777 ) ) ( HOIST-AT ?auto_441775 ?auto_441779 ) ( not ( = ?auto_441776 ?auto_441775 ) ) ( AVAILABLE ?auto_441775 ) ( SURFACE-AT ?auto_441773 ?auto_441779 ) ( ON ?auto_441773 ?auto_441778 ) ( CLEAR ?auto_441773 ) ( not ( = ?auto_441772 ?auto_441778 ) ) ( not ( = ?auto_441773 ?auto_441778 ) ) ( not ( = ?auto_441771 ?auto_441778 ) ) ( TRUCK-AT ?auto_441774 ?auto_441777 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441772 ?auto_441773 )
      ( MAKE-2CRATE-VERIFY ?auto_441771 ?auto_441772 ?auto_441773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441780 - SURFACE
      ?auto_441781 - SURFACE
    )
    :vars
    (
      ?auto_441787 - HOIST
      ?auto_441784 - PLACE
      ?auto_441782 - SURFACE
      ?auto_441788 - PLACE
      ?auto_441783 - HOIST
      ?auto_441785 - SURFACE
      ?auto_441786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441787 ?auto_441784 ) ( IS-CRATE ?auto_441781 ) ( not ( = ?auto_441780 ?auto_441781 ) ) ( not ( = ?auto_441782 ?auto_441780 ) ) ( not ( = ?auto_441782 ?auto_441781 ) ) ( not ( = ?auto_441788 ?auto_441784 ) ) ( HOIST-AT ?auto_441783 ?auto_441788 ) ( not ( = ?auto_441787 ?auto_441783 ) ) ( AVAILABLE ?auto_441783 ) ( SURFACE-AT ?auto_441781 ?auto_441788 ) ( ON ?auto_441781 ?auto_441785 ) ( CLEAR ?auto_441781 ) ( not ( = ?auto_441780 ?auto_441785 ) ) ( not ( = ?auto_441781 ?auto_441785 ) ) ( not ( = ?auto_441782 ?auto_441785 ) ) ( TRUCK-AT ?auto_441786 ?auto_441784 ) ( SURFACE-AT ?auto_441782 ?auto_441784 ) ( CLEAR ?auto_441782 ) ( LIFTING ?auto_441787 ?auto_441780 ) ( IS-CRATE ?auto_441780 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441782 ?auto_441780 )
      ( MAKE-2CRATE ?auto_441782 ?auto_441780 ?auto_441781 )
      ( MAKE-1CRATE-VERIFY ?auto_441780 ?auto_441781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441789 - SURFACE
      ?auto_441790 - SURFACE
      ?auto_441791 - SURFACE
    )
    :vars
    (
      ?auto_441792 - HOIST
      ?auto_441797 - PLACE
      ?auto_441795 - PLACE
      ?auto_441793 - HOIST
      ?auto_441796 - SURFACE
      ?auto_441794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441792 ?auto_441797 ) ( IS-CRATE ?auto_441791 ) ( not ( = ?auto_441790 ?auto_441791 ) ) ( not ( = ?auto_441789 ?auto_441790 ) ) ( not ( = ?auto_441789 ?auto_441791 ) ) ( not ( = ?auto_441795 ?auto_441797 ) ) ( HOIST-AT ?auto_441793 ?auto_441795 ) ( not ( = ?auto_441792 ?auto_441793 ) ) ( AVAILABLE ?auto_441793 ) ( SURFACE-AT ?auto_441791 ?auto_441795 ) ( ON ?auto_441791 ?auto_441796 ) ( CLEAR ?auto_441791 ) ( not ( = ?auto_441790 ?auto_441796 ) ) ( not ( = ?auto_441791 ?auto_441796 ) ) ( not ( = ?auto_441789 ?auto_441796 ) ) ( TRUCK-AT ?auto_441794 ?auto_441797 ) ( SURFACE-AT ?auto_441789 ?auto_441797 ) ( CLEAR ?auto_441789 ) ( LIFTING ?auto_441792 ?auto_441790 ) ( IS-CRATE ?auto_441790 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441790 ?auto_441791 )
      ( MAKE-2CRATE-VERIFY ?auto_441789 ?auto_441790 ?auto_441791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441798 - SURFACE
      ?auto_441799 - SURFACE
    )
    :vars
    (
      ?auto_441800 - HOIST
      ?auto_441804 - PLACE
      ?auto_441805 - SURFACE
      ?auto_441801 - PLACE
      ?auto_441806 - HOIST
      ?auto_441803 - SURFACE
      ?auto_441802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441800 ?auto_441804 ) ( IS-CRATE ?auto_441799 ) ( not ( = ?auto_441798 ?auto_441799 ) ) ( not ( = ?auto_441805 ?auto_441798 ) ) ( not ( = ?auto_441805 ?auto_441799 ) ) ( not ( = ?auto_441801 ?auto_441804 ) ) ( HOIST-AT ?auto_441806 ?auto_441801 ) ( not ( = ?auto_441800 ?auto_441806 ) ) ( AVAILABLE ?auto_441806 ) ( SURFACE-AT ?auto_441799 ?auto_441801 ) ( ON ?auto_441799 ?auto_441803 ) ( CLEAR ?auto_441799 ) ( not ( = ?auto_441798 ?auto_441803 ) ) ( not ( = ?auto_441799 ?auto_441803 ) ) ( not ( = ?auto_441805 ?auto_441803 ) ) ( TRUCK-AT ?auto_441802 ?auto_441804 ) ( SURFACE-AT ?auto_441805 ?auto_441804 ) ( CLEAR ?auto_441805 ) ( IS-CRATE ?auto_441798 ) ( AVAILABLE ?auto_441800 ) ( IN ?auto_441798 ?auto_441802 ) )
    :subtasks
    ( ( !UNLOAD ?auto_441800 ?auto_441798 ?auto_441802 ?auto_441804 )
      ( MAKE-2CRATE ?auto_441805 ?auto_441798 ?auto_441799 )
      ( MAKE-1CRATE-VERIFY ?auto_441798 ?auto_441799 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_441807 - SURFACE
      ?auto_441808 - SURFACE
      ?auto_441809 - SURFACE
    )
    :vars
    (
      ?auto_441812 - HOIST
      ?auto_441814 - PLACE
      ?auto_441811 - PLACE
      ?auto_441815 - HOIST
      ?auto_441813 - SURFACE
      ?auto_441810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441812 ?auto_441814 ) ( IS-CRATE ?auto_441809 ) ( not ( = ?auto_441808 ?auto_441809 ) ) ( not ( = ?auto_441807 ?auto_441808 ) ) ( not ( = ?auto_441807 ?auto_441809 ) ) ( not ( = ?auto_441811 ?auto_441814 ) ) ( HOIST-AT ?auto_441815 ?auto_441811 ) ( not ( = ?auto_441812 ?auto_441815 ) ) ( AVAILABLE ?auto_441815 ) ( SURFACE-AT ?auto_441809 ?auto_441811 ) ( ON ?auto_441809 ?auto_441813 ) ( CLEAR ?auto_441809 ) ( not ( = ?auto_441808 ?auto_441813 ) ) ( not ( = ?auto_441809 ?auto_441813 ) ) ( not ( = ?auto_441807 ?auto_441813 ) ) ( TRUCK-AT ?auto_441810 ?auto_441814 ) ( SURFACE-AT ?auto_441807 ?auto_441814 ) ( CLEAR ?auto_441807 ) ( IS-CRATE ?auto_441808 ) ( AVAILABLE ?auto_441812 ) ( IN ?auto_441808 ?auto_441810 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441808 ?auto_441809 )
      ( MAKE-2CRATE-VERIFY ?auto_441807 ?auto_441808 ?auto_441809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_441852 - SURFACE
      ?auto_441853 - SURFACE
    )
    :vars
    (
      ?auto_441856 - HOIST
      ?auto_441857 - PLACE
      ?auto_441859 - SURFACE
      ?auto_441860 - PLACE
      ?auto_441854 - HOIST
      ?auto_441858 - SURFACE
      ?auto_441855 - TRUCK
      ?auto_441861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441856 ?auto_441857 ) ( SURFACE-AT ?auto_441852 ?auto_441857 ) ( CLEAR ?auto_441852 ) ( IS-CRATE ?auto_441853 ) ( not ( = ?auto_441852 ?auto_441853 ) ) ( AVAILABLE ?auto_441856 ) ( ON ?auto_441852 ?auto_441859 ) ( not ( = ?auto_441859 ?auto_441852 ) ) ( not ( = ?auto_441859 ?auto_441853 ) ) ( not ( = ?auto_441860 ?auto_441857 ) ) ( HOIST-AT ?auto_441854 ?auto_441860 ) ( not ( = ?auto_441856 ?auto_441854 ) ) ( AVAILABLE ?auto_441854 ) ( SURFACE-AT ?auto_441853 ?auto_441860 ) ( ON ?auto_441853 ?auto_441858 ) ( CLEAR ?auto_441853 ) ( not ( = ?auto_441852 ?auto_441858 ) ) ( not ( = ?auto_441853 ?auto_441858 ) ) ( not ( = ?auto_441859 ?auto_441858 ) ) ( TRUCK-AT ?auto_441855 ?auto_441861 ) ( not ( = ?auto_441861 ?auto_441857 ) ) ( not ( = ?auto_441860 ?auto_441861 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_441855 ?auto_441861 ?auto_441857 )
      ( MAKE-1CRATE ?auto_441852 ?auto_441853 )
      ( MAKE-1CRATE-VERIFY ?auto_441852 ?auto_441853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441892 - SURFACE
      ?auto_441893 - SURFACE
      ?auto_441894 - SURFACE
      ?auto_441891 - SURFACE
    )
    :vars
    (
      ?auto_441895 - HOIST
      ?auto_441896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441895 ?auto_441896 ) ( SURFACE-AT ?auto_441894 ?auto_441896 ) ( CLEAR ?auto_441894 ) ( LIFTING ?auto_441895 ?auto_441891 ) ( IS-CRATE ?auto_441891 ) ( not ( = ?auto_441894 ?auto_441891 ) ) ( ON ?auto_441893 ?auto_441892 ) ( ON ?auto_441894 ?auto_441893 ) ( not ( = ?auto_441892 ?auto_441893 ) ) ( not ( = ?auto_441892 ?auto_441894 ) ) ( not ( = ?auto_441892 ?auto_441891 ) ) ( not ( = ?auto_441893 ?auto_441894 ) ) ( not ( = ?auto_441893 ?auto_441891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441894 ?auto_441891 )
      ( MAKE-3CRATE-VERIFY ?auto_441892 ?auto_441893 ?auto_441894 ?auto_441891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441909 - SURFACE
      ?auto_441910 - SURFACE
      ?auto_441911 - SURFACE
      ?auto_441908 - SURFACE
    )
    :vars
    (
      ?auto_441913 - HOIST
      ?auto_441912 - PLACE
      ?auto_441914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441913 ?auto_441912 ) ( SURFACE-AT ?auto_441911 ?auto_441912 ) ( CLEAR ?auto_441911 ) ( IS-CRATE ?auto_441908 ) ( not ( = ?auto_441911 ?auto_441908 ) ) ( TRUCK-AT ?auto_441914 ?auto_441912 ) ( AVAILABLE ?auto_441913 ) ( IN ?auto_441908 ?auto_441914 ) ( ON ?auto_441911 ?auto_441910 ) ( not ( = ?auto_441910 ?auto_441911 ) ) ( not ( = ?auto_441910 ?auto_441908 ) ) ( ON ?auto_441910 ?auto_441909 ) ( not ( = ?auto_441909 ?auto_441910 ) ) ( not ( = ?auto_441909 ?auto_441911 ) ) ( not ( = ?auto_441909 ?auto_441908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441910 ?auto_441911 ?auto_441908 )
      ( MAKE-3CRATE-VERIFY ?auto_441909 ?auto_441910 ?auto_441911 ?auto_441908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441930 - SURFACE
      ?auto_441931 - SURFACE
      ?auto_441932 - SURFACE
      ?auto_441929 - SURFACE
    )
    :vars
    (
      ?auto_441936 - HOIST
      ?auto_441935 - PLACE
      ?auto_441933 - TRUCK
      ?auto_441934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441936 ?auto_441935 ) ( SURFACE-AT ?auto_441932 ?auto_441935 ) ( CLEAR ?auto_441932 ) ( IS-CRATE ?auto_441929 ) ( not ( = ?auto_441932 ?auto_441929 ) ) ( AVAILABLE ?auto_441936 ) ( IN ?auto_441929 ?auto_441933 ) ( ON ?auto_441932 ?auto_441931 ) ( not ( = ?auto_441931 ?auto_441932 ) ) ( not ( = ?auto_441931 ?auto_441929 ) ) ( TRUCK-AT ?auto_441933 ?auto_441934 ) ( not ( = ?auto_441934 ?auto_441935 ) ) ( ON ?auto_441931 ?auto_441930 ) ( not ( = ?auto_441930 ?auto_441931 ) ) ( not ( = ?auto_441930 ?auto_441932 ) ) ( not ( = ?auto_441930 ?auto_441929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441931 ?auto_441932 ?auto_441929 )
      ( MAKE-3CRATE-VERIFY ?auto_441930 ?auto_441931 ?auto_441932 ?auto_441929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441954 - SURFACE
      ?auto_441955 - SURFACE
      ?auto_441956 - SURFACE
      ?auto_441953 - SURFACE
    )
    :vars
    (
      ?auto_441958 - HOIST
      ?auto_441960 - PLACE
      ?auto_441957 - TRUCK
      ?auto_441961 - PLACE
      ?auto_441959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441958 ?auto_441960 ) ( SURFACE-AT ?auto_441956 ?auto_441960 ) ( CLEAR ?auto_441956 ) ( IS-CRATE ?auto_441953 ) ( not ( = ?auto_441956 ?auto_441953 ) ) ( AVAILABLE ?auto_441958 ) ( ON ?auto_441956 ?auto_441955 ) ( not ( = ?auto_441955 ?auto_441956 ) ) ( not ( = ?auto_441955 ?auto_441953 ) ) ( TRUCK-AT ?auto_441957 ?auto_441961 ) ( not ( = ?auto_441961 ?auto_441960 ) ) ( HOIST-AT ?auto_441959 ?auto_441961 ) ( LIFTING ?auto_441959 ?auto_441953 ) ( not ( = ?auto_441958 ?auto_441959 ) ) ( ON ?auto_441955 ?auto_441954 ) ( not ( = ?auto_441954 ?auto_441955 ) ) ( not ( = ?auto_441954 ?auto_441956 ) ) ( not ( = ?auto_441954 ?auto_441953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441955 ?auto_441956 ?auto_441953 )
      ( MAKE-3CRATE-VERIFY ?auto_441954 ?auto_441955 ?auto_441956 ?auto_441953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441981 - SURFACE
      ?auto_441982 - SURFACE
      ?auto_441983 - SURFACE
      ?auto_441980 - SURFACE
    )
    :vars
    (
      ?auto_441986 - HOIST
      ?auto_441987 - PLACE
      ?auto_441988 - TRUCK
      ?auto_441985 - PLACE
      ?auto_441989 - HOIST
      ?auto_441984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441986 ?auto_441987 ) ( SURFACE-AT ?auto_441983 ?auto_441987 ) ( CLEAR ?auto_441983 ) ( IS-CRATE ?auto_441980 ) ( not ( = ?auto_441983 ?auto_441980 ) ) ( AVAILABLE ?auto_441986 ) ( ON ?auto_441983 ?auto_441982 ) ( not ( = ?auto_441982 ?auto_441983 ) ) ( not ( = ?auto_441982 ?auto_441980 ) ) ( TRUCK-AT ?auto_441988 ?auto_441985 ) ( not ( = ?auto_441985 ?auto_441987 ) ) ( HOIST-AT ?auto_441989 ?auto_441985 ) ( not ( = ?auto_441986 ?auto_441989 ) ) ( AVAILABLE ?auto_441989 ) ( SURFACE-AT ?auto_441980 ?auto_441985 ) ( ON ?auto_441980 ?auto_441984 ) ( CLEAR ?auto_441980 ) ( not ( = ?auto_441983 ?auto_441984 ) ) ( not ( = ?auto_441980 ?auto_441984 ) ) ( not ( = ?auto_441982 ?auto_441984 ) ) ( ON ?auto_441982 ?auto_441981 ) ( not ( = ?auto_441981 ?auto_441982 ) ) ( not ( = ?auto_441981 ?auto_441983 ) ) ( not ( = ?auto_441981 ?auto_441980 ) ) ( not ( = ?auto_441981 ?auto_441984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441982 ?auto_441983 ?auto_441980 )
      ( MAKE-3CRATE-VERIFY ?auto_441981 ?auto_441982 ?auto_441983 ?auto_441980 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442009 - SURFACE
      ?auto_442010 - SURFACE
      ?auto_442011 - SURFACE
      ?auto_442008 - SURFACE
    )
    :vars
    (
      ?auto_442014 - HOIST
      ?auto_442017 - PLACE
      ?auto_442016 - PLACE
      ?auto_442012 - HOIST
      ?auto_442015 - SURFACE
      ?auto_442013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442014 ?auto_442017 ) ( SURFACE-AT ?auto_442011 ?auto_442017 ) ( CLEAR ?auto_442011 ) ( IS-CRATE ?auto_442008 ) ( not ( = ?auto_442011 ?auto_442008 ) ) ( AVAILABLE ?auto_442014 ) ( ON ?auto_442011 ?auto_442010 ) ( not ( = ?auto_442010 ?auto_442011 ) ) ( not ( = ?auto_442010 ?auto_442008 ) ) ( not ( = ?auto_442016 ?auto_442017 ) ) ( HOIST-AT ?auto_442012 ?auto_442016 ) ( not ( = ?auto_442014 ?auto_442012 ) ) ( AVAILABLE ?auto_442012 ) ( SURFACE-AT ?auto_442008 ?auto_442016 ) ( ON ?auto_442008 ?auto_442015 ) ( CLEAR ?auto_442008 ) ( not ( = ?auto_442011 ?auto_442015 ) ) ( not ( = ?auto_442008 ?auto_442015 ) ) ( not ( = ?auto_442010 ?auto_442015 ) ) ( TRUCK-AT ?auto_442013 ?auto_442017 ) ( ON ?auto_442010 ?auto_442009 ) ( not ( = ?auto_442009 ?auto_442010 ) ) ( not ( = ?auto_442009 ?auto_442011 ) ) ( not ( = ?auto_442009 ?auto_442008 ) ) ( not ( = ?auto_442009 ?auto_442015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442010 ?auto_442011 ?auto_442008 )
      ( MAKE-3CRATE-VERIFY ?auto_442009 ?auto_442010 ?auto_442011 ?auto_442008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442037 - SURFACE
      ?auto_442038 - SURFACE
      ?auto_442039 - SURFACE
      ?auto_442036 - SURFACE
    )
    :vars
    (
      ?auto_442045 - HOIST
      ?auto_442043 - PLACE
      ?auto_442042 - PLACE
      ?auto_442044 - HOIST
      ?auto_442040 - SURFACE
      ?auto_442041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442045 ?auto_442043 ) ( IS-CRATE ?auto_442036 ) ( not ( = ?auto_442039 ?auto_442036 ) ) ( not ( = ?auto_442038 ?auto_442039 ) ) ( not ( = ?auto_442038 ?auto_442036 ) ) ( not ( = ?auto_442042 ?auto_442043 ) ) ( HOIST-AT ?auto_442044 ?auto_442042 ) ( not ( = ?auto_442045 ?auto_442044 ) ) ( AVAILABLE ?auto_442044 ) ( SURFACE-AT ?auto_442036 ?auto_442042 ) ( ON ?auto_442036 ?auto_442040 ) ( CLEAR ?auto_442036 ) ( not ( = ?auto_442039 ?auto_442040 ) ) ( not ( = ?auto_442036 ?auto_442040 ) ) ( not ( = ?auto_442038 ?auto_442040 ) ) ( TRUCK-AT ?auto_442041 ?auto_442043 ) ( SURFACE-AT ?auto_442038 ?auto_442043 ) ( CLEAR ?auto_442038 ) ( LIFTING ?auto_442045 ?auto_442039 ) ( IS-CRATE ?auto_442039 ) ( ON ?auto_442038 ?auto_442037 ) ( not ( = ?auto_442037 ?auto_442038 ) ) ( not ( = ?auto_442037 ?auto_442039 ) ) ( not ( = ?auto_442037 ?auto_442036 ) ) ( not ( = ?auto_442037 ?auto_442040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442038 ?auto_442039 ?auto_442036 )
      ( MAKE-3CRATE-VERIFY ?auto_442037 ?auto_442038 ?auto_442039 ?auto_442036 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442065 - SURFACE
      ?auto_442066 - SURFACE
      ?auto_442067 - SURFACE
      ?auto_442064 - SURFACE
    )
    :vars
    (
      ?auto_442073 - HOIST
      ?auto_442070 - PLACE
      ?auto_442068 - PLACE
      ?auto_442069 - HOIST
      ?auto_442072 - SURFACE
      ?auto_442071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442073 ?auto_442070 ) ( IS-CRATE ?auto_442064 ) ( not ( = ?auto_442067 ?auto_442064 ) ) ( not ( = ?auto_442066 ?auto_442067 ) ) ( not ( = ?auto_442066 ?auto_442064 ) ) ( not ( = ?auto_442068 ?auto_442070 ) ) ( HOIST-AT ?auto_442069 ?auto_442068 ) ( not ( = ?auto_442073 ?auto_442069 ) ) ( AVAILABLE ?auto_442069 ) ( SURFACE-AT ?auto_442064 ?auto_442068 ) ( ON ?auto_442064 ?auto_442072 ) ( CLEAR ?auto_442064 ) ( not ( = ?auto_442067 ?auto_442072 ) ) ( not ( = ?auto_442064 ?auto_442072 ) ) ( not ( = ?auto_442066 ?auto_442072 ) ) ( TRUCK-AT ?auto_442071 ?auto_442070 ) ( SURFACE-AT ?auto_442066 ?auto_442070 ) ( CLEAR ?auto_442066 ) ( IS-CRATE ?auto_442067 ) ( AVAILABLE ?auto_442073 ) ( IN ?auto_442067 ?auto_442071 ) ( ON ?auto_442066 ?auto_442065 ) ( not ( = ?auto_442065 ?auto_442066 ) ) ( not ( = ?auto_442065 ?auto_442067 ) ) ( not ( = ?auto_442065 ?auto_442064 ) ) ( not ( = ?auto_442065 ?auto_442072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442066 ?auto_442067 ?auto_442064 )
      ( MAKE-3CRATE-VERIFY ?auto_442065 ?auto_442066 ?auto_442067 ?auto_442064 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442074 - SURFACE
      ?auto_442075 - SURFACE
    )
    :vars
    (
      ?auto_442082 - HOIST
      ?auto_442079 - PLACE
      ?auto_442078 - SURFACE
      ?auto_442076 - PLACE
      ?auto_442077 - HOIST
      ?auto_442081 - SURFACE
      ?auto_442080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442082 ?auto_442079 ) ( IS-CRATE ?auto_442075 ) ( not ( = ?auto_442074 ?auto_442075 ) ) ( not ( = ?auto_442078 ?auto_442074 ) ) ( not ( = ?auto_442078 ?auto_442075 ) ) ( not ( = ?auto_442076 ?auto_442079 ) ) ( HOIST-AT ?auto_442077 ?auto_442076 ) ( not ( = ?auto_442082 ?auto_442077 ) ) ( AVAILABLE ?auto_442077 ) ( SURFACE-AT ?auto_442075 ?auto_442076 ) ( ON ?auto_442075 ?auto_442081 ) ( CLEAR ?auto_442075 ) ( not ( = ?auto_442074 ?auto_442081 ) ) ( not ( = ?auto_442075 ?auto_442081 ) ) ( not ( = ?auto_442078 ?auto_442081 ) ) ( SURFACE-AT ?auto_442078 ?auto_442079 ) ( CLEAR ?auto_442078 ) ( IS-CRATE ?auto_442074 ) ( AVAILABLE ?auto_442082 ) ( IN ?auto_442074 ?auto_442080 ) ( TRUCK-AT ?auto_442080 ?auto_442076 ) )
    :subtasks
    ( ( !DRIVE ?auto_442080 ?auto_442076 ?auto_442079 )
      ( MAKE-2CRATE ?auto_442078 ?auto_442074 ?auto_442075 )
      ( MAKE-1CRATE-VERIFY ?auto_442074 ?auto_442075 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_442083 - SURFACE
      ?auto_442084 - SURFACE
      ?auto_442085 - SURFACE
    )
    :vars
    (
      ?auto_442089 - HOIST
      ?auto_442087 - PLACE
      ?auto_442091 - PLACE
      ?auto_442088 - HOIST
      ?auto_442090 - SURFACE
      ?auto_442086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442089 ?auto_442087 ) ( IS-CRATE ?auto_442085 ) ( not ( = ?auto_442084 ?auto_442085 ) ) ( not ( = ?auto_442083 ?auto_442084 ) ) ( not ( = ?auto_442083 ?auto_442085 ) ) ( not ( = ?auto_442091 ?auto_442087 ) ) ( HOIST-AT ?auto_442088 ?auto_442091 ) ( not ( = ?auto_442089 ?auto_442088 ) ) ( AVAILABLE ?auto_442088 ) ( SURFACE-AT ?auto_442085 ?auto_442091 ) ( ON ?auto_442085 ?auto_442090 ) ( CLEAR ?auto_442085 ) ( not ( = ?auto_442084 ?auto_442090 ) ) ( not ( = ?auto_442085 ?auto_442090 ) ) ( not ( = ?auto_442083 ?auto_442090 ) ) ( SURFACE-AT ?auto_442083 ?auto_442087 ) ( CLEAR ?auto_442083 ) ( IS-CRATE ?auto_442084 ) ( AVAILABLE ?auto_442089 ) ( IN ?auto_442084 ?auto_442086 ) ( TRUCK-AT ?auto_442086 ?auto_442091 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442084 ?auto_442085 )
      ( MAKE-2CRATE-VERIFY ?auto_442083 ?auto_442084 ?auto_442085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442093 - SURFACE
      ?auto_442094 - SURFACE
      ?auto_442095 - SURFACE
      ?auto_442092 - SURFACE
    )
    :vars
    (
      ?auto_442100 - HOIST
      ?auto_442097 - PLACE
      ?auto_442096 - PLACE
      ?auto_442099 - HOIST
      ?auto_442101 - SURFACE
      ?auto_442098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442100 ?auto_442097 ) ( IS-CRATE ?auto_442092 ) ( not ( = ?auto_442095 ?auto_442092 ) ) ( not ( = ?auto_442094 ?auto_442095 ) ) ( not ( = ?auto_442094 ?auto_442092 ) ) ( not ( = ?auto_442096 ?auto_442097 ) ) ( HOIST-AT ?auto_442099 ?auto_442096 ) ( not ( = ?auto_442100 ?auto_442099 ) ) ( AVAILABLE ?auto_442099 ) ( SURFACE-AT ?auto_442092 ?auto_442096 ) ( ON ?auto_442092 ?auto_442101 ) ( CLEAR ?auto_442092 ) ( not ( = ?auto_442095 ?auto_442101 ) ) ( not ( = ?auto_442092 ?auto_442101 ) ) ( not ( = ?auto_442094 ?auto_442101 ) ) ( SURFACE-AT ?auto_442094 ?auto_442097 ) ( CLEAR ?auto_442094 ) ( IS-CRATE ?auto_442095 ) ( AVAILABLE ?auto_442100 ) ( IN ?auto_442095 ?auto_442098 ) ( TRUCK-AT ?auto_442098 ?auto_442096 ) ( ON ?auto_442094 ?auto_442093 ) ( not ( = ?auto_442093 ?auto_442094 ) ) ( not ( = ?auto_442093 ?auto_442095 ) ) ( not ( = ?auto_442093 ?auto_442092 ) ) ( not ( = ?auto_442093 ?auto_442101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442094 ?auto_442095 ?auto_442092 )
      ( MAKE-3CRATE-VERIFY ?auto_442093 ?auto_442094 ?auto_442095 ?auto_442092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442102 - SURFACE
      ?auto_442103 - SURFACE
    )
    :vars
    (
      ?auto_442108 - HOIST
      ?auto_442105 - PLACE
      ?auto_442110 - SURFACE
      ?auto_442104 - PLACE
      ?auto_442107 - HOIST
      ?auto_442109 - SURFACE
      ?auto_442106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442108 ?auto_442105 ) ( IS-CRATE ?auto_442103 ) ( not ( = ?auto_442102 ?auto_442103 ) ) ( not ( = ?auto_442110 ?auto_442102 ) ) ( not ( = ?auto_442110 ?auto_442103 ) ) ( not ( = ?auto_442104 ?auto_442105 ) ) ( HOIST-AT ?auto_442107 ?auto_442104 ) ( not ( = ?auto_442108 ?auto_442107 ) ) ( SURFACE-AT ?auto_442103 ?auto_442104 ) ( ON ?auto_442103 ?auto_442109 ) ( CLEAR ?auto_442103 ) ( not ( = ?auto_442102 ?auto_442109 ) ) ( not ( = ?auto_442103 ?auto_442109 ) ) ( not ( = ?auto_442110 ?auto_442109 ) ) ( SURFACE-AT ?auto_442110 ?auto_442105 ) ( CLEAR ?auto_442110 ) ( IS-CRATE ?auto_442102 ) ( AVAILABLE ?auto_442108 ) ( TRUCK-AT ?auto_442106 ?auto_442104 ) ( LIFTING ?auto_442107 ?auto_442102 ) )
    :subtasks
    ( ( !LOAD ?auto_442107 ?auto_442102 ?auto_442106 ?auto_442104 )
      ( MAKE-2CRATE ?auto_442110 ?auto_442102 ?auto_442103 )
      ( MAKE-1CRATE-VERIFY ?auto_442102 ?auto_442103 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_442111 - SURFACE
      ?auto_442112 - SURFACE
      ?auto_442113 - SURFACE
    )
    :vars
    (
      ?auto_442114 - HOIST
      ?auto_442119 - PLACE
      ?auto_442117 - PLACE
      ?auto_442118 - HOIST
      ?auto_442116 - SURFACE
      ?auto_442115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442114 ?auto_442119 ) ( IS-CRATE ?auto_442113 ) ( not ( = ?auto_442112 ?auto_442113 ) ) ( not ( = ?auto_442111 ?auto_442112 ) ) ( not ( = ?auto_442111 ?auto_442113 ) ) ( not ( = ?auto_442117 ?auto_442119 ) ) ( HOIST-AT ?auto_442118 ?auto_442117 ) ( not ( = ?auto_442114 ?auto_442118 ) ) ( SURFACE-AT ?auto_442113 ?auto_442117 ) ( ON ?auto_442113 ?auto_442116 ) ( CLEAR ?auto_442113 ) ( not ( = ?auto_442112 ?auto_442116 ) ) ( not ( = ?auto_442113 ?auto_442116 ) ) ( not ( = ?auto_442111 ?auto_442116 ) ) ( SURFACE-AT ?auto_442111 ?auto_442119 ) ( CLEAR ?auto_442111 ) ( IS-CRATE ?auto_442112 ) ( AVAILABLE ?auto_442114 ) ( TRUCK-AT ?auto_442115 ?auto_442117 ) ( LIFTING ?auto_442118 ?auto_442112 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442112 ?auto_442113 )
      ( MAKE-2CRATE-VERIFY ?auto_442111 ?auto_442112 ?auto_442113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442121 - SURFACE
      ?auto_442122 - SURFACE
      ?auto_442123 - SURFACE
      ?auto_442120 - SURFACE
    )
    :vars
    (
      ?auto_442127 - HOIST
      ?auto_442124 - PLACE
      ?auto_442129 - PLACE
      ?auto_442125 - HOIST
      ?auto_442126 - SURFACE
      ?auto_442128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442127 ?auto_442124 ) ( IS-CRATE ?auto_442120 ) ( not ( = ?auto_442123 ?auto_442120 ) ) ( not ( = ?auto_442122 ?auto_442123 ) ) ( not ( = ?auto_442122 ?auto_442120 ) ) ( not ( = ?auto_442129 ?auto_442124 ) ) ( HOIST-AT ?auto_442125 ?auto_442129 ) ( not ( = ?auto_442127 ?auto_442125 ) ) ( SURFACE-AT ?auto_442120 ?auto_442129 ) ( ON ?auto_442120 ?auto_442126 ) ( CLEAR ?auto_442120 ) ( not ( = ?auto_442123 ?auto_442126 ) ) ( not ( = ?auto_442120 ?auto_442126 ) ) ( not ( = ?auto_442122 ?auto_442126 ) ) ( SURFACE-AT ?auto_442122 ?auto_442124 ) ( CLEAR ?auto_442122 ) ( IS-CRATE ?auto_442123 ) ( AVAILABLE ?auto_442127 ) ( TRUCK-AT ?auto_442128 ?auto_442129 ) ( LIFTING ?auto_442125 ?auto_442123 ) ( ON ?auto_442122 ?auto_442121 ) ( not ( = ?auto_442121 ?auto_442122 ) ) ( not ( = ?auto_442121 ?auto_442123 ) ) ( not ( = ?auto_442121 ?auto_442120 ) ) ( not ( = ?auto_442121 ?auto_442126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442122 ?auto_442123 ?auto_442120 )
      ( MAKE-3CRATE-VERIFY ?auto_442121 ?auto_442122 ?auto_442123 ?auto_442120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442130 - SURFACE
      ?auto_442131 - SURFACE
    )
    :vars
    (
      ?auto_442136 - HOIST
      ?auto_442132 - PLACE
      ?auto_442133 - SURFACE
      ?auto_442138 - PLACE
      ?auto_442134 - HOIST
      ?auto_442135 - SURFACE
      ?auto_442137 - TRUCK
      ?auto_442139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442136 ?auto_442132 ) ( IS-CRATE ?auto_442131 ) ( not ( = ?auto_442130 ?auto_442131 ) ) ( not ( = ?auto_442133 ?auto_442130 ) ) ( not ( = ?auto_442133 ?auto_442131 ) ) ( not ( = ?auto_442138 ?auto_442132 ) ) ( HOIST-AT ?auto_442134 ?auto_442138 ) ( not ( = ?auto_442136 ?auto_442134 ) ) ( SURFACE-AT ?auto_442131 ?auto_442138 ) ( ON ?auto_442131 ?auto_442135 ) ( CLEAR ?auto_442131 ) ( not ( = ?auto_442130 ?auto_442135 ) ) ( not ( = ?auto_442131 ?auto_442135 ) ) ( not ( = ?auto_442133 ?auto_442135 ) ) ( SURFACE-AT ?auto_442133 ?auto_442132 ) ( CLEAR ?auto_442133 ) ( IS-CRATE ?auto_442130 ) ( AVAILABLE ?auto_442136 ) ( TRUCK-AT ?auto_442137 ?auto_442138 ) ( AVAILABLE ?auto_442134 ) ( SURFACE-AT ?auto_442130 ?auto_442138 ) ( ON ?auto_442130 ?auto_442139 ) ( CLEAR ?auto_442130 ) ( not ( = ?auto_442130 ?auto_442139 ) ) ( not ( = ?auto_442131 ?auto_442139 ) ) ( not ( = ?auto_442133 ?auto_442139 ) ) ( not ( = ?auto_442135 ?auto_442139 ) ) )
    :subtasks
    ( ( !LIFT ?auto_442134 ?auto_442130 ?auto_442139 ?auto_442138 )
      ( MAKE-2CRATE ?auto_442133 ?auto_442130 ?auto_442131 )
      ( MAKE-1CRATE-VERIFY ?auto_442130 ?auto_442131 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_442140 - SURFACE
      ?auto_442141 - SURFACE
      ?auto_442142 - SURFACE
    )
    :vars
    (
      ?auto_442149 - HOIST
      ?auto_442143 - PLACE
      ?auto_442146 - PLACE
      ?auto_442144 - HOIST
      ?auto_442148 - SURFACE
      ?auto_442145 - TRUCK
      ?auto_442147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442149 ?auto_442143 ) ( IS-CRATE ?auto_442142 ) ( not ( = ?auto_442141 ?auto_442142 ) ) ( not ( = ?auto_442140 ?auto_442141 ) ) ( not ( = ?auto_442140 ?auto_442142 ) ) ( not ( = ?auto_442146 ?auto_442143 ) ) ( HOIST-AT ?auto_442144 ?auto_442146 ) ( not ( = ?auto_442149 ?auto_442144 ) ) ( SURFACE-AT ?auto_442142 ?auto_442146 ) ( ON ?auto_442142 ?auto_442148 ) ( CLEAR ?auto_442142 ) ( not ( = ?auto_442141 ?auto_442148 ) ) ( not ( = ?auto_442142 ?auto_442148 ) ) ( not ( = ?auto_442140 ?auto_442148 ) ) ( SURFACE-AT ?auto_442140 ?auto_442143 ) ( CLEAR ?auto_442140 ) ( IS-CRATE ?auto_442141 ) ( AVAILABLE ?auto_442149 ) ( TRUCK-AT ?auto_442145 ?auto_442146 ) ( AVAILABLE ?auto_442144 ) ( SURFACE-AT ?auto_442141 ?auto_442146 ) ( ON ?auto_442141 ?auto_442147 ) ( CLEAR ?auto_442141 ) ( not ( = ?auto_442141 ?auto_442147 ) ) ( not ( = ?auto_442142 ?auto_442147 ) ) ( not ( = ?auto_442140 ?auto_442147 ) ) ( not ( = ?auto_442148 ?auto_442147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442141 ?auto_442142 )
      ( MAKE-2CRATE-VERIFY ?auto_442140 ?auto_442141 ?auto_442142 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442151 - SURFACE
      ?auto_442152 - SURFACE
      ?auto_442153 - SURFACE
      ?auto_442150 - SURFACE
    )
    :vars
    (
      ?auto_442155 - HOIST
      ?auto_442154 - PLACE
      ?auto_442159 - PLACE
      ?auto_442157 - HOIST
      ?auto_442156 - SURFACE
      ?auto_442158 - TRUCK
      ?auto_442160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442155 ?auto_442154 ) ( IS-CRATE ?auto_442150 ) ( not ( = ?auto_442153 ?auto_442150 ) ) ( not ( = ?auto_442152 ?auto_442153 ) ) ( not ( = ?auto_442152 ?auto_442150 ) ) ( not ( = ?auto_442159 ?auto_442154 ) ) ( HOIST-AT ?auto_442157 ?auto_442159 ) ( not ( = ?auto_442155 ?auto_442157 ) ) ( SURFACE-AT ?auto_442150 ?auto_442159 ) ( ON ?auto_442150 ?auto_442156 ) ( CLEAR ?auto_442150 ) ( not ( = ?auto_442153 ?auto_442156 ) ) ( not ( = ?auto_442150 ?auto_442156 ) ) ( not ( = ?auto_442152 ?auto_442156 ) ) ( SURFACE-AT ?auto_442152 ?auto_442154 ) ( CLEAR ?auto_442152 ) ( IS-CRATE ?auto_442153 ) ( AVAILABLE ?auto_442155 ) ( TRUCK-AT ?auto_442158 ?auto_442159 ) ( AVAILABLE ?auto_442157 ) ( SURFACE-AT ?auto_442153 ?auto_442159 ) ( ON ?auto_442153 ?auto_442160 ) ( CLEAR ?auto_442153 ) ( not ( = ?auto_442153 ?auto_442160 ) ) ( not ( = ?auto_442150 ?auto_442160 ) ) ( not ( = ?auto_442152 ?auto_442160 ) ) ( not ( = ?auto_442156 ?auto_442160 ) ) ( ON ?auto_442152 ?auto_442151 ) ( not ( = ?auto_442151 ?auto_442152 ) ) ( not ( = ?auto_442151 ?auto_442153 ) ) ( not ( = ?auto_442151 ?auto_442150 ) ) ( not ( = ?auto_442151 ?auto_442156 ) ) ( not ( = ?auto_442151 ?auto_442160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442152 ?auto_442153 ?auto_442150 )
      ( MAKE-3CRATE-VERIFY ?auto_442151 ?auto_442152 ?auto_442153 ?auto_442150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442161 - SURFACE
      ?auto_442162 - SURFACE
    )
    :vars
    (
      ?auto_442164 - HOIST
      ?auto_442163 - PLACE
      ?auto_442165 - SURFACE
      ?auto_442169 - PLACE
      ?auto_442167 - HOIST
      ?auto_442166 - SURFACE
      ?auto_442170 - SURFACE
      ?auto_442168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442164 ?auto_442163 ) ( IS-CRATE ?auto_442162 ) ( not ( = ?auto_442161 ?auto_442162 ) ) ( not ( = ?auto_442165 ?auto_442161 ) ) ( not ( = ?auto_442165 ?auto_442162 ) ) ( not ( = ?auto_442169 ?auto_442163 ) ) ( HOIST-AT ?auto_442167 ?auto_442169 ) ( not ( = ?auto_442164 ?auto_442167 ) ) ( SURFACE-AT ?auto_442162 ?auto_442169 ) ( ON ?auto_442162 ?auto_442166 ) ( CLEAR ?auto_442162 ) ( not ( = ?auto_442161 ?auto_442166 ) ) ( not ( = ?auto_442162 ?auto_442166 ) ) ( not ( = ?auto_442165 ?auto_442166 ) ) ( SURFACE-AT ?auto_442165 ?auto_442163 ) ( CLEAR ?auto_442165 ) ( IS-CRATE ?auto_442161 ) ( AVAILABLE ?auto_442164 ) ( AVAILABLE ?auto_442167 ) ( SURFACE-AT ?auto_442161 ?auto_442169 ) ( ON ?auto_442161 ?auto_442170 ) ( CLEAR ?auto_442161 ) ( not ( = ?auto_442161 ?auto_442170 ) ) ( not ( = ?auto_442162 ?auto_442170 ) ) ( not ( = ?auto_442165 ?auto_442170 ) ) ( not ( = ?auto_442166 ?auto_442170 ) ) ( TRUCK-AT ?auto_442168 ?auto_442163 ) )
    :subtasks
    ( ( !DRIVE ?auto_442168 ?auto_442163 ?auto_442169 )
      ( MAKE-2CRATE ?auto_442165 ?auto_442161 ?auto_442162 )
      ( MAKE-1CRATE-VERIFY ?auto_442161 ?auto_442162 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_442171 - SURFACE
      ?auto_442172 - SURFACE
      ?auto_442173 - SURFACE
    )
    :vars
    (
      ?auto_442176 - HOIST
      ?auto_442178 - PLACE
      ?auto_442175 - PLACE
      ?auto_442174 - HOIST
      ?auto_442179 - SURFACE
      ?auto_442177 - SURFACE
      ?auto_442180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442176 ?auto_442178 ) ( IS-CRATE ?auto_442173 ) ( not ( = ?auto_442172 ?auto_442173 ) ) ( not ( = ?auto_442171 ?auto_442172 ) ) ( not ( = ?auto_442171 ?auto_442173 ) ) ( not ( = ?auto_442175 ?auto_442178 ) ) ( HOIST-AT ?auto_442174 ?auto_442175 ) ( not ( = ?auto_442176 ?auto_442174 ) ) ( SURFACE-AT ?auto_442173 ?auto_442175 ) ( ON ?auto_442173 ?auto_442179 ) ( CLEAR ?auto_442173 ) ( not ( = ?auto_442172 ?auto_442179 ) ) ( not ( = ?auto_442173 ?auto_442179 ) ) ( not ( = ?auto_442171 ?auto_442179 ) ) ( SURFACE-AT ?auto_442171 ?auto_442178 ) ( CLEAR ?auto_442171 ) ( IS-CRATE ?auto_442172 ) ( AVAILABLE ?auto_442176 ) ( AVAILABLE ?auto_442174 ) ( SURFACE-AT ?auto_442172 ?auto_442175 ) ( ON ?auto_442172 ?auto_442177 ) ( CLEAR ?auto_442172 ) ( not ( = ?auto_442172 ?auto_442177 ) ) ( not ( = ?auto_442173 ?auto_442177 ) ) ( not ( = ?auto_442171 ?auto_442177 ) ) ( not ( = ?auto_442179 ?auto_442177 ) ) ( TRUCK-AT ?auto_442180 ?auto_442178 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442172 ?auto_442173 )
      ( MAKE-2CRATE-VERIFY ?auto_442171 ?auto_442172 ?auto_442173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442182 - SURFACE
      ?auto_442183 - SURFACE
      ?auto_442184 - SURFACE
      ?auto_442181 - SURFACE
    )
    :vars
    (
      ?auto_442185 - HOIST
      ?auto_442191 - PLACE
      ?auto_442188 - PLACE
      ?auto_442190 - HOIST
      ?auto_442187 - SURFACE
      ?auto_442186 - SURFACE
      ?auto_442189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442185 ?auto_442191 ) ( IS-CRATE ?auto_442181 ) ( not ( = ?auto_442184 ?auto_442181 ) ) ( not ( = ?auto_442183 ?auto_442184 ) ) ( not ( = ?auto_442183 ?auto_442181 ) ) ( not ( = ?auto_442188 ?auto_442191 ) ) ( HOIST-AT ?auto_442190 ?auto_442188 ) ( not ( = ?auto_442185 ?auto_442190 ) ) ( SURFACE-AT ?auto_442181 ?auto_442188 ) ( ON ?auto_442181 ?auto_442187 ) ( CLEAR ?auto_442181 ) ( not ( = ?auto_442184 ?auto_442187 ) ) ( not ( = ?auto_442181 ?auto_442187 ) ) ( not ( = ?auto_442183 ?auto_442187 ) ) ( SURFACE-AT ?auto_442183 ?auto_442191 ) ( CLEAR ?auto_442183 ) ( IS-CRATE ?auto_442184 ) ( AVAILABLE ?auto_442185 ) ( AVAILABLE ?auto_442190 ) ( SURFACE-AT ?auto_442184 ?auto_442188 ) ( ON ?auto_442184 ?auto_442186 ) ( CLEAR ?auto_442184 ) ( not ( = ?auto_442184 ?auto_442186 ) ) ( not ( = ?auto_442181 ?auto_442186 ) ) ( not ( = ?auto_442183 ?auto_442186 ) ) ( not ( = ?auto_442187 ?auto_442186 ) ) ( TRUCK-AT ?auto_442189 ?auto_442191 ) ( ON ?auto_442183 ?auto_442182 ) ( not ( = ?auto_442182 ?auto_442183 ) ) ( not ( = ?auto_442182 ?auto_442184 ) ) ( not ( = ?auto_442182 ?auto_442181 ) ) ( not ( = ?auto_442182 ?auto_442187 ) ) ( not ( = ?auto_442182 ?auto_442186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442183 ?auto_442184 ?auto_442181 )
      ( MAKE-3CRATE-VERIFY ?auto_442182 ?auto_442183 ?auto_442184 ?auto_442181 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442192 - SURFACE
      ?auto_442193 - SURFACE
    )
    :vars
    (
      ?auto_442194 - HOIST
      ?auto_442201 - PLACE
      ?auto_442199 - SURFACE
      ?auto_442197 - PLACE
      ?auto_442200 - HOIST
      ?auto_442196 - SURFACE
      ?auto_442195 - SURFACE
      ?auto_442198 - TRUCK
      ?auto_442202 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442194 ?auto_442201 ) ( IS-CRATE ?auto_442193 ) ( not ( = ?auto_442192 ?auto_442193 ) ) ( not ( = ?auto_442199 ?auto_442192 ) ) ( not ( = ?auto_442199 ?auto_442193 ) ) ( not ( = ?auto_442197 ?auto_442201 ) ) ( HOIST-AT ?auto_442200 ?auto_442197 ) ( not ( = ?auto_442194 ?auto_442200 ) ) ( SURFACE-AT ?auto_442193 ?auto_442197 ) ( ON ?auto_442193 ?auto_442196 ) ( CLEAR ?auto_442193 ) ( not ( = ?auto_442192 ?auto_442196 ) ) ( not ( = ?auto_442193 ?auto_442196 ) ) ( not ( = ?auto_442199 ?auto_442196 ) ) ( IS-CRATE ?auto_442192 ) ( AVAILABLE ?auto_442200 ) ( SURFACE-AT ?auto_442192 ?auto_442197 ) ( ON ?auto_442192 ?auto_442195 ) ( CLEAR ?auto_442192 ) ( not ( = ?auto_442192 ?auto_442195 ) ) ( not ( = ?auto_442193 ?auto_442195 ) ) ( not ( = ?auto_442199 ?auto_442195 ) ) ( not ( = ?auto_442196 ?auto_442195 ) ) ( TRUCK-AT ?auto_442198 ?auto_442201 ) ( SURFACE-AT ?auto_442202 ?auto_442201 ) ( CLEAR ?auto_442202 ) ( LIFTING ?auto_442194 ?auto_442199 ) ( IS-CRATE ?auto_442199 ) ( not ( = ?auto_442202 ?auto_442199 ) ) ( not ( = ?auto_442192 ?auto_442202 ) ) ( not ( = ?auto_442193 ?auto_442202 ) ) ( not ( = ?auto_442196 ?auto_442202 ) ) ( not ( = ?auto_442195 ?auto_442202 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442202 ?auto_442199 )
      ( MAKE-2CRATE ?auto_442199 ?auto_442192 ?auto_442193 )
      ( MAKE-1CRATE-VERIFY ?auto_442192 ?auto_442193 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_442203 - SURFACE
      ?auto_442204 - SURFACE
      ?auto_442205 - SURFACE
    )
    :vars
    (
      ?auto_442211 - HOIST
      ?auto_442206 - PLACE
      ?auto_442209 - PLACE
      ?auto_442213 - HOIST
      ?auto_442207 - SURFACE
      ?auto_442210 - SURFACE
      ?auto_442208 - TRUCK
      ?auto_442212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442211 ?auto_442206 ) ( IS-CRATE ?auto_442205 ) ( not ( = ?auto_442204 ?auto_442205 ) ) ( not ( = ?auto_442203 ?auto_442204 ) ) ( not ( = ?auto_442203 ?auto_442205 ) ) ( not ( = ?auto_442209 ?auto_442206 ) ) ( HOIST-AT ?auto_442213 ?auto_442209 ) ( not ( = ?auto_442211 ?auto_442213 ) ) ( SURFACE-AT ?auto_442205 ?auto_442209 ) ( ON ?auto_442205 ?auto_442207 ) ( CLEAR ?auto_442205 ) ( not ( = ?auto_442204 ?auto_442207 ) ) ( not ( = ?auto_442205 ?auto_442207 ) ) ( not ( = ?auto_442203 ?auto_442207 ) ) ( IS-CRATE ?auto_442204 ) ( AVAILABLE ?auto_442213 ) ( SURFACE-AT ?auto_442204 ?auto_442209 ) ( ON ?auto_442204 ?auto_442210 ) ( CLEAR ?auto_442204 ) ( not ( = ?auto_442204 ?auto_442210 ) ) ( not ( = ?auto_442205 ?auto_442210 ) ) ( not ( = ?auto_442203 ?auto_442210 ) ) ( not ( = ?auto_442207 ?auto_442210 ) ) ( TRUCK-AT ?auto_442208 ?auto_442206 ) ( SURFACE-AT ?auto_442212 ?auto_442206 ) ( CLEAR ?auto_442212 ) ( LIFTING ?auto_442211 ?auto_442203 ) ( IS-CRATE ?auto_442203 ) ( not ( = ?auto_442212 ?auto_442203 ) ) ( not ( = ?auto_442204 ?auto_442212 ) ) ( not ( = ?auto_442205 ?auto_442212 ) ) ( not ( = ?auto_442207 ?auto_442212 ) ) ( not ( = ?auto_442210 ?auto_442212 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442204 ?auto_442205 )
      ( MAKE-2CRATE-VERIFY ?auto_442203 ?auto_442204 ?auto_442205 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_442215 - SURFACE
      ?auto_442216 - SURFACE
      ?auto_442217 - SURFACE
      ?auto_442214 - SURFACE
    )
    :vars
    (
      ?auto_442222 - HOIST
      ?auto_442224 - PLACE
      ?auto_442218 - PLACE
      ?auto_442219 - HOIST
      ?auto_442221 - SURFACE
      ?auto_442223 - SURFACE
      ?auto_442220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442222 ?auto_442224 ) ( IS-CRATE ?auto_442214 ) ( not ( = ?auto_442217 ?auto_442214 ) ) ( not ( = ?auto_442216 ?auto_442217 ) ) ( not ( = ?auto_442216 ?auto_442214 ) ) ( not ( = ?auto_442218 ?auto_442224 ) ) ( HOIST-AT ?auto_442219 ?auto_442218 ) ( not ( = ?auto_442222 ?auto_442219 ) ) ( SURFACE-AT ?auto_442214 ?auto_442218 ) ( ON ?auto_442214 ?auto_442221 ) ( CLEAR ?auto_442214 ) ( not ( = ?auto_442217 ?auto_442221 ) ) ( not ( = ?auto_442214 ?auto_442221 ) ) ( not ( = ?auto_442216 ?auto_442221 ) ) ( IS-CRATE ?auto_442217 ) ( AVAILABLE ?auto_442219 ) ( SURFACE-AT ?auto_442217 ?auto_442218 ) ( ON ?auto_442217 ?auto_442223 ) ( CLEAR ?auto_442217 ) ( not ( = ?auto_442217 ?auto_442223 ) ) ( not ( = ?auto_442214 ?auto_442223 ) ) ( not ( = ?auto_442216 ?auto_442223 ) ) ( not ( = ?auto_442221 ?auto_442223 ) ) ( TRUCK-AT ?auto_442220 ?auto_442224 ) ( SURFACE-AT ?auto_442215 ?auto_442224 ) ( CLEAR ?auto_442215 ) ( LIFTING ?auto_442222 ?auto_442216 ) ( IS-CRATE ?auto_442216 ) ( not ( = ?auto_442215 ?auto_442216 ) ) ( not ( = ?auto_442217 ?auto_442215 ) ) ( not ( = ?auto_442214 ?auto_442215 ) ) ( not ( = ?auto_442221 ?auto_442215 ) ) ( not ( = ?auto_442223 ?auto_442215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442216 ?auto_442217 ?auto_442214 )
      ( MAKE-3CRATE-VERIFY ?auto_442215 ?auto_442216 ?auto_442217 ?auto_442214 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442361 - SURFACE
      ?auto_442362 - SURFACE
      ?auto_442363 - SURFACE
      ?auto_442360 - SURFACE
      ?auto_442364 - SURFACE
    )
    :vars
    (
      ?auto_442366 - HOIST
      ?auto_442365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442366 ?auto_442365 ) ( SURFACE-AT ?auto_442360 ?auto_442365 ) ( CLEAR ?auto_442360 ) ( LIFTING ?auto_442366 ?auto_442364 ) ( IS-CRATE ?auto_442364 ) ( not ( = ?auto_442360 ?auto_442364 ) ) ( ON ?auto_442362 ?auto_442361 ) ( ON ?auto_442363 ?auto_442362 ) ( ON ?auto_442360 ?auto_442363 ) ( not ( = ?auto_442361 ?auto_442362 ) ) ( not ( = ?auto_442361 ?auto_442363 ) ) ( not ( = ?auto_442361 ?auto_442360 ) ) ( not ( = ?auto_442361 ?auto_442364 ) ) ( not ( = ?auto_442362 ?auto_442363 ) ) ( not ( = ?auto_442362 ?auto_442360 ) ) ( not ( = ?auto_442362 ?auto_442364 ) ) ( not ( = ?auto_442363 ?auto_442360 ) ) ( not ( = ?auto_442363 ?auto_442364 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442360 ?auto_442364 )
      ( MAKE-4CRATE-VERIFY ?auto_442361 ?auto_442362 ?auto_442363 ?auto_442360 ?auto_442364 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442386 - SURFACE
      ?auto_442387 - SURFACE
      ?auto_442388 - SURFACE
      ?auto_442385 - SURFACE
      ?auto_442389 - SURFACE
    )
    :vars
    (
      ?auto_442392 - HOIST
      ?auto_442391 - PLACE
      ?auto_442390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442392 ?auto_442391 ) ( SURFACE-AT ?auto_442385 ?auto_442391 ) ( CLEAR ?auto_442385 ) ( IS-CRATE ?auto_442389 ) ( not ( = ?auto_442385 ?auto_442389 ) ) ( TRUCK-AT ?auto_442390 ?auto_442391 ) ( AVAILABLE ?auto_442392 ) ( IN ?auto_442389 ?auto_442390 ) ( ON ?auto_442385 ?auto_442388 ) ( not ( = ?auto_442388 ?auto_442385 ) ) ( not ( = ?auto_442388 ?auto_442389 ) ) ( ON ?auto_442387 ?auto_442386 ) ( ON ?auto_442388 ?auto_442387 ) ( not ( = ?auto_442386 ?auto_442387 ) ) ( not ( = ?auto_442386 ?auto_442388 ) ) ( not ( = ?auto_442386 ?auto_442385 ) ) ( not ( = ?auto_442386 ?auto_442389 ) ) ( not ( = ?auto_442387 ?auto_442388 ) ) ( not ( = ?auto_442387 ?auto_442385 ) ) ( not ( = ?auto_442387 ?auto_442389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442388 ?auto_442385 ?auto_442389 )
      ( MAKE-4CRATE-VERIFY ?auto_442386 ?auto_442387 ?auto_442388 ?auto_442385 ?auto_442389 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442416 - SURFACE
      ?auto_442417 - SURFACE
      ?auto_442418 - SURFACE
      ?auto_442415 - SURFACE
      ?auto_442419 - SURFACE
    )
    :vars
    (
      ?auto_442420 - HOIST
      ?auto_442422 - PLACE
      ?auto_442423 - TRUCK
      ?auto_442421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442420 ?auto_442422 ) ( SURFACE-AT ?auto_442415 ?auto_442422 ) ( CLEAR ?auto_442415 ) ( IS-CRATE ?auto_442419 ) ( not ( = ?auto_442415 ?auto_442419 ) ) ( AVAILABLE ?auto_442420 ) ( IN ?auto_442419 ?auto_442423 ) ( ON ?auto_442415 ?auto_442418 ) ( not ( = ?auto_442418 ?auto_442415 ) ) ( not ( = ?auto_442418 ?auto_442419 ) ) ( TRUCK-AT ?auto_442423 ?auto_442421 ) ( not ( = ?auto_442421 ?auto_442422 ) ) ( ON ?auto_442417 ?auto_442416 ) ( ON ?auto_442418 ?auto_442417 ) ( not ( = ?auto_442416 ?auto_442417 ) ) ( not ( = ?auto_442416 ?auto_442418 ) ) ( not ( = ?auto_442416 ?auto_442415 ) ) ( not ( = ?auto_442416 ?auto_442419 ) ) ( not ( = ?auto_442417 ?auto_442418 ) ) ( not ( = ?auto_442417 ?auto_442415 ) ) ( not ( = ?auto_442417 ?auto_442419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442418 ?auto_442415 ?auto_442419 )
      ( MAKE-4CRATE-VERIFY ?auto_442416 ?auto_442417 ?auto_442418 ?auto_442415 ?auto_442419 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442450 - SURFACE
      ?auto_442451 - SURFACE
      ?auto_442452 - SURFACE
      ?auto_442449 - SURFACE
      ?auto_442453 - SURFACE
    )
    :vars
    (
      ?auto_442456 - HOIST
      ?auto_442458 - PLACE
      ?auto_442454 - TRUCK
      ?auto_442455 - PLACE
      ?auto_442457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_442456 ?auto_442458 ) ( SURFACE-AT ?auto_442449 ?auto_442458 ) ( CLEAR ?auto_442449 ) ( IS-CRATE ?auto_442453 ) ( not ( = ?auto_442449 ?auto_442453 ) ) ( AVAILABLE ?auto_442456 ) ( ON ?auto_442449 ?auto_442452 ) ( not ( = ?auto_442452 ?auto_442449 ) ) ( not ( = ?auto_442452 ?auto_442453 ) ) ( TRUCK-AT ?auto_442454 ?auto_442455 ) ( not ( = ?auto_442455 ?auto_442458 ) ) ( HOIST-AT ?auto_442457 ?auto_442455 ) ( LIFTING ?auto_442457 ?auto_442453 ) ( not ( = ?auto_442456 ?auto_442457 ) ) ( ON ?auto_442451 ?auto_442450 ) ( ON ?auto_442452 ?auto_442451 ) ( not ( = ?auto_442450 ?auto_442451 ) ) ( not ( = ?auto_442450 ?auto_442452 ) ) ( not ( = ?auto_442450 ?auto_442449 ) ) ( not ( = ?auto_442450 ?auto_442453 ) ) ( not ( = ?auto_442451 ?auto_442452 ) ) ( not ( = ?auto_442451 ?auto_442449 ) ) ( not ( = ?auto_442451 ?auto_442453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442452 ?auto_442449 ?auto_442453 )
      ( MAKE-4CRATE-VERIFY ?auto_442450 ?auto_442451 ?auto_442452 ?auto_442449 ?auto_442453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442488 - SURFACE
      ?auto_442489 - SURFACE
      ?auto_442490 - SURFACE
      ?auto_442487 - SURFACE
      ?auto_442491 - SURFACE
    )
    :vars
    (
      ?auto_442496 - HOIST
      ?auto_442495 - PLACE
      ?auto_442492 - TRUCK
      ?auto_442493 - PLACE
      ?auto_442494 - HOIST
      ?auto_442497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442496 ?auto_442495 ) ( SURFACE-AT ?auto_442487 ?auto_442495 ) ( CLEAR ?auto_442487 ) ( IS-CRATE ?auto_442491 ) ( not ( = ?auto_442487 ?auto_442491 ) ) ( AVAILABLE ?auto_442496 ) ( ON ?auto_442487 ?auto_442490 ) ( not ( = ?auto_442490 ?auto_442487 ) ) ( not ( = ?auto_442490 ?auto_442491 ) ) ( TRUCK-AT ?auto_442492 ?auto_442493 ) ( not ( = ?auto_442493 ?auto_442495 ) ) ( HOIST-AT ?auto_442494 ?auto_442493 ) ( not ( = ?auto_442496 ?auto_442494 ) ) ( AVAILABLE ?auto_442494 ) ( SURFACE-AT ?auto_442491 ?auto_442493 ) ( ON ?auto_442491 ?auto_442497 ) ( CLEAR ?auto_442491 ) ( not ( = ?auto_442487 ?auto_442497 ) ) ( not ( = ?auto_442491 ?auto_442497 ) ) ( not ( = ?auto_442490 ?auto_442497 ) ) ( ON ?auto_442489 ?auto_442488 ) ( ON ?auto_442490 ?auto_442489 ) ( not ( = ?auto_442488 ?auto_442489 ) ) ( not ( = ?auto_442488 ?auto_442490 ) ) ( not ( = ?auto_442488 ?auto_442487 ) ) ( not ( = ?auto_442488 ?auto_442491 ) ) ( not ( = ?auto_442488 ?auto_442497 ) ) ( not ( = ?auto_442489 ?auto_442490 ) ) ( not ( = ?auto_442489 ?auto_442487 ) ) ( not ( = ?auto_442489 ?auto_442491 ) ) ( not ( = ?auto_442489 ?auto_442497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442490 ?auto_442487 ?auto_442491 )
      ( MAKE-4CRATE-VERIFY ?auto_442488 ?auto_442489 ?auto_442490 ?auto_442487 ?auto_442491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442527 - SURFACE
      ?auto_442528 - SURFACE
      ?auto_442529 - SURFACE
      ?auto_442526 - SURFACE
      ?auto_442530 - SURFACE
    )
    :vars
    (
      ?auto_442536 - HOIST
      ?auto_442535 - PLACE
      ?auto_442533 - PLACE
      ?auto_442531 - HOIST
      ?auto_442534 - SURFACE
      ?auto_442532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442536 ?auto_442535 ) ( SURFACE-AT ?auto_442526 ?auto_442535 ) ( CLEAR ?auto_442526 ) ( IS-CRATE ?auto_442530 ) ( not ( = ?auto_442526 ?auto_442530 ) ) ( AVAILABLE ?auto_442536 ) ( ON ?auto_442526 ?auto_442529 ) ( not ( = ?auto_442529 ?auto_442526 ) ) ( not ( = ?auto_442529 ?auto_442530 ) ) ( not ( = ?auto_442533 ?auto_442535 ) ) ( HOIST-AT ?auto_442531 ?auto_442533 ) ( not ( = ?auto_442536 ?auto_442531 ) ) ( AVAILABLE ?auto_442531 ) ( SURFACE-AT ?auto_442530 ?auto_442533 ) ( ON ?auto_442530 ?auto_442534 ) ( CLEAR ?auto_442530 ) ( not ( = ?auto_442526 ?auto_442534 ) ) ( not ( = ?auto_442530 ?auto_442534 ) ) ( not ( = ?auto_442529 ?auto_442534 ) ) ( TRUCK-AT ?auto_442532 ?auto_442535 ) ( ON ?auto_442528 ?auto_442527 ) ( ON ?auto_442529 ?auto_442528 ) ( not ( = ?auto_442527 ?auto_442528 ) ) ( not ( = ?auto_442527 ?auto_442529 ) ) ( not ( = ?auto_442527 ?auto_442526 ) ) ( not ( = ?auto_442527 ?auto_442530 ) ) ( not ( = ?auto_442527 ?auto_442534 ) ) ( not ( = ?auto_442528 ?auto_442529 ) ) ( not ( = ?auto_442528 ?auto_442526 ) ) ( not ( = ?auto_442528 ?auto_442530 ) ) ( not ( = ?auto_442528 ?auto_442534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442529 ?auto_442526 ?auto_442530 )
      ( MAKE-4CRATE-VERIFY ?auto_442527 ?auto_442528 ?auto_442529 ?auto_442526 ?auto_442530 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442566 - SURFACE
      ?auto_442567 - SURFACE
      ?auto_442568 - SURFACE
      ?auto_442565 - SURFACE
      ?auto_442569 - SURFACE
    )
    :vars
    (
      ?auto_442573 - HOIST
      ?auto_442570 - PLACE
      ?auto_442574 - PLACE
      ?auto_442572 - HOIST
      ?auto_442571 - SURFACE
      ?auto_442575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442573 ?auto_442570 ) ( IS-CRATE ?auto_442569 ) ( not ( = ?auto_442565 ?auto_442569 ) ) ( not ( = ?auto_442568 ?auto_442565 ) ) ( not ( = ?auto_442568 ?auto_442569 ) ) ( not ( = ?auto_442574 ?auto_442570 ) ) ( HOIST-AT ?auto_442572 ?auto_442574 ) ( not ( = ?auto_442573 ?auto_442572 ) ) ( AVAILABLE ?auto_442572 ) ( SURFACE-AT ?auto_442569 ?auto_442574 ) ( ON ?auto_442569 ?auto_442571 ) ( CLEAR ?auto_442569 ) ( not ( = ?auto_442565 ?auto_442571 ) ) ( not ( = ?auto_442569 ?auto_442571 ) ) ( not ( = ?auto_442568 ?auto_442571 ) ) ( TRUCK-AT ?auto_442575 ?auto_442570 ) ( SURFACE-AT ?auto_442568 ?auto_442570 ) ( CLEAR ?auto_442568 ) ( LIFTING ?auto_442573 ?auto_442565 ) ( IS-CRATE ?auto_442565 ) ( ON ?auto_442567 ?auto_442566 ) ( ON ?auto_442568 ?auto_442567 ) ( not ( = ?auto_442566 ?auto_442567 ) ) ( not ( = ?auto_442566 ?auto_442568 ) ) ( not ( = ?auto_442566 ?auto_442565 ) ) ( not ( = ?auto_442566 ?auto_442569 ) ) ( not ( = ?auto_442566 ?auto_442571 ) ) ( not ( = ?auto_442567 ?auto_442568 ) ) ( not ( = ?auto_442567 ?auto_442565 ) ) ( not ( = ?auto_442567 ?auto_442569 ) ) ( not ( = ?auto_442567 ?auto_442571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442568 ?auto_442565 ?auto_442569 )
      ( MAKE-4CRATE-VERIFY ?auto_442566 ?auto_442567 ?auto_442568 ?auto_442565 ?auto_442569 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442605 - SURFACE
      ?auto_442606 - SURFACE
      ?auto_442607 - SURFACE
      ?auto_442604 - SURFACE
      ?auto_442608 - SURFACE
    )
    :vars
    (
      ?auto_442611 - HOIST
      ?auto_442609 - PLACE
      ?auto_442612 - PLACE
      ?auto_442610 - HOIST
      ?auto_442614 - SURFACE
      ?auto_442613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442611 ?auto_442609 ) ( IS-CRATE ?auto_442608 ) ( not ( = ?auto_442604 ?auto_442608 ) ) ( not ( = ?auto_442607 ?auto_442604 ) ) ( not ( = ?auto_442607 ?auto_442608 ) ) ( not ( = ?auto_442612 ?auto_442609 ) ) ( HOIST-AT ?auto_442610 ?auto_442612 ) ( not ( = ?auto_442611 ?auto_442610 ) ) ( AVAILABLE ?auto_442610 ) ( SURFACE-AT ?auto_442608 ?auto_442612 ) ( ON ?auto_442608 ?auto_442614 ) ( CLEAR ?auto_442608 ) ( not ( = ?auto_442604 ?auto_442614 ) ) ( not ( = ?auto_442608 ?auto_442614 ) ) ( not ( = ?auto_442607 ?auto_442614 ) ) ( TRUCK-AT ?auto_442613 ?auto_442609 ) ( SURFACE-AT ?auto_442607 ?auto_442609 ) ( CLEAR ?auto_442607 ) ( IS-CRATE ?auto_442604 ) ( AVAILABLE ?auto_442611 ) ( IN ?auto_442604 ?auto_442613 ) ( ON ?auto_442606 ?auto_442605 ) ( ON ?auto_442607 ?auto_442606 ) ( not ( = ?auto_442605 ?auto_442606 ) ) ( not ( = ?auto_442605 ?auto_442607 ) ) ( not ( = ?auto_442605 ?auto_442604 ) ) ( not ( = ?auto_442605 ?auto_442608 ) ) ( not ( = ?auto_442605 ?auto_442614 ) ) ( not ( = ?auto_442606 ?auto_442607 ) ) ( not ( = ?auto_442606 ?auto_442604 ) ) ( not ( = ?auto_442606 ?auto_442608 ) ) ( not ( = ?auto_442606 ?auto_442614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442607 ?auto_442604 ?auto_442608 )
      ( MAKE-4CRATE-VERIFY ?auto_442605 ?auto_442606 ?auto_442607 ?auto_442604 ?auto_442608 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442644 - SURFACE
      ?auto_442645 - SURFACE
      ?auto_442646 - SURFACE
      ?auto_442643 - SURFACE
      ?auto_442647 - SURFACE
    )
    :vars
    (
      ?auto_442649 - HOIST
      ?auto_442648 - PLACE
      ?auto_442652 - PLACE
      ?auto_442650 - HOIST
      ?auto_442653 - SURFACE
      ?auto_442651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442649 ?auto_442648 ) ( IS-CRATE ?auto_442647 ) ( not ( = ?auto_442643 ?auto_442647 ) ) ( not ( = ?auto_442646 ?auto_442643 ) ) ( not ( = ?auto_442646 ?auto_442647 ) ) ( not ( = ?auto_442652 ?auto_442648 ) ) ( HOIST-AT ?auto_442650 ?auto_442652 ) ( not ( = ?auto_442649 ?auto_442650 ) ) ( AVAILABLE ?auto_442650 ) ( SURFACE-AT ?auto_442647 ?auto_442652 ) ( ON ?auto_442647 ?auto_442653 ) ( CLEAR ?auto_442647 ) ( not ( = ?auto_442643 ?auto_442653 ) ) ( not ( = ?auto_442647 ?auto_442653 ) ) ( not ( = ?auto_442646 ?auto_442653 ) ) ( SURFACE-AT ?auto_442646 ?auto_442648 ) ( CLEAR ?auto_442646 ) ( IS-CRATE ?auto_442643 ) ( AVAILABLE ?auto_442649 ) ( IN ?auto_442643 ?auto_442651 ) ( TRUCK-AT ?auto_442651 ?auto_442652 ) ( ON ?auto_442645 ?auto_442644 ) ( ON ?auto_442646 ?auto_442645 ) ( not ( = ?auto_442644 ?auto_442645 ) ) ( not ( = ?auto_442644 ?auto_442646 ) ) ( not ( = ?auto_442644 ?auto_442643 ) ) ( not ( = ?auto_442644 ?auto_442647 ) ) ( not ( = ?auto_442644 ?auto_442653 ) ) ( not ( = ?auto_442645 ?auto_442646 ) ) ( not ( = ?auto_442645 ?auto_442643 ) ) ( not ( = ?auto_442645 ?auto_442647 ) ) ( not ( = ?auto_442645 ?auto_442653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442646 ?auto_442643 ?auto_442647 )
      ( MAKE-4CRATE-VERIFY ?auto_442644 ?auto_442645 ?auto_442646 ?auto_442643 ?auto_442647 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442683 - SURFACE
      ?auto_442684 - SURFACE
      ?auto_442685 - SURFACE
      ?auto_442682 - SURFACE
      ?auto_442686 - SURFACE
    )
    :vars
    (
      ?auto_442690 - HOIST
      ?auto_442692 - PLACE
      ?auto_442688 - PLACE
      ?auto_442687 - HOIST
      ?auto_442689 - SURFACE
      ?auto_442691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442690 ?auto_442692 ) ( IS-CRATE ?auto_442686 ) ( not ( = ?auto_442682 ?auto_442686 ) ) ( not ( = ?auto_442685 ?auto_442682 ) ) ( not ( = ?auto_442685 ?auto_442686 ) ) ( not ( = ?auto_442688 ?auto_442692 ) ) ( HOIST-AT ?auto_442687 ?auto_442688 ) ( not ( = ?auto_442690 ?auto_442687 ) ) ( SURFACE-AT ?auto_442686 ?auto_442688 ) ( ON ?auto_442686 ?auto_442689 ) ( CLEAR ?auto_442686 ) ( not ( = ?auto_442682 ?auto_442689 ) ) ( not ( = ?auto_442686 ?auto_442689 ) ) ( not ( = ?auto_442685 ?auto_442689 ) ) ( SURFACE-AT ?auto_442685 ?auto_442692 ) ( CLEAR ?auto_442685 ) ( IS-CRATE ?auto_442682 ) ( AVAILABLE ?auto_442690 ) ( TRUCK-AT ?auto_442691 ?auto_442688 ) ( LIFTING ?auto_442687 ?auto_442682 ) ( ON ?auto_442684 ?auto_442683 ) ( ON ?auto_442685 ?auto_442684 ) ( not ( = ?auto_442683 ?auto_442684 ) ) ( not ( = ?auto_442683 ?auto_442685 ) ) ( not ( = ?auto_442683 ?auto_442682 ) ) ( not ( = ?auto_442683 ?auto_442686 ) ) ( not ( = ?auto_442683 ?auto_442689 ) ) ( not ( = ?auto_442684 ?auto_442685 ) ) ( not ( = ?auto_442684 ?auto_442682 ) ) ( not ( = ?auto_442684 ?auto_442686 ) ) ( not ( = ?auto_442684 ?auto_442689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442685 ?auto_442682 ?auto_442686 )
      ( MAKE-4CRATE-VERIFY ?auto_442683 ?auto_442684 ?auto_442685 ?auto_442682 ?auto_442686 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442725 - SURFACE
      ?auto_442726 - SURFACE
      ?auto_442727 - SURFACE
      ?auto_442724 - SURFACE
      ?auto_442728 - SURFACE
    )
    :vars
    (
      ?auto_442730 - HOIST
      ?auto_442734 - PLACE
      ?auto_442733 - PLACE
      ?auto_442729 - HOIST
      ?auto_442731 - SURFACE
      ?auto_442732 - TRUCK
      ?auto_442735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442730 ?auto_442734 ) ( IS-CRATE ?auto_442728 ) ( not ( = ?auto_442724 ?auto_442728 ) ) ( not ( = ?auto_442727 ?auto_442724 ) ) ( not ( = ?auto_442727 ?auto_442728 ) ) ( not ( = ?auto_442733 ?auto_442734 ) ) ( HOIST-AT ?auto_442729 ?auto_442733 ) ( not ( = ?auto_442730 ?auto_442729 ) ) ( SURFACE-AT ?auto_442728 ?auto_442733 ) ( ON ?auto_442728 ?auto_442731 ) ( CLEAR ?auto_442728 ) ( not ( = ?auto_442724 ?auto_442731 ) ) ( not ( = ?auto_442728 ?auto_442731 ) ) ( not ( = ?auto_442727 ?auto_442731 ) ) ( SURFACE-AT ?auto_442727 ?auto_442734 ) ( CLEAR ?auto_442727 ) ( IS-CRATE ?auto_442724 ) ( AVAILABLE ?auto_442730 ) ( TRUCK-AT ?auto_442732 ?auto_442733 ) ( AVAILABLE ?auto_442729 ) ( SURFACE-AT ?auto_442724 ?auto_442733 ) ( ON ?auto_442724 ?auto_442735 ) ( CLEAR ?auto_442724 ) ( not ( = ?auto_442724 ?auto_442735 ) ) ( not ( = ?auto_442728 ?auto_442735 ) ) ( not ( = ?auto_442727 ?auto_442735 ) ) ( not ( = ?auto_442731 ?auto_442735 ) ) ( ON ?auto_442726 ?auto_442725 ) ( ON ?auto_442727 ?auto_442726 ) ( not ( = ?auto_442725 ?auto_442726 ) ) ( not ( = ?auto_442725 ?auto_442727 ) ) ( not ( = ?auto_442725 ?auto_442724 ) ) ( not ( = ?auto_442725 ?auto_442728 ) ) ( not ( = ?auto_442725 ?auto_442731 ) ) ( not ( = ?auto_442725 ?auto_442735 ) ) ( not ( = ?auto_442726 ?auto_442727 ) ) ( not ( = ?auto_442726 ?auto_442724 ) ) ( not ( = ?auto_442726 ?auto_442728 ) ) ( not ( = ?auto_442726 ?auto_442731 ) ) ( not ( = ?auto_442726 ?auto_442735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442727 ?auto_442724 ?auto_442728 )
      ( MAKE-4CRATE-VERIFY ?auto_442725 ?auto_442726 ?auto_442727 ?auto_442724 ?auto_442728 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442768 - SURFACE
      ?auto_442769 - SURFACE
      ?auto_442770 - SURFACE
      ?auto_442767 - SURFACE
      ?auto_442771 - SURFACE
    )
    :vars
    (
      ?auto_442778 - HOIST
      ?auto_442777 - PLACE
      ?auto_442773 - PLACE
      ?auto_442772 - HOIST
      ?auto_442775 - SURFACE
      ?auto_442774 - SURFACE
      ?auto_442776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442778 ?auto_442777 ) ( IS-CRATE ?auto_442771 ) ( not ( = ?auto_442767 ?auto_442771 ) ) ( not ( = ?auto_442770 ?auto_442767 ) ) ( not ( = ?auto_442770 ?auto_442771 ) ) ( not ( = ?auto_442773 ?auto_442777 ) ) ( HOIST-AT ?auto_442772 ?auto_442773 ) ( not ( = ?auto_442778 ?auto_442772 ) ) ( SURFACE-AT ?auto_442771 ?auto_442773 ) ( ON ?auto_442771 ?auto_442775 ) ( CLEAR ?auto_442771 ) ( not ( = ?auto_442767 ?auto_442775 ) ) ( not ( = ?auto_442771 ?auto_442775 ) ) ( not ( = ?auto_442770 ?auto_442775 ) ) ( SURFACE-AT ?auto_442770 ?auto_442777 ) ( CLEAR ?auto_442770 ) ( IS-CRATE ?auto_442767 ) ( AVAILABLE ?auto_442778 ) ( AVAILABLE ?auto_442772 ) ( SURFACE-AT ?auto_442767 ?auto_442773 ) ( ON ?auto_442767 ?auto_442774 ) ( CLEAR ?auto_442767 ) ( not ( = ?auto_442767 ?auto_442774 ) ) ( not ( = ?auto_442771 ?auto_442774 ) ) ( not ( = ?auto_442770 ?auto_442774 ) ) ( not ( = ?auto_442775 ?auto_442774 ) ) ( TRUCK-AT ?auto_442776 ?auto_442777 ) ( ON ?auto_442769 ?auto_442768 ) ( ON ?auto_442770 ?auto_442769 ) ( not ( = ?auto_442768 ?auto_442769 ) ) ( not ( = ?auto_442768 ?auto_442770 ) ) ( not ( = ?auto_442768 ?auto_442767 ) ) ( not ( = ?auto_442768 ?auto_442771 ) ) ( not ( = ?auto_442768 ?auto_442775 ) ) ( not ( = ?auto_442768 ?auto_442774 ) ) ( not ( = ?auto_442769 ?auto_442770 ) ) ( not ( = ?auto_442769 ?auto_442767 ) ) ( not ( = ?auto_442769 ?auto_442771 ) ) ( not ( = ?auto_442769 ?auto_442775 ) ) ( not ( = ?auto_442769 ?auto_442774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442770 ?auto_442767 ?auto_442771 )
      ( MAKE-4CRATE-VERIFY ?auto_442768 ?auto_442769 ?auto_442770 ?auto_442767 ?auto_442771 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_442813 - SURFACE
      ?auto_442814 - SURFACE
      ?auto_442815 - SURFACE
      ?auto_442812 - SURFACE
      ?auto_442816 - SURFACE
    )
    :vars
    (
      ?auto_442817 - HOIST
      ?auto_442819 - PLACE
      ?auto_442820 - PLACE
      ?auto_442821 - HOIST
      ?auto_442823 - SURFACE
      ?auto_442822 - SURFACE
      ?auto_442818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442817 ?auto_442819 ) ( IS-CRATE ?auto_442816 ) ( not ( = ?auto_442812 ?auto_442816 ) ) ( not ( = ?auto_442815 ?auto_442812 ) ) ( not ( = ?auto_442815 ?auto_442816 ) ) ( not ( = ?auto_442820 ?auto_442819 ) ) ( HOIST-AT ?auto_442821 ?auto_442820 ) ( not ( = ?auto_442817 ?auto_442821 ) ) ( SURFACE-AT ?auto_442816 ?auto_442820 ) ( ON ?auto_442816 ?auto_442823 ) ( CLEAR ?auto_442816 ) ( not ( = ?auto_442812 ?auto_442823 ) ) ( not ( = ?auto_442816 ?auto_442823 ) ) ( not ( = ?auto_442815 ?auto_442823 ) ) ( IS-CRATE ?auto_442812 ) ( AVAILABLE ?auto_442821 ) ( SURFACE-AT ?auto_442812 ?auto_442820 ) ( ON ?auto_442812 ?auto_442822 ) ( CLEAR ?auto_442812 ) ( not ( = ?auto_442812 ?auto_442822 ) ) ( not ( = ?auto_442816 ?auto_442822 ) ) ( not ( = ?auto_442815 ?auto_442822 ) ) ( not ( = ?auto_442823 ?auto_442822 ) ) ( TRUCK-AT ?auto_442818 ?auto_442819 ) ( SURFACE-AT ?auto_442814 ?auto_442819 ) ( CLEAR ?auto_442814 ) ( LIFTING ?auto_442817 ?auto_442815 ) ( IS-CRATE ?auto_442815 ) ( not ( = ?auto_442814 ?auto_442815 ) ) ( not ( = ?auto_442812 ?auto_442814 ) ) ( not ( = ?auto_442816 ?auto_442814 ) ) ( not ( = ?auto_442823 ?auto_442814 ) ) ( not ( = ?auto_442822 ?auto_442814 ) ) ( ON ?auto_442814 ?auto_442813 ) ( not ( = ?auto_442813 ?auto_442814 ) ) ( not ( = ?auto_442813 ?auto_442815 ) ) ( not ( = ?auto_442813 ?auto_442812 ) ) ( not ( = ?auto_442813 ?auto_442816 ) ) ( not ( = ?auto_442813 ?auto_442823 ) ) ( not ( = ?auto_442813 ?auto_442822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442815 ?auto_442812 ?auto_442816 )
      ( MAKE-4CRATE-VERIFY ?auto_442813 ?auto_442814 ?auto_442815 ?auto_442812 ?auto_442816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442898 - SURFACE
      ?auto_442899 - SURFACE
    )
    :vars
    (
      ?auto_442901 - HOIST
      ?auto_442905 - PLACE
      ?auto_442903 - SURFACE
      ?auto_442907 - PLACE
      ?auto_442902 - HOIST
      ?auto_442904 - SURFACE
      ?auto_442906 - TRUCK
      ?auto_442900 - SURFACE
      ?auto_442908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442901 ?auto_442905 ) ( IS-CRATE ?auto_442899 ) ( not ( = ?auto_442898 ?auto_442899 ) ) ( not ( = ?auto_442903 ?auto_442898 ) ) ( not ( = ?auto_442903 ?auto_442899 ) ) ( not ( = ?auto_442907 ?auto_442905 ) ) ( HOIST-AT ?auto_442902 ?auto_442907 ) ( not ( = ?auto_442901 ?auto_442902 ) ) ( SURFACE-AT ?auto_442899 ?auto_442907 ) ( ON ?auto_442899 ?auto_442904 ) ( CLEAR ?auto_442899 ) ( not ( = ?auto_442898 ?auto_442904 ) ) ( not ( = ?auto_442899 ?auto_442904 ) ) ( not ( = ?auto_442903 ?auto_442904 ) ) ( SURFACE-AT ?auto_442903 ?auto_442905 ) ( CLEAR ?auto_442903 ) ( IS-CRATE ?auto_442898 ) ( AVAILABLE ?auto_442901 ) ( TRUCK-AT ?auto_442906 ?auto_442907 ) ( SURFACE-AT ?auto_442898 ?auto_442907 ) ( ON ?auto_442898 ?auto_442900 ) ( CLEAR ?auto_442898 ) ( not ( = ?auto_442898 ?auto_442900 ) ) ( not ( = ?auto_442899 ?auto_442900 ) ) ( not ( = ?auto_442903 ?auto_442900 ) ) ( not ( = ?auto_442904 ?auto_442900 ) ) ( LIFTING ?auto_442902 ?auto_442908 ) ( IS-CRATE ?auto_442908 ) ( not ( = ?auto_442898 ?auto_442908 ) ) ( not ( = ?auto_442899 ?auto_442908 ) ) ( not ( = ?auto_442903 ?auto_442908 ) ) ( not ( = ?auto_442904 ?auto_442908 ) ) ( not ( = ?auto_442900 ?auto_442908 ) ) )
    :subtasks
    ( ( !LOAD ?auto_442902 ?auto_442908 ?auto_442906 ?auto_442907 )
      ( MAKE-1CRATE ?auto_442898 ?auto_442899 )
      ( MAKE-1CRATE-VERIFY ?auto_442898 ?auto_442899 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443287 - SURFACE
      ?auto_443288 - SURFACE
      ?auto_443289 - SURFACE
      ?auto_443286 - SURFACE
      ?auto_443290 - SURFACE
      ?auto_443291 - SURFACE
    )
    :vars
    (
      ?auto_443293 - HOIST
      ?auto_443292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443293 ?auto_443292 ) ( SURFACE-AT ?auto_443290 ?auto_443292 ) ( CLEAR ?auto_443290 ) ( LIFTING ?auto_443293 ?auto_443291 ) ( IS-CRATE ?auto_443291 ) ( not ( = ?auto_443290 ?auto_443291 ) ) ( ON ?auto_443288 ?auto_443287 ) ( ON ?auto_443289 ?auto_443288 ) ( ON ?auto_443286 ?auto_443289 ) ( ON ?auto_443290 ?auto_443286 ) ( not ( = ?auto_443287 ?auto_443288 ) ) ( not ( = ?auto_443287 ?auto_443289 ) ) ( not ( = ?auto_443287 ?auto_443286 ) ) ( not ( = ?auto_443287 ?auto_443290 ) ) ( not ( = ?auto_443287 ?auto_443291 ) ) ( not ( = ?auto_443288 ?auto_443289 ) ) ( not ( = ?auto_443288 ?auto_443286 ) ) ( not ( = ?auto_443288 ?auto_443290 ) ) ( not ( = ?auto_443288 ?auto_443291 ) ) ( not ( = ?auto_443289 ?auto_443286 ) ) ( not ( = ?auto_443289 ?auto_443290 ) ) ( not ( = ?auto_443289 ?auto_443291 ) ) ( not ( = ?auto_443286 ?auto_443290 ) ) ( not ( = ?auto_443286 ?auto_443291 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_443290 ?auto_443291 )
      ( MAKE-5CRATE-VERIFY ?auto_443287 ?auto_443288 ?auto_443289 ?auto_443286 ?auto_443290 ?auto_443291 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443321 - SURFACE
      ?auto_443322 - SURFACE
      ?auto_443323 - SURFACE
      ?auto_443320 - SURFACE
      ?auto_443324 - SURFACE
      ?auto_443325 - SURFACE
    )
    :vars
    (
      ?auto_443327 - HOIST
      ?auto_443328 - PLACE
      ?auto_443326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443327 ?auto_443328 ) ( SURFACE-AT ?auto_443324 ?auto_443328 ) ( CLEAR ?auto_443324 ) ( IS-CRATE ?auto_443325 ) ( not ( = ?auto_443324 ?auto_443325 ) ) ( TRUCK-AT ?auto_443326 ?auto_443328 ) ( AVAILABLE ?auto_443327 ) ( IN ?auto_443325 ?auto_443326 ) ( ON ?auto_443324 ?auto_443320 ) ( not ( = ?auto_443320 ?auto_443324 ) ) ( not ( = ?auto_443320 ?auto_443325 ) ) ( ON ?auto_443322 ?auto_443321 ) ( ON ?auto_443323 ?auto_443322 ) ( ON ?auto_443320 ?auto_443323 ) ( not ( = ?auto_443321 ?auto_443322 ) ) ( not ( = ?auto_443321 ?auto_443323 ) ) ( not ( = ?auto_443321 ?auto_443320 ) ) ( not ( = ?auto_443321 ?auto_443324 ) ) ( not ( = ?auto_443321 ?auto_443325 ) ) ( not ( = ?auto_443322 ?auto_443323 ) ) ( not ( = ?auto_443322 ?auto_443320 ) ) ( not ( = ?auto_443322 ?auto_443324 ) ) ( not ( = ?auto_443322 ?auto_443325 ) ) ( not ( = ?auto_443323 ?auto_443320 ) ) ( not ( = ?auto_443323 ?auto_443324 ) ) ( not ( = ?auto_443323 ?auto_443325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443320 ?auto_443324 ?auto_443325 )
      ( MAKE-5CRATE-VERIFY ?auto_443321 ?auto_443322 ?auto_443323 ?auto_443320 ?auto_443324 ?auto_443325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443361 - SURFACE
      ?auto_443362 - SURFACE
      ?auto_443363 - SURFACE
      ?auto_443360 - SURFACE
      ?auto_443364 - SURFACE
      ?auto_443365 - SURFACE
    )
    :vars
    (
      ?auto_443368 - HOIST
      ?auto_443366 - PLACE
      ?auto_443367 - TRUCK
      ?auto_443369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443368 ?auto_443366 ) ( SURFACE-AT ?auto_443364 ?auto_443366 ) ( CLEAR ?auto_443364 ) ( IS-CRATE ?auto_443365 ) ( not ( = ?auto_443364 ?auto_443365 ) ) ( AVAILABLE ?auto_443368 ) ( IN ?auto_443365 ?auto_443367 ) ( ON ?auto_443364 ?auto_443360 ) ( not ( = ?auto_443360 ?auto_443364 ) ) ( not ( = ?auto_443360 ?auto_443365 ) ) ( TRUCK-AT ?auto_443367 ?auto_443369 ) ( not ( = ?auto_443369 ?auto_443366 ) ) ( ON ?auto_443362 ?auto_443361 ) ( ON ?auto_443363 ?auto_443362 ) ( ON ?auto_443360 ?auto_443363 ) ( not ( = ?auto_443361 ?auto_443362 ) ) ( not ( = ?auto_443361 ?auto_443363 ) ) ( not ( = ?auto_443361 ?auto_443360 ) ) ( not ( = ?auto_443361 ?auto_443364 ) ) ( not ( = ?auto_443361 ?auto_443365 ) ) ( not ( = ?auto_443362 ?auto_443363 ) ) ( not ( = ?auto_443362 ?auto_443360 ) ) ( not ( = ?auto_443362 ?auto_443364 ) ) ( not ( = ?auto_443362 ?auto_443365 ) ) ( not ( = ?auto_443363 ?auto_443360 ) ) ( not ( = ?auto_443363 ?auto_443364 ) ) ( not ( = ?auto_443363 ?auto_443365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443360 ?auto_443364 ?auto_443365 )
      ( MAKE-5CRATE-VERIFY ?auto_443361 ?auto_443362 ?auto_443363 ?auto_443360 ?auto_443364 ?auto_443365 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443406 - SURFACE
      ?auto_443407 - SURFACE
      ?auto_443408 - SURFACE
      ?auto_443405 - SURFACE
      ?auto_443409 - SURFACE
      ?auto_443410 - SURFACE
    )
    :vars
    (
      ?auto_443415 - HOIST
      ?auto_443414 - PLACE
      ?auto_443413 - TRUCK
      ?auto_443412 - PLACE
      ?auto_443411 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_443415 ?auto_443414 ) ( SURFACE-AT ?auto_443409 ?auto_443414 ) ( CLEAR ?auto_443409 ) ( IS-CRATE ?auto_443410 ) ( not ( = ?auto_443409 ?auto_443410 ) ) ( AVAILABLE ?auto_443415 ) ( ON ?auto_443409 ?auto_443405 ) ( not ( = ?auto_443405 ?auto_443409 ) ) ( not ( = ?auto_443405 ?auto_443410 ) ) ( TRUCK-AT ?auto_443413 ?auto_443412 ) ( not ( = ?auto_443412 ?auto_443414 ) ) ( HOIST-AT ?auto_443411 ?auto_443412 ) ( LIFTING ?auto_443411 ?auto_443410 ) ( not ( = ?auto_443415 ?auto_443411 ) ) ( ON ?auto_443407 ?auto_443406 ) ( ON ?auto_443408 ?auto_443407 ) ( ON ?auto_443405 ?auto_443408 ) ( not ( = ?auto_443406 ?auto_443407 ) ) ( not ( = ?auto_443406 ?auto_443408 ) ) ( not ( = ?auto_443406 ?auto_443405 ) ) ( not ( = ?auto_443406 ?auto_443409 ) ) ( not ( = ?auto_443406 ?auto_443410 ) ) ( not ( = ?auto_443407 ?auto_443408 ) ) ( not ( = ?auto_443407 ?auto_443405 ) ) ( not ( = ?auto_443407 ?auto_443409 ) ) ( not ( = ?auto_443407 ?auto_443410 ) ) ( not ( = ?auto_443408 ?auto_443405 ) ) ( not ( = ?auto_443408 ?auto_443409 ) ) ( not ( = ?auto_443408 ?auto_443410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443405 ?auto_443409 ?auto_443410 )
      ( MAKE-5CRATE-VERIFY ?auto_443406 ?auto_443407 ?auto_443408 ?auto_443405 ?auto_443409 ?auto_443410 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443456 - SURFACE
      ?auto_443457 - SURFACE
      ?auto_443458 - SURFACE
      ?auto_443455 - SURFACE
      ?auto_443459 - SURFACE
      ?auto_443460 - SURFACE
    )
    :vars
    (
      ?auto_443464 - HOIST
      ?auto_443462 - PLACE
      ?auto_443466 - TRUCK
      ?auto_443465 - PLACE
      ?auto_443461 - HOIST
      ?auto_443463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443464 ?auto_443462 ) ( SURFACE-AT ?auto_443459 ?auto_443462 ) ( CLEAR ?auto_443459 ) ( IS-CRATE ?auto_443460 ) ( not ( = ?auto_443459 ?auto_443460 ) ) ( AVAILABLE ?auto_443464 ) ( ON ?auto_443459 ?auto_443455 ) ( not ( = ?auto_443455 ?auto_443459 ) ) ( not ( = ?auto_443455 ?auto_443460 ) ) ( TRUCK-AT ?auto_443466 ?auto_443465 ) ( not ( = ?auto_443465 ?auto_443462 ) ) ( HOIST-AT ?auto_443461 ?auto_443465 ) ( not ( = ?auto_443464 ?auto_443461 ) ) ( AVAILABLE ?auto_443461 ) ( SURFACE-AT ?auto_443460 ?auto_443465 ) ( ON ?auto_443460 ?auto_443463 ) ( CLEAR ?auto_443460 ) ( not ( = ?auto_443459 ?auto_443463 ) ) ( not ( = ?auto_443460 ?auto_443463 ) ) ( not ( = ?auto_443455 ?auto_443463 ) ) ( ON ?auto_443457 ?auto_443456 ) ( ON ?auto_443458 ?auto_443457 ) ( ON ?auto_443455 ?auto_443458 ) ( not ( = ?auto_443456 ?auto_443457 ) ) ( not ( = ?auto_443456 ?auto_443458 ) ) ( not ( = ?auto_443456 ?auto_443455 ) ) ( not ( = ?auto_443456 ?auto_443459 ) ) ( not ( = ?auto_443456 ?auto_443460 ) ) ( not ( = ?auto_443456 ?auto_443463 ) ) ( not ( = ?auto_443457 ?auto_443458 ) ) ( not ( = ?auto_443457 ?auto_443455 ) ) ( not ( = ?auto_443457 ?auto_443459 ) ) ( not ( = ?auto_443457 ?auto_443460 ) ) ( not ( = ?auto_443457 ?auto_443463 ) ) ( not ( = ?auto_443458 ?auto_443455 ) ) ( not ( = ?auto_443458 ?auto_443459 ) ) ( not ( = ?auto_443458 ?auto_443460 ) ) ( not ( = ?auto_443458 ?auto_443463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443455 ?auto_443459 ?auto_443460 )
      ( MAKE-5CRATE-VERIFY ?auto_443456 ?auto_443457 ?auto_443458 ?auto_443455 ?auto_443459 ?auto_443460 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443507 - SURFACE
      ?auto_443508 - SURFACE
      ?auto_443509 - SURFACE
      ?auto_443506 - SURFACE
      ?auto_443510 - SURFACE
      ?auto_443511 - SURFACE
    )
    :vars
    (
      ?auto_443513 - HOIST
      ?auto_443517 - PLACE
      ?auto_443515 - PLACE
      ?auto_443516 - HOIST
      ?auto_443514 - SURFACE
      ?auto_443512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443513 ?auto_443517 ) ( SURFACE-AT ?auto_443510 ?auto_443517 ) ( CLEAR ?auto_443510 ) ( IS-CRATE ?auto_443511 ) ( not ( = ?auto_443510 ?auto_443511 ) ) ( AVAILABLE ?auto_443513 ) ( ON ?auto_443510 ?auto_443506 ) ( not ( = ?auto_443506 ?auto_443510 ) ) ( not ( = ?auto_443506 ?auto_443511 ) ) ( not ( = ?auto_443515 ?auto_443517 ) ) ( HOIST-AT ?auto_443516 ?auto_443515 ) ( not ( = ?auto_443513 ?auto_443516 ) ) ( AVAILABLE ?auto_443516 ) ( SURFACE-AT ?auto_443511 ?auto_443515 ) ( ON ?auto_443511 ?auto_443514 ) ( CLEAR ?auto_443511 ) ( not ( = ?auto_443510 ?auto_443514 ) ) ( not ( = ?auto_443511 ?auto_443514 ) ) ( not ( = ?auto_443506 ?auto_443514 ) ) ( TRUCK-AT ?auto_443512 ?auto_443517 ) ( ON ?auto_443508 ?auto_443507 ) ( ON ?auto_443509 ?auto_443508 ) ( ON ?auto_443506 ?auto_443509 ) ( not ( = ?auto_443507 ?auto_443508 ) ) ( not ( = ?auto_443507 ?auto_443509 ) ) ( not ( = ?auto_443507 ?auto_443506 ) ) ( not ( = ?auto_443507 ?auto_443510 ) ) ( not ( = ?auto_443507 ?auto_443511 ) ) ( not ( = ?auto_443507 ?auto_443514 ) ) ( not ( = ?auto_443508 ?auto_443509 ) ) ( not ( = ?auto_443508 ?auto_443506 ) ) ( not ( = ?auto_443508 ?auto_443510 ) ) ( not ( = ?auto_443508 ?auto_443511 ) ) ( not ( = ?auto_443508 ?auto_443514 ) ) ( not ( = ?auto_443509 ?auto_443506 ) ) ( not ( = ?auto_443509 ?auto_443510 ) ) ( not ( = ?auto_443509 ?auto_443511 ) ) ( not ( = ?auto_443509 ?auto_443514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443506 ?auto_443510 ?auto_443511 )
      ( MAKE-5CRATE-VERIFY ?auto_443507 ?auto_443508 ?auto_443509 ?auto_443506 ?auto_443510 ?auto_443511 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443558 - SURFACE
      ?auto_443559 - SURFACE
      ?auto_443560 - SURFACE
      ?auto_443557 - SURFACE
      ?auto_443561 - SURFACE
      ?auto_443562 - SURFACE
    )
    :vars
    (
      ?auto_443566 - HOIST
      ?auto_443567 - PLACE
      ?auto_443564 - PLACE
      ?auto_443568 - HOIST
      ?auto_443563 - SURFACE
      ?auto_443565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443566 ?auto_443567 ) ( IS-CRATE ?auto_443562 ) ( not ( = ?auto_443561 ?auto_443562 ) ) ( not ( = ?auto_443557 ?auto_443561 ) ) ( not ( = ?auto_443557 ?auto_443562 ) ) ( not ( = ?auto_443564 ?auto_443567 ) ) ( HOIST-AT ?auto_443568 ?auto_443564 ) ( not ( = ?auto_443566 ?auto_443568 ) ) ( AVAILABLE ?auto_443568 ) ( SURFACE-AT ?auto_443562 ?auto_443564 ) ( ON ?auto_443562 ?auto_443563 ) ( CLEAR ?auto_443562 ) ( not ( = ?auto_443561 ?auto_443563 ) ) ( not ( = ?auto_443562 ?auto_443563 ) ) ( not ( = ?auto_443557 ?auto_443563 ) ) ( TRUCK-AT ?auto_443565 ?auto_443567 ) ( SURFACE-AT ?auto_443557 ?auto_443567 ) ( CLEAR ?auto_443557 ) ( LIFTING ?auto_443566 ?auto_443561 ) ( IS-CRATE ?auto_443561 ) ( ON ?auto_443559 ?auto_443558 ) ( ON ?auto_443560 ?auto_443559 ) ( ON ?auto_443557 ?auto_443560 ) ( not ( = ?auto_443558 ?auto_443559 ) ) ( not ( = ?auto_443558 ?auto_443560 ) ) ( not ( = ?auto_443558 ?auto_443557 ) ) ( not ( = ?auto_443558 ?auto_443561 ) ) ( not ( = ?auto_443558 ?auto_443562 ) ) ( not ( = ?auto_443558 ?auto_443563 ) ) ( not ( = ?auto_443559 ?auto_443560 ) ) ( not ( = ?auto_443559 ?auto_443557 ) ) ( not ( = ?auto_443559 ?auto_443561 ) ) ( not ( = ?auto_443559 ?auto_443562 ) ) ( not ( = ?auto_443559 ?auto_443563 ) ) ( not ( = ?auto_443560 ?auto_443557 ) ) ( not ( = ?auto_443560 ?auto_443561 ) ) ( not ( = ?auto_443560 ?auto_443562 ) ) ( not ( = ?auto_443560 ?auto_443563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443557 ?auto_443561 ?auto_443562 )
      ( MAKE-5CRATE-VERIFY ?auto_443558 ?auto_443559 ?auto_443560 ?auto_443557 ?auto_443561 ?auto_443562 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_443609 - SURFACE
      ?auto_443610 - SURFACE
      ?auto_443611 - SURFACE
      ?auto_443608 - SURFACE
      ?auto_443612 - SURFACE
      ?auto_443613 - SURFACE
    )
    :vars
    (
      ?auto_443614 - HOIST
      ?auto_443618 - PLACE
      ?auto_443616 - PLACE
      ?auto_443617 - HOIST
      ?auto_443615 - SURFACE
      ?auto_443619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443614 ?auto_443618 ) ( IS-CRATE ?auto_443613 ) ( not ( = ?auto_443612 ?auto_443613 ) ) ( not ( = ?auto_443608 ?auto_443612 ) ) ( not ( = ?auto_443608 ?auto_443613 ) ) ( not ( = ?auto_443616 ?auto_443618 ) ) ( HOIST-AT ?auto_443617 ?auto_443616 ) ( not ( = ?auto_443614 ?auto_443617 ) ) ( AVAILABLE ?auto_443617 ) ( SURFACE-AT ?auto_443613 ?auto_443616 ) ( ON ?auto_443613 ?auto_443615 ) ( CLEAR ?auto_443613 ) ( not ( = ?auto_443612 ?auto_443615 ) ) ( not ( = ?auto_443613 ?auto_443615 ) ) ( not ( = ?auto_443608 ?auto_443615 ) ) ( TRUCK-AT ?auto_443619 ?auto_443618 ) ( SURFACE-AT ?auto_443608 ?auto_443618 ) ( CLEAR ?auto_443608 ) ( IS-CRATE ?auto_443612 ) ( AVAILABLE ?auto_443614 ) ( IN ?auto_443612 ?auto_443619 ) ( ON ?auto_443610 ?auto_443609 ) ( ON ?auto_443611 ?auto_443610 ) ( ON ?auto_443608 ?auto_443611 ) ( not ( = ?auto_443609 ?auto_443610 ) ) ( not ( = ?auto_443609 ?auto_443611 ) ) ( not ( = ?auto_443609 ?auto_443608 ) ) ( not ( = ?auto_443609 ?auto_443612 ) ) ( not ( = ?auto_443609 ?auto_443613 ) ) ( not ( = ?auto_443609 ?auto_443615 ) ) ( not ( = ?auto_443610 ?auto_443611 ) ) ( not ( = ?auto_443610 ?auto_443608 ) ) ( not ( = ?auto_443610 ?auto_443612 ) ) ( not ( = ?auto_443610 ?auto_443613 ) ) ( not ( = ?auto_443610 ?auto_443615 ) ) ( not ( = ?auto_443611 ?auto_443608 ) ) ( not ( = ?auto_443611 ?auto_443612 ) ) ( not ( = ?auto_443611 ?auto_443613 ) ) ( not ( = ?auto_443611 ?auto_443615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443608 ?auto_443612 ?auto_443613 )
      ( MAKE-5CRATE-VERIFY ?auto_443609 ?auto_443610 ?auto_443611 ?auto_443608 ?auto_443612 ?auto_443613 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_443976 - SURFACE
      ?auto_443977 - SURFACE
    )
    :vars
    (
      ?auto_443978 - HOIST
      ?auto_443982 - PLACE
      ?auto_443981 - SURFACE
      ?auto_443979 - PLACE
      ?auto_443983 - HOIST
      ?auto_443984 - SURFACE
      ?auto_443980 - TRUCK
      ?auto_443985 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443978 ?auto_443982 ) ( SURFACE-AT ?auto_443976 ?auto_443982 ) ( CLEAR ?auto_443976 ) ( IS-CRATE ?auto_443977 ) ( not ( = ?auto_443976 ?auto_443977 ) ) ( ON ?auto_443976 ?auto_443981 ) ( not ( = ?auto_443981 ?auto_443976 ) ) ( not ( = ?auto_443981 ?auto_443977 ) ) ( not ( = ?auto_443979 ?auto_443982 ) ) ( HOIST-AT ?auto_443983 ?auto_443979 ) ( not ( = ?auto_443978 ?auto_443983 ) ) ( AVAILABLE ?auto_443983 ) ( SURFACE-AT ?auto_443977 ?auto_443979 ) ( ON ?auto_443977 ?auto_443984 ) ( CLEAR ?auto_443977 ) ( not ( = ?auto_443976 ?auto_443984 ) ) ( not ( = ?auto_443977 ?auto_443984 ) ) ( not ( = ?auto_443981 ?auto_443984 ) ) ( TRUCK-AT ?auto_443980 ?auto_443982 ) ( LIFTING ?auto_443978 ?auto_443985 ) ( IS-CRATE ?auto_443985 ) ( not ( = ?auto_443976 ?auto_443985 ) ) ( not ( = ?auto_443977 ?auto_443985 ) ) ( not ( = ?auto_443981 ?auto_443985 ) ) ( not ( = ?auto_443984 ?auto_443985 ) ) )
    :subtasks
    ( ( !LOAD ?auto_443978 ?auto_443985 ?auto_443980 ?auto_443982 )
      ( MAKE-1CRATE ?auto_443976 ?auto_443977 )
      ( MAKE-1CRATE-VERIFY ?auto_443976 ?auto_443977 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444803 - SURFACE
      ?auto_444804 - SURFACE
      ?auto_444805 - SURFACE
      ?auto_444802 - SURFACE
      ?auto_444806 - SURFACE
      ?auto_444808 - SURFACE
      ?auto_444807 - SURFACE
    )
    :vars
    (
      ?auto_444809 - HOIST
      ?auto_444810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_444809 ?auto_444810 ) ( SURFACE-AT ?auto_444808 ?auto_444810 ) ( CLEAR ?auto_444808 ) ( LIFTING ?auto_444809 ?auto_444807 ) ( IS-CRATE ?auto_444807 ) ( not ( = ?auto_444808 ?auto_444807 ) ) ( ON ?auto_444804 ?auto_444803 ) ( ON ?auto_444805 ?auto_444804 ) ( ON ?auto_444802 ?auto_444805 ) ( ON ?auto_444806 ?auto_444802 ) ( ON ?auto_444808 ?auto_444806 ) ( not ( = ?auto_444803 ?auto_444804 ) ) ( not ( = ?auto_444803 ?auto_444805 ) ) ( not ( = ?auto_444803 ?auto_444802 ) ) ( not ( = ?auto_444803 ?auto_444806 ) ) ( not ( = ?auto_444803 ?auto_444808 ) ) ( not ( = ?auto_444803 ?auto_444807 ) ) ( not ( = ?auto_444804 ?auto_444805 ) ) ( not ( = ?auto_444804 ?auto_444802 ) ) ( not ( = ?auto_444804 ?auto_444806 ) ) ( not ( = ?auto_444804 ?auto_444808 ) ) ( not ( = ?auto_444804 ?auto_444807 ) ) ( not ( = ?auto_444805 ?auto_444802 ) ) ( not ( = ?auto_444805 ?auto_444806 ) ) ( not ( = ?auto_444805 ?auto_444808 ) ) ( not ( = ?auto_444805 ?auto_444807 ) ) ( not ( = ?auto_444802 ?auto_444806 ) ) ( not ( = ?auto_444802 ?auto_444808 ) ) ( not ( = ?auto_444802 ?auto_444807 ) ) ( not ( = ?auto_444806 ?auto_444808 ) ) ( not ( = ?auto_444806 ?auto_444807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_444808 ?auto_444807 )
      ( MAKE-6CRATE-VERIFY ?auto_444803 ?auto_444804 ?auto_444805 ?auto_444802 ?auto_444806 ?auto_444808 ?auto_444807 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444847 - SURFACE
      ?auto_444848 - SURFACE
      ?auto_444849 - SURFACE
      ?auto_444846 - SURFACE
      ?auto_444850 - SURFACE
      ?auto_444852 - SURFACE
      ?auto_444851 - SURFACE
    )
    :vars
    (
      ?auto_444853 - HOIST
      ?auto_444855 - PLACE
      ?auto_444854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444853 ?auto_444855 ) ( SURFACE-AT ?auto_444852 ?auto_444855 ) ( CLEAR ?auto_444852 ) ( IS-CRATE ?auto_444851 ) ( not ( = ?auto_444852 ?auto_444851 ) ) ( TRUCK-AT ?auto_444854 ?auto_444855 ) ( AVAILABLE ?auto_444853 ) ( IN ?auto_444851 ?auto_444854 ) ( ON ?auto_444852 ?auto_444850 ) ( not ( = ?auto_444850 ?auto_444852 ) ) ( not ( = ?auto_444850 ?auto_444851 ) ) ( ON ?auto_444848 ?auto_444847 ) ( ON ?auto_444849 ?auto_444848 ) ( ON ?auto_444846 ?auto_444849 ) ( ON ?auto_444850 ?auto_444846 ) ( not ( = ?auto_444847 ?auto_444848 ) ) ( not ( = ?auto_444847 ?auto_444849 ) ) ( not ( = ?auto_444847 ?auto_444846 ) ) ( not ( = ?auto_444847 ?auto_444850 ) ) ( not ( = ?auto_444847 ?auto_444852 ) ) ( not ( = ?auto_444847 ?auto_444851 ) ) ( not ( = ?auto_444848 ?auto_444849 ) ) ( not ( = ?auto_444848 ?auto_444846 ) ) ( not ( = ?auto_444848 ?auto_444850 ) ) ( not ( = ?auto_444848 ?auto_444852 ) ) ( not ( = ?auto_444848 ?auto_444851 ) ) ( not ( = ?auto_444849 ?auto_444846 ) ) ( not ( = ?auto_444849 ?auto_444850 ) ) ( not ( = ?auto_444849 ?auto_444852 ) ) ( not ( = ?auto_444849 ?auto_444851 ) ) ( not ( = ?auto_444846 ?auto_444850 ) ) ( not ( = ?auto_444846 ?auto_444852 ) ) ( not ( = ?auto_444846 ?auto_444851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444850 ?auto_444852 ?auto_444851 )
      ( MAKE-6CRATE-VERIFY ?auto_444847 ?auto_444848 ?auto_444849 ?auto_444846 ?auto_444850 ?auto_444852 ?auto_444851 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444898 - SURFACE
      ?auto_444899 - SURFACE
      ?auto_444900 - SURFACE
      ?auto_444897 - SURFACE
      ?auto_444901 - SURFACE
      ?auto_444903 - SURFACE
      ?auto_444902 - SURFACE
    )
    :vars
    (
      ?auto_444904 - HOIST
      ?auto_444905 - PLACE
      ?auto_444907 - TRUCK
      ?auto_444906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_444904 ?auto_444905 ) ( SURFACE-AT ?auto_444903 ?auto_444905 ) ( CLEAR ?auto_444903 ) ( IS-CRATE ?auto_444902 ) ( not ( = ?auto_444903 ?auto_444902 ) ) ( AVAILABLE ?auto_444904 ) ( IN ?auto_444902 ?auto_444907 ) ( ON ?auto_444903 ?auto_444901 ) ( not ( = ?auto_444901 ?auto_444903 ) ) ( not ( = ?auto_444901 ?auto_444902 ) ) ( TRUCK-AT ?auto_444907 ?auto_444906 ) ( not ( = ?auto_444906 ?auto_444905 ) ) ( ON ?auto_444899 ?auto_444898 ) ( ON ?auto_444900 ?auto_444899 ) ( ON ?auto_444897 ?auto_444900 ) ( ON ?auto_444901 ?auto_444897 ) ( not ( = ?auto_444898 ?auto_444899 ) ) ( not ( = ?auto_444898 ?auto_444900 ) ) ( not ( = ?auto_444898 ?auto_444897 ) ) ( not ( = ?auto_444898 ?auto_444901 ) ) ( not ( = ?auto_444898 ?auto_444903 ) ) ( not ( = ?auto_444898 ?auto_444902 ) ) ( not ( = ?auto_444899 ?auto_444900 ) ) ( not ( = ?auto_444899 ?auto_444897 ) ) ( not ( = ?auto_444899 ?auto_444901 ) ) ( not ( = ?auto_444899 ?auto_444903 ) ) ( not ( = ?auto_444899 ?auto_444902 ) ) ( not ( = ?auto_444900 ?auto_444897 ) ) ( not ( = ?auto_444900 ?auto_444901 ) ) ( not ( = ?auto_444900 ?auto_444903 ) ) ( not ( = ?auto_444900 ?auto_444902 ) ) ( not ( = ?auto_444897 ?auto_444901 ) ) ( not ( = ?auto_444897 ?auto_444903 ) ) ( not ( = ?auto_444897 ?auto_444902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444901 ?auto_444903 ?auto_444902 )
      ( MAKE-6CRATE-VERIFY ?auto_444898 ?auto_444899 ?auto_444900 ?auto_444897 ?auto_444901 ?auto_444903 ?auto_444902 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444955 - SURFACE
      ?auto_444956 - SURFACE
      ?auto_444957 - SURFACE
      ?auto_444954 - SURFACE
      ?auto_444958 - SURFACE
      ?auto_444960 - SURFACE
      ?auto_444959 - SURFACE
    )
    :vars
    (
      ?auto_444965 - HOIST
      ?auto_444964 - PLACE
      ?auto_444962 - TRUCK
      ?auto_444961 - PLACE
      ?auto_444963 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_444965 ?auto_444964 ) ( SURFACE-AT ?auto_444960 ?auto_444964 ) ( CLEAR ?auto_444960 ) ( IS-CRATE ?auto_444959 ) ( not ( = ?auto_444960 ?auto_444959 ) ) ( AVAILABLE ?auto_444965 ) ( ON ?auto_444960 ?auto_444958 ) ( not ( = ?auto_444958 ?auto_444960 ) ) ( not ( = ?auto_444958 ?auto_444959 ) ) ( TRUCK-AT ?auto_444962 ?auto_444961 ) ( not ( = ?auto_444961 ?auto_444964 ) ) ( HOIST-AT ?auto_444963 ?auto_444961 ) ( LIFTING ?auto_444963 ?auto_444959 ) ( not ( = ?auto_444965 ?auto_444963 ) ) ( ON ?auto_444956 ?auto_444955 ) ( ON ?auto_444957 ?auto_444956 ) ( ON ?auto_444954 ?auto_444957 ) ( ON ?auto_444958 ?auto_444954 ) ( not ( = ?auto_444955 ?auto_444956 ) ) ( not ( = ?auto_444955 ?auto_444957 ) ) ( not ( = ?auto_444955 ?auto_444954 ) ) ( not ( = ?auto_444955 ?auto_444958 ) ) ( not ( = ?auto_444955 ?auto_444960 ) ) ( not ( = ?auto_444955 ?auto_444959 ) ) ( not ( = ?auto_444956 ?auto_444957 ) ) ( not ( = ?auto_444956 ?auto_444954 ) ) ( not ( = ?auto_444956 ?auto_444958 ) ) ( not ( = ?auto_444956 ?auto_444960 ) ) ( not ( = ?auto_444956 ?auto_444959 ) ) ( not ( = ?auto_444957 ?auto_444954 ) ) ( not ( = ?auto_444957 ?auto_444958 ) ) ( not ( = ?auto_444957 ?auto_444960 ) ) ( not ( = ?auto_444957 ?auto_444959 ) ) ( not ( = ?auto_444954 ?auto_444958 ) ) ( not ( = ?auto_444954 ?auto_444960 ) ) ( not ( = ?auto_444954 ?auto_444959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444958 ?auto_444960 ?auto_444959 )
      ( MAKE-6CRATE-VERIFY ?auto_444955 ?auto_444956 ?auto_444957 ?auto_444954 ?auto_444958 ?auto_444960 ?auto_444959 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_445018 - SURFACE
      ?auto_445019 - SURFACE
      ?auto_445020 - SURFACE
      ?auto_445017 - SURFACE
      ?auto_445021 - SURFACE
      ?auto_445023 - SURFACE
      ?auto_445022 - SURFACE
    )
    :vars
    (
      ?auto_445024 - HOIST
      ?auto_445027 - PLACE
      ?auto_445028 - TRUCK
      ?auto_445026 - PLACE
      ?auto_445029 - HOIST
      ?auto_445025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_445024 ?auto_445027 ) ( SURFACE-AT ?auto_445023 ?auto_445027 ) ( CLEAR ?auto_445023 ) ( IS-CRATE ?auto_445022 ) ( not ( = ?auto_445023 ?auto_445022 ) ) ( AVAILABLE ?auto_445024 ) ( ON ?auto_445023 ?auto_445021 ) ( not ( = ?auto_445021 ?auto_445023 ) ) ( not ( = ?auto_445021 ?auto_445022 ) ) ( TRUCK-AT ?auto_445028 ?auto_445026 ) ( not ( = ?auto_445026 ?auto_445027 ) ) ( HOIST-AT ?auto_445029 ?auto_445026 ) ( not ( = ?auto_445024 ?auto_445029 ) ) ( AVAILABLE ?auto_445029 ) ( SURFACE-AT ?auto_445022 ?auto_445026 ) ( ON ?auto_445022 ?auto_445025 ) ( CLEAR ?auto_445022 ) ( not ( = ?auto_445023 ?auto_445025 ) ) ( not ( = ?auto_445022 ?auto_445025 ) ) ( not ( = ?auto_445021 ?auto_445025 ) ) ( ON ?auto_445019 ?auto_445018 ) ( ON ?auto_445020 ?auto_445019 ) ( ON ?auto_445017 ?auto_445020 ) ( ON ?auto_445021 ?auto_445017 ) ( not ( = ?auto_445018 ?auto_445019 ) ) ( not ( = ?auto_445018 ?auto_445020 ) ) ( not ( = ?auto_445018 ?auto_445017 ) ) ( not ( = ?auto_445018 ?auto_445021 ) ) ( not ( = ?auto_445018 ?auto_445023 ) ) ( not ( = ?auto_445018 ?auto_445022 ) ) ( not ( = ?auto_445018 ?auto_445025 ) ) ( not ( = ?auto_445019 ?auto_445020 ) ) ( not ( = ?auto_445019 ?auto_445017 ) ) ( not ( = ?auto_445019 ?auto_445021 ) ) ( not ( = ?auto_445019 ?auto_445023 ) ) ( not ( = ?auto_445019 ?auto_445022 ) ) ( not ( = ?auto_445019 ?auto_445025 ) ) ( not ( = ?auto_445020 ?auto_445017 ) ) ( not ( = ?auto_445020 ?auto_445021 ) ) ( not ( = ?auto_445020 ?auto_445023 ) ) ( not ( = ?auto_445020 ?auto_445022 ) ) ( not ( = ?auto_445020 ?auto_445025 ) ) ( not ( = ?auto_445017 ?auto_445021 ) ) ( not ( = ?auto_445017 ?auto_445023 ) ) ( not ( = ?auto_445017 ?auto_445022 ) ) ( not ( = ?auto_445017 ?auto_445025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_445021 ?auto_445023 ?auto_445022 )
      ( MAKE-6CRATE-VERIFY ?auto_445018 ?auto_445019 ?auto_445020 ?auto_445017 ?auto_445021 ?auto_445023 ?auto_445022 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_445082 - SURFACE
      ?auto_445083 - SURFACE
      ?auto_445084 - SURFACE
      ?auto_445081 - SURFACE
      ?auto_445085 - SURFACE
      ?auto_445087 - SURFACE
      ?auto_445086 - SURFACE
    )
    :vars
    (
      ?auto_445089 - HOIST
      ?auto_445091 - PLACE
      ?auto_445088 - PLACE
      ?auto_445090 - HOIST
      ?auto_445093 - SURFACE
      ?auto_445092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_445089 ?auto_445091 ) ( SURFACE-AT ?auto_445087 ?auto_445091 ) ( CLEAR ?auto_445087 ) ( IS-CRATE ?auto_445086 ) ( not ( = ?auto_445087 ?auto_445086 ) ) ( AVAILABLE ?auto_445089 ) ( ON ?auto_445087 ?auto_445085 ) ( not ( = ?auto_445085 ?auto_445087 ) ) ( not ( = ?auto_445085 ?auto_445086 ) ) ( not ( = ?auto_445088 ?auto_445091 ) ) ( HOIST-AT ?auto_445090 ?auto_445088 ) ( not ( = ?auto_445089 ?auto_445090 ) ) ( AVAILABLE ?auto_445090 ) ( SURFACE-AT ?auto_445086 ?auto_445088 ) ( ON ?auto_445086 ?auto_445093 ) ( CLEAR ?auto_445086 ) ( not ( = ?auto_445087 ?auto_445093 ) ) ( not ( = ?auto_445086 ?auto_445093 ) ) ( not ( = ?auto_445085 ?auto_445093 ) ) ( TRUCK-AT ?auto_445092 ?auto_445091 ) ( ON ?auto_445083 ?auto_445082 ) ( ON ?auto_445084 ?auto_445083 ) ( ON ?auto_445081 ?auto_445084 ) ( ON ?auto_445085 ?auto_445081 ) ( not ( = ?auto_445082 ?auto_445083 ) ) ( not ( = ?auto_445082 ?auto_445084 ) ) ( not ( = ?auto_445082 ?auto_445081 ) ) ( not ( = ?auto_445082 ?auto_445085 ) ) ( not ( = ?auto_445082 ?auto_445087 ) ) ( not ( = ?auto_445082 ?auto_445086 ) ) ( not ( = ?auto_445082 ?auto_445093 ) ) ( not ( = ?auto_445083 ?auto_445084 ) ) ( not ( = ?auto_445083 ?auto_445081 ) ) ( not ( = ?auto_445083 ?auto_445085 ) ) ( not ( = ?auto_445083 ?auto_445087 ) ) ( not ( = ?auto_445083 ?auto_445086 ) ) ( not ( = ?auto_445083 ?auto_445093 ) ) ( not ( = ?auto_445084 ?auto_445081 ) ) ( not ( = ?auto_445084 ?auto_445085 ) ) ( not ( = ?auto_445084 ?auto_445087 ) ) ( not ( = ?auto_445084 ?auto_445086 ) ) ( not ( = ?auto_445084 ?auto_445093 ) ) ( not ( = ?auto_445081 ?auto_445085 ) ) ( not ( = ?auto_445081 ?auto_445087 ) ) ( not ( = ?auto_445081 ?auto_445086 ) ) ( not ( = ?auto_445081 ?auto_445093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_445085 ?auto_445087 ?auto_445086 )
      ( MAKE-6CRATE-VERIFY ?auto_445082 ?auto_445083 ?auto_445084 ?auto_445081 ?auto_445085 ?auto_445087 ?auto_445086 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_445146 - SURFACE
      ?auto_445147 - SURFACE
      ?auto_445148 - SURFACE
      ?auto_445145 - SURFACE
      ?auto_445149 - SURFACE
      ?auto_445151 - SURFACE
      ?auto_445150 - SURFACE
    )
    :vars
    (
      ?auto_445154 - HOIST
      ?auto_445152 - PLACE
      ?auto_445157 - PLACE
      ?auto_445155 - HOIST
      ?auto_445153 - SURFACE
      ?auto_445156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_445154 ?auto_445152 ) ( IS-CRATE ?auto_445150 ) ( not ( = ?auto_445151 ?auto_445150 ) ) ( not ( = ?auto_445149 ?auto_445151 ) ) ( not ( = ?auto_445149 ?auto_445150 ) ) ( not ( = ?auto_445157 ?auto_445152 ) ) ( HOIST-AT ?auto_445155 ?auto_445157 ) ( not ( = ?auto_445154 ?auto_445155 ) ) ( AVAILABLE ?auto_445155 ) ( SURFACE-AT ?auto_445150 ?auto_445157 ) ( ON ?auto_445150 ?auto_445153 ) ( CLEAR ?auto_445150 ) ( not ( = ?auto_445151 ?auto_445153 ) ) ( not ( = ?auto_445150 ?auto_445153 ) ) ( not ( = ?auto_445149 ?auto_445153 ) ) ( TRUCK-AT ?auto_445156 ?auto_445152 ) ( SURFACE-AT ?auto_445149 ?auto_445152 ) ( CLEAR ?auto_445149 ) ( LIFTING ?auto_445154 ?auto_445151 ) ( IS-CRATE ?auto_445151 ) ( ON ?auto_445147 ?auto_445146 ) ( ON ?auto_445148 ?auto_445147 ) ( ON ?auto_445145 ?auto_445148 ) ( ON ?auto_445149 ?auto_445145 ) ( not ( = ?auto_445146 ?auto_445147 ) ) ( not ( = ?auto_445146 ?auto_445148 ) ) ( not ( = ?auto_445146 ?auto_445145 ) ) ( not ( = ?auto_445146 ?auto_445149 ) ) ( not ( = ?auto_445146 ?auto_445151 ) ) ( not ( = ?auto_445146 ?auto_445150 ) ) ( not ( = ?auto_445146 ?auto_445153 ) ) ( not ( = ?auto_445147 ?auto_445148 ) ) ( not ( = ?auto_445147 ?auto_445145 ) ) ( not ( = ?auto_445147 ?auto_445149 ) ) ( not ( = ?auto_445147 ?auto_445151 ) ) ( not ( = ?auto_445147 ?auto_445150 ) ) ( not ( = ?auto_445147 ?auto_445153 ) ) ( not ( = ?auto_445148 ?auto_445145 ) ) ( not ( = ?auto_445148 ?auto_445149 ) ) ( not ( = ?auto_445148 ?auto_445151 ) ) ( not ( = ?auto_445148 ?auto_445150 ) ) ( not ( = ?auto_445148 ?auto_445153 ) ) ( not ( = ?auto_445145 ?auto_445149 ) ) ( not ( = ?auto_445145 ?auto_445151 ) ) ( not ( = ?auto_445145 ?auto_445150 ) ) ( not ( = ?auto_445145 ?auto_445153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_445149 ?auto_445151 ?auto_445150 )
      ( MAKE-6CRATE-VERIFY ?auto_445146 ?auto_445147 ?auto_445148 ?auto_445145 ?auto_445149 ?auto_445151 ?auto_445150 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_445210 - SURFACE
      ?auto_445211 - SURFACE
      ?auto_445212 - SURFACE
      ?auto_445209 - SURFACE
      ?auto_445213 - SURFACE
      ?auto_445215 - SURFACE
      ?auto_445214 - SURFACE
    )
    :vars
    (
      ?auto_445216 - HOIST
      ?auto_445221 - PLACE
      ?auto_445219 - PLACE
      ?auto_445218 - HOIST
      ?auto_445220 - SURFACE
      ?auto_445217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_445216 ?auto_445221 ) ( IS-CRATE ?auto_445214 ) ( not ( = ?auto_445215 ?auto_445214 ) ) ( not ( = ?auto_445213 ?auto_445215 ) ) ( not ( = ?auto_445213 ?auto_445214 ) ) ( not ( = ?auto_445219 ?auto_445221 ) ) ( HOIST-AT ?auto_445218 ?auto_445219 ) ( not ( = ?auto_445216 ?auto_445218 ) ) ( AVAILABLE ?auto_445218 ) ( SURFACE-AT ?auto_445214 ?auto_445219 ) ( ON ?auto_445214 ?auto_445220 ) ( CLEAR ?auto_445214 ) ( not ( = ?auto_445215 ?auto_445220 ) ) ( not ( = ?auto_445214 ?auto_445220 ) ) ( not ( = ?auto_445213 ?auto_445220 ) ) ( TRUCK-AT ?auto_445217 ?auto_445221 ) ( SURFACE-AT ?auto_445213 ?auto_445221 ) ( CLEAR ?auto_445213 ) ( IS-CRATE ?auto_445215 ) ( AVAILABLE ?auto_445216 ) ( IN ?auto_445215 ?auto_445217 ) ( ON ?auto_445211 ?auto_445210 ) ( ON ?auto_445212 ?auto_445211 ) ( ON ?auto_445209 ?auto_445212 ) ( ON ?auto_445213 ?auto_445209 ) ( not ( = ?auto_445210 ?auto_445211 ) ) ( not ( = ?auto_445210 ?auto_445212 ) ) ( not ( = ?auto_445210 ?auto_445209 ) ) ( not ( = ?auto_445210 ?auto_445213 ) ) ( not ( = ?auto_445210 ?auto_445215 ) ) ( not ( = ?auto_445210 ?auto_445214 ) ) ( not ( = ?auto_445210 ?auto_445220 ) ) ( not ( = ?auto_445211 ?auto_445212 ) ) ( not ( = ?auto_445211 ?auto_445209 ) ) ( not ( = ?auto_445211 ?auto_445213 ) ) ( not ( = ?auto_445211 ?auto_445215 ) ) ( not ( = ?auto_445211 ?auto_445214 ) ) ( not ( = ?auto_445211 ?auto_445220 ) ) ( not ( = ?auto_445212 ?auto_445209 ) ) ( not ( = ?auto_445212 ?auto_445213 ) ) ( not ( = ?auto_445212 ?auto_445215 ) ) ( not ( = ?auto_445212 ?auto_445214 ) ) ( not ( = ?auto_445212 ?auto_445220 ) ) ( not ( = ?auto_445209 ?auto_445213 ) ) ( not ( = ?auto_445209 ?auto_445215 ) ) ( not ( = ?auto_445209 ?auto_445214 ) ) ( not ( = ?auto_445209 ?auto_445220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_445213 ?auto_445215 ?auto_445214 )
      ( MAKE-6CRATE-VERIFY ?auto_445210 ?auto_445211 ?auto_445212 ?auto_445209 ?auto_445213 ?auto_445215 ?auto_445214 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447166 - SURFACE
      ?auto_447167 - SURFACE
      ?auto_447168 - SURFACE
      ?auto_447165 - SURFACE
      ?auto_447169 - SURFACE
      ?auto_447171 - SURFACE
      ?auto_447170 - SURFACE
      ?auto_447172 - SURFACE
    )
    :vars
    (
      ?auto_447173 - HOIST
      ?auto_447174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_447173 ?auto_447174 ) ( SURFACE-AT ?auto_447170 ?auto_447174 ) ( CLEAR ?auto_447170 ) ( LIFTING ?auto_447173 ?auto_447172 ) ( IS-CRATE ?auto_447172 ) ( not ( = ?auto_447170 ?auto_447172 ) ) ( ON ?auto_447167 ?auto_447166 ) ( ON ?auto_447168 ?auto_447167 ) ( ON ?auto_447165 ?auto_447168 ) ( ON ?auto_447169 ?auto_447165 ) ( ON ?auto_447171 ?auto_447169 ) ( ON ?auto_447170 ?auto_447171 ) ( not ( = ?auto_447166 ?auto_447167 ) ) ( not ( = ?auto_447166 ?auto_447168 ) ) ( not ( = ?auto_447166 ?auto_447165 ) ) ( not ( = ?auto_447166 ?auto_447169 ) ) ( not ( = ?auto_447166 ?auto_447171 ) ) ( not ( = ?auto_447166 ?auto_447170 ) ) ( not ( = ?auto_447166 ?auto_447172 ) ) ( not ( = ?auto_447167 ?auto_447168 ) ) ( not ( = ?auto_447167 ?auto_447165 ) ) ( not ( = ?auto_447167 ?auto_447169 ) ) ( not ( = ?auto_447167 ?auto_447171 ) ) ( not ( = ?auto_447167 ?auto_447170 ) ) ( not ( = ?auto_447167 ?auto_447172 ) ) ( not ( = ?auto_447168 ?auto_447165 ) ) ( not ( = ?auto_447168 ?auto_447169 ) ) ( not ( = ?auto_447168 ?auto_447171 ) ) ( not ( = ?auto_447168 ?auto_447170 ) ) ( not ( = ?auto_447168 ?auto_447172 ) ) ( not ( = ?auto_447165 ?auto_447169 ) ) ( not ( = ?auto_447165 ?auto_447171 ) ) ( not ( = ?auto_447165 ?auto_447170 ) ) ( not ( = ?auto_447165 ?auto_447172 ) ) ( not ( = ?auto_447169 ?auto_447171 ) ) ( not ( = ?auto_447169 ?auto_447170 ) ) ( not ( = ?auto_447169 ?auto_447172 ) ) ( not ( = ?auto_447171 ?auto_447170 ) ) ( not ( = ?auto_447171 ?auto_447172 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_447170 ?auto_447172 )
      ( MAKE-7CRATE-VERIFY ?auto_447166 ?auto_447167 ?auto_447168 ?auto_447165 ?auto_447169 ?auto_447171 ?auto_447170 ?auto_447172 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447221 - SURFACE
      ?auto_447222 - SURFACE
      ?auto_447223 - SURFACE
      ?auto_447220 - SURFACE
      ?auto_447224 - SURFACE
      ?auto_447226 - SURFACE
      ?auto_447225 - SURFACE
      ?auto_447227 - SURFACE
    )
    :vars
    (
      ?auto_447230 - HOIST
      ?auto_447229 - PLACE
      ?auto_447228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447230 ?auto_447229 ) ( SURFACE-AT ?auto_447225 ?auto_447229 ) ( CLEAR ?auto_447225 ) ( IS-CRATE ?auto_447227 ) ( not ( = ?auto_447225 ?auto_447227 ) ) ( TRUCK-AT ?auto_447228 ?auto_447229 ) ( AVAILABLE ?auto_447230 ) ( IN ?auto_447227 ?auto_447228 ) ( ON ?auto_447225 ?auto_447226 ) ( not ( = ?auto_447226 ?auto_447225 ) ) ( not ( = ?auto_447226 ?auto_447227 ) ) ( ON ?auto_447222 ?auto_447221 ) ( ON ?auto_447223 ?auto_447222 ) ( ON ?auto_447220 ?auto_447223 ) ( ON ?auto_447224 ?auto_447220 ) ( ON ?auto_447226 ?auto_447224 ) ( not ( = ?auto_447221 ?auto_447222 ) ) ( not ( = ?auto_447221 ?auto_447223 ) ) ( not ( = ?auto_447221 ?auto_447220 ) ) ( not ( = ?auto_447221 ?auto_447224 ) ) ( not ( = ?auto_447221 ?auto_447226 ) ) ( not ( = ?auto_447221 ?auto_447225 ) ) ( not ( = ?auto_447221 ?auto_447227 ) ) ( not ( = ?auto_447222 ?auto_447223 ) ) ( not ( = ?auto_447222 ?auto_447220 ) ) ( not ( = ?auto_447222 ?auto_447224 ) ) ( not ( = ?auto_447222 ?auto_447226 ) ) ( not ( = ?auto_447222 ?auto_447225 ) ) ( not ( = ?auto_447222 ?auto_447227 ) ) ( not ( = ?auto_447223 ?auto_447220 ) ) ( not ( = ?auto_447223 ?auto_447224 ) ) ( not ( = ?auto_447223 ?auto_447226 ) ) ( not ( = ?auto_447223 ?auto_447225 ) ) ( not ( = ?auto_447223 ?auto_447227 ) ) ( not ( = ?auto_447220 ?auto_447224 ) ) ( not ( = ?auto_447220 ?auto_447226 ) ) ( not ( = ?auto_447220 ?auto_447225 ) ) ( not ( = ?auto_447220 ?auto_447227 ) ) ( not ( = ?auto_447224 ?auto_447226 ) ) ( not ( = ?auto_447224 ?auto_447225 ) ) ( not ( = ?auto_447224 ?auto_447227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447226 ?auto_447225 ?auto_447227 )
      ( MAKE-7CRATE-VERIFY ?auto_447221 ?auto_447222 ?auto_447223 ?auto_447220 ?auto_447224 ?auto_447226 ?auto_447225 ?auto_447227 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447284 - SURFACE
      ?auto_447285 - SURFACE
      ?auto_447286 - SURFACE
      ?auto_447283 - SURFACE
      ?auto_447287 - SURFACE
      ?auto_447289 - SURFACE
      ?auto_447288 - SURFACE
      ?auto_447290 - SURFACE
    )
    :vars
    (
      ?auto_447294 - HOIST
      ?auto_447291 - PLACE
      ?auto_447292 - TRUCK
      ?auto_447293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_447294 ?auto_447291 ) ( SURFACE-AT ?auto_447288 ?auto_447291 ) ( CLEAR ?auto_447288 ) ( IS-CRATE ?auto_447290 ) ( not ( = ?auto_447288 ?auto_447290 ) ) ( AVAILABLE ?auto_447294 ) ( IN ?auto_447290 ?auto_447292 ) ( ON ?auto_447288 ?auto_447289 ) ( not ( = ?auto_447289 ?auto_447288 ) ) ( not ( = ?auto_447289 ?auto_447290 ) ) ( TRUCK-AT ?auto_447292 ?auto_447293 ) ( not ( = ?auto_447293 ?auto_447291 ) ) ( ON ?auto_447285 ?auto_447284 ) ( ON ?auto_447286 ?auto_447285 ) ( ON ?auto_447283 ?auto_447286 ) ( ON ?auto_447287 ?auto_447283 ) ( ON ?auto_447289 ?auto_447287 ) ( not ( = ?auto_447284 ?auto_447285 ) ) ( not ( = ?auto_447284 ?auto_447286 ) ) ( not ( = ?auto_447284 ?auto_447283 ) ) ( not ( = ?auto_447284 ?auto_447287 ) ) ( not ( = ?auto_447284 ?auto_447289 ) ) ( not ( = ?auto_447284 ?auto_447288 ) ) ( not ( = ?auto_447284 ?auto_447290 ) ) ( not ( = ?auto_447285 ?auto_447286 ) ) ( not ( = ?auto_447285 ?auto_447283 ) ) ( not ( = ?auto_447285 ?auto_447287 ) ) ( not ( = ?auto_447285 ?auto_447289 ) ) ( not ( = ?auto_447285 ?auto_447288 ) ) ( not ( = ?auto_447285 ?auto_447290 ) ) ( not ( = ?auto_447286 ?auto_447283 ) ) ( not ( = ?auto_447286 ?auto_447287 ) ) ( not ( = ?auto_447286 ?auto_447289 ) ) ( not ( = ?auto_447286 ?auto_447288 ) ) ( not ( = ?auto_447286 ?auto_447290 ) ) ( not ( = ?auto_447283 ?auto_447287 ) ) ( not ( = ?auto_447283 ?auto_447289 ) ) ( not ( = ?auto_447283 ?auto_447288 ) ) ( not ( = ?auto_447283 ?auto_447290 ) ) ( not ( = ?auto_447287 ?auto_447289 ) ) ( not ( = ?auto_447287 ?auto_447288 ) ) ( not ( = ?auto_447287 ?auto_447290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447289 ?auto_447288 ?auto_447290 )
      ( MAKE-7CRATE-VERIFY ?auto_447284 ?auto_447285 ?auto_447286 ?auto_447283 ?auto_447287 ?auto_447289 ?auto_447288 ?auto_447290 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447354 - SURFACE
      ?auto_447355 - SURFACE
      ?auto_447356 - SURFACE
      ?auto_447353 - SURFACE
      ?auto_447357 - SURFACE
      ?auto_447359 - SURFACE
      ?auto_447358 - SURFACE
      ?auto_447360 - SURFACE
    )
    :vars
    (
      ?auto_447362 - HOIST
      ?auto_447364 - PLACE
      ?auto_447361 - TRUCK
      ?auto_447365 - PLACE
      ?auto_447363 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_447362 ?auto_447364 ) ( SURFACE-AT ?auto_447358 ?auto_447364 ) ( CLEAR ?auto_447358 ) ( IS-CRATE ?auto_447360 ) ( not ( = ?auto_447358 ?auto_447360 ) ) ( AVAILABLE ?auto_447362 ) ( ON ?auto_447358 ?auto_447359 ) ( not ( = ?auto_447359 ?auto_447358 ) ) ( not ( = ?auto_447359 ?auto_447360 ) ) ( TRUCK-AT ?auto_447361 ?auto_447365 ) ( not ( = ?auto_447365 ?auto_447364 ) ) ( HOIST-AT ?auto_447363 ?auto_447365 ) ( LIFTING ?auto_447363 ?auto_447360 ) ( not ( = ?auto_447362 ?auto_447363 ) ) ( ON ?auto_447355 ?auto_447354 ) ( ON ?auto_447356 ?auto_447355 ) ( ON ?auto_447353 ?auto_447356 ) ( ON ?auto_447357 ?auto_447353 ) ( ON ?auto_447359 ?auto_447357 ) ( not ( = ?auto_447354 ?auto_447355 ) ) ( not ( = ?auto_447354 ?auto_447356 ) ) ( not ( = ?auto_447354 ?auto_447353 ) ) ( not ( = ?auto_447354 ?auto_447357 ) ) ( not ( = ?auto_447354 ?auto_447359 ) ) ( not ( = ?auto_447354 ?auto_447358 ) ) ( not ( = ?auto_447354 ?auto_447360 ) ) ( not ( = ?auto_447355 ?auto_447356 ) ) ( not ( = ?auto_447355 ?auto_447353 ) ) ( not ( = ?auto_447355 ?auto_447357 ) ) ( not ( = ?auto_447355 ?auto_447359 ) ) ( not ( = ?auto_447355 ?auto_447358 ) ) ( not ( = ?auto_447355 ?auto_447360 ) ) ( not ( = ?auto_447356 ?auto_447353 ) ) ( not ( = ?auto_447356 ?auto_447357 ) ) ( not ( = ?auto_447356 ?auto_447359 ) ) ( not ( = ?auto_447356 ?auto_447358 ) ) ( not ( = ?auto_447356 ?auto_447360 ) ) ( not ( = ?auto_447353 ?auto_447357 ) ) ( not ( = ?auto_447353 ?auto_447359 ) ) ( not ( = ?auto_447353 ?auto_447358 ) ) ( not ( = ?auto_447353 ?auto_447360 ) ) ( not ( = ?auto_447357 ?auto_447359 ) ) ( not ( = ?auto_447357 ?auto_447358 ) ) ( not ( = ?auto_447357 ?auto_447360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447359 ?auto_447358 ?auto_447360 )
      ( MAKE-7CRATE-VERIFY ?auto_447354 ?auto_447355 ?auto_447356 ?auto_447353 ?auto_447357 ?auto_447359 ?auto_447358 ?auto_447360 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447431 - SURFACE
      ?auto_447432 - SURFACE
      ?auto_447433 - SURFACE
      ?auto_447430 - SURFACE
      ?auto_447434 - SURFACE
      ?auto_447436 - SURFACE
      ?auto_447435 - SURFACE
      ?auto_447437 - SURFACE
    )
    :vars
    (
      ?auto_447443 - HOIST
      ?auto_447442 - PLACE
      ?auto_447440 - TRUCK
      ?auto_447441 - PLACE
      ?auto_447439 - HOIST
      ?auto_447438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_447443 ?auto_447442 ) ( SURFACE-AT ?auto_447435 ?auto_447442 ) ( CLEAR ?auto_447435 ) ( IS-CRATE ?auto_447437 ) ( not ( = ?auto_447435 ?auto_447437 ) ) ( AVAILABLE ?auto_447443 ) ( ON ?auto_447435 ?auto_447436 ) ( not ( = ?auto_447436 ?auto_447435 ) ) ( not ( = ?auto_447436 ?auto_447437 ) ) ( TRUCK-AT ?auto_447440 ?auto_447441 ) ( not ( = ?auto_447441 ?auto_447442 ) ) ( HOIST-AT ?auto_447439 ?auto_447441 ) ( not ( = ?auto_447443 ?auto_447439 ) ) ( AVAILABLE ?auto_447439 ) ( SURFACE-AT ?auto_447437 ?auto_447441 ) ( ON ?auto_447437 ?auto_447438 ) ( CLEAR ?auto_447437 ) ( not ( = ?auto_447435 ?auto_447438 ) ) ( not ( = ?auto_447437 ?auto_447438 ) ) ( not ( = ?auto_447436 ?auto_447438 ) ) ( ON ?auto_447432 ?auto_447431 ) ( ON ?auto_447433 ?auto_447432 ) ( ON ?auto_447430 ?auto_447433 ) ( ON ?auto_447434 ?auto_447430 ) ( ON ?auto_447436 ?auto_447434 ) ( not ( = ?auto_447431 ?auto_447432 ) ) ( not ( = ?auto_447431 ?auto_447433 ) ) ( not ( = ?auto_447431 ?auto_447430 ) ) ( not ( = ?auto_447431 ?auto_447434 ) ) ( not ( = ?auto_447431 ?auto_447436 ) ) ( not ( = ?auto_447431 ?auto_447435 ) ) ( not ( = ?auto_447431 ?auto_447437 ) ) ( not ( = ?auto_447431 ?auto_447438 ) ) ( not ( = ?auto_447432 ?auto_447433 ) ) ( not ( = ?auto_447432 ?auto_447430 ) ) ( not ( = ?auto_447432 ?auto_447434 ) ) ( not ( = ?auto_447432 ?auto_447436 ) ) ( not ( = ?auto_447432 ?auto_447435 ) ) ( not ( = ?auto_447432 ?auto_447437 ) ) ( not ( = ?auto_447432 ?auto_447438 ) ) ( not ( = ?auto_447433 ?auto_447430 ) ) ( not ( = ?auto_447433 ?auto_447434 ) ) ( not ( = ?auto_447433 ?auto_447436 ) ) ( not ( = ?auto_447433 ?auto_447435 ) ) ( not ( = ?auto_447433 ?auto_447437 ) ) ( not ( = ?auto_447433 ?auto_447438 ) ) ( not ( = ?auto_447430 ?auto_447434 ) ) ( not ( = ?auto_447430 ?auto_447436 ) ) ( not ( = ?auto_447430 ?auto_447435 ) ) ( not ( = ?auto_447430 ?auto_447437 ) ) ( not ( = ?auto_447430 ?auto_447438 ) ) ( not ( = ?auto_447434 ?auto_447436 ) ) ( not ( = ?auto_447434 ?auto_447435 ) ) ( not ( = ?auto_447434 ?auto_447437 ) ) ( not ( = ?auto_447434 ?auto_447438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447436 ?auto_447435 ?auto_447437 )
      ( MAKE-7CRATE-VERIFY ?auto_447431 ?auto_447432 ?auto_447433 ?auto_447430 ?auto_447434 ?auto_447436 ?auto_447435 ?auto_447437 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447509 - SURFACE
      ?auto_447510 - SURFACE
      ?auto_447511 - SURFACE
      ?auto_447508 - SURFACE
      ?auto_447512 - SURFACE
      ?auto_447514 - SURFACE
      ?auto_447513 - SURFACE
      ?auto_447515 - SURFACE
    )
    :vars
    (
      ?auto_447519 - HOIST
      ?auto_447521 - PLACE
      ?auto_447520 - PLACE
      ?auto_447516 - HOIST
      ?auto_447518 - SURFACE
      ?auto_447517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447519 ?auto_447521 ) ( SURFACE-AT ?auto_447513 ?auto_447521 ) ( CLEAR ?auto_447513 ) ( IS-CRATE ?auto_447515 ) ( not ( = ?auto_447513 ?auto_447515 ) ) ( AVAILABLE ?auto_447519 ) ( ON ?auto_447513 ?auto_447514 ) ( not ( = ?auto_447514 ?auto_447513 ) ) ( not ( = ?auto_447514 ?auto_447515 ) ) ( not ( = ?auto_447520 ?auto_447521 ) ) ( HOIST-AT ?auto_447516 ?auto_447520 ) ( not ( = ?auto_447519 ?auto_447516 ) ) ( AVAILABLE ?auto_447516 ) ( SURFACE-AT ?auto_447515 ?auto_447520 ) ( ON ?auto_447515 ?auto_447518 ) ( CLEAR ?auto_447515 ) ( not ( = ?auto_447513 ?auto_447518 ) ) ( not ( = ?auto_447515 ?auto_447518 ) ) ( not ( = ?auto_447514 ?auto_447518 ) ) ( TRUCK-AT ?auto_447517 ?auto_447521 ) ( ON ?auto_447510 ?auto_447509 ) ( ON ?auto_447511 ?auto_447510 ) ( ON ?auto_447508 ?auto_447511 ) ( ON ?auto_447512 ?auto_447508 ) ( ON ?auto_447514 ?auto_447512 ) ( not ( = ?auto_447509 ?auto_447510 ) ) ( not ( = ?auto_447509 ?auto_447511 ) ) ( not ( = ?auto_447509 ?auto_447508 ) ) ( not ( = ?auto_447509 ?auto_447512 ) ) ( not ( = ?auto_447509 ?auto_447514 ) ) ( not ( = ?auto_447509 ?auto_447513 ) ) ( not ( = ?auto_447509 ?auto_447515 ) ) ( not ( = ?auto_447509 ?auto_447518 ) ) ( not ( = ?auto_447510 ?auto_447511 ) ) ( not ( = ?auto_447510 ?auto_447508 ) ) ( not ( = ?auto_447510 ?auto_447512 ) ) ( not ( = ?auto_447510 ?auto_447514 ) ) ( not ( = ?auto_447510 ?auto_447513 ) ) ( not ( = ?auto_447510 ?auto_447515 ) ) ( not ( = ?auto_447510 ?auto_447518 ) ) ( not ( = ?auto_447511 ?auto_447508 ) ) ( not ( = ?auto_447511 ?auto_447512 ) ) ( not ( = ?auto_447511 ?auto_447514 ) ) ( not ( = ?auto_447511 ?auto_447513 ) ) ( not ( = ?auto_447511 ?auto_447515 ) ) ( not ( = ?auto_447511 ?auto_447518 ) ) ( not ( = ?auto_447508 ?auto_447512 ) ) ( not ( = ?auto_447508 ?auto_447514 ) ) ( not ( = ?auto_447508 ?auto_447513 ) ) ( not ( = ?auto_447508 ?auto_447515 ) ) ( not ( = ?auto_447508 ?auto_447518 ) ) ( not ( = ?auto_447512 ?auto_447514 ) ) ( not ( = ?auto_447512 ?auto_447513 ) ) ( not ( = ?auto_447512 ?auto_447515 ) ) ( not ( = ?auto_447512 ?auto_447518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447514 ?auto_447513 ?auto_447515 )
      ( MAKE-7CRATE-VERIFY ?auto_447509 ?auto_447510 ?auto_447511 ?auto_447508 ?auto_447512 ?auto_447514 ?auto_447513 ?auto_447515 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447587 - SURFACE
      ?auto_447588 - SURFACE
      ?auto_447589 - SURFACE
      ?auto_447586 - SURFACE
      ?auto_447590 - SURFACE
      ?auto_447592 - SURFACE
      ?auto_447591 - SURFACE
      ?auto_447593 - SURFACE
    )
    :vars
    (
      ?auto_447597 - HOIST
      ?auto_447594 - PLACE
      ?auto_447599 - PLACE
      ?auto_447595 - HOIST
      ?auto_447596 - SURFACE
      ?auto_447598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447597 ?auto_447594 ) ( IS-CRATE ?auto_447593 ) ( not ( = ?auto_447591 ?auto_447593 ) ) ( not ( = ?auto_447592 ?auto_447591 ) ) ( not ( = ?auto_447592 ?auto_447593 ) ) ( not ( = ?auto_447599 ?auto_447594 ) ) ( HOIST-AT ?auto_447595 ?auto_447599 ) ( not ( = ?auto_447597 ?auto_447595 ) ) ( AVAILABLE ?auto_447595 ) ( SURFACE-AT ?auto_447593 ?auto_447599 ) ( ON ?auto_447593 ?auto_447596 ) ( CLEAR ?auto_447593 ) ( not ( = ?auto_447591 ?auto_447596 ) ) ( not ( = ?auto_447593 ?auto_447596 ) ) ( not ( = ?auto_447592 ?auto_447596 ) ) ( TRUCK-AT ?auto_447598 ?auto_447594 ) ( SURFACE-AT ?auto_447592 ?auto_447594 ) ( CLEAR ?auto_447592 ) ( LIFTING ?auto_447597 ?auto_447591 ) ( IS-CRATE ?auto_447591 ) ( ON ?auto_447588 ?auto_447587 ) ( ON ?auto_447589 ?auto_447588 ) ( ON ?auto_447586 ?auto_447589 ) ( ON ?auto_447590 ?auto_447586 ) ( ON ?auto_447592 ?auto_447590 ) ( not ( = ?auto_447587 ?auto_447588 ) ) ( not ( = ?auto_447587 ?auto_447589 ) ) ( not ( = ?auto_447587 ?auto_447586 ) ) ( not ( = ?auto_447587 ?auto_447590 ) ) ( not ( = ?auto_447587 ?auto_447592 ) ) ( not ( = ?auto_447587 ?auto_447591 ) ) ( not ( = ?auto_447587 ?auto_447593 ) ) ( not ( = ?auto_447587 ?auto_447596 ) ) ( not ( = ?auto_447588 ?auto_447589 ) ) ( not ( = ?auto_447588 ?auto_447586 ) ) ( not ( = ?auto_447588 ?auto_447590 ) ) ( not ( = ?auto_447588 ?auto_447592 ) ) ( not ( = ?auto_447588 ?auto_447591 ) ) ( not ( = ?auto_447588 ?auto_447593 ) ) ( not ( = ?auto_447588 ?auto_447596 ) ) ( not ( = ?auto_447589 ?auto_447586 ) ) ( not ( = ?auto_447589 ?auto_447590 ) ) ( not ( = ?auto_447589 ?auto_447592 ) ) ( not ( = ?auto_447589 ?auto_447591 ) ) ( not ( = ?auto_447589 ?auto_447593 ) ) ( not ( = ?auto_447589 ?auto_447596 ) ) ( not ( = ?auto_447586 ?auto_447590 ) ) ( not ( = ?auto_447586 ?auto_447592 ) ) ( not ( = ?auto_447586 ?auto_447591 ) ) ( not ( = ?auto_447586 ?auto_447593 ) ) ( not ( = ?auto_447586 ?auto_447596 ) ) ( not ( = ?auto_447590 ?auto_447592 ) ) ( not ( = ?auto_447590 ?auto_447591 ) ) ( not ( = ?auto_447590 ?auto_447593 ) ) ( not ( = ?auto_447590 ?auto_447596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447592 ?auto_447591 ?auto_447593 )
      ( MAKE-7CRATE-VERIFY ?auto_447587 ?auto_447588 ?auto_447589 ?auto_447586 ?auto_447590 ?auto_447592 ?auto_447591 ?auto_447593 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_447665 - SURFACE
      ?auto_447666 - SURFACE
      ?auto_447667 - SURFACE
      ?auto_447664 - SURFACE
      ?auto_447668 - SURFACE
      ?auto_447670 - SURFACE
      ?auto_447669 - SURFACE
      ?auto_447671 - SURFACE
    )
    :vars
    (
      ?auto_447674 - HOIST
      ?auto_447673 - PLACE
      ?auto_447677 - PLACE
      ?auto_447672 - HOIST
      ?auto_447675 - SURFACE
      ?auto_447676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447674 ?auto_447673 ) ( IS-CRATE ?auto_447671 ) ( not ( = ?auto_447669 ?auto_447671 ) ) ( not ( = ?auto_447670 ?auto_447669 ) ) ( not ( = ?auto_447670 ?auto_447671 ) ) ( not ( = ?auto_447677 ?auto_447673 ) ) ( HOIST-AT ?auto_447672 ?auto_447677 ) ( not ( = ?auto_447674 ?auto_447672 ) ) ( AVAILABLE ?auto_447672 ) ( SURFACE-AT ?auto_447671 ?auto_447677 ) ( ON ?auto_447671 ?auto_447675 ) ( CLEAR ?auto_447671 ) ( not ( = ?auto_447669 ?auto_447675 ) ) ( not ( = ?auto_447671 ?auto_447675 ) ) ( not ( = ?auto_447670 ?auto_447675 ) ) ( TRUCK-AT ?auto_447676 ?auto_447673 ) ( SURFACE-AT ?auto_447670 ?auto_447673 ) ( CLEAR ?auto_447670 ) ( IS-CRATE ?auto_447669 ) ( AVAILABLE ?auto_447674 ) ( IN ?auto_447669 ?auto_447676 ) ( ON ?auto_447666 ?auto_447665 ) ( ON ?auto_447667 ?auto_447666 ) ( ON ?auto_447664 ?auto_447667 ) ( ON ?auto_447668 ?auto_447664 ) ( ON ?auto_447670 ?auto_447668 ) ( not ( = ?auto_447665 ?auto_447666 ) ) ( not ( = ?auto_447665 ?auto_447667 ) ) ( not ( = ?auto_447665 ?auto_447664 ) ) ( not ( = ?auto_447665 ?auto_447668 ) ) ( not ( = ?auto_447665 ?auto_447670 ) ) ( not ( = ?auto_447665 ?auto_447669 ) ) ( not ( = ?auto_447665 ?auto_447671 ) ) ( not ( = ?auto_447665 ?auto_447675 ) ) ( not ( = ?auto_447666 ?auto_447667 ) ) ( not ( = ?auto_447666 ?auto_447664 ) ) ( not ( = ?auto_447666 ?auto_447668 ) ) ( not ( = ?auto_447666 ?auto_447670 ) ) ( not ( = ?auto_447666 ?auto_447669 ) ) ( not ( = ?auto_447666 ?auto_447671 ) ) ( not ( = ?auto_447666 ?auto_447675 ) ) ( not ( = ?auto_447667 ?auto_447664 ) ) ( not ( = ?auto_447667 ?auto_447668 ) ) ( not ( = ?auto_447667 ?auto_447670 ) ) ( not ( = ?auto_447667 ?auto_447669 ) ) ( not ( = ?auto_447667 ?auto_447671 ) ) ( not ( = ?auto_447667 ?auto_447675 ) ) ( not ( = ?auto_447664 ?auto_447668 ) ) ( not ( = ?auto_447664 ?auto_447670 ) ) ( not ( = ?auto_447664 ?auto_447669 ) ) ( not ( = ?auto_447664 ?auto_447671 ) ) ( not ( = ?auto_447664 ?auto_447675 ) ) ( not ( = ?auto_447668 ?auto_447670 ) ) ( not ( = ?auto_447668 ?auto_447669 ) ) ( not ( = ?auto_447668 ?auto_447671 ) ) ( not ( = ?auto_447668 ?auto_447675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_447670 ?auto_447669 ?auto_447671 )
      ( MAKE-7CRATE-VERIFY ?auto_447665 ?auto_447666 ?auto_447667 ?auto_447664 ?auto_447668 ?auto_447670 ?auto_447669 ?auto_447671 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450584 - SURFACE
      ?auto_450585 - SURFACE
      ?auto_450586 - SURFACE
      ?auto_450583 - SURFACE
      ?auto_450587 - SURFACE
      ?auto_450589 - SURFACE
      ?auto_450588 - SURFACE
      ?auto_450590 - SURFACE
      ?auto_450591 - SURFACE
    )
    :vars
    (
      ?auto_450592 - HOIST
      ?auto_450593 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_450592 ?auto_450593 ) ( SURFACE-AT ?auto_450590 ?auto_450593 ) ( CLEAR ?auto_450590 ) ( LIFTING ?auto_450592 ?auto_450591 ) ( IS-CRATE ?auto_450591 ) ( not ( = ?auto_450590 ?auto_450591 ) ) ( ON ?auto_450585 ?auto_450584 ) ( ON ?auto_450586 ?auto_450585 ) ( ON ?auto_450583 ?auto_450586 ) ( ON ?auto_450587 ?auto_450583 ) ( ON ?auto_450589 ?auto_450587 ) ( ON ?auto_450588 ?auto_450589 ) ( ON ?auto_450590 ?auto_450588 ) ( not ( = ?auto_450584 ?auto_450585 ) ) ( not ( = ?auto_450584 ?auto_450586 ) ) ( not ( = ?auto_450584 ?auto_450583 ) ) ( not ( = ?auto_450584 ?auto_450587 ) ) ( not ( = ?auto_450584 ?auto_450589 ) ) ( not ( = ?auto_450584 ?auto_450588 ) ) ( not ( = ?auto_450584 ?auto_450590 ) ) ( not ( = ?auto_450584 ?auto_450591 ) ) ( not ( = ?auto_450585 ?auto_450586 ) ) ( not ( = ?auto_450585 ?auto_450583 ) ) ( not ( = ?auto_450585 ?auto_450587 ) ) ( not ( = ?auto_450585 ?auto_450589 ) ) ( not ( = ?auto_450585 ?auto_450588 ) ) ( not ( = ?auto_450585 ?auto_450590 ) ) ( not ( = ?auto_450585 ?auto_450591 ) ) ( not ( = ?auto_450586 ?auto_450583 ) ) ( not ( = ?auto_450586 ?auto_450587 ) ) ( not ( = ?auto_450586 ?auto_450589 ) ) ( not ( = ?auto_450586 ?auto_450588 ) ) ( not ( = ?auto_450586 ?auto_450590 ) ) ( not ( = ?auto_450586 ?auto_450591 ) ) ( not ( = ?auto_450583 ?auto_450587 ) ) ( not ( = ?auto_450583 ?auto_450589 ) ) ( not ( = ?auto_450583 ?auto_450588 ) ) ( not ( = ?auto_450583 ?auto_450590 ) ) ( not ( = ?auto_450583 ?auto_450591 ) ) ( not ( = ?auto_450587 ?auto_450589 ) ) ( not ( = ?auto_450587 ?auto_450588 ) ) ( not ( = ?auto_450587 ?auto_450590 ) ) ( not ( = ?auto_450587 ?auto_450591 ) ) ( not ( = ?auto_450589 ?auto_450588 ) ) ( not ( = ?auto_450589 ?auto_450590 ) ) ( not ( = ?auto_450589 ?auto_450591 ) ) ( not ( = ?auto_450588 ?auto_450590 ) ) ( not ( = ?auto_450588 ?auto_450591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_450590 ?auto_450591 )
      ( MAKE-8CRATE-VERIFY ?auto_450584 ?auto_450585 ?auto_450586 ?auto_450583 ?auto_450587 ?auto_450589 ?auto_450588 ?auto_450590 ?auto_450591 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450651 - SURFACE
      ?auto_450652 - SURFACE
      ?auto_450653 - SURFACE
      ?auto_450650 - SURFACE
      ?auto_450654 - SURFACE
      ?auto_450656 - SURFACE
      ?auto_450655 - SURFACE
      ?auto_450657 - SURFACE
      ?auto_450658 - SURFACE
    )
    :vars
    (
      ?auto_450660 - HOIST
      ?auto_450661 - PLACE
      ?auto_450659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450660 ?auto_450661 ) ( SURFACE-AT ?auto_450657 ?auto_450661 ) ( CLEAR ?auto_450657 ) ( IS-CRATE ?auto_450658 ) ( not ( = ?auto_450657 ?auto_450658 ) ) ( TRUCK-AT ?auto_450659 ?auto_450661 ) ( AVAILABLE ?auto_450660 ) ( IN ?auto_450658 ?auto_450659 ) ( ON ?auto_450657 ?auto_450655 ) ( not ( = ?auto_450655 ?auto_450657 ) ) ( not ( = ?auto_450655 ?auto_450658 ) ) ( ON ?auto_450652 ?auto_450651 ) ( ON ?auto_450653 ?auto_450652 ) ( ON ?auto_450650 ?auto_450653 ) ( ON ?auto_450654 ?auto_450650 ) ( ON ?auto_450656 ?auto_450654 ) ( ON ?auto_450655 ?auto_450656 ) ( not ( = ?auto_450651 ?auto_450652 ) ) ( not ( = ?auto_450651 ?auto_450653 ) ) ( not ( = ?auto_450651 ?auto_450650 ) ) ( not ( = ?auto_450651 ?auto_450654 ) ) ( not ( = ?auto_450651 ?auto_450656 ) ) ( not ( = ?auto_450651 ?auto_450655 ) ) ( not ( = ?auto_450651 ?auto_450657 ) ) ( not ( = ?auto_450651 ?auto_450658 ) ) ( not ( = ?auto_450652 ?auto_450653 ) ) ( not ( = ?auto_450652 ?auto_450650 ) ) ( not ( = ?auto_450652 ?auto_450654 ) ) ( not ( = ?auto_450652 ?auto_450656 ) ) ( not ( = ?auto_450652 ?auto_450655 ) ) ( not ( = ?auto_450652 ?auto_450657 ) ) ( not ( = ?auto_450652 ?auto_450658 ) ) ( not ( = ?auto_450653 ?auto_450650 ) ) ( not ( = ?auto_450653 ?auto_450654 ) ) ( not ( = ?auto_450653 ?auto_450656 ) ) ( not ( = ?auto_450653 ?auto_450655 ) ) ( not ( = ?auto_450653 ?auto_450657 ) ) ( not ( = ?auto_450653 ?auto_450658 ) ) ( not ( = ?auto_450650 ?auto_450654 ) ) ( not ( = ?auto_450650 ?auto_450656 ) ) ( not ( = ?auto_450650 ?auto_450655 ) ) ( not ( = ?auto_450650 ?auto_450657 ) ) ( not ( = ?auto_450650 ?auto_450658 ) ) ( not ( = ?auto_450654 ?auto_450656 ) ) ( not ( = ?auto_450654 ?auto_450655 ) ) ( not ( = ?auto_450654 ?auto_450657 ) ) ( not ( = ?auto_450654 ?auto_450658 ) ) ( not ( = ?auto_450656 ?auto_450655 ) ) ( not ( = ?auto_450656 ?auto_450657 ) ) ( not ( = ?auto_450656 ?auto_450658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450655 ?auto_450657 ?auto_450658 )
      ( MAKE-8CRATE-VERIFY ?auto_450651 ?auto_450652 ?auto_450653 ?auto_450650 ?auto_450654 ?auto_450656 ?auto_450655 ?auto_450657 ?auto_450658 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450727 - SURFACE
      ?auto_450728 - SURFACE
      ?auto_450729 - SURFACE
      ?auto_450726 - SURFACE
      ?auto_450730 - SURFACE
      ?auto_450732 - SURFACE
      ?auto_450731 - SURFACE
      ?auto_450733 - SURFACE
      ?auto_450734 - SURFACE
    )
    :vars
    (
      ?auto_450737 - HOIST
      ?auto_450736 - PLACE
      ?auto_450735 - TRUCK
      ?auto_450738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_450737 ?auto_450736 ) ( SURFACE-AT ?auto_450733 ?auto_450736 ) ( CLEAR ?auto_450733 ) ( IS-CRATE ?auto_450734 ) ( not ( = ?auto_450733 ?auto_450734 ) ) ( AVAILABLE ?auto_450737 ) ( IN ?auto_450734 ?auto_450735 ) ( ON ?auto_450733 ?auto_450731 ) ( not ( = ?auto_450731 ?auto_450733 ) ) ( not ( = ?auto_450731 ?auto_450734 ) ) ( TRUCK-AT ?auto_450735 ?auto_450738 ) ( not ( = ?auto_450738 ?auto_450736 ) ) ( ON ?auto_450728 ?auto_450727 ) ( ON ?auto_450729 ?auto_450728 ) ( ON ?auto_450726 ?auto_450729 ) ( ON ?auto_450730 ?auto_450726 ) ( ON ?auto_450732 ?auto_450730 ) ( ON ?auto_450731 ?auto_450732 ) ( not ( = ?auto_450727 ?auto_450728 ) ) ( not ( = ?auto_450727 ?auto_450729 ) ) ( not ( = ?auto_450727 ?auto_450726 ) ) ( not ( = ?auto_450727 ?auto_450730 ) ) ( not ( = ?auto_450727 ?auto_450732 ) ) ( not ( = ?auto_450727 ?auto_450731 ) ) ( not ( = ?auto_450727 ?auto_450733 ) ) ( not ( = ?auto_450727 ?auto_450734 ) ) ( not ( = ?auto_450728 ?auto_450729 ) ) ( not ( = ?auto_450728 ?auto_450726 ) ) ( not ( = ?auto_450728 ?auto_450730 ) ) ( not ( = ?auto_450728 ?auto_450732 ) ) ( not ( = ?auto_450728 ?auto_450731 ) ) ( not ( = ?auto_450728 ?auto_450733 ) ) ( not ( = ?auto_450728 ?auto_450734 ) ) ( not ( = ?auto_450729 ?auto_450726 ) ) ( not ( = ?auto_450729 ?auto_450730 ) ) ( not ( = ?auto_450729 ?auto_450732 ) ) ( not ( = ?auto_450729 ?auto_450731 ) ) ( not ( = ?auto_450729 ?auto_450733 ) ) ( not ( = ?auto_450729 ?auto_450734 ) ) ( not ( = ?auto_450726 ?auto_450730 ) ) ( not ( = ?auto_450726 ?auto_450732 ) ) ( not ( = ?auto_450726 ?auto_450731 ) ) ( not ( = ?auto_450726 ?auto_450733 ) ) ( not ( = ?auto_450726 ?auto_450734 ) ) ( not ( = ?auto_450730 ?auto_450732 ) ) ( not ( = ?auto_450730 ?auto_450731 ) ) ( not ( = ?auto_450730 ?auto_450733 ) ) ( not ( = ?auto_450730 ?auto_450734 ) ) ( not ( = ?auto_450732 ?auto_450731 ) ) ( not ( = ?auto_450732 ?auto_450733 ) ) ( not ( = ?auto_450732 ?auto_450734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450731 ?auto_450733 ?auto_450734 )
      ( MAKE-8CRATE-VERIFY ?auto_450727 ?auto_450728 ?auto_450729 ?auto_450726 ?auto_450730 ?auto_450732 ?auto_450731 ?auto_450733 ?auto_450734 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450811 - SURFACE
      ?auto_450812 - SURFACE
      ?auto_450813 - SURFACE
      ?auto_450810 - SURFACE
      ?auto_450814 - SURFACE
      ?auto_450816 - SURFACE
      ?auto_450815 - SURFACE
      ?auto_450817 - SURFACE
      ?auto_450818 - SURFACE
    )
    :vars
    (
      ?auto_450819 - HOIST
      ?auto_450822 - PLACE
      ?auto_450823 - TRUCK
      ?auto_450820 - PLACE
      ?auto_450821 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_450819 ?auto_450822 ) ( SURFACE-AT ?auto_450817 ?auto_450822 ) ( CLEAR ?auto_450817 ) ( IS-CRATE ?auto_450818 ) ( not ( = ?auto_450817 ?auto_450818 ) ) ( AVAILABLE ?auto_450819 ) ( ON ?auto_450817 ?auto_450815 ) ( not ( = ?auto_450815 ?auto_450817 ) ) ( not ( = ?auto_450815 ?auto_450818 ) ) ( TRUCK-AT ?auto_450823 ?auto_450820 ) ( not ( = ?auto_450820 ?auto_450822 ) ) ( HOIST-AT ?auto_450821 ?auto_450820 ) ( LIFTING ?auto_450821 ?auto_450818 ) ( not ( = ?auto_450819 ?auto_450821 ) ) ( ON ?auto_450812 ?auto_450811 ) ( ON ?auto_450813 ?auto_450812 ) ( ON ?auto_450810 ?auto_450813 ) ( ON ?auto_450814 ?auto_450810 ) ( ON ?auto_450816 ?auto_450814 ) ( ON ?auto_450815 ?auto_450816 ) ( not ( = ?auto_450811 ?auto_450812 ) ) ( not ( = ?auto_450811 ?auto_450813 ) ) ( not ( = ?auto_450811 ?auto_450810 ) ) ( not ( = ?auto_450811 ?auto_450814 ) ) ( not ( = ?auto_450811 ?auto_450816 ) ) ( not ( = ?auto_450811 ?auto_450815 ) ) ( not ( = ?auto_450811 ?auto_450817 ) ) ( not ( = ?auto_450811 ?auto_450818 ) ) ( not ( = ?auto_450812 ?auto_450813 ) ) ( not ( = ?auto_450812 ?auto_450810 ) ) ( not ( = ?auto_450812 ?auto_450814 ) ) ( not ( = ?auto_450812 ?auto_450816 ) ) ( not ( = ?auto_450812 ?auto_450815 ) ) ( not ( = ?auto_450812 ?auto_450817 ) ) ( not ( = ?auto_450812 ?auto_450818 ) ) ( not ( = ?auto_450813 ?auto_450810 ) ) ( not ( = ?auto_450813 ?auto_450814 ) ) ( not ( = ?auto_450813 ?auto_450816 ) ) ( not ( = ?auto_450813 ?auto_450815 ) ) ( not ( = ?auto_450813 ?auto_450817 ) ) ( not ( = ?auto_450813 ?auto_450818 ) ) ( not ( = ?auto_450810 ?auto_450814 ) ) ( not ( = ?auto_450810 ?auto_450816 ) ) ( not ( = ?auto_450810 ?auto_450815 ) ) ( not ( = ?auto_450810 ?auto_450817 ) ) ( not ( = ?auto_450810 ?auto_450818 ) ) ( not ( = ?auto_450814 ?auto_450816 ) ) ( not ( = ?auto_450814 ?auto_450815 ) ) ( not ( = ?auto_450814 ?auto_450817 ) ) ( not ( = ?auto_450814 ?auto_450818 ) ) ( not ( = ?auto_450816 ?auto_450815 ) ) ( not ( = ?auto_450816 ?auto_450817 ) ) ( not ( = ?auto_450816 ?auto_450818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450815 ?auto_450817 ?auto_450818 )
      ( MAKE-8CRATE-VERIFY ?auto_450811 ?auto_450812 ?auto_450813 ?auto_450810 ?auto_450814 ?auto_450816 ?auto_450815 ?auto_450817 ?auto_450818 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450903 - SURFACE
      ?auto_450904 - SURFACE
      ?auto_450905 - SURFACE
      ?auto_450902 - SURFACE
      ?auto_450906 - SURFACE
      ?auto_450908 - SURFACE
      ?auto_450907 - SURFACE
      ?auto_450909 - SURFACE
      ?auto_450910 - SURFACE
    )
    :vars
    (
      ?auto_450912 - HOIST
      ?auto_450914 - PLACE
      ?auto_450915 - TRUCK
      ?auto_450911 - PLACE
      ?auto_450916 - HOIST
      ?auto_450913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_450912 ?auto_450914 ) ( SURFACE-AT ?auto_450909 ?auto_450914 ) ( CLEAR ?auto_450909 ) ( IS-CRATE ?auto_450910 ) ( not ( = ?auto_450909 ?auto_450910 ) ) ( AVAILABLE ?auto_450912 ) ( ON ?auto_450909 ?auto_450907 ) ( not ( = ?auto_450907 ?auto_450909 ) ) ( not ( = ?auto_450907 ?auto_450910 ) ) ( TRUCK-AT ?auto_450915 ?auto_450911 ) ( not ( = ?auto_450911 ?auto_450914 ) ) ( HOIST-AT ?auto_450916 ?auto_450911 ) ( not ( = ?auto_450912 ?auto_450916 ) ) ( AVAILABLE ?auto_450916 ) ( SURFACE-AT ?auto_450910 ?auto_450911 ) ( ON ?auto_450910 ?auto_450913 ) ( CLEAR ?auto_450910 ) ( not ( = ?auto_450909 ?auto_450913 ) ) ( not ( = ?auto_450910 ?auto_450913 ) ) ( not ( = ?auto_450907 ?auto_450913 ) ) ( ON ?auto_450904 ?auto_450903 ) ( ON ?auto_450905 ?auto_450904 ) ( ON ?auto_450902 ?auto_450905 ) ( ON ?auto_450906 ?auto_450902 ) ( ON ?auto_450908 ?auto_450906 ) ( ON ?auto_450907 ?auto_450908 ) ( not ( = ?auto_450903 ?auto_450904 ) ) ( not ( = ?auto_450903 ?auto_450905 ) ) ( not ( = ?auto_450903 ?auto_450902 ) ) ( not ( = ?auto_450903 ?auto_450906 ) ) ( not ( = ?auto_450903 ?auto_450908 ) ) ( not ( = ?auto_450903 ?auto_450907 ) ) ( not ( = ?auto_450903 ?auto_450909 ) ) ( not ( = ?auto_450903 ?auto_450910 ) ) ( not ( = ?auto_450903 ?auto_450913 ) ) ( not ( = ?auto_450904 ?auto_450905 ) ) ( not ( = ?auto_450904 ?auto_450902 ) ) ( not ( = ?auto_450904 ?auto_450906 ) ) ( not ( = ?auto_450904 ?auto_450908 ) ) ( not ( = ?auto_450904 ?auto_450907 ) ) ( not ( = ?auto_450904 ?auto_450909 ) ) ( not ( = ?auto_450904 ?auto_450910 ) ) ( not ( = ?auto_450904 ?auto_450913 ) ) ( not ( = ?auto_450905 ?auto_450902 ) ) ( not ( = ?auto_450905 ?auto_450906 ) ) ( not ( = ?auto_450905 ?auto_450908 ) ) ( not ( = ?auto_450905 ?auto_450907 ) ) ( not ( = ?auto_450905 ?auto_450909 ) ) ( not ( = ?auto_450905 ?auto_450910 ) ) ( not ( = ?auto_450905 ?auto_450913 ) ) ( not ( = ?auto_450902 ?auto_450906 ) ) ( not ( = ?auto_450902 ?auto_450908 ) ) ( not ( = ?auto_450902 ?auto_450907 ) ) ( not ( = ?auto_450902 ?auto_450909 ) ) ( not ( = ?auto_450902 ?auto_450910 ) ) ( not ( = ?auto_450902 ?auto_450913 ) ) ( not ( = ?auto_450906 ?auto_450908 ) ) ( not ( = ?auto_450906 ?auto_450907 ) ) ( not ( = ?auto_450906 ?auto_450909 ) ) ( not ( = ?auto_450906 ?auto_450910 ) ) ( not ( = ?auto_450906 ?auto_450913 ) ) ( not ( = ?auto_450908 ?auto_450907 ) ) ( not ( = ?auto_450908 ?auto_450909 ) ) ( not ( = ?auto_450908 ?auto_450910 ) ) ( not ( = ?auto_450908 ?auto_450913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450907 ?auto_450909 ?auto_450910 )
      ( MAKE-8CRATE-VERIFY ?auto_450903 ?auto_450904 ?auto_450905 ?auto_450902 ?auto_450906 ?auto_450908 ?auto_450907 ?auto_450909 ?auto_450910 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450996 - SURFACE
      ?auto_450997 - SURFACE
      ?auto_450998 - SURFACE
      ?auto_450995 - SURFACE
      ?auto_450999 - SURFACE
      ?auto_451001 - SURFACE
      ?auto_451000 - SURFACE
      ?auto_451002 - SURFACE
      ?auto_451003 - SURFACE
    )
    :vars
    (
      ?auto_451008 - HOIST
      ?auto_451007 - PLACE
      ?auto_451004 - PLACE
      ?auto_451006 - HOIST
      ?auto_451005 - SURFACE
      ?auto_451009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_451008 ?auto_451007 ) ( SURFACE-AT ?auto_451002 ?auto_451007 ) ( CLEAR ?auto_451002 ) ( IS-CRATE ?auto_451003 ) ( not ( = ?auto_451002 ?auto_451003 ) ) ( AVAILABLE ?auto_451008 ) ( ON ?auto_451002 ?auto_451000 ) ( not ( = ?auto_451000 ?auto_451002 ) ) ( not ( = ?auto_451000 ?auto_451003 ) ) ( not ( = ?auto_451004 ?auto_451007 ) ) ( HOIST-AT ?auto_451006 ?auto_451004 ) ( not ( = ?auto_451008 ?auto_451006 ) ) ( AVAILABLE ?auto_451006 ) ( SURFACE-AT ?auto_451003 ?auto_451004 ) ( ON ?auto_451003 ?auto_451005 ) ( CLEAR ?auto_451003 ) ( not ( = ?auto_451002 ?auto_451005 ) ) ( not ( = ?auto_451003 ?auto_451005 ) ) ( not ( = ?auto_451000 ?auto_451005 ) ) ( TRUCK-AT ?auto_451009 ?auto_451007 ) ( ON ?auto_450997 ?auto_450996 ) ( ON ?auto_450998 ?auto_450997 ) ( ON ?auto_450995 ?auto_450998 ) ( ON ?auto_450999 ?auto_450995 ) ( ON ?auto_451001 ?auto_450999 ) ( ON ?auto_451000 ?auto_451001 ) ( not ( = ?auto_450996 ?auto_450997 ) ) ( not ( = ?auto_450996 ?auto_450998 ) ) ( not ( = ?auto_450996 ?auto_450995 ) ) ( not ( = ?auto_450996 ?auto_450999 ) ) ( not ( = ?auto_450996 ?auto_451001 ) ) ( not ( = ?auto_450996 ?auto_451000 ) ) ( not ( = ?auto_450996 ?auto_451002 ) ) ( not ( = ?auto_450996 ?auto_451003 ) ) ( not ( = ?auto_450996 ?auto_451005 ) ) ( not ( = ?auto_450997 ?auto_450998 ) ) ( not ( = ?auto_450997 ?auto_450995 ) ) ( not ( = ?auto_450997 ?auto_450999 ) ) ( not ( = ?auto_450997 ?auto_451001 ) ) ( not ( = ?auto_450997 ?auto_451000 ) ) ( not ( = ?auto_450997 ?auto_451002 ) ) ( not ( = ?auto_450997 ?auto_451003 ) ) ( not ( = ?auto_450997 ?auto_451005 ) ) ( not ( = ?auto_450998 ?auto_450995 ) ) ( not ( = ?auto_450998 ?auto_450999 ) ) ( not ( = ?auto_450998 ?auto_451001 ) ) ( not ( = ?auto_450998 ?auto_451000 ) ) ( not ( = ?auto_450998 ?auto_451002 ) ) ( not ( = ?auto_450998 ?auto_451003 ) ) ( not ( = ?auto_450998 ?auto_451005 ) ) ( not ( = ?auto_450995 ?auto_450999 ) ) ( not ( = ?auto_450995 ?auto_451001 ) ) ( not ( = ?auto_450995 ?auto_451000 ) ) ( not ( = ?auto_450995 ?auto_451002 ) ) ( not ( = ?auto_450995 ?auto_451003 ) ) ( not ( = ?auto_450995 ?auto_451005 ) ) ( not ( = ?auto_450999 ?auto_451001 ) ) ( not ( = ?auto_450999 ?auto_451000 ) ) ( not ( = ?auto_450999 ?auto_451002 ) ) ( not ( = ?auto_450999 ?auto_451003 ) ) ( not ( = ?auto_450999 ?auto_451005 ) ) ( not ( = ?auto_451001 ?auto_451000 ) ) ( not ( = ?auto_451001 ?auto_451002 ) ) ( not ( = ?auto_451001 ?auto_451003 ) ) ( not ( = ?auto_451001 ?auto_451005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_451000 ?auto_451002 ?auto_451003 )
      ( MAKE-8CRATE-VERIFY ?auto_450996 ?auto_450997 ?auto_450998 ?auto_450995 ?auto_450999 ?auto_451001 ?auto_451000 ?auto_451002 ?auto_451003 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_451089 - SURFACE
      ?auto_451090 - SURFACE
      ?auto_451091 - SURFACE
      ?auto_451088 - SURFACE
      ?auto_451092 - SURFACE
      ?auto_451094 - SURFACE
      ?auto_451093 - SURFACE
      ?auto_451095 - SURFACE
      ?auto_451096 - SURFACE
    )
    :vars
    (
      ?auto_451101 - HOIST
      ?auto_451102 - PLACE
      ?auto_451099 - PLACE
      ?auto_451098 - HOIST
      ?auto_451097 - SURFACE
      ?auto_451100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_451101 ?auto_451102 ) ( IS-CRATE ?auto_451096 ) ( not ( = ?auto_451095 ?auto_451096 ) ) ( not ( = ?auto_451093 ?auto_451095 ) ) ( not ( = ?auto_451093 ?auto_451096 ) ) ( not ( = ?auto_451099 ?auto_451102 ) ) ( HOIST-AT ?auto_451098 ?auto_451099 ) ( not ( = ?auto_451101 ?auto_451098 ) ) ( AVAILABLE ?auto_451098 ) ( SURFACE-AT ?auto_451096 ?auto_451099 ) ( ON ?auto_451096 ?auto_451097 ) ( CLEAR ?auto_451096 ) ( not ( = ?auto_451095 ?auto_451097 ) ) ( not ( = ?auto_451096 ?auto_451097 ) ) ( not ( = ?auto_451093 ?auto_451097 ) ) ( TRUCK-AT ?auto_451100 ?auto_451102 ) ( SURFACE-AT ?auto_451093 ?auto_451102 ) ( CLEAR ?auto_451093 ) ( LIFTING ?auto_451101 ?auto_451095 ) ( IS-CRATE ?auto_451095 ) ( ON ?auto_451090 ?auto_451089 ) ( ON ?auto_451091 ?auto_451090 ) ( ON ?auto_451088 ?auto_451091 ) ( ON ?auto_451092 ?auto_451088 ) ( ON ?auto_451094 ?auto_451092 ) ( ON ?auto_451093 ?auto_451094 ) ( not ( = ?auto_451089 ?auto_451090 ) ) ( not ( = ?auto_451089 ?auto_451091 ) ) ( not ( = ?auto_451089 ?auto_451088 ) ) ( not ( = ?auto_451089 ?auto_451092 ) ) ( not ( = ?auto_451089 ?auto_451094 ) ) ( not ( = ?auto_451089 ?auto_451093 ) ) ( not ( = ?auto_451089 ?auto_451095 ) ) ( not ( = ?auto_451089 ?auto_451096 ) ) ( not ( = ?auto_451089 ?auto_451097 ) ) ( not ( = ?auto_451090 ?auto_451091 ) ) ( not ( = ?auto_451090 ?auto_451088 ) ) ( not ( = ?auto_451090 ?auto_451092 ) ) ( not ( = ?auto_451090 ?auto_451094 ) ) ( not ( = ?auto_451090 ?auto_451093 ) ) ( not ( = ?auto_451090 ?auto_451095 ) ) ( not ( = ?auto_451090 ?auto_451096 ) ) ( not ( = ?auto_451090 ?auto_451097 ) ) ( not ( = ?auto_451091 ?auto_451088 ) ) ( not ( = ?auto_451091 ?auto_451092 ) ) ( not ( = ?auto_451091 ?auto_451094 ) ) ( not ( = ?auto_451091 ?auto_451093 ) ) ( not ( = ?auto_451091 ?auto_451095 ) ) ( not ( = ?auto_451091 ?auto_451096 ) ) ( not ( = ?auto_451091 ?auto_451097 ) ) ( not ( = ?auto_451088 ?auto_451092 ) ) ( not ( = ?auto_451088 ?auto_451094 ) ) ( not ( = ?auto_451088 ?auto_451093 ) ) ( not ( = ?auto_451088 ?auto_451095 ) ) ( not ( = ?auto_451088 ?auto_451096 ) ) ( not ( = ?auto_451088 ?auto_451097 ) ) ( not ( = ?auto_451092 ?auto_451094 ) ) ( not ( = ?auto_451092 ?auto_451093 ) ) ( not ( = ?auto_451092 ?auto_451095 ) ) ( not ( = ?auto_451092 ?auto_451096 ) ) ( not ( = ?auto_451092 ?auto_451097 ) ) ( not ( = ?auto_451094 ?auto_451093 ) ) ( not ( = ?auto_451094 ?auto_451095 ) ) ( not ( = ?auto_451094 ?auto_451096 ) ) ( not ( = ?auto_451094 ?auto_451097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_451093 ?auto_451095 ?auto_451096 )
      ( MAKE-8CRATE-VERIFY ?auto_451089 ?auto_451090 ?auto_451091 ?auto_451088 ?auto_451092 ?auto_451094 ?auto_451093 ?auto_451095 ?auto_451096 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_451182 - SURFACE
      ?auto_451183 - SURFACE
      ?auto_451184 - SURFACE
      ?auto_451181 - SURFACE
      ?auto_451185 - SURFACE
      ?auto_451187 - SURFACE
      ?auto_451186 - SURFACE
      ?auto_451188 - SURFACE
      ?auto_451189 - SURFACE
    )
    :vars
    (
      ?auto_451193 - HOIST
      ?auto_451191 - PLACE
      ?auto_451195 - PLACE
      ?auto_451190 - HOIST
      ?auto_451192 - SURFACE
      ?auto_451194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_451193 ?auto_451191 ) ( IS-CRATE ?auto_451189 ) ( not ( = ?auto_451188 ?auto_451189 ) ) ( not ( = ?auto_451186 ?auto_451188 ) ) ( not ( = ?auto_451186 ?auto_451189 ) ) ( not ( = ?auto_451195 ?auto_451191 ) ) ( HOIST-AT ?auto_451190 ?auto_451195 ) ( not ( = ?auto_451193 ?auto_451190 ) ) ( AVAILABLE ?auto_451190 ) ( SURFACE-AT ?auto_451189 ?auto_451195 ) ( ON ?auto_451189 ?auto_451192 ) ( CLEAR ?auto_451189 ) ( not ( = ?auto_451188 ?auto_451192 ) ) ( not ( = ?auto_451189 ?auto_451192 ) ) ( not ( = ?auto_451186 ?auto_451192 ) ) ( TRUCK-AT ?auto_451194 ?auto_451191 ) ( SURFACE-AT ?auto_451186 ?auto_451191 ) ( CLEAR ?auto_451186 ) ( IS-CRATE ?auto_451188 ) ( AVAILABLE ?auto_451193 ) ( IN ?auto_451188 ?auto_451194 ) ( ON ?auto_451183 ?auto_451182 ) ( ON ?auto_451184 ?auto_451183 ) ( ON ?auto_451181 ?auto_451184 ) ( ON ?auto_451185 ?auto_451181 ) ( ON ?auto_451187 ?auto_451185 ) ( ON ?auto_451186 ?auto_451187 ) ( not ( = ?auto_451182 ?auto_451183 ) ) ( not ( = ?auto_451182 ?auto_451184 ) ) ( not ( = ?auto_451182 ?auto_451181 ) ) ( not ( = ?auto_451182 ?auto_451185 ) ) ( not ( = ?auto_451182 ?auto_451187 ) ) ( not ( = ?auto_451182 ?auto_451186 ) ) ( not ( = ?auto_451182 ?auto_451188 ) ) ( not ( = ?auto_451182 ?auto_451189 ) ) ( not ( = ?auto_451182 ?auto_451192 ) ) ( not ( = ?auto_451183 ?auto_451184 ) ) ( not ( = ?auto_451183 ?auto_451181 ) ) ( not ( = ?auto_451183 ?auto_451185 ) ) ( not ( = ?auto_451183 ?auto_451187 ) ) ( not ( = ?auto_451183 ?auto_451186 ) ) ( not ( = ?auto_451183 ?auto_451188 ) ) ( not ( = ?auto_451183 ?auto_451189 ) ) ( not ( = ?auto_451183 ?auto_451192 ) ) ( not ( = ?auto_451184 ?auto_451181 ) ) ( not ( = ?auto_451184 ?auto_451185 ) ) ( not ( = ?auto_451184 ?auto_451187 ) ) ( not ( = ?auto_451184 ?auto_451186 ) ) ( not ( = ?auto_451184 ?auto_451188 ) ) ( not ( = ?auto_451184 ?auto_451189 ) ) ( not ( = ?auto_451184 ?auto_451192 ) ) ( not ( = ?auto_451181 ?auto_451185 ) ) ( not ( = ?auto_451181 ?auto_451187 ) ) ( not ( = ?auto_451181 ?auto_451186 ) ) ( not ( = ?auto_451181 ?auto_451188 ) ) ( not ( = ?auto_451181 ?auto_451189 ) ) ( not ( = ?auto_451181 ?auto_451192 ) ) ( not ( = ?auto_451185 ?auto_451187 ) ) ( not ( = ?auto_451185 ?auto_451186 ) ) ( not ( = ?auto_451185 ?auto_451188 ) ) ( not ( = ?auto_451185 ?auto_451189 ) ) ( not ( = ?auto_451185 ?auto_451192 ) ) ( not ( = ?auto_451187 ?auto_451186 ) ) ( not ( = ?auto_451187 ?auto_451188 ) ) ( not ( = ?auto_451187 ?auto_451189 ) ) ( not ( = ?auto_451187 ?auto_451192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_451186 ?auto_451188 ?auto_451189 )
      ( MAKE-8CRATE-VERIFY ?auto_451182 ?auto_451183 ?auto_451184 ?auto_451181 ?auto_451185 ?auto_451187 ?auto_451186 ?auto_451188 ?auto_451189 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455298 - SURFACE
      ?auto_455299 - SURFACE
      ?auto_455300 - SURFACE
      ?auto_455297 - SURFACE
      ?auto_455301 - SURFACE
      ?auto_455303 - SURFACE
      ?auto_455302 - SURFACE
      ?auto_455304 - SURFACE
      ?auto_455305 - SURFACE
      ?auto_455306 - SURFACE
    )
    :vars
    (
      ?auto_455308 - HOIST
      ?auto_455307 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_455308 ?auto_455307 ) ( SURFACE-AT ?auto_455305 ?auto_455307 ) ( CLEAR ?auto_455305 ) ( LIFTING ?auto_455308 ?auto_455306 ) ( IS-CRATE ?auto_455306 ) ( not ( = ?auto_455305 ?auto_455306 ) ) ( ON ?auto_455299 ?auto_455298 ) ( ON ?auto_455300 ?auto_455299 ) ( ON ?auto_455297 ?auto_455300 ) ( ON ?auto_455301 ?auto_455297 ) ( ON ?auto_455303 ?auto_455301 ) ( ON ?auto_455302 ?auto_455303 ) ( ON ?auto_455304 ?auto_455302 ) ( ON ?auto_455305 ?auto_455304 ) ( not ( = ?auto_455298 ?auto_455299 ) ) ( not ( = ?auto_455298 ?auto_455300 ) ) ( not ( = ?auto_455298 ?auto_455297 ) ) ( not ( = ?auto_455298 ?auto_455301 ) ) ( not ( = ?auto_455298 ?auto_455303 ) ) ( not ( = ?auto_455298 ?auto_455302 ) ) ( not ( = ?auto_455298 ?auto_455304 ) ) ( not ( = ?auto_455298 ?auto_455305 ) ) ( not ( = ?auto_455298 ?auto_455306 ) ) ( not ( = ?auto_455299 ?auto_455300 ) ) ( not ( = ?auto_455299 ?auto_455297 ) ) ( not ( = ?auto_455299 ?auto_455301 ) ) ( not ( = ?auto_455299 ?auto_455303 ) ) ( not ( = ?auto_455299 ?auto_455302 ) ) ( not ( = ?auto_455299 ?auto_455304 ) ) ( not ( = ?auto_455299 ?auto_455305 ) ) ( not ( = ?auto_455299 ?auto_455306 ) ) ( not ( = ?auto_455300 ?auto_455297 ) ) ( not ( = ?auto_455300 ?auto_455301 ) ) ( not ( = ?auto_455300 ?auto_455303 ) ) ( not ( = ?auto_455300 ?auto_455302 ) ) ( not ( = ?auto_455300 ?auto_455304 ) ) ( not ( = ?auto_455300 ?auto_455305 ) ) ( not ( = ?auto_455300 ?auto_455306 ) ) ( not ( = ?auto_455297 ?auto_455301 ) ) ( not ( = ?auto_455297 ?auto_455303 ) ) ( not ( = ?auto_455297 ?auto_455302 ) ) ( not ( = ?auto_455297 ?auto_455304 ) ) ( not ( = ?auto_455297 ?auto_455305 ) ) ( not ( = ?auto_455297 ?auto_455306 ) ) ( not ( = ?auto_455301 ?auto_455303 ) ) ( not ( = ?auto_455301 ?auto_455302 ) ) ( not ( = ?auto_455301 ?auto_455304 ) ) ( not ( = ?auto_455301 ?auto_455305 ) ) ( not ( = ?auto_455301 ?auto_455306 ) ) ( not ( = ?auto_455303 ?auto_455302 ) ) ( not ( = ?auto_455303 ?auto_455304 ) ) ( not ( = ?auto_455303 ?auto_455305 ) ) ( not ( = ?auto_455303 ?auto_455306 ) ) ( not ( = ?auto_455302 ?auto_455304 ) ) ( not ( = ?auto_455302 ?auto_455305 ) ) ( not ( = ?auto_455302 ?auto_455306 ) ) ( not ( = ?auto_455304 ?auto_455305 ) ) ( not ( = ?auto_455304 ?auto_455306 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_455305 ?auto_455306 )
      ( MAKE-9CRATE-VERIFY ?auto_455298 ?auto_455299 ?auto_455300 ?auto_455297 ?auto_455301 ?auto_455303 ?auto_455302 ?auto_455304 ?auto_455305 ?auto_455306 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455378 - SURFACE
      ?auto_455379 - SURFACE
      ?auto_455380 - SURFACE
      ?auto_455377 - SURFACE
      ?auto_455381 - SURFACE
      ?auto_455383 - SURFACE
      ?auto_455382 - SURFACE
      ?auto_455384 - SURFACE
      ?auto_455385 - SURFACE
      ?auto_455386 - SURFACE
    )
    :vars
    (
      ?auto_455388 - HOIST
      ?auto_455387 - PLACE
      ?auto_455389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_455388 ?auto_455387 ) ( SURFACE-AT ?auto_455385 ?auto_455387 ) ( CLEAR ?auto_455385 ) ( IS-CRATE ?auto_455386 ) ( not ( = ?auto_455385 ?auto_455386 ) ) ( TRUCK-AT ?auto_455389 ?auto_455387 ) ( AVAILABLE ?auto_455388 ) ( IN ?auto_455386 ?auto_455389 ) ( ON ?auto_455385 ?auto_455384 ) ( not ( = ?auto_455384 ?auto_455385 ) ) ( not ( = ?auto_455384 ?auto_455386 ) ) ( ON ?auto_455379 ?auto_455378 ) ( ON ?auto_455380 ?auto_455379 ) ( ON ?auto_455377 ?auto_455380 ) ( ON ?auto_455381 ?auto_455377 ) ( ON ?auto_455383 ?auto_455381 ) ( ON ?auto_455382 ?auto_455383 ) ( ON ?auto_455384 ?auto_455382 ) ( not ( = ?auto_455378 ?auto_455379 ) ) ( not ( = ?auto_455378 ?auto_455380 ) ) ( not ( = ?auto_455378 ?auto_455377 ) ) ( not ( = ?auto_455378 ?auto_455381 ) ) ( not ( = ?auto_455378 ?auto_455383 ) ) ( not ( = ?auto_455378 ?auto_455382 ) ) ( not ( = ?auto_455378 ?auto_455384 ) ) ( not ( = ?auto_455378 ?auto_455385 ) ) ( not ( = ?auto_455378 ?auto_455386 ) ) ( not ( = ?auto_455379 ?auto_455380 ) ) ( not ( = ?auto_455379 ?auto_455377 ) ) ( not ( = ?auto_455379 ?auto_455381 ) ) ( not ( = ?auto_455379 ?auto_455383 ) ) ( not ( = ?auto_455379 ?auto_455382 ) ) ( not ( = ?auto_455379 ?auto_455384 ) ) ( not ( = ?auto_455379 ?auto_455385 ) ) ( not ( = ?auto_455379 ?auto_455386 ) ) ( not ( = ?auto_455380 ?auto_455377 ) ) ( not ( = ?auto_455380 ?auto_455381 ) ) ( not ( = ?auto_455380 ?auto_455383 ) ) ( not ( = ?auto_455380 ?auto_455382 ) ) ( not ( = ?auto_455380 ?auto_455384 ) ) ( not ( = ?auto_455380 ?auto_455385 ) ) ( not ( = ?auto_455380 ?auto_455386 ) ) ( not ( = ?auto_455377 ?auto_455381 ) ) ( not ( = ?auto_455377 ?auto_455383 ) ) ( not ( = ?auto_455377 ?auto_455382 ) ) ( not ( = ?auto_455377 ?auto_455384 ) ) ( not ( = ?auto_455377 ?auto_455385 ) ) ( not ( = ?auto_455377 ?auto_455386 ) ) ( not ( = ?auto_455381 ?auto_455383 ) ) ( not ( = ?auto_455381 ?auto_455382 ) ) ( not ( = ?auto_455381 ?auto_455384 ) ) ( not ( = ?auto_455381 ?auto_455385 ) ) ( not ( = ?auto_455381 ?auto_455386 ) ) ( not ( = ?auto_455383 ?auto_455382 ) ) ( not ( = ?auto_455383 ?auto_455384 ) ) ( not ( = ?auto_455383 ?auto_455385 ) ) ( not ( = ?auto_455383 ?auto_455386 ) ) ( not ( = ?auto_455382 ?auto_455384 ) ) ( not ( = ?auto_455382 ?auto_455385 ) ) ( not ( = ?auto_455382 ?auto_455386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455384 ?auto_455385 ?auto_455386 )
      ( MAKE-9CRATE-VERIFY ?auto_455378 ?auto_455379 ?auto_455380 ?auto_455377 ?auto_455381 ?auto_455383 ?auto_455382 ?auto_455384 ?auto_455385 ?auto_455386 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455468 - SURFACE
      ?auto_455469 - SURFACE
      ?auto_455470 - SURFACE
      ?auto_455467 - SURFACE
      ?auto_455471 - SURFACE
      ?auto_455473 - SURFACE
      ?auto_455472 - SURFACE
      ?auto_455474 - SURFACE
      ?auto_455475 - SURFACE
      ?auto_455476 - SURFACE
    )
    :vars
    (
      ?auto_455477 - HOIST
      ?auto_455478 - PLACE
      ?auto_455479 - TRUCK
      ?auto_455480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_455477 ?auto_455478 ) ( SURFACE-AT ?auto_455475 ?auto_455478 ) ( CLEAR ?auto_455475 ) ( IS-CRATE ?auto_455476 ) ( not ( = ?auto_455475 ?auto_455476 ) ) ( AVAILABLE ?auto_455477 ) ( IN ?auto_455476 ?auto_455479 ) ( ON ?auto_455475 ?auto_455474 ) ( not ( = ?auto_455474 ?auto_455475 ) ) ( not ( = ?auto_455474 ?auto_455476 ) ) ( TRUCK-AT ?auto_455479 ?auto_455480 ) ( not ( = ?auto_455480 ?auto_455478 ) ) ( ON ?auto_455469 ?auto_455468 ) ( ON ?auto_455470 ?auto_455469 ) ( ON ?auto_455467 ?auto_455470 ) ( ON ?auto_455471 ?auto_455467 ) ( ON ?auto_455473 ?auto_455471 ) ( ON ?auto_455472 ?auto_455473 ) ( ON ?auto_455474 ?auto_455472 ) ( not ( = ?auto_455468 ?auto_455469 ) ) ( not ( = ?auto_455468 ?auto_455470 ) ) ( not ( = ?auto_455468 ?auto_455467 ) ) ( not ( = ?auto_455468 ?auto_455471 ) ) ( not ( = ?auto_455468 ?auto_455473 ) ) ( not ( = ?auto_455468 ?auto_455472 ) ) ( not ( = ?auto_455468 ?auto_455474 ) ) ( not ( = ?auto_455468 ?auto_455475 ) ) ( not ( = ?auto_455468 ?auto_455476 ) ) ( not ( = ?auto_455469 ?auto_455470 ) ) ( not ( = ?auto_455469 ?auto_455467 ) ) ( not ( = ?auto_455469 ?auto_455471 ) ) ( not ( = ?auto_455469 ?auto_455473 ) ) ( not ( = ?auto_455469 ?auto_455472 ) ) ( not ( = ?auto_455469 ?auto_455474 ) ) ( not ( = ?auto_455469 ?auto_455475 ) ) ( not ( = ?auto_455469 ?auto_455476 ) ) ( not ( = ?auto_455470 ?auto_455467 ) ) ( not ( = ?auto_455470 ?auto_455471 ) ) ( not ( = ?auto_455470 ?auto_455473 ) ) ( not ( = ?auto_455470 ?auto_455472 ) ) ( not ( = ?auto_455470 ?auto_455474 ) ) ( not ( = ?auto_455470 ?auto_455475 ) ) ( not ( = ?auto_455470 ?auto_455476 ) ) ( not ( = ?auto_455467 ?auto_455471 ) ) ( not ( = ?auto_455467 ?auto_455473 ) ) ( not ( = ?auto_455467 ?auto_455472 ) ) ( not ( = ?auto_455467 ?auto_455474 ) ) ( not ( = ?auto_455467 ?auto_455475 ) ) ( not ( = ?auto_455467 ?auto_455476 ) ) ( not ( = ?auto_455471 ?auto_455473 ) ) ( not ( = ?auto_455471 ?auto_455472 ) ) ( not ( = ?auto_455471 ?auto_455474 ) ) ( not ( = ?auto_455471 ?auto_455475 ) ) ( not ( = ?auto_455471 ?auto_455476 ) ) ( not ( = ?auto_455473 ?auto_455472 ) ) ( not ( = ?auto_455473 ?auto_455474 ) ) ( not ( = ?auto_455473 ?auto_455475 ) ) ( not ( = ?auto_455473 ?auto_455476 ) ) ( not ( = ?auto_455472 ?auto_455474 ) ) ( not ( = ?auto_455472 ?auto_455475 ) ) ( not ( = ?auto_455472 ?auto_455476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455474 ?auto_455475 ?auto_455476 )
      ( MAKE-9CRATE-VERIFY ?auto_455468 ?auto_455469 ?auto_455470 ?auto_455467 ?auto_455471 ?auto_455473 ?auto_455472 ?auto_455474 ?auto_455475 ?auto_455476 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455567 - SURFACE
      ?auto_455568 - SURFACE
      ?auto_455569 - SURFACE
      ?auto_455566 - SURFACE
      ?auto_455570 - SURFACE
      ?auto_455572 - SURFACE
      ?auto_455571 - SURFACE
      ?auto_455573 - SURFACE
      ?auto_455574 - SURFACE
      ?auto_455575 - SURFACE
    )
    :vars
    (
      ?auto_455579 - HOIST
      ?auto_455577 - PLACE
      ?auto_455578 - TRUCK
      ?auto_455576 - PLACE
      ?auto_455580 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_455579 ?auto_455577 ) ( SURFACE-AT ?auto_455574 ?auto_455577 ) ( CLEAR ?auto_455574 ) ( IS-CRATE ?auto_455575 ) ( not ( = ?auto_455574 ?auto_455575 ) ) ( AVAILABLE ?auto_455579 ) ( ON ?auto_455574 ?auto_455573 ) ( not ( = ?auto_455573 ?auto_455574 ) ) ( not ( = ?auto_455573 ?auto_455575 ) ) ( TRUCK-AT ?auto_455578 ?auto_455576 ) ( not ( = ?auto_455576 ?auto_455577 ) ) ( HOIST-AT ?auto_455580 ?auto_455576 ) ( LIFTING ?auto_455580 ?auto_455575 ) ( not ( = ?auto_455579 ?auto_455580 ) ) ( ON ?auto_455568 ?auto_455567 ) ( ON ?auto_455569 ?auto_455568 ) ( ON ?auto_455566 ?auto_455569 ) ( ON ?auto_455570 ?auto_455566 ) ( ON ?auto_455572 ?auto_455570 ) ( ON ?auto_455571 ?auto_455572 ) ( ON ?auto_455573 ?auto_455571 ) ( not ( = ?auto_455567 ?auto_455568 ) ) ( not ( = ?auto_455567 ?auto_455569 ) ) ( not ( = ?auto_455567 ?auto_455566 ) ) ( not ( = ?auto_455567 ?auto_455570 ) ) ( not ( = ?auto_455567 ?auto_455572 ) ) ( not ( = ?auto_455567 ?auto_455571 ) ) ( not ( = ?auto_455567 ?auto_455573 ) ) ( not ( = ?auto_455567 ?auto_455574 ) ) ( not ( = ?auto_455567 ?auto_455575 ) ) ( not ( = ?auto_455568 ?auto_455569 ) ) ( not ( = ?auto_455568 ?auto_455566 ) ) ( not ( = ?auto_455568 ?auto_455570 ) ) ( not ( = ?auto_455568 ?auto_455572 ) ) ( not ( = ?auto_455568 ?auto_455571 ) ) ( not ( = ?auto_455568 ?auto_455573 ) ) ( not ( = ?auto_455568 ?auto_455574 ) ) ( not ( = ?auto_455568 ?auto_455575 ) ) ( not ( = ?auto_455569 ?auto_455566 ) ) ( not ( = ?auto_455569 ?auto_455570 ) ) ( not ( = ?auto_455569 ?auto_455572 ) ) ( not ( = ?auto_455569 ?auto_455571 ) ) ( not ( = ?auto_455569 ?auto_455573 ) ) ( not ( = ?auto_455569 ?auto_455574 ) ) ( not ( = ?auto_455569 ?auto_455575 ) ) ( not ( = ?auto_455566 ?auto_455570 ) ) ( not ( = ?auto_455566 ?auto_455572 ) ) ( not ( = ?auto_455566 ?auto_455571 ) ) ( not ( = ?auto_455566 ?auto_455573 ) ) ( not ( = ?auto_455566 ?auto_455574 ) ) ( not ( = ?auto_455566 ?auto_455575 ) ) ( not ( = ?auto_455570 ?auto_455572 ) ) ( not ( = ?auto_455570 ?auto_455571 ) ) ( not ( = ?auto_455570 ?auto_455573 ) ) ( not ( = ?auto_455570 ?auto_455574 ) ) ( not ( = ?auto_455570 ?auto_455575 ) ) ( not ( = ?auto_455572 ?auto_455571 ) ) ( not ( = ?auto_455572 ?auto_455573 ) ) ( not ( = ?auto_455572 ?auto_455574 ) ) ( not ( = ?auto_455572 ?auto_455575 ) ) ( not ( = ?auto_455571 ?auto_455573 ) ) ( not ( = ?auto_455571 ?auto_455574 ) ) ( not ( = ?auto_455571 ?auto_455575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455573 ?auto_455574 ?auto_455575 )
      ( MAKE-9CRATE-VERIFY ?auto_455567 ?auto_455568 ?auto_455569 ?auto_455566 ?auto_455570 ?auto_455572 ?auto_455571 ?auto_455573 ?auto_455574 ?auto_455575 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455675 - SURFACE
      ?auto_455676 - SURFACE
      ?auto_455677 - SURFACE
      ?auto_455674 - SURFACE
      ?auto_455678 - SURFACE
      ?auto_455680 - SURFACE
      ?auto_455679 - SURFACE
      ?auto_455681 - SURFACE
      ?auto_455682 - SURFACE
      ?auto_455683 - SURFACE
    )
    :vars
    (
      ?auto_455689 - HOIST
      ?auto_455688 - PLACE
      ?auto_455685 - TRUCK
      ?auto_455687 - PLACE
      ?auto_455686 - HOIST
      ?auto_455684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_455689 ?auto_455688 ) ( SURFACE-AT ?auto_455682 ?auto_455688 ) ( CLEAR ?auto_455682 ) ( IS-CRATE ?auto_455683 ) ( not ( = ?auto_455682 ?auto_455683 ) ) ( AVAILABLE ?auto_455689 ) ( ON ?auto_455682 ?auto_455681 ) ( not ( = ?auto_455681 ?auto_455682 ) ) ( not ( = ?auto_455681 ?auto_455683 ) ) ( TRUCK-AT ?auto_455685 ?auto_455687 ) ( not ( = ?auto_455687 ?auto_455688 ) ) ( HOIST-AT ?auto_455686 ?auto_455687 ) ( not ( = ?auto_455689 ?auto_455686 ) ) ( AVAILABLE ?auto_455686 ) ( SURFACE-AT ?auto_455683 ?auto_455687 ) ( ON ?auto_455683 ?auto_455684 ) ( CLEAR ?auto_455683 ) ( not ( = ?auto_455682 ?auto_455684 ) ) ( not ( = ?auto_455683 ?auto_455684 ) ) ( not ( = ?auto_455681 ?auto_455684 ) ) ( ON ?auto_455676 ?auto_455675 ) ( ON ?auto_455677 ?auto_455676 ) ( ON ?auto_455674 ?auto_455677 ) ( ON ?auto_455678 ?auto_455674 ) ( ON ?auto_455680 ?auto_455678 ) ( ON ?auto_455679 ?auto_455680 ) ( ON ?auto_455681 ?auto_455679 ) ( not ( = ?auto_455675 ?auto_455676 ) ) ( not ( = ?auto_455675 ?auto_455677 ) ) ( not ( = ?auto_455675 ?auto_455674 ) ) ( not ( = ?auto_455675 ?auto_455678 ) ) ( not ( = ?auto_455675 ?auto_455680 ) ) ( not ( = ?auto_455675 ?auto_455679 ) ) ( not ( = ?auto_455675 ?auto_455681 ) ) ( not ( = ?auto_455675 ?auto_455682 ) ) ( not ( = ?auto_455675 ?auto_455683 ) ) ( not ( = ?auto_455675 ?auto_455684 ) ) ( not ( = ?auto_455676 ?auto_455677 ) ) ( not ( = ?auto_455676 ?auto_455674 ) ) ( not ( = ?auto_455676 ?auto_455678 ) ) ( not ( = ?auto_455676 ?auto_455680 ) ) ( not ( = ?auto_455676 ?auto_455679 ) ) ( not ( = ?auto_455676 ?auto_455681 ) ) ( not ( = ?auto_455676 ?auto_455682 ) ) ( not ( = ?auto_455676 ?auto_455683 ) ) ( not ( = ?auto_455676 ?auto_455684 ) ) ( not ( = ?auto_455677 ?auto_455674 ) ) ( not ( = ?auto_455677 ?auto_455678 ) ) ( not ( = ?auto_455677 ?auto_455680 ) ) ( not ( = ?auto_455677 ?auto_455679 ) ) ( not ( = ?auto_455677 ?auto_455681 ) ) ( not ( = ?auto_455677 ?auto_455682 ) ) ( not ( = ?auto_455677 ?auto_455683 ) ) ( not ( = ?auto_455677 ?auto_455684 ) ) ( not ( = ?auto_455674 ?auto_455678 ) ) ( not ( = ?auto_455674 ?auto_455680 ) ) ( not ( = ?auto_455674 ?auto_455679 ) ) ( not ( = ?auto_455674 ?auto_455681 ) ) ( not ( = ?auto_455674 ?auto_455682 ) ) ( not ( = ?auto_455674 ?auto_455683 ) ) ( not ( = ?auto_455674 ?auto_455684 ) ) ( not ( = ?auto_455678 ?auto_455680 ) ) ( not ( = ?auto_455678 ?auto_455679 ) ) ( not ( = ?auto_455678 ?auto_455681 ) ) ( not ( = ?auto_455678 ?auto_455682 ) ) ( not ( = ?auto_455678 ?auto_455683 ) ) ( not ( = ?auto_455678 ?auto_455684 ) ) ( not ( = ?auto_455680 ?auto_455679 ) ) ( not ( = ?auto_455680 ?auto_455681 ) ) ( not ( = ?auto_455680 ?auto_455682 ) ) ( not ( = ?auto_455680 ?auto_455683 ) ) ( not ( = ?auto_455680 ?auto_455684 ) ) ( not ( = ?auto_455679 ?auto_455681 ) ) ( not ( = ?auto_455679 ?auto_455682 ) ) ( not ( = ?auto_455679 ?auto_455683 ) ) ( not ( = ?auto_455679 ?auto_455684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455681 ?auto_455682 ?auto_455683 )
      ( MAKE-9CRATE-VERIFY ?auto_455675 ?auto_455676 ?auto_455677 ?auto_455674 ?auto_455678 ?auto_455680 ?auto_455679 ?auto_455681 ?auto_455682 ?auto_455683 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455784 - SURFACE
      ?auto_455785 - SURFACE
      ?auto_455786 - SURFACE
      ?auto_455783 - SURFACE
      ?auto_455787 - SURFACE
      ?auto_455789 - SURFACE
      ?auto_455788 - SURFACE
      ?auto_455790 - SURFACE
      ?auto_455791 - SURFACE
      ?auto_455792 - SURFACE
    )
    :vars
    (
      ?auto_455797 - HOIST
      ?auto_455795 - PLACE
      ?auto_455796 - PLACE
      ?auto_455798 - HOIST
      ?auto_455794 - SURFACE
      ?auto_455793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_455797 ?auto_455795 ) ( SURFACE-AT ?auto_455791 ?auto_455795 ) ( CLEAR ?auto_455791 ) ( IS-CRATE ?auto_455792 ) ( not ( = ?auto_455791 ?auto_455792 ) ) ( AVAILABLE ?auto_455797 ) ( ON ?auto_455791 ?auto_455790 ) ( not ( = ?auto_455790 ?auto_455791 ) ) ( not ( = ?auto_455790 ?auto_455792 ) ) ( not ( = ?auto_455796 ?auto_455795 ) ) ( HOIST-AT ?auto_455798 ?auto_455796 ) ( not ( = ?auto_455797 ?auto_455798 ) ) ( AVAILABLE ?auto_455798 ) ( SURFACE-AT ?auto_455792 ?auto_455796 ) ( ON ?auto_455792 ?auto_455794 ) ( CLEAR ?auto_455792 ) ( not ( = ?auto_455791 ?auto_455794 ) ) ( not ( = ?auto_455792 ?auto_455794 ) ) ( not ( = ?auto_455790 ?auto_455794 ) ) ( TRUCK-AT ?auto_455793 ?auto_455795 ) ( ON ?auto_455785 ?auto_455784 ) ( ON ?auto_455786 ?auto_455785 ) ( ON ?auto_455783 ?auto_455786 ) ( ON ?auto_455787 ?auto_455783 ) ( ON ?auto_455789 ?auto_455787 ) ( ON ?auto_455788 ?auto_455789 ) ( ON ?auto_455790 ?auto_455788 ) ( not ( = ?auto_455784 ?auto_455785 ) ) ( not ( = ?auto_455784 ?auto_455786 ) ) ( not ( = ?auto_455784 ?auto_455783 ) ) ( not ( = ?auto_455784 ?auto_455787 ) ) ( not ( = ?auto_455784 ?auto_455789 ) ) ( not ( = ?auto_455784 ?auto_455788 ) ) ( not ( = ?auto_455784 ?auto_455790 ) ) ( not ( = ?auto_455784 ?auto_455791 ) ) ( not ( = ?auto_455784 ?auto_455792 ) ) ( not ( = ?auto_455784 ?auto_455794 ) ) ( not ( = ?auto_455785 ?auto_455786 ) ) ( not ( = ?auto_455785 ?auto_455783 ) ) ( not ( = ?auto_455785 ?auto_455787 ) ) ( not ( = ?auto_455785 ?auto_455789 ) ) ( not ( = ?auto_455785 ?auto_455788 ) ) ( not ( = ?auto_455785 ?auto_455790 ) ) ( not ( = ?auto_455785 ?auto_455791 ) ) ( not ( = ?auto_455785 ?auto_455792 ) ) ( not ( = ?auto_455785 ?auto_455794 ) ) ( not ( = ?auto_455786 ?auto_455783 ) ) ( not ( = ?auto_455786 ?auto_455787 ) ) ( not ( = ?auto_455786 ?auto_455789 ) ) ( not ( = ?auto_455786 ?auto_455788 ) ) ( not ( = ?auto_455786 ?auto_455790 ) ) ( not ( = ?auto_455786 ?auto_455791 ) ) ( not ( = ?auto_455786 ?auto_455792 ) ) ( not ( = ?auto_455786 ?auto_455794 ) ) ( not ( = ?auto_455783 ?auto_455787 ) ) ( not ( = ?auto_455783 ?auto_455789 ) ) ( not ( = ?auto_455783 ?auto_455788 ) ) ( not ( = ?auto_455783 ?auto_455790 ) ) ( not ( = ?auto_455783 ?auto_455791 ) ) ( not ( = ?auto_455783 ?auto_455792 ) ) ( not ( = ?auto_455783 ?auto_455794 ) ) ( not ( = ?auto_455787 ?auto_455789 ) ) ( not ( = ?auto_455787 ?auto_455788 ) ) ( not ( = ?auto_455787 ?auto_455790 ) ) ( not ( = ?auto_455787 ?auto_455791 ) ) ( not ( = ?auto_455787 ?auto_455792 ) ) ( not ( = ?auto_455787 ?auto_455794 ) ) ( not ( = ?auto_455789 ?auto_455788 ) ) ( not ( = ?auto_455789 ?auto_455790 ) ) ( not ( = ?auto_455789 ?auto_455791 ) ) ( not ( = ?auto_455789 ?auto_455792 ) ) ( not ( = ?auto_455789 ?auto_455794 ) ) ( not ( = ?auto_455788 ?auto_455790 ) ) ( not ( = ?auto_455788 ?auto_455791 ) ) ( not ( = ?auto_455788 ?auto_455792 ) ) ( not ( = ?auto_455788 ?auto_455794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455790 ?auto_455791 ?auto_455792 )
      ( MAKE-9CRATE-VERIFY ?auto_455784 ?auto_455785 ?auto_455786 ?auto_455783 ?auto_455787 ?auto_455789 ?auto_455788 ?auto_455790 ?auto_455791 ?auto_455792 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_455893 - SURFACE
      ?auto_455894 - SURFACE
      ?auto_455895 - SURFACE
      ?auto_455892 - SURFACE
      ?auto_455896 - SURFACE
      ?auto_455898 - SURFACE
      ?auto_455897 - SURFACE
      ?auto_455899 - SURFACE
      ?auto_455900 - SURFACE
      ?auto_455901 - SURFACE
    )
    :vars
    (
      ?auto_455905 - HOIST
      ?auto_455902 - PLACE
      ?auto_455906 - PLACE
      ?auto_455907 - HOIST
      ?auto_455903 - SURFACE
      ?auto_455904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_455905 ?auto_455902 ) ( IS-CRATE ?auto_455901 ) ( not ( = ?auto_455900 ?auto_455901 ) ) ( not ( = ?auto_455899 ?auto_455900 ) ) ( not ( = ?auto_455899 ?auto_455901 ) ) ( not ( = ?auto_455906 ?auto_455902 ) ) ( HOIST-AT ?auto_455907 ?auto_455906 ) ( not ( = ?auto_455905 ?auto_455907 ) ) ( AVAILABLE ?auto_455907 ) ( SURFACE-AT ?auto_455901 ?auto_455906 ) ( ON ?auto_455901 ?auto_455903 ) ( CLEAR ?auto_455901 ) ( not ( = ?auto_455900 ?auto_455903 ) ) ( not ( = ?auto_455901 ?auto_455903 ) ) ( not ( = ?auto_455899 ?auto_455903 ) ) ( TRUCK-AT ?auto_455904 ?auto_455902 ) ( SURFACE-AT ?auto_455899 ?auto_455902 ) ( CLEAR ?auto_455899 ) ( LIFTING ?auto_455905 ?auto_455900 ) ( IS-CRATE ?auto_455900 ) ( ON ?auto_455894 ?auto_455893 ) ( ON ?auto_455895 ?auto_455894 ) ( ON ?auto_455892 ?auto_455895 ) ( ON ?auto_455896 ?auto_455892 ) ( ON ?auto_455898 ?auto_455896 ) ( ON ?auto_455897 ?auto_455898 ) ( ON ?auto_455899 ?auto_455897 ) ( not ( = ?auto_455893 ?auto_455894 ) ) ( not ( = ?auto_455893 ?auto_455895 ) ) ( not ( = ?auto_455893 ?auto_455892 ) ) ( not ( = ?auto_455893 ?auto_455896 ) ) ( not ( = ?auto_455893 ?auto_455898 ) ) ( not ( = ?auto_455893 ?auto_455897 ) ) ( not ( = ?auto_455893 ?auto_455899 ) ) ( not ( = ?auto_455893 ?auto_455900 ) ) ( not ( = ?auto_455893 ?auto_455901 ) ) ( not ( = ?auto_455893 ?auto_455903 ) ) ( not ( = ?auto_455894 ?auto_455895 ) ) ( not ( = ?auto_455894 ?auto_455892 ) ) ( not ( = ?auto_455894 ?auto_455896 ) ) ( not ( = ?auto_455894 ?auto_455898 ) ) ( not ( = ?auto_455894 ?auto_455897 ) ) ( not ( = ?auto_455894 ?auto_455899 ) ) ( not ( = ?auto_455894 ?auto_455900 ) ) ( not ( = ?auto_455894 ?auto_455901 ) ) ( not ( = ?auto_455894 ?auto_455903 ) ) ( not ( = ?auto_455895 ?auto_455892 ) ) ( not ( = ?auto_455895 ?auto_455896 ) ) ( not ( = ?auto_455895 ?auto_455898 ) ) ( not ( = ?auto_455895 ?auto_455897 ) ) ( not ( = ?auto_455895 ?auto_455899 ) ) ( not ( = ?auto_455895 ?auto_455900 ) ) ( not ( = ?auto_455895 ?auto_455901 ) ) ( not ( = ?auto_455895 ?auto_455903 ) ) ( not ( = ?auto_455892 ?auto_455896 ) ) ( not ( = ?auto_455892 ?auto_455898 ) ) ( not ( = ?auto_455892 ?auto_455897 ) ) ( not ( = ?auto_455892 ?auto_455899 ) ) ( not ( = ?auto_455892 ?auto_455900 ) ) ( not ( = ?auto_455892 ?auto_455901 ) ) ( not ( = ?auto_455892 ?auto_455903 ) ) ( not ( = ?auto_455896 ?auto_455898 ) ) ( not ( = ?auto_455896 ?auto_455897 ) ) ( not ( = ?auto_455896 ?auto_455899 ) ) ( not ( = ?auto_455896 ?auto_455900 ) ) ( not ( = ?auto_455896 ?auto_455901 ) ) ( not ( = ?auto_455896 ?auto_455903 ) ) ( not ( = ?auto_455898 ?auto_455897 ) ) ( not ( = ?auto_455898 ?auto_455899 ) ) ( not ( = ?auto_455898 ?auto_455900 ) ) ( not ( = ?auto_455898 ?auto_455901 ) ) ( not ( = ?auto_455898 ?auto_455903 ) ) ( not ( = ?auto_455897 ?auto_455899 ) ) ( not ( = ?auto_455897 ?auto_455900 ) ) ( not ( = ?auto_455897 ?auto_455901 ) ) ( not ( = ?auto_455897 ?auto_455903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_455899 ?auto_455900 ?auto_455901 )
      ( MAKE-9CRATE-VERIFY ?auto_455893 ?auto_455894 ?auto_455895 ?auto_455892 ?auto_455896 ?auto_455898 ?auto_455897 ?auto_455899 ?auto_455900 ?auto_455901 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_456002 - SURFACE
      ?auto_456003 - SURFACE
      ?auto_456004 - SURFACE
      ?auto_456001 - SURFACE
      ?auto_456005 - SURFACE
      ?auto_456007 - SURFACE
      ?auto_456006 - SURFACE
      ?auto_456008 - SURFACE
      ?auto_456009 - SURFACE
      ?auto_456010 - SURFACE
    )
    :vars
    (
      ?auto_456012 - HOIST
      ?auto_456011 - PLACE
      ?auto_456013 - PLACE
      ?auto_456016 - HOIST
      ?auto_456014 - SURFACE
      ?auto_456015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_456012 ?auto_456011 ) ( IS-CRATE ?auto_456010 ) ( not ( = ?auto_456009 ?auto_456010 ) ) ( not ( = ?auto_456008 ?auto_456009 ) ) ( not ( = ?auto_456008 ?auto_456010 ) ) ( not ( = ?auto_456013 ?auto_456011 ) ) ( HOIST-AT ?auto_456016 ?auto_456013 ) ( not ( = ?auto_456012 ?auto_456016 ) ) ( AVAILABLE ?auto_456016 ) ( SURFACE-AT ?auto_456010 ?auto_456013 ) ( ON ?auto_456010 ?auto_456014 ) ( CLEAR ?auto_456010 ) ( not ( = ?auto_456009 ?auto_456014 ) ) ( not ( = ?auto_456010 ?auto_456014 ) ) ( not ( = ?auto_456008 ?auto_456014 ) ) ( TRUCK-AT ?auto_456015 ?auto_456011 ) ( SURFACE-AT ?auto_456008 ?auto_456011 ) ( CLEAR ?auto_456008 ) ( IS-CRATE ?auto_456009 ) ( AVAILABLE ?auto_456012 ) ( IN ?auto_456009 ?auto_456015 ) ( ON ?auto_456003 ?auto_456002 ) ( ON ?auto_456004 ?auto_456003 ) ( ON ?auto_456001 ?auto_456004 ) ( ON ?auto_456005 ?auto_456001 ) ( ON ?auto_456007 ?auto_456005 ) ( ON ?auto_456006 ?auto_456007 ) ( ON ?auto_456008 ?auto_456006 ) ( not ( = ?auto_456002 ?auto_456003 ) ) ( not ( = ?auto_456002 ?auto_456004 ) ) ( not ( = ?auto_456002 ?auto_456001 ) ) ( not ( = ?auto_456002 ?auto_456005 ) ) ( not ( = ?auto_456002 ?auto_456007 ) ) ( not ( = ?auto_456002 ?auto_456006 ) ) ( not ( = ?auto_456002 ?auto_456008 ) ) ( not ( = ?auto_456002 ?auto_456009 ) ) ( not ( = ?auto_456002 ?auto_456010 ) ) ( not ( = ?auto_456002 ?auto_456014 ) ) ( not ( = ?auto_456003 ?auto_456004 ) ) ( not ( = ?auto_456003 ?auto_456001 ) ) ( not ( = ?auto_456003 ?auto_456005 ) ) ( not ( = ?auto_456003 ?auto_456007 ) ) ( not ( = ?auto_456003 ?auto_456006 ) ) ( not ( = ?auto_456003 ?auto_456008 ) ) ( not ( = ?auto_456003 ?auto_456009 ) ) ( not ( = ?auto_456003 ?auto_456010 ) ) ( not ( = ?auto_456003 ?auto_456014 ) ) ( not ( = ?auto_456004 ?auto_456001 ) ) ( not ( = ?auto_456004 ?auto_456005 ) ) ( not ( = ?auto_456004 ?auto_456007 ) ) ( not ( = ?auto_456004 ?auto_456006 ) ) ( not ( = ?auto_456004 ?auto_456008 ) ) ( not ( = ?auto_456004 ?auto_456009 ) ) ( not ( = ?auto_456004 ?auto_456010 ) ) ( not ( = ?auto_456004 ?auto_456014 ) ) ( not ( = ?auto_456001 ?auto_456005 ) ) ( not ( = ?auto_456001 ?auto_456007 ) ) ( not ( = ?auto_456001 ?auto_456006 ) ) ( not ( = ?auto_456001 ?auto_456008 ) ) ( not ( = ?auto_456001 ?auto_456009 ) ) ( not ( = ?auto_456001 ?auto_456010 ) ) ( not ( = ?auto_456001 ?auto_456014 ) ) ( not ( = ?auto_456005 ?auto_456007 ) ) ( not ( = ?auto_456005 ?auto_456006 ) ) ( not ( = ?auto_456005 ?auto_456008 ) ) ( not ( = ?auto_456005 ?auto_456009 ) ) ( not ( = ?auto_456005 ?auto_456010 ) ) ( not ( = ?auto_456005 ?auto_456014 ) ) ( not ( = ?auto_456007 ?auto_456006 ) ) ( not ( = ?auto_456007 ?auto_456008 ) ) ( not ( = ?auto_456007 ?auto_456009 ) ) ( not ( = ?auto_456007 ?auto_456010 ) ) ( not ( = ?auto_456007 ?auto_456014 ) ) ( not ( = ?auto_456006 ?auto_456008 ) ) ( not ( = ?auto_456006 ?auto_456009 ) ) ( not ( = ?auto_456006 ?auto_456010 ) ) ( not ( = ?auto_456006 ?auto_456014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_456008 ?auto_456009 ?auto_456010 )
      ( MAKE-9CRATE-VERIFY ?auto_456002 ?auto_456003 ?auto_456004 ?auto_456001 ?auto_456005 ?auto_456007 ?auto_456006 ?auto_456008 ?auto_456009 ?auto_456010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_458943 - SURFACE
      ?auto_458944 - SURFACE
    )
    :vars
    (
      ?auto_458945 - HOIST
      ?auto_458948 - PLACE
      ?auto_458950 - SURFACE
      ?auto_458947 - TRUCK
      ?auto_458951 - PLACE
      ?auto_458946 - HOIST
      ?auto_458949 - SURFACE
      ?auto_458952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_458945 ?auto_458948 ) ( SURFACE-AT ?auto_458943 ?auto_458948 ) ( CLEAR ?auto_458943 ) ( IS-CRATE ?auto_458944 ) ( not ( = ?auto_458943 ?auto_458944 ) ) ( AVAILABLE ?auto_458945 ) ( ON ?auto_458943 ?auto_458950 ) ( not ( = ?auto_458950 ?auto_458943 ) ) ( not ( = ?auto_458950 ?auto_458944 ) ) ( TRUCK-AT ?auto_458947 ?auto_458951 ) ( not ( = ?auto_458951 ?auto_458948 ) ) ( HOIST-AT ?auto_458946 ?auto_458951 ) ( not ( = ?auto_458945 ?auto_458946 ) ) ( SURFACE-AT ?auto_458944 ?auto_458951 ) ( ON ?auto_458944 ?auto_458949 ) ( CLEAR ?auto_458944 ) ( not ( = ?auto_458943 ?auto_458949 ) ) ( not ( = ?auto_458944 ?auto_458949 ) ) ( not ( = ?auto_458950 ?auto_458949 ) ) ( LIFTING ?auto_458946 ?auto_458952 ) ( IS-CRATE ?auto_458952 ) ( not ( = ?auto_458943 ?auto_458952 ) ) ( not ( = ?auto_458944 ?auto_458952 ) ) ( not ( = ?auto_458950 ?auto_458952 ) ) ( not ( = ?auto_458949 ?auto_458952 ) ) )
    :subtasks
    ( ( !LOAD ?auto_458946 ?auto_458952 ?auto_458947 ?auto_458951 )
      ( MAKE-1CRATE ?auto_458943 ?auto_458944 )
      ( MAKE-1CRATE-VERIFY ?auto_458943 ?auto_458944 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461515 - SURFACE
      ?auto_461516 - SURFACE
      ?auto_461517 - SURFACE
      ?auto_461514 - SURFACE
      ?auto_461518 - SURFACE
      ?auto_461520 - SURFACE
      ?auto_461519 - SURFACE
      ?auto_461521 - SURFACE
      ?auto_461522 - SURFACE
      ?auto_461523 - SURFACE
      ?auto_461524 - SURFACE
    )
    :vars
    (
      ?auto_461526 - HOIST
      ?auto_461525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461526 ?auto_461525 ) ( SURFACE-AT ?auto_461523 ?auto_461525 ) ( CLEAR ?auto_461523 ) ( LIFTING ?auto_461526 ?auto_461524 ) ( IS-CRATE ?auto_461524 ) ( not ( = ?auto_461523 ?auto_461524 ) ) ( ON ?auto_461516 ?auto_461515 ) ( ON ?auto_461517 ?auto_461516 ) ( ON ?auto_461514 ?auto_461517 ) ( ON ?auto_461518 ?auto_461514 ) ( ON ?auto_461520 ?auto_461518 ) ( ON ?auto_461519 ?auto_461520 ) ( ON ?auto_461521 ?auto_461519 ) ( ON ?auto_461522 ?auto_461521 ) ( ON ?auto_461523 ?auto_461522 ) ( not ( = ?auto_461515 ?auto_461516 ) ) ( not ( = ?auto_461515 ?auto_461517 ) ) ( not ( = ?auto_461515 ?auto_461514 ) ) ( not ( = ?auto_461515 ?auto_461518 ) ) ( not ( = ?auto_461515 ?auto_461520 ) ) ( not ( = ?auto_461515 ?auto_461519 ) ) ( not ( = ?auto_461515 ?auto_461521 ) ) ( not ( = ?auto_461515 ?auto_461522 ) ) ( not ( = ?auto_461515 ?auto_461523 ) ) ( not ( = ?auto_461515 ?auto_461524 ) ) ( not ( = ?auto_461516 ?auto_461517 ) ) ( not ( = ?auto_461516 ?auto_461514 ) ) ( not ( = ?auto_461516 ?auto_461518 ) ) ( not ( = ?auto_461516 ?auto_461520 ) ) ( not ( = ?auto_461516 ?auto_461519 ) ) ( not ( = ?auto_461516 ?auto_461521 ) ) ( not ( = ?auto_461516 ?auto_461522 ) ) ( not ( = ?auto_461516 ?auto_461523 ) ) ( not ( = ?auto_461516 ?auto_461524 ) ) ( not ( = ?auto_461517 ?auto_461514 ) ) ( not ( = ?auto_461517 ?auto_461518 ) ) ( not ( = ?auto_461517 ?auto_461520 ) ) ( not ( = ?auto_461517 ?auto_461519 ) ) ( not ( = ?auto_461517 ?auto_461521 ) ) ( not ( = ?auto_461517 ?auto_461522 ) ) ( not ( = ?auto_461517 ?auto_461523 ) ) ( not ( = ?auto_461517 ?auto_461524 ) ) ( not ( = ?auto_461514 ?auto_461518 ) ) ( not ( = ?auto_461514 ?auto_461520 ) ) ( not ( = ?auto_461514 ?auto_461519 ) ) ( not ( = ?auto_461514 ?auto_461521 ) ) ( not ( = ?auto_461514 ?auto_461522 ) ) ( not ( = ?auto_461514 ?auto_461523 ) ) ( not ( = ?auto_461514 ?auto_461524 ) ) ( not ( = ?auto_461518 ?auto_461520 ) ) ( not ( = ?auto_461518 ?auto_461519 ) ) ( not ( = ?auto_461518 ?auto_461521 ) ) ( not ( = ?auto_461518 ?auto_461522 ) ) ( not ( = ?auto_461518 ?auto_461523 ) ) ( not ( = ?auto_461518 ?auto_461524 ) ) ( not ( = ?auto_461520 ?auto_461519 ) ) ( not ( = ?auto_461520 ?auto_461521 ) ) ( not ( = ?auto_461520 ?auto_461522 ) ) ( not ( = ?auto_461520 ?auto_461523 ) ) ( not ( = ?auto_461520 ?auto_461524 ) ) ( not ( = ?auto_461519 ?auto_461521 ) ) ( not ( = ?auto_461519 ?auto_461522 ) ) ( not ( = ?auto_461519 ?auto_461523 ) ) ( not ( = ?auto_461519 ?auto_461524 ) ) ( not ( = ?auto_461521 ?auto_461522 ) ) ( not ( = ?auto_461521 ?auto_461523 ) ) ( not ( = ?auto_461521 ?auto_461524 ) ) ( not ( = ?auto_461522 ?auto_461523 ) ) ( not ( = ?auto_461522 ?auto_461524 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_461523 ?auto_461524 )
      ( MAKE-10CRATE-VERIFY ?auto_461515 ?auto_461516 ?auto_461517 ?auto_461514 ?auto_461518 ?auto_461520 ?auto_461519 ?auto_461521 ?auto_461522 ?auto_461523 ?auto_461524 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461609 - SURFACE
      ?auto_461610 - SURFACE
      ?auto_461611 - SURFACE
      ?auto_461608 - SURFACE
      ?auto_461612 - SURFACE
      ?auto_461614 - SURFACE
      ?auto_461613 - SURFACE
      ?auto_461615 - SURFACE
      ?auto_461616 - SURFACE
      ?auto_461617 - SURFACE
      ?auto_461618 - SURFACE
    )
    :vars
    (
      ?auto_461621 - HOIST
      ?auto_461619 - PLACE
      ?auto_461620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461621 ?auto_461619 ) ( SURFACE-AT ?auto_461617 ?auto_461619 ) ( CLEAR ?auto_461617 ) ( IS-CRATE ?auto_461618 ) ( not ( = ?auto_461617 ?auto_461618 ) ) ( TRUCK-AT ?auto_461620 ?auto_461619 ) ( AVAILABLE ?auto_461621 ) ( IN ?auto_461618 ?auto_461620 ) ( ON ?auto_461617 ?auto_461616 ) ( not ( = ?auto_461616 ?auto_461617 ) ) ( not ( = ?auto_461616 ?auto_461618 ) ) ( ON ?auto_461610 ?auto_461609 ) ( ON ?auto_461611 ?auto_461610 ) ( ON ?auto_461608 ?auto_461611 ) ( ON ?auto_461612 ?auto_461608 ) ( ON ?auto_461614 ?auto_461612 ) ( ON ?auto_461613 ?auto_461614 ) ( ON ?auto_461615 ?auto_461613 ) ( ON ?auto_461616 ?auto_461615 ) ( not ( = ?auto_461609 ?auto_461610 ) ) ( not ( = ?auto_461609 ?auto_461611 ) ) ( not ( = ?auto_461609 ?auto_461608 ) ) ( not ( = ?auto_461609 ?auto_461612 ) ) ( not ( = ?auto_461609 ?auto_461614 ) ) ( not ( = ?auto_461609 ?auto_461613 ) ) ( not ( = ?auto_461609 ?auto_461615 ) ) ( not ( = ?auto_461609 ?auto_461616 ) ) ( not ( = ?auto_461609 ?auto_461617 ) ) ( not ( = ?auto_461609 ?auto_461618 ) ) ( not ( = ?auto_461610 ?auto_461611 ) ) ( not ( = ?auto_461610 ?auto_461608 ) ) ( not ( = ?auto_461610 ?auto_461612 ) ) ( not ( = ?auto_461610 ?auto_461614 ) ) ( not ( = ?auto_461610 ?auto_461613 ) ) ( not ( = ?auto_461610 ?auto_461615 ) ) ( not ( = ?auto_461610 ?auto_461616 ) ) ( not ( = ?auto_461610 ?auto_461617 ) ) ( not ( = ?auto_461610 ?auto_461618 ) ) ( not ( = ?auto_461611 ?auto_461608 ) ) ( not ( = ?auto_461611 ?auto_461612 ) ) ( not ( = ?auto_461611 ?auto_461614 ) ) ( not ( = ?auto_461611 ?auto_461613 ) ) ( not ( = ?auto_461611 ?auto_461615 ) ) ( not ( = ?auto_461611 ?auto_461616 ) ) ( not ( = ?auto_461611 ?auto_461617 ) ) ( not ( = ?auto_461611 ?auto_461618 ) ) ( not ( = ?auto_461608 ?auto_461612 ) ) ( not ( = ?auto_461608 ?auto_461614 ) ) ( not ( = ?auto_461608 ?auto_461613 ) ) ( not ( = ?auto_461608 ?auto_461615 ) ) ( not ( = ?auto_461608 ?auto_461616 ) ) ( not ( = ?auto_461608 ?auto_461617 ) ) ( not ( = ?auto_461608 ?auto_461618 ) ) ( not ( = ?auto_461612 ?auto_461614 ) ) ( not ( = ?auto_461612 ?auto_461613 ) ) ( not ( = ?auto_461612 ?auto_461615 ) ) ( not ( = ?auto_461612 ?auto_461616 ) ) ( not ( = ?auto_461612 ?auto_461617 ) ) ( not ( = ?auto_461612 ?auto_461618 ) ) ( not ( = ?auto_461614 ?auto_461613 ) ) ( not ( = ?auto_461614 ?auto_461615 ) ) ( not ( = ?auto_461614 ?auto_461616 ) ) ( not ( = ?auto_461614 ?auto_461617 ) ) ( not ( = ?auto_461614 ?auto_461618 ) ) ( not ( = ?auto_461613 ?auto_461615 ) ) ( not ( = ?auto_461613 ?auto_461616 ) ) ( not ( = ?auto_461613 ?auto_461617 ) ) ( not ( = ?auto_461613 ?auto_461618 ) ) ( not ( = ?auto_461615 ?auto_461616 ) ) ( not ( = ?auto_461615 ?auto_461617 ) ) ( not ( = ?auto_461615 ?auto_461618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461616 ?auto_461617 ?auto_461618 )
      ( MAKE-10CRATE-VERIFY ?auto_461609 ?auto_461610 ?auto_461611 ?auto_461608 ?auto_461612 ?auto_461614 ?auto_461613 ?auto_461615 ?auto_461616 ?auto_461617 ?auto_461618 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461714 - SURFACE
      ?auto_461715 - SURFACE
      ?auto_461716 - SURFACE
      ?auto_461713 - SURFACE
      ?auto_461717 - SURFACE
      ?auto_461719 - SURFACE
      ?auto_461718 - SURFACE
      ?auto_461720 - SURFACE
      ?auto_461721 - SURFACE
      ?auto_461722 - SURFACE
      ?auto_461723 - SURFACE
    )
    :vars
    (
      ?auto_461727 - HOIST
      ?auto_461724 - PLACE
      ?auto_461725 - TRUCK
      ?auto_461726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461727 ?auto_461724 ) ( SURFACE-AT ?auto_461722 ?auto_461724 ) ( CLEAR ?auto_461722 ) ( IS-CRATE ?auto_461723 ) ( not ( = ?auto_461722 ?auto_461723 ) ) ( AVAILABLE ?auto_461727 ) ( IN ?auto_461723 ?auto_461725 ) ( ON ?auto_461722 ?auto_461721 ) ( not ( = ?auto_461721 ?auto_461722 ) ) ( not ( = ?auto_461721 ?auto_461723 ) ) ( TRUCK-AT ?auto_461725 ?auto_461726 ) ( not ( = ?auto_461726 ?auto_461724 ) ) ( ON ?auto_461715 ?auto_461714 ) ( ON ?auto_461716 ?auto_461715 ) ( ON ?auto_461713 ?auto_461716 ) ( ON ?auto_461717 ?auto_461713 ) ( ON ?auto_461719 ?auto_461717 ) ( ON ?auto_461718 ?auto_461719 ) ( ON ?auto_461720 ?auto_461718 ) ( ON ?auto_461721 ?auto_461720 ) ( not ( = ?auto_461714 ?auto_461715 ) ) ( not ( = ?auto_461714 ?auto_461716 ) ) ( not ( = ?auto_461714 ?auto_461713 ) ) ( not ( = ?auto_461714 ?auto_461717 ) ) ( not ( = ?auto_461714 ?auto_461719 ) ) ( not ( = ?auto_461714 ?auto_461718 ) ) ( not ( = ?auto_461714 ?auto_461720 ) ) ( not ( = ?auto_461714 ?auto_461721 ) ) ( not ( = ?auto_461714 ?auto_461722 ) ) ( not ( = ?auto_461714 ?auto_461723 ) ) ( not ( = ?auto_461715 ?auto_461716 ) ) ( not ( = ?auto_461715 ?auto_461713 ) ) ( not ( = ?auto_461715 ?auto_461717 ) ) ( not ( = ?auto_461715 ?auto_461719 ) ) ( not ( = ?auto_461715 ?auto_461718 ) ) ( not ( = ?auto_461715 ?auto_461720 ) ) ( not ( = ?auto_461715 ?auto_461721 ) ) ( not ( = ?auto_461715 ?auto_461722 ) ) ( not ( = ?auto_461715 ?auto_461723 ) ) ( not ( = ?auto_461716 ?auto_461713 ) ) ( not ( = ?auto_461716 ?auto_461717 ) ) ( not ( = ?auto_461716 ?auto_461719 ) ) ( not ( = ?auto_461716 ?auto_461718 ) ) ( not ( = ?auto_461716 ?auto_461720 ) ) ( not ( = ?auto_461716 ?auto_461721 ) ) ( not ( = ?auto_461716 ?auto_461722 ) ) ( not ( = ?auto_461716 ?auto_461723 ) ) ( not ( = ?auto_461713 ?auto_461717 ) ) ( not ( = ?auto_461713 ?auto_461719 ) ) ( not ( = ?auto_461713 ?auto_461718 ) ) ( not ( = ?auto_461713 ?auto_461720 ) ) ( not ( = ?auto_461713 ?auto_461721 ) ) ( not ( = ?auto_461713 ?auto_461722 ) ) ( not ( = ?auto_461713 ?auto_461723 ) ) ( not ( = ?auto_461717 ?auto_461719 ) ) ( not ( = ?auto_461717 ?auto_461718 ) ) ( not ( = ?auto_461717 ?auto_461720 ) ) ( not ( = ?auto_461717 ?auto_461721 ) ) ( not ( = ?auto_461717 ?auto_461722 ) ) ( not ( = ?auto_461717 ?auto_461723 ) ) ( not ( = ?auto_461719 ?auto_461718 ) ) ( not ( = ?auto_461719 ?auto_461720 ) ) ( not ( = ?auto_461719 ?auto_461721 ) ) ( not ( = ?auto_461719 ?auto_461722 ) ) ( not ( = ?auto_461719 ?auto_461723 ) ) ( not ( = ?auto_461718 ?auto_461720 ) ) ( not ( = ?auto_461718 ?auto_461721 ) ) ( not ( = ?auto_461718 ?auto_461722 ) ) ( not ( = ?auto_461718 ?auto_461723 ) ) ( not ( = ?auto_461720 ?auto_461721 ) ) ( not ( = ?auto_461720 ?auto_461722 ) ) ( not ( = ?auto_461720 ?auto_461723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461721 ?auto_461722 ?auto_461723 )
      ( MAKE-10CRATE-VERIFY ?auto_461714 ?auto_461715 ?auto_461716 ?auto_461713 ?auto_461717 ?auto_461719 ?auto_461718 ?auto_461720 ?auto_461721 ?auto_461722 ?auto_461723 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461829 - SURFACE
      ?auto_461830 - SURFACE
      ?auto_461831 - SURFACE
      ?auto_461828 - SURFACE
      ?auto_461832 - SURFACE
      ?auto_461834 - SURFACE
      ?auto_461833 - SURFACE
      ?auto_461835 - SURFACE
      ?auto_461836 - SURFACE
      ?auto_461837 - SURFACE
      ?auto_461838 - SURFACE
    )
    :vars
    (
      ?auto_461841 - HOIST
      ?auto_461839 - PLACE
      ?auto_461840 - TRUCK
      ?auto_461843 - PLACE
      ?auto_461842 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_461841 ?auto_461839 ) ( SURFACE-AT ?auto_461837 ?auto_461839 ) ( CLEAR ?auto_461837 ) ( IS-CRATE ?auto_461838 ) ( not ( = ?auto_461837 ?auto_461838 ) ) ( AVAILABLE ?auto_461841 ) ( ON ?auto_461837 ?auto_461836 ) ( not ( = ?auto_461836 ?auto_461837 ) ) ( not ( = ?auto_461836 ?auto_461838 ) ) ( TRUCK-AT ?auto_461840 ?auto_461843 ) ( not ( = ?auto_461843 ?auto_461839 ) ) ( HOIST-AT ?auto_461842 ?auto_461843 ) ( LIFTING ?auto_461842 ?auto_461838 ) ( not ( = ?auto_461841 ?auto_461842 ) ) ( ON ?auto_461830 ?auto_461829 ) ( ON ?auto_461831 ?auto_461830 ) ( ON ?auto_461828 ?auto_461831 ) ( ON ?auto_461832 ?auto_461828 ) ( ON ?auto_461834 ?auto_461832 ) ( ON ?auto_461833 ?auto_461834 ) ( ON ?auto_461835 ?auto_461833 ) ( ON ?auto_461836 ?auto_461835 ) ( not ( = ?auto_461829 ?auto_461830 ) ) ( not ( = ?auto_461829 ?auto_461831 ) ) ( not ( = ?auto_461829 ?auto_461828 ) ) ( not ( = ?auto_461829 ?auto_461832 ) ) ( not ( = ?auto_461829 ?auto_461834 ) ) ( not ( = ?auto_461829 ?auto_461833 ) ) ( not ( = ?auto_461829 ?auto_461835 ) ) ( not ( = ?auto_461829 ?auto_461836 ) ) ( not ( = ?auto_461829 ?auto_461837 ) ) ( not ( = ?auto_461829 ?auto_461838 ) ) ( not ( = ?auto_461830 ?auto_461831 ) ) ( not ( = ?auto_461830 ?auto_461828 ) ) ( not ( = ?auto_461830 ?auto_461832 ) ) ( not ( = ?auto_461830 ?auto_461834 ) ) ( not ( = ?auto_461830 ?auto_461833 ) ) ( not ( = ?auto_461830 ?auto_461835 ) ) ( not ( = ?auto_461830 ?auto_461836 ) ) ( not ( = ?auto_461830 ?auto_461837 ) ) ( not ( = ?auto_461830 ?auto_461838 ) ) ( not ( = ?auto_461831 ?auto_461828 ) ) ( not ( = ?auto_461831 ?auto_461832 ) ) ( not ( = ?auto_461831 ?auto_461834 ) ) ( not ( = ?auto_461831 ?auto_461833 ) ) ( not ( = ?auto_461831 ?auto_461835 ) ) ( not ( = ?auto_461831 ?auto_461836 ) ) ( not ( = ?auto_461831 ?auto_461837 ) ) ( not ( = ?auto_461831 ?auto_461838 ) ) ( not ( = ?auto_461828 ?auto_461832 ) ) ( not ( = ?auto_461828 ?auto_461834 ) ) ( not ( = ?auto_461828 ?auto_461833 ) ) ( not ( = ?auto_461828 ?auto_461835 ) ) ( not ( = ?auto_461828 ?auto_461836 ) ) ( not ( = ?auto_461828 ?auto_461837 ) ) ( not ( = ?auto_461828 ?auto_461838 ) ) ( not ( = ?auto_461832 ?auto_461834 ) ) ( not ( = ?auto_461832 ?auto_461833 ) ) ( not ( = ?auto_461832 ?auto_461835 ) ) ( not ( = ?auto_461832 ?auto_461836 ) ) ( not ( = ?auto_461832 ?auto_461837 ) ) ( not ( = ?auto_461832 ?auto_461838 ) ) ( not ( = ?auto_461834 ?auto_461833 ) ) ( not ( = ?auto_461834 ?auto_461835 ) ) ( not ( = ?auto_461834 ?auto_461836 ) ) ( not ( = ?auto_461834 ?auto_461837 ) ) ( not ( = ?auto_461834 ?auto_461838 ) ) ( not ( = ?auto_461833 ?auto_461835 ) ) ( not ( = ?auto_461833 ?auto_461836 ) ) ( not ( = ?auto_461833 ?auto_461837 ) ) ( not ( = ?auto_461833 ?auto_461838 ) ) ( not ( = ?auto_461835 ?auto_461836 ) ) ( not ( = ?auto_461835 ?auto_461837 ) ) ( not ( = ?auto_461835 ?auto_461838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461836 ?auto_461837 ?auto_461838 )
      ( MAKE-10CRATE-VERIFY ?auto_461829 ?auto_461830 ?auto_461831 ?auto_461828 ?auto_461832 ?auto_461834 ?auto_461833 ?auto_461835 ?auto_461836 ?auto_461837 ?auto_461838 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461954 - SURFACE
      ?auto_461955 - SURFACE
      ?auto_461956 - SURFACE
      ?auto_461953 - SURFACE
      ?auto_461957 - SURFACE
      ?auto_461959 - SURFACE
      ?auto_461958 - SURFACE
      ?auto_461960 - SURFACE
      ?auto_461961 - SURFACE
      ?auto_461962 - SURFACE
      ?auto_461963 - SURFACE
    )
    :vars
    (
      ?auto_461965 - HOIST
      ?auto_461966 - PLACE
      ?auto_461964 - TRUCK
      ?auto_461969 - PLACE
      ?auto_461967 - HOIST
      ?auto_461968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461965 ?auto_461966 ) ( SURFACE-AT ?auto_461962 ?auto_461966 ) ( CLEAR ?auto_461962 ) ( IS-CRATE ?auto_461963 ) ( not ( = ?auto_461962 ?auto_461963 ) ) ( AVAILABLE ?auto_461965 ) ( ON ?auto_461962 ?auto_461961 ) ( not ( = ?auto_461961 ?auto_461962 ) ) ( not ( = ?auto_461961 ?auto_461963 ) ) ( TRUCK-AT ?auto_461964 ?auto_461969 ) ( not ( = ?auto_461969 ?auto_461966 ) ) ( HOIST-AT ?auto_461967 ?auto_461969 ) ( not ( = ?auto_461965 ?auto_461967 ) ) ( AVAILABLE ?auto_461967 ) ( SURFACE-AT ?auto_461963 ?auto_461969 ) ( ON ?auto_461963 ?auto_461968 ) ( CLEAR ?auto_461963 ) ( not ( = ?auto_461962 ?auto_461968 ) ) ( not ( = ?auto_461963 ?auto_461968 ) ) ( not ( = ?auto_461961 ?auto_461968 ) ) ( ON ?auto_461955 ?auto_461954 ) ( ON ?auto_461956 ?auto_461955 ) ( ON ?auto_461953 ?auto_461956 ) ( ON ?auto_461957 ?auto_461953 ) ( ON ?auto_461959 ?auto_461957 ) ( ON ?auto_461958 ?auto_461959 ) ( ON ?auto_461960 ?auto_461958 ) ( ON ?auto_461961 ?auto_461960 ) ( not ( = ?auto_461954 ?auto_461955 ) ) ( not ( = ?auto_461954 ?auto_461956 ) ) ( not ( = ?auto_461954 ?auto_461953 ) ) ( not ( = ?auto_461954 ?auto_461957 ) ) ( not ( = ?auto_461954 ?auto_461959 ) ) ( not ( = ?auto_461954 ?auto_461958 ) ) ( not ( = ?auto_461954 ?auto_461960 ) ) ( not ( = ?auto_461954 ?auto_461961 ) ) ( not ( = ?auto_461954 ?auto_461962 ) ) ( not ( = ?auto_461954 ?auto_461963 ) ) ( not ( = ?auto_461954 ?auto_461968 ) ) ( not ( = ?auto_461955 ?auto_461956 ) ) ( not ( = ?auto_461955 ?auto_461953 ) ) ( not ( = ?auto_461955 ?auto_461957 ) ) ( not ( = ?auto_461955 ?auto_461959 ) ) ( not ( = ?auto_461955 ?auto_461958 ) ) ( not ( = ?auto_461955 ?auto_461960 ) ) ( not ( = ?auto_461955 ?auto_461961 ) ) ( not ( = ?auto_461955 ?auto_461962 ) ) ( not ( = ?auto_461955 ?auto_461963 ) ) ( not ( = ?auto_461955 ?auto_461968 ) ) ( not ( = ?auto_461956 ?auto_461953 ) ) ( not ( = ?auto_461956 ?auto_461957 ) ) ( not ( = ?auto_461956 ?auto_461959 ) ) ( not ( = ?auto_461956 ?auto_461958 ) ) ( not ( = ?auto_461956 ?auto_461960 ) ) ( not ( = ?auto_461956 ?auto_461961 ) ) ( not ( = ?auto_461956 ?auto_461962 ) ) ( not ( = ?auto_461956 ?auto_461963 ) ) ( not ( = ?auto_461956 ?auto_461968 ) ) ( not ( = ?auto_461953 ?auto_461957 ) ) ( not ( = ?auto_461953 ?auto_461959 ) ) ( not ( = ?auto_461953 ?auto_461958 ) ) ( not ( = ?auto_461953 ?auto_461960 ) ) ( not ( = ?auto_461953 ?auto_461961 ) ) ( not ( = ?auto_461953 ?auto_461962 ) ) ( not ( = ?auto_461953 ?auto_461963 ) ) ( not ( = ?auto_461953 ?auto_461968 ) ) ( not ( = ?auto_461957 ?auto_461959 ) ) ( not ( = ?auto_461957 ?auto_461958 ) ) ( not ( = ?auto_461957 ?auto_461960 ) ) ( not ( = ?auto_461957 ?auto_461961 ) ) ( not ( = ?auto_461957 ?auto_461962 ) ) ( not ( = ?auto_461957 ?auto_461963 ) ) ( not ( = ?auto_461957 ?auto_461968 ) ) ( not ( = ?auto_461959 ?auto_461958 ) ) ( not ( = ?auto_461959 ?auto_461960 ) ) ( not ( = ?auto_461959 ?auto_461961 ) ) ( not ( = ?auto_461959 ?auto_461962 ) ) ( not ( = ?auto_461959 ?auto_461963 ) ) ( not ( = ?auto_461959 ?auto_461968 ) ) ( not ( = ?auto_461958 ?auto_461960 ) ) ( not ( = ?auto_461958 ?auto_461961 ) ) ( not ( = ?auto_461958 ?auto_461962 ) ) ( not ( = ?auto_461958 ?auto_461963 ) ) ( not ( = ?auto_461958 ?auto_461968 ) ) ( not ( = ?auto_461960 ?auto_461961 ) ) ( not ( = ?auto_461960 ?auto_461962 ) ) ( not ( = ?auto_461960 ?auto_461963 ) ) ( not ( = ?auto_461960 ?auto_461968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461961 ?auto_461962 ?auto_461963 )
      ( MAKE-10CRATE-VERIFY ?auto_461954 ?auto_461955 ?auto_461956 ?auto_461953 ?auto_461957 ?auto_461959 ?auto_461958 ?auto_461960 ?auto_461961 ?auto_461962 ?auto_461963 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_462080 - SURFACE
      ?auto_462081 - SURFACE
      ?auto_462082 - SURFACE
      ?auto_462079 - SURFACE
      ?auto_462083 - SURFACE
      ?auto_462085 - SURFACE
      ?auto_462084 - SURFACE
      ?auto_462086 - SURFACE
      ?auto_462087 - SURFACE
      ?auto_462088 - SURFACE
      ?auto_462089 - SURFACE
    )
    :vars
    (
      ?auto_462092 - HOIST
      ?auto_462095 - PLACE
      ?auto_462094 - PLACE
      ?auto_462091 - HOIST
      ?auto_462090 - SURFACE
      ?auto_462093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_462092 ?auto_462095 ) ( SURFACE-AT ?auto_462088 ?auto_462095 ) ( CLEAR ?auto_462088 ) ( IS-CRATE ?auto_462089 ) ( not ( = ?auto_462088 ?auto_462089 ) ) ( AVAILABLE ?auto_462092 ) ( ON ?auto_462088 ?auto_462087 ) ( not ( = ?auto_462087 ?auto_462088 ) ) ( not ( = ?auto_462087 ?auto_462089 ) ) ( not ( = ?auto_462094 ?auto_462095 ) ) ( HOIST-AT ?auto_462091 ?auto_462094 ) ( not ( = ?auto_462092 ?auto_462091 ) ) ( AVAILABLE ?auto_462091 ) ( SURFACE-AT ?auto_462089 ?auto_462094 ) ( ON ?auto_462089 ?auto_462090 ) ( CLEAR ?auto_462089 ) ( not ( = ?auto_462088 ?auto_462090 ) ) ( not ( = ?auto_462089 ?auto_462090 ) ) ( not ( = ?auto_462087 ?auto_462090 ) ) ( TRUCK-AT ?auto_462093 ?auto_462095 ) ( ON ?auto_462081 ?auto_462080 ) ( ON ?auto_462082 ?auto_462081 ) ( ON ?auto_462079 ?auto_462082 ) ( ON ?auto_462083 ?auto_462079 ) ( ON ?auto_462085 ?auto_462083 ) ( ON ?auto_462084 ?auto_462085 ) ( ON ?auto_462086 ?auto_462084 ) ( ON ?auto_462087 ?auto_462086 ) ( not ( = ?auto_462080 ?auto_462081 ) ) ( not ( = ?auto_462080 ?auto_462082 ) ) ( not ( = ?auto_462080 ?auto_462079 ) ) ( not ( = ?auto_462080 ?auto_462083 ) ) ( not ( = ?auto_462080 ?auto_462085 ) ) ( not ( = ?auto_462080 ?auto_462084 ) ) ( not ( = ?auto_462080 ?auto_462086 ) ) ( not ( = ?auto_462080 ?auto_462087 ) ) ( not ( = ?auto_462080 ?auto_462088 ) ) ( not ( = ?auto_462080 ?auto_462089 ) ) ( not ( = ?auto_462080 ?auto_462090 ) ) ( not ( = ?auto_462081 ?auto_462082 ) ) ( not ( = ?auto_462081 ?auto_462079 ) ) ( not ( = ?auto_462081 ?auto_462083 ) ) ( not ( = ?auto_462081 ?auto_462085 ) ) ( not ( = ?auto_462081 ?auto_462084 ) ) ( not ( = ?auto_462081 ?auto_462086 ) ) ( not ( = ?auto_462081 ?auto_462087 ) ) ( not ( = ?auto_462081 ?auto_462088 ) ) ( not ( = ?auto_462081 ?auto_462089 ) ) ( not ( = ?auto_462081 ?auto_462090 ) ) ( not ( = ?auto_462082 ?auto_462079 ) ) ( not ( = ?auto_462082 ?auto_462083 ) ) ( not ( = ?auto_462082 ?auto_462085 ) ) ( not ( = ?auto_462082 ?auto_462084 ) ) ( not ( = ?auto_462082 ?auto_462086 ) ) ( not ( = ?auto_462082 ?auto_462087 ) ) ( not ( = ?auto_462082 ?auto_462088 ) ) ( not ( = ?auto_462082 ?auto_462089 ) ) ( not ( = ?auto_462082 ?auto_462090 ) ) ( not ( = ?auto_462079 ?auto_462083 ) ) ( not ( = ?auto_462079 ?auto_462085 ) ) ( not ( = ?auto_462079 ?auto_462084 ) ) ( not ( = ?auto_462079 ?auto_462086 ) ) ( not ( = ?auto_462079 ?auto_462087 ) ) ( not ( = ?auto_462079 ?auto_462088 ) ) ( not ( = ?auto_462079 ?auto_462089 ) ) ( not ( = ?auto_462079 ?auto_462090 ) ) ( not ( = ?auto_462083 ?auto_462085 ) ) ( not ( = ?auto_462083 ?auto_462084 ) ) ( not ( = ?auto_462083 ?auto_462086 ) ) ( not ( = ?auto_462083 ?auto_462087 ) ) ( not ( = ?auto_462083 ?auto_462088 ) ) ( not ( = ?auto_462083 ?auto_462089 ) ) ( not ( = ?auto_462083 ?auto_462090 ) ) ( not ( = ?auto_462085 ?auto_462084 ) ) ( not ( = ?auto_462085 ?auto_462086 ) ) ( not ( = ?auto_462085 ?auto_462087 ) ) ( not ( = ?auto_462085 ?auto_462088 ) ) ( not ( = ?auto_462085 ?auto_462089 ) ) ( not ( = ?auto_462085 ?auto_462090 ) ) ( not ( = ?auto_462084 ?auto_462086 ) ) ( not ( = ?auto_462084 ?auto_462087 ) ) ( not ( = ?auto_462084 ?auto_462088 ) ) ( not ( = ?auto_462084 ?auto_462089 ) ) ( not ( = ?auto_462084 ?auto_462090 ) ) ( not ( = ?auto_462086 ?auto_462087 ) ) ( not ( = ?auto_462086 ?auto_462088 ) ) ( not ( = ?auto_462086 ?auto_462089 ) ) ( not ( = ?auto_462086 ?auto_462090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_462087 ?auto_462088 ?auto_462089 )
      ( MAKE-10CRATE-VERIFY ?auto_462080 ?auto_462081 ?auto_462082 ?auto_462079 ?auto_462083 ?auto_462085 ?auto_462084 ?auto_462086 ?auto_462087 ?auto_462088 ?auto_462089 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_462206 - SURFACE
      ?auto_462207 - SURFACE
      ?auto_462208 - SURFACE
      ?auto_462205 - SURFACE
      ?auto_462209 - SURFACE
      ?auto_462211 - SURFACE
      ?auto_462210 - SURFACE
      ?auto_462212 - SURFACE
      ?auto_462213 - SURFACE
      ?auto_462214 - SURFACE
      ?auto_462215 - SURFACE
    )
    :vars
    (
      ?auto_462219 - HOIST
      ?auto_462217 - PLACE
      ?auto_462216 - PLACE
      ?auto_462221 - HOIST
      ?auto_462218 - SURFACE
      ?auto_462220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_462219 ?auto_462217 ) ( IS-CRATE ?auto_462215 ) ( not ( = ?auto_462214 ?auto_462215 ) ) ( not ( = ?auto_462213 ?auto_462214 ) ) ( not ( = ?auto_462213 ?auto_462215 ) ) ( not ( = ?auto_462216 ?auto_462217 ) ) ( HOIST-AT ?auto_462221 ?auto_462216 ) ( not ( = ?auto_462219 ?auto_462221 ) ) ( AVAILABLE ?auto_462221 ) ( SURFACE-AT ?auto_462215 ?auto_462216 ) ( ON ?auto_462215 ?auto_462218 ) ( CLEAR ?auto_462215 ) ( not ( = ?auto_462214 ?auto_462218 ) ) ( not ( = ?auto_462215 ?auto_462218 ) ) ( not ( = ?auto_462213 ?auto_462218 ) ) ( TRUCK-AT ?auto_462220 ?auto_462217 ) ( SURFACE-AT ?auto_462213 ?auto_462217 ) ( CLEAR ?auto_462213 ) ( LIFTING ?auto_462219 ?auto_462214 ) ( IS-CRATE ?auto_462214 ) ( ON ?auto_462207 ?auto_462206 ) ( ON ?auto_462208 ?auto_462207 ) ( ON ?auto_462205 ?auto_462208 ) ( ON ?auto_462209 ?auto_462205 ) ( ON ?auto_462211 ?auto_462209 ) ( ON ?auto_462210 ?auto_462211 ) ( ON ?auto_462212 ?auto_462210 ) ( ON ?auto_462213 ?auto_462212 ) ( not ( = ?auto_462206 ?auto_462207 ) ) ( not ( = ?auto_462206 ?auto_462208 ) ) ( not ( = ?auto_462206 ?auto_462205 ) ) ( not ( = ?auto_462206 ?auto_462209 ) ) ( not ( = ?auto_462206 ?auto_462211 ) ) ( not ( = ?auto_462206 ?auto_462210 ) ) ( not ( = ?auto_462206 ?auto_462212 ) ) ( not ( = ?auto_462206 ?auto_462213 ) ) ( not ( = ?auto_462206 ?auto_462214 ) ) ( not ( = ?auto_462206 ?auto_462215 ) ) ( not ( = ?auto_462206 ?auto_462218 ) ) ( not ( = ?auto_462207 ?auto_462208 ) ) ( not ( = ?auto_462207 ?auto_462205 ) ) ( not ( = ?auto_462207 ?auto_462209 ) ) ( not ( = ?auto_462207 ?auto_462211 ) ) ( not ( = ?auto_462207 ?auto_462210 ) ) ( not ( = ?auto_462207 ?auto_462212 ) ) ( not ( = ?auto_462207 ?auto_462213 ) ) ( not ( = ?auto_462207 ?auto_462214 ) ) ( not ( = ?auto_462207 ?auto_462215 ) ) ( not ( = ?auto_462207 ?auto_462218 ) ) ( not ( = ?auto_462208 ?auto_462205 ) ) ( not ( = ?auto_462208 ?auto_462209 ) ) ( not ( = ?auto_462208 ?auto_462211 ) ) ( not ( = ?auto_462208 ?auto_462210 ) ) ( not ( = ?auto_462208 ?auto_462212 ) ) ( not ( = ?auto_462208 ?auto_462213 ) ) ( not ( = ?auto_462208 ?auto_462214 ) ) ( not ( = ?auto_462208 ?auto_462215 ) ) ( not ( = ?auto_462208 ?auto_462218 ) ) ( not ( = ?auto_462205 ?auto_462209 ) ) ( not ( = ?auto_462205 ?auto_462211 ) ) ( not ( = ?auto_462205 ?auto_462210 ) ) ( not ( = ?auto_462205 ?auto_462212 ) ) ( not ( = ?auto_462205 ?auto_462213 ) ) ( not ( = ?auto_462205 ?auto_462214 ) ) ( not ( = ?auto_462205 ?auto_462215 ) ) ( not ( = ?auto_462205 ?auto_462218 ) ) ( not ( = ?auto_462209 ?auto_462211 ) ) ( not ( = ?auto_462209 ?auto_462210 ) ) ( not ( = ?auto_462209 ?auto_462212 ) ) ( not ( = ?auto_462209 ?auto_462213 ) ) ( not ( = ?auto_462209 ?auto_462214 ) ) ( not ( = ?auto_462209 ?auto_462215 ) ) ( not ( = ?auto_462209 ?auto_462218 ) ) ( not ( = ?auto_462211 ?auto_462210 ) ) ( not ( = ?auto_462211 ?auto_462212 ) ) ( not ( = ?auto_462211 ?auto_462213 ) ) ( not ( = ?auto_462211 ?auto_462214 ) ) ( not ( = ?auto_462211 ?auto_462215 ) ) ( not ( = ?auto_462211 ?auto_462218 ) ) ( not ( = ?auto_462210 ?auto_462212 ) ) ( not ( = ?auto_462210 ?auto_462213 ) ) ( not ( = ?auto_462210 ?auto_462214 ) ) ( not ( = ?auto_462210 ?auto_462215 ) ) ( not ( = ?auto_462210 ?auto_462218 ) ) ( not ( = ?auto_462212 ?auto_462213 ) ) ( not ( = ?auto_462212 ?auto_462214 ) ) ( not ( = ?auto_462212 ?auto_462215 ) ) ( not ( = ?auto_462212 ?auto_462218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_462213 ?auto_462214 ?auto_462215 )
      ( MAKE-10CRATE-VERIFY ?auto_462206 ?auto_462207 ?auto_462208 ?auto_462205 ?auto_462209 ?auto_462211 ?auto_462210 ?auto_462212 ?auto_462213 ?auto_462214 ?auto_462215 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_462332 - SURFACE
      ?auto_462333 - SURFACE
      ?auto_462334 - SURFACE
      ?auto_462331 - SURFACE
      ?auto_462335 - SURFACE
      ?auto_462337 - SURFACE
      ?auto_462336 - SURFACE
      ?auto_462338 - SURFACE
      ?auto_462339 - SURFACE
      ?auto_462340 - SURFACE
      ?auto_462341 - SURFACE
    )
    :vars
    (
      ?auto_462345 - HOIST
      ?auto_462347 - PLACE
      ?auto_462342 - PLACE
      ?auto_462344 - HOIST
      ?auto_462346 - SURFACE
      ?auto_462343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_462345 ?auto_462347 ) ( IS-CRATE ?auto_462341 ) ( not ( = ?auto_462340 ?auto_462341 ) ) ( not ( = ?auto_462339 ?auto_462340 ) ) ( not ( = ?auto_462339 ?auto_462341 ) ) ( not ( = ?auto_462342 ?auto_462347 ) ) ( HOIST-AT ?auto_462344 ?auto_462342 ) ( not ( = ?auto_462345 ?auto_462344 ) ) ( AVAILABLE ?auto_462344 ) ( SURFACE-AT ?auto_462341 ?auto_462342 ) ( ON ?auto_462341 ?auto_462346 ) ( CLEAR ?auto_462341 ) ( not ( = ?auto_462340 ?auto_462346 ) ) ( not ( = ?auto_462341 ?auto_462346 ) ) ( not ( = ?auto_462339 ?auto_462346 ) ) ( TRUCK-AT ?auto_462343 ?auto_462347 ) ( SURFACE-AT ?auto_462339 ?auto_462347 ) ( CLEAR ?auto_462339 ) ( IS-CRATE ?auto_462340 ) ( AVAILABLE ?auto_462345 ) ( IN ?auto_462340 ?auto_462343 ) ( ON ?auto_462333 ?auto_462332 ) ( ON ?auto_462334 ?auto_462333 ) ( ON ?auto_462331 ?auto_462334 ) ( ON ?auto_462335 ?auto_462331 ) ( ON ?auto_462337 ?auto_462335 ) ( ON ?auto_462336 ?auto_462337 ) ( ON ?auto_462338 ?auto_462336 ) ( ON ?auto_462339 ?auto_462338 ) ( not ( = ?auto_462332 ?auto_462333 ) ) ( not ( = ?auto_462332 ?auto_462334 ) ) ( not ( = ?auto_462332 ?auto_462331 ) ) ( not ( = ?auto_462332 ?auto_462335 ) ) ( not ( = ?auto_462332 ?auto_462337 ) ) ( not ( = ?auto_462332 ?auto_462336 ) ) ( not ( = ?auto_462332 ?auto_462338 ) ) ( not ( = ?auto_462332 ?auto_462339 ) ) ( not ( = ?auto_462332 ?auto_462340 ) ) ( not ( = ?auto_462332 ?auto_462341 ) ) ( not ( = ?auto_462332 ?auto_462346 ) ) ( not ( = ?auto_462333 ?auto_462334 ) ) ( not ( = ?auto_462333 ?auto_462331 ) ) ( not ( = ?auto_462333 ?auto_462335 ) ) ( not ( = ?auto_462333 ?auto_462337 ) ) ( not ( = ?auto_462333 ?auto_462336 ) ) ( not ( = ?auto_462333 ?auto_462338 ) ) ( not ( = ?auto_462333 ?auto_462339 ) ) ( not ( = ?auto_462333 ?auto_462340 ) ) ( not ( = ?auto_462333 ?auto_462341 ) ) ( not ( = ?auto_462333 ?auto_462346 ) ) ( not ( = ?auto_462334 ?auto_462331 ) ) ( not ( = ?auto_462334 ?auto_462335 ) ) ( not ( = ?auto_462334 ?auto_462337 ) ) ( not ( = ?auto_462334 ?auto_462336 ) ) ( not ( = ?auto_462334 ?auto_462338 ) ) ( not ( = ?auto_462334 ?auto_462339 ) ) ( not ( = ?auto_462334 ?auto_462340 ) ) ( not ( = ?auto_462334 ?auto_462341 ) ) ( not ( = ?auto_462334 ?auto_462346 ) ) ( not ( = ?auto_462331 ?auto_462335 ) ) ( not ( = ?auto_462331 ?auto_462337 ) ) ( not ( = ?auto_462331 ?auto_462336 ) ) ( not ( = ?auto_462331 ?auto_462338 ) ) ( not ( = ?auto_462331 ?auto_462339 ) ) ( not ( = ?auto_462331 ?auto_462340 ) ) ( not ( = ?auto_462331 ?auto_462341 ) ) ( not ( = ?auto_462331 ?auto_462346 ) ) ( not ( = ?auto_462335 ?auto_462337 ) ) ( not ( = ?auto_462335 ?auto_462336 ) ) ( not ( = ?auto_462335 ?auto_462338 ) ) ( not ( = ?auto_462335 ?auto_462339 ) ) ( not ( = ?auto_462335 ?auto_462340 ) ) ( not ( = ?auto_462335 ?auto_462341 ) ) ( not ( = ?auto_462335 ?auto_462346 ) ) ( not ( = ?auto_462337 ?auto_462336 ) ) ( not ( = ?auto_462337 ?auto_462338 ) ) ( not ( = ?auto_462337 ?auto_462339 ) ) ( not ( = ?auto_462337 ?auto_462340 ) ) ( not ( = ?auto_462337 ?auto_462341 ) ) ( not ( = ?auto_462337 ?auto_462346 ) ) ( not ( = ?auto_462336 ?auto_462338 ) ) ( not ( = ?auto_462336 ?auto_462339 ) ) ( not ( = ?auto_462336 ?auto_462340 ) ) ( not ( = ?auto_462336 ?auto_462341 ) ) ( not ( = ?auto_462336 ?auto_462346 ) ) ( not ( = ?auto_462338 ?auto_462339 ) ) ( not ( = ?auto_462338 ?auto_462340 ) ) ( not ( = ?auto_462338 ?auto_462341 ) ) ( not ( = ?auto_462338 ?auto_462346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_462339 ?auto_462340 ?auto_462341 )
      ( MAKE-10CRATE-VERIFY ?auto_462332 ?auto_462333 ?auto_462334 ?auto_462331 ?auto_462335 ?auto_462337 ?auto_462336 ?auto_462338 ?auto_462339 ?auto_462340 ?auto_462341 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469558 - SURFACE
      ?auto_469559 - SURFACE
      ?auto_469560 - SURFACE
      ?auto_469557 - SURFACE
      ?auto_469561 - SURFACE
      ?auto_469563 - SURFACE
      ?auto_469562 - SURFACE
      ?auto_469564 - SURFACE
      ?auto_469565 - SURFACE
      ?auto_469566 - SURFACE
      ?auto_469567 - SURFACE
      ?auto_469568 - SURFACE
    )
    :vars
    (
      ?auto_469569 - HOIST
      ?auto_469570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469569 ?auto_469570 ) ( SURFACE-AT ?auto_469567 ?auto_469570 ) ( CLEAR ?auto_469567 ) ( LIFTING ?auto_469569 ?auto_469568 ) ( IS-CRATE ?auto_469568 ) ( not ( = ?auto_469567 ?auto_469568 ) ) ( ON ?auto_469559 ?auto_469558 ) ( ON ?auto_469560 ?auto_469559 ) ( ON ?auto_469557 ?auto_469560 ) ( ON ?auto_469561 ?auto_469557 ) ( ON ?auto_469563 ?auto_469561 ) ( ON ?auto_469562 ?auto_469563 ) ( ON ?auto_469564 ?auto_469562 ) ( ON ?auto_469565 ?auto_469564 ) ( ON ?auto_469566 ?auto_469565 ) ( ON ?auto_469567 ?auto_469566 ) ( not ( = ?auto_469558 ?auto_469559 ) ) ( not ( = ?auto_469558 ?auto_469560 ) ) ( not ( = ?auto_469558 ?auto_469557 ) ) ( not ( = ?auto_469558 ?auto_469561 ) ) ( not ( = ?auto_469558 ?auto_469563 ) ) ( not ( = ?auto_469558 ?auto_469562 ) ) ( not ( = ?auto_469558 ?auto_469564 ) ) ( not ( = ?auto_469558 ?auto_469565 ) ) ( not ( = ?auto_469558 ?auto_469566 ) ) ( not ( = ?auto_469558 ?auto_469567 ) ) ( not ( = ?auto_469558 ?auto_469568 ) ) ( not ( = ?auto_469559 ?auto_469560 ) ) ( not ( = ?auto_469559 ?auto_469557 ) ) ( not ( = ?auto_469559 ?auto_469561 ) ) ( not ( = ?auto_469559 ?auto_469563 ) ) ( not ( = ?auto_469559 ?auto_469562 ) ) ( not ( = ?auto_469559 ?auto_469564 ) ) ( not ( = ?auto_469559 ?auto_469565 ) ) ( not ( = ?auto_469559 ?auto_469566 ) ) ( not ( = ?auto_469559 ?auto_469567 ) ) ( not ( = ?auto_469559 ?auto_469568 ) ) ( not ( = ?auto_469560 ?auto_469557 ) ) ( not ( = ?auto_469560 ?auto_469561 ) ) ( not ( = ?auto_469560 ?auto_469563 ) ) ( not ( = ?auto_469560 ?auto_469562 ) ) ( not ( = ?auto_469560 ?auto_469564 ) ) ( not ( = ?auto_469560 ?auto_469565 ) ) ( not ( = ?auto_469560 ?auto_469566 ) ) ( not ( = ?auto_469560 ?auto_469567 ) ) ( not ( = ?auto_469560 ?auto_469568 ) ) ( not ( = ?auto_469557 ?auto_469561 ) ) ( not ( = ?auto_469557 ?auto_469563 ) ) ( not ( = ?auto_469557 ?auto_469562 ) ) ( not ( = ?auto_469557 ?auto_469564 ) ) ( not ( = ?auto_469557 ?auto_469565 ) ) ( not ( = ?auto_469557 ?auto_469566 ) ) ( not ( = ?auto_469557 ?auto_469567 ) ) ( not ( = ?auto_469557 ?auto_469568 ) ) ( not ( = ?auto_469561 ?auto_469563 ) ) ( not ( = ?auto_469561 ?auto_469562 ) ) ( not ( = ?auto_469561 ?auto_469564 ) ) ( not ( = ?auto_469561 ?auto_469565 ) ) ( not ( = ?auto_469561 ?auto_469566 ) ) ( not ( = ?auto_469561 ?auto_469567 ) ) ( not ( = ?auto_469561 ?auto_469568 ) ) ( not ( = ?auto_469563 ?auto_469562 ) ) ( not ( = ?auto_469563 ?auto_469564 ) ) ( not ( = ?auto_469563 ?auto_469565 ) ) ( not ( = ?auto_469563 ?auto_469566 ) ) ( not ( = ?auto_469563 ?auto_469567 ) ) ( not ( = ?auto_469563 ?auto_469568 ) ) ( not ( = ?auto_469562 ?auto_469564 ) ) ( not ( = ?auto_469562 ?auto_469565 ) ) ( not ( = ?auto_469562 ?auto_469566 ) ) ( not ( = ?auto_469562 ?auto_469567 ) ) ( not ( = ?auto_469562 ?auto_469568 ) ) ( not ( = ?auto_469564 ?auto_469565 ) ) ( not ( = ?auto_469564 ?auto_469566 ) ) ( not ( = ?auto_469564 ?auto_469567 ) ) ( not ( = ?auto_469564 ?auto_469568 ) ) ( not ( = ?auto_469565 ?auto_469566 ) ) ( not ( = ?auto_469565 ?auto_469567 ) ) ( not ( = ?auto_469565 ?auto_469568 ) ) ( not ( = ?auto_469566 ?auto_469567 ) ) ( not ( = ?auto_469566 ?auto_469568 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_469567 ?auto_469568 )
      ( MAKE-11CRATE-VERIFY ?auto_469558 ?auto_469559 ?auto_469560 ?auto_469557 ?auto_469561 ?auto_469563 ?auto_469562 ?auto_469564 ?auto_469565 ?auto_469566 ?auto_469567 ?auto_469568 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469667 - SURFACE
      ?auto_469668 - SURFACE
      ?auto_469669 - SURFACE
      ?auto_469666 - SURFACE
      ?auto_469670 - SURFACE
      ?auto_469672 - SURFACE
      ?auto_469671 - SURFACE
      ?auto_469673 - SURFACE
      ?auto_469674 - SURFACE
      ?auto_469675 - SURFACE
      ?auto_469676 - SURFACE
      ?auto_469677 - SURFACE
    )
    :vars
    (
      ?auto_469679 - HOIST
      ?auto_469678 - PLACE
      ?auto_469680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469679 ?auto_469678 ) ( SURFACE-AT ?auto_469676 ?auto_469678 ) ( CLEAR ?auto_469676 ) ( IS-CRATE ?auto_469677 ) ( not ( = ?auto_469676 ?auto_469677 ) ) ( TRUCK-AT ?auto_469680 ?auto_469678 ) ( AVAILABLE ?auto_469679 ) ( IN ?auto_469677 ?auto_469680 ) ( ON ?auto_469676 ?auto_469675 ) ( not ( = ?auto_469675 ?auto_469676 ) ) ( not ( = ?auto_469675 ?auto_469677 ) ) ( ON ?auto_469668 ?auto_469667 ) ( ON ?auto_469669 ?auto_469668 ) ( ON ?auto_469666 ?auto_469669 ) ( ON ?auto_469670 ?auto_469666 ) ( ON ?auto_469672 ?auto_469670 ) ( ON ?auto_469671 ?auto_469672 ) ( ON ?auto_469673 ?auto_469671 ) ( ON ?auto_469674 ?auto_469673 ) ( ON ?auto_469675 ?auto_469674 ) ( not ( = ?auto_469667 ?auto_469668 ) ) ( not ( = ?auto_469667 ?auto_469669 ) ) ( not ( = ?auto_469667 ?auto_469666 ) ) ( not ( = ?auto_469667 ?auto_469670 ) ) ( not ( = ?auto_469667 ?auto_469672 ) ) ( not ( = ?auto_469667 ?auto_469671 ) ) ( not ( = ?auto_469667 ?auto_469673 ) ) ( not ( = ?auto_469667 ?auto_469674 ) ) ( not ( = ?auto_469667 ?auto_469675 ) ) ( not ( = ?auto_469667 ?auto_469676 ) ) ( not ( = ?auto_469667 ?auto_469677 ) ) ( not ( = ?auto_469668 ?auto_469669 ) ) ( not ( = ?auto_469668 ?auto_469666 ) ) ( not ( = ?auto_469668 ?auto_469670 ) ) ( not ( = ?auto_469668 ?auto_469672 ) ) ( not ( = ?auto_469668 ?auto_469671 ) ) ( not ( = ?auto_469668 ?auto_469673 ) ) ( not ( = ?auto_469668 ?auto_469674 ) ) ( not ( = ?auto_469668 ?auto_469675 ) ) ( not ( = ?auto_469668 ?auto_469676 ) ) ( not ( = ?auto_469668 ?auto_469677 ) ) ( not ( = ?auto_469669 ?auto_469666 ) ) ( not ( = ?auto_469669 ?auto_469670 ) ) ( not ( = ?auto_469669 ?auto_469672 ) ) ( not ( = ?auto_469669 ?auto_469671 ) ) ( not ( = ?auto_469669 ?auto_469673 ) ) ( not ( = ?auto_469669 ?auto_469674 ) ) ( not ( = ?auto_469669 ?auto_469675 ) ) ( not ( = ?auto_469669 ?auto_469676 ) ) ( not ( = ?auto_469669 ?auto_469677 ) ) ( not ( = ?auto_469666 ?auto_469670 ) ) ( not ( = ?auto_469666 ?auto_469672 ) ) ( not ( = ?auto_469666 ?auto_469671 ) ) ( not ( = ?auto_469666 ?auto_469673 ) ) ( not ( = ?auto_469666 ?auto_469674 ) ) ( not ( = ?auto_469666 ?auto_469675 ) ) ( not ( = ?auto_469666 ?auto_469676 ) ) ( not ( = ?auto_469666 ?auto_469677 ) ) ( not ( = ?auto_469670 ?auto_469672 ) ) ( not ( = ?auto_469670 ?auto_469671 ) ) ( not ( = ?auto_469670 ?auto_469673 ) ) ( not ( = ?auto_469670 ?auto_469674 ) ) ( not ( = ?auto_469670 ?auto_469675 ) ) ( not ( = ?auto_469670 ?auto_469676 ) ) ( not ( = ?auto_469670 ?auto_469677 ) ) ( not ( = ?auto_469672 ?auto_469671 ) ) ( not ( = ?auto_469672 ?auto_469673 ) ) ( not ( = ?auto_469672 ?auto_469674 ) ) ( not ( = ?auto_469672 ?auto_469675 ) ) ( not ( = ?auto_469672 ?auto_469676 ) ) ( not ( = ?auto_469672 ?auto_469677 ) ) ( not ( = ?auto_469671 ?auto_469673 ) ) ( not ( = ?auto_469671 ?auto_469674 ) ) ( not ( = ?auto_469671 ?auto_469675 ) ) ( not ( = ?auto_469671 ?auto_469676 ) ) ( not ( = ?auto_469671 ?auto_469677 ) ) ( not ( = ?auto_469673 ?auto_469674 ) ) ( not ( = ?auto_469673 ?auto_469675 ) ) ( not ( = ?auto_469673 ?auto_469676 ) ) ( not ( = ?auto_469673 ?auto_469677 ) ) ( not ( = ?auto_469674 ?auto_469675 ) ) ( not ( = ?auto_469674 ?auto_469676 ) ) ( not ( = ?auto_469674 ?auto_469677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469675 ?auto_469676 ?auto_469677 )
      ( MAKE-11CRATE-VERIFY ?auto_469667 ?auto_469668 ?auto_469669 ?auto_469666 ?auto_469670 ?auto_469672 ?auto_469671 ?auto_469673 ?auto_469674 ?auto_469675 ?auto_469676 ?auto_469677 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469788 - SURFACE
      ?auto_469789 - SURFACE
      ?auto_469790 - SURFACE
      ?auto_469787 - SURFACE
      ?auto_469791 - SURFACE
      ?auto_469793 - SURFACE
      ?auto_469792 - SURFACE
      ?auto_469794 - SURFACE
      ?auto_469795 - SURFACE
      ?auto_469796 - SURFACE
      ?auto_469797 - SURFACE
      ?auto_469798 - SURFACE
    )
    :vars
    (
      ?auto_469802 - HOIST
      ?auto_469799 - PLACE
      ?auto_469801 - TRUCK
      ?auto_469800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469802 ?auto_469799 ) ( SURFACE-AT ?auto_469797 ?auto_469799 ) ( CLEAR ?auto_469797 ) ( IS-CRATE ?auto_469798 ) ( not ( = ?auto_469797 ?auto_469798 ) ) ( AVAILABLE ?auto_469802 ) ( IN ?auto_469798 ?auto_469801 ) ( ON ?auto_469797 ?auto_469796 ) ( not ( = ?auto_469796 ?auto_469797 ) ) ( not ( = ?auto_469796 ?auto_469798 ) ) ( TRUCK-AT ?auto_469801 ?auto_469800 ) ( not ( = ?auto_469800 ?auto_469799 ) ) ( ON ?auto_469789 ?auto_469788 ) ( ON ?auto_469790 ?auto_469789 ) ( ON ?auto_469787 ?auto_469790 ) ( ON ?auto_469791 ?auto_469787 ) ( ON ?auto_469793 ?auto_469791 ) ( ON ?auto_469792 ?auto_469793 ) ( ON ?auto_469794 ?auto_469792 ) ( ON ?auto_469795 ?auto_469794 ) ( ON ?auto_469796 ?auto_469795 ) ( not ( = ?auto_469788 ?auto_469789 ) ) ( not ( = ?auto_469788 ?auto_469790 ) ) ( not ( = ?auto_469788 ?auto_469787 ) ) ( not ( = ?auto_469788 ?auto_469791 ) ) ( not ( = ?auto_469788 ?auto_469793 ) ) ( not ( = ?auto_469788 ?auto_469792 ) ) ( not ( = ?auto_469788 ?auto_469794 ) ) ( not ( = ?auto_469788 ?auto_469795 ) ) ( not ( = ?auto_469788 ?auto_469796 ) ) ( not ( = ?auto_469788 ?auto_469797 ) ) ( not ( = ?auto_469788 ?auto_469798 ) ) ( not ( = ?auto_469789 ?auto_469790 ) ) ( not ( = ?auto_469789 ?auto_469787 ) ) ( not ( = ?auto_469789 ?auto_469791 ) ) ( not ( = ?auto_469789 ?auto_469793 ) ) ( not ( = ?auto_469789 ?auto_469792 ) ) ( not ( = ?auto_469789 ?auto_469794 ) ) ( not ( = ?auto_469789 ?auto_469795 ) ) ( not ( = ?auto_469789 ?auto_469796 ) ) ( not ( = ?auto_469789 ?auto_469797 ) ) ( not ( = ?auto_469789 ?auto_469798 ) ) ( not ( = ?auto_469790 ?auto_469787 ) ) ( not ( = ?auto_469790 ?auto_469791 ) ) ( not ( = ?auto_469790 ?auto_469793 ) ) ( not ( = ?auto_469790 ?auto_469792 ) ) ( not ( = ?auto_469790 ?auto_469794 ) ) ( not ( = ?auto_469790 ?auto_469795 ) ) ( not ( = ?auto_469790 ?auto_469796 ) ) ( not ( = ?auto_469790 ?auto_469797 ) ) ( not ( = ?auto_469790 ?auto_469798 ) ) ( not ( = ?auto_469787 ?auto_469791 ) ) ( not ( = ?auto_469787 ?auto_469793 ) ) ( not ( = ?auto_469787 ?auto_469792 ) ) ( not ( = ?auto_469787 ?auto_469794 ) ) ( not ( = ?auto_469787 ?auto_469795 ) ) ( not ( = ?auto_469787 ?auto_469796 ) ) ( not ( = ?auto_469787 ?auto_469797 ) ) ( not ( = ?auto_469787 ?auto_469798 ) ) ( not ( = ?auto_469791 ?auto_469793 ) ) ( not ( = ?auto_469791 ?auto_469792 ) ) ( not ( = ?auto_469791 ?auto_469794 ) ) ( not ( = ?auto_469791 ?auto_469795 ) ) ( not ( = ?auto_469791 ?auto_469796 ) ) ( not ( = ?auto_469791 ?auto_469797 ) ) ( not ( = ?auto_469791 ?auto_469798 ) ) ( not ( = ?auto_469793 ?auto_469792 ) ) ( not ( = ?auto_469793 ?auto_469794 ) ) ( not ( = ?auto_469793 ?auto_469795 ) ) ( not ( = ?auto_469793 ?auto_469796 ) ) ( not ( = ?auto_469793 ?auto_469797 ) ) ( not ( = ?auto_469793 ?auto_469798 ) ) ( not ( = ?auto_469792 ?auto_469794 ) ) ( not ( = ?auto_469792 ?auto_469795 ) ) ( not ( = ?auto_469792 ?auto_469796 ) ) ( not ( = ?auto_469792 ?auto_469797 ) ) ( not ( = ?auto_469792 ?auto_469798 ) ) ( not ( = ?auto_469794 ?auto_469795 ) ) ( not ( = ?auto_469794 ?auto_469796 ) ) ( not ( = ?auto_469794 ?auto_469797 ) ) ( not ( = ?auto_469794 ?auto_469798 ) ) ( not ( = ?auto_469795 ?auto_469796 ) ) ( not ( = ?auto_469795 ?auto_469797 ) ) ( not ( = ?auto_469795 ?auto_469798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469796 ?auto_469797 ?auto_469798 )
      ( MAKE-11CRATE-VERIFY ?auto_469788 ?auto_469789 ?auto_469790 ?auto_469787 ?auto_469791 ?auto_469793 ?auto_469792 ?auto_469794 ?auto_469795 ?auto_469796 ?auto_469797 ?auto_469798 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469920 - SURFACE
      ?auto_469921 - SURFACE
      ?auto_469922 - SURFACE
      ?auto_469919 - SURFACE
      ?auto_469923 - SURFACE
      ?auto_469925 - SURFACE
      ?auto_469924 - SURFACE
      ?auto_469926 - SURFACE
      ?auto_469927 - SURFACE
      ?auto_469928 - SURFACE
      ?auto_469929 - SURFACE
      ?auto_469930 - SURFACE
    )
    :vars
    (
      ?auto_469935 - HOIST
      ?auto_469931 - PLACE
      ?auto_469932 - TRUCK
      ?auto_469933 - PLACE
      ?auto_469934 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_469935 ?auto_469931 ) ( SURFACE-AT ?auto_469929 ?auto_469931 ) ( CLEAR ?auto_469929 ) ( IS-CRATE ?auto_469930 ) ( not ( = ?auto_469929 ?auto_469930 ) ) ( AVAILABLE ?auto_469935 ) ( ON ?auto_469929 ?auto_469928 ) ( not ( = ?auto_469928 ?auto_469929 ) ) ( not ( = ?auto_469928 ?auto_469930 ) ) ( TRUCK-AT ?auto_469932 ?auto_469933 ) ( not ( = ?auto_469933 ?auto_469931 ) ) ( HOIST-AT ?auto_469934 ?auto_469933 ) ( LIFTING ?auto_469934 ?auto_469930 ) ( not ( = ?auto_469935 ?auto_469934 ) ) ( ON ?auto_469921 ?auto_469920 ) ( ON ?auto_469922 ?auto_469921 ) ( ON ?auto_469919 ?auto_469922 ) ( ON ?auto_469923 ?auto_469919 ) ( ON ?auto_469925 ?auto_469923 ) ( ON ?auto_469924 ?auto_469925 ) ( ON ?auto_469926 ?auto_469924 ) ( ON ?auto_469927 ?auto_469926 ) ( ON ?auto_469928 ?auto_469927 ) ( not ( = ?auto_469920 ?auto_469921 ) ) ( not ( = ?auto_469920 ?auto_469922 ) ) ( not ( = ?auto_469920 ?auto_469919 ) ) ( not ( = ?auto_469920 ?auto_469923 ) ) ( not ( = ?auto_469920 ?auto_469925 ) ) ( not ( = ?auto_469920 ?auto_469924 ) ) ( not ( = ?auto_469920 ?auto_469926 ) ) ( not ( = ?auto_469920 ?auto_469927 ) ) ( not ( = ?auto_469920 ?auto_469928 ) ) ( not ( = ?auto_469920 ?auto_469929 ) ) ( not ( = ?auto_469920 ?auto_469930 ) ) ( not ( = ?auto_469921 ?auto_469922 ) ) ( not ( = ?auto_469921 ?auto_469919 ) ) ( not ( = ?auto_469921 ?auto_469923 ) ) ( not ( = ?auto_469921 ?auto_469925 ) ) ( not ( = ?auto_469921 ?auto_469924 ) ) ( not ( = ?auto_469921 ?auto_469926 ) ) ( not ( = ?auto_469921 ?auto_469927 ) ) ( not ( = ?auto_469921 ?auto_469928 ) ) ( not ( = ?auto_469921 ?auto_469929 ) ) ( not ( = ?auto_469921 ?auto_469930 ) ) ( not ( = ?auto_469922 ?auto_469919 ) ) ( not ( = ?auto_469922 ?auto_469923 ) ) ( not ( = ?auto_469922 ?auto_469925 ) ) ( not ( = ?auto_469922 ?auto_469924 ) ) ( not ( = ?auto_469922 ?auto_469926 ) ) ( not ( = ?auto_469922 ?auto_469927 ) ) ( not ( = ?auto_469922 ?auto_469928 ) ) ( not ( = ?auto_469922 ?auto_469929 ) ) ( not ( = ?auto_469922 ?auto_469930 ) ) ( not ( = ?auto_469919 ?auto_469923 ) ) ( not ( = ?auto_469919 ?auto_469925 ) ) ( not ( = ?auto_469919 ?auto_469924 ) ) ( not ( = ?auto_469919 ?auto_469926 ) ) ( not ( = ?auto_469919 ?auto_469927 ) ) ( not ( = ?auto_469919 ?auto_469928 ) ) ( not ( = ?auto_469919 ?auto_469929 ) ) ( not ( = ?auto_469919 ?auto_469930 ) ) ( not ( = ?auto_469923 ?auto_469925 ) ) ( not ( = ?auto_469923 ?auto_469924 ) ) ( not ( = ?auto_469923 ?auto_469926 ) ) ( not ( = ?auto_469923 ?auto_469927 ) ) ( not ( = ?auto_469923 ?auto_469928 ) ) ( not ( = ?auto_469923 ?auto_469929 ) ) ( not ( = ?auto_469923 ?auto_469930 ) ) ( not ( = ?auto_469925 ?auto_469924 ) ) ( not ( = ?auto_469925 ?auto_469926 ) ) ( not ( = ?auto_469925 ?auto_469927 ) ) ( not ( = ?auto_469925 ?auto_469928 ) ) ( not ( = ?auto_469925 ?auto_469929 ) ) ( not ( = ?auto_469925 ?auto_469930 ) ) ( not ( = ?auto_469924 ?auto_469926 ) ) ( not ( = ?auto_469924 ?auto_469927 ) ) ( not ( = ?auto_469924 ?auto_469928 ) ) ( not ( = ?auto_469924 ?auto_469929 ) ) ( not ( = ?auto_469924 ?auto_469930 ) ) ( not ( = ?auto_469926 ?auto_469927 ) ) ( not ( = ?auto_469926 ?auto_469928 ) ) ( not ( = ?auto_469926 ?auto_469929 ) ) ( not ( = ?auto_469926 ?auto_469930 ) ) ( not ( = ?auto_469927 ?auto_469928 ) ) ( not ( = ?auto_469927 ?auto_469929 ) ) ( not ( = ?auto_469927 ?auto_469930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469928 ?auto_469929 ?auto_469930 )
      ( MAKE-11CRATE-VERIFY ?auto_469920 ?auto_469921 ?auto_469922 ?auto_469919 ?auto_469923 ?auto_469925 ?auto_469924 ?auto_469926 ?auto_469927 ?auto_469928 ?auto_469929 ?auto_469930 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_470063 - SURFACE
      ?auto_470064 - SURFACE
      ?auto_470065 - SURFACE
      ?auto_470062 - SURFACE
      ?auto_470066 - SURFACE
      ?auto_470068 - SURFACE
      ?auto_470067 - SURFACE
      ?auto_470069 - SURFACE
      ?auto_470070 - SURFACE
      ?auto_470071 - SURFACE
      ?auto_470072 - SURFACE
      ?auto_470073 - SURFACE
    )
    :vars
    (
      ?auto_470074 - HOIST
      ?auto_470079 - PLACE
      ?auto_470075 - TRUCK
      ?auto_470078 - PLACE
      ?auto_470076 - HOIST
      ?auto_470077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_470074 ?auto_470079 ) ( SURFACE-AT ?auto_470072 ?auto_470079 ) ( CLEAR ?auto_470072 ) ( IS-CRATE ?auto_470073 ) ( not ( = ?auto_470072 ?auto_470073 ) ) ( AVAILABLE ?auto_470074 ) ( ON ?auto_470072 ?auto_470071 ) ( not ( = ?auto_470071 ?auto_470072 ) ) ( not ( = ?auto_470071 ?auto_470073 ) ) ( TRUCK-AT ?auto_470075 ?auto_470078 ) ( not ( = ?auto_470078 ?auto_470079 ) ) ( HOIST-AT ?auto_470076 ?auto_470078 ) ( not ( = ?auto_470074 ?auto_470076 ) ) ( AVAILABLE ?auto_470076 ) ( SURFACE-AT ?auto_470073 ?auto_470078 ) ( ON ?auto_470073 ?auto_470077 ) ( CLEAR ?auto_470073 ) ( not ( = ?auto_470072 ?auto_470077 ) ) ( not ( = ?auto_470073 ?auto_470077 ) ) ( not ( = ?auto_470071 ?auto_470077 ) ) ( ON ?auto_470064 ?auto_470063 ) ( ON ?auto_470065 ?auto_470064 ) ( ON ?auto_470062 ?auto_470065 ) ( ON ?auto_470066 ?auto_470062 ) ( ON ?auto_470068 ?auto_470066 ) ( ON ?auto_470067 ?auto_470068 ) ( ON ?auto_470069 ?auto_470067 ) ( ON ?auto_470070 ?auto_470069 ) ( ON ?auto_470071 ?auto_470070 ) ( not ( = ?auto_470063 ?auto_470064 ) ) ( not ( = ?auto_470063 ?auto_470065 ) ) ( not ( = ?auto_470063 ?auto_470062 ) ) ( not ( = ?auto_470063 ?auto_470066 ) ) ( not ( = ?auto_470063 ?auto_470068 ) ) ( not ( = ?auto_470063 ?auto_470067 ) ) ( not ( = ?auto_470063 ?auto_470069 ) ) ( not ( = ?auto_470063 ?auto_470070 ) ) ( not ( = ?auto_470063 ?auto_470071 ) ) ( not ( = ?auto_470063 ?auto_470072 ) ) ( not ( = ?auto_470063 ?auto_470073 ) ) ( not ( = ?auto_470063 ?auto_470077 ) ) ( not ( = ?auto_470064 ?auto_470065 ) ) ( not ( = ?auto_470064 ?auto_470062 ) ) ( not ( = ?auto_470064 ?auto_470066 ) ) ( not ( = ?auto_470064 ?auto_470068 ) ) ( not ( = ?auto_470064 ?auto_470067 ) ) ( not ( = ?auto_470064 ?auto_470069 ) ) ( not ( = ?auto_470064 ?auto_470070 ) ) ( not ( = ?auto_470064 ?auto_470071 ) ) ( not ( = ?auto_470064 ?auto_470072 ) ) ( not ( = ?auto_470064 ?auto_470073 ) ) ( not ( = ?auto_470064 ?auto_470077 ) ) ( not ( = ?auto_470065 ?auto_470062 ) ) ( not ( = ?auto_470065 ?auto_470066 ) ) ( not ( = ?auto_470065 ?auto_470068 ) ) ( not ( = ?auto_470065 ?auto_470067 ) ) ( not ( = ?auto_470065 ?auto_470069 ) ) ( not ( = ?auto_470065 ?auto_470070 ) ) ( not ( = ?auto_470065 ?auto_470071 ) ) ( not ( = ?auto_470065 ?auto_470072 ) ) ( not ( = ?auto_470065 ?auto_470073 ) ) ( not ( = ?auto_470065 ?auto_470077 ) ) ( not ( = ?auto_470062 ?auto_470066 ) ) ( not ( = ?auto_470062 ?auto_470068 ) ) ( not ( = ?auto_470062 ?auto_470067 ) ) ( not ( = ?auto_470062 ?auto_470069 ) ) ( not ( = ?auto_470062 ?auto_470070 ) ) ( not ( = ?auto_470062 ?auto_470071 ) ) ( not ( = ?auto_470062 ?auto_470072 ) ) ( not ( = ?auto_470062 ?auto_470073 ) ) ( not ( = ?auto_470062 ?auto_470077 ) ) ( not ( = ?auto_470066 ?auto_470068 ) ) ( not ( = ?auto_470066 ?auto_470067 ) ) ( not ( = ?auto_470066 ?auto_470069 ) ) ( not ( = ?auto_470066 ?auto_470070 ) ) ( not ( = ?auto_470066 ?auto_470071 ) ) ( not ( = ?auto_470066 ?auto_470072 ) ) ( not ( = ?auto_470066 ?auto_470073 ) ) ( not ( = ?auto_470066 ?auto_470077 ) ) ( not ( = ?auto_470068 ?auto_470067 ) ) ( not ( = ?auto_470068 ?auto_470069 ) ) ( not ( = ?auto_470068 ?auto_470070 ) ) ( not ( = ?auto_470068 ?auto_470071 ) ) ( not ( = ?auto_470068 ?auto_470072 ) ) ( not ( = ?auto_470068 ?auto_470073 ) ) ( not ( = ?auto_470068 ?auto_470077 ) ) ( not ( = ?auto_470067 ?auto_470069 ) ) ( not ( = ?auto_470067 ?auto_470070 ) ) ( not ( = ?auto_470067 ?auto_470071 ) ) ( not ( = ?auto_470067 ?auto_470072 ) ) ( not ( = ?auto_470067 ?auto_470073 ) ) ( not ( = ?auto_470067 ?auto_470077 ) ) ( not ( = ?auto_470069 ?auto_470070 ) ) ( not ( = ?auto_470069 ?auto_470071 ) ) ( not ( = ?auto_470069 ?auto_470072 ) ) ( not ( = ?auto_470069 ?auto_470073 ) ) ( not ( = ?auto_470069 ?auto_470077 ) ) ( not ( = ?auto_470070 ?auto_470071 ) ) ( not ( = ?auto_470070 ?auto_470072 ) ) ( not ( = ?auto_470070 ?auto_470073 ) ) ( not ( = ?auto_470070 ?auto_470077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_470071 ?auto_470072 ?auto_470073 )
      ( MAKE-11CRATE-VERIFY ?auto_470063 ?auto_470064 ?auto_470065 ?auto_470062 ?auto_470066 ?auto_470068 ?auto_470067 ?auto_470069 ?auto_470070 ?auto_470071 ?auto_470072 ?auto_470073 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_470207 - SURFACE
      ?auto_470208 - SURFACE
      ?auto_470209 - SURFACE
      ?auto_470206 - SURFACE
      ?auto_470210 - SURFACE
      ?auto_470212 - SURFACE
      ?auto_470211 - SURFACE
      ?auto_470213 - SURFACE
      ?auto_470214 - SURFACE
      ?auto_470215 - SURFACE
      ?auto_470216 - SURFACE
      ?auto_470217 - SURFACE
    )
    :vars
    (
      ?auto_470222 - HOIST
      ?auto_470221 - PLACE
      ?auto_470223 - PLACE
      ?auto_470218 - HOIST
      ?auto_470219 - SURFACE
      ?auto_470220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_470222 ?auto_470221 ) ( SURFACE-AT ?auto_470216 ?auto_470221 ) ( CLEAR ?auto_470216 ) ( IS-CRATE ?auto_470217 ) ( not ( = ?auto_470216 ?auto_470217 ) ) ( AVAILABLE ?auto_470222 ) ( ON ?auto_470216 ?auto_470215 ) ( not ( = ?auto_470215 ?auto_470216 ) ) ( not ( = ?auto_470215 ?auto_470217 ) ) ( not ( = ?auto_470223 ?auto_470221 ) ) ( HOIST-AT ?auto_470218 ?auto_470223 ) ( not ( = ?auto_470222 ?auto_470218 ) ) ( AVAILABLE ?auto_470218 ) ( SURFACE-AT ?auto_470217 ?auto_470223 ) ( ON ?auto_470217 ?auto_470219 ) ( CLEAR ?auto_470217 ) ( not ( = ?auto_470216 ?auto_470219 ) ) ( not ( = ?auto_470217 ?auto_470219 ) ) ( not ( = ?auto_470215 ?auto_470219 ) ) ( TRUCK-AT ?auto_470220 ?auto_470221 ) ( ON ?auto_470208 ?auto_470207 ) ( ON ?auto_470209 ?auto_470208 ) ( ON ?auto_470206 ?auto_470209 ) ( ON ?auto_470210 ?auto_470206 ) ( ON ?auto_470212 ?auto_470210 ) ( ON ?auto_470211 ?auto_470212 ) ( ON ?auto_470213 ?auto_470211 ) ( ON ?auto_470214 ?auto_470213 ) ( ON ?auto_470215 ?auto_470214 ) ( not ( = ?auto_470207 ?auto_470208 ) ) ( not ( = ?auto_470207 ?auto_470209 ) ) ( not ( = ?auto_470207 ?auto_470206 ) ) ( not ( = ?auto_470207 ?auto_470210 ) ) ( not ( = ?auto_470207 ?auto_470212 ) ) ( not ( = ?auto_470207 ?auto_470211 ) ) ( not ( = ?auto_470207 ?auto_470213 ) ) ( not ( = ?auto_470207 ?auto_470214 ) ) ( not ( = ?auto_470207 ?auto_470215 ) ) ( not ( = ?auto_470207 ?auto_470216 ) ) ( not ( = ?auto_470207 ?auto_470217 ) ) ( not ( = ?auto_470207 ?auto_470219 ) ) ( not ( = ?auto_470208 ?auto_470209 ) ) ( not ( = ?auto_470208 ?auto_470206 ) ) ( not ( = ?auto_470208 ?auto_470210 ) ) ( not ( = ?auto_470208 ?auto_470212 ) ) ( not ( = ?auto_470208 ?auto_470211 ) ) ( not ( = ?auto_470208 ?auto_470213 ) ) ( not ( = ?auto_470208 ?auto_470214 ) ) ( not ( = ?auto_470208 ?auto_470215 ) ) ( not ( = ?auto_470208 ?auto_470216 ) ) ( not ( = ?auto_470208 ?auto_470217 ) ) ( not ( = ?auto_470208 ?auto_470219 ) ) ( not ( = ?auto_470209 ?auto_470206 ) ) ( not ( = ?auto_470209 ?auto_470210 ) ) ( not ( = ?auto_470209 ?auto_470212 ) ) ( not ( = ?auto_470209 ?auto_470211 ) ) ( not ( = ?auto_470209 ?auto_470213 ) ) ( not ( = ?auto_470209 ?auto_470214 ) ) ( not ( = ?auto_470209 ?auto_470215 ) ) ( not ( = ?auto_470209 ?auto_470216 ) ) ( not ( = ?auto_470209 ?auto_470217 ) ) ( not ( = ?auto_470209 ?auto_470219 ) ) ( not ( = ?auto_470206 ?auto_470210 ) ) ( not ( = ?auto_470206 ?auto_470212 ) ) ( not ( = ?auto_470206 ?auto_470211 ) ) ( not ( = ?auto_470206 ?auto_470213 ) ) ( not ( = ?auto_470206 ?auto_470214 ) ) ( not ( = ?auto_470206 ?auto_470215 ) ) ( not ( = ?auto_470206 ?auto_470216 ) ) ( not ( = ?auto_470206 ?auto_470217 ) ) ( not ( = ?auto_470206 ?auto_470219 ) ) ( not ( = ?auto_470210 ?auto_470212 ) ) ( not ( = ?auto_470210 ?auto_470211 ) ) ( not ( = ?auto_470210 ?auto_470213 ) ) ( not ( = ?auto_470210 ?auto_470214 ) ) ( not ( = ?auto_470210 ?auto_470215 ) ) ( not ( = ?auto_470210 ?auto_470216 ) ) ( not ( = ?auto_470210 ?auto_470217 ) ) ( not ( = ?auto_470210 ?auto_470219 ) ) ( not ( = ?auto_470212 ?auto_470211 ) ) ( not ( = ?auto_470212 ?auto_470213 ) ) ( not ( = ?auto_470212 ?auto_470214 ) ) ( not ( = ?auto_470212 ?auto_470215 ) ) ( not ( = ?auto_470212 ?auto_470216 ) ) ( not ( = ?auto_470212 ?auto_470217 ) ) ( not ( = ?auto_470212 ?auto_470219 ) ) ( not ( = ?auto_470211 ?auto_470213 ) ) ( not ( = ?auto_470211 ?auto_470214 ) ) ( not ( = ?auto_470211 ?auto_470215 ) ) ( not ( = ?auto_470211 ?auto_470216 ) ) ( not ( = ?auto_470211 ?auto_470217 ) ) ( not ( = ?auto_470211 ?auto_470219 ) ) ( not ( = ?auto_470213 ?auto_470214 ) ) ( not ( = ?auto_470213 ?auto_470215 ) ) ( not ( = ?auto_470213 ?auto_470216 ) ) ( not ( = ?auto_470213 ?auto_470217 ) ) ( not ( = ?auto_470213 ?auto_470219 ) ) ( not ( = ?auto_470214 ?auto_470215 ) ) ( not ( = ?auto_470214 ?auto_470216 ) ) ( not ( = ?auto_470214 ?auto_470217 ) ) ( not ( = ?auto_470214 ?auto_470219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_470215 ?auto_470216 ?auto_470217 )
      ( MAKE-11CRATE-VERIFY ?auto_470207 ?auto_470208 ?auto_470209 ?auto_470206 ?auto_470210 ?auto_470212 ?auto_470211 ?auto_470213 ?auto_470214 ?auto_470215 ?auto_470216 ?auto_470217 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_470351 - SURFACE
      ?auto_470352 - SURFACE
      ?auto_470353 - SURFACE
      ?auto_470350 - SURFACE
      ?auto_470354 - SURFACE
      ?auto_470356 - SURFACE
      ?auto_470355 - SURFACE
      ?auto_470357 - SURFACE
      ?auto_470358 - SURFACE
      ?auto_470359 - SURFACE
      ?auto_470360 - SURFACE
      ?auto_470361 - SURFACE
    )
    :vars
    (
      ?auto_470363 - HOIST
      ?auto_470364 - PLACE
      ?auto_470366 - PLACE
      ?auto_470362 - HOIST
      ?auto_470365 - SURFACE
      ?auto_470367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_470363 ?auto_470364 ) ( IS-CRATE ?auto_470361 ) ( not ( = ?auto_470360 ?auto_470361 ) ) ( not ( = ?auto_470359 ?auto_470360 ) ) ( not ( = ?auto_470359 ?auto_470361 ) ) ( not ( = ?auto_470366 ?auto_470364 ) ) ( HOIST-AT ?auto_470362 ?auto_470366 ) ( not ( = ?auto_470363 ?auto_470362 ) ) ( AVAILABLE ?auto_470362 ) ( SURFACE-AT ?auto_470361 ?auto_470366 ) ( ON ?auto_470361 ?auto_470365 ) ( CLEAR ?auto_470361 ) ( not ( = ?auto_470360 ?auto_470365 ) ) ( not ( = ?auto_470361 ?auto_470365 ) ) ( not ( = ?auto_470359 ?auto_470365 ) ) ( TRUCK-AT ?auto_470367 ?auto_470364 ) ( SURFACE-AT ?auto_470359 ?auto_470364 ) ( CLEAR ?auto_470359 ) ( LIFTING ?auto_470363 ?auto_470360 ) ( IS-CRATE ?auto_470360 ) ( ON ?auto_470352 ?auto_470351 ) ( ON ?auto_470353 ?auto_470352 ) ( ON ?auto_470350 ?auto_470353 ) ( ON ?auto_470354 ?auto_470350 ) ( ON ?auto_470356 ?auto_470354 ) ( ON ?auto_470355 ?auto_470356 ) ( ON ?auto_470357 ?auto_470355 ) ( ON ?auto_470358 ?auto_470357 ) ( ON ?auto_470359 ?auto_470358 ) ( not ( = ?auto_470351 ?auto_470352 ) ) ( not ( = ?auto_470351 ?auto_470353 ) ) ( not ( = ?auto_470351 ?auto_470350 ) ) ( not ( = ?auto_470351 ?auto_470354 ) ) ( not ( = ?auto_470351 ?auto_470356 ) ) ( not ( = ?auto_470351 ?auto_470355 ) ) ( not ( = ?auto_470351 ?auto_470357 ) ) ( not ( = ?auto_470351 ?auto_470358 ) ) ( not ( = ?auto_470351 ?auto_470359 ) ) ( not ( = ?auto_470351 ?auto_470360 ) ) ( not ( = ?auto_470351 ?auto_470361 ) ) ( not ( = ?auto_470351 ?auto_470365 ) ) ( not ( = ?auto_470352 ?auto_470353 ) ) ( not ( = ?auto_470352 ?auto_470350 ) ) ( not ( = ?auto_470352 ?auto_470354 ) ) ( not ( = ?auto_470352 ?auto_470356 ) ) ( not ( = ?auto_470352 ?auto_470355 ) ) ( not ( = ?auto_470352 ?auto_470357 ) ) ( not ( = ?auto_470352 ?auto_470358 ) ) ( not ( = ?auto_470352 ?auto_470359 ) ) ( not ( = ?auto_470352 ?auto_470360 ) ) ( not ( = ?auto_470352 ?auto_470361 ) ) ( not ( = ?auto_470352 ?auto_470365 ) ) ( not ( = ?auto_470353 ?auto_470350 ) ) ( not ( = ?auto_470353 ?auto_470354 ) ) ( not ( = ?auto_470353 ?auto_470356 ) ) ( not ( = ?auto_470353 ?auto_470355 ) ) ( not ( = ?auto_470353 ?auto_470357 ) ) ( not ( = ?auto_470353 ?auto_470358 ) ) ( not ( = ?auto_470353 ?auto_470359 ) ) ( not ( = ?auto_470353 ?auto_470360 ) ) ( not ( = ?auto_470353 ?auto_470361 ) ) ( not ( = ?auto_470353 ?auto_470365 ) ) ( not ( = ?auto_470350 ?auto_470354 ) ) ( not ( = ?auto_470350 ?auto_470356 ) ) ( not ( = ?auto_470350 ?auto_470355 ) ) ( not ( = ?auto_470350 ?auto_470357 ) ) ( not ( = ?auto_470350 ?auto_470358 ) ) ( not ( = ?auto_470350 ?auto_470359 ) ) ( not ( = ?auto_470350 ?auto_470360 ) ) ( not ( = ?auto_470350 ?auto_470361 ) ) ( not ( = ?auto_470350 ?auto_470365 ) ) ( not ( = ?auto_470354 ?auto_470356 ) ) ( not ( = ?auto_470354 ?auto_470355 ) ) ( not ( = ?auto_470354 ?auto_470357 ) ) ( not ( = ?auto_470354 ?auto_470358 ) ) ( not ( = ?auto_470354 ?auto_470359 ) ) ( not ( = ?auto_470354 ?auto_470360 ) ) ( not ( = ?auto_470354 ?auto_470361 ) ) ( not ( = ?auto_470354 ?auto_470365 ) ) ( not ( = ?auto_470356 ?auto_470355 ) ) ( not ( = ?auto_470356 ?auto_470357 ) ) ( not ( = ?auto_470356 ?auto_470358 ) ) ( not ( = ?auto_470356 ?auto_470359 ) ) ( not ( = ?auto_470356 ?auto_470360 ) ) ( not ( = ?auto_470356 ?auto_470361 ) ) ( not ( = ?auto_470356 ?auto_470365 ) ) ( not ( = ?auto_470355 ?auto_470357 ) ) ( not ( = ?auto_470355 ?auto_470358 ) ) ( not ( = ?auto_470355 ?auto_470359 ) ) ( not ( = ?auto_470355 ?auto_470360 ) ) ( not ( = ?auto_470355 ?auto_470361 ) ) ( not ( = ?auto_470355 ?auto_470365 ) ) ( not ( = ?auto_470357 ?auto_470358 ) ) ( not ( = ?auto_470357 ?auto_470359 ) ) ( not ( = ?auto_470357 ?auto_470360 ) ) ( not ( = ?auto_470357 ?auto_470361 ) ) ( not ( = ?auto_470357 ?auto_470365 ) ) ( not ( = ?auto_470358 ?auto_470359 ) ) ( not ( = ?auto_470358 ?auto_470360 ) ) ( not ( = ?auto_470358 ?auto_470361 ) ) ( not ( = ?auto_470358 ?auto_470365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_470359 ?auto_470360 ?auto_470361 )
      ( MAKE-11CRATE-VERIFY ?auto_470351 ?auto_470352 ?auto_470353 ?auto_470350 ?auto_470354 ?auto_470356 ?auto_470355 ?auto_470357 ?auto_470358 ?auto_470359 ?auto_470360 ?auto_470361 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_470495 - SURFACE
      ?auto_470496 - SURFACE
      ?auto_470497 - SURFACE
      ?auto_470494 - SURFACE
      ?auto_470498 - SURFACE
      ?auto_470500 - SURFACE
      ?auto_470499 - SURFACE
      ?auto_470501 - SURFACE
      ?auto_470502 - SURFACE
      ?auto_470503 - SURFACE
      ?auto_470504 - SURFACE
      ?auto_470505 - SURFACE
    )
    :vars
    (
      ?auto_470511 - HOIST
      ?auto_470510 - PLACE
      ?auto_470509 - PLACE
      ?auto_470508 - HOIST
      ?auto_470507 - SURFACE
      ?auto_470506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_470511 ?auto_470510 ) ( IS-CRATE ?auto_470505 ) ( not ( = ?auto_470504 ?auto_470505 ) ) ( not ( = ?auto_470503 ?auto_470504 ) ) ( not ( = ?auto_470503 ?auto_470505 ) ) ( not ( = ?auto_470509 ?auto_470510 ) ) ( HOIST-AT ?auto_470508 ?auto_470509 ) ( not ( = ?auto_470511 ?auto_470508 ) ) ( AVAILABLE ?auto_470508 ) ( SURFACE-AT ?auto_470505 ?auto_470509 ) ( ON ?auto_470505 ?auto_470507 ) ( CLEAR ?auto_470505 ) ( not ( = ?auto_470504 ?auto_470507 ) ) ( not ( = ?auto_470505 ?auto_470507 ) ) ( not ( = ?auto_470503 ?auto_470507 ) ) ( TRUCK-AT ?auto_470506 ?auto_470510 ) ( SURFACE-AT ?auto_470503 ?auto_470510 ) ( CLEAR ?auto_470503 ) ( IS-CRATE ?auto_470504 ) ( AVAILABLE ?auto_470511 ) ( IN ?auto_470504 ?auto_470506 ) ( ON ?auto_470496 ?auto_470495 ) ( ON ?auto_470497 ?auto_470496 ) ( ON ?auto_470494 ?auto_470497 ) ( ON ?auto_470498 ?auto_470494 ) ( ON ?auto_470500 ?auto_470498 ) ( ON ?auto_470499 ?auto_470500 ) ( ON ?auto_470501 ?auto_470499 ) ( ON ?auto_470502 ?auto_470501 ) ( ON ?auto_470503 ?auto_470502 ) ( not ( = ?auto_470495 ?auto_470496 ) ) ( not ( = ?auto_470495 ?auto_470497 ) ) ( not ( = ?auto_470495 ?auto_470494 ) ) ( not ( = ?auto_470495 ?auto_470498 ) ) ( not ( = ?auto_470495 ?auto_470500 ) ) ( not ( = ?auto_470495 ?auto_470499 ) ) ( not ( = ?auto_470495 ?auto_470501 ) ) ( not ( = ?auto_470495 ?auto_470502 ) ) ( not ( = ?auto_470495 ?auto_470503 ) ) ( not ( = ?auto_470495 ?auto_470504 ) ) ( not ( = ?auto_470495 ?auto_470505 ) ) ( not ( = ?auto_470495 ?auto_470507 ) ) ( not ( = ?auto_470496 ?auto_470497 ) ) ( not ( = ?auto_470496 ?auto_470494 ) ) ( not ( = ?auto_470496 ?auto_470498 ) ) ( not ( = ?auto_470496 ?auto_470500 ) ) ( not ( = ?auto_470496 ?auto_470499 ) ) ( not ( = ?auto_470496 ?auto_470501 ) ) ( not ( = ?auto_470496 ?auto_470502 ) ) ( not ( = ?auto_470496 ?auto_470503 ) ) ( not ( = ?auto_470496 ?auto_470504 ) ) ( not ( = ?auto_470496 ?auto_470505 ) ) ( not ( = ?auto_470496 ?auto_470507 ) ) ( not ( = ?auto_470497 ?auto_470494 ) ) ( not ( = ?auto_470497 ?auto_470498 ) ) ( not ( = ?auto_470497 ?auto_470500 ) ) ( not ( = ?auto_470497 ?auto_470499 ) ) ( not ( = ?auto_470497 ?auto_470501 ) ) ( not ( = ?auto_470497 ?auto_470502 ) ) ( not ( = ?auto_470497 ?auto_470503 ) ) ( not ( = ?auto_470497 ?auto_470504 ) ) ( not ( = ?auto_470497 ?auto_470505 ) ) ( not ( = ?auto_470497 ?auto_470507 ) ) ( not ( = ?auto_470494 ?auto_470498 ) ) ( not ( = ?auto_470494 ?auto_470500 ) ) ( not ( = ?auto_470494 ?auto_470499 ) ) ( not ( = ?auto_470494 ?auto_470501 ) ) ( not ( = ?auto_470494 ?auto_470502 ) ) ( not ( = ?auto_470494 ?auto_470503 ) ) ( not ( = ?auto_470494 ?auto_470504 ) ) ( not ( = ?auto_470494 ?auto_470505 ) ) ( not ( = ?auto_470494 ?auto_470507 ) ) ( not ( = ?auto_470498 ?auto_470500 ) ) ( not ( = ?auto_470498 ?auto_470499 ) ) ( not ( = ?auto_470498 ?auto_470501 ) ) ( not ( = ?auto_470498 ?auto_470502 ) ) ( not ( = ?auto_470498 ?auto_470503 ) ) ( not ( = ?auto_470498 ?auto_470504 ) ) ( not ( = ?auto_470498 ?auto_470505 ) ) ( not ( = ?auto_470498 ?auto_470507 ) ) ( not ( = ?auto_470500 ?auto_470499 ) ) ( not ( = ?auto_470500 ?auto_470501 ) ) ( not ( = ?auto_470500 ?auto_470502 ) ) ( not ( = ?auto_470500 ?auto_470503 ) ) ( not ( = ?auto_470500 ?auto_470504 ) ) ( not ( = ?auto_470500 ?auto_470505 ) ) ( not ( = ?auto_470500 ?auto_470507 ) ) ( not ( = ?auto_470499 ?auto_470501 ) ) ( not ( = ?auto_470499 ?auto_470502 ) ) ( not ( = ?auto_470499 ?auto_470503 ) ) ( not ( = ?auto_470499 ?auto_470504 ) ) ( not ( = ?auto_470499 ?auto_470505 ) ) ( not ( = ?auto_470499 ?auto_470507 ) ) ( not ( = ?auto_470501 ?auto_470502 ) ) ( not ( = ?auto_470501 ?auto_470503 ) ) ( not ( = ?auto_470501 ?auto_470504 ) ) ( not ( = ?auto_470501 ?auto_470505 ) ) ( not ( = ?auto_470501 ?auto_470507 ) ) ( not ( = ?auto_470502 ?auto_470503 ) ) ( not ( = ?auto_470502 ?auto_470504 ) ) ( not ( = ?auto_470502 ?auto_470505 ) ) ( not ( = ?auto_470502 ?auto_470507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_470503 ?auto_470504 ?auto_470505 )
      ( MAKE-11CRATE-VERIFY ?auto_470495 ?auto_470496 ?auto_470497 ?auto_470494 ?auto_470498 ?auto_470500 ?auto_470499 ?auto_470501 ?auto_470502 ?auto_470503 ?auto_470504 ?auto_470505 ) )
  )

)

