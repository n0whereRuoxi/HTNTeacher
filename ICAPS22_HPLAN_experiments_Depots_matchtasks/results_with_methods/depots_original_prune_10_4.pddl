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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375816 - SURFACE
      ?auto_375817 - SURFACE
    )
    :vars
    (
      ?auto_375818 - HOIST
      ?auto_375819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375818 ?auto_375819 ) ( SURFACE-AT ?auto_375816 ?auto_375819 ) ( CLEAR ?auto_375816 ) ( LIFTING ?auto_375818 ?auto_375817 ) ( IS-CRATE ?auto_375817 ) ( not ( = ?auto_375816 ?auto_375817 ) ) )
    :subtasks
    ( ( !DROP ?auto_375818 ?auto_375817 ?auto_375816 ?auto_375819 )
      ( MAKE-1CRATE-VERIFY ?auto_375816 ?auto_375817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375820 - SURFACE
      ?auto_375821 - SURFACE
    )
    :vars
    (
      ?auto_375822 - HOIST
      ?auto_375823 - PLACE
      ?auto_375824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375822 ?auto_375823 ) ( SURFACE-AT ?auto_375820 ?auto_375823 ) ( CLEAR ?auto_375820 ) ( IS-CRATE ?auto_375821 ) ( not ( = ?auto_375820 ?auto_375821 ) ) ( TRUCK-AT ?auto_375824 ?auto_375823 ) ( AVAILABLE ?auto_375822 ) ( IN ?auto_375821 ?auto_375824 ) )
    :subtasks
    ( ( !UNLOAD ?auto_375822 ?auto_375821 ?auto_375824 ?auto_375823 )
      ( MAKE-1CRATE ?auto_375820 ?auto_375821 )
      ( MAKE-1CRATE-VERIFY ?auto_375820 ?auto_375821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375825 - SURFACE
      ?auto_375826 - SURFACE
    )
    :vars
    (
      ?auto_375829 - HOIST
      ?auto_375828 - PLACE
      ?auto_375827 - TRUCK
      ?auto_375830 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375829 ?auto_375828 ) ( SURFACE-AT ?auto_375825 ?auto_375828 ) ( CLEAR ?auto_375825 ) ( IS-CRATE ?auto_375826 ) ( not ( = ?auto_375825 ?auto_375826 ) ) ( AVAILABLE ?auto_375829 ) ( IN ?auto_375826 ?auto_375827 ) ( TRUCK-AT ?auto_375827 ?auto_375830 ) ( not ( = ?auto_375830 ?auto_375828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375827 ?auto_375830 ?auto_375828 )
      ( MAKE-1CRATE ?auto_375825 ?auto_375826 )
      ( MAKE-1CRATE-VERIFY ?auto_375825 ?auto_375826 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375831 - SURFACE
      ?auto_375832 - SURFACE
    )
    :vars
    (
      ?auto_375836 - HOIST
      ?auto_375834 - PLACE
      ?auto_375833 - TRUCK
      ?auto_375835 - PLACE
      ?auto_375837 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375836 ?auto_375834 ) ( SURFACE-AT ?auto_375831 ?auto_375834 ) ( CLEAR ?auto_375831 ) ( IS-CRATE ?auto_375832 ) ( not ( = ?auto_375831 ?auto_375832 ) ) ( AVAILABLE ?auto_375836 ) ( TRUCK-AT ?auto_375833 ?auto_375835 ) ( not ( = ?auto_375835 ?auto_375834 ) ) ( HOIST-AT ?auto_375837 ?auto_375835 ) ( LIFTING ?auto_375837 ?auto_375832 ) ( not ( = ?auto_375836 ?auto_375837 ) ) )
    :subtasks
    ( ( !LOAD ?auto_375837 ?auto_375832 ?auto_375833 ?auto_375835 )
      ( MAKE-1CRATE ?auto_375831 ?auto_375832 )
      ( MAKE-1CRATE-VERIFY ?auto_375831 ?auto_375832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375838 - SURFACE
      ?auto_375839 - SURFACE
    )
    :vars
    (
      ?auto_375840 - HOIST
      ?auto_375841 - PLACE
      ?auto_375843 - TRUCK
      ?auto_375844 - PLACE
      ?auto_375842 - HOIST
      ?auto_375845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375840 ?auto_375841 ) ( SURFACE-AT ?auto_375838 ?auto_375841 ) ( CLEAR ?auto_375838 ) ( IS-CRATE ?auto_375839 ) ( not ( = ?auto_375838 ?auto_375839 ) ) ( AVAILABLE ?auto_375840 ) ( TRUCK-AT ?auto_375843 ?auto_375844 ) ( not ( = ?auto_375844 ?auto_375841 ) ) ( HOIST-AT ?auto_375842 ?auto_375844 ) ( not ( = ?auto_375840 ?auto_375842 ) ) ( AVAILABLE ?auto_375842 ) ( SURFACE-AT ?auto_375839 ?auto_375844 ) ( ON ?auto_375839 ?auto_375845 ) ( CLEAR ?auto_375839 ) ( not ( = ?auto_375838 ?auto_375845 ) ) ( not ( = ?auto_375839 ?auto_375845 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375842 ?auto_375839 ?auto_375845 ?auto_375844 )
      ( MAKE-1CRATE ?auto_375838 ?auto_375839 )
      ( MAKE-1CRATE-VERIFY ?auto_375838 ?auto_375839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375846 - SURFACE
      ?auto_375847 - SURFACE
    )
    :vars
    (
      ?auto_375852 - HOIST
      ?auto_375850 - PLACE
      ?auto_375849 - PLACE
      ?auto_375848 - HOIST
      ?auto_375851 - SURFACE
      ?auto_375853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375852 ?auto_375850 ) ( SURFACE-AT ?auto_375846 ?auto_375850 ) ( CLEAR ?auto_375846 ) ( IS-CRATE ?auto_375847 ) ( not ( = ?auto_375846 ?auto_375847 ) ) ( AVAILABLE ?auto_375852 ) ( not ( = ?auto_375849 ?auto_375850 ) ) ( HOIST-AT ?auto_375848 ?auto_375849 ) ( not ( = ?auto_375852 ?auto_375848 ) ) ( AVAILABLE ?auto_375848 ) ( SURFACE-AT ?auto_375847 ?auto_375849 ) ( ON ?auto_375847 ?auto_375851 ) ( CLEAR ?auto_375847 ) ( not ( = ?auto_375846 ?auto_375851 ) ) ( not ( = ?auto_375847 ?auto_375851 ) ) ( TRUCK-AT ?auto_375853 ?auto_375850 ) )
    :subtasks
    ( ( !DRIVE ?auto_375853 ?auto_375850 ?auto_375849 )
      ( MAKE-1CRATE ?auto_375846 ?auto_375847 )
      ( MAKE-1CRATE-VERIFY ?auto_375846 ?auto_375847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375863 - SURFACE
      ?auto_375864 - SURFACE
      ?auto_375865 - SURFACE
    )
    :vars
    (
      ?auto_375867 - HOIST
      ?auto_375866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375867 ?auto_375866 ) ( SURFACE-AT ?auto_375864 ?auto_375866 ) ( CLEAR ?auto_375864 ) ( LIFTING ?auto_375867 ?auto_375865 ) ( IS-CRATE ?auto_375865 ) ( not ( = ?auto_375864 ?auto_375865 ) ) ( ON ?auto_375864 ?auto_375863 ) ( not ( = ?auto_375863 ?auto_375864 ) ) ( not ( = ?auto_375863 ?auto_375865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375864 ?auto_375865 )
      ( MAKE-2CRATE-VERIFY ?auto_375863 ?auto_375864 ?auto_375865 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375873 - SURFACE
      ?auto_375874 - SURFACE
      ?auto_375875 - SURFACE
    )
    :vars
    (
      ?auto_375878 - HOIST
      ?auto_375876 - PLACE
      ?auto_375877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375878 ?auto_375876 ) ( SURFACE-AT ?auto_375874 ?auto_375876 ) ( CLEAR ?auto_375874 ) ( IS-CRATE ?auto_375875 ) ( not ( = ?auto_375874 ?auto_375875 ) ) ( TRUCK-AT ?auto_375877 ?auto_375876 ) ( AVAILABLE ?auto_375878 ) ( IN ?auto_375875 ?auto_375877 ) ( ON ?auto_375874 ?auto_375873 ) ( not ( = ?auto_375873 ?auto_375874 ) ) ( not ( = ?auto_375873 ?auto_375875 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375874 ?auto_375875 )
      ( MAKE-2CRATE-VERIFY ?auto_375873 ?auto_375874 ?auto_375875 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375879 - SURFACE
      ?auto_375880 - SURFACE
    )
    :vars
    (
      ?auto_375881 - HOIST
      ?auto_375882 - PLACE
      ?auto_375883 - TRUCK
      ?auto_375884 - SURFACE
      ?auto_375885 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375881 ?auto_375882 ) ( SURFACE-AT ?auto_375879 ?auto_375882 ) ( CLEAR ?auto_375879 ) ( IS-CRATE ?auto_375880 ) ( not ( = ?auto_375879 ?auto_375880 ) ) ( AVAILABLE ?auto_375881 ) ( IN ?auto_375880 ?auto_375883 ) ( ON ?auto_375879 ?auto_375884 ) ( not ( = ?auto_375884 ?auto_375879 ) ) ( not ( = ?auto_375884 ?auto_375880 ) ) ( TRUCK-AT ?auto_375883 ?auto_375885 ) ( not ( = ?auto_375885 ?auto_375882 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375883 ?auto_375885 ?auto_375882 )
      ( MAKE-2CRATE ?auto_375884 ?auto_375879 ?auto_375880 )
      ( MAKE-1CRATE-VERIFY ?auto_375879 ?auto_375880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375886 - SURFACE
      ?auto_375887 - SURFACE
      ?auto_375888 - SURFACE
    )
    :vars
    (
      ?auto_375891 - HOIST
      ?auto_375889 - PLACE
      ?auto_375890 - TRUCK
      ?auto_375892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375891 ?auto_375889 ) ( SURFACE-AT ?auto_375887 ?auto_375889 ) ( CLEAR ?auto_375887 ) ( IS-CRATE ?auto_375888 ) ( not ( = ?auto_375887 ?auto_375888 ) ) ( AVAILABLE ?auto_375891 ) ( IN ?auto_375888 ?auto_375890 ) ( ON ?auto_375887 ?auto_375886 ) ( not ( = ?auto_375886 ?auto_375887 ) ) ( not ( = ?auto_375886 ?auto_375888 ) ) ( TRUCK-AT ?auto_375890 ?auto_375892 ) ( not ( = ?auto_375892 ?auto_375889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375887 ?auto_375888 )
      ( MAKE-2CRATE-VERIFY ?auto_375886 ?auto_375887 ?auto_375888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375893 - SURFACE
      ?auto_375894 - SURFACE
    )
    :vars
    (
      ?auto_375895 - HOIST
      ?auto_375898 - PLACE
      ?auto_375899 - SURFACE
      ?auto_375897 - TRUCK
      ?auto_375896 - PLACE
      ?auto_375900 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375895 ?auto_375898 ) ( SURFACE-AT ?auto_375893 ?auto_375898 ) ( CLEAR ?auto_375893 ) ( IS-CRATE ?auto_375894 ) ( not ( = ?auto_375893 ?auto_375894 ) ) ( AVAILABLE ?auto_375895 ) ( ON ?auto_375893 ?auto_375899 ) ( not ( = ?auto_375899 ?auto_375893 ) ) ( not ( = ?auto_375899 ?auto_375894 ) ) ( TRUCK-AT ?auto_375897 ?auto_375896 ) ( not ( = ?auto_375896 ?auto_375898 ) ) ( HOIST-AT ?auto_375900 ?auto_375896 ) ( LIFTING ?auto_375900 ?auto_375894 ) ( not ( = ?auto_375895 ?auto_375900 ) ) )
    :subtasks
    ( ( !LOAD ?auto_375900 ?auto_375894 ?auto_375897 ?auto_375896 )
      ( MAKE-2CRATE ?auto_375899 ?auto_375893 ?auto_375894 )
      ( MAKE-1CRATE-VERIFY ?auto_375893 ?auto_375894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375901 - SURFACE
      ?auto_375902 - SURFACE
      ?auto_375903 - SURFACE
    )
    :vars
    (
      ?auto_375906 - HOIST
      ?auto_375904 - PLACE
      ?auto_375905 - TRUCK
      ?auto_375908 - PLACE
      ?auto_375907 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375906 ?auto_375904 ) ( SURFACE-AT ?auto_375902 ?auto_375904 ) ( CLEAR ?auto_375902 ) ( IS-CRATE ?auto_375903 ) ( not ( = ?auto_375902 ?auto_375903 ) ) ( AVAILABLE ?auto_375906 ) ( ON ?auto_375902 ?auto_375901 ) ( not ( = ?auto_375901 ?auto_375902 ) ) ( not ( = ?auto_375901 ?auto_375903 ) ) ( TRUCK-AT ?auto_375905 ?auto_375908 ) ( not ( = ?auto_375908 ?auto_375904 ) ) ( HOIST-AT ?auto_375907 ?auto_375908 ) ( LIFTING ?auto_375907 ?auto_375903 ) ( not ( = ?auto_375906 ?auto_375907 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375902 ?auto_375903 )
      ( MAKE-2CRATE-VERIFY ?auto_375901 ?auto_375902 ?auto_375903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375909 - SURFACE
      ?auto_375910 - SURFACE
    )
    :vars
    (
      ?auto_375914 - HOIST
      ?auto_375913 - PLACE
      ?auto_375915 - SURFACE
      ?auto_375912 - TRUCK
      ?auto_375911 - PLACE
      ?auto_375916 - HOIST
      ?auto_375917 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375914 ?auto_375913 ) ( SURFACE-AT ?auto_375909 ?auto_375913 ) ( CLEAR ?auto_375909 ) ( IS-CRATE ?auto_375910 ) ( not ( = ?auto_375909 ?auto_375910 ) ) ( AVAILABLE ?auto_375914 ) ( ON ?auto_375909 ?auto_375915 ) ( not ( = ?auto_375915 ?auto_375909 ) ) ( not ( = ?auto_375915 ?auto_375910 ) ) ( TRUCK-AT ?auto_375912 ?auto_375911 ) ( not ( = ?auto_375911 ?auto_375913 ) ) ( HOIST-AT ?auto_375916 ?auto_375911 ) ( not ( = ?auto_375914 ?auto_375916 ) ) ( AVAILABLE ?auto_375916 ) ( SURFACE-AT ?auto_375910 ?auto_375911 ) ( ON ?auto_375910 ?auto_375917 ) ( CLEAR ?auto_375910 ) ( not ( = ?auto_375909 ?auto_375917 ) ) ( not ( = ?auto_375910 ?auto_375917 ) ) ( not ( = ?auto_375915 ?auto_375917 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375916 ?auto_375910 ?auto_375917 ?auto_375911 )
      ( MAKE-2CRATE ?auto_375915 ?auto_375909 ?auto_375910 )
      ( MAKE-1CRATE-VERIFY ?auto_375909 ?auto_375910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375918 - SURFACE
      ?auto_375919 - SURFACE
      ?auto_375920 - SURFACE
    )
    :vars
    (
      ?auto_375922 - HOIST
      ?auto_375926 - PLACE
      ?auto_375924 - TRUCK
      ?auto_375923 - PLACE
      ?auto_375921 - HOIST
      ?auto_375925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375922 ?auto_375926 ) ( SURFACE-AT ?auto_375919 ?auto_375926 ) ( CLEAR ?auto_375919 ) ( IS-CRATE ?auto_375920 ) ( not ( = ?auto_375919 ?auto_375920 ) ) ( AVAILABLE ?auto_375922 ) ( ON ?auto_375919 ?auto_375918 ) ( not ( = ?auto_375918 ?auto_375919 ) ) ( not ( = ?auto_375918 ?auto_375920 ) ) ( TRUCK-AT ?auto_375924 ?auto_375923 ) ( not ( = ?auto_375923 ?auto_375926 ) ) ( HOIST-AT ?auto_375921 ?auto_375923 ) ( not ( = ?auto_375922 ?auto_375921 ) ) ( AVAILABLE ?auto_375921 ) ( SURFACE-AT ?auto_375920 ?auto_375923 ) ( ON ?auto_375920 ?auto_375925 ) ( CLEAR ?auto_375920 ) ( not ( = ?auto_375919 ?auto_375925 ) ) ( not ( = ?auto_375920 ?auto_375925 ) ) ( not ( = ?auto_375918 ?auto_375925 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375919 ?auto_375920 )
      ( MAKE-2CRATE-VERIFY ?auto_375918 ?auto_375919 ?auto_375920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375927 - SURFACE
      ?auto_375928 - SURFACE
    )
    :vars
    (
      ?auto_375931 - HOIST
      ?auto_375929 - PLACE
      ?auto_375933 - SURFACE
      ?auto_375934 - PLACE
      ?auto_375935 - HOIST
      ?auto_375932 - SURFACE
      ?auto_375930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375931 ?auto_375929 ) ( SURFACE-AT ?auto_375927 ?auto_375929 ) ( CLEAR ?auto_375927 ) ( IS-CRATE ?auto_375928 ) ( not ( = ?auto_375927 ?auto_375928 ) ) ( AVAILABLE ?auto_375931 ) ( ON ?auto_375927 ?auto_375933 ) ( not ( = ?auto_375933 ?auto_375927 ) ) ( not ( = ?auto_375933 ?auto_375928 ) ) ( not ( = ?auto_375934 ?auto_375929 ) ) ( HOIST-AT ?auto_375935 ?auto_375934 ) ( not ( = ?auto_375931 ?auto_375935 ) ) ( AVAILABLE ?auto_375935 ) ( SURFACE-AT ?auto_375928 ?auto_375934 ) ( ON ?auto_375928 ?auto_375932 ) ( CLEAR ?auto_375928 ) ( not ( = ?auto_375927 ?auto_375932 ) ) ( not ( = ?auto_375928 ?auto_375932 ) ) ( not ( = ?auto_375933 ?auto_375932 ) ) ( TRUCK-AT ?auto_375930 ?auto_375929 ) )
    :subtasks
    ( ( !DRIVE ?auto_375930 ?auto_375929 ?auto_375934 )
      ( MAKE-2CRATE ?auto_375933 ?auto_375927 ?auto_375928 )
      ( MAKE-1CRATE-VERIFY ?auto_375927 ?auto_375928 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375936 - SURFACE
      ?auto_375937 - SURFACE
      ?auto_375938 - SURFACE
    )
    :vars
    (
      ?auto_375939 - HOIST
      ?auto_375944 - PLACE
      ?auto_375940 - PLACE
      ?auto_375943 - HOIST
      ?auto_375941 - SURFACE
      ?auto_375942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375939 ?auto_375944 ) ( SURFACE-AT ?auto_375937 ?auto_375944 ) ( CLEAR ?auto_375937 ) ( IS-CRATE ?auto_375938 ) ( not ( = ?auto_375937 ?auto_375938 ) ) ( AVAILABLE ?auto_375939 ) ( ON ?auto_375937 ?auto_375936 ) ( not ( = ?auto_375936 ?auto_375937 ) ) ( not ( = ?auto_375936 ?auto_375938 ) ) ( not ( = ?auto_375940 ?auto_375944 ) ) ( HOIST-AT ?auto_375943 ?auto_375940 ) ( not ( = ?auto_375939 ?auto_375943 ) ) ( AVAILABLE ?auto_375943 ) ( SURFACE-AT ?auto_375938 ?auto_375940 ) ( ON ?auto_375938 ?auto_375941 ) ( CLEAR ?auto_375938 ) ( not ( = ?auto_375937 ?auto_375941 ) ) ( not ( = ?auto_375938 ?auto_375941 ) ) ( not ( = ?auto_375936 ?auto_375941 ) ) ( TRUCK-AT ?auto_375942 ?auto_375944 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375937 ?auto_375938 )
      ( MAKE-2CRATE-VERIFY ?auto_375936 ?auto_375937 ?auto_375938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375945 - SURFACE
      ?auto_375946 - SURFACE
    )
    :vars
    (
      ?auto_375948 - HOIST
      ?auto_375950 - PLACE
      ?auto_375951 - SURFACE
      ?auto_375952 - PLACE
      ?auto_375947 - HOIST
      ?auto_375949 - SURFACE
      ?auto_375953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375948 ?auto_375950 ) ( IS-CRATE ?auto_375946 ) ( not ( = ?auto_375945 ?auto_375946 ) ) ( not ( = ?auto_375951 ?auto_375945 ) ) ( not ( = ?auto_375951 ?auto_375946 ) ) ( not ( = ?auto_375952 ?auto_375950 ) ) ( HOIST-AT ?auto_375947 ?auto_375952 ) ( not ( = ?auto_375948 ?auto_375947 ) ) ( AVAILABLE ?auto_375947 ) ( SURFACE-AT ?auto_375946 ?auto_375952 ) ( ON ?auto_375946 ?auto_375949 ) ( CLEAR ?auto_375946 ) ( not ( = ?auto_375945 ?auto_375949 ) ) ( not ( = ?auto_375946 ?auto_375949 ) ) ( not ( = ?auto_375951 ?auto_375949 ) ) ( TRUCK-AT ?auto_375953 ?auto_375950 ) ( SURFACE-AT ?auto_375951 ?auto_375950 ) ( CLEAR ?auto_375951 ) ( LIFTING ?auto_375948 ?auto_375945 ) ( IS-CRATE ?auto_375945 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375951 ?auto_375945 )
      ( MAKE-2CRATE ?auto_375951 ?auto_375945 ?auto_375946 )
      ( MAKE-1CRATE-VERIFY ?auto_375945 ?auto_375946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375954 - SURFACE
      ?auto_375955 - SURFACE
      ?auto_375956 - SURFACE
    )
    :vars
    (
      ?auto_375957 - HOIST
      ?auto_375962 - PLACE
      ?auto_375960 - PLACE
      ?auto_375959 - HOIST
      ?auto_375961 - SURFACE
      ?auto_375958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375957 ?auto_375962 ) ( IS-CRATE ?auto_375956 ) ( not ( = ?auto_375955 ?auto_375956 ) ) ( not ( = ?auto_375954 ?auto_375955 ) ) ( not ( = ?auto_375954 ?auto_375956 ) ) ( not ( = ?auto_375960 ?auto_375962 ) ) ( HOIST-AT ?auto_375959 ?auto_375960 ) ( not ( = ?auto_375957 ?auto_375959 ) ) ( AVAILABLE ?auto_375959 ) ( SURFACE-AT ?auto_375956 ?auto_375960 ) ( ON ?auto_375956 ?auto_375961 ) ( CLEAR ?auto_375956 ) ( not ( = ?auto_375955 ?auto_375961 ) ) ( not ( = ?auto_375956 ?auto_375961 ) ) ( not ( = ?auto_375954 ?auto_375961 ) ) ( TRUCK-AT ?auto_375958 ?auto_375962 ) ( SURFACE-AT ?auto_375954 ?auto_375962 ) ( CLEAR ?auto_375954 ) ( LIFTING ?auto_375957 ?auto_375955 ) ( IS-CRATE ?auto_375955 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375955 ?auto_375956 )
      ( MAKE-2CRATE-VERIFY ?auto_375954 ?auto_375955 ?auto_375956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375963 - SURFACE
      ?auto_375964 - SURFACE
    )
    :vars
    (
      ?auto_375966 - HOIST
      ?auto_375965 - PLACE
      ?auto_375970 - SURFACE
      ?auto_375967 - PLACE
      ?auto_375971 - HOIST
      ?auto_375968 - SURFACE
      ?auto_375969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375966 ?auto_375965 ) ( IS-CRATE ?auto_375964 ) ( not ( = ?auto_375963 ?auto_375964 ) ) ( not ( = ?auto_375970 ?auto_375963 ) ) ( not ( = ?auto_375970 ?auto_375964 ) ) ( not ( = ?auto_375967 ?auto_375965 ) ) ( HOIST-AT ?auto_375971 ?auto_375967 ) ( not ( = ?auto_375966 ?auto_375971 ) ) ( AVAILABLE ?auto_375971 ) ( SURFACE-AT ?auto_375964 ?auto_375967 ) ( ON ?auto_375964 ?auto_375968 ) ( CLEAR ?auto_375964 ) ( not ( = ?auto_375963 ?auto_375968 ) ) ( not ( = ?auto_375964 ?auto_375968 ) ) ( not ( = ?auto_375970 ?auto_375968 ) ) ( TRUCK-AT ?auto_375969 ?auto_375965 ) ( SURFACE-AT ?auto_375970 ?auto_375965 ) ( CLEAR ?auto_375970 ) ( IS-CRATE ?auto_375963 ) ( AVAILABLE ?auto_375966 ) ( IN ?auto_375963 ?auto_375969 ) )
    :subtasks
    ( ( !UNLOAD ?auto_375966 ?auto_375963 ?auto_375969 ?auto_375965 )
      ( MAKE-2CRATE ?auto_375970 ?auto_375963 ?auto_375964 )
      ( MAKE-1CRATE-VERIFY ?auto_375963 ?auto_375964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375972 - SURFACE
      ?auto_375973 - SURFACE
      ?auto_375974 - SURFACE
    )
    :vars
    (
      ?auto_375976 - HOIST
      ?auto_375977 - PLACE
      ?auto_375980 - PLACE
      ?auto_375975 - HOIST
      ?auto_375978 - SURFACE
      ?auto_375979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375976 ?auto_375977 ) ( IS-CRATE ?auto_375974 ) ( not ( = ?auto_375973 ?auto_375974 ) ) ( not ( = ?auto_375972 ?auto_375973 ) ) ( not ( = ?auto_375972 ?auto_375974 ) ) ( not ( = ?auto_375980 ?auto_375977 ) ) ( HOIST-AT ?auto_375975 ?auto_375980 ) ( not ( = ?auto_375976 ?auto_375975 ) ) ( AVAILABLE ?auto_375975 ) ( SURFACE-AT ?auto_375974 ?auto_375980 ) ( ON ?auto_375974 ?auto_375978 ) ( CLEAR ?auto_375974 ) ( not ( = ?auto_375973 ?auto_375978 ) ) ( not ( = ?auto_375974 ?auto_375978 ) ) ( not ( = ?auto_375972 ?auto_375978 ) ) ( TRUCK-AT ?auto_375979 ?auto_375977 ) ( SURFACE-AT ?auto_375972 ?auto_375977 ) ( CLEAR ?auto_375972 ) ( IS-CRATE ?auto_375973 ) ( AVAILABLE ?auto_375976 ) ( IN ?auto_375973 ?auto_375979 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375973 ?auto_375974 )
      ( MAKE-2CRATE-VERIFY ?auto_375972 ?auto_375973 ?auto_375974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_376017 - SURFACE
      ?auto_376018 - SURFACE
    )
    :vars
    (
      ?auto_376023 - HOIST
      ?auto_376025 - PLACE
      ?auto_376019 - SURFACE
      ?auto_376021 - PLACE
      ?auto_376024 - HOIST
      ?auto_376022 - SURFACE
      ?auto_376020 - TRUCK
      ?auto_376026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376023 ?auto_376025 ) ( SURFACE-AT ?auto_376017 ?auto_376025 ) ( CLEAR ?auto_376017 ) ( IS-CRATE ?auto_376018 ) ( not ( = ?auto_376017 ?auto_376018 ) ) ( AVAILABLE ?auto_376023 ) ( ON ?auto_376017 ?auto_376019 ) ( not ( = ?auto_376019 ?auto_376017 ) ) ( not ( = ?auto_376019 ?auto_376018 ) ) ( not ( = ?auto_376021 ?auto_376025 ) ) ( HOIST-AT ?auto_376024 ?auto_376021 ) ( not ( = ?auto_376023 ?auto_376024 ) ) ( AVAILABLE ?auto_376024 ) ( SURFACE-AT ?auto_376018 ?auto_376021 ) ( ON ?auto_376018 ?auto_376022 ) ( CLEAR ?auto_376018 ) ( not ( = ?auto_376017 ?auto_376022 ) ) ( not ( = ?auto_376018 ?auto_376022 ) ) ( not ( = ?auto_376019 ?auto_376022 ) ) ( TRUCK-AT ?auto_376020 ?auto_376026 ) ( not ( = ?auto_376026 ?auto_376025 ) ) ( not ( = ?auto_376021 ?auto_376026 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_376020 ?auto_376026 ?auto_376025 )
      ( MAKE-1CRATE ?auto_376017 ?auto_376018 )
      ( MAKE-1CRATE-VERIFY ?auto_376017 ?auto_376018 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376057 - SURFACE
      ?auto_376058 - SURFACE
      ?auto_376059 - SURFACE
      ?auto_376056 - SURFACE
    )
    :vars
    (
      ?auto_376061 - HOIST
      ?auto_376060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376061 ?auto_376060 ) ( SURFACE-AT ?auto_376059 ?auto_376060 ) ( CLEAR ?auto_376059 ) ( LIFTING ?auto_376061 ?auto_376056 ) ( IS-CRATE ?auto_376056 ) ( not ( = ?auto_376059 ?auto_376056 ) ) ( ON ?auto_376058 ?auto_376057 ) ( ON ?auto_376059 ?auto_376058 ) ( not ( = ?auto_376057 ?auto_376058 ) ) ( not ( = ?auto_376057 ?auto_376059 ) ) ( not ( = ?auto_376057 ?auto_376056 ) ) ( not ( = ?auto_376058 ?auto_376059 ) ) ( not ( = ?auto_376058 ?auto_376056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_376059 ?auto_376056 )
      ( MAKE-3CRATE-VERIFY ?auto_376057 ?auto_376058 ?auto_376059 ?auto_376056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376074 - SURFACE
      ?auto_376075 - SURFACE
      ?auto_376076 - SURFACE
      ?auto_376073 - SURFACE
    )
    :vars
    (
      ?auto_376079 - HOIST
      ?auto_376078 - PLACE
      ?auto_376077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376079 ?auto_376078 ) ( SURFACE-AT ?auto_376076 ?auto_376078 ) ( CLEAR ?auto_376076 ) ( IS-CRATE ?auto_376073 ) ( not ( = ?auto_376076 ?auto_376073 ) ) ( TRUCK-AT ?auto_376077 ?auto_376078 ) ( AVAILABLE ?auto_376079 ) ( IN ?auto_376073 ?auto_376077 ) ( ON ?auto_376076 ?auto_376075 ) ( not ( = ?auto_376075 ?auto_376076 ) ) ( not ( = ?auto_376075 ?auto_376073 ) ) ( ON ?auto_376075 ?auto_376074 ) ( not ( = ?auto_376074 ?auto_376075 ) ) ( not ( = ?auto_376074 ?auto_376076 ) ) ( not ( = ?auto_376074 ?auto_376073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376075 ?auto_376076 ?auto_376073 )
      ( MAKE-3CRATE-VERIFY ?auto_376074 ?auto_376075 ?auto_376076 ?auto_376073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376095 - SURFACE
      ?auto_376096 - SURFACE
      ?auto_376097 - SURFACE
      ?auto_376094 - SURFACE
    )
    :vars
    (
      ?auto_376101 - HOIST
      ?auto_376099 - PLACE
      ?auto_376098 - TRUCK
      ?auto_376100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376101 ?auto_376099 ) ( SURFACE-AT ?auto_376097 ?auto_376099 ) ( CLEAR ?auto_376097 ) ( IS-CRATE ?auto_376094 ) ( not ( = ?auto_376097 ?auto_376094 ) ) ( AVAILABLE ?auto_376101 ) ( IN ?auto_376094 ?auto_376098 ) ( ON ?auto_376097 ?auto_376096 ) ( not ( = ?auto_376096 ?auto_376097 ) ) ( not ( = ?auto_376096 ?auto_376094 ) ) ( TRUCK-AT ?auto_376098 ?auto_376100 ) ( not ( = ?auto_376100 ?auto_376099 ) ) ( ON ?auto_376096 ?auto_376095 ) ( not ( = ?auto_376095 ?auto_376096 ) ) ( not ( = ?auto_376095 ?auto_376097 ) ) ( not ( = ?auto_376095 ?auto_376094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376096 ?auto_376097 ?auto_376094 )
      ( MAKE-3CRATE-VERIFY ?auto_376095 ?auto_376096 ?auto_376097 ?auto_376094 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376119 - SURFACE
      ?auto_376120 - SURFACE
      ?auto_376121 - SURFACE
      ?auto_376118 - SURFACE
    )
    :vars
    (
      ?auto_376124 - HOIST
      ?auto_376122 - PLACE
      ?auto_376123 - TRUCK
      ?auto_376126 - PLACE
      ?auto_376125 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_376124 ?auto_376122 ) ( SURFACE-AT ?auto_376121 ?auto_376122 ) ( CLEAR ?auto_376121 ) ( IS-CRATE ?auto_376118 ) ( not ( = ?auto_376121 ?auto_376118 ) ) ( AVAILABLE ?auto_376124 ) ( ON ?auto_376121 ?auto_376120 ) ( not ( = ?auto_376120 ?auto_376121 ) ) ( not ( = ?auto_376120 ?auto_376118 ) ) ( TRUCK-AT ?auto_376123 ?auto_376126 ) ( not ( = ?auto_376126 ?auto_376122 ) ) ( HOIST-AT ?auto_376125 ?auto_376126 ) ( LIFTING ?auto_376125 ?auto_376118 ) ( not ( = ?auto_376124 ?auto_376125 ) ) ( ON ?auto_376120 ?auto_376119 ) ( not ( = ?auto_376119 ?auto_376120 ) ) ( not ( = ?auto_376119 ?auto_376121 ) ) ( not ( = ?auto_376119 ?auto_376118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376120 ?auto_376121 ?auto_376118 )
      ( MAKE-3CRATE-VERIFY ?auto_376119 ?auto_376120 ?auto_376121 ?auto_376118 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376146 - SURFACE
      ?auto_376147 - SURFACE
      ?auto_376148 - SURFACE
      ?auto_376145 - SURFACE
    )
    :vars
    (
      ?auto_376149 - HOIST
      ?auto_376150 - PLACE
      ?auto_376151 - TRUCK
      ?auto_376154 - PLACE
      ?auto_376152 - HOIST
      ?auto_376153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376149 ?auto_376150 ) ( SURFACE-AT ?auto_376148 ?auto_376150 ) ( CLEAR ?auto_376148 ) ( IS-CRATE ?auto_376145 ) ( not ( = ?auto_376148 ?auto_376145 ) ) ( AVAILABLE ?auto_376149 ) ( ON ?auto_376148 ?auto_376147 ) ( not ( = ?auto_376147 ?auto_376148 ) ) ( not ( = ?auto_376147 ?auto_376145 ) ) ( TRUCK-AT ?auto_376151 ?auto_376154 ) ( not ( = ?auto_376154 ?auto_376150 ) ) ( HOIST-AT ?auto_376152 ?auto_376154 ) ( not ( = ?auto_376149 ?auto_376152 ) ) ( AVAILABLE ?auto_376152 ) ( SURFACE-AT ?auto_376145 ?auto_376154 ) ( ON ?auto_376145 ?auto_376153 ) ( CLEAR ?auto_376145 ) ( not ( = ?auto_376148 ?auto_376153 ) ) ( not ( = ?auto_376145 ?auto_376153 ) ) ( not ( = ?auto_376147 ?auto_376153 ) ) ( ON ?auto_376147 ?auto_376146 ) ( not ( = ?auto_376146 ?auto_376147 ) ) ( not ( = ?auto_376146 ?auto_376148 ) ) ( not ( = ?auto_376146 ?auto_376145 ) ) ( not ( = ?auto_376146 ?auto_376153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376147 ?auto_376148 ?auto_376145 )
      ( MAKE-3CRATE-VERIFY ?auto_376146 ?auto_376147 ?auto_376148 ?auto_376145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376174 - SURFACE
      ?auto_376175 - SURFACE
      ?auto_376176 - SURFACE
      ?auto_376173 - SURFACE
    )
    :vars
    (
      ?auto_376180 - HOIST
      ?auto_376182 - PLACE
      ?auto_376179 - PLACE
      ?auto_376181 - HOIST
      ?auto_376177 - SURFACE
      ?auto_376178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376180 ?auto_376182 ) ( SURFACE-AT ?auto_376176 ?auto_376182 ) ( CLEAR ?auto_376176 ) ( IS-CRATE ?auto_376173 ) ( not ( = ?auto_376176 ?auto_376173 ) ) ( AVAILABLE ?auto_376180 ) ( ON ?auto_376176 ?auto_376175 ) ( not ( = ?auto_376175 ?auto_376176 ) ) ( not ( = ?auto_376175 ?auto_376173 ) ) ( not ( = ?auto_376179 ?auto_376182 ) ) ( HOIST-AT ?auto_376181 ?auto_376179 ) ( not ( = ?auto_376180 ?auto_376181 ) ) ( AVAILABLE ?auto_376181 ) ( SURFACE-AT ?auto_376173 ?auto_376179 ) ( ON ?auto_376173 ?auto_376177 ) ( CLEAR ?auto_376173 ) ( not ( = ?auto_376176 ?auto_376177 ) ) ( not ( = ?auto_376173 ?auto_376177 ) ) ( not ( = ?auto_376175 ?auto_376177 ) ) ( TRUCK-AT ?auto_376178 ?auto_376182 ) ( ON ?auto_376175 ?auto_376174 ) ( not ( = ?auto_376174 ?auto_376175 ) ) ( not ( = ?auto_376174 ?auto_376176 ) ) ( not ( = ?auto_376174 ?auto_376173 ) ) ( not ( = ?auto_376174 ?auto_376177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376175 ?auto_376176 ?auto_376173 )
      ( MAKE-3CRATE-VERIFY ?auto_376174 ?auto_376175 ?auto_376176 ?auto_376173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376202 - SURFACE
      ?auto_376203 - SURFACE
      ?auto_376204 - SURFACE
      ?auto_376201 - SURFACE
    )
    :vars
    (
      ?auto_376208 - HOIST
      ?auto_376206 - PLACE
      ?auto_376209 - PLACE
      ?auto_376207 - HOIST
      ?auto_376205 - SURFACE
      ?auto_376210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376208 ?auto_376206 ) ( IS-CRATE ?auto_376201 ) ( not ( = ?auto_376204 ?auto_376201 ) ) ( not ( = ?auto_376203 ?auto_376204 ) ) ( not ( = ?auto_376203 ?auto_376201 ) ) ( not ( = ?auto_376209 ?auto_376206 ) ) ( HOIST-AT ?auto_376207 ?auto_376209 ) ( not ( = ?auto_376208 ?auto_376207 ) ) ( AVAILABLE ?auto_376207 ) ( SURFACE-AT ?auto_376201 ?auto_376209 ) ( ON ?auto_376201 ?auto_376205 ) ( CLEAR ?auto_376201 ) ( not ( = ?auto_376204 ?auto_376205 ) ) ( not ( = ?auto_376201 ?auto_376205 ) ) ( not ( = ?auto_376203 ?auto_376205 ) ) ( TRUCK-AT ?auto_376210 ?auto_376206 ) ( SURFACE-AT ?auto_376203 ?auto_376206 ) ( CLEAR ?auto_376203 ) ( LIFTING ?auto_376208 ?auto_376204 ) ( IS-CRATE ?auto_376204 ) ( ON ?auto_376203 ?auto_376202 ) ( not ( = ?auto_376202 ?auto_376203 ) ) ( not ( = ?auto_376202 ?auto_376204 ) ) ( not ( = ?auto_376202 ?auto_376201 ) ) ( not ( = ?auto_376202 ?auto_376205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376203 ?auto_376204 ?auto_376201 )
      ( MAKE-3CRATE-VERIFY ?auto_376202 ?auto_376203 ?auto_376204 ?auto_376201 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_376230 - SURFACE
      ?auto_376231 - SURFACE
      ?auto_376232 - SURFACE
      ?auto_376229 - SURFACE
    )
    :vars
    (
      ?auto_376234 - HOIST
      ?auto_376238 - PLACE
      ?auto_376237 - PLACE
      ?auto_376235 - HOIST
      ?auto_376236 - SURFACE
      ?auto_376233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376234 ?auto_376238 ) ( IS-CRATE ?auto_376229 ) ( not ( = ?auto_376232 ?auto_376229 ) ) ( not ( = ?auto_376231 ?auto_376232 ) ) ( not ( = ?auto_376231 ?auto_376229 ) ) ( not ( = ?auto_376237 ?auto_376238 ) ) ( HOIST-AT ?auto_376235 ?auto_376237 ) ( not ( = ?auto_376234 ?auto_376235 ) ) ( AVAILABLE ?auto_376235 ) ( SURFACE-AT ?auto_376229 ?auto_376237 ) ( ON ?auto_376229 ?auto_376236 ) ( CLEAR ?auto_376229 ) ( not ( = ?auto_376232 ?auto_376236 ) ) ( not ( = ?auto_376229 ?auto_376236 ) ) ( not ( = ?auto_376231 ?auto_376236 ) ) ( TRUCK-AT ?auto_376233 ?auto_376238 ) ( SURFACE-AT ?auto_376231 ?auto_376238 ) ( CLEAR ?auto_376231 ) ( IS-CRATE ?auto_376232 ) ( AVAILABLE ?auto_376234 ) ( IN ?auto_376232 ?auto_376233 ) ( ON ?auto_376231 ?auto_376230 ) ( not ( = ?auto_376230 ?auto_376231 ) ) ( not ( = ?auto_376230 ?auto_376232 ) ) ( not ( = ?auto_376230 ?auto_376229 ) ) ( not ( = ?auto_376230 ?auto_376236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376231 ?auto_376232 ?auto_376229 )
      ( MAKE-3CRATE-VERIFY ?auto_376230 ?auto_376231 ?auto_376232 ?auto_376229 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376521 - SURFACE
      ?auto_376522 - SURFACE
      ?auto_376523 - SURFACE
      ?auto_376520 - SURFACE
      ?auto_376524 - SURFACE
    )
    :vars
    (
      ?auto_376525 - HOIST
      ?auto_376526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376525 ?auto_376526 ) ( SURFACE-AT ?auto_376520 ?auto_376526 ) ( CLEAR ?auto_376520 ) ( LIFTING ?auto_376525 ?auto_376524 ) ( IS-CRATE ?auto_376524 ) ( not ( = ?auto_376520 ?auto_376524 ) ) ( ON ?auto_376522 ?auto_376521 ) ( ON ?auto_376523 ?auto_376522 ) ( ON ?auto_376520 ?auto_376523 ) ( not ( = ?auto_376521 ?auto_376522 ) ) ( not ( = ?auto_376521 ?auto_376523 ) ) ( not ( = ?auto_376521 ?auto_376520 ) ) ( not ( = ?auto_376521 ?auto_376524 ) ) ( not ( = ?auto_376522 ?auto_376523 ) ) ( not ( = ?auto_376522 ?auto_376520 ) ) ( not ( = ?auto_376522 ?auto_376524 ) ) ( not ( = ?auto_376523 ?auto_376520 ) ) ( not ( = ?auto_376523 ?auto_376524 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_376520 ?auto_376524 )
      ( MAKE-4CRATE-VERIFY ?auto_376521 ?auto_376522 ?auto_376523 ?auto_376520 ?auto_376524 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376546 - SURFACE
      ?auto_376547 - SURFACE
      ?auto_376548 - SURFACE
      ?auto_376545 - SURFACE
      ?auto_376549 - SURFACE
    )
    :vars
    (
      ?auto_376550 - HOIST
      ?auto_376552 - PLACE
      ?auto_376551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376550 ?auto_376552 ) ( SURFACE-AT ?auto_376545 ?auto_376552 ) ( CLEAR ?auto_376545 ) ( IS-CRATE ?auto_376549 ) ( not ( = ?auto_376545 ?auto_376549 ) ) ( TRUCK-AT ?auto_376551 ?auto_376552 ) ( AVAILABLE ?auto_376550 ) ( IN ?auto_376549 ?auto_376551 ) ( ON ?auto_376545 ?auto_376548 ) ( not ( = ?auto_376548 ?auto_376545 ) ) ( not ( = ?auto_376548 ?auto_376549 ) ) ( ON ?auto_376547 ?auto_376546 ) ( ON ?auto_376548 ?auto_376547 ) ( not ( = ?auto_376546 ?auto_376547 ) ) ( not ( = ?auto_376546 ?auto_376548 ) ) ( not ( = ?auto_376546 ?auto_376545 ) ) ( not ( = ?auto_376546 ?auto_376549 ) ) ( not ( = ?auto_376547 ?auto_376548 ) ) ( not ( = ?auto_376547 ?auto_376545 ) ) ( not ( = ?auto_376547 ?auto_376549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376548 ?auto_376545 ?auto_376549 )
      ( MAKE-4CRATE-VERIFY ?auto_376546 ?auto_376547 ?auto_376548 ?auto_376545 ?auto_376549 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376576 - SURFACE
      ?auto_376577 - SURFACE
      ?auto_376578 - SURFACE
      ?auto_376575 - SURFACE
      ?auto_376579 - SURFACE
    )
    :vars
    (
      ?auto_376581 - HOIST
      ?auto_376583 - PLACE
      ?auto_376582 - TRUCK
      ?auto_376580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376581 ?auto_376583 ) ( SURFACE-AT ?auto_376575 ?auto_376583 ) ( CLEAR ?auto_376575 ) ( IS-CRATE ?auto_376579 ) ( not ( = ?auto_376575 ?auto_376579 ) ) ( AVAILABLE ?auto_376581 ) ( IN ?auto_376579 ?auto_376582 ) ( ON ?auto_376575 ?auto_376578 ) ( not ( = ?auto_376578 ?auto_376575 ) ) ( not ( = ?auto_376578 ?auto_376579 ) ) ( TRUCK-AT ?auto_376582 ?auto_376580 ) ( not ( = ?auto_376580 ?auto_376583 ) ) ( ON ?auto_376577 ?auto_376576 ) ( ON ?auto_376578 ?auto_376577 ) ( not ( = ?auto_376576 ?auto_376577 ) ) ( not ( = ?auto_376576 ?auto_376578 ) ) ( not ( = ?auto_376576 ?auto_376575 ) ) ( not ( = ?auto_376576 ?auto_376579 ) ) ( not ( = ?auto_376577 ?auto_376578 ) ) ( not ( = ?auto_376577 ?auto_376575 ) ) ( not ( = ?auto_376577 ?auto_376579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376578 ?auto_376575 ?auto_376579 )
      ( MAKE-4CRATE-VERIFY ?auto_376576 ?auto_376577 ?auto_376578 ?auto_376575 ?auto_376579 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376610 - SURFACE
      ?auto_376611 - SURFACE
      ?auto_376612 - SURFACE
      ?auto_376609 - SURFACE
      ?auto_376613 - SURFACE
    )
    :vars
    (
      ?auto_376614 - HOIST
      ?auto_376618 - PLACE
      ?auto_376616 - TRUCK
      ?auto_376615 - PLACE
      ?auto_376617 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_376614 ?auto_376618 ) ( SURFACE-AT ?auto_376609 ?auto_376618 ) ( CLEAR ?auto_376609 ) ( IS-CRATE ?auto_376613 ) ( not ( = ?auto_376609 ?auto_376613 ) ) ( AVAILABLE ?auto_376614 ) ( ON ?auto_376609 ?auto_376612 ) ( not ( = ?auto_376612 ?auto_376609 ) ) ( not ( = ?auto_376612 ?auto_376613 ) ) ( TRUCK-AT ?auto_376616 ?auto_376615 ) ( not ( = ?auto_376615 ?auto_376618 ) ) ( HOIST-AT ?auto_376617 ?auto_376615 ) ( LIFTING ?auto_376617 ?auto_376613 ) ( not ( = ?auto_376614 ?auto_376617 ) ) ( ON ?auto_376611 ?auto_376610 ) ( ON ?auto_376612 ?auto_376611 ) ( not ( = ?auto_376610 ?auto_376611 ) ) ( not ( = ?auto_376610 ?auto_376612 ) ) ( not ( = ?auto_376610 ?auto_376609 ) ) ( not ( = ?auto_376610 ?auto_376613 ) ) ( not ( = ?auto_376611 ?auto_376612 ) ) ( not ( = ?auto_376611 ?auto_376609 ) ) ( not ( = ?auto_376611 ?auto_376613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376612 ?auto_376609 ?auto_376613 )
      ( MAKE-4CRATE-VERIFY ?auto_376610 ?auto_376611 ?auto_376612 ?auto_376609 ?auto_376613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376648 - SURFACE
      ?auto_376649 - SURFACE
      ?auto_376650 - SURFACE
      ?auto_376647 - SURFACE
      ?auto_376651 - SURFACE
    )
    :vars
    (
      ?auto_376657 - HOIST
      ?auto_376653 - PLACE
      ?auto_376652 - TRUCK
      ?auto_376654 - PLACE
      ?auto_376655 - HOIST
      ?auto_376656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376657 ?auto_376653 ) ( SURFACE-AT ?auto_376647 ?auto_376653 ) ( CLEAR ?auto_376647 ) ( IS-CRATE ?auto_376651 ) ( not ( = ?auto_376647 ?auto_376651 ) ) ( AVAILABLE ?auto_376657 ) ( ON ?auto_376647 ?auto_376650 ) ( not ( = ?auto_376650 ?auto_376647 ) ) ( not ( = ?auto_376650 ?auto_376651 ) ) ( TRUCK-AT ?auto_376652 ?auto_376654 ) ( not ( = ?auto_376654 ?auto_376653 ) ) ( HOIST-AT ?auto_376655 ?auto_376654 ) ( not ( = ?auto_376657 ?auto_376655 ) ) ( AVAILABLE ?auto_376655 ) ( SURFACE-AT ?auto_376651 ?auto_376654 ) ( ON ?auto_376651 ?auto_376656 ) ( CLEAR ?auto_376651 ) ( not ( = ?auto_376647 ?auto_376656 ) ) ( not ( = ?auto_376651 ?auto_376656 ) ) ( not ( = ?auto_376650 ?auto_376656 ) ) ( ON ?auto_376649 ?auto_376648 ) ( ON ?auto_376650 ?auto_376649 ) ( not ( = ?auto_376648 ?auto_376649 ) ) ( not ( = ?auto_376648 ?auto_376650 ) ) ( not ( = ?auto_376648 ?auto_376647 ) ) ( not ( = ?auto_376648 ?auto_376651 ) ) ( not ( = ?auto_376648 ?auto_376656 ) ) ( not ( = ?auto_376649 ?auto_376650 ) ) ( not ( = ?auto_376649 ?auto_376647 ) ) ( not ( = ?auto_376649 ?auto_376651 ) ) ( not ( = ?auto_376649 ?auto_376656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376650 ?auto_376647 ?auto_376651 )
      ( MAKE-4CRATE-VERIFY ?auto_376648 ?auto_376649 ?auto_376650 ?auto_376647 ?auto_376651 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376687 - SURFACE
      ?auto_376688 - SURFACE
      ?auto_376689 - SURFACE
      ?auto_376686 - SURFACE
      ?auto_376690 - SURFACE
    )
    :vars
    (
      ?auto_376692 - HOIST
      ?auto_376695 - PLACE
      ?auto_376693 - PLACE
      ?auto_376696 - HOIST
      ?auto_376691 - SURFACE
      ?auto_376694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376692 ?auto_376695 ) ( SURFACE-AT ?auto_376686 ?auto_376695 ) ( CLEAR ?auto_376686 ) ( IS-CRATE ?auto_376690 ) ( not ( = ?auto_376686 ?auto_376690 ) ) ( AVAILABLE ?auto_376692 ) ( ON ?auto_376686 ?auto_376689 ) ( not ( = ?auto_376689 ?auto_376686 ) ) ( not ( = ?auto_376689 ?auto_376690 ) ) ( not ( = ?auto_376693 ?auto_376695 ) ) ( HOIST-AT ?auto_376696 ?auto_376693 ) ( not ( = ?auto_376692 ?auto_376696 ) ) ( AVAILABLE ?auto_376696 ) ( SURFACE-AT ?auto_376690 ?auto_376693 ) ( ON ?auto_376690 ?auto_376691 ) ( CLEAR ?auto_376690 ) ( not ( = ?auto_376686 ?auto_376691 ) ) ( not ( = ?auto_376690 ?auto_376691 ) ) ( not ( = ?auto_376689 ?auto_376691 ) ) ( TRUCK-AT ?auto_376694 ?auto_376695 ) ( ON ?auto_376688 ?auto_376687 ) ( ON ?auto_376689 ?auto_376688 ) ( not ( = ?auto_376687 ?auto_376688 ) ) ( not ( = ?auto_376687 ?auto_376689 ) ) ( not ( = ?auto_376687 ?auto_376686 ) ) ( not ( = ?auto_376687 ?auto_376690 ) ) ( not ( = ?auto_376687 ?auto_376691 ) ) ( not ( = ?auto_376688 ?auto_376689 ) ) ( not ( = ?auto_376688 ?auto_376686 ) ) ( not ( = ?auto_376688 ?auto_376690 ) ) ( not ( = ?auto_376688 ?auto_376691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376689 ?auto_376686 ?auto_376690 )
      ( MAKE-4CRATE-VERIFY ?auto_376687 ?auto_376688 ?auto_376689 ?auto_376686 ?auto_376690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376726 - SURFACE
      ?auto_376727 - SURFACE
      ?auto_376728 - SURFACE
      ?auto_376725 - SURFACE
      ?auto_376729 - SURFACE
    )
    :vars
    (
      ?auto_376735 - HOIST
      ?auto_376730 - PLACE
      ?auto_376734 - PLACE
      ?auto_376732 - HOIST
      ?auto_376733 - SURFACE
      ?auto_376731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376735 ?auto_376730 ) ( IS-CRATE ?auto_376729 ) ( not ( = ?auto_376725 ?auto_376729 ) ) ( not ( = ?auto_376728 ?auto_376725 ) ) ( not ( = ?auto_376728 ?auto_376729 ) ) ( not ( = ?auto_376734 ?auto_376730 ) ) ( HOIST-AT ?auto_376732 ?auto_376734 ) ( not ( = ?auto_376735 ?auto_376732 ) ) ( AVAILABLE ?auto_376732 ) ( SURFACE-AT ?auto_376729 ?auto_376734 ) ( ON ?auto_376729 ?auto_376733 ) ( CLEAR ?auto_376729 ) ( not ( = ?auto_376725 ?auto_376733 ) ) ( not ( = ?auto_376729 ?auto_376733 ) ) ( not ( = ?auto_376728 ?auto_376733 ) ) ( TRUCK-AT ?auto_376731 ?auto_376730 ) ( SURFACE-AT ?auto_376728 ?auto_376730 ) ( CLEAR ?auto_376728 ) ( LIFTING ?auto_376735 ?auto_376725 ) ( IS-CRATE ?auto_376725 ) ( ON ?auto_376727 ?auto_376726 ) ( ON ?auto_376728 ?auto_376727 ) ( not ( = ?auto_376726 ?auto_376727 ) ) ( not ( = ?auto_376726 ?auto_376728 ) ) ( not ( = ?auto_376726 ?auto_376725 ) ) ( not ( = ?auto_376726 ?auto_376729 ) ) ( not ( = ?auto_376726 ?auto_376733 ) ) ( not ( = ?auto_376727 ?auto_376728 ) ) ( not ( = ?auto_376727 ?auto_376725 ) ) ( not ( = ?auto_376727 ?auto_376729 ) ) ( not ( = ?auto_376727 ?auto_376733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376728 ?auto_376725 ?auto_376729 )
      ( MAKE-4CRATE-VERIFY ?auto_376726 ?auto_376727 ?auto_376728 ?auto_376725 ?auto_376729 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_376765 - SURFACE
      ?auto_376766 - SURFACE
      ?auto_376767 - SURFACE
      ?auto_376764 - SURFACE
      ?auto_376768 - SURFACE
    )
    :vars
    (
      ?auto_376771 - HOIST
      ?auto_376770 - PLACE
      ?auto_376769 - PLACE
      ?auto_376773 - HOIST
      ?auto_376772 - SURFACE
      ?auto_376774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376771 ?auto_376770 ) ( IS-CRATE ?auto_376768 ) ( not ( = ?auto_376764 ?auto_376768 ) ) ( not ( = ?auto_376767 ?auto_376764 ) ) ( not ( = ?auto_376767 ?auto_376768 ) ) ( not ( = ?auto_376769 ?auto_376770 ) ) ( HOIST-AT ?auto_376773 ?auto_376769 ) ( not ( = ?auto_376771 ?auto_376773 ) ) ( AVAILABLE ?auto_376773 ) ( SURFACE-AT ?auto_376768 ?auto_376769 ) ( ON ?auto_376768 ?auto_376772 ) ( CLEAR ?auto_376768 ) ( not ( = ?auto_376764 ?auto_376772 ) ) ( not ( = ?auto_376768 ?auto_376772 ) ) ( not ( = ?auto_376767 ?auto_376772 ) ) ( TRUCK-AT ?auto_376774 ?auto_376770 ) ( SURFACE-AT ?auto_376767 ?auto_376770 ) ( CLEAR ?auto_376767 ) ( IS-CRATE ?auto_376764 ) ( AVAILABLE ?auto_376771 ) ( IN ?auto_376764 ?auto_376774 ) ( ON ?auto_376766 ?auto_376765 ) ( ON ?auto_376767 ?auto_376766 ) ( not ( = ?auto_376765 ?auto_376766 ) ) ( not ( = ?auto_376765 ?auto_376767 ) ) ( not ( = ?auto_376765 ?auto_376764 ) ) ( not ( = ?auto_376765 ?auto_376768 ) ) ( not ( = ?auto_376765 ?auto_376772 ) ) ( not ( = ?auto_376766 ?auto_376767 ) ) ( not ( = ?auto_376766 ?auto_376764 ) ) ( not ( = ?auto_376766 ?auto_376768 ) ) ( not ( = ?auto_376766 ?auto_376772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376767 ?auto_376764 ?auto_376768 )
      ( MAKE-4CRATE-VERIFY ?auto_376765 ?auto_376766 ?auto_376767 ?auto_376764 ?auto_376768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_377265 - SURFACE
      ?auto_377266 - SURFACE
    )
    :vars
    (
      ?auto_377270 - HOIST
      ?auto_377267 - PLACE
      ?auto_377269 - SURFACE
      ?auto_377271 - TRUCK
      ?auto_377273 - PLACE
      ?auto_377272 - HOIST
      ?auto_377268 - SURFACE
      ?auto_377274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377270 ?auto_377267 ) ( SURFACE-AT ?auto_377265 ?auto_377267 ) ( CLEAR ?auto_377265 ) ( IS-CRATE ?auto_377266 ) ( not ( = ?auto_377265 ?auto_377266 ) ) ( AVAILABLE ?auto_377270 ) ( ON ?auto_377265 ?auto_377269 ) ( not ( = ?auto_377269 ?auto_377265 ) ) ( not ( = ?auto_377269 ?auto_377266 ) ) ( TRUCK-AT ?auto_377271 ?auto_377273 ) ( not ( = ?auto_377273 ?auto_377267 ) ) ( HOIST-AT ?auto_377272 ?auto_377273 ) ( not ( = ?auto_377270 ?auto_377272 ) ) ( SURFACE-AT ?auto_377266 ?auto_377273 ) ( ON ?auto_377266 ?auto_377268 ) ( CLEAR ?auto_377266 ) ( not ( = ?auto_377265 ?auto_377268 ) ) ( not ( = ?auto_377266 ?auto_377268 ) ) ( not ( = ?auto_377269 ?auto_377268 ) ) ( LIFTING ?auto_377272 ?auto_377274 ) ( IS-CRATE ?auto_377274 ) ( not ( = ?auto_377265 ?auto_377274 ) ) ( not ( = ?auto_377266 ?auto_377274 ) ) ( not ( = ?auto_377269 ?auto_377274 ) ) ( not ( = ?auto_377268 ?auto_377274 ) ) )
    :subtasks
    ( ( !LOAD ?auto_377272 ?auto_377274 ?auto_377271 ?auto_377273 )
      ( MAKE-1CRATE ?auto_377265 ?auto_377266 )
      ( MAKE-1CRATE-VERIFY ?auto_377265 ?auto_377266 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377425 - SURFACE
      ?auto_377426 - SURFACE
      ?auto_377427 - SURFACE
      ?auto_377424 - SURFACE
      ?auto_377428 - SURFACE
      ?auto_377429 - SURFACE
    )
    :vars
    (
      ?auto_377430 - HOIST
      ?auto_377431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377430 ?auto_377431 ) ( SURFACE-AT ?auto_377428 ?auto_377431 ) ( CLEAR ?auto_377428 ) ( LIFTING ?auto_377430 ?auto_377429 ) ( IS-CRATE ?auto_377429 ) ( not ( = ?auto_377428 ?auto_377429 ) ) ( ON ?auto_377426 ?auto_377425 ) ( ON ?auto_377427 ?auto_377426 ) ( ON ?auto_377424 ?auto_377427 ) ( ON ?auto_377428 ?auto_377424 ) ( not ( = ?auto_377425 ?auto_377426 ) ) ( not ( = ?auto_377425 ?auto_377427 ) ) ( not ( = ?auto_377425 ?auto_377424 ) ) ( not ( = ?auto_377425 ?auto_377428 ) ) ( not ( = ?auto_377425 ?auto_377429 ) ) ( not ( = ?auto_377426 ?auto_377427 ) ) ( not ( = ?auto_377426 ?auto_377424 ) ) ( not ( = ?auto_377426 ?auto_377428 ) ) ( not ( = ?auto_377426 ?auto_377429 ) ) ( not ( = ?auto_377427 ?auto_377424 ) ) ( not ( = ?auto_377427 ?auto_377428 ) ) ( not ( = ?auto_377427 ?auto_377429 ) ) ( not ( = ?auto_377424 ?auto_377428 ) ) ( not ( = ?auto_377424 ?auto_377429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_377428 ?auto_377429 )
      ( MAKE-5CRATE-VERIFY ?auto_377425 ?auto_377426 ?auto_377427 ?auto_377424 ?auto_377428 ?auto_377429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377459 - SURFACE
      ?auto_377460 - SURFACE
      ?auto_377461 - SURFACE
      ?auto_377458 - SURFACE
      ?auto_377462 - SURFACE
      ?auto_377463 - SURFACE
    )
    :vars
    (
      ?auto_377466 - HOIST
      ?auto_377465 - PLACE
      ?auto_377464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377466 ?auto_377465 ) ( SURFACE-AT ?auto_377462 ?auto_377465 ) ( CLEAR ?auto_377462 ) ( IS-CRATE ?auto_377463 ) ( not ( = ?auto_377462 ?auto_377463 ) ) ( TRUCK-AT ?auto_377464 ?auto_377465 ) ( AVAILABLE ?auto_377466 ) ( IN ?auto_377463 ?auto_377464 ) ( ON ?auto_377462 ?auto_377458 ) ( not ( = ?auto_377458 ?auto_377462 ) ) ( not ( = ?auto_377458 ?auto_377463 ) ) ( ON ?auto_377460 ?auto_377459 ) ( ON ?auto_377461 ?auto_377460 ) ( ON ?auto_377458 ?auto_377461 ) ( not ( = ?auto_377459 ?auto_377460 ) ) ( not ( = ?auto_377459 ?auto_377461 ) ) ( not ( = ?auto_377459 ?auto_377458 ) ) ( not ( = ?auto_377459 ?auto_377462 ) ) ( not ( = ?auto_377459 ?auto_377463 ) ) ( not ( = ?auto_377460 ?auto_377461 ) ) ( not ( = ?auto_377460 ?auto_377458 ) ) ( not ( = ?auto_377460 ?auto_377462 ) ) ( not ( = ?auto_377460 ?auto_377463 ) ) ( not ( = ?auto_377461 ?auto_377458 ) ) ( not ( = ?auto_377461 ?auto_377462 ) ) ( not ( = ?auto_377461 ?auto_377463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377458 ?auto_377462 ?auto_377463 )
      ( MAKE-5CRATE-VERIFY ?auto_377459 ?auto_377460 ?auto_377461 ?auto_377458 ?auto_377462 ?auto_377463 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377499 - SURFACE
      ?auto_377500 - SURFACE
      ?auto_377501 - SURFACE
      ?auto_377498 - SURFACE
      ?auto_377502 - SURFACE
      ?auto_377503 - SURFACE
    )
    :vars
    (
      ?auto_377504 - HOIST
      ?auto_377507 - PLACE
      ?auto_377505 - TRUCK
      ?auto_377506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377504 ?auto_377507 ) ( SURFACE-AT ?auto_377502 ?auto_377507 ) ( CLEAR ?auto_377502 ) ( IS-CRATE ?auto_377503 ) ( not ( = ?auto_377502 ?auto_377503 ) ) ( AVAILABLE ?auto_377504 ) ( IN ?auto_377503 ?auto_377505 ) ( ON ?auto_377502 ?auto_377498 ) ( not ( = ?auto_377498 ?auto_377502 ) ) ( not ( = ?auto_377498 ?auto_377503 ) ) ( TRUCK-AT ?auto_377505 ?auto_377506 ) ( not ( = ?auto_377506 ?auto_377507 ) ) ( ON ?auto_377500 ?auto_377499 ) ( ON ?auto_377501 ?auto_377500 ) ( ON ?auto_377498 ?auto_377501 ) ( not ( = ?auto_377499 ?auto_377500 ) ) ( not ( = ?auto_377499 ?auto_377501 ) ) ( not ( = ?auto_377499 ?auto_377498 ) ) ( not ( = ?auto_377499 ?auto_377502 ) ) ( not ( = ?auto_377499 ?auto_377503 ) ) ( not ( = ?auto_377500 ?auto_377501 ) ) ( not ( = ?auto_377500 ?auto_377498 ) ) ( not ( = ?auto_377500 ?auto_377502 ) ) ( not ( = ?auto_377500 ?auto_377503 ) ) ( not ( = ?auto_377501 ?auto_377498 ) ) ( not ( = ?auto_377501 ?auto_377502 ) ) ( not ( = ?auto_377501 ?auto_377503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377498 ?auto_377502 ?auto_377503 )
      ( MAKE-5CRATE-VERIFY ?auto_377499 ?auto_377500 ?auto_377501 ?auto_377498 ?auto_377502 ?auto_377503 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377544 - SURFACE
      ?auto_377545 - SURFACE
      ?auto_377546 - SURFACE
      ?auto_377543 - SURFACE
      ?auto_377547 - SURFACE
      ?auto_377548 - SURFACE
    )
    :vars
    (
      ?auto_377549 - HOIST
      ?auto_377550 - PLACE
      ?auto_377552 - TRUCK
      ?auto_377553 - PLACE
      ?auto_377551 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_377549 ?auto_377550 ) ( SURFACE-AT ?auto_377547 ?auto_377550 ) ( CLEAR ?auto_377547 ) ( IS-CRATE ?auto_377548 ) ( not ( = ?auto_377547 ?auto_377548 ) ) ( AVAILABLE ?auto_377549 ) ( ON ?auto_377547 ?auto_377543 ) ( not ( = ?auto_377543 ?auto_377547 ) ) ( not ( = ?auto_377543 ?auto_377548 ) ) ( TRUCK-AT ?auto_377552 ?auto_377553 ) ( not ( = ?auto_377553 ?auto_377550 ) ) ( HOIST-AT ?auto_377551 ?auto_377553 ) ( LIFTING ?auto_377551 ?auto_377548 ) ( not ( = ?auto_377549 ?auto_377551 ) ) ( ON ?auto_377545 ?auto_377544 ) ( ON ?auto_377546 ?auto_377545 ) ( ON ?auto_377543 ?auto_377546 ) ( not ( = ?auto_377544 ?auto_377545 ) ) ( not ( = ?auto_377544 ?auto_377546 ) ) ( not ( = ?auto_377544 ?auto_377543 ) ) ( not ( = ?auto_377544 ?auto_377547 ) ) ( not ( = ?auto_377544 ?auto_377548 ) ) ( not ( = ?auto_377545 ?auto_377546 ) ) ( not ( = ?auto_377545 ?auto_377543 ) ) ( not ( = ?auto_377545 ?auto_377547 ) ) ( not ( = ?auto_377545 ?auto_377548 ) ) ( not ( = ?auto_377546 ?auto_377543 ) ) ( not ( = ?auto_377546 ?auto_377547 ) ) ( not ( = ?auto_377546 ?auto_377548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377543 ?auto_377547 ?auto_377548 )
      ( MAKE-5CRATE-VERIFY ?auto_377544 ?auto_377545 ?auto_377546 ?auto_377543 ?auto_377547 ?auto_377548 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377594 - SURFACE
      ?auto_377595 - SURFACE
      ?auto_377596 - SURFACE
      ?auto_377593 - SURFACE
      ?auto_377597 - SURFACE
      ?auto_377598 - SURFACE
    )
    :vars
    (
      ?auto_377599 - HOIST
      ?auto_377601 - PLACE
      ?auto_377602 - TRUCK
      ?auto_377604 - PLACE
      ?auto_377603 - HOIST
      ?auto_377600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_377599 ?auto_377601 ) ( SURFACE-AT ?auto_377597 ?auto_377601 ) ( CLEAR ?auto_377597 ) ( IS-CRATE ?auto_377598 ) ( not ( = ?auto_377597 ?auto_377598 ) ) ( AVAILABLE ?auto_377599 ) ( ON ?auto_377597 ?auto_377593 ) ( not ( = ?auto_377593 ?auto_377597 ) ) ( not ( = ?auto_377593 ?auto_377598 ) ) ( TRUCK-AT ?auto_377602 ?auto_377604 ) ( not ( = ?auto_377604 ?auto_377601 ) ) ( HOIST-AT ?auto_377603 ?auto_377604 ) ( not ( = ?auto_377599 ?auto_377603 ) ) ( AVAILABLE ?auto_377603 ) ( SURFACE-AT ?auto_377598 ?auto_377604 ) ( ON ?auto_377598 ?auto_377600 ) ( CLEAR ?auto_377598 ) ( not ( = ?auto_377597 ?auto_377600 ) ) ( not ( = ?auto_377598 ?auto_377600 ) ) ( not ( = ?auto_377593 ?auto_377600 ) ) ( ON ?auto_377595 ?auto_377594 ) ( ON ?auto_377596 ?auto_377595 ) ( ON ?auto_377593 ?auto_377596 ) ( not ( = ?auto_377594 ?auto_377595 ) ) ( not ( = ?auto_377594 ?auto_377596 ) ) ( not ( = ?auto_377594 ?auto_377593 ) ) ( not ( = ?auto_377594 ?auto_377597 ) ) ( not ( = ?auto_377594 ?auto_377598 ) ) ( not ( = ?auto_377594 ?auto_377600 ) ) ( not ( = ?auto_377595 ?auto_377596 ) ) ( not ( = ?auto_377595 ?auto_377593 ) ) ( not ( = ?auto_377595 ?auto_377597 ) ) ( not ( = ?auto_377595 ?auto_377598 ) ) ( not ( = ?auto_377595 ?auto_377600 ) ) ( not ( = ?auto_377596 ?auto_377593 ) ) ( not ( = ?auto_377596 ?auto_377597 ) ) ( not ( = ?auto_377596 ?auto_377598 ) ) ( not ( = ?auto_377596 ?auto_377600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377593 ?auto_377597 ?auto_377598 )
      ( MAKE-5CRATE-VERIFY ?auto_377594 ?auto_377595 ?auto_377596 ?auto_377593 ?auto_377597 ?auto_377598 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377645 - SURFACE
      ?auto_377646 - SURFACE
      ?auto_377647 - SURFACE
      ?auto_377644 - SURFACE
      ?auto_377648 - SURFACE
      ?auto_377649 - SURFACE
    )
    :vars
    (
      ?auto_377654 - HOIST
      ?auto_377655 - PLACE
      ?auto_377650 - PLACE
      ?auto_377652 - HOIST
      ?auto_377653 - SURFACE
      ?auto_377651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377654 ?auto_377655 ) ( SURFACE-AT ?auto_377648 ?auto_377655 ) ( CLEAR ?auto_377648 ) ( IS-CRATE ?auto_377649 ) ( not ( = ?auto_377648 ?auto_377649 ) ) ( AVAILABLE ?auto_377654 ) ( ON ?auto_377648 ?auto_377644 ) ( not ( = ?auto_377644 ?auto_377648 ) ) ( not ( = ?auto_377644 ?auto_377649 ) ) ( not ( = ?auto_377650 ?auto_377655 ) ) ( HOIST-AT ?auto_377652 ?auto_377650 ) ( not ( = ?auto_377654 ?auto_377652 ) ) ( AVAILABLE ?auto_377652 ) ( SURFACE-AT ?auto_377649 ?auto_377650 ) ( ON ?auto_377649 ?auto_377653 ) ( CLEAR ?auto_377649 ) ( not ( = ?auto_377648 ?auto_377653 ) ) ( not ( = ?auto_377649 ?auto_377653 ) ) ( not ( = ?auto_377644 ?auto_377653 ) ) ( TRUCK-AT ?auto_377651 ?auto_377655 ) ( ON ?auto_377646 ?auto_377645 ) ( ON ?auto_377647 ?auto_377646 ) ( ON ?auto_377644 ?auto_377647 ) ( not ( = ?auto_377645 ?auto_377646 ) ) ( not ( = ?auto_377645 ?auto_377647 ) ) ( not ( = ?auto_377645 ?auto_377644 ) ) ( not ( = ?auto_377645 ?auto_377648 ) ) ( not ( = ?auto_377645 ?auto_377649 ) ) ( not ( = ?auto_377645 ?auto_377653 ) ) ( not ( = ?auto_377646 ?auto_377647 ) ) ( not ( = ?auto_377646 ?auto_377644 ) ) ( not ( = ?auto_377646 ?auto_377648 ) ) ( not ( = ?auto_377646 ?auto_377649 ) ) ( not ( = ?auto_377646 ?auto_377653 ) ) ( not ( = ?auto_377647 ?auto_377644 ) ) ( not ( = ?auto_377647 ?auto_377648 ) ) ( not ( = ?auto_377647 ?auto_377649 ) ) ( not ( = ?auto_377647 ?auto_377653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377644 ?auto_377648 ?auto_377649 )
      ( MAKE-5CRATE-VERIFY ?auto_377645 ?auto_377646 ?auto_377647 ?auto_377644 ?auto_377648 ?auto_377649 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377696 - SURFACE
      ?auto_377697 - SURFACE
      ?auto_377698 - SURFACE
      ?auto_377695 - SURFACE
      ?auto_377699 - SURFACE
      ?auto_377700 - SURFACE
    )
    :vars
    (
      ?auto_377703 - HOIST
      ?auto_377702 - PLACE
      ?auto_377701 - PLACE
      ?auto_377704 - HOIST
      ?auto_377705 - SURFACE
      ?auto_377706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377703 ?auto_377702 ) ( IS-CRATE ?auto_377700 ) ( not ( = ?auto_377699 ?auto_377700 ) ) ( not ( = ?auto_377695 ?auto_377699 ) ) ( not ( = ?auto_377695 ?auto_377700 ) ) ( not ( = ?auto_377701 ?auto_377702 ) ) ( HOIST-AT ?auto_377704 ?auto_377701 ) ( not ( = ?auto_377703 ?auto_377704 ) ) ( AVAILABLE ?auto_377704 ) ( SURFACE-AT ?auto_377700 ?auto_377701 ) ( ON ?auto_377700 ?auto_377705 ) ( CLEAR ?auto_377700 ) ( not ( = ?auto_377699 ?auto_377705 ) ) ( not ( = ?auto_377700 ?auto_377705 ) ) ( not ( = ?auto_377695 ?auto_377705 ) ) ( TRUCK-AT ?auto_377706 ?auto_377702 ) ( SURFACE-AT ?auto_377695 ?auto_377702 ) ( CLEAR ?auto_377695 ) ( LIFTING ?auto_377703 ?auto_377699 ) ( IS-CRATE ?auto_377699 ) ( ON ?auto_377697 ?auto_377696 ) ( ON ?auto_377698 ?auto_377697 ) ( ON ?auto_377695 ?auto_377698 ) ( not ( = ?auto_377696 ?auto_377697 ) ) ( not ( = ?auto_377696 ?auto_377698 ) ) ( not ( = ?auto_377696 ?auto_377695 ) ) ( not ( = ?auto_377696 ?auto_377699 ) ) ( not ( = ?auto_377696 ?auto_377700 ) ) ( not ( = ?auto_377696 ?auto_377705 ) ) ( not ( = ?auto_377697 ?auto_377698 ) ) ( not ( = ?auto_377697 ?auto_377695 ) ) ( not ( = ?auto_377697 ?auto_377699 ) ) ( not ( = ?auto_377697 ?auto_377700 ) ) ( not ( = ?auto_377697 ?auto_377705 ) ) ( not ( = ?auto_377698 ?auto_377695 ) ) ( not ( = ?auto_377698 ?auto_377699 ) ) ( not ( = ?auto_377698 ?auto_377700 ) ) ( not ( = ?auto_377698 ?auto_377705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377695 ?auto_377699 ?auto_377700 )
      ( MAKE-5CRATE-VERIFY ?auto_377696 ?auto_377697 ?auto_377698 ?auto_377695 ?auto_377699 ?auto_377700 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_377747 - SURFACE
      ?auto_377748 - SURFACE
      ?auto_377749 - SURFACE
      ?auto_377746 - SURFACE
      ?auto_377750 - SURFACE
      ?auto_377751 - SURFACE
    )
    :vars
    (
      ?auto_377754 - HOIST
      ?auto_377756 - PLACE
      ?auto_377752 - PLACE
      ?auto_377753 - HOIST
      ?auto_377755 - SURFACE
      ?auto_377757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_377754 ?auto_377756 ) ( IS-CRATE ?auto_377751 ) ( not ( = ?auto_377750 ?auto_377751 ) ) ( not ( = ?auto_377746 ?auto_377750 ) ) ( not ( = ?auto_377746 ?auto_377751 ) ) ( not ( = ?auto_377752 ?auto_377756 ) ) ( HOIST-AT ?auto_377753 ?auto_377752 ) ( not ( = ?auto_377754 ?auto_377753 ) ) ( AVAILABLE ?auto_377753 ) ( SURFACE-AT ?auto_377751 ?auto_377752 ) ( ON ?auto_377751 ?auto_377755 ) ( CLEAR ?auto_377751 ) ( not ( = ?auto_377750 ?auto_377755 ) ) ( not ( = ?auto_377751 ?auto_377755 ) ) ( not ( = ?auto_377746 ?auto_377755 ) ) ( TRUCK-AT ?auto_377757 ?auto_377756 ) ( SURFACE-AT ?auto_377746 ?auto_377756 ) ( CLEAR ?auto_377746 ) ( IS-CRATE ?auto_377750 ) ( AVAILABLE ?auto_377754 ) ( IN ?auto_377750 ?auto_377757 ) ( ON ?auto_377748 ?auto_377747 ) ( ON ?auto_377749 ?auto_377748 ) ( ON ?auto_377746 ?auto_377749 ) ( not ( = ?auto_377747 ?auto_377748 ) ) ( not ( = ?auto_377747 ?auto_377749 ) ) ( not ( = ?auto_377747 ?auto_377746 ) ) ( not ( = ?auto_377747 ?auto_377750 ) ) ( not ( = ?auto_377747 ?auto_377751 ) ) ( not ( = ?auto_377747 ?auto_377755 ) ) ( not ( = ?auto_377748 ?auto_377749 ) ) ( not ( = ?auto_377748 ?auto_377746 ) ) ( not ( = ?auto_377748 ?auto_377750 ) ) ( not ( = ?auto_377748 ?auto_377751 ) ) ( not ( = ?auto_377748 ?auto_377755 ) ) ( not ( = ?auto_377749 ?auto_377746 ) ) ( not ( = ?auto_377749 ?auto_377750 ) ) ( not ( = ?auto_377749 ?auto_377751 ) ) ( not ( = ?auto_377749 ?auto_377755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_377746 ?auto_377750 ?auto_377751 )
      ( MAKE-5CRATE-VERIFY ?auto_377747 ?auto_377748 ?auto_377749 ?auto_377746 ?auto_377750 ?auto_377751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_378738 - SURFACE
      ?auto_378739 - SURFACE
    )
    :vars
    (
      ?auto_378743 - HOIST
      ?auto_378746 - PLACE
      ?auto_378740 - SURFACE
      ?auto_378741 - PLACE
      ?auto_378745 - HOIST
      ?auto_378742 - SURFACE
      ?auto_378744 - TRUCK
      ?auto_378747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378743 ?auto_378746 ) ( SURFACE-AT ?auto_378738 ?auto_378746 ) ( CLEAR ?auto_378738 ) ( IS-CRATE ?auto_378739 ) ( not ( = ?auto_378738 ?auto_378739 ) ) ( ON ?auto_378738 ?auto_378740 ) ( not ( = ?auto_378740 ?auto_378738 ) ) ( not ( = ?auto_378740 ?auto_378739 ) ) ( not ( = ?auto_378741 ?auto_378746 ) ) ( HOIST-AT ?auto_378745 ?auto_378741 ) ( not ( = ?auto_378743 ?auto_378745 ) ) ( AVAILABLE ?auto_378745 ) ( SURFACE-AT ?auto_378739 ?auto_378741 ) ( ON ?auto_378739 ?auto_378742 ) ( CLEAR ?auto_378739 ) ( not ( = ?auto_378738 ?auto_378742 ) ) ( not ( = ?auto_378739 ?auto_378742 ) ) ( not ( = ?auto_378740 ?auto_378742 ) ) ( TRUCK-AT ?auto_378744 ?auto_378746 ) ( LIFTING ?auto_378743 ?auto_378747 ) ( IS-CRATE ?auto_378747 ) ( not ( = ?auto_378738 ?auto_378747 ) ) ( not ( = ?auto_378739 ?auto_378747 ) ) ( not ( = ?auto_378740 ?auto_378747 ) ) ( not ( = ?auto_378742 ?auto_378747 ) ) )
    :subtasks
    ( ( !LOAD ?auto_378743 ?auto_378747 ?auto_378744 ?auto_378746 )
      ( MAKE-1CRATE ?auto_378738 ?auto_378739 )
      ( MAKE-1CRATE-VERIFY ?auto_378738 ?auto_378739 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378954 - SURFACE
      ?auto_378955 - SURFACE
      ?auto_378956 - SURFACE
      ?auto_378953 - SURFACE
      ?auto_378957 - SURFACE
      ?auto_378959 - SURFACE
      ?auto_378958 - SURFACE
    )
    :vars
    (
      ?auto_378960 - HOIST
      ?auto_378961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378960 ?auto_378961 ) ( SURFACE-AT ?auto_378959 ?auto_378961 ) ( CLEAR ?auto_378959 ) ( LIFTING ?auto_378960 ?auto_378958 ) ( IS-CRATE ?auto_378958 ) ( not ( = ?auto_378959 ?auto_378958 ) ) ( ON ?auto_378955 ?auto_378954 ) ( ON ?auto_378956 ?auto_378955 ) ( ON ?auto_378953 ?auto_378956 ) ( ON ?auto_378957 ?auto_378953 ) ( ON ?auto_378959 ?auto_378957 ) ( not ( = ?auto_378954 ?auto_378955 ) ) ( not ( = ?auto_378954 ?auto_378956 ) ) ( not ( = ?auto_378954 ?auto_378953 ) ) ( not ( = ?auto_378954 ?auto_378957 ) ) ( not ( = ?auto_378954 ?auto_378959 ) ) ( not ( = ?auto_378954 ?auto_378958 ) ) ( not ( = ?auto_378955 ?auto_378956 ) ) ( not ( = ?auto_378955 ?auto_378953 ) ) ( not ( = ?auto_378955 ?auto_378957 ) ) ( not ( = ?auto_378955 ?auto_378959 ) ) ( not ( = ?auto_378955 ?auto_378958 ) ) ( not ( = ?auto_378956 ?auto_378953 ) ) ( not ( = ?auto_378956 ?auto_378957 ) ) ( not ( = ?auto_378956 ?auto_378959 ) ) ( not ( = ?auto_378956 ?auto_378958 ) ) ( not ( = ?auto_378953 ?auto_378957 ) ) ( not ( = ?auto_378953 ?auto_378959 ) ) ( not ( = ?auto_378953 ?auto_378958 ) ) ( not ( = ?auto_378957 ?auto_378959 ) ) ( not ( = ?auto_378957 ?auto_378958 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_378959 ?auto_378958 )
      ( MAKE-6CRATE-VERIFY ?auto_378954 ?auto_378955 ?auto_378956 ?auto_378953 ?auto_378957 ?auto_378959 ?auto_378958 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378998 - SURFACE
      ?auto_378999 - SURFACE
      ?auto_379000 - SURFACE
      ?auto_378997 - SURFACE
      ?auto_379001 - SURFACE
      ?auto_379003 - SURFACE
      ?auto_379002 - SURFACE
    )
    :vars
    (
      ?auto_379006 - HOIST
      ?auto_379005 - PLACE
      ?auto_379004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379006 ?auto_379005 ) ( SURFACE-AT ?auto_379003 ?auto_379005 ) ( CLEAR ?auto_379003 ) ( IS-CRATE ?auto_379002 ) ( not ( = ?auto_379003 ?auto_379002 ) ) ( TRUCK-AT ?auto_379004 ?auto_379005 ) ( AVAILABLE ?auto_379006 ) ( IN ?auto_379002 ?auto_379004 ) ( ON ?auto_379003 ?auto_379001 ) ( not ( = ?auto_379001 ?auto_379003 ) ) ( not ( = ?auto_379001 ?auto_379002 ) ) ( ON ?auto_378999 ?auto_378998 ) ( ON ?auto_379000 ?auto_378999 ) ( ON ?auto_378997 ?auto_379000 ) ( ON ?auto_379001 ?auto_378997 ) ( not ( = ?auto_378998 ?auto_378999 ) ) ( not ( = ?auto_378998 ?auto_379000 ) ) ( not ( = ?auto_378998 ?auto_378997 ) ) ( not ( = ?auto_378998 ?auto_379001 ) ) ( not ( = ?auto_378998 ?auto_379003 ) ) ( not ( = ?auto_378998 ?auto_379002 ) ) ( not ( = ?auto_378999 ?auto_379000 ) ) ( not ( = ?auto_378999 ?auto_378997 ) ) ( not ( = ?auto_378999 ?auto_379001 ) ) ( not ( = ?auto_378999 ?auto_379003 ) ) ( not ( = ?auto_378999 ?auto_379002 ) ) ( not ( = ?auto_379000 ?auto_378997 ) ) ( not ( = ?auto_379000 ?auto_379001 ) ) ( not ( = ?auto_379000 ?auto_379003 ) ) ( not ( = ?auto_379000 ?auto_379002 ) ) ( not ( = ?auto_378997 ?auto_379001 ) ) ( not ( = ?auto_378997 ?auto_379003 ) ) ( not ( = ?auto_378997 ?auto_379002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379001 ?auto_379003 ?auto_379002 )
      ( MAKE-6CRATE-VERIFY ?auto_378998 ?auto_378999 ?auto_379000 ?auto_378997 ?auto_379001 ?auto_379003 ?auto_379002 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379049 - SURFACE
      ?auto_379050 - SURFACE
      ?auto_379051 - SURFACE
      ?auto_379048 - SURFACE
      ?auto_379052 - SURFACE
      ?auto_379054 - SURFACE
      ?auto_379053 - SURFACE
    )
    :vars
    (
      ?auto_379056 - HOIST
      ?auto_379057 - PLACE
      ?auto_379058 - TRUCK
      ?auto_379055 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_379056 ?auto_379057 ) ( SURFACE-AT ?auto_379054 ?auto_379057 ) ( CLEAR ?auto_379054 ) ( IS-CRATE ?auto_379053 ) ( not ( = ?auto_379054 ?auto_379053 ) ) ( AVAILABLE ?auto_379056 ) ( IN ?auto_379053 ?auto_379058 ) ( ON ?auto_379054 ?auto_379052 ) ( not ( = ?auto_379052 ?auto_379054 ) ) ( not ( = ?auto_379052 ?auto_379053 ) ) ( TRUCK-AT ?auto_379058 ?auto_379055 ) ( not ( = ?auto_379055 ?auto_379057 ) ) ( ON ?auto_379050 ?auto_379049 ) ( ON ?auto_379051 ?auto_379050 ) ( ON ?auto_379048 ?auto_379051 ) ( ON ?auto_379052 ?auto_379048 ) ( not ( = ?auto_379049 ?auto_379050 ) ) ( not ( = ?auto_379049 ?auto_379051 ) ) ( not ( = ?auto_379049 ?auto_379048 ) ) ( not ( = ?auto_379049 ?auto_379052 ) ) ( not ( = ?auto_379049 ?auto_379054 ) ) ( not ( = ?auto_379049 ?auto_379053 ) ) ( not ( = ?auto_379050 ?auto_379051 ) ) ( not ( = ?auto_379050 ?auto_379048 ) ) ( not ( = ?auto_379050 ?auto_379052 ) ) ( not ( = ?auto_379050 ?auto_379054 ) ) ( not ( = ?auto_379050 ?auto_379053 ) ) ( not ( = ?auto_379051 ?auto_379048 ) ) ( not ( = ?auto_379051 ?auto_379052 ) ) ( not ( = ?auto_379051 ?auto_379054 ) ) ( not ( = ?auto_379051 ?auto_379053 ) ) ( not ( = ?auto_379048 ?auto_379052 ) ) ( not ( = ?auto_379048 ?auto_379054 ) ) ( not ( = ?auto_379048 ?auto_379053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379052 ?auto_379054 ?auto_379053 )
      ( MAKE-6CRATE-VERIFY ?auto_379049 ?auto_379050 ?auto_379051 ?auto_379048 ?auto_379052 ?auto_379054 ?auto_379053 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379106 - SURFACE
      ?auto_379107 - SURFACE
      ?auto_379108 - SURFACE
      ?auto_379105 - SURFACE
      ?auto_379109 - SURFACE
      ?auto_379111 - SURFACE
      ?auto_379110 - SURFACE
    )
    :vars
    (
      ?auto_379116 - HOIST
      ?auto_379113 - PLACE
      ?auto_379115 - TRUCK
      ?auto_379114 - PLACE
      ?auto_379112 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_379116 ?auto_379113 ) ( SURFACE-AT ?auto_379111 ?auto_379113 ) ( CLEAR ?auto_379111 ) ( IS-CRATE ?auto_379110 ) ( not ( = ?auto_379111 ?auto_379110 ) ) ( AVAILABLE ?auto_379116 ) ( ON ?auto_379111 ?auto_379109 ) ( not ( = ?auto_379109 ?auto_379111 ) ) ( not ( = ?auto_379109 ?auto_379110 ) ) ( TRUCK-AT ?auto_379115 ?auto_379114 ) ( not ( = ?auto_379114 ?auto_379113 ) ) ( HOIST-AT ?auto_379112 ?auto_379114 ) ( LIFTING ?auto_379112 ?auto_379110 ) ( not ( = ?auto_379116 ?auto_379112 ) ) ( ON ?auto_379107 ?auto_379106 ) ( ON ?auto_379108 ?auto_379107 ) ( ON ?auto_379105 ?auto_379108 ) ( ON ?auto_379109 ?auto_379105 ) ( not ( = ?auto_379106 ?auto_379107 ) ) ( not ( = ?auto_379106 ?auto_379108 ) ) ( not ( = ?auto_379106 ?auto_379105 ) ) ( not ( = ?auto_379106 ?auto_379109 ) ) ( not ( = ?auto_379106 ?auto_379111 ) ) ( not ( = ?auto_379106 ?auto_379110 ) ) ( not ( = ?auto_379107 ?auto_379108 ) ) ( not ( = ?auto_379107 ?auto_379105 ) ) ( not ( = ?auto_379107 ?auto_379109 ) ) ( not ( = ?auto_379107 ?auto_379111 ) ) ( not ( = ?auto_379107 ?auto_379110 ) ) ( not ( = ?auto_379108 ?auto_379105 ) ) ( not ( = ?auto_379108 ?auto_379109 ) ) ( not ( = ?auto_379108 ?auto_379111 ) ) ( not ( = ?auto_379108 ?auto_379110 ) ) ( not ( = ?auto_379105 ?auto_379109 ) ) ( not ( = ?auto_379105 ?auto_379111 ) ) ( not ( = ?auto_379105 ?auto_379110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379109 ?auto_379111 ?auto_379110 )
      ( MAKE-6CRATE-VERIFY ?auto_379106 ?auto_379107 ?auto_379108 ?auto_379105 ?auto_379109 ?auto_379111 ?auto_379110 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379169 - SURFACE
      ?auto_379170 - SURFACE
      ?auto_379171 - SURFACE
      ?auto_379168 - SURFACE
      ?auto_379172 - SURFACE
      ?auto_379174 - SURFACE
      ?auto_379173 - SURFACE
    )
    :vars
    (
      ?auto_379175 - HOIST
      ?auto_379176 - PLACE
      ?auto_379180 - TRUCK
      ?auto_379177 - PLACE
      ?auto_379178 - HOIST
      ?auto_379179 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_379175 ?auto_379176 ) ( SURFACE-AT ?auto_379174 ?auto_379176 ) ( CLEAR ?auto_379174 ) ( IS-CRATE ?auto_379173 ) ( not ( = ?auto_379174 ?auto_379173 ) ) ( AVAILABLE ?auto_379175 ) ( ON ?auto_379174 ?auto_379172 ) ( not ( = ?auto_379172 ?auto_379174 ) ) ( not ( = ?auto_379172 ?auto_379173 ) ) ( TRUCK-AT ?auto_379180 ?auto_379177 ) ( not ( = ?auto_379177 ?auto_379176 ) ) ( HOIST-AT ?auto_379178 ?auto_379177 ) ( not ( = ?auto_379175 ?auto_379178 ) ) ( AVAILABLE ?auto_379178 ) ( SURFACE-AT ?auto_379173 ?auto_379177 ) ( ON ?auto_379173 ?auto_379179 ) ( CLEAR ?auto_379173 ) ( not ( = ?auto_379174 ?auto_379179 ) ) ( not ( = ?auto_379173 ?auto_379179 ) ) ( not ( = ?auto_379172 ?auto_379179 ) ) ( ON ?auto_379170 ?auto_379169 ) ( ON ?auto_379171 ?auto_379170 ) ( ON ?auto_379168 ?auto_379171 ) ( ON ?auto_379172 ?auto_379168 ) ( not ( = ?auto_379169 ?auto_379170 ) ) ( not ( = ?auto_379169 ?auto_379171 ) ) ( not ( = ?auto_379169 ?auto_379168 ) ) ( not ( = ?auto_379169 ?auto_379172 ) ) ( not ( = ?auto_379169 ?auto_379174 ) ) ( not ( = ?auto_379169 ?auto_379173 ) ) ( not ( = ?auto_379169 ?auto_379179 ) ) ( not ( = ?auto_379170 ?auto_379171 ) ) ( not ( = ?auto_379170 ?auto_379168 ) ) ( not ( = ?auto_379170 ?auto_379172 ) ) ( not ( = ?auto_379170 ?auto_379174 ) ) ( not ( = ?auto_379170 ?auto_379173 ) ) ( not ( = ?auto_379170 ?auto_379179 ) ) ( not ( = ?auto_379171 ?auto_379168 ) ) ( not ( = ?auto_379171 ?auto_379172 ) ) ( not ( = ?auto_379171 ?auto_379174 ) ) ( not ( = ?auto_379171 ?auto_379173 ) ) ( not ( = ?auto_379171 ?auto_379179 ) ) ( not ( = ?auto_379168 ?auto_379172 ) ) ( not ( = ?auto_379168 ?auto_379174 ) ) ( not ( = ?auto_379168 ?auto_379173 ) ) ( not ( = ?auto_379168 ?auto_379179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379172 ?auto_379174 ?auto_379173 )
      ( MAKE-6CRATE-VERIFY ?auto_379169 ?auto_379170 ?auto_379171 ?auto_379168 ?auto_379172 ?auto_379174 ?auto_379173 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379233 - SURFACE
      ?auto_379234 - SURFACE
      ?auto_379235 - SURFACE
      ?auto_379232 - SURFACE
      ?auto_379236 - SURFACE
      ?auto_379238 - SURFACE
      ?auto_379237 - SURFACE
    )
    :vars
    (
      ?auto_379240 - HOIST
      ?auto_379242 - PLACE
      ?auto_379241 - PLACE
      ?auto_379239 - HOIST
      ?auto_379243 - SURFACE
      ?auto_379244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379240 ?auto_379242 ) ( SURFACE-AT ?auto_379238 ?auto_379242 ) ( CLEAR ?auto_379238 ) ( IS-CRATE ?auto_379237 ) ( not ( = ?auto_379238 ?auto_379237 ) ) ( AVAILABLE ?auto_379240 ) ( ON ?auto_379238 ?auto_379236 ) ( not ( = ?auto_379236 ?auto_379238 ) ) ( not ( = ?auto_379236 ?auto_379237 ) ) ( not ( = ?auto_379241 ?auto_379242 ) ) ( HOIST-AT ?auto_379239 ?auto_379241 ) ( not ( = ?auto_379240 ?auto_379239 ) ) ( AVAILABLE ?auto_379239 ) ( SURFACE-AT ?auto_379237 ?auto_379241 ) ( ON ?auto_379237 ?auto_379243 ) ( CLEAR ?auto_379237 ) ( not ( = ?auto_379238 ?auto_379243 ) ) ( not ( = ?auto_379237 ?auto_379243 ) ) ( not ( = ?auto_379236 ?auto_379243 ) ) ( TRUCK-AT ?auto_379244 ?auto_379242 ) ( ON ?auto_379234 ?auto_379233 ) ( ON ?auto_379235 ?auto_379234 ) ( ON ?auto_379232 ?auto_379235 ) ( ON ?auto_379236 ?auto_379232 ) ( not ( = ?auto_379233 ?auto_379234 ) ) ( not ( = ?auto_379233 ?auto_379235 ) ) ( not ( = ?auto_379233 ?auto_379232 ) ) ( not ( = ?auto_379233 ?auto_379236 ) ) ( not ( = ?auto_379233 ?auto_379238 ) ) ( not ( = ?auto_379233 ?auto_379237 ) ) ( not ( = ?auto_379233 ?auto_379243 ) ) ( not ( = ?auto_379234 ?auto_379235 ) ) ( not ( = ?auto_379234 ?auto_379232 ) ) ( not ( = ?auto_379234 ?auto_379236 ) ) ( not ( = ?auto_379234 ?auto_379238 ) ) ( not ( = ?auto_379234 ?auto_379237 ) ) ( not ( = ?auto_379234 ?auto_379243 ) ) ( not ( = ?auto_379235 ?auto_379232 ) ) ( not ( = ?auto_379235 ?auto_379236 ) ) ( not ( = ?auto_379235 ?auto_379238 ) ) ( not ( = ?auto_379235 ?auto_379237 ) ) ( not ( = ?auto_379235 ?auto_379243 ) ) ( not ( = ?auto_379232 ?auto_379236 ) ) ( not ( = ?auto_379232 ?auto_379238 ) ) ( not ( = ?auto_379232 ?auto_379237 ) ) ( not ( = ?auto_379232 ?auto_379243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379236 ?auto_379238 ?auto_379237 )
      ( MAKE-6CRATE-VERIFY ?auto_379233 ?auto_379234 ?auto_379235 ?auto_379232 ?auto_379236 ?auto_379238 ?auto_379237 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379297 - SURFACE
      ?auto_379298 - SURFACE
      ?auto_379299 - SURFACE
      ?auto_379296 - SURFACE
      ?auto_379300 - SURFACE
      ?auto_379302 - SURFACE
      ?auto_379301 - SURFACE
    )
    :vars
    (
      ?auto_379307 - HOIST
      ?auto_379308 - PLACE
      ?auto_379305 - PLACE
      ?auto_379303 - HOIST
      ?auto_379304 - SURFACE
      ?auto_379306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379307 ?auto_379308 ) ( IS-CRATE ?auto_379301 ) ( not ( = ?auto_379302 ?auto_379301 ) ) ( not ( = ?auto_379300 ?auto_379302 ) ) ( not ( = ?auto_379300 ?auto_379301 ) ) ( not ( = ?auto_379305 ?auto_379308 ) ) ( HOIST-AT ?auto_379303 ?auto_379305 ) ( not ( = ?auto_379307 ?auto_379303 ) ) ( AVAILABLE ?auto_379303 ) ( SURFACE-AT ?auto_379301 ?auto_379305 ) ( ON ?auto_379301 ?auto_379304 ) ( CLEAR ?auto_379301 ) ( not ( = ?auto_379302 ?auto_379304 ) ) ( not ( = ?auto_379301 ?auto_379304 ) ) ( not ( = ?auto_379300 ?auto_379304 ) ) ( TRUCK-AT ?auto_379306 ?auto_379308 ) ( SURFACE-AT ?auto_379300 ?auto_379308 ) ( CLEAR ?auto_379300 ) ( LIFTING ?auto_379307 ?auto_379302 ) ( IS-CRATE ?auto_379302 ) ( ON ?auto_379298 ?auto_379297 ) ( ON ?auto_379299 ?auto_379298 ) ( ON ?auto_379296 ?auto_379299 ) ( ON ?auto_379300 ?auto_379296 ) ( not ( = ?auto_379297 ?auto_379298 ) ) ( not ( = ?auto_379297 ?auto_379299 ) ) ( not ( = ?auto_379297 ?auto_379296 ) ) ( not ( = ?auto_379297 ?auto_379300 ) ) ( not ( = ?auto_379297 ?auto_379302 ) ) ( not ( = ?auto_379297 ?auto_379301 ) ) ( not ( = ?auto_379297 ?auto_379304 ) ) ( not ( = ?auto_379298 ?auto_379299 ) ) ( not ( = ?auto_379298 ?auto_379296 ) ) ( not ( = ?auto_379298 ?auto_379300 ) ) ( not ( = ?auto_379298 ?auto_379302 ) ) ( not ( = ?auto_379298 ?auto_379301 ) ) ( not ( = ?auto_379298 ?auto_379304 ) ) ( not ( = ?auto_379299 ?auto_379296 ) ) ( not ( = ?auto_379299 ?auto_379300 ) ) ( not ( = ?auto_379299 ?auto_379302 ) ) ( not ( = ?auto_379299 ?auto_379301 ) ) ( not ( = ?auto_379299 ?auto_379304 ) ) ( not ( = ?auto_379296 ?auto_379300 ) ) ( not ( = ?auto_379296 ?auto_379302 ) ) ( not ( = ?auto_379296 ?auto_379301 ) ) ( not ( = ?auto_379296 ?auto_379304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379300 ?auto_379302 ?auto_379301 )
      ( MAKE-6CRATE-VERIFY ?auto_379297 ?auto_379298 ?auto_379299 ?auto_379296 ?auto_379300 ?auto_379302 ?auto_379301 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_379361 - SURFACE
      ?auto_379362 - SURFACE
      ?auto_379363 - SURFACE
      ?auto_379360 - SURFACE
      ?auto_379364 - SURFACE
      ?auto_379366 - SURFACE
      ?auto_379365 - SURFACE
    )
    :vars
    (
      ?auto_379372 - HOIST
      ?auto_379367 - PLACE
      ?auto_379369 - PLACE
      ?auto_379368 - HOIST
      ?auto_379371 - SURFACE
      ?auto_379370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_379372 ?auto_379367 ) ( IS-CRATE ?auto_379365 ) ( not ( = ?auto_379366 ?auto_379365 ) ) ( not ( = ?auto_379364 ?auto_379366 ) ) ( not ( = ?auto_379364 ?auto_379365 ) ) ( not ( = ?auto_379369 ?auto_379367 ) ) ( HOIST-AT ?auto_379368 ?auto_379369 ) ( not ( = ?auto_379372 ?auto_379368 ) ) ( AVAILABLE ?auto_379368 ) ( SURFACE-AT ?auto_379365 ?auto_379369 ) ( ON ?auto_379365 ?auto_379371 ) ( CLEAR ?auto_379365 ) ( not ( = ?auto_379366 ?auto_379371 ) ) ( not ( = ?auto_379365 ?auto_379371 ) ) ( not ( = ?auto_379364 ?auto_379371 ) ) ( TRUCK-AT ?auto_379370 ?auto_379367 ) ( SURFACE-AT ?auto_379364 ?auto_379367 ) ( CLEAR ?auto_379364 ) ( IS-CRATE ?auto_379366 ) ( AVAILABLE ?auto_379372 ) ( IN ?auto_379366 ?auto_379370 ) ( ON ?auto_379362 ?auto_379361 ) ( ON ?auto_379363 ?auto_379362 ) ( ON ?auto_379360 ?auto_379363 ) ( ON ?auto_379364 ?auto_379360 ) ( not ( = ?auto_379361 ?auto_379362 ) ) ( not ( = ?auto_379361 ?auto_379363 ) ) ( not ( = ?auto_379361 ?auto_379360 ) ) ( not ( = ?auto_379361 ?auto_379364 ) ) ( not ( = ?auto_379361 ?auto_379366 ) ) ( not ( = ?auto_379361 ?auto_379365 ) ) ( not ( = ?auto_379361 ?auto_379371 ) ) ( not ( = ?auto_379362 ?auto_379363 ) ) ( not ( = ?auto_379362 ?auto_379360 ) ) ( not ( = ?auto_379362 ?auto_379364 ) ) ( not ( = ?auto_379362 ?auto_379366 ) ) ( not ( = ?auto_379362 ?auto_379365 ) ) ( not ( = ?auto_379362 ?auto_379371 ) ) ( not ( = ?auto_379363 ?auto_379360 ) ) ( not ( = ?auto_379363 ?auto_379364 ) ) ( not ( = ?auto_379363 ?auto_379366 ) ) ( not ( = ?auto_379363 ?auto_379365 ) ) ( not ( = ?auto_379363 ?auto_379371 ) ) ( not ( = ?auto_379360 ?auto_379364 ) ) ( not ( = ?auto_379360 ?auto_379366 ) ) ( not ( = ?auto_379360 ?auto_379365 ) ) ( not ( = ?auto_379360 ?auto_379371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_379364 ?auto_379366 ?auto_379365 )
      ( MAKE-6CRATE-VERIFY ?auto_379361 ?auto_379362 ?auto_379363 ?auto_379360 ?auto_379364 ?auto_379366 ?auto_379365 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381317 - SURFACE
      ?auto_381318 - SURFACE
      ?auto_381319 - SURFACE
      ?auto_381316 - SURFACE
      ?auto_381320 - SURFACE
      ?auto_381322 - SURFACE
      ?auto_381321 - SURFACE
      ?auto_381323 - SURFACE
    )
    :vars
    (
      ?auto_381325 - HOIST
      ?auto_381324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381325 ?auto_381324 ) ( SURFACE-AT ?auto_381321 ?auto_381324 ) ( CLEAR ?auto_381321 ) ( LIFTING ?auto_381325 ?auto_381323 ) ( IS-CRATE ?auto_381323 ) ( not ( = ?auto_381321 ?auto_381323 ) ) ( ON ?auto_381318 ?auto_381317 ) ( ON ?auto_381319 ?auto_381318 ) ( ON ?auto_381316 ?auto_381319 ) ( ON ?auto_381320 ?auto_381316 ) ( ON ?auto_381322 ?auto_381320 ) ( ON ?auto_381321 ?auto_381322 ) ( not ( = ?auto_381317 ?auto_381318 ) ) ( not ( = ?auto_381317 ?auto_381319 ) ) ( not ( = ?auto_381317 ?auto_381316 ) ) ( not ( = ?auto_381317 ?auto_381320 ) ) ( not ( = ?auto_381317 ?auto_381322 ) ) ( not ( = ?auto_381317 ?auto_381321 ) ) ( not ( = ?auto_381317 ?auto_381323 ) ) ( not ( = ?auto_381318 ?auto_381319 ) ) ( not ( = ?auto_381318 ?auto_381316 ) ) ( not ( = ?auto_381318 ?auto_381320 ) ) ( not ( = ?auto_381318 ?auto_381322 ) ) ( not ( = ?auto_381318 ?auto_381321 ) ) ( not ( = ?auto_381318 ?auto_381323 ) ) ( not ( = ?auto_381319 ?auto_381316 ) ) ( not ( = ?auto_381319 ?auto_381320 ) ) ( not ( = ?auto_381319 ?auto_381322 ) ) ( not ( = ?auto_381319 ?auto_381321 ) ) ( not ( = ?auto_381319 ?auto_381323 ) ) ( not ( = ?auto_381316 ?auto_381320 ) ) ( not ( = ?auto_381316 ?auto_381322 ) ) ( not ( = ?auto_381316 ?auto_381321 ) ) ( not ( = ?auto_381316 ?auto_381323 ) ) ( not ( = ?auto_381320 ?auto_381322 ) ) ( not ( = ?auto_381320 ?auto_381321 ) ) ( not ( = ?auto_381320 ?auto_381323 ) ) ( not ( = ?auto_381322 ?auto_381321 ) ) ( not ( = ?auto_381322 ?auto_381323 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_381321 ?auto_381323 )
      ( MAKE-7CRATE-VERIFY ?auto_381317 ?auto_381318 ?auto_381319 ?auto_381316 ?auto_381320 ?auto_381322 ?auto_381321 ?auto_381323 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381372 - SURFACE
      ?auto_381373 - SURFACE
      ?auto_381374 - SURFACE
      ?auto_381371 - SURFACE
      ?auto_381375 - SURFACE
      ?auto_381377 - SURFACE
      ?auto_381376 - SURFACE
      ?auto_381378 - SURFACE
    )
    :vars
    (
      ?auto_381379 - HOIST
      ?auto_381380 - PLACE
      ?auto_381381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381379 ?auto_381380 ) ( SURFACE-AT ?auto_381376 ?auto_381380 ) ( CLEAR ?auto_381376 ) ( IS-CRATE ?auto_381378 ) ( not ( = ?auto_381376 ?auto_381378 ) ) ( TRUCK-AT ?auto_381381 ?auto_381380 ) ( AVAILABLE ?auto_381379 ) ( IN ?auto_381378 ?auto_381381 ) ( ON ?auto_381376 ?auto_381377 ) ( not ( = ?auto_381377 ?auto_381376 ) ) ( not ( = ?auto_381377 ?auto_381378 ) ) ( ON ?auto_381373 ?auto_381372 ) ( ON ?auto_381374 ?auto_381373 ) ( ON ?auto_381371 ?auto_381374 ) ( ON ?auto_381375 ?auto_381371 ) ( ON ?auto_381377 ?auto_381375 ) ( not ( = ?auto_381372 ?auto_381373 ) ) ( not ( = ?auto_381372 ?auto_381374 ) ) ( not ( = ?auto_381372 ?auto_381371 ) ) ( not ( = ?auto_381372 ?auto_381375 ) ) ( not ( = ?auto_381372 ?auto_381377 ) ) ( not ( = ?auto_381372 ?auto_381376 ) ) ( not ( = ?auto_381372 ?auto_381378 ) ) ( not ( = ?auto_381373 ?auto_381374 ) ) ( not ( = ?auto_381373 ?auto_381371 ) ) ( not ( = ?auto_381373 ?auto_381375 ) ) ( not ( = ?auto_381373 ?auto_381377 ) ) ( not ( = ?auto_381373 ?auto_381376 ) ) ( not ( = ?auto_381373 ?auto_381378 ) ) ( not ( = ?auto_381374 ?auto_381371 ) ) ( not ( = ?auto_381374 ?auto_381375 ) ) ( not ( = ?auto_381374 ?auto_381377 ) ) ( not ( = ?auto_381374 ?auto_381376 ) ) ( not ( = ?auto_381374 ?auto_381378 ) ) ( not ( = ?auto_381371 ?auto_381375 ) ) ( not ( = ?auto_381371 ?auto_381377 ) ) ( not ( = ?auto_381371 ?auto_381376 ) ) ( not ( = ?auto_381371 ?auto_381378 ) ) ( not ( = ?auto_381375 ?auto_381377 ) ) ( not ( = ?auto_381375 ?auto_381376 ) ) ( not ( = ?auto_381375 ?auto_381378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381377 ?auto_381376 ?auto_381378 )
      ( MAKE-7CRATE-VERIFY ?auto_381372 ?auto_381373 ?auto_381374 ?auto_381371 ?auto_381375 ?auto_381377 ?auto_381376 ?auto_381378 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381435 - SURFACE
      ?auto_381436 - SURFACE
      ?auto_381437 - SURFACE
      ?auto_381434 - SURFACE
      ?auto_381438 - SURFACE
      ?auto_381440 - SURFACE
      ?auto_381439 - SURFACE
      ?auto_381441 - SURFACE
    )
    :vars
    (
      ?auto_381442 - HOIST
      ?auto_381443 - PLACE
      ?auto_381445 - TRUCK
      ?auto_381444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381442 ?auto_381443 ) ( SURFACE-AT ?auto_381439 ?auto_381443 ) ( CLEAR ?auto_381439 ) ( IS-CRATE ?auto_381441 ) ( not ( = ?auto_381439 ?auto_381441 ) ) ( AVAILABLE ?auto_381442 ) ( IN ?auto_381441 ?auto_381445 ) ( ON ?auto_381439 ?auto_381440 ) ( not ( = ?auto_381440 ?auto_381439 ) ) ( not ( = ?auto_381440 ?auto_381441 ) ) ( TRUCK-AT ?auto_381445 ?auto_381444 ) ( not ( = ?auto_381444 ?auto_381443 ) ) ( ON ?auto_381436 ?auto_381435 ) ( ON ?auto_381437 ?auto_381436 ) ( ON ?auto_381434 ?auto_381437 ) ( ON ?auto_381438 ?auto_381434 ) ( ON ?auto_381440 ?auto_381438 ) ( not ( = ?auto_381435 ?auto_381436 ) ) ( not ( = ?auto_381435 ?auto_381437 ) ) ( not ( = ?auto_381435 ?auto_381434 ) ) ( not ( = ?auto_381435 ?auto_381438 ) ) ( not ( = ?auto_381435 ?auto_381440 ) ) ( not ( = ?auto_381435 ?auto_381439 ) ) ( not ( = ?auto_381435 ?auto_381441 ) ) ( not ( = ?auto_381436 ?auto_381437 ) ) ( not ( = ?auto_381436 ?auto_381434 ) ) ( not ( = ?auto_381436 ?auto_381438 ) ) ( not ( = ?auto_381436 ?auto_381440 ) ) ( not ( = ?auto_381436 ?auto_381439 ) ) ( not ( = ?auto_381436 ?auto_381441 ) ) ( not ( = ?auto_381437 ?auto_381434 ) ) ( not ( = ?auto_381437 ?auto_381438 ) ) ( not ( = ?auto_381437 ?auto_381440 ) ) ( not ( = ?auto_381437 ?auto_381439 ) ) ( not ( = ?auto_381437 ?auto_381441 ) ) ( not ( = ?auto_381434 ?auto_381438 ) ) ( not ( = ?auto_381434 ?auto_381440 ) ) ( not ( = ?auto_381434 ?auto_381439 ) ) ( not ( = ?auto_381434 ?auto_381441 ) ) ( not ( = ?auto_381438 ?auto_381440 ) ) ( not ( = ?auto_381438 ?auto_381439 ) ) ( not ( = ?auto_381438 ?auto_381441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381440 ?auto_381439 ?auto_381441 )
      ( MAKE-7CRATE-VERIFY ?auto_381435 ?auto_381436 ?auto_381437 ?auto_381434 ?auto_381438 ?auto_381440 ?auto_381439 ?auto_381441 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381505 - SURFACE
      ?auto_381506 - SURFACE
      ?auto_381507 - SURFACE
      ?auto_381504 - SURFACE
      ?auto_381508 - SURFACE
      ?auto_381510 - SURFACE
      ?auto_381509 - SURFACE
      ?auto_381511 - SURFACE
    )
    :vars
    (
      ?auto_381514 - HOIST
      ?auto_381513 - PLACE
      ?auto_381512 - TRUCK
      ?auto_381516 - PLACE
      ?auto_381515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_381514 ?auto_381513 ) ( SURFACE-AT ?auto_381509 ?auto_381513 ) ( CLEAR ?auto_381509 ) ( IS-CRATE ?auto_381511 ) ( not ( = ?auto_381509 ?auto_381511 ) ) ( AVAILABLE ?auto_381514 ) ( ON ?auto_381509 ?auto_381510 ) ( not ( = ?auto_381510 ?auto_381509 ) ) ( not ( = ?auto_381510 ?auto_381511 ) ) ( TRUCK-AT ?auto_381512 ?auto_381516 ) ( not ( = ?auto_381516 ?auto_381513 ) ) ( HOIST-AT ?auto_381515 ?auto_381516 ) ( LIFTING ?auto_381515 ?auto_381511 ) ( not ( = ?auto_381514 ?auto_381515 ) ) ( ON ?auto_381506 ?auto_381505 ) ( ON ?auto_381507 ?auto_381506 ) ( ON ?auto_381504 ?auto_381507 ) ( ON ?auto_381508 ?auto_381504 ) ( ON ?auto_381510 ?auto_381508 ) ( not ( = ?auto_381505 ?auto_381506 ) ) ( not ( = ?auto_381505 ?auto_381507 ) ) ( not ( = ?auto_381505 ?auto_381504 ) ) ( not ( = ?auto_381505 ?auto_381508 ) ) ( not ( = ?auto_381505 ?auto_381510 ) ) ( not ( = ?auto_381505 ?auto_381509 ) ) ( not ( = ?auto_381505 ?auto_381511 ) ) ( not ( = ?auto_381506 ?auto_381507 ) ) ( not ( = ?auto_381506 ?auto_381504 ) ) ( not ( = ?auto_381506 ?auto_381508 ) ) ( not ( = ?auto_381506 ?auto_381510 ) ) ( not ( = ?auto_381506 ?auto_381509 ) ) ( not ( = ?auto_381506 ?auto_381511 ) ) ( not ( = ?auto_381507 ?auto_381504 ) ) ( not ( = ?auto_381507 ?auto_381508 ) ) ( not ( = ?auto_381507 ?auto_381510 ) ) ( not ( = ?auto_381507 ?auto_381509 ) ) ( not ( = ?auto_381507 ?auto_381511 ) ) ( not ( = ?auto_381504 ?auto_381508 ) ) ( not ( = ?auto_381504 ?auto_381510 ) ) ( not ( = ?auto_381504 ?auto_381509 ) ) ( not ( = ?auto_381504 ?auto_381511 ) ) ( not ( = ?auto_381508 ?auto_381510 ) ) ( not ( = ?auto_381508 ?auto_381509 ) ) ( not ( = ?auto_381508 ?auto_381511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381510 ?auto_381509 ?auto_381511 )
      ( MAKE-7CRATE-VERIFY ?auto_381505 ?auto_381506 ?auto_381507 ?auto_381504 ?auto_381508 ?auto_381510 ?auto_381509 ?auto_381511 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381582 - SURFACE
      ?auto_381583 - SURFACE
      ?auto_381584 - SURFACE
      ?auto_381581 - SURFACE
      ?auto_381585 - SURFACE
      ?auto_381587 - SURFACE
      ?auto_381586 - SURFACE
      ?auto_381588 - SURFACE
    )
    :vars
    (
      ?auto_381591 - HOIST
      ?auto_381589 - PLACE
      ?auto_381593 - TRUCK
      ?auto_381590 - PLACE
      ?auto_381594 - HOIST
      ?auto_381592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381591 ?auto_381589 ) ( SURFACE-AT ?auto_381586 ?auto_381589 ) ( CLEAR ?auto_381586 ) ( IS-CRATE ?auto_381588 ) ( not ( = ?auto_381586 ?auto_381588 ) ) ( AVAILABLE ?auto_381591 ) ( ON ?auto_381586 ?auto_381587 ) ( not ( = ?auto_381587 ?auto_381586 ) ) ( not ( = ?auto_381587 ?auto_381588 ) ) ( TRUCK-AT ?auto_381593 ?auto_381590 ) ( not ( = ?auto_381590 ?auto_381589 ) ) ( HOIST-AT ?auto_381594 ?auto_381590 ) ( not ( = ?auto_381591 ?auto_381594 ) ) ( AVAILABLE ?auto_381594 ) ( SURFACE-AT ?auto_381588 ?auto_381590 ) ( ON ?auto_381588 ?auto_381592 ) ( CLEAR ?auto_381588 ) ( not ( = ?auto_381586 ?auto_381592 ) ) ( not ( = ?auto_381588 ?auto_381592 ) ) ( not ( = ?auto_381587 ?auto_381592 ) ) ( ON ?auto_381583 ?auto_381582 ) ( ON ?auto_381584 ?auto_381583 ) ( ON ?auto_381581 ?auto_381584 ) ( ON ?auto_381585 ?auto_381581 ) ( ON ?auto_381587 ?auto_381585 ) ( not ( = ?auto_381582 ?auto_381583 ) ) ( not ( = ?auto_381582 ?auto_381584 ) ) ( not ( = ?auto_381582 ?auto_381581 ) ) ( not ( = ?auto_381582 ?auto_381585 ) ) ( not ( = ?auto_381582 ?auto_381587 ) ) ( not ( = ?auto_381582 ?auto_381586 ) ) ( not ( = ?auto_381582 ?auto_381588 ) ) ( not ( = ?auto_381582 ?auto_381592 ) ) ( not ( = ?auto_381583 ?auto_381584 ) ) ( not ( = ?auto_381583 ?auto_381581 ) ) ( not ( = ?auto_381583 ?auto_381585 ) ) ( not ( = ?auto_381583 ?auto_381587 ) ) ( not ( = ?auto_381583 ?auto_381586 ) ) ( not ( = ?auto_381583 ?auto_381588 ) ) ( not ( = ?auto_381583 ?auto_381592 ) ) ( not ( = ?auto_381584 ?auto_381581 ) ) ( not ( = ?auto_381584 ?auto_381585 ) ) ( not ( = ?auto_381584 ?auto_381587 ) ) ( not ( = ?auto_381584 ?auto_381586 ) ) ( not ( = ?auto_381584 ?auto_381588 ) ) ( not ( = ?auto_381584 ?auto_381592 ) ) ( not ( = ?auto_381581 ?auto_381585 ) ) ( not ( = ?auto_381581 ?auto_381587 ) ) ( not ( = ?auto_381581 ?auto_381586 ) ) ( not ( = ?auto_381581 ?auto_381588 ) ) ( not ( = ?auto_381581 ?auto_381592 ) ) ( not ( = ?auto_381585 ?auto_381587 ) ) ( not ( = ?auto_381585 ?auto_381586 ) ) ( not ( = ?auto_381585 ?auto_381588 ) ) ( not ( = ?auto_381585 ?auto_381592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381587 ?auto_381586 ?auto_381588 )
      ( MAKE-7CRATE-VERIFY ?auto_381582 ?auto_381583 ?auto_381584 ?auto_381581 ?auto_381585 ?auto_381587 ?auto_381586 ?auto_381588 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381660 - SURFACE
      ?auto_381661 - SURFACE
      ?auto_381662 - SURFACE
      ?auto_381659 - SURFACE
      ?auto_381663 - SURFACE
      ?auto_381665 - SURFACE
      ?auto_381664 - SURFACE
      ?auto_381666 - SURFACE
    )
    :vars
    (
      ?auto_381672 - HOIST
      ?auto_381671 - PLACE
      ?auto_381668 - PLACE
      ?auto_381670 - HOIST
      ?auto_381669 - SURFACE
      ?auto_381667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381672 ?auto_381671 ) ( SURFACE-AT ?auto_381664 ?auto_381671 ) ( CLEAR ?auto_381664 ) ( IS-CRATE ?auto_381666 ) ( not ( = ?auto_381664 ?auto_381666 ) ) ( AVAILABLE ?auto_381672 ) ( ON ?auto_381664 ?auto_381665 ) ( not ( = ?auto_381665 ?auto_381664 ) ) ( not ( = ?auto_381665 ?auto_381666 ) ) ( not ( = ?auto_381668 ?auto_381671 ) ) ( HOIST-AT ?auto_381670 ?auto_381668 ) ( not ( = ?auto_381672 ?auto_381670 ) ) ( AVAILABLE ?auto_381670 ) ( SURFACE-AT ?auto_381666 ?auto_381668 ) ( ON ?auto_381666 ?auto_381669 ) ( CLEAR ?auto_381666 ) ( not ( = ?auto_381664 ?auto_381669 ) ) ( not ( = ?auto_381666 ?auto_381669 ) ) ( not ( = ?auto_381665 ?auto_381669 ) ) ( TRUCK-AT ?auto_381667 ?auto_381671 ) ( ON ?auto_381661 ?auto_381660 ) ( ON ?auto_381662 ?auto_381661 ) ( ON ?auto_381659 ?auto_381662 ) ( ON ?auto_381663 ?auto_381659 ) ( ON ?auto_381665 ?auto_381663 ) ( not ( = ?auto_381660 ?auto_381661 ) ) ( not ( = ?auto_381660 ?auto_381662 ) ) ( not ( = ?auto_381660 ?auto_381659 ) ) ( not ( = ?auto_381660 ?auto_381663 ) ) ( not ( = ?auto_381660 ?auto_381665 ) ) ( not ( = ?auto_381660 ?auto_381664 ) ) ( not ( = ?auto_381660 ?auto_381666 ) ) ( not ( = ?auto_381660 ?auto_381669 ) ) ( not ( = ?auto_381661 ?auto_381662 ) ) ( not ( = ?auto_381661 ?auto_381659 ) ) ( not ( = ?auto_381661 ?auto_381663 ) ) ( not ( = ?auto_381661 ?auto_381665 ) ) ( not ( = ?auto_381661 ?auto_381664 ) ) ( not ( = ?auto_381661 ?auto_381666 ) ) ( not ( = ?auto_381661 ?auto_381669 ) ) ( not ( = ?auto_381662 ?auto_381659 ) ) ( not ( = ?auto_381662 ?auto_381663 ) ) ( not ( = ?auto_381662 ?auto_381665 ) ) ( not ( = ?auto_381662 ?auto_381664 ) ) ( not ( = ?auto_381662 ?auto_381666 ) ) ( not ( = ?auto_381662 ?auto_381669 ) ) ( not ( = ?auto_381659 ?auto_381663 ) ) ( not ( = ?auto_381659 ?auto_381665 ) ) ( not ( = ?auto_381659 ?auto_381664 ) ) ( not ( = ?auto_381659 ?auto_381666 ) ) ( not ( = ?auto_381659 ?auto_381669 ) ) ( not ( = ?auto_381663 ?auto_381665 ) ) ( not ( = ?auto_381663 ?auto_381664 ) ) ( not ( = ?auto_381663 ?auto_381666 ) ) ( not ( = ?auto_381663 ?auto_381669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381665 ?auto_381664 ?auto_381666 )
      ( MAKE-7CRATE-VERIFY ?auto_381660 ?auto_381661 ?auto_381662 ?auto_381659 ?auto_381663 ?auto_381665 ?auto_381664 ?auto_381666 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381738 - SURFACE
      ?auto_381739 - SURFACE
      ?auto_381740 - SURFACE
      ?auto_381737 - SURFACE
      ?auto_381741 - SURFACE
      ?auto_381743 - SURFACE
      ?auto_381742 - SURFACE
      ?auto_381744 - SURFACE
    )
    :vars
    (
      ?auto_381749 - HOIST
      ?auto_381747 - PLACE
      ?auto_381748 - PLACE
      ?auto_381746 - HOIST
      ?auto_381750 - SURFACE
      ?auto_381745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381749 ?auto_381747 ) ( IS-CRATE ?auto_381744 ) ( not ( = ?auto_381742 ?auto_381744 ) ) ( not ( = ?auto_381743 ?auto_381742 ) ) ( not ( = ?auto_381743 ?auto_381744 ) ) ( not ( = ?auto_381748 ?auto_381747 ) ) ( HOIST-AT ?auto_381746 ?auto_381748 ) ( not ( = ?auto_381749 ?auto_381746 ) ) ( AVAILABLE ?auto_381746 ) ( SURFACE-AT ?auto_381744 ?auto_381748 ) ( ON ?auto_381744 ?auto_381750 ) ( CLEAR ?auto_381744 ) ( not ( = ?auto_381742 ?auto_381750 ) ) ( not ( = ?auto_381744 ?auto_381750 ) ) ( not ( = ?auto_381743 ?auto_381750 ) ) ( TRUCK-AT ?auto_381745 ?auto_381747 ) ( SURFACE-AT ?auto_381743 ?auto_381747 ) ( CLEAR ?auto_381743 ) ( LIFTING ?auto_381749 ?auto_381742 ) ( IS-CRATE ?auto_381742 ) ( ON ?auto_381739 ?auto_381738 ) ( ON ?auto_381740 ?auto_381739 ) ( ON ?auto_381737 ?auto_381740 ) ( ON ?auto_381741 ?auto_381737 ) ( ON ?auto_381743 ?auto_381741 ) ( not ( = ?auto_381738 ?auto_381739 ) ) ( not ( = ?auto_381738 ?auto_381740 ) ) ( not ( = ?auto_381738 ?auto_381737 ) ) ( not ( = ?auto_381738 ?auto_381741 ) ) ( not ( = ?auto_381738 ?auto_381743 ) ) ( not ( = ?auto_381738 ?auto_381742 ) ) ( not ( = ?auto_381738 ?auto_381744 ) ) ( not ( = ?auto_381738 ?auto_381750 ) ) ( not ( = ?auto_381739 ?auto_381740 ) ) ( not ( = ?auto_381739 ?auto_381737 ) ) ( not ( = ?auto_381739 ?auto_381741 ) ) ( not ( = ?auto_381739 ?auto_381743 ) ) ( not ( = ?auto_381739 ?auto_381742 ) ) ( not ( = ?auto_381739 ?auto_381744 ) ) ( not ( = ?auto_381739 ?auto_381750 ) ) ( not ( = ?auto_381740 ?auto_381737 ) ) ( not ( = ?auto_381740 ?auto_381741 ) ) ( not ( = ?auto_381740 ?auto_381743 ) ) ( not ( = ?auto_381740 ?auto_381742 ) ) ( not ( = ?auto_381740 ?auto_381744 ) ) ( not ( = ?auto_381740 ?auto_381750 ) ) ( not ( = ?auto_381737 ?auto_381741 ) ) ( not ( = ?auto_381737 ?auto_381743 ) ) ( not ( = ?auto_381737 ?auto_381742 ) ) ( not ( = ?auto_381737 ?auto_381744 ) ) ( not ( = ?auto_381737 ?auto_381750 ) ) ( not ( = ?auto_381741 ?auto_381743 ) ) ( not ( = ?auto_381741 ?auto_381742 ) ) ( not ( = ?auto_381741 ?auto_381744 ) ) ( not ( = ?auto_381741 ?auto_381750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381743 ?auto_381742 ?auto_381744 )
      ( MAKE-7CRATE-VERIFY ?auto_381738 ?auto_381739 ?auto_381740 ?auto_381737 ?auto_381741 ?auto_381743 ?auto_381742 ?auto_381744 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381816 - SURFACE
      ?auto_381817 - SURFACE
      ?auto_381818 - SURFACE
      ?auto_381815 - SURFACE
      ?auto_381819 - SURFACE
      ?auto_381821 - SURFACE
      ?auto_381820 - SURFACE
      ?auto_381822 - SURFACE
    )
    :vars
    (
      ?auto_381825 - HOIST
      ?auto_381826 - PLACE
      ?auto_381827 - PLACE
      ?auto_381823 - HOIST
      ?auto_381824 - SURFACE
      ?auto_381828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381825 ?auto_381826 ) ( IS-CRATE ?auto_381822 ) ( not ( = ?auto_381820 ?auto_381822 ) ) ( not ( = ?auto_381821 ?auto_381820 ) ) ( not ( = ?auto_381821 ?auto_381822 ) ) ( not ( = ?auto_381827 ?auto_381826 ) ) ( HOIST-AT ?auto_381823 ?auto_381827 ) ( not ( = ?auto_381825 ?auto_381823 ) ) ( AVAILABLE ?auto_381823 ) ( SURFACE-AT ?auto_381822 ?auto_381827 ) ( ON ?auto_381822 ?auto_381824 ) ( CLEAR ?auto_381822 ) ( not ( = ?auto_381820 ?auto_381824 ) ) ( not ( = ?auto_381822 ?auto_381824 ) ) ( not ( = ?auto_381821 ?auto_381824 ) ) ( TRUCK-AT ?auto_381828 ?auto_381826 ) ( SURFACE-AT ?auto_381821 ?auto_381826 ) ( CLEAR ?auto_381821 ) ( IS-CRATE ?auto_381820 ) ( AVAILABLE ?auto_381825 ) ( IN ?auto_381820 ?auto_381828 ) ( ON ?auto_381817 ?auto_381816 ) ( ON ?auto_381818 ?auto_381817 ) ( ON ?auto_381815 ?auto_381818 ) ( ON ?auto_381819 ?auto_381815 ) ( ON ?auto_381821 ?auto_381819 ) ( not ( = ?auto_381816 ?auto_381817 ) ) ( not ( = ?auto_381816 ?auto_381818 ) ) ( not ( = ?auto_381816 ?auto_381815 ) ) ( not ( = ?auto_381816 ?auto_381819 ) ) ( not ( = ?auto_381816 ?auto_381821 ) ) ( not ( = ?auto_381816 ?auto_381820 ) ) ( not ( = ?auto_381816 ?auto_381822 ) ) ( not ( = ?auto_381816 ?auto_381824 ) ) ( not ( = ?auto_381817 ?auto_381818 ) ) ( not ( = ?auto_381817 ?auto_381815 ) ) ( not ( = ?auto_381817 ?auto_381819 ) ) ( not ( = ?auto_381817 ?auto_381821 ) ) ( not ( = ?auto_381817 ?auto_381820 ) ) ( not ( = ?auto_381817 ?auto_381822 ) ) ( not ( = ?auto_381817 ?auto_381824 ) ) ( not ( = ?auto_381818 ?auto_381815 ) ) ( not ( = ?auto_381818 ?auto_381819 ) ) ( not ( = ?auto_381818 ?auto_381821 ) ) ( not ( = ?auto_381818 ?auto_381820 ) ) ( not ( = ?auto_381818 ?auto_381822 ) ) ( not ( = ?auto_381818 ?auto_381824 ) ) ( not ( = ?auto_381815 ?auto_381819 ) ) ( not ( = ?auto_381815 ?auto_381821 ) ) ( not ( = ?auto_381815 ?auto_381820 ) ) ( not ( = ?auto_381815 ?auto_381822 ) ) ( not ( = ?auto_381815 ?auto_381824 ) ) ( not ( = ?auto_381819 ?auto_381821 ) ) ( not ( = ?auto_381819 ?auto_381820 ) ) ( not ( = ?auto_381819 ?auto_381822 ) ) ( not ( = ?auto_381819 ?auto_381824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381821 ?auto_381820 ?auto_381822 )
      ( MAKE-7CRATE-VERIFY ?auto_381816 ?auto_381817 ?auto_381818 ?auto_381815 ?auto_381819 ?auto_381821 ?auto_381820 ?auto_381822 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384735 - SURFACE
      ?auto_384736 - SURFACE
      ?auto_384737 - SURFACE
      ?auto_384734 - SURFACE
      ?auto_384738 - SURFACE
      ?auto_384740 - SURFACE
      ?auto_384739 - SURFACE
      ?auto_384741 - SURFACE
      ?auto_384742 - SURFACE
    )
    :vars
    (
      ?auto_384743 - HOIST
      ?auto_384744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384743 ?auto_384744 ) ( SURFACE-AT ?auto_384741 ?auto_384744 ) ( CLEAR ?auto_384741 ) ( LIFTING ?auto_384743 ?auto_384742 ) ( IS-CRATE ?auto_384742 ) ( not ( = ?auto_384741 ?auto_384742 ) ) ( ON ?auto_384736 ?auto_384735 ) ( ON ?auto_384737 ?auto_384736 ) ( ON ?auto_384734 ?auto_384737 ) ( ON ?auto_384738 ?auto_384734 ) ( ON ?auto_384740 ?auto_384738 ) ( ON ?auto_384739 ?auto_384740 ) ( ON ?auto_384741 ?auto_384739 ) ( not ( = ?auto_384735 ?auto_384736 ) ) ( not ( = ?auto_384735 ?auto_384737 ) ) ( not ( = ?auto_384735 ?auto_384734 ) ) ( not ( = ?auto_384735 ?auto_384738 ) ) ( not ( = ?auto_384735 ?auto_384740 ) ) ( not ( = ?auto_384735 ?auto_384739 ) ) ( not ( = ?auto_384735 ?auto_384741 ) ) ( not ( = ?auto_384735 ?auto_384742 ) ) ( not ( = ?auto_384736 ?auto_384737 ) ) ( not ( = ?auto_384736 ?auto_384734 ) ) ( not ( = ?auto_384736 ?auto_384738 ) ) ( not ( = ?auto_384736 ?auto_384740 ) ) ( not ( = ?auto_384736 ?auto_384739 ) ) ( not ( = ?auto_384736 ?auto_384741 ) ) ( not ( = ?auto_384736 ?auto_384742 ) ) ( not ( = ?auto_384737 ?auto_384734 ) ) ( not ( = ?auto_384737 ?auto_384738 ) ) ( not ( = ?auto_384737 ?auto_384740 ) ) ( not ( = ?auto_384737 ?auto_384739 ) ) ( not ( = ?auto_384737 ?auto_384741 ) ) ( not ( = ?auto_384737 ?auto_384742 ) ) ( not ( = ?auto_384734 ?auto_384738 ) ) ( not ( = ?auto_384734 ?auto_384740 ) ) ( not ( = ?auto_384734 ?auto_384739 ) ) ( not ( = ?auto_384734 ?auto_384741 ) ) ( not ( = ?auto_384734 ?auto_384742 ) ) ( not ( = ?auto_384738 ?auto_384740 ) ) ( not ( = ?auto_384738 ?auto_384739 ) ) ( not ( = ?auto_384738 ?auto_384741 ) ) ( not ( = ?auto_384738 ?auto_384742 ) ) ( not ( = ?auto_384740 ?auto_384739 ) ) ( not ( = ?auto_384740 ?auto_384741 ) ) ( not ( = ?auto_384740 ?auto_384742 ) ) ( not ( = ?auto_384739 ?auto_384741 ) ) ( not ( = ?auto_384739 ?auto_384742 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_384741 ?auto_384742 )
      ( MAKE-8CRATE-VERIFY ?auto_384735 ?auto_384736 ?auto_384737 ?auto_384734 ?auto_384738 ?auto_384740 ?auto_384739 ?auto_384741 ?auto_384742 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384802 - SURFACE
      ?auto_384803 - SURFACE
      ?auto_384804 - SURFACE
      ?auto_384801 - SURFACE
      ?auto_384805 - SURFACE
      ?auto_384807 - SURFACE
      ?auto_384806 - SURFACE
      ?auto_384808 - SURFACE
      ?auto_384809 - SURFACE
    )
    :vars
    (
      ?auto_384812 - HOIST
      ?auto_384811 - PLACE
      ?auto_384810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384812 ?auto_384811 ) ( SURFACE-AT ?auto_384808 ?auto_384811 ) ( CLEAR ?auto_384808 ) ( IS-CRATE ?auto_384809 ) ( not ( = ?auto_384808 ?auto_384809 ) ) ( TRUCK-AT ?auto_384810 ?auto_384811 ) ( AVAILABLE ?auto_384812 ) ( IN ?auto_384809 ?auto_384810 ) ( ON ?auto_384808 ?auto_384806 ) ( not ( = ?auto_384806 ?auto_384808 ) ) ( not ( = ?auto_384806 ?auto_384809 ) ) ( ON ?auto_384803 ?auto_384802 ) ( ON ?auto_384804 ?auto_384803 ) ( ON ?auto_384801 ?auto_384804 ) ( ON ?auto_384805 ?auto_384801 ) ( ON ?auto_384807 ?auto_384805 ) ( ON ?auto_384806 ?auto_384807 ) ( not ( = ?auto_384802 ?auto_384803 ) ) ( not ( = ?auto_384802 ?auto_384804 ) ) ( not ( = ?auto_384802 ?auto_384801 ) ) ( not ( = ?auto_384802 ?auto_384805 ) ) ( not ( = ?auto_384802 ?auto_384807 ) ) ( not ( = ?auto_384802 ?auto_384806 ) ) ( not ( = ?auto_384802 ?auto_384808 ) ) ( not ( = ?auto_384802 ?auto_384809 ) ) ( not ( = ?auto_384803 ?auto_384804 ) ) ( not ( = ?auto_384803 ?auto_384801 ) ) ( not ( = ?auto_384803 ?auto_384805 ) ) ( not ( = ?auto_384803 ?auto_384807 ) ) ( not ( = ?auto_384803 ?auto_384806 ) ) ( not ( = ?auto_384803 ?auto_384808 ) ) ( not ( = ?auto_384803 ?auto_384809 ) ) ( not ( = ?auto_384804 ?auto_384801 ) ) ( not ( = ?auto_384804 ?auto_384805 ) ) ( not ( = ?auto_384804 ?auto_384807 ) ) ( not ( = ?auto_384804 ?auto_384806 ) ) ( not ( = ?auto_384804 ?auto_384808 ) ) ( not ( = ?auto_384804 ?auto_384809 ) ) ( not ( = ?auto_384801 ?auto_384805 ) ) ( not ( = ?auto_384801 ?auto_384807 ) ) ( not ( = ?auto_384801 ?auto_384806 ) ) ( not ( = ?auto_384801 ?auto_384808 ) ) ( not ( = ?auto_384801 ?auto_384809 ) ) ( not ( = ?auto_384805 ?auto_384807 ) ) ( not ( = ?auto_384805 ?auto_384806 ) ) ( not ( = ?auto_384805 ?auto_384808 ) ) ( not ( = ?auto_384805 ?auto_384809 ) ) ( not ( = ?auto_384807 ?auto_384806 ) ) ( not ( = ?auto_384807 ?auto_384808 ) ) ( not ( = ?auto_384807 ?auto_384809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384806 ?auto_384808 ?auto_384809 )
      ( MAKE-8CRATE-VERIFY ?auto_384802 ?auto_384803 ?auto_384804 ?auto_384801 ?auto_384805 ?auto_384807 ?auto_384806 ?auto_384808 ?auto_384809 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384878 - SURFACE
      ?auto_384879 - SURFACE
      ?auto_384880 - SURFACE
      ?auto_384877 - SURFACE
      ?auto_384881 - SURFACE
      ?auto_384883 - SURFACE
      ?auto_384882 - SURFACE
      ?auto_384884 - SURFACE
      ?auto_384885 - SURFACE
    )
    :vars
    (
      ?auto_384886 - HOIST
      ?auto_384888 - PLACE
      ?auto_384889 - TRUCK
      ?auto_384887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384886 ?auto_384888 ) ( SURFACE-AT ?auto_384884 ?auto_384888 ) ( CLEAR ?auto_384884 ) ( IS-CRATE ?auto_384885 ) ( not ( = ?auto_384884 ?auto_384885 ) ) ( AVAILABLE ?auto_384886 ) ( IN ?auto_384885 ?auto_384889 ) ( ON ?auto_384884 ?auto_384882 ) ( not ( = ?auto_384882 ?auto_384884 ) ) ( not ( = ?auto_384882 ?auto_384885 ) ) ( TRUCK-AT ?auto_384889 ?auto_384887 ) ( not ( = ?auto_384887 ?auto_384888 ) ) ( ON ?auto_384879 ?auto_384878 ) ( ON ?auto_384880 ?auto_384879 ) ( ON ?auto_384877 ?auto_384880 ) ( ON ?auto_384881 ?auto_384877 ) ( ON ?auto_384883 ?auto_384881 ) ( ON ?auto_384882 ?auto_384883 ) ( not ( = ?auto_384878 ?auto_384879 ) ) ( not ( = ?auto_384878 ?auto_384880 ) ) ( not ( = ?auto_384878 ?auto_384877 ) ) ( not ( = ?auto_384878 ?auto_384881 ) ) ( not ( = ?auto_384878 ?auto_384883 ) ) ( not ( = ?auto_384878 ?auto_384882 ) ) ( not ( = ?auto_384878 ?auto_384884 ) ) ( not ( = ?auto_384878 ?auto_384885 ) ) ( not ( = ?auto_384879 ?auto_384880 ) ) ( not ( = ?auto_384879 ?auto_384877 ) ) ( not ( = ?auto_384879 ?auto_384881 ) ) ( not ( = ?auto_384879 ?auto_384883 ) ) ( not ( = ?auto_384879 ?auto_384882 ) ) ( not ( = ?auto_384879 ?auto_384884 ) ) ( not ( = ?auto_384879 ?auto_384885 ) ) ( not ( = ?auto_384880 ?auto_384877 ) ) ( not ( = ?auto_384880 ?auto_384881 ) ) ( not ( = ?auto_384880 ?auto_384883 ) ) ( not ( = ?auto_384880 ?auto_384882 ) ) ( not ( = ?auto_384880 ?auto_384884 ) ) ( not ( = ?auto_384880 ?auto_384885 ) ) ( not ( = ?auto_384877 ?auto_384881 ) ) ( not ( = ?auto_384877 ?auto_384883 ) ) ( not ( = ?auto_384877 ?auto_384882 ) ) ( not ( = ?auto_384877 ?auto_384884 ) ) ( not ( = ?auto_384877 ?auto_384885 ) ) ( not ( = ?auto_384881 ?auto_384883 ) ) ( not ( = ?auto_384881 ?auto_384882 ) ) ( not ( = ?auto_384881 ?auto_384884 ) ) ( not ( = ?auto_384881 ?auto_384885 ) ) ( not ( = ?auto_384883 ?auto_384882 ) ) ( not ( = ?auto_384883 ?auto_384884 ) ) ( not ( = ?auto_384883 ?auto_384885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384882 ?auto_384884 ?auto_384885 )
      ( MAKE-8CRATE-VERIFY ?auto_384878 ?auto_384879 ?auto_384880 ?auto_384877 ?auto_384881 ?auto_384883 ?auto_384882 ?auto_384884 ?auto_384885 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384962 - SURFACE
      ?auto_384963 - SURFACE
      ?auto_384964 - SURFACE
      ?auto_384961 - SURFACE
      ?auto_384965 - SURFACE
      ?auto_384967 - SURFACE
      ?auto_384966 - SURFACE
      ?auto_384968 - SURFACE
      ?auto_384969 - SURFACE
    )
    :vars
    (
      ?auto_384973 - HOIST
      ?auto_384971 - PLACE
      ?auto_384970 - TRUCK
      ?auto_384972 - PLACE
      ?auto_384974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_384973 ?auto_384971 ) ( SURFACE-AT ?auto_384968 ?auto_384971 ) ( CLEAR ?auto_384968 ) ( IS-CRATE ?auto_384969 ) ( not ( = ?auto_384968 ?auto_384969 ) ) ( AVAILABLE ?auto_384973 ) ( ON ?auto_384968 ?auto_384966 ) ( not ( = ?auto_384966 ?auto_384968 ) ) ( not ( = ?auto_384966 ?auto_384969 ) ) ( TRUCK-AT ?auto_384970 ?auto_384972 ) ( not ( = ?auto_384972 ?auto_384971 ) ) ( HOIST-AT ?auto_384974 ?auto_384972 ) ( LIFTING ?auto_384974 ?auto_384969 ) ( not ( = ?auto_384973 ?auto_384974 ) ) ( ON ?auto_384963 ?auto_384962 ) ( ON ?auto_384964 ?auto_384963 ) ( ON ?auto_384961 ?auto_384964 ) ( ON ?auto_384965 ?auto_384961 ) ( ON ?auto_384967 ?auto_384965 ) ( ON ?auto_384966 ?auto_384967 ) ( not ( = ?auto_384962 ?auto_384963 ) ) ( not ( = ?auto_384962 ?auto_384964 ) ) ( not ( = ?auto_384962 ?auto_384961 ) ) ( not ( = ?auto_384962 ?auto_384965 ) ) ( not ( = ?auto_384962 ?auto_384967 ) ) ( not ( = ?auto_384962 ?auto_384966 ) ) ( not ( = ?auto_384962 ?auto_384968 ) ) ( not ( = ?auto_384962 ?auto_384969 ) ) ( not ( = ?auto_384963 ?auto_384964 ) ) ( not ( = ?auto_384963 ?auto_384961 ) ) ( not ( = ?auto_384963 ?auto_384965 ) ) ( not ( = ?auto_384963 ?auto_384967 ) ) ( not ( = ?auto_384963 ?auto_384966 ) ) ( not ( = ?auto_384963 ?auto_384968 ) ) ( not ( = ?auto_384963 ?auto_384969 ) ) ( not ( = ?auto_384964 ?auto_384961 ) ) ( not ( = ?auto_384964 ?auto_384965 ) ) ( not ( = ?auto_384964 ?auto_384967 ) ) ( not ( = ?auto_384964 ?auto_384966 ) ) ( not ( = ?auto_384964 ?auto_384968 ) ) ( not ( = ?auto_384964 ?auto_384969 ) ) ( not ( = ?auto_384961 ?auto_384965 ) ) ( not ( = ?auto_384961 ?auto_384967 ) ) ( not ( = ?auto_384961 ?auto_384966 ) ) ( not ( = ?auto_384961 ?auto_384968 ) ) ( not ( = ?auto_384961 ?auto_384969 ) ) ( not ( = ?auto_384965 ?auto_384967 ) ) ( not ( = ?auto_384965 ?auto_384966 ) ) ( not ( = ?auto_384965 ?auto_384968 ) ) ( not ( = ?auto_384965 ?auto_384969 ) ) ( not ( = ?auto_384967 ?auto_384966 ) ) ( not ( = ?auto_384967 ?auto_384968 ) ) ( not ( = ?auto_384967 ?auto_384969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384966 ?auto_384968 ?auto_384969 )
      ( MAKE-8CRATE-VERIFY ?auto_384962 ?auto_384963 ?auto_384964 ?auto_384961 ?auto_384965 ?auto_384967 ?auto_384966 ?auto_384968 ?auto_384969 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_385054 - SURFACE
      ?auto_385055 - SURFACE
      ?auto_385056 - SURFACE
      ?auto_385053 - SURFACE
      ?auto_385057 - SURFACE
      ?auto_385059 - SURFACE
      ?auto_385058 - SURFACE
      ?auto_385060 - SURFACE
      ?auto_385061 - SURFACE
    )
    :vars
    (
      ?auto_385063 - HOIST
      ?auto_385064 - PLACE
      ?auto_385065 - TRUCK
      ?auto_385067 - PLACE
      ?auto_385062 - HOIST
      ?auto_385066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_385063 ?auto_385064 ) ( SURFACE-AT ?auto_385060 ?auto_385064 ) ( CLEAR ?auto_385060 ) ( IS-CRATE ?auto_385061 ) ( not ( = ?auto_385060 ?auto_385061 ) ) ( AVAILABLE ?auto_385063 ) ( ON ?auto_385060 ?auto_385058 ) ( not ( = ?auto_385058 ?auto_385060 ) ) ( not ( = ?auto_385058 ?auto_385061 ) ) ( TRUCK-AT ?auto_385065 ?auto_385067 ) ( not ( = ?auto_385067 ?auto_385064 ) ) ( HOIST-AT ?auto_385062 ?auto_385067 ) ( not ( = ?auto_385063 ?auto_385062 ) ) ( AVAILABLE ?auto_385062 ) ( SURFACE-AT ?auto_385061 ?auto_385067 ) ( ON ?auto_385061 ?auto_385066 ) ( CLEAR ?auto_385061 ) ( not ( = ?auto_385060 ?auto_385066 ) ) ( not ( = ?auto_385061 ?auto_385066 ) ) ( not ( = ?auto_385058 ?auto_385066 ) ) ( ON ?auto_385055 ?auto_385054 ) ( ON ?auto_385056 ?auto_385055 ) ( ON ?auto_385053 ?auto_385056 ) ( ON ?auto_385057 ?auto_385053 ) ( ON ?auto_385059 ?auto_385057 ) ( ON ?auto_385058 ?auto_385059 ) ( not ( = ?auto_385054 ?auto_385055 ) ) ( not ( = ?auto_385054 ?auto_385056 ) ) ( not ( = ?auto_385054 ?auto_385053 ) ) ( not ( = ?auto_385054 ?auto_385057 ) ) ( not ( = ?auto_385054 ?auto_385059 ) ) ( not ( = ?auto_385054 ?auto_385058 ) ) ( not ( = ?auto_385054 ?auto_385060 ) ) ( not ( = ?auto_385054 ?auto_385061 ) ) ( not ( = ?auto_385054 ?auto_385066 ) ) ( not ( = ?auto_385055 ?auto_385056 ) ) ( not ( = ?auto_385055 ?auto_385053 ) ) ( not ( = ?auto_385055 ?auto_385057 ) ) ( not ( = ?auto_385055 ?auto_385059 ) ) ( not ( = ?auto_385055 ?auto_385058 ) ) ( not ( = ?auto_385055 ?auto_385060 ) ) ( not ( = ?auto_385055 ?auto_385061 ) ) ( not ( = ?auto_385055 ?auto_385066 ) ) ( not ( = ?auto_385056 ?auto_385053 ) ) ( not ( = ?auto_385056 ?auto_385057 ) ) ( not ( = ?auto_385056 ?auto_385059 ) ) ( not ( = ?auto_385056 ?auto_385058 ) ) ( not ( = ?auto_385056 ?auto_385060 ) ) ( not ( = ?auto_385056 ?auto_385061 ) ) ( not ( = ?auto_385056 ?auto_385066 ) ) ( not ( = ?auto_385053 ?auto_385057 ) ) ( not ( = ?auto_385053 ?auto_385059 ) ) ( not ( = ?auto_385053 ?auto_385058 ) ) ( not ( = ?auto_385053 ?auto_385060 ) ) ( not ( = ?auto_385053 ?auto_385061 ) ) ( not ( = ?auto_385053 ?auto_385066 ) ) ( not ( = ?auto_385057 ?auto_385059 ) ) ( not ( = ?auto_385057 ?auto_385058 ) ) ( not ( = ?auto_385057 ?auto_385060 ) ) ( not ( = ?auto_385057 ?auto_385061 ) ) ( not ( = ?auto_385057 ?auto_385066 ) ) ( not ( = ?auto_385059 ?auto_385058 ) ) ( not ( = ?auto_385059 ?auto_385060 ) ) ( not ( = ?auto_385059 ?auto_385061 ) ) ( not ( = ?auto_385059 ?auto_385066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_385058 ?auto_385060 ?auto_385061 )
      ( MAKE-8CRATE-VERIFY ?auto_385054 ?auto_385055 ?auto_385056 ?auto_385053 ?auto_385057 ?auto_385059 ?auto_385058 ?auto_385060 ?auto_385061 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_385147 - SURFACE
      ?auto_385148 - SURFACE
      ?auto_385149 - SURFACE
      ?auto_385146 - SURFACE
      ?auto_385150 - SURFACE
      ?auto_385152 - SURFACE
      ?auto_385151 - SURFACE
      ?auto_385153 - SURFACE
      ?auto_385154 - SURFACE
    )
    :vars
    (
      ?auto_385160 - HOIST
      ?auto_385158 - PLACE
      ?auto_385155 - PLACE
      ?auto_385159 - HOIST
      ?auto_385156 - SURFACE
      ?auto_385157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_385160 ?auto_385158 ) ( SURFACE-AT ?auto_385153 ?auto_385158 ) ( CLEAR ?auto_385153 ) ( IS-CRATE ?auto_385154 ) ( not ( = ?auto_385153 ?auto_385154 ) ) ( AVAILABLE ?auto_385160 ) ( ON ?auto_385153 ?auto_385151 ) ( not ( = ?auto_385151 ?auto_385153 ) ) ( not ( = ?auto_385151 ?auto_385154 ) ) ( not ( = ?auto_385155 ?auto_385158 ) ) ( HOIST-AT ?auto_385159 ?auto_385155 ) ( not ( = ?auto_385160 ?auto_385159 ) ) ( AVAILABLE ?auto_385159 ) ( SURFACE-AT ?auto_385154 ?auto_385155 ) ( ON ?auto_385154 ?auto_385156 ) ( CLEAR ?auto_385154 ) ( not ( = ?auto_385153 ?auto_385156 ) ) ( not ( = ?auto_385154 ?auto_385156 ) ) ( not ( = ?auto_385151 ?auto_385156 ) ) ( TRUCK-AT ?auto_385157 ?auto_385158 ) ( ON ?auto_385148 ?auto_385147 ) ( ON ?auto_385149 ?auto_385148 ) ( ON ?auto_385146 ?auto_385149 ) ( ON ?auto_385150 ?auto_385146 ) ( ON ?auto_385152 ?auto_385150 ) ( ON ?auto_385151 ?auto_385152 ) ( not ( = ?auto_385147 ?auto_385148 ) ) ( not ( = ?auto_385147 ?auto_385149 ) ) ( not ( = ?auto_385147 ?auto_385146 ) ) ( not ( = ?auto_385147 ?auto_385150 ) ) ( not ( = ?auto_385147 ?auto_385152 ) ) ( not ( = ?auto_385147 ?auto_385151 ) ) ( not ( = ?auto_385147 ?auto_385153 ) ) ( not ( = ?auto_385147 ?auto_385154 ) ) ( not ( = ?auto_385147 ?auto_385156 ) ) ( not ( = ?auto_385148 ?auto_385149 ) ) ( not ( = ?auto_385148 ?auto_385146 ) ) ( not ( = ?auto_385148 ?auto_385150 ) ) ( not ( = ?auto_385148 ?auto_385152 ) ) ( not ( = ?auto_385148 ?auto_385151 ) ) ( not ( = ?auto_385148 ?auto_385153 ) ) ( not ( = ?auto_385148 ?auto_385154 ) ) ( not ( = ?auto_385148 ?auto_385156 ) ) ( not ( = ?auto_385149 ?auto_385146 ) ) ( not ( = ?auto_385149 ?auto_385150 ) ) ( not ( = ?auto_385149 ?auto_385152 ) ) ( not ( = ?auto_385149 ?auto_385151 ) ) ( not ( = ?auto_385149 ?auto_385153 ) ) ( not ( = ?auto_385149 ?auto_385154 ) ) ( not ( = ?auto_385149 ?auto_385156 ) ) ( not ( = ?auto_385146 ?auto_385150 ) ) ( not ( = ?auto_385146 ?auto_385152 ) ) ( not ( = ?auto_385146 ?auto_385151 ) ) ( not ( = ?auto_385146 ?auto_385153 ) ) ( not ( = ?auto_385146 ?auto_385154 ) ) ( not ( = ?auto_385146 ?auto_385156 ) ) ( not ( = ?auto_385150 ?auto_385152 ) ) ( not ( = ?auto_385150 ?auto_385151 ) ) ( not ( = ?auto_385150 ?auto_385153 ) ) ( not ( = ?auto_385150 ?auto_385154 ) ) ( not ( = ?auto_385150 ?auto_385156 ) ) ( not ( = ?auto_385152 ?auto_385151 ) ) ( not ( = ?auto_385152 ?auto_385153 ) ) ( not ( = ?auto_385152 ?auto_385154 ) ) ( not ( = ?auto_385152 ?auto_385156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_385151 ?auto_385153 ?auto_385154 )
      ( MAKE-8CRATE-VERIFY ?auto_385147 ?auto_385148 ?auto_385149 ?auto_385146 ?auto_385150 ?auto_385152 ?auto_385151 ?auto_385153 ?auto_385154 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_385240 - SURFACE
      ?auto_385241 - SURFACE
      ?auto_385242 - SURFACE
      ?auto_385239 - SURFACE
      ?auto_385243 - SURFACE
      ?auto_385245 - SURFACE
      ?auto_385244 - SURFACE
      ?auto_385246 - SURFACE
      ?auto_385247 - SURFACE
    )
    :vars
    (
      ?auto_385250 - HOIST
      ?auto_385251 - PLACE
      ?auto_385252 - PLACE
      ?auto_385253 - HOIST
      ?auto_385248 - SURFACE
      ?auto_385249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_385250 ?auto_385251 ) ( IS-CRATE ?auto_385247 ) ( not ( = ?auto_385246 ?auto_385247 ) ) ( not ( = ?auto_385244 ?auto_385246 ) ) ( not ( = ?auto_385244 ?auto_385247 ) ) ( not ( = ?auto_385252 ?auto_385251 ) ) ( HOIST-AT ?auto_385253 ?auto_385252 ) ( not ( = ?auto_385250 ?auto_385253 ) ) ( AVAILABLE ?auto_385253 ) ( SURFACE-AT ?auto_385247 ?auto_385252 ) ( ON ?auto_385247 ?auto_385248 ) ( CLEAR ?auto_385247 ) ( not ( = ?auto_385246 ?auto_385248 ) ) ( not ( = ?auto_385247 ?auto_385248 ) ) ( not ( = ?auto_385244 ?auto_385248 ) ) ( TRUCK-AT ?auto_385249 ?auto_385251 ) ( SURFACE-AT ?auto_385244 ?auto_385251 ) ( CLEAR ?auto_385244 ) ( LIFTING ?auto_385250 ?auto_385246 ) ( IS-CRATE ?auto_385246 ) ( ON ?auto_385241 ?auto_385240 ) ( ON ?auto_385242 ?auto_385241 ) ( ON ?auto_385239 ?auto_385242 ) ( ON ?auto_385243 ?auto_385239 ) ( ON ?auto_385245 ?auto_385243 ) ( ON ?auto_385244 ?auto_385245 ) ( not ( = ?auto_385240 ?auto_385241 ) ) ( not ( = ?auto_385240 ?auto_385242 ) ) ( not ( = ?auto_385240 ?auto_385239 ) ) ( not ( = ?auto_385240 ?auto_385243 ) ) ( not ( = ?auto_385240 ?auto_385245 ) ) ( not ( = ?auto_385240 ?auto_385244 ) ) ( not ( = ?auto_385240 ?auto_385246 ) ) ( not ( = ?auto_385240 ?auto_385247 ) ) ( not ( = ?auto_385240 ?auto_385248 ) ) ( not ( = ?auto_385241 ?auto_385242 ) ) ( not ( = ?auto_385241 ?auto_385239 ) ) ( not ( = ?auto_385241 ?auto_385243 ) ) ( not ( = ?auto_385241 ?auto_385245 ) ) ( not ( = ?auto_385241 ?auto_385244 ) ) ( not ( = ?auto_385241 ?auto_385246 ) ) ( not ( = ?auto_385241 ?auto_385247 ) ) ( not ( = ?auto_385241 ?auto_385248 ) ) ( not ( = ?auto_385242 ?auto_385239 ) ) ( not ( = ?auto_385242 ?auto_385243 ) ) ( not ( = ?auto_385242 ?auto_385245 ) ) ( not ( = ?auto_385242 ?auto_385244 ) ) ( not ( = ?auto_385242 ?auto_385246 ) ) ( not ( = ?auto_385242 ?auto_385247 ) ) ( not ( = ?auto_385242 ?auto_385248 ) ) ( not ( = ?auto_385239 ?auto_385243 ) ) ( not ( = ?auto_385239 ?auto_385245 ) ) ( not ( = ?auto_385239 ?auto_385244 ) ) ( not ( = ?auto_385239 ?auto_385246 ) ) ( not ( = ?auto_385239 ?auto_385247 ) ) ( not ( = ?auto_385239 ?auto_385248 ) ) ( not ( = ?auto_385243 ?auto_385245 ) ) ( not ( = ?auto_385243 ?auto_385244 ) ) ( not ( = ?auto_385243 ?auto_385246 ) ) ( not ( = ?auto_385243 ?auto_385247 ) ) ( not ( = ?auto_385243 ?auto_385248 ) ) ( not ( = ?auto_385245 ?auto_385244 ) ) ( not ( = ?auto_385245 ?auto_385246 ) ) ( not ( = ?auto_385245 ?auto_385247 ) ) ( not ( = ?auto_385245 ?auto_385248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_385244 ?auto_385246 ?auto_385247 )
      ( MAKE-8CRATE-VERIFY ?auto_385240 ?auto_385241 ?auto_385242 ?auto_385239 ?auto_385243 ?auto_385245 ?auto_385244 ?auto_385246 ?auto_385247 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_385333 - SURFACE
      ?auto_385334 - SURFACE
      ?auto_385335 - SURFACE
      ?auto_385332 - SURFACE
      ?auto_385336 - SURFACE
      ?auto_385338 - SURFACE
      ?auto_385337 - SURFACE
      ?auto_385339 - SURFACE
      ?auto_385340 - SURFACE
    )
    :vars
    (
      ?auto_385345 - HOIST
      ?auto_385346 - PLACE
      ?auto_385343 - PLACE
      ?auto_385344 - HOIST
      ?auto_385341 - SURFACE
      ?auto_385342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_385345 ?auto_385346 ) ( IS-CRATE ?auto_385340 ) ( not ( = ?auto_385339 ?auto_385340 ) ) ( not ( = ?auto_385337 ?auto_385339 ) ) ( not ( = ?auto_385337 ?auto_385340 ) ) ( not ( = ?auto_385343 ?auto_385346 ) ) ( HOIST-AT ?auto_385344 ?auto_385343 ) ( not ( = ?auto_385345 ?auto_385344 ) ) ( AVAILABLE ?auto_385344 ) ( SURFACE-AT ?auto_385340 ?auto_385343 ) ( ON ?auto_385340 ?auto_385341 ) ( CLEAR ?auto_385340 ) ( not ( = ?auto_385339 ?auto_385341 ) ) ( not ( = ?auto_385340 ?auto_385341 ) ) ( not ( = ?auto_385337 ?auto_385341 ) ) ( TRUCK-AT ?auto_385342 ?auto_385346 ) ( SURFACE-AT ?auto_385337 ?auto_385346 ) ( CLEAR ?auto_385337 ) ( IS-CRATE ?auto_385339 ) ( AVAILABLE ?auto_385345 ) ( IN ?auto_385339 ?auto_385342 ) ( ON ?auto_385334 ?auto_385333 ) ( ON ?auto_385335 ?auto_385334 ) ( ON ?auto_385332 ?auto_385335 ) ( ON ?auto_385336 ?auto_385332 ) ( ON ?auto_385338 ?auto_385336 ) ( ON ?auto_385337 ?auto_385338 ) ( not ( = ?auto_385333 ?auto_385334 ) ) ( not ( = ?auto_385333 ?auto_385335 ) ) ( not ( = ?auto_385333 ?auto_385332 ) ) ( not ( = ?auto_385333 ?auto_385336 ) ) ( not ( = ?auto_385333 ?auto_385338 ) ) ( not ( = ?auto_385333 ?auto_385337 ) ) ( not ( = ?auto_385333 ?auto_385339 ) ) ( not ( = ?auto_385333 ?auto_385340 ) ) ( not ( = ?auto_385333 ?auto_385341 ) ) ( not ( = ?auto_385334 ?auto_385335 ) ) ( not ( = ?auto_385334 ?auto_385332 ) ) ( not ( = ?auto_385334 ?auto_385336 ) ) ( not ( = ?auto_385334 ?auto_385338 ) ) ( not ( = ?auto_385334 ?auto_385337 ) ) ( not ( = ?auto_385334 ?auto_385339 ) ) ( not ( = ?auto_385334 ?auto_385340 ) ) ( not ( = ?auto_385334 ?auto_385341 ) ) ( not ( = ?auto_385335 ?auto_385332 ) ) ( not ( = ?auto_385335 ?auto_385336 ) ) ( not ( = ?auto_385335 ?auto_385338 ) ) ( not ( = ?auto_385335 ?auto_385337 ) ) ( not ( = ?auto_385335 ?auto_385339 ) ) ( not ( = ?auto_385335 ?auto_385340 ) ) ( not ( = ?auto_385335 ?auto_385341 ) ) ( not ( = ?auto_385332 ?auto_385336 ) ) ( not ( = ?auto_385332 ?auto_385338 ) ) ( not ( = ?auto_385332 ?auto_385337 ) ) ( not ( = ?auto_385332 ?auto_385339 ) ) ( not ( = ?auto_385332 ?auto_385340 ) ) ( not ( = ?auto_385332 ?auto_385341 ) ) ( not ( = ?auto_385336 ?auto_385338 ) ) ( not ( = ?auto_385336 ?auto_385337 ) ) ( not ( = ?auto_385336 ?auto_385339 ) ) ( not ( = ?auto_385336 ?auto_385340 ) ) ( not ( = ?auto_385336 ?auto_385341 ) ) ( not ( = ?auto_385338 ?auto_385337 ) ) ( not ( = ?auto_385338 ?auto_385339 ) ) ( not ( = ?auto_385338 ?auto_385340 ) ) ( not ( = ?auto_385338 ?auto_385341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_385337 ?auto_385339 ?auto_385340 )
      ( MAKE-8CRATE-VERIFY ?auto_385333 ?auto_385334 ?auto_385335 ?auto_385332 ?auto_385336 ?auto_385338 ?auto_385337 ?auto_385339 ?auto_385340 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389449 - SURFACE
      ?auto_389450 - SURFACE
      ?auto_389451 - SURFACE
      ?auto_389448 - SURFACE
      ?auto_389452 - SURFACE
      ?auto_389454 - SURFACE
      ?auto_389453 - SURFACE
      ?auto_389455 - SURFACE
      ?auto_389456 - SURFACE
      ?auto_389457 - SURFACE
    )
    :vars
    (
      ?auto_389458 - HOIST
      ?auto_389459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389458 ?auto_389459 ) ( SURFACE-AT ?auto_389456 ?auto_389459 ) ( CLEAR ?auto_389456 ) ( LIFTING ?auto_389458 ?auto_389457 ) ( IS-CRATE ?auto_389457 ) ( not ( = ?auto_389456 ?auto_389457 ) ) ( ON ?auto_389450 ?auto_389449 ) ( ON ?auto_389451 ?auto_389450 ) ( ON ?auto_389448 ?auto_389451 ) ( ON ?auto_389452 ?auto_389448 ) ( ON ?auto_389454 ?auto_389452 ) ( ON ?auto_389453 ?auto_389454 ) ( ON ?auto_389455 ?auto_389453 ) ( ON ?auto_389456 ?auto_389455 ) ( not ( = ?auto_389449 ?auto_389450 ) ) ( not ( = ?auto_389449 ?auto_389451 ) ) ( not ( = ?auto_389449 ?auto_389448 ) ) ( not ( = ?auto_389449 ?auto_389452 ) ) ( not ( = ?auto_389449 ?auto_389454 ) ) ( not ( = ?auto_389449 ?auto_389453 ) ) ( not ( = ?auto_389449 ?auto_389455 ) ) ( not ( = ?auto_389449 ?auto_389456 ) ) ( not ( = ?auto_389449 ?auto_389457 ) ) ( not ( = ?auto_389450 ?auto_389451 ) ) ( not ( = ?auto_389450 ?auto_389448 ) ) ( not ( = ?auto_389450 ?auto_389452 ) ) ( not ( = ?auto_389450 ?auto_389454 ) ) ( not ( = ?auto_389450 ?auto_389453 ) ) ( not ( = ?auto_389450 ?auto_389455 ) ) ( not ( = ?auto_389450 ?auto_389456 ) ) ( not ( = ?auto_389450 ?auto_389457 ) ) ( not ( = ?auto_389451 ?auto_389448 ) ) ( not ( = ?auto_389451 ?auto_389452 ) ) ( not ( = ?auto_389451 ?auto_389454 ) ) ( not ( = ?auto_389451 ?auto_389453 ) ) ( not ( = ?auto_389451 ?auto_389455 ) ) ( not ( = ?auto_389451 ?auto_389456 ) ) ( not ( = ?auto_389451 ?auto_389457 ) ) ( not ( = ?auto_389448 ?auto_389452 ) ) ( not ( = ?auto_389448 ?auto_389454 ) ) ( not ( = ?auto_389448 ?auto_389453 ) ) ( not ( = ?auto_389448 ?auto_389455 ) ) ( not ( = ?auto_389448 ?auto_389456 ) ) ( not ( = ?auto_389448 ?auto_389457 ) ) ( not ( = ?auto_389452 ?auto_389454 ) ) ( not ( = ?auto_389452 ?auto_389453 ) ) ( not ( = ?auto_389452 ?auto_389455 ) ) ( not ( = ?auto_389452 ?auto_389456 ) ) ( not ( = ?auto_389452 ?auto_389457 ) ) ( not ( = ?auto_389454 ?auto_389453 ) ) ( not ( = ?auto_389454 ?auto_389455 ) ) ( not ( = ?auto_389454 ?auto_389456 ) ) ( not ( = ?auto_389454 ?auto_389457 ) ) ( not ( = ?auto_389453 ?auto_389455 ) ) ( not ( = ?auto_389453 ?auto_389456 ) ) ( not ( = ?auto_389453 ?auto_389457 ) ) ( not ( = ?auto_389455 ?auto_389456 ) ) ( not ( = ?auto_389455 ?auto_389457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_389456 ?auto_389457 )
      ( MAKE-9CRATE-VERIFY ?auto_389449 ?auto_389450 ?auto_389451 ?auto_389448 ?auto_389452 ?auto_389454 ?auto_389453 ?auto_389455 ?auto_389456 ?auto_389457 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389529 - SURFACE
      ?auto_389530 - SURFACE
      ?auto_389531 - SURFACE
      ?auto_389528 - SURFACE
      ?auto_389532 - SURFACE
      ?auto_389534 - SURFACE
      ?auto_389533 - SURFACE
      ?auto_389535 - SURFACE
      ?auto_389536 - SURFACE
      ?auto_389537 - SURFACE
    )
    :vars
    (
      ?auto_389539 - HOIST
      ?auto_389538 - PLACE
      ?auto_389540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389539 ?auto_389538 ) ( SURFACE-AT ?auto_389536 ?auto_389538 ) ( CLEAR ?auto_389536 ) ( IS-CRATE ?auto_389537 ) ( not ( = ?auto_389536 ?auto_389537 ) ) ( TRUCK-AT ?auto_389540 ?auto_389538 ) ( AVAILABLE ?auto_389539 ) ( IN ?auto_389537 ?auto_389540 ) ( ON ?auto_389536 ?auto_389535 ) ( not ( = ?auto_389535 ?auto_389536 ) ) ( not ( = ?auto_389535 ?auto_389537 ) ) ( ON ?auto_389530 ?auto_389529 ) ( ON ?auto_389531 ?auto_389530 ) ( ON ?auto_389528 ?auto_389531 ) ( ON ?auto_389532 ?auto_389528 ) ( ON ?auto_389534 ?auto_389532 ) ( ON ?auto_389533 ?auto_389534 ) ( ON ?auto_389535 ?auto_389533 ) ( not ( = ?auto_389529 ?auto_389530 ) ) ( not ( = ?auto_389529 ?auto_389531 ) ) ( not ( = ?auto_389529 ?auto_389528 ) ) ( not ( = ?auto_389529 ?auto_389532 ) ) ( not ( = ?auto_389529 ?auto_389534 ) ) ( not ( = ?auto_389529 ?auto_389533 ) ) ( not ( = ?auto_389529 ?auto_389535 ) ) ( not ( = ?auto_389529 ?auto_389536 ) ) ( not ( = ?auto_389529 ?auto_389537 ) ) ( not ( = ?auto_389530 ?auto_389531 ) ) ( not ( = ?auto_389530 ?auto_389528 ) ) ( not ( = ?auto_389530 ?auto_389532 ) ) ( not ( = ?auto_389530 ?auto_389534 ) ) ( not ( = ?auto_389530 ?auto_389533 ) ) ( not ( = ?auto_389530 ?auto_389535 ) ) ( not ( = ?auto_389530 ?auto_389536 ) ) ( not ( = ?auto_389530 ?auto_389537 ) ) ( not ( = ?auto_389531 ?auto_389528 ) ) ( not ( = ?auto_389531 ?auto_389532 ) ) ( not ( = ?auto_389531 ?auto_389534 ) ) ( not ( = ?auto_389531 ?auto_389533 ) ) ( not ( = ?auto_389531 ?auto_389535 ) ) ( not ( = ?auto_389531 ?auto_389536 ) ) ( not ( = ?auto_389531 ?auto_389537 ) ) ( not ( = ?auto_389528 ?auto_389532 ) ) ( not ( = ?auto_389528 ?auto_389534 ) ) ( not ( = ?auto_389528 ?auto_389533 ) ) ( not ( = ?auto_389528 ?auto_389535 ) ) ( not ( = ?auto_389528 ?auto_389536 ) ) ( not ( = ?auto_389528 ?auto_389537 ) ) ( not ( = ?auto_389532 ?auto_389534 ) ) ( not ( = ?auto_389532 ?auto_389533 ) ) ( not ( = ?auto_389532 ?auto_389535 ) ) ( not ( = ?auto_389532 ?auto_389536 ) ) ( not ( = ?auto_389532 ?auto_389537 ) ) ( not ( = ?auto_389534 ?auto_389533 ) ) ( not ( = ?auto_389534 ?auto_389535 ) ) ( not ( = ?auto_389534 ?auto_389536 ) ) ( not ( = ?auto_389534 ?auto_389537 ) ) ( not ( = ?auto_389533 ?auto_389535 ) ) ( not ( = ?auto_389533 ?auto_389536 ) ) ( not ( = ?auto_389533 ?auto_389537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389535 ?auto_389536 ?auto_389537 )
      ( MAKE-9CRATE-VERIFY ?auto_389529 ?auto_389530 ?auto_389531 ?auto_389528 ?auto_389532 ?auto_389534 ?auto_389533 ?auto_389535 ?auto_389536 ?auto_389537 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389619 - SURFACE
      ?auto_389620 - SURFACE
      ?auto_389621 - SURFACE
      ?auto_389618 - SURFACE
      ?auto_389622 - SURFACE
      ?auto_389624 - SURFACE
      ?auto_389623 - SURFACE
      ?auto_389625 - SURFACE
      ?auto_389626 - SURFACE
      ?auto_389627 - SURFACE
    )
    :vars
    (
      ?auto_389631 - HOIST
      ?auto_389629 - PLACE
      ?auto_389628 - TRUCK
      ?auto_389630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389631 ?auto_389629 ) ( SURFACE-AT ?auto_389626 ?auto_389629 ) ( CLEAR ?auto_389626 ) ( IS-CRATE ?auto_389627 ) ( not ( = ?auto_389626 ?auto_389627 ) ) ( AVAILABLE ?auto_389631 ) ( IN ?auto_389627 ?auto_389628 ) ( ON ?auto_389626 ?auto_389625 ) ( not ( = ?auto_389625 ?auto_389626 ) ) ( not ( = ?auto_389625 ?auto_389627 ) ) ( TRUCK-AT ?auto_389628 ?auto_389630 ) ( not ( = ?auto_389630 ?auto_389629 ) ) ( ON ?auto_389620 ?auto_389619 ) ( ON ?auto_389621 ?auto_389620 ) ( ON ?auto_389618 ?auto_389621 ) ( ON ?auto_389622 ?auto_389618 ) ( ON ?auto_389624 ?auto_389622 ) ( ON ?auto_389623 ?auto_389624 ) ( ON ?auto_389625 ?auto_389623 ) ( not ( = ?auto_389619 ?auto_389620 ) ) ( not ( = ?auto_389619 ?auto_389621 ) ) ( not ( = ?auto_389619 ?auto_389618 ) ) ( not ( = ?auto_389619 ?auto_389622 ) ) ( not ( = ?auto_389619 ?auto_389624 ) ) ( not ( = ?auto_389619 ?auto_389623 ) ) ( not ( = ?auto_389619 ?auto_389625 ) ) ( not ( = ?auto_389619 ?auto_389626 ) ) ( not ( = ?auto_389619 ?auto_389627 ) ) ( not ( = ?auto_389620 ?auto_389621 ) ) ( not ( = ?auto_389620 ?auto_389618 ) ) ( not ( = ?auto_389620 ?auto_389622 ) ) ( not ( = ?auto_389620 ?auto_389624 ) ) ( not ( = ?auto_389620 ?auto_389623 ) ) ( not ( = ?auto_389620 ?auto_389625 ) ) ( not ( = ?auto_389620 ?auto_389626 ) ) ( not ( = ?auto_389620 ?auto_389627 ) ) ( not ( = ?auto_389621 ?auto_389618 ) ) ( not ( = ?auto_389621 ?auto_389622 ) ) ( not ( = ?auto_389621 ?auto_389624 ) ) ( not ( = ?auto_389621 ?auto_389623 ) ) ( not ( = ?auto_389621 ?auto_389625 ) ) ( not ( = ?auto_389621 ?auto_389626 ) ) ( not ( = ?auto_389621 ?auto_389627 ) ) ( not ( = ?auto_389618 ?auto_389622 ) ) ( not ( = ?auto_389618 ?auto_389624 ) ) ( not ( = ?auto_389618 ?auto_389623 ) ) ( not ( = ?auto_389618 ?auto_389625 ) ) ( not ( = ?auto_389618 ?auto_389626 ) ) ( not ( = ?auto_389618 ?auto_389627 ) ) ( not ( = ?auto_389622 ?auto_389624 ) ) ( not ( = ?auto_389622 ?auto_389623 ) ) ( not ( = ?auto_389622 ?auto_389625 ) ) ( not ( = ?auto_389622 ?auto_389626 ) ) ( not ( = ?auto_389622 ?auto_389627 ) ) ( not ( = ?auto_389624 ?auto_389623 ) ) ( not ( = ?auto_389624 ?auto_389625 ) ) ( not ( = ?auto_389624 ?auto_389626 ) ) ( not ( = ?auto_389624 ?auto_389627 ) ) ( not ( = ?auto_389623 ?auto_389625 ) ) ( not ( = ?auto_389623 ?auto_389626 ) ) ( not ( = ?auto_389623 ?auto_389627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389625 ?auto_389626 ?auto_389627 )
      ( MAKE-9CRATE-VERIFY ?auto_389619 ?auto_389620 ?auto_389621 ?auto_389618 ?auto_389622 ?auto_389624 ?auto_389623 ?auto_389625 ?auto_389626 ?auto_389627 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389718 - SURFACE
      ?auto_389719 - SURFACE
      ?auto_389720 - SURFACE
      ?auto_389717 - SURFACE
      ?auto_389721 - SURFACE
      ?auto_389723 - SURFACE
      ?auto_389722 - SURFACE
      ?auto_389724 - SURFACE
      ?auto_389725 - SURFACE
      ?auto_389726 - SURFACE
    )
    :vars
    (
      ?auto_389727 - HOIST
      ?auto_389728 - PLACE
      ?auto_389730 - TRUCK
      ?auto_389729 - PLACE
      ?auto_389731 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_389727 ?auto_389728 ) ( SURFACE-AT ?auto_389725 ?auto_389728 ) ( CLEAR ?auto_389725 ) ( IS-CRATE ?auto_389726 ) ( not ( = ?auto_389725 ?auto_389726 ) ) ( AVAILABLE ?auto_389727 ) ( ON ?auto_389725 ?auto_389724 ) ( not ( = ?auto_389724 ?auto_389725 ) ) ( not ( = ?auto_389724 ?auto_389726 ) ) ( TRUCK-AT ?auto_389730 ?auto_389729 ) ( not ( = ?auto_389729 ?auto_389728 ) ) ( HOIST-AT ?auto_389731 ?auto_389729 ) ( LIFTING ?auto_389731 ?auto_389726 ) ( not ( = ?auto_389727 ?auto_389731 ) ) ( ON ?auto_389719 ?auto_389718 ) ( ON ?auto_389720 ?auto_389719 ) ( ON ?auto_389717 ?auto_389720 ) ( ON ?auto_389721 ?auto_389717 ) ( ON ?auto_389723 ?auto_389721 ) ( ON ?auto_389722 ?auto_389723 ) ( ON ?auto_389724 ?auto_389722 ) ( not ( = ?auto_389718 ?auto_389719 ) ) ( not ( = ?auto_389718 ?auto_389720 ) ) ( not ( = ?auto_389718 ?auto_389717 ) ) ( not ( = ?auto_389718 ?auto_389721 ) ) ( not ( = ?auto_389718 ?auto_389723 ) ) ( not ( = ?auto_389718 ?auto_389722 ) ) ( not ( = ?auto_389718 ?auto_389724 ) ) ( not ( = ?auto_389718 ?auto_389725 ) ) ( not ( = ?auto_389718 ?auto_389726 ) ) ( not ( = ?auto_389719 ?auto_389720 ) ) ( not ( = ?auto_389719 ?auto_389717 ) ) ( not ( = ?auto_389719 ?auto_389721 ) ) ( not ( = ?auto_389719 ?auto_389723 ) ) ( not ( = ?auto_389719 ?auto_389722 ) ) ( not ( = ?auto_389719 ?auto_389724 ) ) ( not ( = ?auto_389719 ?auto_389725 ) ) ( not ( = ?auto_389719 ?auto_389726 ) ) ( not ( = ?auto_389720 ?auto_389717 ) ) ( not ( = ?auto_389720 ?auto_389721 ) ) ( not ( = ?auto_389720 ?auto_389723 ) ) ( not ( = ?auto_389720 ?auto_389722 ) ) ( not ( = ?auto_389720 ?auto_389724 ) ) ( not ( = ?auto_389720 ?auto_389725 ) ) ( not ( = ?auto_389720 ?auto_389726 ) ) ( not ( = ?auto_389717 ?auto_389721 ) ) ( not ( = ?auto_389717 ?auto_389723 ) ) ( not ( = ?auto_389717 ?auto_389722 ) ) ( not ( = ?auto_389717 ?auto_389724 ) ) ( not ( = ?auto_389717 ?auto_389725 ) ) ( not ( = ?auto_389717 ?auto_389726 ) ) ( not ( = ?auto_389721 ?auto_389723 ) ) ( not ( = ?auto_389721 ?auto_389722 ) ) ( not ( = ?auto_389721 ?auto_389724 ) ) ( not ( = ?auto_389721 ?auto_389725 ) ) ( not ( = ?auto_389721 ?auto_389726 ) ) ( not ( = ?auto_389723 ?auto_389722 ) ) ( not ( = ?auto_389723 ?auto_389724 ) ) ( not ( = ?auto_389723 ?auto_389725 ) ) ( not ( = ?auto_389723 ?auto_389726 ) ) ( not ( = ?auto_389722 ?auto_389724 ) ) ( not ( = ?auto_389722 ?auto_389725 ) ) ( not ( = ?auto_389722 ?auto_389726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389724 ?auto_389725 ?auto_389726 )
      ( MAKE-9CRATE-VERIFY ?auto_389718 ?auto_389719 ?auto_389720 ?auto_389717 ?auto_389721 ?auto_389723 ?auto_389722 ?auto_389724 ?auto_389725 ?auto_389726 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389826 - SURFACE
      ?auto_389827 - SURFACE
      ?auto_389828 - SURFACE
      ?auto_389825 - SURFACE
      ?auto_389829 - SURFACE
      ?auto_389831 - SURFACE
      ?auto_389830 - SURFACE
      ?auto_389832 - SURFACE
      ?auto_389833 - SURFACE
      ?auto_389834 - SURFACE
    )
    :vars
    (
      ?auto_389838 - HOIST
      ?auto_389839 - PLACE
      ?auto_389840 - TRUCK
      ?auto_389837 - PLACE
      ?auto_389836 - HOIST
      ?auto_389835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389838 ?auto_389839 ) ( SURFACE-AT ?auto_389833 ?auto_389839 ) ( CLEAR ?auto_389833 ) ( IS-CRATE ?auto_389834 ) ( not ( = ?auto_389833 ?auto_389834 ) ) ( AVAILABLE ?auto_389838 ) ( ON ?auto_389833 ?auto_389832 ) ( not ( = ?auto_389832 ?auto_389833 ) ) ( not ( = ?auto_389832 ?auto_389834 ) ) ( TRUCK-AT ?auto_389840 ?auto_389837 ) ( not ( = ?auto_389837 ?auto_389839 ) ) ( HOIST-AT ?auto_389836 ?auto_389837 ) ( not ( = ?auto_389838 ?auto_389836 ) ) ( AVAILABLE ?auto_389836 ) ( SURFACE-AT ?auto_389834 ?auto_389837 ) ( ON ?auto_389834 ?auto_389835 ) ( CLEAR ?auto_389834 ) ( not ( = ?auto_389833 ?auto_389835 ) ) ( not ( = ?auto_389834 ?auto_389835 ) ) ( not ( = ?auto_389832 ?auto_389835 ) ) ( ON ?auto_389827 ?auto_389826 ) ( ON ?auto_389828 ?auto_389827 ) ( ON ?auto_389825 ?auto_389828 ) ( ON ?auto_389829 ?auto_389825 ) ( ON ?auto_389831 ?auto_389829 ) ( ON ?auto_389830 ?auto_389831 ) ( ON ?auto_389832 ?auto_389830 ) ( not ( = ?auto_389826 ?auto_389827 ) ) ( not ( = ?auto_389826 ?auto_389828 ) ) ( not ( = ?auto_389826 ?auto_389825 ) ) ( not ( = ?auto_389826 ?auto_389829 ) ) ( not ( = ?auto_389826 ?auto_389831 ) ) ( not ( = ?auto_389826 ?auto_389830 ) ) ( not ( = ?auto_389826 ?auto_389832 ) ) ( not ( = ?auto_389826 ?auto_389833 ) ) ( not ( = ?auto_389826 ?auto_389834 ) ) ( not ( = ?auto_389826 ?auto_389835 ) ) ( not ( = ?auto_389827 ?auto_389828 ) ) ( not ( = ?auto_389827 ?auto_389825 ) ) ( not ( = ?auto_389827 ?auto_389829 ) ) ( not ( = ?auto_389827 ?auto_389831 ) ) ( not ( = ?auto_389827 ?auto_389830 ) ) ( not ( = ?auto_389827 ?auto_389832 ) ) ( not ( = ?auto_389827 ?auto_389833 ) ) ( not ( = ?auto_389827 ?auto_389834 ) ) ( not ( = ?auto_389827 ?auto_389835 ) ) ( not ( = ?auto_389828 ?auto_389825 ) ) ( not ( = ?auto_389828 ?auto_389829 ) ) ( not ( = ?auto_389828 ?auto_389831 ) ) ( not ( = ?auto_389828 ?auto_389830 ) ) ( not ( = ?auto_389828 ?auto_389832 ) ) ( not ( = ?auto_389828 ?auto_389833 ) ) ( not ( = ?auto_389828 ?auto_389834 ) ) ( not ( = ?auto_389828 ?auto_389835 ) ) ( not ( = ?auto_389825 ?auto_389829 ) ) ( not ( = ?auto_389825 ?auto_389831 ) ) ( not ( = ?auto_389825 ?auto_389830 ) ) ( not ( = ?auto_389825 ?auto_389832 ) ) ( not ( = ?auto_389825 ?auto_389833 ) ) ( not ( = ?auto_389825 ?auto_389834 ) ) ( not ( = ?auto_389825 ?auto_389835 ) ) ( not ( = ?auto_389829 ?auto_389831 ) ) ( not ( = ?auto_389829 ?auto_389830 ) ) ( not ( = ?auto_389829 ?auto_389832 ) ) ( not ( = ?auto_389829 ?auto_389833 ) ) ( not ( = ?auto_389829 ?auto_389834 ) ) ( not ( = ?auto_389829 ?auto_389835 ) ) ( not ( = ?auto_389831 ?auto_389830 ) ) ( not ( = ?auto_389831 ?auto_389832 ) ) ( not ( = ?auto_389831 ?auto_389833 ) ) ( not ( = ?auto_389831 ?auto_389834 ) ) ( not ( = ?auto_389831 ?auto_389835 ) ) ( not ( = ?auto_389830 ?auto_389832 ) ) ( not ( = ?auto_389830 ?auto_389833 ) ) ( not ( = ?auto_389830 ?auto_389834 ) ) ( not ( = ?auto_389830 ?auto_389835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389832 ?auto_389833 ?auto_389834 )
      ( MAKE-9CRATE-VERIFY ?auto_389826 ?auto_389827 ?auto_389828 ?auto_389825 ?auto_389829 ?auto_389831 ?auto_389830 ?auto_389832 ?auto_389833 ?auto_389834 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389935 - SURFACE
      ?auto_389936 - SURFACE
      ?auto_389937 - SURFACE
      ?auto_389934 - SURFACE
      ?auto_389938 - SURFACE
      ?auto_389940 - SURFACE
      ?auto_389939 - SURFACE
      ?auto_389941 - SURFACE
      ?auto_389942 - SURFACE
      ?auto_389943 - SURFACE
    )
    :vars
    (
      ?auto_389948 - HOIST
      ?auto_389946 - PLACE
      ?auto_389947 - PLACE
      ?auto_389949 - HOIST
      ?auto_389944 - SURFACE
      ?auto_389945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389948 ?auto_389946 ) ( SURFACE-AT ?auto_389942 ?auto_389946 ) ( CLEAR ?auto_389942 ) ( IS-CRATE ?auto_389943 ) ( not ( = ?auto_389942 ?auto_389943 ) ) ( AVAILABLE ?auto_389948 ) ( ON ?auto_389942 ?auto_389941 ) ( not ( = ?auto_389941 ?auto_389942 ) ) ( not ( = ?auto_389941 ?auto_389943 ) ) ( not ( = ?auto_389947 ?auto_389946 ) ) ( HOIST-AT ?auto_389949 ?auto_389947 ) ( not ( = ?auto_389948 ?auto_389949 ) ) ( AVAILABLE ?auto_389949 ) ( SURFACE-AT ?auto_389943 ?auto_389947 ) ( ON ?auto_389943 ?auto_389944 ) ( CLEAR ?auto_389943 ) ( not ( = ?auto_389942 ?auto_389944 ) ) ( not ( = ?auto_389943 ?auto_389944 ) ) ( not ( = ?auto_389941 ?auto_389944 ) ) ( TRUCK-AT ?auto_389945 ?auto_389946 ) ( ON ?auto_389936 ?auto_389935 ) ( ON ?auto_389937 ?auto_389936 ) ( ON ?auto_389934 ?auto_389937 ) ( ON ?auto_389938 ?auto_389934 ) ( ON ?auto_389940 ?auto_389938 ) ( ON ?auto_389939 ?auto_389940 ) ( ON ?auto_389941 ?auto_389939 ) ( not ( = ?auto_389935 ?auto_389936 ) ) ( not ( = ?auto_389935 ?auto_389937 ) ) ( not ( = ?auto_389935 ?auto_389934 ) ) ( not ( = ?auto_389935 ?auto_389938 ) ) ( not ( = ?auto_389935 ?auto_389940 ) ) ( not ( = ?auto_389935 ?auto_389939 ) ) ( not ( = ?auto_389935 ?auto_389941 ) ) ( not ( = ?auto_389935 ?auto_389942 ) ) ( not ( = ?auto_389935 ?auto_389943 ) ) ( not ( = ?auto_389935 ?auto_389944 ) ) ( not ( = ?auto_389936 ?auto_389937 ) ) ( not ( = ?auto_389936 ?auto_389934 ) ) ( not ( = ?auto_389936 ?auto_389938 ) ) ( not ( = ?auto_389936 ?auto_389940 ) ) ( not ( = ?auto_389936 ?auto_389939 ) ) ( not ( = ?auto_389936 ?auto_389941 ) ) ( not ( = ?auto_389936 ?auto_389942 ) ) ( not ( = ?auto_389936 ?auto_389943 ) ) ( not ( = ?auto_389936 ?auto_389944 ) ) ( not ( = ?auto_389937 ?auto_389934 ) ) ( not ( = ?auto_389937 ?auto_389938 ) ) ( not ( = ?auto_389937 ?auto_389940 ) ) ( not ( = ?auto_389937 ?auto_389939 ) ) ( not ( = ?auto_389937 ?auto_389941 ) ) ( not ( = ?auto_389937 ?auto_389942 ) ) ( not ( = ?auto_389937 ?auto_389943 ) ) ( not ( = ?auto_389937 ?auto_389944 ) ) ( not ( = ?auto_389934 ?auto_389938 ) ) ( not ( = ?auto_389934 ?auto_389940 ) ) ( not ( = ?auto_389934 ?auto_389939 ) ) ( not ( = ?auto_389934 ?auto_389941 ) ) ( not ( = ?auto_389934 ?auto_389942 ) ) ( not ( = ?auto_389934 ?auto_389943 ) ) ( not ( = ?auto_389934 ?auto_389944 ) ) ( not ( = ?auto_389938 ?auto_389940 ) ) ( not ( = ?auto_389938 ?auto_389939 ) ) ( not ( = ?auto_389938 ?auto_389941 ) ) ( not ( = ?auto_389938 ?auto_389942 ) ) ( not ( = ?auto_389938 ?auto_389943 ) ) ( not ( = ?auto_389938 ?auto_389944 ) ) ( not ( = ?auto_389940 ?auto_389939 ) ) ( not ( = ?auto_389940 ?auto_389941 ) ) ( not ( = ?auto_389940 ?auto_389942 ) ) ( not ( = ?auto_389940 ?auto_389943 ) ) ( not ( = ?auto_389940 ?auto_389944 ) ) ( not ( = ?auto_389939 ?auto_389941 ) ) ( not ( = ?auto_389939 ?auto_389942 ) ) ( not ( = ?auto_389939 ?auto_389943 ) ) ( not ( = ?auto_389939 ?auto_389944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389941 ?auto_389942 ?auto_389943 )
      ( MAKE-9CRATE-VERIFY ?auto_389935 ?auto_389936 ?auto_389937 ?auto_389934 ?auto_389938 ?auto_389940 ?auto_389939 ?auto_389941 ?auto_389942 ?auto_389943 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_390044 - SURFACE
      ?auto_390045 - SURFACE
      ?auto_390046 - SURFACE
      ?auto_390043 - SURFACE
      ?auto_390047 - SURFACE
      ?auto_390049 - SURFACE
      ?auto_390048 - SURFACE
      ?auto_390050 - SURFACE
      ?auto_390051 - SURFACE
      ?auto_390052 - SURFACE
    )
    :vars
    (
      ?auto_390058 - HOIST
      ?auto_390056 - PLACE
      ?auto_390054 - PLACE
      ?auto_390057 - HOIST
      ?auto_390055 - SURFACE
      ?auto_390053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_390058 ?auto_390056 ) ( IS-CRATE ?auto_390052 ) ( not ( = ?auto_390051 ?auto_390052 ) ) ( not ( = ?auto_390050 ?auto_390051 ) ) ( not ( = ?auto_390050 ?auto_390052 ) ) ( not ( = ?auto_390054 ?auto_390056 ) ) ( HOIST-AT ?auto_390057 ?auto_390054 ) ( not ( = ?auto_390058 ?auto_390057 ) ) ( AVAILABLE ?auto_390057 ) ( SURFACE-AT ?auto_390052 ?auto_390054 ) ( ON ?auto_390052 ?auto_390055 ) ( CLEAR ?auto_390052 ) ( not ( = ?auto_390051 ?auto_390055 ) ) ( not ( = ?auto_390052 ?auto_390055 ) ) ( not ( = ?auto_390050 ?auto_390055 ) ) ( TRUCK-AT ?auto_390053 ?auto_390056 ) ( SURFACE-AT ?auto_390050 ?auto_390056 ) ( CLEAR ?auto_390050 ) ( LIFTING ?auto_390058 ?auto_390051 ) ( IS-CRATE ?auto_390051 ) ( ON ?auto_390045 ?auto_390044 ) ( ON ?auto_390046 ?auto_390045 ) ( ON ?auto_390043 ?auto_390046 ) ( ON ?auto_390047 ?auto_390043 ) ( ON ?auto_390049 ?auto_390047 ) ( ON ?auto_390048 ?auto_390049 ) ( ON ?auto_390050 ?auto_390048 ) ( not ( = ?auto_390044 ?auto_390045 ) ) ( not ( = ?auto_390044 ?auto_390046 ) ) ( not ( = ?auto_390044 ?auto_390043 ) ) ( not ( = ?auto_390044 ?auto_390047 ) ) ( not ( = ?auto_390044 ?auto_390049 ) ) ( not ( = ?auto_390044 ?auto_390048 ) ) ( not ( = ?auto_390044 ?auto_390050 ) ) ( not ( = ?auto_390044 ?auto_390051 ) ) ( not ( = ?auto_390044 ?auto_390052 ) ) ( not ( = ?auto_390044 ?auto_390055 ) ) ( not ( = ?auto_390045 ?auto_390046 ) ) ( not ( = ?auto_390045 ?auto_390043 ) ) ( not ( = ?auto_390045 ?auto_390047 ) ) ( not ( = ?auto_390045 ?auto_390049 ) ) ( not ( = ?auto_390045 ?auto_390048 ) ) ( not ( = ?auto_390045 ?auto_390050 ) ) ( not ( = ?auto_390045 ?auto_390051 ) ) ( not ( = ?auto_390045 ?auto_390052 ) ) ( not ( = ?auto_390045 ?auto_390055 ) ) ( not ( = ?auto_390046 ?auto_390043 ) ) ( not ( = ?auto_390046 ?auto_390047 ) ) ( not ( = ?auto_390046 ?auto_390049 ) ) ( not ( = ?auto_390046 ?auto_390048 ) ) ( not ( = ?auto_390046 ?auto_390050 ) ) ( not ( = ?auto_390046 ?auto_390051 ) ) ( not ( = ?auto_390046 ?auto_390052 ) ) ( not ( = ?auto_390046 ?auto_390055 ) ) ( not ( = ?auto_390043 ?auto_390047 ) ) ( not ( = ?auto_390043 ?auto_390049 ) ) ( not ( = ?auto_390043 ?auto_390048 ) ) ( not ( = ?auto_390043 ?auto_390050 ) ) ( not ( = ?auto_390043 ?auto_390051 ) ) ( not ( = ?auto_390043 ?auto_390052 ) ) ( not ( = ?auto_390043 ?auto_390055 ) ) ( not ( = ?auto_390047 ?auto_390049 ) ) ( not ( = ?auto_390047 ?auto_390048 ) ) ( not ( = ?auto_390047 ?auto_390050 ) ) ( not ( = ?auto_390047 ?auto_390051 ) ) ( not ( = ?auto_390047 ?auto_390052 ) ) ( not ( = ?auto_390047 ?auto_390055 ) ) ( not ( = ?auto_390049 ?auto_390048 ) ) ( not ( = ?auto_390049 ?auto_390050 ) ) ( not ( = ?auto_390049 ?auto_390051 ) ) ( not ( = ?auto_390049 ?auto_390052 ) ) ( not ( = ?auto_390049 ?auto_390055 ) ) ( not ( = ?auto_390048 ?auto_390050 ) ) ( not ( = ?auto_390048 ?auto_390051 ) ) ( not ( = ?auto_390048 ?auto_390052 ) ) ( not ( = ?auto_390048 ?auto_390055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_390050 ?auto_390051 ?auto_390052 )
      ( MAKE-9CRATE-VERIFY ?auto_390044 ?auto_390045 ?auto_390046 ?auto_390043 ?auto_390047 ?auto_390049 ?auto_390048 ?auto_390050 ?auto_390051 ?auto_390052 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_390153 - SURFACE
      ?auto_390154 - SURFACE
      ?auto_390155 - SURFACE
      ?auto_390152 - SURFACE
      ?auto_390156 - SURFACE
      ?auto_390158 - SURFACE
      ?auto_390157 - SURFACE
      ?auto_390159 - SURFACE
      ?auto_390160 - SURFACE
      ?auto_390161 - SURFACE
    )
    :vars
    (
      ?auto_390165 - HOIST
      ?auto_390162 - PLACE
      ?auto_390163 - PLACE
      ?auto_390164 - HOIST
      ?auto_390167 - SURFACE
      ?auto_390166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_390165 ?auto_390162 ) ( IS-CRATE ?auto_390161 ) ( not ( = ?auto_390160 ?auto_390161 ) ) ( not ( = ?auto_390159 ?auto_390160 ) ) ( not ( = ?auto_390159 ?auto_390161 ) ) ( not ( = ?auto_390163 ?auto_390162 ) ) ( HOIST-AT ?auto_390164 ?auto_390163 ) ( not ( = ?auto_390165 ?auto_390164 ) ) ( AVAILABLE ?auto_390164 ) ( SURFACE-AT ?auto_390161 ?auto_390163 ) ( ON ?auto_390161 ?auto_390167 ) ( CLEAR ?auto_390161 ) ( not ( = ?auto_390160 ?auto_390167 ) ) ( not ( = ?auto_390161 ?auto_390167 ) ) ( not ( = ?auto_390159 ?auto_390167 ) ) ( TRUCK-AT ?auto_390166 ?auto_390162 ) ( SURFACE-AT ?auto_390159 ?auto_390162 ) ( CLEAR ?auto_390159 ) ( IS-CRATE ?auto_390160 ) ( AVAILABLE ?auto_390165 ) ( IN ?auto_390160 ?auto_390166 ) ( ON ?auto_390154 ?auto_390153 ) ( ON ?auto_390155 ?auto_390154 ) ( ON ?auto_390152 ?auto_390155 ) ( ON ?auto_390156 ?auto_390152 ) ( ON ?auto_390158 ?auto_390156 ) ( ON ?auto_390157 ?auto_390158 ) ( ON ?auto_390159 ?auto_390157 ) ( not ( = ?auto_390153 ?auto_390154 ) ) ( not ( = ?auto_390153 ?auto_390155 ) ) ( not ( = ?auto_390153 ?auto_390152 ) ) ( not ( = ?auto_390153 ?auto_390156 ) ) ( not ( = ?auto_390153 ?auto_390158 ) ) ( not ( = ?auto_390153 ?auto_390157 ) ) ( not ( = ?auto_390153 ?auto_390159 ) ) ( not ( = ?auto_390153 ?auto_390160 ) ) ( not ( = ?auto_390153 ?auto_390161 ) ) ( not ( = ?auto_390153 ?auto_390167 ) ) ( not ( = ?auto_390154 ?auto_390155 ) ) ( not ( = ?auto_390154 ?auto_390152 ) ) ( not ( = ?auto_390154 ?auto_390156 ) ) ( not ( = ?auto_390154 ?auto_390158 ) ) ( not ( = ?auto_390154 ?auto_390157 ) ) ( not ( = ?auto_390154 ?auto_390159 ) ) ( not ( = ?auto_390154 ?auto_390160 ) ) ( not ( = ?auto_390154 ?auto_390161 ) ) ( not ( = ?auto_390154 ?auto_390167 ) ) ( not ( = ?auto_390155 ?auto_390152 ) ) ( not ( = ?auto_390155 ?auto_390156 ) ) ( not ( = ?auto_390155 ?auto_390158 ) ) ( not ( = ?auto_390155 ?auto_390157 ) ) ( not ( = ?auto_390155 ?auto_390159 ) ) ( not ( = ?auto_390155 ?auto_390160 ) ) ( not ( = ?auto_390155 ?auto_390161 ) ) ( not ( = ?auto_390155 ?auto_390167 ) ) ( not ( = ?auto_390152 ?auto_390156 ) ) ( not ( = ?auto_390152 ?auto_390158 ) ) ( not ( = ?auto_390152 ?auto_390157 ) ) ( not ( = ?auto_390152 ?auto_390159 ) ) ( not ( = ?auto_390152 ?auto_390160 ) ) ( not ( = ?auto_390152 ?auto_390161 ) ) ( not ( = ?auto_390152 ?auto_390167 ) ) ( not ( = ?auto_390156 ?auto_390158 ) ) ( not ( = ?auto_390156 ?auto_390157 ) ) ( not ( = ?auto_390156 ?auto_390159 ) ) ( not ( = ?auto_390156 ?auto_390160 ) ) ( not ( = ?auto_390156 ?auto_390161 ) ) ( not ( = ?auto_390156 ?auto_390167 ) ) ( not ( = ?auto_390158 ?auto_390157 ) ) ( not ( = ?auto_390158 ?auto_390159 ) ) ( not ( = ?auto_390158 ?auto_390160 ) ) ( not ( = ?auto_390158 ?auto_390161 ) ) ( not ( = ?auto_390158 ?auto_390167 ) ) ( not ( = ?auto_390157 ?auto_390159 ) ) ( not ( = ?auto_390157 ?auto_390160 ) ) ( not ( = ?auto_390157 ?auto_390161 ) ) ( not ( = ?auto_390157 ?auto_390167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_390159 ?auto_390160 ?auto_390161 )
      ( MAKE-9CRATE-VERIFY ?auto_390153 ?auto_390154 ?auto_390155 ?auto_390152 ?auto_390156 ?auto_390158 ?auto_390157 ?auto_390159 ?auto_390160 ?auto_390161 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395718 - SURFACE
      ?auto_395719 - SURFACE
      ?auto_395720 - SURFACE
      ?auto_395717 - SURFACE
      ?auto_395721 - SURFACE
      ?auto_395723 - SURFACE
      ?auto_395722 - SURFACE
      ?auto_395724 - SURFACE
      ?auto_395725 - SURFACE
      ?auto_395726 - SURFACE
      ?auto_395727 - SURFACE
    )
    :vars
    (
      ?auto_395728 - HOIST
      ?auto_395729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395728 ?auto_395729 ) ( SURFACE-AT ?auto_395726 ?auto_395729 ) ( CLEAR ?auto_395726 ) ( LIFTING ?auto_395728 ?auto_395727 ) ( IS-CRATE ?auto_395727 ) ( not ( = ?auto_395726 ?auto_395727 ) ) ( ON ?auto_395719 ?auto_395718 ) ( ON ?auto_395720 ?auto_395719 ) ( ON ?auto_395717 ?auto_395720 ) ( ON ?auto_395721 ?auto_395717 ) ( ON ?auto_395723 ?auto_395721 ) ( ON ?auto_395722 ?auto_395723 ) ( ON ?auto_395724 ?auto_395722 ) ( ON ?auto_395725 ?auto_395724 ) ( ON ?auto_395726 ?auto_395725 ) ( not ( = ?auto_395718 ?auto_395719 ) ) ( not ( = ?auto_395718 ?auto_395720 ) ) ( not ( = ?auto_395718 ?auto_395717 ) ) ( not ( = ?auto_395718 ?auto_395721 ) ) ( not ( = ?auto_395718 ?auto_395723 ) ) ( not ( = ?auto_395718 ?auto_395722 ) ) ( not ( = ?auto_395718 ?auto_395724 ) ) ( not ( = ?auto_395718 ?auto_395725 ) ) ( not ( = ?auto_395718 ?auto_395726 ) ) ( not ( = ?auto_395718 ?auto_395727 ) ) ( not ( = ?auto_395719 ?auto_395720 ) ) ( not ( = ?auto_395719 ?auto_395717 ) ) ( not ( = ?auto_395719 ?auto_395721 ) ) ( not ( = ?auto_395719 ?auto_395723 ) ) ( not ( = ?auto_395719 ?auto_395722 ) ) ( not ( = ?auto_395719 ?auto_395724 ) ) ( not ( = ?auto_395719 ?auto_395725 ) ) ( not ( = ?auto_395719 ?auto_395726 ) ) ( not ( = ?auto_395719 ?auto_395727 ) ) ( not ( = ?auto_395720 ?auto_395717 ) ) ( not ( = ?auto_395720 ?auto_395721 ) ) ( not ( = ?auto_395720 ?auto_395723 ) ) ( not ( = ?auto_395720 ?auto_395722 ) ) ( not ( = ?auto_395720 ?auto_395724 ) ) ( not ( = ?auto_395720 ?auto_395725 ) ) ( not ( = ?auto_395720 ?auto_395726 ) ) ( not ( = ?auto_395720 ?auto_395727 ) ) ( not ( = ?auto_395717 ?auto_395721 ) ) ( not ( = ?auto_395717 ?auto_395723 ) ) ( not ( = ?auto_395717 ?auto_395722 ) ) ( not ( = ?auto_395717 ?auto_395724 ) ) ( not ( = ?auto_395717 ?auto_395725 ) ) ( not ( = ?auto_395717 ?auto_395726 ) ) ( not ( = ?auto_395717 ?auto_395727 ) ) ( not ( = ?auto_395721 ?auto_395723 ) ) ( not ( = ?auto_395721 ?auto_395722 ) ) ( not ( = ?auto_395721 ?auto_395724 ) ) ( not ( = ?auto_395721 ?auto_395725 ) ) ( not ( = ?auto_395721 ?auto_395726 ) ) ( not ( = ?auto_395721 ?auto_395727 ) ) ( not ( = ?auto_395723 ?auto_395722 ) ) ( not ( = ?auto_395723 ?auto_395724 ) ) ( not ( = ?auto_395723 ?auto_395725 ) ) ( not ( = ?auto_395723 ?auto_395726 ) ) ( not ( = ?auto_395723 ?auto_395727 ) ) ( not ( = ?auto_395722 ?auto_395724 ) ) ( not ( = ?auto_395722 ?auto_395725 ) ) ( not ( = ?auto_395722 ?auto_395726 ) ) ( not ( = ?auto_395722 ?auto_395727 ) ) ( not ( = ?auto_395724 ?auto_395725 ) ) ( not ( = ?auto_395724 ?auto_395726 ) ) ( not ( = ?auto_395724 ?auto_395727 ) ) ( not ( = ?auto_395725 ?auto_395726 ) ) ( not ( = ?auto_395725 ?auto_395727 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_395726 ?auto_395727 )
      ( MAKE-10CRATE-VERIFY ?auto_395718 ?auto_395719 ?auto_395720 ?auto_395717 ?auto_395721 ?auto_395723 ?auto_395722 ?auto_395724 ?auto_395725 ?auto_395726 ?auto_395727 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395812 - SURFACE
      ?auto_395813 - SURFACE
      ?auto_395814 - SURFACE
      ?auto_395811 - SURFACE
      ?auto_395815 - SURFACE
      ?auto_395817 - SURFACE
      ?auto_395816 - SURFACE
      ?auto_395818 - SURFACE
      ?auto_395819 - SURFACE
      ?auto_395820 - SURFACE
      ?auto_395821 - SURFACE
    )
    :vars
    (
      ?auto_395822 - HOIST
      ?auto_395824 - PLACE
      ?auto_395823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_395822 ?auto_395824 ) ( SURFACE-AT ?auto_395820 ?auto_395824 ) ( CLEAR ?auto_395820 ) ( IS-CRATE ?auto_395821 ) ( not ( = ?auto_395820 ?auto_395821 ) ) ( TRUCK-AT ?auto_395823 ?auto_395824 ) ( AVAILABLE ?auto_395822 ) ( IN ?auto_395821 ?auto_395823 ) ( ON ?auto_395820 ?auto_395819 ) ( not ( = ?auto_395819 ?auto_395820 ) ) ( not ( = ?auto_395819 ?auto_395821 ) ) ( ON ?auto_395813 ?auto_395812 ) ( ON ?auto_395814 ?auto_395813 ) ( ON ?auto_395811 ?auto_395814 ) ( ON ?auto_395815 ?auto_395811 ) ( ON ?auto_395817 ?auto_395815 ) ( ON ?auto_395816 ?auto_395817 ) ( ON ?auto_395818 ?auto_395816 ) ( ON ?auto_395819 ?auto_395818 ) ( not ( = ?auto_395812 ?auto_395813 ) ) ( not ( = ?auto_395812 ?auto_395814 ) ) ( not ( = ?auto_395812 ?auto_395811 ) ) ( not ( = ?auto_395812 ?auto_395815 ) ) ( not ( = ?auto_395812 ?auto_395817 ) ) ( not ( = ?auto_395812 ?auto_395816 ) ) ( not ( = ?auto_395812 ?auto_395818 ) ) ( not ( = ?auto_395812 ?auto_395819 ) ) ( not ( = ?auto_395812 ?auto_395820 ) ) ( not ( = ?auto_395812 ?auto_395821 ) ) ( not ( = ?auto_395813 ?auto_395814 ) ) ( not ( = ?auto_395813 ?auto_395811 ) ) ( not ( = ?auto_395813 ?auto_395815 ) ) ( not ( = ?auto_395813 ?auto_395817 ) ) ( not ( = ?auto_395813 ?auto_395816 ) ) ( not ( = ?auto_395813 ?auto_395818 ) ) ( not ( = ?auto_395813 ?auto_395819 ) ) ( not ( = ?auto_395813 ?auto_395820 ) ) ( not ( = ?auto_395813 ?auto_395821 ) ) ( not ( = ?auto_395814 ?auto_395811 ) ) ( not ( = ?auto_395814 ?auto_395815 ) ) ( not ( = ?auto_395814 ?auto_395817 ) ) ( not ( = ?auto_395814 ?auto_395816 ) ) ( not ( = ?auto_395814 ?auto_395818 ) ) ( not ( = ?auto_395814 ?auto_395819 ) ) ( not ( = ?auto_395814 ?auto_395820 ) ) ( not ( = ?auto_395814 ?auto_395821 ) ) ( not ( = ?auto_395811 ?auto_395815 ) ) ( not ( = ?auto_395811 ?auto_395817 ) ) ( not ( = ?auto_395811 ?auto_395816 ) ) ( not ( = ?auto_395811 ?auto_395818 ) ) ( not ( = ?auto_395811 ?auto_395819 ) ) ( not ( = ?auto_395811 ?auto_395820 ) ) ( not ( = ?auto_395811 ?auto_395821 ) ) ( not ( = ?auto_395815 ?auto_395817 ) ) ( not ( = ?auto_395815 ?auto_395816 ) ) ( not ( = ?auto_395815 ?auto_395818 ) ) ( not ( = ?auto_395815 ?auto_395819 ) ) ( not ( = ?auto_395815 ?auto_395820 ) ) ( not ( = ?auto_395815 ?auto_395821 ) ) ( not ( = ?auto_395817 ?auto_395816 ) ) ( not ( = ?auto_395817 ?auto_395818 ) ) ( not ( = ?auto_395817 ?auto_395819 ) ) ( not ( = ?auto_395817 ?auto_395820 ) ) ( not ( = ?auto_395817 ?auto_395821 ) ) ( not ( = ?auto_395816 ?auto_395818 ) ) ( not ( = ?auto_395816 ?auto_395819 ) ) ( not ( = ?auto_395816 ?auto_395820 ) ) ( not ( = ?auto_395816 ?auto_395821 ) ) ( not ( = ?auto_395818 ?auto_395819 ) ) ( not ( = ?auto_395818 ?auto_395820 ) ) ( not ( = ?auto_395818 ?auto_395821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395819 ?auto_395820 ?auto_395821 )
      ( MAKE-10CRATE-VERIFY ?auto_395812 ?auto_395813 ?auto_395814 ?auto_395811 ?auto_395815 ?auto_395817 ?auto_395816 ?auto_395818 ?auto_395819 ?auto_395820 ?auto_395821 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395917 - SURFACE
      ?auto_395918 - SURFACE
      ?auto_395919 - SURFACE
      ?auto_395916 - SURFACE
      ?auto_395920 - SURFACE
      ?auto_395922 - SURFACE
      ?auto_395921 - SURFACE
      ?auto_395923 - SURFACE
      ?auto_395924 - SURFACE
      ?auto_395925 - SURFACE
      ?auto_395926 - SURFACE
    )
    :vars
    (
      ?auto_395929 - HOIST
      ?auto_395930 - PLACE
      ?auto_395928 - TRUCK
      ?auto_395927 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395929 ?auto_395930 ) ( SURFACE-AT ?auto_395925 ?auto_395930 ) ( CLEAR ?auto_395925 ) ( IS-CRATE ?auto_395926 ) ( not ( = ?auto_395925 ?auto_395926 ) ) ( AVAILABLE ?auto_395929 ) ( IN ?auto_395926 ?auto_395928 ) ( ON ?auto_395925 ?auto_395924 ) ( not ( = ?auto_395924 ?auto_395925 ) ) ( not ( = ?auto_395924 ?auto_395926 ) ) ( TRUCK-AT ?auto_395928 ?auto_395927 ) ( not ( = ?auto_395927 ?auto_395930 ) ) ( ON ?auto_395918 ?auto_395917 ) ( ON ?auto_395919 ?auto_395918 ) ( ON ?auto_395916 ?auto_395919 ) ( ON ?auto_395920 ?auto_395916 ) ( ON ?auto_395922 ?auto_395920 ) ( ON ?auto_395921 ?auto_395922 ) ( ON ?auto_395923 ?auto_395921 ) ( ON ?auto_395924 ?auto_395923 ) ( not ( = ?auto_395917 ?auto_395918 ) ) ( not ( = ?auto_395917 ?auto_395919 ) ) ( not ( = ?auto_395917 ?auto_395916 ) ) ( not ( = ?auto_395917 ?auto_395920 ) ) ( not ( = ?auto_395917 ?auto_395922 ) ) ( not ( = ?auto_395917 ?auto_395921 ) ) ( not ( = ?auto_395917 ?auto_395923 ) ) ( not ( = ?auto_395917 ?auto_395924 ) ) ( not ( = ?auto_395917 ?auto_395925 ) ) ( not ( = ?auto_395917 ?auto_395926 ) ) ( not ( = ?auto_395918 ?auto_395919 ) ) ( not ( = ?auto_395918 ?auto_395916 ) ) ( not ( = ?auto_395918 ?auto_395920 ) ) ( not ( = ?auto_395918 ?auto_395922 ) ) ( not ( = ?auto_395918 ?auto_395921 ) ) ( not ( = ?auto_395918 ?auto_395923 ) ) ( not ( = ?auto_395918 ?auto_395924 ) ) ( not ( = ?auto_395918 ?auto_395925 ) ) ( not ( = ?auto_395918 ?auto_395926 ) ) ( not ( = ?auto_395919 ?auto_395916 ) ) ( not ( = ?auto_395919 ?auto_395920 ) ) ( not ( = ?auto_395919 ?auto_395922 ) ) ( not ( = ?auto_395919 ?auto_395921 ) ) ( not ( = ?auto_395919 ?auto_395923 ) ) ( not ( = ?auto_395919 ?auto_395924 ) ) ( not ( = ?auto_395919 ?auto_395925 ) ) ( not ( = ?auto_395919 ?auto_395926 ) ) ( not ( = ?auto_395916 ?auto_395920 ) ) ( not ( = ?auto_395916 ?auto_395922 ) ) ( not ( = ?auto_395916 ?auto_395921 ) ) ( not ( = ?auto_395916 ?auto_395923 ) ) ( not ( = ?auto_395916 ?auto_395924 ) ) ( not ( = ?auto_395916 ?auto_395925 ) ) ( not ( = ?auto_395916 ?auto_395926 ) ) ( not ( = ?auto_395920 ?auto_395922 ) ) ( not ( = ?auto_395920 ?auto_395921 ) ) ( not ( = ?auto_395920 ?auto_395923 ) ) ( not ( = ?auto_395920 ?auto_395924 ) ) ( not ( = ?auto_395920 ?auto_395925 ) ) ( not ( = ?auto_395920 ?auto_395926 ) ) ( not ( = ?auto_395922 ?auto_395921 ) ) ( not ( = ?auto_395922 ?auto_395923 ) ) ( not ( = ?auto_395922 ?auto_395924 ) ) ( not ( = ?auto_395922 ?auto_395925 ) ) ( not ( = ?auto_395922 ?auto_395926 ) ) ( not ( = ?auto_395921 ?auto_395923 ) ) ( not ( = ?auto_395921 ?auto_395924 ) ) ( not ( = ?auto_395921 ?auto_395925 ) ) ( not ( = ?auto_395921 ?auto_395926 ) ) ( not ( = ?auto_395923 ?auto_395924 ) ) ( not ( = ?auto_395923 ?auto_395925 ) ) ( not ( = ?auto_395923 ?auto_395926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395924 ?auto_395925 ?auto_395926 )
      ( MAKE-10CRATE-VERIFY ?auto_395917 ?auto_395918 ?auto_395919 ?auto_395916 ?auto_395920 ?auto_395922 ?auto_395921 ?auto_395923 ?auto_395924 ?auto_395925 ?auto_395926 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396032 - SURFACE
      ?auto_396033 - SURFACE
      ?auto_396034 - SURFACE
      ?auto_396031 - SURFACE
      ?auto_396035 - SURFACE
      ?auto_396037 - SURFACE
      ?auto_396036 - SURFACE
      ?auto_396038 - SURFACE
      ?auto_396039 - SURFACE
      ?auto_396040 - SURFACE
      ?auto_396041 - SURFACE
    )
    :vars
    (
      ?auto_396045 - HOIST
      ?auto_396043 - PLACE
      ?auto_396042 - TRUCK
      ?auto_396046 - PLACE
      ?auto_396044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_396045 ?auto_396043 ) ( SURFACE-AT ?auto_396040 ?auto_396043 ) ( CLEAR ?auto_396040 ) ( IS-CRATE ?auto_396041 ) ( not ( = ?auto_396040 ?auto_396041 ) ) ( AVAILABLE ?auto_396045 ) ( ON ?auto_396040 ?auto_396039 ) ( not ( = ?auto_396039 ?auto_396040 ) ) ( not ( = ?auto_396039 ?auto_396041 ) ) ( TRUCK-AT ?auto_396042 ?auto_396046 ) ( not ( = ?auto_396046 ?auto_396043 ) ) ( HOIST-AT ?auto_396044 ?auto_396046 ) ( LIFTING ?auto_396044 ?auto_396041 ) ( not ( = ?auto_396045 ?auto_396044 ) ) ( ON ?auto_396033 ?auto_396032 ) ( ON ?auto_396034 ?auto_396033 ) ( ON ?auto_396031 ?auto_396034 ) ( ON ?auto_396035 ?auto_396031 ) ( ON ?auto_396037 ?auto_396035 ) ( ON ?auto_396036 ?auto_396037 ) ( ON ?auto_396038 ?auto_396036 ) ( ON ?auto_396039 ?auto_396038 ) ( not ( = ?auto_396032 ?auto_396033 ) ) ( not ( = ?auto_396032 ?auto_396034 ) ) ( not ( = ?auto_396032 ?auto_396031 ) ) ( not ( = ?auto_396032 ?auto_396035 ) ) ( not ( = ?auto_396032 ?auto_396037 ) ) ( not ( = ?auto_396032 ?auto_396036 ) ) ( not ( = ?auto_396032 ?auto_396038 ) ) ( not ( = ?auto_396032 ?auto_396039 ) ) ( not ( = ?auto_396032 ?auto_396040 ) ) ( not ( = ?auto_396032 ?auto_396041 ) ) ( not ( = ?auto_396033 ?auto_396034 ) ) ( not ( = ?auto_396033 ?auto_396031 ) ) ( not ( = ?auto_396033 ?auto_396035 ) ) ( not ( = ?auto_396033 ?auto_396037 ) ) ( not ( = ?auto_396033 ?auto_396036 ) ) ( not ( = ?auto_396033 ?auto_396038 ) ) ( not ( = ?auto_396033 ?auto_396039 ) ) ( not ( = ?auto_396033 ?auto_396040 ) ) ( not ( = ?auto_396033 ?auto_396041 ) ) ( not ( = ?auto_396034 ?auto_396031 ) ) ( not ( = ?auto_396034 ?auto_396035 ) ) ( not ( = ?auto_396034 ?auto_396037 ) ) ( not ( = ?auto_396034 ?auto_396036 ) ) ( not ( = ?auto_396034 ?auto_396038 ) ) ( not ( = ?auto_396034 ?auto_396039 ) ) ( not ( = ?auto_396034 ?auto_396040 ) ) ( not ( = ?auto_396034 ?auto_396041 ) ) ( not ( = ?auto_396031 ?auto_396035 ) ) ( not ( = ?auto_396031 ?auto_396037 ) ) ( not ( = ?auto_396031 ?auto_396036 ) ) ( not ( = ?auto_396031 ?auto_396038 ) ) ( not ( = ?auto_396031 ?auto_396039 ) ) ( not ( = ?auto_396031 ?auto_396040 ) ) ( not ( = ?auto_396031 ?auto_396041 ) ) ( not ( = ?auto_396035 ?auto_396037 ) ) ( not ( = ?auto_396035 ?auto_396036 ) ) ( not ( = ?auto_396035 ?auto_396038 ) ) ( not ( = ?auto_396035 ?auto_396039 ) ) ( not ( = ?auto_396035 ?auto_396040 ) ) ( not ( = ?auto_396035 ?auto_396041 ) ) ( not ( = ?auto_396037 ?auto_396036 ) ) ( not ( = ?auto_396037 ?auto_396038 ) ) ( not ( = ?auto_396037 ?auto_396039 ) ) ( not ( = ?auto_396037 ?auto_396040 ) ) ( not ( = ?auto_396037 ?auto_396041 ) ) ( not ( = ?auto_396036 ?auto_396038 ) ) ( not ( = ?auto_396036 ?auto_396039 ) ) ( not ( = ?auto_396036 ?auto_396040 ) ) ( not ( = ?auto_396036 ?auto_396041 ) ) ( not ( = ?auto_396038 ?auto_396039 ) ) ( not ( = ?auto_396038 ?auto_396040 ) ) ( not ( = ?auto_396038 ?auto_396041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396039 ?auto_396040 ?auto_396041 )
      ( MAKE-10CRATE-VERIFY ?auto_396032 ?auto_396033 ?auto_396034 ?auto_396031 ?auto_396035 ?auto_396037 ?auto_396036 ?auto_396038 ?auto_396039 ?auto_396040 ?auto_396041 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396157 - SURFACE
      ?auto_396158 - SURFACE
      ?auto_396159 - SURFACE
      ?auto_396156 - SURFACE
      ?auto_396160 - SURFACE
      ?auto_396162 - SURFACE
      ?auto_396161 - SURFACE
      ?auto_396163 - SURFACE
      ?auto_396164 - SURFACE
      ?auto_396165 - SURFACE
      ?auto_396166 - SURFACE
    )
    :vars
    (
      ?auto_396172 - HOIST
      ?auto_396169 - PLACE
      ?auto_396171 - TRUCK
      ?auto_396167 - PLACE
      ?auto_396168 - HOIST
      ?auto_396170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_396172 ?auto_396169 ) ( SURFACE-AT ?auto_396165 ?auto_396169 ) ( CLEAR ?auto_396165 ) ( IS-CRATE ?auto_396166 ) ( not ( = ?auto_396165 ?auto_396166 ) ) ( AVAILABLE ?auto_396172 ) ( ON ?auto_396165 ?auto_396164 ) ( not ( = ?auto_396164 ?auto_396165 ) ) ( not ( = ?auto_396164 ?auto_396166 ) ) ( TRUCK-AT ?auto_396171 ?auto_396167 ) ( not ( = ?auto_396167 ?auto_396169 ) ) ( HOIST-AT ?auto_396168 ?auto_396167 ) ( not ( = ?auto_396172 ?auto_396168 ) ) ( AVAILABLE ?auto_396168 ) ( SURFACE-AT ?auto_396166 ?auto_396167 ) ( ON ?auto_396166 ?auto_396170 ) ( CLEAR ?auto_396166 ) ( not ( = ?auto_396165 ?auto_396170 ) ) ( not ( = ?auto_396166 ?auto_396170 ) ) ( not ( = ?auto_396164 ?auto_396170 ) ) ( ON ?auto_396158 ?auto_396157 ) ( ON ?auto_396159 ?auto_396158 ) ( ON ?auto_396156 ?auto_396159 ) ( ON ?auto_396160 ?auto_396156 ) ( ON ?auto_396162 ?auto_396160 ) ( ON ?auto_396161 ?auto_396162 ) ( ON ?auto_396163 ?auto_396161 ) ( ON ?auto_396164 ?auto_396163 ) ( not ( = ?auto_396157 ?auto_396158 ) ) ( not ( = ?auto_396157 ?auto_396159 ) ) ( not ( = ?auto_396157 ?auto_396156 ) ) ( not ( = ?auto_396157 ?auto_396160 ) ) ( not ( = ?auto_396157 ?auto_396162 ) ) ( not ( = ?auto_396157 ?auto_396161 ) ) ( not ( = ?auto_396157 ?auto_396163 ) ) ( not ( = ?auto_396157 ?auto_396164 ) ) ( not ( = ?auto_396157 ?auto_396165 ) ) ( not ( = ?auto_396157 ?auto_396166 ) ) ( not ( = ?auto_396157 ?auto_396170 ) ) ( not ( = ?auto_396158 ?auto_396159 ) ) ( not ( = ?auto_396158 ?auto_396156 ) ) ( not ( = ?auto_396158 ?auto_396160 ) ) ( not ( = ?auto_396158 ?auto_396162 ) ) ( not ( = ?auto_396158 ?auto_396161 ) ) ( not ( = ?auto_396158 ?auto_396163 ) ) ( not ( = ?auto_396158 ?auto_396164 ) ) ( not ( = ?auto_396158 ?auto_396165 ) ) ( not ( = ?auto_396158 ?auto_396166 ) ) ( not ( = ?auto_396158 ?auto_396170 ) ) ( not ( = ?auto_396159 ?auto_396156 ) ) ( not ( = ?auto_396159 ?auto_396160 ) ) ( not ( = ?auto_396159 ?auto_396162 ) ) ( not ( = ?auto_396159 ?auto_396161 ) ) ( not ( = ?auto_396159 ?auto_396163 ) ) ( not ( = ?auto_396159 ?auto_396164 ) ) ( not ( = ?auto_396159 ?auto_396165 ) ) ( not ( = ?auto_396159 ?auto_396166 ) ) ( not ( = ?auto_396159 ?auto_396170 ) ) ( not ( = ?auto_396156 ?auto_396160 ) ) ( not ( = ?auto_396156 ?auto_396162 ) ) ( not ( = ?auto_396156 ?auto_396161 ) ) ( not ( = ?auto_396156 ?auto_396163 ) ) ( not ( = ?auto_396156 ?auto_396164 ) ) ( not ( = ?auto_396156 ?auto_396165 ) ) ( not ( = ?auto_396156 ?auto_396166 ) ) ( not ( = ?auto_396156 ?auto_396170 ) ) ( not ( = ?auto_396160 ?auto_396162 ) ) ( not ( = ?auto_396160 ?auto_396161 ) ) ( not ( = ?auto_396160 ?auto_396163 ) ) ( not ( = ?auto_396160 ?auto_396164 ) ) ( not ( = ?auto_396160 ?auto_396165 ) ) ( not ( = ?auto_396160 ?auto_396166 ) ) ( not ( = ?auto_396160 ?auto_396170 ) ) ( not ( = ?auto_396162 ?auto_396161 ) ) ( not ( = ?auto_396162 ?auto_396163 ) ) ( not ( = ?auto_396162 ?auto_396164 ) ) ( not ( = ?auto_396162 ?auto_396165 ) ) ( not ( = ?auto_396162 ?auto_396166 ) ) ( not ( = ?auto_396162 ?auto_396170 ) ) ( not ( = ?auto_396161 ?auto_396163 ) ) ( not ( = ?auto_396161 ?auto_396164 ) ) ( not ( = ?auto_396161 ?auto_396165 ) ) ( not ( = ?auto_396161 ?auto_396166 ) ) ( not ( = ?auto_396161 ?auto_396170 ) ) ( not ( = ?auto_396163 ?auto_396164 ) ) ( not ( = ?auto_396163 ?auto_396165 ) ) ( not ( = ?auto_396163 ?auto_396166 ) ) ( not ( = ?auto_396163 ?auto_396170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396164 ?auto_396165 ?auto_396166 )
      ( MAKE-10CRATE-VERIFY ?auto_396157 ?auto_396158 ?auto_396159 ?auto_396156 ?auto_396160 ?auto_396162 ?auto_396161 ?auto_396163 ?auto_396164 ?auto_396165 ?auto_396166 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396283 - SURFACE
      ?auto_396284 - SURFACE
      ?auto_396285 - SURFACE
      ?auto_396282 - SURFACE
      ?auto_396286 - SURFACE
      ?auto_396288 - SURFACE
      ?auto_396287 - SURFACE
      ?auto_396289 - SURFACE
      ?auto_396290 - SURFACE
      ?auto_396291 - SURFACE
      ?auto_396292 - SURFACE
    )
    :vars
    (
      ?auto_396294 - HOIST
      ?auto_396293 - PLACE
      ?auto_396297 - PLACE
      ?auto_396298 - HOIST
      ?auto_396295 - SURFACE
      ?auto_396296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396294 ?auto_396293 ) ( SURFACE-AT ?auto_396291 ?auto_396293 ) ( CLEAR ?auto_396291 ) ( IS-CRATE ?auto_396292 ) ( not ( = ?auto_396291 ?auto_396292 ) ) ( AVAILABLE ?auto_396294 ) ( ON ?auto_396291 ?auto_396290 ) ( not ( = ?auto_396290 ?auto_396291 ) ) ( not ( = ?auto_396290 ?auto_396292 ) ) ( not ( = ?auto_396297 ?auto_396293 ) ) ( HOIST-AT ?auto_396298 ?auto_396297 ) ( not ( = ?auto_396294 ?auto_396298 ) ) ( AVAILABLE ?auto_396298 ) ( SURFACE-AT ?auto_396292 ?auto_396297 ) ( ON ?auto_396292 ?auto_396295 ) ( CLEAR ?auto_396292 ) ( not ( = ?auto_396291 ?auto_396295 ) ) ( not ( = ?auto_396292 ?auto_396295 ) ) ( not ( = ?auto_396290 ?auto_396295 ) ) ( TRUCK-AT ?auto_396296 ?auto_396293 ) ( ON ?auto_396284 ?auto_396283 ) ( ON ?auto_396285 ?auto_396284 ) ( ON ?auto_396282 ?auto_396285 ) ( ON ?auto_396286 ?auto_396282 ) ( ON ?auto_396288 ?auto_396286 ) ( ON ?auto_396287 ?auto_396288 ) ( ON ?auto_396289 ?auto_396287 ) ( ON ?auto_396290 ?auto_396289 ) ( not ( = ?auto_396283 ?auto_396284 ) ) ( not ( = ?auto_396283 ?auto_396285 ) ) ( not ( = ?auto_396283 ?auto_396282 ) ) ( not ( = ?auto_396283 ?auto_396286 ) ) ( not ( = ?auto_396283 ?auto_396288 ) ) ( not ( = ?auto_396283 ?auto_396287 ) ) ( not ( = ?auto_396283 ?auto_396289 ) ) ( not ( = ?auto_396283 ?auto_396290 ) ) ( not ( = ?auto_396283 ?auto_396291 ) ) ( not ( = ?auto_396283 ?auto_396292 ) ) ( not ( = ?auto_396283 ?auto_396295 ) ) ( not ( = ?auto_396284 ?auto_396285 ) ) ( not ( = ?auto_396284 ?auto_396282 ) ) ( not ( = ?auto_396284 ?auto_396286 ) ) ( not ( = ?auto_396284 ?auto_396288 ) ) ( not ( = ?auto_396284 ?auto_396287 ) ) ( not ( = ?auto_396284 ?auto_396289 ) ) ( not ( = ?auto_396284 ?auto_396290 ) ) ( not ( = ?auto_396284 ?auto_396291 ) ) ( not ( = ?auto_396284 ?auto_396292 ) ) ( not ( = ?auto_396284 ?auto_396295 ) ) ( not ( = ?auto_396285 ?auto_396282 ) ) ( not ( = ?auto_396285 ?auto_396286 ) ) ( not ( = ?auto_396285 ?auto_396288 ) ) ( not ( = ?auto_396285 ?auto_396287 ) ) ( not ( = ?auto_396285 ?auto_396289 ) ) ( not ( = ?auto_396285 ?auto_396290 ) ) ( not ( = ?auto_396285 ?auto_396291 ) ) ( not ( = ?auto_396285 ?auto_396292 ) ) ( not ( = ?auto_396285 ?auto_396295 ) ) ( not ( = ?auto_396282 ?auto_396286 ) ) ( not ( = ?auto_396282 ?auto_396288 ) ) ( not ( = ?auto_396282 ?auto_396287 ) ) ( not ( = ?auto_396282 ?auto_396289 ) ) ( not ( = ?auto_396282 ?auto_396290 ) ) ( not ( = ?auto_396282 ?auto_396291 ) ) ( not ( = ?auto_396282 ?auto_396292 ) ) ( not ( = ?auto_396282 ?auto_396295 ) ) ( not ( = ?auto_396286 ?auto_396288 ) ) ( not ( = ?auto_396286 ?auto_396287 ) ) ( not ( = ?auto_396286 ?auto_396289 ) ) ( not ( = ?auto_396286 ?auto_396290 ) ) ( not ( = ?auto_396286 ?auto_396291 ) ) ( not ( = ?auto_396286 ?auto_396292 ) ) ( not ( = ?auto_396286 ?auto_396295 ) ) ( not ( = ?auto_396288 ?auto_396287 ) ) ( not ( = ?auto_396288 ?auto_396289 ) ) ( not ( = ?auto_396288 ?auto_396290 ) ) ( not ( = ?auto_396288 ?auto_396291 ) ) ( not ( = ?auto_396288 ?auto_396292 ) ) ( not ( = ?auto_396288 ?auto_396295 ) ) ( not ( = ?auto_396287 ?auto_396289 ) ) ( not ( = ?auto_396287 ?auto_396290 ) ) ( not ( = ?auto_396287 ?auto_396291 ) ) ( not ( = ?auto_396287 ?auto_396292 ) ) ( not ( = ?auto_396287 ?auto_396295 ) ) ( not ( = ?auto_396289 ?auto_396290 ) ) ( not ( = ?auto_396289 ?auto_396291 ) ) ( not ( = ?auto_396289 ?auto_396292 ) ) ( not ( = ?auto_396289 ?auto_396295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396290 ?auto_396291 ?auto_396292 )
      ( MAKE-10CRATE-VERIFY ?auto_396283 ?auto_396284 ?auto_396285 ?auto_396282 ?auto_396286 ?auto_396288 ?auto_396287 ?auto_396289 ?auto_396290 ?auto_396291 ?auto_396292 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396409 - SURFACE
      ?auto_396410 - SURFACE
      ?auto_396411 - SURFACE
      ?auto_396408 - SURFACE
      ?auto_396412 - SURFACE
      ?auto_396414 - SURFACE
      ?auto_396413 - SURFACE
      ?auto_396415 - SURFACE
      ?auto_396416 - SURFACE
      ?auto_396417 - SURFACE
      ?auto_396418 - SURFACE
    )
    :vars
    (
      ?auto_396421 - HOIST
      ?auto_396420 - PLACE
      ?auto_396422 - PLACE
      ?auto_396423 - HOIST
      ?auto_396424 - SURFACE
      ?auto_396419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396421 ?auto_396420 ) ( IS-CRATE ?auto_396418 ) ( not ( = ?auto_396417 ?auto_396418 ) ) ( not ( = ?auto_396416 ?auto_396417 ) ) ( not ( = ?auto_396416 ?auto_396418 ) ) ( not ( = ?auto_396422 ?auto_396420 ) ) ( HOIST-AT ?auto_396423 ?auto_396422 ) ( not ( = ?auto_396421 ?auto_396423 ) ) ( AVAILABLE ?auto_396423 ) ( SURFACE-AT ?auto_396418 ?auto_396422 ) ( ON ?auto_396418 ?auto_396424 ) ( CLEAR ?auto_396418 ) ( not ( = ?auto_396417 ?auto_396424 ) ) ( not ( = ?auto_396418 ?auto_396424 ) ) ( not ( = ?auto_396416 ?auto_396424 ) ) ( TRUCK-AT ?auto_396419 ?auto_396420 ) ( SURFACE-AT ?auto_396416 ?auto_396420 ) ( CLEAR ?auto_396416 ) ( LIFTING ?auto_396421 ?auto_396417 ) ( IS-CRATE ?auto_396417 ) ( ON ?auto_396410 ?auto_396409 ) ( ON ?auto_396411 ?auto_396410 ) ( ON ?auto_396408 ?auto_396411 ) ( ON ?auto_396412 ?auto_396408 ) ( ON ?auto_396414 ?auto_396412 ) ( ON ?auto_396413 ?auto_396414 ) ( ON ?auto_396415 ?auto_396413 ) ( ON ?auto_396416 ?auto_396415 ) ( not ( = ?auto_396409 ?auto_396410 ) ) ( not ( = ?auto_396409 ?auto_396411 ) ) ( not ( = ?auto_396409 ?auto_396408 ) ) ( not ( = ?auto_396409 ?auto_396412 ) ) ( not ( = ?auto_396409 ?auto_396414 ) ) ( not ( = ?auto_396409 ?auto_396413 ) ) ( not ( = ?auto_396409 ?auto_396415 ) ) ( not ( = ?auto_396409 ?auto_396416 ) ) ( not ( = ?auto_396409 ?auto_396417 ) ) ( not ( = ?auto_396409 ?auto_396418 ) ) ( not ( = ?auto_396409 ?auto_396424 ) ) ( not ( = ?auto_396410 ?auto_396411 ) ) ( not ( = ?auto_396410 ?auto_396408 ) ) ( not ( = ?auto_396410 ?auto_396412 ) ) ( not ( = ?auto_396410 ?auto_396414 ) ) ( not ( = ?auto_396410 ?auto_396413 ) ) ( not ( = ?auto_396410 ?auto_396415 ) ) ( not ( = ?auto_396410 ?auto_396416 ) ) ( not ( = ?auto_396410 ?auto_396417 ) ) ( not ( = ?auto_396410 ?auto_396418 ) ) ( not ( = ?auto_396410 ?auto_396424 ) ) ( not ( = ?auto_396411 ?auto_396408 ) ) ( not ( = ?auto_396411 ?auto_396412 ) ) ( not ( = ?auto_396411 ?auto_396414 ) ) ( not ( = ?auto_396411 ?auto_396413 ) ) ( not ( = ?auto_396411 ?auto_396415 ) ) ( not ( = ?auto_396411 ?auto_396416 ) ) ( not ( = ?auto_396411 ?auto_396417 ) ) ( not ( = ?auto_396411 ?auto_396418 ) ) ( not ( = ?auto_396411 ?auto_396424 ) ) ( not ( = ?auto_396408 ?auto_396412 ) ) ( not ( = ?auto_396408 ?auto_396414 ) ) ( not ( = ?auto_396408 ?auto_396413 ) ) ( not ( = ?auto_396408 ?auto_396415 ) ) ( not ( = ?auto_396408 ?auto_396416 ) ) ( not ( = ?auto_396408 ?auto_396417 ) ) ( not ( = ?auto_396408 ?auto_396418 ) ) ( not ( = ?auto_396408 ?auto_396424 ) ) ( not ( = ?auto_396412 ?auto_396414 ) ) ( not ( = ?auto_396412 ?auto_396413 ) ) ( not ( = ?auto_396412 ?auto_396415 ) ) ( not ( = ?auto_396412 ?auto_396416 ) ) ( not ( = ?auto_396412 ?auto_396417 ) ) ( not ( = ?auto_396412 ?auto_396418 ) ) ( not ( = ?auto_396412 ?auto_396424 ) ) ( not ( = ?auto_396414 ?auto_396413 ) ) ( not ( = ?auto_396414 ?auto_396415 ) ) ( not ( = ?auto_396414 ?auto_396416 ) ) ( not ( = ?auto_396414 ?auto_396417 ) ) ( not ( = ?auto_396414 ?auto_396418 ) ) ( not ( = ?auto_396414 ?auto_396424 ) ) ( not ( = ?auto_396413 ?auto_396415 ) ) ( not ( = ?auto_396413 ?auto_396416 ) ) ( not ( = ?auto_396413 ?auto_396417 ) ) ( not ( = ?auto_396413 ?auto_396418 ) ) ( not ( = ?auto_396413 ?auto_396424 ) ) ( not ( = ?auto_396415 ?auto_396416 ) ) ( not ( = ?auto_396415 ?auto_396417 ) ) ( not ( = ?auto_396415 ?auto_396418 ) ) ( not ( = ?auto_396415 ?auto_396424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396416 ?auto_396417 ?auto_396418 )
      ( MAKE-10CRATE-VERIFY ?auto_396409 ?auto_396410 ?auto_396411 ?auto_396408 ?auto_396412 ?auto_396414 ?auto_396413 ?auto_396415 ?auto_396416 ?auto_396417 ?auto_396418 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_396535 - SURFACE
      ?auto_396536 - SURFACE
      ?auto_396537 - SURFACE
      ?auto_396534 - SURFACE
      ?auto_396538 - SURFACE
      ?auto_396540 - SURFACE
      ?auto_396539 - SURFACE
      ?auto_396541 - SURFACE
      ?auto_396542 - SURFACE
      ?auto_396543 - SURFACE
      ?auto_396544 - SURFACE
    )
    :vars
    (
      ?auto_396546 - HOIST
      ?auto_396547 - PLACE
      ?auto_396550 - PLACE
      ?auto_396548 - HOIST
      ?auto_396545 - SURFACE
      ?auto_396549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_396546 ?auto_396547 ) ( IS-CRATE ?auto_396544 ) ( not ( = ?auto_396543 ?auto_396544 ) ) ( not ( = ?auto_396542 ?auto_396543 ) ) ( not ( = ?auto_396542 ?auto_396544 ) ) ( not ( = ?auto_396550 ?auto_396547 ) ) ( HOIST-AT ?auto_396548 ?auto_396550 ) ( not ( = ?auto_396546 ?auto_396548 ) ) ( AVAILABLE ?auto_396548 ) ( SURFACE-AT ?auto_396544 ?auto_396550 ) ( ON ?auto_396544 ?auto_396545 ) ( CLEAR ?auto_396544 ) ( not ( = ?auto_396543 ?auto_396545 ) ) ( not ( = ?auto_396544 ?auto_396545 ) ) ( not ( = ?auto_396542 ?auto_396545 ) ) ( TRUCK-AT ?auto_396549 ?auto_396547 ) ( SURFACE-AT ?auto_396542 ?auto_396547 ) ( CLEAR ?auto_396542 ) ( IS-CRATE ?auto_396543 ) ( AVAILABLE ?auto_396546 ) ( IN ?auto_396543 ?auto_396549 ) ( ON ?auto_396536 ?auto_396535 ) ( ON ?auto_396537 ?auto_396536 ) ( ON ?auto_396534 ?auto_396537 ) ( ON ?auto_396538 ?auto_396534 ) ( ON ?auto_396540 ?auto_396538 ) ( ON ?auto_396539 ?auto_396540 ) ( ON ?auto_396541 ?auto_396539 ) ( ON ?auto_396542 ?auto_396541 ) ( not ( = ?auto_396535 ?auto_396536 ) ) ( not ( = ?auto_396535 ?auto_396537 ) ) ( not ( = ?auto_396535 ?auto_396534 ) ) ( not ( = ?auto_396535 ?auto_396538 ) ) ( not ( = ?auto_396535 ?auto_396540 ) ) ( not ( = ?auto_396535 ?auto_396539 ) ) ( not ( = ?auto_396535 ?auto_396541 ) ) ( not ( = ?auto_396535 ?auto_396542 ) ) ( not ( = ?auto_396535 ?auto_396543 ) ) ( not ( = ?auto_396535 ?auto_396544 ) ) ( not ( = ?auto_396535 ?auto_396545 ) ) ( not ( = ?auto_396536 ?auto_396537 ) ) ( not ( = ?auto_396536 ?auto_396534 ) ) ( not ( = ?auto_396536 ?auto_396538 ) ) ( not ( = ?auto_396536 ?auto_396540 ) ) ( not ( = ?auto_396536 ?auto_396539 ) ) ( not ( = ?auto_396536 ?auto_396541 ) ) ( not ( = ?auto_396536 ?auto_396542 ) ) ( not ( = ?auto_396536 ?auto_396543 ) ) ( not ( = ?auto_396536 ?auto_396544 ) ) ( not ( = ?auto_396536 ?auto_396545 ) ) ( not ( = ?auto_396537 ?auto_396534 ) ) ( not ( = ?auto_396537 ?auto_396538 ) ) ( not ( = ?auto_396537 ?auto_396540 ) ) ( not ( = ?auto_396537 ?auto_396539 ) ) ( not ( = ?auto_396537 ?auto_396541 ) ) ( not ( = ?auto_396537 ?auto_396542 ) ) ( not ( = ?auto_396537 ?auto_396543 ) ) ( not ( = ?auto_396537 ?auto_396544 ) ) ( not ( = ?auto_396537 ?auto_396545 ) ) ( not ( = ?auto_396534 ?auto_396538 ) ) ( not ( = ?auto_396534 ?auto_396540 ) ) ( not ( = ?auto_396534 ?auto_396539 ) ) ( not ( = ?auto_396534 ?auto_396541 ) ) ( not ( = ?auto_396534 ?auto_396542 ) ) ( not ( = ?auto_396534 ?auto_396543 ) ) ( not ( = ?auto_396534 ?auto_396544 ) ) ( not ( = ?auto_396534 ?auto_396545 ) ) ( not ( = ?auto_396538 ?auto_396540 ) ) ( not ( = ?auto_396538 ?auto_396539 ) ) ( not ( = ?auto_396538 ?auto_396541 ) ) ( not ( = ?auto_396538 ?auto_396542 ) ) ( not ( = ?auto_396538 ?auto_396543 ) ) ( not ( = ?auto_396538 ?auto_396544 ) ) ( not ( = ?auto_396538 ?auto_396545 ) ) ( not ( = ?auto_396540 ?auto_396539 ) ) ( not ( = ?auto_396540 ?auto_396541 ) ) ( not ( = ?auto_396540 ?auto_396542 ) ) ( not ( = ?auto_396540 ?auto_396543 ) ) ( not ( = ?auto_396540 ?auto_396544 ) ) ( not ( = ?auto_396540 ?auto_396545 ) ) ( not ( = ?auto_396539 ?auto_396541 ) ) ( not ( = ?auto_396539 ?auto_396542 ) ) ( not ( = ?auto_396539 ?auto_396543 ) ) ( not ( = ?auto_396539 ?auto_396544 ) ) ( not ( = ?auto_396539 ?auto_396545 ) ) ( not ( = ?auto_396541 ?auto_396542 ) ) ( not ( = ?auto_396541 ?auto_396543 ) ) ( not ( = ?auto_396541 ?auto_396544 ) ) ( not ( = ?auto_396541 ?auto_396545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_396542 ?auto_396543 ?auto_396544 )
      ( MAKE-10CRATE-VERIFY ?auto_396535 ?auto_396536 ?auto_396537 ?auto_396534 ?auto_396538 ?auto_396540 ?auto_396539 ?auto_396541 ?auto_396542 ?auto_396543 ?auto_396544 ) )
  )

)

