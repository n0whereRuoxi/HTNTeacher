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
      ?auto_32724 - SURFACE
      ?auto_32725 - SURFACE
    )
    :vars
    (
      ?auto_32726 - HOIST
      ?auto_32727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32726 ?auto_32727 ) ( SURFACE-AT ?auto_32725 ?auto_32727 ) ( CLEAR ?auto_32725 ) ( LIFTING ?auto_32726 ?auto_32724 ) ( IS-CRATE ?auto_32724 ) ( not ( = ?auto_32724 ?auto_32725 ) ) )
    :subtasks
    ( ( !DROP ?auto_32726 ?auto_32724 ?auto_32725 ?auto_32727 )
      ( MAKE-ON-VERIFY ?auto_32724 ?auto_32725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32728 - SURFACE
      ?auto_32729 - SURFACE
    )
    :vars
    (
      ?auto_32731 - HOIST
      ?auto_32730 - PLACE
      ?auto_32732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32731 ?auto_32730 ) ( SURFACE-AT ?auto_32729 ?auto_32730 ) ( CLEAR ?auto_32729 ) ( IS-CRATE ?auto_32728 ) ( not ( = ?auto_32728 ?auto_32729 ) ) ( TRUCK-AT ?auto_32732 ?auto_32730 ) ( AVAILABLE ?auto_32731 ) ( IN ?auto_32728 ?auto_32732 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32731 ?auto_32728 ?auto_32732 ?auto_32730 )
      ( MAKE-ON ?auto_32728 ?auto_32729 )
      ( MAKE-ON-VERIFY ?auto_32728 ?auto_32729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32733 - SURFACE
      ?auto_32734 - SURFACE
    )
    :vars
    (
      ?auto_32736 - HOIST
      ?auto_32737 - PLACE
      ?auto_32735 - TRUCK
      ?auto_32738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32736 ?auto_32737 ) ( SURFACE-AT ?auto_32734 ?auto_32737 ) ( CLEAR ?auto_32734 ) ( IS-CRATE ?auto_32733 ) ( not ( = ?auto_32733 ?auto_32734 ) ) ( AVAILABLE ?auto_32736 ) ( IN ?auto_32733 ?auto_32735 ) ( TRUCK-AT ?auto_32735 ?auto_32738 ) ( not ( = ?auto_32738 ?auto_32737 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32735 ?auto_32738 ?auto_32737 )
      ( MAKE-ON ?auto_32733 ?auto_32734 )
      ( MAKE-ON-VERIFY ?auto_32733 ?auto_32734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32739 - SURFACE
      ?auto_32740 - SURFACE
    )
    :vars
    (
      ?auto_32744 - HOIST
      ?auto_32742 - PLACE
      ?auto_32741 - TRUCK
      ?auto_32743 - PLACE
      ?auto_32745 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32744 ?auto_32742 ) ( SURFACE-AT ?auto_32740 ?auto_32742 ) ( CLEAR ?auto_32740 ) ( IS-CRATE ?auto_32739 ) ( not ( = ?auto_32739 ?auto_32740 ) ) ( AVAILABLE ?auto_32744 ) ( TRUCK-AT ?auto_32741 ?auto_32743 ) ( not ( = ?auto_32743 ?auto_32742 ) ) ( HOIST-AT ?auto_32745 ?auto_32743 ) ( LIFTING ?auto_32745 ?auto_32739 ) ( not ( = ?auto_32744 ?auto_32745 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32745 ?auto_32739 ?auto_32741 ?auto_32743 )
      ( MAKE-ON ?auto_32739 ?auto_32740 )
      ( MAKE-ON-VERIFY ?auto_32739 ?auto_32740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32746 - SURFACE
      ?auto_32747 - SURFACE
    )
    :vars
    (
      ?auto_32749 - HOIST
      ?auto_32752 - PLACE
      ?auto_32751 - TRUCK
      ?auto_32748 - PLACE
      ?auto_32750 - HOIST
      ?auto_32753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32749 ?auto_32752 ) ( SURFACE-AT ?auto_32747 ?auto_32752 ) ( CLEAR ?auto_32747 ) ( IS-CRATE ?auto_32746 ) ( not ( = ?auto_32746 ?auto_32747 ) ) ( AVAILABLE ?auto_32749 ) ( TRUCK-AT ?auto_32751 ?auto_32748 ) ( not ( = ?auto_32748 ?auto_32752 ) ) ( HOIST-AT ?auto_32750 ?auto_32748 ) ( not ( = ?auto_32749 ?auto_32750 ) ) ( AVAILABLE ?auto_32750 ) ( SURFACE-AT ?auto_32746 ?auto_32748 ) ( ON ?auto_32746 ?auto_32753 ) ( CLEAR ?auto_32746 ) ( not ( = ?auto_32746 ?auto_32753 ) ) ( not ( = ?auto_32747 ?auto_32753 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32750 ?auto_32746 ?auto_32753 ?auto_32748 )
      ( MAKE-ON ?auto_32746 ?auto_32747 )
      ( MAKE-ON-VERIFY ?auto_32746 ?auto_32747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32754 - SURFACE
      ?auto_32755 - SURFACE
    )
    :vars
    (
      ?auto_32759 - HOIST
      ?auto_32757 - PLACE
      ?auto_32756 - PLACE
      ?auto_32760 - HOIST
      ?auto_32761 - SURFACE
      ?auto_32758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32759 ?auto_32757 ) ( SURFACE-AT ?auto_32755 ?auto_32757 ) ( CLEAR ?auto_32755 ) ( IS-CRATE ?auto_32754 ) ( not ( = ?auto_32754 ?auto_32755 ) ) ( AVAILABLE ?auto_32759 ) ( not ( = ?auto_32756 ?auto_32757 ) ) ( HOIST-AT ?auto_32760 ?auto_32756 ) ( not ( = ?auto_32759 ?auto_32760 ) ) ( AVAILABLE ?auto_32760 ) ( SURFACE-AT ?auto_32754 ?auto_32756 ) ( ON ?auto_32754 ?auto_32761 ) ( CLEAR ?auto_32754 ) ( not ( = ?auto_32754 ?auto_32761 ) ) ( not ( = ?auto_32755 ?auto_32761 ) ) ( TRUCK-AT ?auto_32758 ?auto_32757 ) )
    :subtasks
    ( ( !DRIVE ?auto_32758 ?auto_32757 ?auto_32756 )
      ( MAKE-ON ?auto_32754 ?auto_32755 )
      ( MAKE-ON-VERIFY ?auto_32754 ?auto_32755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32802 - SURFACE
      ?auto_32803 - SURFACE
    )
    :vars
    (
      ?auto_32806 - HOIST
      ?auto_32807 - PLACE
      ?auto_32804 - PLACE
      ?auto_32808 - HOIST
      ?auto_32809 - SURFACE
      ?auto_32805 - TRUCK
      ?auto_32810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32806 ?auto_32807 ) ( IS-CRATE ?auto_32802 ) ( not ( = ?auto_32802 ?auto_32803 ) ) ( not ( = ?auto_32804 ?auto_32807 ) ) ( HOIST-AT ?auto_32808 ?auto_32804 ) ( not ( = ?auto_32806 ?auto_32808 ) ) ( AVAILABLE ?auto_32808 ) ( SURFACE-AT ?auto_32802 ?auto_32804 ) ( ON ?auto_32802 ?auto_32809 ) ( CLEAR ?auto_32802 ) ( not ( = ?auto_32802 ?auto_32809 ) ) ( not ( = ?auto_32803 ?auto_32809 ) ) ( TRUCK-AT ?auto_32805 ?auto_32807 ) ( SURFACE-AT ?auto_32810 ?auto_32807 ) ( CLEAR ?auto_32810 ) ( LIFTING ?auto_32806 ?auto_32803 ) ( IS-CRATE ?auto_32803 ) ( not ( = ?auto_32802 ?auto_32810 ) ) ( not ( = ?auto_32803 ?auto_32810 ) ) ( not ( = ?auto_32809 ?auto_32810 ) ) )
    :subtasks
    ( ( !DROP ?auto_32806 ?auto_32803 ?auto_32810 ?auto_32807 )
      ( MAKE-ON ?auto_32802 ?auto_32803 )
      ( MAKE-ON-VERIFY ?auto_32802 ?auto_32803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32811 - SURFACE
      ?auto_32812 - SURFACE
    )
    :vars
    (
      ?auto_32818 - HOIST
      ?auto_32815 - PLACE
      ?auto_32819 - PLACE
      ?auto_32817 - HOIST
      ?auto_32814 - SURFACE
      ?auto_32813 - TRUCK
      ?auto_32816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32818 ?auto_32815 ) ( IS-CRATE ?auto_32811 ) ( not ( = ?auto_32811 ?auto_32812 ) ) ( not ( = ?auto_32819 ?auto_32815 ) ) ( HOIST-AT ?auto_32817 ?auto_32819 ) ( not ( = ?auto_32818 ?auto_32817 ) ) ( AVAILABLE ?auto_32817 ) ( SURFACE-AT ?auto_32811 ?auto_32819 ) ( ON ?auto_32811 ?auto_32814 ) ( CLEAR ?auto_32811 ) ( not ( = ?auto_32811 ?auto_32814 ) ) ( not ( = ?auto_32812 ?auto_32814 ) ) ( TRUCK-AT ?auto_32813 ?auto_32815 ) ( SURFACE-AT ?auto_32816 ?auto_32815 ) ( CLEAR ?auto_32816 ) ( IS-CRATE ?auto_32812 ) ( not ( = ?auto_32811 ?auto_32816 ) ) ( not ( = ?auto_32812 ?auto_32816 ) ) ( not ( = ?auto_32814 ?auto_32816 ) ) ( AVAILABLE ?auto_32818 ) ( IN ?auto_32812 ?auto_32813 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32818 ?auto_32812 ?auto_32813 ?auto_32815 )
      ( MAKE-ON ?auto_32811 ?auto_32812 )
      ( MAKE-ON-VERIFY ?auto_32811 ?auto_32812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32826 - SURFACE
      ?auto_32827 - SURFACE
    )
    :vars
    (
      ?auto_32832 - HOIST
      ?auto_32831 - PLACE
      ?auto_32830 - PLACE
      ?auto_32833 - HOIST
      ?auto_32828 - SURFACE
      ?auto_32829 - TRUCK
      ?auto_32834 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32832 ?auto_32831 ) ( SURFACE-AT ?auto_32827 ?auto_32831 ) ( CLEAR ?auto_32827 ) ( IS-CRATE ?auto_32826 ) ( not ( = ?auto_32826 ?auto_32827 ) ) ( AVAILABLE ?auto_32832 ) ( not ( = ?auto_32830 ?auto_32831 ) ) ( HOIST-AT ?auto_32833 ?auto_32830 ) ( not ( = ?auto_32832 ?auto_32833 ) ) ( AVAILABLE ?auto_32833 ) ( SURFACE-AT ?auto_32826 ?auto_32830 ) ( ON ?auto_32826 ?auto_32828 ) ( CLEAR ?auto_32826 ) ( not ( = ?auto_32826 ?auto_32828 ) ) ( not ( = ?auto_32827 ?auto_32828 ) ) ( TRUCK-AT ?auto_32829 ?auto_32834 ) ( not ( = ?auto_32834 ?auto_32831 ) ) ( not ( = ?auto_32830 ?auto_32834 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32829 ?auto_32834 ?auto_32831 )
      ( MAKE-ON ?auto_32826 ?auto_32827 )
      ( MAKE-ON-VERIFY ?auto_32826 ?auto_32827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33350 - SURFACE
      ?auto_33351 - SURFACE
    )
    :vars
    (
      ?auto_33353 - HOIST
      ?auto_33354 - PLACE
      ?auto_33356 - TRUCK
      ?auto_33355 - PLACE
      ?auto_33352 - HOIST
      ?auto_33357 - SURFACE
      ?auto_33358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33353 ?auto_33354 ) ( SURFACE-AT ?auto_33351 ?auto_33354 ) ( CLEAR ?auto_33351 ) ( IS-CRATE ?auto_33350 ) ( not ( = ?auto_33350 ?auto_33351 ) ) ( AVAILABLE ?auto_33353 ) ( TRUCK-AT ?auto_33356 ?auto_33355 ) ( not ( = ?auto_33355 ?auto_33354 ) ) ( HOIST-AT ?auto_33352 ?auto_33355 ) ( not ( = ?auto_33353 ?auto_33352 ) ) ( SURFACE-AT ?auto_33350 ?auto_33355 ) ( ON ?auto_33350 ?auto_33357 ) ( CLEAR ?auto_33350 ) ( not ( = ?auto_33350 ?auto_33357 ) ) ( not ( = ?auto_33351 ?auto_33357 ) ) ( LIFTING ?auto_33352 ?auto_33358 ) ( IS-CRATE ?auto_33358 ) ( not ( = ?auto_33350 ?auto_33358 ) ) ( not ( = ?auto_33351 ?auto_33358 ) ) ( not ( = ?auto_33357 ?auto_33358 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33352 ?auto_33358 ?auto_33356 ?auto_33355 )
      ( MAKE-ON ?auto_33350 ?auto_33351 )
      ( MAKE-ON-VERIFY ?auto_33350 ?auto_33351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33509 - SURFACE
      ?auto_33510 - SURFACE
    )
    :vars
    (
      ?auto_33511 - HOIST
      ?auto_33514 - PLACE
      ?auto_33513 - PLACE
      ?auto_33515 - HOIST
      ?auto_33516 - SURFACE
      ?auto_33512 - TRUCK
      ?auto_33517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33511 ?auto_33514 ) ( SURFACE-AT ?auto_33510 ?auto_33514 ) ( CLEAR ?auto_33510 ) ( IS-CRATE ?auto_33509 ) ( not ( = ?auto_33509 ?auto_33510 ) ) ( not ( = ?auto_33513 ?auto_33514 ) ) ( HOIST-AT ?auto_33515 ?auto_33513 ) ( not ( = ?auto_33511 ?auto_33515 ) ) ( AVAILABLE ?auto_33515 ) ( SURFACE-AT ?auto_33509 ?auto_33513 ) ( ON ?auto_33509 ?auto_33516 ) ( CLEAR ?auto_33509 ) ( not ( = ?auto_33509 ?auto_33516 ) ) ( not ( = ?auto_33510 ?auto_33516 ) ) ( TRUCK-AT ?auto_33512 ?auto_33514 ) ( LIFTING ?auto_33511 ?auto_33517 ) ( IS-CRATE ?auto_33517 ) ( not ( = ?auto_33509 ?auto_33517 ) ) ( not ( = ?auto_33510 ?auto_33517 ) ) ( not ( = ?auto_33516 ?auto_33517 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33511 ?auto_33517 ?auto_33512 ?auto_33514 )
      ( MAKE-ON ?auto_33509 ?auto_33510 )
      ( MAKE-ON-VERIFY ?auto_33509 ?auto_33510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33768 - SURFACE
      ?auto_33769 - SURFACE
    )
    :vars
    (
      ?auto_33772 - HOIST
      ?auto_33776 - PLACE
      ?auto_33771 - PLACE
      ?auto_33774 - HOIST
      ?auto_33775 - SURFACE
      ?auto_33773 - SURFACE
      ?auto_33770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33772 ?auto_33776 ) ( IS-CRATE ?auto_33768 ) ( not ( = ?auto_33768 ?auto_33769 ) ) ( not ( = ?auto_33771 ?auto_33776 ) ) ( HOIST-AT ?auto_33774 ?auto_33771 ) ( not ( = ?auto_33772 ?auto_33774 ) ) ( AVAILABLE ?auto_33774 ) ( SURFACE-AT ?auto_33768 ?auto_33771 ) ( ON ?auto_33768 ?auto_33775 ) ( CLEAR ?auto_33768 ) ( not ( = ?auto_33768 ?auto_33775 ) ) ( not ( = ?auto_33769 ?auto_33775 ) ) ( SURFACE-AT ?auto_33773 ?auto_33776 ) ( CLEAR ?auto_33773 ) ( IS-CRATE ?auto_33769 ) ( not ( = ?auto_33768 ?auto_33773 ) ) ( not ( = ?auto_33769 ?auto_33773 ) ) ( not ( = ?auto_33775 ?auto_33773 ) ) ( AVAILABLE ?auto_33772 ) ( IN ?auto_33769 ?auto_33770 ) ( TRUCK-AT ?auto_33770 ?auto_33771 ) )
    :subtasks
    ( ( !DRIVE ?auto_33770 ?auto_33771 ?auto_33776 )
      ( MAKE-ON ?auto_33768 ?auto_33769 )
      ( MAKE-ON-VERIFY ?auto_33768 ?auto_33769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33777 - SURFACE
      ?auto_33778 - SURFACE
    )
    :vars
    (
      ?auto_33785 - HOIST
      ?auto_33780 - PLACE
      ?auto_33781 - PLACE
      ?auto_33783 - HOIST
      ?auto_33779 - SURFACE
      ?auto_33782 - SURFACE
      ?auto_33784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33785 ?auto_33780 ) ( IS-CRATE ?auto_33777 ) ( not ( = ?auto_33777 ?auto_33778 ) ) ( not ( = ?auto_33781 ?auto_33780 ) ) ( HOIST-AT ?auto_33783 ?auto_33781 ) ( not ( = ?auto_33785 ?auto_33783 ) ) ( SURFACE-AT ?auto_33777 ?auto_33781 ) ( ON ?auto_33777 ?auto_33779 ) ( CLEAR ?auto_33777 ) ( not ( = ?auto_33777 ?auto_33779 ) ) ( not ( = ?auto_33778 ?auto_33779 ) ) ( SURFACE-AT ?auto_33782 ?auto_33780 ) ( CLEAR ?auto_33782 ) ( IS-CRATE ?auto_33778 ) ( not ( = ?auto_33777 ?auto_33782 ) ) ( not ( = ?auto_33778 ?auto_33782 ) ) ( not ( = ?auto_33779 ?auto_33782 ) ) ( AVAILABLE ?auto_33785 ) ( TRUCK-AT ?auto_33784 ?auto_33781 ) ( LIFTING ?auto_33783 ?auto_33778 ) )
    :subtasks
    ( ( !LOAD ?auto_33783 ?auto_33778 ?auto_33784 ?auto_33781 )
      ( MAKE-ON ?auto_33777 ?auto_33778 )
      ( MAKE-ON-VERIFY ?auto_33777 ?auto_33778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33786 - SURFACE
      ?auto_33787 - SURFACE
    )
    :vars
    (
      ?auto_33794 - HOIST
      ?auto_33789 - PLACE
      ?auto_33790 - PLACE
      ?auto_33793 - HOIST
      ?auto_33791 - SURFACE
      ?auto_33792 - SURFACE
      ?auto_33788 - TRUCK
      ?auto_33795 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33794 ?auto_33789 ) ( IS-CRATE ?auto_33786 ) ( not ( = ?auto_33786 ?auto_33787 ) ) ( not ( = ?auto_33790 ?auto_33789 ) ) ( HOIST-AT ?auto_33793 ?auto_33790 ) ( not ( = ?auto_33794 ?auto_33793 ) ) ( SURFACE-AT ?auto_33786 ?auto_33790 ) ( ON ?auto_33786 ?auto_33791 ) ( CLEAR ?auto_33786 ) ( not ( = ?auto_33786 ?auto_33791 ) ) ( not ( = ?auto_33787 ?auto_33791 ) ) ( SURFACE-AT ?auto_33792 ?auto_33789 ) ( CLEAR ?auto_33792 ) ( IS-CRATE ?auto_33787 ) ( not ( = ?auto_33786 ?auto_33792 ) ) ( not ( = ?auto_33787 ?auto_33792 ) ) ( not ( = ?auto_33791 ?auto_33792 ) ) ( AVAILABLE ?auto_33794 ) ( TRUCK-AT ?auto_33788 ?auto_33790 ) ( AVAILABLE ?auto_33793 ) ( SURFACE-AT ?auto_33787 ?auto_33790 ) ( ON ?auto_33787 ?auto_33795 ) ( CLEAR ?auto_33787 ) ( not ( = ?auto_33786 ?auto_33795 ) ) ( not ( = ?auto_33787 ?auto_33795 ) ) ( not ( = ?auto_33791 ?auto_33795 ) ) ( not ( = ?auto_33792 ?auto_33795 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33793 ?auto_33787 ?auto_33795 ?auto_33790 )
      ( MAKE-ON ?auto_33786 ?auto_33787 )
      ( MAKE-ON-VERIFY ?auto_33786 ?auto_33787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33796 - SURFACE
      ?auto_33797 - SURFACE
    )
    :vars
    (
      ?auto_33799 - HOIST
      ?auto_33798 - PLACE
      ?auto_33801 - PLACE
      ?auto_33804 - HOIST
      ?auto_33803 - SURFACE
      ?auto_33805 - SURFACE
      ?auto_33802 - SURFACE
      ?auto_33800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33799 ?auto_33798 ) ( IS-CRATE ?auto_33796 ) ( not ( = ?auto_33796 ?auto_33797 ) ) ( not ( = ?auto_33801 ?auto_33798 ) ) ( HOIST-AT ?auto_33804 ?auto_33801 ) ( not ( = ?auto_33799 ?auto_33804 ) ) ( SURFACE-AT ?auto_33796 ?auto_33801 ) ( ON ?auto_33796 ?auto_33803 ) ( CLEAR ?auto_33796 ) ( not ( = ?auto_33796 ?auto_33803 ) ) ( not ( = ?auto_33797 ?auto_33803 ) ) ( SURFACE-AT ?auto_33805 ?auto_33798 ) ( CLEAR ?auto_33805 ) ( IS-CRATE ?auto_33797 ) ( not ( = ?auto_33796 ?auto_33805 ) ) ( not ( = ?auto_33797 ?auto_33805 ) ) ( not ( = ?auto_33803 ?auto_33805 ) ) ( AVAILABLE ?auto_33799 ) ( AVAILABLE ?auto_33804 ) ( SURFACE-AT ?auto_33797 ?auto_33801 ) ( ON ?auto_33797 ?auto_33802 ) ( CLEAR ?auto_33797 ) ( not ( = ?auto_33796 ?auto_33802 ) ) ( not ( = ?auto_33797 ?auto_33802 ) ) ( not ( = ?auto_33803 ?auto_33802 ) ) ( not ( = ?auto_33805 ?auto_33802 ) ) ( TRUCK-AT ?auto_33800 ?auto_33798 ) )
    :subtasks
    ( ( !DRIVE ?auto_33800 ?auto_33798 ?auto_33801 )
      ( MAKE-ON ?auto_33796 ?auto_33797 )
      ( MAKE-ON-VERIFY ?auto_33796 ?auto_33797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33806 - SURFACE
      ?auto_33807 - SURFACE
    )
    :vars
    (
      ?auto_33809 - HOIST
      ?auto_33811 - PLACE
      ?auto_33813 - PLACE
      ?auto_33814 - HOIST
      ?auto_33810 - SURFACE
      ?auto_33808 - SURFACE
      ?auto_33815 - SURFACE
      ?auto_33812 - TRUCK
      ?auto_33816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33809 ?auto_33811 ) ( IS-CRATE ?auto_33806 ) ( not ( = ?auto_33806 ?auto_33807 ) ) ( not ( = ?auto_33813 ?auto_33811 ) ) ( HOIST-AT ?auto_33814 ?auto_33813 ) ( not ( = ?auto_33809 ?auto_33814 ) ) ( SURFACE-AT ?auto_33806 ?auto_33813 ) ( ON ?auto_33806 ?auto_33810 ) ( CLEAR ?auto_33806 ) ( not ( = ?auto_33806 ?auto_33810 ) ) ( not ( = ?auto_33807 ?auto_33810 ) ) ( IS-CRATE ?auto_33807 ) ( not ( = ?auto_33806 ?auto_33808 ) ) ( not ( = ?auto_33807 ?auto_33808 ) ) ( not ( = ?auto_33810 ?auto_33808 ) ) ( AVAILABLE ?auto_33814 ) ( SURFACE-AT ?auto_33807 ?auto_33813 ) ( ON ?auto_33807 ?auto_33815 ) ( CLEAR ?auto_33807 ) ( not ( = ?auto_33806 ?auto_33815 ) ) ( not ( = ?auto_33807 ?auto_33815 ) ) ( not ( = ?auto_33810 ?auto_33815 ) ) ( not ( = ?auto_33808 ?auto_33815 ) ) ( TRUCK-AT ?auto_33812 ?auto_33811 ) ( SURFACE-AT ?auto_33816 ?auto_33811 ) ( CLEAR ?auto_33816 ) ( LIFTING ?auto_33809 ?auto_33808 ) ( IS-CRATE ?auto_33808 ) ( not ( = ?auto_33806 ?auto_33816 ) ) ( not ( = ?auto_33807 ?auto_33816 ) ) ( not ( = ?auto_33810 ?auto_33816 ) ) ( not ( = ?auto_33808 ?auto_33816 ) ) ( not ( = ?auto_33815 ?auto_33816 ) ) )
    :subtasks
    ( ( !DROP ?auto_33809 ?auto_33808 ?auto_33816 ?auto_33811 )
      ( MAKE-ON ?auto_33806 ?auto_33807 )
      ( MAKE-ON-VERIFY ?auto_33806 ?auto_33807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33893 - SURFACE
      ?auto_33894 - SURFACE
    )
    :vars
    (
      ?auto_33900 - HOIST
      ?auto_33897 - PLACE
      ?auto_33899 - PLACE
      ?auto_33896 - HOIST
      ?auto_33902 - SURFACE
      ?auto_33895 - SURFACE
      ?auto_33898 - TRUCK
      ?auto_33901 - SURFACE
      ?auto_33903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33900 ?auto_33897 ) ( IS-CRATE ?auto_33893 ) ( not ( = ?auto_33893 ?auto_33894 ) ) ( not ( = ?auto_33899 ?auto_33897 ) ) ( HOIST-AT ?auto_33896 ?auto_33899 ) ( not ( = ?auto_33900 ?auto_33896 ) ) ( SURFACE-AT ?auto_33893 ?auto_33899 ) ( ON ?auto_33893 ?auto_33902 ) ( CLEAR ?auto_33893 ) ( not ( = ?auto_33893 ?auto_33902 ) ) ( not ( = ?auto_33894 ?auto_33902 ) ) ( SURFACE-AT ?auto_33895 ?auto_33897 ) ( CLEAR ?auto_33895 ) ( IS-CRATE ?auto_33894 ) ( not ( = ?auto_33893 ?auto_33895 ) ) ( not ( = ?auto_33894 ?auto_33895 ) ) ( not ( = ?auto_33902 ?auto_33895 ) ) ( AVAILABLE ?auto_33900 ) ( TRUCK-AT ?auto_33898 ?auto_33899 ) ( SURFACE-AT ?auto_33894 ?auto_33899 ) ( ON ?auto_33894 ?auto_33901 ) ( CLEAR ?auto_33894 ) ( not ( = ?auto_33893 ?auto_33901 ) ) ( not ( = ?auto_33894 ?auto_33901 ) ) ( not ( = ?auto_33902 ?auto_33901 ) ) ( not ( = ?auto_33895 ?auto_33901 ) ) ( LIFTING ?auto_33896 ?auto_33903 ) ( IS-CRATE ?auto_33903 ) ( not ( = ?auto_33893 ?auto_33903 ) ) ( not ( = ?auto_33894 ?auto_33903 ) ) ( not ( = ?auto_33902 ?auto_33903 ) ) ( not ( = ?auto_33895 ?auto_33903 ) ) ( not ( = ?auto_33901 ?auto_33903 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33896 ?auto_33903 ?auto_33898 ?auto_33899 )
      ( MAKE-ON ?auto_33893 ?auto_33894 )
      ( MAKE-ON-VERIFY ?auto_33893 ?auto_33894 ) )
  )

)

