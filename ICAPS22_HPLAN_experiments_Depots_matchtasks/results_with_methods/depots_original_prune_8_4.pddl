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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152808 - SURFACE
      ?auto_152809 - SURFACE
    )
    :vars
    (
      ?auto_152810 - HOIST
      ?auto_152811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152810 ?auto_152811 ) ( SURFACE-AT ?auto_152808 ?auto_152811 ) ( CLEAR ?auto_152808 ) ( LIFTING ?auto_152810 ?auto_152809 ) ( IS-CRATE ?auto_152809 ) ( not ( = ?auto_152808 ?auto_152809 ) ) )
    :subtasks
    ( ( !DROP ?auto_152810 ?auto_152809 ?auto_152808 ?auto_152811 )
      ( MAKE-1CRATE-VERIFY ?auto_152808 ?auto_152809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152812 - SURFACE
      ?auto_152813 - SURFACE
    )
    :vars
    (
      ?auto_152814 - HOIST
      ?auto_152815 - PLACE
      ?auto_152816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152814 ?auto_152815 ) ( SURFACE-AT ?auto_152812 ?auto_152815 ) ( CLEAR ?auto_152812 ) ( IS-CRATE ?auto_152813 ) ( not ( = ?auto_152812 ?auto_152813 ) ) ( TRUCK-AT ?auto_152816 ?auto_152815 ) ( AVAILABLE ?auto_152814 ) ( IN ?auto_152813 ?auto_152816 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152814 ?auto_152813 ?auto_152816 ?auto_152815 )
      ( MAKE-1CRATE ?auto_152812 ?auto_152813 )
      ( MAKE-1CRATE-VERIFY ?auto_152812 ?auto_152813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152817 - SURFACE
      ?auto_152818 - SURFACE
    )
    :vars
    (
      ?auto_152820 - HOIST
      ?auto_152821 - PLACE
      ?auto_152819 - TRUCK
      ?auto_152822 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152820 ?auto_152821 ) ( SURFACE-AT ?auto_152817 ?auto_152821 ) ( CLEAR ?auto_152817 ) ( IS-CRATE ?auto_152818 ) ( not ( = ?auto_152817 ?auto_152818 ) ) ( AVAILABLE ?auto_152820 ) ( IN ?auto_152818 ?auto_152819 ) ( TRUCK-AT ?auto_152819 ?auto_152822 ) ( not ( = ?auto_152822 ?auto_152821 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152819 ?auto_152822 ?auto_152821 )
      ( MAKE-1CRATE ?auto_152817 ?auto_152818 )
      ( MAKE-1CRATE-VERIFY ?auto_152817 ?auto_152818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152823 - SURFACE
      ?auto_152824 - SURFACE
    )
    :vars
    (
      ?auto_152826 - HOIST
      ?auto_152828 - PLACE
      ?auto_152825 - TRUCK
      ?auto_152827 - PLACE
      ?auto_152829 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152826 ?auto_152828 ) ( SURFACE-AT ?auto_152823 ?auto_152828 ) ( CLEAR ?auto_152823 ) ( IS-CRATE ?auto_152824 ) ( not ( = ?auto_152823 ?auto_152824 ) ) ( AVAILABLE ?auto_152826 ) ( TRUCK-AT ?auto_152825 ?auto_152827 ) ( not ( = ?auto_152827 ?auto_152828 ) ) ( HOIST-AT ?auto_152829 ?auto_152827 ) ( LIFTING ?auto_152829 ?auto_152824 ) ( not ( = ?auto_152826 ?auto_152829 ) ) )
    :subtasks
    ( ( !LOAD ?auto_152829 ?auto_152824 ?auto_152825 ?auto_152827 )
      ( MAKE-1CRATE ?auto_152823 ?auto_152824 )
      ( MAKE-1CRATE-VERIFY ?auto_152823 ?auto_152824 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152830 - SURFACE
      ?auto_152831 - SURFACE
    )
    :vars
    (
      ?auto_152832 - HOIST
      ?auto_152835 - PLACE
      ?auto_152833 - TRUCK
      ?auto_152834 - PLACE
      ?auto_152836 - HOIST
      ?auto_152837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152832 ?auto_152835 ) ( SURFACE-AT ?auto_152830 ?auto_152835 ) ( CLEAR ?auto_152830 ) ( IS-CRATE ?auto_152831 ) ( not ( = ?auto_152830 ?auto_152831 ) ) ( AVAILABLE ?auto_152832 ) ( TRUCK-AT ?auto_152833 ?auto_152834 ) ( not ( = ?auto_152834 ?auto_152835 ) ) ( HOIST-AT ?auto_152836 ?auto_152834 ) ( not ( = ?auto_152832 ?auto_152836 ) ) ( AVAILABLE ?auto_152836 ) ( SURFACE-AT ?auto_152831 ?auto_152834 ) ( ON ?auto_152831 ?auto_152837 ) ( CLEAR ?auto_152831 ) ( not ( = ?auto_152830 ?auto_152837 ) ) ( not ( = ?auto_152831 ?auto_152837 ) ) )
    :subtasks
    ( ( !LIFT ?auto_152836 ?auto_152831 ?auto_152837 ?auto_152834 )
      ( MAKE-1CRATE ?auto_152830 ?auto_152831 )
      ( MAKE-1CRATE-VERIFY ?auto_152830 ?auto_152831 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152838 - SURFACE
      ?auto_152839 - SURFACE
    )
    :vars
    (
      ?auto_152845 - HOIST
      ?auto_152842 - PLACE
      ?auto_152840 - PLACE
      ?auto_152841 - HOIST
      ?auto_152843 - SURFACE
      ?auto_152844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152845 ?auto_152842 ) ( SURFACE-AT ?auto_152838 ?auto_152842 ) ( CLEAR ?auto_152838 ) ( IS-CRATE ?auto_152839 ) ( not ( = ?auto_152838 ?auto_152839 ) ) ( AVAILABLE ?auto_152845 ) ( not ( = ?auto_152840 ?auto_152842 ) ) ( HOIST-AT ?auto_152841 ?auto_152840 ) ( not ( = ?auto_152845 ?auto_152841 ) ) ( AVAILABLE ?auto_152841 ) ( SURFACE-AT ?auto_152839 ?auto_152840 ) ( ON ?auto_152839 ?auto_152843 ) ( CLEAR ?auto_152839 ) ( not ( = ?auto_152838 ?auto_152843 ) ) ( not ( = ?auto_152839 ?auto_152843 ) ) ( TRUCK-AT ?auto_152844 ?auto_152842 ) )
    :subtasks
    ( ( !DRIVE ?auto_152844 ?auto_152842 ?auto_152840 )
      ( MAKE-1CRATE ?auto_152838 ?auto_152839 )
      ( MAKE-1CRATE-VERIFY ?auto_152838 ?auto_152839 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152855 - SURFACE
      ?auto_152856 - SURFACE
      ?auto_152857 - SURFACE
    )
    :vars
    (
      ?auto_152858 - HOIST
      ?auto_152859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152858 ?auto_152859 ) ( SURFACE-AT ?auto_152856 ?auto_152859 ) ( CLEAR ?auto_152856 ) ( LIFTING ?auto_152858 ?auto_152857 ) ( IS-CRATE ?auto_152857 ) ( not ( = ?auto_152856 ?auto_152857 ) ) ( ON ?auto_152856 ?auto_152855 ) ( not ( = ?auto_152855 ?auto_152856 ) ) ( not ( = ?auto_152855 ?auto_152857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152856 ?auto_152857 )
      ( MAKE-2CRATE-VERIFY ?auto_152855 ?auto_152856 ?auto_152857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152865 - SURFACE
      ?auto_152866 - SURFACE
      ?auto_152867 - SURFACE
    )
    :vars
    (
      ?auto_152870 - HOIST
      ?auto_152869 - PLACE
      ?auto_152868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152870 ?auto_152869 ) ( SURFACE-AT ?auto_152866 ?auto_152869 ) ( CLEAR ?auto_152866 ) ( IS-CRATE ?auto_152867 ) ( not ( = ?auto_152866 ?auto_152867 ) ) ( TRUCK-AT ?auto_152868 ?auto_152869 ) ( AVAILABLE ?auto_152870 ) ( IN ?auto_152867 ?auto_152868 ) ( ON ?auto_152866 ?auto_152865 ) ( not ( = ?auto_152865 ?auto_152866 ) ) ( not ( = ?auto_152865 ?auto_152867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152866 ?auto_152867 )
      ( MAKE-2CRATE-VERIFY ?auto_152865 ?auto_152866 ?auto_152867 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152871 - SURFACE
      ?auto_152872 - SURFACE
    )
    :vars
    (
      ?auto_152874 - HOIST
      ?auto_152875 - PLACE
      ?auto_152873 - TRUCK
      ?auto_152876 - SURFACE
      ?auto_152877 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152874 ?auto_152875 ) ( SURFACE-AT ?auto_152871 ?auto_152875 ) ( CLEAR ?auto_152871 ) ( IS-CRATE ?auto_152872 ) ( not ( = ?auto_152871 ?auto_152872 ) ) ( AVAILABLE ?auto_152874 ) ( IN ?auto_152872 ?auto_152873 ) ( ON ?auto_152871 ?auto_152876 ) ( not ( = ?auto_152876 ?auto_152871 ) ) ( not ( = ?auto_152876 ?auto_152872 ) ) ( TRUCK-AT ?auto_152873 ?auto_152877 ) ( not ( = ?auto_152877 ?auto_152875 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152873 ?auto_152877 ?auto_152875 )
      ( MAKE-2CRATE ?auto_152876 ?auto_152871 ?auto_152872 )
      ( MAKE-1CRATE-VERIFY ?auto_152871 ?auto_152872 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152878 - SURFACE
      ?auto_152879 - SURFACE
      ?auto_152880 - SURFACE
    )
    :vars
    (
      ?auto_152882 - HOIST
      ?auto_152883 - PLACE
      ?auto_152884 - TRUCK
      ?auto_152881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152882 ?auto_152883 ) ( SURFACE-AT ?auto_152879 ?auto_152883 ) ( CLEAR ?auto_152879 ) ( IS-CRATE ?auto_152880 ) ( not ( = ?auto_152879 ?auto_152880 ) ) ( AVAILABLE ?auto_152882 ) ( IN ?auto_152880 ?auto_152884 ) ( ON ?auto_152879 ?auto_152878 ) ( not ( = ?auto_152878 ?auto_152879 ) ) ( not ( = ?auto_152878 ?auto_152880 ) ) ( TRUCK-AT ?auto_152884 ?auto_152881 ) ( not ( = ?auto_152881 ?auto_152883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152879 ?auto_152880 )
      ( MAKE-2CRATE-VERIFY ?auto_152878 ?auto_152879 ?auto_152880 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152885 - SURFACE
      ?auto_152886 - SURFACE
    )
    :vars
    (
      ?auto_152891 - HOIST
      ?auto_152887 - PLACE
      ?auto_152888 - SURFACE
      ?auto_152889 - TRUCK
      ?auto_152890 - PLACE
      ?auto_152892 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152891 ?auto_152887 ) ( SURFACE-AT ?auto_152885 ?auto_152887 ) ( CLEAR ?auto_152885 ) ( IS-CRATE ?auto_152886 ) ( not ( = ?auto_152885 ?auto_152886 ) ) ( AVAILABLE ?auto_152891 ) ( ON ?auto_152885 ?auto_152888 ) ( not ( = ?auto_152888 ?auto_152885 ) ) ( not ( = ?auto_152888 ?auto_152886 ) ) ( TRUCK-AT ?auto_152889 ?auto_152890 ) ( not ( = ?auto_152890 ?auto_152887 ) ) ( HOIST-AT ?auto_152892 ?auto_152890 ) ( LIFTING ?auto_152892 ?auto_152886 ) ( not ( = ?auto_152891 ?auto_152892 ) ) )
    :subtasks
    ( ( !LOAD ?auto_152892 ?auto_152886 ?auto_152889 ?auto_152890 )
      ( MAKE-2CRATE ?auto_152888 ?auto_152885 ?auto_152886 )
      ( MAKE-1CRATE-VERIFY ?auto_152885 ?auto_152886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152893 - SURFACE
      ?auto_152894 - SURFACE
      ?auto_152895 - SURFACE
    )
    :vars
    (
      ?auto_152898 - HOIST
      ?auto_152897 - PLACE
      ?auto_152899 - TRUCK
      ?auto_152896 - PLACE
      ?auto_152900 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152898 ?auto_152897 ) ( SURFACE-AT ?auto_152894 ?auto_152897 ) ( CLEAR ?auto_152894 ) ( IS-CRATE ?auto_152895 ) ( not ( = ?auto_152894 ?auto_152895 ) ) ( AVAILABLE ?auto_152898 ) ( ON ?auto_152894 ?auto_152893 ) ( not ( = ?auto_152893 ?auto_152894 ) ) ( not ( = ?auto_152893 ?auto_152895 ) ) ( TRUCK-AT ?auto_152899 ?auto_152896 ) ( not ( = ?auto_152896 ?auto_152897 ) ) ( HOIST-AT ?auto_152900 ?auto_152896 ) ( LIFTING ?auto_152900 ?auto_152895 ) ( not ( = ?auto_152898 ?auto_152900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152894 ?auto_152895 )
      ( MAKE-2CRATE-VERIFY ?auto_152893 ?auto_152894 ?auto_152895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152901 - SURFACE
      ?auto_152902 - SURFACE
    )
    :vars
    (
      ?auto_152904 - HOIST
      ?auto_152907 - PLACE
      ?auto_152903 - SURFACE
      ?auto_152908 - TRUCK
      ?auto_152905 - PLACE
      ?auto_152906 - HOIST
      ?auto_152909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152904 ?auto_152907 ) ( SURFACE-AT ?auto_152901 ?auto_152907 ) ( CLEAR ?auto_152901 ) ( IS-CRATE ?auto_152902 ) ( not ( = ?auto_152901 ?auto_152902 ) ) ( AVAILABLE ?auto_152904 ) ( ON ?auto_152901 ?auto_152903 ) ( not ( = ?auto_152903 ?auto_152901 ) ) ( not ( = ?auto_152903 ?auto_152902 ) ) ( TRUCK-AT ?auto_152908 ?auto_152905 ) ( not ( = ?auto_152905 ?auto_152907 ) ) ( HOIST-AT ?auto_152906 ?auto_152905 ) ( not ( = ?auto_152904 ?auto_152906 ) ) ( AVAILABLE ?auto_152906 ) ( SURFACE-AT ?auto_152902 ?auto_152905 ) ( ON ?auto_152902 ?auto_152909 ) ( CLEAR ?auto_152902 ) ( not ( = ?auto_152901 ?auto_152909 ) ) ( not ( = ?auto_152902 ?auto_152909 ) ) ( not ( = ?auto_152903 ?auto_152909 ) ) )
    :subtasks
    ( ( !LIFT ?auto_152906 ?auto_152902 ?auto_152909 ?auto_152905 )
      ( MAKE-2CRATE ?auto_152903 ?auto_152901 ?auto_152902 )
      ( MAKE-1CRATE-VERIFY ?auto_152901 ?auto_152902 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152910 - SURFACE
      ?auto_152911 - SURFACE
      ?auto_152912 - SURFACE
    )
    :vars
    (
      ?auto_152913 - HOIST
      ?auto_152914 - PLACE
      ?auto_152916 - TRUCK
      ?auto_152915 - PLACE
      ?auto_152918 - HOIST
      ?auto_152917 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152913 ?auto_152914 ) ( SURFACE-AT ?auto_152911 ?auto_152914 ) ( CLEAR ?auto_152911 ) ( IS-CRATE ?auto_152912 ) ( not ( = ?auto_152911 ?auto_152912 ) ) ( AVAILABLE ?auto_152913 ) ( ON ?auto_152911 ?auto_152910 ) ( not ( = ?auto_152910 ?auto_152911 ) ) ( not ( = ?auto_152910 ?auto_152912 ) ) ( TRUCK-AT ?auto_152916 ?auto_152915 ) ( not ( = ?auto_152915 ?auto_152914 ) ) ( HOIST-AT ?auto_152918 ?auto_152915 ) ( not ( = ?auto_152913 ?auto_152918 ) ) ( AVAILABLE ?auto_152918 ) ( SURFACE-AT ?auto_152912 ?auto_152915 ) ( ON ?auto_152912 ?auto_152917 ) ( CLEAR ?auto_152912 ) ( not ( = ?auto_152911 ?auto_152917 ) ) ( not ( = ?auto_152912 ?auto_152917 ) ) ( not ( = ?auto_152910 ?auto_152917 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152911 ?auto_152912 )
      ( MAKE-2CRATE-VERIFY ?auto_152910 ?auto_152911 ?auto_152912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152919 - SURFACE
      ?auto_152920 - SURFACE
    )
    :vars
    (
      ?auto_152925 - HOIST
      ?auto_152922 - PLACE
      ?auto_152923 - SURFACE
      ?auto_152921 - PLACE
      ?auto_152924 - HOIST
      ?auto_152927 - SURFACE
      ?auto_152926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152925 ?auto_152922 ) ( SURFACE-AT ?auto_152919 ?auto_152922 ) ( CLEAR ?auto_152919 ) ( IS-CRATE ?auto_152920 ) ( not ( = ?auto_152919 ?auto_152920 ) ) ( AVAILABLE ?auto_152925 ) ( ON ?auto_152919 ?auto_152923 ) ( not ( = ?auto_152923 ?auto_152919 ) ) ( not ( = ?auto_152923 ?auto_152920 ) ) ( not ( = ?auto_152921 ?auto_152922 ) ) ( HOIST-AT ?auto_152924 ?auto_152921 ) ( not ( = ?auto_152925 ?auto_152924 ) ) ( AVAILABLE ?auto_152924 ) ( SURFACE-AT ?auto_152920 ?auto_152921 ) ( ON ?auto_152920 ?auto_152927 ) ( CLEAR ?auto_152920 ) ( not ( = ?auto_152919 ?auto_152927 ) ) ( not ( = ?auto_152920 ?auto_152927 ) ) ( not ( = ?auto_152923 ?auto_152927 ) ) ( TRUCK-AT ?auto_152926 ?auto_152922 ) )
    :subtasks
    ( ( !DRIVE ?auto_152926 ?auto_152922 ?auto_152921 )
      ( MAKE-2CRATE ?auto_152923 ?auto_152919 ?auto_152920 )
      ( MAKE-1CRATE-VERIFY ?auto_152919 ?auto_152920 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152928 - SURFACE
      ?auto_152929 - SURFACE
      ?auto_152930 - SURFACE
    )
    :vars
    (
      ?auto_152935 - HOIST
      ?auto_152932 - PLACE
      ?auto_152931 - PLACE
      ?auto_152933 - HOIST
      ?auto_152936 - SURFACE
      ?auto_152934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152935 ?auto_152932 ) ( SURFACE-AT ?auto_152929 ?auto_152932 ) ( CLEAR ?auto_152929 ) ( IS-CRATE ?auto_152930 ) ( not ( = ?auto_152929 ?auto_152930 ) ) ( AVAILABLE ?auto_152935 ) ( ON ?auto_152929 ?auto_152928 ) ( not ( = ?auto_152928 ?auto_152929 ) ) ( not ( = ?auto_152928 ?auto_152930 ) ) ( not ( = ?auto_152931 ?auto_152932 ) ) ( HOIST-AT ?auto_152933 ?auto_152931 ) ( not ( = ?auto_152935 ?auto_152933 ) ) ( AVAILABLE ?auto_152933 ) ( SURFACE-AT ?auto_152930 ?auto_152931 ) ( ON ?auto_152930 ?auto_152936 ) ( CLEAR ?auto_152930 ) ( not ( = ?auto_152929 ?auto_152936 ) ) ( not ( = ?auto_152930 ?auto_152936 ) ) ( not ( = ?auto_152928 ?auto_152936 ) ) ( TRUCK-AT ?auto_152934 ?auto_152932 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152929 ?auto_152930 )
      ( MAKE-2CRATE-VERIFY ?auto_152928 ?auto_152929 ?auto_152930 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152937 - SURFACE
      ?auto_152938 - SURFACE
    )
    :vars
    (
      ?auto_152942 - HOIST
      ?auto_152941 - PLACE
      ?auto_152943 - SURFACE
      ?auto_152944 - PLACE
      ?auto_152945 - HOIST
      ?auto_152940 - SURFACE
      ?auto_152939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152942 ?auto_152941 ) ( IS-CRATE ?auto_152938 ) ( not ( = ?auto_152937 ?auto_152938 ) ) ( not ( = ?auto_152943 ?auto_152937 ) ) ( not ( = ?auto_152943 ?auto_152938 ) ) ( not ( = ?auto_152944 ?auto_152941 ) ) ( HOIST-AT ?auto_152945 ?auto_152944 ) ( not ( = ?auto_152942 ?auto_152945 ) ) ( AVAILABLE ?auto_152945 ) ( SURFACE-AT ?auto_152938 ?auto_152944 ) ( ON ?auto_152938 ?auto_152940 ) ( CLEAR ?auto_152938 ) ( not ( = ?auto_152937 ?auto_152940 ) ) ( not ( = ?auto_152938 ?auto_152940 ) ) ( not ( = ?auto_152943 ?auto_152940 ) ) ( TRUCK-AT ?auto_152939 ?auto_152941 ) ( SURFACE-AT ?auto_152943 ?auto_152941 ) ( CLEAR ?auto_152943 ) ( LIFTING ?auto_152942 ?auto_152937 ) ( IS-CRATE ?auto_152937 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152943 ?auto_152937 )
      ( MAKE-2CRATE ?auto_152943 ?auto_152937 ?auto_152938 )
      ( MAKE-1CRATE-VERIFY ?auto_152937 ?auto_152938 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152946 - SURFACE
      ?auto_152947 - SURFACE
      ?auto_152948 - SURFACE
    )
    :vars
    (
      ?auto_152949 - HOIST
      ?auto_152950 - PLACE
      ?auto_152952 - PLACE
      ?auto_152954 - HOIST
      ?auto_152951 - SURFACE
      ?auto_152953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152949 ?auto_152950 ) ( IS-CRATE ?auto_152948 ) ( not ( = ?auto_152947 ?auto_152948 ) ) ( not ( = ?auto_152946 ?auto_152947 ) ) ( not ( = ?auto_152946 ?auto_152948 ) ) ( not ( = ?auto_152952 ?auto_152950 ) ) ( HOIST-AT ?auto_152954 ?auto_152952 ) ( not ( = ?auto_152949 ?auto_152954 ) ) ( AVAILABLE ?auto_152954 ) ( SURFACE-AT ?auto_152948 ?auto_152952 ) ( ON ?auto_152948 ?auto_152951 ) ( CLEAR ?auto_152948 ) ( not ( = ?auto_152947 ?auto_152951 ) ) ( not ( = ?auto_152948 ?auto_152951 ) ) ( not ( = ?auto_152946 ?auto_152951 ) ) ( TRUCK-AT ?auto_152953 ?auto_152950 ) ( SURFACE-AT ?auto_152946 ?auto_152950 ) ( CLEAR ?auto_152946 ) ( LIFTING ?auto_152949 ?auto_152947 ) ( IS-CRATE ?auto_152947 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152947 ?auto_152948 )
      ( MAKE-2CRATE-VERIFY ?auto_152946 ?auto_152947 ?auto_152948 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152955 - SURFACE
      ?auto_152956 - SURFACE
    )
    :vars
    (
      ?auto_152963 - HOIST
      ?auto_152961 - PLACE
      ?auto_152957 - SURFACE
      ?auto_152959 - PLACE
      ?auto_152962 - HOIST
      ?auto_152960 - SURFACE
      ?auto_152958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152963 ?auto_152961 ) ( IS-CRATE ?auto_152956 ) ( not ( = ?auto_152955 ?auto_152956 ) ) ( not ( = ?auto_152957 ?auto_152955 ) ) ( not ( = ?auto_152957 ?auto_152956 ) ) ( not ( = ?auto_152959 ?auto_152961 ) ) ( HOIST-AT ?auto_152962 ?auto_152959 ) ( not ( = ?auto_152963 ?auto_152962 ) ) ( AVAILABLE ?auto_152962 ) ( SURFACE-AT ?auto_152956 ?auto_152959 ) ( ON ?auto_152956 ?auto_152960 ) ( CLEAR ?auto_152956 ) ( not ( = ?auto_152955 ?auto_152960 ) ) ( not ( = ?auto_152956 ?auto_152960 ) ) ( not ( = ?auto_152957 ?auto_152960 ) ) ( TRUCK-AT ?auto_152958 ?auto_152961 ) ( SURFACE-AT ?auto_152957 ?auto_152961 ) ( CLEAR ?auto_152957 ) ( IS-CRATE ?auto_152955 ) ( AVAILABLE ?auto_152963 ) ( IN ?auto_152955 ?auto_152958 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152963 ?auto_152955 ?auto_152958 ?auto_152961 )
      ( MAKE-2CRATE ?auto_152957 ?auto_152955 ?auto_152956 )
      ( MAKE-1CRATE-VERIFY ?auto_152955 ?auto_152956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152964 - SURFACE
      ?auto_152965 - SURFACE
      ?auto_152966 - SURFACE
    )
    :vars
    (
      ?auto_152972 - HOIST
      ?auto_152970 - PLACE
      ?auto_152968 - PLACE
      ?auto_152969 - HOIST
      ?auto_152967 - SURFACE
      ?auto_152971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152972 ?auto_152970 ) ( IS-CRATE ?auto_152966 ) ( not ( = ?auto_152965 ?auto_152966 ) ) ( not ( = ?auto_152964 ?auto_152965 ) ) ( not ( = ?auto_152964 ?auto_152966 ) ) ( not ( = ?auto_152968 ?auto_152970 ) ) ( HOIST-AT ?auto_152969 ?auto_152968 ) ( not ( = ?auto_152972 ?auto_152969 ) ) ( AVAILABLE ?auto_152969 ) ( SURFACE-AT ?auto_152966 ?auto_152968 ) ( ON ?auto_152966 ?auto_152967 ) ( CLEAR ?auto_152966 ) ( not ( = ?auto_152965 ?auto_152967 ) ) ( not ( = ?auto_152966 ?auto_152967 ) ) ( not ( = ?auto_152964 ?auto_152967 ) ) ( TRUCK-AT ?auto_152971 ?auto_152970 ) ( SURFACE-AT ?auto_152964 ?auto_152970 ) ( CLEAR ?auto_152964 ) ( IS-CRATE ?auto_152965 ) ( AVAILABLE ?auto_152972 ) ( IN ?auto_152965 ?auto_152971 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152965 ?auto_152966 )
      ( MAKE-2CRATE-VERIFY ?auto_152964 ?auto_152965 ?auto_152966 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153009 - SURFACE
      ?auto_153010 - SURFACE
    )
    :vars
    (
      ?auto_153017 - HOIST
      ?auto_153015 - PLACE
      ?auto_153012 - SURFACE
      ?auto_153013 - PLACE
      ?auto_153014 - HOIST
      ?auto_153011 - SURFACE
      ?auto_153016 - TRUCK
      ?auto_153018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153017 ?auto_153015 ) ( SURFACE-AT ?auto_153009 ?auto_153015 ) ( CLEAR ?auto_153009 ) ( IS-CRATE ?auto_153010 ) ( not ( = ?auto_153009 ?auto_153010 ) ) ( AVAILABLE ?auto_153017 ) ( ON ?auto_153009 ?auto_153012 ) ( not ( = ?auto_153012 ?auto_153009 ) ) ( not ( = ?auto_153012 ?auto_153010 ) ) ( not ( = ?auto_153013 ?auto_153015 ) ) ( HOIST-AT ?auto_153014 ?auto_153013 ) ( not ( = ?auto_153017 ?auto_153014 ) ) ( AVAILABLE ?auto_153014 ) ( SURFACE-AT ?auto_153010 ?auto_153013 ) ( ON ?auto_153010 ?auto_153011 ) ( CLEAR ?auto_153010 ) ( not ( = ?auto_153009 ?auto_153011 ) ) ( not ( = ?auto_153010 ?auto_153011 ) ) ( not ( = ?auto_153012 ?auto_153011 ) ) ( TRUCK-AT ?auto_153016 ?auto_153018 ) ( not ( = ?auto_153018 ?auto_153015 ) ) ( not ( = ?auto_153013 ?auto_153018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_153016 ?auto_153018 ?auto_153015 )
      ( MAKE-1CRATE ?auto_153009 ?auto_153010 )
      ( MAKE-1CRATE-VERIFY ?auto_153009 ?auto_153010 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153049 - SURFACE
      ?auto_153050 - SURFACE
      ?auto_153051 - SURFACE
      ?auto_153048 - SURFACE
    )
    :vars
    (
      ?auto_153053 - HOIST
      ?auto_153052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153053 ?auto_153052 ) ( SURFACE-AT ?auto_153051 ?auto_153052 ) ( CLEAR ?auto_153051 ) ( LIFTING ?auto_153053 ?auto_153048 ) ( IS-CRATE ?auto_153048 ) ( not ( = ?auto_153051 ?auto_153048 ) ) ( ON ?auto_153050 ?auto_153049 ) ( ON ?auto_153051 ?auto_153050 ) ( not ( = ?auto_153049 ?auto_153050 ) ) ( not ( = ?auto_153049 ?auto_153051 ) ) ( not ( = ?auto_153049 ?auto_153048 ) ) ( not ( = ?auto_153050 ?auto_153051 ) ) ( not ( = ?auto_153050 ?auto_153048 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153051 ?auto_153048 )
      ( MAKE-3CRATE-VERIFY ?auto_153049 ?auto_153050 ?auto_153051 ?auto_153048 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153066 - SURFACE
      ?auto_153067 - SURFACE
      ?auto_153068 - SURFACE
      ?auto_153065 - SURFACE
    )
    :vars
    (
      ?auto_153071 - HOIST
      ?auto_153070 - PLACE
      ?auto_153069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153071 ?auto_153070 ) ( SURFACE-AT ?auto_153068 ?auto_153070 ) ( CLEAR ?auto_153068 ) ( IS-CRATE ?auto_153065 ) ( not ( = ?auto_153068 ?auto_153065 ) ) ( TRUCK-AT ?auto_153069 ?auto_153070 ) ( AVAILABLE ?auto_153071 ) ( IN ?auto_153065 ?auto_153069 ) ( ON ?auto_153068 ?auto_153067 ) ( not ( = ?auto_153067 ?auto_153068 ) ) ( not ( = ?auto_153067 ?auto_153065 ) ) ( ON ?auto_153067 ?auto_153066 ) ( not ( = ?auto_153066 ?auto_153067 ) ) ( not ( = ?auto_153066 ?auto_153068 ) ) ( not ( = ?auto_153066 ?auto_153065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153067 ?auto_153068 ?auto_153065 )
      ( MAKE-3CRATE-VERIFY ?auto_153066 ?auto_153067 ?auto_153068 ?auto_153065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153087 - SURFACE
      ?auto_153088 - SURFACE
      ?auto_153089 - SURFACE
      ?auto_153086 - SURFACE
    )
    :vars
    (
      ?auto_153093 - HOIST
      ?auto_153090 - PLACE
      ?auto_153091 - TRUCK
      ?auto_153092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153093 ?auto_153090 ) ( SURFACE-AT ?auto_153089 ?auto_153090 ) ( CLEAR ?auto_153089 ) ( IS-CRATE ?auto_153086 ) ( not ( = ?auto_153089 ?auto_153086 ) ) ( AVAILABLE ?auto_153093 ) ( IN ?auto_153086 ?auto_153091 ) ( ON ?auto_153089 ?auto_153088 ) ( not ( = ?auto_153088 ?auto_153089 ) ) ( not ( = ?auto_153088 ?auto_153086 ) ) ( TRUCK-AT ?auto_153091 ?auto_153092 ) ( not ( = ?auto_153092 ?auto_153090 ) ) ( ON ?auto_153088 ?auto_153087 ) ( not ( = ?auto_153087 ?auto_153088 ) ) ( not ( = ?auto_153087 ?auto_153089 ) ) ( not ( = ?auto_153087 ?auto_153086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153088 ?auto_153089 ?auto_153086 )
      ( MAKE-3CRATE-VERIFY ?auto_153087 ?auto_153088 ?auto_153089 ?auto_153086 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153111 - SURFACE
      ?auto_153112 - SURFACE
      ?auto_153113 - SURFACE
      ?auto_153110 - SURFACE
    )
    :vars
    (
      ?auto_153114 - HOIST
      ?auto_153117 - PLACE
      ?auto_153115 - TRUCK
      ?auto_153116 - PLACE
      ?auto_153118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_153114 ?auto_153117 ) ( SURFACE-AT ?auto_153113 ?auto_153117 ) ( CLEAR ?auto_153113 ) ( IS-CRATE ?auto_153110 ) ( not ( = ?auto_153113 ?auto_153110 ) ) ( AVAILABLE ?auto_153114 ) ( ON ?auto_153113 ?auto_153112 ) ( not ( = ?auto_153112 ?auto_153113 ) ) ( not ( = ?auto_153112 ?auto_153110 ) ) ( TRUCK-AT ?auto_153115 ?auto_153116 ) ( not ( = ?auto_153116 ?auto_153117 ) ) ( HOIST-AT ?auto_153118 ?auto_153116 ) ( LIFTING ?auto_153118 ?auto_153110 ) ( not ( = ?auto_153114 ?auto_153118 ) ) ( ON ?auto_153112 ?auto_153111 ) ( not ( = ?auto_153111 ?auto_153112 ) ) ( not ( = ?auto_153111 ?auto_153113 ) ) ( not ( = ?auto_153111 ?auto_153110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153112 ?auto_153113 ?auto_153110 )
      ( MAKE-3CRATE-VERIFY ?auto_153111 ?auto_153112 ?auto_153113 ?auto_153110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153138 - SURFACE
      ?auto_153139 - SURFACE
      ?auto_153140 - SURFACE
      ?auto_153137 - SURFACE
    )
    :vars
    (
      ?auto_153142 - HOIST
      ?auto_153143 - PLACE
      ?auto_153144 - TRUCK
      ?auto_153141 - PLACE
      ?auto_153146 - HOIST
      ?auto_153145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153142 ?auto_153143 ) ( SURFACE-AT ?auto_153140 ?auto_153143 ) ( CLEAR ?auto_153140 ) ( IS-CRATE ?auto_153137 ) ( not ( = ?auto_153140 ?auto_153137 ) ) ( AVAILABLE ?auto_153142 ) ( ON ?auto_153140 ?auto_153139 ) ( not ( = ?auto_153139 ?auto_153140 ) ) ( not ( = ?auto_153139 ?auto_153137 ) ) ( TRUCK-AT ?auto_153144 ?auto_153141 ) ( not ( = ?auto_153141 ?auto_153143 ) ) ( HOIST-AT ?auto_153146 ?auto_153141 ) ( not ( = ?auto_153142 ?auto_153146 ) ) ( AVAILABLE ?auto_153146 ) ( SURFACE-AT ?auto_153137 ?auto_153141 ) ( ON ?auto_153137 ?auto_153145 ) ( CLEAR ?auto_153137 ) ( not ( = ?auto_153140 ?auto_153145 ) ) ( not ( = ?auto_153137 ?auto_153145 ) ) ( not ( = ?auto_153139 ?auto_153145 ) ) ( ON ?auto_153139 ?auto_153138 ) ( not ( = ?auto_153138 ?auto_153139 ) ) ( not ( = ?auto_153138 ?auto_153140 ) ) ( not ( = ?auto_153138 ?auto_153137 ) ) ( not ( = ?auto_153138 ?auto_153145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153139 ?auto_153140 ?auto_153137 )
      ( MAKE-3CRATE-VERIFY ?auto_153138 ?auto_153139 ?auto_153140 ?auto_153137 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153166 - SURFACE
      ?auto_153167 - SURFACE
      ?auto_153168 - SURFACE
      ?auto_153165 - SURFACE
    )
    :vars
    (
      ?auto_153171 - HOIST
      ?auto_153174 - PLACE
      ?auto_153169 - PLACE
      ?auto_153173 - HOIST
      ?auto_153170 - SURFACE
      ?auto_153172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153171 ?auto_153174 ) ( SURFACE-AT ?auto_153168 ?auto_153174 ) ( CLEAR ?auto_153168 ) ( IS-CRATE ?auto_153165 ) ( not ( = ?auto_153168 ?auto_153165 ) ) ( AVAILABLE ?auto_153171 ) ( ON ?auto_153168 ?auto_153167 ) ( not ( = ?auto_153167 ?auto_153168 ) ) ( not ( = ?auto_153167 ?auto_153165 ) ) ( not ( = ?auto_153169 ?auto_153174 ) ) ( HOIST-AT ?auto_153173 ?auto_153169 ) ( not ( = ?auto_153171 ?auto_153173 ) ) ( AVAILABLE ?auto_153173 ) ( SURFACE-AT ?auto_153165 ?auto_153169 ) ( ON ?auto_153165 ?auto_153170 ) ( CLEAR ?auto_153165 ) ( not ( = ?auto_153168 ?auto_153170 ) ) ( not ( = ?auto_153165 ?auto_153170 ) ) ( not ( = ?auto_153167 ?auto_153170 ) ) ( TRUCK-AT ?auto_153172 ?auto_153174 ) ( ON ?auto_153167 ?auto_153166 ) ( not ( = ?auto_153166 ?auto_153167 ) ) ( not ( = ?auto_153166 ?auto_153168 ) ) ( not ( = ?auto_153166 ?auto_153165 ) ) ( not ( = ?auto_153166 ?auto_153170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153167 ?auto_153168 ?auto_153165 )
      ( MAKE-3CRATE-VERIFY ?auto_153166 ?auto_153167 ?auto_153168 ?auto_153165 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153194 - SURFACE
      ?auto_153195 - SURFACE
      ?auto_153196 - SURFACE
      ?auto_153193 - SURFACE
    )
    :vars
    (
      ?auto_153202 - HOIST
      ?auto_153201 - PLACE
      ?auto_153200 - PLACE
      ?auto_153199 - HOIST
      ?auto_153197 - SURFACE
      ?auto_153198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153202 ?auto_153201 ) ( IS-CRATE ?auto_153193 ) ( not ( = ?auto_153196 ?auto_153193 ) ) ( not ( = ?auto_153195 ?auto_153196 ) ) ( not ( = ?auto_153195 ?auto_153193 ) ) ( not ( = ?auto_153200 ?auto_153201 ) ) ( HOIST-AT ?auto_153199 ?auto_153200 ) ( not ( = ?auto_153202 ?auto_153199 ) ) ( AVAILABLE ?auto_153199 ) ( SURFACE-AT ?auto_153193 ?auto_153200 ) ( ON ?auto_153193 ?auto_153197 ) ( CLEAR ?auto_153193 ) ( not ( = ?auto_153196 ?auto_153197 ) ) ( not ( = ?auto_153193 ?auto_153197 ) ) ( not ( = ?auto_153195 ?auto_153197 ) ) ( TRUCK-AT ?auto_153198 ?auto_153201 ) ( SURFACE-AT ?auto_153195 ?auto_153201 ) ( CLEAR ?auto_153195 ) ( LIFTING ?auto_153202 ?auto_153196 ) ( IS-CRATE ?auto_153196 ) ( ON ?auto_153195 ?auto_153194 ) ( not ( = ?auto_153194 ?auto_153195 ) ) ( not ( = ?auto_153194 ?auto_153196 ) ) ( not ( = ?auto_153194 ?auto_153193 ) ) ( not ( = ?auto_153194 ?auto_153197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153195 ?auto_153196 ?auto_153193 )
      ( MAKE-3CRATE-VERIFY ?auto_153194 ?auto_153195 ?auto_153196 ?auto_153193 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153222 - SURFACE
      ?auto_153223 - SURFACE
      ?auto_153224 - SURFACE
      ?auto_153221 - SURFACE
    )
    :vars
    (
      ?auto_153226 - HOIST
      ?auto_153230 - PLACE
      ?auto_153229 - PLACE
      ?auto_153225 - HOIST
      ?auto_153228 - SURFACE
      ?auto_153227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153226 ?auto_153230 ) ( IS-CRATE ?auto_153221 ) ( not ( = ?auto_153224 ?auto_153221 ) ) ( not ( = ?auto_153223 ?auto_153224 ) ) ( not ( = ?auto_153223 ?auto_153221 ) ) ( not ( = ?auto_153229 ?auto_153230 ) ) ( HOIST-AT ?auto_153225 ?auto_153229 ) ( not ( = ?auto_153226 ?auto_153225 ) ) ( AVAILABLE ?auto_153225 ) ( SURFACE-AT ?auto_153221 ?auto_153229 ) ( ON ?auto_153221 ?auto_153228 ) ( CLEAR ?auto_153221 ) ( not ( = ?auto_153224 ?auto_153228 ) ) ( not ( = ?auto_153221 ?auto_153228 ) ) ( not ( = ?auto_153223 ?auto_153228 ) ) ( TRUCK-AT ?auto_153227 ?auto_153230 ) ( SURFACE-AT ?auto_153223 ?auto_153230 ) ( CLEAR ?auto_153223 ) ( IS-CRATE ?auto_153224 ) ( AVAILABLE ?auto_153226 ) ( IN ?auto_153224 ?auto_153227 ) ( ON ?auto_153223 ?auto_153222 ) ( not ( = ?auto_153222 ?auto_153223 ) ) ( not ( = ?auto_153222 ?auto_153224 ) ) ( not ( = ?auto_153222 ?auto_153221 ) ) ( not ( = ?auto_153222 ?auto_153228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153223 ?auto_153224 ?auto_153221 )
      ( MAKE-3CRATE-VERIFY ?auto_153222 ?auto_153223 ?auto_153224 ?auto_153221 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153513 - SURFACE
      ?auto_153514 - SURFACE
      ?auto_153515 - SURFACE
      ?auto_153512 - SURFACE
      ?auto_153516 - SURFACE
    )
    :vars
    (
      ?auto_153517 - HOIST
      ?auto_153518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153517 ?auto_153518 ) ( SURFACE-AT ?auto_153512 ?auto_153518 ) ( CLEAR ?auto_153512 ) ( LIFTING ?auto_153517 ?auto_153516 ) ( IS-CRATE ?auto_153516 ) ( not ( = ?auto_153512 ?auto_153516 ) ) ( ON ?auto_153514 ?auto_153513 ) ( ON ?auto_153515 ?auto_153514 ) ( ON ?auto_153512 ?auto_153515 ) ( not ( = ?auto_153513 ?auto_153514 ) ) ( not ( = ?auto_153513 ?auto_153515 ) ) ( not ( = ?auto_153513 ?auto_153512 ) ) ( not ( = ?auto_153513 ?auto_153516 ) ) ( not ( = ?auto_153514 ?auto_153515 ) ) ( not ( = ?auto_153514 ?auto_153512 ) ) ( not ( = ?auto_153514 ?auto_153516 ) ) ( not ( = ?auto_153515 ?auto_153512 ) ) ( not ( = ?auto_153515 ?auto_153516 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153512 ?auto_153516 )
      ( MAKE-4CRATE-VERIFY ?auto_153513 ?auto_153514 ?auto_153515 ?auto_153512 ?auto_153516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153538 - SURFACE
      ?auto_153539 - SURFACE
      ?auto_153540 - SURFACE
      ?auto_153537 - SURFACE
      ?auto_153541 - SURFACE
    )
    :vars
    (
      ?auto_153544 - HOIST
      ?auto_153543 - PLACE
      ?auto_153542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153544 ?auto_153543 ) ( SURFACE-AT ?auto_153537 ?auto_153543 ) ( CLEAR ?auto_153537 ) ( IS-CRATE ?auto_153541 ) ( not ( = ?auto_153537 ?auto_153541 ) ) ( TRUCK-AT ?auto_153542 ?auto_153543 ) ( AVAILABLE ?auto_153544 ) ( IN ?auto_153541 ?auto_153542 ) ( ON ?auto_153537 ?auto_153540 ) ( not ( = ?auto_153540 ?auto_153537 ) ) ( not ( = ?auto_153540 ?auto_153541 ) ) ( ON ?auto_153539 ?auto_153538 ) ( ON ?auto_153540 ?auto_153539 ) ( not ( = ?auto_153538 ?auto_153539 ) ) ( not ( = ?auto_153538 ?auto_153540 ) ) ( not ( = ?auto_153538 ?auto_153537 ) ) ( not ( = ?auto_153538 ?auto_153541 ) ) ( not ( = ?auto_153539 ?auto_153540 ) ) ( not ( = ?auto_153539 ?auto_153537 ) ) ( not ( = ?auto_153539 ?auto_153541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153540 ?auto_153537 ?auto_153541 )
      ( MAKE-4CRATE-VERIFY ?auto_153538 ?auto_153539 ?auto_153540 ?auto_153537 ?auto_153541 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153568 - SURFACE
      ?auto_153569 - SURFACE
      ?auto_153570 - SURFACE
      ?auto_153567 - SURFACE
      ?auto_153571 - SURFACE
    )
    :vars
    (
      ?auto_153572 - HOIST
      ?auto_153573 - PLACE
      ?auto_153575 - TRUCK
      ?auto_153574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153572 ?auto_153573 ) ( SURFACE-AT ?auto_153567 ?auto_153573 ) ( CLEAR ?auto_153567 ) ( IS-CRATE ?auto_153571 ) ( not ( = ?auto_153567 ?auto_153571 ) ) ( AVAILABLE ?auto_153572 ) ( IN ?auto_153571 ?auto_153575 ) ( ON ?auto_153567 ?auto_153570 ) ( not ( = ?auto_153570 ?auto_153567 ) ) ( not ( = ?auto_153570 ?auto_153571 ) ) ( TRUCK-AT ?auto_153575 ?auto_153574 ) ( not ( = ?auto_153574 ?auto_153573 ) ) ( ON ?auto_153569 ?auto_153568 ) ( ON ?auto_153570 ?auto_153569 ) ( not ( = ?auto_153568 ?auto_153569 ) ) ( not ( = ?auto_153568 ?auto_153570 ) ) ( not ( = ?auto_153568 ?auto_153567 ) ) ( not ( = ?auto_153568 ?auto_153571 ) ) ( not ( = ?auto_153569 ?auto_153570 ) ) ( not ( = ?auto_153569 ?auto_153567 ) ) ( not ( = ?auto_153569 ?auto_153571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153570 ?auto_153567 ?auto_153571 )
      ( MAKE-4CRATE-VERIFY ?auto_153568 ?auto_153569 ?auto_153570 ?auto_153567 ?auto_153571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153602 - SURFACE
      ?auto_153603 - SURFACE
      ?auto_153604 - SURFACE
      ?auto_153601 - SURFACE
      ?auto_153605 - SURFACE
    )
    :vars
    (
      ?auto_153607 - HOIST
      ?auto_153609 - PLACE
      ?auto_153610 - TRUCK
      ?auto_153608 - PLACE
      ?auto_153606 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_153607 ?auto_153609 ) ( SURFACE-AT ?auto_153601 ?auto_153609 ) ( CLEAR ?auto_153601 ) ( IS-CRATE ?auto_153605 ) ( not ( = ?auto_153601 ?auto_153605 ) ) ( AVAILABLE ?auto_153607 ) ( ON ?auto_153601 ?auto_153604 ) ( not ( = ?auto_153604 ?auto_153601 ) ) ( not ( = ?auto_153604 ?auto_153605 ) ) ( TRUCK-AT ?auto_153610 ?auto_153608 ) ( not ( = ?auto_153608 ?auto_153609 ) ) ( HOIST-AT ?auto_153606 ?auto_153608 ) ( LIFTING ?auto_153606 ?auto_153605 ) ( not ( = ?auto_153607 ?auto_153606 ) ) ( ON ?auto_153603 ?auto_153602 ) ( ON ?auto_153604 ?auto_153603 ) ( not ( = ?auto_153602 ?auto_153603 ) ) ( not ( = ?auto_153602 ?auto_153604 ) ) ( not ( = ?auto_153602 ?auto_153601 ) ) ( not ( = ?auto_153602 ?auto_153605 ) ) ( not ( = ?auto_153603 ?auto_153604 ) ) ( not ( = ?auto_153603 ?auto_153601 ) ) ( not ( = ?auto_153603 ?auto_153605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153604 ?auto_153601 ?auto_153605 )
      ( MAKE-4CRATE-VERIFY ?auto_153602 ?auto_153603 ?auto_153604 ?auto_153601 ?auto_153605 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153640 - SURFACE
      ?auto_153641 - SURFACE
      ?auto_153642 - SURFACE
      ?auto_153639 - SURFACE
      ?auto_153643 - SURFACE
    )
    :vars
    (
      ?auto_153649 - HOIST
      ?auto_153644 - PLACE
      ?auto_153648 - TRUCK
      ?auto_153646 - PLACE
      ?auto_153647 - HOIST
      ?auto_153645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153649 ?auto_153644 ) ( SURFACE-AT ?auto_153639 ?auto_153644 ) ( CLEAR ?auto_153639 ) ( IS-CRATE ?auto_153643 ) ( not ( = ?auto_153639 ?auto_153643 ) ) ( AVAILABLE ?auto_153649 ) ( ON ?auto_153639 ?auto_153642 ) ( not ( = ?auto_153642 ?auto_153639 ) ) ( not ( = ?auto_153642 ?auto_153643 ) ) ( TRUCK-AT ?auto_153648 ?auto_153646 ) ( not ( = ?auto_153646 ?auto_153644 ) ) ( HOIST-AT ?auto_153647 ?auto_153646 ) ( not ( = ?auto_153649 ?auto_153647 ) ) ( AVAILABLE ?auto_153647 ) ( SURFACE-AT ?auto_153643 ?auto_153646 ) ( ON ?auto_153643 ?auto_153645 ) ( CLEAR ?auto_153643 ) ( not ( = ?auto_153639 ?auto_153645 ) ) ( not ( = ?auto_153643 ?auto_153645 ) ) ( not ( = ?auto_153642 ?auto_153645 ) ) ( ON ?auto_153641 ?auto_153640 ) ( ON ?auto_153642 ?auto_153641 ) ( not ( = ?auto_153640 ?auto_153641 ) ) ( not ( = ?auto_153640 ?auto_153642 ) ) ( not ( = ?auto_153640 ?auto_153639 ) ) ( not ( = ?auto_153640 ?auto_153643 ) ) ( not ( = ?auto_153640 ?auto_153645 ) ) ( not ( = ?auto_153641 ?auto_153642 ) ) ( not ( = ?auto_153641 ?auto_153639 ) ) ( not ( = ?auto_153641 ?auto_153643 ) ) ( not ( = ?auto_153641 ?auto_153645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153642 ?auto_153639 ?auto_153643 )
      ( MAKE-4CRATE-VERIFY ?auto_153640 ?auto_153641 ?auto_153642 ?auto_153639 ?auto_153643 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153679 - SURFACE
      ?auto_153680 - SURFACE
      ?auto_153681 - SURFACE
      ?auto_153678 - SURFACE
      ?auto_153682 - SURFACE
    )
    :vars
    (
      ?auto_153684 - HOIST
      ?auto_153687 - PLACE
      ?auto_153685 - PLACE
      ?auto_153688 - HOIST
      ?auto_153683 - SURFACE
      ?auto_153686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153684 ?auto_153687 ) ( SURFACE-AT ?auto_153678 ?auto_153687 ) ( CLEAR ?auto_153678 ) ( IS-CRATE ?auto_153682 ) ( not ( = ?auto_153678 ?auto_153682 ) ) ( AVAILABLE ?auto_153684 ) ( ON ?auto_153678 ?auto_153681 ) ( not ( = ?auto_153681 ?auto_153678 ) ) ( not ( = ?auto_153681 ?auto_153682 ) ) ( not ( = ?auto_153685 ?auto_153687 ) ) ( HOIST-AT ?auto_153688 ?auto_153685 ) ( not ( = ?auto_153684 ?auto_153688 ) ) ( AVAILABLE ?auto_153688 ) ( SURFACE-AT ?auto_153682 ?auto_153685 ) ( ON ?auto_153682 ?auto_153683 ) ( CLEAR ?auto_153682 ) ( not ( = ?auto_153678 ?auto_153683 ) ) ( not ( = ?auto_153682 ?auto_153683 ) ) ( not ( = ?auto_153681 ?auto_153683 ) ) ( TRUCK-AT ?auto_153686 ?auto_153687 ) ( ON ?auto_153680 ?auto_153679 ) ( ON ?auto_153681 ?auto_153680 ) ( not ( = ?auto_153679 ?auto_153680 ) ) ( not ( = ?auto_153679 ?auto_153681 ) ) ( not ( = ?auto_153679 ?auto_153678 ) ) ( not ( = ?auto_153679 ?auto_153682 ) ) ( not ( = ?auto_153679 ?auto_153683 ) ) ( not ( = ?auto_153680 ?auto_153681 ) ) ( not ( = ?auto_153680 ?auto_153678 ) ) ( not ( = ?auto_153680 ?auto_153682 ) ) ( not ( = ?auto_153680 ?auto_153683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153681 ?auto_153678 ?auto_153682 )
      ( MAKE-4CRATE-VERIFY ?auto_153679 ?auto_153680 ?auto_153681 ?auto_153678 ?auto_153682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153718 - SURFACE
      ?auto_153719 - SURFACE
      ?auto_153720 - SURFACE
      ?auto_153717 - SURFACE
      ?auto_153721 - SURFACE
    )
    :vars
    (
      ?auto_153722 - HOIST
      ?auto_153725 - PLACE
      ?auto_153724 - PLACE
      ?auto_153726 - HOIST
      ?auto_153723 - SURFACE
      ?auto_153727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153722 ?auto_153725 ) ( IS-CRATE ?auto_153721 ) ( not ( = ?auto_153717 ?auto_153721 ) ) ( not ( = ?auto_153720 ?auto_153717 ) ) ( not ( = ?auto_153720 ?auto_153721 ) ) ( not ( = ?auto_153724 ?auto_153725 ) ) ( HOIST-AT ?auto_153726 ?auto_153724 ) ( not ( = ?auto_153722 ?auto_153726 ) ) ( AVAILABLE ?auto_153726 ) ( SURFACE-AT ?auto_153721 ?auto_153724 ) ( ON ?auto_153721 ?auto_153723 ) ( CLEAR ?auto_153721 ) ( not ( = ?auto_153717 ?auto_153723 ) ) ( not ( = ?auto_153721 ?auto_153723 ) ) ( not ( = ?auto_153720 ?auto_153723 ) ) ( TRUCK-AT ?auto_153727 ?auto_153725 ) ( SURFACE-AT ?auto_153720 ?auto_153725 ) ( CLEAR ?auto_153720 ) ( LIFTING ?auto_153722 ?auto_153717 ) ( IS-CRATE ?auto_153717 ) ( ON ?auto_153719 ?auto_153718 ) ( ON ?auto_153720 ?auto_153719 ) ( not ( = ?auto_153718 ?auto_153719 ) ) ( not ( = ?auto_153718 ?auto_153720 ) ) ( not ( = ?auto_153718 ?auto_153717 ) ) ( not ( = ?auto_153718 ?auto_153721 ) ) ( not ( = ?auto_153718 ?auto_153723 ) ) ( not ( = ?auto_153719 ?auto_153720 ) ) ( not ( = ?auto_153719 ?auto_153717 ) ) ( not ( = ?auto_153719 ?auto_153721 ) ) ( not ( = ?auto_153719 ?auto_153723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153720 ?auto_153717 ?auto_153721 )
      ( MAKE-4CRATE-VERIFY ?auto_153718 ?auto_153719 ?auto_153720 ?auto_153717 ?auto_153721 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153757 - SURFACE
      ?auto_153758 - SURFACE
      ?auto_153759 - SURFACE
      ?auto_153756 - SURFACE
      ?auto_153760 - SURFACE
    )
    :vars
    (
      ?auto_153764 - HOIST
      ?auto_153766 - PLACE
      ?auto_153765 - PLACE
      ?auto_153762 - HOIST
      ?auto_153763 - SURFACE
      ?auto_153761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153764 ?auto_153766 ) ( IS-CRATE ?auto_153760 ) ( not ( = ?auto_153756 ?auto_153760 ) ) ( not ( = ?auto_153759 ?auto_153756 ) ) ( not ( = ?auto_153759 ?auto_153760 ) ) ( not ( = ?auto_153765 ?auto_153766 ) ) ( HOIST-AT ?auto_153762 ?auto_153765 ) ( not ( = ?auto_153764 ?auto_153762 ) ) ( AVAILABLE ?auto_153762 ) ( SURFACE-AT ?auto_153760 ?auto_153765 ) ( ON ?auto_153760 ?auto_153763 ) ( CLEAR ?auto_153760 ) ( not ( = ?auto_153756 ?auto_153763 ) ) ( not ( = ?auto_153760 ?auto_153763 ) ) ( not ( = ?auto_153759 ?auto_153763 ) ) ( TRUCK-AT ?auto_153761 ?auto_153766 ) ( SURFACE-AT ?auto_153759 ?auto_153766 ) ( CLEAR ?auto_153759 ) ( IS-CRATE ?auto_153756 ) ( AVAILABLE ?auto_153764 ) ( IN ?auto_153756 ?auto_153761 ) ( ON ?auto_153758 ?auto_153757 ) ( ON ?auto_153759 ?auto_153758 ) ( not ( = ?auto_153757 ?auto_153758 ) ) ( not ( = ?auto_153757 ?auto_153759 ) ) ( not ( = ?auto_153757 ?auto_153756 ) ) ( not ( = ?auto_153757 ?auto_153760 ) ) ( not ( = ?auto_153757 ?auto_153763 ) ) ( not ( = ?auto_153758 ?auto_153759 ) ) ( not ( = ?auto_153758 ?auto_153756 ) ) ( not ( = ?auto_153758 ?auto_153760 ) ) ( not ( = ?auto_153758 ?auto_153763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153759 ?auto_153756 ?auto_153760 )
      ( MAKE-4CRATE-VERIFY ?auto_153757 ?auto_153758 ?auto_153759 ?auto_153756 ?auto_153760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153767 - SURFACE
      ?auto_153768 - SURFACE
    )
    :vars
    (
      ?auto_153772 - HOIST
      ?auto_153774 - PLACE
      ?auto_153775 - SURFACE
      ?auto_153773 - PLACE
      ?auto_153770 - HOIST
      ?auto_153771 - SURFACE
      ?auto_153769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153772 ?auto_153774 ) ( IS-CRATE ?auto_153768 ) ( not ( = ?auto_153767 ?auto_153768 ) ) ( not ( = ?auto_153775 ?auto_153767 ) ) ( not ( = ?auto_153775 ?auto_153768 ) ) ( not ( = ?auto_153773 ?auto_153774 ) ) ( HOIST-AT ?auto_153770 ?auto_153773 ) ( not ( = ?auto_153772 ?auto_153770 ) ) ( AVAILABLE ?auto_153770 ) ( SURFACE-AT ?auto_153768 ?auto_153773 ) ( ON ?auto_153768 ?auto_153771 ) ( CLEAR ?auto_153768 ) ( not ( = ?auto_153767 ?auto_153771 ) ) ( not ( = ?auto_153768 ?auto_153771 ) ) ( not ( = ?auto_153775 ?auto_153771 ) ) ( SURFACE-AT ?auto_153775 ?auto_153774 ) ( CLEAR ?auto_153775 ) ( IS-CRATE ?auto_153767 ) ( AVAILABLE ?auto_153772 ) ( IN ?auto_153767 ?auto_153769 ) ( TRUCK-AT ?auto_153769 ?auto_153773 ) )
    :subtasks
    ( ( !DRIVE ?auto_153769 ?auto_153773 ?auto_153774 )
      ( MAKE-2CRATE ?auto_153775 ?auto_153767 ?auto_153768 )
      ( MAKE-1CRATE-VERIFY ?auto_153767 ?auto_153768 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153776 - SURFACE
      ?auto_153777 - SURFACE
      ?auto_153778 - SURFACE
    )
    :vars
    (
      ?auto_153779 - HOIST
      ?auto_153780 - PLACE
      ?auto_153784 - PLACE
      ?auto_153782 - HOIST
      ?auto_153781 - SURFACE
      ?auto_153783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153779 ?auto_153780 ) ( IS-CRATE ?auto_153778 ) ( not ( = ?auto_153777 ?auto_153778 ) ) ( not ( = ?auto_153776 ?auto_153777 ) ) ( not ( = ?auto_153776 ?auto_153778 ) ) ( not ( = ?auto_153784 ?auto_153780 ) ) ( HOIST-AT ?auto_153782 ?auto_153784 ) ( not ( = ?auto_153779 ?auto_153782 ) ) ( AVAILABLE ?auto_153782 ) ( SURFACE-AT ?auto_153778 ?auto_153784 ) ( ON ?auto_153778 ?auto_153781 ) ( CLEAR ?auto_153778 ) ( not ( = ?auto_153777 ?auto_153781 ) ) ( not ( = ?auto_153778 ?auto_153781 ) ) ( not ( = ?auto_153776 ?auto_153781 ) ) ( SURFACE-AT ?auto_153776 ?auto_153780 ) ( CLEAR ?auto_153776 ) ( IS-CRATE ?auto_153777 ) ( AVAILABLE ?auto_153779 ) ( IN ?auto_153777 ?auto_153783 ) ( TRUCK-AT ?auto_153783 ?auto_153784 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153777 ?auto_153778 )
      ( MAKE-2CRATE-VERIFY ?auto_153776 ?auto_153777 ?auto_153778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153786 - SURFACE
      ?auto_153787 - SURFACE
      ?auto_153788 - SURFACE
      ?auto_153785 - SURFACE
    )
    :vars
    (
      ?auto_153794 - HOIST
      ?auto_153790 - PLACE
      ?auto_153793 - PLACE
      ?auto_153792 - HOIST
      ?auto_153791 - SURFACE
      ?auto_153789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153794 ?auto_153790 ) ( IS-CRATE ?auto_153785 ) ( not ( = ?auto_153788 ?auto_153785 ) ) ( not ( = ?auto_153787 ?auto_153788 ) ) ( not ( = ?auto_153787 ?auto_153785 ) ) ( not ( = ?auto_153793 ?auto_153790 ) ) ( HOIST-AT ?auto_153792 ?auto_153793 ) ( not ( = ?auto_153794 ?auto_153792 ) ) ( AVAILABLE ?auto_153792 ) ( SURFACE-AT ?auto_153785 ?auto_153793 ) ( ON ?auto_153785 ?auto_153791 ) ( CLEAR ?auto_153785 ) ( not ( = ?auto_153788 ?auto_153791 ) ) ( not ( = ?auto_153785 ?auto_153791 ) ) ( not ( = ?auto_153787 ?auto_153791 ) ) ( SURFACE-AT ?auto_153787 ?auto_153790 ) ( CLEAR ?auto_153787 ) ( IS-CRATE ?auto_153788 ) ( AVAILABLE ?auto_153794 ) ( IN ?auto_153788 ?auto_153789 ) ( TRUCK-AT ?auto_153789 ?auto_153793 ) ( ON ?auto_153787 ?auto_153786 ) ( not ( = ?auto_153786 ?auto_153787 ) ) ( not ( = ?auto_153786 ?auto_153788 ) ) ( not ( = ?auto_153786 ?auto_153785 ) ) ( not ( = ?auto_153786 ?auto_153791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153787 ?auto_153788 ?auto_153785 )
      ( MAKE-3CRATE-VERIFY ?auto_153786 ?auto_153787 ?auto_153788 ?auto_153785 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153796 - SURFACE
      ?auto_153797 - SURFACE
      ?auto_153798 - SURFACE
      ?auto_153795 - SURFACE
      ?auto_153799 - SURFACE
    )
    :vars
    (
      ?auto_153805 - HOIST
      ?auto_153801 - PLACE
      ?auto_153804 - PLACE
      ?auto_153803 - HOIST
      ?auto_153802 - SURFACE
      ?auto_153800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153805 ?auto_153801 ) ( IS-CRATE ?auto_153799 ) ( not ( = ?auto_153795 ?auto_153799 ) ) ( not ( = ?auto_153798 ?auto_153795 ) ) ( not ( = ?auto_153798 ?auto_153799 ) ) ( not ( = ?auto_153804 ?auto_153801 ) ) ( HOIST-AT ?auto_153803 ?auto_153804 ) ( not ( = ?auto_153805 ?auto_153803 ) ) ( AVAILABLE ?auto_153803 ) ( SURFACE-AT ?auto_153799 ?auto_153804 ) ( ON ?auto_153799 ?auto_153802 ) ( CLEAR ?auto_153799 ) ( not ( = ?auto_153795 ?auto_153802 ) ) ( not ( = ?auto_153799 ?auto_153802 ) ) ( not ( = ?auto_153798 ?auto_153802 ) ) ( SURFACE-AT ?auto_153798 ?auto_153801 ) ( CLEAR ?auto_153798 ) ( IS-CRATE ?auto_153795 ) ( AVAILABLE ?auto_153805 ) ( IN ?auto_153795 ?auto_153800 ) ( TRUCK-AT ?auto_153800 ?auto_153804 ) ( ON ?auto_153797 ?auto_153796 ) ( ON ?auto_153798 ?auto_153797 ) ( not ( = ?auto_153796 ?auto_153797 ) ) ( not ( = ?auto_153796 ?auto_153798 ) ) ( not ( = ?auto_153796 ?auto_153795 ) ) ( not ( = ?auto_153796 ?auto_153799 ) ) ( not ( = ?auto_153796 ?auto_153802 ) ) ( not ( = ?auto_153797 ?auto_153798 ) ) ( not ( = ?auto_153797 ?auto_153795 ) ) ( not ( = ?auto_153797 ?auto_153799 ) ) ( not ( = ?auto_153797 ?auto_153802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153798 ?auto_153795 ?auto_153799 )
      ( MAKE-4CRATE-VERIFY ?auto_153796 ?auto_153797 ?auto_153798 ?auto_153795 ?auto_153799 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153806 - SURFACE
      ?auto_153807 - SURFACE
    )
    :vars
    (
      ?auto_153814 - HOIST
      ?auto_153809 - PLACE
      ?auto_153812 - SURFACE
      ?auto_153813 - PLACE
      ?auto_153811 - HOIST
      ?auto_153810 - SURFACE
      ?auto_153808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153814 ?auto_153809 ) ( IS-CRATE ?auto_153807 ) ( not ( = ?auto_153806 ?auto_153807 ) ) ( not ( = ?auto_153812 ?auto_153806 ) ) ( not ( = ?auto_153812 ?auto_153807 ) ) ( not ( = ?auto_153813 ?auto_153809 ) ) ( HOIST-AT ?auto_153811 ?auto_153813 ) ( not ( = ?auto_153814 ?auto_153811 ) ) ( SURFACE-AT ?auto_153807 ?auto_153813 ) ( ON ?auto_153807 ?auto_153810 ) ( CLEAR ?auto_153807 ) ( not ( = ?auto_153806 ?auto_153810 ) ) ( not ( = ?auto_153807 ?auto_153810 ) ) ( not ( = ?auto_153812 ?auto_153810 ) ) ( SURFACE-AT ?auto_153812 ?auto_153809 ) ( CLEAR ?auto_153812 ) ( IS-CRATE ?auto_153806 ) ( AVAILABLE ?auto_153814 ) ( TRUCK-AT ?auto_153808 ?auto_153813 ) ( LIFTING ?auto_153811 ?auto_153806 ) )
    :subtasks
    ( ( !LOAD ?auto_153811 ?auto_153806 ?auto_153808 ?auto_153813 )
      ( MAKE-2CRATE ?auto_153812 ?auto_153806 ?auto_153807 )
      ( MAKE-1CRATE-VERIFY ?auto_153806 ?auto_153807 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153815 - SURFACE
      ?auto_153816 - SURFACE
      ?auto_153817 - SURFACE
    )
    :vars
    (
      ?auto_153818 - HOIST
      ?auto_153819 - PLACE
      ?auto_153821 - PLACE
      ?auto_153822 - HOIST
      ?auto_153820 - SURFACE
      ?auto_153823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153818 ?auto_153819 ) ( IS-CRATE ?auto_153817 ) ( not ( = ?auto_153816 ?auto_153817 ) ) ( not ( = ?auto_153815 ?auto_153816 ) ) ( not ( = ?auto_153815 ?auto_153817 ) ) ( not ( = ?auto_153821 ?auto_153819 ) ) ( HOIST-AT ?auto_153822 ?auto_153821 ) ( not ( = ?auto_153818 ?auto_153822 ) ) ( SURFACE-AT ?auto_153817 ?auto_153821 ) ( ON ?auto_153817 ?auto_153820 ) ( CLEAR ?auto_153817 ) ( not ( = ?auto_153816 ?auto_153820 ) ) ( not ( = ?auto_153817 ?auto_153820 ) ) ( not ( = ?auto_153815 ?auto_153820 ) ) ( SURFACE-AT ?auto_153815 ?auto_153819 ) ( CLEAR ?auto_153815 ) ( IS-CRATE ?auto_153816 ) ( AVAILABLE ?auto_153818 ) ( TRUCK-AT ?auto_153823 ?auto_153821 ) ( LIFTING ?auto_153822 ?auto_153816 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153816 ?auto_153817 )
      ( MAKE-2CRATE-VERIFY ?auto_153815 ?auto_153816 ?auto_153817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153825 - SURFACE
      ?auto_153826 - SURFACE
      ?auto_153827 - SURFACE
      ?auto_153824 - SURFACE
    )
    :vars
    (
      ?auto_153833 - HOIST
      ?auto_153832 - PLACE
      ?auto_153829 - PLACE
      ?auto_153828 - HOIST
      ?auto_153831 - SURFACE
      ?auto_153830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153833 ?auto_153832 ) ( IS-CRATE ?auto_153824 ) ( not ( = ?auto_153827 ?auto_153824 ) ) ( not ( = ?auto_153826 ?auto_153827 ) ) ( not ( = ?auto_153826 ?auto_153824 ) ) ( not ( = ?auto_153829 ?auto_153832 ) ) ( HOIST-AT ?auto_153828 ?auto_153829 ) ( not ( = ?auto_153833 ?auto_153828 ) ) ( SURFACE-AT ?auto_153824 ?auto_153829 ) ( ON ?auto_153824 ?auto_153831 ) ( CLEAR ?auto_153824 ) ( not ( = ?auto_153827 ?auto_153831 ) ) ( not ( = ?auto_153824 ?auto_153831 ) ) ( not ( = ?auto_153826 ?auto_153831 ) ) ( SURFACE-AT ?auto_153826 ?auto_153832 ) ( CLEAR ?auto_153826 ) ( IS-CRATE ?auto_153827 ) ( AVAILABLE ?auto_153833 ) ( TRUCK-AT ?auto_153830 ?auto_153829 ) ( LIFTING ?auto_153828 ?auto_153827 ) ( ON ?auto_153826 ?auto_153825 ) ( not ( = ?auto_153825 ?auto_153826 ) ) ( not ( = ?auto_153825 ?auto_153827 ) ) ( not ( = ?auto_153825 ?auto_153824 ) ) ( not ( = ?auto_153825 ?auto_153831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153826 ?auto_153827 ?auto_153824 )
      ( MAKE-3CRATE-VERIFY ?auto_153825 ?auto_153826 ?auto_153827 ?auto_153824 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153835 - SURFACE
      ?auto_153836 - SURFACE
      ?auto_153837 - SURFACE
      ?auto_153834 - SURFACE
      ?auto_153838 - SURFACE
    )
    :vars
    (
      ?auto_153844 - HOIST
      ?auto_153843 - PLACE
      ?auto_153840 - PLACE
      ?auto_153839 - HOIST
      ?auto_153842 - SURFACE
      ?auto_153841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153844 ?auto_153843 ) ( IS-CRATE ?auto_153838 ) ( not ( = ?auto_153834 ?auto_153838 ) ) ( not ( = ?auto_153837 ?auto_153834 ) ) ( not ( = ?auto_153837 ?auto_153838 ) ) ( not ( = ?auto_153840 ?auto_153843 ) ) ( HOIST-AT ?auto_153839 ?auto_153840 ) ( not ( = ?auto_153844 ?auto_153839 ) ) ( SURFACE-AT ?auto_153838 ?auto_153840 ) ( ON ?auto_153838 ?auto_153842 ) ( CLEAR ?auto_153838 ) ( not ( = ?auto_153834 ?auto_153842 ) ) ( not ( = ?auto_153838 ?auto_153842 ) ) ( not ( = ?auto_153837 ?auto_153842 ) ) ( SURFACE-AT ?auto_153837 ?auto_153843 ) ( CLEAR ?auto_153837 ) ( IS-CRATE ?auto_153834 ) ( AVAILABLE ?auto_153844 ) ( TRUCK-AT ?auto_153841 ?auto_153840 ) ( LIFTING ?auto_153839 ?auto_153834 ) ( ON ?auto_153836 ?auto_153835 ) ( ON ?auto_153837 ?auto_153836 ) ( not ( = ?auto_153835 ?auto_153836 ) ) ( not ( = ?auto_153835 ?auto_153837 ) ) ( not ( = ?auto_153835 ?auto_153834 ) ) ( not ( = ?auto_153835 ?auto_153838 ) ) ( not ( = ?auto_153835 ?auto_153842 ) ) ( not ( = ?auto_153836 ?auto_153837 ) ) ( not ( = ?auto_153836 ?auto_153834 ) ) ( not ( = ?auto_153836 ?auto_153838 ) ) ( not ( = ?auto_153836 ?auto_153842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153837 ?auto_153834 ?auto_153838 )
      ( MAKE-4CRATE-VERIFY ?auto_153835 ?auto_153836 ?auto_153837 ?auto_153834 ?auto_153838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153845 - SURFACE
      ?auto_153846 - SURFACE
    )
    :vars
    (
      ?auto_153852 - HOIST
      ?auto_153851 - PLACE
      ?auto_153853 - SURFACE
      ?auto_153848 - PLACE
      ?auto_153847 - HOIST
      ?auto_153850 - SURFACE
      ?auto_153849 - TRUCK
      ?auto_153854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153852 ?auto_153851 ) ( IS-CRATE ?auto_153846 ) ( not ( = ?auto_153845 ?auto_153846 ) ) ( not ( = ?auto_153853 ?auto_153845 ) ) ( not ( = ?auto_153853 ?auto_153846 ) ) ( not ( = ?auto_153848 ?auto_153851 ) ) ( HOIST-AT ?auto_153847 ?auto_153848 ) ( not ( = ?auto_153852 ?auto_153847 ) ) ( SURFACE-AT ?auto_153846 ?auto_153848 ) ( ON ?auto_153846 ?auto_153850 ) ( CLEAR ?auto_153846 ) ( not ( = ?auto_153845 ?auto_153850 ) ) ( not ( = ?auto_153846 ?auto_153850 ) ) ( not ( = ?auto_153853 ?auto_153850 ) ) ( SURFACE-AT ?auto_153853 ?auto_153851 ) ( CLEAR ?auto_153853 ) ( IS-CRATE ?auto_153845 ) ( AVAILABLE ?auto_153852 ) ( TRUCK-AT ?auto_153849 ?auto_153848 ) ( AVAILABLE ?auto_153847 ) ( SURFACE-AT ?auto_153845 ?auto_153848 ) ( ON ?auto_153845 ?auto_153854 ) ( CLEAR ?auto_153845 ) ( not ( = ?auto_153845 ?auto_153854 ) ) ( not ( = ?auto_153846 ?auto_153854 ) ) ( not ( = ?auto_153853 ?auto_153854 ) ) ( not ( = ?auto_153850 ?auto_153854 ) ) )
    :subtasks
    ( ( !LIFT ?auto_153847 ?auto_153845 ?auto_153854 ?auto_153848 )
      ( MAKE-2CRATE ?auto_153853 ?auto_153845 ?auto_153846 )
      ( MAKE-1CRATE-VERIFY ?auto_153845 ?auto_153846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153855 - SURFACE
      ?auto_153856 - SURFACE
      ?auto_153857 - SURFACE
    )
    :vars
    (
      ?auto_153862 - HOIST
      ?auto_153860 - PLACE
      ?auto_153863 - PLACE
      ?auto_153859 - HOIST
      ?auto_153858 - SURFACE
      ?auto_153861 - TRUCK
      ?auto_153864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153862 ?auto_153860 ) ( IS-CRATE ?auto_153857 ) ( not ( = ?auto_153856 ?auto_153857 ) ) ( not ( = ?auto_153855 ?auto_153856 ) ) ( not ( = ?auto_153855 ?auto_153857 ) ) ( not ( = ?auto_153863 ?auto_153860 ) ) ( HOIST-AT ?auto_153859 ?auto_153863 ) ( not ( = ?auto_153862 ?auto_153859 ) ) ( SURFACE-AT ?auto_153857 ?auto_153863 ) ( ON ?auto_153857 ?auto_153858 ) ( CLEAR ?auto_153857 ) ( not ( = ?auto_153856 ?auto_153858 ) ) ( not ( = ?auto_153857 ?auto_153858 ) ) ( not ( = ?auto_153855 ?auto_153858 ) ) ( SURFACE-AT ?auto_153855 ?auto_153860 ) ( CLEAR ?auto_153855 ) ( IS-CRATE ?auto_153856 ) ( AVAILABLE ?auto_153862 ) ( TRUCK-AT ?auto_153861 ?auto_153863 ) ( AVAILABLE ?auto_153859 ) ( SURFACE-AT ?auto_153856 ?auto_153863 ) ( ON ?auto_153856 ?auto_153864 ) ( CLEAR ?auto_153856 ) ( not ( = ?auto_153856 ?auto_153864 ) ) ( not ( = ?auto_153857 ?auto_153864 ) ) ( not ( = ?auto_153855 ?auto_153864 ) ) ( not ( = ?auto_153858 ?auto_153864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153856 ?auto_153857 )
      ( MAKE-2CRATE-VERIFY ?auto_153855 ?auto_153856 ?auto_153857 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153866 - SURFACE
      ?auto_153867 - SURFACE
      ?auto_153868 - SURFACE
      ?auto_153865 - SURFACE
    )
    :vars
    (
      ?auto_153875 - HOIST
      ?auto_153869 - PLACE
      ?auto_153870 - PLACE
      ?auto_153873 - HOIST
      ?auto_153872 - SURFACE
      ?auto_153874 - TRUCK
      ?auto_153871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153875 ?auto_153869 ) ( IS-CRATE ?auto_153865 ) ( not ( = ?auto_153868 ?auto_153865 ) ) ( not ( = ?auto_153867 ?auto_153868 ) ) ( not ( = ?auto_153867 ?auto_153865 ) ) ( not ( = ?auto_153870 ?auto_153869 ) ) ( HOIST-AT ?auto_153873 ?auto_153870 ) ( not ( = ?auto_153875 ?auto_153873 ) ) ( SURFACE-AT ?auto_153865 ?auto_153870 ) ( ON ?auto_153865 ?auto_153872 ) ( CLEAR ?auto_153865 ) ( not ( = ?auto_153868 ?auto_153872 ) ) ( not ( = ?auto_153865 ?auto_153872 ) ) ( not ( = ?auto_153867 ?auto_153872 ) ) ( SURFACE-AT ?auto_153867 ?auto_153869 ) ( CLEAR ?auto_153867 ) ( IS-CRATE ?auto_153868 ) ( AVAILABLE ?auto_153875 ) ( TRUCK-AT ?auto_153874 ?auto_153870 ) ( AVAILABLE ?auto_153873 ) ( SURFACE-AT ?auto_153868 ?auto_153870 ) ( ON ?auto_153868 ?auto_153871 ) ( CLEAR ?auto_153868 ) ( not ( = ?auto_153868 ?auto_153871 ) ) ( not ( = ?auto_153865 ?auto_153871 ) ) ( not ( = ?auto_153867 ?auto_153871 ) ) ( not ( = ?auto_153872 ?auto_153871 ) ) ( ON ?auto_153867 ?auto_153866 ) ( not ( = ?auto_153866 ?auto_153867 ) ) ( not ( = ?auto_153866 ?auto_153868 ) ) ( not ( = ?auto_153866 ?auto_153865 ) ) ( not ( = ?auto_153866 ?auto_153872 ) ) ( not ( = ?auto_153866 ?auto_153871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153867 ?auto_153868 ?auto_153865 )
      ( MAKE-3CRATE-VERIFY ?auto_153866 ?auto_153867 ?auto_153868 ?auto_153865 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153877 - SURFACE
      ?auto_153878 - SURFACE
      ?auto_153879 - SURFACE
      ?auto_153876 - SURFACE
      ?auto_153880 - SURFACE
    )
    :vars
    (
      ?auto_153887 - HOIST
      ?auto_153881 - PLACE
      ?auto_153882 - PLACE
      ?auto_153885 - HOIST
      ?auto_153884 - SURFACE
      ?auto_153886 - TRUCK
      ?auto_153883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153887 ?auto_153881 ) ( IS-CRATE ?auto_153880 ) ( not ( = ?auto_153876 ?auto_153880 ) ) ( not ( = ?auto_153879 ?auto_153876 ) ) ( not ( = ?auto_153879 ?auto_153880 ) ) ( not ( = ?auto_153882 ?auto_153881 ) ) ( HOIST-AT ?auto_153885 ?auto_153882 ) ( not ( = ?auto_153887 ?auto_153885 ) ) ( SURFACE-AT ?auto_153880 ?auto_153882 ) ( ON ?auto_153880 ?auto_153884 ) ( CLEAR ?auto_153880 ) ( not ( = ?auto_153876 ?auto_153884 ) ) ( not ( = ?auto_153880 ?auto_153884 ) ) ( not ( = ?auto_153879 ?auto_153884 ) ) ( SURFACE-AT ?auto_153879 ?auto_153881 ) ( CLEAR ?auto_153879 ) ( IS-CRATE ?auto_153876 ) ( AVAILABLE ?auto_153887 ) ( TRUCK-AT ?auto_153886 ?auto_153882 ) ( AVAILABLE ?auto_153885 ) ( SURFACE-AT ?auto_153876 ?auto_153882 ) ( ON ?auto_153876 ?auto_153883 ) ( CLEAR ?auto_153876 ) ( not ( = ?auto_153876 ?auto_153883 ) ) ( not ( = ?auto_153880 ?auto_153883 ) ) ( not ( = ?auto_153879 ?auto_153883 ) ) ( not ( = ?auto_153884 ?auto_153883 ) ) ( ON ?auto_153878 ?auto_153877 ) ( ON ?auto_153879 ?auto_153878 ) ( not ( = ?auto_153877 ?auto_153878 ) ) ( not ( = ?auto_153877 ?auto_153879 ) ) ( not ( = ?auto_153877 ?auto_153876 ) ) ( not ( = ?auto_153877 ?auto_153880 ) ) ( not ( = ?auto_153877 ?auto_153884 ) ) ( not ( = ?auto_153877 ?auto_153883 ) ) ( not ( = ?auto_153878 ?auto_153879 ) ) ( not ( = ?auto_153878 ?auto_153876 ) ) ( not ( = ?auto_153878 ?auto_153880 ) ) ( not ( = ?auto_153878 ?auto_153884 ) ) ( not ( = ?auto_153878 ?auto_153883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153879 ?auto_153876 ?auto_153880 )
      ( MAKE-4CRATE-VERIFY ?auto_153877 ?auto_153878 ?auto_153879 ?auto_153876 ?auto_153880 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153888 - SURFACE
      ?auto_153889 - SURFACE
    )
    :vars
    (
      ?auto_153897 - HOIST
      ?auto_153890 - PLACE
      ?auto_153892 - SURFACE
      ?auto_153891 - PLACE
      ?auto_153895 - HOIST
      ?auto_153894 - SURFACE
      ?auto_153893 - SURFACE
      ?auto_153896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153897 ?auto_153890 ) ( IS-CRATE ?auto_153889 ) ( not ( = ?auto_153888 ?auto_153889 ) ) ( not ( = ?auto_153892 ?auto_153888 ) ) ( not ( = ?auto_153892 ?auto_153889 ) ) ( not ( = ?auto_153891 ?auto_153890 ) ) ( HOIST-AT ?auto_153895 ?auto_153891 ) ( not ( = ?auto_153897 ?auto_153895 ) ) ( SURFACE-AT ?auto_153889 ?auto_153891 ) ( ON ?auto_153889 ?auto_153894 ) ( CLEAR ?auto_153889 ) ( not ( = ?auto_153888 ?auto_153894 ) ) ( not ( = ?auto_153889 ?auto_153894 ) ) ( not ( = ?auto_153892 ?auto_153894 ) ) ( SURFACE-AT ?auto_153892 ?auto_153890 ) ( CLEAR ?auto_153892 ) ( IS-CRATE ?auto_153888 ) ( AVAILABLE ?auto_153897 ) ( AVAILABLE ?auto_153895 ) ( SURFACE-AT ?auto_153888 ?auto_153891 ) ( ON ?auto_153888 ?auto_153893 ) ( CLEAR ?auto_153888 ) ( not ( = ?auto_153888 ?auto_153893 ) ) ( not ( = ?auto_153889 ?auto_153893 ) ) ( not ( = ?auto_153892 ?auto_153893 ) ) ( not ( = ?auto_153894 ?auto_153893 ) ) ( TRUCK-AT ?auto_153896 ?auto_153890 ) )
    :subtasks
    ( ( !DRIVE ?auto_153896 ?auto_153890 ?auto_153891 )
      ( MAKE-2CRATE ?auto_153892 ?auto_153888 ?auto_153889 )
      ( MAKE-1CRATE-VERIFY ?auto_153888 ?auto_153889 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153898 - SURFACE
      ?auto_153899 - SURFACE
      ?auto_153900 - SURFACE
    )
    :vars
    (
      ?auto_153906 - HOIST
      ?auto_153904 - PLACE
      ?auto_153905 - PLACE
      ?auto_153902 - HOIST
      ?auto_153907 - SURFACE
      ?auto_153903 - SURFACE
      ?auto_153901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153906 ?auto_153904 ) ( IS-CRATE ?auto_153900 ) ( not ( = ?auto_153899 ?auto_153900 ) ) ( not ( = ?auto_153898 ?auto_153899 ) ) ( not ( = ?auto_153898 ?auto_153900 ) ) ( not ( = ?auto_153905 ?auto_153904 ) ) ( HOIST-AT ?auto_153902 ?auto_153905 ) ( not ( = ?auto_153906 ?auto_153902 ) ) ( SURFACE-AT ?auto_153900 ?auto_153905 ) ( ON ?auto_153900 ?auto_153907 ) ( CLEAR ?auto_153900 ) ( not ( = ?auto_153899 ?auto_153907 ) ) ( not ( = ?auto_153900 ?auto_153907 ) ) ( not ( = ?auto_153898 ?auto_153907 ) ) ( SURFACE-AT ?auto_153898 ?auto_153904 ) ( CLEAR ?auto_153898 ) ( IS-CRATE ?auto_153899 ) ( AVAILABLE ?auto_153906 ) ( AVAILABLE ?auto_153902 ) ( SURFACE-AT ?auto_153899 ?auto_153905 ) ( ON ?auto_153899 ?auto_153903 ) ( CLEAR ?auto_153899 ) ( not ( = ?auto_153899 ?auto_153903 ) ) ( not ( = ?auto_153900 ?auto_153903 ) ) ( not ( = ?auto_153898 ?auto_153903 ) ) ( not ( = ?auto_153907 ?auto_153903 ) ) ( TRUCK-AT ?auto_153901 ?auto_153904 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153899 ?auto_153900 )
      ( MAKE-2CRATE-VERIFY ?auto_153898 ?auto_153899 ?auto_153900 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153909 - SURFACE
      ?auto_153910 - SURFACE
      ?auto_153911 - SURFACE
      ?auto_153908 - SURFACE
    )
    :vars
    (
      ?auto_153913 - HOIST
      ?auto_153918 - PLACE
      ?auto_153912 - PLACE
      ?auto_153914 - HOIST
      ?auto_153917 - SURFACE
      ?auto_153915 - SURFACE
      ?auto_153916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153913 ?auto_153918 ) ( IS-CRATE ?auto_153908 ) ( not ( = ?auto_153911 ?auto_153908 ) ) ( not ( = ?auto_153910 ?auto_153911 ) ) ( not ( = ?auto_153910 ?auto_153908 ) ) ( not ( = ?auto_153912 ?auto_153918 ) ) ( HOIST-AT ?auto_153914 ?auto_153912 ) ( not ( = ?auto_153913 ?auto_153914 ) ) ( SURFACE-AT ?auto_153908 ?auto_153912 ) ( ON ?auto_153908 ?auto_153917 ) ( CLEAR ?auto_153908 ) ( not ( = ?auto_153911 ?auto_153917 ) ) ( not ( = ?auto_153908 ?auto_153917 ) ) ( not ( = ?auto_153910 ?auto_153917 ) ) ( SURFACE-AT ?auto_153910 ?auto_153918 ) ( CLEAR ?auto_153910 ) ( IS-CRATE ?auto_153911 ) ( AVAILABLE ?auto_153913 ) ( AVAILABLE ?auto_153914 ) ( SURFACE-AT ?auto_153911 ?auto_153912 ) ( ON ?auto_153911 ?auto_153915 ) ( CLEAR ?auto_153911 ) ( not ( = ?auto_153911 ?auto_153915 ) ) ( not ( = ?auto_153908 ?auto_153915 ) ) ( not ( = ?auto_153910 ?auto_153915 ) ) ( not ( = ?auto_153917 ?auto_153915 ) ) ( TRUCK-AT ?auto_153916 ?auto_153918 ) ( ON ?auto_153910 ?auto_153909 ) ( not ( = ?auto_153909 ?auto_153910 ) ) ( not ( = ?auto_153909 ?auto_153911 ) ) ( not ( = ?auto_153909 ?auto_153908 ) ) ( not ( = ?auto_153909 ?auto_153917 ) ) ( not ( = ?auto_153909 ?auto_153915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153910 ?auto_153911 ?auto_153908 )
      ( MAKE-3CRATE-VERIFY ?auto_153909 ?auto_153910 ?auto_153911 ?auto_153908 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153920 - SURFACE
      ?auto_153921 - SURFACE
      ?auto_153922 - SURFACE
      ?auto_153919 - SURFACE
      ?auto_153923 - SURFACE
    )
    :vars
    (
      ?auto_153925 - HOIST
      ?auto_153930 - PLACE
      ?auto_153924 - PLACE
      ?auto_153926 - HOIST
      ?auto_153929 - SURFACE
      ?auto_153927 - SURFACE
      ?auto_153928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153925 ?auto_153930 ) ( IS-CRATE ?auto_153923 ) ( not ( = ?auto_153919 ?auto_153923 ) ) ( not ( = ?auto_153922 ?auto_153919 ) ) ( not ( = ?auto_153922 ?auto_153923 ) ) ( not ( = ?auto_153924 ?auto_153930 ) ) ( HOIST-AT ?auto_153926 ?auto_153924 ) ( not ( = ?auto_153925 ?auto_153926 ) ) ( SURFACE-AT ?auto_153923 ?auto_153924 ) ( ON ?auto_153923 ?auto_153929 ) ( CLEAR ?auto_153923 ) ( not ( = ?auto_153919 ?auto_153929 ) ) ( not ( = ?auto_153923 ?auto_153929 ) ) ( not ( = ?auto_153922 ?auto_153929 ) ) ( SURFACE-AT ?auto_153922 ?auto_153930 ) ( CLEAR ?auto_153922 ) ( IS-CRATE ?auto_153919 ) ( AVAILABLE ?auto_153925 ) ( AVAILABLE ?auto_153926 ) ( SURFACE-AT ?auto_153919 ?auto_153924 ) ( ON ?auto_153919 ?auto_153927 ) ( CLEAR ?auto_153919 ) ( not ( = ?auto_153919 ?auto_153927 ) ) ( not ( = ?auto_153923 ?auto_153927 ) ) ( not ( = ?auto_153922 ?auto_153927 ) ) ( not ( = ?auto_153929 ?auto_153927 ) ) ( TRUCK-AT ?auto_153928 ?auto_153930 ) ( ON ?auto_153921 ?auto_153920 ) ( ON ?auto_153922 ?auto_153921 ) ( not ( = ?auto_153920 ?auto_153921 ) ) ( not ( = ?auto_153920 ?auto_153922 ) ) ( not ( = ?auto_153920 ?auto_153919 ) ) ( not ( = ?auto_153920 ?auto_153923 ) ) ( not ( = ?auto_153920 ?auto_153929 ) ) ( not ( = ?auto_153920 ?auto_153927 ) ) ( not ( = ?auto_153921 ?auto_153922 ) ) ( not ( = ?auto_153921 ?auto_153919 ) ) ( not ( = ?auto_153921 ?auto_153923 ) ) ( not ( = ?auto_153921 ?auto_153929 ) ) ( not ( = ?auto_153921 ?auto_153927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153922 ?auto_153919 ?auto_153923 )
      ( MAKE-4CRATE-VERIFY ?auto_153920 ?auto_153921 ?auto_153922 ?auto_153919 ?auto_153923 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153931 - SURFACE
      ?auto_153932 - SURFACE
    )
    :vars
    (
      ?auto_153934 - HOIST
      ?auto_153940 - PLACE
      ?auto_153939 - SURFACE
      ?auto_153933 - PLACE
      ?auto_153935 - HOIST
      ?auto_153938 - SURFACE
      ?auto_153936 - SURFACE
      ?auto_153937 - TRUCK
      ?auto_153941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153934 ?auto_153940 ) ( IS-CRATE ?auto_153932 ) ( not ( = ?auto_153931 ?auto_153932 ) ) ( not ( = ?auto_153939 ?auto_153931 ) ) ( not ( = ?auto_153939 ?auto_153932 ) ) ( not ( = ?auto_153933 ?auto_153940 ) ) ( HOIST-AT ?auto_153935 ?auto_153933 ) ( not ( = ?auto_153934 ?auto_153935 ) ) ( SURFACE-AT ?auto_153932 ?auto_153933 ) ( ON ?auto_153932 ?auto_153938 ) ( CLEAR ?auto_153932 ) ( not ( = ?auto_153931 ?auto_153938 ) ) ( not ( = ?auto_153932 ?auto_153938 ) ) ( not ( = ?auto_153939 ?auto_153938 ) ) ( IS-CRATE ?auto_153931 ) ( AVAILABLE ?auto_153935 ) ( SURFACE-AT ?auto_153931 ?auto_153933 ) ( ON ?auto_153931 ?auto_153936 ) ( CLEAR ?auto_153931 ) ( not ( = ?auto_153931 ?auto_153936 ) ) ( not ( = ?auto_153932 ?auto_153936 ) ) ( not ( = ?auto_153939 ?auto_153936 ) ) ( not ( = ?auto_153938 ?auto_153936 ) ) ( TRUCK-AT ?auto_153937 ?auto_153940 ) ( SURFACE-AT ?auto_153941 ?auto_153940 ) ( CLEAR ?auto_153941 ) ( LIFTING ?auto_153934 ?auto_153939 ) ( IS-CRATE ?auto_153939 ) ( not ( = ?auto_153941 ?auto_153939 ) ) ( not ( = ?auto_153931 ?auto_153941 ) ) ( not ( = ?auto_153932 ?auto_153941 ) ) ( not ( = ?auto_153938 ?auto_153941 ) ) ( not ( = ?auto_153936 ?auto_153941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153941 ?auto_153939 )
      ( MAKE-2CRATE ?auto_153939 ?auto_153931 ?auto_153932 )
      ( MAKE-1CRATE-VERIFY ?auto_153931 ?auto_153932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153942 - SURFACE
      ?auto_153943 - SURFACE
      ?auto_153944 - SURFACE
    )
    :vars
    (
      ?auto_153949 - HOIST
      ?auto_153947 - PLACE
      ?auto_153948 - PLACE
      ?auto_153951 - HOIST
      ?auto_153952 - SURFACE
      ?auto_153950 - SURFACE
      ?auto_153946 - TRUCK
      ?auto_153945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153949 ?auto_153947 ) ( IS-CRATE ?auto_153944 ) ( not ( = ?auto_153943 ?auto_153944 ) ) ( not ( = ?auto_153942 ?auto_153943 ) ) ( not ( = ?auto_153942 ?auto_153944 ) ) ( not ( = ?auto_153948 ?auto_153947 ) ) ( HOIST-AT ?auto_153951 ?auto_153948 ) ( not ( = ?auto_153949 ?auto_153951 ) ) ( SURFACE-AT ?auto_153944 ?auto_153948 ) ( ON ?auto_153944 ?auto_153952 ) ( CLEAR ?auto_153944 ) ( not ( = ?auto_153943 ?auto_153952 ) ) ( not ( = ?auto_153944 ?auto_153952 ) ) ( not ( = ?auto_153942 ?auto_153952 ) ) ( IS-CRATE ?auto_153943 ) ( AVAILABLE ?auto_153951 ) ( SURFACE-AT ?auto_153943 ?auto_153948 ) ( ON ?auto_153943 ?auto_153950 ) ( CLEAR ?auto_153943 ) ( not ( = ?auto_153943 ?auto_153950 ) ) ( not ( = ?auto_153944 ?auto_153950 ) ) ( not ( = ?auto_153942 ?auto_153950 ) ) ( not ( = ?auto_153952 ?auto_153950 ) ) ( TRUCK-AT ?auto_153946 ?auto_153947 ) ( SURFACE-AT ?auto_153945 ?auto_153947 ) ( CLEAR ?auto_153945 ) ( LIFTING ?auto_153949 ?auto_153942 ) ( IS-CRATE ?auto_153942 ) ( not ( = ?auto_153945 ?auto_153942 ) ) ( not ( = ?auto_153943 ?auto_153945 ) ) ( not ( = ?auto_153944 ?auto_153945 ) ) ( not ( = ?auto_153952 ?auto_153945 ) ) ( not ( = ?auto_153950 ?auto_153945 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153943 ?auto_153944 )
      ( MAKE-2CRATE-VERIFY ?auto_153942 ?auto_153943 ?auto_153944 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153954 - SURFACE
      ?auto_153955 - SURFACE
      ?auto_153956 - SURFACE
      ?auto_153953 - SURFACE
    )
    :vars
    (
      ?auto_153961 - HOIST
      ?auto_153963 - PLACE
      ?auto_153960 - PLACE
      ?auto_153959 - HOIST
      ?auto_153957 - SURFACE
      ?auto_153958 - SURFACE
      ?auto_153962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153961 ?auto_153963 ) ( IS-CRATE ?auto_153953 ) ( not ( = ?auto_153956 ?auto_153953 ) ) ( not ( = ?auto_153955 ?auto_153956 ) ) ( not ( = ?auto_153955 ?auto_153953 ) ) ( not ( = ?auto_153960 ?auto_153963 ) ) ( HOIST-AT ?auto_153959 ?auto_153960 ) ( not ( = ?auto_153961 ?auto_153959 ) ) ( SURFACE-AT ?auto_153953 ?auto_153960 ) ( ON ?auto_153953 ?auto_153957 ) ( CLEAR ?auto_153953 ) ( not ( = ?auto_153956 ?auto_153957 ) ) ( not ( = ?auto_153953 ?auto_153957 ) ) ( not ( = ?auto_153955 ?auto_153957 ) ) ( IS-CRATE ?auto_153956 ) ( AVAILABLE ?auto_153959 ) ( SURFACE-AT ?auto_153956 ?auto_153960 ) ( ON ?auto_153956 ?auto_153958 ) ( CLEAR ?auto_153956 ) ( not ( = ?auto_153956 ?auto_153958 ) ) ( not ( = ?auto_153953 ?auto_153958 ) ) ( not ( = ?auto_153955 ?auto_153958 ) ) ( not ( = ?auto_153957 ?auto_153958 ) ) ( TRUCK-AT ?auto_153962 ?auto_153963 ) ( SURFACE-AT ?auto_153954 ?auto_153963 ) ( CLEAR ?auto_153954 ) ( LIFTING ?auto_153961 ?auto_153955 ) ( IS-CRATE ?auto_153955 ) ( not ( = ?auto_153954 ?auto_153955 ) ) ( not ( = ?auto_153956 ?auto_153954 ) ) ( not ( = ?auto_153953 ?auto_153954 ) ) ( not ( = ?auto_153957 ?auto_153954 ) ) ( not ( = ?auto_153958 ?auto_153954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153955 ?auto_153956 ?auto_153953 )
      ( MAKE-3CRATE-VERIFY ?auto_153954 ?auto_153955 ?auto_153956 ?auto_153953 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153965 - SURFACE
      ?auto_153966 - SURFACE
      ?auto_153967 - SURFACE
      ?auto_153964 - SURFACE
      ?auto_153968 - SURFACE
    )
    :vars
    (
      ?auto_153973 - HOIST
      ?auto_153975 - PLACE
      ?auto_153972 - PLACE
      ?auto_153971 - HOIST
      ?auto_153969 - SURFACE
      ?auto_153970 - SURFACE
      ?auto_153974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153973 ?auto_153975 ) ( IS-CRATE ?auto_153968 ) ( not ( = ?auto_153964 ?auto_153968 ) ) ( not ( = ?auto_153967 ?auto_153964 ) ) ( not ( = ?auto_153967 ?auto_153968 ) ) ( not ( = ?auto_153972 ?auto_153975 ) ) ( HOIST-AT ?auto_153971 ?auto_153972 ) ( not ( = ?auto_153973 ?auto_153971 ) ) ( SURFACE-AT ?auto_153968 ?auto_153972 ) ( ON ?auto_153968 ?auto_153969 ) ( CLEAR ?auto_153968 ) ( not ( = ?auto_153964 ?auto_153969 ) ) ( not ( = ?auto_153968 ?auto_153969 ) ) ( not ( = ?auto_153967 ?auto_153969 ) ) ( IS-CRATE ?auto_153964 ) ( AVAILABLE ?auto_153971 ) ( SURFACE-AT ?auto_153964 ?auto_153972 ) ( ON ?auto_153964 ?auto_153970 ) ( CLEAR ?auto_153964 ) ( not ( = ?auto_153964 ?auto_153970 ) ) ( not ( = ?auto_153968 ?auto_153970 ) ) ( not ( = ?auto_153967 ?auto_153970 ) ) ( not ( = ?auto_153969 ?auto_153970 ) ) ( TRUCK-AT ?auto_153974 ?auto_153975 ) ( SURFACE-AT ?auto_153966 ?auto_153975 ) ( CLEAR ?auto_153966 ) ( LIFTING ?auto_153973 ?auto_153967 ) ( IS-CRATE ?auto_153967 ) ( not ( = ?auto_153966 ?auto_153967 ) ) ( not ( = ?auto_153964 ?auto_153966 ) ) ( not ( = ?auto_153968 ?auto_153966 ) ) ( not ( = ?auto_153969 ?auto_153966 ) ) ( not ( = ?auto_153970 ?auto_153966 ) ) ( ON ?auto_153966 ?auto_153965 ) ( not ( = ?auto_153965 ?auto_153966 ) ) ( not ( = ?auto_153965 ?auto_153967 ) ) ( not ( = ?auto_153965 ?auto_153964 ) ) ( not ( = ?auto_153965 ?auto_153968 ) ) ( not ( = ?auto_153965 ?auto_153969 ) ) ( not ( = ?auto_153965 ?auto_153970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153967 ?auto_153964 ?auto_153968 )
      ( MAKE-4CRATE-VERIFY ?auto_153965 ?auto_153966 ?auto_153967 ?auto_153964 ?auto_153968 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154412 - SURFACE
      ?auto_154413 - SURFACE
      ?auto_154414 - SURFACE
      ?auto_154411 - SURFACE
      ?auto_154415 - SURFACE
      ?auto_154416 - SURFACE
    )
    :vars
    (
      ?auto_154418 - HOIST
      ?auto_154417 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154418 ?auto_154417 ) ( SURFACE-AT ?auto_154415 ?auto_154417 ) ( CLEAR ?auto_154415 ) ( LIFTING ?auto_154418 ?auto_154416 ) ( IS-CRATE ?auto_154416 ) ( not ( = ?auto_154415 ?auto_154416 ) ) ( ON ?auto_154413 ?auto_154412 ) ( ON ?auto_154414 ?auto_154413 ) ( ON ?auto_154411 ?auto_154414 ) ( ON ?auto_154415 ?auto_154411 ) ( not ( = ?auto_154412 ?auto_154413 ) ) ( not ( = ?auto_154412 ?auto_154414 ) ) ( not ( = ?auto_154412 ?auto_154411 ) ) ( not ( = ?auto_154412 ?auto_154415 ) ) ( not ( = ?auto_154412 ?auto_154416 ) ) ( not ( = ?auto_154413 ?auto_154414 ) ) ( not ( = ?auto_154413 ?auto_154411 ) ) ( not ( = ?auto_154413 ?auto_154415 ) ) ( not ( = ?auto_154413 ?auto_154416 ) ) ( not ( = ?auto_154414 ?auto_154411 ) ) ( not ( = ?auto_154414 ?auto_154415 ) ) ( not ( = ?auto_154414 ?auto_154416 ) ) ( not ( = ?auto_154411 ?auto_154415 ) ) ( not ( = ?auto_154411 ?auto_154416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_154415 ?auto_154416 )
      ( MAKE-5CRATE-VERIFY ?auto_154412 ?auto_154413 ?auto_154414 ?auto_154411 ?auto_154415 ?auto_154416 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154446 - SURFACE
      ?auto_154447 - SURFACE
      ?auto_154448 - SURFACE
      ?auto_154445 - SURFACE
      ?auto_154449 - SURFACE
      ?auto_154450 - SURFACE
    )
    :vars
    (
      ?auto_154453 - HOIST
      ?auto_154452 - PLACE
      ?auto_154451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154453 ?auto_154452 ) ( SURFACE-AT ?auto_154449 ?auto_154452 ) ( CLEAR ?auto_154449 ) ( IS-CRATE ?auto_154450 ) ( not ( = ?auto_154449 ?auto_154450 ) ) ( TRUCK-AT ?auto_154451 ?auto_154452 ) ( AVAILABLE ?auto_154453 ) ( IN ?auto_154450 ?auto_154451 ) ( ON ?auto_154449 ?auto_154445 ) ( not ( = ?auto_154445 ?auto_154449 ) ) ( not ( = ?auto_154445 ?auto_154450 ) ) ( ON ?auto_154447 ?auto_154446 ) ( ON ?auto_154448 ?auto_154447 ) ( ON ?auto_154445 ?auto_154448 ) ( not ( = ?auto_154446 ?auto_154447 ) ) ( not ( = ?auto_154446 ?auto_154448 ) ) ( not ( = ?auto_154446 ?auto_154445 ) ) ( not ( = ?auto_154446 ?auto_154449 ) ) ( not ( = ?auto_154446 ?auto_154450 ) ) ( not ( = ?auto_154447 ?auto_154448 ) ) ( not ( = ?auto_154447 ?auto_154445 ) ) ( not ( = ?auto_154447 ?auto_154449 ) ) ( not ( = ?auto_154447 ?auto_154450 ) ) ( not ( = ?auto_154448 ?auto_154445 ) ) ( not ( = ?auto_154448 ?auto_154449 ) ) ( not ( = ?auto_154448 ?auto_154450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154445 ?auto_154449 ?auto_154450 )
      ( MAKE-5CRATE-VERIFY ?auto_154446 ?auto_154447 ?auto_154448 ?auto_154445 ?auto_154449 ?auto_154450 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154486 - SURFACE
      ?auto_154487 - SURFACE
      ?auto_154488 - SURFACE
      ?auto_154485 - SURFACE
      ?auto_154489 - SURFACE
      ?auto_154490 - SURFACE
    )
    :vars
    (
      ?auto_154491 - HOIST
      ?auto_154494 - PLACE
      ?auto_154492 - TRUCK
      ?auto_154493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154491 ?auto_154494 ) ( SURFACE-AT ?auto_154489 ?auto_154494 ) ( CLEAR ?auto_154489 ) ( IS-CRATE ?auto_154490 ) ( not ( = ?auto_154489 ?auto_154490 ) ) ( AVAILABLE ?auto_154491 ) ( IN ?auto_154490 ?auto_154492 ) ( ON ?auto_154489 ?auto_154485 ) ( not ( = ?auto_154485 ?auto_154489 ) ) ( not ( = ?auto_154485 ?auto_154490 ) ) ( TRUCK-AT ?auto_154492 ?auto_154493 ) ( not ( = ?auto_154493 ?auto_154494 ) ) ( ON ?auto_154487 ?auto_154486 ) ( ON ?auto_154488 ?auto_154487 ) ( ON ?auto_154485 ?auto_154488 ) ( not ( = ?auto_154486 ?auto_154487 ) ) ( not ( = ?auto_154486 ?auto_154488 ) ) ( not ( = ?auto_154486 ?auto_154485 ) ) ( not ( = ?auto_154486 ?auto_154489 ) ) ( not ( = ?auto_154486 ?auto_154490 ) ) ( not ( = ?auto_154487 ?auto_154488 ) ) ( not ( = ?auto_154487 ?auto_154485 ) ) ( not ( = ?auto_154487 ?auto_154489 ) ) ( not ( = ?auto_154487 ?auto_154490 ) ) ( not ( = ?auto_154488 ?auto_154485 ) ) ( not ( = ?auto_154488 ?auto_154489 ) ) ( not ( = ?auto_154488 ?auto_154490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154485 ?auto_154489 ?auto_154490 )
      ( MAKE-5CRATE-VERIFY ?auto_154486 ?auto_154487 ?auto_154488 ?auto_154485 ?auto_154489 ?auto_154490 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154531 - SURFACE
      ?auto_154532 - SURFACE
      ?auto_154533 - SURFACE
      ?auto_154530 - SURFACE
      ?auto_154534 - SURFACE
      ?auto_154535 - SURFACE
    )
    :vars
    (
      ?auto_154537 - HOIST
      ?auto_154540 - PLACE
      ?auto_154536 - TRUCK
      ?auto_154539 - PLACE
      ?auto_154538 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_154537 ?auto_154540 ) ( SURFACE-AT ?auto_154534 ?auto_154540 ) ( CLEAR ?auto_154534 ) ( IS-CRATE ?auto_154535 ) ( not ( = ?auto_154534 ?auto_154535 ) ) ( AVAILABLE ?auto_154537 ) ( ON ?auto_154534 ?auto_154530 ) ( not ( = ?auto_154530 ?auto_154534 ) ) ( not ( = ?auto_154530 ?auto_154535 ) ) ( TRUCK-AT ?auto_154536 ?auto_154539 ) ( not ( = ?auto_154539 ?auto_154540 ) ) ( HOIST-AT ?auto_154538 ?auto_154539 ) ( LIFTING ?auto_154538 ?auto_154535 ) ( not ( = ?auto_154537 ?auto_154538 ) ) ( ON ?auto_154532 ?auto_154531 ) ( ON ?auto_154533 ?auto_154532 ) ( ON ?auto_154530 ?auto_154533 ) ( not ( = ?auto_154531 ?auto_154532 ) ) ( not ( = ?auto_154531 ?auto_154533 ) ) ( not ( = ?auto_154531 ?auto_154530 ) ) ( not ( = ?auto_154531 ?auto_154534 ) ) ( not ( = ?auto_154531 ?auto_154535 ) ) ( not ( = ?auto_154532 ?auto_154533 ) ) ( not ( = ?auto_154532 ?auto_154530 ) ) ( not ( = ?auto_154532 ?auto_154534 ) ) ( not ( = ?auto_154532 ?auto_154535 ) ) ( not ( = ?auto_154533 ?auto_154530 ) ) ( not ( = ?auto_154533 ?auto_154534 ) ) ( not ( = ?auto_154533 ?auto_154535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154530 ?auto_154534 ?auto_154535 )
      ( MAKE-5CRATE-VERIFY ?auto_154531 ?auto_154532 ?auto_154533 ?auto_154530 ?auto_154534 ?auto_154535 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154581 - SURFACE
      ?auto_154582 - SURFACE
      ?auto_154583 - SURFACE
      ?auto_154580 - SURFACE
      ?auto_154584 - SURFACE
      ?auto_154585 - SURFACE
    )
    :vars
    (
      ?auto_154591 - HOIST
      ?auto_154587 - PLACE
      ?auto_154588 - TRUCK
      ?auto_154589 - PLACE
      ?auto_154586 - HOIST
      ?auto_154590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154591 ?auto_154587 ) ( SURFACE-AT ?auto_154584 ?auto_154587 ) ( CLEAR ?auto_154584 ) ( IS-CRATE ?auto_154585 ) ( not ( = ?auto_154584 ?auto_154585 ) ) ( AVAILABLE ?auto_154591 ) ( ON ?auto_154584 ?auto_154580 ) ( not ( = ?auto_154580 ?auto_154584 ) ) ( not ( = ?auto_154580 ?auto_154585 ) ) ( TRUCK-AT ?auto_154588 ?auto_154589 ) ( not ( = ?auto_154589 ?auto_154587 ) ) ( HOIST-AT ?auto_154586 ?auto_154589 ) ( not ( = ?auto_154591 ?auto_154586 ) ) ( AVAILABLE ?auto_154586 ) ( SURFACE-AT ?auto_154585 ?auto_154589 ) ( ON ?auto_154585 ?auto_154590 ) ( CLEAR ?auto_154585 ) ( not ( = ?auto_154584 ?auto_154590 ) ) ( not ( = ?auto_154585 ?auto_154590 ) ) ( not ( = ?auto_154580 ?auto_154590 ) ) ( ON ?auto_154582 ?auto_154581 ) ( ON ?auto_154583 ?auto_154582 ) ( ON ?auto_154580 ?auto_154583 ) ( not ( = ?auto_154581 ?auto_154582 ) ) ( not ( = ?auto_154581 ?auto_154583 ) ) ( not ( = ?auto_154581 ?auto_154580 ) ) ( not ( = ?auto_154581 ?auto_154584 ) ) ( not ( = ?auto_154581 ?auto_154585 ) ) ( not ( = ?auto_154581 ?auto_154590 ) ) ( not ( = ?auto_154582 ?auto_154583 ) ) ( not ( = ?auto_154582 ?auto_154580 ) ) ( not ( = ?auto_154582 ?auto_154584 ) ) ( not ( = ?auto_154582 ?auto_154585 ) ) ( not ( = ?auto_154582 ?auto_154590 ) ) ( not ( = ?auto_154583 ?auto_154580 ) ) ( not ( = ?auto_154583 ?auto_154584 ) ) ( not ( = ?auto_154583 ?auto_154585 ) ) ( not ( = ?auto_154583 ?auto_154590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154580 ?auto_154584 ?auto_154585 )
      ( MAKE-5CRATE-VERIFY ?auto_154581 ?auto_154582 ?auto_154583 ?auto_154580 ?auto_154584 ?auto_154585 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154632 - SURFACE
      ?auto_154633 - SURFACE
      ?auto_154634 - SURFACE
      ?auto_154631 - SURFACE
      ?auto_154635 - SURFACE
      ?auto_154636 - SURFACE
    )
    :vars
    (
      ?auto_154638 - HOIST
      ?auto_154637 - PLACE
      ?auto_154642 - PLACE
      ?auto_154639 - HOIST
      ?auto_154641 - SURFACE
      ?auto_154640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154638 ?auto_154637 ) ( SURFACE-AT ?auto_154635 ?auto_154637 ) ( CLEAR ?auto_154635 ) ( IS-CRATE ?auto_154636 ) ( not ( = ?auto_154635 ?auto_154636 ) ) ( AVAILABLE ?auto_154638 ) ( ON ?auto_154635 ?auto_154631 ) ( not ( = ?auto_154631 ?auto_154635 ) ) ( not ( = ?auto_154631 ?auto_154636 ) ) ( not ( = ?auto_154642 ?auto_154637 ) ) ( HOIST-AT ?auto_154639 ?auto_154642 ) ( not ( = ?auto_154638 ?auto_154639 ) ) ( AVAILABLE ?auto_154639 ) ( SURFACE-AT ?auto_154636 ?auto_154642 ) ( ON ?auto_154636 ?auto_154641 ) ( CLEAR ?auto_154636 ) ( not ( = ?auto_154635 ?auto_154641 ) ) ( not ( = ?auto_154636 ?auto_154641 ) ) ( not ( = ?auto_154631 ?auto_154641 ) ) ( TRUCK-AT ?auto_154640 ?auto_154637 ) ( ON ?auto_154633 ?auto_154632 ) ( ON ?auto_154634 ?auto_154633 ) ( ON ?auto_154631 ?auto_154634 ) ( not ( = ?auto_154632 ?auto_154633 ) ) ( not ( = ?auto_154632 ?auto_154634 ) ) ( not ( = ?auto_154632 ?auto_154631 ) ) ( not ( = ?auto_154632 ?auto_154635 ) ) ( not ( = ?auto_154632 ?auto_154636 ) ) ( not ( = ?auto_154632 ?auto_154641 ) ) ( not ( = ?auto_154633 ?auto_154634 ) ) ( not ( = ?auto_154633 ?auto_154631 ) ) ( not ( = ?auto_154633 ?auto_154635 ) ) ( not ( = ?auto_154633 ?auto_154636 ) ) ( not ( = ?auto_154633 ?auto_154641 ) ) ( not ( = ?auto_154634 ?auto_154631 ) ) ( not ( = ?auto_154634 ?auto_154635 ) ) ( not ( = ?auto_154634 ?auto_154636 ) ) ( not ( = ?auto_154634 ?auto_154641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154631 ?auto_154635 ?auto_154636 )
      ( MAKE-5CRATE-VERIFY ?auto_154632 ?auto_154633 ?auto_154634 ?auto_154631 ?auto_154635 ?auto_154636 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154683 - SURFACE
      ?auto_154684 - SURFACE
      ?auto_154685 - SURFACE
      ?auto_154682 - SURFACE
      ?auto_154686 - SURFACE
      ?auto_154687 - SURFACE
    )
    :vars
    (
      ?auto_154693 - HOIST
      ?auto_154691 - PLACE
      ?auto_154688 - PLACE
      ?auto_154692 - HOIST
      ?auto_154690 - SURFACE
      ?auto_154689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154693 ?auto_154691 ) ( IS-CRATE ?auto_154687 ) ( not ( = ?auto_154686 ?auto_154687 ) ) ( not ( = ?auto_154682 ?auto_154686 ) ) ( not ( = ?auto_154682 ?auto_154687 ) ) ( not ( = ?auto_154688 ?auto_154691 ) ) ( HOIST-AT ?auto_154692 ?auto_154688 ) ( not ( = ?auto_154693 ?auto_154692 ) ) ( AVAILABLE ?auto_154692 ) ( SURFACE-AT ?auto_154687 ?auto_154688 ) ( ON ?auto_154687 ?auto_154690 ) ( CLEAR ?auto_154687 ) ( not ( = ?auto_154686 ?auto_154690 ) ) ( not ( = ?auto_154687 ?auto_154690 ) ) ( not ( = ?auto_154682 ?auto_154690 ) ) ( TRUCK-AT ?auto_154689 ?auto_154691 ) ( SURFACE-AT ?auto_154682 ?auto_154691 ) ( CLEAR ?auto_154682 ) ( LIFTING ?auto_154693 ?auto_154686 ) ( IS-CRATE ?auto_154686 ) ( ON ?auto_154684 ?auto_154683 ) ( ON ?auto_154685 ?auto_154684 ) ( ON ?auto_154682 ?auto_154685 ) ( not ( = ?auto_154683 ?auto_154684 ) ) ( not ( = ?auto_154683 ?auto_154685 ) ) ( not ( = ?auto_154683 ?auto_154682 ) ) ( not ( = ?auto_154683 ?auto_154686 ) ) ( not ( = ?auto_154683 ?auto_154687 ) ) ( not ( = ?auto_154683 ?auto_154690 ) ) ( not ( = ?auto_154684 ?auto_154685 ) ) ( not ( = ?auto_154684 ?auto_154682 ) ) ( not ( = ?auto_154684 ?auto_154686 ) ) ( not ( = ?auto_154684 ?auto_154687 ) ) ( not ( = ?auto_154684 ?auto_154690 ) ) ( not ( = ?auto_154685 ?auto_154682 ) ) ( not ( = ?auto_154685 ?auto_154686 ) ) ( not ( = ?auto_154685 ?auto_154687 ) ) ( not ( = ?auto_154685 ?auto_154690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154682 ?auto_154686 ?auto_154687 )
      ( MAKE-5CRATE-VERIFY ?auto_154683 ?auto_154684 ?auto_154685 ?auto_154682 ?auto_154686 ?auto_154687 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154734 - SURFACE
      ?auto_154735 - SURFACE
      ?auto_154736 - SURFACE
      ?auto_154733 - SURFACE
      ?auto_154737 - SURFACE
      ?auto_154738 - SURFACE
    )
    :vars
    (
      ?auto_154741 - HOIST
      ?auto_154740 - PLACE
      ?auto_154742 - PLACE
      ?auto_154739 - HOIST
      ?auto_154743 - SURFACE
      ?auto_154744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154741 ?auto_154740 ) ( IS-CRATE ?auto_154738 ) ( not ( = ?auto_154737 ?auto_154738 ) ) ( not ( = ?auto_154733 ?auto_154737 ) ) ( not ( = ?auto_154733 ?auto_154738 ) ) ( not ( = ?auto_154742 ?auto_154740 ) ) ( HOIST-AT ?auto_154739 ?auto_154742 ) ( not ( = ?auto_154741 ?auto_154739 ) ) ( AVAILABLE ?auto_154739 ) ( SURFACE-AT ?auto_154738 ?auto_154742 ) ( ON ?auto_154738 ?auto_154743 ) ( CLEAR ?auto_154738 ) ( not ( = ?auto_154737 ?auto_154743 ) ) ( not ( = ?auto_154738 ?auto_154743 ) ) ( not ( = ?auto_154733 ?auto_154743 ) ) ( TRUCK-AT ?auto_154744 ?auto_154740 ) ( SURFACE-AT ?auto_154733 ?auto_154740 ) ( CLEAR ?auto_154733 ) ( IS-CRATE ?auto_154737 ) ( AVAILABLE ?auto_154741 ) ( IN ?auto_154737 ?auto_154744 ) ( ON ?auto_154735 ?auto_154734 ) ( ON ?auto_154736 ?auto_154735 ) ( ON ?auto_154733 ?auto_154736 ) ( not ( = ?auto_154734 ?auto_154735 ) ) ( not ( = ?auto_154734 ?auto_154736 ) ) ( not ( = ?auto_154734 ?auto_154733 ) ) ( not ( = ?auto_154734 ?auto_154737 ) ) ( not ( = ?auto_154734 ?auto_154738 ) ) ( not ( = ?auto_154734 ?auto_154743 ) ) ( not ( = ?auto_154735 ?auto_154736 ) ) ( not ( = ?auto_154735 ?auto_154733 ) ) ( not ( = ?auto_154735 ?auto_154737 ) ) ( not ( = ?auto_154735 ?auto_154738 ) ) ( not ( = ?auto_154735 ?auto_154743 ) ) ( not ( = ?auto_154736 ?auto_154733 ) ) ( not ( = ?auto_154736 ?auto_154737 ) ) ( not ( = ?auto_154736 ?auto_154738 ) ) ( not ( = ?auto_154736 ?auto_154743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154733 ?auto_154737 ?auto_154738 )
      ( MAKE-5CRATE-VERIFY ?auto_154734 ?auto_154735 ?auto_154736 ?auto_154733 ?auto_154737 ?auto_154738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_155101 - SURFACE
      ?auto_155102 - SURFACE
    )
    :vars
    (
      ?auto_155109 - HOIST
      ?auto_155106 - PLACE
      ?auto_155104 - SURFACE
      ?auto_155103 - PLACE
      ?auto_155107 - HOIST
      ?auto_155108 - SURFACE
      ?auto_155105 - TRUCK
      ?auto_155110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_155109 ?auto_155106 ) ( SURFACE-AT ?auto_155101 ?auto_155106 ) ( CLEAR ?auto_155101 ) ( IS-CRATE ?auto_155102 ) ( not ( = ?auto_155101 ?auto_155102 ) ) ( ON ?auto_155101 ?auto_155104 ) ( not ( = ?auto_155104 ?auto_155101 ) ) ( not ( = ?auto_155104 ?auto_155102 ) ) ( not ( = ?auto_155103 ?auto_155106 ) ) ( HOIST-AT ?auto_155107 ?auto_155103 ) ( not ( = ?auto_155109 ?auto_155107 ) ) ( AVAILABLE ?auto_155107 ) ( SURFACE-AT ?auto_155102 ?auto_155103 ) ( ON ?auto_155102 ?auto_155108 ) ( CLEAR ?auto_155102 ) ( not ( = ?auto_155101 ?auto_155108 ) ) ( not ( = ?auto_155102 ?auto_155108 ) ) ( not ( = ?auto_155104 ?auto_155108 ) ) ( TRUCK-AT ?auto_155105 ?auto_155106 ) ( LIFTING ?auto_155109 ?auto_155110 ) ( IS-CRATE ?auto_155110 ) ( not ( = ?auto_155101 ?auto_155110 ) ) ( not ( = ?auto_155102 ?auto_155110 ) ) ( not ( = ?auto_155104 ?auto_155110 ) ) ( not ( = ?auto_155108 ?auto_155110 ) ) )
    :subtasks
    ( ( !LOAD ?auto_155109 ?auto_155110 ?auto_155105 ?auto_155106 )
      ( MAKE-1CRATE ?auto_155101 ?auto_155102 )
      ( MAKE-1CRATE-VERIFY ?auto_155101 ?auto_155102 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_155939 - SURFACE
      ?auto_155940 - SURFACE
      ?auto_155941 - SURFACE
      ?auto_155938 - SURFACE
      ?auto_155942 - SURFACE
      ?auto_155944 - SURFACE
      ?auto_155943 - SURFACE
    )
    :vars
    (
      ?auto_155946 - HOIST
      ?auto_155945 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_155946 ?auto_155945 ) ( SURFACE-AT ?auto_155944 ?auto_155945 ) ( CLEAR ?auto_155944 ) ( LIFTING ?auto_155946 ?auto_155943 ) ( IS-CRATE ?auto_155943 ) ( not ( = ?auto_155944 ?auto_155943 ) ) ( ON ?auto_155940 ?auto_155939 ) ( ON ?auto_155941 ?auto_155940 ) ( ON ?auto_155938 ?auto_155941 ) ( ON ?auto_155942 ?auto_155938 ) ( ON ?auto_155944 ?auto_155942 ) ( not ( = ?auto_155939 ?auto_155940 ) ) ( not ( = ?auto_155939 ?auto_155941 ) ) ( not ( = ?auto_155939 ?auto_155938 ) ) ( not ( = ?auto_155939 ?auto_155942 ) ) ( not ( = ?auto_155939 ?auto_155944 ) ) ( not ( = ?auto_155939 ?auto_155943 ) ) ( not ( = ?auto_155940 ?auto_155941 ) ) ( not ( = ?auto_155940 ?auto_155938 ) ) ( not ( = ?auto_155940 ?auto_155942 ) ) ( not ( = ?auto_155940 ?auto_155944 ) ) ( not ( = ?auto_155940 ?auto_155943 ) ) ( not ( = ?auto_155941 ?auto_155938 ) ) ( not ( = ?auto_155941 ?auto_155942 ) ) ( not ( = ?auto_155941 ?auto_155944 ) ) ( not ( = ?auto_155941 ?auto_155943 ) ) ( not ( = ?auto_155938 ?auto_155942 ) ) ( not ( = ?auto_155938 ?auto_155944 ) ) ( not ( = ?auto_155938 ?auto_155943 ) ) ( not ( = ?auto_155942 ?auto_155944 ) ) ( not ( = ?auto_155942 ?auto_155943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_155944 ?auto_155943 )
      ( MAKE-6CRATE-VERIFY ?auto_155939 ?auto_155940 ?auto_155941 ?auto_155938 ?auto_155942 ?auto_155944 ?auto_155943 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_155983 - SURFACE
      ?auto_155984 - SURFACE
      ?auto_155985 - SURFACE
      ?auto_155982 - SURFACE
      ?auto_155986 - SURFACE
      ?auto_155988 - SURFACE
      ?auto_155987 - SURFACE
    )
    :vars
    (
      ?auto_155990 - HOIST
      ?auto_155991 - PLACE
      ?auto_155989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_155990 ?auto_155991 ) ( SURFACE-AT ?auto_155988 ?auto_155991 ) ( CLEAR ?auto_155988 ) ( IS-CRATE ?auto_155987 ) ( not ( = ?auto_155988 ?auto_155987 ) ) ( TRUCK-AT ?auto_155989 ?auto_155991 ) ( AVAILABLE ?auto_155990 ) ( IN ?auto_155987 ?auto_155989 ) ( ON ?auto_155988 ?auto_155986 ) ( not ( = ?auto_155986 ?auto_155988 ) ) ( not ( = ?auto_155986 ?auto_155987 ) ) ( ON ?auto_155984 ?auto_155983 ) ( ON ?auto_155985 ?auto_155984 ) ( ON ?auto_155982 ?auto_155985 ) ( ON ?auto_155986 ?auto_155982 ) ( not ( = ?auto_155983 ?auto_155984 ) ) ( not ( = ?auto_155983 ?auto_155985 ) ) ( not ( = ?auto_155983 ?auto_155982 ) ) ( not ( = ?auto_155983 ?auto_155986 ) ) ( not ( = ?auto_155983 ?auto_155988 ) ) ( not ( = ?auto_155983 ?auto_155987 ) ) ( not ( = ?auto_155984 ?auto_155985 ) ) ( not ( = ?auto_155984 ?auto_155982 ) ) ( not ( = ?auto_155984 ?auto_155986 ) ) ( not ( = ?auto_155984 ?auto_155988 ) ) ( not ( = ?auto_155984 ?auto_155987 ) ) ( not ( = ?auto_155985 ?auto_155982 ) ) ( not ( = ?auto_155985 ?auto_155986 ) ) ( not ( = ?auto_155985 ?auto_155988 ) ) ( not ( = ?auto_155985 ?auto_155987 ) ) ( not ( = ?auto_155982 ?auto_155986 ) ) ( not ( = ?auto_155982 ?auto_155988 ) ) ( not ( = ?auto_155982 ?auto_155987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_155986 ?auto_155988 ?auto_155987 )
      ( MAKE-6CRATE-VERIFY ?auto_155983 ?auto_155984 ?auto_155985 ?auto_155982 ?auto_155986 ?auto_155988 ?auto_155987 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156034 - SURFACE
      ?auto_156035 - SURFACE
      ?auto_156036 - SURFACE
      ?auto_156033 - SURFACE
      ?auto_156037 - SURFACE
      ?auto_156039 - SURFACE
      ?auto_156038 - SURFACE
    )
    :vars
    (
      ?auto_156042 - HOIST
      ?auto_156040 - PLACE
      ?auto_156043 - TRUCK
      ?auto_156041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156042 ?auto_156040 ) ( SURFACE-AT ?auto_156039 ?auto_156040 ) ( CLEAR ?auto_156039 ) ( IS-CRATE ?auto_156038 ) ( not ( = ?auto_156039 ?auto_156038 ) ) ( AVAILABLE ?auto_156042 ) ( IN ?auto_156038 ?auto_156043 ) ( ON ?auto_156039 ?auto_156037 ) ( not ( = ?auto_156037 ?auto_156039 ) ) ( not ( = ?auto_156037 ?auto_156038 ) ) ( TRUCK-AT ?auto_156043 ?auto_156041 ) ( not ( = ?auto_156041 ?auto_156040 ) ) ( ON ?auto_156035 ?auto_156034 ) ( ON ?auto_156036 ?auto_156035 ) ( ON ?auto_156033 ?auto_156036 ) ( ON ?auto_156037 ?auto_156033 ) ( not ( = ?auto_156034 ?auto_156035 ) ) ( not ( = ?auto_156034 ?auto_156036 ) ) ( not ( = ?auto_156034 ?auto_156033 ) ) ( not ( = ?auto_156034 ?auto_156037 ) ) ( not ( = ?auto_156034 ?auto_156039 ) ) ( not ( = ?auto_156034 ?auto_156038 ) ) ( not ( = ?auto_156035 ?auto_156036 ) ) ( not ( = ?auto_156035 ?auto_156033 ) ) ( not ( = ?auto_156035 ?auto_156037 ) ) ( not ( = ?auto_156035 ?auto_156039 ) ) ( not ( = ?auto_156035 ?auto_156038 ) ) ( not ( = ?auto_156036 ?auto_156033 ) ) ( not ( = ?auto_156036 ?auto_156037 ) ) ( not ( = ?auto_156036 ?auto_156039 ) ) ( not ( = ?auto_156036 ?auto_156038 ) ) ( not ( = ?auto_156033 ?auto_156037 ) ) ( not ( = ?auto_156033 ?auto_156039 ) ) ( not ( = ?auto_156033 ?auto_156038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156037 ?auto_156039 ?auto_156038 )
      ( MAKE-6CRATE-VERIFY ?auto_156034 ?auto_156035 ?auto_156036 ?auto_156033 ?auto_156037 ?auto_156039 ?auto_156038 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156091 - SURFACE
      ?auto_156092 - SURFACE
      ?auto_156093 - SURFACE
      ?auto_156090 - SURFACE
      ?auto_156094 - SURFACE
      ?auto_156096 - SURFACE
      ?auto_156095 - SURFACE
    )
    :vars
    (
      ?auto_156097 - HOIST
      ?auto_156099 - PLACE
      ?auto_156100 - TRUCK
      ?auto_156101 - PLACE
      ?auto_156098 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_156097 ?auto_156099 ) ( SURFACE-AT ?auto_156096 ?auto_156099 ) ( CLEAR ?auto_156096 ) ( IS-CRATE ?auto_156095 ) ( not ( = ?auto_156096 ?auto_156095 ) ) ( AVAILABLE ?auto_156097 ) ( ON ?auto_156096 ?auto_156094 ) ( not ( = ?auto_156094 ?auto_156096 ) ) ( not ( = ?auto_156094 ?auto_156095 ) ) ( TRUCK-AT ?auto_156100 ?auto_156101 ) ( not ( = ?auto_156101 ?auto_156099 ) ) ( HOIST-AT ?auto_156098 ?auto_156101 ) ( LIFTING ?auto_156098 ?auto_156095 ) ( not ( = ?auto_156097 ?auto_156098 ) ) ( ON ?auto_156092 ?auto_156091 ) ( ON ?auto_156093 ?auto_156092 ) ( ON ?auto_156090 ?auto_156093 ) ( ON ?auto_156094 ?auto_156090 ) ( not ( = ?auto_156091 ?auto_156092 ) ) ( not ( = ?auto_156091 ?auto_156093 ) ) ( not ( = ?auto_156091 ?auto_156090 ) ) ( not ( = ?auto_156091 ?auto_156094 ) ) ( not ( = ?auto_156091 ?auto_156096 ) ) ( not ( = ?auto_156091 ?auto_156095 ) ) ( not ( = ?auto_156092 ?auto_156093 ) ) ( not ( = ?auto_156092 ?auto_156090 ) ) ( not ( = ?auto_156092 ?auto_156094 ) ) ( not ( = ?auto_156092 ?auto_156096 ) ) ( not ( = ?auto_156092 ?auto_156095 ) ) ( not ( = ?auto_156093 ?auto_156090 ) ) ( not ( = ?auto_156093 ?auto_156094 ) ) ( not ( = ?auto_156093 ?auto_156096 ) ) ( not ( = ?auto_156093 ?auto_156095 ) ) ( not ( = ?auto_156090 ?auto_156094 ) ) ( not ( = ?auto_156090 ?auto_156096 ) ) ( not ( = ?auto_156090 ?auto_156095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156094 ?auto_156096 ?auto_156095 )
      ( MAKE-6CRATE-VERIFY ?auto_156091 ?auto_156092 ?auto_156093 ?auto_156090 ?auto_156094 ?auto_156096 ?auto_156095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156154 - SURFACE
      ?auto_156155 - SURFACE
      ?auto_156156 - SURFACE
      ?auto_156153 - SURFACE
      ?auto_156157 - SURFACE
      ?auto_156159 - SURFACE
      ?auto_156158 - SURFACE
    )
    :vars
    (
      ?auto_156164 - HOIST
      ?auto_156162 - PLACE
      ?auto_156160 - TRUCK
      ?auto_156161 - PLACE
      ?auto_156165 - HOIST
      ?auto_156163 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156164 ?auto_156162 ) ( SURFACE-AT ?auto_156159 ?auto_156162 ) ( CLEAR ?auto_156159 ) ( IS-CRATE ?auto_156158 ) ( not ( = ?auto_156159 ?auto_156158 ) ) ( AVAILABLE ?auto_156164 ) ( ON ?auto_156159 ?auto_156157 ) ( not ( = ?auto_156157 ?auto_156159 ) ) ( not ( = ?auto_156157 ?auto_156158 ) ) ( TRUCK-AT ?auto_156160 ?auto_156161 ) ( not ( = ?auto_156161 ?auto_156162 ) ) ( HOIST-AT ?auto_156165 ?auto_156161 ) ( not ( = ?auto_156164 ?auto_156165 ) ) ( AVAILABLE ?auto_156165 ) ( SURFACE-AT ?auto_156158 ?auto_156161 ) ( ON ?auto_156158 ?auto_156163 ) ( CLEAR ?auto_156158 ) ( not ( = ?auto_156159 ?auto_156163 ) ) ( not ( = ?auto_156158 ?auto_156163 ) ) ( not ( = ?auto_156157 ?auto_156163 ) ) ( ON ?auto_156155 ?auto_156154 ) ( ON ?auto_156156 ?auto_156155 ) ( ON ?auto_156153 ?auto_156156 ) ( ON ?auto_156157 ?auto_156153 ) ( not ( = ?auto_156154 ?auto_156155 ) ) ( not ( = ?auto_156154 ?auto_156156 ) ) ( not ( = ?auto_156154 ?auto_156153 ) ) ( not ( = ?auto_156154 ?auto_156157 ) ) ( not ( = ?auto_156154 ?auto_156159 ) ) ( not ( = ?auto_156154 ?auto_156158 ) ) ( not ( = ?auto_156154 ?auto_156163 ) ) ( not ( = ?auto_156155 ?auto_156156 ) ) ( not ( = ?auto_156155 ?auto_156153 ) ) ( not ( = ?auto_156155 ?auto_156157 ) ) ( not ( = ?auto_156155 ?auto_156159 ) ) ( not ( = ?auto_156155 ?auto_156158 ) ) ( not ( = ?auto_156155 ?auto_156163 ) ) ( not ( = ?auto_156156 ?auto_156153 ) ) ( not ( = ?auto_156156 ?auto_156157 ) ) ( not ( = ?auto_156156 ?auto_156159 ) ) ( not ( = ?auto_156156 ?auto_156158 ) ) ( not ( = ?auto_156156 ?auto_156163 ) ) ( not ( = ?auto_156153 ?auto_156157 ) ) ( not ( = ?auto_156153 ?auto_156159 ) ) ( not ( = ?auto_156153 ?auto_156158 ) ) ( not ( = ?auto_156153 ?auto_156163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156157 ?auto_156159 ?auto_156158 )
      ( MAKE-6CRATE-VERIFY ?auto_156154 ?auto_156155 ?auto_156156 ?auto_156153 ?auto_156157 ?auto_156159 ?auto_156158 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156218 - SURFACE
      ?auto_156219 - SURFACE
      ?auto_156220 - SURFACE
      ?auto_156217 - SURFACE
      ?auto_156221 - SURFACE
      ?auto_156223 - SURFACE
      ?auto_156222 - SURFACE
    )
    :vars
    (
      ?auto_156226 - HOIST
      ?auto_156228 - PLACE
      ?auto_156227 - PLACE
      ?auto_156225 - HOIST
      ?auto_156224 - SURFACE
      ?auto_156229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156226 ?auto_156228 ) ( SURFACE-AT ?auto_156223 ?auto_156228 ) ( CLEAR ?auto_156223 ) ( IS-CRATE ?auto_156222 ) ( not ( = ?auto_156223 ?auto_156222 ) ) ( AVAILABLE ?auto_156226 ) ( ON ?auto_156223 ?auto_156221 ) ( not ( = ?auto_156221 ?auto_156223 ) ) ( not ( = ?auto_156221 ?auto_156222 ) ) ( not ( = ?auto_156227 ?auto_156228 ) ) ( HOIST-AT ?auto_156225 ?auto_156227 ) ( not ( = ?auto_156226 ?auto_156225 ) ) ( AVAILABLE ?auto_156225 ) ( SURFACE-AT ?auto_156222 ?auto_156227 ) ( ON ?auto_156222 ?auto_156224 ) ( CLEAR ?auto_156222 ) ( not ( = ?auto_156223 ?auto_156224 ) ) ( not ( = ?auto_156222 ?auto_156224 ) ) ( not ( = ?auto_156221 ?auto_156224 ) ) ( TRUCK-AT ?auto_156229 ?auto_156228 ) ( ON ?auto_156219 ?auto_156218 ) ( ON ?auto_156220 ?auto_156219 ) ( ON ?auto_156217 ?auto_156220 ) ( ON ?auto_156221 ?auto_156217 ) ( not ( = ?auto_156218 ?auto_156219 ) ) ( not ( = ?auto_156218 ?auto_156220 ) ) ( not ( = ?auto_156218 ?auto_156217 ) ) ( not ( = ?auto_156218 ?auto_156221 ) ) ( not ( = ?auto_156218 ?auto_156223 ) ) ( not ( = ?auto_156218 ?auto_156222 ) ) ( not ( = ?auto_156218 ?auto_156224 ) ) ( not ( = ?auto_156219 ?auto_156220 ) ) ( not ( = ?auto_156219 ?auto_156217 ) ) ( not ( = ?auto_156219 ?auto_156221 ) ) ( not ( = ?auto_156219 ?auto_156223 ) ) ( not ( = ?auto_156219 ?auto_156222 ) ) ( not ( = ?auto_156219 ?auto_156224 ) ) ( not ( = ?auto_156220 ?auto_156217 ) ) ( not ( = ?auto_156220 ?auto_156221 ) ) ( not ( = ?auto_156220 ?auto_156223 ) ) ( not ( = ?auto_156220 ?auto_156222 ) ) ( not ( = ?auto_156220 ?auto_156224 ) ) ( not ( = ?auto_156217 ?auto_156221 ) ) ( not ( = ?auto_156217 ?auto_156223 ) ) ( not ( = ?auto_156217 ?auto_156222 ) ) ( not ( = ?auto_156217 ?auto_156224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156221 ?auto_156223 ?auto_156222 )
      ( MAKE-6CRATE-VERIFY ?auto_156218 ?auto_156219 ?auto_156220 ?auto_156217 ?auto_156221 ?auto_156223 ?auto_156222 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156282 - SURFACE
      ?auto_156283 - SURFACE
      ?auto_156284 - SURFACE
      ?auto_156281 - SURFACE
      ?auto_156285 - SURFACE
      ?auto_156287 - SURFACE
      ?auto_156286 - SURFACE
    )
    :vars
    (
      ?auto_156293 - HOIST
      ?auto_156289 - PLACE
      ?auto_156288 - PLACE
      ?auto_156291 - HOIST
      ?auto_156292 - SURFACE
      ?auto_156290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156293 ?auto_156289 ) ( IS-CRATE ?auto_156286 ) ( not ( = ?auto_156287 ?auto_156286 ) ) ( not ( = ?auto_156285 ?auto_156287 ) ) ( not ( = ?auto_156285 ?auto_156286 ) ) ( not ( = ?auto_156288 ?auto_156289 ) ) ( HOIST-AT ?auto_156291 ?auto_156288 ) ( not ( = ?auto_156293 ?auto_156291 ) ) ( AVAILABLE ?auto_156291 ) ( SURFACE-AT ?auto_156286 ?auto_156288 ) ( ON ?auto_156286 ?auto_156292 ) ( CLEAR ?auto_156286 ) ( not ( = ?auto_156287 ?auto_156292 ) ) ( not ( = ?auto_156286 ?auto_156292 ) ) ( not ( = ?auto_156285 ?auto_156292 ) ) ( TRUCK-AT ?auto_156290 ?auto_156289 ) ( SURFACE-AT ?auto_156285 ?auto_156289 ) ( CLEAR ?auto_156285 ) ( LIFTING ?auto_156293 ?auto_156287 ) ( IS-CRATE ?auto_156287 ) ( ON ?auto_156283 ?auto_156282 ) ( ON ?auto_156284 ?auto_156283 ) ( ON ?auto_156281 ?auto_156284 ) ( ON ?auto_156285 ?auto_156281 ) ( not ( = ?auto_156282 ?auto_156283 ) ) ( not ( = ?auto_156282 ?auto_156284 ) ) ( not ( = ?auto_156282 ?auto_156281 ) ) ( not ( = ?auto_156282 ?auto_156285 ) ) ( not ( = ?auto_156282 ?auto_156287 ) ) ( not ( = ?auto_156282 ?auto_156286 ) ) ( not ( = ?auto_156282 ?auto_156292 ) ) ( not ( = ?auto_156283 ?auto_156284 ) ) ( not ( = ?auto_156283 ?auto_156281 ) ) ( not ( = ?auto_156283 ?auto_156285 ) ) ( not ( = ?auto_156283 ?auto_156287 ) ) ( not ( = ?auto_156283 ?auto_156286 ) ) ( not ( = ?auto_156283 ?auto_156292 ) ) ( not ( = ?auto_156284 ?auto_156281 ) ) ( not ( = ?auto_156284 ?auto_156285 ) ) ( not ( = ?auto_156284 ?auto_156287 ) ) ( not ( = ?auto_156284 ?auto_156286 ) ) ( not ( = ?auto_156284 ?auto_156292 ) ) ( not ( = ?auto_156281 ?auto_156285 ) ) ( not ( = ?auto_156281 ?auto_156287 ) ) ( not ( = ?auto_156281 ?auto_156286 ) ) ( not ( = ?auto_156281 ?auto_156292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156285 ?auto_156287 ?auto_156286 )
      ( MAKE-6CRATE-VERIFY ?auto_156282 ?auto_156283 ?auto_156284 ?auto_156281 ?auto_156285 ?auto_156287 ?auto_156286 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156346 - SURFACE
      ?auto_156347 - SURFACE
      ?auto_156348 - SURFACE
      ?auto_156345 - SURFACE
      ?auto_156349 - SURFACE
      ?auto_156351 - SURFACE
      ?auto_156350 - SURFACE
    )
    :vars
    (
      ?auto_156354 - HOIST
      ?auto_156357 - PLACE
      ?auto_156353 - PLACE
      ?auto_156352 - HOIST
      ?auto_156356 - SURFACE
      ?auto_156355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156354 ?auto_156357 ) ( IS-CRATE ?auto_156350 ) ( not ( = ?auto_156351 ?auto_156350 ) ) ( not ( = ?auto_156349 ?auto_156351 ) ) ( not ( = ?auto_156349 ?auto_156350 ) ) ( not ( = ?auto_156353 ?auto_156357 ) ) ( HOIST-AT ?auto_156352 ?auto_156353 ) ( not ( = ?auto_156354 ?auto_156352 ) ) ( AVAILABLE ?auto_156352 ) ( SURFACE-AT ?auto_156350 ?auto_156353 ) ( ON ?auto_156350 ?auto_156356 ) ( CLEAR ?auto_156350 ) ( not ( = ?auto_156351 ?auto_156356 ) ) ( not ( = ?auto_156350 ?auto_156356 ) ) ( not ( = ?auto_156349 ?auto_156356 ) ) ( TRUCK-AT ?auto_156355 ?auto_156357 ) ( SURFACE-AT ?auto_156349 ?auto_156357 ) ( CLEAR ?auto_156349 ) ( IS-CRATE ?auto_156351 ) ( AVAILABLE ?auto_156354 ) ( IN ?auto_156351 ?auto_156355 ) ( ON ?auto_156347 ?auto_156346 ) ( ON ?auto_156348 ?auto_156347 ) ( ON ?auto_156345 ?auto_156348 ) ( ON ?auto_156349 ?auto_156345 ) ( not ( = ?auto_156346 ?auto_156347 ) ) ( not ( = ?auto_156346 ?auto_156348 ) ) ( not ( = ?auto_156346 ?auto_156345 ) ) ( not ( = ?auto_156346 ?auto_156349 ) ) ( not ( = ?auto_156346 ?auto_156351 ) ) ( not ( = ?auto_156346 ?auto_156350 ) ) ( not ( = ?auto_156346 ?auto_156356 ) ) ( not ( = ?auto_156347 ?auto_156348 ) ) ( not ( = ?auto_156347 ?auto_156345 ) ) ( not ( = ?auto_156347 ?auto_156349 ) ) ( not ( = ?auto_156347 ?auto_156351 ) ) ( not ( = ?auto_156347 ?auto_156350 ) ) ( not ( = ?auto_156347 ?auto_156356 ) ) ( not ( = ?auto_156348 ?auto_156345 ) ) ( not ( = ?auto_156348 ?auto_156349 ) ) ( not ( = ?auto_156348 ?auto_156351 ) ) ( not ( = ?auto_156348 ?auto_156350 ) ) ( not ( = ?auto_156348 ?auto_156356 ) ) ( not ( = ?auto_156345 ?auto_156349 ) ) ( not ( = ?auto_156345 ?auto_156351 ) ) ( not ( = ?auto_156345 ?auto_156350 ) ) ( not ( = ?auto_156345 ?auto_156356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156349 ?auto_156351 ?auto_156350 )
      ( MAKE-6CRATE-VERIFY ?auto_156346 ?auto_156347 ?auto_156348 ?auto_156345 ?auto_156349 ?auto_156351 ?auto_156350 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158302 - SURFACE
      ?auto_158303 - SURFACE
      ?auto_158304 - SURFACE
      ?auto_158301 - SURFACE
      ?auto_158305 - SURFACE
      ?auto_158307 - SURFACE
      ?auto_158306 - SURFACE
      ?auto_158308 - SURFACE
    )
    :vars
    (
      ?auto_158309 - HOIST
      ?auto_158310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158309 ?auto_158310 ) ( SURFACE-AT ?auto_158306 ?auto_158310 ) ( CLEAR ?auto_158306 ) ( LIFTING ?auto_158309 ?auto_158308 ) ( IS-CRATE ?auto_158308 ) ( not ( = ?auto_158306 ?auto_158308 ) ) ( ON ?auto_158303 ?auto_158302 ) ( ON ?auto_158304 ?auto_158303 ) ( ON ?auto_158301 ?auto_158304 ) ( ON ?auto_158305 ?auto_158301 ) ( ON ?auto_158307 ?auto_158305 ) ( ON ?auto_158306 ?auto_158307 ) ( not ( = ?auto_158302 ?auto_158303 ) ) ( not ( = ?auto_158302 ?auto_158304 ) ) ( not ( = ?auto_158302 ?auto_158301 ) ) ( not ( = ?auto_158302 ?auto_158305 ) ) ( not ( = ?auto_158302 ?auto_158307 ) ) ( not ( = ?auto_158302 ?auto_158306 ) ) ( not ( = ?auto_158302 ?auto_158308 ) ) ( not ( = ?auto_158303 ?auto_158304 ) ) ( not ( = ?auto_158303 ?auto_158301 ) ) ( not ( = ?auto_158303 ?auto_158305 ) ) ( not ( = ?auto_158303 ?auto_158307 ) ) ( not ( = ?auto_158303 ?auto_158306 ) ) ( not ( = ?auto_158303 ?auto_158308 ) ) ( not ( = ?auto_158304 ?auto_158301 ) ) ( not ( = ?auto_158304 ?auto_158305 ) ) ( not ( = ?auto_158304 ?auto_158307 ) ) ( not ( = ?auto_158304 ?auto_158306 ) ) ( not ( = ?auto_158304 ?auto_158308 ) ) ( not ( = ?auto_158301 ?auto_158305 ) ) ( not ( = ?auto_158301 ?auto_158307 ) ) ( not ( = ?auto_158301 ?auto_158306 ) ) ( not ( = ?auto_158301 ?auto_158308 ) ) ( not ( = ?auto_158305 ?auto_158307 ) ) ( not ( = ?auto_158305 ?auto_158306 ) ) ( not ( = ?auto_158305 ?auto_158308 ) ) ( not ( = ?auto_158307 ?auto_158306 ) ) ( not ( = ?auto_158307 ?auto_158308 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_158306 ?auto_158308 )
      ( MAKE-7CRATE-VERIFY ?auto_158302 ?auto_158303 ?auto_158304 ?auto_158301 ?auto_158305 ?auto_158307 ?auto_158306 ?auto_158308 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158357 - SURFACE
      ?auto_158358 - SURFACE
      ?auto_158359 - SURFACE
      ?auto_158356 - SURFACE
      ?auto_158360 - SURFACE
      ?auto_158362 - SURFACE
      ?auto_158361 - SURFACE
      ?auto_158363 - SURFACE
    )
    :vars
    (
      ?auto_158365 - HOIST
      ?auto_158364 - PLACE
      ?auto_158366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158365 ?auto_158364 ) ( SURFACE-AT ?auto_158361 ?auto_158364 ) ( CLEAR ?auto_158361 ) ( IS-CRATE ?auto_158363 ) ( not ( = ?auto_158361 ?auto_158363 ) ) ( TRUCK-AT ?auto_158366 ?auto_158364 ) ( AVAILABLE ?auto_158365 ) ( IN ?auto_158363 ?auto_158366 ) ( ON ?auto_158361 ?auto_158362 ) ( not ( = ?auto_158362 ?auto_158361 ) ) ( not ( = ?auto_158362 ?auto_158363 ) ) ( ON ?auto_158358 ?auto_158357 ) ( ON ?auto_158359 ?auto_158358 ) ( ON ?auto_158356 ?auto_158359 ) ( ON ?auto_158360 ?auto_158356 ) ( ON ?auto_158362 ?auto_158360 ) ( not ( = ?auto_158357 ?auto_158358 ) ) ( not ( = ?auto_158357 ?auto_158359 ) ) ( not ( = ?auto_158357 ?auto_158356 ) ) ( not ( = ?auto_158357 ?auto_158360 ) ) ( not ( = ?auto_158357 ?auto_158362 ) ) ( not ( = ?auto_158357 ?auto_158361 ) ) ( not ( = ?auto_158357 ?auto_158363 ) ) ( not ( = ?auto_158358 ?auto_158359 ) ) ( not ( = ?auto_158358 ?auto_158356 ) ) ( not ( = ?auto_158358 ?auto_158360 ) ) ( not ( = ?auto_158358 ?auto_158362 ) ) ( not ( = ?auto_158358 ?auto_158361 ) ) ( not ( = ?auto_158358 ?auto_158363 ) ) ( not ( = ?auto_158359 ?auto_158356 ) ) ( not ( = ?auto_158359 ?auto_158360 ) ) ( not ( = ?auto_158359 ?auto_158362 ) ) ( not ( = ?auto_158359 ?auto_158361 ) ) ( not ( = ?auto_158359 ?auto_158363 ) ) ( not ( = ?auto_158356 ?auto_158360 ) ) ( not ( = ?auto_158356 ?auto_158362 ) ) ( not ( = ?auto_158356 ?auto_158361 ) ) ( not ( = ?auto_158356 ?auto_158363 ) ) ( not ( = ?auto_158360 ?auto_158362 ) ) ( not ( = ?auto_158360 ?auto_158361 ) ) ( not ( = ?auto_158360 ?auto_158363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158362 ?auto_158361 ?auto_158363 )
      ( MAKE-7CRATE-VERIFY ?auto_158357 ?auto_158358 ?auto_158359 ?auto_158356 ?auto_158360 ?auto_158362 ?auto_158361 ?auto_158363 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158420 - SURFACE
      ?auto_158421 - SURFACE
      ?auto_158422 - SURFACE
      ?auto_158419 - SURFACE
      ?auto_158423 - SURFACE
      ?auto_158425 - SURFACE
      ?auto_158424 - SURFACE
      ?auto_158426 - SURFACE
    )
    :vars
    (
      ?auto_158427 - HOIST
      ?auto_158430 - PLACE
      ?auto_158429 - TRUCK
      ?auto_158428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158427 ?auto_158430 ) ( SURFACE-AT ?auto_158424 ?auto_158430 ) ( CLEAR ?auto_158424 ) ( IS-CRATE ?auto_158426 ) ( not ( = ?auto_158424 ?auto_158426 ) ) ( AVAILABLE ?auto_158427 ) ( IN ?auto_158426 ?auto_158429 ) ( ON ?auto_158424 ?auto_158425 ) ( not ( = ?auto_158425 ?auto_158424 ) ) ( not ( = ?auto_158425 ?auto_158426 ) ) ( TRUCK-AT ?auto_158429 ?auto_158428 ) ( not ( = ?auto_158428 ?auto_158430 ) ) ( ON ?auto_158421 ?auto_158420 ) ( ON ?auto_158422 ?auto_158421 ) ( ON ?auto_158419 ?auto_158422 ) ( ON ?auto_158423 ?auto_158419 ) ( ON ?auto_158425 ?auto_158423 ) ( not ( = ?auto_158420 ?auto_158421 ) ) ( not ( = ?auto_158420 ?auto_158422 ) ) ( not ( = ?auto_158420 ?auto_158419 ) ) ( not ( = ?auto_158420 ?auto_158423 ) ) ( not ( = ?auto_158420 ?auto_158425 ) ) ( not ( = ?auto_158420 ?auto_158424 ) ) ( not ( = ?auto_158420 ?auto_158426 ) ) ( not ( = ?auto_158421 ?auto_158422 ) ) ( not ( = ?auto_158421 ?auto_158419 ) ) ( not ( = ?auto_158421 ?auto_158423 ) ) ( not ( = ?auto_158421 ?auto_158425 ) ) ( not ( = ?auto_158421 ?auto_158424 ) ) ( not ( = ?auto_158421 ?auto_158426 ) ) ( not ( = ?auto_158422 ?auto_158419 ) ) ( not ( = ?auto_158422 ?auto_158423 ) ) ( not ( = ?auto_158422 ?auto_158425 ) ) ( not ( = ?auto_158422 ?auto_158424 ) ) ( not ( = ?auto_158422 ?auto_158426 ) ) ( not ( = ?auto_158419 ?auto_158423 ) ) ( not ( = ?auto_158419 ?auto_158425 ) ) ( not ( = ?auto_158419 ?auto_158424 ) ) ( not ( = ?auto_158419 ?auto_158426 ) ) ( not ( = ?auto_158423 ?auto_158425 ) ) ( not ( = ?auto_158423 ?auto_158424 ) ) ( not ( = ?auto_158423 ?auto_158426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158425 ?auto_158424 ?auto_158426 )
      ( MAKE-7CRATE-VERIFY ?auto_158420 ?auto_158421 ?auto_158422 ?auto_158419 ?auto_158423 ?auto_158425 ?auto_158424 ?auto_158426 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158490 - SURFACE
      ?auto_158491 - SURFACE
      ?auto_158492 - SURFACE
      ?auto_158489 - SURFACE
      ?auto_158493 - SURFACE
      ?auto_158495 - SURFACE
      ?auto_158494 - SURFACE
      ?auto_158496 - SURFACE
    )
    :vars
    (
      ?auto_158497 - HOIST
      ?auto_158501 - PLACE
      ?auto_158500 - TRUCK
      ?auto_158499 - PLACE
      ?auto_158498 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_158497 ?auto_158501 ) ( SURFACE-AT ?auto_158494 ?auto_158501 ) ( CLEAR ?auto_158494 ) ( IS-CRATE ?auto_158496 ) ( not ( = ?auto_158494 ?auto_158496 ) ) ( AVAILABLE ?auto_158497 ) ( ON ?auto_158494 ?auto_158495 ) ( not ( = ?auto_158495 ?auto_158494 ) ) ( not ( = ?auto_158495 ?auto_158496 ) ) ( TRUCK-AT ?auto_158500 ?auto_158499 ) ( not ( = ?auto_158499 ?auto_158501 ) ) ( HOIST-AT ?auto_158498 ?auto_158499 ) ( LIFTING ?auto_158498 ?auto_158496 ) ( not ( = ?auto_158497 ?auto_158498 ) ) ( ON ?auto_158491 ?auto_158490 ) ( ON ?auto_158492 ?auto_158491 ) ( ON ?auto_158489 ?auto_158492 ) ( ON ?auto_158493 ?auto_158489 ) ( ON ?auto_158495 ?auto_158493 ) ( not ( = ?auto_158490 ?auto_158491 ) ) ( not ( = ?auto_158490 ?auto_158492 ) ) ( not ( = ?auto_158490 ?auto_158489 ) ) ( not ( = ?auto_158490 ?auto_158493 ) ) ( not ( = ?auto_158490 ?auto_158495 ) ) ( not ( = ?auto_158490 ?auto_158494 ) ) ( not ( = ?auto_158490 ?auto_158496 ) ) ( not ( = ?auto_158491 ?auto_158492 ) ) ( not ( = ?auto_158491 ?auto_158489 ) ) ( not ( = ?auto_158491 ?auto_158493 ) ) ( not ( = ?auto_158491 ?auto_158495 ) ) ( not ( = ?auto_158491 ?auto_158494 ) ) ( not ( = ?auto_158491 ?auto_158496 ) ) ( not ( = ?auto_158492 ?auto_158489 ) ) ( not ( = ?auto_158492 ?auto_158493 ) ) ( not ( = ?auto_158492 ?auto_158495 ) ) ( not ( = ?auto_158492 ?auto_158494 ) ) ( not ( = ?auto_158492 ?auto_158496 ) ) ( not ( = ?auto_158489 ?auto_158493 ) ) ( not ( = ?auto_158489 ?auto_158495 ) ) ( not ( = ?auto_158489 ?auto_158494 ) ) ( not ( = ?auto_158489 ?auto_158496 ) ) ( not ( = ?auto_158493 ?auto_158495 ) ) ( not ( = ?auto_158493 ?auto_158494 ) ) ( not ( = ?auto_158493 ?auto_158496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158495 ?auto_158494 ?auto_158496 )
      ( MAKE-7CRATE-VERIFY ?auto_158490 ?auto_158491 ?auto_158492 ?auto_158489 ?auto_158493 ?auto_158495 ?auto_158494 ?auto_158496 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158567 - SURFACE
      ?auto_158568 - SURFACE
      ?auto_158569 - SURFACE
      ?auto_158566 - SURFACE
      ?auto_158570 - SURFACE
      ?auto_158572 - SURFACE
      ?auto_158571 - SURFACE
      ?auto_158573 - SURFACE
    )
    :vars
    (
      ?auto_158578 - HOIST
      ?auto_158574 - PLACE
      ?auto_158577 - TRUCK
      ?auto_158579 - PLACE
      ?auto_158575 - HOIST
      ?auto_158576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158578 ?auto_158574 ) ( SURFACE-AT ?auto_158571 ?auto_158574 ) ( CLEAR ?auto_158571 ) ( IS-CRATE ?auto_158573 ) ( not ( = ?auto_158571 ?auto_158573 ) ) ( AVAILABLE ?auto_158578 ) ( ON ?auto_158571 ?auto_158572 ) ( not ( = ?auto_158572 ?auto_158571 ) ) ( not ( = ?auto_158572 ?auto_158573 ) ) ( TRUCK-AT ?auto_158577 ?auto_158579 ) ( not ( = ?auto_158579 ?auto_158574 ) ) ( HOIST-AT ?auto_158575 ?auto_158579 ) ( not ( = ?auto_158578 ?auto_158575 ) ) ( AVAILABLE ?auto_158575 ) ( SURFACE-AT ?auto_158573 ?auto_158579 ) ( ON ?auto_158573 ?auto_158576 ) ( CLEAR ?auto_158573 ) ( not ( = ?auto_158571 ?auto_158576 ) ) ( not ( = ?auto_158573 ?auto_158576 ) ) ( not ( = ?auto_158572 ?auto_158576 ) ) ( ON ?auto_158568 ?auto_158567 ) ( ON ?auto_158569 ?auto_158568 ) ( ON ?auto_158566 ?auto_158569 ) ( ON ?auto_158570 ?auto_158566 ) ( ON ?auto_158572 ?auto_158570 ) ( not ( = ?auto_158567 ?auto_158568 ) ) ( not ( = ?auto_158567 ?auto_158569 ) ) ( not ( = ?auto_158567 ?auto_158566 ) ) ( not ( = ?auto_158567 ?auto_158570 ) ) ( not ( = ?auto_158567 ?auto_158572 ) ) ( not ( = ?auto_158567 ?auto_158571 ) ) ( not ( = ?auto_158567 ?auto_158573 ) ) ( not ( = ?auto_158567 ?auto_158576 ) ) ( not ( = ?auto_158568 ?auto_158569 ) ) ( not ( = ?auto_158568 ?auto_158566 ) ) ( not ( = ?auto_158568 ?auto_158570 ) ) ( not ( = ?auto_158568 ?auto_158572 ) ) ( not ( = ?auto_158568 ?auto_158571 ) ) ( not ( = ?auto_158568 ?auto_158573 ) ) ( not ( = ?auto_158568 ?auto_158576 ) ) ( not ( = ?auto_158569 ?auto_158566 ) ) ( not ( = ?auto_158569 ?auto_158570 ) ) ( not ( = ?auto_158569 ?auto_158572 ) ) ( not ( = ?auto_158569 ?auto_158571 ) ) ( not ( = ?auto_158569 ?auto_158573 ) ) ( not ( = ?auto_158569 ?auto_158576 ) ) ( not ( = ?auto_158566 ?auto_158570 ) ) ( not ( = ?auto_158566 ?auto_158572 ) ) ( not ( = ?auto_158566 ?auto_158571 ) ) ( not ( = ?auto_158566 ?auto_158573 ) ) ( not ( = ?auto_158566 ?auto_158576 ) ) ( not ( = ?auto_158570 ?auto_158572 ) ) ( not ( = ?auto_158570 ?auto_158571 ) ) ( not ( = ?auto_158570 ?auto_158573 ) ) ( not ( = ?auto_158570 ?auto_158576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158572 ?auto_158571 ?auto_158573 )
      ( MAKE-7CRATE-VERIFY ?auto_158567 ?auto_158568 ?auto_158569 ?auto_158566 ?auto_158570 ?auto_158572 ?auto_158571 ?auto_158573 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158645 - SURFACE
      ?auto_158646 - SURFACE
      ?auto_158647 - SURFACE
      ?auto_158644 - SURFACE
      ?auto_158648 - SURFACE
      ?auto_158650 - SURFACE
      ?auto_158649 - SURFACE
      ?auto_158651 - SURFACE
    )
    :vars
    (
      ?auto_158655 - HOIST
      ?auto_158657 - PLACE
      ?auto_158654 - PLACE
      ?auto_158653 - HOIST
      ?auto_158652 - SURFACE
      ?auto_158656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158655 ?auto_158657 ) ( SURFACE-AT ?auto_158649 ?auto_158657 ) ( CLEAR ?auto_158649 ) ( IS-CRATE ?auto_158651 ) ( not ( = ?auto_158649 ?auto_158651 ) ) ( AVAILABLE ?auto_158655 ) ( ON ?auto_158649 ?auto_158650 ) ( not ( = ?auto_158650 ?auto_158649 ) ) ( not ( = ?auto_158650 ?auto_158651 ) ) ( not ( = ?auto_158654 ?auto_158657 ) ) ( HOIST-AT ?auto_158653 ?auto_158654 ) ( not ( = ?auto_158655 ?auto_158653 ) ) ( AVAILABLE ?auto_158653 ) ( SURFACE-AT ?auto_158651 ?auto_158654 ) ( ON ?auto_158651 ?auto_158652 ) ( CLEAR ?auto_158651 ) ( not ( = ?auto_158649 ?auto_158652 ) ) ( not ( = ?auto_158651 ?auto_158652 ) ) ( not ( = ?auto_158650 ?auto_158652 ) ) ( TRUCK-AT ?auto_158656 ?auto_158657 ) ( ON ?auto_158646 ?auto_158645 ) ( ON ?auto_158647 ?auto_158646 ) ( ON ?auto_158644 ?auto_158647 ) ( ON ?auto_158648 ?auto_158644 ) ( ON ?auto_158650 ?auto_158648 ) ( not ( = ?auto_158645 ?auto_158646 ) ) ( not ( = ?auto_158645 ?auto_158647 ) ) ( not ( = ?auto_158645 ?auto_158644 ) ) ( not ( = ?auto_158645 ?auto_158648 ) ) ( not ( = ?auto_158645 ?auto_158650 ) ) ( not ( = ?auto_158645 ?auto_158649 ) ) ( not ( = ?auto_158645 ?auto_158651 ) ) ( not ( = ?auto_158645 ?auto_158652 ) ) ( not ( = ?auto_158646 ?auto_158647 ) ) ( not ( = ?auto_158646 ?auto_158644 ) ) ( not ( = ?auto_158646 ?auto_158648 ) ) ( not ( = ?auto_158646 ?auto_158650 ) ) ( not ( = ?auto_158646 ?auto_158649 ) ) ( not ( = ?auto_158646 ?auto_158651 ) ) ( not ( = ?auto_158646 ?auto_158652 ) ) ( not ( = ?auto_158647 ?auto_158644 ) ) ( not ( = ?auto_158647 ?auto_158648 ) ) ( not ( = ?auto_158647 ?auto_158650 ) ) ( not ( = ?auto_158647 ?auto_158649 ) ) ( not ( = ?auto_158647 ?auto_158651 ) ) ( not ( = ?auto_158647 ?auto_158652 ) ) ( not ( = ?auto_158644 ?auto_158648 ) ) ( not ( = ?auto_158644 ?auto_158650 ) ) ( not ( = ?auto_158644 ?auto_158649 ) ) ( not ( = ?auto_158644 ?auto_158651 ) ) ( not ( = ?auto_158644 ?auto_158652 ) ) ( not ( = ?auto_158648 ?auto_158650 ) ) ( not ( = ?auto_158648 ?auto_158649 ) ) ( not ( = ?auto_158648 ?auto_158651 ) ) ( not ( = ?auto_158648 ?auto_158652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158650 ?auto_158649 ?auto_158651 )
      ( MAKE-7CRATE-VERIFY ?auto_158645 ?auto_158646 ?auto_158647 ?auto_158644 ?auto_158648 ?auto_158650 ?auto_158649 ?auto_158651 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158723 - SURFACE
      ?auto_158724 - SURFACE
      ?auto_158725 - SURFACE
      ?auto_158722 - SURFACE
      ?auto_158726 - SURFACE
      ?auto_158728 - SURFACE
      ?auto_158727 - SURFACE
      ?auto_158729 - SURFACE
    )
    :vars
    (
      ?auto_158732 - HOIST
      ?auto_158731 - PLACE
      ?auto_158735 - PLACE
      ?auto_158734 - HOIST
      ?auto_158730 - SURFACE
      ?auto_158733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158732 ?auto_158731 ) ( IS-CRATE ?auto_158729 ) ( not ( = ?auto_158727 ?auto_158729 ) ) ( not ( = ?auto_158728 ?auto_158727 ) ) ( not ( = ?auto_158728 ?auto_158729 ) ) ( not ( = ?auto_158735 ?auto_158731 ) ) ( HOIST-AT ?auto_158734 ?auto_158735 ) ( not ( = ?auto_158732 ?auto_158734 ) ) ( AVAILABLE ?auto_158734 ) ( SURFACE-AT ?auto_158729 ?auto_158735 ) ( ON ?auto_158729 ?auto_158730 ) ( CLEAR ?auto_158729 ) ( not ( = ?auto_158727 ?auto_158730 ) ) ( not ( = ?auto_158729 ?auto_158730 ) ) ( not ( = ?auto_158728 ?auto_158730 ) ) ( TRUCK-AT ?auto_158733 ?auto_158731 ) ( SURFACE-AT ?auto_158728 ?auto_158731 ) ( CLEAR ?auto_158728 ) ( LIFTING ?auto_158732 ?auto_158727 ) ( IS-CRATE ?auto_158727 ) ( ON ?auto_158724 ?auto_158723 ) ( ON ?auto_158725 ?auto_158724 ) ( ON ?auto_158722 ?auto_158725 ) ( ON ?auto_158726 ?auto_158722 ) ( ON ?auto_158728 ?auto_158726 ) ( not ( = ?auto_158723 ?auto_158724 ) ) ( not ( = ?auto_158723 ?auto_158725 ) ) ( not ( = ?auto_158723 ?auto_158722 ) ) ( not ( = ?auto_158723 ?auto_158726 ) ) ( not ( = ?auto_158723 ?auto_158728 ) ) ( not ( = ?auto_158723 ?auto_158727 ) ) ( not ( = ?auto_158723 ?auto_158729 ) ) ( not ( = ?auto_158723 ?auto_158730 ) ) ( not ( = ?auto_158724 ?auto_158725 ) ) ( not ( = ?auto_158724 ?auto_158722 ) ) ( not ( = ?auto_158724 ?auto_158726 ) ) ( not ( = ?auto_158724 ?auto_158728 ) ) ( not ( = ?auto_158724 ?auto_158727 ) ) ( not ( = ?auto_158724 ?auto_158729 ) ) ( not ( = ?auto_158724 ?auto_158730 ) ) ( not ( = ?auto_158725 ?auto_158722 ) ) ( not ( = ?auto_158725 ?auto_158726 ) ) ( not ( = ?auto_158725 ?auto_158728 ) ) ( not ( = ?auto_158725 ?auto_158727 ) ) ( not ( = ?auto_158725 ?auto_158729 ) ) ( not ( = ?auto_158725 ?auto_158730 ) ) ( not ( = ?auto_158722 ?auto_158726 ) ) ( not ( = ?auto_158722 ?auto_158728 ) ) ( not ( = ?auto_158722 ?auto_158727 ) ) ( not ( = ?auto_158722 ?auto_158729 ) ) ( not ( = ?auto_158722 ?auto_158730 ) ) ( not ( = ?auto_158726 ?auto_158728 ) ) ( not ( = ?auto_158726 ?auto_158727 ) ) ( not ( = ?auto_158726 ?auto_158729 ) ) ( not ( = ?auto_158726 ?auto_158730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158728 ?auto_158727 ?auto_158729 )
      ( MAKE-7CRATE-VERIFY ?auto_158723 ?auto_158724 ?auto_158725 ?auto_158722 ?auto_158726 ?auto_158728 ?auto_158727 ?auto_158729 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158801 - SURFACE
      ?auto_158802 - SURFACE
      ?auto_158803 - SURFACE
      ?auto_158800 - SURFACE
      ?auto_158804 - SURFACE
      ?auto_158806 - SURFACE
      ?auto_158805 - SURFACE
      ?auto_158807 - SURFACE
    )
    :vars
    (
      ?auto_158812 - HOIST
      ?auto_158810 - PLACE
      ?auto_158809 - PLACE
      ?auto_158813 - HOIST
      ?auto_158811 - SURFACE
      ?auto_158808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158812 ?auto_158810 ) ( IS-CRATE ?auto_158807 ) ( not ( = ?auto_158805 ?auto_158807 ) ) ( not ( = ?auto_158806 ?auto_158805 ) ) ( not ( = ?auto_158806 ?auto_158807 ) ) ( not ( = ?auto_158809 ?auto_158810 ) ) ( HOIST-AT ?auto_158813 ?auto_158809 ) ( not ( = ?auto_158812 ?auto_158813 ) ) ( AVAILABLE ?auto_158813 ) ( SURFACE-AT ?auto_158807 ?auto_158809 ) ( ON ?auto_158807 ?auto_158811 ) ( CLEAR ?auto_158807 ) ( not ( = ?auto_158805 ?auto_158811 ) ) ( not ( = ?auto_158807 ?auto_158811 ) ) ( not ( = ?auto_158806 ?auto_158811 ) ) ( TRUCK-AT ?auto_158808 ?auto_158810 ) ( SURFACE-AT ?auto_158806 ?auto_158810 ) ( CLEAR ?auto_158806 ) ( IS-CRATE ?auto_158805 ) ( AVAILABLE ?auto_158812 ) ( IN ?auto_158805 ?auto_158808 ) ( ON ?auto_158802 ?auto_158801 ) ( ON ?auto_158803 ?auto_158802 ) ( ON ?auto_158800 ?auto_158803 ) ( ON ?auto_158804 ?auto_158800 ) ( ON ?auto_158806 ?auto_158804 ) ( not ( = ?auto_158801 ?auto_158802 ) ) ( not ( = ?auto_158801 ?auto_158803 ) ) ( not ( = ?auto_158801 ?auto_158800 ) ) ( not ( = ?auto_158801 ?auto_158804 ) ) ( not ( = ?auto_158801 ?auto_158806 ) ) ( not ( = ?auto_158801 ?auto_158805 ) ) ( not ( = ?auto_158801 ?auto_158807 ) ) ( not ( = ?auto_158801 ?auto_158811 ) ) ( not ( = ?auto_158802 ?auto_158803 ) ) ( not ( = ?auto_158802 ?auto_158800 ) ) ( not ( = ?auto_158802 ?auto_158804 ) ) ( not ( = ?auto_158802 ?auto_158806 ) ) ( not ( = ?auto_158802 ?auto_158805 ) ) ( not ( = ?auto_158802 ?auto_158807 ) ) ( not ( = ?auto_158802 ?auto_158811 ) ) ( not ( = ?auto_158803 ?auto_158800 ) ) ( not ( = ?auto_158803 ?auto_158804 ) ) ( not ( = ?auto_158803 ?auto_158806 ) ) ( not ( = ?auto_158803 ?auto_158805 ) ) ( not ( = ?auto_158803 ?auto_158807 ) ) ( not ( = ?auto_158803 ?auto_158811 ) ) ( not ( = ?auto_158800 ?auto_158804 ) ) ( not ( = ?auto_158800 ?auto_158806 ) ) ( not ( = ?auto_158800 ?auto_158805 ) ) ( not ( = ?auto_158800 ?auto_158807 ) ) ( not ( = ?auto_158800 ?auto_158811 ) ) ( not ( = ?auto_158804 ?auto_158806 ) ) ( not ( = ?auto_158804 ?auto_158805 ) ) ( not ( = ?auto_158804 ?auto_158807 ) ) ( not ( = ?auto_158804 ?auto_158811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158806 ?auto_158805 ?auto_158807 )
      ( MAKE-7CRATE-VERIFY ?auto_158801 ?auto_158802 ?auto_158803 ?auto_158800 ?auto_158804 ?auto_158806 ?auto_158805 ?auto_158807 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161720 - SURFACE
      ?auto_161721 - SURFACE
      ?auto_161722 - SURFACE
      ?auto_161719 - SURFACE
      ?auto_161723 - SURFACE
      ?auto_161725 - SURFACE
      ?auto_161724 - SURFACE
      ?auto_161726 - SURFACE
      ?auto_161727 - SURFACE
    )
    :vars
    (
      ?auto_161729 - HOIST
      ?auto_161728 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161729 ?auto_161728 ) ( SURFACE-AT ?auto_161726 ?auto_161728 ) ( CLEAR ?auto_161726 ) ( LIFTING ?auto_161729 ?auto_161727 ) ( IS-CRATE ?auto_161727 ) ( not ( = ?auto_161726 ?auto_161727 ) ) ( ON ?auto_161721 ?auto_161720 ) ( ON ?auto_161722 ?auto_161721 ) ( ON ?auto_161719 ?auto_161722 ) ( ON ?auto_161723 ?auto_161719 ) ( ON ?auto_161725 ?auto_161723 ) ( ON ?auto_161724 ?auto_161725 ) ( ON ?auto_161726 ?auto_161724 ) ( not ( = ?auto_161720 ?auto_161721 ) ) ( not ( = ?auto_161720 ?auto_161722 ) ) ( not ( = ?auto_161720 ?auto_161719 ) ) ( not ( = ?auto_161720 ?auto_161723 ) ) ( not ( = ?auto_161720 ?auto_161725 ) ) ( not ( = ?auto_161720 ?auto_161724 ) ) ( not ( = ?auto_161720 ?auto_161726 ) ) ( not ( = ?auto_161720 ?auto_161727 ) ) ( not ( = ?auto_161721 ?auto_161722 ) ) ( not ( = ?auto_161721 ?auto_161719 ) ) ( not ( = ?auto_161721 ?auto_161723 ) ) ( not ( = ?auto_161721 ?auto_161725 ) ) ( not ( = ?auto_161721 ?auto_161724 ) ) ( not ( = ?auto_161721 ?auto_161726 ) ) ( not ( = ?auto_161721 ?auto_161727 ) ) ( not ( = ?auto_161722 ?auto_161719 ) ) ( not ( = ?auto_161722 ?auto_161723 ) ) ( not ( = ?auto_161722 ?auto_161725 ) ) ( not ( = ?auto_161722 ?auto_161724 ) ) ( not ( = ?auto_161722 ?auto_161726 ) ) ( not ( = ?auto_161722 ?auto_161727 ) ) ( not ( = ?auto_161719 ?auto_161723 ) ) ( not ( = ?auto_161719 ?auto_161725 ) ) ( not ( = ?auto_161719 ?auto_161724 ) ) ( not ( = ?auto_161719 ?auto_161726 ) ) ( not ( = ?auto_161719 ?auto_161727 ) ) ( not ( = ?auto_161723 ?auto_161725 ) ) ( not ( = ?auto_161723 ?auto_161724 ) ) ( not ( = ?auto_161723 ?auto_161726 ) ) ( not ( = ?auto_161723 ?auto_161727 ) ) ( not ( = ?auto_161725 ?auto_161724 ) ) ( not ( = ?auto_161725 ?auto_161726 ) ) ( not ( = ?auto_161725 ?auto_161727 ) ) ( not ( = ?auto_161724 ?auto_161726 ) ) ( not ( = ?auto_161724 ?auto_161727 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_161726 ?auto_161727 )
      ( MAKE-8CRATE-VERIFY ?auto_161720 ?auto_161721 ?auto_161722 ?auto_161719 ?auto_161723 ?auto_161725 ?auto_161724 ?auto_161726 ?auto_161727 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161787 - SURFACE
      ?auto_161788 - SURFACE
      ?auto_161789 - SURFACE
      ?auto_161786 - SURFACE
      ?auto_161790 - SURFACE
      ?auto_161792 - SURFACE
      ?auto_161791 - SURFACE
      ?auto_161793 - SURFACE
      ?auto_161794 - SURFACE
    )
    :vars
    (
      ?auto_161796 - HOIST
      ?auto_161797 - PLACE
      ?auto_161795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_161796 ?auto_161797 ) ( SURFACE-AT ?auto_161793 ?auto_161797 ) ( CLEAR ?auto_161793 ) ( IS-CRATE ?auto_161794 ) ( not ( = ?auto_161793 ?auto_161794 ) ) ( TRUCK-AT ?auto_161795 ?auto_161797 ) ( AVAILABLE ?auto_161796 ) ( IN ?auto_161794 ?auto_161795 ) ( ON ?auto_161793 ?auto_161791 ) ( not ( = ?auto_161791 ?auto_161793 ) ) ( not ( = ?auto_161791 ?auto_161794 ) ) ( ON ?auto_161788 ?auto_161787 ) ( ON ?auto_161789 ?auto_161788 ) ( ON ?auto_161786 ?auto_161789 ) ( ON ?auto_161790 ?auto_161786 ) ( ON ?auto_161792 ?auto_161790 ) ( ON ?auto_161791 ?auto_161792 ) ( not ( = ?auto_161787 ?auto_161788 ) ) ( not ( = ?auto_161787 ?auto_161789 ) ) ( not ( = ?auto_161787 ?auto_161786 ) ) ( not ( = ?auto_161787 ?auto_161790 ) ) ( not ( = ?auto_161787 ?auto_161792 ) ) ( not ( = ?auto_161787 ?auto_161791 ) ) ( not ( = ?auto_161787 ?auto_161793 ) ) ( not ( = ?auto_161787 ?auto_161794 ) ) ( not ( = ?auto_161788 ?auto_161789 ) ) ( not ( = ?auto_161788 ?auto_161786 ) ) ( not ( = ?auto_161788 ?auto_161790 ) ) ( not ( = ?auto_161788 ?auto_161792 ) ) ( not ( = ?auto_161788 ?auto_161791 ) ) ( not ( = ?auto_161788 ?auto_161793 ) ) ( not ( = ?auto_161788 ?auto_161794 ) ) ( not ( = ?auto_161789 ?auto_161786 ) ) ( not ( = ?auto_161789 ?auto_161790 ) ) ( not ( = ?auto_161789 ?auto_161792 ) ) ( not ( = ?auto_161789 ?auto_161791 ) ) ( not ( = ?auto_161789 ?auto_161793 ) ) ( not ( = ?auto_161789 ?auto_161794 ) ) ( not ( = ?auto_161786 ?auto_161790 ) ) ( not ( = ?auto_161786 ?auto_161792 ) ) ( not ( = ?auto_161786 ?auto_161791 ) ) ( not ( = ?auto_161786 ?auto_161793 ) ) ( not ( = ?auto_161786 ?auto_161794 ) ) ( not ( = ?auto_161790 ?auto_161792 ) ) ( not ( = ?auto_161790 ?auto_161791 ) ) ( not ( = ?auto_161790 ?auto_161793 ) ) ( not ( = ?auto_161790 ?auto_161794 ) ) ( not ( = ?auto_161792 ?auto_161791 ) ) ( not ( = ?auto_161792 ?auto_161793 ) ) ( not ( = ?auto_161792 ?auto_161794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161791 ?auto_161793 ?auto_161794 )
      ( MAKE-8CRATE-VERIFY ?auto_161787 ?auto_161788 ?auto_161789 ?auto_161786 ?auto_161790 ?auto_161792 ?auto_161791 ?auto_161793 ?auto_161794 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161863 - SURFACE
      ?auto_161864 - SURFACE
      ?auto_161865 - SURFACE
      ?auto_161862 - SURFACE
      ?auto_161866 - SURFACE
      ?auto_161868 - SURFACE
      ?auto_161867 - SURFACE
      ?auto_161869 - SURFACE
      ?auto_161870 - SURFACE
    )
    :vars
    (
      ?auto_161871 - HOIST
      ?auto_161874 - PLACE
      ?auto_161873 - TRUCK
      ?auto_161872 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161871 ?auto_161874 ) ( SURFACE-AT ?auto_161869 ?auto_161874 ) ( CLEAR ?auto_161869 ) ( IS-CRATE ?auto_161870 ) ( not ( = ?auto_161869 ?auto_161870 ) ) ( AVAILABLE ?auto_161871 ) ( IN ?auto_161870 ?auto_161873 ) ( ON ?auto_161869 ?auto_161867 ) ( not ( = ?auto_161867 ?auto_161869 ) ) ( not ( = ?auto_161867 ?auto_161870 ) ) ( TRUCK-AT ?auto_161873 ?auto_161872 ) ( not ( = ?auto_161872 ?auto_161874 ) ) ( ON ?auto_161864 ?auto_161863 ) ( ON ?auto_161865 ?auto_161864 ) ( ON ?auto_161862 ?auto_161865 ) ( ON ?auto_161866 ?auto_161862 ) ( ON ?auto_161868 ?auto_161866 ) ( ON ?auto_161867 ?auto_161868 ) ( not ( = ?auto_161863 ?auto_161864 ) ) ( not ( = ?auto_161863 ?auto_161865 ) ) ( not ( = ?auto_161863 ?auto_161862 ) ) ( not ( = ?auto_161863 ?auto_161866 ) ) ( not ( = ?auto_161863 ?auto_161868 ) ) ( not ( = ?auto_161863 ?auto_161867 ) ) ( not ( = ?auto_161863 ?auto_161869 ) ) ( not ( = ?auto_161863 ?auto_161870 ) ) ( not ( = ?auto_161864 ?auto_161865 ) ) ( not ( = ?auto_161864 ?auto_161862 ) ) ( not ( = ?auto_161864 ?auto_161866 ) ) ( not ( = ?auto_161864 ?auto_161868 ) ) ( not ( = ?auto_161864 ?auto_161867 ) ) ( not ( = ?auto_161864 ?auto_161869 ) ) ( not ( = ?auto_161864 ?auto_161870 ) ) ( not ( = ?auto_161865 ?auto_161862 ) ) ( not ( = ?auto_161865 ?auto_161866 ) ) ( not ( = ?auto_161865 ?auto_161868 ) ) ( not ( = ?auto_161865 ?auto_161867 ) ) ( not ( = ?auto_161865 ?auto_161869 ) ) ( not ( = ?auto_161865 ?auto_161870 ) ) ( not ( = ?auto_161862 ?auto_161866 ) ) ( not ( = ?auto_161862 ?auto_161868 ) ) ( not ( = ?auto_161862 ?auto_161867 ) ) ( not ( = ?auto_161862 ?auto_161869 ) ) ( not ( = ?auto_161862 ?auto_161870 ) ) ( not ( = ?auto_161866 ?auto_161868 ) ) ( not ( = ?auto_161866 ?auto_161867 ) ) ( not ( = ?auto_161866 ?auto_161869 ) ) ( not ( = ?auto_161866 ?auto_161870 ) ) ( not ( = ?auto_161868 ?auto_161867 ) ) ( not ( = ?auto_161868 ?auto_161869 ) ) ( not ( = ?auto_161868 ?auto_161870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161867 ?auto_161869 ?auto_161870 )
      ( MAKE-8CRATE-VERIFY ?auto_161863 ?auto_161864 ?auto_161865 ?auto_161862 ?auto_161866 ?auto_161868 ?auto_161867 ?auto_161869 ?auto_161870 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161947 - SURFACE
      ?auto_161948 - SURFACE
      ?auto_161949 - SURFACE
      ?auto_161946 - SURFACE
      ?auto_161950 - SURFACE
      ?auto_161952 - SURFACE
      ?auto_161951 - SURFACE
      ?auto_161953 - SURFACE
      ?auto_161954 - SURFACE
    )
    :vars
    (
      ?auto_161959 - HOIST
      ?auto_161955 - PLACE
      ?auto_161956 - TRUCK
      ?auto_161958 - PLACE
      ?auto_161957 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_161959 ?auto_161955 ) ( SURFACE-AT ?auto_161953 ?auto_161955 ) ( CLEAR ?auto_161953 ) ( IS-CRATE ?auto_161954 ) ( not ( = ?auto_161953 ?auto_161954 ) ) ( AVAILABLE ?auto_161959 ) ( ON ?auto_161953 ?auto_161951 ) ( not ( = ?auto_161951 ?auto_161953 ) ) ( not ( = ?auto_161951 ?auto_161954 ) ) ( TRUCK-AT ?auto_161956 ?auto_161958 ) ( not ( = ?auto_161958 ?auto_161955 ) ) ( HOIST-AT ?auto_161957 ?auto_161958 ) ( LIFTING ?auto_161957 ?auto_161954 ) ( not ( = ?auto_161959 ?auto_161957 ) ) ( ON ?auto_161948 ?auto_161947 ) ( ON ?auto_161949 ?auto_161948 ) ( ON ?auto_161946 ?auto_161949 ) ( ON ?auto_161950 ?auto_161946 ) ( ON ?auto_161952 ?auto_161950 ) ( ON ?auto_161951 ?auto_161952 ) ( not ( = ?auto_161947 ?auto_161948 ) ) ( not ( = ?auto_161947 ?auto_161949 ) ) ( not ( = ?auto_161947 ?auto_161946 ) ) ( not ( = ?auto_161947 ?auto_161950 ) ) ( not ( = ?auto_161947 ?auto_161952 ) ) ( not ( = ?auto_161947 ?auto_161951 ) ) ( not ( = ?auto_161947 ?auto_161953 ) ) ( not ( = ?auto_161947 ?auto_161954 ) ) ( not ( = ?auto_161948 ?auto_161949 ) ) ( not ( = ?auto_161948 ?auto_161946 ) ) ( not ( = ?auto_161948 ?auto_161950 ) ) ( not ( = ?auto_161948 ?auto_161952 ) ) ( not ( = ?auto_161948 ?auto_161951 ) ) ( not ( = ?auto_161948 ?auto_161953 ) ) ( not ( = ?auto_161948 ?auto_161954 ) ) ( not ( = ?auto_161949 ?auto_161946 ) ) ( not ( = ?auto_161949 ?auto_161950 ) ) ( not ( = ?auto_161949 ?auto_161952 ) ) ( not ( = ?auto_161949 ?auto_161951 ) ) ( not ( = ?auto_161949 ?auto_161953 ) ) ( not ( = ?auto_161949 ?auto_161954 ) ) ( not ( = ?auto_161946 ?auto_161950 ) ) ( not ( = ?auto_161946 ?auto_161952 ) ) ( not ( = ?auto_161946 ?auto_161951 ) ) ( not ( = ?auto_161946 ?auto_161953 ) ) ( not ( = ?auto_161946 ?auto_161954 ) ) ( not ( = ?auto_161950 ?auto_161952 ) ) ( not ( = ?auto_161950 ?auto_161951 ) ) ( not ( = ?auto_161950 ?auto_161953 ) ) ( not ( = ?auto_161950 ?auto_161954 ) ) ( not ( = ?auto_161952 ?auto_161951 ) ) ( not ( = ?auto_161952 ?auto_161953 ) ) ( not ( = ?auto_161952 ?auto_161954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161951 ?auto_161953 ?auto_161954 )
      ( MAKE-8CRATE-VERIFY ?auto_161947 ?auto_161948 ?auto_161949 ?auto_161946 ?auto_161950 ?auto_161952 ?auto_161951 ?auto_161953 ?auto_161954 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162039 - SURFACE
      ?auto_162040 - SURFACE
      ?auto_162041 - SURFACE
      ?auto_162038 - SURFACE
      ?auto_162042 - SURFACE
      ?auto_162044 - SURFACE
      ?auto_162043 - SURFACE
      ?auto_162045 - SURFACE
      ?auto_162046 - SURFACE
    )
    :vars
    (
      ?auto_162047 - HOIST
      ?auto_162052 - PLACE
      ?auto_162050 - TRUCK
      ?auto_162048 - PLACE
      ?auto_162051 - HOIST
      ?auto_162049 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_162047 ?auto_162052 ) ( SURFACE-AT ?auto_162045 ?auto_162052 ) ( CLEAR ?auto_162045 ) ( IS-CRATE ?auto_162046 ) ( not ( = ?auto_162045 ?auto_162046 ) ) ( AVAILABLE ?auto_162047 ) ( ON ?auto_162045 ?auto_162043 ) ( not ( = ?auto_162043 ?auto_162045 ) ) ( not ( = ?auto_162043 ?auto_162046 ) ) ( TRUCK-AT ?auto_162050 ?auto_162048 ) ( not ( = ?auto_162048 ?auto_162052 ) ) ( HOIST-AT ?auto_162051 ?auto_162048 ) ( not ( = ?auto_162047 ?auto_162051 ) ) ( AVAILABLE ?auto_162051 ) ( SURFACE-AT ?auto_162046 ?auto_162048 ) ( ON ?auto_162046 ?auto_162049 ) ( CLEAR ?auto_162046 ) ( not ( = ?auto_162045 ?auto_162049 ) ) ( not ( = ?auto_162046 ?auto_162049 ) ) ( not ( = ?auto_162043 ?auto_162049 ) ) ( ON ?auto_162040 ?auto_162039 ) ( ON ?auto_162041 ?auto_162040 ) ( ON ?auto_162038 ?auto_162041 ) ( ON ?auto_162042 ?auto_162038 ) ( ON ?auto_162044 ?auto_162042 ) ( ON ?auto_162043 ?auto_162044 ) ( not ( = ?auto_162039 ?auto_162040 ) ) ( not ( = ?auto_162039 ?auto_162041 ) ) ( not ( = ?auto_162039 ?auto_162038 ) ) ( not ( = ?auto_162039 ?auto_162042 ) ) ( not ( = ?auto_162039 ?auto_162044 ) ) ( not ( = ?auto_162039 ?auto_162043 ) ) ( not ( = ?auto_162039 ?auto_162045 ) ) ( not ( = ?auto_162039 ?auto_162046 ) ) ( not ( = ?auto_162039 ?auto_162049 ) ) ( not ( = ?auto_162040 ?auto_162041 ) ) ( not ( = ?auto_162040 ?auto_162038 ) ) ( not ( = ?auto_162040 ?auto_162042 ) ) ( not ( = ?auto_162040 ?auto_162044 ) ) ( not ( = ?auto_162040 ?auto_162043 ) ) ( not ( = ?auto_162040 ?auto_162045 ) ) ( not ( = ?auto_162040 ?auto_162046 ) ) ( not ( = ?auto_162040 ?auto_162049 ) ) ( not ( = ?auto_162041 ?auto_162038 ) ) ( not ( = ?auto_162041 ?auto_162042 ) ) ( not ( = ?auto_162041 ?auto_162044 ) ) ( not ( = ?auto_162041 ?auto_162043 ) ) ( not ( = ?auto_162041 ?auto_162045 ) ) ( not ( = ?auto_162041 ?auto_162046 ) ) ( not ( = ?auto_162041 ?auto_162049 ) ) ( not ( = ?auto_162038 ?auto_162042 ) ) ( not ( = ?auto_162038 ?auto_162044 ) ) ( not ( = ?auto_162038 ?auto_162043 ) ) ( not ( = ?auto_162038 ?auto_162045 ) ) ( not ( = ?auto_162038 ?auto_162046 ) ) ( not ( = ?auto_162038 ?auto_162049 ) ) ( not ( = ?auto_162042 ?auto_162044 ) ) ( not ( = ?auto_162042 ?auto_162043 ) ) ( not ( = ?auto_162042 ?auto_162045 ) ) ( not ( = ?auto_162042 ?auto_162046 ) ) ( not ( = ?auto_162042 ?auto_162049 ) ) ( not ( = ?auto_162044 ?auto_162043 ) ) ( not ( = ?auto_162044 ?auto_162045 ) ) ( not ( = ?auto_162044 ?auto_162046 ) ) ( not ( = ?auto_162044 ?auto_162049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162043 ?auto_162045 ?auto_162046 )
      ( MAKE-8CRATE-VERIFY ?auto_162039 ?auto_162040 ?auto_162041 ?auto_162038 ?auto_162042 ?auto_162044 ?auto_162043 ?auto_162045 ?auto_162046 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162132 - SURFACE
      ?auto_162133 - SURFACE
      ?auto_162134 - SURFACE
      ?auto_162131 - SURFACE
      ?auto_162135 - SURFACE
      ?auto_162137 - SURFACE
      ?auto_162136 - SURFACE
      ?auto_162138 - SURFACE
      ?auto_162139 - SURFACE
    )
    :vars
    (
      ?auto_162142 - HOIST
      ?auto_162143 - PLACE
      ?auto_162145 - PLACE
      ?auto_162144 - HOIST
      ?auto_162140 - SURFACE
      ?auto_162141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162142 ?auto_162143 ) ( SURFACE-AT ?auto_162138 ?auto_162143 ) ( CLEAR ?auto_162138 ) ( IS-CRATE ?auto_162139 ) ( not ( = ?auto_162138 ?auto_162139 ) ) ( AVAILABLE ?auto_162142 ) ( ON ?auto_162138 ?auto_162136 ) ( not ( = ?auto_162136 ?auto_162138 ) ) ( not ( = ?auto_162136 ?auto_162139 ) ) ( not ( = ?auto_162145 ?auto_162143 ) ) ( HOIST-AT ?auto_162144 ?auto_162145 ) ( not ( = ?auto_162142 ?auto_162144 ) ) ( AVAILABLE ?auto_162144 ) ( SURFACE-AT ?auto_162139 ?auto_162145 ) ( ON ?auto_162139 ?auto_162140 ) ( CLEAR ?auto_162139 ) ( not ( = ?auto_162138 ?auto_162140 ) ) ( not ( = ?auto_162139 ?auto_162140 ) ) ( not ( = ?auto_162136 ?auto_162140 ) ) ( TRUCK-AT ?auto_162141 ?auto_162143 ) ( ON ?auto_162133 ?auto_162132 ) ( ON ?auto_162134 ?auto_162133 ) ( ON ?auto_162131 ?auto_162134 ) ( ON ?auto_162135 ?auto_162131 ) ( ON ?auto_162137 ?auto_162135 ) ( ON ?auto_162136 ?auto_162137 ) ( not ( = ?auto_162132 ?auto_162133 ) ) ( not ( = ?auto_162132 ?auto_162134 ) ) ( not ( = ?auto_162132 ?auto_162131 ) ) ( not ( = ?auto_162132 ?auto_162135 ) ) ( not ( = ?auto_162132 ?auto_162137 ) ) ( not ( = ?auto_162132 ?auto_162136 ) ) ( not ( = ?auto_162132 ?auto_162138 ) ) ( not ( = ?auto_162132 ?auto_162139 ) ) ( not ( = ?auto_162132 ?auto_162140 ) ) ( not ( = ?auto_162133 ?auto_162134 ) ) ( not ( = ?auto_162133 ?auto_162131 ) ) ( not ( = ?auto_162133 ?auto_162135 ) ) ( not ( = ?auto_162133 ?auto_162137 ) ) ( not ( = ?auto_162133 ?auto_162136 ) ) ( not ( = ?auto_162133 ?auto_162138 ) ) ( not ( = ?auto_162133 ?auto_162139 ) ) ( not ( = ?auto_162133 ?auto_162140 ) ) ( not ( = ?auto_162134 ?auto_162131 ) ) ( not ( = ?auto_162134 ?auto_162135 ) ) ( not ( = ?auto_162134 ?auto_162137 ) ) ( not ( = ?auto_162134 ?auto_162136 ) ) ( not ( = ?auto_162134 ?auto_162138 ) ) ( not ( = ?auto_162134 ?auto_162139 ) ) ( not ( = ?auto_162134 ?auto_162140 ) ) ( not ( = ?auto_162131 ?auto_162135 ) ) ( not ( = ?auto_162131 ?auto_162137 ) ) ( not ( = ?auto_162131 ?auto_162136 ) ) ( not ( = ?auto_162131 ?auto_162138 ) ) ( not ( = ?auto_162131 ?auto_162139 ) ) ( not ( = ?auto_162131 ?auto_162140 ) ) ( not ( = ?auto_162135 ?auto_162137 ) ) ( not ( = ?auto_162135 ?auto_162136 ) ) ( not ( = ?auto_162135 ?auto_162138 ) ) ( not ( = ?auto_162135 ?auto_162139 ) ) ( not ( = ?auto_162135 ?auto_162140 ) ) ( not ( = ?auto_162137 ?auto_162136 ) ) ( not ( = ?auto_162137 ?auto_162138 ) ) ( not ( = ?auto_162137 ?auto_162139 ) ) ( not ( = ?auto_162137 ?auto_162140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162136 ?auto_162138 ?auto_162139 )
      ( MAKE-8CRATE-VERIFY ?auto_162132 ?auto_162133 ?auto_162134 ?auto_162131 ?auto_162135 ?auto_162137 ?auto_162136 ?auto_162138 ?auto_162139 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162225 - SURFACE
      ?auto_162226 - SURFACE
      ?auto_162227 - SURFACE
      ?auto_162224 - SURFACE
      ?auto_162228 - SURFACE
      ?auto_162230 - SURFACE
      ?auto_162229 - SURFACE
      ?auto_162231 - SURFACE
      ?auto_162232 - SURFACE
    )
    :vars
    (
      ?auto_162236 - HOIST
      ?auto_162237 - PLACE
      ?auto_162238 - PLACE
      ?auto_162235 - HOIST
      ?auto_162234 - SURFACE
      ?auto_162233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162236 ?auto_162237 ) ( IS-CRATE ?auto_162232 ) ( not ( = ?auto_162231 ?auto_162232 ) ) ( not ( = ?auto_162229 ?auto_162231 ) ) ( not ( = ?auto_162229 ?auto_162232 ) ) ( not ( = ?auto_162238 ?auto_162237 ) ) ( HOIST-AT ?auto_162235 ?auto_162238 ) ( not ( = ?auto_162236 ?auto_162235 ) ) ( AVAILABLE ?auto_162235 ) ( SURFACE-AT ?auto_162232 ?auto_162238 ) ( ON ?auto_162232 ?auto_162234 ) ( CLEAR ?auto_162232 ) ( not ( = ?auto_162231 ?auto_162234 ) ) ( not ( = ?auto_162232 ?auto_162234 ) ) ( not ( = ?auto_162229 ?auto_162234 ) ) ( TRUCK-AT ?auto_162233 ?auto_162237 ) ( SURFACE-AT ?auto_162229 ?auto_162237 ) ( CLEAR ?auto_162229 ) ( LIFTING ?auto_162236 ?auto_162231 ) ( IS-CRATE ?auto_162231 ) ( ON ?auto_162226 ?auto_162225 ) ( ON ?auto_162227 ?auto_162226 ) ( ON ?auto_162224 ?auto_162227 ) ( ON ?auto_162228 ?auto_162224 ) ( ON ?auto_162230 ?auto_162228 ) ( ON ?auto_162229 ?auto_162230 ) ( not ( = ?auto_162225 ?auto_162226 ) ) ( not ( = ?auto_162225 ?auto_162227 ) ) ( not ( = ?auto_162225 ?auto_162224 ) ) ( not ( = ?auto_162225 ?auto_162228 ) ) ( not ( = ?auto_162225 ?auto_162230 ) ) ( not ( = ?auto_162225 ?auto_162229 ) ) ( not ( = ?auto_162225 ?auto_162231 ) ) ( not ( = ?auto_162225 ?auto_162232 ) ) ( not ( = ?auto_162225 ?auto_162234 ) ) ( not ( = ?auto_162226 ?auto_162227 ) ) ( not ( = ?auto_162226 ?auto_162224 ) ) ( not ( = ?auto_162226 ?auto_162228 ) ) ( not ( = ?auto_162226 ?auto_162230 ) ) ( not ( = ?auto_162226 ?auto_162229 ) ) ( not ( = ?auto_162226 ?auto_162231 ) ) ( not ( = ?auto_162226 ?auto_162232 ) ) ( not ( = ?auto_162226 ?auto_162234 ) ) ( not ( = ?auto_162227 ?auto_162224 ) ) ( not ( = ?auto_162227 ?auto_162228 ) ) ( not ( = ?auto_162227 ?auto_162230 ) ) ( not ( = ?auto_162227 ?auto_162229 ) ) ( not ( = ?auto_162227 ?auto_162231 ) ) ( not ( = ?auto_162227 ?auto_162232 ) ) ( not ( = ?auto_162227 ?auto_162234 ) ) ( not ( = ?auto_162224 ?auto_162228 ) ) ( not ( = ?auto_162224 ?auto_162230 ) ) ( not ( = ?auto_162224 ?auto_162229 ) ) ( not ( = ?auto_162224 ?auto_162231 ) ) ( not ( = ?auto_162224 ?auto_162232 ) ) ( not ( = ?auto_162224 ?auto_162234 ) ) ( not ( = ?auto_162228 ?auto_162230 ) ) ( not ( = ?auto_162228 ?auto_162229 ) ) ( not ( = ?auto_162228 ?auto_162231 ) ) ( not ( = ?auto_162228 ?auto_162232 ) ) ( not ( = ?auto_162228 ?auto_162234 ) ) ( not ( = ?auto_162230 ?auto_162229 ) ) ( not ( = ?auto_162230 ?auto_162231 ) ) ( not ( = ?auto_162230 ?auto_162232 ) ) ( not ( = ?auto_162230 ?auto_162234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162229 ?auto_162231 ?auto_162232 )
      ( MAKE-8CRATE-VERIFY ?auto_162225 ?auto_162226 ?auto_162227 ?auto_162224 ?auto_162228 ?auto_162230 ?auto_162229 ?auto_162231 ?auto_162232 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162318 - SURFACE
      ?auto_162319 - SURFACE
      ?auto_162320 - SURFACE
      ?auto_162317 - SURFACE
      ?auto_162321 - SURFACE
      ?auto_162323 - SURFACE
      ?auto_162322 - SURFACE
      ?auto_162324 - SURFACE
      ?auto_162325 - SURFACE
    )
    :vars
    (
      ?auto_162328 - HOIST
      ?auto_162326 - PLACE
      ?auto_162331 - PLACE
      ?auto_162330 - HOIST
      ?auto_162329 - SURFACE
      ?auto_162327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162328 ?auto_162326 ) ( IS-CRATE ?auto_162325 ) ( not ( = ?auto_162324 ?auto_162325 ) ) ( not ( = ?auto_162322 ?auto_162324 ) ) ( not ( = ?auto_162322 ?auto_162325 ) ) ( not ( = ?auto_162331 ?auto_162326 ) ) ( HOIST-AT ?auto_162330 ?auto_162331 ) ( not ( = ?auto_162328 ?auto_162330 ) ) ( AVAILABLE ?auto_162330 ) ( SURFACE-AT ?auto_162325 ?auto_162331 ) ( ON ?auto_162325 ?auto_162329 ) ( CLEAR ?auto_162325 ) ( not ( = ?auto_162324 ?auto_162329 ) ) ( not ( = ?auto_162325 ?auto_162329 ) ) ( not ( = ?auto_162322 ?auto_162329 ) ) ( TRUCK-AT ?auto_162327 ?auto_162326 ) ( SURFACE-AT ?auto_162322 ?auto_162326 ) ( CLEAR ?auto_162322 ) ( IS-CRATE ?auto_162324 ) ( AVAILABLE ?auto_162328 ) ( IN ?auto_162324 ?auto_162327 ) ( ON ?auto_162319 ?auto_162318 ) ( ON ?auto_162320 ?auto_162319 ) ( ON ?auto_162317 ?auto_162320 ) ( ON ?auto_162321 ?auto_162317 ) ( ON ?auto_162323 ?auto_162321 ) ( ON ?auto_162322 ?auto_162323 ) ( not ( = ?auto_162318 ?auto_162319 ) ) ( not ( = ?auto_162318 ?auto_162320 ) ) ( not ( = ?auto_162318 ?auto_162317 ) ) ( not ( = ?auto_162318 ?auto_162321 ) ) ( not ( = ?auto_162318 ?auto_162323 ) ) ( not ( = ?auto_162318 ?auto_162322 ) ) ( not ( = ?auto_162318 ?auto_162324 ) ) ( not ( = ?auto_162318 ?auto_162325 ) ) ( not ( = ?auto_162318 ?auto_162329 ) ) ( not ( = ?auto_162319 ?auto_162320 ) ) ( not ( = ?auto_162319 ?auto_162317 ) ) ( not ( = ?auto_162319 ?auto_162321 ) ) ( not ( = ?auto_162319 ?auto_162323 ) ) ( not ( = ?auto_162319 ?auto_162322 ) ) ( not ( = ?auto_162319 ?auto_162324 ) ) ( not ( = ?auto_162319 ?auto_162325 ) ) ( not ( = ?auto_162319 ?auto_162329 ) ) ( not ( = ?auto_162320 ?auto_162317 ) ) ( not ( = ?auto_162320 ?auto_162321 ) ) ( not ( = ?auto_162320 ?auto_162323 ) ) ( not ( = ?auto_162320 ?auto_162322 ) ) ( not ( = ?auto_162320 ?auto_162324 ) ) ( not ( = ?auto_162320 ?auto_162325 ) ) ( not ( = ?auto_162320 ?auto_162329 ) ) ( not ( = ?auto_162317 ?auto_162321 ) ) ( not ( = ?auto_162317 ?auto_162323 ) ) ( not ( = ?auto_162317 ?auto_162322 ) ) ( not ( = ?auto_162317 ?auto_162324 ) ) ( not ( = ?auto_162317 ?auto_162325 ) ) ( not ( = ?auto_162317 ?auto_162329 ) ) ( not ( = ?auto_162321 ?auto_162323 ) ) ( not ( = ?auto_162321 ?auto_162322 ) ) ( not ( = ?auto_162321 ?auto_162324 ) ) ( not ( = ?auto_162321 ?auto_162325 ) ) ( not ( = ?auto_162321 ?auto_162329 ) ) ( not ( = ?auto_162323 ?auto_162322 ) ) ( not ( = ?auto_162323 ?auto_162324 ) ) ( not ( = ?auto_162323 ?auto_162325 ) ) ( not ( = ?auto_162323 ?auto_162329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162322 ?auto_162324 ?auto_162325 )
      ( MAKE-8CRATE-VERIFY ?auto_162318 ?auto_162319 ?auto_162320 ?auto_162317 ?auto_162321 ?auto_162323 ?auto_162322 ?auto_162324 ?auto_162325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_162372 - SURFACE
      ?auto_162373 - SURFACE
      ?auto_162374 - SURFACE
      ?auto_162371 - SURFACE
      ?auto_162375 - SURFACE
      ?auto_162376 - SURFACE
    )
    :vars
    (
      ?auto_162381 - HOIST
      ?auto_162379 - PLACE
      ?auto_162377 - PLACE
      ?auto_162382 - HOIST
      ?auto_162380 - SURFACE
      ?auto_162378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162381 ?auto_162379 ) ( IS-CRATE ?auto_162376 ) ( not ( = ?auto_162375 ?auto_162376 ) ) ( not ( = ?auto_162371 ?auto_162375 ) ) ( not ( = ?auto_162371 ?auto_162376 ) ) ( not ( = ?auto_162377 ?auto_162379 ) ) ( HOIST-AT ?auto_162382 ?auto_162377 ) ( not ( = ?auto_162381 ?auto_162382 ) ) ( AVAILABLE ?auto_162382 ) ( SURFACE-AT ?auto_162376 ?auto_162377 ) ( ON ?auto_162376 ?auto_162380 ) ( CLEAR ?auto_162376 ) ( not ( = ?auto_162375 ?auto_162380 ) ) ( not ( = ?auto_162376 ?auto_162380 ) ) ( not ( = ?auto_162371 ?auto_162380 ) ) ( SURFACE-AT ?auto_162371 ?auto_162379 ) ( CLEAR ?auto_162371 ) ( IS-CRATE ?auto_162375 ) ( AVAILABLE ?auto_162381 ) ( IN ?auto_162375 ?auto_162378 ) ( TRUCK-AT ?auto_162378 ?auto_162377 ) ( ON ?auto_162373 ?auto_162372 ) ( ON ?auto_162374 ?auto_162373 ) ( ON ?auto_162371 ?auto_162374 ) ( not ( = ?auto_162372 ?auto_162373 ) ) ( not ( = ?auto_162372 ?auto_162374 ) ) ( not ( = ?auto_162372 ?auto_162371 ) ) ( not ( = ?auto_162372 ?auto_162375 ) ) ( not ( = ?auto_162372 ?auto_162376 ) ) ( not ( = ?auto_162372 ?auto_162380 ) ) ( not ( = ?auto_162373 ?auto_162374 ) ) ( not ( = ?auto_162373 ?auto_162371 ) ) ( not ( = ?auto_162373 ?auto_162375 ) ) ( not ( = ?auto_162373 ?auto_162376 ) ) ( not ( = ?auto_162373 ?auto_162380 ) ) ( not ( = ?auto_162374 ?auto_162371 ) ) ( not ( = ?auto_162374 ?auto_162375 ) ) ( not ( = ?auto_162374 ?auto_162376 ) ) ( not ( = ?auto_162374 ?auto_162380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162371 ?auto_162375 ?auto_162376 )
      ( MAKE-5CRATE-VERIFY ?auto_162372 ?auto_162373 ?auto_162374 ?auto_162371 ?auto_162375 ?auto_162376 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_162384 - SURFACE
      ?auto_162385 - SURFACE
      ?auto_162386 - SURFACE
      ?auto_162383 - SURFACE
      ?auto_162387 - SURFACE
      ?auto_162389 - SURFACE
      ?auto_162388 - SURFACE
    )
    :vars
    (
      ?auto_162394 - HOIST
      ?auto_162392 - PLACE
      ?auto_162390 - PLACE
      ?auto_162395 - HOIST
      ?auto_162393 - SURFACE
      ?auto_162391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162394 ?auto_162392 ) ( IS-CRATE ?auto_162388 ) ( not ( = ?auto_162389 ?auto_162388 ) ) ( not ( = ?auto_162387 ?auto_162389 ) ) ( not ( = ?auto_162387 ?auto_162388 ) ) ( not ( = ?auto_162390 ?auto_162392 ) ) ( HOIST-AT ?auto_162395 ?auto_162390 ) ( not ( = ?auto_162394 ?auto_162395 ) ) ( AVAILABLE ?auto_162395 ) ( SURFACE-AT ?auto_162388 ?auto_162390 ) ( ON ?auto_162388 ?auto_162393 ) ( CLEAR ?auto_162388 ) ( not ( = ?auto_162389 ?auto_162393 ) ) ( not ( = ?auto_162388 ?auto_162393 ) ) ( not ( = ?auto_162387 ?auto_162393 ) ) ( SURFACE-AT ?auto_162387 ?auto_162392 ) ( CLEAR ?auto_162387 ) ( IS-CRATE ?auto_162389 ) ( AVAILABLE ?auto_162394 ) ( IN ?auto_162389 ?auto_162391 ) ( TRUCK-AT ?auto_162391 ?auto_162390 ) ( ON ?auto_162385 ?auto_162384 ) ( ON ?auto_162386 ?auto_162385 ) ( ON ?auto_162383 ?auto_162386 ) ( ON ?auto_162387 ?auto_162383 ) ( not ( = ?auto_162384 ?auto_162385 ) ) ( not ( = ?auto_162384 ?auto_162386 ) ) ( not ( = ?auto_162384 ?auto_162383 ) ) ( not ( = ?auto_162384 ?auto_162387 ) ) ( not ( = ?auto_162384 ?auto_162389 ) ) ( not ( = ?auto_162384 ?auto_162388 ) ) ( not ( = ?auto_162384 ?auto_162393 ) ) ( not ( = ?auto_162385 ?auto_162386 ) ) ( not ( = ?auto_162385 ?auto_162383 ) ) ( not ( = ?auto_162385 ?auto_162387 ) ) ( not ( = ?auto_162385 ?auto_162389 ) ) ( not ( = ?auto_162385 ?auto_162388 ) ) ( not ( = ?auto_162385 ?auto_162393 ) ) ( not ( = ?auto_162386 ?auto_162383 ) ) ( not ( = ?auto_162386 ?auto_162387 ) ) ( not ( = ?auto_162386 ?auto_162389 ) ) ( not ( = ?auto_162386 ?auto_162388 ) ) ( not ( = ?auto_162386 ?auto_162393 ) ) ( not ( = ?auto_162383 ?auto_162387 ) ) ( not ( = ?auto_162383 ?auto_162389 ) ) ( not ( = ?auto_162383 ?auto_162388 ) ) ( not ( = ?auto_162383 ?auto_162393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162387 ?auto_162389 ?auto_162388 )
      ( MAKE-6CRATE-VERIFY ?auto_162384 ?auto_162385 ?auto_162386 ?auto_162383 ?auto_162387 ?auto_162389 ?auto_162388 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_162397 - SURFACE
      ?auto_162398 - SURFACE
      ?auto_162399 - SURFACE
      ?auto_162396 - SURFACE
      ?auto_162400 - SURFACE
      ?auto_162402 - SURFACE
      ?auto_162401 - SURFACE
      ?auto_162403 - SURFACE
    )
    :vars
    (
      ?auto_162408 - HOIST
      ?auto_162406 - PLACE
      ?auto_162404 - PLACE
      ?auto_162409 - HOIST
      ?auto_162407 - SURFACE
      ?auto_162405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162408 ?auto_162406 ) ( IS-CRATE ?auto_162403 ) ( not ( = ?auto_162401 ?auto_162403 ) ) ( not ( = ?auto_162402 ?auto_162401 ) ) ( not ( = ?auto_162402 ?auto_162403 ) ) ( not ( = ?auto_162404 ?auto_162406 ) ) ( HOIST-AT ?auto_162409 ?auto_162404 ) ( not ( = ?auto_162408 ?auto_162409 ) ) ( AVAILABLE ?auto_162409 ) ( SURFACE-AT ?auto_162403 ?auto_162404 ) ( ON ?auto_162403 ?auto_162407 ) ( CLEAR ?auto_162403 ) ( not ( = ?auto_162401 ?auto_162407 ) ) ( not ( = ?auto_162403 ?auto_162407 ) ) ( not ( = ?auto_162402 ?auto_162407 ) ) ( SURFACE-AT ?auto_162402 ?auto_162406 ) ( CLEAR ?auto_162402 ) ( IS-CRATE ?auto_162401 ) ( AVAILABLE ?auto_162408 ) ( IN ?auto_162401 ?auto_162405 ) ( TRUCK-AT ?auto_162405 ?auto_162404 ) ( ON ?auto_162398 ?auto_162397 ) ( ON ?auto_162399 ?auto_162398 ) ( ON ?auto_162396 ?auto_162399 ) ( ON ?auto_162400 ?auto_162396 ) ( ON ?auto_162402 ?auto_162400 ) ( not ( = ?auto_162397 ?auto_162398 ) ) ( not ( = ?auto_162397 ?auto_162399 ) ) ( not ( = ?auto_162397 ?auto_162396 ) ) ( not ( = ?auto_162397 ?auto_162400 ) ) ( not ( = ?auto_162397 ?auto_162402 ) ) ( not ( = ?auto_162397 ?auto_162401 ) ) ( not ( = ?auto_162397 ?auto_162403 ) ) ( not ( = ?auto_162397 ?auto_162407 ) ) ( not ( = ?auto_162398 ?auto_162399 ) ) ( not ( = ?auto_162398 ?auto_162396 ) ) ( not ( = ?auto_162398 ?auto_162400 ) ) ( not ( = ?auto_162398 ?auto_162402 ) ) ( not ( = ?auto_162398 ?auto_162401 ) ) ( not ( = ?auto_162398 ?auto_162403 ) ) ( not ( = ?auto_162398 ?auto_162407 ) ) ( not ( = ?auto_162399 ?auto_162396 ) ) ( not ( = ?auto_162399 ?auto_162400 ) ) ( not ( = ?auto_162399 ?auto_162402 ) ) ( not ( = ?auto_162399 ?auto_162401 ) ) ( not ( = ?auto_162399 ?auto_162403 ) ) ( not ( = ?auto_162399 ?auto_162407 ) ) ( not ( = ?auto_162396 ?auto_162400 ) ) ( not ( = ?auto_162396 ?auto_162402 ) ) ( not ( = ?auto_162396 ?auto_162401 ) ) ( not ( = ?auto_162396 ?auto_162403 ) ) ( not ( = ?auto_162396 ?auto_162407 ) ) ( not ( = ?auto_162400 ?auto_162402 ) ) ( not ( = ?auto_162400 ?auto_162401 ) ) ( not ( = ?auto_162400 ?auto_162403 ) ) ( not ( = ?auto_162400 ?auto_162407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162402 ?auto_162401 ?auto_162403 )
      ( MAKE-7CRATE-VERIFY ?auto_162397 ?auto_162398 ?auto_162399 ?auto_162396 ?auto_162400 ?auto_162402 ?auto_162401 ?auto_162403 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162411 - SURFACE
      ?auto_162412 - SURFACE
      ?auto_162413 - SURFACE
      ?auto_162410 - SURFACE
      ?auto_162414 - SURFACE
      ?auto_162416 - SURFACE
      ?auto_162415 - SURFACE
      ?auto_162417 - SURFACE
      ?auto_162418 - SURFACE
    )
    :vars
    (
      ?auto_162423 - HOIST
      ?auto_162421 - PLACE
      ?auto_162419 - PLACE
      ?auto_162424 - HOIST
      ?auto_162422 - SURFACE
      ?auto_162420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162423 ?auto_162421 ) ( IS-CRATE ?auto_162418 ) ( not ( = ?auto_162417 ?auto_162418 ) ) ( not ( = ?auto_162415 ?auto_162417 ) ) ( not ( = ?auto_162415 ?auto_162418 ) ) ( not ( = ?auto_162419 ?auto_162421 ) ) ( HOIST-AT ?auto_162424 ?auto_162419 ) ( not ( = ?auto_162423 ?auto_162424 ) ) ( AVAILABLE ?auto_162424 ) ( SURFACE-AT ?auto_162418 ?auto_162419 ) ( ON ?auto_162418 ?auto_162422 ) ( CLEAR ?auto_162418 ) ( not ( = ?auto_162417 ?auto_162422 ) ) ( not ( = ?auto_162418 ?auto_162422 ) ) ( not ( = ?auto_162415 ?auto_162422 ) ) ( SURFACE-AT ?auto_162415 ?auto_162421 ) ( CLEAR ?auto_162415 ) ( IS-CRATE ?auto_162417 ) ( AVAILABLE ?auto_162423 ) ( IN ?auto_162417 ?auto_162420 ) ( TRUCK-AT ?auto_162420 ?auto_162419 ) ( ON ?auto_162412 ?auto_162411 ) ( ON ?auto_162413 ?auto_162412 ) ( ON ?auto_162410 ?auto_162413 ) ( ON ?auto_162414 ?auto_162410 ) ( ON ?auto_162416 ?auto_162414 ) ( ON ?auto_162415 ?auto_162416 ) ( not ( = ?auto_162411 ?auto_162412 ) ) ( not ( = ?auto_162411 ?auto_162413 ) ) ( not ( = ?auto_162411 ?auto_162410 ) ) ( not ( = ?auto_162411 ?auto_162414 ) ) ( not ( = ?auto_162411 ?auto_162416 ) ) ( not ( = ?auto_162411 ?auto_162415 ) ) ( not ( = ?auto_162411 ?auto_162417 ) ) ( not ( = ?auto_162411 ?auto_162418 ) ) ( not ( = ?auto_162411 ?auto_162422 ) ) ( not ( = ?auto_162412 ?auto_162413 ) ) ( not ( = ?auto_162412 ?auto_162410 ) ) ( not ( = ?auto_162412 ?auto_162414 ) ) ( not ( = ?auto_162412 ?auto_162416 ) ) ( not ( = ?auto_162412 ?auto_162415 ) ) ( not ( = ?auto_162412 ?auto_162417 ) ) ( not ( = ?auto_162412 ?auto_162418 ) ) ( not ( = ?auto_162412 ?auto_162422 ) ) ( not ( = ?auto_162413 ?auto_162410 ) ) ( not ( = ?auto_162413 ?auto_162414 ) ) ( not ( = ?auto_162413 ?auto_162416 ) ) ( not ( = ?auto_162413 ?auto_162415 ) ) ( not ( = ?auto_162413 ?auto_162417 ) ) ( not ( = ?auto_162413 ?auto_162418 ) ) ( not ( = ?auto_162413 ?auto_162422 ) ) ( not ( = ?auto_162410 ?auto_162414 ) ) ( not ( = ?auto_162410 ?auto_162416 ) ) ( not ( = ?auto_162410 ?auto_162415 ) ) ( not ( = ?auto_162410 ?auto_162417 ) ) ( not ( = ?auto_162410 ?auto_162418 ) ) ( not ( = ?auto_162410 ?auto_162422 ) ) ( not ( = ?auto_162414 ?auto_162416 ) ) ( not ( = ?auto_162414 ?auto_162415 ) ) ( not ( = ?auto_162414 ?auto_162417 ) ) ( not ( = ?auto_162414 ?auto_162418 ) ) ( not ( = ?auto_162414 ?auto_162422 ) ) ( not ( = ?auto_162416 ?auto_162415 ) ) ( not ( = ?auto_162416 ?auto_162417 ) ) ( not ( = ?auto_162416 ?auto_162418 ) ) ( not ( = ?auto_162416 ?auto_162422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162415 ?auto_162417 ?auto_162418 )
      ( MAKE-8CRATE-VERIFY ?auto_162411 ?auto_162412 ?auto_162413 ?auto_162410 ?auto_162414 ?auto_162416 ?auto_162415 ?auto_162417 ?auto_162418 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_162465 - SURFACE
      ?auto_162466 - SURFACE
      ?auto_162467 - SURFACE
      ?auto_162464 - SURFACE
      ?auto_162468 - SURFACE
      ?auto_162469 - SURFACE
    )
    :vars
    (
      ?auto_162474 - HOIST
      ?auto_162473 - PLACE
      ?auto_162472 - PLACE
      ?auto_162475 - HOIST
      ?auto_162471 - SURFACE
      ?auto_162470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162474 ?auto_162473 ) ( IS-CRATE ?auto_162469 ) ( not ( = ?auto_162468 ?auto_162469 ) ) ( not ( = ?auto_162464 ?auto_162468 ) ) ( not ( = ?auto_162464 ?auto_162469 ) ) ( not ( = ?auto_162472 ?auto_162473 ) ) ( HOIST-AT ?auto_162475 ?auto_162472 ) ( not ( = ?auto_162474 ?auto_162475 ) ) ( SURFACE-AT ?auto_162469 ?auto_162472 ) ( ON ?auto_162469 ?auto_162471 ) ( CLEAR ?auto_162469 ) ( not ( = ?auto_162468 ?auto_162471 ) ) ( not ( = ?auto_162469 ?auto_162471 ) ) ( not ( = ?auto_162464 ?auto_162471 ) ) ( SURFACE-AT ?auto_162464 ?auto_162473 ) ( CLEAR ?auto_162464 ) ( IS-CRATE ?auto_162468 ) ( AVAILABLE ?auto_162474 ) ( TRUCK-AT ?auto_162470 ?auto_162472 ) ( LIFTING ?auto_162475 ?auto_162468 ) ( ON ?auto_162466 ?auto_162465 ) ( ON ?auto_162467 ?auto_162466 ) ( ON ?auto_162464 ?auto_162467 ) ( not ( = ?auto_162465 ?auto_162466 ) ) ( not ( = ?auto_162465 ?auto_162467 ) ) ( not ( = ?auto_162465 ?auto_162464 ) ) ( not ( = ?auto_162465 ?auto_162468 ) ) ( not ( = ?auto_162465 ?auto_162469 ) ) ( not ( = ?auto_162465 ?auto_162471 ) ) ( not ( = ?auto_162466 ?auto_162467 ) ) ( not ( = ?auto_162466 ?auto_162464 ) ) ( not ( = ?auto_162466 ?auto_162468 ) ) ( not ( = ?auto_162466 ?auto_162469 ) ) ( not ( = ?auto_162466 ?auto_162471 ) ) ( not ( = ?auto_162467 ?auto_162464 ) ) ( not ( = ?auto_162467 ?auto_162468 ) ) ( not ( = ?auto_162467 ?auto_162469 ) ) ( not ( = ?auto_162467 ?auto_162471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162464 ?auto_162468 ?auto_162469 )
      ( MAKE-5CRATE-VERIFY ?auto_162465 ?auto_162466 ?auto_162467 ?auto_162464 ?auto_162468 ?auto_162469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_162477 - SURFACE
      ?auto_162478 - SURFACE
      ?auto_162479 - SURFACE
      ?auto_162476 - SURFACE
      ?auto_162480 - SURFACE
      ?auto_162482 - SURFACE
      ?auto_162481 - SURFACE
    )
    :vars
    (
      ?auto_162487 - HOIST
      ?auto_162486 - PLACE
      ?auto_162485 - PLACE
      ?auto_162488 - HOIST
      ?auto_162484 - SURFACE
      ?auto_162483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162487 ?auto_162486 ) ( IS-CRATE ?auto_162481 ) ( not ( = ?auto_162482 ?auto_162481 ) ) ( not ( = ?auto_162480 ?auto_162482 ) ) ( not ( = ?auto_162480 ?auto_162481 ) ) ( not ( = ?auto_162485 ?auto_162486 ) ) ( HOIST-AT ?auto_162488 ?auto_162485 ) ( not ( = ?auto_162487 ?auto_162488 ) ) ( SURFACE-AT ?auto_162481 ?auto_162485 ) ( ON ?auto_162481 ?auto_162484 ) ( CLEAR ?auto_162481 ) ( not ( = ?auto_162482 ?auto_162484 ) ) ( not ( = ?auto_162481 ?auto_162484 ) ) ( not ( = ?auto_162480 ?auto_162484 ) ) ( SURFACE-AT ?auto_162480 ?auto_162486 ) ( CLEAR ?auto_162480 ) ( IS-CRATE ?auto_162482 ) ( AVAILABLE ?auto_162487 ) ( TRUCK-AT ?auto_162483 ?auto_162485 ) ( LIFTING ?auto_162488 ?auto_162482 ) ( ON ?auto_162478 ?auto_162477 ) ( ON ?auto_162479 ?auto_162478 ) ( ON ?auto_162476 ?auto_162479 ) ( ON ?auto_162480 ?auto_162476 ) ( not ( = ?auto_162477 ?auto_162478 ) ) ( not ( = ?auto_162477 ?auto_162479 ) ) ( not ( = ?auto_162477 ?auto_162476 ) ) ( not ( = ?auto_162477 ?auto_162480 ) ) ( not ( = ?auto_162477 ?auto_162482 ) ) ( not ( = ?auto_162477 ?auto_162481 ) ) ( not ( = ?auto_162477 ?auto_162484 ) ) ( not ( = ?auto_162478 ?auto_162479 ) ) ( not ( = ?auto_162478 ?auto_162476 ) ) ( not ( = ?auto_162478 ?auto_162480 ) ) ( not ( = ?auto_162478 ?auto_162482 ) ) ( not ( = ?auto_162478 ?auto_162481 ) ) ( not ( = ?auto_162478 ?auto_162484 ) ) ( not ( = ?auto_162479 ?auto_162476 ) ) ( not ( = ?auto_162479 ?auto_162480 ) ) ( not ( = ?auto_162479 ?auto_162482 ) ) ( not ( = ?auto_162479 ?auto_162481 ) ) ( not ( = ?auto_162479 ?auto_162484 ) ) ( not ( = ?auto_162476 ?auto_162480 ) ) ( not ( = ?auto_162476 ?auto_162482 ) ) ( not ( = ?auto_162476 ?auto_162481 ) ) ( not ( = ?auto_162476 ?auto_162484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162480 ?auto_162482 ?auto_162481 )
      ( MAKE-6CRATE-VERIFY ?auto_162477 ?auto_162478 ?auto_162479 ?auto_162476 ?auto_162480 ?auto_162482 ?auto_162481 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_162490 - SURFACE
      ?auto_162491 - SURFACE
      ?auto_162492 - SURFACE
      ?auto_162489 - SURFACE
      ?auto_162493 - SURFACE
      ?auto_162495 - SURFACE
      ?auto_162494 - SURFACE
      ?auto_162496 - SURFACE
    )
    :vars
    (
      ?auto_162501 - HOIST
      ?auto_162500 - PLACE
      ?auto_162499 - PLACE
      ?auto_162502 - HOIST
      ?auto_162498 - SURFACE
      ?auto_162497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162501 ?auto_162500 ) ( IS-CRATE ?auto_162496 ) ( not ( = ?auto_162494 ?auto_162496 ) ) ( not ( = ?auto_162495 ?auto_162494 ) ) ( not ( = ?auto_162495 ?auto_162496 ) ) ( not ( = ?auto_162499 ?auto_162500 ) ) ( HOIST-AT ?auto_162502 ?auto_162499 ) ( not ( = ?auto_162501 ?auto_162502 ) ) ( SURFACE-AT ?auto_162496 ?auto_162499 ) ( ON ?auto_162496 ?auto_162498 ) ( CLEAR ?auto_162496 ) ( not ( = ?auto_162494 ?auto_162498 ) ) ( not ( = ?auto_162496 ?auto_162498 ) ) ( not ( = ?auto_162495 ?auto_162498 ) ) ( SURFACE-AT ?auto_162495 ?auto_162500 ) ( CLEAR ?auto_162495 ) ( IS-CRATE ?auto_162494 ) ( AVAILABLE ?auto_162501 ) ( TRUCK-AT ?auto_162497 ?auto_162499 ) ( LIFTING ?auto_162502 ?auto_162494 ) ( ON ?auto_162491 ?auto_162490 ) ( ON ?auto_162492 ?auto_162491 ) ( ON ?auto_162489 ?auto_162492 ) ( ON ?auto_162493 ?auto_162489 ) ( ON ?auto_162495 ?auto_162493 ) ( not ( = ?auto_162490 ?auto_162491 ) ) ( not ( = ?auto_162490 ?auto_162492 ) ) ( not ( = ?auto_162490 ?auto_162489 ) ) ( not ( = ?auto_162490 ?auto_162493 ) ) ( not ( = ?auto_162490 ?auto_162495 ) ) ( not ( = ?auto_162490 ?auto_162494 ) ) ( not ( = ?auto_162490 ?auto_162496 ) ) ( not ( = ?auto_162490 ?auto_162498 ) ) ( not ( = ?auto_162491 ?auto_162492 ) ) ( not ( = ?auto_162491 ?auto_162489 ) ) ( not ( = ?auto_162491 ?auto_162493 ) ) ( not ( = ?auto_162491 ?auto_162495 ) ) ( not ( = ?auto_162491 ?auto_162494 ) ) ( not ( = ?auto_162491 ?auto_162496 ) ) ( not ( = ?auto_162491 ?auto_162498 ) ) ( not ( = ?auto_162492 ?auto_162489 ) ) ( not ( = ?auto_162492 ?auto_162493 ) ) ( not ( = ?auto_162492 ?auto_162495 ) ) ( not ( = ?auto_162492 ?auto_162494 ) ) ( not ( = ?auto_162492 ?auto_162496 ) ) ( not ( = ?auto_162492 ?auto_162498 ) ) ( not ( = ?auto_162489 ?auto_162493 ) ) ( not ( = ?auto_162489 ?auto_162495 ) ) ( not ( = ?auto_162489 ?auto_162494 ) ) ( not ( = ?auto_162489 ?auto_162496 ) ) ( not ( = ?auto_162489 ?auto_162498 ) ) ( not ( = ?auto_162493 ?auto_162495 ) ) ( not ( = ?auto_162493 ?auto_162494 ) ) ( not ( = ?auto_162493 ?auto_162496 ) ) ( not ( = ?auto_162493 ?auto_162498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162495 ?auto_162494 ?auto_162496 )
      ( MAKE-7CRATE-VERIFY ?auto_162490 ?auto_162491 ?auto_162492 ?auto_162489 ?auto_162493 ?auto_162495 ?auto_162494 ?auto_162496 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162504 - SURFACE
      ?auto_162505 - SURFACE
      ?auto_162506 - SURFACE
      ?auto_162503 - SURFACE
      ?auto_162507 - SURFACE
      ?auto_162509 - SURFACE
      ?auto_162508 - SURFACE
      ?auto_162510 - SURFACE
      ?auto_162511 - SURFACE
    )
    :vars
    (
      ?auto_162516 - HOIST
      ?auto_162515 - PLACE
      ?auto_162514 - PLACE
      ?auto_162517 - HOIST
      ?auto_162513 - SURFACE
      ?auto_162512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162516 ?auto_162515 ) ( IS-CRATE ?auto_162511 ) ( not ( = ?auto_162510 ?auto_162511 ) ) ( not ( = ?auto_162508 ?auto_162510 ) ) ( not ( = ?auto_162508 ?auto_162511 ) ) ( not ( = ?auto_162514 ?auto_162515 ) ) ( HOIST-AT ?auto_162517 ?auto_162514 ) ( not ( = ?auto_162516 ?auto_162517 ) ) ( SURFACE-AT ?auto_162511 ?auto_162514 ) ( ON ?auto_162511 ?auto_162513 ) ( CLEAR ?auto_162511 ) ( not ( = ?auto_162510 ?auto_162513 ) ) ( not ( = ?auto_162511 ?auto_162513 ) ) ( not ( = ?auto_162508 ?auto_162513 ) ) ( SURFACE-AT ?auto_162508 ?auto_162515 ) ( CLEAR ?auto_162508 ) ( IS-CRATE ?auto_162510 ) ( AVAILABLE ?auto_162516 ) ( TRUCK-AT ?auto_162512 ?auto_162514 ) ( LIFTING ?auto_162517 ?auto_162510 ) ( ON ?auto_162505 ?auto_162504 ) ( ON ?auto_162506 ?auto_162505 ) ( ON ?auto_162503 ?auto_162506 ) ( ON ?auto_162507 ?auto_162503 ) ( ON ?auto_162509 ?auto_162507 ) ( ON ?auto_162508 ?auto_162509 ) ( not ( = ?auto_162504 ?auto_162505 ) ) ( not ( = ?auto_162504 ?auto_162506 ) ) ( not ( = ?auto_162504 ?auto_162503 ) ) ( not ( = ?auto_162504 ?auto_162507 ) ) ( not ( = ?auto_162504 ?auto_162509 ) ) ( not ( = ?auto_162504 ?auto_162508 ) ) ( not ( = ?auto_162504 ?auto_162510 ) ) ( not ( = ?auto_162504 ?auto_162511 ) ) ( not ( = ?auto_162504 ?auto_162513 ) ) ( not ( = ?auto_162505 ?auto_162506 ) ) ( not ( = ?auto_162505 ?auto_162503 ) ) ( not ( = ?auto_162505 ?auto_162507 ) ) ( not ( = ?auto_162505 ?auto_162509 ) ) ( not ( = ?auto_162505 ?auto_162508 ) ) ( not ( = ?auto_162505 ?auto_162510 ) ) ( not ( = ?auto_162505 ?auto_162511 ) ) ( not ( = ?auto_162505 ?auto_162513 ) ) ( not ( = ?auto_162506 ?auto_162503 ) ) ( not ( = ?auto_162506 ?auto_162507 ) ) ( not ( = ?auto_162506 ?auto_162509 ) ) ( not ( = ?auto_162506 ?auto_162508 ) ) ( not ( = ?auto_162506 ?auto_162510 ) ) ( not ( = ?auto_162506 ?auto_162511 ) ) ( not ( = ?auto_162506 ?auto_162513 ) ) ( not ( = ?auto_162503 ?auto_162507 ) ) ( not ( = ?auto_162503 ?auto_162509 ) ) ( not ( = ?auto_162503 ?auto_162508 ) ) ( not ( = ?auto_162503 ?auto_162510 ) ) ( not ( = ?auto_162503 ?auto_162511 ) ) ( not ( = ?auto_162503 ?auto_162513 ) ) ( not ( = ?auto_162507 ?auto_162509 ) ) ( not ( = ?auto_162507 ?auto_162508 ) ) ( not ( = ?auto_162507 ?auto_162510 ) ) ( not ( = ?auto_162507 ?auto_162511 ) ) ( not ( = ?auto_162507 ?auto_162513 ) ) ( not ( = ?auto_162509 ?auto_162508 ) ) ( not ( = ?auto_162509 ?auto_162510 ) ) ( not ( = ?auto_162509 ?auto_162511 ) ) ( not ( = ?auto_162509 ?auto_162513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162508 ?auto_162510 ?auto_162511 )
      ( MAKE-8CRATE-VERIFY ?auto_162504 ?auto_162505 ?auto_162506 ?auto_162503 ?auto_162507 ?auto_162509 ?auto_162508 ?auto_162510 ?auto_162511 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_162562 - SURFACE
      ?auto_162563 - SURFACE
      ?auto_162564 - SURFACE
      ?auto_162561 - SURFACE
      ?auto_162565 - SURFACE
      ?auto_162566 - SURFACE
    )
    :vars
    (
      ?auto_162572 - HOIST
      ?auto_162568 - PLACE
      ?auto_162573 - PLACE
      ?auto_162571 - HOIST
      ?auto_162569 - SURFACE
      ?auto_162567 - TRUCK
      ?auto_162570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_162572 ?auto_162568 ) ( IS-CRATE ?auto_162566 ) ( not ( = ?auto_162565 ?auto_162566 ) ) ( not ( = ?auto_162561 ?auto_162565 ) ) ( not ( = ?auto_162561 ?auto_162566 ) ) ( not ( = ?auto_162573 ?auto_162568 ) ) ( HOIST-AT ?auto_162571 ?auto_162573 ) ( not ( = ?auto_162572 ?auto_162571 ) ) ( SURFACE-AT ?auto_162566 ?auto_162573 ) ( ON ?auto_162566 ?auto_162569 ) ( CLEAR ?auto_162566 ) ( not ( = ?auto_162565 ?auto_162569 ) ) ( not ( = ?auto_162566 ?auto_162569 ) ) ( not ( = ?auto_162561 ?auto_162569 ) ) ( SURFACE-AT ?auto_162561 ?auto_162568 ) ( CLEAR ?auto_162561 ) ( IS-CRATE ?auto_162565 ) ( AVAILABLE ?auto_162572 ) ( TRUCK-AT ?auto_162567 ?auto_162573 ) ( AVAILABLE ?auto_162571 ) ( SURFACE-AT ?auto_162565 ?auto_162573 ) ( ON ?auto_162565 ?auto_162570 ) ( CLEAR ?auto_162565 ) ( not ( = ?auto_162565 ?auto_162570 ) ) ( not ( = ?auto_162566 ?auto_162570 ) ) ( not ( = ?auto_162561 ?auto_162570 ) ) ( not ( = ?auto_162569 ?auto_162570 ) ) ( ON ?auto_162563 ?auto_162562 ) ( ON ?auto_162564 ?auto_162563 ) ( ON ?auto_162561 ?auto_162564 ) ( not ( = ?auto_162562 ?auto_162563 ) ) ( not ( = ?auto_162562 ?auto_162564 ) ) ( not ( = ?auto_162562 ?auto_162561 ) ) ( not ( = ?auto_162562 ?auto_162565 ) ) ( not ( = ?auto_162562 ?auto_162566 ) ) ( not ( = ?auto_162562 ?auto_162569 ) ) ( not ( = ?auto_162562 ?auto_162570 ) ) ( not ( = ?auto_162563 ?auto_162564 ) ) ( not ( = ?auto_162563 ?auto_162561 ) ) ( not ( = ?auto_162563 ?auto_162565 ) ) ( not ( = ?auto_162563 ?auto_162566 ) ) ( not ( = ?auto_162563 ?auto_162569 ) ) ( not ( = ?auto_162563 ?auto_162570 ) ) ( not ( = ?auto_162564 ?auto_162561 ) ) ( not ( = ?auto_162564 ?auto_162565 ) ) ( not ( = ?auto_162564 ?auto_162566 ) ) ( not ( = ?auto_162564 ?auto_162569 ) ) ( not ( = ?auto_162564 ?auto_162570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162561 ?auto_162565 ?auto_162566 )
      ( MAKE-5CRATE-VERIFY ?auto_162562 ?auto_162563 ?auto_162564 ?auto_162561 ?auto_162565 ?auto_162566 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_162575 - SURFACE
      ?auto_162576 - SURFACE
      ?auto_162577 - SURFACE
      ?auto_162574 - SURFACE
      ?auto_162578 - SURFACE
      ?auto_162580 - SURFACE
      ?auto_162579 - SURFACE
    )
    :vars
    (
      ?auto_162586 - HOIST
      ?auto_162582 - PLACE
      ?auto_162587 - PLACE
      ?auto_162585 - HOIST
      ?auto_162583 - SURFACE
      ?auto_162581 - TRUCK
      ?auto_162584 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_162586 ?auto_162582 ) ( IS-CRATE ?auto_162579 ) ( not ( = ?auto_162580 ?auto_162579 ) ) ( not ( = ?auto_162578 ?auto_162580 ) ) ( not ( = ?auto_162578 ?auto_162579 ) ) ( not ( = ?auto_162587 ?auto_162582 ) ) ( HOIST-AT ?auto_162585 ?auto_162587 ) ( not ( = ?auto_162586 ?auto_162585 ) ) ( SURFACE-AT ?auto_162579 ?auto_162587 ) ( ON ?auto_162579 ?auto_162583 ) ( CLEAR ?auto_162579 ) ( not ( = ?auto_162580 ?auto_162583 ) ) ( not ( = ?auto_162579 ?auto_162583 ) ) ( not ( = ?auto_162578 ?auto_162583 ) ) ( SURFACE-AT ?auto_162578 ?auto_162582 ) ( CLEAR ?auto_162578 ) ( IS-CRATE ?auto_162580 ) ( AVAILABLE ?auto_162586 ) ( TRUCK-AT ?auto_162581 ?auto_162587 ) ( AVAILABLE ?auto_162585 ) ( SURFACE-AT ?auto_162580 ?auto_162587 ) ( ON ?auto_162580 ?auto_162584 ) ( CLEAR ?auto_162580 ) ( not ( = ?auto_162580 ?auto_162584 ) ) ( not ( = ?auto_162579 ?auto_162584 ) ) ( not ( = ?auto_162578 ?auto_162584 ) ) ( not ( = ?auto_162583 ?auto_162584 ) ) ( ON ?auto_162576 ?auto_162575 ) ( ON ?auto_162577 ?auto_162576 ) ( ON ?auto_162574 ?auto_162577 ) ( ON ?auto_162578 ?auto_162574 ) ( not ( = ?auto_162575 ?auto_162576 ) ) ( not ( = ?auto_162575 ?auto_162577 ) ) ( not ( = ?auto_162575 ?auto_162574 ) ) ( not ( = ?auto_162575 ?auto_162578 ) ) ( not ( = ?auto_162575 ?auto_162580 ) ) ( not ( = ?auto_162575 ?auto_162579 ) ) ( not ( = ?auto_162575 ?auto_162583 ) ) ( not ( = ?auto_162575 ?auto_162584 ) ) ( not ( = ?auto_162576 ?auto_162577 ) ) ( not ( = ?auto_162576 ?auto_162574 ) ) ( not ( = ?auto_162576 ?auto_162578 ) ) ( not ( = ?auto_162576 ?auto_162580 ) ) ( not ( = ?auto_162576 ?auto_162579 ) ) ( not ( = ?auto_162576 ?auto_162583 ) ) ( not ( = ?auto_162576 ?auto_162584 ) ) ( not ( = ?auto_162577 ?auto_162574 ) ) ( not ( = ?auto_162577 ?auto_162578 ) ) ( not ( = ?auto_162577 ?auto_162580 ) ) ( not ( = ?auto_162577 ?auto_162579 ) ) ( not ( = ?auto_162577 ?auto_162583 ) ) ( not ( = ?auto_162577 ?auto_162584 ) ) ( not ( = ?auto_162574 ?auto_162578 ) ) ( not ( = ?auto_162574 ?auto_162580 ) ) ( not ( = ?auto_162574 ?auto_162579 ) ) ( not ( = ?auto_162574 ?auto_162583 ) ) ( not ( = ?auto_162574 ?auto_162584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162578 ?auto_162580 ?auto_162579 )
      ( MAKE-6CRATE-VERIFY ?auto_162575 ?auto_162576 ?auto_162577 ?auto_162574 ?auto_162578 ?auto_162580 ?auto_162579 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_162589 - SURFACE
      ?auto_162590 - SURFACE
      ?auto_162591 - SURFACE
      ?auto_162588 - SURFACE
      ?auto_162592 - SURFACE
      ?auto_162594 - SURFACE
      ?auto_162593 - SURFACE
      ?auto_162595 - SURFACE
    )
    :vars
    (
      ?auto_162601 - HOIST
      ?auto_162597 - PLACE
      ?auto_162602 - PLACE
      ?auto_162600 - HOIST
      ?auto_162598 - SURFACE
      ?auto_162596 - TRUCK
      ?auto_162599 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_162601 ?auto_162597 ) ( IS-CRATE ?auto_162595 ) ( not ( = ?auto_162593 ?auto_162595 ) ) ( not ( = ?auto_162594 ?auto_162593 ) ) ( not ( = ?auto_162594 ?auto_162595 ) ) ( not ( = ?auto_162602 ?auto_162597 ) ) ( HOIST-AT ?auto_162600 ?auto_162602 ) ( not ( = ?auto_162601 ?auto_162600 ) ) ( SURFACE-AT ?auto_162595 ?auto_162602 ) ( ON ?auto_162595 ?auto_162598 ) ( CLEAR ?auto_162595 ) ( not ( = ?auto_162593 ?auto_162598 ) ) ( not ( = ?auto_162595 ?auto_162598 ) ) ( not ( = ?auto_162594 ?auto_162598 ) ) ( SURFACE-AT ?auto_162594 ?auto_162597 ) ( CLEAR ?auto_162594 ) ( IS-CRATE ?auto_162593 ) ( AVAILABLE ?auto_162601 ) ( TRUCK-AT ?auto_162596 ?auto_162602 ) ( AVAILABLE ?auto_162600 ) ( SURFACE-AT ?auto_162593 ?auto_162602 ) ( ON ?auto_162593 ?auto_162599 ) ( CLEAR ?auto_162593 ) ( not ( = ?auto_162593 ?auto_162599 ) ) ( not ( = ?auto_162595 ?auto_162599 ) ) ( not ( = ?auto_162594 ?auto_162599 ) ) ( not ( = ?auto_162598 ?auto_162599 ) ) ( ON ?auto_162590 ?auto_162589 ) ( ON ?auto_162591 ?auto_162590 ) ( ON ?auto_162588 ?auto_162591 ) ( ON ?auto_162592 ?auto_162588 ) ( ON ?auto_162594 ?auto_162592 ) ( not ( = ?auto_162589 ?auto_162590 ) ) ( not ( = ?auto_162589 ?auto_162591 ) ) ( not ( = ?auto_162589 ?auto_162588 ) ) ( not ( = ?auto_162589 ?auto_162592 ) ) ( not ( = ?auto_162589 ?auto_162594 ) ) ( not ( = ?auto_162589 ?auto_162593 ) ) ( not ( = ?auto_162589 ?auto_162595 ) ) ( not ( = ?auto_162589 ?auto_162598 ) ) ( not ( = ?auto_162589 ?auto_162599 ) ) ( not ( = ?auto_162590 ?auto_162591 ) ) ( not ( = ?auto_162590 ?auto_162588 ) ) ( not ( = ?auto_162590 ?auto_162592 ) ) ( not ( = ?auto_162590 ?auto_162594 ) ) ( not ( = ?auto_162590 ?auto_162593 ) ) ( not ( = ?auto_162590 ?auto_162595 ) ) ( not ( = ?auto_162590 ?auto_162598 ) ) ( not ( = ?auto_162590 ?auto_162599 ) ) ( not ( = ?auto_162591 ?auto_162588 ) ) ( not ( = ?auto_162591 ?auto_162592 ) ) ( not ( = ?auto_162591 ?auto_162594 ) ) ( not ( = ?auto_162591 ?auto_162593 ) ) ( not ( = ?auto_162591 ?auto_162595 ) ) ( not ( = ?auto_162591 ?auto_162598 ) ) ( not ( = ?auto_162591 ?auto_162599 ) ) ( not ( = ?auto_162588 ?auto_162592 ) ) ( not ( = ?auto_162588 ?auto_162594 ) ) ( not ( = ?auto_162588 ?auto_162593 ) ) ( not ( = ?auto_162588 ?auto_162595 ) ) ( not ( = ?auto_162588 ?auto_162598 ) ) ( not ( = ?auto_162588 ?auto_162599 ) ) ( not ( = ?auto_162592 ?auto_162594 ) ) ( not ( = ?auto_162592 ?auto_162593 ) ) ( not ( = ?auto_162592 ?auto_162595 ) ) ( not ( = ?auto_162592 ?auto_162598 ) ) ( not ( = ?auto_162592 ?auto_162599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162594 ?auto_162593 ?auto_162595 )
      ( MAKE-7CRATE-VERIFY ?auto_162589 ?auto_162590 ?auto_162591 ?auto_162588 ?auto_162592 ?auto_162594 ?auto_162593 ?auto_162595 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162604 - SURFACE
      ?auto_162605 - SURFACE
      ?auto_162606 - SURFACE
      ?auto_162603 - SURFACE
      ?auto_162607 - SURFACE
      ?auto_162609 - SURFACE
      ?auto_162608 - SURFACE
      ?auto_162610 - SURFACE
      ?auto_162611 - SURFACE
    )
    :vars
    (
      ?auto_162617 - HOIST
      ?auto_162613 - PLACE
      ?auto_162618 - PLACE
      ?auto_162616 - HOIST
      ?auto_162614 - SURFACE
      ?auto_162612 - TRUCK
      ?auto_162615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_162617 ?auto_162613 ) ( IS-CRATE ?auto_162611 ) ( not ( = ?auto_162610 ?auto_162611 ) ) ( not ( = ?auto_162608 ?auto_162610 ) ) ( not ( = ?auto_162608 ?auto_162611 ) ) ( not ( = ?auto_162618 ?auto_162613 ) ) ( HOIST-AT ?auto_162616 ?auto_162618 ) ( not ( = ?auto_162617 ?auto_162616 ) ) ( SURFACE-AT ?auto_162611 ?auto_162618 ) ( ON ?auto_162611 ?auto_162614 ) ( CLEAR ?auto_162611 ) ( not ( = ?auto_162610 ?auto_162614 ) ) ( not ( = ?auto_162611 ?auto_162614 ) ) ( not ( = ?auto_162608 ?auto_162614 ) ) ( SURFACE-AT ?auto_162608 ?auto_162613 ) ( CLEAR ?auto_162608 ) ( IS-CRATE ?auto_162610 ) ( AVAILABLE ?auto_162617 ) ( TRUCK-AT ?auto_162612 ?auto_162618 ) ( AVAILABLE ?auto_162616 ) ( SURFACE-AT ?auto_162610 ?auto_162618 ) ( ON ?auto_162610 ?auto_162615 ) ( CLEAR ?auto_162610 ) ( not ( = ?auto_162610 ?auto_162615 ) ) ( not ( = ?auto_162611 ?auto_162615 ) ) ( not ( = ?auto_162608 ?auto_162615 ) ) ( not ( = ?auto_162614 ?auto_162615 ) ) ( ON ?auto_162605 ?auto_162604 ) ( ON ?auto_162606 ?auto_162605 ) ( ON ?auto_162603 ?auto_162606 ) ( ON ?auto_162607 ?auto_162603 ) ( ON ?auto_162609 ?auto_162607 ) ( ON ?auto_162608 ?auto_162609 ) ( not ( = ?auto_162604 ?auto_162605 ) ) ( not ( = ?auto_162604 ?auto_162606 ) ) ( not ( = ?auto_162604 ?auto_162603 ) ) ( not ( = ?auto_162604 ?auto_162607 ) ) ( not ( = ?auto_162604 ?auto_162609 ) ) ( not ( = ?auto_162604 ?auto_162608 ) ) ( not ( = ?auto_162604 ?auto_162610 ) ) ( not ( = ?auto_162604 ?auto_162611 ) ) ( not ( = ?auto_162604 ?auto_162614 ) ) ( not ( = ?auto_162604 ?auto_162615 ) ) ( not ( = ?auto_162605 ?auto_162606 ) ) ( not ( = ?auto_162605 ?auto_162603 ) ) ( not ( = ?auto_162605 ?auto_162607 ) ) ( not ( = ?auto_162605 ?auto_162609 ) ) ( not ( = ?auto_162605 ?auto_162608 ) ) ( not ( = ?auto_162605 ?auto_162610 ) ) ( not ( = ?auto_162605 ?auto_162611 ) ) ( not ( = ?auto_162605 ?auto_162614 ) ) ( not ( = ?auto_162605 ?auto_162615 ) ) ( not ( = ?auto_162606 ?auto_162603 ) ) ( not ( = ?auto_162606 ?auto_162607 ) ) ( not ( = ?auto_162606 ?auto_162609 ) ) ( not ( = ?auto_162606 ?auto_162608 ) ) ( not ( = ?auto_162606 ?auto_162610 ) ) ( not ( = ?auto_162606 ?auto_162611 ) ) ( not ( = ?auto_162606 ?auto_162614 ) ) ( not ( = ?auto_162606 ?auto_162615 ) ) ( not ( = ?auto_162603 ?auto_162607 ) ) ( not ( = ?auto_162603 ?auto_162609 ) ) ( not ( = ?auto_162603 ?auto_162608 ) ) ( not ( = ?auto_162603 ?auto_162610 ) ) ( not ( = ?auto_162603 ?auto_162611 ) ) ( not ( = ?auto_162603 ?auto_162614 ) ) ( not ( = ?auto_162603 ?auto_162615 ) ) ( not ( = ?auto_162607 ?auto_162609 ) ) ( not ( = ?auto_162607 ?auto_162608 ) ) ( not ( = ?auto_162607 ?auto_162610 ) ) ( not ( = ?auto_162607 ?auto_162611 ) ) ( not ( = ?auto_162607 ?auto_162614 ) ) ( not ( = ?auto_162607 ?auto_162615 ) ) ( not ( = ?auto_162609 ?auto_162608 ) ) ( not ( = ?auto_162609 ?auto_162610 ) ) ( not ( = ?auto_162609 ?auto_162611 ) ) ( not ( = ?auto_162609 ?auto_162614 ) ) ( not ( = ?auto_162609 ?auto_162615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162608 ?auto_162610 ?auto_162611 )
      ( MAKE-8CRATE-VERIFY ?auto_162604 ?auto_162605 ?auto_162606 ?auto_162603 ?auto_162607 ?auto_162609 ?auto_162608 ?auto_162610 ?auto_162611 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_162663 - SURFACE
      ?auto_162664 - SURFACE
      ?auto_162665 - SURFACE
      ?auto_162662 - SURFACE
      ?auto_162666 - SURFACE
      ?auto_162667 - SURFACE
    )
    :vars
    (
      ?auto_162672 - HOIST
      ?auto_162671 - PLACE
      ?auto_162668 - PLACE
      ?auto_162670 - HOIST
      ?auto_162669 - SURFACE
      ?auto_162673 - SURFACE
      ?auto_162674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162672 ?auto_162671 ) ( IS-CRATE ?auto_162667 ) ( not ( = ?auto_162666 ?auto_162667 ) ) ( not ( = ?auto_162662 ?auto_162666 ) ) ( not ( = ?auto_162662 ?auto_162667 ) ) ( not ( = ?auto_162668 ?auto_162671 ) ) ( HOIST-AT ?auto_162670 ?auto_162668 ) ( not ( = ?auto_162672 ?auto_162670 ) ) ( SURFACE-AT ?auto_162667 ?auto_162668 ) ( ON ?auto_162667 ?auto_162669 ) ( CLEAR ?auto_162667 ) ( not ( = ?auto_162666 ?auto_162669 ) ) ( not ( = ?auto_162667 ?auto_162669 ) ) ( not ( = ?auto_162662 ?auto_162669 ) ) ( SURFACE-AT ?auto_162662 ?auto_162671 ) ( CLEAR ?auto_162662 ) ( IS-CRATE ?auto_162666 ) ( AVAILABLE ?auto_162672 ) ( AVAILABLE ?auto_162670 ) ( SURFACE-AT ?auto_162666 ?auto_162668 ) ( ON ?auto_162666 ?auto_162673 ) ( CLEAR ?auto_162666 ) ( not ( = ?auto_162666 ?auto_162673 ) ) ( not ( = ?auto_162667 ?auto_162673 ) ) ( not ( = ?auto_162662 ?auto_162673 ) ) ( not ( = ?auto_162669 ?auto_162673 ) ) ( TRUCK-AT ?auto_162674 ?auto_162671 ) ( ON ?auto_162664 ?auto_162663 ) ( ON ?auto_162665 ?auto_162664 ) ( ON ?auto_162662 ?auto_162665 ) ( not ( = ?auto_162663 ?auto_162664 ) ) ( not ( = ?auto_162663 ?auto_162665 ) ) ( not ( = ?auto_162663 ?auto_162662 ) ) ( not ( = ?auto_162663 ?auto_162666 ) ) ( not ( = ?auto_162663 ?auto_162667 ) ) ( not ( = ?auto_162663 ?auto_162669 ) ) ( not ( = ?auto_162663 ?auto_162673 ) ) ( not ( = ?auto_162664 ?auto_162665 ) ) ( not ( = ?auto_162664 ?auto_162662 ) ) ( not ( = ?auto_162664 ?auto_162666 ) ) ( not ( = ?auto_162664 ?auto_162667 ) ) ( not ( = ?auto_162664 ?auto_162669 ) ) ( not ( = ?auto_162664 ?auto_162673 ) ) ( not ( = ?auto_162665 ?auto_162662 ) ) ( not ( = ?auto_162665 ?auto_162666 ) ) ( not ( = ?auto_162665 ?auto_162667 ) ) ( not ( = ?auto_162665 ?auto_162669 ) ) ( not ( = ?auto_162665 ?auto_162673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162662 ?auto_162666 ?auto_162667 )
      ( MAKE-5CRATE-VERIFY ?auto_162663 ?auto_162664 ?auto_162665 ?auto_162662 ?auto_162666 ?auto_162667 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_162676 - SURFACE
      ?auto_162677 - SURFACE
      ?auto_162678 - SURFACE
      ?auto_162675 - SURFACE
      ?auto_162679 - SURFACE
      ?auto_162681 - SURFACE
      ?auto_162680 - SURFACE
    )
    :vars
    (
      ?auto_162686 - HOIST
      ?auto_162685 - PLACE
      ?auto_162682 - PLACE
      ?auto_162684 - HOIST
      ?auto_162683 - SURFACE
      ?auto_162687 - SURFACE
      ?auto_162688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162686 ?auto_162685 ) ( IS-CRATE ?auto_162680 ) ( not ( = ?auto_162681 ?auto_162680 ) ) ( not ( = ?auto_162679 ?auto_162681 ) ) ( not ( = ?auto_162679 ?auto_162680 ) ) ( not ( = ?auto_162682 ?auto_162685 ) ) ( HOIST-AT ?auto_162684 ?auto_162682 ) ( not ( = ?auto_162686 ?auto_162684 ) ) ( SURFACE-AT ?auto_162680 ?auto_162682 ) ( ON ?auto_162680 ?auto_162683 ) ( CLEAR ?auto_162680 ) ( not ( = ?auto_162681 ?auto_162683 ) ) ( not ( = ?auto_162680 ?auto_162683 ) ) ( not ( = ?auto_162679 ?auto_162683 ) ) ( SURFACE-AT ?auto_162679 ?auto_162685 ) ( CLEAR ?auto_162679 ) ( IS-CRATE ?auto_162681 ) ( AVAILABLE ?auto_162686 ) ( AVAILABLE ?auto_162684 ) ( SURFACE-AT ?auto_162681 ?auto_162682 ) ( ON ?auto_162681 ?auto_162687 ) ( CLEAR ?auto_162681 ) ( not ( = ?auto_162681 ?auto_162687 ) ) ( not ( = ?auto_162680 ?auto_162687 ) ) ( not ( = ?auto_162679 ?auto_162687 ) ) ( not ( = ?auto_162683 ?auto_162687 ) ) ( TRUCK-AT ?auto_162688 ?auto_162685 ) ( ON ?auto_162677 ?auto_162676 ) ( ON ?auto_162678 ?auto_162677 ) ( ON ?auto_162675 ?auto_162678 ) ( ON ?auto_162679 ?auto_162675 ) ( not ( = ?auto_162676 ?auto_162677 ) ) ( not ( = ?auto_162676 ?auto_162678 ) ) ( not ( = ?auto_162676 ?auto_162675 ) ) ( not ( = ?auto_162676 ?auto_162679 ) ) ( not ( = ?auto_162676 ?auto_162681 ) ) ( not ( = ?auto_162676 ?auto_162680 ) ) ( not ( = ?auto_162676 ?auto_162683 ) ) ( not ( = ?auto_162676 ?auto_162687 ) ) ( not ( = ?auto_162677 ?auto_162678 ) ) ( not ( = ?auto_162677 ?auto_162675 ) ) ( not ( = ?auto_162677 ?auto_162679 ) ) ( not ( = ?auto_162677 ?auto_162681 ) ) ( not ( = ?auto_162677 ?auto_162680 ) ) ( not ( = ?auto_162677 ?auto_162683 ) ) ( not ( = ?auto_162677 ?auto_162687 ) ) ( not ( = ?auto_162678 ?auto_162675 ) ) ( not ( = ?auto_162678 ?auto_162679 ) ) ( not ( = ?auto_162678 ?auto_162681 ) ) ( not ( = ?auto_162678 ?auto_162680 ) ) ( not ( = ?auto_162678 ?auto_162683 ) ) ( not ( = ?auto_162678 ?auto_162687 ) ) ( not ( = ?auto_162675 ?auto_162679 ) ) ( not ( = ?auto_162675 ?auto_162681 ) ) ( not ( = ?auto_162675 ?auto_162680 ) ) ( not ( = ?auto_162675 ?auto_162683 ) ) ( not ( = ?auto_162675 ?auto_162687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162679 ?auto_162681 ?auto_162680 )
      ( MAKE-6CRATE-VERIFY ?auto_162676 ?auto_162677 ?auto_162678 ?auto_162675 ?auto_162679 ?auto_162681 ?auto_162680 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_162690 - SURFACE
      ?auto_162691 - SURFACE
      ?auto_162692 - SURFACE
      ?auto_162689 - SURFACE
      ?auto_162693 - SURFACE
      ?auto_162695 - SURFACE
      ?auto_162694 - SURFACE
      ?auto_162696 - SURFACE
    )
    :vars
    (
      ?auto_162701 - HOIST
      ?auto_162700 - PLACE
      ?auto_162697 - PLACE
      ?auto_162699 - HOIST
      ?auto_162698 - SURFACE
      ?auto_162702 - SURFACE
      ?auto_162703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162701 ?auto_162700 ) ( IS-CRATE ?auto_162696 ) ( not ( = ?auto_162694 ?auto_162696 ) ) ( not ( = ?auto_162695 ?auto_162694 ) ) ( not ( = ?auto_162695 ?auto_162696 ) ) ( not ( = ?auto_162697 ?auto_162700 ) ) ( HOIST-AT ?auto_162699 ?auto_162697 ) ( not ( = ?auto_162701 ?auto_162699 ) ) ( SURFACE-AT ?auto_162696 ?auto_162697 ) ( ON ?auto_162696 ?auto_162698 ) ( CLEAR ?auto_162696 ) ( not ( = ?auto_162694 ?auto_162698 ) ) ( not ( = ?auto_162696 ?auto_162698 ) ) ( not ( = ?auto_162695 ?auto_162698 ) ) ( SURFACE-AT ?auto_162695 ?auto_162700 ) ( CLEAR ?auto_162695 ) ( IS-CRATE ?auto_162694 ) ( AVAILABLE ?auto_162701 ) ( AVAILABLE ?auto_162699 ) ( SURFACE-AT ?auto_162694 ?auto_162697 ) ( ON ?auto_162694 ?auto_162702 ) ( CLEAR ?auto_162694 ) ( not ( = ?auto_162694 ?auto_162702 ) ) ( not ( = ?auto_162696 ?auto_162702 ) ) ( not ( = ?auto_162695 ?auto_162702 ) ) ( not ( = ?auto_162698 ?auto_162702 ) ) ( TRUCK-AT ?auto_162703 ?auto_162700 ) ( ON ?auto_162691 ?auto_162690 ) ( ON ?auto_162692 ?auto_162691 ) ( ON ?auto_162689 ?auto_162692 ) ( ON ?auto_162693 ?auto_162689 ) ( ON ?auto_162695 ?auto_162693 ) ( not ( = ?auto_162690 ?auto_162691 ) ) ( not ( = ?auto_162690 ?auto_162692 ) ) ( not ( = ?auto_162690 ?auto_162689 ) ) ( not ( = ?auto_162690 ?auto_162693 ) ) ( not ( = ?auto_162690 ?auto_162695 ) ) ( not ( = ?auto_162690 ?auto_162694 ) ) ( not ( = ?auto_162690 ?auto_162696 ) ) ( not ( = ?auto_162690 ?auto_162698 ) ) ( not ( = ?auto_162690 ?auto_162702 ) ) ( not ( = ?auto_162691 ?auto_162692 ) ) ( not ( = ?auto_162691 ?auto_162689 ) ) ( not ( = ?auto_162691 ?auto_162693 ) ) ( not ( = ?auto_162691 ?auto_162695 ) ) ( not ( = ?auto_162691 ?auto_162694 ) ) ( not ( = ?auto_162691 ?auto_162696 ) ) ( not ( = ?auto_162691 ?auto_162698 ) ) ( not ( = ?auto_162691 ?auto_162702 ) ) ( not ( = ?auto_162692 ?auto_162689 ) ) ( not ( = ?auto_162692 ?auto_162693 ) ) ( not ( = ?auto_162692 ?auto_162695 ) ) ( not ( = ?auto_162692 ?auto_162694 ) ) ( not ( = ?auto_162692 ?auto_162696 ) ) ( not ( = ?auto_162692 ?auto_162698 ) ) ( not ( = ?auto_162692 ?auto_162702 ) ) ( not ( = ?auto_162689 ?auto_162693 ) ) ( not ( = ?auto_162689 ?auto_162695 ) ) ( not ( = ?auto_162689 ?auto_162694 ) ) ( not ( = ?auto_162689 ?auto_162696 ) ) ( not ( = ?auto_162689 ?auto_162698 ) ) ( not ( = ?auto_162689 ?auto_162702 ) ) ( not ( = ?auto_162693 ?auto_162695 ) ) ( not ( = ?auto_162693 ?auto_162694 ) ) ( not ( = ?auto_162693 ?auto_162696 ) ) ( not ( = ?auto_162693 ?auto_162698 ) ) ( not ( = ?auto_162693 ?auto_162702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162695 ?auto_162694 ?auto_162696 )
      ( MAKE-7CRATE-VERIFY ?auto_162690 ?auto_162691 ?auto_162692 ?auto_162689 ?auto_162693 ?auto_162695 ?auto_162694 ?auto_162696 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162705 - SURFACE
      ?auto_162706 - SURFACE
      ?auto_162707 - SURFACE
      ?auto_162704 - SURFACE
      ?auto_162708 - SURFACE
      ?auto_162710 - SURFACE
      ?auto_162709 - SURFACE
      ?auto_162711 - SURFACE
      ?auto_162712 - SURFACE
    )
    :vars
    (
      ?auto_162717 - HOIST
      ?auto_162716 - PLACE
      ?auto_162713 - PLACE
      ?auto_162715 - HOIST
      ?auto_162714 - SURFACE
      ?auto_162718 - SURFACE
      ?auto_162719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162717 ?auto_162716 ) ( IS-CRATE ?auto_162712 ) ( not ( = ?auto_162711 ?auto_162712 ) ) ( not ( = ?auto_162709 ?auto_162711 ) ) ( not ( = ?auto_162709 ?auto_162712 ) ) ( not ( = ?auto_162713 ?auto_162716 ) ) ( HOIST-AT ?auto_162715 ?auto_162713 ) ( not ( = ?auto_162717 ?auto_162715 ) ) ( SURFACE-AT ?auto_162712 ?auto_162713 ) ( ON ?auto_162712 ?auto_162714 ) ( CLEAR ?auto_162712 ) ( not ( = ?auto_162711 ?auto_162714 ) ) ( not ( = ?auto_162712 ?auto_162714 ) ) ( not ( = ?auto_162709 ?auto_162714 ) ) ( SURFACE-AT ?auto_162709 ?auto_162716 ) ( CLEAR ?auto_162709 ) ( IS-CRATE ?auto_162711 ) ( AVAILABLE ?auto_162717 ) ( AVAILABLE ?auto_162715 ) ( SURFACE-AT ?auto_162711 ?auto_162713 ) ( ON ?auto_162711 ?auto_162718 ) ( CLEAR ?auto_162711 ) ( not ( = ?auto_162711 ?auto_162718 ) ) ( not ( = ?auto_162712 ?auto_162718 ) ) ( not ( = ?auto_162709 ?auto_162718 ) ) ( not ( = ?auto_162714 ?auto_162718 ) ) ( TRUCK-AT ?auto_162719 ?auto_162716 ) ( ON ?auto_162706 ?auto_162705 ) ( ON ?auto_162707 ?auto_162706 ) ( ON ?auto_162704 ?auto_162707 ) ( ON ?auto_162708 ?auto_162704 ) ( ON ?auto_162710 ?auto_162708 ) ( ON ?auto_162709 ?auto_162710 ) ( not ( = ?auto_162705 ?auto_162706 ) ) ( not ( = ?auto_162705 ?auto_162707 ) ) ( not ( = ?auto_162705 ?auto_162704 ) ) ( not ( = ?auto_162705 ?auto_162708 ) ) ( not ( = ?auto_162705 ?auto_162710 ) ) ( not ( = ?auto_162705 ?auto_162709 ) ) ( not ( = ?auto_162705 ?auto_162711 ) ) ( not ( = ?auto_162705 ?auto_162712 ) ) ( not ( = ?auto_162705 ?auto_162714 ) ) ( not ( = ?auto_162705 ?auto_162718 ) ) ( not ( = ?auto_162706 ?auto_162707 ) ) ( not ( = ?auto_162706 ?auto_162704 ) ) ( not ( = ?auto_162706 ?auto_162708 ) ) ( not ( = ?auto_162706 ?auto_162710 ) ) ( not ( = ?auto_162706 ?auto_162709 ) ) ( not ( = ?auto_162706 ?auto_162711 ) ) ( not ( = ?auto_162706 ?auto_162712 ) ) ( not ( = ?auto_162706 ?auto_162714 ) ) ( not ( = ?auto_162706 ?auto_162718 ) ) ( not ( = ?auto_162707 ?auto_162704 ) ) ( not ( = ?auto_162707 ?auto_162708 ) ) ( not ( = ?auto_162707 ?auto_162710 ) ) ( not ( = ?auto_162707 ?auto_162709 ) ) ( not ( = ?auto_162707 ?auto_162711 ) ) ( not ( = ?auto_162707 ?auto_162712 ) ) ( not ( = ?auto_162707 ?auto_162714 ) ) ( not ( = ?auto_162707 ?auto_162718 ) ) ( not ( = ?auto_162704 ?auto_162708 ) ) ( not ( = ?auto_162704 ?auto_162710 ) ) ( not ( = ?auto_162704 ?auto_162709 ) ) ( not ( = ?auto_162704 ?auto_162711 ) ) ( not ( = ?auto_162704 ?auto_162712 ) ) ( not ( = ?auto_162704 ?auto_162714 ) ) ( not ( = ?auto_162704 ?auto_162718 ) ) ( not ( = ?auto_162708 ?auto_162710 ) ) ( not ( = ?auto_162708 ?auto_162709 ) ) ( not ( = ?auto_162708 ?auto_162711 ) ) ( not ( = ?auto_162708 ?auto_162712 ) ) ( not ( = ?auto_162708 ?auto_162714 ) ) ( not ( = ?auto_162708 ?auto_162718 ) ) ( not ( = ?auto_162710 ?auto_162709 ) ) ( not ( = ?auto_162710 ?auto_162711 ) ) ( not ( = ?auto_162710 ?auto_162712 ) ) ( not ( = ?auto_162710 ?auto_162714 ) ) ( not ( = ?auto_162710 ?auto_162718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162709 ?auto_162711 ?auto_162712 )
      ( MAKE-8CRATE-VERIFY ?auto_162705 ?auto_162706 ?auto_162707 ?auto_162704 ?auto_162708 ?auto_162710 ?auto_162709 ?auto_162711 ?auto_162712 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_162766 - SURFACE
      ?auto_162767 - SURFACE
      ?auto_162768 - SURFACE
      ?auto_162765 - SURFACE
      ?auto_162769 - SURFACE
      ?auto_162770 - SURFACE
    )
    :vars
    (
      ?auto_162771 - HOIST
      ?auto_162776 - PLACE
      ?auto_162773 - PLACE
      ?auto_162777 - HOIST
      ?auto_162775 - SURFACE
      ?auto_162772 - SURFACE
      ?auto_162774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162771 ?auto_162776 ) ( IS-CRATE ?auto_162770 ) ( not ( = ?auto_162769 ?auto_162770 ) ) ( not ( = ?auto_162765 ?auto_162769 ) ) ( not ( = ?auto_162765 ?auto_162770 ) ) ( not ( = ?auto_162773 ?auto_162776 ) ) ( HOIST-AT ?auto_162777 ?auto_162773 ) ( not ( = ?auto_162771 ?auto_162777 ) ) ( SURFACE-AT ?auto_162770 ?auto_162773 ) ( ON ?auto_162770 ?auto_162775 ) ( CLEAR ?auto_162770 ) ( not ( = ?auto_162769 ?auto_162775 ) ) ( not ( = ?auto_162770 ?auto_162775 ) ) ( not ( = ?auto_162765 ?auto_162775 ) ) ( IS-CRATE ?auto_162769 ) ( AVAILABLE ?auto_162777 ) ( SURFACE-AT ?auto_162769 ?auto_162773 ) ( ON ?auto_162769 ?auto_162772 ) ( CLEAR ?auto_162769 ) ( not ( = ?auto_162769 ?auto_162772 ) ) ( not ( = ?auto_162770 ?auto_162772 ) ) ( not ( = ?auto_162765 ?auto_162772 ) ) ( not ( = ?auto_162775 ?auto_162772 ) ) ( TRUCK-AT ?auto_162774 ?auto_162776 ) ( SURFACE-AT ?auto_162768 ?auto_162776 ) ( CLEAR ?auto_162768 ) ( LIFTING ?auto_162771 ?auto_162765 ) ( IS-CRATE ?auto_162765 ) ( not ( = ?auto_162768 ?auto_162765 ) ) ( not ( = ?auto_162769 ?auto_162768 ) ) ( not ( = ?auto_162770 ?auto_162768 ) ) ( not ( = ?auto_162775 ?auto_162768 ) ) ( not ( = ?auto_162772 ?auto_162768 ) ) ( ON ?auto_162767 ?auto_162766 ) ( ON ?auto_162768 ?auto_162767 ) ( not ( = ?auto_162766 ?auto_162767 ) ) ( not ( = ?auto_162766 ?auto_162768 ) ) ( not ( = ?auto_162766 ?auto_162765 ) ) ( not ( = ?auto_162766 ?auto_162769 ) ) ( not ( = ?auto_162766 ?auto_162770 ) ) ( not ( = ?auto_162766 ?auto_162775 ) ) ( not ( = ?auto_162766 ?auto_162772 ) ) ( not ( = ?auto_162767 ?auto_162768 ) ) ( not ( = ?auto_162767 ?auto_162765 ) ) ( not ( = ?auto_162767 ?auto_162769 ) ) ( not ( = ?auto_162767 ?auto_162770 ) ) ( not ( = ?auto_162767 ?auto_162775 ) ) ( not ( = ?auto_162767 ?auto_162772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162765 ?auto_162769 ?auto_162770 )
      ( MAKE-5CRATE-VERIFY ?auto_162766 ?auto_162767 ?auto_162768 ?auto_162765 ?auto_162769 ?auto_162770 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_162779 - SURFACE
      ?auto_162780 - SURFACE
      ?auto_162781 - SURFACE
      ?auto_162778 - SURFACE
      ?auto_162782 - SURFACE
      ?auto_162784 - SURFACE
      ?auto_162783 - SURFACE
    )
    :vars
    (
      ?auto_162785 - HOIST
      ?auto_162790 - PLACE
      ?auto_162787 - PLACE
      ?auto_162791 - HOIST
      ?auto_162789 - SURFACE
      ?auto_162786 - SURFACE
      ?auto_162788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162785 ?auto_162790 ) ( IS-CRATE ?auto_162783 ) ( not ( = ?auto_162784 ?auto_162783 ) ) ( not ( = ?auto_162782 ?auto_162784 ) ) ( not ( = ?auto_162782 ?auto_162783 ) ) ( not ( = ?auto_162787 ?auto_162790 ) ) ( HOIST-AT ?auto_162791 ?auto_162787 ) ( not ( = ?auto_162785 ?auto_162791 ) ) ( SURFACE-AT ?auto_162783 ?auto_162787 ) ( ON ?auto_162783 ?auto_162789 ) ( CLEAR ?auto_162783 ) ( not ( = ?auto_162784 ?auto_162789 ) ) ( not ( = ?auto_162783 ?auto_162789 ) ) ( not ( = ?auto_162782 ?auto_162789 ) ) ( IS-CRATE ?auto_162784 ) ( AVAILABLE ?auto_162791 ) ( SURFACE-AT ?auto_162784 ?auto_162787 ) ( ON ?auto_162784 ?auto_162786 ) ( CLEAR ?auto_162784 ) ( not ( = ?auto_162784 ?auto_162786 ) ) ( not ( = ?auto_162783 ?auto_162786 ) ) ( not ( = ?auto_162782 ?auto_162786 ) ) ( not ( = ?auto_162789 ?auto_162786 ) ) ( TRUCK-AT ?auto_162788 ?auto_162790 ) ( SURFACE-AT ?auto_162778 ?auto_162790 ) ( CLEAR ?auto_162778 ) ( LIFTING ?auto_162785 ?auto_162782 ) ( IS-CRATE ?auto_162782 ) ( not ( = ?auto_162778 ?auto_162782 ) ) ( not ( = ?auto_162784 ?auto_162778 ) ) ( not ( = ?auto_162783 ?auto_162778 ) ) ( not ( = ?auto_162789 ?auto_162778 ) ) ( not ( = ?auto_162786 ?auto_162778 ) ) ( ON ?auto_162780 ?auto_162779 ) ( ON ?auto_162781 ?auto_162780 ) ( ON ?auto_162778 ?auto_162781 ) ( not ( = ?auto_162779 ?auto_162780 ) ) ( not ( = ?auto_162779 ?auto_162781 ) ) ( not ( = ?auto_162779 ?auto_162778 ) ) ( not ( = ?auto_162779 ?auto_162782 ) ) ( not ( = ?auto_162779 ?auto_162784 ) ) ( not ( = ?auto_162779 ?auto_162783 ) ) ( not ( = ?auto_162779 ?auto_162789 ) ) ( not ( = ?auto_162779 ?auto_162786 ) ) ( not ( = ?auto_162780 ?auto_162781 ) ) ( not ( = ?auto_162780 ?auto_162778 ) ) ( not ( = ?auto_162780 ?auto_162782 ) ) ( not ( = ?auto_162780 ?auto_162784 ) ) ( not ( = ?auto_162780 ?auto_162783 ) ) ( not ( = ?auto_162780 ?auto_162789 ) ) ( not ( = ?auto_162780 ?auto_162786 ) ) ( not ( = ?auto_162781 ?auto_162778 ) ) ( not ( = ?auto_162781 ?auto_162782 ) ) ( not ( = ?auto_162781 ?auto_162784 ) ) ( not ( = ?auto_162781 ?auto_162783 ) ) ( not ( = ?auto_162781 ?auto_162789 ) ) ( not ( = ?auto_162781 ?auto_162786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162782 ?auto_162784 ?auto_162783 )
      ( MAKE-6CRATE-VERIFY ?auto_162779 ?auto_162780 ?auto_162781 ?auto_162778 ?auto_162782 ?auto_162784 ?auto_162783 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_162793 - SURFACE
      ?auto_162794 - SURFACE
      ?auto_162795 - SURFACE
      ?auto_162792 - SURFACE
      ?auto_162796 - SURFACE
      ?auto_162798 - SURFACE
      ?auto_162797 - SURFACE
      ?auto_162799 - SURFACE
    )
    :vars
    (
      ?auto_162800 - HOIST
      ?auto_162805 - PLACE
      ?auto_162802 - PLACE
      ?auto_162806 - HOIST
      ?auto_162804 - SURFACE
      ?auto_162801 - SURFACE
      ?auto_162803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162800 ?auto_162805 ) ( IS-CRATE ?auto_162799 ) ( not ( = ?auto_162797 ?auto_162799 ) ) ( not ( = ?auto_162798 ?auto_162797 ) ) ( not ( = ?auto_162798 ?auto_162799 ) ) ( not ( = ?auto_162802 ?auto_162805 ) ) ( HOIST-AT ?auto_162806 ?auto_162802 ) ( not ( = ?auto_162800 ?auto_162806 ) ) ( SURFACE-AT ?auto_162799 ?auto_162802 ) ( ON ?auto_162799 ?auto_162804 ) ( CLEAR ?auto_162799 ) ( not ( = ?auto_162797 ?auto_162804 ) ) ( not ( = ?auto_162799 ?auto_162804 ) ) ( not ( = ?auto_162798 ?auto_162804 ) ) ( IS-CRATE ?auto_162797 ) ( AVAILABLE ?auto_162806 ) ( SURFACE-AT ?auto_162797 ?auto_162802 ) ( ON ?auto_162797 ?auto_162801 ) ( CLEAR ?auto_162797 ) ( not ( = ?auto_162797 ?auto_162801 ) ) ( not ( = ?auto_162799 ?auto_162801 ) ) ( not ( = ?auto_162798 ?auto_162801 ) ) ( not ( = ?auto_162804 ?auto_162801 ) ) ( TRUCK-AT ?auto_162803 ?auto_162805 ) ( SURFACE-AT ?auto_162796 ?auto_162805 ) ( CLEAR ?auto_162796 ) ( LIFTING ?auto_162800 ?auto_162798 ) ( IS-CRATE ?auto_162798 ) ( not ( = ?auto_162796 ?auto_162798 ) ) ( not ( = ?auto_162797 ?auto_162796 ) ) ( not ( = ?auto_162799 ?auto_162796 ) ) ( not ( = ?auto_162804 ?auto_162796 ) ) ( not ( = ?auto_162801 ?auto_162796 ) ) ( ON ?auto_162794 ?auto_162793 ) ( ON ?auto_162795 ?auto_162794 ) ( ON ?auto_162792 ?auto_162795 ) ( ON ?auto_162796 ?auto_162792 ) ( not ( = ?auto_162793 ?auto_162794 ) ) ( not ( = ?auto_162793 ?auto_162795 ) ) ( not ( = ?auto_162793 ?auto_162792 ) ) ( not ( = ?auto_162793 ?auto_162796 ) ) ( not ( = ?auto_162793 ?auto_162798 ) ) ( not ( = ?auto_162793 ?auto_162797 ) ) ( not ( = ?auto_162793 ?auto_162799 ) ) ( not ( = ?auto_162793 ?auto_162804 ) ) ( not ( = ?auto_162793 ?auto_162801 ) ) ( not ( = ?auto_162794 ?auto_162795 ) ) ( not ( = ?auto_162794 ?auto_162792 ) ) ( not ( = ?auto_162794 ?auto_162796 ) ) ( not ( = ?auto_162794 ?auto_162798 ) ) ( not ( = ?auto_162794 ?auto_162797 ) ) ( not ( = ?auto_162794 ?auto_162799 ) ) ( not ( = ?auto_162794 ?auto_162804 ) ) ( not ( = ?auto_162794 ?auto_162801 ) ) ( not ( = ?auto_162795 ?auto_162792 ) ) ( not ( = ?auto_162795 ?auto_162796 ) ) ( not ( = ?auto_162795 ?auto_162798 ) ) ( not ( = ?auto_162795 ?auto_162797 ) ) ( not ( = ?auto_162795 ?auto_162799 ) ) ( not ( = ?auto_162795 ?auto_162804 ) ) ( not ( = ?auto_162795 ?auto_162801 ) ) ( not ( = ?auto_162792 ?auto_162796 ) ) ( not ( = ?auto_162792 ?auto_162798 ) ) ( not ( = ?auto_162792 ?auto_162797 ) ) ( not ( = ?auto_162792 ?auto_162799 ) ) ( not ( = ?auto_162792 ?auto_162804 ) ) ( not ( = ?auto_162792 ?auto_162801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162798 ?auto_162797 ?auto_162799 )
      ( MAKE-7CRATE-VERIFY ?auto_162793 ?auto_162794 ?auto_162795 ?auto_162792 ?auto_162796 ?auto_162798 ?auto_162797 ?auto_162799 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162808 - SURFACE
      ?auto_162809 - SURFACE
      ?auto_162810 - SURFACE
      ?auto_162807 - SURFACE
      ?auto_162811 - SURFACE
      ?auto_162813 - SURFACE
      ?auto_162812 - SURFACE
      ?auto_162814 - SURFACE
      ?auto_162815 - SURFACE
    )
    :vars
    (
      ?auto_162816 - HOIST
      ?auto_162821 - PLACE
      ?auto_162818 - PLACE
      ?auto_162822 - HOIST
      ?auto_162820 - SURFACE
      ?auto_162817 - SURFACE
      ?auto_162819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162816 ?auto_162821 ) ( IS-CRATE ?auto_162815 ) ( not ( = ?auto_162814 ?auto_162815 ) ) ( not ( = ?auto_162812 ?auto_162814 ) ) ( not ( = ?auto_162812 ?auto_162815 ) ) ( not ( = ?auto_162818 ?auto_162821 ) ) ( HOIST-AT ?auto_162822 ?auto_162818 ) ( not ( = ?auto_162816 ?auto_162822 ) ) ( SURFACE-AT ?auto_162815 ?auto_162818 ) ( ON ?auto_162815 ?auto_162820 ) ( CLEAR ?auto_162815 ) ( not ( = ?auto_162814 ?auto_162820 ) ) ( not ( = ?auto_162815 ?auto_162820 ) ) ( not ( = ?auto_162812 ?auto_162820 ) ) ( IS-CRATE ?auto_162814 ) ( AVAILABLE ?auto_162822 ) ( SURFACE-AT ?auto_162814 ?auto_162818 ) ( ON ?auto_162814 ?auto_162817 ) ( CLEAR ?auto_162814 ) ( not ( = ?auto_162814 ?auto_162817 ) ) ( not ( = ?auto_162815 ?auto_162817 ) ) ( not ( = ?auto_162812 ?auto_162817 ) ) ( not ( = ?auto_162820 ?auto_162817 ) ) ( TRUCK-AT ?auto_162819 ?auto_162821 ) ( SURFACE-AT ?auto_162813 ?auto_162821 ) ( CLEAR ?auto_162813 ) ( LIFTING ?auto_162816 ?auto_162812 ) ( IS-CRATE ?auto_162812 ) ( not ( = ?auto_162813 ?auto_162812 ) ) ( not ( = ?auto_162814 ?auto_162813 ) ) ( not ( = ?auto_162815 ?auto_162813 ) ) ( not ( = ?auto_162820 ?auto_162813 ) ) ( not ( = ?auto_162817 ?auto_162813 ) ) ( ON ?auto_162809 ?auto_162808 ) ( ON ?auto_162810 ?auto_162809 ) ( ON ?auto_162807 ?auto_162810 ) ( ON ?auto_162811 ?auto_162807 ) ( ON ?auto_162813 ?auto_162811 ) ( not ( = ?auto_162808 ?auto_162809 ) ) ( not ( = ?auto_162808 ?auto_162810 ) ) ( not ( = ?auto_162808 ?auto_162807 ) ) ( not ( = ?auto_162808 ?auto_162811 ) ) ( not ( = ?auto_162808 ?auto_162813 ) ) ( not ( = ?auto_162808 ?auto_162812 ) ) ( not ( = ?auto_162808 ?auto_162814 ) ) ( not ( = ?auto_162808 ?auto_162815 ) ) ( not ( = ?auto_162808 ?auto_162820 ) ) ( not ( = ?auto_162808 ?auto_162817 ) ) ( not ( = ?auto_162809 ?auto_162810 ) ) ( not ( = ?auto_162809 ?auto_162807 ) ) ( not ( = ?auto_162809 ?auto_162811 ) ) ( not ( = ?auto_162809 ?auto_162813 ) ) ( not ( = ?auto_162809 ?auto_162812 ) ) ( not ( = ?auto_162809 ?auto_162814 ) ) ( not ( = ?auto_162809 ?auto_162815 ) ) ( not ( = ?auto_162809 ?auto_162820 ) ) ( not ( = ?auto_162809 ?auto_162817 ) ) ( not ( = ?auto_162810 ?auto_162807 ) ) ( not ( = ?auto_162810 ?auto_162811 ) ) ( not ( = ?auto_162810 ?auto_162813 ) ) ( not ( = ?auto_162810 ?auto_162812 ) ) ( not ( = ?auto_162810 ?auto_162814 ) ) ( not ( = ?auto_162810 ?auto_162815 ) ) ( not ( = ?auto_162810 ?auto_162820 ) ) ( not ( = ?auto_162810 ?auto_162817 ) ) ( not ( = ?auto_162807 ?auto_162811 ) ) ( not ( = ?auto_162807 ?auto_162813 ) ) ( not ( = ?auto_162807 ?auto_162812 ) ) ( not ( = ?auto_162807 ?auto_162814 ) ) ( not ( = ?auto_162807 ?auto_162815 ) ) ( not ( = ?auto_162807 ?auto_162820 ) ) ( not ( = ?auto_162807 ?auto_162817 ) ) ( not ( = ?auto_162811 ?auto_162813 ) ) ( not ( = ?auto_162811 ?auto_162812 ) ) ( not ( = ?auto_162811 ?auto_162814 ) ) ( not ( = ?auto_162811 ?auto_162815 ) ) ( not ( = ?auto_162811 ?auto_162820 ) ) ( not ( = ?auto_162811 ?auto_162817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162812 ?auto_162814 ?auto_162815 )
      ( MAKE-8CRATE-VERIFY ?auto_162808 ?auto_162809 ?auto_162810 ?auto_162807 ?auto_162811 ?auto_162813 ?auto_162812 ?auto_162814 ?auto_162815 ) )
  )

)

