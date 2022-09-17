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
      ?auto_6667 - SURFACE
      ?auto_6668 - SURFACE
    )
    :vars
    (
      ?auto_6669 - HOIST
      ?auto_6670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6669 ?auto_6670 ) ( SURFACE-AT ?auto_6668 ?auto_6670 ) ( CLEAR ?auto_6668 ) ( LIFTING ?auto_6669 ?auto_6667 ) ( IS-CRATE ?auto_6667 ) ( not ( = ?auto_6667 ?auto_6668 ) ) )
    :subtasks
    ( ( !DROP ?auto_6669 ?auto_6667 ?auto_6668 ?auto_6670 )
      ( MAKE-ON-VERIFY ?auto_6667 ?auto_6668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6671 - SURFACE
      ?auto_6672 - SURFACE
    )
    :vars
    (
      ?auto_6674 - HOIST
      ?auto_6673 - PLACE
      ?auto_6675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6674 ?auto_6673 ) ( SURFACE-AT ?auto_6672 ?auto_6673 ) ( CLEAR ?auto_6672 ) ( IS-CRATE ?auto_6671 ) ( not ( = ?auto_6671 ?auto_6672 ) ) ( TRUCK-AT ?auto_6675 ?auto_6673 ) ( AVAILABLE ?auto_6674 ) ( IN ?auto_6671 ?auto_6675 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6674 ?auto_6671 ?auto_6675 ?auto_6673 )
      ( MAKE-ON ?auto_6671 ?auto_6672 )
      ( MAKE-ON-VERIFY ?auto_6671 ?auto_6672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6676 - SURFACE
      ?auto_6677 - SURFACE
    )
    :vars
    (
      ?auto_6679 - HOIST
      ?auto_6678 - PLACE
      ?auto_6680 - TRUCK
      ?auto_6681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6679 ?auto_6678 ) ( SURFACE-AT ?auto_6677 ?auto_6678 ) ( CLEAR ?auto_6677 ) ( IS-CRATE ?auto_6676 ) ( not ( = ?auto_6676 ?auto_6677 ) ) ( AVAILABLE ?auto_6679 ) ( IN ?auto_6676 ?auto_6680 ) ( TRUCK-AT ?auto_6680 ?auto_6681 ) ( not ( = ?auto_6681 ?auto_6678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6680 ?auto_6681 ?auto_6678 )
      ( MAKE-ON ?auto_6676 ?auto_6677 )
      ( MAKE-ON-VERIFY ?auto_6676 ?auto_6677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6682 - SURFACE
      ?auto_6683 - SURFACE
    )
    :vars
    (
      ?auto_6685 - HOIST
      ?auto_6684 - PLACE
      ?auto_6686 - TRUCK
      ?auto_6687 - PLACE
      ?auto_6688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6685 ?auto_6684 ) ( SURFACE-AT ?auto_6683 ?auto_6684 ) ( CLEAR ?auto_6683 ) ( IS-CRATE ?auto_6682 ) ( not ( = ?auto_6682 ?auto_6683 ) ) ( AVAILABLE ?auto_6685 ) ( TRUCK-AT ?auto_6686 ?auto_6687 ) ( not ( = ?auto_6687 ?auto_6684 ) ) ( HOIST-AT ?auto_6688 ?auto_6687 ) ( LIFTING ?auto_6688 ?auto_6682 ) ( not ( = ?auto_6685 ?auto_6688 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6688 ?auto_6682 ?auto_6686 ?auto_6687 )
      ( MAKE-ON ?auto_6682 ?auto_6683 )
      ( MAKE-ON-VERIFY ?auto_6682 ?auto_6683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6689 - SURFACE
      ?auto_6690 - SURFACE
    )
    :vars
    (
      ?auto_6693 - HOIST
      ?auto_6691 - PLACE
      ?auto_6692 - TRUCK
      ?auto_6695 - PLACE
      ?auto_6694 - HOIST
      ?auto_6696 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6693 ?auto_6691 ) ( SURFACE-AT ?auto_6690 ?auto_6691 ) ( CLEAR ?auto_6690 ) ( IS-CRATE ?auto_6689 ) ( not ( = ?auto_6689 ?auto_6690 ) ) ( AVAILABLE ?auto_6693 ) ( TRUCK-AT ?auto_6692 ?auto_6695 ) ( not ( = ?auto_6695 ?auto_6691 ) ) ( HOIST-AT ?auto_6694 ?auto_6695 ) ( not ( = ?auto_6693 ?auto_6694 ) ) ( AVAILABLE ?auto_6694 ) ( SURFACE-AT ?auto_6689 ?auto_6695 ) ( ON ?auto_6689 ?auto_6696 ) ( CLEAR ?auto_6689 ) ( not ( = ?auto_6689 ?auto_6696 ) ) ( not ( = ?auto_6690 ?auto_6696 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6694 ?auto_6689 ?auto_6696 ?auto_6695 )
      ( MAKE-ON ?auto_6689 ?auto_6690 )
      ( MAKE-ON-VERIFY ?auto_6689 ?auto_6690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6697 - SURFACE
      ?auto_6698 - SURFACE
    )
    :vars
    (
      ?auto_6704 - HOIST
      ?auto_6699 - PLACE
      ?auto_6701 - PLACE
      ?auto_6702 - HOIST
      ?auto_6700 - SURFACE
      ?auto_6703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6704 ?auto_6699 ) ( SURFACE-AT ?auto_6698 ?auto_6699 ) ( CLEAR ?auto_6698 ) ( IS-CRATE ?auto_6697 ) ( not ( = ?auto_6697 ?auto_6698 ) ) ( AVAILABLE ?auto_6704 ) ( not ( = ?auto_6701 ?auto_6699 ) ) ( HOIST-AT ?auto_6702 ?auto_6701 ) ( not ( = ?auto_6704 ?auto_6702 ) ) ( AVAILABLE ?auto_6702 ) ( SURFACE-AT ?auto_6697 ?auto_6701 ) ( ON ?auto_6697 ?auto_6700 ) ( CLEAR ?auto_6697 ) ( not ( = ?auto_6697 ?auto_6700 ) ) ( not ( = ?auto_6698 ?auto_6700 ) ) ( TRUCK-AT ?auto_6703 ?auto_6699 ) )
    :subtasks
    ( ( !DRIVE ?auto_6703 ?auto_6699 ?auto_6701 )
      ( MAKE-ON ?auto_6697 ?auto_6698 )
      ( MAKE-ON-VERIFY ?auto_6697 ?auto_6698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6745 - SURFACE
      ?auto_6746 - SURFACE
    )
    :vars
    (
      ?auto_6750 - HOIST
      ?auto_6751 - PLACE
      ?auto_6748 - PLACE
      ?auto_6749 - HOIST
      ?auto_6752 - SURFACE
      ?auto_6747 - TRUCK
      ?auto_6753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6750 ?auto_6751 ) ( IS-CRATE ?auto_6745 ) ( not ( = ?auto_6745 ?auto_6746 ) ) ( not ( = ?auto_6748 ?auto_6751 ) ) ( HOIST-AT ?auto_6749 ?auto_6748 ) ( not ( = ?auto_6750 ?auto_6749 ) ) ( AVAILABLE ?auto_6749 ) ( SURFACE-AT ?auto_6745 ?auto_6748 ) ( ON ?auto_6745 ?auto_6752 ) ( CLEAR ?auto_6745 ) ( not ( = ?auto_6745 ?auto_6752 ) ) ( not ( = ?auto_6746 ?auto_6752 ) ) ( TRUCK-AT ?auto_6747 ?auto_6751 ) ( SURFACE-AT ?auto_6753 ?auto_6751 ) ( CLEAR ?auto_6753 ) ( LIFTING ?auto_6750 ?auto_6746 ) ( IS-CRATE ?auto_6746 ) ( not ( = ?auto_6745 ?auto_6753 ) ) ( not ( = ?auto_6746 ?auto_6753 ) ) ( not ( = ?auto_6752 ?auto_6753 ) ) )
    :subtasks
    ( ( !DROP ?auto_6750 ?auto_6746 ?auto_6753 ?auto_6751 )
      ( MAKE-ON ?auto_6745 ?auto_6746 )
      ( MAKE-ON-VERIFY ?auto_6745 ?auto_6746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6754 - SURFACE
      ?auto_6755 - SURFACE
    )
    :vars
    (
      ?auto_6756 - HOIST
      ?auto_6759 - PLACE
      ?auto_6760 - PLACE
      ?auto_6761 - HOIST
      ?auto_6757 - SURFACE
      ?auto_6758 - TRUCK
      ?auto_6762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6756 ?auto_6759 ) ( IS-CRATE ?auto_6754 ) ( not ( = ?auto_6754 ?auto_6755 ) ) ( not ( = ?auto_6760 ?auto_6759 ) ) ( HOIST-AT ?auto_6761 ?auto_6760 ) ( not ( = ?auto_6756 ?auto_6761 ) ) ( AVAILABLE ?auto_6761 ) ( SURFACE-AT ?auto_6754 ?auto_6760 ) ( ON ?auto_6754 ?auto_6757 ) ( CLEAR ?auto_6754 ) ( not ( = ?auto_6754 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( TRUCK-AT ?auto_6758 ?auto_6759 ) ( SURFACE-AT ?auto_6762 ?auto_6759 ) ( CLEAR ?auto_6762 ) ( IS-CRATE ?auto_6755 ) ( not ( = ?auto_6754 ?auto_6762 ) ) ( not ( = ?auto_6755 ?auto_6762 ) ) ( not ( = ?auto_6757 ?auto_6762 ) ) ( AVAILABLE ?auto_6756 ) ( IN ?auto_6755 ?auto_6758 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6756 ?auto_6755 ?auto_6758 ?auto_6759 )
      ( MAKE-ON ?auto_6754 ?auto_6755 )
      ( MAKE-ON-VERIFY ?auto_6754 ?auto_6755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_6769 - SURFACE
      ?auto_6770 - SURFACE
    )
    :vars
    (
      ?auto_6775 - HOIST
      ?auto_6771 - PLACE
      ?auto_6776 - PLACE
      ?auto_6774 - HOIST
      ?auto_6773 - SURFACE
      ?auto_6772 - TRUCK
      ?auto_6777 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6775 ?auto_6771 ) ( SURFACE-AT ?auto_6770 ?auto_6771 ) ( CLEAR ?auto_6770 ) ( IS-CRATE ?auto_6769 ) ( not ( = ?auto_6769 ?auto_6770 ) ) ( AVAILABLE ?auto_6775 ) ( not ( = ?auto_6776 ?auto_6771 ) ) ( HOIST-AT ?auto_6774 ?auto_6776 ) ( not ( = ?auto_6775 ?auto_6774 ) ) ( AVAILABLE ?auto_6774 ) ( SURFACE-AT ?auto_6769 ?auto_6776 ) ( ON ?auto_6769 ?auto_6773 ) ( CLEAR ?auto_6769 ) ( not ( = ?auto_6769 ?auto_6773 ) ) ( not ( = ?auto_6770 ?auto_6773 ) ) ( TRUCK-AT ?auto_6772 ?auto_6777 ) ( not ( = ?auto_6777 ?auto_6771 ) ) ( not ( = ?auto_6776 ?auto_6777 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6772 ?auto_6777 ?auto_6771 )
      ( MAKE-ON ?auto_6769 ?auto_6770 )
      ( MAKE-ON-VERIFY ?auto_6769 ?auto_6770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7051 - SURFACE
      ?auto_7052 - SURFACE
    )
    :vars
    (
      ?auto_7057 - HOIST
      ?auto_7056 - PLACE
      ?auto_7055 - TRUCK
      ?auto_7058 - PLACE
      ?auto_7054 - HOIST
      ?auto_7053 - SURFACE
      ?auto_7059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7057 ?auto_7056 ) ( SURFACE-AT ?auto_7052 ?auto_7056 ) ( CLEAR ?auto_7052 ) ( IS-CRATE ?auto_7051 ) ( not ( = ?auto_7051 ?auto_7052 ) ) ( AVAILABLE ?auto_7057 ) ( TRUCK-AT ?auto_7055 ?auto_7058 ) ( not ( = ?auto_7058 ?auto_7056 ) ) ( HOIST-AT ?auto_7054 ?auto_7058 ) ( not ( = ?auto_7057 ?auto_7054 ) ) ( SURFACE-AT ?auto_7051 ?auto_7058 ) ( ON ?auto_7051 ?auto_7053 ) ( CLEAR ?auto_7051 ) ( not ( = ?auto_7051 ?auto_7053 ) ) ( not ( = ?auto_7052 ?auto_7053 ) ) ( LIFTING ?auto_7054 ?auto_7059 ) ( IS-CRATE ?auto_7059 ) ( not ( = ?auto_7051 ?auto_7059 ) ) ( not ( = ?auto_7052 ?auto_7059 ) ) ( not ( = ?auto_7053 ?auto_7059 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7054 ?auto_7059 ?auto_7055 ?auto_7058 )
      ( MAKE-ON ?auto_7051 ?auto_7052 )
      ( MAKE-ON-VERIFY ?auto_7051 ?auto_7052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7186 - SURFACE
      ?auto_7187 - SURFACE
    )
    :vars
    (
      ?auto_7193 - HOIST
      ?auto_7191 - PLACE
      ?auto_7189 - PLACE
      ?auto_7192 - HOIST
      ?auto_7190 - SURFACE
      ?auto_7188 - TRUCK
      ?auto_7194 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7193 ?auto_7191 ) ( SURFACE-AT ?auto_7187 ?auto_7191 ) ( CLEAR ?auto_7187 ) ( IS-CRATE ?auto_7186 ) ( not ( = ?auto_7186 ?auto_7187 ) ) ( not ( = ?auto_7189 ?auto_7191 ) ) ( HOIST-AT ?auto_7192 ?auto_7189 ) ( not ( = ?auto_7193 ?auto_7192 ) ) ( AVAILABLE ?auto_7192 ) ( SURFACE-AT ?auto_7186 ?auto_7189 ) ( ON ?auto_7186 ?auto_7190 ) ( CLEAR ?auto_7186 ) ( not ( = ?auto_7186 ?auto_7190 ) ) ( not ( = ?auto_7187 ?auto_7190 ) ) ( TRUCK-AT ?auto_7188 ?auto_7191 ) ( LIFTING ?auto_7193 ?auto_7194 ) ( IS-CRATE ?auto_7194 ) ( not ( = ?auto_7186 ?auto_7194 ) ) ( not ( = ?auto_7187 ?auto_7194 ) ) ( not ( = ?auto_7190 ?auto_7194 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7193 ?auto_7194 ?auto_7188 ?auto_7191 )
      ( MAKE-ON ?auto_7186 ?auto_7187 )
      ( MAKE-ON-VERIFY ?auto_7186 ?auto_7187 ) )
  )

)

