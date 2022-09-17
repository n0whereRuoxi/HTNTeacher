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
      ?auto_29707 - SURFACE
      ?auto_29708 - SURFACE
    )
    :vars
    (
      ?auto_29709 - HOIST
      ?auto_29710 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29709 ?auto_29710 ) ( SURFACE-AT ?auto_29708 ?auto_29710 ) ( CLEAR ?auto_29708 ) ( LIFTING ?auto_29709 ?auto_29707 ) ( IS-CRATE ?auto_29707 ) ( not ( = ?auto_29707 ?auto_29708 ) ) )
    :subtasks
    ( ( !DROP ?auto_29709 ?auto_29707 ?auto_29708 ?auto_29710 )
      ( MAKE-ON-VERIFY ?auto_29707 ?auto_29708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29711 - SURFACE
      ?auto_29712 - SURFACE
    )
    :vars
    (
      ?auto_29714 - HOIST
      ?auto_29713 - PLACE
      ?auto_29715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29714 ?auto_29713 ) ( SURFACE-AT ?auto_29712 ?auto_29713 ) ( CLEAR ?auto_29712 ) ( IS-CRATE ?auto_29711 ) ( not ( = ?auto_29711 ?auto_29712 ) ) ( TRUCK-AT ?auto_29715 ?auto_29713 ) ( AVAILABLE ?auto_29714 ) ( IN ?auto_29711 ?auto_29715 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29714 ?auto_29711 ?auto_29715 ?auto_29713 )
      ( MAKE-ON ?auto_29711 ?auto_29712 )
      ( MAKE-ON-VERIFY ?auto_29711 ?auto_29712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29716 - SURFACE
      ?auto_29717 - SURFACE
    )
    :vars
    (
      ?auto_29718 - HOIST
      ?auto_29720 - PLACE
      ?auto_29719 - TRUCK
      ?auto_29721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29718 ?auto_29720 ) ( SURFACE-AT ?auto_29717 ?auto_29720 ) ( CLEAR ?auto_29717 ) ( IS-CRATE ?auto_29716 ) ( not ( = ?auto_29716 ?auto_29717 ) ) ( AVAILABLE ?auto_29718 ) ( IN ?auto_29716 ?auto_29719 ) ( TRUCK-AT ?auto_29719 ?auto_29721 ) ( not ( = ?auto_29721 ?auto_29720 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29719 ?auto_29721 ?auto_29720 )
      ( MAKE-ON ?auto_29716 ?auto_29717 )
      ( MAKE-ON-VERIFY ?auto_29716 ?auto_29717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29722 - SURFACE
      ?auto_29723 - SURFACE
    )
    :vars
    (
      ?auto_29726 - HOIST
      ?auto_29724 - PLACE
      ?auto_29727 - TRUCK
      ?auto_29725 - PLACE
      ?auto_29728 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29726 ?auto_29724 ) ( SURFACE-AT ?auto_29723 ?auto_29724 ) ( CLEAR ?auto_29723 ) ( IS-CRATE ?auto_29722 ) ( not ( = ?auto_29722 ?auto_29723 ) ) ( AVAILABLE ?auto_29726 ) ( TRUCK-AT ?auto_29727 ?auto_29725 ) ( not ( = ?auto_29725 ?auto_29724 ) ) ( HOIST-AT ?auto_29728 ?auto_29725 ) ( LIFTING ?auto_29728 ?auto_29722 ) ( not ( = ?auto_29726 ?auto_29728 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29728 ?auto_29722 ?auto_29727 ?auto_29725 )
      ( MAKE-ON ?auto_29722 ?auto_29723 )
      ( MAKE-ON-VERIFY ?auto_29722 ?auto_29723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29729 - SURFACE
      ?auto_29730 - SURFACE
    )
    :vars
    (
      ?auto_29731 - HOIST
      ?auto_29734 - PLACE
      ?auto_29732 - TRUCK
      ?auto_29735 - PLACE
      ?auto_29733 - HOIST
      ?auto_29736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29731 ?auto_29734 ) ( SURFACE-AT ?auto_29730 ?auto_29734 ) ( CLEAR ?auto_29730 ) ( IS-CRATE ?auto_29729 ) ( not ( = ?auto_29729 ?auto_29730 ) ) ( AVAILABLE ?auto_29731 ) ( TRUCK-AT ?auto_29732 ?auto_29735 ) ( not ( = ?auto_29735 ?auto_29734 ) ) ( HOIST-AT ?auto_29733 ?auto_29735 ) ( not ( = ?auto_29731 ?auto_29733 ) ) ( AVAILABLE ?auto_29733 ) ( SURFACE-AT ?auto_29729 ?auto_29735 ) ( ON ?auto_29729 ?auto_29736 ) ( CLEAR ?auto_29729 ) ( not ( = ?auto_29729 ?auto_29736 ) ) ( not ( = ?auto_29730 ?auto_29736 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29733 ?auto_29729 ?auto_29736 ?auto_29735 )
      ( MAKE-ON ?auto_29729 ?auto_29730 )
      ( MAKE-ON-VERIFY ?auto_29729 ?auto_29730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29737 - SURFACE
      ?auto_29738 - SURFACE
    )
    :vars
    (
      ?auto_29744 - HOIST
      ?auto_29740 - PLACE
      ?auto_29739 - PLACE
      ?auto_29743 - HOIST
      ?auto_29741 - SURFACE
      ?auto_29742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29744 ?auto_29740 ) ( SURFACE-AT ?auto_29738 ?auto_29740 ) ( CLEAR ?auto_29738 ) ( IS-CRATE ?auto_29737 ) ( not ( = ?auto_29737 ?auto_29738 ) ) ( AVAILABLE ?auto_29744 ) ( not ( = ?auto_29739 ?auto_29740 ) ) ( HOIST-AT ?auto_29743 ?auto_29739 ) ( not ( = ?auto_29744 ?auto_29743 ) ) ( AVAILABLE ?auto_29743 ) ( SURFACE-AT ?auto_29737 ?auto_29739 ) ( ON ?auto_29737 ?auto_29741 ) ( CLEAR ?auto_29737 ) ( not ( = ?auto_29737 ?auto_29741 ) ) ( not ( = ?auto_29738 ?auto_29741 ) ) ( TRUCK-AT ?auto_29742 ?auto_29740 ) )
    :subtasks
    ( ( !DRIVE ?auto_29742 ?auto_29740 ?auto_29739 )
      ( MAKE-ON ?auto_29737 ?auto_29738 )
      ( MAKE-ON-VERIFY ?auto_29737 ?auto_29738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29747 - SURFACE
      ?auto_29748 - SURFACE
    )
    :vars
    (
      ?auto_29749 - HOIST
      ?auto_29750 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29749 ?auto_29750 ) ( SURFACE-AT ?auto_29748 ?auto_29750 ) ( CLEAR ?auto_29748 ) ( LIFTING ?auto_29749 ?auto_29747 ) ( IS-CRATE ?auto_29747 ) ( not ( = ?auto_29747 ?auto_29748 ) ) )
    :subtasks
    ( ( !DROP ?auto_29749 ?auto_29747 ?auto_29748 ?auto_29750 )
      ( MAKE-ON-VERIFY ?auto_29747 ?auto_29748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29751 - SURFACE
      ?auto_29752 - SURFACE
    )
    :vars
    (
      ?auto_29753 - HOIST
      ?auto_29754 - PLACE
      ?auto_29755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29753 ?auto_29754 ) ( SURFACE-AT ?auto_29752 ?auto_29754 ) ( CLEAR ?auto_29752 ) ( IS-CRATE ?auto_29751 ) ( not ( = ?auto_29751 ?auto_29752 ) ) ( TRUCK-AT ?auto_29755 ?auto_29754 ) ( AVAILABLE ?auto_29753 ) ( IN ?auto_29751 ?auto_29755 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29753 ?auto_29751 ?auto_29755 ?auto_29754 )
      ( MAKE-ON ?auto_29751 ?auto_29752 )
      ( MAKE-ON-VERIFY ?auto_29751 ?auto_29752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29756 - SURFACE
      ?auto_29757 - SURFACE
    )
    :vars
    (
      ?auto_29759 - HOIST
      ?auto_29758 - PLACE
      ?auto_29760 - TRUCK
      ?auto_29761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29759 ?auto_29758 ) ( SURFACE-AT ?auto_29757 ?auto_29758 ) ( CLEAR ?auto_29757 ) ( IS-CRATE ?auto_29756 ) ( not ( = ?auto_29756 ?auto_29757 ) ) ( AVAILABLE ?auto_29759 ) ( IN ?auto_29756 ?auto_29760 ) ( TRUCK-AT ?auto_29760 ?auto_29761 ) ( not ( = ?auto_29761 ?auto_29758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29760 ?auto_29761 ?auto_29758 )
      ( MAKE-ON ?auto_29756 ?auto_29757 )
      ( MAKE-ON-VERIFY ?auto_29756 ?auto_29757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29762 - SURFACE
      ?auto_29763 - SURFACE
    )
    :vars
    (
      ?auto_29767 - HOIST
      ?auto_29765 - PLACE
      ?auto_29764 - TRUCK
      ?auto_29766 - PLACE
      ?auto_29768 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29767 ?auto_29765 ) ( SURFACE-AT ?auto_29763 ?auto_29765 ) ( CLEAR ?auto_29763 ) ( IS-CRATE ?auto_29762 ) ( not ( = ?auto_29762 ?auto_29763 ) ) ( AVAILABLE ?auto_29767 ) ( TRUCK-AT ?auto_29764 ?auto_29766 ) ( not ( = ?auto_29766 ?auto_29765 ) ) ( HOIST-AT ?auto_29768 ?auto_29766 ) ( LIFTING ?auto_29768 ?auto_29762 ) ( not ( = ?auto_29767 ?auto_29768 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29768 ?auto_29762 ?auto_29764 ?auto_29766 )
      ( MAKE-ON ?auto_29762 ?auto_29763 )
      ( MAKE-ON-VERIFY ?auto_29762 ?auto_29763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29769 - SURFACE
      ?auto_29770 - SURFACE
    )
    :vars
    (
      ?auto_29774 - HOIST
      ?auto_29771 - PLACE
      ?auto_29773 - TRUCK
      ?auto_29772 - PLACE
      ?auto_29775 - HOIST
      ?auto_29776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29774 ?auto_29771 ) ( SURFACE-AT ?auto_29770 ?auto_29771 ) ( CLEAR ?auto_29770 ) ( IS-CRATE ?auto_29769 ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( AVAILABLE ?auto_29774 ) ( TRUCK-AT ?auto_29773 ?auto_29772 ) ( not ( = ?auto_29772 ?auto_29771 ) ) ( HOIST-AT ?auto_29775 ?auto_29772 ) ( not ( = ?auto_29774 ?auto_29775 ) ) ( AVAILABLE ?auto_29775 ) ( SURFACE-AT ?auto_29769 ?auto_29772 ) ( ON ?auto_29769 ?auto_29776 ) ( CLEAR ?auto_29769 ) ( not ( = ?auto_29769 ?auto_29776 ) ) ( not ( = ?auto_29770 ?auto_29776 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29775 ?auto_29769 ?auto_29776 ?auto_29772 )
      ( MAKE-ON ?auto_29769 ?auto_29770 )
      ( MAKE-ON-VERIFY ?auto_29769 ?auto_29770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29777 - SURFACE
      ?auto_29778 - SURFACE
    )
    :vars
    (
      ?auto_29780 - HOIST
      ?auto_29779 - PLACE
      ?auto_29783 - PLACE
      ?auto_29784 - HOIST
      ?auto_29781 - SURFACE
      ?auto_29782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29780 ?auto_29779 ) ( SURFACE-AT ?auto_29778 ?auto_29779 ) ( CLEAR ?auto_29778 ) ( IS-CRATE ?auto_29777 ) ( not ( = ?auto_29777 ?auto_29778 ) ) ( AVAILABLE ?auto_29780 ) ( not ( = ?auto_29783 ?auto_29779 ) ) ( HOIST-AT ?auto_29784 ?auto_29783 ) ( not ( = ?auto_29780 ?auto_29784 ) ) ( AVAILABLE ?auto_29784 ) ( SURFACE-AT ?auto_29777 ?auto_29783 ) ( ON ?auto_29777 ?auto_29781 ) ( CLEAR ?auto_29777 ) ( not ( = ?auto_29777 ?auto_29781 ) ) ( not ( = ?auto_29778 ?auto_29781 ) ) ( TRUCK-AT ?auto_29782 ?auto_29779 ) )
    :subtasks
    ( ( !DRIVE ?auto_29782 ?auto_29779 ?auto_29783 )
      ( MAKE-ON ?auto_29777 ?auto_29778 )
      ( MAKE-ON-VERIFY ?auto_29777 ?auto_29778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29785 - SURFACE
      ?auto_29786 - SURFACE
    )
    :vars
    (
      ?auto_29790 - HOIST
      ?auto_29791 - PLACE
      ?auto_29789 - PLACE
      ?auto_29788 - HOIST
      ?auto_29787 - SURFACE
      ?auto_29792 - TRUCK
      ?auto_29793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29790 ?auto_29791 ) ( IS-CRATE ?auto_29785 ) ( not ( = ?auto_29785 ?auto_29786 ) ) ( not ( = ?auto_29789 ?auto_29791 ) ) ( HOIST-AT ?auto_29788 ?auto_29789 ) ( not ( = ?auto_29790 ?auto_29788 ) ) ( AVAILABLE ?auto_29788 ) ( SURFACE-AT ?auto_29785 ?auto_29789 ) ( ON ?auto_29785 ?auto_29787 ) ( CLEAR ?auto_29785 ) ( not ( = ?auto_29785 ?auto_29787 ) ) ( not ( = ?auto_29786 ?auto_29787 ) ) ( TRUCK-AT ?auto_29792 ?auto_29791 ) ( SURFACE-AT ?auto_29793 ?auto_29791 ) ( CLEAR ?auto_29793 ) ( LIFTING ?auto_29790 ?auto_29786 ) ( IS-CRATE ?auto_29786 ) ( not ( = ?auto_29785 ?auto_29793 ) ) ( not ( = ?auto_29786 ?auto_29793 ) ) ( not ( = ?auto_29787 ?auto_29793 ) ) )
    :subtasks
    ( ( !DROP ?auto_29790 ?auto_29786 ?auto_29793 ?auto_29791 )
      ( MAKE-ON ?auto_29785 ?auto_29786 )
      ( MAKE-ON-VERIFY ?auto_29785 ?auto_29786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29794 - SURFACE
      ?auto_29795 - SURFACE
    )
    :vars
    (
      ?auto_29802 - HOIST
      ?auto_29799 - PLACE
      ?auto_29797 - PLACE
      ?auto_29798 - HOIST
      ?auto_29801 - SURFACE
      ?auto_29796 - TRUCK
      ?auto_29800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29802 ?auto_29799 ) ( IS-CRATE ?auto_29794 ) ( not ( = ?auto_29794 ?auto_29795 ) ) ( not ( = ?auto_29797 ?auto_29799 ) ) ( HOIST-AT ?auto_29798 ?auto_29797 ) ( not ( = ?auto_29802 ?auto_29798 ) ) ( AVAILABLE ?auto_29798 ) ( SURFACE-AT ?auto_29794 ?auto_29797 ) ( ON ?auto_29794 ?auto_29801 ) ( CLEAR ?auto_29794 ) ( not ( = ?auto_29794 ?auto_29801 ) ) ( not ( = ?auto_29795 ?auto_29801 ) ) ( TRUCK-AT ?auto_29796 ?auto_29799 ) ( SURFACE-AT ?auto_29800 ?auto_29799 ) ( CLEAR ?auto_29800 ) ( IS-CRATE ?auto_29795 ) ( not ( = ?auto_29794 ?auto_29800 ) ) ( not ( = ?auto_29795 ?auto_29800 ) ) ( not ( = ?auto_29801 ?auto_29800 ) ) ( AVAILABLE ?auto_29802 ) ( IN ?auto_29795 ?auto_29796 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29802 ?auto_29795 ?auto_29796 ?auto_29799 )
      ( MAKE-ON ?auto_29794 ?auto_29795 )
      ( MAKE-ON-VERIFY ?auto_29794 ?auto_29795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29803 - SURFACE
      ?auto_29804 - SURFACE
    )
    :vars
    (
      ?auto_29810 - HOIST
      ?auto_29805 - PLACE
      ?auto_29809 - PLACE
      ?auto_29808 - HOIST
      ?auto_29811 - SURFACE
      ?auto_29806 - SURFACE
      ?auto_29807 - TRUCK
      ?auto_29812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29810 ?auto_29805 ) ( IS-CRATE ?auto_29803 ) ( not ( = ?auto_29803 ?auto_29804 ) ) ( not ( = ?auto_29809 ?auto_29805 ) ) ( HOIST-AT ?auto_29808 ?auto_29809 ) ( not ( = ?auto_29810 ?auto_29808 ) ) ( AVAILABLE ?auto_29808 ) ( SURFACE-AT ?auto_29803 ?auto_29809 ) ( ON ?auto_29803 ?auto_29811 ) ( CLEAR ?auto_29803 ) ( not ( = ?auto_29803 ?auto_29811 ) ) ( not ( = ?auto_29804 ?auto_29811 ) ) ( SURFACE-AT ?auto_29806 ?auto_29805 ) ( CLEAR ?auto_29806 ) ( IS-CRATE ?auto_29804 ) ( not ( = ?auto_29803 ?auto_29806 ) ) ( not ( = ?auto_29804 ?auto_29806 ) ) ( not ( = ?auto_29811 ?auto_29806 ) ) ( AVAILABLE ?auto_29810 ) ( IN ?auto_29804 ?auto_29807 ) ( TRUCK-AT ?auto_29807 ?auto_29812 ) ( not ( = ?auto_29812 ?auto_29805 ) ) ( not ( = ?auto_29809 ?auto_29812 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29807 ?auto_29812 ?auto_29805 )
      ( MAKE-ON ?auto_29803 ?auto_29804 )
      ( MAKE-ON-VERIFY ?auto_29803 ?auto_29804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29813 - SURFACE
      ?auto_29814 - SURFACE
    )
    :vars
    (
      ?auto_29818 - HOIST
      ?auto_29819 - PLACE
      ?auto_29816 - PLACE
      ?auto_29815 - HOIST
      ?auto_29817 - SURFACE
      ?auto_29822 - SURFACE
      ?auto_29820 - TRUCK
      ?auto_29821 - PLACE
      ?auto_29823 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29818 ?auto_29819 ) ( IS-CRATE ?auto_29813 ) ( not ( = ?auto_29813 ?auto_29814 ) ) ( not ( = ?auto_29816 ?auto_29819 ) ) ( HOIST-AT ?auto_29815 ?auto_29816 ) ( not ( = ?auto_29818 ?auto_29815 ) ) ( AVAILABLE ?auto_29815 ) ( SURFACE-AT ?auto_29813 ?auto_29816 ) ( ON ?auto_29813 ?auto_29817 ) ( CLEAR ?auto_29813 ) ( not ( = ?auto_29813 ?auto_29817 ) ) ( not ( = ?auto_29814 ?auto_29817 ) ) ( SURFACE-AT ?auto_29822 ?auto_29819 ) ( CLEAR ?auto_29822 ) ( IS-CRATE ?auto_29814 ) ( not ( = ?auto_29813 ?auto_29822 ) ) ( not ( = ?auto_29814 ?auto_29822 ) ) ( not ( = ?auto_29817 ?auto_29822 ) ) ( AVAILABLE ?auto_29818 ) ( TRUCK-AT ?auto_29820 ?auto_29821 ) ( not ( = ?auto_29821 ?auto_29819 ) ) ( not ( = ?auto_29816 ?auto_29821 ) ) ( HOIST-AT ?auto_29823 ?auto_29821 ) ( LIFTING ?auto_29823 ?auto_29814 ) ( not ( = ?auto_29818 ?auto_29823 ) ) ( not ( = ?auto_29815 ?auto_29823 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29823 ?auto_29814 ?auto_29820 ?auto_29821 )
      ( MAKE-ON ?auto_29813 ?auto_29814 )
      ( MAKE-ON-VERIFY ?auto_29813 ?auto_29814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29824 - SURFACE
      ?auto_29825 - SURFACE
    )
    :vars
    (
      ?auto_29832 - HOIST
      ?auto_29834 - PLACE
      ?auto_29829 - PLACE
      ?auto_29827 - HOIST
      ?auto_29828 - SURFACE
      ?auto_29830 - SURFACE
      ?auto_29826 - TRUCK
      ?auto_29831 - PLACE
      ?auto_29833 - HOIST
      ?auto_29835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29832 ?auto_29834 ) ( IS-CRATE ?auto_29824 ) ( not ( = ?auto_29824 ?auto_29825 ) ) ( not ( = ?auto_29829 ?auto_29834 ) ) ( HOIST-AT ?auto_29827 ?auto_29829 ) ( not ( = ?auto_29832 ?auto_29827 ) ) ( AVAILABLE ?auto_29827 ) ( SURFACE-AT ?auto_29824 ?auto_29829 ) ( ON ?auto_29824 ?auto_29828 ) ( CLEAR ?auto_29824 ) ( not ( = ?auto_29824 ?auto_29828 ) ) ( not ( = ?auto_29825 ?auto_29828 ) ) ( SURFACE-AT ?auto_29830 ?auto_29834 ) ( CLEAR ?auto_29830 ) ( IS-CRATE ?auto_29825 ) ( not ( = ?auto_29824 ?auto_29830 ) ) ( not ( = ?auto_29825 ?auto_29830 ) ) ( not ( = ?auto_29828 ?auto_29830 ) ) ( AVAILABLE ?auto_29832 ) ( TRUCK-AT ?auto_29826 ?auto_29831 ) ( not ( = ?auto_29831 ?auto_29834 ) ) ( not ( = ?auto_29829 ?auto_29831 ) ) ( HOIST-AT ?auto_29833 ?auto_29831 ) ( not ( = ?auto_29832 ?auto_29833 ) ) ( not ( = ?auto_29827 ?auto_29833 ) ) ( AVAILABLE ?auto_29833 ) ( SURFACE-AT ?auto_29825 ?auto_29831 ) ( ON ?auto_29825 ?auto_29835 ) ( CLEAR ?auto_29825 ) ( not ( = ?auto_29824 ?auto_29835 ) ) ( not ( = ?auto_29825 ?auto_29835 ) ) ( not ( = ?auto_29828 ?auto_29835 ) ) ( not ( = ?auto_29830 ?auto_29835 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29833 ?auto_29825 ?auto_29835 ?auto_29831 )
      ( MAKE-ON ?auto_29824 ?auto_29825 )
      ( MAKE-ON-VERIFY ?auto_29824 ?auto_29825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29836 - SURFACE
      ?auto_29837 - SURFACE
    )
    :vars
    (
      ?auto_29841 - HOIST
      ?auto_29839 - PLACE
      ?auto_29838 - PLACE
      ?auto_29843 - HOIST
      ?auto_29847 - SURFACE
      ?auto_29842 - SURFACE
      ?auto_29840 - PLACE
      ?auto_29846 - HOIST
      ?auto_29845 - SURFACE
      ?auto_29844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29841 ?auto_29839 ) ( IS-CRATE ?auto_29836 ) ( not ( = ?auto_29836 ?auto_29837 ) ) ( not ( = ?auto_29838 ?auto_29839 ) ) ( HOIST-AT ?auto_29843 ?auto_29838 ) ( not ( = ?auto_29841 ?auto_29843 ) ) ( AVAILABLE ?auto_29843 ) ( SURFACE-AT ?auto_29836 ?auto_29838 ) ( ON ?auto_29836 ?auto_29847 ) ( CLEAR ?auto_29836 ) ( not ( = ?auto_29836 ?auto_29847 ) ) ( not ( = ?auto_29837 ?auto_29847 ) ) ( SURFACE-AT ?auto_29842 ?auto_29839 ) ( CLEAR ?auto_29842 ) ( IS-CRATE ?auto_29837 ) ( not ( = ?auto_29836 ?auto_29842 ) ) ( not ( = ?auto_29837 ?auto_29842 ) ) ( not ( = ?auto_29847 ?auto_29842 ) ) ( AVAILABLE ?auto_29841 ) ( not ( = ?auto_29840 ?auto_29839 ) ) ( not ( = ?auto_29838 ?auto_29840 ) ) ( HOIST-AT ?auto_29846 ?auto_29840 ) ( not ( = ?auto_29841 ?auto_29846 ) ) ( not ( = ?auto_29843 ?auto_29846 ) ) ( AVAILABLE ?auto_29846 ) ( SURFACE-AT ?auto_29837 ?auto_29840 ) ( ON ?auto_29837 ?auto_29845 ) ( CLEAR ?auto_29837 ) ( not ( = ?auto_29836 ?auto_29845 ) ) ( not ( = ?auto_29837 ?auto_29845 ) ) ( not ( = ?auto_29847 ?auto_29845 ) ) ( not ( = ?auto_29842 ?auto_29845 ) ) ( TRUCK-AT ?auto_29844 ?auto_29839 ) )
    :subtasks
    ( ( !DRIVE ?auto_29844 ?auto_29839 ?auto_29840 )
      ( MAKE-ON ?auto_29836 ?auto_29837 )
      ( MAKE-ON-VERIFY ?auto_29836 ?auto_29837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29850 - SURFACE
      ?auto_29851 - SURFACE
    )
    :vars
    (
      ?auto_29852 - HOIST
      ?auto_29853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29852 ?auto_29853 ) ( SURFACE-AT ?auto_29851 ?auto_29853 ) ( CLEAR ?auto_29851 ) ( LIFTING ?auto_29852 ?auto_29850 ) ( IS-CRATE ?auto_29850 ) ( not ( = ?auto_29850 ?auto_29851 ) ) )
    :subtasks
    ( ( !DROP ?auto_29852 ?auto_29850 ?auto_29851 ?auto_29853 )
      ( MAKE-ON-VERIFY ?auto_29850 ?auto_29851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29854 - SURFACE
      ?auto_29855 - SURFACE
    )
    :vars
    (
      ?auto_29857 - HOIST
      ?auto_29856 - PLACE
      ?auto_29858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29857 ?auto_29856 ) ( SURFACE-AT ?auto_29855 ?auto_29856 ) ( CLEAR ?auto_29855 ) ( IS-CRATE ?auto_29854 ) ( not ( = ?auto_29854 ?auto_29855 ) ) ( TRUCK-AT ?auto_29858 ?auto_29856 ) ( AVAILABLE ?auto_29857 ) ( IN ?auto_29854 ?auto_29858 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29857 ?auto_29854 ?auto_29858 ?auto_29856 )
      ( MAKE-ON ?auto_29854 ?auto_29855 )
      ( MAKE-ON-VERIFY ?auto_29854 ?auto_29855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29859 - SURFACE
      ?auto_29860 - SURFACE
    )
    :vars
    (
      ?auto_29861 - HOIST
      ?auto_29863 - PLACE
      ?auto_29862 - TRUCK
      ?auto_29864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29861 ?auto_29863 ) ( SURFACE-AT ?auto_29860 ?auto_29863 ) ( CLEAR ?auto_29860 ) ( IS-CRATE ?auto_29859 ) ( not ( = ?auto_29859 ?auto_29860 ) ) ( AVAILABLE ?auto_29861 ) ( IN ?auto_29859 ?auto_29862 ) ( TRUCK-AT ?auto_29862 ?auto_29864 ) ( not ( = ?auto_29864 ?auto_29863 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29862 ?auto_29864 ?auto_29863 )
      ( MAKE-ON ?auto_29859 ?auto_29860 )
      ( MAKE-ON-VERIFY ?auto_29859 ?auto_29860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29865 - SURFACE
      ?auto_29866 - SURFACE
    )
    :vars
    (
      ?auto_29869 - HOIST
      ?auto_29868 - PLACE
      ?auto_29870 - TRUCK
      ?auto_29867 - PLACE
      ?auto_29871 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29869 ?auto_29868 ) ( SURFACE-AT ?auto_29866 ?auto_29868 ) ( CLEAR ?auto_29866 ) ( IS-CRATE ?auto_29865 ) ( not ( = ?auto_29865 ?auto_29866 ) ) ( AVAILABLE ?auto_29869 ) ( TRUCK-AT ?auto_29870 ?auto_29867 ) ( not ( = ?auto_29867 ?auto_29868 ) ) ( HOIST-AT ?auto_29871 ?auto_29867 ) ( LIFTING ?auto_29871 ?auto_29865 ) ( not ( = ?auto_29869 ?auto_29871 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29871 ?auto_29865 ?auto_29870 ?auto_29867 )
      ( MAKE-ON ?auto_29865 ?auto_29866 )
      ( MAKE-ON-VERIFY ?auto_29865 ?auto_29866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29872 - SURFACE
      ?auto_29873 - SURFACE
    )
    :vars
    (
      ?auto_29875 - HOIST
      ?auto_29877 - PLACE
      ?auto_29878 - TRUCK
      ?auto_29876 - PLACE
      ?auto_29874 - HOIST
      ?auto_29879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29875 ?auto_29877 ) ( SURFACE-AT ?auto_29873 ?auto_29877 ) ( CLEAR ?auto_29873 ) ( IS-CRATE ?auto_29872 ) ( not ( = ?auto_29872 ?auto_29873 ) ) ( AVAILABLE ?auto_29875 ) ( TRUCK-AT ?auto_29878 ?auto_29876 ) ( not ( = ?auto_29876 ?auto_29877 ) ) ( HOIST-AT ?auto_29874 ?auto_29876 ) ( not ( = ?auto_29875 ?auto_29874 ) ) ( AVAILABLE ?auto_29874 ) ( SURFACE-AT ?auto_29872 ?auto_29876 ) ( ON ?auto_29872 ?auto_29879 ) ( CLEAR ?auto_29872 ) ( not ( = ?auto_29872 ?auto_29879 ) ) ( not ( = ?auto_29873 ?auto_29879 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29874 ?auto_29872 ?auto_29879 ?auto_29876 )
      ( MAKE-ON ?auto_29872 ?auto_29873 )
      ( MAKE-ON-VERIFY ?auto_29872 ?auto_29873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29880 - SURFACE
      ?auto_29881 - SURFACE
    )
    :vars
    (
      ?auto_29883 - HOIST
      ?auto_29884 - PLACE
      ?auto_29885 - PLACE
      ?auto_29882 - HOIST
      ?auto_29886 - SURFACE
      ?auto_29887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29883 ?auto_29884 ) ( SURFACE-AT ?auto_29881 ?auto_29884 ) ( CLEAR ?auto_29881 ) ( IS-CRATE ?auto_29880 ) ( not ( = ?auto_29880 ?auto_29881 ) ) ( AVAILABLE ?auto_29883 ) ( not ( = ?auto_29885 ?auto_29884 ) ) ( HOIST-AT ?auto_29882 ?auto_29885 ) ( not ( = ?auto_29883 ?auto_29882 ) ) ( AVAILABLE ?auto_29882 ) ( SURFACE-AT ?auto_29880 ?auto_29885 ) ( ON ?auto_29880 ?auto_29886 ) ( CLEAR ?auto_29880 ) ( not ( = ?auto_29880 ?auto_29886 ) ) ( not ( = ?auto_29881 ?auto_29886 ) ) ( TRUCK-AT ?auto_29887 ?auto_29884 ) )
    :subtasks
    ( ( !DRIVE ?auto_29887 ?auto_29884 ?auto_29885 )
      ( MAKE-ON ?auto_29880 ?auto_29881 )
      ( MAKE-ON-VERIFY ?auto_29880 ?auto_29881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29888 - SURFACE
      ?auto_29889 - SURFACE
    )
    :vars
    (
      ?auto_29892 - HOIST
      ?auto_29895 - PLACE
      ?auto_29893 - PLACE
      ?auto_29890 - HOIST
      ?auto_29894 - SURFACE
      ?auto_29891 - TRUCK
      ?auto_29896 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29892 ?auto_29895 ) ( IS-CRATE ?auto_29888 ) ( not ( = ?auto_29888 ?auto_29889 ) ) ( not ( = ?auto_29893 ?auto_29895 ) ) ( HOIST-AT ?auto_29890 ?auto_29893 ) ( not ( = ?auto_29892 ?auto_29890 ) ) ( AVAILABLE ?auto_29890 ) ( SURFACE-AT ?auto_29888 ?auto_29893 ) ( ON ?auto_29888 ?auto_29894 ) ( CLEAR ?auto_29888 ) ( not ( = ?auto_29888 ?auto_29894 ) ) ( not ( = ?auto_29889 ?auto_29894 ) ) ( TRUCK-AT ?auto_29891 ?auto_29895 ) ( SURFACE-AT ?auto_29896 ?auto_29895 ) ( CLEAR ?auto_29896 ) ( LIFTING ?auto_29892 ?auto_29889 ) ( IS-CRATE ?auto_29889 ) ( not ( = ?auto_29888 ?auto_29896 ) ) ( not ( = ?auto_29889 ?auto_29896 ) ) ( not ( = ?auto_29894 ?auto_29896 ) ) )
    :subtasks
    ( ( !DROP ?auto_29892 ?auto_29889 ?auto_29896 ?auto_29895 )
      ( MAKE-ON ?auto_29888 ?auto_29889 )
      ( MAKE-ON-VERIFY ?auto_29888 ?auto_29889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29897 - SURFACE
      ?auto_29898 - SURFACE
    )
    :vars
    (
      ?auto_29899 - HOIST
      ?auto_29900 - PLACE
      ?auto_29902 - PLACE
      ?auto_29901 - HOIST
      ?auto_29904 - SURFACE
      ?auto_29905 - TRUCK
      ?auto_29903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29899 ?auto_29900 ) ( IS-CRATE ?auto_29897 ) ( not ( = ?auto_29897 ?auto_29898 ) ) ( not ( = ?auto_29902 ?auto_29900 ) ) ( HOIST-AT ?auto_29901 ?auto_29902 ) ( not ( = ?auto_29899 ?auto_29901 ) ) ( AVAILABLE ?auto_29901 ) ( SURFACE-AT ?auto_29897 ?auto_29902 ) ( ON ?auto_29897 ?auto_29904 ) ( CLEAR ?auto_29897 ) ( not ( = ?auto_29897 ?auto_29904 ) ) ( not ( = ?auto_29898 ?auto_29904 ) ) ( TRUCK-AT ?auto_29905 ?auto_29900 ) ( SURFACE-AT ?auto_29903 ?auto_29900 ) ( CLEAR ?auto_29903 ) ( IS-CRATE ?auto_29898 ) ( not ( = ?auto_29897 ?auto_29903 ) ) ( not ( = ?auto_29898 ?auto_29903 ) ) ( not ( = ?auto_29904 ?auto_29903 ) ) ( AVAILABLE ?auto_29899 ) ( IN ?auto_29898 ?auto_29905 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29899 ?auto_29898 ?auto_29905 ?auto_29900 )
      ( MAKE-ON ?auto_29897 ?auto_29898 )
      ( MAKE-ON-VERIFY ?auto_29897 ?auto_29898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29906 - SURFACE
      ?auto_29907 - SURFACE
    )
    :vars
    (
      ?auto_29910 - HOIST
      ?auto_29908 - PLACE
      ?auto_29911 - PLACE
      ?auto_29912 - HOIST
      ?auto_29914 - SURFACE
      ?auto_29913 - SURFACE
      ?auto_29909 - TRUCK
      ?auto_29915 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29910 ?auto_29908 ) ( IS-CRATE ?auto_29906 ) ( not ( = ?auto_29906 ?auto_29907 ) ) ( not ( = ?auto_29911 ?auto_29908 ) ) ( HOIST-AT ?auto_29912 ?auto_29911 ) ( not ( = ?auto_29910 ?auto_29912 ) ) ( AVAILABLE ?auto_29912 ) ( SURFACE-AT ?auto_29906 ?auto_29911 ) ( ON ?auto_29906 ?auto_29914 ) ( CLEAR ?auto_29906 ) ( not ( = ?auto_29906 ?auto_29914 ) ) ( not ( = ?auto_29907 ?auto_29914 ) ) ( SURFACE-AT ?auto_29913 ?auto_29908 ) ( CLEAR ?auto_29913 ) ( IS-CRATE ?auto_29907 ) ( not ( = ?auto_29906 ?auto_29913 ) ) ( not ( = ?auto_29907 ?auto_29913 ) ) ( not ( = ?auto_29914 ?auto_29913 ) ) ( AVAILABLE ?auto_29910 ) ( IN ?auto_29907 ?auto_29909 ) ( TRUCK-AT ?auto_29909 ?auto_29915 ) ( not ( = ?auto_29915 ?auto_29908 ) ) ( not ( = ?auto_29911 ?auto_29915 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29909 ?auto_29915 ?auto_29908 )
      ( MAKE-ON ?auto_29906 ?auto_29907 )
      ( MAKE-ON-VERIFY ?auto_29906 ?auto_29907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29916 - SURFACE
      ?auto_29917 - SURFACE
    )
    :vars
    (
      ?auto_29921 - HOIST
      ?auto_29924 - PLACE
      ?auto_29919 - PLACE
      ?auto_29920 - HOIST
      ?auto_29925 - SURFACE
      ?auto_29923 - SURFACE
      ?auto_29922 - TRUCK
      ?auto_29918 - PLACE
      ?auto_29926 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29921 ?auto_29924 ) ( IS-CRATE ?auto_29916 ) ( not ( = ?auto_29916 ?auto_29917 ) ) ( not ( = ?auto_29919 ?auto_29924 ) ) ( HOIST-AT ?auto_29920 ?auto_29919 ) ( not ( = ?auto_29921 ?auto_29920 ) ) ( AVAILABLE ?auto_29920 ) ( SURFACE-AT ?auto_29916 ?auto_29919 ) ( ON ?auto_29916 ?auto_29925 ) ( CLEAR ?auto_29916 ) ( not ( = ?auto_29916 ?auto_29925 ) ) ( not ( = ?auto_29917 ?auto_29925 ) ) ( SURFACE-AT ?auto_29923 ?auto_29924 ) ( CLEAR ?auto_29923 ) ( IS-CRATE ?auto_29917 ) ( not ( = ?auto_29916 ?auto_29923 ) ) ( not ( = ?auto_29917 ?auto_29923 ) ) ( not ( = ?auto_29925 ?auto_29923 ) ) ( AVAILABLE ?auto_29921 ) ( TRUCK-AT ?auto_29922 ?auto_29918 ) ( not ( = ?auto_29918 ?auto_29924 ) ) ( not ( = ?auto_29919 ?auto_29918 ) ) ( HOIST-AT ?auto_29926 ?auto_29918 ) ( LIFTING ?auto_29926 ?auto_29917 ) ( not ( = ?auto_29921 ?auto_29926 ) ) ( not ( = ?auto_29920 ?auto_29926 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29926 ?auto_29917 ?auto_29922 ?auto_29918 )
      ( MAKE-ON ?auto_29916 ?auto_29917 )
      ( MAKE-ON-VERIFY ?auto_29916 ?auto_29917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29927 - SURFACE
      ?auto_29928 - SURFACE
    )
    :vars
    (
      ?auto_29930 - HOIST
      ?auto_29937 - PLACE
      ?auto_29929 - PLACE
      ?auto_29932 - HOIST
      ?auto_29933 - SURFACE
      ?auto_29934 - SURFACE
      ?auto_29931 - TRUCK
      ?auto_29936 - PLACE
      ?auto_29935 - HOIST
      ?auto_29938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29930 ?auto_29937 ) ( IS-CRATE ?auto_29927 ) ( not ( = ?auto_29927 ?auto_29928 ) ) ( not ( = ?auto_29929 ?auto_29937 ) ) ( HOIST-AT ?auto_29932 ?auto_29929 ) ( not ( = ?auto_29930 ?auto_29932 ) ) ( AVAILABLE ?auto_29932 ) ( SURFACE-AT ?auto_29927 ?auto_29929 ) ( ON ?auto_29927 ?auto_29933 ) ( CLEAR ?auto_29927 ) ( not ( = ?auto_29927 ?auto_29933 ) ) ( not ( = ?auto_29928 ?auto_29933 ) ) ( SURFACE-AT ?auto_29934 ?auto_29937 ) ( CLEAR ?auto_29934 ) ( IS-CRATE ?auto_29928 ) ( not ( = ?auto_29927 ?auto_29934 ) ) ( not ( = ?auto_29928 ?auto_29934 ) ) ( not ( = ?auto_29933 ?auto_29934 ) ) ( AVAILABLE ?auto_29930 ) ( TRUCK-AT ?auto_29931 ?auto_29936 ) ( not ( = ?auto_29936 ?auto_29937 ) ) ( not ( = ?auto_29929 ?auto_29936 ) ) ( HOIST-AT ?auto_29935 ?auto_29936 ) ( not ( = ?auto_29930 ?auto_29935 ) ) ( not ( = ?auto_29932 ?auto_29935 ) ) ( AVAILABLE ?auto_29935 ) ( SURFACE-AT ?auto_29928 ?auto_29936 ) ( ON ?auto_29928 ?auto_29938 ) ( CLEAR ?auto_29928 ) ( not ( = ?auto_29927 ?auto_29938 ) ) ( not ( = ?auto_29928 ?auto_29938 ) ) ( not ( = ?auto_29933 ?auto_29938 ) ) ( not ( = ?auto_29934 ?auto_29938 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29935 ?auto_29928 ?auto_29938 ?auto_29936 )
      ( MAKE-ON ?auto_29927 ?auto_29928 )
      ( MAKE-ON-VERIFY ?auto_29927 ?auto_29928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29939 - SURFACE
      ?auto_29940 - SURFACE
    )
    :vars
    (
      ?auto_29942 - HOIST
      ?auto_29941 - PLACE
      ?auto_29948 - PLACE
      ?auto_29943 - HOIST
      ?auto_29946 - SURFACE
      ?auto_29944 - SURFACE
      ?auto_29945 - PLACE
      ?auto_29950 - HOIST
      ?auto_29949 - SURFACE
      ?auto_29947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29942 ?auto_29941 ) ( IS-CRATE ?auto_29939 ) ( not ( = ?auto_29939 ?auto_29940 ) ) ( not ( = ?auto_29948 ?auto_29941 ) ) ( HOIST-AT ?auto_29943 ?auto_29948 ) ( not ( = ?auto_29942 ?auto_29943 ) ) ( AVAILABLE ?auto_29943 ) ( SURFACE-AT ?auto_29939 ?auto_29948 ) ( ON ?auto_29939 ?auto_29946 ) ( CLEAR ?auto_29939 ) ( not ( = ?auto_29939 ?auto_29946 ) ) ( not ( = ?auto_29940 ?auto_29946 ) ) ( SURFACE-AT ?auto_29944 ?auto_29941 ) ( CLEAR ?auto_29944 ) ( IS-CRATE ?auto_29940 ) ( not ( = ?auto_29939 ?auto_29944 ) ) ( not ( = ?auto_29940 ?auto_29944 ) ) ( not ( = ?auto_29946 ?auto_29944 ) ) ( AVAILABLE ?auto_29942 ) ( not ( = ?auto_29945 ?auto_29941 ) ) ( not ( = ?auto_29948 ?auto_29945 ) ) ( HOIST-AT ?auto_29950 ?auto_29945 ) ( not ( = ?auto_29942 ?auto_29950 ) ) ( not ( = ?auto_29943 ?auto_29950 ) ) ( AVAILABLE ?auto_29950 ) ( SURFACE-AT ?auto_29940 ?auto_29945 ) ( ON ?auto_29940 ?auto_29949 ) ( CLEAR ?auto_29940 ) ( not ( = ?auto_29939 ?auto_29949 ) ) ( not ( = ?auto_29940 ?auto_29949 ) ) ( not ( = ?auto_29946 ?auto_29949 ) ) ( not ( = ?auto_29944 ?auto_29949 ) ) ( TRUCK-AT ?auto_29947 ?auto_29941 ) )
    :subtasks
    ( ( !DRIVE ?auto_29947 ?auto_29941 ?auto_29945 )
      ( MAKE-ON ?auto_29939 ?auto_29940 )
      ( MAKE-ON-VERIFY ?auto_29939 ?auto_29940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29951 - SURFACE
      ?auto_29952 - SURFACE
    )
    :vars
    (
      ?auto_29961 - HOIST
      ?auto_29954 - PLACE
      ?auto_29953 - PLACE
      ?auto_29960 - HOIST
      ?auto_29955 - SURFACE
      ?auto_29956 - SURFACE
      ?auto_29958 - PLACE
      ?auto_29962 - HOIST
      ?auto_29959 - SURFACE
      ?auto_29957 - TRUCK
      ?auto_29963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29961 ?auto_29954 ) ( IS-CRATE ?auto_29951 ) ( not ( = ?auto_29951 ?auto_29952 ) ) ( not ( = ?auto_29953 ?auto_29954 ) ) ( HOIST-AT ?auto_29960 ?auto_29953 ) ( not ( = ?auto_29961 ?auto_29960 ) ) ( AVAILABLE ?auto_29960 ) ( SURFACE-AT ?auto_29951 ?auto_29953 ) ( ON ?auto_29951 ?auto_29955 ) ( CLEAR ?auto_29951 ) ( not ( = ?auto_29951 ?auto_29955 ) ) ( not ( = ?auto_29952 ?auto_29955 ) ) ( IS-CRATE ?auto_29952 ) ( not ( = ?auto_29951 ?auto_29956 ) ) ( not ( = ?auto_29952 ?auto_29956 ) ) ( not ( = ?auto_29955 ?auto_29956 ) ) ( not ( = ?auto_29958 ?auto_29954 ) ) ( not ( = ?auto_29953 ?auto_29958 ) ) ( HOIST-AT ?auto_29962 ?auto_29958 ) ( not ( = ?auto_29961 ?auto_29962 ) ) ( not ( = ?auto_29960 ?auto_29962 ) ) ( AVAILABLE ?auto_29962 ) ( SURFACE-AT ?auto_29952 ?auto_29958 ) ( ON ?auto_29952 ?auto_29959 ) ( CLEAR ?auto_29952 ) ( not ( = ?auto_29951 ?auto_29959 ) ) ( not ( = ?auto_29952 ?auto_29959 ) ) ( not ( = ?auto_29955 ?auto_29959 ) ) ( not ( = ?auto_29956 ?auto_29959 ) ) ( TRUCK-AT ?auto_29957 ?auto_29954 ) ( SURFACE-AT ?auto_29963 ?auto_29954 ) ( CLEAR ?auto_29963 ) ( LIFTING ?auto_29961 ?auto_29956 ) ( IS-CRATE ?auto_29956 ) ( not ( = ?auto_29951 ?auto_29963 ) ) ( not ( = ?auto_29952 ?auto_29963 ) ) ( not ( = ?auto_29955 ?auto_29963 ) ) ( not ( = ?auto_29956 ?auto_29963 ) ) ( not ( = ?auto_29959 ?auto_29963 ) ) )
    :subtasks
    ( ( !DROP ?auto_29961 ?auto_29956 ?auto_29963 ?auto_29954 )
      ( MAKE-ON ?auto_29951 ?auto_29952 )
      ( MAKE-ON-VERIFY ?auto_29951 ?auto_29952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29964 - SURFACE
      ?auto_29965 - SURFACE
    )
    :vars
    (
      ?auto_29974 - HOIST
      ?auto_29967 - PLACE
      ?auto_29972 - PLACE
      ?auto_29966 - HOIST
      ?auto_29970 - SURFACE
      ?auto_29968 - SURFACE
      ?auto_29975 - PLACE
      ?auto_29973 - HOIST
      ?auto_29976 - SURFACE
      ?auto_29969 - TRUCK
      ?auto_29971 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29974 ?auto_29967 ) ( IS-CRATE ?auto_29964 ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29972 ?auto_29967 ) ) ( HOIST-AT ?auto_29966 ?auto_29972 ) ( not ( = ?auto_29974 ?auto_29966 ) ) ( AVAILABLE ?auto_29966 ) ( SURFACE-AT ?auto_29964 ?auto_29972 ) ( ON ?auto_29964 ?auto_29970 ) ( CLEAR ?auto_29964 ) ( not ( = ?auto_29964 ?auto_29970 ) ) ( not ( = ?auto_29965 ?auto_29970 ) ) ( IS-CRATE ?auto_29965 ) ( not ( = ?auto_29964 ?auto_29968 ) ) ( not ( = ?auto_29965 ?auto_29968 ) ) ( not ( = ?auto_29970 ?auto_29968 ) ) ( not ( = ?auto_29975 ?auto_29967 ) ) ( not ( = ?auto_29972 ?auto_29975 ) ) ( HOIST-AT ?auto_29973 ?auto_29975 ) ( not ( = ?auto_29974 ?auto_29973 ) ) ( not ( = ?auto_29966 ?auto_29973 ) ) ( AVAILABLE ?auto_29973 ) ( SURFACE-AT ?auto_29965 ?auto_29975 ) ( ON ?auto_29965 ?auto_29976 ) ( CLEAR ?auto_29965 ) ( not ( = ?auto_29964 ?auto_29976 ) ) ( not ( = ?auto_29965 ?auto_29976 ) ) ( not ( = ?auto_29970 ?auto_29976 ) ) ( not ( = ?auto_29968 ?auto_29976 ) ) ( TRUCK-AT ?auto_29969 ?auto_29967 ) ( SURFACE-AT ?auto_29971 ?auto_29967 ) ( CLEAR ?auto_29971 ) ( IS-CRATE ?auto_29968 ) ( not ( = ?auto_29964 ?auto_29971 ) ) ( not ( = ?auto_29965 ?auto_29971 ) ) ( not ( = ?auto_29970 ?auto_29971 ) ) ( not ( = ?auto_29968 ?auto_29971 ) ) ( not ( = ?auto_29976 ?auto_29971 ) ) ( AVAILABLE ?auto_29974 ) ( IN ?auto_29968 ?auto_29969 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29974 ?auto_29968 ?auto_29969 ?auto_29967 )
      ( MAKE-ON ?auto_29964 ?auto_29965 )
      ( MAKE-ON-VERIFY ?auto_29964 ?auto_29965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29977 - SURFACE
      ?auto_29978 - SURFACE
    )
    :vars
    (
      ?auto_29989 - HOIST
      ?auto_29979 - PLACE
      ?auto_29986 - PLACE
      ?auto_29987 - HOIST
      ?auto_29988 - SURFACE
      ?auto_29982 - SURFACE
      ?auto_29983 - PLACE
      ?auto_29981 - HOIST
      ?auto_29984 - SURFACE
      ?auto_29985 - SURFACE
      ?auto_29980 - TRUCK
      ?auto_29990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29989 ?auto_29979 ) ( IS-CRATE ?auto_29977 ) ( not ( = ?auto_29977 ?auto_29978 ) ) ( not ( = ?auto_29986 ?auto_29979 ) ) ( HOIST-AT ?auto_29987 ?auto_29986 ) ( not ( = ?auto_29989 ?auto_29987 ) ) ( AVAILABLE ?auto_29987 ) ( SURFACE-AT ?auto_29977 ?auto_29986 ) ( ON ?auto_29977 ?auto_29988 ) ( CLEAR ?auto_29977 ) ( not ( = ?auto_29977 ?auto_29988 ) ) ( not ( = ?auto_29978 ?auto_29988 ) ) ( IS-CRATE ?auto_29978 ) ( not ( = ?auto_29977 ?auto_29982 ) ) ( not ( = ?auto_29978 ?auto_29982 ) ) ( not ( = ?auto_29988 ?auto_29982 ) ) ( not ( = ?auto_29983 ?auto_29979 ) ) ( not ( = ?auto_29986 ?auto_29983 ) ) ( HOIST-AT ?auto_29981 ?auto_29983 ) ( not ( = ?auto_29989 ?auto_29981 ) ) ( not ( = ?auto_29987 ?auto_29981 ) ) ( AVAILABLE ?auto_29981 ) ( SURFACE-AT ?auto_29978 ?auto_29983 ) ( ON ?auto_29978 ?auto_29984 ) ( CLEAR ?auto_29978 ) ( not ( = ?auto_29977 ?auto_29984 ) ) ( not ( = ?auto_29978 ?auto_29984 ) ) ( not ( = ?auto_29988 ?auto_29984 ) ) ( not ( = ?auto_29982 ?auto_29984 ) ) ( SURFACE-AT ?auto_29985 ?auto_29979 ) ( CLEAR ?auto_29985 ) ( IS-CRATE ?auto_29982 ) ( not ( = ?auto_29977 ?auto_29985 ) ) ( not ( = ?auto_29978 ?auto_29985 ) ) ( not ( = ?auto_29988 ?auto_29985 ) ) ( not ( = ?auto_29982 ?auto_29985 ) ) ( not ( = ?auto_29984 ?auto_29985 ) ) ( AVAILABLE ?auto_29989 ) ( IN ?auto_29982 ?auto_29980 ) ( TRUCK-AT ?auto_29980 ?auto_29990 ) ( not ( = ?auto_29990 ?auto_29979 ) ) ( not ( = ?auto_29986 ?auto_29990 ) ) ( not ( = ?auto_29983 ?auto_29990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29980 ?auto_29990 ?auto_29979 )
      ( MAKE-ON ?auto_29977 ?auto_29978 )
      ( MAKE-ON-VERIFY ?auto_29977 ?auto_29978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29991 - SURFACE
      ?auto_29992 - SURFACE
    )
    :vars
    (
      ?auto_29998 - HOIST
      ?auto_29994 - PLACE
      ?auto_29996 - PLACE
      ?auto_30002 - HOIST
      ?auto_29995 - SURFACE
      ?auto_29997 - SURFACE
      ?auto_30001 - PLACE
      ?auto_30003 - HOIST
      ?auto_30000 - SURFACE
      ?auto_29993 - SURFACE
      ?auto_30004 - TRUCK
      ?auto_29999 - PLACE
      ?auto_30005 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29998 ?auto_29994 ) ( IS-CRATE ?auto_29991 ) ( not ( = ?auto_29991 ?auto_29992 ) ) ( not ( = ?auto_29996 ?auto_29994 ) ) ( HOIST-AT ?auto_30002 ?auto_29996 ) ( not ( = ?auto_29998 ?auto_30002 ) ) ( AVAILABLE ?auto_30002 ) ( SURFACE-AT ?auto_29991 ?auto_29996 ) ( ON ?auto_29991 ?auto_29995 ) ( CLEAR ?auto_29991 ) ( not ( = ?auto_29991 ?auto_29995 ) ) ( not ( = ?auto_29992 ?auto_29995 ) ) ( IS-CRATE ?auto_29992 ) ( not ( = ?auto_29991 ?auto_29997 ) ) ( not ( = ?auto_29992 ?auto_29997 ) ) ( not ( = ?auto_29995 ?auto_29997 ) ) ( not ( = ?auto_30001 ?auto_29994 ) ) ( not ( = ?auto_29996 ?auto_30001 ) ) ( HOIST-AT ?auto_30003 ?auto_30001 ) ( not ( = ?auto_29998 ?auto_30003 ) ) ( not ( = ?auto_30002 ?auto_30003 ) ) ( AVAILABLE ?auto_30003 ) ( SURFACE-AT ?auto_29992 ?auto_30001 ) ( ON ?auto_29992 ?auto_30000 ) ( CLEAR ?auto_29992 ) ( not ( = ?auto_29991 ?auto_30000 ) ) ( not ( = ?auto_29992 ?auto_30000 ) ) ( not ( = ?auto_29995 ?auto_30000 ) ) ( not ( = ?auto_29997 ?auto_30000 ) ) ( SURFACE-AT ?auto_29993 ?auto_29994 ) ( CLEAR ?auto_29993 ) ( IS-CRATE ?auto_29997 ) ( not ( = ?auto_29991 ?auto_29993 ) ) ( not ( = ?auto_29992 ?auto_29993 ) ) ( not ( = ?auto_29995 ?auto_29993 ) ) ( not ( = ?auto_29997 ?auto_29993 ) ) ( not ( = ?auto_30000 ?auto_29993 ) ) ( AVAILABLE ?auto_29998 ) ( TRUCK-AT ?auto_30004 ?auto_29999 ) ( not ( = ?auto_29999 ?auto_29994 ) ) ( not ( = ?auto_29996 ?auto_29999 ) ) ( not ( = ?auto_30001 ?auto_29999 ) ) ( HOIST-AT ?auto_30005 ?auto_29999 ) ( LIFTING ?auto_30005 ?auto_29997 ) ( not ( = ?auto_29998 ?auto_30005 ) ) ( not ( = ?auto_30002 ?auto_30005 ) ) ( not ( = ?auto_30003 ?auto_30005 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30005 ?auto_29997 ?auto_30004 ?auto_29999 )
      ( MAKE-ON ?auto_29991 ?auto_29992 )
      ( MAKE-ON-VERIFY ?auto_29991 ?auto_29992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30006 - SURFACE
      ?auto_30007 - SURFACE
    )
    :vars
    (
      ?auto_30014 - HOIST
      ?auto_30013 - PLACE
      ?auto_30016 - PLACE
      ?auto_30010 - HOIST
      ?auto_30017 - SURFACE
      ?auto_30018 - SURFACE
      ?auto_30008 - PLACE
      ?auto_30011 - HOIST
      ?auto_30020 - SURFACE
      ?auto_30012 - SURFACE
      ?auto_30009 - TRUCK
      ?auto_30019 - PLACE
      ?auto_30015 - HOIST
      ?auto_30021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30014 ?auto_30013 ) ( IS-CRATE ?auto_30006 ) ( not ( = ?auto_30006 ?auto_30007 ) ) ( not ( = ?auto_30016 ?auto_30013 ) ) ( HOIST-AT ?auto_30010 ?auto_30016 ) ( not ( = ?auto_30014 ?auto_30010 ) ) ( AVAILABLE ?auto_30010 ) ( SURFACE-AT ?auto_30006 ?auto_30016 ) ( ON ?auto_30006 ?auto_30017 ) ( CLEAR ?auto_30006 ) ( not ( = ?auto_30006 ?auto_30017 ) ) ( not ( = ?auto_30007 ?auto_30017 ) ) ( IS-CRATE ?auto_30007 ) ( not ( = ?auto_30006 ?auto_30018 ) ) ( not ( = ?auto_30007 ?auto_30018 ) ) ( not ( = ?auto_30017 ?auto_30018 ) ) ( not ( = ?auto_30008 ?auto_30013 ) ) ( not ( = ?auto_30016 ?auto_30008 ) ) ( HOIST-AT ?auto_30011 ?auto_30008 ) ( not ( = ?auto_30014 ?auto_30011 ) ) ( not ( = ?auto_30010 ?auto_30011 ) ) ( AVAILABLE ?auto_30011 ) ( SURFACE-AT ?auto_30007 ?auto_30008 ) ( ON ?auto_30007 ?auto_30020 ) ( CLEAR ?auto_30007 ) ( not ( = ?auto_30006 ?auto_30020 ) ) ( not ( = ?auto_30007 ?auto_30020 ) ) ( not ( = ?auto_30017 ?auto_30020 ) ) ( not ( = ?auto_30018 ?auto_30020 ) ) ( SURFACE-AT ?auto_30012 ?auto_30013 ) ( CLEAR ?auto_30012 ) ( IS-CRATE ?auto_30018 ) ( not ( = ?auto_30006 ?auto_30012 ) ) ( not ( = ?auto_30007 ?auto_30012 ) ) ( not ( = ?auto_30017 ?auto_30012 ) ) ( not ( = ?auto_30018 ?auto_30012 ) ) ( not ( = ?auto_30020 ?auto_30012 ) ) ( AVAILABLE ?auto_30014 ) ( TRUCK-AT ?auto_30009 ?auto_30019 ) ( not ( = ?auto_30019 ?auto_30013 ) ) ( not ( = ?auto_30016 ?auto_30019 ) ) ( not ( = ?auto_30008 ?auto_30019 ) ) ( HOIST-AT ?auto_30015 ?auto_30019 ) ( not ( = ?auto_30014 ?auto_30015 ) ) ( not ( = ?auto_30010 ?auto_30015 ) ) ( not ( = ?auto_30011 ?auto_30015 ) ) ( AVAILABLE ?auto_30015 ) ( SURFACE-AT ?auto_30018 ?auto_30019 ) ( ON ?auto_30018 ?auto_30021 ) ( CLEAR ?auto_30018 ) ( not ( = ?auto_30006 ?auto_30021 ) ) ( not ( = ?auto_30007 ?auto_30021 ) ) ( not ( = ?auto_30017 ?auto_30021 ) ) ( not ( = ?auto_30018 ?auto_30021 ) ) ( not ( = ?auto_30020 ?auto_30021 ) ) ( not ( = ?auto_30012 ?auto_30021 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30015 ?auto_30018 ?auto_30021 ?auto_30019 )
      ( MAKE-ON ?auto_30006 ?auto_30007 )
      ( MAKE-ON-VERIFY ?auto_30006 ?auto_30007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30022 - SURFACE
      ?auto_30023 - SURFACE
    )
    :vars
    (
      ?auto_30035 - HOIST
      ?auto_30031 - PLACE
      ?auto_30030 - PLACE
      ?auto_30029 - HOIST
      ?auto_30028 - SURFACE
      ?auto_30027 - SURFACE
      ?auto_30024 - PLACE
      ?auto_30036 - HOIST
      ?auto_30032 - SURFACE
      ?auto_30034 - SURFACE
      ?auto_30026 - PLACE
      ?auto_30037 - HOIST
      ?auto_30033 - SURFACE
      ?auto_30025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30035 ?auto_30031 ) ( IS-CRATE ?auto_30022 ) ( not ( = ?auto_30022 ?auto_30023 ) ) ( not ( = ?auto_30030 ?auto_30031 ) ) ( HOIST-AT ?auto_30029 ?auto_30030 ) ( not ( = ?auto_30035 ?auto_30029 ) ) ( AVAILABLE ?auto_30029 ) ( SURFACE-AT ?auto_30022 ?auto_30030 ) ( ON ?auto_30022 ?auto_30028 ) ( CLEAR ?auto_30022 ) ( not ( = ?auto_30022 ?auto_30028 ) ) ( not ( = ?auto_30023 ?auto_30028 ) ) ( IS-CRATE ?auto_30023 ) ( not ( = ?auto_30022 ?auto_30027 ) ) ( not ( = ?auto_30023 ?auto_30027 ) ) ( not ( = ?auto_30028 ?auto_30027 ) ) ( not ( = ?auto_30024 ?auto_30031 ) ) ( not ( = ?auto_30030 ?auto_30024 ) ) ( HOIST-AT ?auto_30036 ?auto_30024 ) ( not ( = ?auto_30035 ?auto_30036 ) ) ( not ( = ?auto_30029 ?auto_30036 ) ) ( AVAILABLE ?auto_30036 ) ( SURFACE-AT ?auto_30023 ?auto_30024 ) ( ON ?auto_30023 ?auto_30032 ) ( CLEAR ?auto_30023 ) ( not ( = ?auto_30022 ?auto_30032 ) ) ( not ( = ?auto_30023 ?auto_30032 ) ) ( not ( = ?auto_30028 ?auto_30032 ) ) ( not ( = ?auto_30027 ?auto_30032 ) ) ( SURFACE-AT ?auto_30034 ?auto_30031 ) ( CLEAR ?auto_30034 ) ( IS-CRATE ?auto_30027 ) ( not ( = ?auto_30022 ?auto_30034 ) ) ( not ( = ?auto_30023 ?auto_30034 ) ) ( not ( = ?auto_30028 ?auto_30034 ) ) ( not ( = ?auto_30027 ?auto_30034 ) ) ( not ( = ?auto_30032 ?auto_30034 ) ) ( AVAILABLE ?auto_30035 ) ( not ( = ?auto_30026 ?auto_30031 ) ) ( not ( = ?auto_30030 ?auto_30026 ) ) ( not ( = ?auto_30024 ?auto_30026 ) ) ( HOIST-AT ?auto_30037 ?auto_30026 ) ( not ( = ?auto_30035 ?auto_30037 ) ) ( not ( = ?auto_30029 ?auto_30037 ) ) ( not ( = ?auto_30036 ?auto_30037 ) ) ( AVAILABLE ?auto_30037 ) ( SURFACE-AT ?auto_30027 ?auto_30026 ) ( ON ?auto_30027 ?auto_30033 ) ( CLEAR ?auto_30027 ) ( not ( = ?auto_30022 ?auto_30033 ) ) ( not ( = ?auto_30023 ?auto_30033 ) ) ( not ( = ?auto_30028 ?auto_30033 ) ) ( not ( = ?auto_30027 ?auto_30033 ) ) ( not ( = ?auto_30032 ?auto_30033 ) ) ( not ( = ?auto_30034 ?auto_30033 ) ) ( TRUCK-AT ?auto_30025 ?auto_30031 ) )
    :subtasks
    ( ( !DRIVE ?auto_30025 ?auto_30031 ?auto_30026 )
      ( MAKE-ON ?auto_30022 ?auto_30023 )
      ( MAKE-ON-VERIFY ?auto_30022 ?auto_30023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30040 - SURFACE
      ?auto_30041 - SURFACE
    )
    :vars
    (
      ?auto_30042 - HOIST
      ?auto_30043 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30042 ?auto_30043 ) ( SURFACE-AT ?auto_30041 ?auto_30043 ) ( CLEAR ?auto_30041 ) ( LIFTING ?auto_30042 ?auto_30040 ) ( IS-CRATE ?auto_30040 ) ( not ( = ?auto_30040 ?auto_30041 ) ) )
    :subtasks
    ( ( !DROP ?auto_30042 ?auto_30040 ?auto_30041 ?auto_30043 )
      ( MAKE-ON-VERIFY ?auto_30040 ?auto_30041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30044 - SURFACE
      ?auto_30045 - SURFACE
    )
    :vars
    (
      ?auto_30047 - HOIST
      ?auto_30046 - PLACE
      ?auto_30048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30047 ?auto_30046 ) ( SURFACE-AT ?auto_30045 ?auto_30046 ) ( CLEAR ?auto_30045 ) ( IS-CRATE ?auto_30044 ) ( not ( = ?auto_30044 ?auto_30045 ) ) ( TRUCK-AT ?auto_30048 ?auto_30046 ) ( AVAILABLE ?auto_30047 ) ( IN ?auto_30044 ?auto_30048 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30047 ?auto_30044 ?auto_30048 ?auto_30046 )
      ( MAKE-ON ?auto_30044 ?auto_30045 )
      ( MAKE-ON-VERIFY ?auto_30044 ?auto_30045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30049 - SURFACE
      ?auto_30050 - SURFACE
    )
    :vars
    (
      ?auto_30052 - HOIST
      ?auto_30051 - PLACE
      ?auto_30053 - TRUCK
      ?auto_30054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30052 ?auto_30051 ) ( SURFACE-AT ?auto_30050 ?auto_30051 ) ( CLEAR ?auto_30050 ) ( IS-CRATE ?auto_30049 ) ( not ( = ?auto_30049 ?auto_30050 ) ) ( AVAILABLE ?auto_30052 ) ( IN ?auto_30049 ?auto_30053 ) ( TRUCK-AT ?auto_30053 ?auto_30054 ) ( not ( = ?auto_30054 ?auto_30051 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30053 ?auto_30054 ?auto_30051 )
      ( MAKE-ON ?auto_30049 ?auto_30050 )
      ( MAKE-ON-VERIFY ?auto_30049 ?auto_30050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30055 - SURFACE
      ?auto_30056 - SURFACE
    )
    :vars
    (
      ?auto_30058 - HOIST
      ?auto_30060 - PLACE
      ?auto_30059 - TRUCK
      ?auto_30057 - PLACE
      ?auto_30061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30058 ?auto_30060 ) ( SURFACE-AT ?auto_30056 ?auto_30060 ) ( CLEAR ?auto_30056 ) ( IS-CRATE ?auto_30055 ) ( not ( = ?auto_30055 ?auto_30056 ) ) ( AVAILABLE ?auto_30058 ) ( TRUCK-AT ?auto_30059 ?auto_30057 ) ( not ( = ?auto_30057 ?auto_30060 ) ) ( HOIST-AT ?auto_30061 ?auto_30057 ) ( LIFTING ?auto_30061 ?auto_30055 ) ( not ( = ?auto_30058 ?auto_30061 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30061 ?auto_30055 ?auto_30059 ?auto_30057 )
      ( MAKE-ON ?auto_30055 ?auto_30056 )
      ( MAKE-ON-VERIFY ?auto_30055 ?auto_30056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30062 - SURFACE
      ?auto_30063 - SURFACE
    )
    :vars
    (
      ?auto_30067 - HOIST
      ?auto_30065 - PLACE
      ?auto_30064 - TRUCK
      ?auto_30068 - PLACE
      ?auto_30066 - HOIST
      ?auto_30069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30067 ?auto_30065 ) ( SURFACE-AT ?auto_30063 ?auto_30065 ) ( CLEAR ?auto_30063 ) ( IS-CRATE ?auto_30062 ) ( not ( = ?auto_30062 ?auto_30063 ) ) ( AVAILABLE ?auto_30067 ) ( TRUCK-AT ?auto_30064 ?auto_30068 ) ( not ( = ?auto_30068 ?auto_30065 ) ) ( HOIST-AT ?auto_30066 ?auto_30068 ) ( not ( = ?auto_30067 ?auto_30066 ) ) ( AVAILABLE ?auto_30066 ) ( SURFACE-AT ?auto_30062 ?auto_30068 ) ( ON ?auto_30062 ?auto_30069 ) ( CLEAR ?auto_30062 ) ( not ( = ?auto_30062 ?auto_30069 ) ) ( not ( = ?auto_30063 ?auto_30069 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30066 ?auto_30062 ?auto_30069 ?auto_30068 )
      ( MAKE-ON ?auto_30062 ?auto_30063 )
      ( MAKE-ON-VERIFY ?auto_30062 ?auto_30063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30070 - SURFACE
      ?auto_30071 - SURFACE
    )
    :vars
    (
      ?auto_30073 - HOIST
      ?auto_30072 - PLACE
      ?auto_30076 - PLACE
      ?auto_30074 - HOIST
      ?auto_30075 - SURFACE
      ?auto_30077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30073 ?auto_30072 ) ( SURFACE-AT ?auto_30071 ?auto_30072 ) ( CLEAR ?auto_30071 ) ( IS-CRATE ?auto_30070 ) ( not ( = ?auto_30070 ?auto_30071 ) ) ( AVAILABLE ?auto_30073 ) ( not ( = ?auto_30076 ?auto_30072 ) ) ( HOIST-AT ?auto_30074 ?auto_30076 ) ( not ( = ?auto_30073 ?auto_30074 ) ) ( AVAILABLE ?auto_30074 ) ( SURFACE-AT ?auto_30070 ?auto_30076 ) ( ON ?auto_30070 ?auto_30075 ) ( CLEAR ?auto_30070 ) ( not ( = ?auto_30070 ?auto_30075 ) ) ( not ( = ?auto_30071 ?auto_30075 ) ) ( TRUCK-AT ?auto_30077 ?auto_30072 ) )
    :subtasks
    ( ( !DRIVE ?auto_30077 ?auto_30072 ?auto_30076 )
      ( MAKE-ON ?auto_30070 ?auto_30071 )
      ( MAKE-ON-VERIFY ?auto_30070 ?auto_30071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30078 - SURFACE
      ?auto_30079 - SURFACE
    )
    :vars
    (
      ?auto_30081 - HOIST
      ?auto_30082 - PLACE
      ?auto_30080 - PLACE
      ?auto_30085 - HOIST
      ?auto_30084 - SURFACE
      ?auto_30083 - TRUCK
      ?auto_30086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30081 ?auto_30082 ) ( IS-CRATE ?auto_30078 ) ( not ( = ?auto_30078 ?auto_30079 ) ) ( not ( = ?auto_30080 ?auto_30082 ) ) ( HOIST-AT ?auto_30085 ?auto_30080 ) ( not ( = ?auto_30081 ?auto_30085 ) ) ( AVAILABLE ?auto_30085 ) ( SURFACE-AT ?auto_30078 ?auto_30080 ) ( ON ?auto_30078 ?auto_30084 ) ( CLEAR ?auto_30078 ) ( not ( = ?auto_30078 ?auto_30084 ) ) ( not ( = ?auto_30079 ?auto_30084 ) ) ( TRUCK-AT ?auto_30083 ?auto_30082 ) ( SURFACE-AT ?auto_30086 ?auto_30082 ) ( CLEAR ?auto_30086 ) ( LIFTING ?auto_30081 ?auto_30079 ) ( IS-CRATE ?auto_30079 ) ( not ( = ?auto_30078 ?auto_30086 ) ) ( not ( = ?auto_30079 ?auto_30086 ) ) ( not ( = ?auto_30084 ?auto_30086 ) ) )
    :subtasks
    ( ( !DROP ?auto_30081 ?auto_30079 ?auto_30086 ?auto_30082 )
      ( MAKE-ON ?auto_30078 ?auto_30079 )
      ( MAKE-ON-VERIFY ?auto_30078 ?auto_30079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30087 - SURFACE
      ?auto_30088 - SURFACE
    )
    :vars
    (
      ?auto_30092 - HOIST
      ?auto_30093 - PLACE
      ?auto_30095 - PLACE
      ?auto_30094 - HOIST
      ?auto_30091 - SURFACE
      ?auto_30089 - TRUCK
      ?auto_30090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30092 ?auto_30093 ) ( IS-CRATE ?auto_30087 ) ( not ( = ?auto_30087 ?auto_30088 ) ) ( not ( = ?auto_30095 ?auto_30093 ) ) ( HOIST-AT ?auto_30094 ?auto_30095 ) ( not ( = ?auto_30092 ?auto_30094 ) ) ( AVAILABLE ?auto_30094 ) ( SURFACE-AT ?auto_30087 ?auto_30095 ) ( ON ?auto_30087 ?auto_30091 ) ( CLEAR ?auto_30087 ) ( not ( = ?auto_30087 ?auto_30091 ) ) ( not ( = ?auto_30088 ?auto_30091 ) ) ( TRUCK-AT ?auto_30089 ?auto_30093 ) ( SURFACE-AT ?auto_30090 ?auto_30093 ) ( CLEAR ?auto_30090 ) ( IS-CRATE ?auto_30088 ) ( not ( = ?auto_30087 ?auto_30090 ) ) ( not ( = ?auto_30088 ?auto_30090 ) ) ( not ( = ?auto_30091 ?auto_30090 ) ) ( AVAILABLE ?auto_30092 ) ( IN ?auto_30088 ?auto_30089 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30092 ?auto_30088 ?auto_30089 ?auto_30093 )
      ( MAKE-ON ?auto_30087 ?auto_30088 )
      ( MAKE-ON-VERIFY ?auto_30087 ?auto_30088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30096 - SURFACE
      ?auto_30097 - SURFACE
    )
    :vars
    (
      ?auto_30098 - HOIST
      ?auto_30099 - PLACE
      ?auto_30102 - PLACE
      ?auto_30100 - HOIST
      ?auto_30103 - SURFACE
      ?auto_30104 - SURFACE
      ?auto_30101 - TRUCK
      ?auto_30105 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30098 ?auto_30099 ) ( IS-CRATE ?auto_30096 ) ( not ( = ?auto_30096 ?auto_30097 ) ) ( not ( = ?auto_30102 ?auto_30099 ) ) ( HOIST-AT ?auto_30100 ?auto_30102 ) ( not ( = ?auto_30098 ?auto_30100 ) ) ( AVAILABLE ?auto_30100 ) ( SURFACE-AT ?auto_30096 ?auto_30102 ) ( ON ?auto_30096 ?auto_30103 ) ( CLEAR ?auto_30096 ) ( not ( = ?auto_30096 ?auto_30103 ) ) ( not ( = ?auto_30097 ?auto_30103 ) ) ( SURFACE-AT ?auto_30104 ?auto_30099 ) ( CLEAR ?auto_30104 ) ( IS-CRATE ?auto_30097 ) ( not ( = ?auto_30096 ?auto_30104 ) ) ( not ( = ?auto_30097 ?auto_30104 ) ) ( not ( = ?auto_30103 ?auto_30104 ) ) ( AVAILABLE ?auto_30098 ) ( IN ?auto_30097 ?auto_30101 ) ( TRUCK-AT ?auto_30101 ?auto_30105 ) ( not ( = ?auto_30105 ?auto_30099 ) ) ( not ( = ?auto_30102 ?auto_30105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30101 ?auto_30105 ?auto_30099 )
      ( MAKE-ON ?auto_30096 ?auto_30097 )
      ( MAKE-ON-VERIFY ?auto_30096 ?auto_30097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30106 - SURFACE
      ?auto_30107 - SURFACE
    )
    :vars
    (
      ?auto_30110 - HOIST
      ?auto_30109 - PLACE
      ?auto_30114 - PLACE
      ?auto_30112 - HOIST
      ?auto_30115 - SURFACE
      ?auto_30113 - SURFACE
      ?auto_30108 - TRUCK
      ?auto_30111 - PLACE
      ?auto_30116 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30110 ?auto_30109 ) ( IS-CRATE ?auto_30106 ) ( not ( = ?auto_30106 ?auto_30107 ) ) ( not ( = ?auto_30114 ?auto_30109 ) ) ( HOIST-AT ?auto_30112 ?auto_30114 ) ( not ( = ?auto_30110 ?auto_30112 ) ) ( AVAILABLE ?auto_30112 ) ( SURFACE-AT ?auto_30106 ?auto_30114 ) ( ON ?auto_30106 ?auto_30115 ) ( CLEAR ?auto_30106 ) ( not ( = ?auto_30106 ?auto_30115 ) ) ( not ( = ?auto_30107 ?auto_30115 ) ) ( SURFACE-AT ?auto_30113 ?auto_30109 ) ( CLEAR ?auto_30113 ) ( IS-CRATE ?auto_30107 ) ( not ( = ?auto_30106 ?auto_30113 ) ) ( not ( = ?auto_30107 ?auto_30113 ) ) ( not ( = ?auto_30115 ?auto_30113 ) ) ( AVAILABLE ?auto_30110 ) ( TRUCK-AT ?auto_30108 ?auto_30111 ) ( not ( = ?auto_30111 ?auto_30109 ) ) ( not ( = ?auto_30114 ?auto_30111 ) ) ( HOIST-AT ?auto_30116 ?auto_30111 ) ( LIFTING ?auto_30116 ?auto_30107 ) ( not ( = ?auto_30110 ?auto_30116 ) ) ( not ( = ?auto_30112 ?auto_30116 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30116 ?auto_30107 ?auto_30108 ?auto_30111 )
      ( MAKE-ON ?auto_30106 ?auto_30107 )
      ( MAKE-ON-VERIFY ?auto_30106 ?auto_30107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30117 - SURFACE
      ?auto_30118 - SURFACE
    )
    :vars
    (
      ?auto_30120 - HOIST
      ?auto_30121 - PLACE
      ?auto_30124 - PLACE
      ?auto_30126 - HOIST
      ?auto_30125 - SURFACE
      ?auto_30122 - SURFACE
      ?auto_30127 - TRUCK
      ?auto_30123 - PLACE
      ?auto_30119 - HOIST
      ?auto_30128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30120 ?auto_30121 ) ( IS-CRATE ?auto_30117 ) ( not ( = ?auto_30117 ?auto_30118 ) ) ( not ( = ?auto_30124 ?auto_30121 ) ) ( HOIST-AT ?auto_30126 ?auto_30124 ) ( not ( = ?auto_30120 ?auto_30126 ) ) ( AVAILABLE ?auto_30126 ) ( SURFACE-AT ?auto_30117 ?auto_30124 ) ( ON ?auto_30117 ?auto_30125 ) ( CLEAR ?auto_30117 ) ( not ( = ?auto_30117 ?auto_30125 ) ) ( not ( = ?auto_30118 ?auto_30125 ) ) ( SURFACE-AT ?auto_30122 ?auto_30121 ) ( CLEAR ?auto_30122 ) ( IS-CRATE ?auto_30118 ) ( not ( = ?auto_30117 ?auto_30122 ) ) ( not ( = ?auto_30118 ?auto_30122 ) ) ( not ( = ?auto_30125 ?auto_30122 ) ) ( AVAILABLE ?auto_30120 ) ( TRUCK-AT ?auto_30127 ?auto_30123 ) ( not ( = ?auto_30123 ?auto_30121 ) ) ( not ( = ?auto_30124 ?auto_30123 ) ) ( HOIST-AT ?auto_30119 ?auto_30123 ) ( not ( = ?auto_30120 ?auto_30119 ) ) ( not ( = ?auto_30126 ?auto_30119 ) ) ( AVAILABLE ?auto_30119 ) ( SURFACE-AT ?auto_30118 ?auto_30123 ) ( ON ?auto_30118 ?auto_30128 ) ( CLEAR ?auto_30118 ) ( not ( = ?auto_30117 ?auto_30128 ) ) ( not ( = ?auto_30118 ?auto_30128 ) ) ( not ( = ?auto_30125 ?auto_30128 ) ) ( not ( = ?auto_30122 ?auto_30128 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30119 ?auto_30118 ?auto_30128 ?auto_30123 )
      ( MAKE-ON ?auto_30117 ?auto_30118 )
      ( MAKE-ON-VERIFY ?auto_30117 ?auto_30118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30129 - SURFACE
      ?auto_30130 - SURFACE
    )
    :vars
    (
      ?auto_30138 - HOIST
      ?auto_30139 - PLACE
      ?auto_30135 - PLACE
      ?auto_30134 - HOIST
      ?auto_30131 - SURFACE
      ?auto_30136 - SURFACE
      ?auto_30133 - PLACE
      ?auto_30140 - HOIST
      ?auto_30137 - SURFACE
      ?auto_30132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30138 ?auto_30139 ) ( IS-CRATE ?auto_30129 ) ( not ( = ?auto_30129 ?auto_30130 ) ) ( not ( = ?auto_30135 ?auto_30139 ) ) ( HOIST-AT ?auto_30134 ?auto_30135 ) ( not ( = ?auto_30138 ?auto_30134 ) ) ( AVAILABLE ?auto_30134 ) ( SURFACE-AT ?auto_30129 ?auto_30135 ) ( ON ?auto_30129 ?auto_30131 ) ( CLEAR ?auto_30129 ) ( not ( = ?auto_30129 ?auto_30131 ) ) ( not ( = ?auto_30130 ?auto_30131 ) ) ( SURFACE-AT ?auto_30136 ?auto_30139 ) ( CLEAR ?auto_30136 ) ( IS-CRATE ?auto_30130 ) ( not ( = ?auto_30129 ?auto_30136 ) ) ( not ( = ?auto_30130 ?auto_30136 ) ) ( not ( = ?auto_30131 ?auto_30136 ) ) ( AVAILABLE ?auto_30138 ) ( not ( = ?auto_30133 ?auto_30139 ) ) ( not ( = ?auto_30135 ?auto_30133 ) ) ( HOIST-AT ?auto_30140 ?auto_30133 ) ( not ( = ?auto_30138 ?auto_30140 ) ) ( not ( = ?auto_30134 ?auto_30140 ) ) ( AVAILABLE ?auto_30140 ) ( SURFACE-AT ?auto_30130 ?auto_30133 ) ( ON ?auto_30130 ?auto_30137 ) ( CLEAR ?auto_30130 ) ( not ( = ?auto_30129 ?auto_30137 ) ) ( not ( = ?auto_30130 ?auto_30137 ) ) ( not ( = ?auto_30131 ?auto_30137 ) ) ( not ( = ?auto_30136 ?auto_30137 ) ) ( TRUCK-AT ?auto_30132 ?auto_30139 ) )
    :subtasks
    ( ( !DRIVE ?auto_30132 ?auto_30139 ?auto_30133 )
      ( MAKE-ON ?auto_30129 ?auto_30130 )
      ( MAKE-ON-VERIFY ?auto_30129 ?auto_30130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30141 - SURFACE
      ?auto_30142 - SURFACE
    )
    :vars
    (
      ?auto_30144 - HOIST
      ?auto_30152 - PLACE
      ?auto_30145 - PLACE
      ?auto_30147 - HOIST
      ?auto_30143 - SURFACE
      ?auto_30148 - SURFACE
      ?auto_30146 - PLACE
      ?auto_30149 - HOIST
      ?auto_30151 - SURFACE
      ?auto_30150 - TRUCK
      ?auto_30153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30144 ?auto_30152 ) ( IS-CRATE ?auto_30141 ) ( not ( = ?auto_30141 ?auto_30142 ) ) ( not ( = ?auto_30145 ?auto_30152 ) ) ( HOIST-AT ?auto_30147 ?auto_30145 ) ( not ( = ?auto_30144 ?auto_30147 ) ) ( AVAILABLE ?auto_30147 ) ( SURFACE-AT ?auto_30141 ?auto_30145 ) ( ON ?auto_30141 ?auto_30143 ) ( CLEAR ?auto_30141 ) ( not ( = ?auto_30141 ?auto_30143 ) ) ( not ( = ?auto_30142 ?auto_30143 ) ) ( IS-CRATE ?auto_30142 ) ( not ( = ?auto_30141 ?auto_30148 ) ) ( not ( = ?auto_30142 ?auto_30148 ) ) ( not ( = ?auto_30143 ?auto_30148 ) ) ( not ( = ?auto_30146 ?auto_30152 ) ) ( not ( = ?auto_30145 ?auto_30146 ) ) ( HOIST-AT ?auto_30149 ?auto_30146 ) ( not ( = ?auto_30144 ?auto_30149 ) ) ( not ( = ?auto_30147 ?auto_30149 ) ) ( AVAILABLE ?auto_30149 ) ( SURFACE-AT ?auto_30142 ?auto_30146 ) ( ON ?auto_30142 ?auto_30151 ) ( CLEAR ?auto_30142 ) ( not ( = ?auto_30141 ?auto_30151 ) ) ( not ( = ?auto_30142 ?auto_30151 ) ) ( not ( = ?auto_30143 ?auto_30151 ) ) ( not ( = ?auto_30148 ?auto_30151 ) ) ( TRUCK-AT ?auto_30150 ?auto_30152 ) ( SURFACE-AT ?auto_30153 ?auto_30152 ) ( CLEAR ?auto_30153 ) ( LIFTING ?auto_30144 ?auto_30148 ) ( IS-CRATE ?auto_30148 ) ( not ( = ?auto_30141 ?auto_30153 ) ) ( not ( = ?auto_30142 ?auto_30153 ) ) ( not ( = ?auto_30143 ?auto_30153 ) ) ( not ( = ?auto_30148 ?auto_30153 ) ) ( not ( = ?auto_30151 ?auto_30153 ) ) )
    :subtasks
    ( ( !DROP ?auto_30144 ?auto_30148 ?auto_30153 ?auto_30152 )
      ( MAKE-ON ?auto_30141 ?auto_30142 )
      ( MAKE-ON-VERIFY ?auto_30141 ?auto_30142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30154 - SURFACE
      ?auto_30155 - SURFACE
    )
    :vars
    (
      ?auto_30166 - HOIST
      ?auto_30161 - PLACE
      ?auto_30162 - PLACE
      ?auto_30160 - HOIST
      ?auto_30157 - SURFACE
      ?auto_30159 - SURFACE
      ?auto_30158 - PLACE
      ?auto_30164 - HOIST
      ?auto_30163 - SURFACE
      ?auto_30156 - TRUCK
      ?auto_30165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30166 ?auto_30161 ) ( IS-CRATE ?auto_30154 ) ( not ( = ?auto_30154 ?auto_30155 ) ) ( not ( = ?auto_30162 ?auto_30161 ) ) ( HOIST-AT ?auto_30160 ?auto_30162 ) ( not ( = ?auto_30166 ?auto_30160 ) ) ( AVAILABLE ?auto_30160 ) ( SURFACE-AT ?auto_30154 ?auto_30162 ) ( ON ?auto_30154 ?auto_30157 ) ( CLEAR ?auto_30154 ) ( not ( = ?auto_30154 ?auto_30157 ) ) ( not ( = ?auto_30155 ?auto_30157 ) ) ( IS-CRATE ?auto_30155 ) ( not ( = ?auto_30154 ?auto_30159 ) ) ( not ( = ?auto_30155 ?auto_30159 ) ) ( not ( = ?auto_30157 ?auto_30159 ) ) ( not ( = ?auto_30158 ?auto_30161 ) ) ( not ( = ?auto_30162 ?auto_30158 ) ) ( HOIST-AT ?auto_30164 ?auto_30158 ) ( not ( = ?auto_30166 ?auto_30164 ) ) ( not ( = ?auto_30160 ?auto_30164 ) ) ( AVAILABLE ?auto_30164 ) ( SURFACE-AT ?auto_30155 ?auto_30158 ) ( ON ?auto_30155 ?auto_30163 ) ( CLEAR ?auto_30155 ) ( not ( = ?auto_30154 ?auto_30163 ) ) ( not ( = ?auto_30155 ?auto_30163 ) ) ( not ( = ?auto_30157 ?auto_30163 ) ) ( not ( = ?auto_30159 ?auto_30163 ) ) ( TRUCK-AT ?auto_30156 ?auto_30161 ) ( SURFACE-AT ?auto_30165 ?auto_30161 ) ( CLEAR ?auto_30165 ) ( IS-CRATE ?auto_30159 ) ( not ( = ?auto_30154 ?auto_30165 ) ) ( not ( = ?auto_30155 ?auto_30165 ) ) ( not ( = ?auto_30157 ?auto_30165 ) ) ( not ( = ?auto_30159 ?auto_30165 ) ) ( not ( = ?auto_30163 ?auto_30165 ) ) ( AVAILABLE ?auto_30166 ) ( IN ?auto_30159 ?auto_30156 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30166 ?auto_30159 ?auto_30156 ?auto_30161 )
      ( MAKE-ON ?auto_30154 ?auto_30155 )
      ( MAKE-ON-VERIFY ?auto_30154 ?auto_30155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30167 - SURFACE
      ?auto_30168 - SURFACE
    )
    :vars
    (
      ?auto_30176 - HOIST
      ?auto_30174 - PLACE
      ?auto_30175 - PLACE
      ?auto_30177 - HOIST
      ?auto_30170 - SURFACE
      ?auto_30178 - SURFACE
      ?auto_30169 - PLACE
      ?auto_30179 - HOIST
      ?auto_30171 - SURFACE
      ?auto_30172 - SURFACE
      ?auto_30173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30176 ?auto_30174 ) ( IS-CRATE ?auto_30167 ) ( not ( = ?auto_30167 ?auto_30168 ) ) ( not ( = ?auto_30175 ?auto_30174 ) ) ( HOIST-AT ?auto_30177 ?auto_30175 ) ( not ( = ?auto_30176 ?auto_30177 ) ) ( AVAILABLE ?auto_30177 ) ( SURFACE-AT ?auto_30167 ?auto_30175 ) ( ON ?auto_30167 ?auto_30170 ) ( CLEAR ?auto_30167 ) ( not ( = ?auto_30167 ?auto_30170 ) ) ( not ( = ?auto_30168 ?auto_30170 ) ) ( IS-CRATE ?auto_30168 ) ( not ( = ?auto_30167 ?auto_30178 ) ) ( not ( = ?auto_30168 ?auto_30178 ) ) ( not ( = ?auto_30170 ?auto_30178 ) ) ( not ( = ?auto_30169 ?auto_30174 ) ) ( not ( = ?auto_30175 ?auto_30169 ) ) ( HOIST-AT ?auto_30179 ?auto_30169 ) ( not ( = ?auto_30176 ?auto_30179 ) ) ( not ( = ?auto_30177 ?auto_30179 ) ) ( AVAILABLE ?auto_30179 ) ( SURFACE-AT ?auto_30168 ?auto_30169 ) ( ON ?auto_30168 ?auto_30171 ) ( CLEAR ?auto_30168 ) ( not ( = ?auto_30167 ?auto_30171 ) ) ( not ( = ?auto_30168 ?auto_30171 ) ) ( not ( = ?auto_30170 ?auto_30171 ) ) ( not ( = ?auto_30178 ?auto_30171 ) ) ( SURFACE-AT ?auto_30172 ?auto_30174 ) ( CLEAR ?auto_30172 ) ( IS-CRATE ?auto_30178 ) ( not ( = ?auto_30167 ?auto_30172 ) ) ( not ( = ?auto_30168 ?auto_30172 ) ) ( not ( = ?auto_30170 ?auto_30172 ) ) ( not ( = ?auto_30178 ?auto_30172 ) ) ( not ( = ?auto_30171 ?auto_30172 ) ) ( AVAILABLE ?auto_30176 ) ( IN ?auto_30178 ?auto_30173 ) ( TRUCK-AT ?auto_30173 ?auto_30175 ) )
    :subtasks
    ( ( !DRIVE ?auto_30173 ?auto_30175 ?auto_30174 )
      ( MAKE-ON ?auto_30167 ?auto_30168 )
      ( MAKE-ON-VERIFY ?auto_30167 ?auto_30168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30180 - SURFACE
      ?auto_30181 - SURFACE
    )
    :vars
    (
      ?auto_30185 - HOIST
      ?auto_30183 - PLACE
      ?auto_30192 - PLACE
      ?auto_30186 - HOIST
      ?auto_30189 - SURFACE
      ?auto_30184 - SURFACE
      ?auto_30188 - PLACE
      ?auto_30182 - HOIST
      ?auto_30191 - SURFACE
      ?auto_30187 - SURFACE
      ?auto_30190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30185 ?auto_30183 ) ( IS-CRATE ?auto_30180 ) ( not ( = ?auto_30180 ?auto_30181 ) ) ( not ( = ?auto_30192 ?auto_30183 ) ) ( HOIST-AT ?auto_30186 ?auto_30192 ) ( not ( = ?auto_30185 ?auto_30186 ) ) ( SURFACE-AT ?auto_30180 ?auto_30192 ) ( ON ?auto_30180 ?auto_30189 ) ( CLEAR ?auto_30180 ) ( not ( = ?auto_30180 ?auto_30189 ) ) ( not ( = ?auto_30181 ?auto_30189 ) ) ( IS-CRATE ?auto_30181 ) ( not ( = ?auto_30180 ?auto_30184 ) ) ( not ( = ?auto_30181 ?auto_30184 ) ) ( not ( = ?auto_30189 ?auto_30184 ) ) ( not ( = ?auto_30188 ?auto_30183 ) ) ( not ( = ?auto_30192 ?auto_30188 ) ) ( HOIST-AT ?auto_30182 ?auto_30188 ) ( not ( = ?auto_30185 ?auto_30182 ) ) ( not ( = ?auto_30186 ?auto_30182 ) ) ( AVAILABLE ?auto_30182 ) ( SURFACE-AT ?auto_30181 ?auto_30188 ) ( ON ?auto_30181 ?auto_30191 ) ( CLEAR ?auto_30181 ) ( not ( = ?auto_30180 ?auto_30191 ) ) ( not ( = ?auto_30181 ?auto_30191 ) ) ( not ( = ?auto_30189 ?auto_30191 ) ) ( not ( = ?auto_30184 ?auto_30191 ) ) ( SURFACE-AT ?auto_30187 ?auto_30183 ) ( CLEAR ?auto_30187 ) ( IS-CRATE ?auto_30184 ) ( not ( = ?auto_30180 ?auto_30187 ) ) ( not ( = ?auto_30181 ?auto_30187 ) ) ( not ( = ?auto_30189 ?auto_30187 ) ) ( not ( = ?auto_30184 ?auto_30187 ) ) ( not ( = ?auto_30191 ?auto_30187 ) ) ( AVAILABLE ?auto_30185 ) ( TRUCK-AT ?auto_30190 ?auto_30192 ) ( LIFTING ?auto_30186 ?auto_30184 ) )
    :subtasks
    ( ( !LOAD ?auto_30186 ?auto_30184 ?auto_30190 ?auto_30192 )
      ( MAKE-ON ?auto_30180 ?auto_30181 )
      ( MAKE-ON-VERIFY ?auto_30180 ?auto_30181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30193 - SURFACE
      ?auto_30194 - SURFACE
    )
    :vars
    (
      ?auto_30199 - HOIST
      ?auto_30196 - PLACE
      ?auto_30201 - PLACE
      ?auto_30202 - HOIST
      ?auto_30200 - SURFACE
      ?auto_30197 - SURFACE
      ?auto_30203 - PLACE
      ?auto_30198 - HOIST
      ?auto_30204 - SURFACE
      ?auto_30195 - SURFACE
      ?auto_30205 - TRUCK
      ?auto_30206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30199 ?auto_30196 ) ( IS-CRATE ?auto_30193 ) ( not ( = ?auto_30193 ?auto_30194 ) ) ( not ( = ?auto_30201 ?auto_30196 ) ) ( HOIST-AT ?auto_30202 ?auto_30201 ) ( not ( = ?auto_30199 ?auto_30202 ) ) ( SURFACE-AT ?auto_30193 ?auto_30201 ) ( ON ?auto_30193 ?auto_30200 ) ( CLEAR ?auto_30193 ) ( not ( = ?auto_30193 ?auto_30200 ) ) ( not ( = ?auto_30194 ?auto_30200 ) ) ( IS-CRATE ?auto_30194 ) ( not ( = ?auto_30193 ?auto_30197 ) ) ( not ( = ?auto_30194 ?auto_30197 ) ) ( not ( = ?auto_30200 ?auto_30197 ) ) ( not ( = ?auto_30203 ?auto_30196 ) ) ( not ( = ?auto_30201 ?auto_30203 ) ) ( HOIST-AT ?auto_30198 ?auto_30203 ) ( not ( = ?auto_30199 ?auto_30198 ) ) ( not ( = ?auto_30202 ?auto_30198 ) ) ( AVAILABLE ?auto_30198 ) ( SURFACE-AT ?auto_30194 ?auto_30203 ) ( ON ?auto_30194 ?auto_30204 ) ( CLEAR ?auto_30194 ) ( not ( = ?auto_30193 ?auto_30204 ) ) ( not ( = ?auto_30194 ?auto_30204 ) ) ( not ( = ?auto_30200 ?auto_30204 ) ) ( not ( = ?auto_30197 ?auto_30204 ) ) ( SURFACE-AT ?auto_30195 ?auto_30196 ) ( CLEAR ?auto_30195 ) ( IS-CRATE ?auto_30197 ) ( not ( = ?auto_30193 ?auto_30195 ) ) ( not ( = ?auto_30194 ?auto_30195 ) ) ( not ( = ?auto_30200 ?auto_30195 ) ) ( not ( = ?auto_30197 ?auto_30195 ) ) ( not ( = ?auto_30204 ?auto_30195 ) ) ( AVAILABLE ?auto_30199 ) ( TRUCK-AT ?auto_30205 ?auto_30201 ) ( AVAILABLE ?auto_30202 ) ( SURFACE-AT ?auto_30197 ?auto_30201 ) ( ON ?auto_30197 ?auto_30206 ) ( CLEAR ?auto_30197 ) ( not ( = ?auto_30193 ?auto_30206 ) ) ( not ( = ?auto_30194 ?auto_30206 ) ) ( not ( = ?auto_30200 ?auto_30206 ) ) ( not ( = ?auto_30197 ?auto_30206 ) ) ( not ( = ?auto_30204 ?auto_30206 ) ) ( not ( = ?auto_30195 ?auto_30206 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30202 ?auto_30197 ?auto_30206 ?auto_30201 )
      ( MAKE-ON ?auto_30193 ?auto_30194 )
      ( MAKE-ON-VERIFY ?auto_30193 ?auto_30194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30207 - SURFACE
      ?auto_30208 - SURFACE
    )
    :vars
    (
      ?auto_30215 - HOIST
      ?auto_30209 - PLACE
      ?auto_30214 - PLACE
      ?auto_30212 - HOIST
      ?auto_30210 - SURFACE
      ?auto_30213 - SURFACE
      ?auto_30218 - PLACE
      ?auto_30216 - HOIST
      ?auto_30211 - SURFACE
      ?auto_30220 - SURFACE
      ?auto_30219 - SURFACE
      ?auto_30217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30215 ?auto_30209 ) ( IS-CRATE ?auto_30207 ) ( not ( = ?auto_30207 ?auto_30208 ) ) ( not ( = ?auto_30214 ?auto_30209 ) ) ( HOIST-AT ?auto_30212 ?auto_30214 ) ( not ( = ?auto_30215 ?auto_30212 ) ) ( SURFACE-AT ?auto_30207 ?auto_30214 ) ( ON ?auto_30207 ?auto_30210 ) ( CLEAR ?auto_30207 ) ( not ( = ?auto_30207 ?auto_30210 ) ) ( not ( = ?auto_30208 ?auto_30210 ) ) ( IS-CRATE ?auto_30208 ) ( not ( = ?auto_30207 ?auto_30213 ) ) ( not ( = ?auto_30208 ?auto_30213 ) ) ( not ( = ?auto_30210 ?auto_30213 ) ) ( not ( = ?auto_30218 ?auto_30209 ) ) ( not ( = ?auto_30214 ?auto_30218 ) ) ( HOIST-AT ?auto_30216 ?auto_30218 ) ( not ( = ?auto_30215 ?auto_30216 ) ) ( not ( = ?auto_30212 ?auto_30216 ) ) ( AVAILABLE ?auto_30216 ) ( SURFACE-AT ?auto_30208 ?auto_30218 ) ( ON ?auto_30208 ?auto_30211 ) ( CLEAR ?auto_30208 ) ( not ( = ?auto_30207 ?auto_30211 ) ) ( not ( = ?auto_30208 ?auto_30211 ) ) ( not ( = ?auto_30210 ?auto_30211 ) ) ( not ( = ?auto_30213 ?auto_30211 ) ) ( SURFACE-AT ?auto_30220 ?auto_30209 ) ( CLEAR ?auto_30220 ) ( IS-CRATE ?auto_30213 ) ( not ( = ?auto_30207 ?auto_30220 ) ) ( not ( = ?auto_30208 ?auto_30220 ) ) ( not ( = ?auto_30210 ?auto_30220 ) ) ( not ( = ?auto_30213 ?auto_30220 ) ) ( not ( = ?auto_30211 ?auto_30220 ) ) ( AVAILABLE ?auto_30215 ) ( AVAILABLE ?auto_30212 ) ( SURFACE-AT ?auto_30213 ?auto_30214 ) ( ON ?auto_30213 ?auto_30219 ) ( CLEAR ?auto_30213 ) ( not ( = ?auto_30207 ?auto_30219 ) ) ( not ( = ?auto_30208 ?auto_30219 ) ) ( not ( = ?auto_30210 ?auto_30219 ) ) ( not ( = ?auto_30213 ?auto_30219 ) ) ( not ( = ?auto_30211 ?auto_30219 ) ) ( not ( = ?auto_30220 ?auto_30219 ) ) ( TRUCK-AT ?auto_30217 ?auto_30209 ) )
    :subtasks
    ( ( !DRIVE ?auto_30217 ?auto_30209 ?auto_30214 )
      ( MAKE-ON ?auto_30207 ?auto_30208 )
      ( MAKE-ON-VERIFY ?auto_30207 ?auto_30208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30221 - SURFACE
      ?auto_30222 - SURFACE
    )
    :vars
    (
      ?auto_30223 - HOIST
      ?auto_30231 - PLACE
      ?auto_30229 - PLACE
      ?auto_30225 - HOIST
      ?auto_30230 - SURFACE
      ?auto_30228 - SURFACE
      ?auto_30227 - PLACE
      ?auto_30233 - HOIST
      ?auto_30226 - SURFACE
      ?auto_30224 - SURFACE
      ?auto_30232 - SURFACE
      ?auto_30234 - TRUCK
      ?auto_30235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30223 ?auto_30231 ) ( IS-CRATE ?auto_30221 ) ( not ( = ?auto_30221 ?auto_30222 ) ) ( not ( = ?auto_30229 ?auto_30231 ) ) ( HOIST-AT ?auto_30225 ?auto_30229 ) ( not ( = ?auto_30223 ?auto_30225 ) ) ( SURFACE-AT ?auto_30221 ?auto_30229 ) ( ON ?auto_30221 ?auto_30230 ) ( CLEAR ?auto_30221 ) ( not ( = ?auto_30221 ?auto_30230 ) ) ( not ( = ?auto_30222 ?auto_30230 ) ) ( IS-CRATE ?auto_30222 ) ( not ( = ?auto_30221 ?auto_30228 ) ) ( not ( = ?auto_30222 ?auto_30228 ) ) ( not ( = ?auto_30230 ?auto_30228 ) ) ( not ( = ?auto_30227 ?auto_30231 ) ) ( not ( = ?auto_30229 ?auto_30227 ) ) ( HOIST-AT ?auto_30233 ?auto_30227 ) ( not ( = ?auto_30223 ?auto_30233 ) ) ( not ( = ?auto_30225 ?auto_30233 ) ) ( AVAILABLE ?auto_30233 ) ( SURFACE-AT ?auto_30222 ?auto_30227 ) ( ON ?auto_30222 ?auto_30226 ) ( CLEAR ?auto_30222 ) ( not ( = ?auto_30221 ?auto_30226 ) ) ( not ( = ?auto_30222 ?auto_30226 ) ) ( not ( = ?auto_30230 ?auto_30226 ) ) ( not ( = ?auto_30228 ?auto_30226 ) ) ( IS-CRATE ?auto_30228 ) ( not ( = ?auto_30221 ?auto_30224 ) ) ( not ( = ?auto_30222 ?auto_30224 ) ) ( not ( = ?auto_30230 ?auto_30224 ) ) ( not ( = ?auto_30228 ?auto_30224 ) ) ( not ( = ?auto_30226 ?auto_30224 ) ) ( AVAILABLE ?auto_30225 ) ( SURFACE-AT ?auto_30228 ?auto_30229 ) ( ON ?auto_30228 ?auto_30232 ) ( CLEAR ?auto_30228 ) ( not ( = ?auto_30221 ?auto_30232 ) ) ( not ( = ?auto_30222 ?auto_30232 ) ) ( not ( = ?auto_30230 ?auto_30232 ) ) ( not ( = ?auto_30228 ?auto_30232 ) ) ( not ( = ?auto_30226 ?auto_30232 ) ) ( not ( = ?auto_30224 ?auto_30232 ) ) ( TRUCK-AT ?auto_30234 ?auto_30231 ) ( SURFACE-AT ?auto_30235 ?auto_30231 ) ( CLEAR ?auto_30235 ) ( LIFTING ?auto_30223 ?auto_30224 ) ( IS-CRATE ?auto_30224 ) ( not ( = ?auto_30221 ?auto_30235 ) ) ( not ( = ?auto_30222 ?auto_30235 ) ) ( not ( = ?auto_30230 ?auto_30235 ) ) ( not ( = ?auto_30228 ?auto_30235 ) ) ( not ( = ?auto_30226 ?auto_30235 ) ) ( not ( = ?auto_30224 ?auto_30235 ) ) ( not ( = ?auto_30232 ?auto_30235 ) ) )
    :subtasks
    ( ( !DROP ?auto_30223 ?auto_30224 ?auto_30235 ?auto_30231 )
      ( MAKE-ON ?auto_30221 ?auto_30222 )
      ( MAKE-ON-VERIFY ?auto_30221 ?auto_30222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30236 - SURFACE
      ?auto_30237 - SURFACE
    )
    :vars
    (
      ?auto_30243 - HOIST
      ?auto_30249 - PLACE
      ?auto_30248 - PLACE
      ?auto_30245 - HOIST
      ?auto_30240 - SURFACE
      ?auto_30242 - SURFACE
      ?auto_30241 - PLACE
      ?auto_30246 - HOIST
      ?auto_30239 - SURFACE
      ?auto_30238 - SURFACE
      ?auto_30244 - SURFACE
      ?auto_30247 - TRUCK
      ?auto_30250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30243 ?auto_30249 ) ( IS-CRATE ?auto_30236 ) ( not ( = ?auto_30236 ?auto_30237 ) ) ( not ( = ?auto_30248 ?auto_30249 ) ) ( HOIST-AT ?auto_30245 ?auto_30248 ) ( not ( = ?auto_30243 ?auto_30245 ) ) ( SURFACE-AT ?auto_30236 ?auto_30248 ) ( ON ?auto_30236 ?auto_30240 ) ( CLEAR ?auto_30236 ) ( not ( = ?auto_30236 ?auto_30240 ) ) ( not ( = ?auto_30237 ?auto_30240 ) ) ( IS-CRATE ?auto_30237 ) ( not ( = ?auto_30236 ?auto_30242 ) ) ( not ( = ?auto_30237 ?auto_30242 ) ) ( not ( = ?auto_30240 ?auto_30242 ) ) ( not ( = ?auto_30241 ?auto_30249 ) ) ( not ( = ?auto_30248 ?auto_30241 ) ) ( HOIST-AT ?auto_30246 ?auto_30241 ) ( not ( = ?auto_30243 ?auto_30246 ) ) ( not ( = ?auto_30245 ?auto_30246 ) ) ( AVAILABLE ?auto_30246 ) ( SURFACE-AT ?auto_30237 ?auto_30241 ) ( ON ?auto_30237 ?auto_30239 ) ( CLEAR ?auto_30237 ) ( not ( = ?auto_30236 ?auto_30239 ) ) ( not ( = ?auto_30237 ?auto_30239 ) ) ( not ( = ?auto_30240 ?auto_30239 ) ) ( not ( = ?auto_30242 ?auto_30239 ) ) ( IS-CRATE ?auto_30242 ) ( not ( = ?auto_30236 ?auto_30238 ) ) ( not ( = ?auto_30237 ?auto_30238 ) ) ( not ( = ?auto_30240 ?auto_30238 ) ) ( not ( = ?auto_30242 ?auto_30238 ) ) ( not ( = ?auto_30239 ?auto_30238 ) ) ( AVAILABLE ?auto_30245 ) ( SURFACE-AT ?auto_30242 ?auto_30248 ) ( ON ?auto_30242 ?auto_30244 ) ( CLEAR ?auto_30242 ) ( not ( = ?auto_30236 ?auto_30244 ) ) ( not ( = ?auto_30237 ?auto_30244 ) ) ( not ( = ?auto_30240 ?auto_30244 ) ) ( not ( = ?auto_30242 ?auto_30244 ) ) ( not ( = ?auto_30239 ?auto_30244 ) ) ( not ( = ?auto_30238 ?auto_30244 ) ) ( TRUCK-AT ?auto_30247 ?auto_30249 ) ( SURFACE-AT ?auto_30250 ?auto_30249 ) ( CLEAR ?auto_30250 ) ( IS-CRATE ?auto_30238 ) ( not ( = ?auto_30236 ?auto_30250 ) ) ( not ( = ?auto_30237 ?auto_30250 ) ) ( not ( = ?auto_30240 ?auto_30250 ) ) ( not ( = ?auto_30242 ?auto_30250 ) ) ( not ( = ?auto_30239 ?auto_30250 ) ) ( not ( = ?auto_30238 ?auto_30250 ) ) ( not ( = ?auto_30244 ?auto_30250 ) ) ( AVAILABLE ?auto_30243 ) ( IN ?auto_30238 ?auto_30247 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30243 ?auto_30238 ?auto_30247 ?auto_30249 )
      ( MAKE-ON ?auto_30236 ?auto_30237 )
      ( MAKE-ON-VERIFY ?auto_30236 ?auto_30237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30251 - SURFACE
      ?auto_30252 - SURFACE
    )
    :vars
    (
      ?auto_30262 - HOIST
      ?auto_30260 - PLACE
      ?auto_30253 - PLACE
      ?auto_30256 - HOIST
      ?auto_30265 - SURFACE
      ?auto_30254 - SURFACE
      ?auto_30257 - PLACE
      ?auto_30255 - HOIST
      ?auto_30263 - SURFACE
      ?auto_30264 - SURFACE
      ?auto_30261 - SURFACE
      ?auto_30258 - SURFACE
      ?auto_30259 - TRUCK
      ?auto_30266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30262 ?auto_30260 ) ( IS-CRATE ?auto_30251 ) ( not ( = ?auto_30251 ?auto_30252 ) ) ( not ( = ?auto_30253 ?auto_30260 ) ) ( HOIST-AT ?auto_30256 ?auto_30253 ) ( not ( = ?auto_30262 ?auto_30256 ) ) ( SURFACE-AT ?auto_30251 ?auto_30253 ) ( ON ?auto_30251 ?auto_30265 ) ( CLEAR ?auto_30251 ) ( not ( = ?auto_30251 ?auto_30265 ) ) ( not ( = ?auto_30252 ?auto_30265 ) ) ( IS-CRATE ?auto_30252 ) ( not ( = ?auto_30251 ?auto_30254 ) ) ( not ( = ?auto_30252 ?auto_30254 ) ) ( not ( = ?auto_30265 ?auto_30254 ) ) ( not ( = ?auto_30257 ?auto_30260 ) ) ( not ( = ?auto_30253 ?auto_30257 ) ) ( HOIST-AT ?auto_30255 ?auto_30257 ) ( not ( = ?auto_30262 ?auto_30255 ) ) ( not ( = ?auto_30256 ?auto_30255 ) ) ( AVAILABLE ?auto_30255 ) ( SURFACE-AT ?auto_30252 ?auto_30257 ) ( ON ?auto_30252 ?auto_30263 ) ( CLEAR ?auto_30252 ) ( not ( = ?auto_30251 ?auto_30263 ) ) ( not ( = ?auto_30252 ?auto_30263 ) ) ( not ( = ?auto_30265 ?auto_30263 ) ) ( not ( = ?auto_30254 ?auto_30263 ) ) ( IS-CRATE ?auto_30254 ) ( not ( = ?auto_30251 ?auto_30264 ) ) ( not ( = ?auto_30252 ?auto_30264 ) ) ( not ( = ?auto_30265 ?auto_30264 ) ) ( not ( = ?auto_30254 ?auto_30264 ) ) ( not ( = ?auto_30263 ?auto_30264 ) ) ( AVAILABLE ?auto_30256 ) ( SURFACE-AT ?auto_30254 ?auto_30253 ) ( ON ?auto_30254 ?auto_30261 ) ( CLEAR ?auto_30254 ) ( not ( = ?auto_30251 ?auto_30261 ) ) ( not ( = ?auto_30252 ?auto_30261 ) ) ( not ( = ?auto_30265 ?auto_30261 ) ) ( not ( = ?auto_30254 ?auto_30261 ) ) ( not ( = ?auto_30263 ?auto_30261 ) ) ( not ( = ?auto_30264 ?auto_30261 ) ) ( SURFACE-AT ?auto_30258 ?auto_30260 ) ( CLEAR ?auto_30258 ) ( IS-CRATE ?auto_30264 ) ( not ( = ?auto_30251 ?auto_30258 ) ) ( not ( = ?auto_30252 ?auto_30258 ) ) ( not ( = ?auto_30265 ?auto_30258 ) ) ( not ( = ?auto_30254 ?auto_30258 ) ) ( not ( = ?auto_30263 ?auto_30258 ) ) ( not ( = ?auto_30264 ?auto_30258 ) ) ( not ( = ?auto_30261 ?auto_30258 ) ) ( AVAILABLE ?auto_30262 ) ( IN ?auto_30264 ?auto_30259 ) ( TRUCK-AT ?auto_30259 ?auto_30266 ) ( not ( = ?auto_30266 ?auto_30260 ) ) ( not ( = ?auto_30253 ?auto_30266 ) ) ( not ( = ?auto_30257 ?auto_30266 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30259 ?auto_30266 ?auto_30260 )
      ( MAKE-ON ?auto_30251 ?auto_30252 )
      ( MAKE-ON-VERIFY ?auto_30251 ?auto_30252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30267 - SURFACE
      ?auto_30268 - SURFACE
    )
    :vars
    (
      ?auto_30281 - HOIST
      ?auto_30277 - PLACE
      ?auto_30275 - PLACE
      ?auto_30276 - HOIST
      ?auto_30273 - SURFACE
      ?auto_30272 - SURFACE
      ?auto_30280 - PLACE
      ?auto_30270 - HOIST
      ?auto_30274 - SURFACE
      ?auto_30278 - SURFACE
      ?auto_30279 - SURFACE
      ?auto_30269 - SURFACE
      ?auto_30271 - TRUCK
      ?auto_30282 - PLACE
      ?auto_30283 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30281 ?auto_30277 ) ( IS-CRATE ?auto_30267 ) ( not ( = ?auto_30267 ?auto_30268 ) ) ( not ( = ?auto_30275 ?auto_30277 ) ) ( HOIST-AT ?auto_30276 ?auto_30275 ) ( not ( = ?auto_30281 ?auto_30276 ) ) ( SURFACE-AT ?auto_30267 ?auto_30275 ) ( ON ?auto_30267 ?auto_30273 ) ( CLEAR ?auto_30267 ) ( not ( = ?auto_30267 ?auto_30273 ) ) ( not ( = ?auto_30268 ?auto_30273 ) ) ( IS-CRATE ?auto_30268 ) ( not ( = ?auto_30267 ?auto_30272 ) ) ( not ( = ?auto_30268 ?auto_30272 ) ) ( not ( = ?auto_30273 ?auto_30272 ) ) ( not ( = ?auto_30280 ?auto_30277 ) ) ( not ( = ?auto_30275 ?auto_30280 ) ) ( HOIST-AT ?auto_30270 ?auto_30280 ) ( not ( = ?auto_30281 ?auto_30270 ) ) ( not ( = ?auto_30276 ?auto_30270 ) ) ( AVAILABLE ?auto_30270 ) ( SURFACE-AT ?auto_30268 ?auto_30280 ) ( ON ?auto_30268 ?auto_30274 ) ( CLEAR ?auto_30268 ) ( not ( = ?auto_30267 ?auto_30274 ) ) ( not ( = ?auto_30268 ?auto_30274 ) ) ( not ( = ?auto_30273 ?auto_30274 ) ) ( not ( = ?auto_30272 ?auto_30274 ) ) ( IS-CRATE ?auto_30272 ) ( not ( = ?auto_30267 ?auto_30278 ) ) ( not ( = ?auto_30268 ?auto_30278 ) ) ( not ( = ?auto_30273 ?auto_30278 ) ) ( not ( = ?auto_30272 ?auto_30278 ) ) ( not ( = ?auto_30274 ?auto_30278 ) ) ( AVAILABLE ?auto_30276 ) ( SURFACE-AT ?auto_30272 ?auto_30275 ) ( ON ?auto_30272 ?auto_30279 ) ( CLEAR ?auto_30272 ) ( not ( = ?auto_30267 ?auto_30279 ) ) ( not ( = ?auto_30268 ?auto_30279 ) ) ( not ( = ?auto_30273 ?auto_30279 ) ) ( not ( = ?auto_30272 ?auto_30279 ) ) ( not ( = ?auto_30274 ?auto_30279 ) ) ( not ( = ?auto_30278 ?auto_30279 ) ) ( SURFACE-AT ?auto_30269 ?auto_30277 ) ( CLEAR ?auto_30269 ) ( IS-CRATE ?auto_30278 ) ( not ( = ?auto_30267 ?auto_30269 ) ) ( not ( = ?auto_30268 ?auto_30269 ) ) ( not ( = ?auto_30273 ?auto_30269 ) ) ( not ( = ?auto_30272 ?auto_30269 ) ) ( not ( = ?auto_30274 ?auto_30269 ) ) ( not ( = ?auto_30278 ?auto_30269 ) ) ( not ( = ?auto_30279 ?auto_30269 ) ) ( AVAILABLE ?auto_30281 ) ( TRUCK-AT ?auto_30271 ?auto_30282 ) ( not ( = ?auto_30282 ?auto_30277 ) ) ( not ( = ?auto_30275 ?auto_30282 ) ) ( not ( = ?auto_30280 ?auto_30282 ) ) ( HOIST-AT ?auto_30283 ?auto_30282 ) ( LIFTING ?auto_30283 ?auto_30278 ) ( not ( = ?auto_30281 ?auto_30283 ) ) ( not ( = ?auto_30276 ?auto_30283 ) ) ( not ( = ?auto_30270 ?auto_30283 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30283 ?auto_30278 ?auto_30271 ?auto_30282 )
      ( MAKE-ON ?auto_30267 ?auto_30268 )
      ( MAKE-ON-VERIFY ?auto_30267 ?auto_30268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30284 - SURFACE
      ?auto_30285 - SURFACE
    )
    :vars
    (
      ?auto_30300 - HOIST
      ?auto_30295 - PLACE
      ?auto_30297 - PLACE
      ?auto_30293 - HOIST
      ?auto_30290 - SURFACE
      ?auto_30291 - SURFACE
      ?auto_30298 - PLACE
      ?auto_30288 - HOIST
      ?auto_30292 - SURFACE
      ?auto_30289 - SURFACE
      ?auto_30294 - SURFACE
      ?auto_30299 - SURFACE
      ?auto_30286 - TRUCK
      ?auto_30287 - PLACE
      ?auto_30296 - HOIST
      ?auto_30301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30300 ?auto_30295 ) ( IS-CRATE ?auto_30284 ) ( not ( = ?auto_30284 ?auto_30285 ) ) ( not ( = ?auto_30297 ?auto_30295 ) ) ( HOIST-AT ?auto_30293 ?auto_30297 ) ( not ( = ?auto_30300 ?auto_30293 ) ) ( SURFACE-AT ?auto_30284 ?auto_30297 ) ( ON ?auto_30284 ?auto_30290 ) ( CLEAR ?auto_30284 ) ( not ( = ?auto_30284 ?auto_30290 ) ) ( not ( = ?auto_30285 ?auto_30290 ) ) ( IS-CRATE ?auto_30285 ) ( not ( = ?auto_30284 ?auto_30291 ) ) ( not ( = ?auto_30285 ?auto_30291 ) ) ( not ( = ?auto_30290 ?auto_30291 ) ) ( not ( = ?auto_30298 ?auto_30295 ) ) ( not ( = ?auto_30297 ?auto_30298 ) ) ( HOIST-AT ?auto_30288 ?auto_30298 ) ( not ( = ?auto_30300 ?auto_30288 ) ) ( not ( = ?auto_30293 ?auto_30288 ) ) ( AVAILABLE ?auto_30288 ) ( SURFACE-AT ?auto_30285 ?auto_30298 ) ( ON ?auto_30285 ?auto_30292 ) ( CLEAR ?auto_30285 ) ( not ( = ?auto_30284 ?auto_30292 ) ) ( not ( = ?auto_30285 ?auto_30292 ) ) ( not ( = ?auto_30290 ?auto_30292 ) ) ( not ( = ?auto_30291 ?auto_30292 ) ) ( IS-CRATE ?auto_30291 ) ( not ( = ?auto_30284 ?auto_30289 ) ) ( not ( = ?auto_30285 ?auto_30289 ) ) ( not ( = ?auto_30290 ?auto_30289 ) ) ( not ( = ?auto_30291 ?auto_30289 ) ) ( not ( = ?auto_30292 ?auto_30289 ) ) ( AVAILABLE ?auto_30293 ) ( SURFACE-AT ?auto_30291 ?auto_30297 ) ( ON ?auto_30291 ?auto_30294 ) ( CLEAR ?auto_30291 ) ( not ( = ?auto_30284 ?auto_30294 ) ) ( not ( = ?auto_30285 ?auto_30294 ) ) ( not ( = ?auto_30290 ?auto_30294 ) ) ( not ( = ?auto_30291 ?auto_30294 ) ) ( not ( = ?auto_30292 ?auto_30294 ) ) ( not ( = ?auto_30289 ?auto_30294 ) ) ( SURFACE-AT ?auto_30299 ?auto_30295 ) ( CLEAR ?auto_30299 ) ( IS-CRATE ?auto_30289 ) ( not ( = ?auto_30284 ?auto_30299 ) ) ( not ( = ?auto_30285 ?auto_30299 ) ) ( not ( = ?auto_30290 ?auto_30299 ) ) ( not ( = ?auto_30291 ?auto_30299 ) ) ( not ( = ?auto_30292 ?auto_30299 ) ) ( not ( = ?auto_30289 ?auto_30299 ) ) ( not ( = ?auto_30294 ?auto_30299 ) ) ( AVAILABLE ?auto_30300 ) ( TRUCK-AT ?auto_30286 ?auto_30287 ) ( not ( = ?auto_30287 ?auto_30295 ) ) ( not ( = ?auto_30297 ?auto_30287 ) ) ( not ( = ?auto_30298 ?auto_30287 ) ) ( HOIST-AT ?auto_30296 ?auto_30287 ) ( not ( = ?auto_30300 ?auto_30296 ) ) ( not ( = ?auto_30293 ?auto_30296 ) ) ( not ( = ?auto_30288 ?auto_30296 ) ) ( AVAILABLE ?auto_30296 ) ( SURFACE-AT ?auto_30289 ?auto_30287 ) ( ON ?auto_30289 ?auto_30301 ) ( CLEAR ?auto_30289 ) ( not ( = ?auto_30284 ?auto_30301 ) ) ( not ( = ?auto_30285 ?auto_30301 ) ) ( not ( = ?auto_30290 ?auto_30301 ) ) ( not ( = ?auto_30291 ?auto_30301 ) ) ( not ( = ?auto_30292 ?auto_30301 ) ) ( not ( = ?auto_30289 ?auto_30301 ) ) ( not ( = ?auto_30294 ?auto_30301 ) ) ( not ( = ?auto_30299 ?auto_30301 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30296 ?auto_30289 ?auto_30301 ?auto_30287 )
      ( MAKE-ON ?auto_30284 ?auto_30285 )
      ( MAKE-ON-VERIFY ?auto_30284 ?auto_30285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30302 - SURFACE
      ?auto_30303 - SURFACE
    )
    :vars
    (
      ?auto_30319 - HOIST
      ?auto_30318 - PLACE
      ?auto_30315 - PLACE
      ?auto_30305 - HOIST
      ?auto_30308 - SURFACE
      ?auto_30313 - SURFACE
      ?auto_30307 - PLACE
      ?auto_30309 - HOIST
      ?auto_30311 - SURFACE
      ?auto_30310 - SURFACE
      ?auto_30317 - SURFACE
      ?auto_30316 - SURFACE
      ?auto_30314 - PLACE
      ?auto_30304 - HOIST
      ?auto_30312 - SURFACE
      ?auto_30306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30319 ?auto_30318 ) ( IS-CRATE ?auto_30302 ) ( not ( = ?auto_30302 ?auto_30303 ) ) ( not ( = ?auto_30315 ?auto_30318 ) ) ( HOIST-AT ?auto_30305 ?auto_30315 ) ( not ( = ?auto_30319 ?auto_30305 ) ) ( SURFACE-AT ?auto_30302 ?auto_30315 ) ( ON ?auto_30302 ?auto_30308 ) ( CLEAR ?auto_30302 ) ( not ( = ?auto_30302 ?auto_30308 ) ) ( not ( = ?auto_30303 ?auto_30308 ) ) ( IS-CRATE ?auto_30303 ) ( not ( = ?auto_30302 ?auto_30313 ) ) ( not ( = ?auto_30303 ?auto_30313 ) ) ( not ( = ?auto_30308 ?auto_30313 ) ) ( not ( = ?auto_30307 ?auto_30318 ) ) ( not ( = ?auto_30315 ?auto_30307 ) ) ( HOIST-AT ?auto_30309 ?auto_30307 ) ( not ( = ?auto_30319 ?auto_30309 ) ) ( not ( = ?auto_30305 ?auto_30309 ) ) ( AVAILABLE ?auto_30309 ) ( SURFACE-AT ?auto_30303 ?auto_30307 ) ( ON ?auto_30303 ?auto_30311 ) ( CLEAR ?auto_30303 ) ( not ( = ?auto_30302 ?auto_30311 ) ) ( not ( = ?auto_30303 ?auto_30311 ) ) ( not ( = ?auto_30308 ?auto_30311 ) ) ( not ( = ?auto_30313 ?auto_30311 ) ) ( IS-CRATE ?auto_30313 ) ( not ( = ?auto_30302 ?auto_30310 ) ) ( not ( = ?auto_30303 ?auto_30310 ) ) ( not ( = ?auto_30308 ?auto_30310 ) ) ( not ( = ?auto_30313 ?auto_30310 ) ) ( not ( = ?auto_30311 ?auto_30310 ) ) ( AVAILABLE ?auto_30305 ) ( SURFACE-AT ?auto_30313 ?auto_30315 ) ( ON ?auto_30313 ?auto_30317 ) ( CLEAR ?auto_30313 ) ( not ( = ?auto_30302 ?auto_30317 ) ) ( not ( = ?auto_30303 ?auto_30317 ) ) ( not ( = ?auto_30308 ?auto_30317 ) ) ( not ( = ?auto_30313 ?auto_30317 ) ) ( not ( = ?auto_30311 ?auto_30317 ) ) ( not ( = ?auto_30310 ?auto_30317 ) ) ( SURFACE-AT ?auto_30316 ?auto_30318 ) ( CLEAR ?auto_30316 ) ( IS-CRATE ?auto_30310 ) ( not ( = ?auto_30302 ?auto_30316 ) ) ( not ( = ?auto_30303 ?auto_30316 ) ) ( not ( = ?auto_30308 ?auto_30316 ) ) ( not ( = ?auto_30313 ?auto_30316 ) ) ( not ( = ?auto_30311 ?auto_30316 ) ) ( not ( = ?auto_30310 ?auto_30316 ) ) ( not ( = ?auto_30317 ?auto_30316 ) ) ( AVAILABLE ?auto_30319 ) ( not ( = ?auto_30314 ?auto_30318 ) ) ( not ( = ?auto_30315 ?auto_30314 ) ) ( not ( = ?auto_30307 ?auto_30314 ) ) ( HOIST-AT ?auto_30304 ?auto_30314 ) ( not ( = ?auto_30319 ?auto_30304 ) ) ( not ( = ?auto_30305 ?auto_30304 ) ) ( not ( = ?auto_30309 ?auto_30304 ) ) ( AVAILABLE ?auto_30304 ) ( SURFACE-AT ?auto_30310 ?auto_30314 ) ( ON ?auto_30310 ?auto_30312 ) ( CLEAR ?auto_30310 ) ( not ( = ?auto_30302 ?auto_30312 ) ) ( not ( = ?auto_30303 ?auto_30312 ) ) ( not ( = ?auto_30308 ?auto_30312 ) ) ( not ( = ?auto_30313 ?auto_30312 ) ) ( not ( = ?auto_30311 ?auto_30312 ) ) ( not ( = ?auto_30310 ?auto_30312 ) ) ( not ( = ?auto_30317 ?auto_30312 ) ) ( not ( = ?auto_30316 ?auto_30312 ) ) ( TRUCK-AT ?auto_30306 ?auto_30318 ) )
    :subtasks
    ( ( !DRIVE ?auto_30306 ?auto_30318 ?auto_30314 )
      ( MAKE-ON ?auto_30302 ?auto_30303 )
      ( MAKE-ON-VERIFY ?auto_30302 ?auto_30303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30322 - SURFACE
      ?auto_30323 - SURFACE
    )
    :vars
    (
      ?auto_30324 - HOIST
      ?auto_30325 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30324 ?auto_30325 ) ( SURFACE-AT ?auto_30323 ?auto_30325 ) ( CLEAR ?auto_30323 ) ( LIFTING ?auto_30324 ?auto_30322 ) ( IS-CRATE ?auto_30322 ) ( not ( = ?auto_30322 ?auto_30323 ) ) )
    :subtasks
    ( ( !DROP ?auto_30324 ?auto_30322 ?auto_30323 ?auto_30325 )
      ( MAKE-ON-VERIFY ?auto_30322 ?auto_30323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30326 - SURFACE
      ?auto_30327 - SURFACE
    )
    :vars
    (
      ?auto_30328 - HOIST
      ?auto_30329 - PLACE
      ?auto_30330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30328 ?auto_30329 ) ( SURFACE-AT ?auto_30327 ?auto_30329 ) ( CLEAR ?auto_30327 ) ( IS-CRATE ?auto_30326 ) ( not ( = ?auto_30326 ?auto_30327 ) ) ( TRUCK-AT ?auto_30330 ?auto_30329 ) ( AVAILABLE ?auto_30328 ) ( IN ?auto_30326 ?auto_30330 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30328 ?auto_30326 ?auto_30330 ?auto_30329 )
      ( MAKE-ON ?auto_30326 ?auto_30327 )
      ( MAKE-ON-VERIFY ?auto_30326 ?auto_30327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30331 - SURFACE
      ?auto_30332 - SURFACE
    )
    :vars
    (
      ?auto_30334 - HOIST
      ?auto_30333 - PLACE
      ?auto_30335 - TRUCK
      ?auto_30336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30334 ?auto_30333 ) ( SURFACE-AT ?auto_30332 ?auto_30333 ) ( CLEAR ?auto_30332 ) ( IS-CRATE ?auto_30331 ) ( not ( = ?auto_30331 ?auto_30332 ) ) ( AVAILABLE ?auto_30334 ) ( IN ?auto_30331 ?auto_30335 ) ( TRUCK-AT ?auto_30335 ?auto_30336 ) ( not ( = ?auto_30336 ?auto_30333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30335 ?auto_30336 ?auto_30333 )
      ( MAKE-ON ?auto_30331 ?auto_30332 )
      ( MAKE-ON-VERIFY ?auto_30331 ?auto_30332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30337 - SURFACE
      ?auto_30338 - SURFACE
    )
    :vars
    (
      ?auto_30341 - HOIST
      ?auto_30339 - PLACE
      ?auto_30342 - TRUCK
      ?auto_30340 - PLACE
      ?auto_30343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30341 ?auto_30339 ) ( SURFACE-AT ?auto_30338 ?auto_30339 ) ( CLEAR ?auto_30338 ) ( IS-CRATE ?auto_30337 ) ( not ( = ?auto_30337 ?auto_30338 ) ) ( AVAILABLE ?auto_30341 ) ( TRUCK-AT ?auto_30342 ?auto_30340 ) ( not ( = ?auto_30340 ?auto_30339 ) ) ( HOIST-AT ?auto_30343 ?auto_30340 ) ( LIFTING ?auto_30343 ?auto_30337 ) ( not ( = ?auto_30341 ?auto_30343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30343 ?auto_30337 ?auto_30342 ?auto_30340 )
      ( MAKE-ON ?auto_30337 ?auto_30338 )
      ( MAKE-ON-VERIFY ?auto_30337 ?auto_30338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30344 - SURFACE
      ?auto_30345 - SURFACE
    )
    :vars
    (
      ?auto_30348 - HOIST
      ?auto_30349 - PLACE
      ?auto_30350 - TRUCK
      ?auto_30346 - PLACE
      ?auto_30347 - HOIST
      ?auto_30351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30348 ?auto_30349 ) ( SURFACE-AT ?auto_30345 ?auto_30349 ) ( CLEAR ?auto_30345 ) ( IS-CRATE ?auto_30344 ) ( not ( = ?auto_30344 ?auto_30345 ) ) ( AVAILABLE ?auto_30348 ) ( TRUCK-AT ?auto_30350 ?auto_30346 ) ( not ( = ?auto_30346 ?auto_30349 ) ) ( HOIST-AT ?auto_30347 ?auto_30346 ) ( not ( = ?auto_30348 ?auto_30347 ) ) ( AVAILABLE ?auto_30347 ) ( SURFACE-AT ?auto_30344 ?auto_30346 ) ( ON ?auto_30344 ?auto_30351 ) ( CLEAR ?auto_30344 ) ( not ( = ?auto_30344 ?auto_30351 ) ) ( not ( = ?auto_30345 ?auto_30351 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30347 ?auto_30344 ?auto_30351 ?auto_30346 )
      ( MAKE-ON ?auto_30344 ?auto_30345 )
      ( MAKE-ON-VERIFY ?auto_30344 ?auto_30345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30352 - SURFACE
      ?auto_30353 - SURFACE
    )
    :vars
    (
      ?auto_30359 - HOIST
      ?auto_30355 - PLACE
      ?auto_30358 - PLACE
      ?auto_30357 - HOIST
      ?auto_30356 - SURFACE
      ?auto_30354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30359 ?auto_30355 ) ( SURFACE-AT ?auto_30353 ?auto_30355 ) ( CLEAR ?auto_30353 ) ( IS-CRATE ?auto_30352 ) ( not ( = ?auto_30352 ?auto_30353 ) ) ( AVAILABLE ?auto_30359 ) ( not ( = ?auto_30358 ?auto_30355 ) ) ( HOIST-AT ?auto_30357 ?auto_30358 ) ( not ( = ?auto_30359 ?auto_30357 ) ) ( AVAILABLE ?auto_30357 ) ( SURFACE-AT ?auto_30352 ?auto_30358 ) ( ON ?auto_30352 ?auto_30356 ) ( CLEAR ?auto_30352 ) ( not ( = ?auto_30352 ?auto_30356 ) ) ( not ( = ?auto_30353 ?auto_30356 ) ) ( TRUCK-AT ?auto_30354 ?auto_30355 ) )
    :subtasks
    ( ( !DRIVE ?auto_30354 ?auto_30355 ?auto_30358 )
      ( MAKE-ON ?auto_30352 ?auto_30353 )
      ( MAKE-ON-VERIFY ?auto_30352 ?auto_30353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30360 - SURFACE
      ?auto_30361 - SURFACE
    )
    :vars
    (
      ?auto_30363 - HOIST
      ?auto_30364 - PLACE
      ?auto_30366 - PLACE
      ?auto_30365 - HOIST
      ?auto_30367 - SURFACE
      ?auto_30362 - TRUCK
      ?auto_30368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30363 ?auto_30364 ) ( IS-CRATE ?auto_30360 ) ( not ( = ?auto_30360 ?auto_30361 ) ) ( not ( = ?auto_30366 ?auto_30364 ) ) ( HOIST-AT ?auto_30365 ?auto_30366 ) ( not ( = ?auto_30363 ?auto_30365 ) ) ( AVAILABLE ?auto_30365 ) ( SURFACE-AT ?auto_30360 ?auto_30366 ) ( ON ?auto_30360 ?auto_30367 ) ( CLEAR ?auto_30360 ) ( not ( = ?auto_30360 ?auto_30367 ) ) ( not ( = ?auto_30361 ?auto_30367 ) ) ( TRUCK-AT ?auto_30362 ?auto_30364 ) ( SURFACE-AT ?auto_30368 ?auto_30364 ) ( CLEAR ?auto_30368 ) ( LIFTING ?auto_30363 ?auto_30361 ) ( IS-CRATE ?auto_30361 ) ( not ( = ?auto_30360 ?auto_30368 ) ) ( not ( = ?auto_30361 ?auto_30368 ) ) ( not ( = ?auto_30367 ?auto_30368 ) ) )
    :subtasks
    ( ( !DROP ?auto_30363 ?auto_30361 ?auto_30368 ?auto_30364 )
      ( MAKE-ON ?auto_30360 ?auto_30361 )
      ( MAKE-ON-VERIFY ?auto_30360 ?auto_30361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30369 - SURFACE
      ?auto_30370 - SURFACE
    )
    :vars
    (
      ?auto_30374 - HOIST
      ?auto_30375 - PLACE
      ?auto_30372 - PLACE
      ?auto_30376 - HOIST
      ?auto_30373 - SURFACE
      ?auto_30377 - TRUCK
      ?auto_30371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30374 ?auto_30375 ) ( IS-CRATE ?auto_30369 ) ( not ( = ?auto_30369 ?auto_30370 ) ) ( not ( = ?auto_30372 ?auto_30375 ) ) ( HOIST-AT ?auto_30376 ?auto_30372 ) ( not ( = ?auto_30374 ?auto_30376 ) ) ( AVAILABLE ?auto_30376 ) ( SURFACE-AT ?auto_30369 ?auto_30372 ) ( ON ?auto_30369 ?auto_30373 ) ( CLEAR ?auto_30369 ) ( not ( = ?auto_30369 ?auto_30373 ) ) ( not ( = ?auto_30370 ?auto_30373 ) ) ( TRUCK-AT ?auto_30377 ?auto_30375 ) ( SURFACE-AT ?auto_30371 ?auto_30375 ) ( CLEAR ?auto_30371 ) ( IS-CRATE ?auto_30370 ) ( not ( = ?auto_30369 ?auto_30371 ) ) ( not ( = ?auto_30370 ?auto_30371 ) ) ( not ( = ?auto_30373 ?auto_30371 ) ) ( AVAILABLE ?auto_30374 ) ( IN ?auto_30370 ?auto_30377 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30374 ?auto_30370 ?auto_30377 ?auto_30375 )
      ( MAKE-ON ?auto_30369 ?auto_30370 )
      ( MAKE-ON-VERIFY ?auto_30369 ?auto_30370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30378 - SURFACE
      ?auto_30379 - SURFACE
    )
    :vars
    (
      ?auto_30386 - HOIST
      ?auto_30382 - PLACE
      ?auto_30380 - PLACE
      ?auto_30385 - HOIST
      ?auto_30384 - SURFACE
      ?auto_30381 - SURFACE
      ?auto_30383 - TRUCK
      ?auto_30387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30386 ?auto_30382 ) ( IS-CRATE ?auto_30378 ) ( not ( = ?auto_30378 ?auto_30379 ) ) ( not ( = ?auto_30380 ?auto_30382 ) ) ( HOIST-AT ?auto_30385 ?auto_30380 ) ( not ( = ?auto_30386 ?auto_30385 ) ) ( AVAILABLE ?auto_30385 ) ( SURFACE-AT ?auto_30378 ?auto_30380 ) ( ON ?auto_30378 ?auto_30384 ) ( CLEAR ?auto_30378 ) ( not ( = ?auto_30378 ?auto_30384 ) ) ( not ( = ?auto_30379 ?auto_30384 ) ) ( SURFACE-AT ?auto_30381 ?auto_30382 ) ( CLEAR ?auto_30381 ) ( IS-CRATE ?auto_30379 ) ( not ( = ?auto_30378 ?auto_30381 ) ) ( not ( = ?auto_30379 ?auto_30381 ) ) ( not ( = ?auto_30384 ?auto_30381 ) ) ( AVAILABLE ?auto_30386 ) ( IN ?auto_30379 ?auto_30383 ) ( TRUCK-AT ?auto_30383 ?auto_30387 ) ( not ( = ?auto_30387 ?auto_30382 ) ) ( not ( = ?auto_30380 ?auto_30387 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30383 ?auto_30387 ?auto_30382 )
      ( MAKE-ON ?auto_30378 ?auto_30379 )
      ( MAKE-ON-VERIFY ?auto_30378 ?auto_30379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30388 - SURFACE
      ?auto_30389 - SURFACE
    )
    :vars
    (
      ?auto_30393 - HOIST
      ?auto_30395 - PLACE
      ?auto_30396 - PLACE
      ?auto_30394 - HOIST
      ?auto_30390 - SURFACE
      ?auto_30392 - SURFACE
      ?auto_30397 - TRUCK
      ?auto_30391 - PLACE
      ?auto_30398 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30393 ?auto_30395 ) ( IS-CRATE ?auto_30388 ) ( not ( = ?auto_30388 ?auto_30389 ) ) ( not ( = ?auto_30396 ?auto_30395 ) ) ( HOIST-AT ?auto_30394 ?auto_30396 ) ( not ( = ?auto_30393 ?auto_30394 ) ) ( AVAILABLE ?auto_30394 ) ( SURFACE-AT ?auto_30388 ?auto_30396 ) ( ON ?auto_30388 ?auto_30390 ) ( CLEAR ?auto_30388 ) ( not ( = ?auto_30388 ?auto_30390 ) ) ( not ( = ?auto_30389 ?auto_30390 ) ) ( SURFACE-AT ?auto_30392 ?auto_30395 ) ( CLEAR ?auto_30392 ) ( IS-CRATE ?auto_30389 ) ( not ( = ?auto_30388 ?auto_30392 ) ) ( not ( = ?auto_30389 ?auto_30392 ) ) ( not ( = ?auto_30390 ?auto_30392 ) ) ( AVAILABLE ?auto_30393 ) ( TRUCK-AT ?auto_30397 ?auto_30391 ) ( not ( = ?auto_30391 ?auto_30395 ) ) ( not ( = ?auto_30396 ?auto_30391 ) ) ( HOIST-AT ?auto_30398 ?auto_30391 ) ( LIFTING ?auto_30398 ?auto_30389 ) ( not ( = ?auto_30393 ?auto_30398 ) ) ( not ( = ?auto_30394 ?auto_30398 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30398 ?auto_30389 ?auto_30397 ?auto_30391 )
      ( MAKE-ON ?auto_30388 ?auto_30389 )
      ( MAKE-ON-VERIFY ?auto_30388 ?auto_30389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30399 - SURFACE
      ?auto_30400 - SURFACE
    )
    :vars
    (
      ?auto_30402 - HOIST
      ?auto_30407 - PLACE
      ?auto_30406 - PLACE
      ?auto_30401 - HOIST
      ?auto_30409 - SURFACE
      ?auto_30405 - SURFACE
      ?auto_30408 - TRUCK
      ?auto_30403 - PLACE
      ?auto_30404 - HOIST
      ?auto_30410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30402 ?auto_30407 ) ( IS-CRATE ?auto_30399 ) ( not ( = ?auto_30399 ?auto_30400 ) ) ( not ( = ?auto_30406 ?auto_30407 ) ) ( HOIST-AT ?auto_30401 ?auto_30406 ) ( not ( = ?auto_30402 ?auto_30401 ) ) ( AVAILABLE ?auto_30401 ) ( SURFACE-AT ?auto_30399 ?auto_30406 ) ( ON ?auto_30399 ?auto_30409 ) ( CLEAR ?auto_30399 ) ( not ( = ?auto_30399 ?auto_30409 ) ) ( not ( = ?auto_30400 ?auto_30409 ) ) ( SURFACE-AT ?auto_30405 ?auto_30407 ) ( CLEAR ?auto_30405 ) ( IS-CRATE ?auto_30400 ) ( not ( = ?auto_30399 ?auto_30405 ) ) ( not ( = ?auto_30400 ?auto_30405 ) ) ( not ( = ?auto_30409 ?auto_30405 ) ) ( AVAILABLE ?auto_30402 ) ( TRUCK-AT ?auto_30408 ?auto_30403 ) ( not ( = ?auto_30403 ?auto_30407 ) ) ( not ( = ?auto_30406 ?auto_30403 ) ) ( HOIST-AT ?auto_30404 ?auto_30403 ) ( not ( = ?auto_30402 ?auto_30404 ) ) ( not ( = ?auto_30401 ?auto_30404 ) ) ( AVAILABLE ?auto_30404 ) ( SURFACE-AT ?auto_30400 ?auto_30403 ) ( ON ?auto_30400 ?auto_30410 ) ( CLEAR ?auto_30400 ) ( not ( = ?auto_30399 ?auto_30410 ) ) ( not ( = ?auto_30400 ?auto_30410 ) ) ( not ( = ?auto_30409 ?auto_30410 ) ) ( not ( = ?auto_30405 ?auto_30410 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30404 ?auto_30400 ?auto_30410 ?auto_30403 )
      ( MAKE-ON ?auto_30399 ?auto_30400 )
      ( MAKE-ON-VERIFY ?auto_30399 ?auto_30400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30411 - SURFACE
      ?auto_30412 - SURFACE
    )
    :vars
    (
      ?auto_30421 - HOIST
      ?auto_30418 - PLACE
      ?auto_30417 - PLACE
      ?auto_30419 - HOIST
      ?auto_30413 - SURFACE
      ?auto_30415 - SURFACE
      ?auto_30422 - PLACE
      ?auto_30416 - HOIST
      ?auto_30414 - SURFACE
      ?auto_30420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30421 ?auto_30418 ) ( IS-CRATE ?auto_30411 ) ( not ( = ?auto_30411 ?auto_30412 ) ) ( not ( = ?auto_30417 ?auto_30418 ) ) ( HOIST-AT ?auto_30419 ?auto_30417 ) ( not ( = ?auto_30421 ?auto_30419 ) ) ( AVAILABLE ?auto_30419 ) ( SURFACE-AT ?auto_30411 ?auto_30417 ) ( ON ?auto_30411 ?auto_30413 ) ( CLEAR ?auto_30411 ) ( not ( = ?auto_30411 ?auto_30413 ) ) ( not ( = ?auto_30412 ?auto_30413 ) ) ( SURFACE-AT ?auto_30415 ?auto_30418 ) ( CLEAR ?auto_30415 ) ( IS-CRATE ?auto_30412 ) ( not ( = ?auto_30411 ?auto_30415 ) ) ( not ( = ?auto_30412 ?auto_30415 ) ) ( not ( = ?auto_30413 ?auto_30415 ) ) ( AVAILABLE ?auto_30421 ) ( not ( = ?auto_30422 ?auto_30418 ) ) ( not ( = ?auto_30417 ?auto_30422 ) ) ( HOIST-AT ?auto_30416 ?auto_30422 ) ( not ( = ?auto_30421 ?auto_30416 ) ) ( not ( = ?auto_30419 ?auto_30416 ) ) ( AVAILABLE ?auto_30416 ) ( SURFACE-AT ?auto_30412 ?auto_30422 ) ( ON ?auto_30412 ?auto_30414 ) ( CLEAR ?auto_30412 ) ( not ( = ?auto_30411 ?auto_30414 ) ) ( not ( = ?auto_30412 ?auto_30414 ) ) ( not ( = ?auto_30413 ?auto_30414 ) ) ( not ( = ?auto_30415 ?auto_30414 ) ) ( TRUCK-AT ?auto_30420 ?auto_30418 ) )
    :subtasks
    ( ( !DRIVE ?auto_30420 ?auto_30418 ?auto_30422 )
      ( MAKE-ON ?auto_30411 ?auto_30412 )
      ( MAKE-ON-VERIFY ?auto_30411 ?auto_30412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30423 - SURFACE
      ?auto_30424 - SURFACE
    )
    :vars
    (
      ?auto_30425 - HOIST
      ?auto_30432 - PLACE
      ?auto_30433 - PLACE
      ?auto_30426 - HOIST
      ?auto_30429 - SURFACE
      ?auto_30434 - SURFACE
      ?auto_30428 - PLACE
      ?auto_30431 - HOIST
      ?auto_30427 - SURFACE
      ?auto_30430 - TRUCK
      ?auto_30435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30425 ?auto_30432 ) ( IS-CRATE ?auto_30423 ) ( not ( = ?auto_30423 ?auto_30424 ) ) ( not ( = ?auto_30433 ?auto_30432 ) ) ( HOIST-AT ?auto_30426 ?auto_30433 ) ( not ( = ?auto_30425 ?auto_30426 ) ) ( AVAILABLE ?auto_30426 ) ( SURFACE-AT ?auto_30423 ?auto_30433 ) ( ON ?auto_30423 ?auto_30429 ) ( CLEAR ?auto_30423 ) ( not ( = ?auto_30423 ?auto_30429 ) ) ( not ( = ?auto_30424 ?auto_30429 ) ) ( IS-CRATE ?auto_30424 ) ( not ( = ?auto_30423 ?auto_30434 ) ) ( not ( = ?auto_30424 ?auto_30434 ) ) ( not ( = ?auto_30429 ?auto_30434 ) ) ( not ( = ?auto_30428 ?auto_30432 ) ) ( not ( = ?auto_30433 ?auto_30428 ) ) ( HOIST-AT ?auto_30431 ?auto_30428 ) ( not ( = ?auto_30425 ?auto_30431 ) ) ( not ( = ?auto_30426 ?auto_30431 ) ) ( AVAILABLE ?auto_30431 ) ( SURFACE-AT ?auto_30424 ?auto_30428 ) ( ON ?auto_30424 ?auto_30427 ) ( CLEAR ?auto_30424 ) ( not ( = ?auto_30423 ?auto_30427 ) ) ( not ( = ?auto_30424 ?auto_30427 ) ) ( not ( = ?auto_30429 ?auto_30427 ) ) ( not ( = ?auto_30434 ?auto_30427 ) ) ( TRUCK-AT ?auto_30430 ?auto_30432 ) ( SURFACE-AT ?auto_30435 ?auto_30432 ) ( CLEAR ?auto_30435 ) ( LIFTING ?auto_30425 ?auto_30434 ) ( IS-CRATE ?auto_30434 ) ( not ( = ?auto_30423 ?auto_30435 ) ) ( not ( = ?auto_30424 ?auto_30435 ) ) ( not ( = ?auto_30429 ?auto_30435 ) ) ( not ( = ?auto_30434 ?auto_30435 ) ) ( not ( = ?auto_30427 ?auto_30435 ) ) )
    :subtasks
    ( ( !DROP ?auto_30425 ?auto_30434 ?auto_30435 ?auto_30432 )
      ( MAKE-ON ?auto_30423 ?auto_30424 )
      ( MAKE-ON-VERIFY ?auto_30423 ?auto_30424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30436 - SURFACE
      ?auto_30437 - SURFACE
    )
    :vars
    (
      ?auto_30440 - HOIST
      ?auto_30444 - PLACE
      ?auto_30445 - PLACE
      ?auto_30446 - HOIST
      ?auto_30447 - SURFACE
      ?auto_30439 - SURFACE
      ?auto_30441 - PLACE
      ?auto_30438 - HOIST
      ?auto_30443 - SURFACE
      ?auto_30442 - TRUCK
      ?auto_30448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30440 ?auto_30444 ) ( IS-CRATE ?auto_30436 ) ( not ( = ?auto_30436 ?auto_30437 ) ) ( not ( = ?auto_30445 ?auto_30444 ) ) ( HOIST-AT ?auto_30446 ?auto_30445 ) ( not ( = ?auto_30440 ?auto_30446 ) ) ( AVAILABLE ?auto_30446 ) ( SURFACE-AT ?auto_30436 ?auto_30445 ) ( ON ?auto_30436 ?auto_30447 ) ( CLEAR ?auto_30436 ) ( not ( = ?auto_30436 ?auto_30447 ) ) ( not ( = ?auto_30437 ?auto_30447 ) ) ( IS-CRATE ?auto_30437 ) ( not ( = ?auto_30436 ?auto_30439 ) ) ( not ( = ?auto_30437 ?auto_30439 ) ) ( not ( = ?auto_30447 ?auto_30439 ) ) ( not ( = ?auto_30441 ?auto_30444 ) ) ( not ( = ?auto_30445 ?auto_30441 ) ) ( HOIST-AT ?auto_30438 ?auto_30441 ) ( not ( = ?auto_30440 ?auto_30438 ) ) ( not ( = ?auto_30446 ?auto_30438 ) ) ( AVAILABLE ?auto_30438 ) ( SURFACE-AT ?auto_30437 ?auto_30441 ) ( ON ?auto_30437 ?auto_30443 ) ( CLEAR ?auto_30437 ) ( not ( = ?auto_30436 ?auto_30443 ) ) ( not ( = ?auto_30437 ?auto_30443 ) ) ( not ( = ?auto_30447 ?auto_30443 ) ) ( not ( = ?auto_30439 ?auto_30443 ) ) ( TRUCK-AT ?auto_30442 ?auto_30444 ) ( SURFACE-AT ?auto_30448 ?auto_30444 ) ( CLEAR ?auto_30448 ) ( IS-CRATE ?auto_30439 ) ( not ( = ?auto_30436 ?auto_30448 ) ) ( not ( = ?auto_30437 ?auto_30448 ) ) ( not ( = ?auto_30447 ?auto_30448 ) ) ( not ( = ?auto_30439 ?auto_30448 ) ) ( not ( = ?auto_30443 ?auto_30448 ) ) ( AVAILABLE ?auto_30440 ) ( IN ?auto_30439 ?auto_30442 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30440 ?auto_30439 ?auto_30442 ?auto_30444 )
      ( MAKE-ON ?auto_30436 ?auto_30437 )
      ( MAKE-ON-VERIFY ?auto_30436 ?auto_30437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30449 - SURFACE
      ?auto_30450 - SURFACE
    )
    :vars
    (
      ?auto_30456 - HOIST
      ?auto_30458 - PLACE
      ?auto_30451 - PLACE
      ?auto_30461 - HOIST
      ?auto_30459 - SURFACE
      ?auto_30460 - SURFACE
      ?auto_30455 - PLACE
      ?auto_30454 - HOIST
      ?auto_30453 - SURFACE
      ?auto_30457 - SURFACE
      ?auto_30452 - TRUCK
      ?auto_30462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30456 ?auto_30458 ) ( IS-CRATE ?auto_30449 ) ( not ( = ?auto_30449 ?auto_30450 ) ) ( not ( = ?auto_30451 ?auto_30458 ) ) ( HOIST-AT ?auto_30461 ?auto_30451 ) ( not ( = ?auto_30456 ?auto_30461 ) ) ( AVAILABLE ?auto_30461 ) ( SURFACE-AT ?auto_30449 ?auto_30451 ) ( ON ?auto_30449 ?auto_30459 ) ( CLEAR ?auto_30449 ) ( not ( = ?auto_30449 ?auto_30459 ) ) ( not ( = ?auto_30450 ?auto_30459 ) ) ( IS-CRATE ?auto_30450 ) ( not ( = ?auto_30449 ?auto_30460 ) ) ( not ( = ?auto_30450 ?auto_30460 ) ) ( not ( = ?auto_30459 ?auto_30460 ) ) ( not ( = ?auto_30455 ?auto_30458 ) ) ( not ( = ?auto_30451 ?auto_30455 ) ) ( HOIST-AT ?auto_30454 ?auto_30455 ) ( not ( = ?auto_30456 ?auto_30454 ) ) ( not ( = ?auto_30461 ?auto_30454 ) ) ( AVAILABLE ?auto_30454 ) ( SURFACE-AT ?auto_30450 ?auto_30455 ) ( ON ?auto_30450 ?auto_30453 ) ( CLEAR ?auto_30450 ) ( not ( = ?auto_30449 ?auto_30453 ) ) ( not ( = ?auto_30450 ?auto_30453 ) ) ( not ( = ?auto_30459 ?auto_30453 ) ) ( not ( = ?auto_30460 ?auto_30453 ) ) ( SURFACE-AT ?auto_30457 ?auto_30458 ) ( CLEAR ?auto_30457 ) ( IS-CRATE ?auto_30460 ) ( not ( = ?auto_30449 ?auto_30457 ) ) ( not ( = ?auto_30450 ?auto_30457 ) ) ( not ( = ?auto_30459 ?auto_30457 ) ) ( not ( = ?auto_30460 ?auto_30457 ) ) ( not ( = ?auto_30453 ?auto_30457 ) ) ( AVAILABLE ?auto_30456 ) ( IN ?auto_30460 ?auto_30452 ) ( TRUCK-AT ?auto_30452 ?auto_30462 ) ( not ( = ?auto_30462 ?auto_30458 ) ) ( not ( = ?auto_30451 ?auto_30462 ) ) ( not ( = ?auto_30455 ?auto_30462 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30452 ?auto_30462 ?auto_30458 )
      ( MAKE-ON ?auto_30449 ?auto_30450 )
      ( MAKE-ON-VERIFY ?auto_30449 ?auto_30450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30463 - SURFACE
      ?auto_30464 - SURFACE
    )
    :vars
    (
      ?auto_30473 - HOIST
      ?auto_30465 - PLACE
      ?auto_30467 - PLACE
      ?auto_30475 - HOIST
      ?auto_30470 - SURFACE
      ?auto_30466 - SURFACE
      ?auto_30476 - PLACE
      ?auto_30468 - HOIST
      ?auto_30472 - SURFACE
      ?auto_30471 - SURFACE
      ?auto_30469 - TRUCK
      ?auto_30474 - PLACE
      ?auto_30477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30473 ?auto_30465 ) ( IS-CRATE ?auto_30463 ) ( not ( = ?auto_30463 ?auto_30464 ) ) ( not ( = ?auto_30467 ?auto_30465 ) ) ( HOIST-AT ?auto_30475 ?auto_30467 ) ( not ( = ?auto_30473 ?auto_30475 ) ) ( AVAILABLE ?auto_30475 ) ( SURFACE-AT ?auto_30463 ?auto_30467 ) ( ON ?auto_30463 ?auto_30470 ) ( CLEAR ?auto_30463 ) ( not ( = ?auto_30463 ?auto_30470 ) ) ( not ( = ?auto_30464 ?auto_30470 ) ) ( IS-CRATE ?auto_30464 ) ( not ( = ?auto_30463 ?auto_30466 ) ) ( not ( = ?auto_30464 ?auto_30466 ) ) ( not ( = ?auto_30470 ?auto_30466 ) ) ( not ( = ?auto_30476 ?auto_30465 ) ) ( not ( = ?auto_30467 ?auto_30476 ) ) ( HOIST-AT ?auto_30468 ?auto_30476 ) ( not ( = ?auto_30473 ?auto_30468 ) ) ( not ( = ?auto_30475 ?auto_30468 ) ) ( AVAILABLE ?auto_30468 ) ( SURFACE-AT ?auto_30464 ?auto_30476 ) ( ON ?auto_30464 ?auto_30472 ) ( CLEAR ?auto_30464 ) ( not ( = ?auto_30463 ?auto_30472 ) ) ( not ( = ?auto_30464 ?auto_30472 ) ) ( not ( = ?auto_30470 ?auto_30472 ) ) ( not ( = ?auto_30466 ?auto_30472 ) ) ( SURFACE-AT ?auto_30471 ?auto_30465 ) ( CLEAR ?auto_30471 ) ( IS-CRATE ?auto_30466 ) ( not ( = ?auto_30463 ?auto_30471 ) ) ( not ( = ?auto_30464 ?auto_30471 ) ) ( not ( = ?auto_30470 ?auto_30471 ) ) ( not ( = ?auto_30466 ?auto_30471 ) ) ( not ( = ?auto_30472 ?auto_30471 ) ) ( AVAILABLE ?auto_30473 ) ( TRUCK-AT ?auto_30469 ?auto_30474 ) ( not ( = ?auto_30474 ?auto_30465 ) ) ( not ( = ?auto_30467 ?auto_30474 ) ) ( not ( = ?auto_30476 ?auto_30474 ) ) ( HOIST-AT ?auto_30477 ?auto_30474 ) ( LIFTING ?auto_30477 ?auto_30466 ) ( not ( = ?auto_30473 ?auto_30477 ) ) ( not ( = ?auto_30475 ?auto_30477 ) ) ( not ( = ?auto_30468 ?auto_30477 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30477 ?auto_30466 ?auto_30469 ?auto_30474 )
      ( MAKE-ON ?auto_30463 ?auto_30464 )
      ( MAKE-ON-VERIFY ?auto_30463 ?auto_30464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30478 - SURFACE
      ?auto_30479 - SURFACE
    )
    :vars
    (
      ?auto_30480 - HOIST
      ?auto_30492 - PLACE
      ?auto_30491 - PLACE
      ?auto_30484 - HOIST
      ?auto_30489 - SURFACE
      ?auto_30483 - SURFACE
      ?auto_30481 - PLACE
      ?auto_30485 - HOIST
      ?auto_30487 - SURFACE
      ?auto_30486 - SURFACE
      ?auto_30482 - TRUCK
      ?auto_30490 - PLACE
      ?auto_30488 - HOIST
      ?auto_30493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30480 ?auto_30492 ) ( IS-CRATE ?auto_30478 ) ( not ( = ?auto_30478 ?auto_30479 ) ) ( not ( = ?auto_30491 ?auto_30492 ) ) ( HOIST-AT ?auto_30484 ?auto_30491 ) ( not ( = ?auto_30480 ?auto_30484 ) ) ( AVAILABLE ?auto_30484 ) ( SURFACE-AT ?auto_30478 ?auto_30491 ) ( ON ?auto_30478 ?auto_30489 ) ( CLEAR ?auto_30478 ) ( not ( = ?auto_30478 ?auto_30489 ) ) ( not ( = ?auto_30479 ?auto_30489 ) ) ( IS-CRATE ?auto_30479 ) ( not ( = ?auto_30478 ?auto_30483 ) ) ( not ( = ?auto_30479 ?auto_30483 ) ) ( not ( = ?auto_30489 ?auto_30483 ) ) ( not ( = ?auto_30481 ?auto_30492 ) ) ( not ( = ?auto_30491 ?auto_30481 ) ) ( HOIST-AT ?auto_30485 ?auto_30481 ) ( not ( = ?auto_30480 ?auto_30485 ) ) ( not ( = ?auto_30484 ?auto_30485 ) ) ( AVAILABLE ?auto_30485 ) ( SURFACE-AT ?auto_30479 ?auto_30481 ) ( ON ?auto_30479 ?auto_30487 ) ( CLEAR ?auto_30479 ) ( not ( = ?auto_30478 ?auto_30487 ) ) ( not ( = ?auto_30479 ?auto_30487 ) ) ( not ( = ?auto_30489 ?auto_30487 ) ) ( not ( = ?auto_30483 ?auto_30487 ) ) ( SURFACE-AT ?auto_30486 ?auto_30492 ) ( CLEAR ?auto_30486 ) ( IS-CRATE ?auto_30483 ) ( not ( = ?auto_30478 ?auto_30486 ) ) ( not ( = ?auto_30479 ?auto_30486 ) ) ( not ( = ?auto_30489 ?auto_30486 ) ) ( not ( = ?auto_30483 ?auto_30486 ) ) ( not ( = ?auto_30487 ?auto_30486 ) ) ( AVAILABLE ?auto_30480 ) ( TRUCK-AT ?auto_30482 ?auto_30490 ) ( not ( = ?auto_30490 ?auto_30492 ) ) ( not ( = ?auto_30491 ?auto_30490 ) ) ( not ( = ?auto_30481 ?auto_30490 ) ) ( HOIST-AT ?auto_30488 ?auto_30490 ) ( not ( = ?auto_30480 ?auto_30488 ) ) ( not ( = ?auto_30484 ?auto_30488 ) ) ( not ( = ?auto_30485 ?auto_30488 ) ) ( AVAILABLE ?auto_30488 ) ( SURFACE-AT ?auto_30483 ?auto_30490 ) ( ON ?auto_30483 ?auto_30493 ) ( CLEAR ?auto_30483 ) ( not ( = ?auto_30478 ?auto_30493 ) ) ( not ( = ?auto_30479 ?auto_30493 ) ) ( not ( = ?auto_30489 ?auto_30493 ) ) ( not ( = ?auto_30483 ?auto_30493 ) ) ( not ( = ?auto_30487 ?auto_30493 ) ) ( not ( = ?auto_30486 ?auto_30493 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30488 ?auto_30483 ?auto_30493 ?auto_30490 )
      ( MAKE-ON ?auto_30478 ?auto_30479 )
      ( MAKE-ON-VERIFY ?auto_30478 ?auto_30479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30494 - SURFACE
      ?auto_30495 - SURFACE
    )
    :vars
    (
      ?auto_30509 - HOIST
      ?auto_30496 - PLACE
      ?auto_30507 - PLACE
      ?auto_30503 - HOIST
      ?auto_30505 - SURFACE
      ?auto_30501 - SURFACE
      ?auto_30499 - PLACE
      ?auto_30504 - HOIST
      ?auto_30498 - SURFACE
      ?auto_30497 - SURFACE
      ?auto_30502 - PLACE
      ?auto_30508 - HOIST
      ?auto_30500 - SURFACE
      ?auto_30506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30509 ?auto_30496 ) ( IS-CRATE ?auto_30494 ) ( not ( = ?auto_30494 ?auto_30495 ) ) ( not ( = ?auto_30507 ?auto_30496 ) ) ( HOIST-AT ?auto_30503 ?auto_30507 ) ( not ( = ?auto_30509 ?auto_30503 ) ) ( AVAILABLE ?auto_30503 ) ( SURFACE-AT ?auto_30494 ?auto_30507 ) ( ON ?auto_30494 ?auto_30505 ) ( CLEAR ?auto_30494 ) ( not ( = ?auto_30494 ?auto_30505 ) ) ( not ( = ?auto_30495 ?auto_30505 ) ) ( IS-CRATE ?auto_30495 ) ( not ( = ?auto_30494 ?auto_30501 ) ) ( not ( = ?auto_30495 ?auto_30501 ) ) ( not ( = ?auto_30505 ?auto_30501 ) ) ( not ( = ?auto_30499 ?auto_30496 ) ) ( not ( = ?auto_30507 ?auto_30499 ) ) ( HOIST-AT ?auto_30504 ?auto_30499 ) ( not ( = ?auto_30509 ?auto_30504 ) ) ( not ( = ?auto_30503 ?auto_30504 ) ) ( AVAILABLE ?auto_30504 ) ( SURFACE-AT ?auto_30495 ?auto_30499 ) ( ON ?auto_30495 ?auto_30498 ) ( CLEAR ?auto_30495 ) ( not ( = ?auto_30494 ?auto_30498 ) ) ( not ( = ?auto_30495 ?auto_30498 ) ) ( not ( = ?auto_30505 ?auto_30498 ) ) ( not ( = ?auto_30501 ?auto_30498 ) ) ( SURFACE-AT ?auto_30497 ?auto_30496 ) ( CLEAR ?auto_30497 ) ( IS-CRATE ?auto_30501 ) ( not ( = ?auto_30494 ?auto_30497 ) ) ( not ( = ?auto_30495 ?auto_30497 ) ) ( not ( = ?auto_30505 ?auto_30497 ) ) ( not ( = ?auto_30501 ?auto_30497 ) ) ( not ( = ?auto_30498 ?auto_30497 ) ) ( AVAILABLE ?auto_30509 ) ( not ( = ?auto_30502 ?auto_30496 ) ) ( not ( = ?auto_30507 ?auto_30502 ) ) ( not ( = ?auto_30499 ?auto_30502 ) ) ( HOIST-AT ?auto_30508 ?auto_30502 ) ( not ( = ?auto_30509 ?auto_30508 ) ) ( not ( = ?auto_30503 ?auto_30508 ) ) ( not ( = ?auto_30504 ?auto_30508 ) ) ( AVAILABLE ?auto_30508 ) ( SURFACE-AT ?auto_30501 ?auto_30502 ) ( ON ?auto_30501 ?auto_30500 ) ( CLEAR ?auto_30501 ) ( not ( = ?auto_30494 ?auto_30500 ) ) ( not ( = ?auto_30495 ?auto_30500 ) ) ( not ( = ?auto_30505 ?auto_30500 ) ) ( not ( = ?auto_30501 ?auto_30500 ) ) ( not ( = ?auto_30498 ?auto_30500 ) ) ( not ( = ?auto_30497 ?auto_30500 ) ) ( TRUCK-AT ?auto_30506 ?auto_30496 ) )
    :subtasks
    ( ( !DRIVE ?auto_30506 ?auto_30496 ?auto_30502 )
      ( MAKE-ON ?auto_30494 ?auto_30495 )
      ( MAKE-ON-VERIFY ?auto_30494 ?auto_30495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30510 - SURFACE
      ?auto_30511 - SURFACE
    )
    :vars
    (
      ?auto_30521 - HOIST
      ?auto_30523 - PLACE
      ?auto_30517 - PLACE
      ?auto_30518 - HOIST
      ?auto_30513 - SURFACE
      ?auto_30514 - SURFACE
      ?auto_30516 - PLACE
      ?auto_30515 - HOIST
      ?auto_30519 - SURFACE
      ?auto_30525 - SURFACE
      ?auto_30520 - PLACE
      ?auto_30524 - HOIST
      ?auto_30512 - SURFACE
      ?auto_30522 - TRUCK
      ?auto_30526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30521 ?auto_30523 ) ( IS-CRATE ?auto_30510 ) ( not ( = ?auto_30510 ?auto_30511 ) ) ( not ( = ?auto_30517 ?auto_30523 ) ) ( HOIST-AT ?auto_30518 ?auto_30517 ) ( not ( = ?auto_30521 ?auto_30518 ) ) ( AVAILABLE ?auto_30518 ) ( SURFACE-AT ?auto_30510 ?auto_30517 ) ( ON ?auto_30510 ?auto_30513 ) ( CLEAR ?auto_30510 ) ( not ( = ?auto_30510 ?auto_30513 ) ) ( not ( = ?auto_30511 ?auto_30513 ) ) ( IS-CRATE ?auto_30511 ) ( not ( = ?auto_30510 ?auto_30514 ) ) ( not ( = ?auto_30511 ?auto_30514 ) ) ( not ( = ?auto_30513 ?auto_30514 ) ) ( not ( = ?auto_30516 ?auto_30523 ) ) ( not ( = ?auto_30517 ?auto_30516 ) ) ( HOIST-AT ?auto_30515 ?auto_30516 ) ( not ( = ?auto_30521 ?auto_30515 ) ) ( not ( = ?auto_30518 ?auto_30515 ) ) ( AVAILABLE ?auto_30515 ) ( SURFACE-AT ?auto_30511 ?auto_30516 ) ( ON ?auto_30511 ?auto_30519 ) ( CLEAR ?auto_30511 ) ( not ( = ?auto_30510 ?auto_30519 ) ) ( not ( = ?auto_30511 ?auto_30519 ) ) ( not ( = ?auto_30513 ?auto_30519 ) ) ( not ( = ?auto_30514 ?auto_30519 ) ) ( IS-CRATE ?auto_30514 ) ( not ( = ?auto_30510 ?auto_30525 ) ) ( not ( = ?auto_30511 ?auto_30525 ) ) ( not ( = ?auto_30513 ?auto_30525 ) ) ( not ( = ?auto_30514 ?auto_30525 ) ) ( not ( = ?auto_30519 ?auto_30525 ) ) ( not ( = ?auto_30520 ?auto_30523 ) ) ( not ( = ?auto_30517 ?auto_30520 ) ) ( not ( = ?auto_30516 ?auto_30520 ) ) ( HOIST-AT ?auto_30524 ?auto_30520 ) ( not ( = ?auto_30521 ?auto_30524 ) ) ( not ( = ?auto_30518 ?auto_30524 ) ) ( not ( = ?auto_30515 ?auto_30524 ) ) ( AVAILABLE ?auto_30524 ) ( SURFACE-AT ?auto_30514 ?auto_30520 ) ( ON ?auto_30514 ?auto_30512 ) ( CLEAR ?auto_30514 ) ( not ( = ?auto_30510 ?auto_30512 ) ) ( not ( = ?auto_30511 ?auto_30512 ) ) ( not ( = ?auto_30513 ?auto_30512 ) ) ( not ( = ?auto_30514 ?auto_30512 ) ) ( not ( = ?auto_30519 ?auto_30512 ) ) ( not ( = ?auto_30525 ?auto_30512 ) ) ( TRUCK-AT ?auto_30522 ?auto_30523 ) ( SURFACE-AT ?auto_30526 ?auto_30523 ) ( CLEAR ?auto_30526 ) ( LIFTING ?auto_30521 ?auto_30525 ) ( IS-CRATE ?auto_30525 ) ( not ( = ?auto_30510 ?auto_30526 ) ) ( not ( = ?auto_30511 ?auto_30526 ) ) ( not ( = ?auto_30513 ?auto_30526 ) ) ( not ( = ?auto_30514 ?auto_30526 ) ) ( not ( = ?auto_30519 ?auto_30526 ) ) ( not ( = ?auto_30525 ?auto_30526 ) ) ( not ( = ?auto_30512 ?auto_30526 ) ) )
    :subtasks
    ( ( !DROP ?auto_30521 ?auto_30525 ?auto_30526 ?auto_30523 )
      ( MAKE-ON ?auto_30510 ?auto_30511 )
      ( MAKE-ON-VERIFY ?auto_30510 ?auto_30511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30527 - SURFACE
      ?auto_30528 - SURFACE
    )
    :vars
    (
      ?auto_30533 - HOIST
      ?auto_30534 - PLACE
      ?auto_30539 - PLACE
      ?auto_30542 - HOIST
      ?auto_30541 - SURFACE
      ?auto_30531 - SURFACE
      ?auto_30543 - PLACE
      ?auto_30536 - HOIST
      ?auto_30538 - SURFACE
      ?auto_30540 - SURFACE
      ?auto_30535 - PLACE
      ?auto_30530 - HOIST
      ?auto_30532 - SURFACE
      ?auto_30537 - TRUCK
      ?auto_30529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30533 ?auto_30534 ) ( IS-CRATE ?auto_30527 ) ( not ( = ?auto_30527 ?auto_30528 ) ) ( not ( = ?auto_30539 ?auto_30534 ) ) ( HOIST-AT ?auto_30542 ?auto_30539 ) ( not ( = ?auto_30533 ?auto_30542 ) ) ( AVAILABLE ?auto_30542 ) ( SURFACE-AT ?auto_30527 ?auto_30539 ) ( ON ?auto_30527 ?auto_30541 ) ( CLEAR ?auto_30527 ) ( not ( = ?auto_30527 ?auto_30541 ) ) ( not ( = ?auto_30528 ?auto_30541 ) ) ( IS-CRATE ?auto_30528 ) ( not ( = ?auto_30527 ?auto_30531 ) ) ( not ( = ?auto_30528 ?auto_30531 ) ) ( not ( = ?auto_30541 ?auto_30531 ) ) ( not ( = ?auto_30543 ?auto_30534 ) ) ( not ( = ?auto_30539 ?auto_30543 ) ) ( HOIST-AT ?auto_30536 ?auto_30543 ) ( not ( = ?auto_30533 ?auto_30536 ) ) ( not ( = ?auto_30542 ?auto_30536 ) ) ( AVAILABLE ?auto_30536 ) ( SURFACE-AT ?auto_30528 ?auto_30543 ) ( ON ?auto_30528 ?auto_30538 ) ( CLEAR ?auto_30528 ) ( not ( = ?auto_30527 ?auto_30538 ) ) ( not ( = ?auto_30528 ?auto_30538 ) ) ( not ( = ?auto_30541 ?auto_30538 ) ) ( not ( = ?auto_30531 ?auto_30538 ) ) ( IS-CRATE ?auto_30531 ) ( not ( = ?auto_30527 ?auto_30540 ) ) ( not ( = ?auto_30528 ?auto_30540 ) ) ( not ( = ?auto_30541 ?auto_30540 ) ) ( not ( = ?auto_30531 ?auto_30540 ) ) ( not ( = ?auto_30538 ?auto_30540 ) ) ( not ( = ?auto_30535 ?auto_30534 ) ) ( not ( = ?auto_30539 ?auto_30535 ) ) ( not ( = ?auto_30543 ?auto_30535 ) ) ( HOIST-AT ?auto_30530 ?auto_30535 ) ( not ( = ?auto_30533 ?auto_30530 ) ) ( not ( = ?auto_30542 ?auto_30530 ) ) ( not ( = ?auto_30536 ?auto_30530 ) ) ( AVAILABLE ?auto_30530 ) ( SURFACE-AT ?auto_30531 ?auto_30535 ) ( ON ?auto_30531 ?auto_30532 ) ( CLEAR ?auto_30531 ) ( not ( = ?auto_30527 ?auto_30532 ) ) ( not ( = ?auto_30528 ?auto_30532 ) ) ( not ( = ?auto_30541 ?auto_30532 ) ) ( not ( = ?auto_30531 ?auto_30532 ) ) ( not ( = ?auto_30538 ?auto_30532 ) ) ( not ( = ?auto_30540 ?auto_30532 ) ) ( TRUCK-AT ?auto_30537 ?auto_30534 ) ( SURFACE-AT ?auto_30529 ?auto_30534 ) ( CLEAR ?auto_30529 ) ( IS-CRATE ?auto_30540 ) ( not ( = ?auto_30527 ?auto_30529 ) ) ( not ( = ?auto_30528 ?auto_30529 ) ) ( not ( = ?auto_30541 ?auto_30529 ) ) ( not ( = ?auto_30531 ?auto_30529 ) ) ( not ( = ?auto_30538 ?auto_30529 ) ) ( not ( = ?auto_30540 ?auto_30529 ) ) ( not ( = ?auto_30532 ?auto_30529 ) ) ( AVAILABLE ?auto_30533 ) ( IN ?auto_30540 ?auto_30537 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30533 ?auto_30540 ?auto_30537 ?auto_30534 )
      ( MAKE-ON ?auto_30527 ?auto_30528 )
      ( MAKE-ON-VERIFY ?auto_30527 ?auto_30528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30544 - SURFACE
      ?auto_30545 - SURFACE
    )
    :vars
    (
      ?auto_30555 - HOIST
      ?auto_30547 - PLACE
      ?auto_30548 - PLACE
      ?auto_30553 - HOIST
      ?auto_30552 - SURFACE
      ?auto_30546 - SURFACE
      ?auto_30558 - PLACE
      ?auto_30556 - HOIST
      ?auto_30549 - SURFACE
      ?auto_30557 - SURFACE
      ?auto_30550 - PLACE
      ?auto_30554 - HOIST
      ?auto_30560 - SURFACE
      ?auto_30559 - SURFACE
      ?auto_30551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30555 ?auto_30547 ) ( IS-CRATE ?auto_30544 ) ( not ( = ?auto_30544 ?auto_30545 ) ) ( not ( = ?auto_30548 ?auto_30547 ) ) ( HOIST-AT ?auto_30553 ?auto_30548 ) ( not ( = ?auto_30555 ?auto_30553 ) ) ( AVAILABLE ?auto_30553 ) ( SURFACE-AT ?auto_30544 ?auto_30548 ) ( ON ?auto_30544 ?auto_30552 ) ( CLEAR ?auto_30544 ) ( not ( = ?auto_30544 ?auto_30552 ) ) ( not ( = ?auto_30545 ?auto_30552 ) ) ( IS-CRATE ?auto_30545 ) ( not ( = ?auto_30544 ?auto_30546 ) ) ( not ( = ?auto_30545 ?auto_30546 ) ) ( not ( = ?auto_30552 ?auto_30546 ) ) ( not ( = ?auto_30558 ?auto_30547 ) ) ( not ( = ?auto_30548 ?auto_30558 ) ) ( HOIST-AT ?auto_30556 ?auto_30558 ) ( not ( = ?auto_30555 ?auto_30556 ) ) ( not ( = ?auto_30553 ?auto_30556 ) ) ( AVAILABLE ?auto_30556 ) ( SURFACE-AT ?auto_30545 ?auto_30558 ) ( ON ?auto_30545 ?auto_30549 ) ( CLEAR ?auto_30545 ) ( not ( = ?auto_30544 ?auto_30549 ) ) ( not ( = ?auto_30545 ?auto_30549 ) ) ( not ( = ?auto_30552 ?auto_30549 ) ) ( not ( = ?auto_30546 ?auto_30549 ) ) ( IS-CRATE ?auto_30546 ) ( not ( = ?auto_30544 ?auto_30557 ) ) ( not ( = ?auto_30545 ?auto_30557 ) ) ( not ( = ?auto_30552 ?auto_30557 ) ) ( not ( = ?auto_30546 ?auto_30557 ) ) ( not ( = ?auto_30549 ?auto_30557 ) ) ( not ( = ?auto_30550 ?auto_30547 ) ) ( not ( = ?auto_30548 ?auto_30550 ) ) ( not ( = ?auto_30558 ?auto_30550 ) ) ( HOIST-AT ?auto_30554 ?auto_30550 ) ( not ( = ?auto_30555 ?auto_30554 ) ) ( not ( = ?auto_30553 ?auto_30554 ) ) ( not ( = ?auto_30556 ?auto_30554 ) ) ( AVAILABLE ?auto_30554 ) ( SURFACE-AT ?auto_30546 ?auto_30550 ) ( ON ?auto_30546 ?auto_30560 ) ( CLEAR ?auto_30546 ) ( not ( = ?auto_30544 ?auto_30560 ) ) ( not ( = ?auto_30545 ?auto_30560 ) ) ( not ( = ?auto_30552 ?auto_30560 ) ) ( not ( = ?auto_30546 ?auto_30560 ) ) ( not ( = ?auto_30549 ?auto_30560 ) ) ( not ( = ?auto_30557 ?auto_30560 ) ) ( SURFACE-AT ?auto_30559 ?auto_30547 ) ( CLEAR ?auto_30559 ) ( IS-CRATE ?auto_30557 ) ( not ( = ?auto_30544 ?auto_30559 ) ) ( not ( = ?auto_30545 ?auto_30559 ) ) ( not ( = ?auto_30552 ?auto_30559 ) ) ( not ( = ?auto_30546 ?auto_30559 ) ) ( not ( = ?auto_30549 ?auto_30559 ) ) ( not ( = ?auto_30557 ?auto_30559 ) ) ( not ( = ?auto_30560 ?auto_30559 ) ) ( AVAILABLE ?auto_30555 ) ( IN ?auto_30557 ?auto_30551 ) ( TRUCK-AT ?auto_30551 ?auto_30558 ) )
    :subtasks
    ( ( !DRIVE ?auto_30551 ?auto_30558 ?auto_30547 )
      ( MAKE-ON ?auto_30544 ?auto_30545 )
      ( MAKE-ON-VERIFY ?auto_30544 ?auto_30545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30561 - SURFACE
      ?auto_30562 - SURFACE
    )
    :vars
    (
      ?auto_30570 - HOIST
      ?auto_30572 - PLACE
      ?auto_30573 - PLACE
      ?auto_30576 - HOIST
      ?auto_30577 - SURFACE
      ?auto_30566 - SURFACE
      ?auto_30568 - PLACE
      ?auto_30563 - HOIST
      ?auto_30564 - SURFACE
      ?auto_30565 - SURFACE
      ?auto_30569 - PLACE
      ?auto_30567 - HOIST
      ?auto_30574 - SURFACE
      ?auto_30575 - SURFACE
      ?auto_30571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30570 ?auto_30572 ) ( IS-CRATE ?auto_30561 ) ( not ( = ?auto_30561 ?auto_30562 ) ) ( not ( = ?auto_30573 ?auto_30572 ) ) ( HOIST-AT ?auto_30576 ?auto_30573 ) ( not ( = ?auto_30570 ?auto_30576 ) ) ( AVAILABLE ?auto_30576 ) ( SURFACE-AT ?auto_30561 ?auto_30573 ) ( ON ?auto_30561 ?auto_30577 ) ( CLEAR ?auto_30561 ) ( not ( = ?auto_30561 ?auto_30577 ) ) ( not ( = ?auto_30562 ?auto_30577 ) ) ( IS-CRATE ?auto_30562 ) ( not ( = ?auto_30561 ?auto_30566 ) ) ( not ( = ?auto_30562 ?auto_30566 ) ) ( not ( = ?auto_30577 ?auto_30566 ) ) ( not ( = ?auto_30568 ?auto_30572 ) ) ( not ( = ?auto_30573 ?auto_30568 ) ) ( HOIST-AT ?auto_30563 ?auto_30568 ) ( not ( = ?auto_30570 ?auto_30563 ) ) ( not ( = ?auto_30576 ?auto_30563 ) ) ( SURFACE-AT ?auto_30562 ?auto_30568 ) ( ON ?auto_30562 ?auto_30564 ) ( CLEAR ?auto_30562 ) ( not ( = ?auto_30561 ?auto_30564 ) ) ( not ( = ?auto_30562 ?auto_30564 ) ) ( not ( = ?auto_30577 ?auto_30564 ) ) ( not ( = ?auto_30566 ?auto_30564 ) ) ( IS-CRATE ?auto_30566 ) ( not ( = ?auto_30561 ?auto_30565 ) ) ( not ( = ?auto_30562 ?auto_30565 ) ) ( not ( = ?auto_30577 ?auto_30565 ) ) ( not ( = ?auto_30566 ?auto_30565 ) ) ( not ( = ?auto_30564 ?auto_30565 ) ) ( not ( = ?auto_30569 ?auto_30572 ) ) ( not ( = ?auto_30573 ?auto_30569 ) ) ( not ( = ?auto_30568 ?auto_30569 ) ) ( HOIST-AT ?auto_30567 ?auto_30569 ) ( not ( = ?auto_30570 ?auto_30567 ) ) ( not ( = ?auto_30576 ?auto_30567 ) ) ( not ( = ?auto_30563 ?auto_30567 ) ) ( AVAILABLE ?auto_30567 ) ( SURFACE-AT ?auto_30566 ?auto_30569 ) ( ON ?auto_30566 ?auto_30574 ) ( CLEAR ?auto_30566 ) ( not ( = ?auto_30561 ?auto_30574 ) ) ( not ( = ?auto_30562 ?auto_30574 ) ) ( not ( = ?auto_30577 ?auto_30574 ) ) ( not ( = ?auto_30566 ?auto_30574 ) ) ( not ( = ?auto_30564 ?auto_30574 ) ) ( not ( = ?auto_30565 ?auto_30574 ) ) ( SURFACE-AT ?auto_30575 ?auto_30572 ) ( CLEAR ?auto_30575 ) ( IS-CRATE ?auto_30565 ) ( not ( = ?auto_30561 ?auto_30575 ) ) ( not ( = ?auto_30562 ?auto_30575 ) ) ( not ( = ?auto_30577 ?auto_30575 ) ) ( not ( = ?auto_30566 ?auto_30575 ) ) ( not ( = ?auto_30564 ?auto_30575 ) ) ( not ( = ?auto_30565 ?auto_30575 ) ) ( not ( = ?auto_30574 ?auto_30575 ) ) ( AVAILABLE ?auto_30570 ) ( TRUCK-AT ?auto_30571 ?auto_30568 ) ( LIFTING ?auto_30563 ?auto_30565 ) )
    :subtasks
    ( ( !LOAD ?auto_30563 ?auto_30565 ?auto_30571 ?auto_30568 )
      ( MAKE-ON ?auto_30561 ?auto_30562 )
      ( MAKE-ON-VERIFY ?auto_30561 ?auto_30562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30578 - SURFACE
      ?auto_30579 - SURFACE
    )
    :vars
    (
      ?auto_30588 - HOIST
      ?auto_30585 - PLACE
      ?auto_30592 - PLACE
      ?auto_30594 - HOIST
      ?auto_30586 - SURFACE
      ?auto_30581 - SURFACE
      ?auto_30591 - PLACE
      ?auto_30593 - HOIST
      ?auto_30589 - SURFACE
      ?auto_30590 - SURFACE
      ?auto_30580 - PLACE
      ?auto_30582 - HOIST
      ?auto_30583 - SURFACE
      ?auto_30584 - SURFACE
      ?auto_30587 - TRUCK
      ?auto_30595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30588 ?auto_30585 ) ( IS-CRATE ?auto_30578 ) ( not ( = ?auto_30578 ?auto_30579 ) ) ( not ( = ?auto_30592 ?auto_30585 ) ) ( HOIST-AT ?auto_30594 ?auto_30592 ) ( not ( = ?auto_30588 ?auto_30594 ) ) ( AVAILABLE ?auto_30594 ) ( SURFACE-AT ?auto_30578 ?auto_30592 ) ( ON ?auto_30578 ?auto_30586 ) ( CLEAR ?auto_30578 ) ( not ( = ?auto_30578 ?auto_30586 ) ) ( not ( = ?auto_30579 ?auto_30586 ) ) ( IS-CRATE ?auto_30579 ) ( not ( = ?auto_30578 ?auto_30581 ) ) ( not ( = ?auto_30579 ?auto_30581 ) ) ( not ( = ?auto_30586 ?auto_30581 ) ) ( not ( = ?auto_30591 ?auto_30585 ) ) ( not ( = ?auto_30592 ?auto_30591 ) ) ( HOIST-AT ?auto_30593 ?auto_30591 ) ( not ( = ?auto_30588 ?auto_30593 ) ) ( not ( = ?auto_30594 ?auto_30593 ) ) ( SURFACE-AT ?auto_30579 ?auto_30591 ) ( ON ?auto_30579 ?auto_30589 ) ( CLEAR ?auto_30579 ) ( not ( = ?auto_30578 ?auto_30589 ) ) ( not ( = ?auto_30579 ?auto_30589 ) ) ( not ( = ?auto_30586 ?auto_30589 ) ) ( not ( = ?auto_30581 ?auto_30589 ) ) ( IS-CRATE ?auto_30581 ) ( not ( = ?auto_30578 ?auto_30590 ) ) ( not ( = ?auto_30579 ?auto_30590 ) ) ( not ( = ?auto_30586 ?auto_30590 ) ) ( not ( = ?auto_30581 ?auto_30590 ) ) ( not ( = ?auto_30589 ?auto_30590 ) ) ( not ( = ?auto_30580 ?auto_30585 ) ) ( not ( = ?auto_30592 ?auto_30580 ) ) ( not ( = ?auto_30591 ?auto_30580 ) ) ( HOIST-AT ?auto_30582 ?auto_30580 ) ( not ( = ?auto_30588 ?auto_30582 ) ) ( not ( = ?auto_30594 ?auto_30582 ) ) ( not ( = ?auto_30593 ?auto_30582 ) ) ( AVAILABLE ?auto_30582 ) ( SURFACE-AT ?auto_30581 ?auto_30580 ) ( ON ?auto_30581 ?auto_30583 ) ( CLEAR ?auto_30581 ) ( not ( = ?auto_30578 ?auto_30583 ) ) ( not ( = ?auto_30579 ?auto_30583 ) ) ( not ( = ?auto_30586 ?auto_30583 ) ) ( not ( = ?auto_30581 ?auto_30583 ) ) ( not ( = ?auto_30589 ?auto_30583 ) ) ( not ( = ?auto_30590 ?auto_30583 ) ) ( SURFACE-AT ?auto_30584 ?auto_30585 ) ( CLEAR ?auto_30584 ) ( IS-CRATE ?auto_30590 ) ( not ( = ?auto_30578 ?auto_30584 ) ) ( not ( = ?auto_30579 ?auto_30584 ) ) ( not ( = ?auto_30586 ?auto_30584 ) ) ( not ( = ?auto_30581 ?auto_30584 ) ) ( not ( = ?auto_30589 ?auto_30584 ) ) ( not ( = ?auto_30590 ?auto_30584 ) ) ( not ( = ?auto_30583 ?auto_30584 ) ) ( AVAILABLE ?auto_30588 ) ( TRUCK-AT ?auto_30587 ?auto_30591 ) ( AVAILABLE ?auto_30593 ) ( SURFACE-AT ?auto_30590 ?auto_30591 ) ( ON ?auto_30590 ?auto_30595 ) ( CLEAR ?auto_30590 ) ( not ( = ?auto_30578 ?auto_30595 ) ) ( not ( = ?auto_30579 ?auto_30595 ) ) ( not ( = ?auto_30586 ?auto_30595 ) ) ( not ( = ?auto_30581 ?auto_30595 ) ) ( not ( = ?auto_30589 ?auto_30595 ) ) ( not ( = ?auto_30590 ?auto_30595 ) ) ( not ( = ?auto_30583 ?auto_30595 ) ) ( not ( = ?auto_30584 ?auto_30595 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30593 ?auto_30590 ?auto_30595 ?auto_30591 )
      ( MAKE-ON ?auto_30578 ?auto_30579 )
      ( MAKE-ON-VERIFY ?auto_30578 ?auto_30579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30596 - SURFACE
      ?auto_30597 - SURFACE
    )
    :vars
    (
      ?auto_30607 - HOIST
      ?auto_30606 - PLACE
      ?auto_30610 - PLACE
      ?auto_30599 - HOIST
      ?auto_30598 - SURFACE
      ?auto_30609 - SURFACE
      ?auto_30602 - PLACE
      ?auto_30603 - HOIST
      ?auto_30613 - SURFACE
      ?auto_30605 - SURFACE
      ?auto_30601 - PLACE
      ?auto_30608 - HOIST
      ?auto_30611 - SURFACE
      ?auto_30600 - SURFACE
      ?auto_30604 - SURFACE
      ?auto_30612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30607 ?auto_30606 ) ( IS-CRATE ?auto_30596 ) ( not ( = ?auto_30596 ?auto_30597 ) ) ( not ( = ?auto_30610 ?auto_30606 ) ) ( HOIST-AT ?auto_30599 ?auto_30610 ) ( not ( = ?auto_30607 ?auto_30599 ) ) ( AVAILABLE ?auto_30599 ) ( SURFACE-AT ?auto_30596 ?auto_30610 ) ( ON ?auto_30596 ?auto_30598 ) ( CLEAR ?auto_30596 ) ( not ( = ?auto_30596 ?auto_30598 ) ) ( not ( = ?auto_30597 ?auto_30598 ) ) ( IS-CRATE ?auto_30597 ) ( not ( = ?auto_30596 ?auto_30609 ) ) ( not ( = ?auto_30597 ?auto_30609 ) ) ( not ( = ?auto_30598 ?auto_30609 ) ) ( not ( = ?auto_30602 ?auto_30606 ) ) ( not ( = ?auto_30610 ?auto_30602 ) ) ( HOIST-AT ?auto_30603 ?auto_30602 ) ( not ( = ?auto_30607 ?auto_30603 ) ) ( not ( = ?auto_30599 ?auto_30603 ) ) ( SURFACE-AT ?auto_30597 ?auto_30602 ) ( ON ?auto_30597 ?auto_30613 ) ( CLEAR ?auto_30597 ) ( not ( = ?auto_30596 ?auto_30613 ) ) ( not ( = ?auto_30597 ?auto_30613 ) ) ( not ( = ?auto_30598 ?auto_30613 ) ) ( not ( = ?auto_30609 ?auto_30613 ) ) ( IS-CRATE ?auto_30609 ) ( not ( = ?auto_30596 ?auto_30605 ) ) ( not ( = ?auto_30597 ?auto_30605 ) ) ( not ( = ?auto_30598 ?auto_30605 ) ) ( not ( = ?auto_30609 ?auto_30605 ) ) ( not ( = ?auto_30613 ?auto_30605 ) ) ( not ( = ?auto_30601 ?auto_30606 ) ) ( not ( = ?auto_30610 ?auto_30601 ) ) ( not ( = ?auto_30602 ?auto_30601 ) ) ( HOIST-AT ?auto_30608 ?auto_30601 ) ( not ( = ?auto_30607 ?auto_30608 ) ) ( not ( = ?auto_30599 ?auto_30608 ) ) ( not ( = ?auto_30603 ?auto_30608 ) ) ( AVAILABLE ?auto_30608 ) ( SURFACE-AT ?auto_30609 ?auto_30601 ) ( ON ?auto_30609 ?auto_30611 ) ( CLEAR ?auto_30609 ) ( not ( = ?auto_30596 ?auto_30611 ) ) ( not ( = ?auto_30597 ?auto_30611 ) ) ( not ( = ?auto_30598 ?auto_30611 ) ) ( not ( = ?auto_30609 ?auto_30611 ) ) ( not ( = ?auto_30613 ?auto_30611 ) ) ( not ( = ?auto_30605 ?auto_30611 ) ) ( SURFACE-AT ?auto_30600 ?auto_30606 ) ( CLEAR ?auto_30600 ) ( IS-CRATE ?auto_30605 ) ( not ( = ?auto_30596 ?auto_30600 ) ) ( not ( = ?auto_30597 ?auto_30600 ) ) ( not ( = ?auto_30598 ?auto_30600 ) ) ( not ( = ?auto_30609 ?auto_30600 ) ) ( not ( = ?auto_30613 ?auto_30600 ) ) ( not ( = ?auto_30605 ?auto_30600 ) ) ( not ( = ?auto_30611 ?auto_30600 ) ) ( AVAILABLE ?auto_30607 ) ( AVAILABLE ?auto_30603 ) ( SURFACE-AT ?auto_30605 ?auto_30602 ) ( ON ?auto_30605 ?auto_30604 ) ( CLEAR ?auto_30605 ) ( not ( = ?auto_30596 ?auto_30604 ) ) ( not ( = ?auto_30597 ?auto_30604 ) ) ( not ( = ?auto_30598 ?auto_30604 ) ) ( not ( = ?auto_30609 ?auto_30604 ) ) ( not ( = ?auto_30613 ?auto_30604 ) ) ( not ( = ?auto_30605 ?auto_30604 ) ) ( not ( = ?auto_30611 ?auto_30604 ) ) ( not ( = ?auto_30600 ?auto_30604 ) ) ( TRUCK-AT ?auto_30612 ?auto_30606 ) )
    :subtasks
    ( ( !DRIVE ?auto_30612 ?auto_30606 ?auto_30602 )
      ( MAKE-ON ?auto_30596 ?auto_30597 )
      ( MAKE-ON-VERIFY ?auto_30596 ?auto_30597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30614 - SURFACE
      ?auto_30615 - SURFACE
    )
    :vars
    (
      ?auto_30618 - HOIST
      ?auto_30621 - PLACE
      ?auto_30619 - PLACE
      ?auto_30631 - HOIST
      ?auto_30625 - SURFACE
      ?auto_30623 - SURFACE
      ?auto_30630 - PLACE
      ?auto_30620 - HOIST
      ?auto_30616 - SURFACE
      ?auto_30622 - SURFACE
      ?auto_30627 - PLACE
      ?auto_30628 - HOIST
      ?auto_30624 - SURFACE
      ?auto_30629 - SURFACE
      ?auto_30626 - SURFACE
      ?auto_30617 - TRUCK
      ?auto_30632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30618 ?auto_30621 ) ( IS-CRATE ?auto_30614 ) ( not ( = ?auto_30614 ?auto_30615 ) ) ( not ( = ?auto_30619 ?auto_30621 ) ) ( HOIST-AT ?auto_30631 ?auto_30619 ) ( not ( = ?auto_30618 ?auto_30631 ) ) ( AVAILABLE ?auto_30631 ) ( SURFACE-AT ?auto_30614 ?auto_30619 ) ( ON ?auto_30614 ?auto_30625 ) ( CLEAR ?auto_30614 ) ( not ( = ?auto_30614 ?auto_30625 ) ) ( not ( = ?auto_30615 ?auto_30625 ) ) ( IS-CRATE ?auto_30615 ) ( not ( = ?auto_30614 ?auto_30623 ) ) ( not ( = ?auto_30615 ?auto_30623 ) ) ( not ( = ?auto_30625 ?auto_30623 ) ) ( not ( = ?auto_30630 ?auto_30621 ) ) ( not ( = ?auto_30619 ?auto_30630 ) ) ( HOIST-AT ?auto_30620 ?auto_30630 ) ( not ( = ?auto_30618 ?auto_30620 ) ) ( not ( = ?auto_30631 ?auto_30620 ) ) ( SURFACE-AT ?auto_30615 ?auto_30630 ) ( ON ?auto_30615 ?auto_30616 ) ( CLEAR ?auto_30615 ) ( not ( = ?auto_30614 ?auto_30616 ) ) ( not ( = ?auto_30615 ?auto_30616 ) ) ( not ( = ?auto_30625 ?auto_30616 ) ) ( not ( = ?auto_30623 ?auto_30616 ) ) ( IS-CRATE ?auto_30623 ) ( not ( = ?auto_30614 ?auto_30622 ) ) ( not ( = ?auto_30615 ?auto_30622 ) ) ( not ( = ?auto_30625 ?auto_30622 ) ) ( not ( = ?auto_30623 ?auto_30622 ) ) ( not ( = ?auto_30616 ?auto_30622 ) ) ( not ( = ?auto_30627 ?auto_30621 ) ) ( not ( = ?auto_30619 ?auto_30627 ) ) ( not ( = ?auto_30630 ?auto_30627 ) ) ( HOIST-AT ?auto_30628 ?auto_30627 ) ( not ( = ?auto_30618 ?auto_30628 ) ) ( not ( = ?auto_30631 ?auto_30628 ) ) ( not ( = ?auto_30620 ?auto_30628 ) ) ( AVAILABLE ?auto_30628 ) ( SURFACE-AT ?auto_30623 ?auto_30627 ) ( ON ?auto_30623 ?auto_30624 ) ( CLEAR ?auto_30623 ) ( not ( = ?auto_30614 ?auto_30624 ) ) ( not ( = ?auto_30615 ?auto_30624 ) ) ( not ( = ?auto_30625 ?auto_30624 ) ) ( not ( = ?auto_30623 ?auto_30624 ) ) ( not ( = ?auto_30616 ?auto_30624 ) ) ( not ( = ?auto_30622 ?auto_30624 ) ) ( IS-CRATE ?auto_30622 ) ( not ( = ?auto_30614 ?auto_30629 ) ) ( not ( = ?auto_30615 ?auto_30629 ) ) ( not ( = ?auto_30625 ?auto_30629 ) ) ( not ( = ?auto_30623 ?auto_30629 ) ) ( not ( = ?auto_30616 ?auto_30629 ) ) ( not ( = ?auto_30622 ?auto_30629 ) ) ( not ( = ?auto_30624 ?auto_30629 ) ) ( AVAILABLE ?auto_30620 ) ( SURFACE-AT ?auto_30622 ?auto_30630 ) ( ON ?auto_30622 ?auto_30626 ) ( CLEAR ?auto_30622 ) ( not ( = ?auto_30614 ?auto_30626 ) ) ( not ( = ?auto_30615 ?auto_30626 ) ) ( not ( = ?auto_30625 ?auto_30626 ) ) ( not ( = ?auto_30623 ?auto_30626 ) ) ( not ( = ?auto_30616 ?auto_30626 ) ) ( not ( = ?auto_30622 ?auto_30626 ) ) ( not ( = ?auto_30624 ?auto_30626 ) ) ( not ( = ?auto_30629 ?auto_30626 ) ) ( TRUCK-AT ?auto_30617 ?auto_30621 ) ( SURFACE-AT ?auto_30632 ?auto_30621 ) ( CLEAR ?auto_30632 ) ( LIFTING ?auto_30618 ?auto_30629 ) ( IS-CRATE ?auto_30629 ) ( not ( = ?auto_30614 ?auto_30632 ) ) ( not ( = ?auto_30615 ?auto_30632 ) ) ( not ( = ?auto_30625 ?auto_30632 ) ) ( not ( = ?auto_30623 ?auto_30632 ) ) ( not ( = ?auto_30616 ?auto_30632 ) ) ( not ( = ?auto_30622 ?auto_30632 ) ) ( not ( = ?auto_30624 ?auto_30632 ) ) ( not ( = ?auto_30629 ?auto_30632 ) ) ( not ( = ?auto_30626 ?auto_30632 ) ) )
    :subtasks
    ( ( !DROP ?auto_30618 ?auto_30629 ?auto_30632 ?auto_30621 )
      ( MAKE-ON ?auto_30614 ?auto_30615 )
      ( MAKE-ON-VERIFY ?auto_30614 ?auto_30615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30633 - SURFACE
      ?auto_30634 - SURFACE
    )
    :vars
    (
      ?auto_30642 - HOIST
      ?auto_30645 - PLACE
      ?auto_30643 - PLACE
      ?auto_30636 - HOIST
      ?auto_30650 - SURFACE
      ?auto_30648 - SURFACE
      ?auto_30649 - PLACE
      ?auto_30644 - HOIST
      ?auto_30641 - SURFACE
      ?auto_30638 - SURFACE
      ?auto_30640 - PLACE
      ?auto_30639 - HOIST
      ?auto_30637 - SURFACE
      ?auto_30647 - SURFACE
      ?auto_30646 - SURFACE
      ?auto_30651 - TRUCK
      ?auto_30635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30642 ?auto_30645 ) ( IS-CRATE ?auto_30633 ) ( not ( = ?auto_30633 ?auto_30634 ) ) ( not ( = ?auto_30643 ?auto_30645 ) ) ( HOIST-AT ?auto_30636 ?auto_30643 ) ( not ( = ?auto_30642 ?auto_30636 ) ) ( AVAILABLE ?auto_30636 ) ( SURFACE-AT ?auto_30633 ?auto_30643 ) ( ON ?auto_30633 ?auto_30650 ) ( CLEAR ?auto_30633 ) ( not ( = ?auto_30633 ?auto_30650 ) ) ( not ( = ?auto_30634 ?auto_30650 ) ) ( IS-CRATE ?auto_30634 ) ( not ( = ?auto_30633 ?auto_30648 ) ) ( not ( = ?auto_30634 ?auto_30648 ) ) ( not ( = ?auto_30650 ?auto_30648 ) ) ( not ( = ?auto_30649 ?auto_30645 ) ) ( not ( = ?auto_30643 ?auto_30649 ) ) ( HOIST-AT ?auto_30644 ?auto_30649 ) ( not ( = ?auto_30642 ?auto_30644 ) ) ( not ( = ?auto_30636 ?auto_30644 ) ) ( SURFACE-AT ?auto_30634 ?auto_30649 ) ( ON ?auto_30634 ?auto_30641 ) ( CLEAR ?auto_30634 ) ( not ( = ?auto_30633 ?auto_30641 ) ) ( not ( = ?auto_30634 ?auto_30641 ) ) ( not ( = ?auto_30650 ?auto_30641 ) ) ( not ( = ?auto_30648 ?auto_30641 ) ) ( IS-CRATE ?auto_30648 ) ( not ( = ?auto_30633 ?auto_30638 ) ) ( not ( = ?auto_30634 ?auto_30638 ) ) ( not ( = ?auto_30650 ?auto_30638 ) ) ( not ( = ?auto_30648 ?auto_30638 ) ) ( not ( = ?auto_30641 ?auto_30638 ) ) ( not ( = ?auto_30640 ?auto_30645 ) ) ( not ( = ?auto_30643 ?auto_30640 ) ) ( not ( = ?auto_30649 ?auto_30640 ) ) ( HOIST-AT ?auto_30639 ?auto_30640 ) ( not ( = ?auto_30642 ?auto_30639 ) ) ( not ( = ?auto_30636 ?auto_30639 ) ) ( not ( = ?auto_30644 ?auto_30639 ) ) ( AVAILABLE ?auto_30639 ) ( SURFACE-AT ?auto_30648 ?auto_30640 ) ( ON ?auto_30648 ?auto_30637 ) ( CLEAR ?auto_30648 ) ( not ( = ?auto_30633 ?auto_30637 ) ) ( not ( = ?auto_30634 ?auto_30637 ) ) ( not ( = ?auto_30650 ?auto_30637 ) ) ( not ( = ?auto_30648 ?auto_30637 ) ) ( not ( = ?auto_30641 ?auto_30637 ) ) ( not ( = ?auto_30638 ?auto_30637 ) ) ( IS-CRATE ?auto_30638 ) ( not ( = ?auto_30633 ?auto_30647 ) ) ( not ( = ?auto_30634 ?auto_30647 ) ) ( not ( = ?auto_30650 ?auto_30647 ) ) ( not ( = ?auto_30648 ?auto_30647 ) ) ( not ( = ?auto_30641 ?auto_30647 ) ) ( not ( = ?auto_30638 ?auto_30647 ) ) ( not ( = ?auto_30637 ?auto_30647 ) ) ( AVAILABLE ?auto_30644 ) ( SURFACE-AT ?auto_30638 ?auto_30649 ) ( ON ?auto_30638 ?auto_30646 ) ( CLEAR ?auto_30638 ) ( not ( = ?auto_30633 ?auto_30646 ) ) ( not ( = ?auto_30634 ?auto_30646 ) ) ( not ( = ?auto_30650 ?auto_30646 ) ) ( not ( = ?auto_30648 ?auto_30646 ) ) ( not ( = ?auto_30641 ?auto_30646 ) ) ( not ( = ?auto_30638 ?auto_30646 ) ) ( not ( = ?auto_30637 ?auto_30646 ) ) ( not ( = ?auto_30647 ?auto_30646 ) ) ( TRUCK-AT ?auto_30651 ?auto_30645 ) ( SURFACE-AT ?auto_30635 ?auto_30645 ) ( CLEAR ?auto_30635 ) ( IS-CRATE ?auto_30647 ) ( not ( = ?auto_30633 ?auto_30635 ) ) ( not ( = ?auto_30634 ?auto_30635 ) ) ( not ( = ?auto_30650 ?auto_30635 ) ) ( not ( = ?auto_30648 ?auto_30635 ) ) ( not ( = ?auto_30641 ?auto_30635 ) ) ( not ( = ?auto_30638 ?auto_30635 ) ) ( not ( = ?auto_30637 ?auto_30635 ) ) ( not ( = ?auto_30647 ?auto_30635 ) ) ( not ( = ?auto_30646 ?auto_30635 ) ) ( AVAILABLE ?auto_30642 ) ( IN ?auto_30647 ?auto_30651 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30642 ?auto_30647 ?auto_30651 ?auto_30645 )
      ( MAKE-ON ?auto_30633 ?auto_30634 )
      ( MAKE-ON-VERIFY ?auto_30633 ?auto_30634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30652 - SURFACE
      ?auto_30653 - SURFACE
    )
    :vars
    (
      ?auto_30655 - HOIST
      ?auto_30670 - PLACE
      ?auto_30668 - PLACE
      ?auto_30654 - HOIST
      ?auto_30658 - SURFACE
      ?auto_30657 - SURFACE
      ?auto_30663 - PLACE
      ?auto_30666 - HOIST
      ?auto_30669 - SURFACE
      ?auto_30656 - SURFACE
      ?auto_30662 - PLACE
      ?auto_30660 - HOIST
      ?auto_30667 - SURFACE
      ?auto_30664 - SURFACE
      ?auto_30659 - SURFACE
      ?auto_30665 - SURFACE
      ?auto_30661 - TRUCK
      ?auto_30671 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30655 ?auto_30670 ) ( IS-CRATE ?auto_30652 ) ( not ( = ?auto_30652 ?auto_30653 ) ) ( not ( = ?auto_30668 ?auto_30670 ) ) ( HOIST-AT ?auto_30654 ?auto_30668 ) ( not ( = ?auto_30655 ?auto_30654 ) ) ( AVAILABLE ?auto_30654 ) ( SURFACE-AT ?auto_30652 ?auto_30668 ) ( ON ?auto_30652 ?auto_30658 ) ( CLEAR ?auto_30652 ) ( not ( = ?auto_30652 ?auto_30658 ) ) ( not ( = ?auto_30653 ?auto_30658 ) ) ( IS-CRATE ?auto_30653 ) ( not ( = ?auto_30652 ?auto_30657 ) ) ( not ( = ?auto_30653 ?auto_30657 ) ) ( not ( = ?auto_30658 ?auto_30657 ) ) ( not ( = ?auto_30663 ?auto_30670 ) ) ( not ( = ?auto_30668 ?auto_30663 ) ) ( HOIST-AT ?auto_30666 ?auto_30663 ) ( not ( = ?auto_30655 ?auto_30666 ) ) ( not ( = ?auto_30654 ?auto_30666 ) ) ( SURFACE-AT ?auto_30653 ?auto_30663 ) ( ON ?auto_30653 ?auto_30669 ) ( CLEAR ?auto_30653 ) ( not ( = ?auto_30652 ?auto_30669 ) ) ( not ( = ?auto_30653 ?auto_30669 ) ) ( not ( = ?auto_30658 ?auto_30669 ) ) ( not ( = ?auto_30657 ?auto_30669 ) ) ( IS-CRATE ?auto_30657 ) ( not ( = ?auto_30652 ?auto_30656 ) ) ( not ( = ?auto_30653 ?auto_30656 ) ) ( not ( = ?auto_30658 ?auto_30656 ) ) ( not ( = ?auto_30657 ?auto_30656 ) ) ( not ( = ?auto_30669 ?auto_30656 ) ) ( not ( = ?auto_30662 ?auto_30670 ) ) ( not ( = ?auto_30668 ?auto_30662 ) ) ( not ( = ?auto_30663 ?auto_30662 ) ) ( HOIST-AT ?auto_30660 ?auto_30662 ) ( not ( = ?auto_30655 ?auto_30660 ) ) ( not ( = ?auto_30654 ?auto_30660 ) ) ( not ( = ?auto_30666 ?auto_30660 ) ) ( AVAILABLE ?auto_30660 ) ( SURFACE-AT ?auto_30657 ?auto_30662 ) ( ON ?auto_30657 ?auto_30667 ) ( CLEAR ?auto_30657 ) ( not ( = ?auto_30652 ?auto_30667 ) ) ( not ( = ?auto_30653 ?auto_30667 ) ) ( not ( = ?auto_30658 ?auto_30667 ) ) ( not ( = ?auto_30657 ?auto_30667 ) ) ( not ( = ?auto_30669 ?auto_30667 ) ) ( not ( = ?auto_30656 ?auto_30667 ) ) ( IS-CRATE ?auto_30656 ) ( not ( = ?auto_30652 ?auto_30664 ) ) ( not ( = ?auto_30653 ?auto_30664 ) ) ( not ( = ?auto_30658 ?auto_30664 ) ) ( not ( = ?auto_30657 ?auto_30664 ) ) ( not ( = ?auto_30669 ?auto_30664 ) ) ( not ( = ?auto_30656 ?auto_30664 ) ) ( not ( = ?auto_30667 ?auto_30664 ) ) ( AVAILABLE ?auto_30666 ) ( SURFACE-AT ?auto_30656 ?auto_30663 ) ( ON ?auto_30656 ?auto_30659 ) ( CLEAR ?auto_30656 ) ( not ( = ?auto_30652 ?auto_30659 ) ) ( not ( = ?auto_30653 ?auto_30659 ) ) ( not ( = ?auto_30658 ?auto_30659 ) ) ( not ( = ?auto_30657 ?auto_30659 ) ) ( not ( = ?auto_30669 ?auto_30659 ) ) ( not ( = ?auto_30656 ?auto_30659 ) ) ( not ( = ?auto_30667 ?auto_30659 ) ) ( not ( = ?auto_30664 ?auto_30659 ) ) ( SURFACE-AT ?auto_30665 ?auto_30670 ) ( CLEAR ?auto_30665 ) ( IS-CRATE ?auto_30664 ) ( not ( = ?auto_30652 ?auto_30665 ) ) ( not ( = ?auto_30653 ?auto_30665 ) ) ( not ( = ?auto_30658 ?auto_30665 ) ) ( not ( = ?auto_30657 ?auto_30665 ) ) ( not ( = ?auto_30669 ?auto_30665 ) ) ( not ( = ?auto_30656 ?auto_30665 ) ) ( not ( = ?auto_30667 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30665 ) ) ( not ( = ?auto_30659 ?auto_30665 ) ) ( AVAILABLE ?auto_30655 ) ( IN ?auto_30664 ?auto_30661 ) ( TRUCK-AT ?auto_30661 ?auto_30671 ) ( not ( = ?auto_30671 ?auto_30670 ) ) ( not ( = ?auto_30668 ?auto_30671 ) ) ( not ( = ?auto_30663 ?auto_30671 ) ) ( not ( = ?auto_30662 ?auto_30671 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30661 ?auto_30671 ?auto_30670 )
      ( MAKE-ON ?auto_30652 ?auto_30653 )
      ( MAKE-ON-VERIFY ?auto_30652 ?auto_30653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30672 - SURFACE
      ?auto_30673 - SURFACE
    )
    :vars
    (
      ?auto_30675 - HOIST
      ?auto_30679 - PLACE
      ?auto_30684 - PLACE
      ?auto_30680 - HOIST
      ?auto_30681 - SURFACE
      ?auto_30682 - SURFACE
      ?auto_30683 - PLACE
      ?auto_30690 - HOIST
      ?auto_30688 - SURFACE
      ?auto_30685 - SURFACE
      ?auto_30689 - PLACE
      ?auto_30677 - HOIST
      ?auto_30686 - SURFACE
      ?auto_30674 - SURFACE
      ?auto_30687 - SURFACE
      ?auto_30676 - SURFACE
      ?auto_30691 - TRUCK
      ?auto_30678 - PLACE
      ?auto_30692 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30675 ?auto_30679 ) ( IS-CRATE ?auto_30672 ) ( not ( = ?auto_30672 ?auto_30673 ) ) ( not ( = ?auto_30684 ?auto_30679 ) ) ( HOIST-AT ?auto_30680 ?auto_30684 ) ( not ( = ?auto_30675 ?auto_30680 ) ) ( AVAILABLE ?auto_30680 ) ( SURFACE-AT ?auto_30672 ?auto_30684 ) ( ON ?auto_30672 ?auto_30681 ) ( CLEAR ?auto_30672 ) ( not ( = ?auto_30672 ?auto_30681 ) ) ( not ( = ?auto_30673 ?auto_30681 ) ) ( IS-CRATE ?auto_30673 ) ( not ( = ?auto_30672 ?auto_30682 ) ) ( not ( = ?auto_30673 ?auto_30682 ) ) ( not ( = ?auto_30681 ?auto_30682 ) ) ( not ( = ?auto_30683 ?auto_30679 ) ) ( not ( = ?auto_30684 ?auto_30683 ) ) ( HOIST-AT ?auto_30690 ?auto_30683 ) ( not ( = ?auto_30675 ?auto_30690 ) ) ( not ( = ?auto_30680 ?auto_30690 ) ) ( SURFACE-AT ?auto_30673 ?auto_30683 ) ( ON ?auto_30673 ?auto_30688 ) ( CLEAR ?auto_30673 ) ( not ( = ?auto_30672 ?auto_30688 ) ) ( not ( = ?auto_30673 ?auto_30688 ) ) ( not ( = ?auto_30681 ?auto_30688 ) ) ( not ( = ?auto_30682 ?auto_30688 ) ) ( IS-CRATE ?auto_30682 ) ( not ( = ?auto_30672 ?auto_30685 ) ) ( not ( = ?auto_30673 ?auto_30685 ) ) ( not ( = ?auto_30681 ?auto_30685 ) ) ( not ( = ?auto_30682 ?auto_30685 ) ) ( not ( = ?auto_30688 ?auto_30685 ) ) ( not ( = ?auto_30689 ?auto_30679 ) ) ( not ( = ?auto_30684 ?auto_30689 ) ) ( not ( = ?auto_30683 ?auto_30689 ) ) ( HOIST-AT ?auto_30677 ?auto_30689 ) ( not ( = ?auto_30675 ?auto_30677 ) ) ( not ( = ?auto_30680 ?auto_30677 ) ) ( not ( = ?auto_30690 ?auto_30677 ) ) ( AVAILABLE ?auto_30677 ) ( SURFACE-AT ?auto_30682 ?auto_30689 ) ( ON ?auto_30682 ?auto_30686 ) ( CLEAR ?auto_30682 ) ( not ( = ?auto_30672 ?auto_30686 ) ) ( not ( = ?auto_30673 ?auto_30686 ) ) ( not ( = ?auto_30681 ?auto_30686 ) ) ( not ( = ?auto_30682 ?auto_30686 ) ) ( not ( = ?auto_30688 ?auto_30686 ) ) ( not ( = ?auto_30685 ?auto_30686 ) ) ( IS-CRATE ?auto_30685 ) ( not ( = ?auto_30672 ?auto_30674 ) ) ( not ( = ?auto_30673 ?auto_30674 ) ) ( not ( = ?auto_30681 ?auto_30674 ) ) ( not ( = ?auto_30682 ?auto_30674 ) ) ( not ( = ?auto_30688 ?auto_30674 ) ) ( not ( = ?auto_30685 ?auto_30674 ) ) ( not ( = ?auto_30686 ?auto_30674 ) ) ( AVAILABLE ?auto_30690 ) ( SURFACE-AT ?auto_30685 ?auto_30683 ) ( ON ?auto_30685 ?auto_30687 ) ( CLEAR ?auto_30685 ) ( not ( = ?auto_30672 ?auto_30687 ) ) ( not ( = ?auto_30673 ?auto_30687 ) ) ( not ( = ?auto_30681 ?auto_30687 ) ) ( not ( = ?auto_30682 ?auto_30687 ) ) ( not ( = ?auto_30688 ?auto_30687 ) ) ( not ( = ?auto_30685 ?auto_30687 ) ) ( not ( = ?auto_30686 ?auto_30687 ) ) ( not ( = ?auto_30674 ?auto_30687 ) ) ( SURFACE-AT ?auto_30676 ?auto_30679 ) ( CLEAR ?auto_30676 ) ( IS-CRATE ?auto_30674 ) ( not ( = ?auto_30672 ?auto_30676 ) ) ( not ( = ?auto_30673 ?auto_30676 ) ) ( not ( = ?auto_30681 ?auto_30676 ) ) ( not ( = ?auto_30682 ?auto_30676 ) ) ( not ( = ?auto_30688 ?auto_30676 ) ) ( not ( = ?auto_30685 ?auto_30676 ) ) ( not ( = ?auto_30686 ?auto_30676 ) ) ( not ( = ?auto_30674 ?auto_30676 ) ) ( not ( = ?auto_30687 ?auto_30676 ) ) ( AVAILABLE ?auto_30675 ) ( TRUCK-AT ?auto_30691 ?auto_30678 ) ( not ( = ?auto_30678 ?auto_30679 ) ) ( not ( = ?auto_30684 ?auto_30678 ) ) ( not ( = ?auto_30683 ?auto_30678 ) ) ( not ( = ?auto_30689 ?auto_30678 ) ) ( HOIST-AT ?auto_30692 ?auto_30678 ) ( LIFTING ?auto_30692 ?auto_30674 ) ( not ( = ?auto_30675 ?auto_30692 ) ) ( not ( = ?auto_30680 ?auto_30692 ) ) ( not ( = ?auto_30690 ?auto_30692 ) ) ( not ( = ?auto_30677 ?auto_30692 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30692 ?auto_30674 ?auto_30691 ?auto_30678 )
      ( MAKE-ON ?auto_30672 ?auto_30673 )
      ( MAKE-ON-VERIFY ?auto_30672 ?auto_30673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30693 - SURFACE
      ?auto_30694 - SURFACE
    )
    :vars
    (
      ?auto_30713 - HOIST
      ?auto_30712 - PLACE
      ?auto_30703 - PLACE
      ?auto_30708 - HOIST
      ?auto_30710 - SURFACE
      ?auto_30702 - SURFACE
      ?auto_30706 - PLACE
      ?auto_30704 - HOIST
      ?auto_30695 - SURFACE
      ?auto_30698 - SURFACE
      ?auto_30697 - PLACE
      ?auto_30700 - HOIST
      ?auto_30707 - SURFACE
      ?auto_30696 - SURFACE
      ?auto_30711 - SURFACE
      ?auto_30699 - SURFACE
      ?auto_30709 - TRUCK
      ?auto_30705 - PLACE
      ?auto_30701 - HOIST
      ?auto_30714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30713 ?auto_30712 ) ( IS-CRATE ?auto_30693 ) ( not ( = ?auto_30693 ?auto_30694 ) ) ( not ( = ?auto_30703 ?auto_30712 ) ) ( HOIST-AT ?auto_30708 ?auto_30703 ) ( not ( = ?auto_30713 ?auto_30708 ) ) ( AVAILABLE ?auto_30708 ) ( SURFACE-AT ?auto_30693 ?auto_30703 ) ( ON ?auto_30693 ?auto_30710 ) ( CLEAR ?auto_30693 ) ( not ( = ?auto_30693 ?auto_30710 ) ) ( not ( = ?auto_30694 ?auto_30710 ) ) ( IS-CRATE ?auto_30694 ) ( not ( = ?auto_30693 ?auto_30702 ) ) ( not ( = ?auto_30694 ?auto_30702 ) ) ( not ( = ?auto_30710 ?auto_30702 ) ) ( not ( = ?auto_30706 ?auto_30712 ) ) ( not ( = ?auto_30703 ?auto_30706 ) ) ( HOIST-AT ?auto_30704 ?auto_30706 ) ( not ( = ?auto_30713 ?auto_30704 ) ) ( not ( = ?auto_30708 ?auto_30704 ) ) ( SURFACE-AT ?auto_30694 ?auto_30706 ) ( ON ?auto_30694 ?auto_30695 ) ( CLEAR ?auto_30694 ) ( not ( = ?auto_30693 ?auto_30695 ) ) ( not ( = ?auto_30694 ?auto_30695 ) ) ( not ( = ?auto_30710 ?auto_30695 ) ) ( not ( = ?auto_30702 ?auto_30695 ) ) ( IS-CRATE ?auto_30702 ) ( not ( = ?auto_30693 ?auto_30698 ) ) ( not ( = ?auto_30694 ?auto_30698 ) ) ( not ( = ?auto_30710 ?auto_30698 ) ) ( not ( = ?auto_30702 ?auto_30698 ) ) ( not ( = ?auto_30695 ?auto_30698 ) ) ( not ( = ?auto_30697 ?auto_30712 ) ) ( not ( = ?auto_30703 ?auto_30697 ) ) ( not ( = ?auto_30706 ?auto_30697 ) ) ( HOIST-AT ?auto_30700 ?auto_30697 ) ( not ( = ?auto_30713 ?auto_30700 ) ) ( not ( = ?auto_30708 ?auto_30700 ) ) ( not ( = ?auto_30704 ?auto_30700 ) ) ( AVAILABLE ?auto_30700 ) ( SURFACE-AT ?auto_30702 ?auto_30697 ) ( ON ?auto_30702 ?auto_30707 ) ( CLEAR ?auto_30702 ) ( not ( = ?auto_30693 ?auto_30707 ) ) ( not ( = ?auto_30694 ?auto_30707 ) ) ( not ( = ?auto_30710 ?auto_30707 ) ) ( not ( = ?auto_30702 ?auto_30707 ) ) ( not ( = ?auto_30695 ?auto_30707 ) ) ( not ( = ?auto_30698 ?auto_30707 ) ) ( IS-CRATE ?auto_30698 ) ( not ( = ?auto_30693 ?auto_30696 ) ) ( not ( = ?auto_30694 ?auto_30696 ) ) ( not ( = ?auto_30710 ?auto_30696 ) ) ( not ( = ?auto_30702 ?auto_30696 ) ) ( not ( = ?auto_30695 ?auto_30696 ) ) ( not ( = ?auto_30698 ?auto_30696 ) ) ( not ( = ?auto_30707 ?auto_30696 ) ) ( AVAILABLE ?auto_30704 ) ( SURFACE-AT ?auto_30698 ?auto_30706 ) ( ON ?auto_30698 ?auto_30711 ) ( CLEAR ?auto_30698 ) ( not ( = ?auto_30693 ?auto_30711 ) ) ( not ( = ?auto_30694 ?auto_30711 ) ) ( not ( = ?auto_30710 ?auto_30711 ) ) ( not ( = ?auto_30702 ?auto_30711 ) ) ( not ( = ?auto_30695 ?auto_30711 ) ) ( not ( = ?auto_30698 ?auto_30711 ) ) ( not ( = ?auto_30707 ?auto_30711 ) ) ( not ( = ?auto_30696 ?auto_30711 ) ) ( SURFACE-AT ?auto_30699 ?auto_30712 ) ( CLEAR ?auto_30699 ) ( IS-CRATE ?auto_30696 ) ( not ( = ?auto_30693 ?auto_30699 ) ) ( not ( = ?auto_30694 ?auto_30699 ) ) ( not ( = ?auto_30710 ?auto_30699 ) ) ( not ( = ?auto_30702 ?auto_30699 ) ) ( not ( = ?auto_30695 ?auto_30699 ) ) ( not ( = ?auto_30698 ?auto_30699 ) ) ( not ( = ?auto_30707 ?auto_30699 ) ) ( not ( = ?auto_30696 ?auto_30699 ) ) ( not ( = ?auto_30711 ?auto_30699 ) ) ( AVAILABLE ?auto_30713 ) ( TRUCK-AT ?auto_30709 ?auto_30705 ) ( not ( = ?auto_30705 ?auto_30712 ) ) ( not ( = ?auto_30703 ?auto_30705 ) ) ( not ( = ?auto_30706 ?auto_30705 ) ) ( not ( = ?auto_30697 ?auto_30705 ) ) ( HOIST-AT ?auto_30701 ?auto_30705 ) ( not ( = ?auto_30713 ?auto_30701 ) ) ( not ( = ?auto_30708 ?auto_30701 ) ) ( not ( = ?auto_30704 ?auto_30701 ) ) ( not ( = ?auto_30700 ?auto_30701 ) ) ( AVAILABLE ?auto_30701 ) ( SURFACE-AT ?auto_30696 ?auto_30705 ) ( ON ?auto_30696 ?auto_30714 ) ( CLEAR ?auto_30696 ) ( not ( = ?auto_30693 ?auto_30714 ) ) ( not ( = ?auto_30694 ?auto_30714 ) ) ( not ( = ?auto_30710 ?auto_30714 ) ) ( not ( = ?auto_30702 ?auto_30714 ) ) ( not ( = ?auto_30695 ?auto_30714 ) ) ( not ( = ?auto_30698 ?auto_30714 ) ) ( not ( = ?auto_30707 ?auto_30714 ) ) ( not ( = ?auto_30696 ?auto_30714 ) ) ( not ( = ?auto_30711 ?auto_30714 ) ) ( not ( = ?auto_30699 ?auto_30714 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30701 ?auto_30696 ?auto_30714 ?auto_30705 )
      ( MAKE-ON ?auto_30693 ?auto_30694 )
      ( MAKE-ON-VERIFY ?auto_30693 ?auto_30694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30715 - SURFACE
      ?auto_30716 - SURFACE
    )
    :vars
    (
      ?auto_30729 - HOIST
      ?auto_30723 - PLACE
      ?auto_30728 - PLACE
      ?auto_30730 - HOIST
      ?auto_30717 - SURFACE
      ?auto_30726 - SURFACE
      ?auto_30722 - PLACE
      ?auto_30734 - HOIST
      ?auto_30733 - SURFACE
      ?auto_30735 - SURFACE
      ?auto_30727 - PLACE
      ?auto_30720 - HOIST
      ?auto_30736 - SURFACE
      ?auto_30721 - SURFACE
      ?auto_30724 - SURFACE
      ?auto_30731 - SURFACE
      ?auto_30719 - PLACE
      ?auto_30718 - HOIST
      ?auto_30732 - SURFACE
      ?auto_30725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30729 ?auto_30723 ) ( IS-CRATE ?auto_30715 ) ( not ( = ?auto_30715 ?auto_30716 ) ) ( not ( = ?auto_30728 ?auto_30723 ) ) ( HOIST-AT ?auto_30730 ?auto_30728 ) ( not ( = ?auto_30729 ?auto_30730 ) ) ( AVAILABLE ?auto_30730 ) ( SURFACE-AT ?auto_30715 ?auto_30728 ) ( ON ?auto_30715 ?auto_30717 ) ( CLEAR ?auto_30715 ) ( not ( = ?auto_30715 ?auto_30717 ) ) ( not ( = ?auto_30716 ?auto_30717 ) ) ( IS-CRATE ?auto_30716 ) ( not ( = ?auto_30715 ?auto_30726 ) ) ( not ( = ?auto_30716 ?auto_30726 ) ) ( not ( = ?auto_30717 ?auto_30726 ) ) ( not ( = ?auto_30722 ?auto_30723 ) ) ( not ( = ?auto_30728 ?auto_30722 ) ) ( HOIST-AT ?auto_30734 ?auto_30722 ) ( not ( = ?auto_30729 ?auto_30734 ) ) ( not ( = ?auto_30730 ?auto_30734 ) ) ( SURFACE-AT ?auto_30716 ?auto_30722 ) ( ON ?auto_30716 ?auto_30733 ) ( CLEAR ?auto_30716 ) ( not ( = ?auto_30715 ?auto_30733 ) ) ( not ( = ?auto_30716 ?auto_30733 ) ) ( not ( = ?auto_30717 ?auto_30733 ) ) ( not ( = ?auto_30726 ?auto_30733 ) ) ( IS-CRATE ?auto_30726 ) ( not ( = ?auto_30715 ?auto_30735 ) ) ( not ( = ?auto_30716 ?auto_30735 ) ) ( not ( = ?auto_30717 ?auto_30735 ) ) ( not ( = ?auto_30726 ?auto_30735 ) ) ( not ( = ?auto_30733 ?auto_30735 ) ) ( not ( = ?auto_30727 ?auto_30723 ) ) ( not ( = ?auto_30728 ?auto_30727 ) ) ( not ( = ?auto_30722 ?auto_30727 ) ) ( HOIST-AT ?auto_30720 ?auto_30727 ) ( not ( = ?auto_30729 ?auto_30720 ) ) ( not ( = ?auto_30730 ?auto_30720 ) ) ( not ( = ?auto_30734 ?auto_30720 ) ) ( AVAILABLE ?auto_30720 ) ( SURFACE-AT ?auto_30726 ?auto_30727 ) ( ON ?auto_30726 ?auto_30736 ) ( CLEAR ?auto_30726 ) ( not ( = ?auto_30715 ?auto_30736 ) ) ( not ( = ?auto_30716 ?auto_30736 ) ) ( not ( = ?auto_30717 ?auto_30736 ) ) ( not ( = ?auto_30726 ?auto_30736 ) ) ( not ( = ?auto_30733 ?auto_30736 ) ) ( not ( = ?auto_30735 ?auto_30736 ) ) ( IS-CRATE ?auto_30735 ) ( not ( = ?auto_30715 ?auto_30721 ) ) ( not ( = ?auto_30716 ?auto_30721 ) ) ( not ( = ?auto_30717 ?auto_30721 ) ) ( not ( = ?auto_30726 ?auto_30721 ) ) ( not ( = ?auto_30733 ?auto_30721 ) ) ( not ( = ?auto_30735 ?auto_30721 ) ) ( not ( = ?auto_30736 ?auto_30721 ) ) ( AVAILABLE ?auto_30734 ) ( SURFACE-AT ?auto_30735 ?auto_30722 ) ( ON ?auto_30735 ?auto_30724 ) ( CLEAR ?auto_30735 ) ( not ( = ?auto_30715 ?auto_30724 ) ) ( not ( = ?auto_30716 ?auto_30724 ) ) ( not ( = ?auto_30717 ?auto_30724 ) ) ( not ( = ?auto_30726 ?auto_30724 ) ) ( not ( = ?auto_30733 ?auto_30724 ) ) ( not ( = ?auto_30735 ?auto_30724 ) ) ( not ( = ?auto_30736 ?auto_30724 ) ) ( not ( = ?auto_30721 ?auto_30724 ) ) ( SURFACE-AT ?auto_30731 ?auto_30723 ) ( CLEAR ?auto_30731 ) ( IS-CRATE ?auto_30721 ) ( not ( = ?auto_30715 ?auto_30731 ) ) ( not ( = ?auto_30716 ?auto_30731 ) ) ( not ( = ?auto_30717 ?auto_30731 ) ) ( not ( = ?auto_30726 ?auto_30731 ) ) ( not ( = ?auto_30733 ?auto_30731 ) ) ( not ( = ?auto_30735 ?auto_30731 ) ) ( not ( = ?auto_30736 ?auto_30731 ) ) ( not ( = ?auto_30721 ?auto_30731 ) ) ( not ( = ?auto_30724 ?auto_30731 ) ) ( AVAILABLE ?auto_30729 ) ( not ( = ?auto_30719 ?auto_30723 ) ) ( not ( = ?auto_30728 ?auto_30719 ) ) ( not ( = ?auto_30722 ?auto_30719 ) ) ( not ( = ?auto_30727 ?auto_30719 ) ) ( HOIST-AT ?auto_30718 ?auto_30719 ) ( not ( = ?auto_30729 ?auto_30718 ) ) ( not ( = ?auto_30730 ?auto_30718 ) ) ( not ( = ?auto_30734 ?auto_30718 ) ) ( not ( = ?auto_30720 ?auto_30718 ) ) ( AVAILABLE ?auto_30718 ) ( SURFACE-AT ?auto_30721 ?auto_30719 ) ( ON ?auto_30721 ?auto_30732 ) ( CLEAR ?auto_30721 ) ( not ( = ?auto_30715 ?auto_30732 ) ) ( not ( = ?auto_30716 ?auto_30732 ) ) ( not ( = ?auto_30717 ?auto_30732 ) ) ( not ( = ?auto_30726 ?auto_30732 ) ) ( not ( = ?auto_30733 ?auto_30732 ) ) ( not ( = ?auto_30735 ?auto_30732 ) ) ( not ( = ?auto_30736 ?auto_30732 ) ) ( not ( = ?auto_30721 ?auto_30732 ) ) ( not ( = ?auto_30724 ?auto_30732 ) ) ( not ( = ?auto_30731 ?auto_30732 ) ) ( TRUCK-AT ?auto_30725 ?auto_30723 ) )
    :subtasks
    ( ( !DRIVE ?auto_30725 ?auto_30723 ?auto_30719 )
      ( MAKE-ON ?auto_30715 ?auto_30716 )
      ( MAKE-ON-VERIFY ?auto_30715 ?auto_30716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30739 - SURFACE
      ?auto_30740 - SURFACE
    )
    :vars
    (
      ?auto_30741 - HOIST
      ?auto_30742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30741 ?auto_30742 ) ( SURFACE-AT ?auto_30740 ?auto_30742 ) ( CLEAR ?auto_30740 ) ( LIFTING ?auto_30741 ?auto_30739 ) ( IS-CRATE ?auto_30739 ) ( not ( = ?auto_30739 ?auto_30740 ) ) )
    :subtasks
    ( ( !DROP ?auto_30741 ?auto_30739 ?auto_30740 ?auto_30742 )
      ( MAKE-ON-VERIFY ?auto_30739 ?auto_30740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30743 - SURFACE
      ?auto_30744 - SURFACE
    )
    :vars
    (
      ?auto_30746 - HOIST
      ?auto_30745 - PLACE
      ?auto_30747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30746 ?auto_30745 ) ( SURFACE-AT ?auto_30744 ?auto_30745 ) ( CLEAR ?auto_30744 ) ( IS-CRATE ?auto_30743 ) ( not ( = ?auto_30743 ?auto_30744 ) ) ( TRUCK-AT ?auto_30747 ?auto_30745 ) ( AVAILABLE ?auto_30746 ) ( IN ?auto_30743 ?auto_30747 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30746 ?auto_30743 ?auto_30747 ?auto_30745 )
      ( MAKE-ON ?auto_30743 ?auto_30744 )
      ( MAKE-ON-VERIFY ?auto_30743 ?auto_30744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30748 - SURFACE
      ?auto_30749 - SURFACE
    )
    :vars
    (
      ?auto_30751 - HOIST
      ?auto_30752 - PLACE
      ?auto_30750 - TRUCK
      ?auto_30753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30751 ?auto_30752 ) ( SURFACE-AT ?auto_30749 ?auto_30752 ) ( CLEAR ?auto_30749 ) ( IS-CRATE ?auto_30748 ) ( not ( = ?auto_30748 ?auto_30749 ) ) ( AVAILABLE ?auto_30751 ) ( IN ?auto_30748 ?auto_30750 ) ( TRUCK-AT ?auto_30750 ?auto_30753 ) ( not ( = ?auto_30753 ?auto_30752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30750 ?auto_30753 ?auto_30752 )
      ( MAKE-ON ?auto_30748 ?auto_30749 )
      ( MAKE-ON-VERIFY ?auto_30748 ?auto_30749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30754 - SURFACE
      ?auto_30755 - SURFACE
    )
    :vars
    (
      ?auto_30757 - HOIST
      ?auto_30759 - PLACE
      ?auto_30756 - TRUCK
      ?auto_30758 - PLACE
      ?auto_30760 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30757 ?auto_30759 ) ( SURFACE-AT ?auto_30755 ?auto_30759 ) ( CLEAR ?auto_30755 ) ( IS-CRATE ?auto_30754 ) ( not ( = ?auto_30754 ?auto_30755 ) ) ( AVAILABLE ?auto_30757 ) ( TRUCK-AT ?auto_30756 ?auto_30758 ) ( not ( = ?auto_30758 ?auto_30759 ) ) ( HOIST-AT ?auto_30760 ?auto_30758 ) ( LIFTING ?auto_30760 ?auto_30754 ) ( not ( = ?auto_30757 ?auto_30760 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30760 ?auto_30754 ?auto_30756 ?auto_30758 )
      ( MAKE-ON ?auto_30754 ?auto_30755 )
      ( MAKE-ON-VERIFY ?auto_30754 ?auto_30755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30761 - SURFACE
      ?auto_30762 - SURFACE
    )
    :vars
    (
      ?auto_30765 - HOIST
      ?auto_30763 - PLACE
      ?auto_30767 - TRUCK
      ?auto_30766 - PLACE
      ?auto_30764 - HOIST
      ?auto_30768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30765 ?auto_30763 ) ( SURFACE-AT ?auto_30762 ?auto_30763 ) ( CLEAR ?auto_30762 ) ( IS-CRATE ?auto_30761 ) ( not ( = ?auto_30761 ?auto_30762 ) ) ( AVAILABLE ?auto_30765 ) ( TRUCK-AT ?auto_30767 ?auto_30766 ) ( not ( = ?auto_30766 ?auto_30763 ) ) ( HOIST-AT ?auto_30764 ?auto_30766 ) ( not ( = ?auto_30765 ?auto_30764 ) ) ( AVAILABLE ?auto_30764 ) ( SURFACE-AT ?auto_30761 ?auto_30766 ) ( ON ?auto_30761 ?auto_30768 ) ( CLEAR ?auto_30761 ) ( not ( = ?auto_30761 ?auto_30768 ) ) ( not ( = ?auto_30762 ?auto_30768 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30764 ?auto_30761 ?auto_30768 ?auto_30766 )
      ( MAKE-ON ?auto_30761 ?auto_30762 )
      ( MAKE-ON-VERIFY ?auto_30761 ?auto_30762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30769 - SURFACE
      ?auto_30770 - SURFACE
    )
    :vars
    (
      ?auto_30776 - HOIST
      ?auto_30775 - PLACE
      ?auto_30772 - PLACE
      ?auto_30771 - HOIST
      ?auto_30773 - SURFACE
      ?auto_30774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30776 ?auto_30775 ) ( SURFACE-AT ?auto_30770 ?auto_30775 ) ( CLEAR ?auto_30770 ) ( IS-CRATE ?auto_30769 ) ( not ( = ?auto_30769 ?auto_30770 ) ) ( AVAILABLE ?auto_30776 ) ( not ( = ?auto_30772 ?auto_30775 ) ) ( HOIST-AT ?auto_30771 ?auto_30772 ) ( not ( = ?auto_30776 ?auto_30771 ) ) ( AVAILABLE ?auto_30771 ) ( SURFACE-AT ?auto_30769 ?auto_30772 ) ( ON ?auto_30769 ?auto_30773 ) ( CLEAR ?auto_30769 ) ( not ( = ?auto_30769 ?auto_30773 ) ) ( not ( = ?auto_30770 ?auto_30773 ) ) ( TRUCK-AT ?auto_30774 ?auto_30775 ) )
    :subtasks
    ( ( !DRIVE ?auto_30774 ?auto_30775 ?auto_30772 )
      ( MAKE-ON ?auto_30769 ?auto_30770 )
      ( MAKE-ON-VERIFY ?auto_30769 ?auto_30770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30777 - SURFACE
      ?auto_30778 - SURFACE
    )
    :vars
    (
      ?auto_30781 - HOIST
      ?auto_30784 - PLACE
      ?auto_30780 - PLACE
      ?auto_30782 - HOIST
      ?auto_30779 - SURFACE
      ?auto_30783 - TRUCK
      ?auto_30785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30781 ?auto_30784 ) ( IS-CRATE ?auto_30777 ) ( not ( = ?auto_30777 ?auto_30778 ) ) ( not ( = ?auto_30780 ?auto_30784 ) ) ( HOIST-AT ?auto_30782 ?auto_30780 ) ( not ( = ?auto_30781 ?auto_30782 ) ) ( AVAILABLE ?auto_30782 ) ( SURFACE-AT ?auto_30777 ?auto_30780 ) ( ON ?auto_30777 ?auto_30779 ) ( CLEAR ?auto_30777 ) ( not ( = ?auto_30777 ?auto_30779 ) ) ( not ( = ?auto_30778 ?auto_30779 ) ) ( TRUCK-AT ?auto_30783 ?auto_30784 ) ( SURFACE-AT ?auto_30785 ?auto_30784 ) ( CLEAR ?auto_30785 ) ( LIFTING ?auto_30781 ?auto_30778 ) ( IS-CRATE ?auto_30778 ) ( not ( = ?auto_30777 ?auto_30785 ) ) ( not ( = ?auto_30778 ?auto_30785 ) ) ( not ( = ?auto_30779 ?auto_30785 ) ) )
    :subtasks
    ( ( !DROP ?auto_30781 ?auto_30778 ?auto_30785 ?auto_30784 )
      ( MAKE-ON ?auto_30777 ?auto_30778 )
      ( MAKE-ON-VERIFY ?auto_30777 ?auto_30778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30786 - SURFACE
      ?auto_30787 - SURFACE
    )
    :vars
    (
      ?auto_30792 - HOIST
      ?auto_30788 - PLACE
      ?auto_30791 - PLACE
      ?auto_30793 - HOIST
      ?auto_30794 - SURFACE
      ?auto_30790 - TRUCK
      ?auto_30789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30792 ?auto_30788 ) ( IS-CRATE ?auto_30786 ) ( not ( = ?auto_30786 ?auto_30787 ) ) ( not ( = ?auto_30791 ?auto_30788 ) ) ( HOIST-AT ?auto_30793 ?auto_30791 ) ( not ( = ?auto_30792 ?auto_30793 ) ) ( AVAILABLE ?auto_30793 ) ( SURFACE-AT ?auto_30786 ?auto_30791 ) ( ON ?auto_30786 ?auto_30794 ) ( CLEAR ?auto_30786 ) ( not ( = ?auto_30786 ?auto_30794 ) ) ( not ( = ?auto_30787 ?auto_30794 ) ) ( TRUCK-AT ?auto_30790 ?auto_30788 ) ( SURFACE-AT ?auto_30789 ?auto_30788 ) ( CLEAR ?auto_30789 ) ( IS-CRATE ?auto_30787 ) ( not ( = ?auto_30786 ?auto_30789 ) ) ( not ( = ?auto_30787 ?auto_30789 ) ) ( not ( = ?auto_30794 ?auto_30789 ) ) ( AVAILABLE ?auto_30792 ) ( IN ?auto_30787 ?auto_30790 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30792 ?auto_30787 ?auto_30790 ?auto_30788 )
      ( MAKE-ON ?auto_30786 ?auto_30787 )
      ( MAKE-ON-VERIFY ?auto_30786 ?auto_30787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30795 - SURFACE
      ?auto_30796 - SURFACE
    )
    :vars
    (
      ?auto_30802 - HOIST
      ?auto_30799 - PLACE
      ?auto_30803 - PLACE
      ?auto_30800 - HOIST
      ?auto_30801 - SURFACE
      ?auto_30798 - SURFACE
      ?auto_30797 - TRUCK
      ?auto_30804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30802 ?auto_30799 ) ( IS-CRATE ?auto_30795 ) ( not ( = ?auto_30795 ?auto_30796 ) ) ( not ( = ?auto_30803 ?auto_30799 ) ) ( HOIST-AT ?auto_30800 ?auto_30803 ) ( not ( = ?auto_30802 ?auto_30800 ) ) ( AVAILABLE ?auto_30800 ) ( SURFACE-AT ?auto_30795 ?auto_30803 ) ( ON ?auto_30795 ?auto_30801 ) ( CLEAR ?auto_30795 ) ( not ( = ?auto_30795 ?auto_30801 ) ) ( not ( = ?auto_30796 ?auto_30801 ) ) ( SURFACE-AT ?auto_30798 ?auto_30799 ) ( CLEAR ?auto_30798 ) ( IS-CRATE ?auto_30796 ) ( not ( = ?auto_30795 ?auto_30798 ) ) ( not ( = ?auto_30796 ?auto_30798 ) ) ( not ( = ?auto_30801 ?auto_30798 ) ) ( AVAILABLE ?auto_30802 ) ( IN ?auto_30796 ?auto_30797 ) ( TRUCK-AT ?auto_30797 ?auto_30804 ) ( not ( = ?auto_30804 ?auto_30799 ) ) ( not ( = ?auto_30803 ?auto_30804 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30797 ?auto_30804 ?auto_30799 )
      ( MAKE-ON ?auto_30795 ?auto_30796 )
      ( MAKE-ON-VERIFY ?auto_30795 ?auto_30796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30805 - SURFACE
      ?auto_30806 - SURFACE
    )
    :vars
    (
      ?auto_30807 - HOIST
      ?auto_30810 - PLACE
      ?auto_30813 - PLACE
      ?auto_30809 - HOIST
      ?auto_30812 - SURFACE
      ?auto_30811 - SURFACE
      ?auto_30808 - TRUCK
      ?auto_30814 - PLACE
      ?auto_30815 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30807 ?auto_30810 ) ( IS-CRATE ?auto_30805 ) ( not ( = ?auto_30805 ?auto_30806 ) ) ( not ( = ?auto_30813 ?auto_30810 ) ) ( HOIST-AT ?auto_30809 ?auto_30813 ) ( not ( = ?auto_30807 ?auto_30809 ) ) ( AVAILABLE ?auto_30809 ) ( SURFACE-AT ?auto_30805 ?auto_30813 ) ( ON ?auto_30805 ?auto_30812 ) ( CLEAR ?auto_30805 ) ( not ( = ?auto_30805 ?auto_30812 ) ) ( not ( = ?auto_30806 ?auto_30812 ) ) ( SURFACE-AT ?auto_30811 ?auto_30810 ) ( CLEAR ?auto_30811 ) ( IS-CRATE ?auto_30806 ) ( not ( = ?auto_30805 ?auto_30811 ) ) ( not ( = ?auto_30806 ?auto_30811 ) ) ( not ( = ?auto_30812 ?auto_30811 ) ) ( AVAILABLE ?auto_30807 ) ( TRUCK-AT ?auto_30808 ?auto_30814 ) ( not ( = ?auto_30814 ?auto_30810 ) ) ( not ( = ?auto_30813 ?auto_30814 ) ) ( HOIST-AT ?auto_30815 ?auto_30814 ) ( LIFTING ?auto_30815 ?auto_30806 ) ( not ( = ?auto_30807 ?auto_30815 ) ) ( not ( = ?auto_30809 ?auto_30815 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30815 ?auto_30806 ?auto_30808 ?auto_30814 )
      ( MAKE-ON ?auto_30805 ?auto_30806 )
      ( MAKE-ON-VERIFY ?auto_30805 ?auto_30806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30816 - SURFACE
      ?auto_30817 - SURFACE
    )
    :vars
    (
      ?auto_30823 - HOIST
      ?auto_30819 - PLACE
      ?auto_30821 - PLACE
      ?auto_30824 - HOIST
      ?auto_30825 - SURFACE
      ?auto_30820 - SURFACE
      ?auto_30818 - TRUCK
      ?auto_30826 - PLACE
      ?auto_30822 - HOIST
      ?auto_30827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30823 ?auto_30819 ) ( IS-CRATE ?auto_30816 ) ( not ( = ?auto_30816 ?auto_30817 ) ) ( not ( = ?auto_30821 ?auto_30819 ) ) ( HOIST-AT ?auto_30824 ?auto_30821 ) ( not ( = ?auto_30823 ?auto_30824 ) ) ( AVAILABLE ?auto_30824 ) ( SURFACE-AT ?auto_30816 ?auto_30821 ) ( ON ?auto_30816 ?auto_30825 ) ( CLEAR ?auto_30816 ) ( not ( = ?auto_30816 ?auto_30825 ) ) ( not ( = ?auto_30817 ?auto_30825 ) ) ( SURFACE-AT ?auto_30820 ?auto_30819 ) ( CLEAR ?auto_30820 ) ( IS-CRATE ?auto_30817 ) ( not ( = ?auto_30816 ?auto_30820 ) ) ( not ( = ?auto_30817 ?auto_30820 ) ) ( not ( = ?auto_30825 ?auto_30820 ) ) ( AVAILABLE ?auto_30823 ) ( TRUCK-AT ?auto_30818 ?auto_30826 ) ( not ( = ?auto_30826 ?auto_30819 ) ) ( not ( = ?auto_30821 ?auto_30826 ) ) ( HOIST-AT ?auto_30822 ?auto_30826 ) ( not ( = ?auto_30823 ?auto_30822 ) ) ( not ( = ?auto_30824 ?auto_30822 ) ) ( AVAILABLE ?auto_30822 ) ( SURFACE-AT ?auto_30817 ?auto_30826 ) ( ON ?auto_30817 ?auto_30827 ) ( CLEAR ?auto_30817 ) ( not ( = ?auto_30816 ?auto_30827 ) ) ( not ( = ?auto_30817 ?auto_30827 ) ) ( not ( = ?auto_30825 ?auto_30827 ) ) ( not ( = ?auto_30820 ?auto_30827 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30822 ?auto_30817 ?auto_30827 ?auto_30826 )
      ( MAKE-ON ?auto_30816 ?auto_30817 )
      ( MAKE-ON-VERIFY ?auto_30816 ?auto_30817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30828 - SURFACE
      ?auto_30829 - SURFACE
    )
    :vars
    (
      ?auto_30832 - HOIST
      ?auto_30839 - PLACE
      ?auto_30834 - PLACE
      ?auto_30830 - HOIST
      ?auto_30838 - SURFACE
      ?auto_30833 - SURFACE
      ?auto_30836 - PLACE
      ?auto_30837 - HOIST
      ?auto_30835 - SURFACE
      ?auto_30831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30832 ?auto_30839 ) ( IS-CRATE ?auto_30828 ) ( not ( = ?auto_30828 ?auto_30829 ) ) ( not ( = ?auto_30834 ?auto_30839 ) ) ( HOIST-AT ?auto_30830 ?auto_30834 ) ( not ( = ?auto_30832 ?auto_30830 ) ) ( AVAILABLE ?auto_30830 ) ( SURFACE-AT ?auto_30828 ?auto_30834 ) ( ON ?auto_30828 ?auto_30838 ) ( CLEAR ?auto_30828 ) ( not ( = ?auto_30828 ?auto_30838 ) ) ( not ( = ?auto_30829 ?auto_30838 ) ) ( SURFACE-AT ?auto_30833 ?auto_30839 ) ( CLEAR ?auto_30833 ) ( IS-CRATE ?auto_30829 ) ( not ( = ?auto_30828 ?auto_30833 ) ) ( not ( = ?auto_30829 ?auto_30833 ) ) ( not ( = ?auto_30838 ?auto_30833 ) ) ( AVAILABLE ?auto_30832 ) ( not ( = ?auto_30836 ?auto_30839 ) ) ( not ( = ?auto_30834 ?auto_30836 ) ) ( HOIST-AT ?auto_30837 ?auto_30836 ) ( not ( = ?auto_30832 ?auto_30837 ) ) ( not ( = ?auto_30830 ?auto_30837 ) ) ( AVAILABLE ?auto_30837 ) ( SURFACE-AT ?auto_30829 ?auto_30836 ) ( ON ?auto_30829 ?auto_30835 ) ( CLEAR ?auto_30829 ) ( not ( = ?auto_30828 ?auto_30835 ) ) ( not ( = ?auto_30829 ?auto_30835 ) ) ( not ( = ?auto_30838 ?auto_30835 ) ) ( not ( = ?auto_30833 ?auto_30835 ) ) ( TRUCK-AT ?auto_30831 ?auto_30839 ) )
    :subtasks
    ( ( !DRIVE ?auto_30831 ?auto_30839 ?auto_30836 )
      ( MAKE-ON ?auto_30828 ?auto_30829 )
      ( MAKE-ON-VERIFY ?auto_30828 ?auto_30829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30840 - SURFACE
      ?auto_30841 - SURFACE
    )
    :vars
    (
      ?auto_30850 - HOIST
      ?auto_30842 - PLACE
      ?auto_30849 - PLACE
      ?auto_30845 - HOIST
      ?auto_30848 - SURFACE
      ?auto_30846 - SURFACE
      ?auto_30844 - PLACE
      ?auto_30843 - HOIST
      ?auto_30851 - SURFACE
      ?auto_30847 - TRUCK
      ?auto_30852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30850 ?auto_30842 ) ( IS-CRATE ?auto_30840 ) ( not ( = ?auto_30840 ?auto_30841 ) ) ( not ( = ?auto_30849 ?auto_30842 ) ) ( HOIST-AT ?auto_30845 ?auto_30849 ) ( not ( = ?auto_30850 ?auto_30845 ) ) ( AVAILABLE ?auto_30845 ) ( SURFACE-AT ?auto_30840 ?auto_30849 ) ( ON ?auto_30840 ?auto_30848 ) ( CLEAR ?auto_30840 ) ( not ( = ?auto_30840 ?auto_30848 ) ) ( not ( = ?auto_30841 ?auto_30848 ) ) ( IS-CRATE ?auto_30841 ) ( not ( = ?auto_30840 ?auto_30846 ) ) ( not ( = ?auto_30841 ?auto_30846 ) ) ( not ( = ?auto_30848 ?auto_30846 ) ) ( not ( = ?auto_30844 ?auto_30842 ) ) ( not ( = ?auto_30849 ?auto_30844 ) ) ( HOIST-AT ?auto_30843 ?auto_30844 ) ( not ( = ?auto_30850 ?auto_30843 ) ) ( not ( = ?auto_30845 ?auto_30843 ) ) ( AVAILABLE ?auto_30843 ) ( SURFACE-AT ?auto_30841 ?auto_30844 ) ( ON ?auto_30841 ?auto_30851 ) ( CLEAR ?auto_30841 ) ( not ( = ?auto_30840 ?auto_30851 ) ) ( not ( = ?auto_30841 ?auto_30851 ) ) ( not ( = ?auto_30848 ?auto_30851 ) ) ( not ( = ?auto_30846 ?auto_30851 ) ) ( TRUCK-AT ?auto_30847 ?auto_30842 ) ( SURFACE-AT ?auto_30852 ?auto_30842 ) ( CLEAR ?auto_30852 ) ( LIFTING ?auto_30850 ?auto_30846 ) ( IS-CRATE ?auto_30846 ) ( not ( = ?auto_30840 ?auto_30852 ) ) ( not ( = ?auto_30841 ?auto_30852 ) ) ( not ( = ?auto_30848 ?auto_30852 ) ) ( not ( = ?auto_30846 ?auto_30852 ) ) ( not ( = ?auto_30851 ?auto_30852 ) ) )
    :subtasks
    ( ( !DROP ?auto_30850 ?auto_30846 ?auto_30852 ?auto_30842 )
      ( MAKE-ON ?auto_30840 ?auto_30841 )
      ( MAKE-ON-VERIFY ?auto_30840 ?auto_30841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30853 - SURFACE
      ?auto_30854 - SURFACE
    )
    :vars
    (
      ?auto_30863 - HOIST
      ?auto_30864 - PLACE
      ?auto_30855 - PLACE
      ?auto_30858 - HOIST
      ?auto_30861 - SURFACE
      ?auto_30860 - SURFACE
      ?auto_30865 - PLACE
      ?auto_30859 - HOIST
      ?auto_30856 - SURFACE
      ?auto_30857 - TRUCK
      ?auto_30862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30863 ?auto_30864 ) ( IS-CRATE ?auto_30853 ) ( not ( = ?auto_30853 ?auto_30854 ) ) ( not ( = ?auto_30855 ?auto_30864 ) ) ( HOIST-AT ?auto_30858 ?auto_30855 ) ( not ( = ?auto_30863 ?auto_30858 ) ) ( AVAILABLE ?auto_30858 ) ( SURFACE-AT ?auto_30853 ?auto_30855 ) ( ON ?auto_30853 ?auto_30861 ) ( CLEAR ?auto_30853 ) ( not ( = ?auto_30853 ?auto_30861 ) ) ( not ( = ?auto_30854 ?auto_30861 ) ) ( IS-CRATE ?auto_30854 ) ( not ( = ?auto_30853 ?auto_30860 ) ) ( not ( = ?auto_30854 ?auto_30860 ) ) ( not ( = ?auto_30861 ?auto_30860 ) ) ( not ( = ?auto_30865 ?auto_30864 ) ) ( not ( = ?auto_30855 ?auto_30865 ) ) ( HOIST-AT ?auto_30859 ?auto_30865 ) ( not ( = ?auto_30863 ?auto_30859 ) ) ( not ( = ?auto_30858 ?auto_30859 ) ) ( AVAILABLE ?auto_30859 ) ( SURFACE-AT ?auto_30854 ?auto_30865 ) ( ON ?auto_30854 ?auto_30856 ) ( CLEAR ?auto_30854 ) ( not ( = ?auto_30853 ?auto_30856 ) ) ( not ( = ?auto_30854 ?auto_30856 ) ) ( not ( = ?auto_30861 ?auto_30856 ) ) ( not ( = ?auto_30860 ?auto_30856 ) ) ( TRUCK-AT ?auto_30857 ?auto_30864 ) ( SURFACE-AT ?auto_30862 ?auto_30864 ) ( CLEAR ?auto_30862 ) ( IS-CRATE ?auto_30860 ) ( not ( = ?auto_30853 ?auto_30862 ) ) ( not ( = ?auto_30854 ?auto_30862 ) ) ( not ( = ?auto_30861 ?auto_30862 ) ) ( not ( = ?auto_30860 ?auto_30862 ) ) ( not ( = ?auto_30856 ?auto_30862 ) ) ( AVAILABLE ?auto_30863 ) ( IN ?auto_30860 ?auto_30857 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30863 ?auto_30860 ?auto_30857 ?auto_30864 )
      ( MAKE-ON ?auto_30853 ?auto_30854 )
      ( MAKE-ON-VERIFY ?auto_30853 ?auto_30854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30866 - SURFACE
      ?auto_30867 - SURFACE
    )
    :vars
    (
      ?auto_30871 - HOIST
      ?auto_30878 - PLACE
      ?auto_30872 - PLACE
      ?auto_30869 - HOIST
      ?auto_30877 - SURFACE
      ?auto_30873 - SURFACE
      ?auto_30876 - PLACE
      ?auto_30868 - HOIST
      ?auto_30870 - SURFACE
      ?auto_30875 - SURFACE
      ?auto_30874 - TRUCK
      ?auto_30879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30871 ?auto_30878 ) ( IS-CRATE ?auto_30866 ) ( not ( = ?auto_30866 ?auto_30867 ) ) ( not ( = ?auto_30872 ?auto_30878 ) ) ( HOIST-AT ?auto_30869 ?auto_30872 ) ( not ( = ?auto_30871 ?auto_30869 ) ) ( AVAILABLE ?auto_30869 ) ( SURFACE-AT ?auto_30866 ?auto_30872 ) ( ON ?auto_30866 ?auto_30877 ) ( CLEAR ?auto_30866 ) ( not ( = ?auto_30866 ?auto_30877 ) ) ( not ( = ?auto_30867 ?auto_30877 ) ) ( IS-CRATE ?auto_30867 ) ( not ( = ?auto_30866 ?auto_30873 ) ) ( not ( = ?auto_30867 ?auto_30873 ) ) ( not ( = ?auto_30877 ?auto_30873 ) ) ( not ( = ?auto_30876 ?auto_30878 ) ) ( not ( = ?auto_30872 ?auto_30876 ) ) ( HOIST-AT ?auto_30868 ?auto_30876 ) ( not ( = ?auto_30871 ?auto_30868 ) ) ( not ( = ?auto_30869 ?auto_30868 ) ) ( AVAILABLE ?auto_30868 ) ( SURFACE-AT ?auto_30867 ?auto_30876 ) ( ON ?auto_30867 ?auto_30870 ) ( CLEAR ?auto_30867 ) ( not ( = ?auto_30866 ?auto_30870 ) ) ( not ( = ?auto_30867 ?auto_30870 ) ) ( not ( = ?auto_30877 ?auto_30870 ) ) ( not ( = ?auto_30873 ?auto_30870 ) ) ( SURFACE-AT ?auto_30875 ?auto_30878 ) ( CLEAR ?auto_30875 ) ( IS-CRATE ?auto_30873 ) ( not ( = ?auto_30866 ?auto_30875 ) ) ( not ( = ?auto_30867 ?auto_30875 ) ) ( not ( = ?auto_30877 ?auto_30875 ) ) ( not ( = ?auto_30873 ?auto_30875 ) ) ( not ( = ?auto_30870 ?auto_30875 ) ) ( AVAILABLE ?auto_30871 ) ( IN ?auto_30873 ?auto_30874 ) ( TRUCK-AT ?auto_30874 ?auto_30879 ) ( not ( = ?auto_30879 ?auto_30878 ) ) ( not ( = ?auto_30872 ?auto_30879 ) ) ( not ( = ?auto_30876 ?auto_30879 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30874 ?auto_30879 ?auto_30878 )
      ( MAKE-ON ?auto_30866 ?auto_30867 )
      ( MAKE-ON-VERIFY ?auto_30866 ?auto_30867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30880 - SURFACE
      ?auto_30881 - SURFACE
    )
    :vars
    (
      ?auto_30885 - HOIST
      ?auto_30886 - PLACE
      ?auto_30887 - PLACE
      ?auto_30883 - HOIST
      ?auto_30890 - SURFACE
      ?auto_30888 - SURFACE
      ?auto_30884 - PLACE
      ?auto_30892 - HOIST
      ?auto_30893 - SURFACE
      ?auto_30889 - SURFACE
      ?auto_30891 - TRUCK
      ?auto_30882 - PLACE
      ?auto_30894 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30885 ?auto_30886 ) ( IS-CRATE ?auto_30880 ) ( not ( = ?auto_30880 ?auto_30881 ) ) ( not ( = ?auto_30887 ?auto_30886 ) ) ( HOIST-AT ?auto_30883 ?auto_30887 ) ( not ( = ?auto_30885 ?auto_30883 ) ) ( AVAILABLE ?auto_30883 ) ( SURFACE-AT ?auto_30880 ?auto_30887 ) ( ON ?auto_30880 ?auto_30890 ) ( CLEAR ?auto_30880 ) ( not ( = ?auto_30880 ?auto_30890 ) ) ( not ( = ?auto_30881 ?auto_30890 ) ) ( IS-CRATE ?auto_30881 ) ( not ( = ?auto_30880 ?auto_30888 ) ) ( not ( = ?auto_30881 ?auto_30888 ) ) ( not ( = ?auto_30890 ?auto_30888 ) ) ( not ( = ?auto_30884 ?auto_30886 ) ) ( not ( = ?auto_30887 ?auto_30884 ) ) ( HOIST-AT ?auto_30892 ?auto_30884 ) ( not ( = ?auto_30885 ?auto_30892 ) ) ( not ( = ?auto_30883 ?auto_30892 ) ) ( AVAILABLE ?auto_30892 ) ( SURFACE-AT ?auto_30881 ?auto_30884 ) ( ON ?auto_30881 ?auto_30893 ) ( CLEAR ?auto_30881 ) ( not ( = ?auto_30880 ?auto_30893 ) ) ( not ( = ?auto_30881 ?auto_30893 ) ) ( not ( = ?auto_30890 ?auto_30893 ) ) ( not ( = ?auto_30888 ?auto_30893 ) ) ( SURFACE-AT ?auto_30889 ?auto_30886 ) ( CLEAR ?auto_30889 ) ( IS-CRATE ?auto_30888 ) ( not ( = ?auto_30880 ?auto_30889 ) ) ( not ( = ?auto_30881 ?auto_30889 ) ) ( not ( = ?auto_30890 ?auto_30889 ) ) ( not ( = ?auto_30888 ?auto_30889 ) ) ( not ( = ?auto_30893 ?auto_30889 ) ) ( AVAILABLE ?auto_30885 ) ( TRUCK-AT ?auto_30891 ?auto_30882 ) ( not ( = ?auto_30882 ?auto_30886 ) ) ( not ( = ?auto_30887 ?auto_30882 ) ) ( not ( = ?auto_30884 ?auto_30882 ) ) ( HOIST-AT ?auto_30894 ?auto_30882 ) ( LIFTING ?auto_30894 ?auto_30888 ) ( not ( = ?auto_30885 ?auto_30894 ) ) ( not ( = ?auto_30883 ?auto_30894 ) ) ( not ( = ?auto_30892 ?auto_30894 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30894 ?auto_30888 ?auto_30891 ?auto_30882 )
      ( MAKE-ON ?auto_30880 ?auto_30881 )
      ( MAKE-ON-VERIFY ?auto_30880 ?auto_30881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30895 - SURFACE
      ?auto_30896 - SURFACE
    )
    :vars
    (
      ?auto_30898 - HOIST
      ?auto_30899 - PLACE
      ?auto_30904 - PLACE
      ?auto_30903 - HOIST
      ?auto_30900 - SURFACE
      ?auto_30909 - SURFACE
      ?auto_30906 - PLACE
      ?auto_30897 - HOIST
      ?auto_30901 - SURFACE
      ?auto_30907 - SURFACE
      ?auto_30905 - TRUCK
      ?auto_30902 - PLACE
      ?auto_30908 - HOIST
      ?auto_30910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30898 ?auto_30899 ) ( IS-CRATE ?auto_30895 ) ( not ( = ?auto_30895 ?auto_30896 ) ) ( not ( = ?auto_30904 ?auto_30899 ) ) ( HOIST-AT ?auto_30903 ?auto_30904 ) ( not ( = ?auto_30898 ?auto_30903 ) ) ( AVAILABLE ?auto_30903 ) ( SURFACE-AT ?auto_30895 ?auto_30904 ) ( ON ?auto_30895 ?auto_30900 ) ( CLEAR ?auto_30895 ) ( not ( = ?auto_30895 ?auto_30900 ) ) ( not ( = ?auto_30896 ?auto_30900 ) ) ( IS-CRATE ?auto_30896 ) ( not ( = ?auto_30895 ?auto_30909 ) ) ( not ( = ?auto_30896 ?auto_30909 ) ) ( not ( = ?auto_30900 ?auto_30909 ) ) ( not ( = ?auto_30906 ?auto_30899 ) ) ( not ( = ?auto_30904 ?auto_30906 ) ) ( HOIST-AT ?auto_30897 ?auto_30906 ) ( not ( = ?auto_30898 ?auto_30897 ) ) ( not ( = ?auto_30903 ?auto_30897 ) ) ( AVAILABLE ?auto_30897 ) ( SURFACE-AT ?auto_30896 ?auto_30906 ) ( ON ?auto_30896 ?auto_30901 ) ( CLEAR ?auto_30896 ) ( not ( = ?auto_30895 ?auto_30901 ) ) ( not ( = ?auto_30896 ?auto_30901 ) ) ( not ( = ?auto_30900 ?auto_30901 ) ) ( not ( = ?auto_30909 ?auto_30901 ) ) ( SURFACE-AT ?auto_30907 ?auto_30899 ) ( CLEAR ?auto_30907 ) ( IS-CRATE ?auto_30909 ) ( not ( = ?auto_30895 ?auto_30907 ) ) ( not ( = ?auto_30896 ?auto_30907 ) ) ( not ( = ?auto_30900 ?auto_30907 ) ) ( not ( = ?auto_30909 ?auto_30907 ) ) ( not ( = ?auto_30901 ?auto_30907 ) ) ( AVAILABLE ?auto_30898 ) ( TRUCK-AT ?auto_30905 ?auto_30902 ) ( not ( = ?auto_30902 ?auto_30899 ) ) ( not ( = ?auto_30904 ?auto_30902 ) ) ( not ( = ?auto_30906 ?auto_30902 ) ) ( HOIST-AT ?auto_30908 ?auto_30902 ) ( not ( = ?auto_30898 ?auto_30908 ) ) ( not ( = ?auto_30903 ?auto_30908 ) ) ( not ( = ?auto_30897 ?auto_30908 ) ) ( AVAILABLE ?auto_30908 ) ( SURFACE-AT ?auto_30909 ?auto_30902 ) ( ON ?auto_30909 ?auto_30910 ) ( CLEAR ?auto_30909 ) ( not ( = ?auto_30895 ?auto_30910 ) ) ( not ( = ?auto_30896 ?auto_30910 ) ) ( not ( = ?auto_30900 ?auto_30910 ) ) ( not ( = ?auto_30909 ?auto_30910 ) ) ( not ( = ?auto_30901 ?auto_30910 ) ) ( not ( = ?auto_30907 ?auto_30910 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30908 ?auto_30909 ?auto_30910 ?auto_30902 )
      ( MAKE-ON ?auto_30895 ?auto_30896 )
      ( MAKE-ON-VERIFY ?auto_30895 ?auto_30896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30911 - SURFACE
      ?auto_30912 - SURFACE
    )
    :vars
    (
      ?auto_30919 - HOIST
      ?auto_30921 - PLACE
      ?auto_30925 - PLACE
      ?auto_30924 - HOIST
      ?auto_30920 - SURFACE
      ?auto_30923 - SURFACE
      ?auto_30922 - PLACE
      ?auto_30915 - HOIST
      ?auto_30918 - SURFACE
      ?auto_30913 - SURFACE
      ?auto_30917 - PLACE
      ?auto_30914 - HOIST
      ?auto_30926 - SURFACE
      ?auto_30916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30919 ?auto_30921 ) ( IS-CRATE ?auto_30911 ) ( not ( = ?auto_30911 ?auto_30912 ) ) ( not ( = ?auto_30925 ?auto_30921 ) ) ( HOIST-AT ?auto_30924 ?auto_30925 ) ( not ( = ?auto_30919 ?auto_30924 ) ) ( AVAILABLE ?auto_30924 ) ( SURFACE-AT ?auto_30911 ?auto_30925 ) ( ON ?auto_30911 ?auto_30920 ) ( CLEAR ?auto_30911 ) ( not ( = ?auto_30911 ?auto_30920 ) ) ( not ( = ?auto_30912 ?auto_30920 ) ) ( IS-CRATE ?auto_30912 ) ( not ( = ?auto_30911 ?auto_30923 ) ) ( not ( = ?auto_30912 ?auto_30923 ) ) ( not ( = ?auto_30920 ?auto_30923 ) ) ( not ( = ?auto_30922 ?auto_30921 ) ) ( not ( = ?auto_30925 ?auto_30922 ) ) ( HOIST-AT ?auto_30915 ?auto_30922 ) ( not ( = ?auto_30919 ?auto_30915 ) ) ( not ( = ?auto_30924 ?auto_30915 ) ) ( AVAILABLE ?auto_30915 ) ( SURFACE-AT ?auto_30912 ?auto_30922 ) ( ON ?auto_30912 ?auto_30918 ) ( CLEAR ?auto_30912 ) ( not ( = ?auto_30911 ?auto_30918 ) ) ( not ( = ?auto_30912 ?auto_30918 ) ) ( not ( = ?auto_30920 ?auto_30918 ) ) ( not ( = ?auto_30923 ?auto_30918 ) ) ( SURFACE-AT ?auto_30913 ?auto_30921 ) ( CLEAR ?auto_30913 ) ( IS-CRATE ?auto_30923 ) ( not ( = ?auto_30911 ?auto_30913 ) ) ( not ( = ?auto_30912 ?auto_30913 ) ) ( not ( = ?auto_30920 ?auto_30913 ) ) ( not ( = ?auto_30923 ?auto_30913 ) ) ( not ( = ?auto_30918 ?auto_30913 ) ) ( AVAILABLE ?auto_30919 ) ( not ( = ?auto_30917 ?auto_30921 ) ) ( not ( = ?auto_30925 ?auto_30917 ) ) ( not ( = ?auto_30922 ?auto_30917 ) ) ( HOIST-AT ?auto_30914 ?auto_30917 ) ( not ( = ?auto_30919 ?auto_30914 ) ) ( not ( = ?auto_30924 ?auto_30914 ) ) ( not ( = ?auto_30915 ?auto_30914 ) ) ( AVAILABLE ?auto_30914 ) ( SURFACE-AT ?auto_30923 ?auto_30917 ) ( ON ?auto_30923 ?auto_30926 ) ( CLEAR ?auto_30923 ) ( not ( = ?auto_30911 ?auto_30926 ) ) ( not ( = ?auto_30912 ?auto_30926 ) ) ( not ( = ?auto_30920 ?auto_30926 ) ) ( not ( = ?auto_30923 ?auto_30926 ) ) ( not ( = ?auto_30918 ?auto_30926 ) ) ( not ( = ?auto_30913 ?auto_30926 ) ) ( TRUCK-AT ?auto_30916 ?auto_30921 ) )
    :subtasks
    ( ( !DRIVE ?auto_30916 ?auto_30921 ?auto_30917 )
      ( MAKE-ON ?auto_30911 ?auto_30912 )
      ( MAKE-ON-VERIFY ?auto_30911 ?auto_30912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30927 - SURFACE
      ?auto_30928 - SURFACE
    )
    :vars
    (
      ?auto_30938 - HOIST
      ?auto_30931 - PLACE
      ?auto_30929 - PLACE
      ?auto_30937 - HOIST
      ?auto_30933 - SURFACE
      ?auto_30930 - SURFACE
      ?auto_30942 - PLACE
      ?auto_30932 - HOIST
      ?auto_30941 - SURFACE
      ?auto_30940 - SURFACE
      ?auto_30939 - PLACE
      ?auto_30934 - HOIST
      ?auto_30935 - SURFACE
      ?auto_30936 - TRUCK
      ?auto_30943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30938 ?auto_30931 ) ( IS-CRATE ?auto_30927 ) ( not ( = ?auto_30927 ?auto_30928 ) ) ( not ( = ?auto_30929 ?auto_30931 ) ) ( HOIST-AT ?auto_30937 ?auto_30929 ) ( not ( = ?auto_30938 ?auto_30937 ) ) ( AVAILABLE ?auto_30937 ) ( SURFACE-AT ?auto_30927 ?auto_30929 ) ( ON ?auto_30927 ?auto_30933 ) ( CLEAR ?auto_30927 ) ( not ( = ?auto_30927 ?auto_30933 ) ) ( not ( = ?auto_30928 ?auto_30933 ) ) ( IS-CRATE ?auto_30928 ) ( not ( = ?auto_30927 ?auto_30930 ) ) ( not ( = ?auto_30928 ?auto_30930 ) ) ( not ( = ?auto_30933 ?auto_30930 ) ) ( not ( = ?auto_30942 ?auto_30931 ) ) ( not ( = ?auto_30929 ?auto_30942 ) ) ( HOIST-AT ?auto_30932 ?auto_30942 ) ( not ( = ?auto_30938 ?auto_30932 ) ) ( not ( = ?auto_30937 ?auto_30932 ) ) ( AVAILABLE ?auto_30932 ) ( SURFACE-AT ?auto_30928 ?auto_30942 ) ( ON ?auto_30928 ?auto_30941 ) ( CLEAR ?auto_30928 ) ( not ( = ?auto_30927 ?auto_30941 ) ) ( not ( = ?auto_30928 ?auto_30941 ) ) ( not ( = ?auto_30933 ?auto_30941 ) ) ( not ( = ?auto_30930 ?auto_30941 ) ) ( IS-CRATE ?auto_30930 ) ( not ( = ?auto_30927 ?auto_30940 ) ) ( not ( = ?auto_30928 ?auto_30940 ) ) ( not ( = ?auto_30933 ?auto_30940 ) ) ( not ( = ?auto_30930 ?auto_30940 ) ) ( not ( = ?auto_30941 ?auto_30940 ) ) ( not ( = ?auto_30939 ?auto_30931 ) ) ( not ( = ?auto_30929 ?auto_30939 ) ) ( not ( = ?auto_30942 ?auto_30939 ) ) ( HOIST-AT ?auto_30934 ?auto_30939 ) ( not ( = ?auto_30938 ?auto_30934 ) ) ( not ( = ?auto_30937 ?auto_30934 ) ) ( not ( = ?auto_30932 ?auto_30934 ) ) ( AVAILABLE ?auto_30934 ) ( SURFACE-AT ?auto_30930 ?auto_30939 ) ( ON ?auto_30930 ?auto_30935 ) ( CLEAR ?auto_30930 ) ( not ( = ?auto_30927 ?auto_30935 ) ) ( not ( = ?auto_30928 ?auto_30935 ) ) ( not ( = ?auto_30933 ?auto_30935 ) ) ( not ( = ?auto_30930 ?auto_30935 ) ) ( not ( = ?auto_30941 ?auto_30935 ) ) ( not ( = ?auto_30940 ?auto_30935 ) ) ( TRUCK-AT ?auto_30936 ?auto_30931 ) ( SURFACE-AT ?auto_30943 ?auto_30931 ) ( CLEAR ?auto_30943 ) ( LIFTING ?auto_30938 ?auto_30940 ) ( IS-CRATE ?auto_30940 ) ( not ( = ?auto_30927 ?auto_30943 ) ) ( not ( = ?auto_30928 ?auto_30943 ) ) ( not ( = ?auto_30933 ?auto_30943 ) ) ( not ( = ?auto_30930 ?auto_30943 ) ) ( not ( = ?auto_30941 ?auto_30943 ) ) ( not ( = ?auto_30940 ?auto_30943 ) ) ( not ( = ?auto_30935 ?auto_30943 ) ) )
    :subtasks
    ( ( !DROP ?auto_30938 ?auto_30940 ?auto_30943 ?auto_30931 )
      ( MAKE-ON ?auto_30927 ?auto_30928 )
      ( MAKE-ON-VERIFY ?auto_30927 ?auto_30928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30944 - SURFACE
      ?auto_30945 - SURFACE
    )
    :vars
    (
      ?auto_30955 - HOIST
      ?auto_30957 - PLACE
      ?auto_30956 - PLACE
      ?auto_30948 - HOIST
      ?auto_30959 - SURFACE
      ?auto_30953 - SURFACE
      ?auto_30952 - PLACE
      ?auto_30954 - HOIST
      ?auto_30958 - SURFACE
      ?auto_30947 - SURFACE
      ?auto_30960 - PLACE
      ?auto_30951 - HOIST
      ?auto_30946 - SURFACE
      ?auto_30950 - TRUCK
      ?auto_30949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30955 ?auto_30957 ) ( IS-CRATE ?auto_30944 ) ( not ( = ?auto_30944 ?auto_30945 ) ) ( not ( = ?auto_30956 ?auto_30957 ) ) ( HOIST-AT ?auto_30948 ?auto_30956 ) ( not ( = ?auto_30955 ?auto_30948 ) ) ( AVAILABLE ?auto_30948 ) ( SURFACE-AT ?auto_30944 ?auto_30956 ) ( ON ?auto_30944 ?auto_30959 ) ( CLEAR ?auto_30944 ) ( not ( = ?auto_30944 ?auto_30959 ) ) ( not ( = ?auto_30945 ?auto_30959 ) ) ( IS-CRATE ?auto_30945 ) ( not ( = ?auto_30944 ?auto_30953 ) ) ( not ( = ?auto_30945 ?auto_30953 ) ) ( not ( = ?auto_30959 ?auto_30953 ) ) ( not ( = ?auto_30952 ?auto_30957 ) ) ( not ( = ?auto_30956 ?auto_30952 ) ) ( HOIST-AT ?auto_30954 ?auto_30952 ) ( not ( = ?auto_30955 ?auto_30954 ) ) ( not ( = ?auto_30948 ?auto_30954 ) ) ( AVAILABLE ?auto_30954 ) ( SURFACE-AT ?auto_30945 ?auto_30952 ) ( ON ?auto_30945 ?auto_30958 ) ( CLEAR ?auto_30945 ) ( not ( = ?auto_30944 ?auto_30958 ) ) ( not ( = ?auto_30945 ?auto_30958 ) ) ( not ( = ?auto_30959 ?auto_30958 ) ) ( not ( = ?auto_30953 ?auto_30958 ) ) ( IS-CRATE ?auto_30953 ) ( not ( = ?auto_30944 ?auto_30947 ) ) ( not ( = ?auto_30945 ?auto_30947 ) ) ( not ( = ?auto_30959 ?auto_30947 ) ) ( not ( = ?auto_30953 ?auto_30947 ) ) ( not ( = ?auto_30958 ?auto_30947 ) ) ( not ( = ?auto_30960 ?auto_30957 ) ) ( not ( = ?auto_30956 ?auto_30960 ) ) ( not ( = ?auto_30952 ?auto_30960 ) ) ( HOIST-AT ?auto_30951 ?auto_30960 ) ( not ( = ?auto_30955 ?auto_30951 ) ) ( not ( = ?auto_30948 ?auto_30951 ) ) ( not ( = ?auto_30954 ?auto_30951 ) ) ( AVAILABLE ?auto_30951 ) ( SURFACE-AT ?auto_30953 ?auto_30960 ) ( ON ?auto_30953 ?auto_30946 ) ( CLEAR ?auto_30953 ) ( not ( = ?auto_30944 ?auto_30946 ) ) ( not ( = ?auto_30945 ?auto_30946 ) ) ( not ( = ?auto_30959 ?auto_30946 ) ) ( not ( = ?auto_30953 ?auto_30946 ) ) ( not ( = ?auto_30958 ?auto_30946 ) ) ( not ( = ?auto_30947 ?auto_30946 ) ) ( TRUCK-AT ?auto_30950 ?auto_30957 ) ( SURFACE-AT ?auto_30949 ?auto_30957 ) ( CLEAR ?auto_30949 ) ( IS-CRATE ?auto_30947 ) ( not ( = ?auto_30944 ?auto_30949 ) ) ( not ( = ?auto_30945 ?auto_30949 ) ) ( not ( = ?auto_30959 ?auto_30949 ) ) ( not ( = ?auto_30953 ?auto_30949 ) ) ( not ( = ?auto_30958 ?auto_30949 ) ) ( not ( = ?auto_30947 ?auto_30949 ) ) ( not ( = ?auto_30946 ?auto_30949 ) ) ( AVAILABLE ?auto_30955 ) ( IN ?auto_30947 ?auto_30950 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30955 ?auto_30947 ?auto_30950 ?auto_30957 )
      ( MAKE-ON ?auto_30944 ?auto_30945 )
      ( MAKE-ON-VERIFY ?auto_30944 ?auto_30945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30961 - SURFACE
      ?auto_30962 - SURFACE
    )
    :vars
    (
      ?auto_30977 - HOIST
      ?auto_30976 - PLACE
      ?auto_30972 - PLACE
      ?auto_30967 - HOIST
      ?auto_30971 - SURFACE
      ?auto_30975 - SURFACE
      ?auto_30963 - PLACE
      ?auto_30964 - HOIST
      ?auto_30970 - SURFACE
      ?auto_30969 - SURFACE
      ?auto_30973 - PLACE
      ?auto_30968 - HOIST
      ?auto_30965 - SURFACE
      ?auto_30966 - SURFACE
      ?auto_30974 - TRUCK
      ?auto_30978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30977 ?auto_30976 ) ( IS-CRATE ?auto_30961 ) ( not ( = ?auto_30961 ?auto_30962 ) ) ( not ( = ?auto_30972 ?auto_30976 ) ) ( HOIST-AT ?auto_30967 ?auto_30972 ) ( not ( = ?auto_30977 ?auto_30967 ) ) ( AVAILABLE ?auto_30967 ) ( SURFACE-AT ?auto_30961 ?auto_30972 ) ( ON ?auto_30961 ?auto_30971 ) ( CLEAR ?auto_30961 ) ( not ( = ?auto_30961 ?auto_30971 ) ) ( not ( = ?auto_30962 ?auto_30971 ) ) ( IS-CRATE ?auto_30962 ) ( not ( = ?auto_30961 ?auto_30975 ) ) ( not ( = ?auto_30962 ?auto_30975 ) ) ( not ( = ?auto_30971 ?auto_30975 ) ) ( not ( = ?auto_30963 ?auto_30976 ) ) ( not ( = ?auto_30972 ?auto_30963 ) ) ( HOIST-AT ?auto_30964 ?auto_30963 ) ( not ( = ?auto_30977 ?auto_30964 ) ) ( not ( = ?auto_30967 ?auto_30964 ) ) ( AVAILABLE ?auto_30964 ) ( SURFACE-AT ?auto_30962 ?auto_30963 ) ( ON ?auto_30962 ?auto_30970 ) ( CLEAR ?auto_30962 ) ( not ( = ?auto_30961 ?auto_30970 ) ) ( not ( = ?auto_30962 ?auto_30970 ) ) ( not ( = ?auto_30971 ?auto_30970 ) ) ( not ( = ?auto_30975 ?auto_30970 ) ) ( IS-CRATE ?auto_30975 ) ( not ( = ?auto_30961 ?auto_30969 ) ) ( not ( = ?auto_30962 ?auto_30969 ) ) ( not ( = ?auto_30971 ?auto_30969 ) ) ( not ( = ?auto_30975 ?auto_30969 ) ) ( not ( = ?auto_30970 ?auto_30969 ) ) ( not ( = ?auto_30973 ?auto_30976 ) ) ( not ( = ?auto_30972 ?auto_30973 ) ) ( not ( = ?auto_30963 ?auto_30973 ) ) ( HOIST-AT ?auto_30968 ?auto_30973 ) ( not ( = ?auto_30977 ?auto_30968 ) ) ( not ( = ?auto_30967 ?auto_30968 ) ) ( not ( = ?auto_30964 ?auto_30968 ) ) ( AVAILABLE ?auto_30968 ) ( SURFACE-AT ?auto_30975 ?auto_30973 ) ( ON ?auto_30975 ?auto_30965 ) ( CLEAR ?auto_30975 ) ( not ( = ?auto_30961 ?auto_30965 ) ) ( not ( = ?auto_30962 ?auto_30965 ) ) ( not ( = ?auto_30971 ?auto_30965 ) ) ( not ( = ?auto_30975 ?auto_30965 ) ) ( not ( = ?auto_30970 ?auto_30965 ) ) ( not ( = ?auto_30969 ?auto_30965 ) ) ( SURFACE-AT ?auto_30966 ?auto_30976 ) ( CLEAR ?auto_30966 ) ( IS-CRATE ?auto_30969 ) ( not ( = ?auto_30961 ?auto_30966 ) ) ( not ( = ?auto_30962 ?auto_30966 ) ) ( not ( = ?auto_30971 ?auto_30966 ) ) ( not ( = ?auto_30975 ?auto_30966 ) ) ( not ( = ?auto_30970 ?auto_30966 ) ) ( not ( = ?auto_30969 ?auto_30966 ) ) ( not ( = ?auto_30965 ?auto_30966 ) ) ( AVAILABLE ?auto_30977 ) ( IN ?auto_30969 ?auto_30974 ) ( TRUCK-AT ?auto_30974 ?auto_30978 ) ( not ( = ?auto_30978 ?auto_30976 ) ) ( not ( = ?auto_30972 ?auto_30978 ) ) ( not ( = ?auto_30963 ?auto_30978 ) ) ( not ( = ?auto_30973 ?auto_30978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30974 ?auto_30978 ?auto_30976 )
      ( MAKE-ON ?auto_30961 ?auto_30962 )
      ( MAKE-ON-VERIFY ?auto_30961 ?auto_30962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30979 - SURFACE
      ?auto_30980 - SURFACE
    )
    :vars
    (
      ?auto_30983 - HOIST
      ?auto_30981 - PLACE
      ?auto_30994 - PLACE
      ?auto_30995 - HOIST
      ?auto_30989 - SURFACE
      ?auto_30991 - SURFACE
      ?auto_30990 - PLACE
      ?auto_30986 - HOIST
      ?auto_30982 - SURFACE
      ?auto_30993 - SURFACE
      ?auto_30988 - PLACE
      ?auto_30985 - HOIST
      ?auto_30987 - SURFACE
      ?auto_30992 - SURFACE
      ?auto_30996 - TRUCK
      ?auto_30984 - PLACE
      ?auto_30997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30983 ?auto_30981 ) ( IS-CRATE ?auto_30979 ) ( not ( = ?auto_30979 ?auto_30980 ) ) ( not ( = ?auto_30994 ?auto_30981 ) ) ( HOIST-AT ?auto_30995 ?auto_30994 ) ( not ( = ?auto_30983 ?auto_30995 ) ) ( AVAILABLE ?auto_30995 ) ( SURFACE-AT ?auto_30979 ?auto_30994 ) ( ON ?auto_30979 ?auto_30989 ) ( CLEAR ?auto_30979 ) ( not ( = ?auto_30979 ?auto_30989 ) ) ( not ( = ?auto_30980 ?auto_30989 ) ) ( IS-CRATE ?auto_30980 ) ( not ( = ?auto_30979 ?auto_30991 ) ) ( not ( = ?auto_30980 ?auto_30991 ) ) ( not ( = ?auto_30989 ?auto_30991 ) ) ( not ( = ?auto_30990 ?auto_30981 ) ) ( not ( = ?auto_30994 ?auto_30990 ) ) ( HOIST-AT ?auto_30986 ?auto_30990 ) ( not ( = ?auto_30983 ?auto_30986 ) ) ( not ( = ?auto_30995 ?auto_30986 ) ) ( AVAILABLE ?auto_30986 ) ( SURFACE-AT ?auto_30980 ?auto_30990 ) ( ON ?auto_30980 ?auto_30982 ) ( CLEAR ?auto_30980 ) ( not ( = ?auto_30979 ?auto_30982 ) ) ( not ( = ?auto_30980 ?auto_30982 ) ) ( not ( = ?auto_30989 ?auto_30982 ) ) ( not ( = ?auto_30991 ?auto_30982 ) ) ( IS-CRATE ?auto_30991 ) ( not ( = ?auto_30979 ?auto_30993 ) ) ( not ( = ?auto_30980 ?auto_30993 ) ) ( not ( = ?auto_30989 ?auto_30993 ) ) ( not ( = ?auto_30991 ?auto_30993 ) ) ( not ( = ?auto_30982 ?auto_30993 ) ) ( not ( = ?auto_30988 ?auto_30981 ) ) ( not ( = ?auto_30994 ?auto_30988 ) ) ( not ( = ?auto_30990 ?auto_30988 ) ) ( HOIST-AT ?auto_30985 ?auto_30988 ) ( not ( = ?auto_30983 ?auto_30985 ) ) ( not ( = ?auto_30995 ?auto_30985 ) ) ( not ( = ?auto_30986 ?auto_30985 ) ) ( AVAILABLE ?auto_30985 ) ( SURFACE-AT ?auto_30991 ?auto_30988 ) ( ON ?auto_30991 ?auto_30987 ) ( CLEAR ?auto_30991 ) ( not ( = ?auto_30979 ?auto_30987 ) ) ( not ( = ?auto_30980 ?auto_30987 ) ) ( not ( = ?auto_30989 ?auto_30987 ) ) ( not ( = ?auto_30991 ?auto_30987 ) ) ( not ( = ?auto_30982 ?auto_30987 ) ) ( not ( = ?auto_30993 ?auto_30987 ) ) ( SURFACE-AT ?auto_30992 ?auto_30981 ) ( CLEAR ?auto_30992 ) ( IS-CRATE ?auto_30993 ) ( not ( = ?auto_30979 ?auto_30992 ) ) ( not ( = ?auto_30980 ?auto_30992 ) ) ( not ( = ?auto_30989 ?auto_30992 ) ) ( not ( = ?auto_30991 ?auto_30992 ) ) ( not ( = ?auto_30982 ?auto_30992 ) ) ( not ( = ?auto_30993 ?auto_30992 ) ) ( not ( = ?auto_30987 ?auto_30992 ) ) ( AVAILABLE ?auto_30983 ) ( TRUCK-AT ?auto_30996 ?auto_30984 ) ( not ( = ?auto_30984 ?auto_30981 ) ) ( not ( = ?auto_30994 ?auto_30984 ) ) ( not ( = ?auto_30990 ?auto_30984 ) ) ( not ( = ?auto_30988 ?auto_30984 ) ) ( HOIST-AT ?auto_30997 ?auto_30984 ) ( LIFTING ?auto_30997 ?auto_30993 ) ( not ( = ?auto_30983 ?auto_30997 ) ) ( not ( = ?auto_30995 ?auto_30997 ) ) ( not ( = ?auto_30986 ?auto_30997 ) ) ( not ( = ?auto_30985 ?auto_30997 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30997 ?auto_30993 ?auto_30996 ?auto_30984 )
      ( MAKE-ON ?auto_30979 ?auto_30980 )
      ( MAKE-ON-VERIFY ?auto_30979 ?auto_30980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30998 - SURFACE
      ?auto_30999 - SURFACE
    )
    :vars
    (
      ?auto_31000 - HOIST
      ?auto_31006 - PLACE
      ?auto_31014 - PLACE
      ?auto_31007 - HOIST
      ?auto_31012 - SURFACE
      ?auto_31004 - SURFACE
      ?auto_31013 - PLACE
      ?auto_31016 - HOIST
      ?auto_31002 - SURFACE
      ?auto_31011 - SURFACE
      ?auto_31001 - PLACE
      ?auto_31003 - HOIST
      ?auto_31008 - SURFACE
      ?auto_31005 - SURFACE
      ?auto_31009 - TRUCK
      ?auto_31015 - PLACE
      ?auto_31010 - HOIST
      ?auto_31017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31000 ?auto_31006 ) ( IS-CRATE ?auto_30998 ) ( not ( = ?auto_30998 ?auto_30999 ) ) ( not ( = ?auto_31014 ?auto_31006 ) ) ( HOIST-AT ?auto_31007 ?auto_31014 ) ( not ( = ?auto_31000 ?auto_31007 ) ) ( AVAILABLE ?auto_31007 ) ( SURFACE-AT ?auto_30998 ?auto_31014 ) ( ON ?auto_30998 ?auto_31012 ) ( CLEAR ?auto_30998 ) ( not ( = ?auto_30998 ?auto_31012 ) ) ( not ( = ?auto_30999 ?auto_31012 ) ) ( IS-CRATE ?auto_30999 ) ( not ( = ?auto_30998 ?auto_31004 ) ) ( not ( = ?auto_30999 ?auto_31004 ) ) ( not ( = ?auto_31012 ?auto_31004 ) ) ( not ( = ?auto_31013 ?auto_31006 ) ) ( not ( = ?auto_31014 ?auto_31013 ) ) ( HOIST-AT ?auto_31016 ?auto_31013 ) ( not ( = ?auto_31000 ?auto_31016 ) ) ( not ( = ?auto_31007 ?auto_31016 ) ) ( AVAILABLE ?auto_31016 ) ( SURFACE-AT ?auto_30999 ?auto_31013 ) ( ON ?auto_30999 ?auto_31002 ) ( CLEAR ?auto_30999 ) ( not ( = ?auto_30998 ?auto_31002 ) ) ( not ( = ?auto_30999 ?auto_31002 ) ) ( not ( = ?auto_31012 ?auto_31002 ) ) ( not ( = ?auto_31004 ?auto_31002 ) ) ( IS-CRATE ?auto_31004 ) ( not ( = ?auto_30998 ?auto_31011 ) ) ( not ( = ?auto_30999 ?auto_31011 ) ) ( not ( = ?auto_31012 ?auto_31011 ) ) ( not ( = ?auto_31004 ?auto_31011 ) ) ( not ( = ?auto_31002 ?auto_31011 ) ) ( not ( = ?auto_31001 ?auto_31006 ) ) ( not ( = ?auto_31014 ?auto_31001 ) ) ( not ( = ?auto_31013 ?auto_31001 ) ) ( HOIST-AT ?auto_31003 ?auto_31001 ) ( not ( = ?auto_31000 ?auto_31003 ) ) ( not ( = ?auto_31007 ?auto_31003 ) ) ( not ( = ?auto_31016 ?auto_31003 ) ) ( AVAILABLE ?auto_31003 ) ( SURFACE-AT ?auto_31004 ?auto_31001 ) ( ON ?auto_31004 ?auto_31008 ) ( CLEAR ?auto_31004 ) ( not ( = ?auto_30998 ?auto_31008 ) ) ( not ( = ?auto_30999 ?auto_31008 ) ) ( not ( = ?auto_31012 ?auto_31008 ) ) ( not ( = ?auto_31004 ?auto_31008 ) ) ( not ( = ?auto_31002 ?auto_31008 ) ) ( not ( = ?auto_31011 ?auto_31008 ) ) ( SURFACE-AT ?auto_31005 ?auto_31006 ) ( CLEAR ?auto_31005 ) ( IS-CRATE ?auto_31011 ) ( not ( = ?auto_30998 ?auto_31005 ) ) ( not ( = ?auto_30999 ?auto_31005 ) ) ( not ( = ?auto_31012 ?auto_31005 ) ) ( not ( = ?auto_31004 ?auto_31005 ) ) ( not ( = ?auto_31002 ?auto_31005 ) ) ( not ( = ?auto_31011 ?auto_31005 ) ) ( not ( = ?auto_31008 ?auto_31005 ) ) ( AVAILABLE ?auto_31000 ) ( TRUCK-AT ?auto_31009 ?auto_31015 ) ( not ( = ?auto_31015 ?auto_31006 ) ) ( not ( = ?auto_31014 ?auto_31015 ) ) ( not ( = ?auto_31013 ?auto_31015 ) ) ( not ( = ?auto_31001 ?auto_31015 ) ) ( HOIST-AT ?auto_31010 ?auto_31015 ) ( not ( = ?auto_31000 ?auto_31010 ) ) ( not ( = ?auto_31007 ?auto_31010 ) ) ( not ( = ?auto_31016 ?auto_31010 ) ) ( not ( = ?auto_31003 ?auto_31010 ) ) ( AVAILABLE ?auto_31010 ) ( SURFACE-AT ?auto_31011 ?auto_31015 ) ( ON ?auto_31011 ?auto_31017 ) ( CLEAR ?auto_31011 ) ( not ( = ?auto_30998 ?auto_31017 ) ) ( not ( = ?auto_30999 ?auto_31017 ) ) ( not ( = ?auto_31012 ?auto_31017 ) ) ( not ( = ?auto_31004 ?auto_31017 ) ) ( not ( = ?auto_31002 ?auto_31017 ) ) ( not ( = ?auto_31011 ?auto_31017 ) ) ( not ( = ?auto_31008 ?auto_31017 ) ) ( not ( = ?auto_31005 ?auto_31017 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31010 ?auto_31011 ?auto_31017 ?auto_31015 )
      ( MAKE-ON ?auto_30998 ?auto_30999 )
      ( MAKE-ON-VERIFY ?auto_30998 ?auto_30999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31018 - SURFACE
      ?auto_31019 - SURFACE
    )
    :vars
    (
      ?auto_31021 - HOIST
      ?auto_31034 - PLACE
      ?auto_31033 - PLACE
      ?auto_31026 - HOIST
      ?auto_31035 - SURFACE
      ?auto_31030 - SURFACE
      ?auto_31023 - PLACE
      ?auto_31031 - HOIST
      ?auto_31027 - SURFACE
      ?auto_31037 - SURFACE
      ?auto_31020 - PLACE
      ?auto_31029 - HOIST
      ?auto_31024 - SURFACE
      ?auto_31028 - SURFACE
      ?auto_31022 - PLACE
      ?auto_31036 - HOIST
      ?auto_31032 - SURFACE
      ?auto_31025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31021 ?auto_31034 ) ( IS-CRATE ?auto_31018 ) ( not ( = ?auto_31018 ?auto_31019 ) ) ( not ( = ?auto_31033 ?auto_31034 ) ) ( HOIST-AT ?auto_31026 ?auto_31033 ) ( not ( = ?auto_31021 ?auto_31026 ) ) ( AVAILABLE ?auto_31026 ) ( SURFACE-AT ?auto_31018 ?auto_31033 ) ( ON ?auto_31018 ?auto_31035 ) ( CLEAR ?auto_31018 ) ( not ( = ?auto_31018 ?auto_31035 ) ) ( not ( = ?auto_31019 ?auto_31035 ) ) ( IS-CRATE ?auto_31019 ) ( not ( = ?auto_31018 ?auto_31030 ) ) ( not ( = ?auto_31019 ?auto_31030 ) ) ( not ( = ?auto_31035 ?auto_31030 ) ) ( not ( = ?auto_31023 ?auto_31034 ) ) ( not ( = ?auto_31033 ?auto_31023 ) ) ( HOIST-AT ?auto_31031 ?auto_31023 ) ( not ( = ?auto_31021 ?auto_31031 ) ) ( not ( = ?auto_31026 ?auto_31031 ) ) ( AVAILABLE ?auto_31031 ) ( SURFACE-AT ?auto_31019 ?auto_31023 ) ( ON ?auto_31019 ?auto_31027 ) ( CLEAR ?auto_31019 ) ( not ( = ?auto_31018 ?auto_31027 ) ) ( not ( = ?auto_31019 ?auto_31027 ) ) ( not ( = ?auto_31035 ?auto_31027 ) ) ( not ( = ?auto_31030 ?auto_31027 ) ) ( IS-CRATE ?auto_31030 ) ( not ( = ?auto_31018 ?auto_31037 ) ) ( not ( = ?auto_31019 ?auto_31037 ) ) ( not ( = ?auto_31035 ?auto_31037 ) ) ( not ( = ?auto_31030 ?auto_31037 ) ) ( not ( = ?auto_31027 ?auto_31037 ) ) ( not ( = ?auto_31020 ?auto_31034 ) ) ( not ( = ?auto_31033 ?auto_31020 ) ) ( not ( = ?auto_31023 ?auto_31020 ) ) ( HOIST-AT ?auto_31029 ?auto_31020 ) ( not ( = ?auto_31021 ?auto_31029 ) ) ( not ( = ?auto_31026 ?auto_31029 ) ) ( not ( = ?auto_31031 ?auto_31029 ) ) ( AVAILABLE ?auto_31029 ) ( SURFACE-AT ?auto_31030 ?auto_31020 ) ( ON ?auto_31030 ?auto_31024 ) ( CLEAR ?auto_31030 ) ( not ( = ?auto_31018 ?auto_31024 ) ) ( not ( = ?auto_31019 ?auto_31024 ) ) ( not ( = ?auto_31035 ?auto_31024 ) ) ( not ( = ?auto_31030 ?auto_31024 ) ) ( not ( = ?auto_31027 ?auto_31024 ) ) ( not ( = ?auto_31037 ?auto_31024 ) ) ( SURFACE-AT ?auto_31028 ?auto_31034 ) ( CLEAR ?auto_31028 ) ( IS-CRATE ?auto_31037 ) ( not ( = ?auto_31018 ?auto_31028 ) ) ( not ( = ?auto_31019 ?auto_31028 ) ) ( not ( = ?auto_31035 ?auto_31028 ) ) ( not ( = ?auto_31030 ?auto_31028 ) ) ( not ( = ?auto_31027 ?auto_31028 ) ) ( not ( = ?auto_31037 ?auto_31028 ) ) ( not ( = ?auto_31024 ?auto_31028 ) ) ( AVAILABLE ?auto_31021 ) ( not ( = ?auto_31022 ?auto_31034 ) ) ( not ( = ?auto_31033 ?auto_31022 ) ) ( not ( = ?auto_31023 ?auto_31022 ) ) ( not ( = ?auto_31020 ?auto_31022 ) ) ( HOIST-AT ?auto_31036 ?auto_31022 ) ( not ( = ?auto_31021 ?auto_31036 ) ) ( not ( = ?auto_31026 ?auto_31036 ) ) ( not ( = ?auto_31031 ?auto_31036 ) ) ( not ( = ?auto_31029 ?auto_31036 ) ) ( AVAILABLE ?auto_31036 ) ( SURFACE-AT ?auto_31037 ?auto_31022 ) ( ON ?auto_31037 ?auto_31032 ) ( CLEAR ?auto_31037 ) ( not ( = ?auto_31018 ?auto_31032 ) ) ( not ( = ?auto_31019 ?auto_31032 ) ) ( not ( = ?auto_31035 ?auto_31032 ) ) ( not ( = ?auto_31030 ?auto_31032 ) ) ( not ( = ?auto_31027 ?auto_31032 ) ) ( not ( = ?auto_31037 ?auto_31032 ) ) ( not ( = ?auto_31024 ?auto_31032 ) ) ( not ( = ?auto_31028 ?auto_31032 ) ) ( TRUCK-AT ?auto_31025 ?auto_31034 ) )
    :subtasks
    ( ( !DRIVE ?auto_31025 ?auto_31034 ?auto_31022 )
      ( MAKE-ON ?auto_31018 ?auto_31019 )
      ( MAKE-ON-VERIFY ?auto_31018 ?auto_31019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31038 - SURFACE
      ?auto_31039 - SURFACE
    )
    :vars
    (
      ?auto_31045 - HOIST
      ?auto_31053 - PLACE
      ?auto_31048 - PLACE
      ?auto_31055 - HOIST
      ?auto_31057 - SURFACE
      ?auto_31050 - SURFACE
      ?auto_31047 - PLACE
      ?auto_31040 - HOIST
      ?auto_31056 - SURFACE
      ?auto_31043 - SURFACE
      ?auto_31044 - PLACE
      ?auto_31052 - HOIST
      ?auto_31054 - SURFACE
      ?auto_31041 - SURFACE
      ?auto_31049 - PLACE
      ?auto_31042 - HOIST
      ?auto_31046 - SURFACE
      ?auto_31051 - TRUCK
      ?auto_31058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31045 ?auto_31053 ) ( IS-CRATE ?auto_31038 ) ( not ( = ?auto_31038 ?auto_31039 ) ) ( not ( = ?auto_31048 ?auto_31053 ) ) ( HOIST-AT ?auto_31055 ?auto_31048 ) ( not ( = ?auto_31045 ?auto_31055 ) ) ( AVAILABLE ?auto_31055 ) ( SURFACE-AT ?auto_31038 ?auto_31048 ) ( ON ?auto_31038 ?auto_31057 ) ( CLEAR ?auto_31038 ) ( not ( = ?auto_31038 ?auto_31057 ) ) ( not ( = ?auto_31039 ?auto_31057 ) ) ( IS-CRATE ?auto_31039 ) ( not ( = ?auto_31038 ?auto_31050 ) ) ( not ( = ?auto_31039 ?auto_31050 ) ) ( not ( = ?auto_31057 ?auto_31050 ) ) ( not ( = ?auto_31047 ?auto_31053 ) ) ( not ( = ?auto_31048 ?auto_31047 ) ) ( HOIST-AT ?auto_31040 ?auto_31047 ) ( not ( = ?auto_31045 ?auto_31040 ) ) ( not ( = ?auto_31055 ?auto_31040 ) ) ( AVAILABLE ?auto_31040 ) ( SURFACE-AT ?auto_31039 ?auto_31047 ) ( ON ?auto_31039 ?auto_31056 ) ( CLEAR ?auto_31039 ) ( not ( = ?auto_31038 ?auto_31056 ) ) ( not ( = ?auto_31039 ?auto_31056 ) ) ( not ( = ?auto_31057 ?auto_31056 ) ) ( not ( = ?auto_31050 ?auto_31056 ) ) ( IS-CRATE ?auto_31050 ) ( not ( = ?auto_31038 ?auto_31043 ) ) ( not ( = ?auto_31039 ?auto_31043 ) ) ( not ( = ?auto_31057 ?auto_31043 ) ) ( not ( = ?auto_31050 ?auto_31043 ) ) ( not ( = ?auto_31056 ?auto_31043 ) ) ( not ( = ?auto_31044 ?auto_31053 ) ) ( not ( = ?auto_31048 ?auto_31044 ) ) ( not ( = ?auto_31047 ?auto_31044 ) ) ( HOIST-AT ?auto_31052 ?auto_31044 ) ( not ( = ?auto_31045 ?auto_31052 ) ) ( not ( = ?auto_31055 ?auto_31052 ) ) ( not ( = ?auto_31040 ?auto_31052 ) ) ( AVAILABLE ?auto_31052 ) ( SURFACE-AT ?auto_31050 ?auto_31044 ) ( ON ?auto_31050 ?auto_31054 ) ( CLEAR ?auto_31050 ) ( not ( = ?auto_31038 ?auto_31054 ) ) ( not ( = ?auto_31039 ?auto_31054 ) ) ( not ( = ?auto_31057 ?auto_31054 ) ) ( not ( = ?auto_31050 ?auto_31054 ) ) ( not ( = ?auto_31056 ?auto_31054 ) ) ( not ( = ?auto_31043 ?auto_31054 ) ) ( IS-CRATE ?auto_31043 ) ( not ( = ?auto_31038 ?auto_31041 ) ) ( not ( = ?auto_31039 ?auto_31041 ) ) ( not ( = ?auto_31057 ?auto_31041 ) ) ( not ( = ?auto_31050 ?auto_31041 ) ) ( not ( = ?auto_31056 ?auto_31041 ) ) ( not ( = ?auto_31043 ?auto_31041 ) ) ( not ( = ?auto_31054 ?auto_31041 ) ) ( not ( = ?auto_31049 ?auto_31053 ) ) ( not ( = ?auto_31048 ?auto_31049 ) ) ( not ( = ?auto_31047 ?auto_31049 ) ) ( not ( = ?auto_31044 ?auto_31049 ) ) ( HOIST-AT ?auto_31042 ?auto_31049 ) ( not ( = ?auto_31045 ?auto_31042 ) ) ( not ( = ?auto_31055 ?auto_31042 ) ) ( not ( = ?auto_31040 ?auto_31042 ) ) ( not ( = ?auto_31052 ?auto_31042 ) ) ( AVAILABLE ?auto_31042 ) ( SURFACE-AT ?auto_31043 ?auto_31049 ) ( ON ?auto_31043 ?auto_31046 ) ( CLEAR ?auto_31043 ) ( not ( = ?auto_31038 ?auto_31046 ) ) ( not ( = ?auto_31039 ?auto_31046 ) ) ( not ( = ?auto_31057 ?auto_31046 ) ) ( not ( = ?auto_31050 ?auto_31046 ) ) ( not ( = ?auto_31056 ?auto_31046 ) ) ( not ( = ?auto_31043 ?auto_31046 ) ) ( not ( = ?auto_31054 ?auto_31046 ) ) ( not ( = ?auto_31041 ?auto_31046 ) ) ( TRUCK-AT ?auto_31051 ?auto_31053 ) ( SURFACE-AT ?auto_31058 ?auto_31053 ) ( CLEAR ?auto_31058 ) ( LIFTING ?auto_31045 ?auto_31041 ) ( IS-CRATE ?auto_31041 ) ( not ( = ?auto_31038 ?auto_31058 ) ) ( not ( = ?auto_31039 ?auto_31058 ) ) ( not ( = ?auto_31057 ?auto_31058 ) ) ( not ( = ?auto_31050 ?auto_31058 ) ) ( not ( = ?auto_31056 ?auto_31058 ) ) ( not ( = ?auto_31043 ?auto_31058 ) ) ( not ( = ?auto_31054 ?auto_31058 ) ) ( not ( = ?auto_31041 ?auto_31058 ) ) ( not ( = ?auto_31046 ?auto_31058 ) ) )
    :subtasks
    ( ( !DROP ?auto_31045 ?auto_31041 ?auto_31058 ?auto_31053 )
      ( MAKE-ON ?auto_31038 ?auto_31039 )
      ( MAKE-ON-VERIFY ?auto_31038 ?auto_31039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31059 - SURFACE
      ?auto_31060 - SURFACE
    )
    :vars
    (
      ?auto_31068 - HOIST
      ?auto_31077 - PLACE
      ?auto_31071 - PLACE
      ?auto_31063 - HOIST
      ?auto_31076 - SURFACE
      ?auto_31069 - SURFACE
      ?auto_31078 - PLACE
      ?auto_31072 - HOIST
      ?auto_31075 - SURFACE
      ?auto_31066 - SURFACE
      ?auto_31067 - PLACE
      ?auto_31074 - HOIST
      ?auto_31064 - SURFACE
      ?auto_31061 - SURFACE
      ?auto_31073 - PLACE
      ?auto_31065 - HOIST
      ?auto_31062 - SURFACE
      ?auto_31079 - TRUCK
      ?auto_31070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31068 ?auto_31077 ) ( IS-CRATE ?auto_31059 ) ( not ( = ?auto_31059 ?auto_31060 ) ) ( not ( = ?auto_31071 ?auto_31077 ) ) ( HOIST-AT ?auto_31063 ?auto_31071 ) ( not ( = ?auto_31068 ?auto_31063 ) ) ( AVAILABLE ?auto_31063 ) ( SURFACE-AT ?auto_31059 ?auto_31071 ) ( ON ?auto_31059 ?auto_31076 ) ( CLEAR ?auto_31059 ) ( not ( = ?auto_31059 ?auto_31076 ) ) ( not ( = ?auto_31060 ?auto_31076 ) ) ( IS-CRATE ?auto_31060 ) ( not ( = ?auto_31059 ?auto_31069 ) ) ( not ( = ?auto_31060 ?auto_31069 ) ) ( not ( = ?auto_31076 ?auto_31069 ) ) ( not ( = ?auto_31078 ?auto_31077 ) ) ( not ( = ?auto_31071 ?auto_31078 ) ) ( HOIST-AT ?auto_31072 ?auto_31078 ) ( not ( = ?auto_31068 ?auto_31072 ) ) ( not ( = ?auto_31063 ?auto_31072 ) ) ( AVAILABLE ?auto_31072 ) ( SURFACE-AT ?auto_31060 ?auto_31078 ) ( ON ?auto_31060 ?auto_31075 ) ( CLEAR ?auto_31060 ) ( not ( = ?auto_31059 ?auto_31075 ) ) ( not ( = ?auto_31060 ?auto_31075 ) ) ( not ( = ?auto_31076 ?auto_31075 ) ) ( not ( = ?auto_31069 ?auto_31075 ) ) ( IS-CRATE ?auto_31069 ) ( not ( = ?auto_31059 ?auto_31066 ) ) ( not ( = ?auto_31060 ?auto_31066 ) ) ( not ( = ?auto_31076 ?auto_31066 ) ) ( not ( = ?auto_31069 ?auto_31066 ) ) ( not ( = ?auto_31075 ?auto_31066 ) ) ( not ( = ?auto_31067 ?auto_31077 ) ) ( not ( = ?auto_31071 ?auto_31067 ) ) ( not ( = ?auto_31078 ?auto_31067 ) ) ( HOIST-AT ?auto_31074 ?auto_31067 ) ( not ( = ?auto_31068 ?auto_31074 ) ) ( not ( = ?auto_31063 ?auto_31074 ) ) ( not ( = ?auto_31072 ?auto_31074 ) ) ( AVAILABLE ?auto_31074 ) ( SURFACE-AT ?auto_31069 ?auto_31067 ) ( ON ?auto_31069 ?auto_31064 ) ( CLEAR ?auto_31069 ) ( not ( = ?auto_31059 ?auto_31064 ) ) ( not ( = ?auto_31060 ?auto_31064 ) ) ( not ( = ?auto_31076 ?auto_31064 ) ) ( not ( = ?auto_31069 ?auto_31064 ) ) ( not ( = ?auto_31075 ?auto_31064 ) ) ( not ( = ?auto_31066 ?auto_31064 ) ) ( IS-CRATE ?auto_31066 ) ( not ( = ?auto_31059 ?auto_31061 ) ) ( not ( = ?auto_31060 ?auto_31061 ) ) ( not ( = ?auto_31076 ?auto_31061 ) ) ( not ( = ?auto_31069 ?auto_31061 ) ) ( not ( = ?auto_31075 ?auto_31061 ) ) ( not ( = ?auto_31066 ?auto_31061 ) ) ( not ( = ?auto_31064 ?auto_31061 ) ) ( not ( = ?auto_31073 ?auto_31077 ) ) ( not ( = ?auto_31071 ?auto_31073 ) ) ( not ( = ?auto_31078 ?auto_31073 ) ) ( not ( = ?auto_31067 ?auto_31073 ) ) ( HOIST-AT ?auto_31065 ?auto_31073 ) ( not ( = ?auto_31068 ?auto_31065 ) ) ( not ( = ?auto_31063 ?auto_31065 ) ) ( not ( = ?auto_31072 ?auto_31065 ) ) ( not ( = ?auto_31074 ?auto_31065 ) ) ( AVAILABLE ?auto_31065 ) ( SURFACE-AT ?auto_31066 ?auto_31073 ) ( ON ?auto_31066 ?auto_31062 ) ( CLEAR ?auto_31066 ) ( not ( = ?auto_31059 ?auto_31062 ) ) ( not ( = ?auto_31060 ?auto_31062 ) ) ( not ( = ?auto_31076 ?auto_31062 ) ) ( not ( = ?auto_31069 ?auto_31062 ) ) ( not ( = ?auto_31075 ?auto_31062 ) ) ( not ( = ?auto_31066 ?auto_31062 ) ) ( not ( = ?auto_31064 ?auto_31062 ) ) ( not ( = ?auto_31061 ?auto_31062 ) ) ( TRUCK-AT ?auto_31079 ?auto_31077 ) ( SURFACE-AT ?auto_31070 ?auto_31077 ) ( CLEAR ?auto_31070 ) ( IS-CRATE ?auto_31061 ) ( not ( = ?auto_31059 ?auto_31070 ) ) ( not ( = ?auto_31060 ?auto_31070 ) ) ( not ( = ?auto_31076 ?auto_31070 ) ) ( not ( = ?auto_31069 ?auto_31070 ) ) ( not ( = ?auto_31075 ?auto_31070 ) ) ( not ( = ?auto_31066 ?auto_31070 ) ) ( not ( = ?auto_31064 ?auto_31070 ) ) ( not ( = ?auto_31061 ?auto_31070 ) ) ( not ( = ?auto_31062 ?auto_31070 ) ) ( AVAILABLE ?auto_31068 ) ( IN ?auto_31061 ?auto_31079 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31068 ?auto_31061 ?auto_31079 ?auto_31077 )
      ( MAKE-ON ?auto_31059 ?auto_31060 )
      ( MAKE-ON-VERIFY ?auto_31059 ?auto_31060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31080 - SURFACE
      ?auto_31081 - SURFACE
    )
    :vars
    (
      ?auto_31098 - HOIST
      ?auto_31093 - PLACE
      ?auto_31090 - PLACE
      ?auto_31082 - HOIST
      ?auto_31086 - SURFACE
      ?auto_31097 - SURFACE
      ?auto_31094 - PLACE
      ?auto_31089 - HOIST
      ?auto_31100 - SURFACE
      ?auto_31088 - SURFACE
      ?auto_31084 - PLACE
      ?auto_31091 - HOIST
      ?auto_31095 - SURFACE
      ?auto_31099 - SURFACE
      ?auto_31096 - PLACE
      ?auto_31085 - HOIST
      ?auto_31083 - SURFACE
      ?auto_31087 - SURFACE
      ?auto_31092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31098 ?auto_31093 ) ( IS-CRATE ?auto_31080 ) ( not ( = ?auto_31080 ?auto_31081 ) ) ( not ( = ?auto_31090 ?auto_31093 ) ) ( HOIST-AT ?auto_31082 ?auto_31090 ) ( not ( = ?auto_31098 ?auto_31082 ) ) ( AVAILABLE ?auto_31082 ) ( SURFACE-AT ?auto_31080 ?auto_31090 ) ( ON ?auto_31080 ?auto_31086 ) ( CLEAR ?auto_31080 ) ( not ( = ?auto_31080 ?auto_31086 ) ) ( not ( = ?auto_31081 ?auto_31086 ) ) ( IS-CRATE ?auto_31081 ) ( not ( = ?auto_31080 ?auto_31097 ) ) ( not ( = ?auto_31081 ?auto_31097 ) ) ( not ( = ?auto_31086 ?auto_31097 ) ) ( not ( = ?auto_31094 ?auto_31093 ) ) ( not ( = ?auto_31090 ?auto_31094 ) ) ( HOIST-AT ?auto_31089 ?auto_31094 ) ( not ( = ?auto_31098 ?auto_31089 ) ) ( not ( = ?auto_31082 ?auto_31089 ) ) ( AVAILABLE ?auto_31089 ) ( SURFACE-AT ?auto_31081 ?auto_31094 ) ( ON ?auto_31081 ?auto_31100 ) ( CLEAR ?auto_31081 ) ( not ( = ?auto_31080 ?auto_31100 ) ) ( not ( = ?auto_31081 ?auto_31100 ) ) ( not ( = ?auto_31086 ?auto_31100 ) ) ( not ( = ?auto_31097 ?auto_31100 ) ) ( IS-CRATE ?auto_31097 ) ( not ( = ?auto_31080 ?auto_31088 ) ) ( not ( = ?auto_31081 ?auto_31088 ) ) ( not ( = ?auto_31086 ?auto_31088 ) ) ( not ( = ?auto_31097 ?auto_31088 ) ) ( not ( = ?auto_31100 ?auto_31088 ) ) ( not ( = ?auto_31084 ?auto_31093 ) ) ( not ( = ?auto_31090 ?auto_31084 ) ) ( not ( = ?auto_31094 ?auto_31084 ) ) ( HOIST-AT ?auto_31091 ?auto_31084 ) ( not ( = ?auto_31098 ?auto_31091 ) ) ( not ( = ?auto_31082 ?auto_31091 ) ) ( not ( = ?auto_31089 ?auto_31091 ) ) ( AVAILABLE ?auto_31091 ) ( SURFACE-AT ?auto_31097 ?auto_31084 ) ( ON ?auto_31097 ?auto_31095 ) ( CLEAR ?auto_31097 ) ( not ( = ?auto_31080 ?auto_31095 ) ) ( not ( = ?auto_31081 ?auto_31095 ) ) ( not ( = ?auto_31086 ?auto_31095 ) ) ( not ( = ?auto_31097 ?auto_31095 ) ) ( not ( = ?auto_31100 ?auto_31095 ) ) ( not ( = ?auto_31088 ?auto_31095 ) ) ( IS-CRATE ?auto_31088 ) ( not ( = ?auto_31080 ?auto_31099 ) ) ( not ( = ?auto_31081 ?auto_31099 ) ) ( not ( = ?auto_31086 ?auto_31099 ) ) ( not ( = ?auto_31097 ?auto_31099 ) ) ( not ( = ?auto_31100 ?auto_31099 ) ) ( not ( = ?auto_31088 ?auto_31099 ) ) ( not ( = ?auto_31095 ?auto_31099 ) ) ( not ( = ?auto_31096 ?auto_31093 ) ) ( not ( = ?auto_31090 ?auto_31096 ) ) ( not ( = ?auto_31094 ?auto_31096 ) ) ( not ( = ?auto_31084 ?auto_31096 ) ) ( HOIST-AT ?auto_31085 ?auto_31096 ) ( not ( = ?auto_31098 ?auto_31085 ) ) ( not ( = ?auto_31082 ?auto_31085 ) ) ( not ( = ?auto_31089 ?auto_31085 ) ) ( not ( = ?auto_31091 ?auto_31085 ) ) ( AVAILABLE ?auto_31085 ) ( SURFACE-AT ?auto_31088 ?auto_31096 ) ( ON ?auto_31088 ?auto_31083 ) ( CLEAR ?auto_31088 ) ( not ( = ?auto_31080 ?auto_31083 ) ) ( not ( = ?auto_31081 ?auto_31083 ) ) ( not ( = ?auto_31086 ?auto_31083 ) ) ( not ( = ?auto_31097 ?auto_31083 ) ) ( not ( = ?auto_31100 ?auto_31083 ) ) ( not ( = ?auto_31088 ?auto_31083 ) ) ( not ( = ?auto_31095 ?auto_31083 ) ) ( not ( = ?auto_31099 ?auto_31083 ) ) ( SURFACE-AT ?auto_31087 ?auto_31093 ) ( CLEAR ?auto_31087 ) ( IS-CRATE ?auto_31099 ) ( not ( = ?auto_31080 ?auto_31087 ) ) ( not ( = ?auto_31081 ?auto_31087 ) ) ( not ( = ?auto_31086 ?auto_31087 ) ) ( not ( = ?auto_31097 ?auto_31087 ) ) ( not ( = ?auto_31100 ?auto_31087 ) ) ( not ( = ?auto_31088 ?auto_31087 ) ) ( not ( = ?auto_31095 ?auto_31087 ) ) ( not ( = ?auto_31099 ?auto_31087 ) ) ( not ( = ?auto_31083 ?auto_31087 ) ) ( AVAILABLE ?auto_31098 ) ( IN ?auto_31099 ?auto_31092 ) ( TRUCK-AT ?auto_31092 ?auto_31084 ) )
    :subtasks
    ( ( !DRIVE ?auto_31092 ?auto_31084 ?auto_31093 )
      ( MAKE-ON ?auto_31080 ?auto_31081 )
      ( MAKE-ON-VERIFY ?auto_31080 ?auto_31081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31101 - SURFACE
      ?auto_31102 - SURFACE
    )
    :vars
    (
      ?auto_31112 - HOIST
      ?auto_31114 - PLACE
      ?auto_31119 - PLACE
      ?auto_31106 - HOIST
      ?auto_31107 - SURFACE
      ?auto_31105 - SURFACE
      ?auto_31104 - PLACE
      ?auto_31121 - HOIST
      ?auto_31111 - SURFACE
      ?auto_31116 - SURFACE
      ?auto_31118 - PLACE
      ?auto_31113 - HOIST
      ?auto_31120 - SURFACE
      ?auto_31117 - SURFACE
      ?auto_31103 - PLACE
      ?auto_31108 - HOIST
      ?auto_31115 - SURFACE
      ?auto_31109 - SURFACE
      ?auto_31110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31112 ?auto_31114 ) ( IS-CRATE ?auto_31101 ) ( not ( = ?auto_31101 ?auto_31102 ) ) ( not ( = ?auto_31119 ?auto_31114 ) ) ( HOIST-AT ?auto_31106 ?auto_31119 ) ( not ( = ?auto_31112 ?auto_31106 ) ) ( AVAILABLE ?auto_31106 ) ( SURFACE-AT ?auto_31101 ?auto_31119 ) ( ON ?auto_31101 ?auto_31107 ) ( CLEAR ?auto_31101 ) ( not ( = ?auto_31101 ?auto_31107 ) ) ( not ( = ?auto_31102 ?auto_31107 ) ) ( IS-CRATE ?auto_31102 ) ( not ( = ?auto_31101 ?auto_31105 ) ) ( not ( = ?auto_31102 ?auto_31105 ) ) ( not ( = ?auto_31107 ?auto_31105 ) ) ( not ( = ?auto_31104 ?auto_31114 ) ) ( not ( = ?auto_31119 ?auto_31104 ) ) ( HOIST-AT ?auto_31121 ?auto_31104 ) ( not ( = ?auto_31112 ?auto_31121 ) ) ( not ( = ?auto_31106 ?auto_31121 ) ) ( AVAILABLE ?auto_31121 ) ( SURFACE-AT ?auto_31102 ?auto_31104 ) ( ON ?auto_31102 ?auto_31111 ) ( CLEAR ?auto_31102 ) ( not ( = ?auto_31101 ?auto_31111 ) ) ( not ( = ?auto_31102 ?auto_31111 ) ) ( not ( = ?auto_31107 ?auto_31111 ) ) ( not ( = ?auto_31105 ?auto_31111 ) ) ( IS-CRATE ?auto_31105 ) ( not ( = ?auto_31101 ?auto_31116 ) ) ( not ( = ?auto_31102 ?auto_31116 ) ) ( not ( = ?auto_31107 ?auto_31116 ) ) ( not ( = ?auto_31105 ?auto_31116 ) ) ( not ( = ?auto_31111 ?auto_31116 ) ) ( not ( = ?auto_31118 ?auto_31114 ) ) ( not ( = ?auto_31119 ?auto_31118 ) ) ( not ( = ?auto_31104 ?auto_31118 ) ) ( HOIST-AT ?auto_31113 ?auto_31118 ) ( not ( = ?auto_31112 ?auto_31113 ) ) ( not ( = ?auto_31106 ?auto_31113 ) ) ( not ( = ?auto_31121 ?auto_31113 ) ) ( SURFACE-AT ?auto_31105 ?auto_31118 ) ( ON ?auto_31105 ?auto_31120 ) ( CLEAR ?auto_31105 ) ( not ( = ?auto_31101 ?auto_31120 ) ) ( not ( = ?auto_31102 ?auto_31120 ) ) ( not ( = ?auto_31107 ?auto_31120 ) ) ( not ( = ?auto_31105 ?auto_31120 ) ) ( not ( = ?auto_31111 ?auto_31120 ) ) ( not ( = ?auto_31116 ?auto_31120 ) ) ( IS-CRATE ?auto_31116 ) ( not ( = ?auto_31101 ?auto_31117 ) ) ( not ( = ?auto_31102 ?auto_31117 ) ) ( not ( = ?auto_31107 ?auto_31117 ) ) ( not ( = ?auto_31105 ?auto_31117 ) ) ( not ( = ?auto_31111 ?auto_31117 ) ) ( not ( = ?auto_31116 ?auto_31117 ) ) ( not ( = ?auto_31120 ?auto_31117 ) ) ( not ( = ?auto_31103 ?auto_31114 ) ) ( not ( = ?auto_31119 ?auto_31103 ) ) ( not ( = ?auto_31104 ?auto_31103 ) ) ( not ( = ?auto_31118 ?auto_31103 ) ) ( HOIST-AT ?auto_31108 ?auto_31103 ) ( not ( = ?auto_31112 ?auto_31108 ) ) ( not ( = ?auto_31106 ?auto_31108 ) ) ( not ( = ?auto_31121 ?auto_31108 ) ) ( not ( = ?auto_31113 ?auto_31108 ) ) ( AVAILABLE ?auto_31108 ) ( SURFACE-AT ?auto_31116 ?auto_31103 ) ( ON ?auto_31116 ?auto_31115 ) ( CLEAR ?auto_31116 ) ( not ( = ?auto_31101 ?auto_31115 ) ) ( not ( = ?auto_31102 ?auto_31115 ) ) ( not ( = ?auto_31107 ?auto_31115 ) ) ( not ( = ?auto_31105 ?auto_31115 ) ) ( not ( = ?auto_31111 ?auto_31115 ) ) ( not ( = ?auto_31116 ?auto_31115 ) ) ( not ( = ?auto_31120 ?auto_31115 ) ) ( not ( = ?auto_31117 ?auto_31115 ) ) ( SURFACE-AT ?auto_31109 ?auto_31114 ) ( CLEAR ?auto_31109 ) ( IS-CRATE ?auto_31117 ) ( not ( = ?auto_31101 ?auto_31109 ) ) ( not ( = ?auto_31102 ?auto_31109 ) ) ( not ( = ?auto_31107 ?auto_31109 ) ) ( not ( = ?auto_31105 ?auto_31109 ) ) ( not ( = ?auto_31111 ?auto_31109 ) ) ( not ( = ?auto_31116 ?auto_31109 ) ) ( not ( = ?auto_31120 ?auto_31109 ) ) ( not ( = ?auto_31117 ?auto_31109 ) ) ( not ( = ?auto_31115 ?auto_31109 ) ) ( AVAILABLE ?auto_31112 ) ( TRUCK-AT ?auto_31110 ?auto_31118 ) ( LIFTING ?auto_31113 ?auto_31117 ) )
    :subtasks
    ( ( !LOAD ?auto_31113 ?auto_31117 ?auto_31110 ?auto_31118 )
      ( MAKE-ON ?auto_31101 ?auto_31102 )
      ( MAKE-ON-VERIFY ?auto_31101 ?auto_31102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31122 - SURFACE
      ?auto_31123 - SURFACE
    )
    :vars
    (
      ?auto_31133 - HOIST
      ?auto_31137 - PLACE
      ?auto_31141 - PLACE
      ?auto_31136 - HOIST
      ?auto_31128 - SURFACE
      ?auto_31134 - SURFACE
      ?auto_31138 - PLACE
      ?auto_31142 - HOIST
      ?auto_31124 - SURFACE
      ?auto_31132 - SURFACE
      ?auto_31129 - PLACE
      ?auto_31125 - HOIST
      ?auto_31140 - SURFACE
      ?auto_31130 - SURFACE
      ?auto_31127 - PLACE
      ?auto_31139 - HOIST
      ?auto_31135 - SURFACE
      ?auto_31126 - SURFACE
      ?auto_31131 - TRUCK
      ?auto_31143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31133 ?auto_31137 ) ( IS-CRATE ?auto_31122 ) ( not ( = ?auto_31122 ?auto_31123 ) ) ( not ( = ?auto_31141 ?auto_31137 ) ) ( HOIST-AT ?auto_31136 ?auto_31141 ) ( not ( = ?auto_31133 ?auto_31136 ) ) ( AVAILABLE ?auto_31136 ) ( SURFACE-AT ?auto_31122 ?auto_31141 ) ( ON ?auto_31122 ?auto_31128 ) ( CLEAR ?auto_31122 ) ( not ( = ?auto_31122 ?auto_31128 ) ) ( not ( = ?auto_31123 ?auto_31128 ) ) ( IS-CRATE ?auto_31123 ) ( not ( = ?auto_31122 ?auto_31134 ) ) ( not ( = ?auto_31123 ?auto_31134 ) ) ( not ( = ?auto_31128 ?auto_31134 ) ) ( not ( = ?auto_31138 ?auto_31137 ) ) ( not ( = ?auto_31141 ?auto_31138 ) ) ( HOIST-AT ?auto_31142 ?auto_31138 ) ( not ( = ?auto_31133 ?auto_31142 ) ) ( not ( = ?auto_31136 ?auto_31142 ) ) ( AVAILABLE ?auto_31142 ) ( SURFACE-AT ?auto_31123 ?auto_31138 ) ( ON ?auto_31123 ?auto_31124 ) ( CLEAR ?auto_31123 ) ( not ( = ?auto_31122 ?auto_31124 ) ) ( not ( = ?auto_31123 ?auto_31124 ) ) ( not ( = ?auto_31128 ?auto_31124 ) ) ( not ( = ?auto_31134 ?auto_31124 ) ) ( IS-CRATE ?auto_31134 ) ( not ( = ?auto_31122 ?auto_31132 ) ) ( not ( = ?auto_31123 ?auto_31132 ) ) ( not ( = ?auto_31128 ?auto_31132 ) ) ( not ( = ?auto_31134 ?auto_31132 ) ) ( not ( = ?auto_31124 ?auto_31132 ) ) ( not ( = ?auto_31129 ?auto_31137 ) ) ( not ( = ?auto_31141 ?auto_31129 ) ) ( not ( = ?auto_31138 ?auto_31129 ) ) ( HOIST-AT ?auto_31125 ?auto_31129 ) ( not ( = ?auto_31133 ?auto_31125 ) ) ( not ( = ?auto_31136 ?auto_31125 ) ) ( not ( = ?auto_31142 ?auto_31125 ) ) ( SURFACE-AT ?auto_31134 ?auto_31129 ) ( ON ?auto_31134 ?auto_31140 ) ( CLEAR ?auto_31134 ) ( not ( = ?auto_31122 ?auto_31140 ) ) ( not ( = ?auto_31123 ?auto_31140 ) ) ( not ( = ?auto_31128 ?auto_31140 ) ) ( not ( = ?auto_31134 ?auto_31140 ) ) ( not ( = ?auto_31124 ?auto_31140 ) ) ( not ( = ?auto_31132 ?auto_31140 ) ) ( IS-CRATE ?auto_31132 ) ( not ( = ?auto_31122 ?auto_31130 ) ) ( not ( = ?auto_31123 ?auto_31130 ) ) ( not ( = ?auto_31128 ?auto_31130 ) ) ( not ( = ?auto_31134 ?auto_31130 ) ) ( not ( = ?auto_31124 ?auto_31130 ) ) ( not ( = ?auto_31132 ?auto_31130 ) ) ( not ( = ?auto_31140 ?auto_31130 ) ) ( not ( = ?auto_31127 ?auto_31137 ) ) ( not ( = ?auto_31141 ?auto_31127 ) ) ( not ( = ?auto_31138 ?auto_31127 ) ) ( not ( = ?auto_31129 ?auto_31127 ) ) ( HOIST-AT ?auto_31139 ?auto_31127 ) ( not ( = ?auto_31133 ?auto_31139 ) ) ( not ( = ?auto_31136 ?auto_31139 ) ) ( not ( = ?auto_31142 ?auto_31139 ) ) ( not ( = ?auto_31125 ?auto_31139 ) ) ( AVAILABLE ?auto_31139 ) ( SURFACE-AT ?auto_31132 ?auto_31127 ) ( ON ?auto_31132 ?auto_31135 ) ( CLEAR ?auto_31132 ) ( not ( = ?auto_31122 ?auto_31135 ) ) ( not ( = ?auto_31123 ?auto_31135 ) ) ( not ( = ?auto_31128 ?auto_31135 ) ) ( not ( = ?auto_31134 ?auto_31135 ) ) ( not ( = ?auto_31124 ?auto_31135 ) ) ( not ( = ?auto_31132 ?auto_31135 ) ) ( not ( = ?auto_31140 ?auto_31135 ) ) ( not ( = ?auto_31130 ?auto_31135 ) ) ( SURFACE-AT ?auto_31126 ?auto_31137 ) ( CLEAR ?auto_31126 ) ( IS-CRATE ?auto_31130 ) ( not ( = ?auto_31122 ?auto_31126 ) ) ( not ( = ?auto_31123 ?auto_31126 ) ) ( not ( = ?auto_31128 ?auto_31126 ) ) ( not ( = ?auto_31134 ?auto_31126 ) ) ( not ( = ?auto_31124 ?auto_31126 ) ) ( not ( = ?auto_31132 ?auto_31126 ) ) ( not ( = ?auto_31140 ?auto_31126 ) ) ( not ( = ?auto_31130 ?auto_31126 ) ) ( not ( = ?auto_31135 ?auto_31126 ) ) ( AVAILABLE ?auto_31133 ) ( TRUCK-AT ?auto_31131 ?auto_31129 ) ( AVAILABLE ?auto_31125 ) ( SURFACE-AT ?auto_31130 ?auto_31129 ) ( ON ?auto_31130 ?auto_31143 ) ( CLEAR ?auto_31130 ) ( not ( = ?auto_31122 ?auto_31143 ) ) ( not ( = ?auto_31123 ?auto_31143 ) ) ( not ( = ?auto_31128 ?auto_31143 ) ) ( not ( = ?auto_31134 ?auto_31143 ) ) ( not ( = ?auto_31124 ?auto_31143 ) ) ( not ( = ?auto_31132 ?auto_31143 ) ) ( not ( = ?auto_31140 ?auto_31143 ) ) ( not ( = ?auto_31130 ?auto_31143 ) ) ( not ( = ?auto_31135 ?auto_31143 ) ) ( not ( = ?auto_31126 ?auto_31143 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31125 ?auto_31130 ?auto_31143 ?auto_31129 )
      ( MAKE-ON ?auto_31122 ?auto_31123 )
      ( MAKE-ON-VERIFY ?auto_31122 ?auto_31123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31144 - SURFACE
      ?auto_31145 - SURFACE
    )
    :vars
    (
      ?auto_31160 - HOIST
      ?auto_31155 - PLACE
      ?auto_31162 - PLACE
      ?auto_31159 - HOIST
      ?auto_31150 - SURFACE
      ?auto_31164 - SURFACE
      ?auto_31152 - PLACE
      ?auto_31154 - HOIST
      ?auto_31147 - SURFACE
      ?auto_31146 - SURFACE
      ?auto_31156 - PLACE
      ?auto_31157 - HOIST
      ?auto_31161 - SURFACE
      ?auto_31163 - SURFACE
      ?auto_31153 - PLACE
      ?auto_31165 - HOIST
      ?auto_31151 - SURFACE
      ?auto_31158 - SURFACE
      ?auto_31148 - SURFACE
      ?auto_31149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31160 ?auto_31155 ) ( IS-CRATE ?auto_31144 ) ( not ( = ?auto_31144 ?auto_31145 ) ) ( not ( = ?auto_31162 ?auto_31155 ) ) ( HOIST-AT ?auto_31159 ?auto_31162 ) ( not ( = ?auto_31160 ?auto_31159 ) ) ( AVAILABLE ?auto_31159 ) ( SURFACE-AT ?auto_31144 ?auto_31162 ) ( ON ?auto_31144 ?auto_31150 ) ( CLEAR ?auto_31144 ) ( not ( = ?auto_31144 ?auto_31150 ) ) ( not ( = ?auto_31145 ?auto_31150 ) ) ( IS-CRATE ?auto_31145 ) ( not ( = ?auto_31144 ?auto_31164 ) ) ( not ( = ?auto_31145 ?auto_31164 ) ) ( not ( = ?auto_31150 ?auto_31164 ) ) ( not ( = ?auto_31152 ?auto_31155 ) ) ( not ( = ?auto_31162 ?auto_31152 ) ) ( HOIST-AT ?auto_31154 ?auto_31152 ) ( not ( = ?auto_31160 ?auto_31154 ) ) ( not ( = ?auto_31159 ?auto_31154 ) ) ( AVAILABLE ?auto_31154 ) ( SURFACE-AT ?auto_31145 ?auto_31152 ) ( ON ?auto_31145 ?auto_31147 ) ( CLEAR ?auto_31145 ) ( not ( = ?auto_31144 ?auto_31147 ) ) ( not ( = ?auto_31145 ?auto_31147 ) ) ( not ( = ?auto_31150 ?auto_31147 ) ) ( not ( = ?auto_31164 ?auto_31147 ) ) ( IS-CRATE ?auto_31164 ) ( not ( = ?auto_31144 ?auto_31146 ) ) ( not ( = ?auto_31145 ?auto_31146 ) ) ( not ( = ?auto_31150 ?auto_31146 ) ) ( not ( = ?auto_31164 ?auto_31146 ) ) ( not ( = ?auto_31147 ?auto_31146 ) ) ( not ( = ?auto_31156 ?auto_31155 ) ) ( not ( = ?auto_31162 ?auto_31156 ) ) ( not ( = ?auto_31152 ?auto_31156 ) ) ( HOIST-AT ?auto_31157 ?auto_31156 ) ( not ( = ?auto_31160 ?auto_31157 ) ) ( not ( = ?auto_31159 ?auto_31157 ) ) ( not ( = ?auto_31154 ?auto_31157 ) ) ( SURFACE-AT ?auto_31164 ?auto_31156 ) ( ON ?auto_31164 ?auto_31161 ) ( CLEAR ?auto_31164 ) ( not ( = ?auto_31144 ?auto_31161 ) ) ( not ( = ?auto_31145 ?auto_31161 ) ) ( not ( = ?auto_31150 ?auto_31161 ) ) ( not ( = ?auto_31164 ?auto_31161 ) ) ( not ( = ?auto_31147 ?auto_31161 ) ) ( not ( = ?auto_31146 ?auto_31161 ) ) ( IS-CRATE ?auto_31146 ) ( not ( = ?auto_31144 ?auto_31163 ) ) ( not ( = ?auto_31145 ?auto_31163 ) ) ( not ( = ?auto_31150 ?auto_31163 ) ) ( not ( = ?auto_31164 ?auto_31163 ) ) ( not ( = ?auto_31147 ?auto_31163 ) ) ( not ( = ?auto_31146 ?auto_31163 ) ) ( not ( = ?auto_31161 ?auto_31163 ) ) ( not ( = ?auto_31153 ?auto_31155 ) ) ( not ( = ?auto_31162 ?auto_31153 ) ) ( not ( = ?auto_31152 ?auto_31153 ) ) ( not ( = ?auto_31156 ?auto_31153 ) ) ( HOIST-AT ?auto_31165 ?auto_31153 ) ( not ( = ?auto_31160 ?auto_31165 ) ) ( not ( = ?auto_31159 ?auto_31165 ) ) ( not ( = ?auto_31154 ?auto_31165 ) ) ( not ( = ?auto_31157 ?auto_31165 ) ) ( AVAILABLE ?auto_31165 ) ( SURFACE-AT ?auto_31146 ?auto_31153 ) ( ON ?auto_31146 ?auto_31151 ) ( CLEAR ?auto_31146 ) ( not ( = ?auto_31144 ?auto_31151 ) ) ( not ( = ?auto_31145 ?auto_31151 ) ) ( not ( = ?auto_31150 ?auto_31151 ) ) ( not ( = ?auto_31164 ?auto_31151 ) ) ( not ( = ?auto_31147 ?auto_31151 ) ) ( not ( = ?auto_31146 ?auto_31151 ) ) ( not ( = ?auto_31161 ?auto_31151 ) ) ( not ( = ?auto_31163 ?auto_31151 ) ) ( SURFACE-AT ?auto_31158 ?auto_31155 ) ( CLEAR ?auto_31158 ) ( IS-CRATE ?auto_31163 ) ( not ( = ?auto_31144 ?auto_31158 ) ) ( not ( = ?auto_31145 ?auto_31158 ) ) ( not ( = ?auto_31150 ?auto_31158 ) ) ( not ( = ?auto_31164 ?auto_31158 ) ) ( not ( = ?auto_31147 ?auto_31158 ) ) ( not ( = ?auto_31146 ?auto_31158 ) ) ( not ( = ?auto_31161 ?auto_31158 ) ) ( not ( = ?auto_31163 ?auto_31158 ) ) ( not ( = ?auto_31151 ?auto_31158 ) ) ( AVAILABLE ?auto_31160 ) ( AVAILABLE ?auto_31157 ) ( SURFACE-AT ?auto_31163 ?auto_31156 ) ( ON ?auto_31163 ?auto_31148 ) ( CLEAR ?auto_31163 ) ( not ( = ?auto_31144 ?auto_31148 ) ) ( not ( = ?auto_31145 ?auto_31148 ) ) ( not ( = ?auto_31150 ?auto_31148 ) ) ( not ( = ?auto_31164 ?auto_31148 ) ) ( not ( = ?auto_31147 ?auto_31148 ) ) ( not ( = ?auto_31146 ?auto_31148 ) ) ( not ( = ?auto_31161 ?auto_31148 ) ) ( not ( = ?auto_31163 ?auto_31148 ) ) ( not ( = ?auto_31151 ?auto_31148 ) ) ( not ( = ?auto_31158 ?auto_31148 ) ) ( TRUCK-AT ?auto_31149 ?auto_31155 ) )
    :subtasks
    ( ( !DRIVE ?auto_31149 ?auto_31155 ?auto_31156 )
      ( MAKE-ON ?auto_31144 ?auto_31145 )
      ( MAKE-ON-VERIFY ?auto_31144 ?auto_31145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31166 - SURFACE
      ?auto_31167 - SURFACE
    )
    :vars
    (
      ?auto_31180 - HOIST
      ?auto_31171 - PLACE
      ?auto_31168 - PLACE
      ?auto_31185 - HOIST
      ?auto_31170 - SURFACE
      ?auto_31176 - SURFACE
      ?auto_31187 - PLACE
      ?auto_31172 - HOIST
      ?auto_31174 - SURFACE
      ?auto_31179 - SURFACE
      ?auto_31186 - PLACE
      ?auto_31175 - HOIST
      ?auto_31181 - SURFACE
      ?auto_31178 - SURFACE
      ?auto_31169 - PLACE
      ?auto_31173 - HOIST
      ?auto_31182 - SURFACE
      ?auto_31183 - SURFACE
      ?auto_31177 - SURFACE
      ?auto_31184 - TRUCK
      ?auto_31188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31180 ?auto_31171 ) ( IS-CRATE ?auto_31166 ) ( not ( = ?auto_31166 ?auto_31167 ) ) ( not ( = ?auto_31168 ?auto_31171 ) ) ( HOIST-AT ?auto_31185 ?auto_31168 ) ( not ( = ?auto_31180 ?auto_31185 ) ) ( AVAILABLE ?auto_31185 ) ( SURFACE-AT ?auto_31166 ?auto_31168 ) ( ON ?auto_31166 ?auto_31170 ) ( CLEAR ?auto_31166 ) ( not ( = ?auto_31166 ?auto_31170 ) ) ( not ( = ?auto_31167 ?auto_31170 ) ) ( IS-CRATE ?auto_31167 ) ( not ( = ?auto_31166 ?auto_31176 ) ) ( not ( = ?auto_31167 ?auto_31176 ) ) ( not ( = ?auto_31170 ?auto_31176 ) ) ( not ( = ?auto_31187 ?auto_31171 ) ) ( not ( = ?auto_31168 ?auto_31187 ) ) ( HOIST-AT ?auto_31172 ?auto_31187 ) ( not ( = ?auto_31180 ?auto_31172 ) ) ( not ( = ?auto_31185 ?auto_31172 ) ) ( AVAILABLE ?auto_31172 ) ( SURFACE-AT ?auto_31167 ?auto_31187 ) ( ON ?auto_31167 ?auto_31174 ) ( CLEAR ?auto_31167 ) ( not ( = ?auto_31166 ?auto_31174 ) ) ( not ( = ?auto_31167 ?auto_31174 ) ) ( not ( = ?auto_31170 ?auto_31174 ) ) ( not ( = ?auto_31176 ?auto_31174 ) ) ( IS-CRATE ?auto_31176 ) ( not ( = ?auto_31166 ?auto_31179 ) ) ( not ( = ?auto_31167 ?auto_31179 ) ) ( not ( = ?auto_31170 ?auto_31179 ) ) ( not ( = ?auto_31176 ?auto_31179 ) ) ( not ( = ?auto_31174 ?auto_31179 ) ) ( not ( = ?auto_31186 ?auto_31171 ) ) ( not ( = ?auto_31168 ?auto_31186 ) ) ( not ( = ?auto_31187 ?auto_31186 ) ) ( HOIST-AT ?auto_31175 ?auto_31186 ) ( not ( = ?auto_31180 ?auto_31175 ) ) ( not ( = ?auto_31185 ?auto_31175 ) ) ( not ( = ?auto_31172 ?auto_31175 ) ) ( SURFACE-AT ?auto_31176 ?auto_31186 ) ( ON ?auto_31176 ?auto_31181 ) ( CLEAR ?auto_31176 ) ( not ( = ?auto_31166 ?auto_31181 ) ) ( not ( = ?auto_31167 ?auto_31181 ) ) ( not ( = ?auto_31170 ?auto_31181 ) ) ( not ( = ?auto_31176 ?auto_31181 ) ) ( not ( = ?auto_31174 ?auto_31181 ) ) ( not ( = ?auto_31179 ?auto_31181 ) ) ( IS-CRATE ?auto_31179 ) ( not ( = ?auto_31166 ?auto_31178 ) ) ( not ( = ?auto_31167 ?auto_31178 ) ) ( not ( = ?auto_31170 ?auto_31178 ) ) ( not ( = ?auto_31176 ?auto_31178 ) ) ( not ( = ?auto_31174 ?auto_31178 ) ) ( not ( = ?auto_31179 ?auto_31178 ) ) ( not ( = ?auto_31181 ?auto_31178 ) ) ( not ( = ?auto_31169 ?auto_31171 ) ) ( not ( = ?auto_31168 ?auto_31169 ) ) ( not ( = ?auto_31187 ?auto_31169 ) ) ( not ( = ?auto_31186 ?auto_31169 ) ) ( HOIST-AT ?auto_31173 ?auto_31169 ) ( not ( = ?auto_31180 ?auto_31173 ) ) ( not ( = ?auto_31185 ?auto_31173 ) ) ( not ( = ?auto_31172 ?auto_31173 ) ) ( not ( = ?auto_31175 ?auto_31173 ) ) ( AVAILABLE ?auto_31173 ) ( SURFACE-AT ?auto_31179 ?auto_31169 ) ( ON ?auto_31179 ?auto_31182 ) ( CLEAR ?auto_31179 ) ( not ( = ?auto_31166 ?auto_31182 ) ) ( not ( = ?auto_31167 ?auto_31182 ) ) ( not ( = ?auto_31170 ?auto_31182 ) ) ( not ( = ?auto_31176 ?auto_31182 ) ) ( not ( = ?auto_31174 ?auto_31182 ) ) ( not ( = ?auto_31179 ?auto_31182 ) ) ( not ( = ?auto_31181 ?auto_31182 ) ) ( not ( = ?auto_31178 ?auto_31182 ) ) ( IS-CRATE ?auto_31178 ) ( not ( = ?auto_31166 ?auto_31183 ) ) ( not ( = ?auto_31167 ?auto_31183 ) ) ( not ( = ?auto_31170 ?auto_31183 ) ) ( not ( = ?auto_31176 ?auto_31183 ) ) ( not ( = ?auto_31174 ?auto_31183 ) ) ( not ( = ?auto_31179 ?auto_31183 ) ) ( not ( = ?auto_31181 ?auto_31183 ) ) ( not ( = ?auto_31178 ?auto_31183 ) ) ( not ( = ?auto_31182 ?auto_31183 ) ) ( AVAILABLE ?auto_31175 ) ( SURFACE-AT ?auto_31178 ?auto_31186 ) ( ON ?auto_31178 ?auto_31177 ) ( CLEAR ?auto_31178 ) ( not ( = ?auto_31166 ?auto_31177 ) ) ( not ( = ?auto_31167 ?auto_31177 ) ) ( not ( = ?auto_31170 ?auto_31177 ) ) ( not ( = ?auto_31176 ?auto_31177 ) ) ( not ( = ?auto_31174 ?auto_31177 ) ) ( not ( = ?auto_31179 ?auto_31177 ) ) ( not ( = ?auto_31181 ?auto_31177 ) ) ( not ( = ?auto_31178 ?auto_31177 ) ) ( not ( = ?auto_31182 ?auto_31177 ) ) ( not ( = ?auto_31183 ?auto_31177 ) ) ( TRUCK-AT ?auto_31184 ?auto_31171 ) ( SURFACE-AT ?auto_31188 ?auto_31171 ) ( CLEAR ?auto_31188 ) ( LIFTING ?auto_31180 ?auto_31183 ) ( IS-CRATE ?auto_31183 ) ( not ( = ?auto_31166 ?auto_31188 ) ) ( not ( = ?auto_31167 ?auto_31188 ) ) ( not ( = ?auto_31170 ?auto_31188 ) ) ( not ( = ?auto_31176 ?auto_31188 ) ) ( not ( = ?auto_31174 ?auto_31188 ) ) ( not ( = ?auto_31179 ?auto_31188 ) ) ( not ( = ?auto_31181 ?auto_31188 ) ) ( not ( = ?auto_31178 ?auto_31188 ) ) ( not ( = ?auto_31182 ?auto_31188 ) ) ( not ( = ?auto_31183 ?auto_31188 ) ) ( not ( = ?auto_31177 ?auto_31188 ) ) )
    :subtasks
    ( ( !DROP ?auto_31180 ?auto_31183 ?auto_31188 ?auto_31171 )
      ( MAKE-ON ?auto_31166 ?auto_31167 )
      ( MAKE-ON-VERIFY ?auto_31166 ?auto_31167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31189 - SURFACE
      ?auto_31190 - SURFACE
    )
    :vars
    (
      ?auto_31207 - HOIST
      ?auto_31192 - PLACE
      ?auto_31191 - PLACE
      ?auto_31204 - HOIST
      ?auto_31193 - SURFACE
      ?auto_31194 - SURFACE
      ?auto_31210 - PLACE
      ?auto_31203 - HOIST
      ?auto_31197 - SURFACE
      ?auto_31201 - SURFACE
      ?auto_31205 - PLACE
      ?auto_31209 - HOIST
      ?auto_31198 - SURFACE
      ?auto_31199 - SURFACE
      ?auto_31202 - PLACE
      ?auto_31208 - HOIST
      ?auto_31196 - SURFACE
      ?auto_31211 - SURFACE
      ?auto_31200 - SURFACE
      ?auto_31195 - TRUCK
      ?auto_31206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31207 ?auto_31192 ) ( IS-CRATE ?auto_31189 ) ( not ( = ?auto_31189 ?auto_31190 ) ) ( not ( = ?auto_31191 ?auto_31192 ) ) ( HOIST-AT ?auto_31204 ?auto_31191 ) ( not ( = ?auto_31207 ?auto_31204 ) ) ( AVAILABLE ?auto_31204 ) ( SURFACE-AT ?auto_31189 ?auto_31191 ) ( ON ?auto_31189 ?auto_31193 ) ( CLEAR ?auto_31189 ) ( not ( = ?auto_31189 ?auto_31193 ) ) ( not ( = ?auto_31190 ?auto_31193 ) ) ( IS-CRATE ?auto_31190 ) ( not ( = ?auto_31189 ?auto_31194 ) ) ( not ( = ?auto_31190 ?auto_31194 ) ) ( not ( = ?auto_31193 ?auto_31194 ) ) ( not ( = ?auto_31210 ?auto_31192 ) ) ( not ( = ?auto_31191 ?auto_31210 ) ) ( HOIST-AT ?auto_31203 ?auto_31210 ) ( not ( = ?auto_31207 ?auto_31203 ) ) ( not ( = ?auto_31204 ?auto_31203 ) ) ( AVAILABLE ?auto_31203 ) ( SURFACE-AT ?auto_31190 ?auto_31210 ) ( ON ?auto_31190 ?auto_31197 ) ( CLEAR ?auto_31190 ) ( not ( = ?auto_31189 ?auto_31197 ) ) ( not ( = ?auto_31190 ?auto_31197 ) ) ( not ( = ?auto_31193 ?auto_31197 ) ) ( not ( = ?auto_31194 ?auto_31197 ) ) ( IS-CRATE ?auto_31194 ) ( not ( = ?auto_31189 ?auto_31201 ) ) ( not ( = ?auto_31190 ?auto_31201 ) ) ( not ( = ?auto_31193 ?auto_31201 ) ) ( not ( = ?auto_31194 ?auto_31201 ) ) ( not ( = ?auto_31197 ?auto_31201 ) ) ( not ( = ?auto_31205 ?auto_31192 ) ) ( not ( = ?auto_31191 ?auto_31205 ) ) ( not ( = ?auto_31210 ?auto_31205 ) ) ( HOIST-AT ?auto_31209 ?auto_31205 ) ( not ( = ?auto_31207 ?auto_31209 ) ) ( not ( = ?auto_31204 ?auto_31209 ) ) ( not ( = ?auto_31203 ?auto_31209 ) ) ( SURFACE-AT ?auto_31194 ?auto_31205 ) ( ON ?auto_31194 ?auto_31198 ) ( CLEAR ?auto_31194 ) ( not ( = ?auto_31189 ?auto_31198 ) ) ( not ( = ?auto_31190 ?auto_31198 ) ) ( not ( = ?auto_31193 ?auto_31198 ) ) ( not ( = ?auto_31194 ?auto_31198 ) ) ( not ( = ?auto_31197 ?auto_31198 ) ) ( not ( = ?auto_31201 ?auto_31198 ) ) ( IS-CRATE ?auto_31201 ) ( not ( = ?auto_31189 ?auto_31199 ) ) ( not ( = ?auto_31190 ?auto_31199 ) ) ( not ( = ?auto_31193 ?auto_31199 ) ) ( not ( = ?auto_31194 ?auto_31199 ) ) ( not ( = ?auto_31197 ?auto_31199 ) ) ( not ( = ?auto_31201 ?auto_31199 ) ) ( not ( = ?auto_31198 ?auto_31199 ) ) ( not ( = ?auto_31202 ?auto_31192 ) ) ( not ( = ?auto_31191 ?auto_31202 ) ) ( not ( = ?auto_31210 ?auto_31202 ) ) ( not ( = ?auto_31205 ?auto_31202 ) ) ( HOIST-AT ?auto_31208 ?auto_31202 ) ( not ( = ?auto_31207 ?auto_31208 ) ) ( not ( = ?auto_31204 ?auto_31208 ) ) ( not ( = ?auto_31203 ?auto_31208 ) ) ( not ( = ?auto_31209 ?auto_31208 ) ) ( AVAILABLE ?auto_31208 ) ( SURFACE-AT ?auto_31201 ?auto_31202 ) ( ON ?auto_31201 ?auto_31196 ) ( CLEAR ?auto_31201 ) ( not ( = ?auto_31189 ?auto_31196 ) ) ( not ( = ?auto_31190 ?auto_31196 ) ) ( not ( = ?auto_31193 ?auto_31196 ) ) ( not ( = ?auto_31194 ?auto_31196 ) ) ( not ( = ?auto_31197 ?auto_31196 ) ) ( not ( = ?auto_31201 ?auto_31196 ) ) ( not ( = ?auto_31198 ?auto_31196 ) ) ( not ( = ?auto_31199 ?auto_31196 ) ) ( IS-CRATE ?auto_31199 ) ( not ( = ?auto_31189 ?auto_31211 ) ) ( not ( = ?auto_31190 ?auto_31211 ) ) ( not ( = ?auto_31193 ?auto_31211 ) ) ( not ( = ?auto_31194 ?auto_31211 ) ) ( not ( = ?auto_31197 ?auto_31211 ) ) ( not ( = ?auto_31201 ?auto_31211 ) ) ( not ( = ?auto_31198 ?auto_31211 ) ) ( not ( = ?auto_31199 ?auto_31211 ) ) ( not ( = ?auto_31196 ?auto_31211 ) ) ( AVAILABLE ?auto_31209 ) ( SURFACE-AT ?auto_31199 ?auto_31205 ) ( ON ?auto_31199 ?auto_31200 ) ( CLEAR ?auto_31199 ) ( not ( = ?auto_31189 ?auto_31200 ) ) ( not ( = ?auto_31190 ?auto_31200 ) ) ( not ( = ?auto_31193 ?auto_31200 ) ) ( not ( = ?auto_31194 ?auto_31200 ) ) ( not ( = ?auto_31197 ?auto_31200 ) ) ( not ( = ?auto_31201 ?auto_31200 ) ) ( not ( = ?auto_31198 ?auto_31200 ) ) ( not ( = ?auto_31199 ?auto_31200 ) ) ( not ( = ?auto_31196 ?auto_31200 ) ) ( not ( = ?auto_31211 ?auto_31200 ) ) ( TRUCK-AT ?auto_31195 ?auto_31192 ) ( SURFACE-AT ?auto_31206 ?auto_31192 ) ( CLEAR ?auto_31206 ) ( IS-CRATE ?auto_31211 ) ( not ( = ?auto_31189 ?auto_31206 ) ) ( not ( = ?auto_31190 ?auto_31206 ) ) ( not ( = ?auto_31193 ?auto_31206 ) ) ( not ( = ?auto_31194 ?auto_31206 ) ) ( not ( = ?auto_31197 ?auto_31206 ) ) ( not ( = ?auto_31201 ?auto_31206 ) ) ( not ( = ?auto_31198 ?auto_31206 ) ) ( not ( = ?auto_31199 ?auto_31206 ) ) ( not ( = ?auto_31196 ?auto_31206 ) ) ( not ( = ?auto_31211 ?auto_31206 ) ) ( not ( = ?auto_31200 ?auto_31206 ) ) ( AVAILABLE ?auto_31207 ) ( IN ?auto_31211 ?auto_31195 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31207 ?auto_31211 ?auto_31195 ?auto_31192 )
      ( MAKE-ON ?auto_31189 ?auto_31190 )
      ( MAKE-ON-VERIFY ?auto_31189 ?auto_31190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31212 - SURFACE
      ?auto_31213 - SURFACE
    )
    :vars
    (
      ?auto_31229 - HOIST
      ?auto_31224 - PLACE
      ?auto_31227 - PLACE
      ?auto_31222 - HOIST
      ?auto_31223 - SURFACE
      ?auto_31233 - SURFACE
      ?auto_31226 - PLACE
      ?auto_31218 - HOIST
      ?auto_31234 - SURFACE
      ?auto_31225 - SURFACE
      ?auto_31217 - PLACE
      ?auto_31231 - HOIST
      ?auto_31220 - SURFACE
      ?auto_31214 - SURFACE
      ?auto_31221 - PLACE
      ?auto_31219 - HOIST
      ?auto_31228 - SURFACE
      ?auto_31215 - SURFACE
      ?auto_31232 - SURFACE
      ?auto_31230 - SURFACE
      ?auto_31216 - TRUCK
      ?auto_31235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31229 ?auto_31224 ) ( IS-CRATE ?auto_31212 ) ( not ( = ?auto_31212 ?auto_31213 ) ) ( not ( = ?auto_31227 ?auto_31224 ) ) ( HOIST-AT ?auto_31222 ?auto_31227 ) ( not ( = ?auto_31229 ?auto_31222 ) ) ( AVAILABLE ?auto_31222 ) ( SURFACE-AT ?auto_31212 ?auto_31227 ) ( ON ?auto_31212 ?auto_31223 ) ( CLEAR ?auto_31212 ) ( not ( = ?auto_31212 ?auto_31223 ) ) ( not ( = ?auto_31213 ?auto_31223 ) ) ( IS-CRATE ?auto_31213 ) ( not ( = ?auto_31212 ?auto_31233 ) ) ( not ( = ?auto_31213 ?auto_31233 ) ) ( not ( = ?auto_31223 ?auto_31233 ) ) ( not ( = ?auto_31226 ?auto_31224 ) ) ( not ( = ?auto_31227 ?auto_31226 ) ) ( HOIST-AT ?auto_31218 ?auto_31226 ) ( not ( = ?auto_31229 ?auto_31218 ) ) ( not ( = ?auto_31222 ?auto_31218 ) ) ( AVAILABLE ?auto_31218 ) ( SURFACE-AT ?auto_31213 ?auto_31226 ) ( ON ?auto_31213 ?auto_31234 ) ( CLEAR ?auto_31213 ) ( not ( = ?auto_31212 ?auto_31234 ) ) ( not ( = ?auto_31213 ?auto_31234 ) ) ( not ( = ?auto_31223 ?auto_31234 ) ) ( not ( = ?auto_31233 ?auto_31234 ) ) ( IS-CRATE ?auto_31233 ) ( not ( = ?auto_31212 ?auto_31225 ) ) ( not ( = ?auto_31213 ?auto_31225 ) ) ( not ( = ?auto_31223 ?auto_31225 ) ) ( not ( = ?auto_31233 ?auto_31225 ) ) ( not ( = ?auto_31234 ?auto_31225 ) ) ( not ( = ?auto_31217 ?auto_31224 ) ) ( not ( = ?auto_31227 ?auto_31217 ) ) ( not ( = ?auto_31226 ?auto_31217 ) ) ( HOIST-AT ?auto_31231 ?auto_31217 ) ( not ( = ?auto_31229 ?auto_31231 ) ) ( not ( = ?auto_31222 ?auto_31231 ) ) ( not ( = ?auto_31218 ?auto_31231 ) ) ( SURFACE-AT ?auto_31233 ?auto_31217 ) ( ON ?auto_31233 ?auto_31220 ) ( CLEAR ?auto_31233 ) ( not ( = ?auto_31212 ?auto_31220 ) ) ( not ( = ?auto_31213 ?auto_31220 ) ) ( not ( = ?auto_31223 ?auto_31220 ) ) ( not ( = ?auto_31233 ?auto_31220 ) ) ( not ( = ?auto_31234 ?auto_31220 ) ) ( not ( = ?auto_31225 ?auto_31220 ) ) ( IS-CRATE ?auto_31225 ) ( not ( = ?auto_31212 ?auto_31214 ) ) ( not ( = ?auto_31213 ?auto_31214 ) ) ( not ( = ?auto_31223 ?auto_31214 ) ) ( not ( = ?auto_31233 ?auto_31214 ) ) ( not ( = ?auto_31234 ?auto_31214 ) ) ( not ( = ?auto_31225 ?auto_31214 ) ) ( not ( = ?auto_31220 ?auto_31214 ) ) ( not ( = ?auto_31221 ?auto_31224 ) ) ( not ( = ?auto_31227 ?auto_31221 ) ) ( not ( = ?auto_31226 ?auto_31221 ) ) ( not ( = ?auto_31217 ?auto_31221 ) ) ( HOIST-AT ?auto_31219 ?auto_31221 ) ( not ( = ?auto_31229 ?auto_31219 ) ) ( not ( = ?auto_31222 ?auto_31219 ) ) ( not ( = ?auto_31218 ?auto_31219 ) ) ( not ( = ?auto_31231 ?auto_31219 ) ) ( AVAILABLE ?auto_31219 ) ( SURFACE-AT ?auto_31225 ?auto_31221 ) ( ON ?auto_31225 ?auto_31228 ) ( CLEAR ?auto_31225 ) ( not ( = ?auto_31212 ?auto_31228 ) ) ( not ( = ?auto_31213 ?auto_31228 ) ) ( not ( = ?auto_31223 ?auto_31228 ) ) ( not ( = ?auto_31233 ?auto_31228 ) ) ( not ( = ?auto_31234 ?auto_31228 ) ) ( not ( = ?auto_31225 ?auto_31228 ) ) ( not ( = ?auto_31220 ?auto_31228 ) ) ( not ( = ?auto_31214 ?auto_31228 ) ) ( IS-CRATE ?auto_31214 ) ( not ( = ?auto_31212 ?auto_31215 ) ) ( not ( = ?auto_31213 ?auto_31215 ) ) ( not ( = ?auto_31223 ?auto_31215 ) ) ( not ( = ?auto_31233 ?auto_31215 ) ) ( not ( = ?auto_31234 ?auto_31215 ) ) ( not ( = ?auto_31225 ?auto_31215 ) ) ( not ( = ?auto_31220 ?auto_31215 ) ) ( not ( = ?auto_31214 ?auto_31215 ) ) ( not ( = ?auto_31228 ?auto_31215 ) ) ( AVAILABLE ?auto_31231 ) ( SURFACE-AT ?auto_31214 ?auto_31217 ) ( ON ?auto_31214 ?auto_31232 ) ( CLEAR ?auto_31214 ) ( not ( = ?auto_31212 ?auto_31232 ) ) ( not ( = ?auto_31213 ?auto_31232 ) ) ( not ( = ?auto_31223 ?auto_31232 ) ) ( not ( = ?auto_31233 ?auto_31232 ) ) ( not ( = ?auto_31234 ?auto_31232 ) ) ( not ( = ?auto_31225 ?auto_31232 ) ) ( not ( = ?auto_31220 ?auto_31232 ) ) ( not ( = ?auto_31214 ?auto_31232 ) ) ( not ( = ?auto_31228 ?auto_31232 ) ) ( not ( = ?auto_31215 ?auto_31232 ) ) ( SURFACE-AT ?auto_31230 ?auto_31224 ) ( CLEAR ?auto_31230 ) ( IS-CRATE ?auto_31215 ) ( not ( = ?auto_31212 ?auto_31230 ) ) ( not ( = ?auto_31213 ?auto_31230 ) ) ( not ( = ?auto_31223 ?auto_31230 ) ) ( not ( = ?auto_31233 ?auto_31230 ) ) ( not ( = ?auto_31234 ?auto_31230 ) ) ( not ( = ?auto_31225 ?auto_31230 ) ) ( not ( = ?auto_31220 ?auto_31230 ) ) ( not ( = ?auto_31214 ?auto_31230 ) ) ( not ( = ?auto_31228 ?auto_31230 ) ) ( not ( = ?auto_31215 ?auto_31230 ) ) ( not ( = ?auto_31232 ?auto_31230 ) ) ( AVAILABLE ?auto_31229 ) ( IN ?auto_31215 ?auto_31216 ) ( TRUCK-AT ?auto_31216 ?auto_31235 ) ( not ( = ?auto_31235 ?auto_31224 ) ) ( not ( = ?auto_31227 ?auto_31235 ) ) ( not ( = ?auto_31226 ?auto_31235 ) ) ( not ( = ?auto_31217 ?auto_31235 ) ) ( not ( = ?auto_31221 ?auto_31235 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31216 ?auto_31235 ?auto_31224 )
      ( MAKE-ON ?auto_31212 ?auto_31213 )
      ( MAKE-ON-VERIFY ?auto_31212 ?auto_31213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31236 - SURFACE
      ?auto_31237 - SURFACE
    )
    :vars
    (
      ?auto_31238 - HOIST
      ?auto_31256 - PLACE
      ?auto_31254 - PLACE
      ?auto_31251 - HOIST
      ?auto_31257 - SURFACE
      ?auto_31247 - SURFACE
      ?auto_31239 - PLACE
      ?auto_31255 - HOIST
      ?auto_31259 - SURFACE
      ?auto_31258 - SURFACE
      ?auto_31249 - PLACE
      ?auto_31245 - HOIST
      ?auto_31253 - SURFACE
      ?auto_31250 - SURFACE
      ?auto_31241 - PLACE
      ?auto_31248 - HOIST
      ?auto_31242 - SURFACE
      ?auto_31243 - SURFACE
      ?auto_31246 - SURFACE
      ?auto_31244 - SURFACE
      ?auto_31240 - TRUCK
      ?auto_31252 - PLACE
      ?auto_31260 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31238 ?auto_31256 ) ( IS-CRATE ?auto_31236 ) ( not ( = ?auto_31236 ?auto_31237 ) ) ( not ( = ?auto_31254 ?auto_31256 ) ) ( HOIST-AT ?auto_31251 ?auto_31254 ) ( not ( = ?auto_31238 ?auto_31251 ) ) ( AVAILABLE ?auto_31251 ) ( SURFACE-AT ?auto_31236 ?auto_31254 ) ( ON ?auto_31236 ?auto_31257 ) ( CLEAR ?auto_31236 ) ( not ( = ?auto_31236 ?auto_31257 ) ) ( not ( = ?auto_31237 ?auto_31257 ) ) ( IS-CRATE ?auto_31237 ) ( not ( = ?auto_31236 ?auto_31247 ) ) ( not ( = ?auto_31237 ?auto_31247 ) ) ( not ( = ?auto_31257 ?auto_31247 ) ) ( not ( = ?auto_31239 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31239 ) ) ( HOIST-AT ?auto_31255 ?auto_31239 ) ( not ( = ?auto_31238 ?auto_31255 ) ) ( not ( = ?auto_31251 ?auto_31255 ) ) ( AVAILABLE ?auto_31255 ) ( SURFACE-AT ?auto_31237 ?auto_31239 ) ( ON ?auto_31237 ?auto_31259 ) ( CLEAR ?auto_31237 ) ( not ( = ?auto_31236 ?auto_31259 ) ) ( not ( = ?auto_31237 ?auto_31259 ) ) ( not ( = ?auto_31257 ?auto_31259 ) ) ( not ( = ?auto_31247 ?auto_31259 ) ) ( IS-CRATE ?auto_31247 ) ( not ( = ?auto_31236 ?auto_31258 ) ) ( not ( = ?auto_31237 ?auto_31258 ) ) ( not ( = ?auto_31257 ?auto_31258 ) ) ( not ( = ?auto_31247 ?auto_31258 ) ) ( not ( = ?auto_31259 ?auto_31258 ) ) ( not ( = ?auto_31249 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31249 ) ) ( not ( = ?auto_31239 ?auto_31249 ) ) ( HOIST-AT ?auto_31245 ?auto_31249 ) ( not ( = ?auto_31238 ?auto_31245 ) ) ( not ( = ?auto_31251 ?auto_31245 ) ) ( not ( = ?auto_31255 ?auto_31245 ) ) ( SURFACE-AT ?auto_31247 ?auto_31249 ) ( ON ?auto_31247 ?auto_31253 ) ( CLEAR ?auto_31247 ) ( not ( = ?auto_31236 ?auto_31253 ) ) ( not ( = ?auto_31237 ?auto_31253 ) ) ( not ( = ?auto_31257 ?auto_31253 ) ) ( not ( = ?auto_31247 ?auto_31253 ) ) ( not ( = ?auto_31259 ?auto_31253 ) ) ( not ( = ?auto_31258 ?auto_31253 ) ) ( IS-CRATE ?auto_31258 ) ( not ( = ?auto_31236 ?auto_31250 ) ) ( not ( = ?auto_31237 ?auto_31250 ) ) ( not ( = ?auto_31257 ?auto_31250 ) ) ( not ( = ?auto_31247 ?auto_31250 ) ) ( not ( = ?auto_31259 ?auto_31250 ) ) ( not ( = ?auto_31258 ?auto_31250 ) ) ( not ( = ?auto_31253 ?auto_31250 ) ) ( not ( = ?auto_31241 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31241 ) ) ( not ( = ?auto_31239 ?auto_31241 ) ) ( not ( = ?auto_31249 ?auto_31241 ) ) ( HOIST-AT ?auto_31248 ?auto_31241 ) ( not ( = ?auto_31238 ?auto_31248 ) ) ( not ( = ?auto_31251 ?auto_31248 ) ) ( not ( = ?auto_31255 ?auto_31248 ) ) ( not ( = ?auto_31245 ?auto_31248 ) ) ( AVAILABLE ?auto_31248 ) ( SURFACE-AT ?auto_31258 ?auto_31241 ) ( ON ?auto_31258 ?auto_31242 ) ( CLEAR ?auto_31258 ) ( not ( = ?auto_31236 ?auto_31242 ) ) ( not ( = ?auto_31237 ?auto_31242 ) ) ( not ( = ?auto_31257 ?auto_31242 ) ) ( not ( = ?auto_31247 ?auto_31242 ) ) ( not ( = ?auto_31259 ?auto_31242 ) ) ( not ( = ?auto_31258 ?auto_31242 ) ) ( not ( = ?auto_31253 ?auto_31242 ) ) ( not ( = ?auto_31250 ?auto_31242 ) ) ( IS-CRATE ?auto_31250 ) ( not ( = ?auto_31236 ?auto_31243 ) ) ( not ( = ?auto_31237 ?auto_31243 ) ) ( not ( = ?auto_31257 ?auto_31243 ) ) ( not ( = ?auto_31247 ?auto_31243 ) ) ( not ( = ?auto_31259 ?auto_31243 ) ) ( not ( = ?auto_31258 ?auto_31243 ) ) ( not ( = ?auto_31253 ?auto_31243 ) ) ( not ( = ?auto_31250 ?auto_31243 ) ) ( not ( = ?auto_31242 ?auto_31243 ) ) ( AVAILABLE ?auto_31245 ) ( SURFACE-AT ?auto_31250 ?auto_31249 ) ( ON ?auto_31250 ?auto_31246 ) ( CLEAR ?auto_31250 ) ( not ( = ?auto_31236 ?auto_31246 ) ) ( not ( = ?auto_31237 ?auto_31246 ) ) ( not ( = ?auto_31257 ?auto_31246 ) ) ( not ( = ?auto_31247 ?auto_31246 ) ) ( not ( = ?auto_31259 ?auto_31246 ) ) ( not ( = ?auto_31258 ?auto_31246 ) ) ( not ( = ?auto_31253 ?auto_31246 ) ) ( not ( = ?auto_31250 ?auto_31246 ) ) ( not ( = ?auto_31242 ?auto_31246 ) ) ( not ( = ?auto_31243 ?auto_31246 ) ) ( SURFACE-AT ?auto_31244 ?auto_31256 ) ( CLEAR ?auto_31244 ) ( IS-CRATE ?auto_31243 ) ( not ( = ?auto_31236 ?auto_31244 ) ) ( not ( = ?auto_31237 ?auto_31244 ) ) ( not ( = ?auto_31257 ?auto_31244 ) ) ( not ( = ?auto_31247 ?auto_31244 ) ) ( not ( = ?auto_31259 ?auto_31244 ) ) ( not ( = ?auto_31258 ?auto_31244 ) ) ( not ( = ?auto_31253 ?auto_31244 ) ) ( not ( = ?auto_31250 ?auto_31244 ) ) ( not ( = ?auto_31242 ?auto_31244 ) ) ( not ( = ?auto_31243 ?auto_31244 ) ) ( not ( = ?auto_31246 ?auto_31244 ) ) ( AVAILABLE ?auto_31238 ) ( TRUCK-AT ?auto_31240 ?auto_31252 ) ( not ( = ?auto_31252 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31252 ) ) ( not ( = ?auto_31239 ?auto_31252 ) ) ( not ( = ?auto_31249 ?auto_31252 ) ) ( not ( = ?auto_31241 ?auto_31252 ) ) ( HOIST-AT ?auto_31260 ?auto_31252 ) ( LIFTING ?auto_31260 ?auto_31243 ) ( not ( = ?auto_31238 ?auto_31260 ) ) ( not ( = ?auto_31251 ?auto_31260 ) ) ( not ( = ?auto_31255 ?auto_31260 ) ) ( not ( = ?auto_31245 ?auto_31260 ) ) ( not ( = ?auto_31248 ?auto_31260 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31260 ?auto_31243 ?auto_31240 ?auto_31252 )
      ( MAKE-ON ?auto_31236 ?auto_31237 )
      ( MAKE-ON-VERIFY ?auto_31236 ?auto_31237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31261 - SURFACE
      ?auto_31262 - SURFACE
    )
    :vars
    (
      ?auto_31282 - HOIST
      ?auto_31265 - PLACE
      ?auto_31279 - PLACE
      ?auto_31280 - HOIST
      ?auto_31273 - SURFACE
      ?auto_31281 - SURFACE
      ?auto_31271 - PLACE
      ?auto_31263 - HOIST
      ?auto_31266 - SURFACE
      ?auto_31285 - SURFACE
      ?auto_31277 - PLACE
      ?auto_31268 - HOIST
      ?auto_31274 - SURFACE
      ?auto_31278 - SURFACE
      ?auto_31270 - PLACE
      ?auto_31276 - HOIST
      ?auto_31272 - SURFACE
      ?auto_31267 - SURFACE
      ?auto_31264 - SURFACE
      ?auto_31275 - SURFACE
      ?auto_31269 - TRUCK
      ?auto_31283 - PLACE
      ?auto_31284 - HOIST
      ?auto_31286 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31282 ?auto_31265 ) ( IS-CRATE ?auto_31261 ) ( not ( = ?auto_31261 ?auto_31262 ) ) ( not ( = ?auto_31279 ?auto_31265 ) ) ( HOIST-AT ?auto_31280 ?auto_31279 ) ( not ( = ?auto_31282 ?auto_31280 ) ) ( AVAILABLE ?auto_31280 ) ( SURFACE-AT ?auto_31261 ?auto_31279 ) ( ON ?auto_31261 ?auto_31273 ) ( CLEAR ?auto_31261 ) ( not ( = ?auto_31261 ?auto_31273 ) ) ( not ( = ?auto_31262 ?auto_31273 ) ) ( IS-CRATE ?auto_31262 ) ( not ( = ?auto_31261 ?auto_31281 ) ) ( not ( = ?auto_31262 ?auto_31281 ) ) ( not ( = ?auto_31273 ?auto_31281 ) ) ( not ( = ?auto_31271 ?auto_31265 ) ) ( not ( = ?auto_31279 ?auto_31271 ) ) ( HOIST-AT ?auto_31263 ?auto_31271 ) ( not ( = ?auto_31282 ?auto_31263 ) ) ( not ( = ?auto_31280 ?auto_31263 ) ) ( AVAILABLE ?auto_31263 ) ( SURFACE-AT ?auto_31262 ?auto_31271 ) ( ON ?auto_31262 ?auto_31266 ) ( CLEAR ?auto_31262 ) ( not ( = ?auto_31261 ?auto_31266 ) ) ( not ( = ?auto_31262 ?auto_31266 ) ) ( not ( = ?auto_31273 ?auto_31266 ) ) ( not ( = ?auto_31281 ?auto_31266 ) ) ( IS-CRATE ?auto_31281 ) ( not ( = ?auto_31261 ?auto_31285 ) ) ( not ( = ?auto_31262 ?auto_31285 ) ) ( not ( = ?auto_31273 ?auto_31285 ) ) ( not ( = ?auto_31281 ?auto_31285 ) ) ( not ( = ?auto_31266 ?auto_31285 ) ) ( not ( = ?auto_31277 ?auto_31265 ) ) ( not ( = ?auto_31279 ?auto_31277 ) ) ( not ( = ?auto_31271 ?auto_31277 ) ) ( HOIST-AT ?auto_31268 ?auto_31277 ) ( not ( = ?auto_31282 ?auto_31268 ) ) ( not ( = ?auto_31280 ?auto_31268 ) ) ( not ( = ?auto_31263 ?auto_31268 ) ) ( SURFACE-AT ?auto_31281 ?auto_31277 ) ( ON ?auto_31281 ?auto_31274 ) ( CLEAR ?auto_31281 ) ( not ( = ?auto_31261 ?auto_31274 ) ) ( not ( = ?auto_31262 ?auto_31274 ) ) ( not ( = ?auto_31273 ?auto_31274 ) ) ( not ( = ?auto_31281 ?auto_31274 ) ) ( not ( = ?auto_31266 ?auto_31274 ) ) ( not ( = ?auto_31285 ?auto_31274 ) ) ( IS-CRATE ?auto_31285 ) ( not ( = ?auto_31261 ?auto_31278 ) ) ( not ( = ?auto_31262 ?auto_31278 ) ) ( not ( = ?auto_31273 ?auto_31278 ) ) ( not ( = ?auto_31281 ?auto_31278 ) ) ( not ( = ?auto_31266 ?auto_31278 ) ) ( not ( = ?auto_31285 ?auto_31278 ) ) ( not ( = ?auto_31274 ?auto_31278 ) ) ( not ( = ?auto_31270 ?auto_31265 ) ) ( not ( = ?auto_31279 ?auto_31270 ) ) ( not ( = ?auto_31271 ?auto_31270 ) ) ( not ( = ?auto_31277 ?auto_31270 ) ) ( HOIST-AT ?auto_31276 ?auto_31270 ) ( not ( = ?auto_31282 ?auto_31276 ) ) ( not ( = ?auto_31280 ?auto_31276 ) ) ( not ( = ?auto_31263 ?auto_31276 ) ) ( not ( = ?auto_31268 ?auto_31276 ) ) ( AVAILABLE ?auto_31276 ) ( SURFACE-AT ?auto_31285 ?auto_31270 ) ( ON ?auto_31285 ?auto_31272 ) ( CLEAR ?auto_31285 ) ( not ( = ?auto_31261 ?auto_31272 ) ) ( not ( = ?auto_31262 ?auto_31272 ) ) ( not ( = ?auto_31273 ?auto_31272 ) ) ( not ( = ?auto_31281 ?auto_31272 ) ) ( not ( = ?auto_31266 ?auto_31272 ) ) ( not ( = ?auto_31285 ?auto_31272 ) ) ( not ( = ?auto_31274 ?auto_31272 ) ) ( not ( = ?auto_31278 ?auto_31272 ) ) ( IS-CRATE ?auto_31278 ) ( not ( = ?auto_31261 ?auto_31267 ) ) ( not ( = ?auto_31262 ?auto_31267 ) ) ( not ( = ?auto_31273 ?auto_31267 ) ) ( not ( = ?auto_31281 ?auto_31267 ) ) ( not ( = ?auto_31266 ?auto_31267 ) ) ( not ( = ?auto_31285 ?auto_31267 ) ) ( not ( = ?auto_31274 ?auto_31267 ) ) ( not ( = ?auto_31278 ?auto_31267 ) ) ( not ( = ?auto_31272 ?auto_31267 ) ) ( AVAILABLE ?auto_31268 ) ( SURFACE-AT ?auto_31278 ?auto_31277 ) ( ON ?auto_31278 ?auto_31264 ) ( CLEAR ?auto_31278 ) ( not ( = ?auto_31261 ?auto_31264 ) ) ( not ( = ?auto_31262 ?auto_31264 ) ) ( not ( = ?auto_31273 ?auto_31264 ) ) ( not ( = ?auto_31281 ?auto_31264 ) ) ( not ( = ?auto_31266 ?auto_31264 ) ) ( not ( = ?auto_31285 ?auto_31264 ) ) ( not ( = ?auto_31274 ?auto_31264 ) ) ( not ( = ?auto_31278 ?auto_31264 ) ) ( not ( = ?auto_31272 ?auto_31264 ) ) ( not ( = ?auto_31267 ?auto_31264 ) ) ( SURFACE-AT ?auto_31275 ?auto_31265 ) ( CLEAR ?auto_31275 ) ( IS-CRATE ?auto_31267 ) ( not ( = ?auto_31261 ?auto_31275 ) ) ( not ( = ?auto_31262 ?auto_31275 ) ) ( not ( = ?auto_31273 ?auto_31275 ) ) ( not ( = ?auto_31281 ?auto_31275 ) ) ( not ( = ?auto_31266 ?auto_31275 ) ) ( not ( = ?auto_31285 ?auto_31275 ) ) ( not ( = ?auto_31274 ?auto_31275 ) ) ( not ( = ?auto_31278 ?auto_31275 ) ) ( not ( = ?auto_31272 ?auto_31275 ) ) ( not ( = ?auto_31267 ?auto_31275 ) ) ( not ( = ?auto_31264 ?auto_31275 ) ) ( AVAILABLE ?auto_31282 ) ( TRUCK-AT ?auto_31269 ?auto_31283 ) ( not ( = ?auto_31283 ?auto_31265 ) ) ( not ( = ?auto_31279 ?auto_31283 ) ) ( not ( = ?auto_31271 ?auto_31283 ) ) ( not ( = ?auto_31277 ?auto_31283 ) ) ( not ( = ?auto_31270 ?auto_31283 ) ) ( HOIST-AT ?auto_31284 ?auto_31283 ) ( not ( = ?auto_31282 ?auto_31284 ) ) ( not ( = ?auto_31280 ?auto_31284 ) ) ( not ( = ?auto_31263 ?auto_31284 ) ) ( not ( = ?auto_31268 ?auto_31284 ) ) ( not ( = ?auto_31276 ?auto_31284 ) ) ( AVAILABLE ?auto_31284 ) ( SURFACE-AT ?auto_31267 ?auto_31283 ) ( ON ?auto_31267 ?auto_31286 ) ( CLEAR ?auto_31267 ) ( not ( = ?auto_31261 ?auto_31286 ) ) ( not ( = ?auto_31262 ?auto_31286 ) ) ( not ( = ?auto_31273 ?auto_31286 ) ) ( not ( = ?auto_31281 ?auto_31286 ) ) ( not ( = ?auto_31266 ?auto_31286 ) ) ( not ( = ?auto_31285 ?auto_31286 ) ) ( not ( = ?auto_31274 ?auto_31286 ) ) ( not ( = ?auto_31278 ?auto_31286 ) ) ( not ( = ?auto_31272 ?auto_31286 ) ) ( not ( = ?auto_31267 ?auto_31286 ) ) ( not ( = ?auto_31264 ?auto_31286 ) ) ( not ( = ?auto_31275 ?auto_31286 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31284 ?auto_31267 ?auto_31286 ?auto_31283 )
      ( MAKE-ON ?auto_31261 ?auto_31262 )
      ( MAKE-ON-VERIFY ?auto_31261 ?auto_31262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31287 - SURFACE
      ?auto_31288 - SURFACE
    )
    :vars
    (
      ?auto_31303 - HOIST
      ?auto_31294 - PLACE
      ?auto_31312 - PLACE
      ?auto_31298 - HOIST
      ?auto_31306 - SURFACE
      ?auto_31299 - SURFACE
      ?auto_31291 - PLACE
      ?auto_31311 - HOIST
      ?auto_31296 - SURFACE
      ?auto_31308 - SURFACE
      ?auto_31290 - PLACE
      ?auto_31297 - HOIST
      ?auto_31300 - SURFACE
      ?auto_31310 - SURFACE
      ?auto_31309 - PLACE
      ?auto_31302 - HOIST
      ?auto_31305 - SURFACE
      ?auto_31295 - SURFACE
      ?auto_31292 - SURFACE
      ?auto_31301 - SURFACE
      ?auto_31304 - PLACE
      ?auto_31307 - HOIST
      ?auto_31293 - SURFACE
      ?auto_31289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31303 ?auto_31294 ) ( IS-CRATE ?auto_31287 ) ( not ( = ?auto_31287 ?auto_31288 ) ) ( not ( = ?auto_31312 ?auto_31294 ) ) ( HOIST-AT ?auto_31298 ?auto_31312 ) ( not ( = ?auto_31303 ?auto_31298 ) ) ( AVAILABLE ?auto_31298 ) ( SURFACE-AT ?auto_31287 ?auto_31312 ) ( ON ?auto_31287 ?auto_31306 ) ( CLEAR ?auto_31287 ) ( not ( = ?auto_31287 ?auto_31306 ) ) ( not ( = ?auto_31288 ?auto_31306 ) ) ( IS-CRATE ?auto_31288 ) ( not ( = ?auto_31287 ?auto_31299 ) ) ( not ( = ?auto_31288 ?auto_31299 ) ) ( not ( = ?auto_31306 ?auto_31299 ) ) ( not ( = ?auto_31291 ?auto_31294 ) ) ( not ( = ?auto_31312 ?auto_31291 ) ) ( HOIST-AT ?auto_31311 ?auto_31291 ) ( not ( = ?auto_31303 ?auto_31311 ) ) ( not ( = ?auto_31298 ?auto_31311 ) ) ( AVAILABLE ?auto_31311 ) ( SURFACE-AT ?auto_31288 ?auto_31291 ) ( ON ?auto_31288 ?auto_31296 ) ( CLEAR ?auto_31288 ) ( not ( = ?auto_31287 ?auto_31296 ) ) ( not ( = ?auto_31288 ?auto_31296 ) ) ( not ( = ?auto_31306 ?auto_31296 ) ) ( not ( = ?auto_31299 ?auto_31296 ) ) ( IS-CRATE ?auto_31299 ) ( not ( = ?auto_31287 ?auto_31308 ) ) ( not ( = ?auto_31288 ?auto_31308 ) ) ( not ( = ?auto_31306 ?auto_31308 ) ) ( not ( = ?auto_31299 ?auto_31308 ) ) ( not ( = ?auto_31296 ?auto_31308 ) ) ( not ( = ?auto_31290 ?auto_31294 ) ) ( not ( = ?auto_31312 ?auto_31290 ) ) ( not ( = ?auto_31291 ?auto_31290 ) ) ( HOIST-AT ?auto_31297 ?auto_31290 ) ( not ( = ?auto_31303 ?auto_31297 ) ) ( not ( = ?auto_31298 ?auto_31297 ) ) ( not ( = ?auto_31311 ?auto_31297 ) ) ( SURFACE-AT ?auto_31299 ?auto_31290 ) ( ON ?auto_31299 ?auto_31300 ) ( CLEAR ?auto_31299 ) ( not ( = ?auto_31287 ?auto_31300 ) ) ( not ( = ?auto_31288 ?auto_31300 ) ) ( not ( = ?auto_31306 ?auto_31300 ) ) ( not ( = ?auto_31299 ?auto_31300 ) ) ( not ( = ?auto_31296 ?auto_31300 ) ) ( not ( = ?auto_31308 ?auto_31300 ) ) ( IS-CRATE ?auto_31308 ) ( not ( = ?auto_31287 ?auto_31310 ) ) ( not ( = ?auto_31288 ?auto_31310 ) ) ( not ( = ?auto_31306 ?auto_31310 ) ) ( not ( = ?auto_31299 ?auto_31310 ) ) ( not ( = ?auto_31296 ?auto_31310 ) ) ( not ( = ?auto_31308 ?auto_31310 ) ) ( not ( = ?auto_31300 ?auto_31310 ) ) ( not ( = ?auto_31309 ?auto_31294 ) ) ( not ( = ?auto_31312 ?auto_31309 ) ) ( not ( = ?auto_31291 ?auto_31309 ) ) ( not ( = ?auto_31290 ?auto_31309 ) ) ( HOIST-AT ?auto_31302 ?auto_31309 ) ( not ( = ?auto_31303 ?auto_31302 ) ) ( not ( = ?auto_31298 ?auto_31302 ) ) ( not ( = ?auto_31311 ?auto_31302 ) ) ( not ( = ?auto_31297 ?auto_31302 ) ) ( AVAILABLE ?auto_31302 ) ( SURFACE-AT ?auto_31308 ?auto_31309 ) ( ON ?auto_31308 ?auto_31305 ) ( CLEAR ?auto_31308 ) ( not ( = ?auto_31287 ?auto_31305 ) ) ( not ( = ?auto_31288 ?auto_31305 ) ) ( not ( = ?auto_31306 ?auto_31305 ) ) ( not ( = ?auto_31299 ?auto_31305 ) ) ( not ( = ?auto_31296 ?auto_31305 ) ) ( not ( = ?auto_31308 ?auto_31305 ) ) ( not ( = ?auto_31300 ?auto_31305 ) ) ( not ( = ?auto_31310 ?auto_31305 ) ) ( IS-CRATE ?auto_31310 ) ( not ( = ?auto_31287 ?auto_31295 ) ) ( not ( = ?auto_31288 ?auto_31295 ) ) ( not ( = ?auto_31306 ?auto_31295 ) ) ( not ( = ?auto_31299 ?auto_31295 ) ) ( not ( = ?auto_31296 ?auto_31295 ) ) ( not ( = ?auto_31308 ?auto_31295 ) ) ( not ( = ?auto_31300 ?auto_31295 ) ) ( not ( = ?auto_31310 ?auto_31295 ) ) ( not ( = ?auto_31305 ?auto_31295 ) ) ( AVAILABLE ?auto_31297 ) ( SURFACE-AT ?auto_31310 ?auto_31290 ) ( ON ?auto_31310 ?auto_31292 ) ( CLEAR ?auto_31310 ) ( not ( = ?auto_31287 ?auto_31292 ) ) ( not ( = ?auto_31288 ?auto_31292 ) ) ( not ( = ?auto_31306 ?auto_31292 ) ) ( not ( = ?auto_31299 ?auto_31292 ) ) ( not ( = ?auto_31296 ?auto_31292 ) ) ( not ( = ?auto_31308 ?auto_31292 ) ) ( not ( = ?auto_31300 ?auto_31292 ) ) ( not ( = ?auto_31310 ?auto_31292 ) ) ( not ( = ?auto_31305 ?auto_31292 ) ) ( not ( = ?auto_31295 ?auto_31292 ) ) ( SURFACE-AT ?auto_31301 ?auto_31294 ) ( CLEAR ?auto_31301 ) ( IS-CRATE ?auto_31295 ) ( not ( = ?auto_31287 ?auto_31301 ) ) ( not ( = ?auto_31288 ?auto_31301 ) ) ( not ( = ?auto_31306 ?auto_31301 ) ) ( not ( = ?auto_31299 ?auto_31301 ) ) ( not ( = ?auto_31296 ?auto_31301 ) ) ( not ( = ?auto_31308 ?auto_31301 ) ) ( not ( = ?auto_31300 ?auto_31301 ) ) ( not ( = ?auto_31310 ?auto_31301 ) ) ( not ( = ?auto_31305 ?auto_31301 ) ) ( not ( = ?auto_31295 ?auto_31301 ) ) ( not ( = ?auto_31292 ?auto_31301 ) ) ( AVAILABLE ?auto_31303 ) ( not ( = ?auto_31304 ?auto_31294 ) ) ( not ( = ?auto_31312 ?auto_31304 ) ) ( not ( = ?auto_31291 ?auto_31304 ) ) ( not ( = ?auto_31290 ?auto_31304 ) ) ( not ( = ?auto_31309 ?auto_31304 ) ) ( HOIST-AT ?auto_31307 ?auto_31304 ) ( not ( = ?auto_31303 ?auto_31307 ) ) ( not ( = ?auto_31298 ?auto_31307 ) ) ( not ( = ?auto_31311 ?auto_31307 ) ) ( not ( = ?auto_31297 ?auto_31307 ) ) ( not ( = ?auto_31302 ?auto_31307 ) ) ( AVAILABLE ?auto_31307 ) ( SURFACE-AT ?auto_31295 ?auto_31304 ) ( ON ?auto_31295 ?auto_31293 ) ( CLEAR ?auto_31295 ) ( not ( = ?auto_31287 ?auto_31293 ) ) ( not ( = ?auto_31288 ?auto_31293 ) ) ( not ( = ?auto_31306 ?auto_31293 ) ) ( not ( = ?auto_31299 ?auto_31293 ) ) ( not ( = ?auto_31296 ?auto_31293 ) ) ( not ( = ?auto_31308 ?auto_31293 ) ) ( not ( = ?auto_31300 ?auto_31293 ) ) ( not ( = ?auto_31310 ?auto_31293 ) ) ( not ( = ?auto_31305 ?auto_31293 ) ) ( not ( = ?auto_31295 ?auto_31293 ) ) ( not ( = ?auto_31292 ?auto_31293 ) ) ( not ( = ?auto_31301 ?auto_31293 ) ) ( TRUCK-AT ?auto_31289 ?auto_31294 ) )
    :subtasks
    ( ( !DRIVE ?auto_31289 ?auto_31294 ?auto_31304 )
      ( MAKE-ON ?auto_31287 ?auto_31288 )
      ( MAKE-ON-VERIFY ?auto_31287 ?auto_31288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31315 - SURFACE
      ?auto_31316 - SURFACE
    )
    :vars
    (
      ?auto_31317 - HOIST
      ?auto_31318 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31317 ?auto_31318 ) ( SURFACE-AT ?auto_31316 ?auto_31318 ) ( CLEAR ?auto_31316 ) ( LIFTING ?auto_31317 ?auto_31315 ) ( IS-CRATE ?auto_31315 ) ( not ( = ?auto_31315 ?auto_31316 ) ) )
    :subtasks
    ( ( !DROP ?auto_31317 ?auto_31315 ?auto_31316 ?auto_31318 )
      ( MAKE-ON-VERIFY ?auto_31315 ?auto_31316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31319 - SURFACE
      ?auto_31320 - SURFACE
    )
    :vars
    (
      ?auto_31321 - HOIST
      ?auto_31322 - PLACE
      ?auto_31323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31321 ?auto_31322 ) ( SURFACE-AT ?auto_31320 ?auto_31322 ) ( CLEAR ?auto_31320 ) ( IS-CRATE ?auto_31319 ) ( not ( = ?auto_31319 ?auto_31320 ) ) ( TRUCK-AT ?auto_31323 ?auto_31322 ) ( AVAILABLE ?auto_31321 ) ( IN ?auto_31319 ?auto_31323 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31321 ?auto_31319 ?auto_31323 ?auto_31322 )
      ( MAKE-ON ?auto_31319 ?auto_31320 )
      ( MAKE-ON-VERIFY ?auto_31319 ?auto_31320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31324 - SURFACE
      ?auto_31325 - SURFACE
    )
    :vars
    (
      ?auto_31328 - HOIST
      ?auto_31326 - PLACE
      ?auto_31327 - TRUCK
      ?auto_31329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31328 ?auto_31326 ) ( SURFACE-AT ?auto_31325 ?auto_31326 ) ( CLEAR ?auto_31325 ) ( IS-CRATE ?auto_31324 ) ( not ( = ?auto_31324 ?auto_31325 ) ) ( AVAILABLE ?auto_31328 ) ( IN ?auto_31324 ?auto_31327 ) ( TRUCK-AT ?auto_31327 ?auto_31329 ) ( not ( = ?auto_31329 ?auto_31326 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31327 ?auto_31329 ?auto_31326 )
      ( MAKE-ON ?auto_31324 ?auto_31325 )
      ( MAKE-ON-VERIFY ?auto_31324 ?auto_31325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31330 - SURFACE
      ?auto_31331 - SURFACE
    )
    :vars
    (
      ?auto_31334 - HOIST
      ?auto_31332 - PLACE
      ?auto_31335 - TRUCK
      ?auto_31333 - PLACE
      ?auto_31336 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31334 ?auto_31332 ) ( SURFACE-AT ?auto_31331 ?auto_31332 ) ( CLEAR ?auto_31331 ) ( IS-CRATE ?auto_31330 ) ( not ( = ?auto_31330 ?auto_31331 ) ) ( AVAILABLE ?auto_31334 ) ( TRUCK-AT ?auto_31335 ?auto_31333 ) ( not ( = ?auto_31333 ?auto_31332 ) ) ( HOIST-AT ?auto_31336 ?auto_31333 ) ( LIFTING ?auto_31336 ?auto_31330 ) ( not ( = ?auto_31334 ?auto_31336 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31336 ?auto_31330 ?auto_31335 ?auto_31333 )
      ( MAKE-ON ?auto_31330 ?auto_31331 )
      ( MAKE-ON-VERIFY ?auto_31330 ?auto_31331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31337 - SURFACE
      ?auto_31338 - SURFACE
    )
    :vars
    (
      ?auto_31342 - HOIST
      ?auto_31341 - PLACE
      ?auto_31340 - TRUCK
      ?auto_31339 - PLACE
      ?auto_31343 - HOIST
      ?auto_31344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31342 ?auto_31341 ) ( SURFACE-AT ?auto_31338 ?auto_31341 ) ( CLEAR ?auto_31338 ) ( IS-CRATE ?auto_31337 ) ( not ( = ?auto_31337 ?auto_31338 ) ) ( AVAILABLE ?auto_31342 ) ( TRUCK-AT ?auto_31340 ?auto_31339 ) ( not ( = ?auto_31339 ?auto_31341 ) ) ( HOIST-AT ?auto_31343 ?auto_31339 ) ( not ( = ?auto_31342 ?auto_31343 ) ) ( AVAILABLE ?auto_31343 ) ( SURFACE-AT ?auto_31337 ?auto_31339 ) ( ON ?auto_31337 ?auto_31344 ) ( CLEAR ?auto_31337 ) ( not ( = ?auto_31337 ?auto_31344 ) ) ( not ( = ?auto_31338 ?auto_31344 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31343 ?auto_31337 ?auto_31344 ?auto_31339 )
      ( MAKE-ON ?auto_31337 ?auto_31338 )
      ( MAKE-ON-VERIFY ?auto_31337 ?auto_31338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31345 - SURFACE
      ?auto_31346 - SURFACE
    )
    :vars
    (
      ?auto_31351 - HOIST
      ?auto_31349 - PLACE
      ?auto_31347 - PLACE
      ?auto_31352 - HOIST
      ?auto_31348 - SURFACE
      ?auto_31350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31351 ?auto_31349 ) ( SURFACE-AT ?auto_31346 ?auto_31349 ) ( CLEAR ?auto_31346 ) ( IS-CRATE ?auto_31345 ) ( not ( = ?auto_31345 ?auto_31346 ) ) ( AVAILABLE ?auto_31351 ) ( not ( = ?auto_31347 ?auto_31349 ) ) ( HOIST-AT ?auto_31352 ?auto_31347 ) ( not ( = ?auto_31351 ?auto_31352 ) ) ( AVAILABLE ?auto_31352 ) ( SURFACE-AT ?auto_31345 ?auto_31347 ) ( ON ?auto_31345 ?auto_31348 ) ( CLEAR ?auto_31345 ) ( not ( = ?auto_31345 ?auto_31348 ) ) ( not ( = ?auto_31346 ?auto_31348 ) ) ( TRUCK-AT ?auto_31350 ?auto_31349 ) )
    :subtasks
    ( ( !DRIVE ?auto_31350 ?auto_31349 ?auto_31347 )
      ( MAKE-ON ?auto_31345 ?auto_31346 )
      ( MAKE-ON-VERIFY ?auto_31345 ?auto_31346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31353 - SURFACE
      ?auto_31354 - SURFACE
    )
    :vars
    (
      ?auto_31359 - HOIST
      ?auto_31360 - PLACE
      ?auto_31356 - PLACE
      ?auto_31357 - HOIST
      ?auto_31358 - SURFACE
      ?auto_31355 - TRUCK
      ?auto_31361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31359 ?auto_31360 ) ( IS-CRATE ?auto_31353 ) ( not ( = ?auto_31353 ?auto_31354 ) ) ( not ( = ?auto_31356 ?auto_31360 ) ) ( HOIST-AT ?auto_31357 ?auto_31356 ) ( not ( = ?auto_31359 ?auto_31357 ) ) ( AVAILABLE ?auto_31357 ) ( SURFACE-AT ?auto_31353 ?auto_31356 ) ( ON ?auto_31353 ?auto_31358 ) ( CLEAR ?auto_31353 ) ( not ( = ?auto_31353 ?auto_31358 ) ) ( not ( = ?auto_31354 ?auto_31358 ) ) ( TRUCK-AT ?auto_31355 ?auto_31360 ) ( SURFACE-AT ?auto_31361 ?auto_31360 ) ( CLEAR ?auto_31361 ) ( LIFTING ?auto_31359 ?auto_31354 ) ( IS-CRATE ?auto_31354 ) ( not ( = ?auto_31353 ?auto_31361 ) ) ( not ( = ?auto_31354 ?auto_31361 ) ) ( not ( = ?auto_31358 ?auto_31361 ) ) )
    :subtasks
    ( ( !DROP ?auto_31359 ?auto_31354 ?auto_31361 ?auto_31360 )
      ( MAKE-ON ?auto_31353 ?auto_31354 )
      ( MAKE-ON-VERIFY ?auto_31353 ?auto_31354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31362 - SURFACE
      ?auto_31363 - SURFACE
    )
    :vars
    (
      ?auto_31365 - HOIST
      ?auto_31369 - PLACE
      ?auto_31368 - PLACE
      ?auto_31364 - HOIST
      ?auto_31367 - SURFACE
      ?auto_31366 - TRUCK
      ?auto_31370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31365 ?auto_31369 ) ( IS-CRATE ?auto_31362 ) ( not ( = ?auto_31362 ?auto_31363 ) ) ( not ( = ?auto_31368 ?auto_31369 ) ) ( HOIST-AT ?auto_31364 ?auto_31368 ) ( not ( = ?auto_31365 ?auto_31364 ) ) ( AVAILABLE ?auto_31364 ) ( SURFACE-AT ?auto_31362 ?auto_31368 ) ( ON ?auto_31362 ?auto_31367 ) ( CLEAR ?auto_31362 ) ( not ( = ?auto_31362 ?auto_31367 ) ) ( not ( = ?auto_31363 ?auto_31367 ) ) ( TRUCK-AT ?auto_31366 ?auto_31369 ) ( SURFACE-AT ?auto_31370 ?auto_31369 ) ( CLEAR ?auto_31370 ) ( IS-CRATE ?auto_31363 ) ( not ( = ?auto_31362 ?auto_31370 ) ) ( not ( = ?auto_31363 ?auto_31370 ) ) ( not ( = ?auto_31367 ?auto_31370 ) ) ( AVAILABLE ?auto_31365 ) ( IN ?auto_31363 ?auto_31366 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31365 ?auto_31363 ?auto_31366 ?auto_31369 )
      ( MAKE-ON ?auto_31362 ?auto_31363 )
      ( MAKE-ON-VERIFY ?auto_31362 ?auto_31363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31371 - SURFACE
      ?auto_31372 - SURFACE
    )
    :vars
    (
      ?auto_31377 - HOIST
      ?auto_31373 - PLACE
      ?auto_31378 - PLACE
      ?auto_31376 - HOIST
      ?auto_31375 - SURFACE
      ?auto_31379 - SURFACE
      ?auto_31374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31377 ?auto_31373 ) ( IS-CRATE ?auto_31371 ) ( not ( = ?auto_31371 ?auto_31372 ) ) ( not ( = ?auto_31378 ?auto_31373 ) ) ( HOIST-AT ?auto_31376 ?auto_31378 ) ( not ( = ?auto_31377 ?auto_31376 ) ) ( AVAILABLE ?auto_31376 ) ( SURFACE-AT ?auto_31371 ?auto_31378 ) ( ON ?auto_31371 ?auto_31375 ) ( CLEAR ?auto_31371 ) ( not ( = ?auto_31371 ?auto_31375 ) ) ( not ( = ?auto_31372 ?auto_31375 ) ) ( SURFACE-AT ?auto_31379 ?auto_31373 ) ( CLEAR ?auto_31379 ) ( IS-CRATE ?auto_31372 ) ( not ( = ?auto_31371 ?auto_31379 ) ) ( not ( = ?auto_31372 ?auto_31379 ) ) ( not ( = ?auto_31375 ?auto_31379 ) ) ( AVAILABLE ?auto_31377 ) ( IN ?auto_31372 ?auto_31374 ) ( TRUCK-AT ?auto_31374 ?auto_31378 ) )
    :subtasks
    ( ( !DRIVE ?auto_31374 ?auto_31378 ?auto_31373 )
      ( MAKE-ON ?auto_31371 ?auto_31372 )
      ( MAKE-ON-VERIFY ?auto_31371 ?auto_31372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31380 - SURFACE
      ?auto_31381 - SURFACE
    )
    :vars
    (
      ?auto_31382 - HOIST
      ?auto_31384 - PLACE
      ?auto_31387 - PLACE
      ?auto_31388 - HOIST
      ?auto_31383 - SURFACE
      ?auto_31386 - SURFACE
      ?auto_31385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31382 ?auto_31384 ) ( IS-CRATE ?auto_31380 ) ( not ( = ?auto_31380 ?auto_31381 ) ) ( not ( = ?auto_31387 ?auto_31384 ) ) ( HOIST-AT ?auto_31388 ?auto_31387 ) ( not ( = ?auto_31382 ?auto_31388 ) ) ( SURFACE-AT ?auto_31380 ?auto_31387 ) ( ON ?auto_31380 ?auto_31383 ) ( CLEAR ?auto_31380 ) ( not ( = ?auto_31380 ?auto_31383 ) ) ( not ( = ?auto_31381 ?auto_31383 ) ) ( SURFACE-AT ?auto_31386 ?auto_31384 ) ( CLEAR ?auto_31386 ) ( IS-CRATE ?auto_31381 ) ( not ( = ?auto_31380 ?auto_31386 ) ) ( not ( = ?auto_31381 ?auto_31386 ) ) ( not ( = ?auto_31383 ?auto_31386 ) ) ( AVAILABLE ?auto_31382 ) ( TRUCK-AT ?auto_31385 ?auto_31387 ) ( LIFTING ?auto_31388 ?auto_31381 ) )
    :subtasks
    ( ( !LOAD ?auto_31388 ?auto_31381 ?auto_31385 ?auto_31387 )
      ( MAKE-ON ?auto_31380 ?auto_31381 )
      ( MAKE-ON-VERIFY ?auto_31380 ?auto_31381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31389 - SURFACE
      ?auto_31390 - SURFACE
    )
    :vars
    (
      ?auto_31393 - HOIST
      ?auto_31391 - PLACE
      ?auto_31396 - PLACE
      ?auto_31392 - HOIST
      ?auto_31395 - SURFACE
      ?auto_31394 - SURFACE
      ?auto_31397 - TRUCK
      ?auto_31398 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31393 ?auto_31391 ) ( IS-CRATE ?auto_31389 ) ( not ( = ?auto_31389 ?auto_31390 ) ) ( not ( = ?auto_31396 ?auto_31391 ) ) ( HOIST-AT ?auto_31392 ?auto_31396 ) ( not ( = ?auto_31393 ?auto_31392 ) ) ( SURFACE-AT ?auto_31389 ?auto_31396 ) ( ON ?auto_31389 ?auto_31395 ) ( CLEAR ?auto_31389 ) ( not ( = ?auto_31389 ?auto_31395 ) ) ( not ( = ?auto_31390 ?auto_31395 ) ) ( SURFACE-AT ?auto_31394 ?auto_31391 ) ( CLEAR ?auto_31394 ) ( IS-CRATE ?auto_31390 ) ( not ( = ?auto_31389 ?auto_31394 ) ) ( not ( = ?auto_31390 ?auto_31394 ) ) ( not ( = ?auto_31395 ?auto_31394 ) ) ( AVAILABLE ?auto_31393 ) ( TRUCK-AT ?auto_31397 ?auto_31396 ) ( AVAILABLE ?auto_31392 ) ( SURFACE-AT ?auto_31390 ?auto_31396 ) ( ON ?auto_31390 ?auto_31398 ) ( CLEAR ?auto_31390 ) ( not ( = ?auto_31389 ?auto_31398 ) ) ( not ( = ?auto_31390 ?auto_31398 ) ) ( not ( = ?auto_31395 ?auto_31398 ) ) ( not ( = ?auto_31394 ?auto_31398 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31392 ?auto_31390 ?auto_31398 ?auto_31396 )
      ( MAKE-ON ?auto_31389 ?auto_31390 )
      ( MAKE-ON-VERIFY ?auto_31389 ?auto_31390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31399 - SURFACE
      ?auto_31400 - SURFACE
    )
    :vars
    (
      ?auto_31408 - HOIST
      ?auto_31405 - PLACE
      ?auto_31402 - PLACE
      ?auto_31406 - HOIST
      ?auto_31401 - SURFACE
      ?auto_31407 - SURFACE
      ?auto_31404 - SURFACE
      ?auto_31403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31408 ?auto_31405 ) ( IS-CRATE ?auto_31399 ) ( not ( = ?auto_31399 ?auto_31400 ) ) ( not ( = ?auto_31402 ?auto_31405 ) ) ( HOIST-AT ?auto_31406 ?auto_31402 ) ( not ( = ?auto_31408 ?auto_31406 ) ) ( SURFACE-AT ?auto_31399 ?auto_31402 ) ( ON ?auto_31399 ?auto_31401 ) ( CLEAR ?auto_31399 ) ( not ( = ?auto_31399 ?auto_31401 ) ) ( not ( = ?auto_31400 ?auto_31401 ) ) ( SURFACE-AT ?auto_31407 ?auto_31405 ) ( CLEAR ?auto_31407 ) ( IS-CRATE ?auto_31400 ) ( not ( = ?auto_31399 ?auto_31407 ) ) ( not ( = ?auto_31400 ?auto_31407 ) ) ( not ( = ?auto_31401 ?auto_31407 ) ) ( AVAILABLE ?auto_31408 ) ( AVAILABLE ?auto_31406 ) ( SURFACE-AT ?auto_31400 ?auto_31402 ) ( ON ?auto_31400 ?auto_31404 ) ( CLEAR ?auto_31400 ) ( not ( = ?auto_31399 ?auto_31404 ) ) ( not ( = ?auto_31400 ?auto_31404 ) ) ( not ( = ?auto_31401 ?auto_31404 ) ) ( not ( = ?auto_31407 ?auto_31404 ) ) ( TRUCK-AT ?auto_31403 ?auto_31405 ) )
    :subtasks
    ( ( !DRIVE ?auto_31403 ?auto_31405 ?auto_31402 )
      ( MAKE-ON ?auto_31399 ?auto_31400 )
      ( MAKE-ON-VERIFY ?auto_31399 ?auto_31400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31409 - SURFACE
      ?auto_31410 - SURFACE
    )
    :vars
    (
      ?auto_31414 - HOIST
      ?auto_31418 - PLACE
      ?auto_31415 - PLACE
      ?auto_31412 - HOIST
      ?auto_31416 - SURFACE
      ?auto_31413 - SURFACE
      ?auto_31417 - SURFACE
      ?auto_31411 - TRUCK
      ?auto_31419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31414 ?auto_31418 ) ( IS-CRATE ?auto_31409 ) ( not ( = ?auto_31409 ?auto_31410 ) ) ( not ( = ?auto_31415 ?auto_31418 ) ) ( HOIST-AT ?auto_31412 ?auto_31415 ) ( not ( = ?auto_31414 ?auto_31412 ) ) ( SURFACE-AT ?auto_31409 ?auto_31415 ) ( ON ?auto_31409 ?auto_31416 ) ( CLEAR ?auto_31409 ) ( not ( = ?auto_31409 ?auto_31416 ) ) ( not ( = ?auto_31410 ?auto_31416 ) ) ( IS-CRATE ?auto_31410 ) ( not ( = ?auto_31409 ?auto_31413 ) ) ( not ( = ?auto_31410 ?auto_31413 ) ) ( not ( = ?auto_31416 ?auto_31413 ) ) ( AVAILABLE ?auto_31412 ) ( SURFACE-AT ?auto_31410 ?auto_31415 ) ( ON ?auto_31410 ?auto_31417 ) ( CLEAR ?auto_31410 ) ( not ( = ?auto_31409 ?auto_31417 ) ) ( not ( = ?auto_31410 ?auto_31417 ) ) ( not ( = ?auto_31416 ?auto_31417 ) ) ( not ( = ?auto_31413 ?auto_31417 ) ) ( TRUCK-AT ?auto_31411 ?auto_31418 ) ( SURFACE-AT ?auto_31419 ?auto_31418 ) ( CLEAR ?auto_31419 ) ( LIFTING ?auto_31414 ?auto_31413 ) ( IS-CRATE ?auto_31413 ) ( not ( = ?auto_31409 ?auto_31419 ) ) ( not ( = ?auto_31410 ?auto_31419 ) ) ( not ( = ?auto_31416 ?auto_31419 ) ) ( not ( = ?auto_31413 ?auto_31419 ) ) ( not ( = ?auto_31417 ?auto_31419 ) ) )
    :subtasks
    ( ( !DROP ?auto_31414 ?auto_31413 ?auto_31419 ?auto_31418 )
      ( MAKE-ON ?auto_31409 ?auto_31410 )
      ( MAKE-ON-VERIFY ?auto_31409 ?auto_31410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31420 - SURFACE
      ?auto_31421 - SURFACE
    )
    :vars
    (
      ?auto_31424 - HOIST
      ?auto_31422 - PLACE
      ?auto_31428 - PLACE
      ?auto_31425 - HOIST
      ?auto_31427 - SURFACE
      ?auto_31426 - SURFACE
      ?auto_31423 - SURFACE
      ?auto_31430 - TRUCK
      ?auto_31429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31424 ?auto_31422 ) ( IS-CRATE ?auto_31420 ) ( not ( = ?auto_31420 ?auto_31421 ) ) ( not ( = ?auto_31428 ?auto_31422 ) ) ( HOIST-AT ?auto_31425 ?auto_31428 ) ( not ( = ?auto_31424 ?auto_31425 ) ) ( SURFACE-AT ?auto_31420 ?auto_31428 ) ( ON ?auto_31420 ?auto_31427 ) ( CLEAR ?auto_31420 ) ( not ( = ?auto_31420 ?auto_31427 ) ) ( not ( = ?auto_31421 ?auto_31427 ) ) ( IS-CRATE ?auto_31421 ) ( not ( = ?auto_31420 ?auto_31426 ) ) ( not ( = ?auto_31421 ?auto_31426 ) ) ( not ( = ?auto_31427 ?auto_31426 ) ) ( AVAILABLE ?auto_31425 ) ( SURFACE-AT ?auto_31421 ?auto_31428 ) ( ON ?auto_31421 ?auto_31423 ) ( CLEAR ?auto_31421 ) ( not ( = ?auto_31420 ?auto_31423 ) ) ( not ( = ?auto_31421 ?auto_31423 ) ) ( not ( = ?auto_31427 ?auto_31423 ) ) ( not ( = ?auto_31426 ?auto_31423 ) ) ( TRUCK-AT ?auto_31430 ?auto_31422 ) ( SURFACE-AT ?auto_31429 ?auto_31422 ) ( CLEAR ?auto_31429 ) ( IS-CRATE ?auto_31426 ) ( not ( = ?auto_31420 ?auto_31429 ) ) ( not ( = ?auto_31421 ?auto_31429 ) ) ( not ( = ?auto_31427 ?auto_31429 ) ) ( not ( = ?auto_31426 ?auto_31429 ) ) ( not ( = ?auto_31423 ?auto_31429 ) ) ( AVAILABLE ?auto_31424 ) ( IN ?auto_31426 ?auto_31430 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31424 ?auto_31426 ?auto_31430 ?auto_31422 )
      ( MAKE-ON ?auto_31420 ?auto_31421 )
      ( MAKE-ON-VERIFY ?auto_31420 ?auto_31421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31431 - SURFACE
      ?auto_31432 - SURFACE
    )
    :vars
    (
      ?auto_31440 - HOIST
      ?auto_31436 - PLACE
      ?auto_31434 - PLACE
      ?auto_31437 - HOIST
      ?auto_31438 - SURFACE
      ?auto_31441 - SURFACE
      ?auto_31439 - SURFACE
      ?auto_31433 - SURFACE
      ?auto_31435 - TRUCK
      ?auto_31442 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31440 ?auto_31436 ) ( IS-CRATE ?auto_31431 ) ( not ( = ?auto_31431 ?auto_31432 ) ) ( not ( = ?auto_31434 ?auto_31436 ) ) ( HOIST-AT ?auto_31437 ?auto_31434 ) ( not ( = ?auto_31440 ?auto_31437 ) ) ( SURFACE-AT ?auto_31431 ?auto_31434 ) ( ON ?auto_31431 ?auto_31438 ) ( CLEAR ?auto_31431 ) ( not ( = ?auto_31431 ?auto_31438 ) ) ( not ( = ?auto_31432 ?auto_31438 ) ) ( IS-CRATE ?auto_31432 ) ( not ( = ?auto_31431 ?auto_31441 ) ) ( not ( = ?auto_31432 ?auto_31441 ) ) ( not ( = ?auto_31438 ?auto_31441 ) ) ( AVAILABLE ?auto_31437 ) ( SURFACE-AT ?auto_31432 ?auto_31434 ) ( ON ?auto_31432 ?auto_31439 ) ( CLEAR ?auto_31432 ) ( not ( = ?auto_31431 ?auto_31439 ) ) ( not ( = ?auto_31432 ?auto_31439 ) ) ( not ( = ?auto_31438 ?auto_31439 ) ) ( not ( = ?auto_31441 ?auto_31439 ) ) ( SURFACE-AT ?auto_31433 ?auto_31436 ) ( CLEAR ?auto_31433 ) ( IS-CRATE ?auto_31441 ) ( not ( = ?auto_31431 ?auto_31433 ) ) ( not ( = ?auto_31432 ?auto_31433 ) ) ( not ( = ?auto_31438 ?auto_31433 ) ) ( not ( = ?auto_31441 ?auto_31433 ) ) ( not ( = ?auto_31439 ?auto_31433 ) ) ( AVAILABLE ?auto_31440 ) ( IN ?auto_31441 ?auto_31435 ) ( TRUCK-AT ?auto_31435 ?auto_31442 ) ( not ( = ?auto_31442 ?auto_31436 ) ) ( not ( = ?auto_31434 ?auto_31442 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31435 ?auto_31442 ?auto_31436 )
      ( MAKE-ON ?auto_31431 ?auto_31432 )
      ( MAKE-ON-VERIFY ?auto_31431 ?auto_31432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31443 - SURFACE
      ?auto_31444 - SURFACE
    )
    :vars
    (
      ?auto_31451 - HOIST
      ?auto_31453 - PLACE
      ?auto_31447 - PLACE
      ?auto_31446 - HOIST
      ?auto_31450 - SURFACE
      ?auto_31449 - SURFACE
      ?auto_31448 - SURFACE
      ?auto_31452 - SURFACE
      ?auto_31445 - TRUCK
      ?auto_31454 - PLACE
      ?auto_31455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31451 ?auto_31453 ) ( IS-CRATE ?auto_31443 ) ( not ( = ?auto_31443 ?auto_31444 ) ) ( not ( = ?auto_31447 ?auto_31453 ) ) ( HOIST-AT ?auto_31446 ?auto_31447 ) ( not ( = ?auto_31451 ?auto_31446 ) ) ( SURFACE-AT ?auto_31443 ?auto_31447 ) ( ON ?auto_31443 ?auto_31450 ) ( CLEAR ?auto_31443 ) ( not ( = ?auto_31443 ?auto_31450 ) ) ( not ( = ?auto_31444 ?auto_31450 ) ) ( IS-CRATE ?auto_31444 ) ( not ( = ?auto_31443 ?auto_31449 ) ) ( not ( = ?auto_31444 ?auto_31449 ) ) ( not ( = ?auto_31450 ?auto_31449 ) ) ( AVAILABLE ?auto_31446 ) ( SURFACE-AT ?auto_31444 ?auto_31447 ) ( ON ?auto_31444 ?auto_31448 ) ( CLEAR ?auto_31444 ) ( not ( = ?auto_31443 ?auto_31448 ) ) ( not ( = ?auto_31444 ?auto_31448 ) ) ( not ( = ?auto_31450 ?auto_31448 ) ) ( not ( = ?auto_31449 ?auto_31448 ) ) ( SURFACE-AT ?auto_31452 ?auto_31453 ) ( CLEAR ?auto_31452 ) ( IS-CRATE ?auto_31449 ) ( not ( = ?auto_31443 ?auto_31452 ) ) ( not ( = ?auto_31444 ?auto_31452 ) ) ( not ( = ?auto_31450 ?auto_31452 ) ) ( not ( = ?auto_31449 ?auto_31452 ) ) ( not ( = ?auto_31448 ?auto_31452 ) ) ( AVAILABLE ?auto_31451 ) ( TRUCK-AT ?auto_31445 ?auto_31454 ) ( not ( = ?auto_31454 ?auto_31453 ) ) ( not ( = ?auto_31447 ?auto_31454 ) ) ( HOIST-AT ?auto_31455 ?auto_31454 ) ( LIFTING ?auto_31455 ?auto_31449 ) ( not ( = ?auto_31451 ?auto_31455 ) ) ( not ( = ?auto_31446 ?auto_31455 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31455 ?auto_31449 ?auto_31445 ?auto_31454 )
      ( MAKE-ON ?auto_31443 ?auto_31444 )
      ( MAKE-ON-VERIFY ?auto_31443 ?auto_31444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31456 - SURFACE
      ?auto_31457 - SURFACE
    )
    :vars
    (
      ?auto_31464 - HOIST
      ?auto_31465 - PLACE
      ?auto_31467 - PLACE
      ?auto_31462 - HOIST
      ?auto_31466 - SURFACE
      ?auto_31460 - SURFACE
      ?auto_31463 - SURFACE
      ?auto_31461 - SURFACE
      ?auto_31459 - TRUCK
      ?auto_31458 - PLACE
      ?auto_31468 - HOIST
      ?auto_31469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31464 ?auto_31465 ) ( IS-CRATE ?auto_31456 ) ( not ( = ?auto_31456 ?auto_31457 ) ) ( not ( = ?auto_31467 ?auto_31465 ) ) ( HOIST-AT ?auto_31462 ?auto_31467 ) ( not ( = ?auto_31464 ?auto_31462 ) ) ( SURFACE-AT ?auto_31456 ?auto_31467 ) ( ON ?auto_31456 ?auto_31466 ) ( CLEAR ?auto_31456 ) ( not ( = ?auto_31456 ?auto_31466 ) ) ( not ( = ?auto_31457 ?auto_31466 ) ) ( IS-CRATE ?auto_31457 ) ( not ( = ?auto_31456 ?auto_31460 ) ) ( not ( = ?auto_31457 ?auto_31460 ) ) ( not ( = ?auto_31466 ?auto_31460 ) ) ( AVAILABLE ?auto_31462 ) ( SURFACE-AT ?auto_31457 ?auto_31467 ) ( ON ?auto_31457 ?auto_31463 ) ( CLEAR ?auto_31457 ) ( not ( = ?auto_31456 ?auto_31463 ) ) ( not ( = ?auto_31457 ?auto_31463 ) ) ( not ( = ?auto_31466 ?auto_31463 ) ) ( not ( = ?auto_31460 ?auto_31463 ) ) ( SURFACE-AT ?auto_31461 ?auto_31465 ) ( CLEAR ?auto_31461 ) ( IS-CRATE ?auto_31460 ) ( not ( = ?auto_31456 ?auto_31461 ) ) ( not ( = ?auto_31457 ?auto_31461 ) ) ( not ( = ?auto_31466 ?auto_31461 ) ) ( not ( = ?auto_31460 ?auto_31461 ) ) ( not ( = ?auto_31463 ?auto_31461 ) ) ( AVAILABLE ?auto_31464 ) ( TRUCK-AT ?auto_31459 ?auto_31458 ) ( not ( = ?auto_31458 ?auto_31465 ) ) ( not ( = ?auto_31467 ?auto_31458 ) ) ( HOIST-AT ?auto_31468 ?auto_31458 ) ( not ( = ?auto_31464 ?auto_31468 ) ) ( not ( = ?auto_31462 ?auto_31468 ) ) ( AVAILABLE ?auto_31468 ) ( SURFACE-AT ?auto_31460 ?auto_31458 ) ( ON ?auto_31460 ?auto_31469 ) ( CLEAR ?auto_31460 ) ( not ( = ?auto_31456 ?auto_31469 ) ) ( not ( = ?auto_31457 ?auto_31469 ) ) ( not ( = ?auto_31466 ?auto_31469 ) ) ( not ( = ?auto_31460 ?auto_31469 ) ) ( not ( = ?auto_31463 ?auto_31469 ) ) ( not ( = ?auto_31461 ?auto_31469 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31468 ?auto_31460 ?auto_31469 ?auto_31458 )
      ( MAKE-ON ?auto_31456 ?auto_31457 )
      ( MAKE-ON-VERIFY ?auto_31456 ?auto_31457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31470 - SURFACE
      ?auto_31471 - SURFACE
    )
    :vars
    (
      ?auto_31476 - HOIST
      ?auto_31475 - PLACE
      ?auto_31473 - PLACE
      ?auto_31477 - HOIST
      ?auto_31481 - SURFACE
      ?auto_31474 - SURFACE
      ?auto_31479 - SURFACE
      ?auto_31480 - SURFACE
      ?auto_31482 - PLACE
      ?auto_31478 - HOIST
      ?auto_31483 - SURFACE
      ?auto_31472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31476 ?auto_31475 ) ( IS-CRATE ?auto_31470 ) ( not ( = ?auto_31470 ?auto_31471 ) ) ( not ( = ?auto_31473 ?auto_31475 ) ) ( HOIST-AT ?auto_31477 ?auto_31473 ) ( not ( = ?auto_31476 ?auto_31477 ) ) ( SURFACE-AT ?auto_31470 ?auto_31473 ) ( ON ?auto_31470 ?auto_31481 ) ( CLEAR ?auto_31470 ) ( not ( = ?auto_31470 ?auto_31481 ) ) ( not ( = ?auto_31471 ?auto_31481 ) ) ( IS-CRATE ?auto_31471 ) ( not ( = ?auto_31470 ?auto_31474 ) ) ( not ( = ?auto_31471 ?auto_31474 ) ) ( not ( = ?auto_31481 ?auto_31474 ) ) ( AVAILABLE ?auto_31477 ) ( SURFACE-AT ?auto_31471 ?auto_31473 ) ( ON ?auto_31471 ?auto_31479 ) ( CLEAR ?auto_31471 ) ( not ( = ?auto_31470 ?auto_31479 ) ) ( not ( = ?auto_31471 ?auto_31479 ) ) ( not ( = ?auto_31481 ?auto_31479 ) ) ( not ( = ?auto_31474 ?auto_31479 ) ) ( SURFACE-AT ?auto_31480 ?auto_31475 ) ( CLEAR ?auto_31480 ) ( IS-CRATE ?auto_31474 ) ( not ( = ?auto_31470 ?auto_31480 ) ) ( not ( = ?auto_31471 ?auto_31480 ) ) ( not ( = ?auto_31481 ?auto_31480 ) ) ( not ( = ?auto_31474 ?auto_31480 ) ) ( not ( = ?auto_31479 ?auto_31480 ) ) ( AVAILABLE ?auto_31476 ) ( not ( = ?auto_31482 ?auto_31475 ) ) ( not ( = ?auto_31473 ?auto_31482 ) ) ( HOIST-AT ?auto_31478 ?auto_31482 ) ( not ( = ?auto_31476 ?auto_31478 ) ) ( not ( = ?auto_31477 ?auto_31478 ) ) ( AVAILABLE ?auto_31478 ) ( SURFACE-AT ?auto_31474 ?auto_31482 ) ( ON ?auto_31474 ?auto_31483 ) ( CLEAR ?auto_31474 ) ( not ( = ?auto_31470 ?auto_31483 ) ) ( not ( = ?auto_31471 ?auto_31483 ) ) ( not ( = ?auto_31481 ?auto_31483 ) ) ( not ( = ?auto_31474 ?auto_31483 ) ) ( not ( = ?auto_31479 ?auto_31483 ) ) ( not ( = ?auto_31480 ?auto_31483 ) ) ( TRUCK-AT ?auto_31472 ?auto_31475 ) )
    :subtasks
    ( ( !DRIVE ?auto_31472 ?auto_31475 ?auto_31482 )
      ( MAKE-ON ?auto_31470 ?auto_31471 )
      ( MAKE-ON-VERIFY ?auto_31470 ?auto_31471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31484 - SURFACE
      ?auto_31485 - SURFACE
    )
    :vars
    (
      ?auto_31497 - HOIST
      ?auto_31496 - PLACE
      ?auto_31494 - PLACE
      ?auto_31489 - HOIST
      ?auto_31487 - SURFACE
      ?auto_31492 - SURFACE
      ?auto_31493 - SURFACE
      ?auto_31490 - SURFACE
      ?auto_31486 - PLACE
      ?auto_31491 - HOIST
      ?auto_31495 - SURFACE
      ?auto_31488 - TRUCK
      ?auto_31498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31497 ?auto_31496 ) ( IS-CRATE ?auto_31484 ) ( not ( = ?auto_31484 ?auto_31485 ) ) ( not ( = ?auto_31494 ?auto_31496 ) ) ( HOIST-AT ?auto_31489 ?auto_31494 ) ( not ( = ?auto_31497 ?auto_31489 ) ) ( SURFACE-AT ?auto_31484 ?auto_31494 ) ( ON ?auto_31484 ?auto_31487 ) ( CLEAR ?auto_31484 ) ( not ( = ?auto_31484 ?auto_31487 ) ) ( not ( = ?auto_31485 ?auto_31487 ) ) ( IS-CRATE ?auto_31485 ) ( not ( = ?auto_31484 ?auto_31492 ) ) ( not ( = ?auto_31485 ?auto_31492 ) ) ( not ( = ?auto_31487 ?auto_31492 ) ) ( AVAILABLE ?auto_31489 ) ( SURFACE-AT ?auto_31485 ?auto_31494 ) ( ON ?auto_31485 ?auto_31493 ) ( CLEAR ?auto_31485 ) ( not ( = ?auto_31484 ?auto_31493 ) ) ( not ( = ?auto_31485 ?auto_31493 ) ) ( not ( = ?auto_31487 ?auto_31493 ) ) ( not ( = ?auto_31492 ?auto_31493 ) ) ( IS-CRATE ?auto_31492 ) ( not ( = ?auto_31484 ?auto_31490 ) ) ( not ( = ?auto_31485 ?auto_31490 ) ) ( not ( = ?auto_31487 ?auto_31490 ) ) ( not ( = ?auto_31492 ?auto_31490 ) ) ( not ( = ?auto_31493 ?auto_31490 ) ) ( not ( = ?auto_31486 ?auto_31496 ) ) ( not ( = ?auto_31494 ?auto_31486 ) ) ( HOIST-AT ?auto_31491 ?auto_31486 ) ( not ( = ?auto_31497 ?auto_31491 ) ) ( not ( = ?auto_31489 ?auto_31491 ) ) ( AVAILABLE ?auto_31491 ) ( SURFACE-AT ?auto_31492 ?auto_31486 ) ( ON ?auto_31492 ?auto_31495 ) ( CLEAR ?auto_31492 ) ( not ( = ?auto_31484 ?auto_31495 ) ) ( not ( = ?auto_31485 ?auto_31495 ) ) ( not ( = ?auto_31487 ?auto_31495 ) ) ( not ( = ?auto_31492 ?auto_31495 ) ) ( not ( = ?auto_31493 ?auto_31495 ) ) ( not ( = ?auto_31490 ?auto_31495 ) ) ( TRUCK-AT ?auto_31488 ?auto_31496 ) ( SURFACE-AT ?auto_31498 ?auto_31496 ) ( CLEAR ?auto_31498 ) ( LIFTING ?auto_31497 ?auto_31490 ) ( IS-CRATE ?auto_31490 ) ( not ( = ?auto_31484 ?auto_31498 ) ) ( not ( = ?auto_31485 ?auto_31498 ) ) ( not ( = ?auto_31487 ?auto_31498 ) ) ( not ( = ?auto_31492 ?auto_31498 ) ) ( not ( = ?auto_31493 ?auto_31498 ) ) ( not ( = ?auto_31490 ?auto_31498 ) ) ( not ( = ?auto_31495 ?auto_31498 ) ) )
    :subtasks
    ( ( !DROP ?auto_31497 ?auto_31490 ?auto_31498 ?auto_31496 )
      ( MAKE-ON ?auto_31484 ?auto_31485 )
      ( MAKE-ON-VERIFY ?auto_31484 ?auto_31485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31499 - SURFACE
      ?auto_31500 - SURFACE
    )
    :vars
    (
      ?auto_31504 - HOIST
      ?auto_31507 - PLACE
      ?auto_31508 - PLACE
      ?auto_31511 - HOIST
      ?auto_31510 - SURFACE
      ?auto_31506 - SURFACE
      ?auto_31509 - SURFACE
      ?auto_31513 - SURFACE
      ?auto_31502 - PLACE
      ?auto_31512 - HOIST
      ?auto_31505 - SURFACE
      ?auto_31501 - TRUCK
      ?auto_31503 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31504 ?auto_31507 ) ( IS-CRATE ?auto_31499 ) ( not ( = ?auto_31499 ?auto_31500 ) ) ( not ( = ?auto_31508 ?auto_31507 ) ) ( HOIST-AT ?auto_31511 ?auto_31508 ) ( not ( = ?auto_31504 ?auto_31511 ) ) ( SURFACE-AT ?auto_31499 ?auto_31508 ) ( ON ?auto_31499 ?auto_31510 ) ( CLEAR ?auto_31499 ) ( not ( = ?auto_31499 ?auto_31510 ) ) ( not ( = ?auto_31500 ?auto_31510 ) ) ( IS-CRATE ?auto_31500 ) ( not ( = ?auto_31499 ?auto_31506 ) ) ( not ( = ?auto_31500 ?auto_31506 ) ) ( not ( = ?auto_31510 ?auto_31506 ) ) ( AVAILABLE ?auto_31511 ) ( SURFACE-AT ?auto_31500 ?auto_31508 ) ( ON ?auto_31500 ?auto_31509 ) ( CLEAR ?auto_31500 ) ( not ( = ?auto_31499 ?auto_31509 ) ) ( not ( = ?auto_31500 ?auto_31509 ) ) ( not ( = ?auto_31510 ?auto_31509 ) ) ( not ( = ?auto_31506 ?auto_31509 ) ) ( IS-CRATE ?auto_31506 ) ( not ( = ?auto_31499 ?auto_31513 ) ) ( not ( = ?auto_31500 ?auto_31513 ) ) ( not ( = ?auto_31510 ?auto_31513 ) ) ( not ( = ?auto_31506 ?auto_31513 ) ) ( not ( = ?auto_31509 ?auto_31513 ) ) ( not ( = ?auto_31502 ?auto_31507 ) ) ( not ( = ?auto_31508 ?auto_31502 ) ) ( HOIST-AT ?auto_31512 ?auto_31502 ) ( not ( = ?auto_31504 ?auto_31512 ) ) ( not ( = ?auto_31511 ?auto_31512 ) ) ( AVAILABLE ?auto_31512 ) ( SURFACE-AT ?auto_31506 ?auto_31502 ) ( ON ?auto_31506 ?auto_31505 ) ( CLEAR ?auto_31506 ) ( not ( = ?auto_31499 ?auto_31505 ) ) ( not ( = ?auto_31500 ?auto_31505 ) ) ( not ( = ?auto_31510 ?auto_31505 ) ) ( not ( = ?auto_31506 ?auto_31505 ) ) ( not ( = ?auto_31509 ?auto_31505 ) ) ( not ( = ?auto_31513 ?auto_31505 ) ) ( TRUCK-AT ?auto_31501 ?auto_31507 ) ( SURFACE-AT ?auto_31503 ?auto_31507 ) ( CLEAR ?auto_31503 ) ( IS-CRATE ?auto_31513 ) ( not ( = ?auto_31499 ?auto_31503 ) ) ( not ( = ?auto_31500 ?auto_31503 ) ) ( not ( = ?auto_31510 ?auto_31503 ) ) ( not ( = ?auto_31506 ?auto_31503 ) ) ( not ( = ?auto_31509 ?auto_31503 ) ) ( not ( = ?auto_31513 ?auto_31503 ) ) ( not ( = ?auto_31505 ?auto_31503 ) ) ( AVAILABLE ?auto_31504 ) ( IN ?auto_31513 ?auto_31501 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31504 ?auto_31513 ?auto_31501 ?auto_31507 )
      ( MAKE-ON ?auto_31499 ?auto_31500 )
      ( MAKE-ON-VERIFY ?auto_31499 ?auto_31500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31514 - SURFACE
      ?auto_31515 - SURFACE
    )
    :vars
    (
      ?auto_31527 - HOIST
      ?auto_31516 - PLACE
      ?auto_31528 - PLACE
      ?auto_31524 - HOIST
      ?auto_31520 - SURFACE
      ?auto_31523 - SURFACE
      ?auto_31517 - SURFACE
      ?auto_31519 - SURFACE
      ?auto_31525 - PLACE
      ?auto_31521 - HOIST
      ?auto_31518 - SURFACE
      ?auto_31522 - SURFACE
      ?auto_31526 - TRUCK
      ?auto_31529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31527 ?auto_31516 ) ( IS-CRATE ?auto_31514 ) ( not ( = ?auto_31514 ?auto_31515 ) ) ( not ( = ?auto_31528 ?auto_31516 ) ) ( HOIST-AT ?auto_31524 ?auto_31528 ) ( not ( = ?auto_31527 ?auto_31524 ) ) ( SURFACE-AT ?auto_31514 ?auto_31528 ) ( ON ?auto_31514 ?auto_31520 ) ( CLEAR ?auto_31514 ) ( not ( = ?auto_31514 ?auto_31520 ) ) ( not ( = ?auto_31515 ?auto_31520 ) ) ( IS-CRATE ?auto_31515 ) ( not ( = ?auto_31514 ?auto_31523 ) ) ( not ( = ?auto_31515 ?auto_31523 ) ) ( not ( = ?auto_31520 ?auto_31523 ) ) ( AVAILABLE ?auto_31524 ) ( SURFACE-AT ?auto_31515 ?auto_31528 ) ( ON ?auto_31515 ?auto_31517 ) ( CLEAR ?auto_31515 ) ( not ( = ?auto_31514 ?auto_31517 ) ) ( not ( = ?auto_31515 ?auto_31517 ) ) ( not ( = ?auto_31520 ?auto_31517 ) ) ( not ( = ?auto_31523 ?auto_31517 ) ) ( IS-CRATE ?auto_31523 ) ( not ( = ?auto_31514 ?auto_31519 ) ) ( not ( = ?auto_31515 ?auto_31519 ) ) ( not ( = ?auto_31520 ?auto_31519 ) ) ( not ( = ?auto_31523 ?auto_31519 ) ) ( not ( = ?auto_31517 ?auto_31519 ) ) ( not ( = ?auto_31525 ?auto_31516 ) ) ( not ( = ?auto_31528 ?auto_31525 ) ) ( HOIST-AT ?auto_31521 ?auto_31525 ) ( not ( = ?auto_31527 ?auto_31521 ) ) ( not ( = ?auto_31524 ?auto_31521 ) ) ( AVAILABLE ?auto_31521 ) ( SURFACE-AT ?auto_31523 ?auto_31525 ) ( ON ?auto_31523 ?auto_31518 ) ( CLEAR ?auto_31523 ) ( not ( = ?auto_31514 ?auto_31518 ) ) ( not ( = ?auto_31515 ?auto_31518 ) ) ( not ( = ?auto_31520 ?auto_31518 ) ) ( not ( = ?auto_31523 ?auto_31518 ) ) ( not ( = ?auto_31517 ?auto_31518 ) ) ( not ( = ?auto_31519 ?auto_31518 ) ) ( SURFACE-AT ?auto_31522 ?auto_31516 ) ( CLEAR ?auto_31522 ) ( IS-CRATE ?auto_31519 ) ( not ( = ?auto_31514 ?auto_31522 ) ) ( not ( = ?auto_31515 ?auto_31522 ) ) ( not ( = ?auto_31520 ?auto_31522 ) ) ( not ( = ?auto_31523 ?auto_31522 ) ) ( not ( = ?auto_31517 ?auto_31522 ) ) ( not ( = ?auto_31519 ?auto_31522 ) ) ( not ( = ?auto_31518 ?auto_31522 ) ) ( AVAILABLE ?auto_31527 ) ( IN ?auto_31519 ?auto_31526 ) ( TRUCK-AT ?auto_31526 ?auto_31529 ) ( not ( = ?auto_31529 ?auto_31516 ) ) ( not ( = ?auto_31528 ?auto_31529 ) ) ( not ( = ?auto_31525 ?auto_31529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31526 ?auto_31529 ?auto_31516 )
      ( MAKE-ON ?auto_31514 ?auto_31515 )
      ( MAKE-ON-VERIFY ?auto_31514 ?auto_31515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31530 - SURFACE
      ?auto_31531 - SURFACE
    )
    :vars
    (
      ?auto_31541 - HOIST
      ?auto_31543 - PLACE
      ?auto_31533 - PLACE
      ?auto_31542 - HOIST
      ?auto_31544 - SURFACE
      ?auto_31536 - SURFACE
      ?auto_31534 - SURFACE
      ?auto_31540 - SURFACE
      ?auto_31532 - PLACE
      ?auto_31537 - HOIST
      ?auto_31538 - SURFACE
      ?auto_31535 - SURFACE
      ?auto_31539 - TRUCK
      ?auto_31545 - PLACE
      ?auto_31546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31541 ?auto_31543 ) ( IS-CRATE ?auto_31530 ) ( not ( = ?auto_31530 ?auto_31531 ) ) ( not ( = ?auto_31533 ?auto_31543 ) ) ( HOIST-AT ?auto_31542 ?auto_31533 ) ( not ( = ?auto_31541 ?auto_31542 ) ) ( SURFACE-AT ?auto_31530 ?auto_31533 ) ( ON ?auto_31530 ?auto_31544 ) ( CLEAR ?auto_31530 ) ( not ( = ?auto_31530 ?auto_31544 ) ) ( not ( = ?auto_31531 ?auto_31544 ) ) ( IS-CRATE ?auto_31531 ) ( not ( = ?auto_31530 ?auto_31536 ) ) ( not ( = ?auto_31531 ?auto_31536 ) ) ( not ( = ?auto_31544 ?auto_31536 ) ) ( AVAILABLE ?auto_31542 ) ( SURFACE-AT ?auto_31531 ?auto_31533 ) ( ON ?auto_31531 ?auto_31534 ) ( CLEAR ?auto_31531 ) ( not ( = ?auto_31530 ?auto_31534 ) ) ( not ( = ?auto_31531 ?auto_31534 ) ) ( not ( = ?auto_31544 ?auto_31534 ) ) ( not ( = ?auto_31536 ?auto_31534 ) ) ( IS-CRATE ?auto_31536 ) ( not ( = ?auto_31530 ?auto_31540 ) ) ( not ( = ?auto_31531 ?auto_31540 ) ) ( not ( = ?auto_31544 ?auto_31540 ) ) ( not ( = ?auto_31536 ?auto_31540 ) ) ( not ( = ?auto_31534 ?auto_31540 ) ) ( not ( = ?auto_31532 ?auto_31543 ) ) ( not ( = ?auto_31533 ?auto_31532 ) ) ( HOIST-AT ?auto_31537 ?auto_31532 ) ( not ( = ?auto_31541 ?auto_31537 ) ) ( not ( = ?auto_31542 ?auto_31537 ) ) ( AVAILABLE ?auto_31537 ) ( SURFACE-AT ?auto_31536 ?auto_31532 ) ( ON ?auto_31536 ?auto_31538 ) ( CLEAR ?auto_31536 ) ( not ( = ?auto_31530 ?auto_31538 ) ) ( not ( = ?auto_31531 ?auto_31538 ) ) ( not ( = ?auto_31544 ?auto_31538 ) ) ( not ( = ?auto_31536 ?auto_31538 ) ) ( not ( = ?auto_31534 ?auto_31538 ) ) ( not ( = ?auto_31540 ?auto_31538 ) ) ( SURFACE-AT ?auto_31535 ?auto_31543 ) ( CLEAR ?auto_31535 ) ( IS-CRATE ?auto_31540 ) ( not ( = ?auto_31530 ?auto_31535 ) ) ( not ( = ?auto_31531 ?auto_31535 ) ) ( not ( = ?auto_31544 ?auto_31535 ) ) ( not ( = ?auto_31536 ?auto_31535 ) ) ( not ( = ?auto_31534 ?auto_31535 ) ) ( not ( = ?auto_31540 ?auto_31535 ) ) ( not ( = ?auto_31538 ?auto_31535 ) ) ( AVAILABLE ?auto_31541 ) ( TRUCK-AT ?auto_31539 ?auto_31545 ) ( not ( = ?auto_31545 ?auto_31543 ) ) ( not ( = ?auto_31533 ?auto_31545 ) ) ( not ( = ?auto_31532 ?auto_31545 ) ) ( HOIST-AT ?auto_31546 ?auto_31545 ) ( LIFTING ?auto_31546 ?auto_31540 ) ( not ( = ?auto_31541 ?auto_31546 ) ) ( not ( = ?auto_31542 ?auto_31546 ) ) ( not ( = ?auto_31537 ?auto_31546 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31546 ?auto_31540 ?auto_31539 ?auto_31545 )
      ( MAKE-ON ?auto_31530 ?auto_31531 )
      ( MAKE-ON-VERIFY ?auto_31530 ?auto_31531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31547 - SURFACE
      ?auto_31548 - SURFACE
    )
    :vars
    (
      ?auto_31553 - HOIST
      ?auto_31554 - PLACE
      ?auto_31555 - PLACE
      ?auto_31559 - HOIST
      ?auto_31556 - SURFACE
      ?auto_31552 - SURFACE
      ?auto_31560 - SURFACE
      ?auto_31550 - SURFACE
      ?auto_31562 - PLACE
      ?auto_31563 - HOIST
      ?auto_31557 - SURFACE
      ?auto_31551 - SURFACE
      ?auto_31561 - TRUCK
      ?auto_31549 - PLACE
      ?auto_31558 - HOIST
      ?auto_31564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31553 ?auto_31554 ) ( IS-CRATE ?auto_31547 ) ( not ( = ?auto_31547 ?auto_31548 ) ) ( not ( = ?auto_31555 ?auto_31554 ) ) ( HOIST-AT ?auto_31559 ?auto_31555 ) ( not ( = ?auto_31553 ?auto_31559 ) ) ( SURFACE-AT ?auto_31547 ?auto_31555 ) ( ON ?auto_31547 ?auto_31556 ) ( CLEAR ?auto_31547 ) ( not ( = ?auto_31547 ?auto_31556 ) ) ( not ( = ?auto_31548 ?auto_31556 ) ) ( IS-CRATE ?auto_31548 ) ( not ( = ?auto_31547 ?auto_31552 ) ) ( not ( = ?auto_31548 ?auto_31552 ) ) ( not ( = ?auto_31556 ?auto_31552 ) ) ( AVAILABLE ?auto_31559 ) ( SURFACE-AT ?auto_31548 ?auto_31555 ) ( ON ?auto_31548 ?auto_31560 ) ( CLEAR ?auto_31548 ) ( not ( = ?auto_31547 ?auto_31560 ) ) ( not ( = ?auto_31548 ?auto_31560 ) ) ( not ( = ?auto_31556 ?auto_31560 ) ) ( not ( = ?auto_31552 ?auto_31560 ) ) ( IS-CRATE ?auto_31552 ) ( not ( = ?auto_31547 ?auto_31550 ) ) ( not ( = ?auto_31548 ?auto_31550 ) ) ( not ( = ?auto_31556 ?auto_31550 ) ) ( not ( = ?auto_31552 ?auto_31550 ) ) ( not ( = ?auto_31560 ?auto_31550 ) ) ( not ( = ?auto_31562 ?auto_31554 ) ) ( not ( = ?auto_31555 ?auto_31562 ) ) ( HOIST-AT ?auto_31563 ?auto_31562 ) ( not ( = ?auto_31553 ?auto_31563 ) ) ( not ( = ?auto_31559 ?auto_31563 ) ) ( AVAILABLE ?auto_31563 ) ( SURFACE-AT ?auto_31552 ?auto_31562 ) ( ON ?auto_31552 ?auto_31557 ) ( CLEAR ?auto_31552 ) ( not ( = ?auto_31547 ?auto_31557 ) ) ( not ( = ?auto_31548 ?auto_31557 ) ) ( not ( = ?auto_31556 ?auto_31557 ) ) ( not ( = ?auto_31552 ?auto_31557 ) ) ( not ( = ?auto_31560 ?auto_31557 ) ) ( not ( = ?auto_31550 ?auto_31557 ) ) ( SURFACE-AT ?auto_31551 ?auto_31554 ) ( CLEAR ?auto_31551 ) ( IS-CRATE ?auto_31550 ) ( not ( = ?auto_31547 ?auto_31551 ) ) ( not ( = ?auto_31548 ?auto_31551 ) ) ( not ( = ?auto_31556 ?auto_31551 ) ) ( not ( = ?auto_31552 ?auto_31551 ) ) ( not ( = ?auto_31560 ?auto_31551 ) ) ( not ( = ?auto_31550 ?auto_31551 ) ) ( not ( = ?auto_31557 ?auto_31551 ) ) ( AVAILABLE ?auto_31553 ) ( TRUCK-AT ?auto_31561 ?auto_31549 ) ( not ( = ?auto_31549 ?auto_31554 ) ) ( not ( = ?auto_31555 ?auto_31549 ) ) ( not ( = ?auto_31562 ?auto_31549 ) ) ( HOIST-AT ?auto_31558 ?auto_31549 ) ( not ( = ?auto_31553 ?auto_31558 ) ) ( not ( = ?auto_31559 ?auto_31558 ) ) ( not ( = ?auto_31563 ?auto_31558 ) ) ( AVAILABLE ?auto_31558 ) ( SURFACE-AT ?auto_31550 ?auto_31549 ) ( ON ?auto_31550 ?auto_31564 ) ( CLEAR ?auto_31550 ) ( not ( = ?auto_31547 ?auto_31564 ) ) ( not ( = ?auto_31548 ?auto_31564 ) ) ( not ( = ?auto_31556 ?auto_31564 ) ) ( not ( = ?auto_31552 ?auto_31564 ) ) ( not ( = ?auto_31560 ?auto_31564 ) ) ( not ( = ?auto_31550 ?auto_31564 ) ) ( not ( = ?auto_31557 ?auto_31564 ) ) ( not ( = ?auto_31551 ?auto_31564 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31558 ?auto_31550 ?auto_31564 ?auto_31549 )
      ( MAKE-ON ?auto_31547 ?auto_31548 )
      ( MAKE-ON-VERIFY ?auto_31547 ?auto_31548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31565 - SURFACE
      ?auto_31566 - SURFACE
    )
    :vars
    (
      ?auto_31567 - HOIST
      ?auto_31576 - PLACE
      ?auto_31582 - PLACE
      ?auto_31575 - HOIST
      ?auto_31578 - SURFACE
      ?auto_31579 - SURFACE
      ?auto_31570 - SURFACE
      ?auto_31572 - SURFACE
      ?auto_31568 - PLACE
      ?auto_31581 - HOIST
      ?auto_31574 - SURFACE
      ?auto_31580 - SURFACE
      ?auto_31577 - PLACE
      ?auto_31573 - HOIST
      ?auto_31571 - SURFACE
      ?auto_31569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31567 ?auto_31576 ) ( IS-CRATE ?auto_31565 ) ( not ( = ?auto_31565 ?auto_31566 ) ) ( not ( = ?auto_31582 ?auto_31576 ) ) ( HOIST-AT ?auto_31575 ?auto_31582 ) ( not ( = ?auto_31567 ?auto_31575 ) ) ( SURFACE-AT ?auto_31565 ?auto_31582 ) ( ON ?auto_31565 ?auto_31578 ) ( CLEAR ?auto_31565 ) ( not ( = ?auto_31565 ?auto_31578 ) ) ( not ( = ?auto_31566 ?auto_31578 ) ) ( IS-CRATE ?auto_31566 ) ( not ( = ?auto_31565 ?auto_31579 ) ) ( not ( = ?auto_31566 ?auto_31579 ) ) ( not ( = ?auto_31578 ?auto_31579 ) ) ( AVAILABLE ?auto_31575 ) ( SURFACE-AT ?auto_31566 ?auto_31582 ) ( ON ?auto_31566 ?auto_31570 ) ( CLEAR ?auto_31566 ) ( not ( = ?auto_31565 ?auto_31570 ) ) ( not ( = ?auto_31566 ?auto_31570 ) ) ( not ( = ?auto_31578 ?auto_31570 ) ) ( not ( = ?auto_31579 ?auto_31570 ) ) ( IS-CRATE ?auto_31579 ) ( not ( = ?auto_31565 ?auto_31572 ) ) ( not ( = ?auto_31566 ?auto_31572 ) ) ( not ( = ?auto_31578 ?auto_31572 ) ) ( not ( = ?auto_31579 ?auto_31572 ) ) ( not ( = ?auto_31570 ?auto_31572 ) ) ( not ( = ?auto_31568 ?auto_31576 ) ) ( not ( = ?auto_31582 ?auto_31568 ) ) ( HOIST-AT ?auto_31581 ?auto_31568 ) ( not ( = ?auto_31567 ?auto_31581 ) ) ( not ( = ?auto_31575 ?auto_31581 ) ) ( AVAILABLE ?auto_31581 ) ( SURFACE-AT ?auto_31579 ?auto_31568 ) ( ON ?auto_31579 ?auto_31574 ) ( CLEAR ?auto_31579 ) ( not ( = ?auto_31565 ?auto_31574 ) ) ( not ( = ?auto_31566 ?auto_31574 ) ) ( not ( = ?auto_31578 ?auto_31574 ) ) ( not ( = ?auto_31579 ?auto_31574 ) ) ( not ( = ?auto_31570 ?auto_31574 ) ) ( not ( = ?auto_31572 ?auto_31574 ) ) ( SURFACE-AT ?auto_31580 ?auto_31576 ) ( CLEAR ?auto_31580 ) ( IS-CRATE ?auto_31572 ) ( not ( = ?auto_31565 ?auto_31580 ) ) ( not ( = ?auto_31566 ?auto_31580 ) ) ( not ( = ?auto_31578 ?auto_31580 ) ) ( not ( = ?auto_31579 ?auto_31580 ) ) ( not ( = ?auto_31570 ?auto_31580 ) ) ( not ( = ?auto_31572 ?auto_31580 ) ) ( not ( = ?auto_31574 ?auto_31580 ) ) ( AVAILABLE ?auto_31567 ) ( not ( = ?auto_31577 ?auto_31576 ) ) ( not ( = ?auto_31582 ?auto_31577 ) ) ( not ( = ?auto_31568 ?auto_31577 ) ) ( HOIST-AT ?auto_31573 ?auto_31577 ) ( not ( = ?auto_31567 ?auto_31573 ) ) ( not ( = ?auto_31575 ?auto_31573 ) ) ( not ( = ?auto_31581 ?auto_31573 ) ) ( AVAILABLE ?auto_31573 ) ( SURFACE-AT ?auto_31572 ?auto_31577 ) ( ON ?auto_31572 ?auto_31571 ) ( CLEAR ?auto_31572 ) ( not ( = ?auto_31565 ?auto_31571 ) ) ( not ( = ?auto_31566 ?auto_31571 ) ) ( not ( = ?auto_31578 ?auto_31571 ) ) ( not ( = ?auto_31579 ?auto_31571 ) ) ( not ( = ?auto_31570 ?auto_31571 ) ) ( not ( = ?auto_31572 ?auto_31571 ) ) ( not ( = ?auto_31574 ?auto_31571 ) ) ( not ( = ?auto_31580 ?auto_31571 ) ) ( TRUCK-AT ?auto_31569 ?auto_31576 ) )
    :subtasks
    ( ( !DRIVE ?auto_31569 ?auto_31576 ?auto_31577 )
      ( MAKE-ON ?auto_31565 ?auto_31566 )
      ( MAKE-ON-VERIFY ?auto_31565 ?auto_31566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31583 - SURFACE
      ?auto_31584 - SURFACE
    )
    :vars
    (
      ?auto_31596 - HOIST
      ?auto_31589 - PLACE
      ?auto_31593 - PLACE
      ?auto_31592 - HOIST
      ?auto_31585 - SURFACE
      ?auto_31594 - SURFACE
      ?auto_31600 - SURFACE
      ?auto_31590 - SURFACE
      ?auto_31597 - PLACE
      ?auto_31598 - HOIST
      ?auto_31595 - SURFACE
      ?auto_31586 - SURFACE
      ?auto_31588 - PLACE
      ?auto_31591 - HOIST
      ?auto_31599 - SURFACE
      ?auto_31587 - TRUCK
      ?auto_31601 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31596 ?auto_31589 ) ( IS-CRATE ?auto_31583 ) ( not ( = ?auto_31583 ?auto_31584 ) ) ( not ( = ?auto_31593 ?auto_31589 ) ) ( HOIST-AT ?auto_31592 ?auto_31593 ) ( not ( = ?auto_31596 ?auto_31592 ) ) ( SURFACE-AT ?auto_31583 ?auto_31593 ) ( ON ?auto_31583 ?auto_31585 ) ( CLEAR ?auto_31583 ) ( not ( = ?auto_31583 ?auto_31585 ) ) ( not ( = ?auto_31584 ?auto_31585 ) ) ( IS-CRATE ?auto_31584 ) ( not ( = ?auto_31583 ?auto_31594 ) ) ( not ( = ?auto_31584 ?auto_31594 ) ) ( not ( = ?auto_31585 ?auto_31594 ) ) ( AVAILABLE ?auto_31592 ) ( SURFACE-AT ?auto_31584 ?auto_31593 ) ( ON ?auto_31584 ?auto_31600 ) ( CLEAR ?auto_31584 ) ( not ( = ?auto_31583 ?auto_31600 ) ) ( not ( = ?auto_31584 ?auto_31600 ) ) ( not ( = ?auto_31585 ?auto_31600 ) ) ( not ( = ?auto_31594 ?auto_31600 ) ) ( IS-CRATE ?auto_31594 ) ( not ( = ?auto_31583 ?auto_31590 ) ) ( not ( = ?auto_31584 ?auto_31590 ) ) ( not ( = ?auto_31585 ?auto_31590 ) ) ( not ( = ?auto_31594 ?auto_31590 ) ) ( not ( = ?auto_31600 ?auto_31590 ) ) ( not ( = ?auto_31597 ?auto_31589 ) ) ( not ( = ?auto_31593 ?auto_31597 ) ) ( HOIST-AT ?auto_31598 ?auto_31597 ) ( not ( = ?auto_31596 ?auto_31598 ) ) ( not ( = ?auto_31592 ?auto_31598 ) ) ( AVAILABLE ?auto_31598 ) ( SURFACE-AT ?auto_31594 ?auto_31597 ) ( ON ?auto_31594 ?auto_31595 ) ( CLEAR ?auto_31594 ) ( not ( = ?auto_31583 ?auto_31595 ) ) ( not ( = ?auto_31584 ?auto_31595 ) ) ( not ( = ?auto_31585 ?auto_31595 ) ) ( not ( = ?auto_31594 ?auto_31595 ) ) ( not ( = ?auto_31600 ?auto_31595 ) ) ( not ( = ?auto_31590 ?auto_31595 ) ) ( IS-CRATE ?auto_31590 ) ( not ( = ?auto_31583 ?auto_31586 ) ) ( not ( = ?auto_31584 ?auto_31586 ) ) ( not ( = ?auto_31585 ?auto_31586 ) ) ( not ( = ?auto_31594 ?auto_31586 ) ) ( not ( = ?auto_31600 ?auto_31586 ) ) ( not ( = ?auto_31590 ?auto_31586 ) ) ( not ( = ?auto_31595 ?auto_31586 ) ) ( not ( = ?auto_31588 ?auto_31589 ) ) ( not ( = ?auto_31593 ?auto_31588 ) ) ( not ( = ?auto_31597 ?auto_31588 ) ) ( HOIST-AT ?auto_31591 ?auto_31588 ) ( not ( = ?auto_31596 ?auto_31591 ) ) ( not ( = ?auto_31592 ?auto_31591 ) ) ( not ( = ?auto_31598 ?auto_31591 ) ) ( AVAILABLE ?auto_31591 ) ( SURFACE-AT ?auto_31590 ?auto_31588 ) ( ON ?auto_31590 ?auto_31599 ) ( CLEAR ?auto_31590 ) ( not ( = ?auto_31583 ?auto_31599 ) ) ( not ( = ?auto_31584 ?auto_31599 ) ) ( not ( = ?auto_31585 ?auto_31599 ) ) ( not ( = ?auto_31594 ?auto_31599 ) ) ( not ( = ?auto_31600 ?auto_31599 ) ) ( not ( = ?auto_31590 ?auto_31599 ) ) ( not ( = ?auto_31595 ?auto_31599 ) ) ( not ( = ?auto_31586 ?auto_31599 ) ) ( TRUCK-AT ?auto_31587 ?auto_31589 ) ( SURFACE-AT ?auto_31601 ?auto_31589 ) ( CLEAR ?auto_31601 ) ( LIFTING ?auto_31596 ?auto_31586 ) ( IS-CRATE ?auto_31586 ) ( not ( = ?auto_31583 ?auto_31601 ) ) ( not ( = ?auto_31584 ?auto_31601 ) ) ( not ( = ?auto_31585 ?auto_31601 ) ) ( not ( = ?auto_31594 ?auto_31601 ) ) ( not ( = ?auto_31600 ?auto_31601 ) ) ( not ( = ?auto_31590 ?auto_31601 ) ) ( not ( = ?auto_31595 ?auto_31601 ) ) ( not ( = ?auto_31586 ?auto_31601 ) ) ( not ( = ?auto_31599 ?auto_31601 ) ) )
    :subtasks
    ( ( !DROP ?auto_31596 ?auto_31586 ?auto_31601 ?auto_31589 )
      ( MAKE-ON ?auto_31583 ?auto_31584 )
      ( MAKE-ON-VERIFY ?auto_31583 ?auto_31584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31602 - SURFACE
      ?auto_31603 - SURFACE
    )
    :vars
    (
      ?auto_31604 - HOIST
      ?auto_31619 - PLACE
      ?auto_31614 - PLACE
      ?auto_31605 - HOIST
      ?auto_31615 - SURFACE
      ?auto_31611 - SURFACE
      ?auto_31608 - SURFACE
      ?auto_31620 - SURFACE
      ?auto_31610 - PLACE
      ?auto_31606 - HOIST
      ?auto_31607 - SURFACE
      ?auto_31616 - SURFACE
      ?auto_31618 - PLACE
      ?auto_31609 - HOIST
      ?auto_31612 - SURFACE
      ?auto_31617 - TRUCK
      ?auto_31613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31604 ?auto_31619 ) ( IS-CRATE ?auto_31602 ) ( not ( = ?auto_31602 ?auto_31603 ) ) ( not ( = ?auto_31614 ?auto_31619 ) ) ( HOIST-AT ?auto_31605 ?auto_31614 ) ( not ( = ?auto_31604 ?auto_31605 ) ) ( SURFACE-AT ?auto_31602 ?auto_31614 ) ( ON ?auto_31602 ?auto_31615 ) ( CLEAR ?auto_31602 ) ( not ( = ?auto_31602 ?auto_31615 ) ) ( not ( = ?auto_31603 ?auto_31615 ) ) ( IS-CRATE ?auto_31603 ) ( not ( = ?auto_31602 ?auto_31611 ) ) ( not ( = ?auto_31603 ?auto_31611 ) ) ( not ( = ?auto_31615 ?auto_31611 ) ) ( AVAILABLE ?auto_31605 ) ( SURFACE-AT ?auto_31603 ?auto_31614 ) ( ON ?auto_31603 ?auto_31608 ) ( CLEAR ?auto_31603 ) ( not ( = ?auto_31602 ?auto_31608 ) ) ( not ( = ?auto_31603 ?auto_31608 ) ) ( not ( = ?auto_31615 ?auto_31608 ) ) ( not ( = ?auto_31611 ?auto_31608 ) ) ( IS-CRATE ?auto_31611 ) ( not ( = ?auto_31602 ?auto_31620 ) ) ( not ( = ?auto_31603 ?auto_31620 ) ) ( not ( = ?auto_31615 ?auto_31620 ) ) ( not ( = ?auto_31611 ?auto_31620 ) ) ( not ( = ?auto_31608 ?auto_31620 ) ) ( not ( = ?auto_31610 ?auto_31619 ) ) ( not ( = ?auto_31614 ?auto_31610 ) ) ( HOIST-AT ?auto_31606 ?auto_31610 ) ( not ( = ?auto_31604 ?auto_31606 ) ) ( not ( = ?auto_31605 ?auto_31606 ) ) ( AVAILABLE ?auto_31606 ) ( SURFACE-AT ?auto_31611 ?auto_31610 ) ( ON ?auto_31611 ?auto_31607 ) ( CLEAR ?auto_31611 ) ( not ( = ?auto_31602 ?auto_31607 ) ) ( not ( = ?auto_31603 ?auto_31607 ) ) ( not ( = ?auto_31615 ?auto_31607 ) ) ( not ( = ?auto_31611 ?auto_31607 ) ) ( not ( = ?auto_31608 ?auto_31607 ) ) ( not ( = ?auto_31620 ?auto_31607 ) ) ( IS-CRATE ?auto_31620 ) ( not ( = ?auto_31602 ?auto_31616 ) ) ( not ( = ?auto_31603 ?auto_31616 ) ) ( not ( = ?auto_31615 ?auto_31616 ) ) ( not ( = ?auto_31611 ?auto_31616 ) ) ( not ( = ?auto_31608 ?auto_31616 ) ) ( not ( = ?auto_31620 ?auto_31616 ) ) ( not ( = ?auto_31607 ?auto_31616 ) ) ( not ( = ?auto_31618 ?auto_31619 ) ) ( not ( = ?auto_31614 ?auto_31618 ) ) ( not ( = ?auto_31610 ?auto_31618 ) ) ( HOIST-AT ?auto_31609 ?auto_31618 ) ( not ( = ?auto_31604 ?auto_31609 ) ) ( not ( = ?auto_31605 ?auto_31609 ) ) ( not ( = ?auto_31606 ?auto_31609 ) ) ( AVAILABLE ?auto_31609 ) ( SURFACE-AT ?auto_31620 ?auto_31618 ) ( ON ?auto_31620 ?auto_31612 ) ( CLEAR ?auto_31620 ) ( not ( = ?auto_31602 ?auto_31612 ) ) ( not ( = ?auto_31603 ?auto_31612 ) ) ( not ( = ?auto_31615 ?auto_31612 ) ) ( not ( = ?auto_31611 ?auto_31612 ) ) ( not ( = ?auto_31608 ?auto_31612 ) ) ( not ( = ?auto_31620 ?auto_31612 ) ) ( not ( = ?auto_31607 ?auto_31612 ) ) ( not ( = ?auto_31616 ?auto_31612 ) ) ( TRUCK-AT ?auto_31617 ?auto_31619 ) ( SURFACE-AT ?auto_31613 ?auto_31619 ) ( CLEAR ?auto_31613 ) ( IS-CRATE ?auto_31616 ) ( not ( = ?auto_31602 ?auto_31613 ) ) ( not ( = ?auto_31603 ?auto_31613 ) ) ( not ( = ?auto_31615 ?auto_31613 ) ) ( not ( = ?auto_31611 ?auto_31613 ) ) ( not ( = ?auto_31608 ?auto_31613 ) ) ( not ( = ?auto_31620 ?auto_31613 ) ) ( not ( = ?auto_31607 ?auto_31613 ) ) ( not ( = ?auto_31616 ?auto_31613 ) ) ( not ( = ?auto_31612 ?auto_31613 ) ) ( AVAILABLE ?auto_31604 ) ( IN ?auto_31616 ?auto_31617 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31604 ?auto_31616 ?auto_31617 ?auto_31619 )
      ( MAKE-ON ?auto_31602 ?auto_31603 )
      ( MAKE-ON-VERIFY ?auto_31602 ?auto_31603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31621 - SURFACE
      ?auto_31622 - SURFACE
    )
    :vars
    (
      ?auto_31623 - HOIST
      ?auto_31627 - PLACE
      ?auto_31633 - PLACE
      ?auto_31634 - HOIST
      ?auto_31637 - SURFACE
      ?auto_31630 - SURFACE
      ?auto_31635 - SURFACE
      ?auto_31625 - SURFACE
      ?auto_31626 - PLACE
      ?auto_31631 - HOIST
      ?auto_31638 - SURFACE
      ?auto_31629 - SURFACE
      ?auto_31624 - PLACE
      ?auto_31639 - HOIST
      ?auto_31628 - SURFACE
      ?auto_31632 - SURFACE
      ?auto_31636 - TRUCK
      ?auto_31640 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31623 ?auto_31627 ) ( IS-CRATE ?auto_31621 ) ( not ( = ?auto_31621 ?auto_31622 ) ) ( not ( = ?auto_31633 ?auto_31627 ) ) ( HOIST-AT ?auto_31634 ?auto_31633 ) ( not ( = ?auto_31623 ?auto_31634 ) ) ( SURFACE-AT ?auto_31621 ?auto_31633 ) ( ON ?auto_31621 ?auto_31637 ) ( CLEAR ?auto_31621 ) ( not ( = ?auto_31621 ?auto_31637 ) ) ( not ( = ?auto_31622 ?auto_31637 ) ) ( IS-CRATE ?auto_31622 ) ( not ( = ?auto_31621 ?auto_31630 ) ) ( not ( = ?auto_31622 ?auto_31630 ) ) ( not ( = ?auto_31637 ?auto_31630 ) ) ( AVAILABLE ?auto_31634 ) ( SURFACE-AT ?auto_31622 ?auto_31633 ) ( ON ?auto_31622 ?auto_31635 ) ( CLEAR ?auto_31622 ) ( not ( = ?auto_31621 ?auto_31635 ) ) ( not ( = ?auto_31622 ?auto_31635 ) ) ( not ( = ?auto_31637 ?auto_31635 ) ) ( not ( = ?auto_31630 ?auto_31635 ) ) ( IS-CRATE ?auto_31630 ) ( not ( = ?auto_31621 ?auto_31625 ) ) ( not ( = ?auto_31622 ?auto_31625 ) ) ( not ( = ?auto_31637 ?auto_31625 ) ) ( not ( = ?auto_31630 ?auto_31625 ) ) ( not ( = ?auto_31635 ?auto_31625 ) ) ( not ( = ?auto_31626 ?auto_31627 ) ) ( not ( = ?auto_31633 ?auto_31626 ) ) ( HOIST-AT ?auto_31631 ?auto_31626 ) ( not ( = ?auto_31623 ?auto_31631 ) ) ( not ( = ?auto_31634 ?auto_31631 ) ) ( AVAILABLE ?auto_31631 ) ( SURFACE-AT ?auto_31630 ?auto_31626 ) ( ON ?auto_31630 ?auto_31638 ) ( CLEAR ?auto_31630 ) ( not ( = ?auto_31621 ?auto_31638 ) ) ( not ( = ?auto_31622 ?auto_31638 ) ) ( not ( = ?auto_31637 ?auto_31638 ) ) ( not ( = ?auto_31630 ?auto_31638 ) ) ( not ( = ?auto_31635 ?auto_31638 ) ) ( not ( = ?auto_31625 ?auto_31638 ) ) ( IS-CRATE ?auto_31625 ) ( not ( = ?auto_31621 ?auto_31629 ) ) ( not ( = ?auto_31622 ?auto_31629 ) ) ( not ( = ?auto_31637 ?auto_31629 ) ) ( not ( = ?auto_31630 ?auto_31629 ) ) ( not ( = ?auto_31635 ?auto_31629 ) ) ( not ( = ?auto_31625 ?auto_31629 ) ) ( not ( = ?auto_31638 ?auto_31629 ) ) ( not ( = ?auto_31624 ?auto_31627 ) ) ( not ( = ?auto_31633 ?auto_31624 ) ) ( not ( = ?auto_31626 ?auto_31624 ) ) ( HOIST-AT ?auto_31639 ?auto_31624 ) ( not ( = ?auto_31623 ?auto_31639 ) ) ( not ( = ?auto_31634 ?auto_31639 ) ) ( not ( = ?auto_31631 ?auto_31639 ) ) ( AVAILABLE ?auto_31639 ) ( SURFACE-AT ?auto_31625 ?auto_31624 ) ( ON ?auto_31625 ?auto_31628 ) ( CLEAR ?auto_31625 ) ( not ( = ?auto_31621 ?auto_31628 ) ) ( not ( = ?auto_31622 ?auto_31628 ) ) ( not ( = ?auto_31637 ?auto_31628 ) ) ( not ( = ?auto_31630 ?auto_31628 ) ) ( not ( = ?auto_31635 ?auto_31628 ) ) ( not ( = ?auto_31625 ?auto_31628 ) ) ( not ( = ?auto_31638 ?auto_31628 ) ) ( not ( = ?auto_31629 ?auto_31628 ) ) ( SURFACE-AT ?auto_31632 ?auto_31627 ) ( CLEAR ?auto_31632 ) ( IS-CRATE ?auto_31629 ) ( not ( = ?auto_31621 ?auto_31632 ) ) ( not ( = ?auto_31622 ?auto_31632 ) ) ( not ( = ?auto_31637 ?auto_31632 ) ) ( not ( = ?auto_31630 ?auto_31632 ) ) ( not ( = ?auto_31635 ?auto_31632 ) ) ( not ( = ?auto_31625 ?auto_31632 ) ) ( not ( = ?auto_31638 ?auto_31632 ) ) ( not ( = ?auto_31629 ?auto_31632 ) ) ( not ( = ?auto_31628 ?auto_31632 ) ) ( AVAILABLE ?auto_31623 ) ( IN ?auto_31629 ?auto_31636 ) ( TRUCK-AT ?auto_31636 ?auto_31640 ) ( not ( = ?auto_31640 ?auto_31627 ) ) ( not ( = ?auto_31633 ?auto_31640 ) ) ( not ( = ?auto_31626 ?auto_31640 ) ) ( not ( = ?auto_31624 ?auto_31640 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31636 ?auto_31640 ?auto_31627 )
      ( MAKE-ON ?auto_31621 ?auto_31622 )
      ( MAKE-ON-VERIFY ?auto_31621 ?auto_31622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31641 - SURFACE
      ?auto_31642 - SURFACE
    )
    :vars
    (
      ?auto_31660 - HOIST
      ?auto_31643 - PLACE
      ?auto_31648 - PLACE
      ?auto_31650 - HOIST
      ?auto_31656 - SURFACE
      ?auto_31645 - SURFACE
      ?auto_31652 - SURFACE
      ?auto_31654 - SURFACE
      ?auto_31644 - PLACE
      ?auto_31653 - HOIST
      ?auto_31659 - SURFACE
      ?auto_31657 - SURFACE
      ?auto_31649 - PLACE
      ?auto_31646 - HOIST
      ?auto_31647 - SURFACE
      ?auto_31651 - SURFACE
      ?auto_31655 - TRUCK
      ?auto_31658 - PLACE
      ?auto_31661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31660 ?auto_31643 ) ( IS-CRATE ?auto_31641 ) ( not ( = ?auto_31641 ?auto_31642 ) ) ( not ( = ?auto_31648 ?auto_31643 ) ) ( HOIST-AT ?auto_31650 ?auto_31648 ) ( not ( = ?auto_31660 ?auto_31650 ) ) ( SURFACE-AT ?auto_31641 ?auto_31648 ) ( ON ?auto_31641 ?auto_31656 ) ( CLEAR ?auto_31641 ) ( not ( = ?auto_31641 ?auto_31656 ) ) ( not ( = ?auto_31642 ?auto_31656 ) ) ( IS-CRATE ?auto_31642 ) ( not ( = ?auto_31641 ?auto_31645 ) ) ( not ( = ?auto_31642 ?auto_31645 ) ) ( not ( = ?auto_31656 ?auto_31645 ) ) ( AVAILABLE ?auto_31650 ) ( SURFACE-AT ?auto_31642 ?auto_31648 ) ( ON ?auto_31642 ?auto_31652 ) ( CLEAR ?auto_31642 ) ( not ( = ?auto_31641 ?auto_31652 ) ) ( not ( = ?auto_31642 ?auto_31652 ) ) ( not ( = ?auto_31656 ?auto_31652 ) ) ( not ( = ?auto_31645 ?auto_31652 ) ) ( IS-CRATE ?auto_31645 ) ( not ( = ?auto_31641 ?auto_31654 ) ) ( not ( = ?auto_31642 ?auto_31654 ) ) ( not ( = ?auto_31656 ?auto_31654 ) ) ( not ( = ?auto_31645 ?auto_31654 ) ) ( not ( = ?auto_31652 ?auto_31654 ) ) ( not ( = ?auto_31644 ?auto_31643 ) ) ( not ( = ?auto_31648 ?auto_31644 ) ) ( HOIST-AT ?auto_31653 ?auto_31644 ) ( not ( = ?auto_31660 ?auto_31653 ) ) ( not ( = ?auto_31650 ?auto_31653 ) ) ( AVAILABLE ?auto_31653 ) ( SURFACE-AT ?auto_31645 ?auto_31644 ) ( ON ?auto_31645 ?auto_31659 ) ( CLEAR ?auto_31645 ) ( not ( = ?auto_31641 ?auto_31659 ) ) ( not ( = ?auto_31642 ?auto_31659 ) ) ( not ( = ?auto_31656 ?auto_31659 ) ) ( not ( = ?auto_31645 ?auto_31659 ) ) ( not ( = ?auto_31652 ?auto_31659 ) ) ( not ( = ?auto_31654 ?auto_31659 ) ) ( IS-CRATE ?auto_31654 ) ( not ( = ?auto_31641 ?auto_31657 ) ) ( not ( = ?auto_31642 ?auto_31657 ) ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( not ( = ?auto_31645 ?auto_31657 ) ) ( not ( = ?auto_31652 ?auto_31657 ) ) ( not ( = ?auto_31654 ?auto_31657 ) ) ( not ( = ?auto_31659 ?auto_31657 ) ) ( not ( = ?auto_31649 ?auto_31643 ) ) ( not ( = ?auto_31648 ?auto_31649 ) ) ( not ( = ?auto_31644 ?auto_31649 ) ) ( HOIST-AT ?auto_31646 ?auto_31649 ) ( not ( = ?auto_31660 ?auto_31646 ) ) ( not ( = ?auto_31650 ?auto_31646 ) ) ( not ( = ?auto_31653 ?auto_31646 ) ) ( AVAILABLE ?auto_31646 ) ( SURFACE-AT ?auto_31654 ?auto_31649 ) ( ON ?auto_31654 ?auto_31647 ) ( CLEAR ?auto_31654 ) ( not ( = ?auto_31641 ?auto_31647 ) ) ( not ( = ?auto_31642 ?auto_31647 ) ) ( not ( = ?auto_31656 ?auto_31647 ) ) ( not ( = ?auto_31645 ?auto_31647 ) ) ( not ( = ?auto_31652 ?auto_31647 ) ) ( not ( = ?auto_31654 ?auto_31647 ) ) ( not ( = ?auto_31659 ?auto_31647 ) ) ( not ( = ?auto_31657 ?auto_31647 ) ) ( SURFACE-AT ?auto_31651 ?auto_31643 ) ( CLEAR ?auto_31651 ) ( IS-CRATE ?auto_31657 ) ( not ( = ?auto_31641 ?auto_31651 ) ) ( not ( = ?auto_31642 ?auto_31651 ) ) ( not ( = ?auto_31656 ?auto_31651 ) ) ( not ( = ?auto_31645 ?auto_31651 ) ) ( not ( = ?auto_31652 ?auto_31651 ) ) ( not ( = ?auto_31654 ?auto_31651 ) ) ( not ( = ?auto_31659 ?auto_31651 ) ) ( not ( = ?auto_31657 ?auto_31651 ) ) ( not ( = ?auto_31647 ?auto_31651 ) ) ( AVAILABLE ?auto_31660 ) ( TRUCK-AT ?auto_31655 ?auto_31658 ) ( not ( = ?auto_31658 ?auto_31643 ) ) ( not ( = ?auto_31648 ?auto_31658 ) ) ( not ( = ?auto_31644 ?auto_31658 ) ) ( not ( = ?auto_31649 ?auto_31658 ) ) ( HOIST-AT ?auto_31661 ?auto_31658 ) ( LIFTING ?auto_31661 ?auto_31657 ) ( not ( = ?auto_31660 ?auto_31661 ) ) ( not ( = ?auto_31650 ?auto_31661 ) ) ( not ( = ?auto_31653 ?auto_31661 ) ) ( not ( = ?auto_31646 ?auto_31661 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31661 ?auto_31657 ?auto_31655 ?auto_31658 )
      ( MAKE-ON ?auto_31641 ?auto_31642 )
      ( MAKE-ON-VERIFY ?auto_31641 ?auto_31642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31662 - SURFACE
      ?auto_31663 - SURFACE
    )
    :vars
    (
      ?auto_31667 - HOIST
      ?auto_31664 - PLACE
      ?auto_31669 - PLACE
      ?auto_31677 - HOIST
      ?auto_31678 - SURFACE
      ?auto_31681 - SURFACE
      ?auto_31679 - SURFACE
      ?auto_31671 - SURFACE
      ?auto_31670 - PLACE
      ?auto_31666 - HOIST
      ?auto_31668 - SURFACE
      ?auto_31676 - SURFACE
      ?auto_31674 - PLACE
      ?auto_31682 - HOIST
      ?auto_31665 - SURFACE
      ?auto_31675 - SURFACE
      ?auto_31680 - TRUCK
      ?auto_31672 - PLACE
      ?auto_31673 - HOIST
      ?auto_31683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31667 ?auto_31664 ) ( IS-CRATE ?auto_31662 ) ( not ( = ?auto_31662 ?auto_31663 ) ) ( not ( = ?auto_31669 ?auto_31664 ) ) ( HOIST-AT ?auto_31677 ?auto_31669 ) ( not ( = ?auto_31667 ?auto_31677 ) ) ( SURFACE-AT ?auto_31662 ?auto_31669 ) ( ON ?auto_31662 ?auto_31678 ) ( CLEAR ?auto_31662 ) ( not ( = ?auto_31662 ?auto_31678 ) ) ( not ( = ?auto_31663 ?auto_31678 ) ) ( IS-CRATE ?auto_31663 ) ( not ( = ?auto_31662 ?auto_31681 ) ) ( not ( = ?auto_31663 ?auto_31681 ) ) ( not ( = ?auto_31678 ?auto_31681 ) ) ( AVAILABLE ?auto_31677 ) ( SURFACE-AT ?auto_31663 ?auto_31669 ) ( ON ?auto_31663 ?auto_31679 ) ( CLEAR ?auto_31663 ) ( not ( = ?auto_31662 ?auto_31679 ) ) ( not ( = ?auto_31663 ?auto_31679 ) ) ( not ( = ?auto_31678 ?auto_31679 ) ) ( not ( = ?auto_31681 ?auto_31679 ) ) ( IS-CRATE ?auto_31681 ) ( not ( = ?auto_31662 ?auto_31671 ) ) ( not ( = ?auto_31663 ?auto_31671 ) ) ( not ( = ?auto_31678 ?auto_31671 ) ) ( not ( = ?auto_31681 ?auto_31671 ) ) ( not ( = ?auto_31679 ?auto_31671 ) ) ( not ( = ?auto_31670 ?auto_31664 ) ) ( not ( = ?auto_31669 ?auto_31670 ) ) ( HOIST-AT ?auto_31666 ?auto_31670 ) ( not ( = ?auto_31667 ?auto_31666 ) ) ( not ( = ?auto_31677 ?auto_31666 ) ) ( AVAILABLE ?auto_31666 ) ( SURFACE-AT ?auto_31681 ?auto_31670 ) ( ON ?auto_31681 ?auto_31668 ) ( CLEAR ?auto_31681 ) ( not ( = ?auto_31662 ?auto_31668 ) ) ( not ( = ?auto_31663 ?auto_31668 ) ) ( not ( = ?auto_31678 ?auto_31668 ) ) ( not ( = ?auto_31681 ?auto_31668 ) ) ( not ( = ?auto_31679 ?auto_31668 ) ) ( not ( = ?auto_31671 ?auto_31668 ) ) ( IS-CRATE ?auto_31671 ) ( not ( = ?auto_31662 ?auto_31676 ) ) ( not ( = ?auto_31663 ?auto_31676 ) ) ( not ( = ?auto_31678 ?auto_31676 ) ) ( not ( = ?auto_31681 ?auto_31676 ) ) ( not ( = ?auto_31679 ?auto_31676 ) ) ( not ( = ?auto_31671 ?auto_31676 ) ) ( not ( = ?auto_31668 ?auto_31676 ) ) ( not ( = ?auto_31674 ?auto_31664 ) ) ( not ( = ?auto_31669 ?auto_31674 ) ) ( not ( = ?auto_31670 ?auto_31674 ) ) ( HOIST-AT ?auto_31682 ?auto_31674 ) ( not ( = ?auto_31667 ?auto_31682 ) ) ( not ( = ?auto_31677 ?auto_31682 ) ) ( not ( = ?auto_31666 ?auto_31682 ) ) ( AVAILABLE ?auto_31682 ) ( SURFACE-AT ?auto_31671 ?auto_31674 ) ( ON ?auto_31671 ?auto_31665 ) ( CLEAR ?auto_31671 ) ( not ( = ?auto_31662 ?auto_31665 ) ) ( not ( = ?auto_31663 ?auto_31665 ) ) ( not ( = ?auto_31678 ?auto_31665 ) ) ( not ( = ?auto_31681 ?auto_31665 ) ) ( not ( = ?auto_31679 ?auto_31665 ) ) ( not ( = ?auto_31671 ?auto_31665 ) ) ( not ( = ?auto_31668 ?auto_31665 ) ) ( not ( = ?auto_31676 ?auto_31665 ) ) ( SURFACE-AT ?auto_31675 ?auto_31664 ) ( CLEAR ?auto_31675 ) ( IS-CRATE ?auto_31676 ) ( not ( = ?auto_31662 ?auto_31675 ) ) ( not ( = ?auto_31663 ?auto_31675 ) ) ( not ( = ?auto_31678 ?auto_31675 ) ) ( not ( = ?auto_31681 ?auto_31675 ) ) ( not ( = ?auto_31679 ?auto_31675 ) ) ( not ( = ?auto_31671 ?auto_31675 ) ) ( not ( = ?auto_31668 ?auto_31675 ) ) ( not ( = ?auto_31676 ?auto_31675 ) ) ( not ( = ?auto_31665 ?auto_31675 ) ) ( AVAILABLE ?auto_31667 ) ( TRUCK-AT ?auto_31680 ?auto_31672 ) ( not ( = ?auto_31672 ?auto_31664 ) ) ( not ( = ?auto_31669 ?auto_31672 ) ) ( not ( = ?auto_31670 ?auto_31672 ) ) ( not ( = ?auto_31674 ?auto_31672 ) ) ( HOIST-AT ?auto_31673 ?auto_31672 ) ( not ( = ?auto_31667 ?auto_31673 ) ) ( not ( = ?auto_31677 ?auto_31673 ) ) ( not ( = ?auto_31666 ?auto_31673 ) ) ( not ( = ?auto_31682 ?auto_31673 ) ) ( AVAILABLE ?auto_31673 ) ( SURFACE-AT ?auto_31676 ?auto_31672 ) ( ON ?auto_31676 ?auto_31683 ) ( CLEAR ?auto_31676 ) ( not ( = ?auto_31662 ?auto_31683 ) ) ( not ( = ?auto_31663 ?auto_31683 ) ) ( not ( = ?auto_31678 ?auto_31683 ) ) ( not ( = ?auto_31681 ?auto_31683 ) ) ( not ( = ?auto_31679 ?auto_31683 ) ) ( not ( = ?auto_31671 ?auto_31683 ) ) ( not ( = ?auto_31668 ?auto_31683 ) ) ( not ( = ?auto_31676 ?auto_31683 ) ) ( not ( = ?auto_31665 ?auto_31683 ) ) ( not ( = ?auto_31675 ?auto_31683 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31673 ?auto_31676 ?auto_31683 ?auto_31672 )
      ( MAKE-ON ?auto_31662 ?auto_31663 )
      ( MAKE-ON-VERIFY ?auto_31662 ?auto_31663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31684 - SURFACE
      ?auto_31685 - SURFACE
    )
    :vars
    (
      ?auto_31696 - HOIST
      ?auto_31693 - PLACE
      ?auto_31699 - PLACE
      ?auto_31691 - HOIST
      ?auto_31690 - SURFACE
      ?auto_31704 - SURFACE
      ?auto_31694 - SURFACE
      ?auto_31689 - SURFACE
      ?auto_31701 - PLACE
      ?auto_31688 - HOIST
      ?auto_31686 - SURFACE
      ?auto_31697 - SURFACE
      ?auto_31702 - PLACE
      ?auto_31698 - HOIST
      ?auto_31700 - SURFACE
      ?auto_31687 - SURFACE
      ?auto_31692 - PLACE
      ?auto_31695 - HOIST
      ?auto_31703 - SURFACE
      ?auto_31705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31696 ?auto_31693 ) ( IS-CRATE ?auto_31684 ) ( not ( = ?auto_31684 ?auto_31685 ) ) ( not ( = ?auto_31699 ?auto_31693 ) ) ( HOIST-AT ?auto_31691 ?auto_31699 ) ( not ( = ?auto_31696 ?auto_31691 ) ) ( SURFACE-AT ?auto_31684 ?auto_31699 ) ( ON ?auto_31684 ?auto_31690 ) ( CLEAR ?auto_31684 ) ( not ( = ?auto_31684 ?auto_31690 ) ) ( not ( = ?auto_31685 ?auto_31690 ) ) ( IS-CRATE ?auto_31685 ) ( not ( = ?auto_31684 ?auto_31704 ) ) ( not ( = ?auto_31685 ?auto_31704 ) ) ( not ( = ?auto_31690 ?auto_31704 ) ) ( AVAILABLE ?auto_31691 ) ( SURFACE-AT ?auto_31685 ?auto_31699 ) ( ON ?auto_31685 ?auto_31694 ) ( CLEAR ?auto_31685 ) ( not ( = ?auto_31684 ?auto_31694 ) ) ( not ( = ?auto_31685 ?auto_31694 ) ) ( not ( = ?auto_31690 ?auto_31694 ) ) ( not ( = ?auto_31704 ?auto_31694 ) ) ( IS-CRATE ?auto_31704 ) ( not ( = ?auto_31684 ?auto_31689 ) ) ( not ( = ?auto_31685 ?auto_31689 ) ) ( not ( = ?auto_31690 ?auto_31689 ) ) ( not ( = ?auto_31704 ?auto_31689 ) ) ( not ( = ?auto_31694 ?auto_31689 ) ) ( not ( = ?auto_31701 ?auto_31693 ) ) ( not ( = ?auto_31699 ?auto_31701 ) ) ( HOIST-AT ?auto_31688 ?auto_31701 ) ( not ( = ?auto_31696 ?auto_31688 ) ) ( not ( = ?auto_31691 ?auto_31688 ) ) ( AVAILABLE ?auto_31688 ) ( SURFACE-AT ?auto_31704 ?auto_31701 ) ( ON ?auto_31704 ?auto_31686 ) ( CLEAR ?auto_31704 ) ( not ( = ?auto_31684 ?auto_31686 ) ) ( not ( = ?auto_31685 ?auto_31686 ) ) ( not ( = ?auto_31690 ?auto_31686 ) ) ( not ( = ?auto_31704 ?auto_31686 ) ) ( not ( = ?auto_31694 ?auto_31686 ) ) ( not ( = ?auto_31689 ?auto_31686 ) ) ( IS-CRATE ?auto_31689 ) ( not ( = ?auto_31684 ?auto_31697 ) ) ( not ( = ?auto_31685 ?auto_31697 ) ) ( not ( = ?auto_31690 ?auto_31697 ) ) ( not ( = ?auto_31704 ?auto_31697 ) ) ( not ( = ?auto_31694 ?auto_31697 ) ) ( not ( = ?auto_31689 ?auto_31697 ) ) ( not ( = ?auto_31686 ?auto_31697 ) ) ( not ( = ?auto_31702 ?auto_31693 ) ) ( not ( = ?auto_31699 ?auto_31702 ) ) ( not ( = ?auto_31701 ?auto_31702 ) ) ( HOIST-AT ?auto_31698 ?auto_31702 ) ( not ( = ?auto_31696 ?auto_31698 ) ) ( not ( = ?auto_31691 ?auto_31698 ) ) ( not ( = ?auto_31688 ?auto_31698 ) ) ( AVAILABLE ?auto_31698 ) ( SURFACE-AT ?auto_31689 ?auto_31702 ) ( ON ?auto_31689 ?auto_31700 ) ( CLEAR ?auto_31689 ) ( not ( = ?auto_31684 ?auto_31700 ) ) ( not ( = ?auto_31685 ?auto_31700 ) ) ( not ( = ?auto_31690 ?auto_31700 ) ) ( not ( = ?auto_31704 ?auto_31700 ) ) ( not ( = ?auto_31694 ?auto_31700 ) ) ( not ( = ?auto_31689 ?auto_31700 ) ) ( not ( = ?auto_31686 ?auto_31700 ) ) ( not ( = ?auto_31697 ?auto_31700 ) ) ( SURFACE-AT ?auto_31687 ?auto_31693 ) ( CLEAR ?auto_31687 ) ( IS-CRATE ?auto_31697 ) ( not ( = ?auto_31684 ?auto_31687 ) ) ( not ( = ?auto_31685 ?auto_31687 ) ) ( not ( = ?auto_31690 ?auto_31687 ) ) ( not ( = ?auto_31704 ?auto_31687 ) ) ( not ( = ?auto_31694 ?auto_31687 ) ) ( not ( = ?auto_31689 ?auto_31687 ) ) ( not ( = ?auto_31686 ?auto_31687 ) ) ( not ( = ?auto_31697 ?auto_31687 ) ) ( not ( = ?auto_31700 ?auto_31687 ) ) ( AVAILABLE ?auto_31696 ) ( not ( = ?auto_31692 ?auto_31693 ) ) ( not ( = ?auto_31699 ?auto_31692 ) ) ( not ( = ?auto_31701 ?auto_31692 ) ) ( not ( = ?auto_31702 ?auto_31692 ) ) ( HOIST-AT ?auto_31695 ?auto_31692 ) ( not ( = ?auto_31696 ?auto_31695 ) ) ( not ( = ?auto_31691 ?auto_31695 ) ) ( not ( = ?auto_31688 ?auto_31695 ) ) ( not ( = ?auto_31698 ?auto_31695 ) ) ( AVAILABLE ?auto_31695 ) ( SURFACE-AT ?auto_31697 ?auto_31692 ) ( ON ?auto_31697 ?auto_31703 ) ( CLEAR ?auto_31697 ) ( not ( = ?auto_31684 ?auto_31703 ) ) ( not ( = ?auto_31685 ?auto_31703 ) ) ( not ( = ?auto_31690 ?auto_31703 ) ) ( not ( = ?auto_31704 ?auto_31703 ) ) ( not ( = ?auto_31694 ?auto_31703 ) ) ( not ( = ?auto_31689 ?auto_31703 ) ) ( not ( = ?auto_31686 ?auto_31703 ) ) ( not ( = ?auto_31697 ?auto_31703 ) ) ( not ( = ?auto_31700 ?auto_31703 ) ) ( not ( = ?auto_31687 ?auto_31703 ) ) ( TRUCK-AT ?auto_31705 ?auto_31693 ) )
    :subtasks
    ( ( !DRIVE ?auto_31705 ?auto_31693 ?auto_31692 )
      ( MAKE-ON ?auto_31684 ?auto_31685 )
      ( MAKE-ON-VERIFY ?auto_31684 ?auto_31685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31706 - SURFACE
      ?auto_31707 - SURFACE
    )
    :vars
    (
      ?auto_31715 - HOIST
      ?auto_31722 - PLACE
      ?auto_31708 - PLACE
      ?auto_31714 - HOIST
      ?auto_31720 - SURFACE
      ?auto_31725 - SURFACE
      ?auto_31711 - SURFACE
      ?auto_31713 - SURFACE
      ?auto_31712 - PLACE
      ?auto_31710 - HOIST
      ?auto_31718 - SURFACE
      ?auto_31717 - SURFACE
      ?auto_31723 - PLACE
      ?auto_31709 - HOIST
      ?auto_31719 - SURFACE
      ?auto_31721 - SURFACE
      ?auto_31716 - PLACE
      ?auto_31727 - HOIST
      ?auto_31724 - SURFACE
      ?auto_31726 - TRUCK
      ?auto_31728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31715 ?auto_31722 ) ( IS-CRATE ?auto_31706 ) ( not ( = ?auto_31706 ?auto_31707 ) ) ( not ( = ?auto_31708 ?auto_31722 ) ) ( HOIST-AT ?auto_31714 ?auto_31708 ) ( not ( = ?auto_31715 ?auto_31714 ) ) ( SURFACE-AT ?auto_31706 ?auto_31708 ) ( ON ?auto_31706 ?auto_31720 ) ( CLEAR ?auto_31706 ) ( not ( = ?auto_31706 ?auto_31720 ) ) ( not ( = ?auto_31707 ?auto_31720 ) ) ( IS-CRATE ?auto_31707 ) ( not ( = ?auto_31706 ?auto_31725 ) ) ( not ( = ?auto_31707 ?auto_31725 ) ) ( not ( = ?auto_31720 ?auto_31725 ) ) ( AVAILABLE ?auto_31714 ) ( SURFACE-AT ?auto_31707 ?auto_31708 ) ( ON ?auto_31707 ?auto_31711 ) ( CLEAR ?auto_31707 ) ( not ( = ?auto_31706 ?auto_31711 ) ) ( not ( = ?auto_31707 ?auto_31711 ) ) ( not ( = ?auto_31720 ?auto_31711 ) ) ( not ( = ?auto_31725 ?auto_31711 ) ) ( IS-CRATE ?auto_31725 ) ( not ( = ?auto_31706 ?auto_31713 ) ) ( not ( = ?auto_31707 ?auto_31713 ) ) ( not ( = ?auto_31720 ?auto_31713 ) ) ( not ( = ?auto_31725 ?auto_31713 ) ) ( not ( = ?auto_31711 ?auto_31713 ) ) ( not ( = ?auto_31712 ?auto_31722 ) ) ( not ( = ?auto_31708 ?auto_31712 ) ) ( HOIST-AT ?auto_31710 ?auto_31712 ) ( not ( = ?auto_31715 ?auto_31710 ) ) ( not ( = ?auto_31714 ?auto_31710 ) ) ( AVAILABLE ?auto_31710 ) ( SURFACE-AT ?auto_31725 ?auto_31712 ) ( ON ?auto_31725 ?auto_31718 ) ( CLEAR ?auto_31725 ) ( not ( = ?auto_31706 ?auto_31718 ) ) ( not ( = ?auto_31707 ?auto_31718 ) ) ( not ( = ?auto_31720 ?auto_31718 ) ) ( not ( = ?auto_31725 ?auto_31718 ) ) ( not ( = ?auto_31711 ?auto_31718 ) ) ( not ( = ?auto_31713 ?auto_31718 ) ) ( IS-CRATE ?auto_31713 ) ( not ( = ?auto_31706 ?auto_31717 ) ) ( not ( = ?auto_31707 ?auto_31717 ) ) ( not ( = ?auto_31720 ?auto_31717 ) ) ( not ( = ?auto_31725 ?auto_31717 ) ) ( not ( = ?auto_31711 ?auto_31717 ) ) ( not ( = ?auto_31713 ?auto_31717 ) ) ( not ( = ?auto_31718 ?auto_31717 ) ) ( not ( = ?auto_31723 ?auto_31722 ) ) ( not ( = ?auto_31708 ?auto_31723 ) ) ( not ( = ?auto_31712 ?auto_31723 ) ) ( HOIST-AT ?auto_31709 ?auto_31723 ) ( not ( = ?auto_31715 ?auto_31709 ) ) ( not ( = ?auto_31714 ?auto_31709 ) ) ( not ( = ?auto_31710 ?auto_31709 ) ) ( AVAILABLE ?auto_31709 ) ( SURFACE-AT ?auto_31713 ?auto_31723 ) ( ON ?auto_31713 ?auto_31719 ) ( CLEAR ?auto_31713 ) ( not ( = ?auto_31706 ?auto_31719 ) ) ( not ( = ?auto_31707 ?auto_31719 ) ) ( not ( = ?auto_31720 ?auto_31719 ) ) ( not ( = ?auto_31725 ?auto_31719 ) ) ( not ( = ?auto_31711 ?auto_31719 ) ) ( not ( = ?auto_31713 ?auto_31719 ) ) ( not ( = ?auto_31718 ?auto_31719 ) ) ( not ( = ?auto_31717 ?auto_31719 ) ) ( IS-CRATE ?auto_31717 ) ( not ( = ?auto_31706 ?auto_31721 ) ) ( not ( = ?auto_31707 ?auto_31721 ) ) ( not ( = ?auto_31720 ?auto_31721 ) ) ( not ( = ?auto_31725 ?auto_31721 ) ) ( not ( = ?auto_31711 ?auto_31721 ) ) ( not ( = ?auto_31713 ?auto_31721 ) ) ( not ( = ?auto_31718 ?auto_31721 ) ) ( not ( = ?auto_31717 ?auto_31721 ) ) ( not ( = ?auto_31719 ?auto_31721 ) ) ( not ( = ?auto_31716 ?auto_31722 ) ) ( not ( = ?auto_31708 ?auto_31716 ) ) ( not ( = ?auto_31712 ?auto_31716 ) ) ( not ( = ?auto_31723 ?auto_31716 ) ) ( HOIST-AT ?auto_31727 ?auto_31716 ) ( not ( = ?auto_31715 ?auto_31727 ) ) ( not ( = ?auto_31714 ?auto_31727 ) ) ( not ( = ?auto_31710 ?auto_31727 ) ) ( not ( = ?auto_31709 ?auto_31727 ) ) ( AVAILABLE ?auto_31727 ) ( SURFACE-AT ?auto_31717 ?auto_31716 ) ( ON ?auto_31717 ?auto_31724 ) ( CLEAR ?auto_31717 ) ( not ( = ?auto_31706 ?auto_31724 ) ) ( not ( = ?auto_31707 ?auto_31724 ) ) ( not ( = ?auto_31720 ?auto_31724 ) ) ( not ( = ?auto_31725 ?auto_31724 ) ) ( not ( = ?auto_31711 ?auto_31724 ) ) ( not ( = ?auto_31713 ?auto_31724 ) ) ( not ( = ?auto_31718 ?auto_31724 ) ) ( not ( = ?auto_31717 ?auto_31724 ) ) ( not ( = ?auto_31719 ?auto_31724 ) ) ( not ( = ?auto_31721 ?auto_31724 ) ) ( TRUCK-AT ?auto_31726 ?auto_31722 ) ( SURFACE-AT ?auto_31728 ?auto_31722 ) ( CLEAR ?auto_31728 ) ( LIFTING ?auto_31715 ?auto_31721 ) ( IS-CRATE ?auto_31721 ) ( not ( = ?auto_31706 ?auto_31728 ) ) ( not ( = ?auto_31707 ?auto_31728 ) ) ( not ( = ?auto_31720 ?auto_31728 ) ) ( not ( = ?auto_31725 ?auto_31728 ) ) ( not ( = ?auto_31711 ?auto_31728 ) ) ( not ( = ?auto_31713 ?auto_31728 ) ) ( not ( = ?auto_31718 ?auto_31728 ) ) ( not ( = ?auto_31717 ?auto_31728 ) ) ( not ( = ?auto_31719 ?auto_31728 ) ) ( not ( = ?auto_31721 ?auto_31728 ) ) ( not ( = ?auto_31724 ?auto_31728 ) ) )
    :subtasks
    ( ( !DROP ?auto_31715 ?auto_31721 ?auto_31728 ?auto_31722 )
      ( MAKE-ON ?auto_31706 ?auto_31707 )
      ( MAKE-ON-VERIFY ?auto_31706 ?auto_31707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31729 - SURFACE
      ?auto_31730 - SURFACE
    )
    :vars
    (
      ?auto_31736 - HOIST
      ?auto_31747 - PLACE
      ?auto_31751 - PLACE
      ?auto_31748 - HOIST
      ?auto_31738 - SURFACE
      ?auto_31734 - SURFACE
      ?auto_31749 - SURFACE
      ?auto_31737 - SURFACE
      ?auto_31744 - PLACE
      ?auto_31740 - HOIST
      ?auto_31731 - SURFACE
      ?auto_31735 - SURFACE
      ?auto_31750 - PLACE
      ?auto_31743 - HOIST
      ?auto_31742 - SURFACE
      ?auto_31745 - SURFACE
      ?auto_31741 - PLACE
      ?auto_31739 - HOIST
      ?auto_31732 - SURFACE
      ?auto_31733 - TRUCK
      ?auto_31746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31736 ?auto_31747 ) ( IS-CRATE ?auto_31729 ) ( not ( = ?auto_31729 ?auto_31730 ) ) ( not ( = ?auto_31751 ?auto_31747 ) ) ( HOIST-AT ?auto_31748 ?auto_31751 ) ( not ( = ?auto_31736 ?auto_31748 ) ) ( SURFACE-AT ?auto_31729 ?auto_31751 ) ( ON ?auto_31729 ?auto_31738 ) ( CLEAR ?auto_31729 ) ( not ( = ?auto_31729 ?auto_31738 ) ) ( not ( = ?auto_31730 ?auto_31738 ) ) ( IS-CRATE ?auto_31730 ) ( not ( = ?auto_31729 ?auto_31734 ) ) ( not ( = ?auto_31730 ?auto_31734 ) ) ( not ( = ?auto_31738 ?auto_31734 ) ) ( AVAILABLE ?auto_31748 ) ( SURFACE-AT ?auto_31730 ?auto_31751 ) ( ON ?auto_31730 ?auto_31749 ) ( CLEAR ?auto_31730 ) ( not ( = ?auto_31729 ?auto_31749 ) ) ( not ( = ?auto_31730 ?auto_31749 ) ) ( not ( = ?auto_31738 ?auto_31749 ) ) ( not ( = ?auto_31734 ?auto_31749 ) ) ( IS-CRATE ?auto_31734 ) ( not ( = ?auto_31729 ?auto_31737 ) ) ( not ( = ?auto_31730 ?auto_31737 ) ) ( not ( = ?auto_31738 ?auto_31737 ) ) ( not ( = ?auto_31734 ?auto_31737 ) ) ( not ( = ?auto_31749 ?auto_31737 ) ) ( not ( = ?auto_31744 ?auto_31747 ) ) ( not ( = ?auto_31751 ?auto_31744 ) ) ( HOIST-AT ?auto_31740 ?auto_31744 ) ( not ( = ?auto_31736 ?auto_31740 ) ) ( not ( = ?auto_31748 ?auto_31740 ) ) ( AVAILABLE ?auto_31740 ) ( SURFACE-AT ?auto_31734 ?auto_31744 ) ( ON ?auto_31734 ?auto_31731 ) ( CLEAR ?auto_31734 ) ( not ( = ?auto_31729 ?auto_31731 ) ) ( not ( = ?auto_31730 ?auto_31731 ) ) ( not ( = ?auto_31738 ?auto_31731 ) ) ( not ( = ?auto_31734 ?auto_31731 ) ) ( not ( = ?auto_31749 ?auto_31731 ) ) ( not ( = ?auto_31737 ?auto_31731 ) ) ( IS-CRATE ?auto_31737 ) ( not ( = ?auto_31729 ?auto_31735 ) ) ( not ( = ?auto_31730 ?auto_31735 ) ) ( not ( = ?auto_31738 ?auto_31735 ) ) ( not ( = ?auto_31734 ?auto_31735 ) ) ( not ( = ?auto_31749 ?auto_31735 ) ) ( not ( = ?auto_31737 ?auto_31735 ) ) ( not ( = ?auto_31731 ?auto_31735 ) ) ( not ( = ?auto_31750 ?auto_31747 ) ) ( not ( = ?auto_31751 ?auto_31750 ) ) ( not ( = ?auto_31744 ?auto_31750 ) ) ( HOIST-AT ?auto_31743 ?auto_31750 ) ( not ( = ?auto_31736 ?auto_31743 ) ) ( not ( = ?auto_31748 ?auto_31743 ) ) ( not ( = ?auto_31740 ?auto_31743 ) ) ( AVAILABLE ?auto_31743 ) ( SURFACE-AT ?auto_31737 ?auto_31750 ) ( ON ?auto_31737 ?auto_31742 ) ( CLEAR ?auto_31737 ) ( not ( = ?auto_31729 ?auto_31742 ) ) ( not ( = ?auto_31730 ?auto_31742 ) ) ( not ( = ?auto_31738 ?auto_31742 ) ) ( not ( = ?auto_31734 ?auto_31742 ) ) ( not ( = ?auto_31749 ?auto_31742 ) ) ( not ( = ?auto_31737 ?auto_31742 ) ) ( not ( = ?auto_31731 ?auto_31742 ) ) ( not ( = ?auto_31735 ?auto_31742 ) ) ( IS-CRATE ?auto_31735 ) ( not ( = ?auto_31729 ?auto_31745 ) ) ( not ( = ?auto_31730 ?auto_31745 ) ) ( not ( = ?auto_31738 ?auto_31745 ) ) ( not ( = ?auto_31734 ?auto_31745 ) ) ( not ( = ?auto_31749 ?auto_31745 ) ) ( not ( = ?auto_31737 ?auto_31745 ) ) ( not ( = ?auto_31731 ?auto_31745 ) ) ( not ( = ?auto_31735 ?auto_31745 ) ) ( not ( = ?auto_31742 ?auto_31745 ) ) ( not ( = ?auto_31741 ?auto_31747 ) ) ( not ( = ?auto_31751 ?auto_31741 ) ) ( not ( = ?auto_31744 ?auto_31741 ) ) ( not ( = ?auto_31750 ?auto_31741 ) ) ( HOIST-AT ?auto_31739 ?auto_31741 ) ( not ( = ?auto_31736 ?auto_31739 ) ) ( not ( = ?auto_31748 ?auto_31739 ) ) ( not ( = ?auto_31740 ?auto_31739 ) ) ( not ( = ?auto_31743 ?auto_31739 ) ) ( AVAILABLE ?auto_31739 ) ( SURFACE-AT ?auto_31735 ?auto_31741 ) ( ON ?auto_31735 ?auto_31732 ) ( CLEAR ?auto_31735 ) ( not ( = ?auto_31729 ?auto_31732 ) ) ( not ( = ?auto_31730 ?auto_31732 ) ) ( not ( = ?auto_31738 ?auto_31732 ) ) ( not ( = ?auto_31734 ?auto_31732 ) ) ( not ( = ?auto_31749 ?auto_31732 ) ) ( not ( = ?auto_31737 ?auto_31732 ) ) ( not ( = ?auto_31731 ?auto_31732 ) ) ( not ( = ?auto_31735 ?auto_31732 ) ) ( not ( = ?auto_31742 ?auto_31732 ) ) ( not ( = ?auto_31745 ?auto_31732 ) ) ( TRUCK-AT ?auto_31733 ?auto_31747 ) ( SURFACE-AT ?auto_31746 ?auto_31747 ) ( CLEAR ?auto_31746 ) ( IS-CRATE ?auto_31745 ) ( not ( = ?auto_31729 ?auto_31746 ) ) ( not ( = ?auto_31730 ?auto_31746 ) ) ( not ( = ?auto_31738 ?auto_31746 ) ) ( not ( = ?auto_31734 ?auto_31746 ) ) ( not ( = ?auto_31749 ?auto_31746 ) ) ( not ( = ?auto_31737 ?auto_31746 ) ) ( not ( = ?auto_31731 ?auto_31746 ) ) ( not ( = ?auto_31735 ?auto_31746 ) ) ( not ( = ?auto_31742 ?auto_31746 ) ) ( not ( = ?auto_31745 ?auto_31746 ) ) ( not ( = ?auto_31732 ?auto_31746 ) ) ( AVAILABLE ?auto_31736 ) ( IN ?auto_31745 ?auto_31733 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31736 ?auto_31745 ?auto_31733 ?auto_31747 )
      ( MAKE-ON ?auto_31729 ?auto_31730 )
      ( MAKE-ON-VERIFY ?auto_31729 ?auto_31730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31752 - SURFACE
      ?auto_31753 - SURFACE
    )
    :vars
    (
      ?auto_31754 - HOIST
      ?auto_31761 - PLACE
      ?auto_31764 - PLACE
      ?auto_31771 - HOIST
      ?auto_31773 - SURFACE
      ?auto_31768 - SURFACE
      ?auto_31763 - SURFACE
      ?auto_31766 - SURFACE
      ?auto_31774 - PLACE
      ?auto_31757 - HOIST
      ?auto_31762 - SURFACE
      ?auto_31756 - SURFACE
      ?auto_31765 - PLACE
      ?auto_31770 - HOIST
      ?auto_31772 - SURFACE
      ?auto_31769 - SURFACE
      ?auto_31758 - PLACE
      ?auto_31767 - HOIST
      ?auto_31759 - SURFACE
      ?auto_31760 - SURFACE
      ?auto_31755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31754 ?auto_31761 ) ( IS-CRATE ?auto_31752 ) ( not ( = ?auto_31752 ?auto_31753 ) ) ( not ( = ?auto_31764 ?auto_31761 ) ) ( HOIST-AT ?auto_31771 ?auto_31764 ) ( not ( = ?auto_31754 ?auto_31771 ) ) ( SURFACE-AT ?auto_31752 ?auto_31764 ) ( ON ?auto_31752 ?auto_31773 ) ( CLEAR ?auto_31752 ) ( not ( = ?auto_31752 ?auto_31773 ) ) ( not ( = ?auto_31753 ?auto_31773 ) ) ( IS-CRATE ?auto_31753 ) ( not ( = ?auto_31752 ?auto_31768 ) ) ( not ( = ?auto_31753 ?auto_31768 ) ) ( not ( = ?auto_31773 ?auto_31768 ) ) ( AVAILABLE ?auto_31771 ) ( SURFACE-AT ?auto_31753 ?auto_31764 ) ( ON ?auto_31753 ?auto_31763 ) ( CLEAR ?auto_31753 ) ( not ( = ?auto_31752 ?auto_31763 ) ) ( not ( = ?auto_31753 ?auto_31763 ) ) ( not ( = ?auto_31773 ?auto_31763 ) ) ( not ( = ?auto_31768 ?auto_31763 ) ) ( IS-CRATE ?auto_31768 ) ( not ( = ?auto_31752 ?auto_31766 ) ) ( not ( = ?auto_31753 ?auto_31766 ) ) ( not ( = ?auto_31773 ?auto_31766 ) ) ( not ( = ?auto_31768 ?auto_31766 ) ) ( not ( = ?auto_31763 ?auto_31766 ) ) ( not ( = ?auto_31774 ?auto_31761 ) ) ( not ( = ?auto_31764 ?auto_31774 ) ) ( HOIST-AT ?auto_31757 ?auto_31774 ) ( not ( = ?auto_31754 ?auto_31757 ) ) ( not ( = ?auto_31771 ?auto_31757 ) ) ( AVAILABLE ?auto_31757 ) ( SURFACE-AT ?auto_31768 ?auto_31774 ) ( ON ?auto_31768 ?auto_31762 ) ( CLEAR ?auto_31768 ) ( not ( = ?auto_31752 ?auto_31762 ) ) ( not ( = ?auto_31753 ?auto_31762 ) ) ( not ( = ?auto_31773 ?auto_31762 ) ) ( not ( = ?auto_31768 ?auto_31762 ) ) ( not ( = ?auto_31763 ?auto_31762 ) ) ( not ( = ?auto_31766 ?auto_31762 ) ) ( IS-CRATE ?auto_31766 ) ( not ( = ?auto_31752 ?auto_31756 ) ) ( not ( = ?auto_31753 ?auto_31756 ) ) ( not ( = ?auto_31773 ?auto_31756 ) ) ( not ( = ?auto_31768 ?auto_31756 ) ) ( not ( = ?auto_31763 ?auto_31756 ) ) ( not ( = ?auto_31766 ?auto_31756 ) ) ( not ( = ?auto_31762 ?auto_31756 ) ) ( not ( = ?auto_31765 ?auto_31761 ) ) ( not ( = ?auto_31764 ?auto_31765 ) ) ( not ( = ?auto_31774 ?auto_31765 ) ) ( HOIST-AT ?auto_31770 ?auto_31765 ) ( not ( = ?auto_31754 ?auto_31770 ) ) ( not ( = ?auto_31771 ?auto_31770 ) ) ( not ( = ?auto_31757 ?auto_31770 ) ) ( AVAILABLE ?auto_31770 ) ( SURFACE-AT ?auto_31766 ?auto_31765 ) ( ON ?auto_31766 ?auto_31772 ) ( CLEAR ?auto_31766 ) ( not ( = ?auto_31752 ?auto_31772 ) ) ( not ( = ?auto_31753 ?auto_31772 ) ) ( not ( = ?auto_31773 ?auto_31772 ) ) ( not ( = ?auto_31768 ?auto_31772 ) ) ( not ( = ?auto_31763 ?auto_31772 ) ) ( not ( = ?auto_31766 ?auto_31772 ) ) ( not ( = ?auto_31762 ?auto_31772 ) ) ( not ( = ?auto_31756 ?auto_31772 ) ) ( IS-CRATE ?auto_31756 ) ( not ( = ?auto_31752 ?auto_31769 ) ) ( not ( = ?auto_31753 ?auto_31769 ) ) ( not ( = ?auto_31773 ?auto_31769 ) ) ( not ( = ?auto_31768 ?auto_31769 ) ) ( not ( = ?auto_31763 ?auto_31769 ) ) ( not ( = ?auto_31766 ?auto_31769 ) ) ( not ( = ?auto_31762 ?auto_31769 ) ) ( not ( = ?auto_31756 ?auto_31769 ) ) ( not ( = ?auto_31772 ?auto_31769 ) ) ( not ( = ?auto_31758 ?auto_31761 ) ) ( not ( = ?auto_31764 ?auto_31758 ) ) ( not ( = ?auto_31774 ?auto_31758 ) ) ( not ( = ?auto_31765 ?auto_31758 ) ) ( HOIST-AT ?auto_31767 ?auto_31758 ) ( not ( = ?auto_31754 ?auto_31767 ) ) ( not ( = ?auto_31771 ?auto_31767 ) ) ( not ( = ?auto_31757 ?auto_31767 ) ) ( not ( = ?auto_31770 ?auto_31767 ) ) ( AVAILABLE ?auto_31767 ) ( SURFACE-AT ?auto_31756 ?auto_31758 ) ( ON ?auto_31756 ?auto_31759 ) ( CLEAR ?auto_31756 ) ( not ( = ?auto_31752 ?auto_31759 ) ) ( not ( = ?auto_31753 ?auto_31759 ) ) ( not ( = ?auto_31773 ?auto_31759 ) ) ( not ( = ?auto_31768 ?auto_31759 ) ) ( not ( = ?auto_31763 ?auto_31759 ) ) ( not ( = ?auto_31766 ?auto_31759 ) ) ( not ( = ?auto_31762 ?auto_31759 ) ) ( not ( = ?auto_31756 ?auto_31759 ) ) ( not ( = ?auto_31772 ?auto_31759 ) ) ( not ( = ?auto_31769 ?auto_31759 ) ) ( SURFACE-AT ?auto_31760 ?auto_31761 ) ( CLEAR ?auto_31760 ) ( IS-CRATE ?auto_31769 ) ( not ( = ?auto_31752 ?auto_31760 ) ) ( not ( = ?auto_31753 ?auto_31760 ) ) ( not ( = ?auto_31773 ?auto_31760 ) ) ( not ( = ?auto_31768 ?auto_31760 ) ) ( not ( = ?auto_31763 ?auto_31760 ) ) ( not ( = ?auto_31766 ?auto_31760 ) ) ( not ( = ?auto_31762 ?auto_31760 ) ) ( not ( = ?auto_31756 ?auto_31760 ) ) ( not ( = ?auto_31772 ?auto_31760 ) ) ( not ( = ?auto_31769 ?auto_31760 ) ) ( not ( = ?auto_31759 ?auto_31760 ) ) ( AVAILABLE ?auto_31754 ) ( IN ?auto_31769 ?auto_31755 ) ( TRUCK-AT ?auto_31755 ?auto_31765 ) )
    :subtasks
    ( ( !DRIVE ?auto_31755 ?auto_31765 ?auto_31761 )
      ( MAKE-ON ?auto_31752 ?auto_31753 )
      ( MAKE-ON-VERIFY ?auto_31752 ?auto_31753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31775 - SURFACE
      ?auto_31776 - SURFACE
    )
    :vars
    (
      ?auto_31795 - HOIST
      ?auto_31783 - PLACE
      ?auto_31788 - PLACE
      ?auto_31780 - HOIST
      ?auto_31796 - SURFACE
      ?auto_31779 - SURFACE
      ?auto_31789 - SURFACE
      ?auto_31792 - SURFACE
      ?auto_31797 - PLACE
      ?auto_31781 - HOIST
      ?auto_31794 - SURFACE
      ?auto_31793 - SURFACE
      ?auto_31791 - PLACE
      ?auto_31778 - HOIST
      ?auto_31777 - SURFACE
      ?auto_31790 - SURFACE
      ?auto_31787 - PLACE
      ?auto_31786 - HOIST
      ?auto_31782 - SURFACE
      ?auto_31785 - SURFACE
      ?auto_31784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31795 ?auto_31783 ) ( IS-CRATE ?auto_31775 ) ( not ( = ?auto_31775 ?auto_31776 ) ) ( not ( = ?auto_31788 ?auto_31783 ) ) ( HOIST-AT ?auto_31780 ?auto_31788 ) ( not ( = ?auto_31795 ?auto_31780 ) ) ( SURFACE-AT ?auto_31775 ?auto_31788 ) ( ON ?auto_31775 ?auto_31796 ) ( CLEAR ?auto_31775 ) ( not ( = ?auto_31775 ?auto_31796 ) ) ( not ( = ?auto_31776 ?auto_31796 ) ) ( IS-CRATE ?auto_31776 ) ( not ( = ?auto_31775 ?auto_31779 ) ) ( not ( = ?auto_31776 ?auto_31779 ) ) ( not ( = ?auto_31796 ?auto_31779 ) ) ( AVAILABLE ?auto_31780 ) ( SURFACE-AT ?auto_31776 ?auto_31788 ) ( ON ?auto_31776 ?auto_31789 ) ( CLEAR ?auto_31776 ) ( not ( = ?auto_31775 ?auto_31789 ) ) ( not ( = ?auto_31776 ?auto_31789 ) ) ( not ( = ?auto_31796 ?auto_31789 ) ) ( not ( = ?auto_31779 ?auto_31789 ) ) ( IS-CRATE ?auto_31779 ) ( not ( = ?auto_31775 ?auto_31792 ) ) ( not ( = ?auto_31776 ?auto_31792 ) ) ( not ( = ?auto_31796 ?auto_31792 ) ) ( not ( = ?auto_31779 ?auto_31792 ) ) ( not ( = ?auto_31789 ?auto_31792 ) ) ( not ( = ?auto_31797 ?auto_31783 ) ) ( not ( = ?auto_31788 ?auto_31797 ) ) ( HOIST-AT ?auto_31781 ?auto_31797 ) ( not ( = ?auto_31795 ?auto_31781 ) ) ( not ( = ?auto_31780 ?auto_31781 ) ) ( AVAILABLE ?auto_31781 ) ( SURFACE-AT ?auto_31779 ?auto_31797 ) ( ON ?auto_31779 ?auto_31794 ) ( CLEAR ?auto_31779 ) ( not ( = ?auto_31775 ?auto_31794 ) ) ( not ( = ?auto_31776 ?auto_31794 ) ) ( not ( = ?auto_31796 ?auto_31794 ) ) ( not ( = ?auto_31779 ?auto_31794 ) ) ( not ( = ?auto_31789 ?auto_31794 ) ) ( not ( = ?auto_31792 ?auto_31794 ) ) ( IS-CRATE ?auto_31792 ) ( not ( = ?auto_31775 ?auto_31793 ) ) ( not ( = ?auto_31776 ?auto_31793 ) ) ( not ( = ?auto_31796 ?auto_31793 ) ) ( not ( = ?auto_31779 ?auto_31793 ) ) ( not ( = ?auto_31789 ?auto_31793 ) ) ( not ( = ?auto_31792 ?auto_31793 ) ) ( not ( = ?auto_31794 ?auto_31793 ) ) ( not ( = ?auto_31791 ?auto_31783 ) ) ( not ( = ?auto_31788 ?auto_31791 ) ) ( not ( = ?auto_31797 ?auto_31791 ) ) ( HOIST-AT ?auto_31778 ?auto_31791 ) ( not ( = ?auto_31795 ?auto_31778 ) ) ( not ( = ?auto_31780 ?auto_31778 ) ) ( not ( = ?auto_31781 ?auto_31778 ) ) ( SURFACE-AT ?auto_31792 ?auto_31791 ) ( ON ?auto_31792 ?auto_31777 ) ( CLEAR ?auto_31792 ) ( not ( = ?auto_31775 ?auto_31777 ) ) ( not ( = ?auto_31776 ?auto_31777 ) ) ( not ( = ?auto_31796 ?auto_31777 ) ) ( not ( = ?auto_31779 ?auto_31777 ) ) ( not ( = ?auto_31789 ?auto_31777 ) ) ( not ( = ?auto_31792 ?auto_31777 ) ) ( not ( = ?auto_31794 ?auto_31777 ) ) ( not ( = ?auto_31793 ?auto_31777 ) ) ( IS-CRATE ?auto_31793 ) ( not ( = ?auto_31775 ?auto_31790 ) ) ( not ( = ?auto_31776 ?auto_31790 ) ) ( not ( = ?auto_31796 ?auto_31790 ) ) ( not ( = ?auto_31779 ?auto_31790 ) ) ( not ( = ?auto_31789 ?auto_31790 ) ) ( not ( = ?auto_31792 ?auto_31790 ) ) ( not ( = ?auto_31794 ?auto_31790 ) ) ( not ( = ?auto_31793 ?auto_31790 ) ) ( not ( = ?auto_31777 ?auto_31790 ) ) ( not ( = ?auto_31787 ?auto_31783 ) ) ( not ( = ?auto_31788 ?auto_31787 ) ) ( not ( = ?auto_31797 ?auto_31787 ) ) ( not ( = ?auto_31791 ?auto_31787 ) ) ( HOIST-AT ?auto_31786 ?auto_31787 ) ( not ( = ?auto_31795 ?auto_31786 ) ) ( not ( = ?auto_31780 ?auto_31786 ) ) ( not ( = ?auto_31781 ?auto_31786 ) ) ( not ( = ?auto_31778 ?auto_31786 ) ) ( AVAILABLE ?auto_31786 ) ( SURFACE-AT ?auto_31793 ?auto_31787 ) ( ON ?auto_31793 ?auto_31782 ) ( CLEAR ?auto_31793 ) ( not ( = ?auto_31775 ?auto_31782 ) ) ( not ( = ?auto_31776 ?auto_31782 ) ) ( not ( = ?auto_31796 ?auto_31782 ) ) ( not ( = ?auto_31779 ?auto_31782 ) ) ( not ( = ?auto_31789 ?auto_31782 ) ) ( not ( = ?auto_31792 ?auto_31782 ) ) ( not ( = ?auto_31794 ?auto_31782 ) ) ( not ( = ?auto_31793 ?auto_31782 ) ) ( not ( = ?auto_31777 ?auto_31782 ) ) ( not ( = ?auto_31790 ?auto_31782 ) ) ( SURFACE-AT ?auto_31785 ?auto_31783 ) ( CLEAR ?auto_31785 ) ( IS-CRATE ?auto_31790 ) ( not ( = ?auto_31775 ?auto_31785 ) ) ( not ( = ?auto_31776 ?auto_31785 ) ) ( not ( = ?auto_31796 ?auto_31785 ) ) ( not ( = ?auto_31779 ?auto_31785 ) ) ( not ( = ?auto_31789 ?auto_31785 ) ) ( not ( = ?auto_31792 ?auto_31785 ) ) ( not ( = ?auto_31794 ?auto_31785 ) ) ( not ( = ?auto_31793 ?auto_31785 ) ) ( not ( = ?auto_31777 ?auto_31785 ) ) ( not ( = ?auto_31790 ?auto_31785 ) ) ( not ( = ?auto_31782 ?auto_31785 ) ) ( AVAILABLE ?auto_31795 ) ( TRUCK-AT ?auto_31784 ?auto_31791 ) ( LIFTING ?auto_31778 ?auto_31790 ) )
    :subtasks
    ( ( !LOAD ?auto_31778 ?auto_31790 ?auto_31784 ?auto_31791 )
      ( MAKE-ON ?auto_31775 ?auto_31776 )
      ( MAKE-ON-VERIFY ?auto_31775 ?auto_31776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31798 - SURFACE
      ?auto_31799 - SURFACE
    )
    :vars
    (
      ?auto_31805 - HOIST
      ?auto_31810 - PLACE
      ?auto_31819 - PLACE
      ?auto_31816 - HOIST
      ?auto_31800 - SURFACE
      ?auto_31814 - SURFACE
      ?auto_31818 - SURFACE
      ?auto_31807 - SURFACE
      ?auto_31806 - PLACE
      ?auto_31817 - HOIST
      ?auto_31804 - SURFACE
      ?auto_31809 - SURFACE
      ?auto_31813 - PLACE
      ?auto_31815 - HOIST
      ?auto_31812 - SURFACE
      ?auto_31808 - SURFACE
      ?auto_31820 - PLACE
      ?auto_31811 - HOIST
      ?auto_31802 - SURFACE
      ?auto_31803 - SURFACE
      ?auto_31801 - TRUCK
      ?auto_31821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31805 ?auto_31810 ) ( IS-CRATE ?auto_31798 ) ( not ( = ?auto_31798 ?auto_31799 ) ) ( not ( = ?auto_31819 ?auto_31810 ) ) ( HOIST-AT ?auto_31816 ?auto_31819 ) ( not ( = ?auto_31805 ?auto_31816 ) ) ( SURFACE-AT ?auto_31798 ?auto_31819 ) ( ON ?auto_31798 ?auto_31800 ) ( CLEAR ?auto_31798 ) ( not ( = ?auto_31798 ?auto_31800 ) ) ( not ( = ?auto_31799 ?auto_31800 ) ) ( IS-CRATE ?auto_31799 ) ( not ( = ?auto_31798 ?auto_31814 ) ) ( not ( = ?auto_31799 ?auto_31814 ) ) ( not ( = ?auto_31800 ?auto_31814 ) ) ( AVAILABLE ?auto_31816 ) ( SURFACE-AT ?auto_31799 ?auto_31819 ) ( ON ?auto_31799 ?auto_31818 ) ( CLEAR ?auto_31799 ) ( not ( = ?auto_31798 ?auto_31818 ) ) ( not ( = ?auto_31799 ?auto_31818 ) ) ( not ( = ?auto_31800 ?auto_31818 ) ) ( not ( = ?auto_31814 ?auto_31818 ) ) ( IS-CRATE ?auto_31814 ) ( not ( = ?auto_31798 ?auto_31807 ) ) ( not ( = ?auto_31799 ?auto_31807 ) ) ( not ( = ?auto_31800 ?auto_31807 ) ) ( not ( = ?auto_31814 ?auto_31807 ) ) ( not ( = ?auto_31818 ?auto_31807 ) ) ( not ( = ?auto_31806 ?auto_31810 ) ) ( not ( = ?auto_31819 ?auto_31806 ) ) ( HOIST-AT ?auto_31817 ?auto_31806 ) ( not ( = ?auto_31805 ?auto_31817 ) ) ( not ( = ?auto_31816 ?auto_31817 ) ) ( AVAILABLE ?auto_31817 ) ( SURFACE-AT ?auto_31814 ?auto_31806 ) ( ON ?auto_31814 ?auto_31804 ) ( CLEAR ?auto_31814 ) ( not ( = ?auto_31798 ?auto_31804 ) ) ( not ( = ?auto_31799 ?auto_31804 ) ) ( not ( = ?auto_31800 ?auto_31804 ) ) ( not ( = ?auto_31814 ?auto_31804 ) ) ( not ( = ?auto_31818 ?auto_31804 ) ) ( not ( = ?auto_31807 ?auto_31804 ) ) ( IS-CRATE ?auto_31807 ) ( not ( = ?auto_31798 ?auto_31809 ) ) ( not ( = ?auto_31799 ?auto_31809 ) ) ( not ( = ?auto_31800 ?auto_31809 ) ) ( not ( = ?auto_31814 ?auto_31809 ) ) ( not ( = ?auto_31818 ?auto_31809 ) ) ( not ( = ?auto_31807 ?auto_31809 ) ) ( not ( = ?auto_31804 ?auto_31809 ) ) ( not ( = ?auto_31813 ?auto_31810 ) ) ( not ( = ?auto_31819 ?auto_31813 ) ) ( not ( = ?auto_31806 ?auto_31813 ) ) ( HOIST-AT ?auto_31815 ?auto_31813 ) ( not ( = ?auto_31805 ?auto_31815 ) ) ( not ( = ?auto_31816 ?auto_31815 ) ) ( not ( = ?auto_31817 ?auto_31815 ) ) ( SURFACE-AT ?auto_31807 ?auto_31813 ) ( ON ?auto_31807 ?auto_31812 ) ( CLEAR ?auto_31807 ) ( not ( = ?auto_31798 ?auto_31812 ) ) ( not ( = ?auto_31799 ?auto_31812 ) ) ( not ( = ?auto_31800 ?auto_31812 ) ) ( not ( = ?auto_31814 ?auto_31812 ) ) ( not ( = ?auto_31818 ?auto_31812 ) ) ( not ( = ?auto_31807 ?auto_31812 ) ) ( not ( = ?auto_31804 ?auto_31812 ) ) ( not ( = ?auto_31809 ?auto_31812 ) ) ( IS-CRATE ?auto_31809 ) ( not ( = ?auto_31798 ?auto_31808 ) ) ( not ( = ?auto_31799 ?auto_31808 ) ) ( not ( = ?auto_31800 ?auto_31808 ) ) ( not ( = ?auto_31814 ?auto_31808 ) ) ( not ( = ?auto_31818 ?auto_31808 ) ) ( not ( = ?auto_31807 ?auto_31808 ) ) ( not ( = ?auto_31804 ?auto_31808 ) ) ( not ( = ?auto_31809 ?auto_31808 ) ) ( not ( = ?auto_31812 ?auto_31808 ) ) ( not ( = ?auto_31820 ?auto_31810 ) ) ( not ( = ?auto_31819 ?auto_31820 ) ) ( not ( = ?auto_31806 ?auto_31820 ) ) ( not ( = ?auto_31813 ?auto_31820 ) ) ( HOIST-AT ?auto_31811 ?auto_31820 ) ( not ( = ?auto_31805 ?auto_31811 ) ) ( not ( = ?auto_31816 ?auto_31811 ) ) ( not ( = ?auto_31817 ?auto_31811 ) ) ( not ( = ?auto_31815 ?auto_31811 ) ) ( AVAILABLE ?auto_31811 ) ( SURFACE-AT ?auto_31809 ?auto_31820 ) ( ON ?auto_31809 ?auto_31802 ) ( CLEAR ?auto_31809 ) ( not ( = ?auto_31798 ?auto_31802 ) ) ( not ( = ?auto_31799 ?auto_31802 ) ) ( not ( = ?auto_31800 ?auto_31802 ) ) ( not ( = ?auto_31814 ?auto_31802 ) ) ( not ( = ?auto_31818 ?auto_31802 ) ) ( not ( = ?auto_31807 ?auto_31802 ) ) ( not ( = ?auto_31804 ?auto_31802 ) ) ( not ( = ?auto_31809 ?auto_31802 ) ) ( not ( = ?auto_31812 ?auto_31802 ) ) ( not ( = ?auto_31808 ?auto_31802 ) ) ( SURFACE-AT ?auto_31803 ?auto_31810 ) ( CLEAR ?auto_31803 ) ( IS-CRATE ?auto_31808 ) ( not ( = ?auto_31798 ?auto_31803 ) ) ( not ( = ?auto_31799 ?auto_31803 ) ) ( not ( = ?auto_31800 ?auto_31803 ) ) ( not ( = ?auto_31814 ?auto_31803 ) ) ( not ( = ?auto_31818 ?auto_31803 ) ) ( not ( = ?auto_31807 ?auto_31803 ) ) ( not ( = ?auto_31804 ?auto_31803 ) ) ( not ( = ?auto_31809 ?auto_31803 ) ) ( not ( = ?auto_31812 ?auto_31803 ) ) ( not ( = ?auto_31808 ?auto_31803 ) ) ( not ( = ?auto_31802 ?auto_31803 ) ) ( AVAILABLE ?auto_31805 ) ( TRUCK-AT ?auto_31801 ?auto_31813 ) ( AVAILABLE ?auto_31815 ) ( SURFACE-AT ?auto_31808 ?auto_31813 ) ( ON ?auto_31808 ?auto_31821 ) ( CLEAR ?auto_31808 ) ( not ( = ?auto_31798 ?auto_31821 ) ) ( not ( = ?auto_31799 ?auto_31821 ) ) ( not ( = ?auto_31800 ?auto_31821 ) ) ( not ( = ?auto_31814 ?auto_31821 ) ) ( not ( = ?auto_31818 ?auto_31821 ) ) ( not ( = ?auto_31807 ?auto_31821 ) ) ( not ( = ?auto_31804 ?auto_31821 ) ) ( not ( = ?auto_31809 ?auto_31821 ) ) ( not ( = ?auto_31812 ?auto_31821 ) ) ( not ( = ?auto_31808 ?auto_31821 ) ) ( not ( = ?auto_31802 ?auto_31821 ) ) ( not ( = ?auto_31803 ?auto_31821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31815 ?auto_31808 ?auto_31821 ?auto_31813 )
      ( MAKE-ON ?auto_31798 ?auto_31799 )
      ( MAKE-ON-VERIFY ?auto_31798 ?auto_31799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31822 - SURFACE
      ?auto_31823 - SURFACE
    )
    :vars
    (
      ?auto_31840 - HOIST
      ?auto_31830 - PLACE
      ?auto_31839 - PLACE
      ?auto_31825 - HOIST
      ?auto_31833 - SURFACE
      ?auto_31844 - SURFACE
      ?auto_31838 - SURFACE
      ?auto_31832 - SURFACE
      ?auto_31845 - PLACE
      ?auto_31824 - HOIST
      ?auto_31827 - SURFACE
      ?auto_31834 - SURFACE
      ?auto_31836 - PLACE
      ?auto_31829 - HOIST
      ?auto_31835 - SURFACE
      ?auto_31837 - SURFACE
      ?auto_31828 - PLACE
      ?auto_31831 - HOIST
      ?auto_31841 - SURFACE
      ?auto_31826 - SURFACE
      ?auto_31843 - SURFACE
      ?auto_31842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31840 ?auto_31830 ) ( IS-CRATE ?auto_31822 ) ( not ( = ?auto_31822 ?auto_31823 ) ) ( not ( = ?auto_31839 ?auto_31830 ) ) ( HOIST-AT ?auto_31825 ?auto_31839 ) ( not ( = ?auto_31840 ?auto_31825 ) ) ( SURFACE-AT ?auto_31822 ?auto_31839 ) ( ON ?auto_31822 ?auto_31833 ) ( CLEAR ?auto_31822 ) ( not ( = ?auto_31822 ?auto_31833 ) ) ( not ( = ?auto_31823 ?auto_31833 ) ) ( IS-CRATE ?auto_31823 ) ( not ( = ?auto_31822 ?auto_31844 ) ) ( not ( = ?auto_31823 ?auto_31844 ) ) ( not ( = ?auto_31833 ?auto_31844 ) ) ( AVAILABLE ?auto_31825 ) ( SURFACE-AT ?auto_31823 ?auto_31839 ) ( ON ?auto_31823 ?auto_31838 ) ( CLEAR ?auto_31823 ) ( not ( = ?auto_31822 ?auto_31838 ) ) ( not ( = ?auto_31823 ?auto_31838 ) ) ( not ( = ?auto_31833 ?auto_31838 ) ) ( not ( = ?auto_31844 ?auto_31838 ) ) ( IS-CRATE ?auto_31844 ) ( not ( = ?auto_31822 ?auto_31832 ) ) ( not ( = ?auto_31823 ?auto_31832 ) ) ( not ( = ?auto_31833 ?auto_31832 ) ) ( not ( = ?auto_31844 ?auto_31832 ) ) ( not ( = ?auto_31838 ?auto_31832 ) ) ( not ( = ?auto_31845 ?auto_31830 ) ) ( not ( = ?auto_31839 ?auto_31845 ) ) ( HOIST-AT ?auto_31824 ?auto_31845 ) ( not ( = ?auto_31840 ?auto_31824 ) ) ( not ( = ?auto_31825 ?auto_31824 ) ) ( AVAILABLE ?auto_31824 ) ( SURFACE-AT ?auto_31844 ?auto_31845 ) ( ON ?auto_31844 ?auto_31827 ) ( CLEAR ?auto_31844 ) ( not ( = ?auto_31822 ?auto_31827 ) ) ( not ( = ?auto_31823 ?auto_31827 ) ) ( not ( = ?auto_31833 ?auto_31827 ) ) ( not ( = ?auto_31844 ?auto_31827 ) ) ( not ( = ?auto_31838 ?auto_31827 ) ) ( not ( = ?auto_31832 ?auto_31827 ) ) ( IS-CRATE ?auto_31832 ) ( not ( = ?auto_31822 ?auto_31834 ) ) ( not ( = ?auto_31823 ?auto_31834 ) ) ( not ( = ?auto_31833 ?auto_31834 ) ) ( not ( = ?auto_31844 ?auto_31834 ) ) ( not ( = ?auto_31838 ?auto_31834 ) ) ( not ( = ?auto_31832 ?auto_31834 ) ) ( not ( = ?auto_31827 ?auto_31834 ) ) ( not ( = ?auto_31836 ?auto_31830 ) ) ( not ( = ?auto_31839 ?auto_31836 ) ) ( not ( = ?auto_31845 ?auto_31836 ) ) ( HOIST-AT ?auto_31829 ?auto_31836 ) ( not ( = ?auto_31840 ?auto_31829 ) ) ( not ( = ?auto_31825 ?auto_31829 ) ) ( not ( = ?auto_31824 ?auto_31829 ) ) ( SURFACE-AT ?auto_31832 ?auto_31836 ) ( ON ?auto_31832 ?auto_31835 ) ( CLEAR ?auto_31832 ) ( not ( = ?auto_31822 ?auto_31835 ) ) ( not ( = ?auto_31823 ?auto_31835 ) ) ( not ( = ?auto_31833 ?auto_31835 ) ) ( not ( = ?auto_31844 ?auto_31835 ) ) ( not ( = ?auto_31838 ?auto_31835 ) ) ( not ( = ?auto_31832 ?auto_31835 ) ) ( not ( = ?auto_31827 ?auto_31835 ) ) ( not ( = ?auto_31834 ?auto_31835 ) ) ( IS-CRATE ?auto_31834 ) ( not ( = ?auto_31822 ?auto_31837 ) ) ( not ( = ?auto_31823 ?auto_31837 ) ) ( not ( = ?auto_31833 ?auto_31837 ) ) ( not ( = ?auto_31844 ?auto_31837 ) ) ( not ( = ?auto_31838 ?auto_31837 ) ) ( not ( = ?auto_31832 ?auto_31837 ) ) ( not ( = ?auto_31827 ?auto_31837 ) ) ( not ( = ?auto_31834 ?auto_31837 ) ) ( not ( = ?auto_31835 ?auto_31837 ) ) ( not ( = ?auto_31828 ?auto_31830 ) ) ( not ( = ?auto_31839 ?auto_31828 ) ) ( not ( = ?auto_31845 ?auto_31828 ) ) ( not ( = ?auto_31836 ?auto_31828 ) ) ( HOIST-AT ?auto_31831 ?auto_31828 ) ( not ( = ?auto_31840 ?auto_31831 ) ) ( not ( = ?auto_31825 ?auto_31831 ) ) ( not ( = ?auto_31824 ?auto_31831 ) ) ( not ( = ?auto_31829 ?auto_31831 ) ) ( AVAILABLE ?auto_31831 ) ( SURFACE-AT ?auto_31834 ?auto_31828 ) ( ON ?auto_31834 ?auto_31841 ) ( CLEAR ?auto_31834 ) ( not ( = ?auto_31822 ?auto_31841 ) ) ( not ( = ?auto_31823 ?auto_31841 ) ) ( not ( = ?auto_31833 ?auto_31841 ) ) ( not ( = ?auto_31844 ?auto_31841 ) ) ( not ( = ?auto_31838 ?auto_31841 ) ) ( not ( = ?auto_31832 ?auto_31841 ) ) ( not ( = ?auto_31827 ?auto_31841 ) ) ( not ( = ?auto_31834 ?auto_31841 ) ) ( not ( = ?auto_31835 ?auto_31841 ) ) ( not ( = ?auto_31837 ?auto_31841 ) ) ( SURFACE-AT ?auto_31826 ?auto_31830 ) ( CLEAR ?auto_31826 ) ( IS-CRATE ?auto_31837 ) ( not ( = ?auto_31822 ?auto_31826 ) ) ( not ( = ?auto_31823 ?auto_31826 ) ) ( not ( = ?auto_31833 ?auto_31826 ) ) ( not ( = ?auto_31844 ?auto_31826 ) ) ( not ( = ?auto_31838 ?auto_31826 ) ) ( not ( = ?auto_31832 ?auto_31826 ) ) ( not ( = ?auto_31827 ?auto_31826 ) ) ( not ( = ?auto_31834 ?auto_31826 ) ) ( not ( = ?auto_31835 ?auto_31826 ) ) ( not ( = ?auto_31837 ?auto_31826 ) ) ( not ( = ?auto_31841 ?auto_31826 ) ) ( AVAILABLE ?auto_31840 ) ( AVAILABLE ?auto_31829 ) ( SURFACE-AT ?auto_31837 ?auto_31836 ) ( ON ?auto_31837 ?auto_31843 ) ( CLEAR ?auto_31837 ) ( not ( = ?auto_31822 ?auto_31843 ) ) ( not ( = ?auto_31823 ?auto_31843 ) ) ( not ( = ?auto_31833 ?auto_31843 ) ) ( not ( = ?auto_31844 ?auto_31843 ) ) ( not ( = ?auto_31838 ?auto_31843 ) ) ( not ( = ?auto_31832 ?auto_31843 ) ) ( not ( = ?auto_31827 ?auto_31843 ) ) ( not ( = ?auto_31834 ?auto_31843 ) ) ( not ( = ?auto_31835 ?auto_31843 ) ) ( not ( = ?auto_31837 ?auto_31843 ) ) ( not ( = ?auto_31841 ?auto_31843 ) ) ( not ( = ?auto_31826 ?auto_31843 ) ) ( TRUCK-AT ?auto_31842 ?auto_31830 ) )
    :subtasks
    ( ( !DRIVE ?auto_31842 ?auto_31830 ?auto_31836 )
      ( MAKE-ON ?auto_31822 ?auto_31823 )
      ( MAKE-ON-VERIFY ?auto_31822 ?auto_31823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31846 - SURFACE
      ?auto_31847 - SURFACE
    )
    :vars
    (
      ?auto_31850 - HOIST
      ?auto_31859 - PLACE
      ?auto_31863 - PLACE
      ?auto_31864 - HOIST
      ?auto_31856 - SURFACE
      ?auto_31861 - SURFACE
      ?auto_31865 - SURFACE
      ?auto_31860 - SURFACE
      ?auto_31862 - PLACE
      ?auto_31857 - HOIST
      ?auto_31855 - SURFACE
      ?auto_31852 - SURFACE
      ?auto_31858 - PLACE
      ?auto_31869 - HOIST
      ?auto_31868 - SURFACE
      ?auto_31867 - SURFACE
      ?auto_31853 - PLACE
      ?auto_31854 - HOIST
      ?auto_31848 - SURFACE
      ?auto_31866 - SURFACE
      ?auto_31849 - SURFACE
      ?auto_31851 - TRUCK
      ?auto_31870 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31850 ?auto_31859 ) ( IS-CRATE ?auto_31846 ) ( not ( = ?auto_31846 ?auto_31847 ) ) ( not ( = ?auto_31863 ?auto_31859 ) ) ( HOIST-AT ?auto_31864 ?auto_31863 ) ( not ( = ?auto_31850 ?auto_31864 ) ) ( SURFACE-AT ?auto_31846 ?auto_31863 ) ( ON ?auto_31846 ?auto_31856 ) ( CLEAR ?auto_31846 ) ( not ( = ?auto_31846 ?auto_31856 ) ) ( not ( = ?auto_31847 ?auto_31856 ) ) ( IS-CRATE ?auto_31847 ) ( not ( = ?auto_31846 ?auto_31861 ) ) ( not ( = ?auto_31847 ?auto_31861 ) ) ( not ( = ?auto_31856 ?auto_31861 ) ) ( AVAILABLE ?auto_31864 ) ( SURFACE-AT ?auto_31847 ?auto_31863 ) ( ON ?auto_31847 ?auto_31865 ) ( CLEAR ?auto_31847 ) ( not ( = ?auto_31846 ?auto_31865 ) ) ( not ( = ?auto_31847 ?auto_31865 ) ) ( not ( = ?auto_31856 ?auto_31865 ) ) ( not ( = ?auto_31861 ?auto_31865 ) ) ( IS-CRATE ?auto_31861 ) ( not ( = ?auto_31846 ?auto_31860 ) ) ( not ( = ?auto_31847 ?auto_31860 ) ) ( not ( = ?auto_31856 ?auto_31860 ) ) ( not ( = ?auto_31861 ?auto_31860 ) ) ( not ( = ?auto_31865 ?auto_31860 ) ) ( not ( = ?auto_31862 ?auto_31859 ) ) ( not ( = ?auto_31863 ?auto_31862 ) ) ( HOIST-AT ?auto_31857 ?auto_31862 ) ( not ( = ?auto_31850 ?auto_31857 ) ) ( not ( = ?auto_31864 ?auto_31857 ) ) ( AVAILABLE ?auto_31857 ) ( SURFACE-AT ?auto_31861 ?auto_31862 ) ( ON ?auto_31861 ?auto_31855 ) ( CLEAR ?auto_31861 ) ( not ( = ?auto_31846 ?auto_31855 ) ) ( not ( = ?auto_31847 ?auto_31855 ) ) ( not ( = ?auto_31856 ?auto_31855 ) ) ( not ( = ?auto_31861 ?auto_31855 ) ) ( not ( = ?auto_31865 ?auto_31855 ) ) ( not ( = ?auto_31860 ?auto_31855 ) ) ( IS-CRATE ?auto_31860 ) ( not ( = ?auto_31846 ?auto_31852 ) ) ( not ( = ?auto_31847 ?auto_31852 ) ) ( not ( = ?auto_31856 ?auto_31852 ) ) ( not ( = ?auto_31861 ?auto_31852 ) ) ( not ( = ?auto_31865 ?auto_31852 ) ) ( not ( = ?auto_31860 ?auto_31852 ) ) ( not ( = ?auto_31855 ?auto_31852 ) ) ( not ( = ?auto_31858 ?auto_31859 ) ) ( not ( = ?auto_31863 ?auto_31858 ) ) ( not ( = ?auto_31862 ?auto_31858 ) ) ( HOIST-AT ?auto_31869 ?auto_31858 ) ( not ( = ?auto_31850 ?auto_31869 ) ) ( not ( = ?auto_31864 ?auto_31869 ) ) ( not ( = ?auto_31857 ?auto_31869 ) ) ( SURFACE-AT ?auto_31860 ?auto_31858 ) ( ON ?auto_31860 ?auto_31868 ) ( CLEAR ?auto_31860 ) ( not ( = ?auto_31846 ?auto_31868 ) ) ( not ( = ?auto_31847 ?auto_31868 ) ) ( not ( = ?auto_31856 ?auto_31868 ) ) ( not ( = ?auto_31861 ?auto_31868 ) ) ( not ( = ?auto_31865 ?auto_31868 ) ) ( not ( = ?auto_31860 ?auto_31868 ) ) ( not ( = ?auto_31855 ?auto_31868 ) ) ( not ( = ?auto_31852 ?auto_31868 ) ) ( IS-CRATE ?auto_31852 ) ( not ( = ?auto_31846 ?auto_31867 ) ) ( not ( = ?auto_31847 ?auto_31867 ) ) ( not ( = ?auto_31856 ?auto_31867 ) ) ( not ( = ?auto_31861 ?auto_31867 ) ) ( not ( = ?auto_31865 ?auto_31867 ) ) ( not ( = ?auto_31860 ?auto_31867 ) ) ( not ( = ?auto_31855 ?auto_31867 ) ) ( not ( = ?auto_31852 ?auto_31867 ) ) ( not ( = ?auto_31868 ?auto_31867 ) ) ( not ( = ?auto_31853 ?auto_31859 ) ) ( not ( = ?auto_31863 ?auto_31853 ) ) ( not ( = ?auto_31862 ?auto_31853 ) ) ( not ( = ?auto_31858 ?auto_31853 ) ) ( HOIST-AT ?auto_31854 ?auto_31853 ) ( not ( = ?auto_31850 ?auto_31854 ) ) ( not ( = ?auto_31864 ?auto_31854 ) ) ( not ( = ?auto_31857 ?auto_31854 ) ) ( not ( = ?auto_31869 ?auto_31854 ) ) ( AVAILABLE ?auto_31854 ) ( SURFACE-AT ?auto_31852 ?auto_31853 ) ( ON ?auto_31852 ?auto_31848 ) ( CLEAR ?auto_31852 ) ( not ( = ?auto_31846 ?auto_31848 ) ) ( not ( = ?auto_31847 ?auto_31848 ) ) ( not ( = ?auto_31856 ?auto_31848 ) ) ( not ( = ?auto_31861 ?auto_31848 ) ) ( not ( = ?auto_31865 ?auto_31848 ) ) ( not ( = ?auto_31860 ?auto_31848 ) ) ( not ( = ?auto_31855 ?auto_31848 ) ) ( not ( = ?auto_31852 ?auto_31848 ) ) ( not ( = ?auto_31868 ?auto_31848 ) ) ( not ( = ?auto_31867 ?auto_31848 ) ) ( IS-CRATE ?auto_31867 ) ( not ( = ?auto_31846 ?auto_31866 ) ) ( not ( = ?auto_31847 ?auto_31866 ) ) ( not ( = ?auto_31856 ?auto_31866 ) ) ( not ( = ?auto_31861 ?auto_31866 ) ) ( not ( = ?auto_31865 ?auto_31866 ) ) ( not ( = ?auto_31860 ?auto_31866 ) ) ( not ( = ?auto_31855 ?auto_31866 ) ) ( not ( = ?auto_31852 ?auto_31866 ) ) ( not ( = ?auto_31868 ?auto_31866 ) ) ( not ( = ?auto_31867 ?auto_31866 ) ) ( not ( = ?auto_31848 ?auto_31866 ) ) ( AVAILABLE ?auto_31869 ) ( SURFACE-AT ?auto_31867 ?auto_31858 ) ( ON ?auto_31867 ?auto_31849 ) ( CLEAR ?auto_31867 ) ( not ( = ?auto_31846 ?auto_31849 ) ) ( not ( = ?auto_31847 ?auto_31849 ) ) ( not ( = ?auto_31856 ?auto_31849 ) ) ( not ( = ?auto_31861 ?auto_31849 ) ) ( not ( = ?auto_31865 ?auto_31849 ) ) ( not ( = ?auto_31860 ?auto_31849 ) ) ( not ( = ?auto_31855 ?auto_31849 ) ) ( not ( = ?auto_31852 ?auto_31849 ) ) ( not ( = ?auto_31868 ?auto_31849 ) ) ( not ( = ?auto_31867 ?auto_31849 ) ) ( not ( = ?auto_31848 ?auto_31849 ) ) ( not ( = ?auto_31866 ?auto_31849 ) ) ( TRUCK-AT ?auto_31851 ?auto_31859 ) ( SURFACE-AT ?auto_31870 ?auto_31859 ) ( CLEAR ?auto_31870 ) ( LIFTING ?auto_31850 ?auto_31866 ) ( IS-CRATE ?auto_31866 ) ( not ( = ?auto_31846 ?auto_31870 ) ) ( not ( = ?auto_31847 ?auto_31870 ) ) ( not ( = ?auto_31856 ?auto_31870 ) ) ( not ( = ?auto_31861 ?auto_31870 ) ) ( not ( = ?auto_31865 ?auto_31870 ) ) ( not ( = ?auto_31860 ?auto_31870 ) ) ( not ( = ?auto_31855 ?auto_31870 ) ) ( not ( = ?auto_31852 ?auto_31870 ) ) ( not ( = ?auto_31868 ?auto_31870 ) ) ( not ( = ?auto_31867 ?auto_31870 ) ) ( not ( = ?auto_31848 ?auto_31870 ) ) ( not ( = ?auto_31866 ?auto_31870 ) ) ( not ( = ?auto_31849 ?auto_31870 ) ) )
    :subtasks
    ( ( !DROP ?auto_31850 ?auto_31866 ?auto_31870 ?auto_31859 )
      ( MAKE-ON ?auto_31846 ?auto_31847 )
      ( MAKE-ON-VERIFY ?auto_31846 ?auto_31847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31871 - SURFACE
      ?auto_31872 - SURFACE
    )
    :vars
    (
      ?auto_31884 - HOIST
      ?auto_31878 - PLACE
      ?auto_31882 - PLACE
      ?auto_31874 - HOIST
      ?auto_31893 - SURFACE
      ?auto_31879 - SURFACE
      ?auto_31876 - SURFACE
      ?auto_31877 - SURFACE
      ?auto_31890 - PLACE
      ?auto_31881 - HOIST
      ?auto_31880 - SURFACE
      ?auto_31889 - SURFACE
      ?auto_31886 - PLACE
      ?auto_31873 - HOIST
      ?auto_31892 - SURFACE
      ?auto_31891 - SURFACE
      ?auto_31885 - PLACE
      ?auto_31883 - HOIST
      ?auto_31894 - SURFACE
      ?auto_31875 - SURFACE
      ?auto_31888 - SURFACE
      ?auto_31887 - TRUCK
      ?auto_31895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31884 ?auto_31878 ) ( IS-CRATE ?auto_31871 ) ( not ( = ?auto_31871 ?auto_31872 ) ) ( not ( = ?auto_31882 ?auto_31878 ) ) ( HOIST-AT ?auto_31874 ?auto_31882 ) ( not ( = ?auto_31884 ?auto_31874 ) ) ( SURFACE-AT ?auto_31871 ?auto_31882 ) ( ON ?auto_31871 ?auto_31893 ) ( CLEAR ?auto_31871 ) ( not ( = ?auto_31871 ?auto_31893 ) ) ( not ( = ?auto_31872 ?auto_31893 ) ) ( IS-CRATE ?auto_31872 ) ( not ( = ?auto_31871 ?auto_31879 ) ) ( not ( = ?auto_31872 ?auto_31879 ) ) ( not ( = ?auto_31893 ?auto_31879 ) ) ( AVAILABLE ?auto_31874 ) ( SURFACE-AT ?auto_31872 ?auto_31882 ) ( ON ?auto_31872 ?auto_31876 ) ( CLEAR ?auto_31872 ) ( not ( = ?auto_31871 ?auto_31876 ) ) ( not ( = ?auto_31872 ?auto_31876 ) ) ( not ( = ?auto_31893 ?auto_31876 ) ) ( not ( = ?auto_31879 ?auto_31876 ) ) ( IS-CRATE ?auto_31879 ) ( not ( = ?auto_31871 ?auto_31877 ) ) ( not ( = ?auto_31872 ?auto_31877 ) ) ( not ( = ?auto_31893 ?auto_31877 ) ) ( not ( = ?auto_31879 ?auto_31877 ) ) ( not ( = ?auto_31876 ?auto_31877 ) ) ( not ( = ?auto_31890 ?auto_31878 ) ) ( not ( = ?auto_31882 ?auto_31890 ) ) ( HOIST-AT ?auto_31881 ?auto_31890 ) ( not ( = ?auto_31884 ?auto_31881 ) ) ( not ( = ?auto_31874 ?auto_31881 ) ) ( AVAILABLE ?auto_31881 ) ( SURFACE-AT ?auto_31879 ?auto_31890 ) ( ON ?auto_31879 ?auto_31880 ) ( CLEAR ?auto_31879 ) ( not ( = ?auto_31871 ?auto_31880 ) ) ( not ( = ?auto_31872 ?auto_31880 ) ) ( not ( = ?auto_31893 ?auto_31880 ) ) ( not ( = ?auto_31879 ?auto_31880 ) ) ( not ( = ?auto_31876 ?auto_31880 ) ) ( not ( = ?auto_31877 ?auto_31880 ) ) ( IS-CRATE ?auto_31877 ) ( not ( = ?auto_31871 ?auto_31889 ) ) ( not ( = ?auto_31872 ?auto_31889 ) ) ( not ( = ?auto_31893 ?auto_31889 ) ) ( not ( = ?auto_31879 ?auto_31889 ) ) ( not ( = ?auto_31876 ?auto_31889 ) ) ( not ( = ?auto_31877 ?auto_31889 ) ) ( not ( = ?auto_31880 ?auto_31889 ) ) ( not ( = ?auto_31886 ?auto_31878 ) ) ( not ( = ?auto_31882 ?auto_31886 ) ) ( not ( = ?auto_31890 ?auto_31886 ) ) ( HOIST-AT ?auto_31873 ?auto_31886 ) ( not ( = ?auto_31884 ?auto_31873 ) ) ( not ( = ?auto_31874 ?auto_31873 ) ) ( not ( = ?auto_31881 ?auto_31873 ) ) ( SURFACE-AT ?auto_31877 ?auto_31886 ) ( ON ?auto_31877 ?auto_31892 ) ( CLEAR ?auto_31877 ) ( not ( = ?auto_31871 ?auto_31892 ) ) ( not ( = ?auto_31872 ?auto_31892 ) ) ( not ( = ?auto_31893 ?auto_31892 ) ) ( not ( = ?auto_31879 ?auto_31892 ) ) ( not ( = ?auto_31876 ?auto_31892 ) ) ( not ( = ?auto_31877 ?auto_31892 ) ) ( not ( = ?auto_31880 ?auto_31892 ) ) ( not ( = ?auto_31889 ?auto_31892 ) ) ( IS-CRATE ?auto_31889 ) ( not ( = ?auto_31871 ?auto_31891 ) ) ( not ( = ?auto_31872 ?auto_31891 ) ) ( not ( = ?auto_31893 ?auto_31891 ) ) ( not ( = ?auto_31879 ?auto_31891 ) ) ( not ( = ?auto_31876 ?auto_31891 ) ) ( not ( = ?auto_31877 ?auto_31891 ) ) ( not ( = ?auto_31880 ?auto_31891 ) ) ( not ( = ?auto_31889 ?auto_31891 ) ) ( not ( = ?auto_31892 ?auto_31891 ) ) ( not ( = ?auto_31885 ?auto_31878 ) ) ( not ( = ?auto_31882 ?auto_31885 ) ) ( not ( = ?auto_31890 ?auto_31885 ) ) ( not ( = ?auto_31886 ?auto_31885 ) ) ( HOIST-AT ?auto_31883 ?auto_31885 ) ( not ( = ?auto_31884 ?auto_31883 ) ) ( not ( = ?auto_31874 ?auto_31883 ) ) ( not ( = ?auto_31881 ?auto_31883 ) ) ( not ( = ?auto_31873 ?auto_31883 ) ) ( AVAILABLE ?auto_31883 ) ( SURFACE-AT ?auto_31889 ?auto_31885 ) ( ON ?auto_31889 ?auto_31894 ) ( CLEAR ?auto_31889 ) ( not ( = ?auto_31871 ?auto_31894 ) ) ( not ( = ?auto_31872 ?auto_31894 ) ) ( not ( = ?auto_31893 ?auto_31894 ) ) ( not ( = ?auto_31879 ?auto_31894 ) ) ( not ( = ?auto_31876 ?auto_31894 ) ) ( not ( = ?auto_31877 ?auto_31894 ) ) ( not ( = ?auto_31880 ?auto_31894 ) ) ( not ( = ?auto_31889 ?auto_31894 ) ) ( not ( = ?auto_31892 ?auto_31894 ) ) ( not ( = ?auto_31891 ?auto_31894 ) ) ( IS-CRATE ?auto_31891 ) ( not ( = ?auto_31871 ?auto_31875 ) ) ( not ( = ?auto_31872 ?auto_31875 ) ) ( not ( = ?auto_31893 ?auto_31875 ) ) ( not ( = ?auto_31879 ?auto_31875 ) ) ( not ( = ?auto_31876 ?auto_31875 ) ) ( not ( = ?auto_31877 ?auto_31875 ) ) ( not ( = ?auto_31880 ?auto_31875 ) ) ( not ( = ?auto_31889 ?auto_31875 ) ) ( not ( = ?auto_31892 ?auto_31875 ) ) ( not ( = ?auto_31891 ?auto_31875 ) ) ( not ( = ?auto_31894 ?auto_31875 ) ) ( AVAILABLE ?auto_31873 ) ( SURFACE-AT ?auto_31891 ?auto_31886 ) ( ON ?auto_31891 ?auto_31888 ) ( CLEAR ?auto_31891 ) ( not ( = ?auto_31871 ?auto_31888 ) ) ( not ( = ?auto_31872 ?auto_31888 ) ) ( not ( = ?auto_31893 ?auto_31888 ) ) ( not ( = ?auto_31879 ?auto_31888 ) ) ( not ( = ?auto_31876 ?auto_31888 ) ) ( not ( = ?auto_31877 ?auto_31888 ) ) ( not ( = ?auto_31880 ?auto_31888 ) ) ( not ( = ?auto_31889 ?auto_31888 ) ) ( not ( = ?auto_31892 ?auto_31888 ) ) ( not ( = ?auto_31891 ?auto_31888 ) ) ( not ( = ?auto_31894 ?auto_31888 ) ) ( not ( = ?auto_31875 ?auto_31888 ) ) ( TRUCK-AT ?auto_31887 ?auto_31878 ) ( SURFACE-AT ?auto_31895 ?auto_31878 ) ( CLEAR ?auto_31895 ) ( IS-CRATE ?auto_31875 ) ( not ( = ?auto_31871 ?auto_31895 ) ) ( not ( = ?auto_31872 ?auto_31895 ) ) ( not ( = ?auto_31893 ?auto_31895 ) ) ( not ( = ?auto_31879 ?auto_31895 ) ) ( not ( = ?auto_31876 ?auto_31895 ) ) ( not ( = ?auto_31877 ?auto_31895 ) ) ( not ( = ?auto_31880 ?auto_31895 ) ) ( not ( = ?auto_31889 ?auto_31895 ) ) ( not ( = ?auto_31892 ?auto_31895 ) ) ( not ( = ?auto_31891 ?auto_31895 ) ) ( not ( = ?auto_31894 ?auto_31895 ) ) ( not ( = ?auto_31875 ?auto_31895 ) ) ( not ( = ?auto_31888 ?auto_31895 ) ) ( AVAILABLE ?auto_31884 ) ( IN ?auto_31875 ?auto_31887 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31884 ?auto_31875 ?auto_31887 ?auto_31878 )
      ( MAKE-ON ?auto_31871 ?auto_31872 )
      ( MAKE-ON-VERIFY ?auto_31871 ?auto_31872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31896 - SURFACE
      ?auto_31897 - SURFACE
    )
    :vars
    (
      ?auto_31901 - HOIST
      ?auto_31909 - PLACE
      ?auto_31900 - PLACE
      ?auto_31898 - HOIST
      ?auto_31920 - SURFACE
      ?auto_31905 - SURFACE
      ?auto_31919 - SURFACE
      ?auto_31917 - SURFACE
      ?auto_31904 - PLACE
      ?auto_31918 - HOIST
      ?auto_31911 - SURFACE
      ?auto_31908 - SURFACE
      ?auto_31903 - PLACE
      ?auto_31912 - HOIST
      ?auto_31907 - SURFACE
      ?auto_31906 - SURFACE
      ?auto_31910 - PLACE
      ?auto_31899 - HOIST
      ?auto_31914 - SURFACE
      ?auto_31902 - SURFACE
      ?auto_31916 - SURFACE
      ?auto_31915 - SURFACE
      ?auto_31913 - TRUCK
      ?auto_31921 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31901 ?auto_31909 ) ( IS-CRATE ?auto_31896 ) ( not ( = ?auto_31896 ?auto_31897 ) ) ( not ( = ?auto_31900 ?auto_31909 ) ) ( HOIST-AT ?auto_31898 ?auto_31900 ) ( not ( = ?auto_31901 ?auto_31898 ) ) ( SURFACE-AT ?auto_31896 ?auto_31900 ) ( ON ?auto_31896 ?auto_31920 ) ( CLEAR ?auto_31896 ) ( not ( = ?auto_31896 ?auto_31920 ) ) ( not ( = ?auto_31897 ?auto_31920 ) ) ( IS-CRATE ?auto_31897 ) ( not ( = ?auto_31896 ?auto_31905 ) ) ( not ( = ?auto_31897 ?auto_31905 ) ) ( not ( = ?auto_31920 ?auto_31905 ) ) ( AVAILABLE ?auto_31898 ) ( SURFACE-AT ?auto_31897 ?auto_31900 ) ( ON ?auto_31897 ?auto_31919 ) ( CLEAR ?auto_31897 ) ( not ( = ?auto_31896 ?auto_31919 ) ) ( not ( = ?auto_31897 ?auto_31919 ) ) ( not ( = ?auto_31920 ?auto_31919 ) ) ( not ( = ?auto_31905 ?auto_31919 ) ) ( IS-CRATE ?auto_31905 ) ( not ( = ?auto_31896 ?auto_31917 ) ) ( not ( = ?auto_31897 ?auto_31917 ) ) ( not ( = ?auto_31920 ?auto_31917 ) ) ( not ( = ?auto_31905 ?auto_31917 ) ) ( not ( = ?auto_31919 ?auto_31917 ) ) ( not ( = ?auto_31904 ?auto_31909 ) ) ( not ( = ?auto_31900 ?auto_31904 ) ) ( HOIST-AT ?auto_31918 ?auto_31904 ) ( not ( = ?auto_31901 ?auto_31918 ) ) ( not ( = ?auto_31898 ?auto_31918 ) ) ( AVAILABLE ?auto_31918 ) ( SURFACE-AT ?auto_31905 ?auto_31904 ) ( ON ?auto_31905 ?auto_31911 ) ( CLEAR ?auto_31905 ) ( not ( = ?auto_31896 ?auto_31911 ) ) ( not ( = ?auto_31897 ?auto_31911 ) ) ( not ( = ?auto_31920 ?auto_31911 ) ) ( not ( = ?auto_31905 ?auto_31911 ) ) ( not ( = ?auto_31919 ?auto_31911 ) ) ( not ( = ?auto_31917 ?auto_31911 ) ) ( IS-CRATE ?auto_31917 ) ( not ( = ?auto_31896 ?auto_31908 ) ) ( not ( = ?auto_31897 ?auto_31908 ) ) ( not ( = ?auto_31920 ?auto_31908 ) ) ( not ( = ?auto_31905 ?auto_31908 ) ) ( not ( = ?auto_31919 ?auto_31908 ) ) ( not ( = ?auto_31917 ?auto_31908 ) ) ( not ( = ?auto_31911 ?auto_31908 ) ) ( not ( = ?auto_31903 ?auto_31909 ) ) ( not ( = ?auto_31900 ?auto_31903 ) ) ( not ( = ?auto_31904 ?auto_31903 ) ) ( HOIST-AT ?auto_31912 ?auto_31903 ) ( not ( = ?auto_31901 ?auto_31912 ) ) ( not ( = ?auto_31898 ?auto_31912 ) ) ( not ( = ?auto_31918 ?auto_31912 ) ) ( SURFACE-AT ?auto_31917 ?auto_31903 ) ( ON ?auto_31917 ?auto_31907 ) ( CLEAR ?auto_31917 ) ( not ( = ?auto_31896 ?auto_31907 ) ) ( not ( = ?auto_31897 ?auto_31907 ) ) ( not ( = ?auto_31920 ?auto_31907 ) ) ( not ( = ?auto_31905 ?auto_31907 ) ) ( not ( = ?auto_31919 ?auto_31907 ) ) ( not ( = ?auto_31917 ?auto_31907 ) ) ( not ( = ?auto_31911 ?auto_31907 ) ) ( not ( = ?auto_31908 ?auto_31907 ) ) ( IS-CRATE ?auto_31908 ) ( not ( = ?auto_31896 ?auto_31906 ) ) ( not ( = ?auto_31897 ?auto_31906 ) ) ( not ( = ?auto_31920 ?auto_31906 ) ) ( not ( = ?auto_31905 ?auto_31906 ) ) ( not ( = ?auto_31919 ?auto_31906 ) ) ( not ( = ?auto_31917 ?auto_31906 ) ) ( not ( = ?auto_31911 ?auto_31906 ) ) ( not ( = ?auto_31908 ?auto_31906 ) ) ( not ( = ?auto_31907 ?auto_31906 ) ) ( not ( = ?auto_31910 ?auto_31909 ) ) ( not ( = ?auto_31900 ?auto_31910 ) ) ( not ( = ?auto_31904 ?auto_31910 ) ) ( not ( = ?auto_31903 ?auto_31910 ) ) ( HOIST-AT ?auto_31899 ?auto_31910 ) ( not ( = ?auto_31901 ?auto_31899 ) ) ( not ( = ?auto_31898 ?auto_31899 ) ) ( not ( = ?auto_31918 ?auto_31899 ) ) ( not ( = ?auto_31912 ?auto_31899 ) ) ( AVAILABLE ?auto_31899 ) ( SURFACE-AT ?auto_31908 ?auto_31910 ) ( ON ?auto_31908 ?auto_31914 ) ( CLEAR ?auto_31908 ) ( not ( = ?auto_31896 ?auto_31914 ) ) ( not ( = ?auto_31897 ?auto_31914 ) ) ( not ( = ?auto_31920 ?auto_31914 ) ) ( not ( = ?auto_31905 ?auto_31914 ) ) ( not ( = ?auto_31919 ?auto_31914 ) ) ( not ( = ?auto_31917 ?auto_31914 ) ) ( not ( = ?auto_31911 ?auto_31914 ) ) ( not ( = ?auto_31908 ?auto_31914 ) ) ( not ( = ?auto_31907 ?auto_31914 ) ) ( not ( = ?auto_31906 ?auto_31914 ) ) ( IS-CRATE ?auto_31906 ) ( not ( = ?auto_31896 ?auto_31902 ) ) ( not ( = ?auto_31897 ?auto_31902 ) ) ( not ( = ?auto_31920 ?auto_31902 ) ) ( not ( = ?auto_31905 ?auto_31902 ) ) ( not ( = ?auto_31919 ?auto_31902 ) ) ( not ( = ?auto_31917 ?auto_31902 ) ) ( not ( = ?auto_31911 ?auto_31902 ) ) ( not ( = ?auto_31908 ?auto_31902 ) ) ( not ( = ?auto_31907 ?auto_31902 ) ) ( not ( = ?auto_31906 ?auto_31902 ) ) ( not ( = ?auto_31914 ?auto_31902 ) ) ( AVAILABLE ?auto_31912 ) ( SURFACE-AT ?auto_31906 ?auto_31903 ) ( ON ?auto_31906 ?auto_31916 ) ( CLEAR ?auto_31906 ) ( not ( = ?auto_31896 ?auto_31916 ) ) ( not ( = ?auto_31897 ?auto_31916 ) ) ( not ( = ?auto_31920 ?auto_31916 ) ) ( not ( = ?auto_31905 ?auto_31916 ) ) ( not ( = ?auto_31919 ?auto_31916 ) ) ( not ( = ?auto_31917 ?auto_31916 ) ) ( not ( = ?auto_31911 ?auto_31916 ) ) ( not ( = ?auto_31908 ?auto_31916 ) ) ( not ( = ?auto_31907 ?auto_31916 ) ) ( not ( = ?auto_31906 ?auto_31916 ) ) ( not ( = ?auto_31914 ?auto_31916 ) ) ( not ( = ?auto_31902 ?auto_31916 ) ) ( SURFACE-AT ?auto_31915 ?auto_31909 ) ( CLEAR ?auto_31915 ) ( IS-CRATE ?auto_31902 ) ( not ( = ?auto_31896 ?auto_31915 ) ) ( not ( = ?auto_31897 ?auto_31915 ) ) ( not ( = ?auto_31920 ?auto_31915 ) ) ( not ( = ?auto_31905 ?auto_31915 ) ) ( not ( = ?auto_31919 ?auto_31915 ) ) ( not ( = ?auto_31917 ?auto_31915 ) ) ( not ( = ?auto_31911 ?auto_31915 ) ) ( not ( = ?auto_31908 ?auto_31915 ) ) ( not ( = ?auto_31907 ?auto_31915 ) ) ( not ( = ?auto_31906 ?auto_31915 ) ) ( not ( = ?auto_31914 ?auto_31915 ) ) ( not ( = ?auto_31902 ?auto_31915 ) ) ( not ( = ?auto_31916 ?auto_31915 ) ) ( AVAILABLE ?auto_31901 ) ( IN ?auto_31902 ?auto_31913 ) ( TRUCK-AT ?auto_31913 ?auto_31921 ) ( not ( = ?auto_31921 ?auto_31909 ) ) ( not ( = ?auto_31900 ?auto_31921 ) ) ( not ( = ?auto_31904 ?auto_31921 ) ) ( not ( = ?auto_31903 ?auto_31921 ) ) ( not ( = ?auto_31910 ?auto_31921 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31913 ?auto_31921 ?auto_31909 )
      ( MAKE-ON ?auto_31896 ?auto_31897 )
      ( MAKE-ON-VERIFY ?auto_31896 ?auto_31897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31922 - SURFACE
      ?auto_31923 - SURFACE
    )
    :vars
    (
      ?auto_31935 - HOIST
      ?auto_31938 - PLACE
      ?auto_31933 - PLACE
      ?auto_31929 - HOIST
      ?auto_31947 - SURFACE
      ?auto_31930 - SURFACE
      ?auto_31946 - SURFACE
      ?auto_31944 - SURFACE
      ?auto_31941 - PLACE
      ?auto_31945 - HOIST
      ?auto_31931 - SURFACE
      ?auto_31927 - SURFACE
      ?auto_31937 - PLACE
      ?auto_31940 - HOIST
      ?auto_31932 - SURFACE
      ?auto_31936 - SURFACE
      ?auto_31934 - PLACE
      ?auto_31925 - HOIST
      ?auto_31924 - SURFACE
      ?auto_31926 - SURFACE
      ?auto_31943 - SURFACE
      ?auto_31942 - SURFACE
      ?auto_31928 - TRUCK
      ?auto_31939 - PLACE
      ?auto_31948 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31935 ?auto_31938 ) ( IS-CRATE ?auto_31922 ) ( not ( = ?auto_31922 ?auto_31923 ) ) ( not ( = ?auto_31933 ?auto_31938 ) ) ( HOIST-AT ?auto_31929 ?auto_31933 ) ( not ( = ?auto_31935 ?auto_31929 ) ) ( SURFACE-AT ?auto_31922 ?auto_31933 ) ( ON ?auto_31922 ?auto_31947 ) ( CLEAR ?auto_31922 ) ( not ( = ?auto_31922 ?auto_31947 ) ) ( not ( = ?auto_31923 ?auto_31947 ) ) ( IS-CRATE ?auto_31923 ) ( not ( = ?auto_31922 ?auto_31930 ) ) ( not ( = ?auto_31923 ?auto_31930 ) ) ( not ( = ?auto_31947 ?auto_31930 ) ) ( AVAILABLE ?auto_31929 ) ( SURFACE-AT ?auto_31923 ?auto_31933 ) ( ON ?auto_31923 ?auto_31946 ) ( CLEAR ?auto_31923 ) ( not ( = ?auto_31922 ?auto_31946 ) ) ( not ( = ?auto_31923 ?auto_31946 ) ) ( not ( = ?auto_31947 ?auto_31946 ) ) ( not ( = ?auto_31930 ?auto_31946 ) ) ( IS-CRATE ?auto_31930 ) ( not ( = ?auto_31922 ?auto_31944 ) ) ( not ( = ?auto_31923 ?auto_31944 ) ) ( not ( = ?auto_31947 ?auto_31944 ) ) ( not ( = ?auto_31930 ?auto_31944 ) ) ( not ( = ?auto_31946 ?auto_31944 ) ) ( not ( = ?auto_31941 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31941 ) ) ( HOIST-AT ?auto_31945 ?auto_31941 ) ( not ( = ?auto_31935 ?auto_31945 ) ) ( not ( = ?auto_31929 ?auto_31945 ) ) ( AVAILABLE ?auto_31945 ) ( SURFACE-AT ?auto_31930 ?auto_31941 ) ( ON ?auto_31930 ?auto_31931 ) ( CLEAR ?auto_31930 ) ( not ( = ?auto_31922 ?auto_31931 ) ) ( not ( = ?auto_31923 ?auto_31931 ) ) ( not ( = ?auto_31947 ?auto_31931 ) ) ( not ( = ?auto_31930 ?auto_31931 ) ) ( not ( = ?auto_31946 ?auto_31931 ) ) ( not ( = ?auto_31944 ?auto_31931 ) ) ( IS-CRATE ?auto_31944 ) ( not ( = ?auto_31922 ?auto_31927 ) ) ( not ( = ?auto_31923 ?auto_31927 ) ) ( not ( = ?auto_31947 ?auto_31927 ) ) ( not ( = ?auto_31930 ?auto_31927 ) ) ( not ( = ?auto_31946 ?auto_31927 ) ) ( not ( = ?auto_31944 ?auto_31927 ) ) ( not ( = ?auto_31931 ?auto_31927 ) ) ( not ( = ?auto_31937 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31937 ) ) ( not ( = ?auto_31941 ?auto_31937 ) ) ( HOIST-AT ?auto_31940 ?auto_31937 ) ( not ( = ?auto_31935 ?auto_31940 ) ) ( not ( = ?auto_31929 ?auto_31940 ) ) ( not ( = ?auto_31945 ?auto_31940 ) ) ( SURFACE-AT ?auto_31944 ?auto_31937 ) ( ON ?auto_31944 ?auto_31932 ) ( CLEAR ?auto_31944 ) ( not ( = ?auto_31922 ?auto_31932 ) ) ( not ( = ?auto_31923 ?auto_31932 ) ) ( not ( = ?auto_31947 ?auto_31932 ) ) ( not ( = ?auto_31930 ?auto_31932 ) ) ( not ( = ?auto_31946 ?auto_31932 ) ) ( not ( = ?auto_31944 ?auto_31932 ) ) ( not ( = ?auto_31931 ?auto_31932 ) ) ( not ( = ?auto_31927 ?auto_31932 ) ) ( IS-CRATE ?auto_31927 ) ( not ( = ?auto_31922 ?auto_31936 ) ) ( not ( = ?auto_31923 ?auto_31936 ) ) ( not ( = ?auto_31947 ?auto_31936 ) ) ( not ( = ?auto_31930 ?auto_31936 ) ) ( not ( = ?auto_31946 ?auto_31936 ) ) ( not ( = ?auto_31944 ?auto_31936 ) ) ( not ( = ?auto_31931 ?auto_31936 ) ) ( not ( = ?auto_31927 ?auto_31936 ) ) ( not ( = ?auto_31932 ?auto_31936 ) ) ( not ( = ?auto_31934 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31934 ) ) ( not ( = ?auto_31941 ?auto_31934 ) ) ( not ( = ?auto_31937 ?auto_31934 ) ) ( HOIST-AT ?auto_31925 ?auto_31934 ) ( not ( = ?auto_31935 ?auto_31925 ) ) ( not ( = ?auto_31929 ?auto_31925 ) ) ( not ( = ?auto_31945 ?auto_31925 ) ) ( not ( = ?auto_31940 ?auto_31925 ) ) ( AVAILABLE ?auto_31925 ) ( SURFACE-AT ?auto_31927 ?auto_31934 ) ( ON ?auto_31927 ?auto_31924 ) ( CLEAR ?auto_31927 ) ( not ( = ?auto_31922 ?auto_31924 ) ) ( not ( = ?auto_31923 ?auto_31924 ) ) ( not ( = ?auto_31947 ?auto_31924 ) ) ( not ( = ?auto_31930 ?auto_31924 ) ) ( not ( = ?auto_31946 ?auto_31924 ) ) ( not ( = ?auto_31944 ?auto_31924 ) ) ( not ( = ?auto_31931 ?auto_31924 ) ) ( not ( = ?auto_31927 ?auto_31924 ) ) ( not ( = ?auto_31932 ?auto_31924 ) ) ( not ( = ?auto_31936 ?auto_31924 ) ) ( IS-CRATE ?auto_31936 ) ( not ( = ?auto_31922 ?auto_31926 ) ) ( not ( = ?auto_31923 ?auto_31926 ) ) ( not ( = ?auto_31947 ?auto_31926 ) ) ( not ( = ?auto_31930 ?auto_31926 ) ) ( not ( = ?auto_31946 ?auto_31926 ) ) ( not ( = ?auto_31944 ?auto_31926 ) ) ( not ( = ?auto_31931 ?auto_31926 ) ) ( not ( = ?auto_31927 ?auto_31926 ) ) ( not ( = ?auto_31932 ?auto_31926 ) ) ( not ( = ?auto_31936 ?auto_31926 ) ) ( not ( = ?auto_31924 ?auto_31926 ) ) ( AVAILABLE ?auto_31940 ) ( SURFACE-AT ?auto_31936 ?auto_31937 ) ( ON ?auto_31936 ?auto_31943 ) ( CLEAR ?auto_31936 ) ( not ( = ?auto_31922 ?auto_31943 ) ) ( not ( = ?auto_31923 ?auto_31943 ) ) ( not ( = ?auto_31947 ?auto_31943 ) ) ( not ( = ?auto_31930 ?auto_31943 ) ) ( not ( = ?auto_31946 ?auto_31943 ) ) ( not ( = ?auto_31944 ?auto_31943 ) ) ( not ( = ?auto_31931 ?auto_31943 ) ) ( not ( = ?auto_31927 ?auto_31943 ) ) ( not ( = ?auto_31932 ?auto_31943 ) ) ( not ( = ?auto_31936 ?auto_31943 ) ) ( not ( = ?auto_31924 ?auto_31943 ) ) ( not ( = ?auto_31926 ?auto_31943 ) ) ( SURFACE-AT ?auto_31942 ?auto_31938 ) ( CLEAR ?auto_31942 ) ( IS-CRATE ?auto_31926 ) ( not ( = ?auto_31922 ?auto_31942 ) ) ( not ( = ?auto_31923 ?auto_31942 ) ) ( not ( = ?auto_31947 ?auto_31942 ) ) ( not ( = ?auto_31930 ?auto_31942 ) ) ( not ( = ?auto_31946 ?auto_31942 ) ) ( not ( = ?auto_31944 ?auto_31942 ) ) ( not ( = ?auto_31931 ?auto_31942 ) ) ( not ( = ?auto_31927 ?auto_31942 ) ) ( not ( = ?auto_31932 ?auto_31942 ) ) ( not ( = ?auto_31936 ?auto_31942 ) ) ( not ( = ?auto_31924 ?auto_31942 ) ) ( not ( = ?auto_31926 ?auto_31942 ) ) ( not ( = ?auto_31943 ?auto_31942 ) ) ( AVAILABLE ?auto_31935 ) ( TRUCK-AT ?auto_31928 ?auto_31939 ) ( not ( = ?auto_31939 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31939 ) ) ( not ( = ?auto_31941 ?auto_31939 ) ) ( not ( = ?auto_31937 ?auto_31939 ) ) ( not ( = ?auto_31934 ?auto_31939 ) ) ( HOIST-AT ?auto_31948 ?auto_31939 ) ( LIFTING ?auto_31948 ?auto_31926 ) ( not ( = ?auto_31935 ?auto_31948 ) ) ( not ( = ?auto_31929 ?auto_31948 ) ) ( not ( = ?auto_31945 ?auto_31948 ) ) ( not ( = ?auto_31940 ?auto_31948 ) ) ( not ( = ?auto_31925 ?auto_31948 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31948 ?auto_31926 ?auto_31928 ?auto_31939 )
      ( MAKE-ON ?auto_31922 ?auto_31923 )
      ( MAKE-ON-VERIFY ?auto_31922 ?auto_31923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31949 - SURFACE
      ?auto_31950 - SURFACE
    )
    :vars
    (
      ?auto_31973 - HOIST
      ?auto_31968 - PLACE
      ?auto_31959 - PLACE
      ?auto_31970 - HOIST
      ?auto_31952 - SURFACE
      ?auto_31962 - SURFACE
      ?auto_31966 - SURFACE
      ?auto_31964 - SURFACE
      ?auto_31956 - PLACE
      ?auto_31965 - HOIST
      ?auto_31954 - SURFACE
      ?auto_31961 - SURFACE
      ?auto_31974 - PLACE
      ?auto_31958 - HOIST
      ?auto_31963 - SURFACE
      ?auto_31960 - SURFACE
      ?auto_31969 - PLACE
      ?auto_31971 - HOIST
      ?auto_31953 - SURFACE
      ?auto_31951 - SURFACE
      ?auto_31957 - SURFACE
      ?auto_31955 - SURFACE
      ?auto_31972 - TRUCK
      ?auto_31967 - PLACE
      ?auto_31975 - HOIST
      ?auto_31976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31973 ?auto_31968 ) ( IS-CRATE ?auto_31949 ) ( not ( = ?auto_31949 ?auto_31950 ) ) ( not ( = ?auto_31959 ?auto_31968 ) ) ( HOIST-AT ?auto_31970 ?auto_31959 ) ( not ( = ?auto_31973 ?auto_31970 ) ) ( SURFACE-AT ?auto_31949 ?auto_31959 ) ( ON ?auto_31949 ?auto_31952 ) ( CLEAR ?auto_31949 ) ( not ( = ?auto_31949 ?auto_31952 ) ) ( not ( = ?auto_31950 ?auto_31952 ) ) ( IS-CRATE ?auto_31950 ) ( not ( = ?auto_31949 ?auto_31962 ) ) ( not ( = ?auto_31950 ?auto_31962 ) ) ( not ( = ?auto_31952 ?auto_31962 ) ) ( AVAILABLE ?auto_31970 ) ( SURFACE-AT ?auto_31950 ?auto_31959 ) ( ON ?auto_31950 ?auto_31966 ) ( CLEAR ?auto_31950 ) ( not ( = ?auto_31949 ?auto_31966 ) ) ( not ( = ?auto_31950 ?auto_31966 ) ) ( not ( = ?auto_31952 ?auto_31966 ) ) ( not ( = ?auto_31962 ?auto_31966 ) ) ( IS-CRATE ?auto_31962 ) ( not ( = ?auto_31949 ?auto_31964 ) ) ( not ( = ?auto_31950 ?auto_31964 ) ) ( not ( = ?auto_31952 ?auto_31964 ) ) ( not ( = ?auto_31962 ?auto_31964 ) ) ( not ( = ?auto_31966 ?auto_31964 ) ) ( not ( = ?auto_31956 ?auto_31968 ) ) ( not ( = ?auto_31959 ?auto_31956 ) ) ( HOIST-AT ?auto_31965 ?auto_31956 ) ( not ( = ?auto_31973 ?auto_31965 ) ) ( not ( = ?auto_31970 ?auto_31965 ) ) ( AVAILABLE ?auto_31965 ) ( SURFACE-AT ?auto_31962 ?auto_31956 ) ( ON ?auto_31962 ?auto_31954 ) ( CLEAR ?auto_31962 ) ( not ( = ?auto_31949 ?auto_31954 ) ) ( not ( = ?auto_31950 ?auto_31954 ) ) ( not ( = ?auto_31952 ?auto_31954 ) ) ( not ( = ?auto_31962 ?auto_31954 ) ) ( not ( = ?auto_31966 ?auto_31954 ) ) ( not ( = ?auto_31964 ?auto_31954 ) ) ( IS-CRATE ?auto_31964 ) ( not ( = ?auto_31949 ?auto_31961 ) ) ( not ( = ?auto_31950 ?auto_31961 ) ) ( not ( = ?auto_31952 ?auto_31961 ) ) ( not ( = ?auto_31962 ?auto_31961 ) ) ( not ( = ?auto_31966 ?auto_31961 ) ) ( not ( = ?auto_31964 ?auto_31961 ) ) ( not ( = ?auto_31954 ?auto_31961 ) ) ( not ( = ?auto_31974 ?auto_31968 ) ) ( not ( = ?auto_31959 ?auto_31974 ) ) ( not ( = ?auto_31956 ?auto_31974 ) ) ( HOIST-AT ?auto_31958 ?auto_31974 ) ( not ( = ?auto_31973 ?auto_31958 ) ) ( not ( = ?auto_31970 ?auto_31958 ) ) ( not ( = ?auto_31965 ?auto_31958 ) ) ( SURFACE-AT ?auto_31964 ?auto_31974 ) ( ON ?auto_31964 ?auto_31963 ) ( CLEAR ?auto_31964 ) ( not ( = ?auto_31949 ?auto_31963 ) ) ( not ( = ?auto_31950 ?auto_31963 ) ) ( not ( = ?auto_31952 ?auto_31963 ) ) ( not ( = ?auto_31962 ?auto_31963 ) ) ( not ( = ?auto_31966 ?auto_31963 ) ) ( not ( = ?auto_31964 ?auto_31963 ) ) ( not ( = ?auto_31954 ?auto_31963 ) ) ( not ( = ?auto_31961 ?auto_31963 ) ) ( IS-CRATE ?auto_31961 ) ( not ( = ?auto_31949 ?auto_31960 ) ) ( not ( = ?auto_31950 ?auto_31960 ) ) ( not ( = ?auto_31952 ?auto_31960 ) ) ( not ( = ?auto_31962 ?auto_31960 ) ) ( not ( = ?auto_31966 ?auto_31960 ) ) ( not ( = ?auto_31964 ?auto_31960 ) ) ( not ( = ?auto_31954 ?auto_31960 ) ) ( not ( = ?auto_31961 ?auto_31960 ) ) ( not ( = ?auto_31963 ?auto_31960 ) ) ( not ( = ?auto_31969 ?auto_31968 ) ) ( not ( = ?auto_31959 ?auto_31969 ) ) ( not ( = ?auto_31956 ?auto_31969 ) ) ( not ( = ?auto_31974 ?auto_31969 ) ) ( HOIST-AT ?auto_31971 ?auto_31969 ) ( not ( = ?auto_31973 ?auto_31971 ) ) ( not ( = ?auto_31970 ?auto_31971 ) ) ( not ( = ?auto_31965 ?auto_31971 ) ) ( not ( = ?auto_31958 ?auto_31971 ) ) ( AVAILABLE ?auto_31971 ) ( SURFACE-AT ?auto_31961 ?auto_31969 ) ( ON ?auto_31961 ?auto_31953 ) ( CLEAR ?auto_31961 ) ( not ( = ?auto_31949 ?auto_31953 ) ) ( not ( = ?auto_31950 ?auto_31953 ) ) ( not ( = ?auto_31952 ?auto_31953 ) ) ( not ( = ?auto_31962 ?auto_31953 ) ) ( not ( = ?auto_31966 ?auto_31953 ) ) ( not ( = ?auto_31964 ?auto_31953 ) ) ( not ( = ?auto_31954 ?auto_31953 ) ) ( not ( = ?auto_31961 ?auto_31953 ) ) ( not ( = ?auto_31963 ?auto_31953 ) ) ( not ( = ?auto_31960 ?auto_31953 ) ) ( IS-CRATE ?auto_31960 ) ( not ( = ?auto_31949 ?auto_31951 ) ) ( not ( = ?auto_31950 ?auto_31951 ) ) ( not ( = ?auto_31952 ?auto_31951 ) ) ( not ( = ?auto_31962 ?auto_31951 ) ) ( not ( = ?auto_31966 ?auto_31951 ) ) ( not ( = ?auto_31964 ?auto_31951 ) ) ( not ( = ?auto_31954 ?auto_31951 ) ) ( not ( = ?auto_31961 ?auto_31951 ) ) ( not ( = ?auto_31963 ?auto_31951 ) ) ( not ( = ?auto_31960 ?auto_31951 ) ) ( not ( = ?auto_31953 ?auto_31951 ) ) ( AVAILABLE ?auto_31958 ) ( SURFACE-AT ?auto_31960 ?auto_31974 ) ( ON ?auto_31960 ?auto_31957 ) ( CLEAR ?auto_31960 ) ( not ( = ?auto_31949 ?auto_31957 ) ) ( not ( = ?auto_31950 ?auto_31957 ) ) ( not ( = ?auto_31952 ?auto_31957 ) ) ( not ( = ?auto_31962 ?auto_31957 ) ) ( not ( = ?auto_31966 ?auto_31957 ) ) ( not ( = ?auto_31964 ?auto_31957 ) ) ( not ( = ?auto_31954 ?auto_31957 ) ) ( not ( = ?auto_31961 ?auto_31957 ) ) ( not ( = ?auto_31963 ?auto_31957 ) ) ( not ( = ?auto_31960 ?auto_31957 ) ) ( not ( = ?auto_31953 ?auto_31957 ) ) ( not ( = ?auto_31951 ?auto_31957 ) ) ( SURFACE-AT ?auto_31955 ?auto_31968 ) ( CLEAR ?auto_31955 ) ( IS-CRATE ?auto_31951 ) ( not ( = ?auto_31949 ?auto_31955 ) ) ( not ( = ?auto_31950 ?auto_31955 ) ) ( not ( = ?auto_31952 ?auto_31955 ) ) ( not ( = ?auto_31962 ?auto_31955 ) ) ( not ( = ?auto_31966 ?auto_31955 ) ) ( not ( = ?auto_31964 ?auto_31955 ) ) ( not ( = ?auto_31954 ?auto_31955 ) ) ( not ( = ?auto_31961 ?auto_31955 ) ) ( not ( = ?auto_31963 ?auto_31955 ) ) ( not ( = ?auto_31960 ?auto_31955 ) ) ( not ( = ?auto_31953 ?auto_31955 ) ) ( not ( = ?auto_31951 ?auto_31955 ) ) ( not ( = ?auto_31957 ?auto_31955 ) ) ( AVAILABLE ?auto_31973 ) ( TRUCK-AT ?auto_31972 ?auto_31967 ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( not ( = ?auto_31959 ?auto_31967 ) ) ( not ( = ?auto_31956 ?auto_31967 ) ) ( not ( = ?auto_31974 ?auto_31967 ) ) ( not ( = ?auto_31969 ?auto_31967 ) ) ( HOIST-AT ?auto_31975 ?auto_31967 ) ( not ( = ?auto_31973 ?auto_31975 ) ) ( not ( = ?auto_31970 ?auto_31975 ) ) ( not ( = ?auto_31965 ?auto_31975 ) ) ( not ( = ?auto_31958 ?auto_31975 ) ) ( not ( = ?auto_31971 ?auto_31975 ) ) ( AVAILABLE ?auto_31975 ) ( SURFACE-AT ?auto_31951 ?auto_31967 ) ( ON ?auto_31951 ?auto_31976 ) ( CLEAR ?auto_31951 ) ( not ( = ?auto_31949 ?auto_31976 ) ) ( not ( = ?auto_31950 ?auto_31976 ) ) ( not ( = ?auto_31952 ?auto_31976 ) ) ( not ( = ?auto_31962 ?auto_31976 ) ) ( not ( = ?auto_31966 ?auto_31976 ) ) ( not ( = ?auto_31964 ?auto_31976 ) ) ( not ( = ?auto_31954 ?auto_31976 ) ) ( not ( = ?auto_31961 ?auto_31976 ) ) ( not ( = ?auto_31963 ?auto_31976 ) ) ( not ( = ?auto_31960 ?auto_31976 ) ) ( not ( = ?auto_31953 ?auto_31976 ) ) ( not ( = ?auto_31951 ?auto_31976 ) ) ( not ( = ?auto_31957 ?auto_31976 ) ) ( not ( = ?auto_31955 ?auto_31976 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31975 ?auto_31951 ?auto_31976 ?auto_31967 )
      ( MAKE-ON ?auto_31949 ?auto_31950 )
      ( MAKE-ON-VERIFY ?auto_31949 ?auto_31950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_31977 - SURFACE
      ?auto_31978 - SURFACE
    )
    :vars
    (
      ?auto_31996 - HOIST
      ?auto_31999 - PLACE
      ?auto_31997 - PLACE
      ?auto_31993 - HOIST
      ?auto_32001 - SURFACE
      ?auto_31983 - SURFACE
      ?auto_31985 - SURFACE
      ?auto_32002 - SURFACE
      ?auto_31989 - PLACE
      ?auto_31982 - HOIST
      ?auto_31987 - SURFACE
      ?auto_31981 - SURFACE
      ?auto_31980 - PLACE
      ?auto_31988 - HOIST
      ?auto_31992 - SURFACE
      ?auto_31991 - SURFACE
      ?auto_32000 - PLACE
      ?auto_31994 - HOIST
      ?auto_31990 - SURFACE
      ?auto_31998 - SURFACE
      ?auto_31984 - SURFACE
      ?auto_32003 - SURFACE
      ?auto_31979 - PLACE
      ?auto_31986 - HOIST
      ?auto_32004 - SURFACE
      ?auto_31995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31996 ?auto_31999 ) ( IS-CRATE ?auto_31977 ) ( not ( = ?auto_31977 ?auto_31978 ) ) ( not ( = ?auto_31997 ?auto_31999 ) ) ( HOIST-AT ?auto_31993 ?auto_31997 ) ( not ( = ?auto_31996 ?auto_31993 ) ) ( SURFACE-AT ?auto_31977 ?auto_31997 ) ( ON ?auto_31977 ?auto_32001 ) ( CLEAR ?auto_31977 ) ( not ( = ?auto_31977 ?auto_32001 ) ) ( not ( = ?auto_31978 ?auto_32001 ) ) ( IS-CRATE ?auto_31978 ) ( not ( = ?auto_31977 ?auto_31983 ) ) ( not ( = ?auto_31978 ?auto_31983 ) ) ( not ( = ?auto_32001 ?auto_31983 ) ) ( AVAILABLE ?auto_31993 ) ( SURFACE-AT ?auto_31978 ?auto_31997 ) ( ON ?auto_31978 ?auto_31985 ) ( CLEAR ?auto_31978 ) ( not ( = ?auto_31977 ?auto_31985 ) ) ( not ( = ?auto_31978 ?auto_31985 ) ) ( not ( = ?auto_32001 ?auto_31985 ) ) ( not ( = ?auto_31983 ?auto_31985 ) ) ( IS-CRATE ?auto_31983 ) ( not ( = ?auto_31977 ?auto_32002 ) ) ( not ( = ?auto_31978 ?auto_32002 ) ) ( not ( = ?auto_32001 ?auto_32002 ) ) ( not ( = ?auto_31983 ?auto_32002 ) ) ( not ( = ?auto_31985 ?auto_32002 ) ) ( not ( = ?auto_31989 ?auto_31999 ) ) ( not ( = ?auto_31997 ?auto_31989 ) ) ( HOIST-AT ?auto_31982 ?auto_31989 ) ( not ( = ?auto_31996 ?auto_31982 ) ) ( not ( = ?auto_31993 ?auto_31982 ) ) ( AVAILABLE ?auto_31982 ) ( SURFACE-AT ?auto_31983 ?auto_31989 ) ( ON ?auto_31983 ?auto_31987 ) ( CLEAR ?auto_31983 ) ( not ( = ?auto_31977 ?auto_31987 ) ) ( not ( = ?auto_31978 ?auto_31987 ) ) ( not ( = ?auto_32001 ?auto_31987 ) ) ( not ( = ?auto_31983 ?auto_31987 ) ) ( not ( = ?auto_31985 ?auto_31987 ) ) ( not ( = ?auto_32002 ?auto_31987 ) ) ( IS-CRATE ?auto_32002 ) ( not ( = ?auto_31977 ?auto_31981 ) ) ( not ( = ?auto_31978 ?auto_31981 ) ) ( not ( = ?auto_32001 ?auto_31981 ) ) ( not ( = ?auto_31983 ?auto_31981 ) ) ( not ( = ?auto_31985 ?auto_31981 ) ) ( not ( = ?auto_32002 ?auto_31981 ) ) ( not ( = ?auto_31987 ?auto_31981 ) ) ( not ( = ?auto_31980 ?auto_31999 ) ) ( not ( = ?auto_31997 ?auto_31980 ) ) ( not ( = ?auto_31989 ?auto_31980 ) ) ( HOIST-AT ?auto_31988 ?auto_31980 ) ( not ( = ?auto_31996 ?auto_31988 ) ) ( not ( = ?auto_31993 ?auto_31988 ) ) ( not ( = ?auto_31982 ?auto_31988 ) ) ( SURFACE-AT ?auto_32002 ?auto_31980 ) ( ON ?auto_32002 ?auto_31992 ) ( CLEAR ?auto_32002 ) ( not ( = ?auto_31977 ?auto_31992 ) ) ( not ( = ?auto_31978 ?auto_31992 ) ) ( not ( = ?auto_32001 ?auto_31992 ) ) ( not ( = ?auto_31983 ?auto_31992 ) ) ( not ( = ?auto_31985 ?auto_31992 ) ) ( not ( = ?auto_32002 ?auto_31992 ) ) ( not ( = ?auto_31987 ?auto_31992 ) ) ( not ( = ?auto_31981 ?auto_31992 ) ) ( IS-CRATE ?auto_31981 ) ( not ( = ?auto_31977 ?auto_31991 ) ) ( not ( = ?auto_31978 ?auto_31991 ) ) ( not ( = ?auto_32001 ?auto_31991 ) ) ( not ( = ?auto_31983 ?auto_31991 ) ) ( not ( = ?auto_31985 ?auto_31991 ) ) ( not ( = ?auto_32002 ?auto_31991 ) ) ( not ( = ?auto_31987 ?auto_31991 ) ) ( not ( = ?auto_31981 ?auto_31991 ) ) ( not ( = ?auto_31992 ?auto_31991 ) ) ( not ( = ?auto_32000 ?auto_31999 ) ) ( not ( = ?auto_31997 ?auto_32000 ) ) ( not ( = ?auto_31989 ?auto_32000 ) ) ( not ( = ?auto_31980 ?auto_32000 ) ) ( HOIST-AT ?auto_31994 ?auto_32000 ) ( not ( = ?auto_31996 ?auto_31994 ) ) ( not ( = ?auto_31993 ?auto_31994 ) ) ( not ( = ?auto_31982 ?auto_31994 ) ) ( not ( = ?auto_31988 ?auto_31994 ) ) ( AVAILABLE ?auto_31994 ) ( SURFACE-AT ?auto_31981 ?auto_32000 ) ( ON ?auto_31981 ?auto_31990 ) ( CLEAR ?auto_31981 ) ( not ( = ?auto_31977 ?auto_31990 ) ) ( not ( = ?auto_31978 ?auto_31990 ) ) ( not ( = ?auto_32001 ?auto_31990 ) ) ( not ( = ?auto_31983 ?auto_31990 ) ) ( not ( = ?auto_31985 ?auto_31990 ) ) ( not ( = ?auto_32002 ?auto_31990 ) ) ( not ( = ?auto_31987 ?auto_31990 ) ) ( not ( = ?auto_31981 ?auto_31990 ) ) ( not ( = ?auto_31992 ?auto_31990 ) ) ( not ( = ?auto_31991 ?auto_31990 ) ) ( IS-CRATE ?auto_31991 ) ( not ( = ?auto_31977 ?auto_31998 ) ) ( not ( = ?auto_31978 ?auto_31998 ) ) ( not ( = ?auto_32001 ?auto_31998 ) ) ( not ( = ?auto_31983 ?auto_31998 ) ) ( not ( = ?auto_31985 ?auto_31998 ) ) ( not ( = ?auto_32002 ?auto_31998 ) ) ( not ( = ?auto_31987 ?auto_31998 ) ) ( not ( = ?auto_31981 ?auto_31998 ) ) ( not ( = ?auto_31992 ?auto_31998 ) ) ( not ( = ?auto_31991 ?auto_31998 ) ) ( not ( = ?auto_31990 ?auto_31998 ) ) ( AVAILABLE ?auto_31988 ) ( SURFACE-AT ?auto_31991 ?auto_31980 ) ( ON ?auto_31991 ?auto_31984 ) ( CLEAR ?auto_31991 ) ( not ( = ?auto_31977 ?auto_31984 ) ) ( not ( = ?auto_31978 ?auto_31984 ) ) ( not ( = ?auto_32001 ?auto_31984 ) ) ( not ( = ?auto_31983 ?auto_31984 ) ) ( not ( = ?auto_31985 ?auto_31984 ) ) ( not ( = ?auto_32002 ?auto_31984 ) ) ( not ( = ?auto_31987 ?auto_31984 ) ) ( not ( = ?auto_31981 ?auto_31984 ) ) ( not ( = ?auto_31992 ?auto_31984 ) ) ( not ( = ?auto_31991 ?auto_31984 ) ) ( not ( = ?auto_31990 ?auto_31984 ) ) ( not ( = ?auto_31998 ?auto_31984 ) ) ( SURFACE-AT ?auto_32003 ?auto_31999 ) ( CLEAR ?auto_32003 ) ( IS-CRATE ?auto_31998 ) ( not ( = ?auto_31977 ?auto_32003 ) ) ( not ( = ?auto_31978 ?auto_32003 ) ) ( not ( = ?auto_32001 ?auto_32003 ) ) ( not ( = ?auto_31983 ?auto_32003 ) ) ( not ( = ?auto_31985 ?auto_32003 ) ) ( not ( = ?auto_32002 ?auto_32003 ) ) ( not ( = ?auto_31987 ?auto_32003 ) ) ( not ( = ?auto_31981 ?auto_32003 ) ) ( not ( = ?auto_31992 ?auto_32003 ) ) ( not ( = ?auto_31991 ?auto_32003 ) ) ( not ( = ?auto_31990 ?auto_32003 ) ) ( not ( = ?auto_31998 ?auto_32003 ) ) ( not ( = ?auto_31984 ?auto_32003 ) ) ( AVAILABLE ?auto_31996 ) ( not ( = ?auto_31979 ?auto_31999 ) ) ( not ( = ?auto_31997 ?auto_31979 ) ) ( not ( = ?auto_31989 ?auto_31979 ) ) ( not ( = ?auto_31980 ?auto_31979 ) ) ( not ( = ?auto_32000 ?auto_31979 ) ) ( HOIST-AT ?auto_31986 ?auto_31979 ) ( not ( = ?auto_31996 ?auto_31986 ) ) ( not ( = ?auto_31993 ?auto_31986 ) ) ( not ( = ?auto_31982 ?auto_31986 ) ) ( not ( = ?auto_31988 ?auto_31986 ) ) ( not ( = ?auto_31994 ?auto_31986 ) ) ( AVAILABLE ?auto_31986 ) ( SURFACE-AT ?auto_31998 ?auto_31979 ) ( ON ?auto_31998 ?auto_32004 ) ( CLEAR ?auto_31998 ) ( not ( = ?auto_31977 ?auto_32004 ) ) ( not ( = ?auto_31978 ?auto_32004 ) ) ( not ( = ?auto_32001 ?auto_32004 ) ) ( not ( = ?auto_31983 ?auto_32004 ) ) ( not ( = ?auto_31985 ?auto_32004 ) ) ( not ( = ?auto_32002 ?auto_32004 ) ) ( not ( = ?auto_31987 ?auto_32004 ) ) ( not ( = ?auto_31981 ?auto_32004 ) ) ( not ( = ?auto_31992 ?auto_32004 ) ) ( not ( = ?auto_31991 ?auto_32004 ) ) ( not ( = ?auto_31990 ?auto_32004 ) ) ( not ( = ?auto_31998 ?auto_32004 ) ) ( not ( = ?auto_31984 ?auto_32004 ) ) ( not ( = ?auto_32003 ?auto_32004 ) ) ( TRUCK-AT ?auto_31995 ?auto_31999 ) )
    :subtasks
    ( ( !DRIVE ?auto_31995 ?auto_31999 ?auto_31979 )
      ( MAKE-ON ?auto_31977 ?auto_31978 )
      ( MAKE-ON-VERIFY ?auto_31977 ?auto_31978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32007 - SURFACE
      ?auto_32008 - SURFACE
    )
    :vars
    (
      ?auto_32009 - HOIST
      ?auto_32010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32009 ?auto_32010 ) ( SURFACE-AT ?auto_32008 ?auto_32010 ) ( CLEAR ?auto_32008 ) ( LIFTING ?auto_32009 ?auto_32007 ) ( IS-CRATE ?auto_32007 ) ( not ( = ?auto_32007 ?auto_32008 ) ) )
    :subtasks
    ( ( !DROP ?auto_32009 ?auto_32007 ?auto_32008 ?auto_32010 )
      ( MAKE-ON-VERIFY ?auto_32007 ?auto_32008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32011 - SURFACE
      ?auto_32012 - SURFACE
    )
    :vars
    (
      ?auto_32013 - HOIST
      ?auto_32014 - PLACE
      ?auto_32015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32013 ?auto_32014 ) ( SURFACE-AT ?auto_32012 ?auto_32014 ) ( CLEAR ?auto_32012 ) ( IS-CRATE ?auto_32011 ) ( not ( = ?auto_32011 ?auto_32012 ) ) ( TRUCK-AT ?auto_32015 ?auto_32014 ) ( AVAILABLE ?auto_32013 ) ( IN ?auto_32011 ?auto_32015 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32013 ?auto_32011 ?auto_32015 ?auto_32014 )
      ( MAKE-ON ?auto_32011 ?auto_32012 )
      ( MAKE-ON-VERIFY ?auto_32011 ?auto_32012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32016 - SURFACE
      ?auto_32017 - SURFACE
    )
    :vars
    (
      ?auto_32019 - HOIST
      ?auto_32020 - PLACE
      ?auto_32018 - TRUCK
      ?auto_32021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32019 ?auto_32020 ) ( SURFACE-AT ?auto_32017 ?auto_32020 ) ( CLEAR ?auto_32017 ) ( IS-CRATE ?auto_32016 ) ( not ( = ?auto_32016 ?auto_32017 ) ) ( AVAILABLE ?auto_32019 ) ( IN ?auto_32016 ?auto_32018 ) ( TRUCK-AT ?auto_32018 ?auto_32021 ) ( not ( = ?auto_32021 ?auto_32020 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32018 ?auto_32021 ?auto_32020 )
      ( MAKE-ON ?auto_32016 ?auto_32017 )
      ( MAKE-ON-VERIFY ?auto_32016 ?auto_32017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32022 - SURFACE
      ?auto_32023 - SURFACE
    )
    :vars
    (
      ?auto_32026 - HOIST
      ?auto_32024 - PLACE
      ?auto_32025 - TRUCK
      ?auto_32027 - PLACE
      ?auto_32028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32026 ?auto_32024 ) ( SURFACE-AT ?auto_32023 ?auto_32024 ) ( CLEAR ?auto_32023 ) ( IS-CRATE ?auto_32022 ) ( not ( = ?auto_32022 ?auto_32023 ) ) ( AVAILABLE ?auto_32026 ) ( TRUCK-AT ?auto_32025 ?auto_32027 ) ( not ( = ?auto_32027 ?auto_32024 ) ) ( HOIST-AT ?auto_32028 ?auto_32027 ) ( LIFTING ?auto_32028 ?auto_32022 ) ( not ( = ?auto_32026 ?auto_32028 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32028 ?auto_32022 ?auto_32025 ?auto_32027 )
      ( MAKE-ON ?auto_32022 ?auto_32023 )
      ( MAKE-ON-VERIFY ?auto_32022 ?auto_32023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32029 - SURFACE
      ?auto_32030 - SURFACE
    )
    :vars
    (
      ?auto_32032 - HOIST
      ?auto_32031 - PLACE
      ?auto_32033 - TRUCK
      ?auto_32034 - PLACE
      ?auto_32035 - HOIST
      ?auto_32036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32032 ?auto_32031 ) ( SURFACE-AT ?auto_32030 ?auto_32031 ) ( CLEAR ?auto_32030 ) ( IS-CRATE ?auto_32029 ) ( not ( = ?auto_32029 ?auto_32030 ) ) ( AVAILABLE ?auto_32032 ) ( TRUCK-AT ?auto_32033 ?auto_32034 ) ( not ( = ?auto_32034 ?auto_32031 ) ) ( HOIST-AT ?auto_32035 ?auto_32034 ) ( not ( = ?auto_32032 ?auto_32035 ) ) ( AVAILABLE ?auto_32035 ) ( SURFACE-AT ?auto_32029 ?auto_32034 ) ( ON ?auto_32029 ?auto_32036 ) ( CLEAR ?auto_32029 ) ( not ( = ?auto_32029 ?auto_32036 ) ) ( not ( = ?auto_32030 ?auto_32036 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32035 ?auto_32029 ?auto_32036 ?auto_32034 )
      ( MAKE-ON ?auto_32029 ?auto_32030 )
      ( MAKE-ON-VERIFY ?auto_32029 ?auto_32030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32037 - SURFACE
      ?auto_32038 - SURFACE
    )
    :vars
    (
      ?auto_32041 - HOIST
      ?auto_32044 - PLACE
      ?auto_32040 - PLACE
      ?auto_32039 - HOIST
      ?auto_32043 - SURFACE
      ?auto_32042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32041 ?auto_32044 ) ( SURFACE-AT ?auto_32038 ?auto_32044 ) ( CLEAR ?auto_32038 ) ( IS-CRATE ?auto_32037 ) ( not ( = ?auto_32037 ?auto_32038 ) ) ( AVAILABLE ?auto_32041 ) ( not ( = ?auto_32040 ?auto_32044 ) ) ( HOIST-AT ?auto_32039 ?auto_32040 ) ( not ( = ?auto_32041 ?auto_32039 ) ) ( AVAILABLE ?auto_32039 ) ( SURFACE-AT ?auto_32037 ?auto_32040 ) ( ON ?auto_32037 ?auto_32043 ) ( CLEAR ?auto_32037 ) ( not ( = ?auto_32037 ?auto_32043 ) ) ( not ( = ?auto_32038 ?auto_32043 ) ) ( TRUCK-AT ?auto_32042 ?auto_32044 ) )
    :subtasks
    ( ( !DRIVE ?auto_32042 ?auto_32044 ?auto_32040 )
      ( MAKE-ON ?auto_32037 ?auto_32038 )
      ( MAKE-ON-VERIFY ?auto_32037 ?auto_32038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32045 - SURFACE
      ?auto_32046 - SURFACE
    )
    :vars
    (
      ?auto_32048 - HOIST
      ?auto_32051 - PLACE
      ?auto_32050 - PLACE
      ?auto_32052 - HOIST
      ?auto_32049 - SURFACE
      ?auto_32047 - TRUCK
      ?auto_32053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32048 ?auto_32051 ) ( IS-CRATE ?auto_32045 ) ( not ( = ?auto_32045 ?auto_32046 ) ) ( not ( = ?auto_32050 ?auto_32051 ) ) ( HOIST-AT ?auto_32052 ?auto_32050 ) ( not ( = ?auto_32048 ?auto_32052 ) ) ( AVAILABLE ?auto_32052 ) ( SURFACE-AT ?auto_32045 ?auto_32050 ) ( ON ?auto_32045 ?auto_32049 ) ( CLEAR ?auto_32045 ) ( not ( = ?auto_32045 ?auto_32049 ) ) ( not ( = ?auto_32046 ?auto_32049 ) ) ( TRUCK-AT ?auto_32047 ?auto_32051 ) ( SURFACE-AT ?auto_32053 ?auto_32051 ) ( CLEAR ?auto_32053 ) ( LIFTING ?auto_32048 ?auto_32046 ) ( IS-CRATE ?auto_32046 ) ( not ( = ?auto_32045 ?auto_32053 ) ) ( not ( = ?auto_32046 ?auto_32053 ) ) ( not ( = ?auto_32049 ?auto_32053 ) ) )
    :subtasks
    ( ( !DROP ?auto_32048 ?auto_32046 ?auto_32053 ?auto_32051 )
      ( MAKE-ON ?auto_32045 ?auto_32046 )
      ( MAKE-ON-VERIFY ?auto_32045 ?auto_32046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32054 - SURFACE
      ?auto_32055 - SURFACE
    )
    :vars
    (
      ?auto_32057 - HOIST
      ?auto_32061 - PLACE
      ?auto_32056 - PLACE
      ?auto_32059 - HOIST
      ?auto_32060 - SURFACE
      ?auto_32058 - TRUCK
      ?auto_32062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32057 ?auto_32061 ) ( IS-CRATE ?auto_32054 ) ( not ( = ?auto_32054 ?auto_32055 ) ) ( not ( = ?auto_32056 ?auto_32061 ) ) ( HOIST-AT ?auto_32059 ?auto_32056 ) ( not ( = ?auto_32057 ?auto_32059 ) ) ( AVAILABLE ?auto_32059 ) ( SURFACE-AT ?auto_32054 ?auto_32056 ) ( ON ?auto_32054 ?auto_32060 ) ( CLEAR ?auto_32054 ) ( not ( = ?auto_32054 ?auto_32060 ) ) ( not ( = ?auto_32055 ?auto_32060 ) ) ( TRUCK-AT ?auto_32058 ?auto_32061 ) ( SURFACE-AT ?auto_32062 ?auto_32061 ) ( CLEAR ?auto_32062 ) ( IS-CRATE ?auto_32055 ) ( not ( = ?auto_32054 ?auto_32062 ) ) ( not ( = ?auto_32055 ?auto_32062 ) ) ( not ( = ?auto_32060 ?auto_32062 ) ) ( AVAILABLE ?auto_32057 ) ( IN ?auto_32055 ?auto_32058 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32057 ?auto_32055 ?auto_32058 ?auto_32061 )
      ( MAKE-ON ?auto_32054 ?auto_32055 )
      ( MAKE-ON-VERIFY ?auto_32054 ?auto_32055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32063 - SURFACE
      ?auto_32064 - SURFACE
    )
    :vars
    (
      ?auto_32067 - HOIST
      ?auto_32066 - PLACE
      ?auto_32068 - PLACE
      ?auto_32065 - HOIST
      ?auto_32070 - SURFACE
      ?auto_32071 - SURFACE
      ?auto_32069 - TRUCK
      ?auto_32072 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32067 ?auto_32066 ) ( IS-CRATE ?auto_32063 ) ( not ( = ?auto_32063 ?auto_32064 ) ) ( not ( = ?auto_32068 ?auto_32066 ) ) ( HOIST-AT ?auto_32065 ?auto_32068 ) ( not ( = ?auto_32067 ?auto_32065 ) ) ( AVAILABLE ?auto_32065 ) ( SURFACE-AT ?auto_32063 ?auto_32068 ) ( ON ?auto_32063 ?auto_32070 ) ( CLEAR ?auto_32063 ) ( not ( = ?auto_32063 ?auto_32070 ) ) ( not ( = ?auto_32064 ?auto_32070 ) ) ( SURFACE-AT ?auto_32071 ?auto_32066 ) ( CLEAR ?auto_32071 ) ( IS-CRATE ?auto_32064 ) ( not ( = ?auto_32063 ?auto_32071 ) ) ( not ( = ?auto_32064 ?auto_32071 ) ) ( not ( = ?auto_32070 ?auto_32071 ) ) ( AVAILABLE ?auto_32067 ) ( IN ?auto_32064 ?auto_32069 ) ( TRUCK-AT ?auto_32069 ?auto_32072 ) ( not ( = ?auto_32072 ?auto_32066 ) ) ( not ( = ?auto_32068 ?auto_32072 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32069 ?auto_32072 ?auto_32066 )
      ( MAKE-ON ?auto_32063 ?auto_32064 )
      ( MAKE-ON-VERIFY ?auto_32063 ?auto_32064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32073 - SURFACE
      ?auto_32074 - SURFACE
    )
    :vars
    (
      ?auto_32077 - HOIST
      ?auto_32076 - PLACE
      ?auto_32078 - PLACE
      ?auto_32082 - HOIST
      ?auto_32080 - SURFACE
      ?auto_32075 - SURFACE
      ?auto_32079 - TRUCK
      ?auto_32081 - PLACE
      ?auto_32083 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32077 ?auto_32076 ) ( IS-CRATE ?auto_32073 ) ( not ( = ?auto_32073 ?auto_32074 ) ) ( not ( = ?auto_32078 ?auto_32076 ) ) ( HOIST-AT ?auto_32082 ?auto_32078 ) ( not ( = ?auto_32077 ?auto_32082 ) ) ( AVAILABLE ?auto_32082 ) ( SURFACE-AT ?auto_32073 ?auto_32078 ) ( ON ?auto_32073 ?auto_32080 ) ( CLEAR ?auto_32073 ) ( not ( = ?auto_32073 ?auto_32080 ) ) ( not ( = ?auto_32074 ?auto_32080 ) ) ( SURFACE-AT ?auto_32075 ?auto_32076 ) ( CLEAR ?auto_32075 ) ( IS-CRATE ?auto_32074 ) ( not ( = ?auto_32073 ?auto_32075 ) ) ( not ( = ?auto_32074 ?auto_32075 ) ) ( not ( = ?auto_32080 ?auto_32075 ) ) ( AVAILABLE ?auto_32077 ) ( TRUCK-AT ?auto_32079 ?auto_32081 ) ( not ( = ?auto_32081 ?auto_32076 ) ) ( not ( = ?auto_32078 ?auto_32081 ) ) ( HOIST-AT ?auto_32083 ?auto_32081 ) ( LIFTING ?auto_32083 ?auto_32074 ) ( not ( = ?auto_32077 ?auto_32083 ) ) ( not ( = ?auto_32082 ?auto_32083 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32083 ?auto_32074 ?auto_32079 ?auto_32081 )
      ( MAKE-ON ?auto_32073 ?auto_32074 )
      ( MAKE-ON-VERIFY ?auto_32073 ?auto_32074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32084 - SURFACE
      ?auto_32085 - SURFACE
    )
    :vars
    (
      ?auto_32089 - HOIST
      ?auto_32092 - PLACE
      ?auto_32087 - PLACE
      ?auto_32086 - HOIST
      ?auto_32090 - SURFACE
      ?auto_32094 - SURFACE
      ?auto_32091 - TRUCK
      ?auto_32088 - PLACE
      ?auto_32093 - HOIST
      ?auto_32095 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32089 ?auto_32092 ) ( IS-CRATE ?auto_32084 ) ( not ( = ?auto_32084 ?auto_32085 ) ) ( not ( = ?auto_32087 ?auto_32092 ) ) ( HOIST-AT ?auto_32086 ?auto_32087 ) ( not ( = ?auto_32089 ?auto_32086 ) ) ( AVAILABLE ?auto_32086 ) ( SURFACE-AT ?auto_32084 ?auto_32087 ) ( ON ?auto_32084 ?auto_32090 ) ( CLEAR ?auto_32084 ) ( not ( = ?auto_32084 ?auto_32090 ) ) ( not ( = ?auto_32085 ?auto_32090 ) ) ( SURFACE-AT ?auto_32094 ?auto_32092 ) ( CLEAR ?auto_32094 ) ( IS-CRATE ?auto_32085 ) ( not ( = ?auto_32084 ?auto_32094 ) ) ( not ( = ?auto_32085 ?auto_32094 ) ) ( not ( = ?auto_32090 ?auto_32094 ) ) ( AVAILABLE ?auto_32089 ) ( TRUCK-AT ?auto_32091 ?auto_32088 ) ( not ( = ?auto_32088 ?auto_32092 ) ) ( not ( = ?auto_32087 ?auto_32088 ) ) ( HOIST-AT ?auto_32093 ?auto_32088 ) ( not ( = ?auto_32089 ?auto_32093 ) ) ( not ( = ?auto_32086 ?auto_32093 ) ) ( AVAILABLE ?auto_32093 ) ( SURFACE-AT ?auto_32085 ?auto_32088 ) ( ON ?auto_32085 ?auto_32095 ) ( CLEAR ?auto_32085 ) ( not ( = ?auto_32084 ?auto_32095 ) ) ( not ( = ?auto_32085 ?auto_32095 ) ) ( not ( = ?auto_32090 ?auto_32095 ) ) ( not ( = ?auto_32094 ?auto_32095 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32093 ?auto_32085 ?auto_32095 ?auto_32088 )
      ( MAKE-ON ?auto_32084 ?auto_32085 )
      ( MAKE-ON-VERIFY ?auto_32084 ?auto_32085 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32096 - SURFACE
      ?auto_32097 - SURFACE
    )
    :vars
    (
      ?auto_32100 - HOIST
      ?auto_32106 - PLACE
      ?auto_32103 - PLACE
      ?auto_32101 - HOIST
      ?auto_32098 - SURFACE
      ?auto_32102 - SURFACE
      ?auto_32105 - PLACE
      ?auto_32104 - HOIST
      ?auto_32107 - SURFACE
      ?auto_32099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32100 ?auto_32106 ) ( IS-CRATE ?auto_32096 ) ( not ( = ?auto_32096 ?auto_32097 ) ) ( not ( = ?auto_32103 ?auto_32106 ) ) ( HOIST-AT ?auto_32101 ?auto_32103 ) ( not ( = ?auto_32100 ?auto_32101 ) ) ( AVAILABLE ?auto_32101 ) ( SURFACE-AT ?auto_32096 ?auto_32103 ) ( ON ?auto_32096 ?auto_32098 ) ( CLEAR ?auto_32096 ) ( not ( = ?auto_32096 ?auto_32098 ) ) ( not ( = ?auto_32097 ?auto_32098 ) ) ( SURFACE-AT ?auto_32102 ?auto_32106 ) ( CLEAR ?auto_32102 ) ( IS-CRATE ?auto_32097 ) ( not ( = ?auto_32096 ?auto_32102 ) ) ( not ( = ?auto_32097 ?auto_32102 ) ) ( not ( = ?auto_32098 ?auto_32102 ) ) ( AVAILABLE ?auto_32100 ) ( not ( = ?auto_32105 ?auto_32106 ) ) ( not ( = ?auto_32103 ?auto_32105 ) ) ( HOIST-AT ?auto_32104 ?auto_32105 ) ( not ( = ?auto_32100 ?auto_32104 ) ) ( not ( = ?auto_32101 ?auto_32104 ) ) ( AVAILABLE ?auto_32104 ) ( SURFACE-AT ?auto_32097 ?auto_32105 ) ( ON ?auto_32097 ?auto_32107 ) ( CLEAR ?auto_32097 ) ( not ( = ?auto_32096 ?auto_32107 ) ) ( not ( = ?auto_32097 ?auto_32107 ) ) ( not ( = ?auto_32098 ?auto_32107 ) ) ( not ( = ?auto_32102 ?auto_32107 ) ) ( TRUCK-AT ?auto_32099 ?auto_32106 ) )
    :subtasks
    ( ( !DRIVE ?auto_32099 ?auto_32106 ?auto_32105 )
      ( MAKE-ON ?auto_32096 ?auto_32097 )
      ( MAKE-ON-VERIFY ?auto_32096 ?auto_32097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32108 - SURFACE
      ?auto_32109 - SURFACE
    )
    :vars
    (
      ?auto_32115 - HOIST
      ?auto_32119 - PLACE
      ?auto_32111 - PLACE
      ?auto_32113 - HOIST
      ?auto_32112 - SURFACE
      ?auto_32110 - SURFACE
      ?auto_32114 - PLACE
      ?auto_32118 - HOIST
      ?auto_32117 - SURFACE
      ?auto_32116 - TRUCK
      ?auto_32120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32115 ?auto_32119 ) ( IS-CRATE ?auto_32108 ) ( not ( = ?auto_32108 ?auto_32109 ) ) ( not ( = ?auto_32111 ?auto_32119 ) ) ( HOIST-AT ?auto_32113 ?auto_32111 ) ( not ( = ?auto_32115 ?auto_32113 ) ) ( AVAILABLE ?auto_32113 ) ( SURFACE-AT ?auto_32108 ?auto_32111 ) ( ON ?auto_32108 ?auto_32112 ) ( CLEAR ?auto_32108 ) ( not ( = ?auto_32108 ?auto_32112 ) ) ( not ( = ?auto_32109 ?auto_32112 ) ) ( IS-CRATE ?auto_32109 ) ( not ( = ?auto_32108 ?auto_32110 ) ) ( not ( = ?auto_32109 ?auto_32110 ) ) ( not ( = ?auto_32112 ?auto_32110 ) ) ( not ( = ?auto_32114 ?auto_32119 ) ) ( not ( = ?auto_32111 ?auto_32114 ) ) ( HOIST-AT ?auto_32118 ?auto_32114 ) ( not ( = ?auto_32115 ?auto_32118 ) ) ( not ( = ?auto_32113 ?auto_32118 ) ) ( AVAILABLE ?auto_32118 ) ( SURFACE-AT ?auto_32109 ?auto_32114 ) ( ON ?auto_32109 ?auto_32117 ) ( CLEAR ?auto_32109 ) ( not ( = ?auto_32108 ?auto_32117 ) ) ( not ( = ?auto_32109 ?auto_32117 ) ) ( not ( = ?auto_32112 ?auto_32117 ) ) ( not ( = ?auto_32110 ?auto_32117 ) ) ( TRUCK-AT ?auto_32116 ?auto_32119 ) ( SURFACE-AT ?auto_32120 ?auto_32119 ) ( CLEAR ?auto_32120 ) ( LIFTING ?auto_32115 ?auto_32110 ) ( IS-CRATE ?auto_32110 ) ( not ( = ?auto_32108 ?auto_32120 ) ) ( not ( = ?auto_32109 ?auto_32120 ) ) ( not ( = ?auto_32112 ?auto_32120 ) ) ( not ( = ?auto_32110 ?auto_32120 ) ) ( not ( = ?auto_32117 ?auto_32120 ) ) )
    :subtasks
    ( ( !DROP ?auto_32115 ?auto_32110 ?auto_32120 ?auto_32119 )
      ( MAKE-ON ?auto_32108 ?auto_32109 )
      ( MAKE-ON-VERIFY ?auto_32108 ?auto_32109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32121 - SURFACE
      ?auto_32122 - SURFACE
    )
    :vars
    (
      ?auto_32127 - HOIST
      ?auto_32125 - PLACE
      ?auto_32128 - PLACE
      ?auto_32129 - HOIST
      ?auto_32123 - SURFACE
      ?auto_32132 - SURFACE
      ?auto_32130 - PLACE
      ?auto_32131 - HOIST
      ?auto_32124 - SURFACE
      ?auto_32126 - TRUCK
      ?auto_32133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32127 ?auto_32125 ) ( IS-CRATE ?auto_32121 ) ( not ( = ?auto_32121 ?auto_32122 ) ) ( not ( = ?auto_32128 ?auto_32125 ) ) ( HOIST-AT ?auto_32129 ?auto_32128 ) ( not ( = ?auto_32127 ?auto_32129 ) ) ( AVAILABLE ?auto_32129 ) ( SURFACE-AT ?auto_32121 ?auto_32128 ) ( ON ?auto_32121 ?auto_32123 ) ( CLEAR ?auto_32121 ) ( not ( = ?auto_32121 ?auto_32123 ) ) ( not ( = ?auto_32122 ?auto_32123 ) ) ( IS-CRATE ?auto_32122 ) ( not ( = ?auto_32121 ?auto_32132 ) ) ( not ( = ?auto_32122 ?auto_32132 ) ) ( not ( = ?auto_32123 ?auto_32132 ) ) ( not ( = ?auto_32130 ?auto_32125 ) ) ( not ( = ?auto_32128 ?auto_32130 ) ) ( HOIST-AT ?auto_32131 ?auto_32130 ) ( not ( = ?auto_32127 ?auto_32131 ) ) ( not ( = ?auto_32129 ?auto_32131 ) ) ( AVAILABLE ?auto_32131 ) ( SURFACE-AT ?auto_32122 ?auto_32130 ) ( ON ?auto_32122 ?auto_32124 ) ( CLEAR ?auto_32122 ) ( not ( = ?auto_32121 ?auto_32124 ) ) ( not ( = ?auto_32122 ?auto_32124 ) ) ( not ( = ?auto_32123 ?auto_32124 ) ) ( not ( = ?auto_32132 ?auto_32124 ) ) ( TRUCK-AT ?auto_32126 ?auto_32125 ) ( SURFACE-AT ?auto_32133 ?auto_32125 ) ( CLEAR ?auto_32133 ) ( IS-CRATE ?auto_32132 ) ( not ( = ?auto_32121 ?auto_32133 ) ) ( not ( = ?auto_32122 ?auto_32133 ) ) ( not ( = ?auto_32123 ?auto_32133 ) ) ( not ( = ?auto_32132 ?auto_32133 ) ) ( not ( = ?auto_32124 ?auto_32133 ) ) ( AVAILABLE ?auto_32127 ) ( IN ?auto_32132 ?auto_32126 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32127 ?auto_32132 ?auto_32126 ?auto_32125 )
      ( MAKE-ON ?auto_32121 ?auto_32122 )
      ( MAKE-ON-VERIFY ?auto_32121 ?auto_32122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32134 - SURFACE
      ?auto_32135 - SURFACE
    )
    :vars
    (
      ?auto_32140 - HOIST
      ?auto_32136 - PLACE
      ?auto_32137 - PLACE
      ?auto_32143 - HOIST
      ?auto_32146 - SURFACE
      ?auto_32144 - SURFACE
      ?auto_32145 - PLACE
      ?auto_32142 - HOIST
      ?auto_32139 - SURFACE
      ?auto_32141 - SURFACE
      ?auto_32138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32140 ?auto_32136 ) ( IS-CRATE ?auto_32134 ) ( not ( = ?auto_32134 ?auto_32135 ) ) ( not ( = ?auto_32137 ?auto_32136 ) ) ( HOIST-AT ?auto_32143 ?auto_32137 ) ( not ( = ?auto_32140 ?auto_32143 ) ) ( AVAILABLE ?auto_32143 ) ( SURFACE-AT ?auto_32134 ?auto_32137 ) ( ON ?auto_32134 ?auto_32146 ) ( CLEAR ?auto_32134 ) ( not ( = ?auto_32134 ?auto_32146 ) ) ( not ( = ?auto_32135 ?auto_32146 ) ) ( IS-CRATE ?auto_32135 ) ( not ( = ?auto_32134 ?auto_32144 ) ) ( not ( = ?auto_32135 ?auto_32144 ) ) ( not ( = ?auto_32146 ?auto_32144 ) ) ( not ( = ?auto_32145 ?auto_32136 ) ) ( not ( = ?auto_32137 ?auto_32145 ) ) ( HOIST-AT ?auto_32142 ?auto_32145 ) ( not ( = ?auto_32140 ?auto_32142 ) ) ( not ( = ?auto_32143 ?auto_32142 ) ) ( AVAILABLE ?auto_32142 ) ( SURFACE-AT ?auto_32135 ?auto_32145 ) ( ON ?auto_32135 ?auto_32139 ) ( CLEAR ?auto_32135 ) ( not ( = ?auto_32134 ?auto_32139 ) ) ( not ( = ?auto_32135 ?auto_32139 ) ) ( not ( = ?auto_32146 ?auto_32139 ) ) ( not ( = ?auto_32144 ?auto_32139 ) ) ( SURFACE-AT ?auto_32141 ?auto_32136 ) ( CLEAR ?auto_32141 ) ( IS-CRATE ?auto_32144 ) ( not ( = ?auto_32134 ?auto_32141 ) ) ( not ( = ?auto_32135 ?auto_32141 ) ) ( not ( = ?auto_32146 ?auto_32141 ) ) ( not ( = ?auto_32144 ?auto_32141 ) ) ( not ( = ?auto_32139 ?auto_32141 ) ) ( AVAILABLE ?auto_32140 ) ( IN ?auto_32144 ?auto_32138 ) ( TRUCK-AT ?auto_32138 ?auto_32145 ) )
    :subtasks
    ( ( !DRIVE ?auto_32138 ?auto_32145 ?auto_32136 )
      ( MAKE-ON ?auto_32134 ?auto_32135 )
      ( MAKE-ON-VERIFY ?auto_32134 ?auto_32135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32147 - SURFACE
      ?auto_32148 - SURFACE
    )
    :vars
    (
      ?auto_32156 - HOIST
      ?auto_32149 - PLACE
      ?auto_32152 - PLACE
      ?auto_32150 - HOIST
      ?auto_32154 - SURFACE
      ?auto_32151 - SURFACE
      ?auto_32157 - PLACE
      ?auto_32159 - HOIST
      ?auto_32153 - SURFACE
      ?auto_32155 - SURFACE
      ?auto_32158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32156 ?auto_32149 ) ( IS-CRATE ?auto_32147 ) ( not ( = ?auto_32147 ?auto_32148 ) ) ( not ( = ?auto_32152 ?auto_32149 ) ) ( HOIST-AT ?auto_32150 ?auto_32152 ) ( not ( = ?auto_32156 ?auto_32150 ) ) ( AVAILABLE ?auto_32150 ) ( SURFACE-AT ?auto_32147 ?auto_32152 ) ( ON ?auto_32147 ?auto_32154 ) ( CLEAR ?auto_32147 ) ( not ( = ?auto_32147 ?auto_32154 ) ) ( not ( = ?auto_32148 ?auto_32154 ) ) ( IS-CRATE ?auto_32148 ) ( not ( = ?auto_32147 ?auto_32151 ) ) ( not ( = ?auto_32148 ?auto_32151 ) ) ( not ( = ?auto_32154 ?auto_32151 ) ) ( not ( = ?auto_32157 ?auto_32149 ) ) ( not ( = ?auto_32152 ?auto_32157 ) ) ( HOIST-AT ?auto_32159 ?auto_32157 ) ( not ( = ?auto_32156 ?auto_32159 ) ) ( not ( = ?auto_32150 ?auto_32159 ) ) ( SURFACE-AT ?auto_32148 ?auto_32157 ) ( ON ?auto_32148 ?auto_32153 ) ( CLEAR ?auto_32148 ) ( not ( = ?auto_32147 ?auto_32153 ) ) ( not ( = ?auto_32148 ?auto_32153 ) ) ( not ( = ?auto_32154 ?auto_32153 ) ) ( not ( = ?auto_32151 ?auto_32153 ) ) ( SURFACE-AT ?auto_32155 ?auto_32149 ) ( CLEAR ?auto_32155 ) ( IS-CRATE ?auto_32151 ) ( not ( = ?auto_32147 ?auto_32155 ) ) ( not ( = ?auto_32148 ?auto_32155 ) ) ( not ( = ?auto_32154 ?auto_32155 ) ) ( not ( = ?auto_32151 ?auto_32155 ) ) ( not ( = ?auto_32153 ?auto_32155 ) ) ( AVAILABLE ?auto_32156 ) ( TRUCK-AT ?auto_32158 ?auto_32157 ) ( LIFTING ?auto_32159 ?auto_32151 ) )
    :subtasks
    ( ( !LOAD ?auto_32159 ?auto_32151 ?auto_32158 ?auto_32157 )
      ( MAKE-ON ?auto_32147 ?auto_32148 )
      ( MAKE-ON-VERIFY ?auto_32147 ?auto_32148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32160 - SURFACE
      ?auto_32161 - SURFACE
    )
    :vars
    (
      ?auto_32166 - HOIST
      ?auto_32172 - PLACE
      ?auto_32165 - PLACE
      ?auto_32167 - HOIST
      ?auto_32169 - SURFACE
      ?auto_32168 - SURFACE
      ?auto_32171 - PLACE
      ?auto_32162 - HOIST
      ?auto_32164 - SURFACE
      ?auto_32170 - SURFACE
      ?auto_32163 - TRUCK
      ?auto_32173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32166 ?auto_32172 ) ( IS-CRATE ?auto_32160 ) ( not ( = ?auto_32160 ?auto_32161 ) ) ( not ( = ?auto_32165 ?auto_32172 ) ) ( HOIST-AT ?auto_32167 ?auto_32165 ) ( not ( = ?auto_32166 ?auto_32167 ) ) ( AVAILABLE ?auto_32167 ) ( SURFACE-AT ?auto_32160 ?auto_32165 ) ( ON ?auto_32160 ?auto_32169 ) ( CLEAR ?auto_32160 ) ( not ( = ?auto_32160 ?auto_32169 ) ) ( not ( = ?auto_32161 ?auto_32169 ) ) ( IS-CRATE ?auto_32161 ) ( not ( = ?auto_32160 ?auto_32168 ) ) ( not ( = ?auto_32161 ?auto_32168 ) ) ( not ( = ?auto_32169 ?auto_32168 ) ) ( not ( = ?auto_32171 ?auto_32172 ) ) ( not ( = ?auto_32165 ?auto_32171 ) ) ( HOIST-AT ?auto_32162 ?auto_32171 ) ( not ( = ?auto_32166 ?auto_32162 ) ) ( not ( = ?auto_32167 ?auto_32162 ) ) ( SURFACE-AT ?auto_32161 ?auto_32171 ) ( ON ?auto_32161 ?auto_32164 ) ( CLEAR ?auto_32161 ) ( not ( = ?auto_32160 ?auto_32164 ) ) ( not ( = ?auto_32161 ?auto_32164 ) ) ( not ( = ?auto_32169 ?auto_32164 ) ) ( not ( = ?auto_32168 ?auto_32164 ) ) ( SURFACE-AT ?auto_32170 ?auto_32172 ) ( CLEAR ?auto_32170 ) ( IS-CRATE ?auto_32168 ) ( not ( = ?auto_32160 ?auto_32170 ) ) ( not ( = ?auto_32161 ?auto_32170 ) ) ( not ( = ?auto_32169 ?auto_32170 ) ) ( not ( = ?auto_32168 ?auto_32170 ) ) ( not ( = ?auto_32164 ?auto_32170 ) ) ( AVAILABLE ?auto_32166 ) ( TRUCK-AT ?auto_32163 ?auto_32171 ) ( AVAILABLE ?auto_32162 ) ( SURFACE-AT ?auto_32168 ?auto_32171 ) ( ON ?auto_32168 ?auto_32173 ) ( CLEAR ?auto_32168 ) ( not ( = ?auto_32160 ?auto_32173 ) ) ( not ( = ?auto_32161 ?auto_32173 ) ) ( not ( = ?auto_32169 ?auto_32173 ) ) ( not ( = ?auto_32168 ?auto_32173 ) ) ( not ( = ?auto_32164 ?auto_32173 ) ) ( not ( = ?auto_32170 ?auto_32173 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32162 ?auto_32168 ?auto_32173 ?auto_32171 )
      ( MAKE-ON ?auto_32160 ?auto_32161 )
      ( MAKE-ON-VERIFY ?auto_32160 ?auto_32161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32174 - SURFACE
      ?auto_32175 - SURFACE
    )
    :vars
    (
      ?auto_32176 - HOIST
      ?auto_32180 - PLACE
      ?auto_32181 - PLACE
      ?auto_32178 - HOIST
      ?auto_32184 - SURFACE
      ?auto_32182 - SURFACE
      ?auto_32179 - PLACE
      ?auto_32186 - HOIST
      ?auto_32183 - SURFACE
      ?auto_32185 - SURFACE
      ?auto_32187 - SURFACE
      ?auto_32177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32176 ?auto_32180 ) ( IS-CRATE ?auto_32174 ) ( not ( = ?auto_32174 ?auto_32175 ) ) ( not ( = ?auto_32181 ?auto_32180 ) ) ( HOIST-AT ?auto_32178 ?auto_32181 ) ( not ( = ?auto_32176 ?auto_32178 ) ) ( AVAILABLE ?auto_32178 ) ( SURFACE-AT ?auto_32174 ?auto_32181 ) ( ON ?auto_32174 ?auto_32184 ) ( CLEAR ?auto_32174 ) ( not ( = ?auto_32174 ?auto_32184 ) ) ( not ( = ?auto_32175 ?auto_32184 ) ) ( IS-CRATE ?auto_32175 ) ( not ( = ?auto_32174 ?auto_32182 ) ) ( not ( = ?auto_32175 ?auto_32182 ) ) ( not ( = ?auto_32184 ?auto_32182 ) ) ( not ( = ?auto_32179 ?auto_32180 ) ) ( not ( = ?auto_32181 ?auto_32179 ) ) ( HOIST-AT ?auto_32186 ?auto_32179 ) ( not ( = ?auto_32176 ?auto_32186 ) ) ( not ( = ?auto_32178 ?auto_32186 ) ) ( SURFACE-AT ?auto_32175 ?auto_32179 ) ( ON ?auto_32175 ?auto_32183 ) ( CLEAR ?auto_32175 ) ( not ( = ?auto_32174 ?auto_32183 ) ) ( not ( = ?auto_32175 ?auto_32183 ) ) ( not ( = ?auto_32184 ?auto_32183 ) ) ( not ( = ?auto_32182 ?auto_32183 ) ) ( SURFACE-AT ?auto_32185 ?auto_32180 ) ( CLEAR ?auto_32185 ) ( IS-CRATE ?auto_32182 ) ( not ( = ?auto_32174 ?auto_32185 ) ) ( not ( = ?auto_32175 ?auto_32185 ) ) ( not ( = ?auto_32184 ?auto_32185 ) ) ( not ( = ?auto_32182 ?auto_32185 ) ) ( not ( = ?auto_32183 ?auto_32185 ) ) ( AVAILABLE ?auto_32176 ) ( AVAILABLE ?auto_32186 ) ( SURFACE-AT ?auto_32182 ?auto_32179 ) ( ON ?auto_32182 ?auto_32187 ) ( CLEAR ?auto_32182 ) ( not ( = ?auto_32174 ?auto_32187 ) ) ( not ( = ?auto_32175 ?auto_32187 ) ) ( not ( = ?auto_32184 ?auto_32187 ) ) ( not ( = ?auto_32182 ?auto_32187 ) ) ( not ( = ?auto_32183 ?auto_32187 ) ) ( not ( = ?auto_32185 ?auto_32187 ) ) ( TRUCK-AT ?auto_32177 ?auto_32180 ) )
    :subtasks
    ( ( !DRIVE ?auto_32177 ?auto_32180 ?auto_32179 )
      ( MAKE-ON ?auto_32174 ?auto_32175 )
      ( MAKE-ON-VERIFY ?auto_32174 ?auto_32175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32188 - SURFACE
      ?auto_32189 - SURFACE
    )
    :vars
    (
      ?auto_32201 - HOIST
      ?auto_32194 - PLACE
      ?auto_32195 - PLACE
      ?auto_32196 - HOIST
      ?auto_32192 - SURFACE
      ?auto_32197 - SURFACE
      ?auto_32200 - PLACE
      ?auto_32190 - HOIST
      ?auto_32191 - SURFACE
      ?auto_32193 - SURFACE
      ?auto_32198 - SURFACE
      ?auto_32199 - TRUCK
      ?auto_32202 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32201 ?auto_32194 ) ( IS-CRATE ?auto_32188 ) ( not ( = ?auto_32188 ?auto_32189 ) ) ( not ( = ?auto_32195 ?auto_32194 ) ) ( HOIST-AT ?auto_32196 ?auto_32195 ) ( not ( = ?auto_32201 ?auto_32196 ) ) ( AVAILABLE ?auto_32196 ) ( SURFACE-AT ?auto_32188 ?auto_32195 ) ( ON ?auto_32188 ?auto_32192 ) ( CLEAR ?auto_32188 ) ( not ( = ?auto_32188 ?auto_32192 ) ) ( not ( = ?auto_32189 ?auto_32192 ) ) ( IS-CRATE ?auto_32189 ) ( not ( = ?auto_32188 ?auto_32197 ) ) ( not ( = ?auto_32189 ?auto_32197 ) ) ( not ( = ?auto_32192 ?auto_32197 ) ) ( not ( = ?auto_32200 ?auto_32194 ) ) ( not ( = ?auto_32195 ?auto_32200 ) ) ( HOIST-AT ?auto_32190 ?auto_32200 ) ( not ( = ?auto_32201 ?auto_32190 ) ) ( not ( = ?auto_32196 ?auto_32190 ) ) ( SURFACE-AT ?auto_32189 ?auto_32200 ) ( ON ?auto_32189 ?auto_32191 ) ( CLEAR ?auto_32189 ) ( not ( = ?auto_32188 ?auto_32191 ) ) ( not ( = ?auto_32189 ?auto_32191 ) ) ( not ( = ?auto_32192 ?auto_32191 ) ) ( not ( = ?auto_32197 ?auto_32191 ) ) ( IS-CRATE ?auto_32197 ) ( not ( = ?auto_32188 ?auto_32193 ) ) ( not ( = ?auto_32189 ?auto_32193 ) ) ( not ( = ?auto_32192 ?auto_32193 ) ) ( not ( = ?auto_32197 ?auto_32193 ) ) ( not ( = ?auto_32191 ?auto_32193 ) ) ( AVAILABLE ?auto_32190 ) ( SURFACE-AT ?auto_32197 ?auto_32200 ) ( ON ?auto_32197 ?auto_32198 ) ( CLEAR ?auto_32197 ) ( not ( = ?auto_32188 ?auto_32198 ) ) ( not ( = ?auto_32189 ?auto_32198 ) ) ( not ( = ?auto_32192 ?auto_32198 ) ) ( not ( = ?auto_32197 ?auto_32198 ) ) ( not ( = ?auto_32191 ?auto_32198 ) ) ( not ( = ?auto_32193 ?auto_32198 ) ) ( TRUCK-AT ?auto_32199 ?auto_32194 ) ( SURFACE-AT ?auto_32202 ?auto_32194 ) ( CLEAR ?auto_32202 ) ( LIFTING ?auto_32201 ?auto_32193 ) ( IS-CRATE ?auto_32193 ) ( not ( = ?auto_32188 ?auto_32202 ) ) ( not ( = ?auto_32189 ?auto_32202 ) ) ( not ( = ?auto_32192 ?auto_32202 ) ) ( not ( = ?auto_32197 ?auto_32202 ) ) ( not ( = ?auto_32191 ?auto_32202 ) ) ( not ( = ?auto_32193 ?auto_32202 ) ) ( not ( = ?auto_32198 ?auto_32202 ) ) )
    :subtasks
    ( ( !DROP ?auto_32201 ?auto_32193 ?auto_32202 ?auto_32194 )
      ( MAKE-ON ?auto_32188 ?auto_32189 )
      ( MAKE-ON-VERIFY ?auto_32188 ?auto_32189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32203 - SURFACE
      ?auto_32204 - SURFACE
    )
    :vars
    (
      ?auto_32208 - HOIST
      ?auto_32216 - PLACE
      ?auto_32215 - PLACE
      ?auto_32209 - HOIST
      ?auto_32206 - SURFACE
      ?auto_32212 - SURFACE
      ?auto_32210 - PLACE
      ?auto_32207 - HOIST
      ?auto_32213 - SURFACE
      ?auto_32214 - SURFACE
      ?auto_32211 - SURFACE
      ?auto_32205 - TRUCK
      ?auto_32217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32208 ?auto_32216 ) ( IS-CRATE ?auto_32203 ) ( not ( = ?auto_32203 ?auto_32204 ) ) ( not ( = ?auto_32215 ?auto_32216 ) ) ( HOIST-AT ?auto_32209 ?auto_32215 ) ( not ( = ?auto_32208 ?auto_32209 ) ) ( AVAILABLE ?auto_32209 ) ( SURFACE-AT ?auto_32203 ?auto_32215 ) ( ON ?auto_32203 ?auto_32206 ) ( CLEAR ?auto_32203 ) ( not ( = ?auto_32203 ?auto_32206 ) ) ( not ( = ?auto_32204 ?auto_32206 ) ) ( IS-CRATE ?auto_32204 ) ( not ( = ?auto_32203 ?auto_32212 ) ) ( not ( = ?auto_32204 ?auto_32212 ) ) ( not ( = ?auto_32206 ?auto_32212 ) ) ( not ( = ?auto_32210 ?auto_32216 ) ) ( not ( = ?auto_32215 ?auto_32210 ) ) ( HOIST-AT ?auto_32207 ?auto_32210 ) ( not ( = ?auto_32208 ?auto_32207 ) ) ( not ( = ?auto_32209 ?auto_32207 ) ) ( SURFACE-AT ?auto_32204 ?auto_32210 ) ( ON ?auto_32204 ?auto_32213 ) ( CLEAR ?auto_32204 ) ( not ( = ?auto_32203 ?auto_32213 ) ) ( not ( = ?auto_32204 ?auto_32213 ) ) ( not ( = ?auto_32206 ?auto_32213 ) ) ( not ( = ?auto_32212 ?auto_32213 ) ) ( IS-CRATE ?auto_32212 ) ( not ( = ?auto_32203 ?auto_32214 ) ) ( not ( = ?auto_32204 ?auto_32214 ) ) ( not ( = ?auto_32206 ?auto_32214 ) ) ( not ( = ?auto_32212 ?auto_32214 ) ) ( not ( = ?auto_32213 ?auto_32214 ) ) ( AVAILABLE ?auto_32207 ) ( SURFACE-AT ?auto_32212 ?auto_32210 ) ( ON ?auto_32212 ?auto_32211 ) ( CLEAR ?auto_32212 ) ( not ( = ?auto_32203 ?auto_32211 ) ) ( not ( = ?auto_32204 ?auto_32211 ) ) ( not ( = ?auto_32206 ?auto_32211 ) ) ( not ( = ?auto_32212 ?auto_32211 ) ) ( not ( = ?auto_32213 ?auto_32211 ) ) ( not ( = ?auto_32214 ?auto_32211 ) ) ( TRUCK-AT ?auto_32205 ?auto_32216 ) ( SURFACE-AT ?auto_32217 ?auto_32216 ) ( CLEAR ?auto_32217 ) ( IS-CRATE ?auto_32214 ) ( not ( = ?auto_32203 ?auto_32217 ) ) ( not ( = ?auto_32204 ?auto_32217 ) ) ( not ( = ?auto_32206 ?auto_32217 ) ) ( not ( = ?auto_32212 ?auto_32217 ) ) ( not ( = ?auto_32213 ?auto_32217 ) ) ( not ( = ?auto_32214 ?auto_32217 ) ) ( not ( = ?auto_32211 ?auto_32217 ) ) ( AVAILABLE ?auto_32208 ) ( IN ?auto_32214 ?auto_32205 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32208 ?auto_32214 ?auto_32205 ?auto_32216 )
      ( MAKE-ON ?auto_32203 ?auto_32204 )
      ( MAKE-ON-VERIFY ?auto_32203 ?auto_32204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32218 - SURFACE
      ?auto_32219 - SURFACE
    )
    :vars
    (
      ?auto_32227 - HOIST
      ?auto_32228 - PLACE
      ?auto_32224 - PLACE
      ?auto_32225 - HOIST
      ?auto_32223 - SURFACE
      ?auto_32222 - SURFACE
      ?auto_32230 - PLACE
      ?auto_32229 - HOIST
      ?auto_32232 - SURFACE
      ?auto_32220 - SURFACE
      ?auto_32231 - SURFACE
      ?auto_32221 - SURFACE
      ?auto_32226 - TRUCK
      ?auto_32233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32227 ?auto_32228 ) ( IS-CRATE ?auto_32218 ) ( not ( = ?auto_32218 ?auto_32219 ) ) ( not ( = ?auto_32224 ?auto_32228 ) ) ( HOIST-AT ?auto_32225 ?auto_32224 ) ( not ( = ?auto_32227 ?auto_32225 ) ) ( AVAILABLE ?auto_32225 ) ( SURFACE-AT ?auto_32218 ?auto_32224 ) ( ON ?auto_32218 ?auto_32223 ) ( CLEAR ?auto_32218 ) ( not ( = ?auto_32218 ?auto_32223 ) ) ( not ( = ?auto_32219 ?auto_32223 ) ) ( IS-CRATE ?auto_32219 ) ( not ( = ?auto_32218 ?auto_32222 ) ) ( not ( = ?auto_32219 ?auto_32222 ) ) ( not ( = ?auto_32223 ?auto_32222 ) ) ( not ( = ?auto_32230 ?auto_32228 ) ) ( not ( = ?auto_32224 ?auto_32230 ) ) ( HOIST-AT ?auto_32229 ?auto_32230 ) ( not ( = ?auto_32227 ?auto_32229 ) ) ( not ( = ?auto_32225 ?auto_32229 ) ) ( SURFACE-AT ?auto_32219 ?auto_32230 ) ( ON ?auto_32219 ?auto_32232 ) ( CLEAR ?auto_32219 ) ( not ( = ?auto_32218 ?auto_32232 ) ) ( not ( = ?auto_32219 ?auto_32232 ) ) ( not ( = ?auto_32223 ?auto_32232 ) ) ( not ( = ?auto_32222 ?auto_32232 ) ) ( IS-CRATE ?auto_32222 ) ( not ( = ?auto_32218 ?auto_32220 ) ) ( not ( = ?auto_32219 ?auto_32220 ) ) ( not ( = ?auto_32223 ?auto_32220 ) ) ( not ( = ?auto_32222 ?auto_32220 ) ) ( not ( = ?auto_32232 ?auto_32220 ) ) ( AVAILABLE ?auto_32229 ) ( SURFACE-AT ?auto_32222 ?auto_32230 ) ( ON ?auto_32222 ?auto_32231 ) ( CLEAR ?auto_32222 ) ( not ( = ?auto_32218 ?auto_32231 ) ) ( not ( = ?auto_32219 ?auto_32231 ) ) ( not ( = ?auto_32223 ?auto_32231 ) ) ( not ( = ?auto_32222 ?auto_32231 ) ) ( not ( = ?auto_32232 ?auto_32231 ) ) ( not ( = ?auto_32220 ?auto_32231 ) ) ( SURFACE-AT ?auto_32221 ?auto_32228 ) ( CLEAR ?auto_32221 ) ( IS-CRATE ?auto_32220 ) ( not ( = ?auto_32218 ?auto_32221 ) ) ( not ( = ?auto_32219 ?auto_32221 ) ) ( not ( = ?auto_32223 ?auto_32221 ) ) ( not ( = ?auto_32222 ?auto_32221 ) ) ( not ( = ?auto_32232 ?auto_32221 ) ) ( not ( = ?auto_32220 ?auto_32221 ) ) ( not ( = ?auto_32231 ?auto_32221 ) ) ( AVAILABLE ?auto_32227 ) ( IN ?auto_32220 ?auto_32226 ) ( TRUCK-AT ?auto_32226 ?auto_32233 ) ( not ( = ?auto_32233 ?auto_32228 ) ) ( not ( = ?auto_32224 ?auto_32233 ) ) ( not ( = ?auto_32230 ?auto_32233 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32226 ?auto_32233 ?auto_32228 )
      ( MAKE-ON ?auto_32218 ?auto_32219 )
      ( MAKE-ON-VERIFY ?auto_32218 ?auto_32219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32234 - SURFACE
      ?auto_32235 - SURFACE
    )
    :vars
    (
      ?auto_32242 - HOIST
      ?auto_32247 - PLACE
      ?auto_32239 - PLACE
      ?auto_32243 - HOIST
      ?auto_32246 - SURFACE
      ?auto_32244 - SURFACE
      ?auto_32245 - PLACE
      ?auto_32240 - HOIST
      ?auto_32241 - SURFACE
      ?auto_32248 - SURFACE
      ?auto_32238 - SURFACE
      ?auto_32237 - SURFACE
      ?auto_32236 - TRUCK
      ?auto_32249 - PLACE
      ?auto_32250 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32242 ?auto_32247 ) ( IS-CRATE ?auto_32234 ) ( not ( = ?auto_32234 ?auto_32235 ) ) ( not ( = ?auto_32239 ?auto_32247 ) ) ( HOIST-AT ?auto_32243 ?auto_32239 ) ( not ( = ?auto_32242 ?auto_32243 ) ) ( AVAILABLE ?auto_32243 ) ( SURFACE-AT ?auto_32234 ?auto_32239 ) ( ON ?auto_32234 ?auto_32246 ) ( CLEAR ?auto_32234 ) ( not ( = ?auto_32234 ?auto_32246 ) ) ( not ( = ?auto_32235 ?auto_32246 ) ) ( IS-CRATE ?auto_32235 ) ( not ( = ?auto_32234 ?auto_32244 ) ) ( not ( = ?auto_32235 ?auto_32244 ) ) ( not ( = ?auto_32246 ?auto_32244 ) ) ( not ( = ?auto_32245 ?auto_32247 ) ) ( not ( = ?auto_32239 ?auto_32245 ) ) ( HOIST-AT ?auto_32240 ?auto_32245 ) ( not ( = ?auto_32242 ?auto_32240 ) ) ( not ( = ?auto_32243 ?auto_32240 ) ) ( SURFACE-AT ?auto_32235 ?auto_32245 ) ( ON ?auto_32235 ?auto_32241 ) ( CLEAR ?auto_32235 ) ( not ( = ?auto_32234 ?auto_32241 ) ) ( not ( = ?auto_32235 ?auto_32241 ) ) ( not ( = ?auto_32246 ?auto_32241 ) ) ( not ( = ?auto_32244 ?auto_32241 ) ) ( IS-CRATE ?auto_32244 ) ( not ( = ?auto_32234 ?auto_32248 ) ) ( not ( = ?auto_32235 ?auto_32248 ) ) ( not ( = ?auto_32246 ?auto_32248 ) ) ( not ( = ?auto_32244 ?auto_32248 ) ) ( not ( = ?auto_32241 ?auto_32248 ) ) ( AVAILABLE ?auto_32240 ) ( SURFACE-AT ?auto_32244 ?auto_32245 ) ( ON ?auto_32244 ?auto_32238 ) ( CLEAR ?auto_32244 ) ( not ( = ?auto_32234 ?auto_32238 ) ) ( not ( = ?auto_32235 ?auto_32238 ) ) ( not ( = ?auto_32246 ?auto_32238 ) ) ( not ( = ?auto_32244 ?auto_32238 ) ) ( not ( = ?auto_32241 ?auto_32238 ) ) ( not ( = ?auto_32248 ?auto_32238 ) ) ( SURFACE-AT ?auto_32237 ?auto_32247 ) ( CLEAR ?auto_32237 ) ( IS-CRATE ?auto_32248 ) ( not ( = ?auto_32234 ?auto_32237 ) ) ( not ( = ?auto_32235 ?auto_32237 ) ) ( not ( = ?auto_32246 ?auto_32237 ) ) ( not ( = ?auto_32244 ?auto_32237 ) ) ( not ( = ?auto_32241 ?auto_32237 ) ) ( not ( = ?auto_32248 ?auto_32237 ) ) ( not ( = ?auto_32238 ?auto_32237 ) ) ( AVAILABLE ?auto_32242 ) ( TRUCK-AT ?auto_32236 ?auto_32249 ) ( not ( = ?auto_32249 ?auto_32247 ) ) ( not ( = ?auto_32239 ?auto_32249 ) ) ( not ( = ?auto_32245 ?auto_32249 ) ) ( HOIST-AT ?auto_32250 ?auto_32249 ) ( LIFTING ?auto_32250 ?auto_32248 ) ( not ( = ?auto_32242 ?auto_32250 ) ) ( not ( = ?auto_32243 ?auto_32250 ) ) ( not ( = ?auto_32240 ?auto_32250 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32250 ?auto_32248 ?auto_32236 ?auto_32249 )
      ( MAKE-ON ?auto_32234 ?auto_32235 )
      ( MAKE-ON-VERIFY ?auto_32234 ?auto_32235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32251 - SURFACE
      ?auto_32252 - SURFACE
    )
    :vars
    (
      ?auto_32254 - HOIST
      ?auto_32260 - PLACE
      ?auto_32255 - PLACE
      ?auto_32266 - HOIST
      ?auto_32264 - SURFACE
      ?auto_32257 - SURFACE
      ?auto_32259 - PLACE
      ?auto_32258 - HOIST
      ?auto_32253 - SURFACE
      ?auto_32262 - SURFACE
      ?auto_32265 - SURFACE
      ?auto_32261 - SURFACE
      ?auto_32263 - TRUCK
      ?auto_32256 - PLACE
      ?auto_32267 - HOIST
      ?auto_32268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32254 ?auto_32260 ) ( IS-CRATE ?auto_32251 ) ( not ( = ?auto_32251 ?auto_32252 ) ) ( not ( = ?auto_32255 ?auto_32260 ) ) ( HOIST-AT ?auto_32266 ?auto_32255 ) ( not ( = ?auto_32254 ?auto_32266 ) ) ( AVAILABLE ?auto_32266 ) ( SURFACE-AT ?auto_32251 ?auto_32255 ) ( ON ?auto_32251 ?auto_32264 ) ( CLEAR ?auto_32251 ) ( not ( = ?auto_32251 ?auto_32264 ) ) ( not ( = ?auto_32252 ?auto_32264 ) ) ( IS-CRATE ?auto_32252 ) ( not ( = ?auto_32251 ?auto_32257 ) ) ( not ( = ?auto_32252 ?auto_32257 ) ) ( not ( = ?auto_32264 ?auto_32257 ) ) ( not ( = ?auto_32259 ?auto_32260 ) ) ( not ( = ?auto_32255 ?auto_32259 ) ) ( HOIST-AT ?auto_32258 ?auto_32259 ) ( not ( = ?auto_32254 ?auto_32258 ) ) ( not ( = ?auto_32266 ?auto_32258 ) ) ( SURFACE-AT ?auto_32252 ?auto_32259 ) ( ON ?auto_32252 ?auto_32253 ) ( CLEAR ?auto_32252 ) ( not ( = ?auto_32251 ?auto_32253 ) ) ( not ( = ?auto_32252 ?auto_32253 ) ) ( not ( = ?auto_32264 ?auto_32253 ) ) ( not ( = ?auto_32257 ?auto_32253 ) ) ( IS-CRATE ?auto_32257 ) ( not ( = ?auto_32251 ?auto_32262 ) ) ( not ( = ?auto_32252 ?auto_32262 ) ) ( not ( = ?auto_32264 ?auto_32262 ) ) ( not ( = ?auto_32257 ?auto_32262 ) ) ( not ( = ?auto_32253 ?auto_32262 ) ) ( AVAILABLE ?auto_32258 ) ( SURFACE-AT ?auto_32257 ?auto_32259 ) ( ON ?auto_32257 ?auto_32265 ) ( CLEAR ?auto_32257 ) ( not ( = ?auto_32251 ?auto_32265 ) ) ( not ( = ?auto_32252 ?auto_32265 ) ) ( not ( = ?auto_32264 ?auto_32265 ) ) ( not ( = ?auto_32257 ?auto_32265 ) ) ( not ( = ?auto_32253 ?auto_32265 ) ) ( not ( = ?auto_32262 ?auto_32265 ) ) ( SURFACE-AT ?auto_32261 ?auto_32260 ) ( CLEAR ?auto_32261 ) ( IS-CRATE ?auto_32262 ) ( not ( = ?auto_32251 ?auto_32261 ) ) ( not ( = ?auto_32252 ?auto_32261 ) ) ( not ( = ?auto_32264 ?auto_32261 ) ) ( not ( = ?auto_32257 ?auto_32261 ) ) ( not ( = ?auto_32253 ?auto_32261 ) ) ( not ( = ?auto_32262 ?auto_32261 ) ) ( not ( = ?auto_32265 ?auto_32261 ) ) ( AVAILABLE ?auto_32254 ) ( TRUCK-AT ?auto_32263 ?auto_32256 ) ( not ( = ?auto_32256 ?auto_32260 ) ) ( not ( = ?auto_32255 ?auto_32256 ) ) ( not ( = ?auto_32259 ?auto_32256 ) ) ( HOIST-AT ?auto_32267 ?auto_32256 ) ( not ( = ?auto_32254 ?auto_32267 ) ) ( not ( = ?auto_32266 ?auto_32267 ) ) ( not ( = ?auto_32258 ?auto_32267 ) ) ( AVAILABLE ?auto_32267 ) ( SURFACE-AT ?auto_32262 ?auto_32256 ) ( ON ?auto_32262 ?auto_32268 ) ( CLEAR ?auto_32262 ) ( not ( = ?auto_32251 ?auto_32268 ) ) ( not ( = ?auto_32252 ?auto_32268 ) ) ( not ( = ?auto_32264 ?auto_32268 ) ) ( not ( = ?auto_32257 ?auto_32268 ) ) ( not ( = ?auto_32253 ?auto_32268 ) ) ( not ( = ?auto_32262 ?auto_32268 ) ) ( not ( = ?auto_32265 ?auto_32268 ) ) ( not ( = ?auto_32261 ?auto_32268 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32267 ?auto_32262 ?auto_32268 ?auto_32256 )
      ( MAKE-ON ?auto_32251 ?auto_32252 )
      ( MAKE-ON-VERIFY ?auto_32251 ?auto_32252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32269 - SURFACE
      ?auto_32270 - SURFACE
    )
    :vars
    (
      ?auto_32275 - HOIST
      ?auto_32272 - PLACE
      ?auto_32277 - PLACE
      ?auto_32281 - HOIST
      ?auto_32279 - SURFACE
      ?auto_32285 - SURFACE
      ?auto_32278 - PLACE
      ?auto_32274 - HOIST
      ?auto_32273 - SURFACE
      ?auto_32283 - SURFACE
      ?auto_32280 - SURFACE
      ?auto_32284 - SURFACE
      ?auto_32271 - PLACE
      ?auto_32276 - HOIST
      ?auto_32286 - SURFACE
      ?auto_32282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32275 ?auto_32272 ) ( IS-CRATE ?auto_32269 ) ( not ( = ?auto_32269 ?auto_32270 ) ) ( not ( = ?auto_32277 ?auto_32272 ) ) ( HOIST-AT ?auto_32281 ?auto_32277 ) ( not ( = ?auto_32275 ?auto_32281 ) ) ( AVAILABLE ?auto_32281 ) ( SURFACE-AT ?auto_32269 ?auto_32277 ) ( ON ?auto_32269 ?auto_32279 ) ( CLEAR ?auto_32269 ) ( not ( = ?auto_32269 ?auto_32279 ) ) ( not ( = ?auto_32270 ?auto_32279 ) ) ( IS-CRATE ?auto_32270 ) ( not ( = ?auto_32269 ?auto_32285 ) ) ( not ( = ?auto_32270 ?auto_32285 ) ) ( not ( = ?auto_32279 ?auto_32285 ) ) ( not ( = ?auto_32278 ?auto_32272 ) ) ( not ( = ?auto_32277 ?auto_32278 ) ) ( HOIST-AT ?auto_32274 ?auto_32278 ) ( not ( = ?auto_32275 ?auto_32274 ) ) ( not ( = ?auto_32281 ?auto_32274 ) ) ( SURFACE-AT ?auto_32270 ?auto_32278 ) ( ON ?auto_32270 ?auto_32273 ) ( CLEAR ?auto_32270 ) ( not ( = ?auto_32269 ?auto_32273 ) ) ( not ( = ?auto_32270 ?auto_32273 ) ) ( not ( = ?auto_32279 ?auto_32273 ) ) ( not ( = ?auto_32285 ?auto_32273 ) ) ( IS-CRATE ?auto_32285 ) ( not ( = ?auto_32269 ?auto_32283 ) ) ( not ( = ?auto_32270 ?auto_32283 ) ) ( not ( = ?auto_32279 ?auto_32283 ) ) ( not ( = ?auto_32285 ?auto_32283 ) ) ( not ( = ?auto_32273 ?auto_32283 ) ) ( AVAILABLE ?auto_32274 ) ( SURFACE-AT ?auto_32285 ?auto_32278 ) ( ON ?auto_32285 ?auto_32280 ) ( CLEAR ?auto_32285 ) ( not ( = ?auto_32269 ?auto_32280 ) ) ( not ( = ?auto_32270 ?auto_32280 ) ) ( not ( = ?auto_32279 ?auto_32280 ) ) ( not ( = ?auto_32285 ?auto_32280 ) ) ( not ( = ?auto_32273 ?auto_32280 ) ) ( not ( = ?auto_32283 ?auto_32280 ) ) ( SURFACE-AT ?auto_32284 ?auto_32272 ) ( CLEAR ?auto_32284 ) ( IS-CRATE ?auto_32283 ) ( not ( = ?auto_32269 ?auto_32284 ) ) ( not ( = ?auto_32270 ?auto_32284 ) ) ( not ( = ?auto_32279 ?auto_32284 ) ) ( not ( = ?auto_32285 ?auto_32284 ) ) ( not ( = ?auto_32273 ?auto_32284 ) ) ( not ( = ?auto_32283 ?auto_32284 ) ) ( not ( = ?auto_32280 ?auto_32284 ) ) ( AVAILABLE ?auto_32275 ) ( not ( = ?auto_32271 ?auto_32272 ) ) ( not ( = ?auto_32277 ?auto_32271 ) ) ( not ( = ?auto_32278 ?auto_32271 ) ) ( HOIST-AT ?auto_32276 ?auto_32271 ) ( not ( = ?auto_32275 ?auto_32276 ) ) ( not ( = ?auto_32281 ?auto_32276 ) ) ( not ( = ?auto_32274 ?auto_32276 ) ) ( AVAILABLE ?auto_32276 ) ( SURFACE-AT ?auto_32283 ?auto_32271 ) ( ON ?auto_32283 ?auto_32286 ) ( CLEAR ?auto_32283 ) ( not ( = ?auto_32269 ?auto_32286 ) ) ( not ( = ?auto_32270 ?auto_32286 ) ) ( not ( = ?auto_32279 ?auto_32286 ) ) ( not ( = ?auto_32285 ?auto_32286 ) ) ( not ( = ?auto_32273 ?auto_32286 ) ) ( not ( = ?auto_32283 ?auto_32286 ) ) ( not ( = ?auto_32280 ?auto_32286 ) ) ( not ( = ?auto_32284 ?auto_32286 ) ) ( TRUCK-AT ?auto_32282 ?auto_32272 ) )
    :subtasks
    ( ( !DRIVE ?auto_32282 ?auto_32272 ?auto_32271 )
      ( MAKE-ON ?auto_32269 ?auto_32270 )
      ( MAKE-ON-VERIFY ?auto_32269 ?auto_32270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32287 - SURFACE
      ?auto_32288 - SURFACE
    )
    :vars
    (
      ?auto_32300 - HOIST
      ?auto_32294 - PLACE
      ?auto_32303 - PLACE
      ?auto_32291 - HOIST
      ?auto_32304 - SURFACE
      ?auto_32301 - SURFACE
      ?auto_32297 - PLACE
      ?auto_32293 - HOIST
      ?auto_32289 - SURFACE
      ?auto_32299 - SURFACE
      ?auto_32296 - SURFACE
      ?auto_32292 - SURFACE
      ?auto_32290 - PLACE
      ?auto_32295 - HOIST
      ?auto_32302 - SURFACE
      ?auto_32298 - TRUCK
      ?auto_32305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32300 ?auto_32294 ) ( IS-CRATE ?auto_32287 ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( not ( = ?auto_32303 ?auto_32294 ) ) ( HOIST-AT ?auto_32291 ?auto_32303 ) ( not ( = ?auto_32300 ?auto_32291 ) ) ( AVAILABLE ?auto_32291 ) ( SURFACE-AT ?auto_32287 ?auto_32303 ) ( ON ?auto_32287 ?auto_32304 ) ( CLEAR ?auto_32287 ) ( not ( = ?auto_32287 ?auto_32304 ) ) ( not ( = ?auto_32288 ?auto_32304 ) ) ( IS-CRATE ?auto_32288 ) ( not ( = ?auto_32287 ?auto_32301 ) ) ( not ( = ?auto_32288 ?auto_32301 ) ) ( not ( = ?auto_32304 ?auto_32301 ) ) ( not ( = ?auto_32297 ?auto_32294 ) ) ( not ( = ?auto_32303 ?auto_32297 ) ) ( HOIST-AT ?auto_32293 ?auto_32297 ) ( not ( = ?auto_32300 ?auto_32293 ) ) ( not ( = ?auto_32291 ?auto_32293 ) ) ( SURFACE-AT ?auto_32288 ?auto_32297 ) ( ON ?auto_32288 ?auto_32289 ) ( CLEAR ?auto_32288 ) ( not ( = ?auto_32287 ?auto_32289 ) ) ( not ( = ?auto_32288 ?auto_32289 ) ) ( not ( = ?auto_32304 ?auto_32289 ) ) ( not ( = ?auto_32301 ?auto_32289 ) ) ( IS-CRATE ?auto_32301 ) ( not ( = ?auto_32287 ?auto_32299 ) ) ( not ( = ?auto_32288 ?auto_32299 ) ) ( not ( = ?auto_32304 ?auto_32299 ) ) ( not ( = ?auto_32301 ?auto_32299 ) ) ( not ( = ?auto_32289 ?auto_32299 ) ) ( AVAILABLE ?auto_32293 ) ( SURFACE-AT ?auto_32301 ?auto_32297 ) ( ON ?auto_32301 ?auto_32296 ) ( CLEAR ?auto_32301 ) ( not ( = ?auto_32287 ?auto_32296 ) ) ( not ( = ?auto_32288 ?auto_32296 ) ) ( not ( = ?auto_32304 ?auto_32296 ) ) ( not ( = ?auto_32301 ?auto_32296 ) ) ( not ( = ?auto_32289 ?auto_32296 ) ) ( not ( = ?auto_32299 ?auto_32296 ) ) ( IS-CRATE ?auto_32299 ) ( not ( = ?auto_32287 ?auto_32292 ) ) ( not ( = ?auto_32288 ?auto_32292 ) ) ( not ( = ?auto_32304 ?auto_32292 ) ) ( not ( = ?auto_32301 ?auto_32292 ) ) ( not ( = ?auto_32289 ?auto_32292 ) ) ( not ( = ?auto_32299 ?auto_32292 ) ) ( not ( = ?auto_32296 ?auto_32292 ) ) ( not ( = ?auto_32290 ?auto_32294 ) ) ( not ( = ?auto_32303 ?auto_32290 ) ) ( not ( = ?auto_32297 ?auto_32290 ) ) ( HOIST-AT ?auto_32295 ?auto_32290 ) ( not ( = ?auto_32300 ?auto_32295 ) ) ( not ( = ?auto_32291 ?auto_32295 ) ) ( not ( = ?auto_32293 ?auto_32295 ) ) ( AVAILABLE ?auto_32295 ) ( SURFACE-AT ?auto_32299 ?auto_32290 ) ( ON ?auto_32299 ?auto_32302 ) ( CLEAR ?auto_32299 ) ( not ( = ?auto_32287 ?auto_32302 ) ) ( not ( = ?auto_32288 ?auto_32302 ) ) ( not ( = ?auto_32304 ?auto_32302 ) ) ( not ( = ?auto_32301 ?auto_32302 ) ) ( not ( = ?auto_32289 ?auto_32302 ) ) ( not ( = ?auto_32299 ?auto_32302 ) ) ( not ( = ?auto_32296 ?auto_32302 ) ) ( not ( = ?auto_32292 ?auto_32302 ) ) ( TRUCK-AT ?auto_32298 ?auto_32294 ) ( SURFACE-AT ?auto_32305 ?auto_32294 ) ( CLEAR ?auto_32305 ) ( LIFTING ?auto_32300 ?auto_32292 ) ( IS-CRATE ?auto_32292 ) ( not ( = ?auto_32287 ?auto_32305 ) ) ( not ( = ?auto_32288 ?auto_32305 ) ) ( not ( = ?auto_32304 ?auto_32305 ) ) ( not ( = ?auto_32301 ?auto_32305 ) ) ( not ( = ?auto_32289 ?auto_32305 ) ) ( not ( = ?auto_32299 ?auto_32305 ) ) ( not ( = ?auto_32296 ?auto_32305 ) ) ( not ( = ?auto_32292 ?auto_32305 ) ) ( not ( = ?auto_32302 ?auto_32305 ) ) )
    :subtasks
    ( ( !DROP ?auto_32300 ?auto_32292 ?auto_32305 ?auto_32294 )
      ( MAKE-ON ?auto_32287 ?auto_32288 )
      ( MAKE-ON-VERIFY ?auto_32287 ?auto_32288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32306 - SURFACE
      ?auto_32307 - SURFACE
    )
    :vars
    (
      ?auto_32310 - HOIST
      ?auto_32316 - PLACE
      ?auto_32321 - PLACE
      ?auto_32313 - HOIST
      ?auto_32309 - SURFACE
      ?auto_32319 - SURFACE
      ?auto_32322 - PLACE
      ?auto_32315 - HOIST
      ?auto_32323 - SURFACE
      ?auto_32317 - SURFACE
      ?auto_32311 - SURFACE
      ?auto_32314 - SURFACE
      ?auto_32312 - PLACE
      ?auto_32308 - HOIST
      ?auto_32318 - SURFACE
      ?auto_32320 - TRUCK
      ?auto_32324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32310 ?auto_32316 ) ( IS-CRATE ?auto_32306 ) ( not ( = ?auto_32306 ?auto_32307 ) ) ( not ( = ?auto_32321 ?auto_32316 ) ) ( HOIST-AT ?auto_32313 ?auto_32321 ) ( not ( = ?auto_32310 ?auto_32313 ) ) ( AVAILABLE ?auto_32313 ) ( SURFACE-AT ?auto_32306 ?auto_32321 ) ( ON ?auto_32306 ?auto_32309 ) ( CLEAR ?auto_32306 ) ( not ( = ?auto_32306 ?auto_32309 ) ) ( not ( = ?auto_32307 ?auto_32309 ) ) ( IS-CRATE ?auto_32307 ) ( not ( = ?auto_32306 ?auto_32319 ) ) ( not ( = ?auto_32307 ?auto_32319 ) ) ( not ( = ?auto_32309 ?auto_32319 ) ) ( not ( = ?auto_32322 ?auto_32316 ) ) ( not ( = ?auto_32321 ?auto_32322 ) ) ( HOIST-AT ?auto_32315 ?auto_32322 ) ( not ( = ?auto_32310 ?auto_32315 ) ) ( not ( = ?auto_32313 ?auto_32315 ) ) ( SURFACE-AT ?auto_32307 ?auto_32322 ) ( ON ?auto_32307 ?auto_32323 ) ( CLEAR ?auto_32307 ) ( not ( = ?auto_32306 ?auto_32323 ) ) ( not ( = ?auto_32307 ?auto_32323 ) ) ( not ( = ?auto_32309 ?auto_32323 ) ) ( not ( = ?auto_32319 ?auto_32323 ) ) ( IS-CRATE ?auto_32319 ) ( not ( = ?auto_32306 ?auto_32317 ) ) ( not ( = ?auto_32307 ?auto_32317 ) ) ( not ( = ?auto_32309 ?auto_32317 ) ) ( not ( = ?auto_32319 ?auto_32317 ) ) ( not ( = ?auto_32323 ?auto_32317 ) ) ( AVAILABLE ?auto_32315 ) ( SURFACE-AT ?auto_32319 ?auto_32322 ) ( ON ?auto_32319 ?auto_32311 ) ( CLEAR ?auto_32319 ) ( not ( = ?auto_32306 ?auto_32311 ) ) ( not ( = ?auto_32307 ?auto_32311 ) ) ( not ( = ?auto_32309 ?auto_32311 ) ) ( not ( = ?auto_32319 ?auto_32311 ) ) ( not ( = ?auto_32323 ?auto_32311 ) ) ( not ( = ?auto_32317 ?auto_32311 ) ) ( IS-CRATE ?auto_32317 ) ( not ( = ?auto_32306 ?auto_32314 ) ) ( not ( = ?auto_32307 ?auto_32314 ) ) ( not ( = ?auto_32309 ?auto_32314 ) ) ( not ( = ?auto_32319 ?auto_32314 ) ) ( not ( = ?auto_32323 ?auto_32314 ) ) ( not ( = ?auto_32317 ?auto_32314 ) ) ( not ( = ?auto_32311 ?auto_32314 ) ) ( not ( = ?auto_32312 ?auto_32316 ) ) ( not ( = ?auto_32321 ?auto_32312 ) ) ( not ( = ?auto_32322 ?auto_32312 ) ) ( HOIST-AT ?auto_32308 ?auto_32312 ) ( not ( = ?auto_32310 ?auto_32308 ) ) ( not ( = ?auto_32313 ?auto_32308 ) ) ( not ( = ?auto_32315 ?auto_32308 ) ) ( AVAILABLE ?auto_32308 ) ( SURFACE-AT ?auto_32317 ?auto_32312 ) ( ON ?auto_32317 ?auto_32318 ) ( CLEAR ?auto_32317 ) ( not ( = ?auto_32306 ?auto_32318 ) ) ( not ( = ?auto_32307 ?auto_32318 ) ) ( not ( = ?auto_32309 ?auto_32318 ) ) ( not ( = ?auto_32319 ?auto_32318 ) ) ( not ( = ?auto_32323 ?auto_32318 ) ) ( not ( = ?auto_32317 ?auto_32318 ) ) ( not ( = ?auto_32311 ?auto_32318 ) ) ( not ( = ?auto_32314 ?auto_32318 ) ) ( TRUCK-AT ?auto_32320 ?auto_32316 ) ( SURFACE-AT ?auto_32324 ?auto_32316 ) ( CLEAR ?auto_32324 ) ( IS-CRATE ?auto_32314 ) ( not ( = ?auto_32306 ?auto_32324 ) ) ( not ( = ?auto_32307 ?auto_32324 ) ) ( not ( = ?auto_32309 ?auto_32324 ) ) ( not ( = ?auto_32319 ?auto_32324 ) ) ( not ( = ?auto_32323 ?auto_32324 ) ) ( not ( = ?auto_32317 ?auto_32324 ) ) ( not ( = ?auto_32311 ?auto_32324 ) ) ( not ( = ?auto_32314 ?auto_32324 ) ) ( not ( = ?auto_32318 ?auto_32324 ) ) ( AVAILABLE ?auto_32310 ) ( IN ?auto_32314 ?auto_32320 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32310 ?auto_32314 ?auto_32320 ?auto_32316 )
      ( MAKE-ON ?auto_32306 ?auto_32307 )
      ( MAKE-ON-VERIFY ?auto_32306 ?auto_32307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32325 - SURFACE
      ?auto_32326 - SURFACE
    )
    :vars
    (
      ?auto_32329 - HOIST
      ?auto_32333 - PLACE
      ?auto_32339 - PLACE
      ?auto_32327 - HOIST
      ?auto_32337 - SURFACE
      ?auto_32336 - SURFACE
      ?auto_32341 - PLACE
      ?auto_32331 - HOIST
      ?auto_32343 - SURFACE
      ?auto_32328 - SURFACE
      ?auto_32332 - SURFACE
      ?auto_32334 - SURFACE
      ?auto_32338 - PLACE
      ?auto_32340 - HOIST
      ?auto_32335 - SURFACE
      ?auto_32342 - SURFACE
      ?auto_32330 - TRUCK
      ?auto_32344 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32329 ?auto_32333 ) ( IS-CRATE ?auto_32325 ) ( not ( = ?auto_32325 ?auto_32326 ) ) ( not ( = ?auto_32339 ?auto_32333 ) ) ( HOIST-AT ?auto_32327 ?auto_32339 ) ( not ( = ?auto_32329 ?auto_32327 ) ) ( AVAILABLE ?auto_32327 ) ( SURFACE-AT ?auto_32325 ?auto_32339 ) ( ON ?auto_32325 ?auto_32337 ) ( CLEAR ?auto_32325 ) ( not ( = ?auto_32325 ?auto_32337 ) ) ( not ( = ?auto_32326 ?auto_32337 ) ) ( IS-CRATE ?auto_32326 ) ( not ( = ?auto_32325 ?auto_32336 ) ) ( not ( = ?auto_32326 ?auto_32336 ) ) ( not ( = ?auto_32337 ?auto_32336 ) ) ( not ( = ?auto_32341 ?auto_32333 ) ) ( not ( = ?auto_32339 ?auto_32341 ) ) ( HOIST-AT ?auto_32331 ?auto_32341 ) ( not ( = ?auto_32329 ?auto_32331 ) ) ( not ( = ?auto_32327 ?auto_32331 ) ) ( SURFACE-AT ?auto_32326 ?auto_32341 ) ( ON ?auto_32326 ?auto_32343 ) ( CLEAR ?auto_32326 ) ( not ( = ?auto_32325 ?auto_32343 ) ) ( not ( = ?auto_32326 ?auto_32343 ) ) ( not ( = ?auto_32337 ?auto_32343 ) ) ( not ( = ?auto_32336 ?auto_32343 ) ) ( IS-CRATE ?auto_32336 ) ( not ( = ?auto_32325 ?auto_32328 ) ) ( not ( = ?auto_32326 ?auto_32328 ) ) ( not ( = ?auto_32337 ?auto_32328 ) ) ( not ( = ?auto_32336 ?auto_32328 ) ) ( not ( = ?auto_32343 ?auto_32328 ) ) ( AVAILABLE ?auto_32331 ) ( SURFACE-AT ?auto_32336 ?auto_32341 ) ( ON ?auto_32336 ?auto_32332 ) ( CLEAR ?auto_32336 ) ( not ( = ?auto_32325 ?auto_32332 ) ) ( not ( = ?auto_32326 ?auto_32332 ) ) ( not ( = ?auto_32337 ?auto_32332 ) ) ( not ( = ?auto_32336 ?auto_32332 ) ) ( not ( = ?auto_32343 ?auto_32332 ) ) ( not ( = ?auto_32328 ?auto_32332 ) ) ( IS-CRATE ?auto_32328 ) ( not ( = ?auto_32325 ?auto_32334 ) ) ( not ( = ?auto_32326 ?auto_32334 ) ) ( not ( = ?auto_32337 ?auto_32334 ) ) ( not ( = ?auto_32336 ?auto_32334 ) ) ( not ( = ?auto_32343 ?auto_32334 ) ) ( not ( = ?auto_32328 ?auto_32334 ) ) ( not ( = ?auto_32332 ?auto_32334 ) ) ( not ( = ?auto_32338 ?auto_32333 ) ) ( not ( = ?auto_32339 ?auto_32338 ) ) ( not ( = ?auto_32341 ?auto_32338 ) ) ( HOIST-AT ?auto_32340 ?auto_32338 ) ( not ( = ?auto_32329 ?auto_32340 ) ) ( not ( = ?auto_32327 ?auto_32340 ) ) ( not ( = ?auto_32331 ?auto_32340 ) ) ( AVAILABLE ?auto_32340 ) ( SURFACE-AT ?auto_32328 ?auto_32338 ) ( ON ?auto_32328 ?auto_32335 ) ( CLEAR ?auto_32328 ) ( not ( = ?auto_32325 ?auto_32335 ) ) ( not ( = ?auto_32326 ?auto_32335 ) ) ( not ( = ?auto_32337 ?auto_32335 ) ) ( not ( = ?auto_32336 ?auto_32335 ) ) ( not ( = ?auto_32343 ?auto_32335 ) ) ( not ( = ?auto_32328 ?auto_32335 ) ) ( not ( = ?auto_32332 ?auto_32335 ) ) ( not ( = ?auto_32334 ?auto_32335 ) ) ( SURFACE-AT ?auto_32342 ?auto_32333 ) ( CLEAR ?auto_32342 ) ( IS-CRATE ?auto_32334 ) ( not ( = ?auto_32325 ?auto_32342 ) ) ( not ( = ?auto_32326 ?auto_32342 ) ) ( not ( = ?auto_32337 ?auto_32342 ) ) ( not ( = ?auto_32336 ?auto_32342 ) ) ( not ( = ?auto_32343 ?auto_32342 ) ) ( not ( = ?auto_32328 ?auto_32342 ) ) ( not ( = ?auto_32332 ?auto_32342 ) ) ( not ( = ?auto_32334 ?auto_32342 ) ) ( not ( = ?auto_32335 ?auto_32342 ) ) ( AVAILABLE ?auto_32329 ) ( IN ?auto_32334 ?auto_32330 ) ( TRUCK-AT ?auto_32330 ?auto_32344 ) ( not ( = ?auto_32344 ?auto_32333 ) ) ( not ( = ?auto_32339 ?auto_32344 ) ) ( not ( = ?auto_32341 ?auto_32344 ) ) ( not ( = ?auto_32338 ?auto_32344 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32330 ?auto_32344 ?auto_32333 )
      ( MAKE-ON ?auto_32325 ?auto_32326 )
      ( MAKE-ON-VERIFY ?auto_32325 ?auto_32326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32345 - SURFACE
      ?auto_32346 - SURFACE
    )
    :vars
    (
      ?auto_32360 - HOIST
      ?auto_32357 - PLACE
      ?auto_32350 - PLACE
      ?auto_32362 - HOIST
      ?auto_32348 - SURFACE
      ?auto_32355 - SURFACE
      ?auto_32356 - PLACE
      ?auto_32363 - HOIST
      ?auto_32349 - SURFACE
      ?auto_32353 - SURFACE
      ?auto_32347 - SURFACE
      ?auto_32351 - SURFACE
      ?auto_32354 - PLACE
      ?auto_32361 - HOIST
      ?auto_32359 - SURFACE
      ?auto_32352 - SURFACE
      ?auto_32364 - TRUCK
      ?auto_32358 - PLACE
      ?auto_32365 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32360 ?auto_32357 ) ( IS-CRATE ?auto_32345 ) ( not ( = ?auto_32345 ?auto_32346 ) ) ( not ( = ?auto_32350 ?auto_32357 ) ) ( HOIST-AT ?auto_32362 ?auto_32350 ) ( not ( = ?auto_32360 ?auto_32362 ) ) ( AVAILABLE ?auto_32362 ) ( SURFACE-AT ?auto_32345 ?auto_32350 ) ( ON ?auto_32345 ?auto_32348 ) ( CLEAR ?auto_32345 ) ( not ( = ?auto_32345 ?auto_32348 ) ) ( not ( = ?auto_32346 ?auto_32348 ) ) ( IS-CRATE ?auto_32346 ) ( not ( = ?auto_32345 ?auto_32355 ) ) ( not ( = ?auto_32346 ?auto_32355 ) ) ( not ( = ?auto_32348 ?auto_32355 ) ) ( not ( = ?auto_32356 ?auto_32357 ) ) ( not ( = ?auto_32350 ?auto_32356 ) ) ( HOIST-AT ?auto_32363 ?auto_32356 ) ( not ( = ?auto_32360 ?auto_32363 ) ) ( not ( = ?auto_32362 ?auto_32363 ) ) ( SURFACE-AT ?auto_32346 ?auto_32356 ) ( ON ?auto_32346 ?auto_32349 ) ( CLEAR ?auto_32346 ) ( not ( = ?auto_32345 ?auto_32349 ) ) ( not ( = ?auto_32346 ?auto_32349 ) ) ( not ( = ?auto_32348 ?auto_32349 ) ) ( not ( = ?auto_32355 ?auto_32349 ) ) ( IS-CRATE ?auto_32355 ) ( not ( = ?auto_32345 ?auto_32353 ) ) ( not ( = ?auto_32346 ?auto_32353 ) ) ( not ( = ?auto_32348 ?auto_32353 ) ) ( not ( = ?auto_32355 ?auto_32353 ) ) ( not ( = ?auto_32349 ?auto_32353 ) ) ( AVAILABLE ?auto_32363 ) ( SURFACE-AT ?auto_32355 ?auto_32356 ) ( ON ?auto_32355 ?auto_32347 ) ( CLEAR ?auto_32355 ) ( not ( = ?auto_32345 ?auto_32347 ) ) ( not ( = ?auto_32346 ?auto_32347 ) ) ( not ( = ?auto_32348 ?auto_32347 ) ) ( not ( = ?auto_32355 ?auto_32347 ) ) ( not ( = ?auto_32349 ?auto_32347 ) ) ( not ( = ?auto_32353 ?auto_32347 ) ) ( IS-CRATE ?auto_32353 ) ( not ( = ?auto_32345 ?auto_32351 ) ) ( not ( = ?auto_32346 ?auto_32351 ) ) ( not ( = ?auto_32348 ?auto_32351 ) ) ( not ( = ?auto_32355 ?auto_32351 ) ) ( not ( = ?auto_32349 ?auto_32351 ) ) ( not ( = ?auto_32353 ?auto_32351 ) ) ( not ( = ?auto_32347 ?auto_32351 ) ) ( not ( = ?auto_32354 ?auto_32357 ) ) ( not ( = ?auto_32350 ?auto_32354 ) ) ( not ( = ?auto_32356 ?auto_32354 ) ) ( HOIST-AT ?auto_32361 ?auto_32354 ) ( not ( = ?auto_32360 ?auto_32361 ) ) ( not ( = ?auto_32362 ?auto_32361 ) ) ( not ( = ?auto_32363 ?auto_32361 ) ) ( AVAILABLE ?auto_32361 ) ( SURFACE-AT ?auto_32353 ?auto_32354 ) ( ON ?auto_32353 ?auto_32359 ) ( CLEAR ?auto_32353 ) ( not ( = ?auto_32345 ?auto_32359 ) ) ( not ( = ?auto_32346 ?auto_32359 ) ) ( not ( = ?auto_32348 ?auto_32359 ) ) ( not ( = ?auto_32355 ?auto_32359 ) ) ( not ( = ?auto_32349 ?auto_32359 ) ) ( not ( = ?auto_32353 ?auto_32359 ) ) ( not ( = ?auto_32347 ?auto_32359 ) ) ( not ( = ?auto_32351 ?auto_32359 ) ) ( SURFACE-AT ?auto_32352 ?auto_32357 ) ( CLEAR ?auto_32352 ) ( IS-CRATE ?auto_32351 ) ( not ( = ?auto_32345 ?auto_32352 ) ) ( not ( = ?auto_32346 ?auto_32352 ) ) ( not ( = ?auto_32348 ?auto_32352 ) ) ( not ( = ?auto_32355 ?auto_32352 ) ) ( not ( = ?auto_32349 ?auto_32352 ) ) ( not ( = ?auto_32353 ?auto_32352 ) ) ( not ( = ?auto_32347 ?auto_32352 ) ) ( not ( = ?auto_32351 ?auto_32352 ) ) ( not ( = ?auto_32359 ?auto_32352 ) ) ( AVAILABLE ?auto_32360 ) ( TRUCK-AT ?auto_32364 ?auto_32358 ) ( not ( = ?auto_32358 ?auto_32357 ) ) ( not ( = ?auto_32350 ?auto_32358 ) ) ( not ( = ?auto_32356 ?auto_32358 ) ) ( not ( = ?auto_32354 ?auto_32358 ) ) ( HOIST-AT ?auto_32365 ?auto_32358 ) ( LIFTING ?auto_32365 ?auto_32351 ) ( not ( = ?auto_32360 ?auto_32365 ) ) ( not ( = ?auto_32362 ?auto_32365 ) ) ( not ( = ?auto_32363 ?auto_32365 ) ) ( not ( = ?auto_32361 ?auto_32365 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32365 ?auto_32351 ?auto_32364 ?auto_32358 )
      ( MAKE-ON ?auto_32345 ?auto_32346 )
      ( MAKE-ON-VERIFY ?auto_32345 ?auto_32346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32366 - SURFACE
      ?auto_32367 - SURFACE
    )
    :vars
    (
      ?auto_32382 - HOIST
      ?auto_32368 - PLACE
      ?auto_32386 - PLACE
      ?auto_32379 - HOIST
      ?auto_32374 - SURFACE
      ?auto_32378 - SURFACE
      ?auto_32383 - PLACE
      ?auto_32370 - HOIST
      ?auto_32385 - SURFACE
      ?auto_32377 - SURFACE
      ?auto_32372 - SURFACE
      ?auto_32371 - SURFACE
      ?auto_32381 - PLACE
      ?auto_32380 - HOIST
      ?auto_32384 - SURFACE
      ?auto_32373 - SURFACE
      ?auto_32369 - TRUCK
      ?auto_32375 - PLACE
      ?auto_32376 - HOIST
      ?auto_32387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32382 ?auto_32368 ) ( IS-CRATE ?auto_32366 ) ( not ( = ?auto_32366 ?auto_32367 ) ) ( not ( = ?auto_32386 ?auto_32368 ) ) ( HOIST-AT ?auto_32379 ?auto_32386 ) ( not ( = ?auto_32382 ?auto_32379 ) ) ( AVAILABLE ?auto_32379 ) ( SURFACE-AT ?auto_32366 ?auto_32386 ) ( ON ?auto_32366 ?auto_32374 ) ( CLEAR ?auto_32366 ) ( not ( = ?auto_32366 ?auto_32374 ) ) ( not ( = ?auto_32367 ?auto_32374 ) ) ( IS-CRATE ?auto_32367 ) ( not ( = ?auto_32366 ?auto_32378 ) ) ( not ( = ?auto_32367 ?auto_32378 ) ) ( not ( = ?auto_32374 ?auto_32378 ) ) ( not ( = ?auto_32383 ?auto_32368 ) ) ( not ( = ?auto_32386 ?auto_32383 ) ) ( HOIST-AT ?auto_32370 ?auto_32383 ) ( not ( = ?auto_32382 ?auto_32370 ) ) ( not ( = ?auto_32379 ?auto_32370 ) ) ( SURFACE-AT ?auto_32367 ?auto_32383 ) ( ON ?auto_32367 ?auto_32385 ) ( CLEAR ?auto_32367 ) ( not ( = ?auto_32366 ?auto_32385 ) ) ( not ( = ?auto_32367 ?auto_32385 ) ) ( not ( = ?auto_32374 ?auto_32385 ) ) ( not ( = ?auto_32378 ?auto_32385 ) ) ( IS-CRATE ?auto_32378 ) ( not ( = ?auto_32366 ?auto_32377 ) ) ( not ( = ?auto_32367 ?auto_32377 ) ) ( not ( = ?auto_32374 ?auto_32377 ) ) ( not ( = ?auto_32378 ?auto_32377 ) ) ( not ( = ?auto_32385 ?auto_32377 ) ) ( AVAILABLE ?auto_32370 ) ( SURFACE-AT ?auto_32378 ?auto_32383 ) ( ON ?auto_32378 ?auto_32372 ) ( CLEAR ?auto_32378 ) ( not ( = ?auto_32366 ?auto_32372 ) ) ( not ( = ?auto_32367 ?auto_32372 ) ) ( not ( = ?auto_32374 ?auto_32372 ) ) ( not ( = ?auto_32378 ?auto_32372 ) ) ( not ( = ?auto_32385 ?auto_32372 ) ) ( not ( = ?auto_32377 ?auto_32372 ) ) ( IS-CRATE ?auto_32377 ) ( not ( = ?auto_32366 ?auto_32371 ) ) ( not ( = ?auto_32367 ?auto_32371 ) ) ( not ( = ?auto_32374 ?auto_32371 ) ) ( not ( = ?auto_32378 ?auto_32371 ) ) ( not ( = ?auto_32385 ?auto_32371 ) ) ( not ( = ?auto_32377 ?auto_32371 ) ) ( not ( = ?auto_32372 ?auto_32371 ) ) ( not ( = ?auto_32381 ?auto_32368 ) ) ( not ( = ?auto_32386 ?auto_32381 ) ) ( not ( = ?auto_32383 ?auto_32381 ) ) ( HOIST-AT ?auto_32380 ?auto_32381 ) ( not ( = ?auto_32382 ?auto_32380 ) ) ( not ( = ?auto_32379 ?auto_32380 ) ) ( not ( = ?auto_32370 ?auto_32380 ) ) ( AVAILABLE ?auto_32380 ) ( SURFACE-AT ?auto_32377 ?auto_32381 ) ( ON ?auto_32377 ?auto_32384 ) ( CLEAR ?auto_32377 ) ( not ( = ?auto_32366 ?auto_32384 ) ) ( not ( = ?auto_32367 ?auto_32384 ) ) ( not ( = ?auto_32374 ?auto_32384 ) ) ( not ( = ?auto_32378 ?auto_32384 ) ) ( not ( = ?auto_32385 ?auto_32384 ) ) ( not ( = ?auto_32377 ?auto_32384 ) ) ( not ( = ?auto_32372 ?auto_32384 ) ) ( not ( = ?auto_32371 ?auto_32384 ) ) ( SURFACE-AT ?auto_32373 ?auto_32368 ) ( CLEAR ?auto_32373 ) ( IS-CRATE ?auto_32371 ) ( not ( = ?auto_32366 ?auto_32373 ) ) ( not ( = ?auto_32367 ?auto_32373 ) ) ( not ( = ?auto_32374 ?auto_32373 ) ) ( not ( = ?auto_32378 ?auto_32373 ) ) ( not ( = ?auto_32385 ?auto_32373 ) ) ( not ( = ?auto_32377 ?auto_32373 ) ) ( not ( = ?auto_32372 ?auto_32373 ) ) ( not ( = ?auto_32371 ?auto_32373 ) ) ( not ( = ?auto_32384 ?auto_32373 ) ) ( AVAILABLE ?auto_32382 ) ( TRUCK-AT ?auto_32369 ?auto_32375 ) ( not ( = ?auto_32375 ?auto_32368 ) ) ( not ( = ?auto_32386 ?auto_32375 ) ) ( not ( = ?auto_32383 ?auto_32375 ) ) ( not ( = ?auto_32381 ?auto_32375 ) ) ( HOIST-AT ?auto_32376 ?auto_32375 ) ( not ( = ?auto_32382 ?auto_32376 ) ) ( not ( = ?auto_32379 ?auto_32376 ) ) ( not ( = ?auto_32370 ?auto_32376 ) ) ( not ( = ?auto_32380 ?auto_32376 ) ) ( AVAILABLE ?auto_32376 ) ( SURFACE-AT ?auto_32371 ?auto_32375 ) ( ON ?auto_32371 ?auto_32387 ) ( CLEAR ?auto_32371 ) ( not ( = ?auto_32366 ?auto_32387 ) ) ( not ( = ?auto_32367 ?auto_32387 ) ) ( not ( = ?auto_32374 ?auto_32387 ) ) ( not ( = ?auto_32378 ?auto_32387 ) ) ( not ( = ?auto_32385 ?auto_32387 ) ) ( not ( = ?auto_32377 ?auto_32387 ) ) ( not ( = ?auto_32372 ?auto_32387 ) ) ( not ( = ?auto_32371 ?auto_32387 ) ) ( not ( = ?auto_32384 ?auto_32387 ) ) ( not ( = ?auto_32373 ?auto_32387 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32376 ?auto_32371 ?auto_32387 ?auto_32375 )
      ( MAKE-ON ?auto_32366 ?auto_32367 )
      ( MAKE-ON-VERIFY ?auto_32366 ?auto_32367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32388 - SURFACE
      ?auto_32389 - SURFACE
    )
    :vars
    (
      ?auto_32394 - HOIST
      ?auto_32406 - PLACE
      ?auto_32408 - PLACE
      ?auto_32390 - HOIST
      ?auto_32401 - SURFACE
      ?auto_32393 - SURFACE
      ?auto_32400 - PLACE
      ?auto_32395 - HOIST
      ?auto_32399 - SURFACE
      ?auto_32402 - SURFACE
      ?auto_32396 - SURFACE
      ?auto_32403 - SURFACE
      ?auto_32397 - PLACE
      ?auto_32404 - HOIST
      ?auto_32407 - SURFACE
      ?auto_32392 - SURFACE
      ?auto_32398 - PLACE
      ?auto_32405 - HOIST
      ?auto_32409 - SURFACE
      ?auto_32391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32394 ?auto_32406 ) ( IS-CRATE ?auto_32388 ) ( not ( = ?auto_32388 ?auto_32389 ) ) ( not ( = ?auto_32408 ?auto_32406 ) ) ( HOIST-AT ?auto_32390 ?auto_32408 ) ( not ( = ?auto_32394 ?auto_32390 ) ) ( AVAILABLE ?auto_32390 ) ( SURFACE-AT ?auto_32388 ?auto_32408 ) ( ON ?auto_32388 ?auto_32401 ) ( CLEAR ?auto_32388 ) ( not ( = ?auto_32388 ?auto_32401 ) ) ( not ( = ?auto_32389 ?auto_32401 ) ) ( IS-CRATE ?auto_32389 ) ( not ( = ?auto_32388 ?auto_32393 ) ) ( not ( = ?auto_32389 ?auto_32393 ) ) ( not ( = ?auto_32401 ?auto_32393 ) ) ( not ( = ?auto_32400 ?auto_32406 ) ) ( not ( = ?auto_32408 ?auto_32400 ) ) ( HOIST-AT ?auto_32395 ?auto_32400 ) ( not ( = ?auto_32394 ?auto_32395 ) ) ( not ( = ?auto_32390 ?auto_32395 ) ) ( SURFACE-AT ?auto_32389 ?auto_32400 ) ( ON ?auto_32389 ?auto_32399 ) ( CLEAR ?auto_32389 ) ( not ( = ?auto_32388 ?auto_32399 ) ) ( not ( = ?auto_32389 ?auto_32399 ) ) ( not ( = ?auto_32401 ?auto_32399 ) ) ( not ( = ?auto_32393 ?auto_32399 ) ) ( IS-CRATE ?auto_32393 ) ( not ( = ?auto_32388 ?auto_32402 ) ) ( not ( = ?auto_32389 ?auto_32402 ) ) ( not ( = ?auto_32401 ?auto_32402 ) ) ( not ( = ?auto_32393 ?auto_32402 ) ) ( not ( = ?auto_32399 ?auto_32402 ) ) ( AVAILABLE ?auto_32395 ) ( SURFACE-AT ?auto_32393 ?auto_32400 ) ( ON ?auto_32393 ?auto_32396 ) ( CLEAR ?auto_32393 ) ( not ( = ?auto_32388 ?auto_32396 ) ) ( not ( = ?auto_32389 ?auto_32396 ) ) ( not ( = ?auto_32401 ?auto_32396 ) ) ( not ( = ?auto_32393 ?auto_32396 ) ) ( not ( = ?auto_32399 ?auto_32396 ) ) ( not ( = ?auto_32402 ?auto_32396 ) ) ( IS-CRATE ?auto_32402 ) ( not ( = ?auto_32388 ?auto_32403 ) ) ( not ( = ?auto_32389 ?auto_32403 ) ) ( not ( = ?auto_32401 ?auto_32403 ) ) ( not ( = ?auto_32393 ?auto_32403 ) ) ( not ( = ?auto_32399 ?auto_32403 ) ) ( not ( = ?auto_32402 ?auto_32403 ) ) ( not ( = ?auto_32396 ?auto_32403 ) ) ( not ( = ?auto_32397 ?auto_32406 ) ) ( not ( = ?auto_32408 ?auto_32397 ) ) ( not ( = ?auto_32400 ?auto_32397 ) ) ( HOIST-AT ?auto_32404 ?auto_32397 ) ( not ( = ?auto_32394 ?auto_32404 ) ) ( not ( = ?auto_32390 ?auto_32404 ) ) ( not ( = ?auto_32395 ?auto_32404 ) ) ( AVAILABLE ?auto_32404 ) ( SURFACE-AT ?auto_32402 ?auto_32397 ) ( ON ?auto_32402 ?auto_32407 ) ( CLEAR ?auto_32402 ) ( not ( = ?auto_32388 ?auto_32407 ) ) ( not ( = ?auto_32389 ?auto_32407 ) ) ( not ( = ?auto_32401 ?auto_32407 ) ) ( not ( = ?auto_32393 ?auto_32407 ) ) ( not ( = ?auto_32399 ?auto_32407 ) ) ( not ( = ?auto_32402 ?auto_32407 ) ) ( not ( = ?auto_32396 ?auto_32407 ) ) ( not ( = ?auto_32403 ?auto_32407 ) ) ( SURFACE-AT ?auto_32392 ?auto_32406 ) ( CLEAR ?auto_32392 ) ( IS-CRATE ?auto_32403 ) ( not ( = ?auto_32388 ?auto_32392 ) ) ( not ( = ?auto_32389 ?auto_32392 ) ) ( not ( = ?auto_32401 ?auto_32392 ) ) ( not ( = ?auto_32393 ?auto_32392 ) ) ( not ( = ?auto_32399 ?auto_32392 ) ) ( not ( = ?auto_32402 ?auto_32392 ) ) ( not ( = ?auto_32396 ?auto_32392 ) ) ( not ( = ?auto_32403 ?auto_32392 ) ) ( not ( = ?auto_32407 ?auto_32392 ) ) ( AVAILABLE ?auto_32394 ) ( not ( = ?auto_32398 ?auto_32406 ) ) ( not ( = ?auto_32408 ?auto_32398 ) ) ( not ( = ?auto_32400 ?auto_32398 ) ) ( not ( = ?auto_32397 ?auto_32398 ) ) ( HOIST-AT ?auto_32405 ?auto_32398 ) ( not ( = ?auto_32394 ?auto_32405 ) ) ( not ( = ?auto_32390 ?auto_32405 ) ) ( not ( = ?auto_32395 ?auto_32405 ) ) ( not ( = ?auto_32404 ?auto_32405 ) ) ( AVAILABLE ?auto_32405 ) ( SURFACE-AT ?auto_32403 ?auto_32398 ) ( ON ?auto_32403 ?auto_32409 ) ( CLEAR ?auto_32403 ) ( not ( = ?auto_32388 ?auto_32409 ) ) ( not ( = ?auto_32389 ?auto_32409 ) ) ( not ( = ?auto_32401 ?auto_32409 ) ) ( not ( = ?auto_32393 ?auto_32409 ) ) ( not ( = ?auto_32399 ?auto_32409 ) ) ( not ( = ?auto_32402 ?auto_32409 ) ) ( not ( = ?auto_32396 ?auto_32409 ) ) ( not ( = ?auto_32403 ?auto_32409 ) ) ( not ( = ?auto_32407 ?auto_32409 ) ) ( not ( = ?auto_32392 ?auto_32409 ) ) ( TRUCK-AT ?auto_32391 ?auto_32406 ) )
    :subtasks
    ( ( !DRIVE ?auto_32391 ?auto_32406 ?auto_32398 )
      ( MAKE-ON ?auto_32388 ?auto_32389 )
      ( MAKE-ON-VERIFY ?auto_32388 ?auto_32389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32410 - SURFACE
      ?auto_32411 - SURFACE
    )
    :vars
    (
      ?auto_32425 - HOIST
      ?auto_32428 - PLACE
      ?auto_32430 - PLACE
      ?auto_32422 - HOIST
      ?auto_32421 - SURFACE
      ?auto_32419 - SURFACE
      ?auto_32413 - PLACE
      ?auto_32414 - HOIST
      ?auto_32424 - SURFACE
      ?auto_32412 - SURFACE
      ?auto_32420 - SURFACE
      ?auto_32418 - SURFACE
      ?auto_32427 - PLACE
      ?auto_32423 - HOIST
      ?auto_32429 - SURFACE
      ?auto_32415 - SURFACE
      ?auto_32416 - PLACE
      ?auto_32417 - HOIST
      ?auto_32431 - SURFACE
      ?auto_32426 - TRUCK
      ?auto_32432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32425 ?auto_32428 ) ( IS-CRATE ?auto_32410 ) ( not ( = ?auto_32410 ?auto_32411 ) ) ( not ( = ?auto_32430 ?auto_32428 ) ) ( HOIST-AT ?auto_32422 ?auto_32430 ) ( not ( = ?auto_32425 ?auto_32422 ) ) ( AVAILABLE ?auto_32422 ) ( SURFACE-AT ?auto_32410 ?auto_32430 ) ( ON ?auto_32410 ?auto_32421 ) ( CLEAR ?auto_32410 ) ( not ( = ?auto_32410 ?auto_32421 ) ) ( not ( = ?auto_32411 ?auto_32421 ) ) ( IS-CRATE ?auto_32411 ) ( not ( = ?auto_32410 ?auto_32419 ) ) ( not ( = ?auto_32411 ?auto_32419 ) ) ( not ( = ?auto_32421 ?auto_32419 ) ) ( not ( = ?auto_32413 ?auto_32428 ) ) ( not ( = ?auto_32430 ?auto_32413 ) ) ( HOIST-AT ?auto_32414 ?auto_32413 ) ( not ( = ?auto_32425 ?auto_32414 ) ) ( not ( = ?auto_32422 ?auto_32414 ) ) ( SURFACE-AT ?auto_32411 ?auto_32413 ) ( ON ?auto_32411 ?auto_32424 ) ( CLEAR ?auto_32411 ) ( not ( = ?auto_32410 ?auto_32424 ) ) ( not ( = ?auto_32411 ?auto_32424 ) ) ( not ( = ?auto_32421 ?auto_32424 ) ) ( not ( = ?auto_32419 ?auto_32424 ) ) ( IS-CRATE ?auto_32419 ) ( not ( = ?auto_32410 ?auto_32412 ) ) ( not ( = ?auto_32411 ?auto_32412 ) ) ( not ( = ?auto_32421 ?auto_32412 ) ) ( not ( = ?auto_32419 ?auto_32412 ) ) ( not ( = ?auto_32424 ?auto_32412 ) ) ( AVAILABLE ?auto_32414 ) ( SURFACE-AT ?auto_32419 ?auto_32413 ) ( ON ?auto_32419 ?auto_32420 ) ( CLEAR ?auto_32419 ) ( not ( = ?auto_32410 ?auto_32420 ) ) ( not ( = ?auto_32411 ?auto_32420 ) ) ( not ( = ?auto_32421 ?auto_32420 ) ) ( not ( = ?auto_32419 ?auto_32420 ) ) ( not ( = ?auto_32424 ?auto_32420 ) ) ( not ( = ?auto_32412 ?auto_32420 ) ) ( IS-CRATE ?auto_32412 ) ( not ( = ?auto_32410 ?auto_32418 ) ) ( not ( = ?auto_32411 ?auto_32418 ) ) ( not ( = ?auto_32421 ?auto_32418 ) ) ( not ( = ?auto_32419 ?auto_32418 ) ) ( not ( = ?auto_32424 ?auto_32418 ) ) ( not ( = ?auto_32412 ?auto_32418 ) ) ( not ( = ?auto_32420 ?auto_32418 ) ) ( not ( = ?auto_32427 ?auto_32428 ) ) ( not ( = ?auto_32430 ?auto_32427 ) ) ( not ( = ?auto_32413 ?auto_32427 ) ) ( HOIST-AT ?auto_32423 ?auto_32427 ) ( not ( = ?auto_32425 ?auto_32423 ) ) ( not ( = ?auto_32422 ?auto_32423 ) ) ( not ( = ?auto_32414 ?auto_32423 ) ) ( AVAILABLE ?auto_32423 ) ( SURFACE-AT ?auto_32412 ?auto_32427 ) ( ON ?auto_32412 ?auto_32429 ) ( CLEAR ?auto_32412 ) ( not ( = ?auto_32410 ?auto_32429 ) ) ( not ( = ?auto_32411 ?auto_32429 ) ) ( not ( = ?auto_32421 ?auto_32429 ) ) ( not ( = ?auto_32419 ?auto_32429 ) ) ( not ( = ?auto_32424 ?auto_32429 ) ) ( not ( = ?auto_32412 ?auto_32429 ) ) ( not ( = ?auto_32420 ?auto_32429 ) ) ( not ( = ?auto_32418 ?auto_32429 ) ) ( IS-CRATE ?auto_32418 ) ( not ( = ?auto_32410 ?auto_32415 ) ) ( not ( = ?auto_32411 ?auto_32415 ) ) ( not ( = ?auto_32421 ?auto_32415 ) ) ( not ( = ?auto_32419 ?auto_32415 ) ) ( not ( = ?auto_32424 ?auto_32415 ) ) ( not ( = ?auto_32412 ?auto_32415 ) ) ( not ( = ?auto_32420 ?auto_32415 ) ) ( not ( = ?auto_32418 ?auto_32415 ) ) ( not ( = ?auto_32429 ?auto_32415 ) ) ( not ( = ?auto_32416 ?auto_32428 ) ) ( not ( = ?auto_32430 ?auto_32416 ) ) ( not ( = ?auto_32413 ?auto_32416 ) ) ( not ( = ?auto_32427 ?auto_32416 ) ) ( HOIST-AT ?auto_32417 ?auto_32416 ) ( not ( = ?auto_32425 ?auto_32417 ) ) ( not ( = ?auto_32422 ?auto_32417 ) ) ( not ( = ?auto_32414 ?auto_32417 ) ) ( not ( = ?auto_32423 ?auto_32417 ) ) ( AVAILABLE ?auto_32417 ) ( SURFACE-AT ?auto_32418 ?auto_32416 ) ( ON ?auto_32418 ?auto_32431 ) ( CLEAR ?auto_32418 ) ( not ( = ?auto_32410 ?auto_32431 ) ) ( not ( = ?auto_32411 ?auto_32431 ) ) ( not ( = ?auto_32421 ?auto_32431 ) ) ( not ( = ?auto_32419 ?auto_32431 ) ) ( not ( = ?auto_32424 ?auto_32431 ) ) ( not ( = ?auto_32412 ?auto_32431 ) ) ( not ( = ?auto_32420 ?auto_32431 ) ) ( not ( = ?auto_32418 ?auto_32431 ) ) ( not ( = ?auto_32429 ?auto_32431 ) ) ( not ( = ?auto_32415 ?auto_32431 ) ) ( TRUCK-AT ?auto_32426 ?auto_32428 ) ( SURFACE-AT ?auto_32432 ?auto_32428 ) ( CLEAR ?auto_32432 ) ( LIFTING ?auto_32425 ?auto_32415 ) ( IS-CRATE ?auto_32415 ) ( not ( = ?auto_32410 ?auto_32432 ) ) ( not ( = ?auto_32411 ?auto_32432 ) ) ( not ( = ?auto_32421 ?auto_32432 ) ) ( not ( = ?auto_32419 ?auto_32432 ) ) ( not ( = ?auto_32424 ?auto_32432 ) ) ( not ( = ?auto_32412 ?auto_32432 ) ) ( not ( = ?auto_32420 ?auto_32432 ) ) ( not ( = ?auto_32418 ?auto_32432 ) ) ( not ( = ?auto_32429 ?auto_32432 ) ) ( not ( = ?auto_32415 ?auto_32432 ) ) ( not ( = ?auto_32431 ?auto_32432 ) ) )
    :subtasks
    ( ( !DROP ?auto_32425 ?auto_32415 ?auto_32432 ?auto_32428 )
      ( MAKE-ON ?auto_32410 ?auto_32411 )
      ( MAKE-ON-VERIFY ?auto_32410 ?auto_32411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32433 - SURFACE
      ?auto_32434 - SURFACE
    )
    :vars
    (
      ?auto_32440 - HOIST
      ?auto_32437 - PLACE
      ?auto_32454 - PLACE
      ?auto_32441 - HOIST
      ?auto_32442 - SURFACE
      ?auto_32443 - SURFACE
      ?auto_32435 - PLACE
      ?auto_32448 - HOIST
      ?auto_32445 - SURFACE
      ?auto_32449 - SURFACE
      ?auto_32446 - SURFACE
      ?auto_32453 - SURFACE
      ?auto_32438 - PLACE
      ?auto_32450 - HOIST
      ?auto_32436 - SURFACE
      ?auto_32447 - SURFACE
      ?auto_32439 - PLACE
      ?auto_32444 - HOIST
      ?auto_32455 - SURFACE
      ?auto_32452 - TRUCK
      ?auto_32451 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32440 ?auto_32437 ) ( IS-CRATE ?auto_32433 ) ( not ( = ?auto_32433 ?auto_32434 ) ) ( not ( = ?auto_32454 ?auto_32437 ) ) ( HOIST-AT ?auto_32441 ?auto_32454 ) ( not ( = ?auto_32440 ?auto_32441 ) ) ( AVAILABLE ?auto_32441 ) ( SURFACE-AT ?auto_32433 ?auto_32454 ) ( ON ?auto_32433 ?auto_32442 ) ( CLEAR ?auto_32433 ) ( not ( = ?auto_32433 ?auto_32442 ) ) ( not ( = ?auto_32434 ?auto_32442 ) ) ( IS-CRATE ?auto_32434 ) ( not ( = ?auto_32433 ?auto_32443 ) ) ( not ( = ?auto_32434 ?auto_32443 ) ) ( not ( = ?auto_32442 ?auto_32443 ) ) ( not ( = ?auto_32435 ?auto_32437 ) ) ( not ( = ?auto_32454 ?auto_32435 ) ) ( HOIST-AT ?auto_32448 ?auto_32435 ) ( not ( = ?auto_32440 ?auto_32448 ) ) ( not ( = ?auto_32441 ?auto_32448 ) ) ( SURFACE-AT ?auto_32434 ?auto_32435 ) ( ON ?auto_32434 ?auto_32445 ) ( CLEAR ?auto_32434 ) ( not ( = ?auto_32433 ?auto_32445 ) ) ( not ( = ?auto_32434 ?auto_32445 ) ) ( not ( = ?auto_32442 ?auto_32445 ) ) ( not ( = ?auto_32443 ?auto_32445 ) ) ( IS-CRATE ?auto_32443 ) ( not ( = ?auto_32433 ?auto_32449 ) ) ( not ( = ?auto_32434 ?auto_32449 ) ) ( not ( = ?auto_32442 ?auto_32449 ) ) ( not ( = ?auto_32443 ?auto_32449 ) ) ( not ( = ?auto_32445 ?auto_32449 ) ) ( AVAILABLE ?auto_32448 ) ( SURFACE-AT ?auto_32443 ?auto_32435 ) ( ON ?auto_32443 ?auto_32446 ) ( CLEAR ?auto_32443 ) ( not ( = ?auto_32433 ?auto_32446 ) ) ( not ( = ?auto_32434 ?auto_32446 ) ) ( not ( = ?auto_32442 ?auto_32446 ) ) ( not ( = ?auto_32443 ?auto_32446 ) ) ( not ( = ?auto_32445 ?auto_32446 ) ) ( not ( = ?auto_32449 ?auto_32446 ) ) ( IS-CRATE ?auto_32449 ) ( not ( = ?auto_32433 ?auto_32453 ) ) ( not ( = ?auto_32434 ?auto_32453 ) ) ( not ( = ?auto_32442 ?auto_32453 ) ) ( not ( = ?auto_32443 ?auto_32453 ) ) ( not ( = ?auto_32445 ?auto_32453 ) ) ( not ( = ?auto_32449 ?auto_32453 ) ) ( not ( = ?auto_32446 ?auto_32453 ) ) ( not ( = ?auto_32438 ?auto_32437 ) ) ( not ( = ?auto_32454 ?auto_32438 ) ) ( not ( = ?auto_32435 ?auto_32438 ) ) ( HOIST-AT ?auto_32450 ?auto_32438 ) ( not ( = ?auto_32440 ?auto_32450 ) ) ( not ( = ?auto_32441 ?auto_32450 ) ) ( not ( = ?auto_32448 ?auto_32450 ) ) ( AVAILABLE ?auto_32450 ) ( SURFACE-AT ?auto_32449 ?auto_32438 ) ( ON ?auto_32449 ?auto_32436 ) ( CLEAR ?auto_32449 ) ( not ( = ?auto_32433 ?auto_32436 ) ) ( not ( = ?auto_32434 ?auto_32436 ) ) ( not ( = ?auto_32442 ?auto_32436 ) ) ( not ( = ?auto_32443 ?auto_32436 ) ) ( not ( = ?auto_32445 ?auto_32436 ) ) ( not ( = ?auto_32449 ?auto_32436 ) ) ( not ( = ?auto_32446 ?auto_32436 ) ) ( not ( = ?auto_32453 ?auto_32436 ) ) ( IS-CRATE ?auto_32453 ) ( not ( = ?auto_32433 ?auto_32447 ) ) ( not ( = ?auto_32434 ?auto_32447 ) ) ( not ( = ?auto_32442 ?auto_32447 ) ) ( not ( = ?auto_32443 ?auto_32447 ) ) ( not ( = ?auto_32445 ?auto_32447 ) ) ( not ( = ?auto_32449 ?auto_32447 ) ) ( not ( = ?auto_32446 ?auto_32447 ) ) ( not ( = ?auto_32453 ?auto_32447 ) ) ( not ( = ?auto_32436 ?auto_32447 ) ) ( not ( = ?auto_32439 ?auto_32437 ) ) ( not ( = ?auto_32454 ?auto_32439 ) ) ( not ( = ?auto_32435 ?auto_32439 ) ) ( not ( = ?auto_32438 ?auto_32439 ) ) ( HOIST-AT ?auto_32444 ?auto_32439 ) ( not ( = ?auto_32440 ?auto_32444 ) ) ( not ( = ?auto_32441 ?auto_32444 ) ) ( not ( = ?auto_32448 ?auto_32444 ) ) ( not ( = ?auto_32450 ?auto_32444 ) ) ( AVAILABLE ?auto_32444 ) ( SURFACE-AT ?auto_32453 ?auto_32439 ) ( ON ?auto_32453 ?auto_32455 ) ( CLEAR ?auto_32453 ) ( not ( = ?auto_32433 ?auto_32455 ) ) ( not ( = ?auto_32434 ?auto_32455 ) ) ( not ( = ?auto_32442 ?auto_32455 ) ) ( not ( = ?auto_32443 ?auto_32455 ) ) ( not ( = ?auto_32445 ?auto_32455 ) ) ( not ( = ?auto_32449 ?auto_32455 ) ) ( not ( = ?auto_32446 ?auto_32455 ) ) ( not ( = ?auto_32453 ?auto_32455 ) ) ( not ( = ?auto_32436 ?auto_32455 ) ) ( not ( = ?auto_32447 ?auto_32455 ) ) ( TRUCK-AT ?auto_32452 ?auto_32437 ) ( SURFACE-AT ?auto_32451 ?auto_32437 ) ( CLEAR ?auto_32451 ) ( IS-CRATE ?auto_32447 ) ( not ( = ?auto_32433 ?auto_32451 ) ) ( not ( = ?auto_32434 ?auto_32451 ) ) ( not ( = ?auto_32442 ?auto_32451 ) ) ( not ( = ?auto_32443 ?auto_32451 ) ) ( not ( = ?auto_32445 ?auto_32451 ) ) ( not ( = ?auto_32449 ?auto_32451 ) ) ( not ( = ?auto_32446 ?auto_32451 ) ) ( not ( = ?auto_32453 ?auto_32451 ) ) ( not ( = ?auto_32436 ?auto_32451 ) ) ( not ( = ?auto_32447 ?auto_32451 ) ) ( not ( = ?auto_32455 ?auto_32451 ) ) ( AVAILABLE ?auto_32440 ) ( IN ?auto_32447 ?auto_32452 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32440 ?auto_32447 ?auto_32452 ?auto_32437 )
      ( MAKE-ON ?auto_32433 ?auto_32434 )
      ( MAKE-ON-VERIFY ?auto_32433 ?auto_32434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32456 - SURFACE
      ?auto_32457 - SURFACE
    )
    :vars
    (
      ?auto_32463 - HOIST
      ?auto_32459 - PLACE
      ?auto_32468 - PLACE
      ?auto_32473 - HOIST
      ?auto_32470 - SURFACE
      ?auto_32474 - SURFACE
      ?auto_32464 - PLACE
      ?auto_32471 - HOIST
      ?auto_32458 - SURFACE
      ?auto_32477 - SURFACE
      ?auto_32469 - SURFACE
      ?auto_32467 - SURFACE
      ?auto_32476 - PLACE
      ?auto_32475 - HOIST
      ?auto_32461 - SURFACE
      ?auto_32478 - SURFACE
      ?auto_32462 - PLACE
      ?auto_32460 - HOIST
      ?auto_32465 - SURFACE
      ?auto_32472 - SURFACE
      ?auto_32466 - TRUCK
      ?auto_32479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32463 ?auto_32459 ) ( IS-CRATE ?auto_32456 ) ( not ( = ?auto_32456 ?auto_32457 ) ) ( not ( = ?auto_32468 ?auto_32459 ) ) ( HOIST-AT ?auto_32473 ?auto_32468 ) ( not ( = ?auto_32463 ?auto_32473 ) ) ( AVAILABLE ?auto_32473 ) ( SURFACE-AT ?auto_32456 ?auto_32468 ) ( ON ?auto_32456 ?auto_32470 ) ( CLEAR ?auto_32456 ) ( not ( = ?auto_32456 ?auto_32470 ) ) ( not ( = ?auto_32457 ?auto_32470 ) ) ( IS-CRATE ?auto_32457 ) ( not ( = ?auto_32456 ?auto_32474 ) ) ( not ( = ?auto_32457 ?auto_32474 ) ) ( not ( = ?auto_32470 ?auto_32474 ) ) ( not ( = ?auto_32464 ?auto_32459 ) ) ( not ( = ?auto_32468 ?auto_32464 ) ) ( HOIST-AT ?auto_32471 ?auto_32464 ) ( not ( = ?auto_32463 ?auto_32471 ) ) ( not ( = ?auto_32473 ?auto_32471 ) ) ( SURFACE-AT ?auto_32457 ?auto_32464 ) ( ON ?auto_32457 ?auto_32458 ) ( CLEAR ?auto_32457 ) ( not ( = ?auto_32456 ?auto_32458 ) ) ( not ( = ?auto_32457 ?auto_32458 ) ) ( not ( = ?auto_32470 ?auto_32458 ) ) ( not ( = ?auto_32474 ?auto_32458 ) ) ( IS-CRATE ?auto_32474 ) ( not ( = ?auto_32456 ?auto_32477 ) ) ( not ( = ?auto_32457 ?auto_32477 ) ) ( not ( = ?auto_32470 ?auto_32477 ) ) ( not ( = ?auto_32474 ?auto_32477 ) ) ( not ( = ?auto_32458 ?auto_32477 ) ) ( AVAILABLE ?auto_32471 ) ( SURFACE-AT ?auto_32474 ?auto_32464 ) ( ON ?auto_32474 ?auto_32469 ) ( CLEAR ?auto_32474 ) ( not ( = ?auto_32456 ?auto_32469 ) ) ( not ( = ?auto_32457 ?auto_32469 ) ) ( not ( = ?auto_32470 ?auto_32469 ) ) ( not ( = ?auto_32474 ?auto_32469 ) ) ( not ( = ?auto_32458 ?auto_32469 ) ) ( not ( = ?auto_32477 ?auto_32469 ) ) ( IS-CRATE ?auto_32477 ) ( not ( = ?auto_32456 ?auto_32467 ) ) ( not ( = ?auto_32457 ?auto_32467 ) ) ( not ( = ?auto_32470 ?auto_32467 ) ) ( not ( = ?auto_32474 ?auto_32467 ) ) ( not ( = ?auto_32458 ?auto_32467 ) ) ( not ( = ?auto_32477 ?auto_32467 ) ) ( not ( = ?auto_32469 ?auto_32467 ) ) ( not ( = ?auto_32476 ?auto_32459 ) ) ( not ( = ?auto_32468 ?auto_32476 ) ) ( not ( = ?auto_32464 ?auto_32476 ) ) ( HOIST-AT ?auto_32475 ?auto_32476 ) ( not ( = ?auto_32463 ?auto_32475 ) ) ( not ( = ?auto_32473 ?auto_32475 ) ) ( not ( = ?auto_32471 ?auto_32475 ) ) ( AVAILABLE ?auto_32475 ) ( SURFACE-AT ?auto_32477 ?auto_32476 ) ( ON ?auto_32477 ?auto_32461 ) ( CLEAR ?auto_32477 ) ( not ( = ?auto_32456 ?auto_32461 ) ) ( not ( = ?auto_32457 ?auto_32461 ) ) ( not ( = ?auto_32470 ?auto_32461 ) ) ( not ( = ?auto_32474 ?auto_32461 ) ) ( not ( = ?auto_32458 ?auto_32461 ) ) ( not ( = ?auto_32477 ?auto_32461 ) ) ( not ( = ?auto_32469 ?auto_32461 ) ) ( not ( = ?auto_32467 ?auto_32461 ) ) ( IS-CRATE ?auto_32467 ) ( not ( = ?auto_32456 ?auto_32478 ) ) ( not ( = ?auto_32457 ?auto_32478 ) ) ( not ( = ?auto_32470 ?auto_32478 ) ) ( not ( = ?auto_32474 ?auto_32478 ) ) ( not ( = ?auto_32458 ?auto_32478 ) ) ( not ( = ?auto_32477 ?auto_32478 ) ) ( not ( = ?auto_32469 ?auto_32478 ) ) ( not ( = ?auto_32467 ?auto_32478 ) ) ( not ( = ?auto_32461 ?auto_32478 ) ) ( not ( = ?auto_32462 ?auto_32459 ) ) ( not ( = ?auto_32468 ?auto_32462 ) ) ( not ( = ?auto_32464 ?auto_32462 ) ) ( not ( = ?auto_32476 ?auto_32462 ) ) ( HOIST-AT ?auto_32460 ?auto_32462 ) ( not ( = ?auto_32463 ?auto_32460 ) ) ( not ( = ?auto_32473 ?auto_32460 ) ) ( not ( = ?auto_32471 ?auto_32460 ) ) ( not ( = ?auto_32475 ?auto_32460 ) ) ( AVAILABLE ?auto_32460 ) ( SURFACE-AT ?auto_32467 ?auto_32462 ) ( ON ?auto_32467 ?auto_32465 ) ( CLEAR ?auto_32467 ) ( not ( = ?auto_32456 ?auto_32465 ) ) ( not ( = ?auto_32457 ?auto_32465 ) ) ( not ( = ?auto_32470 ?auto_32465 ) ) ( not ( = ?auto_32474 ?auto_32465 ) ) ( not ( = ?auto_32458 ?auto_32465 ) ) ( not ( = ?auto_32477 ?auto_32465 ) ) ( not ( = ?auto_32469 ?auto_32465 ) ) ( not ( = ?auto_32467 ?auto_32465 ) ) ( not ( = ?auto_32461 ?auto_32465 ) ) ( not ( = ?auto_32478 ?auto_32465 ) ) ( SURFACE-AT ?auto_32472 ?auto_32459 ) ( CLEAR ?auto_32472 ) ( IS-CRATE ?auto_32478 ) ( not ( = ?auto_32456 ?auto_32472 ) ) ( not ( = ?auto_32457 ?auto_32472 ) ) ( not ( = ?auto_32470 ?auto_32472 ) ) ( not ( = ?auto_32474 ?auto_32472 ) ) ( not ( = ?auto_32458 ?auto_32472 ) ) ( not ( = ?auto_32477 ?auto_32472 ) ) ( not ( = ?auto_32469 ?auto_32472 ) ) ( not ( = ?auto_32467 ?auto_32472 ) ) ( not ( = ?auto_32461 ?auto_32472 ) ) ( not ( = ?auto_32478 ?auto_32472 ) ) ( not ( = ?auto_32465 ?auto_32472 ) ) ( AVAILABLE ?auto_32463 ) ( IN ?auto_32478 ?auto_32466 ) ( TRUCK-AT ?auto_32466 ?auto_32479 ) ( not ( = ?auto_32479 ?auto_32459 ) ) ( not ( = ?auto_32468 ?auto_32479 ) ) ( not ( = ?auto_32464 ?auto_32479 ) ) ( not ( = ?auto_32476 ?auto_32479 ) ) ( not ( = ?auto_32462 ?auto_32479 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32466 ?auto_32479 ?auto_32459 )
      ( MAKE-ON ?auto_32456 ?auto_32457 )
      ( MAKE-ON-VERIFY ?auto_32456 ?auto_32457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32480 - SURFACE
      ?auto_32481 - SURFACE
    )
    :vars
    (
      ?auto_32485 - HOIST
      ?auto_32495 - PLACE
      ?auto_32483 - PLACE
      ?auto_32503 - HOIST
      ?auto_32488 - SURFACE
      ?auto_32497 - SURFACE
      ?auto_32492 - PLACE
      ?auto_32493 - HOIST
      ?auto_32501 - SURFACE
      ?auto_32490 - SURFACE
      ?auto_32487 - SURFACE
      ?auto_32486 - SURFACE
      ?auto_32489 - PLACE
      ?auto_32498 - HOIST
      ?auto_32484 - SURFACE
      ?auto_32491 - SURFACE
      ?auto_32482 - PLACE
      ?auto_32502 - HOIST
      ?auto_32496 - SURFACE
      ?auto_32494 - SURFACE
      ?auto_32500 - TRUCK
      ?auto_32499 - PLACE
      ?auto_32504 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32485 ?auto_32495 ) ( IS-CRATE ?auto_32480 ) ( not ( = ?auto_32480 ?auto_32481 ) ) ( not ( = ?auto_32483 ?auto_32495 ) ) ( HOIST-AT ?auto_32503 ?auto_32483 ) ( not ( = ?auto_32485 ?auto_32503 ) ) ( AVAILABLE ?auto_32503 ) ( SURFACE-AT ?auto_32480 ?auto_32483 ) ( ON ?auto_32480 ?auto_32488 ) ( CLEAR ?auto_32480 ) ( not ( = ?auto_32480 ?auto_32488 ) ) ( not ( = ?auto_32481 ?auto_32488 ) ) ( IS-CRATE ?auto_32481 ) ( not ( = ?auto_32480 ?auto_32497 ) ) ( not ( = ?auto_32481 ?auto_32497 ) ) ( not ( = ?auto_32488 ?auto_32497 ) ) ( not ( = ?auto_32492 ?auto_32495 ) ) ( not ( = ?auto_32483 ?auto_32492 ) ) ( HOIST-AT ?auto_32493 ?auto_32492 ) ( not ( = ?auto_32485 ?auto_32493 ) ) ( not ( = ?auto_32503 ?auto_32493 ) ) ( SURFACE-AT ?auto_32481 ?auto_32492 ) ( ON ?auto_32481 ?auto_32501 ) ( CLEAR ?auto_32481 ) ( not ( = ?auto_32480 ?auto_32501 ) ) ( not ( = ?auto_32481 ?auto_32501 ) ) ( not ( = ?auto_32488 ?auto_32501 ) ) ( not ( = ?auto_32497 ?auto_32501 ) ) ( IS-CRATE ?auto_32497 ) ( not ( = ?auto_32480 ?auto_32490 ) ) ( not ( = ?auto_32481 ?auto_32490 ) ) ( not ( = ?auto_32488 ?auto_32490 ) ) ( not ( = ?auto_32497 ?auto_32490 ) ) ( not ( = ?auto_32501 ?auto_32490 ) ) ( AVAILABLE ?auto_32493 ) ( SURFACE-AT ?auto_32497 ?auto_32492 ) ( ON ?auto_32497 ?auto_32487 ) ( CLEAR ?auto_32497 ) ( not ( = ?auto_32480 ?auto_32487 ) ) ( not ( = ?auto_32481 ?auto_32487 ) ) ( not ( = ?auto_32488 ?auto_32487 ) ) ( not ( = ?auto_32497 ?auto_32487 ) ) ( not ( = ?auto_32501 ?auto_32487 ) ) ( not ( = ?auto_32490 ?auto_32487 ) ) ( IS-CRATE ?auto_32490 ) ( not ( = ?auto_32480 ?auto_32486 ) ) ( not ( = ?auto_32481 ?auto_32486 ) ) ( not ( = ?auto_32488 ?auto_32486 ) ) ( not ( = ?auto_32497 ?auto_32486 ) ) ( not ( = ?auto_32501 ?auto_32486 ) ) ( not ( = ?auto_32490 ?auto_32486 ) ) ( not ( = ?auto_32487 ?auto_32486 ) ) ( not ( = ?auto_32489 ?auto_32495 ) ) ( not ( = ?auto_32483 ?auto_32489 ) ) ( not ( = ?auto_32492 ?auto_32489 ) ) ( HOIST-AT ?auto_32498 ?auto_32489 ) ( not ( = ?auto_32485 ?auto_32498 ) ) ( not ( = ?auto_32503 ?auto_32498 ) ) ( not ( = ?auto_32493 ?auto_32498 ) ) ( AVAILABLE ?auto_32498 ) ( SURFACE-AT ?auto_32490 ?auto_32489 ) ( ON ?auto_32490 ?auto_32484 ) ( CLEAR ?auto_32490 ) ( not ( = ?auto_32480 ?auto_32484 ) ) ( not ( = ?auto_32481 ?auto_32484 ) ) ( not ( = ?auto_32488 ?auto_32484 ) ) ( not ( = ?auto_32497 ?auto_32484 ) ) ( not ( = ?auto_32501 ?auto_32484 ) ) ( not ( = ?auto_32490 ?auto_32484 ) ) ( not ( = ?auto_32487 ?auto_32484 ) ) ( not ( = ?auto_32486 ?auto_32484 ) ) ( IS-CRATE ?auto_32486 ) ( not ( = ?auto_32480 ?auto_32491 ) ) ( not ( = ?auto_32481 ?auto_32491 ) ) ( not ( = ?auto_32488 ?auto_32491 ) ) ( not ( = ?auto_32497 ?auto_32491 ) ) ( not ( = ?auto_32501 ?auto_32491 ) ) ( not ( = ?auto_32490 ?auto_32491 ) ) ( not ( = ?auto_32487 ?auto_32491 ) ) ( not ( = ?auto_32486 ?auto_32491 ) ) ( not ( = ?auto_32484 ?auto_32491 ) ) ( not ( = ?auto_32482 ?auto_32495 ) ) ( not ( = ?auto_32483 ?auto_32482 ) ) ( not ( = ?auto_32492 ?auto_32482 ) ) ( not ( = ?auto_32489 ?auto_32482 ) ) ( HOIST-AT ?auto_32502 ?auto_32482 ) ( not ( = ?auto_32485 ?auto_32502 ) ) ( not ( = ?auto_32503 ?auto_32502 ) ) ( not ( = ?auto_32493 ?auto_32502 ) ) ( not ( = ?auto_32498 ?auto_32502 ) ) ( AVAILABLE ?auto_32502 ) ( SURFACE-AT ?auto_32486 ?auto_32482 ) ( ON ?auto_32486 ?auto_32496 ) ( CLEAR ?auto_32486 ) ( not ( = ?auto_32480 ?auto_32496 ) ) ( not ( = ?auto_32481 ?auto_32496 ) ) ( not ( = ?auto_32488 ?auto_32496 ) ) ( not ( = ?auto_32497 ?auto_32496 ) ) ( not ( = ?auto_32501 ?auto_32496 ) ) ( not ( = ?auto_32490 ?auto_32496 ) ) ( not ( = ?auto_32487 ?auto_32496 ) ) ( not ( = ?auto_32486 ?auto_32496 ) ) ( not ( = ?auto_32484 ?auto_32496 ) ) ( not ( = ?auto_32491 ?auto_32496 ) ) ( SURFACE-AT ?auto_32494 ?auto_32495 ) ( CLEAR ?auto_32494 ) ( IS-CRATE ?auto_32491 ) ( not ( = ?auto_32480 ?auto_32494 ) ) ( not ( = ?auto_32481 ?auto_32494 ) ) ( not ( = ?auto_32488 ?auto_32494 ) ) ( not ( = ?auto_32497 ?auto_32494 ) ) ( not ( = ?auto_32501 ?auto_32494 ) ) ( not ( = ?auto_32490 ?auto_32494 ) ) ( not ( = ?auto_32487 ?auto_32494 ) ) ( not ( = ?auto_32486 ?auto_32494 ) ) ( not ( = ?auto_32484 ?auto_32494 ) ) ( not ( = ?auto_32491 ?auto_32494 ) ) ( not ( = ?auto_32496 ?auto_32494 ) ) ( AVAILABLE ?auto_32485 ) ( TRUCK-AT ?auto_32500 ?auto_32499 ) ( not ( = ?auto_32499 ?auto_32495 ) ) ( not ( = ?auto_32483 ?auto_32499 ) ) ( not ( = ?auto_32492 ?auto_32499 ) ) ( not ( = ?auto_32489 ?auto_32499 ) ) ( not ( = ?auto_32482 ?auto_32499 ) ) ( HOIST-AT ?auto_32504 ?auto_32499 ) ( LIFTING ?auto_32504 ?auto_32491 ) ( not ( = ?auto_32485 ?auto_32504 ) ) ( not ( = ?auto_32503 ?auto_32504 ) ) ( not ( = ?auto_32493 ?auto_32504 ) ) ( not ( = ?auto_32498 ?auto_32504 ) ) ( not ( = ?auto_32502 ?auto_32504 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32504 ?auto_32491 ?auto_32500 ?auto_32499 )
      ( MAKE-ON ?auto_32480 ?auto_32481 )
      ( MAKE-ON-VERIFY ?auto_32480 ?auto_32481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32505 - SURFACE
      ?auto_32506 - SURFACE
    )
    :vars
    (
      ?auto_32527 - HOIST
      ?auto_32509 - PLACE
      ?auto_32528 - PLACE
      ?auto_32513 - HOIST
      ?auto_32507 - SURFACE
      ?auto_32522 - SURFACE
      ?auto_32516 - PLACE
      ?auto_32517 - HOIST
      ?auto_32518 - SURFACE
      ?auto_32523 - SURFACE
      ?auto_32524 - SURFACE
      ?auto_32529 - SURFACE
      ?auto_32525 - PLACE
      ?auto_32512 - HOIST
      ?auto_32526 - SURFACE
      ?auto_32510 - SURFACE
      ?auto_32520 - PLACE
      ?auto_32508 - HOIST
      ?auto_32521 - SURFACE
      ?auto_32515 - SURFACE
      ?auto_32511 - TRUCK
      ?auto_32514 - PLACE
      ?auto_32519 - HOIST
      ?auto_32530 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32527 ?auto_32509 ) ( IS-CRATE ?auto_32505 ) ( not ( = ?auto_32505 ?auto_32506 ) ) ( not ( = ?auto_32528 ?auto_32509 ) ) ( HOIST-AT ?auto_32513 ?auto_32528 ) ( not ( = ?auto_32527 ?auto_32513 ) ) ( AVAILABLE ?auto_32513 ) ( SURFACE-AT ?auto_32505 ?auto_32528 ) ( ON ?auto_32505 ?auto_32507 ) ( CLEAR ?auto_32505 ) ( not ( = ?auto_32505 ?auto_32507 ) ) ( not ( = ?auto_32506 ?auto_32507 ) ) ( IS-CRATE ?auto_32506 ) ( not ( = ?auto_32505 ?auto_32522 ) ) ( not ( = ?auto_32506 ?auto_32522 ) ) ( not ( = ?auto_32507 ?auto_32522 ) ) ( not ( = ?auto_32516 ?auto_32509 ) ) ( not ( = ?auto_32528 ?auto_32516 ) ) ( HOIST-AT ?auto_32517 ?auto_32516 ) ( not ( = ?auto_32527 ?auto_32517 ) ) ( not ( = ?auto_32513 ?auto_32517 ) ) ( SURFACE-AT ?auto_32506 ?auto_32516 ) ( ON ?auto_32506 ?auto_32518 ) ( CLEAR ?auto_32506 ) ( not ( = ?auto_32505 ?auto_32518 ) ) ( not ( = ?auto_32506 ?auto_32518 ) ) ( not ( = ?auto_32507 ?auto_32518 ) ) ( not ( = ?auto_32522 ?auto_32518 ) ) ( IS-CRATE ?auto_32522 ) ( not ( = ?auto_32505 ?auto_32523 ) ) ( not ( = ?auto_32506 ?auto_32523 ) ) ( not ( = ?auto_32507 ?auto_32523 ) ) ( not ( = ?auto_32522 ?auto_32523 ) ) ( not ( = ?auto_32518 ?auto_32523 ) ) ( AVAILABLE ?auto_32517 ) ( SURFACE-AT ?auto_32522 ?auto_32516 ) ( ON ?auto_32522 ?auto_32524 ) ( CLEAR ?auto_32522 ) ( not ( = ?auto_32505 ?auto_32524 ) ) ( not ( = ?auto_32506 ?auto_32524 ) ) ( not ( = ?auto_32507 ?auto_32524 ) ) ( not ( = ?auto_32522 ?auto_32524 ) ) ( not ( = ?auto_32518 ?auto_32524 ) ) ( not ( = ?auto_32523 ?auto_32524 ) ) ( IS-CRATE ?auto_32523 ) ( not ( = ?auto_32505 ?auto_32529 ) ) ( not ( = ?auto_32506 ?auto_32529 ) ) ( not ( = ?auto_32507 ?auto_32529 ) ) ( not ( = ?auto_32522 ?auto_32529 ) ) ( not ( = ?auto_32518 ?auto_32529 ) ) ( not ( = ?auto_32523 ?auto_32529 ) ) ( not ( = ?auto_32524 ?auto_32529 ) ) ( not ( = ?auto_32525 ?auto_32509 ) ) ( not ( = ?auto_32528 ?auto_32525 ) ) ( not ( = ?auto_32516 ?auto_32525 ) ) ( HOIST-AT ?auto_32512 ?auto_32525 ) ( not ( = ?auto_32527 ?auto_32512 ) ) ( not ( = ?auto_32513 ?auto_32512 ) ) ( not ( = ?auto_32517 ?auto_32512 ) ) ( AVAILABLE ?auto_32512 ) ( SURFACE-AT ?auto_32523 ?auto_32525 ) ( ON ?auto_32523 ?auto_32526 ) ( CLEAR ?auto_32523 ) ( not ( = ?auto_32505 ?auto_32526 ) ) ( not ( = ?auto_32506 ?auto_32526 ) ) ( not ( = ?auto_32507 ?auto_32526 ) ) ( not ( = ?auto_32522 ?auto_32526 ) ) ( not ( = ?auto_32518 ?auto_32526 ) ) ( not ( = ?auto_32523 ?auto_32526 ) ) ( not ( = ?auto_32524 ?auto_32526 ) ) ( not ( = ?auto_32529 ?auto_32526 ) ) ( IS-CRATE ?auto_32529 ) ( not ( = ?auto_32505 ?auto_32510 ) ) ( not ( = ?auto_32506 ?auto_32510 ) ) ( not ( = ?auto_32507 ?auto_32510 ) ) ( not ( = ?auto_32522 ?auto_32510 ) ) ( not ( = ?auto_32518 ?auto_32510 ) ) ( not ( = ?auto_32523 ?auto_32510 ) ) ( not ( = ?auto_32524 ?auto_32510 ) ) ( not ( = ?auto_32529 ?auto_32510 ) ) ( not ( = ?auto_32526 ?auto_32510 ) ) ( not ( = ?auto_32520 ?auto_32509 ) ) ( not ( = ?auto_32528 ?auto_32520 ) ) ( not ( = ?auto_32516 ?auto_32520 ) ) ( not ( = ?auto_32525 ?auto_32520 ) ) ( HOIST-AT ?auto_32508 ?auto_32520 ) ( not ( = ?auto_32527 ?auto_32508 ) ) ( not ( = ?auto_32513 ?auto_32508 ) ) ( not ( = ?auto_32517 ?auto_32508 ) ) ( not ( = ?auto_32512 ?auto_32508 ) ) ( AVAILABLE ?auto_32508 ) ( SURFACE-AT ?auto_32529 ?auto_32520 ) ( ON ?auto_32529 ?auto_32521 ) ( CLEAR ?auto_32529 ) ( not ( = ?auto_32505 ?auto_32521 ) ) ( not ( = ?auto_32506 ?auto_32521 ) ) ( not ( = ?auto_32507 ?auto_32521 ) ) ( not ( = ?auto_32522 ?auto_32521 ) ) ( not ( = ?auto_32518 ?auto_32521 ) ) ( not ( = ?auto_32523 ?auto_32521 ) ) ( not ( = ?auto_32524 ?auto_32521 ) ) ( not ( = ?auto_32529 ?auto_32521 ) ) ( not ( = ?auto_32526 ?auto_32521 ) ) ( not ( = ?auto_32510 ?auto_32521 ) ) ( SURFACE-AT ?auto_32515 ?auto_32509 ) ( CLEAR ?auto_32515 ) ( IS-CRATE ?auto_32510 ) ( not ( = ?auto_32505 ?auto_32515 ) ) ( not ( = ?auto_32506 ?auto_32515 ) ) ( not ( = ?auto_32507 ?auto_32515 ) ) ( not ( = ?auto_32522 ?auto_32515 ) ) ( not ( = ?auto_32518 ?auto_32515 ) ) ( not ( = ?auto_32523 ?auto_32515 ) ) ( not ( = ?auto_32524 ?auto_32515 ) ) ( not ( = ?auto_32529 ?auto_32515 ) ) ( not ( = ?auto_32526 ?auto_32515 ) ) ( not ( = ?auto_32510 ?auto_32515 ) ) ( not ( = ?auto_32521 ?auto_32515 ) ) ( AVAILABLE ?auto_32527 ) ( TRUCK-AT ?auto_32511 ?auto_32514 ) ( not ( = ?auto_32514 ?auto_32509 ) ) ( not ( = ?auto_32528 ?auto_32514 ) ) ( not ( = ?auto_32516 ?auto_32514 ) ) ( not ( = ?auto_32525 ?auto_32514 ) ) ( not ( = ?auto_32520 ?auto_32514 ) ) ( HOIST-AT ?auto_32519 ?auto_32514 ) ( not ( = ?auto_32527 ?auto_32519 ) ) ( not ( = ?auto_32513 ?auto_32519 ) ) ( not ( = ?auto_32517 ?auto_32519 ) ) ( not ( = ?auto_32512 ?auto_32519 ) ) ( not ( = ?auto_32508 ?auto_32519 ) ) ( AVAILABLE ?auto_32519 ) ( SURFACE-AT ?auto_32510 ?auto_32514 ) ( ON ?auto_32510 ?auto_32530 ) ( CLEAR ?auto_32510 ) ( not ( = ?auto_32505 ?auto_32530 ) ) ( not ( = ?auto_32506 ?auto_32530 ) ) ( not ( = ?auto_32507 ?auto_32530 ) ) ( not ( = ?auto_32522 ?auto_32530 ) ) ( not ( = ?auto_32518 ?auto_32530 ) ) ( not ( = ?auto_32523 ?auto_32530 ) ) ( not ( = ?auto_32524 ?auto_32530 ) ) ( not ( = ?auto_32529 ?auto_32530 ) ) ( not ( = ?auto_32526 ?auto_32530 ) ) ( not ( = ?auto_32510 ?auto_32530 ) ) ( not ( = ?auto_32521 ?auto_32530 ) ) ( not ( = ?auto_32515 ?auto_32530 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32519 ?auto_32510 ?auto_32530 ?auto_32514 )
      ( MAKE-ON ?auto_32505 ?auto_32506 )
      ( MAKE-ON-VERIFY ?auto_32505 ?auto_32506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32531 - SURFACE
      ?auto_32532 - SURFACE
    )
    :vars
    (
      ?auto_32534 - HOIST
      ?auto_32545 - PLACE
      ?auto_32533 - PLACE
      ?auto_32552 - HOIST
      ?auto_32554 - SURFACE
      ?auto_32543 - SURFACE
      ?auto_32555 - PLACE
      ?auto_32548 - HOIST
      ?auto_32549 - SURFACE
      ?auto_32536 - SURFACE
      ?auto_32535 - SURFACE
      ?auto_32542 - SURFACE
      ?auto_32538 - PLACE
      ?auto_32544 - HOIST
      ?auto_32537 - SURFACE
      ?auto_32547 - SURFACE
      ?auto_32551 - PLACE
      ?auto_32539 - HOIST
      ?auto_32556 - SURFACE
      ?auto_32540 - SURFACE
      ?auto_32541 - PLACE
      ?auto_32550 - HOIST
      ?auto_32553 - SURFACE
      ?auto_32546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32534 ?auto_32545 ) ( IS-CRATE ?auto_32531 ) ( not ( = ?auto_32531 ?auto_32532 ) ) ( not ( = ?auto_32533 ?auto_32545 ) ) ( HOIST-AT ?auto_32552 ?auto_32533 ) ( not ( = ?auto_32534 ?auto_32552 ) ) ( AVAILABLE ?auto_32552 ) ( SURFACE-AT ?auto_32531 ?auto_32533 ) ( ON ?auto_32531 ?auto_32554 ) ( CLEAR ?auto_32531 ) ( not ( = ?auto_32531 ?auto_32554 ) ) ( not ( = ?auto_32532 ?auto_32554 ) ) ( IS-CRATE ?auto_32532 ) ( not ( = ?auto_32531 ?auto_32543 ) ) ( not ( = ?auto_32532 ?auto_32543 ) ) ( not ( = ?auto_32554 ?auto_32543 ) ) ( not ( = ?auto_32555 ?auto_32545 ) ) ( not ( = ?auto_32533 ?auto_32555 ) ) ( HOIST-AT ?auto_32548 ?auto_32555 ) ( not ( = ?auto_32534 ?auto_32548 ) ) ( not ( = ?auto_32552 ?auto_32548 ) ) ( SURFACE-AT ?auto_32532 ?auto_32555 ) ( ON ?auto_32532 ?auto_32549 ) ( CLEAR ?auto_32532 ) ( not ( = ?auto_32531 ?auto_32549 ) ) ( not ( = ?auto_32532 ?auto_32549 ) ) ( not ( = ?auto_32554 ?auto_32549 ) ) ( not ( = ?auto_32543 ?auto_32549 ) ) ( IS-CRATE ?auto_32543 ) ( not ( = ?auto_32531 ?auto_32536 ) ) ( not ( = ?auto_32532 ?auto_32536 ) ) ( not ( = ?auto_32554 ?auto_32536 ) ) ( not ( = ?auto_32543 ?auto_32536 ) ) ( not ( = ?auto_32549 ?auto_32536 ) ) ( AVAILABLE ?auto_32548 ) ( SURFACE-AT ?auto_32543 ?auto_32555 ) ( ON ?auto_32543 ?auto_32535 ) ( CLEAR ?auto_32543 ) ( not ( = ?auto_32531 ?auto_32535 ) ) ( not ( = ?auto_32532 ?auto_32535 ) ) ( not ( = ?auto_32554 ?auto_32535 ) ) ( not ( = ?auto_32543 ?auto_32535 ) ) ( not ( = ?auto_32549 ?auto_32535 ) ) ( not ( = ?auto_32536 ?auto_32535 ) ) ( IS-CRATE ?auto_32536 ) ( not ( = ?auto_32531 ?auto_32542 ) ) ( not ( = ?auto_32532 ?auto_32542 ) ) ( not ( = ?auto_32554 ?auto_32542 ) ) ( not ( = ?auto_32543 ?auto_32542 ) ) ( not ( = ?auto_32549 ?auto_32542 ) ) ( not ( = ?auto_32536 ?auto_32542 ) ) ( not ( = ?auto_32535 ?auto_32542 ) ) ( not ( = ?auto_32538 ?auto_32545 ) ) ( not ( = ?auto_32533 ?auto_32538 ) ) ( not ( = ?auto_32555 ?auto_32538 ) ) ( HOIST-AT ?auto_32544 ?auto_32538 ) ( not ( = ?auto_32534 ?auto_32544 ) ) ( not ( = ?auto_32552 ?auto_32544 ) ) ( not ( = ?auto_32548 ?auto_32544 ) ) ( AVAILABLE ?auto_32544 ) ( SURFACE-AT ?auto_32536 ?auto_32538 ) ( ON ?auto_32536 ?auto_32537 ) ( CLEAR ?auto_32536 ) ( not ( = ?auto_32531 ?auto_32537 ) ) ( not ( = ?auto_32532 ?auto_32537 ) ) ( not ( = ?auto_32554 ?auto_32537 ) ) ( not ( = ?auto_32543 ?auto_32537 ) ) ( not ( = ?auto_32549 ?auto_32537 ) ) ( not ( = ?auto_32536 ?auto_32537 ) ) ( not ( = ?auto_32535 ?auto_32537 ) ) ( not ( = ?auto_32542 ?auto_32537 ) ) ( IS-CRATE ?auto_32542 ) ( not ( = ?auto_32531 ?auto_32547 ) ) ( not ( = ?auto_32532 ?auto_32547 ) ) ( not ( = ?auto_32554 ?auto_32547 ) ) ( not ( = ?auto_32543 ?auto_32547 ) ) ( not ( = ?auto_32549 ?auto_32547 ) ) ( not ( = ?auto_32536 ?auto_32547 ) ) ( not ( = ?auto_32535 ?auto_32547 ) ) ( not ( = ?auto_32542 ?auto_32547 ) ) ( not ( = ?auto_32537 ?auto_32547 ) ) ( not ( = ?auto_32551 ?auto_32545 ) ) ( not ( = ?auto_32533 ?auto_32551 ) ) ( not ( = ?auto_32555 ?auto_32551 ) ) ( not ( = ?auto_32538 ?auto_32551 ) ) ( HOIST-AT ?auto_32539 ?auto_32551 ) ( not ( = ?auto_32534 ?auto_32539 ) ) ( not ( = ?auto_32552 ?auto_32539 ) ) ( not ( = ?auto_32548 ?auto_32539 ) ) ( not ( = ?auto_32544 ?auto_32539 ) ) ( AVAILABLE ?auto_32539 ) ( SURFACE-AT ?auto_32542 ?auto_32551 ) ( ON ?auto_32542 ?auto_32556 ) ( CLEAR ?auto_32542 ) ( not ( = ?auto_32531 ?auto_32556 ) ) ( not ( = ?auto_32532 ?auto_32556 ) ) ( not ( = ?auto_32554 ?auto_32556 ) ) ( not ( = ?auto_32543 ?auto_32556 ) ) ( not ( = ?auto_32549 ?auto_32556 ) ) ( not ( = ?auto_32536 ?auto_32556 ) ) ( not ( = ?auto_32535 ?auto_32556 ) ) ( not ( = ?auto_32542 ?auto_32556 ) ) ( not ( = ?auto_32537 ?auto_32556 ) ) ( not ( = ?auto_32547 ?auto_32556 ) ) ( SURFACE-AT ?auto_32540 ?auto_32545 ) ( CLEAR ?auto_32540 ) ( IS-CRATE ?auto_32547 ) ( not ( = ?auto_32531 ?auto_32540 ) ) ( not ( = ?auto_32532 ?auto_32540 ) ) ( not ( = ?auto_32554 ?auto_32540 ) ) ( not ( = ?auto_32543 ?auto_32540 ) ) ( not ( = ?auto_32549 ?auto_32540 ) ) ( not ( = ?auto_32536 ?auto_32540 ) ) ( not ( = ?auto_32535 ?auto_32540 ) ) ( not ( = ?auto_32542 ?auto_32540 ) ) ( not ( = ?auto_32537 ?auto_32540 ) ) ( not ( = ?auto_32547 ?auto_32540 ) ) ( not ( = ?auto_32556 ?auto_32540 ) ) ( AVAILABLE ?auto_32534 ) ( not ( = ?auto_32541 ?auto_32545 ) ) ( not ( = ?auto_32533 ?auto_32541 ) ) ( not ( = ?auto_32555 ?auto_32541 ) ) ( not ( = ?auto_32538 ?auto_32541 ) ) ( not ( = ?auto_32551 ?auto_32541 ) ) ( HOIST-AT ?auto_32550 ?auto_32541 ) ( not ( = ?auto_32534 ?auto_32550 ) ) ( not ( = ?auto_32552 ?auto_32550 ) ) ( not ( = ?auto_32548 ?auto_32550 ) ) ( not ( = ?auto_32544 ?auto_32550 ) ) ( not ( = ?auto_32539 ?auto_32550 ) ) ( AVAILABLE ?auto_32550 ) ( SURFACE-AT ?auto_32547 ?auto_32541 ) ( ON ?auto_32547 ?auto_32553 ) ( CLEAR ?auto_32547 ) ( not ( = ?auto_32531 ?auto_32553 ) ) ( not ( = ?auto_32532 ?auto_32553 ) ) ( not ( = ?auto_32554 ?auto_32553 ) ) ( not ( = ?auto_32543 ?auto_32553 ) ) ( not ( = ?auto_32549 ?auto_32553 ) ) ( not ( = ?auto_32536 ?auto_32553 ) ) ( not ( = ?auto_32535 ?auto_32553 ) ) ( not ( = ?auto_32542 ?auto_32553 ) ) ( not ( = ?auto_32537 ?auto_32553 ) ) ( not ( = ?auto_32547 ?auto_32553 ) ) ( not ( = ?auto_32556 ?auto_32553 ) ) ( not ( = ?auto_32540 ?auto_32553 ) ) ( TRUCK-AT ?auto_32546 ?auto_32545 ) )
    :subtasks
    ( ( !DRIVE ?auto_32546 ?auto_32545 ?auto_32541 )
      ( MAKE-ON ?auto_32531 ?auto_32532 )
      ( MAKE-ON-VERIFY ?auto_32531 ?auto_32532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32557 - SURFACE
      ?auto_32558 - SURFACE
    )
    :vars
    (
      ?auto_32562 - HOIST
      ?auto_32570 - PLACE
      ?auto_32569 - PLACE
      ?auto_32565 - HOIST
      ?auto_32560 - SURFACE
      ?auto_32571 - SURFACE
      ?auto_32559 - PLACE
      ?auto_32572 - HOIST
      ?auto_32578 - SURFACE
      ?auto_32563 - SURFACE
      ?auto_32561 - SURFACE
      ?auto_32568 - SURFACE
      ?auto_32576 - PLACE
      ?auto_32575 - HOIST
      ?auto_32566 - SURFACE
      ?auto_32573 - SURFACE
      ?auto_32580 - PLACE
      ?auto_32581 - HOIST
      ?auto_32577 - SURFACE
      ?auto_32567 - SURFACE
      ?auto_32582 - PLACE
      ?auto_32579 - HOIST
      ?auto_32564 - SURFACE
      ?auto_32574 - TRUCK
      ?auto_32583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32562 ?auto_32570 ) ( IS-CRATE ?auto_32557 ) ( not ( = ?auto_32557 ?auto_32558 ) ) ( not ( = ?auto_32569 ?auto_32570 ) ) ( HOIST-AT ?auto_32565 ?auto_32569 ) ( not ( = ?auto_32562 ?auto_32565 ) ) ( AVAILABLE ?auto_32565 ) ( SURFACE-AT ?auto_32557 ?auto_32569 ) ( ON ?auto_32557 ?auto_32560 ) ( CLEAR ?auto_32557 ) ( not ( = ?auto_32557 ?auto_32560 ) ) ( not ( = ?auto_32558 ?auto_32560 ) ) ( IS-CRATE ?auto_32558 ) ( not ( = ?auto_32557 ?auto_32571 ) ) ( not ( = ?auto_32558 ?auto_32571 ) ) ( not ( = ?auto_32560 ?auto_32571 ) ) ( not ( = ?auto_32559 ?auto_32570 ) ) ( not ( = ?auto_32569 ?auto_32559 ) ) ( HOIST-AT ?auto_32572 ?auto_32559 ) ( not ( = ?auto_32562 ?auto_32572 ) ) ( not ( = ?auto_32565 ?auto_32572 ) ) ( SURFACE-AT ?auto_32558 ?auto_32559 ) ( ON ?auto_32558 ?auto_32578 ) ( CLEAR ?auto_32558 ) ( not ( = ?auto_32557 ?auto_32578 ) ) ( not ( = ?auto_32558 ?auto_32578 ) ) ( not ( = ?auto_32560 ?auto_32578 ) ) ( not ( = ?auto_32571 ?auto_32578 ) ) ( IS-CRATE ?auto_32571 ) ( not ( = ?auto_32557 ?auto_32563 ) ) ( not ( = ?auto_32558 ?auto_32563 ) ) ( not ( = ?auto_32560 ?auto_32563 ) ) ( not ( = ?auto_32571 ?auto_32563 ) ) ( not ( = ?auto_32578 ?auto_32563 ) ) ( AVAILABLE ?auto_32572 ) ( SURFACE-AT ?auto_32571 ?auto_32559 ) ( ON ?auto_32571 ?auto_32561 ) ( CLEAR ?auto_32571 ) ( not ( = ?auto_32557 ?auto_32561 ) ) ( not ( = ?auto_32558 ?auto_32561 ) ) ( not ( = ?auto_32560 ?auto_32561 ) ) ( not ( = ?auto_32571 ?auto_32561 ) ) ( not ( = ?auto_32578 ?auto_32561 ) ) ( not ( = ?auto_32563 ?auto_32561 ) ) ( IS-CRATE ?auto_32563 ) ( not ( = ?auto_32557 ?auto_32568 ) ) ( not ( = ?auto_32558 ?auto_32568 ) ) ( not ( = ?auto_32560 ?auto_32568 ) ) ( not ( = ?auto_32571 ?auto_32568 ) ) ( not ( = ?auto_32578 ?auto_32568 ) ) ( not ( = ?auto_32563 ?auto_32568 ) ) ( not ( = ?auto_32561 ?auto_32568 ) ) ( not ( = ?auto_32576 ?auto_32570 ) ) ( not ( = ?auto_32569 ?auto_32576 ) ) ( not ( = ?auto_32559 ?auto_32576 ) ) ( HOIST-AT ?auto_32575 ?auto_32576 ) ( not ( = ?auto_32562 ?auto_32575 ) ) ( not ( = ?auto_32565 ?auto_32575 ) ) ( not ( = ?auto_32572 ?auto_32575 ) ) ( AVAILABLE ?auto_32575 ) ( SURFACE-AT ?auto_32563 ?auto_32576 ) ( ON ?auto_32563 ?auto_32566 ) ( CLEAR ?auto_32563 ) ( not ( = ?auto_32557 ?auto_32566 ) ) ( not ( = ?auto_32558 ?auto_32566 ) ) ( not ( = ?auto_32560 ?auto_32566 ) ) ( not ( = ?auto_32571 ?auto_32566 ) ) ( not ( = ?auto_32578 ?auto_32566 ) ) ( not ( = ?auto_32563 ?auto_32566 ) ) ( not ( = ?auto_32561 ?auto_32566 ) ) ( not ( = ?auto_32568 ?auto_32566 ) ) ( IS-CRATE ?auto_32568 ) ( not ( = ?auto_32557 ?auto_32573 ) ) ( not ( = ?auto_32558 ?auto_32573 ) ) ( not ( = ?auto_32560 ?auto_32573 ) ) ( not ( = ?auto_32571 ?auto_32573 ) ) ( not ( = ?auto_32578 ?auto_32573 ) ) ( not ( = ?auto_32563 ?auto_32573 ) ) ( not ( = ?auto_32561 ?auto_32573 ) ) ( not ( = ?auto_32568 ?auto_32573 ) ) ( not ( = ?auto_32566 ?auto_32573 ) ) ( not ( = ?auto_32580 ?auto_32570 ) ) ( not ( = ?auto_32569 ?auto_32580 ) ) ( not ( = ?auto_32559 ?auto_32580 ) ) ( not ( = ?auto_32576 ?auto_32580 ) ) ( HOIST-AT ?auto_32581 ?auto_32580 ) ( not ( = ?auto_32562 ?auto_32581 ) ) ( not ( = ?auto_32565 ?auto_32581 ) ) ( not ( = ?auto_32572 ?auto_32581 ) ) ( not ( = ?auto_32575 ?auto_32581 ) ) ( AVAILABLE ?auto_32581 ) ( SURFACE-AT ?auto_32568 ?auto_32580 ) ( ON ?auto_32568 ?auto_32577 ) ( CLEAR ?auto_32568 ) ( not ( = ?auto_32557 ?auto_32577 ) ) ( not ( = ?auto_32558 ?auto_32577 ) ) ( not ( = ?auto_32560 ?auto_32577 ) ) ( not ( = ?auto_32571 ?auto_32577 ) ) ( not ( = ?auto_32578 ?auto_32577 ) ) ( not ( = ?auto_32563 ?auto_32577 ) ) ( not ( = ?auto_32561 ?auto_32577 ) ) ( not ( = ?auto_32568 ?auto_32577 ) ) ( not ( = ?auto_32566 ?auto_32577 ) ) ( not ( = ?auto_32573 ?auto_32577 ) ) ( IS-CRATE ?auto_32573 ) ( not ( = ?auto_32557 ?auto_32567 ) ) ( not ( = ?auto_32558 ?auto_32567 ) ) ( not ( = ?auto_32560 ?auto_32567 ) ) ( not ( = ?auto_32571 ?auto_32567 ) ) ( not ( = ?auto_32578 ?auto_32567 ) ) ( not ( = ?auto_32563 ?auto_32567 ) ) ( not ( = ?auto_32561 ?auto_32567 ) ) ( not ( = ?auto_32568 ?auto_32567 ) ) ( not ( = ?auto_32566 ?auto_32567 ) ) ( not ( = ?auto_32573 ?auto_32567 ) ) ( not ( = ?auto_32577 ?auto_32567 ) ) ( not ( = ?auto_32582 ?auto_32570 ) ) ( not ( = ?auto_32569 ?auto_32582 ) ) ( not ( = ?auto_32559 ?auto_32582 ) ) ( not ( = ?auto_32576 ?auto_32582 ) ) ( not ( = ?auto_32580 ?auto_32582 ) ) ( HOIST-AT ?auto_32579 ?auto_32582 ) ( not ( = ?auto_32562 ?auto_32579 ) ) ( not ( = ?auto_32565 ?auto_32579 ) ) ( not ( = ?auto_32572 ?auto_32579 ) ) ( not ( = ?auto_32575 ?auto_32579 ) ) ( not ( = ?auto_32581 ?auto_32579 ) ) ( AVAILABLE ?auto_32579 ) ( SURFACE-AT ?auto_32573 ?auto_32582 ) ( ON ?auto_32573 ?auto_32564 ) ( CLEAR ?auto_32573 ) ( not ( = ?auto_32557 ?auto_32564 ) ) ( not ( = ?auto_32558 ?auto_32564 ) ) ( not ( = ?auto_32560 ?auto_32564 ) ) ( not ( = ?auto_32571 ?auto_32564 ) ) ( not ( = ?auto_32578 ?auto_32564 ) ) ( not ( = ?auto_32563 ?auto_32564 ) ) ( not ( = ?auto_32561 ?auto_32564 ) ) ( not ( = ?auto_32568 ?auto_32564 ) ) ( not ( = ?auto_32566 ?auto_32564 ) ) ( not ( = ?auto_32573 ?auto_32564 ) ) ( not ( = ?auto_32577 ?auto_32564 ) ) ( not ( = ?auto_32567 ?auto_32564 ) ) ( TRUCK-AT ?auto_32574 ?auto_32570 ) ( SURFACE-AT ?auto_32583 ?auto_32570 ) ( CLEAR ?auto_32583 ) ( LIFTING ?auto_32562 ?auto_32567 ) ( IS-CRATE ?auto_32567 ) ( not ( = ?auto_32557 ?auto_32583 ) ) ( not ( = ?auto_32558 ?auto_32583 ) ) ( not ( = ?auto_32560 ?auto_32583 ) ) ( not ( = ?auto_32571 ?auto_32583 ) ) ( not ( = ?auto_32578 ?auto_32583 ) ) ( not ( = ?auto_32563 ?auto_32583 ) ) ( not ( = ?auto_32561 ?auto_32583 ) ) ( not ( = ?auto_32568 ?auto_32583 ) ) ( not ( = ?auto_32566 ?auto_32583 ) ) ( not ( = ?auto_32573 ?auto_32583 ) ) ( not ( = ?auto_32577 ?auto_32583 ) ) ( not ( = ?auto_32567 ?auto_32583 ) ) ( not ( = ?auto_32564 ?auto_32583 ) ) )
    :subtasks
    ( ( !DROP ?auto_32562 ?auto_32567 ?auto_32583 ?auto_32570 )
      ( MAKE-ON ?auto_32557 ?auto_32558 )
      ( MAKE-ON-VERIFY ?auto_32557 ?auto_32558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32584 - SURFACE
      ?auto_32585 - SURFACE
    )
    :vars
    (
      ?auto_32598 - HOIST
      ?auto_32606 - PLACE
      ?auto_32597 - PLACE
      ?auto_32590 - HOIST
      ?auto_32601 - SURFACE
      ?auto_32605 - SURFACE
      ?auto_32603 - PLACE
      ?auto_32607 - HOIST
      ?auto_32595 - SURFACE
      ?auto_32600 - SURFACE
      ?auto_32610 - SURFACE
      ?auto_32609 - SURFACE
      ?auto_32593 - PLACE
      ?auto_32592 - HOIST
      ?auto_32608 - SURFACE
      ?auto_32599 - SURFACE
      ?auto_32588 - PLACE
      ?auto_32587 - HOIST
      ?auto_32594 - SURFACE
      ?auto_32602 - SURFACE
      ?auto_32591 - PLACE
      ?auto_32589 - HOIST
      ?auto_32596 - SURFACE
      ?auto_32586 - TRUCK
      ?auto_32604 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32598 ?auto_32606 ) ( IS-CRATE ?auto_32584 ) ( not ( = ?auto_32584 ?auto_32585 ) ) ( not ( = ?auto_32597 ?auto_32606 ) ) ( HOIST-AT ?auto_32590 ?auto_32597 ) ( not ( = ?auto_32598 ?auto_32590 ) ) ( AVAILABLE ?auto_32590 ) ( SURFACE-AT ?auto_32584 ?auto_32597 ) ( ON ?auto_32584 ?auto_32601 ) ( CLEAR ?auto_32584 ) ( not ( = ?auto_32584 ?auto_32601 ) ) ( not ( = ?auto_32585 ?auto_32601 ) ) ( IS-CRATE ?auto_32585 ) ( not ( = ?auto_32584 ?auto_32605 ) ) ( not ( = ?auto_32585 ?auto_32605 ) ) ( not ( = ?auto_32601 ?auto_32605 ) ) ( not ( = ?auto_32603 ?auto_32606 ) ) ( not ( = ?auto_32597 ?auto_32603 ) ) ( HOIST-AT ?auto_32607 ?auto_32603 ) ( not ( = ?auto_32598 ?auto_32607 ) ) ( not ( = ?auto_32590 ?auto_32607 ) ) ( SURFACE-AT ?auto_32585 ?auto_32603 ) ( ON ?auto_32585 ?auto_32595 ) ( CLEAR ?auto_32585 ) ( not ( = ?auto_32584 ?auto_32595 ) ) ( not ( = ?auto_32585 ?auto_32595 ) ) ( not ( = ?auto_32601 ?auto_32595 ) ) ( not ( = ?auto_32605 ?auto_32595 ) ) ( IS-CRATE ?auto_32605 ) ( not ( = ?auto_32584 ?auto_32600 ) ) ( not ( = ?auto_32585 ?auto_32600 ) ) ( not ( = ?auto_32601 ?auto_32600 ) ) ( not ( = ?auto_32605 ?auto_32600 ) ) ( not ( = ?auto_32595 ?auto_32600 ) ) ( AVAILABLE ?auto_32607 ) ( SURFACE-AT ?auto_32605 ?auto_32603 ) ( ON ?auto_32605 ?auto_32610 ) ( CLEAR ?auto_32605 ) ( not ( = ?auto_32584 ?auto_32610 ) ) ( not ( = ?auto_32585 ?auto_32610 ) ) ( not ( = ?auto_32601 ?auto_32610 ) ) ( not ( = ?auto_32605 ?auto_32610 ) ) ( not ( = ?auto_32595 ?auto_32610 ) ) ( not ( = ?auto_32600 ?auto_32610 ) ) ( IS-CRATE ?auto_32600 ) ( not ( = ?auto_32584 ?auto_32609 ) ) ( not ( = ?auto_32585 ?auto_32609 ) ) ( not ( = ?auto_32601 ?auto_32609 ) ) ( not ( = ?auto_32605 ?auto_32609 ) ) ( not ( = ?auto_32595 ?auto_32609 ) ) ( not ( = ?auto_32600 ?auto_32609 ) ) ( not ( = ?auto_32610 ?auto_32609 ) ) ( not ( = ?auto_32593 ?auto_32606 ) ) ( not ( = ?auto_32597 ?auto_32593 ) ) ( not ( = ?auto_32603 ?auto_32593 ) ) ( HOIST-AT ?auto_32592 ?auto_32593 ) ( not ( = ?auto_32598 ?auto_32592 ) ) ( not ( = ?auto_32590 ?auto_32592 ) ) ( not ( = ?auto_32607 ?auto_32592 ) ) ( AVAILABLE ?auto_32592 ) ( SURFACE-AT ?auto_32600 ?auto_32593 ) ( ON ?auto_32600 ?auto_32608 ) ( CLEAR ?auto_32600 ) ( not ( = ?auto_32584 ?auto_32608 ) ) ( not ( = ?auto_32585 ?auto_32608 ) ) ( not ( = ?auto_32601 ?auto_32608 ) ) ( not ( = ?auto_32605 ?auto_32608 ) ) ( not ( = ?auto_32595 ?auto_32608 ) ) ( not ( = ?auto_32600 ?auto_32608 ) ) ( not ( = ?auto_32610 ?auto_32608 ) ) ( not ( = ?auto_32609 ?auto_32608 ) ) ( IS-CRATE ?auto_32609 ) ( not ( = ?auto_32584 ?auto_32599 ) ) ( not ( = ?auto_32585 ?auto_32599 ) ) ( not ( = ?auto_32601 ?auto_32599 ) ) ( not ( = ?auto_32605 ?auto_32599 ) ) ( not ( = ?auto_32595 ?auto_32599 ) ) ( not ( = ?auto_32600 ?auto_32599 ) ) ( not ( = ?auto_32610 ?auto_32599 ) ) ( not ( = ?auto_32609 ?auto_32599 ) ) ( not ( = ?auto_32608 ?auto_32599 ) ) ( not ( = ?auto_32588 ?auto_32606 ) ) ( not ( = ?auto_32597 ?auto_32588 ) ) ( not ( = ?auto_32603 ?auto_32588 ) ) ( not ( = ?auto_32593 ?auto_32588 ) ) ( HOIST-AT ?auto_32587 ?auto_32588 ) ( not ( = ?auto_32598 ?auto_32587 ) ) ( not ( = ?auto_32590 ?auto_32587 ) ) ( not ( = ?auto_32607 ?auto_32587 ) ) ( not ( = ?auto_32592 ?auto_32587 ) ) ( AVAILABLE ?auto_32587 ) ( SURFACE-AT ?auto_32609 ?auto_32588 ) ( ON ?auto_32609 ?auto_32594 ) ( CLEAR ?auto_32609 ) ( not ( = ?auto_32584 ?auto_32594 ) ) ( not ( = ?auto_32585 ?auto_32594 ) ) ( not ( = ?auto_32601 ?auto_32594 ) ) ( not ( = ?auto_32605 ?auto_32594 ) ) ( not ( = ?auto_32595 ?auto_32594 ) ) ( not ( = ?auto_32600 ?auto_32594 ) ) ( not ( = ?auto_32610 ?auto_32594 ) ) ( not ( = ?auto_32609 ?auto_32594 ) ) ( not ( = ?auto_32608 ?auto_32594 ) ) ( not ( = ?auto_32599 ?auto_32594 ) ) ( IS-CRATE ?auto_32599 ) ( not ( = ?auto_32584 ?auto_32602 ) ) ( not ( = ?auto_32585 ?auto_32602 ) ) ( not ( = ?auto_32601 ?auto_32602 ) ) ( not ( = ?auto_32605 ?auto_32602 ) ) ( not ( = ?auto_32595 ?auto_32602 ) ) ( not ( = ?auto_32600 ?auto_32602 ) ) ( not ( = ?auto_32610 ?auto_32602 ) ) ( not ( = ?auto_32609 ?auto_32602 ) ) ( not ( = ?auto_32608 ?auto_32602 ) ) ( not ( = ?auto_32599 ?auto_32602 ) ) ( not ( = ?auto_32594 ?auto_32602 ) ) ( not ( = ?auto_32591 ?auto_32606 ) ) ( not ( = ?auto_32597 ?auto_32591 ) ) ( not ( = ?auto_32603 ?auto_32591 ) ) ( not ( = ?auto_32593 ?auto_32591 ) ) ( not ( = ?auto_32588 ?auto_32591 ) ) ( HOIST-AT ?auto_32589 ?auto_32591 ) ( not ( = ?auto_32598 ?auto_32589 ) ) ( not ( = ?auto_32590 ?auto_32589 ) ) ( not ( = ?auto_32607 ?auto_32589 ) ) ( not ( = ?auto_32592 ?auto_32589 ) ) ( not ( = ?auto_32587 ?auto_32589 ) ) ( AVAILABLE ?auto_32589 ) ( SURFACE-AT ?auto_32599 ?auto_32591 ) ( ON ?auto_32599 ?auto_32596 ) ( CLEAR ?auto_32599 ) ( not ( = ?auto_32584 ?auto_32596 ) ) ( not ( = ?auto_32585 ?auto_32596 ) ) ( not ( = ?auto_32601 ?auto_32596 ) ) ( not ( = ?auto_32605 ?auto_32596 ) ) ( not ( = ?auto_32595 ?auto_32596 ) ) ( not ( = ?auto_32600 ?auto_32596 ) ) ( not ( = ?auto_32610 ?auto_32596 ) ) ( not ( = ?auto_32609 ?auto_32596 ) ) ( not ( = ?auto_32608 ?auto_32596 ) ) ( not ( = ?auto_32599 ?auto_32596 ) ) ( not ( = ?auto_32594 ?auto_32596 ) ) ( not ( = ?auto_32602 ?auto_32596 ) ) ( TRUCK-AT ?auto_32586 ?auto_32606 ) ( SURFACE-AT ?auto_32604 ?auto_32606 ) ( CLEAR ?auto_32604 ) ( IS-CRATE ?auto_32602 ) ( not ( = ?auto_32584 ?auto_32604 ) ) ( not ( = ?auto_32585 ?auto_32604 ) ) ( not ( = ?auto_32601 ?auto_32604 ) ) ( not ( = ?auto_32605 ?auto_32604 ) ) ( not ( = ?auto_32595 ?auto_32604 ) ) ( not ( = ?auto_32600 ?auto_32604 ) ) ( not ( = ?auto_32610 ?auto_32604 ) ) ( not ( = ?auto_32609 ?auto_32604 ) ) ( not ( = ?auto_32608 ?auto_32604 ) ) ( not ( = ?auto_32599 ?auto_32604 ) ) ( not ( = ?auto_32594 ?auto_32604 ) ) ( not ( = ?auto_32602 ?auto_32604 ) ) ( not ( = ?auto_32596 ?auto_32604 ) ) ( AVAILABLE ?auto_32598 ) ( IN ?auto_32602 ?auto_32586 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32598 ?auto_32602 ?auto_32586 ?auto_32606 )
      ( MAKE-ON ?auto_32584 ?auto_32585 )
      ( MAKE-ON-VERIFY ?auto_32584 ?auto_32585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32611 - SURFACE
      ?auto_32612 - SURFACE
    )
    :vars
    (
      ?auto_32623 - HOIST
      ?auto_32629 - PLACE
      ?auto_32617 - PLACE
      ?auto_32633 - HOIST
      ?auto_32632 - SURFACE
      ?auto_32628 - SURFACE
      ?auto_32636 - PLACE
      ?auto_32630 - HOIST
      ?auto_32615 - SURFACE
      ?auto_32627 - SURFACE
      ?auto_32619 - SURFACE
      ?auto_32621 - SURFACE
      ?auto_32625 - PLACE
      ?auto_32616 - HOIST
      ?auto_32631 - SURFACE
      ?auto_32614 - SURFACE
      ?auto_32620 - PLACE
      ?auto_32613 - HOIST
      ?auto_32634 - SURFACE
      ?auto_32622 - SURFACE
      ?auto_32624 - PLACE
      ?auto_32635 - HOIST
      ?auto_32618 - SURFACE
      ?auto_32637 - SURFACE
      ?auto_32626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32623 ?auto_32629 ) ( IS-CRATE ?auto_32611 ) ( not ( = ?auto_32611 ?auto_32612 ) ) ( not ( = ?auto_32617 ?auto_32629 ) ) ( HOIST-AT ?auto_32633 ?auto_32617 ) ( not ( = ?auto_32623 ?auto_32633 ) ) ( AVAILABLE ?auto_32633 ) ( SURFACE-AT ?auto_32611 ?auto_32617 ) ( ON ?auto_32611 ?auto_32632 ) ( CLEAR ?auto_32611 ) ( not ( = ?auto_32611 ?auto_32632 ) ) ( not ( = ?auto_32612 ?auto_32632 ) ) ( IS-CRATE ?auto_32612 ) ( not ( = ?auto_32611 ?auto_32628 ) ) ( not ( = ?auto_32612 ?auto_32628 ) ) ( not ( = ?auto_32632 ?auto_32628 ) ) ( not ( = ?auto_32636 ?auto_32629 ) ) ( not ( = ?auto_32617 ?auto_32636 ) ) ( HOIST-AT ?auto_32630 ?auto_32636 ) ( not ( = ?auto_32623 ?auto_32630 ) ) ( not ( = ?auto_32633 ?auto_32630 ) ) ( SURFACE-AT ?auto_32612 ?auto_32636 ) ( ON ?auto_32612 ?auto_32615 ) ( CLEAR ?auto_32612 ) ( not ( = ?auto_32611 ?auto_32615 ) ) ( not ( = ?auto_32612 ?auto_32615 ) ) ( not ( = ?auto_32632 ?auto_32615 ) ) ( not ( = ?auto_32628 ?auto_32615 ) ) ( IS-CRATE ?auto_32628 ) ( not ( = ?auto_32611 ?auto_32627 ) ) ( not ( = ?auto_32612 ?auto_32627 ) ) ( not ( = ?auto_32632 ?auto_32627 ) ) ( not ( = ?auto_32628 ?auto_32627 ) ) ( not ( = ?auto_32615 ?auto_32627 ) ) ( AVAILABLE ?auto_32630 ) ( SURFACE-AT ?auto_32628 ?auto_32636 ) ( ON ?auto_32628 ?auto_32619 ) ( CLEAR ?auto_32628 ) ( not ( = ?auto_32611 ?auto_32619 ) ) ( not ( = ?auto_32612 ?auto_32619 ) ) ( not ( = ?auto_32632 ?auto_32619 ) ) ( not ( = ?auto_32628 ?auto_32619 ) ) ( not ( = ?auto_32615 ?auto_32619 ) ) ( not ( = ?auto_32627 ?auto_32619 ) ) ( IS-CRATE ?auto_32627 ) ( not ( = ?auto_32611 ?auto_32621 ) ) ( not ( = ?auto_32612 ?auto_32621 ) ) ( not ( = ?auto_32632 ?auto_32621 ) ) ( not ( = ?auto_32628 ?auto_32621 ) ) ( not ( = ?auto_32615 ?auto_32621 ) ) ( not ( = ?auto_32627 ?auto_32621 ) ) ( not ( = ?auto_32619 ?auto_32621 ) ) ( not ( = ?auto_32625 ?auto_32629 ) ) ( not ( = ?auto_32617 ?auto_32625 ) ) ( not ( = ?auto_32636 ?auto_32625 ) ) ( HOIST-AT ?auto_32616 ?auto_32625 ) ( not ( = ?auto_32623 ?auto_32616 ) ) ( not ( = ?auto_32633 ?auto_32616 ) ) ( not ( = ?auto_32630 ?auto_32616 ) ) ( AVAILABLE ?auto_32616 ) ( SURFACE-AT ?auto_32627 ?auto_32625 ) ( ON ?auto_32627 ?auto_32631 ) ( CLEAR ?auto_32627 ) ( not ( = ?auto_32611 ?auto_32631 ) ) ( not ( = ?auto_32612 ?auto_32631 ) ) ( not ( = ?auto_32632 ?auto_32631 ) ) ( not ( = ?auto_32628 ?auto_32631 ) ) ( not ( = ?auto_32615 ?auto_32631 ) ) ( not ( = ?auto_32627 ?auto_32631 ) ) ( not ( = ?auto_32619 ?auto_32631 ) ) ( not ( = ?auto_32621 ?auto_32631 ) ) ( IS-CRATE ?auto_32621 ) ( not ( = ?auto_32611 ?auto_32614 ) ) ( not ( = ?auto_32612 ?auto_32614 ) ) ( not ( = ?auto_32632 ?auto_32614 ) ) ( not ( = ?auto_32628 ?auto_32614 ) ) ( not ( = ?auto_32615 ?auto_32614 ) ) ( not ( = ?auto_32627 ?auto_32614 ) ) ( not ( = ?auto_32619 ?auto_32614 ) ) ( not ( = ?auto_32621 ?auto_32614 ) ) ( not ( = ?auto_32631 ?auto_32614 ) ) ( not ( = ?auto_32620 ?auto_32629 ) ) ( not ( = ?auto_32617 ?auto_32620 ) ) ( not ( = ?auto_32636 ?auto_32620 ) ) ( not ( = ?auto_32625 ?auto_32620 ) ) ( HOIST-AT ?auto_32613 ?auto_32620 ) ( not ( = ?auto_32623 ?auto_32613 ) ) ( not ( = ?auto_32633 ?auto_32613 ) ) ( not ( = ?auto_32630 ?auto_32613 ) ) ( not ( = ?auto_32616 ?auto_32613 ) ) ( AVAILABLE ?auto_32613 ) ( SURFACE-AT ?auto_32621 ?auto_32620 ) ( ON ?auto_32621 ?auto_32634 ) ( CLEAR ?auto_32621 ) ( not ( = ?auto_32611 ?auto_32634 ) ) ( not ( = ?auto_32612 ?auto_32634 ) ) ( not ( = ?auto_32632 ?auto_32634 ) ) ( not ( = ?auto_32628 ?auto_32634 ) ) ( not ( = ?auto_32615 ?auto_32634 ) ) ( not ( = ?auto_32627 ?auto_32634 ) ) ( not ( = ?auto_32619 ?auto_32634 ) ) ( not ( = ?auto_32621 ?auto_32634 ) ) ( not ( = ?auto_32631 ?auto_32634 ) ) ( not ( = ?auto_32614 ?auto_32634 ) ) ( IS-CRATE ?auto_32614 ) ( not ( = ?auto_32611 ?auto_32622 ) ) ( not ( = ?auto_32612 ?auto_32622 ) ) ( not ( = ?auto_32632 ?auto_32622 ) ) ( not ( = ?auto_32628 ?auto_32622 ) ) ( not ( = ?auto_32615 ?auto_32622 ) ) ( not ( = ?auto_32627 ?auto_32622 ) ) ( not ( = ?auto_32619 ?auto_32622 ) ) ( not ( = ?auto_32621 ?auto_32622 ) ) ( not ( = ?auto_32631 ?auto_32622 ) ) ( not ( = ?auto_32614 ?auto_32622 ) ) ( not ( = ?auto_32634 ?auto_32622 ) ) ( not ( = ?auto_32624 ?auto_32629 ) ) ( not ( = ?auto_32617 ?auto_32624 ) ) ( not ( = ?auto_32636 ?auto_32624 ) ) ( not ( = ?auto_32625 ?auto_32624 ) ) ( not ( = ?auto_32620 ?auto_32624 ) ) ( HOIST-AT ?auto_32635 ?auto_32624 ) ( not ( = ?auto_32623 ?auto_32635 ) ) ( not ( = ?auto_32633 ?auto_32635 ) ) ( not ( = ?auto_32630 ?auto_32635 ) ) ( not ( = ?auto_32616 ?auto_32635 ) ) ( not ( = ?auto_32613 ?auto_32635 ) ) ( AVAILABLE ?auto_32635 ) ( SURFACE-AT ?auto_32614 ?auto_32624 ) ( ON ?auto_32614 ?auto_32618 ) ( CLEAR ?auto_32614 ) ( not ( = ?auto_32611 ?auto_32618 ) ) ( not ( = ?auto_32612 ?auto_32618 ) ) ( not ( = ?auto_32632 ?auto_32618 ) ) ( not ( = ?auto_32628 ?auto_32618 ) ) ( not ( = ?auto_32615 ?auto_32618 ) ) ( not ( = ?auto_32627 ?auto_32618 ) ) ( not ( = ?auto_32619 ?auto_32618 ) ) ( not ( = ?auto_32621 ?auto_32618 ) ) ( not ( = ?auto_32631 ?auto_32618 ) ) ( not ( = ?auto_32614 ?auto_32618 ) ) ( not ( = ?auto_32634 ?auto_32618 ) ) ( not ( = ?auto_32622 ?auto_32618 ) ) ( SURFACE-AT ?auto_32637 ?auto_32629 ) ( CLEAR ?auto_32637 ) ( IS-CRATE ?auto_32622 ) ( not ( = ?auto_32611 ?auto_32637 ) ) ( not ( = ?auto_32612 ?auto_32637 ) ) ( not ( = ?auto_32632 ?auto_32637 ) ) ( not ( = ?auto_32628 ?auto_32637 ) ) ( not ( = ?auto_32615 ?auto_32637 ) ) ( not ( = ?auto_32627 ?auto_32637 ) ) ( not ( = ?auto_32619 ?auto_32637 ) ) ( not ( = ?auto_32621 ?auto_32637 ) ) ( not ( = ?auto_32631 ?auto_32637 ) ) ( not ( = ?auto_32614 ?auto_32637 ) ) ( not ( = ?auto_32634 ?auto_32637 ) ) ( not ( = ?auto_32622 ?auto_32637 ) ) ( not ( = ?auto_32618 ?auto_32637 ) ) ( AVAILABLE ?auto_32623 ) ( IN ?auto_32622 ?auto_32626 ) ( TRUCK-AT ?auto_32626 ?auto_32620 ) )
    :subtasks
    ( ( !DRIVE ?auto_32626 ?auto_32620 ?auto_32629 )
      ( MAKE-ON ?auto_32611 ?auto_32612 )
      ( MAKE-ON-VERIFY ?auto_32611 ?auto_32612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32638 - SURFACE
      ?auto_32639 - SURFACE
    )
    :vars
    (
      ?auto_32653 - HOIST
      ?auto_32646 - PLACE
      ?auto_32654 - PLACE
      ?auto_32648 - HOIST
      ?auto_32643 - SURFACE
      ?auto_32660 - SURFACE
      ?auto_32656 - PLACE
      ?auto_32641 - HOIST
      ?auto_32662 - SURFACE
      ?auto_32663 - SURFACE
      ?auto_32664 - SURFACE
      ?auto_32657 - SURFACE
      ?auto_32644 - PLACE
      ?auto_32645 - HOIST
      ?auto_32640 - SURFACE
      ?auto_32650 - SURFACE
      ?auto_32652 - PLACE
      ?auto_32649 - HOIST
      ?auto_32642 - SURFACE
      ?auto_32651 - SURFACE
      ?auto_32658 - PLACE
      ?auto_32661 - HOIST
      ?auto_32659 - SURFACE
      ?auto_32655 - SURFACE
      ?auto_32647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32653 ?auto_32646 ) ( IS-CRATE ?auto_32638 ) ( not ( = ?auto_32638 ?auto_32639 ) ) ( not ( = ?auto_32654 ?auto_32646 ) ) ( HOIST-AT ?auto_32648 ?auto_32654 ) ( not ( = ?auto_32653 ?auto_32648 ) ) ( AVAILABLE ?auto_32648 ) ( SURFACE-AT ?auto_32638 ?auto_32654 ) ( ON ?auto_32638 ?auto_32643 ) ( CLEAR ?auto_32638 ) ( not ( = ?auto_32638 ?auto_32643 ) ) ( not ( = ?auto_32639 ?auto_32643 ) ) ( IS-CRATE ?auto_32639 ) ( not ( = ?auto_32638 ?auto_32660 ) ) ( not ( = ?auto_32639 ?auto_32660 ) ) ( not ( = ?auto_32643 ?auto_32660 ) ) ( not ( = ?auto_32656 ?auto_32646 ) ) ( not ( = ?auto_32654 ?auto_32656 ) ) ( HOIST-AT ?auto_32641 ?auto_32656 ) ( not ( = ?auto_32653 ?auto_32641 ) ) ( not ( = ?auto_32648 ?auto_32641 ) ) ( SURFACE-AT ?auto_32639 ?auto_32656 ) ( ON ?auto_32639 ?auto_32662 ) ( CLEAR ?auto_32639 ) ( not ( = ?auto_32638 ?auto_32662 ) ) ( not ( = ?auto_32639 ?auto_32662 ) ) ( not ( = ?auto_32643 ?auto_32662 ) ) ( not ( = ?auto_32660 ?auto_32662 ) ) ( IS-CRATE ?auto_32660 ) ( not ( = ?auto_32638 ?auto_32663 ) ) ( not ( = ?auto_32639 ?auto_32663 ) ) ( not ( = ?auto_32643 ?auto_32663 ) ) ( not ( = ?auto_32660 ?auto_32663 ) ) ( not ( = ?auto_32662 ?auto_32663 ) ) ( AVAILABLE ?auto_32641 ) ( SURFACE-AT ?auto_32660 ?auto_32656 ) ( ON ?auto_32660 ?auto_32664 ) ( CLEAR ?auto_32660 ) ( not ( = ?auto_32638 ?auto_32664 ) ) ( not ( = ?auto_32639 ?auto_32664 ) ) ( not ( = ?auto_32643 ?auto_32664 ) ) ( not ( = ?auto_32660 ?auto_32664 ) ) ( not ( = ?auto_32662 ?auto_32664 ) ) ( not ( = ?auto_32663 ?auto_32664 ) ) ( IS-CRATE ?auto_32663 ) ( not ( = ?auto_32638 ?auto_32657 ) ) ( not ( = ?auto_32639 ?auto_32657 ) ) ( not ( = ?auto_32643 ?auto_32657 ) ) ( not ( = ?auto_32660 ?auto_32657 ) ) ( not ( = ?auto_32662 ?auto_32657 ) ) ( not ( = ?auto_32663 ?auto_32657 ) ) ( not ( = ?auto_32664 ?auto_32657 ) ) ( not ( = ?auto_32644 ?auto_32646 ) ) ( not ( = ?auto_32654 ?auto_32644 ) ) ( not ( = ?auto_32656 ?auto_32644 ) ) ( HOIST-AT ?auto_32645 ?auto_32644 ) ( not ( = ?auto_32653 ?auto_32645 ) ) ( not ( = ?auto_32648 ?auto_32645 ) ) ( not ( = ?auto_32641 ?auto_32645 ) ) ( AVAILABLE ?auto_32645 ) ( SURFACE-AT ?auto_32663 ?auto_32644 ) ( ON ?auto_32663 ?auto_32640 ) ( CLEAR ?auto_32663 ) ( not ( = ?auto_32638 ?auto_32640 ) ) ( not ( = ?auto_32639 ?auto_32640 ) ) ( not ( = ?auto_32643 ?auto_32640 ) ) ( not ( = ?auto_32660 ?auto_32640 ) ) ( not ( = ?auto_32662 ?auto_32640 ) ) ( not ( = ?auto_32663 ?auto_32640 ) ) ( not ( = ?auto_32664 ?auto_32640 ) ) ( not ( = ?auto_32657 ?auto_32640 ) ) ( IS-CRATE ?auto_32657 ) ( not ( = ?auto_32638 ?auto_32650 ) ) ( not ( = ?auto_32639 ?auto_32650 ) ) ( not ( = ?auto_32643 ?auto_32650 ) ) ( not ( = ?auto_32660 ?auto_32650 ) ) ( not ( = ?auto_32662 ?auto_32650 ) ) ( not ( = ?auto_32663 ?auto_32650 ) ) ( not ( = ?auto_32664 ?auto_32650 ) ) ( not ( = ?auto_32657 ?auto_32650 ) ) ( not ( = ?auto_32640 ?auto_32650 ) ) ( not ( = ?auto_32652 ?auto_32646 ) ) ( not ( = ?auto_32654 ?auto_32652 ) ) ( not ( = ?auto_32656 ?auto_32652 ) ) ( not ( = ?auto_32644 ?auto_32652 ) ) ( HOIST-AT ?auto_32649 ?auto_32652 ) ( not ( = ?auto_32653 ?auto_32649 ) ) ( not ( = ?auto_32648 ?auto_32649 ) ) ( not ( = ?auto_32641 ?auto_32649 ) ) ( not ( = ?auto_32645 ?auto_32649 ) ) ( SURFACE-AT ?auto_32657 ?auto_32652 ) ( ON ?auto_32657 ?auto_32642 ) ( CLEAR ?auto_32657 ) ( not ( = ?auto_32638 ?auto_32642 ) ) ( not ( = ?auto_32639 ?auto_32642 ) ) ( not ( = ?auto_32643 ?auto_32642 ) ) ( not ( = ?auto_32660 ?auto_32642 ) ) ( not ( = ?auto_32662 ?auto_32642 ) ) ( not ( = ?auto_32663 ?auto_32642 ) ) ( not ( = ?auto_32664 ?auto_32642 ) ) ( not ( = ?auto_32657 ?auto_32642 ) ) ( not ( = ?auto_32640 ?auto_32642 ) ) ( not ( = ?auto_32650 ?auto_32642 ) ) ( IS-CRATE ?auto_32650 ) ( not ( = ?auto_32638 ?auto_32651 ) ) ( not ( = ?auto_32639 ?auto_32651 ) ) ( not ( = ?auto_32643 ?auto_32651 ) ) ( not ( = ?auto_32660 ?auto_32651 ) ) ( not ( = ?auto_32662 ?auto_32651 ) ) ( not ( = ?auto_32663 ?auto_32651 ) ) ( not ( = ?auto_32664 ?auto_32651 ) ) ( not ( = ?auto_32657 ?auto_32651 ) ) ( not ( = ?auto_32640 ?auto_32651 ) ) ( not ( = ?auto_32650 ?auto_32651 ) ) ( not ( = ?auto_32642 ?auto_32651 ) ) ( not ( = ?auto_32658 ?auto_32646 ) ) ( not ( = ?auto_32654 ?auto_32658 ) ) ( not ( = ?auto_32656 ?auto_32658 ) ) ( not ( = ?auto_32644 ?auto_32658 ) ) ( not ( = ?auto_32652 ?auto_32658 ) ) ( HOIST-AT ?auto_32661 ?auto_32658 ) ( not ( = ?auto_32653 ?auto_32661 ) ) ( not ( = ?auto_32648 ?auto_32661 ) ) ( not ( = ?auto_32641 ?auto_32661 ) ) ( not ( = ?auto_32645 ?auto_32661 ) ) ( not ( = ?auto_32649 ?auto_32661 ) ) ( AVAILABLE ?auto_32661 ) ( SURFACE-AT ?auto_32650 ?auto_32658 ) ( ON ?auto_32650 ?auto_32659 ) ( CLEAR ?auto_32650 ) ( not ( = ?auto_32638 ?auto_32659 ) ) ( not ( = ?auto_32639 ?auto_32659 ) ) ( not ( = ?auto_32643 ?auto_32659 ) ) ( not ( = ?auto_32660 ?auto_32659 ) ) ( not ( = ?auto_32662 ?auto_32659 ) ) ( not ( = ?auto_32663 ?auto_32659 ) ) ( not ( = ?auto_32664 ?auto_32659 ) ) ( not ( = ?auto_32657 ?auto_32659 ) ) ( not ( = ?auto_32640 ?auto_32659 ) ) ( not ( = ?auto_32650 ?auto_32659 ) ) ( not ( = ?auto_32642 ?auto_32659 ) ) ( not ( = ?auto_32651 ?auto_32659 ) ) ( SURFACE-AT ?auto_32655 ?auto_32646 ) ( CLEAR ?auto_32655 ) ( IS-CRATE ?auto_32651 ) ( not ( = ?auto_32638 ?auto_32655 ) ) ( not ( = ?auto_32639 ?auto_32655 ) ) ( not ( = ?auto_32643 ?auto_32655 ) ) ( not ( = ?auto_32660 ?auto_32655 ) ) ( not ( = ?auto_32662 ?auto_32655 ) ) ( not ( = ?auto_32663 ?auto_32655 ) ) ( not ( = ?auto_32664 ?auto_32655 ) ) ( not ( = ?auto_32657 ?auto_32655 ) ) ( not ( = ?auto_32640 ?auto_32655 ) ) ( not ( = ?auto_32650 ?auto_32655 ) ) ( not ( = ?auto_32642 ?auto_32655 ) ) ( not ( = ?auto_32651 ?auto_32655 ) ) ( not ( = ?auto_32659 ?auto_32655 ) ) ( AVAILABLE ?auto_32653 ) ( TRUCK-AT ?auto_32647 ?auto_32652 ) ( LIFTING ?auto_32649 ?auto_32651 ) )
    :subtasks
    ( ( !LOAD ?auto_32649 ?auto_32651 ?auto_32647 ?auto_32652 )
      ( MAKE-ON ?auto_32638 ?auto_32639 )
      ( MAKE-ON-VERIFY ?auto_32638 ?auto_32639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32665 - SURFACE
      ?auto_32666 - SURFACE
    )
    :vars
    (
      ?auto_32683 - HOIST
      ?auto_32690 - PLACE
      ?auto_32677 - PLACE
      ?auto_32691 - HOIST
      ?auto_32684 - SURFACE
      ?auto_32673 - SURFACE
      ?auto_32669 - PLACE
      ?auto_32680 - HOIST
      ?auto_32675 - SURFACE
      ?auto_32670 - SURFACE
      ?auto_32671 - SURFACE
      ?auto_32667 - SURFACE
      ?auto_32682 - PLACE
      ?auto_32679 - HOIST
      ?auto_32688 - SURFACE
      ?auto_32678 - SURFACE
      ?auto_32685 - PLACE
      ?auto_32686 - HOIST
      ?auto_32689 - SURFACE
      ?auto_32681 - SURFACE
      ?auto_32668 - PLACE
      ?auto_32674 - HOIST
      ?auto_32672 - SURFACE
      ?auto_32676 - SURFACE
      ?auto_32687 - TRUCK
      ?auto_32692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32683 ?auto_32690 ) ( IS-CRATE ?auto_32665 ) ( not ( = ?auto_32665 ?auto_32666 ) ) ( not ( = ?auto_32677 ?auto_32690 ) ) ( HOIST-AT ?auto_32691 ?auto_32677 ) ( not ( = ?auto_32683 ?auto_32691 ) ) ( AVAILABLE ?auto_32691 ) ( SURFACE-AT ?auto_32665 ?auto_32677 ) ( ON ?auto_32665 ?auto_32684 ) ( CLEAR ?auto_32665 ) ( not ( = ?auto_32665 ?auto_32684 ) ) ( not ( = ?auto_32666 ?auto_32684 ) ) ( IS-CRATE ?auto_32666 ) ( not ( = ?auto_32665 ?auto_32673 ) ) ( not ( = ?auto_32666 ?auto_32673 ) ) ( not ( = ?auto_32684 ?auto_32673 ) ) ( not ( = ?auto_32669 ?auto_32690 ) ) ( not ( = ?auto_32677 ?auto_32669 ) ) ( HOIST-AT ?auto_32680 ?auto_32669 ) ( not ( = ?auto_32683 ?auto_32680 ) ) ( not ( = ?auto_32691 ?auto_32680 ) ) ( SURFACE-AT ?auto_32666 ?auto_32669 ) ( ON ?auto_32666 ?auto_32675 ) ( CLEAR ?auto_32666 ) ( not ( = ?auto_32665 ?auto_32675 ) ) ( not ( = ?auto_32666 ?auto_32675 ) ) ( not ( = ?auto_32684 ?auto_32675 ) ) ( not ( = ?auto_32673 ?auto_32675 ) ) ( IS-CRATE ?auto_32673 ) ( not ( = ?auto_32665 ?auto_32670 ) ) ( not ( = ?auto_32666 ?auto_32670 ) ) ( not ( = ?auto_32684 ?auto_32670 ) ) ( not ( = ?auto_32673 ?auto_32670 ) ) ( not ( = ?auto_32675 ?auto_32670 ) ) ( AVAILABLE ?auto_32680 ) ( SURFACE-AT ?auto_32673 ?auto_32669 ) ( ON ?auto_32673 ?auto_32671 ) ( CLEAR ?auto_32673 ) ( not ( = ?auto_32665 ?auto_32671 ) ) ( not ( = ?auto_32666 ?auto_32671 ) ) ( not ( = ?auto_32684 ?auto_32671 ) ) ( not ( = ?auto_32673 ?auto_32671 ) ) ( not ( = ?auto_32675 ?auto_32671 ) ) ( not ( = ?auto_32670 ?auto_32671 ) ) ( IS-CRATE ?auto_32670 ) ( not ( = ?auto_32665 ?auto_32667 ) ) ( not ( = ?auto_32666 ?auto_32667 ) ) ( not ( = ?auto_32684 ?auto_32667 ) ) ( not ( = ?auto_32673 ?auto_32667 ) ) ( not ( = ?auto_32675 ?auto_32667 ) ) ( not ( = ?auto_32670 ?auto_32667 ) ) ( not ( = ?auto_32671 ?auto_32667 ) ) ( not ( = ?auto_32682 ?auto_32690 ) ) ( not ( = ?auto_32677 ?auto_32682 ) ) ( not ( = ?auto_32669 ?auto_32682 ) ) ( HOIST-AT ?auto_32679 ?auto_32682 ) ( not ( = ?auto_32683 ?auto_32679 ) ) ( not ( = ?auto_32691 ?auto_32679 ) ) ( not ( = ?auto_32680 ?auto_32679 ) ) ( AVAILABLE ?auto_32679 ) ( SURFACE-AT ?auto_32670 ?auto_32682 ) ( ON ?auto_32670 ?auto_32688 ) ( CLEAR ?auto_32670 ) ( not ( = ?auto_32665 ?auto_32688 ) ) ( not ( = ?auto_32666 ?auto_32688 ) ) ( not ( = ?auto_32684 ?auto_32688 ) ) ( not ( = ?auto_32673 ?auto_32688 ) ) ( not ( = ?auto_32675 ?auto_32688 ) ) ( not ( = ?auto_32670 ?auto_32688 ) ) ( not ( = ?auto_32671 ?auto_32688 ) ) ( not ( = ?auto_32667 ?auto_32688 ) ) ( IS-CRATE ?auto_32667 ) ( not ( = ?auto_32665 ?auto_32678 ) ) ( not ( = ?auto_32666 ?auto_32678 ) ) ( not ( = ?auto_32684 ?auto_32678 ) ) ( not ( = ?auto_32673 ?auto_32678 ) ) ( not ( = ?auto_32675 ?auto_32678 ) ) ( not ( = ?auto_32670 ?auto_32678 ) ) ( not ( = ?auto_32671 ?auto_32678 ) ) ( not ( = ?auto_32667 ?auto_32678 ) ) ( not ( = ?auto_32688 ?auto_32678 ) ) ( not ( = ?auto_32685 ?auto_32690 ) ) ( not ( = ?auto_32677 ?auto_32685 ) ) ( not ( = ?auto_32669 ?auto_32685 ) ) ( not ( = ?auto_32682 ?auto_32685 ) ) ( HOIST-AT ?auto_32686 ?auto_32685 ) ( not ( = ?auto_32683 ?auto_32686 ) ) ( not ( = ?auto_32691 ?auto_32686 ) ) ( not ( = ?auto_32680 ?auto_32686 ) ) ( not ( = ?auto_32679 ?auto_32686 ) ) ( SURFACE-AT ?auto_32667 ?auto_32685 ) ( ON ?auto_32667 ?auto_32689 ) ( CLEAR ?auto_32667 ) ( not ( = ?auto_32665 ?auto_32689 ) ) ( not ( = ?auto_32666 ?auto_32689 ) ) ( not ( = ?auto_32684 ?auto_32689 ) ) ( not ( = ?auto_32673 ?auto_32689 ) ) ( not ( = ?auto_32675 ?auto_32689 ) ) ( not ( = ?auto_32670 ?auto_32689 ) ) ( not ( = ?auto_32671 ?auto_32689 ) ) ( not ( = ?auto_32667 ?auto_32689 ) ) ( not ( = ?auto_32688 ?auto_32689 ) ) ( not ( = ?auto_32678 ?auto_32689 ) ) ( IS-CRATE ?auto_32678 ) ( not ( = ?auto_32665 ?auto_32681 ) ) ( not ( = ?auto_32666 ?auto_32681 ) ) ( not ( = ?auto_32684 ?auto_32681 ) ) ( not ( = ?auto_32673 ?auto_32681 ) ) ( not ( = ?auto_32675 ?auto_32681 ) ) ( not ( = ?auto_32670 ?auto_32681 ) ) ( not ( = ?auto_32671 ?auto_32681 ) ) ( not ( = ?auto_32667 ?auto_32681 ) ) ( not ( = ?auto_32688 ?auto_32681 ) ) ( not ( = ?auto_32678 ?auto_32681 ) ) ( not ( = ?auto_32689 ?auto_32681 ) ) ( not ( = ?auto_32668 ?auto_32690 ) ) ( not ( = ?auto_32677 ?auto_32668 ) ) ( not ( = ?auto_32669 ?auto_32668 ) ) ( not ( = ?auto_32682 ?auto_32668 ) ) ( not ( = ?auto_32685 ?auto_32668 ) ) ( HOIST-AT ?auto_32674 ?auto_32668 ) ( not ( = ?auto_32683 ?auto_32674 ) ) ( not ( = ?auto_32691 ?auto_32674 ) ) ( not ( = ?auto_32680 ?auto_32674 ) ) ( not ( = ?auto_32679 ?auto_32674 ) ) ( not ( = ?auto_32686 ?auto_32674 ) ) ( AVAILABLE ?auto_32674 ) ( SURFACE-AT ?auto_32678 ?auto_32668 ) ( ON ?auto_32678 ?auto_32672 ) ( CLEAR ?auto_32678 ) ( not ( = ?auto_32665 ?auto_32672 ) ) ( not ( = ?auto_32666 ?auto_32672 ) ) ( not ( = ?auto_32684 ?auto_32672 ) ) ( not ( = ?auto_32673 ?auto_32672 ) ) ( not ( = ?auto_32675 ?auto_32672 ) ) ( not ( = ?auto_32670 ?auto_32672 ) ) ( not ( = ?auto_32671 ?auto_32672 ) ) ( not ( = ?auto_32667 ?auto_32672 ) ) ( not ( = ?auto_32688 ?auto_32672 ) ) ( not ( = ?auto_32678 ?auto_32672 ) ) ( not ( = ?auto_32689 ?auto_32672 ) ) ( not ( = ?auto_32681 ?auto_32672 ) ) ( SURFACE-AT ?auto_32676 ?auto_32690 ) ( CLEAR ?auto_32676 ) ( IS-CRATE ?auto_32681 ) ( not ( = ?auto_32665 ?auto_32676 ) ) ( not ( = ?auto_32666 ?auto_32676 ) ) ( not ( = ?auto_32684 ?auto_32676 ) ) ( not ( = ?auto_32673 ?auto_32676 ) ) ( not ( = ?auto_32675 ?auto_32676 ) ) ( not ( = ?auto_32670 ?auto_32676 ) ) ( not ( = ?auto_32671 ?auto_32676 ) ) ( not ( = ?auto_32667 ?auto_32676 ) ) ( not ( = ?auto_32688 ?auto_32676 ) ) ( not ( = ?auto_32678 ?auto_32676 ) ) ( not ( = ?auto_32689 ?auto_32676 ) ) ( not ( = ?auto_32681 ?auto_32676 ) ) ( not ( = ?auto_32672 ?auto_32676 ) ) ( AVAILABLE ?auto_32683 ) ( TRUCK-AT ?auto_32687 ?auto_32685 ) ( AVAILABLE ?auto_32686 ) ( SURFACE-AT ?auto_32681 ?auto_32685 ) ( ON ?auto_32681 ?auto_32692 ) ( CLEAR ?auto_32681 ) ( not ( = ?auto_32665 ?auto_32692 ) ) ( not ( = ?auto_32666 ?auto_32692 ) ) ( not ( = ?auto_32684 ?auto_32692 ) ) ( not ( = ?auto_32673 ?auto_32692 ) ) ( not ( = ?auto_32675 ?auto_32692 ) ) ( not ( = ?auto_32670 ?auto_32692 ) ) ( not ( = ?auto_32671 ?auto_32692 ) ) ( not ( = ?auto_32667 ?auto_32692 ) ) ( not ( = ?auto_32688 ?auto_32692 ) ) ( not ( = ?auto_32678 ?auto_32692 ) ) ( not ( = ?auto_32689 ?auto_32692 ) ) ( not ( = ?auto_32681 ?auto_32692 ) ) ( not ( = ?auto_32672 ?auto_32692 ) ) ( not ( = ?auto_32676 ?auto_32692 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32686 ?auto_32681 ?auto_32692 ?auto_32685 )
      ( MAKE-ON ?auto_32665 ?auto_32666 )
      ( MAKE-ON-VERIFY ?auto_32665 ?auto_32666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32693 - SURFACE
      ?auto_32694 - SURFACE
    )
    :vars
    (
      ?auto_32695 - HOIST
      ?auto_32696 - PLACE
      ?auto_32698 - PLACE
      ?auto_32709 - HOIST
      ?auto_32701 - SURFACE
      ?auto_32707 - SURFACE
      ?auto_32708 - PLACE
      ?auto_32717 - HOIST
      ?auto_32710 - SURFACE
      ?auto_32714 - SURFACE
      ?auto_32718 - SURFACE
      ?auto_32711 - SURFACE
      ?auto_32706 - PLACE
      ?auto_32713 - HOIST
      ?auto_32704 - SURFACE
      ?auto_32697 - SURFACE
      ?auto_32700 - PLACE
      ?auto_32702 - HOIST
      ?auto_32705 - SURFACE
      ?auto_32699 - SURFACE
      ?auto_32719 - PLACE
      ?auto_32715 - HOIST
      ?auto_32716 - SURFACE
      ?auto_32712 - SURFACE
      ?auto_32720 - SURFACE
      ?auto_32703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32695 ?auto_32696 ) ( IS-CRATE ?auto_32693 ) ( not ( = ?auto_32693 ?auto_32694 ) ) ( not ( = ?auto_32698 ?auto_32696 ) ) ( HOIST-AT ?auto_32709 ?auto_32698 ) ( not ( = ?auto_32695 ?auto_32709 ) ) ( AVAILABLE ?auto_32709 ) ( SURFACE-AT ?auto_32693 ?auto_32698 ) ( ON ?auto_32693 ?auto_32701 ) ( CLEAR ?auto_32693 ) ( not ( = ?auto_32693 ?auto_32701 ) ) ( not ( = ?auto_32694 ?auto_32701 ) ) ( IS-CRATE ?auto_32694 ) ( not ( = ?auto_32693 ?auto_32707 ) ) ( not ( = ?auto_32694 ?auto_32707 ) ) ( not ( = ?auto_32701 ?auto_32707 ) ) ( not ( = ?auto_32708 ?auto_32696 ) ) ( not ( = ?auto_32698 ?auto_32708 ) ) ( HOIST-AT ?auto_32717 ?auto_32708 ) ( not ( = ?auto_32695 ?auto_32717 ) ) ( not ( = ?auto_32709 ?auto_32717 ) ) ( SURFACE-AT ?auto_32694 ?auto_32708 ) ( ON ?auto_32694 ?auto_32710 ) ( CLEAR ?auto_32694 ) ( not ( = ?auto_32693 ?auto_32710 ) ) ( not ( = ?auto_32694 ?auto_32710 ) ) ( not ( = ?auto_32701 ?auto_32710 ) ) ( not ( = ?auto_32707 ?auto_32710 ) ) ( IS-CRATE ?auto_32707 ) ( not ( = ?auto_32693 ?auto_32714 ) ) ( not ( = ?auto_32694 ?auto_32714 ) ) ( not ( = ?auto_32701 ?auto_32714 ) ) ( not ( = ?auto_32707 ?auto_32714 ) ) ( not ( = ?auto_32710 ?auto_32714 ) ) ( AVAILABLE ?auto_32717 ) ( SURFACE-AT ?auto_32707 ?auto_32708 ) ( ON ?auto_32707 ?auto_32718 ) ( CLEAR ?auto_32707 ) ( not ( = ?auto_32693 ?auto_32718 ) ) ( not ( = ?auto_32694 ?auto_32718 ) ) ( not ( = ?auto_32701 ?auto_32718 ) ) ( not ( = ?auto_32707 ?auto_32718 ) ) ( not ( = ?auto_32710 ?auto_32718 ) ) ( not ( = ?auto_32714 ?auto_32718 ) ) ( IS-CRATE ?auto_32714 ) ( not ( = ?auto_32693 ?auto_32711 ) ) ( not ( = ?auto_32694 ?auto_32711 ) ) ( not ( = ?auto_32701 ?auto_32711 ) ) ( not ( = ?auto_32707 ?auto_32711 ) ) ( not ( = ?auto_32710 ?auto_32711 ) ) ( not ( = ?auto_32714 ?auto_32711 ) ) ( not ( = ?auto_32718 ?auto_32711 ) ) ( not ( = ?auto_32706 ?auto_32696 ) ) ( not ( = ?auto_32698 ?auto_32706 ) ) ( not ( = ?auto_32708 ?auto_32706 ) ) ( HOIST-AT ?auto_32713 ?auto_32706 ) ( not ( = ?auto_32695 ?auto_32713 ) ) ( not ( = ?auto_32709 ?auto_32713 ) ) ( not ( = ?auto_32717 ?auto_32713 ) ) ( AVAILABLE ?auto_32713 ) ( SURFACE-AT ?auto_32714 ?auto_32706 ) ( ON ?auto_32714 ?auto_32704 ) ( CLEAR ?auto_32714 ) ( not ( = ?auto_32693 ?auto_32704 ) ) ( not ( = ?auto_32694 ?auto_32704 ) ) ( not ( = ?auto_32701 ?auto_32704 ) ) ( not ( = ?auto_32707 ?auto_32704 ) ) ( not ( = ?auto_32710 ?auto_32704 ) ) ( not ( = ?auto_32714 ?auto_32704 ) ) ( not ( = ?auto_32718 ?auto_32704 ) ) ( not ( = ?auto_32711 ?auto_32704 ) ) ( IS-CRATE ?auto_32711 ) ( not ( = ?auto_32693 ?auto_32697 ) ) ( not ( = ?auto_32694 ?auto_32697 ) ) ( not ( = ?auto_32701 ?auto_32697 ) ) ( not ( = ?auto_32707 ?auto_32697 ) ) ( not ( = ?auto_32710 ?auto_32697 ) ) ( not ( = ?auto_32714 ?auto_32697 ) ) ( not ( = ?auto_32718 ?auto_32697 ) ) ( not ( = ?auto_32711 ?auto_32697 ) ) ( not ( = ?auto_32704 ?auto_32697 ) ) ( not ( = ?auto_32700 ?auto_32696 ) ) ( not ( = ?auto_32698 ?auto_32700 ) ) ( not ( = ?auto_32708 ?auto_32700 ) ) ( not ( = ?auto_32706 ?auto_32700 ) ) ( HOIST-AT ?auto_32702 ?auto_32700 ) ( not ( = ?auto_32695 ?auto_32702 ) ) ( not ( = ?auto_32709 ?auto_32702 ) ) ( not ( = ?auto_32717 ?auto_32702 ) ) ( not ( = ?auto_32713 ?auto_32702 ) ) ( SURFACE-AT ?auto_32711 ?auto_32700 ) ( ON ?auto_32711 ?auto_32705 ) ( CLEAR ?auto_32711 ) ( not ( = ?auto_32693 ?auto_32705 ) ) ( not ( = ?auto_32694 ?auto_32705 ) ) ( not ( = ?auto_32701 ?auto_32705 ) ) ( not ( = ?auto_32707 ?auto_32705 ) ) ( not ( = ?auto_32710 ?auto_32705 ) ) ( not ( = ?auto_32714 ?auto_32705 ) ) ( not ( = ?auto_32718 ?auto_32705 ) ) ( not ( = ?auto_32711 ?auto_32705 ) ) ( not ( = ?auto_32704 ?auto_32705 ) ) ( not ( = ?auto_32697 ?auto_32705 ) ) ( IS-CRATE ?auto_32697 ) ( not ( = ?auto_32693 ?auto_32699 ) ) ( not ( = ?auto_32694 ?auto_32699 ) ) ( not ( = ?auto_32701 ?auto_32699 ) ) ( not ( = ?auto_32707 ?auto_32699 ) ) ( not ( = ?auto_32710 ?auto_32699 ) ) ( not ( = ?auto_32714 ?auto_32699 ) ) ( not ( = ?auto_32718 ?auto_32699 ) ) ( not ( = ?auto_32711 ?auto_32699 ) ) ( not ( = ?auto_32704 ?auto_32699 ) ) ( not ( = ?auto_32697 ?auto_32699 ) ) ( not ( = ?auto_32705 ?auto_32699 ) ) ( not ( = ?auto_32719 ?auto_32696 ) ) ( not ( = ?auto_32698 ?auto_32719 ) ) ( not ( = ?auto_32708 ?auto_32719 ) ) ( not ( = ?auto_32706 ?auto_32719 ) ) ( not ( = ?auto_32700 ?auto_32719 ) ) ( HOIST-AT ?auto_32715 ?auto_32719 ) ( not ( = ?auto_32695 ?auto_32715 ) ) ( not ( = ?auto_32709 ?auto_32715 ) ) ( not ( = ?auto_32717 ?auto_32715 ) ) ( not ( = ?auto_32713 ?auto_32715 ) ) ( not ( = ?auto_32702 ?auto_32715 ) ) ( AVAILABLE ?auto_32715 ) ( SURFACE-AT ?auto_32697 ?auto_32719 ) ( ON ?auto_32697 ?auto_32716 ) ( CLEAR ?auto_32697 ) ( not ( = ?auto_32693 ?auto_32716 ) ) ( not ( = ?auto_32694 ?auto_32716 ) ) ( not ( = ?auto_32701 ?auto_32716 ) ) ( not ( = ?auto_32707 ?auto_32716 ) ) ( not ( = ?auto_32710 ?auto_32716 ) ) ( not ( = ?auto_32714 ?auto_32716 ) ) ( not ( = ?auto_32718 ?auto_32716 ) ) ( not ( = ?auto_32711 ?auto_32716 ) ) ( not ( = ?auto_32704 ?auto_32716 ) ) ( not ( = ?auto_32697 ?auto_32716 ) ) ( not ( = ?auto_32705 ?auto_32716 ) ) ( not ( = ?auto_32699 ?auto_32716 ) ) ( SURFACE-AT ?auto_32712 ?auto_32696 ) ( CLEAR ?auto_32712 ) ( IS-CRATE ?auto_32699 ) ( not ( = ?auto_32693 ?auto_32712 ) ) ( not ( = ?auto_32694 ?auto_32712 ) ) ( not ( = ?auto_32701 ?auto_32712 ) ) ( not ( = ?auto_32707 ?auto_32712 ) ) ( not ( = ?auto_32710 ?auto_32712 ) ) ( not ( = ?auto_32714 ?auto_32712 ) ) ( not ( = ?auto_32718 ?auto_32712 ) ) ( not ( = ?auto_32711 ?auto_32712 ) ) ( not ( = ?auto_32704 ?auto_32712 ) ) ( not ( = ?auto_32697 ?auto_32712 ) ) ( not ( = ?auto_32705 ?auto_32712 ) ) ( not ( = ?auto_32699 ?auto_32712 ) ) ( not ( = ?auto_32716 ?auto_32712 ) ) ( AVAILABLE ?auto_32695 ) ( AVAILABLE ?auto_32702 ) ( SURFACE-AT ?auto_32699 ?auto_32700 ) ( ON ?auto_32699 ?auto_32720 ) ( CLEAR ?auto_32699 ) ( not ( = ?auto_32693 ?auto_32720 ) ) ( not ( = ?auto_32694 ?auto_32720 ) ) ( not ( = ?auto_32701 ?auto_32720 ) ) ( not ( = ?auto_32707 ?auto_32720 ) ) ( not ( = ?auto_32710 ?auto_32720 ) ) ( not ( = ?auto_32714 ?auto_32720 ) ) ( not ( = ?auto_32718 ?auto_32720 ) ) ( not ( = ?auto_32711 ?auto_32720 ) ) ( not ( = ?auto_32704 ?auto_32720 ) ) ( not ( = ?auto_32697 ?auto_32720 ) ) ( not ( = ?auto_32705 ?auto_32720 ) ) ( not ( = ?auto_32699 ?auto_32720 ) ) ( not ( = ?auto_32716 ?auto_32720 ) ) ( not ( = ?auto_32712 ?auto_32720 ) ) ( TRUCK-AT ?auto_32703 ?auto_32696 ) )
    :subtasks
    ( ( !DRIVE ?auto_32703 ?auto_32696 ?auto_32700 )
      ( MAKE-ON ?auto_32693 ?auto_32694 )
      ( MAKE-ON-VERIFY ?auto_32693 ?auto_32694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32721 - SURFACE
      ?auto_32722 - SURFACE
    )
    :vars
    (
      ?auto_32727 - HOIST
      ?auto_32745 - PLACE
      ?auto_32736 - PLACE
      ?auto_32728 - HOIST
      ?auto_32735 - SURFACE
      ?auto_32747 - SURFACE
      ?auto_32732 - PLACE
      ?auto_32741 - HOIST
      ?auto_32742 - SURFACE
      ?auto_32738 - SURFACE
      ?auto_32724 - SURFACE
      ?auto_32725 - SURFACE
      ?auto_32743 - PLACE
      ?auto_32737 - HOIST
      ?auto_32730 - SURFACE
      ?auto_32734 - SURFACE
      ?auto_32733 - PLACE
      ?auto_32746 - HOIST
      ?auto_32748 - SURFACE
      ?auto_32731 - SURFACE
      ?auto_32726 - PLACE
      ?auto_32739 - HOIST
      ?auto_32740 - SURFACE
      ?auto_32729 - SURFACE
      ?auto_32723 - SURFACE
      ?auto_32744 - TRUCK
      ?auto_32749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32727 ?auto_32745 ) ( IS-CRATE ?auto_32721 ) ( not ( = ?auto_32721 ?auto_32722 ) ) ( not ( = ?auto_32736 ?auto_32745 ) ) ( HOIST-AT ?auto_32728 ?auto_32736 ) ( not ( = ?auto_32727 ?auto_32728 ) ) ( AVAILABLE ?auto_32728 ) ( SURFACE-AT ?auto_32721 ?auto_32736 ) ( ON ?auto_32721 ?auto_32735 ) ( CLEAR ?auto_32721 ) ( not ( = ?auto_32721 ?auto_32735 ) ) ( not ( = ?auto_32722 ?auto_32735 ) ) ( IS-CRATE ?auto_32722 ) ( not ( = ?auto_32721 ?auto_32747 ) ) ( not ( = ?auto_32722 ?auto_32747 ) ) ( not ( = ?auto_32735 ?auto_32747 ) ) ( not ( = ?auto_32732 ?auto_32745 ) ) ( not ( = ?auto_32736 ?auto_32732 ) ) ( HOIST-AT ?auto_32741 ?auto_32732 ) ( not ( = ?auto_32727 ?auto_32741 ) ) ( not ( = ?auto_32728 ?auto_32741 ) ) ( SURFACE-AT ?auto_32722 ?auto_32732 ) ( ON ?auto_32722 ?auto_32742 ) ( CLEAR ?auto_32722 ) ( not ( = ?auto_32721 ?auto_32742 ) ) ( not ( = ?auto_32722 ?auto_32742 ) ) ( not ( = ?auto_32735 ?auto_32742 ) ) ( not ( = ?auto_32747 ?auto_32742 ) ) ( IS-CRATE ?auto_32747 ) ( not ( = ?auto_32721 ?auto_32738 ) ) ( not ( = ?auto_32722 ?auto_32738 ) ) ( not ( = ?auto_32735 ?auto_32738 ) ) ( not ( = ?auto_32747 ?auto_32738 ) ) ( not ( = ?auto_32742 ?auto_32738 ) ) ( AVAILABLE ?auto_32741 ) ( SURFACE-AT ?auto_32747 ?auto_32732 ) ( ON ?auto_32747 ?auto_32724 ) ( CLEAR ?auto_32747 ) ( not ( = ?auto_32721 ?auto_32724 ) ) ( not ( = ?auto_32722 ?auto_32724 ) ) ( not ( = ?auto_32735 ?auto_32724 ) ) ( not ( = ?auto_32747 ?auto_32724 ) ) ( not ( = ?auto_32742 ?auto_32724 ) ) ( not ( = ?auto_32738 ?auto_32724 ) ) ( IS-CRATE ?auto_32738 ) ( not ( = ?auto_32721 ?auto_32725 ) ) ( not ( = ?auto_32722 ?auto_32725 ) ) ( not ( = ?auto_32735 ?auto_32725 ) ) ( not ( = ?auto_32747 ?auto_32725 ) ) ( not ( = ?auto_32742 ?auto_32725 ) ) ( not ( = ?auto_32738 ?auto_32725 ) ) ( not ( = ?auto_32724 ?auto_32725 ) ) ( not ( = ?auto_32743 ?auto_32745 ) ) ( not ( = ?auto_32736 ?auto_32743 ) ) ( not ( = ?auto_32732 ?auto_32743 ) ) ( HOIST-AT ?auto_32737 ?auto_32743 ) ( not ( = ?auto_32727 ?auto_32737 ) ) ( not ( = ?auto_32728 ?auto_32737 ) ) ( not ( = ?auto_32741 ?auto_32737 ) ) ( AVAILABLE ?auto_32737 ) ( SURFACE-AT ?auto_32738 ?auto_32743 ) ( ON ?auto_32738 ?auto_32730 ) ( CLEAR ?auto_32738 ) ( not ( = ?auto_32721 ?auto_32730 ) ) ( not ( = ?auto_32722 ?auto_32730 ) ) ( not ( = ?auto_32735 ?auto_32730 ) ) ( not ( = ?auto_32747 ?auto_32730 ) ) ( not ( = ?auto_32742 ?auto_32730 ) ) ( not ( = ?auto_32738 ?auto_32730 ) ) ( not ( = ?auto_32724 ?auto_32730 ) ) ( not ( = ?auto_32725 ?auto_32730 ) ) ( IS-CRATE ?auto_32725 ) ( not ( = ?auto_32721 ?auto_32734 ) ) ( not ( = ?auto_32722 ?auto_32734 ) ) ( not ( = ?auto_32735 ?auto_32734 ) ) ( not ( = ?auto_32747 ?auto_32734 ) ) ( not ( = ?auto_32742 ?auto_32734 ) ) ( not ( = ?auto_32738 ?auto_32734 ) ) ( not ( = ?auto_32724 ?auto_32734 ) ) ( not ( = ?auto_32725 ?auto_32734 ) ) ( not ( = ?auto_32730 ?auto_32734 ) ) ( not ( = ?auto_32733 ?auto_32745 ) ) ( not ( = ?auto_32736 ?auto_32733 ) ) ( not ( = ?auto_32732 ?auto_32733 ) ) ( not ( = ?auto_32743 ?auto_32733 ) ) ( HOIST-AT ?auto_32746 ?auto_32733 ) ( not ( = ?auto_32727 ?auto_32746 ) ) ( not ( = ?auto_32728 ?auto_32746 ) ) ( not ( = ?auto_32741 ?auto_32746 ) ) ( not ( = ?auto_32737 ?auto_32746 ) ) ( SURFACE-AT ?auto_32725 ?auto_32733 ) ( ON ?auto_32725 ?auto_32748 ) ( CLEAR ?auto_32725 ) ( not ( = ?auto_32721 ?auto_32748 ) ) ( not ( = ?auto_32722 ?auto_32748 ) ) ( not ( = ?auto_32735 ?auto_32748 ) ) ( not ( = ?auto_32747 ?auto_32748 ) ) ( not ( = ?auto_32742 ?auto_32748 ) ) ( not ( = ?auto_32738 ?auto_32748 ) ) ( not ( = ?auto_32724 ?auto_32748 ) ) ( not ( = ?auto_32725 ?auto_32748 ) ) ( not ( = ?auto_32730 ?auto_32748 ) ) ( not ( = ?auto_32734 ?auto_32748 ) ) ( IS-CRATE ?auto_32734 ) ( not ( = ?auto_32721 ?auto_32731 ) ) ( not ( = ?auto_32722 ?auto_32731 ) ) ( not ( = ?auto_32735 ?auto_32731 ) ) ( not ( = ?auto_32747 ?auto_32731 ) ) ( not ( = ?auto_32742 ?auto_32731 ) ) ( not ( = ?auto_32738 ?auto_32731 ) ) ( not ( = ?auto_32724 ?auto_32731 ) ) ( not ( = ?auto_32725 ?auto_32731 ) ) ( not ( = ?auto_32730 ?auto_32731 ) ) ( not ( = ?auto_32734 ?auto_32731 ) ) ( not ( = ?auto_32748 ?auto_32731 ) ) ( not ( = ?auto_32726 ?auto_32745 ) ) ( not ( = ?auto_32736 ?auto_32726 ) ) ( not ( = ?auto_32732 ?auto_32726 ) ) ( not ( = ?auto_32743 ?auto_32726 ) ) ( not ( = ?auto_32733 ?auto_32726 ) ) ( HOIST-AT ?auto_32739 ?auto_32726 ) ( not ( = ?auto_32727 ?auto_32739 ) ) ( not ( = ?auto_32728 ?auto_32739 ) ) ( not ( = ?auto_32741 ?auto_32739 ) ) ( not ( = ?auto_32737 ?auto_32739 ) ) ( not ( = ?auto_32746 ?auto_32739 ) ) ( AVAILABLE ?auto_32739 ) ( SURFACE-AT ?auto_32734 ?auto_32726 ) ( ON ?auto_32734 ?auto_32740 ) ( CLEAR ?auto_32734 ) ( not ( = ?auto_32721 ?auto_32740 ) ) ( not ( = ?auto_32722 ?auto_32740 ) ) ( not ( = ?auto_32735 ?auto_32740 ) ) ( not ( = ?auto_32747 ?auto_32740 ) ) ( not ( = ?auto_32742 ?auto_32740 ) ) ( not ( = ?auto_32738 ?auto_32740 ) ) ( not ( = ?auto_32724 ?auto_32740 ) ) ( not ( = ?auto_32725 ?auto_32740 ) ) ( not ( = ?auto_32730 ?auto_32740 ) ) ( not ( = ?auto_32734 ?auto_32740 ) ) ( not ( = ?auto_32748 ?auto_32740 ) ) ( not ( = ?auto_32731 ?auto_32740 ) ) ( IS-CRATE ?auto_32731 ) ( not ( = ?auto_32721 ?auto_32729 ) ) ( not ( = ?auto_32722 ?auto_32729 ) ) ( not ( = ?auto_32735 ?auto_32729 ) ) ( not ( = ?auto_32747 ?auto_32729 ) ) ( not ( = ?auto_32742 ?auto_32729 ) ) ( not ( = ?auto_32738 ?auto_32729 ) ) ( not ( = ?auto_32724 ?auto_32729 ) ) ( not ( = ?auto_32725 ?auto_32729 ) ) ( not ( = ?auto_32730 ?auto_32729 ) ) ( not ( = ?auto_32734 ?auto_32729 ) ) ( not ( = ?auto_32748 ?auto_32729 ) ) ( not ( = ?auto_32731 ?auto_32729 ) ) ( not ( = ?auto_32740 ?auto_32729 ) ) ( AVAILABLE ?auto_32746 ) ( SURFACE-AT ?auto_32731 ?auto_32733 ) ( ON ?auto_32731 ?auto_32723 ) ( CLEAR ?auto_32731 ) ( not ( = ?auto_32721 ?auto_32723 ) ) ( not ( = ?auto_32722 ?auto_32723 ) ) ( not ( = ?auto_32735 ?auto_32723 ) ) ( not ( = ?auto_32747 ?auto_32723 ) ) ( not ( = ?auto_32742 ?auto_32723 ) ) ( not ( = ?auto_32738 ?auto_32723 ) ) ( not ( = ?auto_32724 ?auto_32723 ) ) ( not ( = ?auto_32725 ?auto_32723 ) ) ( not ( = ?auto_32730 ?auto_32723 ) ) ( not ( = ?auto_32734 ?auto_32723 ) ) ( not ( = ?auto_32748 ?auto_32723 ) ) ( not ( = ?auto_32731 ?auto_32723 ) ) ( not ( = ?auto_32740 ?auto_32723 ) ) ( not ( = ?auto_32729 ?auto_32723 ) ) ( TRUCK-AT ?auto_32744 ?auto_32745 ) ( SURFACE-AT ?auto_32749 ?auto_32745 ) ( CLEAR ?auto_32749 ) ( LIFTING ?auto_32727 ?auto_32729 ) ( IS-CRATE ?auto_32729 ) ( not ( = ?auto_32721 ?auto_32749 ) ) ( not ( = ?auto_32722 ?auto_32749 ) ) ( not ( = ?auto_32735 ?auto_32749 ) ) ( not ( = ?auto_32747 ?auto_32749 ) ) ( not ( = ?auto_32742 ?auto_32749 ) ) ( not ( = ?auto_32738 ?auto_32749 ) ) ( not ( = ?auto_32724 ?auto_32749 ) ) ( not ( = ?auto_32725 ?auto_32749 ) ) ( not ( = ?auto_32730 ?auto_32749 ) ) ( not ( = ?auto_32734 ?auto_32749 ) ) ( not ( = ?auto_32748 ?auto_32749 ) ) ( not ( = ?auto_32731 ?auto_32749 ) ) ( not ( = ?auto_32740 ?auto_32749 ) ) ( not ( = ?auto_32729 ?auto_32749 ) ) ( not ( = ?auto_32723 ?auto_32749 ) ) )
    :subtasks
    ( ( !DROP ?auto_32727 ?auto_32729 ?auto_32749 ?auto_32745 )
      ( MAKE-ON ?auto_32721 ?auto_32722 )
      ( MAKE-ON-VERIFY ?auto_32721 ?auto_32722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32750 - SURFACE
      ?auto_32751 - SURFACE
    )
    :vars
    (
      ?auto_32758 - HOIST
      ?auto_32760 - PLACE
      ?auto_32776 - PLACE
      ?auto_32766 - HOIST
      ?auto_32764 - SURFACE
      ?auto_32754 - SURFACE
      ?auto_32757 - PLACE
      ?auto_32773 - HOIST
      ?auto_32774 - SURFACE
      ?auto_32761 - SURFACE
      ?auto_32752 - SURFACE
      ?auto_32753 - SURFACE
      ?auto_32775 - PLACE
      ?auto_32767 - HOIST
      ?auto_32765 - SURFACE
      ?auto_32778 - SURFACE
      ?auto_32756 - PLACE
      ?auto_32770 - HOIST
      ?auto_32755 - SURFACE
      ?auto_32777 - SURFACE
      ?auto_32763 - PLACE
      ?auto_32771 - HOIST
      ?auto_32772 - SURFACE
      ?auto_32768 - SURFACE
      ?auto_32762 - SURFACE
      ?auto_32759 - TRUCK
      ?auto_32769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32758 ?auto_32760 ) ( IS-CRATE ?auto_32750 ) ( not ( = ?auto_32750 ?auto_32751 ) ) ( not ( = ?auto_32776 ?auto_32760 ) ) ( HOIST-AT ?auto_32766 ?auto_32776 ) ( not ( = ?auto_32758 ?auto_32766 ) ) ( AVAILABLE ?auto_32766 ) ( SURFACE-AT ?auto_32750 ?auto_32776 ) ( ON ?auto_32750 ?auto_32764 ) ( CLEAR ?auto_32750 ) ( not ( = ?auto_32750 ?auto_32764 ) ) ( not ( = ?auto_32751 ?auto_32764 ) ) ( IS-CRATE ?auto_32751 ) ( not ( = ?auto_32750 ?auto_32754 ) ) ( not ( = ?auto_32751 ?auto_32754 ) ) ( not ( = ?auto_32764 ?auto_32754 ) ) ( not ( = ?auto_32757 ?auto_32760 ) ) ( not ( = ?auto_32776 ?auto_32757 ) ) ( HOIST-AT ?auto_32773 ?auto_32757 ) ( not ( = ?auto_32758 ?auto_32773 ) ) ( not ( = ?auto_32766 ?auto_32773 ) ) ( SURFACE-AT ?auto_32751 ?auto_32757 ) ( ON ?auto_32751 ?auto_32774 ) ( CLEAR ?auto_32751 ) ( not ( = ?auto_32750 ?auto_32774 ) ) ( not ( = ?auto_32751 ?auto_32774 ) ) ( not ( = ?auto_32764 ?auto_32774 ) ) ( not ( = ?auto_32754 ?auto_32774 ) ) ( IS-CRATE ?auto_32754 ) ( not ( = ?auto_32750 ?auto_32761 ) ) ( not ( = ?auto_32751 ?auto_32761 ) ) ( not ( = ?auto_32764 ?auto_32761 ) ) ( not ( = ?auto_32754 ?auto_32761 ) ) ( not ( = ?auto_32774 ?auto_32761 ) ) ( AVAILABLE ?auto_32773 ) ( SURFACE-AT ?auto_32754 ?auto_32757 ) ( ON ?auto_32754 ?auto_32752 ) ( CLEAR ?auto_32754 ) ( not ( = ?auto_32750 ?auto_32752 ) ) ( not ( = ?auto_32751 ?auto_32752 ) ) ( not ( = ?auto_32764 ?auto_32752 ) ) ( not ( = ?auto_32754 ?auto_32752 ) ) ( not ( = ?auto_32774 ?auto_32752 ) ) ( not ( = ?auto_32761 ?auto_32752 ) ) ( IS-CRATE ?auto_32761 ) ( not ( = ?auto_32750 ?auto_32753 ) ) ( not ( = ?auto_32751 ?auto_32753 ) ) ( not ( = ?auto_32764 ?auto_32753 ) ) ( not ( = ?auto_32754 ?auto_32753 ) ) ( not ( = ?auto_32774 ?auto_32753 ) ) ( not ( = ?auto_32761 ?auto_32753 ) ) ( not ( = ?auto_32752 ?auto_32753 ) ) ( not ( = ?auto_32775 ?auto_32760 ) ) ( not ( = ?auto_32776 ?auto_32775 ) ) ( not ( = ?auto_32757 ?auto_32775 ) ) ( HOIST-AT ?auto_32767 ?auto_32775 ) ( not ( = ?auto_32758 ?auto_32767 ) ) ( not ( = ?auto_32766 ?auto_32767 ) ) ( not ( = ?auto_32773 ?auto_32767 ) ) ( AVAILABLE ?auto_32767 ) ( SURFACE-AT ?auto_32761 ?auto_32775 ) ( ON ?auto_32761 ?auto_32765 ) ( CLEAR ?auto_32761 ) ( not ( = ?auto_32750 ?auto_32765 ) ) ( not ( = ?auto_32751 ?auto_32765 ) ) ( not ( = ?auto_32764 ?auto_32765 ) ) ( not ( = ?auto_32754 ?auto_32765 ) ) ( not ( = ?auto_32774 ?auto_32765 ) ) ( not ( = ?auto_32761 ?auto_32765 ) ) ( not ( = ?auto_32752 ?auto_32765 ) ) ( not ( = ?auto_32753 ?auto_32765 ) ) ( IS-CRATE ?auto_32753 ) ( not ( = ?auto_32750 ?auto_32778 ) ) ( not ( = ?auto_32751 ?auto_32778 ) ) ( not ( = ?auto_32764 ?auto_32778 ) ) ( not ( = ?auto_32754 ?auto_32778 ) ) ( not ( = ?auto_32774 ?auto_32778 ) ) ( not ( = ?auto_32761 ?auto_32778 ) ) ( not ( = ?auto_32752 ?auto_32778 ) ) ( not ( = ?auto_32753 ?auto_32778 ) ) ( not ( = ?auto_32765 ?auto_32778 ) ) ( not ( = ?auto_32756 ?auto_32760 ) ) ( not ( = ?auto_32776 ?auto_32756 ) ) ( not ( = ?auto_32757 ?auto_32756 ) ) ( not ( = ?auto_32775 ?auto_32756 ) ) ( HOIST-AT ?auto_32770 ?auto_32756 ) ( not ( = ?auto_32758 ?auto_32770 ) ) ( not ( = ?auto_32766 ?auto_32770 ) ) ( not ( = ?auto_32773 ?auto_32770 ) ) ( not ( = ?auto_32767 ?auto_32770 ) ) ( SURFACE-AT ?auto_32753 ?auto_32756 ) ( ON ?auto_32753 ?auto_32755 ) ( CLEAR ?auto_32753 ) ( not ( = ?auto_32750 ?auto_32755 ) ) ( not ( = ?auto_32751 ?auto_32755 ) ) ( not ( = ?auto_32764 ?auto_32755 ) ) ( not ( = ?auto_32754 ?auto_32755 ) ) ( not ( = ?auto_32774 ?auto_32755 ) ) ( not ( = ?auto_32761 ?auto_32755 ) ) ( not ( = ?auto_32752 ?auto_32755 ) ) ( not ( = ?auto_32753 ?auto_32755 ) ) ( not ( = ?auto_32765 ?auto_32755 ) ) ( not ( = ?auto_32778 ?auto_32755 ) ) ( IS-CRATE ?auto_32778 ) ( not ( = ?auto_32750 ?auto_32777 ) ) ( not ( = ?auto_32751 ?auto_32777 ) ) ( not ( = ?auto_32764 ?auto_32777 ) ) ( not ( = ?auto_32754 ?auto_32777 ) ) ( not ( = ?auto_32774 ?auto_32777 ) ) ( not ( = ?auto_32761 ?auto_32777 ) ) ( not ( = ?auto_32752 ?auto_32777 ) ) ( not ( = ?auto_32753 ?auto_32777 ) ) ( not ( = ?auto_32765 ?auto_32777 ) ) ( not ( = ?auto_32778 ?auto_32777 ) ) ( not ( = ?auto_32755 ?auto_32777 ) ) ( not ( = ?auto_32763 ?auto_32760 ) ) ( not ( = ?auto_32776 ?auto_32763 ) ) ( not ( = ?auto_32757 ?auto_32763 ) ) ( not ( = ?auto_32775 ?auto_32763 ) ) ( not ( = ?auto_32756 ?auto_32763 ) ) ( HOIST-AT ?auto_32771 ?auto_32763 ) ( not ( = ?auto_32758 ?auto_32771 ) ) ( not ( = ?auto_32766 ?auto_32771 ) ) ( not ( = ?auto_32773 ?auto_32771 ) ) ( not ( = ?auto_32767 ?auto_32771 ) ) ( not ( = ?auto_32770 ?auto_32771 ) ) ( AVAILABLE ?auto_32771 ) ( SURFACE-AT ?auto_32778 ?auto_32763 ) ( ON ?auto_32778 ?auto_32772 ) ( CLEAR ?auto_32778 ) ( not ( = ?auto_32750 ?auto_32772 ) ) ( not ( = ?auto_32751 ?auto_32772 ) ) ( not ( = ?auto_32764 ?auto_32772 ) ) ( not ( = ?auto_32754 ?auto_32772 ) ) ( not ( = ?auto_32774 ?auto_32772 ) ) ( not ( = ?auto_32761 ?auto_32772 ) ) ( not ( = ?auto_32752 ?auto_32772 ) ) ( not ( = ?auto_32753 ?auto_32772 ) ) ( not ( = ?auto_32765 ?auto_32772 ) ) ( not ( = ?auto_32778 ?auto_32772 ) ) ( not ( = ?auto_32755 ?auto_32772 ) ) ( not ( = ?auto_32777 ?auto_32772 ) ) ( IS-CRATE ?auto_32777 ) ( not ( = ?auto_32750 ?auto_32768 ) ) ( not ( = ?auto_32751 ?auto_32768 ) ) ( not ( = ?auto_32764 ?auto_32768 ) ) ( not ( = ?auto_32754 ?auto_32768 ) ) ( not ( = ?auto_32774 ?auto_32768 ) ) ( not ( = ?auto_32761 ?auto_32768 ) ) ( not ( = ?auto_32752 ?auto_32768 ) ) ( not ( = ?auto_32753 ?auto_32768 ) ) ( not ( = ?auto_32765 ?auto_32768 ) ) ( not ( = ?auto_32778 ?auto_32768 ) ) ( not ( = ?auto_32755 ?auto_32768 ) ) ( not ( = ?auto_32777 ?auto_32768 ) ) ( not ( = ?auto_32772 ?auto_32768 ) ) ( AVAILABLE ?auto_32770 ) ( SURFACE-AT ?auto_32777 ?auto_32756 ) ( ON ?auto_32777 ?auto_32762 ) ( CLEAR ?auto_32777 ) ( not ( = ?auto_32750 ?auto_32762 ) ) ( not ( = ?auto_32751 ?auto_32762 ) ) ( not ( = ?auto_32764 ?auto_32762 ) ) ( not ( = ?auto_32754 ?auto_32762 ) ) ( not ( = ?auto_32774 ?auto_32762 ) ) ( not ( = ?auto_32761 ?auto_32762 ) ) ( not ( = ?auto_32752 ?auto_32762 ) ) ( not ( = ?auto_32753 ?auto_32762 ) ) ( not ( = ?auto_32765 ?auto_32762 ) ) ( not ( = ?auto_32778 ?auto_32762 ) ) ( not ( = ?auto_32755 ?auto_32762 ) ) ( not ( = ?auto_32777 ?auto_32762 ) ) ( not ( = ?auto_32772 ?auto_32762 ) ) ( not ( = ?auto_32768 ?auto_32762 ) ) ( TRUCK-AT ?auto_32759 ?auto_32760 ) ( SURFACE-AT ?auto_32769 ?auto_32760 ) ( CLEAR ?auto_32769 ) ( IS-CRATE ?auto_32768 ) ( not ( = ?auto_32750 ?auto_32769 ) ) ( not ( = ?auto_32751 ?auto_32769 ) ) ( not ( = ?auto_32764 ?auto_32769 ) ) ( not ( = ?auto_32754 ?auto_32769 ) ) ( not ( = ?auto_32774 ?auto_32769 ) ) ( not ( = ?auto_32761 ?auto_32769 ) ) ( not ( = ?auto_32752 ?auto_32769 ) ) ( not ( = ?auto_32753 ?auto_32769 ) ) ( not ( = ?auto_32765 ?auto_32769 ) ) ( not ( = ?auto_32778 ?auto_32769 ) ) ( not ( = ?auto_32755 ?auto_32769 ) ) ( not ( = ?auto_32777 ?auto_32769 ) ) ( not ( = ?auto_32772 ?auto_32769 ) ) ( not ( = ?auto_32768 ?auto_32769 ) ) ( not ( = ?auto_32762 ?auto_32769 ) ) ( AVAILABLE ?auto_32758 ) ( IN ?auto_32768 ?auto_32759 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32758 ?auto_32768 ?auto_32759 ?auto_32760 )
      ( MAKE-ON ?auto_32750 ?auto_32751 )
      ( MAKE-ON-VERIFY ?auto_32750 ?auto_32751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32779 - SURFACE
      ?auto_32780 - SURFACE
    )
    :vars
    (
      ?auto_32791 - HOIST
      ?auto_32792 - PLACE
      ?auto_32793 - PLACE
      ?auto_32806 - HOIST
      ?auto_32784 - SURFACE
      ?auto_32785 - SURFACE
      ?auto_32790 - PLACE
      ?auto_32802 - HOIST
      ?auto_32803 - SURFACE
      ?auto_32783 - SURFACE
      ?auto_32787 - SURFACE
      ?auto_32786 - SURFACE
      ?auto_32796 - PLACE
      ?auto_32804 - HOIST
      ?auto_32805 - SURFACE
      ?auto_32795 - SURFACE
      ?auto_32807 - PLACE
      ?auto_32799 - HOIST
      ?auto_32789 - SURFACE
      ?auto_32794 - SURFACE
      ?auto_32781 - PLACE
      ?auto_32800 - HOIST
      ?auto_32801 - SURFACE
      ?auto_32797 - SURFACE
      ?auto_32788 - SURFACE
      ?auto_32798 - SURFACE
      ?auto_32782 - TRUCK
      ?auto_32808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32791 ?auto_32792 ) ( IS-CRATE ?auto_32779 ) ( not ( = ?auto_32779 ?auto_32780 ) ) ( not ( = ?auto_32793 ?auto_32792 ) ) ( HOIST-AT ?auto_32806 ?auto_32793 ) ( not ( = ?auto_32791 ?auto_32806 ) ) ( AVAILABLE ?auto_32806 ) ( SURFACE-AT ?auto_32779 ?auto_32793 ) ( ON ?auto_32779 ?auto_32784 ) ( CLEAR ?auto_32779 ) ( not ( = ?auto_32779 ?auto_32784 ) ) ( not ( = ?auto_32780 ?auto_32784 ) ) ( IS-CRATE ?auto_32780 ) ( not ( = ?auto_32779 ?auto_32785 ) ) ( not ( = ?auto_32780 ?auto_32785 ) ) ( not ( = ?auto_32784 ?auto_32785 ) ) ( not ( = ?auto_32790 ?auto_32792 ) ) ( not ( = ?auto_32793 ?auto_32790 ) ) ( HOIST-AT ?auto_32802 ?auto_32790 ) ( not ( = ?auto_32791 ?auto_32802 ) ) ( not ( = ?auto_32806 ?auto_32802 ) ) ( SURFACE-AT ?auto_32780 ?auto_32790 ) ( ON ?auto_32780 ?auto_32803 ) ( CLEAR ?auto_32780 ) ( not ( = ?auto_32779 ?auto_32803 ) ) ( not ( = ?auto_32780 ?auto_32803 ) ) ( not ( = ?auto_32784 ?auto_32803 ) ) ( not ( = ?auto_32785 ?auto_32803 ) ) ( IS-CRATE ?auto_32785 ) ( not ( = ?auto_32779 ?auto_32783 ) ) ( not ( = ?auto_32780 ?auto_32783 ) ) ( not ( = ?auto_32784 ?auto_32783 ) ) ( not ( = ?auto_32785 ?auto_32783 ) ) ( not ( = ?auto_32803 ?auto_32783 ) ) ( AVAILABLE ?auto_32802 ) ( SURFACE-AT ?auto_32785 ?auto_32790 ) ( ON ?auto_32785 ?auto_32787 ) ( CLEAR ?auto_32785 ) ( not ( = ?auto_32779 ?auto_32787 ) ) ( not ( = ?auto_32780 ?auto_32787 ) ) ( not ( = ?auto_32784 ?auto_32787 ) ) ( not ( = ?auto_32785 ?auto_32787 ) ) ( not ( = ?auto_32803 ?auto_32787 ) ) ( not ( = ?auto_32783 ?auto_32787 ) ) ( IS-CRATE ?auto_32783 ) ( not ( = ?auto_32779 ?auto_32786 ) ) ( not ( = ?auto_32780 ?auto_32786 ) ) ( not ( = ?auto_32784 ?auto_32786 ) ) ( not ( = ?auto_32785 ?auto_32786 ) ) ( not ( = ?auto_32803 ?auto_32786 ) ) ( not ( = ?auto_32783 ?auto_32786 ) ) ( not ( = ?auto_32787 ?auto_32786 ) ) ( not ( = ?auto_32796 ?auto_32792 ) ) ( not ( = ?auto_32793 ?auto_32796 ) ) ( not ( = ?auto_32790 ?auto_32796 ) ) ( HOIST-AT ?auto_32804 ?auto_32796 ) ( not ( = ?auto_32791 ?auto_32804 ) ) ( not ( = ?auto_32806 ?auto_32804 ) ) ( not ( = ?auto_32802 ?auto_32804 ) ) ( AVAILABLE ?auto_32804 ) ( SURFACE-AT ?auto_32783 ?auto_32796 ) ( ON ?auto_32783 ?auto_32805 ) ( CLEAR ?auto_32783 ) ( not ( = ?auto_32779 ?auto_32805 ) ) ( not ( = ?auto_32780 ?auto_32805 ) ) ( not ( = ?auto_32784 ?auto_32805 ) ) ( not ( = ?auto_32785 ?auto_32805 ) ) ( not ( = ?auto_32803 ?auto_32805 ) ) ( not ( = ?auto_32783 ?auto_32805 ) ) ( not ( = ?auto_32787 ?auto_32805 ) ) ( not ( = ?auto_32786 ?auto_32805 ) ) ( IS-CRATE ?auto_32786 ) ( not ( = ?auto_32779 ?auto_32795 ) ) ( not ( = ?auto_32780 ?auto_32795 ) ) ( not ( = ?auto_32784 ?auto_32795 ) ) ( not ( = ?auto_32785 ?auto_32795 ) ) ( not ( = ?auto_32803 ?auto_32795 ) ) ( not ( = ?auto_32783 ?auto_32795 ) ) ( not ( = ?auto_32787 ?auto_32795 ) ) ( not ( = ?auto_32786 ?auto_32795 ) ) ( not ( = ?auto_32805 ?auto_32795 ) ) ( not ( = ?auto_32807 ?auto_32792 ) ) ( not ( = ?auto_32793 ?auto_32807 ) ) ( not ( = ?auto_32790 ?auto_32807 ) ) ( not ( = ?auto_32796 ?auto_32807 ) ) ( HOIST-AT ?auto_32799 ?auto_32807 ) ( not ( = ?auto_32791 ?auto_32799 ) ) ( not ( = ?auto_32806 ?auto_32799 ) ) ( not ( = ?auto_32802 ?auto_32799 ) ) ( not ( = ?auto_32804 ?auto_32799 ) ) ( SURFACE-AT ?auto_32786 ?auto_32807 ) ( ON ?auto_32786 ?auto_32789 ) ( CLEAR ?auto_32786 ) ( not ( = ?auto_32779 ?auto_32789 ) ) ( not ( = ?auto_32780 ?auto_32789 ) ) ( not ( = ?auto_32784 ?auto_32789 ) ) ( not ( = ?auto_32785 ?auto_32789 ) ) ( not ( = ?auto_32803 ?auto_32789 ) ) ( not ( = ?auto_32783 ?auto_32789 ) ) ( not ( = ?auto_32787 ?auto_32789 ) ) ( not ( = ?auto_32786 ?auto_32789 ) ) ( not ( = ?auto_32805 ?auto_32789 ) ) ( not ( = ?auto_32795 ?auto_32789 ) ) ( IS-CRATE ?auto_32795 ) ( not ( = ?auto_32779 ?auto_32794 ) ) ( not ( = ?auto_32780 ?auto_32794 ) ) ( not ( = ?auto_32784 ?auto_32794 ) ) ( not ( = ?auto_32785 ?auto_32794 ) ) ( not ( = ?auto_32803 ?auto_32794 ) ) ( not ( = ?auto_32783 ?auto_32794 ) ) ( not ( = ?auto_32787 ?auto_32794 ) ) ( not ( = ?auto_32786 ?auto_32794 ) ) ( not ( = ?auto_32805 ?auto_32794 ) ) ( not ( = ?auto_32795 ?auto_32794 ) ) ( not ( = ?auto_32789 ?auto_32794 ) ) ( not ( = ?auto_32781 ?auto_32792 ) ) ( not ( = ?auto_32793 ?auto_32781 ) ) ( not ( = ?auto_32790 ?auto_32781 ) ) ( not ( = ?auto_32796 ?auto_32781 ) ) ( not ( = ?auto_32807 ?auto_32781 ) ) ( HOIST-AT ?auto_32800 ?auto_32781 ) ( not ( = ?auto_32791 ?auto_32800 ) ) ( not ( = ?auto_32806 ?auto_32800 ) ) ( not ( = ?auto_32802 ?auto_32800 ) ) ( not ( = ?auto_32804 ?auto_32800 ) ) ( not ( = ?auto_32799 ?auto_32800 ) ) ( AVAILABLE ?auto_32800 ) ( SURFACE-AT ?auto_32795 ?auto_32781 ) ( ON ?auto_32795 ?auto_32801 ) ( CLEAR ?auto_32795 ) ( not ( = ?auto_32779 ?auto_32801 ) ) ( not ( = ?auto_32780 ?auto_32801 ) ) ( not ( = ?auto_32784 ?auto_32801 ) ) ( not ( = ?auto_32785 ?auto_32801 ) ) ( not ( = ?auto_32803 ?auto_32801 ) ) ( not ( = ?auto_32783 ?auto_32801 ) ) ( not ( = ?auto_32787 ?auto_32801 ) ) ( not ( = ?auto_32786 ?auto_32801 ) ) ( not ( = ?auto_32805 ?auto_32801 ) ) ( not ( = ?auto_32795 ?auto_32801 ) ) ( not ( = ?auto_32789 ?auto_32801 ) ) ( not ( = ?auto_32794 ?auto_32801 ) ) ( IS-CRATE ?auto_32794 ) ( not ( = ?auto_32779 ?auto_32797 ) ) ( not ( = ?auto_32780 ?auto_32797 ) ) ( not ( = ?auto_32784 ?auto_32797 ) ) ( not ( = ?auto_32785 ?auto_32797 ) ) ( not ( = ?auto_32803 ?auto_32797 ) ) ( not ( = ?auto_32783 ?auto_32797 ) ) ( not ( = ?auto_32787 ?auto_32797 ) ) ( not ( = ?auto_32786 ?auto_32797 ) ) ( not ( = ?auto_32805 ?auto_32797 ) ) ( not ( = ?auto_32795 ?auto_32797 ) ) ( not ( = ?auto_32789 ?auto_32797 ) ) ( not ( = ?auto_32794 ?auto_32797 ) ) ( not ( = ?auto_32801 ?auto_32797 ) ) ( AVAILABLE ?auto_32799 ) ( SURFACE-AT ?auto_32794 ?auto_32807 ) ( ON ?auto_32794 ?auto_32788 ) ( CLEAR ?auto_32794 ) ( not ( = ?auto_32779 ?auto_32788 ) ) ( not ( = ?auto_32780 ?auto_32788 ) ) ( not ( = ?auto_32784 ?auto_32788 ) ) ( not ( = ?auto_32785 ?auto_32788 ) ) ( not ( = ?auto_32803 ?auto_32788 ) ) ( not ( = ?auto_32783 ?auto_32788 ) ) ( not ( = ?auto_32787 ?auto_32788 ) ) ( not ( = ?auto_32786 ?auto_32788 ) ) ( not ( = ?auto_32805 ?auto_32788 ) ) ( not ( = ?auto_32795 ?auto_32788 ) ) ( not ( = ?auto_32789 ?auto_32788 ) ) ( not ( = ?auto_32794 ?auto_32788 ) ) ( not ( = ?auto_32801 ?auto_32788 ) ) ( not ( = ?auto_32797 ?auto_32788 ) ) ( SURFACE-AT ?auto_32798 ?auto_32792 ) ( CLEAR ?auto_32798 ) ( IS-CRATE ?auto_32797 ) ( not ( = ?auto_32779 ?auto_32798 ) ) ( not ( = ?auto_32780 ?auto_32798 ) ) ( not ( = ?auto_32784 ?auto_32798 ) ) ( not ( = ?auto_32785 ?auto_32798 ) ) ( not ( = ?auto_32803 ?auto_32798 ) ) ( not ( = ?auto_32783 ?auto_32798 ) ) ( not ( = ?auto_32787 ?auto_32798 ) ) ( not ( = ?auto_32786 ?auto_32798 ) ) ( not ( = ?auto_32805 ?auto_32798 ) ) ( not ( = ?auto_32795 ?auto_32798 ) ) ( not ( = ?auto_32789 ?auto_32798 ) ) ( not ( = ?auto_32794 ?auto_32798 ) ) ( not ( = ?auto_32801 ?auto_32798 ) ) ( not ( = ?auto_32797 ?auto_32798 ) ) ( not ( = ?auto_32788 ?auto_32798 ) ) ( AVAILABLE ?auto_32791 ) ( IN ?auto_32797 ?auto_32782 ) ( TRUCK-AT ?auto_32782 ?auto_32808 ) ( not ( = ?auto_32808 ?auto_32792 ) ) ( not ( = ?auto_32793 ?auto_32808 ) ) ( not ( = ?auto_32790 ?auto_32808 ) ) ( not ( = ?auto_32796 ?auto_32808 ) ) ( not ( = ?auto_32807 ?auto_32808 ) ) ( not ( = ?auto_32781 ?auto_32808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32782 ?auto_32808 ?auto_32792 )
      ( MAKE-ON ?auto_32779 ?auto_32780 )
      ( MAKE-ON-VERIFY ?auto_32779 ?auto_32780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32809 - SURFACE
      ?auto_32810 - SURFACE
    )
    :vars
    (
      ?auto_32814 - HOIST
      ?auto_32812 - PLACE
      ?auto_32813 - PLACE
      ?auto_32819 - HOIST
      ?auto_32835 - SURFACE
      ?auto_32817 - SURFACE
      ?auto_32815 - PLACE
      ?auto_32827 - HOIST
      ?auto_32828 - SURFACE
      ?auto_32833 - SURFACE
      ?auto_32830 - SURFACE
      ?auto_32831 - SURFACE
      ?auto_32829 - PLACE
      ?auto_32821 - HOIST
      ?auto_32818 - SURFACE
      ?auto_32811 - SURFACE
      ?auto_32820 - PLACE
      ?auto_32824 - HOIST
      ?auto_32837 - SURFACE
      ?auto_32816 - SURFACE
      ?auto_32838 - PLACE
      ?auto_32825 - HOIST
      ?auto_32826 - SURFACE
      ?auto_32822 - SURFACE
      ?auto_32832 - SURFACE
      ?auto_32823 - SURFACE
      ?auto_32834 - TRUCK
      ?auto_32836 - PLACE
      ?auto_32839 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32814 ?auto_32812 ) ( IS-CRATE ?auto_32809 ) ( not ( = ?auto_32809 ?auto_32810 ) ) ( not ( = ?auto_32813 ?auto_32812 ) ) ( HOIST-AT ?auto_32819 ?auto_32813 ) ( not ( = ?auto_32814 ?auto_32819 ) ) ( AVAILABLE ?auto_32819 ) ( SURFACE-AT ?auto_32809 ?auto_32813 ) ( ON ?auto_32809 ?auto_32835 ) ( CLEAR ?auto_32809 ) ( not ( = ?auto_32809 ?auto_32835 ) ) ( not ( = ?auto_32810 ?auto_32835 ) ) ( IS-CRATE ?auto_32810 ) ( not ( = ?auto_32809 ?auto_32817 ) ) ( not ( = ?auto_32810 ?auto_32817 ) ) ( not ( = ?auto_32835 ?auto_32817 ) ) ( not ( = ?auto_32815 ?auto_32812 ) ) ( not ( = ?auto_32813 ?auto_32815 ) ) ( HOIST-AT ?auto_32827 ?auto_32815 ) ( not ( = ?auto_32814 ?auto_32827 ) ) ( not ( = ?auto_32819 ?auto_32827 ) ) ( SURFACE-AT ?auto_32810 ?auto_32815 ) ( ON ?auto_32810 ?auto_32828 ) ( CLEAR ?auto_32810 ) ( not ( = ?auto_32809 ?auto_32828 ) ) ( not ( = ?auto_32810 ?auto_32828 ) ) ( not ( = ?auto_32835 ?auto_32828 ) ) ( not ( = ?auto_32817 ?auto_32828 ) ) ( IS-CRATE ?auto_32817 ) ( not ( = ?auto_32809 ?auto_32833 ) ) ( not ( = ?auto_32810 ?auto_32833 ) ) ( not ( = ?auto_32835 ?auto_32833 ) ) ( not ( = ?auto_32817 ?auto_32833 ) ) ( not ( = ?auto_32828 ?auto_32833 ) ) ( AVAILABLE ?auto_32827 ) ( SURFACE-AT ?auto_32817 ?auto_32815 ) ( ON ?auto_32817 ?auto_32830 ) ( CLEAR ?auto_32817 ) ( not ( = ?auto_32809 ?auto_32830 ) ) ( not ( = ?auto_32810 ?auto_32830 ) ) ( not ( = ?auto_32835 ?auto_32830 ) ) ( not ( = ?auto_32817 ?auto_32830 ) ) ( not ( = ?auto_32828 ?auto_32830 ) ) ( not ( = ?auto_32833 ?auto_32830 ) ) ( IS-CRATE ?auto_32833 ) ( not ( = ?auto_32809 ?auto_32831 ) ) ( not ( = ?auto_32810 ?auto_32831 ) ) ( not ( = ?auto_32835 ?auto_32831 ) ) ( not ( = ?auto_32817 ?auto_32831 ) ) ( not ( = ?auto_32828 ?auto_32831 ) ) ( not ( = ?auto_32833 ?auto_32831 ) ) ( not ( = ?auto_32830 ?auto_32831 ) ) ( not ( = ?auto_32829 ?auto_32812 ) ) ( not ( = ?auto_32813 ?auto_32829 ) ) ( not ( = ?auto_32815 ?auto_32829 ) ) ( HOIST-AT ?auto_32821 ?auto_32829 ) ( not ( = ?auto_32814 ?auto_32821 ) ) ( not ( = ?auto_32819 ?auto_32821 ) ) ( not ( = ?auto_32827 ?auto_32821 ) ) ( AVAILABLE ?auto_32821 ) ( SURFACE-AT ?auto_32833 ?auto_32829 ) ( ON ?auto_32833 ?auto_32818 ) ( CLEAR ?auto_32833 ) ( not ( = ?auto_32809 ?auto_32818 ) ) ( not ( = ?auto_32810 ?auto_32818 ) ) ( not ( = ?auto_32835 ?auto_32818 ) ) ( not ( = ?auto_32817 ?auto_32818 ) ) ( not ( = ?auto_32828 ?auto_32818 ) ) ( not ( = ?auto_32833 ?auto_32818 ) ) ( not ( = ?auto_32830 ?auto_32818 ) ) ( not ( = ?auto_32831 ?auto_32818 ) ) ( IS-CRATE ?auto_32831 ) ( not ( = ?auto_32809 ?auto_32811 ) ) ( not ( = ?auto_32810 ?auto_32811 ) ) ( not ( = ?auto_32835 ?auto_32811 ) ) ( not ( = ?auto_32817 ?auto_32811 ) ) ( not ( = ?auto_32828 ?auto_32811 ) ) ( not ( = ?auto_32833 ?auto_32811 ) ) ( not ( = ?auto_32830 ?auto_32811 ) ) ( not ( = ?auto_32831 ?auto_32811 ) ) ( not ( = ?auto_32818 ?auto_32811 ) ) ( not ( = ?auto_32820 ?auto_32812 ) ) ( not ( = ?auto_32813 ?auto_32820 ) ) ( not ( = ?auto_32815 ?auto_32820 ) ) ( not ( = ?auto_32829 ?auto_32820 ) ) ( HOIST-AT ?auto_32824 ?auto_32820 ) ( not ( = ?auto_32814 ?auto_32824 ) ) ( not ( = ?auto_32819 ?auto_32824 ) ) ( not ( = ?auto_32827 ?auto_32824 ) ) ( not ( = ?auto_32821 ?auto_32824 ) ) ( SURFACE-AT ?auto_32831 ?auto_32820 ) ( ON ?auto_32831 ?auto_32837 ) ( CLEAR ?auto_32831 ) ( not ( = ?auto_32809 ?auto_32837 ) ) ( not ( = ?auto_32810 ?auto_32837 ) ) ( not ( = ?auto_32835 ?auto_32837 ) ) ( not ( = ?auto_32817 ?auto_32837 ) ) ( not ( = ?auto_32828 ?auto_32837 ) ) ( not ( = ?auto_32833 ?auto_32837 ) ) ( not ( = ?auto_32830 ?auto_32837 ) ) ( not ( = ?auto_32831 ?auto_32837 ) ) ( not ( = ?auto_32818 ?auto_32837 ) ) ( not ( = ?auto_32811 ?auto_32837 ) ) ( IS-CRATE ?auto_32811 ) ( not ( = ?auto_32809 ?auto_32816 ) ) ( not ( = ?auto_32810 ?auto_32816 ) ) ( not ( = ?auto_32835 ?auto_32816 ) ) ( not ( = ?auto_32817 ?auto_32816 ) ) ( not ( = ?auto_32828 ?auto_32816 ) ) ( not ( = ?auto_32833 ?auto_32816 ) ) ( not ( = ?auto_32830 ?auto_32816 ) ) ( not ( = ?auto_32831 ?auto_32816 ) ) ( not ( = ?auto_32818 ?auto_32816 ) ) ( not ( = ?auto_32811 ?auto_32816 ) ) ( not ( = ?auto_32837 ?auto_32816 ) ) ( not ( = ?auto_32838 ?auto_32812 ) ) ( not ( = ?auto_32813 ?auto_32838 ) ) ( not ( = ?auto_32815 ?auto_32838 ) ) ( not ( = ?auto_32829 ?auto_32838 ) ) ( not ( = ?auto_32820 ?auto_32838 ) ) ( HOIST-AT ?auto_32825 ?auto_32838 ) ( not ( = ?auto_32814 ?auto_32825 ) ) ( not ( = ?auto_32819 ?auto_32825 ) ) ( not ( = ?auto_32827 ?auto_32825 ) ) ( not ( = ?auto_32821 ?auto_32825 ) ) ( not ( = ?auto_32824 ?auto_32825 ) ) ( AVAILABLE ?auto_32825 ) ( SURFACE-AT ?auto_32811 ?auto_32838 ) ( ON ?auto_32811 ?auto_32826 ) ( CLEAR ?auto_32811 ) ( not ( = ?auto_32809 ?auto_32826 ) ) ( not ( = ?auto_32810 ?auto_32826 ) ) ( not ( = ?auto_32835 ?auto_32826 ) ) ( not ( = ?auto_32817 ?auto_32826 ) ) ( not ( = ?auto_32828 ?auto_32826 ) ) ( not ( = ?auto_32833 ?auto_32826 ) ) ( not ( = ?auto_32830 ?auto_32826 ) ) ( not ( = ?auto_32831 ?auto_32826 ) ) ( not ( = ?auto_32818 ?auto_32826 ) ) ( not ( = ?auto_32811 ?auto_32826 ) ) ( not ( = ?auto_32837 ?auto_32826 ) ) ( not ( = ?auto_32816 ?auto_32826 ) ) ( IS-CRATE ?auto_32816 ) ( not ( = ?auto_32809 ?auto_32822 ) ) ( not ( = ?auto_32810 ?auto_32822 ) ) ( not ( = ?auto_32835 ?auto_32822 ) ) ( not ( = ?auto_32817 ?auto_32822 ) ) ( not ( = ?auto_32828 ?auto_32822 ) ) ( not ( = ?auto_32833 ?auto_32822 ) ) ( not ( = ?auto_32830 ?auto_32822 ) ) ( not ( = ?auto_32831 ?auto_32822 ) ) ( not ( = ?auto_32818 ?auto_32822 ) ) ( not ( = ?auto_32811 ?auto_32822 ) ) ( not ( = ?auto_32837 ?auto_32822 ) ) ( not ( = ?auto_32816 ?auto_32822 ) ) ( not ( = ?auto_32826 ?auto_32822 ) ) ( AVAILABLE ?auto_32824 ) ( SURFACE-AT ?auto_32816 ?auto_32820 ) ( ON ?auto_32816 ?auto_32832 ) ( CLEAR ?auto_32816 ) ( not ( = ?auto_32809 ?auto_32832 ) ) ( not ( = ?auto_32810 ?auto_32832 ) ) ( not ( = ?auto_32835 ?auto_32832 ) ) ( not ( = ?auto_32817 ?auto_32832 ) ) ( not ( = ?auto_32828 ?auto_32832 ) ) ( not ( = ?auto_32833 ?auto_32832 ) ) ( not ( = ?auto_32830 ?auto_32832 ) ) ( not ( = ?auto_32831 ?auto_32832 ) ) ( not ( = ?auto_32818 ?auto_32832 ) ) ( not ( = ?auto_32811 ?auto_32832 ) ) ( not ( = ?auto_32837 ?auto_32832 ) ) ( not ( = ?auto_32816 ?auto_32832 ) ) ( not ( = ?auto_32826 ?auto_32832 ) ) ( not ( = ?auto_32822 ?auto_32832 ) ) ( SURFACE-AT ?auto_32823 ?auto_32812 ) ( CLEAR ?auto_32823 ) ( IS-CRATE ?auto_32822 ) ( not ( = ?auto_32809 ?auto_32823 ) ) ( not ( = ?auto_32810 ?auto_32823 ) ) ( not ( = ?auto_32835 ?auto_32823 ) ) ( not ( = ?auto_32817 ?auto_32823 ) ) ( not ( = ?auto_32828 ?auto_32823 ) ) ( not ( = ?auto_32833 ?auto_32823 ) ) ( not ( = ?auto_32830 ?auto_32823 ) ) ( not ( = ?auto_32831 ?auto_32823 ) ) ( not ( = ?auto_32818 ?auto_32823 ) ) ( not ( = ?auto_32811 ?auto_32823 ) ) ( not ( = ?auto_32837 ?auto_32823 ) ) ( not ( = ?auto_32816 ?auto_32823 ) ) ( not ( = ?auto_32826 ?auto_32823 ) ) ( not ( = ?auto_32822 ?auto_32823 ) ) ( not ( = ?auto_32832 ?auto_32823 ) ) ( AVAILABLE ?auto_32814 ) ( TRUCK-AT ?auto_32834 ?auto_32836 ) ( not ( = ?auto_32836 ?auto_32812 ) ) ( not ( = ?auto_32813 ?auto_32836 ) ) ( not ( = ?auto_32815 ?auto_32836 ) ) ( not ( = ?auto_32829 ?auto_32836 ) ) ( not ( = ?auto_32820 ?auto_32836 ) ) ( not ( = ?auto_32838 ?auto_32836 ) ) ( HOIST-AT ?auto_32839 ?auto_32836 ) ( LIFTING ?auto_32839 ?auto_32822 ) ( not ( = ?auto_32814 ?auto_32839 ) ) ( not ( = ?auto_32819 ?auto_32839 ) ) ( not ( = ?auto_32827 ?auto_32839 ) ) ( not ( = ?auto_32821 ?auto_32839 ) ) ( not ( = ?auto_32824 ?auto_32839 ) ) ( not ( = ?auto_32825 ?auto_32839 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32839 ?auto_32822 ?auto_32834 ?auto_32836 )
      ( MAKE-ON ?auto_32809 ?auto_32810 )
      ( MAKE-ON-VERIFY ?auto_32809 ?auto_32810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32840 - SURFACE
      ?auto_32841 - SURFACE
    )
    :vars
    (
      ?auto_32848 - HOIST
      ?auto_32847 - PLACE
      ?auto_32849 - PLACE
      ?auto_32866 - HOIST
      ?auto_32853 - SURFACE
      ?auto_32845 - SURFACE
      ?auto_32850 - PLACE
      ?auto_32858 - HOIST
      ?auto_32859 - SURFACE
      ?auto_32864 - SURFACE
      ?auto_32861 - SURFACE
      ?auto_32862 - SURFACE
      ?auto_32860 - PLACE
      ?auto_32868 - HOIST
      ?auto_32844 - SURFACE
      ?auto_32851 - SURFACE
      ?auto_32867 - PLACE
      ?auto_32842 - HOIST
      ?auto_32855 - SURFACE
      ?auto_32846 - SURFACE
      ?auto_32856 - PLACE
      ?auto_32852 - HOIST
      ?auto_32865 - SURFACE
      ?auto_32869 - SURFACE
      ?auto_32863 - SURFACE
      ?auto_32843 - SURFACE
      ?auto_32857 - TRUCK
      ?auto_32854 - PLACE
      ?auto_32870 - HOIST
      ?auto_32871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32848 ?auto_32847 ) ( IS-CRATE ?auto_32840 ) ( not ( = ?auto_32840 ?auto_32841 ) ) ( not ( = ?auto_32849 ?auto_32847 ) ) ( HOIST-AT ?auto_32866 ?auto_32849 ) ( not ( = ?auto_32848 ?auto_32866 ) ) ( AVAILABLE ?auto_32866 ) ( SURFACE-AT ?auto_32840 ?auto_32849 ) ( ON ?auto_32840 ?auto_32853 ) ( CLEAR ?auto_32840 ) ( not ( = ?auto_32840 ?auto_32853 ) ) ( not ( = ?auto_32841 ?auto_32853 ) ) ( IS-CRATE ?auto_32841 ) ( not ( = ?auto_32840 ?auto_32845 ) ) ( not ( = ?auto_32841 ?auto_32845 ) ) ( not ( = ?auto_32853 ?auto_32845 ) ) ( not ( = ?auto_32850 ?auto_32847 ) ) ( not ( = ?auto_32849 ?auto_32850 ) ) ( HOIST-AT ?auto_32858 ?auto_32850 ) ( not ( = ?auto_32848 ?auto_32858 ) ) ( not ( = ?auto_32866 ?auto_32858 ) ) ( SURFACE-AT ?auto_32841 ?auto_32850 ) ( ON ?auto_32841 ?auto_32859 ) ( CLEAR ?auto_32841 ) ( not ( = ?auto_32840 ?auto_32859 ) ) ( not ( = ?auto_32841 ?auto_32859 ) ) ( not ( = ?auto_32853 ?auto_32859 ) ) ( not ( = ?auto_32845 ?auto_32859 ) ) ( IS-CRATE ?auto_32845 ) ( not ( = ?auto_32840 ?auto_32864 ) ) ( not ( = ?auto_32841 ?auto_32864 ) ) ( not ( = ?auto_32853 ?auto_32864 ) ) ( not ( = ?auto_32845 ?auto_32864 ) ) ( not ( = ?auto_32859 ?auto_32864 ) ) ( AVAILABLE ?auto_32858 ) ( SURFACE-AT ?auto_32845 ?auto_32850 ) ( ON ?auto_32845 ?auto_32861 ) ( CLEAR ?auto_32845 ) ( not ( = ?auto_32840 ?auto_32861 ) ) ( not ( = ?auto_32841 ?auto_32861 ) ) ( not ( = ?auto_32853 ?auto_32861 ) ) ( not ( = ?auto_32845 ?auto_32861 ) ) ( not ( = ?auto_32859 ?auto_32861 ) ) ( not ( = ?auto_32864 ?auto_32861 ) ) ( IS-CRATE ?auto_32864 ) ( not ( = ?auto_32840 ?auto_32862 ) ) ( not ( = ?auto_32841 ?auto_32862 ) ) ( not ( = ?auto_32853 ?auto_32862 ) ) ( not ( = ?auto_32845 ?auto_32862 ) ) ( not ( = ?auto_32859 ?auto_32862 ) ) ( not ( = ?auto_32864 ?auto_32862 ) ) ( not ( = ?auto_32861 ?auto_32862 ) ) ( not ( = ?auto_32860 ?auto_32847 ) ) ( not ( = ?auto_32849 ?auto_32860 ) ) ( not ( = ?auto_32850 ?auto_32860 ) ) ( HOIST-AT ?auto_32868 ?auto_32860 ) ( not ( = ?auto_32848 ?auto_32868 ) ) ( not ( = ?auto_32866 ?auto_32868 ) ) ( not ( = ?auto_32858 ?auto_32868 ) ) ( AVAILABLE ?auto_32868 ) ( SURFACE-AT ?auto_32864 ?auto_32860 ) ( ON ?auto_32864 ?auto_32844 ) ( CLEAR ?auto_32864 ) ( not ( = ?auto_32840 ?auto_32844 ) ) ( not ( = ?auto_32841 ?auto_32844 ) ) ( not ( = ?auto_32853 ?auto_32844 ) ) ( not ( = ?auto_32845 ?auto_32844 ) ) ( not ( = ?auto_32859 ?auto_32844 ) ) ( not ( = ?auto_32864 ?auto_32844 ) ) ( not ( = ?auto_32861 ?auto_32844 ) ) ( not ( = ?auto_32862 ?auto_32844 ) ) ( IS-CRATE ?auto_32862 ) ( not ( = ?auto_32840 ?auto_32851 ) ) ( not ( = ?auto_32841 ?auto_32851 ) ) ( not ( = ?auto_32853 ?auto_32851 ) ) ( not ( = ?auto_32845 ?auto_32851 ) ) ( not ( = ?auto_32859 ?auto_32851 ) ) ( not ( = ?auto_32864 ?auto_32851 ) ) ( not ( = ?auto_32861 ?auto_32851 ) ) ( not ( = ?auto_32862 ?auto_32851 ) ) ( not ( = ?auto_32844 ?auto_32851 ) ) ( not ( = ?auto_32867 ?auto_32847 ) ) ( not ( = ?auto_32849 ?auto_32867 ) ) ( not ( = ?auto_32850 ?auto_32867 ) ) ( not ( = ?auto_32860 ?auto_32867 ) ) ( HOIST-AT ?auto_32842 ?auto_32867 ) ( not ( = ?auto_32848 ?auto_32842 ) ) ( not ( = ?auto_32866 ?auto_32842 ) ) ( not ( = ?auto_32858 ?auto_32842 ) ) ( not ( = ?auto_32868 ?auto_32842 ) ) ( SURFACE-AT ?auto_32862 ?auto_32867 ) ( ON ?auto_32862 ?auto_32855 ) ( CLEAR ?auto_32862 ) ( not ( = ?auto_32840 ?auto_32855 ) ) ( not ( = ?auto_32841 ?auto_32855 ) ) ( not ( = ?auto_32853 ?auto_32855 ) ) ( not ( = ?auto_32845 ?auto_32855 ) ) ( not ( = ?auto_32859 ?auto_32855 ) ) ( not ( = ?auto_32864 ?auto_32855 ) ) ( not ( = ?auto_32861 ?auto_32855 ) ) ( not ( = ?auto_32862 ?auto_32855 ) ) ( not ( = ?auto_32844 ?auto_32855 ) ) ( not ( = ?auto_32851 ?auto_32855 ) ) ( IS-CRATE ?auto_32851 ) ( not ( = ?auto_32840 ?auto_32846 ) ) ( not ( = ?auto_32841 ?auto_32846 ) ) ( not ( = ?auto_32853 ?auto_32846 ) ) ( not ( = ?auto_32845 ?auto_32846 ) ) ( not ( = ?auto_32859 ?auto_32846 ) ) ( not ( = ?auto_32864 ?auto_32846 ) ) ( not ( = ?auto_32861 ?auto_32846 ) ) ( not ( = ?auto_32862 ?auto_32846 ) ) ( not ( = ?auto_32844 ?auto_32846 ) ) ( not ( = ?auto_32851 ?auto_32846 ) ) ( not ( = ?auto_32855 ?auto_32846 ) ) ( not ( = ?auto_32856 ?auto_32847 ) ) ( not ( = ?auto_32849 ?auto_32856 ) ) ( not ( = ?auto_32850 ?auto_32856 ) ) ( not ( = ?auto_32860 ?auto_32856 ) ) ( not ( = ?auto_32867 ?auto_32856 ) ) ( HOIST-AT ?auto_32852 ?auto_32856 ) ( not ( = ?auto_32848 ?auto_32852 ) ) ( not ( = ?auto_32866 ?auto_32852 ) ) ( not ( = ?auto_32858 ?auto_32852 ) ) ( not ( = ?auto_32868 ?auto_32852 ) ) ( not ( = ?auto_32842 ?auto_32852 ) ) ( AVAILABLE ?auto_32852 ) ( SURFACE-AT ?auto_32851 ?auto_32856 ) ( ON ?auto_32851 ?auto_32865 ) ( CLEAR ?auto_32851 ) ( not ( = ?auto_32840 ?auto_32865 ) ) ( not ( = ?auto_32841 ?auto_32865 ) ) ( not ( = ?auto_32853 ?auto_32865 ) ) ( not ( = ?auto_32845 ?auto_32865 ) ) ( not ( = ?auto_32859 ?auto_32865 ) ) ( not ( = ?auto_32864 ?auto_32865 ) ) ( not ( = ?auto_32861 ?auto_32865 ) ) ( not ( = ?auto_32862 ?auto_32865 ) ) ( not ( = ?auto_32844 ?auto_32865 ) ) ( not ( = ?auto_32851 ?auto_32865 ) ) ( not ( = ?auto_32855 ?auto_32865 ) ) ( not ( = ?auto_32846 ?auto_32865 ) ) ( IS-CRATE ?auto_32846 ) ( not ( = ?auto_32840 ?auto_32869 ) ) ( not ( = ?auto_32841 ?auto_32869 ) ) ( not ( = ?auto_32853 ?auto_32869 ) ) ( not ( = ?auto_32845 ?auto_32869 ) ) ( not ( = ?auto_32859 ?auto_32869 ) ) ( not ( = ?auto_32864 ?auto_32869 ) ) ( not ( = ?auto_32861 ?auto_32869 ) ) ( not ( = ?auto_32862 ?auto_32869 ) ) ( not ( = ?auto_32844 ?auto_32869 ) ) ( not ( = ?auto_32851 ?auto_32869 ) ) ( not ( = ?auto_32855 ?auto_32869 ) ) ( not ( = ?auto_32846 ?auto_32869 ) ) ( not ( = ?auto_32865 ?auto_32869 ) ) ( AVAILABLE ?auto_32842 ) ( SURFACE-AT ?auto_32846 ?auto_32867 ) ( ON ?auto_32846 ?auto_32863 ) ( CLEAR ?auto_32846 ) ( not ( = ?auto_32840 ?auto_32863 ) ) ( not ( = ?auto_32841 ?auto_32863 ) ) ( not ( = ?auto_32853 ?auto_32863 ) ) ( not ( = ?auto_32845 ?auto_32863 ) ) ( not ( = ?auto_32859 ?auto_32863 ) ) ( not ( = ?auto_32864 ?auto_32863 ) ) ( not ( = ?auto_32861 ?auto_32863 ) ) ( not ( = ?auto_32862 ?auto_32863 ) ) ( not ( = ?auto_32844 ?auto_32863 ) ) ( not ( = ?auto_32851 ?auto_32863 ) ) ( not ( = ?auto_32855 ?auto_32863 ) ) ( not ( = ?auto_32846 ?auto_32863 ) ) ( not ( = ?auto_32865 ?auto_32863 ) ) ( not ( = ?auto_32869 ?auto_32863 ) ) ( SURFACE-AT ?auto_32843 ?auto_32847 ) ( CLEAR ?auto_32843 ) ( IS-CRATE ?auto_32869 ) ( not ( = ?auto_32840 ?auto_32843 ) ) ( not ( = ?auto_32841 ?auto_32843 ) ) ( not ( = ?auto_32853 ?auto_32843 ) ) ( not ( = ?auto_32845 ?auto_32843 ) ) ( not ( = ?auto_32859 ?auto_32843 ) ) ( not ( = ?auto_32864 ?auto_32843 ) ) ( not ( = ?auto_32861 ?auto_32843 ) ) ( not ( = ?auto_32862 ?auto_32843 ) ) ( not ( = ?auto_32844 ?auto_32843 ) ) ( not ( = ?auto_32851 ?auto_32843 ) ) ( not ( = ?auto_32855 ?auto_32843 ) ) ( not ( = ?auto_32846 ?auto_32843 ) ) ( not ( = ?auto_32865 ?auto_32843 ) ) ( not ( = ?auto_32869 ?auto_32843 ) ) ( not ( = ?auto_32863 ?auto_32843 ) ) ( AVAILABLE ?auto_32848 ) ( TRUCK-AT ?auto_32857 ?auto_32854 ) ( not ( = ?auto_32854 ?auto_32847 ) ) ( not ( = ?auto_32849 ?auto_32854 ) ) ( not ( = ?auto_32850 ?auto_32854 ) ) ( not ( = ?auto_32860 ?auto_32854 ) ) ( not ( = ?auto_32867 ?auto_32854 ) ) ( not ( = ?auto_32856 ?auto_32854 ) ) ( HOIST-AT ?auto_32870 ?auto_32854 ) ( not ( = ?auto_32848 ?auto_32870 ) ) ( not ( = ?auto_32866 ?auto_32870 ) ) ( not ( = ?auto_32858 ?auto_32870 ) ) ( not ( = ?auto_32868 ?auto_32870 ) ) ( not ( = ?auto_32842 ?auto_32870 ) ) ( not ( = ?auto_32852 ?auto_32870 ) ) ( AVAILABLE ?auto_32870 ) ( SURFACE-AT ?auto_32869 ?auto_32854 ) ( ON ?auto_32869 ?auto_32871 ) ( CLEAR ?auto_32869 ) ( not ( = ?auto_32840 ?auto_32871 ) ) ( not ( = ?auto_32841 ?auto_32871 ) ) ( not ( = ?auto_32853 ?auto_32871 ) ) ( not ( = ?auto_32845 ?auto_32871 ) ) ( not ( = ?auto_32859 ?auto_32871 ) ) ( not ( = ?auto_32864 ?auto_32871 ) ) ( not ( = ?auto_32861 ?auto_32871 ) ) ( not ( = ?auto_32862 ?auto_32871 ) ) ( not ( = ?auto_32844 ?auto_32871 ) ) ( not ( = ?auto_32851 ?auto_32871 ) ) ( not ( = ?auto_32855 ?auto_32871 ) ) ( not ( = ?auto_32846 ?auto_32871 ) ) ( not ( = ?auto_32865 ?auto_32871 ) ) ( not ( = ?auto_32869 ?auto_32871 ) ) ( not ( = ?auto_32863 ?auto_32871 ) ) ( not ( = ?auto_32843 ?auto_32871 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32870 ?auto_32869 ?auto_32871 ?auto_32854 )
      ( MAKE-ON ?auto_32840 ?auto_32841 )
      ( MAKE-ON-VERIFY ?auto_32840 ?auto_32841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32872 - SURFACE
      ?auto_32873 - SURFACE
    )
    :vars
    (
      ?auto_32899 - HOIST
      ?auto_32896 - PLACE
      ?auto_32901 - PLACE
      ?auto_32878 - HOIST
      ?auto_32902 - SURFACE
      ?auto_32894 - SURFACE
      ?auto_32875 - PLACE
      ?auto_32883 - HOIST
      ?auto_32884 - SURFACE
      ?auto_32889 - SURFACE
      ?auto_32886 - SURFACE
      ?auto_32887 - SURFACE
      ?auto_32885 - PLACE
      ?auto_32879 - HOIST
      ?auto_32893 - SURFACE
      ?auto_32874 - SURFACE
      ?auto_32877 - PLACE
      ?auto_32891 - HOIST
      ?auto_32903 - SURFACE
      ?auto_32895 - SURFACE
      ?auto_32898 - PLACE
      ?auto_32897 - HOIST
      ?auto_32882 - SURFACE
      ?auto_32880 - SURFACE
      ?auto_32888 - SURFACE
      ?auto_32892 - SURFACE
      ?auto_32876 - PLACE
      ?auto_32881 - HOIST
      ?auto_32900 - SURFACE
      ?auto_32890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32899 ?auto_32896 ) ( IS-CRATE ?auto_32872 ) ( not ( = ?auto_32872 ?auto_32873 ) ) ( not ( = ?auto_32901 ?auto_32896 ) ) ( HOIST-AT ?auto_32878 ?auto_32901 ) ( not ( = ?auto_32899 ?auto_32878 ) ) ( AVAILABLE ?auto_32878 ) ( SURFACE-AT ?auto_32872 ?auto_32901 ) ( ON ?auto_32872 ?auto_32902 ) ( CLEAR ?auto_32872 ) ( not ( = ?auto_32872 ?auto_32902 ) ) ( not ( = ?auto_32873 ?auto_32902 ) ) ( IS-CRATE ?auto_32873 ) ( not ( = ?auto_32872 ?auto_32894 ) ) ( not ( = ?auto_32873 ?auto_32894 ) ) ( not ( = ?auto_32902 ?auto_32894 ) ) ( not ( = ?auto_32875 ?auto_32896 ) ) ( not ( = ?auto_32901 ?auto_32875 ) ) ( HOIST-AT ?auto_32883 ?auto_32875 ) ( not ( = ?auto_32899 ?auto_32883 ) ) ( not ( = ?auto_32878 ?auto_32883 ) ) ( SURFACE-AT ?auto_32873 ?auto_32875 ) ( ON ?auto_32873 ?auto_32884 ) ( CLEAR ?auto_32873 ) ( not ( = ?auto_32872 ?auto_32884 ) ) ( not ( = ?auto_32873 ?auto_32884 ) ) ( not ( = ?auto_32902 ?auto_32884 ) ) ( not ( = ?auto_32894 ?auto_32884 ) ) ( IS-CRATE ?auto_32894 ) ( not ( = ?auto_32872 ?auto_32889 ) ) ( not ( = ?auto_32873 ?auto_32889 ) ) ( not ( = ?auto_32902 ?auto_32889 ) ) ( not ( = ?auto_32894 ?auto_32889 ) ) ( not ( = ?auto_32884 ?auto_32889 ) ) ( AVAILABLE ?auto_32883 ) ( SURFACE-AT ?auto_32894 ?auto_32875 ) ( ON ?auto_32894 ?auto_32886 ) ( CLEAR ?auto_32894 ) ( not ( = ?auto_32872 ?auto_32886 ) ) ( not ( = ?auto_32873 ?auto_32886 ) ) ( not ( = ?auto_32902 ?auto_32886 ) ) ( not ( = ?auto_32894 ?auto_32886 ) ) ( not ( = ?auto_32884 ?auto_32886 ) ) ( not ( = ?auto_32889 ?auto_32886 ) ) ( IS-CRATE ?auto_32889 ) ( not ( = ?auto_32872 ?auto_32887 ) ) ( not ( = ?auto_32873 ?auto_32887 ) ) ( not ( = ?auto_32902 ?auto_32887 ) ) ( not ( = ?auto_32894 ?auto_32887 ) ) ( not ( = ?auto_32884 ?auto_32887 ) ) ( not ( = ?auto_32889 ?auto_32887 ) ) ( not ( = ?auto_32886 ?auto_32887 ) ) ( not ( = ?auto_32885 ?auto_32896 ) ) ( not ( = ?auto_32901 ?auto_32885 ) ) ( not ( = ?auto_32875 ?auto_32885 ) ) ( HOIST-AT ?auto_32879 ?auto_32885 ) ( not ( = ?auto_32899 ?auto_32879 ) ) ( not ( = ?auto_32878 ?auto_32879 ) ) ( not ( = ?auto_32883 ?auto_32879 ) ) ( AVAILABLE ?auto_32879 ) ( SURFACE-AT ?auto_32889 ?auto_32885 ) ( ON ?auto_32889 ?auto_32893 ) ( CLEAR ?auto_32889 ) ( not ( = ?auto_32872 ?auto_32893 ) ) ( not ( = ?auto_32873 ?auto_32893 ) ) ( not ( = ?auto_32902 ?auto_32893 ) ) ( not ( = ?auto_32894 ?auto_32893 ) ) ( not ( = ?auto_32884 ?auto_32893 ) ) ( not ( = ?auto_32889 ?auto_32893 ) ) ( not ( = ?auto_32886 ?auto_32893 ) ) ( not ( = ?auto_32887 ?auto_32893 ) ) ( IS-CRATE ?auto_32887 ) ( not ( = ?auto_32872 ?auto_32874 ) ) ( not ( = ?auto_32873 ?auto_32874 ) ) ( not ( = ?auto_32902 ?auto_32874 ) ) ( not ( = ?auto_32894 ?auto_32874 ) ) ( not ( = ?auto_32884 ?auto_32874 ) ) ( not ( = ?auto_32889 ?auto_32874 ) ) ( not ( = ?auto_32886 ?auto_32874 ) ) ( not ( = ?auto_32887 ?auto_32874 ) ) ( not ( = ?auto_32893 ?auto_32874 ) ) ( not ( = ?auto_32877 ?auto_32896 ) ) ( not ( = ?auto_32901 ?auto_32877 ) ) ( not ( = ?auto_32875 ?auto_32877 ) ) ( not ( = ?auto_32885 ?auto_32877 ) ) ( HOIST-AT ?auto_32891 ?auto_32877 ) ( not ( = ?auto_32899 ?auto_32891 ) ) ( not ( = ?auto_32878 ?auto_32891 ) ) ( not ( = ?auto_32883 ?auto_32891 ) ) ( not ( = ?auto_32879 ?auto_32891 ) ) ( SURFACE-AT ?auto_32887 ?auto_32877 ) ( ON ?auto_32887 ?auto_32903 ) ( CLEAR ?auto_32887 ) ( not ( = ?auto_32872 ?auto_32903 ) ) ( not ( = ?auto_32873 ?auto_32903 ) ) ( not ( = ?auto_32902 ?auto_32903 ) ) ( not ( = ?auto_32894 ?auto_32903 ) ) ( not ( = ?auto_32884 ?auto_32903 ) ) ( not ( = ?auto_32889 ?auto_32903 ) ) ( not ( = ?auto_32886 ?auto_32903 ) ) ( not ( = ?auto_32887 ?auto_32903 ) ) ( not ( = ?auto_32893 ?auto_32903 ) ) ( not ( = ?auto_32874 ?auto_32903 ) ) ( IS-CRATE ?auto_32874 ) ( not ( = ?auto_32872 ?auto_32895 ) ) ( not ( = ?auto_32873 ?auto_32895 ) ) ( not ( = ?auto_32902 ?auto_32895 ) ) ( not ( = ?auto_32894 ?auto_32895 ) ) ( not ( = ?auto_32884 ?auto_32895 ) ) ( not ( = ?auto_32889 ?auto_32895 ) ) ( not ( = ?auto_32886 ?auto_32895 ) ) ( not ( = ?auto_32887 ?auto_32895 ) ) ( not ( = ?auto_32893 ?auto_32895 ) ) ( not ( = ?auto_32874 ?auto_32895 ) ) ( not ( = ?auto_32903 ?auto_32895 ) ) ( not ( = ?auto_32898 ?auto_32896 ) ) ( not ( = ?auto_32901 ?auto_32898 ) ) ( not ( = ?auto_32875 ?auto_32898 ) ) ( not ( = ?auto_32885 ?auto_32898 ) ) ( not ( = ?auto_32877 ?auto_32898 ) ) ( HOIST-AT ?auto_32897 ?auto_32898 ) ( not ( = ?auto_32899 ?auto_32897 ) ) ( not ( = ?auto_32878 ?auto_32897 ) ) ( not ( = ?auto_32883 ?auto_32897 ) ) ( not ( = ?auto_32879 ?auto_32897 ) ) ( not ( = ?auto_32891 ?auto_32897 ) ) ( AVAILABLE ?auto_32897 ) ( SURFACE-AT ?auto_32874 ?auto_32898 ) ( ON ?auto_32874 ?auto_32882 ) ( CLEAR ?auto_32874 ) ( not ( = ?auto_32872 ?auto_32882 ) ) ( not ( = ?auto_32873 ?auto_32882 ) ) ( not ( = ?auto_32902 ?auto_32882 ) ) ( not ( = ?auto_32894 ?auto_32882 ) ) ( not ( = ?auto_32884 ?auto_32882 ) ) ( not ( = ?auto_32889 ?auto_32882 ) ) ( not ( = ?auto_32886 ?auto_32882 ) ) ( not ( = ?auto_32887 ?auto_32882 ) ) ( not ( = ?auto_32893 ?auto_32882 ) ) ( not ( = ?auto_32874 ?auto_32882 ) ) ( not ( = ?auto_32903 ?auto_32882 ) ) ( not ( = ?auto_32895 ?auto_32882 ) ) ( IS-CRATE ?auto_32895 ) ( not ( = ?auto_32872 ?auto_32880 ) ) ( not ( = ?auto_32873 ?auto_32880 ) ) ( not ( = ?auto_32902 ?auto_32880 ) ) ( not ( = ?auto_32894 ?auto_32880 ) ) ( not ( = ?auto_32884 ?auto_32880 ) ) ( not ( = ?auto_32889 ?auto_32880 ) ) ( not ( = ?auto_32886 ?auto_32880 ) ) ( not ( = ?auto_32887 ?auto_32880 ) ) ( not ( = ?auto_32893 ?auto_32880 ) ) ( not ( = ?auto_32874 ?auto_32880 ) ) ( not ( = ?auto_32903 ?auto_32880 ) ) ( not ( = ?auto_32895 ?auto_32880 ) ) ( not ( = ?auto_32882 ?auto_32880 ) ) ( AVAILABLE ?auto_32891 ) ( SURFACE-AT ?auto_32895 ?auto_32877 ) ( ON ?auto_32895 ?auto_32888 ) ( CLEAR ?auto_32895 ) ( not ( = ?auto_32872 ?auto_32888 ) ) ( not ( = ?auto_32873 ?auto_32888 ) ) ( not ( = ?auto_32902 ?auto_32888 ) ) ( not ( = ?auto_32894 ?auto_32888 ) ) ( not ( = ?auto_32884 ?auto_32888 ) ) ( not ( = ?auto_32889 ?auto_32888 ) ) ( not ( = ?auto_32886 ?auto_32888 ) ) ( not ( = ?auto_32887 ?auto_32888 ) ) ( not ( = ?auto_32893 ?auto_32888 ) ) ( not ( = ?auto_32874 ?auto_32888 ) ) ( not ( = ?auto_32903 ?auto_32888 ) ) ( not ( = ?auto_32895 ?auto_32888 ) ) ( not ( = ?auto_32882 ?auto_32888 ) ) ( not ( = ?auto_32880 ?auto_32888 ) ) ( SURFACE-AT ?auto_32892 ?auto_32896 ) ( CLEAR ?auto_32892 ) ( IS-CRATE ?auto_32880 ) ( not ( = ?auto_32872 ?auto_32892 ) ) ( not ( = ?auto_32873 ?auto_32892 ) ) ( not ( = ?auto_32902 ?auto_32892 ) ) ( not ( = ?auto_32894 ?auto_32892 ) ) ( not ( = ?auto_32884 ?auto_32892 ) ) ( not ( = ?auto_32889 ?auto_32892 ) ) ( not ( = ?auto_32886 ?auto_32892 ) ) ( not ( = ?auto_32887 ?auto_32892 ) ) ( not ( = ?auto_32893 ?auto_32892 ) ) ( not ( = ?auto_32874 ?auto_32892 ) ) ( not ( = ?auto_32903 ?auto_32892 ) ) ( not ( = ?auto_32895 ?auto_32892 ) ) ( not ( = ?auto_32882 ?auto_32892 ) ) ( not ( = ?auto_32880 ?auto_32892 ) ) ( not ( = ?auto_32888 ?auto_32892 ) ) ( AVAILABLE ?auto_32899 ) ( not ( = ?auto_32876 ?auto_32896 ) ) ( not ( = ?auto_32901 ?auto_32876 ) ) ( not ( = ?auto_32875 ?auto_32876 ) ) ( not ( = ?auto_32885 ?auto_32876 ) ) ( not ( = ?auto_32877 ?auto_32876 ) ) ( not ( = ?auto_32898 ?auto_32876 ) ) ( HOIST-AT ?auto_32881 ?auto_32876 ) ( not ( = ?auto_32899 ?auto_32881 ) ) ( not ( = ?auto_32878 ?auto_32881 ) ) ( not ( = ?auto_32883 ?auto_32881 ) ) ( not ( = ?auto_32879 ?auto_32881 ) ) ( not ( = ?auto_32891 ?auto_32881 ) ) ( not ( = ?auto_32897 ?auto_32881 ) ) ( AVAILABLE ?auto_32881 ) ( SURFACE-AT ?auto_32880 ?auto_32876 ) ( ON ?auto_32880 ?auto_32900 ) ( CLEAR ?auto_32880 ) ( not ( = ?auto_32872 ?auto_32900 ) ) ( not ( = ?auto_32873 ?auto_32900 ) ) ( not ( = ?auto_32902 ?auto_32900 ) ) ( not ( = ?auto_32894 ?auto_32900 ) ) ( not ( = ?auto_32884 ?auto_32900 ) ) ( not ( = ?auto_32889 ?auto_32900 ) ) ( not ( = ?auto_32886 ?auto_32900 ) ) ( not ( = ?auto_32887 ?auto_32900 ) ) ( not ( = ?auto_32893 ?auto_32900 ) ) ( not ( = ?auto_32874 ?auto_32900 ) ) ( not ( = ?auto_32903 ?auto_32900 ) ) ( not ( = ?auto_32895 ?auto_32900 ) ) ( not ( = ?auto_32882 ?auto_32900 ) ) ( not ( = ?auto_32880 ?auto_32900 ) ) ( not ( = ?auto_32888 ?auto_32900 ) ) ( not ( = ?auto_32892 ?auto_32900 ) ) ( TRUCK-AT ?auto_32890 ?auto_32896 ) )
    :subtasks
    ( ( !DRIVE ?auto_32890 ?auto_32896 ?auto_32876 )
      ( MAKE-ON ?auto_32872 ?auto_32873 )
      ( MAKE-ON-VERIFY ?auto_32872 ?auto_32873 ) )
  )

)

