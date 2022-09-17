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
      ?auto_125833 - SURFACE
      ?auto_125834 - SURFACE
    )
    :vars
    (
      ?auto_125835 - HOIST
      ?auto_125836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125835 ?auto_125836 ) ( SURFACE-AT ?auto_125833 ?auto_125836 ) ( CLEAR ?auto_125833 ) ( LIFTING ?auto_125835 ?auto_125834 ) ( IS-CRATE ?auto_125834 ) ( not ( = ?auto_125833 ?auto_125834 ) ) )
    :subtasks
    ( ( !DROP ?auto_125835 ?auto_125834 ?auto_125833 ?auto_125836 )
      ( MAKE-1CRATE-VERIFY ?auto_125833 ?auto_125834 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125837 - SURFACE
      ?auto_125838 - SURFACE
    )
    :vars
    (
      ?auto_125839 - HOIST
      ?auto_125840 - PLACE
      ?auto_125841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125839 ?auto_125840 ) ( SURFACE-AT ?auto_125837 ?auto_125840 ) ( CLEAR ?auto_125837 ) ( IS-CRATE ?auto_125838 ) ( not ( = ?auto_125837 ?auto_125838 ) ) ( TRUCK-AT ?auto_125841 ?auto_125840 ) ( AVAILABLE ?auto_125839 ) ( IN ?auto_125838 ?auto_125841 ) )
    :subtasks
    ( ( !UNLOAD ?auto_125839 ?auto_125838 ?auto_125841 ?auto_125840 )
      ( MAKE-1CRATE ?auto_125837 ?auto_125838 )
      ( MAKE-1CRATE-VERIFY ?auto_125837 ?auto_125838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125842 - SURFACE
      ?auto_125843 - SURFACE
    )
    :vars
    (
      ?auto_125846 - HOIST
      ?auto_125844 - PLACE
      ?auto_125845 - TRUCK
      ?auto_125847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125846 ?auto_125844 ) ( SURFACE-AT ?auto_125842 ?auto_125844 ) ( CLEAR ?auto_125842 ) ( IS-CRATE ?auto_125843 ) ( not ( = ?auto_125842 ?auto_125843 ) ) ( AVAILABLE ?auto_125846 ) ( IN ?auto_125843 ?auto_125845 ) ( TRUCK-AT ?auto_125845 ?auto_125847 ) ( not ( = ?auto_125847 ?auto_125844 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_125845 ?auto_125847 ?auto_125844 )
      ( MAKE-1CRATE ?auto_125842 ?auto_125843 )
      ( MAKE-1CRATE-VERIFY ?auto_125842 ?auto_125843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125848 - SURFACE
      ?auto_125849 - SURFACE
    )
    :vars
    (
      ?auto_125850 - HOIST
      ?auto_125851 - PLACE
      ?auto_125853 - TRUCK
      ?auto_125852 - PLACE
      ?auto_125854 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125850 ?auto_125851 ) ( SURFACE-AT ?auto_125848 ?auto_125851 ) ( CLEAR ?auto_125848 ) ( IS-CRATE ?auto_125849 ) ( not ( = ?auto_125848 ?auto_125849 ) ) ( AVAILABLE ?auto_125850 ) ( TRUCK-AT ?auto_125853 ?auto_125852 ) ( not ( = ?auto_125852 ?auto_125851 ) ) ( HOIST-AT ?auto_125854 ?auto_125852 ) ( LIFTING ?auto_125854 ?auto_125849 ) ( not ( = ?auto_125850 ?auto_125854 ) ) )
    :subtasks
    ( ( !LOAD ?auto_125854 ?auto_125849 ?auto_125853 ?auto_125852 )
      ( MAKE-1CRATE ?auto_125848 ?auto_125849 )
      ( MAKE-1CRATE-VERIFY ?auto_125848 ?auto_125849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125855 - SURFACE
      ?auto_125856 - SURFACE
    )
    :vars
    (
      ?auto_125857 - HOIST
      ?auto_125858 - PLACE
      ?auto_125860 - TRUCK
      ?auto_125861 - PLACE
      ?auto_125859 - HOIST
      ?auto_125862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125857 ?auto_125858 ) ( SURFACE-AT ?auto_125855 ?auto_125858 ) ( CLEAR ?auto_125855 ) ( IS-CRATE ?auto_125856 ) ( not ( = ?auto_125855 ?auto_125856 ) ) ( AVAILABLE ?auto_125857 ) ( TRUCK-AT ?auto_125860 ?auto_125861 ) ( not ( = ?auto_125861 ?auto_125858 ) ) ( HOIST-AT ?auto_125859 ?auto_125861 ) ( not ( = ?auto_125857 ?auto_125859 ) ) ( AVAILABLE ?auto_125859 ) ( SURFACE-AT ?auto_125856 ?auto_125861 ) ( ON ?auto_125856 ?auto_125862 ) ( CLEAR ?auto_125856 ) ( not ( = ?auto_125855 ?auto_125862 ) ) ( not ( = ?auto_125856 ?auto_125862 ) ) )
    :subtasks
    ( ( !LIFT ?auto_125859 ?auto_125856 ?auto_125862 ?auto_125861 )
      ( MAKE-1CRATE ?auto_125855 ?auto_125856 )
      ( MAKE-1CRATE-VERIFY ?auto_125855 ?auto_125856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125863 - SURFACE
      ?auto_125864 - SURFACE
    )
    :vars
    (
      ?auto_125865 - HOIST
      ?auto_125867 - PLACE
      ?auto_125869 - PLACE
      ?auto_125866 - HOIST
      ?auto_125870 - SURFACE
      ?auto_125868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125865 ?auto_125867 ) ( SURFACE-AT ?auto_125863 ?auto_125867 ) ( CLEAR ?auto_125863 ) ( IS-CRATE ?auto_125864 ) ( not ( = ?auto_125863 ?auto_125864 ) ) ( AVAILABLE ?auto_125865 ) ( not ( = ?auto_125869 ?auto_125867 ) ) ( HOIST-AT ?auto_125866 ?auto_125869 ) ( not ( = ?auto_125865 ?auto_125866 ) ) ( AVAILABLE ?auto_125866 ) ( SURFACE-AT ?auto_125864 ?auto_125869 ) ( ON ?auto_125864 ?auto_125870 ) ( CLEAR ?auto_125864 ) ( not ( = ?auto_125863 ?auto_125870 ) ) ( not ( = ?auto_125864 ?auto_125870 ) ) ( TRUCK-AT ?auto_125868 ?auto_125867 ) )
    :subtasks
    ( ( !DRIVE ?auto_125868 ?auto_125867 ?auto_125869 )
      ( MAKE-1CRATE ?auto_125863 ?auto_125864 )
      ( MAKE-1CRATE-VERIFY ?auto_125863 ?auto_125864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125880 - SURFACE
      ?auto_125881 - SURFACE
      ?auto_125882 - SURFACE
    )
    :vars
    (
      ?auto_125884 - HOIST
      ?auto_125883 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125884 ?auto_125883 ) ( SURFACE-AT ?auto_125881 ?auto_125883 ) ( CLEAR ?auto_125881 ) ( LIFTING ?auto_125884 ?auto_125882 ) ( IS-CRATE ?auto_125882 ) ( not ( = ?auto_125881 ?auto_125882 ) ) ( ON ?auto_125881 ?auto_125880 ) ( not ( = ?auto_125880 ?auto_125881 ) ) ( not ( = ?auto_125880 ?auto_125882 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125881 ?auto_125882 )
      ( MAKE-2CRATE-VERIFY ?auto_125880 ?auto_125881 ?auto_125882 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125890 - SURFACE
      ?auto_125891 - SURFACE
      ?auto_125892 - SURFACE
    )
    :vars
    (
      ?auto_125894 - HOIST
      ?auto_125893 - PLACE
      ?auto_125895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125894 ?auto_125893 ) ( SURFACE-AT ?auto_125891 ?auto_125893 ) ( CLEAR ?auto_125891 ) ( IS-CRATE ?auto_125892 ) ( not ( = ?auto_125891 ?auto_125892 ) ) ( TRUCK-AT ?auto_125895 ?auto_125893 ) ( AVAILABLE ?auto_125894 ) ( IN ?auto_125892 ?auto_125895 ) ( ON ?auto_125891 ?auto_125890 ) ( not ( = ?auto_125890 ?auto_125891 ) ) ( not ( = ?auto_125890 ?auto_125892 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125891 ?auto_125892 )
      ( MAKE-2CRATE-VERIFY ?auto_125890 ?auto_125891 ?auto_125892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125896 - SURFACE
      ?auto_125897 - SURFACE
    )
    :vars
    (
      ?auto_125901 - HOIST
      ?auto_125898 - PLACE
      ?auto_125899 - TRUCK
      ?auto_125900 - SURFACE
      ?auto_125902 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125901 ?auto_125898 ) ( SURFACE-AT ?auto_125896 ?auto_125898 ) ( CLEAR ?auto_125896 ) ( IS-CRATE ?auto_125897 ) ( not ( = ?auto_125896 ?auto_125897 ) ) ( AVAILABLE ?auto_125901 ) ( IN ?auto_125897 ?auto_125899 ) ( ON ?auto_125896 ?auto_125900 ) ( not ( = ?auto_125900 ?auto_125896 ) ) ( not ( = ?auto_125900 ?auto_125897 ) ) ( TRUCK-AT ?auto_125899 ?auto_125902 ) ( not ( = ?auto_125902 ?auto_125898 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_125899 ?auto_125902 ?auto_125898 )
      ( MAKE-2CRATE ?auto_125900 ?auto_125896 ?auto_125897 )
      ( MAKE-1CRATE-VERIFY ?auto_125896 ?auto_125897 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125903 - SURFACE
      ?auto_125904 - SURFACE
      ?auto_125905 - SURFACE
    )
    :vars
    (
      ?auto_125909 - HOIST
      ?auto_125907 - PLACE
      ?auto_125906 - TRUCK
      ?auto_125908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125909 ?auto_125907 ) ( SURFACE-AT ?auto_125904 ?auto_125907 ) ( CLEAR ?auto_125904 ) ( IS-CRATE ?auto_125905 ) ( not ( = ?auto_125904 ?auto_125905 ) ) ( AVAILABLE ?auto_125909 ) ( IN ?auto_125905 ?auto_125906 ) ( ON ?auto_125904 ?auto_125903 ) ( not ( = ?auto_125903 ?auto_125904 ) ) ( not ( = ?auto_125903 ?auto_125905 ) ) ( TRUCK-AT ?auto_125906 ?auto_125908 ) ( not ( = ?auto_125908 ?auto_125907 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125904 ?auto_125905 )
      ( MAKE-2CRATE-VERIFY ?auto_125903 ?auto_125904 ?auto_125905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125910 - SURFACE
      ?auto_125911 - SURFACE
    )
    :vars
    (
      ?auto_125912 - HOIST
      ?auto_125913 - PLACE
      ?auto_125916 - SURFACE
      ?auto_125915 - TRUCK
      ?auto_125914 - PLACE
      ?auto_125917 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125912 ?auto_125913 ) ( SURFACE-AT ?auto_125910 ?auto_125913 ) ( CLEAR ?auto_125910 ) ( IS-CRATE ?auto_125911 ) ( not ( = ?auto_125910 ?auto_125911 ) ) ( AVAILABLE ?auto_125912 ) ( ON ?auto_125910 ?auto_125916 ) ( not ( = ?auto_125916 ?auto_125910 ) ) ( not ( = ?auto_125916 ?auto_125911 ) ) ( TRUCK-AT ?auto_125915 ?auto_125914 ) ( not ( = ?auto_125914 ?auto_125913 ) ) ( HOIST-AT ?auto_125917 ?auto_125914 ) ( LIFTING ?auto_125917 ?auto_125911 ) ( not ( = ?auto_125912 ?auto_125917 ) ) )
    :subtasks
    ( ( !LOAD ?auto_125917 ?auto_125911 ?auto_125915 ?auto_125914 )
      ( MAKE-2CRATE ?auto_125916 ?auto_125910 ?auto_125911 )
      ( MAKE-1CRATE-VERIFY ?auto_125910 ?auto_125911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125918 - SURFACE
      ?auto_125919 - SURFACE
      ?auto_125920 - SURFACE
    )
    :vars
    (
      ?auto_125923 - HOIST
      ?auto_125922 - PLACE
      ?auto_125925 - TRUCK
      ?auto_125924 - PLACE
      ?auto_125921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125923 ?auto_125922 ) ( SURFACE-AT ?auto_125919 ?auto_125922 ) ( CLEAR ?auto_125919 ) ( IS-CRATE ?auto_125920 ) ( not ( = ?auto_125919 ?auto_125920 ) ) ( AVAILABLE ?auto_125923 ) ( ON ?auto_125919 ?auto_125918 ) ( not ( = ?auto_125918 ?auto_125919 ) ) ( not ( = ?auto_125918 ?auto_125920 ) ) ( TRUCK-AT ?auto_125925 ?auto_125924 ) ( not ( = ?auto_125924 ?auto_125922 ) ) ( HOIST-AT ?auto_125921 ?auto_125924 ) ( LIFTING ?auto_125921 ?auto_125920 ) ( not ( = ?auto_125923 ?auto_125921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125919 ?auto_125920 )
      ( MAKE-2CRATE-VERIFY ?auto_125918 ?auto_125919 ?auto_125920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125926 - SURFACE
      ?auto_125927 - SURFACE
    )
    :vars
    (
      ?auto_125928 - HOIST
      ?auto_125929 - PLACE
      ?auto_125930 - SURFACE
      ?auto_125932 - TRUCK
      ?auto_125933 - PLACE
      ?auto_125931 - HOIST
      ?auto_125934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125928 ?auto_125929 ) ( SURFACE-AT ?auto_125926 ?auto_125929 ) ( CLEAR ?auto_125926 ) ( IS-CRATE ?auto_125927 ) ( not ( = ?auto_125926 ?auto_125927 ) ) ( AVAILABLE ?auto_125928 ) ( ON ?auto_125926 ?auto_125930 ) ( not ( = ?auto_125930 ?auto_125926 ) ) ( not ( = ?auto_125930 ?auto_125927 ) ) ( TRUCK-AT ?auto_125932 ?auto_125933 ) ( not ( = ?auto_125933 ?auto_125929 ) ) ( HOIST-AT ?auto_125931 ?auto_125933 ) ( not ( = ?auto_125928 ?auto_125931 ) ) ( AVAILABLE ?auto_125931 ) ( SURFACE-AT ?auto_125927 ?auto_125933 ) ( ON ?auto_125927 ?auto_125934 ) ( CLEAR ?auto_125927 ) ( not ( = ?auto_125926 ?auto_125934 ) ) ( not ( = ?auto_125927 ?auto_125934 ) ) ( not ( = ?auto_125930 ?auto_125934 ) ) )
    :subtasks
    ( ( !LIFT ?auto_125931 ?auto_125927 ?auto_125934 ?auto_125933 )
      ( MAKE-2CRATE ?auto_125930 ?auto_125926 ?auto_125927 )
      ( MAKE-1CRATE-VERIFY ?auto_125926 ?auto_125927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125935 - SURFACE
      ?auto_125936 - SURFACE
      ?auto_125937 - SURFACE
    )
    :vars
    (
      ?auto_125943 - HOIST
      ?auto_125939 - PLACE
      ?auto_125941 - TRUCK
      ?auto_125938 - PLACE
      ?auto_125940 - HOIST
      ?auto_125942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125943 ?auto_125939 ) ( SURFACE-AT ?auto_125936 ?auto_125939 ) ( CLEAR ?auto_125936 ) ( IS-CRATE ?auto_125937 ) ( not ( = ?auto_125936 ?auto_125937 ) ) ( AVAILABLE ?auto_125943 ) ( ON ?auto_125936 ?auto_125935 ) ( not ( = ?auto_125935 ?auto_125936 ) ) ( not ( = ?auto_125935 ?auto_125937 ) ) ( TRUCK-AT ?auto_125941 ?auto_125938 ) ( not ( = ?auto_125938 ?auto_125939 ) ) ( HOIST-AT ?auto_125940 ?auto_125938 ) ( not ( = ?auto_125943 ?auto_125940 ) ) ( AVAILABLE ?auto_125940 ) ( SURFACE-AT ?auto_125937 ?auto_125938 ) ( ON ?auto_125937 ?auto_125942 ) ( CLEAR ?auto_125937 ) ( not ( = ?auto_125936 ?auto_125942 ) ) ( not ( = ?auto_125937 ?auto_125942 ) ) ( not ( = ?auto_125935 ?auto_125942 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125936 ?auto_125937 )
      ( MAKE-2CRATE-VERIFY ?auto_125935 ?auto_125936 ?auto_125937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125944 - SURFACE
      ?auto_125945 - SURFACE
    )
    :vars
    (
      ?auto_125950 - HOIST
      ?auto_125951 - PLACE
      ?auto_125946 - SURFACE
      ?auto_125947 - PLACE
      ?auto_125948 - HOIST
      ?auto_125952 - SURFACE
      ?auto_125949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125950 ?auto_125951 ) ( SURFACE-AT ?auto_125944 ?auto_125951 ) ( CLEAR ?auto_125944 ) ( IS-CRATE ?auto_125945 ) ( not ( = ?auto_125944 ?auto_125945 ) ) ( AVAILABLE ?auto_125950 ) ( ON ?auto_125944 ?auto_125946 ) ( not ( = ?auto_125946 ?auto_125944 ) ) ( not ( = ?auto_125946 ?auto_125945 ) ) ( not ( = ?auto_125947 ?auto_125951 ) ) ( HOIST-AT ?auto_125948 ?auto_125947 ) ( not ( = ?auto_125950 ?auto_125948 ) ) ( AVAILABLE ?auto_125948 ) ( SURFACE-AT ?auto_125945 ?auto_125947 ) ( ON ?auto_125945 ?auto_125952 ) ( CLEAR ?auto_125945 ) ( not ( = ?auto_125944 ?auto_125952 ) ) ( not ( = ?auto_125945 ?auto_125952 ) ) ( not ( = ?auto_125946 ?auto_125952 ) ) ( TRUCK-AT ?auto_125949 ?auto_125951 ) )
    :subtasks
    ( ( !DRIVE ?auto_125949 ?auto_125951 ?auto_125947 )
      ( MAKE-2CRATE ?auto_125946 ?auto_125944 ?auto_125945 )
      ( MAKE-1CRATE-VERIFY ?auto_125944 ?auto_125945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125953 - SURFACE
      ?auto_125954 - SURFACE
      ?auto_125955 - SURFACE
    )
    :vars
    (
      ?auto_125956 - HOIST
      ?auto_125961 - PLACE
      ?auto_125957 - PLACE
      ?auto_125959 - HOIST
      ?auto_125958 - SURFACE
      ?auto_125960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125956 ?auto_125961 ) ( SURFACE-AT ?auto_125954 ?auto_125961 ) ( CLEAR ?auto_125954 ) ( IS-CRATE ?auto_125955 ) ( not ( = ?auto_125954 ?auto_125955 ) ) ( AVAILABLE ?auto_125956 ) ( ON ?auto_125954 ?auto_125953 ) ( not ( = ?auto_125953 ?auto_125954 ) ) ( not ( = ?auto_125953 ?auto_125955 ) ) ( not ( = ?auto_125957 ?auto_125961 ) ) ( HOIST-AT ?auto_125959 ?auto_125957 ) ( not ( = ?auto_125956 ?auto_125959 ) ) ( AVAILABLE ?auto_125959 ) ( SURFACE-AT ?auto_125955 ?auto_125957 ) ( ON ?auto_125955 ?auto_125958 ) ( CLEAR ?auto_125955 ) ( not ( = ?auto_125954 ?auto_125958 ) ) ( not ( = ?auto_125955 ?auto_125958 ) ) ( not ( = ?auto_125953 ?auto_125958 ) ) ( TRUCK-AT ?auto_125960 ?auto_125961 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125954 ?auto_125955 )
      ( MAKE-2CRATE-VERIFY ?auto_125953 ?auto_125954 ?auto_125955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125962 - SURFACE
      ?auto_125963 - SURFACE
    )
    :vars
    (
      ?auto_125964 - HOIST
      ?auto_125965 - PLACE
      ?auto_125968 - SURFACE
      ?auto_125966 - PLACE
      ?auto_125969 - HOIST
      ?auto_125970 - SURFACE
      ?auto_125967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125964 ?auto_125965 ) ( IS-CRATE ?auto_125963 ) ( not ( = ?auto_125962 ?auto_125963 ) ) ( not ( = ?auto_125968 ?auto_125962 ) ) ( not ( = ?auto_125968 ?auto_125963 ) ) ( not ( = ?auto_125966 ?auto_125965 ) ) ( HOIST-AT ?auto_125969 ?auto_125966 ) ( not ( = ?auto_125964 ?auto_125969 ) ) ( AVAILABLE ?auto_125969 ) ( SURFACE-AT ?auto_125963 ?auto_125966 ) ( ON ?auto_125963 ?auto_125970 ) ( CLEAR ?auto_125963 ) ( not ( = ?auto_125962 ?auto_125970 ) ) ( not ( = ?auto_125963 ?auto_125970 ) ) ( not ( = ?auto_125968 ?auto_125970 ) ) ( TRUCK-AT ?auto_125967 ?auto_125965 ) ( SURFACE-AT ?auto_125968 ?auto_125965 ) ( CLEAR ?auto_125968 ) ( LIFTING ?auto_125964 ?auto_125962 ) ( IS-CRATE ?auto_125962 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125968 ?auto_125962 )
      ( MAKE-2CRATE ?auto_125968 ?auto_125962 ?auto_125963 )
      ( MAKE-1CRATE-VERIFY ?auto_125962 ?auto_125963 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125971 - SURFACE
      ?auto_125972 - SURFACE
      ?auto_125973 - SURFACE
    )
    :vars
    (
      ?auto_125977 - HOIST
      ?auto_125975 - PLACE
      ?auto_125978 - PLACE
      ?auto_125979 - HOIST
      ?auto_125974 - SURFACE
      ?auto_125976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125977 ?auto_125975 ) ( IS-CRATE ?auto_125973 ) ( not ( = ?auto_125972 ?auto_125973 ) ) ( not ( = ?auto_125971 ?auto_125972 ) ) ( not ( = ?auto_125971 ?auto_125973 ) ) ( not ( = ?auto_125978 ?auto_125975 ) ) ( HOIST-AT ?auto_125979 ?auto_125978 ) ( not ( = ?auto_125977 ?auto_125979 ) ) ( AVAILABLE ?auto_125979 ) ( SURFACE-AT ?auto_125973 ?auto_125978 ) ( ON ?auto_125973 ?auto_125974 ) ( CLEAR ?auto_125973 ) ( not ( = ?auto_125972 ?auto_125974 ) ) ( not ( = ?auto_125973 ?auto_125974 ) ) ( not ( = ?auto_125971 ?auto_125974 ) ) ( TRUCK-AT ?auto_125976 ?auto_125975 ) ( SURFACE-AT ?auto_125971 ?auto_125975 ) ( CLEAR ?auto_125971 ) ( LIFTING ?auto_125977 ?auto_125972 ) ( IS-CRATE ?auto_125972 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125972 ?auto_125973 )
      ( MAKE-2CRATE-VERIFY ?auto_125971 ?auto_125972 ?auto_125973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125980 - SURFACE
      ?auto_125981 - SURFACE
    )
    :vars
    (
      ?auto_125984 - HOIST
      ?auto_125985 - PLACE
      ?auto_125983 - SURFACE
      ?auto_125987 - PLACE
      ?auto_125988 - HOIST
      ?auto_125982 - SURFACE
      ?auto_125986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125984 ?auto_125985 ) ( IS-CRATE ?auto_125981 ) ( not ( = ?auto_125980 ?auto_125981 ) ) ( not ( = ?auto_125983 ?auto_125980 ) ) ( not ( = ?auto_125983 ?auto_125981 ) ) ( not ( = ?auto_125987 ?auto_125985 ) ) ( HOIST-AT ?auto_125988 ?auto_125987 ) ( not ( = ?auto_125984 ?auto_125988 ) ) ( AVAILABLE ?auto_125988 ) ( SURFACE-AT ?auto_125981 ?auto_125987 ) ( ON ?auto_125981 ?auto_125982 ) ( CLEAR ?auto_125981 ) ( not ( = ?auto_125980 ?auto_125982 ) ) ( not ( = ?auto_125981 ?auto_125982 ) ) ( not ( = ?auto_125983 ?auto_125982 ) ) ( TRUCK-AT ?auto_125986 ?auto_125985 ) ( SURFACE-AT ?auto_125983 ?auto_125985 ) ( CLEAR ?auto_125983 ) ( IS-CRATE ?auto_125980 ) ( AVAILABLE ?auto_125984 ) ( IN ?auto_125980 ?auto_125986 ) )
    :subtasks
    ( ( !UNLOAD ?auto_125984 ?auto_125980 ?auto_125986 ?auto_125985 )
      ( MAKE-2CRATE ?auto_125983 ?auto_125980 ?auto_125981 )
      ( MAKE-1CRATE-VERIFY ?auto_125980 ?auto_125981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125989 - SURFACE
      ?auto_125990 - SURFACE
      ?auto_125991 - SURFACE
    )
    :vars
    (
      ?auto_125992 - HOIST
      ?auto_125995 - PLACE
      ?auto_125996 - PLACE
      ?auto_125997 - HOIST
      ?auto_125993 - SURFACE
      ?auto_125994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125992 ?auto_125995 ) ( IS-CRATE ?auto_125991 ) ( not ( = ?auto_125990 ?auto_125991 ) ) ( not ( = ?auto_125989 ?auto_125990 ) ) ( not ( = ?auto_125989 ?auto_125991 ) ) ( not ( = ?auto_125996 ?auto_125995 ) ) ( HOIST-AT ?auto_125997 ?auto_125996 ) ( not ( = ?auto_125992 ?auto_125997 ) ) ( AVAILABLE ?auto_125997 ) ( SURFACE-AT ?auto_125991 ?auto_125996 ) ( ON ?auto_125991 ?auto_125993 ) ( CLEAR ?auto_125991 ) ( not ( = ?auto_125990 ?auto_125993 ) ) ( not ( = ?auto_125991 ?auto_125993 ) ) ( not ( = ?auto_125989 ?auto_125993 ) ) ( TRUCK-AT ?auto_125994 ?auto_125995 ) ( SURFACE-AT ?auto_125989 ?auto_125995 ) ( CLEAR ?auto_125989 ) ( IS-CRATE ?auto_125990 ) ( AVAILABLE ?auto_125992 ) ( IN ?auto_125990 ?auto_125994 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125990 ?auto_125991 )
      ( MAKE-2CRATE-VERIFY ?auto_125989 ?auto_125990 ?auto_125991 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126034 - SURFACE
      ?auto_126035 - SURFACE
    )
    :vars
    (
      ?auto_126039 - HOIST
      ?auto_126037 - PLACE
      ?auto_126040 - SURFACE
      ?auto_126042 - PLACE
      ?auto_126041 - HOIST
      ?auto_126038 - SURFACE
      ?auto_126036 - TRUCK
      ?auto_126043 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126039 ?auto_126037 ) ( SURFACE-AT ?auto_126034 ?auto_126037 ) ( CLEAR ?auto_126034 ) ( IS-CRATE ?auto_126035 ) ( not ( = ?auto_126034 ?auto_126035 ) ) ( AVAILABLE ?auto_126039 ) ( ON ?auto_126034 ?auto_126040 ) ( not ( = ?auto_126040 ?auto_126034 ) ) ( not ( = ?auto_126040 ?auto_126035 ) ) ( not ( = ?auto_126042 ?auto_126037 ) ) ( HOIST-AT ?auto_126041 ?auto_126042 ) ( not ( = ?auto_126039 ?auto_126041 ) ) ( AVAILABLE ?auto_126041 ) ( SURFACE-AT ?auto_126035 ?auto_126042 ) ( ON ?auto_126035 ?auto_126038 ) ( CLEAR ?auto_126035 ) ( not ( = ?auto_126034 ?auto_126038 ) ) ( not ( = ?auto_126035 ?auto_126038 ) ) ( not ( = ?auto_126040 ?auto_126038 ) ) ( TRUCK-AT ?auto_126036 ?auto_126043 ) ( not ( = ?auto_126043 ?auto_126037 ) ) ( not ( = ?auto_126042 ?auto_126043 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_126036 ?auto_126043 ?auto_126037 )
      ( MAKE-1CRATE ?auto_126034 ?auto_126035 )
      ( MAKE-1CRATE-VERIFY ?auto_126034 ?auto_126035 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126074 - SURFACE
      ?auto_126075 - SURFACE
      ?auto_126076 - SURFACE
      ?auto_126073 - SURFACE
    )
    :vars
    (
      ?auto_126078 - HOIST
      ?auto_126077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126078 ?auto_126077 ) ( SURFACE-AT ?auto_126076 ?auto_126077 ) ( CLEAR ?auto_126076 ) ( LIFTING ?auto_126078 ?auto_126073 ) ( IS-CRATE ?auto_126073 ) ( not ( = ?auto_126076 ?auto_126073 ) ) ( ON ?auto_126075 ?auto_126074 ) ( ON ?auto_126076 ?auto_126075 ) ( not ( = ?auto_126074 ?auto_126075 ) ) ( not ( = ?auto_126074 ?auto_126076 ) ) ( not ( = ?auto_126074 ?auto_126073 ) ) ( not ( = ?auto_126075 ?auto_126076 ) ) ( not ( = ?auto_126075 ?auto_126073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126076 ?auto_126073 )
      ( MAKE-3CRATE-VERIFY ?auto_126074 ?auto_126075 ?auto_126076 ?auto_126073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126091 - SURFACE
      ?auto_126092 - SURFACE
      ?auto_126093 - SURFACE
      ?auto_126090 - SURFACE
    )
    :vars
    (
      ?auto_126096 - HOIST
      ?auto_126095 - PLACE
      ?auto_126094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126096 ?auto_126095 ) ( SURFACE-AT ?auto_126093 ?auto_126095 ) ( CLEAR ?auto_126093 ) ( IS-CRATE ?auto_126090 ) ( not ( = ?auto_126093 ?auto_126090 ) ) ( TRUCK-AT ?auto_126094 ?auto_126095 ) ( AVAILABLE ?auto_126096 ) ( IN ?auto_126090 ?auto_126094 ) ( ON ?auto_126093 ?auto_126092 ) ( not ( = ?auto_126092 ?auto_126093 ) ) ( not ( = ?auto_126092 ?auto_126090 ) ) ( ON ?auto_126092 ?auto_126091 ) ( not ( = ?auto_126091 ?auto_126092 ) ) ( not ( = ?auto_126091 ?auto_126093 ) ) ( not ( = ?auto_126091 ?auto_126090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126092 ?auto_126093 ?auto_126090 )
      ( MAKE-3CRATE-VERIFY ?auto_126091 ?auto_126092 ?auto_126093 ?auto_126090 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126112 - SURFACE
      ?auto_126113 - SURFACE
      ?auto_126114 - SURFACE
      ?auto_126111 - SURFACE
    )
    :vars
    (
      ?auto_126116 - HOIST
      ?auto_126117 - PLACE
      ?auto_126118 - TRUCK
      ?auto_126115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126116 ?auto_126117 ) ( SURFACE-AT ?auto_126114 ?auto_126117 ) ( CLEAR ?auto_126114 ) ( IS-CRATE ?auto_126111 ) ( not ( = ?auto_126114 ?auto_126111 ) ) ( AVAILABLE ?auto_126116 ) ( IN ?auto_126111 ?auto_126118 ) ( ON ?auto_126114 ?auto_126113 ) ( not ( = ?auto_126113 ?auto_126114 ) ) ( not ( = ?auto_126113 ?auto_126111 ) ) ( TRUCK-AT ?auto_126118 ?auto_126115 ) ( not ( = ?auto_126115 ?auto_126117 ) ) ( ON ?auto_126113 ?auto_126112 ) ( not ( = ?auto_126112 ?auto_126113 ) ) ( not ( = ?auto_126112 ?auto_126114 ) ) ( not ( = ?auto_126112 ?auto_126111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126113 ?auto_126114 ?auto_126111 )
      ( MAKE-3CRATE-VERIFY ?auto_126112 ?auto_126113 ?auto_126114 ?auto_126111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126136 - SURFACE
      ?auto_126137 - SURFACE
      ?auto_126138 - SURFACE
      ?auto_126135 - SURFACE
    )
    :vars
    (
      ?auto_126141 - HOIST
      ?auto_126140 - PLACE
      ?auto_126142 - TRUCK
      ?auto_126139 - PLACE
      ?auto_126143 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126141 ?auto_126140 ) ( SURFACE-AT ?auto_126138 ?auto_126140 ) ( CLEAR ?auto_126138 ) ( IS-CRATE ?auto_126135 ) ( not ( = ?auto_126138 ?auto_126135 ) ) ( AVAILABLE ?auto_126141 ) ( ON ?auto_126138 ?auto_126137 ) ( not ( = ?auto_126137 ?auto_126138 ) ) ( not ( = ?auto_126137 ?auto_126135 ) ) ( TRUCK-AT ?auto_126142 ?auto_126139 ) ( not ( = ?auto_126139 ?auto_126140 ) ) ( HOIST-AT ?auto_126143 ?auto_126139 ) ( LIFTING ?auto_126143 ?auto_126135 ) ( not ( = ?auto_126141 ?auto_126143 ) ) ( ON ?auto_126137 ?auto_126136 ) ( not ( = ?auto_126136 ?auto_126137 ) ) ( not ( = ?auto_126136 ?auto_126138 ) ) ( not ( = ?auto_126136 ?auto_126135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126137 ?auto_126138 ?auto_126135 )
      ( MAKE-3CRATE-VERIFY ?auto_126136 ?auto_126137 ?auto_126138 ?auto_126135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126163 - SURFACE
      ?auto_126164 - SURFACE
      ?auto_126165 - SURFACE
      ?auto_126162 - SURFACE
    )
    :vars
    (
      ?auto_126166 - HOIST
      ?auto_126167 - PLACE
      ?auto_126168 - TRUCK
      ?auto_126170 - PLACE
      ?auto_126169 - HOIST
      ?auto_126171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126166 ?auto_126167 ) ( SURFACE-AT ?auto_126165 ?auto_126167 ) ( CLEAR ?auto_126165 ) ( IS-CRATE ?auto_126162 ) ( not ( = ?auto_126165 ?auto_126162 ) ) ( AVAILABLE ?auto_126166 ) ( ON ?auto_126165 ?auto_126164 ) ( not ( = ?auto_126164 ?auto_126165 ) ) ( not ( = ?auto_126164 ?auto_126162 ) ) ( TRUCK-AT ?auto_126168 ?auto_126170 ) ( not ( = ?auto_126170 ?auto_126167 ) ) ( HOIST-AT ?auto_126169 ?auto_126170 ) ( not ( = ?auto_126166 ?auto_126169 ) ) ( AVAILABLE ?auto_126169 ) ( SURFACE-AT ?auto_126162 ?auto_126170 ) ( ON ?auto_126162 ?auto_126171 ) ( CLEAR ?auto_126162 ) ( not ( = ?auto_126165 ?auto_126171 ) ) ( not ( = ?auto_126162 ?auto_126171 ) ) ( not ( = ?auto_126164 ?auto_126171 ) ) ( ON ?auto_126164 ?auto_126163 ) ( not ( = ?auto_126163 ?auto_126164 ) ) ( not ( = ?auto_126163 ?auto_126165 ) ) ( not ( = ?auto_126163 ?auto_126162 ) ) ( not ( = ?auto_126163 ?auto_126171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126164 ?auto_126165 ?auto_126162 )
      ( MAKE-3CRATE-VERIFY ?auto_126163 ?auto_126164 ?auto_126165 ?auto_126162 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126191 - SURFACE
      ?auto_126192 - SURFACE
      ?auto_126193 - SURFACE
      ?auto_126190 - SURFACE
    )
    :vars
    (
      ?auto_126198 - HOIST
      ?auto_126199 - PLACE
      ?auto_126197 - PLACE
      ?auto_126194 - HOIST
      ?auto_126195 - SURFACE
      ?auto_126196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126198 ?auto_126199 ) ( SURFACE-AT ?auto_126193 ?auto_126199 ) ( CLEAR ?auto_126193 ) ( IS-CRATE ?auto_126190 ) ( not ( = ?auto_126193 ?auto_126190 ) ) ( AVAILABLE ?auto_126198 ) ( ON ?auto_126193 ?auto_126192 ) ( not ( = ?auto_126192 ?auto_126193 ) ) ( not ( = ?auto_126192 ?auto_126190 ) ) ( not ( = ?auto_126197 ?auto_126199 ) ) ( HOIST-AT ?auto_126194 ?auto_126197 ) ( not ( = ?auto_126198 ?auto_126194 ) ) ( AVAILABLE ?auto_126194 ) ( SURFACE-AT ?auto_126190 ?auto_126197 ) ( ON ?auto_126190 ?auto_126195 ) ( CLEAR ?auto_126190 ) ( not ( = ?auto_126193 ?auto_126195 ) ) ( not ( = ?auto_126190 ?auto_126195 ) ) ( not ( = ?auto_126192 ?auto_126195 ) ) ( TRUCK-AT ?auto_126196 ?auto_126199 ) ( ON ?auto_126192 ?auto_126191 ) ( not ( = ?auto_126191 ?auto_126192 ) ) ( not ( = ?auto_126191 ?auto_126193 ) ) ( not ( = ?auto_126191 ?auto_126190 ) ) ( not ( = ?auto_126191 ?auto_126195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126192 ?auto_126193 ?auto_126190 )
      ( MAKE-3CRATE-VERIFY ?auto_126191 ?auto_126192 ?auto_126193 ?auto_126190 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126219 - SURFACE
      ?auto_126220 - SURFACE
      ?auto_126221 - SURFACE
      ?auto_126218 - SURFACE
    )
    :vars
    (
      ?auto_126222 - HOIST
      ?auto_126223 - PLACE
      ?auto_126225 - PLACE
      ?auto_126226 - HOIST
      ?auto_126227 - SURFACE
      ?auto_126224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126222 ?auto_126223 ) ( IS-CRATE ?auto_126218 ) ( not ( = ?auto_126221 ?auto_126218 ) ) ( not ( = ?auto_126220 ?auto_126221 ) ) ( not ( = ?auto_126220 ?auto_126218 ) ) ( not ( = ?auto_126225 ?auto_126223 ) ) ( HOIST-AT ?auto_126226 ?auto_126225 ) ( not ( = ?auto_126222 ?auto_126226 ) ) ( AVAILABLE ?auto_126226 ) ( SURFACE-AT ?auto_126218 ?auto_126225 ) ( ON ?auto_126218 ?auto_126227 ) ( CLEAR ?auto_126218 ) ( not ( = ?auto_126221 ?auto_126227 ) ) ( not ( = ?auto_126218 ?auto_126227 ) ) ( not ( = ?auto_126220 ?auto_126227 ) ) ( TRUCK-AT ?auto_126224 ?auto_126223 ) ( SURFACE-AT ?auto_126220 ?auto_126223 ) ( CLEAR ?auto_126220 ) ( LIFTING ?auto_126222 ?auto_126221 ) ( IS-CRATE ?auto_126221 ) ( ON ?auto_126220 ?auto_126219 ) ( not ( = ?auto_126219 ?auto_126220 ) ) ( not ( = ?auto_126219 ?auto_126221 ) ) ( not ( = ?auto_126219 ?auto_126218 ) ) ( not ( = ?auto_126219 ?auto_126227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126220 ?auto_126221 ?auto_126218 )
      ( MAKE-3CRATE-VERIFY ?auto_126219 ?auto_126220 ?auto_126221 ?auto_126218 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126247 - SURFACE
      ?auto_126248 - SURFACE
      ?auto_126249 - SURFACE
      ?auto_126246 - SURFACE
    )
    :vars
    (
      ?auto_126255 - HOIST
      ?auto_126250 - PLACE
      ?auto_126253 - PLACE
      ?auto_126251 - HOIST
      ?auto_126252 - SURFACE
      ?auto_126254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126255 ?auto_126250 ) ( IS-CRATE ?auto_126246 ) ( not ( = ?auto_126249 ?auto_126246 ) ) ( not ( = ?auto_126248 ?auto_126249 ) ) ( not ( = ?auto_126248 ?auto_126246 ) ) ( not ( = ?auto_126253 ?auto_126250 ) ) ( HOIST-AT ?auto_126251 ?auto_126253 ) ( not ( = ?auto_126255 ?auto_126251 ) ) ( AVAILABLE ?auto_126251 ) ( SURFACE-AT ?auto_126246 ?auto_126253 ) ( ON ?auto_126246 ?auto_126252 ) ( CLEAR ?auto_126246 ) ( not ( = ?auto_126249 ?auto_126252 ) ) ( not ( = ?auto_126246 ?auto_126252 ) ) ( not ( = ?auto_126248 ?auto_126252 ) ) ( TRUCK-AT ?auto_126254 ?auto_126250 ) ( SURFACE-AT ?auto_126248 ?auto_126250 ) ( CLEAR ?auto_126248 ) ( IS-CRATE ?auto_126249 ) ( AVAILABLE ?auto_126255 ) ( IN ?auto_126249 ?auto_126254 ) ( ON ?auto_126248 ?auto_126247 ) ( not ( = ?auto_126247 ?auto_126248 ) ) ( not ( = ?auto_126247 ?auto_126249 ) ) ( not ( = ?auto_126247 ?auto_126246 ) ) ( not ( = ?auto_126247 ?auto_126252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126248 ?auto_126249 ?auto_126246 )
      ( MAKE-3CRATE-VERIFY ?auto_126247 ?auto_126248 ?auto_126249 ?auto_126246 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126538 - SURFACE
      ?auto_126539 - SURFACE
      ?auto_126540 - SURFACE
      ?auto_126537 - SURFACE
      ?auto_126541 - SURFACE
    )
    :vars
    (
      ?auto_126542 - HOIST
      ?auto_126543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126542 ?auto_126543 ) ( SURFACE-AT ?auto_126537 ?auto_126543 ) ( CLEAR ?auto_126537 ) ( LIFTING ?auto_126542 ?auto_126541 ) ( IS-CRATE ?auto_126541 ) ( not ( = ?auto_126537 ?auto_126541 ) ) ( ON ?auto_126539 ?auto_126538 ) ( ON ?auto_126540 ?auto_126539 ) ( ON ?auto_126537 ?auto_126540 ) ( not ( = ?auto_126538 ?auto_126539 ) ) ( not ( = ?auto_126538 ?auto_126540 ) ) ( not ( = ?auto_126538 ?auto_126537 ) ) ( not ( = ?auto_126538 ?auto_126541 ) ) ( not ( = ?auto_126539 ?auto_126540 ) ) ( not ( = ?auto_126539 ?auto_126537 ) ) ( not ( = ?auto_126539 ?auto_126541 ) ) ( not ( = ?auto_126540 ?auto_126537 ) ) ( not ( = ?auto_126540 ?auto_126541 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126537 ?auto_126541 )
      ( MAKE-4CRATE-VERIFY ?auto_126538 ?auto_126539 ?auto_126540 ?auto_126537 ?auto_126541 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126563 - SURFACE
      ?auto_126564 - SURFACE
      ?auto_126565 - SURFACE
      ?auto_126562 - SURFACE
      ?auto_126566 - SURFACE
    )
    :vars
    (
      ?auto_126567 - HOIST
      ?auto_126568 - PLACE
      ?auto_126569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126567 ?auto_126568 ) ( SURFACE-AT ?auto_126562 ?auto_126568 ) ( CLEAR ?auto_126562 ) ( IS-CRATE ?auto_126566 ) ( not ( = ?auto_126562 ?auto_126566 ) ) ( TRUCK-AT ?auto_126569 ?auto_126568 ) ( AVAILABLE ?auto_126567 ) ( IN ?auto_126566 ?auto_126569 ) ( ON ?auto_126562 ?auto_126565 ) ( not ( = ?auto_126565 ?auto_126562 ) ) ( not ( = ?auto_126565 ?auto_126566 ) ) ( ON ?auto_126564 ?auto_126563 ) ( ON ?auto_126565 ?auto_126564 ) ( not ( = ?auto_126563 ?auto_126564 ) ) ( not ( = ?auto_126563 ?auto_126565 ) ) ( not ( = ?auto_126563 ?auto_126562 ) ) ( not ( = ?auto_126563 ?auto_126566 ) ) ( not ( = ?auto_126564 ?auto_126565 ) ) ( not ( = ?auto_126564 ?auto_126562 ) ) ( not ( = ?auto_126564 ?auto_126566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126565 ?auto_126562 ?auto_126566 )
      ( MAKE-4CRATE-VERIFY ?auto_126563 ?auto_126564 ?auto_126565 ?auto_126562 ?auto_126566 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126593 - SURFACE
      ?auto_126594 - SURFACE
      ?auto_126595 - SURFACE
      ?auto_126592 - SURFACE
      ?auto_126596 - SURFACE
    )
    :vars
    (
      ?auto_126598 - HOIST
      ?auto_126600 - PLACE
      ?auto_126597 - TRUCK
      ?auto_126599 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126598 ?auto_126600 ) ( SURFACE-AT ?auto_126592 ?auto_126600 ) ( CLEAR ?auto_126592 ) ( IS-CRATE ?auto_126596 ) ( not ( = ?auto_126592 ?auto_126596 ) ) ( AVAILABLE ?auto_126598 ) ( IN ?auto_126596 ?auto_126597 ) ( ON ?auto_126592 ?auto_126595 ) ( not ( = ?auto_126595 ?auto_126592 ) ) ( not ( = ?auto_126595 ?auto_126596 ) ) ( TRUCK-AT ?auto_126597 ?auto_126599 ) ( not ( = ?auto_126599 ?auto_126600 ) ) ( ON ?auto_126594 ?auto_126593 ) ( ON ?auto_126595 ?auto_126594 ) ( not ( = ?auto_126593 ?auto_126594 ) ) ( not ( = ?auto_126593 ?auto_126595 ) ) ( not ( = ?auto_126593 ?auto_126592 ) ) ( not ( = ?auto_126593 ?auto_126596 ) ) ( not ( = ?auto_126594 ?auto_126595 ) ) ( not ( = ?auto_126594 ?auto_126592 ) ) ( not ( = ?auto_126594 ?auto_126596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126595 ?auto_126592 ?auto_126596 )
      ( MAKE-4CRATE-VERIFY ?auto_126593 ?auto_126594 ?auto_126595 ?auto_126592 ?auto_126596 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126627 - SURFACE
      ?auto_126628 - SURFACE
      ?auto_126629 - SURFACE
      ?auto_126626 - SURFACE
      ?auto_126630 - SURFACE
    )
    :vars
    (
      ?auto_126633 - HOIST
      ?auto_126631 - PLACE
      ?auto_126632 - TRUCK
      ?auto_126634 - PLACE
      ?auto_126635 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126633 ?auto_126631 ) ( SURFACE-AT ?auto_126626 ?auto_126631 ) ( CLEAR ?auto_126626 ) ( IS-CRATE ?auto_126630 ) ( not ( = ?auto_126626 ?auto_126630 ) ) ( AVAILABLE ?auto_126633 ) ( ON ?auto_126626 ?auto_126629 ) ( not ( = ?auto_126629 ?auto_126626 ) ) ( not ( = ?auto_126629 ?auto_126630 ) ) ( TRUCK-AT ?auto_126632 ?auto_126634 ) ( not ( = ?auto_126634 ?auto_126631 ) ) ( HOIST-AT ?auto_126635 ?auto_126634 ) ( LIFTING ?auto_126635 ?auto_126630 ) ( not ( = ?auto_126633 ?auto_126635 ) ) ( ON ?auto_126628 ?auto_126627 ) ( ON ?auto_126629 ?auto_126628 ) ( not ( = ?auto_126627 ?auto_126628 ) ) ( not ( = ?auto_126627 ?auto_126629 ) ) ( not ( = ?auto_126627 ?auto_126626 ) ) ( not ( = ?auto_126627 ?auto_126630 ) ) ( not ( = ?auto_126628 ?auto_126629 ) ) ( not ( = ?auto_126628 ?auto_126626 ) ) ( not ( = ?auto_126628 ?auto_126630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126629 ?auto_126626 ?auto_126630 )
      ( MAKE-4CRATE-VERIFY ?auto_126627 ?auto_126628 ?auto_126629 ?auto_126626 ?auto_126630 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126665 - SURFACE
      ?auto_126666 - SURFACE
      ?auto_126667 - SURFACE
      ?auto_126664 - SURFACE
      ?auto_126668 - SURFACE
    )
    :vars
    (
      ?auto_126674 - HOIST
      ?auto_126673 - PLACE
      ?auto_126672 - TRUCK
      ?auto_126669 - PLACE
      ?auto_126670 - HOIST
      ?auto_126671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126674 ?auto_126673 ) ( SURFACE-AT ?auto_126664 ?auto_126673 ) ( CLEAR ?auto_126664 ) ( IS-CRATE ?auto_126668 ) ( not ( = ?auto_126664 ?auto_126668 ) ) ( AVAILABLE ?auto_126674 ) ( ON ?auto_126664 ?auto_126667 ) ( not ( = ?auto_126667 ?auto_126664 ) ) ( not ( = ?auto_126667 ?auto_126668 ) ) ( TRUCK-AT ?auto_126672 ?auto_126669 ) ( not ( = ?auto_126669 ?auto_126673 ) ) ( HOIST-AT ?auto_126670 ?auto_126669 ) ( not ( = ?auto_126674 ?auto_126670 ) ) ( AVAILABLE ?auto_126670 ) ( SURFACE-AT ?auto_126668 ?auto_126669 ) ( ON ?auto_126668 ?auto_126671 ) ( CLEAR ?auto_126668 ) ( not ( = ?auto_126664 ?auto_126671 ) ) ( not ( = ?auto_126668 ?auto_126671 ) ) ( not ( = ?auto_126667 ?auto_126671 ) ) ( ON ?auto_126666 ?auto_126665 ) ( ON ?auto_126667 ?auto_126666 ) ( not ( = ?auto_126665 ?auto_126666 ) ) ( not ( = ?auto_126665 ?auto_126667 ) ) ( not ( = ?auto_126665 ?auto_126664 ) ) ( not ( = ?auto_126665 ?auto_126668 ) ) ( not ( = ?auto_126665 ?auto_126671 ) ) ( not ( = ?auto_126666 ?auto_126667 ) ) ( not ( = ?auto_126666 ?auto_126664 ) ) ( not ( = ?auto_126666 ?auto_126668 ) ) ( not ( = ?auto_126666 ?auto_126671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126667 ?auto_126664 ?auto_126668 )
      ( MAKE-4CRATE-VERIFY ?auto_126665 ?auto_126666 ?auto_126667 ?auto_126664 ?auto_126668 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126704 - SURFACE
      ?auto_126705 - SURFACE
      ?auto_126706 - SURFACE
      ?auto_126703 - SURFACE
      ?auto_126707 - SURFACE
    )
    :vars
    (
      ?auto_126711 - HOIST
      ?auto_126708 - PLACE
      ?auto_126713 - PLACE
      ?auto_126709 - HOIST
      ?auto_126712 - SURFACE
      ?auto_126710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126711 ?auto_126708 ) ( SURFACE-AT ?auto_126703 ?auto_126708 ) ( CLEAR ?auto_126703 ) ( IS-CRATE ?auto_126707 ) ( not ( = ?auto_126703 ?auto_126707 ) ) ( AVAILABLE ?auto_126711 ) ( ON ?auto_126703 ?auto_126706 ) ( not ( = ?auto_126706 ?auto_126703 ) ) ( not ( = ?auto_126706 ?auto_126707 ) ) ( not ( = ?auto_126713 ?auto_126708 ) ) ( HOIST-AT ?auto_126709 ?auto_126713 ) ( not ( = ?auto_126711 ?auto_126709 ) ) ( AVAILABLE ?auto_126709 ) ( SURFACE-AT ?auto_126707 ?auto_126713 ) ( ON ?auto_126707 ?auto_126712 ) ( CLEAR ?auto_126707 ) ( not ( = ?auto_126703 ?auto_126712 ) ) ( not ( = ?auto_126707 ?auto_126712 ) ) ( not ( = ?auto_126706 ?auto_126712 ) ) ( TRUCK-AT ?auto_126710 ?auto_126708 ) ( ON ?auto_126705 ?auto_126704 ) ( ON ?auto_126706 ?auto_126705 ) ( not ( = ?auto_126704 ?auto_126705 ) ) ( not ( = ?auto_126704 ?auto_126706 ) ) ( not ( = ?auto_126704 ?auto_126703 ) ) ( not ( = ?auto_126704 ?auto_126707 ) ) ( not ( = ?auto_126704 ?auto_126712 ) ) ( not ( = ?auto_126705 ?auto_126706 ) ) ( not ( = ?auto_126705 ?auto_126703 ) ) ( not ( = ?auto_126705 ?auto_126707 ) ) ( not ( = ?auto_126705 ?auto_126712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126706 ?auto_126703 ?auto_126707 )
      ( MAKE-4CRATE-VERIFY ?auto_126704 ?auto_126705 ?auto_126706 ?auto_126703 ?auto_126707 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126743 - SURFACE
      ?auto_126744 - SURFACE
      ?auto_126745 - SURFACE
      ?auto_126742 - SURFACE
      ?auto_126746 - SURFACE
    )
    :vars
    (
      ?auto_126748 - HOIST
      ?auto_126747 - PLACE
      ?auto_126751 - PLACE
      ?auto_126752 - HOIST
      ?auto_126749 - SURFACE
      ?auto_126750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126748 ?auto_126747 ) ( IS-CRATE ?auto_126746 ) ( not ( = ?auto_126742 ?auto_126746 ) ) ( not ( = ?auto_126745 ?auto_126742 ) ) ( not ( = ?auto_126745 ?auto_126746 ) ) ( not ( = ?auto_126751 ?auto_126747 ) ) ( HOIST-AT ?auto_126752 ?auto_126751 ) ( not ( = ?auto_126748 ?auto_126752 ) ) ( AVAILABLE ?auto_126752 ) ( SURFACE-AT ?auto_126746 ?auto_126751 ) ( ON ?auto_126746 ?auto_126749 ) ( CLEAR ?auto_126746 ) ( not ( = ?auto_126742 ?auto_126749 ) ) ( not ( = ?auto_126746 ?auto_126749 ) ) ( not ( = ?auto_126745 ?auto_126749 ) ) ( TRUCK-AT ?auto_126750 ?auto_126747 ) ( SURFACE-AT ?auto_126745 ?auto_126747 ) ( CLEAR ?auto_126745 ) ( LIFTING ?auto_126748 ?auto_126742 ) ( IS-CRATE ?auto_126742 ) ( ON ?auto_126744 ?auto_126743 ) ( ON ?auto_126745 ?auto_126744 ) ( not ( = ?auto_126743 ?auto_126744 ) ) ( not ( = ?auto_126743 ?auto_126745 ) ) ( not ( = ?auto_126743 ?auto_126742 ) ) ( not ( = ?auto_126743 ?auto_126746 ) ) ( not ( = ?auto_126743 ?auto_126749 ) ) ( not ( = ?auto_126744 ?auto_126745 ) ) ( not ( = ?auto_126744 ?auto_126742 ) ) ( not ( = ?auto_126744 ?auto_126746 ) ) ( not ( = ?auto_126744 ?auto_126749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126745 ?auto_126742 ?auto_126746 )
      ( MAKE-4CRATE-VERIFY ?auto_126743 ?auto_126744 ?auto_126745 ?auto_126742 ?auto_126746 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126782 - SURFACE
      ?auto_126783 - SURFACE
      ?auto_126784 - SURFACE
      ?auto_126781 - SURFACE
      ?auto_126785 - SURFACE
    )
    :vars
    (
      ?auto_126787 - HOIST
      ?auto_126786 - PLACE
      ?auto_126790 - PLACE
      ?auto_126791 - HOIST
      ?auto_126788 - SURFACE
      ?auto_126789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126787 ?auto_126786 ) ( IS-CRATE ?auto_126785 ) ( not ( = ?auto_126781 ?auto_126785 ) ) ( not ( = ?auto_126784 ?auto_126781 ) ) ( not ( = ?auto_126784 ?auto_126785 ) ) ( not ( = ?auto_126790 ?auto_126786 ) ) ( HOIST-AT ?auto_126791 ?auto_126790 ) ( not ( = ?auto_126787 ?auto_126791 ) ) ( AVAILABLE ?auto_126791 ) ( SURFACE-AT ?auto_126785 ?auto_126790 ) ( ON ?auto_126785 ?auto_126788 ) ( CLEAR ?auto_126785 ) ( not ( = ?auto_126781 ?auto_126788 ) ) ( not ( = ?auto_126785 ?auto_126788 ) ) ( not ( = ?auto_126784 ?auto_126788 ) ) ( TRUCK-AT ?auto_126789 ?auto_126786 ) ( SURFACE-AT ?auto_126784 ?auto_126786 ) ( CLEAR ?auto_126784 ) ( IS-CRATE ?auto_126781 ) ( AVAILABLE ?auto_126787 ) ( IN ?auto_126781 ?auto_126789 ) ( ON ?auto_126783 ?auto_126782 ) ( ON ?auto_126784 ?auto_126783 ) ( not ( = ?auto_126782 ?auto_126783 ) ) ( not ( = ?auto_126782 ?auto_126784 ) ) ( not ( = ?auto_126782 ?auto_126781 ) ) ( not ( = ?auto_126782 ?auto_126785 ) ) ( not ( = ?auto_126782 ?auto_126788 ) ) ( not ( = ?auto_126783 ?auto_126784 ) ) ( not ( = ?auto_126783 ?auto_126781 ) ) ( not ( = ?auto_126783 ?auto_126785 ) ) ( not ( = ?auto_126783 ?auto_126788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126784 ?auto_126781 ?auto_126785 )
      ( MAKE-4CRATE-VERIFY ?auto_126782 ?auto_126783 ?auto_126784 ?auto_126781 ?auto_126785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_127054 - SURFACE
      ?auto_127055 - SURFACE
    )
    :vars
    (
      ?auto_127057 - HOIST
      ?auto_127058 - PLACE
      ?auto_127060 - SURFACE
      ?auto_127062 - TRUCK
      ?auto_127056 - PLACE
      ?auto_127061 - HOIST
      ?auto_127059 - SURFACE
      ?auto_127063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127057 ?auto_127058 ) ( SURFACE-AT ?auto_127054 ?auto_127058 ) ( CLEAR ?auto_127054 ) ( IS-CRATE ?auto_127055 ) ( not ( = ?auto_127054 ?auto_127055 ) ) ( AVAILABLE ?auto_127057 ) ( ON ?auto_127054 ?auto_127060 ) ( not ( = ?auto_127060 ?auto_127054 ) ) ( not ( = ?auto_127060 ?auto_127055 ) ) ( TRUCK-AT ?auto_127062 ?auto_127056 ) ( not ( = ?auto_127056 ?auto_127058 ) ) ( HOIST-AT ?auto_127061 ?auto_127056 ) ( not ( = ?auto_127057 ?auto_127061 ) ) ( SURFACE-AT ?auto_127055 ?auto_127056 ) ( ON ?auto_127055 ?auto_127059 ) ( CLEAR ?auto_127055 ) ( not ( = ?auto_127054 ?auto_127059 ) ) ( not ( = ?auto_127055 ?auto_127059 ) ) ( not ( = ?auto_127060 ?auto_127059 ) ) ( LIFTING ?auto_127061 ?auto_127063 ) ( IS-CRATE ?auto_127063 ) ( not ( = ?auto_127054 ?auto_127063 ) ) ( not ( = ?auto_127055 ?auto_127063 ) ) ( not ( = ?auto_127060 ?auto_127063 ) ) ( not ( = ?auto_127059 ?auto_127063 ) ) )
    :subtasks
    ( ( !LOAD ?auto_127061 ?auto_127063 ?auto_127062 ?auto_127056 )
      ( MAKE-1CRATE ?auto_127054 ?auto_127055 )
      ( MAKE-1CRATE-VERIFY ?auto_127054 ?auto_127055 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127441 - SURFACE
      ?auto_127442 - SURFACE
      ?auto_127443 - SURFACE
      ?auto_127440 - SURFACE
      ?auto_127444 - SURFACE
      ?auto_127445 - SURFACE
    )
    :vars
    (
      ?auto_127446 - HOIST
      ?auto_127447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127446 ?auto_127447 ) ( SURFACE-AT ?auto_127444 ?auto_127447 ) ( CLEAR ?auto_127444 ) ( LIFTING ?auto_127446 ?auto_127445 ) ( IS-CRATE ?auto_127445 ) ( not ( = ?auto_127444 ?auto_127445 ) ) ( ON ?auto_127442 ?auto_127441 ) ( ON ?auto_127443 ?auto_127442 ) ( ON ?auto_127440 ?auto_127443 ) ( ON ?auto_127444 ?auto_127440 ) ( not ( = ?auto_127441 ?auto_127442 ) ) ( not ( = ?auto_127441 ?auto_127443 ) ) ( not ( = ?auto_127441 ?auto_127440 ) ) ( not ( = ?auto_127441 ?auto_127444 ) ) ( not ( = ?auto_127441 ?auto_127445 ) ) ( not ( = ?auto_127442 ?auto_127443 ) ) ( not ( = ?auto_127442 ?auto_127440 ) ) ( not ( = ?auto_127442 ?auto_127444 ) ) ( not ( = ?auto_127442 ?auto_127445 ) ) ( not ( = ?auto_127443 ?auto_127440 ) ) ( not ( = ?auto_127443 ?auto_127444 ) ) ( not ( = ?auto_127443 ?auto_127445 ) ) ( not ( = ?auto_127440 ?auto_127444 ) ) ( not ( = ?auto_127440 ?auto_127445 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_127444 ?auto_127445 )
      ( MAKE-5CRATE-VERIFY ?auto_127441 ?auto_127442 ?auto_127443 ?auto_127440 ?auto_127444 ?auto_127445 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127475 - SURFACE
      ?auto_127476 - SURFACE
      ?auto_127477 - SURFACE
      ?auto_127474 - SURFACE
      ?auto_127478 - SURFACE
      ?auto_127479 - SURFACE
    )
    :vars
    (
      ?auto_127481 - HOIST
      ?auto_127480 - PLACE
      ?auto_127482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127481 ?auto_127480 ) ( SURFACE-AT ?auto_127478 ?auto_127480 ) ( CLEAR ?auto_127478 ) ( IS-CRATE ?auto_127479 ) ( not ( = ?auto_127478 ?auto_127479 ) ) ( TRUCK-AT ?auto_127482 ?auto_127480 ) ( AVAILABLE ?auto_127481 ) ( IN ?auto_127479 ?auto_127482 ) ( ON ?auto_127478 ?auto_127474 ) ( not ( = ?auto_127474 ?auto_127478 ) ) ( not ( = ?auto_127474 ?auto_127479 ) ) ( ON ?auto_127476 ?auto_127475 ) ( ON ?auto_127477 ?auto_127476 ) ( ON ?auto_127474 ?auto_127477 ) ( not ( = ?auto_127475 ?auto_127476 ) ) ( not ( = ?auto_127475 ?auto_127477 ) ) ( not ( = ?auto_127475 ?auto_127474 ) ) ( not ( = ?auto_127475 ?auto_127478 ) ) ( not ( = ?auto_127475 ?auto_127479 ) ) ( not ( = ?auto_127476 ?auto_127477 ) ) ( not ( = ?auto_127476 ?auto_127474 ) ) ( not ( = ?auto_127476 ?auto_127478 ) ) ( not ( = ?auto_127476 ?auto_127479 ) ) ( not ( = ?auto_127477 ?auto_127474 ) ) ( not ( = ?auto_127477 ?auto_127478 ) ) ( not ( = ?auto_127477 ?auto_127479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127474 ?auto_127478 ?auto_127479 )
      ( MAKE-5CRATE-VERIFY ?auto_127475 ?auto_127476 ?auto_127477 ?auto_127474 ?auto_127478 ?auto_127479 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127515 - SURFACE
      ?auto_127516 - SURFACE
      ?auto_127517 - SURFACE
      ?auto_127514 - SURFACE
      ?auto_127518 - SURFACE
      ?auto_127519 - SURFACE
    )
    :vars
    (
      ?auto_127522 - HOIST
      ?auto_127520 - PLACE
      ?auto_127521 - TRUCK
      ?auto_127523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127522 ?auto_127520 ) ( SURFACE-AT ?auto_127518 ?auto_127520 ) ( CLEAR ?auto_127518 ) ( IS-CRATE ?auto_127519 ) ( not ( = ?auto_127518 ?auto_127519 ) ) ( AVAILABLE ?auto_127522 ) ( IN ?auto_127519 ?auto_127521 ) ( ON ?auto_127518 ?auto_127514 ) ( not ( = ?auto_127514 ?auto_127518 ) ) ( not ( = ?auto_127514 ?auto_127519 ) ) ( TRUCK-AT ?auto_127521 ?auto_127523 ) ( not ( = ?auto_127523 ?auto_127520 ) ) ( ON ?auto_127516 ?auto_127515 ) ( ON ?auto_127517 ?auto_127516 ) ( ON ?auto_127514 ?auto_127517 ) ( not ( = ?auto_127515 ?auto_127516 ) ) ( not ( = ?auto_127515 ?auto_127517 ) ) ( not ( = ?auto_127515 ?auto_127514 ) ) ( not ( = ?auto_127515 ?auto_127518 ) ) ( not ( = ?auto_127515 ?auto_127519 ) ) ( not ( = ?auto_127516 ?auto_127517 ) ) ( not ( = ?auto_127516 ?auto_127514 ) ) ( not ( = ?auto_127516 ?auto_127518 ) ) ( not ( = ?auto_127516 ?auto_127519 ) ) ( not ( = ?auto_127517 ?auto_127514 ) ) ( not ( = ?auto_127517 ?auto_127518 ) ) ( not ( = ?auto_127517 ?auto_127519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127514 ?auto_127518 ?auto_127519 )
      ( MAKE-5CRATE-VERIFY ?auto_127515 ?auto_127516 ?auto_127517 ?auto_127514 ?auto_127518 ?auto_127519 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127560 - SURFACE
      ?auto_127561 - SURFACE
      ?auto_127562 - SURFACE
      ?auto_127559 - SURFACE
      ?auto_127563 - SURFACE
      ?auto_127564 - SURFACE
    )
    :vars
    (
      ?auto_127569 - HOIST
      ?auto_127566 - PLACE
      ?auto_127567 - TRUCK
      ?auto_127565 - PLACE
      ?auto_127568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_127569 ?auto_127566 ) ( SURFACE-AT ?auto_127563 ?auto_127566 ) ( CLEAR ?auto_127563 ) ( IS-CRATE ?auto_127564 ) ( not ( = ?auto_127563 ?auto_127564 ) ) ( AVAILABLE ?auto_127569 ) ( ON ?auto_127563 ?auto_127559 ) ( not ( = ?auto_127559 ?auto_127563 ) ) ( not ( = ?auto_127559 ?auto_127564 ) ) ( TRUCK-AT ?auto_127567 ?auto_127565 ) ( not ( = ?auto_127565 ?auto_127566 ) ) ( HOIST-AT ?auto_127568 ?auto_127565 ) ( LIFTING ?auto_127568 ?auto_127564 ) ( not ( = ?auto_127569 ?auto_127568 ) ) ( ON ?auto_127561 ?auto_127560 ) ( ON ?auto_127562 ?auto_127561 ) ( ON ?auto_127559 ?auto_127562 ) ( not ( = ?auto_127560 ?auto_127561 ) ) ( not ( = ?auto_127560 ?auto_127562 ) ) ( not ( = ?auto_127560 ?auto_127559 ) ) ( not ( = ?auto_127560 ?auto_127563 ) ) ( not ( = ?auto_127560 ?auto_127564 ) ) ( not ( = ?auto_127561 ?auto_127562 ) ) ( not ( = ?auto_127561 ?auto_127559 ) ) ( not ( = ?auto_127561 ?auto_127563 ) ) ( not ( = ?auto_127561 ?auto_127564 ) ) ( not ( = ?auto_127562 ?auto_127559 ) ) ( not ( = ?auto_127562 ?auto_127563 ) ) ( not ( = ?auto_127562 ?auto_127564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127559 ?auto_127563 ?auto_127564 )
      ( MAKE-5CRATE-VERIFY ?auto_127560 ?auto_127561 ?auto_127562 ?auto_127559 ?auto_127563 ?auto_127564 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127610 - SURFACE
      ?auto_127611 - SURFACE
      ?auto_127612 - SURFACE
      ?auto_127609 - SURFACE
      ?auto_127613 - SURFACE
      ?auto_127614 - SURFACE
    )
    :vars
    (
      ?auto_127616 - HOIST
      ?auto_127620 - PLACE
      ?auto_127619 - TRUCK
      ?auto_127618 - PLACE
      ?auto_127617 - HOIST
      ?auto_127615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127616 ?auto_127620 ) ( SURFACE-AT ?auto_127613 ?auto_127620 ) ( CLEAR ?auto_127613 ) ( IS-CRATE ?auto_127614 ) ( not ( = ?auto_127613 ?auto_127614 ) ) ( AVAILABLE ?auto_127616 ) ( ON ?auto_127613 ?auto_127609 ) ( not ( = ?auto_127609 ?auto_127613 ) ) ( not ( = ?auto_127609 ?auto_127614 ) ) ( TRUCK-AT ?auto_127619 ?auto_127618 ) ( not ( = ?auto_127618 ?auto_127620 ) ) ( HOIST-AT ?auto_127617 ?auto_127618 ) ( not ( = ?auto_127616 ?auto_127617 ) ) ( AVAILABLE ?auto_127617 ) ( SURFACE-AT ?auto_127614 ?auto_127618 ) ( ON ?auto_127614 ?auto_127615 ) ( CLEAR ?auto_127614 ) ( not ( = ?auto_127613 ?auto_127615 ) ) ( not ( = ?auto_127614 ?auto_127615 ) ) ( not ( = ?auto_127609 ?auto_127615 ) ) ( ON ?auto_127611 ?auto_127610 ) ( ON ?auto_127612 ?auto_127611 ) ( ON ?auto_127609 ?auto_127612 ) ( not ( = ?auto_127610 ?auto_127611 ) ) ( not ( = ?auto_127610 ?auto_127612 ) ) ( not ( = ?auto_127610 ?auto_127609 ) ) ( not ( = ?auto_127610 ?auto_127613 ) ) ( not ( = ?auto_127610 ?auto_127614 ) ) ( not ( = ?auto_127610 ?auto_127615 ) ) ( not ( = ?auto_127611 ?auto_127612 ) ) ( not ( = ?auto_127611 ?auto_127609 ) ) ( not ( = ?auto_127611 ?auto_127613 ) ) ( not ( = ?auto_127611 ?auto_127614 ) ) ( not ( = ?auto_127611 ?auto_127615 ) ) ( not ( = ?auto_127612 ?auto_127609 ) ) ( not ( = ?auto_127612 ?auto_127613 ) ) ( not ( = ?auto_127612 ?auto_127614 ) ) ( not ( = ?auto_127612 ?auto_127615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127609 ?auto_127613 ?auto_127614 )
      ( MAKE-5CRATE-VERIFY ?auto_127610 ?auto_127611 ?auto_127612 ?auto_127609 ?auto_127613 ?auto_127614 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127661 - SURFACE
      ?auto_127662 - SURFACE
      ?auto_127663 - SURFACE
      ?auto_127660 - SURFACE
      ?auto_127664 - SURFACE
      ?auto_127665 - SURFACE
    )
    :vars
    (
      ?auto_127668 - HOIST
      ?auto_127666 - PLACE
      ?auto_127670 - PLACE
      ?auto_127669 - HOIST
      ?auto_127667 - SURFACE
      ?auto_127671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127668 ?auto_127666 ) ( SURFACE-AT ?auto_127664 ?auto_127666 ) ( CLEAR ?auto_127664 ) ( IS-CRATE ?auto_127665 ) ( not ( = ?auto_127664 ?auto_127665 ) ) ( AVAILABLE ?auto_127668 ) ( ON ?auto_127664 ?auto_127660 ) ( not ( = ?auto_127660 ?auto_127664 ) ) ( not ( = ?auto_127660 ?auto_127665 ) ) ( not ( = ?auto_127670 ?auto_127666 ) ) ( HOIST-AT ?auto_127669 ?auto_127670 ) ( not ( = ?auto_127668 ?auto_127669 ) ) ( AVAILABLE ?auto_127669 ) ( SURFACE-AT ?auto_127665 ?auto_127670 ) ( ON ?auto_127665 ?auto_127667 ) ( CLEAR ?auto_127665 ) ( not ( = ?auto_127664 ?auto_127667 ) ) ( not ( = ?auto_127665 ?auto_127667 ) ) ( not ( = ?auto_127660 ?auto_127667 ) ) ( TRUCK-AT ?auto_127671 ?auto_127666 ) ( ON ?auto_127662 ?auto_127661 ) ( ON ?auto_127663 ?auto_127662 ) ( ON ?auto_127660 ?auto_127663 ) ( not ( = ?auto_127661 ?auto_127662 ) ) ( not ( = ?auto_127661 ?auto_127663 ) ) ( not ( = ?auto_127661 ?auto_127660 ) ) ( not ( = ?auto_127661 ?auto_127664 ) ) ( not ( = ?auto_127661 ?auto_127665 ) ) ( not ( = ?auto_127661 ?auto_127667 ) ) ( not ( = ?auto_127662 ?auto_127663 ) ) ( not ( = ?auto_127662 ?auto_127660 ) ) ( not ( = ?auto_127662 ?auto_127664 ) ) ( not ( = ?auto_127662 ?auto_127665 ) ) ( not ( = ?auto_127662 ?auto_127667 ) ) ( not ( = ?auto_127663 ?auto_127660 ) ) ( not ( = ?auto_127663 ?auto_127664 ) ) ( not ( = ?auto_127663 ?auto_127665 ) ) ( not ( = ?auto_127663 ?auto_127667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127660 ?auto_127664 ?auto_127665 )
      ( MAKE-5CRATE-VERIFY ?auto_127661 ?auto_127662 ?auto_127663 ?auto_127660 ?auto_127664 ?auto_127665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127712 - SURFACE
      ?auto_127713 - SURFACE
      ?auto_127714 - SURFACE
      ?auto_127711 - SURFACE
      ?auto_127715 - SURFACE
      ?auto_127716 - SURFACE
    )
    :vars
    (
      ?auto_127722 - HOIST
      ?auto_127720 - PLACE
      ?auto_127721 - PLACE
      ?auto_127717 - HOIST
      ?auto_127718 - SURFACE
      ?auto_127719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127722 ?auto_127720 ) ( IS-CRATE ?auto_127716 ) ( not ( = ?auto_127715 ?auto_127716 ) ) ( not ( = ?auto_127711 ?auto_127715 ) ) ( not ( = ?auto_127711 ?auto_127716 ) ) ( not ( = ?auto_127721 ?auto_127720 ) ) ( HOIST-AT ?auto_127717 ?auto_127721 ) ( not ( = ?auto_127722 ?auto_127717 ) ) ( AVAILABLE ?auto_127717 ) ( SURFACE-AT ?auto_127716 ?auto_127721 ) ( ON ?auto_127716 ?auto_127718 ) ( CLEAR ?auto_127716 ) ( not ( = ?auto_127715 ?auto_127718 ) ) ( not ( = ?auto_127716 ?auto_127718 ) ) ( not ( = ?auto_127711 ?auto_127718 ) ) ( TRUCK-AT ?auto_127719 ?auto_127720 ) ( SURFACE-AT ?auto_127711 ?auto_127720 ) ( CLEAR ?auto_127711 ) ( LIFTING ?auto_127722 ?auto_127715 ) ( IS-CRATE ?auto_127715 ) ( ON ?auto_127713 ?auto_127712 ) ( ON ?auto_127714 ?auto_127713 ) ( ON ?auto_127711 ?auto_127714 ) ( not ( = ?auto_127712 ?auto_127713 ) ) ( not ( = ?auto_127712 ?auto_127714 ) ) ( not ( = ?auto_127712 ?auto_127711 ) ) ( not ( = ?auto_127712 ?auto_127715 ) ) ( not ( = ?auto_127712 ?auto_127716 ) ) ( not ( = ?auto_127712 ?auto_127718 ) ) ( not ( = ?auto_127713 ?auto_127714 ) ) ( not ( = ?auto_127713 ?auto_127711 ) ) ( not ( = ?auto_127713 ?auto_127715 ) ) ( not ( = ?auto_127713 ?auto_127716 ) ) ( not ( = ?auto_127713 ?auto_127718 ) ) ( not ( = ?auto_127714 ?auto_127711 ) ) ( not ( = ?auto_127714 ?auto_127715 ) ) ( not ( = ?auto_127714 ?auto_127716 ) ) ( not ( = ?auto_127714 ?auto_127718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127711 ?auto_127715 ?auto_127716 )
      ( MAKE-5CRATE-VERIFY ?auto_127712 ?auto_127713 ?auto_127714 ?auto_127711 ?auto_127715 ?auto_127716 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127763 - SURFACE
      ?auto_127764 - SURFACE
      ?auto_127765 - SURFACE
      ?auto_127762 - SURFACE
      ?auto_127766 - SURFACE
      ?auto_127767 - SURFACE
    )
    :vars
    (
      ?auto_127770 - HOIST
      ?auto_127769 - PLACE
      ?auto_127768 - PLACE
      ?auto_127771 - HOIST
      ?auto_127772 - SURFACE
      ?auto_127773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127770 ?auto_127769 ) ( IS-CRATE ?auto_127767 ) ( not ( = ?auto_127766 ?auto_127767 ) ) ( not ( = ?auto_127762 ?auto_127766 ) ) ( not ( = ?auto_127762 ?auto_127767 ) ) ( not ( = ?auto_127768 ?auto_127769 ) ) ( HOIST-AT ?auto_127771 ?auto_127768 ) ( not ( = ?auto_127770 ?auto_127771 ) ) ( AVAILABLE ?auto_127771 ) ( SURFACE-AT ?auto_127767 ?auto_127768 ) ( ON ?auto_127767 ?auto_127772 ) ( CLEAR ?auto_127767 ) ( not ( = ?auto_127766 ?auto_127772 ) ) ( not ( = ?auto_127767 ?auto_127772 ) ) ( not ( = ?auto_127762 ?auto_127772 ) ) ( TRUCK-AT ?auto_127773 ?auto_127769 ) ( SURFACE-AT ?auto_127762 ?auto_127769 ) ( CLEAR ?auto_127762 ) ( IS-CRATE ?auto_127766 ) ( AVAILABLE ?auto_127770 ) ( IN ?auto_127766 ?auto_127773 ) ( ON ?auto_127764 ?auto_127763 ) ( ON ?auto_127765 ?auto_127764 ) ( ON ?auto_127762 ?auto_127765 ) ( not ( = ?auto_127763 ?auto_127764 ) ) ( not ( = ?auto_127763 ?auto_127765 ) ) ( not ( = ?auto_127763 ?auto_127762 ) ) ( not ( = ?auto_127763 ?auto_127766 ) ) ( not ( = ?auto_127763 ?auto_127767 ) ) ( not ( = ?auto_127763 ?auto_127772 ) ) ( not ( = ?auto_127764 ?auto_127765 ) ) ( not ( = ?auto_127764 ?auto_127762 ) ) ( not ( = ?auto_127764 ?auto_127766 ) ) ( not ( = ?auto_127764 ?auto_127767 ) ) ( not ( = ?auto_127764 ?auto_127772 ) ) ( not ( = ?auto_127765 ?auto_127762 ) ) ( not ( = ?auto_127765 ?auto_127766 ) ) ( not ( = ?auto_127765 ?auto_127767 ) ) ( not ( = ?auto_127765 ?auto_127772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127762 ?auto_127766 ?auto_127767 )
      ( MAKE-5CRATE-VERIFY ?auto_127763 ?auto_127764 ?auto_127765 ?auto_127762 ?auto_127766 ?auto_127767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_128442 - SURFACE
      ?auto_128443 - SURFACE
    )
    :vars
    (
      ?auto_128446 - HOIST
      ?auto_128450 - PLACE
      ?auto_128444 - SURFACE
      ?auto_128445 - PLACE
      ?auto_128449 - HOIST
      ?auto_128448 - SURFACE
      ?auto_128447 - TRUCK
      ?auto_128451 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_128446 ?auto_128450 ) ( SURFACE-AT ?auto_128442 ?auto_128450 ) ( CLEAR ?auto_128442 ) ( IS-CRATE ?auto_128443 ) ( not ( = ?auto_128442 ?auto_128443 ) ) ( ON ?auto_128442 ?auto_128444 ) ( not ( = ?auto_128444 ?auto_128442 ) ) ( not ( = ?auto_128444 ?auto_128443 ) ) ( not ( = ?auto_128445 ?auto_128450 ) ) ( HOIST-AT ?auto_128449 ?auto_128445 ) ( not ( = ?auto_128446 ?auto_128449 ) ) ( AVAILABLE ?auto_128449 ) ( SURFACE-AT ?auto_128443 ?auto_128445 ) ( ON ?auto_128443 ?auto_128448 ) ( CLEAR ?auto_128443 ) ( not ( = ?auto_128442 ?auto_128448 ) ) ( not ( = ?auto_128443 ?auto_128448 ) ) ( not ( = ?auto_128444 ?auto_128448 ) ) ( TRUCK-AT ?auto_128447 ?auto_128450 ) ( LIFTING ?auto_128446 ?auto_128451 ) ( IS-CRATE ?auto_128451 ) ( not ( = ?auto_128442 ?auto_128451 ) ) ( not ( = ?auto_128443 ?auto_128451 ) ) ( not ( = ?auto_128444 ?auto_128451 ) ) ( not ( = ?auto_128448 ?auto_128451 ) ) )
    :subtasks
    ( ( !LOAD ?auto_128446 ?auto_128451 ?auto_128447 ?auto_128450 )
      ( MAKE-1CRATE ?auto_128442 ?auto_128443 )
      ( MAKE-1CRATE-VERIFY ?auto_128442 ?auto_128443 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_128969 - SURFACE
      ?auto_128970 - SURFACE
      ?auto_128971 - SURFACE
      ?auto_128968 - SURFACE
      ?auto_128972 - SURFACE
      ?auto_128974 - SURFACE
      ?auto_128973 - SURFACE
    )
    :vars
    (
      ?auto_128976 - HOIST
      ?auto_128975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_128976 ?auto_128975 ) ( SURFACE-AT ?auto_128974 ?auto_128975 ) ( CLEAR ?auto_128974 ) ( LIFTING ?auto_128976 ?auto_128973 ) ( IS-CRATE ?auto_128973 ) ( not ( = ?auto_128974 ?auto_128973 ) ) ( ON ?auto_128970 ?auto_128969 ) ( ON ?auto_128971 ?auto_128970 ) ( ON ?auto_128968 ?auto_128971 ) ( ON ?auto_128972 ?auto_128968 ) ( ON ?auto_128974 ?auto_128972 ) ( not ( = ?auto_128969 ?auto_128970 ) ) ( not ( = ?auto_128969 ?auto_128971 ) ) ( not ( = ?auto_128969 ?auto_128968 ) ) ( not ( = ?auto_128969 ?auto_128972 ) ) ( not ( = ?auto_128969 ?auto_128974 ) ) ( not ( = ?auto_128969 ?auto_128973 ) ) ( not ( = ?auto_128970 ?auto_128971 ) ) ( not ( = ?auto_128970 ?auto_128968 ) ) ( not ( = ?auto_128970 ?auto_128972 ) ) ( not ( = ?auto_128970 ?auto_128974 ) ) ( not ( = ?auto_128970 ?auto_128973 ) ) ( not ( = ?auto_128971 ?auto_128968 ) ) ( not ( = ?auto_128971 ?auto_128972 ) ) ( not ( = ?auto_128971 ?auto_128974 ) ) ( not ( = ?auto_128971 ?auto_128973 ) ) ( not ( = ?auto_128968 ?auto_128972 ) ) ( not ( = ?auto_128968 ?auto_128974 ) ) ( not ( = ?auto_128968 ?auto_128973 ) ) ( not ( = ?auto_128972 ?auto_128974 ) ) ( not ( = ?auto_128972 ?auto_128973 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_128974 ?auto_128973 )
      ( MAKE-6CRATE-VERIFY ?auto_128969 ?auto_128970 ?auto_128971 ?auto_128968 ?auto_128972 ?auto_128974 ?auto_128973 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129013 - SURFACE
      ?auto_129014 - SURFACE
      ?auto_129015 - SURFACE
      ?auto_129012 - SURFACE
      ?auto_129016 - SURFACE
      ?auto_129018 - SURFACE
      ?auto_129017 - SURFACE
    )
    :vars
    (
      ?auto_129021 - HOIST
      ?auto_129020 - PLACE
      ?auto_129019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129021 ?auto_129020 ) ( SURFACE-AT ?auto_129018 ?auto_129020 ) ( CLEAR ?auto_129018 ) ( IS-CRATE ?auto_129017 ) ( not ( = ?auto_129018 ?auto_129017 ) ) ( TRUCK-AT ?auto_129019 ?auto_129020 ) ( AVAILABLE ?auto_129021 ) ( IN ?auto_129017 ?auto_129019 ) ( ON ?auto_129018 ?auto_129016 ) ( not ( = ?auto_129016 ?auto_129018 ) ) ( not ( = ?auto_129016 ?auto_129017 ) ) ( ON ?auto_129014 ?auto_129013 ) ( ON ?auto_129015 ?auto_129014 ) ( ON ?auto_129012 ?auto_129015 ) ( ON ?auto_129016 ?auto_129012 ) ( not ( = ?auto_129013 ?auto_129014 ) ) ( not ( = ?auto_129013 ?auto_129015 ) ) ( not ( = ?auto_129013 ?auto_129012 ) ) ( not ( = ?auto_129013 ?auto_129016 ) ) ( not ( = ?auto_129013 ?auto_129018 ) ) ( not ( = ?auto_129013 ?auto_129017 ) ) ( not ( = ?auto_129014 ?auto_129015 ) ) ( not ( = ?auto_129014 ?auto_129012 ) ) ( not ( = ?auto_129014 ?auto_129016 ) ) ( not ( = ?auto_129014 ?auto_129018 ) ) ( not ( = ?auto_129014 ?auto_129017 ) ) ( not ( = ?auto_129015 ?auto_129012 ) ) ( not ( = ?auto_129015 ?auto_129016 ) ) ( not ( = ?auto_129015 ?auto_129018 ) ) ( not ( = ?auto_129015 ?auto_129017 ) ) ( not ( = ?auto_129012 ?auto_129016 ) ) ( not ( = ?auto_129012 ?auto_129018 ) ) ( not ( = ?auto_129012 ?auto_129017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129016 ?auto_129018 ?auto_129017 )
      ( MAKE-6CRATE-VERIFY ?auto_129013 ?auto_129014 ?auto_129015 ?auto_129012 ?auto_129016 ?auto_129018 ?auto_129017 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129064 - SURFACE
      ?auto_129065 - SURFACE
      ?auto_129066 - SURFACE
      ?auto_129063 - SURFACE
      ?auto_129067 - SURFACE
      ?auto_129069 - SURFACE
      ?auto_129068 - SURFACE
    )
    :vars
    (
      ?auto_129072 - HOIST
      ?auto_129071 - PLACE
      ?auto_129070 - TRUCK
      ?auto_129073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129072 ?auto_129071 ) ( SURFACE-AT ?auto_129069 ?auto_129071 ) ( CLEAR ?auto_129069 ) ( IS-CRATE ?auto_129068 ) ( not ( = ?auto_129069 ?auto_129068 ) ) ( AVAILABLE ?auto_129072 ) ( IN ?auto_129068 ?auto_129070 ) ( ON ?auto_129069 ?auto_129067 ) ( not ( = ?auto_129067 ?auto_129069 ) ) ( not ( = ?auto_129067 ?auto_129068 ) ) ( TRUCK-AT ?auto_129070 ?auto_129073 ) ( not ( = ?auto_129073 ?auto_129071 ) ) ( ON ?auto_129065 ?auto_129064 ) ( ON ?auto_129066 ?auto_129065 ) ( ON ?auto_129063 ?auto_129066 ) ( ON ?auto_129067 ?auto_129063 ) ( not ( = ?auto_129064 ?auto_129065 ) ) ( not ( = ?auto_129064 ?auto_129066 ) ) ( not ( = ?auto_129064 ?auto_129063 ) ) ( not ( = ?auto_129064 ?auto_129067 ) ) ( not ( = ?auto_129064 ?auto_129069 ) ) ( not ( = ?auto_129064 ?auto_129068 ) ) ( not ( = ?auto_129065 ?auto_129066 ) ) ( not ( = ?auto_129065 ?auto_129063 ) ) ( not ( = ?auto_129065 ?auto_129067 ) ) ( not ( = ?auto_129065 ?auto_129069 ) ) ( not ( = ?auto_129065 ?auto_129068 ) ) ( not ( = ?auto_129066 ?auto_129063 ) ) ( not ( = ?auto_129066 ?auto_129067 ) ) ( not ( = ?auto_129066 ?auto_129069 ) ) ( not ( = ?auto_129066 ?auto_129068 ) ) ( not ( = ?auto_129063 ?auto_129067 ) ) ( not ( = ?auto_129063 ?auto_129069 ) ) ( not ( = ?auto_129063 ?auto_129068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129067 ?auto_129069 ?auto_129068 )
      ( MAKE-6CRATE-VERIFY ?auto_129064 ?auto_129065 ?auto_129066 ?auto_129063 ?auto_129067 ?auto_129069 ?auto_129068 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129121 - SURFACE
      ?auto_129122 - SURFACE
      ?auto_129123 - SURFACE
      ?auto_129120 - SURFACE
      ?auto_129124 - SURFACE
      ?auto_129126 - SURFACE
      ?auto_129125 - SURFACE
    )
    :vars
    (
      ?auto_129131 - HOIST
      ?auto_129127 - PLACE
      ?auto_129130 - TRUCK
      ?auto_129129 - PLACE
      ?auto_129128 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_129131 ?auto_129127 ) ( SURFACE-AT ?auto_129126 ?auto_129127 ) ( CLEAR ?auto_129126 ) ( IS-CRATE ?auto_129125 ) ( not ( = ?auto_129126 ?auto_129125 ) ) ( AVAILABLE ?auto_129131 ) ( ON ?auto_129126 ?auto_129124 ) ( not ( = ?auto_129124 ?auto_129126 ) ) ( not ( = ?auto_129124 ?auto_129125 ) ) ( TRUCK-AT ?auto_129130 ?auto_129129 ) ( not ( = ?auto_129129 ?auto_129127 ) ) ( HOIST-AT ?auto_129128 ?auto_129129 ) ( LIFTING ?auto_129128 ?auto_129125 ) ( not ( = ?auto_129131 ?auto_129128 ) ) ( ON ?auto_129122 ?auto_129121 ) ( ON ?auto_129123 ?auto_129122 ) ( ON ?auto_129120 ?auto_129123 ) ( ON ?auto_129124 ?auto_129120 ) ( not ( = ?auto_129121 ?auto_129122 ) ) ( not ( = ?auto_129121 ?auto_129123 ) ) ( not ( = ?auto_129121 ?auto_129120 ) ) ( not ( = ?auto_129121 ?auto_129124 ) ) ( not ( = ?auto_129121 ?auto_129126 ) ) ( not ( = ?auto_129121 ?auto_129125 ) ) ( not ( = ?auto_129122 ?auto_129123 ) ) ( not ( = ?auto_129122 ?auto_129120 ) ) ( not ( = ?auto_129122 ?auto_129124 ) ) ( not ( = ?auto_129122 ?auto_129126 ) ) ( not ( = ?auto_129122 ?auto_129125 ) ) ( not ( = ?auto_129123 ?auto_129120 ) ) ( not ( = ?auto_129123 ?auto_129124 ) ) ( not ( = ?auto_129123 ?auto_129126 ) ) ( not ( = ?auto_129123 ?auto_129125 ) ) ( not ( = ?auto_129120 ?auto_129124 ) ) ( not ( = ?auto_129120 ?auto_129126 ) ) ( not ( = ?auto_129120 ?auto_129125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129124 ?auto_129126 ?auto_129125 )
      ( MAKE-6CRATE-VERIFY ?auto_129121 ?auto_129122 ?auto_129123 ?auto_129120 ?auto_129124 ?auto_129126 ?auto_129125 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129184 - SURFACE
      ?auto_129185 - SURFACE
      ?auto_129186 - SURFACE
      ?auto_129183 - SURFACE
      ?auto_129187 - SURFACE
      ?auto_129189 - SURFACE
      ?auto_129188 - SURFACE
    )
    :vars
    (
      ?auto_129193 - HOIST
      ?auto_129194 - PLACE
      ?auto_129190 - TRUCK
      ?auto_129192 - PLACE
      ?auto_129191 - HOIST
      ?auto_129195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129193 ?auto_129194 ) ( SURFACE-AT ?auto_129189 ?auto_129194 ) ( CLEAR ?auto_129189 ) ( IS-CRATE ?auto_129188 ) ( not ( = ?auto_129189 ?auto_129188 ) ) ( AVAILABLE ?auto_129193 ) ( ON ?auto_129189 ?auto_129187 ) ( not ( = ?auto_129187 ?auto_129189 ) ) ( not ( = ?auto_129187 ?auto_129188 ) ) ( TRUCK-AT ?auto_129190 ?auto_129192 ) ( not ( = ?auto_129192 ?auto_129194 ) ) ( HOIST-AT ?auto_129191 ?auto_129192 ) ( not ( = ?auto_129193 ?auto_129191 ) ) ( AVAILABLE ?auto_129191 ) ( SURFACE-AT ?auto_129188 ?auto_129192 ) ( ON ?auto_129188 ?auto_129195 ) ( CLEAR ?auto_129188 ) ( not ( = ?auto_129189 ?auto_129195 ) ) ( not ( = ?auto_129188 ?auto_129195 ) ) ( not ( = ?auto_129187 ?auto_129195 ) ) ( ON ?auto_129185 ?auto_129184 ) ( ON ?auto_129186 ?auto_129185 ) ( ON ?auto_129183 ?auto_129186 ) ( ON ?auto_129187 ?auto_129183 ) ( not ( = ?auto_129184 ?auto_129185 ) ) ( not ( = ?auto_129184 ?auto_129186 ) ) ( not ( = ?auto_129184 ?auto_129183 ) ) ( not ( = ?auto_129184 ?auto_129187 ) ) ( not ( = ?auto_129184 ?auto_129189 ) ) ( not ( = ?auto_129184 ?auto_129188 ) ) ( not ( = ?auto_129184 ?auto_129195 ) ) ( not ( = ?auto_129185 ?auto_129186 ) ) ( not ( = ?auto_129185 ?auto_129183 ) ) ( not ( = ?auto_129185 ?auto_129187 ) ) ( not ( = ?auto_129185 ?auto_129189 ) ) ( not ( = ?auto_129185 ?auto_129188 ) ) ( not ( = ?auto_129185 ?auto_129195 ) ) ( not ( = ?auto_129186 ?auto_129183 ) ) ( not ( = ?auto_129186 ?auto_129187 ) ) ( not ( = ?auto_129186 ?auto_129189 ) ) ( not ( = ?auto_129186 ?auto_129188 ) ) ( not ( = ?auto_129186 ?auto_129195 ) ) ( not ( = ?auto_129183 ?auto_129187 ) ) ( not ( = ?auto_129183 ?auto_129189 ) ) ( not ( = ?auto_129183 ?auto_129188 ) ) ( not ( = ?auto_129183 ?auto_129195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129187 ?auto_129189 ?auto_129188 )
      ( MAKE-6CRATE-VERIFY ?auto_129184 ?auto_129185 ?auto_129186 ?auto_129183 ?auto_129187 ?auto_129189 ?auto_129188 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129248 - SURFACE
      ?auto_129249 - SURFACE
      ?auto_129250 - SURFACE
      ?auto_129247 - SURFACE
      ?auto_129251 - SURFACE
      ?auto_129253 - SURFACE
      ?auto_129252 - SURFACE
    )
    :vars
    (
      ?auto_129258 - HOIST
      ?auto_129254 - PLACE
      ?auto_129259 - PLACE
      ?auto_129257 - HOIST
      ?auto_129256 - SURFACE
      ?auto_129255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129258 ?auto_129254 ) ( SURFACE-AT ?auto_129253 ?auto_129254 ) ( CLEAR ?auto_129253 ) ( IS-CRATE ?auto_129252 ) ( not ( = ?auto_129253 ?auto_129252 ) ) ( AVAILABLE ?auto_129258 ) ( ON ?auto_129253 ?auto_129251 ) ( not ( = ?auto_129251 ?auto_129253 ) ) ( not ( = ?auto_129251 ?auto_129252 ) ) ( not ( = ?auto_129259 ?auto_129254 ) ) ( HOIST-AT ?auto_129257 ?auto_129259 ) ( not ( = ?auto_129258 ?auto_129257 ) ) ( AVAILABLE ?auto_129257 ) ( SURFACE-AT ?auto_129252 ?auto_129259 ) ( ON ?auto_129252 ?auto_129256 ) ( CLEAR ?auto_129252 ) ( not ( = ?auto_129253 ?auto_129256 ) ) ( not ( = ?auto_129252 ?auto_129256 ) ) ( not ( = ?auto_129251 ?auto_129256 ) ) ( TRUCK-AT ?auto_129255 ?auto_129254 ) ( ON ?auto_129249 ?auto_129248 ) ( ON ?auto_129250 ?auto_129249 ) ( ON ?auto_129247 ?auto_129250 ) ( ON ?auto_129251 ?auto_129247 ) ( not ( = ?auto_129248 ?auto_129249 ) ) ( not ( = ?auto_129248 ?auto_129250 ) ) ( not ( = ?auto_129248 ?auto_129247 ) ) ( not ( = ?auto_129248 ?auto_129251 ) ) ( not ( = ?auto_129248 ?auto_129253 ) ) ( not ( = ?auto_129248 ?auto_129252 ) ) ( not ( = ?auto_129248 ?auto_129256 ) ) ( not ( = ?auto_129249 ?auto_129250 ) ) ( not ( = ?auto_129249 ?auto_129247 ) ) ( not ( = ?auto_129249 ?auto_129251 ) ) ( not ( = ?auto_129249 ?auto_129253 ) ) ( not ( = ?auto_129249 ?auto_129252 ) ) ( not ( = ?auto_129249 ?auto_129256 ) ) ( not ( = ?auto_129250 ?auto_129247 ) ) ( not ( = ?auto_129250 ?auto_129251 ) ) ( not ( = ?auto_129250 ?auto_129253 ) ) ( not ( = ?auto_129250 ?auto_129252 ) ) ( not ( = ?auto_129250 ?auto_129256 ) ) ( not ( = ?auto_129247 ?auto_129251 ) ) ( not ( = ?auto_129247 ?auto_129253 ) ) ( not ( = ?auto_129247 ?auto_129252 ) ) ( not ( = ?auto_129247 ?auto_129256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129251 ?auto_129253 ?auto_129252 )
      ( MAKE-6CRATE-VERIFY ?auto_129248 ?auto_129249 ?auto_129250 ?auto_129247 ?auto_129251 ?auto_129253 ?auto_129252 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129312 - SURFACE
      ?auto_129313 - SURFACE
      ?auto_129314 - SURFACE
      ?auto_129311 - SURFACE
      ?auto_129315 - SURFACE
      ?auto_129317 - SURFACE
      ?auto_129316 - SURFACE
    )
    :vars
    (
      ?auto_129321 - HOIST
      ?auto_129322 - PLACE
      ?auto_129323 - PLACE
      ?auto_129318 - HOIST
      ?auto_129319 - SURFACE
      ?auto_129320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129321 ?auto_129322 ) ( IS-CRATE ?auto_129316 ) ( not ( = ?auto_129317 ?auto_129316 ) ) ( not ( = ?auto_129315 ?auto_129317 ) ) ( not ( = ?auto_129315 ?auto_129316 ) ) ( not ( = ?auto_129323 ?auto_129322 ) ) ( HOIST-AT ?auto_129318 ?auto_129323 ) ( not ( = ?auto_129321 ?auto_129318 ) ) ( AVAILABLE ?auto_129318 ) ( SURFACE-AT ?auto_129316 ?auto_129323 ) ( ON ?auto_129316 ?auto_129319 ) ( CLEAR ?auto_129316 ) ( not ( = ?auto_129317 ?auto_129319 ) ) ( not ( = ?auto_129316 ?auto_129319 ) ) ( not ( = ?auto_129315 ?auto_129319 ) ) ( TRUCK-AT ?auto_129320 ?auto_129322 ) ( SURFACE-AT ?auto_129315 ?auto_129322 ) ( CLEAR ?auto_129315 ) ( LIFTING ?auto_129321 ?auto_129317 ) ( IS-CRATE ?auto_129317 ) ( ON ?auto_129313 ?auto_129312 ) ( ON ?auto_129314 ?auto_129313 ) ( ON ?auto_129311 ?auto_129314 ) ( ON ?auto_129315 ?auto_129311 ) ( not ( = ?auto_129312 ?auto_129313 ) ) ( not ( = ?auto_129312 ?auto_129314 ) ) ( not ( = ?auto_129312 ?auto_129311 ) ) ( not ( = ?auto_129312 ?auto_129315 ) ) ( not ( = ?auto_129312 ?auto_129317 ) ) ( not ( = ?auto_129312 ?auto_129316 ) ) ( not ( = ?auto_129312 ?auto_129319 ) ) ( not ( = ?auto_129313 ?auto_129314 ) ) ( not ( = ?auto_129313 ?auto_129311 ) ) ( not ( = ?auto_129313 ?auto_129315 ) ) ( not ( = ?auto_129313 ?auto_129317 ) ) ( not ( = ?auto_129313 ?auto_129316 ) ) ( not ( = ?auto_129313 ?auto_129319 ) ) ( not ( = ?auto_129314 ?auto_129311 ) ) ( not ( = ?auto_129314 ?auto_129315 ) ) ( not ( = ?auto_129314 ?auto_129317 ) ) ( not ( = ?auto_129314 ?auto_129316 ) ) ( not ( = ?auto_129314 ?auto_129319 ) ) ( not ( = ?auto_129311 ?auto_129315 ) ) ( not ( = ?auto_129311 ?auto_129317 ) ) ( not ( = ?auto_129311 ?auto_129316 ) ) ( not ( = ?auto_129311 ?auto_129319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129315 ?auto_129317 ?auto_129316 )
      ( MAKE-6CRATE-VERIFY ?auto_129312 ?auto_129313 ?auto_129314 ?auto_129311 ?auto_129315 ?auto_129317 ?auto_129316 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129376 - SURFACE
      ?auto_129377 - SURFACE
      ?auto_129378 - SURFACE
      ?auto_129375 - SURFACE
      ?auto_129379 - SURFACE
      ?auto_129381 - SURFACE
      ?auto_129380 - SURFACE
    )
    :vars
    (
      ?auto_129385 - HOIST
      ?auto_129386 - PLACE
      ?auto_129382 - PLACE
      ?auto_129383 - HOIST
      ?auto_129384 - SURFACE
      ?auto_129387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129385 ?auto_129386 ) ( IS-CRATE ?auto_129380 ) ( not ( = ?auto_129381 ?auto_129380 ) ) ( not ( = ?auto_129379 ?auto_129381 ) ) ( not ( = ?auto_129379 ?auto_129380 ) ) ( not ( = ?auto_129382 ?auto_129386 ) ) ( HOIST-AT ?auto_129383 ?auto_129382 ) ( not ( = ?auto_129385 ?auto_129383 ) ) ( AVAILABLE ?auto_129383 ) ( SURFACE-AT ?auto_129380 ?auto_129382 ) ( ON ?auto_129380 ?auto_129384 ) ( CLEAR ?auto_129380 ) ( not ( = ?auto_129381 ?auto_129384 ) ) ( not ( = ?auto_129380 ?auto_129384 ) ) ( not ( = ?auto_129379 ?auto_129384 ) ) ( TRUCK-AT ?auto_129387 ?auto_129386 ) ( SURFACE-AT ?auto_129379 ?auto_129386 ) ( CLEAR ?auto_129379 ) ( IS-CRATE ?auto_129381 ) ( AVAILABLE ?auto_129385 ) ( IN ?auto_129381 ?auto_129387 ) ( ON ?auto_129377 ?auto_129376 ) ( ON ?auto_129378 ?auto_129377 ) ( ON ?auto_129375 ?auto_129378 ) ( ON ?auto_129379 ?auto_129375 ) ( not ( = ?auto_129376 ?auto_129377 ) ) ( not ( = ?auto_129376 ?auto_129378 ) ) ( not ( = ?auto_129376 ?auto_129375 ) ) ( not ( = ?auto_129376 ?auto_129379 ) ) ( not ( = ?auto_129376 ?auto_129381 ) ) ( not ( = ?auto_129376 ?auto_129380 ) ) ( not ( = ?auto_129376 ?auto_129384 ) ) ( not ( = ?auto_129377 ?auto_129378 ) ) ( not ( = ?auto_129377 ?auto_129375 ) ) ( not ( = ?auto_129377 ?auto_129379 ) ) ( not ( = ?auto_129377 ?auto_129381 ) ) ( not ( = ?auto_129377 ?auto_129380 ) ) ( not ( = ?auto_129377 ?auto_129384 ) ) ( not ( = ?auto_129378 ?auto_129375 ) ) ( not ( = ?auto_129378 ?auto_129379 ) ) ( not ( = ?auto_129378 ?auto_129381 ) ) ( not ( = ?auto_129378 ?auto_129380 ) ) ( not ( = ?auto_129378 ?auto_129384 ) ) ( not ( = ?auto_129375 ?auto_129379 ) ) ( not ( = ?auto_129375 ?auto_129381 ) ) ( not ( = ?auto_129375 ?auto_129380 ) ) ( not ( = ?auto_129375 ?auto_129384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129379 ?auto_129381 ?auto_129380 )
      ( MAKE-6CRATE-VERIFY ?auto_129376 ?auto_129377 ?auto_129378 ?auto_129375 ?auto_129379 ?auto_129381 ?auto_129380 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131332 - SURFACE
      ?auto_131333 - SURFACE
      ?auto_131334 - SURFACE
      ?auto_131331 - SURFACE
      ?auto_131335 - SURFACE
      ?auto_131337 - SURFACE
      ?auto_131336 - SURFACE
      ?auto_131338 - SURFACE
    )
    :vars
    (
      ?auto_131339 - HOIST
      ?auto_131340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131339 ?auto_131340 ) ( SURFACE-AT ?auto_131336 ?auto_131340 ) ( CLEAR ?auto_131336 ) ( LIFTING ?auto_131339 ?auto_131338 ) ( IS-CRATE ?auto_131338 ) ( not ( = ?auto_131336 ?auto_131338 ) ) ( ON ?auto_131333 ?auto_131332 ) ( ON ?auto_131334 ?auto_131333 ) ( ON ?auto_131331 ?auto_131334 ) ( ON ?auto_131335 ?auto_131331 ) ( ON ?auto_131337 ?auto_131335 ) ( ON ?auto_131336 ?auto_131337 ) ( not ( = ?auto_131332 ?auto_131333 ) ) ( not ( = ?auto_131332 ?auto_131334 ) ) ( not ( = ?auto_131332 ?auto_131331 ) ) ( not ( = ?auto_131332 ?auto_131335 ) ) ( not ( = ?auto_131332 ?auto_131337 ) ) ( not ( = ?auto_131332 ?auto_131336 ) ) ( not ( = ?auto_131332 ?auto_131338 ) ) ( not ( = ?auto_131333 ?auto_131334 ) ) ( not ( = ?auto_131333 ?auto_131331 ) ) ( not ( = ?auto_131333 ?auto_131335 ) ) ( not ( = ?auto_131333 ?auto_131337 ) ) ( not ( = ?auto_131333 ?auto_131336 ) ) ( not ( = ?auto_131333 ?auto_131338 ) ) ( not ( = ?auto_131334 ?auto_131331 ) ) ( not ( = ?auto_131334 ?auto_131335 ) ) ( not ( = ?auto_131334 ?auto_131337 ) ) ( not ( = ?auto_131334 ?auto_131336 ) ) ( not ( = ?auto_131334 ?auto_131338 ) ) ( not ( = ?auto_131331 ?auto_131335 ) ) ( not ( = ?auto_131331 ?auto_131337 ) ) ( not ( = ?auto_131331 ?auto_131336 ) ) ( not ( = ?auto_131331 ?auto_131338 ) ) ( not ( = ?auto_131335 ?auto_131337 ) ) ( not ( = ?auto_131335 ?auto_131336 ) ) ( not ( = ?auto_131335 ?auto_131338 ) ) ( not ( = ?auto_131337 ?auto_131336 ) ) ( not ( = ?auto_131337 ?auto_131338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_131336 ?auto_131338 )
      ( MAKE-7CRATE-VERIFY ?auto_131332 ?auto_131333 ?auto_131334 ?auto_131331 ?auto_131335 ?auto_131337 ?auto_131336 ?auto_131338 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131387 - SURFACE
      ?auto_131388 - SURFACE
      ?auto_131389 - SURFACE
      ?auto_131386 - SURFACE
      ?auto_131390 - SURFACE
      ?auto_131392 - SURFACE
      ?auto_131391 - SURFACE
      ?auto_131393 - SURFACE
    )
    :vars
    (
      ?auto_131395 - HOIST
      ?auto_131394 - PLACE
      ?auto_131396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131395 ?auto_131394 ) ( SURFACE-AT ?auto_131391 ?auto_131394 ) ( CLEAR ?auto_131391 ) ( IS-CRATE ?auto_131393 ) ( not ( = ?auto_131391 ?auto_131393 ) ) ( TRUCK-AT ?auto_131396 ?auto_131394 ) ( AVAILABLE ?auto_131395 ) ( IN ?auto_131393 ?auto_131396 ) ( ON ?auto_131391 ?auto_131392 ) ( not ( = ?auto_131392 ?auto_131391 ) ) ( not ( = ?auto_131392 ?auto_131393 ) ) ( ON ?auto_131388 ?auto_131387 ) ( ON ?auto_131389 ?auto_131388 ) ( ON ?auto_131386 ?auto_131389 ) ( ON ?auto_131390 ?auto_131386 ) ( ON ?auto_131392 ?auto_131390 ) ( not ( = ?auto_131387 ?auto_131388 ) ) ( not ( = ?auto_131387 ?auto_131389 ) ) ( not ( = ?auto_131387 ?auto_131386 ) ) ( not ( = ?auto_131387 ?auto_131390 ) ) ( not ( = ?auto_131387 ?auto_131392 ) ) ( not ( = ?auto_131387 ?auto_131391 ) ) ( not ( = ?auto_131387 ?auto_131393 ) ) ( not ( = ?auto_131388 ?auto_131389 ) ) ( not ( = ?auto_131388 ?auto_131386 ) ) ( not ( = ?auto_131388 ?auto_131390 ) ) ( not ( = ?auto_131388 ?auto_131392 ) ) ( not ( = ?auto_131388 ?auto_131391 ) ) ( not ( = ?auto_131388 ?auto_131393 ) ) ( not ( = ?auto_131389 ?auto_131386 ) ) ( not ( = ?auto_131389 ?auto_131390 ) ) ( not ( = ?auto_131389 ?auto_131392 ) ) ( not ( = ?auto_131389 ?auto_131391 ) ) ( not ( = ?auto_131389 ?auto_131393 ) ) ( not ( = ?auto_131386 ?auto_131390 ) ) ( not ( = ?auto_131386 ?auto_131392 ) ) ( not ( = ?auto_131386 ?auto_131391 ) ) ( not ( = ?auto_131386 ?auto_131393 ) ) ( not ( = ?auto_131390 ?auto_131392 ) ) ( not ( = ?auto_131390 ?auto_131391 ) ) ( not ( = ?auto_131390 ?auto_131393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131392 ?auto_131391 ?auto_131393 )
      ( MAKE-7CRATE-VERIFY ?auto_131387 ?auto_131388 ?auto_131389 ?auto_131386 ?auto_131390 ?auto_131392 ?auto_131391 ?auto_131393 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131450 - SURFACE
      ?auto_131451 - SURFACE
      ?auto_131452 - SURFACE
      ?auto_131449 - SURFACE
      ?auto_131453 - SURFACE
      ?auto_131455 - SURFACE
      ?auto_131454 - SURFACE
      ?auto_131456 - SURFACE
    )
    :vars
    (
      ?auto_131460 - HOIST
      ?auto_131457 - PLACE
      ?auto_131459 - TRUCK
      ?auto_131458 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131460 ?auto_131457 ) ( SURFACE-AT ?auto_131454 ?auto_131457 ) ( CLEAR ?auto_131454 ) ( IS-CRATE ?auto_131456 ) ( not ( = ?auto_131454 ?auto_131456 ) ) ( AVAILABLE ?auto_131460 ) ( IN ?auto_131456 ?auto_131459 ) ( ON ?auto_131454 ?auto_131455 ) ( not ( = ?auto_131455 ?auto_131454 ) ) ( not ( = ?auto_131455 ?auto_131456 ) ) ( TRUCK-AT ?auto_131459 ?auto_131458 ) ( not ( = ?auto_131458 ?auto_131457 ) ) ( ON ?auto_131451 ?auto_131450 ) ( ON ?auto_131452 ?auto_131451 ) ( ON ?auto_131449 ?auto_131452 ) ( ON ?auto_131453 ?auto_131449 ) ( ON ?auto_131455 ?auto_131453 ) ( not ( = ?auto_131450 ?auto_131451 ) ) ( not ( = ?auto_131450 ?auto_131452 ) ) ( not ( = ?auto_131450 ?auto_131449 ) ) ( not ( = ?auto_131450 ?auto_131453 ) ) ( not ( = ?auto_131450 ?auto_131455 ) ) ( not ( = ?auto_131450 ?auto_131454 ) ) ( not ( = ?auto_131450 ?auto_131456 ) ) ( not ( = ?auto_131451 ?auto_131452 ) ) ( not ( = ?auto_131451 ?auto_131449 ) ) ( not ( = ?auto_131451 ?auto_131453 ) ) ( not ( = ?auto_131451 ?auto_131455 ) ) ( not ( = ?auto_131451 ?auto_131454 ) ) ( not ( = ?auto_131451 ?auto_131456 ) ) ( not ( = ?auto_131452 ?auto_131449 ) ) ( not ( = ?auto_131452 ?auto_131453 ) ) ( not ( = ?auto_131452 ?auto_131455 ) ) ( not ( = ?auto_131452 ?auto_131454 ) ) ( not ( = ?auto_131452 ?auto_131456 ) ) ( not ( = ?auto_131449 ?auto_131453 ) ) ( not ( = ?auto_131449 ?auto_131455 ) ) ( not ( = ?auto_131449 ?auto_131454 ) ) ( not ( = ?auto_131449 ?auto_131456 ) ) ( not ( = ?auto_131453 ?auto_131455 ) ) ( not ( = ?auto_131453 ?auto_131454 ) ) ( not ( = ?auto_131453 ?auto_131456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131455 ?auto_131454 ?auto_131456 )
      ( MAKE-7CRATE-VERIFY ?auto_131450 ?auto_131451 ?auto_131452 ?auto_131449 ?auto_131453 ?auto_131455 ?auto_131454 ?auto_131456 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131520 - SURFACE
      ?auto_131521 - SURFACE
      ?auto_131522 - SURFACE
      ?auto_131519 - SURFACE
      ?auto_131523 - SURFACE
      ?auto_131525 - SURFACE
      ?auto_131524 - SURFACE
      ?auto_131526 - SURFACE
    )
    :vars
    (
      ?auto_131527 - HOIST
      ?auto_131528 - PLACE
      ?auto_131530 - TRUCK
      ?auto_131531 - PLACE
      ?auto_131529 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_131527 ?auto_131528 ) ( SURFACE-AT ?auto_131524 ?auto_131528 ) ( CLEAR ?auto_131524 ) ( IS-CRATE ?auto_131526 ) ( not ( = ?auto_131524 ?auto_131526 ) ) ( AVAILABLE ?auto_131527 ) ( ON ?auto_131524 ?auto_131525 ) ( not ( = ?auto_131525 ?auto_131524 ) ) ( not ( = ?auto_131525 ?auto_131526 ) ) ( TRUCK-AT ?auto_131530 ?auto_131531 ) ( not ( = ?auto_131531 ?auto_131528 ) ) ( HOIST-AT ?auto_131529 ?auto_131531 ) ( LIFTING ?auto_131529 ?auto_131526 ) ( not ( = ?auto_131527 ?auto_131529 ) ) ( ON ?auto_131521 ?auto_131520 ) ( ON ?auto_131522 ?auto_131521 ) ( ON ?auto_131519 ?auto_131522 ) ( ON ?auto_131523 ?auto_131519 ) ( ON ?auto_131525 ?auto_131523 ) ( not ( = ?auto_131520 ?auto_131521 ) ) ( not ( = ?auto_131520 ?auto_131522 ) ) ( not ( = ?auto_131520 ?auto_131519 ) ) ( not ( = ?auto_131520 ?auto_131523 ) ) ( not ( = ?auto_131520 ?auto_131525 ) ) ( not ( = ?auto_131520 ?auto_131524 ) ) ( not ( = ?auto_131520 ?auto_131526 ) ) ( not ( = ?auto_131521 ?auto_131522 ) ) ( not ( = ?auto_131521 ?auto_131519 ) ) ( not ( = ?auto_131521 ?auto_131523 ) ) ( not ( = ?auto_131521 ?auto_131525 ) ) ( not ( = ?auto_131521 ?auto_131524 ) ) ( not ( = ?auto_131521 ?auto_131526 ) ) ( not ( = ?auto_131522 ?auto_131519 ) ) ( not ( = ?auto_131522 ?auto_131523 ) ) ( not ( = ?auto_131522 ?auto_131525 ) ) ( not ( = ?auto_131522 ?auto_131524 ) ) ( not ( = ?auto_131522 ?auto_131526 ) ) ( not ( = ?auto_131519 ?auto_131523 ) ) ( not ( = ?auto_131519 ?auto_131525 ) ) ( not ( = ?auto_131519 ?auto_131524 ) ) ( not ( = ?auto_131519 ?auto_131526 ) ) ( not ( = ?auto_131523 ?auto_131525 ) ) ( not ( = ?auto_131523 ?auto_131524 ) ) ( not ( = ?auto_131523 ?auto_131526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131525 ?auto_131524 ?auto_131526 )
      ( MAKE-7CRATE-VERIFY ?auto_131520 ?auto_131521 ?auto_131522 ?auto_131519 ?auto_131523 ?auto_131525 ?auto_131524 ?auto_131526 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131597 - SURFACE
      ?auto_131598 - SURFACE
      ?auto_131599 - SURFACE
      ?auto_131596 - SURFACE
      ?auto_131600 - SURFACE
      ?auto_131602 - SURFACE
      ?auto_131601 - SURFACE
      ?auto_131603 - SURFACE
    )
    :vars
    (
      ?auto_131607 - HOIST
      ?auto_131604 - PLACE
      ?auto_131608 - TRUCK
      ?auto_131606 - PLACE
      ?auto_131609 - HOIST
      ?auto_131605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131607 ?auto_131604 ) ( SURFACE-AT ?auto_131601 ?auto_131604 ) ( CLEAR ?auto_131601 ) ( IS-CRATE ?auto_131603 ) ( not ( = ?auto_131601 ?auto_131603 ) ) ( AVAILABLE ?auto_131607 ) ( ON ?auto_131601 ?auto_131602 ) ( not ( = ?auto_131602 ?auto_131601 ) ) ( not ( = ?auto_131602 ?auto_131603 ) ) ( TRUCK-AT ?auto_131608 ?auto_131606 ) ( not ( = ?auto_131606 ?auto_131604 ) ) ( HOIST-AT ?auto_131609 ?auto_131606 ) ( not ( = ?auto_131607 ?auto_131609 ) ) ( AVAILABLE ?auto_131609 ) ( SURFACE-AT ?auto_131603 ?auto_131606 ) ( ON ?auto_131603 ?auto_131605 ) ( CLEAR ?auto_131603 ) ( not ( = ?auto_131601 ?auto_131605 ) ) ( not ( = ?auto_131603 ?auto_131605 ) ) ( not ( = ?auto_131602 ?auto_131605 ) ) ( ON ?auto_131598 ?auto_131597 ) ( ON ?auto_131599 ?auto_131598 ) ( ON ?auto_131596 ?auto_131599 ) ( ON ?auto_131600 ?auto_131596 ) ( ON ?auto_131602 ?auto_131600 ) ( not ( = ?auto_131597 ?auto_131598 ) ) ( not ( = ?auto_131597 ?auto_131599 ) ) ( not ( = ?auto_131597 ?auto_131596 ) ) ( not ( = ?auto_131597 ?auto_131600 ) ) ( not ( = ?auto_131597 ?auto_131602 ) ) ( not ( = ?auto_131597 ?auto_131601 ) ) ( not ( = ?auto_131597 ?auto_131603 ) ) ( not ( = ?auto_131597 ?auto_131605 ) ) ( not ( = ?auto_131598 ?auto_131599 ) ) ( not ( = ?auto_131598 ?auto_131596 ) ) ( not ( = ?auto_131598 ?auto_131600 ) ) ( not ( = ?auto_131598 ?auto_131602 ) ) ( not ( = ?auto_131598 ?auto_131601 ) ) ( not ( = ?auto_131598 ?auto_131603 ) ) ( not ( = ?auto_131598 ?auto_131605 ) ) ( not ( = ?auto_131599 ?auto_131596 ) ) ( not ( = ?auto_131599 ?auto_131600 ) ) ( not ( = ?auto_131599 ?auto_131602 ) ) ( not ( = ?auto_131599 ?auto_131601 ) ) ( not ( = ?auto_131599 ?auto_131603 ) ) ( not ( = ?auto_131599 ?auto_131605 ) ) ( not ( = ?auto_131596 ?auto_131600 ) ) ( not ( = ?auto_131596 ?auto_131602 ) ) ( not ( = ?auto_131596 ?auto_131601 ) ) ( not ( = ?auto_131596 ?auto_131603 ) ) ( not ( = ?auto_131596 ?auto_131605 ) ) ( not ( = ?auto_131600 ?auto_131602 ) ) ( not ( = ?auto_131600 ?auto_131601 ) ) ( not ( = ?auto_131600 ?auto_131603 ) ) ( not ( = ?auto_131600 ?auto_131605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131602 ?auto_131601 ?auto_131603 )
      ( MAKE-7CRATE-VERIFY ?auto_131597 ?auto_131598 ?auto_131599 ?auto_131596 ?auto_131600 ?auto_131602 ?auto_131601 ?auto_131603 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131675 - SURFACE
      ?auto_131676 - SURFACE
      ?auto_131677 - SURFACE
      ?auto_131674 - SURFACE
      ?auto_131678 - SURFACE
      ?auto_131680 - SURFACE
      ?auto_131679 - SURFACE
      ?auto_131681 - SURFACE
    )
    :vars
    (
      ?auto_131685 - HOIST
      ?auto_131683 - PLACE
      ?auto_131684 - PLACE
      ?auto_131687 - HOIST
      ?auto_131686 - SURFACE
      ?auto_131682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131685 ?auto_131683 ) ( SURFACE-AT ?auto_131679 ?auto_131683 ) ( CLEAR ?auto_131679 ) ( IS-CRATE ?auto_131681 ) ( not ( = ?auto_131679 ?auto_131681 ) ) ( AVAILABLE ?auto_131685 ) ( ON ?auto_131679 ?auto_131680 ) ( not ( = ?auto_131680 ?auto_131679 ) ) ( not ( = ?auto_131680 ?auto_131681 ) ) ( not ( = ?auto_131684 ?auto_131683 ) ) ( HOIST-AT ?auto_131687 ?auto_131684 ) ( not ( = ?auto_131685 ?auto_131687 ) ) ( AVAILABLE ?auto_131687 ) ( SURFACE-AT ?auto_131681 ?auto_131684 ) ( ON ?auto_131681 ?auto_131686 ) ( CLEAR ?auto_131681 ) ( not ( = ?auto_131679 ?auto_131686 ) ) ( not ( = ?auto_131681 ?auto_131686 ) ) ( not ( = ?auto_131680 ?auto_131686 ) ) ( TRUCK-AT ?auto_131682 ?auto_131683 ) ( ON ?auto_131676 ?auto_131675 ) ( ON ?auto_131677 ?auto_131676 ) ( ON ?auto_131674 ?auto_131677 ) ( ON ?auto_131678 ?auto_131674 ) ( ON ?auto_131680 ?auto_131678 ) ( not ( = ?auto_131675 ?auto_131676 ) ) ( not ( = ?auto_131675 ?auto_131677 ) ) ( not ( = ?auto_131675 ?auto_131674 ) ) ( not ( = ?auto_131675 ?auto_131678 ) ) ( not ( = ?auto_131675 ?auto_131680 ) ) ( not ( = ?auto_131675 ?auto_131679 ) ) ( not ( = ?auto_131675 ?auto_131681 ) ) ( not ( = ?auto_131675 ?auto_131686 ) ) ( not ( = ?auto_131676 ?auto_131677 ) ) ( not ( = ?auto_131676 ?auto_131674 ) ) ( not ( = ?auto_131676 ?auto_131678 ) ) ( not ( = ?auto_131676 ?auto_131680 ) ) ( not ( = ?auto_131676 ?auto_131679 ) ) ( not ( = ?auto_131676 ?auto_131681 ) ) ( not ( = ?auto_131676 ?auto_131686 ) ) ( not ( = ?auto_131677 ?auto_131674 ) ) ( not ( = ?auto_131677 ?auto_131678 ) ) ( not ( = ?auto_131677 ?auto_131680 ) ) ( not ( = ?auto_131677 ?auto_131679 ) ) ( not ( = ?auto_131677 ?auto_131681 ) ) ( not ( = ?auto_131677 ?auto_131686 ) ) ( not ( = ?auto_131674 ?auto_131678 ) ) ( not ( = ?auto_131674 ?auto_131680 ) ) ( not ( = ?auto_131674 ?auto_131679 ) ) ( not ( = ?auto_131674 ?auto_131681 ) ) ( not ( = ?auto_131674 ?auto_131686 ) ) ( not ( = ?auto_131678 ?auto_131680 ) ) ( not ( = ?auto_131678 ?auto_131679 ) ) ( not ( = ?auto_131678 ?auto_131681 ) ) ( not ( = ?auto_131678 ?auto_131686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131680 ?auto_131679 ?auto_131681 )
      ( MAKE-7CRATE-VERIFY ?auto_131675 ?auto_131676 ?auto_131677 ?auto_131674 ?auto_131678 ?auto_131680 ?auto_131679 ?auto_131681 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131753 - SURFACE
      ?auto_131754 - SURFACE
      ?auto_131755 - SURFACE
      ?auto_131752 - SURFACE
      ?auto_131756 - SURFACE
      ?auto_131758 - SURFACE
      ?auto_131757 - SURFACE
      ?auto_131759 - SURFACE
    )
    :vars
    (
      ?auto_131762 - HOIST
      ?auto_131761 - PLACE
      ?auto_131764 - PLACE
      ?auto_131765 - HOIST
      ?auto_131760 - SURFACE
      ?auto_131763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131762 ?auto_131761 ) ( IS-CRATE ?auto_131759 ) ( not ( = ?auto_131757 ?auto_131759 ) ) ( not ( = ?auto_131758 ?auto_131757 ) ) ( not ( = ?auto_131758 ?auto_131759 ) ) ( not ( = ?auto_131764 ?auto_131761 ) ) ( HOIST-AT ?auto_131765 ?auto_131764 ) ( not ( = ?auto_131762 ?auto_131765 ) ) ( AVAILABLE ?auto_131765 ) ( SURFACE-AT ?auto_131759 ?auto_131764 ) ( ON ?auto_131759 ?auto_131760 ) ( CLEAR ?auto_131759 ) ( not ( = ?auto_131757 ?auto_131760 ) ) ( not ( = ?auto_131759 ?auto_131760 ) ) ( not ( = ?auto_131758 ?auto_131760 ) ) ( TRUCK-AT ?auto_131763 ?auto_131761 ) ( SURFACE-AT ?auto_131758 ?auto_131761 ) ( CLEAR ?auto_131758 ) ( LIFTING ?auto_131762 ?auto_131757 ) ( IS-CRATE ?auto_131757 ) ( ON ?auto_131754 ?auto_131753 ) ( ON ?auto_131755 ?auto_131754 ) ( ON ?auto_131752 ?auto_131755 ) ( ON ?auto_131756 ?auto_131752 ) ( ON ?auto_131758 ?auto_131756 ) ( not ( = ?auto_131753 ?auto_131754 ) ) ( not ( = ?auto_131753 ?auto_131755 ) ) ( not ( = ?auto_131753 ?auto_131752 ) ) ( not ( = ?auto_131753 ?auto_131756 ) ) ( not ( = ?auto_131753 ?auto_131758 ) ) ( not ( = ?auto_131753 ?auto_131757 ) ) ( not ( = ?auto_131753 ?auto_131759 ) ) ( not ( = ?auto_131753 ?auto_131760 ) ) ( not ( = ?auto_131754 ?auto_131755 ) ) ( not ( = ?auto_131754 ?auto_131752 ) ) ( not ( = ?auto_131754 ?auto_131756 ) ) ( not ( = ?auto_131754 ?auto_131758 ) ) ( not ( = ?auto_131754 ?auto_131757 ) ) ( not ( = ?auto_131754 ?auto_131759 ) ) ( not ( = ?auto_131754 ?auto_131760 ) ) ( not ( = ?auto_131755 ?auto_131752 ) ) ( not ( = ?auto_131755 ?auto_131756 ) ) ( not ( = ?auto_131755 ?auto_131758 ) ) ( not ( = ?auto_131755 ?auto_131757 ) ) ( not ( = ?auto_131755 ?auto_131759 ) ) ( not ( = ?auto_131755 ?auto_131760 ) ) ( not ( = ?auto_131752 ?auto_131756 ) ) ( not ( = ?auto_131752 ?auto_131758 ) ) ( not ( = ?auto_131752 ?auto_131757 ) ) ( not ( = ?auto_131752 ?auto_131759 ) ) ( not ( = ?auto_131752 ?auto_131760 ) ) ( not ( = ?auto_131756 ?auto_131758 ) ) ( not ( = ?auto_131756 ?auto_131757 ) ) ( not ( = ?auto_131756 ?auto_131759 ) ) ( not ( = ?auto_131756 ?auto_131760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131758 ?auto_131757 ?auto_131759 )
      ( MAKE-7CRATE-VERIFY ?auto_131753 ?auto_131754 ?auto_131755 ?auto_131752 ?auto_131756 ?auto_131758 ?auto_131757 ?auto_131759 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131831 - SURFACE
      ?auto_131832 - SURFACE
      ?auto_131833 - SURFACE
      ?auto_131830 - SURFACE
      ?auto_131834 - SURFACE
      ?auto_131836 - SURFACE
      ?auto_131835 - SURFACE
      ?auto_131837 - SURFACE
    )
    :vars
    (
      ?auto_131838 - HOIST
      ?auto_131840 - PLACE
      ?auto_131842 - PLACE
      ?auto_131843 - HOIST
      ?auto_131839 - SURFACE
      ?auto_131841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131838 ?auto_131840 ) ( IS-CRATE ?auto_131837 ) ( not ( = ?auto_131835 ?auto_131837 ) ) ( not ( = ?auto_131836 ?auto_131835 ) ) ( not ( = ?auto_131836 ?auto_131837 ) ) ( not ( = ?auto_131842 ?auto_131840 ) ) ( HOIST-AT ?auto_131843 ?auto_131842 ) ( not ( = ?auto_131838 ?auto_131843 ) ) ( AVAILABLE ?auto_131843 ) ( SURFACE-AT ?auto_131837 ?auto_131842 ) ( ON ?auto_131837 ?auto_131839 ) ( CLEAR ?auto_131837 ) ( not ( = ?auto_131835 ?auto_131839 ) ) ( not ( = ?auto_131837 ?auto_131839 ) ) ( not ( = ?auto_131836 ?auto_131839 ) ) ( TRUCK-AT ?auto_131841 ?auto_131840 ) ( SURFACE-AT ?auto_131836 ?auto_131840 ) ( CLEAR ?auto_131836 ) ( IS-CRATE ?auto_131835 ) ( AVAILABLE ?auto_131838 ) ( IN ?auto_131835 ?auto_131841 ) ( ON ?auto_131832 ?auto_131831 ) ( ON ?auto_131833 ?auto_131832 ) ( ON ?auto_131830 ?auto_131833 ) ( ON ?auto_131834 ?auto_131830 ) ( ON ?auto_131836 ?auto_131834 ) ( not ( = ?auto_131831 ?auto_131832 ) ) ( not ( = ?auto_131831 ?auto_131833 ) ) ( not ( = ?auto_131831 ?auto_131830 ) ) ( not ( = ?auto_131831 ?auto_131834 ) ) ( not ( = ?auto_131831 ?auto_131836 ) ) ( not ( = ?auto_131831 ?auto_131835 ) ) ( not ( = ?auto_131831 ?auto_131837 ) ) ( not ( = ?auto_131831 ?auto_131839 ) ) ( not ( = ?auto_131832 ?auto_131833 ) ) ( not ( = ?auto_131832 ?auto_131830 ) ) ( not ( = ?auto_131832 ?auto_131834 ) ) ( not ( = ?auto_131832 ?auto_131836 ) ) ( not ( = ?auto_131832 ?auto_131835 ) ) ( not ( = ?auto_131832 ?auto_131837 ) ) ( not ( = ?auto_131832 ?auto_131839 ) ) ( not ( = ?auto_131833 ?auto_131830 ) ) ( not ( = ?auto_131833 ?auto_131834 ) ) ( not ( = ?auto_131833 ?auto_131836 ) ) ( not ( = ?auto_131833 ?auto_131835 ) ) ( not ( = ?auto_131833 ?auto_131837 ) ) ( not ( = ?auto_131833 ?auto_131839 ) ) ( not ( = ?auto_131830 ?auto_131834 ) ) ( not ( = ?auto_131830 ?auto_131836 ) ) ( not ( = ?auto_131830 ?auto_131835 ) ) ( not ( = ?auto_131830 ?auto_131837 ) ) ( not ( = ?auto_131830 ?auto_131839 ) ) ( not ( = ?auto_131834 ?auto_131836 ) ) ( not ( = ?auto_131834 ?auto_131835 ) ) ( not ( = ?auto_131834 ?auto_131837 ) ) ( not ( = ?auto_131834 ?auto_131839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131836 ?auto_131835 ?auto_131837 )
      ( MAKE-7CRATE-VERIFY ?auto_131831 ?auto_131832 ?auto_131833 ?auto_131830 ?auto_131834 ?auto_131836 ?auto_131835 ?auto_131837 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134750 - SURFACE
      ?auto_134751 - SURFACE
      ?auto_134752 - SURFACE
      ?auto_134749 - SURFACE
      ?auto_134753 - SURFACE
      ?auto_134755 - SURFACE
      ?auto_134754 - SURFACE
      ?auto_134756 - SURFACE
      ?auto_134757 - SURFACE
    )
    :vars
    (
      ?auto_134759 - HOIST
      ?auto_134758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_134759 ?auto_134758 ) ( SURFACE-AT ?auto_134756 ?auto_134758 ) ( CLEAR ?auto_134756 ) ( LIFTING ?auto_134759 ?auto_134757 ) ( IS-CRATE ?auto_134757 ) ( not ( = ?auto_134756 ?auto_134757 ) ) ( ON ?auto_134751 ?auto_134750 ) ( ON ?auto_134752 ?auto_134751 ) ( ON ?auto_134749 ?auto_134752 ) ( ON ?auto_134753 ?auto_134749 ) ( ON ?auto_134755 ?auto_134753 ) ( ON ?auto_134754 ?auto_134755 ) ( ON ?auto_134756 ?auto_134754 ) ( not ( = ?auto_134750 ?auto_134751 ) ) ( not ( = ?auto_134750 ?auto_134752 ) ) ( not ( = ?auto_134750 ?auto_134749 ) ) ( not ( = ?auto_134750 ?auto_134753 ) ) ( not ( = ?auto_134750 ?auto_134755 ) ) ( not ( = ?auto_134750 ?auto_134754 ) ) ( not ( = ?auto_134750 ?auto_134756 ) ) ( not ( = ?auto_134750 ?auto_134757 ) ) ( not ( = ?auto_134751 ?auto_134752 ) ) ( not ( = ?auto_134751 ?auto_134749 ) ) ( not ( = ?auto_134751 ?auto_134753 ) ) ( not ( = ?auto_134751 ?auto_134755 ) ) ( not ( = ?auto_134751 ?auto_134754 ) ) ( not ( = ?auto_134751 ?auto_134756 ) ) ( not ( = ?auto_134751 ?auto_134757 ) ) ( not ( = ?auto_134752 ?auto_134749 ) ) ( not ( = ?auto_134752 ?auto_134753 ) ) ( not ( = ?auto_134752 ?auto_134755 ) ) ( not ( = ?auto_134752 ?auto_134754 ) ) ( not ( = ?auto_134752 ?auto_134756 ) ) ( not ( = ?auto_134752 ?auto_134757 ) ) ( not ( = ?auto_134749 ?auto_134753 ) ) ( not ( = ?auto_134749 ?auto_134755 ) ) ( not ( = ?auto_134749 ?auto_134754 ) ) ( not ( = ?auto_134749 ?auto_134756 ) ) ( not ( = ?auto_134749 ?auto_134757 ) ) ( not ( = ?auto_134753 ?auto_134755 ) ) ( not ( = ?auto_134753 ?auto_134754 ) ) ( not ( = ?auto_134753 ?auto_134756 ) ) ( not ( = ?auto_134753 ?auto_134757 ) ) ( not ( = ?auto_134755 ?auto_134754 ) ) ( not ( = ?auto_134755 ?auto_134756 ) ) ( not ( = ?auto_134755 ?auto_134757 ) ) ( not ( = ?auto_134754 ?auto_134756 ) ) ( not ( = ?auto_134754 ?auto_134757 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_134756 ?auto_134757 )
      ( MAKE-8CRATE-VERIFY ?auto_134750 ?auto_134751 ?auto_134752 ?auto_134749 ?auto_134753 ?auto_134755 ?auto_134754 ?auto_134756 ?auto_134757 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134817 - SURFACE
      ?auto_134818 - SURFACE
      ?auto_134819 - SURFACE
      ?auto_134816 - SURFACE
      ?auto_134820 - SURFACE
      ?auto_134822 - SURFACE
      ?auto_134821 - SURFACE
      ?auto_134823 - SURFACE
      ?auto_134824 - SURFACE
    )
    :vars
    (
      ?auto_134826 - HOIST
      ?auto_134825 - PLACE
      ?auto_134827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_134826 ?auto_134825 ) ( SURFACE-AT ?auto_134823 ?auto_134825 ) ( CLEAR ?auto_134823 ) ( IS-CRATE ?auto_134824 ) ( not ( = ?auto_134823 ?auto_134824 ) ) ( TRUCK-AT ?auto_134827 ?auto_134825 ) ( AVAILABLE ?auto_134826 ) ( IN ?auto_134824 ?auto_134827 ) ( ON ?auto_134823 ?auto_134821 ) ( not ( = ?auto_134821 ?auto_134823 ) ) ( not ( = ?auto_134821 ?auto_134824 ) ) ( ON ?auto_134818 ?auto_134817 ) ( ON ?auto_134819 ?auto_134818 ) ( ON ?auto_134816 ?auto_134819 ) ( ON ?auto_134820 ?auto_134816 ) ( ON ?auto_134822 ?auto_134820 ) ( ON ?auto_134821 ?auto_134822 ) ( not ( = ?auto_134817 ?auto_134818 ) ) ( not ( = ?auto_134817 ?auto_134819 ) ) ( not ( = ?auto_134817 ?auto_134816 ) ) ( not ( = ?auto_134817 ?auto_134820 ) ) ( not ( = ?auto_134817 ?auto_134822 ) ) ( not ( = ?auto_134817 ?auto_134821 ) ) ( not ( = ?auto_134817 ?auto_134823 ) ) ( not ( = ?auto_134817 ?auto_134824 ) ) ( not ( = ?auto_134818 ?auto_134819 ) ) ( not ( = ?auto_134818 ?auto_134816 ) ) ( not ( = ?auto_134818 ?auto_134820 ) ) ( not ( = ?auto_134818 ?auto_134822 ) ) ( not ( = ?auto_134818 ?auto_134821 ) ) ( not ( = ?auto_134818 ?auto_134823 ) ) ( not ( = ?auto_134818 ?auto_134824 ) ) ( not ( = ?auto_134819 ?auto_134816 ) ) ( not ( = ?auto_134819 ?auto_134820 ) ) ( not ( = ?auto_134819 ?auto_134822 ) ) ( not ( = ?auto_134819 ?auto_134821 ) ) ( not ( = ?auto_134819 ?auto_134823 ) ) ( not ( = ?auto_134819 ?auto_134824 ) ) ( not ( = ?auto_134816 ?auto_134820 ) ) ( not ( = ?auto_134816 ?auto_134822 ) ) ( not ( = ?auto_134816 ?auto_134821 ) ) ( not ( = ?auto_134816 ?auto_134823 ) ) ( not ( = ?auto_134816 ?auto_134824 ) ) ( not ( = ?auto_134820 ?auto_134822 ) ) ( not ( = ?auto_134820 ?auto_134821 ) ) ( not ( = ?auto_134820 ?auto_134823 ) ) ( not ( = ?auto_134820 ?auto_134824 ) ) ( not ( = ?auto_134822 ?auto_134821 ) ) ( not ( = ?auto_134822 ?auto_134823 ) ) ( not ( = ?auto_134822 ?auto_134824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134821 ?auto_134823 ?auto_134824 )
      ( MAKE-8CRATE-VERIFY ?auto_134817 ?auto_134818 ?auto_134819 ?auto_134816 ?auto_134820 ?auto_134822 ?auto_134821 ?auto_134823 ?auto_134824 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134893 - SURFACE
      ?auto_134894 - SURFACE
      ?auto_134895 - SURFACE
      ?auto_134892 - SURFACE
      ?auto_134896 - SURFACE
      ?auto_134898 - SURFACE
      ?auto_134897 - SURFACE
      ?auto_134899 - SURFACE
      ?auto_134900 - SURFACE
    )
    :vars
    (
      ?auto_134902 - HOIST
      ?auto_134904 - PLACE
      ?auto_134903 - TRUCK
      ?auto_134901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_134902 ?auto_134904 ) ( SURFACE-AT ?auto_134899 ?auto_134904 ) ( CLEAR ?auto_134899 ) ( IS-CRATE ?auto_134900 ) ( not ( = ?auto_134899 ?auto_134900 ) ) ( AVAILABLE ?auto_134902 ) ( IN ?auto_134900 ?auto_134903 ) ( ON ?auto_134899 ?auto_134897 ) ( not ( = ?auto_134897 ?auto_134899 ) ) ( not ( = ?auto_134897 ?auto_134900 ) ) ( TRUCK-AT ?auto_134903 ?auto_134901 ) ( not ( = ?auto_134901 ?auto_134904 ) ) ( ON ?auto_134894 ?auto_134893 ) ( ON ?auto_134895 ?auto_134894 ) ( ON ?auto_134892 ?auto_134895 ) ( ON ?auto_134896 ?auto_134892 ) ( ON ?auto_134898 ?auto_134896 ) ( ON ?auto_134897 ?auto_134898 ) ( not ( = ?auto_134893 ?auto_134894 ) ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134893 ?auto_134892 ) ) ( not ( = ?auto_134893 ?auto_134896 ) ) ( not ( = ?auto_134893 ?auto_134898 ) ) ( not ( = ?auto_134893 ?auto_134897 ) ) ( not ( = ?auto_134893 ?auto_134899 ) ) ( not ( = ?auto_134893 ?auto_134900 ) ) ( not ( = ?auto_134894 ?auto_134895 ) ) ( not ( = ?auto_134894 ?auto_134892 ) ) ( not ( = ?auto_134894 ?auto_134896 ) ) ( not ( = ?auto_134894 ?auto_134898 ) ) ( not ( = ?auto_134894 ?auto_134897 ) ) ( not ( = ?auto_134894 ?auto_134899 ) ) ( not ( = ?auto_134894 ?auto_134900 ) ) ( not ( = ?auto_134895 ?auto_134892 ) ) ( not ( = ?auto_134895 ?auto_134896 ) ) ( not ( = ?auto_134895 ?auto_134898 ) ) ( not ( = ?auto_134895 ?auto_134897 ) ) ( not ( = ?auto_134895 ?auto_134899 ) ) ( not ( = ?auto_134895 ?auto_134900 ) ) ( not ( = ?auto_134892 ?auto_134896 ) ) ( not ( = ?auto_134892 ?auto_134898 ) ) ( not ( = ?auto_134892 ?auto_134897 ) ) ( not ( = ?auto_134892 ?auto_134899 ) ) ( not ( = ?auto_134892 ?auto_134900 ) ) ( not ( = ?auto_134896 ?auto_134898 ) ) ( not ( = ?auto_134896 ?auto_134897 ) ) ( not ( = ?auto_134896 ?auto_134899 ) ) ( not ( = ?auto_134896 ?auto_134900 ) ) ( not ( = ?auto_134898 ?auto_134897 ) ) ( not ( = ?auto_134898 ?auto_134899 ) ) ( not ( = ?auto_134898 ?auto_134900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134897 ?auto_134899 ?auto_134900 )
      ( MAKE-8CRATE-VERIFY ?auto_134893 ?auto_134894 ?auto_134895 ?auto_134892 ?auto_134896 ?auto_134898 ?auto_134897 ?auto_134899 ?auto_134900 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134977 - SURFACE
      ?auto_134978 - SURFACE
      ?auto_134979 - SURFACE
      ?auto_134976 - SURFACE
      ?auto_134980 - SURFACE
      ?auto_134982 - SURFACE
      ?auto_134981 - SURFACE
      ?auto_134983 - SURFACE
      ?auto_134984 - SURFACE
    )
    :vars
    (
      ?auto_134989 - HOIST
      ?auto_134985 - PLACE
      ?auto_134987 - TRUCK
      ?auto_134988 - PLACE
      ?auto_134986 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_134989 ?auto_134985 ) ( SURFACE-AT ?auto_134983 ?auto_134985 ) ( CLEAR ?auto_134983 ) ( IS-CRATE ?auto_134984 ) ( not ( = ?auto_134983 ?auto_134984 ) ) ( AVAILABLE ?auto_134989 ) ( ON ?auto_134983 ?auto_134981 ) ( not ( = ?auto_134981 ?auto_134983 ) ) ( not ( = ?auto_134981 ?auto_134984 ) ) ( TRUCK-AT ?auto_134987 ?auto_134988 ) ( not ( = ?auto_134988 ?auto_134985 ) ) ( HOIST-AT ?auto_134986 ?auto_134988 ) ( LIFTING ?auto_134986 ?auto_134984 ) ( not ( = ?auto_134989 ?auto_134986 ) ) ( ON ?auto_134978 ?auto_134977 ) ( ON ?auto_134979 ?auto_134978 ) ( ON ?auto_134976 ?auto_134979 ) ( ON ?auto_134980 ?auto_134976 ) ( ON ?auto_134982 ?auto_134980 ) ( ON ?auto_134981 ?auto_134982 ) ( not ( = ?auto_134977 ?auto_134978 ) ) ( not ( = ?auto_134977 ?auto_134979 ) ) ( not ( = ?auto_134977 ?auto_134976 ) ) ( not ( = ?auto_134977 ?auto_134980 ) ) ( not ( = ?auto_134977 ?auto_134982 ) ) ( not ( = ?auto_134977 ?auto_134981 ) ) ( not ( = ?auto_134977 ?auto_134983 ) ) ( not ( = ?auto_134977 ?auto_134984 ) ) ( not ( = ?auto_134978 ?auto_134979 ) ) ( not ( = ?auto_134978 ?auto_134976 ) ) ( not ( = ?auto_134978 ?auto_134980 ) ) ( not ( = ?auto_134978 ?auto_134982 ) ) ( not ( = ?auto_134978 ?auto_134981 ) ) ( not ( = ?auto_134978 ?auto_134983 ) ) ( not ( = ?auto_134978 ?auto_134984 ) ) ( not ( = ?auto_134979 ?auto_134976 ) ) ( not ( = ?auto_134979 ?auto_134980 ) ) ( not ( = ?auto_134979 ?auto_134982 ) ) ( not ( = ?auto_134979 ?auto_134981 ) ) ( not ( = ?auto_134979 ?auto_134983 ) ) ( not ( = ?auto_134979 ?auto_134984 ) ) ( not ( = ?auto_134976 ?auto_134980 ) ) ( not ( = ?auto_134976 ?auto_134982 ) ) ( not ( = ?auto_134976 ?auto_134981 ) ) ( not ( = ?auto_134976 ?auto_134983 ) ) ( not ( = ?auto_134976 ?auto_134984 ) ) ( not ( = ?auto_134980 ?auto_134982 ) ) ( not ( = ?auto_134980 ?auto_134981 ) ) ( not ( = ?auto_134980 ?auto_134983 ) ) ( not ( = ?auto_134980 ?auto_134984 ) ) ( not ( = ?auto_134982 ?auto_134981 ) ) ( not ( = ?auto_134982 ?auto_134983 ) ) ( not ( = ?auto_134982 ?auto_134984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134981 ?auto_134983 ?auto_134984 )
      ( MAKE-8CRATE-VERIFY ?auto_134977 ?auto_134978 ?auto_134979 ?auto_134976 ?auto_134980 ?auto_134982 ?auto_134981 ?auto_134983 ?auto_134984 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135069 - SURFACE
      ?auto_135070 - SURFACE
      ?auto_135071 - SURFACE
      ?auto_135068 - SURFACE
      ?auto_135072 - SURFACE
      ?auto_135074 - SURFACE
      ?auto_135073 - SURFACE
      ?auto_135075 - SURFACE
      ?auto_135076 - SURFACE
    )
    :vars
    (
      ?auto_135080 - HOIST
      ?auto_135081 - PLACE
      ?auto_135078 - TRUCK
      ?auto_135077 - PLACE
      ?auto_135079 - HOIST
      ?auto_135082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_135080 ?auto_135081 ) ( SURFACE-AT ?auto_135075 ?auto_135081 ) ( CLEAR ?auto_135075 ) ( IS-CRATE ?auto_135076 ) ( not ( = ?auto_135075 ?auto_135076 ) ) ( AVAILABLE ?auto_135080 ) ( ON ?auto_135075 ?auto_135073 ) ( not ( = ?auto_135073 ?auto_135075 ) ) ( not ( = ?auto_135073 ?auto_135076 ) ) ( TRUCK-AT ?auto_135078 ?auto_135077 ) ( not ( = ?auto_135077 ?auto_135081 ) ) ( HOIST-AT ?auto_135079 ?auto_135077 ) ( not ( = ?auto_135080 ?auto_135079 ) ) ( AVAILABLE ?auto_135079 ) ( SURFACE-AT ?auto_135076 ?auto_135077 ) ( ON ?auto_135076 ?auto_135082 ) ( CLEAR ?auto_135076 ) ( not ( = ?auto_135075 ?auto_135082 ) ) ( not ( = ?auto_135076 ?auto_135082 ) ) ( not ( = ?auto_135073 ?auto_135082 ) ) ( ON ?auto_135070 ?auto_135069 ) ( ON ?auto_135071 ?auto_135070 ) ( ON ?auto_135068 ?auto_135071 ) ( ON ?auto_135072 ?auto_135068 ) ( ON ?auto_135074 ?auto_135072 ) ( ON ?auto_135073 ?auto_135074 ) ( not ( = ?auto_135069 ?auto_135070 ) ) ( not ( = ?auto_135069 ?auto_135071 ) ) ( not ( = ?auto_135069 ?auto_135068 ) ) ( not ( = ?auto_135069 ?auto_135072 ) ) ( not ( = ?auto_135069 ?auto_135074 ) ) ( not ( = ?auto_135069 ?auto_135073 ) ) ( not ( = ?auto_135069 ?auto_135075 ) ) ( not ( = ?auto_135069 ?auto_135076 ) ) ( not ( = ?auto_135069 ?auto_135082 ) ) ( not ( = ?auto_135070 ?auto_135071 ) ) ( not ( = ?auto_135070 ?auto_135068 ) ) ( not ( = ?auto_135070 ?auto_135072 ) ) ( not ( = ?auto_135070 ?auto_135074 ) ) ( not ( = ?auto_135070 ?auto_135073 ) ) ( not ( = ?auto_135070 ?auto_135075 ) ) ( not ( = ?auto_135070 ?auto_135076 ) ) ( not ( = ?auto_135070 ?auto_135082 ) ) ( not ( = ?auto_135071 ?auto_135068 ) ) ( not ( = ?auto_135071 ?auto_135072 ) ) ( not ( = ?auto_135071 ?auto_135074 ) ) ( not ( = ?auto_135071 ?auto_135073 ) ) ( not ( = ?auto_135071 ?auto_135075 ) ) ( not ( = ?auto_135071 ?auto_135076 ) ) ( not ( = ?auto_135071 ?auto_135082 ) ) ( not ( = ?auto_135068 ?auto_135072 ) ) ( not ( = ?auto_135068 ?auto_135074 ) ) ( not ( = ?auto_135068 ?auto_135073 ) ) ( not ( = ?auto_135068 ?auto_135075 ) ) ( not ( = ?auto_135068 ?auto_135076 ) ) ( not ( = ?auto_135068 ?auto_135082 ) ) ( not ( = ?auto_135072 ?auto_135074 ) ) ( not ( = ?auto_135072 ?auto_135073 ) ) ( not ( = ?auto_135072 ?auto_135075 ) ) ( not ( = ?auto_135072 ?auto_135076 ) ) ( not ( = ?auto_135072 ?auto_135082 ) ) ( not ( = ?auto_135074 ?auto_135073 ) ) ( not ( = ?auto_135074 ?auto_135075 ) ) ( not ( = ?auto_135074 ?auto_135076 ) ) ( not ( = ?auto_135074 ?auto_135082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135073 ?auto_135075 ?auto_135076 )
      ( MAKE-8CRATE-VERIFY ?auto_135069 ?auto_135070 ?auto_135071 ?auto_135068 ?auto_135072 ?auto_135074 ?auto_135073 ?auto_135075 ?auto_135076 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135162 - SURFACE
      ?auto_135163 - SURFACE
      ?auto_135164 - SURFACE
      ?auto_135161 - SURFACE
      ?auto_135165 - SURFACE
      ?auto_135167 - SURFACE
      ?auto_135166 - SURFACE
      ?auto_135168 - SURFACE
      ?auto_135169 - SURFACE
    )
    :vars
    (
      ?auto_135174 - HOIST
      ?auto_135172 - PLACE
      ?auto_135175 - PLACE
      ?auto_135171 - HOIST
      ?auto_135173 - SURFACE
      ?auto_135170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135174 ?auto_135172 ) ( SURFACE-AT ?auto_135168 ?auto_135172 ) ( CLEAR ?auto_135168 ) ( IS-CRATE ?auto_135169 ) ( not ( = ?auto_135168 ?auto_135169 ) ) ( AVAILABLE ?auto_135174 ) ( ON ?auto_135168 ?auto_135166 ) ( not ( = ?auto_135166 ?auto_135168 ) ) ( not ( = ?auto_135166 ?auto_135169 ) ) ( not ( = ?auto_135175 ?auto_135172 ) ) ( HOIST-AT ?auto_135171 ?auto_135175 ) ( not ( = ?auto_135174 ?auto_135171 ) ) ( AVAILABLE ?auto_135171 ) ( SURFACE-AT ?auto_135169 ?auto_135175 ) ( ON ?auto_135169 ?auto_135173 ) ( CLEAR ?auto_135169 ) ( not ( = ?auto_135168 ?auto_135173 ) ) ( not ( = ?auto_135169 ?auto_135173 ) ) ( not ( = ?auto_135166 ?auto_135173 ) ) ( TRUCK-AT ?auto_135170 ?auto_135172 ) ( ON ?auto_135163 ?auto_135162 ) ( ON ?auto_135164 ?auto_135163 ) ( ON ?auto_135161 ?auto_135164 ) ( ON ?auto_135165 ?auto_135161 ) ( ON ?auto_135167 ?auto_135165 ) ( ON ?auto_135166 ?auto_135167 ) ( not ( = ?auto_135162 ?auto_135163 ) ) ( not ( = ?auto_135162 ?auto_135164 ) ) ( not ( = ?auto_135162 ?auto_135161 ) ) ( not ( = ?auto_135162 ?auto_135165 ) ) ( not ( = ?auto_135162 ?auto_135167 ) ) ( not ( = ?auto_135162 ?auto_135166 ) ) ( not ( = ?auto_135162 ?auto_135168 ) ) ( not ( = ?auto_135162 ?auto_135169 ) ) ( not ( = ?auto_135162 ?auto_135173 ) ) ( not ( = ?auto_135163 ?auto_135164 ) ) ( not ( = ?auto_135163 ?auto_135161 ) ) ( not ( = ?auto_135163 ?auto_135165 ) ) ( not ( = ?auto_135163 ?auto_135167 ) ) ( not ( = ?auto_135163 ?auto_135166 ) ) ( not ( = ?auto_135163 ?auto_135168 ) ) ( not ( = ?auto_135163 ?auto_135169 ) ) ( not ( = ?auto_135163 ?auto_135173 ) ) ( not ( = ?auto_135164 ?auto_135161 ) ) ( not ( = ?auto_135164 ?auto_135165 ) ) ( not ( = ?auto_135164 ?auto_135167 ) ) ( not ( = ?auto_135164 ?auto_135166 ) ) ( not ( = ?auto_135164 ?auto_135168 ) ) ( not ( = ?auto_135164 ?auto_135169 ) ) ( not ( = ?auto_135164 ?auto_135173 ) ) ( not ( = ?auto_135161 ?auto_135165 ) ) ( not ( = ?auto_135161 ?auto_135167 ) ) ( not ( = ?auto_135161 ?auto_135166 ) ) ( not ( = ?auto_135161 ?auto_135168 ) ) ( not ( = ?auto_135161 ?auto_135169 ) ) ( not ( = ?auto_135161 ?auto_135173 ) ) ( not ( = ?auto_135165 ?auto_135167 ) ) ( not ( = ?auto_135165 ?auto_135166 ) ) ( not ( = ?auto_135165 ?auto_135168 ) ) ( not ( = ?auto_135165 ?auto_135169 ) ) ( not ( = ?auto_135165 ?auto_135173 ) ) ( not ( = ?auto_135167 ?auto_135166 ) ) ( not ( = ?auto_135167 ?auto_135168 ) ) ( not ( = ?auto_135167 ?auto_135169 ) ) ( not ( = ?auto_135167 ?auto_135173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135166 ?auto_135168 ?auto_135169 )
      ( MAKE-8CRATE-VERIFY ?auto_135162 ?auto_135163 ?auto_135164 ?auto_135161 ?auto_135165 ?auto_135167 ?auto_135166 ?auto_135168 ?auto_135169 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135255 - SURFACE
      ?auto_135256 - SURFACE
      ?auto_135257 - SURFACE
      ?auto_135254 - SURFACE
      ?auto_135258 - SURFACE
      ?auto_135260 - SURFACE
      ?auto_135259 - SURFACE
      ?auto_135261 - SURFACE
      ?auto_135262 - SURFACE
    )
    :vars
    (
      ?auto_135263 - HOIST
      ?auto_135265 - PLACE
      ?auto_135264 - PLACE
      ?auto_135267 - HOIST
      ?auto_135266 - SURFACE
      ?auto_135268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135263 ?auto_135265 ) ( IS-CRATE ?auto_135262 ) ( not ( = ?auto_135261 ?auto_135262 ) ) ( not ( = ?auto_135259 ?auto_135261 ) ) ( not ( = ?auto_135259 ?auto_135262 ) ) ( not ( = ?auto_135264 ?auto_135265 ) ) ( HOIST-AT ?auto_135267 ?auto_135264 ) ( not ( = ?auto_135263 ?auto_135267 ) ) ( AVAILABLE ?auto_135267 ) ( SURFACE-AT ?auto_135262 ?auto_135264 ) ( ON ?auto_135262 ?auto_135266 ) ( CLEAR ?auto_135262 ) ( not ( = ?auto_135261 ?auto_135266 ) ) ( not ( = ?auto_135262 ?auto_135266 ) ) ( not ( = ?auto_135259 ?auto_135266 ) ) ( TRUCK-AT ?auto_135268 ?auto_135265 ) ( SURFACE-AT ?auto_135259 ?auto_135265 ) ( CLEAR ?auto_135259 ) ( LIFTING ?auto_135263 ?auto_135261 ) ( IS-CRATE ?auto_135261 ) ( ON ?auto_135256 ?auto_135255 ) ( ON ?auto_135257 ?auto_135256 ) ( ON ?auto_135254 ?auto_135257 ) ( ON ?auto_135258 ?auto_135254 ) ( ON ?auto_135260 ?auto_135258 ) ( ON ?auto_135259 ?auto_135260 ) ( not ( = ?auto_135255 ?auto_135256 ) ) ( not ( = ?auto_135255 ?auto_135257 ) ) ( not ( = ?auto_135255 ?auto_135254 ) ) ( not ( = ?auto_135255 ?auto_135258 ) ) ( not ( = ?auto_135255 ?auto_135260 ) ) ( not ( = ?auto_135255 ?auto_135259 ) ) ( not ( = ?auto_135255 ?auto_135261 ) ) ( not ( = ?auto_135255 ?auto_135262 ) ) ( not ( = ?auto_135255 ?auto_135266 ) ) ( not ( = ?auto_135256 ?auto_135257 ) ) ( not ( = ?auto_135256 ?auto_135254 ) ) ( not ( = ?auto_135256 ?auto_135258 ) ) ( not ( = ?auto_135256 ?auto_135260 ) ) ( not ( = ?auto_135256 ?auto_135259 ) ) ( not ( = ?auto_135256 ?auto_135261 ) ) ( not ( = ?auto_135256 ?auto_135262 ) ) ( not ( = ?auto_135256 ?auto_135266 ) ) ( not ( = ?auto_135257 ?auto_135254 ) ) ( not ( = ?auto_135257 ?auto_135258 ) ) ( not ( = ?auto_135257 ?auto_135260 ) ) ( not ( = ?auto_135257 ?auto_135259 ) ) ( not ( = ?auto_135257 ?auto_135261 ) ) ( not ( = ?auto_135257 ?auto_135262 ) ) ( not ( = ?auto_135257 ?auto_135266 ) ) ( not ( = ?auto_135254 ?auto_135258 ) ) ( not ( = ?auto_135254 ?auto_135260 ) ) ( not ( = ?auto_135254 ?auto_135259 ) ) ( not ( = ?auto_135254 ?auto_135261 ) ) ( not ( = ?auto_135254 ?auto_135262 ) ) ( not ( = ?auto_135254 ?auto_135266 ) ) ( not ( = ?auto_135258 ?auto_135260 ) ) ( not ( = ?auto_135258 ?auto_135259 ) ) ( not ( = ?auto_135258 ?auto_135261 ) ) ( not ( = ?auto_135258 ?auto_135262 ) ) ( not ( = ?auto_135258 ?auto_135266 ) ) ( not ( = ?auto_135260 ?auto_135259 ) ) ( not ( = ?auto_135260 ?auto_135261 ) ) ( not ( = ?auto_135260 ?auto_135262 ) ) ( not ( = ?auto_135260 ?auto_135266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135259 ?auto_135261 ?auto_135262 )
      ( MAKE-8CRATE-VERIFY ?auto_135255 ?auto_135256 ?auto_135257 ?auto_135254 ?auto_135258 ?auto_135260 ?auto_135259 ?auto_135261 ?auto_135262 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135348 - SURFACE
      ?auto_135349 - SURFACE
      ?auto_135350 - SURFACE
      ?auto_135347 - SURFACE
      ?auto_135351 - SURFACE
      ?auto_135353 - SURFACE
      ?auto_135352 - SURFACE
      ?auto_135354 - SURFACE
      ?auto_135355 - SURFACE
    )
    :vars
    (
      ?auto_135361 - HOIST
      ?auto_135359 - PLACE
      ?auto_135358 - PLACE
      ?auto_135357 - HOIST
      ?auto_135360 - SURFACE
      ?auto_135356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135361 ?auto_135359 ) ( IS-CRATE ?auto_135355 ) ( not ( = ?auto_135354 ?auto_135355 ) ) ( not ( = ?auto_135352 ?auto_135354 ) ) ( not ( = ?auto_135352 ?auto_135355 ) ) ( not ( = ?auto_135358 ?auto_135359 ) ) ( HOIST-AT ?auto_135357 ?auto_135358 ) ( not ( = ?auto_135361 ?auto_135357 ) ) ( AVAILABLE ?auto_135357 ) ( SURFACE-AT ?auto_135355 ?auto_135358 ) ( ON ?auto_135355 ?auto_135360 ) ( CLEAR ?auto_135355 ) ( not ( = ?auto_135354 ?auto_135360 ) ) ( not ( = ?auto_135355 ?auto_135360 ) ) ( not ( = ?auto_135352 ?auto_135360 ) ) ( TRUCK-AT ?auto_135356 ?auto_135359 ) ( SURFACE-AT ?auto_135352 ?auto_135359 ) ( CLEAR ?auto_135352 ) ( IS-CRATE ?auto_135354 ) ( AVAILABLE ?auto_135361 ) ( IN ?auto_135354 ?auto_135356 ) ( ON ?auto_135349 ?auto_135348 ) ( ON ?auto_135350 ?auto_135349 ) ( ON ?auto_135347 ?auto_135350 ) ( ON ?auto_135351 ?auto_135347 ) ( ON ?auto_135353 ?auto_135351 ) ( ON ?auto_135352 ?auto_135353 ) ( not ( = ?auto_135348 ?auto_135349 ) ) ( not ( = ?auto_135348 ?auto_135350 ) ) ( not ( = ?auto_135348 ?auto_135347 ) ) ( not ( = ?auto_135348 ?auto_135351 ) ) ( not ( = ?auto_135348 ?auto_135353 ) ) ( not ( = ?auto_135348 ?auto_135352 ) ) ( not ( = ?auto_135348 ?auto_135354 ) ) ( not ( = ?auto_135348 ?auto_135355 ) ) ( not ( = ?auto_135348 ?auto_135360 ) ) ( not ( = ?auto_135349 ?auto_135350 ) ) ( not ( = ?auto_135349 ?auto_135347 ) ) ( not ( = ?auto_135349 ?auto_135351 ) ) ( not ( = ?auto_135349 ?auto_135353 ) ) ( not ( = ?auto_135349 ?auto_135352 ) ) ( not ( = ?auto_135349 ?auto_135354 ) ) ( not ( = ?auto_135349 ?auto_135355 ) ) ( not ( = ?auto_135349 ?auto_135360 ) ) ( not ( = ?auto_135350 ?auto_135347 ) ) ( not ( = ?auto_135350 ?auto_135351 ) ) ( not ( = ?auto_135350 ?auto_135353 ) ) ( not ( = ?auto_135350 ?auto_135352 ) ) ( not ( = ?auto_135350 ?auto_135354 ) ) ( not ( = ?auto_135350 ?auto_135355 ) ) ( not ( = ?auto_135350 ?auto_135360 ) ) ( not ( = ?auto_135347 ?auto_135351 ) ) ( not ( = ?auto_135347 ?auto_135353 ) ) ( not ( = ?auto_135347 ?auto_135352 ) ) ( not ( = ?auto_135347 ?auto_135354 ) ) ( not ( = ?auto_135347 ?auto_135355 ) ) ( not ( = ?auto_135347 ?auto_135360 ) ) ( not ( = ?auto_135351 ?auto_135353 ) ) ( not ( = ?auto_135351 ?auto_135352 ) ) ( not ( = ?auto_135351 ?auto_135354 ) ) ( not ( = ?auto_135351 ?auto_135355 ) ) ( not ( = ?auto_135351 ?auto_135360 ) ) ( not ( = ?auto_135353 ?auto_135352 ) ) ( not ( = ?auto_135353 ?auto_135354 ) ) ( not ( = ?auto_135353 ?auto_135355 ) ) ( not ( = ?auto_135353 ?auto_135360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135352 ?auto_135354 ?auto_135355 )
      ( MAKE-8CRATE-VERIFY ?auto_135348 ?auto_135349 ?auto_135350 ?auto_135347 ?auto_135351 ?auto_135353 ?auto_135352 ?auto_135354 ?auto_135355 ) )
  )

)

