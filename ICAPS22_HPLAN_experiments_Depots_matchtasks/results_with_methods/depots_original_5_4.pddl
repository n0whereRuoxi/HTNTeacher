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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32789 - SURFACE
      ?auto_32790 - SURFACE
    )
    :vars
    (
      ?auto_32791 - HOIST
      ?auto_32792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32791 ?auto_32792 ) ( SURFACE-AT ?auto_32789 ?auto_32792 ) ( CLEAR ?auto_32789 ) ( LIFTING ?auto_32791 ?auto_32790 ) ( IS-CRATE ?auto_32790 ) ( not ( = ?auto_32789 ?auto_32790 ) ) )
    :subtasks
    ( ( !DROP ?auto_32791 ?auto_32790 ?auto_32789 ?auto_32792 )
      ( MAKE-1CRATE-VERIFY ?auto_32789 ?auto_32790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32793 - SURFACE
      ?auto_32794 - SURFACE
    )
    :vars
    (
      ?auto_32795 - HOIST
      ?auto_32796 - PLACE
      ?auto_32797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32795 ?auto_32796 ) ( SURFACE-AT ?auto_32793 ?auto_32796 ) ( CLEAR ?auto_32793 ) ( IS-CRATE ?auto_32794 ) ( not ( = ?auto_32793 ?auto_32794 ) ) ( TRUCK-AT ?auto_32797 ?auto_32796 ) ( AVAILABLE ?auto_32795 ) ( IN ?auto_32794 ?auto_32797 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32795 ?auto_32794 ?auto_32797 ?auto_32796 )
      ( MAKE-1CRATE ?auto_32793 ?auto_32794 )
      ( MAKE-1CRATE-VERIFY ?auto_32793 ?auto_32794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32798 - SURFACE
      ?auto_32799 - SURFACE
    )
    :vars
    (
      ?auto_32801 - HOIST
      ?auto_32800 - PLACE
      ?auto_32802 - TRUCK
      ?auto_32803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32801 ?auto_32800 ) ( SURFACE-AT ?auto_32798 ?auto_32800 ) ( CLEAR ?auto_32798 ) ( IS-CRATE ?auto_32799 ) ( not ( = ?auto_32798 ?auto_32799 ) ) ( AVAILABLE ?auto_32801 ) ( IN ?auto_32799 ?auto_32802 ) ( TRUCK-AT ?auto_32802 ?auto_32803 ) ( not ( = ?auto_32803 ?auto_32800 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32802 ?auto_32803 ?auto_32800 )
      ( MAKE-1CRATE ?auto_32798 ?auto_32799 )
      ( MAKE-1CRATE-VERIFY ?auto_32798 ?auto_32799 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32804 - SURFACE
      ?auto_32805 - SURFACE
    )
    :vars
    (
      ?auto_32806 - HOIST
      ?auto_32809 - PLACE
      ?auto_32807 - TRUCK
      ?auto_32808 - PLACE
      ?auto_32810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32806 ?auto_32809 ) ( SURFACE-AT ?auto_32804 ?auto_32809 ) ( CLEAR ?auto_32804 ) ( IS-CRATE ?auto_32805 ) ( not ( = ?auto_32804 ?auto_32805 ) ) ( AVAILABLE ?auto_32806 ) ( TRUCK-AT ?auto_32807 ?auto_32808 ) ( not ( = ?auto_32808 ?auto_32809 ) ) ( HOIST-AT ?auto_32810 ?auto_32808 ) ( LIFTING ?auto_32810 ?auto_32805 ) ( not ( = ?auto_32806 ?auto_32810 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32810 ?auto_32805 ?auto_32807 ?auto_32808 )
      ( MAKE-1CRATE ?auto_32804 ?auto_32805 )
      ( MAKE-1CRATE-VERIFY ?auto_32804 ?auto_32805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32811 - SURFACE
      ?auto_32812 - SURFACE
    )
    :vars
    (
      ?auto_32817 - HOIST
      ?auto_32816 - PLACE
      ?auto_32814 - TRUCK
      ?auto_32815 - PLACE
      ?auto_32813 - HOIST
      ?auto_32818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32817 ?auto_32816 ) ( SURFACE-AT ?auto_32811 ?auto_32816 ) ( CLEAR ?auto_32811 ) ( IS-CRATE ?auto_32812 ) ( not ( = ?auto_32811 ?auto_32812 ) ) ( AVAILABLE ?auto_32817 ) ( TRUCK-AT ?auto_32814 ?auto_32815 ) ( not ( = ?auto_32815 ?auto_32816 ) ) ( HOIST-AT ?auto_32813 ?auto_32815 ) ( not ( = ?auto_32817 ?auto_32813 ) ) ( AVAILABLE ?auto_32813 ) ( SURFACE-AT ?auto_32812 ?auto_32815 ) ( ON ?auto_32812 ?auto_32818 ) ( CLEAR ?auto_32812 ) ( not ( = ?auto_32811 ?auto_32818 ) ) ( not ( = ?auto_32812 ?auto_32818 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32813 ?auto_32812 ?auto_32818 ?auto_32815 )
      ( MAKE-1CRATE ?auto_32811 ?auto_32812 )
      ( MAKE-1CRATE-VERIFY ?auto_32811 ?auto_32812 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32819 - SURFACE
      ?auto_32820 - SURFACE
    )
    :vars
    (
      ?auto_32822 - HOIST
      ?auto_32821 - PLACE
      ?auto_32826 - PLACE
      ?auto_32823 - HOIST
      ?auto_32825 - SURFACE
      ?auto_32824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32822 ?auto_32821 ) ( SURFACE-AT ?auto_32819 ?auto_32821 ) ( CLEAR ?auto_32819 ) ( IS-CRATE ?auto_32820 ) ( not ( = ?auto_32819 ?auto_32820 ) ) ( AVAILABLE ?auto_32822 ) ( not ( = ?auto_32826 ?auto_32821 ) ) ( HOIST-AT ?auto_32823 ?auto_32826 ) ( not ( = ?auto_32822 ?auto_32823 ) ) ( AVAILABLE ?auto_32823 ) ( SURFACE-AT ?auto_32820 ?auto_32826 ) ( ON ?auto_32820 ?auto_32825 ) ( CLEAR ?auto_32820 ) ( not ( = ?auto_32819 ?auto_32825 ) ) ( not ( = ?auto_32820 ?auto_32825 ) ) ( TRUCK-AT ?auto_32824 ?auto_32821 ) )
    :subtasks
    ( ( !DRIVE ?auto_32824 ?auto_32821 ?auto_32826 )
      ( MAKE-1CRATE ?auto_32819 ?auto_32820 )
      ( MAKE-1CRATE-VERIFY ?auto_32819 ?auto_32820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32832 - SURFACE
      ?auto_32833 - SURFACE
    )
    :vars
    (
      ?auto_32834 - HOIST
      ?auto_32835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32834 ?auto_32835 ) ( SURFACE-AT ?auto_32832 ?auto_32835 ) ( CLEAR ?auto_32832 ) ( LIFTING ?auto_32834 ?auto_32833 ) ( IS-CRATE ?auto_32833 ) ( not ( = ?auto_32832 ?auto_32833 ) ) )
    :subtasks
    ( ( !DROP ?auto_32834 ?auto_32833 ?auto_32832 ?auto_32835 )
      ( MAKE-1CRATE-VERIFY ?auto_32832 ?auto_32833 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32836 - SURFACE
      ?auto_32837 - SURFACE
      ?auto_32838 - SURFACE
    )
    :vars
    (
      ?auto_32840 - HOIST
      ?auto_32839 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32840 ?auto_32839 ) ( SURFACE-AT ?auto_32837 ?auto_32839 ) ( CLEAR ?auto_32837 ) ( LIFTING ?auto_32840 ?auto_32838 ) ( IS-CRATE ?auto_32838 ) ( not ( = ?auto_32837 ?auto_32838 ) ) ( ON ?auto_32837 ?auto_32836 ) ( not ( = ?auto_32836 ?auto_32837 ) ) ( not ( = ?auto_32836 ?auto_32838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32837 ?auto_32838 )
      ( MAKE-2CRATE-VERIFY ?auto_32836 ?auto_32837 ?auto_32838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32841 - SURFACE
      ?auto_32842 - SURFACE
    )
    :vars
    (
      ?auto_32844 - HOIST
      ?auto_32843 - PLACE
      ?auto_32845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32844 ?auto_32843 ) ( SURFACE-AT ?auto_32841 ?auto_32843 ) ( CLEAR ?auto_32841 ) ( IS-CRATE ?auto_32842 ) ( not ( = ?auto_32841 ?auto_32842 ) ) ( TRUCK-AT ?auto_32845 ?auto_32843 ) ( AVAILABLE ?auto_32844 ) ( IN ?auto_32842 ?auto_32845 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32844 ?auto_32842 ?auto_32845 ?auto_32843 )
      ( MAKE-1CRATE ?auto_32841 ?auto_32842 )
      ( MAKE-1CRATE-VERIFY ?auto_32841 ?auto_32842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32846 - SURFACE
      ?auto_32847 - SURFACE
      ?auto_32848 - SURFACE
    )
    :vars
    (
      ?auto_32851 - HOIST
      ?auto_32849 - PLACE
      ?auto_32850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32851 ?auto_32849 ) ( SURFACE-AT ?auto_32847 ?auto_32849 ) ( CLEAR ?auto_32847 ) ( IS-CRATE ?auto_32848 ) ( not ( = ?auto_32847 ?auto_32848 ) ) ( TRUCK-AT ?auto_32850 ?auto_32849 ) ( AVAILABLE ?auto_32851 ) ( IN ?auto_32848 ?auto_32850 ) ( ON ?auto_32847 ?auto_32846 ) ( not ( = ?auto_32846 ?auto_32847 ) ) ( not ( = ?auto_32846 ?auto_32848 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32847 ?auto_32848 )
      ( MAKE-2CRATE-VERIFY ?auto_32846 ?auto_32847 ?auto_32848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32852 - SURFACE
      ?auto_32853 - SURFACE
    )
    :vars
    (
      ?auto_32857 - HOIST
      ?auto_32856 - PLACE
      ?auto_32855 - TRUCK
      ?auto_32854 - SURFACE
      ?auto_32858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32857 ?auto_32856 ) ( SURFACE-AT ?auto_32852 ?auto_32856 ) ( CLEAR ?auto_32852 ) ( IS-CRATE ?auto_32853 ) ( not ( = ?auto_32852 ?auto_32853 ) ) ( AVAILABLE ?auto_32857 ) ( IN ?auto_32853 ?auto_32855 ) ( ON ?auto_32852 ?auto_32854 ) ( not ( = ?auto_32854 ?auto_32852 ) ) ( not ( = ?auto_32854 ?auto_32853 ) ) ( TRUCK-AT ?auto_32855 ?auto_32858 ) ( not ( = ?auto_32858 ?auto_32856 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32855 ?auto_32858 ?auto_32856 )
      ( MAKE-2CRATE ?auto_32854 ?auto_32852 ?auto_32853 )
      ( MAKE-1CRATE-VERIFY ?auto_32852 ?auto_32853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32859 - SURFACE
      ?auto_32860 - SURFACE
      ?auto_32861 - SURFACE
    )
    :vars
    (
      ?auto_32863 - HOIST
      ?auto_32864 - PLACE
      ?auto_32862 - TRUCK
      ?auto_32865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32863 ?auto_32864 ) ( SURFACE-AT ?auto_32860 ?auto_32864 ) ( CLEAR ?auto_32860 ) ( IS-CRATE ?auto_32861 ) ( not ( = ?auto_32860 ?auto_32861 ) ) ( AVAILABLE ?auto_32863 ) ( IN ?auto_32861 ?auto_32862 ) ( ON ?auto_32860 ?auto_32859 ) ( not ( = ?auto_32859 ?auto_32860 ) ) ( not ( = ?auto_32859 ?auto_32861 ) ) ( TRUCK-AT ?auto_32862 ?auto_32865 ) ( not ( = ?auto_32865 ?auto_32864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32860 ?auto_32861 )
      ( MAKE-2CRATE-VERIFY ?auto_32859 ?auto_32860 ?auto_32861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32866 - SURFACE
      ?auto_32867 - SURFACE
    )
    :vars
    (
      ?auto_32872 - HOIST
      ?auto_32868 - PLACE
      ?auto_32871 - SURFACE
      ?auto_32870 - TRUCK
      ?auto_32869 - PLACE
      ?auto_32873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32872 ?auto_32868 ) ( SURFACE-AT ?auto_32866 ?auto_32868 ) ( CLEAR ?auto_32866 ) ( IS-CRATE ?auto_32867 ) ( not ( = ?auto_32866 ?auto_32867 ) ) ( AVAILABLE ?auto_32872 ) ( ON ?auto_32866 ?auto_32871 ) ( not ( = ?auto_32871 ?auto_32866 ) ) ( not ( = ?auto_32871 ?auto_32867 ) ) ( TRUCK-AT ?auto_32870 ?auto_32869 ) ( not ( = ?auto_32869 ?auto_32868 ) ) ( HOIST-AT ?auto_32873 ?auto_32869 ) ( LIFTING ?auto_32873 ?auto_32867 ) ( not ( = ?auto_32872 ?auto_32873 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32873 ?auto_32867 ?auto_32870 ?auto_32869 )
      ( MAKE-2CRATE ?auto_32871 ?auto_32866 ?auto_32867 )
      ( MAKE-1CRATE-VERIFY ?auto_32866 ?auto_32867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32874 - SURFACE
      ?auto_32875 - SURFACE
      ?auto_32876 - SURFACE
    )
    :vars
    (
      ?auto_32877 - HOIST
      ?auto_32878 - PLACE
      ?auto_32879 - TRUCK
      ?auto_32880 - PLACE
      ?auto_32881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32877 ?auto_32878 ) ( SURFACE-AT ?auto_32875 ?auto_32878 ) ( CLEAR ?auto_32875 ) ( IS-CRATE ?auto_32876 ) ( not ( = ?auto_32875 ?auto_32876 ) ) ( AVAILABLE ?auto_32877 ) ( ON ?auto_32875 ?auto_32874 ) ( not ( = ?auto_32874 ?auto_32875 ) ) ( not ( = ?auto_32874 ?auto_32876 ) ) ( TRUCK-AT ?auto_32879 ?auto_32880 ) ( not ( = ?auto_32880 ?auto_32878 ) ) ( HOIST-AT ?auto_32881 ?auto_32880 ) ( LIFTING ?auto_32881 ?auto_32876 ) ( not ( = ?auto_32877 ?auto_32881 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32875 ?auto_32876 )
      ( MAKE-2CRATE-VERIFY ?auto_32874 ?auto_32875 ?auto_32876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32882 - SURFACE
      ?auto_32883 - SURFACE
    )
    :vars
    (
      ?auto_32886 - HOIST
      ?auto_32884 - PLACE
      ?auto_32887 - SURFACE
      ?auto_32888 - TRUCK
      ?auto_32889 - PLACE
      ?auto_32885 - HOIST
      ?auto_32890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32886 ?auto_32884 ) ( SURFACE-AT ?auto_32882 ?auto_32884 ) ( CLEAR ?auto_32882 ) ( IS-CRATE ?auto_32883 ) ( not ( = ?auto_32882 ?auto_32883 ) ) ( AVAILABLE ?auto_32886 ) ( ON ?auto_32882 ?auto_32887 ) ( not ( = ?auto_32887 ?auto_32882 ) ) ( not ( = ?auto_32887 ?auto_32883 ) ) ( TRUCK-AT ?auto_32888 ?auto_32889 ) ( not ( = ?auto_32889 ?auto_32884 ) ) ( HOIST-AT ?auto_32885 ?auto_32889 ) ( not ( = ?auto_32886 ?auto_32885 ) ) ( AVAILABLE ?auto_32885 ) ( SURFACE-AT ?auto_32883 ?auto_32889 ) ( ON ?auto_32883 ?auto_32890 ) ( CLEAR ?auto_32883 ) ( not ( = ?auto_32882 ?auto_32890 ) ) ( not ( = ?auto_32883 ?auto_32890 ) ) ( not ( = ?auto_32887 ?auto_32890 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32885 ?auto_32883 ?auto_32890 ?auto_32889 )
      ( MAKE-2CRATE ?auto_32887 ?auto_32882 ?auto_32883 )
      ( MAKE-1CRATE-VERIFY ?auto_32882 ?auto_32883 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32891 - SURFACE
      ?auto_32892 - SURFACE
      ?auto_32893 - SURFACE
    )
    :vars
    (
      ?auto_32897 - HOIST
      ?auto_32898 - PLACE
      ?auto_32895 - TRUCK
      ?auto_32894 - PLACE
      ?auto_32899 - HOIST
      ?auto_32896 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32897 ?auto_32898 ) ( SURFACE-AT ?auto_32892 ?auto_32898 ) ( CLEAR ?auto_32892 ) ( IS-CRATE ?auto_32893 ) ( not ( = ?auto_32892 ?auto_32893 ) ) ( AVAILABLE ?auto_32897 ) ( ON ?auto_32892 ?auto_32891 ) ( not ( = ?auto_32891 ?auto_32892 ) ) ( not ( = ?auto_32891 ?auto_32893 ) ) ( TRUCK-AT ?auto_32895 ?auto_32894 ) ( not ( = ?auto_32894 ?auto_32898 ) ) ( HOIST-AT ?auto_32899 ?auto_32894 ) ( not ( = ?auto_32897 ?auto_32899 ) ) ( AVAILABLE ?auto_32899 ) ( SURFACE-AT ?auto_32893 ?auto_32894 ) ( ON ?auto_32893 ?auto_32896 ) ( CLEAR ?auto_32893 ) ( not ( = ?auto_32892 ?auto_32896 ) ) ( not ( = ?auto_32893 ?auto_32896 ) ) ( not ( = ?auto_32891 ?auto_32896 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32892 ?auto_32893 )
      ( MAKE-2CRATE-VERIFY ?auto_32891 ?auto_32892 ?auto_32893 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32900 - SURFACE
      ?auto_32901 - SURFACE
    )
    :vars
    (
      ?auto_32908 - HOIST
      ?auto_32905 - PLACE
      ?auto_32907 - SURFACE
      ?auto_32902 - PLACE
      ?auto_32904 - HOIST
      ?auto_32903 - SURFACE
      ?auto_32906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32908 ?auto_32905 ) ( SURFACE-AT ?auto_32900 ?auto_32905 ) ( CLEAR ?auto_32900 ) ( IS-CRATE ?auto_32901 ) ( not ( = ?auto_32900 ?auto_32901 ) ) ( AVAILABLE ?auto_32908 ) ( ON ?auto_32900 ?auto_32907 ) ( not ( = ?auto_32907 ?auto_32900 ) ) ( not ( = ?auto_32907 ?auto_32901 ) ) ( not ( = ?auto_32902 ?auto_32905 ) ) ( HOIST-AT ?auto_32904 ?auto_32902 ) ( not ( = ?auto_32908 ?auto_32904 ) ) ( AVAILABLE ?auto_32904 ) ( SURFACE-AT ?auto_32901 ?auto_32902 ) ( ON ?auto_32901 ?auto_32903 ) ( CLEAR ?auto_32901 ) ( not ( = ?auto_32900 ?auto_32903 ) ) ( not ( = ?auto_32901 ?auto_32903 ) ) ( not ( = ?auto_32907 ?auto_32903 ) ) ( TRUCK-AT ?auto_32906 ?auto_32905 ) )
    :subtasks
    ( ( !DRIVE ?auto_32906 ?auto_32905 ?auto_32902 )
      ( MAKE-2CRATE ?auto_32907 ?auto_32900 ?auto_32901 )
      ( MAKE-1CRATE-VERIFY ?auto_32900 ?auto_32901 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32909 - SURFACE
      ?auto_32910 - SURFACE
      ?auto_32911 - SURFACE
    )
    :vars
    (
      ?auto_32915 - HOIST
      ?auto_32913 - PLACE
      ?auto_32916 - PLACE
      ?auto_32917 - HOIST
      ?auto_32914 - SURFACE
      ?auto_32912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32915 ?auto_32913 ) ( SURFACE-AT ?auto_32910 ?auto_32913 ) ( CLEAR ?auto_32910 ) ( IS-CRATE ?auto_32911 ) ( not ( = ?auto_32910 ?auto_32911 ) ) ( AVAILABLE ?auto_32915 ) ( ON ?auto_32910 ?auto_32909 ) ( not ( = ?auto_32909 ?auto_32910 ) ) ( not ( = ?auto_32909 ?auto_32911 ) ) ( not ( = ?auto_32916 ?auto_32913 ) ) ( HOIST-AT ?auto_32917 ?auto_32916 ) ( not ( = ?auto_32915 ?auto_32917 ) ) ( AVAILABLE ?auto_32917 ) ( SURFACE-AT ?auto_32911 ?auto_32916 ) ( ON ?auto_32911 ?auto_32914 ) ( CLEAR ?auto_32911 ) ( not ( = ?auto_32910 ?auto_32914 ) ) ( not ( = ?auto_32911 ?auto_32914 ) ) ( not ( = ?auto_32909 ?auto_32914 ) ) ( TRUCK-AT ?auto_32912 ?auto_32913 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32910 ?auto_32911 )
      ( MAKE-2CRATE-VERIFY ?auto_32909 ?auto_32910 ?auto_32911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32918 - SURFACE
      ?auto_32919 - SURFACE
    )
    :vars
    (
      ?auto_32925 - HOIST
      ?auto_32922 - PLACE
      ?auto_32924 - SURFACE
      ?auto_32921 - PLACE
      ?auto_32920 - HOIST
      ?auto_32926 - SURFACE
      ?auto_32923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32925 ?auto_32922 ) ( IS-CRATE ?auto_32919 ) ( not ( = ?auto_32918 ?auto_32919 ) ) ( not ( = ?auto_32924 ?auto_32918 ) ) ( not ( = ?auto_32924 ?auto_32919 ) ) ( not ( = ?auto_32921 ?auto_32922 ) ) ( HOIST-AT ?auto_32920 ?auto_32921 ) ( not ( = ?auto_32925 ?auto_32920 ) ) ( AVAILABLE ?auto_32920 ) ( SURFACE-AT ?auto_32919 ?auto_32921 ) ( ON ?auto_32919 ?auto_32926 ) ( CLEAR ?auto_32919 ) ( not ( = ?auto_32918 ?auto_32926 ) ) ( not ( = ?auto_32919 ?auto_32926 ) ) ( not ( = ?auto_32924 ?auto_32926 ) ) ( TRUCK-AT ?auto_32923 ?auto_32922 ) ( SURFACE-AT ?auto_32924 ?auto_32922 ) ( CLEAR ?auto_32924 ) ( LIFTING ?auto_32925 ?auto_32918 ) ( IS-CRATE ?auto_32918 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32924 ?auto_32918 )
      ( MAKE-2CRATE ?auto_32924 ?auto_32918 ?auto_32919 )
      ( MAKE-1CRATE-VERIFY ?auto_32918 ?auto_32919 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32927 - SURFACE
      ?auto_32928 - SURFACE
      ?auto_32929 - SURFACE
    )
    :vars
    (
      ?auto_32934 - HOIST
      ?auto_32931 - PLACE
      ?auto_32935 - PLACE
      ?auto_32933 - HOIST
      ?auto_32932 - SURFACE
      ?auto_32930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32934 ?auto_32931 ) ( IS-CRATE ?auto_32929 ) ( not ( = ?auto_32928 ?auto_32929 ) ) ( not ( = ?auto_32927 ?auto_32928 ) ) ( not ( = ?auto_32927 ?auto_32929 ) ) ( not ( = ?auto_32935 ?auto_32931 ) ) ( HOIST-AT ?auto_32933 ?auto_32935 ) ( not ( = ?auto_32934 ?auto_32933 ) ) ( AVAILABLE ?auto_32933 ) ( SURFACE-AT ?auto_32929 ?auto_32935 ) ( ON ?auto_32929 ?auto_32932 ) ( CLEAR ?auto_32929 ) ( not ( = ?auto_32928 ?auto_32932 ) ) ( not ( = ?auto_32929 ?auto_32932 ) ) ( not ( = ?auto_32927 ?auto_32932 ) ) ( TRUCK-AT ?auto_32930 ?auto_32931 ) ( SURFACE-AT ?auto_32927 ?auto_32931 ) ( CLEAR ?auto_32927 ) ( LIFTING ?auto_32934 ?auto_32928 ) ( IS-CRATE ?auto_32928 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32928 ?auto_32929 )
      ( MAKE-2CRATE-VERIFY ?auto_32927 ?auto_32928 ?auto_32929 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32936 - SURFACE
      ?auto_32937 - SURFACE
    )
    :vars
    (
      ?auto_32942 - HOIST
      ?auto_32940 - PLACE
      ?auto_32944 - SURFACE
      ?auto_32939 - PLACE
      ?auto_32943 - HOIST
      ?auto_32938 - SURFACE
      ?auto_32941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32942 ?auto_32940 ) ( IS-CRATE ?auto_32937 ) ( not ( = ?auto_32936 ?auto_32937 ) ) ( not ( = ?auto_32944 ?auto_32936 ) ) ( not ( = ?auto_32944 ?auto_32937 ) ) ( not ( = ?auto_32939 ?auto_32940 ) ) ( HOIST-AT ?auto_32943 ?auto_32939 ) ( not ( = ?auto_32942 ?auto_32943 ) ) ( AVAILABLE ?auto_32943 ) ( SURFACE-AT ?auto_32937 ?auto_32939 ) ( ON ?auto_32937 ?auto_32938 ) ( CLEAR ?auto_32937 ) ( not ( = ?auto_32936 ?auto_32938 ) ) ( not ( = ?auto_32937 ?auto_32938 ) ) ( not ( = ?auto_32944 ?auto_32938 ) ) ( TRUCK-AT ?auto_32941 ?auto_32940 ) ( SURFACE-AT ?auto_32944 ?auto_32940 ) ( CLEAR ?auto_32944 ) ( IS-CRATE ?auto_32936 ) ( AVAILABLE ?auto_32942 ) ( IN ?auto_32936 ?auto_32941 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32942 ?auto_32936 ?auto_32941 ?auto_32940 )
      ( MAKE-2CRATE ?auto_32944 ?auto_32936 ?auto_32937 )
      ( MAKE-1CRATE-VERIFY ?auto_32936 ?auto_32937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32945 - SURFACE
      ?auto_32946 - SURFACE
      ?auto_32947 - SURFACE
    )
    :vars
    (
      ?auto_32952 - HOIST
      ?auto_32951 - PLACE
      ?auto_32948 - PLACE
      ?auto_32950 - HOIST
      ?auto_32953 - SURFACE
      ?auto_32949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32952 ?auto_32951 ) ( IS-CRATE ?auto_32947 ) ( not ( = ?auto_32946 ?auto_32947 ) ) ( not ( = ?auto_32945 ?auto_32946 ) ) ( not ( = ?auto_32945 ?auto_32947 ) ) ( not ( = ?auto_32948 ?auto_32951 ) ) ( HOIST-AT ?auto_32950 ?auto_32948 ) ( not ( = ?auto_32952 ?auto_32950 ) ) ( AVAILABLE ?auto_32950 ) ( SURFACE-AT ?auto_32947 ?auto_32948 ) ( ON ?auto_32947 ?auto_32953 ) ( CLEAR ?auto_32947 ) ( not ( = ?auto_32946 ?auto_32953 ) ) ( not ( = ?auto_32947 ?auto_32953 ) ) ( not ( = ?auto_32945 ?auto_32953 ) ) ( TRUCK-AT ?auto_32949 ?auto_32951 ) ( SURFACE-AT ?auto_32945 ?auto_32951 ) ( CLEAR ?auto_32945 ) ( IS-CRATE ?auto_32946 ) ( AVAILABLE ?auto_32952 ) ( IN ?auto_32946 ?auto_32949 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32946 ?auto_32947 )
      ( MAKE-2CRATE-VERIFY ?auto_32945 ?auto_32946 ?auto_32947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32954 - SURFACE
      ?auto_32955 - SURFACE
    )
    :vars
    (
      ?auto_32957 - HOIST
      ?auto_32962 - PLACE
      ?auto_32958 - SURFACE
      ?auto_32959 - PLACE
      ?auto_32956 - HOIST
      ?auto_32961 - SURFACE
      ?auto_32960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32957 ?auto_32962 ) ( IS-CRATE ?auto_32955 ) ( not ( = ?auto_32954 ?auto_32955 ) ) ( not ( = ?auto_32958 ?auto_32954 ) ) ( not ( = ?auto_32958 ?auto_32955 ) ) ( not ( = ?auto_32959 ?auto_32962 ) ) ( HOIST-AT ?auto_32956 ?auto_32959 ) ( not ( = ?auto_32957 ?auto_32956 ) ) ( AVAILABLE ?auto_32956 ) ( SURFACE-AT ?auto_32955 ?auto_32959 ) ( ON ?auto_32955 ?auto_32961 ) ( CLEAR ?auto_32955 ) ( not ( = ?auto_32954 ?auto_32961 ) ) ( not ( = ?auto_32955 ?auto_32961 ) ) ( not ( = ?auto_32958 ?auto_32961 ) ) ( SURFACE-AT ?auto_32958 ?auto_32962 ) ( CLEAR ?auto_32958 ) ( IS-CRATE ?auto_32954 ) ( AVAILABLE ?auto_32957 ) ( IN ?auto_32954 ?auto_32960 ) ( TRUCK-AT ?auto_32960 ?auto_32959 ) )
    :subtasks
    ( ( !DRIVE ?auto_32960 ?auto_32959 ?auto_32962 )
      ( MAKE-2CRATE ?auto_32958 ?auto_32954 ?auto_32955 )
      ( MAKE-1CRATE-VERIFY ?auto_32954 ?auto_32955 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32963 - SURFACE
      ?auto_32964 - SURFACE
      ?auto_32965 - SURFACE
    )
    :vars
    (
      ?auto_32971 - HOIST
      ?auto_32968 - PLACE
      ?auto_32970 - PLACE
      ?auto_32969 - HOIST
      ?auto_32967 - SURFACE
      ?auto_32966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32971 ?auto_32968 ) ( IS-CRATE ?auto_32965 ) ( not ( = ?auto_32964 ?auto_32965 ) ) ( not ( = ?auto_32963 ?auto_32964 ) ) ( not ( = ?auto_32963 ?auto_32965 ) ) ( not ( = ?auto_32970 ?auto_32968 ) ) ( HOIST-AT ?auto_32969 ?auto_32970 ) ( not ( = ?auto_32971 ?auto_32969 ) ) ( AVAILABLE ?auto_32969 ) ( SURFACE-AT ?auto_32965 ?auto_32970 ) ( ON ?auto_32965 ?auto_32967 ) ( CLEAR ?auto_32965 ) ( not ( = ?auto_32964 ?auto_32967 ) ) ( not ( = ?auto_32965 ?auto_32967 ) ) ( not ( = ?auto_32963 ?auto_32967 ) ) ( SURFACE-AT ?auto_32963 ?auto_32968 ) ( CLEAR ?auto_32963 ) ( IS-CRATE ?auto_32964 ) ( AVAILABLE ?auto_32971 ) ( IN ?auto_32964 ?auto_32966 ) ( TRUCK-AT ?auto_32966 ?auto_32970 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32964 ?auto_32965 )
      ( MAKE-2CRATE-VERIFY ?auto_32963 ?auto_32964 ?auto_32965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32972 - SURFACE
      ?auto_32973 - SURFACE
    )
    :vars
    (
      ?auto_32974 - HOIST
      ?auto_32976 - PLACE
      ?auto_32978 - SURFACE
      ?auto_32977 - PLACE
      ?auto_32980 - HOIST
      ?auto_32975 - SURFACE
      ?auto_32979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32974 ?auto_32976 ) ( IS-CRATE ?auto_32973 ) ( not ( = ?auto_32972 ?auto_32973 ) ) ( not ( = ?auto_32978 ?auto_32972 ) ) ( not ( = ?auto_32978 ?auto_32973 ) ) ( not ( = ?auto_32977 ?auto_32976 ) ) ( HOIST-AT ?auto_32980 ?auto_32977 ) ( not ( = ?auto_32974 ?auto_32980 ) ) ( SURFACE-AT ?auto_32973 ?auto_32977 ) ( ON ?auto_32973 ?auto_32975 ) ( CLEAR ?auto_32973 ) ( not ( = ?auto_32972 ?auto_32975 ) ) ( not ( = ?auto_32973 ?auto_32975 ) ) ( not ( = ?auto_32978 ?auto_32975 ) ) ( SURFACE-AT ?auto_32978 ?auto_32976 ) ( CLEAR ?auto_32978 ) ( IS-CRATE ?auto_32972 ) ( AVAILABLE ?auto_32974 ) ( TRUCK-AT ?auto_32979 ?auto_32977 ) ( LIFTING ?auto_32980 ?auto_32972 ) )
    :subtasks
    ( ( !LOAD ?auto_32980 ?auto_32972 ?auto_32979 ?auto_32977 )
      ( MAKE-2CRATE ?auto_32978 ?auto_32972 ?auto_32973 )
      ( MAKE-1CRATE-VERIFY ?auto_32972 ?auto_32973 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32981 - SURFACE
      ?auto_32982 - SURFACE
      ?auto_32983 - SURFACE
    )
    :vars
    (
      ?auto_32986 - HOIST
      ?auto_32985 - PLACE
      ?auto_32988 - PLACE
      ?auto_32984 - HOIST
      ?auto_32987 - SURFACE
      ?auto_32989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32986 ?auto_32985 ) ( IS-CRATE ?auto_32983 ) ( not ( = ?auto_32982 ?auto_32983 ) ) ( not ( = ?auto_32981 ?auto_32982 ) ) ( not ( = ?auto_32981 ?auto_32983 ) ) ( not ( = ?auto_32988 ?auto_32985 ) ) ( HOIST-AT ?auto_32984 ?auto_32988 ) ( not ( = ?auto_32986 ?auto_32984 ) ) ( SURFACE-AT ?auto_32983 ?auto_32988 ) ( ON ?auto_32983 ?auto_32987 ) ( CLEAR ?auto_32983 ) ( not ( = ?auto_32982 ?auto_32987 ) ) ( not ( = ?auto_32983 ?auto_32987 ) ) ( not ( = ?auto_32981 ?auto_32987 ) ) ( SURFACE-AT ?auto_32981 ?auto_32985 ) ( CLEAR ?auto_32981 ) ( IS-CRATE ?auto_32982 ) ( AVAILABLE ?auto_32986 ) ( TRUCK-AT ?auto_32989 ?auto_32988 ) ( LIFTING ?auto_32984 ?auto_32982 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32982 ?auto_32983 )
      ( MAKE-2CRATE-VERIFY ?auto_32981 ?auto_32982 ?auto_32983 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32990 - SURFACE
      ?auto_32991 - SURFACE
    )
    :vars
    (
      ?auto_32998 - HOIST
      ?auto_32997 - PLACE
      ?auto_32994 - SURFACE
      ?auto_32992 - PLACE
      ?auto_32996 - HOIST
      ?auto_32993 - SURFACE
      ?auto_32995 - TRUCK
      ?auto_32999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32998 ?auto_32997 ) ( IS-CRATE ?auto_32991 ) ( not ( = ?auto_32990 ?auto_32991 ) ) ( not ( = ?auto_32994 ?auto_32990 ) ) ( not ( = ?auto_32994 ?auto_32991 ) ) ( not ( = ?auto_32992 ?auto_32997 ) ) ( HOIST-AT ?auto_32996 ?auto_32992 ) ( not ( = ?auto_32998 ?auto_32996 ) ) ( SURFACE-AT ?auto_32991 ?auto_32992 ) ( ON ?auto_32991 ?auto_32993 ) ( CLEAR ?auto_32991 ) ( not ( = ?auto_32990 ?auto_32993 ) ) ( not ( = ?auto_32991 ?auto_32993 ) ) ( not ( = ?auto_32994 ?auto_32993 ) ) ( SURFACE-AT ?auto_32994 ?auto_32997 ) ( CLEAR ?auto_32994 ) ( IS-CRATE ?auto_32990 ) ( AVAILABLE ?auto_32998 ) ( TRUCK-AT ?auto_32995 ?auto_32992 ) ( AVAILABLE ?auto_32996 ) ( SURFACE-AT ?auto_32990 ?auto_32992 ) ( ON ?auto_32990 ?auto_32999 ) ( CLEAR ?auto_32990 ) ( not ( = ?auto_32990 ?auto_32999 ) ) ( not ( = ?auto_32991 ?auto_32999 ) ) ( not ( = ?auto_32994 ?auto_32999 ) ) ( not ( = ?auto_32993 ?auto_32999 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32996 ?auto_32990 ?auto_32999 ?auto_32992 )
      ( MAKE-2CRATE ?auto_32994 ?auto_32990 ?auto_32991 )
      ( MAKE-1CRATE-VERIFY ?auto_32990 ?auto_32991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33000 - SURFACE
      ?auto_33001 - SURFACE
      ?auto_33002 - SURFACE
    )
    :vars
    (
      ?auto_33004 - HOIST
      ?auto_33009 - PLACE
      ?auto_33005 - PLACE
      ?auto_33008 - HOIST
      ?auto_33006 - SURFACE
      ?auto_33007 - TRUCK
      ?auto_33003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33004 ?auto_33009 ) ( IS-CRATE ?auto_33002 ) ( not ( = ?auto_33001 ?auto_33002 ) ) ( not ( = ?auto_33000 ?auto_33001 ) ) ( not ( = ?auto_33000 ?auto_33002 ) ) ( not ( = ?auto_33005 ?auto_33009 ) ) ( HOIST-AT ?auto_33008 ?auto_33005 ) ( not ( = ?auto_33004 ?auto_33008 ) ) ( SURFACE-AT ?auto_33002 ?auto_33005 ) ( ON ?auto_33002 ?auto_33006 ) ( CLEAR ?auto_33002 ) ( not ( = ?auto_33001 ?auto_33006 ) ) ( not ( = ?auto_33002 ?auto_33006 ) ) ( not ( = ?auto_33000 ?auto_33006 ) ) ( SURFACE-AT ?auto_33000 ?auto_33009 ) ( CLEAR ?auto_33000 ) ( IS-CRATE ?auto_33001 ) ( AVAILABLE ?auto_33004 ) ( TRUCK-AT ?auto_33007 ?auto_33005 ) ( AVAILABLE ?auto_33008 ) ( SURFACE-AT ?auto_33001 ?auto_33005 ) ( ON ?auto_33001 ?auto_33003 ) ( CLEAR ?auto_33001 ) ( not ( = ?auto_33001 ?auto_33003 ) ) ( not ( = ?auto_33002 ?auto_33003 ) ) ( not ( = ?auto_33000 ?auto_33003 ) ) ( not ( = ?auto_33006 ?auto_33003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33001 ?auto_33002 )
      ( MAKE-2CRATE-VERIFY ?auto_33000 ?auto_33001 ?auto_33002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33010 - SURFACE
      ?auto_33011 - SURFACE
    )
    :vars
    (
      ?auto_33013 - HOIST
      ?auto_33012 - PLACE
      ?auto_33016 - SURFACE
      ?auto_33014 - PLACE
      ?auto_33018 - HOIST
      ?auto_33019 - SURFACE
      ?auto_33015 - SURFACE
      ?auto_33017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33013 ?auto_33012 ) ( IS-CRATE ?auto_33011 ) ( not ( = ?auto_33010 ?auto_33011 ) ) ( not ( = ?auto_33016 ?auto_33010 ) ) ( not ( = ?auto_33016 ?auto_33011 ) ) ( not ( = ?auto_33014 ?auto_33012 ) ) ( HOIST-AT ?auto_33018 ?auto_33014 ) ( not ( = ?auto_33013 ?auto_33018 ) ) ( SURFACE-AT ?auto_33011 ?auto_33014 ) ( ON ?auto_33011 ?auto_33019 ) ( CLEAR ?auto_33011 ) ( not ( = ?auto_33010 ?auto_33019 ) ) ( not ( = ?auto_33011 ?auto_33019 ) ) ( not ( = ?auto_33016 ?auto_33019 ) ) ( SURFACE-AT ?auto_33016 ?auto_33012 ) ( CLEAR ?auto_33016 ) ( IS-CRATE ?auto_33010 ) ( AVAILABLE ?auto_33013 ) ( AVAILABLE ?auto_33018 ) ( SURFACE-AT ?auto_33010 ?auto_33014 ) ( ON ?auto_33010 ?auto_33015 ) ( CLEAR ?auto_33010 ) ( not ( = ?auto_33010 ?auto_33015 ) ) ( not ( = ?auto_33011 ?auto_33015 ) ) ( not ( = ?auto_33016 ?auto_33015 ) ) ( not ( = ?auto_33019 ?auto_33015 ) ) ( TRUCK-AT ?auto_33017 ?auto_33012 ) )
    :subtasks
    ( ( !DRIVE ?auto_33017 ?auto_33012 ?auto_33014 )
      ( MAKE-2CRATE ?auto_33016 ?auto_33010 ?auto_33011 )
      ( MAKE-1CRATE-VERIFY ?auto_33010 ?auto_33011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33020 - SURFACE
      ?auto_33021 - SURFACE
      ?auto_33022 - SURFACE
    )
    :vars
    (
      ?auto_33027 - HOIST
      ?auto_33029 - PLACE
      ?auto_33025 - PLACE
      ?auto_33024 - HOIST
      ?auto_33028 - SURFACE
      ?auto_33023 - SURFACE
      ?auto_33026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33027 ?auto_33029 ) ( IS-CRATE ?auto_33022 ) ( not ( = ?auto_33021 ?auto_33022 ) ) ( not ( = ?auto_33020 ?auto_33021 ) ) ( not ( = ?auto_33020 ?auto_33022 ) ) ( not ( = ?auto_33025 ?auto_33029 ) ) ( HOIST-AT ?auto_33024 ?auto_33025 ) ( not ( = ?auto_33027 ?auto_33024 ) ) ( SURFACE-AT ?auto_33022 ?auto_33025 ) ( ON ?auto_33022 ?auto_33028 ) ( CLEAR ?auto_33022 ) ( not ( = ?auto_33021 ?auto_33028 ) ) ( not ( = ?auto_33022 ?auto_33028 ) ) ( not ( = ?auto_33020 ?auto_33028 ) ) ( SURFACE-AT ?auto_33020 ?auto_33029 ) ( CLEAR ?auto_33020 ) ( IS-CRATE ?auto_33021 ) ( AVAILABLE ?auto_33027 ) ( AVAILABLE ?auto_33024 ) ( SURFACE-AT ?auto_33021 ?auto_33025 ) ( ON ?auto_33021 ?auto_33023 ) ( CLEAR ?auto_33021 ) ( not ( = ?auto_33021 ?auto_33023 ) ) ( not ( = ?auto_33022 ?auto_33023 ) ) ( not ( = ?auto_33020 ?auto_33023 ) ) ( not ( = ?auto_33028 ?auto_33023 ) ) ( TRUCK-AT ?auto_33026 ?auto_33029 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33021 ?auto_33022 )
      ( MAKE-2CRATE-VERIFY ?auto_33020 ?auto_33021 ?auto_33022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33039 - SURFACE
      ?auto_33040 - SURFACE
    )
    :vars
    (
      ?auto_33041 - HOIST
      ?auto_33042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33041 ?auto_33042 ) ( SURFACE-AT ?auto_33039 ?auto_33042 ) ( CLEAR ?auto_33039 ) ( LIFTING ?auto_33041 ?auto_33040 ) ( IS-CRATE ?auto_33040 ) ( not ( = ?auto_33039 ?auto_33040 ) ) )
    :subtasks
    ( ( !DROP ?auto_33041 ?auto_33040 ?auto_33039 ?auto_33042 )
      ( MAKE-1CRATE-VERIFY ?auto_33039 ?auto_33040 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33043 - SURFACE
      ?auto_33044 - SURFACE
      ?auto_33045 - SURFACE
    )
    :vars
    (
      ?auto_33046 - HOIST
      ?auto_33047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33046 ?auto_33047 ) ( SURFACE-AT ?auto_33044 ?auto_33047 ) ( CLEAR ?auto_33044 ) ( LIFTING ?auto_33046 ?auto_33045 ) ( IS-CRATE ?auto_33045 ) ( not ( = ?auto_33044 ?auto_33045 ) ) ( ON ?auto_33044 ?auto_33043 ) ( not ( = ?auto_33043 ?auto_33044 ) ) ( not ( = ?auto_33043 ?auto_33045 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33044 ?auto_33045 )
      ( MAKE-2CRATE-VERIFY ?auto_33043 ?auto_33044 ?auto_33045 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33048 - SURFACE
      ?auto_33049 - SURFACE
      ?auto_33050 - SURFACE
      ?auto_33051 - SURFACE
    )
    :vars
    (
      ?auto_33052 - HOIST
      ?auto_33053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33052 ?auto_33053 ) ( SURFACE-AT ?auto_33050 ?auto_33053 ) ( CLEAR ?auto_33050 ) ( LIFTING ?auto_33052 ?auto_33051 ) ( IS-CRATE ?auto_33051 ) ( not ( = ?auto_33050 ?auto_33051 ) ) ( ON ?auto_33049 ?auto_33048 ) ( ON ?auto_33050 ?auto_33049 ) ( not ( = ?auto_33048 ?auto_33049 ) ) ( not ( = ?auto_33048 ?auto_33050 ) ) ( not ( = ?auto_33048 ?auto_33051 ) ) ( not ( = ?auto_33049 ?auto_33050 ) ) ( not ( = ?auto_33049 ?auto_33051 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33050 ?auto_33051 )
      ( MAKE-3CRATE-VERIFY ?auto_33048 ?auto_33049 ?auto_33050 ?auto_33051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33054 - SURFACE
      ?auto_33055 - SURFACE
    )
    :vars
    (
      ?auto_33056 - HOIST
      ?auto_33057 - PLACE
      ?auto_33058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33056 ?auto_33057 ) ( SURFACE-AT ?auto_33054 ?auto_33057 ) ( CLEAR ?auto_33054 ) ( IS-CRATE ?auto_33055 ) ( not ( = ?auto_33054 ?auto_33055 ) ) ( TRUCK-AT ?auto_33058 ?auto_33057 ) ( AVAILABLE ?auto_33056 ) ( IN ?auto_33055 ?auto_33058 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33056 ?auto_33055 ?auto_33058 ?auto_33057 )
      ( MAKE-1CRATE ?auto_33054 ?auto_33055 )
      ( MAKE-1CRATE-VERIFY ?auto_33054 ?auto_33055 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33059 - SURFACE
      ?auto_33060 - SURFACE
      ?auto_33061 - SURFACE
    )
    :vars
    (
      ?auto_33062 - HOIST
      ?auto_33063 - PLACE
      ?auto_33064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33062 ?auto_33063 ) ( SURFACE-AT ?auto_33060 ?auto_33063 ) ( CLEAR ?auto_33060 ) ( IS-CRATE ?auto_33061 ) ( not ( = ?auto_33060 ?auto_33061 ) ) ( TRUCK-AT ?auto_33064 ?auto_33063 ) ( AVAILABLE ?auto_33062 ) ( IN ?auto_33061 ?auto_33064 ) ( ON ?auto_33060 ?auto_33059 ) ( not ( = ?auto_33059 ?auto_33060 ) ) ( not ( = ?auto_33059 ?auto_33061 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33060 ?auto_33061 )
      ( MAKE-2CRATE-VERIFY ?auto_33059 ?auto_33060 ?auto_33061 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33065 - SURFACE
      ?auto_33066 - SURFACE
      ?auto_33067 - SURFACE
      ?auto_33068 - SURFACE
    )
    :vars
    (
      ?auto_33070 - HOIST
      ?auto_33069 - PLACE
      ?auto_33071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33070 ?auto_33069 ) ( SURFACE-AT ?auto_33067 ?auto_33069 ) ( CLEAR ?auto_33067 ) ( IS-CRATE ?auto_33068 ) ( not ( = ?auto_33067 ?auto_33068 ) ) ( TRUCK-AT ?auto_33071 ?auto_33069 ) ( AVAILABLE ?auto_33070 ) ( IN ?auto_33068 ?auto_33071 ) ( ON ?auto_33067 ?auto_33066 ) ( not ( = ?auto_33066 ?auto_33067 ) ) ( not ( = ?auto_33066 ?auto_33068 ) ) ( ON ?auto_33066 ?auto_33065 ) ( not ( = ?auto_33065 ?auto_33066 ) ) ( not ( = ?auto_33065 ?auto_33067 ) ) ( not ( = ?auto_33065 ?auto_33068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33066 ?auto_33067 ?auto_33068 )
      ( MAKE-3CRATE-VERIFY ?auto_33065 ?auto_33066 ?auto_33067 ?auto_33068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33072 - SURFACE
      ?auto_33073 - SURFACE
    )
    :vars
    (
      ?auto_33075 - HOIST
      ?auto_33074 - PLACE
      ?auto_33076 - TRUCK
      ?auto_33077 - SURFACE
      ?auto_33078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33075 ?auto_33074 ) ( SURFACE-AT ?auto_33072 ?auto_33074 ) ( CLEAR ?auto_33072 ) ( IS-CRATE ?auto_33073 ) ( not ( = ?auto_33072 ?auto_33073 ) ) ( AVAILABLE ?auto_33075 ) ( IN ?auto_33073 ?auto_33076 ) ( ON ?auto_33072 ?auto_33077 ) ( not ( = ?auto_33077 ?auto_33072 ) ) ( not ( = ?auto_33077 ?auto_33073 ) ) ( TRUCK-AT ?auto_33076 ?auto_33078 ) ( not ( = ?auto_33078 ?auto_33074 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33076 ?auto_33078 ?auto_33074 )
      ( MAKE-2CRATE ?auto_33077 ?auto_33072 ?auto_33073 )
      ( MAKE-1CRATE-VERIFY ?auto_33072 ?auto_33073 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33079 - SURFACE
      ?auto_33080 - SURFACE
      ?auto_33081 - SURFACE
    )
    :vars
    (
      ?auto_33085 - HOIST
      ?auto_33083 - PLACE
      ?auto_33082 - TRUCK
      ?auto_33084 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33085 ?auto_33083 ) ( SURFACE-AT ?auto_33080 ?auto_33083 ) ( CLEAR ?auto_33080 ) ( IS-CRATE ?auto_33081 ) ( not ( = ?auto_33080 ?auto_33081 ) ) ( AVAILABLE ?auto_33085 ) ( IN ?auto_33081 ?auto_33082 ) ( ON ?auto_33080 ?auto_33079 ) ( not ( = ?auto_33079 ?auto_33080 ) ) ( not ( = ?auto_33079 ?auto_33081 ) ) ( TRUCK-AT ?auto_33082 ?auto_33084 ) ( not ( = ?auto_33084 ?auto_33083 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33080 ?auto_33081 )
      ( MAKE-2CRATE-VERIFY ?auto_33079 ?auto_33080 ?auto_33081 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33086 - SURFACE
      ?auto_33087 - SURFACE
      ?auto_33088 - SURFACE
      ?auto_33089 - SURFACE
    )
    :vars
    (
      ?auto_33090 - HOIST
      ?auto_33092 - PLACE
      ?auto_33093 - TRUCK
      ?auto_33091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33090 ?auto_33092 ) ( SURFACE-AT ?auto_33088 ?auto_33092 ) ( CLEAR ?auto_33088 ) ( IS-CRATE ?auto_33089 ) ( not ( = ?auto_33088 ?auto_33089 ) ) ( AVAILABLE ?auto_33090 ) ( IN ?auto_33089 ?auto_33093 ) ( ON ?auto_33088 ?auto_33087 ) ( not ( = ?auto_33087 ?auto_33088 ) ) ( not ( = ?auto_33087 ?auto_33089 ) ) ( TRUCK-AT ?auto_33093 ?auto_33091 ) ( not ( = ?auto_33091 ?auto_33092 ) ) ( ON ?auto_33087 ?auto_33086 ) ( not ( = ?auto_33086 ?auto_33087 ) ) ( not ( = ?auto_33086 ?auto_33088 ) ) ( not ( = ?auto_33086 ?auto_33089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33087 ?auto_33088 ?auto_33089 )
      ( MAKE-3CRATE-VERIFY ?auto_33086 ?auto_33087 ?auto_33088 ?auto_33089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33094 - SURFACE
      ?auto_33095 - SURFACE
    )
    :vars
    (
      ?auto_33096 - HOIST
      ?auto_33099 - PLACE
      ?auto_33098 - SURFACE
      ?auto_33100 - TRUCK
      ?auto_33097 - PLACE
      ?auto_33101 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33096 ?auto_33099 ) ( SURFACE-AT ?auto_33094 ?auto_33099 ) ( CLEAR ?auto_33094 ) ( IS-CRATE ?auto_33095 ) ( not ( = ?auto_33094 ?auto_33095 ) ) ( AVAILABLE ?auto_33096 ) ( ON ?auto_33094 ?auto_33098 ) ( not ( = ?auto_33098 ?auto_33094 ) ) ( not ( = ?auto_33098 ?auto_33095 ) ) ( TRUCK-AT ?auto_33100 ?auto_33097 ) ( not ( = ?auto_33097 ?auto_33099 ) ) ( HOIST-AT ?auto_33101 ?auto_33097 ) ( LIFTING ?auto_33101 ?auto_33095 ) ( not ( = ?auto_33096 ?auto_33101 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33101 ?auto_33095 ?auto_33100 ?auto_33097 )
      ( MAKE-2CRATE ?auto_33098 ?auto_33094 ?auto_33095 )
      ( MAKE-1CRATE-VERIFY ?auto_33094 ?auto_33095 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33102 - SURFACE
      ?auto_33103 - SURFACE
      ?auto_33104 - SURFACE
    )
    :vars
    (
      ?auto_33107 - HOIST
      ?auto_33108 - PLACE
      ?auto_33109 - TRUCK
      ?auto_33106 - PLACE
      ?auto_33105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33107 ?auto_33108 ) ( SURFACE-AT ?auto_33103 ?auto_33108 ) ( CLEAR ?auto_33103 ) ( IS-CRATE ?auto_33104 ) ( not ( = ?auto_33103 ?auto_33104 ) ) ( AVAILABLE ?auto_33107 ) ( ON ?auto_33103 ?auto_33102 ) ( not ( = ?auto_33102 ?auto_33103 ) ) ( not ( = ?auto_33102 ?auto_33104 ) ) ( TRUCK-AT ?auto_33109 ?auto_33106 ) ( not ( = ?auto_33106 ?auto_33108 ) ) ( HOIST-AT ?auto_33105 ?auto_33106 ) ( LIFTING ?auto_33105 ?auto_33104 ) ( not ( = ?auto_33107 ?auto_33105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33103 ?auto_33104 )
      ( MAKE-2CRATE-VERIFY ?auto_33102 ?auto_33103 ?auto_33104 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33110 - SURFACE
      ?auto_33111 - SURFACE
      ?auto_33112 - SURFACE
      ?auto_33113 - SURFACE
    )
    :vars
    (
      ?auto_33116 - HOIST
      ?auto_33118 - PLACE
      ?auto_33117 - TRUCK
      ?auto_33114 - PLACE
      ?auto_33115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33116 ?auto_33118 ) ( SURFACE-AT ?auto_33112 ?auto_33118 ) ( CLEAR ?auto_33112 ) ( IS-CRATE ?auto_33113 ) ( not ( = ?auto_33112 ?auto_33113 ) ) ( AVAILABLE ?auto_33116 ) ( ON ?auto_33112 ?auto_33111 ) ( not ( = ?auto_33111 ?auto_33112 ) ) ( not ( = ?auto_33111 ?auto_33113 ) ) ( TRUCK-AT ?auto_33117 ?auto_33114 ) ( not ( = ?auto_33114 ?auto_33118 ) ) ( HOIST-AT ?auto_33115 ?auto_33114 ) ( LIFTING ?auto_33115 ?auto_33113 ) ( not ( = ?auto_33116 ?auto_33115 ) ) ( ON ?auto_33111 ?auto_33110 ) ( not ( = ?auto_33110 ?auto_33111 ) ) ( not ( = ?auto_33110 ?auto_33112 ) ) ( not ( = ?auto_33110 ?auto_33113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33111 ?auto_33112 ?auto_33113 )
      ( MAKE-3CRATE-VERIFY ?auto_33110 ?auto_33111 ?auto_33112 ?auto_33113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33119 - SURFACE
      ?auto_33120 - SURFACE
    )
    :vars
    (
      ?auto_33124 - HOIST
      ?auto_33126 - PLACE
      ?auto_33123 - SURFACE
      ?auto_33125 - TRUCK
      ?auto_33121 - PLACE
      ?auto_33122 - HOIST
      ?auto_33127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33124 ?auto_33126 ) ( SURFACE-AT ?auto_33119 ?auto_33126 ) ( CLEAR ?auto_33119 ) ( IS-CRATE ?auto_33120 ) ( not ( = ?auto_33119 ?auto_33120 ) ) ( AVAILABLE ?auto_33124 ) ( ON ?auto_33119 ?auto_33123 ) ( not ( = ?auto_33123 ?auto_33119 ) ) ( not ( = ?auto_33123 ?auto_33120 ) ) ( TRUCK-AT ?auto_33125 ?auto_33121 ) ( not ( = ?auto_33121 ?auto_33126 ) ) ( HOIST-AT ?auto_33122 ?auto_33121 ) ( not ( = ?auto_33124 ?auto_33122 ) ) ( AVAILABLE ?auto_33122 ) ( SURFACE-AT ?auto_33120 ?auto_33121 ) ( ON ?auto_33120 ?auto_33127 ) ( CLEAR ?auto_33120 ) ( not ( = ?auto_33119 ?auto_33127 ) ) ( not ( = ?auto_33120 ?auto_33127 ) ) ( not ( = ?auto_33123 ?auto_33127 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33122 ?auto_33120 ?auto_33127 ?auto_33121 )
      ( MAKE-2CRATE ?auto_33123 ?auto_33119 ?auto_33120 )
      ( MAKE-1CRATE-VERIFY ?auto_33119 ?auto_33120 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33128 - SURFACE
      ?auto_33129 - SURFACE
      ?auto_33130 - SURFACE
    )
    :vars
    (
      ?auto_33135 - HOIST
      ?auto_33131 - PLACE
      ?auto_33136 - TRUCK
      ?auto_33132 - PLACE
      ?auto_33133 - HOIST
      ?auto_33134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33135 ?auto_33131 ) ( SURFACE-AT ?auto_33129 ?auto_33131 ) ( CLEAR ?auto_33129 ) ( IS-CRATE ?auto_33130 ) ( not ( = ?auto_33129 ?auto_33130 ) ) ( AVAILABLE ?auto_33135 ) ( ON ?auto_33129 ?auto_33128 ) ( not ( = ?auto_33128 ?auto_33129 ) ) ( not ( = ?auto_33128 ?auto_33130 ) ) ( TRUCK-AT ?auto_33136 ?auto_33132 ) ( not ( = ?auto_33132 ?auto_33131 ) ) ( HOIST-AT ?auto_33133 ?auto_33132 ) ( not ( = ?auto_33135 ?auto_33133 ) ) ( AVAILABLE ?auto_33133 ) ( SURFACE-AT ?auto_33130 ?auto_33132 ) ( ON ?auto_33130 ?auto_33134 ) ( CLEAR ?auto_33130 ) ( not ( = ?auto_33129 ?auto_33134 ) ) ( not ( = ?auto_33130 ?auto_33134 ) ) ( not ( = ?auto_33128 ?auto_33134 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33129 ?auto_33130 )
      ( MAKE-2CRATE-VERIFY ?auto_33128 ?auto_33129 ?auto_33130 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33137 - SURFACE
      ?auto_33138 - SURFACE
      ?auto_33139 - SURFACE
      ?auto_33140 - SURFACE
    )
    :vars
    (
      ?auto_33143 - HOIST
      ?auto_33145 - PLACE
      ?auto_33141 - TRUCK
      ?auto_33146 - PLACE
      ?auto_33142 - HOIST
      ?auto_33144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33143 ?auto_33145 ) ( SURFACE-AT ?auto_33139 ?auto_33145 ) ( CLEAR ?auto_33139 ) ( IS-CRATE ?auto_33140 ) ( not ( = ?auto_33139 ?auto_33140 ) ) ( AVAILABLE ?auto_33143 ) ( ON ?auto_33139 ?auto_33138 ) ( not ( = ?auto_33138 ?auto_33139 ) ) ( not ( = ?auto_33138 ?auto_33140 ) ) ( TRUCK-AT ?auto_33141 ?auto_33146 ) ( not ( = ?auto_33146 ?auto_33145 ) ) ( HOIST-AT ?auto_33142 ?auto_33146 ) ( not ( = ?auto_33143 ?auto_33142 ) ) ( AVAILABLE ?auto_33142 ) ( SURFACE-AT ?auto_33140 ?auto_33146 ) ( ON ?auto_33140 ?auto_33144 ) ( CLEAR ?auto_33140 ) ( not ( = ?auto_33139 ?auto_33144 ) ) ( not ( = ?auto_33140 ?auto_33144 ) ) ( not ( = ?auto_33138 ?auto_33144 ) ) ( ON ?auto_33138 ?auto_33137 ) ( not ( = ?auto_33137 ?auto_33138 ) ) ( not ( = ?auto_33137 ?auto_33139 ) ) ( not ( = ?auto_33137 ?auto_33140 ) ) ( not ( = ?auto_33137 ?auto_33144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33138 ?auto_33139 ?auto_33140 )
      ( MAKE-3CRATE-VERIFY ?auto_33137 ?auto_33138 ?auto_33139 ?auto_33140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33147 - SURFACE
      ?auto_33148 - SURFACE
    )
    :vars
    (
      ?auto_33151 - HOIST
      ?auto_33154 - PLACE
      ?auto_33153 - SURFACE
      ?auto_33155 - PLACE
      ?auto_33150 - HOIST
      ?auto_33152 - SURFACE
      ?auto_33149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33151 ?auto_33154 ) ( SURFACE-AT ?auto_33147 ?auto_33154 ) ( CLEAR ?auto_33147 ) ( IS-CRATE ?auto_33148 ) ( not ( = ?auto_33147 ?auto_33148 ) ) ( AVAILABLE ?auto_33151 ) ( ON ?auto_33147 ?auto_33153 ) ( not ( = ?auto_33153 ?auto_33147 ) ) ( not ( = ?auto_33153 ?auto_33148 ) ) ( not ( = ?auto_33155 ?auto_33154 ) ) ( HOIST-AT ?auto_33150 ?auto_33155 ) ( not ( = ?auto_33151 ?auto_33150 ) ) ( AVAILABLE ?auto_33150 ) ( SURFACE-AT ?auto_33148 ?auto_33155 ) ( ON ?auto_33148 ?auto_33152 ) ( CLEAR ?auto_33148 ) ( not ( = ?auto_33147 ?auto_33152 ) ) ( not ( = ?auto_33148 ?auto_33152 ) ) ( not ( = ?auto_33153 ?auto_33152 ) ) ( TRUCK-AT ?auto_33149 ?auto_33154 ) )
    :subtasks
    ( ( !DRIVE ?auto_33149 ?auto_33154 ?auto_33155 )
      ( MAKE-2CRATE ?auto_33153 ?auto_33147 ?auto_33148 )
      ( MAKE-1CRATE-VERIFY ?auto_33147 ?auto_33148 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33156 - SURFACE
      ?auto_33157 - SURFACE
      ?auto_33158 - SURFACE
    )
    :vars
    (
      ?auto_33162 - HOIST
      ?auto_33163 - PLACE
      ?auto_33164 - PLACE
      ?auto_33160 - HOIST
      ?auto_33159 - SURFACE
      ?auto_33161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33162 ?auto_33163 ) ( SURFACE-AT ?auto_33157 ?auto_33163 ) ( CLEAR ?auto_33157 ) ( IS-CRATE ?auto_33158 ) ( not ( = ?auto_33157 ?auto_33158 ) ) ( AVAILABLE ?auto_33162 ) ( ON ?auto_33157 ?auto_33156 ) ( not ( = ?auto_33156 ?auto_33157 ) ) ( not ( = ?auto_33156 ?auto_33158 ) ) ( not ( = ?auto_33164 ?auto_33163 ) ) ( HOIST-AT ?auto_33160 ?auto_33164 ) ( not ( = ?auto_33162 ?auto_33160 ) ) ( AVAILABLE ?auto_33160 ) ( SURFACE-AT ?auto_33158 ?auto_33164 ) ( ON ?auto_33158 ?auto_33159 ) ( CLEAR ?auto_33158 ) ( not ( = ?auto_33157 ?auto_33159 ) ) ( not ( = ?auto_33158 ?auto_33159 ) ) ( not ( = ?auto_33156 ?auto_33159 ) ) ( TRUCK-AT ?auto_33161 ?auto_33163 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33157 ?auto_33158 )
      ( MAKE-2CRATE-VERIFY ?auto_33156 ?auto_33157 ?auto_33158 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33165 - SURFACE
      ?auto_33166 - SURFACE
      ?auto_33167 - SURFACE
      ?auto_33168 - SURFACE
    )
    :vars
    (
      ?auto_33170 - HOIST
      ?auto_33169 - PLACE
      ?auto_33172 - PLACE
      ?auto_33173 - HOIST
      ?auto_33171 - SURFACE
      ?auto_33174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33170 ?auto_33169 ) ( SURFACE-AT ?auto_33167 ?auto_33169 ) ( CLEAR ?auto_33167 ) ( IS-CRATE ?auto_33168 ) ( not ( = ?auto_33167 ?auto_33168 ) ) ( AVAILABLE ?auto_33170 ) ( ON ?auto_33167 ?auto_33166 ) ( not ( = ?auto_33166 ?auto_33167 ) ) ( not ( = ?auto_33166 ?auto_33168 ) ) ( not ( = ?auto_33172 ?auto_33169 ) ) ( HOIST-AT ?auto_33173 ?auto_33172 ) ( not ( = ?auto_33170 ?auto_33173 ) ) ( AVAILABLE ?auto_33173 ) ( SURFACE-AT ?auto_33168 ?auto_33172 ) ( ON ?auto_33168 ?auto_33171 ) ( CLEAR ?auto_33168 ) ( not ( = ?auto_33167 ?auto_33171 ) ) ( not ( = ?auto_33168 ?auto_33171 ) ) ( not ( = ?auto_33166 ?auto_33171 ) ) ( TRUCK-AT ?auto_33174 ?auto_33169 ) ( ON ?auto_33166 ?auto_33165 ) ( not ( = ?auto_33165 ?auto_33166 ) ) ( not ( = ?auto_33165 ?auto_33167 ) ) ( not ( = ?auto_33165 ?auto_33168 ) ) ( not ( = ?auto_33165 ?auto_33171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33166 ?auto_33167 ?auto_33168 )
      ( MAKE-3CRATE-VERIFY ?auto_33165 ?auto_33166 ?auto_33167 ?auto_33168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33175 - SURFACE
      ?auto_33176 - SURFACE
    )
    :vars
    (
      ?auto_33179 - HOIST
      ?auto_33178 - PLACE
      ?auto_33177 - SURFACE
      ?auto_33181 - PLACE
      ?auto_33182 - HOIST
      ?auto_33180 - SURFACE
      ?auto_33183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33179 ?auto_33178 ) ( IS-CRATE ?auto_33176 ) ( not ( = ?auto_33175 ?auto_33176 ) ) ( not ( = ?auto_33177 ?auto_33175 ) ) ( not ( = ?auto_33177 ?auto_33176 ) ) ( not ( = ?auto_33181 ?auto_33178 ) ) ( HOIST-AT ?auto_33182 ?auto_33181 ) ( not ( = ?auto_33179 ?auto_33182 ) ) ( AVAILABLE ?auto_33182 ) ( SURFACE-AT ?auto_33176 ?auto_33181 ) ( ON ?auto_33176 ?auto_33180 ) ( CLEAR ?auto_33176 ) ( not ( = ?auto_33175 ?auto_33180 ) ) ( not ( = ?auto_33176 ?auto_33180 ) ) ( not ( = ?auto_33177 ?auto_33180 ) ) ( TRUCK-AT ?auto_33183 ?auto_33178 ) ( SURFACE-AT ?auto_33177 ?auto_33178 ) ( CLEAR ?auto_33177 ) ( LIFTING ?auto_33179 ?auto_33175 ) ( IS-CRATE ?auto_33175 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33177 ?auto_33175 )
      ( MAKE-2CRATE ?auto_33177 ?auto_33175 ?auto_33176 )
      ( MAKE-1CRATE-VERIFY ?auto_33175 ?auto_33176 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33184 - SURFACE
      ?auto_33185 - SURFACE
      ?auto_33186 - SURFACE
    )
    :vars
    (
      ?auto_33190 - HOIST
      ?auto_33188 - PLACE
      ?auto_33187 - PLACE
      ?auto_33191 - HOIST
      ?auto_33192 - SURFACE
      ?auto_33189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33190 ?auto_33188 ) ( IS-CRATE ?auto_33186 ) ( not ( = ?auto_33185 ?auto_33186 ) ) ( not ( = ?auto_33184 ?auto_33185 ) ) ( not ( = ?auto_33184 ?auto_33186 ) ) ( not ( = ?auto_33187 ?auto_33188 ) ) ( HOIST-AT ?auto_33191 ?auto_33187 ) ( not ( = ?auto_33190 ?auto_33191 ) ) ( AVAILABLE ?auto_33191 ) ( SURFACE-AT ?auto_33186 ?auto_33187 ) ( ON ?auto_33186 ?auto_33192 ) ( CLEAR ?auto_33186 ) ( not ( = ?auto_33185 ?auto_33192 ) ) ( not ( = ?auto_33186 ?auto_33192 ) ) ( not ( = ?auto_33184 ?auto_33192 ) ) ( TRUCK-AT ?auto_33189 ?auto_33188 ) ( SURFACE-AT ?auto_33184 ?auto_33188 ) ( CLEAR ?auto_33184 ) ( LIFTING ?auto_33190 ?auto_33185 ) ( IS-CRATE ?auto_33185 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33185 ?auto_33186 )
      ( MAKE-2CRATE-VERIFY ?auto_33184 ?auto_33185 ?auto_33186 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33193 - SURFACE
      ?auto_33194 - SURFACE
      ?auto_33195 - SURFACE
      ?auto_33196 - SURFACE
    )
    :vars
    (
      ?auto_33200 - HOIST
      ?auto_33201 - PLACE
      ?auto_33198 - PLACE
      ?auto_33197 - HOIST
      ?auto_33202 - SURFACE
      ?auto_33199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33200 ?auto_33201 ) ( IS-CRATE ?auto_33196 ) ( not ( = ?auto_33195 ?auto_33196 ) ) ( not ( = ?auto_33194 ?auto_33195 ) ) ( not ( = ?auto_33194 ?auto_33196 ) ) ( not ( = ?auto_33198 ?auto_33201 ) ) ( HOIST-AT ?auto_33197 ?auto_33198 ) ( not ( = ?auto_33200 ?auto_33197 ) ) ( AVAILABLE ?auto_33197 ) ( SURFACE-AT ?auto_33196 ?auto_33198 ) ( ON ?auto_33196 ?auto_33202 ) ( CLEAR ?auto_33196 ) ( not ( = ?auto_33195 ?auto_33202 ) ) ( not ( = ?auto_33196 ?auto_33202 ) ) ( not ( = ?auto_33194 ?auto_33202 ) ) ( TRUCK-AT ?auto_33199 ?auto_33201 ) ( SURFACE-AT ?auto_33194 ?auto_33201 ) ( CLEAR ?auto_33194 ) ( LIFTING ?auto_33200 ?auto_33195 ) ( IS-CRATE ?auto_33195 ) ( ON ?auto_33194 ?auto_33193 ) ( not ( = ?auto_33193 ?auto_33194 ) ) ( not ( = ?auto_33193 ?auto_33195 ) ) ( not ( = ?auto_33193 ?auto_33196 ) ) ( not ( = ?auto_33193 ?auto_33202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33194 ?auto_33195 ?auto_33196 )
      ( MAKE-3CRATE-VERIFY ?auto_33193 ?auto_33194 ?auto_33195 ?auto_33196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33203 - SURFACE
      ?auto_33204 - SURFACE
    )
    :vars
    (
      ?auto_33209 - HOIST
      ?auto_33210 - PLACE
      ?auto_33205 - SURFACE
      ?auto_33207 - PLACE
      ?auto_33206 - HOIST
      ?auto_33211 - SURFACE
      ?auto_33208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33209 ?auto_33210 ) ( IS-CRATE ?auto_33204 ) ( not ( = ?auto_33203 ?auto_33204 ) ) ( not ( = ?auto_33205 ?auto_33203 ) ) ( not ( = ?auto_33205 ?auto_33204 ) ) ( not ( = ?auto_33207 ?auto_33210 ) ) ( HOIST-AT ?auto_33206 ?auto_33207 ) ( not ( = ?auto_33209 ?auto_33206 ) ) ( AVAILABLE ?auto_33206 ) ( SURFACE-AT ?auto_33204 ?auto_33207 ) ( ON ?auto_33204 ?auto_33211 ) ( CLEAR ?auto_33204 ) ( not ( = ?auto_33203 ?auto_33211 ) ) ( not ( = ?auto_33204 ?auto_33211 ) ) ( not ( = ?auto_33205 ?auto_33211 ) ) ( TRUCK-AT ?auto_33208 ?auto_33210 ) ( SURFACE-AT ?auto_33205 ?auto_33210 ) ( CLEAR ?auto_33205 ) ( IS-CRATE ?auto_33203 ) ( AVAILABLE ?auto_33209 ) ( IN ?auto_33203 ?auto_33208 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33209 ?auto_33203 ?auto_33208 ?auto_33210 )
      ( MAKE-2CRATE ?auto_33205 ?auto_33203 ?auto_33204 )
      ( MAKE-1CRATE-VERIFY ?auto_33203 ?auto_33204 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33212 - SURFACE
      ?auto_33213 - SURFACE
      ?auto_33214 - SURFACE
    )
    :vars
    (
      ?auto_33217 - HOIST
      ?auto_33218 - PLACE
      ?auto_33215 - PLACE
      ?auto_33220 - HOIST
      ?auto_33216 - SURFACE
      ?auto_33219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33217 ?auto_33218 ) ( IS-CRATE ?auto_33214 ) ( not ( = ?auto_33213 ?auto_33214 ) ) ( not ( = ?auto_33212 ?auto_33213 ) ) ( not ( = ?auto_33212 ?auto_33214 ) ) ( not ( = ?auto_33215 ?auto_33218 ) ) ( HOIST-AT ?auto_33220 ?auto_33215 ) ( not ( = ?auto_33217 ?auto_33220 ) ) ( AVAILABLE ?auto_33220 ) ( SURFACE-AT ?auto_33214 ?auto_33215 ) ( ON ?auto_33214 ?auto_33216 ) ( CLEAR ?auto_33214 ) ( not ( = ?auto_33213 ?auto_33216 ) ) ( not ( = ?auto_33214 ?auto_33216 ) ) ( not ( = ?auto_33212 ?auto_33216 ) ) ( TRUCK-AT ?auto_33219 ?auto_33218 ) ( SURFACE-AT ?auto_33212 ?auto_33218 ) ( CLEAR ?auto_33212 ) ( IS-CRATE ?auto_33213 ) ( AVAILABLE ?auto_33217 ) ( IN ?auto_33213 ?auto_33219 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33213 ?auto_33214 )
      ( MAKE-2CRATE-VERIFY ?auto_33212 ?auto_33213 ?auto_33214 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33221 - SURFACE
      ?auto_33222 - SURFACE
      ?auto_33223 - SURFACE
      ?auto_33224 - SURFACE
    )
    :vars
    (
      ?auto_33226 - HOIST
      ?auto_33229 - PLACE
      ?auto_33227 - PLACE
      ?auto_33230 - HOIST
      ?auto_33228 - SURFACE
      ?auto_33225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33226 ?auto_33229 ) ( IS-CRATE ?auto_33224 ) ( not ( = ?auto_33223 ?auto_33224 ) ) ( not ( = ?auto_33222 ?auto_33223 ) ) ( not ( = ?auto_33222 ?auto_33224 ) ) ( not ( = ?auto_33227 ?auto_33229 ) ) ( HOIST-AT ?auto_33230 ?auto_33227 ) ( not ( = ?auto_33226 ?auto_33230 ) ) ( AVAILABLE ?auto_33230 ) ( SURFACE-AT ?auto_33224 ?auto_33227 ) ( ON ?auto_33224 ?auto_33228 ) ( CLEAR ?auto_33224 ) ( not ( = ?auto_33223 ?auto_33228 ) ) ( not ( = ?auto_33224 ?auto_33228 ) ) ( not ( = ?auto_33222 ?auto_33228 ) ) ( TRUCK-AT ?auto_33225 ?auto_33229 ) ( SURFACE-AT ?auto_33222 ?auto_33229 ) ( CLEAR ?auto_33222 ) ( IS-CRATE ?auto_33223 ) ( AVAILABLE ?auto_33226 ) ( IN ?auto_33223 ?auto_33225 ) ( ON ?auto_33222 ?auto_33221 ) ( not ( = ?auto_33221 ?auto_33222 ) ) ( not ( = ?auto_33221 ?auto_33223 ) ) ( not ( = ?auto_33221 ?auto_33224 ) ) ( not ( = ?auto_33221 ?auto_33228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33222 ?auto_33223 ?auto_33224 )
      ( MAKE-3CRATE-VERIFY ?auto_33221 ?auto_33222 ?auto_33223 ?auto_33224 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33231 - SURFACE
      ?auto_33232 - SURFACE
    )
    :vars
    (
      ?auto_33234 - HOIST
      ?auto_33237 - PLACE
      ?auto_33239 - SURFACE
      ?auto_33235 - PLACE
      ?auto_33238 - HOIST
      ?auto_33236 - SURFACE
      ?auto_33233 - TRUCK
      ?auto_33240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33234 ?auto_33237 ) ( IS-CRATE ?auto_33232 ) ( not ( = ?auto_33231 ?auto_33232 ) ) ( not ( = ?auto_33239 ?auto_33231 ) ) ( not ( = ?auto_33239 ?auto_33232 ) ) ( not ( = ?auto_33235 ?auto_33237 ) ) ( HOIST-AT ?auto_33238 ?auto_33235 ) ( not ( = ?auto_33234 ?auto_33238 ) ) ( AVAILABLE ?auto_33238 ) ( SURFACE-AT ?auto_33232 ?auto_33235 ) ( ON ?auto_33232 ?auto_33236 ) ( CLEAR ?auto_33232 ) ( not ( = ?auto_33231 ?auto_33236 ) ) ( not ( = ?auto_33232 ?auto_33236 ) ) ( not ( = ?auto_33239 ?auto_33236 ) ) ( SURFACE-AT ?auto_33239 ?auto_33237 ) ( CLEAR ?auto_33239 ) ( IS-CRATE ?auto_33231 ) ( AVAILABLE ?auto_33234 ) ( IN ?auto_33231 ?auto_33233 ) ( TRUCK-AT ?auto_33233 ?auto_33240 ) ( not ( = ?auto_33240 ?auto_33237 ) ) ( not ( = ?auto_33235 ?auto_33240 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33233 ?auto_33240 ?auto_33237 )
      ( MAKE-2CRATE ?auto_33239 ?auto_33231 ?auto_33232 )
      ( MAKE-1CRATE-VERIFY ?auto_33231 ?auto_33232 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33241 - SURFACE
      ?auto_33242 - SURFACE
      ?auto_33243 - SURFACE
    )
    :vars
    (
      ?auto_33248 - HOIST
      ?auto_33247 - PLACE
      ?auto_33245 - PLACE
      ?auto_33244 - HOIST
      ?auto_33250 - SURFACE
      ?auto_33249 - TRUCK
      ?auto_33246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33248 ?auto_33247 ) ( IS-CRATE ?auto_33243 ) ( not ( = ?auto_33242 ?auto_33243 ) ) ( not ( = ?auto_33241 ?auto_33242 ) ) ( not ( = ?auto_33241 ?auto_33243 ) ) ( not ( = ?auto_33245 ?auto_33247 ) ) ( HOIST-AT ?auto_33244 ?auto_33245 ) ( not ( = ?auto_33248 ?auto_33244 ) ) ( AVAILABLE ?auto_33244 ) ( SURFACE-AT ?auto_33243 ?auto_33245 ) ( ON ?auto_33243 ?auto_33250 ) ( CLEAR ?auto_33243 ) ( not ( = ?auto_33242 ?auto_33250 ) ) ( not ( = ?auto_33243 ?auto_33250 ) ) ( not ( = ?auto_33241 ?auto_33250 ) ) ( SURFACE-AT ?auto_33241 ?auto_33247 ) ( CLEAR ?auto_33241 ) ( IS-CRATE ?auto_33242 ) ( AVAILABLE ?auto_33248 ) ( IN ?auto_33242 ?auto_33249 ) ( TRUCK-AT ?auto_33249 ?auto_33246 ) ( not ( = ?auto_33246 ?auto_33247 ) ) ( not ( = ?auto_33245 ?auto_33246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33242 ?auto_33243 )
      ( MAKE-2CRATE-VERIFY ?auto_33241 ?auto_33242 ?auto_33243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33251 - SURFACE
      ?auto_33252 - SURFACE
      ?auto_33253 - SURFACE
      ?auto_33254 - SURFACE
    )
    :vars
    (
      ?auto_33257 - HOIST
      ?auto_33258 - PLACE
      ?auto_33261 - PLACE
      ?auto_33260 - HOIST
      ?auto_33259 - SURFACE
      ?auto_33255 - TRUCK
      ?auto_33256 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33257 ?auto_33258 ) ( IS-CRATE ?auto_33254 ) ( not ( = ?auto_33253 ?auto_33254 ) ) ( not ( = ?auto_33252 ?auto_33253 ) ) ( not ( = ?auto_33252 ?auto_33254 ) ) ( not ( = ?auto_33261 ?auto_33258 ) ) ( HOIST-AT ?auto_33260 ?auto_33261 ) ( not ( = ?auto_33257 ?auto_33260 ) ) ( AVAILABLE ?auto_33260 ) ( SURFACE-AT ?auto_33254 ?auto_33261 ) ( ON ?auto_33254 ?auto_33259 ) ( CLEAR ?auto_33254 ) ( not ( = ?auto_33253 ?auto_33259 ) ) ( not ( = ?auto_33254 ?auto_33259 ) ) ( not ( = ?auto_33252 ?auto_33259 ) ) ( SURFACE-AT ?auto_33252 ?auto_33258 ) ( CLEAR ?auto_33252 ) ( IS-CRATE ?auto_33253 ) ( AVAILABLE ?auto_33257 ) ( IN ?auto_33253 ?auto_33255 ) ( TRUCK-AT ?auto_33255 ?auto_33256 ) ( not ( = ?auto_33256 ?auto_33258 ) ) ( not ( = ?auto_33261 ?auto_33256 ) ) ( ON ?auto_33252 ?auto_33251 ) ( not ( = ?auto_33251 ?auto_33252 ) ) ( not ( = ?auto_33251 ?auto_33253 ) ) ( not ( = ?auto_33251 ?auto_33254 ) ) ( not ( = ?auto_33251 ?auto_33259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33252 ?auto_33253 ?auto_33254 )
      ( MAKE-3CRATE-VERIFY ?auto_33251 ?auto_33252 ?auto_33253 ?auto_33254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33262 - SURFACE
      ?auto_33263 - SURFACE
    )
    :vars
    (
      ?auto_33267 - HOIST
      ?auto_33268 - PLACE
      ?auto_33266 - SURFACE
      ?auto_33271 - PLACE
      ?auto_33270 - HOIST
      ?auto_33269 - SURFACE
      ?auto_33264 - TRUCK
      ?auto_33265 - PLACE
      ?auto_33272 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33267 ?auto_33268 ) ( IS-CRATE ?auto_33263 ) ( not ( = ?auto_33262 ?auto_33263 ) ) ( not ( = ?auto_33266 ?auto_33262 ) ) ( not ( = ?auto_33266 ?auto_33263 ) ) ( not ( = ?auto_33271 ?auto_33268 ) ) ( HOIST-AT ?auto_33270 ?auto_33271 ) ( not ( = ?auto_33267 ?auto_33270 ) ) ( AVAILABLE ?auto_33270 ) ( SURFACE-AT ?auto_33263 ?auto_33271 ) ( ON ?auto_33263 ?auto_33269 ) ( CLEAR ?auto_33263 ) ( not ( = ?auto_33262 ?auto_33269 ) ) ( not ( = ?auto_33263 ?auto_33269 ) ) ( not ( = ?auto_33266 ?auto_33269 ) ) ( SURFACE-AT ?auto_33266 ?auto_33268 ) ( CLEAR ?auto_33266 ) ( IS-CRATE ?auto_33262 ) ( AVAILABLE ?auto_33267 ) ( TRUCK-AT ?auto_33264 ?auto_33265 ) ( not ( = ?auto_33265 ?auto_33268 ) ) ( not ( = ?auto_33271 ?auto_33265 ) ) ( HOIST-AT ?auto_33272 ?auto_33265 ) ( LIFTING ?auto_33272 ?auto_33262 ) ( not ( = ?auto_33267 ?auto_33272 ) ) ( not ( = ?auto_33270 ?auto_33272 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33272 ?auto_33262 ?auto_33264 ?auto_33265 )
      ( MAKE-2CRATE ?auto_33266 ?auto_33262 ?auto_33263 )
      ( MAKE-1CRATE-VERIFY ?auto_33262 ?auto_33263 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33273 - SURFACE
      ?auto_33274 - SURFACE
      ?auto_33275 - SURFACE
    )
    :vars
    (
      ?auto_33281 - HOIST
      ?auto_33279 - PLACE
      ?auto_33280 - PLACE
      ?auto_33282 - HOIST
      ?auto_33277 - SURFACE
      ?auto_33278 - TRUCK
      ?auto_33283 - PLACE
      ?auto_33276 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33281 ?auto_33279 ) ( IS-CRATE ?auto_33275 ) ( not ( = ?auto_33274 ?auto_33275 ) ) ( not ( = ?auto_33273 ?auto_33274 ) ) ( not ( = ?auto_33273 ?auto_33275 ) ) ( not ( = ?auto_33280 ?auto_33279 ) ) ( HOIST-AT ?auto_33282 ?auto_33280 ) ( not ( = ?auto_33281 ?auto_33282 ) ) ( AVAILABLE ?auto_33282 ) ( SURFACE-AT ?auto_33275 ?auto_33280 ) ( ON ?auto_33275 ?auto_33277 ) ( CLEAR ?auto_33275 ) ( not ( = ?auto_33274 ?auto_33277 ) ) ( not ( = ?auto_33275 ?auto_33277 ) ) ( not ( = ?auto_33273 ?auto_33277 ) ) ( SURFACE-AT ?auto_33273 ?auto_33279 ) ( CLEAR ?auto_33273 ) ( IS-CRATE ?auto_33274 ) ( AVAILABLE ?auto_33281 ) ( TRUCK-AT ?auto_33278 ?auto_33283 ) ( not ( = ?auto_33283 ?auto_33279 ) ) ( not ( = ?auto_33280 ?auto_33283 ) ) ( HOIST-AT ?auto_33276 ?auto_33283 ) ( LIFTING ?auto_33276 ?auto_33274 ) ( not ( = ?auto_33281 ?auto_33276 ) ) ( not ( = ?auto_33282 ?auto_33276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33274 ?auto_33275 )
      ( MAKE-2CRATE-VERIFY ?auto_33273 ?auto_33274 ?auto_33275 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33284 - SURFACE
      ?auto_33285 - SURFACE
      ?auto_33286 - SURFACE
      ?auto_33287 - SURFACE
    )
    :vars
    (
      ?auto_33289 - HOIST
      ?auto_33292 - PLACE
      ?auto_33288 - PLACE
      ?auto_33294 - HOIST
      ?auto_33295 - SURFACE
      ?auto_33291 - TRUCK
      ?auto_33290 - PLACE
      ?auto_33293 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33289 ?auto_33292 ) ( IS-CRATE ?auto_33287 ) ( not ( = ?auto_33286 ?auto_33287 ) ) ( not ( = ?auto_33285 ?auto_33286 ) ) ( not ( = ?auto_33285 ?auto_33287 ) ) ( not ( = ?auto_33288 ?auto_33292 ) ) ( HOIST-AT ?auto_33294 ?auto_33288 ) ( not ( = ?auto_33289 ?auto_33294 ) ) ( AVAILABLE ?auto_33294 ) ( SURFACE-AT ?auto_33287 ?auto_33288 ) ( ON ?auto_33287 ?auto_33295 ) ( CLEAR ?auto_33287 ) ( not ( = ?auto_33286 ?auto_33295 ) ) ( not ( = ?auto_33287 ?auto_33295 ) ) ( not ( = ?auto_33285 ?auto_33295 ) ) ( SURFACE-AT ?auto_33285 ?auto_33292 ) ( CLEAR ?auto_33285 ) ( IS-CRATE ?auto_33286 ) ( AVAILABLE ?auto_33289 ) ( TRUCK-AT ?auto_33291 ?auto_33290 ) ( not ( = ?auto_33290 ?auto_33292 ) ) ( not ( = ?auto_33288 ?auto_33290 ) ) ( HOIST-AT ?auto_33293 ?auto_33290 ) ( LIFTING ?auto_33293 ?auto_33286 ) ( not ( = ?auto_33289 ?auto_33293 ) ) ( not ( = ?auto_33294 ?auto_33293 ) ) ( ON ?auto_33285 ?auto_33284 ) ( not ( = ?auto_33284 ?auto_33285 ) ) ( not ( = ?auto_33284 ?auto_33286 ) ) ( not ( = ?auto_33284 ?auto_33287 ) ) ( not ( = ?auto_33284 ?auto_33295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33285 ?auto_33286 ?auto_33287 )
      ( MAKE-3CRATE-VERIFY ?auto_33284 ?auto_33285 ?auto_33286 ?auto_33287 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33296 - SURFACE
      ?auto_33297 - SURFACE
    )
    :vars
    (
      ?auto_33299 - HOIST
      ?auto_33302 - PLACE
      ?auto_33303 - SURFACE
      ?auto_33298 - PLACE
      ?auto_33305 - HOIST
      ?auto_33306 - SURFACE
      ?auto_33301 - TRUCK
      ?auto_33300 - PLACE
      ?auto_33304 - HOIST
      ?auto_33307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33299 ?auto_33302 ) ( IS-CRATE ?auto_33297 ) ( not ( = ?auto_33296 ?auto_33297 ) ) ( not ( = ?auto_33303 ?auto_33296 ) ) ( not ( = ?auto_33303 ?auto_33297 ) ) ( not ( = ?auto_33298 ?auto_33302 ) ) ( HOIST-AT ?auto_33305 ?auto_33298 ) ( not ( = ?auto_33299 ?auto_33305 ) ) ( AVAILABLE ?auto_33305 ) ( SURFACE-AT ?auto_33297 ?auto_33298 ) ( ON ?auto_33297 ?auto_33306 ) ( CLEAR ?auto_33297 ) ( not ( = ?auto_33296 ?auto_33306 ) ) ( not ( = ?auto_33297 ?auto_33306 ) ) ( not ( = ?auto_33303 ?auto_33306 ) ) ( SURFACE-AT ?auto_33303 ?auto_33302 ) ( CLEAR ?auto_33303 ) ( IS-CRATE ?auto_33296 ) ( AVAILABLE ?auto_33299 ) ( TRUCK-AT ?auto_33301 ?auto_33300 ) ( not ( = ?auto_33300 ?auto_33302 ) ) ( not ( = ?auto_33298 ?auto_33300 ) ) ( HOIST-AT ?auto_33304 ?auto_33300 ) ( not ( = ?auto_33299 ?auto_33304 ) ) ( not ( = ?auto_33305 ?auto_33304 ) ) ( AVAILABLE ?auto_33304 ) ( SURFACE-AT ?auto_33296 ?auto_33300 ) ( ON ?auto_33296 ?auto_33307 ) ( CLEAR ?auto_33296 ) ( not ( = ?auto_33296 ?auto_33307 ) ) ( not ( = ?auto_33297 ?auto_33307 ) ) ( not ( = ?auto_33303 ?auto_33307 ) ) ( not ( = ?auto_33306 ?auto_33307 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33304 ?auto_33296 ?auto_33307 ?auto_33300 )
      ( MAKE-2CRATE ?auto_33303 ?auto_33296 ?auto_33297 )
      ( MAKE-1CRATE-VERIFY ?auto_33296 ?auto_33297 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33308 - SURFACE
      ?auto_33309 - SURFACE
      ?auto_33310 - SURFACE
    )
    :vars
    (
      ?auto_33314 - HOIST
      ?auto_33319 - PLACE
      ?auto_33315 - PLACE
      ?auto_33311 - HOIST
      ?auto_33316 - SURFACE
      ?auto_33312 - TRUCK
      ?auto_33313 - PLACE
      ?auto_33317 - HOIST
      ?auto_33318 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33314 ?auto_33319 ) ( IS-CRATE ?auto_33310 ) ( not ( = ?auto_33309 ?auto_33310 ) ) ( not ( = ?auto_33308 ?auto_33309 ) ) ( not ( = ?auto_33308 ?auto_33310 ) ) ( not ( = ?auto_33315 ?auto_33319 ) ) ( HOIST-AT ?auto_33311 ?auto_33315 ) ( not ( = ?auto_33314 ?auto_33311 ) ) ( AVAILABLE ?auto_33311 ) ( SURFACE-AT ?auto_33310 ?auto_33315 ) ( ON ?auto_33310 ?auto_33316 ) ( CLEAR ?auto_33310 ) ( not ( = ?auto_33309 ?auto_33316 ) ) ( not ( = ?auto_33310 ?auto_33316 ) ) ( not ( = ?auto_33308 ?auto_33316 ) ) ( SURFACE-AT ?auto_33308 ?auto_33319 ) ( CLEAR ?auto_33308 ) ( IS-CRATE ?auto_33309 ) ( AVAILABLE ?auto_33314 ) ( TRUCK-AT ?auto_33312 ?auto_33313 ) ( not ( = ?auto_33313 ?auto_33319 ) ) ( not ( = ?auto_33315 ?auto_33313 ) ) ( HOIST-AT ?auto_33317 ?auto_33313 ) ( not ( = ?auto_33314 ?auto_33317 ) ) ( not ( = ?auto_33311 ?auto_33317 ) ) ( AVAILABLE ?auto_33317 ) ( SURFACE-AT ?auto_33309 ?auto_33313 ) ( ON ?auto_33309 ?auto_33318 ) ( CLEAR ?auto_33309 ) ( not ( = ?auto_33309 ?auto_33318 ) ) ( not ( = ?auto_33310 ?auto_33318 ) ) ( not ( = ?auto_33308 ?auto_33318 ) ) ( not ( = ?auto_33316 ?auto_33318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33309 ?auto_33310 )
      ( MAKE-2CRATE-VERIFY ?auto_33308 ?auto_33309 ?auto_33310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33320 - SURFACE
      ?auto_33321 - SURFACE
      ?auto_33322 - SURFACE
      ?auto_33323 - SURFACE
    )
    :vars
    (
      ?auto_33327 - HOIST
      ?auto_33325 - PLACE
      ?auto_33326 - PLACE
      ?auto_33329 - HOIST
      ?auto_33328 - SURFACE
      ?auto_33330 - TRUCK
      ?auto_33324 - PLACE
      ?auto_33332 - HOIST
      ?auto_33331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33327 ?auto_33325 ) ( IS-CRATE ?auto_33323 ) ( not ( = ?auto_33322 ?auto_33323 ) ) ( not ( = ?auto_33321 ?auto_33322 ) ) ( not ( = ?auto_33321 ?auto_33323 ) ) ( not ( = ?auto_33326 ?auto_33325 ) ) ( HOIST-AT ?auto_33329 ?auto_33326 ) ( not ( = ?auto_33327 ?auto_33329 ) ) ( AVAILABLE ?auto_33329 ) ( SURFACE-AT ?auto_33323 ?auto_33326 ) ( ON ?auto_33323 ?auto_33328 ) ( CLEAR ?auto_33323 ) ( not ( = ?auto_33322 ?auto_33328 ) ) ( not ( = ?auto_33323 ?auto_33328 ) ) ( not ( = ?auto_33321 ?auto_33328 ) ) ( SURFACE-AT ?auto_33321 ?auto_33325 ) ( CLEAR ?auto_33321 ) ( IS-CRATE ?auto_33322 ) ( AVAILABLE ?auto_33327 ) ( TRUCK-AT ?auto_33330 ?auto_33324 ) ( not ( = ?auto_33324 ?auto_33325 ) ) ( not ( = ?auto_33326 ?auto_33324 ) ) ( HOIST-AT ?auto_33332 ?auto_33324 ) ( not ( = ?auto_33327 ?auto_33332 ) ) ( not ( = ?auto_33329 ?auto_33332 ) ) ( AVAILABLE ?auto_33332 ) ( SURFACE-AT ?auto_33322 ?auto_33324 ) ( ON ?auto_33322 ?auto_33331 ) ( CLEAR ?auto_33322 ) ( not ( = ?auto_33322 ?auto_33331 ) ) ( not ( = ?auto_33323 ?auto_33331 ) ) ( not ( = ?auto_33321 ?auto_33331 ) ) ( not ( = ?auto_33328 ?auto_33331 ) ) ( ON ?auto_33321 ?auto_33320 ) ( not ( = ?auto_33320 ?auto_33321 ) ) ( not ( = ?auto_33320 ?auto_33322 ) ) ( not ( = ?auto_33320 ?auto_33323 ) ) ( not ( = ?auto_33320 ?auto_33328 ) ) ( not ( = ?auto_33320 ?auto_33331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33321 ?auto_33322 ?auto_33323 )
      ( MAKE-3CRATE-VERIFY ?auto_33320 ?auto_33321 ?auto_33322 ?auto_33323 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33333 - SURFACE
      ?auto_33334 - SURFACE
    )
    :vars
    (
      ?auto_33338 - HOIST
      ?auto_33336 - PLACE
      ?auto_33342 - SURFACE
      ?auto_33337 - PLACE
      ?auto_33340 - HOIST
      ?auto_33339 - SURFACE
      ?auto_33335 - PLACE
      ?auto_33344 - HOIST
      ?auto_33343 - SURFACE
      ?auto_33341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33338 ?auto_33336 ) ( IS-CRATE ?auto_33334 ) ( not ( = ?auto_33333 ?auto_33334 ) ) ( not ( = ?auto_33342 ?auto_33333 ) ) ( not ( = ?auto_33342 ?auto_33334 ) ) ( not ( = ?auto_33337 ?auto_33336 ) ) ( HOIST-AT ?auto_33340 ?auto_33337 ) ( not ( = ?auto_33338 ?auto_33340 ) ) ( AVAILABLE ?auto_33340 ) ( SURFACE-AT ?auto_33334 ?auto_33337 ) ( ON ?auto_33334 ?auto_33339 ) ( CLEAR ?auto_33334 ) ( not ( = ?auto_33333 ?auto_33339 ) ) ( not ( = ?auto_33334 ?auto_33339 ) ) ( not ( = ?auto_33342 ?auto_33339 ) ) ( SURFACE-AT ?auto_33342 ?auto_33336 ) ( CLEAR ?auto_33342 ) ( IS-CRATE ?auto_33333 ) ( AVAILABLE ?auto_33338 ) ( not ( = ?auto_33335 ?auto_33336 ) ) ( not ( = ?auto_33337 ?auto_33335 ) ) ( HOIST-AT ?auto_33344 ?auto_33335 ) ( not ( = ?auto_33338 ?auto_33344 ) ) ( not ( = ?auto_33340 ?auto_33344 ) ) ( AVAILABLE ?auto_33344 ) ( SURFACE-AT ?auto_33333 ?auto_33335 ) ( ON ?auto_33333 ?auto_33343 ) ( CLEAR ?auto_33333 ) ( not ( = ?auto_33333 ?auto_33343 ) ) ( not ( = ?auto_33334 ?auto_33343 ) ) ( not ( = ?auto_33342 ?auto_33343 ) ) ( not ( = ?auto_33339 ?auto_33343 ) ) ( TRUCK-AT ?auto_33341 ?auto_33336 ) )
    :subtasks
    ( ( !DRIVE ?auto_33341 ?auto_33336 ?auto_33335 )
      ( MAKE-2CRATE ?auto_33342 ?auto_33333 ?auto_33334 )
      ( MAKE-1CRATE-VERIFY ?auto_33333 ?auto_33334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33345 - SURFACE
      ?auto_33346 - SURFACE
      ?auto_33347 - SURFACE
    )
    :vars
    (
      ?auto_33350 - HOIST
      ?auto_33352 - PLACE
      ?auto_33351 - PLACE
      ?auto_33355 - HOIST
      ?auto_33348 - SURFACE
      ?auto_33353 - PLACE
      ?auto_33356 - HOIST
      ?auto_33349 - SURFACE
      ?auto_33354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33350 ?auto_33352 ) ( IS-CRATE ?auto_33347 ) ( not ( = ?auto_33346 ?auto_33347 ) ) ( not ( = ?auto_33345 ?auto_33346 ) ) ( not ( = ?auto_33345 ?auto_33347 ) ) ( not ( = ?auto_33351 ?auto_33352 ) ) ( HOIST-AT ?auto_33355 ?auto_33351 ) ( not ( = ?auto_33350 ?auto_33355 ) ) ( AVAILABLE ?auto_33355 ) ( SURFACE-AT ?auto_33347 ?auto_33351 ) ( ON ?auto_33347 ?auto_33348 ) ( CLEAR ?auto_33347 ) ( not ( = ?auto_33346 ?auto_33348 ) ) ( not ( = ?auto_33347 ?auto_33348 ) ) ( not ( = ?auto_33345 ?auto_33348 ) ) ( SURFACE-AT ?auto_33345 ?auto_33352 ) ( CLEAR ?auto_33345 ) ( IS-CRATE ?auto_33346 ) ( AVAILABLE ?auto_33350 ) ( not ( = ?auto_33353 ?auto_33352 ) ) ( not ( = ?auto_33351 ?auto_33353 ) ) ( HOIST-AT ?auto_33356 ?auto_33353 ) ( not ( = ?auto_33350 ?auto_33356 ) ) ( not ( = ?auto_33355 ?auto_33356 ) ) ( AVAILABLE ?auto_33356 ) ( SURFACE-AT ?auto_33346 ?auto_33353 ) ( ON ?auto_33346 ?auto_33349 ) ( CLEAR ?auto_33346 ) ( not ( = ?auto_33346 ?auto_33349 ) ) ( not ( = ?auto_33347 ?auto_33349 ) ) ( not ( = ?auto_33345 ?auto_33349 ) ) ( not ( = ?auto_33348 ?auto_33349 ) ) ( TRUCK-AT ?auto_33354 ?auto_33352 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33346 ?auto_33347 )
      ( MAKE-2CRATE-VERIFY ?auto_33345 ?auto_33346 ?auto_33347 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33357 - SURFACE
      ?auto_33358 - SURFACE
      ?auto_33359 - SURFACE
      ?auto_33360 - SURFACE
    )
    :vars
    (
      ?auto_33366 - HOIST
      ?auto_33367 - PLACE
      ?auto_33368 - PLACE
      ?auto_33364 - HOIST
      ?auto_33365 - SURFACE
      ?auto_33369 - PLACE
      ?auto_33361 - HOIST
      ?auto_33363 - SURFACE
      ?auto_33362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33366 ?auto_33367 ) ( IS-CRATE ?auto_33360 ) ( not ( = ?auto_33359 ?auto_33360 ) ) ( not ( = ?auto_33358 ?auto_33359 ) ) ( not ( = ?auto_33358 ?auto_33360 ) ) ( not ( = ?auto_33368 ?auto_33367 ) ) ( HOIST-AT ?auto_33364 ?auto_33368 ) ( not ( = ?auto_33366 ?auto_33364 ) ) ( AVAILABLE ?auto_33364 ) ( SURFACE-AT ?auto_33360 ?auto_33368 ) ( ON ?auto_33360 ?auto_33365 ) ( CLEAR ?auto_33360 ) ( not ( = ?auto_33359 ?auto_33365 ) ) ( not ( = ?auto_33360 ?auto_33365 ) ) ( not ( = ?auto_33358 ?auto_33365 ) ) ( SURFACE-AT ?auto_33358 ?auto_33367 ) ( CLEAR ?auto_33358 ) ( IS-CRATE ?auto_33359 ) ( AVAILABLE ?auto_33366 ) ( not ( = ?auto_33369 ?auto_33367 ) ) ( not ( = ?auto_33368 ?auto_33369 ) ) ( HOIST-AT ?auto_33361 ?auto_33369 ) ( not ( = ?auto_33366 ?auto_33361 ) ) ( not ( = ?auto_33364 ?auto_33361 ) ) ( AVAILABLE ?auto_33361 ) ( SURFACE-AT ?auto_33359 ?auto_33369 ) ( ON ?auto_33359 ?auto_33363 ) ( CLEAR ?auto_33359 ) ( not ( = ?auto_33359 ?auto_33363 ) ) ( not ( = ?auto_33360 ?auto_33363 ) ) ( not ( = ?auto_33358 ?auto_33363 ) ) ( not ( = ?auto_33365 ?auto_33363 ) ) ( TRUCK-AT ?auto_33362 ?auto_33367 ) ( ON ?auto_33358 ?auto_33357 ) ( not ( = ?auto_33357 ?auto_33358 ) ) ( not ( = ?auto_33357 ?auto_33359 ) ) ( not ( = ?auto_33357 ?auto_33360 ) ) ( not ( = ?auto_33357 ?auto_33365 ) ) ( not ( = ?auto_33357 ?auto_33363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33358 ?auto_33359 ?auto_33360 )
      ( MAKE-3CRATE-VERIFY ?auto_33357 ?auto_33358 ?auto_33359 ?auto_33360 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33370 - SURFACE
      ?auto_33371 - SURFACE
    )
    :vars
    (
      ?auto_33377 - HOIST
      ?auto_33378 - PLACE
      ?auto_33380 - SURFACE
      ?auto_33379 - PLACE
      ?auto_33375 - HOIST
      ?auto_33376 - SURFACE
      ?auto_33381 - PLACE
      ?auto_33372 - HOIST
      ?auto_33374 - SURFACE
      ?auto_33373 - TRUCK
      ?auto_33382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33377 ?auto_33378 ) ( IS-CRATE ?auto_33371 ) ( not ( = ?auto_33370 ?auto_33371 ) ) ( not ( = ?auto_33380 ?auto_33370 ) ) ( not ( = ?auto_33380 ?auto_33371 ) ) ( not ( = ?auto_33379 ?auto_33378 ) ) ( HOIST-AT ?auto_33375 ?auto_33379 ) ( not ( = ?auto_33377 ?auto_33375 ) ) ( AVAILABLE ?auto_33375 ) ( SURFACE-AT ?auto_33371 ?auto_33379 ) ( ON ?auto_33371 ?auto_33376 ) ( CLEAR ?auto_33371 ) ( not ( = ?auto_33370 ?auto_33376 ) ) ( not ( = ?auto_33371 ?auto_33376 ) ) ( not ( = ?auto_33380 ?auto_33376 ) ) ( IS-CRATE ?auto_33370 ) ( not ( = ?auto_33381 ?auto_33378 ) ) ( not ( = ?auto_33379 ?auto_33381 ) ) ( HOIST-AT ?auto_33372 ?auto_33381 ) ( not ( = ?auto_33377 ?auto_33372 ) ) ( not ( = ?auto_33375 ?auto_33372 ) ) ( AVAILABLE ?auto_33372 ) ( SURFACE-AT ?auto_33370 ?auto_33381 ) ( ON ?auto_33370 ?auto_33374 ) ( CLEAR ?auto_33370 ) ( not ( = ?auto_33370 ?auto_33374 ) ) ( not ( = ?auto_33371 ?auto_33374 ) ) ( not ( = ?auto_33380 ?auto_33374 ) ) ( not ( = ?auto_33376 ?auto_33374 ) ) ( TRUCK-AT ?auto_33373 ?auto_33378 ) ( SURFACE-AT ?auto_33382 ?auto_33378 ) ( CLEAR ?auto_33382 ) ( LIFTING ?auto_33377 ?auto_33380 ) ( IS-CRATE ?auto_33380 ) ( not ( = ?auto_33382 ?auto_33380 ) ) ( not ( = ?auto_33370 ?auto_33382 ) ) ( not ( = ?auto_33371 ?auto_33382 ) ) ( not ( = ?auto_33376 ?auto_33382 ) ) ( not ( = ?auto_33374 ?auto_33382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33382 ?auto_33380 )
      ( MAKE-2CRATE ?auto_33380 ?auto_33370 ?auto_33371 )
      ( MAKE-1CRATE-VERIFY ?auto_33370 ?auto_33371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33383 - SURFACE
      ?auto_33384 - SURFACE
      ?auto_33385 - SURFACE
    )
    :vars
    (
      ?auto_33386 - HOIST
      ?auto_33391 - PLACE
      ?auto_33389 - PLACE
      ?auto_33388 - HOIST
      ?auto_33387 - SURFACE
      ?auto_33393 - PLACE
      ?auto_33392 - HOIST
      ?auto_33394 - SURFACE
      ?auto_33395 - TRUCK
      ?auto_33390 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33386 ?auto_33391 ) ( IS-CRATE ?auto_33385 ) ( not ( = ?auto_33384 ?auto_33385 ) ) ( not ( = ?auto_33383 ?auto_33384 ) ) ( not ( = ?auto_33383 ?auto_33385 ) ) ( not ( = ?auto_33389 ?auto_33391 ) ) ( HOIST-AT ?auto_33388 ?auto_33389 ) ( not ( = ?auto_33386 ?auto_33388 ) ) ( AVAILABLE ?auto_33388 ) ( SURFACE-AT ?auto_33385 ?auto_33389 ) ( ON ?auto_33385 ?auto_33387 ) ( CLEAR ?auto_33385 ) ( not ( = ?auto_33384 ?auto_33387 ) ) ( not ( = ?auto_33385 ?auto_33387 ) ) ( not ( = ?auto_33383 ?auto_33387 ) ) ( IS-CRATE ?auto_33384 ) ( not ( = ?auto_33393 ?auto_33391 ) ) ( not ( = ?auto_33389 ?auto_33393 ) ) ( HOIST-AT ?auto_33392 ?auto_33393 ) ( not ( = ?auto_33386 ?auto_33392 ) ) ( not ( = ?auto_33388 ?auto_33392 ) ) ( AVAILABLE ?auto_33392 ) ( SURFACE-AT ?auto_33384 ?auto_33393 ) ( ON ?auto_33384 ?auto_33394 ) ( CLEAR ?auto_33384 ) ( not ( = ?auto_33384 ?auto_33394 ) ) ( not ( = ?auto_33385 ?auto_33394 ) ) ( not ( = ?auto_33383 ?auto_33394 ) ) ( not ( = ?auto_33387 ?auto_33394 ) ) ( TRUCK-AT ?auto_33395 ?auto_33391 ) ( SURFACE-AT ?auto_33390 ?auto_33391 ) ( CLEAR ?auto_33390 ) ( LIFTING ?auto_33386 ?auto_33383 ) ( IS-CRATE ?auto_33383 ) ( not ( = ?auto_33390 ?auto_33383 ) ) ( not ( = ?auto_33384 ?auto_33390 ) ) ( not ( = ?auto_33385 ?auto_33390 ) ) ( not ( = ?auto_33387 ?auto_33390 ) ) ( not ( = ?auto_33394 ?auto_33390 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33384 ?auto_33385 )
      ( MAKE-2CRATE-VERIFY ?auto_33383 ?auto_33384 ?auto_33385 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33396 - SURFACE
      ?auto_33397 - SURFACE
      ?auto_33398 - SURFACE
      ?auto_33399 - SURFACE
    )
    :vars
    (
      ?auto_33400 - HOIST
      ?auto_33405 - PLACE
      ?auto_33404 - PLACE
      ?auto_33401 - HOIST
      ?auto_33402 - SURFACE
      ?auto_33407 - PLACE
      ?auto_33408 - HOIST
      ?auto_33403 - SURFACE
      ?auto_33406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33400 ?auto_33405 ) ( IS-CRATE ?auto_33399 ) ( not ( = ?auto_33398 ?auto_33399 ) ) ( not ( = ?auto_33397 ?auto_33398 ) ) ( not ( = ?auto_33397 ?auto_33399 ) ) ( not ( = ?auto_33404 ?auto_33405 ) ) ( HOIST-AT ?auto_33401 ?auto_33404 ) ( not ( = ?auto_33400 ?auto_33401 ) ) ( AVAILABLE ?auto_33401 ) ( SURFACE-AT ?auto_33399 ?auto_33404 ) ( ON ?auto_33399 ?auto_33402 ) ( CLEAR ?auto_33399 ) ( not ( = ?auto_33398 ?auto_33402 ) ) ( not ( = ?auto_33399 ?auto_33402 ) ) ( not ( = ?auto_33397 ?auto_33402 ) ) ( IS-CRATE ?auto_33398 ) ( not ( = ?auto_33407 ?auto_33405 ) ) ( not ( = ?auto_33404 ?auto_33407 ) ) ( HOIST-AT ?auto_33408 ?auto_33407 ) ( not ( = ?auto_33400 ?auto_33408 ) ) ( not ( = ?auto_33401 ?auto_33408 ) ) ( AVAILABLE ?auto_33408 ) ( SURFACE-AT ?auto_33398 ?auto_33407 ) ( ON ?auto_33398 ?auto_33403 ) ( CLEAR ?auto_33398 ) ( not ( = ?auto_33398 ?auto_33403 ) ) ( not ( = ?auto_33399 ?auto_33403 ) ) ( not ( = ?auto_33397 ?auto_33403 ) ) ( not ( = ?auto_33402 ?auto_33403 ) ) ( TRUCK-AT ?auto_33406 ?auto_33405 ) ( SURFACE-AT ?auto_33396 ?auto_33405 ) ( CLEAR ?auto_33396 ) ( LIFTING ?auto_33400 ?auto_33397 ) ( IS-CRATE ?auto_33397 ) ( not ( = ?auto_33396 ?auto_33397 ) ) ( not ( = ?auto_33398 ?auto_33396 ) ) ( not ( = ?auto_33399 ?auto_33396 ) ) ( not ( = ?auto_33402 ?auto_33396 ) ) ( not ( = ?auto_33403 ?auto_33396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33397 ?auto_33398 ?auto_33399 )
      ( MAKE-3CRATE-VERIFY ?auto_33396 ?auto_33397 ?auto_33398 ?auto_33399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33409 - SURFACE
      ?auto_33410 - SURFACE
    )
    :vars
    (
      ?auto_33411 - HOIST
      ?auto_33417 - PLACE
      ?auto_33412 - SURFACE
      ?auto_33416 - PLACE
      ?auto_33413 - HOIST
      ?auto_33414 - SURFACE
      ?auto_33419 - PLACE
      ?auto_33421 - HOIST
      ?auto_33415 - SURFACE
      ?auto_33418 - TRUCK
      ?auto_33420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33411 ?auto_33417 ) ( IS-CRATE ?auto_33410 ) ( not ( = ?auto_33409 ?auto_33410 ) ) ( not ( = ?auto_33412 ?auto_33409 ) ) ( not ( = ?auto_33412 ?auto_33410 ) ) ( not ( = ?auto_33416 ?auto_33417 ) ) ( HOIST-AT ?auto_33413 ?auto_33416 ) ( not ( = ?auto_33411 ?auto_33413 ) ) ( AVAILABLE ?auto_33413 ) ( SURFACE-AT ?auto_33410 ?auto_33416 ) ( ON ?auto_33410 ?auto_33414 ) ( CLEAR ?auto_33410 ) ( not ( = ?auto_33409 ?auto_33414 ) ) ( not ( = ?auto_33410 ?auto_33414 ) ) ( not ( = ?auto_33412 ?auto_33414 ) ) ( IS-CRATE ?auto_33409 ) ( not ( = ?auto_33419 ?auto_33417 ) ) ( not ( = ?auto_33416 ?auto_33419 ) ) ( HOIST-AT ?auto_33421 ?auto_33419 ) ( not ( = ?auto_33411 ?auto_33421 ) ) ( not ( = ?auto_33413 ?auto_33421 ) ) ( AVAILABLE ?auto_33421 ) ( SURFACE-AT ?auto_33409 ?auto_33419 ) ( ON ?auto_33409 ?auto_33415 ) ( CLEAR ?auto_33409 ) ( not ( = ?auto_33409 ?auto_33415 ) ) ( not ( = ?auto_33410 ?auto_33415 ) ) ( not ( = ?auto_33412 ?auto_33415 ) ) ( not ( = ?auto_33414 ?auto_33415 ) ) ( TRUCK-AT ?auto_33418 ?auto_33417 ) ( SURFACE-AT ?auto_33420 ?auto_33417 ) ( CLEAR ?auto_33420 ) ( IS-CRATE ?auto_33412 ) ( not ( = ?auto_33420 ?auto_33412 ) ) ( not ( = ?auto_33409 ?auto_33420 ) ) ( not ( = ?auto_33410 ?auto_33420 ) ) ( not ( = ?auto_33414 ?auto_33420 ) ) ( not ( = ?auto_33415 ?auto_33420 ) ) ( AVAILABLE ?auto_33411 ) ( IN ?auto_33412 ?auto_33418 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33411 ?auto_33412 ?auto_33418 ?auto_33417 )
      ( MAKE-2CRATE ?auto_33412 ?auto_33409 ?auto_33410 )
      ( MAKE-1CRATE-VERIFY ?auto_33409 ?auto_33410 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33422 - SURFACE
      ?auto_33423 - SURFACE
      ?auto_33424 - SURFACE
    )
    :vars
    (
      ?auto_33426 - HOIST
      ?auto_33428 - PLACE
      ?auto_33433 - PLACE
      ?auto_33431 - HOIST
      ?auto_33429 - SURFACE
      ?auto_33425 - PLACE
      ?auto_33427 - HOIST
      ?auto_33430 - SURFACE
      ?auto_33432 - TRUCK
      ?auto_33434 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33426 ?auto_33428 ) ( IS-CRATE ?auto_33424 ) ( not ( = ?auto_33423 ?auto_33424 ) ) ( not ( = ?auto_33422 ?auto_33423 ) ) ( not ( = ?auto_33422 ?auto_33424 ) ) ( not ( = ?auto_33433 ?auto_33428 ) ) ( HOIST-AT ?auto_33431 ?auto_33433 ) ( not ( = ?auto_33426 ?auto_33431 ) ) ( AVAILABLE ?auto_33431 ) ( SURFACE-AT ?auto_33424 ?auto_33433 ) ( ON ?auto_33424 ?auto_33429 ) ( CLEAR ?auto_33424 ) ( not ( = ?auto_33423 ?auto_33429 ) ) ( not ( = ?auto_33424 ?auto_33429 ) ) ( not ( = ?auto_33422 ?auto_33429 ) ) ( IS-CRATE ?auto_33423 ) ( not ( = ?auto_33425 ?auto_33428 ) ) ( not ( = ?auto_33433 ?auto_33425 ) ) ( HOIST-AT ?auto_33427 ?auto_33425 ) ( not ( = ?auto_33426 ?auto_33427 ) ) ( not ( = ?auto_33431 ?auto_33427 ) ) ( AVAILABLE ?auto_33427 ) ( SURFACE-AT ?auto_33423 ?auto_33425 ) ( ON ?auto_33423 ?auto_33430 ) ( CLEAR ?auto_33423 ) ( not ( = ?auto_33423 ?auto_33430 ) ) ( not ( = ?auto_33424 ?auto_33430 ) ) ( not ( = ?auto_33422 ?auto_33430 ) ) ( not ( = ?auto_33429 ?auto_33430 ) ) ( TRUCK-AT ?auto_33432 ?auto_33428 ) ( SURFACE-AT ?auto_33434 ?auto_33428 ) ( CLEAR ?auto_33434 ) ( IS-CRATE ?auto_33422 ) ( not ( = ?auto_33434 ?auto_33422 ) ) ( not ( = ?auto_33423 ?auto_33434 ) ) ( not ( = ?auto_33424 ?auto_33434 ) ) ( not ( = ?auto_33429 ?auto_33434 ) ) ( not ( = ?auto_33430 ?auto_33434 ) ) ( AVAILABLE ?auto_33426 ) ( IN ?auto_33422 ?auto_33432 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33423 ?auto_33424 )
      ( MAKE-2CRATE-VERIFY ?auto_33422 ?auto_33423 ?auto_33424 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33435 - SURFACE
      ?auto_33436 - SURFACE
      ?auto_33437 - SURFACE
      ?auto_33438 - SURFACE
    )
    :vars
    (
      ?auto_33447 - HOIST
      ?auto_33441 - PLACE
      ?auto_33442 - PLACE
      ?auto_33444 - HOIST
      ?auto_33445 - SURFACE
      ?auto_33446 - PLACE
      ?auto_33443 - HOIST
      ?auto_33439 - SURFACE
      ?auto_33440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33447 ?auto_33441 ) ( IS-CRATE ?auto_33438 ) ( not ( = ?auto_33437 ?auto_33438 ) ) ( not ( = ?auto_33436 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33438 ) ) ( not ( = ?auto_33442 ?auto_33441 ) ) ( HOIST-AT ?auto_33444 ?auto_33442 ) ( not ( = ?auto_33447 ?auto_33444 ) ) ( AVAILABLE ?auto_33444 ) ( SURFACE-AT ?auto_33438 ?auto_33442 ) ( ON ?auto_33438 ?auto_33445 ) ( CLEAR ?auto_33438 ) ( not ( = ?auto_33437 ?auto_33445 ) ) ( not ( = ?auto_33438 ?auto_33445 ) ) ( not ( = ?auto_33436 ?auto_33445 ) ) ( IS-CRATE ?auto_33437 ) ( not ( = ?auto_33446 ?auto_33441 ) ) ( not ( = ?auto_33442 ?auto_33446 ) ) ( HOIST-AT ?auto_33443 ?auto_33446 ) ( not ( = ?auto_33447 ?auto_33443 ) ) ( not ( = ?auto_33444 ?auto_33443 ) ) ( AVAILABLE ?auto_33443 ) ( SURFACE-AT ?auto_33437 ?auto_33446 ) ( ON ?auto_33437 ?auto_33439 ) ( CLEAR ?auto_33437 ) ( not ( = ?auto_33437 ?auto_33439 ) ) ( not ( = ?auto_33438 ?auto_33439 ) ) ( not ( = ?auto_33436 ?auto_33439 ) ) ( not ( = ?auto_33445 ?auto_33439 ) ) ( TRUCK-AT ?auto_33440 ?auto_33441 ) ( SURFACE-AT ?auto_33435 ?auto_33441 ) ( CLEAR ?auto_33435 ) ( IS-CRATE ?auto_33436 ) ( not ( = ?auto_33435 ?auto_33436 ) ) ( not ( = ?auto_33437 ?auto_33435 ) ) ( not ( = ?auto_33438 ?auto_33435 ) ) ( not ( = ?auto_33445 ?auto_33435 ) ) ( not ( = ?auto_33439 ?auto_33435 ) ) ( AVAILABLE ?auto_33447 ) ( IN ?auto_33436 ?auto_33440 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33436 ?auto_33437 ?auto_33438 )
      ( MAKE-3CRATE-VERIFY ?auto_33435 ?auto_33436 ?auto_33437 ?auto_33438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33448 - SURFACE
      ?auto_33449 - SURFACE
    )
    :vars
    (
      ?auto_33460 - HOIST
      ?auto_33452 - PLACE
      ?auto_33456 - SURFACE
      ?auto_33453 - PLACE
      ?auto_33455 - HOIST
      ?auto_33458 - SURFACE
      ?auto_33459 - PLACE
      ?auto_33454 - HOIST
      ?auto_33450 - SURFACE
      ?auto_33457 - SURFACE
      ?auto_33451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33460 ?auto_33452 ) ( IS-CRATE ?auto_33449 ) ( not ( = ?auto_33448 ?auto_33449 ) ) ( not ( = ?auto_33456 ?auto_33448 ) ) ( not ( = ?auto_33456 ?auto_33449 ) ) ( not ( = ?auto_33453 ?auto_33452 ) ) ( HOIST-AT ?auto_33455 ?auto_33453 ) ( not ( = ?auto_33460 ?auto_33455 ) ) ( AVAILABLE ?auto_33455 ) ( SURFACE-AT ?auto_33449 ?auto_33453 ) ( ON ?auto_33449 ?auto_33458 ) ( CLEAR ?auto_33449 ) ( not ( = ?auto_33448 ?auto_33458 ) ) ( not ( = ?auto_33449 ?auto_33458 ) ) ( not ( = ?auto_33456 ?auto_33458 ) ) ( IS-CRATE ?auto_33448 ) ( not ( = ?auto_33459 ?auto_33452 ) ) ( not ( = ?auto_33453 ?auto_33459 ) ) ( HOIST-AT ?auto_33454 ?auto_33459 ) ( not ( = ?auto_33460 ?auto_33454 ) ) ( not ( = ?auto_33455 ?auto_33454 ) ) ( AVAILABLE ?auto_33454 ) ( SURFACE-AT ?auto_33448 ?auto_33459 ) ( ON ?auto_33448 ?auto_33450 ) ( CLEAR ?auto_33448 ) ( not ( = ?auto_33448 ?auto_33450 ) ) ( not ( = ?auto_33449 ?auto_33450 ) ) ( not ( = ?auto_33456 ?auto_33450 ) ) ( not ( = ?auto_33458 ?auto_33450 ) ) ( SURFACE-AT ?auto_33457 ?auto_33452 ) ( CLEAR ?auto_33457 ) ( IS-CRATE ?auto_33456 ) ( not ( = ?auto_33457 ?auto_33456 ) ) ( not ( = ?auto_33448 ?auto_33457 ) ) ( not ( = ?auto_33449 ?auto_33457 ) ) ( not ( = ?auto_33458 ?auto_33457 ) ) ( not ( = ?auto_33450 ?auto_33457 ) ) ( AVAILABLE ?auto_33460 ) ( IN ?auto_33456 ?auto_33451 ) ( TRUCK-AT ?auto_33451 ?auto_33459 ) )
    :subtasks
    ( ( !DRIVE ?auto_33451 ?auto_33459 ?auto_33452 )
      ( MAKE-2CRATE ?auto_33456 ?auto_33448 ?auto_33449 )
      ( MAKE-1CRATE-VERIFY ?auto_33448 ?auto_33449 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33461 - SURFACE
      ?auto_33462 - SURFACE
      ?auto_33463 - SURFACE
    )
    :vars
    (
      ?auto_33470 - HOIST
      ?auto_33465 - PLACE
      ?auto_33464 - PLACE
      ?auto_33467 - HOIST
      ?auto_33473 - SURFACE
      ?auto_33472 - PLACE
      ?auto_33469 - HOIST
      ?auto_33468 - SURFACE
      ?auto_33466 - SURFACE
      ?auto_33471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33470 ?auto_33465 ) ( IS-CRATE ?auto_33463 ) ( not ( = ?auto_33462 ?auto_33463 ) ) ( not ( = ?auto_33461 ?auto_33462 ) ) ( not ( = ?auto_33461 ?auto_33463 ) ) ( not ( = ?auto_33464 ?auto_33465 ) ) ( HOIST-AT ?auto_33467 ?auto_33464 ) ( not ( = ?auto_33470 ?auto_33467 ) ) ( AVAILABLE ?auto_33467 ) ( SURFACE-AT ?auto_33463 ?auto_33464 ) ( ON ?auto_33463 ?auto_33473 ) ( CLEAR ?auto_33463 ) ( not ( = ?auto_33462 ?auto_33473 ) ) ( not ( = ?auto_33463 ?auto_33473 ) ) ( not ( = ?auto_33461 ?auto_33473 ) ) ( IS-CRATE ?auto_33462 ) ( not ( = ?auto_33472 ?auto_33465 ) ) ( not ( = ?auto_33464 ?auto_33472 ) ) ( HOIST-AT ?auto_33469 ?auto_33472 ) ( not ( = ?auto_33470 ?auto_33469 ) ) ( not ( = ?auto_33467 ?auto_33469 ) ) ( AVAILABLE ?auto_33469 ) ( SURFACE-AT ?auto_33462 ?auto_33472 ) ( ON ?auto_33462 ?auto_33468 ) ( CLEAR ?auto_33462 ) ( not ( = ?auto_33462 ?auto_33468 ) ) ( not ( = ?auto_33463 ?auto_33468 ) ) ( not ( = ?auto_33461 ?auto_33468 ) ) ( not ( = ?auto_33473 ?auto_33468 ) ) ( SURFACE-AT ?auto_33466 ?auto_33465 ) ( CLEAR ?auto_33466 ) ( IS-CRATE ?auto_33461 ) ( not ( = ?auto_33466 ?auto_33461 ) ) ( not ( = ?auto_33462 ?auto_33466 ) ) ( not ( = ?auto_33463 ?auto_33466 ) ) ( not ( = ?auto_33473 ?auto_33466 ) ) ( not ( = ?auto_33468 ?auto_33466 ) ) ( AVAILABLE ?auto_33470 ) ( IN ?auto_33461 ?auto_33471 ) ( TRUCK-AT ?auto_33471 ?auto_33472 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33462 ?auto_33463 )
      ( MAKE-2CRATE-VERIFY ?auto_33461 ?auto_33462 ?auto_33463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33474 - SURFACE
      ?auto_33475 - SURFACE
      ?auto_33476 - SURFACE
      ?auto_33477 - SURFACE
    )
    :vars
    (
      ?auto_33478 - HOIST
      ?auto_33486 - PLACE
      ?auto_33479 - PLACE
      ?auto_33483 - HOIST
      ?auto_33482 - SURFACE
      ?auto_33480 - PLACE
      ?auto_33485 - HOIST
      ?auto_33484 - SURFACE
      ?auto_33481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33478 ?auto_33486 ) ( IS-CRATE ?auto_33477 ) ( not ( = ?auto_33476 ?auto_33477 ) ) ( not ( = ?auto_33475 ?auto_33476 ) ) ( not ( = ?auto_33475 ?auto_33477 ) ) ( not ( = ?auto_33479 ?auto_33486 ) ) ( HOIST-AT ?auto_33483 ?auto_33479 ) ( not ( = ?auto_33478 ?auto_33483 ) ) ( AVAILABLE ?auto_33483 ) ( SURFACE-AT ?auto_33477 ?auto_33479 ) ( ON ?auto_33477 ?auto_33482 ) ( CLEAR ?auto_33477 ) ( not ( = ?auto_33476 ?auto_33482 ) ) ( not ( = ?auto_33477 ?auto_33482 ) ) ( not ( = ?auto_33475 ?auto_33482 ) ) ( IS-CRATE ?auto_33476 ) ( not ( = ?auto_33480 ?auto_33486 ) ) ( not ( = ?auto_33479 ?auto_33480 ) ) ( HOIST-AT ?auto_33485 ?auto_33480 ) ( not ( = ?auto_33478 ?auto_33485 ) ) ( not ( = ?auto_33483 ?auto_33485 ) ) ( AVAILABLE ?auto_33485 ) ( SURFACE-AT ?auto_33476 ?auto_33480 ) ( ON ?auto_33476 ?auto_33484 ) ( CLEAR ?auto_33476 ) ( not ( = ?auto_33476 ?auto_33484 ) ) ( not ( = ?auto_33477 ?auto_33484 ) ) ( not ( = ?auto_33475 ?auto_33484 ) ) ( not ( = ?auto_33482 ?auto_33484 ) ) ( SURFACE-AT ?auto_33474 ?auto_33486 ) ( CLEAR ?auto_33474 ) ( IS-CRATE ?auto_33475 ) ( not ( = ?auto_33474 ?auto_33475 ) ) ( not ( = ?auto_33476 ?auto_33474 ) ) ( not ( = ?auto_33477 ?auto_33474 ) ) ( not ( = ?auto_33482 ?auto_33474 ) ) ( not ( = ?auto_33484 ?auto_33474 ) ) ( AVAILABLE ?auto_33478 ) ( IN ?auto_33475 ?auto_33481 ) ( TRUCK-AT ?auto_33481 ?auto_33480 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33475 ?auto_33476 ?auto_33477 )
      ( MAKE-3CRATE-VERIFY ?auto_33474 ?auto_33475 ?auto_33476 ?auto_33477 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33487 - SURFACE
      ?auto_33488 - SURFACE
    )
    :vars
    (
      ?auto_33490 - HOIST
      ?auto_33499 - PLACE
      ?auto_33495 - SURFACE
      ?auto_33491 - PLACE
      ?auto_33496 - HOIST
      ?auto_33494 - SURFACE
      ?auto_33492 - PLACE
      ?auto_33498 - HOIST
      ?auto_33497 - SURFACE
      ?auto_33489 - SURFACE
      ?auto_33493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33490 ?auto_33499 ) ( IS-CRATE ?auto_33488 ) ( not ( = ?auto_33487 ?auto_33488 ) ) ( not ( = ?auto_33495 ?auto_33487 ) ) ( not ( = ?auto_33495 ?auto_33488 ) ) ( not ( = ?auto_33491 ?auto_33499 ) ) ( HOIST-AT ?auto_33496 ?auto_33491 ) ( not ( = ?auto_33490 ?auto_33496 ) ) ( AVAILABLE ?auto_33496 ) ( SURFACE-AT ?auto_33488 ?auto_33491 ) ( ON ?auto_33488 ?auto_33494 ) ( CLEAR ?auto_33488 ) ( not ( = ?auto_33487 ?auto_33494 ) ) ( not ( = ?auto_33488 ?auto_33494 ) ) ( not ( = ?auto_33495 ?auto_33494 ) ) ( IS-CRATE ?auto_33487 ) ( not ( = ?auto_33492 ?auto_33499 ) ) ( not ( = ?auto_33491 ?auto_33492 ) ) ( HOIST-AT ?auto_33498 ?auto_33492 ) ( not ( = ?auto_33490 ?auto_33498 ) ) ( not ( = ?auto_33496 ?auto_33498 ) ) ( SURFACE-AT ?auto_33487 ?auto_33492 ) ( ON ?auto_33487 ?auto_33497 ) ( CLEAR ?auto_33487 ) ( not ( = ?auto_33487 ?auto_33497 ) ) ( not ( = ?auto_33488 ?auto_33497 ) ) ( not ( = ?auto_33495 ?auto_33497 ) ) ( not ( = ?auto_33494 ?auto_33497 ) ) ( SURFACE-AT ?auto_33489 ?auto_33499 ) ( CLEAR ?auto_33489 ) ( IS-CRATE ?auto_33495 ) ( not ( = ?auto_33489 ?auto_33495 ) ) ( not ( = ?auto_33487 ?auto_33489 ) ) ( not ( = ?auto_33488 ?auto_33489 ) ) ( not ( = ?auto_33494 ?auto_33489 ) ) ( not ( = ?auto_33497 ?auto_33489 ) ) ( AVAILABLE ?auto_33490 ) ( TRUCK-AT ?auto_33493 ?auto_33492 ) ( LIFTING ?auto_33498 ?auto_33495 ) )
    :subtasks
    ( ( !LOAD ?auto_33498 ?auto_33495 ?auto_33493 ?auto_33492 )
      ( MAKE-2CRATE ?auto_33495 ?auto_33487 ?auto_33488 )
      ( MAKE-1CRATE-VERIFY ?auto_33487 ?auto_33488 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33500 - SURFACE
      ?auto_33501 - SURFACE
      ?auto_33502 - SURFACE
    )
    :vars
    (
      ?auto_33512 - HOIST
      ?auto_33504 - PLACE
      ?auto_33505 - PLACE
      ?auto_33508 - HOIST
      ?auto_33506 - SURFACE
      ?auto_33511 - PLACE
      ?auto_33507 - HOIST
      ?auto_33509 - SURFACE
      ?auto_33503 - SURFACE
      ?auto_33510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33512 ?auto_33504 ) ( IS-CRATE ?auto_33502 ) ( not ( = ?auto_33501 ?auto_33502 ) ) ( not ( = ?auto_33500 ?auto_33501 ) ) ( not ( = ?auto_33500 ?auto_33502 ) ) ( not ( = ?auto_33505 ?auto_33504 ) ) ( HOIST-AT ?auto_33508 ?auto_33505 ) ( not ( = ?auto_33512 ?auto_33508 ) ) ( AVAILABLE ?auto_33508 ) ( SURFACE-AT ?auto_33502 ?auto_33505 ) ( ON ?auto_33502 ?auto_33506 ) ( CLEAR ?auto_33502 ) ( not ( = ?auto_33501 ?auto_33506 ) ) ( not ( = ?auto_33502 ?auto_33506 ) ) ( not ( = ?auto_33500 ?auto_33506 ) ) ( IS-CRATE ?auto_33501 ) ( not ( = ?auto_33511 ?auto_33504 ) ) ( not ( = ?auto_33505 ?auto_33511 ) ) ( HOIST-AT ?auto_33507 ?auto_33511 ) ( not ( = ?auto_33512 ?auto_33507 ) ) ( not ( = ?auto_33508 ?auto_33507 ) ) ( SURFACE-AT ?auto_33501 ?auto_33511 ) ( ON ?auto_33501 ?auto_33509 ) ( CLEAR ?auto_33501 ) ( not ( = ?auto_33501 ?auto_33509 ) ) ( not ( = ?auto_33502 ?auto_33509 ) ) ( not ( = ?auto_33500 ?auto_33509 ) ) ( not ( = ?auto_33506 ?auto_33509 ) ) ( SURFACE-AT ?auto_33503 ?auto_33504 ) ( CLEAR ?auto_33503 ) ( IS-CRATE ?auto_33500 ) ( not ( = ?auto_33503 ?auto_33500 ) ) ( not ( = ?auto_33501 ?auto_33503 ) ) ( not ( = ?auto_33502 ?auto_33503 ) ) ( not ( = ?auto_33506 ?auto_33503 ) ) ( not ( = ?auto_33509 ?auto_33503 ) ) ( AVAILABLE ?auto_33512 ) ( TRUCK-AT ?auto_33510 ?auto_33511 ) ( LIFTING ?auto_33507 ?auto_33500 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33501 ?auto_33502 )
      ( MAKE-2CRATE-VERIFY ?auto_33500 ?auto_33501 ?auto_33502 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33513 - SURFACE
      ?auto_33514 - SURFACE
      ?auto_33515 - SURFACE
      ?auto_33516 - SURFACE
    )
    :vars
    (
      ?auto_33518 - HOIST
      ?auto_33517 - PLACE
      ?auto_33520 - PLACE
      ?auto_33523 - HOIST
      ?auto_33519 - SURFACE
      ?auto_33524 - PLACE
      ?auto_33525 - HOIST
      ?auto_33522 - SURFACE
      ?auto_33521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33518 ?auto_33517 ) ( IS-CRATE ?auto_33516 ) ( not ( = ?auto_33515 ?auto_33516 ) ) ( not ( = ?auto_33514 ?auto_33515 ) ) ( not ( = ?auto_33514 ?auto_33516 ) ) ( not ( = ?auto_33520 ?auto_33517 ) ) ( HOIST-AT ?auto_33523 ?auto_33520 ) ( not ( = ?auto_33518 ?auto_33523 ) ) ( AVAILABLE ?auto_33523 ) ( SURFACE-AT ?auto_33516 ?auto_33520 ) ( ON ?auto_33516 ?auto_33519 ) ( CLEAR ?auto_33516 ) ( not ( = ?auto_33515 ?auto_33519 ) ) ( not ( = ?auto_33516 ?auto_33519 ) ) ( not ( = ?auto_33514 ?auto_33519 ) ) ( IS-CRATE ?auto_33515 ) ( not ( = ?auto_33524 ?auto_33517 ) ) ( not ( = ?auto_33520 ?auto_33524 ) ) ( HOIST-AT ?auto_33525 ?auto_33524 ) ( not ( = ?auto_33518 ?auto_33525 ) ) ( not ( = ?auto_33523 ?auto_33525 ) ) ( SURFACE-AT ?auto_33515 ?auto_33524 ) ( ON ?auto_33515 ?auto_33522 ) ( CLEAR ?auto_33515 ) ( not ( = ?auto_33515 ?auto_33522 ) ) ( not ( = ?auto_33516 ?auto_33522 ) ) ( not ( = ?auto_33514 ?auto_33522 ) ) ( not ( = ?auto_33519 ?auto_33522 ) ) ( SURFACE-AT ?auto_33513 ?auto_33517 ) ( CLEAR ?auto_33513 ) ( IS-CRATE ?auto_33514 ) ( not ( = ?auto_33513 ?auto_33514 ) ) ( not ( = ?auto_33515 ?auto_33513 ) ) ( not ( = ?auto_33516 ?auto_33513 ) ) ( not ( = ?auto_33519 ?auto_33513 ) ) ( not ( = ?auto_33522 ?auto_33513 ) ) ( AVAILABLE ?auto_33518 ) ( TRUCK-AT ?auto_33521 ?auto_33524 ) ( LIFTING ?auto_33525 ?auto_33514 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33514 ?auto_33515 ?auto_33516 )
      ( MAKE-3CRATE-VERIFY ?auto_33513 ?auto_33514 ?auto_33515 ?auto_33516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33526 - SURFACE
      ?auto_33527 - SURFACE
    )
    :vars
    (
      ?auto_33529 - HOIST
      ?auto_33528 - PLACE
      ?auto_33537 - SURFACE
      ?auto_33532 - PLACE
      ?auto_33535 - HOIST
      ?auto_33531 - SURFACE
      ?auto_33536 - PLACE
      ?auto_33538 - HOIST
      ?auto_33534 - SURFACE
      ?auto_33530 - SURFACE
      ?auto_33533 - TRUCK
      ?auto_33539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33529 ?auto_33528 ) ( IS-CRATE ?auto_33527 ) ( not ( = ?auto_33526 ?auto_33527 ) ) ( not ( = ?auto_33537 ?auto_33526 ) ) ( not ( = ?auto_33537 ?auto_33527 ) ) ( not ( = ?auto_33532 ?auto_33528 ) ) ( HOIST-AT ?auto_33535 ?auto_33532 ) ( not ( = ?auto_33529 ?auto_33535 ) ) ( AVAILABLE ?auto_33535 ) ( SURFACE-AT ?auto_33527 ?auto_33532 ) ( ON ?auto_33527 ?auto_33531 ) ( CLEAR ?auto_33527 ) ( not ( = ?auto_33526 ?auto_33531 ) ) ( not ( = ?auto_33527 ?auto_33531 ) ) ( not ( = ?auto_33537 ?auto_33531 ) ) ( IS-CRATE ?auto_33526 ) ( not ( = ?auto_33536 ?auto_33528 ) ) ( not ( = ?auto_33532 ?auto_33536 ) ) ( HOIST-AT ?auto_33538 ?auto_33536 ) ( not ( = ?auto_33529 ?auto_33538 ) ) ( not ( = ?auto_33535 ?auto_33538 ) ) ( SURFACE-AT ?auto_33526 ?auto_33536 ) ( ON ?auto_33526 ?auto_33534 ) ( CLEAR ?auto_33526 ) ( not ( = ?auto_33526 ?auto_33534 ) ) ( not ( = ?auto_33527 ?auto_33534 ) ) ( not ( = ?auto_33537 ?auto_33534 ) ) ( not ( = ?auto_33531 ?auto_33534 ) ) ( SURFACE-AT ?auto_33530 ?auto_33528 ) ( CLEAR ?auto_33530 ) ( IS-CRATE ?auto_33537 ) ( not ( = ?auto_33530 ?auto_33537 ) ) ( not ( = ?auto_33526 ?auto_33530 ) ) ( not ( = ?auto_33527 ?auto_33530 ) ) ( not ( = ?auto_33531 ?auto_33530 ) ) ( not ( = ?auto_33534 ?auto_33530 ) ) ( AVAILABLE ?auto_33529 ) ( TRUCK-AT ?auto_33533 ?auto_33536 ) ( AVAILABLE ?auto_33538 ) ( SURFACE-AT ?auto_33537 ?auto_33536 ) ( ON ?auto_33537 ?auto_33539 ) ( CLEAR ?auto_33537 ) ( not ( = ?auto_33526 ?auto_33539 ) ) ( not ( = ?auto_33527 ?auto_33539 ) ) ( not ( = ?auto_33537 ?auto_33539 ) ) ( not ( = ?auto_33531 ?auto_33539 ) ) ( not ( = ?auto_33534 ?auto_33539 ) ) ( not ( = ?auto_33530 ?auto_33539 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33538 ?auto_33537 ?auto_33539 ?auto_33536 )
      ( MAKE-2CRATE ?auto_33537 ?auto_33526 ?auto_33527 )
      ( MAKE-1CRATE-VERIFY ?auto_33526 ?auto_33527 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33540 - SURFACE
      ?auto_33541 - SURFACE
      ?auto_33542 - SURFACE
    )
    :vars
    (
      ?auto_33547 - HOIST
      ?auto_33545 - PLACE
      ?auto_33548 - PLACE
      ?auto_33549 - HOIST
      ?auto_33543 - SURFACE
      ?auto_33546 - PLACE
      ?auto_33550 - HOIST
      ?auto_33551 - SURFACE
      ?auto_33553 - SURFACE
      ?auto_33552 - TRUCK
      ?auto_33544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33547 ?auto_33545 ) ( IS-CRATE ?auto_33542 ) ( not ( = ?auto_33541 ?auto_33542 ) ) ( not ( = ?auto_33540 ?auto_33541 ) ) ( not ( = ?auto_33540 ?auto_33542 ) ) ( not ( = ?auto_33548 ?auto_33545 ) ) ( HOIST-AT ?auto_33549 ?auto_33548 ) ( not ( = ?auto_33547 ?auto_33549 ) ) ( AVAILABLE ?auto_33549 ) ( SURFACE-AT ?auto_33542 ?auto_33548 ) ( ON ?auto_33542 ?auto_33543 ) ( CLEAR ?auto_33542 ) ( not ( = ?auto_33541 ?auto_33543 ) ) ( not ( = ?auto_33542 ?auto_33543 ) ) ( not ( = ?auto_33540 ?auto_33543 ) ) ( IS-CRATE ?auto_33541 ) ( not ( = ?auto_33546 ?auto_33545 ) ) ( not ( = ?auto_33548 ?auto_33546 ) ) ( HOIST-AT ?auto_33550 ?auto_33546 ) ( not ( = ?auto_33547 ?auto_33550 ) ) ( not ( = ?auto_33549 ?auto_33550 ) ) ( SURFACE-AT ?auto_33541 ?auto_33546 ) ( ON ?auto_33541 ?auto_33551 ) ( CLEAR ?auto_33541 ) ( not ( = ?auto_33541 ?auto_33551 ) ) ( not ( = ?auto_33542 ?auto_33551 ) ) ( not ( = ?auto_33540 ?auto_33551 ) ) ( not ( = ?auto_33543 ?auto_33551 ) ) ( SURFACE-AT ?auto_33553 ?auto_33545 ) ( CLEAR ?auto_33553 ) ( IS-CRATE ?auto_33540 ) ( not ( = ?auto_33553 ?auto_33540 ) ) ( not ( = ?auto_33541 ?auto_33553 ) ) ( not ( = ?auto_33542 ?auto_33553 ) ) ( not ( = ?auto_33543 ?auto_33553 ) ) ( not ( = ?auto_33551 ?auto_33553 ) ) ( AVAILABLE ?auto_33547 ) ( TRUCK-AT ?auto_33552 ?auto_33546 ) ( AVAILABLE ?auto_33550 ) ( SURFACE-AT ?auto_33540 ?auto_33546 ) ( ON ?auto_33540 ?auto_33544 ) ( CLEAR ?auto_33540 ) ( not ( = ?auto_33541 ?auto_33544 ) ) ( not ( = ?auto_33542 ?auto_33544 ) ) ( not ( = ?auto_33540 ?auto_33544 ) ) ( not ( = ?auto_33543 ?auto_33544 ) ) ( not ( = ?auto_33551 ?auto_33544 ) ) ( not ( = ?auto_33553 ?auto_33544 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33541 ?auto_33542 )
      ( MAKE-2CRATE-VERIFY ?auto_33540 ?auto_33541 ?auto_33542 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33554 - SURFACE
      ?auto_33555 - SURFACE
      ?auto_33556 - SURFACE
      ?auto_33557 - SURFACE
    )
    :vars
    (
      ?auto_33566 - HOIST
      ?auto_33565 - PLACE
      ?auto_33564 - PLACE
      ?auto_33567 - HOIST
      ?auto_33563 - SURFACE
      ?auto_33560 - PLACE
      ?auto_33561 - HOIST
      ?auto_33562 - SURFACE
      ?auto_33558 - TRUCK
      ?auto_33559 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33566 ?auto_33565 ) ( IS-CRATE ?auto_33557 ) ( not ( = ?auto_33556 ?auto_33557 ) ) ( not ( = ?auto_33555 ?auto_33556 ) ) ( not ( = ?auto_33555 ?auto_33557 ) ) ( not ( = ?auto_33564 ?auto_33565 ) ) ( HOIST-AT ?auto_33567 ?auto_33564 ) ( not ( = ?auto_33566 ?auto_33567 ) ) ( AVAILABLE ?auto_33567 ) ( SURFACE-AT ?auto_33557 ?auto_33564 ) ( ON ?auto_33557 ?auto_33563 ) ( CLEAR ?auto_33557 ) ( not ( = ?auto_33556 ?auto_33563 ) ) ( not ( = ?auto_33557 ?auto_33563 ) ) ( not ( = ?auto_33555 ?auto_33563 ) ) ( IS-CRATE ?auto_33556 ) ( not ( = ?auto_33560 ?auto_33565 ) ) ( not ( = ?auto_33564 ?auto_33560 ) ) ( HOIST-AT ?auto_33561 ?auto_33560 ) ( not ( = ?auto_33566 ?auto_33561 ) ) ( not ( = ?auto_33567 ?auto_33561 ) ) ( SURFACE-AT ?auto_33556 ?auto_33560 ) ( ON ?auto_33556 ?auto_33562 ) ( CLEAR ?auto_33556 ) ( not ( = ?auto_33556 ?auto_33562 ) ) ( not ( = ?auto_33557 ?auto_33562 ) ) ( not ( = ?auto_33555 ?auto_33562 ) ) ( not ( = ?auto_33563 ?auto_33562 ) ) ( SURFACE-AT ?auto_33554 ?auto_33565 ) ( CLEAR ?auto_33554 ) ( IS-CRATE ?auto_33555 ) ( not ( = ?auto_33554 ?auto_33555 ) ) ( not ( = ?auto_33556 ?auto_33554 ) ) ( not ( = ?auto_33557 ?auto_33554 ) ) ( not ( = ?auto_33563 ?auto_33554 ) ) ( not ( = ?auto_33562 ?auto_33554 ) ) ( AVAILABLE ?auto_33566 ) ( TRUCK-AT ?auto_33558 ?auto_33560 ) ( AVAILABLE ?auto_33561 ) ( SURFACE-AT ?auto_33555 ?auto_33560 ) ( ON ?auto_33555 ?auto_33559 ) ( CLEAR ?auto_33555 ) ( not ( = ?auto_33556 ?auto_33559 ) ) ( not ( = ?auto_33557 ?auto_33559 ) ) ( not ( = ?auto_33555 ?auto_33559 ) ) ( not ( = ?auto_33563 ?auto_33559 ) ) ( not ( = ?auto_33562 ?auto_33559 ) ) ( not ( = ?auto_33554 ?auto_33559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33555 ?auto_33556 ?auto_33557 )
      ( MAKE-3CRATE-VERIFY ?auto_33554 ?auto_33555 ?auto_33556 ?auto_33557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33568 - SURFACE
      ?auto_33569 - SURFACE
    )
    :vars
    (
      ?auto_33580 - HOIST
      ?auto_33579 - PLACE
      ?auto_33578 - SURFACE
      ?auto_33577 - PLACE
      ?auto_33581 - HOIST
      ?auto_33576 - SURFACE
      ?auto_33573 - PLACE
      ?auto_33574 - HOIST
      ?auto_33575 - SURFACE
      ?auto_33572 - SURFACE
      ?auto_33571 - SURFACE
      ?auto_33570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33580 ?auto_33579 ) ( IS-CRATE ?auto_33569 ) ( not ( = ?auto_33568 ?auto_33569 ) ) ( not ( = ?auto_33578 ?auto_33568 ) ) ( not ( = ?auto_33578 ?auto_33569 ) ) ( not ( = ?auto_33577 ?auto_33579 ) ) ( HOIST-AT ?auto_33581 ?auto_33577 ) ( not ( = ?auto_33580 ?auto_33581 ) ) ( AVAILABLE ?auto_33581 ) ( SURFACE-AT ?auto_33569 ?auto_33577 ) ( ON ?auto_33569 ?auto_33576 ) ( CLEAR ?auto_33569 ) ( not ( = ?auto_33568 ?auto_33576 ) ) ( not ( = ?auto_33569 ?auto_33576 ) ) ( not ( = ?auto_33578 ?auto_33576 ) ) ( IS-CRATE ?auto_33568 ) ( not ( = ?auto_33573 ?auto_33579 ) ) ( not ( = ?auto_33577 ?auto_33573 ) ) ( HOIST-AT ?auto_33574 ?auto_33573 ) ( not ( = ?auto_33580 ?auto_33574 ) ) ( not ( = ?auto_33581 ?auto_33574 ) ) ( SURFACE-AT ?auto_33568 ?auto_33573 ) ( ON ?auto_33568 ?auto_33575 ) ( CLEAR ?auto_33568 ) ( not ( = ?auto_33568 ?auto_33575 ) ) ( not ( = ?auto_33569 ?auto_33575 ) ) ( not ( = ?auto_33578 ?auto_33575 ) ) ( not ( = ?auto_33576 ?auto_33575 ) ) ( SURFACE-AT ?auto_33572 ?auto_33579 ) ( CLEAR ?auto_33572 ) ( IS-CRATE ?auto_33578 ) ( not ( = ?auto_33572 ?auto_33578 ) ) ( not ( = ?auto_33568 ?auto_33572 ) ) ( not ( = ?auto_33569 ?auto_33572 ) ) ( not ( = ?auto_33576 ?auto_33572 ) ) ( not ( = ?auto_33575 ?auto_33572 ) ) ( AVAILABLE ?auto_33580 ) ( AVAILABLE ?auto_33574 ) ( SURFACE-AT ?auto_33578 ?auto_33573 ) ( ON ?auto_33578 ?auto_33571 ) ( CLEAR ?auto_33578 ) ( not ( = ?auto_33568 ?auto_33571 ) ) ( not ( = ?auto_33569 ?auto_33571 ) ) ( not ( = ?auto_33578 ?auto_33571 ) ) ( not ( = ?auto_33576 ?auto_33571 ) ) ( not ( = ?auto_33575 ?auto_33571 ) ) ( not ( = ?auto_33572 ?auto_33571 ) ) ( TRUCK-AT ?auto_33570 ?auto_33579 ) )
    :subtasks
    ( ( !DRIVE ?auto_33570 ?auto_33579 ?auto_33573 )
      ( MAKE-2CRATE ?auto_33578 ?auto_33568 ?auto_33569 )
      ( MAKE-1CRATE-VERIFY ?auto_33568 ?auto_33569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33582 - SURFACE
      ?auto_33583 - SURFACE
      ?auto_33584 - SURFACE
    )
    :vars
    (
      ?auto_33592 - HOIST
      ?auto_33586 - PLACE
      ?auto_33594 - PLACE
      ?auto_33591 - HOIST
      ?auto_33588 - SURFACE
      ?auto_33589 - PLACE
      ?auto_33590 - HOIST
      ?auto_33585 - SURFACE
      ?auto_33593 - SURFACE
      ?auto_33587 - SURFACE
      ?auto_33595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33592 ?auto_33586 ) ( IS-CRATE ?auto_33584 ) ( not ( = ?auto_33583 ?auto_33584 ) ) ( not ( = ?auto_33582 ?auto_33583 ) ) ( not ( = ?auto_33582 ?auto_33584 ) ) ( not ( = ?auto_33594 ?auto_33586 ) ) ( HOIST-AT ?auto_33591 ?auto_33594 ) ( not ( = ?auto_33592 ?auto_33591 ) ) ( AVAILABLE ?auto_33591 ) ( SURFACE-AT ?auto_33584 ?auto_33594 ) ( ON ?auto_33584 ?auto_33588 ) ( CLEAR ?auto_33584 ) ( not ( = ?auto_33583 ?auto_33588 ) ) ( not ( = ?auto_33584 ?auto_33588 ) ) ( not ( = ?auto_33582 ?auto_33588 ) ) ( IS-CRATE ?auto_33583 ) ( not ( = ?auto_33589 ?auto_33586 ) ) ( not ( = ?auto_33594 ?auto_33589 ) ) ( HOIST-AT ?auto_33590 ?auto_33589 ) ( not ( = ?auto_33592 ?auto_33590 ) ) ( not ( = ?auto_33591 ?auto_33590 ) ) ( SURFACE-AT ?auto_33583 ?auto_33589 ) ( ON ?auto_33583 ?auto_33585 ) ( CLEAR ?auto_33583 ) ( not ( = ?auto_33583 ?auto_33585 ) ) ( not ( = ?auto_33584 ?auto_33585 ) ) ( not ( = ?auto_33582 ?auto_33585 ) ) ( not ( = ?auto_33588 ?auto_33585 ) ) ( SURFACE-AT ?auto_33593 ?auto_33586 ) ( CLEAR ?auto_33593 ) ( IS-CRATE ?auto_33582 ) ( not ( = ?auto_33593 ?auto_33582 ) ) ( not ( = ?auto_33583 ?auto_33593 ) ) ( not ( = ?auto_33584 ?auto_33593 ) ) ( not ( = ?auto_33588 ?auto_33593 ) ) ( not ( = ?auto_33585 ?auto_33593 ) ) ( AVAILABLE ?auto_33592 ) ( AVAILABLE ?auto_33590 ) ( SURFACE-AT ?auto_33582 ?auto_33589 ) ( ON ?auto_33582 ?auto_33587 ) ( CLEAR ?auto_33582 ) ( not ( = ?auto_33583 ?auto_33587 ) ) ( not ( = ?auto_33584 ?auto_33587 ) ) ( not ( = ?auto_33582 ?auto_33587 ) ) ( not ( = ?auto_33588 ?auto_33587 ) ) ( not ( = ?auto_33585 ?auto_33587 ) ) ( not ( = ?auto_33593 ?auto_33587 ) ) ( TRUCK-AT ?auto_33595 ?auto_33586 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33583 ?auto_33584 )
      ( MAKE-2CRATE-VERIFY ?auto_33582 ?auto_33583 ?auto_33584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33596 - SURFACE
      ?auto_33597 - SURFACE
      ?auto_33598 - SURFACE
      ?auto_33599 - SURFACE
    )
    :vars
    (
      ?auto_33609 - HOIST
      ?auto_33606 - PLACE
      ?auto_33602 - PLACE
      ?auto_33605 - HOIST
      ?auto_33603 - SURFACE
      ?auto_33601 - PLACE
      ?auto_33608 - HOIST
      ?auto_33607 - SURFACE
      ?auto_33604 - SURFACE
      ?auto_33600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33609 ?auto_33606 ) ( IS-CRATE ?auto_33599 ) ( not ( = ?auto_33598 ?auto_33599 ) ) ( not ( = ?auto_33597 ?auto_33598 ) ) ( not ( = ?auto_33597 ?auto_33599 ) ) ( not ( = ?auto_33602 ?auto_33606 ) ) ( HOIST-AT ?auto_33605 ?auto_33602 ) ( not ( = ?auto_33609 ?auto_33605 ) ) ( AVAILABLE ?auto_33605 ) ( SURFACE-AT ?auto_33599 ?auto_33602 ) ( ON ?auto_33599 ?auto_33603 ) ( CLEAR ?auto_33599 ) ( not ( = ?auto_33598 ?auto_33603 ) ) ( not ( = ?auto_33599 ?auto_33603 ) ) ( not ( = ?auto_33597 ?auto_33603 ) ) ( IS-CRATE ?auto_33598 ) ( not ( = ?auto_33601 ?auto_33606 ) ) ( not ( = ?auto_33602 ?auto_33601 ) ) ( HOIST-AT ?auto_33608 ?auto_33601 ) ( not ( = ?auto_33609 ?auto_33608 ) ) ( not ( = ?auto_33605 ?auto_33608 ) ) ( SURFACE-AT ?auto_33598 ?auto_33601 ) ( ON ?auto_33598 ?auto_33607 ) ( CLEAR ?auto_33598 ) ( not ( = ?auto_33598 ?auto_33607 ) ) ( not ( = ?auto_33599 ?auto_33607 ) ) ( not ( = ?auto_33597 ?auto_33607 ) ) ( not ( = ?auto_33603 ?auto_33607 ) ) ( SURFACE-AT ?auto_33596 ?auto_33606 ) ( CLEAR ?auto_33596 ) ( IS-CRATE ?auto_33597 ) ( not ( = ?auto_33596 ?auto_33597 ) ) ( not ( = ?auto_33598 ?auto_33596 ) ) ( not ( = ?auto_33599 ?auto_33596 ) ) ( not ( = ?auto_33603 ?auto_33596 ) ) ( not ( = ?auto_33607 ?auto_33596 ) ) ( AVAILABLE ?auto_33609 ) ( AVAILABLE ?auto_33608 ) ( SURFACE-AT ?auto_33597 ?auto_33601 ) ( ON ?auto_33597 ?auto_33604 ) ( CLEAR ?auto_33597 ) ( not ( = ?auto_33598 ?auto_33604 ) ) ( not ( = ?auto_33599 ?auto_33604 ) ) ( not ( = ?auto_33597 ?auto_33604 ) ) ( not ( = ?auto_33603 ?auto_33604 ) ) ( not ( = ?auto_33607 ?auto_33604 ) ) ( not ( = ?auto_33596 ?auto_33604 ) ) ( TRUCK-AT ?auto_33600 ?auto_33606 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33597 ?auto_33598 ?auto_33599 )
      ( MAKE-3CRATE-VERIFY ?auto_33596 ?auto_33597 ?auto_33598 ?auto_33599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33624 - SURFACE
      ?auto_33625 - SURFACE
    )
    :vars
    (
      ?auto_33626 - HOIST
      ?auto_33627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33626 ?auto_33627 ) ( SURFACE-AT ?auto_33624 ?auto_33627 ) ( CLEAR ?auto_33624 ) ( LIFTING ?auto_33626 ?auto_33625 ) ( IS-CRATE ?auto_33625 ) ( not ( = ?auto_33624 ?auto_33625 ) ) )
    :subtasks
    ( ( !DROP ?auto_33626 ?auto_33625 ?auto_33624 ?auto_33627 )
      ( MAKE-1CRATE-VERIFY ?auto_33624 ?auto_33625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33628 - SURFACE
      ?auto_33629 - SURFACE
      ?auto_33630 - SURFACE
    )
    :vars
    (
      ?auto_33632 - HOIST
      ?auto_33631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33632 ?auto_33631 ) ( SURFACE-AT ?auto_33629 ?auto_33631 ) ( CLEAR ?auto_33629 ) ( LIFTING ?auto_33632 ?auto_33630 ) ( IS-CRATE ?auto_33630 ) ( not ( = ?auto_33629 ?auto_33630 ) ) ( ON ?auto_33629 ?auto_33628 ) ( not ( = ?auto_33628 ?auto_33629 ) ) ( not ( = ?auto_33628 ?auto_33630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33629 ?auto_33630 )
      ( MAKE-2CRATE-VERIFY ?auto_33628 ?auto_33629 ?auto_33630 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33633 - SURFACE
      ?auto_33634 - SURFACE
      ?auto_33635 - SURFACE
      ?auto_33636 - SURFACE
    )
    :vars
    (
      ?auto_33638 - HOIST
      ?auto_33637 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33638 ?auto_33637 ) ( SURFACE-AT ?auto_33635 ?auto_33637 ) ( CLEAR ?auto_33635 ) ( LIFTING ?auto_33638 ?auto_33636 ) ( IS-CRATE ?auto_33636 ) ( not ( = ?auto_33635 ?auto_33636 ) ) ( ON ?auto_33634 ?auto_33633 ) ( ON ?auto_33635 ?auto_33634 ) ( not ( = ?auto_33633 ?auto_33634 ) ) ( not ( = ?auto_33633 ?auto_33635 ) ) ( not ( = ?auto_33633 ?auto_33636 ) ) ( not ( = ?auto_33634 ?auto_33635 ) ) ( not ( = ?auto_33634 ?auto_33636 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33635 ?auto_33636 )
      ( MAKE-3CRATE-VERIFY ?auto_33633 ?auto_33634 ?auto_33635 ?auto_33636 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33639 - SURFACE
      ?auto_33640 - SURFACE
      ?auto_33641 - SURFACE
      ?auto_33642 - SURFACE
      ?auto_33643 - SURFACE
    )
    :vars
    (
      ?auto_33645 - HOIST
      ?auto_33644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33645 ?auto_33644 ) ( SURFACE-AT ?auto_33642 ?auto_33644 ) ( CLEAR ?auto_33642 ) ( LIFTING ?auto_33645 ?auto_33643 ) ( IS-CRATE ?auto_33643 ) ( not ( = ?auto_33642 ?auto_33643 ) ) ( ON ?auto_33640 ?auto_33639 ) ( ON ?auto_33641 ?auto_33640 ) ( ON ?auto_33642 ?auto_33641 ) ( not ( = ?auto_33639 ?auto_33640 ) ) ( not ( = ?auto_33639 ?auto_33641 ) ) ( not ( = ?auto_33639 ?auto_33642 ) ) ( not ( = ?auto_33639 ?auto_33643 ) ) ( not ( = ?auto_33640 ?auto_33641 ) ) ( not ( = ?auto_33640 ?auto_33642 ) ) ( not ( = ?auto_33640 ?auto_33643 ) ) ( not ( = ?auto_33641 ?auto_33642 ) ) ( not ( = ?auto_33641 ?auto_33643 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33642 ?auto_33643 )
      ( MAKE-4CRATE-VERIFY ?auto_33639 ?auto_33640 ?auto_33641 ?auto_33642 ?auto_33643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33646 - SURFACE
      ?auto_33647 - SURFACE
    )
    :vars
    (
      ?auto_33649 - HOIST
      ?auto_33648 - PLACE
      ?auto_33650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33649 ?auto_33648 ) ( SURFACE-AT ?auto_33646 ?auto_33648 ) ( CLEAR ?auto_33646 ) ( IS-CRATE ?auto_33647 ) ( not ( = ?auto_33646 ?auto_33647 ) ) ( TRUCK-AT ?auto_33650 ?auto_33648 ) ( AVAILABLE ?auto_33649 ) ( IN ?auto_33647 ?auto_33650 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33649 ?auto_33647 ?auto_33650 ?auto_33648 )
      ( MAKE-1CRATE ?auto_33646 ?auto_33647 )
      ( MAKE-1CRATE-VERIFY ?auto_33646 ?auto_33647 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33651 - SURFACE
      ?auto_33652 - SURFACE
      ?auto_33653 - SURFACE
    )
    :vars
    (
      ?auto_33656 - HOIST
      ?auto_33655 - PLACE
      ?auto_33654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33656 ?auto_33655 ) ( SURFACE-AT ?auto_33652 ?auto_33655 ) ( CLEAR ?auto_33652 ) ( IS-CRATE ?auto_33653 ) ( not ( = ?auto_33652 ?auto_33653 ) ) ( TRUCK-AT ?auto_33654 ?auto_33655 ) ( AVAILABLE ?auto_33656 ) ( IN ?auto_33653 ?auto_33654 ) ( ON ?auto_33652 ?auto_33651 ) ( not ( = ?auto_33651 ?auto_33652 ) ) ( not ( = ?auto_33651 ?auto_33653 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33652 ?auto_33653 )
      ( MAKE-2CRATE-VERIFY ?auto_33651 ?auto_33652 ?auto_33653 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33657 - SURFACE
      ?auto_33658 - SURFACE
      ?auto_33659 - SURFACE
      ?auto_33660 - SURFACE
    )
    :vars
    (
      ?auto_33661 - HOIST
      ?auto_33662 - PLACE
      ?auto_33663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33661 ?auto_33662 ) ( SURFACE-AT ?auto_33659 ?auto_33662 ) ( CLEAR ?auto_33659 ) ( IS-CRATE ?auto_33660 ) ( not ( = ?auto_33659 ?auto_33660 ) ) ( TRUCK-AT ?auto_33663 ?auto_33662 ) ( AVAILABLE ?auto_33661 ) ( IN ?auto_33660 ?auto_33663 ) ( ON ?auto_33659 ?auto_33658 ) ( not ( = ?auto_33658 ?auto_33659 ) ) ( not ( = ?auto_33658 ?auto_33660 ) ) ( ON ?auto_33658 ?auto_33657 ) ( not ( = ?auto_33657 ?auto_33658 ) ) ( not ( = ?auto_33657 ?auto_33659 ) ) ( not ( = ?auto_33657 ?auto_33660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33658 ?auto_33659 ?auto_33660 )
      ( MAKE-3CRATE-VERIFY ?auto_33657 ?auto_33658 ?auto_33659 ?auto_33660 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33664 - SURFACE
      ?auto_33665 - SURFACE
      ?auto_33666 - SURFACE
      ?auto_33667 - SURFACE
      ?auto_33668 - SURFACE
    )
    :vars
    (
      ?auto_33669 - HOIST
      ?auto_33670 - PLACE
      ?auto_33671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33669 ?auto_33670 ) ( SURFACE-AT ?auto_33667 ?auto_33670 ) ( CLEAR ?auto_33667 ) ( IS-CRATE ?auto_33668 ) ( not ( = ?auto_33667 ?auto_33668 ) ) ( TRUCK-AT ?auto_33671 ?auto_33670 ) ( AVAILABLE ?auto_33669 ) ( IN ?auto_33668 ?auto_33671 ) ( ON ?auto_33667 ?auto_33666 ) ( not ( = ?auto_33666 ?auto_33667 ) ) ( not ( = ?auto_33666 ?auto_33668 ) ) ( ON ?auto_33665 ?auto_33664 ) ( ON ?auto_33666 ?auto_33665 ) ( not ( = ?auto_33664 ?auto_33665 ) ) ( not ( = ?auto_33664 ?auto_33666 ) ) ( not ( = ?auto_33664 ?auto_33667 ) ) ( not ( = ?auto_33664 ?auto_33668 ) ) ( not ( = ?auto_33665 ?auto_33666 ) ) ( not ( = ?auto_33665 ?auto_33667 ) ) ( not ( = ?auto_33665 ?auto_33668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33666 ?auto_33667 ?auto_33668 )
      ( MAKE-4CRATE-VERIFY ?auto_33664 ?auto_33665 ?auto_33666 ?auto_33667 ?auto_33668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33672 - SURFACE
      ?auto_33673 - SURFACE
    )
    :vars
    (
      ?auto_33675 - HOIST
      ?auto_33676 - PLACE
      ?auto_33677 - TRUCK
      ?auto_33674 - SURFACE
      ?auto_33678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33675 ?auto_33676 ) ( SURFACE-AT ?auto_33672 ?auto_33676 ) ( CLEAR ?auto_33672 ) ( IS-CRATE ?auto_33673 ) ( not ( = ?auto_33672 ?auto_33673 ) ) ( AVAILABLE ?auto_33675 ) ( IN ?auto_33673 ?auto_33677 ) ( ON ?auto_33672 ?auto_33674 ) ( not ( = ?auto_33674 ?auto_33672 ) ) ( not ( = ?auto_33674 ?auto_33673 ) ) ( TRUCK-AT ?auto_33677 ?auto_33678 ) ( not ( = ?auto_33678 ?auto_33676 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33677 ?auto_33678 ?auto_33676 )
      ( MAKE-2CRATE ?auto_33674 ?auto_33672 ?auto_33673 )
      ( MAKE-1CRATE-VERIFY ?auto_33672 ?auto_33673 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33679 - SURFACE
      ?auto_33680 - SURFACE
      ?auto_33681 - SURFACE
    )
    :vars
    (
      ?auto_33682 - HOIST
      ?auto_33684 - PLACE
      ?auto_33683 - TRUCK
      ?auto_33685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33682 ?auto_33684 ) ( SURFACE-AT ?auto_33680 ?auto_33684 ) ( CLEAR ?auto_33680 ) ( IS-CRATE ?auto_33681 ) ( not ( = ?auto_33680 ?auto_33681 ) ) ( AVAILABLE ?auto_33682 ) ( IN ?auto_33681 ?auto_33683 ) ( ON ?auto_33680 ?auto_33679 ) ( not ( = ?auto_33679 ?auto_33680 ) ) ( not ( = ?auto_33679 ?auto_33681 ) ) ( TRUCK-AT ?auto_33683 ?auto_33685 ) ( not ( = ?auto_33685 ?auto_33684 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33680 ?auto_33681 )
      ( MAKE-2CRATE-VERIFY ?auto_33679 ?auto_33680 ?auto_33681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33686 - SURFACE
      ?auto_33687 - SURFACE
      ?auto_33688 - SURFACE
      ?auto_33689 - SURFACE
    )
    :vars
    (
      ?auto_33690 - HOIST
      ?auto_33692 - PLACE
      ?auto_33691 - TRUCK
      ?auto_33693 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33690 ?auto_33692 ) ( SURFACE-AT ?auto_33688 ?auto_33692 ) ( CLEAR ?auto_33688 ) ( IS-CRATE ?auto_33689 ) ( not ( = ?auto_33688 ?auto_33689 ) ) ( AVAILABLE ?auto_33690 ) ( IN ?auto_33689 ?auto_33691 ) ( ON ?auto_33688 ?auto_33687 ) ( not ( = ?auto_33687 ?auto_33688 ) ) ( not ( = ?auto_33687 ?auto_33689 ) ) ( TRUCK-AT ?auto_33691 ?auto_33693 ) ( not ( = ?auto_33693 ?auto_33692 ) ) ( ON ?auto_33687 ?auto_33686 ) ( not ( = ?auto_33686 ?auto_33687 ) ) ( not ( = ?auto_33686 ?auto_33688 ) ) ( not ( = ?auto_33686 ?auto_33689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33687 ?auto_33688 ?auto_33689 )
      ( MAKE-3CRATE-VERIFY ?auto_33686 ?auto_33687 ?auto_33688 ?auto_33689 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33694 - SURFACE
      ?auto_33695 - SURFACE
      ?auto_33696 - SURFACE
      ?auto_33697 - SURFACE
      ?auto_33698 - SURFACE
    )
    :vars
    (
      ?auto_33699 - HOIST
      ?auto_33701 - PLACE
      ?auto_33700 - TRUCK
      ?auto_33702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33699 ?auto_33701 ) ( SURFACE-AT ?auto_33697 ?auto_33701 ) ( CLEAR ?auto_33697 ) ( IS-CRATE ?auto_33698 ) ( not ( = ?auto_33697 ?auto_33698 ) ) ( AVAILABLE ?auto_33699 ) ( IN ?auto_33698 ?auto_33700 ) ( ON ?auto_33697 ?auto_33696 ) ( not ( = ?auto_33696 ?auto_33697 ) ) ( not ( = ?auto_33696 ?auto_33698 ) ) ( TRUCK-AT ?auto_33700 ?auto_33702 ) ( not ( = ?auto_33702 ?auto_33701 ) ) ( ON ?auto_33695 ?auto_33694 ) ( ON ?auto_33696 ?auto_33695 ) ( not ( = ?auto_33694 ?auto_33695 ) ) ( not ( = ?auto_33694 ?auto_33696 ) ) ( not ( = ?auto_33694 ?auto_33697 ) ) ( not ( = ?auto_33694 ?auto_33698 ) ) ( not ( = ?auto_33695 ?auto_33696 ) ) ( not ( = ?auto_33695 ?auto_33697 ) ) ( not ( = ?auto_33695 ?auto_33698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33696 ?auto_33697 ?auto_33698 )
      ( MAKE-4CRATE-VERIFY ?auto_33694 ?auto_33695 ?auto_33696 ?auto_33697 ?auto_33698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33703 - SURFACE
      ?auto_33704 - SURFACE
    )
    :vars
    (
      ?auto_33705 - HOIST
      ?auto_33708 - PLACE
      ?auto_33706 - SURFACE
      ?auto_33707 - TRUCK
      ?auto_33709 - PLACE
      ?auto_33710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33705 ?auto_33708 ) ( SURFACE-AT ?auto_33703 ?auto_33708 ) ( CLEAR ?auto_33703 ) ( IS-CRATE ?auto_33704 ) ( not ( = ?auto_33703 ?auto_33704 ) ) ( AVAILABLE ?auto_33705 ) ( ON ?auto_33703 ?auto_33706 ) ( not ( = ?auto_33706 ?auto_33703 ) ) ( not ( = ?auto_33706 ?auto_33704 ) ) ( TRUCK-AT ?auto_33707 ?auto_33709 ) ( not ( = ?auto_33709 ?auto_33708 ) ) ( HOIST-AT ?auto_33710 ?auto_33709 ) ( LIFTING ?auto_33710 ?auto_33704 ) ( not ( = ?auto_33705 ?auto_33710 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33710 ?auto_33704 ?auto_33707 ?auto_33709 )
      ( MAKE-2CRATE ?auto_33706 ?auto_33703 ?auto_33704 )
      ( MAKE-1CRATE-VERIFY ?auto_33703 ?auto_33704 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33711 - SURFACE
      ?auto_33712 - SURFACE
      ?auto_33713 - SURFACE
    )
    :vars
    (
      ?auto_33717 - HOIST
      ?auto_33716 - PLACE
      ?auto_33715 - TRUCK
      ?auto_33718 - PLACE
      ?auto_33714 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33717 ?auto_33716 ) ( SURFACE-AT ?auto_33712 ?auto_33716 ) ( CLEAR ?auto_33712 ) ( IS-CRATE ?auto_33713 ) ( not ( = ?auto_33712 ?auto_33713 ) ) ( AVAILABLE ?auto_33717 ) ( ON ?auto_33712 ?auto_33711 ) ( not ( = ?auto_33711 ?auto_33712 ) ) ( not ( = ?auto_33711 ?auto_33713 ) ) ( TRUCK-AT ?auto_33715 ?auto_33718 ) ( not ( = ?auto_33718 ?auto_33716 ) ) ( HOIST-AT ?auto_33714 ?auto_33718 ) ( LIFTING ?auto_33714 ?auto_33713 ) ( not ( = ?auto_33717 ?auto_33714 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33712 ?auto_33713 )
      ( MAKE-2CRATE-VERIFY ?auto_33711 ?auto_33712 ?auto_33713 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33719 - SURFACE
      ?auto_33720 - SURFACE
      ?auto_33721 - SURFACE
      ?auto_33722 - SURFACE
    )
    :vars
    (
      ?auto_33724 - HOIST
      ?auto_33726 - PLACE
      ?auto_33725 - TRUCK
      ?auto_33723 - PLACE
      ?auto_33727 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33724 ?auto_33726 ) ( SURFACE-AT ?auto_33721 ?auto_33726 ) ( CLEAR ?auto_33721 ) ( IS-CRATE ?auto_33722 ) ( not ( = ?auto_33721 ?auto_33722 ) ) ( AVAILABLE ?auto_33724 ) ( ON ?auto_33721 ?auto_33720 ) ( not ( = ?auto_33720 ?auto_33721 ) ) ( not ( = ?auto_33720 ?auto_33722 ) ) ( TRUCK-AT ?auto_33725 ?auto_33723 ) ( not ( = ?auto_33723 ?auto_33726 ) ) ( HOIST-AT ?auto_33727 ?auto_33723 ) ( LIFTING ?auto_33727 ?auto_33722 ) ( not ( = ?auto_33724 ?auto_33727 ) ) ( ON ?auto_33720 ?auto_33719 ) ( not ( = ?auto_33719 ?auto_33720 ) ) ( not ( = ?auto_33719 ?auto_33721 ) ) ( not ( = ?auto_33719 ?auto_33722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33720 ?auto_33721 ?auto_33722 )
      ( MAKE-3CRATE-VERIFY ?auto_33719 ?auto_33720 ?auto_33721 ?auto_33722 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33728 - SURFACE
      ?auto_33729 - SURFACE
      ?auto_33730 - SURFACE
      ?auto_33731 - SURFACE
      ?auto_33732 - SURFACE
    )
    :vars
    (
      ?auto_33734 - HOIST
      ?auto_33736 - PLACE
      ?auto_33735 - TRUCK
      ?auto_33733 - PLACE
      ?auto_33737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33734 ?auto_33736 ) ( SURFACE-AT ?auto_33731 ?auto_33736 ) ( CLEAR ?auto_33731 ) ( IS-CRATE ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33732 ) ) ( AVAILABLE ?auto_33734 ) ( ON ?auto_33731 ?auto_33730 ) ( not ( = ?auto_33730 ?auto_33731 ) ) ( not ( = ?auto_33730 ?auto_33732 ) ) ( TRUCK-AT ?auto_33735 ?auto_33733 ) ( not ( = ?auto_33733 ?auto_33736 ) ) ( HOIST-AT ?auto_33737 ?auto_33733 ) ( LIFTING ?auto_33737 ?auto_33732 ) ( not ( = ?auto_33734 ?auto_33737 ) ) ( ON ?auto_33729 ?auto_33728 ) ( ON ?auto_33730 ?auto_33729 ) ( not ( = ?auto_33728 ?auto_33729 ) ) ( not ( = ?auto_33728 ?auto_33730 ) ) ( not ( = ?auto_33728 ?auto_33731 ) ) ( not ( = ?auto_33728 ?auto_33732 ) ) ( not ( = ?auto_33729 ?auto_33730 ) ) ( not ( = ?auto_33729 ?auto_33731 ) ) ( not ( = ?auto_33729 ?auto_33732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33730 ?auto_33731 ?auto_33732 )
      ( MAKE-4CRATE-VERIFY ?auto_33728 ?auto_33729 ?auto_33730 ?auto_33731 ?auto_33732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33738 - SURFACE
      ?auto_33739 - SURFACE
    )
    :vars
    (
      ?auto_33741 - HOIST
      ?auto_33743 - PLACE
      ?auto_33745 - SURFACE
      ?auto_33742 - TRUCK
      ?auto_33740 - PLACE
      ?auto_33744 - HOIST
      ?auto_33746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33741 ?auto_33743 ) ( SURFACE-AT ?auto_33738 ?auto_33743 ) ( CLEAR ?auto_33738 ) ( IS-CRATE ?auto_33739 ) ( not ( = ?auto_33738 ?auto_33739 ) ) ( AVAILABLE ?auto_33741 ) ( ON ?auto_33738 ?auto_33745 ) ( not ( = ?auto_33745 ?auto_33738 ) ) ( not ( = ?auto_33745 ?auto_33739 ) ) ( TRUCK-AT ?auto_33742 ?auto_33740 ) ( not ( = ?auto_33740 ?auto_33743 ) ) ( HOIST-AT ?auto_33744 ?auto_33740 ) ( not ( = ?auto_33741 ?auto_33744 ) ) ( AVAILABLE ?auto_33744 ) ( SURFACE-AT ?auto_33739 ?auto_33740 ) ( ON ?auto_33739 ?auto_33746 ) ( CLEAR ?auto_33739 ) ( not ( = ?auto_33738 ?auto_33746 ) ) ( not ( = ?auto_33739 ?auto_33746 ) ) ( not ( = ?auto_33745 ?auto_33746 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33744 ?auto_33739 ?auto_33746 ?auto_33740 )
      ( MAKE-2CRATE ?auto_33745 ?auto_33738 ?auto_33739 )
      ( MAKE-1CRATE-VERIFY ?auto_33738 ?auto_33739 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33747 - SURFACE
      ?auto_33748 - SURFACE
      ?auto_33749 - SURFACE
    )
    :vars
    (
      ?auto_33750 - HOIST
      ?auto_33752 - PLACE
      ?auto_33755 - TRUCK
      ?auto_33754 - PLACE
      ?auto_33751 - HOIST
      ?auto_33753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33750 ?auto_33752 ) ( SURFACE-AT ?auto_33748 ?auto_33752 ) ( CLEAR ?auto_33748 ) ( IS-CRATE ?auto_33749 ) ( not ( = ?auto_33748 ?auto_33749 ) ) ( AVAILABLE ?auto_33750 ) ( ON ?auto_33748 ?auto_33747 ) ( not ( = ?auto_33747 ?auto_33748 ) ) ( not ( = ?auto_33747 ?auto_33749 ) ) ( TRUCK-AT ?auto_33755 ?auto_33754 ) ( not ( = ?auto_33754 ?auto_33752 ) ) ( HOIST-AT ?auto_33751 ?auto_33754 ) ( not ( = ?auto_33750 ?auto_33751 ) ) ( AVAILABLE ?auto_33751 ) ( SURFACE-AT ?auto_33749 ?auto_33754 ) ( ON ?auto_33749 ?auto_33753 ) ( CLEAR ?auto_33749 ) ( not ( = ?auto_33748 ?auto_33753 ) ) ( not ( = ?auto_33749 ?auto_33753 ) ) ( not ( = ?auto_33747 ?auto_33753 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33748 ?auto_33749 )
      ( MAKE-2CRATE-VERIFY ?auto_33747 ?auto_33748 ?auto_33749 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33756 - SURFACE
      ?auto_33757 - SURFACE
      ?auto_33758 - SURFACE
      ?auto_33759 - SURFACE
    )
    :vars
    (
      ?auto_33760 - HOIST
      ?auto_33763 - PLACE
      ?auto_33761 - TRUCK
      ?auto_33765 - PLACE
      ?auto_33764 - HOIST
      ?auto_33762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33760 ?auto_33763 ) ( SURFACE-AT ?auto_33758 ?auto_33763 ) ( CLEAR ?auto_33758 ) ( IS-CRATE ?auto_33759 ) ( not ( = ?auto_33758 ?auto_33759 ) ) ( AVAILABLE ?auto_33760 ) ( ON ?auto_33758 ?auto_33757 ) ( not ( = ?auto_33757 ?auto_33758 ) ) ( not ( = ?auto_33757 ?auto_33759 ) ) ( TRUCK-AT ?auto_33761 ?auto_33765 ) ( not ( = ?auto_33765 ?auto_33763 ) ) ( HOIST-AT ?auto_33764 ?auto_33765 ) ( not ( = ?auto_33760 ?auto_33764 ) ) ( AVAILABLE ?auto_33764 ) ( SURFACE-AT ?auto_33759 ?auto_33765 ) ( ON ?auto_33759 ?auto_33762 ) ( CLEAR ?auto_33759 ) ( not ( = ?auto_33758 ?auto_33762 ) ) ( not ( = ?auto_33759 ?auto_33762 ) ) ( not ( = ?auto_33757 ?auto_33762 ) ) ( ON ?auto_33757 ?auto_33756 ) ( not ( = ?auto_33756 ?auto_33757 ) ) ( not ( = ?auto_33756 ?auto_33758 ) ) ( not ( = ?auto_33756 ?auto_33759 ) ) ( not ( = ?auto_33756 ?auto_33762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33757 ?auto_33758 ?auto_33759 )
      ( MAKE-3CRATE-VERIFY ?auto_33756 ?auto_33757 ?auto_33758 ?auto_33759 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33766 - SURFACE
      ?auto_33767 - SURFACE
      ?auto_33768 - SURFACE
      ?auto_33769 - SURFACE
      ?auto_33770 - SURFACE
    )
    :vars
    (
      ?auto_33771 - HOIST
      ?auto_33774 - PLACE
      ?auto_33772 - TRUCK
      ?auto_33776 - PLACE
      ?auto_33775 - HOIST
      ?auto_33773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33771 ?auto_33774 ) ( SURFACE-AT ?auto_33769 ?auto_33774 ) ( CLEAR ?auto_33769 ) ( IS-CRATE ?auto_33770 ) ( not ( = ?auto_33769 ?auto_33770 ) ) ( AVAILABLE ?auto_33771 ) ( ON ?auto_33769 ?auto_33768 ) ( not ( = ?auto_33768 ?auto_33769 ) ) ( not ( = ?auto_33768 ?auto_33770 ) ) ( TRUCK-AT ?auto_33772 ?auto_33776 ) ( not ( = ?auto_33776 ?auto_33774 ) ) ( HOIST-AT ?auto_33775 ?auto_33776 ) ( not ( = ?auto_33771 ?auto_33775 ) ) ( AVAILABLE ?auto_33775 ) ( SURFACE-AT ?auto_33770 ?auto_33776 ) ( ON ?auto_33770 ?auto_33773 ) ( CLEAR ?auto_33770 ) ( not ( = ?auto_33769 ?auto_33773 ) ) ( not ( = ?auto_33770 ?auto_33773 ) ) ( not ( = ?auto_33768 ?auto_33773 ) ) ( ON ?auto_33767 ?auto_33766 ) ( ON ?auto_33768 ?auto_33767 ) ( not ( = ?auto_33766 ?auto_33767 ) ) ( not ( = ?auto_33766 ?auto_33768 ) ) ( not ( = ?auto_33766 ?auto_33769 ) ) ( not ( = ?auto_33766 ?auto_33770 ) ) ( not ( = ?auto_33766 ?auto_33773 ) ) ( not ( = ?auto_33767 ?auto_33768 ) ) ( not ( = ?auto_33767 ?auto_33769 ) ) ( not ( = ?auto_33767 ?auto_33770 ) ) ( not ( = ?auto_33767 ?auto_33773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33768 ?auto_33769 ?auto_33770 )
      ( MAKE-4CRATE-VERIFY ?auto_33766 ?auto_33767 ?auto_33768 ?auto_33769 ?auto_33770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33777 - SURFACE
      ?auto_33778 - SURFACE
    )
    :vars
    (
      ?auto_33779 - HOIST
      ?auto_33783 - PLACE
      ?auto_33780 - SURFACE
      ?auto_33785 - PLACE
      ?auto_33784 - HOIST
      ?auto_33782 - SURFACE
      ?auto_33781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33779 ?auto_33783 ) ( SURFACE-AT ?auto_33777 ?auto_33783 ) ( CLEAR ?auto_33777 ) ( IS-CRATE ?auto_33778 ) ( not ( = ?auto_33777 ?auto_33778 ) ) ( AVAILABLE ?auto_33779 ) ( ON ?auto_33777 ?auto_33780 ) ( not ( = ?auto_33780 ?auto_33777 ) ) ( not ( = ?auto_33780 ?auto_33778 ) ) ( not ( = ?auto_33785 ?auto_33783 ) ) ( HOIST-AT ?auto_33784 ?auto_33785 ) ( not ( = ?auto_33779 ?auto_33784 ) ) ( AVAILABLE ?auto_33784 ) ( SURFACE-AT ?auto_33778 ?auto_33785 ) ( ON ?auto_33778 ?auto_33782 ) ( CLEAR ?auto_33778 ) ( not ( = ?auto_33777 ?auto_33782 ) ) ( not ( = ?auto_33778 ?auto_33782 ) ) ( not ( = ?auto_33780 ?auto_33782 ) ) ( TRUCK-AT ?auto_33781 ?auto_33783 ) )
    :subtasks
    ( ( !DRIVE ?auto_33781 ?auto_33783 ?auto_33785 )
      ( MAKE-2CRATE ?auto_33780 ?auto_33777 ?auto_33778 )
      ( MAKE-1CRATE-VERIFY ?auto_33777 ?auto_33778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33786 - SURFACE
      ?auto_33787 - SURFACE
      ?auto_33788 - SURFACE
    )
    :vars
    (
      ?auto_33792 - HOIST
      ?auto_33789 - PLACE
      ?auto_33790 - PLACE
      ?auto_33791 - HOIST
      ?auto_33793 - SURFACE
      ?auto_33794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33792 ?auto_33789 ) ( SURFACE-AT ?auto_33787 ?auto_33789 ) ( CLEAR ?auto_33787 ) ( IS-CRATE ?auto_33788 ) ( not ( = ?auto_33787 ?auto_33788 ) ) ( AVAILABLE ?auto_33792 ) ( ON ?auto_33787 ?auto_33786 ) ( not ( = ?auto_33786 ?auto_33787 ) ) ( not ( = ?auto_33786 ?auto_33788 ) ) ( not ( = ?auto_33790 ?auto_33789 ) ) ( HOIST-AT ?auto_33791 ?auto_33790 ) ( not ( = ?auto_33792 ?auto_33791 ) ) ( AVAILABLE ?auto_33791 ) ( SURFACE-AT ?auto_33788 ?auto_33790 ) ( ON ?auto_33788 ?auto_33793 ) ( CLEAR ?auto_33788 ) ( not ( = ?auto_33787 ?auto_33793 ) ) ( not ( = ?auto_33788 ?auto_33793 ) ) ( not ( = ?auto_33786 ?auto_33793 ) ) ( TRUCK-AT ?auto_33794 ?auto_33789 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33787 ?auto_33788 )
      ( MAKE-2CRATE-VERIFY ?auto_33786 ?auto_33787 ?auto_33788 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33795 - SURFACE
      ?auto_33796 - SURFACE
      ?auto_33797 - SURFACE
      ?auto_33798 - SURFACE
    )
    :vars
    (
      ?auto_33799 - HOIST
      ?auto_33804 - PLACE
      ?auto_33801 - PLACE
      ?auto_33800 - HOIST
      ?auto_33802 - SURFACE
      ?auto_33803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33799 ?auto_33804 ) ( SURFACE-AT ?auto_33797 ?auto_33804 ) ( CLEAR ?auto_33797 ) ( IS-CRATE ?auto_33798 ) ( not ( = ?auto_33797 ?auto_33798 ) ) ( AVAILABLE ?auto_33799 ) ( ON ?auto_33797 ?auto_33796 ) ( not ( = ?auto_33796 ?auto_33797 ) ) ( not ( = ?auto_33796 ?auto_33798 ) ) ( not ( = ?auto_33801 ?auto_33804 ) ) ( HOIST-AT ?auto_33800 ?auto_33801 ) ( not ( = ?auto_33799 ?auto_33800 ) ) ( AVAILABLE ?auto_33800 ) ( SURFACE-AT ?auto_33798 ?auto_33801 ) ( ON ?auto_33798 ?auto_33802 ) ( CLEAR ?auto_33798 ) ( not ( = ?auto_33797 ?auto_33802 ) ) ( not ( = ?auto_33798 ?auto_33802 ) ) ( not ( = ?auto_33796 ?auto_33802 ) ) ( TRUCK-AT ?auto_33803 ?auto_33804 ) ( ON ?auto_33796 ?auto_33795 ) ( not ( = ?auto_33795 ?auto_33796 ) ) ( not ( = ?auto_33795 ?auto_33797 ) ) ( not ( = ?auto_33795 ?auto_33798 ) ) ( not ( = ?auto_33795 ?auto_33802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33796 ?auto_33797 ?auto_33798 )
      ( MAKE-3CRATE-VERIFY ?auto_33795 ?auto_33796 ?auto_33797 ?auto_33798 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33805 - SURFACE
      ?auto_33806 - SURFACE
      ?auto_33807 - SURFACE
      ?auto_33808 - SURFACE
      ?auto_33809 - SURFACE
    )
    :vars
    (
      ?auto_33810 - HOIST
      ?auto_33815 - PLACE
      ?auto_33812 - PLACE
      ?auto_33811 - HOIST
      ?auto_33813 - SURFACE
      ?auto_33814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33810 ?auto_33815 ) ( SURFACE-AT ?auto_33808 ?auto_33815 ) ( CLEAR ?auto_33808 ) ( IS-CRATE ?auto_33809 ) ( not ( = ?auto_33808 ?auto_33809 ) ) ( AVAILABLE ?auto_33810 ) ( ON ?auto_33808 ?auto_33807 ) ( not ( = ?auto_33807 ?auto_33808 ) ) ( not ( = ?auto_33807 ?auto_33809 ) ) ( not ( = ?auto_33812 ?auto_33815 ) ) ( HOIST-AT ?auto_33811 ?auto_33812 ) ( not ( = ?auto_33810 ?auto_33811 ) ) ( AVAILABLE ?auto_33811 ) ( SURFACE-AT ?auto_33809 ?auto_33812 ) ( ON ?auto_33809 ?auto_33813 ) ( CLEAR ?auto_33809 ) ( not ( = ?auto_33808 ?auto_33813 ) ) ( not ( = ?auto_33809 ?auto_33813 ) ) ( not ( = ?auto_33807 ?auto_33813 ) ) ( TRUCK-AT ?auto_33814 ?auto_33815 ) ( ON ?auto_33806 ?auto_33805 ) ( ON ?auto_33807 ?auto_33806 ) ( not ( = ?auto_33805 ?auto_33806 ) ) ( not ( = ?auto_33805 ?auto_33807 ) ) ( not ( = ?auto_33805 ?auto_33808 ) ) ( not ( = ?auto_33805 ?auto_33809 ) ) ( not ( = ?auto_33805 ?auto_33813 ) ) ( not ( = ?auto_33806 ?auto_33807 ) ) ( not ( = ?auto_33806 ?auto_33808 ) ) ( not ( = ?auto_33806 ?auto_33809 ) ) ( not ( = ?auto_33806 ?auto_33813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33807 ?auto_33808 ?auto_33809 )
      ( MAKE-4CRATE-VERIFY ?auto_33805 ?auto_33806 ?auto_33807 ?auto_33808 ?auto_33809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33816 - SURFACE
      ?auto_33817 - SURFACE
    )
    :vars
    (
      ?auto_33818 - HOIST
      ?auto_33824 - PLACE
      ?auto_33820 - SURFACE
      ?auto_33821 - PLACE
      ?auto_33819 - HOIST
      ?auto_33822 - SURFACE
      ?auto_33823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33818 ?auto_33824 ) ( IS-CRATE ?auto_33817 ) ( not ( = ?auto_33816 ?auto_33817 ) ) ( not ( = ?auto_33820 ?auto_33816 ) ) ( not ( = ?auto_33820 ?auto_33817 ) ) ( not ( = ?auto_33821 ?auto_33824 ) ) ( HOIST-AT ?auto_33819 ?auto_33821 ) ( not ( = ?auto_33818 ?auto_33819 ) ) ( AVAILABLE ?auto_33819 ) ( SURFACE-AT ?auto_33817 ?auto_33821 ) ( ON ?auto_33817 ?auto_33822 ) ( CLEAR ?auto_33817 ) ( not ( = ?auto_33816 ?auto_33822 ) ) ( not ( = ?auto_33817 ?auto_33822 ) ) ( not ( = ?auto_33820 ?auto_33822 ) ) ( TRUCK-AT ?auto_33823 ?auto_33824 ) ( SURFACE-AT ?auto_33820 ?auto_33824 ) ( CLEAR ?auto_33820 ) ( LIFTING ?auto_33818 ?auto_33816 ) ( IS-CRATE ?auto_33816 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33820 ?auto_33816 )
      ( MAKE-2CRATE ?auto_33820 ?auto_33816 ?auto_33817 )
      ( MAKE-1CRATE-VERIFY ?auto_33816 ?auto_33817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33825 - SURFACE
      ?auto_33826 - SURFACE
      ?auto_33827 - SURFACE
    )
    :vars
    (
      ?auto_33831 - HOIST
      ?auto_33833 - PLACE
      ?auto_33829 - PLACE
      ?auto_33830 - HOIST
      ?auto_33832 - SURFACE
      ?auto_33828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33831 ?auto_33833 ) ( IS-CRATE ?auto_33827 ) ( not ( = ?auto_33826 ?auto_33827 ) ) ( not ( = ?auto_33825 ?auto_33826 ) ) ( not ( = ?auto_33825 ?auto_33827 ) ) ( not ( = ?auto_33829 ?auto_33833 ) ) ( HOIST-AT ?auto_33830 ?auto_33829 ) ( not ( = ?auto_33831 ?auto_33830 ) ) ( AVAILABLE ?auto_33830 ) ( SURFACE-AT ?auto_33827 ?auto_33829 ) ( ON ?auto_33827 ?auto_33832 ) ( CLEAR ?auto_33827 ) ( not ( = ?auto_33826 ?auto_33832 ) ) ( not ( = ?auto_33827 ?auto_33832 ) ) ( not ( = ?auto_33825 ?auto_33832 ) ) ( TRUCK-AT ?auto_33828 ?auto_33833 ) ( SURFACE-AT ?auto_33825 ?auto_33833 ) ( CLEAR ?auto_33825 ) ( LIFTING ?auto_33831 ?auto_33826 ) ( IS-CRATE ?auto_33826 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33826 ?auto_33827 )
      ( MAKE-2CRATE-VERIFY ?auto_33825 ?auto_33826 ?auto_33827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33834 - SURFACE
      ?auto_33835 - SURFACE
      ?auto_33836 - SURFACE
      ?auto_33837 - SURFACE
    )
    :vars
    (
      ?auto_33838 - HOIST
      ?auto_33840 - PLACE
      ?auto_33842 - PLACE
      ?auto_33843 - HOIST
      ?auto_33841 - SURFACE
      ?auto_33839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33838 ?auto_33840 ) ( IS-CRATE ?auto_33837 ) ( not ( = ?auto_33836 ?auto_33837 ) ) ( not ( = ?auto_33835 ?auto_33836 ) ) ( not ( = ?auto_33835 ?auto_33837 ) ) ( not ( = ?auto_33842 ?auto_33840 ) ) ( HOIST-AT ?auto_33843 ?auto_33842 ) ( not ( = ?auto_33838 ?auto_33843 ) ) ( AVAILABLE ?auto_33843 ) ( SURFACE-AT ?auto_33837 ?auto_33842 ) ( ON ?auto_33837 ?auto_33841 ) ( CLEAR ?auto_33837 ) ( not ( = ?auto_33836 ?auto_33841 ) ) ( not ( = ?auto_33837 ?auto_33841 ) ) ( not ( = ?auto_33835 ?auto_33841 ) ) ( TRUCK-AT ?auto_33839 ?auto_33840 ) ( SURFACE-AT ?auto_33835 ?auto_33840 ) ( CLEAR ?auto_33835 ) ( LIFTING ?auto_33838 ?auto_33836 ) ( IS-CRATE ?auto_33836 ) ( ON ?auto_33835 ?auto_33834 ) ( not ( = ?auto_33834 ?auto_33835 ) ) ( not ( = ?auto_33834 ?auto_33836 ) ) ( not ( = ?auto_33834 ?auto_33837 ) ) ( not ( = ?auto_33834 ?auto_33841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33835 ?auto_33836 ?auto_33837 )
      ( MAKE-3CRATE-VERIFY ?auto_33834 ?auto_33835 ?auto_33836 ?auto_33837 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33844 - SURFACE
      ?auto_33845 - SURFACE
      ?auto_33846 - SURFACE
      ?auto_33847 - SURFACE
      ?auto_33848 - SURFACE
    )
    :vars
    (
      ?auto_33849 - HOIST
      ?auto_33851 - PLACE
      ?auto_33853 - PLACE
      ?auto_33854 - HOIST
      ?auto_33852 - SURFACE
      ?auto_33850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33849 ?auto_33851 ) ( IS-CRATE ?auto_33848 ) ( not ( = ?auto_33847 ?auto_33848 ) ) ( not ( = ?auto_33846 ?auto_33847 ) ) ( not ( = ?auto_33846 ?auto_33848 ) ) ( not ( = ?auto_33853 ?auto_33851 ) ) ( HOIST-AT ?auto_33854 ?auto_33853 ) ( not ( = ?auto_33849 ?auto_33854 ) ) ( AVAILABLE ?auto_33854 ) ( SURFACE-AT ?auto_33848 ?auto_33853 ) ( ON ?auto_33848 ?auto_33852 ) ( CLEAR ?auto_33848 ) ( not ( = ?auto_33847 ?auto_33852 ) ) ( not ( = ?auto_33848 ?auto_33852 ) ) ( not ( = ?auto_33846 ?auto_33852 ) ) ( TRUCK-AT ?auto_33850 ?auto_33851 ) ( SURFACE-AT ?auto_33846 ?auto_33851 ) ( CLEAR ?auto_33846 ) ( LIFTING ?auto_33849 ?auto_33847 ) ( IS-CRATE ?auto_33847 ) ( ON ?auto_33845 ?auto_33844 ) ( ON ?auto_33846 ?auto_33845 ) ( not ( = ?auto_33844 ?auto_33845 ) ) ( not ( = ?auto_33844 ?auto_33846 ) ) ( not ( = ?auto_33844 ?auto_33847 ) ) ( not ( = ?auto_33844 ?auto_33848 ) ) ( not ( = ?auto_33844 ?auto_33852 ) ) ( not ( = ?auto_33845 ?auto_33846 ) ) ( not ( = ?auto_33845 ?auto_33847 ) ) ( not ( = ?auto_33845 ?auto_33848 ) ) ( not ( = ?auto_33845 ?auto_33852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33846 ?auto_33847 ?auto_33848 )
      ( MAKE-4CRATE-VERIFY ?auto_33844 ?auto_33845 ?auto_33846 ?auto_33847 ?auto_33848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33855 - SURFACE
      ?auto_33856 - SURFACE
    )
    :vars
    (
      ?auto_33857 - HOIST
      ?auto_33859 - PLACE
      ?auto_33861 - SURFACE
      ?auto_33862 - PLACE
      ?auto_33863 - HOIST
      ?auto_33860 - SURFACE
      ?auto_33858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33857 ?auto_33859 ) ( IS-CRATE ?auto_33856 ) ( not ( = ?auto_33855 ?auto_33856 ) ) ( not ( = ?auto_33861 ?auto_33855 ) ) ( not ( = ?auto_33861 ?auto_33856 ) ) ( not ( = ?auto_33862 ?auto_33859 ) ) ( HOIST-AT ?auto_33863 ?auto_33862 ) ( not ( = ?auto_33857 ?auto_33863 ) ) ( AVAILABLE ?auto_33863 ) ( SURFACE-AT ?auto_33856 ?auto_33862 ) ( ON ?auto_33856 ?auto_33860 ) ( CLEAR ?auto_33856 ) ( not ( = ?auto_33855 ?auto_33860 ) ) ( not ( = ?auto_33856 ?auto_33860 ) ) ( not ( = ?auto_33861 ?auto_33860 ) ) ( TRUCK-AT ?auto_33858 ?auto_33859 ) ( SURFACE-AT ?auto_33861 ?auto_33859 ) ( CLEAR ?auto_33861 ) ( IS-CRATE ?auto_33855 ) ( AVAILABLE ?auto_33857 ) ( IN ?auto_33855 ?auto_33858 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33857 ?auto_33855 ?auto_33858 ?auto_33859 )
      ( MAKE-2CRATE ?auto_33861 ?auto_33855 ?auto_33856 )
      ( MAKE-1CRATE-VERIFY ?auto_33855 ?auto_33856 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33864 - SURFACE
      ?auto_33865 - SURFACE
      ?auto_33866 - SURFACE
    )
    :vars
    (
      ?auto_33870 - HOIST
      ?auto_33867 - PLACE
      ?auto_33872 - PLACE
      ?auto_33869 - HOIST
      ?auto_33871 - SURFACE
      ?auto_33868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33870 ?auto_33867 ) ( IS-CRATE ?auto_33866 ) ( not ( = ?auto_33865 ?auto_33866 ) ) ( not ( = ?auto_33864 ?auto_33865 ) ) ( not ( = ?auto_33864 ?auto_33866 ) ) ( not ( = ?auto_33872 ?auto_33867 ) ) ( HOIST-AT ?auto_33869 ?auto_33872 ) ( not ( = ?auto_33870 ?auto_33869 ) ) ( AVAILABLE ?auto_33869 ) ( SURFACE-AT ?auto_33866 ?auto_33872 ) ( ON ?auto_33866 ?auto_33871 ) ( CLEAR ?auto_33866 ) ( not ( = ?auto_33865 ?auto_33871 ) ) ( not ( = ?auto_33866 ?auto_33871 ) ) ( not ( = ?auto_33864 ?auto_33871 ) ) ( TRUCK-AT ?auto_33868 ?auto_33867 ) ( SURFACE-AT ?auto_33864 ?auto_33867 ) ( CLEAR ?auto_33864 ) ( IS-CRATE ?auto_33865 ) ( AVAILABLE ?auto_33870 ) ( IN ?auto_33865 ?auto_33868 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33865 ?auto_33866 )
      ( MAKE-2CRATE-VERIFY ?auto_33864 ?auto_33865 ?auto_33866 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33873 - SURFACE
      ?auto_33874 - SURFACE
      ?auto_33875 - SURFACE
      ?auto_33876 - SURFACE
    )
    :vars
    (
      ?auto_33879 - HOIST
      ?auto_33877 - PLACE
      ?auto_33882 - PLACE
      ?auto_33880 - HOIST
      ?auto_33881 - SURFACE
      ?auto_33878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33879 ?auto_33877 ) ( IS-CRATE ?auto_33876 ) ( not ( = ?auto_33875 ?auto_33876 ) ) ( not ( = ?auto_33874 ?auto_33875 ) ) ( not ( = ?auto_33874 ?auto_33876 ) ) ( not ( = ?auto_33882 ?auto_33877 ) ) ( HOIST-AT ?auto_33880 ?auto_33882 ) ( not ( = ?auto_33879 ?auto_33880 ) ) ( AVAILABLE ?auto_33880 ) ( SURFACE-AT ?auto_33876 ?auto_33882 ) ( ON ?auto_33876 ?auto_33881 ) ( CLEAR ?auto_33876 ) ( not ( = ?auto_33875 ?auto_33881 ) ) ( not ( = ?auto_33876 ?auto_33881 ) ) ( not ( = ?auto_33874 ?auto_33881 ) ) ( TRUCK-AT ?auto_33878 ?auto_33877 ) ( SURFACE-AT ?auto_33874 ?auto_33877 ) ( CLEAR ?auto_33874 ) ( IS-CRATE ?auto_33875 ) ( AVAILABLE ?auto_33879 ) ( IN ?auto_33875 ?auto_33878 ) ( ON ?auto_33874 ?auto_33873 ) ( not ( = ?auto_33873 ?auto_33874 ) ) ( not ( = ?auto_33873 ?auto_33875 ) ) ( not ( = ?auto_33873 ?auto_33876 ) ) ( not ( = ?auto_33873 ?auto_33881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33874 ?auto_33875 ?auto_33876 )
      ( MAKE-3CRATE-VERIFY ?auto_33873 ?auto_33874 ?auto_33875 ?auto_33876 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33883 - SURFACE
      ?auto_33884 - SURFACE
      ?auto_33885 - SURFACE
      ?auto_33886 - SURFACE
      ?auto_33887 - SURFACE
    )
    :vars
    (
      ?auto_33890 - HOIST
      ?auto_33888 - PLACE
      ?auto_33893 - PLACE
      ?auto_33891 - HOIST
      ?auto_33892 - SURFACE
      ?auto_33889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33890 ?auto_33888 ) ( IS-CRATE ?auto_33887 ) ( not ( = ?auto_33886 ?auto_33887 ) ) ( not ( = ?auto_33885 ?auto_33886 ) ) ( not ( = ?auto_33885 ?auto_33887 ) ) ( not ( = ?auto_33893 ?auto_33888 ) ) ( HOIST-AT ?auto_33891 ?auto_33893 ) ( not ( = ?auto_33890 ?auto_33891 ) ) ( AVAILABLE ?auto_33891 ) ( SURFACE-AT ?auto_33887 ?auto_33893 ) ( ON ?auto_33887 ?auto_33892 ) ( CLEAR ?auto_33887 ) ( not ( = ?auto_33886 ?auto_33892 ) ) ( not ( = ?auto_33887 ?auto_33892 ) ) ( not ( = ?auto_33885 ?auto_33892 ) ) ( TRUCK-AT ?auto_33889 ?auto_33888 ) ( SURFACE-AT ?auto_33885 ?auto_33888 ) ( CLEAR ?auto_33885 ) ( IS-CRATE ?auto_33886 ) ( AVAILABLE ?auto_33890 ) ( IN ?auto_33886 ?auto_33889 ) ( ON ?auto_33884 ?auto_33883 ) ( ON ?auto_33885 ?auto_33884 ) ( not ( = ?auto_33883 ?auto_33884 ) ) ( not ( = ?auto_33883 ?auto_33885 ) ) ( not ( = ?auto_33883 ?auto_33886 ) ) ( not ( = ?auto_33883 ?auto_33887 ) ) ( not ( = ?auto_33883 ?auto_33892 ) ) ( not ( = ?auto_33884 ?auto_33885 ) ) ( not ( = ?auto_33884 ?auto_33886 ) ) ( not ( = ?auto_33884 ?auto_33887 ) ) ( not ( = ?auto_33884 ?auto_33892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33885 ?auto_33886 ?auto_33887 )
      ( MAKE-4CRATE-VERIFY ?auto_33883 ?auto_33884 ?auto_33885 ?auto_33886 ?auto_33887 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33894 - SURFACE
      ?auto_33895 - SURFACE
    )
    :vars
    (
      ?auto_33899 - HOIST
      ?auto_33897 - PLACE
      ?auto_33896 - SURFACE
      ?auto_33902 - PLACE
      ?auto_33900 - HOIST
      ?auto_33901 - SURFACE
      ?auto_33898 - TRUCK
      ?auto_33903 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33899 ?auto_33897 ) ( IS-CRATE ?auto_33895 ) ( not ( = ?auto_33894 ?auto_33895 ) ) ( not ( = ?auto_33896 ?auto_33894 ) ) ( not ( = ?auto_33896 ?auto_33895 ) ) ( not ( = ?auto_33902 ?auto_33897 ) ) ( HOIST-AT ?auto_33900 ?auto_33902 ) ( not ( = ?auto_33899 ?auto_33900 ) ) ( AVAILABLE ?auto_33900 ) ( SURFACE-AT ?auto_33895 ?auto_33902 ) ( ON ?auto_33895 ?auto_33901 ) ( CLEAR ?auto_33895 ) ( not ( = ?auto_33894 ?auto_33901 ) ) ( not ( = ?auto_33895 ?auto_33901 ) ) ( not ( = ?auto_33896 ?auto_33901 ) ) ( SURFACE-AT ?auto_33896 ?auto_33897 ) ( CLEAR ?auto_33896 ) ( IS-CRATE ?auto_33894 ) ( AVAILABLE ?auto_33899 ) ( IN ?auto_33894 ?auto_33898 ) ( TRUCK-AT ?auto_33898 ?auto_33903 ) ( not ( = ?auto_33903 ?auto_33897 ) ) ( not ( = ?auto_33902 ?auto_33903 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33898 ?auto_33903 ?auto_33897 )
      ( MAKE-2CRATE ?auto_33896 ?auto_33894 ?auto_33895 )
      ( MAKE-1CRATE-VERIFY ?auto_33894 ?auto_33895 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33904 - SURFACE
      ?auto_33905 - SURFACE
      ?auto_33906 - SURFACE
    )
    :vars
    (
      ?auto_33912 - HOIST
      ?auto_33907 - PLACE
      ?auto_33909 - PLACE
      ?auto_33913 - HOIST
      ?auto_33908 - SURFACE
      ?auto_33911 - TRUCK
      ?auto_33910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33912 ?auto_33907 ) ( IS-CRATE ?auto_33906 ) ( not ( = ?auto_33905 ?auto_33906 ) ) ( not ( = ?auto_33904 ?auto_33905 ) ) ( not ( = ?auto_33904 ?auto_33906 ) ) ( not ( = ?auto_33909 ?auto_33907 ) ) ( HOIST-AT ?auto_33913 ?auto_33909 ) ( not ( = ?auto_33912 ?auto_33913 ) ) ( AVAILABLE ?auto_33913 ) ( SURFACE-AT ?auto_33906 ?auto_33909 ) ( ON ?auto_33906 ?auto_33908 ) ( CLEAR ?auto_33906 ) ( not ( = ?auto_33905 ?auto_33908 ) ) ( not ( = ?auto_33906 ?auto_33908 ) ) ( not ( = ?auto_33904 ?auto_33908 ) ) ( SURFACE-AT ?auto_33904 ?auto_33907 ) ( CLEAR ?auto_33904 ) ( IS-CRATE ?auto_33905 ) ( AVAILABLE ?auto_33912 ) ( IN ?auto_33905 ?auto_33911 ) ( TRUCK-AT ?auto_33911 ?auto_33910 ) ( not ( = ?auto_33910 ?auto_33907 ) ) ( not ( = ?auto_33909 ?auto_33910 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33905 ?auto_33906 )
      ( MAKE-2CRATE-VERIFY ?auto_33904 ?auto_33905 ?auto_33906 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33914 - SURFACE
      ?auto_33915 - SURFACE
      ?auto_33916 - SURFACE
      ?auto_33917 - SURFACE
    )
    :vars
    (
      ?auto_33920 - HOIST
      ?auto_33919 - PLACE
      ?auto_33921 - PLACE
      ?auto_33922 - HOIST
      ?auto_33918 - SURFACE
      ?auto_33923 - TRUCK
      ?auto_33924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33920 ?auto_33919 ) ( IS-CRATE ?auto_33917 ) ( not ( = ?auto_33916 ?auto_33917 ) ) ( not ( = ?auto_33915 ?auto_33916 ) ) ( not ( = ?auto_33915 ?auto_33917 ) ) ( not ( = ?auto_33921 ?auto_33919 ) ) ( HOIST-AT ?auto_33922 ?auto_33921 ) ( not ( = ?auto_33920 ?auto_33922 ) ) ( AVAILABLE ?auto_33922 ) ( SURFACE-AT ?auto_33917 ?auto_33921 ) ( ON ?auto_33917 ?auto_33918 ) ( CLEAR ?auto_33917 ) ( not ( = ?auto_33916 ?auto_33918 ) ) ( not ( = ?auto_33917 ?auto_33918 ) ) ( not ( = ?auto_33915 ?auto_33918 ) ) ( SURFACE-AT ?auto_33915 ?auto_33919 ) ( CLEAR ?auto_33915 ) ( IS-CRATE ?auto_33916 ) ( AVAILABLE ?auto_33920 ) ( IN ?auto_33916 ?auto_33923 ) ( TRUCK-AT ?auto_33923 ?auto_33924 ) ( not ( = ?auto_33924 ?auto_33919 ) ) ( not ( = ?auto_33921 ?auto_33924 ) ) ( ON ?auto_33915 ?auto_33914 ) ( not ( = ?auto_33914 ?auto_33915 ) ) ( not ( = ?auto_33914 ?auto_33916 ) ) ( not ( = ?auto_33914 ?auto_33917 ) ) ( not ( = ?auto_33914 ?auto_33918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33915 ?auto_33916 ?auto_33917 )
      ( MAKE-3CRATE-VERIFY ?auto_33914 ?auto_33915 ?auto_33916 ?auto_33917 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33925 - SURFACE
      ?auto_33926 - SURFACE
      ?auto_33927 - SURFACE
      ?auto_33928 - SURFACE
      ?auto_33929 - SURFACE
    )
    :vars
    (
      ?auto_33932 - HOIST
      ?auto_33931 - PLACE
      ?auto_33933 - PLACE
      ?auto_33934 - HOIST
      ?auto_33930 - SURFACE
      ?auto_33935 - TRUCK
      ?auto_33936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33932 ?auto_33931 ) ( IS-CRATE ?auto_33929 ) ( not ( = ?auto_33928 ?auto_33929 ) ) ( not ( = ?auto_33927 ?auto_33928 ) ) ( not ( = ?auto_33927 ?auto_33929 ) ) ( not ( = ?auto_33933 ?auto_33931 ) ) ( HOIST-AT ?auto_33934 ?auto_33933 ) ( not ( = ?auto_33932 ?auto_33934 ) ) ( AVAILABLE ?auto_33934 ) ( SURFACE-AT ?auto_33929 ?auto_33933 ) ( ON ?auto_33929 ?auto_33930 ) ( CLEAR ?auto_33929 ) ( not ( = ?auto_33928 ?auto_33930 ) ) ( not ( = ?auto_33929 ?auto_33930 ) ) ( not ( = ?auto_33927 ?auto_33930 ) ) ( SURFACE-AT ?auto_33927 ?auto_33931 ) ( CLEAR ?auto_33927 ) ( IS-CRATE ?auto_33928 ) ( AVAILABLE ?auto_33932 ) ( IN ?auto_33928 ?auto_33935 ) ( TRUCK-AT ?auto_33935 ?auto_33936 ) ( not ( = ?auto_33936 ?auto_33931 ) ) ( not ( = ?auto_33933 ?auto_33936 ) ) ( ON ?auto_33926 ?auto_33925 ) ( ON ?auto_33927 ?auto_33926 ) ( not ( = ?auto_33925 ?auto_33926 ) ) ( not ( = ?auto_33925 ?auto_33927 ) ) ( not ( = ?auto_33925 ?auto_33928 ) ) ( not ( = ?auto_33925 ?auto_33929 ) ) ( not ( = ?auto_33925 ?auto_33930 ) ) ( not ( = ?auto_33926 ?auto_33927 ) ) ( not ( = ?auto_33926 ?auto_33928 ) ) ( not ( = ?auto_33926 ?auto_33929 ) ) ( not ( = ?auto_33926 ?auto_33930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33927 ?auto_33928 ?auto_33929 )
      ( MAKE-4CRATE-VERIFY ?auto_33925 ?auto_33926 ?auto_33927 ?auto_33928 ?auto_33929 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33937 - SURFACE
      ?auto_33938 - SURFACE
    )
    :vars
    (
      ?auto_33941 - HOIST
      ?auto_33940 - PLACE
      ?auto_33944 - SURFACE
      ?auto_33942 - PLACE
      ?auto_33943 - HOIST
      ?auto_33939 - SURFACE
      ?auto_33945 - TRUCK
      ?auto_33946 - PLACE
      ?auto_33947 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33941 ?auto_33940 ) ( IS-CRATE ?auto_33938 ) ( not ( = ?auto_33937 ?auto_33938 ) ) ( not ( = ?auto_33944 ?auto_33937 ) ) ( not ( = ?auto_33944 ?auto_33938 ) ) ( not ( = ?auto_33942 ?auto_33940 ) ) ( HOIST-AT ?auto_33943 ?auto_33942 ) ( not ( = ?auto_33941 ?auto_33943 ) ) ( AVAILABLE ?auto_33943 ) ( SURFACE-AT ?auto_33938 ?auto_33942 ) ( ON ?auto_33938 ?auto_33939 ) ( CLEAR ?auto_33938 ) ( not ( = ?auto_33937 ?auto_33939 ) ) ( not ( = ?auto_33938 ?auto_33939 ) ) ( not ( = ?auto_33944 ?auto_33939 ) ) ( SURFACE-AT ?auto_33944 ?auto_33940 ) ( CLEAR ?auto_33944 ) ( IS-CRATE ?auto_33937 ) ( AVAILABLE ?auto_33941 ) ( TRUCK-AT ?auto_33945 ?auto_33946 ) ( not ( = ?auto_33946 ?auto_33940 ) ) ( not ( = ?auto_33942 ?auto_33946 ) ) ( HOIST-AT ?auto_33947 ?auto_33946 ) ( LIFTING ?auto_33947 ?auto_33937 ) ( not ( = ?auto_33941 ?auto_33947 ) ) ( not ( = ?auto_33943 ?auto_33947 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33947 ?auto_33937 ?auto_33945 ?auto_33946 )
      ( MAKE-2CRATE ?auto_33944 ?auto_33937 ?auto_33938 )
      ( MAKE-1CRATE-VERIFY ?auto_33937 ?auto_33938 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33948 - SURFACE
      ?auto_33949 - SURFACE
      ?auto_33950 - SURFACE
    )
    :vars
    (
      ?auto_33958 - HOIST
      ?auto_33951 - PLACE
      ?auto_33952 - PLACE
      ?auto_33957 - HOIST
      ?auto_33955 - SURFACE
      ?auto_33953 - TRUCK
      ?auto_33954 - PLACE
      ?auto_33956 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33958 ?auto_33951 ) ( IS-CRATE ?auto_33950 ) ( not ( = ?auto_33949 ?auto_33950 ) ) ( not ( = ?auto_33948 ?auto_33949 ) ) ( not ( = ?auto_33948 ?auto_33950 ) ) ( not ( = ?auto_33952 ?auto_33951 ) ) ( HOIST-AT ?auto_33957 ?auto_33952 ) ( not ( = ?auto_33958 ?auto_33957 ) ) ( AVAILABLE ?auto_33957 ) ( SURFACE-AT ?auto_33950 ?auto_33952 ) ( ON ?auto_33950 ?auto_33955 ) ( CLEAR ?auto_33950 ) ( not ( = ?auto_33949 ?auto_33955 ) ) ( not ( = ?auto_33950 ?auto_33955 ) ) ( not ( = ?auto_33948 ?auto_33955 ) ) ( SURFACE-AT ?auto_33948 ?auto_33951 ) ( CLEAR ?auto_33948 ) ( IS-CRATE ?auto_33949 ) ( AVAILABLE ?auto_33958 ) ( TRUCK-AT ?auto_33953 ?auto_33954 ) ( not ( = ?auto_33954 ?auto_33951 ) ) ( not ( = ?auto_33952 ?auto_33954 ) ) ( HOIST-AT ?auto_33956 ?auto_33954 ) ( LIFTING ?auto_33956 ?auto_33949 ) ( not ( = ?auto_33958 ?auto_33956 ) ) ( not ( = ?auto_33957 ?auto_33956 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33949 ?auto_33950 )
      ( MAKE-2CRATE-VERIFY ?auto_33948 ?auto_33949 ?auto_33950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33959 - SURFACE
      ?auto_33960 - SURFACE
      ?auto_33961 - SURFACE
      ?auto_33962 - SURFACE
    )
    :vars
    (
      ?auto_33963 - HOIST
      ?auto_33970 - PLACE
      ?auto_33966 - PLACE
      ?auto_33965 - HOIST
      ?auto_33968 - SURFACE
      ?auto_33967 - TRUCK
      ?auto_33969 - PLACE
      ?auto_33964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33963 ?auto_33970 ) ( IS-CRATE ?auto_33962 ) ( not ( = ?auto_33961 ?auto_33962 ) ) ( not ( = ?auto_33960 ?auto_33961 ) ) ( not ( = ?auto_33960 ?auto_33962 ) ) ( not ( = ?auto_33966 ?auto_33970 ) ) ( HOIST-AT ?auto_33965 ?auto_33966 ) ( not ( = ?auto_33963 ?auto_33965 ) ) ( AVAILABLE ?auto_33965 ) ( SURFACE-AT ?auto_33962 ?auto_33966 ) ( ON ?auto_33962 ?auto_33968 ) ( CLEAR ?auto_33962 ) ( not ( = ?auto_33961 ?auto_33968 ) ) ( not ( = ?auto_33962 ?auto_33968 ) ) ( not ( = ?auto_33960 ?auto_33968 ) ) ( SURFACE-AT ?auto_33960 ?auto_33970 ) ( CLEAR ?auto_33960 ) ( IS-CRATE ?auto_33961 ) ( AVAILABLE ?auto_33963 ) ( TRUCK-AT ?auto_33967 ?auto_33969 ) ( not ( = ?auto_33969 ?auto_33970 ) ) ( not ( = ?auto_33966 ?auto_33969 ) ) ( HOIST-AT ?auto_33964 ?auto_33969 ) ( LIFTING ?auto_33964 ?auto_33961 ) ( not ( = ?auto_33963 ?auto_33964 ) ) ( not ( = ?auto_33965 ?auto_33964 ) ) ( ON ?auto_33960 ?auto_33959 ) ( not ( = ?auto_33959 ?auto_33960 ) ) ( not ( = ?auto_33959 ?auto_33961 ) ) ( not ( = ?auto_33959 ?auto_33962 ) ) ( not ( = ?auto_33959 ?auto_33968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33960 ?auto_33961 ?auto_33962 )
      ( MAKE-3CRATE-VERIFY ?auto_33959 ?auto_33960 ?auto_33961 ?auto_33962 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33971 - SURFACE
      ?auto_33972 - SURFACE
      ?auto_33973 - SURFACE
      ?auto_33974 - SURFACE
      ?auto_33975 - SURFACE
    )
    :vars
    (
      ?auto_33976 - HOIST
      ?auto_33983 - PLACE
      ?auto_33979 - PLACE
      ?auto_33978 - HOIST
      ?auto_33981 - SURFACE
      ?auto_33980 - TRUCK
      ?auto_33982 - PLACE
      ?auto_33977 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33976 ?auto_33983 ) ( IS-CRATE ?auto_33975 ) ( not ( = ?auto_33974 ?auto_33975 ) ) ( not ( = ?auto_33973 ?auto_33974 ) ) ( not ( = ?auto_33973 ?auto_33975 ) ) ( not ( = ?auto_33979 ?auto_33983 ) ) ( HOIST-AT ?auto_33978 ?auto_33979 ) ( not ( = ?auto_33976 ?auto_33978 ) ) ( AVAILABLE ?auto_33978 ) ( SURFACE-AT ?auto_33975 ?auto_33979 ) ( ON ?auto_33975 ?auto_33981 ) ( CLEAR ?auto_33975 ) ( not ( = ?auto_33974 ?auto_33981 ) ) ( not ( = ?auto_33975 ?auto_33981 ) ) ( not ( = ?auto_33973 ?auto_33981 ) ) ( SURFACE-AT ?auto_33973 ?auto_33983 ) ( CLEAR ?auto_33973 ) ( IS-CRATE ?auto_33974 ) ( AVAILABLE ?auto_33976 ) ( TRUCK-AT ?auto_33980 ?auto_33982 ) ( not ( = ?auto_33982 ?auto_33983 ) ) ( not ( = ?auto_33979 ?auto_33982 ) ) ( HOIST-AT ?auto_33977 ?auto_33982 ) ( LIFTING ?auto_33977 ?auto_33974 ) ( not ( = ?auto_33976 ?auto_33977 ) ) ( not ( = ?auto_33978 ?auto_33977 ) ) ( ON ?auto_33972 ?auto_33971 ) ( ON ?auto_33973 ?auto_33972 ) ( not ( = ?auto_33971 ?auto_33972 ) ) ( not ( = ?auto_33971 ?auto_33973 ) ) ( not ( = ?auto_33971 ?auto_33974 ) ) ( not ( = ?auto_33971 ?auto_33975 ) ) ( not ( = ?auto_33971 ?auto_33981 ) ) ( not ( = ?auto_33972 ?auto_33973 ) ) ( not ( = ?auto_33972 ?auto_33974 ) ) ( not ( = ?auto_33972 ?auto_33975 ) ) ( not ( = ?auto_33972 ?auto_33981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33973 ?auto_33974 ?auto_33975 )
      ( MAKE-4CRATE-VERIFY ?auto_33971 ?auto_33972 ?auto_33973 ?auto_33974 ?auto_33975 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33984 - SURFACE
      ?auto_33985 - SURFACE
    )
    :vars
    (
      ?auto_33987 - HOIST
      ?auto_33994 - PLACE
      ?auto_33986 - SURFACE
      ?auto_33990 - PLACE
      ?auto_33989 - HOIST
      ?auto_33992 - SURFACE
      ?auto_33991 - TRUCK
      ?auto_33993 - PLACE
      ?auto_33988 - HOIST
      ?auto_33995 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33987 ?auto_33994 ) ( IS-CRATE ?auto_33985 ) ( not ( = ?auto_33984 ?auto_33985 ) ) ( not ( = ?auto_33986 ?auto_33984 ) ) ( not ( = ?auto_33986 ?auto_33985 ) ) ( not ( = ?auto_33990 ?auto_33994 ) ) ( HOIST-AT ?auto_33989 ?auto_33990 ) ( not ( = ?auto_33987 ?auto_33989 ) ) ( AVAILABLE ?auto_33989 ) ( SURFACE-AT ?auto_33985 ?auto_33990 ) ( ON ?auto_33985 ?auto_33992 ) ( CLEAR ?auto_33985 ) ( not ( = ?auto_33984 ?auto_33992 ) ) ( not ( = ?auto_33985 ?auto_33992 ) ) ( not ( = ?auto_33986 ?auto_33992 ) ) ( SURFACE-AT ?auto_33986 ?auto_33994 ) ( CLEAR ?auto_33986 ) ( IS-CRATE ?auto_33984 ) ( AVAILABLE ?auto_33987 ) ( TRUCK-AT ?auto_33991 ?auto_33993 ) ( not ( = ?auto_33993 ?auto_33994 ) ) ( not ( = ?auto_33990 ?auto_33993 ) ) ( HOIST-AT ?auto_33988 ?auto_33993 ) ( not ( = ?auto_33987 ?auto_33988 ) ) ( not ( = ?auto_33989 ?auto_33988 ) ) ( AVAILABLE ?auto_33988 ) ( SURFACE-AT ?auto_33984 ?auto_33993 ) ( ON ?auto_33984 ?auto_33995 ) ( CLEAR ?auto_33984 ) ( not ( = ?auto_33984 ?auto_33995 ) ) ( not ( = ?auto_33985 ?auto_33995 ) ) ( not ( = ?auto_33986 ?auto_33995 ) ) ( not ( = ?auto_33992 ?auto_33995 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33988 ?auto_33984 ?auto_33995 ?auto_33993 )
      ( MAKE-2CRATE ?auto_33986 ?auto_33984 ?auto_33985 )
      ( MAKE-1CRATE-VERIFY ?auto_33984 ?auto_33985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33996 - SURFACE
      ?auto_33997 - SURFACE
      ?auto_33998 - SURFACE
    )
    :vars
    (
      ?auto_34001 - HOIST
      ?auto_33999 - PLACE
      ?auto_34006 - PLACE
      ?auto_34002 - HOIST
      ?auto_34007 - SURFACE
      ?auto_34004 - TRUCK
      ?auto_34003 - PLACE
      ?auto_34005 - HOIST
      ?auto_34000 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34001 ?auto_33999 ) ( IS-CRATE ?auto_33998 ) ( not ( = ?auto_33997 ?auto_33998 ) ) ( not ( = ?auto_33996 ?auto_33997 ) ) ( not ( = ?auto_33996 ?auto_33998 ) ) ( not ( = ?auto_34006 ?auto_33999 ) ) ( HOIST-AT ?auto_34002 ?auto_34006 ) ( not ( = ?auto_34001 ?auto_34002 ) ) ( AVAILABLE ?auto_34002 ) ( SURFACE-AT ?auto_33998 ?auto_34006 ) ( ON ?auto_33998 ?auto_34007 ) ( CLEAR ?auto_33998 ) ( not ( = ?auto_33997 ?auto_34007 ) ) ( not ( = ?auto_33998 ?auto_34007 ) ) ( not ( = ?auto_33996 ?auto_34007 ) ) ( SURFACE-AT ?auto_33996 ?auto_33999 ) ( CLEAR ?auto_33996 ) ( IS-CRATE ?auto_33997 ) ( AVAILABLE ?auto_34001 ) ( TRUCK-AT ?auto_34004 ?auto_34003 ) ( not ( = ?auto_34003 ?auto_33999 ) ) ( not ( = ?auto_34006 ?auto_34003 ) ) ( HOIST-AT ?auto_34005 ?auto_34003 ) ( not ( = ?auto_34001 ?auto_34005 ) ) ( not ( = ?auto_34002 ?auto_34005 ) ) ( AVAILABLE ?auto_34005 ) ( SURFACE-AT ?auto_33997 ?auto_34003 ) ( ON ?auto_33997 ?auto_34000 ) ( CLEAR ?auto_33997 ) ( not ( = ?auto_33997 ?auto_34000 ) ) ( not ( = ?auto_33998 ?auto_34000 ) ) ( not ( = ?auto_33996 ?auto_34000 ) ) ( not ( = ?auto_34007 ?auto_34000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33997 ?auto_33998 )
      ( MAKE-2CRATE-VERIFY ?auto_33996 ?auto_33997 ?auto_33998 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34008 - SURFACE
      ?auto_34009 - SURFACE
      ?auto_34010 - SURFACE
      ?auto_34011 - SURFACE
    )
    :vars
    (
      ?auto_34012 - HOIST
      ?auto_34015 - PLACE
      ?auto_34018 - PLACE
      ?auto_34014 - HOIST
      ?auto_34013 - SURFACE
      ?auto_34017 - TRUCK
      ?auto_34020 - PLACE
      ?auto_34019 - HOIST
      ?auto_34016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34012 ?auto_34015 ) ( IS-CRATE ?auto_34011 ) ( not ( = ?auto_34010 ?auto_34011 ) ) ( not ( = ?auto_34009 ?auto_34010 ) ) ( not ( = ?auto_34009 ?auto_34011 ) ) ( not ( = ?auto_34018 ?auto_34015 ) ) ( HOIST-AT ?auto_34014 ?auto_34018 ) ( not ( = ?auto_34012 ?auto_34014 ) ) ( AVAILABLE ?auto_34014 ) ( SURFACE-AT ?auto_34011 ?auto_34018 ) ( ON ?auto_34011 ?auto_34013 ) ( CLEAR ?auto_34011 ) ( not ( = ?auto_34010 ?auto_34013 ) ) ( not ( = ?auto_34011 ?auto_34013 ) ) ( not ( = ?auto_34009 ?auto_34013 ) ) ( SURFACE-AT ?auto_34009 ?auto_34015 ) ( CLEAR ?auto_34009 ) ( IS-CRATE ?auto_34010 ) ( AVAILABLE ?auto_34012 ) ( TRUCK-AT ?auto_34017 ?auto_34020 ) ( not ( = ?auto_34020 ?auto_34015 ) ) ( not ( = ?auto_34018 ?auto_34020 ) ) ( HOIST-AT ?auto_34019 ?auto_34020 ) ( not ( = ?auto_34012 ?auto_34019 ) ) ( not ( = ?auto_34014 ?auto_34019 ) ) ( AVAILABLE ?auto_34019 ) ( SURFACE-AT ?auto_34010 ?auto_34020 ) ( ON ?auto_34010 ?auto_34016 ) ( CLEAR ?auto_34010 ) ( not ( = ?auto_34010 ?auto_34016 ) ) ( not ( = ?auto_34011 ?auto_34016 ) ) ( not ( = ?auto_34009 ?auto_34016 ) ) ( not ( = ?auto_34013 ?auto_34016 ) ) ( ON ?auto_34009 ?auto_34008 ) ( not ( = ?auto_34008 ?auto_34009 ) ) ( not ( = ?auto_34008 ?auto_34010 ) ) ( not ( = ?auto_34008 ?auto_34011 ) ) ( not ( = ?auto_34008 ?auto_34013 ) ) ( not ( = ?auto_34008 ?auto_34016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34009 ?auto_34010 ?auto_34011 )
      ( MAKE-3CRATE-VERIFY ?auto_34008 ?auto_34009 ?auto_34010 ?auto_34011 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34021 - SURFACE
      ?auto_34022 - SURFACE
      ?auto_34023 - SURFACE
      ?auto_34024 - SURFACE
      ?auto_34025 - SURFACE
    )
    :vars
    (
      ?auto_34026 - HOIST
      ?auto_34029 - PLACE
      ?auto_34032 - PLACE
      ?auto_34028 - HOIST
      ?auto_34027 - SURFACE
      ?auto_34031 - TRUCK
      ?auto_34034 - PLACE
      ?auto_34033 - HOIST
      ?auto_34030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34026 ?auto_34029 ) ( IS-CRATE ?auto_34025 ) ( not ( = ?auto_34024 ?auto_34025 ) ) ( not ( = ?auto_34023 ?auto_34024 ) ) ( not ( = ?auto_34023 ?auto_34025 ) ) ( not ( = ?auto_34032 ?auto_34029 ) ) ( HOIST-AT ?auto_34028 ?auto_34032 ) ( not ( = ?auto_34026 ?auto_34028 ) ) ( AVAILABLE ?auto_34028 ) ( SURFACE-AT ?auto_34025 ?auto_34032 ) ( ON ?auto_34025 ?auto_34027 ) ( CLEAR ?auto_34025 ) ( not ( = ?auto_34024 ?auto_34027 ) ) ( not ( = ?auto_34025 ?auto_34027 ) ) ( not ( = ?auto_34023 ?auto_34027 ) ) ( SURFACE-AT ?auto_34023 ?auto_34029 ) ( CLEAR ?auto_34023 ) ( IS-CRATE ?auto_34024 ) ( AVAILABLE ?auto_34026 ) ( TRUCK-AT ?auto_34031 ?auto_34034 ) ( not ( = ?auto_34034 ?auto_34029 ) ) ( not ( = ?auto_34032 ?auto_34034 ) ) ( HOIST-AT ?auto_34033 ?auto_34034 ) ( not ( = ?auto_34026 ?auto_34033 ) ) ( not ( = ?auto_34028 ?auto_34033 ) ) ( AVAILABLE ?auto_34033 ) ( SURFACE-AT ?auto_34024 ?auto_34034 ) ( ON ?auto_34024 ?auto_34030 ) ( CLEAR ?auto_34024 ) ( not ( = ?auto_34024 ?auto_34030 ) ) ( not ( = ?auto_34025 ?auto_34030 ) ) ( not ( = ?auto_34023 ?auto_34030 ) ) ( not ( = ?auto_34027 ?auto_34030 ) ) ( ON ?auto_34022 ?auto_34021 ) ( ON ?auto_34023 ?auto_34022 ) ( not ( = ?auto_34021 ?auto_34022 ) ) ( not ( = ?auto_34021 ?auto_34023 ) ) ( not ( = ?auto_34021 ?auto_34024 ) ) ( not ( = ?auto_34021 ?auto_34025 ) ) ( not ( = ?auto_34021 ?auto_34027 ) ) ( not ( = ?auto_34021 ?auto_34030 ) ) ( not ( = ?auto_34022 ?auto_34023 ) ) ( not ( = ?auto_34022 ?auto_34024 ) ) ( not ( = ?auto_34022 ?auto_34025 ) ) ( not ( = ?auto_34022 ?auto_34027 ) ) ( not ( = ?auto_34022 ?auto_34030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34023 ?auto_34024 ?auto_34025 )
      ( MAKE-4CRATE-VERIFY ?auto_34021 ?auto_34022 ?auto_34023 ?auto_34024 ?auto_34025 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34035 - SURFACE
      ?auto_34036 - SURFACE
    )
    :vars
    (
      ?auto_34038 - HOIST
      ?auto_34041 - PLACE
      ?auto_34037 - SURFACE
      ?auto_34044 - PLACE
      ?auto_34040 - HOIST
      ?auto_34039 - SURFACE
      ?auto_34046 - PLACE
      ?auto_34045 - HOIST
      ?auto_34042 - SURFACE
      ?auto_34043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34038 ?auto_34041 ) ( IS-CRATE ?auto_34036 ) ( not ( = ?auto_34035 ?auto_34036 ) ) ( not ( = ?auto_34037 ?auto_34035 ) ) ( not ( = ?auto_34037 ?auto_34036 ) ) ( not ( = ?auto_34044 ?auto_34041 ) ) ( HOIST-AT ?auto_34040 ?auto_34044 ) ( not ( = ?auto_34038 ?auto_34040 ) ) ( AVAILABLE ?auto_34040 ) ( SURFACE-AT ?auto_34036 ?auto_34044 ) ( ON ?auto_34036 ?auto_34039 ) ( CLEAR ?auto_34036 ) ( not ( = ?auto_34035 ?auto_34039 ) ) ( not ( = ?auto_34036 ?auto_34039 ) ) ( not ( = ?auto_34037 ?auto_34039 ) ) ( SURFACE-AT ?auto_34037 ?auto_34041 ) ( CLEAR ?auto_34037 ) ( IS-CRATE ?auto_34035 ) ( AVAILABLE ?auto_34038 ) ( not ( = ?auto_34046 ?auto_34041 ) ) ( not ( = ?auto_34044 ?auto_34046 ) ) ( HOIST-AT ?auto_34045 ?auto_34046 ) ( not ( = ?auto_34038 ?auto_34045 ) ) ( not ( = ?auto_34040 ?auto_34045 ) ) ( AVAILABLE ?auto_34045 ) ( SURFACE-AT ?auto_34035 ?auto_34046 ) ( ON ?auto_34035 ?auto_34042 ) ( CLEAR ?auto_34035 ) ( not ( = ?auto_34035 ?auto_34042 ) ) ( not ( = ?auto_34036 ?auto_34042 ) ) ( not ( = ?auto_34037 ?auto_34042 ) ) ( not ( = ?auto_34039 ?auto_34042 ) ) ( TRUCK-AT ?auto_34043 ?auto_34041 ) )
    :subtasks
    ( ( !DRIVE ?auto_34043 ?auto_34041 ?auto_34046 )
      ( MAKE-2CRATE ?auto_34037 ?auto_34035 ?auto_34036 )
      ( MAKE-1CRATE-VERIFY ?auto_34035 ?auto_34036 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34047 - SURFACE
      ?auto_34048 - SURFACE
      ?auto_34049 - SURFACE
    )
    :vars
    (
      ?auto_34057 - HOIST
      ?auto_34052 - PLACE
      ?auto_34055 - PLACE
      ?auto_34051 - HOIST
      ?auto_34050 - SURFACE
      ?auto_34056 - PLACE
      ?auto_34053 - HOIST
      ?auto_34058 - SURFACE
      ?auto_34054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34057 ?auto_34052 ) ( IS-CRATE ?auto_34049 ) ( not ( = ?auto_34048 ?auto_34049 ) ) ( not ( = ?auto_34047 ?auto_34048 ) ) ( not ( = ?auto_34047 ?auto_34049 ) ) ( not ( = ?auto_34055 ?auto_34052 ) ) ( HOIST-AT ?auto_34051 ?auto_34055 ) ( not ( = ?auto_34057 ?auto_34051 ) ) ( AVAILABLE ?auto_34051 ) ( SURFACE-AT ?auto_34049 ?auto_34055 ) ( ON ?auto_34049 ?auto_34050 ) ( CLEAR ?auto_34049 ) ( not ( = ?auto_34048 ?auto_34050 ) ) ( not ( = ?auto_34049 ?auto_34050 ) ) ( not ( = ?auto_34047 ?auto_34050 ) ) ( SURFACE-AT ?auto_34047 ?auto_34052 ) ( CLEAR ?auto_34047 ) ( IS-CRATE ?auto_34048 ) ( AVAILABLE ?auto_34057 ) ( not ( = ?auto_34056 ?auto_34052 ) ) ( not ( = ?auto_34055 ?auto_34056 ) ) ( HOIST-AT ?auto_34053 ?auto_34056 ) ( not ( = ?auto_34057 ?auto_34053 ) ) ( not ( = ?auto_34051 ?auto_34053 ) ) ( AVAILABLE ?auto_34053 ) ( SURFACE-AT ?auto_34048 ?auto_34056 ) ( ON ?auto_34048 ?auto_34058 ) ( CLEAR ?auto_34048 ) ( not ( = ?auto_34048 ?auto_34058 ) ) ( not ( = ?auto_34049 ?auto_34058 ) ) ( not ( = ?auto_34047 ?auto_34058 ) ) ( not ( = ?auto_34050 ?auto_34058 ) ) ( TRUCK-AT ?auto_34054 ?auto_34052 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34048 ?auto_34049 )
      ( MAKE-2CRATE-VERIFY ?auto_34047 ?auto_34048 ?auto_34049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34059 - SURFACE
      ?auto_34060 - SURFACE
      ?auto_34061 - SURFACE
      ?auto_34062 - SURFACE
    )
    :vars
    (
      ?auto_34070 - HOIST
      ?auto_34071 - PLACE
      ?auto_34065 - PLACE
      ?auto_34063 - HOIST
      ?auto_34067 - SURFACE
      ?auto_34068 - PLACE
      ?auto_34069 - HOIST
      ?auto_34064 - SURFACE
      ?auto_34066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34070 ?auto_34071 ) ( IS-CRATE ?auto_34062 ) ( not ( = ?auto_34061 ?auto_34062 ) ) ( not ( = ?auto_34060 ?auto_34061 ) ) ( not ( = ?auto_34060 ?auto_34062 ) ) ( not ( = ?auto_34065 ?auto_34071 ) ) ( HOIST-AT ?auto_34063 ?auto_34065 ) ( not ( = ?auto_34070 ?auto_34063 ) ) ( AVAILABLE ?auto_34063 ) ( SURFACE-AT ?auto_34062 ?auto_34065 ) ( ON ?auto_34062 ?auto_34067 ) ( CLEAR ?auto_34062 ) ( not ( = ?auto_34061 ?auto_34067 ) ) ( not ( = ?auto_34062 ?auto_34067 ) ) ( not ( = ?auto_34060 ?auto_34067 ) ) ( SURFACE-AT ?auto_34060 ?auto_34071 ) ( CLEAR ?auto_34060 ) ( IS-CRATE ?auto_34061 ) ( AVAILABLE ?auto_34070 ) ( not ( = ?auto_34068 ?auto_34071 ) ) ( not ( = ?auto_34065 ?auto_34068 ) ) ( HOIST-AT ?auto_34069 ?auto_34068 ) ( not ( = ?auto_34070 ?auto_34069 ) ) ( not ( = ?auto_34063 ?auto_34069 ) ) ( AVAILABLE ?auto_34069 ) ( SURFACE-AT ?auto_34061 ?auto_34068 ) ( ON ?auto_34061 ?auto_34064 ) ( CLEAR ?auto_34061 ) ( not ( = ?auto_34061 ?auto_34064 ) ) ( not ( = ?auto_34062 ?auto_34064 ) ) ( not ( = ?auto_34060 ?auto_34064 ) ) ( not ( = ?auto_34067 ?auto_34064 ) ) ( TRUCK-AT ?auto_34066 ?auto_34071 ) ( ON ?auto_34060 ?auto_34059 ) ( not ( = ?auto_34059 ?auto_34060 ) ) ( not ( = ?auto_34059 ?auto_34061 ) ) ( not ( = ?auto_34059 ?auto_34062 ) ) ( not ( = ?auto_34059 ?auto_34067 ) ) ( not ( = ?auto_34059 ?auto_34064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34060 ?auto_34061 ?auto_34062 )
      ( MAKE-3CRATE-VERIFY ?auto_34059 ?auto_34060 ?auto_34061 ?auto_34062 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34072 - SURFACE
      ?auto_34073 - SURFACE
      ?auto_34074 - SURFACE
      ?auto_34075 - SURFACE
      ?auto_34076 - SURFACE
    )
    :vars
    (
      ?auto_34084 - HOIST
      ?auto_34085 - PLACE
      ?auto_34079 - PLACE
      ?auto_34077 - HOIST
      ?auto_34081 - SURFACE
      ?auto_34082 - PLACE
      ?auto_34083 - HOIST
      ?auto_34078 - SURFACE
      ?auto_34080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34084 ?auto_34085 ) ( IS-CRATE ?auto_34076 ) ( not ( = ?auto_34075 ?auto_34076 ) ) ( not ( = ?auto_34074 ?auto_34075 ) ) ( not ( = ?auto_34074 ?auto_34076 ) ) ( not ( = ?auto_34079 ?auto_34085 ) ) ( HOIST-AT ?auto_34077 ?auto_34079 ) ( not ( = ?auto_34084 ?auto_34077 ) ) ( AVAILABLE ?auto_34077 ) ( SURFACE-AT ?auto_34076 ?auto_34079 ) ( ON ?auto_34076 ?auto_34081 ) ( CLEAR ?auto_34076 ) ( not ( = ?auto_34075 ?auto_34081 ) ) ( not ( = ?auto_34076 ?auto_34081 ) ) ( not ( = ?auto_34074 ?auto_34081 ) ) ( SURFACE-AT ?auto_34074 ?auto_34085 ) ( CLEAR ?auto_34074 ) ( IS-CRATE ?auto_34075 ) ( AVAILABLE ?auto_34084 ) ( not ( = ?auto_34082 ?auto_34085 ) ) ( not ( = ?auto_34079 ?auto_34082 ) ) ( HOIST-AT ?auto_34083 ?auto_34082 ) ( not ( = ?auto_34084 ?auto_34083 ) ) ( not ( = ?auto_34077 ?auto_34083 ) ) ( AVAILABLE ?auto_34083 ) ( SURFACE-AT ?auto_34075 ?auto_34082 ) ( ON ?auto_34075 ?auto_34078 ) ( CLEAR ?auto_34075 ) ( not ( = ?auto_34075 ?auto_34078 ) ) ( not ( = ?auto_34076 ?auto_34078 ) ) ( not ( = ?auto_34074 ?auto_34078 ) ) ( not ( = ?auto_34081 ?auto_34078 ) ) ( TRUCK-AT ?auto_34080 ?auto_34085 ) ( ON ?auto_34073 ?auto_34072 ) ( ON ?auto_34074 ?auto_34073 ) ( not ( = ?auto_34072 ?auto_34073 ) ) ( not ( = ?auto_34072 ?auto_34074 ) ) ( not ( = ?auto_34072 ?auto_34075 ) ) ( not ( = ?auto_34072 ?auto_34076 ) ) ( not ( = ?auto_34072 ?auto_34081 ) ) ( not ( = ?auto_34072 ?auto_34078 ) ) ( not ( = ?auto_34073 ?auto_34074 ) ) ( not ( = ?auto_34073 ?auto_34075 ) ) ( not ( = ?auto_34073 ?auto_34076 ) ) ( not ( = ?auto_34073 ?auto_34081 ) ) ( not ( = ?auto_34073 ?auto_34078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34074 ?auto_34075 ?auto_34076 )
      ( MAKE-4CRATE-VERIFY ?auto_34072 ?auto_34073 ?auto_34074 ?auto_34075 ?auto_34076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34086 - SURFACE
      ?auto_34087 - SURFACE
    )
    :vars
    (
      ?auto_34095 - HOIST
      ?auto_34096 - PLACE
      ?auto_34097 - SURFACE
      ?auto_34090 - PLACE
      ?auto_34088 - HOIST
      ?auto_34092 - SURFACE
      ?auto_34093 - PLACE
      ?auto_34094 - HOIST
      ?auto_34089 - SURFACE
      ?auto_34091 - TRUCK
      ?auto_34098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34095 ?auto_34096 ) ( IS-CRATE ?auto_34087 ) ( not ( = ?auto_34086 ?auto_34087 ) ) ( not ( = ?auto_34097 ?auto_34086 ) ) ( not ( = ?auto_34097 ?auto_34087 ) ) ( not ( = ?auto_34090 ?auto_34096 ) ) ( HOIST-AT ?auto_34088 ?auto_34090 ) ( not ( = ?auto_34095 ?auto_34088 ) ) ( AVAILABLE ?auto_34088 ) ( SURFACE-AT ?auto_34087 ?auto_34090 ) ( ON ?auto_34087 ?auto_34092 ) ( CLEAR ?auto_34087 ) ( not ( = ?auto_34086 ?auto_34092 ) ) ( not ( = ?auto_34087 ?auto_34092 ) ) ( not ( = ?auto_34097 ?auto_34092 ) ) ( IS-CRATE ?auto_34086 ) ( not ( = ?auto_34093 ?auto_34096 ) ) ( not ( = ?auto_34090 ?auto_34093 ) ) ( HOIST-AT ?auto_34094 ?auto_34093 ) ( not ( = ?auto_34095 ?auto_34094 ) ) ( not ( = ?auto_34088 ?auto_34094 ) ) ( AVAILABLE ?auto_34094 ) ( SURFACE-AT ?auto_34086 ?auto_34093 ) ( ON ?auto_34086 ?auto_34089 ) ( CLEAR ?auto_34086 ) ( not ( = ?auto_34086 ?auto_34089 ) ) ( not ( = ?auto_34087 ?auto_34089 ) ) ( not ( = ?auto_34097 ?auto_34089 ) ) ( not ( = ?auto_34092 ?auto_34089 ) ) ( TRUCK-AT ?auto_34091 ?auto_34096 ) ( SURFACE-AT ?auto_34098 ?auto_34096 ) ( CLEAR ?auto_34098 ) ( LIFTING ?auto_34095 ?auto_34097 ) ( IS-CRATE ?auto_34097 ) ( not ( = ?auto_34098 ?auto_34097 ) ) ( not ( = ?auto_34086 ?auto_34098 ) ) ( not ( = ?auto_34087 ?auto_34098 ) ) ( not ( = ?auto_34092 ?auto_34098 ) ) ( not ( = ?auto_34089 ?auto_34098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34098 ?auto_34097 )
      ( MAKE-2CRATE ?auto_34097 ?auto_34086 ?auto_34087 )
      ( MAKE-1CRATE-VERIFY ?auto_34086 ?auto_34087 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34099 - SURFACE
      ?auto_34100 - SURFACE
      ?auto_34101 - SURFACE
    )
    :vars
    (
      ?auto_34110 - HOIST
      ?auto_34108 - PLACE
      ?auto_34105 - PLACE
      ?auto_34102 - HOIST
      ?auto_34109 - SURFACE
      ?auto_34103 - PLACE
      ?auto_34107 - HOIST
      ?auto_34111 - SURFACE
      ?auto_34106 - TRUCK
      ?auto_34104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34110 ?auto_34108 ) ( IS-CRATE ?auto_34101 ) ( not ( = ?auto_34100 ?auto_34101 ) ) ( not ( = ?auto_34099 ?auto_34100 ) ) ( not ( = ?auto_34099 ?auto_34101 ) ) ( not ( = ?auto_34105 ?auto_34108 ) ) ( HOIST-AT ?auto_34102 ?auto_34105 ) ( not ( = ?auto_34110 ?auto_34102 ) ) ( AVAILABLE ?auto_34102 ) ( SURFACE-AT ?auto_34101 ?auto_34105 ) ( ON ?auto_34101 ?auto_34109 ) ( CLEAR ?auto_34101 ) ( not ( = ?auto_34100 ?auto_34109 ) ) ( not ( = ?auto_34101 ?auto_34109 ) ) ( not ( = ?auto_34099 ?auto_34109 ) ) ( IS-CRATE ?auto_34100 ) ( not ( = ?auto_34103 ?auto_34108 ) ) ( not ( = ?auto_34105 ?auto_34103 ) ) ( HOIST-AT ?auto_34107 ?auto_34103 ) ( not ( = ?auto_34110 ?auto_34107 ) ) ( not ( = ?auto_34102 ?auto_34107 ) ) ( AVAILABLE ?auto_34107 ) ( SURFACE-AT ?auto_34100 ?auto_34103 ) ( ON ?auto_34100 ?auto_34111 ) ( CLEAR ?auto_34100 ) ( not ( = ?auto_34100 ?auto_34111 ) ) ( not ( = ?auto_34101 ?auto_34111 ) ) ( not ( = ?auto_34099 ?auto_34111 ) ) ( not ( = ?auto_34109 ?auto_34111 ) ) ( TRUCK-AT ?auto_34106 ?auto_34108 ) ( SURFACE-AT ?auto_34104 ?auto_34108 ) ( CLEAR ?auto_34104 ) ( LIFTING ?auto_34110 ?auto_34099 ) ( IS-CRATE ?auto_34099 ) ( not ( = ?auto_34104 ?auto_34099 ) ) ( not ( = ?auto_34100 ?auto_34104 ) ) ( not ( = ?auto_34101 ?auto_34104 ) ) ( not ( = ?auto_34109 ?auto_34104 ) ) ( not ( = ?auto_34111 ?auto_34104 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34100 ?auto_34101 )
      ( MAKE-2CRATE-VERIFY ?auto_34099 ?auto_34100 ?auto_34101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34112 - SURFACE
      ?auto_34113 - SURFACE
      ?auto_34114 - SURFACE
      ?auto_34115 - SURFACE
    )
    :vars
    (
      ?auto_34121 - HOIST
      ?auto_34118 - PLACE
      ?auto_34120 - PLACE
      ?auto_34119 - HOIST
      ?auto_34123 - SURFACE
      ?auto_34116 - PLACE
      ?auto_34124 - HOIST
      ?auto_34122 - SURFACE
      ?auto_34117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34121 ?auto_34118 ) ( IS-CRATE ?auto_34115 ) ( not ( = ?auto_34114 ?auto_34115 ) ) ( not ( = ?auto_34113 ?auto_34114 ) ) ( not ( = ?auto_34113 ?auto_34115 ) ) ( not ( = ?auto_34120 ?auto_34118 ) ) ( HOIST-AT ?auto_34119 ?auto_34120 ) ( not ( = ?auto_34121 ?auto_34119 ) ) ( AVAILABLE ?auto_34119 ) ( SURFACE-AT ?auto_34115 ?auto_34120 ) ( ON ?auto_34115 ?auto_34123 ) ( CLEAR ?auto_34115 ) ( not ( = ?auto_34114 ?auto_34123 ) ) ( not ( = ?auto_34115 ?auto_34123 ) ) ( not ( = ?auto_34113 ?auto_34123 ) ) ( IS-CRATE ?auto_34114 ) ( not ( = ?auto_34116 ?auto_34118 ) ) ( not ( = ?auto_34120 ?auto_34116 ) ) ( HOIST-AT ?auto_34124 ?auto_34116 ) ( not ( = ?auto_34121 ?auto_34124 ) ) ( not ( = ?auto_34119 ?auto_34124 ) ) ( AVAILABLE ?auto_34124 ) ( SURFACE-AT ?auto_34114 ?auto_34116 ) ( ON ?auto_34114 ?auto_34122 ) ( CLEAR ?auto_34114 ) ( not ( = ?auto_34114 ?auto_34122 ) ) ( not ( = ?auto_34115 ?auto_34122 ) ) ( not ( = ?auto_34113 ?auto_34122 ) ) ( not ( = ?auto_34123 ?auto_34122 ) ) ( TRUCK-AT ?auto_34117 ?auto_34118 ) ( SURFACE-AT ?auto_34112 ?auto_34118 ) ( CLEAR ?auto_34112 ) ( LIFTING ?auto_34121 ?auto_34113 ) ( IS-CRATE ?auto_34113 ) ( not ( = ?auto_34112 ?auto_34113 ) ) ( not ( = ?auto_34114 ?auto_34112 ) ) ( not ( = ?auto_34115 ?auto_34112 ) ) ( not ( = ?auto_34123 ?auto_34112 ) ) ( not ( = ?auto_34122 ?auto_34112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34113 ?auto_34114 ?auto_34115 )
      ( MAKE-3CRATE-VERIFY ?auto_34112 ?auto_34113 ?auto_34114 ?auto_34115 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34125 - SURFACE
      ?auto_34126 - SURFACE
      ?auto_34127 - SURFACE
      ?auto_34128 - SURFACE
      ?auto_34129 - SURFACE
    )
    :vars
    (
      ?auto_34135 - HOIST
      ?auto_34132 - PLACE
      ?auto_34134 - PLACE
      ?auto_34133 - HOIST
      ?auto_34137 - SURFACE
      ?auto_34130 - PLACE
      ?auto_34138 - HOIST
      ?auto_34136 - SURFACE
      ?auto_34131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34135 ?auto_34132 ) ( IS-CRATE ?auto_34129 ) ( not ( = ?auto_34128 ?auto_34129 ) ) ( not ( = ?auto_34127 ?auto_34128 ) ) ( not ( = ?auto_34127 ?auto_34129 ) ) ( not ( = ?auto_34134 ?auto_34132 ) ) ( HOIST-AT ?auto_34133 ?auto_34134 ) ( not ( = ?auto_34135 ?auto_34133 ) ) ( AVAILABLE ?auto_34133 ) ( SURFACE-AT ?auto_34129 ?auto_34134 ) ( ON ?auto_34129 ?auto_34137 ) ( CLEAR ?auto_34129 ) ( not ( = ?auto_34128 ?auto_34137 ) ) ( not ( = ?auto_34129 ?auto_34137 ) ) ( not ( = ?auto_34127 ?auto_34137 ) ) ( IS-CRATE ?auto_34128 ) ( not ( = ?auto_34130 ?auto_34132 ) ) ( not ( = ?auto_34134 ?auto_34130 ) ) ( HOIST-AT ?auto_34138 ?auto_34130 ) ( not ( = ?auto_34135 ?auto_34138 ) ) ( not ( = ?auto_34133 ?auto_34138 ) ) ( AVAILABLE ?auto_34138 ) ( SURFACE-AT ?auto_34128 ?auto_34130 ) ( ON ?auto_34128 ?auto_34136 ) ( CLEAR ?auto_34128 ) ( not ( = ?auto_34128 ?auto_34136 ) ) ( not ( = ?auto_34129 ?auto_34136 ) ) ( not ( = ?auto_34127 ?auto_34136 ) ) ( not ( = ?auto_34137 ?auto_34136 ) ) ( TRUCK-AT ?auto_34131 ?auto_34132 ) ( SURFACE-AT ?auto_34126 ?auto_34132 ) ( CLEAR ?auto_34126 ) ( LIFTING ?auto_34135 ?auto_34127 ) ( IS-CRATE ?auto_34127 ) ( not ( = ?auto_34126 ?auto_34127 ) ) ( not ( = ?auto_34128 ?auto_34126 ) ) ( not ( = ?auto_34129 ?auto_34126 ) ) ( not ( = ?auto_34137 ?auto_34126 ) ) ( not ( = ?auto_34136 ?auto_34126 ) ) ( ON ?auto_34126 ?auto_34125 ) ( not ( = ?auto_34125 ?auto_34126 ) ) ( not ( = ?auto_34125 ?auto_34127 ) ) ( not ( = ?auto_34125 ?auto_34128 ) ) ( not ( = ?auto_34125 ?auto_34129 ) ) ( not ( = ?auto_34125 ?auto_34137 ) ) ( not ( = ?auto_34125 ?auto_34136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34127 ?auto_34128 ?auto_34129 )
      ( MAKE-4CRATE-VERIFY ?auto_34125 ?auto_34126 ?auto_34127 ?auto_34128 ?auto_34129 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34139 - SURFACE
      ?auto_34140 - SURFACE
    )
    :vars
    (
      ?auto_34148 - HOIST
      ?auto_34143 - PLACE
      ?auto_34146 - SURFACE
      ?auto_34147 - PLACE
      ?auto_34144 - HOIST
      ?auto_34150 - SURFACE
      ?auto_34141 - PLACE
      ?auto_34151 - HOIST
      ?auto_34149 - SURFACE
      ?auto_34142 - TRUCK
      ?auto_34145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34148 ?auto_34143 ) ( IS-CRATE ?auto_34140 ) ( not ( = ?auto_34139 ?auto_34140 ) ) ( not ( = ?auto_34146 ?auto_34139 ) ) ( not ( = ?auto_34146 ?auto_34140 ) ) ( not ( = ?auto_34147 ?auto_34143 ) ) ( HOIST-AT ?auto_34144 ?auto_34147 ) ( not ( = ?auto_34148 ?auto_34144 ) ) ( AVAILABLE ?auto_34144 ) ( SURFACE-AT ?auto_34140 ?auto_34147 ) ( ON ?auto_34140 ?auto_34150 ) ( CLEAR ?auto_34140 ) ( not ( = ?auto_34139 ?auto_34150 ) ) ( not ( = ?auto_34140 ?auto_34150 ) ) ( not ( = ?auto_34146 ?auto_34150 ) ) ( IS-CRATE ?auto_34139 ) ( not ( = ?auto_34141 ?auto_34143 ) ) ( not ( = ?auto_34147 ?auto_34141 ) ) ( HOIST-AT ?auto_34151 ?auto_34141 ) ( not ( = ?auto_34148 ?auto_34151 ) ) ( not ( = ?auto_34144 ?auto_34151 ) ) ( AVAILABLE ?auto_34151 ) ( SURFACE-AT ?auto_34139 ?auto_34141 ) ( ON ?auto_34139 ?auto_34149 ) ( CLEAR ?auto_34139 ) ( not ( = ?auto_34139 ?auto_34149 ) ) ( not ( = ?auto_34140 ?auto_34149 ) ) ( not ( = ?auto_34146 ?auto_34149 ) ) ( not ( = ?auto_34150 ?auto_34149 ) ) ( TRUCK-AT ?auto_34142 ?auto_34143 ) ( SURFACE-AT ?auto_34145 ?auto_34143 ) ( CLEAR ?auto_34145 ) ( IS-CRATE ?auto_34146 ) ( not ( = ?auto_34145 ?auto_34146 ) ) ( not ( = ?auto_34139 ?auto_34145 ) ) ( not ( = ?auto_34140 ?auto_34145 ) ) ( not ( = ?auto_34150 ?auto_34145 ) ) ( not ( = ?auto_34149 ?auto_34145 ) ) ( AVAILABLE ?auto_34148 ) ( IN ?auto_34146 ?auto_34142 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34148 ?auto_34146 ?auto_34142 ?auto_34143 )
      ( MAKE-2CRATE ?auto_34146 ?auto_34139 ?auto_34140 )
      ( MAKE-1CRATE-VERIFY ?auto_34139 ?auto_34140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34152 - SURFACE
      ?auto_34153 - SURFACE
      ?auto_34154 - SURFACE
    )
    :vars
    (
      ?auto_34164 - HOIST
      ?auto_34159 - PLACE
      ?auto_34157 - PLACE
      ?auto_34156 - HOIST
      ?auto_34158 - SURFACE
      ?auto_34155 - PLACE
      ?auto_34161 - HOIST
      ?auto_34162 - SURFACE
      ?auto_34163 - TRUCK
      ?auto_34160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34164 ?auto_34159 ) ( IS-CRATE ?auto_34154 ) ( not ( = ?auto_34153 ?auto_34154 ) ) ( not ( = ?auto_34152 ?auto_34153 ) ) ( not ( = ?auto_34152 ?auto_34154 ) ) ( not ( = ?auto_34157 ?auto_34159 ) ) ( HOIST-AT ?auto_34156 ?auto_34157 ) ( not ( = ?auto_34164 ?auto_34156 ) ) ( AVAILABLE ?auto_34156 ) ( SURFACE-AT ?auto_34154 ?auto_34157 ) ( ON ?auto_34154 ?auto_34158 ) ( CLEAR ?auto_34154 ) ( not ( = ?auto_34153 ?auto_34158 ) ) ( not ( = ?auto_34154 ?auto_34158 ) ) ( not ( = ?auto_34152 ?auto_34158 ) ) ( IS-CRATE ?auto_34153 ) ( not ( = ?auto_34155 ?auto_34159 ) ) ( not ( = ?auto_34157 ?auto_34155 ) ) ( HOIST-AT ?auto_34161 ?auto_34155 ) ( not ( = ?auto_34164 ?auto_34161 ) ) ( not ( = ?auto_34156 ?auto_34161 ) ) ( AVAILABLE ?auto_34161 ) ( SURFACE-AT ?auto_34153 ?auto_34155 ) ( ON ?auto_34153 ?auto_34162 ) ( CLEAR ?auto_34153 ) ( not ( = ?auto_34153 ?auto_34162 ) ) ( not ( = ?auto_34154 ?auto_34162 ) ) ( not ( = ?auto_34152 ?auto_34162 ) ) ( not ( = ?auto_34158 ?auto_34162 ) ) ( TRUCK-AT ?auto_34163 ?auto_34159 ) ( SURFACE-AT ?auto_34160 ?auto_34159 ) ( CLEAR ?auto_34160 ) ( IS-CRATE ?auto_34152 ) ( not ( = ?auto_34160 ?auto_34152 ) ) ( not ( = ?auto_34153 ?auto_34160 ) ) ( not ( = ?auto_34154 ?auto_34160 ) ) ( not ( = ?auto_34158 ?auto_34160 ) ) ( not ( = ?auto_34162 ?auto_34160 ) ) ( AVAILABLE ?auto_34164 ) ( IN ?auto_34152 ?auto_34163 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34153 ?auto_34154 )
      ( MAKE-2CRATE-VERIFY ?auto_34152 ?auto_34153 ?auto_34154 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34165 - SURFACE
      ?auto_34166 - SURFACE
      ?auto_34167 - SURFACE
      ?auto_34168 - SURFACE
    )
    :vars
    (
      ?auto_34169 - HOIST
      ?auto_34174 - PLACE
      ?auto_34176 - PLACE
      ?auto_34170 - HOIST
      ?auto_34171 - SURFACE
      ?auto_34173 - PLACE
      ?auto_34172 - HOIST
      ?auto_34175 - SURFACE
      ?auto_34177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34169 ?auto_34174 ) ( IS-CRATE ?auto_34168 ) ( not ( = ?auto_34167 ?auto_34168 ) ) ( not ( = ?auto_34166 ?auto_34167 ) ) ( not ( = ?auto_34166 ?auto_34168 ) ) ( not ( = ?auto_34176 ?auto_34174 ) ) ( HOIST-AT ?auto_34170 ?auto_34176 ) ( not ( = ?auto_34169 ?auto_34170 ) ) ( AVAILABLE ?auto_34170 ) ( SURFACE-AT ?auto_34168 ?auto_34176 ) ( ON ?auto_34168 ?auto_34171 ) ( CLEAR ?auto_34168 ) ( not ( = ?auto_34167 ?auto_34171 ) ) ( not ( = ?auto_34168 ?auto_34171 ) ) ( not ( = ?auto_34166 ?auto_34171 ) ) ( IS-CRATE ?auto_34167 ) ( not ( = ?auto_34173 ?auto_34174 ) ) ( not ( = ?auto_34176 ?auto_34173 ) ) ( HOIST-AT ?auto_34172 ?auto_34173 ) ( not ( = ?auto_34169 ?auto_34172 ) ) ( not ( = ?auto_34170 ?auto_34172 ) ) ( AVAILABLE ?auto_34172 ) ( SURFACE-AT ?auto_34167 ?auto_34173 ) ( ON ?auto_34167 ?auto_34175 ) ( CLEAR ?auto_34167 ) ( not ( = ?auto_34167 ?auto_34175 ) ) ( not ( = ?auto_34168 ?auto_34175 ) ) ( not ( = ?auto_34166 ?auto_34175 ) ) ( not ( = ?auto_34171 ?auto_34175 ) ) ( TRUCK-AT ?auto_34177 ?auto_34174 ) ( SURFACE-AT ?auto_34165 ?auto_34174 ) ( CLEAR ?auto_34165 ) ( IS-CRATE ?auto_34166 ) ( not ( = ?auto_34165 ?auto_34166 ) ) ( not ( = ?auto_34167 ?auto_34165 ) ) ( not ( = ?auto_34168 ?auto_34165 ) ) ( not ( = ?auto_34171 ?auto_34165 ) ) ( not ( = ?auto_34175 ?auto_34165 ) ) ( AVAILABLE ?auto_34169 ) ( IN ?auto_34166 ?auto_34177 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34166 ?auto_34167 ?auto_34168 )
      ( MAKE-3CRATE-VERIFY ?auto_34165 ?auto_34166 ?auto_34167 ?auto_34168 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34178 - SURFACE
      ?auto_34179 - SURFACE
      ?auto_34180 - SURFACE
      ?auto_34181 - SURFACE
      ?auto_34182 - SURFACE
    )
    :vars
    (
      ?auto_34183 - HOIST
      ?auto_34188 - PLACE
      ?auto_34190 - PLACE
      ?auto_34184 - HOIST
      ?auto_34185 - SURFACE
      ?auto_34187 - PLACE
      ?auto_34186 - HOIST
      ?auto_34189 - SURFACE
      ?auto_34191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34183 ?auto_34188 ) ( IS-CRATE ?auto_34182 ) ( not ( = ?auto_34181 ?auto_34182 ) ) ( not ( = ?auto_34180 ?auto_34181 ) ) ( not ( = ?auto_34180 ?auto_34182 ) ) ( not ( = ?auto_34190 ?auto_34188 ) ) ( HOIST-AT ?auto_34184 ?auto_34190 ) ( not ( = ?auto_34183 ?auto_34184 ) ) ( AVAILABLE ?auto_34184 ) ( SURFACE-AT ?auto_34182 ?auto_34190 ) ( ON ?auto_34182 ?auto_34185 ) ( CLEAR ?auto_34182 ) ( not ( = ?auto_34181 ?auto_34185 ) ) ( not ( = ?auto_34182 ?auto_34185 ) ) ( not ( = ?auto_34180 ?auto_34185 ) ) ( IS-CRATE ?auto_34181 ) ( not ( = ?auto_34187 ?auto_34188 ) ) ( not ( = ?auto_34190 ?auto_34187 ) ) ( HOIST-AT ?auto_34186 ?auto_34187 ) ( not ( = ?auto_34183 ?auto_34186 ) ) ( not ( = ?auto_34184 ?auto_34186 ) ) ( AVAILABLE ?auto_34186 ) ( SURFACE-AT ?auto_34181 ?auto_34187 ) ( ON ?auto_34181 ?auto_34189 ) ( CLEAR ?auto_34181 ) ( not ( = ?auto_34181 ?auto_34189 ) ) ( not ( = ?auto_34182 ?auto_34189 ) ) ( not ( = ?auto_34180 ?auto_34189 ) ) ( not ( = ?auto_34185 ?auto_34189 ) ) ( TRUCK-AT ?auto_34191 ?auto_34188 ) ( SURFACE-AT ?auto_34179 ?auto_34188 ) ( CLEAR ?auto_34179 ) ( IS-CRATE ?auto_34180 ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( not ( = ?auto_34181 ?auto_34179 ) ) ( not ( = ?auto_34182 ?auto_34179 ) ) ( not ( = ?auto_34185 ?auto_34179 ) ) ( not ( = ?auto_34189 ?auto_34179 ) ) ( AVAILABLE ?auto_34183 ) ( IN ?auto_34180 ?auto_34191 ) ( ON ?auto_34179 ?auto_34178 ) ( not ( = ?auto_34178 ?auto_34179 ) ) ( not ( = ?auto_34178 ?auto_34180 ) ) ( not ( = ?auto_34178 ?auto_34181 ) ) ( not ( = ?auto_34178 ?auto_34182 ) ) ( not ( = ?auto_34178 ?auto_34185 ) ) ( not ( = ?auto_34178 ?auto_34189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34180 ?auto_34181 ?auto_34182 )
      ( MAKE-4CRATE-VERIFY ?auto_34178 ?auto_34179 ?auto_34180 ?auto_34181 ?auto_34182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34192 - SURFACE
      ?auto_34193 - SURFACE
    )
    :vars
    (
      ?auto_34195 - HOIST
      ?auto_34200 - PLACE
      ?auto_34194 - SURFACE
      ?auto_34202 - PLACE
      ?auto_34196 - HOIST
      ?auto_34197 - SURFACE
      ?auto_34199 - PLACE
      ?auto_34198 - HOIST
      ?auto_34201 - SURFACE
      ?auto_34204 - SURFACE
      ?auto_34203 - TRUCK
      ?auto_34205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34195 ?auto_34200 ) ( IS-CRATE ?auto_34193 ) ( not ( = ?auto_34192 ?auto_34193 ) ) ( not ( = ?auto_34194 ?auto_34192 ) ) ( not ( = ?auto_34194 ?auto_34193 ) ) ( not ( = ?auto_34202 ?auto_34200 ) ) ( HOIST-AT ?auto_34196 ?auto_34202 ) ( not ( = ?auto_34195 ?auto_34196 ) ) ( AVAILABLE ?auto_34196 ) ( SURFACE-AT ?auto_34193 ?auto_34202 ) ( ON ?auto_34193 ?auto_34197 ) ( CLEAR ?auto_34193 ) ( not ( = ?auto_34192 ?auto_34197 ) ) ( not ( = ?auto_34193 ?auto_34197 ) ) ( not ( = ?auto_34194 ?auto_34197 ) ) ( IS-CRATE ?auto_34192 ) ( not ( = ?auto_34199 ?auto_34200 ) ) ( not ( = ?auto_34202 ?auto_34199 ) ) ( HOIST-AT ?auto_34198 ?auto_34199 ) ( not ( = ?auto_34195 ?auto_34198 ) ) ( not ( = ?auto_34196 ?auto_34198 ) ) ( AVAILABLE ?auto_34198 ) ( SURFACE-AT ?auto_34192 ?auto_34199 ) ( ON ?auto_34192 ?auto_34201 ) ( CLEAR ?auto_34192 ) ( not ( = ?auto_34192 ?auto_34201 ) ) ( not ( = ?auto_34193 ?auto_34201 ) ) ( not ( = ?auto_34194 ?auto_34201 ) ) ( not ( = ?auto_34197 ?auto_34201 ) ) ( SURFACE-AT ?auto_34204 ?auto_34200 ) ( CLEAR ?auto_34204 ) ( IS-CRATE ?auto_34194 ) ( not ( = ?auto_34204 ?auto_34194 ) ) ( not ( = ?auto_34192 ?auto_34204 ) ) ( not ( = ?auto_34193 ?auto_34204 ) ) ( not ( = ?auto_34197 ?auto_34204 ) ) ( not ( = ?auto_34201 ?auto_34204 ) ) ( AVAILABLE ?auto_34195 ) ( IN ?auto_34194 ?auto_34203 ) ( TRUCK-AT ?auto_34203 ?auto_34205 ) ( not ( = ?auto_34205 ?auto_34200 ) ) ( not ( = ?auto_34202 ?auto_34205 ) ) ( not ( = ?auto_34199 ?auto_34205 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34203 ?auto_34205 ?auto_34200 )
      ( MAKE-2CRATE ?auto_34194 ?auto_34192 ?auto_34193 )
      ( MAKE-1CRATE-VERIFY ?auto_34192 ?auto_34193 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34206 - SURFACE
      ?auto_34207 - SURFACE
      ?auto_34208 - SURFACE
    )
    :vars
    (
      ?auto_34212 - HOIST
      ?auto_34217 - PLACE
      ?auto_34218 - PLACE
      ?auto_34209 - HOIST
      ?auto_34213 - SURFACE
      ?auto_34216 - PLACE
      ?auto_34211 - HOIST
      ?auto_34214 - SURFACE
      ?auto_34219 - SURFACE
      ?auto_34210 - TRUCK
      ?auto_34215 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34212 ?auto_34217 ) ( IS-CRATE ?auto_34208 ) ( not ( = ?auto_34207 ?auto_34208 ) ) ( not ( = ?auto_34206 ?auto_34207 ) ) ( not ( = ?auto_34206 ?auto_34208 ) ) ( not ( = ?auto_34218 ?auto_34217 ) ) ( HOIST-AT ?auto_34209 ?auto_34218 ) ( not ( = ?auto_34212 ?auto_34209 ) ) ( AVAILABLE ?auto_34209 ) ( SURFACE-AT ?auto_34208 ?auto_34218 ) ( ON ?auto_34208 ?auto_34213 ) ( CLEAR ?auto_34208 ) ( not ( = ?auto_34207 ?auto_34213 ) ) ( not ( = ?auto_34208 ?auto_34213 ) ) ( not ( = ?auto_34206 ?auto_34213 ) ) ( IS-CRATE ?auto_34207 ) ( not ( = ?auto_34216 ?auto_34217 ) ) ( not ( = ?auto_34218 ?auto_34216 ) ) ( HOIST-AT ?auto_34211 ?auto_34216 ) ( not ( = ?auto_34212 ?auto_34211 ) ) ( not ( = ?auto_34209 ?auto_34211 ) ) ( AVAILABLE ?auto_34211 ) ( SURFACE-AT ?auto_34207 ?auto_34216 ) ( ON ?auto_34207 ?auto_34214 ) ( CLEAR ?auto_34207 ) ( not ( = ?auto_34207 ?auto_34214 ) ) ( not ( = ?auto_34208 ?auto_34214 ) ) ( not ( = ?auto_34206 ?auto_34214 ) ) ( not ( = ?auto_34213 ?auto_34214 ) ) ( SURFACE-AT ?auto_34219 ?auto_34217 ) ( CLEAR ?auto_34219 ) ( IS-CRATE ?auto_34206 ) ( not ( = ?auto_34219 ?auto_34206 ) ) ( not ( = ?auto_34207 ?auto_34219 ) ) ( not ( = ?auto_34208 ?auto_34219 ) ) ( not ( = ?auto_34213 ?auto_34219 ) ) ( not ( = ?auto_34214 ?auto_34219 ) ) ( AVAILABLE ?auto_34212 ) ( IN ?auto_34206 ?auto_34210 ) ( TRUCK-AT ?auto_34210 ?auto_34215 ) ( not ( = ?auto_34215 ?auto_34217 ) ) ( not ( = ?auto_34218 ?auto_34215 ) ) ( not ( = ?auto_34216 ?auto_34215 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34207 ?auto_34208 )
      ( MAKE-2CRATE-VERIFY ?auto_34206 ?auto_34207 ?auto_34208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34220 - SURFACE
      ?auto_34221 - SURFACE
      ?auto_34222 - SURFACE
      ?auto_34223 - SURFACE
    )
    :vars
    (
      ?auto_34226 - HOIST
      ?auto_34225 - PLACE
      ?auto_34228 - PLACE
      ?auto_34229 - HOIST
      ?auto_34230 - SURFACE
      ?auto_34232 - PLACE
      ?auto_34233 - HOIST
      ?auto_34224 - SURFACE
      ?auto_34227 - TRUCK
      ?auto_34231 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34226 ?auto_34225 ) ( IS-CRATE ?auto_34223 ) ( not ( = ?auto_34222 ?auto_34223 ) ) ( not ( = ?auto_34221 ?auto_34222 ) ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( not ( = ?auto_34228 ?auto_34225 ) ) ( HOIST-AT ?auto_34229 ?auto_34228 ) ( not ( = ?auto_34226 ?auto_34229 ) ) ( AVAILABLE ?auto_34229 ) ( SURFACE-AT ?auto_34223 ?auto_34228 ) ( ON ?auto_34223 ?auto_34230 ) ( CLEAR ?auto_34223 ) ( not ( = ?auto_34222 ?auto_34230 ) ) ( not ( = ?auto_34223 ?auto_34230 ) ) ( not ( = ?auto_34221 ?auto_34230 ) ) ( IS-CRATE ?auto_34222 ) ( not ( = ?auto_34232 ?auto_34225 ) ) ( not ( = ?auto_34228 ?auto_34232 ) ) ( HOIST-AT ?auto_34233 ?auto_34232 ) ( not ( = ?auto_34226 ?auto_34233 ) ) ( not ( = ?auto_34229 ?auto_34233 ) ) ( AVAILABLE ?auto_34233 ) ( SURFACE-AT ?auto_34222 ?auto_34232 ) ( ON ?auto_34222 ?auto_34224 ) ( CLEAR ?auto_34222 ) ( not ( = ?auto_34222 ?auto_34224 ) ) ( not ( = ?auto_34223 ?auto_34224 ) ) ( not ( = ?auto_34221 ?auto_34224 ) ) ( not ( = ?auto_34230 ?auto_34224 ) ) ( SURFACE-AT ?auto_34220 ?auto_34225 ) ( CLEAR ?auto_34220 ) ( IS-CRATE ?auto_34221 ) ( not ( = ?auto_34220 ?auto_34221 ) ) ( not ( = ?auto_34222 ?auto_34220 ) ) ( not ( = ?auto_34223 ?auto_34220 ) ) ( not ( = ?auto_34230 ?auto_34220 ) ) ( not ( = ?auto_34224 ?auto_34220 ) ) ( AVAILABLE ?auto_34226 ) ( IN ?auto_34221 ?auto_34227 ) ( TRUCK-AT ?auto_34227 ?auto_34231 ) ( not ( = ?auto_34231 ?auto_34225 ) ) ( not ( = ?auto_34228 ?auto_34231 ) ) ( not ( = ?auto_34232 ?auto_34231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34221 ?auto_34222 ?auto_34223 )
      ( MAKE-3CRATE-VERIFY ?auto_34220 ?auto_34221 ?auto_34222 ?auto_34223 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34234 - SURFACE
      ?auto_34235 - SURFACE
      ?auto_34236 - SURFACE
      ?auto_34237 - SURFACE
      ?auto_34238 - SURFACE
    )
    :vars
    (
      ?auto_34241 - HOIST
      ?auto_34240 - PLACE
      ?auto_34243 - PLACE
      ?auto_34244 - HOIST
      ?auto_34245 - SURFACE
      ?auto_34247 - PLACE
      ?auto_34248 - HOIST
      ?auto_34239 - SURFACE
      ?auto_34242 - TRUCK
      ?auto_34246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34241 ?auto_34240 ) ( IS-CRATE ?auto_34238 ) ( not ( = ?auto_34237 ?auto_34238 ) ) ( not ( = ?auto_34236 ?auto_34237 ) ) ( not ( = ?auto_34236 ?auto_34238 ) ) ( not ( = ?auto_34243 ?auto_34240 ) ) ( HOIST-AT ?auto_34244 ?auto_34243 ) ( not ( = ?auto_34241 ?auto_34244 ) ) ( AVAILABLE ?auto_34244 ) ( SURFACE-AT ?auto_34238 ?auto_34243 ) ( ON ?auto_34238 ?auto_34245 ) ( CLEAR ?auto_34238 ) ( not ( = ?auto_34237 ?auto_34245 ) ) ( not ( = ?auto_34238 ?auto_34245 ) ) ( not ( = ?auto_34236 ?auto_34245 ) ) ( IS-CRATE ?auto_34237 ) ( not ( = ?auto_34247 ?auto_34240 ) ) ( not ( = ?auto_34243 ?auto_34247 ) ) ( HOIST-AT ?auto_34248 ?auto_34247 ) ( not ( = ?auto_34241 ?auto_34248 ) ) ( not ( = ?auto_34244 ?auto_34248 ) ) ( AVAILABLE ?auto_34248 ) ( SURFACE-AT ?auto_34237 ?auto_34247 ) ( ON ?auto_34237 ?auto_34239 ) ( CLEAR ?auto_34237 ) ( not ( = ?auto_34237 ?auto_34239 ) ) ( not ( = ?auto_34238 ?auto_34239 ) ) ( not ( = ?auto_34236 ?auto_34239 ) ) ( not ( = ?auto_34245 ?auto_34239 ) ) ( SURFACE-AT ?auto_34235 ?auto_34240 ) ( CLEAR ?auto_34235 ) ( IS-CRATE ?auto_34236 ) ( not ( = ?auto_34235 ?auto_34236 ) ) ( not ( = ?auto_34237 ?auto_34235 ) ) ( not ( = ?auto_34238 ?auto_34235 ) ) ( not ( = ?auto_34245 ?auto_34235 ) ) ( not ( = ?auto_34239 ?auto_34235 ) ) ( AVAILABLE ?auto_34241 ) ( IN ?auto_34236 ?auto_34242 ) ( TRUCK-AT ?auto_34242 ?auto_34246 ) ( not ( = ?auto_34246 ?auto_34240 ) ) ( not ( = ?auto_34243 ?auto_34246 ) ) ( not ( = ?auto_34247 ?auto_34246 ) ) ( ON ?auto_34235 ?auto_34234 ) ( not ( = ?auto_34234 ?auto_34235 ) ) ( not ( = ?auto_34234 ?auto_34236 ) ) ( not ( = ?auto_34234 ?auto_34237 ) ) ( not ( = ?auto_34234 ?auto_34238 ) ) ( not ( = ?auto_34234 ?auto_34245 ) ) ( not ( = ?auto_34234 ?auto_34239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34236 ?auto_34237 ?auto_34238 )
      ( MAKE-4CRATE-VERIFY ?auto_34234 ?auto_34235 ?auto_34236 ?auto_34237 ?auto_34238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34249 - SURFACE
      ?auto_34250 - SURFACE
    )
    :vars
    (
      ?auto_34255 - HOIST
      ?auto_34252 - PLACE
      ?auto_34254 - SURFACE
      ?auto_34257 - PLACE
      ?auto_34258 - HOIST
      ?auto_34259 - SURFACE
      ?auto_34261 - PLACE
      ?auto_34262 - HOIST
      ?auto_34251 - SURFACE
      ?auto_34253 - SURFACE
      ?auto_34256 - TRUCK
      ?auto_34260 - PLACE
      ?auto_34263 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34255 ?auto_34252 ) ( IS-CRATE ?auto_34250 ) ( not ( = ?auto_34249 ?auto_34250 ) ) ( not ( = ?auto_34254 ?auto_34249 ) ) ( not ( = ?auto_34254 ?auto_34250 ) ) ( not ( = ?auto_34257 ?auto_34252 ) ) ( HOIST-AT ?auto_34258 ?auto_34257 ) ( not ( = ?auto_34255 ?auto_34258 ) ) ( AVAILABLE ?auto_34258 ) ( SURFACE-AT ?auto_34250 ?auto_34257 ) ( ON ?auto_34250 ?auto_34259 ) ( CLEAR ?auto_34250 ) ( not ( = ?auto_34249 ?auto_34259 ) ) ( not ( = ?auto_34250 ?auto_34259 ) ) ( not ( = ?auto_34254 ?auto_34259 ) ) ( IS-CRATE ?auto_34249 ) ( not ( = ?auto_34261 ?auto_34252 ) ) ( not ( = ?auto_34257 ?auto_34261 ) ) ( HOIST-AT ?auto_34262 ?auto_34261 ) ( not ( = ?auto_34255 ?auto_34262 ) ) ( not ( = ?auto_34258 ?auto_34262 ) ) ( AVAILABLE ?auto_34262 ) ( SURFACE-AT ?auto_34249 ?auto_34261 ) ( ON ?auto_34249 ?auto_34251 ) ( CLEAR ?auto_34249 ) ( not ( = ?auto_34249 ?auto_34251 ) ) ( not ( = ?auto_34250 ?auto_34251 ) ) ( not ( = ?auto_34254 ?auto_34251 ) ) ( not ( = ?auto_34259 ?auto_34251 ) ) ( SURFACE-AT ?auto_34253 ?auto_34252 ) ( CLEAR ?auto_34253 ) ( IS-CRATE ?auto_34254 ) ( not ( = ?auto_34253 ?auto_34254 ) ) ( not ( = ?auto_34249 ?auto_34253 ) ) ( not ( = ?auto_34250 ?auto_34253 ) ) ( not ( = ?auto_34259 ?auto_34253 ) ) ( not ( = ?auto_34251 ?auto_34253 ) ) ( AVAILABLE ?auto_34255 ) ( TRUCK-AT ?auto_34256 ?auto_34260 ) ( not ( = ?auto_34260 ?auto_34252 ) ) ( not ( = ?auto_34257 ?auto_34260 ) ) ( not ( = ?auto_34261 ?auto_34260 ) ) ( HOIST-AT ?auto_34263 ?auto_34260 ) ( LIFTING ?auto_34263 ?auto_34254 ) ( not ( = ?auto_34255 ?auto_34263 ) ) ( not ( = ?auto_34258 ?auto_34263 ) ) ( not ( = ?auto_34262 ?auto_34263 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34263 ?auto_34254 ?auto_34256 ?auto_34260 )
      ( MAKE-2CRATE ?auto_34254 ?auto_34249 ?auto_34250 )
      ( MAKE-1CRATE-VERIFY ?auto_34249 ?auto_34250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34264 - SURFACE
      ?auto_34265 - SURFACE
      ?auto_34266 - SURFACE
    )
    :vars
    (
      ?auto_34269 - HOIST
      ?auto_34278 - PLACE
      ?auto_34267 - PLACE
      ?auto_34272 - HOIST
      ?auto_34275 - SURFACE
      ?auto_34276 - PLACE
      ?auto_34268 - HOIST
      ?auto_34273 - SURFACE
      ?auto_34277 - SURFACE
      ?auto_34271 - TRUCK
      ?auto_34274 - PLACE
      ?auto_34270 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34269 ?auto_34278 ) ( IS-CRATE ?auto_34266 ) ( not ( = ?auto_34265 ?auto_34266 ) ) ( not ( = ?auto_34264 ?auto_34265 ) ) ( not ( = ?auto_34264 ?auto_34266 ) ) ( not ( = ?auto_34267 ?auto_34278 ) ) ( HOIST-AT ?auto_34272 ?auto_34267 ) ( not ( = ?auto_34269 ?auto_34272 ) ) ( AVAILABLE ?auto_34272 ) ( SURFACE-AT ?auto_34266 ?auto_34267 ) ( ON ?auto_34266 ?auto_34275 ) ( CLEAR ?auto_34266 ) ( not ( = ?auto_34265 ?auto_34275 ) ) ( not ( = ?auto_34266 ?auto_34275 ) ) ( not ( = ?auto_34264 ?auto_34275 ) ) ( IS-CRATE ?auto_34265 ) ( not ( = ?auto_34276 ?auto_34278 ) ) ( not ( = ?auto_34267 ?auto_34276 ) ) ( HOIST-AT ?auto_34268 ?auto_34276 ) ( not ( = ?auto_34269 ?auto_34268 ) ) ( not ( = ?auto_34272 ?auto_34268 ) ) ( AVAILABLE ?auto_34268 ) ( SURFACE-AT ?auto_34265 ?auto_34276 ) ( ON ?auto_34265 ?auto_34273 ) ( CLEAR ?auto_34265 ) ( not ( = ?auto_34265 ?auto_34273 ) ) ( not ( = ?auto_34266 ?auto_34273 ) ) ( not ( = ?auto_34264 ?auto_34273 ) ) ( not ( = ?auto_34275 ?auto_34273 ) ) ( SURFACE-AT ?auto_34277 ?auto_34278 ) ( CLEAR ?auto_34277 ) ( IS-CRATE ?auto_34264 ) ( not ( = ?auto_34277 ?auto_34264 ) ) ( not ( = ?auto_34265 ?auto_34277 ) ) ( not ( = ?auto_34266 ?auto_34277 ) ) ( not ( = ?auto_34275 ?auto_34277 ) ) ( not ( = ?auto_34273 ?auto_34277 ) ) ( AVAILABLE ?auto_34269 ) ( TRUCK-AT ?auto_34271 ?auto_34274 ) ( not ( = ?auto_34274 ?auto_34278 ) ) ( not ( = ?auto_34267 ?auto_34274 ) ) ( not ( = ?auto_34276 ?auto_34274 ) ) ( HOIST-AT ?auto_34270 ?auto_34274 ) ( LIFTING ?auto_34270 ?auto_34264 ) ( not ( = ?auto_34269 ?auto_34270 ) ) ( not ( = ?auto_34272 ?auto_34270 ) ) ( not ( = ?auto_34268 ?auto_34270 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34265 ?auto_34266 )
      ( MAKE-2CRATE-VERIFY ?auto_34264 ?auto_34265 ?auto_34266 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34279 - SURFACE
      ?auto_34280 - SURFACE
      ?auto_34281 - SURFACE
      ?auto_34282 - SURFACE
    )
    :vars
    (
      ?auto_34286 - HOIST
      ?auto_34293 - PLACE
      ?auto_34288 - PLACE
      ?auto_34287 - HOIST
      ?auto_34285 - SURFACE
      ?auto_34292 - PLACE
      ?auto_34283 - HOIST
      ?auto_34291 - SURFACE
      ?auto_34289 - TRUCK
      ?auto_34290 - PLACE
      ?auto_34284 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34286 ?auto_34293 ) ( IS-CRATE ?auto_34282 ) ( not ( = ?auto_34281 ?auto_34282 ) ) ( not ( = ?auto_34280 ?auto_34281 ) ) ( not ( = ?auto_34280 ?auto_34282 ) ) ( not ( = ?auto_34288 ?auto_34293 ) ) ( HOIST-AT ?auto_34287 ?auto_34288 ) ( not ( = ?auto_34286 ?auto_34287 ) ) ( AVAILABLE ?auto_34287 ) ( SURFACE-AT ?auto_34282 ?auto_34288 ) ( ON ?auto_34282 ?auto_34285 ) ( CLEAR ?auto_34282 ) ( not ( = ?auto_34281 ?auto_34285 ) ) ( not ( = ?auto_34282 ?auto_34285 ) ) ( not ( = ?auto_34280 ?auto_34285 ) ) ( IS-CRATE ?auto_34281 ) ( not ( = ?auto_34292 ?auto_34293 ) ) ( not ( = ?auto_34288 ?auto_34292 ) ) ( HOIST-AT ?auto_34283 ?auto_34292 ) ( not ( = ?auto_34286 ?auto_34283 ) ) ( not ( = ?auto_34287 ?auto_34283 ) ) ( AVAILABLE ?auto_34283 ) ( SURFACE-AT ?auto_34281 ?auto_34292 ) ( ON ?auto_34281 ?auto_34291 ) ( CLEAR ?auto_34281 ) ( not ( = ?auto_34281 ?auto_34291 ) ) ( not ( = ?auto_34282 ?auto_34291 ) ) ( not ( = ?auto_34280 ?auto_34291 ) ) ( not ( = ?auto_34285 ?auto_34291 ) ) ( SURFACE-AT ?auto_34279 ?auto_34293 ) ( CLEAR ?auto_34279 ) ( IS-CRATE ?auto_34280 ) ( not ( = ?auto_34279 ?auto_34280 ) ) ( not ( = ?auto_34281 ?auto_34279 ) ) ( not ( = ?auto_34282 ?auto_34279 ) ) ( not ( = ?auto_34285 ?auto_34279 ) ) ( not ( = ?auto_34291 ?auto_34279 ) ) ( AVAILABLE ?auto_34286 ) ( TRUCK-AT ?auto_34289 ?auto_34290 ) ( not ( = ?auto_34290 ?auto_34293 ) ) ( not ( = ?auto_34288 ?auto_34290 ) ) ( not ( = ?auto_34292 ?auto_34290 ) ) ( HOIST-AT ?auto_34284 ?auto_34290 ) ( LIFTING ?auto_34284 ?auto_34280 ) ( not ( = ?auto_34286 ?auto_34284 ) ) ( not ( = ?auto_34287 ?auto_34284 ) ) ( not ( = ?auto_34283 ?auto_34284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34280 ?auto_34281 ?auto_34282 )
      ( MAKE-3CRATE-VERIFY ?auto_34279 ?auto_34280 ?auto_34281 ?auto_34282 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34294 - SURFACE
      ?auto_34295 - SURFACE
      ?auto_34296 - SURFACE
      ?auto_34297 - SURFACE
      ?auto_34298 - SURFACE
    )
    :vars
    (
      ?auto_34302 - HOIST
      ?auto_34309 - PLACE
      ?auto_34304 - PLACE
      ?auto_34303 - HOIST
      ?auto_34301 - SURFACE
      ?auto_34308 - PLACE
      ?auto_34299 - HOIST
      ?auto_34307 - SURFACE
      ?auto_34305 - TRUCK
      ?auto_34306 - PLACE
      ?auto_34300 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34302 ?auto_34309 ) ( IS-CRATE ?auto_34298 ) ( not ( = ?auto_34297 ?auto_34298 ) ) ( not ( = ?auto_34296 ?auto_34297 ) ) ( not ( = ?auto_34296 ?auto_34298 ) ) ( not ( = ?auto_34304 ?auto_34309 ) ) ( HOIST-AT ?auto_34303 ?auto_34304 ) ( not ( = ?auto_34302 ?auto_34303 ) ) ( AVAILABLE ?auto_34303 ) ( SURFACE-AT ?auto_34298 ?auto_34304 ) ( ON ?auto_34298 ?auto_34301 ) ( CLEAR ?auto_34298 ) ( not ( = ?auto_34297 ?auto_34301 ) ) ( not ( = ?auto_34298 ?auto_34301 ) ) ( not ( = ?auto_34296 ?auto_34301 ) ) ( IS-CRATE ?auto_34297 ) ( not ( = ?auto_34308 ?auto_34309 ) ) ( not ( = ?auto_34304 ?auto_34308 ) ) ( HOIST-AT ?auto_34299 ?auto_34308 ) ( not ( = ?auto_34302 ?auto_34299 ) ) ( not ( = ?auto_34303 ?auto_34299 ) ) ( AVAILABLE ?auto_34299 ) ( SURFACE-AT ?auto_34297 ?auto_34308 ) ( ON ?auto_34297 ?auto_34307 ) ( CLEAR ?auto_34297 ) ( not ( = ?auto_34297 ?auto_34307 ) ) ( not ( = ?auto_34298 ?auto_34307 ) ) ( not ( = ?auto_34296 ?auto_34307 ) ) ( not ( = ?auto_34301 ?auto_34307 ) ) ( SURFACE-AT ?auto_34295 ?auto_34309 ) ( CLEAR ?auto_34295 ) ( IS-CRATE ?auto_34296 ) ( not ( = ?auto_34295 ?auto_34296 ) ) ( not ( = ?auto_34297 ?auto_34295 ) ) ( not ( = ?auto_34298 ?auto_34295 ) ) ( not ( = ?auto_34301 ?auto_34295 ) ) ( not ( = ?auto_34307 ?auto_34295 ) ) ( AVAILABLE ?auto_34302 ) ( TRUCK-AT ?auto_34305 ?auto_34306 ) ( not ( = ?auto_34306 ?auto_34309 ) ) ( not ( = ?auto_34304 ?auto_34306 ) ) ( not ( = ?auto_34308 ?auto_34306 ) ) ( HOIST-AT ?auto_34300 ?auto_34306 ) ( LIFTING ?auto_34300 ?auto_34296 ) ( not ( = ?auto_34302 ?auto_34300 ) ) ( not ( = ?auto_34303 ?auto_34300 ) ) ( not ( = ?auto_34299 ?auto_34300 ) ) ( ON ?auto_34295 ?auto_34294 ) ( not ( = ?auto_34294 ?auto_34295 ) ) ( not ( = ?auto_34294 ?auto_34296 ) ) ( not ( = ?auto_34294 ?auto_34297 ) ) ( not ( = ?auto_34294 ?auto_34298 ) ) ( not ( = ?auto_34294 ?auto_34301 ) ) ( not ( = ?auto_34294 ?auto_34307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34296 ?auto_34297 ?auto_34298 )
      ( MAKE-4CRATE-VERIFY ?auto_34294 ?auto_34295 ?auto_34296 ?auto_34297 ?auto_34298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34310 - SURFACE
      ?auto_34311 - SURFACE
    )
    :vars
    (
      ?auto_34315 - HOIST
      ?auto_34324 - PLACE
      ?auto_34318 - SURFACE
      ?auto_34317 - PLACE
      ?auto_34316 - HOIST
      ?auto_34314 - SURFACE
      ?auto_34323 - PLACE
      ?auto_34312 - HOIST
      ?auto_34322 - SURFACE
      ?auto_34319 - SURFACE
      ?auto_34320 - TRUCK
      ?auto_34321 - PLACE
      ?auto_34313 - HOIST
      ?auto_34325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34315 ?auto_34324 ) ( IS-CRATE ?auto_34311 ) ( not ( = ?auto_34310 ?auto_34311 ) ) ( not ( = ?auto_34318 ?auto_34310 ) ) ( not ( = ?auto_34318 ?auto_34311 ) ) ( not ( = ?auto_34317 ?auto_34324 ) ) ( HOIST-AT ?auto_34316 ?auto_34317 ) ( not ( = ?auto_34315 ?auto_34316 ) ) ( AVAILABLE ?auto_34316 ) ( SURFACE-AT ?auto_34311 ?auto_34317 ) ( ON ?auto_34311 ?auto_34314 ) ( CLEAR ?auto_34311 ) ( not ( = ?auto_34310 ?auto_34314 ) ) ( not ( = ?auto_34311 ?auto_34314 ) ) ( not ( = ?auto_34318 ?auto_34314 ) ) ( IS-CRATE ?auto_34310 ) ( not ( = ?auto_34323 ?auto_34324 ) ) ( not ( = ?auto_34317 ?auto_34323 ) ) ( HOIST-AT ?auto_34312 ?auto_34323 ) ( not ( = ?auto_34315 ?auto_34312 ) ) ( not ( = ?auto_34316 ?auto_34312 ) ) ( AVAILABLE ?auto_34312 ) ( SURFACE-AT ?auto_34310 ?auto_34323 ) ( ON ?auto_34310 ?auto_34322 ) ( CLEAR ?auto_34310 ) ( not ( = ?auto_34310 ?auto_34322 ) ) ( not ( = ?auto_34311 ?auto_34322 ) ) ( not ( = ?auto_34318 ?auto_34322 ) ) ( not ( = ?auto_34314 ?auto_34322 ) ) ( SURFACE-AT ?auto_34319 ?auto_34324 ) ( CLEAR ?auto_34319 ) ( IS-CRATE ?auto_34318 ) ( not ( = ?auto_34319 ?auto_34318 ) ) ( not ( = ?auto_34310 ?auto_34319 ) ) ( not ( = ?auto_34311 ?auto_34319 ) ) ( not ( = ?auto_34314 ?auto_34319 ) ) ( not ( = ?auto_34322 ?auto_34319 ) ) ( AVAILABLE ?auto_34315 ) ( TRUCK-AT ?auto_34320 ?auto_34321 ) ( not ( = ?auto_34321 ?auto_34324 ) ) ( not ( = ?auto_34317 ?auto_34321 ) ) ( not ( = ?auto_34323 ?auto_34321 ) ) ( HOIST-AT ?auto_34313 ?auto_34321 ) ( not ( = ?auto_34315 ?auto_34313 ) ) ( not ( = ?auto_34316 ?auto_34313 ) ) ( not ( = ?auto_34312 ?auto_34313 ) ) ( AVAILABLE ?auto_34313 ) ( SURFACE-AT ?auto_34318 ?auto_34321 ) ( ON ?auto_34318 ?auto_34325 ) ( CLEAR ?auto_34318 ) ( not ( = ?auto_34310 ?auto_34325 ) ) ( not ( = ?auto_34311 ?auto_34325 ) ) ( not ( = ?auto_34318 ?auto_34325 ) ) ( not ( = ?auto_34314 ?auto_34325 ) ) ( not ( = ?auto_34322 ?auto_34325 ) ) ( not ( = ?auto_34319 ?auto_34325 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34313 ?auto_34318 ?auto_34325 ?auto_34321 )
      ( MAKE-2CRATE ?auto_34318 ?auto_34310 ?auto_34311 )
      ( MAKE-1CRATE-VERIFY ?auto_34310 ?auto_34311 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34326 - SURFACE
      ?auto_34327 - SURFACE
      ?auto_34328 - SURFACE
    )
    :vars
    (
      ?auto_34331 - HOIST
      ?auto_34340 - PLACE
      ?auto_34339 - PLACE
      ?auto_34332 - HOIST
      ?auto_34334 - SURFACE
      ?auto_34330 - PLACE
      ?auto_34335 - HOIST
      ?auto_34338 - SURFACE
      ?auto_34336 - SURFACE
      ?auto_34337 - TRUCK
      ?auto_34329 - PLACE
      ?auto_34341 - HOIST
      ?auto_34333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34331 ?auto_34340 ) ( IS-CRATE ?auto_34328 ) ( not ( = ?auto_34327 ?auto_34328 ) ) ( not ( = ?auto_34326 ?auto_34327 ) ) ( not ( = ?auto_34326 ?auto_34328 ) ) ( not ( = ?auto_34339 ?auto_34340 ) ) ( HOIST-AT ?auto_34332 ?auto_34339 ) ( not ( = ?auto_34331 ?auto_34332 ) ) ( AVAILABLE ?auto_34332 ) ( SURFACE-AT ?auto_34328 ?auto_34339 ) ( ON ?auto_34328 ?auto_34334 ) ( CLEAR ?auto_34328 ) ( not ( = ?auto_34327 ?auto_34334 ) ) ( not ( = ?auto_34328 ?auto_34334 ) ) ( not ( = ?auto_34326 ?auto_34334 ) ) ( IS-CRATE ?auto_34327 ) ( not ( = ?auto_34330 ?auto_34340 ) ) ( not ( = ?auto_34339 ?auto_34330 ) ) ( HOIST-AT ?auto_34335 ?auto_34330 ) ( not ( = ?auto_34331 ?auto_34335 ) ) ( not ( = ?auto_34332 ?auto_34335 ) ) ( AVAILABLE ?auto_34335 ) ( SURFACE-AT ?auto_34327 ?auto_34330 ) ( ON ?auto_34327 ?auto_34338 ) ( CLEAR ?auto_34327 ) ( not ( = ?auto_34327 ?auto_34338 ) ) ( not ( = ?auto_34328 ?auto_34338 ) ) ( not ( = ?auto_34326 ?auto_34338 ) ) ( not ( = ?auto_34334 ?auto_34338 ) ) ( SURFACE-AT ?auto_34336 ?auto_34340 ) ( CLEAR ?auto_34336 ) ( IS-CRATE ?auto_34326 ) ( not ( = ?auto_34336 ?auto_34326 ) ) ( not ( = ?auto_34327 ?auto_34336 ) ) ( not ( = ?auto_34328 ?auto_34336 ) ) ( not ( = ?auto_34334 ?auto_34336 ) ) ( not ( = ?auto_34338 ?auto_34336 ) ) ( AVAILABLE ?auto_34331 ) ( TRUCK-AT ?auto_34337 ?auto_34329 ) ( not ( = ?auto_34329 ?auto_34340 ) ) ( not ( = ?auto_34339 ?auto_34329 ) ) ( not ( = ?auto_34330 ?auto_34329 ) ) ( HOIST-AT ?auto_34341 ?auto_34329 ) ( not ( = ?auto_34331 ?auto_34341 ) ) ( not ( = ?auto_34332 ?auto_34341 ) ) ( not ( = ?auto_34335 ?auto_34341 ) ) ( AVAILABLE ?auto_34341 ) ( SURFACE-AT ?auto_34326 ?auto_34329 ) ( ON ?auto_34326 ?auto_34333 ) ( CLEAR ?auto_34326 ) ( not ( = ?auto_34327 ?auto_34333 ) ) ( not ( = ?auto_34328 ?auto_34333 ) ) ( not ( = ?auto_34326 ?auto_34333 ) ) ( not ( = ?auto_34334 ?auto_34333 ) ) ( not ( = ?auto_34338 ?auto_34333 ) ) ( not ( = ?auto_34336 ?auto_34333 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34327 ?auto_34328 )
      ( MAKE-2CRATE-VERIFY ?auto_34326 ?auto_34327 ?auto_34328 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34342 - SURFACE
      ?auto_34343 - SURFACE
      ?auto_34344 - SURFACE
      ?auto_34345 - SURFACE
    )
    :vars
    (
      ?auto_34347 - HOIST
      ?auto_34352 - PLACE
      ?auto_34355 - PLACE
      ?auto_34348 - HOIST
      ?auto_34349 - SURFACE
      ?auto_34354 - PLACE
      ?auto_34350 - HOIST
      ?auto_34353 - SURFACE
      ?auto_34346 - TRUCK
      ?auto_34357 - PLACE
      ?auto_34356 - HOIST
      ?auto_34351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34347 ?auto_34352 ) ( IS-CRATE ?auto_34345 ) ( not ( = ?auto_34344 ?auto_34345 ) ) ( not ( = ?auto_34343 ?auto_34344 ) ) ( not ( = ?auto_34343 ?auto_34345 ) ) ( not ( = ?auto_34355 ?auto_34352 ) ) ( HOIST-AT ?auto_34348 ?auto_34355 ) ( not ( = ?auto_34347 ?auto_34348 ) ) ( AVAILABLE ?auto_34348 ) ( SURFACE-AT ?auto_34345 ?auto_34355 ) ( ON ?auto_34345 ?auto_34349 ) ( CLEAR ?auto_34345 ) ( not ( = ?auto_34344 ?auto_34349 ) ) ( not ( = ?auto_34345 ?auto_34349 ) ) ( not ( = ?auto_34343 ?auto_34349 ) ) ( IS-CRATE ?auto_34344 ) ( not ( = ?auto_34354 ?auto_34352 ) ) ( not ( = ?auto_34355 ?auto_34354 ) ) ( HOIST-AT ?auto_34350 ?auto_34354 ) ( not ( = ?auto_34347 ?auto_34350 ) ) ( not ( = ?auto_34348 ?auto_34350 ) ) ( AVAILABLE ?auto_34350 ) ( SURFACE-AT ?auto_34344 ?auto_34354 ) ( ON ?auto_34344 ?auto_34353 ) ( CLEAR ?auto_34344 ) ( not ( = ?auto_34344 ?auto_34353 ) ) ( not ( = ?auto_34345 ?auto_34353 ) ) ( not ( = ?auto_34343 ?auto_34353 ) ) ( not ( = ?auto_34349 ?auto_34353 ) ) ( SURFACE-AT ?auto_34342 ?auto_34352 ) ( CLEAR ?auto_34342 ) ( IS-CRATE ?auto_34343 ) ( not ( = ?auto_34342 ?auto_34343 ) ) ( not ( = ?auto_34344 ?auto_34342 ) ) ( not ( = ?auto_34345 ?auto_34342 ) ) ( not ( = ?auto_34349 ?auto_34342 ) ) ( not ( = ?auto_34353 ?auto_34342 ) ) ( AVAILABLE ?auto_34347 ) ( TRUCK-AT ?auto_34346 ?auto_34357 ) ( not ( = ?auto_34357 ?auto_34352 ) ) ( not ( = ?auto_34355 ?auto_34357 ) ) ( not ( = ?auto_34354 ?auto_34357 ) ) ( HOIST-AT ?auto_34356 ?auto_34357 ) ( not ( = ?auto_34347 ?auto_34356 ) ) ( not ( = ?auto_34348 ?auto_34356 ) ) ( not ( = ?auto_34350 ?auto_34356 ) ) ( AVAILABLE ?auto_34356 ) ( SURFACE-AT ?auto_34343 ?auto_34357 ) ( ON ?auto_34343 ?auto_34351 ) ( CLEAR ?auto_34343 ) ( not ( = ?auto_34344 ?auto_34351 ) ) ( not ( = ?auto_34345 ?auto_34351 ) ) ( not ( = ?auto_34343 ?auto_34351 ) ) ( not ( = ?auto_34349 ?auto_34351 ) ) ( not ( = ?auto_34353 ?auto_34351 ) ) ( not ( = ?auto_34342 ?auto_34351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34343 ?auto_34344 ?auto_34345 )
      ( MAKE-3CRATE-VERIFY ?auto_34342 ?auto_34343 ?auto_34344 ?auto_34345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34358 - SURFACE
      ?auto_34359 - SURFACE
      ?auto_34360 - SURFACE
      ?auto_34361 - SURFACE
      ?auto_34362 - SURFACE
    )
    :vars
    (
      ?auto_34364 - HOIST
      ?auto_34369 - PLACE
      ?auto_34372 - PLACE
      ?auto_34365 - HOIST
      ?auto_34366 - SURFACE
      ?auto_34371 - PLACE
      ?auto_34367 - HOIST
      ?auto_34370 - SURFACE
      ?auto_34363 - TRUCK
      ?auto_34374 - PLACE
      ?auto_34373 - HOIST
      ?auto_34368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34364 ?auto_34369 ) ( IS-CRATE ?auto_34362 ) ( not ( = ?auto_34361 ?auto_34362 ) ) ( not ( = ?auto_34360 ?auto_34361 ) ) ( not ( = ?auto_34360 ?auto_34362 ) ) ( not ( = ?auto_34372 ?auto_34369 ) ) ( HOIST-AT ?auto_34365 ?auto_34372 ) ( not ( = ?auto_34364 ?auto_34365 ) ) ( AVAILABLE ?auto_34365 ) ( SURFACE-AT ?auto_34362 ?auto_34372 ) ( ON ?auto_34362 ?auto_34366 ) ( CLEAR ?auto_34362 ) ( not ( = ?auto_34361 ?auto_34366 ) ) ( not ( = ?auto_34362 ?auto_34366 ) ) ( not ( = ?auto_34360 ?auto_34366 ) ) ( IS-CRATE ?auto_34361 ) ( not ( = ?auto_34371 ?auto_34369 ) ) ( not ( = ?auto_34372 ?auto_34371 ) ) ( HOIST-AT ?auto_34367 ?auto_34371 ) ( not ( = ?auto_34364 ?auto_34367 ) ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( AVAILABLE ?auto_34367 ) ( SURFACE-AT ?auto_34361 ?auto_34371 ) ( ON ?auto_34361 ?auto_34370 ) ( CLEAR ?auto_34361 ) ( not ( = ?auto_34361 ?auto_34370 ) ) ( not ( = ?auto_34362 ?auto_34370 ) ) ( not ( = ?auto_34360 ?auto_34370 ) ) ( not ( = ?auto_34366 ?auto_34370 ) ) ( SURFACE-AT ?auto_34359 ?auto_34369 ) ( CLEAR ?auto_34359 ) ( IS-CRATE ?auto_34360 ) ( not ( = ?auto_34359 ?auto_34360 ) ) ( not ( = ?auto_34361 ?auto_34359 ) ) ( not ( = ?auto_34362 ?auto_34359 ) ) ( not ( = ?auto_34366 ?auto_34359 ) ) ( not ( = ?auto_34370 ?auto_34359 ) ) ( AVAILABLE ?auto_34364 ) ( TRUCK-AT ?auto_34363 ?auto_34374 ) ( not ( = ?auto_34374 ?auto_34369 ) ) ( not ( = ?auto_34372 ?auto_34374 ) ) ( not ( = ?auto_34371 ?auto_34374 ) ) ( HOIST-AT ?auto_34373 ?auto_34374 ) ( not ( = ?auto_34364 ?auto_34373 ) ) ( not ( = ?auto_34365 ?auto_34373 ) ) ( not ( = ?auto_34367 ?auto_34373 ) ) ( AVAILABLE ?auto_34373 ) ( SURFACE-AT ?auto_34360 ?auto_34374 ) ( ON ?auto_34360 ?auto_34368 ) ( CLEAR ?auto_34360 ) ( not ( = ?auto_34361 ?auto_34368 ) ) ( not ( = ?auto_34362 ?auto_34368 ) ) ( not ( = ?auto_34360 ?auto_34368 ) ) ( not ( = ?auto_34366 ?auto_34368 ) ) ( not ( = ?auto_34370 ?auto_34368 ) ) ( not ( = ?auto_34359 ?auto_34368 ) ) ( ON ?auto_34359 ?auto_34358 ) ( not ( = ?auto_34358 ?auto_34359 ) ) ( not ( = ?auto_34358 ?auto_34360 ) ) ( not ( = ?auto_34358 ?auto_34361 ) ) ( not ( = ?auto_34358 ?auto_34362 ) ) ( not ( = ?auto_34358 ?auto_34366 ) ) ( not ( = ?auto_34358 ?auto_34370 ) ) ( not ( = ?auto_34358 ?auto_34368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34360 ?auto_34361 ?auto_34362 )
      ( MAKE-4CRATE-VERIFY ?auto_34358 ?auto_34359 ?auto_34360 ?auto_34361 ?auto_34362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34375 - SURFACE
      ?auto_34376 - SURFACE
    )
    :vars
    (
      ?auto_34378 - HOIST
      ?auto_34384 - PLACE
      ?auto_34387 - SURFACE
      ?auto_34388 - PLACE
      ?auto_34380 - HOIST
      ?auto_34381 - SURFACE
      ?auto_34386 - PLACE
      ?auto_34382 - HOIST
      ?auto_34385 - SURFACE
      ?auto_34379 - SURFACE
      ?auto_34390 - PLACE
      ?auto_34389 - HOIST
      ?auto_34383 - SURFACE
      ?auto_34377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34378 ?auto_34384 ) ( IS-CRATE ?auto_34376 ) ( not ( = ?auto_34375 ?auto_34376 ) ) ( not ( = ?auto_34387 ?auto_34375 ) ) ( not ( = ?auto_34387 ?auto_34376 ) ) ( not ( = ?auto_34388 ?auto_34384 ) ) ( HOIST-AT ?auto_34380 ?auto_34388 ) ( not ( = ?auto_34378 ?auto_34380 ) ) ( AVAILABLE ?auto_34380 ) ( SURFACE-AT ?auto_34376 ?auto_34388 ) ( ON ?auto_34376 ?auto_34381 ) ( CLEAR ?auto_34376 ) ( not ( = ?auto_34375 ?auto_34381 ) ) ( not ( = ?auto_34376 ?auto_34381 ) ) ( not ( = ?auto_34387 ?auto_34381 ) ) ( IS-CRATE ?auto_34375 ) ( not ( = ?auto_34386 ?auto_34384 ) ) ( not ( = ?auto_34388 ?auto_34386 ) ) ( HOIST-AT ?auto_34382 ?auto_34386 ) ( not ( = ?auto_34378 ?auto_34382 ) ) ( not ( = ?auto_34380 ?auto_34382 ) ) ( AVAILABLE ?auto_34382 ) ( SURFACE-AT ?auto_34375 ?auto_34386 ) ( ON ?auto_34375 ?auto_34385 ) ( CLEAR ?auto_34375 ) ( not ( = ?auto_34375 ?auto_34385 ) ) ( not ( = ?auto_34376 ?auto_34385 ) ) ( not ( = ?auto_34387 ?auto_34385 ) ) ( not ( = ?auto_34381 ?auto_34385 ) ) ( SURFACE-AT ?auto_34379 ?auto_34384 ) ( CLEAR ?auto_34379 ) ( IS-CRATE ?auto_34387 ) ( not ( = ?auto_34379 ?auto_34387 ) ) ( not ( = ?auto_34375 ?auto_34379 ) ) ( not ( = ?auto_34376 ?auto_34379 ) ) ( not ( = ?auto_34381 ?auto_34379 ) ) ( not ( = ?auto_34385 ?auto_34379 ) ) ( AVAILABLE ?auto_34378 ) ( not ( = ?auto_34390 ?auto_34384 ) ) ( not ( = ?auto_34388 ?auto_34390 ) ) ( not ( = ?auto_34386 ?auto_34390 ) ) ( HOIST-AT ?auto_34389 ?auto_34390 ) ( not ( = ?auto_34378 ?auto_34389 ) ) ( not ( = ?auto_34380 ?auto_34389 ) ) ( not ( = ?auto_34382 ?auto_34389 ) ) ( AVAILABLE ?auto_34389 ) ( SURFACE-AT ?auto_34387 ?auto_34390 ) ( ON ?auto_34387 ?auto_34383 ) ( CLEAR ?auto_34387 ) ( not ( = ?auto_34375 ?auto_34383 ) ) ( not ( = ?auto_34376 ?auto_34383 ) ) ( not ( = ?auto_34387 ?auto_34383 ) ) ( not ( = ?auto_34381 ?auto_34383 ) ) ( not ( = ?auto_34385 ?auto_34383 ) ) ( not ( = ?auto_34379 ?auto_34383 ) ) ( TRUCK-AT ?auto_34377 ?auto_34384 ) )
    :subtasks
    ( ( !DRIVE ?auto_34377 ?auto_34384 ?auto_34390 )
      ( MAKE-2CRATE ?auto_34387 ?auto_34375 ?auto_34376 )
      ( MAKE-1CRATE-VERIFY ?auto_34375 ?auto_34376 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34391 - SURFACE
      ?auto_34392 - SURFACE
      ?auto_34393 - SURFACE
    )
    :vars
    (
      ?auto_34402 - HOIST
      ?auto_34399 - PLACE
      ?auto_34400 - PLACE
      ?auto_34394 - HOIST
      ?auto_34405 - SURFACE
      ?auto_34396 - PLACE
      ?auto_34401 - HOIST
      ?auto_34404 - SURFACE
      ?auto_34395 - SURFACE
      ?auto_34403 - PLACE
      ?auto_34398 - HOIST
      ?auto_34406 - SURFACE
      ?auto_34397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34402 ?auto_34399 ) ( IS-CRATE ?auto_34393 ) ( not ( = ?auto_34392 ?auto_34393 ) ) ( not ( = ?auto_34391 ?auto_34392 ) ) ( not ( = ?auto_34391 ?auto_34393 ) ) ( not ( = ?auto_34400 ?auto_34399 ) ) ( HOIST-AT ?auto_34394 ?auto_34400 ) ( not ( = ?auto_34402 ?auto_34394 ) ) ( AVAILABLE ?auto_34394 ) ( SURFACE-AT ?auto_34393 ?auto_34400 ) ( ON ?auto_34393 ?auto_34405 ) ( CLEAR ?auto_34393 ) ( not ( = ?auto_34392 ?auto_34405 ) ) ( not ( = ?auto_34393 ?auto_34405 ) ) ( not ( = ?auto_34391 ?auto_34405 ) ) ( IS-CRATE ?auto_34392 ) ( not ( = ?auto_34396 ?auto_34399 ) ) ( not ( = ?auto_34400 ?auto_34396 ) ) ( HOIST-AT ?auto_34401 ?auto_34396 ) ( not ( = ?auto_34402 ?auto_34401 ) ) ( not ( = ?auto_34394 ?auto_34401 ) ) ( AVAILABLE ?auto_34401 ) ( SURFACE-AT ?auto_34392 ?auto_34396 ) ( ON ?auto_34392 ?auto_34404 ) ( CLEAR ?auto_34392 ) ( not ( = ?auto_34392 ?auto_34404 ) ) ( not ( = ?auto_34393 ?auto_34404 ) ) ( not ( = ?auto_34391 ?auto_34404 ) ) ( not ( = ?auto_34405 ?auto_34404 ) ) ( SURFACE-AT ?auto_34395 ?auto_34399 ) ( CLEAR ?auto_34395 ) ( IS-CRATE ?auto_34391 ) ( not ( = ?auto_34395 ?auto_34391 ) ) ( not ( = ?auto_34392 ?auto_34395 ) ) ( not ( = ?auto_34393 ?auto_34395 ) ) ( not ( = ?auto_34405 ?auto_34395 ) ) ( not ( = ?auto_34404 ?auto_34395 ) ) ( AVAILABLE ?auto_34402 ) ( not ( = ?auto_34403 ?auto_34399 ) ) ( not ( = ?auto_34400 ?auto_34403 ) ) ( not ( = ?auto_34396 ?auto_34403 ) ) ( HOIST-AT ?auto_34398 ?auto_34403 ) ( not ( = ?auto_34402 ?auto_34398 ) ) ( not ( = ?auto_34394 ?auto_34398 ) ) ( not ( = ?auto_34401 ?auto_34398 ) ) ( AVAILABLE ?auto_34398 ) ( SURFACE-AT ?auto_34391 ?auto_34403 ) ( ON ?auto_34391 ?auto_34406 ) ( CLEAR ?auto_34391 ) ( not ( = ?auto_34392 ?auto_34406 ) ) ( not ( = ?auto_34393 ?auto_34406 ) ) ( not ( = ?auto_34391 ?auto_34406 ) ) ( not ( = ?auto_34405 ?auto_34406 ) ) ( not ( = ?auto_34404 ?auto_34406 ) ) ( not ( = ?auto_34395 ?auto_34406 ) ) ( TRUCK-AT ?auto_34397 ?auto_34399 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34392 ?auto_34393 )
      ( MAKE-2CRATE-VERIFY ?auto_34391 ?auto_34392 ?auto_34393 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34407 - SURFACE
      ?auto_34408 - SURFACE
      ?auto_34409 - SURFACE
      ?auto_34410 - SURFACE
    )
    :vars
    (
      ?auto_34421 - HOIST
      ?auto_34422 - PLACE
      ?auto_34416 - PLACE
      ?auto_34419 - HOIST
      ?auto_34420 - SURFACE
      ?auto_34412 - PLACE
      ?auto_34418 - HOIST
      ?auto_34411 - SURFACE
      ?auto_34413 - PLACE
      ?auto_34417 - HOIST
      ?auto_34414 - SURFACE
      ?auto_34415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34421 ?auto_34422 ) ( IS-CRATE ?auto_34410 ) ( not ( = ?auto_34409 ?auto_34410 ) ) ( not ( = ?auto_34408 ?auto_34409 ) ) ( not ( = ?auto_34408 ?auto_34410 ) ) ( not ( = ?auto_34416 ?auto_34422 ) ) ( HOIST-AT ?auto_34419 ?auto_34416 ) ( not ( = ?auto_34421 ?auto_34419 ) ) ( AVAILABLE ?auto_34419 ) ( SURFACE-AT ?auto_34410 ?auto_34416 ) ( ON ?auto_34410 ?auto_34420 ) ( CLEAR ?auto_34410 ) ( not ( = ?auto_34409 ?auto_34420 ) ) ( not ( = ?auto_34410 ?auto_34420 ) ) ( not ( = ?auto_34408 ?auto_34420 ) ) ( IS-CRATE ?auto_34409 ) ( not ( = ?auto_34412 ?auto_34422 ) ) ( not ( = ?auto_34416 ?auto_34412 ) ) ( HOIST-AT ?auto_34418 ?auto_34412 ) ( not ( = ?auto_34421 ?auto_34418 ) ) ( not ( = ?auto_34419 ?auto_34418 ) ) ( AVAILABLE ?auto_34418 ) ( SURFACE-AT ?auto_34409 ?auto_34412 ) ( ON ?auto_34409 ?auto_34411 ) ( CLEAR ?auto_34409 ) ( not ( = ?auto_34409 ?auto_34411 ) ) ( not ( = ?auto_34410 ?auto_34411 ) ) ( not ( = ?auto_34408 ?auto_34411 ) ) ( not ( = ?auto_34420 ?auto_34411 ) ) ( SURFACE-AT ?auto_34407 ?auto_34422 ) ( CLEAR ?auto_34407 ) ( IS-CRATE ?auto_34408 ) ( not ( = ?auto_34407 ?auto_34408 ) ) ( not ( = ?auto_34409 ?auto_34407 ) ) ( not ( = ?auto_34410 ?auto_34407 ) ) ( not ( = ?auto_34420 ?auto_34407 ) ) ( not ( = ?auto_34411 ?auto_34407 ) ) ( AVAILABLE ?auto_34421 ) ( not ( = ?auto_34413 ?auto_34422 ) ) ( not ( = ?auto_34416 ?auto_34413 ) ) ( not ( = ?auto_34412 ?auto_34413 ) ) ( HOIST-AT ?auto_34417 ?auto_34413 ) ( not ( = ?auto_34421 ?auto_34417 ) ) ( not ( = ?auto_34419 ?auto_34417 ) ) ( not ( = ?auto_34418 ?auto_34417 ) ) ( AVAILABLE ?auto_34417 ) ( SURFACE-AT ?auto_34408 ?auto_34413 ) ( ON ?auto_34408 ?auto_34414 ) ( CLEAR ?auto_34408 ) ( not ( = ?auto_34409 ?auto_34414 ) ) ( not ( = ?auto_34410 ?auto_34414 ) ) ( not ( = ?auto_34408 ?auto_34414 ) ) ( not ( = ?auto_34420 ?auto_34414 ) ) ( not ( = ?auto_34411 ?auto_34414 ) ) ( not ( = ?auto_34407 ?auto_34414 ) ) ( TRUCK-AT ?auto_34415 ?auto_34422 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34408 ?auto_34409 ?auto_34410 )
      ( MAKE-3CRATE-VERIFY ?auto_34407 ?auto_34408 ?auto_34409 ?auto_34410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34423 - SURFACE
      ?auto_34424 - SURFACE
      ?auto_34425 - SURFACE
      ?auto_34426 - SURFACE
      ?auto_34427 - SURFACE
    )
    :vars
    (
      ?auto_34438 - HOIST
      ?auto_34439 - PLACE
      ?auto_34433 - PLACE
      ?auto_34436 - HOIST
      ?auto_34437 - SURFACE
      ?auto_34429 - PLACE
      ?auto_34435 - HOIST
      ?auto_34428 - SURFACE
      ?auto_34430 - PLACE
      ?auto_34434 - HOIST
      ?auto_34431 - SURFACE
      ?auto_34432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34438 ?auto_34439 ) ( IS-CRATE ?auto_34427 ) ( not ( = ?auto_34426 ?auto_34427 ) ) ( not ( = ?auto_34425 ?auto_34426 ) ) ( not ( = ?auto_34425 ?auto_34427 ) ) ( not ( = ?auto_34433 ?auto_34439 ) ) ( HOIST-AT ?auto_34436 ?auto_34433 ) ( not ( = ?auto_34438 ?auto_34436 ) ) ( AVAILABLE ?auto_34436 ) ( SURFACE-AT ?auto_34427 ?auto_34433 ) ( ON ?auto_34427 ?auto_34437 ) ( CLEAR ?auto_34427 ) ( not ( = ?auto_34426 ?auto_34437 ) ) ( not ( = ?auto_34427 ?auto_34437 ) ) ( not ( = ?auto_34425 ?auto_34437 ) ) ( IS-CRATE ?auto_34426 ) ( not ( = ?auto_34429 ?auto_34439 ) ) ( not ( = ?auto_34433 ?auto_34429 ) ) ( HOIST-AT ?auto_34435 ?auto_34429 ) ( not ( = ?auto_34438 ?auto_34435 ) ) ( not ( = ?auto_34436 ?auto_34435 ) ) ( AVAILABLE ?auto_34435 ) ( SURFACE-AT ?auto_34426 ?auto_34429 ) ( ON ?auto_34426 ?auto_34428 ) ( CLEAR ?auto_34426 ) ( not ( = ?auto_34426 ?auto_34428 ) ) ( not ( = ?auto_34427 ?auto_34428 ) ) ( not ( = ?auto_34425 ?auto_34428 ) ) ( not ( = ?auto_34437 ?auto_34428 ) ) ( SURFACE-AT ?auto_34424 ?auto_34439 ) ( CLEAR ?auto_34424 ) ( IS-CRATE ?auto_34425 ) ( not ( = ?auto_34424 ?auto_34425 ) ) ( not ( = ?auto_34426 ?auto_34424 ) ) ( not ( = ?auto_34427 ?auto_34424 ) ) ( not ( = ?auto_34437 ?auto_34424 ) ) ( not ( = ?auto_34428 ?auto_34424 ) ) ( AVAILABLE ?auto_34438 ) ( not ( = ?auto_34430 ?auto_34439 ) ) ( not ( = ?auto_34433 ?auto_34430 ) ) ( not ( = ?auto_34429 ?auto_34430 ) ) ( HOIST-AT ?auto_34434 ?auto_34430 ) ( not ( = ?auto_34438 ?auto_34434 ) ) ( not ( = ?auto_34436 ?auto_34434 ) ) ( not ( = ?auto_34435 ?auto_34434 ) ) ( AVAILABLE ?auto_34434 ) ( SURFACE-AT ?auto_34425 ?auto_34430 ) ( ON ?auto_34425 ?auto_34431 ) ( CLEAR ?auto_34425 ) ( not ( = ?auto_34426 ?auto_34431 ) ) ( not ( = ?auto_34427 ?auto_34431 ) ) ( not ( = ?auto_34425 ?auto_34431 ) ) ( not ( = ?auto_34437 ?auto_34431 ) ) ( not ( = ?auto_34428 ?auto_34431 ) ) ( not ( = ?auto_34424 ?auto_34431 ) ) ( TRUCK-AT ?auto_34432 ?auto_34439 ) ( ON ?auto_34424 ?auto_34423 ) ( not ( = ?auto_34423 ?auto_34424 ) ) ( not ( = ?auto_34423 ?auto_34425 ) ) ( not ( = ?auto_34423 ?auto_34426 ) ) ( not ( = ?auto_34423 ?auto_34427 ) ) ( not ( = ?auto_34423 ?auto_34437 ) ) ( not ( = ?auto_34423 ?auto_34428 ) ) ( not ( = ?auto_34423 ?auto_34431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34425 ?auto_34426 ?auto_34427 )
      ( MAKE-4CRATE-VERIFY ?auto_34423 ?auto_34424 ?auto_34425 ?auto_34426 ?auto_34427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34440 - SURFACE
      ?auto_34441 - SURFACE
    )
    :vars
    (
      ?auto_34454 - HOIST
      ?auto_34455 - PLACE
      ?auto_34450 - SURFACE
      ?auto_34448 - PLACE
      ?auto_34452 - HOIST
      ?auto_34453 - SURFACE
      ?auto_34443 - PLACE
      ?auto_34451 - HOIST
      ?auto_34442 - SURFACE
      ?auto_34445 - SURFACE
      ?auto_34444 - PLACE
      ?auto_34449 - HOIST
      ?auto_34446 - SURFACE
      ?auto_34447 - TRUCK
      ?auto_34456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34454 ?auto_34455 ) ( IS-CRATE ?auto_34441 ) ( not ( = ?auto_34440 ?auto_34441 ) ) ( not ( = ?auto_34450 ?auto_34440 ) ) ( not ( = ?auto_34450 ?auto_34441 ) ) ( not ( = ?auto_34448 ?auto_34455 ) ) ( HOIST-AT ?auto_34452 ?auto_34448 ) ( not ( = ?auto_34454 ?auto_34452 ) ) ( AVAILABLE ?auto_34452 ) ( SURFACE-AT ?auto_34441 ?auto_34448 ) ( ON ?auto_34441 ?auto_34453 ) ( CLEAR ?auto_34441 ) ( not ( = ?auto_34440 ?auto_34453 ) ) ( not ( = ?auto_34441 ?auto_34453 ) ) ( not ( = ?auto_34450 ?auto_34453 ) ) ( IS-CRATE ?auto_34440 ) ( not ( = ?auto_34443 ?auto_34455 ) ) ( not ( = ?auto_34448 ?auto_34443 ) ) ( HOIST-AT ?auto_34451 ?auto_34443 ) ( not ( = ?auto_34454 ?auto_34451 ) ) ( not ( = ?auto_34452 ?auto_34451 ) ) ( AVAILABLE ?auto_34451 ) ( SURFACE-AT ?auto_34440 ?auto_34443 ) ( ON ?auto_34440 ?auto_34442 ) ( CLEAR ?auto_34440 ) ( not ( = ?auto_34440 ?auto_34442 ) ) ( not ( = ?auto_34441 ?auto_34442 ) ) ( not ( = ?auto_34450 ?auto_34442 ) ) ( not ( = ?auto_34453 ?auto_34442 ) ) ( IS-CRATE ?auto_34450 ) ( not ( = ?auto_34445 ?auto_34450 ) ) ( not ( = ?auto_34440 ?auto_34445 ) ) ( not ( = ?auto_34441 ?auto_34445 ) ) ( not ( = ?auto_34453 ?auto_34445 ) ) ( not ( = ?auto_34442 ?auto_34445 ) ) ( not ( = ?auto_34444 ?auto_34455 ) ) ( not ( = ?auto_34448 ?auto_34444 ) ) ( not ( = ?auto_34443 ?auto_34444 ) ) ( HOIST-AT ?auto_34449 ?auto_34444 ) ( not ( = ?auto_34454 ?auto_34449 ) ) ( not ( = ?auto_34452 ?auto_34449 ) ) ( not ( = ?auto_34451 ?auto_34449 ) ) ( AVAILABLE ?auto_34449 ) ( SURFACE-AT ?auto_34450 ?auto_34444 ) ( ON ?auto_34450 ?auto_34446 ) ( CLEAR ?auto_34450 ) ( not ( = ?auto_34440 ?auto_34446 ) ) ( not ( = ?auto_34441 ?auto_34446 ) ) ( not ( = ?auto_34450 ?auto_34446 ) ) ( not ( = ?auto_34453 ?auto_34446 ) ) ( not ( = ?auto_34442 ?auto_34446 ) ) ( not ( = ?auto_34445 ?auto_34446 ) ) ( TRUCK-AT ?auto_34447 ?auto_34455 ) ( SURFACE-AT ?auto_34456 ?auto_34455 ) ( CLEAR ?auto_34456 ) ( LIFTING ?auto_34454 ?auto_34445 ) ( IS-CRATE ?auto_34445 ) ( not ( = ?auto_34456 ?auto_34445 ) ) ( not ( = ?auto_34440 ?auto_34456 ) ) ( not ( = ?auto_34441 ?auto_34456 ) ) ( not ( = ?auto_34450 ?auto_34456 ) ) ( not ( = ?auto_34453 ?auto_34456 ) ) ( not ( = ?auto_34442 ?auto_34456 ) ) ( not ( = ?auto_34446 ?auto_34456 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34456 ?auto_34445 )
      ( MAKE-2CRATE ?auto_34450 ?auto_34440 ?auto_34441 )
      ( MAKE-1CRATE-VERIFY ?auto_34440 ?auto_34441 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34457 - SURFACE
      ?auto_34458 - SURFACE
      ?auto_34459 - SURFACE
    )
    :vars
    (
      ?auto_34466 - HOIST
      ?auto_34470 - PLACE
      ?auto_34464 - PLACE
      ?auto_34467 - HOIST
      ?auto_34469 - SURFACE
      ?auto_34473 - PLACE
      ?auto_34461 - HOIST
      ?auto_34471 - SURFACE
      ?auto_34463 - SURFACE
      ?auto_34462 - PLACE
      ?auto_34468 - HOIST
      ?auto_34460 - SURFACE
      ?auto_34465 - TRUCK
      ?auto_34472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34466 ?auto_34470 ) ( IS-CRATE ?auto_34459 ) ( not ( = ?auto_34458 ?auto_34459 ) ) ( not ( = ?auto_34457 ?auto_34458 ) ) ( not ( = ?auto_34457 ?auto_34459 ) ) ( not ( = ?auto_34464 ?auto_34470 ) ) ( HOIST-AT ?auto_34467 ?auto_34464 ) ( not ( = ?auto_34466 ?auto_34467 ) ) ( AVAILABLE ?auto_34467 ) ( SURFACE-AT ?auto_34459 ?auto_34464 ) ( ON ?auto_34459 ?auto_34469 ) ( CLEAR ?auto_34459 ) ( not ( = ?auto_34458 ?auto_34469 ) ) ( not ( = ?auto_34459 ?auto_34469 ) ) ( not ( = ?auto_34457 ?auto_34469 ) ) ( IS-CRATE ?auto_34458 ) ( not ( = ?auto_34473 ?auto_34470 ) ) ( not ( = ?auto_34464 ?auto_34473 ) ) ( HOIST-AT ?auto_34461 ?auto_34473 ) ( not ( = ?auto_34466 ?auto_34461 ) ) ( not ( = ?auto_34467 ?auto_34461 ) ) ( AVAILABLE ?auto_34461 ) ( SURFACE-AT ?auto_34458 ?auto_34473 ) ( ON ?auto_34458 ?auto_34471 ) ( CLEAR ?auto_34458 ) ( not ( = ?auto_34458 ?auto_34471 ) ) ( not ( = ?auto_34459 ?auto_34471 ) ) ( not ( = ?auto_34457 ?auto_34471 ) ) ( not ( = ?auto_34469 ?auto_34471 ) ) ( IS-CRATE ?auto_34457 ) ( not ( = ?auto_34463 ?auto_34457 ) ) ( not ( = ?auto_34458 ?auto_34463 ) ) ( not ( = ?auto_34459 ?auto_34463 ) ) ( not ( = ?auto_34469 ?auto_34463 ) ) ( not ( = ?auto_34471 ?auto_34463 ) ) ( not ( = ?auto_34462 ?auto_34470 ) ) ( not ( = ?auto_34464 ?auto_34462 ) ) ( not ( = ?auto_34473 ?auto_34462 ) ) ( HOIST-AT ?auto_34468 ?auto_34462 ) ( not ( = ?auto_34466 ?auto_34468 ) ) ( not ( = ?auto_34467 ?auto_34468 ) ) ( not ( = ?auto_34461 ?auto_34468 ) ) ( AVAILABLE ?auto_34468 ) ( SURFACE-AT ?auto_34457 ?auto_34462 ) ( ON ?auto_34457 ?auto_34460 ) ( CLEAR ?auto_34457 ) ( not ( = ?auto_34458 ?auto_34460 ) ) ( not ( = ?auto_34459 ?auto_34460 ) ) ( not ( = ?auto_34457 ?auto_34460 ) ) ( not ( = ?auto_34469 ?auto_34460 ) ) ( not ( = ?auto_34471 ?auto_34460 ) ) ( not ( = ?auto_34463 ?auto_34460 ) ) ( TRUCK-AT ?auto_34465 ?auto_34470 ) ( SURFACE-AT ?auto_34472 ?auto_34470 ) ( CLEAR ?auto_34472 ) ( LIFTING ?auto_34466 ?auto_34463 ) ( IS-CRATE ?auto_34463 ) ( not ( = ?auto_34472 ?auto_34463 ) ) ( not ( = ?auto_34458 ?auto_34472 ) ) ( not ( = ?auto_34459 ?auto_34472 ) ) ( not ( = ?auto_34457 ?auto_34472 ) ) ( not ( = ?auto_34469 ?auto_34472 ) ) ( not ( = ?auto_34471 ?auto_34472 ) ) ( not ( = ?auto_34460 ?auto_34472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34458 ?auto_34459 )
      ( MAKE-2CRATE-VERIFY ?auto_34457 ?auto_34458 ?auto_34459 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34474 - SURFACE
      ?auto_34475 - SURFACE
      ?auto_34476 - SURFACE
      ?auto_34477 - SURFACE
    )
    :vars
    (
      ?auto_34487 - HOIST
      ?auto_34490 - PLACE
      ?auto_34483 - PLACE
      ?auto_34488 - HOIST
      ?auto_34480 - SURFACE
      ?auto_34481 - PLACE
      ?auto_34482 - HOIST
      ?auto_34485 - SURFACE
      ?auto_34479 - PLACE
      ?auto_34486 - HOIST
      ?auto_34484 - SURFACE
      ?auto_34478 - TRUCK
      ?auto_34489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34487 ?auto_34490 ) ( IS-CRATE ?auto_34477 ) ( not ( = ?auto_34476 ?auto_34477 ) ) ( not ( = ?auto_34475 ?auto_34476 ) ) ( not ( = ?auto_34475 ?auto_34477 ) ) ( not ( = ?auto_34483 ?auto_34490 ) ) ( HOIST-AT ?auto_34488 ?auto_34483 ) ( not ( = ?auto_34487 ?auto_34488 ) ) ( AVAILABLE ?auto_34488 ) ( SURFACE-AT ?auto_34477 ?auto_34483 ) ( ON ?auto_34477 ?auto_34480 ) ( CLEAR ?auto_34477 ) ( not ( = ?auto_34476 ?auto_34480 ) ) ( not ( = ?auto_34477 ?auto_34480 ) ) ( not ( = ?auto_34475 ?auto_34480 ) ) ( IS-CRATE ?auto_34476 ) ( not ( = ?auto_34481 ?auto_34490 ) ) ( not ( = ?auto_34483 ?auto_34481 ) ) ( HOIST-AT ?auto_34482 ?auto_34481 ) ( not ( = ?auto_34487 ?auto_34482 ) ) ( not ( = ?auto_34488 ?auto_34482 ) ) ( AVAILABLE ?auto_34482 ) ( SURFACE-AT ?auto_34476 ?auto_34481 ) ( ON ?auto_34476 ?auto_34485 ) ( CLEAR ?auto_34476 ) ( not ( = ?auto_34476 ?auto_34485 ) ) ( not ( = ?auto_34477 ?auto_34485 ) ) ( not ( = ?auto_34475 ?auto_34485 ) ) ( not ( = ?auto_34480 ?auto_34485 ) ) ( IS-CRATE ?auto_34475 ) ( not ( = ?auto_34474 ?auto_34475 ) ) ( not ( = ?auto_34476 ?auto_34474 ) ) ( not ( = ?auto_34477 ?auto_34474 ) ) ( not ( = ?auto_34480 ?auto_34474 ) ) ( not ( = ?auto_34485 ?auto_34474 ) ) ( not ( = ?auto_34479 ?auto_34490 ) ) ( not ( = ?auto_34483 ?auto_34479 ) ) ( not ( = ?auto_34481 ?auto_34479 ) ) ( HOIST-AT ?auto_34486 ?auto_34479 ) ( not ( = ?auto_34487 ?auto_34486 ) ) ( not ( = ?auto_34488 ?auto_34486 ) ) ( not ( = ?auto_34482 ?auto_34486 ) ) ( AVAILABLE ?auto_34486 ) ( SURFACE-AT ?auto_34475 ?auto_34479 ) ( ON ?auto_34475 ?auto_34484 ) ( CLEAR ?auto_34475 ) ( not ( = ?auto_34476 ?auto_34484 ) ) ( not ( = ?auto_34477 ?auto_34484 ) ) ( not ( = ?auto_34475 ?auto_34484 ) ) ( not ( = ?auto_34480 ?auto_34484 ) ) ( not ( = ?auto_34485 ?auto_34484 ) ) ( not ( = ?auto_34474 ?auto_34484 ) ) ( TRUCK-AT ?auto_34478 ?auto_34490 ) ( SURFACE-AT ?auto_34489 ?auto_34490 ) ( CLEAR ?auto_34489 ) ( LIFTING ?auto_34487 ?auto_34474 ) ( IS-CRATE ?auto_34474 ) ( not ( = ?auto_34489 ?auto_34474 ) ) ( not ( = ?auto_34476 ?auto_34489 ) ) ( not ( = ?auto_34477 ?auto_34489 ) ) ( not ( = ?auto_34475 ?auto_34489 ) ) ( not ( = ?auto_34480 ?auto_34489 ) ) ( not ( = ?auto_34485 ?auto_34489 ) ) ( not ( = ?auto_34484 ?auto_34489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34475 ?auto_34476 ?auto_34477 )
      ( MAKE-3CRATE-VERIFY ?auto_34474 ?auto_34475 ?auto_34476 ?auto_34477 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34491 - SURFACE
      ?auto_34492 - SURFACE
      ?auto_34493 - SURFACE
      ?auto_34494 - SURFACE
      ?auto_34495 - SURFACE
    )
    :vars
    (
      ?auto_34505 - HOIST
      ?auto_34507 - PLACE
      ?auto_34501 - PLACE
      ?auto_34506 - HOIST
      ?auto_34498 - SURFACE
      ?auto_34499 - PLACE
      ?auto_34500 - HOIST
      ?auto_34503 - SURFACE
      ?auto_34497 - PLACE
      ?auto_34504 - HOIST
      ?auto_34502 - SURFACE
      ?auto_34496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34505 ?auto_34507 ) ( IS-CRATE ?auto_34495 ) ( not ( = ?auto_34494 ?auto_34495 ) ) ( not ( = ?auto_34493 ?auto_34494 ) ) ( not ( = ?auto_34493 ?auto_34495 ) ) ( not ( = ?auto_34501 ?auto_34507 ) ) ( HOIST-AT ?auto_34506 ?auto_34501 ) ( not ( = ?auto_34505 ?auto_34506 ) ) ( AVAILABLE ?auto_34506 ) ( SURFACE-AT ?auto_34495 ?auto_34501 ) ( ON ?auto_34495 ?auto_34498 ) ( CLEAR ?auto_34495 ) ( not ( = ?auto_34494 ?auto_34498 ) ) ( not ( = ?auto_34495 ?auto_34498 ) ) ( not ( = ?auto_34493 ?auto_34498 ) ) ( IS-CRATE ?auto_34494 ) ( not ( = ?auto_34499 ?auto_34507 ) ) ( not ( = ?auto_34501 ?auto_34499 ) ) ( HOIST-AT ?auto_34500 ?auto_34499 ) ( not ( = ?auto_34505 ?auto_34500 ) ) ( not ( = ?auto_34506 ?auto_34500 ) ) ( AVAILABLE ?auto_34500 ) ( SURFACE-AT ?auto_34494 ?auto_34499 ) ( ON ?auto_34494 ?auto_34503 ) ( CLEAR ?auto_34494 ) ( not ( = ?auto_34494 ?auto_34503 ) ) ( not ( = ?auto_34495 ?auto_34503 ) ) ( not ( = ?auto_34493 ?auto_34503 ) ) ( not ( = ?auto_34498 ?auto_34503 ) ) ( IS-CRATE ?auto_34493 ) ( not ( = ?auto_34492 ?auto_34493 ) ) ( not ( = ?auto_34494 ?auto_34492 ) ) ( not ( = ?auto_34495 ?auto_34492 ) ) ( not ( = ?auto_34498 ?auto_34492 ) ) ( not ( = ?auto_34503 ?auto_34492 ) ) ( not ( = ?auto_34497 ?auto_34507 ) ) ( not ( = ?auto_34501 ?auto_34497 ) ) ( not ( = ?auto_34499 ?auto_34497 ) ) ( HOIST-AT ?auto_34504 ?auto_34497 ) ( not ( = ?auto_34505 ?auto_34504 ) ) ( not ( = ?auto_34506 ?auto_34504 ) ) ( not ( = ?auto_34500 ?auto_34504 ) ) ( AVAILABLE ?auto_34504 ) ( SURFACE-AT ?auto_34493 ?auto_34497 ) ( ON ?auto_34493 ?auto_34502 ) ( CLEAR ?auto_34493 ) ( not ( = ?auto_34494 ?auto_34502 ) ) ( not ( = ?auto_34495 ?auto_34502 ) ) ( not ( = ?auto_34493 ?auto_34502 ) ) ( not ( = ?auto_34498 ?auto_34502 ) ) ( not ( = ?auto_34503 ?auto_34502 ) ) ( not ( = ?auto_34492 ?auto_34502 ) ) ( TRUCK-AT ?auto_34496 ?auto_34507 ) ( SURFACE-AT ?auto_34491 ?auto_34507 ) ( CLEAR ?auto_34491 ) ( LIFTING ?auto_34505 ?auto_34492 ) ( IS-CRATE ?auto_34492 ) ( not ( = ?auto_34491 ?auto_34492 ) ) ( not ( = ?auto_34494 ?auto_34491 ) ) ( not ( = ?auto_34495 ?auto_34491 ) ) ( not ( = ?auto_34493 ?auto_34491 ) ) ( not ( = ?auto_34498 ?auto_34491 ) ) ( not ( = ?auto_34503 ?auto_34491 ) ) ( not ( = ?auto_34502 ?auto_34491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34493 ?auto_34494 ?auto_34495 )
      ( MAKE-4CRATE-VERIFY ?auto_34491 ?auto_34492 ?auto_34493 ?auto_34494 ?auto_34495 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34508 - SURFACE
      ?auto_34509 - SURFACE
    )
    :vars
    (
      ?auto_34520 - HOIST
      ?auto_34524 - PLACE
      ?auto_34514 - SURFACE
      ?auto_34516 - PLACE
      ?auto_34521 - HOIST
      ?auto_34512 - SURFACE
      ?auto_34513 - PLACE
      ?auto_34515 - HOIST
      ?auto_34518 - SURFACE
      ?auto_34522 - SURFACE
      ?auto_34511 - PLACE
      ?auto_34519 - HOIST
      ?auto_34517 - SURFACE
      ?auto_34510 - TRUCK
      ?auto_34523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34520 ?auto_34524 ) ( IS-CRATE ?auto_34509 ) ( not ( = ?auto_34508 ?auto_34509 ) ) ( not ( = ?auto_34514 ?auto_34508 ) ) ( not ( = ?auto_34514 ?auto_34509 ) ) ( not ( = ?auto_34516 ?auto_34524 ) ) ( HOIST-AT ?auto_34521 ?auto_34516 ) ( not ( = ?auto_34520 ?auto_34521 ) ) ( AVAILABLE ?auto_34521 ) ( SURFACE-AT ?auto_34509 ?auto_34516 ) ( ON ?auto_34509 ?auto_34512 ) ( CLEAR ?auto_34509 ) ( not ( = ?auto_34508 ?auto_34512 ) ) ( not ( = ?auto_34509 ?auto_34512 ) ) ( not ( = ?auto_34514 ?auto_34512 ) ) ( IS-CRATE ?auto_34508 ) ( not ( = ?auto_34513 ?auto_34524 ) ) ( not ( = ?auto_34516 ?auto_34513 ) ) ( HOIST-AT ?auto_34515 ?auto_34513 ) ( not ( = ?auto_34520 ?auto_34515 ) ) ( not ( = ?auto_34521 ?auto_34515 ) ) ( AVAILABLE ?auto_34515 ) ( SURFACE-AT ?auto_34508 ?auto_34513 ) ( ON ?auto_34508 ?auto_34518 ) ( CLEAR ?auto_34508 ) ( not ( = ?auto_34508 ?auto_34518 ) ) ( not ( = ?auto_34509 ?auto_34518 ) ) ( not ( = ?auto_34514 ?auto_34518 ) ) ( not ( = ?auto_34512 ?auto_34518 ) ) ( IS-CRATE ?auto_34514 ) ( not ( = ?auto_34522 ?auto_34514 ) ) ( not ( = ?auto_34508 ?auto_34522 ) ) ( not ( = ?auto_34509 ?auto_34522 ) ) ( not ( = ?auto_34512 ?auto_34522 ) ) ( not ( = ?auto_34518 ?auto_34522 ) ) ( not ( = ?auto_34511 ?auto_34524 ) ) ( not ( = ?auto_34516 ?auto_34511 ) ) ( not ( = ?auto_34513 ?auto_34511 ) ) ( HOIST-AT ?auto_34519 ?auto_34511 ) ( not ( = ?auto_34520 ?auto_34519 ) ) ( not ( = ?auto_34521 ?auto_34519 ) ) ( not ( = ?auto_34515 ?auto_34519 ) ) ( AVAILABLE ?auto_34519 ) ( SURFACE-AT ?auto_34514 ?auto_34511 ) ( ON ?auto_34514 ?auto_34517 ) ( CLEAR ?auto_34514 ) ( not ( = ?auto_34508 ?auto_34517 ) ) ( not ( = ?auto_34509 ?auto_34517 ) ) ( not ( = ?auto_34514 ?auto_34517 ) ) ( not ( = ?auto_34512 ?auto_34517 ) ) ( not ( = ?auto_34518 ?auto_34517 ) ) ( not ( = ?auto_34522 ?auto_34517 ) ) ( TRUCK-AT ?auto_34510 ?auto_34524 ) ( SURFACE-AT ?auto_34523 ?auto_34524 ) ( CLEAR ?auto_34523 ) ( IS-CRATE ?auto_34522 ) ( not ( = ?auto_34523 ?auto_34522 ) ) ( not ( = ?auto_34508 ?auto_34523 ) ) ( not ( = ?auto_34509 ?auto_34523 ) ) ( not ( = ?auto_34514 ?auto_34523 ) ) ( not ( = ?auto_34512 ?auto_34523 ) ) ( not ( = ?auto_34518 ?auto_34523 ) ) ( not ( = ?auto_34517 ?auto_34523 ) ) ( AVAILABLE ?auto_34520 ) ( IN ?auto_34522 ?auto_34510 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34520 ?auto_34522 ?auto_34510 ?auto_34524 )
      ( MAKE-2CRATE ?auto_34514 ?auto_34508 ?auto_34509 )
      ( MAKE-1CRATE-VERIFY ?auto_34508 ?auto_34509 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34525 - SURFACE
      ?auto_34526 - SURFACE
      ?auto_34527 - SURFACE
    )
    :vars
    (
      ?auto_34532 - HOIST
      ?auto_34533 - PLACE
      ?auto_34534 - PLACE
      ?auto_34528 - HOIST
      ?auto_34537 - SURFACE
      ?auto_34540 - PLACE
      ?auto_34538 - HOIST
      ?auto_34530 - SURFACE
      ?auto_34539 - SURFACE
      ?auto_34529 - PLACE
      ?auto_34536 - HOIST
      ?auto_34535 - SURFACE
      ?auto_34541 - TRUCK
      ?auto_34531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34532 ?auto_34533 ) ( IS-CRATE ?auto_34527 ) ( not ( = ?auto_34526 ?auto_34527 ) ) ( not ( = ?auto_34525 ?auto_34526 ) ) ( not ( = ?auto_34525 ?auto_34527 ) ) ( not ( = ?auto_34534 ?auto_34533 ) ) ( HOIST-AT ?auto_34528 ?auto_34534 ) ( not ( = ?auto_34532 ?auto_34528 ) ) ( AVAILABLE ?auto_34528 ) ( SURFACE-AT ?auto_34527 ?auto_34534 ) ( ON ?auto_34527 ?auto_34537 ) ( CLEAR ?auto_34527 ) ( not ( = ?auto_34526 ?auto_34537 ) ) ( not ( = ?auto_34527 ?auto_34537 ) ) ( not ( = ?auto_34525 ?auto_34537 ) ) ( IS-CRATE ?auto_34526 ) ( not ( = ?auto_34540 ?auto_34533 ) ) ( not ( = ?auto_34534 ?auto_34540 ) ) ( HOIST-AT ?auto_34538 ?auto_34540 ) ( not ( = ?auto_34532 ?auto_34538 ) ) ( not ( = ?auto_34528 ?auto_34538 ) ) ( AVAILABLE ?auto_34538 ) ( SURFACE-AT ?auto_34526 ?auto_34540 ) ( ON ?auto_34526 ?auto_34530 ) ( CLEAR ?auto_34526 ) ( not ( = ?auto_34526 ?auto_34530 ) ) ( not ( = ?auto_34527 ?auto_34530 ) ) ( not ( = ?auto_34525 ?auto_34530 ) ) ( not ( = ?auto_34537 ?auto_34530 ) ) ( IS-CRATE ?auto_34525 ) ( not ( = ?auto_34539 ?auto_34525 ) ) ( not ( = ?auto_34526 ?auto_34539 ) ) ( not ( = ?auto_34527 ?auto_34539 ) ) ( not ( = ?auto_34537 ?auto_34539 ) ) ( not ( = ?auto_34530 ?auto_34539 ) ) ( not ( = ?auto_34529 ?auto_34533 ) ) ( not ( = ?auto_34534 ?auto_34529 ) ) ( not ( = ?auto_34540 ?auto_34529 ) ) ( HOIST-AT ?auto_34536 ?auto_34529 ) ( not ( = ?auto_34532 ?auto_34536 ) ) ( not ( = ?auto_34528 ?auto_34536 ) ) ( not ( = ?auto_34538 ?auto_34536 ) ) ( AVAILABLE ?auto_34536 ) ( SURFACE-AT ?auto_34525 ?auto_34529 ) ( ON ?auto_34525 ?auto_34535 ) ( CLEAR ?auto_34525 ) ( not ( = ?auto_34526 ?auto_34535 ) ) ( not ( = ?auto_34527 ?auto_34535 ) ) ( not ( = ?auto_34525 ?auto_34535 ) ) ( not ( = ?auto_34537 ?auto_34535 ) ) ( not ( = ?auto_34530 ?auto_34535 ) ) ( not ( = ?auto_34539 ?auto_34535 ) ) ( TRUCK-AT ?auto_34541 ?auto_34533 ) ( SURFACE-AT ?auto_34531 ?auto_34533 ) ( CLEAR ?auto_34531 ) ( IS-CRATE ?auto_34539 ) ( not ( = ?auto_34531 ?auto_34539 ) ) ( not ( = ?auto_34526 ?auto_34531 ) ) ( not ( = ?auto_34527 ?auto_34531 ) ) ( not ( = ?auto_34525 ?auto_34531 ) ) ( not ( = ?auto_34537 ?auto_34531 ) ) ( not ( = ?auto_34530 ?auto_34531 ) ) ( not ( = ?auto_34535 ?auto_34531 ) ) ( AVAILABLE ?auto_34532 ) ( IN ?auto_34539 ?auto_34541 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34526 ?auto_34527 )
      ( MAKE-2CRATE-VERIFY ?auto_34525 ?auto_34526 ?auto_34527 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34542 - SURFACE
      ?auto_34543 - SURFACE
      ?auto_34544 - SURFACE
      ?auto_34545 - SURFACE
    )
    :vars
    (
      ?auto_34548 - HOIST
      ?auto_34549 - PLACE
      ?auto_34555 - PLACE
      ?auto_34547 - HOIST
      ?auto_34551 - SURFACE
      ?auto_34558 - PLACE
      ?auto_34550 - HOIST
      ?auto_34553 - SURFACE
      ?auto_34546 - PLACE
      ?auto_34556 - HOIST
      ?auto_34554 - SURFACE
      ?auto_34557 - TRUCK
      ?auto_34552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34548 ?auto_34549 ) ( IS-CRATE ?auto_34545 ) ( not ( = ?auto_34544 ?auto_34545 ) ) ( not ( = ?auto_34543 ?auto_34544 ) ) ( not ( = ?auto_34543 ?auto_34545 ) ) ( not ( = ?auto_34555 ?auto_34549 ) ) ( HOIST-AT ?auto_34547 ?auto_34555 ) ( not ( = ?auto_34548 ?auto_34547 ) ) ( AVAILABLE ?auto_34547 ) ( SURFACE-AT ?auto_34545 ?auto_34555 ) ( ON ?auto_34545 ?auto_34551 ) ( CLEAR ?auto_34545 ) ( not ( = ?auto_34544 ?auto_34551 ) ) ( not ( = ?auto_34545 ?auto_34551 ) ) ( not ( = ?auto_34543 ?auto_34551 ) ) ( IS-CRATE ?auto_34544 ) ( not ( = ?auto_34558 ?auto_34549 ) ) ( not ( = ?auto_34555 ?auto_34558 ) ) ( HOIST-AT ?auto_34550 ?auto_34558 ) ( not ( = ?auto_34548 ?auto_34550 ) ) ( not ( = ?auto_34547 ?auto_34550 ) ) ( AVAILABLE ?auto_34550 ) ( SURFACE-AT ?auto_34544 ?auto_34558 ) ( ON ?auto_34544 ?auto_34553 ) ( CLEAR ?auto_34544 ) ( not ( = ?auto_34544 ?auto_34553 ) ) ( not ( = ?auto_34545 ?auto_34553 ) ) ( not ( = ?auto_34543 ?auto_34553 ) ) ( not ( = ?auto_34551 ?auto_34553 ) ) ( IS-CRATE ?auto_34543 ) ( not ( = ?auto_34542 ?auto_34543 ) ) ( not ( = ?auto_34544 ?auto_34542 ) ) ( not ( = ?auto_34545 ?auto_34542 ) ) ( not ( = ?auto_34551 ?auto_34542 ) ) ( not ( = ?auto_34553 ?auto_34542 ) ) ( not ( = ?auto_34546 ?auto_34549 ) ) ( not ( = ?auto_34555 ?auto_34546 ) ) ( not ( = ?auto_34558 ?auto_34546 ) ) ( HOIST-AT ?auto_34556 ?auto_34546 ) ( not ( = ?auto_34548 ?auto_34556 ) ) ( not ( = ?auto_34547 ?auto_34556 ) ) ( not ( = ?auto_34550 ?auto_34556 ) ) ( AVAILABLE ?auto_34556 ) ( SURFACE-AT ?auto_34543 ?auto_34546 ) ( ON ?auto_34543 ?auto_34554 ) ( CLEAR ?auto_34543 ) ( not ( = ?auto_34544 ?auto_34554 ) ) ( not ( = ?auto_34545 ?auto_34554 ) ) ( not ( = ?auto_34543 ?auto_34554 ) ) ( not ( = ?auto_34551 ?auto_34554 ) ) ( not ( = ?auto_34553 ?auto_34554 ) ) ( not ( = ?auto_34542 ?auto_34554 ) ) ( TRUCK-AT ?auto_34557 ?auto_34549 ) ( SURFACE-AT ?auto_34552 ?auto_34549 ) ( CLEAR ?auto_34552 ) ( IS-CRATE ?auto_34542 ) ( not ( = ?auto_34552 ?auto_34542 ) ) ( not ( = ?auto_34544 ?auto_34552 ) ) ( not ( = ?auto_34545 ?auto_34552 ) ) ( not ( = ?auto_34543 ?auto_34552 ) ) ( not ( = ?auto_34551 ?auto_34552 ) ) ( not ( = ?auto_34553 ?auto_34552 ) ) ( not ( = ?auto_34554 ?auto_34552 ) ) ( AVAILABLE ?auto_34548 ) ( IN ?auto_34542 ?auto_34557 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34543 ?auto_34544 ?auto_34545 )
      ( MAKE-3CRATE-VERIFY ?auto_34542 ?auto_34543 ?auto_34544 ?auto_34545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34559 - SURFACE
      ?auto_34560 - SURFACE
      ?auto_34561 - SURFACE
      ?auto_34562 - SURFACE
      ?auto_34563 - SURFACE
    )
    :vars
    (
      ?auto_34566 - HOIST
      ?auto_34567 - PLACE
      ?auto_34572 - PLACE
      ?auto_34565 - HOIST
      ?auto_34569 - SURFACE
      ?auto_34575 - PLACE
      ?auto_34568 - HOIST
      ?auto_34570 - SURFACE
      ?auto_34564 - PLACE
      ?auto_34573 - HOIST
      ?auto_34571 - SURFACE
      ?auto_34574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34566 ?auto_34567 ) ( IS-CRATE ?auto_34563 ) ( not ( = ?auto_34562 ?auto_34563 ) ) ( not ( = ?auto_34561 ?auto_34562 ) ) ( not ( = ?auto_34561 ?auto_34563 ) ) ( not ( = ?auto_34572 ?auto_34567 ) ) ( HOIST-AT ?auto_34565 ?auto_34572 ) ( not ( = ?auto_34566 ?auto_34565 ) ) ( AVAILABLE ?auto_34565 ) ( SURFACE-AT ?auto_34563 ?auto_34572 ) ( ON ?auto_34563 ?auto_34569 ) ( CLEAR ?auto_34563 ) ( not ( = ?auto_34562 ?auto_34569 ) ) ( not ( = ?auto_34563 ?auto_34569 ) ) ( not ( = ?auto_34561 ?auto_34569 ) ) ( IS-CRATE ?auto_34562 ) ( not ( = ?auto_34575 ?auto_34567 ) ) ( not ( = ?auto_34572 ?auto_34575 ) ) ( HOIST-AT ?auto_34568 ?auto_34575 ) ( not ( = ?auto_34566 ?auto_34568 ) ) ( not ( = ?auto_34565 ?auto_34568 ) ) ( AVAILABLE ?auto_34568 ) ( SURFACE-AT ?auto_34562 ?auto_34575 ) ( ON ?auto_34562 ?auto_34570 ) ( CLEAR ?auto_34562 ) ( not ( = ?auto_34562 ?auto_34570 ) ) ( not ( = ?auto_34563 ?auto_34570 ) ) ( not ( = ?auto_34561 ?auto_34570 ) ) ( not ( = ?auto_34569 ?auto_34570 ) ) ( IS-CRATE ?auto_34561 ) ( not ( = ?auto_34560 ?auto_34561 ) ) ( not ( = ?auto_34562 ?auto_34560 ) ) ( not ( = ?auto_34563 ?auto_34560 ) ) ( not ( = ?auto_34569 ?auto_34560 ) ) ( not ( = ?auto_34570 ?auto_34560 ) ) ( not ( = ?auto_34564 ?auto_34567 ) ) ( not ( = ?auto_34572 ?auto_34564 ) ) ( not ( = ?auto_34575 ?auto_34564 ) ) ( HOIST-AT ?auto_34573 ?auto_34564 ) ( not ( = ?auto_34566 ?auto_34573 ) ) ( not ( = ?auto_34565 ?auto_34573 ) ) ( not ( = ?auto_34568 ?auto_34573 ) ) ( AVAILABLE ?auto_34573 ) ( SURFACE-AT ?auto_34561 ?auto_34564 ) ( ON ?auto_34561 ?auto_34571 ) ( CLEAR ?auto_34561 ) ( not ( = ?auto_34562 ?auto_34571 ) ) ( not ( = ?auto_34563 ?auto_34571 ) ) ( not ( = ?auto_34561 ?auto_34571 ) ) ( not ( = ?auto_34569 ?auto_34571 ) ) ( not ( = ?auto_34570 ?auto_34571 ) ) ( not ( = ?auto_34560 ?auto_34571 ) ) ( TRUCK-AT ?auto_34574 ?auto_34567 ) ( SURFACE-AT ?auto_34559 ?auto_34567 ) ( CLEAR ?auto_34559 ) ( IS-CRATE ?auto_34560 ) ( not ( = ?auto_34559 ?auto_34560 ) ) ( not ( = ?auto_34562 ?auto_34559 ) ) ( not ( = ?auto_34563 ?auto_34559 ) ) ( not ( = ?auto_34561 ?auto_34559 ) ) ( not ( = ?auto_34569 ?auto_34559 ) ) ( not ( = ?auto_34570 ?auto_34559 ) ) ( not ( = ?auto_34571 ?auto_34559 ) ) ( AVAILABLE ?auto_34566 ) ( IN ?auto_34560 ?auto_34574 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34561 ?auto_34562 ?auto_34563 )
      ( MAKE-4CRATE-VERIFY ?auto_34559 ?auto_34560 ?auto_34561 ?auto_34562 ?auto_34563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34576 - SURFACE
      ?auto_34577 - SURFACE
    )
    :vars
    (
      ?auto_34580 - HOIST
      ?auto_34581 - PLACE
      ?auto_34583 - SURFACE
      ?auto_34588 - PLACE
      ?auto_34579 - HOIST
      ?auto_34584 - SURFACE
      ?auto_34591 - PLACE
      ?auto_34582 - HOIST
      ?auto_34586 - SURFACE
      ?auto_34592 - SURFACE
      ?auto_34578 - PLACE
      ?auto_34589 - HOIST
      ?auto_34587 - SURFACE
      ?auto_34585 - SURFACE
      ?auto_34590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34580 ?auto_34581 ) ( IS-CRATE ?auto_34577 ) ( not ( = ?auto_34576 ?auto_34577 ) ) ( not ( = ?auto_34583 ?auto_34576 ) ) ( not ( = ?auto_34583 ?auto_34577 ) ) ( not ( = ?auto_34588 ?auto_34581 ) ) ( HOIST-AT ?auto_34579 ?auto_34588 ) ( not ( = ?auto_34580 ?auto_34579 ) ) ( AVAILABLE ?auto_34579 ) ( SURFACE-AT ?auto_34577 ?auto_34588 ) ( ON ?auto_34577 ?auto_34584 ) ( CLEAR ?auto_34577 ) ( not ( = ?auto_34576 ?auto_34584 ) ) ( not ( = ?auto_34577 ?auto_34584 ) ) ( not ( = ?auto_34583 ?auto_34584 ) ) ( IS-CRATE ?auto_34576 ) ( not ( = ?auto_34591 ?auto_34581 ) ) ( not ( = ?auto_34588 ?auto_34591 ) ) ( HOIST-AT ?auto_34582 ?auto_34591 ) ( not ( = ?auto_34580 ?auto_34582 ) ) ( not ( = ?auto_34579 ?auto_34582 ) ) ( AVAILABLE ?auto_34582 ) ( SURFACE-AT ?auto_34576 ?auto_34591 ) ( ON ?auto_34576 ?auto_34586 ) ( CLEAR ?auto_34576 ) ( not ( = ?auto_34576 ?auto_34586 ) ) ( not ( = ?auto_34577 ?auto_34586 ) ) ( not ( = ?auto_34583 ?auto_34586 ) ) ( not ( = ?auto_34584 ?auto_34586 ) ) ( IS-CRATE ?auto_34583 ) ( not ( = ?auto_34592 ?auto_34583 ) ) ( not ( = ?auto_34576 ?auto_34592 ) ) ( not ( = ?auto_34577 ?auto_34592 ) ) ( not ( = ?auto_34584 ?auto_34592 ) ) ( not ( = ?auto_34586 ?auto_34592 ) ) ( not ( = ?auto_34578 ?auto_34581 ) ) ( not ( = ?auto_34588 ?auto_34578 ) ) ( not ( = ?auto_34591 ?auto_34578 ) ) ( HOIST-AT ?auto_34589 ?auto_34578 ) ( not ( = ?auto_34580 ?auto_34589 ) ) ( not ( = ?auto_34579 ?auto_34589 ) ) ( not ( = ?auto_34582 ?auto_34589 ) ) ( AVAILABLE ?auto_34589 ) ( SURFACE-AT ?auto_34583 ?auto_34578 ) ( ON ?auto_34583 ?auto_34587 ) ( CLEAR ?auto_34583 ) ( not ( = ?auto_34576 ?auto_34587 ) ) ( not ( = ?auto_34577 ?auto_34587 ) ) ( not ( = ?auto_34583 ?auto_34587 ) ) ( not ( = ?auto_34584 ?auto_34587 ) ) ( not ( = ?auto_34586 ?auto_34587 ) ) ( not ( = ?auto_34592 ?auto_34587 ) ) ( SURFACE-AT ?auto_34585 ?auto_34581 ) ( CLEAR ?auto_34585 ) ( IS-CRATE ?auto_34592 ) ( not ( = ?auto_34585 ?auto_34592 ) ) ( not ( = ?auto_34576 ?auto_34585 ) ) ( not ( = ?auto_34577 ?auto_34585 ) ) ( not ( = ?auto_34583 ?auto_34585 ) ) ( not ( = ?auto_34584 ?auto_34585 ) ) ( not ( = ?auto_34586 ?auto_34585 ) ) ( not ( = ?auto_34587 ?auto_34585 ) ) ( AVAILABLE ?auto_34580 ) ( IN ?auto_34592 ?auto_34590 ) ( TRUCK-AT ?auto_34590 ?auto_34578 ) )
    :subtasks
    ( ( !DRIVE ?auto_34590 ?auto_34578 ?auto_34581 )
      ( MAKE-2CRATE ?auto_34583 ?auto_34576 ?auto_34577 )
      ( MAKE-1CRATE-VERIFY ?auto_34576 ?auto_34577 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34593 - SURFACE
      ?auto_34594 - SURFACE
      ?auto_34595 - SURFACE
    )
    :vars
    (
      ?auto_34602 - HOIST
      ?auto_34605 - PLACE
      ?auto_34608 - PLACE
      ?auto_34600 - HOIST
      ?auto_34596 - SURFACE
      ?auto_34606 - PLACE
      ?auto_34597 - HOIST
      ?auto_34598 - SURFACE
      ?auto_34604 - SURFACE
      ?auto_34607 - PLACE
      ?auto_34599 - HOIST
      ?auto_34609 - SURFACE
      ?auto_34603 - SURFACE
      ?auto_34601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34602 ?auto_34605 ) ( IS-CRATE ?auto_34595 ) ( not ( = ?auto_34594 ?auto_34595 ) ) ( not ( = ?auto_34593 ?auto_34594 ) ) ( not ( = ?auto_34593 ?auto_34595 ) ) ( not ( = ?auto_34608 ?auto_34605 ) ) ( HOIST-AT ?auto_34600 ?auto_34608 ) ( not ( = ?auto_34602 ?auto_34600 ) ) ( AVAILABLE ?auto_34600 ) ( SURFACE-AT ?auto_34595 ?auto_34608 ) ( ON ?auto_34595 ?auto_34596 ) ( CLEAR ?auto_34595 ) ( not ( = ?auto_34594 ?auto_34596 ) ) ( not ( = ?auto_34595 ?auto_34596 ) ) ( not ( = ?auto_34593 ?auto_34596 ) ) ( IS-CRATE ?auto_34594 ) ( not ( = ?auto_34606 ?auto_34605 ) ) ( not ( = ?auto_34608 ?auto_34606 ) ) ( HOIST-AT ?auto_34597 ?auto_34606 ) ( not ( = ?auto_34602 ?auto_34597 ) ) ( not ( = ?auto_34600 ?auto_34597 ) ) ( AVAILABLE ?auto_34597 ) ( SURFACE-AT ?auto_34594 ?auto_34606 ) ( ON ?auto_34594 ?auto_34598 ) ( CLEAR ?auto_34594 ) ( not ( = ?auto_34594 ?auto_34598 ) ) ( not ( = ?auto_34595 ?auto_34598 ) ) ( not ( = ?auto_34593 ?auto_34598 ) ) ( not ( = ?auto_34596 ?auto_34598 ) ) ( IS-CRATE ?auto_34593 ) ( not ( = ?auto_34604 ?auto_34593 ) ) ( not ( = ?auto_34594 ?auto_34604 ) ) ( not ( = ?auto_34595 ?auto_34604 ) ) ( not ( = ?auto_34596 ?auto_34604 ) ) ( not ( = ?auto_34598 ?auto_34604 ) ) ( not ( = ?auto_34607 ?auto_34605 ) ) ( not ( = ?auto_34608 ?auto_34607 ) ) ( not ( = ?auto_34606 ?auto_34607 ) ) ( HOIST-AT ?auto_34599 ?auto_34607 ) ( not ( = ?auto_34602 ?auto_34599 ) ) ( not ( = ?auto_34600 ?auto_34599 ) ) ( not ( = ?auto_34597 ?auto_34599 ) ) ( AVAILABLE ?auto_34599 ) ( SURFACE-AT ?auto_34593 ?auto_34607 ) ( ON ?auto_34593 ?auto_34609 ) ( CLEAR ?auto_34593 ) ( not ( = ?auto_34594 ?auto_34609 ) ) ( not ( = ?auto_34595 ?auto_34609 ) ) ( not ( = ?auto_34593 ?auto_34609 ) ) ( not ( = ?auto_34596 ?auto_34609 ) ) ( not ( = ?auto_34598 ?auto_34609 ) ) ( not ( = ?auto_34604 ?auto_34609 ) ) ( SURFACE-AT ?auto_34603 ?auto_34605 ) ( CLEAR ?auto_34603 ) ( IS-CRATE ?auto_34604 ) ( not ( = ?auto_34603 ?auto_34604 ) ) ( not ( = ?auto_34594 ?auto_34603 ) ) ( not ( = ?auto_34595 ?auto_34603 ) ) ( not ( = ?auto_34593 ?auto_34603 ) ) ( not ( = ?auto_34596 ?auto_34603 ) ) ( not ( = ?auto_34598 ?auto_34603 ) ) ( not ( = ?auto_34609 ?auto_34603 ) ) ( AVAILABLE ?auto_34602 ) ( IN ?auto_34604 ?auto_34601 ) ( TRUCK-AT ?auto_34601 ?auto_34607 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34594 ?auto_34595 )
      ( MAKE-2CRATE-VERIFY ?auto_34593 ?auto_34594 ?auto_34595 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34610 - SURFACE
      ?auto_34611 - SURFACE
      ?auto_34612 - SURFACE
      ?auto_34613 - SURFACE
    )
    :vars
    (
      ?auto_34616 - HOIST
      ?auto_34615 - PLACE
      ?auto_34624 - PLACE
      ?auto_34620 - HOIST
      ?auto_34621 - SURFACE
      ?auto_34623 - PLACE
      ?auto_34614 - HOIST
      ?auto_34619 - SURFACE
      ?auto_34617 - PLACE
      ?auto_34622 - HOIST
      ?auto_34625 - SURFACE
      ?auto_34626 - SURFACE
      ?auto_34618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34616 ?auto_34615 ) ( IS-CRATE ?auto_34613 ) ( not ( = ?auto_34612 ?auto_34613 ) ) ( not ( = ?auto_34611 ?auto_34612 ) ) ( not ( = ?auto_34611 ?auto_34613 ) ) ( not ( = ?auto_34624 ?auto_34615 ) ) ( HOIST-AT ?auto_34620 ?auto_34624 ) ( not ( = ?auto_34616 ?auto_34620 ) ) ( AVAILABLE ?auto_34620 ) ( SURFACE-AT ?auto_34613 ?auto_34624 ) ( ON ?auto_34613 ?auto_34621 ) ( CLEAR ?auto_34613 ) ( not ( = ?auto_34612 ?auto_34621 ) ) ( not ( = ?auto_34613 ?auto_34621 ) ) ( not ( = ?auto_34611 ?auto_34621 ) ) ( IS-CRATE ?auto_34612 ) ( not ( = ?auto_34623 ?auto_34615 ) ) ( not ( = ?auto_34624 ?auto_34623 ) ) ( HOIST-AT ?auto_34614 ?auto_34623 ) ( not ( = ?auto_34616 ?auto_34614 ) ) ( not ( = ?auto_34620 ?auto_34614 ) ) ( AVAILABLE ?auto_34614 ) ( SURFACE-AT ?auto_34612 ?auto_34623 ) ( ON ?auto_34612 ?auto_34619 ) ( CLEAR ?auto_34612 ) ( not ( = ?auto_34612 ?auto_34619 ) ) ( not ( = ?auto_34613 ?auto_34619 ) ) ( not ( = ?auto_34611 ?auto_34619 ) ) ( not ( = ?auto_34621 ?auto_34619 ) ) ( IS-CRATE ?auto_34611 ) ( not ( = ?auto_34610 ?auto_34611 ) ) ( not ( = ?auto_34612 ?auto_34610 ) ) ( not ( = ?auto_34613 ?auto_34610 ) ) ( not ( = ?auto_34621 ?auto_34610 ) ) ( not ( = ?auto_34619 ?auto_34610 ) ) ( not ( = ?auto_34617 ?auto_34615 ) ) ( not ( = ?auto_34624 ?auto_34617 ) ) ( not ( = ?auto_34623 ?auto_34617 ) ) ( HOIST-AT ?auto_34622 ?auto_34617 ) ( not ( = ?auto_34616 ?auto_34622 ) ) ( not ( = ?auto_34620 ?auto_34622 ) ) ( not ( = ?auto_34614 ?auto_34622 ) ) ( AVAILABLE ?auto_34622 ) ( SURFACE-AT ?auto_34611 ?auto_34617 ) ( ON ?auto_34611 ?auto_34625 ) ( CLEAR ?auto_34611 ) ( not ( = ?auto_34612 ?auto_34625 ) ) ( not ( = ?auto_34613 ?auto_34625 ) ) ( not ( = ?auto_34611 ?auto_34625 ) ) ( not ( = ?auto_34621 ?auto_34625 ) ) ( not ( = ?auto_34619 ?auto_34625 ) ) ( not ( = ?auto_34610 ?auto_34625 ) ) ( SURFACE-AT ?auto_34626 ?auto_34615 ) ( CLEAR ?auto_34626 ) ( IS-CRATE ?auto_34610 ) ( not ( = ?auto_34626 ?auto_34610 ) ) ( not ( = ?auto_34612 ?auto_34626 ) ) ( not ( = ?auto_34613 ?auto_34626 ) ) ( not ( = ?auto_34611 ?auto_34626 ) ) ( not ( = ?auto_34621 ?auto_34626 ) ) ( not ( = ?auto_34619 ?auto_34626 ) ) ( not ( = ?auto_34625 ?auto_34626 ) ) ( AVAILABLE ?auto_34616 ) ( IN ?auto_34610 ?auto_34618 ) ( TRUCK-AT ?auto_34618 ?auto_34617 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34611 ?auto_34612 ?auto_34613 )
      ( MAKE-3CRATE-VERIFY ?auto_34610 ?auto_34611 ?auto_34612 ?auto_34613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34627 - SURFACE
      ?auto_34628 - SURFACE
      ?auto_34629 - SURFACE
      ?auto_34630 - SURFACE
      ?auto_34631 - SURFACE
    )
    :vars
    (
      ?auto_34634 - HOIST
      ?auto_34633 - PLACE
      ?auto_34642 - PLACE
      ?auto_34638 - HOIST
      ?auto_34639 - SURFACE
      ?auto_34641 - PLACE
      ?auto_34632 - HOIST
      ?auto_34637 - SURFACE
      ?auto_34635 - PLACE
      ?auto_34640 - HOIST
      ?auto_34643 - SURFACE
      ?auto_34636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34634 ?auto_34633 ) ( IS-CRATE ?auto_34631 ) ( not ( = ?auto_34630 ?auto_34631 ) ) ( not ( = ?auto_34629 ?auto_34630 ) ) ( not ( = ?auto_34629 ?auto_34631 ) ) ( not ( = ?auto_34642 ?auto_34633 ) ) ( HOIST-AT ?auto_34638 ?auto_34642 ) ( not ( = ?auto_34634 ?auto_34638 ) ) ( AVAILABLE ?auto_34638 ) ( SURFACE-AT ?auto_34631 ?auto_34642 ) ( ON ?auto_34631 ?auto_34639 ) ( CLEAR ?auto_34631 ) ( not ( = ?auto_34630 ?auto_34639 ) ) ( not ( = ?auto_34631 ?auto_34639 ) ) ( not ( = ?auto_34629 ?auto_34639 ) ) ( IS-CRATE ?auto_34630 ) ( not ( = ?auto_34641 ?auto_34633 ) ) ( not ( = ?auto_34642 ?auto_34641 ) ) ( HOIST-AT ?auto_34632 ?auto_34641 ) ( not ( = ?auto_34634 ?auto_34632 ) ) ( not ( = ?auto_34638 ?auto_34632 ) ) ( AVAILABLE ?auto_34632 ) ( SURFACE-AT ?auto_34630 ?auto_34641 ) ( ON ?auto_34630 ?auto_34637 ) ( CLEAR ?auto_34630 ) ( not ( = ?auto_34630 ?auto_34637 ) ) ( not ( = ?auto_34631 ?auto_34637 ) ) ( not ( = ?auto_34629 ?auto_34637 ) ) ( not ( = ?auto_34639 ?auto_34637 ) ) ( IS-CRATE ?auto_34629 ) ( not ( = ?auto_34628 ?auto_34629 ) ) ( not ( = ?auto_34630 ?auto_34628 ) ) ( not ( = ?auto_34631 ?auto_34628 ) ) ( not ( = ?auto_34639 ?auto_34628 ) ) ( not ( = ?auto_34637 ?auto_34628 ) ) ( not ( = ?auto_34635 ?auto_34633 ) ) ( not ( = ?auto_34642 ?auto_34635 ) ) ( not ( = ?auto_34641 ?auto_34635 ) ) ( HOIST-AT ?auto_34640 ?auto_34635 ) ( not ( = ?auto_34634 ?auto_34640 ) ) ( not ( = ?auto_34638 ?auto_34640 ) ) ( not ( = ?auto_34632 ?auto_34640 ) ) ( AVAILABLE ?auto_34640 ) ( SURFACE-AT ?auto_34629 ?auto_34635 ) ( ON ?auto_34629 ?auto_34643 ) ( CLEAR ?auto_34629 ) ( not ( = ?auto_34630 ?auto_34643 ) ) ( not ( = ?auto_34631 ?auto_34643 ) ) ( not ( = ?auto_34629 ?auto_34643 ) ) ( not ( = ?auto_34639 ?auto_34643 ) ) ( not ( = ?auto_34637 ?auto_34643 ) ) ( not ( = ?auto_34628 ?auto_34643 ) ) ( SURFACE-AT ?auto_34627 ?auto_34633 ) ( CLEAR ?auto_34627 ) ( IS-CRATE ?auto_34628 ) ( not ( = ?auto_34627 ?auto_34628 ) ) ( not ( = ?auto_34630 ?auto_34627 ) ) ( not ( = ?auto_34631 ?auto_34627 ) ) ( not ( = ?auto_34629 ?auto_34627 ) ) ( not ( = ?auto_34639 ?auto_34627 ) ) ( not ( = ?auto_34637 ?auto_34627 ) ) ( not ( = ?auto_34643 ?auto_34627 ) ) ( AVAILABLE ?auto_34634 ) ( IN ?auto_34628 ?auto_34636 ) ( TRUCK-AT ?auto_34636 ?auto_34635 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34629 ?auto_34630 ?auto_34631 )
      ( MAKE-4CRATE-VERIFY ?auto_34627 ?auto_34628 ?auto_34629 ?auto_34630 ?auto_34631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34644 - SURFACE
      ?auto_34645 - SURFACE
    )
    :vars
    (
      ?auto_34649 - HOIST
      ?auto_34648 - PLACE
      ?auto_34656 - SURFACE
      ?auto_34658 - PLACE
      ?auto_34653 - HOIST
      ?auto_34654 - SURFACE
      ?auto_34657 - PLACE
      ?auto_34646 - HOIST
      ?auto_34652 - SURFACE
      ?auto_34647 - SURFACE
      ?auto_34650 - PLACE
      ?auto_34655 - HOIST
      ?auto_34659 - SURFACE
      ?auto_34660 - SURFACE
      ?auto_34651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34649 ?auto_34648 ) ( IS-CRATE ?auto_34645 ) ( not ( = ?auto_34644 ?auto_34645 ) ) ( not ( = ?auto_34656 ?auto_34644 ) ) ( not ( = ?auto_34656 ?auto_34645 ) ) ( not ( = ?auto_34658 ?auto_34648 ) ) ( HOIST-AT ?auto_34653 ?auto_34658 ) ( not ( = ?auto_34649 ?auto_34653 ) ) ( AVAILABLE ?auto_34653 ) ( SURFACE-AT ?auto_34645 ?auto_34658 ) ( ON ?auto_34645 ?auto_34654 ) ( CLEAR ?auto_34645 ) ( not ( = ?auto_34644 ?auto_34654 ) ) ( not ( = ?auto_34645 ?auto_34654 ) ) ( not ( = ?auto_34656 ?auto_34654 ) ) ( IS-CRATE ?auto_34644 ) ( not ( = ?auto_34657 ?auto_34648 ) ) ( not ( = ?auto_34658 ?auto_34657 ) ) ( HOIST-AT ?auto_34646 ?auto_34657 ) ( not ( = ?auto_34649 ?auto_34646 ) ) ( not ( = ?auto_34653 ?auto_34646 ) ) ( AVAILABLE ?auto_34646 ) ( SURFACE-AT ?auto_34644 ?auto_34657 ) ( ON ?auto_34644 ?auto_34652 ) ( CLEAR ?auto_34644 ) ( not ( = ?auto_34644 ?auto_34652 ) ) ( not ( = ?auto_34645 ?auto_34652 ) ) ( not ( = ?auto_34656 ?auto_34652 ) ) ( not ( = ?auto_34654 ?auto_34652 ) ) ( IS-CRATE ?auto_34656 ) ( not ( = ?auto_34647 ?auto_34656 ) ) ( not ( = ?auto_34644 ?auto_34647 ) ) ( not ( = ?auto_34645 ?auto_34647 ) ) ( not ( = ?auto_34654 ?auto_34647 ) ) ( not ( = ?auto_34652 ?auto_34647 ) ) ( not ( = ?auto_34650 ?auto_34648 ) ) ( not ( = ?auto_34658 ?auto_34650 ) ) ( not ( = ?auto_34657 ?auto_34650 ) ) ( HOIST-AT ?auto_34655 ?auto_34650 ) ( not ( = ?auto_34649 ?auto_34655 ) ) ( not ( = ?auto_34653 ?auto_34655 ) ) ( not ( = ?auto_34646 ?auto_34655 ) ) ( SURFACE-AT ?auto_34656 ?auto_34650 ) ( ON ?auto_34656 ?auto_34659 ) ( CLEAR ?auto_34656 ) ( not ( = ?auto_34644 ?auto_34659 ) ) ( not ( = ?auto_34645 ?auto_34659 ) ) ( not ( = ?auto_34656 ?auto_34659 ) ) ( not ( = ?auto_34654 ?auto_34659 ) ) ( not ( = ?auto_34652 ?auto_34659 ) ) ( not ( = ?auto_34647 ?auto_34659 ) ) ( SURFACE-AT ?auto_34660 ?auto_34648 ) ( CLEAR ?auto_34660 ) ( IS-CRATE ?auto_34647 ) ( not ( = ?auto_34660 ?auto_34647 ) ) ( not ( = ?auto_34644 ?auto_34660 ) ) ( not ( = ?auto_34645 ?auto_34660 ) ) ( not ( = ?auto_34656 ?auto_34660 ) ) ( not ( = ?auto_34654 ?auto_34660 ) ) ( not ( = ?auto_34652 ?auto_34660 ) ) ( not ( = ?auto_34659 ?auto_34660 ) ) ( AVAILABLE ?auto_34649 ) ( TRUCK-AT ?auto_34651 ?auto_34650 ) ( LIFTING ?auto_34655 ?auto_34647 ) )
    :subtasks
    ( ( !LOAD ?auto_34655 ?auto_34647 ?auto_34651 ?auto_34650 )
      ( MAKE-2CRATE ?auto_34656 ?auto_34644 ?auto_34645 )
      ( MAKE-1CRATE-VERIFY ?auto_34644 ?auto_34645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34661 - SURFACE
      ?auto_34662 - SURFACE
      ?auto_34663 - SURFACE
    )
    :vars
    (
      ?auto_34676 - HOIST
      ?auto_34674 - PLACE
      ?auto_34672 - PLACE
      ?auto_34668 - HOIST
      ?auto_34666 - SURFACE
      ?auto_34667 - PLACE
      ?auto_34670 - HOIST
      ?auto_34675 - SURFACE
      ?auto_34677 - SURFACE
      ?auto_34669 - PLACE
      ?auto_34665 - HOIST
      ?auto_34673 - SURFACE
      ?auto_34671 - SURFACE
      ?auto_34664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34676 ?auto_34674 ) ( IS-CRATE ?auto_34663 ) ( not ( = ?auto_34662 ?auto_34663 ) ) ( not ( = ?auto_34661 ?auto_34662 ) ) ( not ( = ?auto_34661 ?auto_34663 ) ) ( not ( = ?auto_34672 ?auto_34674 ) ) ( HOIST-AT ?auto_34668 ?auto_34672 ) ( not ( = ?auto_34676 ?auto_34668 ) ) ( AVAILABLE ?auto_34668 ) ( SURFACE-AT ?auto_34663 ?auto_34672 ) ( ON ?auto_34663 ?auto_34666 ) ( CLEAR ?auto_34663 ) ( not ( = ?auto_34662 ?auto_34666 ) ) ( not ( = ?auto_34663 ?auto_34666 ) ) ( not ( = ?auto_34661 ?auto_34666 ) ) ( IS-CRATE ?auto_34662 ) ( not ( = ?auto_34667 ?auto_34674 ) ) ( not ( = ?auto_34672 ?auto_34667 ) ) ( HOIST-AT ?auto_34670 ?auto_34667 ) ( not ( = ?auto_34676 ?auto_34670 ) ) ( not ( = ?auto_34668 ?auto_34670 ) ) ( AVAILABLE ?auto_34670 ) ( SURFACE-AT ?auto_34662 ?auto_34667 ) ( ON ?auto_34662 ?auto_34675 ) ( CLEAR ?auto_34662 ) ( not ( = ?auto_34662 ?auto_34675 ) ) ( not ( = ?auto_34663 ?auto_34675 ) ) ( not ( = ?auto_34661 ?auto_34675 ) ) ( not ( = ?auto_34666 ?auto_34675 ) ) ( IS-CRATE ?auto_34661 ) ( not ( = ?auto_34677 ?auto_34661 ) ) ( not ( = ?auto_34662 ?auto_34677 ) ) ( not ( = ?auto_34663 ?auto_34677 ) ) ( not ( = ?auto_34666 ?auto_34677 ) ) ( not ( = ?auto_34675 ?auto_34677 ) ) ( not ( = ?auto_34669 ?auto_34674 ) ) ( not ( = ?auto_34672 ?auto_34669 ) ) ( not ( = ?auto_34667 ?auto_34669 ) ) ( HOIST-AT ?auto_34665 ?auto_34669 ) ( not ( = ?auto_34676 ?auto_34665 ) ) ( not ( = ?auto_34668 ?auto_34665 ) ) ( not ( = ?auto_34670 ?auto_34665 ) ) ( SURFACE-AT ?auto_34661 ?auto_34669 ) ( ON ?auto_34661 ?auto_34673 ) ( CLEAR ?auto_34661 ) ( not ( = ?auto_34662 ?auto_34673 ) ) ( not ( = ?auto_34663 ?auto_34673 ) ) ( not ( = ?auto_34661 ?auto_34673 ) ) ( not ( = ?auto_34666 ?auto_34673 ) ) ( not ( = ?auto_34675 ?auto_34673 ) ) ( not ( = ?auto_34677 ?auto_34673 ) ) ( SURFACE-AT ?auto_34671 ?auto_34674 ) ( CLEAR ?auto_34671 ) ( IS-CRATE ?auto_34677 ) ( not ( = ?auto_34671 ?auto_34677 ) ) ( not ( = ?auto_34662 ?auto_34671 ) ) ( not ( = ?auto_34663 ?auto_34671 ) ) ( not ( = ?auto_34661 ?auto_34671 ) ) ( not ( = ?auto_34666 ?auto_34671 ) ) ( not ( = ?auto_34675 ?auto_34671 ) ) ( not ( = ?auto_34673 ?auto_34671 ) ) ( AVAILABLE ?auto_34676 ) ( TRUCK-AT ?auto_34664 ?auto_34669 ) ( LIFTING ?auto_34665 ?auto_34677 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34662 ?auto_34663 )
      ( MAKE-2CRATE-VERIFY ?auto_34661 ?auto_34662 ?auto_34663 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34678 - SURFACE
      ?auto_34679 - SURFACE
      ?auto_34680 - SURFACE
      ?auto_34681 - SURFACE
    )
    :vars
    (
      ?auto_34685 - HOIST
      ?auto_34687 - PLACE
      ?auto_34689 - PLACE
      ?auto_34694 - HOIST
      ?auto_34691 - SURFACE
      ?auto_34684 - PLACE
      ?auto_34693 - HOIST
      ?auto_34688 - SURFACE
      ?auto_34686 - PLACE
      ?auto_34682 - HOIST
      ?auto_34692 - SURFACE
      ?auto_34690 - SURFACE
      ?auto_34683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34685 ?auto_34687 ) ( IS-CRATE ?auto_34681 ) ( not ( = ?auto_34680 ?auto_34681 ) ) ( not ( = ?auto_34679 ?auto_34680 ) ) ( not ( = ?auto_34679 ?auto_34681 ) ) ( not ( = ?auto_34689 ?auto_34687 ) ) ( HOIST-AT ?auto_34694 ?auto_34689 ) ( not ( = ?auto_34685 ?auto_34694 ) ) ( AVAILABLE ?auto_34694 ) ( SURFACE-AT ?auto_34681 ?auto_34689 ) ( ON ?auto_34681 ?auto_34691 ) ( CLEAR ?auto_34681 ) ( not ( = ?auto_34680 ?auto_34691 ) ) ( not ( = ?auto_34681 ?auto_34691 ) ) ( not ( = ?auto_34679 ?auto_34691 ) ) ( IS-CRATE ?auto_34680 ) ( not ( = ?auto_34684 ?auto_34687 ) ) ( not ( = ?auto_34689 ?auto_34684 ) ) ( HOIST-AT ?auto_34693 ?auto_34684 ) ( not ( = ?auto_34685 ?auto_34693 ) ) ( not ( = ?auto_34694 ?auto_34693 ) ) ( AVAILABLE ?auto_34693 ) ( SURFACE-AT ?auto_34680 ?auto_34684 ) ( ON ?auto_34680 ?auto_34688 ) ( CLEAR ?auto_34680 ) ( not ( = ?auto_34680 ?auto_34688 ) ) ( not ( = ?auto_34681 ?auto_34688 ) ) ( not ( = ?auto_34679 ?auto_34688 ) ) ( not ( = ?auto_34691 ?auto_34688 ) ) ( IS-CRATE ?auto_34679 ) ( not ( = ?auto_34678 ?auto_34679 ) ) ( not ( = ?auto_34680 ?auto_34678 ) ) ( not ( = ?auto_34681 ?auto_34678 ) ) ( not ( = ?auto_34691 ?auto_34678 ) ) ( not ( = ?auto_34688 ?auto_34678 ) ) ( not ( = ?auto_34686 ?auto_34687 ) ) ( not ( = ?auto_34689 ?auto_34686 ) ) ( not ( = ?auto_34684 ?auto_34686 ) ) ( HOIST-AT ?auto_34682 ?auto_34686 ) ( not ( = ?auto_34685 ?auto_34682 ) ) ( not ( = ?auto_34694 ?auto_34682 ) ) ( not ( = ?auto_34693 ?auto_34682 ) ) ( SURFACE-AT ?auto_34679 ?auto_34686 ) ( ON ?auto_34679 ?auto_34692 ) ( CLEAR ?auto_34679 ) ( not ( = ?auto_34680 ?auto_34692 ) ) ( not ( = ?auto_34681 ?auto_34692 ) ) ( not ( = ?auto_34679 ?auto_34692 ) ) ( not ( = ?auto_34691 ?auto_34692 ) ) ( not ( = ?auto_34688 ?auto_34692 ) ) ( not ( = ?auto_34678 ?auto_34692 ) ) ( SURFACE-AT ?auto_34690 ?auto_34687 ) ( CLEAR ?auto_34690 ) ( IS-CRATE ?auto_34678 ) ( not ( = ?auto_34690 ?auto_34678 ) ) ( not ( = ?auto_34680 ?auto_34690 ) ) ( not ( = ?auto_34681 ?auto_34690 ) ) ( not ( = ?auto_34679 ?auto_34690 ) ) ( not ( = ?auto_34691 ?auto_34690 ) ) ( not ( = ?auto_34688 ?auto_34690 ) ) ( not ( = ?auto_34692 ?auto_34690 ) ) ( AVAILABLE ?auto_34685 ) ( TRUCK-AT ?auto_34683 ?auto_34686 ) ( LIFTING ?auto_34682 ?auto_34678 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34679 ?auto_34680 ?auto_34681 )
      ( MAKE-3CRATE-VERIFY ?auto_34678 ?auto_34679 ?auto_34680 ?auto_34681 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34695 - SURFACE
      ?auto_34696 - SURFACE
      ?auto_34697 - SURFACE
      ?auto_34698 - SURFACE
      ?auto_34699 - SURFACE
    )
    :vars
    (
      ?auto_34703 - HOIST
      ?auto_34705 - PLACE
      ?auto_34707 - PLACE
      ?auto_34711 - HOIST
      ?auto_34708 - SURFACE
      ?auto_34702 - PLACE
      ?auto_34710 - HOIST
      ?auto_34706 - SURFACE
      ?auto_34704 - PLACE
      ?auto_34700 - HOIST
      ?auto_34709 - SURFACE
      ?auto_34701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34703 ?auto_34705 ) ( IS-CRATE ?auto_34699 ) ( not ( = ?auto_34698 ?auto_34699 ) ) ( not ( = ?auto_34697 ?auto_34698 ) ) ( not ( = ?auto_34697 ?auto_34699 ) ) ( not ( = ?auto_34707 ?auto_34705 ) ) ( HOIST-AT ?auto_34711 ?auto_34707 ) ( not ( = ?auto_34703 ?auto_34711 ) ) ( AVAILABLE ?auto_34711 ) ( SURFACE-AT ?auto_34699 ?auto_34707 ) ( ON ?auto_34699 ?auto_34708 ) ( CLEAR ?auto_34699 ) ( not ( = ?auto_34698 ?auto_34708 ) ) ( not ( = ?auto_34699 ?auto_34708 ) ) ( not ( = ?auto_34697 ?auto_34708 ) ) ( IS-CRATE ?auto_34698 ) ( not ( = ?auto_34702 ?auto_34705 ) ) ( not ( = ?auto_34707 ?auto_34702 ) ) ( HOIST-AT ?auto_34710 ?auto_34702 ) ( not ( = ?auto_34703 ?auto_34710 ) ) ( not ( = ?auto_34711 ?auto_34710 ) ) ( AVAILABLE ?auto_34710 ) ( SURFACE-AT ?auto_34698 ?auto_34702 ) ( ON ?auto_34698 ?auto_34706 ) ( CLEAR ?auto_34698 ) ( not ( = ?auto_34698 ?auto_34706 ) ) ( not ( = ?auto_34699 ?auto_34706 ) ) ( not ( = ?auto_34697 ?auto_34706 ) ) ( not ( = ?auto_34708 ?auto_34706 ) ) ( IS-CRATE ?auto_34697 ) ( not ( = ?auto_34696 ?auto_34697 ) ) ( not ( = ?auto_34698 ?auto_34696 ) ) ( not ( = ?auto_34699 ?auto_34696 ) ) ( not ( = ?auto_34708 ?auto_34696 ) ) ( not ( = ?auto_34706 ?auto_34696 ) ) ( not ( = ?auto_34704 ?auto_34705 ) ) ( not ( = ?auto_34707 ?auto_34704 ) ) ( not ( = ?auto_34702 ?auto_34704 ) ) ( HOIST-AT ?auto_34700 ?auto_34704 ) ( not ( = ?auto_34703 ?auto_34700 ) ) ( not ( = ?auto_34711 ?auto_34700 ) ) ( not ( = ?auto_34710 ?auto_34700 ) ) ( SURFACE-AT ?auto_34697 ?auto_34704 ) ( ON ?auto_34697 ?auto_34709 ) ( CLEAR ?auto_34697 ) ( not ( = ?auto_34698 ?auto_34709 ) ) ( not ( = ?auto_34699 ?auto_34709 ) ) ( not ( = ?auto_34697 ?auto_34709 ) ) ( not ( = ?auto_34708 ?auto_34709 ) ) ( not ( = ?auto_34706 ?auto_34709 ) ) ( not ( = ?auto_34696 ?auto_34709 ) ) ( SURFACE-AT ?auto_34695 ?auto_34705 ) ( CLEAR ?auto_34695 ) ( IS-CRATE ?auto_34696 ) ( not ( = ?auto_34695 ?auto_34696 ) ) ( not ( = ?auto_34698 ?auto_34695 ) ) ( not ( = ?auto_34699 ?auto_34695 ) ) ( not ( = ?auto_34697 ?auto_34695 ) ) ( not ( = ?auto_34708 ?auto_34695 ) ) ( not ( = ?auto_34706 ?auto_34695 ) ) ( not ( = ?auto_34709 ?auto_34695 ) ) ( AVAILABLE ?auto_34703 ) ( TRUCK-AT ?auto_34701 ?auto_34704 ) ( LIFTING ?auto_34700 ?auto_34696 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34697 ?auto_34698 ?auto_34699 )
      ( MAKE-4CRATE-VERIFY ?auto_34695 ?auto_34696 ?auto_34697 ?auto_34698 ?auto_34699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34712 - SURFACE
      ?auto_34713 - SURFACE
    )
    :vars
    (
      ?auto_34718 - HOIST
      ?auto_34720 - PLACE
      ?auto_34721 - SURFACE
      ?auto_34723 - PLACE
      ?auto_34728 - HOIST
      ?auto_34725 - SURFACE
      ?auto_34717 - PLACE
      ?auto_34727 - HOIST
      ?auto_34722 - SURFACE
      ?auto_34716 - SURFACE
      ?auto_34719 - PLACE
      ?auto_34714 - HOIST
      ?auto_34726 - SURFACE
      ?auto_34724 - SURFACE
      ?auto_34715 - TRUCK
      ?auto_34729 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34718 ?auto_34720 ) ( IS-CRATE ?auto_34713 ) ( not ( = ?auto_34712 ?auto_34713 ) ) ( not ( = ?auto_34721 ?auto_34712 ) ) ( not ( = ?auto_34721 ?auto_34713 ) ) ( not ( = ?auto_34723 ?auto_34720 ) ) ( HOIST-AT ?auto_34728 ?auto_34723 ) ( not ( = ?auto_34718 ?auto_34728 ) ) ( AVAILABLE ?auto_34728 ) ( SURFACE-AT ?auto_34713 ?auto_34723 ) ( ON ?auto_34713 ?auto_34725 ) ( CLEAR ?auto_34713 ) ( not ( = ?auto_34712 ?auto_34725 ) ) ( not ( = ?auto_34713 ?auto_34725 ) ) ( not ( = ?auto_34721 ?auto_34725 ) ) ( IS-CRATE ?auto_34712 ) ( not ( = ?auto_34717 ?auto_34720 ) ) ( not ( = ?auto_34723 ?auto_34717 ) ) ( HOIST-AT ?auto_34727 ?auto_34717 ) ( not ( = ?auto_34718 ?auto_34727 ) ) ( not ( = ?auto_34728 ?auto_34727 ) ) ( AVAILABLE ?auto_34727 ) ( SURFACE-AT ?auto_34712 ?auto_34717 ) ( ON ?auto_34712 ?auto_34722 ) ( CLEAR ?auto_34712 ) ( not ( = ?auto_34712 ?auto_34722 ) ) ( not ( = ?auto_34713 ?auto_34722 ) ) ( not ( = ?auto_34721 ?auto_34722 ) ) ( not ( = ?auto_34725 ?auto_34722 ) ) ( IS-CRATE ?auto_34721 ) ( not ( = ?auto_34716 ?auto_34721 ) ) ( not ( = ?auto_34712 ?auto_34716 ) ) ( not ( = ?auto_34713 ?auto_34716 ) ) ( not ( = ?auto_34725 ?auto_34716 ) ) ( not ( = ?auto_34722 ?auto_34716 ) ) ( not ( = ?auto_34719 ?auto_34720 ) ) ( not ( = ?auto_34723 ?auto_34719 ) ) ( not ( = ?auto_34717 ?auto_34719 ) ) ( HOIST-AT ?auto_34714 ?auto_34719 ) ( not ( = ?auto_34718 ?auto_34714 ) ) ( not ( = ?auto_34728 ?auto_34714 ) ) ( not ( = ?auto_34727 ?auto_34714 ) ) ( SURFACE-AT ?auto_34721 ?auto_34719 ) ( ON ?auto_34721 ?auto_34726 ) ( CLEAR ?auto_34721 ) ( not ( = ?auto_34712 ?auto_34726 ) ) ( not ( = ?auto_34713 ?auto_34726 ) ) ( not ( = ?auto_34721 ?auto_34726 ) ) ( not ( = ?auto_34725 ?auto_34726 ) ) ( not ( = ?auto_34722 ?auto_34726 ) ) ( not ( = ?auto_34716 ?auto_34726 ) ) ( SURFACE-AT ?auto_34724 ?auto_34720 ) ( CLEAR ?auto_34724 ) ( IS-CRATE ?auto_34716 ) ( not ( = ?auto_34724 ?auto_34716 ) ) ( not ( = ?auto_34712 ?auto_34724 ) ) ( not ( = ?auto_34713 ?auto_34724 ) ) ( not ( = ?auto_34721 ?auto_34724 ) ) ( not ( = ?auto_34725 ?auto_34724 ) ) ( not ( = ?auto_34722 ?auto_34724 ) ) ( not ( = ?auto_34726 ?auto_34724 ) ) ( AVAILABLE ?auto_34718 ) ( TRUCK-AT ?auto_34715 ?auto_34719 ) ( AVAILABLE ?auto_34714 ) ( SURFACE-AT ?auto_34716 ?auto_34719 ) ( ON ?auto_34716 ?auto_34729 ) ( CLEAR ?auto_34716 ) ( not ( = ?auto_34712 ?auto_34729 ) ) ( not ( = ?auto_34713 ?auto_34729 ) ) ( not ( = ?auto_34721 ?auto_34729 ) ) ( not ( = ?auto_34725 ?auto_34729 ) ) ( not ( = ?auto_34722 ?auto_34729 ) ) ( not ( = ?auto_34716 ?auto_34729 ) ) ( not ( = ?auto_34726 ?auto_34729 ) ) ( not ( = ?auto_34724 ?auto_34729 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34714 ?auto_34716 ?auto_34729 ?auto_34719 )
      ( MAKE-2CRATE ?auto_34721 ?auto_34712 ?auto_34713 )
      ( MAKE-1CRATE-VERIFY ?auto_34712 ?auto_34713 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34730 - SURFACE
      ?auto_34731 - SURFACE
      ?auto_34732 - SURFACE
    )
    :vars
    (
      ?auto_34735 - HOIST
      ?auto_34747 - PLACE
      ?auto_34737 - PLACE
      ?auto_34744 - HOIST
      ?auto_34743 - SURFACE
      ?auto_34736 - PLACE
      ?auto_34742 - HOIST
      ?auto_34741 - SURFACE
      ?auto_34739 - SURFACE
      ?auto_34746 - PLACE
      ?auto_34733 - HOIST
      ?auto_34740 - SURFACE
      ?auto_34745 - SURFACE
      ?auto_34738 - TRUCK
      ?auto_34734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34735 ?auto_34747 ) ( IS-CRATE ?auto_34732 ) ( not ( = ?auto_34731 ?auto_34732 ) ) ( not ( = ?auto_34730 ?auto_34731 ) ) ( not ( = ?auto_34730 ?auto_34732 ) ) ( not ( = ?auto_34737 ?auto_34747 ) ) ( HOIST-AT ?auto_34744 ?auto_34737 ) ( not ( = ?auto_34735 ?auto_34744 ) ) ( AVAILABLE ?auto_34744 ) ( SURFACE-AT ?auto_34732 ?auto_34737 ) ( ON ?auto_34732 ?auto_34743 ) ( CLEAR ?auto_34732 ) ( not ( = ?auto_34731 ?auto_34743 ) ) ( not ( = ?auto_34732 ?auto_34743 ) ) ( not ( = ?auto_34730 ?auto_34743 ) ) ( IS-CRATE ?auto_34731 ) ( not ( = ?auto_34736 ?auto_34747 ) ) ( not ( = ?auto_34737 ?auto_34736 ) ) ( HOIST-AT ?auto_34742 ?auto_34736 ) ( not ( = ?auto_34735 ?auto_34742 ) ) ( not ( = ?auto_34744 ?auto_34742 ) ) ( AVAILABLE ?auto_34742 ) ( SURFACE-AT ?auto_34731 ?auto_34736 ) ( ON ?auto_34731 ?auto_34741 ) ( CLEAR ?auto_34731 ) ( not ( = ?auto_34731 ?auto_34741 ) ) ( not ( = ?auto_34732 ?auto_34741 ) ) ( not ( = ?auto_34730 ?auto_34741 ) ) ( not ( = ?auto_34743 ?auto_34741 ) ) ( IS-CRATE ?auto_34730 ) ( not ( = ?auto_34739 ?auto_34730 ) ) ( not ( = ?auto_34731 ?auto_34739 ) ) ( not ( = ?auto_34732 ?auto_34739 ) ) ( not ( = ?auto_34743 ?auto_34739 ) ) ( not ( = ?auto_34741 ?auto_34739 ) ) ( not ( = ?auto_34746 ?auto_34747 ) ) ( not ( = ?auto_34737 ?auto_34746 ) ) ( not ( = ?auto_34736 ?auto_34746 ) ) ( HOIST-AT ?auto_34733 ?auto_34746 ) ( not ( = ?auto_34735 ?auto_34733 ) ) ( not ( = ?auto_34744 ?auto_34733 ) ) ( not ( = ?auto_34742 ?auto_34733 ) ) ( SURFACE-AT ?auto_34730 ?auto_34746 ) ( ON ?auto_34730 ?auto_34740 ) ( CLEAR ?auto_34730 ) ( not ( = ?auto_34731 ?auto_34740 ) ) ( not ( = ?auto_34732 ?auto_34740 ) ) ( not ( = ?auto_34730 ?auto_34740 ) ) ( not ( = ?auto_34743 ?auto_34740 ) ) ( not ( = ?auto_34741 ?auto_34740 ) ) ( not ( = ?auto_34739 ?auto_34740 ) ) ( SURFACE-AT ?auto_34745 ?auto_34747 ) ( CLEAR ?auto_34745 ) ( IS-CRATE ?auto_34739 ) ( not ( = ?auto_34745 ?auto_34739 ) ) ( not ( = ?auto_34731 ?auto_34745 ) ) ( not ( = ?auto_34732 ?auto_34745 ) ) ( not ( = ?auto_34730 ?auto_34745 ) ) ( not ( = ?auto_34743 ?auto_34745 ) ) ( not ( = ?auto_34741 ?auto_34745 ) ) ( not ( = ?auto_34740 ?auto_34745 ) ) ( AVAILABLE ?auto_34735 ) ( TRUCK-AT ?auto_34738 ?auto_34746 ) ( AVAILABLE ?auto_34733 ) ( SURFACE-AT ?auto_34739 ?auto_34746 ) ( ON ?auto_34739 ?auto_34734 ) ( CLEAR ?auto_34739 ) ( not ( = ?auto_34731 ?auto_34734 ) ) ( not ( = ?auto_34732 ?auto_34734 ) ) ( not ( = ?auto_34730 ?auto_34734 ) ) ( not ( = ?auto_34743 ?auto_34734 ) ) ( not ( = ?auto_34741 ?auto_34734 ) ) ( not ( = ?auto_34739 ?auto_34734 ) ) ( not ( = ?auto_34740 ?auto_34734 ) ) ( not ( = ?auto_34745 ?auto_34734 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34731 ?auto_34732 )
      ( MAKE-2CRATE-VERIFY ?auto_34730 ?auto_34731 ?auto_34732 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34748 - SURFACE
      ?auto_34749 - SURFACE
      ?auto_34750 - SURFACE
      ?auto_34751 - SURFACE
    )
    :vars
    (
      ?auto_34756 - HOIST
      ?auto_34757 - PLACE
      ?auto_34754 - PLACE
      ?auto_34755 - HOIST
      ?auto_34762 - SURFACE
      ?auto_34761 - PLACE
      ?auto_34753 - HOIST
      ?auto_34758 - SURFACE
      ?auto_34752 - PLACE
      ?auto_34763 - HOIST
      ?auto_34765 - SURFACE
      ?auto_34760 - SURFACE
      ?auto_34759 - TRUCK
      ?auto_34764 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34756 ?auto_34757 ) ( IS-CRATE ?auto_34751 ) ( not ( = ?auto_34750 ?auto_34751 ) ) ( not ( = ?auto_34749 ?auto_34750 ) ) ( not ( = ?auto_34749 ?auto_34751 ) ) ( not ( = ?auto_34754 ?auto_34757 ) ) ( HOIST-AT ?auto_34755 ?auto_34754 ) ( not ( = ?auto_34756 ?auto_34755 ) ) ( AVAILABLE ?auto_34755 ) ( SURFACE-AT ?auto_34751 ?auto_34754 ) ( ON ?auto_34751 ?auto_34762 ) ( CLEAR ?auto_34751 ) ( not ( = ?auto_34750 ?auto_34762 ) ) ( not ( = ?auto_34751 ?auto_34762 ) ) ( not ( = ?auto_34749 ?auto_34762 ) ) ( IS-CRATE ?auto_34750 ) ( not ( = ?auto_34761 ?auto_34757 ) ) ( not ( = ?auto_34754 ?auto_34761 ) ) ( HOIST-AT ?auto_34753 ?auto_34761 ) ( not ( = ?auto_34756 ?auto_34753 ) ) ( not ( = ?auto_34755 ?auto_34753 ) ) ( AVAILABLE ?auto_34753 ) ( SURFACE-AT ?auto_34750 ?auto_34761 ) ( ON ?auto_34750 ?auto_34758 ) ( CLEAR ?auto_34750 ) ( not ( = ?auto_34750 ?auto_34758 ) ) ( not ( = ?auto_34751 ?auto_34758 ) ) ( not ( = ?auto_34749 ?auto_34758 ) ) ( not ( = ?auto_34762 ?auto_34758 ) ) ( IS-CRATE ?auto_34749 ) ( not ( = ?auto_34748 ?auto_34749 ) ) ( not ( = ?auto_34750 ?auto_34748 ) ) ( not ( = ?auto_34751 ?auto_34748 ) ) ( not ( = ?auto_34762 ?auto_34748 ) ) ( not ( = ?auto_34758 ?auto_34748 ) ) ( not ( = ?auto_34752 ?auto_34757 ) ) ( not ( = ?auto_34754 ?auto_34752 ) ) ( not ( = ?auto_34761 ?auto_34752 ) ) ( HOIST-AT ?auto_34763 ?auto_34752 ) ( not ( = ?auto_34756 ?auto_34763 ) ) ( not ( = ?auto_34755 ?auto_34763 ) ) ( not ( = ?auto_34753 ?auto_34763 ) ) ( SURFACE-AT ?auto_34749 ?auto_34752 ) ( ON ?auto_34749 ?auto_34765 ) ( CLEAR ?auto_34749 ) ( not ( = ?auto_34750 ?auto_34765 ) ) ( not ( = ?auto_34751 ?auto_34765 ) ) ( not ( = ?auto_34749 ?auto_34765 ) ) ( not ( = ?auto_34762 ?auto_34765 ) ) ( not ( = ?auto_34758 ?auto_34765 ) ) ( not ( = ?auto_34748 ?auto_34765 ) ) ( SURFACE-AT ?auto_34760 ?auto_34757 ) ( CLEAR ?auto_34760 ) ( IS-CRATE ?auto_34748 ) ( not ( = ?auto_34760 ?auto_34748 ) ) ( not ( = ?auto_34750 ?auto_34760 ) ) ( not ( = ?auto_34751 ?auto_34760 ) ) ( not ( = ?auto_34749 ?auto_34760 ) ) ( not ( = ?auto_34762 ?auto_34760 ) ) ( not ( = ?auto_34758 ?auto_34760 ) ) ( not ( = ?auto_34765 ?auto_34760 ) ) ( AVAILABLE ?auto_34756 ) ( TRUCK-AT ?auto_34759 ?auto_34752 ) ( AVAILABLE ?auto_34763 ) ( SURFACE-AT ?auto_34748 ?auto_34752 ) ( ON ?auto_34748 ?auto_34764 ) ( CLEAR ?auto_34748 ) ( not ( = ?auto_34750 ?auto_34764 ) ) ( not ( = ?auto_34751 ?auto_34764 ) ) ( not ( = ?auto_34749 ?auto_34764 ) ) ( not ( = ?auto_34762 ?auto_34764 ) ) ( not ( = ?auto_34758 ?auto_34764 ) ) ( not ( = ?auto_34748 ?auto_34764 ) ) ( not ( = ?auto_34765 ?auto_34764 ) ) ( not ( = ?auto_34760 ?auto_34764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34749 ?auto_34750 ?auto_34751 )
      ( MAKE-3CRATE-VERIFY ?auto_34748 ?auto_34749 ?auto_34750 ?auto_34751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34766 - SURFACE
      ?auto_34767 - SURFACE
      ?auto_34768 - SURFACE
      ?auto_34769 - SURFACE
      ?auto_34770 - SURFACE
    )
    :vars
    (
      ?auto_34775 - HOIST
      ?auto_34776 - PLACE
      ?auto_34773 - PLACE
      ?auto_34774 - HOIST
      ?auto_34780 - SURFACE
      ?auto_34779 - PLACE
      ?auto_34772 - HOIST
      ?auto_34777 - SURFACE
      ?auto_34771 - PLACE
      ?auto_34781 - HOIST
      ?auto_34783 - SURFACE
      ?auto_34778 - TRUCK
      ?auto_34782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34775 ?auto_34776 ) ( IS-CRATE ?auto_34770 ) ( not ( = ?auto_34769 ?auto_34770 ) ) ( not ( = ?auto_34768 ?auto_34769 ) ) ( not ( = ?auto_34768 ?auto_34770 ) ) ( not ( = ?auto_34773 ?auto_34776 ) ) ( HOIST-AT ?auto_34774 ?auto_34773 ) ( not ( = ?auto_34775 ?auto_34774 ) ) ( AVAILABLE ?auto_34774 ) ( SURFACE-AT ?auto_34770 ?auto_34773 ) ( ON ?auto_34770 ?auto_34780 ) ( CLEAR ?auto_34770 ) ( not ( = ?auto_34769 ?auto_34780 ) ) ( not ( = ?auto_34770 ?auto_34780 ) ) ( not ( = ?auto_34768 ?auto_34780 ) ) ( IS-CRATE ?auto_34769 ) ( not ( = ?auto_34779 ?auto_34776 ) ) ( not ( = ?auto_34773 ?auto_34779 ) ) ( HOIST-AT ?auto_34772 ?auto_34779 ) ( not ( = ?auto_34775 ?auto_34772 ) ) ( not ( = ?auto_34774 ?auto_34772 ) ) ( AVAILABLE ?auto_34772 ) ( SURFACE-AT ?auto_34769 ?auto_34779 ) ( ON ?auto_34769 ?auto_34777 ) ( CLEAR ?auto_34769 ) ( not ( = ?auto_34769 ?auto_34777 ) ) ( not ( = ?auto_34770 ?auto_34777 ) ) ( not ( = ?auto_34768 ?auto_34777 ) ) ( not ( = ?auto_34780 ?auto_34777 ) ) ( IS-CRATE ?auto_34768 ) ( not ( = ?auto_34767 ?auto_34768 ) ) ( not ( = ?auto_34769 ?auto_34767 ) ) ( not ( = ?auto_34770 ?auto_34767 ) ) ( not ( = ?auto_34780 ?auto_34767 ) ) ( not ( = ?auto_34777 ?auto_34767 ) ) ( not ( = ?auto_34771 ?auto_34776 ) ) ( not ( = ?auto_34773 ?auto_34771 ) ) ( not ( = ?auto_34779 ?auto_34771 ) ) ( HOIST-AT ?auto_34781 ?auto_34771 ) ( not ( = ?auto_34775 ?auto_34781 ) ) ( not ( = ?auto_34774 ?auto_34781 ) ) ( not ( = ?auto_34772 ?auto_34781 ) ) ( SURFACE-AT ?auto_34768 ?auto_34771 ) ( ON ?auto_34768 ?auto_34783 ) ( CLEAR ?auto_34768 ) ( not ( = ?auto_34769 ?auto_34783 ) ) ( not ( = ?auto_34770 ?auto_34783 ) ) ( not ( = ?auto_34768 ?auto_34783 ) ) ( not ( = ?auto_34780 ?auto_34783 ) ) ( not ( = ?auto_34777 ?auto_34783 ) ) ( not ( = ?auto_34767 ?auto_34783 ) ) ( SURFACE-AT ?auto_34766 ?auto_34776 ) ( CLEAR ?auto_34766 ) ( IS-CRATE ?auto_34767 ) ( not ( = ?auto_34766 ?auto_34767 ) ) ( not ( = ?auto_34769 ?auto_34766 ) ) ( not ( = ?auto_34770 ?auto_34766 ) ) ( not ( = ?auto_34768 ?auto_34766 ) ) ( not ( = ?auto_34780 ?auto_34766 ) ) ( not ( = ?auto_34777 ?auto_34766 ) ) ( not ( = ?auto_34783 ?auto_34766 ) ) ( AVAILABLE ?auto_34775 ) ( TRUCK-AT ?auto_34778 ?auto_34771 ) ( AVAILABLE ?auto_34781 ) ( SURFACE-AT ?auto_34767 ?auto_34771 ) ( ON ?auto_34767 ?auto_34782 ) ( CLEAR ?auto_34767 ) ( not ( = ?auto_34769 ?auto_34782 ) ) ( not ( = ?auto_34770 ?auto_34782 ) ) ( not ( = ?auto_34768 ?auto_34782 ) ) ( not ( = ?auto_34780 ?auto_34782 ) ) ( not ( = ?auto_34777 ?auto_34782 ) ) ( not ( = ?auto_34767 ?auto_34782 ) ) ( not ( = ?auto_34783 ?auto_34782 ) ) ( not ( = ?auto_34766 ?auto_34782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34768 ?auto_34769 ?auto_34770 )
      ( MAKE-4CRATE-VERIFY ?auto_34766 ?auto_34767 ?auto_34768 ?auto_34769 ?auto_34770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34784 - SURFACE
      ?auto_34785 - SURFACE
    )
    :vars
    (
      ?auto_34791 - HOIST
      ?auto_34792 - PLACE
      ?auto_34788 - SURFACE
      ?auto_34789 - PLACE
      ?auto_34790 - HOIST
      ?auto_34797 - SURFACE
      ?auto_34796 - PLACE
      ?auto_34787 - HOIST
      ?auto_34793 - SURFACE
      ?auto_34801 - SURFACE
      ?auto_34786 - PLACE
      ?auto_34798 - HOIST
      ?auto_34800 - SURFACE
      ?auto_34795 - SURFACE
      ?auto_34799 - SURFACE
      ?auto_34794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34791 ?auto_34792 ) ( IS-CRATE ?auto_34785 ) ( not ( = ?auto_34784 ?auto_34785 ) ) ( not ( = ?auto_34788 ?auto_34784 ) ) ( not ( = ?auto_34788 ?auto_34785 ) ) ( not ( = ?auto_34789 ?auto_34792 ) ) ( HOIST-AT ?auto_34790 ?auto_34789 ) ( not ( = ?auto_34791 ?auto_34790 ) ) ( AVAILABLE ?auto_34790 ) ( SURFACE-AT ?auto_34785 ?auto_34789 ) ( ON ?auto_34785 ?auto_34797 ) ( CLEAR ?auto_34785 ) ( not ( = ?auto_34784 ?auto_34797 ) ) ( not ( = ?auto_34785 ?auto_34797 ) ) ( not ( = ?auto_34788 ?auto_34797 ) ) ( IS-CRATE ?auto_34784 ) ( not ( = ?auto_34796 ?auto_34792 ) ) ( not ( = ?auto_34789 ?auto_34796 ) ) ( HOIST-AT ?auto_34787 ?auto_34796 ) ( not ( = ?auto_34791 ?auto_34787 ) ) ( not ( = ?auto_34790 ?auto_34787 ) ) ( AVAILABLE ?auto_34787 ) ( SURFACE-AT ?auto_34784 ?auto_34796 ) ( ON ?auto_34784 ?auto_34793 ) ( CLEAR ?auto_34784 ) ( not ( = ?auto_34784 ?auto_34793 ) ) ( not ( = ?auto_34785 ?auto_34793 ) ) ( not ( = ?auto_34788 ?auto_34793 ) ) ( not ( = ?auto_34797 ?auto_34793 ) ) ( IS-CRATE ?auto_34788 ) ( not ( = ?auto_34801 ?auto_34788 ) ) ( not ( = ?auto_34784 ?auto_34801 ) ) ( not ( = ?auto_34785 ?auto_34801 ) ) ( not ( = ?auto_34797 ?auto_34801 ) ) ( not ( = ?auto_34793 ?auto_34801 ) ) ( not ( = ?auto_34786 ?auto_34792 ) ) ( not ( = ?auto_34789 ?auto_34786 ) ) ( not ( = ?auto_34796 ?auto_34786 ) ) ( HOIST-AT ?auto_34798 ?auto_34786 ) ( not ( = ?auto_34791 ?auto_34798 ) ) ( not ( = ?auto_34790 ?auto_34798 ) ) ( not ( = ?auto_34787 ?auto_34798 ) ) ( SURFACE-AT ?auto_34788 ?auto_34786 ) ( ON ?auto_34788 ?auto_34800 ) ( CLEAR ?auto_34788 ) ( not ( = ?auto_34784 ?auto_34800 ) ) ( not ( = ?auto_34785 ?auto_34800 ) ) ( not ( = ?auto_34788 ?auto_34800 ) ) ( not ( = ?auto_34797 ?auto_34800 ) ) ( not ( = ?auto_34793 ?auto_34800 ) ) ( not ( = ?auto_34801 ?auto_34800 ) ) ( SURFACE-AT ?auto_34795 ?auto_34792 ) ( CLEAR ?auto_34795 ) ( IS-CRATE ?auto_34801 ) ( not ( = ?auto_34795 ?auto_34801 ) ) ( not ( = ?auto_34784 ?auto_34795 ) ) ( not ( = ?auto_34785 ?auto_34795 ) ) ( not ( = ?auto_34788 ?auto_34795 ) ) ( not ( = ?auto_34797 ?auto_34795 ) ) ( not ( = ?auto_34793 ?auto_34795 ) ) ( not ( = ?auto_34800 ?auto_34795 ) ) ( AVAILABLE ?auto_34791 ) ( AVAILABLE ?auto_34798 ) ( SURFACE-AT ?auto_34801 ?auto_34786 ) ( ON ?auto_34801 ?auto_34799 ) ( CLEAR ?auto_34801 ) ( not ( = ?auto_34784 ?auto_34799 ) ) ( not ( = ?auto_34785 ?auto_34799 ) ) ( not ( = ?auto_34788 ?auto_34799 ) ) ( not ( = ?auto_34797 ?auto_34799 ) ) ( not ( = ?auto_34793 ?auto_34799 ) ) ( not ( = ?auto_34801 ?auto_34799 ) ) ( not ( = ?auto_34800 ?auto_34799 ) ) ( not ( = ?auto_34795 ?auto_34799 ) ) ( TRUCK-AT ?auto_34794 ?auto_34792 ) )
    :subtasks
    ( ( !DRIVE ?auto_34794 ?auto_34792 ?auto_34786 )
      ( MAKE-2CRATE ?auto_34788 ?auto_34784 ?auto_34785 )
      ( MAKE-1CRATE-VERIFY ?auto_34784 ?auto_34785 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34802 - SURFACE
      ?auto_34803 - SURFACE
      ?auto_34804 - SURFACE
    )
    :vars
    (
      ?auto_34808 - HOIST
      ?auto_34806 - PLACE
      ?auto_34817 - PLACE
      ?auto_34805 - HOIST
      ?auto_34811 - SURFACE
      ?auto_34818 - PLACE
      ?auto_34815 - HOIST
      ?auto_34813 - SURFACE
      ?auto_34819 - SURFACE
      ?auto_34810 - PLACE
      ?auto_34814 - HOIST
      ?auto_34807 - SURFACE
      ?auto_34812 - SURFACE
      ?auto_34809 - SURFACE
      ?auto_34816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34808 ?auto_34806 ) ( IS-CRATE ?auto_34804 ) ( not ( = ?auto_34803 ?auto_34804 ) ) ( not ( = ?auto_34802 ?auto_34803 ) ) ( not ( = ?auto_34802 ?auto_34804 ) ) ( not ( = ?auto_34817 ?auto_34806 ) ) ( HOIST-AT ?auto_34805 ?auto_34817 ) ( not ( = ?auto_34808 ?auto_34805 ) ) ( AVAILABLE ?auto_34805 ) ( SURFACE-AT ?auto_34804 ?auto_34817 ) ( ON ?auto_34804 ?auto_34811 ) ( CLEAR ?auto_34804 ) ( not ( = ?auto_34803 ?auto_34811 ) ) ( not ( = ?auto_34804 ?auto_34811 ) ) ( not ( = ?auto_34802 ?auto_34811 ) ) ( IS-CRATE ?auto_34803 ) ( not ( = ?auto_34818 ?auto_34806 ) ) ( not ( = ?auto_34817 ?auto_34818 ) ) ( HOIST-AT ?auto_34815 ?auto_34818 ) ( not ( = ?auto_34808 ?auto_34815 ) ) ( not ( = ?auto_34805 ?auto_34815 ) ) ( AVAILABLE ?auto_34815 ) ( SURFACE-AT ?auto_34803 ?auto_34818 ) ( ON ?auto_34803 ?auto_34813 ) ( CLEAR ?auto_34803 ) ( not ( = ?auto_34803 ?auto_34813 ) ) ( not ( = ?auto_34804 ?auto_34813 ) ) ( not ( = ?auto_34802 ?auto_34813 ) ) ( not ( = ?auto_34811 ?auto_34813 ) ) ( IS-CRATE ?auto_34802 ) ( not ( = ?auto_34819 ?auto_34802 ) ) ( not ( = ?auto_34803 ?auto_34819 ) ) ( not ( = ?auto_34804 ?auto_34819 ) ) ( not ( = ?auto_34811 ?auto_34819 ) ) ( not ( = ?auto_34813 ?auto_34819 ) ) ( not ( = ?auto_34810 ?auto_34806 ) ) ( not ( = ?auto_34817 ?auto_34810 ) ) ( not ( = ?auto_34818 ?auto_34810 ) ) ( HOIST-AT ?auto_34814 ?auto_34810 ) ( not ( = ?auto_34808 ?auto_34814 ) ) ( not ( = ?auto_34805 ?auto_34814 ) ) ( not ( = ?auto_34815 ?auto_34814 ) ) ( SURFACE-AT ?auto_34802 ?auto_34810 ) ( ON ?auto_34802 ?auto_34807 ) ( CLEAR ?auto_34802 ) ( not ( = ?auto_34803 ?auto_34807 ) ) ( not ( = ?auto_34804 ?auto_34807 ) ) ( not ( = ?auto_34802 ?auto_34807 ) ) ( not ( = ?auto_34811 ?auto_34807 ) ) ( not ( = ?auto_34813 ?auto_34807 ) ) ( not ( = ?auto_34819 ?auto_34807 ) ) ( SURFACE-AT ?auto_34812 ?auto_34806 ) ( CLEAR ?auto_34812 ) ( IS-CRATE ?auto_34819 ) ( not ( = ?auto_34812 ?auto_34819 ) ) ( not ( = ?auto_34803 ?auto_34812 ) ) ( not ( = ?auto_34804 ?auto_34812 ) ) ( not ( = ?auto_34802 ?auto_34812 ) ) ( not ( = ?auto_34811 ?auto_34812 ) ) ( not ( = ?auto_34813 ?auto_34812 ) ) ( not ( = ?auto_34807 ?auto_34812 ) ) ( AVAILABLE ?auto_34808 ) ( AVAILABLE ?auto_34814 ) ( SURFACE-AT ?auto_34819 ?auto_34810 ) ( ON ?auto_34819 ?auto_34809 ) ( CLEAR ?auto_34819 ) ( not ( = ?auto_34803 ?auto_34809 ) ) ( not ( = ?auto_34804 ?auto_34809 ) ) ( not ( = ?auto_34802 ?auto_34809 ) ) ( not ( = ?auto_34811 ?auto_34809 ) ) ( not ( = ?auto_34813 ?auto_34809 ) ) ( not ( = ?auto_34819 ?auto_34809 ) ) ( not ( = ?auto_34807 ?auto_34809 ) ) ( not ( = ?auto_34812 ?auto_34809 ) ) ( TRUCK-AT ?auto_34816 ?auto_34806 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34803 ?auto_34804 )
      ( MAKE-2CRATE-VERIFY ?auto_34802 ?auto_34803 ?auto_34804 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34820 - SURFACE
      ?auto_34821 - SURFACE
      ?auto_34822 - SURFACE
      ?auto_34823 - SURFACE
    )
    :vars
    (
      ?auto_34835 - HOIST
      ?auto_34826 - PLACE
      ?auto_34831 - PLACE
      ?auto_34830 - HOIST
      ?auto_34828 - SURFACE
      ?auto_34824 - PLACE
      ?auto_34832 - HOIST
      ?auto_34834 - SURFACE
      ?auto_34837 - PLACE
      ?auto_34829 - HOIST
      ?auto_34833 - SURFACE
      ?auto_34827 - SURFACE
      ?auto_34836 - SURFACE
      ?auto_34825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34835 ?auto_34826 ) ( IS-CRATE ?auto_34823 ) ( not ( = ?auto_34822 ?auto_34823 ) ) ( not ( = ?auto_34821 ?auto_34822 ) ) ( not ( = ?auto_34821 ?auto_34823 ) ) ( not ( = ?auto_34831 ?auto_34826 ) ) ( HOIST-AT ?auto_34830 ?auto_34831 ) ( not ( = ?auto_34835 ?auto_34830 ) ) ( AVAILABLE ?auto_34830 ) ( SURFACE-AT ?auto_34823 ?auto_34831 ) ( ON ?auto_34823 ?auto_34828 ) ( CLEAR ?auto_34823 ) ( not ( = ?auto_34822 ?auto_34828 ) ) ( not ( = ?auto_34823 ?auto_34828 ) ) ( not ( = ?auto_34821 ?auto_34828 ) ) ( IS-CRATE ?auto_34822 ) ( not ( = ?auto_34824 ?auto_34826 ) ) ( not ( = ?auto_34831 ?auto_34824 ) ) ( HOIST-AT ?auto_34832 ?auto_34824 ) ( not ( = ?auto_34835 ?auto_34832 ) ) ( not ( = ?auto_34830 ?auto_34832 ) ) ( AVAILABLE ?auto_34832 ) ( SURFACE-AT ?auto_34822 ?auto_34824 ) ( ON ?auto_34822 ?auto_34834 ) ( CLEAR ?auto_34822 ) ( not ( = ?auto_34822 ?auto_34834 ) ) ( not ( = ?auto_34823 ?auto_34834 ) ) ( not ( = ?auto_34821 ?auto_34834 ) ) ( not ( = ?auto_34828 ?auto_34834 ) ) ( IS-CRATE ?auto_34821 ) ( not ( = ?auto_34820 ?auto_34821 ) ) ( not ( = ?auto_34822 ?auto_34820 ) ) ( not ( = ?auto_34823 ?auto_34820 ) ) ( not ( = ?auto_34828 ?auto_34820 ) ) ( not ( = ?auto_34834 ?auto_34820 ) ) ( not ( = ?auto_34837 ?auto_34826 ) ) ( not ( = ?auto_34831 ?auto_34837 ) ) ( not ( = ?auto_34824 ?auto_34837 ) ) ( HOIST-AT ?auto_34829 ?auto_34837 ) ( not ( = ?auto_34835 ?auto_34829 ) ) ( not ( = ?auto_34830 ?auto_34829 ) ) ( not ( = ?auto_34832 ?auto_34829 ) ) ( SURFACE-AT ?auto_34821 ?auto_34837 ) ( ON ?auto_34821 ?auto_34833 ) ( CLEAR ?auto_34821 ) ( not ( = ?auto_34822 ?auto_34833 ) ) ( not ( = ?auto_34823 ?auto_34833 ) ) ( not ( = ?auto_34821 ?auto_34833 ) ) ( not ( = ?auto_34828 ?auto_34833 ) ) ( not ( = ?auto_34834 ?auto_34833 ) ) ( not ( = ?auto_34820 ?auto_34833 ) ) ( SURFACE-AT ?auto_34827 ?auto_34826 ) ( CLEAR ?auto_34827 ) ( IS-CRATE ?auto_34820 ) ( not ( = ?auto_34827 ?auto_34820 ) ) ( not ( = ?auto_34822 ?auto_34827 ) ) ( not ( = ?auto_34823 ?auto_34827 ) ) ( not ( = ?auto_34821 ?auto_34827 ) ) ( not ( = ?auto_34828 ?auto_34827 ) ) ( not ( = ?auto_34834 ?auto_34827 ) ) ( not ( = ?auto_34833 ?auto_34827 ) ) ( AVAILABLE ?auto_34835 ) ( AVAILABLE ?auto_34829 ) ( SURFACE-AT ?auto_34820 ?auto_34837 ) ( ON ?auto_34820 ?auto_34836 ) ( CLEAR ?auto_34820 ) ( not ( = ?auto_34822 ?auto_34836 ) ) ( not ( = ?auto_34823 ?auto_34836 ) ) ( not ( = ?auto_34821 ?auto_34836 ) ) ( not ( = ?auto_34828 ?auto_34836 ) ) ( not ( = ?auto_34834 ?auto_34836 ) ) ( not ( = ?auto_34820 ?auto_34836 ) ) ( not ( = ?auto_34833 ?auto_34836 ) ) ( not ( = ?auto_34827 ?auto_34836 ) ) ( TRUCK-AT ?auto_34825 ?auto_34826 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34821 ?auto_34822 ?auto_34823 )
      ( MAKE-3CRATE-VERIFY ?auto_34820 ?auto_34821 ?auto_34822 ?auto_34823 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34838 - SURFACE
      ?auto_34839 - SURFACE
      ?auto_34840 - SURFACE
      ?auto_34841 - SURFACE
      ?auto_34842 - SURFACE
    )
    :vars
    (
      ?auto_34853 - HOIST
      ?auto_34845 - PLACE
      ?auto_34849 - PLACE
      ?auto_34848 - HOIST
      ?auto_34846 - SURFACE
      ?auto_34843 - PLACE
      ?auto_34850 - HOIST
      ?auto_34852 - SURFACE
      ?auto_34855 - PLACE
      ?auto_34847 - HOIST
      ?auto_34851 - SURFACE
      ?auto_34854 - SURFACE
      ?auto_34844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34853 ?auto_34845 ) ( IS-CRATE ?auto_34842 ) ( not ( = ?auto_34841 ?auto_34842 ) ) ( not ( = ?auto_34840 ?auto_34841 ) ) ( not ( = ?auto_34840 ?auto_34842 ) ) ( not ( = ?auto_34849 ?auto_34845 ) ) ( HOIST-AT ?auto_34848 ?auto_34849 ) ( not ( = ?auto_34853 ?auto_34848 ) ) ( AVAILABLE ?auto_34848 ) ( SURFACE-AT ?auto_34842 ?auto_34849 ) ( ON ?auto_34842 ?auto_34846 ) ( CLEAR ?auto_34842 ) ( not ( = ?auto_34841 ?auto_34846 ) ) ( not ( = ?auto_34842 ?auto_34846 ) ) ( not ( = ?auto_34840 ?auto_34846 ) ) ( IS-CRATE ?auto_34841 ) ( not ( = ?auto_34843 ?auto_34845 ) ) ( not ( = ?auto_34849 ?auto_34843 ) ) ( HOIST-AT ?auto_34850 ?auto_34843 ) ( not ( = ?auto_34853 ?auto_34850 ) ) ( not ( = ?auto_34848 ?auto_34850 ) ) ( AVAILABLE ?auto_34850 ) ( SURFACE-AT ?auto_34841 ?auto_34843 ) ( ON ?auto_34841 ?auto_34852 ) ( CLEAR ?auto_34841 ) ( not ( = ?auto_34841 ?auto_34852 ) ) ( not ( = ?auto_34842 ?auto_34852 ) ) ( not ( = ?auto_34840 ?auto_34852 ) ) ( not ( = ?auto_34846 ?auto_34852 ) ) ( IS-CRATE ?auto_34840 ) ( not ( = ?auto_34839 ?auto_34840 ) ) ( not ( = ?auto_34841 ?auto_34839 ) ) ( not ( = ?auto_34842 ?auto_34839 ) ) ( not ( = ?auto_34846 ?auto_34839 ) ) ( not ( = ?auto_34852 ?auto_34839 ) ) ( not ( = ?auto_34855 ?auto_34845 ) ) ( not ( = ?auto_34849 ?auto_34855 ) ) ( not ( = ?auto_34843 ?auto_34855 ) ) ( HOIST-AT ?auto_34847 ?auto_34855 ) ( not ( = ?auto_34853 ?auto_34847 ) ) ( not ( = ?auto_34848 ?auto_34847 ) ) ( not ( = ?auto_34850 ?auto_34847 ) ) ( SURFACE-AT ?auto_34840 ?auto_34855 ) ( ON ?auto_34840 ?auto_34851 ) ( CLEAR ?auto_34840 ) ( not ( = ?auto_34841 ?auto_34851 ) ) ( not ( = ?auto_34842 ?auto_34851 ) ) ( not ( = ?auto_34840 ?auto_34851 ) ) ( not ( = ?auto_34846 ?auto_34851 ) ) ( not ( = ?auto_34852 ?auto_34851 ) ) ( not ( = ?auto_34839 ?auto_34851 ) ) ( SURFACE-AT ?auto_34838 ?auto_34845 ) ( CLEAR ?auto_34838 ) ( IS-CRATE ?auto_34839 ) ( not ( = ?auto_34838 ?auto_34839 ) ) ( not ( = ?auto_34841 ?auto_34838 ) ) ( not ( = ?auto_34842 ?auto_34838 ) ) ( not ( = ?auto_34840 ?auto_34838 ) ) ( not ( = ?auto_34846 ?auto_34838 ) ) ( not ( = ?auto_34852 ?auto_34838 ) ) ( not ( = ?auto_34851 ?auto_34838 ) ) ( AVAILABLE ?auto_34853 ) ( AVAILABLE ?auto_34847 ) ( SURFACE-AT ?auto_34839 ?auto_34855 ) ( ON ?auto_34839 ?auto_34854 ) ( CLEAR ?auto_34839 ) ( not ( = ?auto_34841 ?auto_34854 ) ) ( not ( = ?auto_34842 ?auto_34854 ) ) ( not ( = ?auto_34840 ?auto_34854 ) ) ( not ( = ?auto_34846 ?auto_34854 ) ) ( not ( = ?auto_34852 ?auto_34854 ) ) ( not ( = ?auto_34839 ?auto_34854 ) ) ( not ( = ?auto_34851 ?auto_34854 ) ) ( not ( = ?auto_34838 ?auto_34854 ) ) ( TRUCK-AT ?auto_34844 ?auto_34845 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34840 ?auto_34841 ?auto_34842 )
      ( MAKE-4CRATE-VERIFY ?auto_34838 ?auto_34839 ?auto_34840 ?auto_34841 ?auto_34842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34876 - SURFACE
      ?auto_34877 - SURFACE
    )
    :vars
    (
      ?auto_34878 - HOIST
      ?auto_34879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34878 ?auto_34879 ) ( SURFACE-AT ?auto_34876 ?auto_34879 ) ( CLEAR ?auto_34876 ) ( LIFTING ?auto_34878 ?auto_34877 ) ( IS-CRATE ?auto_34877 ) ( not ( = ?auto_34876 ?auto_34877 ) ) )
    :subtasks
    ( ( !DROP ?auto_34878 ?auto_34877 ?auto_34876 ?auto_34879 )
      ( MAKE-1CRATE-VERIFY ?auto_34876 ?auto_34877 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34880 - SURFACE
      ?auto_34881 - SURFACE
      ?auto_34882 - SURFACE
    )
    :vars
    (
      ?auto_34883 - HOIST
      ?auto_34884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34883 ?auto_34884 ) ( SURFACE-AT ?auto_34881 ?auto_34884 ) ( CLEAR ?auto_34881 ) ( LIFTING ?auto_34883 ?auto_34882 ) ( IS-CRATE ?auto_34882 ) ( not ( = ?auto_34881 ?auto_34882 ) ) ( ON ?auto_34881 ?auto_34880 ) ( not ( = ?auto_34880 ?auto_34881 ) ) ( not ( = ?auto_34880 ?auto_34882 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34881 ?auto_34882 )
      ( MAKE-2CRATE-VERIFY ?auto_34880 ?auto_34881 ?auto_34882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34885 - SURFACE
      ?auto_34886 - SURFACE
      ?auto_34887 - SURFACE
      ?auto_34888 - SURFACE
    )
    :vars
    (
      ?auto_34889 - HOIST
      ?auto_34890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34889 ?auto_34890 ) ( SURFACE-AT ?auto_34887 ?auto_34890 ) ( CLEAR ?auto_34887 ) ( LIFTING ?auto_34889 ?auto_34888 ) ( IS-CRATE ?auto_34888 ) ( not ( = ?auto_34887 ?auto_34888 ) ) ( ON ?auto_34886 ?auto_34885 ) ( ON ?auto_34887 ?auto_34886 ) ( not ( = ?auto_34885 ?auto_34886 ) ) ( not ( = ?auto_34885 ?auto_34887 ) ) ( not ( = ?auto_34885 ?auto_34888 ) ) ( not ( = ?auto_34886 ?auto_34887 ) ) ( not ( = ?auto_34886 ?auto_34888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34887 ?auto_34888 )
      ( MAKE-3CRATE-VERIFY ?auto_34885 ?auto_34886 ?auto_34887 ?auto_34888 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34891 - SURFACE
      ?auto_34892 - SURFACE
      ?auto_34893 - SURFACE
      ?auto_34894 - SURFACE
      ?auto_34895 - SURFACE
    )
    :vars
    (
      ?auto_34896 - HOIST
      ?auto_34897 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34896 ?auto_34897 ) ( SURFACE-AT ?auto_34894 ?auto_34897 ) ( CLEAR ?auto_34894 ) ( LIFTING ?auto_34896 ?auto_34895 ) ( IS-CRATE ?auto_34895 ) ( not ( = ?auto_34894 ?auto_34895 ) ) ( ON ?auto_34892 ?auto_34891 ) ( ON ?auto_34893 ?auto_34892 ) ( ON ?auto_34894 ?auto_34893 ) ( not ( = ?auto_34891 ?auto_34892 ) ) ( not ( = ?auto_34891 ?auto_34893 ) ) ( not ( = ?auto_34891 ?auto_34894 ) ) ( not ( = ?auto_34891 ?auto_34895 ) ) ( not ( = ?auto_34892 ?auto_34893 ) ) ( not ( = ?auto_34892 ?auto_34894 ) ) ( not ( = ?auto_34892 ?auto_34895 ) ) ( not ( = ?auto_34893 ?auto_34894 ) ) ( not ( = ?auto_34893 ?auto_34895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34894 ?auto_34895 )
      ( MAKE-4CRATE-VERIFY ?auto_34891 ?auto_34892 ?auto_34893 ?auto_34894 ?auto_34895 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34898 - SURFACE
      ?auto_34899 - SURFACE
      ?auto_34900 - SURFACE
      ?auto_34901 - SURFACE
      ?auto_34902 - SURFACE
      ?auto_34903 - SURFACE
    )
    :vars
    (
      ?auto_34904 - HOIST
      ?auto_34905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34904 ?auto_34905 ) ( SURFACE-AT ?auto_34902 ?auto_34905 ) ( CLEAR ?auto_34902 ) ( LIFTING ?auto_34904 ?auto_34903 ) ( IS-CRATE ?auto_34903 ) ( not ( = ?auto_34902 ?auto_34903 ) ) ( ON ?auto_34899 ?auto_34898 ) ( ON ?auto_34900 ?auto_34899 ) ( ON ?auto_34901 ?auto_34900 ) ( ON ?auto_34902 ?auto_34901 ) ( not ( = ?auto_34898 ?auto_34899 ) ) ( not ( = ?auto_34898 ?auto_34900 ) ) ( not ( = ?auto_34898 ?auto_34901 ) ) ( not ( = ?auto_34898 ?auto_34902 ) ) ( not ( = ?auto_34898 ?auto_34903 ) ) ( not ( = ?auto_34899 ?auto_34900 ) ) ( not ( = ?auto_34899 ?auto_34901 ) ) ( not ( = ?auto_34899 ?auto_34902 ) ) ( not ( = ?auto_34899 ?auto_34903 ) ) ( not ( = ?auto_34900 ?auto_34901 ) ) ( not ( = ?auto_34900 ?auto_34902 ) ) ( not ( = ?auto_34900 ?auto_34903 ) ) ( not ( = ?auto_34901 ?auto_34902 ) ) ( not ( = ?auto_34901 ?auto_34903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34902 ?auto_34903 )
      ( MAKE-5CRATE-VERIFY ?auto_34898 ?auto_34899 ?auto_34900 ?auto_34901 ?auto_34902 ?auto_34903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34906 - SURFACE
      ?auto_34907 - SURFACE
    )
    :vars
    (
      ?auto_34908 - HOIST
      ?auto_34909 - PLACE
      ?auto_34910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34908 ?auto_34909 ) ( SURFACE-AT ?auto_34906 ?auto_34909 ) ( CLEAR ?auto_34906 ) ( IS-CRATE ?auto_34907 ) ( not ( = ?auto_34906 ?auto_34907 ) ) ( TRUCK-AT ?auto_34910 ?auto_34909 ) ( AVAILABLE ?auto_34908 ) ( IN ?auto_34907 ?auto_34910 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34908 ?auto_34907 ?auto_34910 ?auto_34909 )
      ( MAKE-1CRATE ?auto_34906 ?auto_34907 )
      ( MAKE-1CRATE-VERIFY ?auto_34906 ?auto_34907 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34911 - SURFACE
      ?auto_34912 - SURFACE
      ?auto_34913 - SURFACE
    )
    :vars
    (
      ?auto_34914 - HOIST
      ?auto_34916 - PLACE
      ?auto_34915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34914 ?auto_34916 ) ( SURFACE-AT ?auto_34912 ?auto_34916 ) ( CLEAR ?auto_34912 ) ( IS-CRATE ?auto_34913 ) ( not ( = ?auto_34912 ?auto_34913 ) ) ( TRUCK-AT ?auto_34915 ?auto_34916 ) ( AVAILABLE ?auto_34914 ) ( IN ?auto_34913 ?auto_34915 ) ( ON ?auto_34912 ?auto_34911 ) ( not ( = ?auto_34911 ?auto_34912 ) ) ( not ( = ?auto_34911 ?auto_34913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34912 ?auto_34913 )
      ( MAKE-2CRATE-VERIFY ?auto_34911 ?auto_34912 ?auto_34913 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34917 - SURFACE
      ?auto_34918 - SURFACE
      ?auto_34919 - SURFACE
      ?auto_34920 - SURFACE
    )
    :vars
    (
      ?auto_34921 - HOIST
      ?auto_34923 - PLACE
      ?auto_34922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34921 ?auto_34923 ) ( SURFACE-AT ?auto_34919 ?auto_34923 ) ( CLEAR ?auto_34919 ) ( IS-CRATE ?auto_34920 ) ( not ( = ?auto_34919 ?auto_34920 ) ) ( TRUCK-AT ?auto_34922 ?auto_34923 ) ( AVAILABLE ?auto_34921 ) ( IN ?auto_34920 ?auto_34922 ) ( ON ?auto_34919 ?auto_34918 ) ( not ( = ?auto_34918 ?auto_34919 ) ) ( not ( = ?auto_34918 ?auto_34920 ) ) ( ON ?auto_34918 ?auto_34917 ) ( not ( = ?auto_34917 ?auto_34918 ) ) ( not ( = ?auto_34917 ?auto_34919 ) ) ( not ( = ?auto_34917 ?auto_34920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34918 ?auto_34919 ?auto_34920 )
      ( MAKE-3CRATE-VERIFY ?auto_34917 ?auto_34918 ?auto_34919 ?auto_34920 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34924 - SURFACE
      ?auto_34925 - SURFACE
      ?auto_34926 - SURFACE
      ?auto_34927 - SURFACE
      ?auto_34928 - SURFACE
    )
    :vars
    (
      ?auto_34929 - HOIST
      ?auto_34931 - PLACE
      ?auto_34930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34929 ?auto_34931 ) ( SURFACE-AT ?auto_34927 ?auto_34931 ) ( CLEAR ?auto_34927 ) ( IS-CRATE ?auto_34928 ) ( not ( = ?auto_34927 ?auto_34928 ) ) ( TRUCK-AT ?auto_34930 ?auto_34931 ) ( AVAILABLE ?auto_34929 ) ( IN ?auto_34928 ?auto_34930 ) ( ON ?auto_34927 ?auto_34926 ) ( not ( = ?auto_34926 ?auto_34927 ) ) ( not ( = ?auto_34926 ?auto_34928 ) ) ( ON ?auto_34925 ?auto_34924 ) ( ON ?auto_34926 ?auto_34925 ) ( not ( = ?auto_34924 ?auto_34925 ) ) ( not ( = ?auto_34924 ?auto_34926 ) ) ( not ( = ?auto_34924 ?auto_34927 ) ) ( not ( = ?auto_34924 ?auto_34928 ) ) ( not ( = ?auto_34925 ?auto_34926 ) ) ( not ( = ?auto_34925 ?auto_34927 ) ) ( not ( = ?auto_34925 ?auto_34928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34926 ?auto_34927 ?auto_34928 )
      ( MAKE-4CRATE-VERIFY ?auto_34924 ?auto_34925 ?auto_34926 ?auto_34927 ?auto_34928 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34932 - SURFACE
      ?auto_34933 - SURFACE
      ?auto_34934 - SURFACE
      ?auto_34935 - SURFACE
      ?auto_34936 - SURFACE
      ?auto_34937 - SURFACE
    )
    :vars
    (
      ?auto_34938 - HOIST
      ?auto_34940 - PLACE
      ?auto_34939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34938 ?auto_34940 ) ( SURFACE-AT ?auto_34936 ?auto_34940 ) ( CLEAR ?auto_34936 ) ( IS-CRATE ?auto_34937 ) ( not ( = ?auto_34936 ?auto_34937 ) ) ( TRUCK-AT ?auto_34939 ?auto_34940 ) ( AVAILABLE ?auto_34938 ) ( IN ?auto_34937 ?auto_34939 ) ( ON ?auto_34936 ?auto_34935 ) ( not ( = ?auto_34935 ?auto_34936 ) ) ( not ( = ?auto_34935 ?auto_34937 ) ) ( ON ?auto_34933 ?auto_34932 ) ( ON ?auto_34934 ?auto_34933 ) ( ON ?auto_34935 ?auto_34934 ) ( not ( = ?auto_34932 ?auto_34933 ) ) ( not ( = ?auto_34932 ?auto_34934 ) ) ( not ( = ?auto_34932 ?auto_34935 ) ) ( not ( = ?auto_34932 ?auto_34936 ) ) ( not ( = ?auto_34932 ?auto_34937 ) ) ( not ( = ?auto_34933 ?auto_34934 ) ) ( not ( = ?auto_34933 ?auto_34935 ) ) ( not ( = ?auto_34933 ?auto_34936 ) ) ( not ( = ?auto_34933 ?auto_34937 ) ) ( not ( = ?auto_34934 ?auto_34935 ) ) ( not ( = ?auto_34934 ?auto_34936 ) ) ( not ( = ?auto_34934 ?auto_34937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34935 ?auto_34936 ?auto_34937 )
      ( MAKE-5CRATE-VERIFY ?auto_34932 ?auto_34933 ?auto_34934 ?auto_34935 ?auto_34936 ?auto_34937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34941 - SURFACE
      ?auto_34942 - SURFACE
    )
    :vars
    (
      ?auto_34943 - HOIST
      ?auto_34945 - PLACE
      ?auto_34944 - TRUCK
      ?auto_34946 - SURFACE
      ?auto_34947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34943 ?auto_34945 ) ( SURFACE-AT ?auto_34941 ?auto_34945 ) ( CLEAR ?auto_34941 ) ( IS-CRATE ?auto_34942 ) ( not ( = ?auto_34941 ?auto_34942 ) ) ( AVAILABLE ?auto_34943 ) ( IN ?auto_34942 ?auto_34944 ) ( ON ?auto_34941 ?auto_34946 ) ( not ( = ?auto_34946 ?auto_34941 ) ) ( not ( = ?auto_34946 ?auto_34942 ) ) ( TRUCK-AT ?auto_34944 ?auto_34947 ) ( not ( = ?auto_34947 ?auto_34945 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34944 ?auto_34947 ?auto_34945 )
      ( MAKE-2CRATE ?auto_34946 ?auto_34941 ?auto_34942 )
      ( MAKE-1CRATE-VERIFY ?auto_34941 ?auto_34942 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34948 - SURFACE
      ?auto_34949 - SURFACE
      ?auto_34950 - SURFACE
    )
    :vars
    (
      ?auto_34953 - HOIST
      ?auto_34954 - PLACE
      ?auto_34952 - TRUCK
      ?auto_34951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34953 ?auto_34954 ) ( SURFACE-AT ?auto_34949 ?auto_34954 ) ( CLEAR ?auto_34949 ) ( IS-CRATE ?auto_34950 ) ( not ( = ?auto_34949 ?auto_34950 ) ) ( AVAILABLE ?auto_34953 ) ( IN ?auto_34950 ?auto_34952 ) ( ON ?auto_34949 ?auto_34948 ) ( not ( = ?auto_34948 ?auto_34949 ) ) ( not ( = ?auto_34948 ?auto_34950 ) ) ( TRUCK-AT ?auto_34952 ?auto_34951 ) ( not ( = ?auto_34951 ?auto_34954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34949 ?auto_34950 )
      ( MAKE-2CRATE-VERIFY ?auto_34948 ?auto_34949 ?auto_34950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34955 - SURFACE
      ?auto_34956 - SURFACE
      ?auto_34957 - SURFACE
      ?auto_34958 - SURFACE
    )
    :vars
    (
      ?auto_34959 - HOIST
      ?auto_34960 - PLACE
      ?auto_34962 - TRUCK
      ?auto_34961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34959 ?auto_34960 ) ( SURFACE-AT ?auto_34957 ?auto_34960 ) ( CLEAR ?auto_34957 ) ( IS-CRATE ?auto_34958 ) ( not ( = ?auto_34957 ?auto_34958 ) ) ( AVAILABLE ?auto_34959 ) ( IN ?auto_34958 ?auto_34962 ) ( ON ?auto_34957 ?auto_34956 ) ( not ( = ?auto_34956 ?auto_34957 ) ) ( not ( = ?auto_34956 ?auto_34958 ) ) ( TRUCK-AT ?auto_34962 ?auto_34961 ) ( not ( = ?auto_34961 ?auto_34960 ) ) ( ON ?auto_34956 ?auto_34955 ) ( not ( = ?auto_34955 ?auto_34956 ) ) ( not ( = ?auto_34955 ?auto_34957 ) ) ( not ( = ?auto_34955 ?auto_34958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34956 ?auto_34957 ?auto_34958 )
      ( MAKE-3CRATE-VERIFY ?auto_34955 ?auto_34956 ?auto_34957 ?auto_34958 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34963 - SURFACE
      ?auto_34964 - SURFACE
      ?auto_34965 - SURFACE
      ?auto_34966 - SURFACE
      ?auto_34967 - SURFACE
    )
    :vars
    (
      ?auto_34968 - HOIST
      ?auto_34969 - PLACE
      ?auto_34971 - TRUCK
      ?auto_34970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34968 ?auto_34969 ) ( SURFACE-AT ?auto_34966 ?auto_34969 ) ( CLEAR ?auto_34966 ) ( IS-CRATE ?auto_34967 ) ( not ( = ?auto_34966 ?auto_34967 ) ) ( AVAILABLE ?auto_34968 ) ( IN ?auto_34967 ?auto_34971 ) ( ON ?auto_34966 ?auto_34965 ) ( not ( = ?auto_34965 ?auto_34966 ) ) ( not ( = ?auto_34965 ?auto_34967 ) ) ( TRUCK-AT ?auto_34971 ?auto_34970 ) ( not ( = ?auto_34970 ?auto_34969 ) ) ( ON ?auto_34964 ?auto_34963 ) ( ON ?auto_34965 ?auto_34964 ) ( not ( = ?auto_34963 ?auto_34964 ) ) ( not ( = ?auto_34963 ?auto_34965 ) ) ( not ( = ?auto_34963 ?auto_34966 ) ) ( not ( = ?auto_34963 ?auto_34967 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( not ( = ?auto_34964 ?auto_34966 ) ) ( not ( = ?auto_34964 ?auto_34967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34965 ?auto_34966 ?auto_34967 )
      ( MAKE-4CRATE-VERIFY ?auto_34963 ?auto_34964 ?auto_34965 ?auto_34966 ?auto_34967 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34972 - SURFACE
      ?auto_34973 - SURFACE
      ?auto_34974 - SURFACE
      ?auto_34975 - SURFACE
      ?auto_34976 - SURFACE
      ?auto_34977 - SURFACE
    )
    :vars
    (
      ?auto_34978 - HOIST
      ?auto_34979 - PLACE
      ?auto_34981 - TRUCK
      ?auto_34980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34978 ?auto_34979 ) ( SURFACE-AT ?auto_34976 ?auto_34979 ) ( CLEAR ?auto_34976 ) ( IS-CRATE ?auto_34977 ) ( not ( = ?auto_34976 ?auto_34977 ) ) ( AVAILABLE ?auto_34978 ) ( IN ?auto_34977 ?auto_34981 ) ( ON ?auto_34976 ?auto_34975 ) ( not ( = ?auto_34975 ?auto_34976 ) ) ( not ( = ?auto_34975 ?auto_34977 ) ) ( TRUCK-AT ?auto_34981 ?auto_34980 ) ( not ( = ?auto_34980 ?auto_34979 ) ) ( ON ?auto_34973 ?auto_34972 ) ( ON ?auto_34974 ?auto_34973 ) ( ON ?auto_34975 ?auto_34974 ) ( not ( = ?auto_34972 ?auto_34973 ) ) ( not ( = ?auto_34972 ?auto_34974 ) ) ( not ( = ?auto_34972 ?auto_34975 ) ) ( not ( = ?auto_34972 ?auto_34976 ) ) ( not ( = ?auto_34972 ?auto_34977 ) ) ( not ( = ?auto_34973 ?auto_34974 ) ) ( not ( = ?auto_34973 ?auto_34975 ) ) ( not ( = ?auto_34973 ?auto_34976 ) ) ( not ( = ?auto_34973 ?auto_34977 ) ) ( not ( = ?auto_34974 ?auto_34975 ) ) ( not ( = ?auto_34974 ?auto_34976 ) ) ( not ( = ?auto_34974 ?auto_34977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34975 ?auto_34976 ?auto_34977 )
      ( MAKE-5CRATE-VERIFY ?auto_34972 ?auto_34973 ?auto_34974 ?auto_34975 ?auto_34976 ?auto_34977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34982 - SURFACE
      ?auto_34983 - SURFACE
    )
    :vars
    (
      ?auto_34984 - HOIST
      ?auto_34985 - PLACE
      ?auto_34987 - SURFACE
      ?auto_34988 - TRUCK
      ?auto_34986 - PLACE
      ?auto_34989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34984 ?auto_34985 ) ( SURFACE-AT ?auto_34982 ?auto_34985 ) ( CLEAR ?auto_34982 ) ( IS-CRATE ?auto_34983 ) ( not ( = ?auto_34982 ?auto_34983 ) ) ( AVAILABLE ?auto_34984 ) ( ON ?auto_34982 ?auto_34987 ) ( not ( = ?auto_34987 ?auto_34982 ) ) ( not ( = ?auto_34987 ?auto_34983 ) ) ( TRUCK-AT ?auto_34988 ?auto_34986 ) ( not ( = ?auto_34986 ?auto_34985 ) ) ( HOIST-AT ?auto_34989 ?auto_34986 ) ( LIFTING ?auto_34989 ?auto_34983 ) ( not ( = ?auto_34984 ?auto_34989 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34989 ?auto_34983 ?auto_34988 ?auto_34986 )
      ( MAKE-2CRATE ?auto_34987 ?auto_34982 ?auto_34983 )
      ( MAKE-1CRATE-VERIFY ?auto_34982 ?auto_34983 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34990 - SURFACE
      ?auto_34991 - SURFACE
      ?auto_34992 - SURFACE
    )
    :vars
    (
      ?auto_34995 - HOIST
      ?auto_34993 - PLACE
      ?auto_34996 - TRUCK
      ?auto_34994 - PLACE
      ?auto_34997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34995 ?auto_34993 ) ( SURFACE-AT ?auto_34991 ?auto_34993 ) ( CLEAR ?auto_34991 ) ( IS-CRATE ?auto_34992 ) ( not ( = ?auto_34991 ?auto_34992 ) ) ( AVAILABLE ?auto_34995 ) ( ON ?auto_34991 ?auto_34990 ) ( not ( = ?auto_34990 ?auto_34991 ) ) ( not ( = ?auto_34990 ?auto_34992 ) ) ( TRUCK-AT ?auto_34996 ?auto_34994 ) ( not ( = ?auto_34994 ?auto_34993 ) ) ( HOIST-AT ?auto_34997 ?auto_34994 ) ( LIFTING ?auto_34997 ?auto_34992 ) ( not ( = ?auto_34995 ?auto_34997 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34991 ?auto_34992 )
      ( MAKE-2CRATE-VERIFY ?auto_34990 ?auto_34991 ?auto_34992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34998 - SURFACE
      ?auto_34999 - SURFACE
      ?auto_35000 - SURFACE
      ?auto_35001 - SURFACE
    )
    :vars
    (
      ?auto_35003 - HOIST
      ?auto_35006 - PLACE
      ?auto_35005 - TRUCK
      ?auto_35004 - PLACE
      ?auto_35002 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35003 ?auto_35006 ) ( SURFACE-AT ?auto_35000 ?auto_35006 ) ( CLEAR ?auto_35000 ) ( IS-CRATE ?auto_35001 ) ( not ( = ?auto_35000 ?auto_35001 ) ) ( AVAILABLE ?auto_35003 ) ( ON ?auto_35000 ?auto_34999 ) ( not ( = ?auto_34999 ?auto_35000 ) ) ( not ( = ?auto_34999 ?auto_35001 ) ) ( TRUCK-AT ?auto_35005 ?auto_35004 ) ( not ( = ?auto_35004 ?auto_35006 ) ) ( HOIST-AT ?auto_35002 ?auto_35004 ) ( LIFTING ?auto_35002 ?auto_35001 ) ( not ( = ?auto_35003 ?auto_35002 ) ) ( ON ?auto_34999 ?auto_34998 ) ( not ( = ?auto_34998 ?auto_34999 ) ) ( not ( = ?auto_34998 ?auto_35000 ) ) ( not ( = ?auto_34998 ?auto_35001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34999 ?auto_35000 ?auto_35001 )
      ( MAKE-3CRATE-VERIFY ?auto_34998 ?auto_34999 ?auto_35000 ?auto_35001 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35007 - SURFACE
      ?auto_35008 - SURFACE
      ?auto_35009 - SURFACE
      ?auto_35010 - SURFACE
      ?auto_35011 - SURFACE
    )
    :vars
    (
      ?auto_35013 - HOIST
      ?auto_35016 - PLACE
      ?auto_35015 - TRUCK
      ?auto_35014 - PLACE
      ?auto_35012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35013 ?auto_35016 ) ( SURFACE-AT ?auto_35010 ?auto_35016 ) ( CLEAR ?auto_35010 ) ( IS-CRATE ?auto_35011 ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( AVAILABLE ?auto_35013 ) ( ON ?auto_35010 ?auto_35009 ) ( not ( = ?auto_35009 ?auto_35010 ) ) ( not ( = ?auto_35009 ?auto_35011 ) ) ( TRUCK-AT ?auto_35015 ?auto_35014 ) ( not ( = ?auto_35014 ?auto_35016 ) ) ( HOIST-AT ?auto_35012 ?auto_35014 ) ( LIFTING ?auto_35012 ?auto_35011 ) ( not ( = ?auto_35013 ?auto_35012 ) ) ( ON ?auto_35008 ?auto_35007 ) ( ON ?auto_35009 ?auto_35008 ) ( not ( = ?auto_35007 ?auto_35008 ) ) ( not ( = ?auto_35007 ?auto_35009 ) ) ( not ( = ?auto_35007 ?auto_35010 ) ) ( not ( = ?auto_35007 ?auto_35011 ) ) ( not ( = ?auto_35008 ?auto_35009 ) ) ( not ( = ?auto_35008 ?auto_35010 ) ) ( not ( = ?auto_35008 ?auto_35011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35009 ?auto_35010 ?auto_35011 )
      ( MAKE-4CRATE-VERIFY ?auto_35007 ?auto_35008 ?auto_35009 ?auto_35010 ?auto_35011 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35017 - SURFACE
      ?auto_35018 - SURFACE
      ?auto_35019 - SURFACE
      ?auto_35020 - SURFACE
      ?auto_35021 - SURFACE
      ?auto_35022 - SURFACE
    )
    :vars
    (
      ?auto_35024 - HOIST
      ?auto_35027 - PLACE
      ?auto_35026 - TRUCK
      ?auto_35025 - PLACE
      ?auto_35023 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35024 ?auto_35027 ) ( SURFACE-AT ?auto_35021 ?auto_35027 ) ( CLEAR ?auto_35021 ) ( IS-CRATE ?auto_35022 ) ( not ( = ?auto_35021 ?auto_35022 ) ) ( AVAILABLE ?auto_35024 ) ( ON ?auto_35021 ?auto_35020 ) ( not ( = ?auto_35020 ?auto_35021 ) ) ( not ( = ?auto_35020 ?auto_35022 ) ) ( TRUCK-AT ?auto_35026 ?auto_35025 ) ( not ( = ?auto_35025 ?auto_35027 ) ) ( HOIST-AT ?auto_35023 ?auto_35025 ) ( LIFTING ?auto_35023 ?auto_35022 ) ( not ( = ?auto_35024 ?auto_35023 ) ) ( ON ?auto_35018 ?auto_35017 ) ( ON ?auto_35019 ?auto_35018 ) ( ON ?auto_35020 ?auto_35019 ) ( not ( = ?auto_35017 ?auto_35018 ) ) ( not ( = ?auto_35017 ?auto_35019 ) ) ( not ( = ?auto_35017 ?auto_35020 ) ) ( not ( = ?auto_35017 ?auto_35021 ) ) ( not ( = ?auto_35017 ?auto_35022 ) ) ( not ( = ?auto_35018 ?auto_35019 ) ) ( not ( = ?auto_35018 ?auto_35020 ) ) ( not ( = ?auto_35018 ?auto_35021 ) ) ( not ( = ?auto_35018 ?auto_35022 ) ) ( not ( = ?auto_35019 ?auto_35020 ) ) ( not ( = ?auto_35019 ?auto_35021 ) ) ( not ( = ?auto_35019 ?auto_35022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35020 ?auto_35021 ?auto_35022 )
      ( MAKE-5CRATE-VERIFY ?auto_35017 ?auto_35018 ?auto_35019 ?auto_35020 ?auto_35021 ?auto_35022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35028 - SURFACE
      ?auto_35029 - SURFACE
    )
    :vars
    (
      ?auto_35032 - HOIST
      ?auto_35035 - PLACE
      ?auto_35030 - SURFACE
      ?auto_35034 - TRUCK
      ?auto_35033 - PLACE
      ?auto_35031 - HOIST
      ?auto_35036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35032 ?auto_35035 ) ( SURFACE-AT ?auto_35028 ?auto_35035 ) ( CLEAR ?auto_35028 ) ( IS-CRATE ?auto_35029 ) ( not ( = ?auto_35028 ?auto_35029 ) ) ( AVAILABLE ?auto_35032 ) ( ON ?auto_35028 ?auto_35030 ) ( not ( = ?auto_35030 ?auto_35028 ) ) ( not ( = ?auto_35030 ?auto_35029 ) ) ( TRUCK-AT ?auto_35034 ?auto_35033 ) ( not ( = ?auto_35033 ?auto_35035 ) ) ( HOIST-AT ?auto_35031 ?auto_35033 ) ( not ( = ?auto_35032 ?auto_35031 ) ) ( AVAILABLE ?auto_35031 ) ( SURFACE-AT ?auto_35029 ?auto_35033 ) ( ON ?auto_35029 ?auto_35036 ) ( CLEAR ?auto_35029 ) ( not ( = ?auto_35028 ?auto_35036 ) ) ( not ( = ?auto_35029 ?auto_35036 ) ) ( not ( = ?auto_35030 ?auto_35036 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35031 ?auto_35029 ?auto_35036 ?auto_35033 )
      ( MAKE-2CRATE ?auto_35030 ?auto_35028 ?auto_35029 )
      ( MAKE-1CRATE-VERIFY ?auto_35028 ?auto_35029 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35037 - SURFACE
      ?auto_35038 - SURFACE
      ?auto_35039 - SURFACE
    )
    :vars
    (
      ?auto_35041 - HOIST
      ?auto_35040 - PLACE
      ?auto_35044 - TRUCK
      ?auto_35043 - PLACE
      ?auto_35042 - HOIST
      ?auto_35045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35041 ?auto_35040 ) ( SURFACE-AT ?auto_35038 ?auto_35040 ) ( CLEAR ?auto_35038 ) ( IS-CRATE ?auto_35039 ) ( not ( = ?auto_35038 ?auto_35039 ) ) ( AVAILABLE ?auto_35041 ) ( ON ?auto_35038 ?auto_35037 ) ( not ( = ?auto_35037 ?auto_35038 ) ) ( not ( = ?auto_35037 ?auto_35039 ) ) ( TRUCK-AT ?auto_35044 ?auto_35043 ) ( not ( = ?auto_35043 ?auto_35040 ) ) ( HOIST-AT ?auto_35042 ?auto_35043 ) ( not ( = ?auto_35041 ?auto_35042 ) ) ( AVAILABLE ?auto_35042 ) ( SURFACE-AT ?auto_35039 ?auto_35043 ) ( ON ?auto_35039 ?auto_35045 ) ( CLEAR ?auto_35039 ) ( not ( = ?auto_35038 ?auto_35045 ) ) ( not ( = ?auto_35039 ?auto_35045 ) ) ( not ( = ?auto_35037 ?auto_35045 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35038 ?auto_35039 )
      ( MAKE-2CRATE-VERIFY ?auto_35037 ?auto_35038 ?auto_35039 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35046 - SURFACE
      ?auto_35047 - SURFACE
      ?auto_35048 - SURFACE
      ?auto_35049 - SURFACE
    )
    :vars
    (
      ?auto_35054 - HOIST
      ?auto_35053 - PLACE
      ?auto_35055 - TRUCK
      ?auto_35051 - PLACE
      ?auto_35050 - HOIST
      ?auto_35052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35054 ?auto_35053 ) ( SURFACE-AT ?auto_35048 ?auto_35053 ) ( CLEAR ?auto_35048 ) ( IS-CRATE ?auto_35049 ) ( not ( = ?auto_35048 ?auto_35049 ) ) ( AVAILABLE ?auto_35054 ) ( ON ?auto_35048 ?auto_35047 ) ( not ( = ?auto_35047 ?auto_35048 ) ) ( not ( = ?auto_35047 ?auto_35049 ) ) ( TRUCK-AT ?auto_35055 ?auto_35051 ) ( not ( = ?auto_35051 ?auto_35053 ) ) ( HOIST-AT ?auto_35050 ?auto_35051 ) ( not ( = ?auto_35054 ?auto_35050 ) ) ( AVAILABLE ?auto_35050 ) ( SURFACE-AT ?auto_35049 ?auto_35051 ) ( ON ?auto_35049 ?auto_35052 ) ( CLEAR ?auto_35049 ) ( not ( = ?auto_35048 ?auto_35052 ) ) ( not ( = ?auto_35049 ?auto_35052 ) ) ( not ( = ?auto_35047 ?auto_35052 ) ) ( ON ?auto_35047 ?auto_35046 ) ( not ( = ?auto_35046 ?auto_35047 ) ) ( not ( = ?auto_35046 ?auto_35048 ) ) ( not ( = ?auto_35046 ?auto_35049 ) ) ( not ( = ?auto_35046 ?auto_35052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35047 ?auto_35048 ?auto_35049 )
      ( MAKE-3CRATE-VERIFY ?auto_35046 ?auto_35047 ?auto_35048 ?auto_35049 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35056 - SURFACE
      ?auto_35057 - SURFACE
      ?auto_35058 - SURFACE
      ?auto_35059 - SURFACE
      ?auto_35060 - SURFACE
    )
    :vars
    (
      ?auto_35065 - HOIST
      ?auto_35064 - PLACE
      ?auto_35066 - TRUCK
      ?auto_35062 - PLACE
      ?auto_35061 - HOIST
      ?auto_35063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35065 ?auto_35064 ) ( SURFACE-AT ?auto_35059 ?auto_35064 ) ( CLEAR ?auto_35059 ) ( IS-CRATE ?auto_35060 ) ( not ( = ?auto_35059 ?auto_35060 ) ) ( AVAILABLE ?auto_35065 ) ( ON ?auto_35059 ?auto_35058 ) ( not ( = ?auto_35058 ?auto_35059 ) ) ( not ( = ?auto_35058 ?auto_35060 ) ) ( TRUCK-AT ?auto_35066 ?auto_35062 ) ( not ( = ?auto_35062 ?auto_35064 ) ) ( HOIST-AT ?auto_35061 ?auto_35062 ) ( not ( = ?auto_35065 ?auto_35061 ) ) ( AVAILABLE ?auto_35061 ) ( SURFACE-AT ?auto_35060 ?auto_35062 ) ( ON ?auto_35060 ?auto_35063 ) ( CLEAR ?auto_35060 ) ( not ( = ?auto_35059 ?auto_35063 ) ) ( not ( = ?auto_35060 ?auto_35063 ) ) ( not ( = ?auto_35058 ?auto_35063 ) ) ( ON ?auto_35057 ?auto_35056 ) ( ON ?auto_35058 ?auto_35057 ) ( not ( = ?auto_35056 ?auto_35057 ) ) ( not ( = ?auto_35056 ?auto_35058 ) ) ( not ( = ?auto_35056 ?auto_35059 ) ) ( not ( = ?auto_35056 ?auto_35060 ) ) ( not ( = ?auto_35056 ?auto_35063 ) ) ( not ( = ?auto_35057 ?auto_35058 ) ) ( not ( = ?auto_35057 ?auto_35059 ) ) ( not ( = ?auto_35057 ?auto_35060 ) ) ( not ( = ?auto_35057 ?auto_35063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35058 ?auto_35059 ?auto_35060 )
      ( MAKE-4CRATE-VERIFY ?auto_35056 ?auto_35057 ?auto_35058 ?auto_35059 ?auto_35060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35067 - SURFACE
      ?auto_35068 - SURFACE
      ?auto_35069 - SURFACE
      ?auto_35070 - SURFACE
      ?auto_35071 - SURFACE
      ?auto_35072 - SURFACE
    )
    :vars
    (
      ?auto_35077 - HOIST
      ?auto_35076 - PLACE
      ?auto_35078 - TRUCK
      ?auto_35074 - PLACE
      ?auto_35073 - HOIST
      ?auto_35075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35077 ?auto_35076 ) ( SURFACE-AT ?auto_35071 ?auto_35076 ) ( CLEAR ?auto_35071 ) ( IS-CRATE ?auto_35072 ) ( not ( = ?auto_35071 ?auto_35072 ) ) ( AVAILABLE ?auto_35077 ) ( ON ?auto_35071 ?auto_35070 ) ( not ( = ?auto_35070 ?auto_35071 ) ) ( not ( = ?auto_35070 ?auto_35072 ) ) ( TRUCK-AT ?auto_35078 ?auto_35074 ) ( not ( = ?auto_35074 ?auto_35076 ) ) ( HOIST-AT ?auto_35073 ?auto_35074 ) ( not ( = ?auto_35077 ?auto_35073 ) ) ( AVAILABLE ?auto_35073 ) ( SURFACE-AT ?auto_35072 ?auto_35074 ) ( ON ?auto_35072 ?auto_35075 ) ( CLEAR ?auto_35072 ) ( not ( = ?auto_35071 ?auto_35075 ) ) ( not ( = ?auto_35072 ?auto_35075 ) ) ( not ( = ?auto_35070 ?auto_35075 ) ) ( ON ?auto_35068 ?auto_35067 ) ( ON ?auto_35069 ?auto_35068 ) ( ON ?auto_35070 ?auto_35069 ) ( not ( = ?auto_35067 ?auto_35068 ) ) ( not ( = ?auto_35067 ?auto_35069 ) ) ( not ( = ?auto_35067 ?auto_35070 ) ) ( not ( = ?auto_35067 ?auto_35071 ) ) ( not ( = ?auto_35067 ?auto_35072 ) ) ( not ( = ?auto_35067 ?auto_35075 ) ) ( not ( = ?auto_35068 ?auto_35069 ) ) ( not ( = ?auto_35068 ?auto_35070 ) ) ( not ( = ?auto_35068 ?auto_35071 ) ) ( not ( = ?auto_35068 ?auto_35072 ) ) ( not ( = ?auto_35068 ?auto_35075 ) ) ( not ( = ?auto_35069 ?auto_35070 ) ) ( not ( = ?auto_35069 ?auto_35071 ) ) ( not ( = ?auto_35069 ?auto_35072 ) ) ( not ( = ?auto_35069 ?auto_35075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35070 ?auto_35071 ?auto_35072 )
      ( MAKE-5CRATE-VERIFY ?auto_35067 ?auto_35068 ?auto_35069 ?auto_35070 ?auto_35071 ?auto_35072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35079 - SURFACE
      ?auto_35080 - SURFACE
    )
    :vars
    (
      ?auto_35085 - HOIST
      ?auto_35084 - PLACE
      ?auto_35086 - SURFACE
      ?auto_35082 - PLACE
      ?auto_35081 - HOIST
      ?auto_35083 - SURFACE
      ?auto_35087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35085 ?auto_35084 ) ( SURFACE-AT ?auto_35079 ?auto_35084 ) ( CLEAR ?auto_35079 ) ( IS-CRATE ?auto_35080 ) ( not ( = ?auto_35079 ?auto_35080 ) ) ( AVAILABLE ?auto_35085 ) ( ON ?auto_35079 ?auto_35086 ) ( not ( = ?auto_35086 ?auto_35079 ) ) ( not ( = ?auto_35086 ?auto_35080 ) ) ( not ( = ?auto_35082 ?auto_35084 ) ) ( HOIST-AT ?auto_35081 ?auto_35082 ) ( not ( = ?auto_35085 ?auto_35081 ) ) ( AVAILABLE ?auto_35081 ) ( SURFACE-AT ?auto_35080 ?auto_35082 ) ( ON ?auto_35080 ?auto_35083 ) ( CLEAR ?auto_35080 ) ( not ( = ?auto_35079 ?auto_35083 ) ) ( not ( = ?auto_35080 ?auto_35083 ) ) ( not ( = ?auto_35086 ?auto_35083 ) ) ( TRUCK-AT ?auto_35087 ?auto_35084 ) )
    :subtasks
    ( ( !DRIVE ?auto_35087 ?auto_35084 ?auto_35082 )
      ( MAKE-2CRATE ?auto_35086 ?auto_35079 ?auto_35080 )
      ( MAKE-1CRATE-VERIFY ?auto_35079 ?auto_35080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35088 - SURFACE
      ?auto_35089 - SURFACE
      ?auto_35090 - SURFACE
    )
    :vars
    (
      ?auto_35095 - HOIST
      ?auto_35094 - PLACE
      ?auto_35092 - PLACE
      ?auto_35091 - HOIST
      ?auto_35096 - SURFACE
      ?auto_35093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35095 ?auto_35094 ) ( SURFACE-AT ?auto_35089 ?auto_35094 ) ( CLEAR ?auto_35089 ) ( IS-CRATE ?auto_35090 ) ( not ( = ?auto_35089 ?auto_35090 ) ) ( AVAILABLE ?auto_35095 ) ( ON ?auto_35089 ?auto_35088 ) ( not ( = ?auto_35088 ?auto_35089 ) ) ( not ( = ?auto_35088 ?auto_35090 ) ) ( not ( = ?auto_35092 ?auto_35094 ) ) ( HOIST-AT ?auto_35091 ?auto_35092 ) ( not ( = ?auto_35095 ?auto_35091 ) ) ( AVAILABLE ?auto_35091 ) ( SURFACE-AT ?auto_35090 ?auto_35092 ) ( ON ?auto_35090 ?auto_35096 ) ( CLEAR ?auto_35090 ) ( not ( = ?auto_35089 ?auto_35096 ) ) ( not ( = ?auto_35090 ?auto_35096 ) ) ( not ( = ?auto_35088 ?auto_35096 ) ) ( TRUCK-AT ?auto_35093 ?auto_35094 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35089 ?auto_35090 )
      ( MAKE-2CRATE-VERIFY ?auto_35088 ?auto_35089 ?auto_35090 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35097 - SURFACE
      ?auto_35098 - SURFACE
      ?auto_35099 - SURFACE
      ?auto_35100 - SURFACE
    )
    :vars
    (
      ?auto_35106 - HOIST
      ?auto_35104 - PLACE
      ?auto_35105 - PLACE
      ?auto_35102 - HOIST
      ?auto_35103 - SURFACE
      ?auto_35101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35106 ?auto_35104 ) ( SURFACE-AT ?auto_35099 ?auto_35104 ) ( CLEAR ?auto_35099 ) ( IS-CRATE ?auto_35100 ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( AVAILABLE ?auto_35106 ) ( ON ?auto_35099 ?auto_35098 ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35098 ?auto_35100 ) ) ( not ( = ?auto_35105 ?auto_35104 ) ) ( HOIST-AT ?auto_35102 ?auto_35105 ) ( not ( = ?auto_35106 ?auto_35102 ) ) ( AVAILABLE ?auto_35102 ) ( SURFACE-AT ?auto_35100 ?auto_35105 ) ( ON ?auto_35100 ?auto_35103 ) ( CLEAR ?auto_35100 ) ( not ( = ?auto_35099 ?auto_35103 ) ) ( not ( = ?auto_35100 ?auto_35103 ) ) ( not ( = ?auto_35098 ?auto_35103 ) ) ( TRUCK-AT ?auto_35101 ?auto_35104 ) ( ON ?auto_35098 ?auto_35097 ) ( not ( = ?auto_35097 ?auto_35098 ) ) ( not ( = ?auto_35097 ?auto_35099 ) ) ( not ( = ?auto_35097 ?auto_35100 ) ) ( not ( = ?auto_35097 ?auto_35103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35098 ?auto_35099 ?auto_35100 )
      ( MAKE-3CRATE-VERIFY ?auto_35097 ?auto_35098 ?auto_35099 ?auto_35100 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35107 - SURFACE
      ?auto_35108 - SURFACE
      ?auto_35109 - SURFACE
      ?auto_35110 - SURFACE
      ?auto_35111 - SURFACE
    )
    :vars
    (
      ?auto_35117 - HOIST
      ?auto_35115 - PLACE
      ?auto_35116 - PLACE
      ?auto_35113 - HOIST
      ?auto_35114 - SURFACE
      ?auto_35112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35117 ?auto_35115 ) ( SURFACE-AT ?auto_35110 ?auto_35115 ) ( CLEAR ?auto_35110 ) ( IS-CRATE ?auto_35111 ) ( not ( = ?auto_35110 ?auto_35111 ) ) ( AVAILABLE ?auto_35117 ) ( ON ?auto_35110 ?auto_35109 ) ( not ( = ?auto_35109 ?auto_35110 ) ) ( not ( = ?auto_35109 ?auto_35111 ) ) ( not ( = ?auto_35116 ?auto_35115 ) ) ( HOIST-AT ?auto_35113 ?auto_35116 ) ( not ( = ?auto_35117 ?auto_35113 ) ) ( AVAILABLE ?auto_35113 ) ( SURFACE-AT ?auto_35111 ?auto_35116 ) ( ON ?auto_35111 ?auto_35114 ) ( CLEAR ?auto_35111 ) ( not ( = ?auto_35110 ?auto_35114 ) ) ( not ( = ?auto_35111 ?auto_35114 ) ) ( not ( = ?auto_35109 ?auto_35114 ) ) ( TRUCK-AT ?auto_35112 ?auto_35115 ) ( ON ?auto_35108 ?auto_35107 ) ( ON ?auto_35109 ?auto_35108 ) ( not ( = ?auto_35107 ?auto_35108 ) ) ( not ( = ?auto_35107 ?auto_35109 ) ) ( not ( = ?auto_35107 ?auto_35110 ) ) ( not ( = ?auto_35107 ?auto_35111 ) ) ( not ( = ?auto_35107 ?auto_35114 ) ) ( not ( = ?auto_35108 ?auto_35109 ) ) ( not ( = ?auto_35108 ?auto_35110 ) ) ( not ( = ?auto_35108 ?auto_35111 ) ) ( not ( = ?auto_35108 ?auto_35114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35109 ?auto_35110 ?auto_35111 )
      ( MAKE-4CRATE-VERIFY ?auto_35107 ?auto_35108 ?auto_35109 ?auto_35110 ?auto_35111 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35118 - SURFACE
      ?auto_35119 - SURFACE
      ?auto_35120 - SURFACE
      ?auto_35121 - SURFACE
      ?auto_35122 - SURFACE
      ?auto_35123 - SURFACE
    )
    :vars
    (
      ?auto_35129 - HOIST
      ?auto_35127 - PLACE
      ?auto_35128 - PLACE
      ?auto_35125 - HOIST
      ?auto_35126 - SURFACE
      ?auto_35124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35129 ?auto_35127 ) ( SURFACE-AT ?auto_35122 ?auto_35127 ) ( CLEAR ?auto_35122 ) ( IS-CRATE ?auto_35123 ) ( not ( = ?auto_35122 ?auto_35123 ) ) ( AVAILABLE ?auto_35129 ) ( ON ?auto_35122 ?auto_35121 ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35123 ) ) ( not ( = ?auto_35128 ?auto_35127 ) ) ( HOIST-AT ?auto_35125 ?auto_35128 ) ( not ( = ?auto_35129 ?auto_35125 ) ) ( AVAILABLE ?auto_35125 ) ( SURFACE-AT ?auto_35123 ?auto_35128 ) ( ON ?auto_35123 ?auto_35126 ) ( CLEAR ?auto_35123 ) ( not ( = ?auto_35122 ?auto_35126 ) ) ( not ( = ?auto_35123 ?auto_35126 ) ) ( not ( = ?auto_35121 ?auto_35126 ) ) ( TRUCK-AT ?auto_35124 ?auto_35127 ) ( ON ?auto_35119 ?auto_35118 ) ( ON ?auto_35120 ?auto_35119 ) ( ON ?auto_35121 ?auto_35120 ) ( not ( = ?auto_35118 ?auto_35119 ) ) ( not ( = ?auto_35118 ?auto_35120 ) ) ( not ( = ?auto_35118 ?auto_35121 ) ) ( not ( = ?auto_35118 ?auto_35122 ) ) ( not ( = ?auto_35118 ?auto_35123 ) ) ( not ( = ?auto_35118 ?auto_35126 ) ) ( not ( = ?auto_35119 ?auto_35120 ) ) ( not ( = ?auto_35119 ?auto_35121 ) ) ( not ( = ?auto_35119 ?auto_35122 ) ) ( not ( = ?auto_35119 ?auto_35123 ) ) ( not ( = ?auto_35119 ?auto_35126 ) ) ( not ( = ?auto_35120 ?auto_35121 ) ) ( not ( = ?auto_35120 ?auto_35122 ) ) ( not ( = ?auto_35120 ?auto_35123 ) ) ( not ( = ?auto_35120 ?auto_35126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35121 ?auto_35122 ?auto_35123 )
      ( MAKE-5CRATE-VERIFY ?auto_35118 ?auto_35119 ?auto_35120 ?auto_35121 ?auto_35122 ?auto_35123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35130 - SURFACE
      ?auto_35131 - SURFACE
    )
    :vars
    (
      ?auto_35138 - HOIST
      ?auto_35136 - PLACE
      ?auto_35133 - SURFACE
      ?auto_35137 - PLACE
      ?auto_35134 - HOIST
      ?auto_35135 - SURFACE
      ?auto_35132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35138 ?auto_35136 ) ( IS-CRATE ?auto_35131 ) ( not ( = ?auto_35130 ?auto_35131 ) ) ( not ( = ?auto_35133 ?auto_35130 ) ) ( not ( = ?auto_35133 ?auto_35131 ) ) ( not ( = ?auto_35137 ?auto_35136 ) ) ( HOIST-AT ?auto_35134 ?auto_35137 ) ( not ( = ?auto_35138 ?auto_35134 ) ) ( AVAILABLE ?auto_35134 ) ( SURFACE-AT ?auto_35131 ?auto_35137 ) ( ON ?auto_35131 ?auto_35135 ) ( CLEAR ?auto_35131 ) ( not ( = ?auto_35130 ?auto_35135 ) ) ( not ( = ?auto_35131 ?auto_35135 ) ) ( not ( = ?auto_35133 ?auto_35135 ) ) ( TRUCK-AT ?auto_35132 ?auto_35136 ) ( SURFACE-AT ?auto_35133 ?auto_35136 ) ( CLEAR ?auto_35133 ) ( LIFTING ?auto_35138 ?auto_35130 ) ( IS-CRATE ?auto_35130 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35133 ?auto_35130 )
      ( MAKE-2CRATE ?auto_35133 ?auto_35130 ?auto_35131 )
      ( MAKE-1CRATE-VERIFY ?auto_35130 ?auto_35131 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35139 - SURFACE
      ?auto_35140 - SURFACE
      ?auto_35141 - SURFACE
    )
    :vars
    (
      ?auto_35142 - HOIST
      ?auto_35147 - PLACE
      ?auto_35143 - PLACE
      ?auto_35146 - HOIST
      ?auto_35145 - SURFACE
      ?auto_35144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35142 ?auto_35147 ) ( IS-CRATE ?auto_35141 ) ( not ( = ?auto_35140 ?auto_35141 ) ) ( not ( = ?auto_35139 ?auto_35140 ) ) ( not ( = ?auto_35139 ?auto_35141 ) ) ( not ( = ?auto_35143 ?auto_35147 ) ) ( HOIST-AT ?auto_35146 ?auto_35143 ) ( not ( = ?auto_35142 ?auto_35146 ) ) ( AVAILABLE ?auto_35146 ) ( SURFACE-AT ?auto_35141 ?auto_35143 ) ( ON ?auto_35141 ?auto_35145 ) ( CLEAR ?auto_35141 ) ( not ( = ?auto_35140 ?auto_35145 ) ) ( not ( = ?auto_35141 ?auto_35145 ) ) ( not ( = ?auto_35139 ?auto_35145 ) ) ( TRUCK-AT ?auto_35144 ?auto_35147 ) ( SURFACE-AT ?auto_35139 ?auto_35147 ) ( CLEAR ?auto_35139 ) ( LIFTING ?auto_35142 ?auto_35140 ) ( IS-CRATE ?auto_35140 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35140 ?auto_35141 )
      ( MAKE-2CRATE-VERIFY ?auto_35139 ?auto_35140 ?auto_35141 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35148 - SURFACE
      ?auto_35149 - SURFACE
      ?auto_35150 - SURFACE
      ?auto_35151 - SURFACE
    )
    :vars
    (
      ?auto_35152 - HOIST
      ?auto_35153 - PLACE
      ?auto_35156 - PLACE
      ?auto_35157 - HOIST
      ?auto_35154 - SURFACE
      ?auto_35155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35152 ?auto_35153 ) ( IS-CRATE ?auto_35151 ) ( not ( = ?auto_35150 ?auto_35151 ) ) ( not ( = ?auto_35149 ?auto_35150 ) ) ( not ( = ?auto_35149 ?auto_35151 ) ) ( not ( = ?auto_35156 ?auto_35153 ) ) ( HOIST-AT ?auto_35157 ?auto_35156 ) ( not ( = ?auto_35152 ?auto_35157 ) ) ( AVAILABLE ?auto_35157 ) ( SURFACE-AT ?auto_35151 ?auto_35156 ) ( ON ?auto_35151 ?auto_35154 ) ( CLEAR ?auto_35151 ) ( not ( = ?auto_35150 ?auto_35154 ) ) ( not ( = ?auto_35151 ?auto_35154 ) ) ( not ( = ?auto_35149 ?auto_35154 ) ) ( TRUCK-AT ?auto_35155 ?auto_35153 ) ( SURFACE-AT ?auto_35149 ?auto_35153 ) ( CLEAR ?auto_35149 ) ( LIFTING ?auto_35152 ?auto_35150 ) ( IS-CRATE ?auto_35150 ) ( ON ?auto_35149 ?auto_35148 ) ( not ( = ?auto_35148 ?auto_35149 ) ) ( not ( = ?auto_35148 ?auto_35150 ) ) ( not ( = ?auto_35148 ?auto_35151 ) ) ( not ( = ?auto_35148 ?auto_35154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35149 ?auto_35150 ?auto_35151 )
      ( MAKE-3CRATE-VERIFY ?auto_35148 ?auto_35149 ?auto_35150 ?auto_35151 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35158 - SURFACE
      ?auto_35159 - SURFACE
      ?auto_35160 - SURFACE
      ?auto_35161 - SURFACE
      ?auto_35162 - SURFACE
    )
    :vars
    (
      ?auto_35163 - HOIST
      ?auto_35164 - PLACE
      ?auto_35167 - PLACE
      ?auto_35168 - HOIST
      ?auto_35165 - SURFACE
      ?auto_35166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35163 ?auto_35164 ) ( IS-CRATE ?auto_35162 ) ( not ( = ?auto_35161 ?auto_35162 ) ) ( not ( = ?auto_35160 ?auto_35161 ) ) ( not ( = ?auto_35160 ?auto_35162 ) ) ( not ( = ?auto_35167 ?auto_35164 ) ) ( HOIST-AT ?auto_35168 ?auto_35167 ) ( not ( = ?auto_35163 ?auto_35168 ) ) ( AVAILABLE ?auto_35168 ) ( SURFACE-AT ?auto_35162 ?auto_35167 ) ( ON ?auto_35162 ?auto_35165 ) ( CLEAR ?auto_35162 ) ( not ( = ?auto_35161 ?auto_35165 ) ) ( not ( = ?auto_35162 ?auto_35165 ) ) ( not ( = ?auto_35160 ?auto_35165 ) ) ( TRUCK-AT ?auto_35166 ?auto_35164 ) ( SURFACE-AT ?auto_35160 ?auto_35164 ) ( CLEAR ?auto_35160 ) ( LIFTING ?auto_35163 ?auto_35161 ) ( IS-CRATE ?auto_35161 ) ( ON ?auto_35159 ?auto_35158 ) ( ON ?auto_35160 ?auto_35159 ) ( not ( = ?auto_35158 ?auto_35159 ) ) ( not ( = ?auto_35158 ?auto_35160 ) ) ( not ( = ?auto_35158 ?auto_35161 ) ) ( not ( = ?auto_35158 ?auto_35162 ) ) ( not ( = ?auto_35158 ?auto_35165 ) ) ( not ( = ?auto_35159 ?auto_35160 ) ) ( not ( = ?auto_35159 ?auto_35161 ) ) ( not ( = ?auto_35159 ?auto_35162 ) ) ( not ( = ?auto_35159 ?auto_35165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35160 ?auto_35161 ?auto_35162 )
      ( MAKE-4CRATE-VERIFY ?auto_35158 ?auto_35159 ?auto_35160 ?auto_35161 ?auto_35162 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35169 - SURFACE
      ?auto_35170 - SURFACE
      ?auto_35171 - SURFACE
      ?auto_35172 - SURFACE
      ?auto_35173 - SURFACE
      ?auto_35174 - SURFACE
    )
    :vars
    (
      ?auto_35175 - HOIST
      ?auto_35176 - PLACE
      ?auto_35179 - PLACE
      ?auto_35180 - HOIST
      ?auto_35177 - SURFACE
      ?auto_35178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35175 ?auto_35176 ) ( IS-CRATE ?auto_35174 ) ( not ( = ?auto_35173 ?auto_35174 ) ) ( not ( = ?auto_35172 ?auto_35173 ) ) ( not ( = ?auto_35172 ?auto_35174 ) ) ( not ( = ?auto_35179 ?auto_35176 ) ) ( HOIST-AT ?auto_35180 ?auto_35179 ) ( not ( = ?auto_35175 ?auto_35180 ) ) ( AVAILABLE ?auto_35180 ) ( SURFACE-AT ?auto_35174 ?auto_35179 ) ( ON ?auto_35174 ?auto_35177 ) ( CLEAR ?auto_35174 ) ( not ( = ?auto_35173 ?auto_35177 ) ) ( not ( = ?auto_35174 ?auto_35177 ) ) ( not ( = ?auto_35172 ?auto_35177 ) ) ( TRUCK-AT ?auto_35178 ?auto_35176 ) ( SURFACE-AT ?auto_35172 ?auto_35176 ) ( CLEAR ?auto_35172 ) ( LIFTING ?auto_35175 ?auto_35173 ) ( IS-CRATE ?auto_35173 ) ( ON ?auto_35170 ?auto_35169 ) ( ON ?auto_35171 ?auto_35170 ) ( ON ?auto_35172 ?auto_35171 ) ( not ( = ?auto_35169 ?auto_35170 ) ) ( not ( = ?auto_35169 ?auto_35171 ) ) ( not ( = ?auto_35169 ?auto_35172 ) ) ( not ( = ?auto_35169 ?auto_35173 ) ) ( not ( = ?auto_35169 ?auto_35174 ) ) ( not ( = ?auto_35169 ?auto_35177 ) ) ( not ( = ?auto_35170 ?auto_35171 ) ) ( not ( = ?auto_35170 ?auto_35172 ) ) ( not ( = ?auto_35170 ?auto_35173 ) ) ( not ( = ?auto_35170 ?auto_35174 ) ) ( not ( = ?auto_35170 ?auto_35177 ) ) ( not ( = ?auto_35171 ?auto_35172 ) ) ( not ( = ?auto_35171 ?auto_35173 ) ) ( not ( = ?auto_35171 ?auto_35174 ) ) ( not ( = ?auto_35171 ?auto_35177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35172 ?auto_35173 ?auto_35174 )
      ( MAKE-5CRATE-VERIFY ?auto_35169 ?auto_35170 ?auto_35171 ?auto_35172 ?auto_35173 ?auto_35174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35181 - SURFACE
      ?auto_35182 - SURFACE
    )
    :vars
    (
      ?auto_35183 - HOIST
      ?auto_35184 - PLACE
      ?auto_35188 - SURFACE
      ?auto_35187 - PLACE
      ?auto_35189 - HOIST
      ?auto_35185 - SURFACE
      ?auto_35186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35183 ?auto_35184 ) ( IS-CRATE ?auto_35182 ) ( not ( = ?auto_35181 ?auto_35182 ) ) ( not ( = ?auto_35188 ?auto_35181 ) ) ( not ( = ?auto_35188 ?auto_35182 ) ) ( not ( = ?auto_35187 ?auto_35184 ) ) ( HOIST-AT ?auto_35189 ?auto_35187 ) ( not ( = ?auto_35183 ?auto_35189 ) ) ( AVAILABLE ?auto_35189 ) ( SURFACE-AT ?auto_35182 ?auto_35187 ) ( ON ?auto_35182 ?auto_35185 ) ( CLEAR ?auto_35182 ) ( not ( = ?auto_35181 ?auto_35185 ) ) ( not ( = ?auto_35182 ?auto_35185 ) ) ( not ( = ?auto_35188 ?auto_35185 ) ) ( TRUCK-AT ?auto_35186 ?auto_35184 ) ( SURFACE-AT ?auto_35188 ?auto_35184 ) ( CLEAR ?auto_35188 ) ( IS-CRATE ?auto_35181 ) ( AVAILABLE ?auto_35183 ) ( IN ?auto_35181 ?auto_35186 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35183 ?auto_35181 ?auto_35186 ?auto_35184 )
      ( MAKE-2CRATE ?auto_35188 ?auto_35181 ?auto_35182 )
      ( MAKE-1CRATE-VERIFY ?auto_35181 ?auto_35182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35190 - SURFACE
      ?auto_35191 - SURFACE
      ?auto_35192 - SURFACE
    )
    :vars
    (
      ?auto_35196 - HOIST
      ?auto_35198 - PLACE
      ?auto_35197 - PLACE
      ?auto_35195 - HOIST
      ?auto_35194 - SURFACE
      ?auto_35193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35196 ?auto_35198 ) ( IS-CRATE ?auto_35192 ) ( not ( = ?auto_35191 ?auto_35192 ) ) ( not ( = ?auto_35190 ?auto_35191 ) ) ( not ( = ?auto_35190 ?auto_35192 ) ) ( not ( = ?auto_35197 ?auto_35198 ) ) ( HOIST-AT ?auto_35195 ?auto_35197 ) ( not ( = ?auto_35196 ?auto_35195 ) ) ( AVAILABLE ?auto_35195 ) ( SURFACE-AT ?auto_35192 ?auto_35197 ) ( ON ?auto_35192 ?auto_35194 ) ( CLEAR ?auto_35192 ) ( not ( = ?auto_35191 ?auto_35194 ) ) ( not ( = ?auto_35192 ?auto_35194 ) ) ( not ( = ?auto_35190 ?auto_35194 ) ) ( TRUCK-AT ?auto_35193 ?auto_35198 ) ( SURFACE-AT ?auto_35190 ?auto_35198 ) ( CLEAR ?auto_35190 ) ( IS-CRATE ?auto_35191 ) ( AVAILABLE ?auto_35196 ) ( IN ?auto_35191 ?auto_35193 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35191 ?auto_35192 )
      ( MAKE-2CRATE-VERIFY ?auto_35190 ?auto_35191 ?auto_35192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35199 - SURFACE
      ?auto_35200 - SURFACE
      ?auto_35201 - SURFACE
      ?auto_35202 - SURFACE
    )
    :vars
    (
      ?auto_35208 - HOIST
      ?auto_35205 - PLACE
      ?auto_35207 - PLACE
      ?auto_35206 - HOIST
      ?auto_35203 - SURFACE
      ?auto_35204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35208 ?auto_35205 ) ( IS-CRATE ?auto_35202 ) ( not ( = ?auto_35201 ?auto_35202 ) ) ( not ( = ?auto_35200 ?auto_35201 ) ) ( not ( = ?auto_35200 ?auto_35202 ) ) ( not ( = ?auto_35207 ?auto_35205 ) ) ( HOIST-AT ?auto_35206 ?auto_35207 ) ( not ( = ?auto_35208 ?auto_35206 ) ) ( AVAILABLE ?auto_35206 ) ( SURFACE-AT ?auto_35202 ?auto_35207 ) ( ON ?auto_35202 ?auto_35203 ) ( CLEAR ?auto_35202 ) ( not ( = ?auto_35201 ?auto_35203 ) ) ( not ( = ?auto_35202 ?auto_35203 ) ) ( not ( = ?auto_35200 ?auto_35203 ) ) ( TRUCK-AT ?auto_35204 ?auto_35205 ) ( SURFACE-AT ?auto_35200 ?auto_35205 ) ( CLEAR ?auto_35200 ) ( IS-CRATE ?auto_35201 ) ( AVAILABLE ?auto_35208 ) ( IN ?auto_35201 ?auto_35204 ) ( ON ?auto_35200 ?auto_35199 ) ( not ( = ?auto_35199 ?auto_35200 ) ) ( not ( = ?auto_35199 ?auto_35201 ) ) ( not ( = ?auto_35199 ?auto_35202 ) ) ( not ( = ?auto_35199 ?auto_35203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35200 ?auto_35201 ?auto_35202 )
      ( MAKE-3CRATE-VERIFY ?auto_35199 ?auto_35200 ?auto_35201 ?auto_35202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35209 - SURFACE
      ?auto_35210 - SURFACE
      ?auto_35211 - SURFACE
      ?auto_35212 - SURFACE
      ?auto_35213 - SURFACE
    )
    :vars
    (
      ?auto_35219 - HOIST
      ?auto_35216 - PLACE
      ?auto_35218 - PLACE
      ?auto_35217 - HOIST
      ?auto_35214 - SURFACE
      ?auto_35215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35219 ?auto_35216 ) ( IS-CRATE ?auto_35213 ) ( not ( = ?auto_35212 ?auto_35213 ) ) ( not ( = ?auto_35211 ?auto_35212 ) ) ( not ( = ?auto_35211 ?auto_35213 ) ) ( not ( = ?auto_35218 ?auto_35216 ) ) ( HOIST-AT ?auto_35217 ?auto_35218 ) ( not ( = ?auto_35219 ?auto_35217 ) ) ( AVAILABLE ?auto_35217 ) ( SURFACE-AT ?auto_35213 ?auto_35218 ) ( ON ?auto_35213 ?auto_35214 ) ( CLEAR ?auto_35213 ) ( not ( = ?auto_35212 ?auto_35214 ) ) ( not ( = ?auto_35213 ?auto_35214 ) ) ( not ( = ?auto_35211 ?auto_35214 ) ) ( TRUCK-AT ?auto_35215 ?auto_35216 ) ( SURFACE-AT ?auto_35211 ?auto_35216 ) ( CLEAR ?auto_35211 ) ( IS-CRATE ?auto_35212 ) ( AVAILABLE ?auto_35219 ) ( IN ?auto_35212 ?auto_35215 ) ( ON ?auto_35210 ?auto_35209 ) ( ON ?auto_35211 ?auto_35210 ) ( not ( = ?auto_35209 ?auto_35210 ) ) ( not ( = ?auto_35209 ?auto_35211 ) ) ( not ( = ?auto_35209 ?auto_35212 ) ) ( not ( = ?auto_35209 ?auto_35213 ) ) ( not ( = ?auto_35209 ?auto_35214 ) ) ( not ( = ?auto_35210 ?auto_35211 ) ) ( not ( = ?auto_35210 ?auto_35212 ) ) ( not ( = ?auto_35210 ?auto_35213 ) ) ( not ( = ?auto_35210 ?auto_35214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35211 ?auto_35212 ?auto_35213 )
      ( MAKE-4CRATE-VERIFY ?auto_35209 ?auto_35210 ?auto_35211 ?auto_35212 ?auto_35213 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35220 - SURFACE
      ?auto_35221 - SURFACE
      ?auto_35222 - SURFACE
      ?auto_35223 - SURFACE
      ?auto_35224 - SURFACE
      ?auto_35225 - SURFACE
    )
    :vars
    (
      ?auto_35231 - HOIST
      ?auto_35228 - PLACE
      ?auto_35230 - PLACE
      ?auto_35229 - HOIST
      ?auto_35226 - SURFACE
      ?auto_35227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35231 ?auto_35228 ) ( IS-CRATE ?auto_35225 ) ( not ( = ?auto_35224 ?auto_35225 ) ) ( not ( = ?auto_35223 ?auto_35224 ) ) ( not ( = ?auto_35223 ?auto_35225 ) ) ( not ( = ?auto_35230 ?auto_35228 ) ) ( HOIST-AT ?auto_35229 ?auto_35230 ) ( not ( = ?auto_35231 ?auto_35229 ) ) ( AVAILABLE ?auto_35229 ) ( SURFACE-AT ?auto_35225 ?auto_35230 ) ( ON ?auto_35225 ?auto_35226 ) ( CLEAR ?auto_35225 ) ( not ( = ?auto_35224 ?auto_35226 ) ) ( not ( = ?auto_35225 ?auto_35226 ) ) ( not ( = ?auto_35223 ?auto_35226 ) ) ( TRUCK-AT ?auto_35227 ?auto_35228 ) ( SURFACE-AT ?auto_35223 ?auto_35228 ) ( CLEAR ?auto_35223 ) ( IS-CRATE ?auto_35224 ) ( AVAILABLE ?auto_35231 ) ( IN ?auto_35224 ?auto_35227 ) ( ON ?auto_35221 ?auto_35220 ) ( ON ?auto_35222 ?auto_35221 ) ( ON ?auto_35223 ?auto_35222 ) ( not ( = ?auto_35220 ?auto_35221 ) ) ( not ( = ?auto_35220 ?auto_35222 ) ) ( not ( = ?auto_35220 ?auto_35223 ) ) ( not ( = ?auto_35220 ?auto_35224 ) ) ( not ( = ?auto_35220 ?auto_35225 ) ) ( not ( = ?auto_35220 ?auto_35226 ) ) ( not ( = ?auto_35221 ?auto_35222 ) ) ( not ( = ?auto_35221 ?auto_35223 ) ) ( not ( = ?auto_35221 ?auto_35224 ) ) ( not ( = ?auto_35221 ?auto_35225 ) ) ( not ( = ?auto_35221 ?auto_35226 ) ) ( not ( = ?auto_35222 ?auto_35223 ) ) ( not ( = ?auto_35222 ?auto_35224 ) ) ( not ( = ?auto_35222 ?auto_35225 ) ) ( not ( = ?auto_35222 ?auto_35226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35223 ?auto_35224 ?auto_35225 )
      ( MAKE-5CRATE-VERIFY ?auto_35220 ?auto_35221 ?auto_35222 ?auto_35223 ?auto_35224 ?auto_35225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35232 - SURFACE
      ?auto_35233 - SURFACE
    )
    :vars
    (
      ?auto_35240 - HOIST
      ?auto_35236 - PLACE
      ?auto_35237 - SURFACE
      ?auto_35239 - PLACE
      ?auto_35238 - HOIST
      ?auto_35234 - SURFACE
      ?auto_35235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35240 ?auto_35236 ) ( IS-CRATE ?auto_35233 ) ( not ( = ?auto_35232 ?auto_35233 ) ) ( not ( = ?auto_35237 ?auto_35232 ) ) ( not ( = ?auto_35237 ?auto_35233 ) ) ( not ( = ?auto_35239 ?auto_35236 ) ) ( HOIST-AT ?auto_35238 ?auto_35239 ) ( not ( = ?auto_35240 ?auto_35238 ) ) ( AVAILABLE ?auto_35238 ) ( SURFACE-AT ?auto_35233 ?auto_35239 ) ( ON ?auto_35233 ?auto_35234 ) ( CLEAR ?auto_35233 ) ( not ( = ?auto_35232 ?auto_35234 ) ) ( not ( = ?auto_35233 ?auto_35234 ) ) ( not ( = ?auto_35237 ?auto_35234 ) ) ( SURFACE-AT ?auto_35237 ?auto_35236 ) ( CLEAR ?auto_35237 ) ( IS-CRATE ?auto_35232 ) ( AVAILABLE ?auto_35240 ) ( IN ?auto_35232 ?auto_35235 ) ( TRUCK-AT ?auto_35235 ?auto_35239 ) )
    :subtasks
    ( ( !DRIVE ?auto_35235 ?auto_35239 ?auto_35236 )
      ( MAKE-2CRATE ?auto_35237 ?auto_35232 ?auto_35233 )
      ( MAKE-1CRATE-VERIFY ?auto_35232 ?auto_35233 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35241 - SURFACE
      ?auto_35242 - SURFACE
      ?auto_35243 - SURFACE
    )
    :vars
    (
      ?auto_35245 - HOIST
      ?auto_35248 - PLACE
      ?auto_35246 - PLACE
      ?auto_35247 - HOIST
      ?auto_35244 - SURFACE
      ?auto_35249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35245 ?auto_35248 ) ( IS-CRATE ?auto_35243 ) ( not ( = ?auto_35242 ?auto_35243 ) ) ( not ( = ?auto_35241 ?auto_35242 ) ) ( not ( = ?auto_35241 ?auto_35243 ) ) ( not ( = ?auto_35246 ?auto_35248 ) ) ( HOIST-AT ?auto_35247 ?auto_35246 ) ( not ( = ?auto_35245 ?auto_35247 ) ) ( AVAILABLE ?auto_35247 ) ( SURFACE-AT ?auto_35243 ?auto_35246 ) ( ON ?auto_35243 ?auto_35244 ) ( CLEAR ?auto_35243 ) ( not ( = ?auto_35242 ?auto_35244 ) ) ( not ( = ?auto_35243 ?auto_35244 ) ) ( not ( = ?auto_35241 ?auto_35244 ) ) ( SURFACE-AT ?auto_35241 ?auto_35248 ) ( CLEAR ?auto_35241 ) ( IS-CRATE ?auto_35242 ) ( AVAILABLE ?auto_35245 ) ( IN ?auto_35242 ?auto_35249 ) ( TRUCK-AT ?auto_35249 ?auto_35246 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35242 ?auto_35243 )
      ( MAKE-2CRATE-VERIFY ?auto_35241 ?auto_35242 ?auto_35243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35250 - SURFACE
      ?auto_35251 - SURFACE
      ?auto_35252 - SURFACE
      ?auto_35253 - SURFACE
    )
    :vars
    (
      ?auto_35257 - HOIST
      ?auto_35255 - PLACE
      ?auto_35259 - PLACE
      ?auto_35256 - HOIST
      ?auto_35258 - SURFACE
      ?auto_35254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35257 ?auto_35255 ) ( IS-CRATE ?auto_35253 ) ( not ( = ?auto_35252 ?auto_35253 ) ) ( not ( = ?auto_35251 ?auto_35252 ) ) ( not ( = ?auto_35251 ?auto_35253 ) ) ( not ( = ?auto_35259 ?auto_35255 ) ) ( HOIST-AT ?auto_35256 ?auto_35259 ) ( not ( = ?auto_35257 ?auto_35256 ) ) ( AVAILABLE ?auto_35256 ) ( SURFACE-AT ?auto_35253 ?auto_35259 ) ( ON ?auto_35253 ?auto_35258 ) ( CLEAR ?auto_35253 ) ( not ( = ?auto_35252 ?auto_35258 ) ) ( not ( = ?auto_35253 ?auto_35258 ) ) ( not ( = ?auto_35251 ?auto_35258 ) ) ( SURFACE-AT ?auto_35251 ?auto_35255 ) ( CLEAR ?auto_35251 ) ( IS-CRATE ?auto_35252 ) ( AVAILABLE ?auto_35257 ) ( IN ?auto_35252 ?auto_35254 ) ( TRUCK-AT ?auto_35254 ?auto_35259 ) ( ON ?auto_35251 ?auto_35250 ) ( not ( = ?auto_35250 ?auto_35251 ) ) ( not ( = ?auto_35250 ?auto_35252 ) ) ( not ( = ?auto_35250 ?auto_35253 ) ) ( not ( = ?auto_35250 ?auto_35258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35251 ?auto_35252 ?auto_35253 )
      ( MAKE-3CRATE-VERIFY ?auto_35250 ?auto_35251 ?auto_35252 ?auto_35253 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35260 - SURFACE
      ?auto_35261 - SURFACE
      ?auto_35262 - SURFACE
      ?auto_35263 - SURFACE
      ?auto_35264 - SURFACE
    )
    :vars
    (
      ?auto_35268 - HOIST
      ?auto_35266 - PLACE
      ?auto_35270 - PLACE
      ?auto_35267 - HOIST
      ?auto_35269 - SURFACE
      ?auto_35265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35268 ?auto_35266 ) ( IS-CRATE ?auto_35264 ) ( not ( = ?auto_35263 ?auto_35264 ) ) ( not ( = ?auto_35262 ?auto_35263 ) ) ( not ( = ?auto_35262 ?auto_35264 ) ) ( not ( = ?auto_35270 ?auto_35266 ) ) ( HOIST-AT ?auto_35267 ?auto_35270 ) ( not ( = ?auto_35268 ?auto_35267 ) ) ( AVAILABLE ?auto_35267 ) ( SURFACE-AT ?auto_35264 ?auto_35270 ) ( ON ?auto_35264 ?auto_35269 ) ( CLEAR ?auto_35264 ) ( not ( = ?auto_35263 ?auto_35269 ) ) ( not ( = ?auto_35264 ?auto_35269 ) ) ( not ( = ?auto_35262 ?auto_35269 ) ) ( SURFACE-AT ?auto_35262 ?auto_35266 ) ( CLEAR ?auto_35262 ) ( IS-CRATE ?auto_35263 ) ( AVAILABLE ?auto_35268 ) ( IN ?auto_35263 ?auto_35265 ) ( TRUCK-AT ?auto_35265 ?auto_35270 ) ( ON ?auto_35261 ?auto_35260 ) ( ON ?auto_35262 ?auto_35261 ) ( not ( = ?auto_35260 ?auto_35261 ) ) ( not ( = ?auto_35260 ?auto_35262 ) ) ( not ( = ?auto_35260 ?auto_35263 ) ) ( not ( = ?auto_35260 ?auto_35264 ) ) ( not ( = ?auto_35260 ?auto_35269 ) ) ( not ( = ?auto_35261 ?auto_35262 ) ) ( not ( = ?auto_35261 ?auto_35263 ) ) ( not ( = ?auto_35261 ?auto_35264 ) ) ( not ( = ?auto_35261 ?auto_35269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35262 ?auto_35263 ?auto_35264 )
      ( MAKE-4CRATE-VERIFY ?auto_35260 ?auto_35261 ?auto_35262 ?auto_35263 ?auto_35264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35271 - SURFACE
      ?auto_35272 - SURFACE
      ?auto_35273 - SURFACE
      ?auto_35274 - SURFACE
      ?auto_35275 - SURFACE
      ?auto_35276 - SURFACE
    )
    :vars
    (
      ?auto_35280 - HOIST
      ?auto_35278 - PLACE
      ?auto_35282 - PLACE
      ?auto_35279 - HOIST
      ?auto_35281 - SURFACE
      ?auto_35277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35280 ?auto_35278 ) ( IS-CRATE ?auto_35276 ) ( not ( = ?auto_35275 ?auto_35276 ) ) ( not ( = ?auto_35274 ?auto_35275 ) ) ( not ( = ?auto_35274 ?auto_35276 ) ) ( not ( = ?auto_35282 ?auto_35278 ) ) ( HOIST-AT ?auto_35279 ?auto_35282 ) ( not ( = ?auto_35280 ?auto_35279 ) ) ( AVAILABLE ?auto_35279 ) ( SURFACE-AT ?auto_35276 ?auto_35282 ) ( ON ?auto_35276 ?auto_35281 ) ( CLEAR ?auto_35276 ) ( not ( = ?auto_35275 ?auto_35281 ) ) ( not ( = ?auto_35276 ?auto_35281 ) ) ( not ( = ?auto_35274 ?auto_35281 ) ) ( SURFACE-AT ?auto_35274 ?auto_35278 ) ( CLEAR ?auto_35274 ) ( IS-CRATE ?auto_35275 ) ( AVAILABLE ?auto_35280 ) ( IN ?auto_35275 ?auto_35277 ) ( TRUCK-AT ?auto_35277 ?auto_35282 ) ( ON ?auto_35272 ?auto_35271 ) ( ON ?auto_35273 ?auto_35272 ) ( ON ?auto_35274 ?auto_35273 ) ( not ( = ?auto_35271 ?auto_35272 ) ) ( not ( = ?auto_35271 ?auto_35273 ) ) ( not ( = ?auto_35271 ?auto_35274 ) ) ( not ( = ?auto_35271 ?auto_35275 ) ) ( not ( = ?auto_35271 ?auto_35276 ) ) ( not ( = ?auto_35271 ?auto_35281 ) ) ( not ( = ?auto_35272 ?auto_35273 ) ) ( not ( = ?auto_35272 ?auto_35274 ) ) ( not ( = ?auto_35272 ?auto_35275 ) ) ( not ( = ?auto_35272 ?auto_35276 ) ) ( not ( = ?auto_35272 ?auto_35281 ) ) ( not ( = ?auto_35273 ?auto_35274 ) ) ( not ( = ?auto_35273 ?auto_35275 ) ) ( not ( = ?auto_35273 ?auto_35276 ) ) ( not ( = ?auto_35273 ?auto_35281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35274 ?auto_35275 ?auto_35276 )
      ( MAKE-5CRATE-VERIFY ?auto_35271 ?auto_35272 ?auto_35273 ?auto_35274 ?auto_35275 ?auto_35276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35283 - SURFACE
      ?auto_35284 - SURFACE
    )
    :vars
    (
      ?auto_35289 - HOIST
      ?auto_35287 - PLACE
      ?auto_35285 - SURFACE
      ?auto_35291 - PLACE
      ?auto_35288 - HOIST
      ?auto_35290 - SURFACE
      ?auto_35286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35289 ?auto_35287 ) ( IS-CRATE ?auto_35284 ) ( not ( = ?auto_35283 ?auto_35284 ) ) ( not ( = ?auto_35285 ?auto_35283 ) ) ( not ( = ?auto_35285 ?auto_35284 ) ) ( not ( = ?auto_35291 ?auto_35287 ) ) ( HOIST-AT ?auto_35288 ?auto_35291 ) ( not ( = ?auto_35289 ?auto_35288 ) ) ( SURFACE-AT ?auto_35284 ?auto_35291 ) ( ON ?auto_35284 ?auto_35290 ) ( CLEAR ?auto_35284 ) ( not ( = ?auto_35283 ?auto_35290 ) ) ( not ( = ?auto_35284 ?auto_35290 ) ) ( not ( = ?auto_35285 ?auto_35290 ) ) ( SURFACE-AT ?auto_35285 ?auto_35287 ) ( CLEAR ?auto_35285 ) ( IS-CRATE ?auto_35283 ) ( AVAILABLE ?auto_35289 ) ( TRUCK-AT ?auto_35286 ?auto_35291 ) ( LIFTING ?auto_35288 ?auto_35283 ) )
    :subtasks
    ( ( !LOAD ?auto_35288 ?auto_35283 ?auto_35286 ?auto_35291 )
      ( MAKE-2CRATE ?auto_35285 ?auto_35283 ?auto_35284 )
      ( MAKE-1CRATE-VERIFY ?auto_35283 ?auto_35284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35292 - SURFACE
      ?auto_35293 - SURFACE
      ?auto_35294 - SURFACE
    )
    :vars
    (
      ?auto_35300 - HOIST
      ?auto_35299 - PLACE
      ?auto_35296 - PLACE
      ?auto_35297 - HOIST
      ?auto_35295 - SURFACE
      ?auto_35298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35300 ?auto_35299 ) ( IS-CRATE ?auto_35294 ) ( not ( = ?auto_35293 ?auto_35294 ) ) ( not ( = ?auto_35292 ?auto_35293 ) ) ( not ( = ?auto_35292 ?auto_35294 ) ) ( not ( = ?auto_35296 ?auto_35299 ) ) ( HOIST-AT ?auto_35297 ?auto_35296 ) ( not ( = ?auto_35300 ?auto_35297 ) ) ( SURFACE-AT ?auto_35294 ?auto_35296 ) ( ON ?auto_35294 ?auto_35295 ) ( CLEAR ?auto_35294 ) ( not ( = ?auto_35293 ?auto_35295 ) ) ( not ( = ?auto_35294 ?auto_35295 ) ) ( not ( = ?auto_35292 ?auto_35295 ) ) ( SURFACE-AT ?auto_35292 ?auto_35299 ) ( CLEAR ?auto_35292 ) ( IS-CRATE ?auto_35293 ) ( AVAILABLE ?auto_35300 ) ( TRUCK-AT ?auto_35298 ?auto_35296 ) ( LIFTING ?auto_35297 ?auto_35293 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35293 ?auto_35294 )
      ( MAKE-2CRATE-VERIFY ?auto_35292 ?auto_35293 ?auto_35294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35301 - SURFACE
      ?auto_35302 - SURFACE
      ?auto_35303 - SURFACE
      ?auto_35304 - SURFACE
    )
    :vars
    (
      ?auto_35309 - HOIST
      ?auto_35310 - PLACE
      ?auto_35306 - PLACE
      ?auto_35307 - HOIST
      ?auto_35308 - SURFACE
      ?auto_35305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35309 ?auto_35310 ) ( IS-CRATE ?auto_35304 ) ( not ( = ?auto_35303 ?auto_35304 ) ) ( not ( = ?auto_35302 ?auto_35303 ) ) ( not ( = ?auto_35302 ?auto_35304 ) ) ( not ( = ?auto_35306 ?auto_35310 ) ) ( HOIST-AT ?auto_35307 ?auto_35306 ) ( not ( = ?auto_35309 ?auto_35307 ) ) ( SURFACE-AT ?auto_35304 ?auto_35306 ) ( ON ?auto_35304 ?auto_35308 ) ( CLEAR ?auto_35304 ) ( not ( = ?auto_35303 ?auto_35308 ) ) ( not ( = ?auto_35304 ?auto_35308 ) ) ( not ( = ?auto_35302 ?auto_35308 ) ) ( SURFACE-AT ?auto_35302 ?auto_35310 ) ( CLEAR ?auto_35302 ) ( IS-CRATE ?auto_35303 ) ( AVAILABLE ?auto_35309 ) ( TRUCK-AT ?auto_35305 ?auto_35306 ) ( LIFTING ?auto_35307 ?auto_35303 ) ( ON ?auto_35302 ?auto_35301 ) ( not ( = ?auto_35301 ?auto_35302 ) ) ( not ( = ?auto_35301 ?auto_35303 ) ) ( not ( = ?auto_35301 ?auto_35304 ) ) ( not ( = ?auto_35301 ?auto_35308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35302 ?auto_35303 ?auto_35304 )
      ( MAKE-3CRATE-VERIFY ?auto_35301 ?auto_35302 ?auto_35303 ?auto_35304 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35311 - SURFACE
      ?auto_35312 - SURFACE
      ?auto_35313 - SURFACE
      ?auto_35314 - SURFACE
      ?auto_35315 - SURFACE
    )
    :vars
    (
      ?auto_35320 - HOIST
      ?auto_35321 - PLACE
      ?auto_35317 - PLACE
      ?auto_35318 - HOIST
      ?auto_35319 - SURFACE
      ?auto_35316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35320 ?auto_35321 ) ( IS-CRATE ?auto_35315 ) ( not ( = ?auto_35314 ?auto_35315 ) ) ( not ( = ?auto_35313 ?auto_35314 ) ) ( not ( = ?auto_35313 ?auto_35315 ) ) ( not ( = ?auto_35317 ?auto_35321 ) ) ( HOIST-AT ?auto_35318 ?auto_35317 ) ( not ( = ?auto_35320 ?auto_35318 ) ) ( SURFACE-AT ?auto_35315 ?auto_35317 ) ( ON ?auto_35315 ?auto_35319 ) ( CLEAR ?auto_35315 ) ( not ( = ?auto_35314 ?auto_35319 ) ) ( not ( = ?auto_35315 ?auto_35319 ) ) ( not ( = ?auto_35313 ?auto_35319 ) ) ( SURFACE-AT ?auto_35313 ?auto_35321 ) ( CLEAR ?auto_35313 ) ( IS-CRATE ?auto_35314 ) ( AVAILABLE ?auto_35320 ) ( TRUCK-AT ?auto_35316 ?auto_35317 ) ( LIFTING ?auto_35318 ?auto_35314 ) ( ON ?auto_35312 ?auto_35311 ) ( ON ?auto_35313 ?auto_35312 ) ( not ( = ?auto_35311 ?auto_35312 ) ) ( not ( = ?auto_35311 ?auto_35313 ) ) ( not ( = ?auto_35311 ?auto_35314 ) ) ( not ( = ?auto_35311 ?auto_35315 ) ) ( not ( = ?auto_35311 ?auto_35319 ) ) ( not ( = ?auto_35312 ?auto_35313 ) ) ( not ( = ?auto_35312 ?auto_35314 ) ) ( not ( = ?auto_35312 ?auto_35315 ) ) ( not ( = ?auto_35312 ?auto_35319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35313 ?auto_35314 ?auto_35315 )
      ( MAKE-4CRATE-VERIFY ?auto_35311 ?auto_35312 ?auto_35313 ?auto_35314 ?auto_35315 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35322 - SURFACE
      ?auto_35323 - SURFACE
      ?auto_35324 - SURFACE
      ?auto_35325 - SURFACE
      ?auto_35326 - SURFACE
      ?auto_35327 - SURFACE
    )
    :vars
    (
      ?auto_35332 - HOIST
      ?auto_35333 - PLACE
      ?auto_35329 - PLACE
      ?auto_35330 - HOIST
      ?auto_35331 - SURFACE
      ?auto_35328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35332 ?auto_35333 ) ( IS-CRATE ?auto_35327 ) ( not ( = ?auto_35326 ?auto_35327 ) ) ( not ( = ?auto_35325 ?auto_35326 ) ) ( not ( = ?auto_35325 ?auto_35327 ) ) ( not ( = ?auto_35329 ?auto_35333 ) ) ( HOIST-AT ?auto_35330 ?auto_35329 ) ( not ( = ?auto_35332 ?auto_35330 ) ) ( SURFACE-AT ?auto_35327 ?auto_35329 ) ( ON ?auto_35327 ?auto_35331 ) ( CLEAR ?auto_35327 ) ( not ( = ?auto_35326 ?auto_35331 ) ) ( not ( = ?auto_35327 ?auto_35331 ) ) ( not ( = ?auto_35325 ?auto_35331 ) ) ( SURFACE-AT ?auto_35325 ?auto_35333 ) ( CLEAR ?auto_35325 ) ( IS-CRATE ?auto_35326 ) ( AVAILABLE ?auto_35332 ) ( TRUCK-AT ?auto_35328 ?auto_35329 ) ( LIFTING ?auto_35330 ?auto_35326 ) ( ON ?auto_35323 ?auto_35322 ) ( ON ?auto_35324 ?auto_35323 ) ( ON ?auto_35325 ?auto_35324 ) ( not ( = ?auto_35322 ?auto_35323 ) ) ( not ( = ?auto_35322 ?auto_35324 ) ) ( not ( = ?auto_35322 ?auto_35325 ) ) ( not ( = ?auto_35322 ?auto_35326 ) ) ( not ( = ?auto_35322 ?auto_35327 ) ) ( not ( = ?auto_35322 ?auto_35331 ) ) ( not ( = ?auto_35323 ?auto_35324 ) ) ( not ( = ?auto_35323 ?auto_35325 ) ) ( not ( = ?auto_35323 ?auto_35326 ) ) ( not ( = ?auto_35323 ?auto_35327 ) ) ( not ( = ?auto_35323 ?auto_35331 ) ) ( not ( = ?auto_35324 ?auto_35325 ) ) ( not ( = ?auto_35324 ?auto_35326 ) ) ( not ( = ?auto_35324 ?auto_35327 ) ) ( not ( = ?auto_35324 ?auto_35331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35325 ?auto_35326 ?auto_35327 )
      ( MAKE-5CRATE-VERIFY ?auto_35322 ?auto_35323 ?auto_35324 ?auto_35325 ?auto_35326 ?auto_35327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35334 - SURFACE
      ?auto_35335 - SURFACE
    )
    :vars
    (
      ?auto_35341 - HOIST
      ?auto_35342 - PLACE
      ?auto_35337 - SURFACE
      ?auto_35338 - PLACE
      ?auto_35339 - HOIST
      ?auto_35340 - SURFACE
      ?auto_35336 - TRUCK
      ?auto_35343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35341 ?auto_35342 ) ( IS-CRATE ?auto_35335 ) ( not ( = ?auto_35334 ?auto_35335 ) ) ( not ( = ?auto_35337 ?auto_35334 ) ) ( not ( = ?auto_35337 ?auto_35335 ) ) ( not ( = ?auto_35338 ?auto_35342 ) ) ( HOIST-AT ?auto_35339 ?auto_35338 ) ( not ( = ?auto_35341 ?auto_35339 ) ) ( SURFACE-AT ?auto_35335 ?auto_35338 ) ( ON ?auto_35335 ?auto_35340 ) ( CLEAR ?auto_35335 ) ( not ( = ?auto_35334 ?auto_35340 ) ) ( not ( = ?auto_35335 ?auto_35340 ) ) ( not ( = ?auto_35337 ?auto_35340 ) ) ( SURFACE-AT ?auto_35337 ?auto_35342 ) ( CLEAR ?auto_35337 ) ( IS-CRATE ?auto_35334 ) ( AVAILABLE ?auto_35341 ) ( TRUCK-AT ?auto_35336 ?auto_35338 ) ( AVAILABLE ?auto_35339 ) ( SURFACE-AT ?auto_35334 ?auto_35338 ) ( ON ?auto_35334 ?auto_35343 ) ( CLEAR ?auto_35334 ) ( not ( = ?auto_35334 ?auto_35343 ) ) ( not ( = ?auto_35335 ?auto_35343 ) ) ( not ( = ?auto_35337 ?auto_35343 ) ) ( not ( = ?auto_35340 ?auto_35343 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35339 ?auto_35334 ?auto_35343 ?auto_35338 )
      ( MAKE-2CRATE ?auto_35337 ?auto_35334 ?auto_35335 )
      ( MAKE-1CRATE-VERIFY ?auto_35334 ?auto_35335 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35344 - SURFACE
      ?auto_35345 - SURFACE
      ?auto_35346 - SURFACE
    )
    :vars
    (
      ?auto_35351 - HOIST
      ?auto_35350 - PLACE
      ?auto_35353 - PLACE
      ?auto_35348 - HOIST
      ?auto_35347 - SURFACE
      ?auto_35349 - TRUCK
      ?auto_35352 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35351 ?auto_35350 ) ( IS-CRATE ?auto_35346 ) ( not ( = ?auto_35345 ?auto_35346 ) ) ( not ( = ?auto_35344 ?auto_35345 ) ) ( not ( = ?auto_35344 ?auto_35346 ) ) ( not ( = ?auto_35353 ?auto_35350 ) ) ( HOIST-AT ?auto_35348 ?auto_35353 ) ( not ( = ?auto_35351 ?auto_35348 ) ) ( SURFACE-AT ?auto_35346 ?auto_35353 ) ( ON ?auto_35346 ?auto_35347 ) ( CLEAR ?auto_35346 ) ( not ( = ?auto_35345 ?auto_35347 ) ) ( not ( = ?auto_35346 ?auto_35347 ) ) ( not ( = ?auto_35344 ?auto_35347 ) ) ( SURFACE-AT ?auto_35344 ?auto_35350 ) ( CLEAR ?auto_35344 ) ( IS-CRATE ?auto_35345 ) ( AVAILABLE ?auto_35351 ) ( TRUCK-AT ?auto_35349 ?auto_35353 ) ( AVAILABLE ?auto_35348 ) ( SURFACE-AT ?auto_35345 ?auto_35353 ) ( ON ?auto_35345 ?auto_35352 ) ( CLEAR ?auto_35345 ) ( not ( = ?auto_35345 ?auto_35352 ) ) ( not ( = ?auto_35346 ?auto_35352 ) ) ( not ( = ?auto_35344 ?auto_35352 ) ) ( not ( = ?auto_35347 ?auto_35352 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35345 ?auto_35346 )
      ( MAKE-2CRATE-VERIFY ?auto_35344 ?auto_35345 ?auto_35346 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35354 - SURFACE
      ?auto_35355 - SURFACE
      ?auto_35356 - SURFACE
      ?auto_35357 - SURFACE
    )
    :vars
    (
      ?auto_35364 - HOIST
      ?auto_35362 - PLACE
      ?auto_35361 - PLACE
      ?auto_35363 - HOIST
      ?auto_35360 - SURFACE
      ?auto_35358 - TRUCK
      ?auto_35359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35364 ?auto_35362 ) ( IS-CRATE ?auto_35357 ) ( not ( = ?auto_35356 ?auto_35357 ) ) ( not ( = ?auto_35355 ?auto_35356 ) ) ( not ( = ?auto_35355 ?auto_35357 ) ) ( not ( = ?auto_35361 ?auto_35362 ) ) ( HOIST-AT ?auto_35363 ?auto_35361 ) ( not ( = ?auto_35364 ?auto_35363 ) ) ( SURFACE-AT ?auto_35357 ?auto_35361 ) ( ON ?auto_35357 ?auto_35360 ) ( CLEAR ?auto_35357 ) ( not ( = ?auto_35356 ?auto_35360 ) ) ( not ( = ?auto_35357 ?auto_35360 ) ) ( not ( = ?auto_35355 ?auto_35360 ) ) ( SURFACE-AT ?auto_35355 ?auto_35362 ) ( CLEAR ?auto_35355 ) ( IS-CRATE ?auto_35356 ) ( AVAILABLE ?auto_35364 ) ( TRUCK-AT ?auto_35358 ?auto_35361 ) ( AVAILABLE ?auto_35363 ) ( SURFACE-AT ?auto_35356 ?auto_35361 ) ( ON ?auto_35356 ?auto_35359 ) ( CLEAR ?auto_35356 ) ( not ( = ?auto_35356 ?auto_35359 ) ) ( not ( = ?auto_35357 ?auto_35359 ) ) ( not ( = ?auto_35355 ?auto_35359 ) ) ( not ( = ?auto_35360 ?auto_35359 ) ) ( ON ?auto_35355 ?auto_35354 ) ( not ( = ?auto_35354 ?auto_35355 ) ) ( not ( = ?auto_35354 ?auto_35356 ) ) ( not ( = ?auto_35354 ?auto_35357 ) ) ( not ( = ?auto_35354 ?auto_35360 ) ) ( not ( = ?auto_35354 ?auto_35359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35355 ?auto_35356 ?auto_35357 )
      ( MAKE-3CRATE-VERIFY ?auto_35354 ?auto_35355 ?auto_35356 ?auto_35357 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35365 - SURFACE
      ?auto_35366 - SURFACE
      ?auto_35367 - SURFACE
      ?auto_35368 - SURFACE
      ?auto_35369 - SURFACE
    )
    :vars
    (
      ?auto_35376 - HOIST
      ?auto_35374 - PLACE
      ?auto_35373 - PLACE
      ?auto_35375 - HOIST
      ?auto_35372 - SURFACE
      ?auto_35370 - TRUCK
      ?auto_35371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35376 ?auto_35374 ) ( IS-CRATE ?auto_35369 ) ( not ( = ?auto_35368 ?auto_35369 ) ) ( not ( = ?auto_35367 ?auto_35368 ) ) ( not ( = ?auto_35367 ?auto_35369 ) ) ( not ( = ?auto_35373 ?auto_35374 ) ) ( HOIST-AT ?auto_35375 ?auto_35373 ) ( not ( = ?auto_35376 ?auto_35375 ) ) ( SURFACE-AT ?auto_35369 ?auto_35373 ) ( ON ?auto_35369 ?auto_35372 ) ( CLEAR ?auto_35369 ) ( not ( = ?auto_35368 ?auto_35372 ) ) ( not ( = ?auto_35369 ?auto_35372 ) ) ( not ( = ?auto_35367 ?auto_35372 ) ) ( SURFACE-AT ?auto_35367 ?auto_35374 ) ( CLEAR ?auto_35367 ) ( IS-CRATE ?auto_35368 ) ( AVAILABLE ?auto_35376 ) ( TRUCK-AT ?auto_35370 ?auto_35373 ) ( AVAILABLE ?auto_35375 ) ( SURFACE-AT ?auto_35368 ?auto_35373 ) ( ON ?auto_35368 ?auto_35371 ) ( CLEAR ?auto_35368 ) ( not ( = ?auto_35368 ?auto_35371 ) ) ( not ( = ?auto_35369 ?auto_35371 ) ) ( not ( = ?auto_35367 ?auto_35371 ) ) ( not ( = ?auto_35372 ?auto_35371 ) ) ( ON ?auto_35366 ?auto_35365 ) ( ON ?auto_35367 ?auto_35366 ) ( not ( = ?auto_35365 ?auto_35366 ) ) ( not ( = ?auto_35365 ?auto_35367 ) ) ( not ( = ?auto_35365 ?auto_35368 ) ) ( not ( = ?auto_35365 ?auto_35369 ) ) ( not ( = ?auto_35365 ?auto_35372 ) ) ( not ( = ?auto_35365 ?auto_35371 ) ) ( not ( = ?auto_35366 ?auto_35367 ) ) ( not ( = ?auto_35366 ?auto_35368 ) ) ( not ( = ?auto_35366 ?auto_35369 ) ) ( not ( = ?auto_35366 ?auto_35372 ) ) ( not ( = ?auto_35366 ?auto_35371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35367 ?auto_35368 ?auto_35369 )
      ( MAKE-4CRATE-VERIFY ?auto_35365 ?auto_35366 ?auto_35367 ?auto_35368 ?auto_35369 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35377 - SURFACE
      ?auto_35378 - SURFACE
      ?auto_35379 - SURFACE
      ?auto_35380 - SURFACE
      ?auto_35381 - SURFACE
      ?auto_35382 - SURFACE
    )
    :vars
    (
      ?auto_35389 - HOIST
      ?auto_35387 - PLACE
      ?auto_35386 - PLACE
      ?auto_35388 - HOIST
      ?auto_35385 - SURFACE
      ?auto_35383 - TRUCK
      ?auto_35384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35389 ?auto_35387 ) ( IS-CRATE ?auto_35382 ) ( not ( = ?auto_35381 ?auto_35382 ) ) ( not ( = ?auto_35380 ?auto_35381 ) ) ( not ( = ?auto_35380 ?auto_35382 ) ) ( not ( = ?auto_35386 ?auto_35387 ) ) ( HOIST-AT ?auto_35388 ?auto_35386 ) ( not ( = ?auto_35389 ?auto_35388 ) ) ( SURFACE-AT ?auto_35382 ?auto_35386 ) ( ON ?auto_35382 ?auto_35385 ) ( CLEAR ?auto_35382 ) ( not ( = ?auto_35381 ?auto_35385 ) ) ( not ( = ?auto_35382 ?auto_35385 ) ) ( not ( = ?auto_35380 ?auto_35385 ) ) ( SURFACE-AT ?auto_35380 ?auto_35387 ) ( CLEAR ?auto_35380 ) ( IS-CRATE ?auto_35381 ) ( AVAILABLE ?auto_35389 ) ( TRUCK-AT ?auto_35383 ?auto_35386 ) ( AVAILABLE ?auto_35388 ) ( SURFACE-AT ?auto_35381 ?auto_35386 ) ( ON ?auto_35381 ?auto_35384 ) ( CLEAR ?auto_35381 ) ( not ( = ?auto_35381 ?auto_35384 ) ) ( not ( = ?auto_35382 ?auto_35384 ) ) ( not ( = ?auto_35380 ?auto_35384 ) ) ( not ( = ?auto_35385 ?auto_35384 ) ) ( ON ?auto_35378 ?auto_35377 ) ( ON ?auto_35379 ?auto_35378 ) ( ON ?auto_35380 ?auto_35379 ) ( not ( = ?auto_35377 ?auto_35378 ) ) ( not ( = ?auto_35377 ?auto_35379 ) ) ( not ( = ?auto_35377 ?auto_35380 ) ) ( not ( = ?auto_35377 ?auto_35381 ) ) ( not ( = ?auto_35377 ?auto_35382 ) ) ( not ( = ?auto_35377 ?auto_35385 ) ) ( not ( = ?auto_35377 ?auto_35384 ) ) ( not ( = ?auto_35378 ?auto_35379 ) ) ( not ( = ?auto_35378 ?auto_35380 ) ) ( not ( = ?auto_35378 ?auto_35381 ) ) ( not ( = ?auto_35378 ?auto_35382 ) ) ( not ( = ?auto_35378 ?auto_35385 ) ) ( not ( = ?auto_35378 ?auto_35384 ) ) ( not ( = ?auto_35379 ?auto_35380 ) ) ( not ( = ?auto_35379 ?auto_35381 ) ) ( not ( = ?auto_35379 ?auto_35382 ) ) ( not ( = ?auto_35379 ?auto_35385 ) ) ( not ( = ?auto_35379 ?auto_35384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35380 ?auto_35381 ?auto_35382 )
      ( MAKE-5CRATE-VERIFY ?auto_35377 ?auto_35378 ?auto_35379 ?auto_35380 ?auto_35381 ?auto_35382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35390 - SURFACE
      ?auto_35391 - SURFACE
    )
    :vars
    (
      ?auto_35398 - HOIST
      ?auto_35396 - PLACE
      ?auto_35399 - SURFACE
      ?auto_35395 - PLACE
      ?auto_35397 - HOIST
      ?auto_35394 - SURFACE
      ?auto_35393 - SURFACE
      ?auto_35392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35398 ?auto_35396 ) ( IS-CRATE ?auto_35391 ) ( not ( = ?auto_35390 ?auto_35391 ) ) ( not ( = ?auto_35399 ?auto_35390 ) ) ( not ( = ?auto_35399 ?auto_35391 ) ) ( not ( = ?auto_35395 ?auto_35396 ) ) ( HOIST-AT ?auto_35397 ?auto_35395 ) ( not ( = ?auto_35398 ?auto_35397 ) ) ( SURFACE-AT ?auto_35391 ?auto_35395 ) ( ON ?auto_35391 ?auto_35394 ) ( CLEAR ?auto_35391 ) ( not ( = ?auto_35390 ?auto_35394 ) ) ( not ( = ?auto_35391 ?auto_35394 ) ) ( not ( = ?auto_35399 ?auto_35394 ) ) ( SURFACE-AT ?auto_35399 ?auto_35396 ) ( CLEAR ?auto_35399 ) ( IS-CRATE ?auto_35390 ) ( AVAILABLE ?auto_35398 ) ( AVAILABLE ?auto_35397 ) ( SURFACE-AT ?auto_35390 ?auto_35395 ) ( ON ?auto_35390 ?auto_35393 ) ( CLEAR ?auto_35390 ) ( not ( = ?auto_35390 ?auto_35393 ) ) ( not ( = ?auto_35391 ?auto_35393 ) ) ( not ( = ?auto_35399 ?auto_35393 ) ) ( not ( = ?auto_35394 ?auto_35393 ) ) ( TRUCK-AT ?auto_35392 ?auto_35396 ) )
    :subtasks
    ( ( !DRIVE ?auto_35392 ?auto_35396 ?auto_35395 )
      ( MAKE-2CRATE ?auto_35399 ?auto_35390 ?auto_35391 )
      ( MAKE-1CRATE-VERIFY ?auto_35390 ?auto_35391 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35400 - SURFACE
      ?auto_35401 - SURFACE
      ?auto_35402 - SURFACE
    )
    :vars
    (
      ?auto_35407 - HOIST
      ?auto_35409 - PLACE
      ?auto_35405 - PLACE
      ?auto_35406 - HOIST
      ?auto_35404 - SURFACE
      ?auto_35403 - SURFACE
      ?auto_35408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35407 ?auto_35409 ) ( IS-CRATE ?auto_35402 ) ( not ( = ?auto_35401 ?auto_35402 ) ) ( not ( = ?auto_35400 ?auto_35401 ) ) ( not ( = ?auto_35400 ?auto_35402 ) ) ( not ( = ?auto_35405 ?auto_35409 ) ) ( HOIST-AT ?auto_35406 ?auto_35405 ) ( not ( = ?auto_35407 ?auto_35406 ) ) ( SURFACE-AT ?auto_35402 ?auto_35405 ) ( ON ?auto_35402 ?auto_35404 ) ( CLEAR ?auto_35402 ) ( not ( = ?auto_35401 ?auto_35404 ) ) ( not ( = ?auto_35402 ?auto_35404 ) ) ( not ( = ?auto_35400 ?auto_35404 ) ) ( SURFACE-AT ?auto_35400 ?auto_35409 ) ( CLEAR ?auto_35400 ) ( IS-CRATE ?auto_35401 ) ( AVAILABLE ?auto_35407 ) ( AVAILABLE ?auto_35406 ) ( SURFACE-AT ?auto_35401 ?auto_35405 ) ( ON ?auto_35401 ?auto_35403 ) ( CLEAR ?auto_35401 ) ( not ( = ?auto_35401 ?auto_35403 ) ) ( not ( = ?auto_35402 ?auto_35403 ) ) ( not ( = ?auto_35400 ?auto_35403 ) ) ( not ( = ?auto_35404 ?auto_35403 ) ) ( TRUCK-AT ?auto_35408 ?auto_35409 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35401 ?auto_35402 )
      ( MAKE-2CRATE-VERIFY ?auto_35400 ?auto_35401 ?auto_35402 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35410 - SURFACE
      ?auto_35411 - SURFACE
      ?auto_35412 - SURFACE
      ?auto_35413 - SURFACE
    )
    :vars
    (
      ?auto_35414 - HOIST
      ?auto_35418 - PLACE
      ?auto_35416 - PLACE
      ?auto_35415 - HOIST
      ?auto_35419 - SURFACE
      ?auto_35420 - SURFACE
      ?auto_35417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35414 ?auto_35418 ) ( IS-CRATE ?auto_35413 ) ( not ( = ?auto_35412 ?auto_35413 ) ) ( not ( = ?auto_35411 ?auto_35412 ) ) ( not ( = ?auto_35411 ?auto_35413 ) ) ( not ( = ?auto_35416 ?auto_35418 ) ) ( HOIST-AT ?auto_35415 ?auto_35416 ) ( not ( = ?auto_35414 ?auto_35415 ) ) ( SURFACE-AT ?auto_35413 ?auto_35416 ) ( ON ?auto_35413 ?auto_35419 ) ( CLEAR ?auto_35413 ) ( not ( = ?auto_35412 ?auto_35419 ) ) ( not ( = ?auto_35413 ?auto_35419 ) ) ( not ( = ?auto_35411 ?auto_35419 ) ) ( SURFACE-AT ?auto_35411 ?auto_35418 ) ( CLEAR ?auto_35411 ) ( IS-CRATE ?auto_35412 ) ( AVAILABLE ?auto_35414 ) ( AVAILABLE ?auto_35415 ) ( SURFACE-AT ?auto_35412 ?auto_35416 ) ( ON ?auto_35412 ?auto_35420 ) ( CLEAR ?auto_35412 ) ( not ( = ?auto_35412 ?auto_35420 ) ) ( not ( = ?auto_35413 ?auto_35420 ) ) ( not ( = ?auto_35411 ?auto_35420 ) ) ( not ( = ?auto_35419 ?auto_35420 ) ) ( TRUCK-AT ?auto_35417 ?auto_35418 ) ( ON ?auto_35411 ?auto_35410 ) ( not ( = ?auto_35410 ?auto_35411 ) ) ( not ( = ?auto_35410 ?auto_35412 ) ) ( not ( = ?auto_35410 ?auto_35413 ) ) ( not ( = ?auto_35410 ?auto_35419 ) ) ( not ( = ?auto_35410 ?auto_35420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35411 ?auto_35412 ?auto_35413 )
      ( MAKE-3CRATE-VERIFY ?auto_35410 ?auto_35411 ?auto_35412 ?auto_35413 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35421 - SURFACE
      ?auto_35422 - SURFACE
      ?auto_35423 - SURFACE
      ?auto_35424 - SURFACE
      ?auto_35425 - SURFACE
    )
    :vars
    (
      ?auto_35426 - HOIST
      ?auto_35430 - PLACE
      ?auto_35428 - PLACE
      ?auto_35427 - HOIST
      ?auto_35431 - SURFACE
      ?auto_35432 - SURFACE
      ?auto_35429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35426 ?auto_35430 ) ( IS-CRATE ?auto_35425 ) ( not ( = ?auto_35424 ?auto_35425 ) ) ( not ( = ?auto_35423 ?auto_35424 ) ) ( not ( = ?auto_35423 ?auto_35425 ) ) ( not ( = ?auto_35428 ?auto_35430 ) ) ( HOIST-AT ?auto_35427 ?auto_35428 ) ( not ( = ?auto_35426 ?auto_35427 ) ) ( SURFACE-AT ?auto_35425 ?auto_35428 ) ( ON ?auto_35425 ?auto_35431 ) ( CLEAR ?auto_35425 ) ( not ( = ?auto_35424 ?auto_35431 ) ) ( not ( = ?auto_35425 ?auto_35431 ) ) ( not ( = ?auto_35423 ?auto_35431 ) ) ( SURFACE-AT ?auto_35423 ?auto_35430 ) ( CLEAR ?auto_35423 ) ( IS-CRATE ?auto_35424 ) ( AVAILABLE ?auto_35426 ) ( AVAILABLE ?auto_35427 ) ( SURFACE-AT ?auto_35424 ?auto_35428 ) ( ON ?auto_35424 ?auto_35432 ) ( CLEAR ?auto_35424 ) ( not ( = ?auto_35424 ?auto_35432 ) ) ( not ( = ?auto_35425 ?auto_35432 ) ) ( not ( = ?auto_35423 ?auto_35432 ) ) ( not ( = ?auto_35431 ?auto_35432 ) ) ( TRUCK-AT ?auto_35429 ?auto_35430 ) ( ON ?auto_35422 ?auto_35421 ) ( ON ?auto_35423 ?auto_35422 ) ( not ( = ?auto_35421 ?auto_35422 ) ) ( not ( = ?auto_35421 ?auto_35423 ) ) ( not ( = ?auto_35421 ?auto_35424 ) ) ( not ( = ?auto_35421 ?auto_35425 ) ) ( not ( = ?auto_35421 ?auto_35431 ) ) ( not ( = ?auto_35421 ?auto_35432 ) ) ( not ( = ?auto_35422 ?auto_35423 ) ) ( not ( = ?auto_35422 ?auto_35424 ) ) ( not ( = ?auto_35422 ?auto_35425 ) ) ( not ( = ?auto_35422 ?auto_35431 ) ) ( not ( = ?auto_35422 ?auto_35432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35423 ?auto_35424 ?auto_35425 )
      ( MAKE-4CRATE-VERIFY ?auto_35421 ?auto_35422 ?auto_35423 ?auto_35424 ?auto_35425 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35433 - SURFACE
      ?auto_35434 - SURFACE
      ?auto_35435 - SURFACE
      ?auto_35436 - SURFACE
      ?auto_35437 - SURFACE
      ?auto_35438 - SURFACE
    )
    :vars
    (
      ?auto_35439 - HOIST
      ?auto_35443 - PLACE
      ?auto_35441 - PLACE
      ?auto_35440 - HOIST
      ?auto_35444 - SURFACE
      ?auto_35445 - SURFACE
      ?auto_35442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35439 ?auto_35443 ) ( IS-CRATE ?auto_35438 ) ( not ( = ?auto_35437 ?auto_35438 ) ) ( not ( = ?auto_35436 ?auto_35437 ) ) ( not ( = ?auto_35436 ?auto_35438 ) ) ( not ( = ?auto_35441 ?auto_35443 ) ) ( HOIST-AT ?auto_35440 ?auto_35441 ) ( not ( = ?auto_35439 ?auto_35440 ) ) ( SURFACE-AT ?auto_35438 ?auto_35441 ) ( ON ?auto_35438 ?auto_35444 ) ( CLEAR ?auto_35438 ) ( not ( = ?auto_35437 ?auto_35444 ) ) ( not ( = ?auto_35438 ?auto_35444 ) ) ( not ( = ?auto_35436 ?auto_35444 ) ) ( SURFACE-AT ?auto_35436 ?auto_35443 ) ( CLEAR ?auto_35436 ) ( IS-CRATE ?auto_35437 ) ( AVAILABLE ?auto_35439 ) ( AVAILABLE ?auto_35440 ) ( SURFACE-AT ?auto_35437 ?auto_35441 ) ( ON ?auto_35437 ?auto_35445 ) ( CLEAR ?auto_35437 ) ( not ( = ?auto_35437 ?auto_35445 ) ) ( not ( = ?auto_35438 ?auto_35445 ) ) ( not ( = ?auto_35436 ?auto_35445 ) ) ( not ( = ?auto_35444 ?auto_35445 ) ) ( TRUCK-AT ?auto_35442 ?auto_35443 ) ( ON ?auto_35434 ?auto_35433 ) ( ON ?auto_35435 ?auto_35434 ) ( ON ?auto_35436 ?auto_35435 ) ( not ( = ?auto_35433 ?auto_35434 ) ) ( not ( = ?auto_35433 ?auto_35435 ) ) ( not ( = ?auto_35433 ?auto_35436 ) ) ( not ( = ?auto_35433 ?auto_35437 ) ) ( not ( = ?auto_35433 ?auto_35438 ) ) ( not ( = ?auto_35433 ?auto_35444 ) ) ( not ( = ?auto_35433 ?auto_35445 ) ) ( not ( = ?auto_35434 ?auto_35435 ) ) ( not ( = ?auto_35434 ?auto_35436 ) ) ( not ( = ?auto_35434 ?auto_35437 ) ) ( not ( = ?auto_35434 ?auto_35438 ) ) ( not ( = ?auto_35434 ?auto_35444 ) ) ( not ( = ?auto_35434 ?auto_35445 ) ) ( not ( = ?auto_35435 ?auto_35436 ) ) ( not ( = ?auto_35435 ?auto_35437 ) ) ( not ( = ?auto_35435 ?auto_35438 ) ) ( not ( = ?auto_35435 ?auto_35444 ) ) ( not ( = ?auto_35435 ?auto_35445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35436 ?auto_35437 ?auto_35438 )
      ( MAKE-5CRATE-VERIFY ?auto_35433 ?auto_35434 ?auto_35435 ?auto_35436 ?auto_35437 ?auto_35438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35446 - SURFACE
      ?auto_35447 - SURFACE
    )
    :vars
    (
      ?auto_35448 - HOIST
      ?auto_35453 - PLACE
      ?auto_35452 - SURFACE
      ?auto_35450 - PLACE
      ?auto_35449 - HOIST
      ?auto_35454 - SURFACE
      ?auto_35455 - SURFACE
      ?auto_35451 - TRUCK
      ?auto_35456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35448 ?auto_35453 ) ( IS-CRATE ?auto_35447 ) ( not ( = ?auto_35446 ?auto_35447 ) ) ( not ( = ?auto_35452 ?auto_35446 ) ) ( not ( = ?auto_35452 ?auto_35447 ) ) ( not ( = ?auto_35450 ?auto_35453 ) ) ( HOIST-AT ?auto_35449 ?auto_35450 ) ( not ( = ?auto_35448 ?auto_35449 ) ) ( SURFACE-AT ?auto_35447 ?auto_35450 ) ( ON ?auto_35447 ?auto_35454 ) ( CLEAR ?auto_35447 ) ( not ( = ?auto_35446 ?auto_35454 ) ) ( not ( = ?auto_35447 ?auto_35454 ) ) ( not ( = ?auto_35452 ?auto_35454 ) ) ( IS-CRATE ?auto_35446 ) ( AVAILABLE ?auto_35449 ) ( SURFACE-AT ?auto_35446 ?auto_35450 ) ( ON ?auto_35446 ?auto_35455 ) ( CLEAR ?auto_35446 ) ( not ( = ?auto_35446 ?auto_35455 ) ) ( not ( = ?auto_35447 ?auto_35455 ) ) ( not ( = ?auto_35452 ?auto_35455 ) ) ( not ( = ?auto_35454 ?auto_35455 ) ) ( TRUCK-AT ?auto_35451 ?auto_35453 ) ( SURFACE-AT ?auto_35456 ?auto_35453 ) ( CLEAR ?auto_35456 ) ( LIFTING ?auto_35448 ?auto_35452 ) ( IS-CRATE ?auto_35452 ) ( not ( = ?auto_35456 ?auto_35452 ) ) ( not ( = ?auto_35446 ?auto_35456 ) ) ( not ( = ?auto_35447 ?auto_35456 ) ) ( not ( = ?auto_35454 ?auto_35456 ) ) ( not ( = ?auto_35455 ?auto_35456 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35456 ?auto_35452 )
      ( MAKE-2CRATE ?auto_35452 ?auto_35446 ?auto_35447 )
      ( MAKE-1CRATE-VERIFY ?auto_35446 ?auto_35447 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35457 - SURFACE
      ?auto_35458 - SURFACE
      ?auto_35459 - SURFACE
    )
    :vars
    (
      ?auto_35462 - HOIST
      ?auto_35464 - PLACE
      ?auto_35465 - PLACE
      ?auto_35460 - HOIST
      ?auto_35467 - SURFACE
      ?auto_35463 - SURFACE
      ?auto_35466 - TRUCK
      ?auto_35461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35462 ?auto_35464 ) ( IS-CRATE ?auto_35459 ) ( not ( = ?auto_35458 ?auto_35459 ) ) ( not ( = ?auto_35457 ?auto_35458 ) ) ( not ( = ?auto_35457 ?auto_35459 ) ) ( not ( = ?auto_35465 ?auto_35464 ) ) ( HOIST-AT ?auto_35460 ?auto_35465 ) ( not ( = ?auto_35462 ?auto_35460 ) ) ( SURFACE-AT ?auto_35459 ?auto_35465 ) ( ON ?auto_35459 ?auto_35467 ) ( CLEAR ?auto_35459 ) ( not ( = ?auto_35458 ?auto_35467 ) ) ( not ( = ?auto_35459 ?auto_35467 ) ) ( not ( = ?auto_35457 ?auto_35467 ) ) ( IS-CRATE ?auto_35458 ) ( AVAILABLE ?auto_35460 ) ( SURFACE-AT ?auto_35458 ?auto_35465 ) ( ON ?auto_35458 ?auto_35463 ) ( CLEAR ?auto_35458 ) ( not ( = ?auto_35458 ?auto_35463 ) ) ( not ( = ?auto_35459 ?auto_35463 ) ) ( not ( = ?auto_35457 ?auto_35463 ) ) ( not ( = ?auto_35467 ?auto_35463 ) ) ( TRUCK-AT ?auto_35466 ?auto_35464 ) ( SURFACE-AT ?auto_35461 ?auto_35464 ) ( CLEAR ?auto_35461 ) ( LIFTING ?auto_35462 ?auto_35457 ) ( IS-CRATE ?auto_35457 ) ( not ( = ?auto_35461 ?auto_35457 ) ) ( not ( = ?auto_35458 ?auto_35461 ) ) ( not ( = ?auto_35459 ?auto_35461 ) ) ( not ( = ?auto_35467 ?auto_35461 ) ) ( not ( = ?auto_35463 ?auto_35461 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35458 ?auto_35459 )
      ( MAKE-2CRATE-VERIFY ?auto_35457 ?auto_35458 ?auto_35459 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35468 - SURFACE
      ?auto_35469 - SURFACE
      ?auto_35470 - SURFACE
      ?auto_35471 - SURFACE
    )
    :vars
    (
      ?auto_35475 - HOIST
      ?auto_35472 - PLACE
      ?auto_35478 - PLACE
      ?auto_35473 - HOIST
      ?auto_35476 - SURFACE
      ?auto_35477 - SURFACE
      ?auto_35474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35475 ?auto_35472 ) ( IS-CRATE ?auto_35471 ) ( not ( = ?auto_35470 ?auto_35471 ) ) ( not ( = ?auto_35469 ?auto_35470 ) ) ( not ( = ?auto_35469 ?auto_35471 ) ) ( not ( = ?auto_35478 ?auto_35472 ) ) ( HOIST-AT ?auto_35473 ?auto_35478 ) ( not ( = ?auto_35475 ?auto_35473 ) ) ( SURFACE-AT ?auto_35471 ?auto_35478 ) ( ON ?auto_35471 ?auto_35476 ) ( CLEAR ?auto_35471 ) ( not ( = ?auto_35470 ?auto_35476 ) ) ( not ( = ?auto_35471 ?auto_35476 ) ) ( not ( = ?auto_35469 ?auto_35476 ) ) ( IS-CRATE ?auto_35470 ) ( AVAILABLE ?auto_35473 ) ( SURFACE-AT ?auto_35470 ?auto_35478 ) ( ON ?auto_35470 ?auto_35477 ) ( CLEAR ?auto_35470 ) ( not ( = ?auto_35470 ?auto_35477 ) ) ( not ( = ?auto_35471 ?auto_35477 ) ) ( not ( = ?auto_35469 ?auto_35477 ) ) ( not ( = ?auto_35476 ?auto_35477 ) ) ( TRUCK-AT ?auto_35474 ?auto_35472 ) ( SURFACE-AT ?auto_35468 ?auto_35472 ) ( CLEAR ?auto_35468 ) ( LIFTING ?auto_35475 ?auto_35469 ) ( IS-CRATE ?auto_35469 ) ( not ( = ?auto_35468 ?auto_35469 ) ) ( not ( = ?auto_35470 ?auto_35468 ) ) ( not ( = ?auto_35471 ?auto_35468 ) ) ( not ( = ?auto_35476 ?auto_35468 ) ) ( not ( = ?auto_35477 ?auto_35468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35469 ?auto_35470 ?auto_35471 )
      ( MAKE-3CRATE-VERIFY ?auto_35468 ?auto_35469 ?auto_35470 ?auto_35471 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35479 - SURFACE
      ?auto_35480 - SURFACE
      ?auto_35481 - SURFACE
      ?auto_35482 - SURFACE
      ?auto_35483 - SURFACE
    )
    :vars
    (
      ?auto_35487 - HOIST
      ?auto_35484 - PLACE
      ?auto_35490 - PLACE
      ?auto_35485 - HOIST
      ?auto_35488 - SURFACE
      ?auto_35489 - SURFACE
      ?auto_35486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35487 ?auto_35484 ) ( IS-CRATE ?auto_35483 ) ( not ( = ?auto_35482 ?auto_35483 ) ) ( not ( = ?auto_35481 ?auto_35482 ) ) ( not ( = ?auto_35481 ?auto_35483 ) ) ( not ( = ?auto_35490 ?auto_35484 ) ) ( HOIST-AT ?auto_35485 ?auto_35490 ) ( not ( = ?auto_35487 ?auto_35485 ) ) ( SURFACE-AT ?auto_35483 ?auto_35490 ) ( ON ?auto_35483 ?auto_35488 ) ( CLEAR ?auto_35483 ) ( not ( = ?auto_35482 ?auto_35488 ) ) ( not ( = ?auto_35483 ?auto_35488 ) ) ( not ( = ?auto_35481 ?auto_35488 ) ) ( IS-CRATE ?auto_35482 ) ( AVAILABLE ?auto_35485 ) ( SURFACE-AT ?auto_35482 ?auto_35490 ) ( ON ?auto_35482 ?auto_35489 ) ( CLEAR ?auto_35482 ) ( not ( = ?auto_35482 ?auto_35489 ) ) ( not ( = ?auto_35483 ?auto_35489 ) ) ( not ( = ?auto_35481 ?auto_35489 ) ) ( not ( = ?auto_35488 ?auto_35489 ) ) ( TRUCK-AT ?auto_35486 ?auto_35484 ) ( SURFACE-AT ?auto_35480 ?auto_35484 ) ( CLEAR ?auto_35480 ) ( LIFTING ?auto_35487 ?auto_35481 ) ( IS-CRATE ?auto_35481 ) ( not ( = ?auto_35480 ?auto_35481 ) ) ( not ( = ?auto_35482 ?auto_35480 ) ) ( not ( = ?auto_35483 ?auto_35480 ) ) ( not ( = ?auto_35488 ?auto_35480 ) ) ( not ( = ?auto_35489 ?auto_35480 ) ) ( ON ?auto_35480 ?auto_35479 ) ( not ( = ?auto_35479 ?auto_35480 ) ) ( not ( = ?auto_35479 ?auto_35481 ) ) ( not ( = ?auto_35479 ?auto_35482 ) ) ( not ( = ?auto_35479 ?auto_35483 ) ) ( not ( = ?auto_35479 ?auto_35488 ) ) ( not ( = ?auto_35479 ?auto_35489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35481 ?auto_35482 ?auto_35483 )
      ( MAKE-4CRATE-VERIFY ?auto_35479 ?auto_35480 ?auto_35481 ?auto_35482 ?auto_35483 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35491 - SURFACE
      ?auto_35492 - SURFACE
      ?auto_35493 - SURFACE
      ?auto_35494 - SURFACE
      ?auto_35495 - SURFACE
      ?auto_35496 - SURFACE
    )
    :vars
    (
      ?auto_35500 - HOIST
      ?auto_35497 - PLACE
      ?auto_35503 - PLACE
      ?auto_35498 - HOIST
      ?auto_35501 - SURFACE
      ?auto_35502 - SURFACE
      ?auto_35499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35500 ?auto_35497 ) ( IS-CRATE ?auto_35496 ) ( not ( = ?auto_35495 ?auto_35496 ) ) ( not ( = ?auto_35494 ?auto_35495 ) ) ( not ( = ?auto_35494 ?auto_35496 ) ) ( not ( = ?auto_35503 ?auto_35497 ) ) ( HOIST-AT ?auto_35498 ?auto_35503 ) ( not ( = ?auto_35500 ?auto_35498 ) ) ( SURFACE-AT ?auto_35496 ?auto_35503 ) ( ON ?auto_35496 ?auto_35501 ) ( CLEAR ?auto_35496 ) ( not ( = ?auto_35495 ?auto_35501 ) ) ( not ( = ?auto_35496 ?auto_35501 ) ) ( not ( = ?auto_35494 ?auto_35501 ) ) ( IS-CRATE ?auto_35495 ) ( AVAILABLE ?auto_35498 ) ( SURFACE-AT ?auto_35495 ?auto_35503 ) ( ON ?auto_35495 ?auto_35502 ) ( CLEAR ?auto_35495 ) ( not ( = ?auto_35495 ?auto_35502 ) ) ( not ( = ?auto_35496 ?auto_35502 ) ) ( not ( = ?auto_35494 ?auto_35502 ) ) ( not ( = ?auto_35501 ?auto_35502 ) ) ( TRUCK-AT ?auto_35499 ?auto_35497 ) ( SURFACE-AT ?auto_35493 ?auto_35497 ) ( CLEAR ?auto_35493 ) ( LIFTING ?auto_35500 ?auto_35494 ) ( IS-CRATE ?auto_35494 ) ( not ( = ?auto_35493 ?auto_35494 ) ) ( not ( = ?auto_35495 ?auto_35493 ) ) ( not ( = ?auto_35496 ?auto_35493 ) ) ( not ( = ?auto_35501 ?auto_35493 ) ) ( not ( = ?auto_35502 ?auto_35493 ) ) ( ON ?auto_35492 ?auto_35491 ) ( ON ?auto_35493 ?auto_35492 ) ( not ( = ?auto_35491 ?auto_35492 ) ) ( not ( = ?auto_35491 ?auto_35493 ) ) ( not ( = ?auto_35491 ?auto_35494 ) ) ( not ( = ?auto_35491 ?auto_35495 ) ) ( not ( = ?auto_35491 ?auto_35496 ) ) ( not ( = ?auto_35491 ?auto_35501 ) ) ( not ( = ?auto_35491 ?auto_35502 ) ) ( not ( = ?auto_35492 ?auto_35493 ) ) ( not ( = ?auto_35492 ?auto_35494 ) ) ( not ( = ?auto_35492 ?auto_35495 ) ) ( not ( = ?auto_35492 ?auto_35496 ) ) ( not ( = ?auto_35492 ?auto_35501 ) ) ( not ( = ?auto_35492 ?auto_35502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35494 ?auto_35495 ?auto_35496 )
      ( MAKE-5CRATE-VERIFY ?auto_35491 ?auto_35492 ?auto_35493 ?auto_35494 ?auto_35495 ?auto_35496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35504 - SURFACE
      ?auto_35505 - SURFACE
    )
    :vars
    (
      ?auto_35511 - HOIST
      ?auto_35507 - PLACE
      ?auto_35510 - SURFACE
      ?auto_35514 - PLACE
      ?auto_35508 - HOIST
      ?auto_35512 - SURFACE
      ?auto_35513 - SURFACE
      ?auto_35509 - TRUCK
      ?auto_35506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35511 ?auto_35507 ) ( IS-CRATE ?auto_35505 ) ( not ( = ?auto_35504 ?auto_35505 ) ) ( not ( = ?auto_35510 ?auto_35504 ) ) ( not ( = ?auto_35510 ?auto_35505 ) ) ( not ( = ?auto_35514 ?auto_35507 ) ) ( HOIST-AT ?auto_35508 ?auto_35514 ) ( not ( = ?auto_35511 ?auto_35508 ) ) ( SURFACE-AT ?auto_35505 ?auto_35514 ) ( ON ?auto_35505 ?auto_35512 ) ( CLEAR ?auto_35505 ) ( not ( = ?auto_35504 ?auto_35512 ) ) ( not ( = ?auto_35505 ?auto_35512 ) ) ( not ( = ?auto_35510 ?auto_35512 ) ) ( IS-CRATE ?auto_35504 ) ( AVAILABLE ?auto_35508 ) ( SURFACE-AT ?auto_35504 ?auto_35514 ) ( ON ?auto_35504 ?auto_35513 ) ( CLEAR ?auto_35504 ) ( not ( = ?auto_35504 ?auto_35513 ) ) ( not ( = ?auto_35505 ?auto_35513 ) ) ( not ( = ?auto_35510 ?auto_35513 ) ) ( not ( = ?auto_35512 ?auto_35513 ) ) ( TRUCK-AT ?auto_35509 ?auto_35507 ) ( SURFACE-AT ?auto_35506 ?auto_35507 ) ( CLEAR ?auto_35506 ) ( IS-CRATE ?auto_35510 ) ( not ( = ?auto_35506 ?auto_35510 ) ) ( not ( = ?auto_35504 ?auto_35506 ) ) ( not ( = ?auto_35505 ?auto_35506 ) ) ( not ( = ?auto_35512 ?auto_35506 ) ) ( not ( = ?auto_35513 ?auto_35506 ) ) ( AVAILABLE ?auto_35511 ) ( IN ?auto_35510 ?auto_35509 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35511 ?auto_35510 ?auto_35509 ?auto_35507 )
      ( MAKE-2CRATE ?auto_35510 ?auto_35504 ?auto_35505 )
      ( MAKE-1CRATE-VERIFY ?auto_35504 ?auto_35505 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35515 - SURFACE
      ?auto_35516 - SURFACE
      ?auto_35517 - SURFACE
    )
    :vars
    (
      ?auto_35522 - HOIST
      ?auto_35523 - PLACE
      ?auto_35524 - PLACE
      ?auto_35520 - HOIST
      ?auto_35525 - SURFACE
      ?auto_35519 - SURFACE
      ?auto_35521 - TRUCK
      ?auto_35518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35522 ?auto_35523 ) ( IS-CRATE ?auto_35517 ) ( not ( = ?auto_35516 ?auto_35517 ) ) ( not ( = ?auto_35515 ?auto_35516 ) ) ( not ( = ?auto_35515 ?auto_35517 ) ) ( not ( = ?auto_35524 ?auto_35523 ) ) ( HOIST-AT ?auto_35520 ?auto_35524 ) ( not ( = ?auto_35522 ?auto_35520 ) ) ( SURFACE-AT ?auto_35517 ?auto_35524 ) ( ON ?auto_35517 ?auto_35525 ) ( CLEAR ?auto_35517 ) ( not ( = ?auto_35516 ?auto_35525 ) ) ( not ( = ?auto_35517 ?auto_35525 ) ) ( not ( = ?auto_35515 ?auto_35525 ) ) ( IS-CRATE ?auto_35516 ) ( AVAILABLE ?auto_35520 ) ( SURFACE-AT ?auto_35516 ?auto_35524 ) ( ON ?auto_35516 ?auto_35519 ) ( CLEAR ?auto_35516 ) ( not ( = ?auto_35516 ?auto_35519 ) ) ( not ( = ?auto_35517 ?auto_35519 ) ) ( not ( = ?auto_35515 ?auto_35519 ) ) ( not ( = ?auto_35525 ?auto_35519 ) ) ( TRUCK-AT ?auto_35521 ?auto_35523 ) ( SURFACE-AT ?auto_35518 ?auto_35523 ) ( CLEAR ?auto_35518 ) ( IS-CRATE ?auto_35515 ) ( not ( = ?auto_35518 ?auto_35515 ) ) ( not ( = ?auto_35516 ?auto_35518 ) ) ( not ( = ?auto_35517 ?auto_35518 ) ) ( not ( = ?auto_35525 ?auto_35518 ) ) ( not ( = ?auto_35519 ?auto_35518 ) ) ( AVAILABLE ?auto_35522 ) ( IN ?auto_35515 ?auto_35521 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35516 ?auto_35517 )
      ( MAKE-2CRATE-VERIFY ?auto_35515 ?auto_35516 ?auto_35517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35526 - SURFACE
      ?auto_35527 - SURFACE
      ?auto_35528 - SURFACE
      ?auto_35529 - SURFACE
    )
    :vars
    (
      ?auto_35530 - HOIST
      ?auto_35535 - PLACE
      ?auto_35533 - PLACE
      ?auto_35531 - HOIST
      ?auto_35532 - SURFACE
      ?auto_35536 - SURFACE
      ?auto_35534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35530 ?auto_35535 ) ( IS-CRATE ?auto_35529 ) ( not ( = ?auto_35528 ?auto_35529 ) ) ( not ( = ?auto_35527 ?auto_35528 ) ) ( not ( = ?auto_35527 ?auto_35529 ) ) ( not ( = ?auto_35533 ?auto_35535 ) ) ( HOIST-AT ?auto_35531 ?auto_35533 ) ( not ( = ?auto_35530 ?auto_35531 ) ) ( SURFACE-AT ?auto_35529 ?auto_35533 ) ( ON ?auto_35529 ?auto_35532 ) ( CLEAR ?auto_35529 ) ( not ( = ?auto_35528 ?auto_35532 ) ) ( not ( = ?auto_35529 ?auto_35532 ) ) ( not ( = ?auto_35527 ?auto_35532 ) ) ( IS-CRATE ?auto_35528 ) ( AVAILABLE ?auto_35531 ) ( SURFACE-AT ?auto_35528 ?auto_35533 ) ( ON ?auto_35528 ?auto_35536 ) ( CLEAR ?auto_35528 ) ( not ( = ?auto_35528 ?auto_35536 ) ) ( not ( = ?auto_35529 ?auto_35536 ) ) ( not ( = ?auto_35527 ?auto_35536 ) ) ( not ( = ?auto_35532 ?auto_35536 ) ) ( TRUCK-AT ?auto_35534 ?auto_35535 ) ( SURFACE-AT ?auto_35526 ?auto_35535 ) ( CLEAR ?auto_35526 ) ( IS-CRATE ?auto_35527 ) ( not ( = ?auto_35526 ?auto_35527 ) ) ( not ( = ?auto_35528 ?auto_35526 ) ) ( not ( = ?auto_35529 ?auto_35526 ) ) ( not ( = ?auto_35532 ?auto_35526 ) ) ( not ( = ?auto_35536 ?auto_35526 ) ) ( AVAILABLE ?auto_35530 ) ( IN ?auto_35527 ?auto_35534 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35527 ?auto_35528 ?auto_35529 )
      ( MAKE-3CRATE-VERIFY ?auto_35526 ?auto_35527 ?auto_35528 ?auto_35529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35537 - SURFACE
      ?auto_35538 - SURFACE
      ?auto_35539 - SURFACE
      ?auto_35540 - SURFACE
      ?auto_35541 - SURFACE
    )
    :vars
    (
      ?auto_35542 - HOIST
      ?auto_35547 - PLACE
      ?auto_35545 - PLACE
      ?auto_35543 - HOIST
      ?auto_35544 - SURFACE
      ?auto_35548 - SURFACE
      ?auto_35546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35542 ?auto_35547 ) ( IS-CRATE ?auto_35541 ) ( not ( = ?auto_35540 ?auto_35541 ) ) ( not ( = ?auto_35539 ?auto_35540 ) ) ( not ( = ?auto_35539 ?auto_35541 ) ) ( not ( = ?auto_35545 ?auto_35547 ) ) ( HOIST-AT ?auto_35543 ?auto_35545 ) ( not ( = ?auto_35542 ?auto_35543 ) ) ( SURFACE-AT ?auto_35541 ?auto_35545 ) ( ON ?auto_35541 ?auto_35544 ) ( CLEAR ?auto_35541 ) ( not ( = ?auto_35540 ?auto_35544 ) ) ( not ( = ?auto_35541 ?auto_35544 ) ) ( not ( = ?auto_35539 ?auto_35544 ) ) ( IS-CRATE ?auto_35540 ) ( AVAILABLE ?auto_35543 ) ( SURFACE-AT ?auto_35540 ?auto_35545 ) ( ON ?auto_35540 ?auto_35548 ) ( CLEAR ?auto_35540 ) ( not ( = ?auto_35540 ?auto_35548 ) ) ( not ( = ?auto_35541 ?auto_35548 ) ) ( not ( = ?auto_35539 ?auto_35548 ) ) ( not ( = ?auto_35544 ?auto_35548 ) ) ( TRUCK-AT ?auto_35546 ?auto_35547 ) ( SURFACE-AT ?auto_35538 ?auto_35547 ) ( CLEAR ?auto_35538 ) ( IS-CRATE ?auto_35539 ) ( not ( = ?auto_35538 ?auto_35539 ) ) ( not ( = ?auto_35540 ?auto_35538 ) ) ( not ( = ?auto_35541 ?auto_35538 ) ) ( not ( = ?auto_35544 ?auto_35538 ) ) ( not ( = ?auto_35548 ?auto_35538 ) ) ( AVAILABLE ?auto_35542 ) ( IN ?auto_35539 ?auto_35546 ) ( ON ?auto_35538 ?auto_35537 ) ( not ( = ?auto_35537 ?auto_35538 ) ) ( not ( = ?auto_35537 ?auto_35539 ) ) ( not ( = ?auto_35537 ?auto_35540 ) ) ( not ( = ?auto_35537 ?auto_35541 ) ) ( not ( = ?auto_35537 ?auto_35544 ) ) ( not ( = ?auto_35537 ?auto_35548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35539 ?auto_35540 ?auto_35541 )
      ( MAKE-4CRATE-VERIFY ?auto_35537 ?auto_35538 ?auto_35539 ?auto_35540 ?auto_35541 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35549 - SURFACE
      ?auto_35550 - SURFACE
      ?auto_35551 - SURFACE
      ?auto_35552 - SURFACE
      ?auto_35553 - SURFACE
      ?auto_35554 - SURFACE
    )
    :vars
    (
      ?auto_35555 - HOIST
      ?auto_35560 - PLACE
      ?auto_35558 - PLACE
      ?auto_35556 - HOIST
      ?auto_35557 - SURFACE
      ?auto_35561 - SURFACE
      ?auto_35559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35555 ?auto_35560 ) ( IS-CRATE ?auto_35554 ) ( not ( = ?auto_35553 ?auto_35554 ) ) ( not ( = ?auto_35552 ?auto_35553 ) ) ( not ( = ?auto_35552 ?auto_35554 ) ) ( not ( = ?auto_35558 ?auto_35560 ) ) ( HOIST-AT ?auto_35556 ?auto_35558 ) ( not ( = ?auto_35555 ?auto_35556 ) ) ( SURFACE-AT ?auto_35554 ?auto_35558 ) ( ON ?auto_35554 ?auto_35557 ) ( CLEAR ?auto_35554 ) ( not ( = ?auto_35553 ?auto_35557 ) ) ( not ( = ?auto_35554 ?auto_35557 ) ) ( not ( = ?auto_35552 ?auto_35557 ) ) ( IS-CRATE ?auto_35553 ) ( AVAILABLE ?auto_35556 ) ( SURFACE-AT ?auto_35553 ?auto_35558 ) ( ON ?auto_35553 ?auto_35561 ) ( CLEAR ?auto_35553 ) ( not ( = ?auto_35553 ?auto_35561 ) ) ( not ( = ?auto_35554 ?auto_35561 ) ) ( not ( = ?auto_35552 ?auto_35561 ) ) ( not ( = ?auto_35557 ?auto_35561 ) ) ( TRUCK-AT ?auto_35559 ?auto_35560 ) ( SURFACE-AT ?auto_35551 ?auto_35560 ) ( CLEAR ?auto_35551 ) ( IS-CRATE ?auto_35552 ) ( not ( = ?auto_35551 ?auto_35552 ) ) ( not ( = ?auto_35553 ?auto_35551 ) ) ( not ( = ?auto_35554 ?auto_35551 ) ) ( not ( = ?auto_35557 ?auto_35551 ) ) ( not ( = ?auto_35561 ?auto_35551 ) ) ( AVAILABLE ?auto_35555 ) ( IN ?auto_35552 ?auto_35559 ) ( ON ?auto_35550 ?auto_35549 ) ( ON ?auto_35551 ?auto_35550 ) ( not ( = ?auto_35549 ?auto_35550 ) ) ( not ( = ?auto_35549 ?auto_35551 ) ) ( not ( = ?auto_35549 ?auto_35552 ) ) ( not ( = ?auto_35549 ?auto_35553 ) ) ( not ( = ?auto_35549 ?auto_35554 ) ) ( not ( = ?auto_35549 ?auto_35557 ) ) ( not ( = ?auto_35549 ?auto_35561 ) ) ( not ( = ?auto_35550 ?auto_35551 ) ) ( not ( = ?auto_35550 ?auto_35552 ) ) ( not ( = ?auto_35550 ?auto_35553 ) ) ( not ( = ?auto_35550 ?auto_35554 ) ) ( not ( = ?auto_35550 ?auto_35557 ) ) ( not ( = ?auto_35550 ?auto_35561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35552 ?auto_35553 ?auto_35554 )
      ( MAKE-5CRATE-VERIFY ?auto_35549 ?auto_35550 ?auto_35551 ?auto_35552 ?auto_35553 ?auto_35554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35562 - SURFACE
      ?auto_35563 - SURFACE
    )
    :vars
    (
      ?auto_35564 - HOIST
      ?auto_35571 - PLACE
      ?auto_35565 - SURFACE
      ?auto_35569 - PLACE
      ?auto_35566 - HOIST
      ?auto_35568 - SURFACE
      ?auto_35572 - SURFACE
      ?auto_35567 - SURFACE
      ?auto_35570 - TRUCK
      ?auto_35573 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35564 ?auto_35571 ) ( IS-CRATE ?auto_35563 ) ( not ( = ?auto_35562 ?auto_35563 ) ) ( not ( = ?auto_35565 ?auto_35562 ) ) ( not ( = ?auto_35565 ?auto_35563 ) ) ( not ( = ?auto_35569 ?auto_35571 ) ) ( HOIST-AT ?auto_35566 ?auto_35569 ) ( not ( = ?auto_35564 ?auto_35566 ) ) ( SURFACE-AT ?auto_35563 ?auto_35569 ) ( ON ?auto_35563 ?auto_35568 ) ( CLEAR ?auto_35563 ) ( not ( = ?auto_35562 ?auto_35568 ) ) ( not ( = ?auto_35563 ?auto_35568 ) ) ( not ( = ?auto_35565 ?auto_35568 ) ) ( IS-CRATE ?auto_35562 ) ( AVAILABLE ?auto_35566 ) ( SURFACE-AT ?auto_35562 ?auto_35569 ) ( ON ?auto_35562 ?auto_35572 ) ( CLEAR ?auto_35562 ) ( not ( = ?auto_35562 ?auto_35572 ) ) ( not ( = ?auto_35563 ?auto_35572 ) ) ( not ( = ?auto_35565 ?auto_35572 ) ) ( not ( = ?auto_35568 ?auto_35572 ) ) ( SURFACE-AT ?auto_35567 ?auto_35571 ) ( CLEAR ?auto_35567 ) ( IS-CRATE ?auto_35565 ) ( not ( = ?auto_35567 ?auto_35565 ) ) ( not ( = ?auto_35562 ?auto_35567 ) ) ( not ( = ?auto_35563 ?auto_35567 ) ) ( not ( = ?auto_35568 ?auto_35567 ) ) ( not ( = ?auto_35572 ?auto_35567 ) ) ( AVAILABLE ?auto_35564 ) ( IN ?auto_35565 ?auto_35570 ) ( TRUCK-AT ?auto_35570 ?auto_35573 ) ( not ( = ?auto_35573 ?auto_35571 ) ) ( not ( = ?auto_35569 ?auto_35573 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35570 ?auto_35573 ?auto_35571 )
      ( MAKE-2CRATE ?auto_35565 ?auto_35562 ?auto_35563 )
      ( MAKE-1CRATE-VERIFY ?auto_35562 ?auto_35563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35574 - SURFACE
      ?auto_35575 - SURFACE
      ?auto_35576 - SURFACE
    )
    :vars
    (
      ?auto_35580 - HOIST
      ?auto_35579 - PLACE
      ?auto_35584 - PLACE
      ?auto_35585 - HOIST
      ?auto_35581 - SURFACE
      ?auto_35577 - SURFACE
      ?auto_35583 - SURFACE
      ?auto_35578 - TRUCK
      ?auto_35582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35580 ?auto_35579 ) ( IS-CRATE ?auto_35576 ) ( not ( = ?auto_35575 ?auto_35576 ) ) ( not ( = ?auto_35574 ?auto_35575 ) ) ( not ( = ?auto_35574 ?auto_35576 ) ) ( not ( = ?auto_35584 ?auto_35579 ) ) ( HOIST-AT ?auto_35585 ?auto_35584 ) ( not ( = ?auto_35580 ?auto_35585 ) ) ( SURFACE-AT ?auto_35576 ?auto_35584 ) ( ON ?auto_35576 ?auto_35581 ) ( CLEAR ?auto_35576 ) ( not ( = ?auto_35575 ?auto_35581 ) ) ( not ( = ?auto_35576 ?auto_35581 ) ) ( not ( = ?auto_35574 ?auto_35581 ) ) ( IS-CRATE ?auto_35575 ) ( AVAILABLE ?auto_35585 ) ( SURFACE-AT ?auto_35575 ?auto_35584 ) ( ON ?auto_35575 ?auto_35577 ) ( CLEAR ?auto_35575 ) ( not ( = ?auto_35575 ?auto_35577 ) ) ( not ( = ?auto_35576 ?auto_35577 ) ) ( not ( = ?auto_35574 ?auto_35577 ) ) ( not ( = ?auto_35581 ?auto_35577 ) ) ( SURFACE-AT ?auto_35583 ?auto_35579 ) ( CLEAR ?auto_35583 ) ( IS-CRATE ?auto_35574 ) ( not ( = ?auto_35583 ?auto_35574 ) ) ( not ( = ?auto_35575 ?auto_35583 ) ) ( not ( = ?auto_35576 ?auto_35583 ) ) ( not ( = ?auto_35581 ?auto_35583 ) ) ( not ( = ?auto_35577 ?auto_35583 ) ) ( AVAILABLE ?auto_35580 ) ( IN ?auto_35574 ?auto_35578 ) ( TRUCK-AT ?auto_35578 ?auto_35582 ) ( not ( = ?auto_35582 ?auto_35579 ) ) ( not ( = ?auto_35584 ?auto_35582 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35575 ?auto_35576 )
      ( MAKE-2CRATE-VERIFY ?auto_35574 ?auto_35575 ?auto_35576 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35586 - SURFACE
      ?auto_35587 - SURFACE
      ?auto_35588 - SURFACE
      ?auto_35589 - SURFACE
    )
    :vars
    (
      ?auto_35593 - HOIST
      ?auto_35594 - PLACE
      ?auto_35597 - PLACE
      ?auto_35595 - HOIST
      ?auto_35596 - SURFACE
      ?auto_35591 - SURFACE
      ?auto_35590 - TRUCK
      ?auto_35592 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35593 ?auto_35594 ) ( IS-CRATE ?auto_35589 ) ( not ( = ?auto_35588 ?auto_35589 ) ) ( not ( = ?auto_35587 ?auto_35588 ) ) ( not ( = ?auto_35587 ?auto_35589 ) ) ( not ( = ?auto_35597 ?auto_35594 ) ) ( HOIST-AT ?auto_35595 ?auto_35597 ) ( not ( = ?auto_35593 ?auto_35595 ) ) ( SURFACE-AT ?auto_35589 ?auto_35597 ) ( ON ?auto_35589 ?auto_35596 ) ( CLEAR ?auto_35589 ) ( not ( = ?auto_35588 ?auto_35596 ) ) ( not ( = ?auto_35589 ?auto_35596 ) ) ( not ( = ?auto_35587 ?auto_35596 ) ) ( IS-CRATE ?auto_35588 ) ( AVAILABLE ?auto_35595 ) ( SURFACE-AT ?auto_35588 ?auto_35597 ) ( ON ?auto_35588 ?auto_35591 ) ( CLEAR ?auto_35588 ) ( not ( = ?auto_35588 ?auto_35591 ) ) ( not ( = ?auto_35589 ?auto_35591 ) ) ( not ( = ?auto_35587 ?auto_35591 ) ) ( not ( = ?auto_35596 ?auto_35591 ) ) ( SURFACE-AT ?auto_35586 ?auto_35594 ) ( CLEAR ?auto_35586 ) ( IS-CRATE ?auto_35587 ) ( not ( = ?auto_35586 ?auto_35587 ) ) ( not ( = ?auto_35588 ?auto_35586 ) ) ( not ( = ?auto_35589 ?auto_35586 ) ) ( not ( = ?auto_35596 ?auto_35586 ) ) ( not ( = ?auto_35591 ?auto_35586 ) ) ( AVAILABLE ?auto_35593 ) ( IN ?auto_35587 ?auto_35590 ) ( TRUCK-AT ?auto_35590 ?auto_35592 ) ( not ( = ?auto_35592 ?auto_35594 ) ) ( not ( = ?auto_35597 ?auto_35592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35587 ?auto_35588 ?auto_35589 )
      ( MAKE-3CRATE-VERIFY ?auto_35586 ?auto_35587 ?auto_35588 ?auto_35589 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35598 - SURFACE
      ?auto_35599 - SURFACE
      ?auto_35600 - SURFACE
      ?auto_35601 - SURFACE
      ?auto_35602 - SURFACE
    )
    :vars
    (
      ?auto_35606 - HOIST
      ?auto_35607 - PLACE
      ?auto_35610 - PLACE
      ?auto_35608 - HOIST
      ?auto_35609 - SURFACE
      ?auto_35604 - SURFACE
      ?auto_35603 - TRUCK
      ?auto_35605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35606 ?auto_35607 ) ( IS-CRATE ?auto_35602 ) ( not ( = ?auto_35601 ?auto_35602 ) ) ( not ( = ?auto_35600 ?auto_35601 ) ) ( not ( = ?auto_35600 ?auto_35602 ) ) ( not ( = ?auto_35610 ?auto_35607 ) ) ( HOIST-AT ?auto_35608 ?auto_35610 ) ( not ( = ?auto_35606 ?auto_35608 ) ) ( SURFACE-AT ?auto_35602 ?auto_35610 ) ( ON ?auto_35602 ?auto_35609 ) ( CLEAR ?auto_35602 ) ( not ( = ?auto_35601 ?auto_35609 ) ) ( not ( = ?auto_35602 ?auto_35609 ) ) ( not ( = ?auto_35600 ?auto_35609 ) ) ( IS-CRATE ?auto_35601 ) ( AVAILABLE ?auto_35608 ) ( SURFACE-AT ?auto_35601 ?auto_35610 ) ( ON ?auto_35601 ?auto_35604 ) ( CLEAR ?auto_35601 ) ( not ( = ?auto_35601 ?auto_35604 ) ) ( not ( = ?auto_35602 ?auto_35604 ) ) ( not ( = ?auto_35600 ?auto_35604 ) ) ( not ( = ?auto_35609 ?auto_35604 ) ) ( SURFACE-AT ?auto_35599 ?auto_35607 ) ( CLEAR ?auto_35599 ) ( IS-CRATE ?auto_35600 ) ( not ( = ?auto_35599 ?auto_35600 ) ) ( not ( = ?auto_35601 ?auto_35599 ) ) ( not ( = ?auto_35602 ?auto_35599 ) ) ( not ( = ?auto_35609 ?auto_35599 ) ) ( not ( = ?auto_35604 ?auto_35599 ) ) ( AVAILABLE ?auto_35606 ) ( IN ?auto_35600 ?auto_35603 ) ( TRUCK-AT ?auto_35603 ?auto_35605 ) ( not ( = ?auto_35605 ?auto_35607 ) ) ( not ( = ?auto_35610 ?auto_35605 ) ) ( ON ?auto_35599 ?auto_35598 ) ( not ( = ?auto_35598 ?auto_35599 ) ) ( not ( = ?auto_35598 ?auto_35600 ) ) ( not ( = ?auto_35598 ?auto_35601 ) ) ( not ( = ?auto_35598 ?auto_35602 ) ) ( not ( = ?auto_35598 ?auto_35609 ) ) ( not ( = ?auto_35598 ?auto_35604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35600 ?auto_35601 ?auto_35602 )
      ( MAKE-4CRATE-VERIFY ?auto_35598 ?auto_35599 ?auto_35600 ?auto_35601 ?auto_35602 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35611 - SURFACE
      ?auto_35612 - SURFACE
      ?auto_35613 - SURFACE
      ?auto_35614 - SURFACE
      ?auto_35615 - SURFACE
      ?auto_35616 - SURFACE
    )
    :vars
    (
      ?auto_35620 - HOIST
      ?auto_35621 - PLACE
      ?auto_35624 - PLACE
      ?auto_35622 - HOIST
      ?auto_35623 - SURFACE
      ?auto_35618 - SURFACE
      ?auto_35617 - TRUCK
      ?auto_35619 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35620 ?auto_35621 ) ( IS-CRATE ?auto_35616 ) ( not ( = ?auto_35615 ?auto_35616 ) ) ( not ( = ?auto_35614 ?auto_35615 ) ) ( not ( = ?auto_35614 ?auto_35616 ) ) ( not ( = ?auto_35624 ?auto_35621 ) ) ( HOIST-AT ?auto_35622 ?auto_35624 ) ( not ( = ?auto_35620 ?auto_35622 ) ) ( SURFACE-AT ?auto_35616 ?auto_35624 ) ( ON ?auto_35616 ?auto_35623 ) ( CLEAR ?auto_35616 ) ( not ( = ?auto_35615 ?auto_35623 ) ) ( not ( = ?auto_35616 ?auto_35623 ) ) ( not ( = ?auto_35614 ?auto_35623 ) ) ( IS-CRATE ?auto_35615 ) ( AVAILABLE ?auto_35622 ) ( SURFACE-AT ?auto_35615 ?auto_35624 ) ( ON ?auto_35615 ?auto_35618 ) ( CLEAR ?auto_35615 ) ( not ( = ?auto_35615 ?auto_35618 ) ) ( not ( = ?auto_35616 ?auto_35618 ) ) ( not ( = ?auto_35614 ?auto_35618 ) ) ( not ( = ?auto_35623 ?auto_35618 ) ) ( SURFACE-AT ?auto_35613 ?auto_35621 ) ( CLEAR ?auto_35613 ) ( IS-CRATE ?auto_35614 ) ( not ( = ?auto_35613 ?auto_35614 ) ) ( not ( = ?auto_35615 ?auto_35613 ) ) ( not ( = ?auto_35616 ?auto_35613 ) ) ( not ( = ?auto_35623 ?auto_35613 ) ) ( not ( = ?auto_35618 ?auto_35613 ) ) ( AVAILABLE ?auto_35620 ) ( IN ?auto_35614 ?auto_35617 ) ( TRUCK-AT ?auto_35617 ?auto_35619 ) ( not ( = ?auto_35619 ?auto_35621 ) ) ( not ( = ?auto_35624 ?auto_35619 ) ) ( ON ?auto_35612 ?auto_35611 ) ( ON ?auto_35613 ?auto_35612 ) ( not ( = ?auto_35611 ?auto_35612 ) ) ( not ( = ?auto_35611 ?auto_35613 ) ) ( not ( = ?auto_35611 ?auto_35614 ) ) ( not ( = ?auto_35611 ?auto_35615 ) ) ( not ( = ?auto_35611 ?auto_35616 ) ) ( not ( = ?auto_35611 ?auto_35623 ) ) ( not ( = ?auto_35611 ?auto_35618 ) ) ( not ( = ?auto_35612 ?auto_35613 ) ) ( not ( = ?auto_35612 ?auto_35614 ) ) ( not ( = ?auto_35612 ?auto_35615 ) ) ( not ( = ?auto_35612 ?auto_35616 ) ) ( not ( = ?auto_35612 ?auto_35623 ) ) ( not ( = ?auto_35612 ?auto_35618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35614 ?auto_35615 ?auto_35616 )
      ( MAKE-5CRATE-VERIFY ?auto_35611 ?auto_35612 ?auto_35613 ?auto_35614 ?auto_35615 ?auto_35616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35625 - SURFACE
      ?auto_35626 - SURFACE
    )
    :vars
    (
      ?auto_35630 - HOIST
      ?auto_35632 - PLACE
      ?auto_35631 - SURFACE
      ?auto_35636 - PLACE
      ?auto_35634 - HOIST
      ?auto_35635 - SURFACE
      ?auto_35628 - SURFACE
      ?auto_35633 - SURFACE
      ?auto_35627 - TRUCK
      ?auto_35629 - PLACE
      ?auto_35637 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35630 ?auto_35632 ) ( IS-CRATE ?auto_35626 ) ( not ( = ?auto_35625 ?auto_35626 ) ) ( not ( = ?auto_35631 ?auto_35625 ) ) ( not ( = ?auto_35631 ?auto_35626 ) ) ( not ( = ?auto_35636 ?auto_35632 ) ) ( HOIST-AT ?auto_35634 ?auto_35636 ) ( not ( = ?auto_35630 ?auto_35634 ) ) ( SURFACE-AT ?auto_35626 ?auto_35636 ) ( ON ?auto_35626 ?auto_35635 ) ( CLEAR ?auto_35626 ) ( not ( = ?auto_35625 ?auto_35635 ) ) ( not ( = ?auto_35626 ?auto_35635 ) ) ( not ( = ?auto_35631 ?auto_35635 ) ) ( IS-CRATE ?auto_35625 ) ( AVAILABLE ?auto_35634 ) ( SURFACE-AT ?auto_35625 ?auto_35636 ) ( ON ?auto_35625 ?auto_35628 ) ( CLEAR ?auto_35625 ) ( not ( = ?auto_35625 ?auto_35628 ) ) ( not ( = ?auto_35626 ?auto_35628 ) ) ( not ( = ?auto_35631 ?auto_35628 ) ) ( not ( = ?auto_35635 ?auto_35628 ) ) ( SURFACE-AT ?auto_35633 ?auto_35632 ) ( CLEAR ?auto_35633 ) ( IS-CRATE ?auto_35631 ) ( not ( = ?auto_35633 ?auto_35631 ) ) ( not ( = ?auto_35625 ?auto_35633 ) ) ( not ( = ?auto_35626 ?auto_35633 ) ) ( not ( = ?auto_35635 ?auto_35633 ) ) ( not ( = ?auto_35628 ?auto_35633 ) ) ( AVAILABLE ?auto_35630 ) ( TRUCK-AT ?auto_35627 ?auto_35629 ) ( not ( = ?auto_35629 ?auto_35632 ) ) ( not ( = ?auto_35636 ?auto_35629 ) ) ( HOIST-AT ?auto_35637 ?auto_35629 ) ( LIFTING ?auto_35637 ?auto_35631 ) ( not ( = ?auto_35630 ?auto_35637 ) ) ( not ( = ?auto_35634 ?auto_35637 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35637 ?auto_35631 ?auto_35627 ?auto_35629 )
      ( MAKE-2CRATE ?auto_35631 ?auto_35625 ?auto_35626 )
      ( MAKE-1CRATE-VERIFY ?auto_35625 ?auto_35626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35638 - SURFACE
      ?auto_35639 - SURFACE
      ?auto_35640 - SURFACE
    )
    :vars
    (
      ?auto_35643 - HOIST
      ?auto_35645 - PLACE
      ?auto_35646 - PLACE
      ?auto_35647 - HOIST
      ?auto_35648 - SURFACE
      ?auto_35649 - SURFACE
      ?auto_35642 - SURFACE
      ?auto_35650 - TRUCK
      ?auto_35641 - PLACE
      ?auto_35644 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35643 ?auto_35645 ) ( IS-CRATE ?auto_35640 ) ( not ( = ?auto_35639 ?auto_35640 ) ) ( not ( = ?auto_35638 ?auto_35639 ) ) ( not ( = ?auto_35638 ?auto_35640 ) ) ( not ( = ?auto_35646 ?auto_35645 ) ) ( HOIST-AT ?auto_35647 ?auto_35646 ) ( not ( = ?auto_35643 ?auto_35647 ) ) ( SURFACE-AT ?auto_35640 ?auto_35646 ) ( ON ?auto_35640 ?auto_35648 ) ( CLEAR ?auto_35640 ) ( not ( = ?auto_35639 ?auto_35648 ) ) ( not ( = ?auto_35640 ?auto_35648 ) ) ( not ( = ?auto_35638 ?auto_35648 ) ) ( IS-CRATE ?auto_35639 ) ( AVAILABLE ?auto_35647 ) ( SURFACE-AT ?auto_35639 ?auto_35646 ) ( ON ?auto_35639 ?auto_35649 ) ( CLEAR ?auto_35639 ) ( not ( = ?auto_35639 ?auto_35649 ) ) ( not ( = ?auto_35640 ?auto_35649 ) ) ( not ( = ?auto_35638 ?auto_35649 ) ) ( not ( = ?auto_35648 ?auto_35649 ) ) ( SURFACE-AT ?auto_35642 ?auto_35645 ) ( CLEAR ?auto_35642 ) ( IS-CRATE ?auto_35638 ) ( not ( = ?auto_35642 ?auto_35638 ) ) ( not ( = ?auto_35639 ?auto_35642 ) ) ( not ( = ?auto_35640 ?auto_35642 ) ) ( not ( = ?auto_35648 ?auto_35642 ) ) ( not ( = ?auto_35649 ?auto_35642 ) ) ( AVAILABLE ?auto_35643 ) ( TRUCK-AT ?auto_35650 ?auto_35641 ) ( not ( = ?auto_35641 ?auto_35645 ) ) ( not ( = ?auto_35646 ?auto_35641 ) ) ( HOIST-AT ?auto_35644 ?auto_35641 ) ( LIFTING ?auto_35644 ?auto_35638 ) ( not ( = ?auto_35643 ?auto_35644 ) ) ( not ( = ?auto_35647 ?auto_35644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35639 ?auto_35640 )
      ( MAKE-2CRATE-VERIFY ?auto_35638 ?auto_35639 ?auto_35640 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35651 - SURFACE
      ?auto_35652 - SURFACE
      ?auto_35653 - SURFACE
      ?auto_35654 - SURFACE
    )
    :vars
    (
      ?auto_35656 - HOIST
      ?auto_35659 - PLACE
      ?auto_35662 - PLACE
      ?auto_35663 - HOIST
      ?auto_35655 - SURFACE
      ?auto_35658 - SURFACE
      ?auto_35661 - TRUCK
      ?auto_35657 - PLACE
      ?auto_35660 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35656 ?auto_35659 ) ( IS-CRATE ?auto_35654 ) ( not ( = ?auto_35653 ?auto_35654 ) ) ( not ( = ?auto_35652 ?auto_35653 ) ) ( not ( = ?auto_35652 ?auto_35654 ) ) ( not ( = ?auto_35662 ?auto_35659 ) ) ( HOIST-AT ?auto_35663 ?auto_35662 ) ( not ( = ?auto_35656 ?auto_35663 ) ) ( SURFACE-AT ?auto_35654 ?auto_35662 ) ( ON ?auto_35654 ?auto_35655 ) ( CLEAR ?auto_35654 ) ( not ( = ?auto_35653 ?auto_35655 ) ) ( not ( = ?auto_35654 ?auto_35655 ) ) ( not ( = ?auto_35652 ?auto_35655 ) ) ( IS-CRATE ?auto_35653 ) ( AVAILABLE ?auto_35663 ) ( SURFACE-AT ?auto_35653 ?auto_35662 ) ( ON ?auto_35653 ?auto_35658 ) ( CLEAR ?auto_35653 ) ( not ( = ?auto_35653 ?auto_35658 ) ) ( not ( = ?auto_35654 ?auto_35658 ) ) ( not ( = ?auto_35652 ?auto_35658 ) ) ( not ( = ?auto_35655 ?auto_35658 ) ) ( SURFACE-AT ?auto_35651 ?auto_35659 ) ( CLEAR ?auto_35651 ) ( IS-CRATE ?auto_35652 ) ( not ( = ?auto_35651 ?auto_35652 ) ) ( not ( = ?auto_35653 ?auto_35651 ) ) ( not ( = ?auto_35654 ?auto_35651 ) ) ( not ( = ?auto_35655 ?auto_35651 ) ) ( not ( = ?auto_35658 ?auto_35651 ) ) ( AVAILABLE ?auto_35656 ) ( TRUCK-AT ?auto_35661 ?auto_35657 ) ( not ( = ?auto_35657 ?auto_35659 ) ) ( not ( = ?auto_35662 ?auto_35657 ) ) ( HOIST-AT ?auto_35660 ?auto_35657 ) ( LIFTING ?auto_35660 ?auto_35652 ) ( not ( = ?auto_35656 ?auto_35660 ) ) ( not ( = ?auto_35663 ?auto_35660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35652 ?auto_35653 ?auto_35654 )
      ( MAKE-3CRATE-VERIFY ?auto_35651 ?auto_35652 ?auto_35653 ?auto_35654 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35664 - SURFACE
      ?auto_35665 - SURFACE
      ?auto_35666 - SURFACE
      ?auto_35667 - SURFACE
      ?auto_35668 - SURFACE
    )
    :vars
    (
      ?auto_35670 - HOIST
      ?auto_35673 - PLACE
      ?auto_35676 - PLACE
      ?auto_35677 - HOIST
      ?auto_35669 - SURFACE
      ?auto_35672 - SURFACE
      ?auto_35675 - TRUCK
      ?auto_35671 - PLACE
      ?auto_35674 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35670 ?auto_35673 ) ( IS-CRATE ?auto_35668 ) ( not ( = ?auto_35667 ?auto_35668 ) ) ( not ( = ?auto_35666 ?auto_35667 ) ) ( not ( = ?auto_35666 ?auto_35668 ) ) ( not ( = ?auto_35676 ?auto_35673 ) ) ( HOIST-AT ?auto_35677 ?auto_35676 ) ( not ( = ?auto_35670 ?auto_35677 ) ) ( SURFACE-AT ?auto_35668 ?auto_35676 ) ( ON ?auto_35668 ?auto_35669 ) ( CLEAR ?auto_35668 ) ( not ( = ?auto_35667 ?auto_35669 ) ) ( not ( = ?auto_35668 ?auto_35669 ) ) ( not ( = ?auto_35666 ?auto_35669 ) ) ( IS-CRATE ?auto_35667 ) ( AVAILABLE ?auto_35677 ) ( SURFACE-AT ?auto_35667 ?auto_35676 ) ( ON ?auto_35667 ?auto_35672 ) ( CLEAR ?auto_35667 ) ( not ( = ?auto_35667 ?auto_35672 ) ) ( not ( = ?auto_35668 ?auto_35672 ) ) ( not ( = ?auto_35666 ?auto_35672 ) ) ( not ( = ?auto_35669 ?auto_35672 ) ) ( SURFACE-AT ?auto_35665 ?auto_35673 ) ( CLEAR ?auto_35665 ) ( IS-CRATE ?auto_35666 ) ( not ( = ?auto_35665 ?auto_35666 ) ) ( not ( = ?auto_35667 ?auto_35665 ) ) ( not ( = ?auto_35668 ?auto_35665 ) ) ( not ( = ?auto_35669 ?auto_35665 ) ) ( not ( = ?auto_35672 ?auto_35665 ) ) ( AVAILABLE ?auto_35670 ) ( TRUCK-AT ?auto_35675 ?auto_35671 ) ( not ( = ?auto_35671 ?auto_35673 ) ) ( not ( = ?auto_35676 ?auto_35671 ) ) ( HOIST-AT ?auto_35674 ?auto_35671 ) ( LIFTING ?auto_35674 ?auto_35666 ) ( not ( = ?auto_35670 ?auto_35674 ) ) ( not ( = ?auto_35677 ?auto_35674 ) ) ( ON ?auto_35665 ?auto_35664 ) ( not ( = ?auto_35664 ?auto_35665 ) ) ( not ( = ?auto_35664 ?auto_35666 ) ) ( not ( = ?auto_35664 ?auto_35667 ) ) ( not ( = ?auto_35664 ?auto_35668 ) ) ( not ( = ?auto_35664 ?auto_35669 ) ) ( not ( = ?auto_35664 ?auto_35672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35666 ?auto_35667 ?auto_35668 )
      ( MAKE-4CRATE-VERIFY ?auto_35664 ?auto_35665 ?auto_35666 ?auto_35667 ?auto_35668 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35678 - SURFACE
      ?auto_35679 - SURFACE
      ?auto_35680 - SURFACE
      ?auto_35681 - SURFACE
      ?auto_35682 - SURFACE
      ?auto_35683 - SURFACE
    )
    :vars
    (
      ?auto_35685 - HOIST
      ?auto_35688 - PLACE
      ?auto_35691 - PLACE
      ?auto_35692 - HOIST
      ?auto_35684 - SURFACE
      ?auto_35687 - SURFACE
      ?auto_35690 - TRUCK
      ?auto_35686 - PLACE
      ?auto_35689 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35685 ?auto_35688 ) ( IS-CRATE ?auto_35683 ) ( not ( = ?auto_35682 ?auto_35683 ) ) ( not ( = ?auto_35681 ?auto_35682 ) ) ( not ( = ?auto_35681 ?auto_35683 ) ) ( not ( = ?auto_35691 ?auto_35688 ) ) ( HOIST-AT ?auto_35692 ?auto_35691 ) ( not ( = ?auto_35685 ?auto_35692 ) ) ( SURFACE-AT ?auto_35683 ?auto_35691 ) ( ON ?auto_35683 ?auto_35684 ) ( CLEAR ?auto_35683 ) ( not ( = ?auto_35682 ?auto_35684 ) ) ( not ( = ?auto_35683 ?auto_35684 ) ) ( not ( = ?auto_35681 ?auto_35684 ) ) ( IS-CRATE ?auto_35682 ) ( AVAILABLE ?auto_35692 ) ( SURFACE-AT ?auto_35682 ?auto_35691 ) ( ON ?auto_35682 ?auto_35687 ) ( CLEAR ?auto_35682 ) ( not ( = ?auto_35682 ?auto_35687 ) ) ( not ( = ?auto_35683 ?auto_35687 ) ) ( not ( = ?auto_35681 ?auto_35687 ) ) ( not ( = ?auto_35684 ?auto_35687 ) ) ( SURFACE-AT ?auto_35680 ?auto_35688 ) ( CLEAR ?auto_35680 ) ( IS-CRATE ?auto_35681 ) ( not ( = ?auto_35680 ?auto_35681 ) ) ( not ( = ?auto_35682 ?auto_35680 ) ) ( not ( = ?auto_35683 ?auto_35680 ) ) ( not ( = ?auto_35684 ?auto_35680 ) ) ( not ( = ?auto_35687 ?auto_35680 ) ) ( AVAILABLE ?auto_35685 ) ( TRUCK-AT ?auto_35690 ?auto_35686 ) ( not ( = ?auto_35686 ?auto_35688 ) ) ( not ( = ?auto_35691 ?auto_35686 ) ) ( HOIST-AT ?auto_35689 ?auto_35686 ) ( LIFTING ?auto_35689 ?auto_35681 ) ( not ( = ?auto_35685 ?auto_35689 ) ) ( not ( = ?auto_35692 ?auto_35689 ) ) ( ON ?auto_35679 ?auto_35678 ) ( ON ?auto_35680 ?auto_35679 ) ( not ( = ?auto_35678 ?auto_35679 ) ) ( not ( = ?auto_35678 ?auto_35680 ) ) ( not ( = ?auto_35678 ?auto_35681 ) ) ( not ( = ?auto_35678 ?auto_35682 ) ) ( not ( = ?auto_35678 ?auto_35683 ) ) ( not ( = ?auto_35678 ?auto_35684 ) ) ( not ( = ?auto_35678 ?auto_35687 ) ) ( not ( = ?auto_35679 ?auto_35680 ) ) ( not ( = ?auto_35679 ?auto_35681 ) ) ( not ( = ?auto_35679 ?auto_35682 ) ) ( not ( = ?auto_35679 ?auto_35683 ) ) ( not ( = ?auto_35679 ?auto_35684 ) ) ( not ( = ?auto_35679 ?auto_35687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35681 ?auto_35682 ?auto_35683 )
      ( MAKE-5CRATE-VERIFY ?auto_35678 ?auto_35679 ?auto_35680 ?auto_35681 ?auto_35682 ?auto_35683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35693 - SURFACE
      ?auto_35694 - SURFACE
    )
    :vars
    (
      ?auto_35697 - HOIST
      ?auto_35700 - PLACE
      ?auto_35702 - SURFACE
      ?auto_35704 - PLACE
      ?auto_35705 - HOIST
      ?auto_35696 - SURFACE
      ?auto_35699 - SURFACE
      ?auto_35695 - SURFACE
      ?auto_35703 - TRUCK
      ?auto_35698 - PLACE
      ?auto_35701 - HOIST
      ?auto_35706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35697 ?auto_35700 ) ( IS-CRATE ?auto_35694 ) ( not ( = ?auto_35693 ?auto_35694 ) ) ( not ( = ?auto_35702 ?auto_35693 ) ) ( not ( = ?auto_35702 ?auto_35694 ) ) ( not ( = ?auto_35704 ?auto_35700 ) ) ( HOIST-AT ?auto_35705 ?auto_35704 ) ( not ( = ?auto_35697 ?auto_35705 ) ) ( SURFACE-AT ?auto_35694 ?auto_35704 ) ( ON ?auto_35694 ?auto_35696 ) ( CLEAR ?auto_35694 ) ( not ( = ?auto_35693 ?auto_35696 ) ) ( not ( = ?auto_35694 ?auto_35696 ) ) ( not ( = ?auto_35702 ?auto_35696 ) ) ( IS-CRATE ?auto_35693 ) ( AVAILABLE ?auto_35705 ) ( SURFACE-AT ?auto_35693 ?auto_35704 ) ( ON ?auto_35693 ?auto_35699 ) ( CLEAR ?auto_35693 ) ( not ( = ?auto_35693 ?auto_35699 ) ) ( not ( = ?auto_35694 ?auto_35699 ) ) ( not ( = ?auto_35702 ?auto_35699 ) ) ( not ( = ?auto_35696 ?auto_35699 ) ) ( SURFACE-AT ?auto_35695 ?auto_35700 ) ( CLEAR ?auto_35695 ) ( IS-CRATE ?auto_35702 ) ( not ( = ?auto_35695 ?auto_35702 ) ) ( not ( = ?auto_35693 ?auto_35695 ) ) ( not ( = ?auto_35694 ?auto_35695 ) ) ( not ( = ?auto_35696 ?auto_35695 ) ) ( not ( = ?auto_35699 ?auto_35695 ) ) ( AVAILABLE ?auto_35697 ) ( TRUCK-AT ?auto_35703 ?auto_35698 ) ( not ( = ?auto_35698 ?auto_35700 ) ) ( not ( = ?auto_35704 ?auto_35698 ) ) ( HOIST-AT ?auto_35701 ?auto_35698 ) ( not ( = ?auto_35697 ?auto_35701 ) ) ( not ( = ?auto_35705 ?auto_35701 ) ) ( AVAILABLE ?auto_35701 ) ( SURFACE-AT ?auto_35702 ?auto_35698 ) ( ON ?auto_35702 ?auto_35706 ) ( CLEAR ?auto_35702 ) ( not ( = ?auto_35693 ?auto_35706 ) ) ( not ( = ?auto_35694 ?auto_35706 ) ) ( not ( = ?auto_35702 ?auto_35706 ) ) ( not ( = ?auto_35696 ?auto_35706 ) ) ( not ( = ?auto_35699 ?auto_35706 ) ) ( not ( = ?auto_35695 ?auto_35706 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35701 ?auto_35702 ?auto_35706 ?auto_35698 )
      ( MAKE-2CRATE ?auto_35702 ?auto_35693 ?auto_35694 )
      ( MAKE-1CRATE-VERIFY ?auto_35693 ?auto_35694 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35707 - SURFACE
      ?auto_35708 - SURFACE
      ?auto_35709 - SURFACE
    )
    :vars
    (
      ?auto_35710 - HOIST
      ?auto_35720 - PLACE
      ?auto_35716 - PLACE
      ?auto_35719 - HOIST
      ?auto_35715 - SURFACE
      ?auto_35717 - SURFACE
      ?auto_35714 - SURFACE
      ?auto_35718 - TRUCK
      ?auto_35712 - PLACE
      ?auto_35713 - HOIST
      ?auto_35711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35710 ?auto_35720 ) ( IS-CRATE ?auto_35709 ) ( not ( = ?auto_35708 ?auto_35709 ) ) ( not ( = ?auto_35707 ?auto_35708 ) ) ( not ( = ?auto_35707 ?auto_35709 ) ) ( not ( = ?auto_35716 ?auto_35720 ) ) ( HOIST-AT ?auto_35719 ?auto_35716 ) ( not ( = ?auto_35710 ?auto_35719 ) ) ( SURFACE-AT ?auto_35709 ?auto_35716 ) ( ON ?auto_35709 ?auto_35715 ) ( CLEAR ?auto_35709 ) ( not ( = ?auto_35708 ?auto_35715 ) ) ( not ( = ?auto_35709 ?auto_35715 ) ) ( not ( = ?auto_35707 ?auto_35715 ) ) ( IS-CRATE ?auto_35708 ) ( AVAILABLE ?auto_35719 ) ( SURFACE-AT ?auto_35708 ?auto_35716 ) ( ON ?auto_35708 ?auto_35717 ) ( CLEAR ?auto_35708 ) ( not ( = ?auto_35708 ?auto_35717 ) ) ( not ( = ?auto_35709 ?auto_35717 ) ) ( not ( = ?auto_35707 ?auto_35717 ) ) ( not ( = ?auto_35715 ?auto_35717 ) ) ( SURFACE-AT ?auto_35714 ?auto_35720 ) ( CLEAR ?auto_35714 ) ( IS-CRATE ?auto_35707 ) ( not ( = ?auto_35714 ?auto_35707 ) ) ( not ( = ?auto_35708 ?auto_35714 ) ) ( not ( = ?auto_35709 ?auto_35714 ) ) ( not ( = ?auto_35715 ?auto_35714 ) ) ( not ( = ?auto_35717 ?auto_35714 ) ) ( AVAILABLE ?auto_35710 ) ( TRUCK-AT ?auto_35718 ?auto_35712 ) ( not ( = ?auto_35712 ?auto_35720 ) ) ( not ( = ?auto_35716 ?auto_35712 ) ) ( HOIST-AT ?auto_35713 ?auto_35712 ) ( not ( = ?auto_35710 ?auto_35713 ) ) ( not ( = ?auto_35719 ?auto_35713 ) ) ( AVAILABLE ?auto_35713 ) ( SURFACE-AT ?auto_35707 ?auto_35712 ) ( ON ?auto_35707 ?auto_35711 ) ( CLEAR ?auto_35707 ) ( not ( = ?auto_35708 ?auto_35711 ) ) ( not ( = ?auto_35709 ?auto_35711 ) ) ( not ( = ?auto_35707 ?auto_35711 ) ) ( not ( = ?auto_35715 ?auto_35711 ) ) ( not ( = ?auto_35717 ?auto_35711 ) ) ( not ( = ?auto_35714 ?auto_35711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35708 ?auto_35709 )
      ( MAKE-2CRATE-VERIFY ?auto_35707 ?auto_35708 ?auto_35709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35721 - SURFACE
      ?auto_35722 - SURFACE
      ?auto_35723 - SURFACE
      ?auto_35724 - SURFACE
    )
    :vars
    (
      ?auto_35731 - HOIST
      ?auto_35728 - PLACE
      ?auto_35733 - PLACE
      ?auto_35732 - HOIST
      ?auto_35726 - SURFACE
      ?auto_35734 - SURFACE
      ?auto_35729 - TRUCK
      ?auto_35725 - PLACE
      ?auto_35730 - HOIST
      ?auto_35727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35731 ?auto_35728 ) ( IS-CRATE ?auto_35724 ) ( not ( = ?auto_35723 ?auto_35724 ) ) ( not ( = ?auto_35722 ?auto_35723 ) ) ( not ( = ?auto_35722 ?auto_35724 ) ) ( not ( = ?auto_35733 ?auto_35728 ) ) ( HOIST-AT ?auto_35732 ?auto_35733 ) ( not ( = ?auto_35731 ?auto_35732 ) ) ( SURFACE-AT ?auto_35724 ?auto_35733 ) ( ON ?auto_35724 ?auto_35726 ) ( CLEAR ?auto_35724 ) ( not ( = ?auto_35723 ?auto_35726 ) ) ( not ( = ?auto_35724 ?auto_35726 ) ) ( not ( = ?auto_35722 ?auto_35726 ) ) ( IS-CRATE ?auto_35723 ) ( AVAILABLE ?auto_35732 ) ( SURFACE-AT ?auto_35723 ?auto_35733 ) ( ON ?auto_35723 ?auto_35734 ) ( CLEAR ?auto_35723 ) ( not ( = ?auto_35723 ?auto_35734 ) ) ( not ( = ?auto_35724 ?auto_35734 ) ) ( not ( = ?auto_35722 ?auto_35734 ) ) ( not ( = ?auto_35726 ?auto_35734 ) ) ( SURFACE-AT ?auto_35721 ?auto_35728 ) ( CLEAR ?auto_35721 ) ( IS-CRATE ?auto_35722 ) ( not ( = ?auto_35721 ?auto_35722 ) ) ( not ( = ?auto_35723 ?auto_35721 ) ) ( not ( = ?auto_35724 ?auto_35721 ) ) ( not ( = ?auto_35726 ?auto_35721 ) ) ( not ( = ?auto_35734 ?auto_35721 ) ) ( AVAILABLE ?auto_35731 ) ( TRUCK-AT ?auto_35729 ?auto_35725 ) ( not ( = ?auto_35725 ?auto_35728 ) ) ( not ( = ?auto_35733 ?auto_35725 ) ) ( HOIST-AT ?auto_35730 ?auto_35725 ) ( not ( = ?auto_35731 ?auto_35730 ) ) ( not ( = ?auto_35732 ?auto_35730 ) ) ( AVAILABLE ?auto_35730 ) ( SURFACE-AT ?auto_35722 ?auto_35725 ) ( ON ?auto_35722 ?auto_35727 ) ( CLEAR ?auto_35722 ) ( not ( = ?auto_35723 ?auto_35727 ) ) ( not ( = ?auto_35724 ?auto_35727 ) ) ( not ( = ?auto_35722 ?auto_35727 ) ) ( not ( = ?auto_35726 ?auto_35727 ) ) ( not ( = ?auto_35734 ?auto_35727 ) ) ( not ( = ?auto_35721 ?auto_35727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35722 ?auto_35723 ?auto_35724 )
      ( MAKE-3CRATE-VERIFY ?auto_35721 ?auto_35722 ?auto_35723 ?auto_35724 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35735 - SURFACE
      ?auto_35736 - SURFACE
      ?auto_35737 - SURFACE
      ?auto_35738 - SURFACE
      ?auto_35739 - SURFACE
    )
    :vars
    (
      ?auto_35746 - HOIST
      ?auto_35743 - PLACE
      ?auto_35748 - PLACE
      ?auto_35747 - HOIST
      ?auto_35741 - SURFACE
      ?auto_35749 - SURFACE
      ?auto_35744 - TRUCK
      ?auto_35740 - PLACE
      ?auto_35745 - HOIST
      ?auto_35742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35746 ?auto_35743 ) ( IS-CRATE ?auto_35739 ) ( not ( = ?auto_35738 ?auto_35739 ) ) ( not ( = ?auto_35737 ?auto_35738 ) ) ( not ( = ?auto_35737 ?auto_35739 ) ) ( not ( = ?auto_35748 ?auto_35743 ) ) ( HOIST-AT ?auto_35747 ?auto_35748 ) ( not ( = ?auto_35746 ?auto_35747 ) ) ( SURFACE-AT ?auto_35739 ?auto_35748 ) ( ON ?auto_35739 ?auto_35741 ) ( CLEAR ?auto_35739 ) ( not ( = ?auto_35738 ?auto_35741 ) ) ( not ( = ?auto_35739 ?auto_35741 ) ) ( not ( = ?auto_35737 ?auto_35741 ) ) ( IS-CRATE ?auto_35738 ) ( AVAILABLE ?auto_35747 ) ( SURFACE-AT ?auto_35738 ?auto_35748 ) ( ON ?auto_35738 ?auto_35749 ) ( CLEAR ?auto_35738 ) ( not ( = ?auto_35738 ?auto_35749 ) ) ( not ( = ?auto_35739 ?auto_35749 ) ) ( not ( = ?auto_35737 ?auto_35749 ) ) ( not ( = ?auto_35741 ?auto_35749 ) ) ( SURFACE-AT ?auto_35736 ?auto_35743 ) ( CLEAR ?auto_35736 ) ( IS-CRATE ?auto_35737 ) ( not ( = ?auto_35736 ?auto_35737 ) ) ( not ( = ?auto_35738 ?auto_35736 ) ) ( not ( = ?auto_35739 ?auto_35736 ) ) ( not ( = ?auto_35741 ?auto_35736 ) ) ( not ( = ?auto_35749 ?auto_35736 ) ) ( AVAILABLE ?auto_35746 ) ( TRUCK-AT ?auto_35744 ?auto_35740 ) ( not ( = ?auto_35740 ?auto_35743 ) ) ( not ( = ?auto_35748 ?auto_35740 ) ) ( HOIST-AT ?auto_35745 ?auto_35740 ) ( not ( = ?auto_35746 ?auto_35745 ) ) ( not ( = ?auto_35747 ?auto_35745 ) ) ( AVAILABLE ?auto_35745 ) ( SURFACE-AT ?auto_35737 ?auto_35740 ) ( ON ?auto_35737 ?auto_35742 ) ( CLEAR ?auto_35737 ) ( not ( = ?auto_35738 ?auto_35742 ) ) ( not ( = ?auto_35739 ?auto_35742 ) ) ( not ( = ?auto_35737 ?auto_35742 ) ) ( not ( = ?auto_35741 ?auto_35742 ) ) ( not ( = ?auto_35749 ?auto_35742 ) ) ( not ( = ?auto_35736 ?auto_35742 ) ) ( ON ?auto_35736 ?auto_35735 ) ( not ( = ?auto_35735 ?auto_35736 ) ) ( not ( = ?auto_35735 ?auto_35737 ) ) ( not ( = ?auto_35735 ?auto_35738 ) ) ( not ( = ?auto_35735 ?auto_35739 ) ) ( not ( = ?auto_35735 ?auto_35741 ) ) ( not ( = ?auto_35735 ?auto_35749 ) ) ( not ( = ?auto_35735 ?auto_35742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35737 ?auto_35738 ?auto_35739 )
      ( MAKE-4CRATE-VERIFY ?auto_35735 ?auto_35736 ?auto_35737 ?auto_35738 ?auto_35739 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35750 - SURFACE
      ?auto_35751 - SURFACE
      ?auto_35752 - SURFACE
      ?auto_35753 - SURFACE
      ?auto_35754 - SURFACE
      ?auto_35755 - SURFACE
    )
    :vars
    (
      ?auto_35762 - HOIST
      ?auto_35759 - PLACE
      ?auto_35764 - PLACE
      ?auto_35763 - HOIST
      ?auto_35757 - SURFACE
      ?auto_35765 - SURFACE
      ?auto_35760 - TRUCK
      ?auto_35756 - PLACE
      ?auto_35761 - HOIST
      ?auto_35758 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35762 ?auto_35759 ) ( IS-CRATE ?auto_35755 ) ( not ( = ?auto_35754 ?auto_35755 ) ) ( not ( = ?auto_35753 ?auto_35754 ) ) ( not ( = ?auto_35753 ?auto_35755 ) ) ( not ( = ?auto_35764 ?auto_35759 ) ) ( HOIST-AT ?auto_35763 ?auto_35764 ) ( not ( = ?auto_35762 ?auto_35763 ) ) ( SURFACE-AT ?auto_35755 ?auto_35764 ) ( ON ?auto_35755 ?auto_35757 ) ( CLEAR ?auto_35755 ) ( not ( = ?auto_35754 ?auto_35757 ) ) ( not ( = ?auto_35755 ?auto_35757 ) ) ( not ( = ?auto_35753 ?auto_35757 ) ) ( IS-CRATE ?auto_35754 ) ( AVAILABLE ?auto_35763 ) ( SURFACE-AT ?auto_35754 ?auto_35764 ) ( ON ?auto_35754 ?auto_35765 ) ( CLEAR ?auto_35754 ) ( not ( = ?auto_35754 ?auto_35765 ) ) ( not ( = ?auto_35755 ?auto_35765 ) ) ( not ( = ?auto_35753 ?auto_35765 ) ) ( not ( = ?auto_35757 ?auto_35765 ) ) ( SURFACE-AT ?auto_35752 ?auto_35759 ) ( CLEAR ?auto_35752 ) ( IS-CRATE ?auto_35753 ) ( not ( = ?auto_35752 ?auto_35753 ) ) ( not ( = ?auto_35754 ?auto_35752 ) ) ( not ( = ?auto_35755 ?auto_35752 ) ) ( not ( = ?auto_35757 ?auto_35752 ) ) ( not ( = ?auto_35765 ?auto_35752 ) ) ( AVAILABLE ?auto_35762 ) ( TRUCK-AT ?auto_35760 ?auto_35756 ) ( not ( = ?auto_35756 ?auto_35759 ) ) ( not ( = ?auto_35764 ?auto_35756 ) ) ( HOIST-AT ?auto_35761 ?auto_35756 ) ( not ( = ?auto_35762 ?auto_35761 ) ) ( not ( = ?auto_35763 ?auto_35761 ) ) ( AVAILABLE ?auto_35761 ) ( SURFACE-AT ?auto_35753 ?auto_35756 ) ( ON ?auto_35753 ?auto_35758 ) ( CLEAR ?auto_35753 ) ( not ( = ?auto_35754 ?auto_35758 ) ) ( not ( = ?auto_35755 ?auto_35758 ) ) ( not ( = ?auto_35753 ?auto_35758 ) ) ( not ( = ?auto_35757 ?auto_35758 ) ) ( not ( = ?auto_35765 ?auto_35758 ) ) ( not ( = ?auto_35752 ?auto_35758 ) ) ( ON ?auto_35751 ?auto_35750 ) ( ON ?auto_35752 ?auto_35751 ) ( not ( = ?auto_35750 ?auto_35751 ) ) ( not ( = ?auto_35750 ?auto_35752 ) ) ( not ( = ?auto_35750 ?auto_35753 ) ) ( not ( = ?auto_35750 ?auto_35754 ) ) ( not ( = ?auto_35750 ?auto_35755 ) ) ( not ( = ?auto_35750 ?auto_35757 ) ) ( not ( = ?auto_35750 ?auto_35765 ) ) ( not ( = ?auto_35750 ?auto_35758 ) ) ( not ( = ?auto_35751 ?auto_35752 ) ) ( not ( = ?auto_35751 ?auto_35753 ) ) ( not ( = ?auto_35751 ?auto_35754 ) ) ( not ( = ?auto_35751 ?auto_35755 ) ) ( not ( = ?auto_35751 ?auto_35757 ) ) ( not ( = ?auto_35751 ?auto_35765 ) ) ( not ( = ?auto_35751 ?auto_35758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35753 ?auto_35754 ?auto_35755 )
      ( MAKE-5CRATE-VERIFY ?auto_35750 ?auto_35751 ?auto_35752 ?auto_35753 ?auto_35754 ?auto_35755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35766 - SURFACE
      ?auto_35767 - SURFACE
    )
    :vars
    (
      ?auto_35776 - HOIST
      ?auto_35773 - PLACE
      ?auto_35771 - SURFACE
      ?auto_35778 - PLACE
      ?auto_35777 - HOIST
      ?auto_35769 - SURFACE
      ?auto_35779 - SURFACE
      ?auto_35770 - SURFACE
      ?auto_35768 - PLACE
      ?auto_35775 - HOIST
      ?auto_35772 - SURFACE
      ?auto_35774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35776 ?auto_35773 ) ( IS-CRATE ?auto_35767 ) ( not ( = ?auto_35766 ?auto_35767 ) ) ( not ( = ?auto_35771 ?auto_35766 ) ) ( not ( = ?auto_35771 ?auto_35767 ) ) ( not ( = ?auto_35778 ?auto_35773 ) ) ( HOIST-AT ?auto_35777 ?auto_35778 ) ( not ( = ?auto_35776 ?auto_35777 ) ) ( SURFACE-AT ?auto_35767 ?auto_35778 ) ( ON ?auto_35767 ?auto_35769 ) ( CLEAR ?auto_35767 ) ( not ( = ?auto_35766 ?auto_35769 ) ) ( not ( = ?auto_35767 ?auto_35769 ) ) ( not ( = ?auto_35771 ?auto_35769 ) ) ( IS-CRATE ?auto_35766 ) ( AVAILABLE ?auto_35777 ) ( SURFACE-AT ?auto_35766 ?auto_35778 ) ( ON ?auto_35766 ?auto_35779 ) ( CLEAR ?auto_35766 ) ( not ( = ?auto_35766 ?auto_35779 ) ) ( not ( = ?auto_35767 ?auto_35779 ) ) ( not ( = ?auto_35771 ?auto_35779 ) ) ( not ( = ?auto_35769 ?auto_35779 ) ) ( SURFACE-AT ?auto_35770 ?auto_35773 ) ( CLEAR ?auto_35770 ) ( IS-CRATE ?auto_35771 ) ( not ( = ?auto_35770 ?auto_35771 ) ) ( not ( = ?auto_35766 ?auto_35770 ) ) ( not ( = ?auto_35767 ?auto_35770 ) ) ( not ( = ?auto_35769 ?auto_35770 ) ) ( not ( = ?auto_35779 ?auto_35770 ) ) ( AVAILABLE ?auto_35776 ) ( not ( = ?auto_35768 ?auto_35773 ) ) ( not ( = ?auto_35778 ?auto_35768 ) ) ( HOIST-AT ?auto_35775 ?auto_35768 ) ( not ( = ?auto_35776 ?auto_35775 ) ) ( not ( = ?auto_35777 ?auto_35775 ) ) ( AVAILABLE ?auto_35775 ) ( SURFACE-AT ?auto_35771 ?auto_35768 ) ( ON ?auto_35771 ?auto_35772 ) ( CLEAR ?auto_35771 ) ( not ( = ?auto_35766 ?auto_35772 ) ) ( not ( = ?auto_35767 ?auto_35772 ) ) ( not ( = ?auto_35771 ?auto_35772 ) ) ( not ( = ?auto_35769 ?auto_35772 ) ) ( not ( = ?auto_35779 ?auto_35772 ) ) ( not ( = ?auto_35770 ?auto_35772 ) ) ( TRUCK-AT ?auto_35774 ?auto_35773 ) )
    :subtasks
    ( ( !DRIVE ?auto_35774 ?auto_35773 ?auto_35768 )
      ( MAKE-2CRATE ?auto_35771 ?auto_35766 ?auto_35767 )
      ( MAKE-1CRATE-VERIFY ?auto_35766 ?auto_35767 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35780 - SURFACE
      ?auto_35781 - SURFACE
      ?auto_35782 - SURFACE
    )
    :vars
    (
      ?auto_35791 - HOIST
      ?auto_35784 - PLACE
      ?auto_35783 - PLACE
      ?auto_35790 - HOIST
      ?auto_35788 - SURFACE
      ?auto_35789 - SURFACE
      ?auto_35793 - SURFACE
      ?auto_35785 - PLACE
      ?auto_35787 - HOIST
      ?auto_35792 - SURFACE
      ?auto_35786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35791 ?auto_35784 ) ( IS-CRATE ?auto_35782 ) ( not ( = ?auto_35781 ?auto_35782 ) ) ( not ( = ?auto_35780 ?auto_35781 ) ) ( not ( = ?auto_35780 ?auto_35782 ) ) ( not ( = ?auto_35783 ?auto_35784 ) ) ( HOIST-AT ?auto_35790 ?auto_35783 ) ( not ( = ?auto_35791 ?auto_35790 ) ) ( SURFACE-AT ?auto_35782 ?auto_35783 ) ( ON ?auto_35782 ?auto_35788 ) ( CLEAR ?auto_35782 ) ( not ( = ?auto_35781 ?auto_35788 ) ) ( not ( = ?auto_35782 ?auto_35788 ) ) ( not ( = ?auto_35780 ?auto_35788 ) ) ( IS-CRATE ?auto_35781 ) ( AVAILABLE ?auto_35790 ) ( SURFACE-AT ?auto_35781 ?auto_35783 ) ( ON ?auto_35781 ?auto_35789 ) ( CLEAR ?auto_35781 ) ( not ( = ?auto_35781 ?auto_35789 ) ) ( not ( = ?auto_35782 ?auto_35789 ) ) ( not ( = ?auto_35780 ?auto_35789 ) ) ( not ( = ?auto_35788 ?auto_35789 ) ) ( SURFACE-AT ?auto_35793 ?auto_35784 ) ( CLEAR ?auto_35793 ) ( IS-CRATE ?auto_35780 ) ( not ( = ?auto_35793 ?auto_35780 ) ) ( not ( = ?auto_35781 ?auto_35793 ) ) ( not ( = ?auto_35782 ?auto_35793 ) ) ( not ( = ?auto_35788 ?auto_35793 ) ) ( not ( = ?auto_35789 ?auto_35793 ) ) ( AVAILABLE ?auto_35791 ) ( not ( = ?auto_35785 ?auto_35784 ) ) ( not ( = ?auto_35783 ?auto_35785 ) ) ( HOIST-AT ?auto_35787 ?auto_35785 ) ( not ( = ?auto_35791 ?auto_35787 ) ) ( not ( = ?auto_35790 ?auto_35787 ) ) ( AVAILABLE ?auto_35787 ) ( SURFACE-AT ?auto_35780 ?auto_35785 ) ( ON ?auto_35780 ?auto_35792 ) ( CLEAR ?auto_35780 ) ( not ( = ?auto_35781 ?auto_35792 ) ) ( not ( = ?auto_35782 ?auto_35792 ) ) ( not ( = ?auto_35780 ?auto_35792 ) ) ( not ( = ?auto_35788 ?auto_35792 ) ) ( not ( = ?auto_35789 ?auto_35792 ) ) ( not ( = ?auto_35793 ?auto_35792 ) ) ( TRUCK-AT ?auto_35786 ?auto_35784 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35781 ?auto_35782 )
      ( MAKE-2CRATE-VERIFY ?auto_35780 ?auto_35781 ?auto_35782 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35794 - SURFACE
      ?auto_35795 - SURFACE
      ?auto_35796 - SURFACE
      ?auto_35797 - SURFACE
    )
    :vars
    (
      ?auto_35805 - HOIST
      ?auto_35804 - PLACE
      ?auto_35802 - PLACE
      ?auto_35801 - HOIST
      ?auto_35800 - SURFACE
      ?auto_35807 - SURFACE
      ?auto_35799 - PLACE
      ?auto_35806 - HOIST
      ?auto_35803 - SURFACE
      ?auto_35798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35805 ?auto_35804 ) ( IS-CRATE ?auto_35797 ) ( not ( = ?auto_35796 ?auto_35797 ) ) ( not ( = ?auto_35795 ?auto_35796 ) ) ( not ( = ?auto_35795 ?auto_35797 ) ) ( not ( = ?auto_35802 ?auto_35804 ) ) ( HOIST-AT ?auto_35801 ?auto_35802 ) ( not ( = ?auto_35805 ?auto_35801 ) ) ( SURFACE-AT ?auto_35797 ?auto_35802 ) ( ON ?auto_35797 ?auto_35800 ) ( CLEAR ?auto_35797 ) ( not ( = ?auto_35796 ?auto_35800 ) ) ( not ( = ?auto_35797 ?auto_35800 ) ) ( not ( = ?auto_35795 ?auto_35800 ) ) ( IS-CRATE ?auto_35796 ) ( AVAILABLE ?auto_35801 ) ( SURFACE-AT ?auto_35796 ?auto_35802 ) ( ON ?auto_35796 ?auto_35807 ) ( CLEAR ?auto_35796 ) ( not ( = ?auto_35796 ?auto_35807 ) ) ( not ( = ?auto_35797 ?auto_35807 ) ) ( not ( = ?auto_35795 ?auto_35807 ) ) ( not ( = ?auto_35800 ?auto_35807 ) ) ( SURFACE-AT ?auto_35794 ?auto_35804 ) ( CLEAR ?auto_35794 ) ( IS-CRATE ?auto_35795 ) ( not ( = ?auto_35794 ?auto_35795 ) ) ( not ( = ?auto_35796 ?auto_35794 ) ) ( not ( = ?auto_35797 ?auto_35794 ) ) ( not ( = ?auto_35800 ?auto_35794 ) ) ( not ( = ?auto_35807 ?auto_35794 ) ) ( AVAILABLE ?auto_35805 ) ( not ( = ?auto_35799 ?auto_35804 ) ) ( not ( = ?auto_35802 ?auto_35799 ) ) ( HOIST-AT ?auto_35806 ?auto_35799 ) ( not ( = ?auto_35805 ?auto_35806 ) ) ( not ( = ?auto_35801 ?auto_35806 ) ) ( AVAILABLE ?auto_35806 ) ( SURFACE-AT ?auto_35795 ?auto_35799 ) ( ON ?auto_35795 ?auto_35803 ) ( CLEAR ?auto_35795 ) ( not ( = ?auto_35796 ?auto_35803 ) ) ( not ( = ?auto_35797 ?auto_35803 ) ) ( not ( = ?auto_35795 ?auto_35803 ) ) ( not ( = ?auto_35800 ?auto_35803 ) ) ( not ( = ?auto_35807 ?auto_35803 ) ) ( not ( = ?auto_35794 ?auto_35803 ) ) ( TRUCK-AT ?auto_35798 ?auto_35804 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35795 ?auto_35796 ?auto_35797 )
      ( MAKE-3CRATE-VERIFY ?auto_35794 ?auto_35795 ?auto_35796 ?auto_35797 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35808 - SURFACE
      ?auto_35809 - SURFACE
      ?auto_35810 - SURFACE
      ?auto_35811 - SURFACE
      ?auto_35812 - SURFACE
    )
    :vars
    (
      ?auto_35820 - HOIST
      ?auto_35819 - PLACE
      ?auto_35817 - PLACE
      ?auto_35816 - HOIST
      ?auto_35815 - SURFACE
      ?auto_35822 - SURFACE
      ?auto_35814 - PLACE
      ?auto_35821 - HOIST
      ?auto_35818 - SURFACE
      ?auto_35813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35820 ?auto_35819 ) ( IS-CRATE ?auto_35812 ) ( not ( = ?auto_35811 ?auto_35812 ) ) ( not ( = ?auto_35810 ?auto_35811 ) ) ( not ( = ?auto_35810 ?auto_35812 ) ) ( not ( = ?auto_35817 ?auto_35819 ) ) ( HOIST-AT ?auto_35816 ?auto_35817 ) ( not ( = ?auto_35820 ?auto_35816 ) ) ( SURFACE-AT ?auto_35812 ?auto_35817 ) ( ON ?auto_35812 ?auto_35815 ) ( CLEAR ?auto_35812 ) ( not ( = ?auto_35811 ?auto_35815 ) ) ( not ( = ?auto_35812 ?auto_35815 ) ) ( not ( = ?auto_35810 ?auto_35815 ) ) ( IS-CRATE ?auto_35811 ) ( AVAILABLE ?auto_35816 ) ( SURFACE-AT ?auto_35811 ?auto_35817 ) ( ON ?auto_35811 ?auto_35822 ) ( CLEAR ?auto_35811 ) ( not ( = ?auto_35811 ?auto_35822 ) ) ( not ( = ?auto_35812 ?auto_35822 ) ) ( not ( = ?auto_35810 ?auto_35822 ) ) ( not ( = ?auto_35815 ?auto_35822 ) ) ( SURFACE-AT ?auto_35809 ?auto_35819 ) ( CLEAR ?auto_35809 ) ( IS-CRATE ?auto_35810 ) ( not ( = ?auto_35809 ?auto_35810 ) ) ( not ( = ?auto_35811 ?auto_35809 ) ) ( not ( = ?auto_35812 ?auto_35809 ) ) ( not ( = ?auto_35815 ?auto_35809 ) ) ( not ( = ?auto_35822 ?auto_35809 ) ) ( AVAILABLE ?auto_35820 ) ( not ( = ?auto_35814 ?auto_35819 ) ) ( not ( = ?auto_35817 ?auto_35814 ) ) ( HOIST-AT ?auto_35821 ?auto_35814 ) ( not ( = ?auto_35820 ?auto_35821 ) ) ( not ( = ?auto_35816 ?auto_35821 ) ) ( AVAILABLE ?auto_35821 ) ( SURFACE-AT ?auto_35810 ?auto_35814 ) ( ON ?auto_35810 ?auto_35818 ) ( CLEAR ?auto_35810 ) ( not ( = ?auto_35811 ?auto_35818 ) ) ( not ( = ?auto_35812 ?auto_35818 ) ) ( not ( = ?auto_35810 ?auto_35818 ) ) ( not ( = ?auto_35815 ?auto_35818 ) ) ( not ( = ?auto_35822 ?auto_35818 ) ) ( not ( = ?auto_35809 ?auto_35818 ) ) ( TRUCK-AT ?auto_35813 ?auto_35819 ) ( ON ?auto_35809 ?auto_35808 ) ( not ( = ?auto_35808 ?auto_35809 ) ) ( not ( = ?auto_35808 ?auto_35810 ) ) ( not ( = ?auto_35808 ?auto_35811 ) ) ( not ( = ?auto_35808 ?auto_35812 ) ) ( not ( = ?auto_35808 ?auto_35815 ) ) ( not ( = ?auto_35808 ?auto_35822 ) ) ( not ( = ?auto_35808 ?auto_35818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35810 ?auto_35811 ?auto_35812 )
      ( MAKE-4CRATE-VERIFY ?auto_35808 ?auto_35809 ?auto_35810 ?auto_35811 ?auto_35812 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35823 - SURFACE
      ?auto_35824 - SURFACE
      ?auto_35825 - SURFACE
      ?auto_35826 - SURFACE
      ?auto_35827 - SURFACE
      ?auto_35828 - SURFACE
    )
    :vars
    (
      ?auto_35836 - HOIST
      ?auto_35835 - PLACE
      ?auto_35833 - PLACE
      ?auto_35832 - HOIST
      ?auto_35831 - SURFACE
      ?auto_35838 - SURFACE
      ?auto_35830 - PLACE
      ?auto_35837 - HOIST
      ?auto_35834 - SURFACE
      ?auto_35829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35836 ?auto_35835 ) ( IS-CRATE ?auto_35828 ) ( not ( = ?auto_35827 ?auto_35828 ) ) ( not ( = ?auto_35826 ?auto_35827 ) ) ( not ( = ?auto_35826 ?auto_35828 ) ) ( not ( = ?auto_35833 ?auto_35835 ) ) ( HOIST-AT ?auto_35832 ?auto_35833 ) ( not ( = ?auto_35836 ?auto_35832 ) ) ( SURFACE-AT ?auto_35828 ?auto_35833 ) ( ON ?auto_35828 ?auto_35831 ) ( CLEAR ?auto_35828 ) ( not ( = ?auto_35827 ?auto_35831 ) ) ( not ( = ?auto_35828 ?auto_35831 ) ) ( not ( = ?auto_35826 ?auto_35831 ) ) ( IS-CRATE ?auto_35827 ) ( AVAILABLE ?auto_35832 ) ( SURFACE-AT ?auto_35827 ?auto_35833 ) ( ON ?auto_35827 ?auto_35838 ) ( CLEAR ?auto_35827 ) ( not ( = ?auto_35827 ?auto_35838 ) ) ( not ( = ?auto_35828 ?auto_35838 ) ) ( not ( = ?auto_35826 ?auto_35838 ) ) ( not ( = ?auto_35831 ?auto_35838 ) ) ( SURFACE-AT ?auto_35825 ?auto_35835 ) ( CLEAR ?auto_35825 ) ( IS-CRATE ?auto_35826 ) ( not ( = ?auto_35825 ?auto_35826 ) ) ( not ( = ?auto_35827 ?auto_35825 ) ) ( not ( = ?auto_35828 ?auto_35825 ) ) ( not ( = ?auto_35831 ?auto_35825 ) ) ( not ( = ?auto_35838 ?auto_35825 ) ) ( AVAILABLE ?auto_35836 ) ( not ( = ?auto_35830 ?auto_35835 ) ) ( not ( = ?auto_35833 ?auto_35830 ) ) ( HOIST-AT ?auto_35837 ?auto_35830 ) ( not ( = ?auto_35836 ?auto_35837 ) ) ( not ( = ?auto_35832 ?auto_35837 ) ) ( AVAILABLE ?auto_35837 ) ( SURFACE-AT ?auto_35826 ?auto_35830 ) ( ON ?auto_35826 ?auto_35834 ) ( CLEAR ?auto_35826 ) ( not ( = ?auto_35827 ?auto_35834 ) ) ( not ( = ?auto_35828 ?auto_35834 ) ) ( not ( = ?auto_35826 ?auto_35834 ) ) ( not ( = ?auto_35831 ?auto_35834 ) ) ( not ( = ?auto_35838 ?auto_35834 ) ) ( not ( = ?auto_35825 ?auto_35834 ) ) ( TRUCK-AT ?auto_35829 ?auto_35835 ) ( ON ?auto_35824 ?auto_35823 ) ( ON ?auto_35825 ?auto_35824 ) ( not ( = ?auto_35823 ?auto_35824 ) ) ( not ( = ?auto_35823 ?auto_35825 ) ) ( not ( = ?auto_35823 ?auto_35826 ) ) ( not ( = ?auto_35823 ?auto_35827 ) ) ( not ( = ?auto_35823 ?auto_35828 ) ) ( not ( = ?auto_35823 ?auto_35831 ) ) ( not ( = ?auto_35823 ?auto_35838 ) ) ( not ( = ?auto_35823 ?auto_35834 ) ) ( not ( = ?auto_35824 ?auto_35825 ) ) ( not ( = ?auto_35824 ?auto_35826 ) ) ( not ( = ?auto_35824 ?auto_35827 ) ) ( not ( = ?auto_35824 ?auto_35828 ) ) ( not ( = ?auto_35824 ?auto_35831 ) ) ( not ( = ?auto_35824 ?auto_35838 ) ) ( not ( = ?auto_35824 ?auto_35834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35826 ?auto_35827 ?auto_35828 )
      ( MAKE-5CRATE-VERIFY ?auto_35823 ?auto_35824 ?auto_35825 ?auto_35826 ?auto_35827 ?auto_35828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35839 - SURFACE
      ?auto_35840 - SURFACE
    )
    :vars
    (
      ?auto_35849 - HOIST
      ?auto_35848 - PLACE
      ?auto_35850 - SURFACE
      ?auto_35846 - PLACE
      ?auto_35845 - HOIST
      ?auto_35844 - SURFACE
      ?auto_35852 - SURFACE
      ?auto_35841 - SURFACE
      ?auto_35843 - PLACE
      ?auto_35851 - HOIST
      ?auto_35847 - SURFACE
      ?auto_35842 - TRUCK
      ?auto_35853 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35849 ?auto_35848 ) ( IS-CRATE ?auto_35840 ) ( not ( = ?auto_35839 ?auto_35840 ) ) ( not ( = ?auto_35850 ?auto_35839 ) ) ( not ( = ?auto_35850 ?auto_35840 ) ) ( not ( = ?auto_35846 ?auto_35848 ) ) ( HOIST-AT ?auto_35845 ?auto_35846 ) ( not ( = ?auto_35849 ?auto_35845 ) ) ( SURFACE-AT ?auto_35840 ?auto_35846 ) ( ON ?auto_35840 ?auto_35844 ) ( CLEAR ?auto_35840 ) ( not ( = ?auto_35839 ?auto_35844 ) ) ( not ( = ?auto_35840 ?auto_35844 ) ) ( not ( = ?auto_35850 ?auto_35844 ) ) ( IS-CRATE ?auto_35839 ) ( AVAILABLE ?auto_35845 ) ( SURFACE-AT ?auto_35839 ?auto_35846 ) ( ON ?auto_35839 ?auto_35852 ) ( CLEAR ?auto_35839 ) ( not ( = ?auto_35839 ?auto_35852 ) ) ( not ( = ?auto_35840 ?auto_35852 ) ) ( not ( = ?auto_35850 ?auto_35852 ) ) ( not ( = ?auto_35844 ?auto_35852 ) ) ( IS-CRATE ?auto_35850 ) ( not ( = ?auto_35841 ?auto_35850 ) ) ( not ( = ?auto_35839 ?auto_35841 ) ) ( not ( = ?auto_35840 ?auto_35841 ) ) ( not ( = ?auto_35844 ?auto_35841 ) ) ( not ( = ?auto_35852 ?auto_35841 ) ) ( not ( = ?auto_35843 ?auto_35848 ) ) ( not ( = ?auto_35846 ?auto_35843 ) ) ( HOIST-AT ?auto_35851 ?auto_35843 ) ( not ( = ?auto_35849 ?auto_35851 ) ) ( not ( = ?auto_35845 ?auto_35851 ) ) ( AVAILABLE ?auto_35851 ) ( SURFACE-AT ?auto_35850 ?auto_35843 ) ( ON ?auto_35850 ?auto_35847 ) ( CLEAR ?auto_35850 ) ( not ( = ?auto_35839 ?auto_35847 ) ) ( not ( = ?auto_35840 ?auto_35847 ) ) ( not ( = ?auto_35850 ?auto_35847 ) ) ( not ( = ?auto_35844 ?auto_35847 ) ) ( not ( = ?auto_35852 ?auto_35847 ) ) ( not ( = ?auto_35841 ?auto_35847 ) ) ( TRUCK-AT ?auto_35842 ?auto_35848 ) ( SURFACE-AT ?auto_35853 ?auto_35848 ) ( CLEAR ?auto_35853 ) ( LIFTING ?auto_35849 ?auto_35841 ) ( IS-CRATE ?auto_35841 ) ( not ( = ?auto_35853 ?auto_35841 ) ) ( not ( = ?auto_35839 ?auto_35853 ) ) ( not ( = ?auto_35840 ?auto_35853 ) ) ( not ( = ?auto_35850 ?auto_35853 ) ) ( not ( = ?auto_35844 ?auto_35853 ) ) ( not ( = ?auto_35852 ?auto_35853 ) ) ( not ( = ?auto_35847 ?auto_35853 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35853 ?auto_35841 )
      ( MAKE-2CRATE ?auto_35850 ?auto_35839 ?auto_35840 )
      ( MAKE-1CRATE-VERIFY ?auto_35839 ?auto_35840 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35854 - SURFACE
      ?auto_35855 - SURFACE
      ?auto_35856 - SURFACE
    )
    :vars
    (
      ?auto_35866 - HOIST
      ?auto_35858 - PLACE
      ?auto_35861 - PLACE
      ?auto_35863 - HOIST
      ?auto_35859 - SURFACE
      ?auto_35864 - SURFACE
      ?auto_35867 - SURFACE
      ?auto_35862 - PLACE
      ?auto_35860 - HOIST
      ?auto_35868 - SURFACE
      ?auto_35865 - TRUCK
      ?auto_35857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35866 ?auto_35858 ) ( IS-CRATE ?auto_35856 ) ( not ( = ?auto_35855 ?auto_35856 ) ) ( not ( = ?auto_35854 ?auto_35855 ) ) ( not ( = ?auto_35854 ?auto_35856 ) ) ( not ( = ?auto_35861 ?auto_35858 ) ) ( HOIST-AT ?auto_35863 ?auto_35861 ) ( not ( = ?auto_35866 ?auto_35863 ) ) ( SURFACE-AT ?auto_35856 ?auto_35861 ) ( ON ?auto_35856 ?auto_35859 ) ( CLEAR ?auto_35856 ) ( not ( = ?auto_35855 ?auto_35859 ) ) ( not ( = ?auto_35856 ?auto_35859 ) ) ( not ( = ?auto_35854 ?auto_35859 ) ) ( IS-CRATE ?auto_35855 ) ( AVAILABLE ?auto_35863 ) ( SURFACE-AT ?auto_35855 ?auto_35861 ) ( ON ?auto_35855 ?auto_35864 ) ( CLEAR ?auto_35855 ) ( not ( = ?auto_35855 ?auto_35864 ) ) ( not ( = ?auto_35856 ?auto_35864 ) ) ( not ( = ?auto_35854 ?auto_35864 ) ) ( not ( = ?auto_35859 ?auto_35864 ) ) ( IS-CRATE ?auto_35854 ) ( not ( = ?auto_35867 ?auto_35854 ) ) ( not ( = ?auto_35855 ?auto_35867 ) ) ( not ( = ?auto_35856 ?auto_35867 ) ) ( not ( = ?auto_35859 ?auto_35867 ) ) ( not ( = ?auto_35864 ?auto_35867 ) ) ( not ( = ?auto_35862 ?auto_35858 ) ) ( not ( = ?auto_35861 ?auto_35862 ) ) ( HOIST-AT ?auto_35860 ?auto_35862 ) ( not ( = ?auto_35866 ?auto_35860 ) ) ( not ( = ?auto_35863 ?auto_35860 ) ) ( AVAILABLE ?auto_35860 ) ( SURFACE-AT ?auto_35854 ?auto_35862 ) ( ON ?auto_35854 ?auto_35868 ) ( CLEAR ?auto_35854 ) ( not ( = ?auto_35855 ?auto_35868 ) ) ( not ( = ?auto_35856 ?auto_35868 ) ) ( not ( = ?auto_35854 ?auto_35868 ) ) ( not ( = ?auto_35859 ?auto_35868 ) ) ( not ( = ?auto_35864 ?auto_35868 ) ) ( not ( = ?auto_35867 ?auto_35868 ) ) ( TRUCK-AT ?auto_35865 ?auto_35858 ) ( SURFACE-AT ?auto_35857 ?auto_35858 ) ( CLEAR ?auto_35857 ) ( LIFTING ?auto_35866 ?auto_35867 ) ( IS-CRATE ?auto_35867 ) ( not ( = ?auto_35857 ?auto_35867 ) ) ( not ( = ?auto_35855 ?auto_35857 ) ) ( not ( = ?auto_35856 ?auto_35857 ) ) ( not ( = ?auto_35854 ?auto_35857 ) ) ( not ( = ?auto_35859 ?auto_35857 ) ) ( not ( = ?auto_35864 ?auto_35857 ) ) ( not ( = ?auto_35868 ?auto_35857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35855 ?auto_35856 )
      ( MAKE-2CRATE-VERIFY ?auto_35854 ?auto_35855 ?auto_35856 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35869 - SURFACE
      ?auto_35870 - SURFACE
      ?auto_35871 - SURFACE
      ?auto_35872 - SURFACE
    )
    :vars
    (
      ?auto_35878 - HOIST
      ?auto_35874 - PLACE
      ?auto_35875 - PLACE
      ?auto_35873 - HOIST
      ?auto_35881 - SURFACE
      ?auto_35882 - SURFACE
      ?auto_35880 - PLACE
      ?auto_35883 - HOIST
      ?auto_35876 - SURFACE
      ?auto_35879 - TRUCK
      ?auto_35877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35878 ?auto_35874 ) ( IS-CRATE ?auto_35872 ) ( not ( = ?auto_35871 ?auto_35872 ) ) ( not ( = ?auto_35870 ?auto_35871 ) ) ( not ( = ?auto_35870 ?auto_35872 ) ) ( not ( = ?auto_35875 ?auto_35874 ) ) ( HOIST-AT ?auto_35873 ?auto_35875 ) ( not ( = ?auto_35878 ?auto_35873 ) ) ( SURFACE-AT ?auto_35872 ?auto_35875 ) ( ON ?auto_35872 ?auto_35881 ) ( CLEAR ?auto_35872 ) ( not ( = ?auto_35871 ?auto_35881 ) ) ( not ( = ?auto_35872 ?auto_35881 ) ) ( not ( = ?auto_35870 ?auto_35881 ) ) ( IS-CRATE ?auto_35871 ) ( AVAILABLE ?auto_35873 ) ( SURFACE-AT ?auto_35871 ?auto_35875 ) ( ON ?auto_35871 ?auto_35882 ) ( CLEAR ?auto_35871 ) ( not ( = ?auto_35871 ?auto_35882 ) ) ( not ( = ?auto_35872 ?auto_35882 ) ) ( not ( = ?auto_35870 ?auto_35882 ) ) ( not ( = ?auto_35881 ?auto_35882 ) ) ( IS-CRATE ?auto_35870 ) ( not ( = ?auto_35869 ?auto_35870 ) ) ( not ( = ?auto_35871 ?auto_35869 ) ) ( not ( = ?auto_35872 ?auto_35869 ) ) ( not ( = ?auto_35881 ?auto_35869 ) ) ( not ( = ?auto_35882 ?auto_35869 ) ) ( not ( = ?auto_35880 ?auto_35874 ) ) ( not ( = ?auto_35875 ?auto_35880 ) ) ( HOIST-AT ?auto_35883 ?auto_35880 ) ( not ( = ?auto_35878 ?auto_35883 ) ) ( not ( = ?auto_35873 ?auto_35883 ) ) ( AVAILABLE ?auto_35883 ) ( SURFACE-AT ?auto_35870 ?auto_35880 ) ( ON ?auto_35870 ?auto_35876 ) ( CLEAR ?auto_35870 ) ( not ( = ?auto_35871 ?auto_35876 ) ) ( not ( = ?auto_35872 ?auto_35876 ) ) ( not ( = ?auto_35870 ?auto_35876 ) ) ( not ( = ?auto_35881 ?auto_35876 ) ) ( not ( = ?auto_35882 ?auto_35876 ) ) ( not ( = ?auto_35869 ?auto_35876 ) ) ( TRUCK-AT ?auto_35879 ?auto_35874 ) ( SURFACE-AT ?auto_35877 ?auto_35874 ) ( CLEAR ?auto_35877 ) ( LIFTING ?auto_35878 ?auto_35869 ) ( IS-CRATE ?auto_35869 ) ( not ( = ?auto_35877 ?auto_35869 ) ) ( not ( = ?auto_35871 ?auto_35877 ) ) ( not ( = ?auto_35872 ?auto_35877 ) ) ( not ( = ?auto_35870 ?auto_35877 ) ) ( not ( = ?auto_35881 ?auto_35877 ) ) ( not ( = ?auto_35882 ?auto_35877 ) ) ( not ( = ?auto_35876 ?auto_35877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35870 ?auto_35871 ?auto_35872 )
      ( MAKE-3CRATE-VERIFY ?auto_35869 ?auto_35870 ?auto_35871 ?auto_35872 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35884 - SURFACE
      ?auto_35885 - SURFACE
      ?auto_35886 - SURFACE
      ?auto_35887 - SURFACE
      ?auto_35888 - SURFACE
    )
    :vars
    (
      ?auto_35893 - HOIST
      ?auto_35890 - PLACE
      ?auto_35891 - PLACE
      ?auto_35889 - HOIST
      ?auto_35896 - SURFACE
      ?auto_35897 - SURFACE
      ?auto_35895 - PLACE
      ?auto_35898 - HOIST
      ?auto_35892 - SURFACE
      ?auto_35894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35893 ?auto_35890 ) ( IS-CRATE ?auto_35888 ) ( not ( = ?auto_35887 ?auto_35888 ) ) ( not ( = ?auto_35886 ?auto_35887 ) ) ( not ( = ?auto_35886 ?auto_35888 ) ) ( not ( = ?auto_35891 ?auto_35890 ) ) ( HOIST-AT ?auto_35889 ?auto_35891 ) ( not ( = ?auto_35893 ?auto_35889 ) ) ( SURFACE-AT ?auto_35888 ?auto_35891 ) ( ON ?auto_35888 ?auto_35896 ) ( CLEAR ?auto_35888 ) ( not ( = ?auto_35887 ?auto_35896 ) ) ( not ( = ?auto_35888 ?auto_35896 ) ) ( not ( = ?auto_35886 ?auto_35896 ) ) ( IS-CRATE ?auto_35887 ) ( AVAILABLE ?auto_35889 ) ( SURFACE-AT ?auto_35887 ?auto_35891 ) ( ON ?auto_35887 ?auto_35897 ) ( CLEAR ?auto_35887 ) ( not ( = ?auto_35887 ?auto_35897 ) ) ( not ( = ?auto_35888 ?auto_35897 ) ) ( not ( = ?auto_35886 ?auto_35897 ) ) ( not ( = ?auto_35896 ?auto_35897 ) ) ( IS-CRATE ?auto_35886 ) ( not ( = ?auto_35885 ?auto_35886 ) ) ( not ( = ?auto_35887 ?auto_35885 ) ) ( not ( = ?auto_35888 ?auto_35885 ) ) ( not ( = ?auto_35896 ?auto_35885 ) ) ( not ( = ?auto_35897 ?auto_35885 ) ) ( not ( = ?auto_35895 ?auto_35890 ) ) ( not ( = ?auto_35891 ?auto_35895 ) ) ( HOIST-AT ?auto_35898 ?auto_35895 ) ( not ( = ?auto_35893 ?auto_35898 ) ) ( not ( = ?auto_35889 ?auto_35898 ) ) ( AVAILABLE ?auto_35898 ) ( SURFACE-AT ?auto_35886 ?auto_35895 ) ( ON ?auto_35886 ?auto_35892 ) ( CLEAR ?auto_35886 ) ( not ( = ?auto_35887 ?auto_35892 ) ) ( not ( = ?auto_35888 ?auto_35892 ) ) ( not ( = ?auto_35886 ?auto_35892 ) ) ( not ( = ?auto_35896 ?auto_35892 ) ) ( not ( = ?auto_35897 ?auto_35892 ) ) ( not ( = ?auto_35885 ?auto_35892 ) ) ( TRUCK-AT ?auto_35894 ?auto_35890 ) ( SURFACE-AT ?auto_35884 ?auto_35890 ) ( CLEAR ?auto_35884 ) ( LIFTING ?auto_35893 ?auto_35885 ) ( IS-CRATE ?auto_35885 ) ( not ( = ?auto_35884 ?auto_35885 ) ) ( not ( = ?auto_35887 ?auto_35884 ) ) ( not ( = ?auto_35888 ?auto_35884 ) ) ( not ( = ?auto_35886 ?auto_35884 ) ) ( not ( = ?auto_35896 ?auto_35884 ) ) ( not ( = ?auto_35897 ?auto_35884 ) ) ( not ( = ?auto_35892 ?auto_35884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35886 ?auto_35887 ?auto_35888 )
      ( MAKE-4CRATE-VERIFY ?auto_35884 ?auto_35885 ?auto_35886 ?auto_35887 ?auto_35888 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35899 - SURFACE
      ?auto_35900 - SURFACE
      ?auto_35901 - SURFACE
      ?auto_35902 - SURFACE
      ?auto_35903 - SURFACE
      ?auto_35904 - SURFACE
    )
    :vars
    (
      ?auto_35909 - HOIST
      ?auto_35906 - PLACE
      ?auto_35907 - PLACE
      ?auto_35905 - HOIST
      ?auto_35912 - SURFACE
      ?auto_35913 - SURFACE
      ?auto_35911 - PLACE
      ?auto_35914 - HOIST
      ?auto_35908 - SURFACE
      ?auto_35910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35909 ?auto_35906 ) ( IS-CRATE ?auto_35904 ) ( not ( = ?auto_35903 ?auto_35904 ) ) ( not ( = ?auto_35902 ?auto_35903 ) ) ( not ( = ?auto_35902 ?auto_35904 ) ) ( not ( = ?auto_35907 ?auto_35906 ) ) ( HOIST-AT ?auto_35905 ?auto_35907 ) ( not ( = ?auto_35909 ?auto_35905 ) ) ( SURFACE-AT ?auto_35904 ?auto_35907 ) ( ON ?auto_35904 ?auto_35912 ) ( CLEAR ?auto_35904 ) ( not ( = ?auto_35903 ?auto_35912 ) ) ( not ( = ?auto_35904 ?auto_35912 ) ) ( not ( = ?auto_35902 ?auto_35912 ) ) ( IS-CRATE ?auto_35903 ) ( AVAILABLE ?auto_35905 ) ( SURFACE-AT ?auto_35903 ?auto_35907 ) ( ON ?auto_35903 ?auto_35913 ) ( CLEAR ?auto_35903 ) ( not ( = ?auto_35903 ?auto_35913 ) ) ( not ( = ?auto_35904 ?auto_35913 ) ) ( not ( = ?auto_35902 ?auto_35913 ) ) ( not ( = ?auto_35912 ?auto_35913 ) ) ( IS-CRATE ?auto_35902 ) ( not ( = ?auto_35901 ?auto_35902 ) ) ( not ( = ?auto_35903 ?auto_35901 ) ) ( not ( = ?auto_35904 ?auto_35901 ) ) ( not ( = ?auto_35912 ?auto_35901 ) ) ( not ( = ?auto_35913 ?auto_35901 ) ) ( not ( = ?auto_35911 ?auto_35906 ) ) ( not ( = ?auto_35907 ?auto_35911 ) ) ( HOIST-AT ?auto_35914 ?auto_35911 ) ( not ( = ?auto_35909 ?auto_35914 ) ) ( not ( = ?auto_35905 ?auto_35914 ) ) ( AVAILABLE ?auto_35914 ) ( SURFACE-AT ?auto_35902 ?auto_35911 ) ( ON ?auto_35902 ?auto_35908 ) ( CLEAR ?auto_35902 ) ( not ( = ?auto_35903 ?auto_35908 ) ) ( not ( = ?auto_35904 ?auto_35908 ) ) ( not ( = ?auto_35902 ?auto_35908 ) ) ( not ( = ?auto_35912 ?auto_35908 ) ) ( not ( = ?auto_35913 ?auto_35908 ) ) ( not ( = ?auto_35901 ?auto_35908 ) ) ( TRUCK-AT ?auto_35910 ?auto_35906 ) ( SURFACE-AT ?auto_35900 ?auto_35906 ) ( CLEAR ?auto_35900 ) ( LIFTING ?auto_35909 ?auto_35901 ) ( IS-CRATE ?auto_35901 ) ( not ( = ?auto_35900 ?auto_35901 ) ) ( not ( = ?auto_35903 ?auto_35900 ) ) ( not ( = ?auto_35904 ?auto_35900 ) ) ( not ( = ?auto_35902 ?auto_35900 ) ) ( not ( = ?auto_35912 ?auto_35900 ) ) ( not ( = ?auto_35913 ?auto_35900 ) ) ( not ( = ?auto_35908 ?auto_35900 ) ) ( ON ?auto_35900 ?auto_35899 ) ( not ( = ?auto_35899 ?auto_35900 ) ) ( not ( = ?auto_35899 ?auto_35901 ) ) ( not ( = ?auto_35899 ?auto_35902 ) ) ( not ( = ?auto_35899 ?auto_35903 ) ) ( not ( = ?auto_35899 ?auto_35904 ) ) ( not ( = ?auto_35899 ?auto_35912 ) ) ( not ( = ?auto_35899 ?auto_35913 ) ) ( not ( = ?auto_35899 ?auto_35908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35902 ?auto_35903 ?auto_35904 )
      ( MAKE-5CRATE-VERIFY ?auto_35899 ?auto_35900 ?auto_35901 ?auto_35902 ?auto_35903 ?auto_35904 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35915 - SURFACE
      ?auto_35916 - SURFACE
    )
    :vars
    (
      ?auto_35922 - HOIST
      ?auto_35918 - PLACE
      ?auto_35929 - SURFACE
      ?auto_35919 - PLACE
      ?auto_35917 - HOIST
      ?auto_35925 - SURFACE
      ?auto_35926 - SURFACE
      ?auto_35928 - SURFACE
      ?auto_35924 - PLACE
      ?auto_35927 - HOIST
      ?auto_35920 - SURFACE
      ?auto_35923 - TRUCK
      ?auto_35921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35922 ?auto_35918 ) ( IS-CRATE ?auto_35916 ) ( not ( = ?auto_35915 ?auto_35916 ) ) ( not ( = ?auto_35929 ?auto_35915 ) ) ( not ( = ?auto_35929 ?auto_35916 ) ) ( not ( = ?auto_35919 ?auto_35918 ) ) ( HOIST-AT ?auto_35917 ?auto_35919 ) ( not ( = ?auto_35922 ?auto_35917 ) ) ( SURFACE-AT ?auto_35916 ?auto_35919 ) ( ON ?auto_35916 ?auto_35925 ) ( CLEAR ?auto_35916 ) ( not ( = ?auto_35915 ?auto_35925 ) ) ( not ( = ?auto_35916 ?auto_35925 ) ) ( not ( = ?auto_35929 ?auto_35925 ) ) ( IS-CRATE ?auto_35915 ) ( AVAILABLE ?auto_35917 ) ( SURFACE-AT ?auto_35915 ?auto_35919 ) ( ON ?auto_35915 ?auto_35926 ) ( CLEAR ?auto_35915 ) ( not ( = ?auto_35915 ?auto_35926 ) ) ( not ( = ?auto_35916 ?auto_35926 ) ) ( not ( = ?auto_35929 ?auto_35926 ) ) ( not ( = ?auto_35925 ?auto_35926 ) ) ( IS-CRATE ?auto_35929 ) ( not ( = ?auto_35928 ?auto_35929 ) ) ( not ( = ?auto_35915 ?auto_35928 ) ) ( not ( = ?auto_35916 ?auto_35928 ) ) ( not ( = ?auto_35925 ?auto_35928 ) ) ( not ( = ?auto_35926 ?auto_35928 ) ) ( not ( = ?auto_35924 ?auto_35918 ) ) ( not ( = ?auto_35919 ?auto_35924 ) ) ( HOIST-AT ?auto_35927 ?auto_35924 ) ( not ( = ?auto_35922 ?auto_35927 ) ) ( not ( = ?auto_35917 ?auto_35927 ) ) ( AVAILABLE ?auto_35927 ) ( SURFACE-AT ?auto_35929 ?auto_35924 ) ( ON ?auto_35929 ?auto_35920 ) ( CLEAR ?auto_35929 ) ( not ( = ?auto_35915 ?auto_35920 ) ) ( not ( = ?auto_35916 ?auto_35920 ) ) ( not ( = ?auto_35929 ?auto_35920 ) ) ( not ( = ?auto_35925 ?auto_35920 ) ) ( not ( = ?auto_35926 ?auto_35920 ) ) ( not ( = ?auto_35928 ?auto_35920 ) ) ( TRUCK-AT ?auto_35923 ?auto_35918 ) ( SURFACE-AT ?auto_35921 ?auto_35918 ) ( CLEAR ?auto_35921 ) ( IS-CRATE ?auto_35928 ) ( not ( = ?auto_35921 ?auto_35928 ) ) ( not ( = ?auto_35915 ?auto_35921 ) ) ( not ( = ?auto_35916 ?auto_35921 ) ) ( not ( = ?auto_35929 ?auto_35921 ) ) ( not ( = ?auto_35925 ?auto_35921 ) ) ( not ( = ?auto_35926 ?auto_35921 ) ) ( not ( = ?auto_35920 ?auto_35921 ) ) ( AVAILABLE ?auto_35922 ) ( IN ?auto_35928 ?auto_35923 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35922 ?auto_35928 ?auto_35923 ?auto_35918 )
      ( MAKE-2CRATE ?auto_35929 ?auto_35915 ?auto_35916 )
      ( MAKE-1CRATE-VERIFY ?auto_35915 ?auto_35916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35930 - SURFACE
      ?auto_35931 - SURFACE
      ?auto_35932 - SURFACE
    )
    :vars
    (
      ?auto_35939 - HOIST
      ?auto_35937 - PLACE
      ?auto_35935 - PLACE
      ?auto_35940 - HOIST
      ?auto_35936 - SURFACE
      ?auto_35934 - SURFACE
      ?auto_35943 - SURFACE
      ?auto_35944 - PLACE
      ?auto_35942 - HOIST
      ?auto_35933 - SURFACE
      ?auto_35941 - TRUCK
      ?auto_35938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35939 ?auto_35937 ) ( IS-CRATE ?auto_35932 ) ( not ( = ?auto_35931 ?auto_35932 ) ) ( not ( = ?auto_35930 ?auto_35931 ) ) ( not ( = ?auto_35930 ?auto_35932 ) ) ( not ( = ?auto_35935 ?auto_35937 ) ) ( HOIST-AT ?auto_35940 ?auto_35935 ) ( not ( = ?auto_35939 ?auto_35940 ) ) ( SURFACE-AT ?auto_35932 ?auto_35935 ) ( ON ?auto_35932 ?auto_35936 ) ( CLEAR ?auto_35932 ) ( not ( = ?auto_35931 ?auto_35936 ) ) ( not ( = ?auto_35932 ?auto_35936 ) ) ( not ( = ?auto_35930 ?auto_35936 ) ) ( IS-CRATE ?auto_35931 ) ( AVAILABLE ?auto_35940 ) ( SURFACE-AT ?auto_35931 ?auto_35935 ) ( ON ?auto_35931 ?auto_35934 ) ( CLEAR ?auto_35931 ) ( not ( = ?auto_35931 ?auto_35934 ) ) ( not ( = ?auto_35932 ?auto_35934 ) ) ( not ( = ?auto_35930 ?auto_35934 ) ) ( not ( = ?auto_35936 ?auto_35934 ) ) ( IS-CRATE ?auto_35930 ) ( not ( = ?auto_35943 ?auto_35930 ) ) ( not ( = ?auto_35931 ?auto_35943 ) ) ( not ( = ?auto_35932 ?auto_35943 ) ) ( not ( = ?auto_35936 ?auto_35943 ) ) ( not ( = ?auto_35934 ?auto_35943 ) ) ( not ( = ?auto_35944 ?auto_35937 ) ) ( not ( = ?auto_35935 ?auto_35944 ) ) ( HOIST-AT ?auto_35942 ?auto_35944 ) ( not ( = ?auto_35939 ?auto_35942 ) ) ( not ( = ?auto_35940 ?auto_35942 ) ) ( AVAILABLE ?auto_35942 ) ( SURFACE-AT ?auto_35930 ?auto_35944 ) ( ON ?auto_35930 ?auto_35933 ) ( CLEAR ?auto_35930 ) ( not ( = ?auto_35931 ?auto_35933 ) ) ( not ( = ?auto_35932 ?auto_35933 ) ) ( not ( = ?auto_35930 ?auto_35933 ) ) ( not ( = ?auto_35936 ?auto_35933 ) ) ( not ( = ?auto_35934 ?auto_35933 ) ) ( not ( = ?auto_35943 ?auto_35933 ) ) ( TRUCK-AT ?auto_35941 ?auto_35937 ) ( SURFACE-AT ?auto_35938 ?auto_35937 ) ( CLEAR ?auto_35938 ) ( IS-CRATE ?auto_35943 ) ( not ( = ?auto_35938 ?auto_35943 ) ) ( not ( = ?auto_35931 ?auto_35938 ) ) ( not ( = ?auto_35932 ?auto_35938 ) ) ( not ( = ?auto_35930 ?auto_35938 ) ) ( not ( = ?auto_35936 ?auto_35938 ) ) ( not ( = ?auto_35934 ?auto_35938 ) ) ( not ( = ?auto_35933 ?auto_35938 ) ) ( AVAILABLE ?auto_35939 ) ( IN ?auto_35943 ?auto_35941 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35931 ?auto_35932 )
      ( MAKE-2CRATE-VERIFY ?auto_35930 ?auto_35931 ?auto_35932 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35945 - SURFACE
      ?auto_35946 - SURFACE
      ?auto_35947 - SURFACE
      ?auto_35948 - SURFACE
    )
    :vars
    (
      ?auto_35950 - HOIST
      ?auto_35958 - PLACE
      ?auto_35952 - PLACE
      ?auto_35953 - HOIST
      ?auto_35951 - SURFACE
      ?auto_35956 - SURFACE
      ?auto_35955 - PLACE
      ?auto_35959 - HOIST
      ?auto_35949 - SURFACE
      ?auto_35954 - TRUCK
      ?auto_35957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35950 ?auto_35958 ) ( IS-CRATE ?auto_35948 ) ( not ( = ?auto_35947 ?auto_35948 ) ) ( not ( = ?auto_35946 ?auto_35947 ) ) ( not ( = ?auto_35946 ?auto_35948 ) ) ( not ( = ?auto_35952 ?auto_35958 ) ) ( HOIST-AT ?auto_35953 ?auto_35952 ) ( not ( = ?auto_35950 ?auto_35953 ) ) ( SURFACE-AT ?auto_35948 ?auto_35952 ) ( ON ?auto_35948 ?auto_35951 ) ( CLEAR ?auto_35948 ) ( not ( = ?auto_35947 ?auto_35951 ) ) ( not ( = ?auto_35948 ?auto_35951 ) ) ( not ( = ?auto_35946 ?auto_35951 ) ) ( IS-CRATE ?auto_35947 ) ( AVAILABLE ?auto_35953 ) ( SURFACE-AT ?auto_35947 ?auto_35952 ) ( ON ?auto_35947 ?auto_35956 ) ( CLEAR ?auto_35947 ) ( not ( = ?auto_35947 ?auto_35956 ) ) ( not ( = ?auto_35948 ?auto_35956 ) ) ( not ( = ?auto_35946 ?auto_35956 ) ) ( not ( = ?auto_35951 ?auto_35956 ) ) ( IS-CRATE ?auto_35946 ) ( not ( = ?auto_35945 ?auto_35946 ) ) ( not ( = ?auto_35947 ?auto_35945 ) ) ( not ( = ?auto_35948 ?auto_35945 ) ) ( not ( = ?auto_35951 ?auto_35945 ) ) ( not ( = ?auto_35956 ?auto_35945 ) ) ( not ( = ?auto_35955 ?auto_35958 ) ) ( not ( = ?auto_35952 ?auto_35955 ) ) ( HOIST-AT ?auto_35959 ?auto_35955 ) ( not ( = ?auto_35950 ?auto_35959 ) ) ( not ( = ?auto_35953 ?auto_35959 ) ) ( AVAILABLE ?auto_35959 ) ( SURFACE-AT ?auto_35946 ?auto_35955 ) ( ON ?auto_35946 ?auto_35949 ) ( CLEAR ?auto_35946 ) ( not ( = ?auto_35947 ?auto_35949 ) ) ( not ( = ?auto_35948 ?auto_35949 ) ) ( not ( = ?auto_35946 ?auto_35949 ) ) ( not ( = ?auto_35951 ?auto_35949 ) ) ( not ( = ?auto_35956 ?auto_35949 ) ) ( not ( = ?auto_35945 ?auto_35949 ) ) ( TRUCK-AT ?auto_35954 ?auto_35958 ) ( SURFACE-AT ?auto_35957 ?auto_35958 ) ( CLEAR ?auto_35957 ) ( IS-CRATE ?auto_35945 ) ( not ( = ?auto_35957 ?auto_35945 ) ) ( not ( = ?auto_35947 ?auto_35957 ) ) ( not ( = ?auto_35948 ?auto_35957 ) ) ( not ( = ?auto_35946 ?auto_35957 ) ) ( not ( = ?auto_35951 ?auto_35957 ) ) ( not ( = ?auto_35956 ?auto_35957 ) ) ( not ( = ?auto_35949 ?auto_35957 ) ) ( AVAILABLE ?auto_35950 ) ( IN ?auto_35945 ?auto_35954 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35946 ?auto_35947 ?auto_35948 )
      ( MAKE-3CRATE-VERIFY ?auto_35945 ?auto_35946 ?auto_35947 ?auto_35948 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35960 - SURFACE
      ?auto_35961 - SURFACE
      ?auto_35962 - SURFACE
      ?auto_35963 - SURFACE
      ?auto_35964 - SURFACE
    )
    :vars
    (
      ?auto_35966 - HOIST
      ?auto_35973 - PLACE
      ?auto_35968 - PLACE
      ?auto_35969 - HOIST
      ?auto_35967 - SURFACE
      ?auto_35972 - SURFACE
      ?auto_35971 - PLACE
      ?auto_35974 - HOIST
      ?auto_35965 - SURFACE
      ?auto_35970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35966 ?auto_35973 ) ( IS-CRATE ?auto_35964 ) ( not ( = ?auto_35963 ?auto_35964 ) ) ( not ( = ?auto_35962 ?auto_35963 ) ) ( not ( = ?auto_35962 ?auto_35964 ) ) ( not ( = ?auto_35968 ?auto_35973 ) ) ( HOIST-AT ?auto_35969 ?auto_35968 ) ( not ( = ?auto_35966 ?auto_35969 ) ) ( SURFACE-AT ?auto_35964 ?auto_35968 ) ( ON ?auto_35964 ?auto_35967 ) ( CLEAR ?auto_35964 ) ( not ( = ?auto_35963 ?auto_35967 ) ) ( not ( = ?auto_35964 ?auto_35967 ) ) ( not ( = ?auto_35962 ?auto_35967 ) ) ( IS-CRATE ?auto_35963 ) ( AVAILABLE ?auto_35969 ) ( SURFACE-AT ?auto_35963 ?auto_35968 ) ( ON ?auto_35963 ?auto_35972 ) ( CLEAR ?auto_35963 ) ( not ( = ?auto_35963 ?auto_35972 ) ) ( not ( = ?auto_35964 ?auto_35972 ) ) ( not ( = ?auto_35962 ?auto_35972 ) ) ( not ( = ?auto_35967 ?auto_35972 ) ) ( IS-CRATE ?auto_35962 ) ( not ( = ?auto_35961 ?auto_35962 ) ) ( not ( = ?auto_35963 ?auto_35961 ) ) ( not ( = ?auto_35964 ?auto_35961 ) ) ( not ( = ?auto_35967 ?auto_35961 ) ) ( not ( = ?auto_35972 ?auto_35961 ) ) ( not ( = ?auto_35971 ?auto_35973 ) ) ( not ( = ?auto_35968 ?auto_35971 ) ) ( HOIST-AT ?auto_35974 ?auto_35971 ) ( not ( = ?auto_35966 ?auto_35974 ) ) ( not ( = ?auto_35969 ?auto_35974 ) ) ( AVAILABLE ?auto_35974 ) ( SURFACE-AT ?auto_35962 ?auto_35971 ) ( ON ?auto_35962 ?auto_35965 ) ( CLEAR ?auto_35962 ) ( not ( = ?auto_35963 ?auto_35965 ) ) ( not ( = ?auto_35964 ?auto_35965 ) ) ( not ( = ?auto_35962 ?auto_35965 ) ) ( not ( = ?auto_35967 ?auto_35965 ) ) ( not ( = ?auto_35972 ?auto_35965 ) ) ( not ( = ?auto_35961 ?auto_35965 ) ) ( TRUCK-AT ?auto_35970 ?auto_35973 ) ( SURFACE-AT ?auto_35960 ?auto_35973 ) ( CLEAR ?auto_35960 ) ( IS-CRATE ?auto_35961 ) ( not ( = ?auto_35960 ?auto_35961 ) ) ( not ( = ?auto_35963 ?auto_35960 ) ) ( not ( = ?auto_35964 ?auto_35960 ) ) ( not ( = ?auto_35962 ?auto_35960 ) ) ( not ( = ?auto_35967 ?auto_35960 ) ) ( not ( = ?auto_35972 ?auto_35960 ) ) ( not ( = ?auto_35965 ?auto_35960 ) ) ( AVAILABLE ?auto_35966 ) ( IN ?auto_35961 ?auto_35970 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35962 ?auto_35963 ?auto_35964 )
      ( MAKE-4CRATE-VERIFY ?auto_35960 ?auto_35961 ?auto_35962 ?auto_35963 ?auto_35964 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35975 - SURFACE
      ?auto_35976 - SURFACE
      ?auto_35977 - SURFACE
      ?auto_35978 - SURFACE
      ?auto_35979 - SURFACE
      ?auto_35980 - SURFACE
    )
    :vars
    (
      ?auto_35982 - HOIST
      ?auto_35989 - PLACE
      ?auto_35984 - PLACE
      ?auto_35985 - HOIST
      ?auto_35983 - SURFACE
      ?auto_35988 - SURFACE
      ?auto_35987 - PLACE
      ?auto_35990 - HOIST
      ?auto_35981 - SURFACE
      ?auto_35986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35982 ?auto_35989 ) ( IS-CRATE ?auto_35980 ) ( not ( = ?auto_35979 ?auto_35980 ) ) ( not ( = ?auto_35978 ?auto_35979 ) ) ( not ( = ?auto_35978 ?auto_35980 ) ) ( not ( = ?auto_35984 ?auto_35989 ) ) ( HOIST-AT ?auto_35985 ?auto_35984 ) ( not ( = ?auto_35982 ?auto_35985 ) ) ( SURFACE-AT ?auto_35980 ?auto_35984 ) ( ON ?auto_35980 ?auto_35983 ) ( CLEAR ?auto_35980 ) ( not ( = ?auto_35979 ?auto_35983 ) ) ( not ( = ?auto_35980 ?auto_35983 ) ) ( not ( = ?auto_35978 ?auto_35983 ) ) ( IS-CRATE ?auto_35979 ) ( AVAILABLE ?auto_35985 ) ( SURFACE-AT ?auto_35979 ?auto_35984 ) ( ON ?auto_35979 ?auto_35988 ) ( CLEAR ?auto_35979 ) ( not ( = ?auto_35979 ?auto_35988 ) ) ( not ( = ?auto_35980 ?auto_35988 ) ) ( not ( = ?auto_35978 ?auto_35988 ) ) ( not ( = ?auto_35983 ?auto_35988 ) ) ( IS-CRATE ?auto_35978 ) ( not ( = ?auto_35977 ?auto_35978 ) ) ( not ( = ?auto_35979 ?auto_35977 ) ) ( not ( = ?auto_35980 ?auto_35977 ) ) ( not ( = ?auto_35983 ?auto_35977 ) ) ( not ( = ?auto_35988 ?auto_35977 ) ) ( not ( = ?auto_35987 ?auto_35989 ) ) ( not ( = ?auto_35984 ?auto_35987 ) ) ( HOIST-AT ?auto_35990 ?auto_35987 ) ( not ( = ?auto_35982 ?auto_35990 ) ) ( not ( = ?auto_35985 ?auto_35990 ) ) ( AVAILABLE ?auto_35990 ) ( SURFACE-AT ?auto_35978 ?auto_35987 ) ( ON ?auto_35978 ?auto_35981 ) ( CLEAR ?auto_35978 ) ( not ( = ?auto_35979 ?auto_35981 ) ) ( not ( = ?auto_35980 ?auto_35981 ) ) ( not ( = ?auto_35978 ?auto_35981 ) ) ( not ( = ?auto_35983 ?auto_35981 ) ) ( not ( = ?auto_35988 ?auto_35981 ) ) ( not ( = ?auto_35977 ?auto_35981 ) ) ( TRUCK-AT ?auto_35986 ?auto_35989 ) ( SURFACE-AT ?auto_35976 ?auto_35989 ) ( CLEAR ?auto_35976 ) ( IS-CRATE ?auto_35977 ) ( not ( = ?auto_35976 ?auto_35977 ) ) ( not ( = ?auto_35979 ?auto_35976 ) ) ( not ( = ?auto_35980 ?auto_35976 ) ) ( not ( = ?auto_35978 ?auto_35976 ) ) ( not ( = ?auto_35983 ?auto_35976 ) ) ( not ( = ?auto_35988 ?auto_35976 ) ) ( not ( = ?auto_35981 ?auto_35976 ) ) ( AVAILABLE ?auto_35982 ) ( IN ?auto_35977 ?auto_35986 ) ( ON ?auto_35976 ?auto_35975 ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( not ( = ?auto_35975 ?auto_35977 ) ) ( not ( = ?auto_35975 ?auto_35978 ) ) ( not ( = ?auto_35975 ?auto_35979 ) ) ( not ( = ?auto_35975 ?auto_35980 ) ) ( not ( = ?auto_35975 ?auto_35983 ) ) ( not ( = ?auto_35975 ?auto_35988 ) ) ( not ( = ?auto_35975 ?auto_35981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35978 ?auto_35979 ?auto_35980 )
      ( MAKE-5CRATE-VERIFY ?auto_35975 ?auto_35976 ?auto_35977 ?auto_35978 ?auto_35979 ?auto_35980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35991 - SURFACE
      ?auto_35992 - SURFACE
    )
    :vars
    (
      ?auto_35994 - HOIST
      ?auto_36004 - PLACE
      ?auto_35996 - SURFACE
      ?auto_35997 - PLACE
      ?auto_35998 - HOIST
      ?auto_35995 - SURFACE
      ?auto_36001 - SURFACE
      ?auto_36002 - SURFACE
      ?auto_36000 - PLACE
      ?auto_36005 - HOIST
      ?auto_35993 - SURFACE
      ?auto_36003 - SURFACE
      ?auto_35999 - TRUCK
      ?auto_36006 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35994 ?auto_36004 ) ( IS-CRATE ?auto_35992 ) ( not ( = ?auto_35991 ?auto_35992 ) ) ( not ( = ?auto_35996 ?auto_35991 ) ) ( not ( = ?auto_35996 ?auto_35992 ) ) ( not ( = ?auto_35997 ?auto_36004 ) ) ( HOIST-AT ?auto_35998 ?auto_35997 ) ( not ( = ?auto_35994 ?auto_35998 ) ) ( SURFACE-AT ?auto_35992 ?auto_35997 ) ( ON ?auto_35992 ?auto_35995 ) ( CLEAR ?auto_35992 ) ( not ( = ?auto_35991 ?auto_35995 ) ) ( not ( = ?auto_35992 ?auto_35995 ) ) ( not ( = ?auto_35996 ?auto_35995 ) ) ( IS-CRATE ?auto_35991 ) ( AVAILABLE ?auto_35998 ) ( SURFACE-AT ?auto_35991 ?auto_35997 ) ( ON ?auto_35991 ?auto_36001 ) ( CLEAR ?auto_35991 ) ( not ( = ?auto_35991 ?auto_36001 ) ) ( not ( = ?auto_35992 ?auto_36001 ) ) ( not ( = ?auto_35996 ?auto_36001 ) ) ( not ( = ?auto_35995 ?auto_36001 ) ) ( IS-CRATE ?auto_35996 ) ( not ( = ?auto_36002 ?auto_35996 ) ) ( not ( = ?auto_35991 ?auto_36002 ) ) ( not ( = ?auto_35992 ?auto_36002 ) ) ( not ( = ?auto_35995 ?auto_36002 ) ) ( not ( = ?auto_36001 ?auto_36002 ) ) ( not ( = ?auto_36000 ?auto_36004 ) ) ( not ( = ?auto_35997 ?auto_36000 ) ) ( HOIST-AT ?auto_36005 ?auto_36000 ) ( not ( = ?auto_35994 ?auto_36005 ) ) ( not ( = ?auto_35998 ?auto_36005 ) ) ( AVAILABLE ?auto_36005 ) ( SURFACE-AT ?auto_35996 ?auto_36000 ) ( ON ?auto_35996 ?auto_35993 ) ( CLEAR ?auto_35996 ) ( not ( = ?auto_35991 ?auto_35993 ) ) ( not ( = ?auto_35992 ?auto_35993 ) ) ( not ( = ?auto_35996 ?auto_35993 ) ) ( not ( = ?auto_35995 ?auto_35993 ) ) ( not ( = ?auto_36001 ?auto_35993 ) ) ( not ( = ?auto_36002 ?auto_35993 ) ) ( SURFACE-AT ?auto_36003 ?auto_36004 ) ( CLEAR ?auto_36003 ) ( IS-CRATE ?auto_36002 ) ( not ( = ?auto_36003 ?auto_36002 ) ) ( not ( = ?auto_35991 ?auto_36003 ) ) ( not ( = ?auto_35992 ?auto_36003 ) ) ( not ( = ?auto_35996 ?auto_36003 ) ) ( not ( = ?auto_35995 ?auto_36003 ) ) ( not ( = ?auto_36001 ?auto_36003 ) ) ( not ( = ?auto_35993 ?auto_36003 ) ) ( AVAILABLE ?auto_35994 ) ( IN ?auto_36002 ?auto_35999 ) ( TRUCK-AT ?auto_35999 ?auto_36006 ) ( not ( = ?auto_36006 ?auto_36004 ) ) ( not ( = ?auto_35997 ?auto_36006 ) ) ( not ( = ?auto_36000 ?auto_36006 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35999 ?auto_36006 ?auto_36004 )
      ( MAKE-2CRATE ?auto_35996 ?auto_35991 ?auto_35992 )
      ( MAKE-1CRATE-VERIFY ?auto_35991 ?auto_35992 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36007 - SURFACE
      ?auto_36008 - SURFACE
      ?auto_36009 - SURFACE
    )
    :vars
    (
      ?auto_36012 - HOIST
      ?auto_36011 - PLACE
      ?auto_36014 - PLACE
      ?auto_36013 - HOIST
      ?auto_36020 - SURFACE
      ?auto_36010 - SURFACE
      ?auto_36019 - SURFACE
      ?auto_36021 - PLACE
      ?auto_36017 - HOIST
      ?auto_36016 - SURFACE
      ?auto_36018 - SURFACE
      ?auto_36022 - TRUCK
      ?auto_36015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36012 ?auto_36011 ) ( IS-CRATE ?auto_36009 ) ( not ( = ?auto_36008 ?auto_36009 ) ) ( not ( = ?auto_36007 ?auto_36008 ) ) ( not ( = ?auto_36007 ?auto_36009 ) ) ( not ( = ?auto_36014 ?auto_36011 ) ) ( HOIST-AT ?auto_36013 ?auto_36014 ) ( not ( = ?auto_36012 ?auto_36013 ) ) ( SURFACE-AT ?auto_36009 ?auto_36014 ) ( ON ?auto_36009 ?auto_36020 ) ( CLEAR ?auto_36009 ) ( not ( = ?auto_36008 ?auto_36020 ) ) ( not ( = ?auto_36009 ?auto_36020 ) ) ( not ( = ?auto_36007 ?auto_36020 ) ) ( IS-CRATE ?auto_36008 ) ( AVAILABLE ?auto_36013 ) ( SURFACE-AT ?auto_36008 ?auto_36014 ) ( ON ?auto_36008 ?auto_36010 ) ( CLEAR ?auto_36008 ) ( not ( = ?auto_36008 ?auto_36010 ) ) ( not ( = ?auto_36009 ?auto_36010 ) ) ( not ( = ?auto_36007 ?auto_36010 ) ) ( not ( = ?auto_36020 ?auto_36010 ) ) ( IS-CRATE ?auto_36007 ) ( not ( = ?auto_36019 ?auto_36007 ) ) ( not ( = ?auto_36008 ?auto_36019 ) ) ( not ( = ?auto_36009 ?auto_36019 ) ) ( not ( = ?auto_36020 ?auto_36019 ) ) ( not ( = ?auto_36010 ?auto_36019 ) ) ( not ( = ?auto_36021 ?auto_36011 ) ) ( not ( = ?auto_36014 ?auto_36021 ) ) ( HOIST-AT ?auto_36017 ?auto_36021 ) ( not ( = ?auto_36012 ?auto_36017 ) ) ( not ( = ?auto_36013 ?auto_36017 ) ) ( AVAILABLE ?auto_36017 ) ( SURFACE-AT ?auto_36007 ?auto_36021 ) ( ON ?auto_36007 ?auto_36016 ) ( CLEAR ?auto_36007 ) ( not ( = ?auto_36008 ?auto_36016 ) ) ( not ( = ?auto_36009 ?auto_36016 ) ) ( not ( = ?auto_36007 ?auto_36016 ) ) ( not ( = ?auto_36020 ?auto_36016 ) ) ( not ( = ?auto_36010 ?auto_36016 ) ) ( not ( = ?auto_36019 ?auto_36016 ) ) ( SURFACE-AT ?auto_36018 ?auto_36011 ) ( CLEAR ?auto_36018 ) ( IS-CRATE ?auto_36019 ) ( not ( = ?auto_36018 ?auto_36019 ) ) ( not ( = ?auto_36008 ?auto_36018 ) ) ( not ( = ?auto_36009 ?auto_36018 ) ) ( not ( = ?auto_36007 ?auto_36018 ) ) ( not ( = ?auto_36020 ?auto_36018 ) ) ( not ( = ?auto_36010 ?auto_36018 ) ) ( not ( = ?auto_36016 ?auto_36018 ) ) ( AVAILABLE ?auto_36012 ) ( IN ?auto_36019 ?auto_36022 ) ( TRUCK-AT ?auto_36022 ?auto_36015 ) ( not ( = ?auto_36015 ?auto_36011 ) ) ( not ( = ?auto_36014 ?auto_36015 ) ) ( not ( = ?auto_36021 ?auto_36015 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36008 ?auto_36009 )
      ( MAKE-2CRATE-VERIFY ?auto_36007 ?auto_36008 ?auto_36009 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36023 - SURFACE
      ?auto_36024 - SURFACE
      ?auto_36025 - SURFACE
      ?auto_36026 - SURFACE
    )
    :vars
    (
      ?auto_36030 - HOIST
      ?auto_36028 - PLACE
      ?auto_36037 - PLACE
      ?auto_36036 - HOIST
      ?auto_36034 - SURFACE
      ?auto_36038 - SURFACE
      ?auto_36033 - PLACE
      ?auto_36035 - HOIST
      ?auto_36031 - SURFACE
      ?auto_36032 - SURFACE
      ?auto_36027 - TRUCK
      ?auto_36029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36030 ?auto_36028 ) ( IS-CRATE ?auto_36026 ) ( not ( = ?auto_36025 ?auto_36026 ) ) ( not ( = ?auto_36024 ?auto_36025 ) ) ( not ( = ?auto_36024 ?auto_36026 ) ) ( not ( = ?auto_36037 ?auto_36028 ) ) ( HOIST-AT ?auto_36036 ?auto_36037 ) ( not ( = ?auto_36030 ?auto_36036 ) ) ( SURFACE-AT ?auto_36026 ?auto_36037 ) ( ON ?auto_36026 ?auto_36034 ) ( CLEAR ?auto_36026 ) ( not ( = ?auto_36025 ?auto_36034 ) ) ( not ( = ?auto_36026 ?auto_36034 ) ) ( not ( = ?auto_36024 ?auto_36034 ) ) ( IS-CRATE ?auto_36025 ) ( AVAILABLE ?auto_36036 ) ( SURFACE-AT ?auto_36025 ?auto_36037 ) ( ON ?auto_36025 ?auto_36038 ) ( CLEAR ?auto_36025 ) ( not ( = ?auto_36025 ?auto_36038 ) ) ( not ( = ?auto_36026 ?auto_36038 ) ) ( not ( = ?auto_36024 ?auto_36038 ) ) ( not ( = ?auto_36034 ?auto_36038 ) ) ( IS-CRATE ?auto_36024 ) ( not ( = ?auto_36023 ?auto_36024 ) ) ( not ( = ?auto_36025 ?auto_36023 ) ) ( not ( = ?auto_36026 ?auto_36023 ) ) ( not ( = ?auto_36034 ?auto_36023 ) ) ( not ( = ?auto_36038 ?auto_36023 ) ) ( not ( = ?auto_36033 ?auto_36028 ) ) ( not ( = ?auto_36037 ?auto_36033 ) ) ( HOIST-AT ?auto_36035 ?auto_36033 ) ( not ( = ?auto_36030 ?auto_36035 ) ) ( not ( = ?auto_36036 ?auto_36035 ) ) ( AVAILABLE ?auto_36035 ) ( SURFACE-AT ?auto_36024 ?auto_36033 ) ( ON ?auto_36024 ?auto_36031 ) ( CLEAR ?auto_36024 ) ( not ( = ?auto_36025 ?auto_36031 ) ) ( not ( = ?auto_36026 ?auto_36031 ) ) ( not ( = ?auto_36024 ?auto_36031 ) ) ( not ( = ?auto_36034 ?auto_36031 ) ) ( not ( = ?auto_36038 ?auto_36031 ) ) ( not ( = ?auto_36023 ?auto_36031 ) ) ( SURFACE-AT ?auto_36032 ?auto_36028 ) ( CLEAR ?auto_36032 ) ( IS-CRATE ?auto_36023 ) ( not ( = ?auto_36032 ?auto_36023 ) ) ( not ( = ?auto_36025 ?auto_36032 ) ) ( not ( = ?auto_36026 ?auto_36032 ) ) ( not ( = ?auto_36024 ?auto_36032 ) ) ( not ( = ?auto_36034 ?auto_36032 ) ) ( not ( = ?auto_36038 ?auto_36032 ) ) ( not ( = ?auto_36031 ?auto_36032 ) ) ( AVAILABLE ?auto_36030 ) ( IN ?auto_36023 ?auto_36027 ) ( TRUCK-AT ?auto_36027 ?auto_36029 ) ( not ( = ?auto_36029 ?auto_36028 ) ) ( not ( = ?auto_36037 ?auto_36029 ) ) ( not ( = ?auto_36033 ?auto_36029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36024 ?auto_36025 ?auto_36026 )
      ( MAKE-3CRATE-VERIFY ?auto_36023 ?auto_36024 ?auto_36025 ?auto_36026 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36039 - SURFACE
      ?auto_36040 - SURFACE
      ?auto_36041 - SURFACE
      ?auto_36042 - SURFACE
      ?auto_36043 - SURFACE
    )
    :vars
    (
      ?auto_36047 - HOIST
      ?auto_36045 - PLACE
      ?auto_36053 - PLACE
      ?auto_36052 - HOIST
      ?auto_36050 - SURFACE
      ?auto_36054 - SURFACE
      ?auto_36049 - PLACE
      ?auto_36051 - HOIST
      ?auto_36048 - SURFACE
      ?auto_36044 - TRUCK
      ?auto_36046 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36047 ?auto_36045 ) ( IS-CRATE ?auto_36043 ) ( not ( = ?auto_36042 ?auto_36043 ) ) ( not ( = ?auto_36041 ?auto_36042 ) ) ( not ( = ?auto_36041 ?auto_36043 ) ) ( not ( = ?auto_36053 ?auto_36045 ) ) ( HOIST-AT ?auto_36052 ?auto_36053 ) ( not ( = ?auto_36047 ?auto_36052 ) ) ( SURFACE-AT ?auto_36043 ?auto_36053 ) ( ON ?auto_36043 ?auto_36050 ) ( CLEAR ?auto_36043 ) ( not ( = ?auto_36042 ?auto_36050 ) ) ( not ( = ?auto_36043 ?auto_36050 ) ) ( not ( = ?auto_36041 ?auto_36050 ) ) ( IS-CRATE ?auto_36042 ) ( AVAILABLE ?auto_36052 ) ( SURFACE-AT ?auto_36042 ?auto_36053 ) ( ON ?auto_36042 ?auto_36054 ) ( CLEAR ?auto_36042 ) ( not ( = ?auto_36042 ?auto_36054 ) ) ( not ( = ?auto_36043 ?auto_36054 ) ) ( not ( = ?auto_36041 ?auto_36054 ) ) ( not ( = ?auto_36050 ?auto_36054 ) ) ( IS-CRATE ?auto_36041 ) ( not ( = ?auto_36040 ?auto_36041 ) ) ( not ( = ?auto_36042 ?auto_36040 ) ) ( not ( = ?auto_36043 ?auto_36040 ) ) ( not ( = ?auto_36050 ?auto_36040 ) ) ( not ( = ?auto_36054 ?auto_36040 ) ) ( not ( = ?auto_36049 ?auto_36045 ) ) ( not ( = ?auto_36053 ?auto_36049 ) ) ( HOIST-AT ?auto_36051 ?auto_36049 ) ( not ( = ?auto_36047 ?auto_36051 ) ) ( not ( = ?auto_36052 ?auto_36051 ) ) ( AVAILABLE ?auto_36051 ) ( SURFACE-AT ?auto_36041 ?auto_36049 ) ( ON ?auto_36041 ?auto_36048 ) ( CLEAR ?auto_36041 ) ( not ( = ?auto_36042 ?auto_36048 ) ) ( not ( = ?auto_36043 ?auto_36048 ) ) ( not ( = ?auto_36041 ?auto_36048 ) ) ( not ( = ?auto_36050 ?auto_36048 ) ) ( not ( = ?auto_36054 ?auto_36048 ) ) ( not ( = ?auto_36040 ?auto_36048 ) ) ( SURFACE-AT ?auto_36039 ?auto_36045 ) ( CLEAR ?auto_36039 ) ( IS-CRATE ?auto_36040 ) ( not ( = ?auto_36039 ?auto_36040 ) ) ( not ( = ?auto_36042 ?auto_36039 ) ) ( not ( = ?auto_36043 ?auto_36039 ) ) ( not ( = ?auto_36041 ?auto_36039 ) ) ( not ( = ?auto_36050 ?auto_36039 ) ) ( not ( = ?auto_36054 ?auto_36039 ) ) ( not ( = ?auto_36048 ?auto_36039 ) ) ( AVAILABLE ?auto_36047 ) ( IN ?auto_36040 ?auto_36044 ) ( TRUCK-AT ?auto_36044 ?auto_36046 ) ( not ( = ?auto_36046 ?auto_36045 ) ) ( not ( = ?auto_36053 ?auto_36046 ) ) ( not ( = ?auto_36049 ?auto_36046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36041 ?auto_36042 ?auto_36043 )
      ( MAKE-4CRATE-VERIFY ?auto_36039 ?auto_36040 ?auto_36041 ?auto_36042 ?auto_36043 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36055 - SURFACE
      ?auto_36056 - SURFACE
      ?auto_36057 - SURFACE
      ?auto_36058 - SURFACE
      ?auto_36059 - SURFACE
      ?auto_36060 - SURFACE
    )
    :vars
    (
      ?auto_36064 - HOIST
      ?auto_36062 - PLACE
      ?auto_36070 - PLACE
      ?auto_36069 - HOIST
      ?auto_36067 - SURFACE
      ?auto_36071 - SURFACE
      ?auto_36066 - PLACE
      ?auto_36068 - HOIST
      ?auto_36065 - SURFACE
      ?auto_36061 - TRUCK
      ?auto_36063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36064 ?auto_36062 ) ( IS-CRATE ?auto_36060 ) ( not ( = ?auto_36059 ?auto_36060 ) ) ( not ( = ?auto_36058 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36060 ) ) ( not ( = ?auto_36070 ?auto_36062 ) ) ( HOIST-AT ?auto_36069 ?auto_36070 ) ( not ( = ?auto_36064 ?auto_36069 ) ) ( SURFACE-AT ?auto_36060 ?auto_36070 ) ( ON ?auto_36060 ?auto_36067 ) ( CLEAR ?auto_36060 ) ( not ( = ?auto_36059 ?auto_36067 ) ) ( not ( = ?auto_36060 ?auto_36067 ) ) ( not ( = ?auto_36058 ?auto_36067 ) ) ( IS-CRATE ?auto_36059 ) ( AVAILABLE ?auto_36069 ) ( SURFACE-AT ?auto_36059 ?auto_36070 ) ( ON ?auto_36059 ?auto_36071 ) ( CLEAR ?auto_36059 ) ( not ( = ?auto_36059 ?auto_36071 ) ) ( not ( = ?auto_36060 ?auto_36071 ) ) ( not ( = ?auto_36058 ?auto_36071 ) ) ( not ( = ?auto_36067 ?auto_36071 ) ) ( IS-CRATE ?auto_36058 ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36059 ?auto_36057 ) ) ( not ( = ?auto_36060 ?auto_36057 ) ) ( not ( = ?auto_36067 ?auto_36057 ) ) ( not ( = ?auto_36071 ?auto_36057 ) ) ( not ( = ?auto_36066 ?auto_36062 ) ) ( not ( = ?auto_36070 ?auto_36066 ) ) ( HOIST-AT ?auto_36068 ?auto_36066 ) ( not ( = ?auto_36064 ?auto_36068 ) ) ( not ( = ?auto_36069 ?auto_36068 ) ) ( AVAILABLE ?auto_36068 ) ( SURFACE-AT ?auto_36058 ?auto_36066 ) ( ON ?auto_36058 ?auto_36065 ) ( CLEAR ?auto_36058 ) ( not ( = ?auto_36059 ?auto_36065 ) ) ( not ( = ?auto_36060 ?auto_36065 ) ) ( not ( = ?auto_36058 ?auto_36065 ) ) ( not ( = ?auto_36067 ?auto_36065 ) ) ( not ( = ?auto_36071 ?auto_36065 ) ) ( not ( = ?auto_36057 ?auto_36065 ) ) ( SURFACE-AT ?auto_36056 ?auto_36062 ) ( CLEAR ?auto_36056 ) ( IS-CRATE ?auto_36057 ) ( not ( = ?auto_36056 ?auto_36057 ) ) ( not ( = ?auto_36059 ?auto_36056 ) ) ( not ( = ?auto_36060 ?auto_36056 ) ) ( not ( = ?auto_36058 ?auto_36056 ) ) ( not ( = ?auto_36067 ?auto_36056 ) ) ( not ( = ?auto_36071 ?auto_36056 ) ) ( not ( = ?auto_36065 ?auto_36056 ) ) ( AVAILABLE ?auto_36064 ) ( IN ?auto_36057 ?auto_36061 ) ( TRUCK-AT ?auto_36061 ?auto_36063 ) ( not ( = ?auto_36063 ?auto_36062 ) ) ( not ( = ?auto_36070 ?auto_36063 ) ) ( not ( = ?auto_36066 ?auto_36063 ) ) ( ON ?auto_36056 ?auto_36055 ) ( not ( = ?auto_36055 ?auto_36056 ) ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36055 ?auto_36059 ) ) ( not ( = ?auto_36055 ?auto_36060 ) ) ( not ( = ?auto_36055 ?auto_36067 ) ) ( not ( = ?auto_36055 ?auto_36071 ) ) ( not ( = ?auto_36055 ?auto_36065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36058 ?auto_36059 ?auto_36060 )
      ( MAKE-5CRATE-VERIFY ?auto_36055 ?auto_36056 ?auto_36057 ?auto_36058 ?auto_36059 ?auto_36060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36072 - SURFACE
      ?auto_36073 - SURFACE
    )
    :vars
    (
      ?auto_36077 - HOIST
      ?auto_36075 - PLACE
      ?auto_36081 - SURFACE
      ?auto_36086 - PLACE
      ?auto_36085 - HOIST
      ?auto_36083 - SURFACE
      ?auto_36087 - SURFACE
      ?auto_36080 - SURFACE
      ?auto_36082 - PLACE
      ?auto_36084 - HOIST
      ?auto_36078 - SURFACE
      ?auto_36079 - SURFACE
      ?auto_36074 - TRUCK
      ?auto_36076 - PLACE
      ?auto_36088 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36077 ?auto_36075 ) ( IS-CRATE ?auto_36073 ) ( not ( = ?auto_36072 ?auto_36073 ) ) ( not ( = ?auto_36081 ?auto_36072 ) ) ( not ( = ?auto_36081 ?auto_36073 ) ) ( not ( = ?auto_36086 ?auto_36075 ) ) ( HOIST-AT ?auto_36085 ?auto_36086 ) ( not ( = ?auto_36077 ?auto_36085 ) ) ( SURFACE-AT ?auto_36073 ?auto_36086 ) ( ON ?auto_36073 ?auto_36083 ) ( CLEAR ?auto_36073 ) ( not ( = ?auto_36072 ?auto_36083 ) ) ( not ( = ?auto_36073 ?auto_36083 ) ) ( not ( = ?auto_36081 ?auto_36083 ) ) ( IS-CRATE ?auto_36072 ) ( AVAILABLE ?auto_36085 ) ( SURFACE-AT ?auto_36072 ?auto_36086 ) ( ON ?auto_36072 ?auto_36087 ) ( CLEAR ?auto_36072 ) ( not ( = ?auto_36072 ?auto_36087 ) ) ( not ( = ?auto_36073 ?auto_36087 ) ) ( not ( = ?auto_36081 ?auto_36087 ) ) ( not ( = ?auto_36083 ?auto_36087 ) ) ( IS-CRATE ?auto_36081 ) ( not ( = ?auto_36080 ?auto_36081 ) ) ( not ( = ?auto_36072 ?auto_36080 ) ) ( not ( = ?auto_36073 ?auto_36080 ) ) ( not ( = ?auto_36083 ?auto_36080 ) ) ( not ( = ?auto_36087 ?auto_36080 ) ) ( not ( = ?auto_36082 ?auto_36075 ) ) ( not ( = ?auto_36086 ?auto_36082 ) ) ( HOIST-AT ?auto_36084 ?auto_36082 ) ( not ( = ?auto_36077 ?auto_36084 ) ) ( not ( = ?auto_36085 ?auto_36084 ) ) ( AVAILABLE ?auto_36084 ) ( SURFACE-AT ?auto_36081 ?auto_36082 ) ( ON ?auto_36081 ?auto_36078 ) ( CLEAR ?auto_36081 ) ( not ( = ?auto_36072 ?auto_36078 ) ) ( not ( = ?auto_36073 ?auto_36078 ) ) ( not ( = ?auto_36081 ?auto_36078 ) ) ( not ( = ?auto_36083 ?auto_36078 ) ) ( not ( = ?auto_36087 ?auto_36078 ) ) ( not ( = ?auto_36080 ?auto_36078 ) ) ( SURFACE-AT ?auto_36079 ?auto_36075 ) ( CLEAR ?auto_36079 ) ( IS-CRATE ?auto_36080 ) ( not ( = ?auto_36079 ?auto_36080 ) ) ( not ( = ?auto_36072 ?auto_36079 ) ) ( not ( = ?auto_36073 ?auto_36079 ) ) ( not ( = ?auto_36081 ?auto_36079 ) ) ( not ( = ?auto_36083 ?auto_36079 ) ) ( not ( = ?auto_36087 ?auto_36079 ) ) ( not ( = ?auto_36078 ?auto_36079 ) ) ( AVAILABLE ?auto_36077 ) ( TRUCK-AT ?auto_36074 ?auto_36076 ) ( not ( = ?auto_36076 ?auto_36075 ) ) ( not ( = ?auto_36086 ?auto_36076 ) ) ( not ( = ?auto_36082 ?auto_36076 ) ) ( HOIST-AT ?auto_36088 ?auto_36076 ) ( LIFTING ?auto_36088 ?auto_36080 ) ( not ( = ?auto_36077 ?auto_36088 ) ) ( not ( = ?auto_36085 ?auto_36088 ) ) ( not ( = ?auto_36084 ?auto_36088 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36088 ?auto_36080 ?auto_36074 ?auto_36076 )
      ( MAKE-2CRATE ?auto_36081 ?auto_36072 ?auto_36073 )
      ( MAKE-1CRATE-VERIFY ?auto_36072 ?auto_36073 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36089 - SURFACE
      ?auto_36090 - SURFACE
      ?auto_36091 - SURFACE
    )
    :vars
    (
      ?auto_36094 - HOIST
      ?auto_36104 - PLACE
      ?auto_36095 - PLACE
      ?auto_36099 - HOIST
      ?auto_36096 - SURFACE
      ?auto_36105 - SURFACE
      ?auto_36092 - SURFACE
      ?auto_36103 - PLACE
      ?auto_36101 - HOIST
      ?auto_36097 - SURFACE
      ?auto_36102 - SURFACE
      ?auto_36093 - TRUCK
      ?auto_36100 - PLACE
      ?auto_36098 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36094 ?auto_36104 ) ( IS-CRATE ?auto_36091 ) ( not ( = ?auto_36090 ?auto_36091 ) ) ( not ( = ?auto_36089 ?auto_36090 ) ) ( not ( = ?auto_36089 ?auto_36091 ) ) ( not ( = ?auto_36095 ?auto_36104 ) ) ( HOIST-AT ?auto_36099 ?auto_36095 ) ( not ( = ?auto_36094 ?auto_36099 ) ) ( SURFACE-AT ?auto_36091 ?auto_36095 ) ( ON ?auto_36091 ?auto_36096 ) ( CLEAR ?auto_36091 ) ( not ( = ?auto_36090 ?auto_36096 ) ) ( not ( = ?auto_36091 ?auto_36096 ) ) ( not ( = ?auto_36089 ?auto_36096 ) ) ( IS-CRATE ?auto_36090 ) ( AVAILABLE ?auto_36099 ) ( SURFACE-AT ?auto_36090 ?auto_36095 ) ( ON ?auto_36090 ?auto_36105 ) ( CLEAR ?auto_36090 ) ( not ( = ?auto_36090 ?auto_36105 ) ) ( not ( = ?auto_36091 ?auto_36105 ) ) ( not ( = ?auto_36089 ?auto_36105 ) ) ( not ( = ?auto_36096 ?auto_36105 ) ) ( IS-CRATE ?auto_36089 ) ( not ( = ?auto_36092 ?auto_36089 ) ) ( not ( = ?auto_36090 ?auto_36092 ) ) ( not ( = ?auto_36091 ?auto_36092 ) ) ( not ( = ?auto_36096 ?auto_36092 ) ) ( not ( = ?auto_36105 ?auto_36092 ) ) ( not ( = ?auto_36103 ?auto_36104 ) ) ( not ( = ?auto_36095 ?auto_36103 ) ) ( HOIST-AT ?auto_36101 ?auto_36103 ) ( not ( = ?auto_36094 ?auto_36101 ) ) ( not ( = ?auto_36099 ?auto_36101 ) ) ( AVAILABLE ?auto_36101 ) ( SURFACE-AT ?auto_36089 ?auto_36103 ) ( ON ?auto_36089 ?auto_36097 ) ( CLEAR ?auto_36089 ) ( not ( = ?auto_36090 ?auto_36097 ) ) ( not ( = ?auto_36091 ?auto_36097 ) ) ( not ( = ?auto_36089 ?auto_36097 ) ) ( not ( = ?auto_36096 ?auto_36097 ) ) ( not ( = ?auto_36105 ?auto_36097 ) ) ( not ( = ?auto_36092 ?auto_36097 ) ) ( SURFACE-AT ?auto_36102 ?auto_36104 ) ( CLEAR ?auto_36102 ) ( IS-CRATE ?auto_36092 ) ( not ( = ?auto_36102 ?auto_36092 ) ) ( not ( = ?auto_36090 ?auto_36102 ) ) ( not ( = ?auto_36091 ?auto_36102 ) ) ( not ( = ?auto_36089 ?auto_36102 ) ) ( not ( = ?auto_36096 ?auto_36102 ) ) ( not ( = ?auto_36105 ?auto_36102 ) ) ( not ( = ?auto_36097 ?auto_36102 ) ) ( AVAILABLE ?auto_36094 ) ( TRUCK-AT ?auto_36093 ?auto_36100 ) ( not ( = ?auto_36100 ?auto_36104 ) ) ( not ( = ?auto_36095 ?auto_36100 ) ) ( not ( = ?auto_36103 ?auto_36100 ) ) ( HOIST-AT ?auto_36098 ?auto_36100 ) ( LIFTING ?auto_36098 ?auto_36092 ) ( not ( = ?auto_36094 ?auto_36098 ) ) ( not ( = ?auto_36099 ?auto_36098 ) ) ( not ( = ?auto_36101 ?auto_36098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36090 ?auto_36091 )
      ( MAKE-2CRATE-VERIFY ?auto_36089 ?auto_36090 ?auto_36091 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36106 - SURFACE
      ?auto_36107 - SURFACE
      ?auto_36108 - SURFACE
      ?auto_36109 - SURFACE
    )
    :vars
    (
      ?auto_36117 - HOIST
      ?auto_36111 - PLACE
      ?auto_36116 - PLACE
      ?auto_36112 - HOIST
      ?auto_36122 - SURFACE
      ?auto_36118 - SURFACE
      ?auto_36110 - PLACE
      ?auto_36121 - HOIST
      ?auto_36115 - SURFACE
      ?auto_36114 - SURFACE
      ?auto_36113 - TRUCK
      ?auto_36120 - PLACE
      ?auto_36119 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36117 ?auto_36111 ) ( IS-CRATE ?auto_36109 ) ( not ( = ?auto_36108 ?auto_36109 ) ) ( not ( = ?auto_36107 ?auto_36108 ) ) ( not ( = ?auto_36107 ?auto_36109 ) ) ( not ( = ?auto_36116 ?auto_36111 ) ) ( HOIST-AT ?auto_36112 ?auto_36116 ) ( not ( = ?auto_36117 ?auto_36112 ) ) ( SURFACE-AT ?auto_36109 ?auto_36116 ) ( ON ?auto_36109 ?auto_36122 ) ( CLEAR ?auto_36109 ) ( not ( = ?auto_36108 ?auto_36122 ) ) ( not ( = ?auto_36109 ?auto_36122 ) ) ( not ( = ?auto_36107 ?auto_36122 ) ) ( IS-CRATE ?auto_36108 ) ( AVAILABLE ?auto_36112 ) ( SURFACE-AT ?auto_36108 ?auto_36116 ) ( ON ?auto_36108 ?auto_36118 ) ( CLEAR ?auto_36108 ) ( not ( = ?auto_36108 ?auto_36118 ) ) ( not ( = ?auto_36109 ?auto_36118 ) ) ( not ( = ?auto_36107 ?auto_36118 ) ) ( not ( = ?auto_36122 ?auto_36118 ) ) ( IS-CRATE ?auto_36107 ) ( not ( = ?auto_36106 ?auto_36107 ) ) ( not ( = ?auto_36108 ?auto_36106 ) ) ( not ( = ?auto_36109 ?auto_36106 ) ) ( not ( = ?auto_36122 ?auto_36106 ) ) ( not ( = ?auto_36118 ?auto_36106 ) ) ( not ( = ?auto_36110 ?auto_36111 ) ) ( not ( = ?auto_36116 ?auto_36110 ) ) ( HOIST-AT ?auto_36121 ?auto_36110 ) ( not ( = ?auto_36117 ?auto_36121 ) ) ( not ( = ?auto_36112 ?auto_36121 ) ) ( AVAILABLE ?auto_36121 ) ( SURFACE-AT ?auto_36107 ?auto_36110 ) ( ON ?auto_36107 ?auto_36115 ) ( CLEAR ?auto_36107 ) ( not ( = ?auto_36108 ?auto_36115 ) ) ( not ( = ?auto_36109 ?auto_36115 ) ) ( not ( = ?auto_36107 ?auto_36115 ) ) ( not ( = ?auto_36122 ?auto_36115 ) ) ( not ( = ?auto_36118 ?auto_36115 ) ) ( not ( = ?auto_36106 ?auto_36115 ) ) ( SURFACE-AT ?auto_36114 ?auto_36111 ) ( CLEAR ?auto_36114 ) ( IS-CRATE ?auto_36106 ) ( not ( = ?auto_36114 ?auto_36106 ) ) ( not ( = ?auto_36108 ?auto_36114 ) ) ( not ( = ?auto_36109 ?auto_36114 ) ) ( not ( = ?auto_36107 ?auto_36114 ) ) ( not ( = ?auto_36122 ?auto_36114 ) ) ( not ( = ?auto_36118 ?auto_36114 ) ) ( not ( = ?auto_36115 ?auto_36114 ) ) ( AVAILABLE ?auto_36117 ) ( TRUCK-AT ?auto_36113 ?auto_36120 ) ( not ( = ?auto_36120 ?auto_36111 ) ) ( not ( = ?auto_36116 ?auto_36120 ) ) ( not ( = ?auto_36110 ?auto_36120 ) ) ( HOIST-AT ?auto_36119 ?auto_36120 ) ( LIFTING ?auto_36119 ?auto_36106 ) ( not ( = ?auto_36117 ?auto_36119 ) ) ( not ( = ?auto_36112 ?auto_36119 ) ) ( not ( = ?auto_36121 ?auto_36119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36107 ?auto_36108 ?auto_36109 )
      ( MAKE-3CRATE-VERIFY ?auto_36106 ?auto_36107 ?auto_36108 ?auto_36109 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36123 - SURFACE
      ?auto_36124 - SURFACE
      ?auto_36125 - SURFACE
      ?auto_36126 - SURFACE
      ?auto_36127 - SURFACE
    )
    :vars
    (
      ?auto_36134 - HOIST
      ?auto_36129 - PLACE
      ?auto_36133 - PLACE
      ?auto_36130 - HOIST
      ?auto_36139 - SURFACE
      ?auto_36135 - SURFACE
      ?auto_36128 - PLACE
      ?auto_36138 - HOIST
      ?auto_36132 - SURFACE
      ?auto_36131 - TRUCK
      ?auto_36137 - PLACE
      ?auto_36136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36134 ?auto_36129 ) ( IS-CRATE ?auto_36127 ) ( not ( = ?auto_36126 ?auto_36127 ) ) ( not ( = ?auto_36125 ?auto_36126 ) ) ( not ( = ?auto_36125 ?auto_36127 ) ) ( not ( = ?auto_36133 ?auto_36129 ) ) ( HOIST-AT ?auto_36130 ?auto_36133 ) ( not ( = ?auto_36134 ?auto_36130 ) ) ( SURFACE-AT ?auto_36127 ?auto_36133 ) ( ON ?auto_36127 ?auto_36139 ) ( CLEAR ?auto_36127 ) ( not ( = ?auto_36126 ?auto_36139 ) ) ( not ( = ?auto_36127 ?auto_36139 ) ) ( not ( = ?auto_36125 ?auto_36139 ) ) ( IS-CRATE ?auto_36126 ) ( AVAILABLE ?auto_36130 ) ( SURFACE-AT ?auto_36126 ?auto_36133 ) ( ON ?auto_36126 ?auto_36135 ) ( CLEAR ?auto_36126 ) ( not ( = ?auto_36126 ?auto_36135 ) ) ( not ( = ?auto_36127 ?auto_36135 ) ) ( not ( = ?auto_36125 ?auto_36135 ) ) ( not ( = ?auto_36139 ?auto_36135 ) ) ( IS-CRATE ?auto_36125 ) ( not ( = ?auto_36124 ?auto_36125 ) ) ( not ( = ?auto_36126 ?auto_36124 ) ) ( not ( = ?auto_36127 ?auto_36124 ) ) ( not ( = ?auto_36139 ?auto_36124 ) ) ( not ( = ?auto_36135 ?auto_36124 ) ) ( not ( = ?auto_36128 ?auto_36129 ) ) ( not ( = ?auto_36133 ?auto_36128 ) ) ( HOIST-AT ?auto_36138 ?auto_36128 ) ( not ( = ?auto_36134 ?auto_36138 ) ) ( not ( = ?auto_36130 ?auto_36138 ) ) ( AVAILABLE ?auto_36138 ) ( SURFACE-AT ?auto_36125 ?auto_36128 ) ( ON ?auto_36125 ?auto_36132 ) ( CLEAR ?auto_36125 ) ( not ( = ?auto_36126 ?auto_36132 ) ) ( not ( = ?auto_36127 ?auto_36132 ) ) ( not ( = ?auto_36125 ?auto_36132 ) ) ( not ( = ?auto_36139 ?auto_36132 ) ) ( not ( = ?auto_36135 ?auto_36132 ) ) ( not ( = ?auto_36124 ?auto_36132 ) ) ( SURFACE-AT ?auto_36123 ?auto_36129 ) ( CLEAR ?auto_36123 ) ( IS-CRATE ?auto_36124 ) ( not ( = ?auto_36123 ?auto_36124 ) ) ( not ( = ?auto_36126 ?auto_36123 ) ) ( not ( = ?auto_36127 ?auto_36123 ) ) ( not ( = ?auto_36125 ?auto_36123 ) ) ( not ( = ?auto_36139 ?auto_36123 ) ) ( not ( = ?auto_36135 ?auto_36123 ) ) ( not ( = ?auto_36132 ?auto_36123 ) ) ( AVAILABLE ?auto_36134 ) ( TRUCK-AT ?auto_36131 ?auto_36137 ) ( not ( = ?auto_36137 ?auto_36129 ) ) ( not ( = ?auto_36133 ?auto_36137 ) ) ( not ( = ?auto_36128 ?auto_36137 ) ) ( HOIST-AT ?auto_36136 ?auto_36137 ) ( LIFTING ?auto_36136 ?auto_36124 ) ( not ( = ?auto_36134 ?auto_36136 ) ) ( not ( = ?auto_36130 ?auto_36136 ) ) ( not ( = ?auto_36138 ?auto_36136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36125 ?auto_36126 ?auto_36127 )
      ( MAKE-4CRATE-VERIFY ?auto_36123 ?auto_36124 ?auto_36125 ?auto_36126 ?auto_36127 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36140 - SURFACE
      ?auto_36141 - SURFACE
      ?auto_36142 - SURFACE
      ?auto_36143 - SURFACE
      ?auto_36144 - SURFACE
      ?auto_36145 - SURFACE
    )
    :vars
    (
      ?auto_36152 - HOIST
      ?auto_36147 - PLACE
      ?auto_36151 - PLACE
      ?auto_36148 - HOIST
      ?auto_36157 - SURFACE
      ?auto_36153 - SURFACE
      ?auto_36146 - PLACE
      ?auto_36156 - HOIST
      ?auto_36150 - SURFACE
      ?auto_36149 - TRUCK
      ?auto_36155 - PLACE
      ?auto_36154 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36152 ?auto_36147 ) ( IS-CRATE ?auto_36145 ) ( not ( = ?auto_36144 ?auto_36145 ) ) ( not ( = ?auto_36143 ?auto_36144 ) ) ( not ( = ?auto_36143 ?auto_36145 ) ) ( not ( = ?auto_36151 ?auto_36147 ) ) ( HOIST-AT ?auto_36148 ?auto_36151 ) ( not ( = ?auto_36152 ?auto_36148 ) ) ( SURFACE-AT ?auto_36145 ?auto_36151 ) ( ON ?auto_36145 ?auto_36157 ) ( CLEAR ?auto_36145 ) ( not ( = ?auto_36144 ?auto_36157 ) ) ( not ( = ?auto_36145 ?auto_36157 ) ) ( not ( = ?auto_36143 ?auto_36157 ) ) ( IS-CRATE ?auto_36144 ) ( AVAILABLE ?auto_36148 ) ( SURFACE-AT ?auto_36144 ?auto_36151 ) ( ON ?auto_36144 ?auto_36153 ) ( CLEAR ?auto_36144 ) ( not ( = ?auto_36144 ?auto_36153 ) ) ( not ( = ?auto_36145 ?auto_36153 ) ) ( not ( = ?auto_36143 ?auto_36153 ) ) ( not ( = ?auto_36157 ?auto_36153 ) ) ( IS-CRATE ?auto_36143 ) ( not ( = ?auto_36142 ?auto_36143 ) ) ( not ( = ?auto_36144 ?auto_36142 ) ) ( not ( = ?auto_36145 ?auto_36142 ) ) ( not ( = ?auto_36157 ?auto_36142 ) ) ( not ( = ?auto_36153 ?auto_36142 ) ) ( not ( = ?auto_36146 ?auto_36147 ) ) ( not ( = ?auto_36151 ?auto_36146 ) ) ( HOIST-AT ?auto_36156 ?auto_36146 ) ( not ( = ?auto_36152 ?auto_36156 ) ) ( not ( = ?auto_36148 ?auto_36156 ) ) ( AVAILABLE ?auto_36156 ) ( SURFACE-AT ?auto_36143 ?auto_36146 ) ( ON ?auto_36143 ?auto_36150 ) ( CLEAR ?auto_36143 ) ( not ( = ?auto_36144 ?auto_36150 ) ) ( not ( = ?auto_36145 ?auto_36150 ) ) ( not ( = ?auto_36143 ?auto_36150 ) ) ( not ( = ?auto_36157 ?auto_36150 ) ) ( not ( = ?auto_36153 ?auto_36150 ) ) ( not ( = ?auto_36142 ?auto_36150 ) ) ( SURFACE-AT ?auto_36141 ?auto_36147 ) ( CLEAR ?auto_36141 ) ( IS-CRATE ?auto_36142 ) ( not ( = ?auto_36141 ?auto_36142 ) ) ( not ( = ?auto_36144 ?auto_36141 ) ) ( not ( = ?auto_36145 ?auto_36141 ) ) ( not ( = ?auto_36143 ?auto_36141 ) ) ( not ( = ?auto_36157 ?auto_36141 ) ) ( not ( = ?auto_36153 ?auto_36141 ) ) ( not ( = ?auto_36150 ?auto_36141 ) ) ( AVAILABLE ?auto_36152 ) ( TRUCK-AT ?auto_36149 ?auto_36155 ) ( not ( = ?auto_36155 ?auto_36147 ) ) ( not ( = ?auto_36151 ?auto_36155 ) ) ( not ( = ?auto_36146 ?auto_36155 ) ) ( HOIST-AT ?auto_36154 ?auto_36155 ) ( LIFTING ?auto_36154 ?auto_36142 ) ( not ( = ?auto_36152 ?auto_36154 ) ) ( not ( = ?auto_36148 ?auto_36154 ) ) ( not ( = ?auto_36156 ?auto_36154 ) ) ( ON ?auto_36141 ?auto_36140 ) ( not ( = ?auto_36140 ?auto_36141 ) ) ( not ( = ?auto_36140 ?auto_36142 ) ) ( not ( = ?auto_36140 ?auto_36143 ) ) ( not ( = ?auto_36140 ?auto_36144 ) ) ( not ( = ?auto_36140 ?auto_36145 ) ) ( not ( = ?auto_36140 ?auto_36157 ) ) ( not ( = ?auto_36140 ?auto_36153 ) ) ( not ( = ?auto_36140 ?auto_36150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36143 ?auto_36144 ?auto_36145 )
      ( MAKE-5CRATE-VERIFY ?auto_36140 ?auto_36141 ?auto_36142 ?auto_36143 ?auto_36144 ?auto_36145 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36158 - SURFACE
      ?auto_36159 - SURFACE
    )
    :vars
    (
      ?auto_36168 - HOIST
      ?auto_36161 - PLACE
      ?auto_36170 - SURFACE
      ?auto_36167 - PLACE
      ?auto_36162 - HOIST
      ?auto_36174 - SURFACE
      ?auto_36169 - SURFACE
      ?auto_36164 - SURFACE
      ?auto_36160 - PLACE
      ?auto_36173 - HOIST
      ?auto_36166 - SURFACE
      ?auto_36165 - SURFACE
      ?auto_36163 - TRUCK
      ?auto_36172 - PLACE
      ?auto_36171 - HOIST
      ?auto_36175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36168 ?auto_36161 ) ( IS-CRATE ?auto_36159 ) ( not ( = ?auto_36158 ?auto_36159 ) ) ( not ( = ?auto_36170 ?auto_36158 ) ) ( not ( = ?auto_36170 ?auto_36159 ) ) ( not ( = ?auto_36167 ?auto_36161 ) ) ( HOIST-AT ?auto_36162 ?auto_36167 ) ( not ( = ?auto_36168 ?auto_36162 ) ) ( SURFACE-AT ?auto_36159 ?auto_36167 ) ( ON ?auto_36159 ?auto_36174 ) ( CLEAR ?auto_36159 ) ( not ( = ?auto_36158 ?auto_36174 ) ) ( not ( = ?auto_36159 ?auto_36174 ) ) ( not ( = ?auto_36170 ?auto_36174 ) ) ( IS-CRATE ?auto_36158 ) ( AVAILABLE ?auto_36162 ) ( SURFACE-AT ?auto_36158 ?auto_36167 ) ( ON ?auto_36158 ?auto_36169 ) ( CLEAR ?auto_36158 ) ( not ( = ?auto_36158 ?auto_36169 ) ) ( not ( = ?auto_36159 ?auto_36169 ) ) ( not ( = ?auto_36170 ?auto_36169 ) ) ( not ( = ?auto_36174 ?auto_36169 ) ) ( IS-CRATE ?auto_36170 ) ( not ( = ?auto_36164 ?auto_36170 ) ) ( not ( = ?auto_36158 ?auto_36164 ) ) ( not ( = ?auto_36159 ?auto_36164 ) ) ( not ( = ?auto_36174 ?auto_36164 ) ) ( not ( = ?auto_36169 ?auto_36164 ) ) ( not ( = ?auto_36160 ?auto_36161 ) ) ( not ( = ?auto_36167 ?auto_36160 ) ) ( HOIST-AT ?auto_36173 ?auto_36160 ) ( not ( = ?auto_36168 ?auto_36173 ) ) ( not ( = ?auto_36162 ?auto_36173 ) ) ( AVAILABLE ?auto_36173 ) ( SURFACE-AT ?auto_36170 ?auto_36160 ) ( ON ?auto_36170 ?auto_36166 ) ( CLEAR ?auto_36170 ) ( not ( = ?auto_36158 ?auto_36166 ) ) ( not ( = ?auto_36159 ?auto_36166 ) ) ( not ( = ?auto_36170 ?auto_36166 ) ) ( not ( = ?auto_36174 ?auto_36166 ) ) ( not ( = ?auto_36169 ?auto_36166 ) ) ( not ( = ?auto_36164 ?auto_36166 ) ) ( SURFACE-AT ?auto_36165 ?auto_36161 ) ( CLEAR ?auto_36165 ) ( IS-CRATE ?auto_36164 ) ( not ( = ?auto_36165 ?auto_36164 ) ) ( not ( = ?auto_36158 ?auto_36165 ) ) ( not ( = ?auto_36159 ?auto_36165 ) ) ( not ( = ?auto_36170 ?auto_36165 ) ) ( not ( = ?auto_36174 ?auto_36165 ) ) ( not ( = ?auto_36169 ?auto_36165 ) ) ( not ( = ?auto_36166 ?auto_36165 ) ) ( AVAILABLE ?auto_36168 ) ( TRUCK-AT ?auto_36163 ?auto_36172 ) ( not ( = ?auto_36172 ?auto_36161 ) ) ( not ( = ?auto_36167 ?auto_36172 ) ) ( not ( = ?auto_36160 ?auto_36172 ) ) ( HOIST-AT ?auto_36171 ?auto_36172 ) ( not ( = ?auto_36168 ?auto_36171 ) ) ( not ( = ?auto_36162 ?auto_36171 ) ) ( not ( = ?auto_36173 ?auto_36171 ) ) ( AVAILABLE ?auto_36171 ) ( SURFACE-AT ?auto_36164 ?auto_36172 ) ( ON ?auto_36164 ?auto_36175 ) ( CLEAR ?auto_36164 ) ( not ( = ?auto_36158 ?auto_36175 ) ) ( not ( = ?auto_36159 ?auto_36175 ) ) ( not ( = ?auto_36170 ?auto_36175 ) ) ( not ( = ?auto_36174 ?auto_36175 ) ) ( not ( = ?auto_36169 ?auto_36175 ) ) ( not ( = ?auto_36164 ?auto_36175 ) ) ( not ( = ?auto_36166 ?auto_36175 ) ) ( not ( = ?auto_36165 ?auto_36175 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36171 ?auto_36164 ?auto_36175 ?auto_36172 )
      ( MAKE-2CRATE ?auto_36170 ?auto_36158 ?auto_36159 )
      ( MAKE-1CRATE-VERIFY ?auto_36158 ?auto_36159 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36176 - SURFACE
      ?auto_36177 - SURFACE
      ?auto_36178 - SURFACE
    )
    :vars
    (
      ?auto_36180 - HOIST
      ?auto_36182 - PLACE
      ?auto_36186 - PLACE
      ?auto_36187 - HOIST
      ?auto_36189 - SURFACE
      ?auto_36190 - SURFACE
      ?auto_36185 - SURFACE
      ?auto_36193 - PLACE
      ?auto_36184 - HOIST
      ?auto_36192 - SURFACE
      ?auto_36179 - SURFACE
      ?auto_36188 - TRUCK
      ?auto_36191 - PLACE
      ?auto_36183 - HOIST
      ?auto_36181 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36180 ?auto_36182 ) ( IS-CRATE ?auto_36178 ) ( not ( = ?auto_36177 ?auto_36178 ) ) ( not ( = ?auto_36176 ?auto_36177 ) ) ( not ( = ?auto_36176 ?auto_36178 ) ) ( not ( = ?auto_36186 ?auto_36182 ) ) ( HOIST-AT ?auto_36187 ?auto_36186 ) ( not ( = ?auto_36180 ?auto_36187 ) ) ( SURFACE-AT ?auto_36178 ?auto_36186 ) ( ON ?auto_36178 ?auto_36189 ) ( CLEAR ?auto_36178 ) ( not ( = ?auto_36177 ?auto_36189 ) ) ( not ( = ?auto_36178 ?auto_36189 ) ) ( not ( = ?auto_36176 ?auto_36189 ) ) ( IS-CRATE ?auto_36177 ) ( AVAILABLE ?auto_36187 ) ( SURFACE-AT ?auto_36177 ?auto_36186 ) ( ON ?auto_36177 ?auto_36190 ) ( CLEAR ?auto_36177 ) ( not ( = ?auto_36177 ?auto_36190 ) ) ( not ( = ?auto_36178 ?auto_36190 ) ) ( not ( = ?auto_36176 ?auto_36190 ) ) ( not ( = ?auto_36189 ?auto_36190 ) ) ( IS-CRATE ?auto_36176 ) ( not ( = ?auto_36185 ?auto_36176 ) ) ( not ( = ?auto_36177 ?auto_36185 ) ) ( not ( = ?auto_36178 ?auto_36185 ) ) ( not ( = ?auto_36189 ?auto_36185 ) ) ( not ( = ?auto_36190 ?auto_36185 ) ) ( not ( = ?auto_36193 ?auto_36182 ) ) ( not ( = ?auto_36186 ?auto_36193 ) ) ( HOIST-AT ?auto_36184 ?auto_36193 ) ( not ( = ?auto_36180 ?auto_36184 ) ) ( not ( = ?auto_36187 ?auto_36184 ) ) ( AVAILABLE ?auto_36184 ) ( SURFACE-AT ?auto_36176 ?auto_36193 ) ( ON ?auto_36176 ?auto_36192 ) ( CLEAR ?auto_36176 ) ( not ( = ?auto_36177 ?auto_36192 ) ) ( not ( = ?auto_36178 ?auto_36192 ) ) ( not ( = ?auto_36176 ?auto_36192 ) ) ( not ( = ?auto_36189 ?auto_36192 ) ) ( not ( = ?auto_36190 ?auto_36192 ) ) ( not ( = ?auto_36185 ?auto_36192 ) ) ( SURFACE-AT ?auto_36179 ?auto_36182 ) ( CLEAR ?auto_36179 ) ( IS-CRATE ?auto_36185 ) ( not ( = ?auto_36179 ?auto_36185 ) ) ( not ( = ?auto_36177 ?auto_36179 ) ) ( not ( = ?auto_36178 ?auto_36179 ) ) ( not ( = ?auto_36176 ?auto_36179 ) ) ( not ( = ?auto_36189 ?auto_36179 ) ) ( not ( = ?auto_36190 ?auto_36179 ) ) ( not ( = ?auto_36192 ?auto_36179 ) ) ( AVAILABLE ?auto_36180 ) ( TRUCK-AT ?auto_36188 ?auto_36191 ) ( not ( = ?auto_36191 ?auto_36182 ) ) ( not ( = ?auto_36186 ?auto_36191 ) ) ( not ( = ?auto_36193 ?auto_36191 ) ) ( HOIST-AT ?auto_36183 ?auto_36191 ) ( not ( = ?auto_36180 ?auto_36183 ) ) ( not ( = ?auto_36187 ?auto_36183 ) ) ( not ( = ?auto_36184 ?auto_36183 ) ) ( AVAILABLE ?auto_36183 ) ( SURFACE-AT ?auto_36185 ?auto_36191 ) ( ON ?auto_36185 ?auto_36181 ) ( CLEAR ?auto_36185 ) ( not ( = ?auto_36177 ?auto_36181 ) ) ( not ( = ?auto_36178 ?auto_36181 ) ) ( not ( = ?auto_36176 ?auto_36181 ) ) ( not ( = ?auto_36189 ?auto_36181 ) ) ( not ( = ?auto_36190 ?auto_36181 ) ) ( not ( = ?auto_36185 ?auto_36181 ) ) ( not ( = ?auto_36192 ?auto_36181 ) ) ( not ( = ?auto_36179 ?auto_36181 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36177 ?auto_36178 )
      ( MAKE-2CRATE-VERIFY ?auto_36176 ?auto_36177 ?auto_36178 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36194 - SURFACE
      ?auto_36195 - SURFACE
      ?auto_36196 - SURFACE
      ?auto_36197 - SURFACE
    )
    :vars
    (
      ?auto_36205 - HOIST
      ?auto_36200 - PLACE
      ?auto_36199 - PLACE
      ?auto_36207 - HOIST
      ?auto_36203 - SURFACE
      ?auto_36211 - SURFACE
      ?auto_36208 - PLACE
      ?auto_36209 - HOIST
      ?auto_36204 - SURFACE
      ?auto_36201 - SURFACE
      ?auto_36206 - TRUCK
      ?auto_36202 - PLACE
      ?auto_36198 - HOIST
      ?auto_36210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36205 ?auto_36200 ) ( IS-CRATE ?auto_36197 ) ( not ( = ?auto_36196 ?auto_36197 ) ) ( not ( = ?auto_36195 ?auto_36196 ) ) ( not ( = ?auto_36195 ?auto_36197 ) ) ( not ( = ?auto_36199 ?auto_36200 ) ) ( HOIST-AT ?auto_36207 ?auto_36199 ) ( not ( = ?auto_36205 ?auto_36207 ) ) ( SURFACE-AT ?auto_36197 ?auto_36199 ) ( ON ?auto_36197 ?auto_36203 ) ( CLEAR ?auto_36197 ) ( not ( = ?auto_36196 ?auto_36203 ) ) ( not ( = ?auto_36197 ?auto_36203 ) ) ( not ( = ?auto_36195 ?auto_36203 ) ) ( IS-CRATE ?auto_36196 ) ( AVAILABLE ?auto_36207 ) ( SURFACE-AT ?auto_36196 ?auto_36199 ) ( ON ?auto_36196 ?auto_36211 ) ( CLEAR ?auto_36196 ) ( not ( = ?auto_36196 ?auto_36211 ) ) ( not ( = ?auto_36197 ?auto_36211 ) ) ( not ( = ?auto_36195 ?auto_36211 ) ) ( not ( = ?auto_36203 ?auto_36211 ) ) ( IS-CRATE ?auto_36195 ) ( not ( = ?auto_36194 ?auto_36195 ) ) ( not ( = ?auto_36196 ?auto_36194 ) ) ( not ( = ?auto_36197 ?auto_36194 ) ) ( not ( = ?auto_36203 ?auto_36194 ) ) ( not ( = ?auto_36211 ?auto_36194 ) ) ( not ( = ?auto_36208 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36208 ) ) ( HOIST-AT ?auto_36209 ?auto_36208 ) ( not ( = ?auto_36205 ?auto_36209 ) ) ( not ( = ?auto_36207 ?auto_36209 ) ) ( AVAILABLE ?auto_36209 ) ( SURFACE-AT ?auto_36195 ?auto_36208 ) ( ON ?auto_36195 ?auto_36204 ) ( CLEAR ?auto_36195 ) ( not ( = ?auto_36196 ?auto_36204 ) ) ( not ( = ?auto_36197 ?auto_36204 ) ) ( not ( = ?auto_36195 ?auto_36204 ) ) ( not ( = ?auto_36203 ?auto_36204 ) ) ( not ( = ?auto_36211 ?auto_36204 ) ) ( not ( = ?auto_36194 ?auto_36204 ) ) ( SURFACE-AT ?auto_36201 ?auto_36200 ) ( CLEAR ?auto_36201 ) ( IS-CRATE ?auto_36194 ) ( not ( = ?auto_36201 ?auto_36194 ) ) ( not ( = ?auto_36196 ?auto_36201 ) ) ( not ( = ?auto_36197 ?auto_36201 ) ) ( not ( = ?auto_36195 ?auto_36201 ) ) ( not ( = ?auto_36203 ?auto_36201 ) ) ( not ( = ?auto_36211 ?auto_36201 ) ) ( not ( = ?auto_36204 ?auto_36201 ) ) ( AVAILABLE ?auto_36205 ) ( TRUCK-AT ?auto_36206 ?auto_36202 ) ( not ( = ?auto_36202 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36202 ) ) ( not ( = ?auto_36208 ?auto_36202 ) ) ( HOIST-AT ?auto_36198 ?auto_36202 ) ( not ( = ?auto_36205 ?auto_36198 ) ) ( not ( = ?auto_36207 ?auto_36198 ) ) ( not ( = ?auto_36209 ?auto_36198 ) ) ( AVAILABLE ?auto_36198 ) ( SURFACE-AT ?auto_36194 ?auto_36202 ) ( ON ?auto_36194 ?auto_36210 ) ( CLEAR ?auto_36194 ) ( not ( = ?auto_36196 ?auto_36210 ) ) ( not ( = ?auto_36197 ?auto_36210 ) ) ( not ( = ?auto_36195 ?auto_36210 ) ) ( not ( = ?auto_36203 ?auto_36210 ) ) ( not ( = ?auto_36211 ?auto_36210 ) ) ( not ( = ?auto_36194 ?auto_36210 ) ) ( not ( = ?auto_36204 ?auto_36210 ) ) ( not ( = ?auto_36201 ?auto_36210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36195 ?auto_36196 ?auto_36197 )
      ( MAKE-3CRATE-VERIFY ?auto_36194 ?auto_36195 ?auto_36196 ?auto_36197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36212 - SURFACE
      ?auto_36213 - SURFACE
      ?auto_36214 - SURFACE
      ?auto_36215 - SURFACE
      ?auto_36216 - SURFACE
    )
    :vars
    (
      ?auto_36223 - HOIST
      ?auto_36219 - PLACE
      ?auto_36218 - PLACE
      ?auto_36225 - HOIST
      ?auto_36221 - SURFACE
      ?auto_36229 - SURFACE
      ?auto_36226 - PLACE
      ?auto_36227 - HOIST
      ?auto_36222 - SURFACE
      ?auto_36224 - TRUCK
      ?auto_36220 - PLACE
      ?auto_36217 - HOIST
      ?auto_36228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36223 ?auto_36219 ) ( IS-CRATE ?auto_36216 ) ( not ( = ?auto_36215 ?auto_36216 ) ) ( not ( = ?auto_36214 ?auto_36215 ) ) ( not ( = ?auto_36214 ?auto_36216 ) ) ( not ( = ?auto_36218 ?auto_36219 ) ) ( HOIST-AT ?auto_36225 ?auto_36218 ) ( not ( = ?auto_36223 ?auto_36225 ) ) ( SURFACE-AT ?auto_36216 ?auto_36218 ) ( ON ?auto_36216 ?auto_36221 ) ( CLEAR ?auto_36216 ) ( not ( = ?auto_36215 ?auto_36221 ) ) ( not ( = ?auto_36216 ?auto_36221 ) ) ( not ( = ?auto_36214 ?auto_36221 ) ) ( IS-CRATE ?auto_36215 ) ( AVAILABLE ?auto_36225 ) ( SURFACE-AT ?auto_36215 ?auto_36218 ) ( ON ?auto_36215 ?auto_36229 ) ( CLEAR ?auto_36215 ) ( not ( = ?auto_36215 ?auto_36229 ) ) ( not ( = ?auto_36216 ?auto_36229 ) ) ( not ( = ?auto_36214 ?auto_36229 ) ) ( not ( = ?auto_36221 ?auto_36229 ) ) ( IS-CRATE ?auto_36214 ) ( not ( = ?auto_36213 ?auto_36214 ) ) ( not ( = ?auto_36215 ?auto_36213 ) ) ( not ( = ?auto_36216 ?auto_36213 ) ) ( not ( = ?auto_36221 ?auto_36213 ) ) ( not ( = ?auto_36229 ?auto_36213 ) ) ( not ( = ?auto_36226 ?auto_36219 ) ) ( not ( = ?auto_36218 ?auto_36226 ) ) ( HOIST-AT ?auto_36227 ?auto_36226 ) ( not ( = ?auto_36223 ?auto_36227 ) ) ( not ( = ?auto_36225 ?auto_36227 ) ) ( AVAILABLE ?auto_36227 ) ( SURFACE-AT ?auto_36214 ?auto_36226 ) ( ON ?auto_36214 ?auto_36222 ) ( CLEAR ?auto_36214 ) ( not ( = ?auto_36215 ?auto_36222 ) ) ( not ( = ?auto_36216 ?auto_36222 ) ) ( not ( = ?auto_36214 ?auto_36222 ) ) ( not ( = ?auto_36221 ?auto_36222 ) ) ( not ( = ?auto_36229 ?auto_36222 ) ) ( not ( = ?auto_36213 ?auto_36222 ) ) ( SURFACE-AT ?auto_36212 ?auto_36219 ) ( CLEAR ?auto_36212 ) ( IS-CRATE ?auto_36213 ) ( not ( = ?auto_36212 ?auto_36213 ) ) ( not ( = ?auto_36215 ?auto_36212 ) ) ( not ( = ?auto_36216 ?auto_36212 ) ) ( not ( = ?auto_36214 ?auto_36212 ) ) ( not ( = ?auto_36221 ?auto_36212 ) ) ( not ( = ?auto_36229 ?auto_36212 ) ) ( not ( = ?auto_36222 ?auto_36212 ) ) ( AVAILABLE ?auto_36223 ) ( TRUCK-AT ?auto_36224 ?auto_36220 ) ( not ( = ?auto_36220 ?auto_36219 ) ) ( not ( = ?auto_36218 ?auto_36220 ) ) ( not ( = ?auto_36226 ?auto_36220 ) ) ( HOIST-AT ?auto_36217 ?auto_36220 ) ( not ( = ?auto_36223 ?auto_36217 ) ) ( not ( = ?auto_36225 ?auto_36217 ) ) ( not ( = ?auto_36227 ?auto_36217 ) ) ( AVAILABLE ?auto_36217 ) ( SURFACE-AT ?auto_36213 ?auto_36220 ) ( ON ?auto_36213 ?auto_36228 ) ( CLEAR ?auto_36213 ) ( not ( = ?auto_36215 ?auto_36228 ) ) ( not ( = ?auto_36216 ?auto_36228 ) ) ( not ( = ?auto_36214 ?auto_36228 ) ) ( not ( = ?auto_36221 ?auto_36228 ) ) ( not ( = ?auto_36229 ?auto_36228 ) ) ( not ( = ?auto_36213 ?auto_36228 ) ) ( not ( = ?auto_36222 ?auto_36228 ) ) ( not ( = ?auto_36212 ?auto_36228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36214 ?auto_36215 ?auto_36216 )
      ( MAKE-4CRATE-VERIFY ?auto_36212 ?auto_36213 ?auto_36214 ?auto_36215 ?auto_36216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36230 - SURFACE
      ?auto_36231 - SURFACE
      ?auto_36232 - SURFACE
      ?auto_36233 - SURFACE
      ?auto_36234 - SURFACE
      ?auto_36235 - SURFACE
    )
    :vars
    (
      ?auto_36242 - HOIST
      ?auto_36238 - PLACE
      ?auto_36237 - PLACE
      ?auto_36244 - HOIST
      ?auto_36240 - SURFACE
      ?auto_36248 - SURFACE
      ?auto_36245 - PLACE
      ?auto_36246 - HOIST
      ?auto_36241 - SURFACE
      ?auto_36243 - TRUCK
      ?auto_36239 - PLACE
      ?auto_36236 - HOIST
      ?auto_36247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36242 ?auto_36238 ) ( IS-CRATE ?auto_36235 ) ( not ( = ?auto_36234 ?auto_36235 ) ) ( not ( = ?auto_36233 ?auto_36234 ) ) ( not ( = ?auto_36233 ?auto_36235 ) ) ( not ( = ?auto_36237 ?auto_36238 ) ) ( HOIST-AT ?auto_36244 ?auto_36237 ) ( not ( = ?auto_36242 ?auto_36244 ) ) ( SURFACE-AT ?auto_36235 ?auto_36237 ) ( ON ?auto_36235 ?auto_36240 ) ( CLEAR ?auto_36235 ) ( not ( = ?auto_36234 ?auto_36240 ) ) ( not ( = ?auto_36235 ?auto_36240 ) ) ( not ( = ?auto_36233 ?auto_36240 ) ) ( IS-CRATE ?auto_36234 ) ( AVAILABLE ?auto_36244 ) ( SURFACE-AT ?auto_36234 ?auto_36237 ) ( ON ?auto_36234 ?auto_36248 ) ( CLEAR ?auto_36234 ) ( not ( = ?auto_36234 ?auto_36248 ) ) ( not ( = ?auto_36235 ?auto_36248 ) ) ( not ( = ?auto_36233 ?auto_36248 ) ) ( not ( = ?auto_36240 ?auto_36248 ) ) ( IS-CRATE ?auto_36233 ) ( not ( = ?auto_36232 ?auto_36233 ) ) ( not ( = ?auto_36234 ?auto_36232 ) ) ( not ( = ?auto_36235 ?auto_36232 ) ) ( not ( = ?auto_36240 ?auto_36232 ) ) ( not ( = ?auto_36248 ?auto_36232 ) ) ( not ( = ?auto_36245 ?auto_36238 ) ) ( not ( = ?auto_36237 ?auto_36245 ) ) ( HOIST-AT ?auto_36246 ?auto_36245 ) ( not ( = ?auto_36242 ?auto_36246 ) ) ( not ( = ?auto_36244 ?auto_36246 ) ) ( AVAILABLE ?auto_36246 ) ( SURFACE-AT ?auto_36233 ?auto_36245 ) ( ON ?auto_36233 ?auto_36241 ) ( CLEAR ?auto_36233 ) ( not ( = ?auto_36234 ?auto_36241 ) ) ( not ( = ?auto_36235 ?auto_36241 ) ) ( not ( = ?auto_36233 ?auto_36241 ) ) ( not ( = ?auto_36240 ?auto_36241 ) ) ( not ( = ?auto_36248 ?auto_36241 ) ) ( not ( = ?auto_36232 ?auto_36241 ) ) ( SURFACE-AT ?auto_36231 ?auto_36238 ) ( CLEAR ?auto_36231 ) ( IS-CRATE ?auto_36232 ) ( not ( = ?auto_36231 ?auto_36232 ) ) ( not ( = ?auto_36234 ?auto_36231 ) ) ( not ( = ?auto_36235 ?auto_36231 ) ) ( not ( = ?auto_36233 ?auto_36231 ) ) ( not ( = ?auto_36240 ?auto_36231 ) ) ( not ( = ?auto_36248 ?auto_36231 ) ) ( not ( = ?auto_36241 ?auto_36231 ) ) ( AVAILABLE ?auto_36242 ) ( TRUCK-AT ?auto_36243 ?auto_36239 ) ( not ( = ?auto_36239 ?auto_36238 ) ) ( not ( = ?auto_36237 ?auto_36239 ) ) ( not ( = ?auto_36245 ?auto_36239 ) ) ( HOIST-AT ?auto_36236 ?auto_36239 ) ( not ( = ?auto_36242 ?auto_36236 ) ) ( not ( = ?auto_36244 ?auto_36236 ) ) ( not ( = ?auto_36246 ?auto_36236 ) ) ( AVAILABLE ?auto_36236 ) ( SURFACE-AT ?auto_36232 ?auto_36239 ) ( ON ?auto_36232 ?auto_36247 ) ( CLEAR ?auto_36232 ) ( not ( = ?auto_36234 ?auto_36247 ) ) ( not ( = ?auto_36235 ?auto_36247 ) ) ( not ( = ?auto_36233 ?auto_36247 ) ) ( not ( = ?auto_36240 ?auto_36247 ) ) ( not ( = ?auto_36248 ?auto_36247 ) ) ( not ( = ?auto_36232 ?auto_36247 ) ) ( not ( = ?auto_36241 ?auto_36247 ) ) ( not ( = ?auto_36231 ?auto_36247 ) ) ( ON ?auto_36231 ?auto_36230 ) ( not ( = ?auto_36230 ?auto_36231 ) ) ( not ( = ?auto_36230 ?auto_36232 ) ) ( not ( = ?auto_36230 ?auto_36233 ) ) ( not ( = ?auto_36230 ?auto_36234 ) ) ( not ( = ?auto_36230 ?auto_36235 ) ) ( not ( = ?auto_36230 ?auto_36240 ) ) ( not ( = ?auto_36230 ?auto_36248 ) ) ( not ( = ?auto_36230 ?auto_36241 ) ) ( not ( = ?auto_36230 ?auto_36247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36233 ?auto_36234 ?auto_36235 )
      ( MAKE-5CRATE-VERIFY ?auto_36230 ?auto_36231 ?auto_36232 ?auto_36233 ?auto_36234 ?auto_36235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36249 - SURFACE
      ?auto_36250 - SURFACE
    )
    :vars
    (
      ?auto_36259 - HOIST
      ?auto_36253 - PLACE
      ?auto_36257 - SURFACE
      ?auto_36252 - PLACE
      ?auto_36261 - HOIST
      ?auto_36256 - SURFACE
      ?auto_36266 - SURFACE
      ?auto_36263 - SURFACE
      ?auto_36262 - PLACE
      ?auto_36264 - HOIST
      ?auto_36258 - SURFACE
      ?auto_36254 - SURFACE
      ?auto_36255 - PLACE
      ?auto_36251 - HOIST
      ?auto_36265 - SURFACE
      ?auto_36260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36259 ?auto_36253 ) ( IS-CRATE ?auto_36250 ) ( not ( = ?auto_36249 ?auto_36250 ) ) ( not ( = ?auto_36257 ?auto_36249 ) ) ( not ( = ?auto_36257 ?auto_36250 ) ) ( not ( = ?auto_36252 ?auto_36253 ) ) ( HOIST-AT ?auto_36261 ?auto_36252 ) ( not ( = ?auto_36259 ?auto_36261 ) ) ( SURFACE-AT ?auto_36250 ?auto_36252 ) ( ON ?auto_36250 ?auto_36256 ) ( CLEAR ?auto_36250 ) ( not ( = ?auto_36249 ?auto_36256 ) ) ( not ( = ?auto_36250 ?auto_36256 ) ) ( not ( = ?auto_36257 ?auto_36256 ) ) ( IS-CRATE ?auto_36249 ) ( AVAILABLE ?auto_36261 ) ( SURFACE-AT ?auto_36249 ?auto_36252 ) ( ON ?auto_36249 ?auto_36266 ) ( CLEAR ?auto_36249 ) ( not ( = ?auto_36249 ?auto_36266 ) ) ( not ( = ?auto_36250 ?auto_36266 ) ) ( not ( = ?auto_36257 ?auto_36266 ) ) ( not ( = ?auto_36256 ?auto_36266 ) ) ( IS-CRATE ?auto_36257 ) ( not ( = ?auto_36263 ?auto_36257 ) ) ( not ( = ?auto_36249 ?auto_36263 ) ) ( not ( = ?auto_36250 ?auto_36263 ) ) ( not ( = ?auto_36256 ?auto_36263 ) ) ( not ( = ?auto_36266 ?auto_36263 ) ) ( not ( = ?auto_36262 ?auto_36253 ) ) ( not ( = ?auto_36252 ?auto_36262 ) ) ( HOIST-AT ?auto_36264 ?auto_36262 ) ( not ( = ?auto_36259 ?auto_36264 ) ) ( not ( = ?auto_36261 ?auto_36264 ) ) ( AVAILABLE ?auto_36264 ) ( SURFACE-AT ?auto_36257 ?auto_36262 ) ( ON ?auto_36257 ?auto_36258 ) ( CLEAR ?auto_36257 ) ( not ( = ?auto_36249 ?auto_36258 ) ) ( not ( = ?auto_36250 ?auto_36258 ) ) ( not ( = ?auto_36257 ?auto_36258 ) ) ( not ( = ?auto_36256 ?auto_36258 ) ) ( not ( = ?auto_36266 ?auto_36258 ) ) ( not ( = ?auto_36263 ?auto_36258 ) ) ( SURFACE-AT ?auto_36254 ?auto_36253 ) ( CLEAR ?auto_36254 ) ( IS-CRATE ?auto_36263 ) ( not ( = ?auto_36254 ?auto_36263 ) ) ( not ( = ?auto_36249 ?auto_36254 ) ) ( not ( = ?auto_36250 ?auto_36254 ) ) ( not ( = ?auto_36257 ?auto_36254 ) ) ( not ( = ?auto_36256 ?auto_36254 ) ) ( not ( = ?auto_36266 ?auto_36254 ) ) ( not ( = ?auto_36258 ?auto_36254 ) ) ( AVAILABLE ?auto_36259 ) ( not ( = ?auto_36255 ?auto_36253 ) ) ( not ( = ?auto_36252 ?auto_36255 ) ) ( not ( = ?auto_36262 ?auto_36255 ) ) ( HOIST-AT ?auto_36251 ?auto_36255 ) ( not ( = ?auto_36259 ?auto_36251 ) ) ( not ( = ?auto_36261 ?auto_36251 ) ) ( not ( = ?auto_36264 ?auto_36251 ) ) ( AVAILABLE ?auto_36251 ) ( SURFACE-AT ?auto_36263 ?auto_36255 ) ( ON ?auto_36263 ?auto_36265 ) ( CLEAR ?auto_36263 ) ( not ( = ?auto_36249 ?auto_36265 ) ) ( not ( = ?auto_36250 ?auto_36265 ) ) ( not ( = ?auto_36257 ?auto_36265 ) ) ( not ( = ?auto_36256 ?auto_36265 ) ) ( not ( = ?auto_36266 ?auto_36265 ) ) ( not ( = ?auto_36263 ?auto_36265 ) ) ( not ( = ?auto_36258 ?auto_36265 ) ) ( not ( = ?auto_36254 ?auto_36265 ) ) ( TRUCK-AT ?auto_36260 ?auto_36253 ) )
    :subtasks
    ( ( !DRIVE ?auto_36260 ?auto_36253 ?auto_36255 )
      ( MAKE-2CRATE ?auto_36257 ?auto_36249 ?auto_36250 )
      ( MAKE-1CRATE-VERIFY ?auto_36249 ?auto_36250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36267 - SURFACE
      ?auto_36268 - SURFACE
      ?auto_36269 - SURFACE
    )
    :vars
    (
      ?auto_36282 - HOIST
      ?auto_36278 - PLACE
      ?auto_36284 - PLACE
      ?auto_36280 - HOIST
      ?auto_36281 - SURFACE
      ?auto_36274 - SURFACE
      ?auto_36275 - SURFACE
      ?auto_36277 - PLACE
      ?auto_36276 - HOIST
      ?auto_36271 - SURFACE
      ?auto_36279 - SURFACE
      ?auto_36273 - PLACE
      ?auto_36283 - HOIST
      ?auto_36270 - SURFACE
      ?auto_36272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36282 ?auto_36278 ) ( IS-CRATE ?auto_36269 ) ( not ( = ?auto_36268 ?auto_36269 ) ) ( not ( = ?auto_36267 ?auto_36268 ) ) ( not ( = ?auto_36267 ?auto_36269 ) ) ( not ( = ?auto_36284 ?auto_36278 ) ) ( HOIST-AT ?auto_36280 ?auto_36284 ) ( not ( = ?auto_36282 ?auto_36280 ) ) ( SURFACE-AT ?auto_36269 ?auto_36284 ) ( ON ?auto_36269 ?auto_36281 ) ( CLEAR ?auto_36269 ) ( not ( = ?auto_36268 ?auto_36281 ) ) ( not ( = ?auto_36269 ?auto_36281 ) ) ( not ( = ?auto_36267 ?auto_36281 ) ) ( IS-CRATE ?auto_36268 ) ( AVAILABLE ?auto_36280 ) ( SURFACE-AT ?auto_36268 ?auto_36284 ) ( ON ?auto_36268 ?auto_36274 ) ( CLEAR ?auto_36268 ) ( not ( = ?auto_36268 ?auto_36274 ) ) ( not ( = ?auto_36269 ?auto_36274 ) ) ( not ( = ?auto_36267 ?auto_36274 ) ) ( not ( = ?auto_36281 ?auto_36274 ) ) ( IS-CRATE ?auto_36267 ) ( not ( = ?auto_36275 ?auto_36267 ) ) ( not ( = ?auto_36268 ?auto_36275 ) ) ( not ( = ?auto_36269 ?auto_36275 ) ) ( not ( = ?auto_36281 ?auto_36275 ) ) ( not ( = ?auto_36274 ?auto_36275 ) ) ( not ( = ?auto_36277 ?auto_36278 ) ) ( not ( = ?auto_36284 ?auto_36277 ) ) ( HOIST-AT ?auto_36276 ?auto_36277 ) ( not ( = ?auto_36282 ?auto_36276 ) ) ( not ( = ?auto_36280 ?auto_36276 ) ) ( AVAILABLE ?auto_36276 ) ( SURFACE-AT ?auto_36267 ?auto_36277 ) ( ON ?auto_36267 ?auto_36271 ) ( CLEAR ?auto_36267 ) ( not ( = ?auto_36268 ?auto_36271 ) ) ( not ( = ?auto_36269 ?auto_36271 ) ) ( not ( = ?auto_36267 ?auto_36271 ) ) ( not ( = ?auto_36281 ?auto_36271 ) ) ( not ( = ?auto_36274 ?auto_36271 ) ) ( not ( = ?auto_36275 ?auto_36271 ) ) ( SURFACE-AT ?auto_36279 ?auto_36278 ) ( CLEAR ?auto_36279 ) ( IS-CRATE ?auto_36275 ) ( not ( = ?auto_36279 ?auto_36275 ) ) ( not ( = ?auto_36268 ?auto_36279 ) ) ( not ( = ?auto_36269 ?auto_36279 ) ) ( not ( = ?auto_36267 ?auto_36279 ) ) ( not ( = ?auto_36281 ?auto_36279 ) ) ( not ( = ?auto_36274 ?auto_36279 ) ) ( not ( = ?auto_36271 ?auto_36279 ) ) ( AVAILABLE ?auto_36282 ) ( not ( = ?auto_36273 ?auto_36278 ) ) ( not ( = ?auto_36284 ?auto_36273 ) ) ( not ( = ?auto_36277 ?auto_36273 ) ) ( HOIST-AT ?auto_36283 ?auto_36273 ) ( not ( = ?auto_36282 ?auto_36283 ) ) ( not ( = ?auto_36280 ?auto_36283 ) ) ( not ( = ?auto_36276 ?auto_36283 ) ) ( AVAILABLE ?auto_36283 ) ( SURFACE-AT ?auto_36275 ?auto_36273 ) ( ON ?auto_36275 ?auto_36270 ) ( CLEAR ?auto_36275 ) ( not ( = ?auto_36268 ?auto_36270 ) ) ( not ( = ?auto_36269 ?auto_36270 ) ) ( not ( = ?auto_36267 ?auto_36270 ) ) ( not ( = ?auto_36281 ?auto_36270 ) ) ( not ( = ?auto_36274 ?auto_36270 ) ) ( not ( = ?auto_36275 ?auto_36270 ) ) ( not ( = ?auto_36271 ?auto_36270 ) ) ( not ( = ?auto_36279 ?auto_36270 ) ) ( TRUCK-AT ?auto_36272 ?auto_36278 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36268 ?auto_36269 )
      ( MAKE-2CRATE-VERIFY ?auto_36267 ?auto_36268 ?auto_36269 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36285 - SURFACE
      ?auto_36286 - SURFACE
      ?auto_36287 - SURFACE
      ?auto_36288 - SURFACE
    )
    :vars
    (
      ?auto_36294 - HOIST
      ?auto_36295 - PLACE
      ?auto_36291 - PLACE
      ?auto_36296 - HOIST
      ?auto_36298 - SURFACE
      ?auto_36299 - SURFACE
      ?auto_36292 - PLACE
      ?auto_36300 - HOIST
      ?auto_36293 - SURFACE
      ?auto_36290 - SURFACE
      ?auto_36302 - PLACE
      ?auto_36297 - HOIST
      ?auto_36301 - SURFACE
      ?auto_36289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36294 ?auto_36295 ) ( IS-CRATE ?auto_36288 ) ( not ( = ?auto_36287 ?auto_36288 ) ) ( not ( = ?auto_36286 ?auto_36287 ) ) ( not ( = ?auto_36286 ?auto_36288 ) ) ( not ( = ?auto_36291 ?auto_36295 ) ) ( HOIST-AT ?auto_36296 ?auto_36291 ) ( not ( = ?auto_36294 ?auto_36296 ) ) ( SURFACE-AT ?auto_36288 ?auto_36291 ) ( ON ?auto_36288 ?auto_36298 ) ( CLEAR ?auto_36288 ) ( not ( = ?auto_36287 ?auto_36298 ) ) ( not ( = ?auto_36288 ?auto_36298 ) ) ( not ( = ?auto_36286 ?auto_36298 ) ) ( IS-CRATE ?auto_36287 ) ( AVAILABLE ?auto_36296 ) ( SURFACE-AT ?auto_36287 ?auto_36291 ) ( ON ?auto_36287 ?auto_36299 ) ( CLEAR ?auto_36287 ) ( not ( = ?auto_36287 ?auto_36299 ) ) ( not ( = ?auto_36288 ?auto_36299 ) ) ( not ( = ?auto_36286 ?auto_36299 ) ) ( not ( = ?auto_36298 ?auto_36299 ) ) ( IS-CRATE ?auto_36286 ) ( not ( = ?auto_36285 ?auto_36286 ) ) ( not ( = ?auto_36287 ?auto_36285 ) ) ( not ( = ?auto_36288 ?auto_36285 ) ) ( not ( = ?auto_36298 ?auto_36285 ) ) ( not ( = ?auto_36299 ?auto_36285 ) ) ( not ( = ?auto_36292 ?auto_36295 ) ) ( not ( = ?auto_36291 ?auto_36292 ) ) ( HOIST-AT ?auto_36300 ?auto_36292 ) ( not ( = ?auto_36294 ?auto_36300 ) ) ( not ( = ?auto_36296 ?auto_36300 ) ) ( AVAILABLE ?auto_36300 ) ( SURFACE-AT ?auto_36286 ?auto_36292 ) ( ON ?auto_36286 ?auto_36293 ) ( CLEAR ?auto_36286 ) ( not ( = ?auto_36287 ?auto_36293 ) ) ( not ( = ?auto_36288 ?auto_36293 ) ) ( not ( = ?auto_36286 ?auto_36293 ) ) ( not ( = ?auto_36298 ?auto_36293 ) ) ( not ( = ?auto_36299 ?auto_36293 ) ) ( not ( = ?auto_36285 ?auto_36293 ) ) ( SURFACE-AT ?auto_36290 ?auto_36295 ) ( CLEAR ?auto_36290 ) ( IS-CRATE ?auto_36285 ) ( not ( = ?auto_36290 ?auto_36285 ) ) ( not ( = ?auto_36287 ?auto_36290 ) ) ( not ( = ?auto_36288 ?auto_36290 ) ) ( not ( = ?auto_36286 ?auto_36290 ) ) ( not ( = ?auto_36298 ?auto_36290 ) ) ( not ( = ?auto_36299 ?auto_36290 ) ) ( not ( = ?auto_36293 ?auto_36290 ) ) ( AVAILABLE ?auto_36294 ) ( not ( = ?auto_36302 ?auto_36295 ) ) ( not ( = ?auto_36291 ?auto_36302 ) ) ( not ( = ?auto_36292 ?auto_36302 ) ) ( HOIST-AT ?auto_36297 ?auto_36302 ) ( not ( = ?auto_36294 ?auto_36297 ) ) ( not ( = ?auto_36296 ?auto_36297 ) ) ( not ( = ?auto_36300 ?auto_36297 ) ) ( AVAILABLE ?auto_36297 ) ( SURFACE-AT ?auto_36285 ?auto_36302 ) ( ON ?auto_36285 ?auto_36301 ) ( CLEAR ?auto_36285 ) ( not ( = ?auto_36287 ?auto_36301 ) ) ( not ( = ?auto_36288 ?auto_36301 ) ) ( not ( = ?auto_36286 ?auto_36301 ) ) ( not ( = ?auto_36298 ?auto_36301 ) ) ( not ( = ?auto_36299 ?auto_36301 ) ) ( not ( = ?auto_36285 ?auto_36301 ) ) ( not ( = ?auto_36293 ?auto_36301 ) ) ( not ( = ?auto_36290 ?auto_36301 ) ) ( TRUCK-AT ?auto_36289 ?auto_36295 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36286 ?auto_36287 ?auto_36288 )
      ( MAKE-3CRATE-VERIFY ?auto_36285 ?auto_36286 ?auto_36287 ?auto_36288 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36303 - SURFACE
      ?auto_36304 - SURFACE
      ?auto_36305 - SURFACE
      ?auto_36306 - SURFACE
      ?auto_36307 - SURFACE
    )
    :vars
    (
      ?auto_36312 - HOIST
      ?auto_36313 - PLACE
      ?auto_36309 - PLACE
      ?auto_36314 - HOIST
      ?auto_36316 - SURFACE
      ?auto_36317 - SURFACE
      ?auto_36310 - PLACE
      ?auto_36318 - HOIST
      ?auto_36311 - SURFACE
      ?auto_36320 - PLACE
      ?auto_36315 - HOIST
      ?auto_36319 - SURFACE
      ?auto_36308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36312 ?auto_36313 ) ( IS-CRATE ?auto_36307 ) ( not ( = ?auto_36306 ?auto_36307 ) ) ( not ( = ?auto_36305 ?auto_36306 ) ) ( not ( = ?auto_36305 ?auto_36307 ) ) ( not ( = ?auto_36309 ?auto_36313 ) ) ( HOIST-AT ?auto_36314 ?auto_36309 ) ( not ( = ?auto_36312 ?auto_36314 ) ) ( SURFACE-AT ?auto_36307 ?auto_36309 ) ( ON ?auto_36307 ?auto_36316 ) ( CLEAR ?auto_36307 ) ( not ( = ?auto_36306 ?auto_36316 ) ) ( not ( = ?auto_36307 ?auto_36316 ) ) ( not ( = ?auto_36305 ?auto_36316 ) ) ( IS-CRATE ?auto_36306 ) ( AVAILABLE ?auto_36314 ) ( SURFACE-AT ?auto_36306 ?auto_36309 ) ( ON ?auto_36306 ?auto_36317 ) ( CLEAR ?auto_36306 ) ( not ( = ?auto_36306 ?auto_36317 ) ) ( not ( = ?auto_36307 ?auto_36317 ) ) ( not ( = ?auto_36305 ?auto_36317 ) ) ( not ( = ?auto_36316 ?auto_36317 ) ) ( IS-CRATE ?auto_36305 ) ( not ( = ?auto_36304 ?auto_36305 ) ) ( not ( = ?auto_36306 ?auto_36304 ) ) ( not ( = ?auto_36307 ?auto_36304 ) ) ( not ( = ?auto_36316 ?auto_36304 ) ) ( not ( = ?auto_36317 ?auto_36304 ) ) ( not ( = ?auto_36310 ?auto_36313 ) ) ( not ( = ?auto_36309 ?auto_36310 ) ) ( HOIST-AT ?auto_36318 ?auto_36310 ) ( not ( = ?auto_36312 ?auto_36318 ) ) ( not ( = ?auto_36314 ?auto_36318 ) ) ( AVAILABLE ?auto_36318 ) ( SURFACE-AT ?auto_36305 ?auto_36310 ) ( ON ?auto_36305 ?auto_36311 ) ( CLEAR ?auto_36305 ) ( not ( = ?auto_36306 ?auto_36311 ) ) ( not ( = ?auto_36307 ?auto_36311 ) ) ( not ( = ?auto_36305 ?auto_36311 ) ) ( not ( = ?auto_36316 ?auto_36311 ) ) ( not ( = ?auto_36317 ?auto_36311 ) ) ( not ( = ?auto_36304 ?auto_36311 ) ) ( SURFACE-AT ?auto_36303 ?auto_36313 ) ( CLEAR ?auto_36303 ) ( IS-CRATE ?auto_36304 ) ( not ( = ?auto_36303 ?auto_36304 ) ) ( not ( = ?auto_36306 ?auto_36303 ) ) ( not ( = ?auto_36307 ?auto_36303 ) ) ( not ( = ?auto_36305 ?auto_36303 ) ) ( not ( = ?auto_36316 ?auto_36303 ) ) ( not ( = ?auto_36317 ?auto_36303 ) ) ( not ( = ?auto_36311 ?auto_36303 ) ) ( AVAILABLE ?auto_36312 ) ( not ( = ?auto_36320 ?auto_36313 ) ) ( not ( = ?auto_36309 ?auto_36320 ) ) ( not ( = ?auto_36310 ?auto_36320 ) ) ( HOIST-AT ?auto_36315 ?auto_36320 ) ( not ( = ?auto_36312 ?auto_36315 ) ) ( not ( = ?auto_36314 ?auto_36315 ) ) ( not ( = ?auto_36318 ?auto_36315 ) ) ( AVAILABLE ?auto_36315 ) ( SURFACE-AT ?auto_36304 ?auto_36320 ) ( ON ?auto_36304 ?auto_36319 ) ( CLEAR ?auto_36304 ) ( not ( = ?auto_36306 ?auto_36319 ) ) ( not ( = ?auto_36307 ?auto_36319 ) ) ( not ( = ?auto_36305 ?auto_36319 ) ) ( not ( = ?auto_36316 ?auto_36319 ) ) ( not ( = ?auto_36317 ?auto_36319 ) ) ( not ( = ?auto_36304 ?auto_36319 ) ) ( not ( = ?auto_36311 ?auto_36319 ) ) ( not ( = ?auto_36303 ?auto_36319 ) ) ( TRUCK-AT ?auto_36308 ?auto_36313 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36305 ?auto_36306 ?auto_36307 )
      ( MAKE-4CRATE-VERIFY ?auto_36303 ?auto_36304 ?auto_36305 ?auto_36306 ?auto_36307 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36321 - SURFACE
      ?auto_36322 - SURFACE
      ?auto_36323 - SURFACE
      ?auto_36324 - SURFACE
      ?auto_36325 - SURFACE
      ?auto_36326 - SURFACE
    )
    :vars
    (
      ?auto_36331 - HOIST
      ?auto_36332 - PLACE
      ?auto_36328 - PLACE
      ?auto_36333 - HOIST
      ?auto_36335 - SURFACE
      ?auto_36336 - SURFACE
      ?auto_36329 - PLACE
      ?auto_36337 - HOIST
      ?auto_36330 - SURFACE
      ?auto_36339 - PLACE
      ?auto_36334 - HOIST
      ?auto_36338 - SURFACE
      ?auto_36327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36331 ?auto_36332 ) ( IS-CRATE ?auto_36326 ) ( not ( = ?auto_36325 ?auto_36326 ) ) ( not ( = ?auto_36324 ?auto_36325 ) ) ( not ( = ?auto_36324 ?auto_36326 ) ) ( not ( = ?auto_36328 ?auto_36332 ) ) ( HOIST-AT ?auto_36333 ?auto_36328 ) ( not ( = ?auto_36331 ?auto_36333 ) ) ( SURFACE-AT ?auto_36326 ?auto_36328 ) ( ON ?auto_36326 ?auto_36335 ) ( CLEAR ?auto_36326 ) ( not ( = ?auto_36325 ?auto_36335 ) ) ( not ( = ?auto_36326 ?auto_36335 ) ) ( not ( = ?auto_36324 ?auto_36335 ) ) ( IS-CRATE ?auto_36325 ) ( AVAILABLE ?auto_36333 ) ( SURFACE-AT ?auto_36325 ?auto_36328 ) ( ON ?auto_36325 ?auto_36336 ) ( CLEAR ?auto_36325 ) ( not ( = ?auto_36325 ?auto_36336 ) ) ( not ( = ?auto_36326 ?auto_36336 ) ) ( not ( = ?auto_36324 ?auto_36336 ) ) ( not ( = ?auto_36335 ?auto_36336 ) ) ( IS-CRATE ?auto_36324 ) ( not ( = ?auto_36323 ?auto_36324 ) ) ( not ( = ?auto_36325 ?auto_36323 ) ) ( not ( = ?auto_36326 ?auto_36323 ) ) ( not ( = ?auto_36335 ?auto_36323 ) ) ( not ( = ?auto_36336 ?auto_36323 ) ) ( not ( = ?auto_36329 ?auto_36332 ) ) ( not ( = ?auto_36328 ?auto_36329 ) ) ( HOIST-AT ?auto_36337 ?auto_36329 ) ( not ( = ?auto_36331 ?auto_36337 ) ) ( not ( = ?auto_36333 ?auto_36337 ) ) ( AVAILABLE ?auto_36337 ) ( SURFACE-AT ?auto_36324 ?auto_36329 ) ( ON ?auto_36324 ?auto_36330 ) ( CLEAR ?auto_36324 ) ( not ( = ?auto_36325 ?auto_36330 ) ) ( not ( = ?auto_36326 ?auto_36330 ) ) ( not ( = ?auto_36324 ?auto_36330 ) ) ( not ( = ?auto_36335 ?auto_36330 ) ) ( not ( = ?auto_36336 ?auto_36330 ) ) ( not ( = ?auto_36323 ?auto_36330 ) ) ( SURFACE-AT ?auto_36322 ?auto_36332 ) ( CLEAR ?auto_36322 ) ( IS-CRATE ?auto_36323 ) ( not ( = ?auto_36322 ?auto_36323 ) ) ( not ( = ?auto_36325 ?auto_36322 ) ) ( not ( = ?auto_36326 ?auto_36322 ) ) ( not ( = ?auto_36324 ?auto_36322 ) ) ( not ( = ?auto_36335 ?auto_36322 ) ) ( not ( = ?auto_36336 ?auto_36322 ) ) ( not ( = ?auto_36330 ?auto_36322 ) ) ( AVAILABLE ?auto_36331 ) ( not ( = ?auto_36339 ?auto_36332 ) ) ( not ( = ?auto_36328 ?auto_36339 ) ) ( not ( = ?auto_36329 ?auto_36339 ) ) ( HOIST-AT ?auto_36334 ?auto_36339 ) ( not ( = ?auto_36331 ?auto_36334 ) ) ( not ( = ?auto_36333 ?auto_36334 ) ) ( not ( = ?auto_36337 ?auto_36334 ) ) ( AVAILABLE ?auto_36334 ) ( SURFACE-AT ?auto_36323 ?auto_36339 ) ( ON ?auto_36323 ?auto_36338 ) ( CLEAR ?auto_36323 ) ( not ( = ?auto_36325 ?auto_36338 ) ) ( not ( = ?auto_36326 ?auto_36338 ) ) ( not ( = ?auto_36324 ?auto_36338 ) ) ( not ( = ?auto_36335 ?auto_36338 ) ) ( not ( = ?auto_36336 ?auto_36338 ) ) ( not ( = ?auto_36323 ?auto_36338 ) ) ( not ( = ?auto_36330 ?auto_36338 ) ) ( not ( = ?auto_36322 ?auto_36338 ) ) ( TRUCK-AT ?auto_36327 ?auto_36332 ) ( ON ?auto_36322 ?auto_36321 ) ( not ( = ?auto_36321 ?auto_36322 ) ) ( not ( = ?auto_36321 ?auto_36323 ) ) ( not ( = ?auto_36321 ?auto_36324 ) ) ( not ( = ?auto_36321 ?auto_36325 ) ) ( not ( = ?auto_36321 ?auto_36326 ) ) ( not ( = ?auto_36321 ?auto_36335 ) ) ( not ( = ?auto_36321 ?auto_36336 ) ) ( not ( = ?auto_36321 ?auto_36330 ) ) ( not ( = ?auto_36321 ?auto_36338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36324 ?auto_36325 ?auto_36326 )
      ( MAKE-5CRATE-VERIFY ?auto_36321 ?auto_36322 ?auto_36323 ?auto_36324 ?auto_36325 ?auto_36326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36340 - SURFACE
      ?auto_36341 - SURFACE
    )
    :vars
    (
      ?auto_36348 - HOIST
      ?auto_36349 - PLACE
      ?auto_36343 - SURFACE
      ?auto_36345 - PLACE
      ?auto_36350 - HOIST
      ?auto_36353 - SURFACE
      ?auto_36354 - SURFACE
      ?auto_36352 - SURFACE
      ?auto_36346 - PLACE
      ?auto_36355 - HOIST
      ?auto_36347 - SURFACE
      ?auto_36344 - SURFACE
      ?auto_36357 - PLACE
      ?auto_36351 - HOIST
      ?auto_36356 - SURFACE
      ?auto_36342 - TRUCK
      ?auto_36358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36348 ?auto_36349 ) ( IS-CRATE ?auto_36341 ) ( not ( = ?auto_36340 ?auto_36341 ) ) ( not ( = ?auto_36343 ?auto_36340 ) ) ( not ( = ?auto_36343 ?auto_36341 ) ) ( not ( = ?auto_36345 ?auto_36349 ) ) ( HOIST-AT ?auto_36350 ?auto_36345 ) ( not ( = ?auto_36348 ?auto_36350 ) ) ( SURFACE-AT ?auto_36341 ?auto_36345 ) ( ON ?auto_36341 ?auto_36353 ) ( CLEAR ?auto_36341 ) ( not ( = ?auto_36340 ?auto_36353 ) ) ( not ( = ?auto_36341 ?auto_36353 ) ) ( not ( = ?auto_36343 ?auto_36353 ) ) ( IS-CRATE ?auto_36340 ) ( AVAILABLE ?auto_36350 ) ( SURFACE-AT ?auto_36340 ?auto_36345 ) ( ON ?auto_36340 ?auto_36354 ) ( CLEAR ?auto_36340 ) ( not ( = ?auto_36340 ?auto_36354 ) ) ( not ( = ?auto_36341 ?auto_36354 ) ) ( not ( = ?auto_36343 ?auto_36354 ) ) ( not ( = ?auto_36353 ?auto_36354 ) ) ( IS-CRATE ?auto_36343 ) ( not ( = ?auto_36352 ?auto_36343 ) ) ( not ( = ?auto_36340 ?auto_36352 ) ) ( not ( = ?auto_36341 ?auto_36352 ) ) ( not ( = ?auto_36353 ?auto_36352 ) ) ( not ( = ?auto_36354 ?auto_36352 ) ) ( not ( = ?auto_36346 ?auto_36349 ) ) ( not ( = ?auto_36345 ?auto_36346 ) ) ( HOIST-AT ?auto_36355 ?auto_36346 ) ( not ( = ?auto_36348 ?auto_36355 ) ) ( not ( = ?auto_36350 ?auto_36355 ) ) ( AVAILABLE ?auto_36355 ) ( SURFACE-AT ?auto_36343 ?auto_36346 ) ( ON ?auto_36343 ?auto_36347 ) ( CLEAR ?auto_36343 ) ( not ( = ?auto_36340 ?auto_36347 ) ) ( not ( = ?auto_36341 ?auto_36347 ) ) ( not ( = ?auto_36343 ?auto_36347 ) ) ( not ( = ?auto_36353 ?auto_36347 ) ) ( not ( = ?auto_36354 ?auto_36347 ) ) ( not ( = ?auto_36352 ?auto_36347 ) ) ( IS-CRATE ?auto_36352 ) ( not ( = ?auto_36344 ?auto_36352 ) ) ( not ( = ?auto_36340 ?auto_36344 ) ) ( not ( = ?auto_36341 ?auto_36344 ) ) ( not ( = ?auto_36343 ?auto_36344 ) ) ( not ( = ?auto_36353 ?auto_36344 ) ) ( not ( = ?auto_36354 ?auto_36344 ) ) ( not ( = ?auto_36347 ?auto_36344 ) ) ( not ( = ?auto_36357 ?auto_36349 ) ) ( not ( = ?auto_36345 ?auto_36357 ) ) ( not ( = ?auto_36346 ?auto_36357 ) ) ( HOIST-AT ?auto_36351 ?auto_36357 ) ( not ( = ?auto_36348 ?auto_36351 ) ) ( not ( = ?auto_36350 ?auto_36351 ) ) ( not ( = ?auto_36355 ?auto_36351 ) ) ( AVAILABLE ?auto_36351 ) ( SURFACE-AT ?auto_36352 ?auto_36357 ) ( ON ?auto_36352 ?auto_36356 ) ( CLEAR ?auto_36352 ) ( not ( = ?auto_36340 ?auto_36356 ) ) ( not ( = ?auto_36341 ?auto_36356 ) ) ( not ( = ?auto_36343 ?auto_36356 ) ) ( not ( = ?auto_36353 ?auto_36356 ) ) ( not ( = ?auto_36354 ?auto_36356 ) ) ( not ( = ?auto_36352 ?auto_36356 ) ) ( not ( = ?auto_36347 ?auto_36356 ) ) ( not ( = ?auto_36344 ?auto_36356 ) ) ( TRUCK-AT ?auto_36342 ?auto_36349 ) ( SURFACE-AT ?auto_36358 ?auto_36349 ) ( CLEAR ?auto_36358 ) ( LIFTING ?auto_36348 ?auto_36344 ) ( IS-CRATE ?auto_36344 ) ( not ( = ?auto_36358 ?auto_36344 ) ) ( not ( = ?auto_36340 ?auto_36358 ) ) ( not ( = ?auto_36341 ?auto_36358 ) ) ( not ( = ?auto_36343 ?auto_36358 ) ) ( not ( = ?auto_36353 ?auto_36358 ) ) ( not ( = ?auto_36354 ?auto_36358 ) ) ( not ( = ?auto_36352 ?auto_36358 ) ) ( not ( = ?auto_36347 ?auto_36358 ) ) ( not ( = ?auto_36356 ?auto_36358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36358 ?auto_36344 )
      ( MAKE-2CRATE ?auto_36343 ?auto_36340 ?auto_36341 )
      ( MAKE-1CRATE-VERIFY ?auto_36340 ?auto_36341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36359 - SURFACE
      ?auto_36360 - SURFACE
      ?auto_36361 - SURFACE
    )
    :vars
    (
      ?auto_36368 - HOIST
      ?auto_36366 - PLACE
      ?auto_36362 - PLACE
      ?auto_36370 - HOIST
      ?auto_36373 - SURFACE
      ?auto_36376 - SURFACE
      ?auto_36372 - SURFACE
      ?auto_36363 - PLACE
      ?auto_36371 - HOIST
      ?auto_36377 - SURFACE
      ?auto_36364 - SURFACE
      ?auto_36365 - PLACE
      ?auto_36369 - HOIST
      ?auto_36367 - SURFACE
      ?auto_36375 - TRUCK
      ?auto_36374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36368 ?auto_36366 ) ( IS-CRATE ?auto_36361 ) ( not ( = ?auto_36360 ?auto_36361 ) ) ( not ( = ?auto_36359 ?auto_36360 ) ) ( not ( = ?auto_36359 ?auto_36361 ) ) ( not ( = ?auto_36362 ?auto_36366 ) ) ( HOIST-AT ?auto_36370 ?auto_36362 ) ( not ( = ?auto_36368 ?auto_36370 ) ) ( SURFACE-AT ?auto_36361 ?auto_36362 ) ( ON ?auto_36361 ?auto_36373 ) ( CLEAR ?auto_36361 ) ( not ( = ?auto_36360 ?auto_36373 ) ) ( not ( = ?auto_36361 ?auto_36373 ) ) ( not ( = ?auto_36359 ?auto_36373 ) ) ( IS-CRATE ?auto_36360 ) ( AVAILABLE ?auto_36370 ) ( SURFACE-AT ?auto_36360 ?auto_36362 ) ( ON ?auto_36360 ?auto_36376 ) ( CLEAR ?auto_36360 ) ( not ( = ?auto_36360 ?auto_36376 ) ) ( not ( = ?auto_36361 ?auto_36376 ) ) ( not ( = ?auto_36359 ?auto_36376 ) ) ( not ( = ?auto_36373 ?auto_36376 ) ) ( IS-CRATE ?auto_36359 ) ( not ( = ?auto_36372 ?auto_36359 ) ) ( not ( = ?auto_36360 ?auto_36372 ) ) ( not ( = ?auto_36361 ?auto_36372 ) ) ( not ( = ?auto_36373 ?auto_36372 ) ) ( not ( = ?auto_36376 ?auto_36372 ) ) ( not ( = ?auto_36363 ?auto_36366 ) ) ( not ( = ?auto_36362 ?auto_36363 ) ) ( HOIST-AT ?auto_36371 ?auto_36363 ) ( not ( = ?auto_36368 ?auto_36371 ) ) ( not ( = ?auto_36370 ?auto_36371 ) ) ( AVAILABLE ?auto_36371 ) ( SURFACE-AT ?auto_36359 ?auto_36363 ) ( ON ?auto_36359 ?auto_36377 ) ( CLEAR ?auto_36359 ) ( not ( = ?auto_36360 ?auto_36377 ) ) ( not ( = ?auto_36361 ?auto_36377 ) ) ( not ( = ?auto_36359 ?auto_36377 ) ) ( not ( = ?auto_36373 ?auto_36377 ) ) ( not ( = ?auto_36376 ?auto_36377 ) ) ( not ( = ?auto_36372 ?auto_36377 ) ) ( IS-CRATE ?auto_36372 ) ( not ( = ?auto_36364 ?auto_36372 ) ) ( not ( = ?auto_36360 ?auto_36364 ) ) ( not ( = ?auto_36361 ?auto_36364 ) ) ( not ( = ?auto_36359 ?auto_36364 ) ) ( not ( = ?auto_36373 ?auto_36364 ) ) ( not ( = ?auto_36376 ?auto_36364 ) ) ( not ( = ?auto_36377 ?auto_36364 ) ) ( not ( = ?auto_36365 ?auto_36366 ) ) ( not ( = ?auto_36362 ?auto_36365 ) ) ( not ( = ?auto_36363 ?auto_36365 ) ) ( HOIST-AT ?auto_36369 ?auto_36365 ) ( not ( = ?auto_36368 ?auto_36369 ) ) ( not ( = ?auto_36370 ?auto_36369 ) ) ( not ( = ?auto_36371 ?auto_36369 ) ) ( AVAILABLE ?auto_36369 ) ( SURFACE-AT ?auto_36372 ?auto_36365 ) ( ON ?auto_36372 ?auto_36367 ) ( CLEAR ?auto_36372 ) ( not ( = ?auto_36360 ?auto_36367 ) ) ( not ( = ?auto_36361 ?auto_36367 ) ) ( not ( = ?auto_36359 ?auto_36367 ) ) ( not ( = ?auto_36373 ?auto_36367 ) ) ( not ( = ?auto_36376 ?auto_36367 ) ) ( not ( = ?auto_36372 ?auto_36367 ) ) ( not ( = ?auto_36377 ?auto_36367 ) ) ( not ( = ?auto_36364 ?auto_36367 ) ) ( TRUCK-AT ?auto_36375 ?auto_36366 ) ( SURFACE-AT ?auto_36374 ?auto_36366 ) ( CLEAR ?auto_36374 ) ( LIFTING ?auto_36368 ?auto_36364 ) ( IS-CRATE ?auto_36364 ) ( not ( = ?auto_36374 ?auto_36364 ) ) ( not ( = ?auto_36360 ?auto_36374 ) ) ( not ( = ?auto_36361 ?auto_36374 ) ) ( not ( = ?auto_36359 ?auto_36374 ) ) ( not ( = ?auto_36373 ?auto_36374 ) ) ( not ( = ?auto_36376 ?auto_36374 ) ) ( not ( = ?auto_36372 ?auto_36374 ) ) ( not ( = ?auto_36377 ?auto_36374 ) ) ( not ( = ?auto_36367 ?auto_36374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36360 ?auto_36361 )
      ( MAKE-2CRATE-VERIFY ?auto_36359 ?auto_36360 ?auto_36361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36378 - SURFACE
      ?auto_36379 - SURFACE
      ?auto_36380 - SURFACE
      ?auto_36381 - SURFACE
    )
    :vars
    (
      ?auto_36390 - HOIST
      ?auto_36396 - PLACE
      ?auto_36389 - PLACE
      ?auto_36384 - HOIST
      ?auto_36392 - SURFACE
      ?auto_36394 - SURFACE
      ?auto_36383 - PLACE
      ?auto_36391 - HOIST
      ?auto_36387 - SURFACE
      ?auto_36385 - SURFACE
      ?auto_36382 - PLACE
      ?auto_36388 - HOIST
      ?auto_36386 - SURFACE
      ?auto_36395 - TRUCK
      ?auto_36393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36390 ?auto_36396 ) ( IS-CRATE ?auto_36381 ) ( not ( = ?auto_36380 ?auto_36381 ) ) ( not ( = ?auto_36379 ?auto_36380 ) ) ( not ( = ?auto_36379 ?auto_36381 ) ) ( not ( = ?auto_36389 ?auto_36396 ) ) ( HOIST-AT ?auto_36384 ?auto_36389 ) ( not ( = ?auto_36390 ?auto_36384 ) ) ( SURFACE-AT ?auto_36381 ?auto_36389 ) ( ON ?auto_36381 ?auto_36392 ) ( CLEAR ?auto_36381 ) ( not ( = ?auto_36380 ?auto_36392 ) ) ( not ( = ?auto_36381 ?auto_36392 ) ) ( not ( = ?auto_36379 ?auto_36392 ) ) ( IS-CRATE ?auto_36380 ) ( AVAILABLE ?auto_36384 ) ( SURFACE-AT ?auto_36380 ?auto_36389 ) ( ON ?auto_36380 ?auto_36394 ) ( CLEAR ?auto_36380 ) ( not ( = ?auto_36380 ?auto_36394 ) ) ( not ( = ?auto_36381 ?auto_36394 ) ) ( not ( = ?auto_36379 ?auto_36394 ) ) ( not ( = ?auto_36392 ?auto_36394 ) ) ( IS-CRATE ?auto_36379 ) ( not ( = ?auto_36378 ?auto_36379 ) ) ( not ( = ?auto_36380 ?auto_36378 ) ) ( not ( = ?auto_36381 ?auto_36378 ) ) ( not ( = ?auto_36392 ?auto_36378 ) ) ( not ( = ?auto_36394 ?auto_36378 ) ) ( not ( = ?auto_36383 ?auto_36396 ) ) ( not ( = ?auto_36389 ?auto_36383 ) ) ( HOIST-AT ?auto_36391 ?auto_36383 ) ( not ( = ?auto_36390 ?auto_36391 ) ) ( not ( = ?auto_36384 ?auto_36391 ) ) ( AVAILABLE ?auto_36391 ) ( SURFACE-AT ?auto_36379 ?auto_36383 ) ( ON ?auto_36379 ?auto_36387 ) ( CLEAR ?auto_36379 ) ( not ( = ?auto_36380 ?auto_36387 ) ) ( not ( = ?auto_36381 ?auto_36387 ) ) ( not ( = ?auto_36379 ?auto_36387 ) ) ( not ( = ?auto_36392 ?auto_36387 ) ) ( not ( = ?auto_36394 ?auto_36387 ) ) ( not ( = ?auto_36378 ?auto_36387 ) ) ( IS-CRATE ?auto_36378 ) ( not ( = ?auto_36385 ?auto_36378 ) ) ( not ( = ?auto_36380 ?auto_36385 ) ) ( not ( = ?auto_36381 ?auto_36385 ) ) ( not ( = ?auto_36379 ?auto_36385 ) ) ( not ( = ?auto_36392 ?auto_36385 ) ) ( not ( = ?auto_36394 ?auto_36385 ) ) ( not ( = ?auto_36387 ?auto_36385 ) ) ( not ( = ?auto_36382 ?auto_36396 ) ) ( not ( = ?auto_36389 ?auto_36382 ) ) ( not ( = ?auto_36383 ?auto_36382 ) ) ( HOIST-AT ?auto_36388 ?auto_36382 ) ( not ( = ?auto_36390 ?auto_36388 ) ) ( not ( = ?auto_36384 ?auto_36388 ) ) ( not ( = ?auto_36391 ?auto_36388 ) ) ( AVAILABLE ?auto_36388 ) ( SURFACE-AT ?auto_36378 ?auto_36382 ) ( ON ?auto_36378 ?auto_36386 ) ( CLEAR ?auto_36378 ) ( not ( = ?auto_36380 ?auto_36386 ) ) ( not ( = ?auto_36381 ?auto_36386 ) ) ( not ( = ?auto_36379 ?auto_36386 ) ) ( not ( = ?auto_36392 ?auto_36386 ) ) ( not ( = ?auto_36394 ?auto_36386 ) ) ( not ( = ?auto_36378 ?auto_36386 ) ) ( not ( = ?auto_36387 ?auto_36386 ) ) ( not ( = ?auto_36385 ?auto_36386 ) ) ( TRUCK-AT ?auto_36395 ?auto_36396 ) ( SURFACE-AT ?auto_36393 ?auto_36396 ) ( CLEAR ?auto_36393 ) ( LIFTING ?auto_36390 ?auto_36385 ) ( IS-CRATE ?auto_36385 ) ( not ( = ?auto_36393 ?auto_36385 ) ) ( not ( = ?auto_36380 ?auto_36393 ) ) ( not ( = ?auto_36381 ?auto_36393 ) ) ( not ( = ?auto_36379 ?auto_36393 ) ) ( not ( = ?auto_36392 ?auto_36393 ) ) ( not ( = ?auto_36394 ?auto_36393 ) ) ( not ( = ?auto_36378 ?auto_36393 ) ) ( not ( = ?auto_36387 ?auto_36393 ) ) ( not ( = ?auto_36386 ?auto_36393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36379 ?auto_36380 ?auto_36381 )
      ( MAKE-3CRATE-VERIFY ?auto_36378 ?auto_36379 ?auto_36380 ?auto_36381 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36397 - SURFACE
      ?auto_36398 - SURFACE
      ?auto_36399 - SURFACE
      ?auto_36400 - SURFACE
      ?auto_36401 - SURFACE
    )
    :vars
    (
      ?auto_36409 - HOIST
      ?auto_36415 - PLACE
      ?auto_36408 - PLACE
      ?auto_36404 - HOIST
      ?auto_36411 - SURFACE
      ?auto_36413 - SURFACE
      ?auto_36403 - PLACE
      ?auto_36410 - HOIST
      ?auto_36406 - SURFACE
      ?auto_36402 - PLACE
      ?auto_36407 - HOIST
      ?auto_36405 - SURFACE
      ?auto_36414 - TRUCK
      ?auto_36412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36409 ?auto_36415 ) ( IS-CRATE ?auto_36401 ) ( not ( = ?auto_36400 ?auto_36401 ) ) ( not ( = ?auto_36399 ?auto_36400 ) ) ( not ( = ?auto_36399 ?auto_36401 ) ) ( not ( = ?auto_36408 ?auto_36415 ) ) ( HOIST-AT ?auto_36404 ?auto_36408 ) ( not ( = ?auto_36409 ?auto_36404 ) ) ( SURFACE-AT ?auto_36401 ?auto_36408 ) ( ON ?auto_36401 ?auto_36411 ) ( CLEAR ?auto_36401 ) ( not ( = ?auto_36400 ?auto_36411 ) ) ( not ( = ?auto_36401 ?auto_36411 ) ) ( not ( = ?auto_36399 ?auto_36411 ) ) ( IS-CRATE ?auto_36400 ) ( AVAILABLE ?auto_36404 ) ( SURFACE-AT ?auto_36400 ?auto_36408 ) ( ON ?auto_36400 ?auto_36413 ) ( CLEAR ?auto_36400 ) ( not ( = ?auto_36400 ?auto_36413 ) ) ( not ( = ?auto_36401 ?auto_36413 ) ) ( not ( = ?auto_36399 ?auto_36413 ) ) ( not ( = ?auto_36411 ?auto_36413 ) ) ( IS-CRATE ?auto_36399 ) ( not ( = ?auto_36398 ?auto_36399 ) ) ( not ( = ?auto_36400 ?auto_36398 ) ) ( not ( = ?auto_36401 ?auto_36398 ) ) ( not ( = ?auto_36411 ?auto_36398 ) ) ( not ( = ?auto_36413 ?auto_36398 ) ) ( not ( = ?auto_36403 ?auto_36415 ) ) ( not ( = ?auto_36408 ?auto_36403 ) ) ( HOIST-AT ?auto_36410 ?auto_36403 ) ( not ( = ?auto_36409 ?auto_36410 ) ) ( not ( = ?auto_36404 ?auto_36410 ) ) ( AVAILABLE ?auto_36410 ) ( SURFACE-AT ?auto_36399 ?auto_36403 ) ( ON ?auto_36399 ?auto_36406 ) ( CLEAR ?auto_36399 ) ( not ( = ?auto_36400 ?auto_36406 ) ) ( not ( = ?auto_36401 ?auto_36406 ) ) ( not ( = ?auto_36399 ?auto_36406 ) ) ( not ( = ?auto_36411 ?auto_36406 ) ) ( not ( = ?auto_36413 ?auto_36406 ) ) ( not ( = ?auto_36398 ?auto_36406 ) ) ( IS-CRATE ?auto_36398 ) ( not ( = ?auto_36397 ?auto_36398 ) ) ( not ( = ?auto_36400 ?auto_36397 ) ) ( not ( = ?auto_36401 ?auto_36397 ) ) ( not ( = ?auto_36399 ?auto_36397 ) ) ( not ( = ?auto_36411 ?auto_36397 ) ) ( not ( = ?auto_36413 ?auto_36397 ) ) ( not ( = ?auto_36406 ?auto_36397 ) ) ( not ( = ?auto_36402 ?auto_36415 ) ) ( not ( = ?auto_36408 ?auto_36402 ) ) ( not ( = ?auto_36403 ?auto_36402 ) ) ( HOIST-AT ?auto_36407 ?auto_36402 ) ( not ( = ?auto_36409 ?auto_36407 ) ) ( not ( = ?auto_36404 ?auto_36407 ) ) ( not ( = ?auto_36410 ?auto_36407 ) ) ( AVAILABLE ?auto_36407 ) ( SURFACE-AT ?auto_36398 ?auto_36402 ) ( ON ?auto_36398 ?auto_36405 ) ( CLEAR ?auto_36398 ) ( not ( = ?auto_36400 ?auto_36405 ) ) ( not ( = ?auto_36401 ?auto_36405 ) ) ( not ( = ?auto_36399 ?auto_36405 ) ) ( not ( = ?auto_36411 ?auto_36405 ) ) ( not ( = ?auto_36413 ?auto_36405 ) ) ( not ( = ?auto_36398 ?auto_36405 ) ) ( not ( = ?auto_36406 ?auto_36405 ) ) ( not ( = ?auto_36397 ?auto_36405 ) ) ( TRUCK-AT ?auto_36414 ?auto_36415 ) ( SURFACE-AT ?auto_36412 ?auto_36415 ) ( CLEAR ?auto_36412 ) ( LIFTING ?auto_36409 ?auto_36397 ) ( IS-CRATE ?auto_36397 ) ( not ( = ?auto_36412 ?auto_36397 ) ) ( not ( = ?auto_36400 ?auto_36412 ) ) ( not ( = ?auto_36401 ?auto_36412 ) ) ( not ( = ?auto_36399 ?auto_36412 ) ) ( not ( = ?auto_36411 ?auto_36412 ) ) ( not ( = ?auto_36413 ?auto_36412 ) ) ( not ( = ?auto_36398 ?auto_36412 ) ) ( not ( = ?auto_36406 ?auto_36412 ) ) ( not ( = ?auto_36405 ?auto_36412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36399 ?auto_36400 ?auto_36401 )
      ( MAKE-4CRATE-VERIFY ?auto_36397 ?auto_36398 ?auto_36399 ?auto_36400 ?auto_36401 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36416 - SURFACE
      ?auto_36417 - SURFACE
      ?auto_36418 - SURFACE
      ?auto_36419 - SURFACE
      ?auto_36420 - SURFACE
      ?auto_36421 - SURFACE
    )
    :vars
    (
      ?auto_36429 - HOIST
      ?auto_36434 - PLACE
      ?auto_36428 - PLACE
      ?auto_36424 - HOIST
      ?auto_36431 - SURFACE
      ?auto_36432 - SURFACE
      ?auto_36423 - PLACE
      ?auto_36430 - HOIST
      ?auto_36426 - SURFACE
      ?auto_36422 - PLACE
      ?auto_36427 - HOIST
      ?auto_36425 - SURFACE
      ?auto_36433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36429 ?auto_36434 ) ( IS-CRATE ?auto_36421 ) ( not ( = ?auto_36420 ?auto_36421 ) ) ( not ( = ?auto_36419 ?auto_36420 ) ) ( not ( = ?auto_36419 ?auto_36421 ) ) ( not ( = ?auto_36428 ?auto_36434 ) ) ( HOIST-AT ?auto_36424 ?auto_36428 ) ( not ( = ?auto_36429 ?auto_36424 ) ) ( SURFACE-AT ?auto_36421 ?auto_36428 ) ( ON ?auto_36421 ?auto_36431 ) ( CLEAR ?auto_36421 ) ( not ( = ?auto_36420 ?auto_36431 ) ) ( not ( = ?auto_36421 ?auto_36431 ) ) ( not ( = ?auto_36419 ?auto_36431 ) ) ( IS-CRATE ?auto_36420 ) ( AVAILABLE ?auto_36424 ) ( SURFACE-AT ?auto_36420 ?auto_36428 ) ( ON ?auto_36420 ?auto_36432 ) ( CLEAR ?auto_36420 ) ( not ( = ?auto_36420 ?auto_36432 ) ) ( not ( = ?auto_36421 ?auto_36432 ) ) ( not ( = ?auto_36419 ?auto_36432 ) ) ( not ( = ?auto_36431 ?auto_36432 ) ) ( IS-CRATE ?auto_36419 ) ( not ( = ?auto_36418 ?auto_36419 ) ) ( not ( = ?auto_36420 ?auto_36418 ) ) ( not ( = ?auto_36421 ?auto_36418 ) ) ( not ( = ?auto_36431 ?auto_36418 ) ) ( not ( = ?auto_36432 ?auto_36418 ) ) ( not ( = ?auto_36423 ?auto_36434 ) ) ( not ( = ?auto_36428 ?auto_36423 ) ) ( HOIST-AT ?auto_36430 ?auto_36423 ) ( not ( = ?auto_36429 ?auto_36430 ) ) ( not ( = ?auto_36424 ?auto_36430 ) ) ( AVAILABLE ?auto_36430 ) ( SURFACE-AT ?auto_36419 ?auto_36423 ) ( ON ?auto_36419 ?auto_36426 ) ( CLEAR ?auto_36419 ) ( not ( = ?auto_36420 ?auto_36426 ) ) ( not ( = ?auto_36421 ?auto_36426 ) ) ( not ( = ?auto_36419 ?auto_36426 ) ) ( not ( = ?auto_36431 ?auto_36426 ) ) ( not ( = ?auto_36432 ?auto_36426 ) ) ( not ( = ?auto_36418 ?auto_36426 ) ) ( IS-CRATE ?auto_36418 ) ( not ( = ?auto_36417 ?auto_36418 ) ) ( not ( = ?auto_36420 ?auto_36417 ) ) ( not ( = ?auto_36421 ?auto_36417 ) ) ( not ( = ?auto_36419 ?auto_36417 ) ) ( not ( = ?auto_36431 ?auto_36417 ) ) ( not ( = ?auto_36432 ?auto_36417 ) ) ( not ( = ?auto_36426 ?auto_36417 ) ) ( not ( = ?auto_36422 ?auto_36434 ) ) ( not ( = ?auto_36428 ?auto_36422 ) ) ( not ( = ?auto_36423 ?auto_36422 ) ) ( HOIST-AT ?auto_36427 ?auto_36422 ) ( not ( = ?auto_36429 ?auto_36427 ) ) ( not ( = ?auto_36424 ?auto_36427 ) ) ( not ( = ?auto_36430 ?auto_36427 ) ) ( AVAILABLE ?auto_36427 ) ( SURFACE-AT ?auto_36418 ?auto_36422 ) ( ON ?auto_36418 ?auto_36425 ) ( CLEAR ?auto_36418 ) ( not ( = ?auto_36420 ?auto_36425 ) ) ( not ( = ?auto_36421 ?auto_36425 ) ) ( not ( = ?auto_36419 ?auto_36425 ) ) ( not ( = ?auto_36431 ?auto_36425 ) ) ( not ( = ?auto_36432 ?auto_36425 ) ) ( not ( = ?auto_36418 ?auto_36425 ) ) ( not ( = ?auto_36426 ?auto_36425 ) ) ( not ( = ?auto_36417 ?auto_36425 ) ) ( TRUCK-AT ?auto_36433 ?auto_36434 ) ( SURFACE-AT ?auto_36416 ?auto_36434 ) ( CLEAR ?auto_36416 ) ( LIFTING ?auto_36429 ?auto_36417 ) ( IS-CRATE ?auto_36417 ) ( not ( = ?auto_36416 ?auto_36417 ) ) ( not ( = ?auto_36420 ?auto_36416 ) ) ( not ( = ?auto_36421 ?auto_36416 ) ) ( not ( = ?auto_36419 ?auto_36416 ) ) ( not ( = ?auto_36431 ?auto_36416 ) ) ( not ( = ?auto_36432 ?auto_36416 ) ) ( not ( = ?auto_36418 ?auto_36416 ) ) ( not ( = ?auto_36426 ?auto_36416 ) ) ( not ( = ?auto_36425 ?auto_36416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36419 ?auto_36420 ?auto_36421 )
      ( MAKE-5CRATE-VERIFY ?auto_36416 ?auto_36417 ?auto_36418 ?auto_36419 ?auto_36420 ?auto_36421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36435 - SURFACE
      ?auto_36436 - SURFACE
    )
    :vars
    (
      ?auto_36445 - HOIST
      ?auto_36452 - PLACE
      ?auto_36453 - SURFACE
      ?auto_36444 - PLACE
      ?auto_36439 - HOIST
      ?auto_36447 - SURFACE
      ?auto_36450 - SURFACE
      ?auto_36448 - SURFACE
      ?auto_36438 - PLACE
      ?auto_36446 - HOIST
      ?auto_36442 - SURFACE
      ?auto_36440 - SURFACE
      ?auto_36437 - PLACE
      ?auto_36443 - HOIST
      ?auto_36441 - SURFACE
      ?auto_36451 - TRUCK
      ?auto_36449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36445 ?auto_36452 ) ( IS-CRATE ?auto_36436 ) ( not ( = ?auto_36435 ?auto_36436 ) ) ( not ( = ?auto_36453 ?auto_36435 ) ) ( not ( = ?auto_36453 ?auto_36436 ) ) ( not ( = ?auto_36444 ?auto_36452 ) ) ( HOIST-AT ?auto_36439 ?auto_36444 ) ( not ( = ?auto_36445 ?auto_36439 ) ) ( SURFACE-AT ?auto_36436 ?auto_36444 ) ( ON ?auto_36436 ?auto_36447 ) ( CLEAR ?auto_36436 ) ( not ( = ?auto_36435 ?auto_36447 ) ) ( not ( = ?auto_36436 ?auto_36447 ) ) ( not ( = ?auto_36453 ?auto_36447 ) ) ( IS-CRATE ?auto_36435 ) ( AVAILABLE ?auto_36439 ) ( SURFACE-AT ?auto_36435 ?auto_36444 ) ( ON ?auto_36435 ?auto_36450 ) ( CLEAR ?auto_36435 ) ( not ( = ?auto_36435 ?auto_36450 ) ) ( not ( = ?auto_36436 ?auto_36450 ) ) ( not ( = ?auto_36453 ?auto_36450 ) ) ( not ( = ?auto_36447 ?auto_36450 ) ) ( IS-CRATE ?auto_36453 ) ( not ( = ?auto_36448 ?auto_36453 ) ) ( not ( = ?auto_36435 ?auto_36448 ) ) ( not ( = ?auto_36436 ?auto_36448 ) ) ( not ( = ?auto_36447 ?auto_36448 ) ) ( not ( = ?auto_36450 ?auto_36448 ) ) ( not ( = ?auto_36438 ?auto_36452 ) ) ( not ( = ?auto_36444 ?auto_36438 ) ) ( HOIST-AT ?auto_36446 ?auto_36438 ) ( not ( = ?auto_36445 ?auto_36446 ) ) ( not ( = ?auto_36439 ?auto_36446 ) ) ( AVAILABLE ?auto_36446 ) ( SURFACE-AT ?auto_36453 ?auto_36438 ) ( ON ?auto_36453 ?auto_36442 ) ( CLEAR ?auto_36453 ) ( not ( = ?auto_36435 ?auto_36442 ) ) ( not ( = ?auto_36436 ?auto_36442 ) ) ( not ( = ?auto_36453 ?auto_36442 ) ) ( not ( = ?auto_36447 ?auto_36442 ) ) ( not ( = ?auto_36450 ?auto_36442 ) ) ( not ( = ?auto_36448 ?auto_36442 ) ) ( IS-CRATE ?auto_36448 ) ( not ( = ?auto_36440 ?auto_36448 ) ) ( not ( = ?auto_36435 ?auto_36440 ) ) ( not ( = ?auto_36436 ?auto_36440 ) ) ( not ( = ?auto_36453 ?auto_36440 ) ) ( not ( = ?auto_36447 ?auto_36440 ) ) ( not ( = ?auto_36450 ?auto_36440 ) ) ( not ( = ?auto_36442 ?auto_36440 ) ) ( not ( = ?auto_36437 ?auto_36452 ) ) ( not ( = ?auto_36444 ?auto_36437 ) ) ( not ( = ?auto_36438 ?auto_36437 ) ) ( HOIST-AT ?auto_36443 ?auto_36437 ) ( not ( = ?auto_36445 ?auto_36443 ) ) ( not ( = ?auto_36439 ?auto_36443 ) ) ( not ( = ?auto_36446 ?auto_36443 ) ) ( AVAILABLE ?auto_36443 ) ( SURFACE-AT ?auto_36448 ?auto_36437 ) ( ON ?auto_36448 ?auto_36441 ) ( CLEAR ?auto_36448 ) ( not ( = ?auto_36435 ?auto_36441 ) ) ( not ( = ?auto_36436 ?auto_36441 ) ) ( not ( = ?auto_36453 ?auto_36441 ) ) ( not ( = ?auto_36447 ?auto_36441 ) ) ( not ( = ?auto_36450 ?auto_36441 ) ) ( not ( = ?auto_36448 ?auto_36441 ) ) ( not ( = ?auto_36442 ?auto_36441 ) ) ( not ( = ?auto_36440 ?auto_36441 ) ) ( TRUCK-AT ?auto_36451 ?auto_36452 ) ( SURFACE-AT ?auto_36449 ?auto_36452 ) ( CLEAR ?auto_36449 ) ( IS-CRATE ?auto_36440 ) ( not ( = ?auto_36449 ?auto_36440 ) ) ( not ( = ?auto_36435 ?auto_36449 ) ) ( not ( = ?auto_36436 ?auto_36449 ) ) ( not ( = ?auto_36453 ?auto_36449 ) ) ( not ( = ?auto_36447 ?auto_36449 ) ) ( not ( = ?auto_36450 ?auto_36449 ) ) ( not ( = ?auto_36448 ?auto_36449 ) ) ( not ( = ?auto_36442 ?auto_36449 ) ) ( not ( = ?auto_36441 ?auto_36449 ) ) ( AVAILABLE ?auto_36445 ) ( IN ?auto_36440 ?auto_36451 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36445 ?auto_36440 ?auto_36451 ?auto_36452 )
      ( MAKE-2CRATE ?auto_36453 ?auto_36435 ?auto_36436 )
      ( MAKE-1CRATE-VERIFY ?auto_36435 ?auto_36436 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36454 - SURFACE
      ?auto_36455 - SURFACE
      ?auto_36456 - SURFACE
    )
    :vars
    (
      ?auto_36461 - HOIST
      ?auto_36468 - PLACE
      ?auto_36462 - PLACE
      ?auto_36471 - HOIST
      ?auto_36466 - SURFACE
      ?auto_36460 - SURFACE
      ?auto_36472 - SURFACE
      ?auto_36465 - PLACE
      ?auto_36457 - HOIST
      ?auto_36464 - SURFACE
      ?auto_36463 - SURFACE
      ?auto_36469 - PLACE
      ?auto_36467 - HOIST
      ?auto_36459 - SURFACE
      ?auto_36470 - TRUCK
      ?auto_36458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36461 ?auto_36468 ) ( IS-CRATE ?auto_36456 ) ( not ( = ?auto_36455 ?auto_36456 ) ) ( not ( = ?auto_36454 ?auto_36455 ) ) ( not ( = ?auto_36454 ?auto_36456 ) ) ( not ( = ?auto_36462 ?auto_36468 ) ) ( HOIST-AT ?auto_36471 ?auto_36462 ) ( not ( = ?auto_36461 ?auto_36471 ) ) ( SURFACE-AT ?auto_36456 ?auto_36462 ) ( ON ?auto_36456 ?auto_36466 ) ( CLEAR ?auto_36456 ) ( not ( = ?auto_36455 ?auto_36466 ) ) ( not ( = ?auto_36456 ?auto_36466 ) ) ( not ( = ?auto_36454 ?auto_36466 ) ) ( IS-CRATE ?auto_36455 ) ( AVAILABLE ?auto_36471 ) ( SURFACE-AT ?auto_36455 ?auto_36462 ) ( ON ?auto_36455 ?auto_36460 ) ( CLEAR ?auto_36455 ) ( not ( = ?auto_36455 ?auto_36460 ) ) ( not ( = ?auto_36456 ?auto_36460 ) ) ( not ( = ?auto_36454 ?auto_36460 ) ) ( not ( = ?auto_36466 ?auto_36460 ) ) ( IS-CRATE ?auto_36454 ) ( not ( = ?auto_36472 ?auto_36454 ) ) ( not ( = ?auto_36455 ?auto_36472 ) ) ( not ( = ?auto_36456 ?auto_36472 ) ) ( not ( = ?auto_36466 ?auto_36472 ) ) ( not ( = ?auto_36460 ?auto_36472 ) ) ( not ( = ?auto_36465 ?auto_36468 ) ) ( not ( = ?auto_36462 ?auto_36465 ) ) ( HOIST-AT ?auto_36457 ?auto_36465 ) ( not ( = ?auto_36461 ?auto_36457 ) ) ( not ( = ?auto_36471 ?auto_36457 ) ) ( AVAILABLE ?auto_36457 ) ( SURFACE-AT ?auto_36454 ?auto_36465 ) ( ON ?auto_36454 ?auto_36464 ) ( CLEAR ?auto_36454 ) ( not ( = ?auto_36455 ?auto_36464 ) ) ( not ( = ?auto_36456 ?auto_36464 ) ) ( not ( = ?auto_36454 ?auto_36464 ) ) ( not ( = ?auto_36466 ?auto_36464 ) ) ( not ( = ?auto_36460 ?auto_36464 ) ) ( not ( = ?auto_36472 ?auto_36464 ) ) ( IS-CRATE ?auto_36472 ) ( not ( = ?auto_36463 ?auto_36472 ) ) ( not ( = ?auto_36455 ?auto_36463 ) ) ( not ( = ?auto_36456 ?auto_36463 ) ) ( not ( = ?auto_36454 ?auto_36463 ) ) ( not ( = ?auto_36466 ?auto_36463 ) ) ( not ( = ?auto_36460 ?auto_36463 ) ) ( not ( = ?auto_36464 ?auto_36463 ) ) ( not ( = ?auto_36469 ?auto_36468 ) ) ( not ( = ?auto_36462 ?auto_36469 ) ) ( not ( = ?auto_36465 ?auto_36469 ) ) ( HOIST-AT ?auto_36467 ?auto_36469 ) ( not ( = ?auto_36461 ?auto_36467 ) ) ( not ( = ?auto_36471 ?auto_36467 ) ) ( not ( = ?auto_36457 ?auto_36467 ) ) ( AVAILABLE ?auto_36467 ) ( SURFACE-AT ?auto_36472 ?auto_36469 ) ( ON ?auto_36472 ?auto_36459 ) ( CLEAR ?auto_36472 ) ( not ( = ?auto_36455 ?auto_36459 ) ) ( not ( = ?auto_36456 ?auto_36459 ) ) ( not ( = ?auto_36454 ?auto_36459 ) ) ( not ( = ?auto_36466 ?auto_36459 ) ) ( not ( = ?auto_36460 ?auto_36459 ) ) ( not ( = ?auto_36472 ?auto_36459 ) ) ( not ( = ?auto_36464 ?auto_36459 ) ) ( not ( = ?auto_36463 ?auto_36459 ) ) ( TRUCK-AT ?auto_36470 ?auto_36468 ) ( SURFACE-AT ?auto_36458 ?auto_36468 ) ( CLEAR ?auto_36458 ) ( IS-CRATE ?auto_36463 ) ( not ( = ?auto_36458 ?auto_36463 ) ) ( not ( = ?auto_36455 ?auto_36458 ) ) ( not ( = ?auto_36456 ?auto_36458 ) ) ( not ( = ?auto_36454 ?auto_36458 ) ) ( not ( = ?auto_36466 ?auto_36458 ) ) ( not ( = ?auto_36460 ?auto_36458 ) ) ( not ( = ?auto_36472 ?auto_36458 ) ) ( not ( = ?auto_36464 ?auto_36458 ) ) ( not ( = ?auto_36459 ?auto_36458 ) ) ( AVAILABLE ?auto_36461 ) ( IN ?auto_36463 ?auto_36470 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36455 ?auto_36456 )
      ( MAKE-2CRATE-VERIFY ?auto_36454 ?auto_36455 ?auto_36456 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36473 - SURFACE
      ?auto_36474 - SURFACE
      ?auto_36475 - SURFACE
      ?auto_36476 - SURFACE
    )
    :vars
    (
      ?auto_36484 - HOIST
      ?auto_36481 - PLACE
      ?auto_36480 - PLACE
      ?auto_36483 - HOIST
      ?auto_36491 - SURFACE
      ?auto_36488 - SURFACE
      ?auto_36482 - PLACE
      ?auto_36479 - HOIST
      ?auto_36489 - SURFACE
      ?auto_36486 - SURFACE
      ?auto_36487 - PLACE
      ?auto_36490 - HOIST
      ?auto_36485 - SURFACE
      ?auto_36478 - TRUCK
      ?auto_36477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36484 ?auto_36481 ) ( IS-CRATE ?auto_36476 ) ( not ( = ?auto_36475 ?auto_36476 ) ) ( not ( = ?auto_36474 ?auto_36475 ) ) ( not ( = ?auto_36474 ?auto_36476 ) ) ( not ( = ?auto_36480 ?auto_36481 ) ) ( HOIST-AT ?auto_36483 ?auto_36480 ) ( not ( = ?auto_36484 ?auto_36483 ) ) ( SURFACE-AT ?auto_36476 ?auto_36480 ) ( ON ?auto_36476 ?auto_36491 ) ( CLEAR ?auto_36476 ) ( not ( = ?auto_36475 ?auto_36491 ) ) ( not ( = ?auto_36476 ?auto_36491 ) ) ( not ( = ?auto_36474 ?auto_36491 ) ) ( IS-CRATE ?auto_36475 ) ( AVAILABLE ?auto_36483 ) ( SURFACE-AT ?auto_36475 ?auto_36480 ) ( ON ?auto_36475 ?auto_36488 ) ( CLEAR ?auto_36475 ) ( not ( = ?auto_36475 ?auto_36488 ) ) ( not ( = ?auto_36476 ?auto_36488 ) ) ( not ( = ?auto_36474 ?auto_36488 ) ) ( not ( = ?auto_36491 ?auto_36488 ) ) ( IS-CRATE ?auto_36474 ) ( not ( = ?auto_36473 ?auto_36474 ) ) ( not ( = ?auto_36475 ?auto_36473 ) ) ( not ( = ?auto_36476 ?auto_36473 ) ) ( not ( = ?auto_36491 ?auto_36473 ) ) ( not ( = ?auto_36488 ?auto_36473 ) ) ( not ( = ?auto_36482 ?auto_36481 ) ) ( not ( = ?auto_36480 ?auto_36482 ) ) ( HOIST-AT ?auto_36479 ?auto_36482 ) ( not ( = ?auto_36484 ?auto_36479 ) ) ( not ( = ?auto_36483 ?auto_36479 ) ) ( AVAILABLE ?auto_36479 ) ( SURFACE-AT ?auto_36474 ?auto_36482 ) ( ON ?auto_36474 ?auto_36489 ) ( CLEAR ?auto_36474 ) ( not ( = ?auto_36475 ?auto_36489 ) ) ( not ( = ?auto_36476 ?auto_36489 ) ) ( not ( = ?auto_36474 ?auto_36489 ) ) ( not ( = ?auto_36491 ?auto_36489 ) ) ( not ( = ?auto_36488 ?auto_36489 ) ) ( not ( = ?auto_36473 ?auto_36489 ) ) ( IS-CRATE ?auto_36473 ) ( not ( = ?auto_36486 ?auto_36473 ) ) ( not ( = ?auto_36475 ?auto_36486 ) ) ( not ( = ?auto_36476 ?auto_36486 ) ) ( not ( = ?auto_36474 ?auto_36486 ) ) ( not ( = ?auto_36491 ?auto_36486 ) ) ( not ( = ?auto_36488 ?auto_36486 ) ) ( not ( = ?auto_36489 ?auto_36486 ) ) ( not ( = ?auto_36487 ?auto_36481 ) ) ( not ( = ?auto_36480 ?auto_36487 ) ) ( not ( = ?auto_36482 ?auto_36487 ) ) ( HOIST-AT ?auto_36490 ?auto_36487 ) ( not ( = ?auto_36484 ?auto_36490 ) ) ( not ( = ?auto_36483 ?auto_36490 ) ) ( not ( = ?auto_36479 ?auto_36490 ) ) ( AVAILABLE ?auto_36490 ) ( SURFACE-AT ?auto_36473 ?auto_36487 ) ( ON ?auto_36473 ?auto_36485 ) ( CLEAR ?auto_36473 ) ( not ( = ?auto_36475 ?auto_36485 ) ) ( not ( = ?auto_36476 ?auto_36485 ) ) ( not ( = ?auto_36474 ?auto_36485 ) ) ( not ( = ?auto_36491 ?auto_36485 ) ) ( not ( = ?auto_36488 ?auto_36485 ) ) ( not ( = ?auto_36473 ?auto_36485 ) ) ( not ( = ?auto_36489 ?auto_36485 ) ) ( not ( = ?auto_36486 ?auto_36485 ) ) ( TRUCK-AT ?auto_36478 ?auto_36481 ) ( SURFACE-AT ?auto_36477 ?auto_36481 ) ( CLEAR ?auto_36477 ) ( IS-CRATE ?auto_36486 ) ( not ( = ?auto_36477 ?auto_36486 ) ) ( not ( = ?auto_36475 ?auto_36477 ) ) ( not ( = ?auto_36476 ?auto_36477 ) ) ( not ( = ?auto_36474 ?auto_36477 ) ) ( not ( = ?auto_36491 ?auto_36477 ) ) ( not ( = ?auto_36488 ?auto_36477 ) ) ( not ( = ?auto_36473 ?auto_36477 ) ) ( not ( = ?auto_36489 ?auto_36477 ) ) ( not ( = ?auto_36485 ?auto_36477 ) ) ( AVAILABLE ?auto_36484 ) ( IN ?auto_36486 ?auto_36478 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36474 ?auto_36475 ?auto_36476 )
      ( MAKE-3CRATE-VERIFY ?auto_36473 ?auto_36474 ?auto_36475 ?auto_36476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36492 - SURFACE
      ?auto_36493 - SURFACE
      ?auto_36494 - SURFACE
      ?auto_36495 - SURFACE
      ?auto_36496 - SURFACE
    )
    :vars
    (
      ?auto_36504 - HOIST
      ?auto_36501 - PLACE
      ?auto_36500 - PLACE
      ?auto_36503 - HOIST
      ?auto_36510 - SURFACE
      ?auto_36507 - SURFACE
      ?auto_36502 - PLACE
      ?auto_36499 - HOIST
      ?auto_36508 - SURFACE
      ?auto_36506 - PLACE
      ?auto_36509 - HOIST
      ?auto_36505 - SURFACE
      ?auto_36498 - TRUCK
      ?auto_36497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36504 ?auto_36501 ) ( IS-CRATE ?auto_36496 ) ( not ( = ?auto_36495 ?auto_36496 ) ) ( not ( = ?auto_36494 ?auto_36495 ) ) ( not ( = ?auto_36494 ?auto_36496 ) ) ( not ( = ?auto_36500 ?auto_36501 ) ) ( HOIST-AT ?auto_36503 ?auto_36500 ) ( not ( = ?auto_36504 ?auto_36503 ) ) ( SURFACE-AT ?auto_36496 ?auto_36500 ) ( ON ?auto_36496 ?auto_36510 ) ( CLEAR ?auto_36496 ) ( not ( = ?auto_36495 ?auto_36510 ) ) ( not ( = ?auto_36496 ?auto_36510 ) ) ( not ( = ?auto_36494 ?auto_36510 ) ) ( IS-CRATE ?auto_36495 ) ( AVAILABLE ?auto_36503 ) ( SURFACE-AT ?auto_36495 ?auto_36500 ) ( ON ?auto_36495 ?auto_36507 ) ( CLEAR ?auto_36495 ) ( not ( = ?auto_36495 ?auto_36507 ) ) ( not ( = ?auto_36496 ?auto_36507 ) ) ( not ( = ?auto_36494 ?auto_36507 ) ) ( not ( = ?auto_36510 ?auto_36507 ) ) ( IS-CRATE ?auto_36494 ) ( not ( = ?auto_36493 ?auto_36494 ) ) ( not ( = ?auto_36495 ?auto_36493 ) ) ( not ( = ?auto_36496 ?auto_36493 ) ) ( not ( = ?auto_36510 ?auto_36493 ) ) ( not ( = ?auto_36507 ?auto_36493 ) ) ( not ( = ?auto_36502 ?auto_36501 ) ) ( not ( = ?auto_36500 ?auto_36502 ) ) ( HOIST-AT ?auto_36499 ?auto_36502 ) ( not ( = ?auto_36504 ?auto_36499 ) ) ( not ( = ?auto_36503 ?auto_36499 ) ) ( AVAILABLE ?auto_36499 ) ( SURFACE-AT ?auto_36494 ?auto_36502 ) ( ON ?auto_36494 ?auto_36508 ) ( CLEAR ?auto_36494 ) ( not ( = ?auto_36495 ?auto_36508 ) ) ( not ( = ?auto_36496 ?auto_36508 ) ) ( not ( = ?auto_36494 ?auto_36508 ) ) ( not ( = ?auto_36510 ?auto_36508 ) ) ( not ( = ?auto_36507 ?auto_36508 ) ) ( not ( = ?auto_36493 ?auto_36508 ) ) ( IS-CRATE ?auto_36493 ) ( not ( = ?auto_36492 ?auto_36493 ) ) ( not ( = ?auto_36495 ?auto_36492 ) ) ( not ( = ?auto_36496 ?auto_36492 ) ) ( not ( = ?auto_36494 ?auto_36492 ) ) ( not ( = ?auto_36510 ?auto_36492 ) ) ( not ( = ?auto_36507 ?auto_36492 ) ) ( not ( = ?auto_36508 ?auto_36492 ) ) ( not ( = ?auto_36506 ?auto_36501 ) ) ( not ( = ?auto_36500 ?auto_36506 ) ) ( not ( = ?auto_36502 ?auto_36506 ) ) ( HOIST-AT ?auto_36509 ?auto_36506 ) ( not ( = ?auto_36504 ?auto_36509 ) ) ( not ( = ?auto_36503 ?auto_36509 ) ) ( not ( = ?auto_36499 ?auto_36509 ) ) ( AVAILABLE ?auto_36509 ) ( SURFACE-AT ?auto_36493 ?auto_36506 ) ( ON ?auto_36493 ?auto_36505 ) ( CLEAR ?auto_36493 ) ( not ( = ?auto_36495 ?auto_36505 ) ) ( not ( = ?auto_36496 ?auto_36505 ) ) ( not ( = ?auto_36494 ?auto_36505 ) ) ( not ( = ?auto_36510 ?auto_36505 ) ) ( not ( = ?auto_36507 ?auto_36505 ) ) ( not ( = ?auto_36493 ?auto_36505 ) ) ( not ( = ?auto_36508 ?auto_36505 ) ) ( not ( = ?auto_36492 ?auto_36505 ) ) ( TRUCK-AT ?auto_36498 ?auto_36501 ) ( SURFACE-AT ?auto_36497 ?auto_36501 ) ( CLEAR ?auto_36497 ) ( IS-CRATE ?auto_36492 ) ( not ( = ?auto_36497 ?auto_36492 ) ) ( not ( = ?auto_36495 ?auto_36497 ) ) ( not ( = ?auto_36496 ?auto_36497 ) ) ( not ( = ?auto_36494 ?auto_36497 ) ) ( not ( = ?auto_36510 ?auto_36497 ) ) ( not ( = ?auto_36507 ?auto_36497 ) ) ( not ( = ?auto_36493 ?auto_36497 ) ) ( not ( = ?auto_36508 ?auto_36497 ) ) ( not ( = ?auto_36505 ?auto_36497 ) ) ( AVAILABLE ?auto_36504 ) ( IN ?auto_36492 ?auto_36498 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36494 ?auto_36495 ?auto_36496 )
      ( MAKE-4CRATE-VERIFY ?auto_36492 ?auto_36493 ?auto_36494 ?auto_36495 ?auto_36496 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36511 - SURFACE
      ?auto_36512 - SURFACE
      ?auto_36513 - SURFACE
      ?auto_36514 - SURFACE
      ?auto_36515 - SURFACE
      ?auto_36516 - SURFACE
    )
    :vars
    (
      ?auto_36523 - HOIST
      ?auto_36520 - PLACE
      ?auto_36519 - PLACE
      ?auto_36522 - HOIST
      ?auto_36529 - SURFACE
      ?auto_36526 - SURFACE
      ?auto_36521 - PLACE
      ?auto_36518 - HOIST
      ?auto_36527 - SURFACE
      ?auto_36525 - PLACE
      ?auto_36528 - HOIST
      ?auto_36524 - SURFACE
      ?auto_36517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36523 ?auto_36520 ) ( IS-CRATE ?auto_36516 ) ( not ( = ?auto_36515 ?auto_36516 ) ) ( not ( = ?auto_36514 ?auto_36515 ) ) ( not ( = ?auto_36514 ?auto_36516 ) ) ( not ( = ?auto_36519 ?auto_36520 ) ) ( HOIST-AT ?auto_36522 ?auto_36519 ) ( not ( = ?auto_36523 ?auto_36522 ) ) ( SURFACE-AT ?auto_36516 ?auto_36519 ) ( ON ?auto_36516 ?auto_36529 ) ( CLEAR ?auto_36516 ) ( not ( = ?auto_36515 ?auto_36529 ) ) ( not ( = ?auto_36516 ?auto_36529 ) ) ( not ( = ?auto_36514 ?auto_36529 ) ) ( IS-CRATE ?auto_36515 ) ( AVAILABLE ?auto_36522 ) ( SURFACE-AT ?auto_36515 ?auto_36519 ) ( ON ?auto_36515 ?auto_36526 ) ( CLEAR ?auto_36515 ) ( not ( = ?auto_36515 ?auto_36526 ) ) ( not ( = ?auto_36516 ?auto_36526 ) ) ( not ( = ?auto_36514 ?auto_36526 ) ) ( not ( = ?auto_36529 ?auto_36526 ) ) ( IS-CRATE ?auto_36514 ) ( not ( = ?auto_36513 ?auto_36514 ) ) ( not ( = ?auto_36515 ?auto_36513 ) ) ( not ( = ?auto_36516 ?auto_36513 ) ) ( not ( = ?auto_36529 ?auto_36513 ) ) ( not ( = ?auto_36526 ?auto_36513 ) ) ( not ( = ?auto_36521 ?auto_36520 ) ) ( not ( = ?auto_36519 ?auto_36521 ) ) ( HOIST-AT ?auto_36518 ?auto_36521 ) ( not ( = ?auto_36523 ?auto_36518 ) ) ( not ( = ?auto_36522 ?auto_36518 ) ) ( AVAILABLE ?auto_36518 ) ( SURFACE-AT ?auto_36514 ?auto_36521 ) ( ON ?auto_36514 ?auto_36527 ) ( CLEAR ?auto_36514 ) ( not ( = ?auto_36515 ?auto_36527 ) ) ( not ( = ?auto_36516 ?auto_36527 ) ) ( not ( = ?auto_36514 ?auto_36527 ) ) ( not ( = ?auto_36529 ?auto_36527 ) ) ( not ( = ?auto_36526 ?auto_36527 ) ) ( not ( = ?auto_36513 ?auto_36527 ) ) ( IS-CRATE ?auto_36513 ) ( not ( = ?auto_36512 ?auto_36513 ) ) ( not ( = ?auto_36515 ?auto_36512 ) ) ( not ( = ?auto_36516 ?auto_36512 ) ) ( not ( = ?auto_36514 ?auto_36512 ) ) ( not ( = ?auto_36529 ?auto_36512 ) ) ( not ( = ?auto_36526 ?auto_36512 ) ) ( not ( = ?auto_36527 ?auto_36512 ) ) ( not ( = ?auto_36525 ?auto_36520 ) ) ( not ( = ?auto_36519 ?auto_36525 ) ) ( not ( = ?auto_36521 ?auto_36525 ) ) ( HOIST-AT ?auto_36528 ?auto_36525 ) ( not ( = ?auto_36523 ?auto_36528 ) ) ( not ( = ?auto_36522 ?auto_36528 ) ) ( not ( = ?auto_36518 ?auto_36528 ) ) ( AVAILABLE ?auto_36528 ) ( SURFACE-AT ?auto_36513 ?auto_36525 ) ( ON ?auto_36513 ?auto_36524 ) ( CLEAR ?auto_36513 ) ( not ( = ?auto_36515 ?auto_36524 ) ) ( not ( = ?auto_36516 ?auto_36524 ) ) ( not ( = ?auto_36514 ?auto_36524 ) ) ( not ( = ?auto_36529 ?auto_36524 ) ) ( not ( = ?auto_36526 ?auto_36524 ) ) ( not ( = ?auto_36513 ?auto_36524 ) ) ( not ( = ?auto_36527 ?auto_36524 ) ) ( not ( = ?auto_36512 ?auto_36524 ) ) ( TRUCK-AT ?auto_36517 ?auto_36520 ) ( SURFACE-AT ?auto_36511 ?auto_36520 ) ( CLEAR ?auto_36511 ) ( IS-CRATE ?auto_36512 ) ( not ( = ?auto_36511 ?auto_36512 ) ) ( not ( = ?auto_36515 ?auto_36511 ) ) ( not ( = ?auto_36516 ?auto_36511 ) ) ( not ( = ?auto_36514 ?auto_36511 ) ) ( not ( = ?auto_36529 ?auto_36511 ) ) ( not ( = ?auto_36526 ?auto_36511 ) ) ( not ( = ?auto_36513 ?auto_36511 ) ) ( not ( = ?auto_36527 ?auto_36511 ) ) ( not ( = ?auto_36524 ?auto_36511 ) ) ( AVAILABLE ?auto_36523 ) ( IN ?auto_36512 ?auto_36517 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36514 ?auto_36515 ?auto_36516 )
      ( MAKE-5CRATE-VERIFY ?auto_36511 ?auto_36512 ?auto_36513 ?auto_36514 ?auto_36515 ?auto_36516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36530 - SURFACE
      ?auto_36531 - SURFACE
    )
    :vars
    (
      ?auto_36540 - HOIST
      ?auto_36537 - PLACE
      ?auto_36546 - SURFACE
      ?auto_36536 - PLACE
      ?auto_36539 - HOIST
      ?auto_36548 - SURFACE
      ?auto_36544 - SURFACE
      ?auto_36535 - SURFACE
      ?auto_36538 - PLACE
      ?auto_36534 - HOIST
      ?auto_36545 - SURFACE
      ?auto_36542 - SURFACE
      ?auto_36543 - PLACE
      ?auto_36547 - HOIST
      ?auto_36541 - SURFACE
      ?auto_36532 - SURFACE
      ?auto_36533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36540 ?auto_36537 ) ( IS-CRATE ?auto_36531 ) ( not ( = ?auto_36530 ?auto_36531 ) ) ( not ( = ?auto_36546 ?auto_36530 ) ) ( not ( = ?auto_36546 ?auto_36531 ) ) ( not ( = ?auto_36536 ?auto_36537 ) ) ( HOIST-AT ?auto_36539 ?auto_36536 ) ( not ( = ?auto_36540 ?auto_36539 ) ) ( SURFACE-AT ?auto_36531 ?auto_36536 ) ( ON ?auto_36531 ?auto_36548 ) ( CLEAR ?auto_36531 ) ( not ( = ?auto_36530 ?auto_36548 ) ) ( not ( = ?auto_36531 ?auto_36548 ) ) ( not ( = ?auto_36546 ?auto_36548 ) ) ( IS-CRATE ?auto_36530 ) ( AVAILABLE ?auto_36539 ) ( SURFACE-AT ?auto_36530 ?auto_36536 ) ( ON ?auto_36530 ?auto_36544 ) ( CLEAR ?auto_36530 ) ( not ( = ?auto_36530 ?auto_36544 ) ) ( not ( = ?auto_36531 ?auto_36544 ) ) ( not ( = ?auto_36546 ?auto_36544 ) ) ( not ( = ?auto_36548 ?auto_36544 ) ) ( IS-CRATE ?auto_36546 ) ( not ( = ?auto_36535 ?auto_36546 ) ) ( not ( = ?auto_36530 ?auto_36535 ) ) ( not ( = ?auto_36531 ?auto_36535 ) ) ( not ( = ?auto_36548 ?auto_36535 ) ) ( not ( = ?auto_36544 ?auto_36535 ) ) ( not ( = ?auto_36538 ?auto_36537 ) ) ( not ( = ?auto_36536 ?auto_36538 ) ) ( HOIST-AT ?auto_36534 ?auto_36538 ) ( not ( = ?auto_36540 ?auto_36534 ) ) ( not ( = ?auto_36539 ?auto_36534 ) ) ( AVAILABLE ?auto_36534 ) ( SURFACE-AT ?auto_36546 ?auto_36538 ) ( ON ?auto_36546 ?auto_36545 ) ( CLEAR ?auto_36546 ) ( not ( = ?auto_36530 ?auto_36545 ) ) ( not ( = ?auto_36531 ?auto_36545 ) ) ( not ( = ?auto_36546 ?auto_36545 ) ) ( not ( = ?auto_36548 ?auto_36545 ) ) ( not ( = ?auto_36544 ?auto_36545 ) ) ( not ( = ?auto_36535 ?auto_36545 ) ) ( IS-CRATE ?auto_36535 ) ( not ( = ?auto_36542 ?auto_36535 ) ) ( not ( = ?auto_36530 ?auto_36542 ) ) ( not ( = ?auto_36531 ?auto_36542 ) ) ( not ( = ?auto_36546 ?auto_36542 ) ) ( not ( = ?auto_36548 ?auto_36542 ) ) ( not ( = ?auto_36544 ?auto_36542 ) ) ( not ( = ?auto_36545 ?auto_36542 ) ) ( not ( = ?auto_36543 ?auto_36537 ) ) ( not ( = ?auto_36536 ?auto_36543 ) ) ( not ( = ?auto_36538 ?auto_36543 ) ) ( HOIST-AT ?auto_36547 ?auto_36543 ) ( not ( = ?auto_36540 ?auto_36547 ) ) ( not ( = ?auto_36539 ?auto_36547 ) ) ( not ( = ?auto_36534 ?auto_36547 ) ) ( AVAILABLE ?auto_36547 ) ( SURFACE-AT ?auto_36535 ?auto_36543 ) ( ON ?auto_36535 ?auto_36541 ) ( CLEAR ?auto_36535 ) ( not ( = ?auto_36530 ?auto_36541 ) ) ( not ( = ?auto_36531 ?auto_36541 ) ) ( not ( = ?auto_36546 ?auto_36541 ) ) ( not ( = ?auto_36548 ?auto_36541 ) ) ( not ( = ?auto_36544 ?auto_36541 ) ) ( not ( = ?auto_36535 ?auto_36541 ) ) ( not ( = ?auto_36545 ?auto_36541 ) ) ( not ( = ?auto_36542 ?auto_36541 ) ) ( SURFACE-AT ?auto_36532 ?auto_36537 ) ( CLEAR ?auto_36532 ) ( IS-CRATE ?auto_36542 ) ( not ( = ?auto_36532 ?auto_36542 ) ) ( not ( = ?auto_36530 ?auto_36532 ) ) ( not ( = ?auto_36531 ?auto_36532 ) ) ( not ( = ?auto_36546 ?auto_36532 ) ) ( not ( = ?auto_36548 ?auto_36532 ) ) ( not ( = ?auto_36544 ?auto_36532 ) ) ( not ( = ?auto_36535 ?auto_36532 ) ) ( not ( = ?auto_36545 ?auto_36532 ) ) ( not ( = ?auto_36541 ?auto_36532 ) ) ( AVAILABLE ?auto_36540 ) ( IN ?auto_36542 ?auto_36533 ) ( TRUCK-AT ?auto_36533 ?auto_36543 ) )
    :subtasks
    ( ( !DRIVE ?auto_36533 ?auto_36543 ?auto_36537 )
      ( MAKE-2CRATE ?auto_36546 ?auto_36530 ?auto_36531 )
      ( MAKE-1CRATE-VERIFY ?auto_36530 ?auto_36531 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36549 - SURFACE
      ?auto_36550 - SURFACE
      ?auto_36551 - SURFACE
    )
    :vars
    (
      ?auto_36555 - HOIST
      ?auto_36554 - PLACE
      ?auto_36564 - PLACE
      ?auto_36566 - HOIST
      ?auto_36552 - SURFACE
      ?auto_36559 - SURFACE
      ?auto_36561 - SURFACE
      ?auto_36558 - PLACE
      ?auto_36553 - HOIST
      ?auto_36565 - SURFACE
      ?auto_36562 - SURFACE
      ?auto_36567 - PLACE
      ?auto_36556 - HOIST
      ?auto_36563 - SURFACE
      ?auto_36560 - SURFACE
      ?auto_36557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36555 ?auto_36554 ) ( IS-CRATE ?auto_36551 ) ( not ( = ?auto_36550 ?auto_36551 ) ) ( not ( = ?auto_36549 ?auto_36550 ) ) ( not ( = ?auto_36549 ?auto_36551 ) ) ( not ( = ?auto_36564 ?auto_36554 ) ) ( HOIST-AT ?auto_36566 ?auto_36564 ) ( not ( = ?auto_36555 ?auto_36566 ) ) ( SURFACE-AT ?auto_36551 ?auto_36564 ) ( ON ?auto_36551 ?auto_36552 ) ( CLEAR ?auto_36551 ) ( not ( = ?auto_36550 ?auto_36552 ) ) ( not ( = ?auto_36551 ?auto_36552 ) ) ( not ( = ?auto_36549 ?auto_36552 ) ) ( IS-CRATE ?auto_36550 ) ( AVAILABLE ?auto_36566 ) ( SURFACE-AT ?auto_36550 ?auto_36564 ) ( ON ?auto_36550 ?auto_36559 ) ( CLEAR ?auto_36550 ) ( not ( = ?auto_36550 ?auto_36559 ) ) ( not ( = ?auto_36551 ?auto_36559 ) ) ( not ( = ?auto_36549 ?auto_36559 ) ) ( not ( = ?auto_36552 ?auto_36559 ) ) ( IS-CRATE ?auto_36549 ) ( not ( = ?auto_36561 ?auto_36549 ) ) ( not ( = ?auto_36550 ?auto_36561 ) ) ( not ( = ?auto_36551 ?auto_36561 ) ) ( not ( = ?auto_36552 ?auto_36561 ) ) ( not ( = ?auto_36559 ?auto_36561 ) ) ( not ( = ?auto_36558 ?auto_36554 ) ) ( not ( = ?auto_36564 ?auto_36558 ) ) ( HOIST-AT ?auto_36553 ?auto_36558 ) ( not ( = ?auto_36555 ?auto_36553 ) ) ( not ( = ?auto_36566 ?auto_36553 ) ) ( AVAILABLE ?auto_36553 ) ( SURFACE-AT ?auto_36549 ?auto_36558 ) ( ON ?auto_36549 ?auto_36565 ) ( CLEAR ?auto_36549 ) ( not ( = ?auto_36550 ?auto_36565 ) ) ( not ( = ?auto_36551 ?auto_36565 ) ) ( not ( = ?auto_36549 ?auto_36565 ) ) ( not ( = ?auto_36552 ?auto_36565 ) ) ( not ( = ?auto_36559 ?auto_36565 ) ) ( not ( = ?auto_36561 ?auto_36565 ) ) ( IS-CRATE ?auto_36561 ) ( not ( = ?auto_36562 ?auto_36561 ) ) ( not ( = ?auto_36550 ?auto_36562 ) ) ( not ( = ?auto_36551 ?auto_36562 ) ) ( not ( = ?auto_36549 ?auto_36562 ) ) ( not ( = ?auto_36552 ?auto_36562 ) ) ( not ( = ?auto_36559 ?auto_36562 ) ) ( not ( = ?auto_36565 ?auto_36562 ) ) ( not ( = ?auto_36567 ?auto_36554 ) ) ( not ( = ?auto_36564 ?auto_36567 ) ) ( not ( = ?auto_36558 ?auto_36567 ) ) ( HOIST-AT ?auto_36556 ?auto_36567 ) ( not ( = ?auto_36555 ?auto_36556 ) ) ( not ( = ?auto_36566 ?auto_36556 ) ) ( not ( = ?auto_36553 ?auto_36556 ) ) ( AVAILABLE ?auto_36556 ) ( SURFACE-AT ?auto_36561 ?auto_36567 ) ( ON ?auto_36561 ?auto_36563 ) ( CLEAR ?auto_36561 ) ( not ( = ?auto_36550 ?auto_36563 ) ) ( not ( = ?auto_36551 ?auto_36563 ) ) ( not ( = ?auto_36549 ?auto_36563 ) ) ( not ( = ?auto_36552 ?auto_36563 ) ) ( not ( = ?auto_36559 ?auto_36563 ) ) ( not ( = ?auto_36561 ?auto_36563 ) ) ( not ( = ?auto_36565 ?auto_36563 ) ) ( not ( = ?auto_36562 ?auto_36563 ) ) ( SURFACE-AT ?auto_36560 ?auto_36554 ) ( CLEAR ?auto_36560 ) ( IS-CRATE ?auto_36562 ) ( not ( = ?auto_36560 ?auto_36562 ) ) ( not ( = ?auto_36550 ?auto_36560 ) ) ( not ( = ?auto_36551 ?auto_36560 ) ) ( not ( = ?auto_36549 ?auto_36560 ) ) ( not ( = ?auto_36552 ?auto_36560 ) ) ( not ( = ?auto_36559 ?auto_36560 ) ) ( not ( = ?auto_36561 ?auto_36560 ) ) ( not ( = ?auto_36565 ?auto_36560 ) ) ( not ( = ?auto_36563 ?auto_36560 ) ) ( AVAILABLE ?auto_36555 ) ( IN ?auto_36562 ?auto_36557 ) ( TRUCK-AT ?auto_36557 ?auto_36567 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36550 ?auto_36551 )
      ( MAKE-2CRATE-VERIFY ?auto_36549 ?auto_36550 ?auto_36551 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36568 - SURFACE
      ?auto_36569 - SURFACE
      ?auto_36570 - SURFACE
      ?auto_36571 - SURFACE
    )
    :vars
    (
      ?auto_36582 - HOIST
      ?auto_36578 - PLACE
      ?auto_36574 - PLACE
      ?auto_36575 - HOIST
      ?auto_36583 - SURFACE
      ?auto_36584 - SURFACE
      ?auto_36576 - PLACE
      ?auto_36581 - HOIST
      ?auto_36573 - SURFACE
      ?auto_36577 - SURFACE
      ?auto_36579 - PLACE
      ?auto_36585 - HOIST
      ?auto_36580 - SURFACE
      ?auto_36586 - SURFACE
      ?auto_36572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36582 ?auto_36578 ) ( IS-CRATE ?auto_36571 ) ( not ( = ?auto_36570 ?auto_36571 ) ) ( not ( = ?auto_36569 ?auto_36570 ) ) ( not ( = ?auto_36569 ?auto_36571 ) ) ( not ( = ?auto_36574 ?auto_36578 ) ) ( HOIST-AT ?auto_36575 ?auto_36574 ) ( not ( = ?auto_36582 ?auto_36575 ) ) ( SURFACE-AT ?auto_36571 ?auto_36574 ) ( ON ?auto_36571 ?auto_36583 ) ( CLEAR ?auto_36571 ) ( not ( = ?auto_36570 ?auto_36583 ) ) ( not ( = ?auto_36571 ?auto_36583 ) ) ( not ( = ?auto_36569 ?auto_36583 ) ) ( IS-CRATE ?auto_36570 ) ( AVAILABLE ?auto_36575 ) ( SURFACE-AT ?auto_36570 ?auto_36574 ) ( ON ?auto_36570 ?auto_36584 ) ( CLEAR ?auto_36570 ) ( not ( = ?auto_36570 ?auto_36584 ) ) ( not ( = ?auto_36571 ?auto_36584 ) ) ( not ( = ?auto_36569 ?auto_36584 ) ) ( not ( = ?auto_36583 ?auto_36584 ) ) ( IS-CRATE ?auto_36569 ) ( not ( = ?auto_36568 ?auto_36569 ) ) ( not ( = ?auto_36570 ?auto_36568 ) ) ( not ( = ?auto_36571 ?auto_36568 ) ) ( not ( = ?auto_36583 ?auto_36568 ) ) ( not ( = ?auto_36584 ?auto_36568 ) ) ( not ( = ?auto_36576 ?auto_36578 ) ) ( not ( = ?auto_36574 ?auto_36576 ) ) ( HOIST-AT ?auto_36581 ?auto_36576 ) ( not ( = ?auto_36582 ?auto_36581 ) ) ( not ( = ?auto_36575 ?auto_36581 ) ) ( AVAILABLE ?auto_36581 ) ( SURFACE-AT ?auto_36569 ?auto_36576 ) ( ON ?auto_36569 ?auto_36573 ) ( CLEAR ?auto_36569 ) ( not ( = ?auto_36570 ?auto_36573 ) ) ( not ( = ?auto_36571 ?auto_36573 ) ) ( not ( = ?auto_36569 ?auto_36573 ) ) ( not ( = ?auto_36583 ?auto_36573 ) ) ( not ( = ?auto_36584 ?auto_36573 ) ) ( not ( = ?auto_36568 ?auto_36573 ) ) ( IS-CRATE ?auto_36568 ) ( not ( = ?auto_36577 ?auto_36568 ) ) ( not ( = ?auto_36570 ?auto_36577 ) ) ( not ( = ?auto_36571 ?auto_36577 ) ) ( not ( = ?auto_36569 ?auto_36577 ) ) ( not ( = ?auto_36583 ?auto_36577 ) ) ( not ( = ?auto_36584 ?auto_36577 ) ) ( not ( = ?auto_36573 ?auto_36577 ) ) ( not ( = ?auto_36579 ?auto_36578 ) ) ( not ( = ?auto_36574 ?auto_36579 ) ) ( not ( = ?auto_36576 ?auto_36579 ) ) ( HOIST-AT ?auto_36585 ?auto_36579 ) ( not ( = ?auto_36582 ?auto_36585 ) ) ( not ( = ?auto_36575 ?auto_36585 ) ) ( not ( = ?auto_36581 ?auto_36585 ) ) ( AVAILABLE ?auto_36585 ) ( SURFACE-AT ?auto_36568 ?auto_36579 ) ( ON ?auto_36568 ?auto_36580 ) ( CLEAR ?auto_36568 ) ( not ( = ?auto_36570 ?auto_36580 ) ) ( not ( = ?auto_36571 ?auto_36580 ) ) ( not ( = ?auto_36569 ?auto_36580 ) ) ( not ( = ?auto_36583 ?auto_36580 ) ) ( not ( = ?auto_36584 ?auto_36580 ) ) ( not ( = ?auto_36568 ?auto_36580 ) ) ( not ( = ?auto_36573 ?auto_36580 ) ) ( not ( = ?auto_36577 ?auto_36580 ) ) ( SURFACE-AT ?auto_36586 ?auto_36578 ) ( CLEAR ?auto_36586 ) ( IS-CRATE ?auto_36577 ) ( not ( = ?auto_36586 ?auto_36577 ) ) ( not ( = ?auto_36570 ?auto_36586 ) ) ( not ( = ?auto_36571 ?auto_36586 ) ) ( not ( = ?auto_36569 ?auto_36586 ) ) ( not ( = ?auto_36583 ?auto_36586 ) ) ( not ( = ?auto_36584 ?auto_36586 ) ) ( not ( = ?auto_36568 ?auto_36586 ) ) ( not ( = ?auto_36573 ?auto_36586 ) ) ( not ( = ?auto_36580 ?auto_36586 ) ) ( AVAILABLE ?auto_36582 ) ( IN ?auto_36577 ?auto_36572 ) ( TRUCK-AT ?auto_36572 ?auto_36579 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36569 ?auto_36570 ?auto_36571 )
      ( MAKE-3CRATE-VERIFY ?auto_36568 ?auto_36569 ?auto_36570 ?auto_36571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36587 - SURFACE
      ?auto_36588 - SURFACE
      ?auto_36589 - SURFACE
      ?auto_36590 - SURFACE
      ?auto_36591 - SURFACE
    )
    :vars
    (
      ?auto_36601 - HOIST
      ?auto_36597 - PLACE
      ?auto_36594 - PLACE
      ?auto_36595 - HOIST
      ?auto_36602 - SURFACE
      ?auto_36603 - SURFACE
      ?auto_36596 - PLACE
      ?auto_36600 - HOIST
      ?auto_36593 - SURFACE
      ?auto_36598 - PLACE
      ?auto_36604 - HOIST
      ?auto_36599 - SURFACE
      ?auto_36605 - SURFACE
      ?auto_36592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36601 ?auto_36597 ) ( IS-CRATE ?auto_36591 ) ( not ( = ?auto_36590 ?auto_36591 ) ) ( not ( = ?auto_36589 ?auto_36590 ) ) ( not ( = ?auto_36589 ?auto_36591 ) ) ( not ( = ?auto_36594 ?auto_36597 ) ) ( HOIST-AT ?auto_36595 ?auto_36594 ) ( not ( = ?auto_36601 ?auto_36595 ) ) ( SURFACE-AT ?auto_36591 ?auto_36594 ) ( ON ?auto_36591 ?auto_36602 ) ( CLEAR ?auto_36591 ) ( not ( = ?auto_36590 ?auto_36602 ) ) ( not ( = ?auto_36591 ?auto_36602 ) ) ( not ( = ?auto_36589 ?auto_36602 ) ) ( IS-CRATE ?auto_36590 ) ( AVAILABLE ?auto_36595 ) ( SURFACE-AT ?auto_36590 ?auto_36594 ) ( ON ?auto_36590 ?auto_36603 ) ( CLEAR ?auto_36590 ) ( not ( = ?auto_36590 ?auto_36603 ) ) ( not ( = ?auto_36591 ?auto_36603 ) ) ( not ( = ?auto_36589 ?auto_36603 ) ) ( not ( = ?auto_36602 ?auto_36603 ) ) ( IS-CRATE ?auto_36589 ) ( not ( = ?auto_36588 ?auto_36589 ) ) ( not ( = ?auto_36590 ?auto_36588 ) ) ( not ( = ?auto_36591 ?auto_36588 ) ) ( not ( = ?auto_36602 ?auto_36588 ) ) ( not ( = ?auto_36603 ?auto_36588 ) ) ( not ( = ?auto_36596 ?auto_36597 ) ) ( not ( = ?auto_36594 ?auto_36596 ) ) ( HOIST-AT ?auto_36600 ?auto_36596 ) ( not ( = ?auto_36601 ?auto_36600 ) ) ( not ( = ?auto_36595 ?auto_36600 ) ) ( AVAILABLE ?auto_36600 ) ( SURFACE-AT ?auto_36589 ?auto_36596 ) ( ON ?auto_36589 ?auto_36593 ) ( CLEAR ?auto_36589 ) ( not ( = ?auto_36590 ?auto_36593 ) ) ( not ( = ?auto_36591 ?auto_36593 ) ) ( not ( = ?auto_36589 ?auto_36593 ) ) ( not ( = ?auto_36602 ?auto_36593 ) ) ( not ( = ?auto_36603 ?auto_36593 ) ) ( not ( = ?auto_36588 ?auto_36593 ) ) ( IS-CRATE ?auto_36588 ) ( not ( = ?auto_36587 ?auto_36588 ) ) ( not ( = ?auto_36590 ?auto_36587 ) ) ( not ( = ?auto_36591 ?auto_36587 ) ) ( not ( = ?auto_36589 ?auto_36587 ) ) ( not ( = ?auto_36602 ?auto_36587 ) ) ( not ( = ?auto_36603 ?auto_36587 ) ) ( not ( = ?auto_36593 ?auto_36587 ) ) ( not ( = ?auto_36598 ?auto_36597 ) ) ( not ( = ?auto_36594 ?auto_36598 ) ) ( not ( = ?auto_36596 ?auto_36598 ) ) ( HOIST-AT ?auto_36604 ?auto_36598 ) ( not ( = ?auto_36601 ?auto_36604 ) ) ( not ( = ?auto_36595 ?auto_36604 ) ) ( not ( = ?auto_36600 ?auto_36604 ) ) ( AVAILABLE ?auto_36604 ) ( SURFACE-AT ?auto_36588 ?auto_36598 ) ( ON ?auto_36588 ?auto_36599 ) ( CLEAR ?auto_36588 ) ( not ( = ?auto_36590 ?auto_36599 ) ) ( not ( = ?auto_36591 ?auto_36599 ) ) ( not ( = ?auto_36589 ?auto_36599 ) ) ( not ( = ?auto_36602 ?auto_36599 ) ) ( not ( = ?auto_36603 ?auto_36599 ) ) ( not ( = ?auto_36588 ?auto_36599 ) ) ( not ( = ?auto_36593 ?auto_36599 ) ) ( not ( = ?auto_36587 ?auto_36599 ) ) ( SURFACE-AT ?auto_36605 ?auto_36597 ) ( CLEAR ?auto_36605 ) ( IS-CRATE ?auto_36587 ) ( not ( = ?auto_36605 ?auto_36587 ) ) ( not ( = ?auto_36590 ?auto_36605 ) ) ( not ( = ?auto_36591 ?auto_36605 ) ) ( not ( = ?auto_36589 ?auto_36605 ) ) ( not ( = ?auto_36602 ?auto_36605 ) ) ( not ( = ?auto_36603 ?auto_36605 ) ) ( not ( = ?auto_36588 ?auto_36605 ) ) ( not ( = ?auto_36593 ?auto_36605 ) ) ( not ( = ?auto_36599 ?auto_36605 ) ) ( AVAILABLE ?auto_36601 ) ( IN ?auto_36587 ?auto_36592 ) ( TRUCK-AT ?auto_36592 ?auto_36598 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36589 ?auto_36590 ?auto_36591 )
      ( MAKE-4CRATE-VERIFY ?auto_36587 ?auto_36588 ?auto_36589 ?auto_36590 ?auto_36591 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36606 - SURFACE
      ?auto_36607 - SURFACE
      ?auto_36608 - SURFACE
      ?auto_36609 - SURFACE
      ?auto_36610 - SURFACE
      ?auto_36611 - SURFACE
    )
    :vars
    (
      ?auto_36621 - HOIST
      ?auto_36617 - PLACE
      ?auto_36614 - PLACE
      ?auto_36615 - HOIST
      ?auto_36622 - SURFACE
      ?auto_36623 - SURFACE
      ?auto_36616 - PLACE
      ?auto_36620 - HOIST
      ?auto_36613 - SURFACE
      ?auto_36618 - PLACE
      ?auto_36624 - HOIST
      ?auto_36619 - SURFACE
      ?auto_36612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36621 ?auto_36617 ) ( IS-CRATE ?auto_36611 ) ( not ( = ?auto_36610 ?auto_36611 ) ) ( not ( = ?auto_36609 ?auto_36610 ) ) ( not ( = ?auto_36609 ?auto_36611 ) ) ( not ( = ?auto_36614 ?auto_36617 ) ) ( HOIST-AT ?auto_36615 ?auto_36614 ) ( not ( = ?auto_36621 ?auto_36615 ) ) ( SURFACE-AT ?auto_36611 ?auto_36614 ) ( ON ?auto_36611 ?auto_36622 ) ( CLEAR ?auto_36611 ) ( not ( = ?auto_36610 ?auto_36622 ) ) ( not ( = ?auto_36611 ?auto_36622 ) ) ( not ( = ?auto_36609 ?auto_36622 ) ) ( IS-CRATE ?auto_36610 ) ( AVAILABLE ?auto_36615 ) ( SURFACE-AT ?auto_36610 ?auto_36614 ) ( ON ?auto_36610 ?auto_36623 ) ( CLEAR ?auto_36610 ) ( not ( = ?auto_36610 ?auto_36623 ) ) ( not ( = ?auto_36611 ?auto_36623 ) ) ( not ( = ?auto_36609 ?auto_36623 ) ) ( not ( = ?auto_36622 ?auto_36623 ) ) ( IS-CRATE ?auto_36609 ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( not ( = ?auto_36610 ?auto_36608 ) ) ( not ( = ?auto_36611 ?auto_36608 ) ) ( not ( = ?auto_36622 ?auto_36608 ) ) ( not ( = ?auto_36623 ?auto_36608 ) ) ( not ( = ?auto_36616 ?auto_36617 ) ) ( not ( = ?auto_36614 ?auto_36616 ) ) ( HOIST-AT ?auto_36620 ?auto_36616 ) ( not ( = ?auto_36621 ?auto_36620 ) ) ( not ( = ?auto_36615 ?auto_36620 ) ) ( AVAILABLE ?auto_36620 ) ( SURFACE-AT ?auto_36609 ?auto_36616 ) ( ON ?auto_36609 ?auto_36613 ) ( CLEAR ?auto_36609 ) ( not ( = ?auto_36610 ?auto_36613 ) ) ( not ( = ?auto_36611 ?auto_36613 ) ) ( not ( = ?auto_36609 ?auto_36613 ) ) ( not ( = ?auto_36622 ?auto_36613 ) ) ( not ( = ?auto_36623 ?auto_36613 ) ) ( not ( = ?auto_36608 ?auto_36613 ) ) ( IS-CRATE ?auto_36608 ) ( not ( = ?auto_36607 ?auto_36608 ) ) ( not ( = ?auto_36610 ?auto_36607 ) ) ( not ( = ?auto_36611 ?auto_36607 ) ) ( not ( = ?auto_36609 ?auto_36607 ) ) ( not ( = ?auto_36622 ?auto_36607 ) ) ( not ( = ?auto_36623 ?auto_36607 ) ) ( not ( = ?auto_36613 ?auto_36607 ) ) ( not ( = ?auto_36618 ?auto_36617 ) ) ( not ( = ?auto_36614 ?auto_36618 ) ) ( not ( = ?auto_36616 ?auto_36618 ) ) ( HOIST-AT ?auto_36624 ?auto_36618 ) ( not ( = ?auto_36621 ?auto_36624 ) ) ( not ( = ?auto_36615 ?auto_36624 ) ) ( not ( = ?auto_36620 ?auto_36624 ) ) ( AVAILABLE ?auto_36624 ) ( SURFACE-AT ?auto_36608 ?auto_36618 ) ( ON ?auto_36608 ?auto_36619 ) ( CLEAR ?auto_36608 ) ( not ( = ?auto_36610 ?auto_36619 ) ) ( not ( = ?auto_36611 ?auto_36619 ) ) ( not ( = ?auto_36609 ?auto_36619 ) ) ( not ( = ?auto_36622 ?auto_36619 ) ) ( not ( = ?auto_36623 ?auto_36619 ) ) ( not ( = ?auto_36608 ?auto_36619 ) ) ( not ( = ?auto_36613 ?auto_36619 ) ) ( not ( = ?auto_36607 ?auto_36619 ) ) ( SURFACE-AT ?auto_36606 ?auto_36617 ) ( CLEAR ?auto_36606 ) ( IS-CRATE ?auto_36607 ) ( not ( = ?auto_36606 ?auto_36607 ) ) ( not ( = ?auto_36610 ?auto_36606 ) ) ( not ( = ?auto_36611 ?auto_36606 ) ) ( not ( = ?auto_36609 ?auto_36606 ) ) ( not ( = ?auto_36622 ?auto_36606 ) ) ( not ( = ?auto_36623 ?auto_36606 ) ) ( not ( = ?auto_36608 ?auto_36606 ) ) ( not ( = ?auto_36613 ?auto_36606 ) ) ( not ( = ?auto_36619 ?auto_36606 ) ) ( AVAILABLE ?auto_36621 ) ( IN ?auto_36607 ?auto_36612 ) ( TRUCK-AT ?auto_36612 ?auto_36618 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36609 ?auto_36610 ?auto_36611 )
      ( MAKE-5CRATE-VERIFY ?auto_36606 ?auto_36607 ?auto_36608 ?auto_36609 ?auto_36610 ?auto_36611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36625 - SURFACE
      ?auto_36626 - SURFACE
    )
    :vars
    (
      ?auto_36638 - HOIST
      ?auto_36634 - PLACE
      ?auto_36640 - SURFACE
      ?auto_36629 - PLACE
      ?auto_36630 - HOIST
      ?auto_36639 - SURFACE
      ?auto_36641 - SURFACE
      ?auto_36632 - SURFACE
      ?auto_36631 - PLACE
      ?auto_36637 - HOIST
      ?auto_36628 - SURFACE
      ?auto_36633 - SURFACE
      ?auto_36635 - PLACE
      ?auto_36642 - HOIST
      ?auto_36636 - SURFACE
      ?auto_36643 - SURFACE
      ?auto_36627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36638 ?auto_36634 ) ( IS-CRATE ?auto_36626 ) ( not ( = ?auto_36625 ?auto_36626 ) ) ( not ( = ?auto_36640 ?auto_36625 ) ) ( not ( = ?auto_36640 ?auto_36626 ) ) ( not ( = ?auto_36629 ?auto_36634 ) ) ( HOIST-AT ?auto_36630 ?auto_36629 ) ( not ( = ?auto_36638 ?auto_36630 ) ) ( SURFACE-AT ?auto_36626 ?auto_36629 ) ( ON ?auto_36626 ?auto_36639 ) ( CLEAR ?auto_36626 ) ( not ( = ?auto_36625 ?auto_36639 ) ) ( not ( = ?auto_36626 ?auto_36639 ) ) ( not ( = ?auto_36640 ?auto_36639 ) ) ( IS-CRATE ?auto_36625 ) ( AVAILABLE ?auto_36630 ) ( SURFACE-AT ?auto_36625 ?auto_36629 ) ( ON ?auto_36625 ?auto_36641 ) ( CLEAR ?auto_36625 ) ( not ( = ?auto_36625 ?auto_36641 ) ) ( not ( = ?auto_36626 ?auto_36641 ) ) ( not ( = ?auto_36640 ?auto_36641 ) ) ( not ( = ?auto_36639 ?auto_36641 ) ) ( IS-CRATE ?auto_36640 ) ( not ( = ?auto_36632 ?auto_36640 ) ) ( not ( = ?auto_36625 ?auto_36632 ) ) ( not ( = ?auto_36626 ?auto_36632 ) ) ( not ( = ?auto_36639 ?auto_36632 ) ) ( not ( = ?auto_36641 ?auto_36632 ) ) ( not ( = ?auto_36631 ?auto_36634 ) ) ( not ( = ?auto_36629 ?auto_36631 ) ) ( HOIST-AT ?auto_36637 ?auto_36631 ) ( not ( = ?auto_36638 ?auto_36637 ) ) ( not ( = ?auto_36630 ?auto_36637 ) ) ( AVAILABLE ?auto_36637 ) ( SURFACE-AT ?auto_36640 ?auto_36631 ) ( ON ?auto_36640 ?auto_36628 ) ( CLEAR ?auto_36640 ) ( not ( = ?auto_36625 ?auto_36628 ) ) ( not ( = ?auto_36626 ?auto_36628 ) ) ( not ( = ?auto_36640 ?auto_36628 ) ) ( not ( = ?auto_36639 ?auto_36628 ) ) ( not ( = ?auto_36641 ?auto_36628 ) ) ( not ( = ?auto_36632 ?auto_36628 ) ) ( IS-CRATE ?auto_36632 ) ( not ( = ?auto_36633 ?auto_36632 ) ) ( not ( = ?auto_36625 ?auto_36633 ) ) ( not ( = ?auto_36626 ?auto_36633 ) ) ( not ( = ?auto_36640 ?auto_36633 ) ) ( not ( = ?auto_36639 ?auto_36633 ) ) ( not ( = ?auto_36641 ?auto_36633 ) ) ( not ( = ?auto_36628 ?auto_36633 ) ) ( not ( = ?auto_36635 ?auto_36634 ) ) ( not ( = ?auto_36629 ?auto_36635 ) ) ( not ( = ?auto_36631 ?auto_36635 ) ) ( HOIST-AT ?auto_36642 ?auto_36635 ) ( not ( = ?auto_36638 ?auto_36642 ) ) ( not ( = ?auto_36630 ?auto_36642 ) ) ( not ( = ?auto_36637 ?auto_36642 ) ) ( SURFACE-AT ?auto_36632 ?auto_36635 ) ( ON ?auto_36632 ?auto_36636 ) ( CLEAR ?auto_36632 ) ( not ( = ?auto_36625 ?auto_36636 ) ) ( not ( = ?auto_36626 ?auto_36636 ) ) ( not ( = ?auto_36640 ?auto_36636 ) ) ( not ( = ?auto_36639 ?auto_36636 ) ) ( not ( = ?auto_36641 ?auto_36636 ) ) ( not ( = ?auto_36632 ?auto_36636 ) ) ( not ( = ?auto_36628 ?auto_36636 ) ) ( not ( = ?auto_36633 ?auto_36636 ) ) ( SURFACE-AT ?auto_36643 ?auto_36634 ) ( CLEAR ?auto_36643 ) ( IS-CRATE ?auto_36633 ) ( not ( = ?auto_36643 ?auto_36633 ) ) ( not ( = ?auto_36625 ?auto_36643 ) ) ( not ( = ?auto_36626 ?auto_36643 ) ) ( not ( = ?auto_36640 ?auto_36643 ) ) ( not ( = ?auto_36639 ?auto_36643 ) ) ( not ( = ?auto_36641 ?auto_36643 ) ) ( not ( = ?auto_36632 ?auto_36643 ) ) ( not ( = ?auto_36628 ?auto_36643 ) ) ( not ( = ?auto_36636 ?auto_36643 ) ) ( AVAILABLE ?auto_36638 ) ( TRUCK-AT ?auto_36627 ?auto_36635 ) ( LIFTING ?auto_36642 ?auto_36633 ) )
    :subtasks
    ( ( !LOAD ?auto_36642 ?auto_36633 ?auto_36627 ?auto_36635 )
      ( MAKE-2CRATE ?auto_36640 ?auto_36625 ?auto_36626 )
      ( MAKE-1CRATE-VERIFY ?auto_36625 ?auto_36626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36644 - SURFACE
      ?auto_36645 - SURFACE
      ?auto_36646 - SURFACE
    )
    :vars
    (
      ?auto_36654 - HOIST
      ?auto_36656 - PLACE
      ?auto_36649 - PLACE
      ?auto_36651 - HOIST
      ?auto_36650 - SURFACE
      ?auto_36652 - SURFACE
      ?auto_36662 - SURFACE
      ?auto_36661 - PLACE
      ?auto_36653 - HOIST
      ?auto_36657 - SURFACE
      ?auto_36658 - SURFACE
      ?auto_36660 - PLACE
      ?auto_36659 - HOIST
      ?auto_36647 - SURFACE
      ?auto_36655 - SURFACE
      ?auto_36648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36654 ?auto_36656 ) ( IS-CRATE ?auto_36646 ) ( not ( = ?auto_36645 ?auto_36646 ) ) ( not ( = ?auto_36644 ?auto_36645 ) ) ( not ( = ?auto_36644 ?auto_36646 ) ) ( not ( = ?auto_36649 ?auto_36656 ) ) ( HOIST-AT ?auto_36651 ?auto_36649 ) ( not ( = ?auto_36654 ?auto_36651 ) ) ( SURFACE-AT ?auto_36646 ?auto_36649 ) ( ON ?auto_36646 ?auto_36650 ) ( CLEAR ?auto_36646 ) ( not ( = ?auto_36645 ?auto_36650 ) ) ( not ( = ?auto_36646 ?auto_36650 ) ) ( not ( = ?auto_36644 ?auto_36650 ) ) ( IS-CRATE ?auto_36645 ) ( AVAILABLE ?auto_36651 ) ( SURFACE-AT ?auto_36645 ?auto_36649 ) ( ON ?auto_36645 ?auto_36652 ) ( CLEAR ?auto_36645 ) ( not ( = ?auto_36645 ?auto_36652 ) ) ( not ( = ?auto_36646 ?auto_36652 ) ) ( not ( = ?auto_36644 ?auto_36652 ) ) ( not ( = ?auto_36650 ?auto_36652 ) ) ( IS-CRATE ?auto_36644 ) ( not ( = ?auto_36662 ?auto_36644 ) ) ( not ( = ?auto_36645 ?auto_36662 ) ) ( not ( = ?auto_36646 ?auto_36662 ) ) ( not ( = ?auto_36650 ?auto_36662 ) ) ( not ( = ?auto_36652 ?auto_36662 ) ) ( not ( = ?auto_36661 ?auto_36656 ) ) ( not ( = ?auto_36649 ?auto_36661 ) ) ( HOIST-AT ?auto_36653 ?auto_36661 ) ( not ( = ?auto_36654 ?auto_36653 ) ) ( not ( = ?auto_36651 ?auto_36653 ) ) ( AVAILABLE ?auto_36653 ) ( SURFACE-AT ?auto_36644 ?auto_36661 ) ( ON ?auto_36644 ?auto_36657 ) ( CLEAR ?auto_36644 ) ( not ( = ?auto_36645 ?auto_36657 ) ) ( not ( = ?auto_36646 ?auto_36657 ) ) ( not ( = ?auto_36644 ?auto_36657 ) ) ( not ( = ?auto_36650 ?auto_36657 ) ) ( not ( = ?auto_36652 ?auto_36657 ) ) ( not ( = ?auto_36662 ?auto_36657 ) ) ( IS-CRATE ?auto_36662 ) ( not ( = ?auto_36658 ?auto_36662 ) ) ( not ( = ?auto_36645 ?auto_36658 ) ) ( not ( = ?auto_36646 ?auto_36658 ) ) ( not ( = ?auto_36644 ?auto_36658 ) ) ( not ( = ?auto_36650 ?auto_36658 ) ) ( not ( = ?auto_36652 ?auto_36658 ) ) ( not ( = ?auto_36657 ?auto_36658 ) ) ( not ( = ?auto_36660 ?auto_36656 ) ) ( not ( = ?auto_36649 ?auto_36660 ) ) ( not ( = ?auto_36661 ?auto_36660 ) ) ( HOIST-AT ?auto_36659 ?auto_36660 ) ( not ( = ?auto_36654 ?auto_36659 ) ) ( not ( = ?auto_36651 ?auto_36659 ) ) ( not ( = ?auto_36653 ?auto_36659 ) ) ( SURFACE-AT ?auto_36662 ?auto_36660 ) ( ON ?auto_36662 ?auto_36647 ) ( CLEAR ?auto_36662 ) ( not ( = ?auto_36645 ?auto_36647 ) ) ( not ( = ?auto_36646 ?auto_36647 ) ) ( not ( = ?auto_36644 ?auto_36647 ) ) ( not ( = ?auto_36650 ?auto_36647 ) ) ( not ( = ?auto_36652 ?auto_36647 ) ) ( not ( = ?auto_36662 ?auto_36647 ) ) ( not ( = ?auto_36657 ?auto_36647 ) ) ( not ( = ?auto_36658 ?auto_36647 ) ) ( SURFACE-AT ?auto_36655 ?auto_36656 ) ( CLEAR ?auto_36655 ) ( IS-CRATE ?auto_36658 ) ( not ( = ?auto_36655 ?auto_36658 ) ) ( not ( = ?auto_36645 ?auto_36655 ) ) ( not ( = ?auto_36646 ?auto_36655 ) ) ( not ( = ?auto_36644 ?auto_36655 ) ) ( not ( = ?auto_36650 ?auto_36655 ) ) ( not ( = ?auto_36652 ?auto_36655 ) ) ( not ( = ?auto_36662 ?auto_36655 ) ) ( not ( = ?auto_36657 ?auto_36655 ) ) ( not ( = ?auto_36647 ?auto_36655 ) ) ( AVAILABLE ?auto_36654 ) ( TRUCK-AT ?auto_36648 ?auto_36660 ) ( LIFTING ?auto_36659 ?auto_36658 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36645 ?auto_36646 )
      ( MAKE-2CRATE-VERIFY ?auto_36644 ?auto_36645 ?auto_36646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36663 - SURFACE
      ?auto_36664 - SURFACE
      ?auto_36665 - SURFACE
      ?auto_36666 - SURFACE
    )
    :vars
    (
      ?auto_36672 - HOIST
      ?auto_36670 - PLACE
      ?auto_36669 - PLACE
      ?auto_36674 - HOIST
      ?auto_36673 - SURFACE
      ?auto_36680 - SURFACE
      ?auto_36679 - PLACE
      ?auto_36671 - HOIST
      ?auto_36667 - SURFACE
      ?auto_36675 - SURFACE
      ?auto_36677 - PLACE
      ?auto_36681 - HOIST
      ?auto_36678 - SURFACE
      ?auto_36676 - SURFACE
      ?auto_36668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36672 ?auto_36670 ) ( IS-CRATE ?auto_36666 ) ( not ( = ?auto_36665 ?auto_36666 ) ) ( not ( = ?auto_36664 ?auto_36665 ) ) ( not ( = ?auto_36664 ?auto_36666 ) ) ( not ( = ?auto_36669 ?auto_36670 ) ) ( HOIST-AT ?auto_36674 ?auto_36669 ) ( not ( = ?auto_36672 ?auto_36674 ) ) ( SURFACE-AT ?auto_36666 ?auto_36669 ) ( ON ?auto_36666 ?auto_36673 ) ( CLEAR ?auto_36666 ) ( not ( = ?auto_36665 ?auto_36673 ) ) ( not ( = ?auto_36666 ?auto_36673 ) ) ( not ( = ?auto_36664 ?auto_36673 ) ) ( IS-CRATE ?auto_36665 ) ( AVAILABLE ?auto_36674 ) ( SURFACE-AT ?auto_36665 ?auto_36669 ) ( ON ?auto_36665 ?auto_36680 ) ( CLEAR ?auto_36665 ) ( not ( = ?auto_36665 ?auto_36680 ) ) ( not ( = ?auto_36666 ?auto_36680 ) ) ( not ( = ?auto_36664 ?auto_36680 ) ) ( not ( = ?auto_36673 ?auto_36680 ) ) ( IS-CRATE ?auto_36664 ) ( not ( = ?auto_36663 ?auto_36664 ) ) ( not ( = ?auto_36665 ?auto_36663 ) ) ( not ( = ?auto_36666 ?auto_36663 ) ) ( not ( = ?auto_36673 ?auto_36663 ) ) ( not ( = ?auto_36680 ?auto_36663 ) ) ( not ( = ?auto_36679 ?auto_36670 ) ) ( not ( = ?auto_36669 ?auto_36679 ) ) ( HOIST-AT ?auto_36671 ?auto_36679 ) ( not ( = ?auto_36672 ?auto_36671 ) ) ( not ( = ?auto_36674 ?auto_36671 ) ) ( AVAILABLE ?auto_36671 ) ( SURFACE-AT ?auto_36664 ?auto_36679 ) ( ON ?auto_36664 ?auto_36667 ) ( CLEAR ?auto_36664 ) ( not ( = ?auto_36665 ?auto_36667 ) ) ( not ( = ?auto_36666 ?auto_36667 ) ) ( not ( = ?auto_36664 ?auto_36667 ) ) ( not ( = ?auto_36673 ?auto_36667 ) ) ( not ( = ?auto_36680 ?auto_36667 ) ) ( not ( = ?auto_36663 ?auto_36667 ) ) ( IS-CRATE ?auto_36663 ) ( not ( = ?auto_36675 ?auto_36663 ) ) ( not ( = ?auto_36665 ?auto_36675 ) ) ( not ( = ?auto_36666 ?auto_36675 ) ) ( not ( = ?auto_36664 ?auto_36675 ) ) ( not ( = ?auto_36673 ?auto_36675 ) ) ( not ( = ?auto_36680 ?auto_36675 ) ) ( not ( = ?auto_36667 ?auto_36675 ) ) ( not ( = ?auto_36677 ?auto_36670 ) ) ( not ( = ?auto_36669 ?auto_36677 ) ) ( not ( = ?auto_36679 ?auto_36677 ) ) ( HOIST-AT ?auto_36681 ?auto_36677 ) ( not ( = ?auto_36672 ?auto_36681 ) ) ( not ( = ?auto_36674 ?auto_36681 ) ) ( not ( = ?auto_36671 ?auto_36681 ) ) ( SURFACE-AT ?auto_36663 ?auto_36677 ) ( ON ?auto_36663 ?auto_36678 ) ( CLEAR ?auto_36663 ) ( not ( = ?auto_36665 ?auto_36678 ) ) ( not ( = ?auto_36666 ?auto_36678 ) ) ( not ( = ?auto_36664 ?auto_36678 ) ) ( not ( = ?auto_36673 ?auto_36678 ) ) ( not ( = ?auto_36680 ?auto_36678 ) ) ( not ( = ?auto_36663 ?auto_36678 ) ) ( not ( = ?auto_36667 ?auto_36678 ) ) ( not ( = ?auto_36675 ?auto_36678 ) ) ( SURFACE-AT ?auto_36676 ?auto_36670 ) ( CLEAR ?auto_36676 ) ( IS-CRATE ?auto_36675 ) ( not ( = ?auto_36676 ?auto_36675 ) ) ( not ( = ?auto_36665 ?auto_36676 ) ) ( not ( = ?auto_36666 ?auto_36676 ) ) ( not ( = ?auto_36664 ?auto_36676 ) ) ( not ( = ?auto_36673 ?auto_36676 ) ) ( not ( = ?auto_36680 ?auto_36676 ) ) ( not ( = ?auto_36663 ?auto_36676 ) ) ( not ( = ?auto_36667 ?auto_36676 ) ) ( not ( = ?auto_36678 ?auto_36676 ) ) ( AVAILABLE ?auto_36672 ) ( TRUCK-AT ?auto_36668 ?auto_36677 ) ( LIFTING ?auto_36681 ?auto_36675 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36664 ?auto_36665 ?auto_36666 )
      ( MAKE-3CRATE-VERIFY ?auto_36663 ?auto_36664 ?auto_36665 ?auto_36666 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36682 - SURFACE
      ?auto_36683 - SURFACE
      ?auto_36684 - SURFACE
      ?auto_36685 - SURFACE
      ?auto_36686 - SURFACE
    )
    :vars
    (
      ?auto_36692 - HOIST
      ?auto_36690 - PLACE
      ?auto_36689 - PLACE
      ?auto_36694 - HOIST
      ?auto_36693 - SURFACE
      ?auto_36699 - SURFACE
      ?auto_36698 - PLACE
      ?auto_36691 - HOIST
      ?auto_36687 - SURFACE
      ?auto_36696 - PLACE
      ?auto_36700 - HOIST
      ?auto_36697 - SURFACE
      ?auto_36695 - SURFACE
      ?auto_36688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36692 ?auto_36690 ) ( IS-CRATE ?auto_36686 ) ( not ( = ?auto_36685 ?auto_36686 ) ) ( not ( = ?auto_36684 ?auto_36685 ) ) ( not ( = ?auto_36684 ?auto_36686 ) ) ( not ( = ?auto_36689 ?auto_36690 ) ) ( HOIST-AT ?auto_36694 ?auto_36689 ) ( not ( = ?auto_36692 ?auto_36694 ) ) ( SURFACE-AT ?auto_36686 ?auto_36689 ) ( ON ?auto_36686 ?auto_36693 ) ( CLEAR ?auto_36686 ) ( not ( = ?auto_36685 ?auto_36693 ) ) ( not ( = ?auto_36686 ?auto_36693 ) ) ( not ( = ?auto_36684 ?auto_36693 ) ) ( IS-CRATE ?auto_36685 ) ( AVAILABLE ?auto_36694 ) ( SURFACE-AT ?auto_36685 ?auto_36689 ) ( ON ?auto_36685 ?auto_36699 ) ( CLEAR ?auto_36685 ) ( not ( = ?auto_36685 ?auto_36699 ) ) ( not ( = ?auto_36686 ?auto_36699 ) ) ( not ( = ?auto_36684 ?auto_36699 ) ) ( not ( = ?auto_36693 ?auto_36699 ) ) ( IS-CRATE ?auto_36684 ) ( not ( = ?auto_36683 ?auto_36684 ) ) ( not ( = ?auto_36685 ?auto_36683 ) ) ( not ( = ?auto_36686 ?auto_36683 ) ) ( not ( = ?auto_36693 ?auto_36683 ) ) ( not ( = ?auto_36699 ?auto_36683 ) ) ( not ( = ?auto_36698 ?auto_36690 ) ) ( not ( = ?auto_36689 ?auto_36698 ) ) ( HOIST-AT ?auto_36691 ?auto_36698 ) ( not ( = ?auto_36692 ?auto_36691 ) ) ( not ( = ?auto_36694 ?auto_36691 ) ) ( AVAILABLE ?auto_36691 ) ( SURFACE-AT ?auto_36684 ?auto_36698 ) ( ON ?auto_36684 ?auto_36687 ) ( CLEAR ?auto_36684 ) ( not ( = ?auto_36685 ?auto_36687 ) ) ( not ( = ?auto_36686 ?auto_36687 ) ) ( not ( = ?auto_36684 ?auto_36687 ) ) ( not ( = ?auto_36693 ?auto_36687 ) ) ( not ( = ?auto_36699 ?auto_36687 ) ) ( not ( = ?auto_36683 ?auto_36687 ) ) ( IS-CRATE ?auto_36683 ) ( not ( = ?auto_36682 ?auto_36683 ) ) ( not ( = ?auto_36685 ?auto_36682 ) ) ( not ( = ?auto_36686 ?auto_36682 ) ) ( not ( = ?auto_36684 ?auto_36682 ) ) ( not ( = ?auto_36693 ?auto_36682 ) ) ( not ( = ?auto_36699 ?auto_36682 ) ) ( not ( = ?auto_36687 ?auto_36682 ) ) ( not ( = ?auto_36696 ?auto_36690 ) ) ( not ( = ?auto_36689 ?auto_36696 ) ) ( not ( = ?auto_36698 ?auto_36696 ) ) ( HOIST-AT ?auto_36700 ?auto_36696 ) ( not ( = ?auto_36692 ?auto_36700 ) ) ( not ( = ?auto_36694 ?auto_36700 ) ) ( not ( = ?auto_36691 ?auto_36700 ) ) ( SURFACE-AT ?auto_36683 ?auto_36696 ) ( ON ?auto_36683 ?auto_36697 ) ( CLEAR ?auto_36683 ) ( not ( = ?auto_36685 ?auto_36697 ) ) ( not ( = ?auto_36686 ?auto_36697 ) ) ( not ( = ?auto_36684 ?auto_36697 ) ) ( not ( = ?auto_36693 ?auto_36697 ) ) ( not ( = ?auto_36699 ?auto_36697 ) ) ( not ( = ?auto_36683 ?auto_36697 ) ) ( not ( = ?auto_36687 ?auto_36697 ) ) ( not ( = ?auto_36682 ?auto_36697 ) ) ( SURFACE-AT ?auto_36695 ?auto_36690 ) ( CLEAR ?auto_36695 ) ( IS-CRATE ?auto_36682 ) ( not ( = ?auto_36695 ?auto_36682 ) ) ( not ( = ?auto_36685 ?auto_36695 ) ) ( not ( = ?auto_36686 ?auto_36695 ) ) ( not ( = ?auto_36684 ?auto_36695 ) ) ( not ( = ?auto_36693 ?auto_36695 ) ) ( not ( = ?auto_36699 ?auto_36695 ) ) ( not ( = ?auto_36683 ?auto_36695 ) ) ( not ( = ?auto_36687 ?auto_36695 ) ) ( not ( = ?auto_36697 ?auto_36695 ) ) ( AVAILABLE ?auto_36692 ) ( TRUCK-AT ?auto_36688 ?auto_36696 ) ( LIFTING ?auto_36700 ?auto_36682 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36684 ?auto_36685 ?auto_36686 )
      ( MAKE-4CRATE-VERIFY ?auto_36682 ?auto_36683 ?auto_36684 ?auto_36685 ?auto_36686 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36701 - SURFACE
      ?auto_36702 - SURFACE
      ?auto_36703 - SURFACE
      ?auto_36704 - SURFACE
      ?auto_36705 - SURFACE
      ?auto_36706 - SURFACE
    )
    :vars
    (
      ?auto_36712 - HOIST
      ?auto_36710 - PLACE
      ?auto_36709 - PLACE
      ?auto_36714 - HOIST
      ?auto_36713 - SURFACE
      ?auto_36718 - SURFACE
      ?auto_36717 - PLACE
      ?auto_36711 - HOIST
      ?auto_36707 - SURFACE
      ?auto_36715 - PLACE
      ?auto_36719 - HOIST
      ?auto_36716 - SURFACE
      ?auto_36708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36712 ?auto_36710 ) ( IS-CRATE ?auto_36706 ) ( not ( = ?auto_36705 ?auto_36706 ) ) ( not ( = ?auto_36704 ?auto_36705 ) ) ( not ( = ?auto_36704 ?auto_36706 ) ) ( not ( = ?auto_36709 ?auto_36710 ) ) ( HOIST-AT ?auto_36714 ?auto_36709 ) ( not ( = ?auto_36712 ?auto_36714 ) ) ( SURFACE-AT ?auto_36706 ?auto_36709 ) ( ON ?auto_36706 ?auto_36713 ) ( CLEAR ?auto_36706 ) ( not ( = ?auto_36705 ?auto_36713 ) ) ( not ( = ?auto_36706 ?auto_36713 ) ) ( not ( = ?auto_36704 ?auto_36713 ) ) ( IS-CRATE ?auto_36705 ) ( AVAILABLE ?auto_36714 ) ( SURFACE-AT ?auto_36705 ?auto_36709 ) ( ON ?auto_36705 ?auto_36718 ) ( CLEAR ?auto_36705 ) ( not ( = ?auto_36705 ?auto_36718 ) ) ( not ( = ?auto_36706 ?auto_36718 ) ) ( not ( = ?auto_36704 ?auto_36718 ) ) ( not ( = ?auto_36713 ?auto_36718 ) ) ( IS-CRATE ?auto_36704 ) ( not ( = ?auto_36703 ?auto_36704 ) ) ( not ( = ?auto_36705 ?auto_36703 ) ) ( not ( = ?auto_36706 ?auto_36703 ) ) ( not ( = ?auto_36713 ?auto_36703 ) ) ( not ( = ?auto_36718 ?auto_36703 ) ) ( not ( = ?auto_36717 ?auto_36710 ) ) ( not ( = ?auto_36709 ?auto_36717 ) ) ( HOIST-AT ?auto_36711 ?auto_36717 ) ( not ( = ?auto_36712 ?auto_36711 ) ) ( not ( = ?auto_36714 ?auto_36711 ) ) ( AVAILABLE ?auto_36711 ) ( SURFACE-AT ?auto_36704 ?auto_36717 ) ( ON ?auto_36704 ?auto_36707 ) ( CLEAR ?auto_36704 ) ( not ( = ?auto_36705 ?auto_36707 ) ) ( not ( = ?auto_36706 ?auto_36707 ) ) ( not ( = ?auto_36704 ?auto_36707 ) ) ( not ( = ?auto_36713 ?auto_36707 ) ) ( not ( = ?auto_36718 ?auto_36707 ) ) ( not ( = ?auto_36703 ?auto_36707 ) ) ( IS-CRATE ?auto_36703 ) ( not ( = ?auto_36702 ?auto_36703 ) ) ( not ( = ?auto_36705 ?auto_36702 ) ) ( not ( = ?auto_36706 ?auto_36702 ) ) ( not ( = ?auto_36704 ?auto_36702 ) ) ( not ( = ?auto_36713 ?auto_36702 ) ) ( not ( = ?auto_36718 ?auto_36702 ) ) ( not ( = ?auto_36707 ?auto_36702 ) ) ( not ( = ?auto_36715 ?auto_36710 ) ) ( not ( = ?auto_36709 ?auto_36715 ) ) ( not ( = ?auto_36717 ?auto_36715 ) ) ( HOIST-AT ?auto_36719 ?auto_36715 ) ( not ( = ?auto_36712 ?auto_36719 ) ) ( not ( = ?auto_36714 ?auto_36719 ) ) ( not ( = ?auto_36711 ?auto_36719 ) ) ( SURFACE-AT ?auto_36703 ?auto_36715 ) ( ON ?auto_36703 ?auto_36716 ) ( CLEAR ?auto_36703 ) ( not ( = ?auto_36705 ?auto_36716 ) ) ( not ( = ?auto_36706 ?auto_36716 ) ) ( not ( = ?auto_36704 ?auto_36716 ) ) ( not ( = ?auto_36713 ?auto_36716 ) ) ( not ( = ?auto_36718 ?auto_36716 ) ) ( not ( = ?auto_36703 ?auto_36716 ) ) ( not ( = ?auto_36707 ?auto_36716 ) ) ( not ( = ?auto_36702 ?auto_36716 ) ) ( SURFACE-AT ?auto_36701 ?auto_36710 ) ( CLEAR ?auto_36701 ) ( IS-CRATE ?auto_36702 ) ( not ( = ?auto_36701 ?auto_36702 ) ) ( not ( = ?auto_36705 ?auto_36701 ) ) ( not ( = ?auto_36706 ?auto_36701 ) ) ( not ( = ?auto_36704 ?auto_36701 ) ) ( not ( = ?auto_36713 ?auto_36701 ) ) ( not ( = ?auto_36718 ?auto_36701 ) ) ( not ( = ?auto_36703 ?auto_36701 ) ) ( not ( = ?auto_36707 ?auto_36701 ) ) ( not ( = ?auto_36716 ?auto_36701 ) ) ( AVAILABLE ?auto_36712 ) ( TRUCK-AT ?auto_36708 ?auto_36715 ) ( LIFTING ?auto_36719 ?auto_36702 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36704 ?auto_36705 ?auto_36706 )
      ( MAKE-5CRATE-VERIFY ?auto_36701 ?auto_36702 ?auto_36703 ?auto_36704 ?auto_36705 ?auto_36706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36720 - SURFACE
      ?auto_36721 - SURFACE
    )
    :vars
    (
      ?auto_36727 - HOIST
      ?auto_36725 - PLACE
      ?auto_36737 - SURFACE
      ?auto_36724 - PLACE
      ?auto_36730 - HOIST
      ?auto_36729 - SURFACE
      ?auto_36736 - SURFACE
      ?auto_36728 - SURFACE
      ?auto_36735 - PLACE
      ?auto_36726 - HOIST
      ?auto_36722 - SURFACE
      ?auto_36731 - SURFACE
      ?auto_36733 - PLACE
      ?auto_36738 - HOIST
      ?auto_36734 - SURFACE
      ?auto_36732 - SURFACE
      ?auto_36723 - TRUCK
      ?auto_36739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36727 ?auto_36725 ) ( IS-CRATE ?auto_36721 ) ( not ( = ?auto_36720 ?auto_36721 ) ) ( not ( = ?auto_36737 ?auto_36720 ) ) ( not ( = ?auto_36737 ?auto_36721 ) ) ( not ( = ?auto_36724 ?auto_36725 ) ) ( HOIST-AT ?auto_36730 ?auto_36724 ) ( not ( = ?auto_36727 ?auto_36730 ) ) ( SURFACE-AT ?auto_36721 ?auto_36724 ) ( ON ?auto_36721 ?auto_36729 ) ( CLEAR ?auto_36721 ) ( not ( = ?auto_36720 ?auto_36729 ) ) ( not ( = ?auto_36721 ?auto_36729 ) ) ( not ( = ?auto_36737 ?auto_36729 ) ) ( IS-CRATE ?auto_36720 ) ( AVAILABLE ?auto_36730 ) ( SURFACE-AT ?auto_36720 ?auto_36724 ) ( ON ?auto_36720 ?auto_36736 ) ( CLEAR ?auto_36720 ) ( not ( = ?auto_36720 ?auto_36736 ) ) ( not ( = ?auto_36721 ?auto_36736 ) ) ( not ( = ?auto_36737 ?auto_36736 ) ) ( not ( = ?auto_36729 ?auto_36736 ) ) ( IS-CRATE ?auto_36737 ) ( not ( = ?auto_36728 ?auto_36737 ) ) ( not ( = ?auto_36720 ?auto_36728 ) ) ( not ( = ?auto_36721 ?auto_36728 ) ) ( not ( = ?auto_36729 ?auto_36728 ) ) ( not ( = ?auto_36736 ?auto_36728 ) ) ( not ( = ?auto_36735 ?auto_36725 ) ) ( not ( = ?auto_36724 ?auto_36735 ) ) ( HOIST-AT ?auto_36726 ?auto_36735 ) ( not ( = ?auto_36727 ?auto_36726 ) ) ( not ( = ?auto_36730 ?auto_36726 ) ) ( AVAILABLE ?auto_36726 ) ( SURFACE-AT ?auto_36737 ?auto_36735 ) ( ON ?auto_36737 ?auto_36722 ) ( CLEAR ?auto_36737 ) ( not ( = ?auto_36720 ?auto_36722 ) ) ( not ( = ?auto_36721 ?auto_36722 ) ) ( not ( = ?auto_36737 ?auto_36722 ) ) ( not ( = ?auto_36729 ?auto_36722 ) ) ( not ( = ?auto_36736 ?auto_36722 ) ) ( not ( = ?auto_36728 ?auto_36722 ) ) ( IS-CRATE ?auto_36728 ) ( not ( = ?auto_36731 ?auto_36728 ) ) ( not ( = ?auto_36720 ?auto_36731 ) ) ( not ( = ?auto_36721 ?auto_36731 ) ) ( not ( = ?auto_36737 ?auto_36731 ) ) ( not ( = ?auto_36729 ?auto_36731 ) ) ( not ( = ?auto_36736 ?auto_36731 ) ) ( not ( = ?auto_36722 ?auto_36731 ) ) ( not ( = ?auto_36733 ?auto_36725 ) ) ( not ( = ?auto_36724 ?auto_36733 ) ) ( not ( = ?auto_36735 ?auto_36733 ) ) ( HOIST-AT ?auto_36738 ?auto_36733 ) ( not ( = ?auto_36727 ?auto_36738 ) ) ( not ( = ?auto_36730 ?auto_36738 ) ) ( not ( = ?auto_36726 ?auto_36738 ) ) ( SURFACE-AT ?auto_36728 ?auto_36733 ) ( ON ?auto_36728 ?auto_36734 ) ( CLEAR ?auto_36728 ) ( not ( = ?auto_36720 ?auto_36734 ) ) ( not ( = ?auto_36721 ?auto_36734 ) ) ( not ( = ?auto_36737 ?auto_36734 ) ) ( not ( = ?auto_36729 ?auto_36734 ) ) ( not ( = ?auto_36736 ?auto_36734 ) ) ( not ( = ?auto_36728 ?auto_36734 ) ) ( not ( = ?auto_36722 ?auto_36734 ) ) ( not ( = ?auto_36731 ?auto_36734 ) ) ( SURFACE-AT ?auto_36732 ?auto_36725 ) ( CLEAR ?auto_36732 ) ( IS-CRATE ?auto_36731 ) ( not ( = ?auto_36732 ?auto_36731 ) ) ( not ( = ?auto_36720 ?auto_36732 ) ) ( not ( = ?auto_36721 ?auto_36732 ) ) ( not ( = ?auto_36737 ?auto_36732 ) ) ( not ( = ?auto_36729 ?auto_36732 ) ) ( not ( = ?auto_36736 ?auto_36732 ) ) ( not ( = ?auto_36728 ?auto_36732 ) ) ( not ( = ?auto_36722 ?auto_36732 ) ) ( not ( = ?auto_36734 ?auto_36732 ) ) ( AVAILABLE ?auto_36727 ) ( TRUCK-AT ?auto_36723 ?auto_36733 ) ( AVAILABLE ?auto_36738 ) ( SURFACE-AT ?auto_36731 ?auto_36733 ) ( ON ?auto_36731 ?auto_36739 ) ( CLEAR ?auto_36731 ) ( not ( = ?auto_36720 ?auto_36739 ) ) ( not ( = ?auto_36721 ?auto_36739 ) ) ( not ( = ?auto_36737 ?auto_36739 ) ) ( not ( = ?auto_36729 ?auto_36739 ) ) ( not ( = ?auto_36736 ?auto_36739 ) ) ( not ( = ?auto_36728 ?auto_36739 ) ) ( not ( = ?auto_36722 ?auto_36739 ) ) ( not ( = ?auto_36731 ?auto_36739 ) ) ( not ( = ?auto_36734 ?auto_36739 ) ) ( not ( = ?auto_36732 ?auto_36739 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36738 ?auto_36731 ?auto_36739 ?auto_36733 )
      ( MAKE-2CRATE ?auto_36737 ?auto_36720 ?auto_36721 )
      ( MAKE-1CRATE-VERIFY ?auto_36720 ?auto_36721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36740 - SURFACE
      ?auto_36741 - SURFACE
      ?auto_36742 - SURFACE
    )
    :vars
    (
      ?auto_36748 - HOIST
      ?auto_36744 - PLACE
      ?auto_36756 - PLACE
      ?auto_36750 - HOIST
      ?auto_36747 - SURFACE
      ?auto_36743 - SURFACE
      ?auto_36752 - SURFACE
      ?auto_36757 - PLACE
      ?auto_36753 - HOIST
      ?auto_36758 - SURFACE
      ?auto_36755 - SURFACE
      ?auto_36754 - PLACE
      ?auto_36749 - HOIST
      ?auto_36746 - SURFACE
      ?auto_36745 - SURFACE
      ?auto_36751 - TRUCK
      ?auto_36759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36748 ?auto_36744 ) ( IS-CRATE ?auto_36742 ) ( not ( = ?auto_36741 ?auto_36742 ) ) ( not ( = ?auto_36740 ?auto_36741 ) ) ( not ( = ?auto_36740 ?auto_36742 ) ) ( not ( = ?auto_36756 ?auto_36744 ) ) ( HOIST-AT ?auto_36750 ?auto_36756 ) ( not ( = ?auto_36748 ?auto_36750 ) ) ( SURFACE-AT ?auto_36742 ?auto_36756 ) ( ON ?auto_36742 ?auto_36747 ) ( CLEAR ?auto_36742 ) ( not ( = ?auto_36741 ?auto_36747 ) ) ( not ( = ?auto_36742 ?auto_36747 ) ) ( not ( = ?auto_36740 ?auto_36747 ) ) ( IS-CRATE ?auto_36741 ) ( AVAILABLE ?auto_36750 ) ( SURFACE-AT ?auto_36741 ?auto_36756 ) ( ON ?auto_36741 ?auto_36743 ) ( CLEAR ?auto_36741 ) ( not ( = ?auto_36741 ?auto_36743 ) ) ( not ( = ?auto_36742 ?auto_36743 ) ) ( not ( = ?auto_36740 ?auto_36743 ) ) ( not ( = ?auto_36747 ?auto_36743 ) ) ( IS-CRATE ?auto_36740 ) ( not ( = ?auto_36752 ?auto_36740 ) ) ( not ( = ?auto_36741 ?auto_36752 ) ) ( not ( = ?auto_36742 ?auto_36752 ) ) ( not ( = ?auto_36747 ?auto_36752 ) ) ( not ( = ?auto_36743 ?auto_36752 ) ) ( not ( = ?auto_36757 ?auto_36744 ) ) ( not ( = ?auto_36756 ?auto_36757 ) ) ( HOIST-AT ?auto_36753 ?auto_36757 ) ( not ( = ?auto_36748 ?auto_36753 ) ) ( not ( = ?auto_36750 ?auto_36753 ) ) ( AVAILABLE ?auto_36753 ) ( SURFACE-AT ?auto_36740 ?auto_36757 ) ( ON ?auto_36740 ?auto_36758 ) ( CLEAR ?auto_36740 ) ( not ( = ?auto_36741 ?auto_36758 ) ) ( not ( = ?auto_36742 ?auto_36758 ) ) ( not ( = ?auto_36740 ?auto_36758 ) ) ( not ( = ?auto_36747 ?auto_36758 ) ) ( not ( = ?auto_36743 ?auto_36758 ) ) ( not ( = ?auto_36752 ?auto_36758 ) ) ( IS-CRATE ?auto_36752 ) ( not ( = ?auto_36755 ?auto_36752 ) ) ( not ( = ?auto_36741 ?auto_36755 ) ) ( not ( = ?auto_36742 ?auto_36755 ) ) ( not ( = ?auto_36740 ?auto_36755 ) ) ( not ( = ?auto_36747 ?auto_36755 ) ) ( not ( = ?auto_36743 ?auto_36755 ) ) ( not ( = ?auto_36758 ?auto_36755 ) ) ( not ( = ?auto_36754 ?auto_36744 ) ) ( not ( = ?auto_36756 ?auto_36754 ) ) ( not ( = ?auto_36757 ?auto_36754 ) ) ( HOIST-AT ?auto_36749 ?auto_36754 ) ( not ( = ?auto_36748 ?auto_36749 ) ) ( not ( = ?auto_36750 ?auto_36749 ) ) ( not ( = ?auto_36753 ?auto_36749 ) ) ( SURFACE-AT ?auto_36752 ?auto_36754 ) ( ON ?auto_36752 ?auto_36746 ) ( CLEAR ?auto_36752 ) ( not ( = ?auto_36741 ?auto_36746 ) ) ( not ( = ?auto_36742 ?auto_36746 ) ) ( not ( = ?auto_36740 ?auto_36746 ) ) ( not ( = ?auto_36747 ?auto_36746 ) ) ( not ( = ?auto_36743 ?auto_36746 ) ) ( not ( = ?auto_36752 ?auto_36746 ) ) ( not ( = ?auto_36758 ?auto_36746 ) ) ( not ( = ?auto_36755 ?auto_36746 ) ) ( SURFACE-AT ?auto_36745 ?auto_36744 ) ( CLEAR ?auto_36745 ) ( IS-CRATE ?auto_36755 ) ( not ( = ?auto_36745 ?auto_36755 ) ) ( not ( = ?auto_36741 ?auto_36745 ) ) ( not ( = ?auto_36742 ?auto_36745 ) ) ( not ( = ?auto_36740 ?auto_36745 ) ) ( not ( = ?auto_36747 ?auto_36745 ) ) ( not ( = ?auto_36743 ?auto_36745 ) ) ( not ( = ?auto_36752 ?auto_36745 ) ) ( not ( = ?auto_36758 ?auto_36745 ) ) ( not ( = ?auto_36746 ?auto_36745 ) ) ( AVAILABLE ?auto_36748 ) ( TRUCK-AT ?auto_36751 ?auto_36754 ) ( AVAILABLE ?auto_36749 ) ( SURFACE-AT ?auto_36755 ?auto_36754 ) ( ON ?auto_36755 ?auto_36759 ) ( CLEAR ?auto_36755 ) ( not ( = ?auto_36741 ?auto_36759 ) ) ( not ( = ?auto_36742 ?auto_36759 ) ) ( not ( = ?auto_36740 ?auto_36759 ) ) ( not ( = ?auto_36747 ?auto_36759 ) ) ( not ( = ?auto_36743 ?auto_36759 ) ) ( not ( = ?auto_36752 ?auto_36759 ) ) ( not ( = ?auto_36758 ?auto_36759 ) ) ( not ( = ?auto_36755 ?auto_36759 ) ) ( not ( = ?auto_36746 ?auto_36759 ) ) ( not ( = ?auto_36745 ?auto_36759 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36741 ?auto_36742 )
      ( MAKE-2CRATE-VERIFY ?auto_36740 ?auto_36741 ?auto_36742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36760 - SURFACE
      ?auto_36761 - SURFACE
      ?auto_36762 - SURFACE
      ?auto_36763 - SURFACE
    )
    :vars
    (
      ?auto_36769 - HOIST
      ?auto_36771 - PLACE
      ?auto_36773 - PLACE
      ?auto_36778 - HOIST
      ?auto_36766 - SURFACE
      ?auto_36765 - SURFACE
      ?auto_36777 - PLACE
      ?auto_36775 - HOIST
      ?auto_36764 - SURFACE
      ?auto_36767 - SURFACE
      ?auto_36774 - PLACE
      ?auto_36779 - HOIST
      ?auto_36776 - SURFACE
      ?auto_36770 - SURFACE
      ?auto_36768 - TRUCK
      ?auto_36772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36769 ?auto_36771 ) ( IS-CRATE ?auto_36763 ) ( not ( = ?auto_36762 ?auto_36763 ) ) ( not ( = ?auto_36761 ?auto_36762 ) ) ( not ( = ?auto_36761 ?auto_36763 ) ) ( not ( = ?auto_36773 ?auto_36771 ) ) ( HOIST-AT ?auto_36778 ?auto_36773 ) ( not ( = ?auto_36769 ?auto_36778 ) ) ( SURFACE-AT ?auto_36763 ?auto_36773 ) ( ON ?auto_36763 ?auto_36766 ) ( CLEAR ?auto_36763 ) ( not ( = ?auto_36762 ?auto_36766 ) ) ( not ( = ?auto_36763 ?auto_36766 ) ) ( not ( = ?auto_36761 ?auto_36766 ) ) ( IS-CRATE ?auto_36762 ) ( AVAILABLE ?auto_36778 ) ( SURFACE-AT ?auto_36762 ?auto_36773 ) ( ON ?auto_36762 ?auto_36765 ) ( CLEAR ?auto_36762 ) ( not ( = ?auto_36762 ?auto_36765 ) ) ( not ( = ?auto_36763 ?auto_36765 ) ) ( not ( = ?auto_36761 ?auto_36765 ) ) ( not ( = ?auto_36766 ?auto_36765 ) ) ( IS-CRATE ?auto_36761 ) ( not ( = ?auto_36760 ?auto_36761 ) ) ( not ( = ?auto_36762 ?auto_36760 ) ) ( not ( = ?auto_36763 ?auto_36760 ) ) ( not ( = ?auto_36766 ?auto_36760 ) ) ( not ( = ?auto_36765 ?auto_36760 ) ) ( not ( = ?auto_36777 ?auto_36771 ) ) ( not ( = ?auto_36773 ?auto_36777 ) ) ( HOIST-AT ?auto_36775 ?auto_36777 ) ( not ( = ?auto_36769 ?auto_36775 ) ) ( not ( = ?auto_36778 ?auto_36775 ) ) ( AVAILABLE ?auto_36775 ) ( SURFACE-AT ?auto_36761 ?auto_36777 ) ( ON ?auto_36761 ?auto_36764 ) ( CLEAR ?auto_36761 ) ( not ( = ?auto_36762 ?auto_36764 ) ) ( not ( = ?auto_36763 ?auto_36764 ) ) ( not ( = ?auto_36761 ?auto_36764 ) ) ( not ( = ?auto_36766 ?auto_36764 ) ) ( not ( = ?auto_36765 ?auto_36764 ) ) ( not ( = ?auto_36760 ?auto_36764 ) ) ( IS-CRATE ?auto_36760 ) ( not ( = ?auto_36767 ?auto_36760 ) ) ( not ( = ?auto_36762 ?auto_36767 ) ) ( not ( = ?auto_36763 ?auto_36767 ) ) ( not ( = ?auto_36761 ?auto_36767 ) ) ( not ( = ?auto_36766 ?auto_36767 ) ) ( not ( = ?auto_36765 ?auto_36767 ) ) ( not ( = ?auto_36764 ?auto_36767 ) ) ( not ( = ?auto_36774 ?auto_36771 ) ) ( not ( = ?auto_36773 ?auto_36774 ) ) ( not ( = ?auto_36777 ?auto_36774 ) ) ( HOIST-AT ?auto_36779 ?auto_36774 ) ( not ( = ?auto_36769 ?auto_36779 ) ) ( not ( = ?auto_36778 ?auto_36779 ) ) ( not ( = ?auto_36775 ?auto_36779 ) ) ( SURFACE-AT ?auto_36760 ?auto_36774 ) ( ON ?auto_36760 ?auto_36776 ) ( CLEAR ?auto_36760 ) ( not ( = ?auto_36762 ?auto_36776 ) ) ( not ( = ?auto_36763 ?auto_36776 ) ) ( not ( = ?auto_36761 ?auto_36776 ) ) ( not ( = ?auto_36766 ?auto_36776 ) ) ( not ( = ?auto_36765 ?auto_36776 ) ) ( not ( = ?auto_36760 ?auto_36776 ) ) ( not ( = ?auto_36764 ?auto_36776 ) ) ( not ( = ?auto_36767 ?auto_36776 ) ) ( SURFACE-AT ?auto_36770 ?auto_36771 ) ( CLEAR ?auto_36770 ) ( IS-CRATE ?auto_36767 ) ( not ( = ?auto_36770 ?auto_36767 ) ) ( not ( = ?auto_36762 ?auto_36770 ) ) ( not ( = ?auto_36763 ?auto_36770 ) ) ( not ( = ?auto_36761 ?auto_36770 ) ) ( not ( = ?auto_36766 ?auto_36770 ) ) ( not ( = ?auto_36765 ?auto_36770 ) ) ( not ( = ?auto_36760 ?auto_36770 ) ) ( not ( = ?auto_36764 ?auto_36770 ) ) ( not ( = ?auto_36776 ?auto_36770 ) ) ( AVAILABLE ?auto_36769 ) ( TRUCK-AT ?auto_36768 ?auto_36774 ) ( AVAILABLE ?auto_36779 ) ( SURFACE-AT ?auto_36767 ?auto_36774 ) ( ON ?auto_36767 ?auto_36772 ) ( CLEAR ?auto_36767 ) ( not ( = ?auto_36762 ?auto_36772 ) ) ( not ( = ?auto_36763 ?auto_36772 ) ) ( not ( = ?auto_36761 ?auto_36772 ) ) ( not ( = ?auto_36766 ?auto_36772 ) ) ( not ( = ?auto_36765 ?auto_36772 ) ) ( not ( = ?auto_36760 ?auto_36772 ) ) ( not ( = ?auto_36764 ?auto_36772 ) ) ( not ( = ?auto_36767 ?auto_36772 ) ) ( not ( = ?auto_36776 ?auto_36772 ) ) ( not ( = ?auto_36770 ?auto_36772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36761 ?auto_36762 ?auto_36763 )
      ( MAKE-3CRATE-VERIFY ?auto_36760 ?auto_36761 ?auto_36762 ?auto_36763 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36780 - SURFACE
      ?auto_36781 - SURFACE
      ?auto_36782 - SURFACE
      ?auto_36783 - SURFACE
      ?auto_36784 - SURFACE
    )
    :vars
    (
      ?auto_36789 - HOIST
      ?auto_36791 - PLACE
      ?auto_36793 - PLACE
      ?auto_36798 - HOIST
      ?auto_36787 - SURFACE
      ?auto_36786 - SURFACE
      ?auto_36797 - PLACE
      ?auto_36795 - HOIST
      ?auto_36785 - SURFACE
      ?auto_36794 - PLACE
      ?auto_36799 - HOIST
      ?auto_36796 - SURFACE
      ?auto_36790 - SURFACE
      ?auto_36788 - TRUCK
      ?auto_36792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36789 ?auto_36791 ) ( IS-CRATE ?auto_36784 ) ( not ( = ?auto_36783 ?auto_36784 ) ) ( not ( = ?auto_36782 ?auto_36783 ) ) ( not ( = ?auto_36782 ?auto_36784 ) ) ( not ( = ?auto_36793 ?auto_36791 ) ) ( HOIST-AT ?auto_36798 ?auto_36793 ) ( not ( = ?auto_36789 ?auto_36798 ) ) ( SURFACE-AT ?auto_36784 ?auto_36793 ) ( ON ?auto_36784 ?auto_36787 ) ( CLEAR ?auto_36784 ) ( not ( = ?auto_36783 ?auto_36787 ) ) ( not ( = ?auto_36784 ?auto_36787 ) ) ( not ( = ?auto_36782 ?auto_36787 ) ) ( IS-CRATE ?auto_36783 ) ( AVAILABLE ?auto_36798 ) ( SURFACE-AT ?auto_36783 ?auto_36793 ) ( ON ?auto_36783 ?auto_36786 ) ( CLEAR ?auto_36783 ) ( not ( = ?auto_36783 ?auto_36786 ) ) ( not ( = ?auto_36784 ?auto_36786 ) ) ( not ( = ?auto_36782 ?auto_36786 ) ) ( not ( = ?auto_36787 ?auto_36786 ) ) ( IS-CRATE ?auto_36782 ) ( not ( = ?auto_36781 ?auto_36782 ) ) ( not ( = ?auto_36783 ?auto_36781 ) ) ( not ( = ?auto_36784 ?auto_36781 ) ) ( not ( = ?auto_36787 ?auto_36781 ) ) ( not ( = ?auto_36786 ?auto_36781 ) ) ( not ( = ?auto_36797 ?auto_36791 ) ) ( not ( = ?auto_36793 ?auto_36797 ) ) ( HOIST-AT ?auto_36795 ?auto_36797 ) ( not ( = ?auto_36789 ?auto_36795 ) ) ( not ( = ?auto_36798 ?auto_36795 ) ) ( AVAILABLE ?auto_36795 ) ( SURFACE-AT ?auto_36782 ?auto_36797 ) ( ON ?auto_36782 ?auto_36785 ) ( CLEAR ?auto_36782 ) ( not ( = ?auto_36783 ?auto_36785 ) ) ( not ( = ?auto_36784 ?auto_36785 ) ) ( not ( = ?auto_36782 ?auto_36785 ) ) ( not ( = ?auto_36787 ?auto_36785 ) ) ( not ( = ?auto_36786 ?auto_36785 ) ) ( not ( = ?auto_36781 ?auto_36785 ) ) ( IS-CRATE ?auto_36781 ) ( not ( = ?auto_36780 ?auto_36781 ) ) ( not ( = ?auto_36783 ?auto_36780 ) ) ( not ( = ?auto_36784 ?auto_36780 ) ) ( not ( = ?auto_36782 ?auto_36780 ) ) ( not ( = ?auto_36787 ?auto_36780 ) ) ( not ( = ?auto_36786 ?auto_36780 ) ) ( not ( = ?auto_36785 ?auto_36780 ) ) ( not ( = ?auto_36794 ?auto_36791 ) ) ( not ( = ?auto_36793 ?auto_36794 ) ) ( not ( = ?auto_36797 ?auto_36794 ) ) ( HOIST-AT ?auto_36799 ?auto_36794 ) ( not ( = ?auto_36789 ?auto_36799 ) ) ( not ( = ?auto_36798 ?auto_36799 ) ) ( not ( = ?auto_36795 ?auto_36799 ) ) ( SURFACE-AT ?auto_36781 ?auto_36794 ) ( ON ?auto_36781 ?auto_36796 ) ( CLEAR ?auto_36781 ) ( not ( = ?auto_36783 ?auto_36796 ) ) ( not ( = ?auto_36784 ?auto_36796 ) ) ( not ( = ?auto_36782 ?auto_36796 ) ) ( not ( = ?auto_36787 ?auto_36796 ) ) ( not ( = ?auto_36786 ?auto_36796 ) ) ( not ( = ?auto_36781 ?auto_36796 ) ) ( not ( = ?auto_36785 ?auto_36796 ) ) ( not ( = ?auto_36780 ?auto_36796 ) ) ( SURFACE-AT ?auto_36790 ?auto_36791 ) ( CLEAR ?auto_36790 ) ( IS-CRATE ?auto_36780 ) ( not ( = ?auto_36790 ?auto_36780 ) ) ( not ( = ?auto_36783 ?auto_36790 ) ) ( not ( = ?auto_36784 ?auto_36790 ) ) ( not ( = ?auto_36782 ?auto_36790 ) ) ( not ( = ?auto_36787 ?auto_36790 ) ) ( not ( = ?auto_36786 ?auto_36790 ) ) ( not ( = ?auto_36781 ?auto_36790 ) ) ( not ( = ?auto_36785 ?auto_36790 ) ) ( not ( = ?auto_36796 ?auto_36790 ) ) ( AVAILABLE ?auto_36789 ) ( TRUCK-AT ?auto_36788 ?auto_36794 ) ( AVAILABLE ?auto_36799 ) ( SURFACE-AT ?auto_36780 ?auto_36794 ) ( ON ?auto_36780 ?auto_36792 ) ( CLEAR ?auto_36780 ) ( not ( = ?auto_36783 ?auto_36792 ) ) ( not ( = ?auto_36784 ?auto_36792 ) ) ( not ( = ?auto_36782 ?auto_36792 ) ) ( not ( = ?auto_36787 ?auto_36792 ) ) ( not ( = ?auto_36786 ?auto_36792 ) ) ( not ( = ?auto_36781 ?auto_36792 ) ) ( not ( = ?auto_36785 ?auto_36792 ) ) ( not ( = ?auto_36780 ?auto_36792 ) ) ( not ( = ?auto_36796 ?auto_36792 ) ) ( not ( = ?auto_36790 ?auto_36792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36782 ?auto_36783 ?auto_36784 )
      ( MAKE-4CRATE-VERIFY ?auto_36780 ?auto_36781 ?auto_36782 ?auto_36783 ?auto_36784 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36800 - SURFACE
      ?auto_36801 - SURFACE
      ?auto_36802 - SURFACE
      ?auto_36803 - SURFACE
      ?auto_36804 - SURFACE
      ?auto_36805 - SURFACE
    )
    :vars
    (
      ?auto_36810 - HOIST
      ?auto_36811 - PLACE
      ?auto_36813 - PLACE
      ?auto_36818 - HOIST
      ?auto_36808 - SURFACE
      ?auto_36807 - SURFACE
      ?auto_36817 - PLACE
      ?auto_36815 - HOIST
      ?auto_36806 - SURFACE
      ?auto_36814 - PLACE
      ?auto_36819 - HOIST
      ?auto_36816 - SURFACE
      ?auto_36809 - TRUCK
      ?auto_36812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36810 ?auto_36811 ) ( IS-CRATE ?auto_36805 ) ( not ( = ?auto_36804 ?auto_36805 ) ) ( not ( = ?auto_36803 ?auto_36804 ) ) ( not ( = ?auto_36803 ?auto_36805 ) ) ( not ( = ?auto_36813 ?auto_36811 ) ) ( HOIST-AT ?auto_36818 ?auto_36813 ) ( not ( = ?auto_36810 ?auto_36818 ) ) ( SURFACE-AT ?auto_36805 ?auto_36813 ) ( ON ?auto_36805 ?auto_36808 ) ( CLEAR ?auto_36805 ) ( not ( = ?auto_36804 ?auto_36808 ) ) ( not ( = ?auto_36805 ?auto_36808 ) ) ( not ( = ?auto_36803 ?auto_36808 ) ) ( IS-CRATE ?auto_36804 ) ( AVAILABLE ?auto_36818 ) ( SURFACE-AT ?auto_36804 ?auto_36813 ) ( ON ?auto_36804 ?auto_36807 ) ( CLEAR ?auto_36804 ) ( not ( = ?auto_36804 ?auto_36807 ) ) ( not ( = ?auto_36805 ?auto_36807 ) ) ( not ( = ?auto_36803 ?auto_36807 ) ) ( not ( = ?auto_36808 ?auto_36807 ) ) ( IS-CRATE ?auto_36803 ) ( not ( = ?auto_36802 ?auto_36803 ) ) ( not ( = ?auto_36804 ?auto_36802 ) ) ( not ( = ?auto_36805 ?auto_36802 ) ) ( not ( = ?auto_36808 ?auto_36802 ) ) ( not ( = ?auto_36807 ?auto_36802 ) ) ( not ( = ?auto_36817 ?auto_36811 ) ) ( not ( = ?auto_36813 ?auto_36817 ) ) ( HOIST-AT ?auto_36815 ?auto_36817 ) ( not ( = ?auto_36810 ?auto_36815 ) ) ( not ( = ?auto_36818 ?auto_36815 ) ) ( AVAILABLE ?auto_36815 ) ( SURFACE-AT ?auto_36803 ?auto_36817 ) ( ON ?auto_36803 ?auto_36806 ) ( CLEAR ?auto_36803 ) ( not ( = ?auto_36804 ?auto_36806 ) ) ( not ( = ?auto_36805 ?auto_36806 ) ) ( not ( = ?auto_36803 ?auto_36806 ) ) ( not ( = ?auto_36808 ?auto_36806 ) ) ( not ( = ?auto_36807 ?auto_36806 ) ) ( not ( = ?auto_36802 ?auto_36806 ) ) ( IS-CRATE ?auto_36802 ) ( not ( = ?auto_36801 ?auto_36802 ) ) ( not ( = ?auto_36804 ?auto_36801 ) ) ( not ( = ?auto_36805 ?auto_36801 ) ) ( not ( = ?auto_36803 ?auto_36801 ) ) ( not ( = ?auto_36808 ?auto_36801 ) ) ( not ( = ?auto_36807 ?auto_36801 ) ) ( not ( = ?auto_36806 ?auto_36801 ) ) ( not ( = ?auto_36814 ?auto_36811 ) ) ( not ( = ?auto_36813 ?auto_36814 ) ) ( not ( = ?auto_36817 ?auto_36814 ) ) ( HOIST-AT ?auto_36819 ?auto_36814 ) ( not ( = ?auto_36810 ?auto_36819 ) ) ( not ( = ?auto_36818 ?auto_36819 ) ) ( not ( = ?auto_36815 ?auto_36819 ) ) ( SURFACE-AT ?auto_36802 ?auto_36814 ) ( ON ?auto_36802 ?auto_36816 ) ( CLEAR ?auto_36802 ) ( not ( = ?auto_36804 ?auto_36816 ) ) ( not ( = ?auto_36805 ?auto_36816 ) ) ( not ( = ?auto_36803 ?auto_36816 ) ) ( not ( = ?auto_36808 ?auto_36816 ) ) ( not ( = ?auto_36807 ?auto_36816 ) ) ( not ( = ?auto_36802 ?auto_36816 ) ) ( not ( = ?auto_36806 ?auto_36816 ) ) ( not ( = ?auto_36801 ?auto_36816 ) ) ( SURFACE-AT ?auto_36800 ?auto_36811 ) ( CLEAR ?auto_36800 ) ( IS-CRATE ?auto_36801 ) ( not ( = ?auto_36800 ?auto_36801 ) ) ( not ( = ?auto_36804 ?auto_36800 ) ) ( not ( = ?auto_36805 ?auto_36800 ) ) ( not ( = ?auto_36803 ?auto_36800 ) ) ( not ( = ?auto_36808 ?auto_36800 ) ) ( not ( = ?auto_36807 ?auto_36800 ) ) ( not ( = ?auto_36802 ?auto_36800 ) ) ( not ( = ?auto_36806 ?auto_36800 ) ) ( not ( = ?auto_36816 ?auto_36800 ) ) ( AVAILABLE ?auto_36810 ) ( TRUCK-AT ?auto_36809 ?auto_36814 ) ( AVAILABLE ?auto_36819 ) ( SURFACE-AT ?auto_36801 ?auto_36814 ) ( ON ?auto_36801 ?auto_36812 ) ( CLEAR ?auto_36801 ) ( not ( = ?auto_36804 ?auto_36812 ) ) ( not ( = ?auto_36805 ?auto_36812 ) ) ( not ( = ?auto_36803 ?auto_36812 ) ) ( not ( = ?auto_36808 ?auto_36812 ) ) ( not ( = ?auto_36807 ?auto_36812 ) ) ( not ( = ?auto_36802 ?auto_36812 ) ) ( not ( = ?auto_36806 ?auto_36812 ) ) ( not ( = ?auto_36801 ?auto_36812 ) ) ( not ( = ?auto_36816 ?auto_36812 ) ) ( not ( = ?auto_36800 ?auto_36812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36803 ?auto_36804 ?auto_36805 )
      ( MAKE-5CRATE-VERIFY ?auto_36800 ?auto_36801 ?auto_36802 ?auto_36803 ?auto_36804 ?auto_36805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36820 - SURFACE
      ?auto_36821 - SURFACE
    )
    :vars
    (
      ?auto_36828 - HOIST
      ?auto_36830 - PLACE
      ?auto_36835 - SURFACE
      ?auto_36832 - PLACE
      ?auto_36838 - HOIST
      ?auto_36825 - SURFACE
      ?auto_36823 - SURFACE
      ?auto_36824 - SURFACE
      ?auto_36837 - PLACE
      ?auto_36834 - HOIST
      ?auto_36822 - SURFACE
      ?auto_36826 - SURFACE
      ?auto_36833 - PLACE
      ?auto_36839 - HOIST
      ?auto_36836 - SURFACE
      ?auto_36829 - SURFACE
      ?auto_36831 - SURFACE
      ?auto_36827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36828 ?auto_36830 ) ( IS-CRATE ?auto_36821 ) ( not ( = ?auto_36820 ?auto_36821 ) ) ( not ( = ?auto_36835 ?auto_36820 ) ) ( not ( = ?auto_36835 ?auto_36821 ) ) ( not ( = ?auto_36832 ?auto_36830 ) ) ( HOIST-AT ?auto_36838 ?auto_36832 ) ( not ( = ?auto_36828 ?auto_36838 ) ) ( SURFACE-AT ?auto_36821 ?auto_36832 ) ( ON ?auto_36821 ?auto_36825 ) ( CLEAR ?auto_36821 ) ( not ( = ?auto_36820 ?auto_36825 ) ) ( not ( = ?auto_36821 ?auto_36825 ) ) ( not ( = ?auto_36835 ?auto_36825 ) ) ( IS-CRATE ?auto_36820 ) ( AVAILABLE ?auto_36838 ) ( SURFACE-AT ?auto_36820 ?auto_36832 ) ( ON ?auto_36820 ?auto_36823 ) ( CLEAR ?auto_36820 ) ( not ( = ?auto_36820 ?auto_36823 ) ) ( not ( = ?auto_36821 ?auto_36823 ) ) ( not ( = ?auto_36835 ?auto_36823 ) ) ( not ( = ?auto_36825 ?auto_36823 ) ) ( IS-CRATE ?auto_36835 ) ( not ( = ?auto_36824 ?auto_36835 ) ) ( not ( = ?auto_36820 ?auto_36824 ) ) ( not ( = ?auto_36821 ?auto_36824 ) ) ( not ( = ?auto_36825 ?auto_36824 ) ) ( not ( = ?auto_36823 ?auto_36824 ) ) ( not ( = ?auto_36837 ?auto_36830 ) ) ( not ( = ?auto_36832 ?auto_36837 ) ) ( HOIST-AT ?auto_36834 ?auto_36837 ) ( not ( = ?auto_36828 ?auto_36834 ) ) ( not ( = ?auto_36838 ?auto_36834 ) ) ( AVAILABLE ?auto_36834 ) ( SURFACE-AT ?auto_36835 ?auto_36837 ) ( ON ?auto_36835 ?auto_36822 ) ( CLEAR ?auto_36835 ) ( not ( = ?auto_36820 ?auto_36822 ) ) ( not ( = ?auto_36821 ?auto_36822 ) ) ( not ( = ?auto_36835 ?auto_36822 ) ) ( not ( = ?auto_36825 ?auto_36822 ) ) ( not ( = ?auto_36823 ?auto_36822 ) ) ( not ( = ?auto_36824 ?auto_36822 ) ) ( IS-CRATE ?auto_36824 ) ( not ( = ?auto_36826 ?auto_36824 ) ) ( not ( = ?auto_36820 ?auto_36826 ) ) ( not ( = ?auto_36821 ?auto_36826 ) ) ( not ( = ?auto_36835 ?auto_36826 ) ) ( not ( = ?auto_36825 ?auto_36826 ) ) ( not ( = ?auto_36823 ?auto_36826 ) ) ( not ( = ?auto_36822 ?auto_36826 ) ) ( not ( = ?auto_36833 ?auto_36830 ) ) ( not ( = ?auto_36832 ?auto_36833 ) ) ( not ( = ?auto_36837 ?auto_36833 ) ) ( HOIST-AT ?auto_36839 ?auto_36833 ) ( not ( = ?auto_36828 ?auto_36839 ) ) ( not ( = ?auto_36838 ?auto_36839 ) ) ( not ( = ?auto_36834 ?auto_36839 ) ) ( SURFACE-AT ?auto_36824 ?auto_36833 ) ( ON ?auto_36824 ?auto_36836 ) ( CLEAR ?auto_36824 ) ( not ( = ?auto_36820 ?auto_36836 ) ) ( not ( = ?auto_36821 ?auto_36836 ) ) ( not ( = ?auto_36835 ?auto_36836 ) ) ( not ( = ?auto_36825 ?auto_36836 ) ) ( not ( = ?auto_36823 ?auto_36836 ) ) ( not ( = ?auto_36824 ?auto_36836 ) ) ( not ( = ?auto_36822 ?auto_36836 ) ) ( not ( = ?auto_36826 ?auto_36836 ) ) ( SURFACE-AT ?auto_36829 ?auto_36830 ) ( CLEAR ?auto_36829 ) ( IS-CRATE ?auto_36826 ) ( not ( = ?auto_36829 ?auto_36826 ) ) ( not ( = ?auto_36820 ?auto_36829 ) ) ( not ( = ?auto_36821 ?auto_36829 ) ) ( not ( = ?auto_36835 ?auto_36829 ) ) ( not ( = ?auto_36825 ?auto_36829 ) ) ( not ( = ?auto_36823 ?auto_36829 ) ) ( not ( = ?auto_36824 ?auto_36829 ) ) ( not ( = ?auto_36822 ?auto_36829 ) ) ( not ( = ?auto_36836 ?auto_36829 ) ) ( AVAILABLE ?auto_36828 ) ( AVAILABLE ?auto_36839 ) ( SURFACE-AT ?auto_36826 ?auto_36833 ) ( ON ?auto_36826 ?auto_36831 ) ( CLEAR ?auto_36826 ) ( not ( = ?auto_36820 ?auto_36831 ) ) ( not ( = ?auto_36821 ?auto_36831 ) ) ( not ( = ?auto_36835 ?auto_36831 ) ) ( not ( = ?auto_36825 ?auto_36831 ) ) ( not ( = ?auto_36823 ?auto_36831 ) ) ( not ( = ?auto_36824 ?auto_36831 ) ) ( not ( = ?auto_36822 ?auto_36831 ) ) ( not ( = ?auto_36826 ?auto_36831 ) ) ( not ( = ?auto_36836 ?auto_36831 ) ) ( not ( = ?auto_36829 ?auto_36831 ) ) ( TRUCK-AT ?auto_36827 ?auto_36830 ) )
    :subtasks
    ( ( !DRIVE ?auto_36827 ?auto_36830 ?auto_36833 )
      ( MAKE-2CRATE ?auto_36835 ?auto_36820 ?auto_36821 )
      ( MAKE-1CRATE-VERIFY ?auto_36820 ?auto_36821 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36840 - SURFACE
      ?auto_36841 - SURFACE
      ?auto_36842 - SURFACE
    )
    :vars
    (
      ?auto_36852 - HOIST
      ?auto_36853 - PLACE
      ?auto_36848 - PLACE
      ?auto_36857 - HOIST
      ?auto_36851 - SURFACE
      ?auto_36855 - SURFACE
      ?auto_36847 - SURFACE
      ?auto_36844 - PLACE
      ?auto_36854 - HOIST
      ?auto_36856 - SURFACE
      ?auto_36845 - SURFACE
      ?auto_36859 - PLACE
      ?auto_36849 - HOIST
      ?auto_36858 - SURFACE
      ?auto_36850 - SURFACE
      ?auto_36846 - SURFACE
      ?auto_36843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36852 ?auto_36853 ) ( IS-CRATE ?auto_36842 ) ( not ( = ?auto_36841 ?auto_36842 ) ) ( not ( = ?auto_36840 ?auto_36841 ) ) ( not ( = ?auto_36840 ?auto_36842 ) ) ( not ( = ?auto_36848 ?auto_36853 ) ) ( HOIST-AT ?auto_36857 ?auto_36848 ) ( not ( = ?auto_36852 ?auto_36857 ) ) ( SURFACE-AT ?auto_36842 ?auto_36848 ) ( ON ?auto_36842 ?auto_36851 ) ( CLEAR ?auto_36842 ) ( not ( = ?auto_36841 ?auto_36851 ) ) ( not ( = ?auto_36842 ?auto_36851 ) ) ( not ( = ?auto_36840 ?auto_36851 ) ) ( IS-CRATE ?auto_36841 ) ( AVAILABLE ?auto_36857 ) ( SURFACE-AT ?auto_36841 ?auto_36848 ) ( ON ?auto_36841 ?auto_36855 ) ( CLEAR ?auto_36841 ) ( not ( = ?auto_36841 ?auto_36855 ) ) ( not ( = ?auto_36842 ?auto_36855 ) ) ( not ( = ?auto_36840 ?auto_36855 ) ) ( not ( = ?auto_36851 ?auto_36855 ) ) ( IS-CRATE ?auto_36840 ) ( not ( = ?auto_36847 ?auto_36840 ) ) ( not ( = ?auto_36841 ?auto_36847 ) ) ( not ( = ?auto_36842 ?auto_36847 ) ) ( not ( = ?auto_36851 ?auto_36847 ) ) ( not ( = ?auto_36855 ?auto_36847 ) ) ( not ( = ?auto_36844 ?auto_36853 ) ) ( not ( = ?auto_36848 ?auto_36844 ) ) ( HOIST-AT ?auto_36854 ?auto_36844 ) ( not ( = ?auto_36852 ?auto_36854 ) ) ( not ( = ?auto_36857 ?auto_36854 ) ) ( AVAILABLE ?auto_36854 ) ( SURFACE-AT ?auto_36840 ?auto_36844 ) ( ON ?auto_36840 ?auto_36856 ) ( CLEAR ?auto_36840 ) ( not ( = ?auto_36841 ?auto_36856 ) ) ( not ( = ?auto_36842 ?auto_36856 ) ) ( not ( = ?auto_36840 ?auto_36856 ) ) ( not ( = ?auto_36851 ?auto_36856 ) ) ( not ( = ?auto_36855 ?auto_36856 ) ) ( not ( = ?auto_36847 ?auto_36856 ) ) ( IS-CRATE ?auto_36847 ) ( not ( = ?auto_36845 ?auto_36847 ) ) ( not ( = ?auto_36841 ?auto_36845 ) ) ( not ( = ?auto_36842 ?auto_36845 ) ) ( not ( = ?auto_36840 ?auto_36845 ) ) ( not ( = ?auto_36851 ?auto_36845 ) ) ( not ( = ?auto_36855 ?auto_36845 ) ) ( not ( = ?auto_36856 ?auto_36845 ) ) ( not ( = ?auto_36859 ?auto_36853 ) ) ( not ( = ?auto_36848 ?auto_36859 ) ) ( not ( = ?auto_36844 ?auto_36859 ) ) ( HOIST-AT ?auto_36849 ?auto_36859 ) ( not ( = ?auto_36852 ?auto_36849 ) ) ( not ( = ?auto_36857 ?auto_36849 ) ) ( not ( = ?auto_36854 ?auto_36849 ) ) ( SURFACE-AT ?auto_36847 ?auto_36859 ) ( ON ?auto_36847 ?auto_36858 ) ( CLEAR ?auto_36847 ) ( not ( = ?auto_36841 ?auto_36858 ) ) ( not ( = ?auto_36842 ?auto_36858 ) ) ( not ( = ?auto_36840 ?auto_36858 ) ) ( not ( = ?auto_36851 ?auto_36858 ) ) ( not ( = ?auto_36855 ?auto_36858 ) ) ( not ( = ?auto_36847 ?auto_36858 ) ) ( not ( = ?auto_36856 ?auto_36858 ) ) ( not ( = ?auto_36845 ?auto_36858 ) ) ( SURFACE-AT ?auto_36850 ?auto_36853 ) ( CLEAR ?auto_36850 ) ( IS-CRATE ?auto_36845 ) ( not ( = ?auto_36850 ?auto_36845 ) ) ( not ( = ?auto_36841 ?auto_36850 ) ) ( not ( = ?auto_36842 ?auto_36850 ) ) ( not ( = ?auto_36840 ?auto_36850 ) ) ( not ( = ?auto_36851 ?auto_36850 ) ) ( not ( = ?auto_36855 ?auto_36850 ) ) ( not ( = ?auto_36847 ?auto_36850 ) ) ( not ( = ?auto_36856 ?auto_36850 ) ) ( not ( = ?auto_36858 ?auto_36850 ) ) ( AVAILABLE ?auto_36852 ) ( AVAILABLE ?auto_36849 ) ( SURFACE-AT ?auto_36845 ?auto_36859 ) ( ON ?auto_36845 ?auto_36846 ) ( CLEAR ?auto_36845 ) ( not ( = ?auto_36841 ?auto_36846 ) ) ( not ( = ?auto_36842 ?auto_36846 ) ) ( not ( = ?auto_36840 ?auto_36846 ) ) ( not ( = ?auto_36851 ?auto_36846 ) ) ( not ( = ?auto_36855 ?auto_36846 ) ) ( not ( = ?auto_36847 ?auto_36846 ) ) ( not ( = ?auto_36856 ?auto_36846 ) ) ( not ( = ?auto_36845 ?auto_36846 ) ) ( not ( = ?auto_36858 ?auto_36846 ) ) ( not ( = ?auto_36850 ?auto_36846 ) ) ( TRUCK-AT ?auto_36843 ?auto_36853 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36841 ?auto_36842 )
      ( MAKE-2CRATE-VERIFY ?auto_36840 ?auto_36841 ?auto_36842 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36860 - SURFACE
      ?auto_36861 - SURFACE
      ?auto_36862 - SURFACE
      ?auto_36863 - SURFACE
    )
    :vars
    (
      ?auto_36870 - HOIST
      ?auto_36864 - PLACE
      ?auto_36873 - PLACE
      ?auto_36874 - HOIST
      ?auto_36876 - SURFACE
      ?auto_36867 - SURFACE
      ?auto_36872 - PLACE
      ?auto_36869 - HOIST
      ?auto_36866 - SURFACE
      ?auto_36875 - SURFACE
      ?auto_36878 - PLACE
      ?auto_36868 - HOIST
      ?auto_36877 - SURFACE
      ?auto_36865 - SURFACE
      ?auto_36879 - SURFACE
      ?auto_36871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36870 ?auto_36864 ) ( IS-CRATE ?auto_36863 ) ( not ( = ?auto_36862 ?auto_36863 ) ) ( not ( = ?auto_36861 ?auto_36862 ) ) ( not ( = ?auto_36861 ?auto_36863 ) ) ( not ( = ?auto_36873 ?auto_36864 ) ) ( HOIST-AT ?auto_36874 ?auto_36873 ) ( not ( = ?auto_36870 ?auto_36874 ) ) ( SURFACE-AT ?auto_36863 ?auto_36873 ) ( ON ?auto_36863 ?auto_36876 ) ( CLEAR ?auto_36863 ) ( not ( = ?auto_36862 ?auto_36876 ) ) ( not ( = ?auto_36863 ?auto_36876 ) ) ( not ( = ?auto_36861 ?auto_36876 ) ) ( IS-CRATE ?auto_36862 ) ( AVAILABLE ?auto_36874 ) ( SURFACE-AT ?auto_36862 ?auto_36873 ) ( ON ?auto_36862 ?auto_36867 ) ( CLEAR ?auto_36862 ) ( not ( = ?auto_36862 ?auto_36867 ) ) ( not ( = ?auto_36863 ?auto_36867 ) ) ( not ( = ?auto_36861 ?auto_36867 ) ) ( not ( = ?auto_36876 ?auto_36867 ) ) ( IS-CRATE ?auto_36861 ) ( not ( = ?auto_36860 ?auto_36861 ) ) ( not ( = ?auto_36862 ?auto_36860 ) ) ( not ( = ?auto_36863 ?auto_36860 ) ) ( not ( = ?auto_36876 ?auto_36860 ) ) ( not ( = ?auto_36867 ?auto_36860 ) ) ( not ( = ?auto_36872 ?auto_36864 ) ) ( not ( = ?auto_36873 ?auto_36872 ) ) ( HOIST-AT ?auto_36869 ?auto_36872 ) ( not ( = ?auto_36870 ?auto_36869 ) ) ( not ( = ?auto_36874 ?auto_36869 ) ) ( AVAILABLE ?auto_36869 ) ( SURFACE-AT ?auto_36861 ?auto_36872 ) ( ON ?auto_36861 ?auto_36866 ) ( CLEAR ?auto_36861 ) ( not ( = ?auto_36862 ?auto_36866 ) ) ( not ( = ?auto_36863 ?auto_36866 ) ) ( not ( = ?auto_36861 ?auto_36866 ) ) ( not ( = ?auto_36876 ?auto_36866 ) ) ( not ( = ?auto_36867 ?auto_36866 ) ) ( not ( = ?auto_36860 ?auto_36866 ) ) ( IS-CRATE ?auto_36860 ) ( not ( = ?auto_36875 ?auto_36860 ) ) ( not ( = ?auto_36862 ?auto_36875 ) ) ( not ( = ?auto_36863 ?auto_36875 ) ) ( not ( = ?auto_36861 ?auto_36875 ) ) ( not ( = ?auto_36876 ?auto_36875 ) ) ( not ( = ?auto_36867 ?auto_36875 ) ) ( not ( = ?auto_36866 ?auto_36875 ) ) ( not ( = ?auto_36878 ?auto_36864 ) ) ( not ( = ?auto_36873 ?auto_36878 ) ) ( not ( = ?auto_36872 ?auto_36878 ) ) ( HOIST-AT ?auto_36868 ?auto_36878 ) ( not ( = ?auto_36870 ?auto_36868 ) ) ( not ( = ?auto_36874 ?auto_36868 ) ) ( not ( = ?auto_36869 ?auto_36868 ) ) ( SURFACE-AT ?auto_36860 ?auto_36878 ) ( ON ?auto_36860 ?auto_36877 ) ( CLEAR ?auto_36860 ) ( not ( = ?auto_36862 ?auto_36877 ) ) ( not ( = ?auto_36863 ?auto_36877 ) ) ( not ( = ?auto_36861 ?auto_36877 ) ) ( not ( = ?auto_36876 ?auto_36877 ) ) ( not ( = ?auto_36867 ?auto_36877 ) ) ( not ( = ?auto_36860 ?auto_36877 ) ) ( not ( = ?auto_36866 ?auto_36877 ) ) ( not ( = ?auto_36875 ?auto_36877 ) ) ( SURFACE-AT ?auto_36865 ?auto_36864 ) ( CLEAR ?auto_36865 ) ( IS-CRATE ?auto_36875 ) ( not ( = ?auto_36865 ?auto_36875 ) ) ( not ( = ?auto_36862 ?auto_36865 ) ) ( not ( = ?auto_36863 ?auto_36865 ) ) ( not ( = ?auto_36861 ?auto_36865 ) ) ( not ( = ?auto_36876 ?auto_36865 ) ) ( not ( = ?auto_36867 ?auto_36865 ) ) ( not ( = ?auto_36860 ?auto_36865 ) ) ( not ( = ?auto_36866 ?auto_36865 ) ) ( not ( = ?auto_36877 ?auto_36865 ) ) ( AVAILABLE ?auto_36870 ) ( AVAILABLE ?auto_36868 ) ( SURFACE-AT ?auto_36875 ?auto_36878 ) ( ON ?auto_36875 ?auto_36879 ) ( CLEAR ?auto_36875 ) ( not ( = ?auto_36862 ?auto_36879 ) ) ( not ( = ?auto_36863 ?auto_36879 ) ) ( not ( = ?auto_36861 ?auto_36879 ) ) ( not ( = ?auto_36876 ?auto_36879 ) ) ( not ( = ?auto_36867 ?auto_36879 ) ) ( not ( = ?auto_36860 ?auto_36879 ) ) ( not ( = ?auto_36866 ?auto_36879 ) ) ( not ( = ?auto_36875 ?auto_36879 ) ) ( not ( = ?auto_36877 ?auto_36879 ) ) ( not ( = ?auto_36865 ?auto_36879 ) ) ( TRUCK-AT ?auto_36871 ?auto_36864 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36861 ?auto_36862 ?auto_36863 )
      ( MAKE-3CRATE-VERIFY ?auto_36860 ?auto_36861 ?auto_36862 ?auto_36863 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36880 - SURFACE
      ?auto_36881 - SURFACE
      ?auto_36882 - SURFACE
      ?auto_36883 - SURFACE
      ?auto_36884 - SURFACE
    )
    :vars
    (
      ?auto_36891 - HOIST
      ?auto_36885 - PLACE
      ?auto_36894 - PLACE
      ?auto_36895 - HOIST
      ?auto_36896 - SURFACE
      ?auto_36888 - SURFACE
      ?auto_36893 - PLACE
      ?auto_36890 - HOIST
      ?auto_36887 - SURFACE
      ?auto_36898 - PLACE
      ?auto_36889 - HOIST
      ?auto_36897 - SURFACE
      ?auto_36886 - SURFACE
      ?auto_36899 - SURFACE
      ?auto_36892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36891 ?auto_36885 ) ( IS-CRATE ?auto_36884 ) ( not ( = ?auto_36883 ?auto_36884 ) ) ( not ( = ?auto_36882 ?auto_36883 ) ) ( not ( = ?auto_36882 ?auto_36884 ) ) ( not ( = ?auto_36894 ?auto_36885 ) ) ( HOIST-AT ?auto_36895 ?auto_36894 ) ( not ( = ?auto_36891 ?auto_36895 ) ) ( SURFACE-AT ?auto_36884 ?auto_36894 ) ( ON ?auto_36884 ?auto_36896 ) ( CLEAR ?auto_36884 ) ( not ( = ?auto_36883 ?auto_36896 ) ) ( not ( = ?auto_36884 ?auto_36896 ) ) ( not ( = ?auto_36882 ?auto_36896 ) ) ( IS-CRATE ?auto_36883 ) ( AVAILABLE ?auto_36895 ) ( SURFACE-AT ?auto_36883 ?auto_36894 ) ( ON ?auto_36883 ?auto_36888 ) ( CLEAR ?auto_36883 ) ( not ( = ?auto_36883 ?auto_36888 ) ) ( not ( = ?auto_36884 ?auto_36888 ) ) ( not ( = ?auto_36882 ?auto_36888 ) ) ( not ( = ?auto_36896 ?auto_36888 ) ) ( IS-CRATE ?auto_36882 ) ( not ( = ?auto_36881 ?auto_36882 ) ) ( not ( = ?auto_36883 ?auto_36881 ) ) ( not ( = ?auto_36884 ?auto_36881 ) ) ( not ( = ?auto_36896 ?auto_36881 ) ) ( not ( = ?auto_36888 ?auto_36881 ) ) ( not ( = ?auto_36893 ?auto_36885 ) ) ( not ( = ?auto_36894 ?auto_36893 ) ) ( HOIST-AT ?auto_36890 ?auto_36893 ) ( not ( = ?auto_36891 ?auto_36890 ) ) ( not ( = ?auto_36895 ?auto_36890 ) ) ( AVAILABLE ?auto_36890 ) ( SURFACE-AT ?auto_36882 ?auto_36893 ) ( ON ?auto_36882 ?auto_36887 ) ( CLEAR ?auto_36882 ) ( not ( = ?auto_36883 ?auto_36887 ) ) ( not ( = ?auto_36884 ?auto_36887 ) ) ( not ( = ?auto_36882 ?auto_36887 ) ) ( not ( = ?auto_36896 ?auto_36887 ) ) ( not ( = ?auto_36888 ?auto_36887 ) ) ( not ( = ?auto_36881 ?auto_36887 ) ) ( IS-CRATE ?auto_36881 ) ( not ( = ?auto_36880 ?auto_36881 ) ) ( not ( = ?auto_36883 ?auto_36880 ) ) ( not ( = ?auto_36884 ?auto_36880 ) ) ( not ( = ?auto_36882 ?auto_36880 ) ) ( not ( = ?auto_36896 ?auto_36880 ) ) ( not ( = ?auto_36888 ?auto_36880 ) ) ( not ( = ?auto_36887 ?auto_36880 ) ) ( not ( = ?auto_36898 ?auto_36885 ) ) ( not ( = ?auto_36894 ?auto_36898 ) ) ( not ( = ?auto_36893 ?auto_36898 ) ) ( HOIST-AT ?auto_36889 ?auto_36898 ) ( not ( = ?auto_36891 ?auto_36889 ) ) ( not ( = ?auto_36895 ?auto_36889 ) ) ( not ( = ?auto_36890 ?auto_36889 ) ) ( SURFACE-AT ?auto_36881 ?auto_36898 ) ( ON ?auto_36881 ?auto_36897 ) ( CLEAR ?auto_36881 ) ( not ( = ?auto_36883 ?auto_36897 ) ) ( not ( = ?auto_36884 ?auto_36897 ) ) ( not ( = ?auto_36882 ?auto_36897 ) ) ( not ( = ?auto_36896 ?auto_36897 ) ) ( not ( = ?auto_36888 ?auto_36897 ) ) ( not ( = ?auto_36881 ?auto_36897 ) ) ( not ( = ?auto_36887 ?auto_36897 ) ) ( not ( = ?auto_36880 ?auto_36897 ) ) ( SURFACE-AT ?auto_36886 ?auto_36885 ) ( CLEAR ?auto_36886 ) ( IS-CRATE ?auto_36880 ) ( not ( = ?auto_36886 ?auto_36880 ) ) ( not ( = ?auto_36883 ?auto_36886 ) ) ( not ( = ?auto_36884 ?auto_36886 ) ) ( not ( = ?auto_36882 ?auto_36886 ) ) ( not ( = ?auto_36896 ?auto_36886 ) ) ( not ( = ?auto_36888 ?auto_36886 ) ) ( not ( = ?auto_36881 ?auto_36886 ) ) ( not ( = ?auto_36887 ?auto_36886 ) ) ( not ( = ?auto_36897 ?auto_36886 ) ) ( AVAILABLE ?auto_36891 ) ( AVAILABLE ?auto_36889 ) ( SURFACE-AT ?auto_36880 ?auto_36898 ) ( ON ?auto_36880 ?auto_36899 ) ( CLEAR ?auto_36880 ) ( not ( = ?auto_36883 ?auto_36899 ) ) ( not ( = ?auto_36884 ?auto_36899 ) ) ( not ( = ?auto_36882 ?auto_36899 ) ) ( not ( = ?auto_36896 ?auto_36899 ) ) ( not ( = ?auto_36888 ?auto_36899 ) ) ( not ( = ?auto_36881 ?auto_36899 ) ) ( not ( = ?auto_36887 ?auto_36899 ) ) ( not ( = ?auto_36880 ?auto_36899 ) ) ( not ( = ?auto_36897 ?auto_36899 ) ) ( not ( = ?auto_36886 ?auto_36899 ) ) ( TRUCK-AT ?auto_36892 ?auto_36885 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36882 ?auto_36883 ?auto_36884 )
      ( MAKE-4CRATE-VERIFY ?auto_36880 ?auto_36881 ?auto_36882 ?auto_36883 ?auto_36884 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36900 - SURFACE
      ?auto_36901 - SURFACE
      ?auto_36902 - SURFACE
      ?auto_36903 - SURFACE
      ?auto_36904 - SURFACE
      ?auto_36905 - SURFACE
    )
    :vars
    (
      ?auto_36911 - HOIST
      ?auto_36906 - PLACE
      ?auto_36914 - PLACE
      ?auto_36915 - HOIST
      ?auto_36916 - SURFACE
      ?auto_36908 - SURFACE
      ?auto_36913 - PLACE
      ?auto_36910 - HOIST
      ?auto_36907 - SURFACE
      ?auto_36918 - PLACE
      ?auto_36909 - HOIST
      ?auto_36917 - SURFACE
      ?auto_36919 - SURFACE
      ?auto_36912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36911 ?auto_36906 ) ( IS-CRATE ?auto_36905 ) ( not ( = ?auto_36904 ?auto_36905 ) ) ( not ( = ?auto_36903 ?auto_36904 ) ) ( not ( = ?auto_36903 ?auto_36905 ) ) ( not ( = ?auto_36914 ?auto_36906 ) ) ( HOIST-AT ?auto_36915 ?auto_36914 ) ( not ( = ?auto_36911 ?auto_36915 ) ) ( SURFACE-AT ?auto_36905 ?auto_36914 ) ( ON ?auto_36905 ?auto_36916 ) ( CLEAR ?auto_36905 ) ( not ( = ?auto_36904 ?auto_36916 ) ) ( not ( = ?auto_36905 ?auto_36916 ) ) ( not ( = ?auto_36903 ?auto_36916 ) ) ( IS-CRATE ?auto_36904 ) ( AVAILABLE ?auto_36915 ) ( SURFACE-AT ?auto_36904 ?auto_36914 ) ( ON ?auto_36904 ?auto_36908 ) ( CLEAR ?auto_36904 ) ( not ( = ?auto_36904 ?auto_36908 ) ) ( not ( = ?auto_36905 ?auto_36908 ) ) ( not ( = ?auto_36903 ?auto_36908 ) ) ( not ( = ?auto_36916 ?auto_36908 ) ) ( IS-CRATE ?auto_36903 ) ( not ( = ?auto_36902 ?auto_36903 ) ) ( not ( = ?auto_36904 ?auto_36902 ) ) ( not ( = ?auto_36905 ?auto_36902 ) ) ( not ( = ?auto_36916 ?auto_36902 ) ) ( not ( = ?auto_36908 ?auto_36902 ) ) ( not ( = ?auto_36913 ?auto_36906 ) ) ( not ( = ?auto_36914 ?auto_36913 ) ) ( HOIST-AT ?auto_36910 ?auto_36913 ) ( not ( = ?auto_36911 ?auto_36910 ) ) ( not ( = ?auto_36915 ?auto_36910 ) ) ( AVAILABLE ?auto_36910 ) ( SURFACE-AT ?auto_36903 ?auto_36913 ) ( ON ?auto_36903 ?auto_36907 ) ( CLEAR ?auto_36903 ) ( not ( = ?auto_36904 ?auto_36907 ) ) ( not ( = ?auto_36905 ?auto_36907 ) ) ( not ( = ?auto_36903 ?auto_36907 ) ) ( not ( = ?auto_36916 ?auto_36907 ) ) ( not ( = ?auto_36908 ?auto_36907 ) ) ( not ( = ?auto_36902 ?auto_36907 ) ) ( IS-CRATE ?auto_36902 ) ( not ( = ?auto_36901 ?auto_36902 ) ) ( not ( = ?auto_36904 ?auto_36901 ) ) ( not ( = ?auto_36905 ?auto_36901 ) ) ( not ( = ?auto_36903 ?auto_36901 ) ) ( not ( = ?auto_36916 ?auto_36901 ) ) ( not ( = ?auto_36908 ?auto_36901 ) ) ( not ( = ?auto_36907 ?auto_36901 ) ) ( not ( = ?auto_36918 ?auto_36906 ) ) ( not ( = ?auto_36914 ?auto_36918 ) ) ( not ( = ?auto_36913 ?auto_36918 ) ) ( HOIST-AT ?auto_36909 ?auto_36918 ) ( not ( = ?auto_36911 ?auto_36909 ) ) ( not ( = ?auto_36915 ?auto_36909 ) ) ( not ( = ?auto_36910 ?auto_36909 ) ) ( SURFACE-AT ?auto_36902 ?auto_36918 ) ( ON ?auto_36902 ?auto_36917 ) ( CLEAR ?auto_36902 ) ( not ( = ?auto_36904 ?auto_36917 ) ) ( not ( = ?auto_36905 ?auto_36917 ) ) ( not ( = ?auto_36903 ?auto_36917 ) ) ( not ( = ?auto_36916 ?auto_36917 ) ) ( not ( = ?auto_36908 ?auto_36917 ) ) ( not ( = ?auto_36902 ?auto_36917 ) ) ( not ( = ?auto_36907 ?auto_36917 ) ) ( not ( = ?auto_36901 ?auto_36917 ) ) ( SURFACE-AT ?auto_36900 ?auto_36906 ) ( CLEAR ?auto_36900 ) ( IS-CRATE ?auto_36901 ) ( not ( = ?auto_36900 ?auto_36901 ) ) ( not ( = ?auto_36904 ?auto_36900 ) ) ( not ( = ?auto_36905 ?auto_36900 ) ) ( not ( = ?auto_36903 ?auto_36900 ) ) ( not ( = ?auto_36916 ?auto_36900 ) ) ( not ( = ?auto_36908 ?auto_36900 ) ) ( not ( = ?auto_36902 ?auto_36900 ) ) ( not ( = ?auto_36907 ?auto_36900 ) ) ( not ( = ?auto_36917 ?auto_36900 ) ) ( AVAILABLE ?auto_36911 ) ( AVAILABLE ?auto_36909 ) ( SURFACE-AT ?auto_36901 ?auto_36918 ) ( ON ?auto_36901 ?auto_36919 ) ( CLEAR ?auto_36901 ) ( not ( = ?auto_36904 ?auto_36919 ) ) ( not ( = ?auto_36905 ?auto_36919 ) ) ( not ( = ?auto_36903 ?auto_36919 ) ) ( not ( = ?auto_36916 ?auto_36919 ) ) ( not ( = ?auto_36908 ?auto_36919 ) ) ( not ( = ?auto_36902 ?auto_36919 ) ) ( not ( = ?auto_36907 ?auto_36919 ) ) ( not ( = ?auto_36901 ?auto_36919 ) ) ( not ( = ?auto_36917 ?auto_36919 ) ) ( not ( = ?auto_36900 ?auto_36919 ) ) ( TRUCK-AT ?auto_36912 ?auto_36906 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36903 ?auto_36904 ?auto_36905 )
      ( MAKE-5CRATE-VERIFY ?auto_36900 ?auto_36901 ?auto_36902 ?auto_36903 ?auto_36904 ?auto_36905 ) )
  )

)

