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
      ?auto_42753 - SURFACE
      ?auto_42754 - SURFACE
    )
    :vars
    (
      ?auto_42755 - HOIST
      ?auto_42756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42755 ?auto_42756 ) ( SURFACE-AT ?auto_42754 ?auto_42756 ) ( CLEAR ?auto_42754 ) ( LIFTING ?auto_42755 ?auto_42753 ) ( IS-CRATE ?auto_42753 ) ( not ( = ?auto_42753 ?auto_42754 ) ) )
    :subtasks
    ( ( !DROP ?auto_42755 ?auto_42753 ?auto_42754 ?auto_42756 )
      ( MAKE-ON-VERIFY ?auto_42753 ?auto_42754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42757 - SURFACE
      ?auto_42758 - SURFACE
    )
    :vars
    (
      ?auto_42760 - HOIST
      ?auto_42759 - PLACE
      ?auto_42761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42760 ?auto_42759 ) ( SURFACE-AT ?auto_42758 ?auto_42759 ) ( CLEAR ?auto_42758 ) ( IS-CRATE ?auto_42757 ) ( not ( = ?auto_42757 ?auto_42758 ) ) ( TRUCK-AT ?auto_42761 ?auto_42759 ) ( AVAILABLE ?auto_42760 ) ( IN ?auto_42757 ?auto_42761 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42760 ?auto_42757 ?auto_42761 ?auto_42759 )
      ( MAKE-ON ?auto_42757 ?auto_42758 )
      ( MAKE-ON-VERIFY ?auto_42757 ?auto_42758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42762 - SURFACE
      ?auto_42763 - SURFACE
    )
    :vars
    (
      ?auto_42766 - HOIST
      ?auto_42764 - PLACE
      ?auto_42765 - TRUCK
      ?auto_42767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42766 ?auto_42764 ) ( SURFACE-AT ?auto_42763 ?auto_42764 ) ( CLEAR ?auto_42763 ) ( IS-CRATE ?auto_42762 ) ( not ( = ?auto_42762 ?auto_42763 ) ) ( AVAILABLE ?auto_42766 ) ( IN ?auto_42762 ?auto_42765 ) ( TRUCK-AT ?auto_42765 ?auto_42767 ) ( not ( = ?auto_42767 ?auto_42764 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_42765 ?auto_42767 ?auto_42764 )
      ( MAKE-ON ?auto_42762 ?auto_42763 )
      ( MAKE-ON-VERIFY ?auto_42762 ?auto_42763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42768 - SURFACE
      ?auto_42769 - SURFACE
    )
    :vars
    (
      ?auto_42771 - HOIST
      ?auto_42773 - PLACE
      ?auto_42770 - TRUCK
      ?auto_42772 - PLACE
      ?auto_42774 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42771 ?auto_42773 ) ( SURFACE-AT ?auto_42769 ?auto_42773 ) ( CLEAR ?auto_42769 ) ( IS-CRATE ?auto_42768 ) ( not ( = ?auto_42768 ?auto_42769 ) ) ( AVAILABLE ?auto_42771 ) ( TRUCK-AT ?auto_42770 ?auto_42772 ) ( not ( = ?auto_42772 ?auto_42773 ) ) ( HOIST-AT ?auto_42774 ?auto_42772 ) ( LIFTING ?auto_42774 ?auto_42768 ) ( not ( = ?auto_42771 ?auto_42774 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42774 ?auto_42768 ?auto_42770 ?auto_42772 )
      ( MAKE-ON ?auto_42768 ?auto_42769 )
      ( MAKE-ON-VERIFY ?auto_42768 ?auto_42769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42775 - SURFACE
      ?auto_42776 - SURFACE
    )
    :vars
    (
      ?auto_42781 - HOIST
      ?auto_42779 - PLACE
      ?auto_42780 - TRUCK
      ?auto_42777 - PLACE
      ?auto_42778 - HOIST
      ?auto_42782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42781 ?auto_42779 ) ( SURFACE-AT ?auto_42776 ?auto_42779 ) ( CLEAR ?auto_42776 ) ( IS-CRATE ?auto_42775 ) ( not ( = ?auto_42775 ?auto_42776 ) ) ( AVAILABLE ?auto_42781 ) ( TRUCK-AT ?auto_42780 ?auto_42777 ) ( not ( = ?auto_42777 ?auto_42779 ) ) ( HOIST-AT ?auto_42778 ?auto_42777 ) ( not ( = ?auto_42781 ?auto_42778 ) ) ( AVAILABLE ?auto_42778 ) ( SURFACE-AT ?auto_42775 ?auto_42777 ) ( ON ?auto_42775 ?auto_42782 ) ( CLEAR ?auto_42775 ) ( not ( = ?auto_42775 ?auto_42782 ) ) ( not ( = ?auto_42776 ?auto_42782 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42778 ?auto_42775 ?auto_42782 ?auto_42777 )
      ( MAKE-ON ?auto_42775 ?auto_42776 )
      ( MAKE-ON-VERIFY ?auto_42775 ?auto_42776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42783 - SURFACE
      ?auto_42784 - SURFACE
    )
    :vars
    (
      ?auto_42788 - HOIST
      ?auto_42785 - PLACE
      ?auto_42786 - PLACE
      ?auto_42790 - HOIST
      ?auto_42787 - SURFACE
      ?auto_42789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42788 ?auto_42785 ) ( SURFACE-AT ?auto_42784 ?auto_42785 ) ( CLEAR ?auto_42784 ) ( IS-CRATE ?auto_42783 ) ( not ( = ?auto_42783 ?auto_42784 ) ) ( AVAILABLE ?auto_42788 ) ( not ( = ?auto_42786 ?auto_42785 ) ) ( HOIST-AT ?auto_42790 ?auto_42786 ) ( not ( = ?auto_42788 ?auto_42790 ) ) ( AVAILABLE ?auto_42790 ) ( SURFACE-AT ?auto_42783 ?auto_42786 ) ( ON ?auto_42783 ?auto_42787 ) ( CLEAR ?auto_42783 ) ( not ( = ?auto_42783 ?auto_42787 ) ) ( not ( = ?auto_42784 ?auto_42787 ) ) ( TRUCK-AT ?auto_42789 ?auto_42785 ) )
    :subtasks
    ( ( !DRIVE ?auto_42789 ?auto_42785 ?auto_42786 )
      ( MAKE-ON ?auto_42783 ?auto_42784 )
      ( MAKE-ON-VERIFY ?auto_42783 ?auto_42784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42793 - SURFACE
      ?auto_42794 - SURFACE
    )
    :vars
    (
      ?auto_42795 - HOIST
      ?auto_42796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42795 ?auto_42796 ) ( SURFACE-AT ?auto_42794 ?auto_42796 ) ( CLEAR ?auto_42794 ) ( LIFTING ?auto_42795 ?auto_42793 ) ( IS-CRATE ?auto_42793 ) ( not ( = ?auto_42793 ?auto_42794 ) ) )
    :subtasks
    ( ( !DROP ?auto_42795 ?auto_42793 ?auto_42794 ?auto_42796 )
      ( MAKE-ON-VERIFY ?auto_42793 ?auto_42794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42797 - SURFACE
      ?auto_42798 - SURFACE
    )
    :vars
    (
      ?auto_42799 - HOIST
      ?auto_42800 - PLACE
      ?auto_42801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42799 ?auto_42800 ) ( SURFACE-AT ?auto_42798 ?auto_42800 ) ( CLEAR ?auto_42798 ) ( IS-CRATE ?auto_42797 ) ( not ( = ?auto_42797 ?auto_42798 ) ) ( TRUCK-AT ?auto_42801 ?auto_42800 ) ( AVAILABLE ?auto_42799 ) ( IN ?auto_42797 ?auto_42801 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42799 ?auto_42797 ?auto_42801 ?auto_42800 )
      ( MAKE-ON ?auto_42797 ?auto_42798 )
      ( MAKE-ON-VERIFY ?auto_42797 ?auto_42798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42802 - SURFACE
      ?auto_42803 - SURFACE
    )
    :vars
    (
      ?auto_42805 - HOIST
      ?auto_42804 - PLACE
      ?auto_42806 - TRUCK
      ?auto_42807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42805 ?auto_42804 ) ( SURFACE-AT ?auto_42803 ?auto_42804 ) ( CLEAR ?auto_42803 ) ( IS-CRATE ?auto_42802 ) ( not ( = ?auto_42802 ?auto_42803 ) ) ( AVAILABLE ?auto_42805 ) ( IN ?auto_42802 ?auto_42806 ) ( TRUCK-AT ?auto_42806 ?auto_42807 ) ( not ( = ?auto_42807 ?auto_42804 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_42806 ?auto_42807 ?auto_42804 )
      ( MAKE-ON ?auto_42802 ?auto_42803 )
      ( MAKE-ON-VERIFY ?auto_42802 ?auto_42803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42808 - SURFACE
      ?auto_42809 - SURFACE
    )
    :vars
    (
      ?auto_42812 - HOIST
      ?auto_42811 - PLACE
      ?auto_42810 - TRUCK
      ?auto_42813 - PLACE
      ?auto_42814 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42812 ?auto_42811 ) ( SURFACE-AT ?auto_42809 ?auto_42811 ) ( CLEAR ?auto_42809 ) ( IS-CRATE ?auto_42808 ) ( not ( = ?auto_42808 ?auto_42809 ) ) ( AVAILABLE ?auto_42812 ) ( TRUCK-AT ?auto_42810 ?auto_42813 ) ( not ( = ?auto_42813 ?auto_42811 ) ) ( HOIST-AT ?auto_42814 ?auto_42813 ) ( LIFTING ?auto_42814 ?auto_42808 ) ( not ( = ?auto_42812 ?auto_42814 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42814 ?auto_42808 ?auto_42810 ?auto_42813 )
      ( MAKE-ON ?auto_42808 ?auto_42809 )
      ( MAKE-ON-VERIFY ?auto_42808 ?auto_42809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42815 - SURFACE
      ?auto_42816 - SURFACE
    )
    :vars
    (
      ?auto_42820 - HOIST
      ?auto_42817 - PLACE
      ?auto_42819 - TRUCK
      ?auto_42821 - PLACE
      ?auto_42818 - HOIST
      ?auto_42822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42820 ?auto_42817 ) ( SURFACE-AT ?auto_42816 ?auto_42817 ) ( CLEAR ?auto_42816 ) ( IS-CRATE ?auto_42815 ) ( not ( = ?auto_42815 ?auto_42816 ) ) ( AVAILABLE ?auto_42820 ) ( TRUCK-AT ?auto_42819 ?auto_42821 ) ( not ( = ?auto_42821 ?auto_42817 ) ) ( HOIST-AT ?auto_42818 ?auto_42821 ) ( not ( = ?auto_42820 ?auto_42818 ) ) ( AVAILABLE ?auto_42818 ) ( SURFACE-AT ?auto_42815 ?auto_42821 ) ( ON ?auto_42815 ?auto_42822 ) ( CLEAR ?auto_42815 ) ( not ( = ?auto_42815 ?auto_42822 ) ) ( not ( = ?auto_42816 ?auto_42822 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42818 ?auto_42815 ?auto_42822 ?auto_42821 )
      ( MAKE-ON ?auto_42815 ?auto_42816 )
      ( MAKE-ON-VERIFY ?auto_42815 ?auto_42816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42823 - SURFACE
      ?auto_42824 - SURFACE
    )
    :vars
    (
      ?auto_42825 - HOIST
      ?auto_42829 - PLACE
      ?auto_42826 - PLACE
      ?auto_42827 - HOIST
      ?auto_42828 - SURFACE
      ?auto_42830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42825 ?auto_42829 ) ( SURFACE-AT ?auto_42824 ?auto_42829 ) ( CLEAR ?auto_42824 ) ( IS-CRATE ?auto_42823 ) ( not ( = ?auto_42823 ?auto_42824 ) ) ( AVAILABLE ?auto_42825 ) ( not ( = ?auto_42826 ?auto_42829 ) ) ( HOIST-AT ?auto_42827 ?auto_42826 ) ( not ( = ?auto_42825 ?auto_42827 ) ) ( AVAILABLE ?auto_42827 ) ( SURFACE-AT ?auto_42823 ?auto_42826 ) ( ON ?auto_42823 ?auto_42828 ) ( CLEAR ?auto_42823 ) ( not ( = ?auto_42823 ?auto_42828 ) ) ( not ( = ?auto_42824 ?auto_42828 ) ) ( TRUCK-AT ?auto_42830 ?auto_42829 ) )
    :subtasks
    ( ( !DRIVE ?auto_42830 ?auto_42829 ?auto_42826 )
      ( MAKE-ON ?auto_42823 ?auto_42824 )
      ( MAKE-ON-VERIFY ?auto_42823 ?auto_42824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42831 - SURFACE
      ?auto_42832 - SURFACE
    )
    :vars
    (
      ?auto_42836 - HOIST
      ?auto_42838 - PLACE
      ?auto_42835 - PLACE
      ?auto_42833 - HOIST
      ?auto_42834 - SURFACE
      ?auto_42837 - TRUCK
      ?auto_42839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42836 ?auto_42838 ) ( IS-CRATE ?auto_42831 ) ( not ( = ?auto_42831 ?auto_42832 ) ) ( not ( = ?auto_42835 ?auto_42838 ) ) ( HOIST-AT ?auto_42833 ?auto_42835 ) ( not ( = ?auto_42836 ?auto_42833 ) ) ( AVAILABLE ?auto_42833 ) ( SURFACE-AT ?auto_42831 ?auto_42835 ) ( ON ?auto_42831 ?auto_42834 ) ( CLEAR ?auto_42831 ) ( not ( = ?auto_42831 ?auto_42834 ) ) ( not ( = ?auto_42832 ?auto_42834 ) ) ( TRUCK-AT ?auto_42837 ?auto_42838 ) ( SURFACE-AT ?auto_42839 ?auto_42838 ) ( CLEAR ?auto_42839 ) ( LIFTING ?auto_42836 ?auto_42832 ) ( IS-CRATE ?auto_42832 ) ( not ( = ?auto_42831 ?auto_42839 ) ) ( not ( = ?auto_42832 ?auto_42839 ) ) ( not ( = ?auto_42834 ?auto_42839 ) ) )
    :subtasks
    ( ( !DROP ?auto_42836 ?auto_42832 ?auto_42839 ?auto_42838 )
      ( MAKE-ON ?auto_42831 ?auto_42832 )
      ( MAKE-ON-VERIFY ?auto_42831 ?auto_42832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42840 - SURFACE
      ?auto_42841 - SURFACE
    )
    :vars
    (
      ?auto_42847 - HOIST
      ?auto_42844 - PLACE
      ?auto_42843 - PLACE
      ?auto_42842 - HOIST
      ?auto_42846 - SURFACE
      ?auto_42848 - TRUCK
      ?auto_42845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42847 ?auto_42844 ) ( IS-CRATE ?auto_42840 ) ( not ( = ?auto_42840 ?auto_42841 ) ) ( not ( = ?auto_42843 ?auto_42844 ) ) ( HOIST-AT ?auto_42842 ?auto_42843 ) ( not ( = ?auto_42847 ?auto_42842 ) ) ( AVAILABLE ?auto_42842 ) ( SURFACE-AT ?auto_42840 ?auto_42843 ) ( ON ?auto_42840 ?auto_42846 ) ( CLEAR ?auto_42840 ) ( not ( = ?auto_42840 ?auto_42846 ) ) ( not ( = ?auto_42841 ?auto_42846 ) ) ( TRUCK-AT ?auto_42848 ?auto_42844 ) ( SURFACE-AT ?auto_42845 ?auto_42844 ) ( CLEAR ?auto_42845 ) ( IS-CRATE ?auto_42841 ) ( not ( = ?auto_42840 ?auto_42845 ) ) ( not ( = ?auto_42841 ?auto_42845 ) ) ( not ( = ?auto_42846 ?auto_42845 ) ) ( AVAILABLE ?auto_42847 ) ( IN ?auto_42841 ?auto_42848 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42847 ?auto_42841 ?auto_42848 ?auto_42844 )
      ( MAKE-ON ?auto_42840 ?auto_42841 )
      ( MAKE-ON-VERIFY ?auto_42840 ?auto_42841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42849 - SURFACE
      ?auto_42850 - SURFACE
    )
    :vars
    (
      ?auto_42855 - HOIST
      ?auto_42852 - PLACE
      ?auto_42854 - PLACE
      ?auto_42856 - HOIST
      ?auto_42853 - SURFACE
      ?auto_42857 - SURFACE
      ?auto_42851 - TRUCK
      ?auto_42858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42855 ?auto_42852 ) ( IS-CRATE ?auto_42849 ) ( not ( = ?auto_42849 ?auto_42850 ) ) ( not ( = ?auto_42854 ?auto_42852 ) ) ( HOIST-AT ?auto_42856 ?auto_42854 ) ( not ( = ?auto_42855 ?auto_42856 ) ) ( AVAILABLE ?auto_42856 ) ( SURFACE-AT ?auto_42849 ?auto_42854 ) ( ON ?auto_42849 ?auto_42853 ) ( CLEAR ?auto_42849 ) ( not ( = ?auto_42849 ?auto_42853 ) ) ( not ( = ?auto_42850 ?auto_42853 ) ) ( SURFACE-AT ?auto_42857 ?auto_42852 ) ( CLEAR ?auto_42857 ) ( IS-CRATE ?auto_42850 ) ( not ( = ?auto_42849 ?auto_42857 ) ) ( not ( = ?auto_42850 ?auto_42857 ) ) ( not ( = ?auto_42853 ?auto_42857 ) ) ( AVAILABLE ?auto_42855 ) ( IN ?auto_42850 ?auto_42851 ) ( TRUCK-AT ?auto_42851 ?auto_42858 ) ( not ( = ?auto_42858 ?auto_42852 ) ) ( not ( = ?auto_42854 ?auto_42858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_42851 ?auto_42858 ?auto_42852 )
      ( MAKE-ON ?auto_42849 ?auto_42850 )
      ( MAKE-ON-VERIFY ?auto_42849 ?auto_42850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42859 - SURFACE
      ?auto_42860 - SURFACE
    )
    :vars
    (
      ?auto_42862 - HOIST
      ?auto_42865 - PLACE
      ?auto_42868 - PLACE
      ?auto_42863 - HOIST
      ?auto_42861 - SURFACE
      ?auto_42864 - SURFACE
      ?auto_42866 - TRUCK
      ?auto_42867 - PLACE
      ?auto_42869 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42862 ?auto_42865 ) ( IS-CRATE ?auto_42859 ) ( not ( = ?auto_42859 ?auto_42860 ) ) ( not ( = ?auto_42868 ?auto_42865 ) ) ( HOIST-AT ?auto_42863 ?auto_42868 ) ( not ( = ?auto_42862 ?auto_42863 ) ) ( AVAILABLE ?auto_42863 ) ( SURFACE-AT ?auto_42859 ?auto_42868 ) ( ON ?auto_42859 ?auto_42861 ) ( CLEAR ?auto_42859 ) ( not ( = ?auto_42859 ?auto_42861 ) ) ( not ( = ?auto_42860 ?auto_42861 ) ) ( SURFACE-AT ?auto_42864 ?auto_42865 ) ( CLEAR ?auto_42864 ) ( IS-CRATE ?auto_42860 ) ( not ( = ?auto_42859 ?auto_42864 ) ) ( not ( = ?auto_42860 ?auto_42864 ) ) ( not ( = ?auto_42861 ?auto_42864 ) ) ( AVAILABLE ?auto_42862 ) ( TRUCK-AT ?auto_42866 ?auto_42867 ) ( not ( = ?auto_42867 ?auto_42865 ) ) ( not ( = ?auto_42868 ?auto_42867 ) ) ( HOIST-AT ?auto_42869 ?auto_42867 ) ( LIFTING ?auto_42869 ?auto_42860 ) ( not ( = ?auto_42862 ?auto_42869 ) ) ( not ( = ?auto_42863 ?auto_42869 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42869 ?auto_42860 ?auto_42866 ?auto_42867 )
      ( MAKE-ON ?auto_42859 ?auto_42860 )
      ( MAKE-ON-VERIFY ?auto_42859 ?auto_42860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42870 - SURFACE
      ?auto_42871 - SURFACE
    )
    :vars
    (
      ?auto_42875 - HOIST
      ?auto_42874 - PLACE
      ?auto_42876 - PLACE
      ?auto_42880 - HOIST
      ?auto_42879 - SURFACE
      ?auto_42877 - SURFACE
      ?auto_42878 - TRUCK
      ?auto_42872 - PLACE
      ?auto_42873 - HOIST
      ?auto_42881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42875 ?auto_42874 ) ( IS-CRATE ?auto_42870 ) ( not ( = ?auto_42870 ?auto_42871 ) ) ( not ( = ?auto_42876 ?auto_42874 ) ) ( HOIST-AT ?auto_42880 ?auto_42876 ) ( not ( = ?auto_42875 ?auto_42880 ) ) ( AVAILABLE ?auto_42880 ) ( SURFACE-AT ?auto_42870 ?auto_42876 ) ( ON ?auto_42870 ?auto_42879 ) ( CLEAR ?auto_42870 ) ( not ( = ?auto_42870 ?auto_42879 ) ) ( not ( = ?auto_42871 ?auto_42879 ) ) ( SURFACE-AT ?auto_42877 ?auto_42874 ) ( CLEAR ?auto_42877 ) ( IS-CRATE ?auto_42871 ) ( not ( = ?auto_42870 ?auto_42877 ) ) ( not ( = ?auto_42871 ?auto_42877 ) ) ( not ( = ?auto_42879 ?auto_42877 ) ) ( AVAILABLE ?auto_42875 ) ( TRUCK-AT ?auto_42878 ?auto_42872 ) ( not ( = ?auto_42872 ?auto_42874 ) ) ( not ( = ?auto_42876 ?auto_42872 ) ) ( HOIST-AT ?auto_42873 ?auto_42872 ) ( not ( = ?auto_42875 ?auto_42873 ) ) ( not ( = ?auto_42880 ?auto_42873 ) ) ( AVAILABLE ?auto_42873 ) ( SURFACE-AT ?auto_42871 ?auto_42872 ) ( ON ?auto_42871 ?auto_42881 ) ( CLEAR ?auto_42871 ) ( not ( = ?auto_42870 ?auto_42881 ) ) ( not ( = ?auto_42871 ?auto_42881 ) ) ( not ( = ?auto_42879 ?auto_42881 ) ) ( not ( = ?auto_42877 ?auto_42881 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42873 ?auto_42871 ?auto_42881 ?auto_42872 )
      ( MAKE-ON ?auto_42870 ?auto_42871 )
      ( MAKE-ON-VERIFY ?auto_42870 ?auto_42871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42882 - SURFACE
      ?auto_42883 - SURFACE
    )
    :vars
    (
      ?auto_42887 - HOIST
      ?auto_42884 - PLACE
      ?auto_42891 - PLACE
      ?auto_42889 - HOIST
      ?auto_42885 - SURFACE
      ?auto_42890 - SURFACE
      ?auto_42888 - PLACE
      ?auto_42886 - HOIST
      ?auto_42893 - SURFACE
      ?auto_42892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42887 ?auto_42884 ) ( IS-CRATE ?auto_42882 ) ( not ( = ?auto_42882 ?auto_42883 ) ) ( not ( = ?auto_42891 ?auto_42884 ) ) ( HOIST-AT ?auto_42889 ?auto_42891 ) ( not ( = ?auto_42887 ?auto_42889 ) ) ( AVAILABLE ?auto_42889 ) ( SURFACE-AT ?auto_42882 ?auto_42891 ) ( ON ?auto_42882 ?auto_42885 ) ( CLEAR ?auto_42882 ) ( not ( = ?auto_42882 ?auto_42885 ) ) ( not ( = ?auto_42883 ?auto_42885 ) ) ( SURFACE-AT ?auto_42890 ?auto_42884 ) ( CLEAR ?auto_42890 ) ( IS-CRATE ?auto_42883 ) ( not ( = ?auto_42882 ?auto_42890 ) ) ( not ( = ?auto_42883 ?auto_42890 ) ) ( not ( = ?auto_42885 ?auto_42890 ) ) ( AVAILABLE ?auto_42887 ) ( not ( = ?auto_42888 ?auto_42884 ) ) ( not ( = ?auto_42891 ?auto_42888 ) ) ( HOIST-AT ?auto_42886 ?auto_42888 ) ( not ( = ?auto_42887 ?auto_42886 ) ) ( not ( = ?auto_42889 ?auto_42886 ) ) ( AVAILABLE ?auto_42886 ) ( SURFACE-AT ?auto_42883 ?auto_42888 ) ( ON ?auto_42883 ?auto_42893 ) ( CLEAR ?auto_42883 ) ( not ( = ?auto_42882 ?auto_42893 ) ) ( not ( = ?auto_42883 ?auto_42893 ) ) ( not ( = ?auto_42885 ?auto_42893 ) ) ( not ( = ?auto_42890 ?auto_42893 ) ) ( TRUCK-AT ?auto_42892 ?auto_42884 ) )
    :subtasks
    ( ( !DRIVE ?auto_42892 ?auto_42884 ?auto_42888 )
      ( MAKE-ON ?auto_42882 ?auto_42883 )
      ( MAKE-ON-VERIFY ?auto_42882 ?auto_42883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42896 - SURFACE
      ?auto_42897 - SURFACE
    )
    :vars
    (
      ?auto_42898 - HOIST
      ?auto_42899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42898 ?auto_42899 ) ( SURFACE-AT ?auto_42897 ?auto_42899 ) ( CLEAR ?auto_42897 ) ( LIFTING ?auto_42898 ?auto_42896 ) ( IS-CRATE ?auto_42896 ) ( not ( = ?auto_42896 ?auto_42897 ) ) )
    :subtasks
    ( ( !DROP ?auto_42898 ?auto_42896 ?auto_42897 ?auto_42899 )
      ( MAKE-ON-VERIFY ?auto_42896 ?auto_42897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42900 - SURFACE
      ?auto_42901 - SURFACE
    )
    :vars
    (
      ?auto_42902 - HOIST
      ?auto_42903 - PLACE
      ?auto_42904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42902 ?auto_42903 ) ( SURFACE-AT ?auto_42901 ?auto_42903 ) ( CLEAR ?auto_42901 ) ( IS-CRATE ?auto_42900 ) ( not ( = ?auto_42900 ?auto_42901 ) ) ( TRUCK-AT ?auto_42904 ?auto_42903 ) ( AVAILABLE ?auto_42902 ) ( IN ?auto_42900 ?auto_42904 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42902 ?auto_42900 ?auto_42904 ?auto_42903 )
      ( MAKE-ON ?auto_42900 ?auto_42901 )
      ( MAKE-ON-VERIFY ?auto_42900 ?auto_42901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42905 - SURFACE
      ?auto_42906 - SURFACE
    )
    :vars
    (
      ?auto_42909 - HOIST
      ?auto_42907 - PLACE
      ?auto_42908 - TRUCK
      ?auto_42910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42909 ?auto_42907 ) ( SURFACE-AT ?auto_42906 ?auto_42907 ) ( CLEAR ?auto_42906 ) ( IS-CRATE ?auto_42905 ) ( not ( = ?auto_42905 ?auto_42906 ) ) ( AVAILABLE ?auto_42909 ) ( IN ?auto_42905 ?auto_42908 ) ( TRUCK-AT ?auto_42908 ?auto_42910 ) ( not ( = ?auto_42910 ?auto_42907 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_42908 ?auto_42910 ?auto_42907 )
      ( MAKE-ON ?auto_42905 ?auto_42906 )
      ( MAKE-ON-VERIFY ?auto_42905 ?auto_42906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42911 - SURFACE
      ?auto_42912 - SURFACE
    )
    :vars
    (
      ?auto_42913 - HOIST
      ?auto_42915 - PLACE
      ?auto_42914 - TRUCK
      ?auto_42916 - PLACE
      ?auto_42917 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_42913 ?auto_42915 ) ( SURFACE-AT ?auto_42912 ?auto_42915 ) ( CLEAR ?auto_42912 ) ( IS-CRATE ?auto_42911 ) ( not ( = ?auto_42911 ?auto_42912 ) ) ( AVAILABLE ?auto_42913 ) ( TRUCK-AT ?auto_42914 ?auto_42916 ) ( not ( = ?auto_42916 ?auto_42915 ) ) ( HOIST-AT ?auto_42917 ?auto_42916 ) ( LIFTING ?auto_42917 ?auto_42911 ) ( not ( = ?auto_42913 ?auto_42917 ) ) )
    :subtasks
    ( ( !LOAD ?auto_42917 ?auto_42911 ?auto_42914 ?auto_42916 )
      ( MAKE-ON ?auto_42911 ?auto_42912 )
      ( MAKE-ON-VERIFY ?auto_42911 ?auto_42912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42918 - SURFACE
      ?auto_42919 - SURFACE
    )
    :vars
    (
      ?auto_42921 - HOIST
      ?auto_42920 - PLACE
      ?auto_42922 - TRUCK
      ?auto_42923 - PLACE
      ?auto_42924 - HOIST
      ?auto_42925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42921 ?auto_42920 ) ( SURFACE-AT ?auto_42919 ?auto_42920 ) ( CLEAR ?auto_42919 ) ( IS-CRATE ?auto_42918 ) ( not ( = ?auto_42918 ?auto_42919 ) ) ( AVAILABLE ?auto_42921 ) ( TRUCK-AT ?auto_42922 ?auto_42923 ) ( not ( = ?auto_42923 ?auto_42920 ) ) ( HOIST-AT ?auto_42924 ?auto_42923 ) ( not ( = ?auto_42921 ?auto_42924 ) ) ( AVAILABLE ?auto_42924 ) ( SURFACE-AT ?auto_42918 ?auto_42923 ) ( ON ?auto_42918 ?auto_42925 ) ( CLEAR ?auto_42918 ) ( not ( = ?auto_42918 ?auto_42925 ) ) ( not ( = ?auto_42919 ?auto_42925 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42924 ?auto_42918 ?auto_42925 ?auto_42923 )
      ( MAKE-ON ?auto_42918 ?auto_42919 )
      ( MAKE-ON-VERIFY ?auto_42918 ?auto_42919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42926 - SURFACE
      ?auto_42927 - SURFACE
    )
    :vars
    (
      ?auto_42933 - HOIST
      ?auto_42931 - PLACE
      ?auto_42932 - PLACE
      ?auto_42928 - HOIST
      ?auto_42930 - SURFACE
      ?auto_42929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42933 ?auto_42931 ) ( SURFACE-AT ?auto_42927 ?auto_42931 ) ( CLEAR ?auto_42927 ) ( IS-CRATE ?auto_42926 ) ( not ( = ?auto_42926 ?auto_42927 ) ) ( AVAILABLE ?auto_42933 ) ( not ( = ?auto_42932 ?auto_42931 ) ) ( HOIST-AT ?auto_42928 ?auto_42932 ) ( not ( = ?auto_42933 ?auto_42928 ) ) ( AVAILABLE ?auto_42928 ) ( SURFACE-AT ?auto_42926 ?auto_42932 ) ( ON ?auto_42926 ?auto_42930 ) ( CLEAR ?auto_42926 ) ( not ( = ?auto_42926 ?auto_42930 ) ) ( not ( = ?auto_42927 ?auto_42930 ) ) ( TRUCK-AT ?auto_42929 ?auto_42931 ) )
    :subtasks
    ( ( !DRIVE ?auto_42929 ?auto_42931 ?auto_42932 )
      ( MAKE-ON ?auto_42926 ?auto_42927 )
      ( MAKE-ON-VERIFY ?auto_42926 ?auto_42927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42934 - SURFACE
      ?auto_42935 - SURFACE
    )
    :vars
    (
      ?auto_42940 - HOIST
      ?auto_42938 - PLACE
      ?auto_42939 - PLACE
      ?auto_42941 - HOIST
      ?auto_42936 - SURFACE
      ?auto_42937 - TRUCK
      ?auto_42942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42940 ?auto_42938 ) ( IS-CRATE ?auto_42934 ) ( not ( = ?auto_42934 ?auto_42935 ) ) ( not ( = ?auto_42939 ?auto_42938 ) ) ( HOIST-AT ?auto_42941 ?auto_42939 ) ( not ( = ?auto_42940 ?auto_42941 ) ) ( AVAILABLE ?auto_42941 ) ( SURFACE-AT ?auto_42934 ?auto_42939 ) ( ON ?auto_42934 ?auto_42936 ) ( CLEAR ?auto_42934 ) ( not ( = ?auto_42934 ?auto_42936 ) ) ( not ( = ?auto_42935 ?auto_42936 ) ) ( TRUCK-AT ?auto_42937 ?auto_42938 ) ( SURFACE-AT ?auto_42942 ?auto_42938 ) ( CLEAR ?auto_42942 ) ( LIFTING ?auto_42940 ?auto_42935 ) ( IS-CRATE ?auto_42935 ) ( not ( = ?auto_42934 ?auto_42942 ) ) ( not ( = ?auto_42935 ?auto_42942 ) ) ( not ( = ?auto_42936 ?auto_42942 ) ) )
    :subtasks
    ( ( !DROP ?auto_42940 ?auto_42935 ?auto_42942 ?auto_42938 )
      ( MAKE-ON ?auto_42934 ?auto_42935 )
      ( MAKE-ON-VERIFY ?auto_42934 ?auto_42935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42943 - SURFACE
      ?auto_42944 - SURFACE
    )
    :vars
    (
      ?auto_42951 - HOIST
      ?auto_42945 - PLACE
      ?auto_42949 - PLACE
      ?auto_42946 - HOIST
      ?auto_42947 - SURFACE
      ?auto_42948 - TRUCK
      ?auto_42950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42951 ?auto_42945 ) ( IS-CRATE ?auto_42943 ) ( not ( = ?auto_42943 ?auto_42944 ) ) ( not ( = ?auto_42949 ?auto_42945 ) ) ( HOIST-AT ?auto_42946 ?auto_42949 ) ( not ( = ?auto_42951 ?auto_42946 ) ) ( AVAILABLE ?auto_42946 ) ( SURFACE-AT ?auto_42943 ?auto_42949 ) ( ON ?auto_42943 ?auto_42947 ) ( CLEAR ?auto_42943 ) ( not ( = ?auto_42943 ?auto_42947 ) ) ( not ( = ?auto_42944 ?auto_42947 ) ) ( TRUCK-AT ?auto_42948 ?auto_42945 ) ( SURFACE-AT ?auto_42950 ?auto_42945 ) ( CLEAR ?auto_42950 ) ( IS-CRATE ?auto_42944 ) ( not ( = ?auto_42943 ?auto_42950 ) ) ( not ( = ?auto_42944 ?auto_42950 ) ) ( not ( = ?auto_42947 ?auto_42950 ) ) ( AVAILABLE ?auto_42951 ) ( IN ?auto_42944 ?auto_42948 ) )
    :subtasks
    ( ( !UNLOAD ?auto_42951 ?auto_42944 ?auto_42948 ?auto_42945 )
      ( MAKE-ON ?auto_42943 ?auto_42944 )
      ( MAKE-ON-VERIFY ?auto_42943 ?auto_42944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42952 - SURFACE
      ?auto_42953 - SURFACE
    )
    :vars
    (
      ?auto_42955 - HOIST
      ?auto_42958 - PLACE
      ?auto_42954 - PLACE
      ?auto_42956 - HOIST
      ?auto_42957 - SURFACE
      ?auto_42959 - SURFACE
      ?auto_42960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42955 ?auto_42958 ) ( IS-CRATE ?auto_42952 ) ( not ( = ?auto_42952 ?auto_42953 ) ) ( not ( = ?auto_42954 ?auto_42958 ) ) ( HOIST-AT ?auto_42956 ?auto_42954 ) ( not ( = ?auto_42955 ?auto_42956 ) ) ( AVAILABLE ?auto_42956 ) ( SURFACE-AT ?auto_42952 ?auto_42954 ) ( ON ?auto_42952 ?auto_42957 ) ( CLEAR ?auto_42952 ) ( not ( = ?auto_42952 ?auto_42957 ) ) ( not ( = ?auto_42953 ?auto_42957 ) ) ( SURFACE-AT ?auto_42959 ?auto_42958 ) ( CLEAR ?auto_42959 ) ( IS-CRATE ?auto_42953 ) ( not ( = ?auto_42952 ?auto_42959 ) ) ( not ( = ?auto_42953 ?auto_42959 ) ) ( not ( = ?auto_42957 ?auto_42959 ) ) ( AVAILABLE ?auto_42955 ) ( IN ?auto_42953 ?auto_42960 ) ( TRUCK-AT ?auto_42960 ?auto_42954 ) )
    :subtasks
    ( ( !DRIVE ?auto_42960 ?auto_42954 ?auto_42958 )
      ( MAKE-ON ?auto_42952 ?auto_42953 )
      ( MAKE-ON-VERIFY ?auto_42952 ?auto_42953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42961 - SURFACE
      ?auto_42962 - SURFACE
    )
    :vars
    (
      ?auto_42968 - HOIST
      ?auto_42967 - PLACE
      ?auto_42965 - PLACE
      ?auto_42963 - HOIST
      ?auto_42969 - SURFACE
      ?auto_42964 - SURFACE
      ?auto_42966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42968 ?auto_42967 ) ( IS-CRATE ?auto_42961 ) ( not ( = ?auto_42961 ?auto_42962 ) ) ( not ( = ?auto_42965 ?auto_42967 ) ) ( HOIST-AT ?auto_42963 ?auto_42965 ) ( not ( = ?auto_42968 ?auto_42963 ) ) ( SURFACE-AT ?auto_42961 ?auto_42965 ) ( ON ?auto_42961 ?auto_42969 ) ( CLEAR ?auto_42961 ) ( not ( = ?auto_42961 ?auto_42969 ) ) ( not ( = ?auto_42962 ?auto_42969 ) ) ( SURFACE-AT ?auto_42964 ?auto_42967 ) ( CLEAR ?auto_42964 ) ( IS-CRATE ?auto_42962 ) ( not ( = ?auto_42961 ?auto_42964 ) ) ( not ( = ?auto_42962 ?auto_42964 ) ) ( not ( = ?auto_42969 ?auto_42964 ) ) ( AVAILABLE ?auto_42968 ) ( TRUCK-AT ?auto_42966 ?auto_42965 ) ( LIFTING ?auto_42963 ?auto_42962 ) )
    :subtasks
    ( ( !LOAD ?auto_42963 ?auto_42962 ?auto_42966 ?auto_42965 )
      ( MAKE-ON ?auto_42961 ?auto_42962 )
      ( MAKE-ON-VERIFY ?auto_42961 ?auto_42962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42970 - SURFACE
      ?auto_42971 - SURFACE
    )
    :vars
    (
      ?auto_42973 - HOIST
      ?auto_42977 - PLACE
      ?auto_42976 - PLACE
      ?auto_42975 - HOIST
      ?auto_42978 - SURFACE
      ?auto_42974 - SURFACE
      ?auto_42972 - TRUCK
      ?auto_42979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42973 ?auto_42977 ) ( IS-CRATE ?auto_42970 ) ( not ( = ?auto_42970 ?auto_42971 ) ) ( not ( = ?auto_42976 ?auto_42977 ) ) ( HOIST-AT ?auto_42975 ?auto_42976 ) ( not ( = ?auto_42973 ?auto_42975 ) ) ( SURFACE-AT ?auto_42970 ?auto_42976 ) ( ON ?auto_42970 ?auto_42978 ) ( CLEAR ?auto_42970 ) ( not ( = ?auto_42970 ?auto_42978 ) ) ( not ( = ?auto_42971 ?auto_42978 ) ) ( SURFACE-AT ?auto_42974 ?auto_42977 ) ( CLEAR ?auto_42974 ) ( IS-CRATE ?auto_42971 ) ( not ( = ?auto_42970 ?auto_42974 ) ) ( not ( = ?auto_42971 ?auto_42974 ) ) ( not ( = ?auto_42978 ?auto_42974 ) ) ( AVAILABLE ?auto_42973 ) ( TRUCK-AT ?auto_42972 ?auto_42976 ) ( AVAILABLE ?auto_42975 ) ( SURFACE-AT ?auto_42971 ?auto_42976 ) ( ON ?auto_42971 ?auto_42979 ) ( CLEAR ?auto_42971 ) ( not ( = ?auto_42970 ?auto_42979 ) ) ( not ( = ?auto_42971 ?auto_42979 ) ) ( not ( = ?auto_42978 ?auto_42979 ) ) ( not ( = ?auto_42974 ?auto_42979 ) ) )
    :subtasks
    ( ( !LIFT ?auto_42975 ?auto_42971 ?auto_42979 ?auto_42976 )
      ( MAKE-ON ?auto_42970 ?auto_42971 )
      ( MAKE-ON-VERIFY ?auto_42970 ?auto_42971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42980 - SURFACE
      ?auto_42981 - SURFACE
    )
    :vars
    (
      ?auto_42985 - HOIST
      ?auto_42984 - PLACE
      ?auto_42986 - PLACE
      ?auto_42983 - HOIST
      ?auto_42982 - SURFACE
      ?auto_42988 - SURFACE
      ?auto_42989 - SURFACE
      ?auto_42987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42985 ?auto_42984 ) ( IS-CRATE ?auto_42980 ) ( not ( = ?auto_42980 ?auto_42981 ) ) ( not ( = ?auto_42986 ?auto_42984 ) ) ( HOIST-AT ?auto_42983 ?auto_42986 ) ( not ( = ?auto_42985 ?auto_42983 ) ) ( SURFACE-AT ?auto_42980 ?auto_42986 ) ( ON ?auto_42980 ?auto_42982 ) ( CLEAR ?auto_42980 ) ( not ( = ?auto_42980 ?auto_42982 ) ) ( not ( = ?auto_42981 ?auto_42982 ) ) ( SURFACE-AT ?auto_42988 ?auto_42984 ) ( CLEAR ?auto_42988 ) ( IS-CRATE ?auto_42981 ) ( not ( = ?auto_42980 ?auto_42988 ) ) ( not ( = ?auto_42981 ?auto_42988 ) ) ( not ( = ?auto_42982 ?auto_42988 ) ) ( AVAILABLE ?auto_42985 ) ( AVAILABLE ?auto_42983 ) ( SURFACE-AT ?auto_42981 ?auto_42986 ) ( ON ?auto_42981 ?auto_42989 ) ( CLEAR ?auto_42981 ) ( not ( = ?auto_42980 ?auto_42989 ) ) ( not ( = ?auto_42981 ?auto_42989 ) ) ( not ( = ?auto_42982 ?auto_42989 ) ) ( not ( = ?auto_42988 ?auto_42989 ) ) ( TRUCK-AT ?auto_42987 ?auto_42984 ) )
    :subtasks
    ( ( !DRIVE ?auto_42987 ?auto_42984 ?auto_42986 )
      ( MAKE-ON ?auto_42980 ?auto_42981 )
      ( MAKE-ON-VERIFY ?auto_42980 ?auto_42981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42990 - SURFACE
      ?auto_42991 - SURFACE
    )
    :vars
    (
      ?auto_42997 - HOIST
      ?auto_42996 - PLACE
      ?auto_42999 - PLACE
      ?auto_42993 - HOIST
      ?auto_42994 - SURFACE
      ?auto_42995 - SURFACE
      ?auto_42998 - SURFACE
      ?auto_42992 - TRUCK
      ?auto_43000 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42997 ?auto_42996 ) ( IS-CRATE ?auto_42990 ) ( not ( = ?auto_42990 ?auto_42991 ) ) ( not ( = ?auto_42999 ?auto_42996 ) ) ( HOIST-AT ?auto_42993 ?auto_42999 ) ( not ( = ?auto_42997 ?auto_42993 ) ) ( SURFACE-AT ?auto_42990 ?auto_42999 ) ( ON ?auto_42990 ?auto_42994 ) ( CLEAR ?auto_42990 ) ( not ( = ?auto_42990 ?auto_42994 ) ) ( not ( = ?auto_42991 ?auto_42994 ) ) ( IS-CRATE ?auto_42991 ) ( not ( = ?auto_42990 ?auto_42995 ) ) ( not ( = ?auto_42991 ?auto_42995 ) ) ( not ( = ?auto_42994 ?auto_42995 ) ) ( AVAILABLE ?auto_42993 ) ( SURFACE-AT ?auto_42991 ?auto_42999 ) ( ON ?auto_42991 ?auto_42998 ) ( CLEAR ?auto_42991 ) ( not ( = ?auto_42990 ?auto_42998 ) ) ( not ( = ?auto_42991 ?auto_42998 ) ) ( not ( = ?auto_42994 ?auto_42998 ) ) ( not ( = ?auto_42995 ?auto_42998 ) ) ( TRUCK-AT ?auto_42992 ?auto_42996 ) ( SURFACE-AT ?auto_43000 ?auto_42996 ) ( CLEAR ?auto_43000 ) ( LIFTING ?auto_42997 ?auto_42995 ) ( IS-CRATE ?auto_42995 ) ( not ( = ?auto_42990 ?auto_43000 ) ) ( not ( = ?auto_42991 ?auto_43000 ) ) ( not ( = ?auto_42994 ?auto_43000 ) ) ( not ( = ?auto_42995 ?auto_43000 ) ) ( not ( = ?auto_42998 ?auto_43000 ) ) )
    :subtasks
    ( ( !DROP ?auto_42997 ?auto_42995 ?auto_43000 ?auto_42996 )
      ( MAKE-ON ?auto_42990 ?auto_42991 )
      ( MAKE-ON-VERIFY ?auto_42990 ?auto_42991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43001 - SURFACE
      ?auto_43002 - SURFACE
    )
    :vars
    (
      ?auto_43011 - HOIST
      ?auto_43007 - PLACE
      ?auto_43004 - PLACE
      ?auto_43008 - HOIST
      ?auto_43009 - SURFACE
      ?auto_43010 - SURFACE
      ?auto_43005 - SURFACE
      ?auto_43003 - TRUCK
      ?auto_43006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43011 ?auto_43007 ) ( IS-CRATE ?auto_43001 ) ( not ( = ?auto_43001 ?auto_43002 ) ) ( not ( = ?auto_43004 ?auto_43007 ) ) ( HOIST-AT ?auto_43008 ?auto_43004 ) ( not ( = ?auto_43011 ?auto_43008 ) ) ( SURFACE-AT ?auto_43001 ?auto_43004 ) ( ON ?auto_43001 ?auto_43009 ) ( CLEAR ?auto_43001 ) ( not ( = ?auto_43001 ?auto_43009 ) ) ( not ( = ?auto_43002 ?auto_43009 ) ) ( IS-CRATE ?auto_43002 ) ( not ( = ?auto_43001 ?auto_43010 ) ) ( not ( = ?auto_43002 ?auto_43010 ) ) ( not ( = ?auto_43009 ?auto_43010 ) ) ( AVAILABLE ?auto_43008 ) ( SURFACE-AT ?auto_43002 ?auto_43004 ) ( ON ?auto_43002 ?auto_43005 ) ( CLEAR ?auto_43002 ) ( not ( = ?auto_43001 ?auto_43005 ) ) ( not ( = ?auto_43002 ?auto_43005 ) ) ( not ( = ?auto_43009 ?auto_43005 ) ) ( not ( = ?auto_43010 ?auto_43005 ) ) ( TRUCK-AT ?auto_43003 ?auto_43007 ) ( SURFACE-AT ?auto_43006 ?auto_43007 ) ( CLEAR ?auto_43006 ) ( IS-CRATE ?auto_43010 ) ( not ( = ?auto_43001 ?auto_43006 ) ) ( not ( = ?auto_43002 ?auto_43006 ) ) ( not ( = ?auto_43009 ?auto_43006 ) ) ( not ( = ?auto_43010 ?auto_43006 ) ) ( not ( = ?auto_43005 ?auto_43006 ) ) ( AVAILABLE ?auto_43011 ) ( IN ?auto_43010 ?auto_43003 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43011 ?auto_43010 ?auto_43003 ?auto_43007 )
      ( MAKE-ON ?auto_43001 ?auto_43002 )
      ( MAKE-ON-VERIFY ?auto_43001 ?auto_43002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43012 - SURFACE
      ?auto_43013 - SURFACE
    )
    :vars
    (
      ?auto_43019 - HOIST
      ?auto_43014 - PLACE
      ?auto_43017 - PLACE
      ?auto_43020 - HOIST
      ?auto_43022 - SURFACE
      ?auto_43018 - SURFACE
      ?auto_43015 - SURFACE
      ?auto_43021 - SURFACE
      ?auto_43016 - TRUCK
      ?auto_43023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43019 ?auto_43014 ) ( IS-CRATE ?auto_43012 ) ( not ( = ?auto_43012 ?auto_43013 ) ) ( not ( = ?auto_43017 ?auto_43014 ) ) ( HOIST-AT ?auto_43020 ?auto_43017 ) ( not ( = ?auto_43019 ?auto_43020 ) ) ( SURFACE-AT ?auto_43012 ?auto_43017 ) ( ON ?auto_43012 ?auto_43022 ) ( CLEAR ?auto_43012 ) ( not ( = ?auto_43012 ?auto_43022 ) ) ( not ( = ?auto_43013 ?auto_43022 ) ) ( IS-CRATE ?auto_43013 ) ( not ( = ?auto_43012 ?auto_43018 ) ) ( not ( = ?auto_43013 ?auto_43018 ) ) ( not ( = ?auto_43022 ?auto_43018 ) ) ( AVAILABLE ?auto_43020 ) ( SURFACE-AT ?auto_43013 ?auto_43017 ) ( ON ?auto_43013 ?auto_43015 ) ( CLEAR ?auto_43013 ) ( not ( = ?auto_43012 ?auto_43015 ) ) ( not ( = ?auto_43013 ?auto_43015 ) ) ( not ( = ?auto_43022 ?auto_43015 ) ) ( not ( = ?auto_43018 ?auto_43015 ) ) ( SURFACE-AT ?auto_43021 ?auto_43014 ) ( CLEAR ?auto_43021 ) ( IS-CRATE ?auto_43018 ) ( not ( = ?auto_43012 ?auto_43021 ) ) ( not ( = ?auto_43013 ?auto_43021 ) ) ( not ( = ?auto_43022 ?auto_43021 ) ) ( not ( = ?auto_43018 ?auto_43021 ) ) ( not ( = ?auto_43015 ?auto_43021 ) ) ( AVAILABLE ?auto_43019 ) ( IN ?auto_43018 ?auto_43016 ) ( TRUCK-AT ?auto_43016 ?auto_43023 ) ( not ( = ?auto_43023 ?auto_43014 ) ) ( not ( = ?auto_43017 ?auto_43023 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43016 ?auto_43023 ?auto_43014 )
      ( MAKE-ON ?auto_43012 ?auto_43013 )
      ( MAKE-ON-VERIFY ?auto_43012 ?auto_43013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43024 - SURFACE
      ?auto_43025 - SURFACE
    )
    :vars
    (
      ?auto_43027 - HOIST
      ?auto_43033 - PLACE
      ?auto_43030 - PLACE
      ?auto_43028 - HOIST
      ?auto_43029 - SURFACE
      ?auto_43026 - SURFACE
      ?auto_43034 - SURFACE
      ?auto_43032 - SURFACE
      ?auto_43031 - TRUCK
      ?auto_43035 - PLACE
      ?auto_43036 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43027 ?auto_43033 ) ( IS-CRATE ?auto_43024 ) ( not ( = ?auto_43024 ?auto_43025 ) ) ( not ( = ?auto_43030 ?auto_43033 ) ) ( HOIST-AT ?auto_43028 ?auto_43030 ) ( not ( = ?auto_43027 ?auto_43028 ) ) ( SURFACE-AT ?auto_43024 ?auto_43030 ) ( ON ?auto_43024 ?auto_43029 ) ( CLEAR ?auto_43024 ) ( not ( = ?auto_43024 ?auto_43029 ) ) ( not ( = ?auto_43025 ?auto_43029 ) ) ( IS-CRATE ?auto_43025 ) ( not ( = ?auto_43024 ?auto_43026 ) ) ( not ( = ?auto_43025 ?auto_43026 ) ) ( not ( = ?auto_43029 ?auto_43026 ) ) ( AVAILABLE ?auto_43028 ) ( SURFACE-AT ?auto_43025 ?auto_43030 ) ( ON ?auto_43025 ?auto_43034 ) ( CLEAR ?auto_43025 ) ( not ( = ?auto_43024 ?auto_43034 ) ) ( not ( = ?auto_43025 ?auto_43034 ) ) ( not ( = ?auto_43029 ?auto_43034 ) ) ( not ( = ?auto_43026 ?auto_43034 ) ) ( SURFACE-AT ?auto_43032 ?auto_43033 ) ( CLEAR ?auto_43032 ) ( IS-CRATE ?auto_43026 ) ( not ( = ?auto_43024 ?auto_43032 ) ) ( not ( = ?auto_43025 ?auto_43032 ) ) ( not ( = ?auto_43029 ?auto_43032 ) ) ( not ( = ?auto_43026 ?auto_43032 ) ) ( not ( = ?auto_43034 ?auto_43032 ) ) ( AVAILABLE ?auto_43027 ) ( TRUCK-AT ?auto_43031 ?auto_43035 ) ( not ( = ?auto_43035 ?auto_43033 ) ) ( not ( = ?auto_43030 ?auto_43035 ) ) ( HOIST-AT ?auto_43036 ?auto_43035 ) ( LIFTING ?auto_43036 ?auto_43026 ) ( not ( = ?auto_43027 ?auto_43036 ) ) ( not ( = ?auto_43028 ?auto_43036 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43036 ?auto_43026 ?auto_43031 ?auto_43035 )
      ( MAKE-ON ?auto_43024 ?auto_43025 )
      ( MAKE-ON-VERIFY ?auto_43024 ?auto_43025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43037 - SURFACE
      ?auto_43038 - SURFACE
    )
    :vars
    (
      ?auto_43040 - HOIST
      ?auto_43048 - PLACE
      ?auto_43049 - PLACE
      ?auto_43047 - HOIST
      ?auto_43042 - SURFACE
      ?auto_43041 - SURFACE
      ?auto_43044 - SURFACE
      ?auto_43046 - SURFACE
      ?auto_43045 - TRUCK
      ?auto_43039 - PLACE
      ?auto_43043 - HOIST
      ?auto_43050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43040 ?auto_43048 ) ( IS-CRATE ?auto_43037 ) ( not ( = ?auto_43037 ?auto_43038 ) ) ( not ( = ?auto_43049 ?auto_43048 ) ) ( HOIST-AT ?auto_43047 ?auto_43049 ) ( not ( = ?auto_43040 ?auto_43047 ) ) ( SURFACE-AT ?auto_43037 ?auto_43049 ) ( ON ?auto_43037 ?auto_43042 ) ( CLEAR ?auto_43037 ) ( not ( = ?auto_43037 ?auto_43042 ) ) ( not ( = ?auto_43038 ?auto_43042 ) ) ( IS-CRATE ?auto_43038 ) ( not ( = ?auto_43037 ?auto_43041 ) ) ( not ( = ?auto_43038 ?auto_43041 ) ) ( not ( = ?auto_43042 ?auto_43041 ) ) ( AVAILABLE ?auto_43047 ) ( SURFACE-AT ?auto_43038 ?auto_43049 ) ( ON ?auto_43038 ?auto_43044 ) ( CLEAR ?auto_43038 ) ( not ( = ?auto_43037 ?auto_43044 ) ) ( not ( = ?auto_43038 ?auto_43044 ) ) ( not ( = ?auto_43042 ?auto_43044 ) ) ( not ( = ?auto_43041 ?auto_43044 ) ) ( SURFACE-AT ?auto_43046 ?auto_43048 ) ( CLEAR ?auto_43046 ) ( IS-CRATE ?auto_43041 ) ( not ( = ?auto_43037 ?auto_43046 ) ) ( not ( = ?auto_43038 ?auto_43046 ) ) ( not ( = ?auto_43042 ?auto_43046 ) ) ( not ( = ?auto_43041 ?auto_43046 ) ) ( not ( = ?auto_43044 ?auto_43046 ) ) ( AVAILABLE ?auto_43040 ) ( TRUCK-AT ?auto_43045 ?auto_43039 ) ( not ( = ?auto_43039 ?auto_43048 ) ) ( not ( = ?auto_43049 ?auto_43039 ) ) ( HOIST-AT ?auto_43043 ?auto_43039 ) ( not ( = ?auto_43040 ?auto_43043 ) ) ( not ( = ?auto_43047 ?auto_43043 ) ) ( AVAILABLE ?auto_43043 ) ( SURFACE-AT ?auto_43041 ?auto_43039 ) ( ON ?auto_43041 ?auto_43050 ) ( CLEAR ?auto_43041 ) ( not ( = ?auto_43037 ?auto_43050 ) ) ( not ( = ?auto_43038 ?auto_43050 ) ) ( not ( = ?auto_43042 ?auto_43050 ) ) ( not ( = ?auto_43041 ?auto_43050 ) ) ( not ( = ?auto_43044 ?auto_43050 ) ) ( not ( = ?auto_43046 ?auto_43050 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43043 ?auto_43041 ?auto_43050 ?auto_43039 )
      ( MAKE-ON ?auto_43037 ?auto_43038 )
      ( MAKE-ON-VERIFY ?auto_43037 ?auto_43038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43051 - SURFACE
      ?auto_43052 - SURFACE
    )
    :vars
    (
      ?auto_43062 - HOIST
      ?auto_43058 - PLACE
      ?auto_43060 - PLACE
      ?auto_43057 - HOIST
      ?auto_43056 - SURFACE
      ?auto_43064 - SURFACE
      ?auto_43063 - SURFACE
      ?auto_43059 - SURFACE
      ?auto_43053 - PLACE
      ?auto_43061 - HOIST
      ?auto_43054 - SURFACE
      ?auto_43055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43062 ?auto_43058 ) ( IS-CRATE ?auto_43051 ) ( not ( = ?auto_43051 ?auto_43052 ) ) ( not ( = ?auto_43060 ?auto_43058 ) ) ( HOIST-AT ?auto_43057 ?auto_43060 ) ( not ( = ?auto_43062 ?auto_43057 ) ) ( SURFACE-AT ?auto_43051 ?auto_43060 ) ( ON ?auto_43051 ?auto_43056 ) ( CLEAR ?auto_43051 ) ( not ( = ?auto_43051 ?auto_43056 ) ) ( not ( = ?auto_43052 ?auto_43056 ) ) ( IS-CRATE ?auto_43052 ) ( not ( = ?auto_43051 ?auto_43064 ) ) ( not ( = ?auto_43052 ?auto_43064 ) ) ( not ( = ?auto_43056 ?auto_43064 ) ) ( AVAILABLE ?auto_43057 ) ( SURFACE-AT ?auto_43052 ?auto_43060 ) ( ON ?auto_43052 ?auto_43063 ) ( CLEAR ?auto_43052 ) ( not ( = ?auto_43051 ?auto_43063 ) ) ( not ( = ?auto_43052 ?auto_43063 ) ) ( not ( = ?auto_43056 ?auto_43063 ) ) ( not ( = ?auto_43064 ?auto_43063 ) ) ( SURFACE-AT ?auto_43059 ?auto_43058 ) ( CLEAR ?auto_43059 ) ( IS-CRATE ?auto_43064 ) ( not ( = ?auto_43051 ?auto_43059 ) ) ( not ( = ?auto_43052 ?auto_43059 ) ) ( not ( = ?auto_43056 ?auto_43059 ) ) ( not ( = ?auto_43064 ?auto_43059 ) ) ( not ( = ?auto_43063 ?auto_43059 ) ) ( AVAILABLE ?auto_43062 ) ( not ( = ?auto_43053 ?auto_43058 ) ) ( not ( = ?auto_43060 ?auto_43053 ) ) ( HOIST-AT ?auto_43061 ?auto_43053 ) ( not ( = ?auto_43062 ?auto_43061 ) ) ( not ( = ?auto_43057 ?auto_43061 ) ) ( AVAILABLE ?auto_43061 ) ( SURFACE-AT ?auto_43064 ?auto_43053 ) ( ON ?auto_43064 ?auto_43054 ) ( CLEAR ?auto_43064 ) ( not ( = ?auto_43051 ?auto_43054 ) ) ( not ( = ?auto_43052 ?auto_43054 ) ) ( not ( = ?auto_43056 ?auto_43054 ) ) ( not ( = ?auto_43064 ?auto_43054 ) ) ( not ( = ?auto_43063 ?auto_43054 ) ) ( not ( = ?auto_43059 ?auto_43054 ) ) ( TRUCK-AT ?auto_43055 ?auto_43058 ) )
    :subtasks
    ( ( !DRIVE ?auto_43055 ?auto_43058 ?auto_43053 )
      ( MAKE-ON ?auto_43051 ?auto_43052 )
      ( MAKE-ON-VERIFY ?auto_43051 ?auto_43052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43067 - SURFACE
      ?auto_43068 - SURFACE
    )
    :vars
    (
      ?auto_43069 - HOIST
      ?auto_43070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43069 ?auto_43070 ) ( SURFACE-AT ?auto_43068 ?auto_43070 ) ( CLEAR ?auto_43068 ) ( LIFTING ?auto_43069 ?auto_43067 ) ( IS-CRATE ?auto_43067 ) ( not ( = ?auto_43067 ?auto_43068 ) ) )
    :subtasks
    ( ( !DROP ?auto_43069 ?auto_43067 ?auto_43068 ?auto_43070 )
      ( MAKE-ON-VERIFY ?auto_43067 ?auto_43068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43071 - SURFACE
      ?auto_43072 - SURFACE
    )
    :vars
    (
      ?auto_43074 - HOIST
      ?auto_43073 - PLACE
      ?auto_43075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43074 ?auto_43073 ) ( SURFACE-AT ?auto_43072 ?auto_43073 ) ( CLEAR ?auto_43072 ) ( IS-CRATE ?auto_43071 ) ( not ( = ?auto_43071 ?auto_43072 ) ) ( TRUCK-AT ?auto_43075 ?auto_43073 ) ( AVAILABLE ?auto_43074 ) ( IN ?auto_43071 ?auto_43075 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43074 ?auto_43071 ?auto_43075 ?auto_43073 )
      ( MAKE-ON ?auto_43071 ?auto_43072 )
      ( MAKE-ON-VERIFY ?auto_43071 ?auto_43072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43076 - SURFACE
      ?auto_43077 - SURFACE
    )
    :vars
    (
      ?auto_43080 - HOIST
      ?auto_43079 - PLACE
      ?auto_43078 - TRUCK
      ?auto_43081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43080 ?auto_43079 ) ( SURFACE-AT ?auto_43077 ?auto_43079 ) ( CLEAR ?auto_43077 ) ( IS-CRATE ?auto_43076 ) ( not ( = ?auto_43076 ?auto_43077 ) ) ( AVAILABLE ?auto_43080 ) ( IN ?auto_43076 ?auto_43078 ) ( TRUCK-AT ?auto_43078 ?auto_43081 ) ( not ( = ?auto_43081 ?auto_43079 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43078 ?auto_43081 ?auto_43079 )
      ( MAKE-ON ?auto_43076 ?auto_43077 )
      ( MAKE-ON-VERIFY ?auto_43076 ?auto_43077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43082 - SURFACE
      ?auto_43083 - SURFACE
    )
    :vars
    (
      ?auto_43085 - HOIST
      ?auto_43086 - PLACE
      ?auto_43084 - TRUCK
      ?auto_43087 - PLACE
      ?auto_43088 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43085 ?auto_43086 ) ( SURFACE-AT ?auto_43083 ?auto_43086 ) ( CLEAR ?auto_43083 ) ( IS-CRATE ?auto_43082 ) ( not ( = ?auto_43082 ?auto_43083 ) ) ( AVAILABLE ?auto_43085 ) ( TRUCK-AT ?auto_43084 ?auto_43087 ) ( not ( = ?auto_43087 ?auto_43086 ) ) ( HOIST-AT ?auto_43088 ?auto_43087 ) ( LIFTING ?auto_43088 ?auto_43082 ) ( not ( = ?auto_43085 ?auto_43088 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43088 ?auto_43082 ?auto_43084 ?auto_43087 )
      ( MAKE-ON ?auto_43082 ?auto_43083 )
      ( MAKE-ON-VERIFY ?auto_43082 ?auto_43083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43089 - SURFACE
      ?auto_43090 - SURFACE
    )
    :vars
    (
      ?auto_43091 - HOIST
      ?auto_43095 - PLACE
      ?auto_43092 - TRUCK
      ?auto_43094 - PLACE
      ?auto_43093 - HOIST
      ?auto_43096 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43091 ?auto_43095 ) ( SURFACE-AT ?auto_43090 ?auto_43095 ) ( CLEAR ?auto_43090 ) ( IS-CRATE ?auto_43089 ) ( not ( = ?auto_43089 ?auto_43090 ) ) ( AVAILABLE ?auto_43091 ) ( TRUCK-AT ?auto_43092 ?auto_43094 ) ( not ( = ?auto_43094 ?auto_43095 ) ) ( HOIST-AT ?auto_43093 ?auto_43094 ) ( not ( = ?auto_43091 ?auto_43093 ) ) ( AVAILABLE ?auto_43093 ) ( SURFACE-AT ?auto_43089 ?auto_43094 ) ( ON ?auto_43089 ?auto_43096 ) ( CLEAR ?auto_43089 ) ( not ( = ?auto_43089 ?auto_43096 ) ) ( not ( = ?auto_43090 ?auto_43096 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43093 ?auto_43089 ?auto_43096 ?auto_43094 )
      ( MAKE-ON ?auto_43089 ?auto_43090 )
      ( MAKE-ON-VERIFY ?auto_43089 ?auto_43090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43097 - SURFACE
      ?auto_43098 - SURFACE
    )
    :vars
    (
      ?auto_43103 - HOIST
      ?auto_43101 - PLACE
      ?auto_43104 - PLACE
      ?auto_43100 - HOIST
      ?auto_43099 - SURFACE
      ?auto_43102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43103 ?auto_43101 ) ( SURFACE-AT ?auto_43098 ?auto_43101 ) ( CLEAR ?auto_43098 ) ( IS-CRATE ?auto_43097 ) ( not ( = ?auto_43097 ?auto_43098 ) ) ( AVAILABLE ?auto_43103 ) ( not ( = ?auto_43104 ?auto_43101 ) ) ( HOIST-AT ?auto_43100 ?auto_43104 ) ( not ( = ?auto_43103 ?auto_43100 ) ) ( AVAILABLE ?auto_43100 ) ( SURFACE-AT ?auto_43097 ?auto_43104 ) ( ON ?auto_43097 ?auto_43099 ) ( CLEAR ?auto_43097 ) ( not ( = ?auto_43097 ?auto_43099 ) ) ( not ( = ?auto_43098 ?auto_43099 ) ) ( TRUCK-AT ?auto_43102 ?auto_43101 ) )
    :subtasks
    ( ( !DRIVE ?auto_43102 ?auto_43101 ?auto_43104 )
      ( MAKE-ON ?auto_43097 ?auto_43098 )
      ( MAKE-ON-VERIFY ?auto_43097 ?auto_43098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43105 - SURFACE
      ?auto_43106 - SURFACE
    )
    :vars
    (
      ?auto_43111 - HOIST
      ?auto_43109 - PLACE
      ?auto_43107 - PLACE
      ?auto_43108 - HOIST
      ?auto_43110 - SURFACE
      ?auto_43112 - TRUCK
      ?auto_43113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43111 ?auto_43109 ) ( IS-CRATE ?auto_43105 ) ( not ( = ?auto_43105 ?auto_43106 ) ) ( not ( = ?auto_43107 ?auto_43109 ) ) ( HOIST-AT ?auto_43108 ?auto_43107 ) ( not ( = ?auto_43111 ?auto_43108 ) ) ( AVAILABLE ?auto_43108 ) ( SURFACE-AT ?auto_43105 ?auto_43107 ) ( ON ?auto_43105 ?auto_43110 ) ( CLEAR ?auto_43105 ) ( not ( = ?auto_43105 ?auto_43110 ) ) ( not ( = ?auto_43106 ?auto_43110 ) ) ( TRUCK-AT ?auto_43112 ?auto_43109 ) ( SURFACE-AT ?auto_43113 ?auto_43109 ) ( CLEAR ?auto_43113 ) ( LIFTING ?auto_43111 ?auto_43106 ) ( IS-CRATE ?auto_43106 ) ( not ( = ?auto_43105 ?auto_43113 ) ) ( not ( = ?auto_43106 ?auto_43113 ) ) ( not ( = ?auto_43110 ?auto_43113 ) ) )
    :subtasks
    ( ( !DROP ?auto_43111 ?auto_43106 ?auto_43113 ?auto_43109 )
      ( MAKE-ON ?auto_43105 ?auto_43106 )
      ( MAKE-ON-VERIFY ?auto_43105 ?auto_43106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43114 - SURFACE
      ?auto_43115 - SURFACE
    )
    :vars
    (
      ?auto_43119 - HOIST
      ?auto_43116 - PLACE
      ?auto_43118 - PLACE
      ?auto_43121 - HOIST
      ?auto_43122 - SURFACE
      ?auto_43120 - TRUCK
      ?auto_43117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43119 ?auto_43116 ) ( IS-CRATE ?auto_43114 ) ( not ( = ?auto_43114 ?auto_43115 ) ) ( not ( = ?auto_43118 ?auto_43116 ) ) ( HOIST-AT ?auto_43121 ?auto_43118 ) ( not ( = ?auto_43119 ?auto_43121 ) ) ( AVAILABLE ?auto_43121 ) ( SURFACE-AT ?auto_43114 ?auto_43118 ) ( ON ?auto_43114 ?auto_43122 ) ( CLEAR ?auto_43114 ) ( not ( = ?auto_43114 ?auto_43122 ) ) ( not ( = ?auto_43115 ?auto_43122 ) ) ( TRUCK-AT ?auto_43120 ?auto_43116 ) ( SURFACE-AT ?auto_43117 ?auto_43116 ) ( CLEAR ?auto_43117 ) ( IS-CRATE ?auto_43115 ) ( not ( = ?auto_43114 ?auto_43117 ) ) ( not ( = ?auto_43115 ?auto_43117 ) ) ( not ( = ?auto_43122 ?auto_43117 ) ) ( AVAILABLE ?auto_43119 ) ( IN ?auto_43115 ?auto_43120 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43119 ?auto_43115 ?auto_43120 ?auto_43116 )
      ( MAKE-ON ?auto_43114 ?auto_43115 )
      ( MAKE-ON-VERIFY ?auto_43114 ?auto_43115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43123 - SURFACE
      ?auto_43124 - SURFACE
    )
    :vars
    (
      ?auto_43128 - HOIST
      ?auto_43125 - PLACE
      ?auto_43126 - PLACE
      ?auto_43131 - HOIST
      ?auto_43129 - SURFACE
      ?auto_43127 - SURFACE
      ?auto_43130 - TRUCK
      ?auto_43132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43128 ?auto_43125 ) ( IS-CRATE ?auto_43123 ) ( not ( = ?auto_43123 ?auto_43124 ) ) ( not ( = ?auto_43126 ?auto_43125 ) ) ( HOIST-AT ?auto_43131 ?auto_43126 ) ( not ( = ?auto_43128 ?auto_43131 ) ) ( AVAILABLE ?auto_43131 ) ( SURFACE-AT ?auto_43123 ?auto_43126 ) ( ON ?auto_43123 ?auto_43129 ) ( CLEAR ?auto_43123 ) ( not ( = ?auto_43123 ?auto_43129 ) ) ( not ( = ?auto_43124 ?auto_43129 ) ) ( SURFACE-AT ?auto_43127 ?auto_43125 ) ( CLEAR ?auto_43127 ) ( IS-CRATE ?auto_43124 ) ( not ( = ?auto_43123 ?auto_43127 ) ) ( not ( = ?auto_43124 ?auto_43127 ) ) ( not ( = ?auto_43129 ?auto_43127 ) ) ( AVAILABLE ?auto_43128 ) ( IN ?auto_43124 ?auto_43130 ) ( TRUCK-AT ?auto_43130 ?auto_43132 ) ( not ( = ?auto_43132 ?auto_43125 ) ) ( not ( = ?auto_43126 ?auto_43132 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43130 ?auto_43132 ?auto_43125 )
      ( MAKE-ON ?auto_43123 ?auto_43124 )
      ( MAKE-ON-VERIFY ?auto_43123 ?auto_43124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43133 - SURFACE
      ?auto_43134 - SURFACE
    )
    :vars
    (
      ?auto_43137 - HOIST
      ?auto_43135 - PLACE
      ?auto_43140 - PLACE
      ?auto_43138 - HOIST
      ?auto_43139 - SURFACE
      ?auto_43142 - SURFACE
      ?auto_43136 - TRUCK
      ?auto_43141 - PLACE
      ?auto_43143 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43137 ?auto_43135 ) ( IS-CRATE ?auto_43133 ) ( not ( = ?auto_43133 ?auto_43134 ) ) ( not ( = ?auto_43140 ?auto_43135 ) ) ( HOIST-AT ?auto_43138 ?auto_43140 ) ( not ( = ?auto_43137 ?auto_43138 ) ) ( AVAILABLE ?auto_43138 ) ( SURFACE-AT ?auto_43133 ?auto_43140 ) ( ON ?auto_43133 ?auto_43139 ) ( CLEAR ?auto_43133 ) ( not ( = ?auto_43133 ?auto_43139 ) ) ( not ( = ?auto_43134 ?auto_43139 ) ) ( SURFACE-AT ?auto_43142 ?auto_43135 ) ( CLEAR ?auto_43142 ) ( IS-CRATE ?auto_43134 ) ( not ( = ?auto_43133 ?auto_43142 ) ) ( not ( = ?auto_43134 ?auto_43142 ) ) ( not ( = ?auto_43139 ?auto_43142 ) ) ( AVAILABLE ?auto_43137 ) ( TRUCK-AT ?auto_43136 ?auto_43141 ) ( not ( = ?auto_43141 ?auto_43135 ) ) ( not ( = ?auto_43140 ?auto_43141 ) ) ( HOIST-AT ?auto_43143 ?auto_43141 ) ( LIFTING ?auto_43143 ?auto_43134 ) ( not ( = ?auto_43137 ?auto_43143 ) ) ( not ( = ?auto_43138 ?auto_43143 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43143 ?auto_43134 ?auto_43136 ?auto_43141 )
      ( MAKE-ON ?auto_43133 ?auto_43134 )
      ( MAKE-ON-VERIFY ?auto_43133 ?auto_43134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43144 - SURFACE
      ?auto_43145 - SURFACE
    )
    :vars
    (
      ?auto_43150 - HOIST
      ?auto_43146 - PLACE
      ?auto_43152 - PLACE
      ?auto_43147 - HOIST
      ?auto_43154 - SURFACE
      ?auto_43153 - SURFACE
      ?auto_43151 - TRUCK
      ?auto_43148 - PLACE
      ?auto_43149 - HOIST
      ?auto_43155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43150 ?auto_43146 ) ( IS-CRATE ?auto_43144 ) ( not ( = ?auto_43144 ?auto_43145 ) ) ( not ( = ?auto_43152 ?auto_43146 ) ) ( HOIST-AT ?auto_43147 ?auto_43152 ) ( not ( = ?auto_43150 ?auto_43147 ) ) ( AVAILABLE ?auto_43147 ) ( SURFACE-AT ?auto_43144 ?auto_43152 ) ( ON ?auto_43144 ?auto_43154 ) ( CLEAR ?auto_43144 ) ( not ( = ?auto_43144 ?auto_43154 ) ) ( not ( = ?auto_43145 ?auto_43154 ) ) ( SURFACE-AT ?auto_43153 ?auto_43146 ) ( CLEAR ?auto_43153 ) ( IS-CRATE ?auto_43145 ) ( not ( = ?auto_43144 ?auto_43153 ) ) ( not ( = ?auto_43145 ?auto_43153 ) ) ( not ( = ?auto_43154 ?auto_43153 ) ) ( AVAILABLE ?auto_43150 ) ( TRUCK-AT ?auto_43151 ?auto_43148 ) ( not ( = ?auto_43148 ?auto_43146 ) ) ( not ( = ?auto_43152 ?auto_43148 ) ) ( HOIST-AT ?auto_43149 ?auto_43148 ) ( not ( = ?auto_43150 ?auto_43149 ) ) ( not ( = ?auto_43147 ?auto_43149 ) ) ( AVAILABLE ?auto_43149 ) ( SURFACE-AT ?auto_43145 ?auto_43148 ) ( ON ?auto_43145 ?auto_43155 ) ( CLEAR ?auto_43145 ) ( not ( = ?auto_43144 ?auto_43155 ) ) ( not ( = ?auto_43145 ?auto_43155 ) ) ( not ( = ?auto_43154 ?auto_43155 ) ) ( not ( = ?auto_43153 ?auto_43155 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43149 ?auto_43145 ?auto_43155 ?auto_43148 )
      ( MAKE-ON ?auto_43144 ?auto_43145 )
      ( MAKE-ON-VERIFY ?auto_43144 ?auto_43145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43156 - SURFACE
      ?auto_43157 - SURFACE
    )
    :vars
    (
      ?auto_43161 - HOIST
      ?auto_43164 - PLACE
      ?auto_43165 - PLACE
      ?auto_43158 - HOIST
      ?auto_43163 - SURFACE
      ?auto_43160 - SURFACE
      ?auto_43159 - PLACE
      ?auto_43167 - HOIST
      ?auto_43166 - SURFACE
      ?auto_43162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43161 ?auto_43164 ) ( IS-CRATE ?auto_43156 ) ( not ( = ?auto_43156 ?auto_43157 ) ) ( not ( = ?auto_43165 ?auto_43164 ) ) ( HOIST-AT ?auto_43158 ?auto_43165 ) ( not ( = ?auto_43161 ?auto_43158 ) ) ( AVAILABLE ?auto_43158 ) ( SURFACE-AT ?auto_43156 ?auto_43165 ) ( ON ?auto_43156 ?auto_43163 ) ( CLEAR ?auto_43156 ) ( not ( = ?auto_43156 ?auto_43163 ) ) ( not ( = ?auto_43157 ?auto_43163 ) ) ( SURFACE-AT ?auto_43160 ?auto_43164 ) ( CLEAR ?auto_43160 ) ( IS-CRATE ?auto_43157 ) ( not ( = ?auto_43156 ?auto_43160 ) ) ( not ( = ?auto_43157 ?auto_43160 ) ) ( not ( = ?auto_43163 ?auto_43160 ) ) ( AVAILABLE ?auto_43161 ) ( not ( = ?auto_43159 ?auto_43164 ) ) ( not ( = ?auto_43165 ?auto_43159 ) ) ( HOIST-AT ?auto_43167 ?auto_43159 ) ( not ( = ?auto_43161 ?auto_43167 ) ) ( not ( = ?auto_43158 ?auto_43167 ) ) ( AVAILABLE ?auto_43167 ) ( SURFACE-AT ?auto_43157 ?auto_43159 ) ( ON ?auto_43157 ?auto_43166 ) ( CLEAR ?auto_43157 ) ( not ( = ?auto_43156 ?auto_43166 ) ) ( not ( = ?auto_43157 ?auto_43166 ) ) ( not ( = ?auto_43163 ?auto_43166 ) ) ( not ( = ?auto_43160 ?auto_43166 ) ) ( TRUCK-AT ?auto_43162 ?auto_43164 ) )
    :subtasks
    ( ( !DRIVE ?auto_43162 ?auto_43164 ?auto_43159 )
      ( MAKE-ON ?auto_43156 ?auto_43157 )
      ( MAKE-ON-VERIFY ?auto_43156 ?auto_43157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43168 - SURFACE
      ?auto_43169 - SURFACE
    )
    :vars
    (
      ?auto_43172 - HOIST
      ?auto_43171 - PLACE
      ?auto_43170 - PLACE
      ?auto_43177 - HOIST
      ?auto_43174 - SURFACE
      ?auto_43175 - SURFACE
      ?auto_43178 - PLACE
      ?auto_43173 - HOIST
      ?auto_43179 - SURFACE
      ?auto_43176 - TRUCK
      ?auto_43180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43172 ?auto_43171 ) ( IS-CRATE ?auto_43168 ) ( not ( = ?auto_43168 ?auto_43169 ) ) ( not ( = ?auto_43170 ?auto_43171 ) ) ( HOIST-AT ?auto_43177 ?auto_43170 ) ( not ( = ?auto_43172 ?auto_43177 ) ) ( AVAILABLE ?auto_43177 ) ( SURFACE-AT ?auto_43168 ?auto_43170 ) ( ON ?auto_43168 ?auto_43174 ) ( CLEAR ?auto_43168 ) ( not ( = ?auto_43168 ?auto_43174 ) ) ( not ( = ?auto_43169 ?auto_43174 ) ) ( IS-CRATE ?auto_43169 ) ( not ( = ?auto_43168 ?auto_43175 ) ) ( not ( = ?auto_43169 ?auto_43175 ) ) ( not ( = ?auto_43174 ?auto_43175 ) ) ( not ( = ?auto_43178 ?auto_43171 ) ) ( not ( = ?auto_43170 ?auto_43178 ) ) ( HOIST-AT ?auto_43173 ?auto_43178 ) ( not ( = ?auto_43172 ?auto_43173 ) ) ( not ( = ?auto_43177 ?auto_43173 ) ) ( AVAILABLE ?auto_43173 ) ( SURFACE-AT ?auto_43169 ?auto_43178 ) ( ON ?auto_43169 ?auto_43179 ) ( CLEAR ?auto_43169 ) ( not ( = ?auto_43168 ?auto_43179 ) ) ( not ( = ?auto_43169 ?auto_43179 ) ) ( not ( = ?auto_43174 ?auto_43179 ) ) ( not ( = ?auto_43175 ?auto_43179 ) ) ( TRUCK-AT ?auto_43176 ?auto_43171 ) ( SURFACE-AT ?auto_43180 ?auto_43171 ) ( CLEAR ?auto_43180 ) ( LIFTING ?auto_43172 ?auto_43175 ) ( IS-CRATE ?auto_43175 ) ( not ( = ?auto_43168 ?auto_43180 ) ) ( not ( = ?auto_43169 ?auto_43180 ) ) ( not ( = ?auto_43174 ?auto_43180 ) ) ( not ( = ?auto_43175 ?auto_43180 ) ) ( not ( = ?auto_43179 ?auto_43180 ) ) )
    :subtasks
    ( ( !DROP ?auto_43172 ?auto_43175 ?auto_43180 ?auto_43171 )
      ( MAKE-ON ?auto_43168 ?auto_43169 )
      ( MAKE-ON-VERIFY ?auto_43168 ?auto_43169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43181 - SURFACE
      ?auto_43182 - SURFACE
    )
    :vars
    (
      ?auto_43186 - HOIST
      ?auto_43190 - PLACE
      ?auto_43193 - PLACE
      ?auto_43183 - HOIST
      ?auto_43188 - SURFACE
      ?auto_43185 - SURFACE
      ?auto_43184 - PLACE
      ?auto_43192 - HOIST
      ?auto_43189 - SURFACE
      ?auto_43187 - TRUCK
      ?auto_43191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43186 ?auto_43190 ) ( IS-CRATE ?auto_43181 ) ( not ( = ?auto_43181 ?auto_43182 ) ) ( not ( = ?auto_43193 ?auto_43190 ) ) ( HOIST-AT ?auto_43183 ?auto_43193 ) ( not ( = ?auto_43186 ?auto_43183 ) ) ( AVAILABLE ?auto_43183 ) ( SURFACE-AT ?auto_43181 ?auto_43193 ) ( ON ?auto_43181 ?auto_43188 ) ( CLEAR ?auto_43181 ) ( not ( = ?auto_43181 ?auto_43188 ) ) ( not ( = ?auto_43182 ?auto_43188 ) ) ( IS-CRATE ?auto_43182 ) ( not ( = ?auto_43181 ?auto_43185 ) ) ( not ( = ?auto_43182 ?auto_43185 ) ) ( not ( = ?auto_43188 ?auto_43185 ) ) ( not ( = ?auto_43184 ?auto_43190 ) ) ( not ( = ?auto_43193 ?auto_43184 ) ) ( HOIST-AT ?auto_43192 ?auto_43184 ) ( not ( = ?auto_43186 ?auto_43192 ) ) ( not ( = ?auto_43183 ?auto_43192 ) ) ( AVAILABLE ?auto_43192 ) ( SURFACE-AT ?auto_43182 ?auto_43184 ) ( ON ?auto_43182 ?auto_43189 ) ( CLEAR ?auto_43182 ) ( not ( = ?auto_43181 ?auto_43189 ) ) ( not ( = ?auto_43182 ?auto_43189 ) ) ( not ( = ?auto_43188 ?auto_43189 ) ) ( not ( = ?auto_43185 ?auto_43189 ) ) ( TRUCK-AT ?auto_43187 ?auto_43190 ) ( SURFACE-AT ?auto_43191 ?auto_43190 ) ( CLEAR ?auto_43191 ) ( IS-CRATE ?auto_43185 ) ( not ( = ?auto_43181 ?auto_43191 ) ) ( not ( = ?auto_43182 ?auto_43191 ) ) ( not ( = ?auto_43188 ?auto_43191 ) ) ( not ( = ?auto_43185 ?auto_43191 ) ) ( not ( = ?auto_43189 ?auto_43191 ) ) ( AVAILABLE ?auto_43186 ) ( IN ?auto_43185 ?auto_43187 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43186 ?auto_43185 ?auto_43187 ?auto_43190 )
      ( MAKE-ON ?auto_43181 ?auto_43182 )
      ( MAKE-ON-VERIFY ?auto_43181 ?auto_43182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43194 - SURFACE
      ?auto_43195 - SURFACE
    )
    :vars
    (
      ?auto_43198 - HOIST
      ?auto_43200 - PLACE
      ?auto_43204 - PLACE
      ?auto_43201 - HOIST
      ?auto_43196 - SURFACE
      ?auto_43202 - SURFACE
      ?auto_43206 - PLACE
      ?auto_43203 - HOIST
      ?auto_43197 - SURFACE
      ?auto_43205 - SURFACE
      ?auto_43199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43198 ?auto_43200 ) ( IS-CRATE ?auto_43194 ) ( not ( = ?auto_43194 ?auto_43195 ) ) ( not ( = ?auto_43204 ?auto_43200 ) ) ( HOIST-AT ?auto_43201 ?auto_43204 ) ( not ( = ?auto_43198 ?auto_43201 ) ) ( AVAILABLE ?auto_43201 ) ( SURFACE-AT ?auto_43194 ?auto_43204 ) ( ON ?auto_43194 ?auto_43196 ) ( CLEAR ?auto_43194 ) ( not ( = ?auto_43194 ?auto_43196 ) ) ( not ( = ?auto_43195 ?auto_43196 ) ) ( IS-CRATE ?auto_43195 ) ( not ( = ?auto_43194 ?auto_43202 ) ) ( not ( = ?auto_43195 ?auto_43202 ) ) ( not ( = ?auto_43196 ?auto_43202 ) ) ( not ( = ?auto_43206 ?auto_43200 ) ) ( not ( = ?auto_43204 ?auto_43206 ) ) ( HOIST-AT ?auto_43203 ?auto_43206 ) ( not ( = ?auto_43198 ?auto_43203 ) ) ( not ( = ?auto_43201 ?auto_43203 ) ) ( AVAILABLE ?auto_43203 ) ( SURFACE-AT ?auto_43195 ?auto_43206 ) ( ON ?auto_43195 ?auto_43197 ) ( CLEAR ?auto_43195 ) ( not ( = ?auto_43194 ?auto_43197 ) ) ( not ( = ?auto_43195 ?auto_43197 ) ) ( not ( = ?auto_43196 ?auto_43197 ) ) ( not ( = ?auto_43202 ?auto_43197 ) ) ( SURFACE-AT ?auto_43205 ?auto_43200 ) ( CLEAR ?auto_43205 ) ( IS-CRATE ?auto_43202 ) ( not ( = ?auto_43194 ?auto_43205 ) ) ( not ( = ?auto_43195 ?auto_43205 ) ) ( not ( = ?auto_43196 ?auto_43205 ) ) ( not ( = ?auto_43202 ?auto_43205 ) ) ( not ( = ?auto_43197 ?auto_43205 ) ) ( AVAILABLE ?auto_43198 ) ( IN ?auto_43202 ?auto_43199 ) ( TRUCK-AT ?auto_43199 ?auto_43206 ) )
    :subtasks
    ( ( !DRIVE ?auto_43199 ?auto_43206 ?auto_43200 )
      ( MAKE-ON ?auto_43194 ?auto_43195 )
      ( MAKE-ON-VERIFY ?auto_43194 ?auto_43195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43207 - SURFACE
      ?auto_43208 - SURFACE
    )
    :vars
    (
      ?auto_43210 - HOIST
      ?auto_43214 - PLACE
      ?auto_43215 - PLACE
      ?auto_43211 - HOIST
      ?auto_43216 - SURFACE
      ?auto_43213 - SURFACE
      ?auto_43212 - PLACE
      ?auto_43209 - HOIST
      ?auto_43219 - SURFACE
      ?auto_43217 - SURFACE
      ?auto_43218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43210 ?auto_43214 ) ( IS-CRATE ?auto_43207 ) ( not ( = ?auto_43207 ?auto_43208 ) ) ( not ( = ?auto_43215 ?auto_43214 ) ) ( HOIST-AT ?auto_43211 ?auto_43215 ) ( not ( = ?auto_43210 ?auto_43211 ) ) ( AVAILABLE ?auto_43211 ) ( SURFACE-AT ?auto_43207 ?auto_43215 ) ( ON ?auto_43207 ?auto_43216 ) ( CLEAR ?auto_43207 ) ( not ( = ?auto_43207 ?auto_43216 ) ) ( not ( = ?auto_43208 ?auto_43216 ) ) ( IS-CRATE ?auto_43208 ) ( not ( = ?auto_43207 ?auto_43213 ) ) ( not ( = ?auto_43208 ?auto_43213 ) ) ( not ( = ?auto_43216 ?auto_43213 ) ) ( not ( = ?auto_43212 ?auto_43214 ) ) ( not ( = ?auto_43215 ?auto_43212 ) ) ( HOIST-AT ?auto_43209 ?auto_43212 ) ( not ( = ?auto_43210 ?auto_43209 ) ) ( not ( = ?auto_43211 ?auto_43209 ) ) ( SURFACE-AT ?auto_43208 ?auto_43212 ) ( ON ?auto_43208 ?auto_43219 ) ( CLEAR ?auto_43208 ) ( not ( = ?auto_43207 ?auto_43219 ) ) ( not ( = ?auto_43208 ?auto_43219 ) ) ( not ( = ?auto_43216 ?auto_43219 ) ) ( not ( = ?auto_43213 ?auto_43219 ) ) ( SURFACE-AT ?auto_43217 ?auto_43214 ) ( CLEAR ?auto_43217 ) ( IS-CRATE ?auto_43213 ) ( not ( = ?auto_43207 ?auto_43217 ) ) ( not ( = ?auto_43208 ?auto_43217 ) ) ( not ( = ?auto_43216 ?auto_43217 ) ) ( not ( = ?auto_43213 ?auto_43217 ) ) ( not ( = ?auto_43219 ?auto_43217 ) ) ( AVAILABLE ?auto_43210 ) ( TRUCK-AT ?auto_43218 ?auto_43212 ) ( LIFTING ?auto_43209 ?auto_43213 ) )
    :subtasks
    ( ( !LOAD ?auto_43209 ?auto_43213 ?auto_43218 ?auto_43212 )
      ( MAKE-ON ?auto_43207 ?auto_43208 )
      ( MAKE-ON-VERIFY ?auto_43207 ?auto_43208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43220 - SURFACE
      ?auto_43221 - SURFACE
    )
    :vars
    (
      ?auto_43225 - HOIST
      ?auto_43222 - PLACE
      ?auto_43223 - PLACE
      ?auto_43227 - HOIST
      ?auto_43230 - SURFACE
      ?auto_43229 - SURFACE
      ?auto_43232 - PLACE
      ?auto_43226 - HOIST
      ?auto_43228 - SURFACE
      ?auto_43224 - SURFACE
      ?auto_43231 - TRUCK
      ?auto_43233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43225 ?auto_43222 ) ( IS-CRATE ?auto_43220 ) ( not ( = ?auto_43220 ?auto_43221 ) ) ( not ( = ?auto_43223 ?auto_43222 ) ) ( HOIST-AT ?auto_43227 ?auto_43223 ) ( not ( = ?auto_43225 ?auto_43227 ) ) ( AVAILABLE ?auto_43227 ) ( SURFACE-AT ?auto_43220 ?auto_43223 ) ( ON ?auto_43220 ?auto_43230 ) ( CLEAR ?auto_43220 ) ( not ( = ?auto_43220 ?auto_43230 ) ) ( not ( = ?auto_43221 ?auto_43230 ) ) ( IS-CRATE ?auto_43221 ) ( not ( = ?auto_43220 ?auto_43229 ) ) ( not ( = ?auto_43221 ?auto_43229 ) ) ( not ( = ?auto_43230 ?auto_43229 ) ) ( not ( = ?auto_43232 ?auto_43222 ) ) ( not ( = ?auto_43223 ?auto_43232 ) ) ( HOIST-AT ?auto_43226 ?auto_43232 ) ( not ( = ?auto_43225 ?auto_43226 ) ) ( not ( = ?auto_43227 ?auto_43226 ) ) ( SURFACE-AT ?auto_43221 ?auto_43232 ) ( ON ?auto_43221 ?auto_43228 ) ( CLEAR ?auto_43221 ) ( not ( = ?auto_43220 ?auto_43228 ) ) ( not ( = ?auto_43221 ?auto_43228 ) ) ( not ( = ?auto_43230 ?auto_43228 ) ) ( not ( = ?auto_43229 ?auto_43228 ) ) ( SURFACE-AT ?auto_43224 ?auto_43222 ) ( CLEAR ?auto_43224 ) ( IS-CRATE ?auto_43229 ) ( not ( = ?auto_43220 ?auto_43224 ) ) ( not ( = ?auto_43221 ?auto_43224 ) ) ( not ( = ?auto_43230 ?auto_43224 ) ) ( not ( = ?auto_43229 ?auto_43224 ) ) ( not ( = ?auto_43228 ?auto_43224 ) ) ( AVAILABLE ?auto_43225 ) ( TRUCK-AT ?auto_43231 ?auto_43232 ) ( AVAILABLE ?auto_43226 ) ( SURFACE-AT ?auto_43229 ?auto_43232 ) ( ON ?auto_43229 ?auto_43233 ) ( CLEAR ?auto_43229 ) ( not ( = ?auto_43220 ?auto_43233 ) ) ( not ( = ?auto_43221 ?auto_43233 ) ) ( not ( = ?auto_43230 ?auto_43233 ) ) ( not ( = ?auto_43229 ?auto_43233 ) ) ( not ( = ?auto_43228 ?auto_43233 ) ) ( not ( = ?auto_43224 ?auto_43233 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43226 ?auto_43229 ?auto_43233 ?auto_43232 )
      ( MAKE-ON ?auto_43220 ?auto_43221 )
      ( MAKE-ON-VERIFY ?auto_43220 ?auto_43221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43234 - SURFACE
      ?auto_43235 - SURFACE
    )
    :vars
    (
      ?auto_43245 - HOIST
      ?auto_43241 - PLACE
      ?auto_43247 - PLACE
      ?auto_43236 - HOIST
      ?auto_43243 - SURFACE
      ?auto_43246 - SURFACE
      ?auto_43244 - PLACE
      ?auto_43237 - HOIST
      ?auto_43242 - SURFACE
      ?auto_43238 - SURFACE
      ?auto_43239 - SURFACE
      ?auto_43240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43245 ?auto_43241 ) ( IS-CRATE ?auto_43234 ) ( not ( = ?auto_43234 ?auto_43235 ) ) ( not ( = ?auto_43247 ?auto_43241 ) ) ( HOIST-AT ?auto_43236 ?auto_43247 ) ( not ( = ?auto_43245 ?auto_43236 ) ) ( AVAILABLE ?auto_43236 ) ( SURFACE-AT ?auto_43234 ?auto_43247 ) ( ON ?auto_43234 ?auto_43243 ) ( CLEAR ?auto_43234 ) ( not ( = ?auto_43234 ?auto_43243 ) ) ( not ( = ?auto_43235 ?auto_43243 ) ) ( IS-CRATE ?auto_43235 ) ( not ( = ?auto_43234 ?auto_43246 ) ) ( not ( = ?auto_43235 ?auto_43246 ) ) ( not ( = ?auto_43243 ?auto_43246 ) ) ( not ( = ?auto_43244 ?auto_43241 ) ) ( not ( = ?auto_43247 ?auto_43244 ) ) ( HOIST-AT ?auto_43237 ?auto_43244 ) ( not ( = ?auto_43245 ?auto_43237 ) ) ( not ( = ?auto_43236 ?auto_43237 ) ) ( SURFACE-AT ?auto_43235 ?auto_43244 ) ( ON ?auto_43235 ?auto_43242 ) ( CLEAR ?auto_43235 ) ( not ( = ?auto_43234 ?auto_43242 ) ) ( not ( = ?auto_43235 ?auto_43242 ) ) ( not ( = ?auto_43243 ?auto_43242 ) ) ( not ( = ?auto_43246 ?auto_43242 ) ) ( SURFACE-AT ?auto_43238 ?auto_43241 ) ( CLEAR ?auto_43238 ) ( IS-CRATE ?auto_43246 ) ( not ( = ?auto_43234 ?auto_43238 ) ) ( not ( = ?auto_43235 ?auto_43238 ) ) ( not ( = ?auto_43243 ?auto_43238 ) ) ( not ( = ?auto_43246 ?auto_43238 ) ) ( not ( = ?auto_43242 ?auto_43238 ) ) ( AVAILABLE ?auto_43245 ) ( AVAILABLE ?auto_43237 ) ( SURFACE-AT ?auto_43246 ?auto_43244 ) ( ON ?auto_43246 ?auto_43239 ) ( CLEAR ?auto_43246 ) ( not ( = ?auto_43234 ?auto_43239 ) ) ( not ( = ?auto_43235 ?auto_43239 ) ) ( not ( = ?auto_43243 ?auto_43239 ) ) ( not ( = ?auto_43246 ?auto_43239 ) ) ( not ( = ?auto_43242 ?auto_43239 ) ) ( not ( = ?auto_43238 ?auto_43239 ) ) ( TRUCK-AT ?auto_43240 ?auto_43241 ) )
    :subtasks
    ( ( !DRIVE ?auto_43240 ?auto_43241 ?auto_43244 )
      ( MAKE-ON ?auto_43234 ?auto_43235 )
      ( MAKE-ON-VERIFY ?auto_43234 ?auto_43235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43248 - SURFACE
      ?auto_43249 - SURFACE
    )
    :vars
    (
      ?auto_43256 - HOIST
      ?auto_43250 - PLACE
      ?auto_43261 - PLACE
      ?auto_43251 - HOIST
      ?auto_43255 - SURFACE
      ?auto_43259 - SURFACE
      ?auto_43253 - PLACE
      ?auto_43252 - HOIST
      ?auto_43258 - SURFACE
      ?auto_43254 - SURFACE
      ?auto_43257 - SURFACE
      ?auto_43260 - TRUCK
      ?auto_43262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43256 ?auto_43250 ) ( IS-CRATE ?auto_43248 ) ( not ( = ?auto_43248 ?auto_43249 ) ) ( not ( = ?auto_43261 ?auto_43250 ) ) ( HOIST-AT ?auto_43251 ?auto_43261 ) ( not ( = ?auto_43256 ?auto_43251 ) ) ( AVAILABLE ?auto_43251 ) ( SURFACE-AT ?auto_43248 ?auto_43261 ) ( ON ?auto_43248 ?auto_43255 ) ( CLEAR ?auto_43248 ) ( not ( = ?auto_43248 ?auto_43255 ) ) ( not ( = ?auto_43249 ?auto_43255 ) ) ( IS-CRATE ?auto_43249 ) ( not ( = ?auto_43248 ?auto_43259 ) ) ( not ( = ?auto_43249 ?auto_43259 ) ) ( not ( = ?auto_43255 ?auto_43259 ) ) ( not ( = ?auto_43253 ?auto_43250 ) ) ( not ( = ?auto_43261 ?auto_43253 ) ) ( HOIST-AT ?auto_43252 ?auto_43253 ) ( not ( = ?auto_43256 ?auto_43252 ) ) ( not ( = ?auto_43251 ?auto_43252 ) ) ( SURFACE-AT ?auto_43249 ?auto_43253 ) ( ON ?auto_43249 ?auto_43258 ) ( CLEAR ?auto_43249 ) ( not ( = ?auto_43248 ?auto_43258 ) ) ( not ( = ?auto_43249 ?auto_43258 ) ) ( not ( = ?auto_43255 ?auto_43258 ) ) ( not ( = ?auto_43259 ?auto_43258 ) ) ( IS-CRATE ?auto_43259 ) ( not ( = ?auto_43248 ?auto_43254 ) ) ( not ( = ?auto_43249 ?auto_43254 ) ) ( not ( = ?auto_43255 ?auto_43254 ) ) ( not ( = ?auto_43259 ?auto_43254 ) ) ( not ( = ?auto_43258 ?auto_43254 ) ) ( AVAILABLE ?auto_43252 ) ( SURFACE-AT ?auto_43259 ?auto_43253 ) ( ON ?auto_43259 ?auto_43257 ) ( CLEAR ?auto_43259 ) ( not ( = ?auto_43248 ?auto_43257 ) ) ( not ( = ?auto_43249 ?auto_43257 ) ) ( not ( = ?auto_43255 ?auto_43257 ) ) ( not ( = ?auto_43259 ?auto_43257 ) ) ( not ( = ?auto_43258 ?auto_43257 ) ) ( not ( = ?auto_43254 ?auto_43257 ) ) ( TRUCK-AT ?auto_43260 ?auto_43250 ) ( SURFACE-AT ?auto_43262 ?auto_43250 ) ( CLEAR ?auto_43262 ) ( LIFTING ?auto_43256 ?auto_43254 ) ( IS-CRATE ?auto_43254 ) ( not ( = ?auto_43248 ?auto_43262 ) ) ( not ( = ?auto_43249 ?auto_43262 ) ) ( not ( = ?auto_43255 ?auto_43262 ) ) ( not ( = ?auto_43259 ?auto_43262 ) ) ( not ( = ?auto_43258 ?auto_43262 ) ) ( not ( = ?auto_43254 ?auto_43262 ) ) ( not ( = ?auto_43257 ?auto_43262 ) ) )
    :subtasks
    ( ( !DROP ?auto_43256 ?auto_43254 ?auto_43262 ?auto_43250 )
      ( MAKE-ON ?auto_43248 ?auto_43249 )
      ( MAKE-ON-VERIFY ?auto_43248 ?auto_43249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43263 - SURFACE
      ?auto_43264 - SURFACE
    )
    :vars
    (
      ?auto_43265 - HOIST
      ?auto_43268 - PLACE
      ?auto_43273 - PLACE
      ?auto_43274 - HOIST
      ?auto_43277 - SURFACE
      ?auto_43269 - SURFACE
      ?auto_43276 - PLACE
      ?auto_43275 - HOIST
      ?auto_43267 - SURFACE
      ?auto_43270 - SURFACE
      ?auto_43266 - SURFACE
      ?auto_43271 - TRUCK
      ?auto_43272 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43265 ?auto_43268 ) ( IS-CRATE ?auto_43263 ) ( not ( = ?auto_43263 ?auto_43264 ) ) ( not ( = ?auto_43273 ?auto_43268 ) ) ( HOIST-AT ?auto_43274 ?auto_43273 ) ( not ( = ?auto_43265 ?auto_43274 ) ) ( AVAILABLE ?auto_43274 ) ( SURFACE-AT ?auto_43263 ?auto_43273 ) ( ON ?auto_43263 ?auto_43277 ) ( CLEAR ?auto_43263 ) ( not ( = ?auto_43263 ?auto_43277 ) ) ( not ( = ?auto_43264 ?auto_43277 ) ) ( IS-CRATE ?auto_43264 ) ( not ( = ?auto_43263 ?auto_43269 ) ) ( not ( = ?auto_43264 ?auto_43269 ) ) ( not ( = ?auto_43277 ?auto_43269 ) ) ( not ( = ?auto_43276 ?auto_43268 ) ) ( not ( = ?auto_43273 ?auto_43276 ) ) ( HOIST-AT ?auto_43275 ?auto_43276 ) ( not ( = ?auto_43265 ?auto_43275 ) ) ( not ( = ?auto_43274 ?auto_43275 ) ) ( SURFACE-AT ?auto_43264 ?auto_43276 ) ( ON ?auto_43264 ?auto_43267 ) ( CLEAR ?auto_43264 ) ( not ( = ?auto_43263 ?auto_43267 ) ) ( not ( = ?auto_43264 ?auto_43267 ) ) ( not ( = ?auto_43277 ?auto_43267 ) ) ( not ( = ?auto_43269 ?auto_43267 ) ) ( IS-CRATE ?auto_43269 ) ( not ( = ?auto_43263 ?auto_43270 ) ) ( not ( = ?auto_43264 ?auto_43270 ) ) ( not ( = ?auto_43277 ?auto_43270 ) ) ( not ( = ?auto_43269 ?auto_43270 ) ) ( not ( = ?auto_43267 ?auto_43270 ) ) ( AVAILABLE ?auto_43275 ) ( SURFACE-AT ?auto_43269 ?auto_43276 ) ( ON ?auto_43269 ?auto_43266 ) ( CLEAR ?auto_43269 ) ( not ( = ?auto_43263 ?auto_43266 ) ) ( not ( = ?auto_43264 ?auto_43266 ) ) ( not ( = ?auto_43277 ?auto_43266 ) ) ( not ( = ?auto_43269 ?auto_43266 ) ) ( not ( = ?auto_43267 ?auto_43266 ) ) ( not ( = ?auto_43270 ?auto_43266 ) ) ( TRUCK-AT ?auto_43271 ?auto_43268 ) ( SURFACE-AT ?auto_43272 ?auto_43268 ) ( CLEAR ?auto_43272 ) ( IS-CRATE ?auto_43270 ) ( not ( = ?auto_43263 ?auto_43272 ) ) ( not ( = ?auto_43264 ?auto_43272 ) ) ( not ( = ?auto_43277 ?auto_43272 ) ) ( not ( = ?auto_43269 ?auto_43272 ) ) ( not ( = ?auto_43267 ?auto_43272 ) ) ( not ( = ?auto_43270 ?auto_43272 ) ) ( not ( = ?auto_43266 ?auto_43272 ) ) ( AVAILABLE ?auto_43265 ) ( IN ?auto_43270 ?auto_43271 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43265 ?auto_43270 ?auto_43271 ?auto_43268 )
      ( MAKE-ON ?auto_43263 ?auto_43264 )
      ( MAKE-ON-VERIFY ?auto_43263 ?auto_43264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43278 - SURFACE
      ?auto_43279 - SURFACE
    )
    :vars
    (
      ?auto_43291 - HOIST
      ?auto_43288 - PLACE
      ?auto_43289 - PLACE
      ?auto_43285 - HOIST
      ?auto_43284 - SURFACE
      ?auto_43286 - SURFACE
      ?auto_43290 - PLACE
      ?auto_43281 - HOIST
      ?auto_43283 - SURFACE
      ?auto_43287 - SURFACE
      ?auto_43292 - SURFACE
      ?auto_43282 - SURFACE
      ?auto_43280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43291 ?auto_43288 ) ( IS-CRATE ?auto_43278 ) ( not ( = ?auto_43278 ?auto_43279 ) ) ( not ( = ?auto_43289 ?auto_43288 ) ) ( HOIST-AT ?auto_43285 ?auto_43289 ) ( not ( = ?auto_43291 ?auto_43285 ) ) ( AVAILABLE ?auto_43285 ) ( SURFACE-AT ?auto_43278 ?auto_43289 ) ( ON ?auto_43278 ?auto_43284 ) ( CLEAR ?auto_43278 ) ( not ( = ?auto_43278 ?auto_43284 ) ) ( not ( = ?auto_43279 ?auto_43284 ) ) ( IS-CRATE ?auto_43279 ) ( not ( = ?auto_43278 ?auto_43286 ) ) ( not ( = ?auto_43279 ?auto_43286 ) ) ( not ( = ?auto_43284 ?auto_43286 ) ) ( not ( = ?auto_43290 ?auto_43288 ) ) ( not ( = ?auto_43289 ?auto_43290 ) ) ( HOIST-AT ?auto_43281 ?auto_43290 ) ( not ( = ?auto_43291 ?auto_43281 ) ) ( not ( = ?auto_43285 ?auto_43281 ) ) ( SURFACE-AT ?auto_43279 ?auto_43290 ) ( ON ?auto_43279 ?auto_43283 ) ( CLEAR ?auto_43279 ) ( not ( = ?auto_43278 ?auto_43283 ) ) ( not ( = ?auto_43279 ?auto_43283 ) ) ( not ( = ?auto_43284 ?auto_43283 ) ) ( not ( = ?auto_43286 ?auto_43283 ) ) ( IS-CRATE ?auto_43286 ) ( not ( = ?auto_43278 ?auto_43287 ) ) ( not ( = ?auto_43279 ?auto_43287 ) ) ( not ( = ?auto_43284 ?auto_43287 ) ) ( not ( = ?auto_43286 ?auto_43287 ) ) ( not ( = ?auto_43283 ?auto_43287 ) ) ( AVAILABLE ?auto_43281 ) ( SURFACE-AT ?auto_43286 ?auto_43290 ) ( ON ?auto_43286 ?auto_43292 ) ( CLEAR ?auto_43286 ) ( not ( = ?auto_43278 ?auto_43292 ) ) ( not ( = ?auto_43279 ?auto_43292 ) ) ( not ( = ?auto_43284 ?auto_43292 ) ) ( not ( = ?auto_43286 ?auto_43292 ) ) ( not ( = ?auto_43283 ?auto_43292 ) ) ( not ( = ?auto_43287 ?auto_43292 ) ) ( SURFACE-AT ?auto_43282 ?auto_43288 ) ( CLEAR ?auto_43282 ) ( IS-CRATE ?auto_43287 ) ( not ( = ?auto_43278 ?auto_43282 ) ) ( not ( = ?auto_43279 ?auto_43282 ) ) ( not ( = ?auto_43284 ?auto_43282 ) ) ( not ( = ?auto_43286 ?auto_43282 ) ) ( not ( = ?auto_43283 ?auto_43282 ) ) ( not ( = ?auto_43287 ?auto_43282 ) ) ( not ( = ?auto_43292 ?auto_43282 ) ) ( AVAILABLE ?auto_43291 ) ( IN ?auto_43287 ?auto_43280 ) ( TRUCK-AT ?auto_43280 ?auto_43289 ) )
    :subtasks
    ( ( !DRIVE ?auto_43280 ?auto_43289 ?auto_43288 )
      ( MAKE-ON ?auto_43278 ?auto_43279 )
      ( MAKE-ON-VERIFY ?auto_43278 ?auto_43279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43293 - SURFACE
      ?auto_43294 - SURFACE
    )
    :vars
    (
      ?auto_43304 - HOIST
      ?auto_43296 - PLACE
      ?auto_43301 - PLACE
      ?auto_43300 - HOIST
      ?auto_43297 - SURFACE
      ?auto_43299 - SURFACE
      ?auto_43307 - PLACE
      ?auto_43303 - HOIST
      ?auto_43306 - SURFACE
      ?auto_43302 - SURFACE
      ?auto_43305 - SURFACE
      ?auto_43298 - SURFACE
      ?auto_43295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43304 ?auto_43296 ) ( IS-CRATE ?auto_43293 ) ( not ( = ?auto_43293 ?auto_43294 ) ) ( not ( = ?auto_43301 ?auto_43296 ) ) ( HOIST-AT ?auto_43300 ?auto_43301 ) ( not ( = ?auto_43304 ?auto_43300 ) ) ( SURFACE-AT ?auto_43293 ?auto_43301 ) ( ON ?auto_43293 ?auto_43297 ) ( CLEAR ?auto_43293 ) ( not ( = ?auto_43293 ?auto_43297 ) ) ( not ( = ?auto_43294 ?auto_43297 ) ) ( IS-CRATE ?auto_43294 ) ( not ( = ?auto_43293 ?auto_43299 ) ) ( not ( = ?auto_43294 ?auto_43299 ) ) ( not ( = ?auto_43297 ?auto_43299 ) ) ( not ( = ?auto_43307 ?auto_43296 ) ) ( not ( = ?auto_43301 ?auto_43307 ) ) ( HOIST-AT ?auto_43303 ?auto_43307 ) ( not ( = ?auto_43304 ?auto_43303 ) ) ( not ( = ?auto_43300 ?auto_43303 ) ) ( SURFACE-AT ?auto_43294 ?auto_43307 ) ( ON ?auto_43294 ?auto_43306 ) ( CLEAR ?auto_43294 ) ( not ( = ?auto_43293 ?auto_43306 ) ) ( not ( = ?auto_43294 ?auto_43306 ) ) ( not ( = ?auto_43297 ?auto_43306 ) ) ( not ( = ?auto_43299 ?auto_43306 ) ) ( IS-CRATE ?auto_43299 ) ( not ( = ?auto_43293 ?auto_43302 ) ) ( not ( = ?auto_43294 ?auto_43302 ) ) ( not ( = ?auto_43297 ?auto_43302 ) ) ( not ( = ?auto_43299 ?auto_43302 ) ) ( not ( = ?auto_43306 ?auto_43302 ) ) ( AVAILABLE ?auto_43303 ) ( SURFACE-AT ?auto_43299 ?auto_43307 ) ( ON ?auto_43299 ?auto_43305 ) ( CLEAR ?auto_43299 ) ( not ( = ?auto_43293 ?auto_43305 ) ) ( not ( = ?auto_43294 ?auto_43305 ) ) ( not ( = ?auto_43297 ?auto_43305 ) ) ( not ( = ?auto_43299 ?auto_43305 ) ) ( not ( = ?auto_43306 ?auto_43305 ) ) ( not ( = ?auto_43302 ?auto_43305 ) ) ( SURFACE-AT ?auto_43298 ?auto_43296 ) ( CLEAR ?auto_43298 ) ( IS-CRATE ?auto_43302 ) ( not ( = ?auto_43293 ?auto_43298 ) ) ( not ( = ?auto_43294 ?auto_43298 ) ) ( not ( = ?auto_43297 ?auto_43298 ) ) ( not ( = ?auto_43299 ?auto_43298 ) ) ( not ( = ?auto_43306 ?auto_43298 ) ) ( not ( = ?auto_43302 ?auto_43298 ) ) ( not ( = ?auto_43305 ?auto_43298 ) ) ( AVAILABLE ?auto_43304 ) ( TRUCK-AT ?auto_43295 ?auto_43301 ) ( LIFTING ?auto_43300 ?auto_43302 ) )
    :subtasks
    ( ( !LOAD ?auto_43300 ?auto_43302 ?auto_43295 ?auto_43301 )
      ( MAKE-ON ?auto_43293 ?auto_43294 )
      ( MAKE-ON-VERIFY ?auto_43293 ?auto_43294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43308 - SURFACE
      ?auto_43309 - SURFACE
    )
    :vars
    (
      ?auto_43321 - HOIST
      ?auto_43315 - PLACE
      ?auto_43310 - PLACE
      ?auto_43319 - HOIST
      ?auto_43314 - SURFACE
      ?auto_43318 - SURFACE
      ?auto_43317 - PLACE
      ?auto_43316 - HOIST
      ?auto_43313 - SURFACE
      ?auto_43322 - SURFACE
      ?auto_43312 - SURFACE
      ?auto_43311 - SURFACE
      ?auto_43320 - TRUCK
      ?auto_43323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43321 ?auto_43315 ) ( IS-CRATE ?auto_43308 ) ( not ( = ?auto_43308 ?auto_43309 ) ) ( not ( = ?auto_43310 ?auto_43315 ) ) ( HOIST-AT ?auto_43319 ?auto_43310 ) ( not ( = ?auto_43321 ?auto_43319 ) ) ( SURFACE-AT ?auto_43308 ?auto_43310 ) ( ON ?auto_43308 ?auto_43314 ) ( CLEAR ?auto_43308 ) ( not ( = ?auto_43308 ?auto_43314 ) ) ( not ( = ?auto_43309 ?auto_43314 ) ) ( IS-CRATE ?auto_43309 ) ( not ( = ?auto_43308 ?auto_43318 ) ) ( not ( = ?auto_43309 ?auto_43318 ) ) ( not ( = ?auto_43314 ?auto_43318 ) ) ( not ( = ?auto_43317 ?auto_43315 ) ) ( not ( = ?auto_43310 ?auto_43317 ) ) ( HOIST-AT ?auto_43316 ?auto_43317 ) ( not ( = ?auto_43321 ?auto_43316 ) ) ( not ( = ?auto_43319 ?auto_43316 ) ) ( SURFACE-AT ?auto_43309 ?auto_43317 ) ( ON ?auto_43309 ?auto_43313 ) ( CLEAR ?auto_43309 ) ( not ( = ?auto_43308 ?auto_43313 ) ) ( not ( = ?auto_43309 ?auto_43313 ) ) ( not ( = ?auto_43314 ?auto_43313 ) ) ( not ( = ?auto_43318 ?auto_43313 ) ) ( IS-CRATE ?auto_43318 ) ( not ( = ?auto_43308 ?auto_43322 ) ) ( not ( = ?auto_43309 ?auto_43322 ) ) ( not ( = ?auto_43314 ?auto_43322 ) ) ( not ( = ?auto_43318 ?auto_43322 ) ) ( not ( = ?auto_43313 ?auto_43322 ) ) ( AVAILABLE ?auto_43316 ) ( SURFACE-AT ?auto_43318 ?auto_43317 ) ( ON ?auto_43318 ?auto_43312 ) ( CLEAR ?auto_43318 ) ( not ( = ?auto_43308 ?auto_43312 ) ) ( not ( = ?auto_43309 ?auto_43312 ) ) ( not ( = ?auto_43314 ?auto_43312 ) ) ( not ( = ?auto_43318 ?auto_43312 ) ) ( not ( = ?auto_43313 ?auto_43312 ) ) ( not ( = ?auto_43322 ?auto_43312 ) ) ( SURFACE-AT ?auto_43311 ?auto_43315 ) ( CLEAR ?auto_43311 ) ( IS-CRATE ?auto_43322 ) ( not ( = ?auto_43308 ?auto_43311 ) ) ( not ( = ?auto_43309 ?auto_43311 ) ) ( not ( = ?auto_43314 ?auto_43311 ) ) ( not ( = ?auto_43318 ?auto_43311 ) ) ( not ( = ?auto_43313 ?auto_43311 ) ) ( not ( = ?auto_43322 ?auto_43311 ) ) ( not ( = ?auto_43312 ?auto_43311 ) ) ( AVAILABLE ?auto_43321 ) ( TRUCK-AT ?auto_43320 ?auto_43310 ) ( AVAILABLE ?auto_43319 ) ( SURFACE-AT ?auto_43322 ?auto_43310 ) ( ON ?auto_43322 ?auto_43323 ) ( CLEAR ?auto_43322 ) ( not ( = ?auto_43308 ?auto_43323 ) ) ( not ( = ?auto_43309 ?auto_43323 ) ) ( not ( = ?auto_43314 ?auto_43323 ) ) ( not ( = ?auto_43318 ?auto_43323 ) ) ( not ( = ?auto_43313 ?auto_43323 ) ) ( not ( = ?auto_43322 ?auto_43323 ) ) ( not ( = ?auto_43312 ?auto_43323 ) ) ( not ( = ?auto_43311 ?auto_43323 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43319 ?auto_43322 ?auto_43323 ?auto_43310 )
      ( MAKE-ON ?auto_43308 ?auto_43309 )
      ( MAKE-ON-VERIFY ?auto_43308 ?auto_43309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43324 - SURFACE
      ?auto_43325 - SURFACE
    )
    :vars
    (
      ?auto_43335 - HOIST
      ?auto_43336 - PLACE
      ?auto_43333 - PLACE
      ?auto_43332 - HOIST
      ?auto_43330 - SURFACE
      ?auto_43331 - SURFACE
      ?auto_43334 - PLACE
      ?auto_43337 - HOIST
      ?auto_43326 - SURFACE
      ?auto_43338 - SURFACE
      ?auto_43328 - SURFACE
      ?auto_43339 - SURFACE
      ?auto_43327 - SURFACE
      ?auto_43329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43335 ?auto_43336 ) ( IS-CRATE ?auto_43324 ) ( not ( = ?auto_43324 ?auto_43325 ) ) ( not ( = ?auto_43333 ?auto_43336 ) ) ( HOIST-AT ?auto_43332 ?auto_43333 ) ( not ( = ?auto_43335 ?auto_43332 ) ) ( SURFACE-AT ?auto_43324 ?auto_43333 ) ( ON ?auto_43324 ?auto_43330 ) ( CLEAR ?auto_43324 ) ( not ( = ?auto_43324 ?auto_43330 ) ) ( not ( = ?auto_43325 ?auto_43330 ) ) ( IS-CRATE ?auto_43325 ) ( not ( = ?auto_43324 ?auto_43331 ) ) ( not ( = ?auto_43325 ?auto_43331 ) ) ( not ( = ?auto_43330 ?auto_43331 ) ) ( not ( = ?auto_43334 ?auto_43336 ) ) ( not ( = ?auto_43333 ?auto_43334 ) ) ( HOIST-AT ?auto_43337 ?auto_43334 ) ( not ( = ?auto_43335 ?auto_43337 ) ) ( not ( = ?auto_43332 ?auto_43337 ) ) ( SURFACE-AT ?auto_43325 ?auto_43334 ) ( ON ?auto_43325 ?auto_43326 ) ( CLEAR ?auto_43325 ) ( not ( = ?auto_43324 ?auto_43326 ) ) ( not ( = ?auto_43325 ?auto_43326 ) ) ( not ( = ?auto_43330 ?auto_43326 ) ) ( not ( = ?auto_43331 ?auto_43326 ) ) ( IS-CRATE ?auto_43331 ) ( not ( = ?auto_43324 ?auto_43338 ) ) ( not ( = ?auto_43325 ?auto_43338 ) ) ( not ( = ?auto_43330 ?auto_43338 ) ) ( not ( = ?auto_43331 ?auto_43338 ) ) ( not ( = ?auto_43326 ?auto_43338 ) ) ( AVAILABLE ?auto_43337 ) ( SURFACE-AT ?auto_43331 ?auto_43334 ) ( ON ?auto_43331 ?auto_43328 ) ( CLEAR ?auto_43331 ) ( not ( = ?auto_43324 ?auto_43328 ) ) ( not ( = ?auto_43325 ?auto_43328 ) ) ( not ( = ?auto_43330 ?auto_43328 ) ) ( not ( = ?auto_43331 ?auto_43328 ) ) ( not ( = ?auto_43326 ?auto_43328 ) ) ( not ( = ?auto_43338 ?auto_43328 ) ) ( SURFACE-AT ?auto_43339 ?auto_43336 ) ( CLEAR ?auto_43339 ) ( IS-CRATE ?auto_43338 ) ( not ( = ?auto_43324 ?auto_43339 ) ) ( not ( = ?auto_43325 ?auto_43339 ) ) ( not ( = ?auto_43330 ?auto_43339 ) ) ( not ( = ?auto_43331 ?auto_43339 ) ) ( not ( = ?auto_43326 ?auto_43339 ) ) ( not ( = ?auto_43338 ?auto_43339 ) ) ( not ( = ?auto_43328 ?auto_43339 ) ) ( AVAILABLE ?auto_43335 ) ( AVAILABLE ?auto_43332 ) ( SURFACE-AT ?auto_43338 ?auto_43333 ) ( ON ?auto_43338 ?auto_43327 ) ( CLEAR ?auto_43338 ) ( not ( = ?auto_43324 ?auto_43327 ) ) ( not ( = ?auto_43325 ?auto_43327 ) ) ( not ( = ?auto_43330 ?auto_43327 ) ) ( not ( = ?auto_43331 ?auto_43327 ) ) ( not ( = ?auto_43326 ?auto_43327 ) ) ( not ( = ?auto_43338 ?auto_43327 ) ) ( not ( = ?auto_43328 ?auto_43327 ) ) ( not ( = ?auto_43339 ?auto_43327 ) ) ( TRUCK-AT ?auto_43329 ?auto_43336 ) )
    :subtasks
    ( ( !DRIVE ?auto_43329 ?auto_43336 ?auto_43333 )
      ( MAKE-ON ?auto_43324 ?auto_43325 )
      ( MAKE-ON-VERIFY ?auto_43324 ?auto_43325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43342 - SURFACE
      ?auto_43343 - SURFACE
    )
    :vars
    (
      ?auto_43344 - HOIST
      ?auto_43345 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43344 ?auto_43345 ) ( SURFACE-AT ?auto_43343 ?auto_43345 ) ( CLEAR ?auto_43343 ) ( LIFTING ?auto_43344 ?auto_43342 ) ( IS-CRATE ?auto_43342 ) ( not ( = ?auto_43342 ?auto_43343 ) ) )
    :subtasks
    ( ( !DROP ?auto_43344 ?auto_43342 ?auto_43343 ?auto_43345 )
      ( MAKE-ON-VERIFY ?auto_43342 ?auto_43343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43346 - SURFACE
      ?auto_43347 - SURFACE
    )
    :vars
    (
      ?auto_43348 - HOIST
      ?auto_43349 - PLACE
      ?auto_43350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43348 ?auto_43349 ) ( SURFACE-AT ?auto_43347 ?auto_43349 ) ( CLEAR ?auto_43347 ) ( IS-CRATE ?auto_43346 ) ( not ( = ?auto_43346 ?auto_43347 ) ) ( TRUCK-AT ?auto_43350 ?auto_43349 ) ( AVAILABLE ?auto_43348 ) ( IN ?auto_43346 ?auto_43350 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43348 ?auto_43346 ?auto_43350 ?auto_43349 )
      ( MAKE-ON ?auto_43346 ?auto_43347 )
      ( MAKE-ON-VERIFY ?auto_43346 ?auto_43347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43351 - SURFACE
      ?auto_43352 - SURFACE
    )
    :vars
    (
      ?auto_43355 - HOIST
      ?auto_43353 - PLACE
      ?auto_43354 - TRUCK
      ?auto_43356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43355 ?auto_43353 ) ( SURFACE-AT ?auto_43352 ?auto_43353 ) ( CLEAR ?auto_43352 ) ( IS-CRATE ?auto_43351 ) ( not ( = ?auto_43351 ?auto_43352 ) ) ( AVAILABLE ?auto_43355 ) ( IN ?auto_43351 ?auto_43354 ) ( TRUCK-AT ?auto_43354 ?auto_43356 ) ( not ( = ?auto_43356 ?auto_43353 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43354 ?auto_43356 ?auto_43353 )
      ( MAKE-ON ?auto_43351 ?auto_43352 )
      ( MAKE-ON-VERIFY ?auto_43351 ?auto_43352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43357 - SURFACE
      ?auto_43358 - SURFACE
    )
    :vars
    (
      ?auto_43359 - HOIST
      ?auto_43361 - PLACE
      ?auto_43360 - TRUCK
      ?auto_43362 - PLACE
      ?auto_43363 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43359 ?auto_43361 ) ( SURFACE-AT ?auto_43358 ?auto_43361 ) ( CLEAR ?auto_43358 ) ( IS-CRATE ?auto_43357 ) ( not ( = ?auto_43357 ?auto_43358 ) ) ( AVAILABLE ?auto_43359 ) ( TRUCK-AT ?auto_43360 ?auto_43362 ) ( not ( = ?auto_43362 ?auto_43361 ) ) ( HOIST-AT ?auto_43363 ?auto_43362 ) ( LIFTING ?auto_43363 ?auto_43357 ) ( not ( = ?auto_43359 ?auto_43363 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43363 ?auto_43357 ?auto_43360 ?auto_43362 )
      ( MAKE-ON ?auto_43357 ?auto_43358 )
      ( MAKE-ON-VERIFY ?auto_43357 ?auto_43358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43364 - SURFACE
      ?auto_43365 - SURFACE
    )
    :vars
    (
      ?auto_43370 - HOIST
      ?auto_43368 - PLACE
      ?auto_43366 - TRUCK
      ?auto_43367 - PLACE
      ?auto_43369 - HOIST
      ?auto_43371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43370 ?auto_43368 ) ( SURFACE-AT ?auto_43365 ?auto_43368 ) ( CLEAR ?auto_43365 ) ( IS-CRATE ?auto_43364 ) ( not ( = ?auto_43364 ?auto_43365 ) ) ( AVAILABLE ?auto_43370 ) ( TRUCK-AT ?auto_43366 ?auto_43367 ) ( not ( = ?auto_43367 ?auto_43368 ) ) ( HOIST-AT ?auto_43369 ?auto_43367 ) ( not ( = ?auto_43370 ?auto_43369 ) ) ( AVAILABLE ?auto_43369 ) ( SURFACE-AT ?auto_43364 ?auto_43367 ) ( ON ?auto_43364 ?auto_43371 ) ( CLEAR ?auto_43364 ) ( not ( = ?auto_43364 ?auto_43371 ) ) ( not ( = ?auto_43365 ?auto_43371 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43369 ?auto_43364 ?auto_43371 ?auto_43367 )
      ( MAKE-ON ?auto_43364 ?auto_43365 )
      ( MAKE-ON-VERIFY ?auto_43364 ?auto_43365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43372 - SURFACE
      ?auto_43373 - SURFACE
    )
    :vars
    (
      ?auto_43375 - HOIST
      ?auto_43379 - PLACE
      ?auto_43374 - PLACE
      ?auto_43376 - HOIST
      ?auto_43377 - SURFACE
      ?auto_43378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43375 ?auto_43379 ) ( SURFACE-AT ?auto_43373 ?auto_43379 ) ( CLEAR ?auto_43373 ) ( IS-CRATE ?auto_43372 ) ( not ( = ?auto_43372 ?auto_43373 ) ) ( AVAILABLE ?auto_43375 ) ( not ( = ?auto_43374 ?auto_43379 ) ) ( HOIST-AT ?auto_43376 ?auto_43374 ) ( not ( = ?auto_43375 ?auto_43376 ) ) ( AVAILABLE ?auto_43376 ) ( SURFACE-AT ?auto_43372 ?auto_43374 ) ( ON ?auto_43372 ?auto_43377 ) ( CLEAR ?auto_43372 ) ( not ( = ?auto_43372 ?auto_43377 ) ) ( not ( = ?auto_43373 ?auto_43377 ) ) ( TRUCK-AT ?auto_43378 ?auto_43379 ) )
    :subtasks
    ( ( !DRIVE ?auto_43378 ?auto_43379 ?auto_43374 )
      ( MAKE-ON ?auto_43372 ?auto_43373 )
      ( MAKE-ON-VERIFY ?auto_43372 ?auto_43373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43380 - SURFACE
      ?auto_43381 - SURFACE
    )
    :vars
    (
      ?auto_43383 - HOIST
      ?auto_43387 - PLACE
      ?auto_43382 - PLACE
      ?auto_43386 - HOIST
      ?auto_43385 - SURFACE
      ?auto_43384 - TRUCK
      ?auto_43388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43383 ?auto_43387 ) ( IS-CRATE ?auto_43380 ) ( not ( = ?auto_43380 ?auto_43381 ) ) ( not ( = ?auto_43382 ?auto_43387 ) ) ( HOIST-AT ?auto_43386 ?auto_43382 ) ( not ( = ?auto_43383 ?auto_43386 ) ) ( AVAILABLE ?auto_43386 ) ( SURFACE-AT ?auto_43380 ?auto_43382 ) ( ON ?auto_43380 ?auto_43385 ) ( CLEAR ?auto_43380 ) ( not ( = ?auto_43380 ?auto_43385 ) ) ( not ( = ?auto_43381 ?auto_43385 ) ) ( TRUCK-AT ?auto_43384 ?auto_43387 ) ( SURFACE-AT ?auto_43388 ?auto_43387 ) ( CLEAR ?auto_43388 ) ( LIFTING ?auto_43383 ?auto_43381 ) ( IS-CRATE ?auto_43381 ) ( not ( = ?auto_43380 ?auto_43388 ) ) ( not ( = ?auto_43381 ?auto_43388 ) ) ( not ( = ?auto_43385 ?auto_43388 ) ) )
    :subtasks
    ( ( !DROP ?auto_43383 ?auto_43381 ?auto_43388 ?auto_43387 )
      ( MAKE-ON ?auto_43380 ?auto_43381 )
      ( MAKE-ON-VERIFY ?auto_43380 ?auto_43381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43389 - SURFACE
      ?auto_43390 - SURFACE
    )
    :vars
    (
      ?auto_43395 - HOIST
      ?auto_43396 - PLACE
      ?auto_43392 - PLACE
      ?auto_43397 - HOIST
      ?auto_43394 - SURFACE
      ?auto_43391 - TRUCK
      ?auto_43393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43395 ?auto_43396 ) ( IS-CRATE ?auto_43389 ) ( not ( = ?auto_43389 ?auto_43390 ) ) ( not ( = ?auto_43392 ?auto_43396 ) ) ( HOIST-AT ?auto_43397 ?auto_43392 ) ( not ( = ?auto_43395 ?auto_43397 ) ) ( AVAILABLE ?auto_43397 ) ( SURFACE-AT ?auto_43389 ?auto_43392 ) ( ON ?auto_43389 ?auto_43394 ) ( CLEAR ?auto_43389 ) ( not ( = ?auto_43389 ?auto_43394 ) ) ( not ( = ?auto_43390 ?auto_43394 ) ) ( TRUCK-AT ?auto_43391 ?auto_43396 ) ( SURFACE-AT ?auto_43393 ?auto_43396 ) ( CLEAR ?auto_43393 ) ( IS-CRATE ?auto_43390 ) ( not ( = ?auto_43389 ?auto_43393 ) ) ( not ( = ?auto_43390 ?auto_43393 ) ) ( not ( = ?auto_43394 ?auto_43393 ) ) ( AVAILABLE ?auto_43395 ) ( IN ?auto_43390 ?auto_43391 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43395 ?auto_43390 ?auto_43391 ?auto_43396 )
      ( MAKE-ON ?auto_43389 ?auto_43390 )
      ( MAKE-ON-VERIFY ?auto_43389 ?auto_43390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43398 - SURFACE
      ?auto_43399 - SURFACE
    )
    :vars
    (
      ?auto_43404 - HOIST
      ?auto_43403 - PLACE
      ?auto_43400 - PLACE
      ?auto_43405 - HOIST
      ?auto_43401 - SURFACE
      ?auto_43402 - SURFACE
      ?auto_43406 - TRUCK
      ?auto_43407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43404 ?auto_43403 ) ( IS-CRATE ?auto_43398 ) ( not ( = ?auto_43398 ?auto_43399 ) ) ( not ( = ?auto_43400 ?auto_43403 ) ) ( HOIST-AT ?auto_43405 ?auto_43400 ) ( not ( = ?auto_43404 ?auto_43405 ) ) ( AVAILABLE ?auto_43405 ) ( SURFACE-AT ?auto_43398 ?auto_43400 ) ( ON ?auto_43398 ?auto_43401 ) ( CLEAR ?auto_43398 ) ( not ( = ?auto_43398 ?auto_43401 ) ) ( not ( = ?auto_43399 ?auto_43401 ) ) ( SURFACE-AT ?auto_43402 ?auto_43403 ) ( CLEAR ?auto_43402 ) ( IS-CRATE ?auto_43399 ) ( not ( = ?auto_43398 ?auto_43402 ) ) ( not ( = ?auto_43399 ?auto_43402 ) ) ( not ( = ?auto_43401 ?auto_43402 ) ) ( AVAILABLE ?auto_43404 ) ( IN ?auto_43399 ?auto_43406 ) ( TRUCK-AT ?auto_43406 ?auto_43407 ) ( not ( = ?auto_43407 ?auto_43403 ) ) ( not ( = ?auto_43400 ?auto_43407 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43406 ?auto_43407 ?auto_43403 )
      ( MAKE-ON ?auto_43398 ?auto_43399 )
      ( MAKE-ON-VERIFY ?auto_43398 ?auto_43399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43408 - SURFACE
      ?auto_43409 - SURFACE
    )
    :vars
    (
      ?auto_43415 - HOIST
      ?auto_43411 - PLACE
      ?auto_43416 - PLACE
      ?auto_43412 - HOIST
      ?auto_43413 - SURFACE
      ?auto_43410 - SURFACE
      ?auto_43414 - TRUCK
      ?auto_43417 - PLACE
      ?auto_43418 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43415 ?auto_43411 ) ( IS-CRATE ?auto_43408 ) ( not ( = ?auto_43408 ?auto_43409 ) ) ( not ( = ?auto_43416 ?auto_43411 ) ) ( HOIST-AT ?auto_43412 ?auto_43416 ) ( not ( = ?auto_43415 ?auto_43412 ) ) ( AVAILABLE ?auto_43412 ) ( SURFACE-AT ?auto_43408 ?auto_43416 ) ( ON ?auto_43408 ?auto_43413 ) ( CLEAR ?auto_43408 ) ( not ( = ?auto_43408 ?auto_43413 ) ) ( not ( = ?auto_43409 ?auto_43413 ) ) ( SURFACE-AT ?auto_43410 ?auto_43411 ) ( CLEAR ?auto_43410 ) ( IS-CRATE ?auto_43409 ) ( not ( = ?auto_43408 ?auto_43410 ) ) ( not ( = ?auto_43409 ?auto_43410 ) ) ( not ( = ?auto_43413 ?auto_43410 ) ) ( AVAILABLE ?auto_43415 ) ( TRUCK-AT ?auto_43414 ?auto_43417 ) ( not ( = ?auto_43417 ?auto_43411 ) ) ( not ( = ?auto_43416 ?auto_43417 ) ) ( HOIST-AT ?auto_43418 ?auto_43417 ) ( LIFTING ?auto_43418 ?auto_43409 ) ( not ( = ?auto_43415 ?auto_43418 ) ) ( not ( = ?auto_43412 ?auto_43418 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43418 ?auto_43409 ?auto_43414 ?auto_43417 )
      ( MAKE-ON ?auto_43408 ?auto_43409 )
      ( MAKE-ON-VERIFY ?auto_43408 ?auto_43409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43419 - SURFACE
      ?auto_43420 - SURFACE
    )
    :vars
    (
      ?auto_43422 - HOIST
      ?auto_43428 - PLACE
      ?auto_43426 - PLACE
      ?auto_43424 - HOIST
      ?auto_43423 - SURFACE
      ?auto_43429 - SURFACE
      ?auto_43427 - TRUCK
      ?auto_43425 - PLACE
      ?auto_43421 - HOIST
      ?auto_43430 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43422 ?auto_43428 ) ( IS-CRATE ?auto_43419 ) ( not ( = ?auto_43419 ?auto_43420 ) ) ( not ( = ?auto_43426 ?auto_43428 ) ) ( HOIST-AT ?auto_43424 ?auto_43426 ) ( not ( = ?auto_43422 ?auto_43424 ) ) ( AVAILABLE ?auto_43424 ) ( SURFACE-AT ?auto_43419 ?auto_43426 ) ( ON ?auto_43419 ?auto_43423 ) ( CLEAR ?auto_43419 ) ( not ( = ?auto_43419 ?auto_43423 ) ) ( not ( = ?auto_43420 ?auto_43423 ) ) ( SURFACE-AT ?auto_43429 ?auto_43428 ) ( CLEAR ?auto_43429 ) ( IS-CRATE ?auto_43420 ) ( not ( = ?auto_43419 ?auto_43429 ) ) ( not ( = ?auto_43420 ?auto_43429 ) ) ( not ( = ?auto_43423 ?auto_43429 ) ) ( AVAILABLE ?auto_43422 ) ( TRUCK-AT ?auto_43427 ?auto_43425 ) ( not ( = ?auto_43425 ?auto_43428 ) ) ( not ( = ?auto_43426 ?auto_43425 ) ) ( HOIST-AT ?auto_43421 ?auto_43425 ) ( not ( = ?auto_43422 ?auto_43421 ) ) ( not ( = ?auto_43424 ?auto_43421 ) ) ( AVAILABLE ?auto_43421 ) ( SURFACE-AT ?auto_43420 ?auto_43425 ) ( ON ?auto_43420 ?auto_43430 ) ( CLEAR ?auto_43420 ) ( not ( = ?auto_43419 ?auto_43430 ) ) ( not ( = ?auto_43420 ?auto_43430 ) ) ( not ( = ?auto_43423 ?auto_43430 ) ) ( not ( = ?auto_43429 ?auto_43430 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43421 ?auto_43420 ?auto_43430 ?auto_43425 )
      ( MAKE-ON ?auto_43419 ?auto_43420 )
      ( MAKE-ON-VERIFY ?auto_43419 ?auto_43420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43431 - SURFACE
      ?auto_43432 - SURFACE
    )
    :vars
    (
      ?auto_43439 - HOIST
      ?auto_43435 - PLACE
      ?auto_43434 - PLACE
      ?auto_43441 - HOIST
      ?auto_43437 - SURFACE
      ?auto_43438 - SURFACE
      ?auto_43442 - PLACE
      ?auto_43433 - HOIST
      ?auto_43436 - SURFACE
      ?auto_43440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43439 ?auto_43435 ) ( IS-CRATE ?auto_43431 ) ( not ( = ?auto_43431 ?auto_43432 ) ) ( not ( = ?auto_43434 ?auto_43435 ) ) ( HOIST-AT ?auto_43441 ?auto_43434 ) ( not ( = ?auto_43439 ?auto_43441 ) ) ( AVAILABLE ?auto_43441 ) ( SURFACE-AT ?auto_43431 ?auto_43434 ) ( ON ?auto_43431 ?auto_43437 ) ( CLEAR ?auto_43431 ) ( not ( = ?auto_43431 ?auto_43437 ) ) ( not ( = ?auto_43432 ?auto_43437 ) ) ( SURFACE-AT ?auto_43438 ?auto_43435 ) ( CLEAR ?auto_43438 ) ( IS-CRATE ?auto_43432 ) ( not ( = ?auto_43431 ?auto_43438 ) ) ( not ( = ?auto_43432 ?auto_43438 ) ) ( not ( = ?auto_43437 ?auto_43438 ) ) ( AVAILABLE ?auto_43439 ) ( not ( = ?auto_43442 ?auto_43435 ) ) ( not ( = ?auto_43434 ?auto_43442 ) ) ( HOIST-AT ?auto_43433 ?auto_43442 ) ( not ( = ?auto_43439 ?auto_43433 ) ) ( not ( = ?auto_43441 ?auto_43433 ) ) ( AVAILABLE ?auto_43433 ) ( SURFACE-AT ?auto_43432 ?auto_43442 ) ( ON ?auto_43432 ?auto_43436 ) ( CLEAR ?auto_43432 ) ( not ( = ?auto_43431 ?auto_43436 ) ) ( not ( = ?auto_43432 ?auto_43436 ) ) ( not ( = ?auto_43437 ?auto_43436 ) ) ( not ( = ?auto_43438 ?auto_43436 ) ) ( TRUCK-AT ?auto_43440 ?auto_43435 ) )
    :subtasks
    ( ( !DRIVE ?auto_43440 ?auto_43435 ?auto_43442 )
      ( MAKE-ON ?auto_43431 ?auto_43432 )
      ( MAKE-ON-VERIFY ?auto_43431 ?auto_43432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43443 - SURFACE
      ?auto_43444 - SURFACE
    )
    :vars
    (
      ?auto_43449 - HOIST
      ?auto_43447 - PLACE
      ?auto_43448 - PLACE
      ?auto_43445 - HOIST
      ?auto_43453 - SURFACE
      ?auto_43452 - SURFACE
      ?auto_43446 - PLACE
      ?auto_43450 - HOIST
      ?auto_43454 - SURFACE
      ?auto_43451 - TRUCK
      ?auto_43455 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43449 ?auto_43447 ) ( IS-CRATE ?auto_43443 ) ( not ( = ?auto_43443 ?auto_43444 ) ) ( not ( = ?auto_43448 ?auto_43447 ) ) ( HOIST-AT ?auto_43445 ?auto_43448 ) ( not ( = ?auto_43449 ?auto_43445 ) ) ( AVAILABLE ?auto_43445 ) ( SURFACE-AT ?auto_43443 ?auto_43448 ) ( ON ?auto_43443 ?auto_43453 ) ( CLEAR ?auto_43443 ) ( not ( = ?auto_43443 ?auto_43453 ) ) ( not ( = ?auto_43444 ?auto_43453 ) ) ( IS-CRATE ?auto_43444 ) ( not ( = ?auto_43443 ?auto_43452 ) ) ( not ( = ?auto_43444 ?auto_43452 ) ) ( not ( = ?auto_43453 ?auto_43452 ) ) ( not ( = ?auto_43446 ?auto_43447 ) ) ( not ( = ?auto_43448 ?auto_43446 ) ) ( HOIST-AT ?auto_43450 ?auto_43446 ) ( not ( = ?auto_43449 ?auto_43450 ) ) ( not ( = ?auto_43445 ?auto_43450 ) ) ( AVAILABLE ?auto_43450 ) ( SURFACE-AT ?auto_43444 ?auto_43446 ) ( ON ?auto_43444 ?auto_43454 ) ( CLEAR ?auto_43444 ) ( not ( = ?auto_43443 ?auto_43454 ) ) ( not ( = ?auto_43444 ?auto_43454 ) ) ( not ( = ?auto_43453 ?auto_43454 ) ) ( not ( = ?auto_43452 ?auto_43454 ) ) ( TRUCK-AT ?auto_43451 ?auto_43447 ) ( SURFACE-AT ?auto_43455 ?auto_43447 ) ( CLEAR ?auto_43455 ) ( LIFTING ?auto_43449 ?auto_43452 ) ( IS-CRATE ?auto_43452 ) ( not ( = ?auto_43443 ?auto_43455 ) ) ( not ( = ?auto_43444 ?auto_43455 ) ) ( not ( = ?auto_43453 ?auto_43455 ) ) ( not ( = ?auto_43452 ?auto_43455 ) ) ( not ( = ?auto_43454 ?auto_43455 ) ) )
    :subtasks
    ( ( !DROP ?auto_43449 ?auto_43452 ?auto_43455 ?auto_43447 )
      ( MAKE-ON ?auto_43443 ?auto_43444 )
      ( MAKE-ON-VERIFY ?auto_43443 ?auto_43444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43456 - SURFACE
      ?auto_43457 - SURFACE
    )
    :vars
    (
      ?auto_43461 - HOIST
      ?auto_43467 - PLACE
      ?auto_43462 - PLACE
      ?auto_43468 - HOIST
      ?auto_43458 - SURFACE
      ?auto_43464 - SURFACE
      ?auto_43463 - PLACE
      ?auto_43466 - HOIST
      ?auto_43460 - SURFACE
      ?auto_43465 - TRUCK
      ?auto_43459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43461 ?auto_43467 ) ( IS-CRATE ?auto_43456 ) ( not ( = ?auto_43456 ?auto_43457 ) ) ( not ( = ?auto_43462 ?auto_43467 ) ) ( HOIST-AT ?auto_43468 ?auto_43462 ) ( not ( = ?auto_43461 ?auto_43468 ) ) ( AVAILABLE ?auto_43468 ) ( SURFACE-AT ?auto_43456 ?auto_43462 ) ( ON ?auto_43456 ?auto_43458 ) ( CLEAR ?auto_43456 ) ( not ( = ?auto_43456 ?auto_43458 ) ) ( not ( = ?auto_43457 ?auto_43458 ) ) ( IS-CRATE ?auto_43457 ) ( not ( = ?auto_43456 ?auto_43464 ) ) ( not ( = ?auto_43457 ?auto_43464 ) ) ( not ( = ?auto_43458 ?auto_43464 ) ) ( not ( = ?auto_43463 ?auto_43467 ) ) ( not ( = ?auto_43462 ?auto_43463 ) ) ( HOIST-AT ?auto_43466 ?auto_43463 ) ( not ( = ?auto_43461 ?auto_43466 ) ) ( not ( = ?auto_43468 ?auto_43466 ) ) ( AVAILABLE ?auto_43466 ) ( SURFACE-AT ?auto_43457 ?auto_43463 ) ( ON ?auto_43457 ?auto_43460 ) ( CLEAR ?auto_43457 ) ( not ( = ?auto_43456 ?auto_43460 ) ) ( not ( = ?auto_43457 ?auto_43460 ) ) ( not ( = ?auto_43458 ?auto_43460 ) ) ( not ( = ?auto_43464 ?auto_43460 ) ) ( TRUCK-AT ?auto_43465 ?auto_43467 ) ( SURFACE-AT ?auto_43459 ?auto_43467 ) ( CLEAR ?auto_43459 ) ( IS-CRATE ?auto_43464 ) ( not ( = ?auto_43456 ?auto_43459 ) ) ( not ( = ?auto_43457 ?auto_43459 ) ) ( not ( = ?auto_43458 ?auto_43459 ) ) ( not ( = ?auto_43464 ?auto_43459 ) ) ( not ( = ?auto_43460 ?auto_43459 ) ) ( AVAILABLE ?auto_43461 ) ( IN ?auto_43464 ?auto_43465 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43461 ?auto_43464 ?auto_43465 ?auto_43467 )
      ( MAKE-ON ?auto_43456 ?auto_43457 )
      ( MAKE-ON-VERIFY ?auto_43456 ?auto_43457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43469 - SURFACE
      ?auto_43470 - SURFACE
    )
    :vars
    (
      ?auto_43472 - HOIST
      ?auto_43474 - PLACE
      ?auto_43471 - PLACE
      ?auto_43476 - HOIST
      ?auto_43475 - SURFACE
      ?auto_43473 - SURFACE
      ?auto_43479 - PLACE
      ?auto_43478 - HOIST
      ?auto_43481 - SURFACE
      ?auto_43477 - SURFACE
      ?auto_43480 - TRUCK
      ?auto_43482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43472 ?auto_43474 ) ( IS-CRATE ?auto_43469 ) ( not ( = ?auto_43469 ?auto_43470 ) ) ( not ( = ?auto_43471 ?auto_43474 ) ) ( HOIST-AT ?auto_43476 ?auto_43471 ) ( not ( = ?auto_43472 ?auto_43476 ) ) ( AVAILABLE ?auto_43476 ) ( SURFACE-AT ?auto_43469 ?auto_43471 ) ( ON ?auto_43469 ?auto_43475 ) ( CLEAR ?auto_43469 ) ( not ( = ?auto_43469 ?auto_43475 ) ) ( not ( = ?auto_43470 ?auto_43475 ) ) ( IS-CRATE ?auto_43470 ) ( not ( = ?auto_43469 ?auto_43473 ) ) ( not ( = ?auto_43470 ?auto_43473 ) ) ( not ( = ?auto_43475 ?auto_43473 ) ) ( not ( = ?auto_43479 ?auto_43474 ) ) ( not ( = ?auto_43471 ?auto_43479 ) ) ( HOIST-AT ?auto_43478 ?auto_43479 ) ( not ( = ?auto_43472 ?auto_43478 ) ) ( not ( = ?auto_43476 ?auto_43478 ) ) ( AVAILABLE ?auto_43478 ) ( SURFACE-AT ?auto_43470 ?auto_43479 ) ( ON ?auto_43470 ?auto_43481 ) ( CLEAR ?auto_43470 ) ( not ( = ?auto_43469 ?auto_43481 ) ) ( not ( = ?auto_43470 ?auto_43481 ) ) ( not ( = ?auto_43475 ?auto_43481 ) ) ( not ( = ?auto_43473 ?auto_43481 ) ) ( SURFACE-AT ?auto_43477 ?auto_43474 ) ( CLEAR ?auto_43477 ) ( IS-CRATE ?auto_43473 ) ( not ( = ?auto_43469 ?auto_43477 ) ) ( not ( = ?auto_43470 ?auto_43477 ) ) ( not ( = ?auto_43475 ?auto_43477 ) ) ( not ( = ?auto_43473 ?auto_43477 ) ) ( not ( = ?auto_43481 ?auto_43477 ) ) ( AVAILABLE ?auto_43472 ) ( IN ?auto_43473 ?auto_43480 ) ( TRUCK-AT ?auto_43480 ?auto_43482 ) ( not ( = ?auto_43482 ?auto_43474 ) ) ( not ( = ?auto_43471 ?auto_43482 ) ) ( not ( = ?auto_43479 ?auto_43482 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43480 ?auto_43482 ?auto_43474 )
      ( MAKE-ON ?auto_43469 ?auto_43470 )
      ( MAKE-ON-VERIFY ?auto_43469 ?auto_43470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43483 - SURFACE
      ?auto_43484 - SURFACE
    )
    :vars
    (
      ?auto_43492 - HOIST
      ?auto_43488 - PLACE
      ?auto_43494 - PLACE
      ?auto_43490 - HOIST
      ?auto_43491 - SURFACE
      ?auto_43486 - SURFACE
      ?auto_43487 - PLACE
      ?auto_43495 - HOIST
      ?auto_43485 - SURFACE
      ?auto_43493 - SURFACE
      ?auto_43496 - TRUCK
      ?auto_43489 - PLACE
      ?auto_43497 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43492 ?auto_43488 ) ( IS-CRATE ?auto_43483 ) ( not ( = ?auto_43483 ?auto_43484 ) ) ( not ( = ?auto_43494 ?auto_43488 ) ) ( HOIST-AT ?auto_43490 ?auto_43494 ) ( not ( = ?auto_43492 ?auto_43490 ) ) ( AVAILABLE ?auto_43490 ) ( SURFACE-AT ?auto_43483 ?auto_43494 ) ( ON ?auto_43483 ?auto_43491 ) ( CLEAR ?auto_43483 ) ( not ( = ?auto_43483 ?auto_43491 ) ) ( not ( = ?auto_43484 ?auto_43491 ) ) ( IS-CRATE ?auto_43484 ) ( not ( = ?auto_43483 ?auto_43486 ) ) ( not ( = ?auto_43484 ?auto_43486 ) ) ( not ( = ?auto_43491 ?auto_43486 ) ) ( not ( = ?auto_43487 ?auto_43488 ) ) ( not ( = ?auto_43494 ?auto_43487 ) ) ( HOIST-AT ?auto_43495 ?auto_43487 ) ( not ( = ?auto_43492 ?auto_43495 ) ) ( not ( = ?auto_43490 ?auto_43495 ) ) ( AVAILABLE ?auto_43495 ) ( SURFACE-AT ?auto_43484 ?auto_43487 ) ( ON ?auto_43484 ?auto_43485 ) ( CLEAR ?auto_43484 ) ( not ( = ?auto_43483 ?auto_43485 ) ) ( not ( = ?auto_43484 ?auto_43485 ) ) ( not ( = ?auto_43491 ?auto_43485 ) ) ( not ( = ?auto_43486 ?auto_43485 ) ) ( SURFACE-AT ?auto_43493 ?auto_43488 ) ( CLEAR ?auto_43493 ) ( IS-CRATE ?auto_43486 ) ( not ( = ?auto_43483 ?auto_43493 ) ) ( not ( = ?auto_43484 ?auto_43493 ) ) ( not ( = ?auto_43491 ?auto_43493 ) ) ( not ( = ?auto_43486 ?auto_43493 ) ) ( not ( = ?auto_43485 ?auto_43493 ) ) ( AVAILABLE ?auto_43492 ) ( TRUCK-AT ?auto_43496 ?auto_43489 ) ( not ( = ?auto_43489 ?auto_43488 ) ) ( not ( = ?auto_43494 ?auto_43489 ) ) ( not ( = ?auto_43487 ?auto_43489 ) ) ( HOIST-AT ?auto_43497 ?auto_43489 ) ( LIFTING ?auto_43497 ?auto_43486 ) ( not ( = ?auto_43492 ?auto_43497 ) ) ( not ( = ?auto_43490 ?auto_43497 ) ) ( not ( = ?auto_43495 ?auto_43497 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43497 ?auto_43486 ?auto_43496 ?auto_43489 )
      ( MAKE-ON ?auto_43483 ?auto_43484 )
      ( MAKE-ON-VERIFY ?auto_43483 ?auto_43484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43498 - SURFACE
      ?auto_43499 - SURFACE
    )
    :vars
    (
      ?auto_43502 - HOIST
      ?auto_43500 - PLACE
      ?auto_43512 - PLACE
      ?auto_43511 - HOIST
      ?auto_43510 - SURFACE
      ?auto_43501 - SURFACE
      ?auto_43506 - PLACE
      ?auto_43508 - HOIST
      ?auto_43507 - SURFACE
      ?auto_43503 - SURFACE
      ?auto_43505 - TRUCK
      ?auto_43504 - PLACE
      ?auto_43509 - HOIST
      ?auto_43513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43502 ?auto_43500 ) ( IS-CRATE ?auto_43498 ) ( not ( = ?auto_43498 ?auto_43499 ) ) ( not ( = ?auto_43512 ?auto_43500 ) ) ( HOIST-AT ?auto_43511 ?auto_43512 ) ( not ( = ?auto_43502 ?auto_43511 ) ) ( AVAILABLE ?auto_43511 ) ( SURFACE-AT ?auto_43498 ?auto_43512 ) ( ON ?auto_43498 ?auto_43510 ) ( CLEAR ?auto_43498 ) ( not ( = ?auto_43498 ?auto_43510 ) ) ( not ( = ?auto_43499 ?auto_43510 ) ) ( IS-CRATE ?auto_43499 ) ( not ( = ?auto_43498 ?auto_43501 ) ) ( not ( = ?auto_43499 ?auto_43501 ) ) ( not ( = ?auto_43510 ?auto_43501 ) ) ( not ( = ?auto_43506 ?auto_43500 ) ) ( not ( = ?auto_43512 ?auto_43506 ) ) ( HOIST-AT ?auto_43508 ?auto_43506 ) ( not ( = ?auto_43502 ?auto_43508 ) ) ( not ( = ?auto_43511 ?auto_43508 ) ) ( AVAILABLE ?auto_43508 ) ( SURFACE-AT ?auto_43499 ?auto_43506 ) ( ON ?auto_43499 ?auto_43507 ) ( CLEAR ?auto_43499 ) ( not ( = ?auto_43498 ?auto_43507 ) ) ( not ( = ?auto_43499 ?auto_43507 ) ) ( not ( = ?auto_43510 ?auto_43507 ) ) ( not ( = ?auto_43501 ?auto_43507 ) ) ( SURFACE-AT ?auto_43503 ?auto_43500 ) ( CLEAR ?auto_43503 ) ( IS-CRATE ?auto_43501 ) ( not ( = ?auto_43498 ?auto_43503 ) ) ( not ( = ?auto_43499 ?auto_43503 ) ) ( not ( = ?auto_43510 ?auto_43503 ) ) ( not ( = ?auto_43501 ?auto_43503 ) ) ( not ( = ?auto_43507 ?auto_43503 ) ) ( AVAILABLE ?auto_43502 ) ( TRUCK-AT ?auto_43505 ?auto_43504 ) ( not ( = ?auto_43504 ?auto_43500 ) ) ( not ( = ?auto_43512 ?auto_43504 ) ) ( not ( = ?auto_43506 ?auto_43504 ) ) ( HOIST-AT ?auto_43509 ?auto_43504 ) ( not ( = ?auto_43502 ?auto_43509 ) ) ( not ( = ?auto_43511 ?auto_43509 ) ) ( not ( = ?auto_43508 ?auto_43509 ) ) ( AVAILABLE ?auto_43509 ) ( SURFACE-AT ?auto_43501 ?auto_43504 ) ( ON ?auto_43501 ?auto_43513 ) ( CLEAR ?auto_43501 ) ( not ( = ?auto_43498 ?auto_43513 ) ) ( not ( = ?auto_43499 ?auto_43513 ) ) ( not ( = ?auto_43510 ?auto_43513 ) ) ( not ( = ?auto_43501 ?auto_43513 ) ) ( not ( = ?auto_43507 ?auto_43513 ) ) ( not ( = ?auto_43503 ?auto_43513 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43509 ?auto_43501 ?auto_43513 ?auto_43504 )
      ( MAKE-ON ?auto_43498 ?auto_43499 )
      ( MAKE-ON-VERIFY ?auto_43498 ?auto_43499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43514 - SURFACE
      ?auto_43515 - SURFACE
    )
    :vars
    (
      ?auto_43520 - HOIST
      ?auto_43528 - PLACE
      ?auto_43518 - PLACE
      ?auto_43527 - HOIST
      ?auto_43522 - SURFACE
      ?auto_43526 - SURFACE
      ?auto_43516 - PLACE
      ?auto_43519 - HOIST
      ?auto_43517 - SURFACE
      ?auto_43524 - SURFACE
      ?auto_43521 - PLACE
      ?auto_43529 - HOIST
      ?auto_43525 - SURFACE
      ?auto_43523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43520 ?auto_43528 ) ( IS-CRATE ?auto_43514 ) ( not ( = ?auto_43514 ?auto_43515 ) ) ( not ( = ?auto_43518 ?auto_43528 ) ) ( HOIST-AT ?auto_43527 ?auto_43518 ) ( not ( = ?auto_43520 ?auto_43527 ) ) ( AVAILABLE ?auto_43527 ) ( SURFACE-AT ?auto_43514 ?auto_43518 ) ( ON ?auto_43514 ?auto_43522 ) ( CLEAR ?auto_43514 ) ( not ( = ?auto_43514 ?auto_43522 ) ) ( not ( = ?auto_43515 ?auto_43522 ) ) ( IS-CRATE ?auto_43515 ) ( not ( = ?auto_43514 ?auto_43526 ) ) ( not ( = ?auto_43515 ?auto_43526 ) ) ( not ( = ?auto_43522 ?auto_43526 ) ) ( not ( = ?auto_43516 ?auto_43528 ) ) ( not ( = ?auto_43518 ?auto_43516 ) ) ( HOIST-AT ?auto_43519 ?auto_43516 ) ( not ( = ?auto_43520 ?auto_43519 ) ) ( not ( = ?auto_43527 ?auto_43519 ) ) ( AVAILABLE ?auto_43519 ) ( SURFACE-AT ?auto_43515 ?auto_43516 ) ( ON ?auto_43515 ?auto_43517 ) ( CLEAR ?auto_43515 ) ( not ( = ?auto_43514 ?auto_43517 ) ) ( not ( = ?auto_43515 ?auto_43517 ) ) ( not ( = ?auto_43522 ?auto_43517 ) ) ( not ( = ?auto_43526 ?auto_43517 ) ) ( SURFACE-AT ?auto_43524 ?auto_43528 ) ( CLEAR ?auto_43524 ) ( IS-CRATE ?auto_43526 ) ( not ( = ?auto_43514 ?auto_43524 ) ) ( not ( = ?auto_43515 ?auto_43524 ) ) ( not ( = ?auto_43522 ?auto_43524 ) ) ( not ( = ?auto_43526 ?auto_43524 ) ) ( not ( = ?auto_43517 ?auto_43524 ) ) ( AVAILABLE ?auto_43520 ) ( not ( = ?auto_43521 ?auto_43528 ) ) ( not ( = ?auto_43518 ?auto_43521 ) ) ( not ( = ?auto_43516 ?auto_43521 ) ) ( HOIST-AT ?auto_43529 ?auto_43521 ) ( not ( = ?auto_43520 ?auto_43529 ) ) ( not ( = ?auto_43527 ?auto_43529 ) ) ( not ( = ?auto_43519 ?auto_43529 ) ) ( AVAILABLE ?auto_43529 ) ( SURFACE-AT ?auto_43526 ?auto_43521 ) ( ON ?auto_43526 ?auto_43525 ) ( CLEAR ?auto_43526 ) ( not ( = ?auto_43514 ?auto_43525 ) ) ( not ( = ?auto_43515 ?auto_43525 ) ) ( not ( = ?auto_43522 ?auto_43525 ) ) ( not ( = ?auto_43526 ?auto_43525 ) ) ( not ( = ?auto_43517 ?auto_43525 ) ) ( not ( = ?auto_43524 ?auto_43525 ) ) ( TRUCK-AT ?auto_43523 ?auto_43528 ) )
    :subtasks
    ( ( !DRIVE ?auto_43523 ?auto_43528 ?auto_43521 )
      ( MAKE-ON ?auto_43514 ?auto_43515 )
      ( MAKE-ON-VERIFY ?auto_43514 ?auto_43515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43530 - SURFACE
      ?auto_43531 - SURFACE
    )
    :vars
    (
      ?auto_43542 - HOIST
      ?auto_43535 - PLACE
      ?auto_43545 - PLACE
      ?auto_43544 - HOIST
      ?auto_43538 - SURFACE
      ?auto_43539 - SURFACE
      ?auto_43533 - PLACE
      ?auto_43537 - HOIST
      ?auto_43532 - SURFACE
      ?auto_43543 - SURFACE
      ?auto_43540 - PLACE
      ?auto_43536 - HOIST
      ?auto_43541 - SURFACE
      ?auto_43534 - TRUCK
      ?auto_43546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43542 ?auto_43535 ) ( IS-CRATE ?auto_43530 ) ( not ( = ?auto_43530 ?auto_43531 ) ) ( not ( = ?auto_43545 ?auto_43535 ) ) ( HOIST-AT ?auto_43544 ?auto_43545 ) ( not ( = ?auto_43542 ?auto_43544 ) ) ( AVAILABLE ?auto_43544 ) ( SURFACE-AT ?auto_43530 ?auto_43545 ) ( ON ?auto_43530 ?auto_43538 ) ( CLEAR ?auto_43530 ) ( not ( = ?auto_43530 ?auto_43538 ) ) ( not ( = ?auto_43531 ?auto_43538 ) ) ( IS-CRATE ?auto_43531 ) ( not ( = ?auto_43530 ?auto_43539 ) ) ( not ( = ?auto_43531 ?auto_43539 ) ) ( not ( = ?auto_43538 ?auto_43539 ) ) ( not ( = ?auto_43533 ?auto_43535 ) ) ( not ( = ?auto_43545 ?auto_43533 ) ) ( HOIST-AT ?auto_43537 ?auto_43533 ) ( not ( = ?auto_43542 ?auto_43537 ) ) ( not ( = ?auto_43544 ?auto_43537 ) ) ( AVAILABLE ?auto_43537 ) ( SURFACE-AT ?auto_43531 ?auto_43533 ) ( ON ?auto_43531 ?auto_43532 ) ( CLEAR ?auto_43531 ) ( not ( = ?auto_43530 ?auto_43532 ) ) ( not ( = ?auto_43531 ?auto_43532 ) ) ( not ( = ?auto_43538 ?auto_43532 ) ) ( not ( = ?auto_43539 ?auto_43532 ) ) ( IS-CRATE ?auto_43539 ) ( not ( = ?auto_43530 ?auto_43543 ) ) ( not ( = ?auto_43531 ?auto_43543 ) ) ( not ( = ?auto_43538 ?auto_43543 ) ) ( not ( = ?auto_43539 ?auto_43543 ) ) ( not ( = ?auto_43532 ?auto_43543 ) ) ( not ( = ?auto_43540 ?auto_43535 ) ) ( not ( = ?auto_43545 ?auto_43540 ) ) ( not ( = ?auto_43533 ?auto_43540 ) ) ( HOIST-AT ?auto_43536 ?auto_43540 ) ( not ( = ?auto_43542 ?auto_43536 ) ) ( not ( = ?auto_43544 ?auto_43536 ) ) ( not ( = ?auto_43537 ?auto_43536 ) ) ( AVAILABLE ?auto_43536 ) ( SURFACE-AT ?auto_43539 ?auto_43540 ) ( ON ?auto_43539 ?auto_43541 ) ( CLEAR ?auto_43539 ) ( not ( = ?auto_43530 ?auto_43541 ) ) ( not ( = ?auto_43531 ?auto_43541 ) ) ( not ( = ?auto_43538 ?auto_43541 ) ) ( not ( = ?auto_43539 ?auto_43541 ) ) ( not ( = ?auto_43532 ?auto_43541 ) ) ( not ( = ?auto_43543 ?auto_43541 ) ) ( TRUCK-AT ?auto_43534 ?auto_43535 ) ( SURFACE-AT ?auto_43546 ?auto_43535 ) ( CLEAR ?auto_43546 ) ( LIFTING ?auto_43542 ?auto_43543 ) ( IS-CRATE ?auto_43543 ) ( not ( = ?auto_43530 ?auto_43546 ) ) ( not ( = ?auto_43531 ?auto_43546 ) ) ( not ( = ?auto_43538 ?auto_43546 ) ) ( not ( = ?auto_43539 ?auto_43546 ) ) ( not ( = ?auto_43532 ?auto_43546 ) ) ( not ( = ?auto_43543 ?auto_43546 ) ) ( not ( = ?auto_43541 ?auto_43546 ) ) )
    :subtasks
    ( ( !DROP ?auto_43542 ?auto_43543 ?auto_43546 ?auto_43535 )
      ( MAKE-ON ?auto_43530 ?auto_43531 )
      ( MAKE-ON-VERIFY ?auto_43530 ?auto_43531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43547 - SURFACE
      ?auto_43548 - SURFACE
    )
    :vars
    (
      ?auto_43563 - HOIST
      ?auto_43551 - PLACE
      ?auto_43549 - PLACE
      ?auto_43562 - HOIST
      ?auto_43557 - SURFACE
      ?auto_43559 - SURFACE
      ?auto_43550 - PLACE
      ?auto_43556 - HOIST
      ?auto_43554 - SURFACE
      ?auto_43555 - SURFACE
      ?auto_43552 - PLACE
      ?auto_43560 - HOIST
      ?auto_43553 - SURFACE
      ?auto_43561 - TRUCK
      ?auto_43558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43563 ?auto_43551 ) ( IS-CRATE ?auto_43547 ) ( not ( = ?auto_43547 ?auto_43548 ) ) ( not ( = ?auto_43549 ?auto_43551 ) ) ( HOIST-AT ?auto_43562 ?auto_43549 ) ( not ( = ?auto_43563 ?auto_43562 ) ) ( AVAILABLE ?auto_43562 ) ( SURFACE-AT ?auto_43547 ?auto_43549 ) ( ON ?auto_43547 ?auto_43557 ) ( CLEAR ?auto_43547 ) ( not ( = ?auto_43547 ?auto_43557 ) ) ( not ( = ?auto_43548 ?auto_43557 ) ) ( IS-CRATE ?auto_43548 ) ( not ( = ?auto_43547 ?auto_43559 ) ) ( not ( = ?auto_43548 ?auto_43559 ) ) ( not ( = ?auto_43557 ?auto_43559 ) ) ( not ( = ?auto_43550 ?auto_43551 ) ) ( not ( = ?auto_43549 ?auto_43550 ) ) ( HOIST-AT ?auto_43556 ?auto_43550 ) ( not ( = ?auto_43563 ?auto_43556 ) ) ( not ( = ?auto_43562 ?auto_43556 ) ) ( AVAILABLE ?auto_43556 ) ( SURFACE-AT ?auto_43548 ?auto_43550 ) ( ON ?auto_43548 ?auto_43554 ) ( CLEAR ?auto_43548 ) ( not ( = ?auto_43547 ?auto_43554 ) ) ( not ( = ?auto_43548 ?auto_43554 ) ) ( not ( = ?auto_43557 ?auto_43554 ) ) ( not ( = ?auto_43559 ?auto_43554 ) ) ( IS-CRATE ?auto_43559 ) ( not ( = ?auto_43547 ?auto_43555 ) ) ( not ( = ?auto_43548 ?auto_43555 ) ) ( not ( = ?auto_43557 ?auto_43555 ) ) ( not ( = ?auto_43559 ?auto_43555 ) ) ( not ( = ?auto_43554 ?auto_43555 ) ) ( not ( = ?auto_43552 ?auto_43551 ) ) ( not ( = ?auto_43549 ?auto_43552 ) ) ( not ( = ?auto_43550 ?auto_43552 ) ) ( HOIST-AT ?auto_43560 ?auto_43552 ) ( not ( = ?auto_43563 ?auto_43560 ) ) ( not ( = ?auto_43562 ?auto_43560 ) ) ( not ( = ?auto_43556 ?auto_43560 ) ) ( AVAILABLE ?auto_43560 ) ( SURFACE-AT ?auto_43559 ?auto_43552 ) ( ON ?auto_43559 ?auto_43553 ) ( CLEAR ?auto_43559 ) ( not ( = ?auto_43547 ?auto_43553 ) ) ( not ( = ?auto_43548 ?auto_43553 ) ) ( not ( = ?auto_43557 ?auto_43553 ) ) ( not ( = ?auto_43559 ?auto_43553 ) ) ( not ( = ?auto_43554 ?auto_43553 ) ) ( not ( = ?auto_43555 ?auto_43553 ) ) ( TRUCK-AT ?auto_43561 ?auto_43551 ) ( SURFACE-AT ?auto_43558 ?auto_43551 ) ( CLEAR ?auto_43558 ) ( IS-CRATE ?auto_43555 ) ( not ( = ?auto_43547 ?auto_43558 ) ) ( not ( = ?auto_43548 ?auto_43558 ) ) ( not ( = ?auto_43557 ?auto_43558 ) ) ( not ( = ?auto_43559 ?auto_43558 ) ) ( not ( = ?auto_43554 ?auto_43558 ) ) ( not ( = ?auto_43555 ?auto_43558 ) ) ( not ( = ?auto_43553 ?auto_43558 ) ) ( AVAILABLE ?auto_43563 ) ( IN ?auto_43555 ?auto_43561 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43563 ?auto_43555 ?auto_43561 ?auto_43551 )
      ( MAKE-ON ?auto_43547 ?auto_43548 )
      ( MAKE-ON-VERIFY ?auto_43547 ?auto_43548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43564 - SURFACE
      ?auto_43565 - SURFACE
    )
    :vars
    (
      ?auto_43578 - HOIST
      ?auto_43570 - PLACE
      ?auto_43568 - PLACE
      ?auto_43573 - HOIST
      ?auto_43566 - SURFACE
      ?auto_43580 - SURFACE
      ?auto_43572 - PLACE
      ?auto_43575 - HOIST
      ?auto_43576 - SURFACE
      ?auto_43574 - SURFACE
      ?auto_43569 - PLACE
      ?auto_43577 - HOIST
      ?auto_43579 - SURFACE
      ?auto_43567 - SURFACE
      ?auto_43571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43578 ?auto_43570 ) ( IS-CRATE ?auto_43564 ) ( not ( = ?auto_43564 ?auto_43565 ) ) ( not ( = ?auto_43568 ?auto_43570 ) ) ( HOIST-AT ?auto_43573 ?auto_43568 ) ( not ( = ?auto_43578 ?auto_43573 ) ) ( AVAILABLE ?auto_43573 ) ( SURFACE-AT ?auto_43564 ?auto_43568 ) ( ON ?auto_43564 ?auto_43566 ) ( CLEAR ?auto_43564 ) ( not ( = ?auto_43564 ?auto_43566 ) ) ( not ( = ?auto_43565 ?auto_43566 ) ) ( IS-CRATE ?auto_43565 ) ( not ( = ?auto_43564 ?auto_43580 ) ) ( not ( = ?auto_43565 ?auto_43580 ) ) ( not ( = ?auto_43566 ?auto_43580 ) ) ( not ( = ?auto_43572 ?auto_43570 ) ) ( not ( = ?auto_43568 ?auto_43572 ) ) ( HOIST-AT ?auto_43575 ?auto_43572 ) ( not ( = ?auto_43578 ?auto_43575 ) ) ( not ( = ?auto_43573 ?auto_43575 ) ) ( AVAILABLE ?auto_43575 ) ( SURFACE-AT ?auto_43565 ?auto_43572 ) ( ON ?auto_43565 ?auto_43576 ) ( CLEAR ?auto_43565 ) ( not ( = ?auto_43564 ?auto_43576 ) ) ( not ( = ?auto_43565 ?auto_43576 ) ) ( not ( = ?auto_43566 ?auto_43576 ) ) ( not ( = ?auto_43580 ?auto_43576 ) ) ( IS-CRATE ?auto_43580 ) ( not ( = ?auto_43564 ?auto_43574 ) ) ( not ( = ?auto_43565 ?auto_43574 ) ) ( not ( = ?auto_43566 ?auto_43574 ) ) ( not ( = ?auto_43580 ?auto_43574 ) ) ( not ( = ?auto_43576 ?auto_43574 ) ) ( not ( = ?auto_43569 ?auto_43570 ) ) ( not ( = ?auto_43568 ?auto_43569 ) ) ( not ( = ?auto_43572 ?auto_43569 ) ) ( HOIST-AT ?auto_43577 ?auto_43569 ) ( not ( = ?auto_43578 ?auto_43577 ) ) ( not ( = ?auto_43573 ?auto_43577 ) ) ( not ( = ?auto_43575 ?auto_43577 ) ) ( AVAILABLE ?auto_43577 ) ( SURFACE-AT ?auto_43580 ?auto_43569 ) ( ON ?auto_43580 ?auto_43579 ) ( CLEAR ?auto_43580 ) ( not ( = ?auto_43564 ?auto_43579 ) ) ( not ( = ?auto_43565 ?auto_43579 ) ) ( not ( = ?auto_43566 ?auto_43579 ) ) ( not ( = ?auto_43580 ?auto_43579 ) ) ( not ( = ?auto_43576 ?auto_43579 ) ) ( not ( = ?auto_43574 ?auto_43579 ) ) ( SURFACE-AT ?auto_43567 ?auto_43570 ) ( CLEAR ?auto_43567 ) ( IS-CRATE ?auto_43574 ) ( not ( = ?auto_43564 ?auto_43567 ) ) ( not ( = ?auto_43565 ?auto_43567 ) ) ( not ( = ?auto_43566 ?auto_43567 ) ) ( not ( = ?auto_43580 ?auto_43567 ) ) ( not ( = ?auto_43576 ?auto_43567 ) ) ( not ( = ?auto_43574 ?auto_43567 ) ) ( not ( = ?auto_43579 ?auto_43567 ) ) ( AVAILABLE ?auto_43578 ) ( IN ?auto_43574 ?auto_43571 ) ( TRUCK-AT ?auto_43571 ?auto_43569 ) )
    :subtasks
    ( ( !DRIVE ?auto_43571 ?auto_43569 ?auto_43570 )
      ( MAKE-ON ?auto_43564 ?auto_43565 )
      ( MAKE-ON-VERIFY ?auto_43564 ?auto_43565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43581 - SURFACE
      ?auto_43582 - SURFACE
    )
    :vars
    (
      ?auto_43587 - HOIST
      ?auto_43590 - PLACE
      ?auto_43596 - PLACE
      ?auto_43591 - HOIST
      ?auto_43589 - SURFACE
      ?auto_43588 - SURFACE
      ?auto_43586 - PLACE
      ?auto_43592 - HOIST
      ?auto_43585 - SURFACE
      ?auto_43583 - SURFACE
      ?auto_43584 - PLACE
      ?auto_43593 - HOIST
      ?auto_43594 - SURFACE
      ?auto_43595 - SURFACE
      ?auto_43597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43587 ?auto_43590 ) ( IS-CRATE ?auto_43581 ) ( not ( = ?auto_43581 ?auto_43582 ) ) ( not ( = ?auto_43596 ?auto_43590 ) ) ( HOIST-AT ?auto_43591 ?auto_43596 ) ( not ( = ?auto_43587 ?auto_43591 ) ) ( AVAILABLE ?auto_43591 ) ( SURFACE-AT ?auto_43581 ?auto_43596 ) ( ON ?auto_43581 ?auto_43589 ) ( CLEAR ?auto_43581 ) ( not ( = ?auto_43581 ?auto_43589 ) ) ( not ( = ?auto_43582 ?auto_43589 ) ) ( IS-CRATE ?auto_43582 ) ( not ( = ?auto_43581 ?auto_43588 ) ) ( not ( = ?auto_43582 ?auto_43588 ) ) ( not ( = ?auto_43589 ?auto_43588 ) ) ( not ( = ?auto_43586 ?auto_43590 ) ) ( not ( = ?auto_43596 ?auto_43586 ) ) ( HOIST-AT ?auto_43592 ?auto_43586 ) ( not ( = ?auto_43587 ?auto_43592 ) ) ( not ( = ?auto_43591 ?auto_43592 ) ) ( AVAILABLE ?auto_43592 ) ( SURFACE-AT ?auto_43582 ?auto_43586 ) ( ON ?auto_43582 ?auto_43585 ) ( CLEAR ?auto_43582 ) ( not ( = ?auto_43581 ?auto_43585 ) ) ( not ( = ?auto_43582 ?auto_43585 ) ) ( not ( = ?auto_43589 ?auto_43585 ) ) ( not ( = ?auto_43588 ?auto_43585 ) ) ( IS-CRATE ?auto_43588 ) ( not ( = ?auto_43581 ?auto_43583 ) ) ( not ( = ?auto_43582 ?auto_43583 ) ) ( not ( = ?auto_43589 ?auto_43583 ) ) ( not ( = ?auto_43588 ?auto_43583 ) ) ( not ( = ?auto_43585 ?auto_43583 ) ) ( not ( = ?auto_43584 ?auto_43590 ) ) ( not ( = ?auto_43596 ?auto_43584 ) ) ( not ( = ?auto_43586 ?auto_43584 ) ) ( HOIST-AT ?auto_43593 ?auto_43584 ) ( not ( = ?auto_43587 ?auto_43593 ) ) ( not ( = ?auto_43591 ?auto_43593 ) ) ( not ( = ?auto_43592 ?auto_43593 ) ) ( SURFACE-AT ?auto_43588 ?auto_43584 ) ( ON ?auto_43588 ?auto_43594 ) ( CLEAR ?auto_43588 ) ( not ( = ?auto_43581 ?auto_43594 ) ) ( not ( = ?auto_43582 ?auto_43594 ) ) ( not ( = ?auto_43589 ?auto_43594 ) ) ( not ( = ?auto_43588 ?auto_43594 ) ) ( not ( = ?auto_43585 ?auto_43594 ) ) ( not ( = ?auto_43583 ?auto_43594 ) ) ( SURFACE-AT ?auto_43595 ?auto_43590 ) ( CLEAR ?auto_43595 ) ( IS-CRATE ?auto_43583 ) ( not ( = ?auto_43581 ?auto_43595 ) ) ( not ( = ?auto_43582 ?auto_43595 ) ) ( not ( = ?auto_43589 ?auto_43595 ) ) ( not ( = ?auto_43588 ?auto_43595 ) ) ( not ( = ?auto_43585 ?auto_43595 ) ) ( not ( = ?auto_43583 ?auto_43595 ) ) ( not ( = ?auto_43594 ?auto_43595 ) ) ( AVAILABLE ?auto_43587 ) ( TRUCK-AT ?auto_43597 ?auto_43584 ) ( LIFTING ?auto_43593 ?auto_43583 ) )
    :subtasks
    ( ( !LOAD ?auto_43593 ?auto_43583 ?auto_43597 ?auto_43584 )
      ( MAKE-ON ?auto_43581 ?auto_43582 )
      ( MAKE-ON-VERIFY ?auto_43581 ?auto_43582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43598 - SURFACE
      ?auto_43599 - SURFACE
    )
    :vars
    (
      ?auto_43602 - HOIST
      ?auto_43608 - PLACE
      ?auto_43601 - PLACE
      ?auto_43600 - HOIST
      ?auto_43605 - SURFACE
      ?auto_43607 - SURFACE
      ?auto_43606 - PLACE
      ?auto_43614 - HOIST
      ?auto_43611 - SURFACE
      ?auto_43612 - SURFACE
      ?auto_43609 - PLACE
      ?auto_43610 - HOIST
      ?auto_43613 - SURFACE
      ?auto_43604 - SURFACE
      ?auto_43603 - TRUCK
      ?auto_43615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43602 ?auto_43608 ) ( IS-CRATE ?auto_43598 ) ( not ( = ?auto_43598 ?auto_43599 ) ) ( not ( = ?auto_43601 ?auto_43608 ) ) ( HOIST-AT ?auto_43600 ?auto_43601 ) ( not ( = ?auto_43602 ?auto_43600 ) ) ( AVAILABLE ?auto_43600 ) ( SURFACE-AT ?auto_43598 ?auto_43601 ) ( ON ?auto_43598 ?auto_43605 ) ( CLEAR ?auto_43598 ) ( not ( = ?auto_43598 ?auto_43605 ) ) ( not ( = ?auto_43599 ?auto_43605 ) ) ( IS-CRATE ?auto_43599 ) ( not ( = ?auto_43598 ?auto_43607 ) ) ( not ( = ?auto_43599 ?auto_43607 ) ) ( not ( = ?auto_43605 ?auto_43607 ) ) ( not ( = ?auto_43606 ?auto_43608 ) ) ( not ( = ?auto_43601 ?auto_43606 ) ) ( HOIST-AT ?auto_43614 ?auto_43606 ) ( not ( = ?auto_43602 ?auto_43614 ) ) ( not ( = ?auto_43600 ?auto_43614 ) ) ( AVAILABLE ?auto_43614 ) ( SURFACE-AT ?auto_43599 ?auto_43606 ) ( ON ?auto_43599 ?auto_43611 ) ( CLEAR ?auto_43599 ) ( not ( = ?auto_43598 ?auto_43611 ) ) ( not ( = ?auto_43599 ?auto_43611 ) ) ( not ( = ?auto_43605 ?auto_43611 ) ) ( not ( = ?auto_43607 ?auto_43611 ) ) ( IS-CRATE ?auto_43607 ) ( not ( = ?auto_43598 ?auto_43612 ) ) ( not ( = ?auto_43599 ?auto_43612 ) ) ( not ( = ?auto_43605 ?auto_43612 ) ) ( not ( = ?auto_43607 ?auto_43612 ) ) ( not ( = ?auto_43611 ?auto_43612 ) ) ( not ( = ?auto_43609 ?auto_43608 ) ) ( not ( = ?auto_43601 ?auto_43609 ) ) ( not ( = ?auto_43606 ?auto_43609 ) ) ( HOIST-AT ?auto_43610 ?auto_43609 ) ( not ( = ?auto_43602 ?auto_43610 ) ) ( not ( = ?auto_43600 ?auto_43610 ) ) ( not ( = ?auto_43614 ?auto_43610 ) ) ( SURFACE-AT ?auto_43607 ?auto_43609 ) ( ON ?auto_43607 ?auto_43613 ) ( CLEAR ?auto_43607 ) ( not ( = ?auto_43598 ?auto_43613 ) ) ( not ( = ?auto_43599 ?auto_43613 ) ) ( not ( = ?auto_43605 ?auto_43613 ) ) ( not ( = ?auto_43607 ?auto_43613 ) ) ( not ( = ?auto_43611 ?auto_43613 ) ) ( not ( = ?auto_43612 ?auto_43613 ) ) ( SURFACE-AT ?auto_43604 ?auto_43608 ) ( CLEAR ?auto_43604 ) ( IS-CRATE ?auto_43612 ) ( not ( = ?auto_43598 ?auto_43604 ) ) ( not ( = ?auto_43599 ?auto_43604 ) ) ( not ( = ?auto_43605 ?auto_43604 ) ) ( not ( = ?auto_43607 ?auto_43604 ) ) ( not ( = ?auto_43611 ?auto_43604 ) ) ( not ( = ?auto_43612 ?auto_43604 ) ) ( not ( = ?auto_43613 ?auto_43604 ) ) ( AVAILABLE ?auto_43602 ) ( TRUCK-AT ?auto_43603 ?auto_43609 ) ( AVAILABLE ?auto_43610 ) ( SURFACE-AT ?auto_43612 ?auto_43609 ) ( ON ?auto_43612 ?auto_43615 ) ( CLEAR ?auto_43612 ) ( not ( = ?auto_43598 ?auto_43615 ) ) ( not ( = ?auto_43599 ?auto_43615 ) ) ( not ( = ?auto_43605 ?auto_43615 ) ) ( not ( = ?auto_43607 ?auto_43615 ) ) ( not ( = ?auto_43611 ?auto_43615 ) ) ( not ( = ?auto_43612 ?auto_43615 ) ) ( not ( = ?auto_43613 ?auto_43615 ) ) ( not ( = ?auto_43604 ?auto_43615 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43610 ?auto_43612 ?auto_43615 ?auto_43609 )
      ( MAKE-ON ?auto_43598 ?auto_43599 )
      ( MAKE-ON-VERIFY ?auto_43598 ?auto_43599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43616 - SURFACE
      ?auto_43617 - SURFACE
    )
    :vars
    (
      ?auto_43618 - HOIST
      ?auto_43623 - PLACE
      ?auto_43629 - PLACE
      ?auto_43626 - HOIST
      ?auto_43628 - SURFACE
      ?auto_43627 - SURFACE
      ?auto_43630 - PLACE
      ?auto_43631 - HOIST
      ?auto_43621 - SURFACE
      ?auto_43624 - SURFACE
      ?auto_43622 - PLACE
      ?auto_43619 - HOIST
      ?auto_43633 - SURFACE
      ?auto_43625 - SURFACE
      ?auto_43632 - SURFACE
      ?auto_43620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43618 ?auto_43623 ) ( IS-CRATE ?auto_43616 ) ( not ( = ?auto_43616 ?auto_43617 ) ) ( not ( = ?auto_43629 ?auto_43623 ) ) ( HOIST-AT ?auto_43626 ?auto_43629 ) ( not ( = ?auto_43618 ?auto_43626 ) ) ( AVAILABLE ?auto_43626 ) ( SURFACE-AT ?auto_43616 ?auto_43629 ) ( ON ?auto_43616 ?auto_43628 ) ( CLEAR ?auto_43616 ) ( not ( = ?auto_43616 ?auto_43628 ) ) ( not ( = ?auto_43617 ?auto_43628 ) ) ( IS-CRATE ?auto_43617 ) ( not ( = ?auto_43616 ?auto_43627 ) ) ( not ( = ?auto_43617 ?auto_43627 ) ) ( not ( = ?auto_43628 ?auto_43627 ) ) ( not ( = ?auto_43630 ?auto_43623 ) ) ( not ( = ?auto_43629 ?auto_43630 ) ) ( HOIST-AT ?auto_43631 ?auto_43630 ) ( not ( = ?auto_43618 ?auto_43631 ) ) ( not ( = ?auto_43626 ?auto_43631 ) ) ( AVAILABLE ?auto_43631 ) ( SURFACE-AT ?auto_43617 ?auto_43630 ) ( ON ?auto_43617 ?auto_43621 ) ( CLEAR ?auto_43617 ) ( not ( = ?auto_43616 ?auto_43621 ) ) ( not ( = ?auto_43617 ?auto_43621 ) ) ( not ( = ?auto_43628 ?auto_43621 ) ) ( not ( = ?auto_43627 ?auto_43621 ) ) ( IS-CRATE ?auto_43627 ) ( not ( = ?auto_43616 ?auto_43624 ) ) ( not ( = ?auto_43617 ?auto_43624 ) ) ( not ( = ?auto_43628 ?auto_43624 ) ) ( not ( = ?auto_43627 ?auto_43624 ) ) ( not ( = ?auto_43621 ?auto_43624 ) ) ( not ( = ?auto_43622 ?auto_43623 ) ) ( not ( = ?auto_43629 ?auto_43622 ) ) ( not ( = ?auto_43630 ?auto_43622 ) ) ( HOIST-AT ?auto_43619 ?auto_43622 ) ( not ( = ?auto_43618 ?auto_43619 ) ) ( not ( = ?auto_43626 ?auto_43619 ) ) ( not ( = ?auto_43631 ?auto_43619 ) ) ( SURFACE-AT ?auto_43627 ?auto_43622 ) ( ON ?auto_43627 ?auto_43633 ) ( CLEAR ?auto_43627 ) ( not ( = ?auto_43616 ?auto_43633 ) ) ( not ( = ?auto_43617 ?auto_43633 ) ) ( not ( = ?auto_43628 ?auto_43633 ) ) ( not ( = ?auto_43627 ?auto_43633 ) ) ( not ( = ?auto_43621 ?auto_43633 ) ) ( not ( = ?auto_43624 ?auto_43633 ) ) ( SURFACE-AT ?auto_43625 ?auto_43623 ) ( CLEAR ?auto_43625 ) ( IS-CRATE ?auto_43624 ) ( not ( = ?auto_43616 ?auto_43625 ) ) ( not ( = ?auto_43617 ?auto_43625 ) ) ( not ( = ?auto_43628 ?auto_43625 ) ) ( not ( = ?auto_43627 ?auto_43625 ) ) ( not ( = ?auto_43621 ?auto_43625 ) ) ( not ( = ?auto_43624 ?auto_43625 ) ) ( not ( = ?auto_43633 ?auto_43625 ) ) ( AVAILABLE ?auto_43618 ) ( AVAILABLE ?auto_43619 ) ( SURFACE-AT ?auto_43624 ?auto_43622 ) ( ON ?auto_43624 ?auto_43632 ) ( CLEAR ?auto_43624 ) ( not ( = ?auto_43616 ?auto_43632 ) ) ( not ( = ?auto_43617 ?auto_43632 ) ) ( not ( = ?auto_43628 ?auto_43632 ) ) ( not ( = ?auto_43627 ?auto_43632 ) ) ( not ( = ?auto_43621 ?auto_43632 ) ) ( not ( = ?auto_43624 ?auto_43632 ) ) ( not ( = ?auto_43633 ?auto_43632 ) ) ( not ( = ?auto_43625 ?auto_43632 ) ) ( TRUCK-AT ?auto_43620 ?auto_43623 ) )
    :subtasks
    ( ( !DRIVE ?auto_43620 ?auto_43623 ?auto_43622 )
      ( MAKE-ON ?auto_43616 ?auto_43617 )
      ( MAKE-ON-VERIFY ?auto_43616 ?auto_43617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43634 - SURFACE
      ?auto_43635 - SURFACE
    )
    :vars
    (
      ?auto_43651 - HOIST
      ?auto_43639 - PLACE
      ?auto_43641 - PLACE
      ?auto_43638 - HOIST
      ?auto_43643 - SURFACE
      ?auto_43648 - SURFACE
      ?auto_43645 - PLACE
      ?auto_43644 - HOIST
      ?auto_43636 - SURFACE
      ?auto_43640 - SURFACE
      ?auto_43647 - PLACE
      ?auto_43650 - HOIST
      ?auto_43649 - SURFACE
      ?auto_43642 - SURFACE
      ?auto_43646 - SURFACE
      ?auto_43637 - TRUCK
      ?auto_43652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43651 ?auto_43639 ) ( IS-CRATE ?auto_43634 ) ( not ( = ?auto_43634 ?auto_43635 ) ) ( not ( = ?auto_43641 ?auto_43639 ) ) ( HOIST-AT ?auto_43638 ?auto_43641 ) ( not ( = ?auto_43651 ?auto_43638 ) ) ( AVAILABLE ?auto_43638 ) ( SURFACE-AT ?auto_43634 ?auto_43641 ) ( ON ?auto_43634 ?auto_43643 ) ( CLEAR ?auto_43634 ) ( not ( = ?auto_43634 ?auto_43643 ) ) ( not ( = ?auto_43635 ?auto_43643 ) ) ( IS-CRATE ?auto_43635 ) ( not ( = ?auto_43634 ?auto_43648 ) ) ( not ( = ?auto_43635 ?auto_43648 ) ) ( not ( = ?auto_43643 ?auto_43648 ) ) ( not ( = ?auto_43645 ?auto_43639 ) ) ( not ( = ?auto_43641 ?auto_43645 ) ) ( HOIST-AT ?auto_43644 ?auto_43645 ) ( not ( = ?auto_43651 ?auto_43644 ) ) ( not ( = ?auto_43638 ?auto_43644 ) ) ( AVAILABLE ?auto_43644 ) ( SURFACE-AT ?auto_43635 ?auto_43645 ) ( ON ?auto_43635 ?auto_43636 ) ( CLEAR ?auto_43635 ) ( not ( = ?auto_43634 ?auto_43636 ) ) ( not ( = ?auto_43635 ?auto_43636 ) ) ( not ( = ?auto_43643 ?auto_43636 ) ) ( not ( = ?auto_43648 ?auto_43636 ) ) ( IS-CRATE ?auto_43648 ) ( not ( = ?auto_43634 ?auto_43640 ) ) ( not ( = ?auto_43635 ?auto_43640 ) ) ( not ( = ?auto_43643 ?auto_43640 ) ) ( not ( = ?auto_43648 ?auto_43640 ) ) ( not ( = ?auto_43636 ?auto_43640 ) ) ( not ( = ?auto_43647 ?auto_43639 ) ) ( not ( = ?auto_43641 ?auto_43647 ) ) ( not ( = ?auto_43645 ?auto_43647 ) ) ( HOIST-AT ?auto_43650 ?auto_43647 ) ( not ( = ?auto_43651 ?auto_43650 ) ) ( not ( = ?auto_43638 ?auto_43650 ) ) ( not ( = ?auto_43644 ?auto_43650 ) ) ( SURFACE-AT ?auto_43648 ?auto_43647 ) ( ON ?auto_43648 ?auto_43649 ) ( CLEAR ?auto_43648 ) ( not ( = ?auto_43634 ?auto_43649 ) ) ( not ( = ?auto_43635 ?auto_43649 ) ) ( not ( = ?auto_43643 ?auto_43649 ) ) ( not ( = ?auto_43648 ?auto_43649 ) ) ( not ( = ?auto_43636 ?auto_43649 ) ) ( not ( = ?auto_43640 ?auto_43649 ) ) ( IS-CRATE ?auto_43640 ) ( not ( = ?auto_43634 ?auto_43642 ) ) ( not ( = ?auto_43635 ?auto_43642 ) ) ( not ( = ?auto_43643 ?auto_43642 ) ) ( not ( = ?auto_43648 ?auto_43642 ) ) ( not ( = ?auto_43636 ?auto_43642 ) ) ( not ( = ?auto_43640 ?auto_43642 ) ) ( not ( = ?auto_43649 ?auto_43642 ) ) ( AVAILABLE ?auto_43650 ) ( SURFACE-AT ?auto_43640 ?auto_43647 ) ( ON ?auto_43640 ?auto_43646 ) ( CLEAR ?auto_43640 ) ( not ( = ?auto_43634 ?auto_43646 ) ) ( not ( = ?auto_43635 ?auto_43646 ) ) ( not ( = ?auto_43643 ?auto_43646 ) ) ( not ( = ?auto_43648 ?auto_43646 ) ) ( not ( = ?auto_43636 ?auto_43646 ) ) ( not ( = ?auto_43640 ?auto_43646 ) ) ( not ( = ?auto_43649 ?auto_43646 ) ) ( not ( = ?auto_43642 ?auto_43646 ) ) ( TRUCK-AT ?auto_43637 ?auto_43639 ) ( SURFACE-AT ?auto_43652 ?auto_43639 ) ( CLEAR ?auto_43652 ) ( LIFTING ?auto_43651 ?auto_43642 ) ( IS-CRATE ?auto_43642 ) ( not ( = ?auto_43634 ?auto_43652 ) ) ( not ( = ?auto_43635 ?auto_43652 ) ) ( not ( = ?auto_43643 ?auto_43652 ) ) ( not ( = ?auto_43648 ?auto_43652 ) ) ( not ( = ?auto_43636 ?auto_43652 ) ) ( not ( = ?auto_43640 ?auto_43652 ) ) ( not ( = ?auto_43649 ?auto_43652 ) ) ( not ( = ?auto_43642 ?auto_43652 ) ) ( not ( = ?auto_43646 ?auto_43652 ) ) )
    :subtasks
    ( ( !DROP ?auto_43651 ?auto_43642 ?auto_43652 ?auto_43639 )
      ( MAKE-ON ?auto_43634 ?auto_43635 )
      ( MAKE-ON-VERIFY ?auto_43634 ?auto_43635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43653 - SURFACE
      ?auto_43654 - SURFACE
    )
    :vars
    (
      ?auto_43656 - HOIST
      ?auto_43666 - PLACE
      ?auto_43662 - PLACE
      ?auto_43665 - HOIST
      ?auto_43659 - SURFACE
      ?auto_43657 - SURFACE
      ?auto_43658 - PLACE
      ?auto_43661 - HOIST
      ?auto_43668 - SURFACE
      ?auto_43667 - SURFACE
      ?auto_43670 - PLACE
      ?auto_43655 - HOIST
      ?auto_43660 - SURFACE
      ?auto_43671 - SURFACE
      ?auto_43663 - SURFACE
      ?auto_43664 - TRUCK
      ?auto_43669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43656 ?auto_43666 ) ( IS-CRATE ?auto_43653 ) ( not ( = ?auto_43653 ?auto_43654 ) ) ( not ( = ?auto_43662 ?auto_43666 ) ) ( HOIST-AT ?auto_43665 ?auto_43662 ) ( not ( = ?auto_43656 ?auto_43665 ) ) ( AVAILABLE ?auto_43665 ) ( SURFACE-AT ?auto_43653 ?auto_43662 ) ( ON ?auto_43653 ?auto_43659 ) ( CLEAR ?auto_43653 ) ( not ( = ?auto_43653 ?auto_43659 ) ) ( not ( = ?auto_43654 ?auto_43659 ) ) ( IS-CRATE ?auto_43654 ) ( not ( = ?auto_43653 ?auto_43657 ) ) ( not ( = ?auto_43654 ?auto_43657 ) ) ( not ( = ?auto_43659 ?auto_43657 ) ) ( not ( = ?auto_43658 ?auto_43666 ) ) ( not ( = ?auto_43662 ?auto_43658 ) ) ( HOIST-AT ?auto_43661 ?auto_43658 ) ( not ( = ?auto_43656 ?auto_43661 ) ) ( not ( = ?auto_43665 ?auto_43661 ) ) ( AVAILABLE ?auto_43661 ) ( SURFACE-AT ?auto_43654 ?auto_43658 ) ( ON ?auto_43654 ?auto_43668 ) ( CLEAR ?auto_43654 ) ( not ( = ?auto_43653 ?auto_43668 ) ) ( not ( = ?auto_43654 ?auto_43668 ) ) ( not ( = ?auto_43659 ?auto_43668 ) ) ( not ( = ?auto_43657 ?auto_43668 ) ) ( IS-CRATE ?auto_43657 ) ( not ( = ?auto_43653 ?auto_43667 ) ) ( not ( = ?auto_43654 ?auto_43667 ) ) ( not ( = ?auto_43659 ?auto_43667 ) ) ( not ( = ?auto_43657 ?auto_43667 ) ) ( not ( = ?auto_43668 ?auto_43667 ) ) ( not ( = ?auto_43670 ?auto_43666 ) ) ( not ( = ?auto_43662 ?auto_43670 ) ) ( not ( = ?auto_43658 ?auto_43670 ) ) ( HOIST-AT ?auto_43655 ?auto_43670 ) ( not ( = ?auto_43656 ?auto_43655 ) ) ( not ( = ?auto_43665 ?auto_43655 ) ) ( not ( = ?auto_43661 ?auto_43655 ) ) ( SURFACE-AT ?auto_43657 ?auto_43670 ) ( ON ?auto_43657 ?auto_43660 ) ( CLEAR ?auto_43657 ) ( not ( = ?auto_43653 ?auto_43660 ) ) ( not ( = ?auto_43654 ?auto_43660 ) ) ( not ( = ?auto_43659 ?auto_43660 ) ) ( not ( = ?auto_43657 ?auto_43660 ) ) ( not ( = ?auto_43668 ?auto_43660 ) ) ( not ( = ?auto_43667 ?auto_43660 ) ) ( IS-CRATE ?auto_43667 ) ( not ( = ?auto_43653 ?auto_43671 ) ) ( not ( = ?auto_43654 ?auto_43671 ) ) ( not ( = ?auto_43659 ?auto_43671 ) ) ( not ( = ?auto_43657 ?auto_43671 ) ) ( not ( = ?auto_43668 ?auto_43671 ) ) ( not ( = ?auto_43667 ?auto_43671 ) ) ( not ( = ?auto_43660 ?auto_43671 ) ) ( AVAILABLE ?auto_43655 ) ( SURFACE-AT ?auto_43667 ?auto_43670 ) ( ON ?auto_43667 ?auto_43663 ) ( CLEAR ?auto_43667 ) ( not ( = ?auto_43653 ?auto_43663 ) ) ( not ( = ?auto_43654 ?auto_43663 ) ) ( not ( = ?auto_43659 ?auto_43663 ) ) ( not ( = ?auto_43657 ?auto_43663 ) ) ( not ( = ?auto_43668 ?auto_43663 ) ) ( not ( = ?auto_43667 ?auto_43663 ) ) ( not ( = ?auto_43660 ?auto_43663 ) ) ( not ( = ?auto_43671 ?auto_43663 ) ) ( TRUCK-AT ?auto_43664 ?auto_43666 ) ( SURFACE-AT ?auto_43669 ?auto_43666 ) ( CLEAR ?auto_43669 ) ( IS-CRATE ?auto_43671 ) ( not ( = ?auto_43653 ?auto_43669 ) ) ( not ( = ?auto_43654 ?auto_43669 ) ) ( not ( = ?auto_43659 ?auto_43669 ) ) ( not ( = ?auto_43657 ?auto_43669 ) ) ( not ( = ?auto_43668 ?auto_43669 ) ) ( not ( = ?auto_43667 ?auto_43669 ) ) ( not ( = ?auto_43660 ?auto_43669 ) ) ( not ( = ?auto_43671 ?auto_43669 ) ) ( not ( = ?auto_43663 ?auto_43669 ) ) ( AVAILABLE ?auto_43656 ) ( IN ?auto_43671 ?auto_43664 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43656 ?auto_43671 ?auto_43664 ?auto_43666 )
      ( MAKE-ON ?auto_43653 ?auto_43654 )
      ( MAKE-ON-VERIFY ?auto_43653 ?auto_43654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43672 - SURFACE
      ?auto_43673 - SURFACE
    )
    :vars
    (
      ?auto_43689 - HOIST
      ?auto_43687 - PLACE
      ?auto_43680 - PLACE
      ?auto_43676 - HOIST
      ?auto_43690 - SURFACE
      ?auto_43685 - SURFACE
      ?auto_43681 - PLACE
      ?auto_43677 - HOIST
      ?auto_43688 - SURFACE
      ?auto_43674 - SURFACE
      ?auto_43686 - PLACE
      ?auto_43684 - HOIST
      ?auto_43683 - SURFACE
      ?auto_43682 - SURFACE
      ?auto_43675 - SURFACE
      ?auto_43679 - SURFACE
      ?auto_43678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43689 ?auto_43687 ) ( IS-CRATE ?auto_43672 ) ( not ( = ?auto_43672 ?auto_43673 ) ) ( not ( = ?auto_43680 ?auto_43687 ) ) ( HOIST-AT ?auto_43676 ?auto_43680 ) ( not ( = ?auto_43689 ?auto_43676 ) ) ( AVAILABLE ?auto_43676 ) ( SURFACE-AT ?auto_43672 ?auto_43680 ) ( ON ?auto_43672 ?auto_43690 ) ( CLEAR ?auto_43672 ) ( not ( = ?auto_43672 ?auto_43690 ) ) ( not ( = ?auto_43673 ?auto_43690 ) ) ( IS-CRATE ?auto_43673 ) ( not ( = ?auto_43672 ?auto_43685 ) ) ( not ( = ?auto_43673 ?auto_43685 ) ) ( not ( = ?auto_43690 ?auto_43685 ) ) ( not ( = ?auto_43681 ?auto_43687 ) ) ( not ( = ?auto_43680 ?auto_43681 ) ) ( HOIST-AT ?auto_43677 ?auto_43681 ) ( not ( = ?auto_43689 ?auto_43677 ) ) ( not ( = ?auto_43676 ?auto_43677 ) ) ( AVAILABLE ?auto_43677 ) ( SURFACE-AT ?auto_43673 ?auto_43681 ) ( ON ?auto_43673 ?auto_43688 ) ( CLEAR ?auto_43673 ) ( not ( = ?auto_43672 ?auto_43688 ) ) ( not ( = ?auto_43673 ?auto_43688 ) ) ( not ( = ?auto_43690 ?auto_43688 ) ) ( not ( = ?auto_43685 ?auto_43688 ) ) ( IS-CRATE ?auto_43685 ) ( not ( = ?auto_43672 ?auto_43674 ) ) ( not ( = ?auto_43673 ?auto_43674 ) ) ( not ( = ?auto_43690 ?auto_43674 ) ) ( not ( = ?auto_43685 ?auto_43674 ) ) ( not ( = ?auto_43688 ?auto_43674 ) ) ( not ( = ?auto_43686 ?auto_43687 ) ) ( not ( = ?auto_43680 ?auto_43686 ) ) ( not ( = ?auto_43681 ?auto_43686 ) ) ( HOIST-AT ?auto_43684 ?auto_43686 ) ( not ( = ?auto_43689 ?auto_43684 ) ) ( not ( = ?auto_43676 ?auto_43684 ) ) ( not ( = ?auto_43677 ?auto_43684 ) ) ( SURFACE-AT ?auto_43685 ?auto_43686 ) ( ON ?auto_43685 ?auto_43683 ) ( CLEAR ?auto_43685 ) ( not ( = ?auto_43672 ?auto_43683 ) ) ( not ( = ?auto_43673 ?auto_43683 ) ) ( not ( = ?auto_43690 ?auto_43683 ) ) ( not ( = ?auto_43685 ?auto_43683 ) ) ( not ( = ?auto_43688 ?auto_43683 ) ) ( not ( = ?auto_43674 ?auto_43683 ) ) ( IS-CRATE ?auto_43674 ) ( not ( = ?auto_43672 ?auto_43682 ) ) ( not ( = ?auto_43673 ?auto_43682 ) ) ( not ( = ?auto_43690 ?auto_43682 ) ) ( not ( = ?auto_43685 ?auto_43682 ) ) ( not ( = ?auto_43688 ?auto_43682 ) ) ( not ( = ?auto_43674 ?auto_43682 ) ) ( not ( = ?auto_43683 ?auto_43682 ) ) ( AVAILABLE ?auto_43684 ) ( SURFACE-AT ?auto_43674 ?auto_43686 ) ( ON ?auto_43674 ?auto_43675 ) ( CLEAR ?auto_43674 ) ( not ( = ?auto_43672 ?auto_43675 ) ) ( not ( = ?auto_43673 ?auto_43675 ) ) ( not ( = ?auto_43690 ?auto_43675 ) ) ( not ( = ?auto_43685 ?auto_43675 ) ) ( not ( = ?auto_43688 ?auto_43675 ) ) ( not ( = ?auto_43674 ?auto_43675 ) ) ( not ( = ?auto_43683 ?auto_43675 ) ) ( not ( = ?auto_43682 ?auto_43675 ) ) ( SURFACE-AT ?auto_43679 ?auto_43687 ) ( CLEAR ?auto_43679 ) ( IS-CRATE ?auto_43682 ) ( not ( = ?auto_43672 ?auto_43679 ) ) ( not ( = ?auto_43673 ?auto_43679 ) ) ( not ( = ?auto_43690 ?auto_43679 ) ) ( not ( = ?auto_43685 ?auto_43679 ) ) ( not ( = ?auto_43688 ?auto_43679 ) ) ( not ( = ?auto_43674 ?auto_43679 ) ) ( not ( = ?auto_43683 ?auto_43679 ) ) ( not ( = ?auto_43682 ?auto_43679 ) ) ( not ( = ?auto_43675 ?auto_43679 ) ) ( AVAILABLE ?auto_43689 ) ( IN ?auto_43682 ?auto_43678 ) ( TRUCK-AT ?auto_43678 ?auto_43681 ) )
    :subtasks
    ( ( !DRIVE ?auto_43678 ?auto_43681 ?auto_43687 )
      ( MAKE-ON ?auto_43672 ?auto_43673 )
      ( MAKE-ON-VERIFY ?auto_43672 ?auto_43673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43691 - SURFACE
      ?auto_43692 - SURFACE
    )
    :vars
    (
      ?auto_43700 - HOIST
      ?auto_43703 - PLACE
      ?auto_43699 - PLACE
      ?auto_43707 - HOIST
      ?auto_43693 - SURFACE
      ?auto_43709 - SURFACE
      ?auto_43706 - PLACE
      ?auto_43696 - HOIST
      ?auto_43698 - SURFACE
      ?auto_43701 - SURFACE
      ?auto_43702 - PLACE
      ?auto_43704 - HOIST
      ?auto_43697 - SURFACE
      ?auto_43708 - SURFACE
      ?auto_43694 - SURFACE
      ?auto_43705 - SURFACE
      ?auto_43695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43700 ?auto_43703 ) ( IS-CRATE ?auto_43691 ) ( not ( = ?auto_43691 ?auto_43692 ) ) ( not ( = ?auto_43699 ?auto_43703 ) ) ( HOIST-AT ?auto_43707 ?auto_43699 ) ( not ( = ?auto_43700 ?auto_43707 ) ) ( AVAILABLE ?auto_43707 ) ( SURFACE-AT ?auto_43691 ?auto_43699 ) ( ON ?auto_43691 ?auto_43693 ) ( CLEAR ?auto_43691 ) ( not ( = ?auto_43691 ?auto_43693 ) ) ( not ( = ?auto_43692 ?auto_43693 ) ) ( IS-CRATE ?auto_43692 ) ( not ( = ?auto_43691 ?auto_43709 ) ) ( not ( = ?auto_43692 ?auto_43709 ) ) ( not ( = ?auto_43693 ?auto_43709 ) ) ( not ( = ?auto_43706 ?auto_43703 ) ) ( not ( = ?auto_43699 ?auto_43706 ) ) ( HOIST-AT ?auto_43696 ?auto_43706 ) ( not ( = ?auto_43700 ?auto_43696 ) ) ( not ( = ?auto_43707 ?auto_43696 ) ) ( SURFACE-AT ?auto_43692 ?auto_43706 ) ( ON ?auto_43692 ?auto_43698 ) ( CLEAR ?auto_43692 ) ( not ( = ?auto_43691 ?auto_43698 ) ) ( not ( = ?auto_43692 ?auto_43698 ) ) ( not ( = ?auto_43693 ?auto_43698 ) ) ( not ( = ?auto_43709 ?auto_43698 ) ) ( IS-CRATE ?auto_43709 ) ( not ( = ?auto_43691 ?auto_43701 ) ) ( not ( = ?auto_43692 ?auto_43701 ) ) ( not ( = ?auto_43693 ?auto_43701 ) ) ( not ( = ?auto_43709 ?auto_43701 ) ) ( not ( = ?auto_43698 ?auto_43701 ) ) ( not ( = ?auto_43702 ?auto_43703 ) ) ( not ( = ?auto_43699 ?auto_43702 ) ) ( not ( = ?auto_43706 ?auto_43702 ) ) ( HOIST-AT ?auto_43704 ?auto_43702 ) ( not ( = ?auto_43700 ?auto_43704 ) ) ( not ( = ?auto_43707 ?auto_43704 ) ) ( not ( = ?auto_43696 ?auto_43704 ) ) ( SURFACE-AT ?auto_43709 ?auto_43702 ) ( ON ?auto_43709 ?auto_43697 ) ( CLEAR ?auto_43709 ) ( not ( = ?auto_43691 ?auto_43697 ) ) ( not ( = ?auto_43692 ?auto_43697 ) ) ( not ( = ?auto_43693 ?auto_43697 ) ) ( not ( = ?auto_43709 ?auto_43697 ) ) ( not ( = ?auto_43698 ?auto_43697 ) ) ( not ( = ?auto_43701 ?auto_43697 ) ) ( IS-CRATE ?auto_43701 ) ( not ( = ?auto_43691 ?auto_43708 ) ) ( not ( = ?auto_43692 ?auto_43708 ) ) ( not ( = ?auto_43693 ?auto_43708 ) ) ( not ( = ?auto_43709 ?auto_43708 ) ) ( not ( = ?auto_43698 ?auto_43708 ) ) ( not ( = ?auto_43701 ?auto_43708 ) ) ( not ( = ?auto_43697 ?auto_43708 ) ) ( AVAILABLE ?auto_43704 ) ( SURFACE-AT ?auto_43701 ?auto_43702 ) ( ON ?auto_43701 ?auto_43694 ) ( CLEAR ?auto_43701 ) ( not ( = ?auto_43691 ?auto_43694 ) ) ( not ( = ?auto_43692 ?auto_43694 ) ) ( not ( = ?auto_43693 ?auto_43694 ) ) ( not ( = ?auto_43709 ?auto_43694 ) ) ( not ( = ?auto_43698 ?auto_43694 ) ) ( not ( = ?auto_43701 ?auto_43694 ) ) ( not ( = ?auto_43697 ?auto_43694 ) ) ( not ( = ?auto_43708 ?auto_43694 ) ) ( SURFACE-AT ?auto_43705 ?auto_43703 ) ( CLEAR ?auto_43705 ) ( IS-CRATE ?auto_43708 ) ( not ( = ?auto_43691 ?auto_43705 ) ) ( not ( = ?auto_43692 ?auto_43705 ) ) ( not ( = ?auto_43693 ?auto_43705 ) ) ( not ( = ?auto_43709 ?auto_43705 ) ) ( not ( = ?auto_43698 ?auto_43705 ) ) ( not ( = ?auto_43701 ?auto_43705 ) ) ( not ( = ?auto_43697 ?auto_43705 ) ) ( not ( = ?auto_43708 ?auto_43705 ) ) ( not ( = ?auto_43694 ?auto_43705 ) ) ( AVAILABLE ?auto_43700 ) ( TRUCK-AT ?auto_43695 ?auto_43706 ) ( LIFTING ?auto_43696 ?auto_43708 ) )
    :subtasks
    ( ( !LOAD ?auto_43696 ?auto_43708 ?auto_43695 ?auto_43706 )
      ( MAKE-ON ?auto_43691 ?auto_43692 )
      ( MAKE-ON-VERIFY ?auto_43691 ?auto_43692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43710 - SURFACE
      ?auto_43711 - SURFACE
    )
    :vars
    (
      ?auto_43728 - HOIST
      ?auto_43717 - PLACE
      ?auto_43714 - PLACE
      ?auto_43722 - HOIST
      ?auto_43716 - SURFACE
      ?auto_43723 - SURFACE
      ?auto_43718 - PLACE
      ?auto_43726 - HOIST
      ?auto_43721 - SURFACE
      ?auto_43720 - SURFACE
      ?auto_43712 - PLACE
      ?auto_43725 - HOIST
      ?auto_43715 - SURFACE
      ?auto_43727 - SURFACE
      ?auto_43713 - SURFACE
      ?auto_43724 - SURFACE
      ?auto_43719 - TRUCK
      ?auto_43729 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43728 ?auto_43717 ) ( IS-CRATE ?auto_43710 ) ( not ( = ?auto_43710 ?auto_43711 ) ) ( not ( = ?auto_43714 ?auto_43717 ) ) ( HOIST-AT ?auto_43722 ?auto_43714 ) ( not ( = ?auto_43728 ?auto_43722 ) ) ( AVAILABLE ?auto_43722 ) ( SURFACE-AT ?auto_43710 ?auto_43714 ) ( ON ?auto_43710 ?auto_43716 ) ( CLEAR ?auto_43710 ) ( not ( = ?auto_43710 ?auto_43716 ) ) ( not ( = ?auto_43711 ?auto_43716 ) ) ( IS-CRATE ?auto_43711 ) ( not ( = ?auto_43710 ?auto_43723 ) ) ( not ( = ?auto_43711 ?auto_43723 ) ) ( not ( = ?auto_43716 ?auto_43723 ) ) ( not ( = ?auto_43718 ?auto_43717 ) ) ( not ( = ?auto_43714 ?auto_43718 ) ) ( HOIST-AT ?auto_43726 ?auto_43718 ) ( not ( = ?auto_43728 ?auto_43726 ) ) ( not ( = ?auto_43722 ?auto_43726 ) ) ( SURFACE-AT ?auto_43711 ?auto_43718 ) ( ON ?auto_43711 ?auto_43721 ) ( CLEAR ?auto_43711 ) ( not ( = ?auto_43710 ?auto_43721 ) ) ( not ( = ?auto_43711 ?auto_43721 ) ) ( not ( = ?auto_43716 ?auto_43721 ) ) ( not ( = ?auto_43723 ?auto_43721 ) ) ( IS-CRATE ?auto_43723 ) ( not ( = ?auto_43710 ?auto_43720 ) ) ( not ( = ?auto_43711 ?auto_43720 ) ) ( not ( = ?auto_43716 ?auto_43720 ) ) ( not ( = ?auto_43723 ?auto_43720 ) ) ( not ( = ?auto_43721 ?auto_43720 ) ) ( not ( = ?auto_43712 ?auto_43717 ) ) ( not ( = ?auto_43714 ?auto_43712 ) ) ( not ( = ?auto_43718 ?auto_43712 ) ) ( HOIST-AT ?auto_43725 ?auto_43712 ) ( not ( = ?auto_43728 ?auto_43725 ) ) ( not ( = ?auto_43722 ?auto_43725 ) ) ( not ( = ?auto_43726 ?auto_43725 ) ) ( SURFACE-AT ?auto_43723 ?auto_43712 ) ( ON ?auto_43723 ?auto_43715 ) ( CLEAR ?auto_43723 ) ( not ( = ?auto_43710 ?auto_43715 ) ) ( not ( = ?auto_43711 ?auto_43715 ) ) ( not ( = ?auto_43716 ?auto_43715 ) ) ( not ( = ?auto_43723 ?auto_43715 ) ) ( not ( = ?auto_43721 ?auto_43715 ) ) ( not ( = ?auto_43720 ?auto_43715 ) ) ( IS-CRATE ?auto_43720 ) ( not ( = ?auto_43710 ?auto_43727 ) ) ( not ( = ?auto_43711 ?auto_43727 ) ) ( not ( = ?auto_43716 ?auto_43727 ) ) ( not ( = ?auto_43723 ?auto_43727 ) ) ( not ( = ?auto_43721 ?auto_43727 ) ) ( not ( = ?auto_43720 ?auto_43727 ) ) ( not ( = ?auto_43715 ?auto_43727 ) ) ( AVAILABLE ?auto_43725 ) ( SURFACE-AT ?auto_43720 ?auto_43712 ) ( ON ?auto_43720 ?auto_43713 ) ( CLEAR ?auto_43720 ) ( not ( = ?auto_43710 ?auto_43713 ) ) ( not ( = ?auto_43711 ?auto_43713 ) ) ( not ( = ?auto_43716 ?auto_43713 ) ) ( not ( = ?auto_43723 ?auto_43713 ) ) ( not ( = ?auto_43721 ?auto_43713 ) ) ( not ( = ?auto_43720 ?auto_43713 ) ) ( not ( = ?auto_43715 ?auto_43713 ) ) ( not ( = ?auto_43727 ?auto_43713 ) ) ( SURFACE-AT ?auto_43724 ?auto_43717 ) ( CLEAR ?auto_43724 ) ( IS-CRATE ?auto_43727 ) ( not ( = ?auto_43710 ?auto_43724 ) ) ( not ( = ?auto_43711 ?auto_43724 ) ) ( not ( = ?auto_43716 ?auto_43724 ) ) ( not ( = ?auto_43723 ?auto_43724 ) ) ( not ( = ?auto_43721 ?auto_43724 ) ) ( not ( = ?auto_43720 ?auto_43724 ) ) ( not ( = ?auto_43715 ?auto_43724 ) ) ( not ( = ?auto_43727 ?auto_43724 ) ) ( not ( = ?auto_43713 ?auto_43724 ) ) ( AVAILABLE ?auto_43728 ) ( TRUCK-AT ?auto_43719 ?auto_43718 ) ( AVAILABLE ?auto_43726 ) ( SURFACE-AT ?auto_43727 ?auto_43718 ) ( ON ?auto_43727 ?auto_43729 ) ( CLEAR ?auto_43727 ) ( not ( = ?auto_43710 ?auto_43729 ) ) ( not ( = ?auto_43711 ?auto_43729 ) ) ( not ( = ?auto_43716 ?auto_43729 ) ) ( not ( = ?auto_43723 ?auto_43729 ) ) ( not ( = ?auto_43721 ?auto_43729 ) ) ( not ( = ?auto_43720 ?auto_43729 ) ) ( not ( = ?auto_43715 ?auto_43729 ) ) ( not ( = ?auto_43727 ?auto_43729 ) ) ( not ( = ?auto_43713 ?auto_43729 ) ) ( not ( = ?auto_43724 ?auto_43729 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43726 ?auto_43727 ?auto_43729 ?auto_43718 )
      ( MAKE-ON ?auto_43710 ?auto_43711 )
      ( MAKE-ON-VERIFY ?auto_43710 ?auto_43711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43730 - SURFACE
      ?auto_43731 - SURFACE
    )
    :vars
    (
      ?auto_43737 - HOIST
      ?auto_43742 - PLACE
      ?auto_43734 - PLACE
      ?auto_43746 - HOIST
      ?auto_43741 - SURFACE
      ?auto_43735 - SURFACE
      ?auto_43749 - PLACE
      ?auto_43732 - HOIST
      ?auto_43740 - SURFACE
      ?auto_43738 - SURFACE
      ?auto_43747 - PLACE
      ?auto_43745 - HOIST
      ?auto_43733 - SURFACE
      ?auto_43748 - SURFACE
      ?auto_43736 - SURFACE
      ?auto_43739 - SURFACE
      ?auto_43744 - SURFACE
      ?auto_43743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43737 ?auto_43742 ) ( IS-CRATE ?auto_43730 ) ( not ( = ?auto_43730 ?auto_43731 ) ) ( not ( = ?auto_43734 ?auto_43742 ) ) ( HOIST-AT ?auto_43746 ?auto_43734 ) ( not ( = ?auto_43737 ?auto_43746 ) ) ( AVAILABLE ?auto_43746 ) ( SURFACE-AT ?auto_43730 ?auto_43734 ) ( ON ?auto_43730 ?auto_43741 ) ( CLEAR ?auto_43730 ) ( not ( = ?auto_43730 ?auto_43741 ) ) ( not ( = ?auto_43731 ?auto_43741 ) ) ( IS-CRATE ?auto_43731 ) ( not ( = ?auto_43730 ?auto_43735 ) ) ( not ( = ?auto_43731 ?auto_43735 ) ) ( not ( = ?auto_43741 ?auto_43735 ) ) ( not ( = ?auto_43749 ?auto_43742 ) ) ( not ( = ?auto_43734 ?auto_43749 ) ) ( HOIST-AT ?auto_43732 ?auto_43749 ) ( not ( = ?auto_43737 ?auto_43732 ) ) ( not ( = ?auto_43746 ?auto_43732 ) ) ( SURFACE-AT ?auto_43731 ?auto_43749 ) ( ON ?auto_43731 ?auto_43740 ) ( CLEAR ?auto_43731 ) ( not ( = ?auto_43730 ?auto_43740 ) ) ( not ( = ?auto_43731 ?auto_43740 ) ) ( not ( = ?auto_43741 ?auto_43740 ) ) ( not ( = ?auto_43735 ?auto_43740 ) ) ( IS-CRATE ?auto_43735 ) ( not ( = ?auto_43730 ?auto_43738 ) ) ( not ( = ?auto_43731 ?auto_43738 ) ) ( not ( = ?auto_43741 ?auto_43738 ) ) ( not ( = ?auto_43735 ?auto_43738 ) ) ( not ( = ?auto_43740 ?auto_43738 ) ) ( not ( = ?auto_43747 ?auto_43742 ) ) ( not ( = ?auto_43734 ?auto_43747 ) ) ( not ( = ?auto_43749 ?auto_43747 ) ) ( HOIST-AT ?auto_43745 ?auto_43747 ) ( not ( = ?auto_43737 ?auto_43745 ) ) ( not ( = ?auto_43746 ?auto_43745 ) ) ( not ( = ?auto_43732 ?auto_43745 ) ) ( SURFACE-AT ?auto_43735 ?auto_43747 ) ( ON ?auto_43735 ?auto_43733 ) ( CLEAR ?auto_43735 ) ( not ( = ?auto_43730 ?auto_43733 ) ) ( not ( = ?auto_43731 ?auto_43733 ) ) ( not ( = ?auto_43741 ?auto_43733 ) ) ( not ( = ?auto_43735 ?auto_43733 ) ) ( not ( = ?auto_43740 ?auto_43733 ) ) ( not ( = ?auto_43738 ?auto_43733 ) ) ( IS-CRATE ?auto_43738 ) ( not ( = ?auto_43730 ?auto_43748 ) ) ( not ( = ?auto_43731 ?auto_43748 ) ) ( not ( = ?auto_43741 ?auto_43748 ) ) ( not ( = ?auto_43735 ?auto_43748 ) ) ( not ( = ?auto_43740 ?auto_43748 ) ) ( not ( = ?auto_43738 ?auto_43748 ) ) ( not ( = ?auto_43733 ?auto_43748 ) ) ( AVAILABLE ?auto_43745 ) ( SURFACE-AT ?auto_43738 ?auto_43747 ) ( ON ?auto_43738 ?auto_43736 ) ( CLEAR ?auto_43738 ) ( not ( = ?auto_43730 ?auto_43736 ) ) ( not ( = ?auto_43731 ?auto_43736 ) ) ( not ( = ?auto_43741 ?auto_43736 ) ) ( not ( = ?auto_43735 ?auto_43736 ) ) ( not ( = ?auto_43740 ?auto_43736 ) ) ( not ( = ?auto_43738 ?auto_43736 ) ) ( not ( = ?auto_43733 ?auto_43736 ) ) ( not ( = ?auto_43748 ?auto_43736 ) ) ( SURFACE-AT ?auto_43739 ?auto_43742 ) ( CLEAR ?auto_43739 ) ( IS-CRATE ?auto_43748 ) ( not ( = ?auto_43730 ?auto_43739 ) ) ( not ( = ?auto_43731 ?auto_43739 ) ) ( not ( = ?auto_43741 ?auto_43739 ) ) ( not ( = ?auto_43735 ?auto_43739 ) ) ( not ( = ?auto_43740 ?auto_43739 ) ) ( not ( = ?auto_43738 ?auto_43739 ) ) ( not ( = ?auto_43733 ?auto_43739 ) ) ( not ( = ?auto_43748 ?auto_43739 ) ) ( not ( = ?auto_43736 ?auto_43739 ) ) ( AVAILABLE ?auto_43737 ) ( AVAILABLE ?auto_43732 ) ( SURFACE-AT ?auto_43748 ?auto_43749 ) ( ON ?auto_43748 ?auto_43744 ) ( CLEAR ?auto_43748 ) ( not ( = ?auto_43730 ?auto_43744 ) ) ( not ( = ?auto_43731 ?auto_43744 ) ) ( not ( = ?auto_43741 ?auto_43744 ) ) ( not ( = ?auto_43735 ?auto_43744 ) ) ( not ( = ?auto_43740 ?auto_43744 ) ) ( not ( = ?auto_43738 ?auto_43744 ) ) ( not ( = ?auto_43733 ?auto_43744 ) ) ( not ( = ?auto_43748 ?auto_43744 ) ) ( not ( = ?auto_43736 ?auto_43744 ) ) ( not ( = ?auto_43739 ?auto_43744 ) ) ( TRUCK-AT ?auto_43743 ?auto_43742 ) )
    :subtasks
    ( ( !DRIVE ?auto_43743 ?auto_43742 ?auto_43749 )
      ( MAKE-ON ?auto_43730 ?auto_43731 )
      ( MAKE-ON-VERIFY ?auto_43730 ?auto_43731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43752 - SURFACE
      ?auto_43753 - SURFACE
    )
    :vars
    (
      ?auto_43754 - HOIST
      ?auto_43755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43754 ?auto_43755 ) ( SURFACE-AT ?auto_43753 ?auto_43755 ) ( CLEAR ?auto_43753 ) ( LIFTING ?auto_43754 ?auto_43752 ) ( IS-CRATE ?auto_43752 ) ( not ( = ?auto_43752 ?auto_43753 ) ) )
    :subtasks
    ( ( !DROP ?auto_43754 ?auto_43752 ?auto_43753 ?auto_43755 )
      ( MAKE-ON-VERIFY ?auto_43752 ?auto_43753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43756 - SURFACE
      ?auto_43757 - SURFACE
    )
    :vars
    (
      ?auto_43759 - HOIST
      ?auto_43758 - PLACE
      ?auto_43760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43759 ?auto_43758 ) ( SURFACE-AT ?auto_43757 ?auto_43758 ) ( CLEAR ?auto_43757 ) ( IS-CRATE ?auto_43756 ) ( not ( = ?auto_43756 ?auto_43757 ) ) ( TRUCK-AT ?auto_43760 ?auto_43758 ) ( AVAILABLE ?auto_43759 ) ( IN ?auto_43756 ?auto_43760 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43759 ?auto_43756 ?auto_43760 ?auto_43758 )
      ( MAKE-ON ?auto_43756 ?auto_43757 )
      ( MAKE-ON-VERIFY ?auto_43756 ?auto_43757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43761 - SURFACE
      ?auto_43762 - SURFACE
    )
    :vars
    (
      ?auto_43764 - HOIST
      ?auto_43763 - PLACE
      ?auto_43765 - TRUCK
      ?auto_43766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43764 ?auto_43763 ) ( SURFACE-AT ?auto_43762 ?auto_43763 ) ( CLEAR ?auto_43762 ) ( IS-CRATE ?auto_43761 ) ( not ( = ?auto_43761 ?auto_43762 ) ) ( AVAILABLE ?auto_43764 ) ( IN ?auto_43761 ?auto_43765 ) ( TRUCK-AT ?auto_43765 ?auto_43766 ) ( not ( = ?auto_43766 ?auto_43763 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43765 ?auto_43766 ?auto_43763 )
      ( MAKE-ON ?auto_43761 ?auto_43762 )
      ( MAKE-ON-VERIFY ?auto_43761 ?auto_43762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43767 - SURFACE
      ?auto_43768 - SURFACE
    )
    :vars
    (
      ?auto_43772 - HOIST
      ?auto_43771 - PLACE
      ?auto_43769 - TRUCK
      ?auto_43770 - PLACE
      ?auto_43773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43772 ?auto_43771 ) ( SURFACE-AT ?auto_43768 ?auto_43771 ) ( CLEAR ?auto_43768 ) ( IS-CRATE ?auto_43767 ) ( not ( = ?auto_43767 ?auto_43768 ) ) ( AVAILABLE ?auto_43772 ) ( TRUCK-AT ?auto_43769 ?auto_43770 ) ( not ( = ?auto_43770 ?auto_43771 ) ) ( HOIST-AT ?auto_43773 ?auto_43770 ) ( LIFTING ?auto_43773 ?auto_43767 ) ( not ( = ?auto_43772 ?auto_43773 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43773 ?auto_43767 ?auto_43769 ?auto_43770 )
      ( MAKE-ON ?auto_43767 ?auto_43768 )
      ( MAKE-ON-VERIFY ?auto_43767 ?auto_43768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43774 - SURFACE
      ?auto_43775 - SURFACE
    )
    :vars
    (
      ?auto_43776 - HOIST
      ?auto_43777 - PLACE
      ?auto_43779 - TRUCK
      ?auto_43778 - PLACE
      ?auto_43780 - HOIST
      ?auto_43781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43776 ?auto_43777 ) ( SURFACE-AT ?auto_43775 ?auto_43777 ) ( CLEAR ?auto_43775 ) ( IS-CRATE ?auto_43774 ) ( not ( = ?auto_43774 ?auto_43775 ) ) ( AVAILABLE ?auto_43776 ) ( TRUCK-AT ?auto_43779 ?auto_43778 ) ( not ( = ?auto_43778 ?auto_43777 ) ) ( HOIST-AT ?auto_43780 ?auto_43778 ) ( not ( = ?auto_43776 ?auto_43780 ) ) ( AVAILABLE ?auto_43780 ) ( SURFACE-AT ?auto_43774 ?auto_43778 ) ( ON ?auto_43774 ?auto_43781 ) ( CLEAR ?auto_43774 ) ( not ( = ?auto_43774 ?auto_43781 ) ) ( not ( = ?auto_43775 ?auto_43781 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43780 ?auto_43774 ?auto_43781 ?auto_43778 )
      ( MAKE-ON ?auto_43774 ?auto_43775 )
      ( MAKE-ON-VERIFY ?auto_43774 ?auto_43775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43782 - SURFACE
      ?auto_43783 - SURFACE
    )
    :vars
    (
      ?auto_43784 - HOIST
      ?auto_43789 - PLACE
      ?auto_43787 - PLACE
      ?auto_43786 - HOIST
      ?auto_43785 - SURFACE
      ?auto_43788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43784 ?auto_43789 ) ( SURFACE-AT ?auto_43783 ?auto_43789 ) ( CLEAR ?auto_43783 ) ( IS-CRATE ?auto_43782 ) ( not ( = ?auto_43782 ?auto_43783 ) ) ( AVAILABLE ?auto_43784 ) ( not ( = ?auto_43787 ?auto_43789 ) ) ( HOIST-AT ?auto_43786 ?auto_43787 ) ( not ( = ?auto_43784 ?auto_43786 ) ) ( AVAILABLE ?auto_43786 ) ( SURFACE-AT ?auto_43782 ?auto_43787 ) ( ON ?auto_43782 ?auto_43785 ) ( CLEAR ?auto_43782 ) ( not ( = ?auto_43782 ?auto_43785 ) ) ( not ( = ?auto_43783 ?auto_43785 ) ) ( TRUCK-AT ?auto_43788 ?auto_43789 ) )
    :subtasks
    ( ( !DRIVE ?auto_43788 ?auto_43789 ?auto_43787 )
      ( MAKE-ON ?auto_43782 ?auto_43783 )
      ( MAKE-ON-VERIFY ?auto_43782 ?auto_43783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43790 - SURFACE
      ?auto_43791 - SURFACE
    )
    :vars
    (
      ?auto_43792 - HOIST
      ?auto_43794 - PLACE
      ?auto_43795 - PLACE
      ?auto_43793 - HOIST
      ?auto_43797 - SURFACE
      ?auto_43796 - TRUCK
      ?auto_43798 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43792 ?auto_43794 ) ( IS-CRATE ?auto_43790 ) ( not ( = ?auto_43790 ?auto_43791 ) ) ( not ( = ?auto_43795 ?auto_43794 ) ) ( HOIST-AT ?auto_43793 ?auto_43795 ) ( not ( = ?auto_43792 ?auto_43793 ) ) ( AVAILABLE ?auto_43793 ) ( SURFACE-AT ?auto_43790 ?auto_43795 ) ( ON ?auto_43790 ?auto_43797 ) ( CLEAR ?auto_43790 ) ( not ( = ?auto_43790 ?auto_43797 ) ) ( not ( = ?auto_43791 ?auto_43797 ) ) ( TRUCK-AT ?auto_43796 ?auto_43794 ) ( SURFACE-AT ?auto_43798 ?auto_43794 ) ( CLEAR ?auto_43798 ) ( LIFTING ?auto_43792 ?auto_43791 ) ( IS-CRATE ?auto_43791 ) ( not ( = ?auto_43790 ?auto_43798 ) ) ( not ( = ?auto_43791 ?auto_43798 ) ) ( not ( = ?auto_43797 ?auto_43798 ) ) )
    :subtasks
    ( ( !DROP ?auto_43792 ?auto_43791 ?auto_43798 ?auto_43794 )
      ( MAKE-ON ?auto_43790 ?auto_43791 )
      ( MAKE-ON-VERIFY ?auto_43790 ?auto_43791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43799 - SURFACE
      ?auto_43800 - SURFACE
    )
    :vars
    (
      ?auto_43803 - HOIST
      ?auto_43806 - PLACE
      ?auto_43805 - PLACE
      ?auto_43807 - HOIST
      ?auto_43801 - SURFACE
      ?auto_43802 - TRUCK
      ?auto_43804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43803 ?auto_43806 ) ( IS-CRATE ?auto_43799 ) ( not ( = ?auto_43799 ?auto_43800 ) ) ( not ( = ?auto_43805 ?auto_43806 ) ) ( HOIST-AT ?auto_43807 ?auto_43805 ) ( not ( = ?auto_43803 ?auto_43807 ) ) ( AVAILABLE ?auto_43807 ) ( SURFACE-AT ?auto_43799 ?auto_43805 ) ( ON ?auto_43799 ?auto_43801 ) ( CLEAR ?auto_43799 ) ( not ( = ?auto_43799 ?auto_43801 ) ) ( not ( = ?auto_43800 ?auto_43801 ) ) ( TRUCK-AT ?auto_43802 ?auto_43806 ) ( SURFACE-AT ?auto_43804 ?auto_43806 ) ( CLEAR ?auto_43804 ) ( IS-CRATE ?auto_43800 ) ( not ( = ?auto_43799 ?auto_43804 ) ) ( not ( = ?auto_43800 ?auto_43804 ) ) ( not ( = ?auto_43801 ?auto_43804 ) ) ( AVAILABLE ?auto_43803 ) ( IN ?auto_43800 ?auto_43802 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43803 ?auto_43800 ?auto_43802 ?auto_43806 )
      ( MAKE-ON ?auto_43799 ?auto_43800 )
      ( MAKE-ON-VERIFY ?auto_43799 ?auto_43800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43808 - SURFACE
      ?auto_43809 - SURFACE
    )
    :vars
    (
      ?auto_43810 - HOIST
      ?auto_43811 - PLACE
      ?auto_43815 - PLACE
      ?auto_43816 - HOIST
      ?auto_43814 - SURFACE
      ?auto_43812 - SURFACE
      ?auto_43813 - TRUCK
      ?auto_43817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43810 ?auto_43811 ) ( IS-CRATE ?auto_43808 ) ( not ( = ?auto_43808 ?auto_43809 ) ) ( not ( = ?auto_43815 ?auto_43811 ) ) ( HOIST-AT ?auto_43816 ?auto_43815 ) ( not ( = ?auto_43810 ?auto_43816 ) ) ( AVAILABLE ?auto_43816 ) ( SURFACE-AT ?auto_43808 ?auto_43815 ) ( ON ?auto_43808 ?auto_43814 ) ( CLEAR ?auto_43808 ) ( not ( = ?auto_43808 ?auto_43814 ) ) ( not ( = ?auto_43809 ?auto_43814 ) ) ( SURFACE-AT ?auto_43812 ?auto_43811 ) ( CLEAR ?auto_43812 ) ( IS-CRATE ?auto_43809 ) ( not ( = ?auto_43808 ?auto_43812 ) ) ( not ( = ?auto_43809 ?auto_43812 ) ) ( not ( = ?auto_43814 ?auto_43812 ) ) ( AVAILABLE ?auto_43810 ) ( IN ?auto_43809 ?auto_43813 ) ( TRUCK-AT ?auto_43813 ?auto_43817 ) ( not ( = ?auto_43817 ?auto_43811 ) ) ( not ( = ?auto_43815 ?auto_43817 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43813 ?auto_43817 ?auto_43811 )
      ( MAKE-ON ?auto_43808 ?auto_43809 )
      ( MAKE-ON-VERIFY ?auto_43808 ?auto_43809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43818 - SURFACE
      ?auto_43819 - SURFACE
    )
    :vars
    (
      ?auto_43820 - HOIST
      ?auto_43826 - PLACE
      ?auto_43821 - PLACE
      ?auto_43822 - HOIST
      ?auto_43827 - SURFACE
      ?auto_43824 - SURFACE
      ?auto_43825 - TRUCK
      ?auto_43823 - PLACE
      ?auto_43828 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43820 ?auto_43826 ) ( IS-CRATE ?auto_43818 ) ( not ( = ?auto_43818 ?auto_43819 ) ) ( not ( = ?auto_43821 ?auto_43826 ) ) ( HOIST-AT ?auto_43822 ?auto_43821 ) ( not ( = ?auto_43820 ?auto_43822 ) ) ( AVAILABLE ?auto_43822 ) ( SURFACE-AT ?auto_43818 ?auto_43821 ) ( ON ?auto_43818 ?auto_43827 ) ( CLEAR ?auto_43818 ) ( not ( = ?auto_43818 ?auto_43827 ) ) ( not ( = ?auto_43819 ?auto_43827 ) ) ( SURFACE-AT ?auto_43824 ?auto_43826 ) ( CLEAR ?auto_43824 ) ( IS-CRATE ?auto_43819 ) ( not ( = ?auto_43818 ?auto_43824 ) ) ( not ( = ?auto_43819 ?auto_43824 ) ) ( not ( = ?auto_43827 ?auto_43824 ) ) ( AVAILABLE ?auto_43820 ) ( TRUCK-AT ?auto_43825 ?auto_43823 ) ( not ( = ?auto_43823 ?auto_43826 ) ) ( not ( = ?auto_43821 ?auto_43823 ) ) ( HOIST-AT ?auto_43828 ?auto_43823 ) ( LIFTING ?auto_43828 ?auto_43819 ) ( not ( = ?auto_43820 ?auto_43828 ) ) ( not ( = ?auto_43822 ?auto_43828 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43828 ?auto_43819 ?auto_43825 ?auto_43823 )
      ( MAKE-ON ?auto_43818 ?auto_43819 )
      ( MAKE-ON-VERIFY ?auto_43818 ?auto_43819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43829 - SURFACE
      ?auto_43830 - SURFACE
    )
    :vars
    (
      ?auto_43832 - HOIST
      ?auto_43839 - PLACE
      ?auto_43835 - PLACE
      ?auto_43833 - HOIST
      ?auto_43837 - SURFACE
      ?auto_43838 - SURFACE
      ?auto_43836 - TRUCK
      ?auto_43834 - PLACE
      ?auto_43831 - HOIST
      ?auto_43840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43832 ?auto_43839 ) ( IS-CRATE ?auto_43829 ) ( not ( = ?auto_43829 ?auto_43830 ) ) ( not ( = ?auto_43835 ?auto_43839 ) ) ( HOIST-AT ?auto_43833 ?auto_43835 ) ( not ( = ?auto_43832 ?auto_43833 ) ) ( AVAILABLE ?auto_43833 ) ( SURFACE-AT ?auto_43829 ?auto_43835 ) ( ON ?auto_43829 ?auto_43837 ) ( CLEAR ?auto_43829 ) ( not ( = ?auto_43829 ?auto_43837 ) ) ( not ( = ?auto_43830 ?auto_43837 ) ) ( SURFACE-AT ?auto_43838 ?auto_43839 ) ( CLEAR ?auto_43838 ) ( IS-CRATE ?auto_43830 ) ( not ( = ?auto_43829 ?auto_43838 ) ) ( not ( = ?auto_43830 ?auto_43838 ) ) ( not ( = ?auto_43837 ?auto_43838 ) ) ( AVAILABLE ?auto_43832 ) ( TRUCK-AT ?auto_43836 ?auto_43834 ) ( not ( = ?auto_43834 ?auto_43839 ) ) ( not ( = ?auto_43835 ?auto_43834 ) ) ( HOIST-AT ?auto_43831 ?auto_43834 ) ( not ( = ?auto_43832 ?auto_43831 ) ) ( not ( = ?auto_43833 ?auto_43831 ) ) ( AVAILABLE ?auto_43831 ) ( SURFACE-AT ?auto_43830 ?auto_43834 ) ( ON ?auto_43830 ?auto_43840 ) ( CLEAR ?auto_43830 ) ( not ( = ?auto_43829 ?auto_43840 ) ) ( not ( = ?auto_43830 ?auto_43840 ) ) ( not ( = ?auto_43837 ?auto_43840 ) ) ( not ( = ?auto_43838 ?auto_43840 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43831 ?auto_43830 ?auto_43840 ?auto_43834 )
      ( MAKE-ON ?auto_43829 ?auto_43830 )
      ( MAKE-ON-VERIFY ?auto_43829 ?auto_43830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43841 - SURFACE
      ?auto_43842 - SURFACE
    )
    :vars
    (
      ?auto_43848 - HOIST
      ?auto_43849 - PLACE
      ?auto_43845 - PLACE
      ?auto_43851 - HOIST
      ?auto_43846 - SURFACE
      ?auto_43847 - SURFACE
      ?auto_43852 - PLACE
      ?auto_43844 - HOIST
      ?auto_43850 - SURFACE
      ?auto_43843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43848 ?auto_43849 ) ( IS-CRATE ?auto_43841 ) ( not ( = ?auto_43841 ?auto_43842 ) ) ( not ( = ?auto_43845 ?auto_43849 ) ) ( HOIST-AT ?auto_43851 ?auto_43845 ) ( not ( = ?auto_43848 ?auto_43851 ) ) ( AVAILABLE ?auto_43851 ) ( SURFACE-AT ?auto_43841 ?auto_43845 ) ( ON ?auto_43841 ?auto_43846 ) ( CLEAR ?auto_43841 ) ( not ( = ?auto_43841 ?auto_43846 ) ) ( not ( = ?auto_43842 ?auto_43846 ) ) ( SURFACE-AT ?auto_43847 ?auto_43849 ) ( CLEAR ?auto_43847 ) ( IS-CRATE ?auto_43842 ) ( not ( = ?auto_43841 ?auto_43847 ) ) ( not ( = ?auto_43842 ?auto_43847 ) ) ( not ( = ?auto_43846 ?auto_43847 ) ) ( AVAILABLE ?auto_43848 ) ( not ( = ?auto_43852 ?auto_43849 ) ) ( not ( = ?auto_43845 ?auto_43852 ) ) ( HOIST-AT ?auto_43844 ?auto_43852 ) ( not ( = ?auto_43848 ?auto_43844 ) ) ( not ( = ?auto_43851 ?auto_43844 ) ) ( AVAILABLE ?auto_43844 ) ( SURFACE-AT ?auto_43842 ?auto_43852 ) ( ON ?auto_43842 ?auto_43850 ) ( CLEAR ?auto_43842 ) ( not ( = ?auto_43841 ?auto_43850 ) ) ( not ( = ?auto_43842 ?auto_43850 ) ) ( not ( = ?auto_43846 ?auto_43850 ) ) ( not ( = ?auto_43847 ?auto_43850 ) ) ( TRUCK-AT ?auto_43843 ?auto_43849 ) )
    :subtasks
    ( ( !DRIVE ?auto_43843 ?auto_43849 ?auto_43852 )
      ( MAKE-ON ?auto_43841 ?auto_43842 )
      ( MAKE-ON-VERIFY ?auto_43841 ?auto_43842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43853 - SURFACE
      ?auto_43854 - SURFACE
    )
    :vars
    (
      ?auto_43858 - HOIST
      ?auto_43863 - PLACE
      ?auto_43859 - PLACE
      ?auto_43864 - HOIST
      ?auto_43862 - SURFACE
      ?auto_43856 - SURFACE
      ?auto_43860 - PLACE
      ?auto_43855 - HOIST
      ?auto_43857 - SURFACE
      ?auto_43861 - TRUCK
      ?auto_43865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43858 ?auto_43863 ) ( IS-CRATE ?auto_43853 ) ( not ( = ?auto_43853 ?auto_43854 ) ) ( not ( = ?auto_43859 ?auto_43863 ) ) ( HOIST-AT ?auto_43864 ?auto_43859 ) ( not ( = ?auto_43858 ?auto_43864 ) ) ( AVAILABLE ?auto_43864 ) ( SURFACE-AT ?auto_43853 ?auto_43859 ) ( ON ?auto_43853 ?auto_43862 ) ( CLEAR ?auto_43853 ) ( not ( = ?auto_43853 ?auto_43862 ) ) ( not ( = ?auto_43854 ?auto_43862 ) ) ( IS-CRATE ?auto_43854 ) ( not ( = ?auto_43853 ?auto_43856 ) ) ( not ( = ?auto_43854 ?auto_43856 ) ) ( not ( = ?auto_43862 ?auto_43856 ) ) ( not ( = ?auto_43860 ?auto_43863 ) ) ( not ( = ?auto_43859 ?auto_43860 ) ) ( HOIST-AT ?auto_43855 ?auto_43860 ) ( not ( = ?auto_43858 ?auto_43855 ) ) ( not ( = ?auto_43864 ?auto_43855 ) ) ( AVAILABLE ?auto_43855 ) ( SURFACE-AT ?auto_43854 ?auto_43860 ) ( ON ?auto_43854 ?auto_43857 ) ( CLEAR ?auto_43854 ) ( not ( = ?auto_43853 ?auto_43857 ) ) ( not ( = ?auto_43854 ?auto_43857 ) ) ( not ( = ?auto_43862 ?auto_43857 ) ) ( not ( = ?auto_43856 ?auto_43857 ) ) ( TRUCK-AT ?auto_43861 ?auto_43863 ) ( SURFACE-AT ?auto_43865 ?auto_43863 ) ( CLEAR ?auto_43865 ) ( LIFTING ?auto_43858 ?auto_43856 ) ( IS-CRATE ?auto_43856 ) ( not ( = ?auto_43853 ?auto_43865 ) ) ( not ( = ?auto_43854 ?auto_43865 ) ) ( not ( = ?auto_43862 ?auto_43865 ) ) ( not ( = ?auto_43856 ?auto_43865 ) ) ( not ( = ?auto_43857 ?auto_43865 ) ) )
    :subtasks
    ( ( !DROP ?auto_43858 ?auto_43856 ?auto_43865 ?auto_43863 )
      ( MAKE-ON ?auto_43853 ?auto_43854 )
      ( MAKE-ON-VERIFY ?auto_43853 ?auto_43854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43866 - SURFACE
      ?auto_43867 - SURFACE
    )
    :vars
    (
      ?auto_43870 - HOIST
      ?auto_43872 - PLACE
      ?auto_43877 - PLACE
      ?auto_43875 - HOIST
      ?auto_43876 - SURFACE
      ?auto_43871 - SURFACE
      ?auto_43869 - PLACE
      ?auto_43874 - HOIST
      ?auto_43868 - SURFACE
      ?auto_43878 - TRUCK
      ?auto_43873 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43870 ?auto_43872 ) ( IS-CRATE ?auto_43866 ) ( not ( = ?auto_43866 ?auto_43867 ) ) ( not ( = ?auto_43877 ?auto_43872 ) ) ( HOIST-AT ?auto_43875 ?auto_43877 ) ( not ( = ?auto_43870 ?auto_43875 ) ) ( AVAILABLE ?auto_43875 ) ( SURFACE-AT ?auto_43866 ?auto_43877 ) ( ON ?auto_43866 ?auto_43876 ) ( CLEAR ?auto_43866 ) ( not ( = ?auto_43866 ?auto_43876 ) ) ( not ( = ?auto_43867 ?auto_43876 ) ) ( IS-CRATE ?auto_43867 ) ( not ( = ?auto_43866 ?auto_43871 ) ) ( not ( = ?auto_43867 ?auto_43871 ) ) ( not ( = ?auto_43876 ?auto_43871 ) ) ( not ( = ?auto_43869 ?auto_43872 ) ) ( not ( = ?auto_43877 ?auto_43869 ) ) ( HOIST-AT ?auto_43874 ?auto_43869 ) ( not ( = ?auto_43870 ?auto_43874 ) ) ( not ( = ?auto_43875 ?auto_43874 ) ) ( AVAILABLE ?auto_43874 ) ( SURFACE-AT ?auto_43867 ?auto_43869 ) ( ON ?auto_43867 ?auto_43868 ) ( CLEAR ?auto_43867 ) ( not ( = ?auto_43866 ?auto_43868 ) ) ( not ( = ?auto_43867 ?auto_43868 ) ) ( not ( = ?auto_43876 ?auto_43868 ) ) ( not ( = ?auto_43871 ?auto_43868 ) ) ( TRUCK-AT ?auto_43878 ?auto_43872 ) ( SURFACE-AT ?auto_43873 ?auto_43872 ) ( CLEAR ?auto_43873 ) ( IS-CRATE ?auto_43871 ) ( not ( = ?auto_43866 ?auto_43873 ) ) ( not ( = ?auto_43867 ?auto_43873 ) ) ( not ( = ?auto_43876 ?auto_43873 ) ) ( not ( = ?auto_43871 ?auto_43873 ) ) ( not ( = ?auto_43868 ?auto_43873 ) ) ( AVAILABLE ?auto_43870 ) ( IN ?auto_43871 ?auto_43878 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43870 ?auto_43871 ?auto_43878 ?auto_43872 )
      ( MAKE-ON ?auto_43866 ?auto_43867 )
      ( MAKE-ON-VERIFY ?auto_43866 ?auto_43867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43879 - SURFACE
      ?auto_43880 - SURFACE
    )
    :vars
    (
      ?auto_43881 - HOIST
      ?auto_43886 - PLACE
      ?auto_43891 - PLACE
      ?auto_43890 - HOIST
      ?auto_43888 - SURFACE
      ?auto_43883 - SURFACE
      ?auto_43887 - PLACE
      ?auto_43882 - HOIST
      ?auto_43885 - SURFACE
      ?auto_43889 - SURFACE
      ?auto_43884 - TRUCK
      ?auto_43892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43881 ?auto_43886 ) ( IS-CRATE ?auto_43879 ) ( not ( = ?auto_43879 ?auto_43880 ) ) ( not ( = ?auto_43891 ?auto_43886 ) ) ( HOIST-AT ?auto_43890 ?auto_43891 ) ( not ( = ?auto_43881 ?auto_43890 ) ) ( AVAILABLE ?auto_43890 ) ( SURFACE-AT ?auto_43879 ?auto_43891 ) ( ON ?auto_43879 ?auto_43888 ) ( CLEAR ?auto_43879 ) ( not ( = ?auto_43879 ?auto_43888 ) ) ( not ( = ?auto_43880 ?auto_43888 ) ) ( IS-CRATE ?auto_43880 ) ( not ( = ?auto_43879 ?auto_43883 ) ) ( not ( = ?auto_43880 ?auto_43883 ) ) ( not ( = ?auto_43888 ?auto_43883 ) ) ( not ( = ?auto_43887 ?auto_43886 ) ) ( not ( = ?auto_43891 ?auto_43887 ) ) ( HOIST-AT ?auto_43882 ?auto_43887 ) ( not ( = ?auto_43881 ?auto_43882 ) ) ( not ( = ?auto_43890 ?auto_43882 ) ) ( AVAILABLE ?auto_43882 ) ( SURFACE-AT ?auto_43880 ?auto_43887 ) ( ON ?auto_43880 ?auto_43885 ) ( CLEAR ?auto_43880 ) ( not ( = ?auto_43879 ?auto_43885 ) ) ( not ( = ?auto_43880 ?auto_43885 ) ) ( not ( = ?auto_43888 ?auto_43885 ) ) ( not ( = ?auto_43883 ?auto_43885 ) ) ( SURFACE-AT ?auto_43889 ?auto_43886 ) ( CLEAR ?auto_43889 ) ( IS-CRATE ?auto_43883 ) ( not ( = ?auto_43879 ?auto_43889 ) ) ( not ( = ?auto_43880 ?auto_43889 ) ) ( not ( = ?auto_43888 ?auto_43889 ) ) ( not ( = ?auto_43883 ?auto_43889 ) ) ( not ( = ?auto_43885 ?auto_43889 ) ) ( AVAILABLE ?auto_43881 ) ( IN ?auto_43883 ?auto_43884 ) ( TRUCK-AT ?auto_43884 ?auto_43892 ) ( not ( = ?auto_43892 ?auto_43886 ) ) ( not ( = ?auto_43891 ?auto_43892 ) ) ( not ( = ?auto_43887 ?auto_43892 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43884 ?auto_43892 ?auto_43886 )
      ( MAKE-ON ?auto_43879 ?auto_43880 )
      ( MAKE-ON-VERIFY ?auto_43879 ?auto_43880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43893 - SURFACE
      ?auto_43894 - SURFACE
    )
    :vars
    (
      ?auto_43898 - HOIST
      ?auto_43902 - PLACE
      ?auto_43900 - PLACE
      ?auto_43906 - HOIST
      ?auto_43905 - SURFACE
      ?auto_43897 - SURFACE
      ?auto_43895 - PLACE
      ?auto_43899 - HOIST
      ?auto_43903 - SURFACE
      ?auto_43896 - SURFACE
      ?auto_43901 - TRUCK
      ?auto_43904 - PLACE
      ?auto_43907 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43898 ?auto_43902 ) ( IS-CRATE ?auto_43893 ) ( not ( = ?auto_43893 ?auto_43894 ) ) ( not ( = ?auto_43900 ?auto_43902 ) ) ( HOIST-AT ?auto_43906 ?auto_43900 ) ( not ( = ?auto_43898 ?auto_43906 ) ) ( AVAILABLE ?auto_43906 ) ( SURFACE-AT ?auto_43893 ?auto_43900 ) ( ON ?auto_43893 ?auto_43905 ) ( CLEAR ?auto_43893 ) ( not ( = ?auto_43893 ?auto_43905 ) ) ( not ( = ?auto_43894 ?auto_43905 ) ) ( IS-CRATE ?auto_43894 ) ( not ( = ?auto_43893 ?auto_43897 ) ) ( not ( = ?auto_43894 ?auto_43897 ) ) ( not ( = ?auto_43905 ?auto_43897 ) ) ( not ( = ?auto_43895 ?auto_43902 ) ) ( not ( = ?auto_43900 ?auto_43895 ) ) ( HOIST-AT ?auto_43899 ?auto_43895 ) ( not ( = ?auto_43898 ?auto_43899 ) ) ( not ( = ?auto_43906 ?auto_43899 ) ) ( AVAILABLE ?auto_43899 ) ( SURFACE-AT ?auto_43894 ?auto_43895 ) ( ON ?auto_43894 ?auto_43903 ) ( CLEAR ?auto_43894 ) ( not ( = ?auto_43893 ?auto_43903 ) ) ( not ( = ?auto_43894 ?auto_43903 ) ) ( not ( = ?auto_43905 ?auto_43903 ) ) ( not ( = ?auto_43897 ?auto_43903 ) ) ( SURFACE-AT ?auto_43896 ?auto_43902 ) ( CLEAR ?auto_43896 ) ( IS-CRATE ?auto_43897 ) ( not ( = ?auto_43893 ?auto_43896 ) ) ( not ( = ?auto_43894 ?auto_43896 ) ) ( not ( = ?auto_43905 ?auto_43896 ) ) ( not ( = ?auto_43897 ?auto_43896 ) ) ( not ( = ?auto_43903 ?auto_43896 ) ) ( AVAILABLE ?auto_43898 ) ( TRUCK-AT ?auto_43901 ?auto_43904 ) ( not ( = ?auto_43904 ?auto_43902 ) ) ( not ( = ?auto_43900 ?auto_43904 ) ) ( not ( = ?auto_43895 ?auto_43904 ) ) ( HOIST-AT ?auto_43907 ?auto_43904 ) ( LIFTING ?auto_43907 ?auto_43897 ) ( not ( = ?auto_43898 ?auto_43907 ) ) ( not ( = ?auto_43906 ?auto_43907 ) ) ( not ( = ?auto_43899 ?auto_43907 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43907 ?auto_43897 ?auto_43901 ?auto_43904 )
      ( MAKE-ON ?auto_43893 ?auto_43894 )
      ( MAKE-ON-VERIFY ?auto_43893 ?auto_43894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43908 - SURFACE
      ?auto_43909 - SURFACE
    )
    :vars
    (
      ?auto_43912 - HOIST
      ?auto_43922 - PLACE
      ?auto_43918 - PLACE
      ?auto_43914 - HOIST
      ?auto_43911 - SURFACE
      ?auto_43920 - SURFACE
      ?auto_43915 - PLACE
      ?auto_43913 - HOIST
      ?auto_43910 - SURFACE
      ?auto_43917 - SURFACE
      ?auto_43916 - TRUCK
      ?auto_43919 - PLACE
      ?auto_43921 - HOIST
      ?auto_43923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43912 ?auto_43922 ) ( IS-CRATE ?auto_43908 ) ( not ( = ?auto_43908 ?auto_43909 ) ) ( not ( = ?auto_43918 ?auto_43922 ) ) ( HOIST-AT ?auto_43914 ?auto_43918 ) ( not ( = ?auto_43912 ?auto_43914 ) ) ( AVAILABLE ?auto_43914 ) ( SURFACE-AT ?auto_43908 ?auto_43918 ) ( ON ?auto_43908 ?auto_43911 ) ( CLEAR ?auto_43908 ) ( not ( = ?auto_43908 ?auto_43911 ) ) ( not ( = ?auto_43909 ?auto_43911 ) ) ( IS-CRATE ?auto_43909 ) ( not ( = ?auto_43908 ?auto_43920 ) ) ( not ( = ?auto_43909 ?auto_43920 ) ) ( not ( = ?auto_43911 ?auto_43920 ) ) ( not ( = ?auto_43915 ?auto_43922 ) ) ( not ( = ?auto_43918 ?auto_43915 ) ) ( HOIST-AT ?auto_43913 ?auto_43915 ) ( not ( = ?auto_43912 ?auto_43913 ) ) ( not ( = ?auto_43914 ?auto_43913 ) ) ( AVAILABLE ?auto_43913 ) ( SURFACE-AT ?auto_43909 ?auto_43915 ) ( ON ?auto_43909 ?auto_43910 ) ( CLEAR ?auto_43909 ) ( not ( = ?auto_43908 ?auto_43910 ) ) ( not ( = ?auto_43909 ?auto_43910 ) ) ( not ( = ?auto_43911 ?auto_43910 ) ) ( not ( = ?auto_43920 ?auto_43910 ) ) ( SURFACE-AT ?auto_43917 ?auto_43922 ) ( CLEAR ?auto_43917 ) ( IS-CRATE ?auto_43920 ) ( not ( = ?auto_43908 ?auto_43917 ) ) ( not ( = ?auto_43909 ?auto_43917 ) ) ( not ( = ?auto_43911 ?auto_43917 ) ) ( not ( = ?auto_43920 ?auto_43917 ) ) ( not ( = ?auto_43910 ?auto_43917 ) ) ( AVAILABLE ?auto_43912 ) ( TRUCK-AT ?auto_43916 ?auto_43919 ) ( not ( = ?auto_43919 ?auto_43922 ) ) ( not ( = ?auto_43918 ?auto_43919 ) ) ( not ( = ?auto_43915 ?auto_43919 ) ) ( HOIST-AT ?auto_43921 ?auto_43919 ) ( not ( = ?auto_43912 ?auto_43921 ) ) ( not ( = ?auto_43914 ?auto_43921 ) ) ( not ( = ?auto_43913 ?auto_43921 ) ) ( AVAILABLE ?auto_43921 ) ( SURFACE-AT ?auto_43920 ?auto_43919 ) ( ON ?auto_43920 ?auto_43923 ) ( CLEAR ?auto_43920 ) ( not ( = ?auto_43908 ?auto_43923 ) ) ( not ( = ?auto_43909 ?auto_43923 ) ) ( not ( = ?auto_43911 ?auto_43923 ) ) ( not ( = ?auto_43920 ?auto_43923 ) ) ( not ( = ?auto_43910 ?auto_43923 ) ) ( not ( = ?auto_43917 ?auto_43923 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43921 ?auto_43920 ?auto_43923 ?auto_43919 )
      ( MAKE-ON ?auto_43908 ?auto_43909 )
      ( MAKE-ON-VERIFY ?auto_43908 ?auto_43909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43924 - SURFACE
      ?auto_43925 - SURFACE
    )
    :vars
    (
      ?auto_43934 - HOIST
      ?auto_43932 - PLACE
      ?auto_43938 - PLACE
      ?auto_43930 - HOIST
      ?auto_43926 - SURFACE
      ?auto_43931 - SURFACE
      ?auto_43928 - PLACE
      ?auto_43936 - HOIST
      ?auto_43927 - SURFACE
      ?auto_43937 - SURFACE
      ?auto_43933 - PLACE
      ?auto_43929 - HOIST
      ?auto_43935 - SURFACE
      ?auto_43939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43934 ?auto_43932 ) ( IS-CRATE ?auto_43924 ) ( not ( = ?auto_43924 ?auto_43925 ) ) ( not ( = ?auto_43938 ?auto_43932 ) ) ( HOIST-AT ?auto_43930 ?auto_43938 ) ( not ( = ?auto_43934 ?auto_43930 ) ) ( AVAILABLE ?auto_43930 ) ( SURFACE-AT ?auto_43924 ?auto_43938 ) ( ON ?auto_43924 ?auto_43926 ) ( CLEAR ?auto_43924 ) ( not ( = ?auto_43924 ?auto_43926 ) ) ( not ( = ?auto_43925 ?auto_43926 ) ) ( IS-CRATE ?auto_43925 ) ( not ( = ?auto_43924 ?auto_43931 ) ) ( not ( = ?auto_43925 ?auto_43931 ) ) ( not ( = ?auto_43926 ?auto_43931 ) ) ( not ( = ?auto_43928 ?auto_43932 ) ) ( not ( = ?auto_43938 ?auto_43928 ) ) ( HOIST-AT ?auto_43936 ?auto_43928 ) ( not ( = ?auto_43934 ?auto_43936 ) ) ( not ( = ?auto_43930 ?auto_43936 ) ) ( AVAILABLE ?auto_43936 ) ( SURFACE-AT ?auto_43925 ?auto_43928 ) ( ON ?auto_43925 ?auto_43927 ) ( CLEAR ?auto_43925 ) ( not ( = ?auto_43924 ?auto_43927 ) ) ( not ( = ?auto_43925 ?auto_43927 ) ) ( not ( = ?auto_43926 ?auto_43927 ) ) ( not ( = ?auto_43931 ?auto_43927 ) ) ( SURFACE-AT ?auto_43937 ?auto_43932 ) ( CLEAR ?auto_43937 ) ( IS-CRATE ?auto_43931 ) ( not ( = ?auto_43924 ?auto_43937 ) ) ( not ( = ?auto_43925 ?auto_43937 ) ) ( not ( = ?auto_43926 ?auto_43937 ) ) ( not ( = ?auto_43931 ?auto_43937 ) ) ( not ( = ?auto_43927 ?auto_43937 ) ) ( AVAILABLE ?auto_43934 ) ( not ( = ?auto_43933 ?auto_43932 ) ) ( not ( = ?auto_43938 ?auto_43933 ) ) ( not ( = ?auto_43928 ?auto_43933 ) ) ( HOIST-AT ?auto_43929 ?auto_43933 ) ( not ( = ?auto_43934 ?auto_43929 ) ) ( not ( = ?auto_43930 ?auto_43929 ) ) ( not ( = ?auto_43936 ?auto_43929 ) ) ( AVAILABLE ?auto_43929 ) ( SURFACE-AT ?auto_43931 ?auto_43933 ) ( ON ?auto_43931 ?auto_43935 ) ( CLEAR ?auto_43931 ) ( not ( = ?auto_43924 ?auto_43935 ) ) ( not ( = ?auto_43925 ?auto_43935 ) ) ( not ( = ?auto_43926 ?auto_43935 ) ) ( not ( = ?auto_43931 ?auto_43935 ) ) ( not ( = ?auto_43927 ?auto_43935 ) ) ( not ( = ?auto_43937 ?auto_43935 ) ) ( TRUCK-AT ?auto_43939 ?auto_43932 ) )
    :subtasks
    ( ( !DRIVE ?auto_43939 ?auto_43932 ?auto_43933 )
      ( MAKE-ON ?auto_43924 ?auto_43925 )
      ( MAKE-ON-VERIFY ?auto_43924 ?auto_43925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43940 - SURFACE
      ?auto_43941 - SURFACE
    )
    :vars
    (
      ?auto_43942 - HOIST
      ?auto_43951 - PLACE
      ?auto_43954 - PLACE
      ?auto_43955 - HOIST
      ?auto_43948 - SURFACE
      ?auto_43946 - SURFACE
      ?auto_43952 - PLACE
      ?auto_43947 - HOIST
      ?auto_43950 - SURFACE
      ?auto_43944 - SURFACE
      ?auto_43953 - PLACE
      ?auto_43949 - HOIST
      ?auto_43945 - SURFACE
      ?auto_43943 - TRUCK
      ?auto_43956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43942 ?auto_43951 ) ( IS-CRATE ?auto_43940 ) ( not ( = ?auto_43940 ?auto_43941 ) ) ( not ( = ?auto_43954 ?auto_43951 ) ) ( HOIST-AT ?auto_43955 ?auto_43954 ) ( not ( = ?auto_43942 ?auto_43955 ) ) ( AVAILABLE ?auto_43955 ) ( SURFACE-AT ?auto_43940 ?auto_43954 ) ( ON ?auto_43940 ?auto_43948 ) ( CLEAR ?auto_43940 ) ( not ( = ?auto_43940 ?auto_43948 ) ) ( not ( = ?auto_43941 ?auto_43948 ) ) ( IS-CRATE ?auto_43941 ) ( not ( = ?auto_43940 ?auto_43946 ) ) ( not ( = ?auto_43941 ?auto_43946 ) ) ( not ( = ?auto_43948 ?auto_43946 ) ) ( not ( = ?auto_43952 ?auto_43951 ) ) ( not ( = ?auto_43954 ?auto_43952 ) ) ( HOIST-AT ?auto_43947 ?auto_43952 ) ( not ( = ?auto_43942 ?auto_43947 ) ) ( not ( = ?auto_43955 ?auto_43947 ) ) ( AVAILABLE ?auto_43947 ) ( SURFACE-AT ?auto_43941 ?auto_43952 ) ( ON ?auto_43941 ?auto_43950 ) ( CLEAR ?auto_43941 ) ( not ( = ?auto_43940 ?auto_43950 ) ) ( not ( = ?auto_43941 ?auto_43950 ) ) ( not ( = ?auto_43948 ?auto_43950 ) ) ( not ( = ?auto_43946 ?auto_43950 ) ) ( IS-CRATE ?auto_43946 ) ( not ( = ?auto_43940 ?auto_43944 ) ) ( not ( = ?auto_43941 ?auto_43944 ) ) ( not ( = ?auto_43948 ?auto_43944 ) ) ( not ( = ?auto_43946 ?auto_43944 ) ) ( not ( = ?auto_43950 ?auto_43944 ) ) ( not ( = ?auto_43953 ?auto_43951 ) ) ( not ( = ?auto_43954 ?auto_43953 ) ) ( not ( = ?auto_43952 ?auto_43953 ) ) ( HOIST-AT ?auto_43949 ?auto_43953 ) ( not ( = ?auto_43942 ?auto_43949 ) ) ( not ( = ?auto_43955 ?auto_43949 ) ) ( not ( = ?auto_43947 ?auto_43949 ) ) ( AVAILABLE ?auto_43949 ) ( SURFACE-AT ?auto_43946 ?auto_43953 ) ( ON ?auto_43946 ?auto_43945 ) ( CLEAR ?auto_43946 ) ( not ( = ?auto_43940 ?auto_43945 ) ) ( not ( = ?auto_43941 ?auto_43945 ) ) ( not ( = ?auto_43948 ?auto_43945 ) ) ( not ( = ?auto_43946 ?auto_43945 ) ) ( not ( = ?auto_43950 ?auto_43945 ) ) ( not ( = ?auto_43944 ?auto_43945 ) ) ( TRUCK-AT ?auto_43943 ?auto_43951 ) ( SURFACE-AT ?auto_43956 ?auto_43951 ) ( CLEAR ?auto_43956 ) ( LIFTING ?auto_43942 ?auto_43944 ) ( IS-CRATE ?auto_43944 ) ( not ( = ?auto_43940 ?auto_43956 ) ) ( not ( = ?auto_43941 ?auto_43956 ) ) ( not ( = ?auto_43948 ?auto_43956 ) ) ( not ( = ?auto_43946 ?auto_43956 ) ) ( not ( = ?auto_43950 ?auto_43956 ) ) ( not ( = ?auto_43944 ?auto_43956 ) ) ( not ( = ?auto_43945 ?auto_43956 ) ) )
    :subtasks
    ( ( !DROP ?auto_43942 ?auto_43944 ?auto_43956 ?auto_43951 )
      ( MAKE-ON ?auto_43940 ?auto_43941 )
      ( MAKE-ON-VERIFY ?auto_43940 ?auto_43941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43957 - SURFACE
      ?auto_43958 - SURFACE
    )
    :vars
    (
      ?auto_43961 - HOIST
      ?auto_43962 - PLACE
      ?auto_43969 - PLACE
      ?auto_43972 - HOIST
      ?auto_43959 - SURFACE
      ?auto_43963 - SURFACE
      ?auto_43970 - PLACE
      ?auto_43971 - HOIST
      ?auto_43967 - SURFACE
      ?auto_43960 - SURFACE
      ?auto_43973 - PLACE
      ?auto_43964 - HOIST
      ?auto_43966 - SURFACE
      ?auto_43965 - TRUCK
      ?auto_43968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43961 ?auto_43962 ) ( IS-CRATE ?auto_43957 ) ( not ( = ?auto_43957 ?auto_43958 ) ) ( not ( = ?auto_43969 ?auto_43962 ) ) ( HOIST-AT ?auto_43972 ?auto_43969 ) ( not ( = ?auto_43961 ?auto_43972 ) ) ( AVAILABLE ?auto_43972 ) ( SURFACE-AT ?auto_43957 ?auto_43969 ) ( ON ?auto_43957 ?auto_43959 ) ( CLEAR ?auto_43957 ) ( not ( = ?auto_43957 ?auto_43959 ) ) ( not ( = ?auto_43958 ?auto_43959 ) ) ( IS-CRATE ?auto_43958 ) ( not ( = ?auto_43957 ?auto_43963 ) ) ( not ( = ?auto_43958 ?auto_43963 ) ) ( not ( = ?auto_43959 ?auto_43963 ) ) ( not ( = ?auto_43970 ?auto_43962 ) ) ( not ( = ?auto_43969 ?auto_43970 ) ) ( HOIST-AT ?auto_43971 ?auto_43970 ) ( not ( = ?auto_43961 ?auto_43971 ) ) ( not ( = ?auto_43972 ?auto_43971 ) ) ( AVAILABLE ?auto_43971 ) ( SURFACE-AT ?auto_43958 ?auto_43970 ) ( ON ?auto_43958 ?auto_43967 ) ( CLEAR ?auto_43958 ) ( not ( = ?auto_43957 ?auto_43967 ) ) ( not ( = ?auto_43958 ?auto_43967 ) ) ( not ( = ?auto_43959 ?auto_43967 ) ) ( not ( = ?auto_43963 ?auto_43967 ) ) ( IS-CRATE ?auto_43963 ) ( not ( = ?auto_43957 ?auto_43960 ) ) ( not ( = ?auto_43958 ?auto_43960 ) ) ( not ( = ?auto_43959 ?auto_43960 ) ) ( not ( = ?auto_43963 ?auto_43960 ) ) ( not ( = ?auto_43967 ?auto_43960 ) ) ( not ( = ?auto_43973 ?auto_43962 ) ) ( not ( = ?auto_43969 ?auto_43973 ) ) ( not ( = ?auto_43970 ?auto_43973 ) ) ( HOIST-AT ?auto_43964 ?auto_43973 ) ( not ( = ?auto_43961 ?auto_43964 ) ) ( not ( = ?auto_43972 ?auto_43964 ) ) ( not ( = ?auto_43971 ?auto_43964 ) ) ( AVAILABLE ?auto_43964 ) ( SURFACE-AT ?auto_43963 ?auto_43973 ) ( ON ?auto_43963 ?auto_43966 ) ( CLEAR ?auto_43963 ) ( not ( = ?auto_43957 ?auto_43966 ) ) ( not ( = ?auto_43958 ?auto_43966 ) ) ( not ( = ?auto_43959 ?auto_43966 ) ) ( not ( = ?auto_43963 ?auto_43966 ) ) ( not ( = ?auto_43967 ?auto_43966 ) ) ( not ( = ?auto_43960 ?auto_43966 ) ) ( TRUCK-AT ?auto_43965 ?auto_43962 ) ( SURFACE-AT ?auto_43968 ?auto_43962 ) ( CLEAR ?auto_43968 ) ( IS-CRATE ?auto_43960 ) ( not ( = ?auto_43957 ?auto_43968 ) ) ( not ( = ?auto_43958 ?auto_43968 ) ) ( not ( = ?auto_43959 ?auto_43968 ) ) ( not ( = ?auto_43963 ?auto_43968 ) ) ( not ( = ?auto_43967 ?auto_43968 ) ) ( not ( = ?auto_43960 ?auto_43968 ) ) ( not ( = ?auto_43966 ?auto_43968 ) ) ( AVAILABLE ?auto_43961 ) ( IN ?auto_43960 ?auto_43965 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43961 ?auto_43960 ?auto_43965 ?auto_43962 )
      ( MAKE-ON ?auto_43957 ?auto_43958 )
      ( MAKE-ON-VERIFY ?auto_43957 ?auto_43958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43974 - SURFACE
      ?auto_43975 - SURFACE
    )
    :vars
    (
      ?auto_43981 - HOIST
      ?auto_43982 - PLACE
      ?auto_43990 - PLACE
      ?auto_43989 - HOIST
      ?auto_43983 - SURFACE
      ?auto_43985 - SURFACE
      ?auto_43979 - PLACE
      ?auto_43986 - HOIST
      ?auto_43976 - SURFACE
      ?auto_43988 - SURFACE
      ?auto_43980 - PLACE
      ?auto_43984 - HOIST
      ?auto_43977 - SURFACE
      ?auto_43978 - SURFACE
      ?auto_43987 - TRUCK
      ?auto_43991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43981 ?auto_43982 ) ( IS-CRATE ?auto_43974 ) ( not ( = ?auto_43974 ?auto_43975 ) ) ( not ( = ?auto_43990 ?auto_43982 ) ) ( HOIST-AT ?auto_43989 ?auto_43990 ) ( not ( = ?auto_43981 ?auto_43989 ) ) ( AVAILABLE ?auto_43989 ) ( SURFACE-AT ?auto_43974 ?auto_43990 ) ( ON ?auto_43974 ?auto_43983 ) ( CLEAR ?auto_43974 ) ( not ( = ?auto_43974 ?auto_43983 ) ) ( not ( = ?auto_43975 ?auto_43983 ) ) ( IS-CRATE ?auto_43975 ) ( not ( = ?auto_43974 ?auto_43985 ) ) ( not ( = ?auto_43975 ?auto_43985 ) ) ( not ( = ?auto_43983 ?auto_43985 ) ) ( not ( = ?auto_43979 ?auto_43982 ) ) ( not ( = ?auto_43990 ?auto_43979 ) ) ( HOIST-AT ?auto_43986 ?auto_43979 ) ( not ( = ?auto_43981 ?auto_43986 ) ) ( not ( = ?auto_43989 ?auto_43986 ) ) ( AVAILABLE ?auto_43986 ) ( SURFACE-AT ?auto_43975 ?auto_43979 ) ( ON ?auto_43975 ?auto_43976 ) ( CLEAR ?auto_43975 ) ( not ( = ?auto_43974 ?auto_43976 ) ) ( not ( = ?auto_43975 ?auto_43976 ) ) ( not ( = ?auto_43983 ?auto_43976 ) ) ( not ( = ?auto_43985 ?auto_43976 ) ) ( IS-CRATE ?auto_43985 ) ( not ( = ?auto_43974 ?auto_43988 ) ) ( not ( = ?auto_43975 ?auto_43988 ) ) ( not ( = ?auto_43983 ?auto_43988 ) ) ( not ( = ?auto_43985 ?auto_43988 ) ) ( not ( = ?auto_43976 ?auto_43988 ) ) ( not ( = ?auto_43980 ?auto_43982 ) ) ( not ( = ?auto_43990 ?auto_43980 ) ) ( not ( = ?auto_43979 ?auto_43980 ) ) ( HOIST-AT ?auto_43984 ?auto_43980 ) ( not ( = ?auto_43981 ?auto_43984 ) ) ( not ( = ?auto_43989 ?auto_43984 ) ) ( not ( = ?auto_43986 ?auto_43984 ) ) ( AVAILABLE ?auto_43984 ) ( SURFACE-AT ?auto_43985 ?auto_43980 ) ( ON ?auto_43985 ?auto_43977 ) ( CLEAR ?auto_43985 ) ( not ( = ?auto_43974 ?auto_43977 ) ) ( not ( = ?auto_43975 ?auto_43977 ) ) ( not ( = ?auto_43983 ?auto_43977 ) ) ( not ( = ?auto_43985 ?auto_43977 ) ) ( not ( = ?auto_43976 ?auto_43977 ) ) ( not ( = ?auto_43988 ?auto_43977 ) ) ( SURFACE-AT ?auto_43978 ?auto_43982 ) ( CLEAR ?auto_43978 ) ( IS-CRATE ?auto_43988 ) ( not ( = ?auto_43974 ?auto_43978 ) ) ( not ( = ?auto_43975 ?auto_43978 ) ) ( not ( = ?auto_43983 ?auto_43978 ) ) ( not ( = ?auto_43985 ?auto_43978 ) ) ( not ( = ?auto_43976 ?auto_43978 ) ) ( not ( = ?auto_43988 ?auto_43978 ) ) ( not ( = ?auto_43977 ?auto_43978 ) ) ( AVAILABLE ?auto_43981 ) ( IN ?auto_43988 ?auto_43987 ) ( TRUCK-AT ?auto_43987 ?auto_43991 ) ( not ( = ?auto_43991 ?auto_43982 ) ) ( not ( = ?auto_43990 ?auto_43991 ) ) ( not ( = ?auto_43979 ?auto_43991 ) ) ( not ( = ?auto_43980 ?auto_43991 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43987 ?auto_43991 ?auto_43982 )
      ( MAKE-ON ?auto_43974 ?auto_43975 )
      ( MAKE-ON-VERIFY ?auto_43974 ?auto_43975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43992 - SURFACE
      ?auto_43993 - SURFACE
    )
    :vars
    (
      ?auto_44007 - HOIST
      ?auto_44001 - PLACE
      ?auto_43995 - PLACE
      ?auto_43996 - HOIST
      ?auto_43997 - SURFACE
      ?auto_44009 - SURFACE
      ?auto_44004 - PLACE
      ?auto_44002 - HOIST
      ?auto_43994 - SURFACE
      ?auto_44005 - SURFACE
      ?auto_44000 - PLACE
      ?auto_43999 - HOIST
      ?auto_44003 - SURFACE
      ?auto_44008 - SURFACE
      ?auto_43998 - TRUCK
      ?auto_44006 - PLACE
      ?auto_44010 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44007 ?auto_44001 ) ( IS-CRATE ?auto_43992 ) ( not ( = ?auto_43992 ?auto_43993 ) ) ( not ( = ?auto_43995 ?auto_44001 ) ) ( HOIST-AT ?auto_43996 ?auto_43995 ) ( not ( = ?auto_44007 ?auto_43996 ) ) ( AVAILABLE ?auto_43996 ) ( SURFACE-AT ?auto_43992 ?auto_43995 ) ( ON ?auto_43992 ?auto_43997 ) ( CLEAR ?auto_43992 ) ( not ( = ?auto_43992 ?auto_43997 ) ) ( not ( = ?auto_43993 ?auto_43997 ) ) ( IS-CRATE ?auto_43993 ) ( not ( = ?auto_43992 ?auto_44009 ) ) ( not ( = ?auto_43993 ?auto_44009 ) ) ( not ( = ?auto_43997 ?auto_44009 ) ) ( not ( = ?auto_44004 ?auto_44001 ) ) ( not ( = ?auto_43995 ?auto_44004 ) ) ( HOIST-AT ?auto_44002 ?auto_44004 ) ( not ( = ?auto_44007 ?auto_44002 ) ) ( not ( = ?auto_43996 ?auto_44002 ) ) ( AVAILABLE ?auto_44002 ) ( SURFACE-AT ?auto_43993 ?auto_44004 ) ( ON ?auto_43993 ?auto_43994 ) ( CLEAR ?auto_43993 ) ( not ( = ?auto_43992 ?auto_43994 ) ) ( not ( = ?auto_43993 ?auto_43994 ) ) ( not ( = ?auto_43997 ?auto_43994 ) ) ( not ( = ?auto_44009 ?auto_43994 ) ) ( IS-CRATE ?auto_44009 ) ( not ( = ?auto_43992 ?auto_44005 ) ) ( not ( = ?auto_43993 ?auto_44005 ) ) ( not ( = ?auto_43997 ?auto_44005 ) ) ( not ( = ?auto_44009 ?auto_44005 ) ) ( not ( = ?auto_43994 ?auto_44005 ) ) ( not ( = ?auto_44000 ?auto_44001 ) ) ( not ( = ?auto_43995 ?auto_44000 ) ) ( not ( = ?auto_44004 ?auto_44000 ) ) ( HOIST-AT ?auto_43999 ?auto_44000 ) ( not ( = ?auto_44007 ?auto_43999 ) ) ( not ( = ?auto_43996 ?auto_43999 ) ) ( not ( = ?auto_44002 ?auto_43999 ) ) ( AVAILABLE ?auto_43999 ) ( SURFACE-AT ?auto_44009 ?auto_44000 ) ( ON ?auto_44009 ?auto_44003 ) ( CLEAR ?auto_44009 ) ( not ( = ?auto_43992 ?auto_44003 ) ) ( not ( = ?auto_43993 ?auto_44003 ) ) ( not ( = ?auto_43997 ?auto_44003 ) ) ( not ( = ?auto_44009 ?auto_44003 ) ) ( not ( = ?auto_43994 ?auto_44003 ) ) ( not ( = ?auto_44005 ?auto_44003 ) ) ( SURFACE-AT ?auto_44008 ?auto_44001 ) ( CLEAR ?auto_44008 ) ( IS-CRATE ?auto_44005 ) ( not ( = ?auto_43992 ?auto_44008 ) ) ( not ( = ?auto_43993 ?auto_44008 ) ) ( not ( = ?auto_43997 ?auto_44008 ) ) ( not ( = ?auto_44009 ?auto_44008 ) ) ( not ( = ?auto_43994 ?auto_44008 ) ) ( not ( = ?auto_44005 ?auto_44008 ) ) ( not ( = ?auto_44003 ?auto_44008 ) ) ( AVAILABLE ?auto_44007 ) ( TRUCK-AT ?auto_43998 ?auto_44006 ) ( not ( = ?auto_44006 ?auto_44001 ) ) ( not ( = ?auto_43995 ?auto_44006 ) ) ( not ( = ?auto_44004 ?auto_44006 ) ) ( not ( = ?auto_44000 ?auto_44006 ) ) ( HOIST-AT ?auto_44010 ?auto_44006 ) ( LIFTING ?auto_44010 ?auto_44005 ) ( not ( = ?auto_44007 ?auto_44010 ) ) ( not ( = ?auto_43996 ?auto_44010 ) ) ( not ( = ?auto_44002 ?auto_44010 ) ) ( not ( = ?auto_43999 ?auto_44010 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44010 ?auto_44005 ?auto_43998 ?auto_44006 )
      ( MAKE-ON ?auto_43992 ?auto_43993 )
      ( MAKE-ON-VERIFY ?auto_43992 ?auto_43993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44011 - SURFACE
      ?auto_44012 - SURFACE
    )
    :vars
    (
      ?auto_44020 - HOIST
      ?auto_44017 - PLACE
      ?auto_44015 - PLACE
      ?auto_44026 - HOIST
      ?auto_44018 - SURFACE
      ?auto_44027 - SURFACE
      ?auto_44028 - PLACE
      ?auto_44025 - HOIST
      ?auto_44014 - SURFACE
      ?auto_44016 - SURFACE
      ?auto_44019 - PLACE
      ?auto_44024 - HOIST
      ?auto_44022 - SURFACE
      ?auto_44013 - SURFACE
      ?auto_44021 - TRUCK
      ?auto_44023 - PLACE
      ?auto_44029 - HOIST
      ?auto_44030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44020 ?auto_44017 ) ( IS-CRATE ?auto_44011 ) ( not ( = ?auto_44011 ?auto_44012 ) ) ( not ( = ?auto_44015 ?auto_44017 ) ) ( HOIST-AT ?auto_44026 ?auto_44015 ) ( not ( = ?auto_44020 ?auto_44026 ) ) ( AVAILABLE ?auto_44026 ) ( SURFACE-AT ?auto_44011 ?auto_44015 ) ( ON ?auto_44011 ?auto_44018 ) ( CLEAR ?auto_44011 ) ( not ( = ?auto_44011 ?auto_44018 ) ) ( not ( = ?auto_44012 ?auto_44018 ) ) ( IS-CRATE ?auto_44012 ) ( not ( = ?auto_44011 ?auto_44027 ) ) ( not ( = ?auto_44012 ?auto_44027 ) ) ( not ( = ?auto_44018 ?auto_44027 ) ) ( not ( = ?auto_44028 ?auto_44017 ) ) ( not ( = ?auto_44015 ?auto_44028 ) ) ( HOIST-AT ?auto_44025 ?auto_44028 ) ( not ( = ?auto_44020 ?auto_44025 ) ) ( not ( = ?auto_44026 ?auto_44025 ) ) ( AVAILABLE ?auto_44025 ) ( SURFACE-AT ?auto_44012 ?auto_44028 ) ( ON ?auto_44012 ?auto_44014 ) ( CLEAR ?auto_44012 ) ( not ( = ?auto_44011 ?auto_44014 ) ) ( not ( = ?auto_44012 ?auto_44014 ) ) ( not ( = ?auto_44018 ?auto_44014 ) ) ( not ( = ?auto_44027 ?auto_44014 ) ) ( IS-CRATE ?auto_44027 ) ( not ( = ?auto_44011 ?auto_44016 ) ) ( not ( = ?auto_44012 ?auto_44016 ) ) ( not ( = ?auto_44018 ?auto_44016 ) ) ( not ( = ?auto_44027 ?auto_44016 ) ) ( not ( = ?auto_44014 ?auto_44016 ) ) ( not ( = ?auto_44019 ?auto_44017 ) ) ( not ( = ?auto_44015 ?auto_44019 ) ) ( not ( = ?auto_44028 ?auto_44019 ) ) ( HOIST-AT ?auto_44024 ?auto_44019 ) ( not ( = ?auto_44020 ?auto_44024 ) ) ( not ( = ?auto_44026 ?auto_44024 ) ) ( not ( = ?auto_44025 ?auto_44024 ) ) ( AVAILABLE ?auto_44024 ) ( SURFACE-AT ?auto_44027 ?auto_44019 ) ( ON ?auto_44027 ?auto_44022 ) ( CLEAR ?auto_44027 ) ( not ( = ?auto_44011 ?auto_44022 ) ) ( not ( = ?auto_44012 ?auto_44022 ) ) ( not ( = ?auto_44018 ?auto_44022 ) ) ( not ( = ?auto_44027 ?auto_44022 ) ) ( not ( = ?auto_44014 ?auto_44022 ) ) ( not ( = ?auto_44016 ?auto_44022 ) ) ( SURFACE-AT ?auto_44013 ?auto_44017 ) ( CLEAR ?auto_44013 ) ( IS-CRATE ?auto_44016 ) ( not ( = ?auto_44011 ?auto_44013 ) ) ( not ( = ?auto_44012 ?auto_44013 ) ) ( not ( = ?auto_44018 ?auto_44013 ) ) ( not ( = ?auto_44027 ?auto_44013 ) ) ( not ( = ?auto_44014 ?auto_44013 ) ) ( not ( = ?auto_44016 ?auto_44013 ) ) ( not ( = ?auto_44022 ?auto_44013 ) ) ( AVAILABLE ?auto_44020 ) ( TRUCK-AT ?auto_44021 ?auto_44023 ) ( not ( = ?auto_44023 ?auto_44017 ) ) ( not ( = ?auto_44015 ?auto_44023 ) ) ( not ( = ?auto_44028 ?auto_44023 ) ) ( not ( = ?auto_44019 ?auto_44023 ) ) ( HOIST-AT ?auto_44029 ?auto_44023 ) ( not ( = ?auto_44020 ?auto_44029 ) ) ( not ( = ?auto_44026 ?auto_44029 ) ) ( not ( = ?auto_44025 ?auto_44029 ) ) ( not ( = ?auto_44024 ?auto_44029 ) ) ( AVAILABLE ?auto_44029 ) ( SURFACE-AT ?auto_44016 ?auto_44023 ) ( ON ?auto_44016 ?auto_44030 ) ( CLEAR ?auto_44016 ) ( not ( = ?auto_44011 ?auto_44030 ) ) ( not ( = ?auto_44012 ?auto_44030 ) ) ( not ( = ?auto_44018 ?auto_44030 ) ) ( not ( = ?auto_44027 ?auto_44030 ) ) ( not ( = ?auto_44014 ?auto_44030 ) ) ( not ( = ?auto_44016 ?auto_44030 ) ) ( not ( = ?auto_44022 ?auto_44030 ) ) ( not ( = ?auto_44013 ?auto_44030 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44029 ?auto_44016 ?auto_44030 ?auto_44023 )
      ( MAKE-ON ?auto_44011 ?auto_44012 )
      ( MAKE-ON-VERIFY ?auto_44011 ?auto_44012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44031 - SURFACE
      ?auto_44032 - SURFACE
    )
    :vars
    (
      ?auto_44039 - HOIST
      ?auto_44048 - PLACE
      ?auto_44040 - PLACE
      ?auto_44044 - HOIST
      ?auto_44038 - SURFACE
      ?auto_44041 - SURFACE
      ?auto_44047 - PLACE
      ?auto_44049 - HOIST
      ?auto_44043 - SURFACE
      ?auto_44050 - SURFACE
      ?auto_44034 - PLACE
      ?auto_44033 - HOIST
      ?auto_44046 - SURFACE
      ?auto_44037 - SURFACE
      ?auto_44042 - PLACE
      ?auto_44035 - HOIST
      ?auto_44036 - SURFACE
      ?auto_44045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44039 ?auto_44048 ) ( IS-CRATE ?auto_44031 ) ( not ( = ?auto_44031 ?auto_44032 ) ) ( not ( = ?auto_44040 ?auto_44048 ) ) ( HOIST-AT ?auto_44044 ?auto_44040 ) ( not ( = ?auto_44039 ?auto_44044 ) ) ( AVAILABLE ?auto_44044 ) ( SURFACE-AT ?auto_44031 ?auto_44040 ) ( ON ?auto_44031 ?auto_44038 ) ( CLEAR ?auto_44031 ) ( not ( = ?auto_44031 ?auto_44038 ) ) ( not ( = ?auto_44032 ?auto_44038 ) ) ( IS-CRATE ?auto_44032 ) ( not ( = ?auto_44031 ?auto_44041 ) ) ( not ( = ?auto_44032 ?auto_44041 ) ) ( not ( = ?auto_44038 ?auto_44041 ) ) ( not ( = ?auto_44047 ?auto_44048 ) ) ( not ( = ?auto_44040 ?auto_44047 ) ) ( HOIST-AT ?auto_44049 ?auto_44047 ) ( not ( = ?auto_44039 ?auto_44049 ) ) ( not ( = ?auto_44044 ?auto_44049 ) ) ( AVAILABLE ?auto_44049 ) ( SURFACE-AT ?auto_44032 ?auto_44047 ) ( ON ?auto_44032 ?auto_44043 ) ( CLEAR ?auto_44032 ) ( not ( = ?auto_44031 ?auto_44043 ) ) ( not ( = ?auto_44032 ?auto_44043 ) ) ( not ( = ?auto_44038 ?auto_44043 ) ) ( not ( = ?auto_44041 ?auto_44043 ) ) ( IS-CRATE ?auto_44041 ) ( not ( = ?auto_44031 ?auto_44050 ) ) ( not ( = ?auto_44032 ?auto_44050 ) ) ( not ( = ?auto_44038 ?auto_44050 ) ) ( not ( = ?auto_44041 ?auto_44050 ) ) ( not ( = ?auto_44043 ?auto_44050 ) ) ( not ( = ?auto_44034 ?auto_44048 ) ) ( not ( = ?auto_44040 ?auto_44034 ) ) ( not ( = ?auto_44047 ?auto_44034 ) ) ( HOIST-AT ?auto_44033 ?auto_44034 ) ( not ( = ?auto_44039 ?auto_44033 ) ) ( not ( = ?auto_44044 ?auto_44033 ) ) ( not ( = ?auto_44049 ?auto_44033 ) ) ( AVAILABLE ?auto_44033 ) ( SURFACE-AT ?auto_44041 ?auto_44034 ) ( ON ?auto_44041 ?auto_44046 ) ( CLEAR ?auto_44041 ) ( not ( = ?auto_44031 ?auto_44046 ) ) ( not ( = ?auto_44032 ?auto_44046 ) ) ( not ( = ?auto_44038 ?auto_44046 ) ) ( not ( = ?auto_44041 ?auto_44046 ) ) ( not ( = ?auto_44043 ?auto_44046 ) ) ( not ( = ?auto_44050 ?auto_44046 ) ) ( SURFACE-AT ?auto_44037 ?auto_44048 ) ( CLEAR ?auto_44037 ) ( IS-CRATE ?auto_44050 ) ( not ( = ?auto_44031 ?auto_44037 ) ) ( not ( = ?auto_44032 ?auto_44037 ) ) ( not ( = ?auto_44038 ?auto_44037 ) ) ( not ( = ?auto_44041 ?auto_44037 ) ) ( not ( = ?auto_44043 ?auto_44037 ) ) ( not ( = ?auto_44050 ?auto_44037 ) ) ( not ( = ?auto_44046 ?auto_44037 ) ) ( AVAILABLE ?auto_44039 ) ( not ( = ?auto_44042 ?auto_44048 ) ) ( not ( = ?auto_44040 ?auto_44042 ) ) ( not ( = ?auto_44047 ?auto_44042 ) ) ( not ( = ?auto_44034 ?auto_44042 ) ) ( HOIST-AT ?auto_44035 ?auto_44042 ) ( not ( = ?auto_44039 ?auto_44035 ) ) ( not ( = ?auto_44044 ?auto_44035 ) ) ( not ( = ?auto_44049 ?auto_44035 ) ) ( not ( = ?auto_44033 ?auto_44035 ) ) ( AVAILABLE ?auto_44035 ) ( SURFACE-AT ?auto_44050 ?auto_44042 ) ( ON ?auto_44050 ?auto_44036 ) ( CLEAR ?auto_44050 ) ( not ( = ?auto_44031 ?auto_44036 ) ) ( not ( = ?auto_44032 ?auto_44036 ) ) ( not ( = ?auto_44038 ?auto_44036 ) ) ( not ( = ?auto_44041 ?auto_44036 ) ) ( not ( = ?auto_44043 ?auto_44036 ) ) ( not ( = ?auto_44050 ?auto_44036 ) ) ( not ( = ?auto_44046 ?auto_44036 ) ) ( not ( = ?auto_44037 ?auto_44036 ) ) ( TRUCK-AT ?auto_44045 ?auto_44048 ) )
    :subtasks
    ( ( !DRIVE ?auto_44045 ?auto_44048 ?auto_44042 )
      ( MAKE-ON ?auto_44031 ?auto_44032 )
      ( MAKE-ON-VERIFY ?auto_44031 ?auto_44032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44051 - SURFACE
      ?auto_44052 - SURFACE
    )
    :vars
    (
      ?auto_44070 - HOIST
      ?auto_44068 - PLACE
      ?auto_44062 - PLACE
      ?auto_44061 - HOIST
      ?auto_44065 - SURFACE
      ?auto_44057 - SURFACE
      ?auto_44069 - PLACE
      ?auto_44055 - HOIST
      ?auto_44053 - SURFACE
      ?auto_44054 - SURFACE
      ?auto_44067 - PLACE
      ?auto_44066 - HOIST
      ?auto_44056 - SURFACE
      ?auto_44064 - SURFACE
      ?auto_44058 - PLACE
      ?auto_44060 - HOIST
      ?auto_44059 - SURFACE
      ?auto_44063 - TRUCK
      ?auto_44071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44070 ?auto_44068 ) ( IS-CRATE ?auto_44051 ) ( not ( = ?auto_44051 ?auto_44052 ) ) ( not ( = ?auto_44062 ?auto_44068 ) ) ( HOIST-AT ?auto_44061 ?auto_44062 ) ( not ( = ?auto_44070 ?auto_44061 ) ) ( AVAILABLE ?auto_44061 ) ( SURFACE-AT ?auto_44051 ?auto_44062 ) ( ON ?auto_44051 ?auto_44065 ) ( CLEAR ?auto_44051 ) ( not ( = ?auto_44051 ?auto_44065 ) ) ( not ( = ?auto_44052 ?auto_44065 ) ) ( IS-CRATE ?auto_44052 ) ( not ( = ?auto_44051 ?auto_44057 ) ) ( not ( = ?auto_44052 ?auto_44057 ) ) ( not ( = ?auto_44065 ?auto_44057 ) ) ( not ( = ?auto_44069 ?auto_44068 ) ) ( not ( = ?auto_44062 ?auto_44069 ) ) ( HOIST-AT ?auto_44055 ?auto_44069 ) ( not ( = ?auto_44070 ?auto_44055 ) ) ( not ( = ?auto_44061 ?auto_44055 ) ) ( AVAILABLE ?auto_44055 ) ( SURFACE-AT ?auto_44052 ?auto_44069 ) ( ON ?auto_44052 ?auto_44053 ) ( CLEAR ?auto_44052 ) ( not ( = ?auto_44051 ?auto_44053 ) ) ( not ( = ?auto_44052 ?auto_44053 ) ) ( not ( = ?auto_44065 ?auto_44053 ) ) ( not ( = ?auto_44057 ?auto_44053 ) ) ( IS-CRATE ?auto_44057 ) ( not ( = ?auto_44051 ?auto_44054 ) ) ( not ( = ?auto_44052 ?auto_44054 ) ) ( not ( = ?auto_44065 ?auto_44054 ) ) ( not ( = ?auto_44057 ?auto_44054 ) ) ( not ( = ?auto_44053 ?auto_44054 ) ) ( not ( = ?auto_44067 ?auto_44068 ) ) ( not ( = ?auto_44062 ?auto_44067 ) ) ( not ( = ?auto_44069 ?auto_44067 ) ) ( HOIST-AT ?auto_44066 ?auto_44067 ) ( not ( = ?auto_44070 ?auto_44066 ) ) ( not ( = ?auto_44061 ?auto_44066 ) ) ( not ( = ?auto_44055 ?auto_44066 ) ) ( AVAILABLE ?auto_44066 ) ( SURFACE-AT ?auto_44057 ?auto_44067 ) ( ON ?auto_44057 ?auto_44056 ) ( CLEAR ?auto_44057 ) ( not ( = ?auto_44051 ?auto_44056 ) ) ( not ( = ?auto_44052 ?auto_44056 ) ) ( not ( = ?auto_44065 ?auto_44056 ) ) ( not ( = ?auto_44057 ?auto_44056 ) ) ( not ( = ?auto_44053 ?auto_44056 ) ) ( not ( = ?auto_44054 ?auto_44056 ) ) ( IS-CRATE ?auto_44054 ) ( not ( = ?auto_44051 ?auto_44064 ) ) ( not ( = ?auto_44052 ?auto_44064 ) ) ( not ( = ?auto_44065 ?auto_44064 ) ) ( not ( = ?auto_44057 ?auto_44064 ) ) ( not ( = ?auto_44053 ?auto_44064 ) ) ( not ( = ?auto_44054 ?auto_44064 ) ) ( not ( = ?auto_44056 ?auto_44064 ) ) ( not ( = ?auto_44058 ?auto_44068 ) ) ( not ( = ?auto_44062 ?auto_44058 ) ) ( not ( = ?auto_44069 ?auto_44058 ) ) ( not ( = ?auto_44067 ?auto_44058 ) ) ( HOIST-AT ?auto_44060 ?auto_44058 ) ( not ( = ?auto_44070 ?auto_44060 ) ) ( not ( = ?auto_44061 ?auto_44060 ) ) ( not ( = ?auto_44055 ?auto_44060 ) ) ( not ( = ?auto_44066 ?auto_44060 ) ) ( AVAILABLE ?auto_44060 ) ( SURFACE-AT ?auto_44054 ?auto_44058 ) ( ON ?auto_44054 ?auto_44059 ) ( CLEAR ?auto_44054 ) ( not ( = ?auto_44051 ?auto_44059 ) ) ( not ( = ?auto_44052 ?auto_44059 ) ) ( not ( = ?auto_44065 ?auto_44059 ) ) ( not ( = ?auto_44057 ?auto_44059 ) ) ( not ( = ?auto_44053 ?auto_44059 ) ) ( not ( = ?auto_44054 ?auto_44059 ) ) ( not ( = ?auto_44056 ?auto_44059 ) ) ( not ( = ?auto_44064 ?auto_44059 ) ) ( TRUCK-AT ?auto_44063 ?auto_44068 ) ( SURFACE-AT ?auto_44071 ?auto_44068 ) ( CLEAR ?auto_44071 ) ( LIFTING ?auto_44070 ?auto_44064 ) ( IS-CRATE ?auto_44064 ) ( not ( = ?auto_44051 ?auto_44071 ) ) ( not ( = ?auto_44052 ?auto_44071 ) ) ( not ( = ?auto_44065 ?auto_44071 ) ) ( not ( = ?auto_44057 ?auto_44071 ) ) ( not ( = ?auto_44053 ?auto_44071 ) ) ( not ( = ?auto_44054 ?auto_44071 ) ) ( not ( = ?auto_44056 ?auto_44071 ) ) ( not ( = ?auto_44064 ?auto_44071 ) ) ( not ( = ?auto_44059 ?auto_44071 ) ) )
    :subtasks
    ( ( !DROP ?auto_44070 ?auto_44064 ?auto_44071 ?auto_44068 )
      ( MAKE-ON ?auto_44051 ?auto_44052 )
      ( MAKE-ON-VERIFY ?auto_44051 ?auto_44052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44072 - SURFACE
      ?auto_44073 - SURFACE
    )
    :vars
    (
      ?auto_44080 - HOIST
      ?auto_44091 - PLACE
      ?auto_44083 - PLACE
      ?auto_44084 - HOIST
      ?auto_44081 - SURFACE
      ?auto_44087 - SURFACE
      ?auto_44078 - PLACE
      ?auto_44077 - HOIST
      ?auto_44085 - SURFACE
      ?auto_44076 - SURFACE
      ?auto_44082 - PLACE
      ?auto_44088 - HOIST
      ?auto_44086 - SURFACE
      ?auto_44074 - SURFACE
      ?auto_44079 - PLACE
      ?auto_44092 - HOIST
      ?auto_44075 - SURFACE
      ?auto_44089 - TRUCK
      ?auto_44090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44080 ?auto_44091 ) ( IS-CRATE ?auto_44072 ) ( not ( = ?auto_44072 ?auto_44073 ) ) ( not ( = ?auto_44083 ?auto_44091 ) ) ( HOIST-AT ?auto_44084 ?auto_44083 ) ( not ( = ?auto_44080 ?auto_44084 ) ) ( AVAILABLE ?auto_44084 ) ( SURFACE-AT ?auto_44072 ?auto_44083 ) ( ON ?auto_44072 ?auto_44081 ) ( CLEAR ?auto_44072 ) ( not ( = ?auto_44072 ?auto_44081 ) ) ( not ( = ?auto_44073 ?auto_44081 ) ) ( IS-CRATE ?auto_44073 ) ( not ( = ?auto_44072 ?auto_44087 ) ) ( not ( = ?auto_44073 ?auto_44087 ) ) ( not ( = ?auto_44081 ?auto_44087 ) ) ( not ( = ?auto_44078 ?auto_44091 ) ) ( not ( = ?auto_44083 ?auto_44078 ) ) ( HOIST-AT ?auto_44077 ?auto_44078 ) ( not ( = ?auto_44080 ?auto_44077 ) ) ( not ( = ?auto_44084 ?auto_44077 ) ) ( AVAILABLE ?auto_44077 ) ( SURFACE-AT ?auto_44073 ?auto_44078 ) ( ON ?auto_44073 ?auto_44085 ) ( CLEAR ?auto_44073 ) ( not ( = ?auto_44072 ?auto_44085 ) ) ( not ( = ?auto_44073 ?auto_44085 ) ) ( not ( = ?auto_44081 ?auto_44085 ) ) ( not ( = ?auto_44087 ?auto_44085 ) ) ( IS-CRATE ?auto_44087 ) ( not ( = ?auto_44072 ?auto_44076 ) ) ( not ( = ?auto_44073 ?auto_44076 ) ) ( not ( = ?auto_44081 ?auto_44076 ) ) ( not ( = ?auto_44087 ?auto_44076 ) ) ( not ( = ?auto_44085 ?auto_44076 ) ) ( not ( = ?auto_44082 ?auto_44091 ) ) ( not ( = ?auto_44083 ?auto_44082 ) ) ( not ( = ?auto_44078 ?auto_44082 ) ) ( HOIST-AT ?auto_44088 ?auto_44082 ) ( not ( = ?auto_44080 ?auto_44088 ) ) ( not ( = ?auto_44084 ?auto_44088 ) ) ( not ( = ?auto_44077 ?auto_44088 ) ) ( AVAILABLE ?auto_44088 ) ( SURFACE-AT ?auto_44087 ?auto_44082 ) ( ON ?auto_44087 ?auto_44086 ) ( CLEAR ?auto_44087 ) ( not ( = ?auto_44072 ?auto_44086 ) ) ( not ( = ?auto_44073 ?auto_44086 ) ) ( not ( = ?auto_44081 ?auto_44086 ) ) ( not ( = ?auto_44087 ?auto_44086 ) ) ( not ( = ?auto_44085 ?auto_44086 ) ) ( not ( = ?auto_44076 ?auto_44086 ) ) ( IS-CRATE ?auto_44076 ) ( not ( = ?auto_44072 ?auto_44074 ) ) ( not ( = ?auto_44073 ?auto_44074 ) ) ( not ( = ?auto_44081 ?auto_44074 ) ) ( not ( = ?auto_44087 ?auto_44074 ) ) ( not ( = ?auto_44085 ?auto_44074 ) ) ( not ( = ?auto_44076 ?auto_44074 ) ) ( not ( = ?auto_44086 ?auto_44074 ) ) ( not ( = ?auto_44079 ?auto_44091 ) ) ( not ( = ?auto_44083 ?auto_44079 ) ) ( not ( = ?auto_44078 ?auto_44079 ) ) ( not ( = ?auto_44082 ?auto_44079 ) ) ( HOIST-AT ?auto_44092 ?auto_44079 ) ( not ( = ?auto_44080 ?auto_44092 ) ) ( not ( = ?auto_44084 ?auto_44092 ) ) ( not ( = ?auto_44077 ?auto_44092 ) ) ( not ( = ?auto_44088 ?auto_44092 ) ) ( AVAILABLE ?auto_44092 ) ( SURFACE-AT ?auto_44076 ?auto_44079 ) ( ON ?auto_44076 ?auto_44075 ) ( CLEAR ?auto_44076 ) ( not ( = ?auto_44072 ?auto_44075 ) ) ( not ( = ?auto_44073 ?auto_44075 ) ) ( not ( = ?auto_44081 ?auto_44075 ) ) ( not ( = ?auto_44087 ?auto_44075 ) ) ( not ( = ?auto_44085 ?auto_44075 ) ) ( not ( = ?auto_44076 ?auto_44075 ) ) ( not ( = ?auto_44086 ?auto_44075 ) ) ( not ( = ?auto_44074 ?auto_44075 ) ) ( TRUCK-AT ?auto_44089 ?auto_44091 ) ( SURFACE-AT ?auto_44090 ?auto_44091 ) ( CLEAR ?auto_44090 ) ( IS-CRATE ?auto_44074 ) ( not ( = ?auto_44072 ?auto_44090 ) ) ( not ( = ?auto_44073 ?auto_44090 ) ) ( not ( = ?auto_44081 ?auto_44090 ) ) ( not ( = ?auto_44087 ?auto_44090 ) ) ( not ( = ?auto_44085 ?auto_44090 ) ) ( not ( = ?auto_44076 ?auto_44090 ) ) ( not ( = ?auto_44086 ?auto_44090 ) ) ( not ( = ?auto_44074 ?auto_44090 ) ) ( not ( = ?auto_44075 ?auto_44090 ) ) ( AVAILABLE ?auto_44080 ) ( IN ?auto_44074 ?auto_44089 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44080 ?auto_44074 ?auto_44089 ?auto_44091 )
      ( MAKE-ON ?auto_44072 ?auto_44073 )
      ( MAKE-ON-VERIFY ?auto_44072 ?auto_44073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44093 - SURFACE
      ?auto_44094 - SURFACE
    )
    :vars
    (
      ?auto_44099 - HOIST
      ?auto_44112 - PLACE
      ?auto_44102 - PLACE
      ?auto_44110 - HOIST
      ?auto_44096 - SURFACE
      ?auto_44107 - SURFACE
      ?auto_44109 - PLACE
      ?auto_44097 - HOIST
      ?auto_44113 - SURFACE
      ?auto_44098 - SURFACE
      ?auto_44104 - PLACE
      ?auto_44103 - HOIST
      ?auto_44101 - SURFACE
      ?auto_44106 - SURFACE
      ?auto_44105 - PLACE
      ?auto_44095 - HOIST
      ?auto_44108 - SURFACE
      ?auto_44111 - SURFACE
      ?auto_44100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44099 ?auto_44112 ) ( IS-CRATE ?auto_44093 ) ( not ( = ?auto_44093 ?auto_44094 ) ) ( not ( = ?auto_44102 ?auto_44112 ) ) ( HOIST-AT ?auto_44110 ?auto_44102 ) ( not ( = ?auto_44099 ?auto_44110 ) ) ( AVAILABLE ?auto_44110 ) ( SURFACE-AT ?auto_44093 ?auto_44102 ) ( ON ?auto_44093 ?auto_44096 ) ( CLEAR ?auto_44093 ) ( not ( = ?auto_44093 ?auto_44096 ) ) ( not ( = ?auto_44094 ?auto_44096 ) ) ( IS-CRATE ?auto_44094 ) ( not ( = ?auto_44093 ?auto_44107 ) ) ( not ( = ?auto_44094 ?auto_44107 ) ) ( not ( = ?auto_44096 ?auto_44107 ) ) ( not ( = ?auto_44109 ?auto_44112 ) ) ( not ( = ?auto_44102 ?auto_44109 ) ) ( HOIST-AT ?auto_44097 ?auto_44109 ) ( not ( = ?auto_44099 ?auto_44097 ) ) ( not ( = ?auto_44110 ?auto_44097 ) ) ( AVAILABLE ?auto_44097 ) ( SURFACE-AT ?auto_44094 ?auto_44109 ) ( ON ?auto_44094 ?auto_44113 ) ( CLEAR ?auto_44094 ) ( not ( = ?auto_44093 ?auto_44113 ) ) ( not ( = ?auto_44094 ?auto_44113 ) ) ( not ( = ?auto_44096 ?auto_44113 ) ) ( not ( = ?auto_44107 ?auto_44113 ) ) ( IS-CRATE ?auto_44107 ) ( not ( = ?auto_44093 ?auto_44098 ) ) ( not ( = ?auto_44094 ?auto_44098 ) ) ( not ( = ?auto_44096 ?auto_44098 ) ) ( not ( = ?auto_44107 ?auto_44098 ) ) ( not ( = ?auto_44113 ?auto_44098 ) ) ( not ( = ?auto_44104 ?auto_44112 ) ) ( not ( = ?auto_44102 ?auto_44104 ) ) ( not ( = ?auto_44109 ?auto_44104 ) ) ( HOIST-AT ?auto_44103 ?auto_44104 ) ( not ( = ?auto_44099 ?auto_44103 ) ) ( not ( = ?auto_44110 ?auto_44103 ) ) ( not ( = ?auto_44097 ?auto_44103 ) ) ( AVAILABLE ?auto_44103 ) ( SURFACE-AT ?auto_44107 ?auto_44104 ) ( ON ?auto_44107 ?auto_44101 ) ( CLEAR ?auto_44107 ) ( not ( = ?auto_44093 ?auto_44101 ) ) ( not ( = ?auto_44094 ?auto_44101 ) ) ( not ( = ?auto_44096 ?auto_44101 ) ) ( not ( = ?auto_44107 ?auto_44101 ) ) ( not ( = ?auto_44113 ?auto_44101 ) ) ( not ( = ?auto_44098 ?auto_44101 ) ) ( IS-CRATE ?auto_44098 ) ( not ( = ?auto_44093 ?auto_44106 ) ) ( not ( = ?auto_44094 ?auto_44106 ) ) ( not ( = ?auto_44096 ?auto_44106 ) ) ( not ( = ?auto_44107 ?auto_44106 ) ) ( not ( = ?auto_44113 ?auto_44106 ) ) ( not ( = ?auto_44098 ?auto_44106 ) ) ( not ( = ?auto_44101 ?auto_44106 ) ) ( not ( = ?auto_44105 ?auto_44112 ) ) ( not ( = ?auto_44102 ?auto_44105 ) ) ( not ( = ?auto_44109 ?auto_44105 ) ) ( not ( = ?auto_44104 ?auto_44105 ) ) ( HOIST-AT ?auto_44095 ?auto_44105 ) ( not ( = ?auto_44099 ?auto_44095 ) ) ( not ( = ?auto_44110 ?auto_44095 ) ) ( not ( = ?auto_44097 ?auto_44095 ) ) ( not ( = ?auto_44103 ?auto_44095 ) ) ( AVAILABLE ?auto_44095 ) ( SURFACE-AT ?auto_44098 ?auto_44105 ) ( ON ?auto_44098 ?auto_44108 ) ( CLEAR ?auto_44098 ) ( not ( = ?auto_44093 ?auto_44108 ) ) ( not ( = ?auto_44094 ?auto_44108 ) ) ( not ( = ?auto_44096 ?auto_44108 ) ) ( not ( = ?auto_44107 ?auto_44108 ) ) ( not ( = ?auto_44113 ?auto_44108 ) ) ( not ( = ?auto_44098 ?auto_44108 ) ) ( not ( = ?auto_44101 ?auto_44108 ) ) ( not ( = ?auto_44106 ?auto_44108 ) ) ( SURFACE-AT ?auto_44111 ?auto_44112 ) ( CLEAR ?auto_44111 ) ( IS-CRATE ?auto_44106 ) ( not ( = ?auto_44093 ?auto_44111 ) ) ( not ( = ?auto_44094 ?auto_44111 ) ) ( not ( = ?auto_44096 ?auto_44111 ) ) ( not ( = ?auto_44107 ?auto_44111 ) ) ( not ( = ?auto_44113 ?auto_44111 ) ) ( not ( = ?auto_44098 ?auto_44111 ) ) ( not ( = ?auto_44101 ?auto_44111 ) ) ( not ( = ?auto_44106 ?auto_44111 ) ) ( not ( = ?auto_44108 ?auto_44111 ) ) ( AVAILABLE ?auto_44099 ) ( IN ?auto_44106 ?auto_44100 ) ( TRUCK-AT ?auto_44100 ?auto_44105 ) )
    :subtasks
    ( ( !DRIVE ?auto_44100 ?auto_44105 ?auto_44112 )
      ( MAKE-ON ?auto_44093 ?auto_44094 )
      ( MAKE-ON-VERIFY ?auto_44093 ?auto_44094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44114 - SURFACE
      ?auto_44115 - SURFACE
    )
    :vars
    (
      ?auto_44125 - HOIST
      ?auto_44131 - PLACE
      ?auto_44119 - PLACE
      ?auto_44123 - HOIST
      ?auto_44118 - SURFACE
      ?auto_44121 - SURFACE
      ?auto_44120 - PLACE
      ?auto_44129 - HOIST
      ?auto_44130 - SURFACE
      ?auto_44126 - SURFACE
      ?auto_44132 - PLACE
      ?auto_44133 - HOIST
      ?auto_44134 - SURFACE
      ?auto_44127 - SURFACE
      ?auto_44117 - PLACE
      ?auto_44124 - HOIST
      ?auto_44128 - SURFACE
      ?auto_44122 - SURFACE
      ?auto_44116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44125 ?auto_44131 ) ( IS-CRATE ?auto_44114 ) ( not ( = ?auto_44114 ?auto_44115 ) ) ( not ( = ?auto_44119 ?auto_44131 ) ) ( HOIST-AT ?auto_44123 ?auto_44119 ) ( not ( = ?auto_44125 ?auto_44123 ) ) ( AVAILABLE ?auto_44123 ) ( SURFACE-AT ?auto_44114 ?auto_44119 ) ( ON ?auto_44114 ?auto_44118 ) ( CLEAR ?auto_44114 ) ( not ( = ?auto_44114 ?auto_44118 ) ) ( not ( = ?auto_44115 ?auto_44118 ) ) ( IS-CRATE ?auto_44115 ) ( not ( = ?auto_44114 ?auto_44121 ) ) ( not ( = ?auto_44115 ?auto_44121 ) ) ( not ( = ?auto_44118 ?auto_44121 ) ) ( not ( = ?auto_44120 ?auto_44131 ) ) ( not ( = ?auto_44119 ?auto_44120 ) ) ( HOIST-AT ?auto_44129 ?auto_44120 ) ( not ( = ?auto_44125 ?auto_44129 ) ) ( not ( = ?auto_44123 ?auto_44129 ) ) ( AVAILABLE ?auto_44129 ) ( SURFACE-AT ?auto_44115 ?auto_44120 ) ( ON ?auto_44115 ?auto_44130 ) ( CLEAR ?auto_44115 ) ( not ( = ?auto_44114 ?auto_44130 ) ) ( not ( = ?auto_44115 ?auto_44130 ) ) ( not ( = ?auto_44118 ?auto_44130 ) ) ( not ( = ?auto_44121 ?auto_44130 ) ) ( IS-CRATE ?auto_44121 ) ( not ( = ?auto_44114 ?auto_44126 ) ) ( not ( = ?auto_44115 ?auto_44126 ) ) ( not ( = ?auto_44118 ?auto_44126 ) ) ( not ( = ?auto_44121 ?auto_44126 ) ) ( not ( = ?auto_44130 ?auto_44126 ) ) ( not ( = ?auto_44132 ?auto_44131 ) ) ( not ( = ?auto_44119 ?auto_44132 ) ) ( not ( = ?auto_44120 ?auto_44132 ) ) ( HOIST-AT ?auto_44133 ?auto_44132 ) ( not ( = ?auto_44125 ?auto_44133 ) ) ( not ( = ?auto_44123 ?auto_44133 ) ) ( not ( = ?auto_44129 ?auto_44133 ) ) ( AVAILABLE ?auto_44133 ) ( SURFACE-AT ?auto_44121 ?auto_44132 ) ( ON ?auto_44121 ?auto_44134 ) ( CLEAR ?auto_44121 ) ( not ( = ?auto_44114 ?auto_44134 ) ) ( not ( = ?auto_44115 ?auto_44134 ) ) ( not ( = ?auto_44118 ?auto_44134 ) ) ( not ( = ?auto_44121 ?auto_44134 ) ) ( not ( = ?auto_44130 ?auto_44134 ) ) ( not ( = ?auto_44126 ?auto_44134 ) ) ( IS-CRATE ?auto_44126 ) ( not ( = ?auto_44114 ?auto_44127 ) ) ( not ( = ?auto_44115 ?auto_44127 ) ) ( not ( = ?auto_44118 ?auto_44127 ) ) ( not ( = ?auto_44121 ?auto_44127 ) ) ( not ( = ?auto_44130 ?auto_44127 ) ) ( not ( = ?auto_44126 ?auto_44127 ) ) ( not ( = ?auto_44134 ?auto_44127 ) ) ( not ( = ?auto_44117 ?auto_44131 ) ) ( not ( = ?auto_44119 ?auto_44117 ) ) ( not ( = ?auto_44120 ?auto_44117 ) ) ( not ( = ?auto_44132 ?auto_44117 ) ) ( HOIST-AT ?auto_44124 ?auto_44117 ) ( not ( = ?auto_44125 ?auto_44124 ) ) ( not ( = ?auto_44123 ?auto_44124 ) ) ( not ( = ?auto_44129 ?auto_44124 ) ) ( not ( = ?auto_44133 ?auto_44124 ) ) ( SURFACE-AT ?auto_44126 ?auto_44117 ) ( ON ?auto_44126 ?auto_44128 ) ( CLEAR ?auto_44126 ) ( not ( = ?auto_44114 ?auto_44128 ) ) ( not ( = ?auto_44115 ?auto_44128 ) ) ( not ( = ?auto_44118 ?auto_44128 ) ) ( not ( = ?auto_44121 ?auto_44128 ) ) ( not ( = ?auto_44130 ?auto_44128 ) ) ( not ( = ?auto_44126 ?auto_44128 ) ) ( not ( = ?auto_44134 ?auto_44128 ) ) ( not ( = ?auto_44127 ?auto_44128 ) ) ( SURFACE-AT ?auto_44122 ?auto_44131 ) ( CLEAR ?auto_44122 ) ( IS-CRATE ?auto_44127 ) ( not ( = ?auto_44114 ?auto_44122 ) ) ( not ( = ?auto_44115 ?auto_44122 ) ) ( not ( = ?auto_44118 ?auto_44122 ) ) ( not ( = ?auto_44121 ?auto_44122 ) ) ( not ( = ?auto_44130 ?auto_44122 ) ) ( not ( = ?auto_44126 ?auto_44122 ) ) ( not ( = ?auto_44134 ?auto_44122 ) ) ( not ( = ?auto_44127 ?auto_44122 ) ) ( not ( = ?auto_44128 ?auto_44122 ) ) ( AVAILABLE ?auto_44125 ) ( TRUCK-AT ?auto_44116 ?auto_44117 ) ( LIFTING ?auto_44124 ?auto_44127 ) )
    :subtasks
    ( ( !LOAD ?auto_44124 ?auto_44127 ?auto_44116 ?auto_44117 )
      ( MAKE-ON ?auto_44114 ?auto_44115 )
      ( MAKE-ON-VERIFY ?auto_44114 ?auto_44115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44135 - SURFACE
      ?auto_44136 - SURFACE
    )
    :vars
    (
      ?auto_44155 - HOIST
      ?auto_44152 - PLACE
      ?auto_44142 - PLACE
      ?auto_44153 - HOIST
      ?auto_44140 - SURFACE
      ?auto_44147 - SURFACE
      ?auto_44145 - PLACE
      ?auto_44154 - HOIST
      ?auto_44150 - SURFACE
      ?auto_44143 - SURFACE
      ?auto_44137 - PLACE
      ?auto_44138 - HOIST
      ?auto_44149 - SURFACE
      ?auto_44148 - SURFACE
      ?auto_44146 - PLACE
      ?auto_44151 - HOIST
      ?auto_44141 - SURFACE
      ?auto_44139 - SURFACE
      ?auto_44144 - TRUCK
      ?auto_44156 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44155 ?auto_44152 ) ( IS-CRATE ?auto_44135 ) ( not ( = ?auto_44135 ?auto_44136 ) ) ( not ( = ?auto_44142 ?auto_44152 ) ) ( HOIST-AT ?auto_44153 ?auto_44142 ) ( not ( = ?auto_44155 ?auto_44153 ) ) ( AVAILABLE ?auto_44153 ) ( SURFACE-AT ?auto_44135 ?auto_44142 ) ( ON ?auto_44135 ?auto_44140 ) ( CLEAR ?auto_44135 ) ( not ( = ?auto_44135 ?auto_44140 ) ) ( not ( = ?auto_44136 ?auto_44140 ) ) ( IS-CRATE ?auto_44136 ) ( not ( = ?auto_44135 ?auto_44147 ) ) ( not ( = ?auto_44136 ?auto_44147 ) ) ( not ( = ?auto_44140 ?auto_44147 ) ) ( not ( = ?auto_44145 ?auto_44152 ) ) ( not ( = ?auto_44142 ?auto_44145 ) ) ( HOIST-AT ?auto_44154 ?auto_44145 ) ( not ( = ?auto_44155 ?auto_44154 ) ) ( not ( = ?auto_44153 ?auto_44154 ) ) ( AVAILABLE ?auto_44154 ) ( SURFACE-AT ?auto_44136 ?auto_44145 ) ( ON ?auto_44136 ?auto_44150 ) ( CLEAR ?auto_44136 ) ( not ( = ?auto_44135 ?auto_44150 ) ) ( not ( = ?auto_44136 ?auto_44150 ) ) ( not ( = ?auto_44140 ?auto_44150 ) ) ( not ( = ?auto_44147 ?auto_44150 ) ) ( IS-CRATE ?auto_44147 ) ( not ( = ?auto_44135 ?auto_44143 ) ) ( not ( = ?auto_44136 ?auto_44143 ) ) ( not ( = ?auto_44140 ?auto_44143 ) ) ( not ( = ?auto_44147 ?auto_44143 ) ) ( not ( = ?auto_44150 ?auto_44143 ) ) ( not ( = ?auto_44137 ?auto_44152 ) ) ( not ( = ?auto_44142 ?auto_44137 ) ) ( not ( = ?auto_44145 ?auto_44137 ) ) ( HOIST-AT ?auto_44138 ?auto_44137 ) ( not ( = ?auto_44155 ?auto_44138 ) ) ( not ( = ?auto_44153 ?auto_44138 ) ) ( not ( = ?auto_44154 ?auto_44138 ) ) ( AVAILABLE ?auto_44138 ) ( SURFACE-AT ?auto_44147 ?auto_44137 ) ( ON ?auto_44147 ?auto_44149 ) ( CLEAR ?auto_44147 ) ( not ( = ?auto_44135 ?auto_44149 ) ) ( not ( = ?auto_44136 ?auto_44149 ) ) ( not ( = ?auto_44140 ?auto_44149 ) ) ( not ( = ?auto_44147 ?auto_44149 ) ) ( not ( = ?auto_44150 ?auto_44149 ) ) ( not ( = ?auto_44143 ?auto_44149 ) ) ( IS-CRATE ?auto_44143 ) ( not ( = ?auto_44135 ?auto_44148 ) ) ( not ( = ?auto_44136 ?auto_44148 ) ) ( not ( = ?auto_44140 ?auto_44148 ) ) ( not ( = ?auto_44147 ?auto_44148 ) ) ( not ( = ?auto_44150 ?auto_44148 ) ) ( not ( = ?auto_44143 ?auto_44148 ) ) ( not ( = ?auto_44149 ?auto_44148 ) ) ( not ( = ?auto_44146 ?auto_44152 ) ) ( not ( = ?auto_44142 ?auto_44146 ) ) ( not ( = ?auto_44145 ?auto_44146 ) ) ( not ( = ?auto_44137 ?auto_44146 ) ) ( HOIST-AT ?auto_44151 ?auto_44146 ) ( not ( = ?auto_44155 ?auto_44151 ) ) ( not ( = ?auto_44153 ?auto_44151 ) ) ( not ( = ?auto_44154 ?auto_44151 ) ) ( not ( = ?auto_44138 ?auto_44151 ) ) ( SURFACE-AT ?auto_44143 ?auto_44146 ) ( ON ?auto_44143 ?auto_44141 ) ( CLEAR ?auto_44143 ) ( not ( = ?auto_44135 ?auto_44141 ) ) ( not ( = ?auto_44136 ?auto_44141 ) ) ( not ( = ?auto_44140 ?auto_44141 ) ) ( not ( = ?auto_44147 ?auto_44141 ) ) ( not ( = ?auto_44150 ?auto_44141 ) ) ( not ( = ?auto_44143 ?auto_44141 ) ) ( not ( = ?auto_44149 ?auto_44141 ) ) ( not ( = ?auto_44148 ?auto_44141 ) ) ( SURFACE-AT ?auto_44139 ?auto_44152 ) ( CLEAR ?auto_44139 ) ( IS-CRATE ?auto_44148 ) ( not ( = ?auto_44135 ?auto_44139 ) ) ( not ( = ?auto_44136 ?auto_44139 ) ) ( not ( = ?auto_44140 ?auto_44139 ) ) ( not ( = ?auto_44147 ?auto_44139 ) ) ( not ( = ?auto_44150 ?auto_44139 ) ) ( not ( = ?auto_44143 ?auto_44139 ) ) ( not ( = ?auto_44149 ?auto_44139 ) ) ( not ( = ?auto_44148 ?auto_44139 ) ) ( not ( = ?auto_44141 ?auto_44139 ) ) ( AVAILABLE ?auto_44155 ) ( TRUCK-AT ?auto_44144 ?auto_44146 ) ( AVAILABLE ?auto_44151 ) ( SURFACE-AT ?auto_44148 ?auto_44146 ) ( ON ?auto_44148 ?auto_44156 ) ( CLEAR ?auto_44148 ) ( not ( = ?auto_44135 ?auto_44156 ) ) ( not ( = ?auto_44136 ?auto_44156 ) ) ( not ( = ?auto_44140 ?auto_44156 ) ) ( not ( = ?auto_44147 ?auto_44156 ) ) ( not ( = ?auto_44150 ?auto_44156 ) ) ( not ( = ?auto_44143 ?auto_44156 ) ) ( not ( = ?auto_44149 ?auto_44156 ) ) ( not ( = ?auto_44148 ?auto_44156 ) ) ( not ( = ?auto_44141 ?auto_44156 ) ) ( not ( = ?auto_44139 ?auto_44156 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44151 ?auto_44148 ?auto_44156 ?auto_44146 )
      ( MAKE-ON ?auto_44135 ?auto_44136 )
      ( MAKE-ON-VERIFY ?auto_44135 ?auto_44136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44157 - SURFACE
      ?auto_44158 - SURFACE
    )
    :vars
    (
      ?auto_44167 - HOIST
      ?auto_44159 - PLACE
      ?auto_44173 - PLACE
      ?auto_44177 - HOIST
      ?auto_44164 - SURFACE
      ?auto_44169 - SURFACE
      ?auto_44161 - PLACE
      ?auto_44166 - HOIST
      ?auto_44172 - SURFACE
      ?auto_44168 - SURFACE
      ?auto_44160 - PLACE
      ?auto_44174 - HOIST
      ?auto_44163 - SURFACE
      ?auto_44165 - SURFACE
      ?auto_44176 - PLACE
      ?auto_44170 - HOIST
      ?auto_44171 - SURFACE
      ?auto_44175 - SURFACE
      ?auto_44162 - SURFACE
      ?auto_44178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44167 ?auto_44159 ) ( IS-CRATE ?auto_44157 ) ( not ( = ?auto_44157 ?auto_44158 ) ) ( not ( = ?auto_44173 ?auto_44159 ) ) ( HOIST-AT ?auto_44177 ?auto_44173 ) ( not ( = ?auto_44167 ?auto_44177 ) ) ( AVAILABLE ?auto_44177 ) ( SURFACE-AT ?auto_44157 ?auto_44173 ) ( ON ?auto_44157 ?auto_44164 ) ( CLEAR ?auto_44157 ) ( not ( = ?auto_44157 ?auto_44164 ) ) ( not ( = ?auto_44158 ?auto_44164 ) ) ( IS-CRATE ?auto_44158 ) ( not ( = ?auto_44157 ?auto_44169 ) ) ( not ( = ?auto_44158 ?auto_44169 ) ) ( not ( = ?auto_44164 ?auto_44169 ) ) ( not ( = ?auto_44161 ?auto_44159 ) ) ( not ( = ?auto_44173 ?auto_44161 ) ) ( HOIST-AT ?auto_44166 ?auto_44161 ) ( not ( = ?auto_44167 ?auto_44166 ) ) ( not ( = ?auto_44177 ?auto_44166 ) ) ( AVAILABLE ?auto_44166 ) ( SURFACE-AT ?auto_44158 ?auto_44161 ) ( ON ?auto_44158 ?auto_44172 ) ( CLEAR ?auto_44158 ) ( not ( = ?auto_44157 ?auto_44172 ) ) ( not ( = ?auto_44158 ?auto_44172 ) ) ( not ( = ?auto_44164 ?auto_44172 ) ) ( not ( = ?auto_44169 ?auto_44172 ) ) ( IS-CRATE ?auto_44169 ) ( not ( = ?auto_44157 ?auto_44168 ) ) ( not ( = ?auto_44158 ?auto_44168 ) ) ( not ( = ?auto_44164 ?auto_44168 ) ) ( not ( = ?auto_44169 ?auto_44168 ) ) ( not ( = ?auto_44172 ?auto_44168 ) ) ( not ( = ?auto_44160 ?auto_44159 ) ) ( not ( = ?auto_44173 ?auto_44160 ) ) ( not ( = ?auto_44161 ?auto_44160 ) ) ( HOIST-AT ?auto_44174 ?auto_44160 ) ( not ( = ?auto_44167 ?auto_44174 ) ) ( not ( = ?auto_44177 ?auto_44174 ) ) ( not ( = ?auto_44166 ?auto_44174 ) ) ( AVAILABLE ?auto_44174 ) ( SURFACE-AT ?auto_44169 ?auto_44160 ) ( ON ?auto_44169 ?auto_44163 ) ( CLEAR ?auto_44169 ) ( not ( = ?auto_44157 ?auto_44163 ) ) ( not ( = ?auto_44158 ?auto_44163 ) ) ( not ( = ?auto_44164 ?auto_44163 ) ) ( not ( = ?auto_44169 ?auto_44163 ) ) ( not ( = ?auto_44172 ?auto_44163 ) ) ( not ( = ?auto_44168 ?auto_44163 ) ) ( IS-CRATE ?auto_44168 ) ( not ( = ?auto_44157 ?auto_44165 ) ) ( not ( = ?auto_44158 ?auto_44165 ) ) ( not ( = ?auto_44164 ?auto_44165 ) ) ( not ( = ?auto_44169 ?auto_44165 ) ) ( not ( = ?auto_44172 ?auto_44165 ) ) ( not ( = ?auto_44168 ?auto_44165 ) ) ( not ( = ?auto_44163 ?auto_44165 ) ) ( not ( = ?auto_44176 ?auto_44159 ) ) ( not ( = ?auto_44173 ?auto_44176 ) ) ( not ( = ?auto_44161 ?auto_44176 ) ) ( not ( = ?auto_44160 ?auto_44176 ) ) ( HOIST-AT ?auto_44170 ?auto_44176 ) ( not ( = ?auto_44167 ?auto_44170 ) ) ( not ( = ?auto_44177 ?auto_44170 ) ) ( not ( = ?auto_44166 ?auto_44170 ) ) ( not ( = ?auto_44174 ?auto_44170 ) ) ( SURFACE-AT ?auto_44168 ?auto_44176 ) ( ON ?auto_44168 ?auto_44171 ) ( CLEAR ?auto_44168 ) ( not ( = ?auto_44157 ?auto_44171 ) ) ( not ( = ?auto_44158 ?auto_44171 ) ) ( not ( = ?auto_44164 ?auto_44171 ) ) ( not ( = ?auto_44169 ?auto_44171 ) ) ( not ( = ?auto_44172 ?auto_44171 ) ) ( not ( = ?auto_44168 ?auto_44171 ) ) ( not ( = ?auto_44163 ?auto_44171 ) ) ( not ( = ?auto_44165 ?auto_44171 ) ) ( SURFACE-AT ?auto_44175 ?auto_44159 ) ( CLEAR ?auto_44175 ) ( IS-CRATE ?auto_44165 ) ( not ( = ?auto_44157 ?auto_44175 ) ) ( not ( = ?auto_44158 ?auto_44175 ) ) ( not ( = ?auto_44164 ?auto_44175 ) ) ( not ( = ?auto_44169 ?auto_44175 ) ) ( not ( = ?auto_44172 ?auto_44175 ) ) ( not ( = ?auto_44168 ?auto_44175 ) ) ( not ( = ?auto_44163 ?auto_44175 ) ) ( not ( = ?auto_44165 ?auto_44175 ) ) ( not ( = ?auto_44171 ?auto_44175 ) ) ( AVAILABLE ?auto_44167 ) ( AVAILABLE ?auto_44170 ) ( SURFACE-AT ?auto_44165 ?auto_44176 ) ( ON ?auto_44165 ?auto_44162 ) ( CLEAR ?auto_44165 ) ( not ( = ?auto_44157 ?auto_44162 ) ) ( not ( = ?auto_44158 ?auto_44162 ) ) ( not ( = ?auto_44164 ?auto_44162 ) ) ( not ( = ?auto_44169 ?auto_44162 ) ) ( not ( = ?auto_44172 ?auto_44162 ) ) ( not ( = ?auto_44168 ?auto_44162 ) ) ( not ( = ?auto_44163 ?auto_44162 ) ) ( not ( = ?auto_44165 ?auto_44162 ) ) ( not ( = ?auto_44171 ?auto_44162 ) ) ( not ( = ?auto_44175 ?auto_44162 ) ) ( TRUCK-AT ?auto_44178 ?auto_44159 ) )
    :subtasks
    ( ( !DRIVE ?auto_44178 ?auto_44159 ?auto_44176 )
      ( MAKE-ON ?auto_44157 ?auto_44158 )
      ( MAKE-ON-VERIFY ?auto_44157 ?auto_44158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44179 - SURFACE
      ?auto_44180 - SURFACE
    )
    :vars
    (
      ?auto_44188 - HOIST
      ?auto_44190 - PLACE
      ?auto_44181 - PLACE
      ?auto_44184 - HOIST
      ?auto_44198 - SURFACE
      ?auto_44194 - SURFACE
      ?auto_44187 - PLACE
      ?auto_44200 - HOIST
      ?auto_44199 - SURFACE
      ?auto_44183 - SURFACE
      ?auto_44195 - PLACE
      ?auto_44186 - HOIST
      ?auto_44182 - SURFACE
      ?auto_44191 - SURFACE
      ?auto_44189 - PLACE
      ?auto_44192 - HOIST
      ?auto_44197 - SURFACE
      ?auto_44193 - SURFACE
      ?auto_44196 - SURFACE
      ?auto_44185 - TRUCK
      ?auto_44201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44188 ?auto_44190 ) ( IS-CRATE ?auto_44179 ) ( not ( = ?auto_44179 ?auto_44180 ) ) ( not ( = ?auto_44181 ?auto_44190 ) ) ( HOIST-AT ?auto_44184 ?auto_44181 ) ( not ( = ?auto_44188 ?auto_44184 ) ) ( AVAILABLE ?auto_44184 ) ( SURFACE-AT ?auto_44179 ?auto_44181 ) ( ON ?auto_44179 ?auto_44198 ) ( CLEAR ?auto_44179 ) ( not ( = ?auto_44179 ?auto_44198 ) ) ( not ( = ?auto_44180 ?auto_44198 ) ) ( IS-CRATE ?auto_44180 ) ( not ( = ?auto_44179 ?auto_44194 ) ) ( not ( = ?auto_44180 ?auto_44194 ) ) ( not ( = ?auto_44198 ?auto_44194 ) ) ( not ( = ?auto_44187 ?auto_44190 ) ) ( not ( = ?auto_44181 ?auto_44187 ) ) ( HOIST-AT ?auto_44200 ?auto_44187 ) ( not ( = ?auto_44188 ?auto_44200 ) ) ( not ( = ?auto_44184 ?auto_44200 ) ) ( AVAILABLE ?auto_44200 ) ( SURFACE-AT ?auto_44180 ?auto_44187 ) ( ON ?auto_44180 ?auto_44199 ) ( CLEAR ?auto_44180 ) ( not ( = ?auto_44179 ?auto_44199 ) ) ( not ( = ?auto_44180 ?auto_44199 ) ) ( not ( = ?auto_44198 ?auto_44199 ) ) ( not ( = ?auto_44194 ?auto_44199 ) ) ( IS-CRATE ?auto_44194 ) ( not ( = ?auto_44179 ?auto_44183 ) ) ( not ( = ?auto_44180 ?auto_44183 ) ) ( not ( = ?auto_44198 ?auto_44183 ) ) ( not ( = ?auto_44194 ?auto_44183 ) ) ( not ( = ?auto_44199 ?auto_44183 ) ) ( not ( = ?auto_44195 ?auto_44190 ) ) ( not ( = ?auto_44181 ?auto_44195 ) ) ( not ( = ?auto_44187 ?auto_44195 ) ) ( HOIST-AT ?auto_44186 ?auto_44195 ) ( not ( = ?auto_44188 ?auto_44186 ) ) ( not ( = ?auto_44184 ?auto_44186 ) ) ( not ( = ?auto_44200 ?auto_44186 ) ) ( AVAILABLE ?auto_44186 ) ( SURFACE-AT ?auto_44194 ?auto_44195 ) ( ON ?auto_44194 ?auto_44182 ) ( CLEAR ?auto_44194 ) ( not ( = ?auto_44179 ?auto_44182 ) ) ( not ( = ?auto_44180 ?auto_44182 ) ) ( not ( = ?auto_44198 ?auto_44182 ) ) ( not ( = ?auto_44194 ?auto_44182 ) ) ( not ( = ?auto_44199 ?auto_44182 ) ) ( not ( = ?auto_44183 ?auto_44182 ) ) ( IS-CRATE ?auto_44183 ) ( not ( = ?auto_44179 ?auto_44191 ) ) ( not ( = ?auto_44180 ?auto_44191 ) ) ( not ( = ?auto_44198 ?auto_44191 ) ) ( not ( = ?auto_44194 ?auto_44191 ) ) ( not ( = ?auto_44199 ?auto_44191 ) ) ( not ( = ?auto_44183 ?auto_44191 ) ) ( not ( = ?auto_44182 ?auto_44191 ) ) ( not ( = ?auto_44189 ?auto_44190 ) ) ( not ( = ?auto_44181 ?auto_44189 ) ) ( not ( = ?auto_44187 ?auto_44189 ) ) ( not ( = ?auto_44195 ?auto_44189 ) ) ( HOIST-AT ?auto_44192 ?auto_44189 ) ( not ( = ?auto_44188 ?auto_44192 ) ) ( not ( = ?auto_44184 ?auto_44192 ) ) ( not ( = ?auto_44200 ?auto_44192 ) ) ( not ( = ?auto_44186 ?auto_44192 ) ) ( SURFACE-AT ?auto_44183 ?auto_44189 ) ( ON ?auto_44183 ?auto_44197 ) ( CLEAR ?auto_44183 ) ( not ( = ?auto_44179 ?auto_44197 ) ) ( not ( = ?auto_44180 ?auto_44197 ) ) ( not ( = ?auto_44198 ?auto_44197 ) ) ( not ( = ?auto_44194 ?auto_44197 ) ) ( not ( = ?auto_44199 ?auto_44197 ) ) ( not ( = ?auto_44183 ?auto_44197 ) ) ( not ( = ?auto_44182 ?auto_44197 ) ) ( not ( = ?auto_44191 ?auto_44197 ) ) ( IS-CRATE ?auto_44191 ) ( not ( = ?auto_44179 ?auto_44193 ) ) ( not ( = ?auto_44180 ?auto_44193 ) ) ( not ( = ?auto_44198 ?auto_44193 ) ) ( not ( = ?auto_44194 ?auto_44193 ) ) ( not ( = ?auto_44199 ?auto_44193 ) ) ( not ( = ?auto_44183 ?auto_44193 ) ) ( not ( = ?auto_44182 ?auto_44193 ) ) ( not ( = ?auto_44191 ?auto_44193 ) ) ( not ( = ?auto_44197 ?auto_44193 ) ) ( AVAILABLE ?auto_44192 ) ( SURFACE-AT ?auto_44191 ?auto_44189 ) ( ON ?auto_44191 ?auto_44196 ) ( CLEAR ?auto_44191 ) ( not ( = ?auto_44179 ?auto_44196 ) ) ( not ( = ?auto_44180 ?auto_44196 ) ) ( not ( = ?auto_44198 ?auto_44196 ) ) ( not ( = ?auto_44194 ?auto_44196 ) ) ( not ( = ?auto_44199 ?auto_44196 ) ) ( not ( = ?auto_44183 ?auto_44196 ) ) ( not ( = ?auto_44182 ?auto_44196 ) ) ( not ( = ?auto_44191 ?auto_44196 ) ) ( not ( = ?auto_44197 ?auto_44196 ) ) ( not ( = ?auto_44193 ?auto_44196 ) ) ( TRUCK-AT ?auto_44185 ?auto_44190 ) ( SURFACE-AT ?auto_44201 ?auto_44190 ) ( CLEAR ?auto_44201 ) ( LIFTING ?auto_44188 ?auto_44193 ) ( IS-CRATE ?auto_44193 ) ( not ( = ?auto_44179 ?auto_44201 ) ) ( not ( = ?auto_44180 ?auto_44201 ) ) ( not ( = ?auto_44198 ?auto_44201 ) ) ( not ( = ?auto_44194 ?auto_44201 ) ) ( not ( = ?auto_44199 ?auto_44201 ) ) ( not ( = ?auto_44183 ?auto_44201 ) ) ( not ( = ?auto_44182 ?auto_44201 ) ) ( not ( = ?auto_44191 ?auto_44201 ) ) ( not ( = ?auto_44197 ?auto_44201 ) ) ( not ( = ?auto_44193 ?auto_44201 ) ) ( not ( = ?auto_44196 ?auto_44201 ) ) )
    :subtasks
    ( ( !DROP ?auto_44188 ?auto_44193 ?auto_44201 ?auto_44190 )
      ( MAKE-ON ?auto_44179 ?auto_44180 )
      ( MAKE-ON-VERIFY ?auto_44179 ?auto_44180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44202 - SURFACE
      ?auto_44203 - SURFACE
    )
    :vars
    (
      ?auto_44211 - HOIST
      ?auto_44218 - PLACE
      ?auto_44223 - PLACE
      ?auto_44224 - HOIST
      ?auto_44210 - SURFACE
      ?auto_44206 - SURFACE
      ?auto_44220 - PLACE
      ?auto_44215 - HOIST
      ?auto_44214 - SURFACE
      ?auto_44204 - SURFACE
      ?auto_44216 - PLACE
      ?auto_44212 - HOIST
      ?auto_44208 - SURFACE
      ?auto_44217 - SURFACE
      ?auto_44205 - PLACE
      ?auto_44209 - HOIST
      ?auto_44219 - SURFACE
      ?auto_44213 - SURFACE
      ?auto_44222 - SURFACE
      ?auto_44207 - TRUCK
      ?auto_44221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44211 ?auto_44218 ) ( IS-CRATE ?auto_44202 ) ( not ( = ?auto_44202 ?auto_44203 ) ) ( not ( = ?auto_44223 ?auto_44218 ) ) ( HOIST-AT ?auto_44224 ?auto_44223 ) ( not ( = ?auto_44211 ?auto_44224 ) ) ( AVAILABLE ?auto_44224 ) ( SURFACE-AT ?auto_44202 ?auto_44223 ) ( ON ?auto_44202 ?auto_44210 ) ( CLEAR ?auto_44202 ) ( not ( = ?auto_44202 ?auto_44210 ) ) ( not ( = ?auto_44203 ?auto_44210 ) ) ( IS-CRATE ?auto_44203 ) ( not ( = ?auto_44202 ?auto_44206 ) ) ( not ( = ?auto_44203 ?auto_44206 ) ) ( not ( = ?auto_44210 ?auto_44206 ) ) ( not ( = ?auto_44220 ?auto_44218 ) ) ( not ( = ?auto_44223 ?auto_44220 ) ) ( HOIST-AT ?auto_44215 ?auto_44220 ) ( not ( = ?auto_44211 ?auto_44215 ) ) ( not ( = ?auto_44224 ?auto_44215 ) ) ( AVAILABLE ?auto_44215 ) ( SURFACE-AT ?auto_44203 ?auto_44220 ) ( ON ?auto_44203 ?auto_44214 ) ( CLEAR ?auto_44203 ) ( not ( = ?auto_44202 ?auto_44214 ) ) ( not ( = ?auto_44203 ?auto_44214 ) ) ( not ( = ?auto_44210 ?auto_44214 ) ) ( not ( = ?auto_44206 ?auto_44214 ) ) ( IS-CRATE ?auto_44206 ) ( not ( = ?auto_44202 ?auto_44204 ) ) ( not ( = ?auto_44203 ?auto_44204 ) ) ( not ( = ?auto_44210 ?auto_44204 ) ) ( not ( = ?auto_44206 ?auto_44204 ) ) ( not ( = ?auto_44214 ?auto_44204 ) ) ( not ( = ?auto_44216 ?auto_44218 ) ) ( not ( = ?auto_44223 ?auto_44216 ) ) ( not ( = ?auto_44220 ?auto_44216 ) ) ( HOIST-AT ?auto_44212 ?auto_44216 ) ( not ( = ?auto_44211 ?auto_44212 ) ) ( not ( = ?auto_44224 ?auto_44212 ) ) ( not ( = ?auto_44215 ?auto_44212 ) ) ( AVAILABLE ?auto_44212 ) ( SURFACE-AT ?auto_44206 ?auto_44216 ) ( ON ?auto_44206 ?auto_44208 ) ( CLEAR ?auto_44206 ) ( not ( = ?auto_44202 ?auto_44208 ) ) ( not ( = ?auto_44203 ?auto_44208 ) ) ( not ( = ?auto_44210 ?auto_44208 ) ) ( not ( = ?auto_44206 ?auto_44208 ) ) ( not ( = ?auto_44214 ?auto_44208 ) ) ( not ( = ?auto_44204 ?auto_44208 ) ) ( IS-CRATE ?auto_44204 ) ( not ( = ?auto_44202 ?auto_44217 ) ) ( not ( = ?auto_44203 ?auto_44217 ) ) ( not ( = ?auto_44210 ?auto_44217 ) ) ( not ( = ?auto_44206 ?auto_44217 ) ) ( not ( = ?auto_44214 ?auto_44217 ) ) ( not ( = ?auto_44204 ?auto_44217 ) ) ( not ( = ?auto_44208 ?auto_44217 ) ) ( not ( = ?auto_44205 ?auto_44218 ) ) ( not ( = ?auto_44223 ?auto_44205 ) ) ( not ( = ?auto_44220 ?auto_44205 ) ) ( not ( = ?auto_44216 ?auto_44205 ) ) ( HOIST-AT ?auto_44209 ?auto_44205 ) ( not ( = ?auto_44211 ?auto_44209 ) ) ( not ( = ?auto_44224 ?auto_44209 ) ) ( not ( = ?auto_44215 ?auto_44209 ) ) ( not ( = ?auto_44212 ?auto_44209 ) ) ( SURFACE-AT ?auto_44204 ?auto_44205 ) ( ON ?auto_44204 ?auto_44219 ) ( CLEAR ?auto_44204 ) ( not ( = ?auto_44202 ?auto_44219 ) ) ( not ( = ?auto_44203 ?auto_44219 ) ) ( not ( = ?auto_44210 ?auto_44219 ) ) ( not ( = ?auto_44206 ?auto_44219 ) ) ( not ( = ?auto_44214 ?auto_44219 ) ) ( not ( = ?auto_44204 ?auto_44219 ) ) ( not ( = ?auto_44208 ?auto_44219 ) ) ( not ( = ?auto_44217 ?auto_44219 ) ) ( IS-CRATE ?auto_44217 ) ( not ( = ?auto_44202 ?auto_44213 ) ) ( not ( = ?auto_44203 ?auto_44213 ) ) ( not ( = ?auto_44210 ?auto_44213 ) ) ( not ( = ?auto_44206 ?auto_44213 ) ) ( not ( = ?auto_44214 ?auto_44213 ) ) ( not ( = ?auto_44204 ?auto_44213 ) ) ( not ( = ?auto_44208 ?auto_44213 ) ) ( not ( = ?auto_44217 ?auto_44213 ) ) ( not ( = ?auto_44219 ?auto_44213 ) ) ( AVAILABLE ?auto_44209 ) ( SURFACE-AT ?auto_44217 ?auto_44205 ) ( ON ?auto_44217 ?auto_44222 ) ( CLEAR ?auto_44217 ) ( not ( = ?auto_44202 ?auto_44222 ) ) ( not ( = ?auto_44203 ?auto_44222 ) ) ( not ( = ?auto_44210 ?auto_44222 ) ) ( not ( = ?auto_44206 ?auto_44222 ) ) ( not ( = ?auto_44214 ?auto_44222 ) ) ( not ( = ?auto_44204 ?auto_44222 ) ) ( not ( = ?auto_44208 ?auto_44222 ) ) ( not ( = ?auto_44217 ?auto_44222 ) ) ( not ( = ?auto_44219 ?auto_44222 ) ) ( not ( = ?auto_44213 ?auto_44222 ) ) ( TRUCK-AT ?auto_44207 ?auto_44218 ) ( SURFACE-AT ?auto_44221 ?auto_44218 ) ( CLEAR ?auto_44221 ) ( IS-CRATE ?auto_44213 ) ( not ( = ?auto_44202 ?auto_44221 ) ) ( not ( = ?auto_44203 ?auto_44221 ) ) ( not ( = ?auto_44210 ?auto_44221 ) ) ( not ( = ?auto_44206 ?auto_44221 ) ) ( not ( = ?auto_44214 ?auto_44221 ) ) ( not ( = ?auto_44204 ?auto_44221 ) ) ( not ( = ?auto_44208 ?auto_44221 ) ) ( not ( = ?auto_44217 ?auto_44221 ) ) ( not ( = ?auto_44219 ?auto_44221 ) ) ( not ( = ?auto_44213 ?auto_44221 ) ) ( not ( = ?auto_44222 ?auto_44221 ) ) ( AVAILABLE ?auto_44211 ) ( IN ?auto_44213 ?auto_44207 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44211 ?auto_44213 ?auto_44207 ?auto_44218 )
      ( MAKE-ON ?auto_44202 ?auto_44203 )
      ( MAKE-ON-VERIFY ?auto_44202 ?auto_44203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44225 - SURFACE
      ?auto_44226 - SURFACE
    )
    :vars
    (
      ?auto_44241 - HOIST
      ?auto_44228 - PLACE
      ?auto_44229 - PLACE
      ?auto_44239 - HOIST
      ?auto_44247 - SURFACE
      ?auto_44235 - SURFACE
      ?auto_44230 - PLACE
      ?auto_44242 - HOIST
      ?auto_44244 - SURFACE
      ?auto_44231 - SURFACE
      ?auto_44234 - PLACE
      ?auto_44245 - HOIST
      ?auto_44232 - SURFACE
      ?auto_44243 - SURFACE
      ?auto_44240 - PLACE
      ?auto_44236 - HOIST
      ?auto_44237 - SURFACE
      ?auto_44246 - SURFACE
      ?auto_44233 - SURFACE
      ?auto_44238 - SURFACE
      ?auto_44227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44241 ?auto_44228 ) ( IS-CRATE ?auto_44225 ) ( not ( = ?auto_44225 ?auto_44226 ) ) ( not ( = ?auto_44229 ?auto_44228 ) ) ( HOIST-AT ?auto_44239 ?auto_44229 ) ( not ( = ?auto_44241 ?auto_44239 ) ) ( AVAILABLE ?auto_44239 ) ( SURFACE-AT ?auto_44225 ?auto_44229 ) ( ON ?auto_44225 ?auto_44247 ) ( CLEAR ?auto_44225 ) ( not ( = ?auto_44225 ?auto_44247 ) ) ( not ( = ?auto_44226 ?auto_44247 ) ) ( IS-CRATE ?auto_44226 ) ( not ( = ?auto_44225 ?auto_44235 ) ) ( not ( = ?auto_44226 ?auto_44235 ) ) ( not ( = ?auto_44247 ?auto_44235 ) ) ( not ( = ?auto_44230 ?auto_44228 ) ) ( not ( = ?auto_44229 ?auto_44230 ) ) ( HOIST-AT ?auto_44242 ?auto_44230 ) ( not ( = ?auto_44241 ?auto_44242 ) ) ( not ( = ?auto_44239 ?auto_44242 ) ) ( AVAILABLE ?auto_44242 ) ( SURFACE-AT ?auto_44226 ?auto_44230 ) ( ON ?auto_44226 ?auto_44244 ) ( CLEAR ?auto_44226 ) ( not ( = ?auto_44225 ?auto_44244 ) ) ( not ( = ?auto_44226 ?auto_44244 ) ) ( not ( = ?auto_44247 ?auto_44244 ) ) ( not ( = ?auto_44235 ?auto_44244 ) ) ( IS-CRATE ?auto_44235 ) ( not ( = ?auto_44225 ?auto_44231 ) ) ( not ( = ?auto_44226 ?auto_44231 ) ) ( not ( = ?auto_44247 ?auto_44231 ) ) ( not ( = ?auto_44235 ?auto_44231 ) ) ( not ( = ?auto_44244 ?auto_44231 ) ) ( not ( = ?auto_44234 ?auto_44228 ) ) ( not ( = ?auto_44229 ?auto_44234 ) ) ( not ( = ?auto_44230 ?auto_44234 ) ) ( HOIST-AT ?auto_44245 ?auto_44234 ) ( not ( = ?auto_44241 ?auto_44245 ) ) ( not ( = ?auto_44239 ?auto_44245 ) ) ( not ( = ?auto_44242 ?auto_44245 ) ) ( AVAILABLE ?auto_44245 ) ( SURFACE-AT ?auto_44235 ?auto_44234 ) ( ON ?auto_44235 ?auto_44232 ) ( CLEAR ?auto_44235 ) ( not ( = ?auto_44225 ?auto_44232 ) ) ( not ( = ?auto_44226 ?auto_44232 ) ) ( not ( = ?auto_44247 ?auto_44232 ) ) ( not ( = ?auto_44235 ?auto_44232 ) ) ( not ( = ?auto_44244 ?auto_44232 ) ) ( not ( = ?auto_44231 ?auto_44232 ) ) ( IS-CRATE ?auto_44231 ) ( not ( = ?auto_44225 ?auto_44243 ) ) ( not ( = ?auto_44226 ?auto_44243 ) ) ( not ( = ?auto_44247 ?auto_44243 ) ) ( not ( = ?auto_44235 ?auto_44243 ) ) ( not ( = ?auto_44244 ?auto_44243 ) ) ( not ( = ?auto_44231 ?auto_44243 ) ) ( not ( = ?auto_44232 ?auto_44243 ) ) ( not ( = ?auto_44240 ?auto_44228 ) ) ( not ( = ?auto_44229 ?auto_44240 ) ) ( not ( = ?auto_44230 ?auto_44240 ) ) ( not ( = ?auto_44234 ?auto_44240 ) ) ( HOIST-AT ?auto_44236 ?auto_44240 ) ( not ( = ?auto_44241 ?auto_44236 ) ) ( not ( = ?auto_44239 ?auto_44236 ) ) ( not ( = ?auto_44242 ?auto_44236 ) ) ( not ( = ?auto_44245 ?auto_44236 ) ) ( SURFACE-AT ?auto_44231 ?auto_44240 ) ( ON ?auto_44231 ?auto_44237 ) ( CLEAR ?auto_44231 ) ( not ( = ?auto_44225 ?auto_44237 ) ) ( not ( = ?auto_44226 ?auto_44237 ) ) ( not ( = ?auto_44247 ?auto_44237 ) ) ( not ( = ?auto_44235 ?auto_44237 ) ) ( not ( = ?auto_44244 ?auto_44237 ) ) ( not ( = ?auto_44231 ?auto_44237 ) ) ( not ( = ?auto_44232 ?auto_44237 ) ) ( not ( = ?auto_44243 ?auto_44237 ) ) ( IS-CRATE ?auto_44243 ) ( not ( = ?auto_44225 ?auto_44246 ) ) ( not ( = ?auto_44226 ?auto_44246 ) ) ( not ( = ?auto_44247 ?auto_44246 ) ) ( not ( = ?auto_44235 ?auto_44246 ) ) ( not ( = ?auto_44244 ?auto_44246 ) ) ( not ( = ?auto_44231 ?auto_44246 ) ) ( not ( = ?auto_44232 ?auto_44246 ) ) ( not ( = ?auto_44243 ?auto_44246 ) ) ( not ( = ?auto_44237 ?auto_44246 ) ) ( AVAILABLE ?auto_44236 ) ( SURFACE-AT ?auto_44243 ?auto_44240 ) ( ON ?auto_44243 ?auto_44233 ) ( CLEAR ?auto_44243 ) ( not ( = ?auto_44225 ?auto_44233 ) ) ( not ( = ?auto_44226 ?auto_44233 ) ) ( not ( = ?auto_44247 ?auto_44233 ) ) ( not ( = ?auto_44235 ?auto_44233 ) ) ( not ( = ?auto_44244 ?auto_44233 ) ) ( not ( = ?auto_44231 ?auto_44233 ) ) ( not ( = ?auto_44232 ?auto_44233 ) ) ( not ( = ?auto_44243 ?auto_44233 ) ) ( not ( = ?auto_44237 ?auto_44233 ) ) ( not ( = ?auto_44246 ?auto_44233 ) ) ( SURFACE-AT ?auto_44238 ?auto_44228 ) ( CLEAR ?auto_44238 ) ( IS-CRATE ?auto_44246 ) ( not ( = ?auto_44225 ?auto_44238 ) ) ( not ( = ?auto_44226 ?auto_44238 ) ) ( not ( = ?auto_44247 ?auto_44238 ) ) ( not ( = ?auto_44235 ?auto_44238 ) ) ( not ( = ?auto_44244 ?auto_44238 ) ) ( not ( = ?auto_44231 ?auto_44238 ) ) ( not ( = ?auto_44232 ?auto_44238 ) ) ( not ( = ?auto_44243 ?auto_44238 ) ) ( not ( = ?auto_44237 ?auto_44238 ) ) ( not ( = ?auto_44246 ?auto_44238 ) ) ( not ( = ?auto_44233 ?auto_44238 ) ) ( AVAILABLE ?auto_44241 ) ( IN ?auto_44246 ?auto_44227 ) ( TRUCK-AT ?auto_44227 ?auto_44234 ) )
    :subtasks
    ( ( !DRIVE ?auto_44227 ?auto_44234 ?auto_44228 )
      ( MAKE-ON ?auto_44225 ?auto_44226 )
      ( MAKE-ON-VERIFY ?auto_44225 ?auto_44226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44248 - SURFACE
      ?auto_44249 - SURFACE
    )
    :vars
    (
      ?auto_44253 - HOIST
      ?auto_44254 - PLACE
      ?auto_44251 - PLACE
      ?auto_44252 - HOIST
      ?auto_44266 - SURFACE
      ?auto_44257 - SURFACE
      ?auto_44268 - PLACE
      ?auto_44255 - HOIST
      ?auto_44259 - SURFACE
      ?auto_44264 - SURFACE
      ?auto_44261 - PLACE
      ?auto_44260 - HOIST
      ?auto_44269 - SURFACE
      ?auto_44267 - SURFACE
      ?auto_44250 - PLACE
      ?auto_44270 - HOIST
      ?auto_44263 - SURFACE
      ?auto_44265 - SURFACE
      ?auto_44256 - SURFACE
      ?auto_44262 - SURFACE
      ?auto_44258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44253 ?auto_44254 ) ( IS-CRATE ?auto_44248 ) ( not ( = ?auto_44248 ?auto_44249 ) ) ( not ( = ?auto_44251 ?auto_44254 ) ) ( HOIST-AT ?auto_44252 ?auto_44251 ) ( not ( = ?auto_44253 ?auto_44252 ) ) ( AVAILABLE ?auto_44252 ) ( SURFACE-AT ?auto_44248 ?auto_44251 ) ( ON ?auto_44248 ?auto_44266 ) ( CLEAR ?auto_44248 ) ( not ( = ?auto_44248 ?auto_44266 ) ) ( not ( = ?auto_44249 ?auto_44266 ) ) ( IS-CRATE ?auto_44249 ) ( not ( = ?auto_44248 ?auto_44257 ) ) ( not ( = ?auto_44249 ?auto_44257 ) ) ( not ( = ?auto_44266 ?auto_44257 ) ) ( not ( = ?auto_44268 ?auto_44254 ) ) ( not ( = ?auto_44251 ?auto_44268 ) ) ( HOIST-AT ?auto_44255 ?auto_44268 ) ( not ( = ?auto_44253 ?auto_44255 ) ) ( not ( = ?auto_44252 ?auto_44255 ) ) ( AVAILABLE ?auto_44255 ) ( SURFACE-AT ?auto_44249 ?auto_44268 ) ( ON ?auto_44249 ?auto_44259 ) ( CLEAR ?auto_44249 ) ( not ( = ?auto_44248 ?auto_44259 ) ) ( not ( = ?auto_44249 ?auto_44259 ) ) ( not ( = ?auto_44266 ?auto_44259 ) ) ( not ( = ?auto_44257 ?auto_44259 ) ) ( IS-CRATE ?auto_44257 ) ( not ( = ?auto_44248 ?auto_44264 ) ) ( not ( = ?auto_44249 ?auto_44264 ) ) ( not ( = ?auto_44266 ?auto_44264 ) ) ( not ( = ?auto_44257 ?auto_44264 ) ) ( not ( = ?auto_44259 ?auto_44264 ) ) ( not ( = ?auto_44261 ?auto_44254 ) ) ( not ( = ?auto_44251 ?auto_44261 ) ) ( not ( = ?auto_44268 ?auto_44261 ) ) ( HOIST-AT ?auto_44260 ?auto_44261 ) ( not ( = ?auto_44253 ?auto_44260 ) ) ( not ( = ?auto_44252 ?auto_44260 ) ) ( not ( = ?auto_44255 ?auto_44260 ) ) ( SURFACE-AT ?auto_44257 ?auto_44261 ) ( ON ?auto_44257 ?auto_44269 ) ( CLEAR ?auto_44257 ) ( not ( = ?auto_44248 ?auto_44269 ) ) ( not ( = ?auto_44249 ?auto_44269 ) ) ( not ( = ?auto_44266 ?auto_44269 ) ) ( not ( = ?auto_44257 ?auto_44269 ) ) ( not ( = ?auto_44259 ?auto_44269 ) ) ( not ( = ?auto_44264 ?auto_44269 ) ) ( IS-CRATE ?auto_44264 ) ( not ( = ?auto_44248 ?auto_44267 ) ) ( not ( = ?auto_44249 ?auto_44267 ) ) ( not ( = ?auto_44266 ?auto_44267 ) ) ( not ( = ?auto_44257 ?auto_44267 ) ) ( not ( = ?auto_44259 ?auto_44267 ) ) ( not ( = ?auto_44264 ?auto_44267 ) ) ( not ( = ?auto_44269 ?auto_44267 ) ) ( not ( = ?auto_44250 ?auto_44254 ) ) ( not ( = ?auto_44251 ?auto_44250 ) ) ( not ( = ?auto_44268 ?auto_44250 ) ) ( not ( = ?auto_44261 ?auto_44250 ) ) ( HOIST-AT ?auto_44270 ?auto_44250 ) ( not ( = ?auto_44253 ?auto_44270 ) ) ( not ( = ?auto_44252 ?auto_44270 ) ) ( not ( = ?auto_44255 ?auto_44270 ) ) ( not ( = ?auto_44260 ?auto_44270 ) ) ( SURFACE-AT ?auto_44264 ?auto_44250 ) ( ON ?auto_44264 ?auto_44263 ) ( CLEAR ?auto_44264 ) ( not ( = ?auto_44248 ?auto_44263 ) ) ( not ( = ?auto_44249 ?auto_44263 ) ) ( not ( = ?auto_44266 ?auto_44263 ) ) ( not ( = ?auto_44257 ?auto_44263 ) ) ( not ( = ?auto_44259 ?auto_44263 ) ) ( not ( = ?auto_44264 ?auto_44263 ) ) ( not ( = ?auto_44269 ?auto_44263 ) ) ( not ( = ?auto_44267 ?auto_44263 ) ) ( IS-CRATE ?auto_44267 ) ( not ( = ?auto_44248 ?auto_44265 ) ) ( not ( = ?auto_44249 ?auto_44265 ) ) ( not ( = ?auto_44266 ?auto_44265 ) ) ( not ( = ?auto_44257 ?auto_44265 ) ) ( not ( = ?auto_44259 ?auto_44265 ) ) ( not ( = ?auto_44264 ?auto_44265 ) ) ( not ( = ?auto_44269 ?auto_44265 ) ) ( not ( = ?auto_44267 ?auto_44265 ) ) ( not ( = ?auto_44263 ?auto_44265 ) ) ( AVAILABLE ?auto_44270 ) ( SURFACE-AT ?auto_44267 ?auto_44250 ) ( ON ?auto_44267 ?auto_44256 ) ( CLEAR ?auto_44267 ) ( not ( = ?auto_44248 ?auto_44256 ) ) ( not ( = ?auto_44249 ?auto_44256 ) ) ( not ( = ?auto_44266 ?auto_44256 ) ) ( not ( = ?auto_44257 ?auto_44256 ) ) ( not ( = ?auto_44259 ?auto_44256 ) ) ( not ( = ?auto_44264 ?auto_44256 ) ) ( not ( = ?auto_44269 ?auto_44256 ) ) ( not ( = ?auto_44267 ?auto_44256 ) ) ( not ( = ?auto_44263 ?auto_44256 ) ) ( not ( = ?auto_44265 ?auto_44256 ) ) ( SURFACE-AT ?auto_44262 ?auto_44254 ) ( CLEAR ?auto_44262 ) ( IS-CRATE ?auto_44265 ) ( not ( = ?auto_44248 ?auto_44262 ) ) ( not ( = ?auto_44249 ?auto_44262 ) ) ( not ( = ?auto_44266 ?auto_44262 ) ) ( not ( = ?auto_44257 ?auto_44262 ) ) ( not ( = ?auto_44259 ?auto_44262 ) ) ( not ( = ?auto_44264 ?auto_44262 ) ) ( not ( = ?auto_44269 ?auto_44262 ) ) ( not ( = ?auto_44267 ?auto_44262 ) ) ( not ( = ?auto_44263 ?auto_44262 ) ) ( not ( = ?auto_44265 ?auto_44262 ) ) ( not ( = ?auto_44256 ?auto_44262 ) ) ( AVAILABLE ?auto_44253 ) ( TRUCK-AT ?auto_44258 ?auto_44261 ) ( LIFTING ?auto_44260 ?auto_44265 ) )
    :subtasks
    ( ( !LOAD ?auto_44260 ?auto_44265 ?auto_44258 ?auto_44261 )
      ( MAKE-ON ?auto_44248 ?auto_44249 )
      ( MAKE-ON-VERIFY ?auto_44248 ?auto_44249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44271 - SURFACE
      ?auto_44272 - SURFACE
    )
    :vars
    (
      ?auto_44283 - HOIST
      ?auto_44284 - PLACE
      ?auto_44276 - PLACE
      ?auto_44275 - HOIST
      ?auto_44287 - SURFACE
      ?auto_44274 - SURFACE
      ?auto_44292 - PLACE
      ?auto_44273 - HOIST
      ?auto_44277 - SURFACE
      ?auto_44291 - SURFACE
      ?auto_44286 - PLACE
      ?auto_44293 - HOIST
      ?auto_44281 - SURFACE
      ?auto_44282 - SURFACE
      ?auto_44280 - PLACE
      ?auto_44288 - HOIST
      ?auto_44289 - SURFACE
      ?auto_44278 - SURFACE
      ?auto_44290 - SURFACE
      ?auto_44285 - SURFACE
      ?auto_44279 - TRUCK
      ?auto_44294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44283 ?auto_44284 ) ( IS-CRATE ?auto_44271 ) ( not ( = ?auto_44271 ?auto_44272 ) ) ( not ( = ?auto_44276 ?auto_44284 ) ) ( HOIST-AT ?auto_44275 ?auto_44276 ) ( not ( = ?auto_44283 ?auto_44275 ) ) ( AVAILABLE ?auto_44275 ) ( SURFACE-AT ?auto_44271 ?auto_44276 ) ( ON ?auto_44271 ?auto_44287 ) ( CLEAR ?auto_44271 ) ( not ( = ?auto_44271 ?auto_44287 ) ) ( not ( = ?auto_44272 ?auto_44287 ) ) ( IS-CRATE ?auto_44272 ) ( not ( = ?auto_44271 ?auto_44274 ) ) ( not ( = ?auto_44272 ?auto_44274 ) ) ( not ( = ?auto_44287 ?auto_44274 ) ) ( not ( = ?auto_44292 ?auto_44284 ) ) ( not ( = ?auto_44276 ?auto_44292 ) ) ( HOIST-AT ?auto_44273 ?auto_44292 ) ( not ( = ?auto_44283 ?auto_44273 ) ) ( not ( = ?auto_44275 ?auto_44273 ) ) ( AVAILABLE ?auto_44273 ) ( SURFACE-AT ?auto_44272 ?auto_44292 ) ( ON ?auto_44272 ?auto_44277 ) ( CLEAR ?auto_44272 ) ( not ( = ?auto_44271 ?auto_44277 ) ) ( not ( = ?auto_44272 ?auto_44277 ) ) ( not ( = ?auto_44287 ?auto_44277 ) ) ( not ( = ?auto_44274 ?auto_44277 ) ) ( IS-CRATE ?auto_44274 ) ( not ( = ?auto_44271 ?auto_44291 ) ) ( not ( = ?auto_44272 ?auto_44291 ) ) ( not ( = ?auto_44287 ?auto_44291 ) ) ( not ( = ?auto_44274 ?auto_44291 ) ) ( not ( = ?auto_44277 ?auto_44291 ) ) ( not ( = ?auto_44286 ?auto_44284 ) ) ( not ( = ?auto_44276 ?auto_44286 ) ) ( not ( = ?auto_44292 ?auto_44286 ) ) ( HOIST-AT ?auto_44293 ?auto_44286 ) ( not ( = ?auto_44283 ?auto_44293 ) ) ( not ( = ?auto_44275 ?auto_44293 ) ) ( not ( = ?auto_44273 ?auto_44293 ) ) ( SURFACE-AT ?auto_44274 ?auto_44286 ) ( ON ?auto_44274 ?auto_44281 ) ( CLEAR ?auto_44274 ) ( not ( = ?auto_44271 ?auto_44281 ) ) ( not ( = ?auto_44272 ?auto_44281 ) ) ( not ( = ?auto_44287 ?auto_44281 ) ) ( not ( = ?auto_44274 ?auto_44281 ) ) ( not ( = ?auto_44277 ?auto_44281 ) ) ( not ( = ?auto_44291 ?auto_44281 ) ) ( IS-CRATE ?auto_44291 ) ( not ( = ?auto_44271 ?auto_44282 ) ) ( not ( = ?auto_44272 ?auto_44282 ) ) ( not ( = ?auto_44287 ?auto_44282 ) ) ( not ( = ?auto_44274 ?auto_44282 ) ) ( not ( = ?auto_44277 ?auto_44282 ) ) ( not ( = ?auto_44291 ?auto_44282 ) ) ( not ( = ?auto_44281 ?auto_44282 ) ) ( not ( = ?auto_44280 ?auto_44284 ) ) ( not ( = ?auto_44276 ?auto_44280 ) ) ( not ( = ?auto_44292 ?auto_44280 ) ) ( not ( = ?auto_44286 ?auto_44280 ) ) ( HOIST-AT ?auto_44288 ?auto_44280 ) ( not ( = ?auto_44283 ?auto_44288 ) ) ( not ( = ?auto_44275 ?auto_44288 ) ) ( not ( = ?auto_44273 ?auto_44288 ) ) ( not ( = ?auto_44293 ?auto_44288 ) ) ( SURFACE-AT ?auto_44291 ?auto_44280 ) ( ON ?auto_44291 ?auto_44289 ) ( CLEAR ?auto_44291 ) ( not ( = ?auto_44271 ?auto_44289 ) ) ( not ( = ?auto_44272 ?auto_44289 ) ) ( not ( = ?auto_44287 ?auto_44289 ) ) ( not ( = ?auto_44274 ?auto_44289 ) ) ( not ( = ?auto_44277 ?auto_44289 ) ) ( not ( = ?auto_44291 ?auto_44289 ) ) ( not ( = ?auto_44281 ?auto_44289 ) ) ( not ( = ?auto_44282 ?auto_44289 ) ) ( IS-CRATE ?auto_44282 ) ( not ( = ?auto_44271 ?auto_44278 ) ) ( not ( = ?auto_44272 ?auto_44278 ) ) ( not ( = ?auto_44287 ?auto_44278 ) ) ( not ( = ?auto_44274 ?auto_44278 ) ) ( not ( = ?auto_44277 ?auto_44278 ) ) ( not ( = ?auto_44291 ?auto_44278 ) ) ( not ( = ?auto_44281 ?auto_44278 ) ) ( not ( = ?auto_44282 ?auto_44278 ) ) ( not ( = ?auto_44289 ?auto_44278 ) ) ( AVAILABLE ?auto_44288 ) ( SURFACE-AT ?auto_44282 ?auto_44280 ) ( ON ?auto_44282 ?auto_44290 ) ( CLEAR ?auto_44282 ) ( not ( = ?auto_44271 ?auto_44290 ) ) ( not ( = ?auto_44272 ?auto_44290 ) ) ( not ( = ?auto_44287 ?auto_44290 ) ) ( not ( = ?auto_44274 ?auto_44290 ) ) ( not ( = ?auto_44277 ?auto_44290 ) ) ( not ( = ?auto_44291 ?auto_44290 ) ) ( not ( = ?auto_44281 ?auto_44290 ) ) ( not ( = ?auto_44282 ?auto_44290 ) ) ( not ( = ?auto_44289 ?auto_44290 ) ) ( not ( = ?auto_44278 ?auto_44290 ) ) ( SURFACE-AT ?auto_44285 ?auto_44284 ) ( CLEAR ?auto_44285 ) ( IS-CRATE ?auto_44278 ) ( not ( = ?auto_44271 ?auto_44285 ) ) ( not ( = ?auto_44272 ?auto_44285 ) ) ( not ( = ?auto_44287 ?auto_44285 ) ) ( not ( = ?auto_44274 ?auto_44285 ) ) ( not ( = ?auto_44277 ?auto_44285 ) ) ( not ( = ?auto_44291 ?auto_44285 ) ) ( not ( = ?auto_44281 ?auto_44285 ) ) ( not ( = ?auto_44282 ?auto_44285 ) ) ( not ( = ?auto_44289 ?auto_44285 ) ) ( not ( = ?auto_44278 ?auto_44285 ) ) ( not ( = ?auto_44290 ?auto_44285 ) ) ( AVAILABLE ?auto_44283 ) ( TRUCK-AT ?auto_44279 ?auto_44286 ) ( AVAILABLE ?auto_44293 ) ( SURFACE-AT ?auto_44278 ?auto_44286 ) ( ON ?auto_44278 ?auto_44294 ) ( CLEAR ?auto_44278 ) ( not ( = ?auto_44271 ?auto_44294 ) ) ( not ( = ?auto_44272 ?auto_44294 ) ) ( not ( = ?auto_44287 ?auto_44294 ) ) ( not ( = ?auto_44274 ?auto_44294 ) ) ( not ( = ?auto_44277 ?auto_44294 ) ) ( not ( = ?auto_44291 ?auto_44294 ) ) ( not ( = ?auto_44281 ?auto_44294 ) ) ( not ( = ?auto_44282 ?auto_44294 ) ) ( not ( = ?auto_44289 ?auto_44294 ) ) ( not ( = ?auto_44278 ?auto_44294 ) ) ( not ( = ?auto_44290 ?auto_44294 ) ) ( not ( = ?auto_44285 ?auto_44294 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44293 ?auto_44278 ?auto_44294 ?auto_44286 )
      ( MAKE-ON ?auto_44271 ?auto_44272 )
      ( MAKE-ON-VERIFY ?auto_44271 ?auto_44272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44295 - SURFACE
      ?auto_44296 - SURFACE
    )
    :vars
    (
      ?auto_44318 - HOIST
      ?auto_44312 - PLACE
      ?auto_44310 - PLACE
      ?auto_44311 - HOIST
      ?auto_44306 - SURFACE
      ?auto_44309 - SURFACE
      ?auto_44303 - PLACE
      ?auto_44301 - HOIST
      ?auto_44298 - SURFACE
      ?auto_44305 - SURFACE
      ?auto_44300 - PLACE
      ?auto_44314 - HOIST
      ?auto_44316 - SURFACE
      ?auto_44317 - SURFACE
      ?auto_44299 - PLACE
      ?auto_44302 - HOIST
      ?auto_44297 - SURFACE
      ?auto_44315 - SURFACE
      ?auto_44304 - SURFACE
      ?auto_44313 - SURFACE
      ?auto_44308 - SURFACE
      ?auto_44307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44318 ?auto_44312 ) ( IS-CRATE ?auto_44295 ) ( not ( = ?auto_44295 ?auto_44296 ) ) ( not ( = ?auto_44310 ?auto_44312 ) ) ( HOIST-AT ?auto_44311 ?auto_44310 ) ( not ( = ?auto_44318 ?auto_44311 ) ) ( AVAILABLE ?auto_44311 ) ( SURFACE-AT ?auto_44295 ?auto_44310 ) ( ON ?auto_44295 ?auto_44306 ) ( CLEAR ?auto_44295 ) ( not ( = ?auto_44295 ?auto_44306 ) ) ( not ( = ?auto_44296 ?auto_44306 ) ) ( IS-CRATE ?auto_44296 ) ( not ( = ?auto_44295 ?auto_44309 ) ) ( not ( = ?auto_44296 ?auto_44309 ) ) ( not ( = ?auto_44306 ?auto_44309 ) ) ( not ( = ?auto_44303 ?auto_44312 ) ) ( not ( = ?auto_44310 ?auto_44303 ) ) ( HOIST-AT ?auto_44301 ?auto_44303 ) ( not ( = ?auto_44318 ?auto_44301 ) ) ( not ( = ?auto_44311 ?auto_44301 ) ) ( AVAILABLE ?auto_44301 ) ( SURFACE-AT ?auto_44296 ?auto_44303 ) ( ON ?auto_44296 ?auto_44298 ) ( CLEAR ?auto_44296 ) ( not ( = ?auto_44295 ?auto_44298 ) ) ( not ( = ?auto_44296 ?auto_44298 ) ) ( not ( = ?auto_44306 ?auto_44298 ) ) ( not ( = ?auto_44309 ?auto_44298 ) ) ( IS-CRATE ?auto_44309 ) ( not ( = ?auto_44295 ?auto_44305 ) ) ( not ( = ?auto_44296 ?auto_44305 ) ) ( not ( = ?auto_44306 ?auto_44305 ) ) ( not ( = ?auto_44309 ?auto_44305 ) ) ( not ( = ?auto_44298 ?auto_44305 ) ) ( not ( = ?auto_44300 ?auto_44312 ) ) ( not ( = ?auto_44310 ?auto_44300 ) ) ( not ( = ?auto_44303 ?auto_44300 ) ) ( HOIST-AT ?auto_44314 ?auto_44300 ) ( not ( = ?auto_44318 ?auto_44314 ) ) ( not ( = ?auto_44311 ?auto_44314 ) ) ( not ( = ?auto_44301 ?auto_44314 ) ) ( SURFACE-AT ?auto_44309 ?auto_44300 ) ( ON ?auto_44309 ?auto_44316 ) ( CLEAR ?auto_44309 ) ( not ( = ?auto_44295 ?auto_44316 ) ) ( not ( = ?auto_44296 ?auto_44316 ) ) ( not ( = ?auto_44306 ?auto_44316 ) ) ( not ( = ?auto_44309 ?auto_44316 ) ) ( not ( = ?auto_44298 ?auto_44316 ) ) ( not ( = ?auto_44305 ?auto_44316 ) ) ( IS-CRATE ?auto_44305 ) ( not ( = ?auto_44295 ?auto_44317 ) ) ( not ( = ?auto_44296 ?auto_44317 ) ) ( not ( = ?auto_44306 ?auto_44317 ) ) ( not ( = ?auto_44309 ?auto_44317 ) ) ( not ( = ?auto_44298 ?auto_44317 ) ) ( not ( = ?auto_44305 ?auto_44317 ) ) ( not ( = ?auto_44316 ?auto_44317 ) ) ( not ( = ?auto_44299 ?auto_44312 ) ) ( not ( = ?auto_44310 ?auto_44299 ) ) ( not ( = ?auto_44303 ?auto_44299 ) ) ( not ( = ?auto_44300 ?auto_44299 ) ) ( HOIST-AT ?auto_44302 ?auto_44299 ) ( not ( = ?auto_44318 ?auto_44302 ) ) ( not ( = ?auto_44311 ?auto_44302 ) ) ( not ( = ?auto_44301 ?auto_44302 ) ) ( not ( = ?auto_44314 ?auto_44302 ) ) ( SURFACE-AT ?auto_44305 ?auto_44299 ) ( ON ?auto_44305 ?auto_44297 ) ( CLEAR ?auto_44305 ) ( not ( = ?auto_44295 ?auto_44297 ) ) ( not ( = ?auto_44296 ?auto_44297 ) ) ( not ( = ?auto_44306 ?auto_44297 ) ) ( not ( = ?auto_44309 ?auto_44297 ) ) ( not ( = ?auto_44298 ?auto_44297 ) ) ( not ( = ?auto_44305 ?auto_44297 ) ) ( not ( = ?auto_44316 ?auto_44297 ) ) ( not ( = ?auto_44317 ?auto_44297 ) ) ( IS-CRATE ?auto_44317 ) ( not ( = ?auto_44295 ?auto_44315 ) ) ( not ( = ?auto_44296 ?auto_44315 ) ) ( not ( = ?auto_44306 ?auto_44315 ) ) ( not ( = ?auto_44309 ?auto_44315 ) ) ( not ( = ?auto_44298 ?auto_44315 ) ) ( not ( = ?auto_44305 ?auto_44315 ) ) ( not ( = ?auto_44316 ?auto_44315 ) ) ( not ( = ?auto_44317 ?auto_44315 ) ) ( not ( = ?auto_44297 ?auto_44315 ) ) ( AVAILABLE ?auto_44302 ) ( SURFACE-AT ?auto_44317 ?auto_44299 ) ( ON ?auto_44317 ?auto_44304 ) ( CLEAR ?auto_44317 ) ( not ( = ?auto_44295 ?auto_44304 ) ) ( not ( = ?auto_44296 ?auto_44304 ) ) ( not ( = ?auto_44306 ?auto_44304 ) ) ( not ( = ?auto_44309 ?auto_44304 ) ) ( not ( = ?auto_44298 ?auto_44304 ) ) ( not ( = ?auto_44305 ?auto_44304 ) ) ( not ( = ?auto_44316 ?auto_44304 ) ) ( not ( = ?auto_44317 ?auto_44304 ) ) ( not ( = ?auto_44297 ?auto_44304 ) ) ( not ( = ?auto_44315 ?auto_44304 ) ) ( SURFACE-AT ?auto_44313 ?auto_44312 ) ( CLEAR ?auto_44313 ) ( IS-CRATE ?auto_44315 ) ( not ( = ?auto_44295 ?auto_44313 ) ) ( not ( = ?auto_44296 ?auto_44313 ) ) ( not ( = ?auto_44306 ?auto_44313 ) ) ( not ( = ?auto_44309 ?auto_44313 ) ) ( not ( = ?auto_44298 ?auto_44313 ) ) ( not ( = ?auto_44305 ?auto_44313 ) ) ( not ( = ?auto_44316 ?auto_44313 ) ) ( not ( = ?auto_44317 ?auto_44313 ) ) ( not ( = ?auto_44297 ?auto_44313 ) ) ( not ( = ?auto_44315 ?auto_44313 ) ) ( not ( = ?auto_44304 ?auto_44313 ) ) ( AVAILABLE ?auto_44318 ) ( AVAILABLE ?auto_44314 ) ( SURFACE-AT ?auto_44315 ?auto_44300 ) ( ON ?auto_44315 ?auto_44308 ) ( CLEAR ?auto_44315 ) ( not ( = ?auto_44295 ?auto_44308 ) ) ( not ( = ?auto_44296 ?auto_44308 ) ) ( not ( = ?auto_44306 ?auto_44308 ) ) ( not ( = ?auto_44309 ?auto_44308 ) ) ( not ( = ?auto_44298 ?auto_44308 ) ) ( not ( = ?auto_44305 ?auto_44308 ) ) ( not ( = ?auto_44316 ?auto_44308 ) ) ( not ( = ?auto_44317 ?auto_44308 ) ) ( not ( = ?auto_44297 ?auto_44308 ) ) ( not ( = ?auto_44315 ?auto_44308 ) ) ( not ( = ?auto_44304 ?auto_44308 ) ) ( not ( = ?auto_44313 ?auto_44308 ) ) ( TRUCK-AT ?auto_44307 ?auto_44312 ) )
    :subtasks
    ( ( !DRIVE ?auto_44307 ?auto_44312 ?auto_44300 )
      ( MAKE-ON ?auto_44295 ?auto_44296 )
      ( MAKE-ON-VERIFY ?auto_44295 ?auto_44296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44321 - SURFACE
      ?auto_44322 - SURFACE
    )
    :vars
    (
      ?auto_44323 - HOIST
      ?auto_44324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44323 ?auto_44324 ) ( SURFACE-AT ?auto_44322 ?auto_44324 ) ( CLEAR ?auto_44322 ) ( LIFTING ?auto_44323 ?auto_44321 ) ( IS-CRATE ?auto_44321 ) ( not ( = ?auto_44321 ?auto_44322 ) ) )
    :subtasks
    ( ( !DROP ?auto_44323 ?auto_44321 ?auto_44322 ?auto_44324 )
      ( MAKE-ON-VERIFY ?auto_44321 ?auto_44322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44325 - SURFACE
      ?auto_44326 - SURFACE
    )
    :vars
    (
      ?auto_44328 - HOIST
      ?auto_44327 - PLACE
      ?auto_44329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44328 ?auto_44327 ) ( SURFACE-AT ?auto_44326 ?auto_44327 ) ( CLEAR ?auto_44326 ) ( IS-CRATE ?auto_44325 ) ( not ( = ?auto_44325 ?auto_44326 ) ) ( TRUCK-AT ?auto_44329 ?auto_44327 ) ( AVAILABLE ?auto_44328 ) ( IN ?auto_44325 ?auto_44329 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44328 ?auto_44325 ?auto_44329 ?auto_44327 )
      ( MAKE-ON ?auto_44325 ?auto_44326 )
      ( MAKE-ON-VERIFY ?auto_44325 ?auto_44326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44330 - SURFACE
      ?auto_44331 - SURFACE
    )
    :vars
    (
      ?auto_44332 - HOIST
      ?auto_44333 - PLACE
      ?auto_44334 - TRUCK
      ?auto_44335 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44332 ?auto_44333 ) ( SURFACE-AT ?auto_44331 ?auto_44333 ) ( CLEAR ?auto_44331 ) ( IS-CRATE ?auto_44330 ) ( not ( = ?auto_44330 ?auto_44331 ) ) ( AVAILABLE ?auto_44332 ) ( IN ?auto_44330 ?auto_44334 ) ( TRUCK-AT ?auto_44334 ?auto_44335 ) ( not ( = ?auto_44335 ?auto_44333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44334 ?auto_44335 ?auto_44333 )
      ( MAKE-ON ?auto_44330 ?auto_44331 )
      ( MAKE-ON-VERIFY ?auto_44330 ?auto_44331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44336 - SURFACE
      ?auto_44337 - SURFACE
    )
    :vars
    (
      ?auto_44339 - HOIST
      ?auto_44340 - PLACE
      ?auto_44338 - TRUCK
      ?auto_44341 - PLACE
      ?auto_44342 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44339 ?auto_44340 ) ( SURFACE-AT ?auto_44337 ?auto_44340 ) ( CLEAR ?auto_44337 ) ( IS-CRATE ?auto_44336 ) ( not ( = ?auto_44336 ?auto_44337 ) ) ( AVAILABLE ?auto_44339 ) ( TRUCK-AT ?auto_44338 ?auto_44341 ) ( not ( = ?auto_44341 ?auto_44340 ) ) ( HOIST-AT ?auto_44342 ?auto_44341 ) ( LIFTING ?auto_44342 ?auto_44336 ) ( not ( = ?auto_44339 ?auto_44342 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44342 ?auto_44336 ?auto_44338 ?auto_44341 )
      ( MAKE-ON ?auto_44336 ?auto_44337 )
      ( MAKE-ON-VERIFY ?auto_44336 ?auto_44337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44343 - SURFACE
      ?auto_44344 - SURFACE
    )
    :vars
    (
      ?auto_44348 - HOIST
      ?auto_44346 - PLACE
      ?auto_44347 - TRUCK
      ?auto_44345 - PLACE
      ?auto_44349 - HOIST
      ?auto_44350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44348 ?auto_44346 ) ( SURFACE-AT ?auto_44344 ?auto_44346 ) ( CLEAR ?auto_44344 ) ( IS-CRATE ?auto_44343 ) ( not ( = ?auto_44343 ?auto_44344 ) ) ( AVAILABLE ?auto_44348 ) ( TRUCK-AT ?auto_44347 ?auto_44345 ) ( not ( = ?auto_44345 ?auto_44346 ) ) ( HOIST-AT ?auto_44349 ?auto_44345 ) ( not ( = ?auto_44348 ?auto_44349 ) ) ( AVAILABLE ?auto_44349 ) ( SURFACE-AT ?auto_44343 ?auto_44345 ) ( ON ?auto_44343 ?auto_44350 ) ( CLEAR ?auto_44343 ) ( not ( = ?auto_44343 ?auto_44350 ) ) ( not ( = ?auto_44344 ?auto_44350 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44349 ?auto_44343 ?auto_44350 ?auto_44345 )
      ( MAKE-ON ?auto_44343 ?auto_44344 )
      ( MAKE-ON-VERIFY ?auto_44343 ?auto_44344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44351 - SURFACE
      ?auto_44352 - SURFACE
    )
    :vars
    (
      ?auto_44357 - HOIST
      ?auto_44358 - PLACE
      ?auto_44354 - PLACE
      ?auto_44353 - HOIST
      ?auto_44355 - SURFACE
      ?auto_44356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44357 ?auto_44358 ) ( SURFACE-AT ?auto_44352 ?auto_44358 ) ( CLEAR ?auto_44352 ) ( IS-CRATE ?auto_44351 ) ( not ( = ?auto_44351 ?auto_44352 ) ) ( AVAILABLE ?auto_44357 ) ( not ( = ?auto_44354 ?auto_44358 ) ) ( HOIST-AT ?auto_44353 ?auto_44354 ) ( not ( = ?auto_44357 ?auto_44353 ) ) ( AVAILABLE ?auto_44353 ) ( SURFACE-AT ?auto_44351 ?auto_44354 ) ( ON ?auto_44351 ?auto_44355 ) ( CLEAR ?auto_44351 ) ( not ( = ?auto_44351 ?auto_44355 ) ) ( not ( = ?auto_44352 ?auto_44355 ) ) ( TRUCK-AT ?auto_44356 ?auto_44358 ) )
    :subtasks
    ( ( !DRIVE ?auto_44356 ?auto_44358 ?auto_44354 )
      ( MAKE-ON ?auto_44351 ?auto_44352 )
      ( MAKE-ON-VERIFY ?auto_44351 ?auto_44352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44359 - SURFACE
      ?auto_44360 - SURFACE
    )
    :vars
    (
      ?auto_44361 - HOIST
      ?auto_44364 - PLACE
      ?auto_44363 - PLACE
      ?auto_44362 - HOIST
      ?auto_44365 - SURFACE
      ?auto_44366 - TRUCK
      ?auto_44367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44361 ?auto_44364 ) ( IS-CRATE ?auto_44359 ) ( not ( = ?auto_44359 ?auto_44360 ) ) ( not ( = ?auto_44363 ?auto_44364 ) ) ( HOIST-AT ?auto_44362 ?auto_44363 ) ( not ( = ?auto_44361 ?auto_44362 ) ) ( AVAILABLE ?auto_44362 ) ( SURFACE-AT ?auto_44359 ?auto_44363 ) ( ON ?auto_44359 ?auto_44365 ) ( CLEAR ?auto_44359 ) ( not ( = ?auto_44359 ?auto_44365 ) ) ( not ( = ?auto_44360 ?auto_44365 ) ) ( TRUCK-AT ?auto_44366 ?auto_44364 ) ( SURFACE-AT ?auto_44367 ?auto_44364 ) ( CLEAR ?auto_44367 ) ( LIFTING ?auto_44361 ?auto_44360 ) ( IS-CRATE ?auto_44360 ) ( not ( = ?auto_44359 ?auto_44367 ) ) ( not ( = ?auto_44360 ?auto_44367 ) ) ( not ( = ?auto_44365 ?auto_44367 ) ) )
    :subtasks
    ( ( !DROP ?auto_44361 ?auto_44360 ?auto_44367 ?auto_44364 )
      ( MAKE-ON ?auto_44359 ?auto_44360 )
      ( MAKE-ON-VERIFY ?auto_44359 ?auto_44360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44368 - SURFACE
      ?auto_44369 - SURFACE
    )
    :vars
    (
      ?auto_44376 - HOIST
      ?auto_44375 - PLACE
      ?auto_44372 - PLACE
      ?auto_44373 - HOIST
      ?auto_44370 - SURFACE
      ?auto_44374 - TRUCK
      ?auto_44371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44376 ?auto_44375 ) ( IS-CRATE ?auto_44368 ) ( not ( = ?auto_44368 ?auto_44369 ) ) ( not ( = ?auto_44372 ?auto_44375 ) ) ( HOIST-AT ?auto_44373 ?auto_44372 ) ( not ( = ?auto_44376 ?auto_44373 ) ) ( AVAILABLE ?auto_44373 ) ( SURFACE-AT ?auto_44368 ?auto_44372 ) ( ON ?auto_44368 ?auto_44370 ) ( CLEAR ?auto_44368 ) ( not ( = ?auto_44368 ?auto_44370 ) ) ( not ( = ?auto_44369 ?auto_44370 ) ) ( TRUCK-AT ?auto_44374 ?auto_44375 ) ( SURFACE-AT ?auto_44371 ?auto_44375 ) ( CLEAR ?auto_44371 ) ( IS-CRATE ?auto_44369 ) ( not ( = ?auto_44368 ?auto_44371 ) ) ( not ( = ?auto_44369 ?auto_44371 ) ) ( not ( = ?auto_44370 ?auto_44371 ) ) ( AVAILABLE ?auto_44376 ) ( IN ?auto_44369 ?auto_44374 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44376 ?auto_44369 ?auto_44374 ?auto_44375 )
      ( MAKE-ON ?auto_44368 ?auto_44369 )
      ( MAKE-ON-VERIFY ?auto_44368 ?auto_44369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44377 - SURFACE
      ?auto_44378 - SURFACE
    )
    :vars
    (
      ?auto_44381 - HOIST
      ?auto_44385 - PLACE
      ?auto_44380 - PLACE
      ?auto_44382 - HOIST
      ?auto_44379 - SURFACE
      ?auto_44384 - SURFACE
      ?auto_44383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44381 ?auto_44385 ) ( IS-CRATE ?auto_44377 ) ( not ( = ?auto_44377 ?auto_44378 ) ) ( not ( = ?auto_44380 ?auto_44385 ) ) ( HOIST-AT ?auto_44382 ?auto_44380 ) ( not ( = ?auto_44381 ?auto_44382 ) ) ( AVAILABLE ?auto_44382 ) ( SURFACE-AT ?auto_44377 ?auto_44380 ) ( ON ?auto_44377 ?auto_44379 ) ( CLEAR ?auto_44377 ) ( not ( = ?auto_44377 ?auto_44379 ) ) ( not ( = ?auto_44378 ?auto_44379 ) ) ( SURFACE-AT ?auto_44384 ?auto_44385 ) ( CLEAR ?auto_44384 ) ( IS-CRATE ?auto_44378 ) ( not ( = ?auto_44377 ?auto_44384 ) ) ( not ( = ?auto_44378 ?auto_44384 ) ) ( not ( = ?auto_44379 ?auto_44384 ) ) ( AVAILABLE ?auto_44381 ) ( IN ?auto_44378 ?auto_44383 ) ( TRUCK-AT ?auto_44383 ?auto_44380 ) )
    :subtasks
    ( ( !DRIVE ?auto_44383 ?auto_44380 ?auto_44385 )
      ( MAKE-ON ?auto_44377 ?auto_44378 )
      ( MAKE-ON-VERIFY ?auto_44377 ?auto_44378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44386 - SURFACE
      ?auto_44387 - SURFACE
    )
    :vars
    (
      ?auto_44389 - HOIST
      ?auto_44392 - PLACE
      ?auto_44394 - PLACE
      ?auto_44388 - HOIST
      ?auto_44390 - SURFACE
      ?auto_44391 - SURFACE
      ?auto_44393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44389 ?auto_44392 ) ( IS-CRATE ?auto_44386 ) ( not ( = ?auto_44386 ?auto_44387 ) ) ( not ( = ?auto_44394 ?auto_44392 ) ) ( HOIST-AT ?auto_44388 ?auto_44394 ) ( not ( = ?auto_44389 ?auto_44388 ) ) ( SURFACE-AT ?auto_44386 ?auto_44394 ) ( ON ?auto_44386 ?auto_44390 ) ( CLEAR ?auto_44386 ) ( not ( = ?auto_44386 ?auto_44390 ) ) ( not ( = ?auto_44387 ?auto_44390 ) ) ( SURFACE-AT ?auto_44391 ?auto_44392 ) ( CLEAR ?auto_44391 ) ( IS-CRATE ?auto_44387 ) ( not ( = ?auto_44386 ?auto_44391 ) ) ( not ( = ?auto_44387 ?auto_44391 ) ) ( not ( = ?auto_44390 ?auto_44391 ) ) ( AVAILABLE ?auto_44389 ) ( TRUCK-AT ?auto_44393 ?auto_44394 ) ( LIFTING ?auto_44388 ?auto_44387 ) )
    :subtasks
    ( ( !LOAD ?auto_44388 ?auto_44387 ?auto_44393 ?auto_44394 )
      ( MAKE-ON ?auto_44386 ?auto_44387 )
      ( MAKE-ON-VERIFY ?auto_44386 ?auto_44387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44395 - SURFACE
      ?auto_44396 - SURFACE
    )
    :vars
    (
      ?auto_44403 - HOIST
      ?auto_44397 - PLACE
      ?auto_44399 - PLACE
      ?auto_44398 - HOIST
      ?auto_44400 - SURFACE
      ?auto_44402 - SURFACE
      ?auto_44401 - TRUCK
      ?auto_44404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44403 ?auto_44397 ) ( IS-CRATE ?auto_44395 ) ( not ( = ?auto_44395 ?auto_44396 ) ) ( not ( = ?auto_44399 ?auto_44397 ) ) ( HOIST-AT ?auto_44398 ?auto_44399 ) ( not ( = ?auto_44403 ?auto_44398 ) ) ( SURFACE-AT ?auto_44395 ?auto_44399 ) ( ON ?auto_44395 ?auto_44400 ) ( CLEAR ?auto_44395 ) ( not ( = ?auto_44395 ?auto_44400 ) ) ( not ( = ?auto_44396 ?auto_44400 ) ) ( SURFACE-AT ?auto_44402 ?auto_44397 ) ( CLEAR ?auto_44402 ) ( IS-CRATE ?auto_44396 ) ( not ( = ?auto_44395 ?auto_44402 ) ) ( not ( = ?auto_44396 ?auto_44402 ) ) ( not ( = ?auto_44400 ?auto_44402 ) ) ( AVAILABLE ?auto_44403 ) ( TRUCK-AT ?auto_44401 ?auto_44399 ) ( AVAILABLE ?auto_44398 ) ( SURFACE-AT ?auto_44396 ?auto_44399 ) ( ON ?auto_44396 ?auto_44404 ) ( CLEAR ?auto_44396 ) ( not ( = ?auto_44395 ?auto_44404 ) ) ( not ( = ?auto_44396 ?auto_44404 ) ) ( not ( = ?auto_44400 ?auto_44404 ) ) ( not ( = ?auto_44402 ?auto_44404 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44398 ?auto_44396 ?auto_44404 ?auto_44399 )
      ( MAKE-ON ?auto_44395 ?auto_44396 )
      ( MAKE-ON-VERIFY ?auto_44395 ?auto_44396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44405 - SURFACE
      ?auto_44406 - SURFACE
    )
    :vars
    (
      ?auto_44407 - HOIST
      ?auto_44413 - PLACE
      ?auto_44409 - PLACE
      ?auto_44412 - HOIST
      ?auto_44410 - SURFACE
      ?auto_44408 - SURFACE
      ?auto_44414 - SURFACE
      ?auto_44411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44407 ?auto_44413 ) ( IS-CRATE ?auto_44405 ) ( not ( = ?auto_44405 ?auto_44406 ) ) ( not ( = ?auto_44409 ?auto_44413 ) ) ( HOIST-AT ?auto_44412 ?auto_44409 ) ( not ( = ?auto_44407 ?auto_44412 ) ) ( SURFACE-AT ?auto_44405 ?auto_44409 ) ( ON ?auto_44405 ?auto_44410 ) ( CLEAR ?auto_44405 ) ( not ( = ?auto_44405 ?auto_44410 ) ) ( not ( = ?auto_44406 ?auto_44410 ) ) ( SURFACE-AT ?auto_44408 ?auto_44413 ) ( CLEAR ?auto_44408 ) ( IS-CRATE ?auto_44406 ) ( not ( = ?auto_44405 ?auto_44408 ) ) ( not ( = ?auto_44406 ?auto_44408 ) ) ( not ( = ?auto_44410 ?auto_44408 ) ) ( AVAILABLE ?auto_44407 ) ( AVAILABLE ?auto_44412 ) ( SURFACE-AT ?auto_44406 ?auto_44409 ) ( ON ?auto_44406 ?auto_44414 ) ( CLEAR ?auto_44406 ) ( not ( = ?auto_44405 ?auto_44414 ) ) ( not ( = ?auto_44406 ?auto_44414 ) ) ( not ( = ?auto_44410 ?auto_44414 ) ) ( not ( = ?auto_44408 ?auto_44414 ) ) ( TRUCK-AT ?auto_44411 ?auto_44413 ) )
    :subtasks
    ( ( !DRIVE ?auto_44411 ?auto_44413 ?auto_44409 )
      ( MAKE-ON ?auto_44405 ?auto_44406 )
      ( MAKE-ON-VERIFY ?auto_44405 ?auto_44406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44415 - SURFACE
      ?auto_44416 - SURFACE
    )
    :vars
    (
      ?auto_44418 - HOIST
      ?auto_44420 - PLACE
      ?auto_44421 - PLACE
      ?auto_44417 - HOIST
      ?auto_44419 - SURFACE
      ?auto_44423 - SURFACE
      ?auto_44422 - SURFACE
      ?auto_44424 - TRUCK
      ?auto_44425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44418 ?auto_44420 ) ( IS-CRATE ?auto_44415 ) ( not ( = ?auto_44415 ?auto_44416 ) ) ( not ( = ?auto_44421 ?auto_44420 ) ) ( HOIST-AT ?auto_44417 ?auto_44421 ) ( not ( = ?auto_44418 ?auto_44417 ) ) ( SURFACE-AT ?auto_44415 ?auto_44421 ) ( ON ?auto_44415 ?auto_44419 ) ( CLEAR ?auto_44415 ) ( not ( = ?auto_44415 ?auto_44419 ) ) ( not ( = ?auto_44416 ?auto_44419 ) ) ( IS-CRATE ?auto_44416 ) ( not ( = ?auto_44415 ?auto_44423 ) ) ( not ( = ?auto_44416 ?auto_44423 ) ) ( not ( = ?auto_44419 ?auto_44423 ) ) ( AVAILABLE ?auto_44417 ) ( SURFACE-AT ?auto_44416 ?auto_44421 ) ( ON ?auto_44416 ?auto_44422 ) ( CLEAR ?auto_44416 ) ( not ( = ?auto_44415 ?auto_44422 ) ) ( not ( = ?auto_44416 ?auto_44422 ) ) ( not ( = ?auto_44419 ?auto_44422 ) ) ( not ( = ?auto_44423 ?auto_44422 ) ) ( TRUCK-AT ?auto_44424 ?auto_44420 ) ( SURFACE-AT ?auto_44425 ?auto_44420 ) ( CLEAR ?auto_44425 ) ( LIFTING ?auto_44418 ?auto_44423 ) ( IS-CRATE ?auto_44423 ) ( not ( = ?auto_44415 ?auto_44425 ) ) ( not ( = ?auto_44416 ?auto_44425 ) ) ( not ( = ?auto_44419 ?auto_44425 ) ) ( not ( = ?auto_44423 ?auto_44425 ) ) ( not ( = ?auto_44422 ?auto_44425 ) ) )
    :subtasks
    ( ( !DROP ?auto_44418 ?auto_44423 ?auto_44425 ?auto_44420 )
      ( MAKE-ON ?auto_44415 ?auto_44416 )
      ( MAKE-ON-VERIFY ?auto_44415 ?auto_44416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44426 - SURFACE
      ?auto_44427 - SURFACE
    )
    :vars
    (
      ?auto_44431 - HOIST
      ?auto_44428 - PLACE
      ?auto_44434 - PLACE
      ?auto_44430 - HOIST
      ?auto_44432 - SURFACE
      ?auto_44429 - SURFACE
      ?auto_44433 - SURFACE
      ?auto_44436 - TRUCK
      ?auto_44435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44431 ?auto_44428 ) ( IS-CRATE ?auto_44426 ) ( not ( = ?auto_44426 ?auto_44427 ) ) ( not ( = ?auto_44434 ?auto_44428 ) ) ( HOIST-AT ?auto_44430 ?auto_44434 ) ( not ( = ?auto_44431 ?auto_44430 ) ) ( SURFACE-AT ?auto_44426 ?auto_44434 ) ( ON ?auto_44426 ?auto_44432 ) ( CLEAR ?auto_44426 ) ( not ( = ?auto_44426 ?auto_44432 ) ) ( not ( = ?auto_44427 ?auto_44432 ) ) ( IS-CRATE ?auto_44427 ) ( not ( = ?auto_44426 ?auto_44429 ) ) ( not ( = ?auto_44427 ?auto_44429 ) ) ( not ( = ?auto_44432 ?auto_44429 ) ) ( AVAILABLE ?auto_44430 ) ( SURFACE-AT ?auto_44427 ?auto_44434 ) ( ON ?auto_44427 ?auto_44433 ) ( CLEAR ?auto_44427 ) ( not ( = ?auto_44426 ?auto_44433 ) ) ( not ( = ?auto_44427 ?auto_44433 ) ) ( not ( = ?auto_44432 ?auto_44433 ) ) ( not ( = ?auto_44429 ?auto_44433 ) ) ( TRUCK-AT ?auto_44436 ?auto_44428 ) ( SURFACE-AT ?auto_44435 ?auto_44428 ) ( CLEAR ?auto_44435 ) ( IS-CRATE ?auto_44429 ) ( not ( = ?auto_44426 ?auto_44435 ) ) ( not ( = ?auto_44427 ?auto_44435 ) ) ( not ( = ?auto_44432 ?auto_44435 ) ) ( not ( = ?auto_44429 ?auto_44435 ) ) ( not ( = ?auto_44433 ?auto_44435 ) ) ( AVAILABLE ?auto_44431 ) ( IN ?auto_44429 ?auto_44436 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44431 ?auto_44429 ?auto_44436 ?auto_44428 )
      ( MAKE-ON ?auto_44426 ?auto_44427 )
      ( MAKE-ON-VERIFY ?auto_44426 ?auto_44427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44437 - SURFACE
      ?auto_44438 - SURFACE
    )
    :vars
    (
      ?auto_44440 - HOIST
      ?auto_44442 - PLACE
      ?auto_44445 - PLACE
      ?auto_44441 - HOIST
      ?auto_44443 - SURFACE
      ?auto_44439 - SURFACE
      ?auto_44447 - SURFACE
      ?auto_44446 - SURFACE
      ?auto_44444 - TRUCK
      ?auto_44448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44440 ?auto_44442 ) ( IS-CRATE ?auto_44437 ) ( not ( = ?auto_44437 ?auto_44438 ) ) ( not ( = ?auto_44445 ?auto_44442 ) ) ( HOIST-AT ?auto_44441 ?auto_44445 ) ( not ( = ?auto_44440 ?auto_44441 ) ) ( SURFACE-AT ?auto_44437 ?auto_44445 ) ( ON ?auto_44437 ?auto_44443 ) ( CLEAR ?auto_44437 ) ( not ( = ?auto_44437 ?auto_44443 ) ) ( not ( = ?auto_44438 ?auto_44443 ) ) ( IS-CRATE ?auto_44438 ) ( not ( = ?auto_44437 ?auto_44439 ) ) ( not ( = ?auto_44438 ?auto_44439 ) ) ( not ( = ?auto_44443 ?auto_44439 ) ) ( AVAILABLE ?auto_44441 ) ( SURFACE-AT ?auto_44438 ?auto_44445 ) ( ON ?auto_44438 ?auto_44447 ) ( CLEAR ?auto_44438 ) ( not ( = ?auto_44437 ?auto_44447 ) ) ( not ( = ?auto_44438 ?auto_44447 ) ) ( not ( = ?auto_44443 ?auto_44447 ) ) ( not ( = ?auto_44439 ?auto_44447 ) ) ( SURFACE-AT ?auto_44446 ?auto_44442 ) ( CLEAR ?auto_44446 ) ( IS-CRATE ?auto_44439 ) ( not ( = ?auto_44437 ?auto_44446 ) ) ( not ( = ?auto_44438 ?auto_44446 ) ) ( not ( = ?auto_44443 ?auto_44446 ) ) ( not ( = ?auto_44439 ?auto_44446 ) ) ( not ( = ?auto_44447 ?auto_44446 ) ) ( AVAILABLE ?auto_44440 ) ( IN ?auto_44439 ?auto_44444 ) ( TRUCK-AT ?auto_44444 ?auto_44448 ) ( not ( = ?auto_44448 ?auto_44442 ) ) ( not ( = ?auto_44445 ?auto_44448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44444 ?auto_44448 ?auto_44442 )
      ( MAKE-ON ?auto_44437 ?auto_44438 )
      ( MAKE-ON-VERIFY ?auto_44437 ?auto_44438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44449 - SURFACE
      ?auto_44450 - SURFACE
    )
    :vars
    (
      ?auto_44455 - HOIST
      ?auto_44453 - PLACE
      ?auto_44452 - PLACE
      ?auto_44451 - HOIST
      ?auto_44456 - SURFACE
      ?auto_44458 - SURFACE
      ?auto_44454 - SURFACE
      ?auto_44460 - SURFACE
      ?auto_44459 - TRUCK
      ?auto_44457 - PLACE
      ?auto_44461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44455 ?auto_44453 ) ( IS-CRATE ?auto_44449 ) ( not ( = ?auto_44449 ?auto_44450 ) ) ( not ( = ?auto_44452 ?auto_44453 ) ) ( HOIST-AT ?auto_44451 ?auto_44452 ) ( not ( = ?auto_44455 ?auto_44451 ) ) ( SURFACE-AT ?auto_44449 ?auto_44452 ) ( ON ?auto_44449 ?auto_44456 ) ( CLEAR ?auto_44449 ) ( not ( = ?auto_44449 ?auto_44456 ) ) ( not ( = ?auto_44450 ?auto_44456 ) ) ( IS-CRATE ?auto_44450 ) ( not ( = ?auto_44449 ?auto_44458 ) ) ( not ( = ?auto_44450 ?auto_44458 ) ) ( not ( = ?auto_44456 ?auto_44458 ) ) ( AVAILABLE ?auto_44451 ) ( SURFACE-AT ?auto_44450 ?auto_44452 ) ( ON ?auto_44450 ?auto_44454 ) ( CLEAR ?auto_44450 ) ( not ( = ?auto_44449 ?auto_44454 ) ) ( not ( = ?auto_44450 ?auto_44454 ) ) ( not ( = ?auto_44456 ?auto_44454 ) ) ( not ( = ?auto_44458 ?auto_44454 ) ) ( SURFACE-AT ?auto_44460 ?auto_44453 ) ( CLEAR ?auto_44460 ) ( IS-CRATE ?auto_44458 ) ( not ( = ?auto_44449 ?auto_44460 ) ) ( not ( = ?auto_44450 ?auto_44460 ) ) ( not ( = ?auto_44456 ?auto_44460 ) ) ( not ( = ?auto_44458 ?auto_44460 ) ) ( not ( = ?auto_44454 ?auto_44460 ) ) ( AVAILABLE ?auto_44455 ) ( TRUCK-AT ?auto_44459 ?auto_44457 ) ( not ( = ?auto_44457 ?auto_44453 ) ) ( not ( = ?auto_44452 ?auto_44457 ) ) ( HOIST-AT ?auto_44461 ?auto_44457 ) ( LIFTING ?auto_44461 ?auto_44458 ) ( not ( = ?auto_44455 ?auto_44461 ) ) ( not ( = ?auto_44451 ?auto_44461 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44461 ?auto_44458 ?auto_44459 ?auto_44457 )
      ( MAKE-ON ?auto_44449 ?auto_44450 )
      ( MAKE-ON-VERIFY ?auto_44449 ?auto_44450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44462 - SURFACE
      ?auto_44463 - SURFACE
    )
    :vars
    (
      ?auto_44464 - HOIST
      ?auto_44474 - PLACE
      ?auto_44465 - PLACE
      ?auto_44466 - HOIST
      ?auto_44473 - SURFACE
      ?auto_44467 - SURFACE
      ?auto_44471 - SURFACE
      ?auto_44468 - SURFACE
      ?auto_44472 - TRUCK
      ?auto_44470 - PLACE
      ?auto_44469 - HOIST
      ?auto_44475 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44464 ?auto_44474 ) ( IS-CRATE ?auto_44462 ) ( not ( = ?auto_44462 ?auto_44463 ) ) ( not ( = ?auto_44465 ?auto_44474 ) ) ( HOIST-AT ?auto_44466 ?auto_44465 ) ( not ( = ?auto_44464 ?auto_44466 ) ) ( SURFACE-AT ?auto_44462 ?auto_44465 ) ( ON ?auto_44462 ?auto_44473 ) ( CLEAR ?auto_44462 ) ( not ( = ?auto_44462 ?auto_44473 ) ) ( not ( = ?auto_44463 ?auto_44473 ) ) ( IS-CRATE ?auto_44463 ) ( not ( = ?auto_44462 ?auto_44467 ) ) ( not ( = ?auto_44463 ?auto_44467 ) ) ( not ( = ?auto_44473 ?auto_44467 ) ) ( AVAILABLE ?auto_44466 ) ( SURFACE-AT ?auto_44463 ?auto_44465 ) ( ON ?auto_44463 ?auto_44471 ) ( CLEAR ?auto_44463 ) ( not ( = ?auto_44462 ?auto_44471 ) ) ( not ( = ?auto_44463 ?auto_44471 ) ) ( not ( = ?auto_44473 ?auto_44471 ) ) ( not ( = ?auto_44467 ?auto_44471 ) ) ( SURFACE-AT ?auto_44468 ?auto_44474 ) ( CLEAR ?auto_44468 ) ( IS-CRATE ?auto_44467 ) ( not ( = ?auto_44462 ?auto_44468 ) ) ( not ( = ?auto_44463 ?auto_44468 ) ) ( not ( = ?auto_44473 ?auto_44468 ) ) ( not ( = ?auto_44467 ?auto_44468 ) ) ( not ( = ?auto_44471 ?auto_44468 ) ) ( AVAILABLE ?auto_44464 ) ( TRUCK-AT ?auto_44472 ?auto_44470 ) ( not ( = ?auto_44470 ?auto_44474 ) ) ( not ( = ?auto_44465 ?auto_44470 ) ) ( HOIST-AT ?auto_44469 ?auto_44470 ) ( not ( = ?auto_44464 ?auto_44469 ) ) ( not ( = ?auto_44466 ?auto_44469 ) ) ( AVAILABLE ?auto_44469 ) ( SURFACE-AT ?auto_44467 ?auto_44470 ) ( ON ?auto_44467 ?auto_44475 ) ( CLEAR ?auto_44467 ) ( not ( = ?auto_44462 ?auto_44475 ) ) ( not ( = ?auto_44463 ?auto_44475 ) ) ( not ( = ?auto_44473 ?auto_44475 ) ) ( not ( = ?auto_44467 ?auto_44475 ) ) ( not ( = ?auto_44471 ?auto_44475 ) ) ( not ( = ?auto_44468 ?auto_44475 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44469 ?auto_44467 ?auto_44475 ?auto_44470 )
      ( MAKE-ON ?auto_44462 ?auto_44463 )
      ( MAKE-ON-VERIFY ?auto_44462 ?auto_44463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44476 - SURFACE
      ?auto_44477 - SURFACE
    )
    :vars
    (
      ?auto_44481 - HOIST
      ?auto_44484 - PLACE
      ?auto_44489 - PLACE
      ?auto_44478 - HOIST
      ?auto_44486 - SURFACE
      ?auto_44485 - SURFACE
      ?auto_44488 - SURFACE
      ?auto_44483 - SURFACE
      ?auto_44487 - PLACE
      ?auto_44479 - HOIST
      ?auto_44482 - SURFACE
      ?auto_44480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44481 ?auto_44484 ) ( IS-CRATE ?auto_44476 ) ( not ( = ?auto_44476 ?auto_44477 ) ) ( not ( = ?auto_44489 ?auto_44484 ) ) ( HOIST-AT ?auto_44478 ?auto_44489 ) ( not ( = ?auto_44481 ?auto_44478 ) ) ( SURFACE-AT ?auto_44476 ?auto_44489 ) ( ON ?auto_44476 ?auto_44486 ) ( CLEAR ?auto_44476 ) ( not ( = ?auto_44476 ?auto_44486 ) ) ( not ( = ?auto_44477 ?auto_44486 ) ) ( IS-CRATE ?auto_44477 ) ( not ( = ?auto_44476 ?auto_44485 ) ) ( not ( = ?auto_44477 ?auto_44485 ) ) ( not ( = ?auto_44486 ?auto_44485 ) ) ( AVAILABLE ?auto_44478 ) ( SURFACE-AT ?auto_44477 ?auto_44489 ) ( ON ?auto_44477 ?auto_44488 ) ( CLEAR ?auto_44477 ) ( not ( = ?auto_44476 ?auto_44488 ) ) ( not ( = ?auto_44477 ?auto_44488 ) ) ( not ( = ?auto_44486 ?auto_44488 ) ) ( not ( = ?auto_44485 ?auto_44488 ) ) ( SURFACE-AT ?auto_44483 ?auto_44484 ) ( CLEAR ?auto_44483 ) ( IS-CRATE ?auto_44485 ) ( not ( = ?auto_44476 ?auto_44483 ) ) ( not ( = ?auto_44477 ?auto_44483 ) ) ( not ( = ?auto_44486 ?auto_44483 ) ) ( not ( = ?auto_44485 ?auto_44483 ) ) ( not ( = ?auto_44488 ?auto_44483 ) ) ( AVAILABLE ?auto_44481 ) ( not ( = ?auto_44487 ?auto_44484 ) ) ( not ( = ?auto_44489 ?auto_44487 ) ) ( HOIST-AT ?auto_44479 ?auto_44487 ) ( not ( = ?auto_44481 ?auto_44479 ) ) ( not ( = ?auto_44478 ?auto_44479 ) ) ( AVAILABLE ?auto_44479 ) ( SURFACE-AT ?auto_44485 ?auto_44487 ) ( ON ?auto_44485 ?auto_44482 ) ( CLEAR ?auto_44485 ) ( not ( = ?auto_44476 ?auto_44482 ) ) ( not ( = ?auto_44477 ?auto_44482 ) ) ( not ( = ?auto_44486 ?auto_44482 ) ) ( not ( = ?auto_44485 ?auto_44482 ) ) ( not ( = ?auto_44488 ?auto_44482 ) ) ( not ( = ?auto_44483 ?auto_44482 ) ) ( TRUCK-AT ?auto_44480 ?auto_44484 ) )
    :subtasks
    ( ( !DRIVE ?auto_44480 ?auto_44484 ?auto_44487 )
      ( MAKE-ON ?auto_44476 ?auto_44477 )
      ( MAKE-ON-VERIFY ?auto_44476 ?auto_44477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44490 - SURFACE
      ?auto_44491 - SURFACE
    )
    :vars
    (
      ?auto_44494 - HOIST
      ?auto_44502 - PLACE
      ?auto_44493 - PLACE
      ?auto_44495 - HOIST
      ?auto_44499 - SURFACE
      ?auto_44501 - SURFACE
      ?auto_44492 - SURFACE
      ?auto_44498 - SURFACE
      ?auto_44503 - PLACE
      ?auto_44496 - HOIST
      ?auto_44500 - SURFACE
      ?auto_44497 - TRUCK
      ?auto_44504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44494 ?auto_44502 ) ( IS-CRATE ?auto_44490 ) ( not ( = ?auto_44490 ?auto_44491 ) ) ( not ( = ?auto_44493 ?auto_44502 ) ) ( HOIST-AT ?auto_44495 ?auto_44493 ) ( not ( = ?auto_44494 ?auto_44495 ) ) ( SURFACE-AT ?auto_44490 ?auto_44493 ) ( ON ?auto_44490 ?auto_44499 ) ( CLEAR ?auto_44490 ) ( not ( = ?auto_44490 ?auto_44499 ) ) ( not ( = ?auto_44491 ?auto_44499 ) ) ( IS-CRATE ?auto_44491 ) ( not ( = ?auto_44490 ?auto_44501 ) ) ( not ( = ?auto_44491 ?auto_44501 ) ) ( not ( = ?auto_44499 ?auto_44501 ) ) ( AVAILABLE ?auto_44495 ) ( SURFACE-AT ?auto_44491 ?auto_44493 ) ( ON ?auto_44491 ?auto_44492 ) ( CLEAR ?auto_44491 ) ( not ( = ?auto_44490 ?auto_44492 ) ) ( not ( = ?auto_44491 ?auto_44492 ) ) ( not ( = ?auto_44499 ?auto_44492 ) ) ( not ( = ?auto_44501 ?auto_44492 ) ) ( IS-CRATE ?auto_44501 ) ( not ( = ?auto_44490 ?auto_44498 ) ) ( not ( = ?auto_44491 ?auto_44498 ) ) ( not ( = ?auto_44499 ?auto_44498 ) ) ( not ( = ?auto_44501 ?auto_44498 ) ) ( not ( = ?auto_44492 ?auto_44498 ) ) ( not ( = ?auto_44503 ?auto_44502 ) ) ( not ( = ?auto_44493 ?auto_44503 ) ) ( HOIST-AT ?auto_44496 ?auto_44503 ) ( not ( = ?auto_44494 ?auto_44496 ) ) ( not ( = ?auto_44495 ?auto_44496 ) ) ( AVAILABLE ?auto_44496 ) ( SURFACE-AT ?auto_44501 ?auto_44503 ) ( ON ?auto_44501 ?auto_44500 ) ( CLEAR ?auto_44501 ) ( not ( = ?auto_44490 ?auto_44500 ) ) ( not ( = ?auto_44491 ?auto_44500 ) ) ( not ( = ?auto_44499 ?auto_44500 ) ) ( not ( = ?auto_44501 ?auto_44500 ) ) ( not ( = ?auto_44492 ?auto_44500 ) ) ( not ( = ?auto_44498 ?auto_44500 ) ) ( TRUCK-AT ?auto_44497 ?auto_44502 ) ( SURFACE-AT ?auto_44504 ?auto_44502 ) ( CLEAR ?auto_44504 ) ( LIFTING ?auto_44494 ?auto_44498 ) ( IS-CRATE ?auto_44498 ) ( not ( = ?auto_44490 ?auto_44504 ) ) ( not ( = ?auto_44491 ?auto_44504 ) ) ( not ( = ?auto_44499 ?auto_44504 ) ) ( not ( = ?auto_44501 ?auto_44504 ) ) ( not ( = ?auto_44492 ?auto_44504 ) ) ( not ( = ?auto_44498 ?auto_44504 ) ) ( not ( = ?auto_44500 ?auto_44504 ) ) )
    :subtasks
    ( ( !DROP ?auto_44494 ?auto_44498 ?auto_44504 ?auto_44502 )
      ( MAKE-ON ?auto_44490 ?auto_44491 )
      ( MAKE-ON-VERIFY ?auto_44490 ?auto_44491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44505 - SURFACE
      ?auto_44506 - SURFACE
    )
    :vars
    (
      ?auto_44518 - HOIST
      ?auto_44512 - PLACE
      ?auto_44511 - PLACE
      ?auto_44507 - HOIST
      ?auto_44514 - SURFACE
      ?auto_44519 - SURFACE
      ?auto_44517 - SURFACE
      ?auto_44508 - SURFACE
      ?auto_44515 - PLACE
      ?auto_44510 - HOIST
      ?auto_44513 - SURFACE
      ?auto_44509 - TRUCK
      ?auto_44516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44518 ?auto_44512 ) ( IS-CRATE ?auto_44505 ) ( not ( = ?auto_44505 ?auto_44506 ) ) ( not ( = ?auto_44511 ?auto_44512 ) ) ( HOIST-AT ?auto_44507 ?auto_44511 ) ( not ( = ?auto_44518 ?auto_44507 ) ) ( SURFACE-AT ?auto_44505 ?auto_44511 ) ( ON ?auto_44505 ?auto_44514 ) ( CLEAR ?auto_44505 ) ( not ( = ?auto_44505 ?auto_44514 ) ) ( not ( = ?auto_44506 ?auto_44514 ) ) ( IS-CRATE ?auto_44506 ) ( not ( = ?auto_44505 ?auto_44519 ) ) ( not ( = ?auto_44506 ?auto_44519 ) ) ( not ( = ?auto_44514 ?auto_44519 ) ) ( AVAILABLE ?auto_44507 ) ( SURFACE-AT ?auto_44506 ?auto_44511 ) ( ON ?auto_44506 ?auto_44517 ) ( CLEAR ?auto_44506 ) ( not ( = ?auto_44505 ?auto_44517 ) ) ( not ( = ?auto_44506 ?auto_44517 ) ) ( not ( = ?auto_44514 ?auto_44517 ) ) ( not ( = ?auto_44519 ?auto_44517 ) ) ( IS-CRATE ?auto_44519 ) ( not ( = ?auto_44505 ?auto_44508 ) ) ( not ( = ?auto_44506 ?auto_44508 ) ) ( not ( = ?auto_44514 ?auto_44508 ) ) ( not ( = ?auto_44519 ?auto_44508 ) ) ( not ( = ?auto_44517 ?auto_44508 ) ) ( not ( = ?auto_44515 ?auto_44512 ) ) ( not ( = ?auto_44511 ?auto_44515 ) ) ( HOIST-AT ?auto_44510 ?auto_44515 ) ( not ( = ?auto_44518 ?auto_44510 ) ) ( not ( = ?auto_44507 ?auto_44510 ) ) ( AVAILABLE ?auto_44510 ) ( SURFACE-AT ?auto_44519 ?auto_44515 ) ( ON ?auto_44519 ?auto_44513 ) ( CLEAR ?auto_44519 ) ( not ( = ?auto_44505 ?auto_44513 ) ) ( not ( = ?auto_44506 ?auto_44513 ) ) ( not ( = ?auto_44514 ?auto_44513 ) ) ( not ( = ?auto_44519 ?auto_44513 ) ) ( not ( = ?auto_44517 ?auto_44513 ) ) ( not ( = ?auto_44508 ?auto_44513 ) ) ( TRUCK-AT ?auto_44509 ?auto_44512 ) ( SURFACE-AT ?auto_44516 ?auto_44512 ) ( CLEAR ?auto_44516 ) ( IS-CRATE ?auto_44508 ) ( not ( = ?auto_44505 ?auto_44516 ) ) ( not ( = ?auto_44506 ?auto_44516 ) ) ( not ( = ?auto_44514 ?auto_44516 ) ) ( not ( = ?auto_44519 ?auto_44516 ) ) ( not ( = ?auto_44517 ?auto_44516 ) ) ( not ( = ?auto_44508 ?auto_44516 ) ) ( not ( = ?auto_44513 ?auto_44516 ) ) ( AVAILABLE ?auto_44518 ) ( IN ?auto_44508 ?auto_44509 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44518 ?auto_44508 ?auto_44509 ?auto_44512 )
      ( MAKE-ON ?auto_44505 ?auto_44506 )
      ( MAKE-ON-VERIFY ?auto_44505 ?auto_44506 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44520 - SURFACE
      ?auto_44521 - SURFACE
    )
    :vars
    (
      ?auto_44533 - HOIST
      ?auto_44527 - PLACE
      ?auto_44523 - PLACE
      ?auto_44524 - HOIST
      ?auto_44530 - SURFACE
      ?auto_44529 - SURFACE
      ?auto_44531 - SURFACE
      ?auto_44522 - SURFACE
      ?auto_44532 - PLACE
      ?auto_44525 - HOIST
      ?auto_44534 - SURFACE
      ?auto_44528 - SURFACE
      ?auto_44526 - TRUCK
      ?auto_44535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44533 ?auto_44527 ) ( IS-CRATE ?auto_44520 ) ( not ( = ?auto_44520 ?auto_44521 ) ) ( not ( = ?auto_44523 ?auto_44527 ) ) ( HOIST-AT ?auto_44524 ?auto_44523 ) ( not ( = ?auto_44533 ?auto_44524 ) ) ( SURFACE-AT ?auto_44520 ?auto_44523 ) ( ON ?auto_44520 ?auto_44530 ) ( CLEAR ?auto_44520 ) ( not ( = ?auto_44520 ?auto_44530 ) ) ( not ( = ?auto_44521 ?auto_44530 ) ) ( IS-CRATE ?auto_44521 ) ( not ( = ?auto_44520 ?auto_44529 ) ) ( not ( = ?auto_44521 ?auto_44529 ) ) ( not ( = ?auto_44530 ?auto_44529 ) ) ( AVAILABLE ?auto_44524 ) ( SURFACE-AT ?auto_44521 ?auto_44523 ) ( ON ?auto_44521 ?auto_44531 ) ( CLEAR ?auto_44521 ) ( not ( = ?auto_44520 ?auto_44531 ) ) ( not ( = ?auto_44521 ?auto_44531 ) ) ( not ( = ?auto_44530 ?auto_44531 ) ) ( not ( = ?auto_44529 ?auto_44531 ) ) ( IS-CRATE ?auto_44529 ) ( not ( = ?auto_44520 ?auto_44522 ) ) ( not ( = ?auto_44521 ?auto_44522 ) ) ( not ( = ?auto_44530 ?auto_44522 ) ) ( not ( = ?auto_44529 ?auto_44522 ) ) ( not ( = ?auto_44531 ?auto_44522 ) ) ( not ( = ?auto_44532 ?auto_44527 ) ) ( not ( = ?auto_44523 ?auto_44532 ) ) ( HOIST-AT ?auto_44525 ?auto_44532 ) ( not ( = ?auto_44533 ?auto_44525 ) ) ( not ( = ?auto_44524 ?auto_44525 ) ) ( AVAILABLE ?auto_44525 ) ( SURFACE-AT ?auto_44529 ?auto_44532 ) ( ON ?auto_44529 ?auto_44534 ) ( CLEAR ?auto_44529 ) ( not ( = ?auto_44520 ?auto_44534 ) ) ( not ( = ?auto_44521 ?auto_44534 ) ) ( not ( = ?auto_44530 ?auto_44534 ) ) ( not ( = ?auto_44529 ?auto_44534 ) ) ( not ( = ?auto_44531 ?auto_44534 ) ) ( not ( = ?auto_44522 ?auto_44534 ) ) ( SURFACE-AT ?auto_44528 ?auto_44527 ) ( CLEAR ?auto_44528 ) ( IS-CRATE ?auto_44522 ) ( not ( = ?auto_44520 ?auto_44528 ) ) ( not ( = ?auto_44521 ?auto_44528 ) ) ( not ( = ?auto_44530 ?auto_44528 ) ) ( not ( = ?auto_44529 ?auto_44528 ) ) ( not ( = ?auto_44531 ?auto_44528 ) ) ( not ( = ?auto_44522 ?auto_44528 ) ) ( not ( = ?auto_44534 ?auto_44528 ) ) ( AVAILABLE ?auto_44533 ) ( IN ?auto_44522 ?auto_44526 ) ( TRUCK-AT ?auto_44526 ?auto_44535 ) ( not ( = ?auto_44535 ?auto_44527 ) ) ( not ( = ?auto_44523 ?auto_44535 ) ) ( not ( = ?auto_44532 ?auto_44535 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44526 ?auto_44535 ?auto_44527 )
      ( MAKE-ON ?auto_44520 ?auto_44521 )
      ( MAKE-ON-VERIFY ?auto_44520 ?auto_44521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44536 - SURFACE
      ?auto_44537 - SURFACE
    )
    :vars
    (
      ?auto_44548 - HOIST
      ?auto_44541 - PLACE
      ?auto_44547 - PLACE
      ?auto_44542 - HOIST
      ?auto_44546 - SURFACE
      ?auto_44540 - SURFACE
      ?auto_44551 - SURFACE
      ?auto_44538 - SURFACE
      ?auto_44543 - PLACE
      ?auto_44544 - HOIST
      ?auto_44539 - SURFACE
      ?auto_44549 - SURFACE
      ?auto_44550 - TRUCK
      ?auto_44545 - PLACE
      ?auto_44552 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44548 ?auto_44541 ) ( IS-CRATE ?auto_44536 ) ( not ( = ?auto_44536 ?auto_44537 ) ) ( not ( = ?auto_44547 ?auto_44541 ) ) ( HOIST-AT ?auto_44542 ?auto_44547 ) ( not ( = ?auto_44548 ?auto_44542 ) ) ( SURFACE-AT ?auto_44536 ?auto_44547 ) ( ON ?auto_44536 ?auto_44546 ) ( CLEAR ?auto_44536 ) ( not ( = ?auto_44536 ?auto_44546 ) ) ( not ( = ?auto_44537 ?auto_44546 ) ) ( IS-CRATE ?auto_44537 ) ( not ( = ?auto_44536 ?auto_44540 ) ) ( not ( = ?auto_44537 ?auto_44540 ) ) ( not ( = ?auto_44546 ?auto_44540 ) ) ( AVAILABLE ?auto_44542 ) ( SURFACE-AT ?auto_44537 ?auto_44547 ) ( ON ?auto_44537 ?auto_44551 ) ( CLEAR ?auto_44537 ) ( not ( = ?auto_44536 ?auto_44551 ) ) ( not ( = ?auto_44537 ?auto_44551 ) ) ( not ( = ?auto_44546 ?auto_44551 ) ) ( not ( = ?auto_44540 ?auto_44551 ) ) ( IS-CRATE ?auto_44540 ) ( not ( = ?auto_44536 ?auto_44538 ) ) ( not ( = ?auto_44537 ?auto_44538 ) ) ( not ( = ?auto_44546 ?auto_44538 ) ) ( not ( = ?auto_44540 ?auto_44538 ) ) ( not ( = ?auto_44551 ?auto_44538 ) ) ( not ( = ?auto_44543 ?auto_44541 ) ) ( not ( = ?auto_44547 ?auto_44543 ) ) ( HOIST-AT ?auto_44544 ?auto_44543 ) ( not ( = ?auto_44548 ?auto_44544 ) ) ( not ( = ?auto_44542 ?auto_44544 ) ) ( AVAILABLE ?auto_44544 ) ( SURFACE-AT ?auto_44540 ?auto_44543 ) ( ON ?auto_44540 ?auto_44539 ) ( CLEAR ?auto_44540 ) ( not ( = ?auto_44536 ?auto_44539 ) ) ( not ( = ?auto_44537 ?auto_44539 ) ) ( not ( = ?auto_44546 ?auto_44539 ) ) ( not ( = ?auto_44540 ?auto_44539 ) ) ( not ( = ?auto_44551 ?auto_44539 ) ) ( not ( = ?auto_44538 ?auto_44539 ) ) ( SURFACE-AT ?auto_44549 ?auto_44541 ) ( CLEAR ?auto_44549 ) ( IS-CRATE ?auto_44538 ) ( not ( = ?auto_44536 ?auto_44549 ) ) ( not ( = ?auto_44537 ?auto_44549 ) ) ( not ( = ?auto_44546 ?auto_44549 ) ) ( not ( = ?auto_44540 ?auto_44549 ) ) ( not ( = ?auto_44551 ?auto_44549 ) ) ( not ( = ?auto_44538 ?auto_44549 ) ) ( not ( = ?auto_44539 ?auto_44549 ) ) ( AVAILABLE ?auto_44548 ) ( TRUCK-AT ?auto_44550 ?auto_44545 ) ( not ( = ?auto_44545 ?auto_44541 ) ) ( not ( = ?auto_44547 ?auto_44545 ) ) ( not ( = ?auto_44543 ?auto_44545 ) ) ( HOIST-AT ?auto_44552 ?auto_44545 ) ( LIFTING ?auto_44552 ?auto_44538 ) ( not ( = ?auto_44548 ?auto_44552 ) ) ( not ( = ?auto_44542 ?auto_44552 ) ) ( not ( = ?auto_44544 ?auto_44552 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44552 ?auto_44538 ?auto_44550 ?auto_44545 )
      ( MAKE-ON ?auto_44536 ?auto_44537 )
      ( MAKE-ON-VERIFY ?auto_44536 ?auto_44537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44553 - SURFACE
      ?auto_44554 - SURFACE
    )
    :vars
    (
      ?auto_44563 - HOIST
      ?auto_44555 - PLACE
      ?auto_44559 - PLACE
      ?auto_44558 - HOIST
      ?auto_44557 - SURFACE
      ?auto_44561 - SURFACE
      ?auto_44556 - SURFACE
      ?auto_44568 - SURFACE
      ?auto_44566 - PLACE
      ?auto_44569 - HOIST
      ?auto_44564 - SURFACE
      ?auto_44560 - SURFACE
      ?auto_44565 - TRUCK
      ?auto_44562 - PLACE
      ?auto_44567 - HOIST
      ?auto_44570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44563 ?auto_44555 ) ( IS-CRATE ?auto_44553 ) ( not ( = ?auto_44553 ?auto_44554 ) ) ( not ( = ?auto_44559 ?auto_44555 ) ) ( HOIST-AT ?auto_44558 ?auto_44559 ) ( not ( = ?auto_44563 ?auto_44558 ) ) ( SURFACE-AT ?auto_44553 ?auto_44559 ) ( ON ?auto_44553 ?auto_44557 ) ( CLEAR ?auto_44553 ) ( not ( = ?auto_44553 ?auto_44557 ) ) ( not ( = ?auto_44554 ?auto_44557 ) ) ( IS-CRATE ?auto_44554 ) ( not ( = ?auto_44553 ?auto_44561 ) ) ( not ( = ?auto_44554 ?auto_44561 ) ) ( not ( = ?auto_44557 ?auto_44561 ) ) ( AVAILABLE ?auto_44558 ) ( SURFACE-AT ?auto_44554 ?auto_44559 ) ( ON ?auto_44554 ?auto_44556 ) ( CLEAR ?auto_44554 ) ( not ( = ?auto_44553 ?auto_44556 ) ) ( not ( = ?auto_44554 ?auto_44556 ) ) ( not ( = ?auto_44557 ?auto_44556 ) ) ( not ( = ?auto_44561 ?auto_44556 ) ) ( IS-CRATE ?auto_44561 ) ( not ( = ?auto_44553 ?auto_44568 ) ) ( not ( = ?auto_44554 ?auto_44568 ) ) ( not ( = ?auto_44557 ?auto_44568 ) ) ( not ( = ?auto_44561 ?auto_44568 ) ) ( not ( = ?auto_44556 ?auto_44568 ) ) ( not ( = ?auto_44566 ?auto_44555 ) ) ( not ( = ?auto_44559 ?auto_44566 ) ) ( HOIST-AT ?auto_44569 ?auto_44566 ) ( not ( = ?auto_44563 ?auto_44569 ) ) ( not ( = ?auto_44558 ?auto_44569 ) ) ( AVAILABLE ?auto_44569 ) ( SURFACE-AT ?auto_44561 ?auto_44566 ) ( ON ?auto_44561 ?auto_44564 ) ( CLEAR ?auto_44561 ) ( not ( = ?auto_44553 ?auto_44564 ) ) ( not ( = ?auto_44554 ?auto_44564 ) ) ( not ( = ?auto_44557 ?auto_44564 ) ) ( not ( = ?auto_44561 ?auto_44564 ) ) ( not ( = ?auto_44556 ?auto_44564 ) ) ( not ( = ?auto_44568 ?auto_44564 ) ) ( SURFACE-AT ?auto_44560 ?auto_44555 ) ( CLEAR ?auto_44560 ) ( IS-CRATE ?auto_44568 ) ( not ( = ?auto_44553 ?auto_44560 ) ) ( not ( = ?auto_44554 ?auto_44560 ) ) ( not ( = ?auto_44557 ?auto_44560 ) ) ( not ( = ?auto_44561 ?auto_44560 ) ) ( not ( = ?auto_44556 ?auto_44560 ) ) ( not ( = ?auto_44568 ?auto_44560 ) ) ( not ( = ?auto_44564 ?auto_44560 ) ) ( AVAILABLE ?auto_44563 ) ( TRUCK-AT ?auto_44565 ?auto_44562 ) ( not ( = ?auto_44562 ?auto_44555 ) ) ( not ( = ?auto_44559 ?auto_44562 ) ) ( not ( = ?auto_44566 ?auto_44562 ) ) ( HOIST-AT ?auto_44567 ?auto_44562 ) ( not ( = ?auto_44563 ?auto_44567 ) ) ( not ( = ?auto_44558 ?auto_44567 ) ) ( not ( = ?auto_44569 ?auto_44567 ) ) ( AVAILABLE ?auto_44567 ) ( SURFACE-AT ?auto_44568 ?auto_44562 ) ( ON ?auto_44568 ?auto_44570 ) ( CLEAR ?auto_44568 ) ( not ( = ?auto_44553 ?auto_44570 ) ) ( not ( = ?auto_44554 ?auto_44570 ) ) ( not ( = ?auto_44557 ?auto_44570 ) ) ( not ( = ?auto_44561 ?auto_44570 ) ) ( not ( = ?auto_44556 ?auto_44570 ) ) ( not ( = ?auto_44568 ?auto_44570 ) ) ( not ( = ?auto_44564 ?auto_44570 ) ) ( not ( = ?auto_44560 ?auto_44570 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44567 ?auto_44568 ?auto_44570 ?auto_44562 )
      ( MAKE-ON ?auto_44553 ?auto_44554 )
      ( MAKE-ON-VERIFY ?auto_44553 ?auto_44554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44571 - SURFACE
      ?auto_44572 - SURFACE
    )
    :vars
    (
      ?auto_44588 - HOIST
      ?auto_44577 - PLACE
      ?auto_44586 - PLACE
      ?auto_44578 - HOIST
      ?auto_44587 - SURFACE
      ?auto_44575 - SURFACE
      ?auto_44576 - SURFACE
      ?auto_44581 - SURFACE
      ?auto_44585 - PLACE
      ?auto_44574 - HOIST
      ?auto_44582 - SURFACE
      ?auto_44573 - SURFACE
      ?auto_44579 - PLACE
      ?auto_44584 - HOIST
      ?auto_44580 - SURFACE
      ?auto_44583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44588 ?auto_44577 ) ( IS-CRATE ?auto_44571 ) ( not ( = ?auto_44571 ?auto_44572 ) ) ( not ( = ?auto_44586 ?auto_44577 ) ) ( HOIST-AT ?auto_44578 ?auto_44586 ) ( not ( = ?auto_44588 ?auto_44578 ) ) ( SURFACE-AT ?auto_44571 ?auto_44586 ) ( ON ?auto_44571 ?auto_44587 ) ( CLEAR ?auto_44571 ) ( not ( = ?auto_44571 ?auto_44587 ) ) ( not ( = ?auto_44572 ?auto_44587 ) ) ( IS-CRATE ?auto_44572 ) ( not ( = ?auto_44571 ?auto_44575 ) ) ( not ( = ?auto_44572 ?auto_44575 ) ) ( not ( = ?auto_44587 ?auto_44575 ) ) ( AVAILABLE ?auto_44578 ) ( SURFACE-AT ?auto_44572 ?auto_44586 ) ( ON ?auto_44572 ?auto_44576 ) ( CLEAR ?auto_44572 ) ( not ( = ?auto_44571 ?auto_44576 ) ) ( not ( = ?auto_44572 ?auto_44576 ) ) ( not ( = ?auto_44587 ?auto_44576 ) ) ( not ( = ?auto_44575 ?auto_44576 ) ) ( IS-CRATE ?auto_44575 ) ( not ( = ?auto_44571 ?auto_44581 ) ) ( not ( = ?auto_44572 ?auto_44581 ) ) ( not ( = ?auto_44587 ?auto_44581 ) ) ( not ( = ?auto_44575 ?auto_44581 ) ) ( not ( = ?auto_44576 ?auto_44581 ) ) ( not ( = ?auto_44585 ?auto_44577 ) ) ( not ( = ?auto_44586 ?auto_44585 ) ) ( HOIST-AT ?auto_44574 ?auto_44585 ) ( not ( = ?auto_44588 ?auto_44574 ) ) ( not ( = ?auto_44578 ?auto_44574 ) ) ( AVAILABLE ?auto_44574 ) ( SURFACE-AT ?auto_44575 ?auto_44585 ) ( ON ?auto_44575 ?auto_44582 ) ( CLEAR ?auto_44575 ) ( not ( = ?auto_44571 ?auto_44582 ) ) ( not ( = ?auto_44572 ?auto_44582 ) ) ( not ( = ?auto_44587 ?auto_44582 ) ) ( not ( = ?auto_44575 ?auto_44582 ) ) ( not ( = ?auto_44576 ?auto_44582 ) ) ( not ( = ?auto_44581 ?auto_44582 ) ) ( SURFACE-AT ?auto_44573 ?auto_44577 ) ( CLEAR ?auto_44573 ) ( IS-CRATE ?auto_44581 ) ( not ( = ?auto_44571 ?auto_44573 ) ) ( not ( = ?auto_44572 ?auto_44573 ) ) ( not ( = ?auto_44587 ?auto_44573 ) ) ( not ( = ?auto_44575 ?auto_44573 ) ) ( not ( = ?auto_44576 ?auto_44573 ) ) ( not ( = ?auto_44581 ?auto_44573 ) ) ( not ( = ?auto_44582 ?auto_44573 ) ) ( AVAILABLE ?auto_44588 ) ( not ( = ?auto_44579 ?auto_44577 ) ) ( not ( = ?auto_44586 ?auto_44579 ) ) ( not ( = ?auto_44585 ?auto_44579 ) ) ( HOIST-AT ?auto_44584 ?auto_44579 ) ( not ( = ?auto_44588 ?auto_44584 ) ) ( not ( = ?auto_44578 ?auto_44584 ) ) ( not ( = ?auto_44574 ?auto_44584 ) ) ( AVAILABLE ?auto_44584 ) ( SURFACE-AT ?auto_44581 ?auto_44579 ) ( ON ?auto_44581 ?auto_44580 ) ( CLEAR ?auto_44581 ) ( not ( = ?auto_44571 ?auto_44580 ) ) ( not ( = ?auto_44572 ?auto_44580 ) ) ( not ( = ?auto_44587 ?auto_44580 ) ) ( not ( = ?auto_44575 ?auto_44580 ) ) ( not ( = ?auto_44576 ?auto_44580 ) ) ( not ( = ?auto_44581 ?auto_44580 ) ) ( not ( = ?auto_44582 ?auto_44580 ) ) ( not ( = ?auto_44573 ?auto_44580 ) ) ( TRUCK-AT ?auto_44583 ?auto_44577 ) )
    :subtasks
    ( ( !DRIVE ?auto_44583 ?auto_44577 ?auto_44579 )
      ( MAKE-ON ?auto_44571 ?auto_44572 )
      ( MAKE-ON-VERIFY ?auto_44571 ?auto_44572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44589 - SURFACE
      ?auto_44590 - SURFACE
    )
    :vars
    (
      ?auto_44591 - HOIST
      ?auto_44597 - PLACE
      ?auto_44601 - PLACE
      ?auto_44605 - HOIST
      ?auto_44596 - SURFACE
      ?auto_44602 - SURFACE
      ?auto_44600 - SURFACE
      ?auto_44599 - SURFACE
      ?auto_44592 - PLACE
      ?auto_44594 - HOIST
      ?auto_44604 - SURFACE
      ?auto_44595 - SURFACE
      ?auto_44598 - PLACE
      ?auto_44593 - HOIST
      ?auto_44606 - SURFACE
      ?auto_44603 - TRUCK
      ?auto_44607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44591 ?auto_44597 ) ( IS-CRATE ?auto_44589 ) ( not ( = ?auto_44589 ?auto_44590 ) ) ( not ( = ?auto_44601 ?auto_44597 ) ) ( HOIST-AT ?auto_44605 ?auto_44601 ) ( not ( = ?auto_44591 ?auto_44605 ) ) ( SURFACE-AT ?auto_44589 ?auto_44601 ) ( ON ?auto_44589 ?auto_44596 ) ( CLEAR ?auto_44589 ) ( not ( = ?auto_44589 ?auto_44596 ) ) ( not ( = ?auto_44590 ?auto_44596 ) ) ( IS-CRATE ?auto_44590 ) ( not ( = ?auto_44589 ?auto_44602 ) ) ( not ( = ?auto_44590 ?auto_44602 ) ) ( not ( = ?auto_44596 ?auto_44602 ) ) ( AVAILABLE ?auto_44605 ) ( SURFACE-AT ?auto_44590 ?auto_44601 ) ( ON ?auto_44590 ?auto_44600 ) ( CLEAR ?auto_44590 ) ( not ( = ?auto_44589 ?auto_44600 ) ) ( not ( = ?auto_44590 ?auto_44600 ) ) ( not ( = ?auto_44596 ?auto_44600 ) ) ( not ( = ?auto_44602 ?auto_44600 ) ) ( IS-CRATE ?auto_44602 ) ( not ( = ?auto_44589 ?auto_44599 ) ) ( not ( = ?auto_44590 ?auto_44599 ) ) ( not ( = ?auto_44596 ?auto_44599 ) ) ( not ( = ?auto_44602 ?auto_44599 ) ) ( not ( = ?auto_44600 ?auto_44599 ) ) ( not ( = ?auto_44592 ?auto_44597 ) ) ( not ( = ?auto_44601 ?auto_44592 ) ) ( HOIST-AT ?auto_44594 ?auto_44592 ) ( not ( = ?auto_44591 ?auto_44594 ) ) ( not ( = ?auto_44605 ?auto_44594 ) ) ( AVAILABLE ?auto_44594 ) ( SURFACE-AT ?auto_44602 ?auto_44592 ) ( ON ?auto_44602 ?auto_44604 ) ( CLEAR ?auto_44602 ) ( not ( = ?auto_44589 ?auto_44604 ) ) ( not ( = ?auto_44590 ?auto_44604 ) ) ( not ( = ?auto_44596 ?auto_44604 ) ) ( not ( = ?auto_44602 ?auto_44604 ) ) ( not ( = ?auto_44600 ?auto_44604 ) ) ( not ( = ?auto_44599 ?auto_44604 ) ) ( IS-CRATE ?auto_44599 ) ( not ( = ?auto_44589 ?auto_44595 ) ) ( not ( = ?auto_44590 ?auto_44595 ) ) ( not ( = ?auto_44596 ?auto_44595 ) ) ( not ( = ?auto_44602 ?auto_44595 ) ) ( not ( = ?auto_44600 ?auto_44595 ) ) ( not ( = ?auto_44599 ?auto_44595 ) ) ( not ( = ?auto_44604 ?auto_44595 ) ) ( not ( = ?auto_44598 ?auto_44597 ) ) ( not ( = ?auto_44601 ?auto_44598 ) ) ( not ( = ?auto_44592 ?auto_44598 ) ) ( HOIST-AT ?auto_44593 ?auto_44598 ) ( not ( = ?auto_44591 ?auto_44593 ) ) ( not ( = ?auto_44605 ?auto_44593 ) ) ( not ( = ?auto_44594 ?auto_44593 ) ) ( AVAILABLE ?auto_44593 ) ( SURFACE-AT ?auto_44599 ?auto_44598 ) ( ON ?auto_44599 ?auto_44606 ) ( CLEAR ?auto_44599 ) ( not ( = ?auto_44589 ?auto_44606 ) ) ( not ( = ?auto_44590 ?auto_44606 ) ) ( not ( = ?auto_44596 ?auto_44606 ) ) ( not ( = ?auto_44602 ?auto_44606 ) ) ( not ( = ?auto_44600 ?auto_44606 ) ) ( not ( = ?auto_44599 ?auto_44606 ) ) ( not ( = ?auto_44604 ?auto_44606 ) ) ( not ( = ?auto_44595 ?auto_44606 ) ) ( TRUCK-AT ?auto_44603 ?auto_44597 ) ( SURFACE-AT ?auto_44607 ?auto_44597 ) ( CLEAR ?auto_44607 ) ( LIFTING ?auto_44591 ?auto_44595 ) ( IS-CRATE ?auto_44595 ) ( not ( = ?auto_44589 ?auto_44607 ) ) ( not ( = ?auto_44590 ?auto_44607 ) ) ( not ( = ?auto_44596 ?auto_44607 ) ) ( not ( = ?auto_44602 ?auto_44607 ) ) ( not ( = ?auto_44600 ?auto_44607 ) ) ( not ( = ?auto_44599 ?auto_44607 ) ) ( not ( = ?auto_44604 ?auto_44607 ) ) ( not ( = ?auto_44595 ?auto_44607 ) ) ( not ( = ?auto_44606 ?auto_44607 ) ) )
    :subtasks
    ( ( !DROP ?auto_44591 ?auto_44595 ?auto_44607 ?auto_44597 )
      ( MAKE-ON ?auto_44589 ?auto_44590 )
      ( MAKE-ON-VERIFY ?auto_44589 ?auto_44590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44608 - SURFACE
      ?auto_44609 - SURFACE
    )
    :vars
    (
      ?auto_44617 - HOIST
      ?auto_44618 - PLACE
      ?auto_44624 - PLACE
      ?auto_44610 - HOIST
      ?auto_44623 - SURFACE
      ?auto_44613 - SURFACE
      ?auto_44611 - SURFACE
      ?auto_44616 - SURFACE
      ?auto_44619 - PLACE
      ?auto_44621 - HOIST
      ?auto_44625 - SURFACE
      ?auto_44622 - SURFACE
      ?auto_44626 - PLACE
      ?auto_44620 - HOIST
      ?auto_44615 - SURFACE
      ?auto_44612 - TRUCK
      ?auto_44614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44617 ?auto_44618 ) ( IS-CRATE ?auto_44608 ) ( not ( = ?auto_44608 ?auto_44609 ) ) ( not ( = ?auto_44624 ?auto_44618 ) ) ( HOIST-AT ?auto_44610 ?auto_44624 ) ( not ( = ?auto_44617 ?auto_44610 ) ) ( SURFACE-AT ?auto_44608 ?auto_44624 ) ( ON ?auto_44608 ?auto_44623 ) ( CLEAR ?auto_44608 ) ( not ( = ?auto_44608 ?auto_44623 ) ) ( not ( = ?auto_44609 ?auto_44623 ) ) ( IS-CRATE ?auto_44609 ) ( not ( = ?auto_44608 ?auto_44613 ) ) ( not ( = ?auto_44609 ?auto_44613 ) ) ( not ( = ?auto_44623 ?auto_44613 ) ) ( AVAILABLE ?auto_44610 ) ( SURFACE-AT ?auto_44609 ?auto_44624 ) ( ON ?auto_44609 ?auto_44611 ) ( CLEAR ?auto_44609 ) ( not ( = ?auto_44608 ?auto_44611 ) ) ( not ( = ?auto_44609 ?auto_44611 ) ) ( not ( = ?auto_44623 ?auto_44611 ) ) ( not ( = ?auto_44613 ?auto_44611 ) ) ( IS-CRATE ?auto_44613 ) ( not ( = ?auto_44608 ?auto_44616 ) ) ( not ( = ?auto_44609 ?auto_44616 ) ) ( not ( = ?auto_44623 ?auto_44616 ) ) ( not ( = ?auto_44613 ?auto_44616 ) ) ( not ( = ?auto_44611 ?auto_44616 ) ) ( not ( = ?auto_44619 ?auto_44618 ) ) ( not ( = ?auto_44624 ?auto_44619 ) ) ( HOIST-AT ?auto_44621 ?auto_44619 ) ( not ( = ?auto_44617 ?auto_44621 ) ) ( not ( = ?auto_44610 ?auto_44621 ) ) ( AVAILABLE ?auto_44621 ) ( SURFACE-AT ?auto_44613 ?auto_44619 ) ( ON ?auto_44613 ?auto_44625 ) ( CLEAR ?auto_44613 ) ( not ( = ?auto_44608 ?auto_44625 ) ) ( not ( = ?auto_44609 ?auto_44625 ) ) ( not ( = ?auto_44623 ?auto_44625 ) ) ( not ( = ?auto_44613 ?auto_44625 ) ) ( not ( = ?auto_44611 ?auto_44625 ) ) ( not ( = ?auto_44616 ?auto_44625 ) ) ( IS-CRATE ?auto_44616 ) ( not ( = ?auto_44608 ?auto_44622 ) ) ( not ( = ?auto_44609 ?auto_44622 ) ) ( not ( = ?auto_44623 ?auto_44622 ) ) ( not ( = ?auto_44613 ?auto_44622 ) ) ( not ( = ?auto_44611 ?auto_44622 ) ) ( not ( = ?auto_44616 ?auto_44622 ) ) ( not ( = ?auto_44625 ?auto_44622 ) ) ( not ( = ?auto_44626 ?auto_44618 ) ) ( not ( = ?auto_44624 ?auto_44626 ) ) ( not ( = ?auto_44619 ?auto_44626 ) ) ( HOIST-AT ?auto_44620 ?auto_44626 ) ( not ( = ?auto_44617 ?auto_44620 ) ) ( not ( = ?auto_44610 ?auto_44620 ) ) ( not ( = ?auto_44621 ?auto_44620 ) ) ( AVAILABLE ?auto_44620 ) ( SURFACE-AT ?auto_44616 ?auto_44626 ) ( ON ?auto_44616 ?auto_44615 ) ( CLEAR ?auto_44616 ) ( not ( = ?auto_44608 ?auto_44615 ) ) ( not ( = ?auto_44609 ?auto_44615 ) ) ( not ( = ?auto_44623 ?auto_44615 ) ) ( not ( = ?auto_44613 ?auto_44615 ) ) ( not ( = ?auto_44611 ?auto_44615 ) ) ( not ( = ?auto_44616 ?auto_44615 ) ) ( not ( = ?auto_44625 ?auto_44615 ) ) ( not ( = ?auto_44622 ?auto_44615 ) ) ( TRUCK-AT ?auto_44612 ?auto_44618 ) ( SURFACE-AT ?auto_44614 ?auto_44618 ) ( CLEAR ?auto_44614 ) ( IS-CRATE ?auto_44622 ) ( not ( = ?auto_44608 ?auto_44614 ) ) ( not ( = ?auto_44609 ?auto_44614 ) ) ( not ( = ?auto_44623 ?auto_44614 ) ) ( not ( = ?auto_44613 ?auto_44614 ) ) ( not ( = ?auto_44611 ?auto_44614 ) ) ( not ( = ?auto_44616 ?auto_44614 ) ) ( not ( = ?auto_44625 ?auto_44614 ) ) ( not ( = ?auto_44622 ?auto_44614 ) ) ( not ( = ?auto_44615 ?auto_44614 ) ) ( AVAILABLE ?auto_44617 ) ( IN ?auto_44622 ?auto_44612 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44617 ?auto_44622 ?auto_44612 ?auto_44618 )
      ( MAKE-ON ?auto_44608 ?auto_44609 )
      ( MAKE-ON-VERIFY ?auto_44608 ?auto_44609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44627 - SURFACE
      ?auto_44628 - SURFACE
    )
    :vars
    (
      ?auto_44631 - HOIST
      ?auto_44645 - PLACE
      ?auto_44633 - PLACE
      ?auto_44632 - HOIST
      ?auto_44634 - SURFACE
      ?auto_44643 - SURFACE
      ?auto_44637 - SURFACE
      ?auto_44638 - SURFACE
      ?auto_44630 - PLACE
      ?auto_44642 - HOIST
      ?auto_44639 - SURFACE
      ?auto_44644 - SURFACE
      ?auto_44640 - PLACE
      ?auto_44636 - HOIST
      ?auto_44641 - SURFACE
      ?auto_44635 - SURFACE
      ?auto_44629 - TRUCK
      ?auto_44646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44631 ?auto_44645 ) ( IS-CRATE ?auto_44627 ) ( not ( = ?auto_44627 ?auto_44628 ) ) ( not ( = ?auto_44633 ?auto_44645 ) ) ( HOIST-AT ?auto_44632 ?auto_44633 ) ( not ( = ?auto_44631 ?auto_44632 ) ) ( SURFACE-AT ?auto_44627 ?auto_44633 ) ( ON ?auto_44627 ?auto_44634 ) ( CLEAR ?auto_44627 ) ( not ( = ?auto_44627 ?auto_44634 ) ) ( not ( = ?auto_44628 ?auto_44634 ) ) ( IS-CRATE ?auto_44628 ) ( not ( = ?auto_44627 ?auto_44643 ) ) ( not ( = ?auto_44628 ?auto_44643 ) ) ( not ( = ?auto_44634 ?auto_44643 ) ) ( AVAILABLE ?auto_44632 ) ( SURFACE-AT ?auto_44628 ?auto_44633 ) ( ON ?auto_44628 ?auto_44637 ) ( CLEAR ?auto_44628 ) ( not ( = ?auto_44627 ?auto_44637 ) ) ( not ( = ?auto_44628 ?auto_44637 ) ) ( not ( = ?auto_44634 ?auto_44637 ) ) ( not ( = ?auto_44643 ?auto_44637 ) ) ( IS-CRATE ?auto_44643 ) ( not ( = ?auto_44627 ?auto_44638 ) ) ( not ( = ?auto_44628 ?auto_44638 ) ) ( not ( = ?auto_44634 ?auto_44638 ) ) ( not ( = ?auto_44643 ?auto_44638 ) ) ( not ( = ?auto_44637 ?auto_44638 ) ) ( not ( = ?auto_44630 ?auto_44645 ) ) ( not ( = ?auto_44633 ?auto_44630 ) ) ( HOIST-AT ?auto_44642 ?auto_44630 ) ( not ( = ?auto_44631 ?auto_44642 ) ) ( not ( = ?auto_44632 ?auto_44642 ) ) ( AVAILABLE ?auto_44642 ) ( SURFACE-AT ?auto_44643 ?auto_44630 ) ( ON ?auto_44643 ?auto_44639 ) ( CLEAR ?auto_44643 ) ( not ( = ?auto_44627 ?auto_44639 ) ) ( not ( = ?auto_44628 ?auto_44639 ) ) ( not ( = ?auto_44634 ?auto_44639 ) ) ( not ( = ?auto_44643 ?auto_44639 ) ) ( not ( = ?auto_44637 ?auto_44639 ) ) ( not ( = ?auto_44638 ?auto_44639 ) ) ( IS-CRATE ?auto_44638 ) ( not ( = ?auto_44627 ?auto_44644 ) ) ( not ( = ?auto_44628 ?auto_44644 ) ) ( not ( = ?auto_44634 ?auto_44644 ) ) ( not ( = ?auto_44643 ?auto_44644 ) ) ( not ( = ?auto_44637 ?auto_44644 ) ) ( not ( = ?auto_44638 ?auto_44644 ) ) ( not ( = ?auto_44639 ?auto_44644 ) ) ( not ( = ?auto_44640 ?auto_44645 ) ) ( not ( = ?auto_44633 ?auto_44640 ) ) ( not ( = ?auto_44630 ?auto_44640 ) ) ( HOIST-AT ?auto_44636 ?auto_44640 ) ( not ( = ?auto_44631 ?auto_44636 ) ) ( not ( = ?auto_44632 ?auto_44636 ) ) ( not ( = ?auto_44642 ?auto_44636 ) ) ( AVAILABLE ?auto_44636 ) ( SURFACE-AT ?auto_44638 ?auto_44640 ) ( ON ?auto_44638 ?auto_44641 ) ( CLEAR ?auto_44638 ) ( not ( = ?auto_44627 ?auto_44641 ) ) ( not ( = ?auto_44628 ?auto_44641 ) ) ( not ( = ?auto_44634 ?auto_44641 ) ) ( not ( = ?auto_44643 ?auto_44641 ) ) ( not ( = ?auto_44637 ?auto_44641 ) ) ( not ( = ?auto_44638 ?auto_44641 ) ) ( not ( = ?auto_44639 ?auto_44641 ) ) ( not ( = ?auto_44644 ?auto_44641 ) ) ( SURFACE-AT ?auto_44635 ?auto_44645 ) ( CLEAR ?auto_44635 ) ( IS-CRATE ?auto_44644 ) ( not ( = ?auto_44627 ?auto_44635 ) ) ( not ( = ?auto_44628 ?auto_44635 ) ) ( not ( = ?auto_44634 ?auto_44635 ) ) ( not ( = ?auto_44643 ?auto_44635 ) ) ( not ( = ?auto_44637 ?auto_44635 ) ) ( not ( = ?auto_44638 ?auto_44635 ) ) ( not ( = ?auto_44639 ?auto_44635 ) ) ( not ( = ?auto_44644 ?auto_44635 ) ) ( not ( = ?auto_44641 ?auto_44635 ) ) ( AVAILABLE ?auto_44631 ) ( IN ?auto_44644 ?auto_44629 ) ( TRUCK-AT ?auto_44629 ?auto_44646 ) ( not ( = ?auto_44646 ?auto_44645 ) ) ( not ( = ?auto_44633 ?auto_44646 ) ) ( not ( = ?auto_44630 ?auto_44646 ) ) ( not ( = ?auto_44640 ?auto_44646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44629 ?auto_44646 ?auto_44645 )
      ( MAKE-ON ?auto_44627 ?auto_44628 )
      ( MAKE-ON-VERIFY ?auto_44627 ?auto_44628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44647 - SURFACE
      ?auto_44648 - SURFACE
    )
    :vars
    (
      ?auto_44664 - HOIST
      ?auto_44657 - PLACE
      ?auto_44656 - PLACE
      ?auto_44661 - HOIST
      ?auto_44660 - SURFACE
      ?auto_44666 - SURFACE
      ?auto_44663 - SURFACE
      ?auto_44653 - SURFACE
      ?auto_44659 - PLACE
      ?auto_44665 - HOIST
      ?auto_44658 - SURFACE
      ?auto_44654 - SURFACE
      ?auto_44652 - PLACE
      ?auto_44651 - HOIST
      ?auto_44650 - SURFACE
      ?auto_44649 - SURFACE
      ?auto_44655 - TRUCK
      ?auto_44662 - PLACE
      ?auto_44667 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44664 ?auto_44657 ) ( IS-CRATE ?auto_44647 ) ( not ( = ?auto_44647 ?auto_44648 ) ) ( not ( = ?auto_44656 ?auto_44657 ) ) ( HOIST-AT ?auto_44661 ?auto_44656 ) ( not ( = ?auto_44664 ?auto_44661 ) ) ( SURFACE-AT ?auto_44647 ?auto_44656 ) ( ON ?auto_44647 ?auto_44660 ) ( CLEAR ?auto_44647 ) ( not ( = ?auto_44647 ?auto_44660 ) ) ( not ( = ?auto_44648 ?auto_44660 ) ) ( IS-CRATE ?auto_44648 ) ( not ( = ?auto_44647 ?auto_44666 ) ) ( not ( = ?auto_44648 ?auto_44666 ) ) ( not ( = ?auto_44660 ?auto_44666 ) ) ( AVAILABLE ?auto_44661 ) ( SURFACE-AT ?auto_44648 ?auto_44656 ) ( ON ?auto_44648 ?auto_44663 ) ( CLEAR ?auto_44648 ) ( not ( = ?auto_44647 ?auto_44663 ) ) ( not ( = ?auto_44648 ?auto_44663 ) ) ( not ( = ?auto_44660 ?auto_44663 ) ) ( not ( = ?auto_44666 ?auto_44663 ) ) ( IS-CRATE ?auto_44666 ) ( not ( = ?auto_44647 ?auto_44653 ) ) ( not ( = ?auto_44648 ?auto_44653 ) ) ( not ( = ?auto_44660 ?auto_44653 ) ) ( not ( = ?auto_44666 ?auto_44653 ) ) ( not ( = ?auto_44663 ?auto_44653 ) ) ( not ( = ?auto_44659 ?auto_44657 ) ) ( not ( = ?auto_44656 ?auto_44659 ) ) ( HOIST-AT ?auto_44665 ?auto_44659 ) ( not ( = ?auto_44664 ?auto_44665 ) ) ( not ( = ?auto_44661 ?auto_44665 ) ) ( AVAILABLE ?auto_44665 ) ( SURFACE-AT ?auto_44666 ?auto_44659 ) ( ON ?auto_44666 ?auto_44658 ) ( CLEAR ?auto_44666 ) ( not ( = ?auto_44647 ?auto_44658 ) ) ( not ( = ?auto_44648 ?auto_44658 ) ) ( not ( = ?auto_44660 ?auto_44658 ) ) ( not ( = ?auto_44666 ?auto_44658 ) ) ( not ( = ?auto_44663 ?auto_44658 ) ) ( not ( = ?auto_44653 ?auto_44658 ) ) ( IS-CRATE ?auto_44653 ) ( not ( = ?auto_44647 ?auto_44654 ) ) ( not ( = ?auto_44648 ?auto_44654 ) ) ( not ( = ?auto_44660 ?auto_44654 ) ) ( not ( = ?auto_44666 ?auto_44654 ) ) ( not ( = ?auto_44663 ?auto_44654 ) ) ( not ( = ?auto_44653 ?auto_44654 ) ) ( not ( = ?auto_44658 ?auto_44654 ) ) ( not ( = ?auto_44652 ?auto_44657 ) ) ( not ( = ?auto_44656 ?auto_44652 ) ) ( not ( = ?auto_44659 ?auto_44652 ) ) ( HOIST-AT ?auto_44651 ?auto_44652 ) ( not ( = ?auto_44664 ?auto_44651 ) ) ( not ( = ?auto_44661 ?auto_44651 ) ) ( not ( = ?auto_44665 ?auto_44651 ) ) ( AVAILABLE ?auto_44651 ) ( SURFACE-AT ?auto_44653 ?auto_44652 ) ( ON ?auto_44653 ?auto_44650 ) ( CLEAR ?auto_44653 ) ( not ( = ?auto_44647 ?auto_44650 ) ) ( not ( = ?auto_44648 ?auto_44650 ) ) ( not ( = ?auto_44660 ?auto_44650 ) ) ( not ( = ?auto_44666 ?auto_44650 ) ) ( not ( = ?auto_44663 ?auto_44650 ) ) ( not ( = ?auto_44653 ?auto_44650 ) ) ( not ( = ?auto_44658 ?auto_44650 ) ) ( not ( = ?auto_44654 ?auto_44650 ) ) ( SURFACE-AT ?auto_44649 ?auto_44657 ) ( CLEAR ?auto_44649 ) ( IS-CRATE ?auto_44654 ) ( not ( = ?auto_44647 ?auto_44649 ) ) ( not ( = ?auto_44648 ?auto_44649 ) ) ( not ( = ?auto_44660 ?auto_44649 ) ) ( not ( = ?auto_44666 ?auto_44649 ) ) ( not ( = ?auto_44663 ?auto_44649 ) ) ( not ( = ?auto_44653 ?auto_44649 ) ) ( not ( = ?auto_44658 ?auto_44649 ) ) ( not ( = ?auto_44654 ?auto_44649 ) ) ( not ( = ?auto_44650 ?auto_44649 ) ) ( AVAILABLE ?auto_44664 ) ( TRUCK-AT ?auto_44655 ?auto_44662 ) ( not ( = ?auto_44662 ?auto_44657 ) ) ( not ( = ?auto_44656 ?auto_44662 ) ) ( not ( = ?auto_44659 ?auto_44662 ) ) ( not ( = ?auto_44652 ?auto_44662 ) ) ( HOIST-AT ?auto_44667 ?auto_44662 ) ( LIFTING ?auto_44667 ?auto_44654 ) ( not ( = ?auto_44664 ?auto_44667 ) ) ( not ( = ?auto_44661 ?auto_44667 ) ) ( not ( = ?auto_44665 ?auto_44667 ) ) ( not ( = ?auto_44651 ?auto_44667 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44667 ?auto_44654 ?auto_44655 ?auto_44662 )
      ( MAKE-ON ?auto_44647 ?auto_44648 )
      ( MAKE-ON-VERIFY ?auto_44647 ?auto_44648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44668 - SURFACE
      ?auto_44669 - SURFACE
    )
    :vars
    (
      ?auto_44677 - HOIST
      ?auto_44682 - PLACE
      ?auto_44685 - PLACE
      ?auto_44688 - HOIST
      ?auto_44676 - SURFACE
      ?auto_44671 - SURFACE
      ?auto_44684 - SURFACE
      ?auto_44680 - SURFACE
      ?auto_44679 - PLACE
      ?auto_44673 - HOIST
      ?auto_44687 - SURFACE
      ?auto_44674 - SURFACE
      ?auto_44683 - PLACE
      ?auto_44670 - HOIST
      ?auto_44675 - SURFACE
      ?auto_44678 - SURFACE
      ?auto_44681 - TRUCK
      ?auto_44686 - PLACE
      ?auto_44672 - HOIST
      ?auto_44689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44677 ?auto_44682 ) ( IS-CRATE ?auto_44668 ) ( not ( = ?auto_44668 ?auto_44669 ) ) ( not ( = ?auto_44685 ?auto_44682 ) ) ( HOIST-AT ?auto_44688 ?auto_44685 ) ( not ( = ?auto_44677 ?auto_44688 ) ) ( SURFACE-AT ?auto_44668 ?auto_44685 ) ( ON ?auto_44668 ?auto_44676 ) ( CLEAR ?auto_44668 ) ( not ( = ?auto_44668 ?auto_44676 ) ) ( not ( = ?auto_44669 ?auto_44676 ) ) ( IS-CRATE ?auto_44669 ) ( not ( = ?auto_44668 ?auto_44671 ) ) ( not ( = ?auto_44669 ?auto_44671 ) ) ( not ( = ?auto_44676 ?auto_44671 ) ) ( AVAILABLE ?auto_44688 ) ( SURFACE-AT ?auto_44669 ?auto_44685 ) ( ON ?auto_44669 ?auto_44684 ) ( CLEAR ?auto_44669 ) ( not ( = ?auto_44668 ?auto_44684 ) ) ( not ( = ?auto_44669 ?auto_44684 ) ) ( not ( = ?auto_44676 ?auto_44684 ) ) ( not ( = ?auto_44671 ?auto_44684 ) ) ( IS-CRATE ?auto_44671 ) ( not ( = ?auto_44668 ?auto_44680 ) ) ( not ( = ?auto_44669 ?auto_44680 ) ) ( not ( = ?auto_44676 ?auto_44680 ) ) ( not ( = ?auto_44671 ?auto_44680 ) ) ( not ( = ?auto_44684 ?auto_44680 ) ) ( not ( = ?auto_44679 ?auto_44682 ) ) ( not ( = ?auto_44685 ?auto_44679 ) ) ( HOIST-AT ?auto_44673 ?auto_44679 ) ( not ( = ?auto_44677 ?auto_44673 ) ) ( not ( = ?auto_44688 ?auto_44673 ) ) ( AVAILABLE ?auto_44673 ) ( SURFACE-AT ?auto_44671 ?auto_44679 ) ( ON ?auto_44671 ?auto_44687 ) ( CLEAR ?auto_44671 ) ( not ( = ?auto_44668 ?auto_44687 ) ) ( not ( = ?auto_44669 ?auto_44687 ) ) ( not ( = ?auto_44676 ?auto_44687 ) ) ( not ( = ?auto_44671 ?auto_44687 ) ) ( not ( = ?auto_44684 ?auto_44687 ) ) ( not ( = ?auto_44680 ?auto_44687 ) ) ( IS-CRATE ?auto_44680 ) ( not ( = ?auto_44668 ?auto_44674 ) ) ( not ( = ?auto_44669 ?auto_44674 ) ) ( not ( = ?auto_44676 ?auto_44674 ) ) ( not ( = ?auto_44671 ?auto_44674 ) ) ( not ( = ?auto_44684 ?auto_44674 ) ) ( not ( = ?auto_44680 ?auto_44674 ) ) ( not ( = ?auto_44687 ?auto_44674 ) ) ( not ( = ?auto_44683 ?auto_44682 ) ) ( not ( = ?auto_44685 ?auto_44683 ) ) ( not ( = ?auto_44679 ?auto_44683 ) ) ( HOIST-AT ?auto_44670 ?auto_44683 ) ( not ( = ?auto_44677 ?auto_44670 ) ) ( not ( = ?auto_44688 ?auto_44670 ) ) ( not ( = ?auto_44673 ?auto_44670 ) ) ( AVAILABLE ?auto_44670 ) ( SURFACE-AT ?auto_44680 ?auto_44683 ) ( ON ?auto_44680 ?auto_44675 ) ( CLEAR ?auto_44680 ) ( not ( = ?auto_44668 ?auto_44675 ) ) ( not ( = ?auto_44669 ?auto_44675 ) ) ( not ( = ?auto_44676 ?auto_44675 ) ) ( not ( = ?auto_44671 ?auto_44675 ) ) ( not ( = ?auto_44684 ?auto_44675 ) ) ( not ( = ?auto_44680 ?auto_44675 ) ) ( not ( = ?auto_44687 ?auto_44675 ) ) ( not ( = ?auto_44674 ?auto_44675 ) ) ( SURFACE-AT ?auto_44678 ?auto_44682 ) ( CLEAR ?auto_44678 ) ( IS-CRATE ?auto_44674 ) ( not ( = ?auto_44668 ?auto_44678 ) ) ( not ( = ?auto_44669 ?auto_44678 ) ) ( not ( = ?auto_44676 ?auto_44678 ) ) ( not ( = ?auto_44671 ?auto_44678 ) ) ( not ( = ?auto_44684 ?auto_44678 ) ) ( not ( = ?auto_44680 ?auto_44678 ) ) ( not ( = ?auto_44687 ?auto_44678 ) ) ( not ( = ?auto_44674 ?auto_44678 ) ) ( not ( = ?auto_44675 ?auto_44678 ) ) ( AVAILABLE ?auto_44677 ) ( TRUCK-AT ?auto_44681 ?auto_44686 ) ( not ( = ?auto_44686 ?auto_44682 ) ) ( not ( = ?auto_44685 ?auto_44686 ) ) ( not ( = ?auto_44679 ?auto_44686 ) ) ( not ( = ?auto_44683 ?auto_44686 ) ) ( HOIST-AT ?auto_44672 ?auto_44686 ) ( not ( = ?auto_44677 ?auto_44672 ) ) ( not ( = ?auto_44688 ?auto_44672 ) ) ( not ( = ?auto_44673 ?auto_44672 ) ) ( not ( = ?auto_44670 ?auto_44672 ) ) ( AVAILABLE ?auto_44672 ) ( SURFACE-AT ?auto_44674 ?auto_44686 ) ( ON ?auto_44674 ?auto_44689 ) ( CLEAR ?auto_44674 ) ( not ( = ?auto_44668 ?auto_44689 ) ) ( not ( = ?auto_44669 ?auto_44689 ) ) ( not ( = ?auto_44676 ?auto_44689 ) ) ( not ( = ?auto_44671 ?auto_44689 ) ) ( not ( = ?auto_44684 ?auto_44689 ) ) ( not ( = ?auto_44680 ?auto_44689 ) ) ( not ( = ?auto_44687 ?auto_44689 ) ) ( not ( = ?auto_44674 ?auto_44689 ) ) ( not ( = ?auto_44675 ?auto_44689 ) ) ( not ( = ?auto_44678 ?auto_44689 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44672 ?auto_44674 ?auto_44689 ?auto_44686 )
      ( MAKE-ON ?auto_44668 ?auto_44669 )
      ( MAKE-ON-VERIFY ?auto_44668 ?auto_44669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44690 - SURFACE
      ?auto_44691 - SURFACE
    )
    :vars
    (
      ?auto_44705 - HOIST
      ?auto_44711 - PLACE
      ?auto_44701 - PLACE
      ?auto_44708 - HOIST
      ?auto_44695 - SURFACE
      ?auto_44692 - SURFACE
      ?auto_44706 - SURFACE
      ?auto_44696 - SURFACE
      ?auto_44709 - PLACE
      ?auto_44710 - HOIST
      ?auto_44704 - SURFACE
      ?auto_44694 - SURFACE
      ?auto_44702 - PLACE
      ?auto_44699 - HOIST
      ?auto_44697 - SURFACE
      ?auto_44698 - SURFACE
      ?auto_44703 - PLACE
      ?auto_44707 - HOIST
      ?auto_44700 - SURFACE
      ?auto_44693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44705 ?auto_44711 ) ( IS-CRATE ?auto_44690 ) ( not ( = ?auto_44690 ?auto_44691 ) ) ( not ( = ?auto_44701 ?auto_44711 ) ) ( HOIST-AT ?auto_44708 ?auto_44701 ) ( not ( = ?auto_44705 ?auto_44708 ) ) ( SURFACE-AT ?auto_44690 ?auto_44701 ) ( ON ?auto_44690 ?auto_44695 ) ( CLEAR ?auto_44690 ) ( not ( = ?auto_44690 ?auto_44695 ) ) ( not ( = ?auto_44691 ?auto_44695 ) ) ( IS-CRATE ?auto_44691 ) ( not ( = ?auto_44690 ?auto_44692 ) ) ( not ( = ?auto_44691 ?auto_44692 ) ) ( not ( = ?auto_44695 ?auto_44692 ) ) ( AVAILABLE ?auto_44708 ) ( SURFACE-AT ?auto_44691 ?auto_44701 ) ( ON ?auto_44691 ?auto_44706 ) ( CLEAR ?auto_44691 ) ( not ( = ?auto_44690 ?auto_44706 ) ) ( not ( = ?auto_44691 ?auto_44706 ) ) ( not ( = ?auto_44695 ?auto_44706 ) ) ( not ( = ?auto_44692 ?auto_44706 ) ) ( IS-CRATE ?auto_44692 ) ( not ( = ?auto_44690 ?auto_44696 ) ) ( not ( = ?auto_44691 ?auto_44696 ) ) ( not ( = ?auto_44695 ?auto_44696 ) ) ( not ( = ?auto_44692 ?auto_44696 ) ) ( not ( = ?auto_44706 ?auto_44696 ) ) ( not ( = ?auto_44709 ?auto_44711 ) ) ( not ( = ?auto_44701 ?auto_44709 ) ) ( HOIST-AT ?auto_44710 ?auto_44709 ) ( not ( = ?auto_44705 ?auto_44710 ) ) ( not ( = ?auto_44708 ?auto_44710 ) ) ( AVAILABLE ?auto_44710 ) ( SURFACE-AT ?auto_44692 ?auto_44709 ) ( ON ?auto_44692 ?auto_44704 ) ( CLEAR ?auto_44692 ) ( not ( = ?auto_44690 ?auto_44704 ) ) ( not ( = ?auto_44691 ?auto_44704 ) ) ( not ( = ?auto_44695 ?auto_44704 ) ) ( not ( = ?auto_44692 ?auto_44704 ) ) ( not ( = ?auto_44706 ?auto_44704 ) ) ( not ( = ?auto_44696 ?auto_44704 ) ) ( IS-CRATE ?auto_44696 ) ( not ( = ?auto_44690 ?auto_44694 ) ) ( not ( = ?auto_44691 ?auto_44694 ) ) ( not ( = ?auto_44695 ?auto_44694 ) ) ( not ( = ?auto_44692 ?auto_44694 ) ) ( not ( = ?auto_44706 ?auto_44694 ) ) ( not ( = ?auto_44696 ?auto_44694 ) ) ( not ( = ?auto_44704 ?auto_44694 ) ) ( not ( = ?auto_44702 ?auto_44711 ) ) ( not ( = ?auto_44701 ?auto_44702 ) ) ( not ( = ?auto_44709 ?auto_44702 ) ) ( HOIST-AT ?auto_44699 ?auto_44702 ) ( not ( = ?auto_44705 ?auto_44699 ) ) ( not ( = ?auto_44708 ?auto_44699 ) ) ( not ( = ?auto_44710 ?auto_44699 ) ) ( AVAILABLE ?auto_44699 ) ( SURFACE-AT ?auto_44696 ?auto_44702 ) ( ON ?auto_44696 ?auto_44697 ) ( CLEAR ?auto_44696 ) ( not ( = ?auto_44690 ?auto_44697 ) ) ( not ( = ?auto_44691 ?auto_44697 ) ) ( not ( = ?auto_44695 ?auto_44697 ) ) ( not ( = ?auto_44692 ?auto_44697 ) ) ( not ( = ?auto_44706 ?auto_44697 ) ) ( not ( = ?auto_44696 ?auto_44697 ) ) ( not ( = ?auto_44704 ?auto_44697 ) ) ( not ( = ?auto_44694 ?auto_44697 ) ) ( SURFACE-AT ?auto_44698 ?auto_44711 ) ( CLEAR ?auto_44698 ) ( IS-CRATE ?auto_44694 ) ( not ( = ?auto_44690 ?auto_44698 ) ) ( not ( = ?auto_44691 ?auto_44698 ) ) ( not ( = ?auto_44695 ?auto_44698 ) ) ( not ( = ?auto_44692 ?auto_44698 ) ) ( not ( = ?auto_44706 ?auto_44698 ) ) ( not ( = ?auto_44696 ?auto_44698 ) ) ( not ( = ?auto_44704 ?auto_44698 ) ) ( not ( = ?auto_44694 ?auto_44698 ) ) ( not ( = ?auto_44697 ?auto_44698 ) ) ( AVAILABLE ?auto_44705 ) ( not ( = ?auto_44703 ?auto_44711 ) ) ( not ( = ?auto_44701 ?auto_44703 ) ) ( not ( = ?auto_44709 ?auto_44703 ) ) ( not ( = ?auto_44702 ?auto_44703 ) ) ( HOIST-AT ?auto_44707 ?auto_44703 ) ( not ( = ?auto_44705 ?auto_44707 ) ) ( not ( = ?auto_44708 ?auto_44707 ) ) ( not ( = ?auto_44710 ?auto_44707 ) ) ( not ( = ?auto_44699 ?auto_44707 ) ) ( AVAILABLE ?auto_44707 ) ( SURFACE-AT ?auto_44694 ?auto_44703 ) ( ON ?auto_44694 ?auto_44700 ) ( CLEAR ?auto_44694 ) ( not ( = ?auto_44690 ?auto_44700 ) ) ( not ( = ?auto_44691 ?auto_44700 ) ) ( not ( = ?auto_44695 ?auto_44700 ) ) ( not ( = ?auto_44692 ?auto_44700 ) ) ( not ( = ?auto_44706 ?auto_44700 ) ) ( not ( = ?auto_44696 ?auto_44700 ) ) ( not ( = ?auto_44704 ?auto_44700 ) ) ( not ( = ?auto_44694 ?auto_44700 ) ) ( not ( = ?auto_44697 ?auto_44700 ) ) ( not ( = ?auto_44698 ?auto_44700 ) ) ( TRUCK-AT ?auto_44693 ?auto_44711 ) )
    :subtasks
    ( ( !DRIVE ?auto_44693 ?auto_44711 ?auto_44703 )
      ( MAKE-ON ?auto_44690 ?auto_44691 )
      ( MAKE-ON-VERIFY ?auto_44690 ?auto_44691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44712 - SURFACE
      ?auto_44713 - SURFACE
    )
    :vars
    (
      ?auto_44729 - HOIST
      ?auto_44723 - PLACE
      ?auto_44725 - PLACE
      ?auto_44719 - HOIST
      ?auto_44728 - SURFACE
      ?auto_44714 - SURFACE
      ?auto_44724 - SURFACE
      ?auto_44716 - SURFACE
      ?auto_44722 - PLACE
      ?auto_44721 - HOIST
      ?auto_44726 - SURFACE
      ?auto_44720 - SURFACE
      ?auto_44730 - PLACE
      ?auto_44718 - HOIST
      ?auto_44727 - SURFACE
      ?auto_44731 - SURFACE
      ?auto_44732 - PLACE
      ?auto_44733 - HOIST
      ?auto_44715 - SURFACE
      ?auto_44717 - TRUCK
      ?auto_44734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44729 ?auto_44723 ) ( IS-CRATE ?auto_44712 ) ( not ( = ?auto_44712 ?auto_44713 ) ) ( not ( = ?auto_44725 ?auto_44723 ) ) ( HOIST-AT ?auto_44719 ?auto_44725 ) ( not ( = ?auto_44729 ?auto_44719 ) ) ( SURFACE-AT ?auto_44712 ?auto_44725 ) ( ON ?auto_44712 ?auto_44728 ) ( CLEAR ?auto_44712 ) ( not ( = ?auto_44712 ?auto_44728 ) ) ( not ( = ?auto_44713 ?auto_44728 ) ) ( IS-CRATE ?auto_44713 ) ( not ( = ?auto_44712 ?auto_44714 ) ) ( not ( = ?auto_44713 ?auto_44714 ) ) ( not ( = ?auto_44728 ?auto_44714 ) ) ( AVAILABLE ?auto_44719 ) ( SURFACE-AT ?auto_44713 ?auto_44725 ) ( ON ?auto_44713 ?auto_44724 ) ( CLEAR ?auto_44713 ) ( not ( = ?auto_44712 ?auto_44724 ) ) ( not ( = ?auto_44713 ?auto_44724 ) ) ( not ( = ?auto_44728 ?auto_44724 ) ) ( not ( = ?auto_44714 ?auto_44724 ) ) ( IS-CRATE ?auto_44714 ) ( not ( = ?auto_44712 ?auto_44716 ) ) ( not ( = ?auto_44713 ?auto_44716 ) ) ( not ( = ?auto_44728 ?auto_44716 ) ) ( not ( = ?auto_44714 ?auto_44716 ) ) ( not ( = ?auto_44724 ?auto_44716 ) ) ( not ( = ?auto_44722 ?auto_44723 ) ) ( not ( = ?auto_44725 ?auto_44722 ) ) ( HOIST-AT ?auto_44721 ?auto_44722 ) ( not ( = ?auto_44729 ?auto_44721 ) ) ( not ( = ?auto_44719 ?auto_44721 ) ) ( AVAILABLE ?auto_44721 ) ( SURFACE-AT ?auto_44714 ?auto_44722 ) ( ON ?auto_44714 ?auto_44726 ) ( CLEAR ?auto_44714 ) ( not ( = ?auto_44712 ?auto_44726 ) ) ( not ( = ?auto_44713 ?auto_44726 ) ) ( not ( = ?auto_44728 ?auto_44726 ) ) ( not ( = ?auto_44714 ?auto_44726 ) ) ( not ( = ?auto_44724 ?auto_44726 ) ) ( not ( = ?auto_44716 ?auto_44726 ) ) ( IS-CRATE ?auto_44716 ) ( not ( = ?auto_44712 ?auto_44720 ) ) ( not ( = ?auto_44713 ?auto_44720 ) ) ( not ( = ?auto_44728 ?auto_44720 ) ) ( not ( = ?auto_44714 ?auto_44720 ) ) ( not ( = ?auto_44724 ?auto_44720 ) ) ( not ( = ?auto_44716 ?auto_44720 ) ) ( not ( = ?auto_44726 ?auto_44720 ) ) ( not ( = ?auto_44730 ?auto_44723 ) ) ( not ( = ?auto_44725 ?auto_44730 ) ) ( not ( = ?auto_44722 ?auto_44730 ) ) ( HOIST-AT ?auto_44718 ?auto_44730 ) ( not ( = ?auto_44729 ?auto_44718 ) ) ( not ( = ?auto_44719 ?auto_44718 ) ) ( not ( = ?auto_44721 ?auto_44718 ) ) ( AVAILABLE ?auto_44718 ) ( SURFACE-AT ?auto_44716 ?auto_44730 ) ( ON ?auto_44716 ?auto_44727 ) ( CLEAR ?auto_44716 ) ( not ( = ?auto_44712 ?auto_44727 ) ) ( not ( = ?auto_44713 ?auto_44727 ) ) ( not ( = ?auto_44728 ?auto_44727 ) ) ( not ( = ?auto_44714 ?auto_44727 ) ) ( not ( = ?auto_44724 ?auto_44727 ) ) ( not ( = ?auto_44716 ?auto_44727 ) ) ( not ( = ?auto_44726 ?auto_44727 ) ) ( not ( = ?auto_44720 ?auto_44727 ) ) ( IS-CRATE ?auto_44720 ) ( not ( = ?auto_44712 ?auto_44731 ) ) ( not ( = ?auto_44713 ?auto_44731 ) ) ( not ( = ?auto_44728 ?auto_44731 ) ) ( not ( = ?auto_44714 ?auto_44731 ) ) ( not ( = ?auto_44724 ?auto_44731 ) ) ( not ( = ?auto_44716 ?auto_44731 ) ) ( not ( = ?auto_44726 ?auto_44731 ) ) ( not ( = ?auto_44720 ?auto_44731 ) ) ( not ( = ?auto_44727 ?auto_44731 ) ) ( not ( = ?auto_44732 ?auto_44723 ) ) ( not ( = ?auto_44725 ?auto_44732 ) ) ( not ( = ?auto_44722 ?auto_44732 ) ) ( not ( = ?auto_44730 ?auto_44732 ) ) ( HOIST-AT ?auto_44733 ?auto_44732 ) ( not ( = ?auto_44729 ?auto_44733 ) ) ( not ( = ?auto_44719 ?auto_44733 ) ) ( not ( = ?auto_44721 ?auto_44733 ) ) ( not ( = ?auto_44718 ?auto_44733 ) ) ( AVAILABLE ?auto_44733 ) ( SURFACE-AT ?auto_44720 ?auto_44732 ) ( ON ?auto_44720 ?auto_44715 ) ( CLEAR ?auto_44720 ) ( not ( = ?auto_44712 ?auto_44715 ) ) ( not ( = ?auto_44713 ?auto_44715 ) ) ( not ( = ?auto_44728 ?auto_44715 ) ) ( not ( = ?auto_44714 ?auto_44715 ) ) ( not ( = ?auto_44724 ?auto_44715 ) ) ( not ( = ?auto_44716 ?auto_44715 ) ) ( not ( = ?auto_44726 ?auto_44715 ) ) ( not ( = ?auto_44720 ?auto_44715 ) ) ( not ( = ?auto_44727 ?auto_44715 ) ) ( not ( = ?auto_44731 ?auto_44715 ) ) ( TRUCK-AT ?auto_44717 ?auto_44723 ) ( SURFACE-AT ?auto_44734 ?auto_44723 ) ( CLEAR ?auto_44734 ) ( LIFTING ?auto_44729 ?auto_44731 ) ( IS-CRATE ?auto_44731 ) ( not ( = ?auto_44712 ?auto_44734 ) ) ( not ( = ?auto_44713 ?auto_44734 ) ) ( not ( = ?auto_44728 ?auto_44734 ) ) ( not ( = ?auto_44714 ?auto_44734 ) ) ( not ( = ?auto_44724 ?auto_44734 ) ) ( not ( = ?auto_44716 ?auto_44734 ) ) ( not ( = ?auto_44726 ?auto_44734 ) ) ( not ( = ?auto_44720 ?auto_44734 ) ) ( not ( = ?auto_44727 ?auto_44734 ) ) ( not ( = ?auto_44731 ?auto_44734 ) ) ( not ( = ?auto_44715 ?auto_44734 ) ) )
    :subtasks
    ( ( !DROP ?auto_44729 ?auto_44731 ?auto_44734 ?auto_44723 )
      ( MAKE-ON ?auto_44712 ?auto_44713 )
      ( MAKE-ON-VERIFY ?auto_44712 ?auto_44713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44735 - SURFACE
      ?auto_44736 - SURFACE
    )
    :vars
    (
      ?auto_44750 - HOIST
      ?auto_44739 - PLACE
      ?auto_44748 - PLACE
      ?auto_44741 - HOIST
      ?auto_44755 - SURFACE
      ?auto_44749 - SURFACE
      ?auto_44747 - SURFACE
      ?auto_44737 - SURFACE
      ?auto_44743 - PLACE
      ?auto_44740 - HOIST
      ?auto_44742 - SURFACE
      ?auto_44756 - SURFACE
      ?auto_44752 - PLACE
      ?auto_44745 - HOIST
      ?auto_44746 - SURFACE
      ?auto_44753 - SURFACE
      ?auto_44754 - PLACE
      ?auto_44738 - HOIST
      ?auto_44744 - SURFACE
      ?auto_44757 - TRUCK
      ?auto_44751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44750 ?auto_44739 ) ( IS-CRATE ?auto_44735 ) ( not ( = ?auto_44735 ?auto_44736 ) ) ( not ( = ?auto_44748 ?auto_44739 ) ) ( HOIST-AT ?auto_44741 ?auto_44748 ) ( not ( = ?auto_44750 ?auto_44741 ) ) ( SURFACE-AT ?auto_44735 ?auto_44748 ) ( ON ?auto_44735 ?auto_44755 ) ( CLEAR ?auto_44735 ) ( not ( = ?auto_44735 ?auto_44755 ) ) ( not ( = ?auto_44736 ?auto_44755 ) ) ( IS-CRATE ?auto_44736 ) ( not ( = ?auto_44735 ?auto_44749 ) ) ( not ( = ?auto_44736 ?auto_44749 ) ) ( not ( = ?auto_44755 ?auto_44749 ) ) ( AVAILABLE ?auto_44741 ) ( SURFACE-AT ?auto_44736 ?auto_44748 ) ( ON ?auto_44736 ?auto_44747 ) ( CLEAR ?auto_44736 ) ( not ( = ?auto_44735 ?auto_44747 ) ) ( not ( = ?auto_44736 ?auto_44747 ) ) ( not ( = ?auto_44755 ?auto_44747 ) ) ( not ( = ?auto_44749 ?auto_44747 ) ) ( IS-CRATE ?auto_44749 ) ( not ( = ?auto_44735 ?auto_44737 ) ) ( not ( = ?auto_44736 ?auto_44737 ) ) ( not ( = ?auto_44755 ?auto_44737 ) ) ( not ( = ?auto_44749 ?auto_44737 ) ) ( not ( = ?auto_44747 ?auto_44737 ) ) ( not ( = ?auto_44743 ?auto_44739 ) ) ( not ( = ?auto_44748 ?auto_44743 ) ) ( HOIST-AT ?auto_44740 ?auto_44743 ) ( not ( = ?auto_44750 ?auto_44740 ) ) ( not ( = ?auto_44741 ?auto_44740 ) ) ( AVAILABLE ?auto_44740 ) ( SURFACE-AT ?auto_44749 ?auto_44743 ) ( ON ?auto_44749 ?auto_44742 ) ( CLEAR ?auto_44749 ) ( not ( = ?auto_44735 ?auto_44742 ) ) ( not ( = ?auto_44736 ?auto_44742 ) ) ( not ( = ?auto_44755 ?auto_44742 ) ) ( not ( = ?auto_44749 ?auto_44742 ) ) ( not ( = ?auto_44747 ?auto_44742 ) ) ( not ( = ?auto_44737 ?auto_44742 ) ) ( IS-CRATE ?auto_44737 ) ( not ( = ?auto_44735 ?auto_44756 ) ) ( not ( = ?auto_44736 ?auto_44756 ) ) ( not ( = ?auto_44755 ?auto_44756 ) ) ( not ( = ?auto_44749 ?auto_44756 ) ) ( not ( = ?auto_44747 ?auto_44756 ) ) ( not ( = ?auto_44737 ?auto_44756 ) ) ( not ( = ?auto_44742 ?auto_44756 ) ) ( not ( = ?auto_44752 ?auto_44739 ) ) ( not ( = ?auto_44748 ?auto_44752 ) ) ( not ( = ?auto_44743 ?auto_44752 ) ) ( HOIST-AT ?auto_44745 ?auto_44752 ) ( not ( = ?auto_44750 ?auto_44745 ) ) ( not ( = ?auto_44741 ?auto_44745 ) ) ( not ( = ?auto_44740 ?auto_44745 ) ) ( AVAILABLE ?auto_44745 ) ( SURFACE-AT ?auto_44737 ?auto_44752 ) ( ON ?auto_44737 ?auto_44746 ) ( CLEAR ?auto_44737 ) ( not ( = ?auto_44735 ?auto_44746 ) ) ( not ( = ?auto_44736 ?auto_44746 ) ) ( not ( = ?auto_44755 ?auto_44746 ) ) ( not ( = ?auto_44749 ?auto_44746 ) ) ( not ( = ?auto_44747 ?auto_44746 ) ) ( not ( = ?auto_44737 ?auto_44746 ) ) ( not ( = ?auto_44742 ?auto_44746 ) ) ( not ( = ?auto_44756 ?auto_44746 ) ) ( IS-CRATE ?auto_44756 ) ( not ( = ?auto_44735 ?auto_44753 ) ) ( not ( = ?auto_44736 ?auto_44753 ) ) ( not ( = ?auto_44755 ?auto_44753 ) ) ( not ( = ?auto_44749 ?auto_44753 ) ) ( not ( = ?auto_44747 ?auto_44753 ) ) ( not ( = ?auto_44737 ?auto_44753 ) ) ( not ( = ?auto_44742 ?auto_44753 ) ) ( not ( = ?auto_44756 ?auto_44753 ) ) ( not ( = ?auto_44746 ?auto_44753 ) ) ( not ( = ?auto_44754 ?auto_44739 ) ) ( not ( = ?auto_44748 ?auto_44754 ) ) ( not ( = ?auto_44743 ?auto_44754 ) ) ( not ( = ?auto_44752 ?auto_44754 ) ) ( HOIST-AT ?auto_44738 ?auto_44754 ) ( not ( = ?auto_44750 ?auto_44738 ) ) ( not ( = ?auto_44741 ?auto_44738 ) ) ( not ( = ?auto_44740 ?auto_44738 ) ) ( not ( = ?auto_44745 ?auto_44738 ) ) ( AVAILABLE ?auto_44738 ) ( SURFACE-AT ?auto_44756 ?auto_44754 ) ( ON ?auto_44756 ?auto_44744 ) ( CLEAR ?auto_44756 ) ( not ( = ?auto_44735 ?auto_44744 ) ) ( not ( = ?auto_44736 ?auto_44744 ) ) ( not ( = ?auto_44755 ?auto_44744 ) ) ( not ( = ?auto_44749 ?auto_44744 ) ) ( not ( = ?auto_44747 ?auto_44744 ) ) ( not ( = ?auto_44737 ?auto_44744 ) ) ( not ( = ?auto_44742 ?auto_44744 ) ) ( not ( = ?auto_44756 ?auto_44744 ) ) ( not ( = ?auto_44746 ?auto_44744 ) ) ( not ( = ?auto_44753 ?auto_44744 ) ) ( TRUCK-AT ?auto_44757 ?auto_44739 ) ( SURFACE-AT ?auto_44751 ?auto_44739 ) ( CLEAR ?auto_44751 ) ( IS-CRATE ?auto_44753 ) ( not ( = ?auto_44735 ?auto_44751 ) ) ( not ( = ?auto_44736 ?auto_44751 ) ) ( not ( = ?auto_44755 ?auto_44751 ) ) ( not ( = ?auto_44749 ?auto_44751 ) ) ( not ( = ?auto_44747 ?auto_44751 ) ) ( not ( = ?auto_44737 ?auto_44751 ) ) ( not ( = ?auto_44742 ?auto_44751 ) ) ( not ( = ?auto_44756 ?auto_44751 ) ) ( not ( = ?auto_44746 ?auto_44751 ) ) ( not ( = ?auto_44753 ?auto_44751 ) ) ( not ( = ?auto_44744 ?auto_44751 ) ) ( AVAILABLE ?auto_44750 ) ( IN ?auto_44753 ?auto_44757 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44750 ?auto_44753 ?auto_44757 ?auto_44739 )
      ( MAKE-ON ?auto_44735 ?auto_44736 )
      ( MAKE-ON-VERIFY ?auto_44735 ?auto_44736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44758 - SURFACE
      ?auto_44759 - SURFACE
    )
    :vars
    (
      ?auto_44760 - HOIST
      ?auto_44773 - PLACE
      ?auto_44762 - PLACE
      ?auto_44772 - HOIST
      ?auto_44775 - SURFACE
      ?auto_44780 - SURFACE
      ?auto_44763 - SURFACE
      ?auto_44764 - SURFACE
      ?auto_44769 - PLACE
      ?auto_44778 - HOIST
      ?auto_44774 - SURFACE
      ?auto_44771 - SURFACE
      ?auto_44777 - PLACE
      ?auto_44770 - HOIST
      ?auto_44767 - SURFACE
      ?auto_44768 - SURFACE
      ?auto_44766 - PLACE
      ?auto_44765 - HOIST
      ?auto_44761 - SURFACE
      ?auto_44779 - SURFACE
      ?auto_44776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44760 ?auto_44773 ) ( IS-CRATE ?auto_44758 ) ( not ( = ?auto_44758 ?auto_44759 ) ) ( not ( = ?auto_44762 ?auto_44773 ) ) ( HOIST-AT ?auto_44772 ?auto_44762 ) ( not ( = ?auto_44760 ?auto_44772 ) ) ( SURFACE-AT ?auto_44758 ?auto_44762 ) ( ON ?auto_44758 ?auto_44775 ) ( CLEAR ?auto_44758 ) ( not ( = ?auto_44758 ?auto_44775 ) ) ( not ( = ?auto_44759 ?auto_44775 ) ) ( IS-CRATE ?auto_44759 ) ( not ( = ?auto_44758 ?auto_44780 ) ) ( not ( = ?auto_44759 ?auto_44780 ) ) ( not ( = ?auto_44775 ?auto_44780 ) ) ( AVAILABLE ?auto_44772 ) ( SURFACE-AT ?auto_44759 ?auto_44762 ) ( ON ?auto_44759 ?auto_44763 ) ( CLEAR ?auto_44759 ) ( not ( = ?auto_44758 ?auto_44763 ) ) ( not ( = ?auto_44759 ?auto_44763 ) ) ( not ( = ?auto_44775 ?auto_44763 ) ) ( not ( = ?auto_44780 ?auto_44763 ) ) ( IS-CRATE ?auto_44780 ) ( not ( = ?auto_44758 ?auto_44764 ) ) ( not ( = ?auto_44759 ?auto_44764 ) ) ( not ( = ?auto_44775 ?auto_44764 ) ) ( not ( = ?auto_44780 ?auto_44764 ) ) ( not ( = ?auto_44763 ?auto_44764 ) ) ( not ( = ?auto_44769 ?auto_44773 ) ) ( not ( = ?auto_44762 ?auto_44769 ) ) ( HOIST-AT ?auto_44778 ?auto_44769 ) ( not ( = ?auto_44760 ?auto_44778 ) ) ( not ( = ?auto_44772 ?auto_44778 ) ) ( AVAILABLE ?auto_44778 ) ( SURFACE-AT ?auto_44780 ?auto_44769 ) ( ON ?auto_44780 ?auto_44774 ) ( CLEAR ?auto_44780 ) ( not ( = ?auto_44758 ?auto_44774 ) ) ( not ( = ?auto_44759 ?auto_44774 ) ) ( not ( = ?auto_44775 ?auto_44774 ) ) ( not ( = ?auto_44780 ?auto_44774 ) ) ( not ( = ?auto_44763 ?auto_44774 ) ) ( not ( = ?auto_44764 ?auto_44774 ) ) ( IS-CRATE ?auto_44764 ) ( not ( = ?auto_44758 ?auto_44771 ) ) ( not ( = ?auto_44759 ?auto_44771 ) ) ( not ( = ?auto_44775 ?auto_44771 ) ) ( not ( = ?auto_44780 ?auto_44771 ) ) ( not ( = ?auto_44763 ?auto_44771 ) ) ( not ( = ?auto_44764 ?auto_44771 ) ) ( not ( = ?auto_44774 ?auto_44771 ) ) ( not ( = ?auto_44777 ?auto_44773 ) ) ( not ( = ?auto_44762 ?auto_44777 ) ) ( not ( = ?auto_44769 ?auto_44777 ) ) ( HOIST-AT ?auto_44770 ?auto_44777 ) ( not ( = ?auto_44760 ?auto_44770 ) ) ( not ( = ?auto_44772 ?auto_44770 ) ) ( not ( = ?auto_44778 ?auto_44770 ) ) ( AVAILABLE ?auto_44770 ) ( SURFACE-AT ?auto_44764 ?auto_44777 ) ( ON ?auto_44764 ?auto_44767 ) ( CLEAR ?auto_44764 ) ( not ( = ?auto_44758 ?auto_44767 ) ) ( not ( = ?auto_44759 ?auto_44767 ) ) ( not ( = ?auto_44775 ?auto_44767 ) ) ( not ( = ?auto_44780 ?auto_44767 ) ) ( not ( = ?auto_44763 ?auto_44767 ) ) ( not ( = ?auto_44764 ?auto_44767 ) ) ( not ( = ?auto_44774 ?auto_44767 ) ) ( not ( = ?auto_44771 ?auto_44767 ) ) ( IS-CRATE ?auto_44771 ) ( not ( = ?auto_44758 ?auto_44768 ) ) ( not ( = ?auto_44759 ?auto_44768 ) ) ( not ( = ?auto_44775 ?auto_44768 ) ) ( not ( = ?auto_44780 ?auto_44768 ) ) ( not ( = ?auto_44763 ?auto_44768 ) ) ( not ( = ?auto_44764 ?auto_44768 ) ) ( not ( = ?auto_44774 ?auto_44768 ) ) ( not ( = ?auto_44771 ?auto_44768 ) ) ( not ( = ?auto_44767 ?auto_44768 ) ) ( not ( = ?auto_44766 ?auto_44773 ) ) ( not ( = ?auto_44762 ?auto_44766 ) ) ( not ( = ?auto_44769 ?auto_44766 ) ) ( not ( = ?auto_44777 ?auto_44766 ) ) ( HOIST-AT ?auto_44765 ?auto_44766 ) ( not ( = ?auto_44760 ?auto_44765 ) ) ( not ( = ?auto_44772 ?auto_44765 ) ) ( not ( = ?auto_44778 ?auto_44765 ) ) ( not ( = ?auto_44770 ?auto_44765 ) ) ( AVAILABLE ?auto_44765 ) ( SURFACE-AT ?auto_44771 ?auto_44766 ) ( ON ?auto_44771 ?auto_44761 ) ( CLEAR ?auto_44771 ) ( not ( = ?auto_44758 ?auto_44761 ) ) ( not ( = ?auto_44759 ?auto_44761 ) ) ( not ( = ?auto_44775 ?auto_44761 ) ) ( not ( = ?auto_44780 ?auto_44761 ) ) ( not ( = ?auto_44763 ?auto_44761 ) ) ( not ( = ?auto_44764 ?auto_44761 ) ) ( not ( = ?auto_44774 ?auto_44761 ) ) ( not ( = ?auto_44771 ?auto_44761 ) ) ( not ( = ?auto_44767 ?auto_44761 ) ) ( not ( = ?auto_44768 ?auto_44761 ) ) ( SURFACE-AT ?auto_44779 ?auto_44773 ) ( CLEAR ?auto_44779 ) ( IS-CRATE ?auto_44768 ) ( not ( = ?auto_44758 ?auto_44779 ) ) ( not ( = ?auto_44759 ?auto_44779 ) ) ( not ( = ?auto_44775 ?auto_44779 ) ) ( not ( = ?auto_44780 ?auto_44779 ) ) ( not ( = ?auto_44763 ?auto_44779 ) ) ( not ( = ?auto_44764 ?auto_44779 ) ) ( not ( = ?auto_44774 ?auto_44779 ) ) ( not ( = ?auto_44771 ?auto_44779 ) ) ( not ( = ?auto_44767 ?auto_44779 ) ) ( not ( = ?auto_44768 ?auto_44779 ) ) ( not ( = ?auto_44761 ?auto_44779 ) ) ( AVAILABLE ?auto_44760 ) ( IN ?auto_44768 ?auto_44776 ) ( TRUCK-AT ?auto_44776 ?auto_44766 ) )
    :subtasks
    ( ( !DRIVE ?auto_44776 ?auto_44766 ?auto_44773 )
      ( MAKE-ON ?auto_44758 ?auto_44759 )
      ( MAKE-ON-VERIFY ?auto_44758 ?auto_44759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44781 - SURFACE
      ?auto_44782 - SURFACE
    )
    :vars
    (
      ?auto_44791 - HOIST
      ?auto_44787 - PLACE
      ?auto_44796 - PLACE
      ?auto_44795 - HOIST
      ?auto_44802 - SURFACE
      ?auto_44801 - SURFACE
      ?auto_44794 - SURFACE
      ?auto_44786 - SURFACE
      ?auto_44785 - PLACE
      ?auto_44793 - HOIST
      ?auto_44797 - SURFACE
      ?auto_44790 - SURFACE
      ?auto_44792 - PLACE
      ?auto_44783 - HOIST
      ?auto_44799 - SURFACE
      ?auto_44803 - SURFACE
      ?auto_44788 - PLACE
      ?auto_44789 - HOIST
      ?auto_44798 - SURFACE
      ?auto_44800 - SURFACE
      ?auto_44784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44791 ?auto_44787 ) ( IS-CRATE ?auto_44781 ) ( not ( = ?auto_44781 ?auto_44782 ) ) ( not ( = ?auto_44796 ?auto_44787 ) ) ( HOIST-AT ?auto_44795 ?auto_44796 ) ( not ( = ?auto_44791 ?auto_44795 ) ) ( SURFACE-AT ?auto_44781 ?auto_44796 ) ( ON ?auto_44781 ?auto_44802 ) ( CLEAR ?auto_44781 ) ( not ( = ?auto_44781 ?auto_44802 ) ) ( not ( = ?auto_44782 ?auto_44802 ) ) ( IS-CRATE ?auto_44782 ) ( not ( = ?auto_44781 ?auto_44801 ) ) ( not ( = ?auto_44782 ?auto_44801 ) ) ( not ( = ?auto_44802 ?auto_44801 ) ) ( AVAILABLE ?auto_44795 ) ( SURFACE-AT ?auto_44782 ?auto_44796 ) ( ON ?auto_44782 ?auto_44794 ) ( CLEAR ?auto_44782 ) ( not ( = ?auto_44781 ?auto_44794 ) ) ( not ( = ?auto_44782 ?auto_44794 ) ) ( not ( = ?auto_44802 ?auto_44794 ) ) ( not ( = ?auto_44801 ?auto_44794 ) ) ( IS-CRATE ?auto_44801 ) ( not ( = ?auto_44781 ?auto_44786 ) ) ( not ( = ?auto_44782 ?auto_44786 ) ) ( not ( = ?auto_44802 ?auto_44786 ) ) ( not ( = ?auto_44801 ?auto_44786 ) ) ( not ( = ?auto_44794 ?auto_44786 ) ) ( not ( = ?auto_44785 ?auto_44787 ) ) ( not ( = ?auto_44796 ?auto_44785 ) ) ( HOIST-AT ?auto_44793 ?auto_44785 ) ( not ( = ?auto_44791 ?auto_44793 ) ) ( not ( = ?auto_44795 ?auto_44793 ) ) ( AVAILABLE ?auto_44793 ) ( SURFACE-AT ?auto_44801 ?auto_44785 ) ( ON ?auto_44801 ?auto_44797 ) ( CLEAR ?auto_44801 ) ( not ( = ?auto_44781 ?auto_44797 ) ) ( not ( = ?auto_44782 ?auto_44797 ) ) ( not ( = ?auto_44802 ?auto_44797 ) ) ( not ( = ?auto_44801 ?auto_44797 ) ) ( not ( = ?auto_44794 ?auto_44797 ) ) ( not ( = ?auto_44786 ?auto_44797 ) ) ( IS-CRATE ?auto_44786 ) ( not ( = ?auto_44781 ?auto_44790 ) ) ( not ( = ?auto_44782 ?auto_44790 ) ) ( not ( = ?auto_44802 ?auto_44790 ) ) ( not ( = ?auto_44801 ?auto_44790 ) ) ( not ( = ?auto_44794 ?auto_44790 ) ) ( not ( = ?auto_44786 ?auto_44790 ) ) ( not ( = ?auto_44797 ?auto_44790 ) ) ( not ( = ?auto_44792 ?auto_44787 ) ) ( not ( = ?auto_44796 ?auto_44792 ) ) ( not ( = ?auto_44785 ?auto_44792 ) ) ( HOIST-AT ?auto_44783 ?auto_44792 ) ( not ( = ?auto_44791 ?auto_44783 ) ) ( not ( = ?auto_44795 ?auto_44783 ) ) ( not ( = ?auto_44793 ?auto_44783 ) ) ( AVAILABLE ?auto_44783 ) ( SURFACE-AT ?auto_44786 ?auto_44792 ) ( ON ?auto_44786 ?auto_44799 ) ( CLEAR ?auto_44786 ) ( not ( = ?auto_44781 ?auto_44799 ) ) ( not ( = ?auto_44782 ?auto_44799 ) ) ( not ( = ?auto_44802 ?auto_44799 ) ) ( not ( = ?auto_44801 ?auto_44799 ) ) ( not ( = ?auto_44794 ?auto_44799 ) ) ( not ( = ?auto_44786 ?auto_44799 ) ) ( not ( = ?auto_44797 ?auto_44799 ) ) ( not ( = ?auto_44790 ?auto_44799 ) ) ( IS-CRATE ?auto_44790 ) ( not ( = ?auto_44781 ?auto_44803 ) ) ( not ( = ?auto_44782 ?auto_44803 ) ) ( not ( = ?auto_44802 ?auto_44803 ) ) ( not ( = ?auto_44801 ?auto_44803 ) ) ( not ( = ?auto_44794 ?auto_44803 ) ) ( not ( = ?auto_44786 ?auto_44803 ) ) ( not ( = ?auto_44797 ?auto_44803 ) ) ( not ( = ?auto_44790 ?auto_44803 ) ) ( not ( = ?auto_44799 ?auto_44803 ) ) ( not ( = ?auto_44788 ?auto_44787 ) ) ( not ( = ?auto_44796 ?auto_44788 ) ) ( not ( = ?auto_44785 ?auto_44788 ) ) ( not ( = ?auto_44792 ?auto_44788 ) ) ( HOIST-AT ?auto_44789 ?auto_44788 ) ( not ( = ?auto_44791 ?auto_44789 ) ) ( not ( = ?auto_44795 ?auto_44789 ) ) ( not ( = ?auto_44793 ?auto_44789 ) ) ( not ( = ?auto_44783 ?auto_44789 ) ) ( SURFACE-AT ?auto_44790 ?auto_44788 ) ( ON ?auto_44790 ?auto_44798 ) ( CLEAR ?auto_44790 ) ( not ( = ?auto_44781 ?auto_44798 ) ) ( not ( = ?auto_44782 ?auto_44798 ) ) ( not ( = ?auto_44802 ?auto_44798 ) ) ( not ( = ?auto_44801 ?auto_44798 ) ) ( not ( = ?auto_44794 ?auto_44798 ) ) ( not ( = ?auto_44786 ?auto_44798 ) ) ( not ( = ?auto_44797 ?auto_44798 ) ) ( not ( = ?auto_44790 ?auto_44798 ) ) ( not ( = ?auto_44799 ?auto_44798 ) ) ( not ( = ?auto_44803 ?auto_44798 ) ) ( SURFACE-AT ?auto_44800 ?auto_44787 ) ( CLEAR ?auto_44800 ) ( IS-CRATE ?auto_44803 ) ( not ( = ?auto_44781 ?auto_44800 ) ) ( not ( = ?auto_44782 ?auto_44800 ) ) ( not ( = ?auto_44802 ?auto_44800 ) ) ( not ( = ?auto_44801 ?auto_44800 ) ) ( not ( = ?auto_44794 ?auto_44800 ) ) ( not ( = ?auto_44786 ?auto_44800 ) ) ( not ( = ?auto_44797 ?auto_44800 ) ) ( not ( = ?auto_44790 ?auto_44800 ) ) ( not ( = ?auto_44799 ?auto_44800 ) ) ( not ( = ?auto_44803 ?auto_44800 ) ) ( not ( = ?auto_44798 ?auto_44800 ) ) ( AVAILABLE ?auto_44791 ) ( TRUCK-AT ?auto_44784 ?auto_44788 ) ( LIFTING ?auto_44789 ?auto_44803 ) )
    :subtasks
    ( ( !LOAD ?auto_44789 ?auto_44803 ?auto_44784 ?auto_44788 )
      ( MAKE-ON ?auto_44781 ?auto_44782 )
      ( MAKE-ON-VERIFY ?auto_44781 ?auto_44782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44804 - SURFACE
      ?auto_44805 - SURFACE
    )
    :vars
    (
      ?auto_44810 - HOIST
      ?auto_44819 - PLACE
      ?auto_44826 - PLACE
      ?auto_44820 - HOIST
      ?auto_44813 - SURFACE
      ?auto_44811 - SURFACE
      ?auto_44821 - SURFACE
      ?auto_44818 - SURFACE
      ?auto_44816 - PLACE
      ?auto_44822 - HOIST
      ?auto_44806 - SURFACE
      ?auto_44809 - SURFACE
      ?auto_44825 - PLACE
      ?auto_44807 - HOIST
      ?auto_44808 - SURFACE
      ?auto_44812 - SURFACE
      ?auto_44815 - PLACE
      ?auto_44824 - HOIST
      ?auto_44823 - SURFACE
      ?auto_44814 - SURFACE
      ?auto_44817 - TRUCK
      ?auto_44827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44810 ?auto_44819 ) ( IS-CRATE ?auto_44804 ) ( not ( = ?auto_44804 ?auto_44805 ) ) ( not ( = ?auto_44826 ?auto_44819 ) ) ( HOIST-AT ?auto_44820 ?auto_44826 ) ( not ( = ?auto_44810 ?auto_44820 ) ) ( SURFACE-AT ?auto_44804 ?auto_44826 ) ( ON ?auto_44804 ?auto_44813 ) ( CLEAR ?auto_44804 ) ( not ( = ?auto_44804 ?auto_44813 ) ) ( not ( = ?auto_44805 ?auto_44813 ) ) ( IS-CRATE ?auto_44805 ) ( not ( = ?auto_44804 ?auto_44811 ) ) ( not ( = ?auto_44805 ?auto_44811 ) ) ( not ( = ?auto_44813 ?auto_44811 ) ) ( AVAILABLE ?auto_44820 ) ( SURFACE-AT ?auto_44805 ?auto_44826 ) ( ON ?auto_44805 ?auto_44821 ) ( CLEAR ?auto_44805 ) ( not ( = ?auto_44804 ?auto_44821 ) ) ( not ( = ?auto_44805 ?auto_44821 ) ) ( not ( = ?auto_44813 ?auto_44821 ) ) ( not ( = ?auto_44811 ?auto_44821 ) ) ( IS-CRATE ?auto_44811 ) ( not ( = ?auto_44804 ?auto_44818 ) ) ( not ( = ?auto_44805 ?auto_44818 ) ) ( not ( = ?auto_44813 ?auto_44818 ) ) ( not ( = ?auto_44811 ?auto_44818 ) ) ( not ( = ?auto_44821 ?auto_44818 ) ) ( not ( = ?auto_44816 ?auto_44819 ) ) ( not ( = ?auto_44826 ?auto_44816 ) ) ( HOIST-AT ?auto_44822 ?auto_44816 ) ( not ( = ?auto_44810 ?auto_44822 ) ) ( not ( = ?auto_44820 ?auto_44822 ) ) ( AVAILABLE ?auto_44822 ) ( SURFACE-AT ?auto_44811 ?auto_44816 ) ( ON ?auto_44811 ?auto_44806 ) ( CLEAR ?auto_44811 ) ( not ( = ?auto_44804 ?auto_44806 ) ) ( not ( = ?auto_44805 ?auto_44806 ) ) ( not ( = ?auto_44813 ?auto_44806 ) ) ( not ( = ?auto_44811 ?auto_44806 ) ) ( not ( = ?auto_44821 ?auto_44806 ) ) ( not ( = ?auto_44818 ?auto_44806 ) ) ( IS-CRATE ?auto_44818 ) ( not ( = ?auto_44804 ?auto_44809 ) ) ( not ( = ?auto_44805 ?auto_44809 ) ) ( not ( = ?auto_44813 ?auto_44809 ) ) ( not ( = ?auto_44811 ?auto_44809 ) ) ( not ( = ?auto_44821 ?auto_44809 ) ) ( not ( = ?auto_44818 ?auto_44809 ) ) ( not ( = ?auto_44806 ?auto_44809 ) ) ( not ( = ?auto_44825 ?auto_44819 ) ) ( not ( = ?auto_44826 ?auto_44825 ) ) ( not ( = ?auto_44816 ?auto_44825 ) ) ( HOIST-AT ?auto_44807 ?auto_44825 ) ( not ( = ?auto_44810 ?auto_44807 ) ) ( not ( = ?auto_44820 ?auto_44807 ) ) ( not ( = ?auto_44822 ?auto_44807 ) ) ( AVAILABLE ?auto_44807 ) ( SURFACE-AT ?auto_44818 ?auto_44825 ) ( ON ?auto_44818 ?auto_44808 ) ( CLEAR ?auto_44818 ) ( not ( = ?auto_44804 ?auto_44808 ) ) ( not ( = ?auto_44805 ?auto_44808 ) ) ( not ( = ?auto_44813 ?auto_44808 ) ) ( not ( = ?auto_44811 ?auto_44808 ) ) ( not ( = ?auto_44821 ?auto_44808 ) ) ( not ( = ?auto_44818 ?auto_44808 ) ) ( not ( = ?auto_44806 ?auto_44808 ) ) ( not ( = ?auto_44809 ?auto_44808 ) ) ( IS-CRATE ?auto_44809 ) ( not ( = ?auto_44804 ?auto_44812 ) ) ( not ( = ?auto_44805 ?auto_44812 ) ) ( not ( = ?auto_44813 ?auto_44812 ) ) ( not ( = ?auto_44811 ?auto_44812 ) ) ( not ( = ?auto_44821 ?auto_44812 ) ) ( not ( = ?auto_44818 ?auto_44812 ) ) ( not ( = ?auto_44806 ?auto_44812 ) ) ( not ( = ?auto_44809 ?auto_44812 ) ) ( not ( = ?auto_44808 ?auto_44812 ) ) ( not ( = ?auto_44815 ?auto_44819 ) ) ( not ( = ?auto_44826 ?auto_44815 ) ) ( not ( = ?auto_44816 ?auto_44815 ) ) ( not ( = ?auto_44825 ?auto_44815 ) ) ( HOIST-AT ?auto_44824 ?auto_44815 ) ( not ( = ?auto_44810 ?auto_44824 ) ) ( not ( = ?auto_44820 ?auto_44824 ) ) ( not ( = ?auto_44822 ?auto_44824 ) ) ( not ( = ?auto_44807 ?auto_44824 ) ) ( SURFACE-AT ?auto_44809 ?auto_44815 ) ( ON ?auto_44809 ?auto_44823 ) ( CLEAR ?auto_44809 ) ( not ( = ?auto_44804 ?auto_44823 ) ) ( not ( = ?auto_44805 ?auto_44823 ) ) ( not ( = ?auto_44813 ?auto_44823 ) ) ( not ( = ?auto_44811 ?auto_44823 ) ) ( not ( = ?auto_44821 ?auto_44823 ) ) ( not ( = ?auto_44818 ?auto_44823 ) ) ( not ( = ?auto_44806 ?auto_44823 ) ) ( not ( = ?auto_44809 ?auto_44823 ) ) ( not ( = ?auto_44808 ?auto_44823 ) ) ( not ( = ?auto_44812 ?auto_44823 ) ) ( SURFACE-AT ?auto_44814 ?auto_44819 ) ( CLEAR ?auto_44814 ) ( IS-CRATE ?auto_44812 ) ( not ( = ?auto_44804 ?auto_44814 ) ) ( not ( = ?auto_44805 ?auto_44814 ) ) ( not ( = ?auto_44813 ?auto_44814 ) ) ( not ( = ?auto_44811 ?auto_44814 ) ) ( not ( = ?auto_44821 ?auto_44814 ) ) ( not ( = ?auto_44818 ?auto_44814 ) ) ( not ( = ?auto_44806 ?auto_44814 ) ) ( not ( = ?auto_44809 ?auto_44814 ) ) ( not ( = ?auto_44808 ?auto_44814 ) ) ( not ( = ?auto_44812 ?auto_44814 ) ) ( not ( = ?auto_44823 ?auto_44814 ) ) ( AVAILABLE ?auto_44810 ) ( TRUCK-AT ?auto_44817 ?auto_44815 ) ( AVAILABLE ?auto_44824 ) ( SURFACE-AT ?auto_44812 ?auto_44815 ) ( ON ?auto_44812 ?auto_44827 ) ( CLEAR ?auto_44812 ) ( not ( = ?auto_44804 ?auto_44827 ) ) ( not ( = ?auto_44805 ?auto_44827 ) ) ( not ( = ?auto_44813 ?auto_44827 ) ) ( not ( = ?auto_44811 ?auto_44827 ) ) ( not ( = ?auto_44821 ?auto_44827 ) ) ( not ( = ?auto_44818 ?auto_44827 ) ) ( not ( = ?auto_44806 ?auto_44827 ) ) ( not ( = ?auto_44809 ?auto_44827 ) ) ( not ( = ?auto_44808 ?auto_44827 ) ) ( not ( = ?auto_44812 ?auto_44827 ) ) ( not ( = ?auto_44823 ?auto_44827 ) ) ( not ( = ?auto_44814 ?auto_44827 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44824 ?auto_44812 ?auto_44827 ?auto_44815 )
      ( MAKE-ON ?auto_44804 ?auto_44805 )
      ( MAKE-ON-VERIFY ?auto_44804 ?auto_44805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44828 - SURFACE
      ?auto_44829 - SURFACE
    )
    :vars
    (
      ?auto_44848 - HOIST
      ?auto_44837 - PLACE
      ?auto_44836 - PLACE
      ?auto_44842 - HOIST
      ?auto_44838 - SURFACE
      ?auto_44851 - SURFACE
      ?auto_44839 - SURFACE
      ?auto_44850 - SURFACE
      ?auto_44846 - PLACE
      ?auto_44843 - HOIST
      ?auto_44840 - SURFACE
      ?auto_44847 - SURFACE
      ?auto_44835 - PLACE
      ?auto_44833 - HOIST
      ?auto_44834 - SURFACE
      ?auto_44841 - SURFACE
      ?auto_44845 - PLACE
      ?auto_44831 - HOIST
      ?auto_44830 - SURFACE
      ?auto_44844 - SURFACE
      ?auto_44832 - SURFACE
      ?auto_44849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44848 ?auto_44837 ) ( IS-CRATE ?auto_44828 ) ( not ( = ?auto_44828 ?auto_44829 ) ) ( not ( = ?auto_44836 ?auto_44837 ) ) ( HOIST-AT ?auto_44842 ?auto_44836 ) ( not ( = ?auto_44848 ?auto_44842 ) ) ( SURFACE-AT ?auto_44828 ?auto_44836 ) ( ON ?auto_44828 ?auto_44838 ) ( CLEAR ?auto_44828 ) ( not ( = ?auto_44828 ?auto_44838 ) ) ( not ( = ?auto_44829 ?auto_44838 ) ) ( IS-CRATE ?auto_44829 ) ( not ( = ?auto_44828 ?auto_44851 ) ) ( not ( = ?auto_44829 ?auto_44851 ) ) ( not ( = ?auto_44838 ?auto_44851 ) ) ( AVAILABLE ?auto_44842 ) ( SURFACE-AT ?auto_44829 ?auto_44836 ) ( ON ?auto_44829 ?auto_44839 ) ( CLEAR ?auto_44829 ) ( not ( = ?auto_44828 ?auto_44839 ) ) ( not ( = ?auto_44829 ?auto_44839 ) ) ( not ( = ?auto_44838 ?auto_44839 ) ) ( not ( = ?auto_44851 ?auto_44839 ) ) ( IS-CRATE ?auto_44851 ) ( not ( = ?auto_44828 ?auto_44850 ) ) ( not ( = ?auto_44829 ?auto_44850 ) ) ( not ( = ?auto_44838 ?auto_44850 ) ) ( not ( = ?auto_44851 ?auto_44850 ) ) ( not ( = ?auto_44839 ?auto_44850 ) ) ( not ( = ?auto_44846 ?auto_44837 ) ) ( not ( = ?auto_44836 ?auto_44846 ) ) ( HOIST-AT ?auto_44843 ?auto_44846 ) ( not ( = ?auto_44848 ?auto_44843 ) ) ( not ( = ?auto_44842 ?auto_44843 ) ) ( AVAILABLE ?auto_44843 ) ( SURFACE-AT ?auto_44851 ?auto_44846 ) ( ON ?auto_44851 ?auto_44840 ) ( CLEAR ?auto_44851 ) ( not ( = ?auto_44828 ?auto_44840 ) ) ( not ( = ?auto_44829 ?auto_44840 ) ) ( not ( = ?auto_44838 ?auto_44840 ) ) ( not ( = ?auto_44851 ?auto_44840 ) ) ( not ( = ?auto_44839 ?auto_44840 ) ) ( not ( = ?auto_44850 ?auto_44840 ) ) ( IS-CRATE ?auto_44850 ) ( not ( = ?auto_44828 ?auto_44847 ) ) ( not ( = ?auto_44829 ?auto_44847 ) ) ( not ( = ?auto_44838 ?auto_44847 ) ) ( not ( = ?auto_44851 ?auto_44847 ) ) ( not ( = ?auto_44839 ?auto_44847 ) ) ( not ( = ?auto_44850 ?auto_44847 ) ) ( not ( = ?auto_44840 ?auto_44847 ) ) ( not ( = ?auto_44835 ?auto_44837 ) ) ( not ( = ?auto_44836 ?auto_44835 ) ) ( not ( = ?auto_44846 ?auto_44835 ) ) ( HOIST-AT ?auto_44833 ?auto_44835 ) ( not ( = ?auto_44848 ?auto_44833 ) ) ( not ( = ?auto_44842 ?auto_44833 ) ) ( not ( = ?auto_44843 ?auto_44833 ) ) ( AVAILABLE ?auto_44833 ) ( SURFACE-AT ?auto_44850 ?auto_44835 ) ( ON ?auto_44850 ?auto_44834 ) ( CLEAR ?auto_44850 ) ( not ( = ?auto_44828 ?auto_44834 ) ) ( not ( = ?auto_44829 ?auto_44834 ) ) ( not ( = ?auto_44838 ?auto_44834 ) ) ( not ( = ?auto_44851 ?auto_44834 ) ) ( not ( = ?auto_44839 ?auto_44834 ) ) ( not ( = ?auto_44850 ?auto_44834 ) ) ( not ( = ?auto_44840 ?auto_44834 ) ) ( not ( = ?auto_44847 ?auto_44834 ) ) ( IS-CRATE ?auto_44847 ) ( not ( = ?auto_44828 ?auto_44841 ) ) ( not ( = ?auto_44829 ?auto_44841 ) ) ( not ( = ?auto_44838 ?auto_44841 ) ) ( not ( = ?auto_44851 ?auto_44841 ) ) ( not ( = ?auto_44839 ?auto_44841 ) ) ( not ( = ?auto_44850 ?auto_44841 ) ) ( not ( = ?auto_44840 ?auto_44841 ) ) ( not ( = ?auto_44847 ?auto_44841 ) ) ( not ( = ?auto_44834 ?auto_44841 ) ) ( not ( = ?auto_44845 ?auto_44837 ) ) ( not ( = ?auto_44836 ?auto_44845 ) ) ( not ( = ?auto_44846 ?auto_44845 ) ) ( not ( = ?auto_44835 ?auto_44845 ) ) ( HOIST-AT ?auto_44831 ?auto_44845 ) ( not ( = ?auto_44848 ?auto_44831 ) ) ( not ( = ?auto_44842 ?auto_44831 ) ) ( not ( = ?auto_44843 ?auto_44831 ) ) ( not ( = ?auto_44833 ?auto_44831 ) ) ( SURFACE-AT ?auto_44847 ?auto_44845 ) ( ON ?auto_44847 ?auto_44830 ) ( CLEAR ?auto_44847 ) ( not ( = ?auto_44828 ?auto_44830 ) ) ( not ( = ?auto_44829 ?auto_44830 ) ) ( not ( = ?auto_44838 ?auto_44830 ) ) ( not ( = ?auto_44851 ?auto_44830 ) ) ( not ( = ?auto_44839 ?auto_44830 ) ) ( not ( = ?auto_44850 ?auto_44830 ) ) ( not ( = ?auto_44840 ?auto_44830 ) ) ( not ( = ?auto_44847 ?auto_44830 ) ) ( not ( = ?auto_44834 ?auto_44830 ) ) ( not ( = ?auto_44841 ?auto_44830 ) ) ( SURFACE-AT ?auto_44844 ?auto_44837 ) ( CLEAR ?auto_44844 ) ( IS-CRATE ?auto_44841 ) ( not ( = ?auto_44828 ?auto_44844 ) ) ( not ( = ?auto_44829 ?auto_44844 ) ) ( not ( = ?auto_44838 ?auto_44844 ) ) ( not ( = ?auto_44851 ?auto_44844 ) ) ( not ( = ?auto_44839 ?auto_44844 ) ) ( not ( = ?auto_44850 ?auto_44844 ) ) ( not ( = ?auto_44840 ?auto_44844 ) ) ( not ( = ?auto_44847 ?auto_44844 ) ) ( not ( = ?auto_44834 ?auto_44844 ) ) ( not ( = ?auto_44841 ?auto_44844 ) ) ( not ( = ?auto_44830 ?auto_44844 ) ) ( AVAILABLE ?auto_44848 ) ( AVAILABLE ?auto_44831 ) ( SURFACE-AT ?auto_44841 ?auto_44845 ) ( ON ?auto_44841 ?auto_44832 ) ( CLEAR ?auto_44841 ) ( not ( = ?auto_44828 ?auto_44832 ) ) ( not ( = ?auto_44829 ?auto_44832 ) ) ( not ( = ?auto_44838 ?auto_44832 ) ) ( not ( = ?auto_44851 ?auto_44832 ) ) ( not ( = ?auto_44839 ?auto_44832 ) ) ( not ( = ?auto_44850 ?auto_44832 ) ) ( not ( = ?auto_44840 ?auto_44832 ) ) ( not ( = ?auto_44847 ?auto_44832 ) ) ( not ( = ?auto_44834 ?auto_44832 ) ) ( not ( = ?auto_44841 ?auto_44832 ) ) ( not ( = ?auto_44830 ?auto_44832 ) ) ( not ( = ?auto_44844 ?auto_44832 ) ) ( TRUCK-AT ?auto_44849 ?auto_44837 ) )
    :subtasks
    ( ( !DRIVE ?auto_44849 ?auto_44837 ?auto_44845 )
      ( MAKE-ON ?auto_44828 ?auto_44829 )
      ( MAKE-ON-VERIFY ?auto_44828 ?auto_44829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44852 - SURFACE
      ?auto_44853 - SURFACE
    )
    :vars
    (
      ?auto_44873 - HOIST
      ?auto_44869 - PLACE
      ?auto_44862 - PLACE
      ?auto_44855 - HOIST
      ?auto_44863 - SURFACE
      ?auto_44856 - SURFACE
      ?auto_44870 - SURFACE
      ?auto_44854 - SURFACE
      ?auto_44875 - PLACE
      ?auto_44859 - HOIST
      ?auto_44866 - SURFACE
      ?auto_44874 - SURFACE
      ?auto_44861 - PLACE
      ?auto_44865 - HOIST
      ?auto_44868 - SURFACE
      ?auto_44860 - SURFACE
      ?auto_44872 - PLACE
      ?auto_44867 - HOIST
      ?auto_44871 - SURFACE
      ?auto_44858 - SURFACE
      ?auto_44857 - SURFACE
      ?auto_44864 - TRUCK
      ?auto_44876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44873 ?auto_44869 ) ( IS-CRATE ?auto_44852 ) ( not ( = ?auto_44852 ?auto_44853 ) ) ( not ( = ?auto_44862 ?auto_44869 ) ) ( HOIST-AT ?auto_44855 ?auto_44862 ) ( not ( = ?auto_44873 ?auto_44855 ) ) ( SURFACE-AT ?auto_44852 ?auto_44862 ) ( ON ?auto_44852 ?auto_44863 ) ( CLEAR ?auto_44852 ) ( not ( = ?auto_44852 ?auto_44863 ) ) ( not ( = ?auto_44853 ?auto_44863 ) ) ( IS-CRATE ?auto_44853 ) ( not ( = ?auto_44852 ?auto_44856 ) ) ( not ( = ?auto_44853 ?auto_44856 ) ) ( not ( = ?auto_44863 ?auto_44856 ) ) ( AVAILABLE ?auto_44855 ) ( SURFACE-AT ?auto_44853 ?auto_44862 ) ( ON ?auto_44853 ?auto_44870 ) ( CLEAR ?auto_44853 ) ( not ( = ?auto_44852 ?auto_44870 ) ) ( not ( = ?auto_44853 ?auto_44870 ) ) ( not ( = ?auto_44863 ?auto_44870 ) ) ( not ( = ?auto_44856 ?auto_44870 ) ) ( IS-CRATE ?auto_44856 ) ( not ( = ?auto_44852 ?auto_44854 ) ) ( not ( = ?auto_44853 ?auto_44854 ) ) ( not ( = ?auto_44863 ?auto_44854 ) ) ( not ( = ?auto_44856 ?auto_44854 ) ) ( not ( = ?auto_44870 ?auto_44854 ) ) ( not ( = ?auto_44875 ?auto_44869 ) ) ( not ( = ?auto_44862 ?auto_44875 ) ) ( HOIST-AT ?auto_44859 ?auto_44875 ) ( not ( = ?auto_44873 ?auto_44859 ) ) ( not ( = ?auto_44855 ?auto_44859 ) ) ( AVAILABLE ?auto_44859 ) ( SURFACE-AT ?auto_44856 ?auto_44875 ) ( ON ?auto_44856 ?auto_44866 ) ( CLEAR ?auto_44856 ) ( not ( = ?auto_44852 ?auto_44866 ) ) ( not ( = ?auto_44853 ?auto_44866 ) ) ( not ( = ?auto_44863 ?auto_44866 ) ) ( not ( = ?auto_44856 ?auto_44866 ) ) ( not ( = ?auto_44870 ?auto_44866 ) ) ( not ( = ?auto_44854 ?auto_44866 ) ) ( IS-CRATE ?auto_44854 ) ( not ( = ?auto_44852 ?auto_44874 ) ) ( not ( = ?auto_44853 ?auto_44874 ) ) ( not ( = ?auto_44863 ?auto_44874 ) ) ( not ( = ?auto_44856 ?auto_44874 ) ) ( not ( = ?auto_44870 ?auto_44874 ) ) ( not ( = ?auto_44854 ?auto_44874 ) ) ( not ( = ?auto_44866 ?auto_44874 ) ) ( not ( = ?auto_44861 ?auto_44869 ) ) ( not ( = ?auto_44862 ?auto_44861 ) ) ( not ( = ?auto_44875 ?auto_44861 ) ) ( HOIST-AT ?auto_44865 ?auto_44861 ) ( not ( = ?auto_44873 ?auto_44865 ) ) ( not ( = ?auto_44855 ?auto_44865 ) ) ( not ( = ?auto_44859 ?auto_44865 ) ) ( AVAILABLE ?auto_44865 ) ( SURFACE-AT ?auto_44854 ?auto_44861 ) ( ON ?auto_44854 ?auto_44868 ) ( CLEAR ?auto_44854 ) ( not ( = ?auto_44852 ?auto_44868 ) ) ( not ( = ?auto_44853 ?auto_44868 ) ) ( not ( = ?auto_44863 ?auto_44868 ) ) ( not ( = ?auto_44856 ?auto_44868 ) ) ( not ( = ?auto_44870 ?auto_44868 ) ) ( not ( = ?auto_44854 ?auto_44868 ) ) ( not ( = ?auto_44866 ?auto_44868 ) ) ( not ( = ?auto_44874 ?auto_44868 ) ) ( IS-CRATE ?auto_44874 ) ( not ( = ?auto_44852 ?auto_44860 ) ) ( not ( = ?auto_44853 ?auto_44860 ) ) ( not ( = ?auto_44863 ?auto_44860 ) ) ( not ( = ?auto_44856 ?auto_44860 ) ) ( not ( = ?auto_44870 ?auto_44860 ) ) ( not ( = ?auto_44854 ?auto_44860 ) ) ( not ( = ?auto_44866 ?auto_44860 ) ) ( not ( = ?auto_44874 ?auto_44860 ) ) ( not ( = ?auto_44868 ?auto_44860 ) ) ( not ( = ?auto_44872 ?auto_44869 ) ) ( not ( = ?auto_44862 ?auto_44872 ) ) ( not ( = ?auto_44875 ?auto_44872 ) ) ( not ( = ?auto_44861 ?auto_44872 ) ) ( HOIST-AT ?auto_44867 ?auto_44872 ) ( not ( = ?auto_44873 ?auto_44867 ) ) ( not ( = ?auto_44855 ?auto_44867 ) ) ( not ( = ?auto_44859 ?auto_44867 ) ) ( not ( = ?auto_44865 ?auto_44867 ) ) ( SURFACE-AT ?auto_44874 ?auto_44872 ) ( ON ?auto_44874 ?auto_44871 ) ( CLEAR ?auto_44874 ) ( not ( = ?auto_44852 ?auto_44871 ) ) ( not ( = ?auto_44853 ?auto_44871 ) ) ( not ( = ?auto_44863 ?auto_44871 ) ) ( not ( = ?auto_44856 ?auto_44871 ) ) ( not ( = ?auto_44870 ?auto_44871 ) ) ( not ( = ?auto_44854 ?auto_44871 ) ) ( not ( = ?auto_44866 ?auto_44871 ) ) ( not ( = ?auto_44874 ?auto_44871 ) ) ( not ( = ?auto_44868 ?auto_44871 ) ) ( not ( = ?auto_44860 ?auto_44871 ) ) ( IS-CRATE ?auto_44860 ) ( not ( = ?auto_44852 ?auto_44858 ) ) ( not ( = ?auto_44853 ?auto_44858 ) ) ( not ( = ?auto_44863 ?auto_44858 ) ) ( not ( = ?auto_44856 ?auto_44858 ) ) ( not ( = ?auto_44870 ?auto_44858 ) ) ( not ( = ?auto_44854 ?auto_44858 ) ) ( not ( = ?auto_44866 ?auto_44858 ) ) ( not ( = ?auto_44874 ?auto_44858 ) ) ( not ( = ?auto_44868 ?auto_44858 ) ) ( not ( = ?auto_44860 ?auto_44858 ) ) ( not ( = ?auto_44871 ?auto_44858 ) ) ( AVAILABLE ?auto_44867 ) ( SURFACE-AT ?auto_44860 ?auto_44872 ) ( ON ?auto_44860 ?auto_44857 ) ( CLEAR ?auto_44860 ) ( not ( = ?auto_44852 ?auto_44857 ) ) ( not ( = ?auto_44853 ?auto_44857 ) ) ( not ( = ?auto_44863 ?auto_44857 ) ) ( not ( = ?auto_44856 ?auto_44857 ) ) ( not ( = ?auto_44870 ?auto_44857 ) ) ( not ( = ?auto_44854 ?auto_44857 ) ) ( not ( = ?auto_44866 ?auto_44857 ) ) ( not ( = ?auto_44874 ?auto_44857 ) ) ( not ( = ?auto_44868 ?auto_44857 ) ) ( not ( = ?auto_44860 ?auto_44857 ) ) ( not ( = ?auto_44871 ?auto_44857 ) ) ( not ( = ?auto_44858 ?auto_44857 ) ) ( TRUCK-AT ?auto_44864 ?auto_44869 ) ( SURFACE-AT ?auto_44876 ?auto_44869 ) ( CLEAR ?auto_44876 ) ( LIFTING ?auto_44873 ?auto_44858 ) ( IS-CRATE ?auto_44858 ) ( not ( = ?auto_44852 ?auto_44876 ) ) ( not ( = ?auto_44853 ?auto_44876 ) ) ( not ( = ?auto_44863 ?auto_44876 ) ) ( not ( = ?auto_44856 ?auto_44876 ) ) ( not ( = ?auto_44870 ?auto_44876 ) ) ( not ( = ?auto_44854 ?auto_44876 ) ) ( not ( = ?auto_44866 ?auto_44876 ) ) ( not ( = ?auto_44874 ?auto_44876 ) ) ( not ( = ?auto_44868 ?auto_44876 ) ) ( not ( = ?auto_44860 ?auto_44876 ) ) ( not ( = ?auto_44871 ?auto_44876 ) ) ( not ( = ?auto_44858 ?auto_44876 ) ) ( not ( = ?auto_44857 ?auto_44876 ) ) )
    :subtasks
    ( ( !DROP ?auto_44873 ?auto_44858 ?auto_44876 ?auto_44869 )
      ( MAKE-ON ?auto_44852 ?auto_44853 )
      ( MAKE-ON-VERIFY ?auto_44852 ?auto_44853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44877 - SURFACE
      ?auto_44878 - SURFACE
    )
    :vars
    (
      ?auto_44887 - HOIST
      ?auto_44883 - PLACE
      ?auto_44879 - PLACE
      ?auto_44889 - HOIST
      ?auto_44899 - SURFACE
      ?auto_44900 - SURFACE
      ?auto_44892 - SURFACE
      ?auto_44881 - SURFACE
      ?auto_44882 - PLACE
      ?auto_44901 - HOIST
      ?auto_44885 - SURFACE
      ?auto_44888 - SURFACE
      ?auto_44898 - PLACE
      ?auto_44896 - HOIST
      ?auto_44891 - SURFACE
      ?auto_44884 - SURFACE
      ?auto_44886 - PLACE
      ?auto_44897 - HOIST
      ?auto_44893 - SURFACE
      ?auto_44890 - SURFACE
      ?auto_44895 - SURFACE
      ?auto_44894 - TRUCK
      ?auto_44880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44887 ?auto_44883 ) ( IS-CRATE ?auto_44877 ) ( not ( = ?auto_44877 ?auto_44878 ) ) ( not ( = ?auto_44879 ?auto_44883 ) ) ( HOIST-AT ?auto_44889 ?auto_44879 ) ( not ( = ?auto_44887 ?auto_44889 ) ) ( SURFACE-AT ?auto_44877 ?auto_44879 ) ( ON ?auto_44877 ?auto_44899 ) ( CLEAR ?auto_44877 ) ( not ( = ?auto_44877 ?auto_44899 ) ) ( not ( = ?auto_44878 ?auto_44899 ) ) ( IS-CRATE ?auto_44878 ) ( not ( = ?auto_44877 ?auto_44900 ) ) ( not ( = ?auto_44878 ?auto_44900 ) ) ( not ( = ?auto_44899 ?auto_44900 ) ) ( AVAILABLE ?auto_44889 ) ( SURFACE-AT ?auto_44878 ?auto_44879 ) ( ON ?auto_44878 ?auto_44892 ) ( CLEAR ?auto_44878 ) ( not ( = ?auto_44877 ?auto_44892 ) ) ( not ( = ?auto_44878 ?auto_44892 ) ) ( not ( = ?auto_44899 ?auto_44892 ) ) ( not ( = ?auto_44900 ?auto_44892 ) ) ( IS-CRATE ?auto_44900 ) ( not ( = ?auto_44877 ?auto_44881 ) ) ( not ( = ?auto_44878 ?auto_44881 ) ) ( not ( = ?auto_44899 ?auto_44881 ) ) ( not ( = ?auto_44900 ?auto_44881 ) ) ( not ( = ?auto_44892 ?auto_44881 ) ) ( not ( = ?auto_44882 ?auto_44883 ) ) ( not ( = ?auto_44879 ?auto_44882 ) ) ( HOIST-AT ?auto_44901 ?auto_44882 ) ( not ( = ?auto_44887 ?auto_44901 ) ) ( not ( = ?auto_44889 ?auto_44901 ) ) ( AVAILABLE ?auto_44901 ) ( SURFACE-AT ?auto_44900 ?auto_44882 ) ( ON ?auto_44900 ?auto_44885 ) ( CLEAR ?auto_44900 ) ( not ( = ?auto_44877 ?auto_44885 ) ) ( not ( = ?auto_44878 ?auto_44885 ) ) ( not ( = ?auto_44899 ?auto_44885 ) ) ( not ( = ?auto_44900 ?auto_44885 ) ) ( not ( = ?auto_44892 ?auto_44885 ) ) ( not ( = ?auto_44881 ?auto_44885 ) ) ( IS-CRATE ?auto_44881 ) ( not ( = ?auto_44877 ?auto_44888 ) ) ( not ( = ?auto_44878 ?auto_44888 ) ) ( not ( = ?auto_44899 ?auto_44888 ) ) ( not ( = ?auto_44900 ?auto_44888 ) ) ( not ( = ?auto_44892 ?auto_44888 ) ) ( not ( = ?auto_44881 ?auto_44888 ) ) ( not ( = ?auto_44885 ?auto_44888 ) ) ( not ( = ?auto_44898 ?auto_44883 ) ) ( not ( = ?auto_44879 ?auto_44898 ) ) ( not ( = ?auto_44882 ?auto_44898 ) ) ( HOIST-AT ?auto_44896 ?auto_44898 ) ( not ( = ?auto_44887 ?auto_44896 ) ) ( not ( = ?auto_44889 ?auto_44896 ) ) ( not ( = ?auto_44901 ?auto_44896 ) ) ( AVAILABLE ?auto_44896 ) ( SURFACE-AT ?auto_44881 ?auto_44898 ) ( ON ?auto_44881 ?auto_44891 ) ( CLEAR ?auto_44881 ) ( not ( = ?auto_44877 ?auto_44891 ) ) ( not ( = ?auto_44878 ?auto_44891 ) ) ( not ( = ?auto_44899 ?auto_44891 ) ) ( not ( = ?auto_44900 ?auto_44891 ) ) ( not ( = ?auto_44892 ?auto_44891 ) ) ( not ( = ?auto_44881 ?auto_44891 ) ) ( not ( = ?auto_44885 ?auto_44891 ) ) ( not ( = ?auto_44888 ?auto_44891 ) ) ( IS-CRATE ?auto_44888 ) ( not ( = ?auto_44877 ?auto_44884 ) ) ( not ( = ?auto_44878 ?auto_44884 ) ) ( not ( = ?auto_44899 ?auto_44884 ) ) ( not ( = ?auto_44900 ?auto_44884 ) ) ( not ( = ?auto_44892 ?auto_44884 ) ) ( not ( = ?auto_44881 ?auto_44884 ) ) ( not ( = ?auto_44885 ?auto_44884 ) ) ( not ( = ?auto_44888 ?auto_44884 ) ) ( not ( = ?auto_44891 ?auto_44884 ) ) ( not ( = ?auto_44886 ?auto_44883 ) ) ( not ( = ?auto_44879 ?auto_44886 ) ) ( not ( = ?auto_44882 ?auto_44886 ) ) ( not ( = ?auto_44898 ?auto_44886 ) ) ( HOIST-AT ?auto_44897 ?auto_44886 ) ( not ( = ?auto_44887 ?auto_44897 ) ) ( not ( = ?auto_44889 ?auto_44897 ) ) ( not ( = ?auto_44901 ?auto_44897 ) ) ( not ( = ?auto_44896 ?auto_44897 ) ) ( SURFACE-AT ?auto_44888 ?auto_44886 ) ( ON ?auto_44888 ?auto_44893 ) ( CLEAR ?auto_44888 ) ( not ( = ?auto_44877 ?auto_44893 ) ) ( not ( = ?auto_44878 ?auto_44893 ) ) ( not ( = ?auto_44899 ?auto_44893 ) ) ( not ( = ?auto_44900 ?auto_44893 ) ) ( not ( = ?auto_44892 ?auto_44893 ) ) ( not ( = ?auto_44881 ?auto_44893 ) ) ( not ( = ?auto_44885 ?auto_44893 ) ) ( not ( = ?auto_44888 ?auto_44893 ) ) ( not ( = ?auto_44891 ?auto_44893 ) ) ( not ( = ?auto_44884 ?auto_44893 ) ) ( IS-CRATE ?auto_44884 ) ( not ( = ?auto_44877 ?auto_44890 ) ) ( not ( = ?auto_44878 ?auto_44890 ) ) ( not ( = ?auto_44899 ?auto_44890 ) ) ( not ( = ?auto_44900 ?auto_44890 ) ) ( not ( = ?auto_44892 ?auto_44890 ) ) ( not ( = ?auto_44881 ?auto_44890 ) ) ( not ( = ?auto_44885 ?auto_44890 ) ) ( not ( = ?auto_44888 ?auto_44890 ) ) ( not ( = ?auto_44891 ?auto_44890 ) ) ( not ( = ?auto_44884 ?auto_44890 ) ) ( not ( = ?auto_44893 ?auto_44890 ) ) ( AVAILABLE ?auto_44897 ) ( SURFACE-AT ?auto_44884 ?auto_44886 ) ( ON ?auto_44884 ?auto_44895 ) ( CLEAR ?auto_44884 ) ( not ( = ?auto_44877 ?auto_44895 ) ) ( not ( = ?auto_44878 ?auto_44895 ) ) ( not ( = ?auto_44899 ?auto_44895 ) ) ( not ( = ?auto_44900 ?auto_44895 ) ) ( not ( = ?auto_44892 ?auto_44895 ) ) ( not ( = ?auto_44881 ?auto_44895 ) ) ( not ( = ?auto_44885 ?auto_44895 ) ) ( not ( = ?auto_44888 ?auto_44895 ) ) ( not ( = ?auto_44891 ?auto_44895 ) ) ( not ( = ?auto_44884 ?auto_44895 ) ) ( not ( = ?auto_44893 ?auto_44895 ) ) ( not ( = ?auto_44890 ?auto_44895 ) ) ( TRUCK-AT ?auto_44894 ?auto_44883 ) ( SURFACE-AT ?auto_44880 ?auto_44883 ) ( CLEAR ?auto_44880 ) ( IS-CRATE ?auto_44890 ) ( not ( = ?auto_44877 ?auto_44880 ) ) ( not ( = ?auto_44878 ?auto_44880 ) ) ( not ( = ?auto_44899 ?auto_44880 ) ) ( not ( = ?auto_44900 ?auto_44880 ) ) ( not ( = ?auto_44892 ?auto_44880 ) ) ( not ( = ?auto_44881 ?auto_44880 ) ) ( not ( = ?auto_44885 ?auto_44880 ) ) ( not ( = ?auto_44888 ?auto_44880 ) ) ( not ( = ?auto_44891 ?auto_44880 ) ) ( not ( = ?auto_44884 ?auto_44880 ) ) ( not ( = ?auto_44893 ?auto_44880 ) ) ( not ( = ?auto_44890 ?auto_44880 ) ) ( not ( = ?auto_44895 ?auto_44880 ) ) ( AVAILABLE ?auto_44887 ) ( IN ?auto_44890 ?auto_44894 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44887 ?auto_44890 ?auto_44894 ?auto_44883 )
      ( MAKE-ON ?auto_44877 ?auto_44878 )
      ( MAKE-ON-VERIFY ?auto_44877 ?auto_44878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44902 - SURFACE
      ?auto_44903 - SURFACE
    )
    :vars
    (
      ?auto_44921 - HOIST
      ?auto_44920 - PLACE
      ?auto_44904 - PLACE
      ?auto_44909 - HOIST
      ?auto_44908 - SURFACE
      ?auto_44915 - SURFACE
      ?auto_44912 - SURFACE
      ?auto_44910 - SURFACE
      ?auto_44922 - PLACE
      ?auto_44914 - HOIST
      ?auto_44907 - SURFACE
      ?auto_44926 - SURFACE
      ?auto_44911 - PLACE
      ?auto_44906 - HOIST
      ?auto_44919 - SURFACE
      ?auto_44918 - SURFACE
      ?auto_44916 - PLACE
      ?auto_44913 - HOIST
      ?auto_44905 - SURFACE
      ?auto_44924 - SURFACE
      ?auto_44925 - SURFACE
      ?auto_44923 - SURFACE
      ?auto_44917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44921 ?auto_44920 ) ( IS-CRATE ?auto_44902 ) ( not ( = ?auto_44902 ?auto_44903 ) ) ( not ( = ?auto_44904 ?auto_44920 ) ) ( HOIST-AT ?auto_44909 ?auto_44904 ) ( not ( = ?auto_44921 ?auto_44909 ) ) ( SURFACE-AT ?auto_44902 ?auto_44904 ) ( ON ?auto_44902 ?auto_44908 ) ( CLEAR ?auto_44902 ) ( not ( = ?auto_44902 ?auto_44908 ) ) ( not ( = ?auto_44903 ?auto_44908 ) ) ( IS-CRATE ?auto_44903 ) ( not ( = ?auto_44902 ?auto_44915 ) ) ( not ( = ?auto_44903 ?auto_44915 ) ) ( not ( = ?auto_44908 ?auto_44915 ) ) ( AVAILABLE ?auto_44909 ) ( SURFACE-AT ?auto_44903 ?auto_44904 ) ( ON ?auto_44903 ?auto_44912 ) ( CLEAR ?auto_44903 ) ( not ( = ?auto_44902 ?auto_44912 ) ) ( not ( = ?auto_44903 ?auto_44912 ) ) ( not ( = ?auto_44908 ?auto_44912 ) ) ( not ( = ?auto_44915 ?auto_44912 ) ) ( IS-CRATE ?auto_44915 ) ( not ( = ?auto_44902 ?auto_44910 ) ) ( not ( = ?auto_44903 ?auto_44910 ) ) ( not ( = ?auto_44908 ?auto_44910 ) ) ( not ( = ?auto_44915 ?auto_44910 ) ) ( not ( = ?auto_44912 ?auto_44910 ) ) ( not ( = ?auto_44922 ?auto_44920 ) ) ( not ( = ?auto_44904 ?auto_44922 ) ) ( HOIST-AT ?auto_44914 ?auto_44922 ) ( not ( = ?auto_44921 ?auto_44914 ) ) ( not ( = ?auto_44909 ?auto_44914 ) ) ( AVAILABLE ?auto_44914 ) ( SURFACE-AT ?auto_44915 ?auto_44922 ) ( ON ?auto_44915 ?auto_44907 ) ( CLEAR ?auto_44915 ) ( not ( = ?auto_44902 ?auto_44907 ) ) ( not ( = ?auto_44903 ?auto_44907 ) ) ( not ( = ?auto_44908 ?auto_44907 ) ) ( not ( = ?auto_44915 ?auto_44907 ) ) ( not ( = ?auto_44912 ?auto_44907 ) ) ( not ( = ?auto_44910 ?auto_44907 ) ) ( IS-CRATE ?auto_44910 ) ( not ( = ?auto_44902 ?auto_44926 ) ) ( not ( = ?auto_44903 ?auto_44926 ) ) ( not ( = ?auto_44908 ?auto_44926 ) ) ( not ( = ?auto_44915 ?auto_44926 ) ) ( not ( = ?auto_44912 ?auto_44926 ) ) ( not ( = ?auto_44910 ?auto_44926 ) ) ( not ( = ?auto_44907 ?auto_44926 ) ) ( not ( = ?auto_44911 ?auto_44920 ) ) ( not ( = ?auto_44904 ?auto_44911 ) ) ( not ( = ?auto_44922 ?auto_44911 ) ) ( HOIST-AT ?auto_44906 ?auto_44911 ) ( not ( = ?auto_44921 ?auto_44906 ) ) ( not ( = ?auto_44909 ?auto_44906 ) ) ( not ( = ?auto_44914 ?auto_44906 ) ) ( AVAILABLE ?auto_44906 ) ( SURFACE-AT ?auto_44910 ?auto_44911 ) ( ON ?auto_44910 ?auto_44919 ) ( CLEAR ?auto_44910 ) ( not ( = ?auto_44902 ?auto_44919 ) ) ( not ( = ?auto_44903 ?auto_44919 ) ) ( not ( = ?auto_44908 ?auto_44919 ) ) ( not ( = ?auto_44915 ?auto_44919 ) ) ( not ( = ?auto_44912 ?auto_44919 ) ) ( not ( = ?auto_44910 ?auto_44919 ) ) ( not ( = ?auto_44907 ?auto_44919 ) ) ( not ( = ?auto_44926 ?auto_44919 ) ) ( IS-CRATE ?auto_44926 ) ( not ( = ?auto_44902 ?auto_44918 ) ) ( not ( = ?auto_44903 ?auto_44918 ) ) ( not ( = ?auto_44908 ?auto_44918 ) ) ( not ( = ?auto_44915 ?auto_44918 ) ) ( not ( = ?auto_44912 ?auto_44918 ) ) ( not ( = ?auto_44910 ?auto_44918 ) ) ( not ( = ?auto_44907 ?auto_44918 ) ) ( not ( = ?auto_44926 ?auto_44918 ) ) ( not ( = ?auto_44919 ?auto_44918 ) ) ( not ( = ?auto_44916 ?auto_44920 ) ) ( not ( = ?auto_44904 ?auto_44916 ) ) ( not ( = ?auto_44922 ?auto_44916 ) ) ( not ( = ?auto_44911 ?auto_44916 ) ) ( HOIST-AT ?auto_44913 ?auto_44916 ) ( not ( = ?auto_44921 ?auto_44913 ) ) ( not ( = ?auto_44909 ?auto_44913 ) ) ( not ( = ?auto_44914 ?auto_44913 ) ) ( not ( = ?auto_44906 ?auto_44913 ) ) ( SURFACE-AT ?auto_44926 ?auto_44916 ) ( ON ?auto_44926 ?auto_44905 ) ( CLEAR ?auto_44926 ) ( not ( = ?auto_44902 ?auto_44905 ) ) ( not ( = ?auto_44903 ?auto_44905 ) ) ( not ( = ?auto_44908 ?auto_44905 ) ) ( not ( = ?auto_44915 ?auto_44905 ) ) ( not ( = ?auto_44912 ?auto_44905 ) ) ( not ( = ?auto_44910 ?auto_44905 ) ) ( not ( = ?auto_44907 ?auto_44905 ) ) ( not ( = ?auto_44926 ?auto_44905 ) ) ( not ( = ?auto_44919 ?auto_44905 ) ) ( not ( = ?auto_44918 ?auto_44905 ) ) ( IS-CRATE ?auto_44918 ) ( not ( = ?auto_44902 ?auto_44924 ) ) ( not ( = ?auto_44903 ?auto_44924 ) ) ( not ( = ?auto_44908 ?auto_44924 ) ) ( not ( = ?auto_44915 ?auto_44924 ) ) ( not ( = ?auto_44912 ?auto_44924 ) ) ( not ( = ?auto_44910 ?auto_44924 ) ) ( not ( = ?auto_44907 ?auto_44924 ) ) ( not ( = ?auto_44926 ?auto_44924 ) ) ( not ( = ?auto_44919 ?auto_44924 ) ) ( not ( = ?auto_44918 ?auto_44924 ) ) ( not ( = ?auto_44905 ?auto_44924 ) ) ( AVAILABLE ?auto_44913 ) ( SURFACE-AT ?auto_44918 ?auto_44916 ) ( ON ?auto_44918 ?auto_44925 ) ( CLEAR ?auto_44918 ) ( not ( = ?auto_44902 ?auto_44925 ) ) ( not ( = ?auto_44903 ?auto_44925 ) ) ( not ( = ?auto_44908 ?auto_44925 ) ) ( not ( = ?auto_44915 ?auto_44925 ) ) ( not ( = ?auto_44912 ?auto_44925 ) ) ( not ( = ?auto_44910 ?auto_44925 ) ) ( not ( = ?auto_44907 ?auto_44925 ) ) ( not ( = ?auto_44926 ?auto_44925 ) ) ( not ( = ?auto_44919 ?auto_44925 ) ) ( not ( = ?auto_44918 ?auto_44925 ) ) ( not ( = ?auto_44905 ?auto_44925 ) ) ( not ( = ?auto_44924 ?auto_44925 ) ) ( SURFACE-AT ?auto_44923 ?auto_44920 ) ( CLEAR ?auto_44923 ) ( IS-CRATE ?auto_44924 ) ( not ( = ?auto_44902 ?auto_44923 ) ) ( not ( = ?auto_44903 ?auto_44923 ) ) ( not ( = ?auto_44908 ?auto_44923 ) ) ( not ( = ?auto_44915 ?auto_44923 ) ) ( not ( = ?auto_44912 ?auto_44923 ) ) ( not ( = ?auto_44910 ?auto_44923 ) ) ( not ( = ?auto_44907 ?auto_44923 ) ) ( not ( = ?auto_44926 ?auto_44923 ) ) ( not ( = ?auto_44919 ?auto_44923 ) ) ( not ( = ?auto_44918 ?auto_44923 ) ) ( not ( = ?auto_44905 ?auto_44923 ) ) ( not ( = ?auto_44924 ?auto_44923 ) ) ( not ( = ?auto_44925 ?auto_44923 ) ) ( AVAILABLE ?auto_44921 ) ( IN ?auto_44924 ?auto_44917 ) ( TRUCK-AT ?auto_44917 ?auto_44911 ) )
    :subtasks
    ( ( !DRIVE ?auto_44917 ?auto_44911 ?auto_44920 )
      ( MAKE-ON ?auto_44902 ?auto_44903 )
      ( MAKE-ON-VERIFY ?auto_44902 ?auto_44903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44927 - SURFACE
      ?auto_44928 - SURFACE
    )
    :vars
    (
      ?auto_44948 - HOIST
      ?auto_44947 - PLACE
      ?auto_44936 - PLACE
      ?auto_44943 - HOIST
      ?auto_44951 - SURFACE
      ?auto_44944 - SURFACE
      ?auto_44942 - SURFACE
      ?auto_44946 - SURFACE
      ?auto_44930 - PLACE
      ?auto_44945 - HOIST
      ?auto_44950 - SURFACE
      ?auto_44934 - SURFACE
      ?auto_44937 - PLACE
      ?auto_44940 - HOIST
      ?auto_44935 - SURFACE
      ?auto_44929 - SURFACE
      ?auto_44941 - PLACE
      ?auto_44939 - HOIST
      ?auto_44949 - SURFACE
      ?auto_44932 - SURFACE
      ?auto_44933 - SURFACE
      ?auto_44931 - SURFACE
      ?auto_44938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44948 ?auto_44947 ) ( IS-CRATE ?auto_44927 ) ( not ( = ?auto_44927 ?auto_44928 ) ) ( not ( = ?auto_44936 ?auto_44947 ) ) ( HOIST-AT ?auto_44943 ?auto_44936 ) ( not ( = ?auto_44948 ?auto_44943 ) ) ( SURFACE-AT ?auto_44927 ?auto_44936 ) ( ON ?auto_44927 ?auto_44951 ) ( CLEAR ?auto_44927 ) ( not ( = ?auto_44927 ?auto_44951 ) ) ( not ( = ?auto_44928 ?auto_44951 ) ) ( IS-CRATE ?auto_44928 ) ( not ( = ?auto_44927 ?auto_44944 ) ) ( not ( = ?auto_44928 ?auto_44944 ) ) ( not ( = ?auto_44951 ?auto_44944 ) ) ( AVAILABLE ?auto_44943 ) ( SURFACE-AT ?auto_44928 ?auto_44936 ) ( ON ?auto_44928 ?auto_44942 ) ( CLEAR ?auto_44928 ) ( not ( = ?auto_44927 ?auto_44942 ) ) ( not ( = ?auto_44928 ?auto_44942 ) ) ( not ( = ?auto_44951 ?auto_44942 ) ) ( not ( = ?auto_44944 ?auto_44942 ) ) ( IS-CRATE ?auto_44944 ) ( not ( = ?auto_44927 ?auto_44946 ) ) ( not ( = ?auto_44928 ?auto_44946 ) ) ( not ( = ?auto_44951 ?auto_44946 ) ) ( not ( = ?auto_44944 ?auto_44946 ) ) ( not ( = ?auto_44942 ?auto_44946 ) ) ( not ( = ?auto_44930 ?auto_44947 ) ) ( not ( = ?auto_44936 ?auto_44930 ) ) ( HOIST-AT ?auto_44945 ?auto_44930 ) ( not ( = ?auto_44948 ?auto_44945 ) ) ( not ( = ?auto_44943 ?auto_44945 ) ) ( AVAILABLE ?auto_44945 ) ( SURFACE-AT ?auto_44944 ?auto_44930 ) ( ON ?auto_44944 ?auto_44950 ) ( CLEAR ?auto_44944 ) ( not ( = ?auto_44927 ?auto_44950 ) ) ( not ( = ?auto_44928 ?auto_44950 ) ) ( not ( = ?auto_44951 ?auto_44950 ) ) ( not ( = ?auto_44944 ?auto_44950 ) ) ( not ( = ?auto_44942 ?auto_44950 ) ) ( not ( = ?auto_44946 ?auto_44950 ) ) ( IS-CRATE ?auto_44946 ) ( not ( = ?auto_44927 ?auto_44934 ) ) ( not ( = ?auto_44928 ?auto_44934 ) ) ( not ( = ?auto_44951 ?auto_44934 ) ) ( not ( = ?auto_44944 ?auto_44934 ) ) ( not ( = ?auto_44942 ?auto_44934 ) ) ( not ( = ?auto_44946 ?auto_44934 ) ) ( not ( = ?auto_44950 ?auto_44934 ) ) ( not ( = ?auto_44937 ?auto_44947 ) ) ( not ( = ?auto_44936 ?auto_44937 ) ) ( not ( = ?auto_44930 ?auto_44937 ) ) ( HOIST-AT ?auto_44940 ?auto_44937 ) ( not ( = ?auto_44948 ?auto_44940 ) ) ( not ( = ?auto_44943 ?auto_44940 ) ) ( not ( = ?auto_44945 ?auto_44940 ) ) ( SURFACE-AT ?auto_44946 ?auto_44937 ) ( ON ?auto_44946 ?auto_44935 ) ( CLEAR ?auto_44946 ) ( not ( = ?auto_44927 ?auto_44935 ) ) ( not ( = ?auto_44928 ?auto_44935 ) ) ( not ( = ?auto_44951 ?auto_44935 ) ) ( not ( = ?auto_44944 ?auto_44935 ) ) ( not ( = ?auto_44942 ?auto_44935 ) ) ( not ( = ?auto_44946 ?auto_44935 ) ) ( not ( = ?auto_44950 ?auto_44935 ) ) ( not ( = ?auto_44934 ?auto_44935 ) ) ( IS-CRATE ?auto_44934 ) ( not ( = ?auto_44927 ?auto_44929 ) ) ( not ( = ?auto_44928 ?auto_44929 ) ) ( not ( = ?auto_44951 ?auto_44929 ) ) ( not ( = ?auto_44944 ?auto_44929 ) ) ( not ( = ?auto_44942 ?auto_44929 ) ) ( not ( = ?auto_44946 ?auto_44929 ) ) ( not ( = ?auto_44950 ?auto_44929 ) ) ( not ( = ?auto_44934 ?auto_44929 ) ) ( not ( = ?auto_44935 ?auto_44929 ) ) ( not ( = ?auto_44941 ?auto_44947 ) ) ( not ( = ?auto_44936 ?auto_44941 ) ) ( not ( = ?auto_44930 ?auto_44941 ) ) ( not ( = ?auto_44937 ?auto_44941 ) ) ( HOIST-AT ?auto_44939 ?auto_44941 ) ( not ( = ?auto_44948 ?auto_44939 ) ) ( not ( = ?auto_44943 ?auto_44939 ) ) ( not ( = ?auto_44945 ?auto_44939 ) ) ( not ( = ?auto_44940 ?auto_44939 ) ) ( SURFACE-AT ?auto_44934 ?auto_44941 ) ( ON ?auto_44934 ?auto_44949 ) ( CLEAR ?auto_44934 ) ( not ( = ?auto_44927 ?auto_44949 ) ) ( not ( = ?auto_44928 ?auto_44949 ) ) ( not ( = ?auto_44951 ?auto_44949 ) ) ( not ( = ?auto_44944 ?auto_44949 ) ) ( not ( = ?auto_44942 ?auto_44949 ) ) ( not ( = ?auto_44946 ?auto_44949 ) ) ( not ( = ?auto_44950 ?auto_44949 ) ) ( not ( = ?auto_44934 ?auto_44949 ) ) ( not ( = ?auto_44935 ?auto_44949 ) ) ( not ( = ?auto_44929 ?auto_44949 ) ) ( IS-CRATE ?auto_44929 ) ( not ( = ?auto_44927 ?auto_44932 ) ) ( not ( = ?auto_44928 ?auto_44932 ) ) ( not ( = ?auto_44951 ?auto_44932 ) ) ( not ( = ?auto_44944 ?auto_44932 ) ) ( not ( = ?auto_44942 ?auto_44932 ) ) ( not ( = ?auto_44946 ?auto_44932 ) ) ( not ( = ?auto_44950 ?auto_44932 ) ) ( not ( = ?auto_44934 ?auto_44932 ) ) ( not ( = ?auto_44935 ?auto_44932 ) ) ( not ( = ?auto_44929 ?auto_44932 ) ) ( not ( = ?auto_44949 ?auto_44932 ) ) ( AVAILABLE ?auto_44939 ) ( SURFACE-AT ?auto_44929 ?auto_44941 ) ( ON ?auto_44929 ?auto_44933 ) ( CLEAR ?auto_44929 ) ( not ( = ?auto_44927 ?auto_44933 ) ) ( not ( = ?auto_44928 ?auto_44933 ) ) ( not ( = ?auto_44951 ?auto_44933 ) ) ( not ( = ?auto_44944 ?auto_44933 ) ) ( not ( = ?auto_44942 ?auto_44933 ) ) ( not ( = ?auto_44946 ?auto_44933 ) ) ( not ( = ?auto_44950 ?auto_44933 ) ) ( not ( = ?auto_44934 ?auto_44933 ) ) ( not ( = ?auto_44935 ?auto_44933 ) ) ( not ( = ?auto_44929 ?auto_44933 ) ) ( not ( = ?auto_44949 ?auto_44933 ) ) ( not ( = ?auto_44932 ?auto_44933 ) ) ( SURFACE-AT ?auto_44931 ?auto_44947 ) ( CLEAR ?auto_44931 ) ( IS-CRATE ?auto_44932 ) ( not ( = ?auto_44927 ?auto_44931 ) ) ( not ( = ?auto_44928 ?auto_44931 ) ) ( not ( = ?auto_44951 ?auto_44931 ) ) ( not ( = ?auto_44944 ?auto_44931 ) ) ( not ( = ?auto_44942 ?auto_44931 ) ) ( not ( = ?auto_44946 ?auto_44931 ) ) ( not ( = ?auto_44950 ?auto_44931 ) ) ( not ( = ?auto_44934 ?auto_44931 ) ) ( not ( = ?auto_44935 ?auto_44931 ) ) ( not ( = ?auto_44929 ?auto_44931 ) ) ( not ( = ?auto_44949 ?auto_44931 ) ) ( not ( = ?auto_44932 ?auto_44931 ) ) ( not ( = ?auto_44933 ?auto_44931 ) ) ( AVAILABLE ?auto_44948 ) ( TRUCK-AT ?auto_44938 ?auto_44937 ) ( LIFTING ?auto_44940 ?auto_44932 ) )
    :subtasks
    ( ( !LOAD ?auto_44940 ?auto_44932 ?auto_44938 ?auto_44937 )
      ( MAKE-ON ?auto_44927 ?auto_44928 )
      ( MAKE-ON-VERIFY ?auto_44927 ?auto_44928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44952 - SURFACE
      ?auto_44953 - SURFACE
    )
    :vars
    (
      ?auto_44965 - HOIST
      ?auto_44967 - PLACE
      ?auto_44976 - PLACE
      ?auto_44958 - HOIST
      ?auto_44956 - SURFACE
      ?auto_44957 - SURFACE
      ?auto_44964 - SURFACE
      ?auto_44970 - SURFACE
      ?auto_44961 - PLACE
      ?auto_44969 - HOIST
      ?auto_44955 - SURFACE
      ?auto_44960 - SURFACE
      ?auto_44966 - PLACE
      ?auto_44962 - HOIST
      ?auto_44968 - SURFACE
      ?auto_44975 - SURFACE
      ?auto_44972 - PLACE
      ?auto_44959 - HOIST
      ?auto_44954 - SURFACE
      ?auto_44971 - SURFACE
      ?auto_44963 - SURFACE
      ?auto_44974 - SURFACE
      ?auto_44973 - TRUCK
      ?auto_44977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44965 ?auto_44967 ) ( IS-CRATE ?auto_44952 ) ( not ( = ?auto_44952 ?auto_44953 ) ) ( not ( = ?auto_44976 ?auto_44967 ) ) ( HOIST-AT ?auto_44958 ?auto_44976 ) ( not ( = ?auto_44965 ?auto_44958 ) ) ( SURFACE-AT ?auto_44952 ?auto_44976 ) ( ON ?auto_44952 ?auto_44956 ) ( CLEAR ?auto_44952 ) ( not ( = ?auto_44952 ?auto_44956 ) ) ( not ( = ?auto_44953 ?auto_44956 ) ) ( IS-CRATE ?auto_44953 ) ( not ( = ?auto_44952 ?auto_44957 ) ) ( not ( = ?auto_44953 ?auto_44957 ) ) ( not ( = ?auto_44956 ?auto_44957 ) ) ( AVAILABLE ?auto_44958 ) ( SURFACE-AT ?auto_44953 ?auto_44976 ) ( ON ?auto_44953 ?auto_44964 ) ( CLEAR ?auto_44953 ) ( not ( = ?auto_44952 ?auto_44964 ) ) ( not ( = ?auto_44953 ?auto_44964 ) ) ( not ( = ?auto_44956 ?auto_44964 ) ) ( not ( = ?auto_44957 ?auto_44964 ) ) ( IS-CRATE ?auto_44957 ) ( not ( = ?auto_44952 ?auto_44970 ) ) ( not ( = ?auto_44953 ?auto_44970 ) ) ( not ( = ?auto_44956 ?auto_44970 ) ) ( not ( = ?auto_44957 ?auto_44970 ) ) ( not ( = ?auto_44964 ?auto_44970 ) ) ( not ( = ?auto_44961 ?auto_44967 ) ) ( not ( = ?auto_44976 ?auto_44961 ) ) ( HOIST-AT ?auto_44969 ?auto_44961 ) ( not ( = ?auto_44965 ?auto_44969 ) ) ( not ( = ?auto_44958 ?auto_44969 ) ) ( AVAILABLE ?auto_44969 ) ( SURFACE-AT ?auto_44957 ?auto_44961 ) ( ON ?auto_44957 ?auto_44955 ) ( CLEAR ?auto_44957 ) ( not ( = ?auto_44952 ?auto_44955 ) ) ( not ( = ?auto_44953 ?auto_44955 ) ) ( not ( = ?auto_44956 ?auto_44955 ) ) ( not ( = ?auto_44957 ?auto_44955 ) ) ( not ( = ?auto_44964 ?auto_44955 ) ) ( not ( = ?auto_44970 ?auto_44955 ) ) ( IS-CRATE ?auto_44970 ) ( not ( = ?auto_44952 ?auto_44960 ) ) ( not ( = ?auto_44953 ?auto_44960 ) ) ( not ( = ?auto_44956 ?auto_44960 ) ) ( not ( = ?auto_44957 ?auto_44960 ) ) ( not ( = ?auto_44964 ?auto_44960 ) ) ( not ( = ?auto_44970 ?auto_44960 ) ) ( not ( = ?auto_44955 ?auto_44960 ) ) ( not ( = ?auto_44966 ?auto_44967 ) ) ( not ( = ?auto_44976 ?auto_44966 ) ) ( not ( = ?auto_44961 ?auto_44966 ) ) ( HOIST-AT ?auto_44962 ?auto_44966 ) ( not ( = ?auto_44965 ?auto_44962 ) ) ( not ( = ?auto_44958 ?auto_44962 ) ) ( not ( = ?auto_44969 ?auto_44962 ) ) ( SURFACE-AT ?auto_44970 ?auto_44966 ) ( ON ?auto_44970 ?auto_44968 ) ( CLEAR ?auto_44970 ) ( not ( = ?auto_44952 ?auto_44968 ) ) ( not ( = ?auto_44953 ?auto_44968 ) ) ( not ( = ?auto_44956 ?auto_44968 ) ) ( not ( = ?auto_44957 ?auto_44968 ) ) ( not ( = ?auto_44964 ?auto_44968 ) ) ( not ( = ?auto_44970 ?auto_44968 ) ) ( not ( = ?auto_44955 ?auto_44968 ) ) ( not ( = ?auto_44960 ?auto_44968 ) ) ( IS-CRATE ?auto_44960 ) ( not ( = ?auto_44952 ?auto_44975 ) ) ( not ( = ?auto_44953 ?auto_44975 ) ) ( not ( = ?auto_44956 ?auto_44975 ) ) ( not ( = ?auto_44957 ?auto_44975 ) ) ( not ( = ?auto_44964 ?auto_44975 ) ) ( not ( = ?auto_44970 ?auto_44975 ) ) ( not ( = ?auto_44955 ?auto_44975 ) ) ( not ( = ?auto_44960 ?auto_44975 ) ) ( not ( = ?auto_44968 ?auto_44975 ) ) ( not ( = ?auto_44972 ?auto_44967 ) ) ( not ( = ?auto_44976 ?auto_44972 ) ) ( not ( = ?auto_44961 ?auto_44972 ) ) ( not ( = ?auto_44966 ?auto_44972 ) ) ( HOIST-AT ?auto_44959 ?auto_44972 ) ( not ( = ?auto_44965 ?auto_44959 ) ) ( not ( = ?auto_44958 ?auto_44959 ) ) ( not ( = ?auto_44969 ?auto_44959 ) ) ( not ( = ?auto_44962 ?auto_44959 ) ) ( SURFACE-AT ?auto_44960 ?auto_44972 ) ( ON ?auto_44960 ?auto_44954 ) ( CLEAR ?auto_44960 ) ( not ( = ?auto_44952 ?auto_44954 ) ) ( not ( = ?auto_44953 ?auto_44954 ) ) ( not ( = ?auto_44956 ?auto_44954 ) ) ( not ( = ?auto_44957 ?auto_44954 ) ) ( not ( = ?auto_44964 ?auto_44954 ) ) ( not ( = ?auto_44970 ?auto_44954 ) ) ( not ( = ?auto_44955 ?auto_44954 ) ) ( not ( = ?auto_44960 ?auto_44954 ) ) ( not ( = ?auto_44968 ?auto_44954 ) ) ( not ( = ?auto_44975 ?auto_44954 ) ) ( IS-CRATE ?auto_44975 ) ( not ( = ?auto_44952 ?auto_44971 ) ) ( not ( = ?auto_44953 ?auto_44971 ) ) ( not ( = ?auto_44956 ?auto_44971 ) ) ( not ( = ?auto_44957 ?auto_44971 ) ) ( not ( = ?auto_44964 ?auto_44971 ) ) ( not ( = ?auto_44970 ?auto_44971 ) ) ( not ( = ?auto_44955 ?auto_44971 ) ) ( not ( = ?auto_44960 ?auto_44971 ) ) ( not ( = ?auto_44968 ?auto_44971 ) ) ( not ( = ?auto_44975 ?auto_44971 ) ) ( not ( = ?auto_44954 ?auto_44971 ) ) ( AVAILABLE ?auto_44959 ) ( SURFACE-AT ?auto_44975 ?auto_44972 ) ( ON ?auto_44975 ?auto_44963 ) ( CLEAR ?auto_44975 ) ( not ( = ?auto_44952 ?auto_44963 ) ) ( not ( = ?auto_44953 ?auto_44963 ) ) ( not ( = ?auto_44956 ?auto_44963 ) ) ( not ( = ?auto_44957 ?auto_44963 ) ) ( not ( = ?auto_44964 ?auto_44963 ) ) ( not ( = ?auto_44970 ?auto_44963 ) ) ( not ( = ?auto_44955 ?auto_44963 ) ) ( not ( = ?auto_44960 ?auto_44963 ) ) ( not ( = ?auto_44968 ?auto_44963 ) ) ( not ( = ?auto_44975 ?auto_44963 ) ) ( not ( = ?auto_44954 ?auto_44963 ) ) ( not ( = ?auto_44971 ?auto_44963 ) ) ( SURFACE-AT ?auto_44974 ?auto_44967 ) ( CLEAR ?auto_44974 ) ( IS-CRATE ?auto_44971 ) ( not ( = ?auto_44952 ?auto_44974 ) ) ( not ( = ?auto_44953 ?auto_44974 ) ) ( not ( = ?auto_44956 ?auto_44974 ) ) ( not ( = ?auto_44957 ?auto_44974 ) ) ( not ( = ?auto_44964 ?auto_44974 ) ) ( not ( = ?auto_44970 ?auto_44974 ) ) ( not ( = ?auto_44955 ?auto_44974 ) ) ( not ( = ?auto_44960 ?auto_44974 ) ) ( not ( = ?auto_44968 ?auto_44974 ) ) ( not ( = ?auto_44975 ?auto_44974 ) ) ( not ( = ?auto_44954 ?auto_44974 ) ) ( not ( = ?auto_44971 ?auto_44974 ) ) ( not ( = ?auto_44963 ?auto_44974 ) ) ( AVAILABLE ?auto_44965 ) ( TRUCK-AT ?auto_44973 ?auto_44966 ) ( AVAILABLE ?auto_44962 ) ( SURFACE-AT ?auto_44971 ?auto_44966 ) ( ON ?auto_44971 ?auto_44977 ) ( CLEAR ?auto_44971 ) ( not ( = ?auto_44952 ?auto_44977 ) ) ( not ( = ?auto_44953 ?auto_44977 ) ) ( not ( = ?auto_44956 ?auto_44977 ) ) ( not ( = ?auto_44957 ?auto_44977 ) ) ( not ( = ?auto_44964 ?auto_44977 ) ) ( not ( = ?auto_44970 ?auto_44977 ) ) ( not ( = ?auto_44955 ?auto_44977 ) ) ( not ( = ?auto_44960 ?auto_44977 ) ) ( not ( = ?auto_44968 ?auto_44977 ) ) ( not ( = ?auto_44975 ?auto_44977 ) ) ( not ( = ?auto_44954 ?auto_44977 ) ) ( not ( = ?auto_44971 ?auto_44977 ) ) ( not ( = ?auto_44963 ?auto_44977 ) ) ( not ( = ?auto_44974 ?auto_44977 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44962 ?auto_44971 ?auto_44977 ?auto_44966 )
      ( MAKE-ON ?auto_44952 ?auto_44953 )
      ( MAKE-ON-VERIFY ?auto_44952 ?auto_44953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44978 - SURFACE
      ?auto_44979 - SURFACE
    )
    :vars
    (
      ?auto_45003 - HOIST
      ?auto_45002 - PLACE
      ?auto_44998 - PLACE
      ?auto_45001 - HOIST
      ?auto_44987 - SURFACE
      ?auto_44988 - SURFACE
      ?auto_44993 - SURFACE
      ?auto_44994 - SURFACE
      ?auto_44989 - PLACE
      ?auto_44980 - HOIST
      ?auto_44999 - SURFACE
      ?auto_44986 - SURFACE
      ?auto_44982 - PLACE
      ?auto_44996 - HOIST
      ?auto_44983 - SURFACE
      ?auto_44991 - SURFACE
      ?auto_44984 - PLACE
      ?auto_45000 - HOIST
      ?auto_44997 - SURFACE
      ?auto_44995 - SURFACE
      ?auto_44981 - SURFACE
      ?auto_44990 - SURFACE
      ?auto_44992 - SURFACE
      ?auto_44985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45003 ?auto_45002 ) ( IS-CRATE ?auto_44978 ) ( not ( = ?auto_44978 ?auto_44979 ) ) ( not ( = ?auto_44998 ?auto_45002 ) ) ( HOIST-AT ?auto_45001 ?auto_44998 ) ( not ( = ?auto_45003 ?auto_45001 ) ) ( SURFACE-AT ?auto_44978 ?auto_44998 ) ( ON ?auto_44978 ?auto_44987 ) ( CLEAR ?auto_44978 ) ( not ( = ?auto_44978 ?auto_44987 ) ) ( not ( = ?auto_44979 ?auto_44987 ) ) ( IS-CRATE ?auto_44979 ) ( not ( = ?auto_44978 ?auto_44988 ) ) ( not ( = ?auto_44979 ?auto_44988 ) ) ( not ( = ?auto_44987 ?auto_44988 ) ) ( AVAILABLE ?auto_45001 ) ( SURFACE-AT ?auto_44979 ?auto_44998 ) ( ON ?auto_44979 ?auto_44993 ) ( CLEAR ?auto_44979 ) ( not ( = ?auto_44978 ?auto_44993 ) ) ( not ( = ?auto_44979 ?auto_44993 ) ) ( not ( = ?auto_44987 ?auto_44993 ) ) ( not ( = ?auto_44988 ?auto_44993 ) ) ( IS-CRATE ?auto_44988 ) ( not ( = ?auto_44978 ?auto_44994 ) ) ( not ( = ?auto_44979 ?auto_44994 ) ) ( not ( = ?auto_44987 ?auto_44994 ) ) ( not ( = ?auto_44988 ?auto_44994 ) ) ( not ( = ?auto_44993 ?auto_44994 ) ) ( not ( = ?auto_44989 ?auto_45002 ) ) ( not ( = ?auto_44998 ?auto_44989 ) ) ( HOIST-AT ?auto_44980 ?auto_44989 ) ( not ( = ?auto_45003 ?auto_44980 ) ) ( not ( = ?auto_45001 ?auto_44980 ) ) ( AVAILABLE ?auto_44980 ) ( SURFACE-AT ?auto_44988 ?auto_44989 ) ( ON ?auto_44988 ?auto_44999 ) ( CLEAR ?auto_44988 ) ( not ( = ?auto_44978 ?auto_44999 ) ) ( not ( = ?auto_44979 ?auto_44999 ) ) ( not ( = ?auto_44987 ?auto_44999 ) ) ( not ( = ?auto_44988 ?auto_44999 ) ) ( not ( = ?auto_44993 ?auto_44999 ) ) ( not ( = ?auto_44994 ?auto_44999 ) ) ( IS-CRATE ?auto_44994 ) ( not ( = ?auto_44978 ?auto_44986 ) ) ( not ( = ?auto_44979 ?auto_44986 ) ) ( not ( = ?auto_44987 ?auto_44986 ) ) ( not ( = ?auto_44988 ?auto_44986 ) ) ( not ( = ?auto_44993 ?auto_44986 ) ) ( not ( = ?auto_44994 ?auto_44986 ) ) ( not ( = ?auto_44999 ?auto_44986 ) ) ( not ( = ?auto_44982 ?auto_45002 ) ) ( not ( = ?auto_44998 ?auto_44982 ) ) ( not ( = ?auto_44989 ?auto_44982 ) ) ( HOIST-AT ?auto_44996 ?auto_44982 ) ( not ( = ?auto_45003 ?auto_44996 ) ) ( not ( = ?auto_45001 ?auto_44996 ) ) ( not ( = ?auto_44980 ?auto_44996 ) ) ( SURFACE-AT ?auto_44994 ?auto_44982 ) ( ON ?auto_44994 ?auto_44983 ) ( CLEAR ?auto_44994 ) ( not ( = ?auto_44978 ?auto_44983 ) ) ( not ( = ?auto_44979 ?auto_44983 ) ) ( not ( = ?auto_44987 ?auto_44983 ) ) ( not ( = ?auto_44988 ?auto_44983 ) ) ( not ( = ?auto_44993 ?auto_44983 ) ) ( not ( = ?auto_44994 ?auto_44983 ) ) ( not ( = ?auto_44999 ?auto_44983 ) ) ( not ( = ?auto_44986 ?auto_44983 ) ) ( IS-CRATE ?auto_44986 ) ( not ( = ?auto_44978 ?auto_44991 ) ) ( not ( = ?auto_44979 ?auto_44991 ) ) ( not ( = ?auto_44987 ?auto_44991 ) ) ( not ( = ?auto_44988 ?auto_44991 ) ) ( not ( = ?auto_44993 ?auto_44991 ) ) ( not ( = ?auto_44994 ?auto_44991 ) ) ( not ( = ?auto_44999 ?auto_44991 ) ) ( not ( = ?auto_44986 ?auto_44991 ) ) ( not ( = ?auto_44983 ?auto_44991 ) ) ( not ( = ?auto_44984 ?auto_45002 ) ) ( not ( = ?auto_44998 ?auto_44984 ) ) ( not ( = ?auto_44989 ?auto_44984 ) ) ( not ( = ?auto_44982 ?auto_44984 ) ) ( HOIST-AT ?auto_45000 ?auto_44984 ) ( not ( = ?auto_45003 ?auto_45000 ) ) ( not ( = ?auto_45001 ?auto_45000 ) ) ( not ( = ?auto_44980 ?auto_45000 ) ) ( not ( = ?auto_44996 ?auto_45000 ) ) ( SURFACE-AT ?auto_44986 ?auto_44984 ) ( ON ?auto_44986 ?auto_44997 ) ( CLEAR ?auto_44986 ) ( not ( = ?auto_44978 ?auto_44997 ) ) ( not ( = ?auto_44979 ?auto_44997 ) ) ( not ( = ?auto_44987 ?auto_44997 ) ) ( not ( = ?auto_44988 ?auto_44997 ) ) ( not ( = ?auto_44993 ?auto_44997 ) ) ( not ( = ?auto_44994 ?auto_44997 ) ) ( not ( = ?auto_44999 ?auto_44997 ) ) ( not ( = ?auto_44986 ?auto_44997 ) ) ( not ( = ?auto_44983 ?auto_44997 ) ) ( not ( = ?auto_44991 ?auto_44997 ) ) ( IS-CRATE ?auto_44991 ) ( not ( = ?auto_44978 ?auto_44995 ) ) ( not ( = ?auto_44979 ?auto_44995 ) ) ( not ( = ?auto_44987 ?auto_44995 ) ) ( not ( = ?auto_44988 ?auto_44995 ) ) ( not ( = ?auto_44993 ?auto_44995 ) ) ( not ( = ?auto_44994 ?auto_44995 ) ) ( not ( = ?auto_44999 ?auto_44995 ) ) ( not ( = ?auto_44986 ?auto_44995 ) ) ( not ( = ?auto_44983 ?auto_44995 ) ) ( not ( = ?auto_44991 ?auto_44995 ) ) ( not ( = ?auto_44997 ?auto_44995 ) ) ( AVAILABLE ?auto_45000 ) ( SURFACE-AT ?auto_44991 ?auto_44984 ) ( ON ?auto_44991 ?auto_44981 ) ( CLEAR ?auto_44991 ) ( not ( = ?auto_44978 ?auto_44981 ) ) ( not ( = ?auto_44979 ?auto_44981 ) ) ( not ( = ?auto_44987 ?auto_44981 ) ) ( not ( = ?auto_44988 ?auto_44981 ) ) ( not ( = ?auto_44993 ?auto_44981 ) ) ( not ( = ?auto_44994 ?auto_44981 ) ) ( not ( = ?auto_44999 ?auto_44981 ) ) ( not ( = ?auto_44986 ?auto_44981 ) ) ( not ( = ?auto_44983 ?auto_44981 ) ) ( not ( = ?auto_44991 ?auto_44981 ) ) ( not ( = ?auto_44997 ?auto_44981 ) ) ( not ( = ?auto_44995 ?auto_44981 ) ) ( SURFACE-AT ?auto_44990 ?auto_45002 ) ( CLEAR ?auto_44990 ) ( IS-CRATE ?auto_44995 ) ( not ( = ?auto_44978 ?auto_44990 ) ) ( not ( = ?auto_44979 ?auto_44990 ) ) ( not ( = ?auto_44987 ?auto_44990 ) ) ( not ( = ?auto_44988 ?auto_44990 ) ) ( not ( = ?auto_44993 ?auto_44990 ) ) ( not ( = ?auto_44994 ?auto_44990 ) ) ( not ( = ?auto_44999 ?auto_44990 ) ) ( not ( = ?auto_44986 ?auto_44990 ) ) ( not ( = ?auto_44983 ?auto_44990 ) ) ( not ( = ?auto_44991 ?auto_44990 ) ) ( not ( = ?auto_44997 ?auto_44990 ) ) ( not ( = ?auto_44995 ?auto_44990 ) ) ( not ( = ?auto_44981 ?auto_44990 ) ) ( AVAILABLE ?auto_45003 ) ( AVAILABLE ?auto_44996 ) ( SURFACE-AT ?auto_44995 ?auto_44982 ) ( ON ?auto_44995 ?auto_44992 ) ( CLEAR ?auto_44995 ) ( not ( = ?auto_44978 ?auto_44992 ) ) ( not ( = ?auto_44979 ?auto_44992 ) ) ( not ( = ?auto_44987 ?auto_44992 ) ) ( not ( = ?auto_44988 ?auto_44992 ) ) ( not ( = ?auto_44993 ?auto_44992 ) ) ( not ( = ?auto_44994 ?auto_44992 ) ) ( not ( = ?auto_44999 ?auto_44992 ) ) ( not ( = ?auto_44986 ?auto_44992 ) ) ( not ( = ?auto_44983 ?auto_44992 ) ) ( not ( = ?auto_44991 ?auto_44992 ) ) ( not ( = ?auto_44997 ?auto_44992 ) ) ( not ( = ?auto_44995 ?auto_44992 ) ) ( not ( = ?auto_44981 ?auto_44992 ) ) ( not ( = ?auto_44990 ?auto_44992 ) ) ( TRUCK-AT ?auto_44985 ?auto_45002 ) )
    :subtasks
    ( ( !DRIVE ?auto_44985 ?auto_45002 ?auto_44982 )
      ( MAKE-ON ?auto_44978 ?auto_44979 )
      ( MAKE-ON-VERIFY ?auto_44978 ?auto_44979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45006 - SURFACE
      ?auto_45007 - SURFACE
    )
    :vars
    (
      ?auto_45008 - HOIST
      ?auto_45009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45008 ?auto_45009 ) ( SURFACE-AT ?auto_45007 ?auto_45009 ) ( CLEAR ?auto_45007 ) ( LIFTING ?auto_45008 ?auto_45006 ) ( IS-CRATE ?auto_45006 ) ( not ( = ?auto_45006 ?auto_45007 ) ) )
    :subtasks
    ( ( !DROP ?auto_45008 ?auto_45006 ?auto_45007 ?auto_45009 )
      ( MAKE-ON-VERIFY ?auto_45006 ?auto_45007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45010 - SURFACE
      ?auto_45011 - SURFACE
    )
    :vars
    (
      ?auto_45012 - HOIST
      ?auto_45013 - PLACE
      ?auto_45014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45012 ?auto_45013 ) ( SURFACE-AT ?auto_45011 ?auto_45013 ) ( CLEAR ?auto_45011 ) ( IS-CRATE ?auto_45010 ) ( not ( = ?auto_45010 ?auto_45011 ) ) ( TRUCK-AT ?auto_45014 ?auto_45013 ) ( AVAILABLE ?auto_45012 ) ( IN ?auto_45010 ?auto_45014 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45012 ?auto_45010 ?auto_45014 ?auto_45013 )
      ( MAKE-ON ?auto_45010 ?auto_45011 )
      ( MAKE-ON-VERIFY ?auto_45010 ?auto_45011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45015 - SURFACE
      ?auto_45016 - SURFACE
    )
    :vars
    (
      ?auto_45018 - HOIST
      ?auto_45019 - PLACE
      ?auto_45017 - TRUCK
      ?auto_45020 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45018 ?auto_45019 ) ( SURFACE-AT ?auto_45016 ?auto_45019 ) ( CLEAR ?auto_45016 ) ( IS-CRATE ?auto_45015 ) ( not ( = ?auto_45015 ?auto_45016 ) ) ( AVAILABLE ?auto_45018 ) ( IN ?auto_45015 ?auto_45017 ) ( TRUCK-AT ?auto_45017 ?auto_45020 ) ( not ( = ?auto_45020 ?auto_45019 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45017 ?auto_45020 ?auto_45019 )
      ( MAKE-ON ?auto_45015 ?auto_45016 )
      ( MAKE-ON-VERIFY ?auto_45015 ?auto_45016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45021 - SURFACE
      ?auto_45022 - SURFACE
    )
    :vars
    (
      ?auto_45025 - HOIST
      ?auto_45023 - PLACE
      ?auto_45024 - TRUCK
      ?auto_45026 - PLACE
      ?auto_45027 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45025 ?auto_45023 ) ( SURFACE-AT ?auto_45022 ?auto_45023 ) ( CLEAR ?auto_45022 ) ( IS-CRATE ?auto_45021 ) ( not ( = ?auto_45021 ?auto_45022 ) ) ( AVAILABLE ?auto_45025 ) ( TRUCK-AT ?auto_45024 ?auto_45026 ) ( not ( = ?auto_45026 ?auto_45023 ) ) ( HOIST-AT ?auto_45027 ?auto_45026 ) ( LIFTING ?auto_45027 ?auto_45021 ) ( not ( = ?auto_45025 ?auto_45027 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45027 ?auto_45021 ?auto_45024 ?auto_45026 )
      ( MAKE-ON ?auto_45021 ?auto_45022 )
      ( MAKE-ON-VERIFY ?auto_45021 ?auto_45022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45028 - SURFACE
      ?auto_45029 - SURFACE
    )
    :vars
    (
      ?auto_45031 - HOIST
      ?auto_45033 - PLACE
      ?auto_45030 - TRUCK
      ?auto_45034 - PLACE
      ?auto_45032 - HOIST
      ?auto_45035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45031 ?auto_45033 ) ( SURFACE-AT ?auto_45029 ?auto_45033 ) ( CLEAR ?auto_45029 ) ( IS-CRATE ?auto_45028 ) ( not ( = ?auto_45028 ?auto_45029 ) ) ( AVAILABLE ?auto_45031 ) ( TRUCK-AT ?auto_45030 ?auto_45034 ) ( not ( = ?auto_45034 ?auto_45033 ) ) ( HOIST-AT ?auto_45032 ?auto_45034 ) ( not ( = ?auto_45031 ?auto_45032 ) ) ( AVAILABLE ?auto_45032 ) ( SURFACE-AT ?auto_45028 ?auto_45034 ) ( ON ?auto_45028 ?auto_45035 ) ( CLEAR ?auto_45028 ) ( not ( = ?auto_45028 ?auto_45035 ) ) ( not ( = ?auto_45029 ?auto_45035 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45032 ?auto_45028 ?auto_45035 ?auto_45034 )
      ( MAKE-ON ?auto_45028 ?auto_45029 )
      ( MAKE-ON-VERIFY ?auto_45028 ?auto_45029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45036 - SURFACE
      ?auto_45037 - SURFACE
    )
    :vars
    (
      ?auto_45041 - HOIST
      ?auto_45043 - PLACE
      ?auto_45039 - PLACE
      ?auto_45040 - HOIST
      ?auto_45038 - SURFACE
      ?auto_45042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45041 ?auto_45043 ) ( SURFACE-AT ?auto_45037 ?auto_45043 ) ( CLEAR ?auto_45037 ) ( IS-CRATE ?auto_45036 ) ( not ( = ?auto_45036 ?auto_45037 ) ) ( AVAILABLE ?auto_45041 ) ( not ( = ?auto_45039 ?auto_45043 ) ) ( HOIST-AT ?auto_45040 ?auto_45039 ) ( not ( = ?auto_45041 ?auto_45040 ) ) ( AVAILABLE ?auto_45040 ) ( SURFACE-AT ?auto_45036 ?auto_45039 ) ( ON ?auto_45036 ?auto_45038 ) ( CLEAR ?auto_45036 ) ( not ( = ?auto_45036 ?auto_45038 ) ) ( not ( = ?auto_45037 ?auto_45038 ) ) ( TRUCK-AT ?auto_45042 ?auto_45043 ) )
    :subtasks
    ( ( !DRIVE ?auto_45042 ?auto_45043 ?auto_45039 )
      ( MAKE-ON ?auto_45036 ?auto_45037 )
      ( MAKE-ON-VERIFY ?auto_45036 ?auto_45037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45044 - SURFACE
      ?auto_45045 - SURFACE
    )
    :vars
    (
      ?auto_45051 - HOIST
      ?auto_45049 - PLACE
      ?auto_45048 - PLACE
      ?auto_45046 - HOIST
      ?auto_45050 - SURFACE
      ?auto_45047 - TRUCK
      ?auto_45052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45051 ?auto_45049 ) ( IS-CRATE ?auto_45044 ) ( not ( = ?auto_45044 ?auto_45045 ) ) ( not ( = ?auto_45048 ?auto_45049 ) ) ( HOIST-AT ?auto_45046 ?auto_45048 ) ( not ( = ?auto_45051 ?auto_45046 ) ) ( AVAILABLE ?auto_45046 ) ( SURFACE-AT ?auto_45044 ?auto_45048 ) ( ON ?auto_45044 ?auto_45050 ) ( CLEAR ?auto_45044 ) ( not ( = ?auto_45044 ?auto_45050 ) ) ( not ( = ?auto_45045 ?auto_45050 ) ) ( TRUCK-AT ?auto_45047 ?auto_45049 ) ( SURFACE-AT ?auto_45052 ?auto_45049 ) ( CLEAR ?auto_45052 ) ( LIFTING ?auto_45051 ?auto_45045 ) ( IS-CRATE ?auto_45045 ) ( not ( = ?auto_45044 ?auto_45052 ) ) ( not ( = ?auto_45045 ?auto_45052 ) ) ( not ( = ?auto_45050 ?auto_45052 ) ) )
    :subtasks
    ( ( !DROP ?auto_45051 ?auto_45045 ?auto_45052 ?auto_45049 )
      ( MAKE-ON ?auto_45044 ?auto_45045 )
      ( MAKE-ON-VERIFY ?auto_45044 ?auto_45045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45053 - SURFACE
      ?auto_45054 - SURFACE
    )
    :vars
    (
      ?auto_45055 - HOIST
      ?auto_45060 - PLACE
      ?auto_45057 - PLACE
      ?auto_45061 - HOIST
      ?auto_45058 - SURFACE
      ?auto_45056 - TRUCK
      ?auto_45059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45055 ?auto_45060 ) ( IS-CRATE ?auto_45053 ) ( not ( = ?auto_45053 ?auto_45054 ) ) ( not ( = ?auto_45057 ?auto_45060 ) ) ( HOIST-AT ?auto_45061 ?auto_45057 ) ( not ( = ?auto_45055 ?auto_45061 ) ) ( AVAILABLE ?auto_45061 ) ( SURFACE-AT ?auto_45053 ?auto_45057 ) ( ON ?auto_45053 ?auto_45058 ) ( CLEAR ?auto_45053 ) ( not ( = ?auto_45053 ?auto_45058 ) ) ( not ( = ?auto_45054 ?auto_45058 ) ) ( TRUCK-AT ?auto_45056 ?auto_45060 ) ( SURFACE-AT ?auto_45059 ?auto_45060 ) ( CLEAR ?auto_45059 ) ( IS-CRATE ?auto_45054 ) ( not ( = ?auto_45053 ?auto_45059 ) ) ( not ( = ?auto_45054 ?auto_45059 ) ) ( not ( = ?auto_45058 ?auto_45059 ) ) ( AVAILABLE ?auto_45055 ) ( IN ?auto_45054 ?auto_45056 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45055 ?auto_45054 ?auto_45056 ?auto_45060 )
      ( MAKE-ON ?auto_45053 ?auto_45054 )
      ( MAKE-ON-VERIFY ?auto_45053 ?auto_45054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45062 - SURFACE
      ?auto_45063 - SURFACE
    )
    :vars
    (
      ?auto_45065 - HOIST
      ?auto_45067 - PLACE
      ?auto_45070 - PLACE
      ?auto_45064 - HOIST
      ?auto_45069 - SURFACE
      ?auto_45068 - SURFACE
      ?auto_45066 - TRUCK
      ?auto_45071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45065 ?auto_45067 ) ( IS-CRATE ?auto_45062 ) ( not ( = ?auto_45062 ?auto_45063 ) ) ( not ( = ?auto_45070 ?auto_45067 ) ) ( HOIST-AT ?auto_45064 ?auto_45070 ) ( not ( = ?auto_45065 ?auto_45064 ) ) ( AVAILABLE ?auto_45064 ) ( SURFACE-AT ?auto_45062 ?auto_45070 ) ( ON ?auto_45062 ?auto_45069 ) ( CLEAR ?auto_45062 ) ( not ( = ?auto_45062 ?auto_45069 ) ) ( not ( = ?auto_45063 ?auto_45069 ) ) ( SURFACE-AT ?auto_45068 ?auto_45067 ) ( CLEAR ?auto_45068 ) ( IS-CRATE ?auto_45063 ) ( not ( = ?auto_45062 ?auto_45068 ) ) ( not ( = ?auto_45063 ?auto_45068 ) ) ( not ( = ?auto_45069 ?auto_45068 ) ) ( AVAILABLE ?auto_45065 ) ( IN ?auto_45063 ?auto_45066 ) ( TRUCK-AT ?auto_45066 ?auto_45071 ) ( not ( = ?auto_45071 ?auto_45067 ) ) ( not ( = ?auto_45070 ?auto_45071 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45066 ?auto_45071 ?auto_45067 )
      ( MAKE-ON ?auto_45062 ?auto_45063 )
      ( MAKE-ON-VERIFY ?auto_45062 ?auto_45063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45072 - SURFACE
      ?auto_45073 - SURFACE
    )
    :vars
    (
      ?auto_45076 - HOIST
      ?auto_45080 - PLACE
      ?auto_45079 - PLACE
      ?auto_45074 - HOIST
      ?auto_45078 - SURFACE
      ?auto_45077 - SURFACE
      ?auto_45081 - TRUCK
      ?auto_45075 - PLACE
      ?auto_45082 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45076 ?auto_45080 ) ( IS-CRATE ?auto_45072 ) ( not ( = ?auto_45072 ?auto_45073 ) ) ( not ( = ?auto_45079 ?auto_45080 ) ) ( HOIST-AT ?auto_45074 ?auto_45079 ) ( not ( = ?auto_45076 ?auto_45074 ) ) ( AVAILABLE ?auto_45074 ) ( SURFACE-AT ?auto_45072 ?auto_45079 ) ( ON ?auto_45072 ?auto_45078 ) ( CLEAR ?auto_45072 ) ( not ( = ?auto_45072 ?auto_45078 ) ) ( not ( = ?auto_45073 ?auto_45078 ) ) ( SURFACE-AT ?auto_45077 ?auto_45080 ) ( CLEAR ?auto_45077 ) ( IS-CRATE ?auto_45073 ) ( not ( = ?auto_45072 ?auto_45077 ) ) ( not ( = ?auto_45073 ?auto_45077 ) ) ( not ( = ?auto_45078 ?auto_45077 ) ) ( AVAILABLE ?auto_45076 ) ( TRUCK-AT ?auto_45081 ?auto_45075 ) ( not ( = ?auto_45075 ?auto_45080 ) ) ( not ( = ?auto_45079 ?auto_45075 ) ) ( HOIST-AT ?auto_45082 ?auto_45075 ) ( LIFTING ?auto_45082 ?auto_45073 ) ( not ( = ?auto_45076 ?auto_45082 ) ) ( not ( = ?auto_45074 ?auto_45082 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45082 ?auto_45073 ?auto_45081 ?auto_45075 )
      ( MAKE-ON ?auto_45072 ?auto_45073 )
      ( MAKE-ON-VERIFY ?auto_45072 ?auto_45073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45083 - SURFACE
      ?auto_45084 - SURFACE
    )
    :vars
    (
      ?auto_45093 - HOIST
      ?auto_45087 - PLACE
      ?auto_45091 - PLACE
      ?auto_45090 - HOIST
      ?auto_45086 - SURFACE
      ?auto_45092 - SURFACE
      ?auto_45085 - TRUCK
      ?auto_45088 - PLACE
      ?auto_45089 - HOIST
      ?auto_45094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45093 ?auto_45087 ) ( IS-CRATE ?auto_45083 ) ( not ( = ?auto_45083 ?auto_45084 ) ) ( not ( = ?auto_45091 ?auto_45087 ) ) ( HOIST-AT ?auto_45090 ?auto_45091 ) ( not ( = ?auto_45093 ?auto_45090 ) ) ( AVAILABLE ?auto_45090 ) ( SURFACE-AT ?auto_45083 ?auto_45091 ) ( ON ?auto_45083 ?auto_45086 ) ( CLEAR ?auto_45083 ) ( not ( = ?auto_45083 ?auto_45086 ) ) ( not ( = ?auto_45084 ?auto_45086 ) ) ( SURFACE-AT ?auto_45092 ?auto_45087 ) ( CLEAR ?auto_45092 ) ( IS-CRATE ?auto_45084 ) ( not ( = ?auto_45083 ?auto_45092 ) ) ( not ( = ?auto_45084 ?auto_45092 ) ) ( not ( = ?auto_45086 ?auto_45092 ) ) ( AVAILABLE ?auto_45093 ) ( TRUCK-AT ?auto_45085 ?auto_45088 ) ( not ( = ?auto_45088 ?auto_45087 ) ) ( not ( = ?auto_45091 ?auto_45088 ) ) ( HOIST-AT ?auto_45089 ?auto_45088 ) ( not ( = ?auto_45093 ?auto_45089 ) ) ( not ( = ?auto_45090 ?auto_45089 ) ) ( AVAILABLE ?auto_45089 ) ( SURFACE-AT ?auto_45084 ?auto_45088 ) ( ON ?auto_45084 ?auto_45094 ) ( CLEAR ?auto_45084 ) ( not ( = ?auto_45083 ?auto_45094 ) ) ( not ( = ?auto_45084 ?auto_45094 ) ) ( not ( = ?auto_45086 ?auto_45094 ) ) ( not ( = ?auto_45092 ?auto_45094 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45089 ?auto_45084 ?auto_45094 ?auto_45088 )
      ( MAKE-ON ?auto_45083 ?auto_45084 )
      ( MAKE-ON-VERIFY ?auto_45083 ?auto_45084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45095 - SURFACE
      ?auto_45096 - SURFACE
    )
    :vars
    (
      ?auto_45106 - HOIST
      ?auto_45100 - PLACE
      ?auto_45102 - PLACE
      ?auto_45105 - HOIST
      ?auto_45099 - SURFACE
      ?auto_45098 - SURFACE
      ?auto_45104 - PLACE
      ?auto_45101 - HOIST
      ?auto_45103 - SURFACE
      ?auto_45097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45106 ?auto_45100 ) ( IS-CRATE ?auto_45095 ) ( not ( = ?auto_45095 ?auto_45096 ) ) ( not ( = ?auto_45102 ?auto_45100 ) ) ( HOIST-AT ?auto_45105 ?auto_45102 ) ( not ( = ?auto_45106 ?auto_45105 ) ) ( AVAILABLE ?auto_45105 ) ( SURFACE-AT ?auto_45095 ?auto_45102 ) ( ON ?auto_45095 ?auto_45099 ) ( CLEAR ?auto_45095 ) ( not ( = ?auto_45095 ?auto_45099 ) ) ( not ( = ?auto_45096 ?auto_45099 ) ) ( SURFACE-AT ?auto_45098 ?auto_45100 ) ( CLEAR ?auto_45098 ) ( IS-CRATE ?auto_45096 ) ( not ( = ?auto_45095 ?auto_45098 ) ) ( not ( = ?auto_45096 ?auto_45098 ) ) ( not ( = ?auto_45099 ?auto_45098 ) ) ( AVAILABLE ?auto_45106 ) ( not ( = ?auto_45104 ?auto_45100 ) ) ( not ( = ?auto_45102 ?auto_45104 ) ) ( HOIST-AT ?auto_45101 ?auto_45104 ) ( not ( = ?auto_45106 ?auto_45101 ) ) ( not ( = ?auto_45105 ?auto_45101 ) ) ( AVAILABLE ?auto_45101 ) ( SURFACE-AT ?auto_45096 ?auto_45104 ) ( ON ?auto_45096 ?auto_45103 ) ( CLEAR ?auto_45096 ) ( not ( = ?auto_45095 ?auto_45103 ) ) ( not ( = ?auto_45096 ?auto_45103 ) ) ( not ( = ?auto_45099 ?auto_45103 ) ) ( not ( = ?auto_45098 ?auto_45103 ) ) ( TRUCK-AT ?auto_45097 ?auto_45100 ) )
    :subtasks
    ( ( !DRIVE ?auto_45097 ?auto_45100 ?auto_45104 )
      ( MAKE-ON ?auto_45095 ?auto_45096 )
      ( MAKE-ON-VERIFY ?auto_45095 ?auto_45096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45107 - SURFACE
      ?auto_45108 - SURFACE
    )
    :vars
    (
      ?auto_45116 - HOIST
      ?auto_45113 - PLACE
      ?auto_45118 - PLACE
      ?auto_45109 - HOIST
      ?auto_45111 - SURFACE
      ?auto_45117 - SURFACE
      ?auto_45114 - PLACE
      ?auto_45110 - HOIST
      ?auto_45112 - SURFACE
      ?auto_45115 - TRUCK
      ?auto_45119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45116 ?auto_45113 ) ( IS-CRATE ?auto_45107 ) ( not ( = ?auto_45107 ?auto_45108 ) ) ( not ( = ?auto_45118 ?auto_45113 ) ) ( HOIST-AT ?auto_45109 ?auto_45118 ) ( not ( = ?auto_45116 ?auto_45109 ) ) ( AVAILABLE ?auto_45109 ) ( SURFACE-AT ?auto_45107 ?auto_45118 ) ( ON ?auto_45107 ?auto_45111 ) ( CLEAR ?auto_45107 ) ( not ( = ?auto_45107 ?auto_45111 ) ) ( not ( = ?auto_45108 ?auto_45111 ) ) ( IS-CRATE ?auto_45108 ) ( not ( = ?auto_45107 ?auto_45117 ) ) ( not ( = ?auto_45108 ?auto_45117 ) ) ( not ( = ?auto_45111 ?auto_45117 ) ) ( not ( = ?auto_45114 ?auto_45113 ) ) ( not ( = ?auto_45118 ?auto_45114 ) ) ( HOIST-AT ?auto_45110 ?auto_45114 ) ( not ( = ?auto_45116 ?auto_45110 ) ) ( not ( = ?auto_45109 ?auto_45110 ) ) ( AVAILABLE ?auto_45110 ) ( SURFACE-AT ?auto_45108 ?auto_45114 ) ( ON ?auto_45108 ?auto_45112 ) ( CLEAR ?auto_45108 ) ( not ( = ?auto_45107 ?auto_45112 ) ) ( not ( = ?auto_45108 ?auto_45112 ) ) ( not ( = ?auto_45111 ?auto_45112 ) ) ( not ( = ?auto_45117 ?auto_45112 ) ) ( TRUCK-AT ?auto_45115 ?auto_45113 ) ( SURFACE-AT ?auto_45119 ?auto_45113 ) ( CLEAR ?auto_45119 ) ( LIFTING ?auto_45116 ?auto_45117 ) ( IS-CRATE ?auto_45117 ) ( not ( = ?auto_45107 ?auto_45119 ) ) ( not ( = ?auto_45108 ?auto_45119 ) ) ( not ( = ?auto_45111 ?auto_45119 ) ) ( not ( = ?auto_45117 ?auto_45119 ) ) ( not ( = ?auto_45112 ?auto_45119 ) ) )
    :subtasks
    ( ( !DROP ?auto_45116 ?auto_45117 ?auto_45119 ?auto_45113 )
      ( MAKE-ON ?auto_45107 ?auto_45108 )
      ( MAKE-ON-VERIFY ?auto_45107 ?auto_45108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45120 - SURFACE
      ?auto_45121 - SURFACE
    )
    :vars
    (
      ?auto_45127 - HOIST
      ?auto_45132 - PLACE
      ?auto_45126 - PLACE
      ?auto_45123 - HOIST
      ?auto_45131 - SURFACE
      ?auto_45122 - SURFACE
      ?auto_45130 - PLACE
      ?auto_45129 - HOIST
      ?auto_45128 - SURFACE
      ?auto_45125 - TRUCK
      ?auto_45124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45127 ?auto_45132 ) ( IS-CRATE ?auto_45120 ) ( not ( = ?auto_45120 ?auto_45121 ) ) ( not ( = ?auto_45126 ?auto_45132 ) ) ( HOIST-AT ?auto_45123 ?auto_45126 ) ( not ( = ?auto_45127 ?auto_45123 ) ) ( AVAILABLE ?auto_45123 ) ( SURFACE-AT ?auto_45120 ?auto_45126 ) ( ON ?auto_45120 ?auto_45131 ) ( CLEAR ?auto_45120 ) ( not ( = ?auto_45120 ?auto_45131 ) ) ( not ( = ?auto_45121 ?auto_45131 ) ) ( IS-CRATE ?auto_45121 ) ( not ( = ?auto_45120 ?auto_45122 ) ) ( not ( = ?auto_45121 ?auto_45122 ) ) ( not ( = ?auto_45131 ?auto_45122 ) ) ( not ( = ?auto_45130 ?auto_45132 ) ) ( not ( = ?auto_45126 ?auto_45130 ) ) ( HOIST-AT ?auto_45129 ?auto_45130 ) ( not ( = ?auto_45127 ?auto_45129 ) ) ( not ( = ?auto_45123 ?auto_45129 ) ) ( AVAILABLE ?auto_45129 ) ( SURFACE-AT ?auto_45121 ?auto_45130 ) ( ON ?auto_45121 ?auto_45128 ) ( CLEAR ?auto_45121 ) ( not ( = ?auto_45120 ?auto_45128 ) ) ( not ( = ?auto_45121 ?auto_45128 ) ) ( not ( = ?auto_45131 ?auto_45128 ) ) ( not ( = ?auto_45122 ?auto_45128 ) ) ( TRUCK-AT ?auto_45125 ?auto_45132 ) ( SURFACE-AT ?auto_45124 ?auto_45132 ) ( CLEAR ?auto_45124 ) ( IS-CRATE ?auto_45122 ) ( not ( = ?auto_45120 ?auto_45124 ) ) ( not ( = ?auto_45121 ?auto_45124 ) ) ( not ( = ?auto_45131 ?auto_45124 ) ) ( not ( = ?auto_45122 ?auto_45124 ) ) ( not ( = ?auto_45128 ?auto_45124 ) ) ( AVAILABLE ?auto_45127 ) ( IN ?auto_45122 ?auto_45125 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45127 ?auto_45122 ?auto_45125 ?auto_45132 )
      ( MAKE-ON ?auto_45120 ?auto_45121 )
      ( MAKE-ON-VERIFY ?auto_45120 ?auto_45121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45133 - SURFACE
      ?auto_45134 - SURFACE
    )
    :vars
    (
      ?auto_45145 - HOIST
      ?auto_45135 - PLACE
      ?auto_45137 - PLACE
      ?auto_45143 - HOIST
      ?auto_45140 - SURFACE
      ?auto_45138 - SURFACE
      ?auto_45144 - PLACE
      ?auto_45139 - HOIST
      ?auto_45141 - SURFACE
      ?auto_45142 - SURFACE
      ?auto_45136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45145 ?auto_45135 ) ( IS-CRATE ?auto_45133 ) ( not ( = ?auto_45133 ?auto_45134 ) ) ( not ( = ?auto_45137 ?auto_45135 ) ) ( HOIST-AT ?auto_45143 ?auto_45137 ) ( not ( = ?auto_45145 ?auto_45143 ) ) ( AVAILABLE ?auto_45143 ) ( SURFACE-AT ?auto_45133 ?auto_45137 ) ( ON ?auto_45133 ?auto_45140 ) ( CLEAR ?auto_45133 ) ( not ( = ?auto_45133 ?auto_45140 ) ) ( not ( = ?auto_45134 ?auto_45140 ) ) ( IS-CRATE ?auto_45134 ) ( not ( = ?auto_45133 ?auto_45138 ) ) ( not ( = ?auto_45134 ?auto_45138 ) ) ( not ( = ?auto_45140 ?auto_45138 ) ) ( not ( = ?auto_45144 ?auto_45135 ) ) ( not ( = ?auto_45137 ?auto_45144 ) ) ( HOIST-AT ?auto_45139 ?auto_45144 ) ( not ( = ?auto_45145 ?auto_45139 ) ) ( not ( = ?auto_45143 ?auto_45139 ) ) ( AVAILABLE ?auto_45139 ) ( SURFACE-AT ?auto_45134 ?auto_45144 ) ( ON ?auto_45134 ?auto_45141 ) ( CLEAR ?auto_45134 ) ( not ( = ?auto_45133 ?auto_45141 ) ) ( not ( = ?auto_45134 ?auto_45141 ) ) ( not ( = ?auto_45140 ?auto_45141 ) ) ( not ( = ?auto_45138 ?auto_45141 ) ) ( SURFACE-AT ?auto_45142 ?auto_45135 ) ( CLEAR ?auto_45142 ) ( IS-CRATE ?auto_45138 ) ( not ( = ?auto_45133 ?auto_45142 ) ) ( not ( = ?auto_45134 ?auto_45142 ) ) ( not ( = ?auto_45140 ?auto_45142 ) ) ( not ( = ?auto_45138 ?auto_45142 ) ) ( not ( = ?auto_45141 ?auto_45142 ) ) ( AVAILABLE ?auto_45145 ) ( IN ?auto_45138 ?auto_45136 ) ( TRUCK-AT ?auto_45136 ?auto_45144 ) )
    :subtasks
    ( ( !DRIVE ?auto_45136 ?auto_45144 ?auto_45135 )
      ( MAKE-ON ?auto_45133 ?auto_45134 )
      ( MAKE-ON-VERIFY ?auto_45133 ?auto_45134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45146 - SURFACE
      ?auto_45147 - SURFACE
    )
    :vars
    (
      ?auto_45151 - HOIST
      ?auto_45158 - PLACE
      ?auto_45157 - PLACE
      ?auto_45152 - HOIST
      ?auto_45154 - SURFACE
      ?auto_45150 - SURFACE
      ?auto_45156 - PLACE
      ?auto_45148 - HOIST
      ?auto_45153 - SURFACE
      ?auto_45155 - SURFACE
      ?auto_45149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45151 ?auto_45158 ) ( IS-CRATE ?auto_45146 ) ( not ( = ?auto_45146 ?auto_45147 ) ) ( not ( = ?auto_45157 ?auto_45158 ) ) ( HOIST-AT ?auto_45152 ?auto_45157 ) ( not ( = ?auto_45151 ?auto_45152 ) ) ( AVAILABLE ?auto_45152 ) ( SURFACE-AT ?auto_45146 ?auto_45157 ) ( ON ?auto_45146 ?auto_45154 ) ( CLEAR ?auto_45146 ) ( not ( = ?auto_45146 ?auto_45154 ) ) ( not ( = ?auto_45147 ?auto_45154 ) ) ( IS-CRATE ?auto_45147 ) ( not ( = ?auto_45146 ?auto_45150 ) ) ( not ( = ?auto_45147 ?auto_45150 ) ) ( not ( = ?auto_45154 ?auto_45150 ) ) ( not ( = ?auto_45156 ?auto_45158 ) ) ( not ( = ?auto_45157 ?auto_45156 ) ) ( HOIST-AT ?auto_45148 ?auto_45156 ) ( not ( = ?auto_45151 ?auto_45148 ) ) ( not ( = ?auto_45152 ?auto_45148 ) ) ( SURFACE-AT ?auto_45147 ?auto_45156 ) ( ON ?auto_45147 ?auto_45153 ) ( CLEAR ?auto_45147 ) ( not ( = ?auto_45146 ?auto_45153 ) ) ( not ( = ?auto_45147 ?auto_45153 ) ) ( not ( = ?auto_45154 ?auto_45153 ) ) ( not ( = ?auto_45150 ?auto_45153 ) ) ( SURFACE-AT ?auto_45155 ?auto_45158 ) ( CLEAR ?auto_45155 ) ( IS-CRATE ?auto_45150 ) ( not ( = ?auto_45146 ?auto_45155 ) ) ( not ( = ?auto_45147 ?auto_45155 ) ) ( not ( = ?auto_45154 ?auto_45155 ) ) ( not ( = ?auto_45150 ?auto_45155 ) ) ( not ( = ?auto_45153 ?auto_45155 ) ) ( AVAILABLE ?auto_45151 ) ( TRUCK-AT ?auto_45149 ?auto_45156 ) ( LIFTING ?auto_45148 ?auto_45150 ) )
    :subtasks
    ( ( !LOAD ?auto_45148 ?auto_45150 ?auto_45149 ?auto_45156 )
      ( MAKE-ON ?auto_45146 ?auto_45147 )
      ( MAKE-ON-VERIFY ?auto_45146 ?auto_45147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45159 - SURFACE
      ?auto_45160 - SURFACE
    )
    :vars
    (
      ?auto_45162 - HOIST
      ?auto_45166 - PLACE
      ?auto_45167 - PLACE
      ?auto_45171 - HOIST
      ?auto_45163 - SURFACE
      ?auto_45169 - SURFACE
      ?auto_45161 - PLACE
      ?auto_45164 - HOIST
      ?auto_45170 - SURFACE
      ?auto_45165 - SURFACE
      ?auto_45168 - TRUCK
      ?auto_45172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45162 ?auto_45166 ) ( IS-CRATE ?auto_45159 ) ( not ( = ?auto_45159 ?auto_45160 ) ) ( not ( = ?auto_45167 ?auto_45166 ) ) ( HOIST-AT ?auto_45171 ?auto_45167 ) ( not ( = ?auto_45162 ?auto_45171 ) ) ( AVAILABLE ?auto_45171 ) ( SURFACE-AT ?auto_45159 ?auto_45167 ) ( ON ?auto_45159 ?auto_45163 ) ( CLEAR ?auto_45159 ) ( not ( = ?auto_45159 ?auto_45163 ) ) ( not ( = ?auto_45160 ?auto_45163 ) ) ( IS-CRATE ?auto_45160 ) ( not ( = ?auto_45159 ?auto_45169 ) ) ( not ( = ?auto_45160 ?auto_45169 ) ) ( not ( = ?auto_45163 ?auto_45169 ) ) ( not ( = ?auto_45161 ?auto_45166 ) ) ( not ( = ?auto_45167 ?auto_45161 ) ) ( HOIST-AT ?auto_45164 ?auto_45161 ) ( not ( = ?auto_45162 ?auto_45164 ) ) ( not ( = ?auto_45171 ?auto_45164 ) ) ( SURFACE-AT ?auto_45160 ?auto_45161 ) ( ON ?auto_45160 ?auto_45170 ) ( CLEAR ?auto_45160 ) ( not ( = ?auto_45159 ?auto_45170 ) ) ( not ( = ?auto_45160 ?auto_45170 ) ) ( not ( = ?auto_45163 ?auto_45170 ) ) ( not ( = ?auto_45169 ?auto_45170 ) ) ( SURFACE-AT ?auto_45165 ?auto_45166 ) ( CLEAR ?auto_45165 ) ( IS-CRATE ?auto_45169 ) ( not ( = ?auto_45159 ?auto_45165 ) ) ( not ( = ?auto_45160 ?auto_45165 ) ) ( not ( = ?auto_45163 ?auto_45165 ) ) ( not ( = ?auto_45169 ?auto_45165 ) ) ( not ( = ?auto_45170 ?auto_45165 ) ) ( AVAILABLE ?auto_45162 ) ( TRUCK-AT ?auto_45168 ?auto_45161 ) ( AVAILABLE ?auto_45164 ) ( SURFACE-AT ?auto_45169 ?auto_45161 ) ( ON ?auto_45169 ?auto_45172 ) ( CLEAR ?auto_45169 ) ( not ( = ?auto_45159 ?auto_45172 ) ) ( not ( = ?auto_45160 ?auto_45172 ) ) ( not ( = ?auto_45163 ?auto_45172 ) ) ( not ( = ?auto_45169 ?auto_45172 ) ) ( not ( = ?auto_45170 ?auto_45172 ) ) ( not ( = ?auto_45165 ?auto_45172 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45164 ?auto_45169 ?auto_45172 ?auto_45161 )
      ( MAKE-ON ?auto_45159 ?auto_45160 )
      ( MAKE-ON-VERIFY ?auto_45159 ?auto_45160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45173 - SURFACE
      ?auto_45174 - SURFACE
    )
    :vars
    (
      ?auto_45186 - HOIST
      ?auto_45185 - PLACE
      ?auto_45182 - PLACE
      ?auto_45184 - HOIST
      ?auto_45183 - SURFACE
      ?auto_45176 - SURFACE
      ?auto_45175 - PLACE
      ?auto_45177 - HOIST
      ?auto_45178 - SURFACE
      ?auto_45180 - SURFACE
      ?auto_45179 - SURFACE
      ?auto_45181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45186 ?auto_45185 ) ( IS-CRATE ?auto_45173 ) ( not ( = ?auto_45173 ?auto_45174 ) ) ( not ( = ?auto_45182 ?auto_45185 ) ) ( HOIST-AT ?auto_45184 ?auto_45182 ) ( not ( = ?auto_45186 ?auto_45184 ) ) ( AVAILABLE ?auto_45184 ) ( SURFACE-AT ?auto_45173 ?auto_45182 ) ( ON ?auto_45173 ?auto_45183 ) ( CLEAR ?auto_45173 ) ( not ( = ?auto_45173 ?auto_45183 ) ) ( not ( = ?auto_45174 ?auto_45183 ) ) ( IS-CRATE ?auto_45174 ) ( not ( = ?auto_45173 ?auto_45176 ) ) ( not ( = ?auto_45174 ?auto_45176 ) ) ( not ( = ?auto_45183 ?auto_45176 ) ) ( not ( = ?auto_45175 ?auto_45185 ) ) ( not ( = ?auto_45182 ?auto_45175 ) ) ( HOIST-AT ?auto_45177 ?auto_45175 ) ( not ( = ?auto_45186 ?auto_45177 ) ) ( not ( = ?auto_45184 ?auto_45177 ) ) ( SURFACE-AT ?auto_45174 ?auto_45175 ) ( ON ?auto_45174 ?auto_45178 ) ( CLEAR ?auto_45174 ) ( not ( = ?auto_45173 ?auto_45178 ) ) ( not ( = ?auto_45174 ?auto_45178 ) ) ( not ( = ?auto_45183 ?auto_45178 ) ) ( not ( = ?auto_45176 ?auto_45178 ) ) ( SURFACE-AT ?auto_45180 ?auto_45185 ) ( CLEAR ?auto_45180 ) ( IS-CRATE ?auto_45176 ) ( not ( = ?auto_45173 ?auto_45180 ) ) ( not ( = ?auto_45174 ?auto_45180 ) ) ( not ( = ?auto_45183 ?auto_45180 ) ) ( not ( = ?auto_45176 ?auto_45180 ) ) ( not ( = ?auto_45178 ?auto_45180 ) ) ( AVAILABLE ?auto_45186 ) ( AVAILABLE ?auto_45177 ) ( SURFACE-AT ?auto_45176 ?auto_45175 ) ( ON ?auto_45176 ?auto_45179 ) ( CLEAR ?auto_45176 ) ( not ( = ?auto_45173 ?auto_45179 ) ) ( not ( = ?auto_45174 ?auto_45179 ) ) ( not ( = ?auto_45183 ?auto_45179 ) ) ( not ( = ?auto_45176 ?auto_45179 ) ) ( not ( = ?auto_45178 ?auto_45179 ) ) ( not ( = ?auto_45180 ?auto_45179 ) ) ( TRUCK-AT ?auto_45181 ?auto_45185 ) )
    :subtasks
    ( ( !DRIVE ?auto_45181 ?auto_45185 ?auto_45175 )
      ( MAKE-ON ?auto_45173 ?auto_45174 )
      ( MAKE-ON-VERIFY ?auto_45173 ?auto_45174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45187 - SURFACE
      ?auto_45188 - SURFACE
    )
    :vars
    (
      ?auto_45197 - HOIST
      ?auto_45193 - PLACE
      ?auto_45196 - PLACE
      ?auto_45194 - HOIST
      ?auto_45192 - SURFACE
      ?auto_45198 - SURFACE
      ?auto_45191 - PLACE
      ?auto_45195 - HOIST
      ?auto_45199 - SURFACE
      ?auto_45200 - SURFACE
      ?auto_45190 - SURFACE
      ?auto_45189 - TRUCK
      ?auto_45201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45197 ?auto_45193 ) ( IS-CRATE ?auto_45187 ) ( not ( = ?auto_45187 ?auto_45188 ) ) ( not ( = ?auto_45196 ?auto_45193 ) ) ( HOIST-AT ?auto_45194 ?auto_45196 ) ( not ( = ?auto_45197 ?auto_45194 ) ) ( AVAILABLE ?auto_45194 ) ( SURFACE-AT ?auto_45187 ?auto_45196 ) ( ON ?auto_45187 ?auto_45192 ) ( CLEAR ?auto_45187 ) ( not ( = ?auto_45187 ?auto_45192 ) ) ( not ( = ?auto_45188 ?auto_45192 ) ) ( IS-CRATE ?auto_45188 ) ( not ( = ?auto_45187 ?auto_45198 ) ) ( not ( = ?auto_45188 ?auto_45198 ) ) ( not ( = ?auto_45192 ?auto_45198 ) ) ( not ( = ?auto_45191 ?auto_45193 ) ) ( not ( = ?auto_45196 ?auto_45191 ) ) ( HOIST-AT ?auto_45195 ?auto_45191 ) ( not ( = ?auto_45197 ?auto_45195 ) ) ( not ( = ?auto_45194 ?auto_45195 ) ) ( SURFACE-AT ?auto_45188 ?auto_45191 ) ( ON ?auto_45188 ?auto_45199 ) ( CLEAR ?auto_45188 ) ( not ( = ?auto_45187 ?auto_45199 ) ) ( not ( = ?auto_45188 ?auto_45199 ) ) ( not ( = ?auto_45192 ?auto_45199 ) ) ( not ( = ?auto_45198 ?auto_45199 ) ) ( IS-CRATE ?auto_45198 ) ( not ( = ?auto_45187 ?auto_45200 ) ) ( not ( = ?auto_45188 ?auto_45200 ) ) ( not ( = ?auto_45192 ?auto_45200 ) ) ( not ( = ?auto_45198 ?auto_45200 ) ) ( not ( = ?auto_45199 ?auto_45200 ) ) ( AVAILABLE ?auto_45195 ) ( SURFACE-AT ?auto_45198 ?auto_45191 ) ( ON ?auto_45198 ?auto_45190 ) ( CLEAR ?auto_45198 ) ( not ( = ?auto_45187 ?auto_45190 ) ) ( not ( = ?auto_45188 ?auto_45190 ) ) ( not ( = ?auto_45192 ?auto_45190 ) ) ( not ( = ?auto_45198 ?auto_45190 ) ) ( not ( = ?auto_45199 ?auto_45190 ) ) ( not ( = ?auto_45200 ?auto_45190 ) ) ( TRUCK-AT ?auto_45189 ?auto_45193 ) ( SURFACE-AT ?auto_45201 ?auto_45193 ) ( CLEAR ?auto_45201 ) ( LIFTING ?auto_45197 ?auto_45200 ) ( IS-CRATE ?auto_45200 ) ( not ( = ?auto_45187 ?auto_45201 ) ) ( not ( = ?auto_45188 ?auto_45201 ) ) ( not ( = ?auto_45192 ?auto_45201 ) ) ( not ( = ?auto_45198 ?auto_45201 ) ) ( not ( = ?auto_45199 ?auto_45201 ) ) ( not ( = ?auto_45200 ?auto_45201 ) ) ( not ( = ?auto_45190 ?auto_45201 ) ) )
    :subtasks
    ( ( !DROP ?auto_45197 ?auto_45200 ?auto_45201 ?auto_45193 )
      ( MAKE-ON ?auto_45187 ?auto_45188 )
      ( MAKE-ON-VERIFY ?auto_45187 ?auto_45188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45202 - SURFACE
      ?auto_45203 - SURFACE
    )
    :vars
    (
      ?auto_45215 - HOIST
      ?auto_45209 - PLACE
      ?auto_45208 - PLACE
      ?auto_45205 - HOIST
      ?auto_45206 - SURFACE
      ?auto_45212 - SURFACE
      ?auto_45211 - PLACE
      ?auto_45213 - HOIST
      ?auto_45214 - SURFACE
      ?auto_45204 - SURFACE
      ?auto_45207 - SURFACE
      ?auto_45210 - TRUCK
      ?auto_45216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45215 ?auto_45209 ) ( IS-CRATE ?auto_45202 ) ( not ( = ?auto_45202 ?auto_45203 ) ) ( not ( = ?auto_45208 ?auto_45209 ) ) ( HOIST-AT ?auto_45205 ?auto_45208 ) ( not ( = ?auto_45215 ?auto_45205 ) ) ( AVAILABLE ?auto_45205 ) ( SURFACE-AT ?auto_45202 ?auto_45208 ) ( ON ?auto_45202 ?auto_45206 ) ( CLEAR ?auto_45202 ) ( not ( = ?auto_45202 ?auto_45206 ) ) ( not ( = ?auto_45203 ?auto_45206 ) ) ( IS-CRATE ?auto_45203 ) ( not ( = ?auto_45202 ?auto_45212 ) ) ( not ( = ?auto_45203 ?auto_45212 ) ) ( not ( = ?auto_45206 ?auto_45212 ) ) ( not ( = ?auto_45211 ?auto_45209 ) ) ( not ( = ?auto_45208 ?auto_45211 ) ) ( HOIST-AT ?auto_45213 ?auto_45211 ) ( not ( = ?auto_45215 ?auto_45213 ) ) ( not ( = ?auto_45205 ?auto_45213 ) ) ( SURFACE-AT ?auto_45203 ?auto_45211 ) ( ON ?auto_45203 ?auto_45214 ) ( CLEAR ?auto_45203 ) ( not ( = ?auto_45202 ?auto_45214 ) ) ( not ( = ?auto_45203 ?auto_45214 ) ) ( not ( = ?auto_45206 ?auto_45214 ) ) ( not ( = ?auto_45212 ?auto_45214 ) ) ( IS-CRATE ?auto_45212 ) ( not ( = ?auto_45202 ?auto_45204 ) ) ( not ( = ?auto_45203 ?auto_45204 ) ) ( not ( = ?auto_45206 ?auto_45204 ) ) ( not ( = ?auto_45212 ?auto_45204 ) ) ( not ( = ?auto_45214 ?auto_45204 ) ) ( AVAILABLE ?auto_45213 ) ( SURFACE-AT ?auto_45212 ?auto_45211 ) ( ON ?auto_45212 ?auto_45207 ) ( CLEAR ?auto_45212 ) ( not ( = ?auto_45202 ?auto_45207 ) ) ( not ( = ?auto_45203 ?auto_45207 ) ) ( not ( = ?auto_45206 ?auto_45207 ) ) ( not ( = ?auto_45212 ?auto_45207 ) ) ( not ( = ?auto_45214 ?auto_45207 ) ) ( not ( = ?auto_45204 ?auto_45207 ) ) ( TRUCK-AT ?auto_45210 ?auto_45209 ) ( SURFACE-AT ?auto_45216 ?auto_45209 ) ( CLEAR ?auto_45216 ) ( IS-CRATE ?auto_45204 ) ( not ( = ?auto_45202 ?auto_45216 ) ) ( not ( = ?auto_45203 ?auto_45216 ) ) ( not ( = ?auto_45206 ?auto_45216 ) ) ( not ( = ?auto_45212 ?auto_45216 ) ) ( not ( = ?auto_45214 ?auto_45216 ) ) ( not ( = ?auto_45204 ?auto_45216 ) ) ( not ( = ?auto_45207 ?auto_45216 ) ) ( AVAILABLE ?auto_45215 ) ( IN ?auto_45204 ?auto_45210 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45215 ?auto_45204 ?auto_45210 ?auto_45209 )
      ( MAKE-ON ?auto_45202 ?auto_45203 )
      ( MAKE-ON-VERIFY ?auto_45202 ?auto_45203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45217 - SURFACE
      ?auto_45218 - SURFACE
    )
    :vars
    (
      ?auto_45225 - HOIST
      ?auto_45227 - PLACE
      ?auto_45231 - PLACE
      ?auto_45223 - HOIST
      ?auto_45226 - SURFACE
      ?auto_45220 - SURFACE
      ?auto_45229 - PLACE
      ?auto_45224 - HOIST
      ?auto_45230 - SURFACE
      ?auto_45219 - SURFACE
      ?auto_45221 - SURFACE
      ?auto_45228 - SURFACE
      ?auto_45222 - TRUCK
      ?auto_45232 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45225 ?auto_45227 ) ( IS-CRATE ?auto_45217 ) ( not ( = ?auto_45217 ?auto_45218 ) ) ( not ( = ?auto_45231 ?auto_45227 ) ) ( HOIST-AT ?auto_45223 ?auto_45231 ) ( not ( = ?auto_45225 ?auto_45223 ) ) ( AVAILABLE ?auto_45223 ) ( SURFACE-AT ?auto_45217 ?auto_45231 ) ( ON ?auto_45217 ?auto_45226 ) ( CLEAR ?auto_45217 ) ( not ( = ?auto_45217 ?auto_45226 ) ) ( not ( = ?auto_45218 ?auto_45226 ) ) ( IS-CRATE ?auto_45218 ) ( not ( = ?auto_45217 ?auto_45220 ) ) ( not ( = ?auto_45218 ?auto_45220 ) ) ( not ( = ?auto_45226 ?auto_45220 ) ) ( not ( = ?auto_45229 ?auto_45227 ) ) ( not ( = ?auto_45231 ?auto_45229 ) ) ( HOIST-AT ?auto_45224 ?auto_45229 ) ( not ( = ?auto_45225 ?auto_45224 ) ) ( not ( = ?auto_45223 ?auto_45224 ) ) ( SURFACE-AT ?auto_45218 ?auto_45229 ) ( ON ?auto_45218 ?auto_45230 ) ( CLEAR ?auto_45218 ) ( not ( = ?auto_45217 ?auto_45230 ) ) ( not ( = ?auto_45218 ?auto_45230 ) ) ( not ( = ?auto_45226 ?auto_45230 ) ) ( not ( = ?auto_45220 ?auto_45230 ) ) ( IS-CRATE ?auto_45220 ) ( not ( = ?auto_45217 ?auto_45219 ) ) ( not ( = ?auto_45218 ?auto_45219 ) ) ( not ( = ?auto_45226 ?auto_45219 ) ) ( not ( = ?auto_45220 ?auto_45219 ) ) ( not ( = ?auto_45230 ?auto_45219 ) ) ( AVAILABLE ?auto_45224 ) ( SURFACE-AT ?auto_45220 ?auto_45229 ) ( ON ?auto_45220 ?auto_45221 ) ( CLEAR ?auto_45220 ) ( not ( = ?auto_45217 ?auto_45221 ) ) ( not ( = ?auto_45218 ?auto_45221 ) ) ( not ( = ?auto_45226 ?auto_45221 ) ) ( not ( = ?auto_45220 ?auto_45221 ) ) ( not ( = ?auto_45230 ?auto_45221 ) ) ( not ( = ?auto_45219 ?auto_45221 ) ) ( SURFACE-AT ?auto_45228 ?auto_45227 ) ( CLEAR ?auto_45228 ) ( IS-CRATE ?auto_45219 ) ( not ( = ?auto_45217 ?auto_45228 ) ) ( not ( = ?auto_45218 ?auto_45228 ) ) ( not ( = ?auto_45226 ?auto_45228 ) ) ( not ( = ?auto_45220 ?auto_45228 ) ) ( not ( = ?auto_45230 ?auto_45228 ) ) ( not ( = ?auto_45219 ?auto_45228 ) ) ( not ( = ?auto_45221 ?auto_45228 ) ) ( AVAILABLE ?auto_45225 ) ( IN ?auto_45219 ?auto_45222 ) ( TRUCK-AT ?auto_45222 ?auto_45232 ) ( not ( = ?auto_45232 ?auto_45227 ) ) ( not ( = ?auto_45231 ?auto_45232 ) ) ( not ( = ?auto_45229 ?auto_45232 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45222 ?auto_45232 ?auto_45227 )
      ( MAKE-ON ?auto_45217 ?auto_45218 )
      ( MAKE-ON-VERIFY ?auto_45217 ?auto_45218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45233 - SURFACE
      ?auto_45234 - SURFACE
    )
    :vars
    (
      ?auto_45237 - HOIST
      ?auto_45236 - PLACE
      ?auto_45243 - PLACE
      ?auto_45240 - HOIST
      ?auto_45244 - SURFACE
      ?auto_45235 - SURFACE
      ?auto_45247 - PLACE
      ?auto_45245 - HOIST
      ?auto_45241 - SURFACE
      ?auto_45239 - SURFACE
      ?auto_45246 - SURFACE
      ?auto_45242 - SURFACE
      ?auto_45248 - TRUCK
      ?auto_45238 - PLACE
      ?auto_45249 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45237 ?auto_45236 ) ( IS-CRATE ?auto_45233 ) ( not ( = ?auto_45233 ?auto_45234 ) ) ( not ( = ?auto_45243 ?auto_45236 ) ) ( HOIST-AT ?auto_45240 ?auto_45243 ) ( not ( = ?auto_45237 ?auto_45240 ) ) ( AVAILABLE ?auto_45240 ) ( SURFACE-AT ?auto_45233 ?auto_45243 ) ( ON ?auto_45233 ?auto_45244 ) ( CLEAR ?auto_45233 ) ( not ( = ?auto_45233 ?auto_45244 ) ) ( not ( = ?auto_45234 ?auto_45244 ) ) ( IS-CRATE ?auto_45234 ) ( not ( = ?auto_45233 ?auto_45235 ) ) ( not ( = ?auto_45234 ?auto_45235 ) ) ( not ( = ?auto_45244 ?auto_45235 ) ) ( not ( = ?auto_45247 ?auto_45236 ) ) ( not ( = ?auto_45243 ?auto_45247 ) ) ( HOIST-AT ?auto_45245 ?auto_45247 ) ( not ( = ?auto_45237 ?auto_45245 ) ) ( not ( = ?auto_45240 ?auto_45245 ) ) ( SURFACE-AT ?auto_45234 ?auto_45247 ) ( ON ?auto_45234 ?auto_45241 ) ( CLEAR ?auto_45234 ) ( not ( = ?auto_45233 ?auto_45241 ) ) ( not ( = ?auto_45234 ?auto_45241 ) ) ( not ( = ?auto_45244 ?auto_45241 ) ) ( not ( = ?auto_45235 ?auto_45241 ) ) ( IS-CRATE ?auto_45235 ) ( not ( = ?auto_45233 ?auto_45239 ) ) ( not ( = ?auto_45234 ?auto_45239 ) ) ( not ( = ?auto_45244 ?auto_45239 ) ) ( not ( = ?auto_45235 ?auto_45239 ) ) ( not ( = ?auto_45241 ?auto_45239 ) ) ( AVAILABLE ?auto_45245 ) ( SURFACE-AT ?auto_45235 ?auto_45247 ) ( ON ?auto_45235 ?auto_45246 ) ( CLEAR ?auto_45235 ) ( not ( = ?auto_45233 ?auto_45246 ) ) ( not ( = ?auto_45234 ?auto_45246 ) ) ( not ( = ?auto_45244 ?auto_45246 ) ) ( not ( = ?auto_45235 ?auto_45246 ) ) ( not ( = ?auto_45241 ?auto_45246 ) ) ( not ( = ?auto_45239 ?auto_45246 ) ) ( SURFACE-AT ?auto_45242 ?auto_45236 ) ( CLEAR ?auto_45242 ) ( IS-CRATE ?auto_45239 ) ( not ( = ?auto_45233 ?auto_45242 ) ) ( not ( = ?auto_45234 ?auto_45242 ) ) ( not ( = ?auto_45244 ?auto_45242 ) ) ( not ( = ?auto_45235 ?auto_45242 ) ) ( not ( = ?auto_45241 ?auto_45242 ) ) ( not ( = ?auto_45239 ?auto_45242 ) ) ( not ( = ?auto_45246 ?auto_45242 ) ) ( AVAILABLE ?auto_45237 ) ( TRUCK-AT ?auto_45248 ?auto_45238 ) ( not ( = ?auto_45238 ?auto_45236 ) ) ( not ( = ?auto_45243 ?auto_45238 ) ) ( not ( = ?auto_45247 ?auto_45238 ) ) ( HOIST-AT ?auto_45249 ?auto_45238 ) ( LIFTING ?auto_45249 ?auto_45239 ) ( not ( = ?auto_45237 ?auto_45249 ) ) ( not ( = ?auto_45240 ?auto_45249 ) ) ( not ( = ?auto_45245 ?auto_45249 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45249 ?auto_45239 ?auto_45248 ?auto_45238 )
      ( MAKE-ON ?auto_45233 ?auto_45234 )
      ( MAKE-ON-VERIFY ?auto_45233 ?auto_45234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45250 - SURFACE
      ?auto_45251 - SURFACE
    )
    :vars
    (
      ?auto_45254 - HOIST
      ?auto_45256 - PLACE
      ?auto_45263 - PLACE
      ?auto_45259 - HOIST
      ?auto_45265 - SURFACE
      ?auto_45253 - SURFACE
      ?auto_45257 - PLACE
      ?auto_45255 - HOIST
      ?auto_45258 - SURFACE
      ?auto_45264 - SURFACE
      ?auto_45266 - SURFACE
      ?auto_45252 - SURFACE
      ?auto_45262 - TRUCK
      ?auto_45260 - PLACE
      ?auto_45261 - HOIST
      ?auto_45267 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45254 ?auto_45256 ) ( IS-CRATE ?auto_45250 ) ( not ( = ?auto_45250 ?auto_45251 ) ) ( not ( = ?auto_45263 ?auto_45256 ) ) ( HOIST-AT ?auto_45259 ?auto_45263 ) ( not ( = ?auto_45254 ?auto_45259 ) ) ( AVAILABLE ?auto_45259 ) ( SURFACE-AT ?auto_45250 ?auto_45263 ) ( ON ?auto_45250 ?auto_45265 ) ( CLEAR ?auto_45250 ) ( not ( = ?auto_45250 ?auto_45265 ) ) ( not ( = ?auto_45251 ?auto_45265 ) ) ( IS-CRATE ?auto_45251 ) ( not ( = ?auto_45250 ?auto_45253 ) ) ( not ( = ?auto_45251 ?auto_45253 ) ) ( not ( = ?auto_45265 ?auto_45253 ) ) ( not ( = ?auto_45257 ?auto_45256 ) ) ( not ( = ?auto_45263 ?auto_45257 ) ) ( HOIST-AT ?auto_45255 ?auto_45257 ) ( not ( = ?auto_45254 ?auto_45255 ) ) ( not ( = ?auto_45259 ?auto_45255 ) ) ( SURFACE-AT ?auto_45251 ?auto_45257 ) ( ON ?auto_45251 ?auto_45258 ) ( CLEAR ?auto_45251 ) ( not ( = ?auto_45250 ?auto_45258 ) ) ( not ( = ?auto_45251 ?auto_45258 ) ) ( not ( = ?auto_45265 ?auto_45258 ) ) ( not ( = ?auto_45253 ?auto_45258 ) ) ( IS-CRATE ?auto_45253 ) ( not ( = ?auto_45250 ?auto_45264 ) ) ( not ( = ?auto_45251 ?auto_45264 ) ) ( not ( = ?auto_45265 ?auto_45264 ) ) ( not ( = ?auto_45253 ?auto_45264 ) ) ( not ( = ?auto_45258 ?auto_45264 ) ) ( AVAILABLE ?auto_45255 ) ( SURFACE-AT ?auto_45253 ?auto_45257 ) ( ON ?auto_45253 ?auto_45266 ) ( CLEAR ?auto_45253 ) ( not ( = ?auto_45250 ?auto_45266 ) ) ( not ( = ?auto_45251 ?auto_45266 ) ) ( not ( = ?auto_45265 ?auto_45266 ) ) ( not ( = ?auto_45253 ?auto_45266 ) ) ( not ( = ?auto_45258 ?auto_45266 ) ) ( not ( = ?auto_45264 ?auto_45266 ) ) ( SURFACE-AT ?auto_45252 ?auto_45256 ) ( CLEAR ?auto_45252 ) ( IS-CRATE ?auto_45264 ) ( not ( = ?auto_45250 ?auto_45252 ) ) ( not ( = ?auto_45251 ?auto_45252 ) ) ( not ( = ?auto_45265 ?auto_45252 ) ) ( not ( = ?auto_45253 ?auto_45252 ) ) ( not ( = ?auto_45258 ?auto_45252 ) ) ( not ( = ?auto_45264 ?auto_45252 ) ) ( not ( = ?auto_45266 ?auto_45252 ) ) ( AVAILABLE ?auto_45254 ) ( TRUCK-AT ?auto_45262 ?auto_45260 ) ( not ( = ?auto_45260 ?auto_45256 ) ) ( not ( = ?auto_45263 ?auto_45260 ) ) ( not ( = ?auto_45257 ?auto_45260 ) ) ( HOIST-AT ?auto_45261 ?auto_45260 ) ( not ( = ?auto_45254 ?auto_45261 ) ) ( not ( = ?auto_45259 ?auto_45261 ) ) ( not ( = ?auto_45255 ?auto_45261 ) ) ( AVAILABLE ?auto_45261 ) ( SURFACE-AT ?auto_45264 ?auto_45260 ) ( ON ?auto_45264 ?auto_45267 ) ( CLEAR ?auto_45264 ) ( not ( = ?auto_45250 ?auto_45267 ) ) ( not ( = ?auto_45251 ?auto_45267 ) ) ( not ( = ?auto_45265 ?auto_45267 ) ) ( not ( = ?auto_45253 ?auto_45267 ) ) ( not ( = ?auto_45258 ?auto_45267 ) ) ( not ( = ?auto_45264 ?auto_45267 ) ) ( not ( = ?auto_45266 ?auto_45267 ) ) ( not ( = ?auto_45252 ?auto_45267 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45261 ?auto_45264 ?auto_45267 ?auto_45260 )
      ( MAKE-ON ?auto_45250 ?auto_45251 )
      ( MAKE-ON-VERIFY ?auto_45250 ?auto_45251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45268 - SURFACE
      ?auto_45269 - SURFACE
    )
    :vars
    (
      ?auto_45270 - HOIST
      ?auto_45282 - PLACE
      ?auto_45284 - PLACE
      ?auto_45272 - HOIST
      ?auto_45278 - SURFACE
      ?auto_45276 - SURFACE
      ?auto_45274 - PLACE
      ?auto_45271 - HOIST
      ?auto_45285 - SURFACE
      ?auto_45277 - SURFACE
      ?auto_45283 - SURFACE
      ?auto_45273 - SURFACE
      ?auto_45281 - PLACE
      ?auto_45280 - HOIST
      ?auto_45275 - SURFACE
      ?auto_45279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45270 ?auto_45282 ) ( IS-CRATE ?auto_45268 ) ( not ( = ?auto_45268 ?auto_45269 ) ) ( not ( = ?auto_45284 ?auto_45282 ) ) ( HOIST-AT ?auto_45272 ?auto_45284 ) ( not ( = ?auto_45270 ?auto_45272 ) ) ( AVAILABLE ?auto_45272 ) ( SURFACE-AT ?auto_45268 ?auto_45284 ) ( ON ?auto_45268 ?auto_45278 ) ( CLEAR ?auto_45268 ) ( not ( = ?auto_45268 ?auto_45278 ) ) ( not ( = ?auto_45269 ?auto_45278 ) ) ( IS-CRATE ?auto_45269 ) ( not ( = ?auto_45268 ?auto_45276 ) ) ( not ( = ?auto_45269 ?auto_45276 ) ) ( not ( = ?auto_45278 ?auto_45276 ) ) ( not ( = ?auto_45274 ?auto_45282 ) ) ( not ( = ?auto_45284 ?auto_45274 ) ) ( HOIST-AT ?auto_45271 ?auto_45274 ) ( not ( = ?auto_45270 ?auto_45271 ) ) ( not ( = ?auto_45272 ?auto_45271 ) ) ( SURFACE-AT ?auto_45269 ?auto_45274 ) ( ON ?auto_45269 ?auto_45285 ) ( CLEAR ?auto_45269 ) ( not ( = ?auto_45268 ?auto_45285 ) ) ( not ( = ?auto_45269 ?auto_45285 ) ) ( not ( = ?auto_45278 ?auto_45285 ) ) ( not ( = ?auto_45276 ?auto_45285 ) ) ( IS-CRATE ?auto_45276 ) ( not ( = ?auto_45268 ?auto_45277 ) ) ( not ( = ?auto_45269 ?auto_45277 ) ) ( not ( = ?auto_45278 ?auto_45277 ) ) ( not ( = ?auto_45276 ?auto_45277 ) ) ( not ( = ?auto_45285 ?auto_45277 ) ) ( AVAILABLE ?auto_45271 ) ( SURFACE-AT ?auto_45276 ?auto_45274 ) ( ON ?auto_45276 ?auto_45283 ) ( CLEAR ?auto_45276 ) ( not ( = ?auto_45268 ?auto_45283 ) ) ( not ( = ?auto_45269 ?auto_45283 ) ) ( not ( = ?auto_45278 ?auto_45283 ) ) ( not ( = ?auto_45276 ?auto_45283 ) ) ( not ( = ?auto_45285 ?auto_45283 ) ) ( not ( = ?auto_45277 ?auto_45283 ) ) ( SURFACE-AT ?auto_45273 ?auto_45282 ) ( CLEAR ?auto_45273 ) ( IS-CRATE ?auto_45277 ) ( not ( = ?auto_45268 ?auto_45273 ) ) ( not ( = ?auto_45269 ?auto_45273 ) ) ( not ( = ?auto_45278 ?auto_45273 ) ) ( not ( = ?auto_45276 ?auto_45273 ) ) ( not ( = ?auto_45285 ?auto_45273 ) ) ( not ( = ?auto_45277 ?auto_45273 ) ) ( not ( = ?auto_45283 ?auto_45273 ) ) ( AVAILABLE ?auto_45270 ) ( not ( = ?auto_45281 ?auto_45282 ) ) ( not ( = ?auto_45284 ?auto_45281 ) ) ( not ( = ?auto_45274 ?auto_45281 ) ) ( HOIST-AT ?auto_45280 ?auto_45281 ) ( not ( = ?auto_45270 ?auto_45280 ) ) ( not ( = ?auto_45272 ?auto_45280 ) ) ( not ( = ?auto_45271 ?auto_45280 ) ) ( AVAILABLE ?auto_45280 ) ( SURFACE-AT ?auto_45277 ?auto_45281 ) ( ON ?auto_45277 ?auto_45275 ) ( CLEAR ?auto_45277 ) ( not ( = ?auto_45268 ?auto_45275 ) ) ( not ( = ?auto_45269 ?auto_45275 ) ) ( not ( = ?auto_45278 ?auto_45275 ) ) ( not ( = ?auto_45276 ?auto_45275 ) ) ( not ( = ?auto_45285 ?auto_45275 ) ) ( not ( = ?auto_45277 ?auto_45275 ) ) ( not ( = ?auto_45283 ?auto_45275 ) ) ( not ( = ?auto_45273 ?auto_45275 ) ) ( TRUCK-AT ?auto_45279 ?auto_45282 ) )
    :subtasks
    ( ( !DRIVE ?auto_45279 ?auto_45282 ?auto_45281 )
      ( MAKE-ON ?auto_45268 ?auto_45269 )
      ( MAKE-ON-VERIFY ?auto_45268 ?auto_45269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45286 - SURFACE
      ?auto_45287 - SURFACE
    )
    :vars
    (
      ?auto_45299 - HOIST
      ?auto_45293 - PLACE
      ?auto_45291 - PLACE
      ?auto_45300 - HOIST
      ?auto_45295 - SURFACE
      ?auto_45288 - SURFACE
      ?auto_45292 - PLACE
      ?auto_45296 - HOIST
      ?auto_45290 - SURFACE
      ?auto_45289 - SURFACE
      ?auto_45298 - SURFACE
      ?auto_45297 - SURFACE
      ?auto_45294 - PLACE
      ?auto_45301 - HOIST
      ?auto_45303 - SURFACE
      ?auto_45302 - TRUCK
      ?auto_45304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45299 ?auto_45293 ) ( IS-CRATE ?auto_45286 ) ( not ( = ?auto_45286 ?auto_45287 ) ) ( not ( = ?auto_45291 ?auto_45293 ) ) ( HOIST-AT ?auto_45300 ?auto_45291 ) ( not ( = ?auto_45299 ?auto_45300 ) ) ( AVAILABLE ?auto_45300 ) ( SURFACE-AT ?auto_45286 ?auto_45291 ) ( ON ?auto_45286 ?auto_45295 ) ( CLEAR ?auto_45286 ) ( not ( = ?auto_45286 ?auto_45295 ) ) ( not ( = ?auto_45287 ?auto_45295 ) ) ( IS-CRATE ?auto_45287 ) ( not ( = ?auto_45286 ?auto_45288 ) ) ( not ( = ?auto_45287 ?auto_45288 ) ) ( not ( = ?auto_45295 ?auto_45288 ) ) ( not ( = ?auto_45292 ?auto_45293 ) ) ( not ( = ?auto_45291 ?auto_45292 ) ) ( HOIST-AT ?auto_45296 ?auto_45292 ) ( not ( = ?auto_45299 ?auto_45296 ) ) ( not ( = ?auto_45300 ?auto_45296 ) ) ( SURFACE-AT ?auto_45287 ?auto_45292 ) ( ON ?auto_45287 ?auto_45290 ) ( CLEAR ?auto_45287 ) ( not ( = ?auto_45286 ?auto_45290 ) ) ( not ( = ?auto_45287 ?auto_45290 ) ) ( not ( = ?auto_45295 ?auto_45290 ) ) ( not ( = ?auto_45288 ?auto_45290 ) ) ( IS-CRATE ?auto_45288 ) ( not ( = ?auto_45286 ?auto_45289 ) ) ( not ( = ?auto_45287 ?auto_45289 ) ) ( not ( = ?auto_45295 ?auto_45289 ) ) ( not ( = ?auto_45288 ?auto_45289 ) ) ( not ( = ?auto_45290 ?auto_45289 ) ) ( AVAILABLE ?auto_45296 ) ( SURFACE-AT ?auto_45288 ?auto_45292 ) ( ON ?auto_45288 ?auto_45298 ) ( CLEAR ?auto_45288 ) ( not ( = ?auto_45286 ?auto_45298 ) ) ( not ( = ?auto_45287 ?auto_45298 ) ) ( not ( = ?auto_45295 ?auto_45298 ) ) ( not ( = ?auto_45288 ?auto_45298 ) ) ( not ( = ?auto_45290 ?auto_45298 ) ) ( not ( = ?auto_45289 ?auto_45298 ) ) ( IS-CRATE ?auto_45289 ) ( not ( = ?auto_45286 ?auto_45297 ) ) ( not ( = ?auto_45287 ?auto_45297 ) ) ( not ( = ?auto_45295 ?auto_45297 ) ) ( not ( = ?auto_45288 ?auto_45297 ) ) ( not ( = ?auto_45290 ?auto_45297 ) ) ( not ( = ?auto_45289 ?auto_45297 ) ) ( not ( = ?auto_45298 ?auto_45297 ) ) ( not ( = ?auto_45294 ?auto_45293 ) ) ( not ( = ?auto_45291 ?auto_45294 ) ) ( not ( = ?auto_45292 ?auto_45294 ) ) ( HOIST-AT ?auto_45301 ?auto_45294 ) ( not ( = ?auto_45299 ?auto_45301 ) ) ( not ( = ?auto_45300 ?auto_45301 ) ) ( not ( = ?auto_45296 ?auto_45301 ) ) ( AVAILABLE ?auto_45301 ) ( SURFACE-AT ?auto_45289 ?auto_45294 ) ( ON ?auto_45289 ?auto_45303 ) ( CLEAR ?auto_45289 ) ( not ( = ?auto_45286 ?auto_45303 ) ) ( not ( = ?auto_45287 ?auto_45303 ) ) ( not ( = ?auto_45295 ?auto_45303 ) ) ( not ( = ?auto_45288 ?auto_45303 ) ) ( not ( = ?auto_45290 ?auto_45303 ) ) ( not ( = ?auto_45289 ?auto_45303 ) ) ( not ( = ?auto_45298 ?auto_45303 ) ) ( not ( = ?auto_45297 ?auto_45303 ) ) ( TRUCK-AT ?auto_45302 ?auto_45293 ) ( SURFACE-AT ?auto_45304 ?auto_45293 ) ( CLEAR ?auto_45304 ) ( LIFTING ?auto_45299 ?auto_45297 ) ( IS-CRATE ?auto_45297 ) ( not ( = ?auto_45286 ?auto_45304 ) ) ( not ( = ?auto_45287 ?auto_45304 ) ) ( not ( = ?auto_45295 ?auto_45304 ) ) ( not ( = ?auto_45288 ?auto_45304 ) ) ( not ( = ?auto_45290 ?auto_45304 ) ) ( not ( = ?auto_45289 ?auto_45304 ) ) ( not ( = ?auto_45298 ?auto_45304 ) ) ( not ( = ?auto_45297 ?auto_45304 ) ) ( not ( = ?auto_45303 ?auto_45304 ) ) )
    :subtasks
    ( ( !DROP ?auto_45299 ?auto_45297 ?auto_45304 ?auto_45293 )
      ( MAKE-ON ?auto_45286 ?auto_45287 )
      ( MAKE-ON-VERIFY ?auto_45286 ?auto_45287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45305 - SURFACE
      ?auto_45306 - SURFACE
    )
    :vars
    (
      ?auto_45320 - HOIST
      ?auto_45314 - PLACE
      ?auto_45312 - PLACE
      ?auto_45321 - HOIST
      ?auto_45319 - SURFACE
      ?auto_45309 - SURFACE
      ?auto_45313 - PLACE
      ?auto_45308 - HOIST
      ?auto_45311 - SURFACE
      ?auto_45310 - SURFACE
      ?auto_45316 - SURFACE
      ?auto_45322 - SURFACE
      ?auto_45317 - PLACE
      ?auto_45315 - HOIST
      ?auto_45318 - SURFACE
      ?auto_45323 - TRUCK
      ?auto_45307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45320 ?auto_45314 ) ( IS-CRATE ?auto_45305 ) ( not ( = ?auto_45305 ?auto_45306 ) ) ( not ( = ?auto_45312 ?auto_45314 ) ) ( HOIST-AT ?auto_45321 ?auto_45312 ) ( not ( = ?auto_45320 ?auto_45321 ) ) ( AVAILABLE ?auto_45321 ) ( SURFACE-AT ?auto_45305 ?auto_45312 ) ( ON ?auto_45305 ?auto_45319 ) ( CLEAR ?auto_45305 ) ( not ( = ?auto_45305 ?auto_45319 ) ) ( not ( = ?auto_45306 ?auto_45319 ) ) ( IS-CRATE ?auto_45306 ) ( not ( = ?auto_45305 ?auto_45309 ) ) ( not ( = ?auto_45306 ?auto_45309 ) ) ( not ( = ?auto_45319 ?auto_45309 ) ) ( not ( = ?auto_45313 ?auto_45314 ) ) ( not ( = ?auto_45312 ?auto_45313 ) ) ( HOIST-AT ?auto_45308 ?auto_45313 ) ( not ( = ?auto_45320 ?auto_45308 ) ) ( not ( = ?auto_45321 ?auto_45308 ) ) ( SURFACE-AT ?auto_45306 ?auto_45313 ) ( ON ?auto_45306 ?auto_45311 ) ( CLEAR ?auto_45306 ) ( not ( = ?auto_45305 ?auto_45311 ) ) ( not ( = ?auto_45306 ?auto_45311 ) ) ( not ( = ?auto_45319 ?auto_45311 ) ) ( not ( = ?auto_45309 ?auto_45311 ) ) ( IS-CRATE ?auto_45309 ) ( not ( = ?auto_45305 ?auto_45310 ) ) ( not ( = ?auto_45306 ?auto_45310 ) ) ( not ( = ?auto_45319 ?auto_45310 ) ) ( not ( = ?auto_45309 ?auto_45310 ) ) ( not ( = ?auto_45311 ?auto_45310 ) ) ( AVAILABLE ?auto_45308 ) ( SURFACE-AT ?auto_45309 ?auto_45313 ) ( ON ?auto_45309 ?auto_45316 ) ( CLEAR ?auto_45309 ) ( not ( = ?auto_45305 ?auto_45316 ) ) ( not ( = ?auto_45306 ?auto_45316 ) ) ( not ( = ?auto_45319 ?auto_45316 ) ) ( not ( = ?auto_45309 ?auto_45316 ) ) ( not ( = ?auto_45311 ?auto_45316 ) ) ( not ( = ?auto_45310 ?auto_45316 ) ) ( IS-CRATE ?auto_45310 ) ( not ( = ?auto_45305 ?auto_45322 ) ) ( not ( = ?auto_45306 ?auto_45322 ) ) ( not ( = ?auto_45319 ?auto_45322 ) ) ( not ( = ?auto_45309 ?auto_45322 ) ) ( not ( = ?auto_45311 ?auto_45322 ) ) ( not ( = ?auto_45310 ?auto_45322 ) ) ( not ( = ?auto_45316 ?auto_45322 ) ) ( not ( = ?auto_45317 ?auto_45314 ) ) ( not ( = ?auto_45312 ?auto_45317 ) ) ( not ( = ?auto_45313 ?auto_45317 ) ) ( HOIST-AT ?auto_45315 ?auto_45317 ) ( not ( = ?auto_45320 ?auto_45315 ) ) ( not ( = ?auto_45321 ?auto_45315 ) ) ( not ( = ?auto_45308 ?auto_45315 ) ) ( AVAILABLE ?auto_45315 ) ( SURFACE-AT ?auto_45310 ?auto_45317 ) ( ON ?auto_45310 ?auto_45318 ) ( CLEAR ?auto_45310 ) ( not ( = ?auto_45305 ?auto_45318 ) ) ( not ( = ?auto_45306 ?auto_45318 ) ) ( not ( = ?auto_45319 ?auto_45318 ) ) ( not ( = ?auto_45309 ?auto_45318 ) ) ( not ( = ?auto_45311 ?auto_45318 ) ) ( not ( = ?auto_45310 ?auto_45318 ) ) ( not ( = ?auto_45316 ?auto_45318 ) ) ( not ( = ?auto_45322 ?auto_45318 ) ) ( TRUCK-AT ?auto_45323 ?auto_45314 ) ( SURFACE-AT ?auto_45307 ?auto_45314 ) ( CLEAR ?auto_45307 ) ( IS-CRATE ?auto_45322 ) ( not ( = ?auto_45305 ?auto_45307 ) ) ( not ( = ?auto_45306 ?auto_45307 ) ) ( not ( = ?auto_45319 ?auto_45307 ) ) ( not ( = ?auto_45309 ?auto_45307 ) ) ( not ( = ?auto_45311 ?auto_45307 ) ) ( not ( = ?auto_45310 ?auto_45307 ) ) ( not ( = ?auto_45316 ?auto_45307 ) ) ( not ( = ?auto_45322 ?auto_45307 ) ) ( not ( = ?auto_45318 ?auto_45307 ) ) ( AVAILABLE ?auto_45320 ) ( IN ?auto_45322 ?auto_45323 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45320 ?auto_45322 ?auto_45323 ?auto_45314 )
      ( MAKE-ON ?auto_45305 ?auto_45306 )
      ( MAKE-ON-VERIFY ?auto_45305 ?auto_45306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45324 - SURFACE
      ?auto_45325 - SURFACE
    )
    :vars
    (
      ?auto_45338 - HOIST
      ?auto_45329 - PLACE
      ?auto_45341 - PLACE
      ?auto_45336 - HOIST
      ?auto_45327 - SURFACE
      ?auto_45330 - SURFACE
      ?auto_45331 - PLACE
      ?auto_45339 - HOIST
      ?auto_45340 - SURFACE
      ?auto_45332 - SURFACE
      ?auto_45328 - SURFACE
      ?auto_45333 - SURFACE
      ?auto_45334 - PLACE
      ?auto_45326 - HOIST
      ?auto_45342 - SURFACE
      ?auto_45335 - SURFACE
      ?auto_45337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45338 ?auto_45329 ) ( IS-CRATE ?auto_45324 ) ( not ( = ?auto_45324 ?auto_45325 ) ) ( not ( = ?auto_45341 ?auto_45329 ) ) ( HOIST-AT ?auto_45336 ?auto_45341 ) ( not ( = ?auto_45338 ?auto_45336 ) ) ( AVAILABLE ?auto_45336 ) ( SURFACE-AT ?auto_45324 ?auto_45341 ) ( ON ?auto_45324 ?auto_45327 ) ( CLEAR ?auto_45324 ) ( not ( = ?auto_45324 ?auto_45327 ) ) ( not ( = ?auto_45325 ?auto_45327 ) ) ( IS-CRATE ?auto_45325 ) ( not ( = ?auto_45324 ?auto_45330 ) ) ( not ( = ?auto_45325 ?auto_45330 ) ) ( not ( = ?auto_45327 ?auto_45330 ) ) ( not ( = ?auto_45331 ?auto_45329 ) ) ( not ( = ?auto_45341 ?auto_45331 ) ) ( HOIST-AT ?auto_45339 ?auto_45331 ) ( not ( = ?auto_45338 ?auto_45339 ) ) ( not ( = ?auto_45336 ?auto_45339 ) ) ( SURFACE-AT ?auto_45325 ?auto_45331 ) ( ON ?auto_45325 ?auto_45340 ) ( CLEAR ?auto_45325 ) ( not ( = ?auto_45324 ?auto_45340 ) ) ( not ( = ?auto_45325 ?auto_45340 ) ) ( not ( = ?auto_45327 ?auto_45340 ) ) ( not ( = ?auto_45330 ?auto_45340 ) ) ( IS-CRATE ?auto_45330 ) ( not ( = ?auto_45324 ?auto_45332 ) ) ( not ( = ?auto_45325 ?auto_45332 ) ) ( not ( = ?auto_45327 ?auto_45332 ) ) ( not ( = ?auto_45330 ?auto_45332 ) ) ( not ( = ?auto_45340 ?auto_45332 ) ) ( AVAILABLE ?auto_45339 ) ( SURFACE-AT ?auto_45330 ?auto_45331 ) ( ON ?auto_45330 ?auto_45328 ) ( CLEAR ?auto_45330 ) ( not ( = ?auto_45324 ?auto_45328 ) ) ( not ( = ?auto_45325 ?auto_45328 ) ) ( not ( = ?auto_45327 ?auto_45328 ) ) ( not ( = ?auto_45330 ?auto_45328 ) ) ( not ( = ?auto_45340 ?auto_45328 ) ) ( not ( = ?auto_45332 ?auto_45328 ) ) ( IS-CRATE ?auto_45332 ) ( not ( = ?auto_45324 ?auto_45333 ) ) ( not ( = ?auto_45325 ?auto_45333 ) ) ( not ( = ?auto_45327 ?auto_45333 ) ) ( not ( = ?auto_45330 ?auto_45333 ) ) ( not ( = ?auto_45340 ?auto_45333 ) ) ( not ( = ?auto_45332 ?auto_45333 ) ) ( not ( = ?auto_45328 ?auto_45333 ) ) ( not ( = ?auto_45334 ?auto_45329 ) ) ( not ( = ?auto_45341 ?auto_45334 ) ) ( not ( = ?auto_45331 ?auto_45334 ) ) ( HOIST-AT ?auto_45326 ?auto_45334 ) ( not ( = ?auto_45338 ?auto_45326 ) ) ( not ( = ?auto_45336 ?auto_45326 ) ) ( not ( = ?auto_45339 ?auto_45326 ) ) ( AVAILABLE ?auto_45326 ) ( SURFACE-AT ?auto_45332 ?auto_45334 ) ( ON ?auto_45332 ?auto_45342 ) ( CLEAR ?auto_45332 ) ( not ( = ?auto_45324 ?auto_45342 ) ) ( not ( = ?auto_45325 ?auto_45342 ) ) ( not ( = ?auto_45327 ?auto_45342 ) ) ( not ( = ?auto_45330 ?auto_45342 ) ) ( not ( = ?auto_45340 ?auto_45342 ) ) ( not ( = ?auto_45332 ?auto_45342 ) ) ( not ( = ?auto_45328 ?auto_45342 ) ) ( not ( = ?auto_45333 ?auto_45342 ) ) ( SURFACE-AT ?auto_45335 ?auto_45329 ) ( CLEAR ?auto_45335 ) ( IS-CRATE ?auto_45333 ) ( not ( = ?auto_45324 ?auto_45335 ) ) ( not ( = ?auto_45325 ?auto_45335 ) ) ( not ( = ?auto_45327 ?auto_45335 ) ) ( not ( = ?auto_45330 ?auto_45335 ) ) ( not ( = ?auto_45340 ?auto_45335 ) ) ( not ( = ?auto_45332 ?auto_45335 ) ) ( not ( = ?auto_45328 ?auto_45335 ) ) ( not ( = ?auto_45333 ?auto_45335 ) ) ( not ( = ?auto_45342 ?auto_45335 ) ) ( AVAILABLE ?auto_45338 ) ( IN ?auto_45333 ?auto_45337 ) ( TRUCK-AT ?auto_45337 ?auto_45341 ) )
    :subtasks
    ( ( !DRIVE ?auto_45337 ?auto_45341 ?auto_45329 )
      ( MAKE-ON ?auto_45324 ?auto_45325 )
      ( MAKE-ON-VERIFY ?auto_45324 ?auto_45325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45343 - SURFACE
      ?auto_45344 - SURFACE
    )
    :vars
    (
      ?auto_45350 - HOIST
      ?auto_45347 - PLACE
      ?auto_45349 - PLACE
      ?auto_45351 - HOIST
      ?auto_45346 - SURFACE
      ?auto_45345 - SURFACE
      ?auto_45352 - PLACE
      ?auto_45358 - HOIST
      ?auto_45353 - SURFACE
      ?auto_45354 - SURFACE
      ?auto_45357 - SURFACE
      ?auto_45361 - SURFACE
      ?auto_45356 - PLACE
      ?auto_45348 - HOIST
      ?auto_45355 - SURFACE
      ?auto_45360 - SURFACE
      ?auto_45359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45350 ?auto_45347 ) ( IS-CRATE ?auto_45343 ) ( not ( = ?auto_45343 ?auto_45344 ) ) ( not ( = ?auto_45349 ?auto_45347 ) ) ( HOIST-AT ?auto_45351 ?auto_45349 ) ( not ( = ?auto_45350 ?auto_45351 ) ) ( SURFACE-AT ?auto_45343 ?auto_45349 ) ( ON ?auto_45343 ?auto_45346 ) ( CLEAR ?auto_45343 ) ( not ( = ?auto_45343 ?auto_45346 ) ) ( not ( = ?auto_45344 ?auto_45346 ) ) ( IS-CRATE ?auto_45344 ) ( not ( = ?auto_45343 ?auto_45345 ) ) ( not ( = ?auto_45344 ?auto_45345 ) ) ( not ( = ?auto_45346 ?auto_45345 ) ) ( not ( = ?auto_45352 ?auto_45347 ) ) ( not ( = ?auto_45349 ?auto_45352 ) ) ( HOIST-AT ?auto_45358 ?auto_45352 ) ( not ( = ?auto_45350 ?auto_45358 ) ) ( not ( = ?auto_45351 ?auto_45358 ) ) ( SURFACE-AT ?auto_45344 ?auto_45352 ) ( ON ?auto_45344 ?auto_45353 ) ( CLEAR ?auto_45344 ) ( not ( = ?auto_45343 ?auto_45353 ) ) ( not ( = ?auto_45344 ?auto_45353 ) ) ( not ( = ?auto_45346 ?auto_45353 ) ) ( not ( = ?auto_45345 ?auto_45353 ) ) ( IS-CRATE ?auto_45345 ) ( not ( = ?auto_45343 ?auto_45354 ) ) ( not ( = ?auto_45344 ?auto_45354 ) ) ( not ( = ?auto_45346 ?auto_45354 ) ) ( not ( = ?auto_45345 ?auto_45354 ) ) ( not ( = ?auto_45353 ?auto_45354 ) ) ( AVAILABLE ?auto_45358 ) ( SURFACE-AT ?auto_45345 ?auto_45352 ) ( ON ?auto_45345 ?auto_45357 ) ( CLEAR ?auto_45345 ) ( not ( = ?auto_45343 ?auto_45357 ) ) ( not ( = ?auto_45344 ?auto_45357 ) ) ( not ( = ?auto_45346 ?auto_45357 ) ) ( not ( = ?auto_45345 ?auto_45357 ) ) ( not ( = ?auto_45353 ?auto_45357 ) ) ( not ( = ?auto_45354 ?auto_45357 ) ) ( IS-CRATE ?auto_45354 ) ( not ( = ?auto_45343 ?auto_45361 ) ) ( not ( = ?auto_45344 ?auto_45361 ) ) ( not ( = ?auto_45346 ?auto_45361 ) ) ( not ( = ?auto_45345 ?auto_45361 ) ) ( not ( = ?auto_45353 ?auto_45361 ) ) ( not ( = ?auto_45354 ?auto_45361 ) ) ( not ( = ?auto_45357 ?auto_45361 ) ) ( not ( = ?auto_45356 ?auto_45347 ) ) ( not ( = ?auto_45349 ?auto_45356 ) ) ( not ( = ?auto_45352 ?auto_45356 ) ) ( HOIST-AT ?auto_45348 ?auto_45356 ) ( not ( = ?auto_45350 ?auto_45348 ) ) ( not ( = ?auto_45351 ?auto_45348 ) ) ( not ( = ?auto_45358 ?auto_45348 ) ) ( AVAILABLE ?auto_45348 ) ( SURFACE-AT ?auto_45354 ?auto_45356 ) ( ON ?auto_45354 ?auto_45355 ) ( CLEAR ?auto_45354 ) ( not ( = ?auto_45343 ?auto_45355 ) ) ( not ( = ?auto_45344 ?auto_45355 ) ) ( not ( = ?auto_45346 ?auto_45355 ) ) ( not ( = ?auto_45345 ?auto_45355 ) ) ( not ( = ?auto_45353 ?auto_45355 ) ) ( not ( = ?auto_45354 ?auto_45355 ) ) ( not ( = ?auto_45357 ?auto_45355 ) ) ( not ( = ?auto_45361 ?auto_45355 ) ) ( SURFACE-AT ?auto_45360 ?auto_45347 ) ( CLEAR ?auto_45360 ) ( IS-CRATE ?auto_45361 ) ( not ( = ?auto_45343 ?auto_45360 ) ) ( not ( = ?auto_45344 ?auto_45360 ) ) ( not ( = ?auto_45346 ?auto_45360 ) ) ( not ( = ?auto_45345 ?auto_45360 ) ) ( not ( = ?auto_45353 ?auto_45360 ) ) ( not ( = ?auto_45354 ?auto_45360 ) ) ( not ( = ?auto_45357 ?auto_45360 ) ) ( not ( = ?auto_45361 ?auto_45360 ) ) ( not ( = ?auto_45355 ?auto_45360 ) ) ( AVAILABLE ?auto_45350 ) ( TRUCK-AT ?auto_45359 ?auto_45349 ) ( LIFTING ?auto_45351 ?auto_45361 ) )
    :subtasks
    ( ( !LOAD ?auto_45351 ?auto_45361 ?auto_45359 ?auto_45349 )
      ( MAKE-ON ?auto_45343 ?auto_45344 )
      ( MAKE-ON-VERIFY ?auto_45343 ?auto_45344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45362 - SURFACE
      ?auto_45363 - SURFACE
    )
    :vars
    (
      ?auto_45377 - HOIST
      ?auto_45372 - PLACE
      ?auto_45365 - PLACE
      ?auto_45370 - HOIST
      ?auto_45376 - SURFACE
      ?auto_45366 - SURFACE
      ?auto_45368 - PLACE
      ?auto_45379 - HOIST
      ?auto_45371 - SURFACE
      ?auto_45369 - SURFACE
      ?auto_45373 - SURFACE
      ?auto_45378 - SURFACE
      ?auto_45375 - PLACE
      ?auto_45374 - HOIST
      ?auto_45367 - SURFACE
      ?auto_45380 - SURFACE
      ?auto_45364 - TRUCK
      ?auto_45381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45377 ?auto_45372 ) ( IS-CRATE ?auto_45362 ) ( not ( = ?auto_45362 ?auto_45363 ) ) ( not ( = ?auto_45365 ?auto_45372 ) ) ( HOIST-AT ?auto_45370 ?auto_45365 ) ( not ( = ?auto_45377 ?auto_45370 ) ) ( SURFACE-AT ?auto_45362 ?auto_45365 ) ( ON ?auto_45362 ?auto_45376 ) ( CLEAR ?auto_45362 ) ( not ( = ?auto_45362 ?auto_45376 ) ) ( not ( = ?auto_45363 ?auto_45376 ) ) ( IS-CRATE ?auto_45363 ) ( not ( = ?auto_45362 ?auto_45366 ) ) ( not ( = ?auto_45363 ?auto_45366 ) ) ( not ( = ?auto_45376 ?auto_45366 ) ) ( not ( = ?auto_45368 ?auto_45372 ) ) ( not ( = ?auto_45365 ?auto_45368 ) ) ( HOIST-AT ?auto_45379 ?auto_45368 ) ( not ( = ?auto_45377 ?auto_45379 ) ) ( not ( = ?auto_45370 ?auto_45379 ) ) ( SURFACE-AT ?auto_45363 ?auto_45368 ) ( ON ?auto_45363 ?auto_45371 ) ( CLEAR ?auto_45363 ) ( not ( = ?auto_45362 ?auto_45371 ) ) ( not ( = ?auto_45363 ?auto_45371 ) ) ( not ( = ?auto_45376 ?auto_45371 ) ) ( not ( = ?auto_45366 ?auto_45371 ) ) ( IS-CRATE ?auto_45366 ) ( not ( = ?auto_45362 ?auto_45369 ) ) ( not ( = ?auto_45363 ?auto_45369 ) ) ( not ( = ?auto_45376 ?auto_45369 ) ) ( not ( = ?auto_45366 ?auto_45369 ) ) ( not ( = ?auto_45371 ?auto_45369 ) ) ( AVAILABLE ?auto_45379 ) ( SURFACE-AT ?auto_45366 ?auto_45368 ) ( ON ?auto_45366 ?auto_45373 ) ( CLEAR ?auto_45366 ) ( not ( = ?auto_45362 ?auto_45373 ) ) ( not ( = ?auto_45363 ?auto_45373 ) ) ( not ( = ?auto_45376 ?auto_45373 ) ) ( not ( = ?auto_45366 ?auto_45373 ) ) ( not ( = ?auto_45371 ?auto_45373 ) ) ( not ( = ?auto_45369 ?auto_45373 ) ) ( IS-CRATE ?auto_45369 ) ( not ( = ?auto_45362 ?auto_45378 ) ) ( not ( = ?auto_45363 ?auto_45378 ) ) ( not ( = ?auto_45376 ?auto_45378 ) ) ( not ( = ?auto_45366 ?auto_45378 ) ) ( not ( = ?auto_45371 ?auto_45378 ) ) ( not ( = ?auto_45369 ?auto_45378 ) ) ( not ( = ?auto_45373 ?auto_45378 ) ) ( not ( = ?auto_45375 ?auto_45372 ) ) ( not ( = ?auto_45365 ?auto_45375 ) ) ( not ( = ?auto_45368 ?auto_45375 ) ) ( HOIST-AT ?auto_45374 ?auto_45375 ) ( not ( = ?auto_45377 ?auto_45374 ) ) ( not ( = ?auto_45370 ?auto_45374 ) ) ( not ( = ?auto_45379 ?auto_45374 ) ) ( AVAILABLE ?auto_45374 ) ( SURFACE-AT ?auto_45369 ?auto_45375 ) ( ON ?auto_45369 ?auto_45367 ) ( CLEAR ?auto_45369 ) ( not ( = ?auto_45362 ?auto_45367 ) ) ( not ( = ?auto_45363 ?auto_45367 ) ) ( not ( = ?auto_45376 ?auto_45367 ) ) ( not ( = ?auto_45366 ?auto_45367 ) ) ( not ( = ?auto_45371 ?auto_45367 ) ) ( not ( = ?auto_45369 ?auto_45367 ) ) ( not ( = ?auto_45373 ?auto_45367 ) ) ( not ( = ?auto_45378 ?auto_45367 ) ) ( SURFACE-AT ?auto_45380 ?auto_45372 ) ( CLEAR ?auto_45380 ) ( IS-CRATE ?auto_45378 ) ( not ( = ?auto_45362 ?auto_45380 ) ) ( not ( = ?auto_45363 ?auto_45380 ) ) ( not ( = ?auto_45376 ?auto_45380 ) ) ( not ( = ?auto_45366 ?auto_45380 ) ) ( not ( = ?auto_45371 ?auto_45380 ) ) ( not ( = ?auto_45369 ?auto_45380 ) ) ( not ( = ?auto_45373 ?auto_45380 ) ) ( not ( = ?auto_45378 ?auto_45380 ) ) ( not ( = ?auto_45367 ?auto_45380 ) ) ( AVAILABLE ?auto_45377 ) ( TRUCK-AT ?auto_45364 ?auto_45365 ) ( AVAILABLE ?auto_45370 ) ( SURFACE-AT ?auto_45378 ?auto_45365 ) ( ON ?auto_45378 ?auto_45381 ) ( CLEAR ?auto_45378 ) ( not ( = ?auto_45362 ?auto_45381 ) ) ( not ( = ?auto_45363 ?auto_45381 ) ) ( not ( = ?auto_45376 ?auto_45381 ) ) ( not ( = ?auto_45366 ?auto_45381 ) ) ( not ( = ?auto_45371 ?auto_45381 ) ) ( not ( = ?auto_45369 ?auto_45381 ) ) ( not ( = ?auto_45373 ?auto_45381 ) ) ( not ( = ?auto_45378 ?auto_45381 ) ) ( not ( = ?auto_45367 ?auto_45381 ) ) ( not ( = ?auto_45380 ?auto_45381 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45370 ?auto_45378 ?auto_45381 ?auto_45365 )
      ( MAKE-ON ?auto_45362 ?auto_45363 )
      ( MAKE-ON-VERIFY ?auto_45362 ?auto_45363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45382 - SURFACE
      ?auto_45383 - SURFACE
    )
    :vars
    (
      ?auto_45401 - HOIST
      ?auto_45384 - PLACE
      ?auto_45394 - PLACE
      ?auto_45397 - HOIST
      ?auto_45396 - SURFACE
      ?auto_45385 - SURFACE
      ?auto_45387 - PLACE
      ?auto_45400 - HOIST
      ?auto_45392 - SURFACE
      ?auto_45393 - SURFACE
      ?auto_45386 - SURFACE
      ?auto_45399 - SURFACE
      ?auto_45388 - PLACE
      ?auto_45398 - HOIST
      ?auto_45395 - SURFACE
      ?auto_45389 - SURFACE
      ?auto_45391 - SURFACE
      ?auto_45390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45401 ?auto_45384 ) ( IS-CRATE ?auto_45382 ) ( not ( = ?auto_45382 ?auto_45383 ) ) ( not ( = ?auto_45394 ?auto_45384 ) ) ( HOIST-AT ?auto_45397 ?auto_45394 ) ( not ( = ?auto_45401 ?auto_45397 ) ) ( SURFACE-AT ?auto_45382 ?auto_45394 ) ( ON ?auto_45382 ?auto_45396 ) ( CLEAR ?auto_45382 ) ( not ( = ?auto_45382 ?auto_45396 ) ) ( not ( = ?auto_45383 ?auto_45396 ) ) ( IS-CRATE ?auto_45383 ) ( not ( = ?auto_45382 ?auto_45385 ) ) ( not ( = ?auto_45383 ?auto_45385 ) ) ( not ( = ?auto_45396 ?auto_45385 ) ) ( not ( = ?auto_45387 ?auto_45384 ) ) ( not ( = ?auto_45394 ?auto_45387 ) ) ( HOIST-AT ?auto_45400 ?auto_45387 ) ( not ( = ?auto_45401 ?auto_45400 ) ) ( not ( = ?auto_45397 ?auto_45400 ) ) ( SURFACE-AT ?auto_45383 ?auto_45387 ) ( ON ?auto_45383 ?auto_45392 ) ( CLEAR ?auto_45383 ) ( not ( = ?auto_45382 ?auto_45392 ) ) ( not ( = ?auto_45383 ?auto_45392 ) ) ( not ( = ?auto_45396 ?auto_45392 ) ) ( not ( = ?auto_45385 ?auto_45392 ) ) ( IS-CRATE ?auto_45385 ) ( not ( = ?auto_45382 ?auto_45393 ) ) ( not ( = ?auto_45383 ?auto_45393 ) ) ( not ( = ?auto_45396 ?auto_45393 ) ) ( not ( = ?auto_45385 ?auto_45393 ) ) ( not ( = ?auto_45392 ?auto_45393 ) ) ( AVAILABLE ?auto_45400 ) ( SURFACE-AT ?auto_45385 ?auto_45387 ) ( ON ?auto_45385 ?auto_45386 ) ( CLEAR ?auto_45385 ) ( not ( = ?auto_45382 ?auto_45386 ) ) ( not ( = ?auto_45383 ?auto_45386 ) ) ( not ( = ?auto_45396 ?auto_45386 ) ) ( not ( = ?auto_45385 ?auto_45386 ) ) ( not ( = ?auto_45392 ?auto_45386 ) ) ( not ( = ?auto_45393 ?auto_45386 ) ) ( IS-CRATE ?auto_45393 ) ( not ( = ?auto_45382 ?auto_45399 ) ) ( not ( = ?auto_45383 ?auto_45399 ) ) ( not ( = ?auto_45396 ?auto_45399 ) ) ( not ( = ?auto_45385 ?auto_45399 ) ) ( not ( = ?auto_45392 ?auto_45399 ) ) ( not ( = ?auto_45393 ?auto_45399 ) ) ( not ( = ?auto_45386 ?auto_45399 ) ) ( not ( = ?auto_45388 ?auto_45384 ) ) ( not ( = ?auto_45394 ?auto_45388 ) ) ( not ( = ?auto_45387 ?auto_45388 ) ) ( HOIST-AT ?auto_45398 ?auto_45388 ) ( not ( = ?auto_45401 ?auto_45398 ) ) ( not ( = ?auto_45397 ?auto_45398 ) ) ( not ( = ?auto_45400 ?auto_45398 ) ) ( AVAILABLE ?auto_45398 ) ( SURFACE-AT ?auto_45393 ?auto_45388 ) ( ON ?auto_45393 ?auto_45395 ) ( CLEAR ?auto_45393 ) ( not ( = ?auto_45382 ?auto_45395 ) ) ( not ( = ?auto_45383 ?auto_45395 ) ) ( not ( = ?auto_45396 ?auto_45395 ) ) ( not ( = ?auto_45385 ?auto_45395 ) ) ( not ( = ?auto_45392 ?auto_45395 ) ) ( not ( = ?auto_45393 ?auto_45395 ) ) ( not ( = ?auto_45386 ?auto_45395 ) ) ( not ( = ?auto_45399 ?auto_45395 ) ) ( SURFACE-AT ?auto_45389 ?auto_45384 ) ( CLEAR ?auto_45389 ) ( IS-CRATE ?auto_45399 ) ( not ( = ?auto_45382 ?auto_45389 ) ) ( not ( = ?auto_45383 ?auto_45389 ) ) ( not ( = ?auto_45396 ?auto_45389 ) ) ( not ( = ?auto_45385 ?auto_45389 ) ) ( not ( = ?auto_45392 ?auto_45389 ) ) ( not ( = ?auto_45393 ?auto_45389 ) ) ( not ( = ?auto_45386 ?auto_45389 ) ) ( not ( = ?auto_45399 ?auto_45389 ) ) ( not ( = ?auto_45395 ?auto_45389 ) ) ( AVAILABLE ?auto_45401 ) ( AVAILABLE ?auto_45397 ) ( SURFACE-AT ?auto_45399 ?auto_45394 ) ( ON ?auto_45399 ?auto_45391 ) ( CLEAR ?auto_45399 ) ( not ( = ?auto_45382 ?auto_45391 ) ) ( not ( = ?auto_45383 ?auto_45391 ) ) ( not ( = ?auto_45396 ?auto_45391 ) ) ( not ( = ?auto_45385 ?auto_45391 ) ) ( not ( = ?auto_45392 ?auto_45391 ) ) ( not ( = ?auto_45393 ?auto_45391 ) ) ( not ( = ?auto_45386 ?auto_45391 ) ) ( not ( = ?auto_45399 ?auto_45391 ) ) ( not ( = ?auto_45395 ?auto_45391 ) ) ( not ( = ?auto_45389 ?auto_45391 ) ) ( TRUCK-AT ?auto_45390 ?auto_45384 ) )
    :subtasks
    ( ( !DRIVE ?auto_45390 ?auto_45384 ?auto_45394 )
      ( MAKE-ON ?auto_45382 ?auto_45383 )
      ( MAKE-ON-VERIFY ?auto_45382 ?auto_45383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45402 - SURFACE
      ?auto_45403 - SURFACE
    )
    :vars
    (
      ?auto_45405 - HOIST
      ?auto_45407 - PLACE
      ?auto_45404 - PLACE
      ?auto_45414 - HOIST
      ?auto_45415 - SURFACE
      ?auto_45411 - SURFACE
      ?auto_45419 - PLACE
      ?auto_45413 - HOIST
      ?auto_45409 - SURFACE
      ?auto_45408 - SURFACE
      ?auto_45417 - SURFACE
      ?auto_45418 - SURFACE
      ?auto_45410 - PLACE
      ?auto_45406 - HOIST
      ?auto_45421 - SURFACE
      ?auto_45420 - SURFACE
      ?auto_45412 - SURFACE
      ?auto_45416 - TRUCK
      ?auto_45422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45405 ?auto_45407 ) ( IS-CRATE ?auto_45402 ) ( not ( = ?auto_45402 ?auto_45403 ) ) ( not ( = ?auto_45404 ?auto_45407 ) ) ( HOIST-AT ?auto_45414 ?auto_45404 ) ( not ( = ?auto_45405 ?auto_45414 ) ) ( SURFACE-AT ?auto_45402 ?auto_45404 ) ( ON ?auto_45402 ?auto_45415 ) ( CLEAR ?auto_45402 ) ( not ( = ?auto_45402 ?auto_45415 ) ) ( not ( = ?auto_45403 ?auto_45415 ) ) ( IS-CRATE ?auto_45403 ) ( not ( = ?auto_45402 ?auto_45411 ) ) ( not ( = ?auto_45403 ?auto_45411 ) ) ( not ( = ?auto_45415 ?auto_45411 ) ) ( not ( = ?auto_45419 ?auto_45407 ) ) ( not ( = ?auto_45404 ?auto_45419 ) ) ( HOIST-AT ?auto_45413 ?auto_45419 ) ( not ( = ?auto_45405 ?auto_45413 ) ) ( not ( = ?auto_45414 ?auto_45413 ) ) ( SURFACE-AT ?auto_45403 ?auto_45419 ) ( ON ?auto_45403 ?auto_45409 ) ( CLEAR ?auto_45403 ) ( not ( = ?auto_45402 ?auto_45409 ) ) ( not ( = ?auto_45403 ?auto_45409 ) ) ( not ( = ?auto_45415 ?auto_45409 ) ) ( not ( = ?auto_45411 ?auto_45409 ) ) ( IS-CRATE ?auto_45411 ) ( not ( = ?auto_45402 ?auto_45408 ) ) ( not ( = ?auto_45403 ?auto_45408 ) ) ( not ( = ?auto_45415 ?auto_45408 ) ) ( not ( = ?auto_45411 ?auto_45408 ) ) ( not ( = ?auto_45409 ?auto_45408 ) ) ( AVAILABLE ?auto_45413 ) ( SURFACE-AT ?auto_45411 ?auto_45419 ) ( ON ?auto_45411 ?auto_45417 ) ( CLEAR ?auto_45411 ) ( not ( = ?auto_45402 ?auto_45417 ) ) ( not ( = ?auto_45403 ?auto_45417 ) ) ( not ( = ?auto_45415 ?auto_45417 ) ) ( not ( = ?auto_45411 ?auto_45417 ) ) ( not ( = ?auto_45409 ?auto_45417 ) ) ( not ( = ?auto_45408 ?auto_45417 ) ) ( IS-CRATE ?auto_45408 ) ( not ( = ?auto_45402 ?auto_45418 ) ) ( not ( = ?auto_45403 ?auto_45418 ) ) ( not ( = ?auto_45415 ?auto_45418 ) ) ( not ( = ?auto_45411 ?auto_45418 ) ) ( not ( = ?auto_45409 ?auto_45418 ) ) ( not ( = ?auto_45408 ?auto_45418 ) ) ( not ( = ?auto_45417 ?auto_45418 ) ) ( not ( = ?auto_45410 ?auto_45407 ) ) ( not ( = ?auto_45404 ?auto_45410 ) ) ( not ( = ?auto_45419 ?auto_45410 ) ) ( HOIST-AT ?auto_45406 ?auto_45410 ) ( not ( = ?auto_45405 ?auto_45406 ) ) ( not ( = ?auto_45414 ?auto_45406 ) ) ( not ( = ?auto_45413 ?auto_45406 ) ) ( AVAILABLE ?auto_45406 ) ( SURFACE-AT ?auto_45408 ?auto_45410 ) ( ON ?auto_45408 ?auto_45421 ) ( CLEAR ?auto_45408 ) ( not ( = ?auto_45402 ?auto_45421 ) ) ( not ( = ?auto_45403 ?auto_45421 ) ) ( not ( = ?auto_45415 ?auto_45421 ) ) ( not ( = ?auto_45411 ?auto_45421 ) ) ( not ( = ?auto_45409 ?auto_45421 ) ) ( not ( = ?auto_45408 ?auto_45421 ) ) ( not ( = ?auto_45417 ?auto_45421 ) ) ( not ( = ?auto_45418 ?auto_45421 ) ) ( IS-CRATE ?auto_45418 ) ( not ( = ?auto_45402 ?auto_45420 ) ) ( not ( = ?auto_45403 ?auto_45420 ) ) ( not ( = ?auto_45415 ?auto_45420 ) ) ( not ( = ?auto_45411 ?auto_45420 ) ) ( not ( = ?auto_45409 ?auto_45420 ) ) ( not ( = ?auto_45408 ?auto_45420 ) ) ( not ( = ?auto_45417 ?auto_45420 ) ) ( not ( = ?auto_45418 ?auto_45420 ) ) ( not ( = ?auto_45421 ?auto_45420 ) ) ( AVAILABLE ?auto_45414 ) ( SURFACE-AT ?auto_45418 ?auto_45404 ) ( ON ?auto_45418 ?auto_45412 ) ( CLEAR ?auto_45418 ) ( not ( = ?auto_45402 ?auto_45412 ) ) ( not ( = ?auto_45403 ?auto_45412 ) ) ( not ( = ?auto_45415 ?auto_45412 ) ) ( not ( = ?auto_45411 ?auto_45412 ) ) ( not ( = ?auto_45409 ?auto_45412 ) ) ( not ( = ?auto_45408 ?auto_45412 ) ) ( not ( = ?auto_45417 ?auto_45412 ) ) ( not ( = ?auto_45418 ?auto_45412 ) ) ( not ( = ?auto_45421 ?auto_45412 ) ) ( not ( = ?auto_45420 ?auto_45412 ) ) ( TRUCK-AT ?auto_45416 ?auto_45407 ) ( SURFACE-AT ?auto_45422 ?auto_45407 ) ( CLEAR ?auto_45422 ) ( LIFTING ?auto_45405 ?auto_45420 ) ( IS-CRATE ?auto_45420 ) ( not ( = ?auto_45402 ?auto_45422 ) ) ( not ( = ?auto_45403 ?auto_45422 ) ) ( not ( = ?auto_45415 ?auto_45422 ) ) ( not ( = ?auto_45411 ?auto_45422 ) ) ( not ( = ?auto_45409 ?auto_45422 ) ) ( not ( = ?auto_45408 ?auto_45422 ) ) ( not ( = ?auto_45417 ?auto_45422 ) ) ( not ( = ?auto_45418 ?auto_45422 ) ) ( not ( = ?auto_45421 ?auto_45422 ) ) ( not ( = ?auto_45420 ?auto_45422 ) ) ( not ( = ?auto_45412 ?auto_45422 ) ) )
    :subtasks
    ( ( !DROP ?auto_45405 ?auto_45420 ?auto_45422 ?auto_45407 )
      ( MAKE-ON ?auto_45402 ?auto_45403 )
      ( MAKE-ON-VERIFY ?auto_45402 ?auto_45403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45423 - SURFACE
      ?auto_45424 - SURFACE
    )
    :vars
    (
      ?auto_45439 - HOIST
      ?auto_45435 - PLACE
      ?auto_45425 - PLACE
      ?auto_45427 - HOIST
      ?auto_45429 - SURFACE
      ?auto_45431 - SURFACE
      ?auto_45441 - PLACE
      ?auto_45426 - HOIST
      ?auto_45432 - SURFACE
      ?auto_45440 - SURFACE
      ?auto_45428 - SURFACE
      ?auto_45437 - SURFACE
      ?auto_45438 - PLACE
      ?auto_45434 - HOIST
      ?auto_45443 - SURFACE
      ?auto_45442 - SURFACE
      ?auto_45433 - SURFACE
      ?auto_45430 - TRUCK
      ?auto_45436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45439 ?auto_45435 ) ( IS-CRATE ?auto_45423 ) ( not ( = ?auto_45423 ?auto_45424 ) ) ( not ( = ?auto_45425 ?auto_45435 ) ) ( HOIST-AT ?auto_45427 ?auto_45425 ) ( not ( = ?auto_45439 ?auto_45427 ) ) ( SURFACE-AT ?auto_45423 ?auto_45425 ) ( ON ?auto_45423 ?auto_45429 ) ( CLEAR ?auto_45423 ) ( not ( = ?auto_45423 ?auto_45429 ) ) ( not ( = ?auto_45424 ?auto_45429 ) ) ( IS-CRATE ?auto_45424 ) ( not ( = ?auto_45423 ?auto_45431 ) ) ( not ( = ?auto_45424 ?auto_45431 ) ) ( not ( = ?auto_45429 ?auto_45431 ) ) ( not ( = ?auto_45441 ?auto_45435 ) ) ( not ( = ?auto_45425 ?auto_45441 ) ) ( HOIST-AT ?auto_45426 ?auto_45441 ) ( not ( = ?auto_45439 ?auto_45426 ) ) ( not ( = ?auto_45427 ?auto_45426 ) ) ( SURFACE-AT ?auto_45424 ?auto_45441 ) ( ON ?auto_45424 ?auto_45432 ) ( CLEAR ?auto_45424 ) ( not ( = ?auto_45423 ?auto_45432 ) ) ( not ( = ?auto_45424 ?auto_45432 ) ) ( not ( = ?auto_45429 ?auto_45432 ) ) ( not ( = ?auto_45431 ?auto_45432 ) ) ( IS-CRATE ?auto_45431 ) ( not ( = ?auto_45423 ?auto_45440 ) ) ( not ( = ?auto_45424 ?auto_45440 ) ) ( not ( = ?auto_45429 ?auto_45440 ) ) ( not ( = ?auto_45431 ?auto_45440 ) ) ( not ( = ?auto_45432 ?auto_45440 ) ) ( AVAILABLE ?auto_45426 ) ( SURFACE-AT ?auto_45431 ?auto_45441 ) ( ON ?auto_45431 ?auto_45428 ) ( CLEAR ?auto_45431 ) ( not ( = ?auto_45423 ?auto_45428 ) ) ( not ( = ?auto_45424 ?auto_45428 ) ) ( not ( = ?auto_45429 ?auto_45428 ) ) ( not ( = ?auto_45431 ?auto_45428 ) ) ( not ( = ?auto_45432 ?auto_45428 ) ) ( not ( = ?auto_45440 ?auto_45428 ) ) ( IS-CRATE ?auto_45440 ) ( not ( = ?auto_45423 ?auto_45437 ) ) ( not ( = ?auto_45424 ?auto_45437 ) ) ( not ( = ?auto_45429 ?auto_45437 ) ) ( not ( = ?auto_45431 ?auto_45437 ) ) ( not ( = ?auto_45432 ?auto_45437 ) ) ( not ( = ?auto_45440 ?auto_45437 ) ) ( not ( = ?auto_45428 ?auto_45437 ) ) ( not ( = ?auto_45438 ?auto_45435 ) ) ( not ( = ?auto_45425 ?auto_45438 ) ) ( not ( = ?auto_45441 ?auto_45438 ) ) ( HOIST-AT ?auto_45434 ?auto_45438 ) ( not ( = ?auto_45439 ?auto_45434 ) ) ( not ( = ?auto_45427 ?auto_45434 ) ) ( not ( = ?auto_45426 ?auto_45434 ) ) ( AVAILABLE ?auto_45434 ) ( SURFACE-AT ?auto_45440 ?auto_45438 ) ( ON ?auto_45440 ?auto_45443 ) ( CLEAR ?auto_45440 ) ( not ( = ?auto_45423 ?auto_45443 ) ) ( not ( = ?auto_45424 ?auto_45443 ) ) ( not ( = ?auto_45429 ?auto_45443 ) ) ( not ( = ?auto_45431 ?auto_45443 ) ) ( not ( = ?auto_45432 ?auto_45443 ) ) ( not ( = ?auto_45440 ?auto_45443 ) ) ( not ( = ?auto_45428 ?auto_45443 ) ) ( not ( = ?auto_45437 ?auto_45443 ) ) ( IS-CRATE ?auto_45437 ) ( not ( = ?auto_45423 ?auto_45442 ) ) ( not ( = ?auto_45424 ?auto_45442 ) ) ( not ( = ?auto_45429 ?auto_45442 ) ) ( not ( = ?auto_45431 ?auto_45442 ) ) ( not ( = ?auto_45432 ?auto_45442 ) ) ( not ( = ?auto_45440 ?auto_45442 ) ) ( not ( = ?auto_45428 ?auto_45442 ) ) ( not ( = ?auto_45437 ?auto_45442 ) ) ( not ( = ?auto_45443 ?auto_45442 ) ) ( AVAILABLE ?auto_45427 ) ( SURFACE-AT ?auto_45437 ?auto_45425 ) ( ON ?auto_45437 ?auto_45433 ) ( CLEAR ?auto_45437 ) ( not ( = ?auto_45423 ?auto_45433 ) ) ( not ( = ?auto_45424 ?auto_45433 ) ) ( not ( = ?auto_45429 ?auto_45433 ) ) ( not ( = ?auto_45431 ?auto_45433 ) ) ( not ( = ?auto_45432 ?auto_45433 ) ) ( not ( = ?auto_45440 ?auto_45433 ) ) ( not ( = ?auto_45428 ?auto_45433 ) ) ( not ( = ?auto_45437 ?auto_45433 ) ) ( not ( = ?auto_45443 ?auto_45433 ) ) ( not ( = ?auto_45442 ?auto_45433 ) ) ( TRUCK-AT ?auto_45430 ?auto_45435 ) ( SURFACE-AT ?auto_45436 ?auto_45435 ) ( CLEAR ?auto_45436 ) ( IS-CRATE ?auto_45442 ) ( not ( = ?auto_45423 ?auto_45436 ) ) ( not ( = ?auto_45424 ?auto_45436 ) ) ( not ( = ?auto_45429 ?auto_45436 ) ) ( not ( = ?auto_45431 ?auto_45436 ) ) ( not ( = ?auto_45432 ?auto_45436 ) ) ( not ( = ?auto_45440 ?auto_45436 ) ) ( not ( = ?auto_45428 ?auto_45436 ) ) ( not ( = ?auto_45437 ?auto_45436 ) ) ( not ( = ?auto_45443 ?auto_45436 ) ) ( not ( = ?auto_45442 ?auto_45436 ) ) ( not ( = ?auto_45433 ?auto_45436 ) ) ( AVAILABLE ?auto_45439 ) ( IN ?auto_45442 ?auto_45430 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45439 ?auto_45442 ?auto_45430 ?auto_45435 )
      ( MAKE-ON ?auto_45423 ?auto_45424 )
      ( MAKE-ON-VERIFY ?auto_45423 ?auto_45424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45444 - SURFACE
      ?auto_45445 - SURFACE
    )
    :vars
    (
      ?auto_45459 - HOIST
      ?auto_45450 - PLACE
      ?auto_45452 - PLACE
      ?auto_45451 - HOIST
      ?auto_45447 - SURFACE
      ?auto_45455 - SURFACE
      ?auto_45463 - PLACE
      ?auto_45448 - HOIST
      ?auto_45460 - SURFACE
      ?auto_45457 - SURFACE
      ?auto_45458 - SURFACE
      ?auto_45454 - SURFACE
      ?auto_45462 - PLACE
      ?auto_45453 - HOIST
      ?auto_45449 - SURFACE
      ?auto_45446 - SURFACE
      ?auto_45456 - SURFACE
      ?auto_45461 - SURFACE
      ?auto_45464 - TRUCK
      ?auto_45465 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45459 ?auto_45450 ) ( IS-CRATE ?auto_45444 ) ( not ( = ?auto_45444 ?auto_45445 ) ) ( not ( = ?auto_45452 ?auto_45450 ) ) ( HOIST-AT ?auto_45451 ?auto_45452 ) ( not ( = ?auto_45459 ?auto_45451 ) ) ( SURFACE-AT ?auto_45444 ?auto_45452 ) ( ON ?auto_45444 ?auto_45447 ) ( CLEAR ?auto_45444 ) ( not ( = ?auto_45444 ?auto_45447 ) ) ( not ( = ?auto_45445 ?auto_45447 ) ) ( IS-CRATE ?auto_45445 ) ( not ( = ?auto_45444 ?auto_45455 ) ) ( not ( = ?auto_45445 ?auto_45455 ) ) ( not ( = ?auto_45447 ?auto_45455 ) ) ( not ( = ?auto_45463 ?auto_45450 ) ) ( not ( = ?auto_45452 ?auto_45463 ) ) ( HOIST-AT ?auto_45448 ?auto_45463 ) ( not ( = ?auto_45459 ?auto_45448 ) ) ( not ( = ?auto_45451 ?auto_45448 ) ) ( SURFACE-AT ?auto_45445 ?auto_45463 ) ( ON ?auto_45445 ?auto_45460 ) ( CLEAR ?auto_45445 ) ( not ( = ?auto_45444 ?auto_45460 ) ) ( not ( = ?auto_45445 ?auto_45460 ) ) ( not ( = ?auto_45447 ?auto_45460 ) ) ( not ( = ?auto_45455 ?auto_45460 ) ) ( IS-CRATE ?auto_45455 ) ( not ( = ?auto_45444 ?auto_45457 ) ) ( not ( = ?auto_45445 ?auto_45457 ) ) ( not ( = ?auto_45447 ?auto_45457 ) ) ( not ( = ?auto_45455 ?auto_45457 ) ) ( not ( = ?auto_45460 ?auto_45457 ) ) ( AVAILABLE ?auto_45448 ) ( SURFACE-AT ?auto_45455 ?auto_45463 ) ( ON ?auto_45455 ?auto_45458 ) ( CLEAR ?auto_45455 ) ( not ( = ?auto_45444 ?auto_45458 ) ) ( not ( = ?auto_45445 ?auto_45458 ) ) ( not ( = ?auto_45447 ?auto_45458 ) ) ( not ( = ?auto_45455 ?auto_45458 ) ) ( not ( = ?auto_45460 ?auto_45458 ) ) ( not ( = ?auto_45457 ?auto_45458 ) ) ( IS-CRATE ?auto_45457 ) ( not ( = ?auto_45444 ?auto_45454 ) ) ( not ( = ?auto_45445 ?auto_45454 ) ) ( not ( = ?auto_45447 ?auto_45454 ) ) ( not ( = ?auto_45455 ?auto_45454 ) ) ( not ( = ?auto_45460 ?auto_45454 ) ) ( not ( = ?auto_45457 ?auto_45454 ) ) ( not ( = ?auto_45458 ?auto_45454 ) ) ( not ( = ?auto_45462 ?auto_45450 ) ) ( not ( = ?auto_45452 ?auto_45462 ) ) ( not ( = ?auto_45463 ?auto_45462 ) ) ( HOIST-AT ?auto_45453 ?auto_45462 ) ( not ( = ?auto_45459 ?auto_45453 ) ) ( not ( = ?auto_45451 ?auto_45453 ) ) ( not ( = ?auto_45448 ?auto_45453 ) ) ( AVAILABLE ?auto_45453 ) ( SURFACE-AT ?auto_45457 ?auto_45462 ) ( ON ?auto_45457 ?auto_45449 ) ( CLEAR ?auto_45457 ) ( not ( = ?auto_45444 ?auto_45449 ) ) ( not ( = ?auto_45445 ?auto_45449 ) ) ( not ( = ?auto_45447 ?auto_45449 ) ) ( not ( = ?auto_45455 ?auto_45449 ) ) ( not ( = ?auto_45460 ?auto_45449 ) ) ( not ( = ?auto_45457 ?auto_45449 ) ) ( not ( = ?auto_45458 ?auto_45449 ) ) ( not ( = ?auto_45454 ?auto_45449 ) ) ( IS-CRATE ?auto_45454 ) ( not ( = ?auto_45444 ?auto_45446 ) ) ( not ( = ?auto_45445 ?auto_45446 ) ) ( not ( = ?auto_45447 ?auto_45446 ) ) ( not ( = ?auto_45455 ?auto_45446 ) ) ( not ( = ?auto_45460 ?auto_45446 ) ) ( not ( = ?auto_45457 ?auto_45446 ) ) ( not ( = ?auto_45458 ?auto_45446 ) ) ( not ( = ?auto_45454 ?auto_45446 ) ) ( not ( = ?auto_45449 ?auto_45446 ) ) ( AVAILABLE ?auto_45451 ) ( SURFACE-AT ?auto_45454 ?auto_45452 ) ( ON ?auto_45454 ?auto_45456 ) ( CLEAR ?auto_45454 ) ( not ( = ?auto_45444 ?auto_45456 ) ) ( not ( = ?auto_45445 ?auto_45456 ) ) ( not ( = ?auto_45447 ?auto_45456 ) ) ( not ( = ?auto_45455 ?auto_45456 ) ) ( not ( = ?auto_45460 ?auto_45456 ) ) ( not ( = ?auto_45457 ?auto_45456 ) ) ( not ( = ?auto_45458 ?auto_45456 ) ) ( not ( = ?auto_45454 ?auto_45456 ) ) ( not ( = ?auto_45449 ?auto_45456 ) ) ( not ( = ?auto_45446 ?auto_45456 ) ) ( SURFACE-AT ?auto_45461 ?auto_45450 ) ( CLEAR ?auto_45461 ) ( IS-CRATE ?auto_45446 ) ( not ( = ?auto_45444 ?auto_45461 ) ) ( not ( = ?auto_45445 ?auto_45461 ) ) ( not ( = ?auto_45447 ?auto_45461 ) ) ( not ( = ?auto_45455 ?auto_45461 ) ) ( not ( = ?auto_45460 ?auto_45461 ) ) ( not ( = ?auto_45457 ?auto_45461 ) ) ( not ( = ?auto_45458 ?auto_45461 ) ) ( not ( = ?auto_45454 ?auto_45461 ) ) ( not ( = ?auto_45449 ?auto_45461 ) ) ( not ( = ?auto_45446 ?auto_45461 ) ) ( not ( = ?auto_45456 ?auto_45461 ) ) ( AVAILABLE ?auto_45459 ) ( IN ?auto_45446 ?auto_45464 ) ( TRUCK-AT ?auto_45464 ?auto_45465 ) ( not ( = ?auto_45465 ?auto_45450 ) ) ( not ( = ?auto_45452 ?auto_45465 ) ) ( not ( = ?auto_45463 ?auto_45465 ) ) ( not ( = ?auto_45462 ?auto_45465 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45464 ?auto_45465 ?auto_45450 )
      ( MAKE-ON ?auto_45444 ?auto_45445 )
      ( MAKE-ON-VERIFY ?auto_45444 ?auto_45445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45466 - SURFACE
      ?auto_45467 - SURFACE
    )
    :vars
    (
      ?auto_45482 - HOIST
      ?auto_45473 - PLACE
      ?auto_45481 - PLACE
      ?auto_45471 - HOIST
      ?auto_45472 - SURFACE
      ?auto_45475 - SURFACE
      ?auto_45478 - PLACE
      ?auto_45486 - HOIST
      ?auto_45468 - SURFACE
      ?auto_45476 - SURFACE
      ?auto_45477 - SURFACE
      ?auto_45483 - SURFACE
      ?auto_45487 - PLACE
      ?auto_45469 - HOIST
      ?auto_45470 - SURFACE
      ?auto_45484 - SURFACE
      ?auto_45474 - SURFACE
      ?auto_45480 - SURFACE
      ?auto_45479 - TRUCK
      ?auto_45485 - PLACE
      ?auto_45488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45482 ?auto_45473 ) ( IS-CRATE ?auto_45466 ) ( not ( = ?auto_45466 ?auto_45467 ) ) ( not ( = ?auto_45481 ?auto_45473 ) ) ( HOIST-AT ?auto_45471 ?auto_45481 ) ( not ( = ?auto_45482 ?auto_45471 ) ) ( SURFACE-AT ?auto_45466 ?auto_45481 ) ( ON ?auto_45466 ?auto_45472 ) ( CLEAR ?auto_45466 ) ( not ( = ?auto_45466 ?auto_45472 ) ) ( not ( = ?auto_45467 ?auto_45472 ) ) ( IS-CRATE ?auto_45467 ) ( not ( = ?auto_45466 ?auto_45475 ) ) ( not ( = ?auto_45467 ?auto_45475 ) ) ( not ( = ?auto_45472 ?auto_45475 ) ) ( not ( = ?auto_45478 ?auto_45473 ) ) ( not ( = ?auto_45481 ?auto_45478 ) ) ( HOIST-AT ?auto_45486 ?auto_45478 ) ( not ( = ?auto_45482 ?auto_45486 ) ) ( not ( = ?auto_45471 ?auto_45486 ) ) ( SURFACE-AT ?auto_45467 ?auto_45478 ) ( ON ?auto_45467 ?auto_45468 ) ( CLEAR ?auto_45467 ) ( not ( = ?auto_45466 ?auto_45468 ) ) ( not ( = ?auto_45467 ?auto_45468 ) ) ( not ( = ?auto_45472 ?auto_45468 ) ) ( not ( = ?auto_45475 ?auto_45468 ) ) ( IS-CRATE ?auto_45475 ) ( not ( = ?auto_45466 ?auto_45476 ) ) ( not ( = ?auto_45467 ?auto_45476 ) ) ( not ( = ?auto_45472 ?auto_45476 ) ) ( not ( = ?auto_45475 ?auto_45476 ) ) ( not ( = ?auto_45468 ?auto_45476 ) ) ( AVAILABLE ?auto_45486 ) ( SURFACE-AT ?auto_45475 ?auto_45478 ) ( ON ?auto_45475 ?auto_45477 ) ( CLEAR ?auto_45475 ) ( not ( = ?auto_45466 ?auto_45477 ) ) ( not ( = ?auto_45467 ?auto_45477 ) ) ( not ( = ?auto_45472 ?auto_45477 ) ) ( not ( = ?auto_45475 ?auto_45477 ) ) ( not ( = ?auto_45468 ?auto_45477 ) ) ( not ( = ?auto_45476 ?auto_45477 ) ) ( IS-CRATE ?auto_45476 ) ( not ( = ?auto_45466 ?auto_45483 ) ) ( not ( = ?auto_45467 ?auto_45483 ) ) ( not ( = ?auto_45472 ?auto_45483 ) ) ( not ( = ?auto_45475 ?auto_45483 ) ) ( not ( = ?auto_45468 ?auto_45483 ) ) ( not ( = ?auto_45476 ?auto_45483 ) ) ( not ( = ?auto_45477 ?auto_45483 ) ) ( not ( = ?auto_45487 ?auto_45473 ) ) ( not ( = ?auto_45481 ?auto_45487 ) ) ( not ( = ?auto_45478 ?auto_45487 ) ) ( HOIST-AT ?auto_45469 ?auto_45487 ) ( not ( = ?auto_45482 ?auto_45469 ) ) ( not ( = ?auto_45471 ?auto_45469 ) ) ( not ( = ?auto_45486 ?auto_45469 ) ) ( AVAILABLE ?auto_45469 ) ( SURFACE-AT ?auto_45476 ?auto_45487 ) ( ON ?auto_45476 ?auto_45470 ) ( CLEAR ?auto_45476 ) ( not ( = ?auto_45466 ?auto_45470 ) ) ( not ( = ?auto_45467 ?auto_45470 ) ) ( not ( = ?auto_45472 ?auto_45470 ) ) ( not ( = ?auto_45475 ?auto_45470 ) ) ( not ( = ?auto_45468 ?auto_45470 ) ) ( not ( = ?auto_45476 ?auto_45470 ) ) ( not ( = ?auto_45477 ?auto_45470 ) ) ( not ( = ?auto_45483 ?auto_45470 ) ) ( IS-CRATE ?auto_45483 ) ( not ( = ?auto_45466 ?auto_45484 ) ) ( not ( = ?auto_45467 ?auto_45484 ) ) ( not ( = ?auto_45472 ?auto_45484 ) ) ( not ( = ?auto_45475 ?auto_45484 ) ) ( not ( = ?auto_45468 ?auto_45484 ) ) ( not ( = ?auto_45476 ?auto_45484 ) ) ( not ( = ?auto_45477 ?auto_45484 ) ) ( not ( = ?auto_45483 ?auto_45484 ) ) ( not ( = ?auto_45470 ?auto_45484 ) ) ( AVAILABLE ?auto_45471 ) ( SURFACE-AT ?auto_45483 ?auto_45481 ) ( ON ?auto_45483 ?auto_45474 ) ( CLEAR ?auto_45483 ) ( not ( = ?auto_45466 ?auto_45474 ) ) ( not ( = ?auto_45467 ?auto_45474 ) ) ( not ( = ?auto_45472 ?auto_45474 ) ) ( not ( = ?auto_45475 ?auto_45474 ) ) ( not ( = ?auto_45468 ?auto_45474 ) ) ( not ( = ?auto_45476 ?auto_45474 ) ) ( not ( = ?auto_45477 ?auto_45474 ) ) ( not ( = ?auto_45483 ?auto_45474 ) ) ( not ( = ?auto_45470 ?auto_45474 ) ) ( not ( = ?auto_45484 ?auto_45474 ) ) ( SURFACE-AT ?auto_45480 ?auto_45473 ) ( CLEAR ?auto_45480 ) ( IS-CRATE ?auto_45484 ) ( not ( = ?auto_45466 ?auto_45480 ) ) ( not ( = ?auto_45467 ?auto_45480 ) ) ( not ( = ?auto_45472 ?auto_45480 ) ) ( not ( = ?auto_45475 ?auto_45480 ) ) ( not ( = ?auto_45468 ?auto_45480 ) ) ( not ( = ?auto_45476 ?auto_45480 ) ) ( not ( = ?auto_45477 ?auto_45480 ) ) ( not ( = ?auto_45483 ?auto_45480 ) ) ( not ( = ?auto_45470 ?auto_45480 ) ) ( not ( = ?auto_45484 ?auto_45480 ) ) ( not ( = ?auto_45474 ?auto_45480 ) ) ( AVAILABLE ?auto_45482 ) ( TRUCK-AT ?auto_45479 ?auto_45485 ) ( not ( = ?auto_45485 ?auto_45473 ) ) ( not ( = ?auto_45481 ?auto_45485 ) ) ( not ( = ?auto_45478 ?auto_45485 ) ) ( not ( = ?auto_45487 ?auto_45485 ) ) ( HOIST-AT ?auto_45488 ?auto_45485 ) ( LIFTING ?auto_45488 ?auto_45484 ) ( not ( = ?auto_45482 ?auto_45488 ) ) ( not ( = ?auto_45471 ?auto_45488 ) ) ( not ( = ?auto_45486 ?auto_45488 ) ) ( not ( = ?auto_45469 ?auto_45488 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45488 ?auto_45484 ?auto_45479 ?auto_45485 )
      ( MAKE-ON ?auto_45466 ?auto_45467 )
      ( MAKE-ON-VERIFY ?auto_45466 ?auto_45467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45489 - SURFACE
      ?auto_45490 - SURFACE
    )
    :vars
    (
      ?auto_45504 - HOIST
      ?auto_45491 - PLACE
      ?auto_45509 - PLACE
      ?auto_45506 - HOIST
      ?auto_45508 - SURFACE
      ?auto_45496 - SURFACE
      ?auto_45500 - PLACE
      ?auto_45494 - HOIST
      ?auto_45503 - SURFACE
      ?auto_45511 - SURFACE
      ?auto_45493 - SURFACE
      ?auto_45497 - SURFACE
      ?auto_45495 - PLACE
      ?auto_45507 - HOIST
      ?auto_45505 - SURFACE
      ?auto_45498 - SURFACE
      ?auto_45492 - SURFACE
      ?auto_45499 - SURFACE
      ?auto_45501 - TRUCK
      ?auto_45510 - PLACE
      ?auto_45502 - HOIST
      ?auto_45512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45504 ?auto_45491 ) ( IS-CRATE ?auto_45489 ) ( not ( = ?auto_45489 ?auto_45490 ) ) ( not ( = ?auto_45509 ?auto_45491 ) ) ( HOIST-AT ?auto_45506 ?auto_45509 ) ( not ( = ?auto_45504 ?auto_45506 ) ) ( SURFACE-AT ?auto_45489 ?auto_45509 ) ( ON ?auto_45489 ?auto_45508 ) ( CLEAR ?auto_45489 ) ( not ( = ?auto_45489 ?auto_45508 ) ) ( not ( = ?auto_45490 ?auto_45508 ) ) ( IS-CRATE ?auto_45490 ) ( not ( = ?auto_45489 ?auto_45496 ) ) ( not ( = ?auto_45490 ?auto_45496 ) ) ( not ( = ?auto_45508 ?auto_45496 ) ) ( not ( = ?auto_45500 ?auto_45491 ) ) ( not ( = ?auto_45509 ?auto_45500 ) ) ( HOIST-AT ?auto_45494 ?auto_45500 ) ( not ( = ?auto_45504 ?auto_45494 ) ) ( not ( = ?auto_45506 ?auto_45494 ) ) ( SURFACE-AT ?auto_45490 ?auto_45500 ) ( ON ?auto_45490 ?auto_45503 ) ( CLEAR ?auto_45490 ) ( not ( = ?auto_45489 ?auto_45503 ) ) ( not ( = ?auto_45490 ?auto_45503 ) ) ( not ( = ?auto_45508 ?auto_45503 ) ) ( not ( = ?auto_45496 ?auto_45503 ) ) ( IS-CRATE ?auto_45496 ) ( not ( = ?auto_45489 ?auto_45511 ) ) ( not ( = ?auto_45490 ?auto_45511 ) ) ( not ( = ?auto_45508 ?auto_45511 ) ) ( not ( = ?auto_45496 ?auto_45511 ) ) ( not ( = ?auto_45503 ?auto_45511 ) ) ( AVAILABLE ?auto_45494 ) ( SURFACE-AT ?auto_45496 ?auto_45500 ) ( ON ?auto_45496 ?auto_45493 ) ( CLEAR ?auto_45496 ) ( not ( = ?auto_45489 ?auto_45493 ) ) ( not ( = ?auto_45490 ?auto_45493 ) ) ( not ( = ?auto_45508 ?auto_45493 ) ) ( not ( = ?auto_45496 ?auto_45493 ) ) ( not ( = ?auto_45503 ?auto_45493 ) ) ( not ( = ?auto_45511 ?auto_45493 ) ) ( IS-CRATE ?auto_45511 ) ( not ( = ?auto_45489 ?auto_45497 ) ) ( not ( = ?auto_45490 ?auto_45497 ) ) ( not ( = ?auto_45508 ?auto_45497 ) ) ( not ( = ?auto_45496 ?auto_45497 ) ) ( not ( = ?auto_45503 ?auto_45497 ) ) ( not ( = ?auto_45511 ?auto_45497 ) ) ( not ( = ?auto_45493 ?auto_45497 ) ) ( not ( = ?auto_45495 ?auto_45491 ) ) ( not ( = ?auto_45509 ?auto_45495 ) ) ( not ( = ?auto_45500 ?auto_45495 ) ) ( HOIST-AT ?auto_45507 ?auto_45495 ) ( not ( = ?auto_45504 ?auto_45507 ) ) ( not ( = ?auto_45506 ?auto_45507 ) ) ( not ( = ?auto_45494 ?auto_45507 ) ) ( AVAILABLE ?auto_45507 ) ( SURFACE-AT ?auto_45511 ?auto_45495 ) ( ON ?auto_45511 ?auto_45505 ) ( CLEAR ?auto_45511 ) ( not ( = ?auto_45489 ?auto_45505 ) ) ( not ( = ?auto_45490 ?auto_45505 ) ) ( not ( = ?auto_45508 ?auto_45505 ) ) ( not ( = ?auto_45496 ?auto_45505 ) ) ( not ( = ?auto_45503 ?auto_45505 ) ) ( not ( = ?auto_45511 ?auto_45505 ) ) ( not ( = ?auto_45493 ?auto_45505 ) ) ( not ( = ?auto_45497 ?auto_45505 ) ) ( IS-CRATE ?auto_45497 ) ( not ( = ?auto_45489 ?auto_45498 ) ) ( not ( = ?auto_45490 ?auto_45498 ) ) ( not ( = ?auto_45508 ?auto_45498 ) ) ( not ( = ?auto_45496 ?auto_45498 ) ) ( not ( = ?auto_45503 ?auto_45498 ) ) ( not ( = ?auto_45511 ?auto_45498 ) ) ( not ( = ?auto_45493 ?auto_45498 ) ) ( not ( = ?auto_45497 ?auto_45498 ) ) ( not ( = ?auto_45505 ?auto_45498 ) ) ( AVAILABLE ?auto_45506 ) ( SURFACE-AT ?auto_45497 ?auto_45509 ) ( ON ?auto_45497 ?auto_45492 ) ( CLEAR ?auto_45497 ) ( not ( = ?auto_45489 ?auto_45492 ) ) ( not ( = ?auto_45490 ?auto_45492 ) ) ( not ( = ?auto_45508 ?auto_45492 ) ) ( not ( = ?auto_45496 ?auto_45492 ) ) ( not ( = ?auto_45503 ?auto_45492 ) ) ( not ( = ?auto_45511 ?auto_45492 ) ) ( not ( = ?auto_45493 ?auto_45492 ) ) ( not ( = ?auto_45497 ?auto_45492 ) ) ( not ( = ?auto_45505 ?auto_45492 ) ) ( not ( = ?auto_45498 ?auto_45492 ) ) ( SURFACE-AT ?auto_45499 ?auto_45491 ) ( CLEAR ?auto_45499 ) ( IS-CRATE ?auto_45498 ) ( not ( = ?auto_45489 ?auto_45499 ) ) ( not ( = ?auto_45490 ?auto_45499 ) ) ( not ( = ?auto_45508 ?auto_45499 ) ) ( not ( = ?auto_45496 ?auto_45499 ) ) ( not ( = ?auto_45503 ?auto_45499 ) ) ( not ( = ?auto_45511 ?auto_45499 ) ) ( not ( = ?auto_45493 ?auto_45499 ) ) ( not ( = ?auto_45497 ?auto_45499 ) ) ( not ( = ?auto_45505 ?auto_45499 ) ) ( not ( = ?auto_45498 ?auto_45499 ) ) ( not ( = ?auto_45492 ?auto_45499 ) ) ( AVAILABLE ?auto_45504 ) ( TRUCK-AT ?auto_45501 ?auto_45510 ) ( not ( = ?auto_45510 ?auto_45491 ) ) ( not ( = ?auto_45509 ?auto_45510 ) ) ( not ( = ?auto_45500 ?auto_45510 ) ) ( not ( = ?auto_45495 ?auto_45510 ) ) ( HOIST-AT ?auto_45502 ?auto_45510 ) ( not ( = ?auto_45504 ?auto_45502 ) ) ( not ( = ?auto_45506 ?auto_45502 ) ) ( not ( = ?auto_45494 ?auto_45502 ) ) ( not ( = ?auto_45507 ?auto_45502 ) ) ( AVAILABLE ?auto_45502 ) ( SURFACE-AT ?auto_45498 ?auto_45510 ) ( ON ?auto_45498 ?auto_45512 ) ( CLEAR ?auto_45498 ) ( not ( = ?auto_45489 ?auto_45512 ) ) ( not ( = ?auto_45490 ?auto_45512 ) ) ( not ( = ?auto_45508 ?auto_45512 ) ) ( not ( = ?auto_45496 ?auto_45512 ) ) ( not ( = ?auto_45503 ?auto_45512 ) ) ( not ( = ?auto_45511 ?auto_45512 ) ) ( not ( = ?auto_45493 ?auto_45512 ) ) ( not ( = ?auto_45497 ?auto_45512 ) ) ( not ( = ?auto_45505 ?auto_45512 ) ) ( not ( = ?auto_45498 ?auto_45512 ) ) ( not ( = ?auto_45492 ?auto_45512 ) ) ( not ( = ?auto_45499 ?auto_45512 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45502 ?auto_45498 ?auto_45512 ?auto_45510 )
      ( MAKE-ON ?auto_45489 ?auto_45490 )
      ( MAKE-ON-VERIFY ?auto_45489 ?auto_45490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45513 - SURFACE
      ?auto_45514 - SURFACE
    )
    :vars
    (
      ?auto_45526 - HOIST
      ?auto_45515 - PLACE
      ?auto_45522 - PLACE
      ?auto_45536 - HOIST
      ?auto_45532 - SURFACE
      ?auto_45533 - SURFACE
      ?auto_45516 - PLACE
      ?auto_45520 - HOIST
      ?auto_45535 - SURFACE
      ?auto_45530 - SURFACE
      ?auto_45518 - SURFACE
      ?auto_45525 - SURFACE
      ?auto_45519 - PLACE
      ?auto_45521 - HOIST
      ?auto_45524 - SURFACE
      ?auto_45527 - SURFACE
      ?auto_45529 - SURFACE
      ?auto_45528 - SURFACE
      ?auto_45531 - PLACE
      ?auto_45534 - HOIST
      ?auto_45523 - SURFACE
      ?auto_45517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45526 ?auto_45515 ) ( IS-CRATE ?auto_45513 ) ( not ( = ?auto_45513 ?auto_45514 ) ) ( not ( = ?auto_45522 ?auto_45515 ) ) ( HOIST-AT ?auto_45536 ?auto_45522 ) ( not ( = ?auto_45526 ?auto_45536 ) ) ( SURFACE-AT ?auto_45513 ?auto_45522 ) ( ON ?auto_45513 ?auto_45532 ) ( CLEAR ?auto_45513 ) ( not ( = ?auto_45513 ?auto_45532 ) ) ( not ( = ?auto_45514 ?auto_45532 ) ) ( IS-CRATE ?auto_45514 ) ( not ( = ?auto_45513 ?auto_45533 ) ) ( not ( = ?auto_45514 ?auto_45533 ) ) ( not ( = ?auto_45532 ?auto_45533 ) ) ( not ( = ?auto_45516 ?auto_45515 ) ) ( not ( = ?auto_45522 ?auto_45516 ) ) ( HOIST-AT ?auto_45520 ?auto_45516 ) ( not ( = ?auto_45526 ?auto_45520 ) ) ( not ( = ?auto_45536 ?auto_45520 ) ) ( SURFACE-AT ?auto_45514 ?auto_45516 ) ( ON ?auto_45514 ?auto_45535 ) ( CLEAR ?auto_45514 ) ( not ( = ?auto_45513 ?auto_45535 ) ) ( not ( = ?auto_45514 ?auto_45535 ) ) ( not ( = ?auto_45532 ?auto_45535 ) ) ( not ( = ?auto_45533 ?auto_45535 ) ) ( IS-CRATE ?auto_45533 ) ( not ( = ?auto_45513 ?auto_45530 ) ) ( not ( = ?auto_45514 ?auto_45530 ) ) ( not ( = ?auto_45532 ?auto_45530 ) ) ( not ( = ?auto_45533 ?auto_45530 ) ) ( not ( = ?auto_45535 ?auto_45530 ) ) ( AVAILABLE ?auto_45520 ) ( SURFACE-AT ?auto_45533 ?auto_45516 ) ( ON ?auto_45533 ?auto_45518 ) ( CLEAR ?auto_45533 ) ( not ( = ?auto_45513 ?auto_45518 ) ) ( not ( = ?auto_45514 ?auto_45518 ) ) ( not ( = ?auto_45532 ?auto_45518 ) ) ( not ( = ?auto_45533 ?auto_45518 ) ) ( not ( = ?auto_45535 ?auto_45518 ) ) ( not ( = ?auto_45530 ?auto_45518 ) ) ( IS-CRATE ?auto_45530 ) ( not ( = ?auto_45513 ?auto_45525 ) ) ( not ( = ?auto_45514 ?auto_45525 ) ) ( not ( = ?auto_45532 ?auto_45525 ) ) ( not ( = ?auto_45533 ?auto_45525 ) ) ( not ( = ?auto_45535 ?auto_45525 ) ) ( not ( = ?auto_45530 ?auto_45525 ) ) ( not ( = ?auto_45518 ?auto_45525 ) ) ( not ( = ?auto_45519 ?auto_45515 ) ) ( not ( = ?auto_45522 ?auto_45519 ) ) ( not ( = ?auto_45516 ?auto_45519 ) ) ( HOIST-AT ?auto_45521 ?auto_45519 ) ( not ( = ?auto_45526 ?auto_45521 ) ) ( not ( = ?auto_45536 ?auto_45521 ) ) ( not ( = ?auto_45520 ?auto_45521 ) ) ( AVAILABLE ?auto_45521 ) ( SURFACE-AT ?auto_45530 ?auto_45519 ) ( ON ?auto_45530 ?auto_45524 ) ( CLEAR ?auto_45530 ) ( not ( = ?auto_45513 ?auto_45524 ) ) ( not ( = ?auto_45514 ?auto_45524 ) ) ( not ( = ?auto_45532 ?auto_45524 ) ) ( not ( = ?auto_45533 ?auto_45524 ) ) ( not ( = ?auto_45535 ?auto_45524 ) ) ( not ( = ?auto_45530 ?auto_45524 ) ) ( not ( = ?auto_45518 ?auto_45524 ) ) ( not ( = ?auto_45525 ?auto_45524 ) ) ( IS-CRATE ?auto_45525 ) ( not ( = ?auto_45513 ?auto_45527 ) ) ( not ( = ?auto_45514 ?auto_45527 ) ) ( not ( = ?auto_45532 ?auto_45527 ) ) ( not ( = ?auto_45533 ?auto_45527 ) ) ( not ( = ?auto_45535 ?auto_45527 ) ) ( not ( = ?auto_45530 ?auto_45527 ) ) ( not ( = ?auto_45518 ?auto_45527 ) ) ( not ( = ?auto_45525 ?auto_45527 ) ) ( not ( = ?auto_45524 ?auto_45527 ) ) ( AVAILABLE ?auto_45536 ) ( SURFACE-AT ?auto_45525 ?auto_45522 ) ( ON ?auto_45525 ?auto_45529 ) ( CLEAR ?auto_45525 ) ( not ( = ?auto_45513 ?auto_45529 ) ) ( not ( = ?auto_45514 ?auto_45529 ) ) ( not ( = ?auto_45532 ?auto_45529 ) ) ( not ( = ?auto_45533 ?auto_45529 ) ) ( not ( = ?auto_45535 ?auto_45529 ) ) ( not ( = ?auto_45530 ?auto_45529 ) ) ( not ( = ?auto_45518 ?auto_45529 ) ) ( not ( = ?auto_45525 ?auto_45529 ) ) ( not ( = ?auto_45524 ?auto_45529 ) ) ( not ( = ?auto_45527 ?auto_45529 ) ) ( SURFACE-AT ?auto_45528 ?auto_45515 ) ( CLEAR ?auto_45528 ) ( IS-CRATE ?auto_45527 ) ( not ( = ?auto_45513 ?auto_45528 ) ) ( not ( = ?auto_45514 ?auto_45528 ) ) ( not ( = ?auto_45532 ?auto_45528 ) ) ( not ( = ?auto_45533 ?auto_45528 ) ) ( not ( = ?auto_45535 ?auto_45528 ) ) ( not ( = ?auto_45530 ?auto_45528 ) ) ( not ( = ?auto_45518 ?auto_45528 ) ) ( not ( = ?auto_45525 ?auto_45528 ) ) ( not ( = ?auto_45524 ?auto_45528 ) ) ( not ( = ?auto_45527 ?auto_45528 ) ) ( not ( = ?auto_45529 ?auto_45528 ) ) ( AVAILABLE ?auto_45526 ) ( not ( = ?auto_45531 ?auto_45515 ) ) ( not ( = ?auto_45522 ?auto_45531 ) ) ( not ( = ?auto_45516 ?auto_45531 ) ) ( not ( = ?auto_45519 ?auto_45531 ) ) ( HOIST-AT ?auto_45534 ?auto_45531 ) ( not ( = ?auto_45526 ?auto_45534 ) ) ( not ( = ?auto_45536 ?auto_45534 ) ) ( not ( = ?auto_45520 ?auto_45534 ) ) ( not ( = ?auto_45521 ?auto_45534 ) ) ( AVAILABLE ?auto_45534 ) ( SURFACE-AT ?auto_45527 ?auto_45531 ) ( ON ?auto_45527 ?auto_45523 ) ( CLEAR ?auto_45527 ) ( not ( = ?auto_45513 ?auto_45523 ) ) ( not ( = ?auto_45514 ?auto_45523 ) ) ( not ( = ?auto_45532 ?auto_45523 ) ) ( not ( = ?auto_45533 ?auto_45523 ) ) ( not ( = ?auto_45535 ?auto_45523 ) ) ( not ( = ?auto_45530 ?auto_45523 ) ) ( not ( = ?auto_45518 ?auto_45523 ) ) ( not ( = ?auto_45525 ?auto_45523 ) ) ( not ( = ?auto_45524 ?auto_45523 ) ) ( not ( = ?auto_45527 ?auto_45523 ) ) ( not ( = ?auto_45529 ?auto_45523 ) ) ( not ( = ?auto_45528 ?auto_45523 ) ) ( TRUCK-AT ?auto_45517 ?auto_45515 ) )
    :subtasks
    ( ( !DRIVE ?auto_45517 ?auto_45515 ?auto_45531 )
      ( MAKE-ON ?auto_45513 ?auto_45514 )
      ( MAKE-ON-VERIFY ?auto_45513 ?auto_45514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45537 - SURFACE
      ?auto_45538 - SURFACE
    )
    :vars
    (
      ?auto_45547 - HOIST
      ?auto_45539 - PLACE
      ?auto_45541 - PLACE
      ?auto_45558 - HOIST
      ?auto_45554 - SURFACE
      ?auto_45555 - SURFACE
      ?auto_45551 - PLACE
      ?auto_45548 - HOIST
      ?auto_45557 - SURFACE
      ?auto_45559 - SURFACE
      ?auto_45549 - SURFACE
      ?auto_45550 - SURFACE
      ?auto_45542 - PLACE
      ?auto_45543 - HOIST
      ?auto_45540 - SURFACE
      ?auto_45544 - SURFACE
      ?auto_45560 - SURFACE
      ?auto_45546 - SURFACE
      ?auto_45553 - PLACE
      ?auto_45556 - HOIST
      ?auto_45545 - SURFACE
      ?auto_45552 - TRUCK
      ?auto_45561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45547 ?auto_45539 ) ( IS-CRATE ?auto_45537 ) ( not ( = ?auto_45537 ?auto_45538 ) ) ( not ( = ?auto_45541 ?auto_45539 ) ) ( HOIST-AT ?auto_45558 ?auto_45541 ) ( not ( = ?auto_45547 ?auto_45558 ) ) ( SURFACE-AT ?auto_45537 ?auto_45541 ) ( ON ?auto_45537 ?auto_45554 ) ( CLEAR ?auto_45537 ) ( not ( = ?auto_45537 ?auto_45554 ) ) ( not ( = ?auto_45538 ?auto_45554 ) ) ( IS-CRATE ?auto_45538 ) ( not ( = ?auto_45537 ?auto_45555 ) ) ( not ( = ?auto_45538 ?auto_45555 ) ) ( not ( = ?auto_45554 ?auto_45555 ) ) ( not ( = ?auto_45551 ?auto_45539 ) ) ( not ( = ?auto_45541 ?auto_45551 ) ) ( HOIST-AT ?auto_45548 ?auto_45551 ) ( not ( = ?auto_45547 ?auto_45548 ) ) ( not ( = ?auto_45558 ?auto_45548 ) ) ( SURFACE-AT ?auto_45538 ?auto_45551 ) ( ON ?auto_45538 ?auto_45557 ) ( CLEAR ?auto_45538 ) ( not ( = ?auto_45537 ?auto_45557 ) ) ( not ( = ?auto_45538 ?auto_45557 ) ) ( not ( = ?auto_45554 ?auto_45557 ) ) ( not ( = ?auto_45555 ?auto_45557 ) ) ( IS-CRATE ?auto_45555 ) ( not ( = ?auto_45537 ?auto_45559 ) ) ( not ( = ?auto_45538 ?auto_45559 ) ) ( not ( = ?auto_45554 ?auto_45559 ) ) ( not ( = ?auto_45555 ?auto_45559 ) ) ( not ( = ?auto_45557 ?auto_45559 ) ) ( AVAILABLE ?auto_45548 ) ( SURFACE-AT ?auto_45555 ?auto_45551 ) ( ON ?auto_45555 ?auto_45549 ) ( CLEAR ?auto_45555 ) ( not ( = ?auto_45537 ?auto_45549 ) ) ( not ( = ?auto_45538 ?auto_45549 ) ) ( not ( = ?auto_45554 ?auto_45549 ) ) ( not ( = ?auto_45555 ?auto_45549 ) ) ( not ( = ?auto_45557 ?auto_45549 ) ) ( not ( = ?auto_45559 ?auto_45549 ) ) ( IS-CRATE ?auto_45559 ) ( not ( = ?auto_45537 ?auto_45550 ) ) ( not ( = ?auto_45538 ?auto_45550 ) ) ( not ( = ?auto_45554 ?auto_45550 ) ) ( not ( = ?auto_45555 ?auto_45550 ) ) ( not ( = ?auto_45557 ?auto_45550 ) ) ( not ( = ?auto_45559 ?auto_45550 ) ) ( not ( = ?auto_45549 ?auto_45550 ) ) ( not ( = ?auto_45542 ?auto_45539 ) ) ( not ( = ?auto_45541 ?auto_45542 ) ) ( not ( = ?auto_45551 ?auto_45542 ) ) ( HOIST-AT ?auto_45543 ?auto_45542 ) ( not ( = ?auto_45547 ?auto_45543 ) ) ( not ( = ?auto_45558 ?auto_45543 ) ) ( not ( = ?auto_45548 ?auto_45543 ) ) ( AVAILABLE ?auto_45543 ) ( SURFACE-AT ?auto_45559 ?auto_45542 ) ( ON ?auto_45559 ?auto_45540 ) ( CLEAR ?auto_45559 ) ( not ( = ?auto_45537 ?auto_45540 ) ) ( not ( = ?auto_45538 ?auto_45540 ) ) ( not ( = ?auto_45554 ?auto_45540 ) ) ( not ( = ?auto_45555 ?auto_45540 ) ) ( not ( = ?auto_45557 ?auto_45540 ) ) ( not ( = ?auto_45559 ?auto_45540 ) ) ( not ( = ?auto_45549 ?auto_45540 ) ) ( not ( = ?auto_45550 ?auto_45540 ) ) ( IS-CRATE ?auto_45550 ) ( not ( = ?auto_45537 ?auto_45544 ) ) ( not ( = ?auto_45538 ?auto_45544 ) ) ( not ( = ?auto_45554 ?auto_45544 ) ) ( not ( = ?auto_45555 ?auto_45544 ) ) ( not ( = ?auto_45557 ?auto_45544 ) ) ( not ( = ?auto_45559 ?auto_45544 ) ) ( not ( = ?auto_45549 ?auto_45544 ) ) ( not ( = ?auto_45550 ?auto_45544 ) ) ( not ( = ?auto_45540 ?auto_45544 ) ) ( AVAILABLE ?auto_45558 ) ( SURFACE-AT ?auto_45550 ?auto_45541 ) ( ON ?auto_45550 ?auto_45560 ) ( CLEAR ?auto_45550 ) ( not ( = ?auto_45537 ?auto_45560 ) ) ( not ( = ?auto_45538 ?auto_45560 ) ) ( not ( = ?auto_45554 ?auto_45560 ) ) ( not ( = ?auto_45555 ?auto_45560 ) ) ( not ( = ?auto_45557 ?auto_45560 ) ) ( not ( = ?auto_45559 ?auto_45560 ) ) ( not ( = ?auto_45549 ?auto_45560 ) ) ( not ( = ?auto_45550 ?auto_45560 ) ) ( not ( = ?auto_45540 ?auto_45560 ) ) ( not ( = ?auto_45544 ?auto_45560 ) ) ( IS-CRATE ?auto_45544 ) ( not ( = ?auto_45537 ?auto_45546 ) ) ( not ( = ?auto_45538 ?auto_45546 ) ) ( not ( = ?auto_45554 ?auto_45546 ) ) ( not ( = ?auto_45555 ?auto_45546 ) ) ( not ( = ?auto_45557 ?auto_45546 ) ) ( not ( = ?auto_45559 ?auto_45546 ) ) ( not ( = ?auto_45549 ?auto_45546 ) ) ( not ( = ?auto_45550 ?auto_45546 ) ) ( not ( = ?auto_45540 ?auto_45546 ) ) ( not ( = ?auto_45544 ?auto_45546 ) ) ( not ( = ?auto_45560 ?auto_45546 ) ) ( not ( = ?auto_45553 ?auto_45539 ) ) ( not ( = ?auto_45541 ?auto_45553 ) ) ( not ( = ?auto_45551 ?auto_45553 ) ) ( not ( = ?auto_45542 ?auto_45553 ) ) ( HOIST-AT ?auto_45556 ?auto_45553 ) ( not ( = ?auto_45547 ?auto_45556 ) ) ( not ( = ?auto_45558 ?auto_45556 ) ) ( not ( = ?auto_45548 ?auto_45556 ) ) ( not ( = ?auto_45543 ?auto_45556 ) ) ( AVAILABLE ?auto_45556 ) ( SURFACE-AT ?auto_45544 ?auto_45553 ) ( ON ?auto_45544 ?auto_45545 ) ( CLEAR ?auto_45544 ) ( not ( = ?auto_45537 ?auto_45545 ) ) ( not ( = ?auto_45538 ?auto_45545 ) ) ( not ( = ?auto_45554 ?auto_45545 ) ) ( not ( = ?auto_45555 ?auto_45545 ) ) ( not ( = ?auto_45557 ?auto_45545 ) ) ( not ( = ?auto_45559 ?auto_45545 ) ) ( not ( = ?auto_45549 ?auto_45545 ) ) ( not ( = ?auto_45550 ?auto_45545 ) ) ( not ( = ?auto_45540 ?auto_45545 ) ) ( not ( = ?auto_45544 ?auto_45545 ) ) ( not ( = ?auto_45560 ?auto_45545 ) ) ( not ( = ?auto_45546 ?auto_45545 ) ) ( TRUCK-AT ?auto_45552 ?auto_45539 ) ( SURFACE-AT ?auto_45561 ?auto_45539 ) ( CLEAR ?auto_45561 ) ( LIFTING ?auto_45547 ?auto_45546 ) ( IS-CRATE ?auto_45546 ) ( not ( = ?auto_45537 ?auto_45561 ) ) ( not ( = ?auto_45538 ?auto_45561 ) ) ( not ( = ?auto_45554 ?auto_45561 ) ) ( not ( = ?auto_45555 ?auto_45561 ) ) ( not ( = ?auto_45557 ?auto_45561 ) ) ( not ( = ?auto_45559 ?auto_45561 ) ) ( not ( = ?auto_45549 ?auto_45561 ) ) ( not ( = ?auto_45550 ?auto_45561 ) ) ( not ( = ?auto_45540 ?auto_45561 ) ) ( not ( = ?auto_45544 ?auto_45561 ) ) ( not ( = ?auto_45560 ?auto_45561 ) ) ( not ( = ?auto_45546 ?auto_45561 ) ) ( not ( = ?auto_45545 ?auto_45561 ) ) )
    :subtasks
    ( ( !DROP ?auto_45547 ?auto_45546 ?auto_45561 ?auto_45539 )
      ( MAKE-ON ?auto_45537 ?auto_45538 )
      ( MAKE-ON-VERIFY ?auto_45537 ?auto_45538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45562 - SURFACE
      ?auto_45563 - SURFACE
    )
    :vars
    (
      ?auto_45572 - HOIST
      ?auto_45573 - PLACE
      ?auto_45583 - PLACE
      ?auto_45576 - HOIST
      ?auto_45570 - SURFACE
      ?auto_45564 - SURFACE
      ?auto_45578 - PLACE
      ?auto_45582 - HOIST
      ?auto_45575 - SURFACE
      ?auto_45577 - SURFACE
      ?auto_45585 - SURFACE
      ?auto_45579 - SURFACE
      ?auto_45586 - PLACE
      ?auto_45565 - HOIST
      ?auto_45566 - SURFACE
      ?auto_45584 - SURFACE
      ?auto_45569 - SURFACE
      ?auto_45581 - SURFACE
      ?auto_45567 - PLACE
      ?auto_45568 - HOIST
      ?auto_45571 - SURFACE
      ?auto_45580 - TRUCK
      ?auto_45574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45572 ?auto_45573 ) ( IS-CRATE ?auto_45562 ) ( not ( = ?auto_45562 ?auto_45563 ) ) ( not ( = ?auto_45583 ?auto_45573 ) ) ( HOIST-AT ?auto_45576 ?auto_45583 ) ( not ( = ?auto_45572 ?auto_45576 ) ) ( SURFACE-AT ?auto_45562 ?auto_45583 ) ( ON ?auto_45562 ?auto_45570 ) ( CLEAR ?auto_45562 ) ( not ( = ?auto_45562 ?auto_45570 ) ) ( not ( = ?auto_45563 ?auto_45570 ) ) ( IS-CRATE ?auto_45563 ) ( not ( = ?auto_45562 ?auto_45564 ) ) ( not ( = ?auto_45563 ?auto_45564 ) ) ( not ( = ?auto_45570 ?auto_45564 ) ) ( not ( = ?auto_45578 ?auto_45573 ) ) ( not ( = ?auto_45583 ?auto_45578 ) ) ( HOIST-AT ?auto_45582 ?auto_45578 ) ( not ( = ?auto_45572 ?auto_45582 ) ) ( not ( = ?auto_45576 ?auto_45582 ) ) ( SURFACE-AT ?auto_45563 ?auto_45578 ) ( ON ?auto_45563 ?auto_45575 ) ( CLEAR ?auto_45563 ) ( not ( = ?auto_45562 ?auto_45575 ) ) ( not ( = ?auto_45563 ?auto_45575 ) ) ( not ( = ?auto_45570 ?auto_45575 ) ) ( not ( = ?auto_45564 ?auto_45575 ) ) ( IS-CRATE ?auto_45564 ) ( not ( = ?auto_45562 ?auto_45577 ) ) ( not ( = ?auto_45563 ?auto_45577 ) ) ( not ( = ?auto_45570 ?auto_45577 ) ) ( not ( = ?auto_45564 ?auto_45577 ) ) ( not ( = ?auto_45575 ?auto_45577 ) ) ( AVAILABLE ?auto_45582 ) ( SURFACE-AT ?auto_45564 ?auto_45578 ) ( ON ?auto_45564 ?auto_45585 ) ( CLEAR ?auto_45564 ) ( not ( = ?auto_45562 ?auto_45585 ) ) ( not ( = ?auto_45563 ?auto_45585 ) ) ( not ( = ?auto_45570 ?auto_45585 ) ) ( not ( = ?auto_45564 ?auto_45585 ) ) ( not ( = ?auto_45575 ?auto_45585 ) ) ( not ( = ?auto_45577 ?auto_45585 ) ) ( IS-CRATE ?auto_45577 ) ( not ( = ?auto_45562 ?auto_45579 ) ) ( not ( = ?auto_45563 ?auto_45579 ) ) ( not ( = ?auto_45570 ?auto_45579 ) ) ( not ( = ?auto_45564 ?auto_45579 ) ) ( not ( = ?auto_45575 ?auto_45579 ) ) ( not ( = ?auto_45577 ?auto_45579 ) ) ( not ( = ?auto_45585 ?auto_45579 ) ) ( not ( = ?auto_45586 ?auto_45573 ) ) ( not ( = ?auto_45583 ?auto_45586 ) ) ( not ( = ?auto_45578 ?auto_45586 ) ) ( HOIST-AT ?auto_45565 ?auto_45586 ) ( not ( = ?auto_45572 ?auto_45565 ) ) ( not ( = ?auto_45576 ?auto_45565 ) ) ( not ( = ?auto_45582 ?auto_45565 ) ) ( AVAILABLE ?auto_45565 ) ( SURFACE-AT ?auto_45577 ?auto_45586 ) ( ON ?auto_45577 ?auto_45566 ) ( CLEAR ?auto_45577 ) ( not ( = ?auto_45562 ?auto_45566 ) ) ( not ( = ?auto_45563 ?auto_45566 ) ) ( not ( = ?auto_45570 ?auto_45566 ) ) ( not ( = ?auto_45564 ?auto_45566 ) ) ( not ( = ?auto_45575 ?auto_45566 ) ) ( not ( = ?auto_45577 ?auto_45566 ) ) ( not ( = ?auto_45585 ?auto_45566 ) ) ( not ( = ?auto_45579 ?auto_45566 ) ) ( IS-CRATE ?auto_45579 ) ( not ( = ?auto_45562 ?auto_45584 ) ) ( not ( = ?auto_45563 ?auto_45584 ) ) ( not ( = ?auto_45570 ?auto_45584 ) ) ( not ( = ?auto_45564 ?auto_45584 ) ) ( not ( = ?auto_45575 ?auto_45584 ) ) ( not ( = ?auto_45577 ?auto_45584 ) ) ( not ( = ?auto_45585 ?auto_45584 ) ) ( not ( = ?auto_45579 ?auto_45584 ) ) ( not ( = ?auto_45566 ?auto_45584 ) ) ( AVAILABLE ?auto_45576 ) ( SURFACE-AT ?auto_45579 ?auto_45583 ) ( ON ?auto_45579 ?auto_45569 ) ( CLEAR ?auto_45579 ) ( not ( = ?auto_45562 ?auto_45569 ) ) ( not ( = ?auto_45563 ?auto_45569 ) ) ( not ( = ?auto_45570 ?auto_45569 ) ) ( not ( = ?auto_45564 ?auto_45569 ) ) ( not ( = ?auto_45575 ?auto_45569 ) ) ( not ( = ?auto_45577 ?auto_45569 ) ) ( not ( = ?auto_45585 ?auto_45569 ) ) ( not ( = ?auto_45579 ?auto_45569 ) ) ( not ( = ?auto_45566 ?auto_45569 ) ) ( not ( = ?auto_45584 ?auto_45569 ) ) ( IS-CRATE ?auto_45584 ) ( not ( = ?auto_45562 ?auto_45581 ) ) ( not ( = ?auto_45563 ?auto_45581 ) ) ( not ( = ?auto_45570 ?auto_45581 ) ) ( not ( = ?auto_45564 ?auto_45581 ) ) ( not ( = ?auto_45575 ?auto_45581 ) ) ( not ( = ?auto_45577 ?auto_45581 ) ) ( not ( = ?auto_45585 ?auto_45581 ) ) ( not ( = ?auto_45579 ?auto_45581 ) ) ( not ( = ?auto_45566 ?auto_45581 ) ) ( not ( = ?auto_45584 ?auto_45581 ) ) ( not ( = ?auto_45569 ?auto_45581 ) ) ( not ( = ?auto_45567 ?auto_45573 ) ) ( not ( = ?auto_45583 ?auto_45567 ) ) ( not ( = ?auto_45578 ?auto_45567 ) ) ( not ( = ?auto_45586 ?auto_45567 ) ) ( HOIST-AT ?auto_45568 ?auto_45567 ) ( not ( = ?auto_45572 ?auto_45568 ) ) ( not ( = ?auto_45576 ?auto_45568 ) ) ( not ( = ?auto_45582 ?auto_45568 ) ) ( not ( = ?auto_45565 ?auto_45568 ) ) ( AVAILABLE ?auto_45568 ) ( SURFACE-AT ?auto_45584 ?auto_45567 ) ( ON ?auto_45584 ?auto_45571 ) ( CLEAR ?auto_45584 ) ( not ( = ?auto_45562 ?auto_45571 ) ) ( not ( = ?auto_45563 ?auto_45571 ) ) ( not ( = ?auto_45570 ?auto_45571 ) ) ( not ( = ?auto_45564 ?auto_45571 ) ) ( not ( = ?auto_45575 ?auto_45571 ) ) ( not ( = ?auto_45577 ?auto_45571 ) ) ( not ( = ?auto_45585 ?auto_45571 ) ) ( not ( = ?auto_45579 ?auto_45571 ) ) ( not ( = ?auto_45566 ?auto_45571 ) ) ( not ( = ?auto_45584 ?auto_45571 ) ) ( not ( = ?auto_45569 ?auto_45571 ) ) ( not ( = ?auto_45581 ?auto_45571 ) ) ( TRUCK-AT ?auto_45580 ?auto_45573 ) ( SURFACE-AT ?auto_45574 ?auto_45573 ) ( CLEAR ?auto_45574 ) ( IS-CRATE ?auto_45581 ) ( not ( = ?auto_45562 ?auto_45574 ) ) ( not ( = ?auto_45563 ?auto_45574 ) ) ( not ( = ?auto_45570 ?auto_45574 ) ) ( not ( = ?auto_45564 ?auto_45574 ) ) ( not ( = ?auto_45575 ?auto_45574 ) ) ( not ( = ?auto_45577 ?auto_45574 ) ) ( not ( = ?auto_45585 ?auto_45574 ) ) ( not ( = ?auto_45579 ?auto_45574 ) ) ( not ( = ?auto_45566 ?auto_45574 ) ) ( not ( = ?auto_45584 ?auto_45574 ) ) ( not ( = ?auto_45569 ?auto_45574 ) ) ( not ( = ?auto_45581 ?auto_45574 ) ) ( not ( = ?auto_45571 ?auto_45574 ) ) ( AVAILABLE ?auto_45572 ) ( IN ?auto_45581 ?auto_45580 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45572 ?auto_45581 ?auto_45580 ?auto_45573 )
      ( MAKE-ON ?auto_45562 ?auto_45563 )
      ( MAKE-ON-VERIFY ?auto_45562 ?auto_45563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45587 - SURFACE
      ?auto_45588 - SURFACE
    )
    :vars
    (
      ?auto_45607 - HOIST
      ?auto_45590 - PLACE
      ?auto_45601 - PLACE
      ?auto_45596 - HOIST
      ?auto_45594 - SURFACE
      ?auto_45610 - SURFACE
      ?auto_45611 - PLACE
      ?auto_45600 - HOIST
      ?auto_45593 - SURFACE
      ?auto_45591 - SURFACE
      ?auto_45603 - SURFACE
      ?auto_45605 - SURFACE
      ?auto_45604 - PLACE
      ?auto_45592 - HOIST
      ?auto_45595 - SURFACE
      ?auto_45602 - SURFACE
      ?auto_45597 - SURFACE
      ?auto_45599 - SURFACE
      ?auto_45608 - PLACE
      ?auto_45606 - HOIST
      ?auto_45598 - SURFACE
      ?auto_45589 - SURFACE
      ?auto_45609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45607 ?auto_45590 ) ( IS-CRATE ?auto_45587 ) ( not ( = ?auto_45587 ?auto_45588 ) ) ( not ( = ?auto_45601 ?auto_45590 ) ) ( HOIST-AT ?auto_45596 ?auto_45601 ) ( not ( = ?auto_45607 ?auto_45596 ) ) ( SURFACE-AT ?auto_45587 ?auto_45601 ) ( ON ?auto_45587 ?auto_45594 ) ( CLEAR ?auto_45587 ) ( not ( = ?auto_45587 ?auto_45594 ) ) ( not ( = ?auto_45588 ?auto_45594 ) ) ( IS-CRATE ?auto_45588 ) ( not ( = ?auto_45587 ?auto_45610 ) ) ( not ( = ?auto_45588 ?auto_45610 ) ) ( not ( = ?auto_45594 ?auto_45610 ) ) ( not ( = ?auto_45611 ?auto_45590 ) ) ( not ( = ?auto_45601 ?auto_45611 ) ) ( HOIST-AT ?auto_45600 ?auto_45611 ) ( not ( = ?auto_45607 ?auto_45600 ) ) ( not ( = ?auto_45596 ?auto_45600 ) ) ( SURFACE-AT ?auto_45588 ?auto_45611 ) ( ON ?auto_45588 ?auto_45593 ) ( CLEAR ?auto_45588 ) ( not ( = ?auto_45587 ?auto_45593 ) ) ( not ( = ?auto_45588 ?auto_45593 ) ) ( not ( = ?auto_45594 ?auto_45593 ) ) ( not ( = ?auto_45610 ?auto_45593 ) ) ( IS-CRATE ?auto_45610 ) ( not ( = ?auto_45587 ?auto_45591 ) ) ( not ( = ?auto_45588 ?auto_45591 ) ) ( not ( = ?auto_45594 ?auto_45591 ) ) ( not ( = ?auto_45610 ?auto_45591 ) ) ( not ( = ?auto_45593 ?auto_45591 ) ) ( AVAILABLE ?auto_45600 ) ( SURFACE-AT ?auto_45610 ?auto_45611 ) ( ON ?auto_45610 ?auto_45603 ) ( CLEAR ?auto_45610 ) ( not ( = ?auto_45587 ?auto_45603 ) ) ( not ( = ?auto_45588 ?auto_45603 ) ) ( not ( = ?auto_45594 ?auto_45603 ) ) ( not ( = ?auto_45610 ?auto_45603 ) ) ( not ( = ?auto_45593 ?auto_45603 ) ) ( not ( = ?auto_45591 ?auto_45603 ) ) ( IS-CRATE ?auto_45591 ) ( not ( = ?auto_45587 ?auto_45605 ) ) ( not ( = ?auto_45588 ?auto_45605 ) ) ( not ( = ?auto_45594 ?auto_45605 ) ) ( not ( = ?auto_45610 ?auto_45605 ) ) ( not ( = ?auto_45593 ?auto_45605 ) ) ( not ( = ?auto_45591 ?auto_45605 ) ) ( not ( = ?auto_45603 ?auto_45605 ) ) ( not ( = ?auto_45604 ?auto_45590 ) ) ( not ( = ?auto_45601 ?auto_45604 ) ) ( not ( = ?auto_45611 ?auto_45604 ) ) ( HOIST-AT ?auto_45592 ?auto_45604 ) ( not ( = ?auto_45607 ?auto_45592 ) ) ( not ( = ?auto_45596 ?auto_45592 ) ) ( not ( = ?auto_45600 ?auto_45592 ) ) ( AVAILABLE ?auto_45592 ) ( SURFACE-AT ?auto_45591 ?auto_45604 ) ( ON ?auto_45591 ?auto_45595 ) ( CLEAR ?auto_45591 ) ( not ( = ?auto_45587 ?auto_45595 ) ) ( not ( = ?auto_45588 ?auto_45595 ) ) ( not ( = ?auto_45594 ?auto_45595 ) ) ( not ( = ?auto_45610 ?auto_45595 ) ) ( not ( = ?auto_45593 ?auto_45595 ) ) ( not ( = ?auto_45591 ?auto_45595 ) ) ( not ( = ?auto_45603 ?auto_45595 ) ) ( not ( = ?auto_45605 ?auto_45595 ) ) ( IS-CRATE ?auto_45605 ) ( not ( = ?auto_45587 ?auto_45602 ) ) ( not ( = ?auto_45588 ?auto_45602 ) ) ( not ( = ?auto_45594 ?auto_45602 ) ) ( not ( = ?auto_45610 ?auto_45602 ) ) ( not ( = ?auto_45593 ?auto_45602 ) ) ( not ( = ?auto_45591 ?auto_45602 ) ) ( not ( = ?auto_45603 ?auto_45602 ) ) ( not ( = ?auto_45605 ?auto_45602 ) ) ( not ( = ?auto_45595 ?auto_45602 ) ) ( AVAILABLE ?auto_45596 ) ( SURFACE-AT ?auto_45605 ?auto_45601 ) ( ON ?auto_45605 ?auto_45597 ) ( CLEAR ?auto_45605 ) ( not ( = ?auto_45587 ?auto_45597 ) ) ( not ( = ?auto_45588 ?auto_45597 ) ) ( not ( = ?auto_45594 ?auto_45597 ) ) ( not ( = ?auto_45610 ?auto_45597 ) ) ( not ( = ?auto_45593 ?auto_45597 ) ) ( not ( = ?auto_45591 ?auto_45597 ) ) ( not ( = ?auto_45603 ?auto_45597 ) ) ( not ( = ?auto_45605 ?auto_45597 ) ) ( not ( = ?auto_45595 ?auto_45597 ) ) ( not ( = ?auto_45602 ?auto_45597 ) ) ( IS-CRATE ?auto_45602 ) ( not ( = ?auto_45587 ?auto_45599 ) ) ( not ( = ?auto_45588 ?auto_45599 ) ) ( not ( = ?auto_45594 ?auto_45599 ) ) ( not ( = ?auto_45610 ?auto_45599 ) ) ( not ( = ?auto_45593 ?auto_45599 ) ) ( not ( = ?auto_45591 ?auto_45599 ) ) ( not ( = ?auto_45603 ?auto_45599 ) ) ( not ( = ?auto_45605 ?auto_45599 ) ) ( not ( = ?auto_45595 ?auto_45599 ) ) ( not ( = ?auto_45602 ?auto_45599 ) ) ( not ( = ?auto_45597 ?auto_45599 ) ) ( not ( = ?auto_45608 ?auto_45590 ) ) ( not ( = ?auto_45601 ?auto_45608 ) ) ( not ( = ?auto_45611 ?auto_45608 ) ) ( not ( = ?auto_45604 ?auto_45608 ) ) ( HOIST-AT ?auto_45606 ?auto_45608 ) ( not ( = ?auto_45607 ?auto_45606 ) ) ( not ( = ?auto_45596 ?auto_45606 ) ) ( not ( = ?auto_45600 ?auto_45606 ) ) ( not ( = ?auto_45592 ?auto_45606 ) ) ( AVAILABLE ?auto_45606 ) ( SURFACE-AT ?auto_45602 ?auto_45608 ) ( ON ?auto_45602 ?auto_45598 ) ( CLEAR ?auto_45602 ) ( not ( = ?auto_45587 ?auto_45598 ) ) ( not ( = ?auto_45588 ?auto_45598 ) ) ( not ( = ?auto_45594 ?auto_45598 ) ) ( not ( = ?auto_45610 ?auto_45598 ) ) ( not ( = ?auto_45593 ?auto_45598 ) ) ( not ( = ?auto_45591 ?auto_45598 ) ) ( not ( = ?auto_45603 ?auto_45598 ) ) ( not ( = ?auto_45605 ?auto_45598 ) ) ( not ( = ?auto_45595 ?auto_45598 ) ) ( not ( = ?auto_45602 ?auto_45598 ) ) ( not ( = ?auto_45597 ?auto_45598 ) ) ( not ( = ?auto_45599 ?auto_45598 ) ) ( SURFACE-AT ?auto_45589 ?auto_45590 ) ( CLEAR ?auto_45589 ) ( IS-CRATE ?auto_45599 ) ( not ( = ?auto_45587 ?auto_45589 ) ) ( not ( = ?auto_45588 ?auto_45589 ) ) ( not ( = ?auto_45594 ?auto_45589 ) ) ( not ( = ?auto_45610 ?auto_45589 ) ) ( not ( = ?auto_45593 ?auto_45589 ) ) ( not ( = ?auto_45591 ?auto_45589 ) ) ( not ( = ?auto_45603 ?auto_45589 ) ) ( not ( = ?auto_45605 ?auto_45589 ) ) ( not ( = ?auto_45595 ?auto_45589 ) ) ( not ( = ?auto_45602 ?auto_45589 ) ) ( not ( = ?auto_45597 ?auto_45589 ) ) ( not ( = ?auto_45599 ?auto_45589 ) ) ( not ( = ?auto_45598 ?auto_45589 ) ) ( AVAILABLE ?auto_45607 ) ( IN ?auto_45599 ?auto_45609 ) ( TRUCK-AT ?auto_45609 ?auto_45608 ) )
    :subtasks
    ( ( !DRIVE ?auto_45609 ?auto_45608 ?auto_45590 )
      ( MAKE-ON ?auto_45587 ?auto_45588 )
      ( MAKE-ON-VERIFY ?auto_45587 ?auto_45588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45612 - SURFACE
      ?auto_45613 - SURFACE
    )
    :vars
    (
      ?auto_45618 - HOIST
      ?auto_45634 - PLACE
      ?auto_45632 - PLACE
      ?auto_45614 - HOIST
      ?auto_45626 - SURFACE
      ?auto_45622 - SURFACE
      ?auto_45623 - PLACE
      ?auto_45627 - HOIST
      ?auto_45617 - SURFACE
      ?auto_45631 - SURFACE
      ?auto_45628 - SURFACE
      ?auto_45635 - SURFACE
      ?auto_45624 - PLACE
      ?auto_45633 - HOIST
      ?auto_45629 - SURFACE
      ?auto_45619 - SURFACE
      ?auto_45625 - SURFACE
      ?auto_45616 - SURFACE
      ?auto_45620 - PLACE
      ?auto_45636 - HOIST
      ?auto_45630 - SURFACE
      ?auto_45615 - SURFACE
      ?auto_45621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45618 ?auto_45634 ) ( IS-CRATE ?auto_45612 ) ( not ( = ?auto_45612 ?auto_45613 ) ) ( not ( = ?auto_45632 ?auto_45634 ) ) ( HOIST-AT ?auto_45614 ?auto_45632 ) ( not ( = ?auto_45618 ?auto_45614 ) ) ( SURFACE-AT ?auto_45612 ?auto_45632 ) ( ON ?auto_45612 ?auto_45626 ) ( CLEAR ?auto_45612 ) ( not ( = ?auto_45612 ?auto_45626 ) ) ( not ( = ?auto_45613 ?auto_45626 ) ) ( IS-CRATE ?auto_45613 ) ( not ( = ?auto_45612 ?auto_45622 ) ) ( not ( = ?auto_45613 ?auto_45622 ) ) ( not ( = ?auto_45626 ?auto_45622 ) ) ( not ( = ?auto_45623 ?auto_45634 ) ) ( not ( = ?auto_45632 ?auto_45623 ) ) ( HOIST-AT ?auto_45627 ?auto_45623 ) ( not ( = ?auto_45618 ?auto_45627 ) ) ( not ( = ?auto_45614 ?auto_45627 ) ) ( SURFACE-AT ?auto_45613 ?auto_45623 ) ( ON ?auto_45613 ?auto_45617 ) ( CLEAR ?auto_45613 ) ( not ( = ?auto_45612 ?auto_45617 ) ) ( not ( = ?auto_45613 ?auto_45617 ) ) ( not ( = ?auto_45626 ?auto_45617 ) ) ( not ( = ?auto_45622 ?auto_45617 ) ) ( IS-CRATE ?auto_45622 ) ( not ( = ?auto_45612 ?auto_45631 ) ) ( not ( = ?auto_45613 ?auto_45631 ) ) ( not ( = ?auto_45626 ?auto_45631 ) ) ( not ( = ?auto_45622 ?auto_45631 ) ) ( not ( = ?auto_45617 ?auto_45631 ) ) ( AVAILABLE ?auto_45627 ) ( SURFACE-AT ?auto_45622 ?auto_45623 ) ( ON ?auto_45622 ?auto_45628 ) ( CLEAR ?auto_45622 ) ( not ( = ?auto_45612 ?auto_45628 ) ) ( not ( = ?auto_45613 ?auto_45628 ) ) ( not ( = ?auto_45626 ?auto_45628 ) ) ( not ( = ?auto_45622 ?auto_45628 ) ) ( not ( = ?auto_45617 ?auto_45628 ) ) ( not ( = ?auto_45631 ?auto_45628 ) ) ( IS-CRATE ?auto_45631 ) ( not ( = ?auto_45612 ?auto_45635 ) ) ( not ( = ?auto_45613 ?auto_45635 ) ) ( not ( = ?auto_45626 ?auto_45635 ) ) ( not ( = ?auto_45622 ?auto_45635 ) ) ( not ( = ?auto_45617 ?auto_45635 ) ) ( not ( = ?auto_45631 ?auto_45635 ) ) ( not ( = ?auto_45628 ?auto_45635 ) ) ( not ( = ?auto_45624 ?auto_45634 ) ) ( not ( = ?auto_45632 ?auto_45624 ) ) ( not ( = ?auto_45623 ?auto_45624 ) ) ( HOIST-AT ?auto_45633 ?auto_45624 ) ( not ( = ?auto_45618 ?auto_45633 ) ) ( not ( = ?auto_45614 ?auto_45633 ) ) ( not ( = ?auto_45627 ?auto_45633 ) ) ( AVAILABLE ?auto_45633 ) ( SURFACE-AT ?auto_45631 ?auto_45624 ) ( ON ?auto_45631 ?auto_45629 ) ( CLEAR ?auto_45631 ) ( not ( = ?auto_45612 ?auto_45629 ) ) ( not ( = ?auto_45613 ?auto_45629 ) ) ( not ( = ?auto_45626 ?auto_45629 ) ) ( not ( = ?auto_45622 ?auto_45629 ) ) ( not ( = ?auto_45617 ?auto_45629 ) ) ( not ( = ?auto_45631 ?auto_45629 ) ) ( not ( = ?auto_45628 ?auto_45629 ) ) ( not ( = ?auto_45635 ?auto_45629 ) ) ( IS-CRATE ?auto_45635 ) ( not ( = ?auto_45612 ?auto_45619 ) ) ( not ( = ?auto_45613 ?auto_45619 ) ) ( not ( = ?auto_45626 ?auto_45619 ) ) ( not ( = ?auto_45622 ?auto_45619 ) ) ( not ( = ?auto_45617 ?auto_45619 ) ) ( not ( = ?auto_45631 ?auto_45619 ) ) ( not ( = ?auto_45628 ?auto_45619 ) ) ( not ( = ?auto_45635 ?auto_45619 ) ) ( not ( = ?auto_45629 ?auto_45619 ) ) ( AVAILABLE ?auto_45614 ) ( SURFACE-AT ?auto_45635 ?auto_45632 ) ( ON ?auto_45635 ?auto_45625 ) ( CLEAR ?auto_45635 ) ( not ( = ?auto_45612 ?auto_45625 ) ) ( not ( = ?auto_45613 ?auto_45625 ) ) ( not ( = ?auto_45626 ?auto_45625 ) ) ( not ( = ?auto_45622 ?auto_45625 ) ) ( not ( = ?auto_45617 ?auto_45625 ) ) ( not ( = ?auto_45631 ?auto_45625 ) ) ( not ( = ?auto_45628 ?auto_45625 ) ) ( not ( = ?auto_45635 ?auto_45625 ) ) ( not ( = ?auto_45629 ?auto_45625 ) ) ( not ( = ?auto_45619 ?auto_45625 ) ) ( IS-CRATE ?auto_45619 ) ( not ( = ?auto_45612 ?auto_45616 ) ) ( not ( = ?auto_45613 ?auto_45616 ) ) ( not ( = ?auto_45626 ?auto_45616 ) ) ( not ( = ?auto_45622 ?auto_45616 ) ) ( not ( = ?auto_45617 ?auto_45616 ) ) ( not ( = ?auto_45631 ?auto_45616 ) ) ( not ( = ?auto_45628 ?auto_45616 ) ) ( not ( = ?auto_45635 ?auto_45616 ) ) ( not ( = ?auto_45629 ?auto_45616 ) ) ( not ( = ?auto_45619 ?auto_45616 ) ) ( not ( = ?auto_45625 ?auto_45616 ) ) ( not ( = ?auto_45620 ?auto_45634 ) ) ( not ( = ?auto_45632 ?auto_45620 ) ) ( not ( = ?auto_45623 ?auto_45620 ) ) ( not ( = ?auto_45624 ?auto_45620 ) ) ( HOIST-AT ?auto_45636 ?auto_45620 ) ( not ( = ?auto_45618 ?auto_45636 ) ) ( not ( = ?auto_45614 ?auto_45636 ) ) ( not ( = ?auto_45627 ?auto_45636 ) ) ( not ( = ?auto_45633 ?auto_45636 ) ) ( SURFACE-AT ?auto_45619 ?auto_45620 ) ( ON ?auto_45619 ?auto_45630 ) ( CLEAR ?auto_45619 ) ( not ( = ?auto_45612 ?auto_45630 ) ) ( not ( = ?auto_45613 ?auto_45630 ) ) ( not ( = ?auto_45626 ?auto_45630 ) ) ( not ( = ?auto_45622 ?auto_45630 ) ) ( not ( = ?auto_45617 ?auto_45630 ) ) ( not ( = ?auto_45631 ?auto_45630 ) ) ( not ( = ?auto_45628 ?auto_45630 ) ) ( not ( = ?auto_45635 ?auto_45630 ) ) ( not ( = ?auto_45629 ?auto_45630 ) ) ( not ( = ?auto_45619 ?auto_45630 ) ) ( not ( = ?auto_45625 ?auto_45630 ) ) ( not ( = ?auto_45616 ?auto_45630 ) ) ( SURFACE-AT ?auto_45615 ?auto_45634 ) ( CLEAR ?auto_45615 ) ( IS-CRATE ?auto_45616 ) ( not ( = ?auto_45612 ?auto_45615 ) ) ( not ( = ?auto_45613 ?auto_45615 ) ) ( not ( = ?auto_45626 ?auto_45615 ) ) ( not ( = ?auto_45622 ?auto_45615 ) ) ( not ( = ?auto_45617 ?auto_45615 ) ) ( not ( = ?auto_45631 ?auto_45615 ) ) ( not ( = ?auto_45628 ?auto_45615 ) ) ( not ( = ?auto_45635 ?auto_45615 ) ) ( not ( = ?auto_45629 ?auto_45615 ) ) ( not ( = ?auto_45619 ?auto_45615 ) ) ( not ( = ?auto_45625 ?auto_45615 ) ) ( not ( = ?auto_45616 ?auto_45615 ) ) ( not ( = ?auto_45630 ?auto_45615 ) ) ( AVAILABLE ?auto_45618 ) ( TRUCK-AT ?auto_45621 ?auto_45620 ) ( LIFTING ?auto_45636 ?auto_45616 ) )
    :subtasks
    ( ( !LOAD ?auto_45636 ?auto_45616 ?auto_45621 ?auto_45620 )
      ( MAKE-ON ?auto_45612 ?auto_45613 )
      ( MAKE-ON-VERIFY ?auto_45612 ?auto_45613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45637 - SURFACE
      ?auto_45638 - SURFACE
    )
    :vars
    (
      ?auto_45651 - HOIST
      ?auto_45657 - PLACE
      ?auto_45640 - PLACE
      ?auto_45660 - HOIST
      ?auto_45654 - SURFACE
      ?auto_45642 - SURFACE
      ?auto_45655 - PLACE
      ?auto_45652 - HOIST
      ?auto_45653 - SURFACE
      ?auto_45641 - SURFACE
      ?auto_45646 - SURFACE
      ?auto_45643 - SURFACE
      ?auto_45647 - PLACE
      ?auto_45656 - HOIST
      ?auto_45645 - SURFACE
      ?auto_45648 - SURFACE
      ?auto_45650 - SURFACE
      ?auto_45659 - SURFACE
      ?auto_45639 - PLACE
      ?auto_45644 - HOIST
      ?auto_45661 - SURFACE
      ?auto_45649 - SURFACE
      ?auto_45658 - TRUCK
      ?auto_45662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45651 ?auto_45657 ) ( IS-CRATE ?auto_45637 ) ( not ( = ?auto_45637 ?auto_45638 ) ) ( not ( = ?auto_45640 ?auto_45657 ) ) ( HOIST-AT ?auto_45660 ?auto_45640 ) ( not ( = ?auto_45651 ?auto_45660 ) ) ( SURFACE-AT ?auto_45637 ?auto_45640 ) ( ON ?auto_45637 ?auto_45654 ) ( CLEAR ?auto_45637 ) ( not ( = ?auto_45637 ?auto_45654 ) ) ( not ( = ?auto_45638 ?auto_45654 ) ) ( IS-CRATE ?auto_45638 ) ( not ( = ?auto_45637 ?auto_45642 ) ) ( not ( = ?auto_45638 ?auto_45642 ) ) ( not ( = ?auto_45654 ?auto_45642 ) ) ( not ( = ?auto_45655 ?auto_45657 ) ) ( not ( = ?auto_45640 ?auto_45655 ) ) ( HOIST-AT ?auto_45652 ?auto_45655 ) ( not ( = ?auto_45651 ?auto_45652 ) ) ( not ( = ?auto_45660 ?auto_45652 ) ) ( SURFACE-AT ?auto_45638 ?auto_45655 ) ( ON ?auto_45638 ?auto_45653 ) ( CLEAR ?auto_45638 ) ( not ( = ?auto_45637 ?auto_45653 ) ) ( not ( = ?auto_45638 ?auto_45653 ) ) ( not ( = ?auto_45654 ?auto_45653 ) ) ( not ( = ?auto_45642 ?auto_45653 ) ) ( IS-CRATE ?auto_45642 ) ( not ( = ?auto_45637 ?auto_45641 ) ) ( not ( = ?auto_45638 ?auto_45641 ) ) ( not ( = ?auto_45654 ?auto_45641 ) ) ( not ( = ?auto_45642 ?auto_45641 ) ) ( not ( = ?auto_45653 ?auto_45641 ) ) ( AVAILABLE ?auto_45652 ) ( SURFACE-AT ?auto_45642 ?auto_45655 ) ( ON ?auto_45642 ?auto_45646 ) ( CLEAR ?auto_45642 ) ( not ( = ?auto_45637 ?auto_45646 ) ) ( not ( = ?auto_45638 ?auto_45646 ) ) ( not ( = ?auto_45654 ?auto_45646 ) ) ( not ( = ?auto_45642 ?auto_45646 ) ) ( not ( = ?auto_45653 ?auto_45646 ) ) ( not ( = ?auto_45641 ?auto_45646 ) ) ( IS-CRATE ?auto_45641 ) ( not ( = ?auto_45637 ?auto_45643 ) ) ( not ( = ?auto_45638 ?auto_45643 ) ) ( not ( = ?auto_45654 ?auto_45643 ) ) ( not ( = ?auto_45642 ?auto_45643 ) ) ( not ( = ?auto_45653 ?auto_45643 ) ) ( not ( = ?auto_45641 ?auto_45643 ) ) ( not ( = ?auto_45646 ?auto_45643 ) ) ( not ( = ?auto_45647 ?auto_45657 ) ) ( not ( = ?auto_45640 ?auto_45647 ) ) ( not ( = ?auto_45655 ?auto_45647 ) ) ( HOIST-AT ?auto_45656 ?auto_45647 ) ( not ( = ?auto_45651 ?auto_45656 ) ) ( not ( = ?auto_45660 ?auto_45656 ) ) ( not ( = ?auto_45652 ?auto_45656 ) ) ( AVAILABLE ?auto_45656 ) ( SURFACE-AT ?auto_45641 ?auto_45647 ) ( ON ?auto_45641 ?auto_45645 ) ( CLEAR ?auto_45641 ) ( not ( = ?auto_45637 ?auto_45645 ) ) ( not ( = ?auto_45638 ?auto_45645 ) ) ( not ( = ?auto_45654 ?auto_45645 ) ) ( not ( = ?auto_45642 ?auto_45645 ) ) ( not ( = ?auto_45653 ?auto_45645 ) ) ( not ( = ?auto_45641 ?auto_45645 ) ) ( not ( = ?auto_45646 ?auto_45645 ) ) ( not ( = ?auto_45643 ?auto_45645 ) ) ( IS-CRATE ?auto_45643 ) ( not ( = ?auto_45637 ?auto_45648 ) ) ( not ( = ?auto_45638 ?auto_45648 ) ) ( not ( = ?auto_45654 ?auto_45648 ) ) ( not ( = ?auto_45642 ?auto_45648 ) ) ( not ( = ?auto_45653 ?auto_45648 ) ) ( not ( = ?auto_45641 ?auto_45648 ) ) ( not ( = ?auto_45646 ?auto_45648 ) ) ( not ( = ?auto_45643 ?auto_45648 ) ) ( not ( = ?auto_45645 ?auto_45648 ) ) ( AVAILABLE ?auto_45660 ) ( SURFACE-AT ?auto_45643 ?auto_45640 ) ( ON ?auto_45643 ?auto_45650 ) ( CLEAR ?auto_45643 ) ( not ( = ?auto_45637 ?auto_45650 ) ) ( not ( = ?auto_45638 ?auto_45650 ) ) ( not ( = ?auto_45654 ?auto_45650 ) ) ( not ( = ?auto_45642 ?auto_45650 ) ) ( not ( = ?auto_45653 ?auto_45650 ) ) ( not ( = ?auto_45641 ?auto_45650 ) ) ( not ( = ?auto_45646 ?auto_45650 ) ) ( not ( = ?auto_45643 ?auto_45650 ) ) ( not ( = ?auto_45645 ?auto_45650 ) ) ( not ( = ?auto_45648 ?auto_45650 ) ) ( IS-CRATE ?auto_45648 ) ( not ( = ?auto_45637 ?auto_45659 ) ) ( not ( = ?auto_45638 ?auto_45659 ) ) ( not ( = ?auto_45654 ?auto_45659 ) ) ( not ( = ?auto_45642 ?auto_45659 ) ) ( not ( = ?auto_45653 ?auto_45659 ) ) ( not ( = ?auto_45641 ?auto_45659 ) ) ( not ( = ?auto_45646 ?auto_45659 ) ) ( not ( = ?auto_45643 ?auto_45659 ) ) ( not ( = ?auto_45645 ?auto_45659 ) ) ( not ( = ?auto_45648 ?auto_45659 ) ) ( not ( = ?auto_45650 ?auto_45659 ) ) ( not ( = ?auto_45639 ?auto_45657 ) ) ( not ( = ?auto_45640 ?auto_45639 ) ) ( not ( = ?auto_45655 ?auto_45639 ) ) ( not ( = ?auto_45647 ?auto_45639 ) ) ( HOIST-AT ?auto_45644 ?auto_45639 ) ( not ( = ?auto_45651 ?auto_45644 ) ) ( not ( = ?auto_45660 ?auto_45644 ) ) ( not ( = ?auto_45652 ?auto_45644 ) ) ( not ( = ?auto_45656 ?auto_45644 ) ) ( SURFACE-AT ?auto_45648 ?auto_45639 ) ( ON ?auto_45648 ?auto_45661 ) ( CLEAR ?auto_45648 ) ( not ( = ?auto_45637 ?auto_45661 ) ) ( not ( = ?auto_45638 ?auto_45661 ) ) ( not ( = ?auto_45654 ?auto_45661 ) ) ( not ( = ?auto_45642 ?auto_45661 ) ) ( not ( = ?auto_45653 ?auto_45661 ) ) ( not ( = ?auto_45641 ?auto_45661 ) ) ( not ( = ?auto_45646 ?auto_45661 ) ) ( not ( = ?auto_45643 ?auto_45661 ) ) ( not ( = ?auto_45645 ?auto_45661 ) ) ( not ( = ?auto_45648 ?auto_45661 ) ) ( not ( = ?auto_45650 ?auto_45661 ) ) ( not ( = ?auto_45659 ?auto_45661 ) ) ( SURFACE-AT ?auto_45649 ?auto_45657 ) ( CLEAR ?auto_45649 ) ( IS-CRATE ?auto_45659 ) ( not ( = ?auto_45637 ?auto_45649 ) ) ( not ( = ?auto_45638 ?auto_45649 ) ) ( not ( = ?auto_45654 ?auto_45649 ) ) ( not ( = ?auto_45642 ?auto_45649 ) ) ( not ( = ?auto_45653 ?auto_45649 ) ) ( not ( = ?auto_45641 ?auto_45649 ) ) ( not ( = ?auto_45646 ?auto_45649 ) ) ( not ( = ?auto_45643 ?auto_45649 ) ) ( not ( = ?auto_45645 ?auto_45649 ) ) ( not ( = ?auto_45648 ?auto_45649 ) ) ( not ( = ?auto_45650 ?auto_45649 ) ) ( not ( = ?auto_45659 ?auto_45649 ) ) ( not ( = ?auto_45661 ?auto_45649 ) ) ( AVAILABLE ?auto_45651 ) ( TRUCK-AT ?auto_45658 ?auto_45639 ) ( AVAILABLE ?auto_45644 ) ( SURFACE-AT ?auto_45659 ?auto_45639 ) ( ON ?auto_45659 ?auto_45662 ) ( CLEAR ?auto_45659 ) ( not ( = ?auto_45637 ?auto_45662 ) ) ( not ( = ?auto_45638 ?auto_45662 ) ) ( not ( = ?auto_45654 ?auto_45662 ) ) ( not ( = ?auto_45642 ?auto_45662 ) ) ( not ( = ?auto_45653 ?auto_45662 ) ) ( not ( = ?auto_45641 ?auto_45662 ) ) ( not ( = ?auto_45646 ?auto_45662 ) ) ( not ( = ?auto_45643 ?auto_45662 ) ) ( not ( = ?auto_45645 ?auto_45662 ) ) ( not ( = ?auto_45648 ?auto_45662 ) ) ( not ( = ?auto_45650 ?auto_45662 ) ) ( not ( = ?auto_45659 ?auto_45662 ) ) ( not ( = ?auto_45661 ?auto_45662 ) ) ( not ( = ?auto_45649 ?auto_45662 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45644 ?auto_45659 ?auto_45662 ?auto_45639 )
      ( MAKE-ON ?auto_45637 ?auto_45638 )
      ( MAKE-ON-VERIFY ?auto_45637 ?auto_45638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45663 - SURFACE
      ?auto_45664 - SURFACE
    )
    :vars
    (
      ?auto_45668 - HOIST
      ?auto_45685 - PLACE
      ?auto_45674 - PLACE
      ?auto_45688 - HOIST
      ?auto_45672 - SURFACE
      ?auto_45678 - SURFACE
      ?auto_45683 - PLACE
      ?auto_45667 - HOIST
      ?auto_45671 - SURFACE
      ?auto_45677 - SURFACE
      ?auto_45679 - SURFACE
      ?auto_45666 - SURFACE
      ?auto_45681 - PLACE
      ?auto_45684 - HOIST
      ?auto_45676 - SURFACE
      ?auto_45669 - SURFACE
      ?auto_45673 - SURFACE
      ?auto_45687 - SURFACE
      ?auto_45682 - PLACE
      ?auto_45680 - HOIST
      ?auto_45670 - SURFACE
      ?auto_45665 - SURFACE
      ?auto_45675 - SURFACE
      ?auto_45686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45668 ?auto_45685 ) ( IS-CRATE ?auto_45663 ) ( not ( = ?auto_45663 ?auto_45664 ) ) ( not ( = ?auto_45674 ?auto_45685 ) ) ( HOIST-AT ?auto_45688 ?auto_45674 ) ( not ( = ?auto_45668 ?auto_45688 ) ) ( SURFACE-AT ?auto_45663 ?auto_45674 ) ( ON ?auto_45663 ?auto_45672 ) ( CLEAR ?auto_45663 ) ( not ( = ?auto_45663 ?auto_45672 ) ) ( not ( = ?auto_45664 ?auto_45672 ) ) ( IS-CRATE ?auto_45664 ) ( not ( = ?auto_45663 ?auto_45678 ) ) ( not ( = ?auto_45664 ?auto_45678 ) ) ( not ( = ?auto_45672 ?auto_45678 ) ) ( not ( = ?auto_45683 ?auto_45685 ) ) ( not ( = ?auto_45674 ?auto_45683 ) ) ( HOIST-AT ?auto_45667 ?auto_45683 ) ( not ( = ?auto_45668 ?auto_45667 ) ) ( not ( = ?auto_45688 ?auto_45667 ) ) ( SURFACE-AT ?auto_45664 ?auto_45683 ) ( ON ?auto_45664 ?auto_45671 ) ( CLEAR ?auto_45664 ) ( not ( = ?auto_45663 ?auto_45671 ) ) ( not ( = ?auto_45664 ?auto_45671 ) ) ( not ( = ?auto_45672 ?auto_45671 ) ) ( not ( = ?auto_45678 ?auto_45671 ) ) ( IS-CRATE ?auto_45678 ) ( not ( = ?auto_45663 ?auto_45677 ) ) ( not ( = ?auto_45664 ?auto_45677 ) ) ( not ( = ?auto_45672 ?auto_45677 ) ) ( not ( = ?auto_45678 ?auto_45677 ) ) ( not ( = ?auto_45671 ?auto_45677 ) ) ( AVAILABLE ?auto_45667 ) ( SURFACE-AT ?auto_45678 ?auto_45683 ) ( ON ?auto_45678 ?auto_45679 ) ( CLEAR ?auto_45678 ) ( not ( = ?auto_45663 ?auto_45679 ) ) ( not ( = ?auto_45664 ?auto_45679 ) ) ( not ( = ?auto_45672 ?auto_45679 ) ) ( not ( = ?auto_45678 ?auto_45679 ) ) ( not ( = ?auto_45671 ?auto_45679 ) ) ( not ( = ?auto_45677 ?auto_45679 ) ) ( IS-CRATE ?auto_45677 ) ( not ( = ?auto_45663 ?auto_45666 ) ) ( not ( = ?auto_45664 ?auto_45666 ) ) ( not ( = ?auto_45672 ?auto_45666 ) ) ( not ( = ?auto_45678 ?auto_45666 ) ) ( not ( = ?auto_45671 ?auto_45666 ) ) ( not ( = ?auto_45677 ?auto_45666 ) ) ( not ( = ?auto_45679 ?auto_45666 ) ) ( not ( = ?auto_45681 ?auto_45685 ) ) ( not ( = ?auto_45674 ?auto_45681 ) ) ( not ( = ?auto_45683 ?auto_45681 ) ) ( HOIST-AT ?auto_45684 ?auto_45681 ) ( not ( = ?auto_45668 ?auto_45684 ) ) ( not ( = ?auto_45688 ?auto_45684 ) ) ( not ( = ?auto_45667 ?auto_45684 ) ) ( AVAILABLE ?auto_45684 ) ( SURFACE-AT ?auto_45677 ?auto_45681 ) ( ON ?auto_45677 ?auto_45676 ) ( CLEAR ?auto_45677 ) ( not ( = ?auto_45663 ?auto_45676 ) ) ( not ( = ?auto_45664 ?auto_45676 ) ) ( not ( = ?auto_45672 ?auto_45676 ) ) ( not ( = ?auto_45678 ?auto_45676 ) ) ( not ( = ?auto_45671 ?auto_45676 ) ) ( not ( = ?auto_45677 ?auto_45676 ) ) ( not ( = ?auto_45679 ?auto_45676 ) ) ( not ( = ?auto_45666 ?auto_45676 ) ) ( IS-CRATE ?auto_45666 ) ( not ( = ?auto_45663 ?auto_45669 ) ) ( not ( = ?auto_45664 ?auto_45669 ) ) ( not ( = ?auto_45672 ?auto_45669 ) ) ( not ( = ?auto_45678 ?auto_45669 ) ) ( not ( = ?auto_45671 ?auto_45669 ) ) ( not ( = ?auto_45677 ?auto_45669 ) ) ( not ( = ?auto_45679 ?auto_45669 ) ) ( not ( = ?auto_45666 ?auto_45669 ) ) ( not ( = ?auto_45676 ?auto_45669 ) ) ( AVAILABLE ?auto_45688 ) ( SURFACE-AT ?auto_45666 ?auto_45674 ) ( ON ?auto_45666 ?auto_45673 ) ( CLEAR ?auto_45666 ) ( not ( = ?auto_45663 ?auto_45673 ) ) ( not ( = ?auto_45664 ?auto_45673 ) ) ( not ( = ?auto_45672 ?auto_45673 ) ) ( not ( = ?auto_45678 ?auto_45673 ) ) ( not ( = ?auto_45671 ?auto_45673 ) ) ( not ( = ?auto_45677 ?auto_45673 ) ) ( not ( = ?auto_45679 ?auto_45673 ) ) ( not ( = ?auto_45666 ?auto_45673 ) ) ( not ( = ?auto_45676 ?auto_45673 ) ) ( not ( = ?auto_45669 ?auto_45673 ) ) ( IS-CRATE ?auto_45669 ) ( not ( = ?auto_45663 ?auto_45687 ) ) ( not ( = ?auto_45664 ?auto_45687 ) ) ( not ( = ?auto_45672 ?auto_45687 ) ) ( not ( = ?auto_45678 ?auto_45687 ) ) ( not ( = ?auto_45671 ?auto_45687 ) ) ( not ( = ?auto_45677 ?auto_45687 ) ) ( not ( = ?auto_45679 ?auto_45687 ) ) ( not ( = ?auto_45666 ?auto_45687 ) ) ( not ( = ?auto_45676 ?auto_45687 ) ) ( not ( = ?auto_45669 ?auto_45687 ) ) ( not ( = ?auto_45673 ?auto_45687 ) ) ( not ( = ?auto_45682 ?auto_45685 ) ) ( not ( = ?auto_45674 ?auto_45682 ) ) ( not ( = ?auto_45683 ?auto_45682 ) ) ( not ( = ?auto_45681 ?auto_45682 ) ) ( HOIST-AT ?auto_45680 ?auto_45682 ) ( not ( = ?auto_45668 ?auto_45680 ) ) ( not ( = ?auto_45688 ?auto_45680 ) ) ( not ( = ?auto_45667 ?auto_45680 ) ) ( not ( = ?auto_45684 ?auto_45680 ) ) ( SURFACE-AT ?auto_45669 ?auto_45682 ) ( ON ?auto_45669 ?auto_45670 ) ( CLEAR ?auto_45669 ) ( not ( = ?auto_45663 ?auto_45670 ) ) ( not ( = ?auto_45664 ?auto_45670 ) ) ( not ( = ?auto_45672 ?auto_45670 ) ) ( not ( = ?auto_45678 ?auto_45670 ) ) ( not ( = ?auto_45671 ?auto_45670 ) ) ( not ( = ?auto_45677 ?auto_45670 ) ) ( not ( = ?auto_45679 ?auto_45670 ) ) ( not ( = ?auto_45666 ?auto_45670 ) ) ( not ( = ?auto_45676 ?auto_45670 ) ) ( not ( = ?auto_45669 ?auto_45670 ) ) ( not ( = ?auto_45673 ?auto_45670 ) ) ( not ( = ?auto_45687 ?auto_45670 ) ) ( SURFACE-AT ?auto_45665 ?auto_45685 ) ( CLEAR ?auto_45665 ) ( IS-CRATE ?auto_45687 ) ( not ( = ?auto_45663 ?auto_45665 ) ) ( not ( = ?auto_45664 ?auto_45665 ) ) ( not ( = ?auto_45672 ?auto_45665 ) ) ( not ( = ?auto_45678 ?auto_45665 ) ) ( not ( = ?auto_45671 ?auto_45665 ) ) ( not ( = ?auto_45677 ?auto_45665 ) ) ( not ( = ?auto_45679 ?auto_45665 ) ) ( not ( = ?auto_45666 ?auto_45665 ) ) ( not ( = ?auto_45676 ?auto_45665 ) ) ( not ( = ?auto_45669 ?auto_45665 ) ) ( not ( = ?auto_45673 ?auto_45665 ) ) ( not ( = ?auto_45687 ?auto_45665 ) ) ( not ( = ?auto_45670 ?auto_45665 ) ) ( AVAILABLE ?auto_45668 ) ( AVAILABLE ?auto_45680 ) ( SURFACE-AT ?auto_45687 ?auto_45682 ) ( ON ?auto_45687 ?auto_45675 ) ( CLEAR ?auto_45687 ) ( not ( = ?auto_45663 ?auto_45675 ) ) ( not ( = ?auto_45664 ?auto_45675 ) ) ( not ( = ?auto_45672 ?auto_45675 ) ) ( not ( = ?auto_45678 ?auto_45675 ) ) ( not ( = ?auto_45671 ?auto_45675 ) ) ( not ( = ?auto_45677 ?auto_45675 ) ) ( not ( = ?auto_45679 ?auto_45675 ) ) ( not ( = ?auto_45666 ?auto_45675 ) ) ( not ( = ?auto_45676 ?auto_45675 ) ) ( not ( = ?auto_45669 ?auto_45675 ) ) ( not ( = ?auto_45673 ?auto_45675 ) ) ( not ( = ?auto_45687 ?auto_45675 ) ) ( not ( = ?auto_45670 ?auto_45675 ) ) ( not ( = ?auto_45665 ?auto_45675 ) ) ( TRUCK-AT ?auto_45686 ?auto_45685 ) )
    :subtasks
    ( ( !DRIVE ?auto_45686 ?auto_45685 ?auto_45682 )
      ( MAKE-ON ?auto_45663 ?auto_45664 )
      ( MAKE-ON-VERIFY ?auto_45663 ?auto_45664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45689 - SURFACE
      ?auto_45690 - SURFACE
    )
    :vars
    (
      ?auto_45704 - HOIST
      ?auto_45705 - PLACE
      ?auto_45699 - PLACE
      ?auto_45694 - HOIST
      ?auto_45712 - SURFACE
      ?auto_45700 - SURFACE
      ?auto_45692 - PLACE
      ?auto_45702 - HOIST
      ?auto_45703 - SURFACE
      ?auto_45713 - SURFACE
      ?auto_45696 - SURFACE
      ?auto_45711 - SURFACE
      ?auto_45693 - PLACE
      ?auto_45697 - HOIST
      ?auto_45709 - SURFACE
      ?auto_45698 - SURFACE
      ?auto_45710 - SURFACE
      ?auto_45707 - SURFACE
      ?auto_45691 - PLACE
      ?auto_45708 - HOIST
      ?auto_45701 - SURFACE
      ?auto_45695 - SURFACE
      ?auto_45714 - SURFACE
      ?auto_45706 - TRUCK
      ?auto_45715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45704 ?auto_45705 ) ( IS-CRATE ?auto_45689 ) ( not ( = ?auto_45689 ?auto_45690 ) ) ( not ( = ?auto_45699 ?auto_45705 ) ) ( HOIST-AT ?auto_45694 ?auto_45699 ) ( not ( = ?auto_45704 ?auto_45694 ) ) ( SURFACE-AT ?auto_45689 ?auto_45699 ) ( ON ?auto_45689 ?auto_45712 ) ( CLEAR ?auto_45689 ) ( not ( = ?auto_45689 ?auto_45712 ) ) ( not ( = ?auto_45690 ?auto_45712 ) ) ( IS-CRATE ?auto_45690 ) ( not ( = ?auto_45689 ?auto_45700 ) ) ( not ( = ?auto_45690 ?auto_45700 ) ) ( not ( = ?auto_45712 ?auto_45700 ) ) ( not ( = ?auto_45692 ?auto_45705 ) ) ( not ( = ?auto_45699 ?auto_45692 ) ) ( HOIST-AT ?auto_45702 ?auto_45692 ) ( not ( = ?auto_45704 ?auto_45702 ) ) ( not ( = ?auto_45694 ?auto_45702 ) ) ( SURFACE-AT ?auto_45690 ?auto_45692 ) ( ON ?auto_45690 ?auto_45703 ) ( CLEAR ?auto_45690 ) ( not ( = ?auto_45689 ?auto_45703 ) ) ( not ( = ?auto_45690 ?auto_45703 ) ) ( not ( = ?auto_45712 ?auto_45703 ) ) ( not ( = ?auto_45700 ?auto_45703 ) ) ( IS-CRATE ?auto_45700 ) ( not ( = ?auto_45689 ?auto_45713 ) ) ( not ( = ?auto_45690 ?auto_45713 ) ) ( not ( = ?auto_45712 ?auto_45713 ) ) ( not ( = ?auto_45700 ?auto_45713 ) ) ( not ( = ?auto_45703 ?auto_45713 ) ) ( AVAILABLE ?auto_45702 ) ( SURFACE-AT ?auto_45700 ?auto_45692 ) ( ON ?auto_45700 ?auto_45696 ) ( CLEAR ?auto_45700 ) ( not ( = ?auto_45689 ?auto_45696 ) ) ( not ( = ?auto_45690 ?auto_45696 ) ) ( not ( = ?auto_45712 ?auto_45696 ) ) ( not ( = ?auto_45700 ?auto_45696 ) ) ( not ( = ?auto_45703 ?auto_45696 ) ) ( not ( = ?auto_45713 ?auto_45696 ) ) ( IS-CRATE ?auto_45713 ) ( not ( = ?auto_45689 ?auto_45711 ) ) ( not ( = ?auto_45690 ?auto_45711 ) ) ( not ( = ?auto_45712 ?auto_45711 ) ) ( not ( = ?auto_45700 ?auto_45711 ) ) ( not ( = ?auto_45703 ?auto_45711 ) ) ( not ( = ?auto_45713 ?auto_45711 ) ) ( not ( = ?auto_45696 ?auto_45711 ) ) ( not ( = ?auto_45693 ?auto_45705 ) ) ( not ( = ?auto_45699 ?auto_45693 ) ) ( not ( = ?auto_45692 ?auto_45693 ) ) ( HOIST-AT ?auto_45697 ?auto_45693 ) ( not ( = ?auto_45704 ?auto_45697 ) ) ( not ( = ?auto_45694 ?auto_45697 ) ) ( not ( = ?auto_45702 ?auto_45697 ) ) ( AVAILABLE ?auto_45697 ) ( SURFACE-AT ?auto_45713 ?auto_45693 ) ( ON ?auto_45713 ?auto_45709 ) ( CLEAR ?auto_45713 ) ( not ( = ?auto_45689 ?auto_45709 ) ) ( not ( = ?auto_45690 ?auto_45709 ) ) ( not ( = ?auto_45712 ?auto_45709 ) ) ( not ( = ?auto_45700 ?auto_45709 ) ) ( not ( = ?auto_45703 ?auto_45709 ) ) ( not ( = ?auto_45713 ?auto_45709 ) ) ( not ( = ?auto_45696 ?auto_45709 ) ) ( not ( = ?auto_45711 ?auto_45709 ) ) ( IS-CRATE ?auto_45711 ) ( not ( = ?auto_45689 ?auto_45698 ) ) ( not ( = ?auto_45690 ?auto_45698 ) ) ( not ( = ?auto_45712 ?auto_45698 ) ) ( not ( = ?auto_45700 ?auto_45698 ) ) ( not ( = ?auto_45703 ?auto_45698 ) ) ( not ( = ?auto_45713 ?auto_45698 ) ) ( not ( = ?auto_45696 ?auto_45698 ) ) ( not ( = ?auto_45711 ?auto_45698 ) ) ( not ( = ?auto_45709 ?auto_45698 ) ) ( AVAILABLE ?auto_45694 ) ( SURFACE-AT ?auto_45711 ?auto_45699 ) ( ON ?auto_45711 ?auto_45710 ) ( CLEAR ?auto_45711 ) ( not ( = ?auto_45689 ?auto_45710 ) ) ( not ( = ?auto_45690 ?auto_45710 ) ) ( not ( = ?auto_45712 ?auto_45710 ) ) ( not ( = ?auto_45700 ?auto_45710 ) ) ( not ( = ?auto_45703 ?auto_45710 ) ) ( not ( = ?auto_45713 ?auto_45710 ) ) ( not ( = ?auto_45696 ?auto_45710 ) ) ( not ( = ?auto_45711 ?auto_45710 ) ) ( not ( = ?auto_45709 ?auto_45710 ) ) ( not ( = ?auto_45698 ?auto_45710 ) ) ( IS-CRATE ?auto_45698 ) ( not ( = ?auto_45689 ?auto_45707 ) ) ( not ( = ?auto_45690 ?auto_45707 ) ) ( not ( = ?auto_45712 ?auto_45707 ) ) ( not ( = ?auto_45700 ?auto_45707 ) ) ( not ( = ?auto_45703 ?auto_45707 ) ) ( not ( = ?auto_45713 ?auto_45707 ) ) ( not ( = ?auto_45696 ?auto_45707 ) ) ( not ( = ?auto_45711 ?auto_45707 ) ) ( not ( = ?auto_45709 ?auto_45707 ) ) ( not ( = ?auto_45698 ?auto_45707 ) ) ( not ( = ?auto_45710 ?auto_45707 ) ) ( not ( = ?auto_45691 ?auto_45705 ) ) ( not ( = ?auto_45699 ?auto_45691 ) ) ( not ( = ?auto_45692 ?auto_45691 ) ) ( not ( = ?auto_45693 ?auto_45691 ) ) ( HOIST-AT ?auto_45708 ?auto_45691 ) ( not ( = ?auto_45704 ?auto_45708 ) ) ( not ( = ?auto_45694 ?auto_45708 ) ) ( not ( = ?auto_45702 ?auto_45708 ) ) ( not ( = ?auto_45697 ?auto_45708 ) ) ( SURFACE-AT ?auto_45698 ?auto_45691 ) ( ON ?auto_45698 ?auto_45701 ) ( CLEAR ?auto_45698 ) ( not ( = ?auto_45689 ?auto_45701 ) ) ( not ( = ?auto_45690 ?auto_45701 ) ) ( not ( = ?auto_45712 ?auto_45701 ) ) ( not ( = ?auto_45700 ?auto_45701 ) ) ( not ( = ?auto_45703 ?auto_45701 ) ) ( not ( = ?auto_45713 ?auto_45701 ) ) ( not ( = ?auto_45696 ?auto_45701 ) ) ( not ( = ?auto_45711 ?auto_45701 ) ) ( not ( = ?auto_45709 ?auto_45701 ) ) ( not ( = ?auto_45698 ?auto_45701 ) ) ( not ( = ?auto_45710 ?auto_45701 ) ) ( not ( = ?auto_45707 ?auto_45701 ) ) ( IS-CRATE ?auto_45707 ) ( not ( = ?auto_45689 ?auto_45695 ) ) ( not ( = ?auto_45690 ?auto_45695 ) ) ( not ( = ?auto_45712 ?auto_45695 ) ) ( not ( = ?auto_45700 ?auto_45695 ) ) ( not ( = ?auto_45703 ?auto_45695 ) ) ( not ( = ?auto_45713 ?auto_45695 ) ) ( not ( = ?auto_45696 ?auto_45695 ) ) ( not ( = ?auto_45711 ?auto_45695 ) ) ( not ( = ?auto_45709 ?auto_45695 ) ) ( not ( = ?auto_45698 ?auto_45695 ) ) ( not ( = ?auto_45710 ?auto_45695 ) ) ( not ( = ?auto_45707 ?auto_45695 ) ) ( not ( = ?auto_45701 ?auto_45695 ) ) ( AVAILABLE ?auto_45708 ) ( SURFACE-AT ?auto_45707 ?auto_45691 ) ( ON ?auto_45707 ?auto_45714 ) ( CLEAR ?auto_45707 ) ( not ( = ?auto_45689 ?auto_45714 ) ) ( not ( = ?auto_45690 ?auto_45714 ) ) ( not ( = ?auto_45712 ?auto_45714 ) ) ( not ( = ?auto_45700 ?auto_45714 ) ) ( not ( = ?auto_45703 ?auto_45714 ) ) ( not ( = ?auto_45713 ?auto_45714 ) ) ( not ( = ?auto_45696 ?auto_45714 ) ) ( not ( = ?auto_45711 ?auto_45714 ) ) ( not ( = ?auto_45709 ?auto_45714 ) ) ( not ( = ?auto_45698 ?auto_45714 ) ) ( not ( = ?auto_45710 ?auto_45714 ) ) ( not ( = ?auto_45707 ?auto_45714 ) ) ( not ( = ?auto_45701 ?auto_45714 ) ) ( not ( = ?auto_45695 ?auto_45714 ) ) ( TRUCK-AT ?auto_45706 ?auto_45705 ) ( SURFACE-AT ?auto_45715 ?auto_45705 ) ( CLEAR ?auto_45715 ) ( LIFTING ?auto_45704 ?auto_45695 ) ( IS-CRATE ?auto_45695 ) ( not ( = ?auto_45689 ?auto_45715 ) ) ( not ( = ?auto_45690 ?auto_45715 ) ) ( not ( = ?auto_45712 ?auto_45715 ) ) ( not ( = ?auto_45700 ?auto_45715 ) ) ( not ( = ?auto_45703 ?auto_45715 ) ) ( not ( = ?auto_45713 ?auto_45715 ) ) ( not ( = ?auto_45696 ?auto_45715 ) ) ( not ( = ?auto_45711 ?auto_45715 ) ) ( not ( = ?auto_45709 ?auto_45715 ) ) ( not ( = ?auto_45698 ?auto_45715 ) ) ( not ( = ?auto_45710 ?auto_45715 ) ) ( not ( = ?auto_45707 ?auto_45715 ) ) ( not ( = ?auto_45701 ?auto_45715 ) ) ( not ( = ?auto_45695 ?auto_45715 ) ) ( not ( = ?auto_45714 ?auto_45715 ) ) )
    :subtasks
    ( ( !DROP ?auto_45704 ?auto_45695 ?auto_45715 ?auto_45705 )
      ( MAKE-ON ?auto_45689 ?auto_45690 )
      ( MAKE-ON-VERIFY ?auto_45689 ?auto_45690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45716 - SURFACE
      ?auto_45717 - SURFACE
    )
    :vars
    (
      ?auto_45740 - HOIST
      ?auto_45731 - PLACE
      ?auto_45739 - PLACE
      ?auto_45727 - HOIST
      ?auto_45723 - SURFACE
      ?auto_45738 - SURFACE
      ?auto_45736 - PLACE
      ?auto_45741 - HOIST
      ?auto_45728 - SURFACE
      ?auto_45724 - SURFACE
      ?auto_45734 - SURFACE
      ?auto_45722 - SURFACE
      ?auto_45735 - PLACE
      ?auto_45732 - HOIST
      ?auto_45719 - SURFACE
      ?auto_45733 - SURFACE
      ?auto_45718 - SURFACE
      ?auto_45730 - SURFACE
      ?auto_45726 - PLACE
      ?auto_45720 - HOIST
      ?auto_45737 - SURFACE
      ?auto_45721 - SURFACE
      ?auto_45729 - SURFACE
      ?auto_45725 - TRUCK
      ?auto_45742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45740 ?auto_45731 ) ( IS-CRATE ?auto_45716 ) ( not ( = ?auto_45716 ?auto_45717 ) ) ( not ( = ?auto_45739 ?auto_45731 ) ) ( HOIST-AT ?auto_45727 ?auto_45739 ) ( not ( = ?auto_45740 ?auto_45727 ) ) ( SURFACE-AT ?auto_45716 ?auto_45739 ) ( ON ?auto_45716 ?auto_45723 ) ( CLEAR ?auto_45716 ) ( not ( = ?auto_45716 ?auto_45723 ) ) ( not ( = ?auto_45717 ?auto_45723 ) ) ( IS-CRATE ?auto_45717 ) ( not ( = ?auto_45716 ?auto_45738 ) ) ( not ( = ?auto_45717 ?auto_45738 ) ) ( not ( = ?auto_45723 ?auto_45738 ) ) ( not ( = ?auto_45736 ?auto_45731 ) ) ( not ( = ?auto_45739 ?auto_45736 ) ) ( HOIST-AT ?auto_45741 ?auto_45736 ) ( not ( = ?auto_45740 ?auto_45741 ) ) ( not ( = ?auto_45727 ?auto_45741 ) ) ( SURFACE-AT ?auto_45717 ?auto_45736 ) ( ON ?auto_45717 ?auto_45728 ) ( CLEAR ?auto_45717 ) ( not ( = ?auto_45716 ?auto_45728 ) ) ( not ( = ?auto_45717 ?auto_45728 ) ) ( not ( = ?auto_45723 ?auto_45728 ) ) ( not ( = ?auto_45738 ?auto_45728 ) ) ( IS-CRATE ?auto_45738 ) ( not ( = ?auto_45716 ?auto_45724 ) ) ( not ( = ?auto_45717 ?auto_45724 ) ) ( not ( = ?auto_45723 ?auto_45724 ) ) ( not ( = ?auto_45738 ?auto_45724 ) ) ( not ( = ?auto_45728 ?auto_45724 ) ) ( AVAILABLE ?auto_45741 ) ( SURFACE-AT ?auto_45738 ?auto_45736 ) ( ON ?auto_45738 ?auto_45734 ) ( CLEAR ?auto_45738 ) ( not ( = ?auto_45716 ?auto_45734 ) ) ( not ( = ?auto_45717 ?auto_45734 ) ) ( not ( = ?auto_45723 ?auto_45734 ) ) ( not ( = ?auto_45738 ?auto_45734 ) ) ( not ( = ?auto_45728 ?auto_45734 ) ) ( not ( = ?auto_45724 ?auto_45734 ) ) ( IS-CRATE ?auto_45724 ) ( not ( = ?auto_45716 ?auto_45722 ) ) ( not ( = ?auto_45717 ?auto_45722 ) ) ( not ( = ?auto_45723 ?auto_45722 ) ) ( not ( = ?auto_45738 ?auto_45722 ) ) ( not ( = ?auto_45728 ?auto_45722 ) ) ( not ( = ?auto_45724 ?auto_45722 ) ) ( not ( = ?auto_45734 ?auto_45722 ) ) ( not ( = ?auto_45735 ?auto_45731 ) ) ( not ( = ?auto_45739 ?auto_45735 ) ) ( not ( = ?auto_45736 ?auto_45735 ) ) ( HOIST-AT ?auto_45732 ?auto_45735 ) ( not ( = ?auto_45740 ?auto_45732 ) ) ( not ( = ?auto_45727 ?auto_45732 ) ) ( not ( = ?auto_45741 ?auto_45732 ) ) ( AVAILABLE ?auto_45732 ) ( SURFACE-AT ?auto_45724 ?auto_45735 ) ( ON ?auto_45724 ?auto_45719 ) ( CLEAR ?auto_45724 ) ( not ( = ?auto_45716 ?auto_45719 ) ) ( not ( = ?auto_45717 ?auto_45719 ) ) ( not ( = ?auto_45723 ?auto_45719 ) ) ( not ( = ?auto_45738 ?auto_45719 ) ) ( not ( = ?auto_45728 ?auto_45719 ) ) ( not ( = ?auto_45724 ?auto_45719 ) ) ( not ( = ?auto_45734 ?auto_45719 ) ) ( not ( = ?auto_45722 ?auto_45719 ) ) ( IS-CRATE ?auto_45722 ) ( not ( = ?auto_45716 ?auto_45733 ) ) ( not ( = ?auto_45717 ?auto_45733 ) ) ( not ( = ?auto_45723 ?auto_45733 ) ) ( not ( = ?auto_45738 ?auto_45733 ) ) ( not ( = ?auto_45728 ?auto_45733 ) ) ( not ( = ?auto_45724 ?auto_45733 ) ) ( not ( = ?auto_45734 ?auto_45733 ) ) ( not ( = ?auto_45722 ?auto_45733 ) ) ( not ( = ?auto_45719 ?auto_45733 ) ) ( AVAILABLE ?auto_45727 ) ( SURFACE-AT ?auto_45722 ?auto_45739 ) ( ON ?auto_45722 ?auto_45718 ) ( CLEAR ?auto_45722 ) ( not ( = ?auto_45716 ?auto_45718 ) ) ( not ( = ?auto_45717 ?auto_45718 ) ) ( not ( = ?auto_45723 ?auto_45718 ) ) ( not ( = ?auto_45738 ?auto_45718 ) ) ( not ( = ?auto_45728 ?auto_45718 ) ) ( not ( = ?auto_45724 ?auto_45718 ) ) ( not ( = ?auto_45734 ?auto_45718 ) ) ( not ( = ?auto_45722 ?auto_45718 ) ) ( not ( = ?auto_45719 ?auto_45718 ) ) ( not ( = ?auto_45733 ?auto_45718 ) ) ( IS-CRATE ?auto_45733 ) ( not ( = ?auto_45716 ?auto_45730 ) ) ( not ( = ?auto_45717 ?auto_45730 ) ) ( not ( = ?auto_45723 ?auto_45730 ) ) ( not ( = ?auto_45738 ?auto_45730 ) ) ( not ( = ?auto_45728 ?auto_45730 ) ) ( not ( = ?auto_45724 ?auto_45730 ) ) ( not ( = ?auto_45734 ?auto_45730 ) ) ( not ( = ?auto_45722 ?auto_45730 ) ) ( not ( = ?auto_45719 ?auto_45730 ) ) ( not ( = ?auto_45733 ?auto_45730 ) ) ( not ( = ?auto_45718 ?auto_45730 ) ) ( not ( = ?auto_45726 ?auto_45731 ) ) ( not ( = ?auto_45739 ?auto_45726 ) ) ( not ( = ?auto_45736 ?auto_45726 ) ) ( not ( = ?auto_45735 ?auto_45726 ) ) ( HOIST-AT ?auto_45720 ?auto_45726 ) ( not ( = ?auto_45740 ?auto_45720 ) ) ( not ( = ?auto_45727 ?auto_45720 ) ) ( not ( = ?auto_45741 ?auto_45720 ) ) ( not ( = ?auto_45732 ?auto_45720 ) ) ( SURFACE-AT ?auto_45733 ?auto_45726 ) ( ON ?auto_45733 ?auto_45737 ) ( CLEAR ?auto_45733 ) ( not ( = ?auto_45716 ?auto_45737 ) ) ( not ( = ?auto_45717 ?auto_45737 ) ) ( not ( = ?auto_45723 ?auto_45737 ) ) ( not ( = ?auto_45738 ?auto_45737 ) ) ( not ( = ?auto_45728 ?auto_45737 ) ) ( not ( = ?auto_45724 ?auto_45737 ) ) ( not ( = ?auto_45734 ?auto_45737 ) ) ( not ( = ?auto_45722 ?auto_45737 ) ) ( not ( = ?auto_45719 ?auto_45737 ) ) ( not ( = ?auto_45733 ?auto_45737 ) ) ( not ( = ?auto_45718 ?auto_45737 ) ) ( not ( = ?auto_45730 ?auto_45737 ) ) ( IS-CRATE ?auto_45730 ) ( not ( = ?auto_45716 ?auto_45721 ) ) ( not ( = ?auto_45717 ?auto_45721 ) ) ( not ( = ?auto_45723 ?auto_45721 ) ) ( not ( = ?auto_45738 ?auto_45721 ) ) ( not ( = ?auto_45728 ?auto_45721 ) ) ( not ( = ?auto_45724 ?auto_45721 ) ) ( not ( = ?auto_45734 ?auto_45721 ) ) ( not ( = ?auto_45722 ?auto_45721 ) ) ( not ( = ?auto_45719 ?auto_45721 ) ) ( not ( = ?auto_45733 ?auto_45721 ) ) ( not ( = ?auto_45718 ?auto_45721 ) ) ( not ( = ?auto_45730 ?auto_45721 ) ) ( not ( = ?auto_45737 ?auto_45721 ) ) ( AVAILABLE ?auto_45720 ) ( SURFACE-AT ?auto_45730 ?auto_45726 ) ( ON ?auto_45730 ?auto_45729 ) ( CLEAR ?auto_45730 ) ( not ( = ?auto_45716 ?auto_45729 ) ) ( not ( = ?auto_45717 ?auto_45729 ) ) ( not ( = ?auto_45723 ?auto_45729 ) ) ( not ( = ?auto_45738 ?auto_45729 ) ) ( not ( = ?auto_45728 ?auto_45729 ) ) ( not ( = ?auto_45724 ?auto_45729 ) ) ( not ( = ?auto_45734 ?auto_45729 ) ) ( not ( = ?auto_45722 ?auto_45729 ) ) ( not ( = ?auto_45719 ?auto_45729 ) ) ( not ( = ?auto_45733 ?auto_45729 ) ) ( not ( = ?auto_45718 ?auto_45729 ) ) ( not ( = ?auto_45730 ?auto_45729 ) ) ( not ( = ?auto_45737 ?auto_45729 ) ) ( not ( = ?auto_45721 ?auto_45729 ) ) ( TRUCK-AT ?auto_45725 ?auto_45731 ) ( SURFACE-AT ?auto_45742 ?auto_45731 ) ( CLEAR ?auto_45742 ) ( IS-CRATE ?auto_45721 ) ( not ( = ?auto_45716 ?auto_45742 ) ) ( not ( = ?auto_45717 ?auto_45742 ) ) ( not ( = ?auto_45723 ?auto_45742 ) ) ( not ( = ?auto_45738 ?auto_45742 ) ) ( not ( = ?auto_45728 ?auto_45742 ) ) ( not ( = ?auto_45724 ?auto_45742 ) ) ( not ( = ?auto_45734 ?auto_45742 ) ) ( not ( = ?auto_45722 ?auto_45742 ) ) ( not ( = ?auto_45719 ?auto_45742 ) ) ( not ( = ?auto_45733 ?auto_45742 ) ) ( not ( = ?auto_45718 ?auto_45742 ) ) ( not ( = ?auto_45730 ?auto_45742 ) ) ( not ( = ?auto_45737 ?auto_45742 ) ) ( not ( = ?auto_45721 ?auto_45742 ) ) ( not ( = ?auto_45729 ?auto_45742 ) ) ( AVAILABLE ?auto_45740 ) ( IN ?auto_45721 ?auto_45725 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45740 ?auto_45721 ?auto_45725 ?auto_45731 )
      ( MAKE-ON ?auto_45716 ?auto_45717 )
      ( MAKE-ON-VERIFY ?auto_45716 ?auto_45717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45743 - SURFACE
      ?auto_45744 - SURFACE
    )
    :vars
    (
      ?auto_45765 - HOIST
      ?auto_45767 - PLACE
      ?auto_45764 - PLACE
      ?auto_45752 - HOIST
      ?auto_45758 - SURFACE
      ?auto_45763 - SURFACE
      ?auto_45761 - PLACE
      ?auto_45756 - HOIST
      ?auto_45757 - SURFACE
      ?auto_45753 - SURFACE
      ?auto_45759 - SURFACE
      ?auto_45769 - SURFACE
      ?auto_45760 - PLACE
      ?auto_45768 - HOIST
      ?auto_45748 - SURFACE
      ?auto_45766 - SURFACE
      ?auto_45751 - SURFACE
      ?auto_45750 - SURFACE
      ?auto_45754 - PLACE
      ?auto_45746 - HOIST
      ?auto_45762 - SURFACE
      ?auto_45755 - SURFACE
      ?auto_45749 - SURFACE
      ?auto_45747 - SURFACE
      ?auto_45745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45765 ?auto_45767 ) ( IS-CRATE ?auto_45743 ) ( not ( = ?auto_45743 ?auto_45744 ) ) ( not ( = ?auto_45764 ?auto_45767 ) ) ( HOIST-AT ?auto_45752 ?auto_45764 ) ( not ( = ?auto_45765 ?auto_45752 ) ) ( SURFACE-AT ?auto_45743 ?auto_45764 ) ( ON ?auto_45743 ?auto_45758 ) ( CLEAR ?auto_45743 ) ( not ( = ?auto_45743 ?auto_45758 ) ) ( not ( = ?auto_45744 ?auto_45758 ) ) ( IS-CRATE ?auto_45744 ) ( not ( = ?auto_45743 ?auto_45763 ) ) ( not ( = ?auto_45744 ?auto_45763 ) ) ( not ( = ?auto_45758 ?auto_45763 ) ) ( not ( = ?auto_45761 ?auto_45767 ) ) ( not ( = ?auto_45764 ?auto_45761 ) ) ( HOIST-AT ?auto_45756 ?auto_45761 ) ( not ( = ?auto_45765 ?auto_45756 ) ) ( not ( = ?auto_45752 ?auto_45756 ) ) ( SURFACE-AT ?auto_45744 ?auto_45761 ) ( ON ?auto_45744 ?auto_45757 ) ( CLEAR ?auto_45744 ) ( not ( = ?auto_45743 ?auto_45757 ) ) ( not ( = ?auto_45744 ?auto_45757 ) ) ( not ( = ?auto_45758 ?auto_45757 ) ) ( not ( = ?auto_45763 ?auto_45757 ) ) ( IS-CRATE ?auto_45763 ) ( not ( = ?auto_45743 ?auto_45753 ) ) ( not ( = ?auto_45744 ?auto_45753 ) ) ( not ( = ?auto_45758 ?auto_45753 ) ) ( not ( = ?auto_45763 ?auto_45753 ) ) ( not ( = ?auto_45757 ?auto_45753 ) ) ( AVAILABLE ?auto_45756 ) ( SURFACE-AT ?auto_45763 ?auto_45761 ) ( ON ?auto_45763 ?auto_45759 ) ( CLEAR ?auto_45763 ) ( not ( = ?auto_45743 ?auto_45759 ) ) ( not ( = ?auto_45744 ?auto_45759 ) ) ( not ( = ?auto_45758 ?auto_45759 ) ) ( not ( = ?auto_45763 ?auto_45759 ) ) ( not ( = ?auto_45757 ?auto_45759 ) ) ( not ( = ?auto_45753 ?auto_45759 ) ) ( IS-CRATE ?auto_45753 ) ( not ( = ?auto_45743 ?auto_45769 ) ) ( not ( = ?auto_45744 ?auto_45769 ) ) ( not ( = ?auto_45758 ?auto_45769 ) ) ( not ( = ?auto_45763 ?auto_45769 ) ) ( not ( = ?auto_45757 ?auto_45769 ) ) ( not ( = ?auto_45753 ?auto_45769 ) ) ( not ( = ?auto_45759 ?auto_45769 ) ) ( not ( = ?auto_45760 ?auto_45767 ) ) ( not ( = ?auto_45764 ?auto_45760 ) ) ( not ( = ?auto_45761 ?auto_45760 ) ) ( HOIST-AT ?auto_45768 ?auto_45760 ) ( not ( = ?auto_45765 ?auto_45768 ) ) ( not ( = ?auto_45752 ?auto_45768 ) ) ( not ( = ?auto_45756 ?auto_45768 ) ) ( AVAILABLE ?auto_45768 ) ( SURFACE-AT ?auto_45753 ?auto_45760 ) ( ON ?auto_45753 ?auto_45748 ) ( CLEAR ?auto_45753 ) ( not ( = ?auto_45743 ?auto_45748 ) ) ( not ( = ?auto_45744 ?auto_45748 ) ) ( not ( = ?auto_45758 ?auto_45748 ) ) ( not ( = ?auto_45763 ?auto_45748 ) ) ( not ( = ?auto_45757 ?auto_45748 ) ) ( not ( = ?auto_45753 ?auto_45748 ) ) ( not ( = ?auto_45759 ?auto_45748 ) ) ( not ( = ?auto_45769 ?auto_45748 ) ) ( IS-CRATE ?auto_45769 ) ( not ( = ?auto_45743 ?auto_45766 ) ) ( not ( = ?auto_45744 ?auto_45766 ) ) ( not ( = ?auto_45758 ?auto_45766 ) ) ( not ( = ?auto_45763 ?auto_45766 ) ) ( not ( = ?auto_45757 ?auto_45766 ) ) ( not ( = ?auto_45753 ?auto_45766 ) ) ( not ( = ?auto_45759 ?auto_45766 ) ) ( not ( = ?auto_45769 ?auto_45766 ) ) ( not ( = ?auto_45748 ?auto_45766 ) ) ( AVAILABLE ?auto_45752 ) ( SURFACE-AT ?auto_45769 ?auto_45764 ) ( ON ?auto_45769 ?auto_45751 ) ( CLEAR ?auto_45769 ) ( not ( = ?auto_45743 ?auto_45751 ) ) ( not ( = ?auto_45744 ?auto_45751 ) ) ( not ( = ?auto_45758 ?auto_45751 ) ) ( not ( = ?auto_45763 ?auto_45751 ) ) ( not ( = ?auto_45757 ?auto_45751 ) ) ( not ( = ?auto_45753 ?auto_45751 ) ) ( not ( = ?auto_45759 ?auto_45751 ) ) ( not ( = ?auto_45769 ?auto_45751 ) ) ( not ( = ?auto_45748 ?auto_45751 ) ) ( not ( = ?auto_45766 ?auto_45751 ) ) ( IS-CRATE ?auto_45766 ) ( not ( = ?auto_45743 ?auto_45750 ) ) ( not ( = ?auto_45744 ?auto_45750 ) ) ( not ( = ?auto_45758 ?auto_45750 ) ) ( not ( = ?auto_45763 ?auto_45750 ) ) ( not ( = ?auto_45757 ?auto_45750 ) ) ( not ( = ?auto_45753 ?auto_45750 ) ) ( not ( = ?auto_45759 ?auto_45750 ) ) ( not ( = ?auto_45769 ?auto_45750 ) ) ( not ( = ?auto_45748 ?auto_45750 ) ) ( not ( = ?auto_45766 ?auto_45750 ) ) ( not ( = ?auto_45751 ?auto_45750 ) ) ( not ( = ?auto_45754 ?auto_45767 ) ) ( not ( = ?auto_45764 ?auto_45754 ) ) ( not ( = ?auto_45761 ?auto_45754 ) ) ( not ( = ?auto_45760 ?auto_45754 ) ) ( HOIST-AT ?auto_45746 ?auto_45754 ) ( not ( = ?auto_45765 ?auto_45746 ) ) ( not ( = ?auto_45752 ?auto_45746 ) ) ( not ( = ?auto_45756 ?auto_45746 ) ) ( not ( = ?auto_45768 ?auto_45746 ) ) ( SURFACE-AT ?auto_45766 ?auto_45754 ) ( ON ?auto_45766 ?auto_45762 ) ( CLEAR ?auto_45766 ) ( not ( = ?auto_45743 ?auto_45762 ) ) ( not ( = ?auto_45744 ?auto_45762 ) ) ( not ( = ?auto_45758 ?auto_45762 ) ) ( not ( = ?auto_45763 ?auto_45762 ) ) ( not ( = ?auto_45757 ?auto_45762 ) ) ( not ( = ?auto_45753 ?auto_45762 ) ) ( not ( = ?auto_45759 ?auto_45762 ) ) ( not ( = ?auto_45769 ?auto_45762 ) ) ( not ( = ?auto_45748 ?auto_45762 ) ) ( not ( = ?auto_45766 ?auto_45762 ) ) ( not ( = ?auto_45751 ?auto_45762 ) ) ( not ( = ?auto_45750 ?auto_45762 ) ) ( IS-CRATE ?auto_45750 ) ( not ( = ?auto_45743 ?auto_45755 ) ) ( not ( = ?auto_45744 ?auto_45755 ) ) ( not ( = ?auto_45758 ?auto_45755 ) ) ( not ( = ?auto_45763 ?auto_45755 ) ) ( not ( = ?auto_45757 ?auto_45755 ) ) ( not ( = ?auto_45753 ?auto_45755 ) ) ( not ( = ?auto_45759 ?auto_45755 ) ) ( not ( = ?auto_45769 ?auto_45755 ) ) ( not ( = ?auto_45748 ?auto_45755 ) ) ( not ( = ?auto_45766 ?auto_45755 ) ) ( not ( = ?auto_45751 ?auto_45755 ) ) ( not ( = ?auto_45750 ?auto_45755 ) ) ( not ( = ?auto_45762 ?auto_45755 ) ) ( AVAILABLE ?auto_45746 ) ( SURFACE-AT ?auto_45750 ?auto_45754 ) ( ON ?auto_45750 ?auto_45749 ) ( CLEAR ?auto_45750 ) ( not ( = ?auto_45743 ?auto_45749 ) ) ( not ( = ?auto_45744 ?auto_45749 ) ) ( not ( = ?auto_45758 ?auto_45749 ) ) ( not ( = ?auto_45763 ?auto_45749 ) ) ( not ( = ?auto_45757 ?auto_45749 ) ) ( not ( = ?auto_45753 ?auto_45749 ) ) ( not ( = ?auto_45759 ?auto_45749 ) ) ( not ( = ?auto_45769 ?auto_45749 ) ) ( not ( = ?auto_45748 ?auto_45749 ) ) ( not ( = ?auto_45766 ?auto_45749 ) ) ( not ( = ?auto_45751 ?auto_45749 ) ) ( not ( = ?auto_45750 ?auto_45749 ) ) ( not ( = ?auto_45762 ?auto_45749 ) ) ( not ( = ?auto_45755 ?auto_45749 ) ) ( SURFACE-AT ?auto_45747 ?auto_45767 ) ( CLEAR ?auto_45747 ) ( IS-CRATE ?auto_45755 ) ( not ( = ?auto_45743 ?auto_45747 ) ) ( not ( = ?auto_45744 ?auto_45747 ) ) ( not ( = ?auto_45758 ?auto_45747 ) ) ( not ( = ?auto_45763 ?auto_45747 ) ) ( not ( = ?auto_45757 ?auto_45747 ) ) ( not ( = ?auto_45753 ?auto_45747 ) ) ( not ( = ?auto_45759 ?auto_45747 ) ) ( not ( = ?auto_45769 ?auto_45747 ) ) ( not ( = ?auto_45748 ?auto_45747 ) ) ( not ( = ?auto_45766 ?auto_45747 ) ) ( not ( = ?auto_45751 ?auto_45747 ) ) ( not ( = ?auto_45750 ?auto_45747 ) ) ( not ( = ?auto_45762 ?auto_45747 ) ) ( not ( = ?auto_45755 ?auto_45747 ) ) ( not ( = ?auto_45749 ?auto_45747 ) ) ( AVAILABLE ?auto_45765 ) ( IN ?auto_45755 ?auto_45745 ) ( TRUCK-AT ?auto_45745 ?auto_45764 ) )
    :subtasks
    ( ( !DRIVE ?auto_45745 ?auto_45764 ?auto_45767 )
      ( MAKE-ON ?auto_45743 ?auto_45744 )
      ( MAKE-ON-VERIFY ?auto_45743 ?auto_45744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45770 - SURFACE
      ?auto_45771 - SURFACE
    )
    :vars
    (
      ?auto_45790 - HOIST
      ?auto_45792 - PLACE
      ?auto_45789 - PLACE
      ?auto_45778 - HOIST
      ?auto_45777 - SURFACE
      ?auto_45772 - SURFACE
      ?auto_45774 - PLACE
      ?auto_45783 - HOIST
      ?auto_45785 - SURFACE
      ?auto_45787 - SURFACE
      ?auto_45784 - SURFACE
      ?auto_45795 - SURFACE
      ?auto_45793 - PLACE
      ?auto_45775 - HOIST
      ?auto_45781 - SURFACE
      ?auto_45791 - SURFACE
      ?auto_45794 - SURFACE
      ?auto_45776 - SURFACE
      ?auto_45796 - PLACE
      ?auto_45780 - HOIST
      ?auto_45773 - SURFACE
      ?auto_45786 - SURFACE
      ?auto_45782 - SURFACE
      ?auto_45779 - SURFACE
      ?auto_45788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45790 ?auto_45792 ) ( IS-CRATE ?auto_45770 ) ( not ( = ?auto_45770 ?auto_45771 ) ) ( not ( = ?auto_45789 ?auto_45792 ) ) ( HOIST-AT ?auto_45778 ?auto_45789 ) ( not ( = ?auto_45790 ?auto_45778 ) ) ( SURFACE-AT ?auto_45770 ?auto_45789 ) ( ON ?auto_45770 ?auto_45777 ) ( CLEAR ?auto_45770 ) ( not ( = ?auto_45770 ?auto_45777 ) ) ( not ( = ?auto_45771 ?auto_45777 ) ) ( IS-CRATE ?auto_45771 ) ( not ( = ?auto_45770 ?auto_45772 ) ) ( not ( = ?auto_45771 ?auto_45772 ) ) ( not ( = ?auto_45777 ?auto_45772 ) ) ( not ( = ?auto_45774 ?auto_45792 ) ) ( not ( = ?auto_45789 ?auto_45774 ) ) ( HOIST-AT ?auto_45783 ?auto_45774 ) ( not ( = ?auto_45790 ?auto_45783 ) ) ( not ( = ?auto_45778 ?auto_45783 ) ) ( SURFACE-AT ?auto_45771 ?auto_45774 ) ( ON ?auto_45771 ?auto_45785 ) ( CLEAR ?auto_45771 ) ( not ( = ?auto_45770 ?auto_45785 ) ) ( not ( = ?auto_45771 ?auto_45785 ) ) ( not ( = ?auto_45777 ?auto_45785 ) ) ( not ( = ?auto_45772 ?auto_45785 ) ) ( IS-CRATE ?auto_45772 ) ( not ( = ?auto_45770 ?auto_45787 ) ) ( not ( = ?auto_45771 ?auto_45787 ) ) ( not ( = ?auto_45777 ?auto_45787 ) ) ( not ( = ?auto_45772 ?auto_45787 ) ) ( not ( = ?auto_45785 ?auto_45787 ) ) ( AVAILABLE ?auto_45783 ) ( SURFACE-AT ?auto_45772 ?auto_45774 ) ( ON ?auto_45772 ?auto_45784 ) ( CLEAR ?auto_45772 ) ( not ( = ?auto_45770 ?auto_45784 ) ) ( not ( = ?auto_45771 ?auto_45784 ) ) ( not ( = ?auto_45777 ?auto_45784 ) ) ( not ( = ?auto_45772 ?auto_45784 ) ) ( not ( = ?auto_45785 ?auto_45784 ) ) ( not ( = ?auto_45787 ?auto_45784 ) ) ( IS-CRATE ?auto_45787 ) ( not ( = ?auto_45770 ?auto_45795 ) ) ( not ( = ?auto_45771 ?auto_45795 ) ) ( not ( = ?auto_45777 ?auto_45795 ) ) ( not ( = ?auto_45772 ?auto_45795 ) ) ( not ( = ?auto_45785 ?auto_45795 ) ) ( not ( = ?auto_45787 ?auto_45795 ) ) ( not ( = ?auto_45784 ?auto_45795 ) ) ( not ( = ?auto_45793 ?auto_45792 ) ) ( not ( = ?auto_45789 ?auto_45793 ) ) ( not ( = ?auto_45774 ?auto_45793 ) ) ( HOIST-AT ?auto_45775 ?auto_45793 ) ( not ( = ?auto_45790 ?auto_45775 ) ) ( not ( = ?auto_45778 ?auto_45775 ) ) ( not ( = ?auto_45783 ?auto_45775 ) ) ( AVAILABLE ?auto_45775 ) ( SURFACE-AT ?auto_45787 ?auto_45793 ) ( ON ?auto_45787 ?auto_45781 ) ( CLEAR ?auto_45787 ) ( not ( = ?auto_45770 ?auto_45781 ) ) ( not ( = ?auto_45771 ?auto_45781 ) ) ( not ( = ?auto_45777 ?auto_45781 ) ) ( not ( = ?auto_45772 ?auto_45781 ) ) ( not ( = ?auto_45785 ?auto_45781 ) ) ( not ( = ?auto_45787 ?auto_45781 ) ) ( not ( = ?auto_45784 ?auto_45781 ) ) ( not ( = ?auto_45795 ?auto_45781 ) ) ( IS-CRATE ?auto_45795 ) ( not ( = ?auto_45770 ?auto_45791 ) ) ( not ( = ?auto_45771 ?auto_45791 ) ) ( not ( = ?auto_45777 ?auto_45791 ) ) ( not ( = ?auto_45772 ?auto_45791 ) ) ( not ( = ?auto_45785 ?auto_45791 ) ) ( not ( = ?auto_45787 ?auto_45791 ) ) ( not ( = ?auto_45784 ?auto_45791 ) ) ( not ( = ?auto_45795 ?auto_45791 ) ) ( not ( = ?auto_45781 ?auto_45791 ) ) ( SURFACE-AT ?auto_45795 ?auto_45789 ) ( ON ?auto_45795 ?auto_45794 ) ( CLEAR ?auto_45795 ) ( not ( = ?auto_45770 ?auto_45794 ) ) ( not ( = ?auto_45771 ?auto_45794 ) ) ( not ( = ?auto_45777 ?auto_45794 ) ) ( not ( = ?auto_45772 ?auto_45794 ) ) ( not ( = ?auto_45785 ?auto_45794 ) ) ( not ( = ?auto_45787 ?auto_45794 ) ) ( not ( = ?auto_45784 ?auto_45794 ) ) ( not ( = ?auto_45795 ?auto_45794 ) ) ( not ( = ?auto_45781 ?auto_45794 ) ) ( not ( = ?auto_45791 ?auto_45794 ) ) ( IS-CRATE ?auto_45791 ) ( not ( = ?auto_45770 ?auto_45776 ) ) ( not ( = ?auto_45771 ?auto_45776 ) ) ( not ( = ?auto_45777 ?auto_45776 ) ) ( not ( = ?auto_45772 ?auto_45776 ) ) ( not ( = ?auto_45785 ?auto_45776 ) ) ( not ( = ?auto_45787 ?auto_45776 ) ) ( not ( = ?auto_45784 ?auto_45776 ) ) ( not ( = ?auto_45795 ?auto_45776 ) ) ( not ( = ?auto_45781 ?auto_45776 ) ) ( not ( = ?auto_45791 ?auto_45776 ) ) ( not ( = ?auto_45794 ?auto_45776 ) ) ( not ( = ?auto_45796 ?auto_45792 ) ) ( not ( = ?auto_45789 ?auto_45796 ) ) ( not ( = ?auto_45774 ?auto_45796 ) ) ( not ( = ?auto_45793 ?auto_45796 ) ) ( HOIST-AT ?auto_45780 ?auto_45796 ) ( not ( = ?auto_45790 ?auto_45780 ) ) ( not ( = ?auto_45778 ?auto_45780 ) ) ( not ( = ?auto_45783 ?auto_45780 ) ) ( not ( = ?auto_45775 ?auto_45780 ) ) ( SURFACE-AT ?auto_45791 ?auto_45796 ) ( ON ?auto_45791 ?auto_45773 ) ( CLEAR ?auto_45791 ) ( not ( = ?auto_45770 ?auto_45773 ) ) ( not ( = ?auto_45771 ?auto_45773 ) ) ( not ( = ?auto_45777 ?auto_45773 ) ) ( not ( = ?auto_45772 ?auto_45773 ) ) ( not ( = ?auto_45785 ?auto_45773 ) ) ( not ( = ?auto_45787 ?auto_45773 ) ) ( not ( = ?auto_45784 ?auto_45773 ) ) ( not ( = ?auto_45795 ?auto_45773 ) ) ( not ( = ?auto_45781 ?auto_45773 ) ) ( not ( = ?auto_45791 ?auto_45773 ) ) ( not ( = ?auto_45794 ?auto_45773 ) ) ( not ( = ?auto_45776 ?auto_45773 ) ) ( IS-CRATE ?auto_45776 ) ( not ( = ?auto_45770 ?auto_45786 ) ) ( not ( = ?auto_45771 ?auto_45786 ) ) ( not ( = ?auto_45777 ?auto_45786 ) ) ( not ( = ?auto_45772 ?auto_45786 ) ) ( not ( = ?auto_45785 ?auto_45786 ) ) ( not ( = ?auto_45787 ?auto_45786 ) ) ( not ( = ?auto_45784 ?auto_45786 ) ) ( not ( = ?auto_45795 ?auto_45786 ) ) ( not ( = ?auto_45781 ?auto_45786 ) ) ( not ( = ?auto_45791 ?auto_45786 ) ) ( not ( = ?auto_45794 ?auto_45786 ) ) ( not ( = ?auto_45776 ?auto_45786 ) ) ( not ( = ?auto_45773 ?auto_45786 ) ) ( AVAILABLE ?auto_45780 ) ( SURFACE-AT ?auto_45776 ?auto_45796 ) ( ON ?auto_45776 ?auto_45782 ) ( CLEAR ?auto_45776 ) ( not ( = ?auto_45770 ?auto_45782 ) ) ( not ( = ?auto_45771 ?auto_45782 ) ) ( not ( = ?auto_45777 ?auto_45782 ) ) ( not ( = ?auto_45772 ?auto_45782 ) ) ( not ( = ?auto_45785 ?auto_45782 ) ) ( not ( = ?auto_45787 ?auto_45782 ) ) ( not ( = ?auto_45784 ?auto_45782 ) ) ( not ( = ?auto_45795 ?auto_45782 ) ) ( not ( = ?auto_45781 ?auto_45782 ) ) ( not ( = ?auto_45791 ?auto_45782 ) ) ( not ( = ?auto_45794 ?auto_45782 ) ) ( not ( = ?auto_45776 ?auto_45782 ) ) ( not ( = ?auto_45773 ?auto_45782 ) ) ( not ( = ?auto_45786 ?auto_45782 ) ) ( SURFACE-AT ?auto_45779 ?auto_45792 ) ( CLEAR ?auto_45779 ) ( IS-CRATE ?auto_45786 ) ( not ( = ?auto_45770 ?auto_45779 ) ) ( not ( = ?auto_45771 ?auto_45779 ) ) ( not ( = ?auto_45777 ?auto_45779 ) ) ( not ( = ?auto_45772 ?auto_45779 ) ) ( not ( = ?auto_45785 ?auto_45779 ) ) ( not ( = ?auto_45787 ?auto_45779 ) ) ( not ( = ?auto_45784 ?auto_45779 ) ) ( not ( = ?auto_45795 ?auto_45779 ) ) ( not ( = ?auto_45781 ?auto_45779 ) ) ( not ( = ?auto_45791 ?auto_45779 ) ) ( not ( = ?auto_45794 ?auto_45779 ) ) ( not ( = ?auto_45776 ?auto_45779 ) ) ( not ( = ?auto_45773 ?auto_45779 ) ) ( not ( = ?auto_45786 ?auto_45779 ) ) ( not ( = ?auto_45782 ?auto_45779 ) ) ( AVAILABLE ?auto_45790 ) ( TRUCK-AT ?auto_45788 ?auto_45789 ) ( LIFTING ?auto_45778 ?auto_45786 ) )
    :subtasks
    ( ( !LOAD ?auto_45778 ?auto_45786 ?auto_45788 ?auto_45789 )
      ( MAKE-ON ?auto_45770 ?auto_45771 )
      ( MAKE-ON-VERIFY ?auto_45770 ?auto_45771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45797 - SURFACE
      ?auto_45798 - SURFACE
    )
    :vars
    (
      ?auto_45803 - HOIST
      ?auto_45810 - PLACE
      ?auto_45801 - PLACE
      ?auto_45805 - HOIST
      ?auto_45807 - SURFACE
      ?auto_45808 - SURFACE
      ?auto_45823 - PLACE
      ?auto_45817 - HOIST
      ?auto_45819 - SURFACE
      ?auto_45813 - SURFACE
      ?auto_45818 - SURFACE
      ?auto_45804 - SURFACE
      ?auto_45811 - PLACE
      ?auto_45822 - HOIST
      ?auto_45815 - SURFACE
      ?auto_45799 - SURFACE
      ?auto_45812 - SURFACE
      ?auto_45821 - SURFACE
      ?auto_45802 - PLACE
      ?auto_45814 - HOIST
      ?auto_45806 - SURFACE
      ?auto_45809 - SURFACE
      ?auto_45816 - SURFACE
      ?auto_45820 - SURFACE
      ?auto_45800 - TRUCK
      ?auto_45824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45803 ?auto_45810 ) ( IS-CRATE ?auto_45797 ) ( not ( = ?auto_45797 ?auto_45798 ) ) ( not ( = ?auto_45801 ?auto_45810 ) ) ( HOIST-AT ?auto_45805 ?auto_45801 ) ( not ( = ?auto_45803 ?auto_45805 ) ) ( SURFACE-AT ?auto_45797 ?auto_45801 ) ( ON ?auto_45797 ?auto_45807 ) ( CLEAR ?auto_45797 ) ( not ( = ?auto_45797 ?auto_45807 ) ) ( not ( = ?auto_45798 ?auto_45807 ) ) ( IS-CRATE ?auto_45798 ) ( not ( = ?auto_45797 ?auto_45808 ) ) ( not ( = ?auto_45798 ?auto_45808 ) ) ( not ( = ?auto_45807 ?auto_45808 ) ) ( not ( = ?auto_45823 ?auto_45810 ) ) ( not ( = ?auto_45801 ?auto_45823 ) ) ( HOIST-AT ?auto_45817 ?auto_45823 ) ( not ( = ?auto_45803 ?auto_45817 ) ) ( not ( = ?auto_45805 ?auto_45817 ) ) ( SURFACE-AT ?auto_45798 ?auto_45823 ) ( ON ?auto_45798 ?auto_45819 ) ( CLEAR ?auto_45798 ) ( not ( = ?auto_45797 ?auto_45819 ) ) ( not ( = ?auto_45798 ?auto_45819 ) ) ( not ( = ?auto_45807 ?auto_45819 ) ) ( not ( = ?auto_45808 ?auto_45819 ) ) ( IS-CRATE ?auto_45808 ) ( not ( = ?auto_45797 ?auto_45813 ) ) ( not ( = ?auto_45798 ?auto_45813 ) ) ( not ( = ?auto_45807 ?auto_45813 ) ) ( not ( = ?auto_45808 ?auto_45813 ) ) ( not ( = ?auto_45819 ?auto_45813 ) ) ( AVAILABLE ?auto_45817 ) ( SURFACE-AT ?auto_45808 ?auto_45823 ) ( ON ?auto_45808 ?auto_45818 ) ( CLEAR ?auto_45808 ) ( not ( = ?auto_45797 ?auto_45818 ) ) ( not ( = ?auto_45798 ?auto_45818 ) ) ( not ( = ?auto_45807 ?auto_45818 ) ) ( not ( = ?auto_45808 ?auto_45818 ) ) ( not ( = ?auto_45819 ?auto_45818 ) ) ( not ( = ?auto_45813 ?auto_45818 ) ) ( IS-CRATE ?auto_45813 ) ( not ( = ?auto_45797 ?auto_45804 ) ) ( not ( = ?auto_45798 ?auto_45804 ) ) ( not ( = ?auto_45807 ?auto_45804 ) ) ( not ( = ?auto_45808 ?auto_45804 ) ) ( not ( = ?auto_45819 ?auto_45804 ) ) ( not ( = ?auto_45813 ?auto_45804 ) ) ( not ( = ?auto_45818 ?auto_45804 ) ) ( not ( = ?auto_45811 ?auto_45810 ) ) ( not ( = ?auto_45801 ?auto_45811 ) ) ( not ( = ?auto_45823 ?auto_45811 ) ) ( HOIST-AT ?auto_45822 ?auto_45811 ) ( not ( = ?auto_45803 ?auto_45822 ) ) ( not ( = ?auto_45805 ?auto_45822 ) ) ( not ( = ?auto_45817 ?auto_45822 ) ) ( AVAILABLE ?auto_45822 ) ( SURFACE-AT ?auto_45813 ?auto_45811 ) ( ON ?auto_45813 ?auto_45815 ) ( CLEAR ?auto_45813 ) ( not ( = ?auto_45797 ?auto_45815 ) ) ( not ( = ?auto_45798 ?auto_45815 ) ) ( not ( = ?auto_45807 ?auto_45815 ) ) ( not ( = ?auto_45808 ?auto_45815 ) ) ( not ( = ?auto_45819 ?auto_45815 ) ) ( not ( = ?auto_45813 ?auto_45815 ) ) ( not ( = ?auto_45818 ?auto_45815 ) ) ( not ( = ?auto_45804 ?auto_45815 ) ) ( IS-CRATE ?auto_45804 ) ( not ( = ?auto_45797 ?auto_45799 ) ) ( not ( = ?auto_45798 ?auto_45799 ) ) ( not ( = ?auto_45807 ?auto_45799 ) ) ( not ( = ?auto_45808 ?auto_45799 ) ) ( not ( = ?auto_45819 ?auto_45799 ) ) ( not ( = ?auto_45813 ?auto_45799 ) ) ( not ( = ?auto_45818 ?auto_45799 ) ) ( not ( = ?auto_45804 ?auto_45799 ) ) ( not ( = ?auto_45815 ?auto_45799 ) ) ( SURFACE-AT ?auto_45804 ?auto_45801 ) ( ON ?auto_45804 ?auto_45812 ) ( CLEAR ?auto_45804 ) ( not ( = ?auto_45797 ?auto_45812 ) ) ( not ( = ?auto_45798 ?auto_45812 ) ) ( not ( = ?auto_45807 ?auto_45812 ) ) ( not ( = ?auto_45808 ?auto_45812 ) ) ( not ( = ?auto_45819 ?auto_45812 ) ) ( not ( = ?auto_45813 ?auto_45812 ) ) ( not ( = ?auto_45818 ?auto_45812 ) ) ( not ( = ?auto_45804 ?auto_45812 ) ) ( not ( = ?auto_45815 ?auto_45812 ) ) ( not ( = ?auto_45799 ?auto_45812 ) ) ( IS-CRATE ?auto_45799 ) ( not ( = ?auto_45797 ?auto_45821 ) ) ( not ( = ?auto_45798 ?auto_45821 ) ) ( not ( = ?auto_45807 ?auto_45821 ) ) ( not ( = ?auto_45808 ?auto_45821 ) ) ( not ( = ?auto_45819 ?auto_45821 ) ) ( not ( = ?auto_45813 ?auto_45821 ) ) ( not ( = ?auto_45818 ?auto_45821 ) ) ( not ( = ?auto_45804 ?auto_45821 ) ) ( not ( = ?auto_45815 ?auto_45821 ) ) ( not ( = ?auto_45799 ?auto_45821 ) ) ( not ( = ?auto_45812 ?auto_45821 ) ) ( not ( = ?auto_45802 ?auto_45810 ) ) ( not ( = ?auto_45801 ?auto_45802 ) ) ( not ( = ?auto_45823 ?auto_45802 ) ) ( not ( = ?auto_45811 ?auto_45802 ) ) ( HOIST-AT ?auto_45814 ?auto_45802 ) ( not ( = ?auto_45803 ?auto_45814 ) ) ( not ( = ?auto_45805 ?auto_45814 ) ) ( not ( = ?auto_45817 ?auto_45814 ) ) ( not ( = ?auto_45822 ?auto_45814 ) ) ( SURFACE-AT ?auto_45799 ?auto_45802 ) ( ON ?auto_45799 ?auto_45806 ) ( CLEAR ?auto_45799 ) ( not ( = ?auto_45797 ?auto_45806 ) ) ( not ( = ?auto_45798 ?auto_45806 ) ) ( not ( = ?auto_45807 ?auto_45806 ) ) ( not ( = ?auto_45808 ?auto_45806 ) ) ( not ( = ?auto_45819 ?auto_45806 ) ) ( not ( = ?auto_45813 ?auto_45806 ) ) ( not ( = ?auto_45818 ?auto_45806 ) ) ( not ( = ?auto_45804 ?auto_45806 ) ) ( not ( = ?auto_45815 ?auto_45806 ) ) ( not ( = ?auto_45799 ?auto_45806 ) ) ( not ( = ?auto_45812 ?auto_45806 ) ) ( not ( = ?auto_45821 ?auto_45806 ) ) ( IS-CRATE ?auto_45821 ) ( not ( = ?auto_45797 ?auto_45809 ) ) ( not ( = ?auto_45798 ?auto_45809 ) ) ( not ( = ?auto_45807 ?auto_45809 ) ) ( not ( = ?auto_45808 ?auto_45809 ) ) ( not ( = ?auto_45819 ?auto_45809 ) ) ( not ( = ?auto_45813 ?auto_45809 ) ) ( not ( = ?auto_45818 ?auto_45809 ) ) ( not ( = ?auto_45804 ?auto_45809 ) ) ( not ( = ?auto_45815 ?auto_45809 ) ) ( not ( = ?auto_45799 ?auto_45809 ) ) ( not ( = ?auto_45812 ?auto_45809 ) ) ( not ( = ?auto_45821 ?auto_45809 ) ) ( not ( = ?auto_45806 ?auto_45809 ) ) ( AVAILABLE ?auto_45814 ) ( SURFACE-AT ?auto_45821 ?auto_45802 ) ( ON ?auto_45821 ?auto_45816 ) ( CLEAR ?auto_45821 ) ( not ( = ?auto_45797 ?auto_45816 ) ) ( not ( = ?auto_45798 ?auto_45816 ) ) ( not ( = ?auto_45807 ?auto_45816 ) ) ( not ( = ?auto_45808 ?auto_45816 ) ) ( not ( = ?auto_45819 ?auto_45816 ) ) ( not ( = ?auto_45813 ?auto_45816 ) ) ( not ( = ?auto_45818 ?auto_45816 ) ) ( not ( = ?auto_45804 ?auto_45816 ) ) ( not ( = ?auto_45815 ?auto_45816 ) ) ( not ( = ?auto_45799 ?auto_45816 ) ) ( not ( = ?auto_45812 ?auto_45816 ) ) ( not ( = ?auto_45821 ?auto_45816 ) ) ( not ( = ?auto_45806 ?auto_45816 ) ) ( not ( = ?auto_45809 ?auto_45816 ) ) ( SURFACE-AT ?auto_45820 ?auto_45810 ) ( CLEAR ?auto_45820 ) ( IS-CRATE ?auto_45809 ) ( not ( = ?auto_45797 ?auto_45820 ) ) ( not ( = ?auto_45798 ?auto_45820 ) ) ( not ( = ?auto_45807 ?auto_45820 ) ) ( not ( = ?auto_45808 ?auto_45820 ) ) ( not ( = ?auto_45819 ?auto_45820 ) ) ( not ( = ?auto_45813 ?auto_45820 ) ) ( not ( = ?auto_45818 ?auto_45820 ) ) ( not ( = ?auto_45804 ?auto_45820 ) ) ( not ( = ?auto_45815 ?auto_45820 ) ) ( not ( = ?auto_45799 ?auto_45820 ) ) ( not ( = ?auto_45812 ?auto_45820 ) ) ( not ( = ?auto_45821 ?auto_45820 ) ) ( not ( = ?auto_45806 ?auto_45820 ) ) ( not ( = ?auto_45809 ?auto_45820 ) ) ( not ( = ?auto_45816 ?auto_45820 ) ) ( AVAILABLE ?auto_45803 ) ( TRUCK-AT ?auto_45800 ?auto_45801 ) ( AVAILABLE ?auto_45805 ) ( SURFACE-AT ?auto_45809 ?auto_45801 ) ( ON ?auto_45809 ?auto_45824 ) ( CLEAR ?auto_45809 ) ( not ( = ?auto_45797 ?auto_45824 ) ) ( not ( = ?auto_45798 ?auto_45824 ) ) ( not ( = ?auto_45807 ?auto_45824 ) ) ( not ( = ?auto_45808 ?auto_45824 ) ) ( not ( = ?auto_45819 ?auto_45824 ) ) ( not ( = ?auto_45813 ?auto_45824 ) ) ( not ( = ?auto_45818 ?auto_45824 ) ) ( not ( = ?auto_45804 ?auto_45824 ) ) ( not ( = ?auto_45815 ?auto_45824 ) ) ( not ( = ?auto_45799 ?auto_45824 ) ) ( not ( = ?auto_45812 ?auto_45824 ) ) ( not ( = ?auto_45821 ?auto_45824 ) ) ( not ( = ?auto_45806 ?auto_45824 ) ) ( not ( = ?auto_45809 ?auto_45824 ) ) ( not ( = ?auto_45816 ?auto_45824 ) ) ( not ( = ?auto_45820 ?auto_45824 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45805 ?auto_45809 ?auto_45824 ?auto_45801 )
      ( MAKE-ON ?auto_45797 ?auto_45798 )
      ( MAKE-ON-VERIFY ?auto_45797 ?auto_45798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45825 - SURFACE
      ?auto_45826 - SURFACE
    )
    :vars
    (
      ?auto_45834 - HOIST
      ?auto_45833 - PLACE
      ?auto_45852 - PLACE
      ?auto_45838 - HOIST
      ?auto_45830 - SURFACE
      ?auto_45831 - SURFACE
      ?auto_45840 - PLACE
      ?auto_45844 - HOIST
      ?auto_45846 - SURFACE
      ?auto_45837 - SURFACE
      ?auto_45845 - SURFACE
      ?auto_45829 - SURFACE
      ?auto_45836 - PLACE
      ?auto_45841 - HOIST
      ?auto_45842 - SURFACE
      ?auto_45850 - SURFACE
      ?auto_45827 - SURFACE
      ?auto_45848 - SURFACE
      ?auto_45832 - PLACE
      ?auto_45849 - HOIST
      ?auto_45835 - SURFACE
      ?auto_45828 - SURFACE
      ?auto_45843 - SURFACE
      ?auto_45847 - SURFACE
      ?auto_45839 - SURFACE
      ?auto_45851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45834 ?auto_45833 ) ( IS-CRATE ?auto_45825 ) ( not ( = ?auto_45825 ?auto_45826 ) ) ( not ( = ?auto_45852 ?auto_45833 ) ) ( HOIST-AT ?auto_45838 ?auto_45852 ) ( not ( = ?auto_45834 ?auto_45838 ) ) ( SURFACE-AT ?auto_45825 ?auto_45852 ) ( ON ?auto_45825 ?auto_45830 ) ( CLEAR ?auto_45825 ) ( not ( = ?auto_45825 ?auto_45830 ) ) ( not ( = ?auto_45826 ?auto_45830 ) ) ( IS-CRATE ?auto_45826 ) ( not ( = ?auto_45825 ?auto_45831 ) ) ( not ( = ?auto_45826 ?auto_45831 ) ) ( not ( = ?auto_45830 ?auto_45831 ) ) ( not ( = ?auto_45840 ?auto_45833 ) ) ( not ( = ?auto_45852 ?auto_45840 ) ) ( HOIST-AT ?auto_45844 ?auto_45840 ) ( not ( = ?auto_45834 ?auto_45844 ) ) ( not ( = ?auto_45838 ?auto_45844 ) ) ( SURFACE-AT ?auto_45826 ?auto_45840 ) ( ON ?auto_45826 ?auto_45846 ) ( CLEAR ?auto_45826 ) ( not ( = ?auto_45825 ?auto_45846 ) ) ( not ( = ?auto_45826 ?auto_45846 ) ) ( not ( = ?auto_45830 ?auto_45846 ) ) ( not ( = ?auto_45831 ?auto_45846 ) ) ( IS-CRATE ?auto_45831 ) ( not ( = ?auto_45825 ?auto_45837 ) ) ( not ( = ?auto_45826 ?auto_45837 ) ) ( not ( = ?auto_45830 ?auto_45837 ) ) ( not ( = ?auto_45831 ?auto_45837 ) ) ( not ( = ?auto_45846 ?auto_45837 ) ) ( AVAILABLE ?auto_45844 ) ( SURFACE-AT ?auto_45831 ?auto_45840 ) ( ON ?auto_45831 ?auto_45845 ) ( CLEAR ?auto_45831 ) ( not ( = ?auto_45825 ?auto_45845 ) ) ( not ( = ?auto_45826 ?auto_45845 ) ) ( not ( = ?auto_45830 ?auto_45845 ) ) ( not ( = ?auto_45831 ?auto_45845 ) ) ( not ( = ?auto_45846 ?auto_45845 ) ) ( not ( = ?auto_45837 ?auto_45845 ) ) ( IS-CRATE ?auto_45837 ) ( not ( = ?auto_45825 ?auto_45829 ) ) ( not ( = ?auto_45826 ?auto_45829 ) ) ( not ( = ?auto_45830 ?auto_45829 ) ) ( not ( = ?auto_45831 ?auto_45829 ) ) ( not ( = ?auto_45846 ?auto_45829 ) ) ( not ( = ?auto_45837 ?auto_45829 ) ) ( not ( = ?auto_45845 ?auto_45829 ) ) ( not ( = ?auto_45836 ?auto_45833 ) ) ( not ( = ?auto_45852 ?auto_45836 ) ) ( not ( = ?auto_45840 ?auto_45836 ) ) ( HOIST-AT ?auto_45841 ?auto_45836 ) ( not ( = ?auto_45834 ?auto_45841 ) ) ( not ( = ?auto_45838 ?auto_45841 ) ) ( not ( = ?auto_45844 ?auto_45841 ) ) ( AVAILABLE ?auto_45841 ) ( SURFACE-AT ?auto_45837 ?auto_45836 ) ( ON ?auto_45837 ?auto_45842 ) ( CLEAR ?auto_45837 ) ( not ( = ?auto_45825 ?auto_45842 ) ) ( not ( = ?auto_45826 ?auto_45842 ) ) ( not ( = ?auto_45830 ?auto_45842 ) ) ( not ( = ?auto_45831 ?auto_45842 ) ) ( not ( = ?auto_45846 ?auto_45842 ) ) ( not ( = ?auto_45837 ?auto_45842 ) ) ( not ( = ?auto_45845 ?auto_45842 ) ) ( not ( = ?auto_45829 ?auto_45842 ) ) ( IS-CRATE ?auto_45829 ) ( not ( = ?auto_45825 ?auto_45850 ) ) ( not ( = ?auto_45826 ?auto_45850 ) ) ( not ( = ?auto_45830 ?auto_45850 ) ) ( not ( = ?auto_45831 ?auto_45850 ) ) ( not ( = ?auto_45846 ?auto_45850 ) ) ( not ( = ?auto_45837 ?auto_45850 ) ) ( not ( = ?auto_45845 ?auto_45850 ) ) ( not ( = ?auto_45829 ?auto_45850 ) ) ( not ( = ?auto_45842 ?auto_45850 ) ) ( SURFACE-AT ?auto_45829 ?auto_45852 ) ( ON ?auto_45829 ?auto_45827 ) ( CLEAR ?auto_45829 ) ( not ( = ?auto_45825 ?auto_45827 ) ) ( not ( = ?auto_45826 ?auto_45827 ) ) ( not ( = ?auto_45830 ?auto_45827 ) ) ( not ( = ?auto_45831 ?auto_45827 ) ) ( not ( = ?auto_45846 ?auto_45827 ) ) ( not ( = ?auto_45837 ?auto_45827 ) ) ( not ( = ?auto_45845 ?auto_45827 ) ) ( not ( = ?auto_45829 ?auto_45827 ) ) ( not ( = ?auto_45842 ?auto_45827 ) ) ( not ( = ?auto_45850 ?auto_45827 ) ) ( IS-CRATE ?auto_45850 ) ( not ( = ?auto_45825 ?auto_45848 ) ) ( not ( = ?auto_45826 ?auto_45848 ) ) ( not ( = ?auto_45830 ?auto_45848 ) ) ( not ( = ?auto_45831 ?auto_45848 ) ) ( not ( = ?auto_45846 ?auto_45848 ) ) ( not ( = ?auto_45837 ?auto_45848 ) ) ( not ( = ?auto_45845 ?auto_45848 ) ) ( not ( = ?auto_45829 ?auto_45848 ) ) ( not ( = ?auto_45842 ?auto_45848 ) ) ( not ( = ?auto_45850 ?auto_45848 ) ) ( not ( = ?auto_45827 ?auto_45848 ) ) ( not ( = ?auto_45832 ?auto_45833 ) ) ( not ( = ?auto_45852 ?auto_45832 ) ) ( not ( = ?auto_45840 ?auto_45832 ) ) ( not ( = ?auto_45836 ?auto_45832 ) ) ( HOIST-AT ?auto_45849 ?auto_45832 ) ( not ( = ?auto_45834 ?auto_45849 ) ) ( not ( = ?auto_45838 ?auto_45849 ) ) ( not ( = ?auto_45844 ?auto_45849 ) ) ( not ( = ?auto_45841 ?auto_45849 ) ) ( SURFACE-AT ?auto_45850 ?auto_45832 ) ( ON ?auto_45850 ?auto_45835 ) ( CLEAR ?auto_45850 ) ( not ( = ?auto_45825 ?auto_45835 ) ) ( not ( = ?auto_45826 ?auto_45835 ) ) ( not ( = ?auto_45830 ?auto_45835 ) ) ( not ( = ?auto_45831 ?auto_45835 ) ) ( not ( = ?auto_45846 ?auto_45835 ) ) ( not ( = ?auto_45837 ?auto_45835 ) ) ( not ( = ?auto_45845 ?auto_45835 ) ) ( not ( = ?auto_45829 ?auto_45835 ) ) ( not ( = ?auto_45842 ?auto_45835 ) ) ( not ( = ?auto_45850 ?auto_45835 ) ) ( not ( = ?auto_45827 ?auto_45835 ) ) ( not ( = ?auto_45848 ?auto_45835 ) ) ( IS-CRATE ?auto_45848 ) ( not ( = ?auto_45825 ?auto_45828 ) ) ( not ( = ?auto_45826 ?auto_45828 ) ) ( not ( = ?auto_45830 ?auto_45828 ) ) ( not ( = ?auto_45831 ?auto_45828 ) ) ( not ( = ?auto_45846 ?auto_45828 ) ) ( not ( = ?auto_45837 ?auto_45828 ) ) ( not ( = ?auto_45845 ?auto_45828 ) ) ( not ( = ?auto_45829 ?auto_45828 ) ) ( not ( = ?auto_45842 ?auto_45828 ) ) ( not ( = ?auto_45850 ?auto_45828 ) ) ( not ( = ?auto_45827 ?auto_45828 ) ) ( not ( = ?auto_45848 ?auto_45828 ) ) ( not ( = ?auto_45835 ?auto_45828 ) ) ( AVAILABLE ?auto_45849 ) ( SURFACE-AT ?auto_45848 ?auto_45832 ) ( ON ?auto_45848 ?auto_45843 ) ( CLEAR ?auto_45848 ) ( not ( = ?auto_45825 ?auto_45843 ) ) ( not ( = ?auto_45826 ?auto_45843 ) ) ( not ( = ?auto_45830 ?auto_45843 ) ) ( not ( = ?auto_45831 ?auto_45843 ) ) ( not ( = ?auto_45846 ?auto_45843 ) ) ( not ( = ?auto_45837 ?auto_45843 ) ) ( not ( = ?auto_45845 ?auto_45843 ) ) ( not ( = ?auto_45829 ?auto_45843 ) ) ( not ( = ?auto_45842 ?auto_45843 ) ) ( not ( = ?auto_45850 ?auto_45843 ) ) ( not ( = ?auto_45827 ?auto_45843 ) ) ( not ( = ?auto_45848 ?auto_45843 ) ) ( not ( = ?auto_45835 ?auto_45843 ) ) ( not ( = ?auto_45828 ?auto_45843 ) ) ( SURFACE-AT ?auto_45847 ?auto_45833 ) ( CLEAR ?auto_45847 ) ( IS-CRATE ?auto_45828 ) ( not ( = ?auto_45825 ?auto_45847 ) ) ( not ( = ?auto_45826 ?auto_45847 ) ) ( not ( = ?auto_45830 ?auto_45847 ) ) ( not ( = ?auto_45831 ?auto_45847 ) ) ( not ( = ?auto_45846 ?auto_45847 ) ) ( not ( = ?auto_45837 ?auto_45847 ) ) ( not ( = ?auto_45845 ?auto_45847 ) ) ( not ( = ?auto_45829 ?auto_45847 ) ) ( not ( = ?auto_45842 ?auto_45847 ) ) ( not ( = ?auto_45850 ?auto_45847 ) ) ( not ( = ?auto_45827 ?auto_45847 ) ) ( not ( = ?auto_45848 ?auto_45847 ) ) ( not ( = ?auto_45835 ?auto_45847 ) ) ( not ( = ?auto_45828 ?auto_45847 ) ) ( not ( = ?auto_45843 ?auto_45847 ) ) ( AVAILABLE ?auto_45834 ) ( AVAILABLE ?auto_45838 ) ( SURFACE-AT ?auto_45828 ?auto_45852 ) ( ON ?auto_45828 ?auto_45839 ) ( CLEAR ?auto_45828 ) ( not ( = ?auto_45825 ?auto_45839 ) ) ( not ( = ?auto_45826 ?auto_45839 ) ) ( not ( = ?auto_45830 ?auto_45839 ) ) ( not ( = ?auto_45831 ?auto_45839 ) ) ( not ( = ?auto_45846 ?auto_45839 ) ) ( not ( = ?auto_45837 ?auto_45839 ) ) ( not ( = ?auto_45845 ?auto_45839 ) ) ( not ( = ?auto_45829 ?auto_45839 ) ) ( not ( = ?auto_45842 ?auto_45839 ) ) ( not ( = ?auto_45850 ?auto_45839 ) ) ( not ( = ?auto_45827 ?auto_45839 ) ) ( not ( = ?auto_45848 ?auto_45839 ) ) ( not ( = ?auto_45835 ?auto_45839 ) ) ( not ( = ?auto_45828 ?auto_45839 ) ) ( not ( = ?auto_45843 ?auto_45839 ) ) ( not ( = ?auto_45847 ?auto_45839 ) ) ( TRUCK-AT ?auto_45851 ?auto_45833 ) )
    :subtasks
    ( ( !DRIVE ?auto_45851 ?auto_45833 ?auto_45852 )
      ( MAKE-ON ?auto_45825 ?auto_45826 )
      ( MAKE-ON-VERIFY ?auto_45825 ?auto_45826 ) )
  )

)

