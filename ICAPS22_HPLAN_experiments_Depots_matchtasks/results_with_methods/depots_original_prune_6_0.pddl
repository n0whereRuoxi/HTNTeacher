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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27816 - SURFACE
      ?auto_27817 - SURFACE
    )
    :vars
    (
      ?auto_27818 - HOIST
      ?auto_27819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27818 ?auto_27819 ) ( SURFACE-AT ?auto_27816 ?auto_27819 ) ( CLEAR ?auto_27816 ) ( LIFTING ?auto_27818 ?auto_27817 ) ( IS-CRATE ?auto_27817 ) ( not ( = ?auto_27816 ?auto_27817 ) ) )
    :subtasks
    ( ( !DROP ?auto_27818 ?auto_27817 ?auto_27816 ?auto_27819 )
      ( MAKE-1CRATE-VERIFY ?auto_27816 ?auto_27817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27820 - SURFACE
      ?auto_27821 - SURFACE
    )
    :vars
    (
      ?auto_27823 - HOIST
      ?auto_27822 - PLACE
      ?auto_27824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27823 ?auto_27822 ) ( SURFACE-AT ?auto_27820 ?auto_27822 ) ( CLEAR ?auto_27820 ) ( IS-CRATE ?auto_27821 ) ( not ( = ?auto_27820 ?auto_27821 ) ) ( TRUCK-AT ?auto_27824 ?auto_27822 ) ( AVAILABLE ?auto_27823 ) ( IN ?auto_27821 ?auto_27824 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27823 ?auto_27821 ?auto_27824 ?auto_27822 )
      ( MAKE-1CRATE ?auto_27820 ?auto_27821 )
      ( MAKE-1CRATE-VERIFY ?auto_27820 ?auto_27821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27825 - SURFACE
      ?auto_27826 - SURFACE
    )
    :vars
    (
      ?auto_27829 - HOIST
      ?auto_27827 - PLACE
      ?auto_27828 - TRUCK
      ?auto_27830 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27829 ?auto_27827 ) ( SURFACE-AT ?auto_27825 ?auto_27827 ) ( CLEAR ?auto_27825 ) ( IS-CRATE ?auto_27826 ) ( not ( = ?auto_27825 ?auto_27826 ) ) ( AVAILABLE ?auto_27829 ) ( IN ?auto_27826 ?auto_27828 ) ( TRUCK-AT ?auto_27828 ?auto_27830 ) ( not ( = ?auto_27830 ?auto_27827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27828 ?auto_27830 ?auto_27827 )
      ( MAKE-1CRATE ?auto_27825 ?auto_27826 )
      ( MAKE-1CRATE-VERIFY ?auto_27825 ?auto_27826 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27831 - SURFACE
      ?auto_27832 - SURFACE
    )
    :vars
    (
      ?auto_27836 - HOIST
      ?auto_27834 - PLACE
      ?auto_27835 - TRUCK
      ?auto_27833 - PLACE
      ?auto_27837 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27836 ?auto_27834 ) ( SURFACE-AT ?auto_27831 ?auto_27834 ) ( CLEAR ?auto_27831 ) ( IS-CRATE ?auto_27832 ) ( not ( = ?auto_27831 ?auto_27832 ) ) ( AVAILABLE ?auto_27836 ) ( TRUCK-AT ?auto_27835 ?auto_27833 ) ( not ( = ?auto_27833 ?auto_27834 ) ) ( HOIST-AT ?auto_27837 ?auto_27833 ) ( LIFTING ?auto_27837 ?auto_27832 ) ( not ( = ?auto_27836 ?auto_27837 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27837 ?auto_27832 ?auto_27835 ?auto_27833 )
      ( MAKE-1CRATE ?auto_27831 ?auto_27832 )
      ( MAKE-1CRATE-VERIFY ?auto_27831 ?auto_27832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27838 - SURFACE
      ?auto_27839 - SURFACE
    )
    :vars
    (
      ?auto_27842 - HOIST
      ?auto_27840 - PLACE
      ?auto_27841 - TRUCK
      ?auto_27843 - PLACE
      ?auto_27844 - HOIST
      ?auto_27845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27842 ?auto_27840 ) ( SURFACE-AT ?auto_27838 ?auto_27840 ) ( CLEAR ?auto_27838 ) ( IS-CRATE ?auto_27839 ) ( not ( = ?auto_27838 ?auto_27839 ) ) ( AVAILABLE ?auto_27842 ) ( TRUCK-AT ?auto_27841 ?auto_27843 ) ( not ( = ?auto_27843 ?auto_27840 ) ) ( HOIST-AT ?auto_27844 ?auto_27843 ) ( not ( = ?auto_27842 ?auto_27844 ) ) ( AVAILABLE ?auto_27844 ) ( SURFACE-AT ?auto_27839 ?auto_27843 ) ( ON ?auto_27839 ?auto_27845 ) ( CLEAR ?auto_27839 ) ( not ( = ?auto_27838 ?auto_27845 ) ) ( not ( = ?auto_27839 ?auto_27845 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27844 ?auto_27839 ?auto_27845 ?auto_27843 )
      ( MAKE-1CRATE ?auto_27838 ?auto_27839 )
      ( MAKE-1CRATE-VERIFY ?auto_27838 ?auto_27839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27846 - SURFACE
      ?auto_27847 - SURFACE
    )
    :vars
    (
      ?auto_27848 - HOIST
      ?auto_27852 - PLACE
      ?auto_27853 - PLACE
      ?auto_27851 - HOIST
      ?auto_27850 - SURFACE
      ?auto_27849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27848 ?auto_27852 ) ( SURFACE-AT ?auto_27846 ?auto_27852 ) ( CLEAR ?auto_27846 ) ( IS-CRATE ?auto_27847 ) ( not ( = ?auto_27846 ?auto_27847 ) ) ( AVAILABLE ?auto_27848 ) ( not ( = ?auto_27853 ?auto_27852 ) ) ( HOIST-AT ?auto_27851 ?auto_27853 ) ( not ( = ?auto_27848 ?auto_27851 ) ) ( AVAILABLE ?auto_27851 ) ( SURFACE-AT ?auto_27847 ?auto_27853 ) ( ON ?auto_27847 ?auto_27850 ) ( CLEAR ?auto_27847 ) ( not ( = ?auto_27846 ?auto_27850 ) ) ( not ( = ?auto_27847 ?auto_27850 ) ) ( TRUCK-AT ?auto_27849 ?auto_27852 ) )
    :subtasks
    ( ( !DRIVE ?auto_27849 ?auto_27852 ?auto_27853 )
      ( MAKE-1CRATE ?auto_27846 ?auto_27847 )
      ( MAKE-1CRATE-VERIFY ?auto_27846 ?auto_27847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27863 - SURFACE
      ?auto_27864 - SURFACE
      ?auto_27865 - SURFACE
    )
    :vars
    (
      ?auto_27867 - HOIST
      ?auto_27866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27867 ?auto_27866 ) ( SURFACE-AT ?auto_27864 ?auto_27866 ) ( CLEAR ?auto_27864 ) ( LIFTING ?auto_27867 ?auto_27865 ) ( IS-CRATE ?auto_27865 ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( ON ?auto_27864 ?auto_27863 ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27864 ?auto_27865 )
      ( MAKE-2CRATE-VERIFY ?auto_27863 ?auto_27864 ?auto_27865 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27873 - SURFACE
      ?auto_27874 - SURFACE
      ?auto_27875 - SURFACE
    )
    :vars
    (
      ?auto_27877 - HOIST
      ?auto_27876 - PLACE
      ?auto_27878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27877 ?auto_27876 ) ( SURFACE-AT ?auto_27874 ?auto_27876 ) ( CLEAR ?auto_27874 ) ( IS-CRATE ?auto_27875 ) ( not ( = ?auto_27874 ?auto_27875 ) ) ( TRUCK-AT ?auto_27878 ?auto_27876 ) ( AVAILABLE ?auto_27877 ) ( IN ?auto_27875 ?auto_27878 ) ( ON ?auto_27874 ?auto_27873 ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( not ( = ?auto_27873 ?auto_27875 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27874 ?auto_27875 )
      ( MAKE-2CRATE-VERIFY ?auto_27873 ?auto_27874 ?auto_27875 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27879 - SURFACE
      ?auto_27880 - SURFACE
    )
    :vars
    (
      ?auto_27884 - HOIST
      ?auto_27881 - PLACE
      ?auto_27883 - TRUCK
      ?auto_27882 - SURFACE
      ?auto_27885 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27884 ?auto_27881 ) ( SURFACE-AT ?auto_27879 ?auto_27881 ) ( CLEAR ?auto_27879 ) ( IS-CRATE ?auto_27880 ) ( not ( = ?auto_27879 ?auto_27880 ) ) ( AVAILABLE ?auto_27884 ) ( IN ?auto_27880 ?auto_27883 ) ( ON ?auto_27879 ?auto_27882 ) ( not ( = ?auto_27882 ?auto_27879 ) ) ( not ( = ?auto_27882 ?auto_27880 ) ) ( TRUCK-AT ?auto_27883 ?auto_27885 ) ( not ( = ?auto_27885 ?auto_27881 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27883 ?auto_27885 ?auto_27881 )
      ( MAKE-2CRATE ?auto_27882 ?auto_27879 ?auto_27880 )
      ( MAKE-1CRATE-VERIFY ?auto_27879 ?auto_27880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27886 - SURFACE
      ?auto_27887 - SURFACE
      ?auto_27888 - SURFACE
    )
    :vars
    (
      ?auto_27892 - HOIST
      ?auto_27891 - PLACE
      ?auto_27889 - TRUCK
      ?auto_27890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27892 ?auto_27891 ) ( SURFACE-AT ?auto_27887 ?auto_27891 ) ( CLEAR ?auto_27887 ) ( IS-CRATE ?auto_27888 ) ( not ( = ?auto_27887 ?auto_27888 ) ) ( AVAILABLE ?auto_27892 ) ( IN ?auto_27888 ?auto_27889 ) ( ON ?auto_27887 ?auto_27886 ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27888 ) ) ( TRUCK-AT ?auto_27889 ?auto_27890 ) ( not ( = ?auto_27890 ?auto_27891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27887 ?auto_27888 )
      ( MAKE-2CRATE-VERIFY ?auto_27886 ?auto_27887 ?auto_27888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27893 - SURFACE
      ?auto_27894 - SURFACE
    )
    :vars
    (
      ?auto_27896 - HOIST
      ?auto_27898 - PLACE
      ?auto_27895 - SURFACE
      ?auto_27897 - TRUCK
      ?auto_27899 - PLACE
      ?auto_27900 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27896 ?auto_27898 ) ( SURFACE-AT ?auto_27893 ?auto_27898 ) ( CLEAR ?auto_27893 ) ( IS-CRATE ?auto_27894 ) ( not ( = ?auto_27893 ?auto_27894 ) ) ( AVAILABLE ?auto_27896 ) ( ON ?auto_27893 ?auto_27895 ) ( not ( = ?auto_27895 ?auto_27893 ) ) ( not ( = ?auto_27895 ?auto_27894 ) ) ( TRUCK-AT ?auto_27897 ?auto_27899 ) ( not ( = ?auto_27899 ?auto_27898 ) ) ( HOIST-AT ?auto_27900 ?auto_27899 ) ( LIFTING ?auto_27900 ?auto_27894 ) ( not ( = ?auto_27896 ?auto_27900 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27900 ?auto_27894 ?auto_27897 ?auto_27899 )
      ( MAKE-2CRATE ?auto_27895 ?auto_27893 ?auto_27894 )
      ( MAKE-1CRATE-VERIFY ?auto_27893 ?auto_27894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27901 - SURFACE
      ?auto_27902 - SURFACE
      ?auto_27903 - SURFACE
    )
    :vars
    (
      ?auto_27908 - HOIST
      ?auto_27906 - PLACE
      ?auto_27907 - TRUCK
      ?auto_27904 - PLACE
      ?auto_27905 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27908 ?auto_27906 ) ( SURFACE-AT ?auto_27902 ?auto_27906 ) ( CLEAR ?auto_27902 ) ( IS-CRATE ?auto_27903 ) ( not ( = ?auto_27902 ?auto_27903 ) ) ( AVAILABLE ?auto_27908 ) ( ON ?auto_27902 ?auto_27901 ) ( not ( = ?auto_27901 ?auto_27902 ) ) ( not ( = ?auto_27901 ?auto_27903 ) ) ( TRUCK-AT ?auto_27907 ?auto_27904 ) ( not ( = ?auto_27904 ?auto_27906 ) ) ( HOIST-AT ?auto_27905 ?auto_27904 ) ( LIFTING ?auto_27905 ?auto_27903 ) ( not ( = ?auto_27908 ?auto_27905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27902 ?auto_27903 )
      ( MAKE-2CRATE-VERIFY ?auto_27901 ?auto_27902 ?auto_27903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27909 - SURFACE
      ?auto_27910 - SURFACE
    )
    :vars
    (
      ?auto_27911 - HOIST
      ?auto_27915 - PLACE
      ?auto_27914 - SURFACE
      ?auto_27912 - TRUCK
      ?auto_27913 - PLACE
      ?auto_27916 - HOIST
      ?auto_27917 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27911 ?auto_27915 ) ( SURFACE-AT ?auto_27909 ?auto_27915 ) ( CLEAR ?auto_27909 ) ( IS-CRATE ?auto_27910 ) ( not ( = ?auto_27909 ?auto_27910 ) ) ( AVAILABLE ?auto_27911 ) ( ON ?auto_27909 ?auto_27914 ) ( not ( = ?auto_27914 ?auto_27909 ) ) ( not ( = ?auto_27914 ?auto_27910 ) ) ( TRUCK-AT ?auto_27912 ?auto_27913 ) ( not ( = ?auto_27913 ?auto_27915 ) ) ( HOIST-AT ?auto_27916 ?auto_27913 ) ( not ( = ?auto_27911 ?auto_27916 ) ) ( AVAILABLE ?auto_27916 ) ( SURFACE-AT ?auto_27910 ?auto_27913 ) ( ON ?auto_27910 ?auto_27917 ) ( CLEAR ?auto_27910 ) ( not ( = ?auto_27909 ?auto_27917 ) ) ( not ( = ?auto_27910 ?auto_27917 ) ) ( not ( = ?auto_27914 ?auto_27917 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27916 ?auto_27910 ?auto_27917 ?auto_27913 )
      ( MAKE-2CRATE ?auto_27914 ?auto_27909 ?auto_27910 )
      ( MAKE-1CRATE-VERIFY ?auto_27909 ?auto_27910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27918 - SURFACE
      ?auto_27919 - SURFACE
      ?auto_27920 - SURFACE
    )
    :vars
    (
      ?auto_27925 - HOIST
      ?auto_27922 - PLACE
      ?auto_27921 - TRUCK
      ?auto_27926 - PLACE
      ?auto_27923 - HOIST
      ?auto_27924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27925 ?auto_27922 ) ( SURFACE-AT ?auto_27919 ?auto_27922 ) ( CLEAR ?auto_27919 ) ( IS-CRATE ?auto_27920 ) ( not ( = ?auto_27919 ?auto_27920 ) ) ( AVAILABLE ?auto_27925 ) ( ON ?auto_27919 ?auto_27918 ) ( not ( = ?auto_27918 ?auto_27919 ) ) ( not ( = ?auto_27918 ?auto_27920 ) ) ( TRUCK-AT ?auto_27921 ?auto_27926 ) ( not ( = ?auto_27926 ?auto_27922 ) ) ( HOIST-AT ?auto_27923 ?auto_27926 ) ( not ( = ?auto_27925 ?auto_27923 ) ) ( AVAILABLE ?auto_27923 ) ( SURFACE-AT ?auto_27920 ?auto_27926 ) ( ON ?auto_27920 ?auto_27924 ) ( CLEAR ?auto_27920 ) ( not ( = ?auto_27919 ?auto_27924 ) ) ( not ( = ?auto_27920 ?auto_27924 ) ) ( not ( = ?auto_27918 ?auto_27924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27919 ?auto_27920 )
      ( MAKE-2CRATE-VERIFY ?auto_27918 ?auto_27919 ?auto_27920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27927 - SURFACE
      ?auto_27928 - SURFACE
    )
    :vars
    (
      ?auto_27930 - HOIST
      ?auto_27931 - PLACE
      ?auto_27934 - SURFACE
      ?auto_27929 - PLACE
      ?auto_27932 - HOIST
      ?auto_27933 - SURFACE
      ?auto_27935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27930 ?auto_27931 ) ( SURFACE-AT ?auto_27927 ?auto_27931 ) ( CLEAR ?auto_27927 ) ( IS-CRATE ?auto_27928 ) ( not ( = ?auto_27927 ?auto_27928 ) ) ( AVAILABLE ?auto_27930 ) ( ON ?auto_27927 ?auto_27934 ) ( not ( = ?auto_27934 ?auto_27927 ) ) ( not ( = ?auto_27934 ?auto_27928 ) ) ( not ( = ?auto_27929 ?auto_27931 ) ) ( HOIST-AT ?auto_27932 ?auto_27929 ) ( not ( = ?auto_27930 ?auto_27932 ) ) ( AVAILABLE ?auto_27932 ) ( SURFACE-AT ?auto_27928 ?auto_27929 ) ( ON ?auto_27928 ?auto_27933 ) ( CLEAR ?auto_27928 ) ( not ( = ?auto_27927 ?auto_27933 ) ) ( not ( = ?auto_27928 ?auto_27933 ) ) ( not ( = ?auto_27934 ?auto_27933 ) ) ( TRUCK-AT ?auto_27935 ?auto_27931 ) )
    :subtasks
    ( ( !DRIVE ?auto_27935 ?auto_27931 ?auto_27929 )
      ( MAKE-2CRATE ?auto_27934 ?auto_27927 ?auto_27928 )
      ( MAKE-1CRATE-VERIFY ?auto_27927 ?auto_27928 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27936 - SURFACE
      ?auto_27937 - SURFACE
      ?auto_27938 - SURFACE
    )
    :vars
    (
      ?auto_27940 - HOIST
      ?auto_27943 - PLACE
      ?auto_27939 - PLACE
      ?auto_27942 - HOIST
      ?auto_27944 - SURFACE
      ?auto_27941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27940 ?auto_27943 ) ( SURFACE-AT ?auto_27937 ?auto_27943 ) ( CLEAR ?auto_27937 ) ( IS-CRATE ?auto_27938 ) ( not ( = ?auto_27937 ?auto_27938 ) ) ( AVAILABLE ?auto_27940 ) ( ON ?auto_27937 ?auto_27936 ) ( not ( = ?auto_27936 ?auto_27937 ) ) ( not ( = ?auto_27936 ?auto_27938 ) ) ( not ( = ?auto_27939 ?auto_27943 ) ) ( HOIST-AT ?auto_27942 ?auto_27939 ) ( not ( = ?auto_27940 ?auto_27942 ) ) ( AVAILABLE ?auto_27942 ) ( SURFACE-AT ?auto_27938 ?auto_27939 ) ( ON ?auto_27938 ?auto_27944 ) ( CLEAR ?auto_27938 ) ( not ( = ?auto_27937 ?auto_27944 ) ) ( not ( = ?auto_27938 ?auto_27944 ) ) ( not ( = ?auto_27936 ?auto_27944 ) ) ( TRUCK-AT ?auto_27941 ?auto_27943 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27937 ?auto_27938 )
      ( MAKE-2CRATE-VERIFY ?auto_27936 ?auto_27937 ?auto_27938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27945 - SURFACE
      ?auto_27946 - SURFACE
    )
    :vars
    (
      ?auto_27951 - HOIST
      ?auto_27948 - PLACE
      ?auto_27947 - SURFACE
      ?auto_27952 - PLACE
      ?auto_27949 - HOIST
      ?auto_27953 - SURFACE
      ?auto_27950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27951 ?auto_27948 ) ( IS-CRATE ?auto_27946 ) ( not ( = ?auto_27945 ?auto_27946 ) ) ( not ( = ?auto_27947 ?auto_27945 ) ) ( not ( = ?auto_27947 ?auto_27946 ) ) ( not ( = ?auto_27952 ?auto_27948 ) ) ( HOIST-AT ?auto_27949 ?auto_27952 ) ( not ( = ?auto_27951 ?auto_27949 ) ) ( AVAILABLE ?auto_27949 ) ( SURFACE-AT ?auto_27946 ?auto_27952 ) ( ON ?auto_27946 ?auto_27953 ) ( CLEAR ?auto_27946 ) ( not ( = ?auto_27945 ?auto_27953 ) ) ( not ( = ?auto_27946 ?auto_27953 ) ) ( not ( = ?auto_27947 ?auto_27953 ) ) ( TRUCK-AT ?auto_27950 ?auto_27948 ) ( SURFACE-AT ?auto_27947 ?auto_27948 ) ( CLEAR ?auto_27947 ) ( LIFTING ?auto_27951 ?auto_27945 ) ( IS-CRATE ?auto_27945 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27947 ?auto_27945 )
      ( MAKE-2CRATE ?auto_27947 ?auto_27945 ?auto_27946 )
      ( MAKE-1CRATE-VERIFY ?auto_27945 ?auto_27946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27954 - SURFACE
      ?auto_27955 - SURFACE
      ?auto_27956 - SURFACE
    )
    :vars
    (
      ?auto_27958 - HOIST
      ?auto_27961 - PLACE
      ?auto_27962 - PLACE
      ?auto_27960 - HOIST
      ?auto_27957 - SURFACE
      ?auto_27959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27958 ?auto_27961 ) ( IS-CRATE ?auto_27956 ) ( not ( = ?auto_27955 ?auto_27956 ) ) ( not ( = ?auto_27954 ?auto_27955 ) ) ( not ( = ?auto_27954 ?auto_27956 ) ) ( not ( = ?auto_27962 ?auto_27961 ) ) ( HOIST-AT ?auto_27960 ?auto_27962 ) ( not ( = ?auto_27958 ?auto_27960 ) ) ( AVAILABLE ?auto_27960 ) ( SURFACE-AT ?auto_27956 ?auto_27962 ) ( ON ?auto_27956 ?auto_27957 ) ( CLEAR ?auto_27956 ) ( not ( = ?auto_27955 ?auto_27957 ) ) ( not ( = ?auto_27956 ?auto_27957 ) ) ( not ( = ?auto_27954 ?auto_27957 ) ) ( TRUCK-AT ?auto_27959 ?auto_27961 ) ( SURFACE-AT ?auto_27954 ?auto_27961 ) ( CLEAR ?auto_27954 ) ( LIFTING ?auto_27958 ?auto_27955 ) ( IS-CRATE ?auto_27955 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27955 ?auto_27956 )
      ( MAKE-2CRATE-VERIFY ?auto_27954 ?auto_27955 ?auto_27956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27963 - SURFACE
      ?auto_27964 - SURFACE
    )
    :vars
    (
      ?auto_27966 - HOIST
      ?auto_27968 - PLACE
      ?auto_27969 - SURFACE
      ?auto_27971 - PLACE
      ?auto_27965 - HOIST
      ?auto_27967 - SURFACE
      ?auto_27970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27966 ?auto_27968 ) ( IS-CRATE ?auto_27964 ) ( not ( = ?auto_27963 ?auto_27964 ) ) ( not ( = ?auto_27969 ?auto_27963 ) ) ( not ( = ?auto_27969 ?auto_27964 ) ) ( not ( = ?auto_27971 ?auto_27968 ) ) ( HOIST-AT ?auto_27965 ?auto_27971 ) ( not ( = ?auto_27966 ?auto_27965 ) ) ( AVAILABLE ?auto_27965 ) ( SURFACE-AT ?auto_27964 ?auto_27971 ) ( ON ?auto_27964 ?auto_27967 ) ( CLEAR ?auto_27964 ) ( not ( = ?auto_27963 ?auto_27967 ) ) ( not ( = ?auto_27964 ?auto_27967 ) ) ( not ( = ?auto_27969 ?auto_27967 ) ) ( TRUCK-AT ?auto_27970 ?auto_27968 ) ( SURFACE-AT ?auto_27969 ?auto_27968 ) ( CLEAR ?auto_27969 ) ( IS-CRATE ?auto_27963 ) ( AVAILABLE ?auto_27966 ) ( IN ?auto_27963 ?auto_27970 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27966 ?auto_27963 ?auto_27970 ?auto_27968 )
      ( MAKE-2CRATE ?auto_27969 ?auto_27963 ?auto_27964 )
      ( MAKE-1CRATE-VERIFY ?auto_27963 ?auto_27964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27972 - SURFACE
      ?auto_27973 - SURFACE
      ?auto_27974 - SURFACE
    )
    :vars
    (
      ?auto_27980 - HOIST
      ?auto_27979 - PLACE
      ?auto_27975 - PLACE
      ?auto_27976 - HOIST
      ?auto_27978 - SURFACE
      ?auto_27977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27980 ?auto_27979 ) ( IS-CRATE ?auto_27974 ) ( not ( = ?auto_27973 ?auto_27974 ) ) ( not ( = ?auto_27972 ?auto_27973 ) ) ( not ( = ?auto_27972 ?auto_27974 ) ) ( not ( = ?auto_27975 ?auto_27979 ) ) ( HOIST-AT ?auto_27976 ?auto_27975 ) ( not ( = ?auto_27980 ?auto_27976 ) ) ( AVAILABLE ?auto_27976 ) ( SURFACE-AT ?auto_27974 ?auto_27975 ) ( ON ?auto_27974 ?auto_27978 ) ( CLEAR ?auto_27974 ) ( not ( = ?auto_27973 ?auto_27978 ) ) ( not ( = ?auto_27974 ?auto_27978 ) ) ( not ( = ?auto_27972 ?auto_27978 ) ) ( TRUCK-AT ?auto_27977 ?auto_27979 ) ( SURFACE-AT ?auto_27972 ?auto_27979 ) ( CLEAR ?auto_27972 ) ( IS-CRATE ?auto_27973 ) ( AVAILABLE ?auto_27980 ) ( IN ?auto_27973 ?auto_27977 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27973 ?auto_27974 )
      ( MAKE-2CRATE-VERIFY ?auto_27972 ?auto_27973 ?auto_27974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27981 - SURFACE
      ?auto_27982 - SURFACE
    )
    :vars
    (
      ?auto_27985 - HOIST
      ?auto_27986 - PLACE
      ?auto_27988 - SURFACE
      ?auto_27983 - PLACE
      ?auto_27987 - HOIST
      ?auto_27989 - SURFACE
      ?auto_27984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27985 ?auto_27986 ) ( IS-CRATE ?auto_27982 ) ( not ( = ?auto_27981 ?auto_27982 ) ) ( not ( = ?auto_27988 ?auto_27981 ) ) ( not ( = ?auto_27988 ?auto_27982 ) ) ( not ( = ?auto_27983 ?auto_27986 ) ) ( HOIST-AT ?auto_27987 ?auto_27983 ) ( not ( = ?auto_27985 ?auto_27987 ) ) ( AVAILABLE ?auto_27987 ) ( SURFACE-AT ?auto_27982 ?auto_27983 ) ( ON ?auto_27982 ?auto_27989 ) ( CLEAR ?auto_27982 ) ( not ( = ?auto_27981 ?auto_27989 ) ) ( not ( = ?auto_27982 ?auto_27989 ) ) ( not ( = ?auto_27988 ?auto_27989 ) ) ( SURFACE-AT ?auto_27988 ?auto_27986 ) ( CLEAR ?auto_27988 ) ( IS-CRATE ?auto_27981 ) ( AVAILABLE ?auto_27985 ) ( IN ?auto_27981 ?auto_27984 ) ( TRUCK-AT ?auto_27984 ?auto_27983 ) )
    :subtasks
    ( ( !DRIVE ?auto_27984 ?auto_27983 ?auto_27986 )
      ( MAKE-2CRATE ?auto_27988 ?auto_27981 ?auto_27982 )
      ( MAKE-1CRATE-VERIFY ?auto_27981 ?auto_27982 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27990 - SURFACE
      ?auto_27991 - SURFACE
      ?auto_27992 - SURFACE
    )
    :vars
    (
      ?auto_27995 - HOIST
      ?auto_27993 - PLACE
      ?auto_27997 - PLACE
      ?auto_27994 - HOIST
      ?auto_27996 - SURFACE
      ?auto_27998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27995 ?auto_27993 ) ( IS-CRATE ?auto_27992 ) ( not ( = ?auto_27991 ?auto_27992 ) ) ( not ( = ?auto_27990 ?auto_27991 ) ) ( not ( = ?auto_27990 ?auto_27992 ) ) ( not ( = ?auto_27997 ?auto_27993 ) ) ( HOIST-AT ?auto_27994 ?auto_27997 ) ( not ( = ?auto_27995 ?auto_27994 ) ) ( AVAILABLE ?auto_27994 ) ( SURFACE-AT ?auto_27992 ?auto_27997 ) ( ON ?auto_27992 ?auto_27996 ) ( CLEAR ?auto_27992 ) ( not ( = ?auto_27991 ?auto_27996 ) ) ( not ( = ?auto_27992 ?auto_27996 ) ) ( not ( = ?auto_27990 ?auto_27996 ) ) ( SURFACE-AT ?auto_27990 ?auto_27993 ) ( CLEAR ?auto_27990 ) ( IS-CRATE ?auto_27991 ) ( AVAILABLE ?auto_27995 ) ( IN ?auto_27991 ?auto_27998 ) ( TRUCK-AT ?auto_27998 ?auto_27997 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27991 ?auto_27992 )
      ( MAKE-2CRATE-VERIFY ?auto_27990 ?auto_27991 ?auto_27992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27999 - SURFACE
      ?auto_28000 - SURFACE
    )
    :vars
    (
      ?auto_28006 - HOIST
      ?auto_28003 - PLACE
      ?auto_28007 - SURFACE
      ?auto_28005 - PLACE
      ?auto_28002 - HOIST
      ?auto_28001 - SURFACE
      ?auto_28004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28006 ?auto_28003 ) ( IS-CRATE ?auto_28000 ) ( not ( = ?auto_27999 ?auto_28000 ) ) ( not ( = ?auto_28007 ?auto_27999 ) ) ( not ( = ?auto_28007 ?auto_28000 ) ) ( not ( = ?auto_28005 ?auto_28003 ) ) ( HOIST-AT ?auto_28002 ?auto_28005 ) ( not ( = ?auto_28006 ?auto_28002 ) ) ( SURFACE-AT ?auto_28000 ?auto_28005 ) ( ON ?auto_28000 ?auto_28001 ) ( CLEAR ?auto_28000 ) ( not ( = ?auto_27999 ?auto_28001 ) ) ( not ( = ?auto_28000 ?auto_28001 ) ) ( not ( = ?auto_28007 ?auto_28001 ) ) ( SURFACE-AT ?auto_28007 ?auto_28003 ) ( CLEAR ?auto_28007 ) ( IS-CRATE ?auto_27999 ) ( AVAILABLE ?auto_28006 ) ( TRUCK-AT ?auto_28004 ?auto_28005 ) ( LIFTING ?auto_28002 ?auto_27999 ) )
    :subtasks
    ( ( !LOAD ?auto_28002 ?auto_27999 ?auto_28004 ?auto_28005 )
      ( MAKE-2CRATE ?auto_28007 ?auto_27999 ?auto_28000 )
      ( MAKE-1CRATE-VERIFY ?auto_27999 ?auto_28000 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28008 - SURFACE
      ?auto_28009 - SURFACE
      ?auto_28010 - SURFACE
    )
    :vars
    (
      ?auto_28016 - HOIST
      ?auto_28013 - PLACE
      ?auto_28012 - PLACE
      ?auto_28011 - HOIST
      ?auto_28014 - SURFACE
      ?auto_28015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28016 ?auto_28013 ) ( IS-CRATE ?auto_28010 ) ( not ( = ?auto_28009 ?auto_28010 ) ) ( not ( = ?auto_28008 ?auto_28009 ) ) ( not ( = ?auto_28008 ?auto_28010 ) ) ( not ( = ?auto_28012 ?auto_28013 ) ) ( HOIST-AT ?auto_28011 ?auto_28012 ) ( not ( = ?auto_28016 ?auto_28011 ) ) ( SURFACE-AT ?auto_28010 ?auto_28012 ) ( ON ?auto_28010 ?auto_28014 ) ( CLEAR ?auto_28010 ) ( not ( = ?auto_28009 ?auto_28014 ) ) ( not ( = ?auto_28010 ?auto_28014 ) ) ( not ( = ?auto_28008 ?auto_28014 ) ) ( SURFACE-AT ?auto_28008 ?auto_28013 ) ( CLEAR ?auto_28008 ) ( IS-CRATE ?auto_28009 ) ( AVAILABLE ?auto_28016 ) ( TRUCK-AT ?auto_28015 ?auto_28012 ) ( LIFTING ?auto_28011 ?auto_28009 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28009 ?auto_28010 )
      ( MAKE-2CRATE-VERIFY ?auto_28008 ?auto_28009 ?auto_28010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28017 - SURFACE
      ?auto_28018 - SURFACE
    )
    :vars
    (
      ?auto_28019 - HOIST
      ?auto_28020 - PLACE
      ?auto_28024 - SURFACE
      ?auto_28025 - PLACE
      ?auto_28022 - HOIST
      ?auto_28021 - SURFACE
      ?auto_28023 - TRUCK
      ?auto_28026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28019 ?auto_28020 ) ( IS-CRATE ?auto_28018 ) ( not ( = ?auto_28017 ?auto_28018 ) ) ( not ( = ?auto_28024 ?auto_28017 ) ) ( not ( = ?auto_28024 ?auto_28018 ) ) ( not ( = ?auto_28025 ?auto_28020 ) ) ( HOIST-AT ?auto_28022 ?auto_28025 ) ( not ( = ?auto_28019 ?auto_28022 ) ) ( SURFACE-AT ?auto_28018 ?auto_28025 ) ( ON ?auto_28018 ?auto_28021 ) ( CLEAR ?auto_28018 ) ( not ( = ?auto_28017 ?auto_28021 ) ) ( not ( = ?auto_28018 ?auto_28021 ) ) ( not ( = ?auto_28024 ?auto_28021 ) ) ( SURFACE-AT ?auto_28024 ?auto_28020 ) ( CLEAR ?auto_28024 ) ( IS-CRATE ?auto_28017 ) ( AVAILABLE ?auto_28019 ) ( TRUCK-AT ?auto_28023 ?auto_28025 ) ( AVAILABLE ?auto_28022 ) ( SURFACE-AT ?auto_28017 ?auto_28025 ) ( ON ?auto_28017 ?auto_28026 ) ( CLEAR ?auto_28017 ) ( not ( = ?auto_28017 ?auto_28026 ) ) ( not ( = ?auto_28018 ?auto_28026 ) ) ( not ( = ?auto_28024 ?auto_28026 ) ) ( not ( = ?auto_28021 ?auto_28026 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28022 ?auto_28017 ?auto_28026 ?auto_28025 )
      ( MAKE-2CRATE ?auto_28024 ?auto_28017 ?auto_28018 )
      ( MAKE-1CRATE-VERIFY ?auto_28017 ?auto_28018 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28027 - SURFACE
      ?auto_28028 - SURFACE
      ?auto_28029 - SURFACE
    )
    :vars
    (
      ?auto_28035 - HOIST
      ?auto_28033 - PLACE
      ?auto_28031 - PLACE
      ?auto_28030 - HOIST
      ?auto_28034 - SURFACE
      ?auto_28036 - TRUCK
      ?auto_28032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28035 ?auto_28033 ) ( IS-CRATE ?auto_28029 ) ( not ( = ?auto_28028 ?auto_28029 ) ) ( not ( = ?auto_28027 ?auto_28028 ) ) ( not ( = ?auto_28027 ?auto_28029 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) ( HOIST-AT ?auto_28030 ?auto_28031 ) ( not ( = ?auto_28035 ?auto_28030 ) ) ( SURFACE-AT ?auto_28029 ?auto_28031 ) ( ON ?auto_28029 ?auto_28034 ) ( CLEAR ?auto_28029 ) ( not ( = ?auto_28028 ?auto_28034 ) ) ( not ( = ?auto_28029 ?auto_28034 ) ) ( not ( = ?auto_28027 ?auto_28034 ) ) ( SURFACE-AT ?auto_28027 ?auto_28033 ) ( CLEAR ?auto_28027 ) ( IS-CRATE ?auto_28028 ) ( AVAILABLE ?auto_28035 ) ( TRUCK-AT ?auto_28036 ?auto_28031 ) ( AVAILABLE ?auto_28030 ) ( SURFACE-AT ?auto_28028 ?auto_28031 ) ( ON ?auto_28028 ?auto_28032 ) ( CLEAR ?auto_28028 ) ( not ( = ?auto_28028 ?auto_28032 ) ) ( not ( = ?auto_28029 ?auto_28032 ) ) ( not ( = ?auto_28027 ?auto_28032 ) ) ( not ( = ?auto_28034 ?auto_28032 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28028 ?auto_28029 )
      ( MAKE-2CRATE-VERIFY ?auto_28027 ?auto_28028 ?auto_28029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28037 - SURFACE
      ?auto_28038 - SURFACE
    )
    :vars
    (
      ?auto_28043 - HOIST
      ?auto_28046 - PLACE
      ?auto_28041 - SURFACE
      ?auto_28040 - PLACE
      ?auto_28045 - HOIST
      ?auto_28039 - SURFACE
      ?auto_28042 - SURFACE
      ?auto_28044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28043 ?auto_28046 ) ( IS-CRATE ?auto_28038 ) ( not ( = ?auto_28037 ?auto_28038 ) ) ( not ( = ?auto_28041 ?auto_28037 ) ) ( not ( = ?auto_28041 ?auto_28038 ) ) ( not ( = ?auto_28040 ?auto_28046 ) ) ( HOIST-AT ?auto_28045 ?auto_28040 ) ( not ( = ?auto_28043 ?auto_28045 ) ) ( SURFACE-AT ?auto_28038 ?auto_28040 ) ( ON ?auto_28038 ?auto_28039 ) ( CLEAR ?auto_28038 ) ( not ( = ?auto_28037 ?auto_28039 ) ) ( not ( = ?auto_28038 ?auto_28039 ) ) ( not ( = ?auto_28041 ?auto_28039 ) ) ( SURFACE-AT ?auto_28041 ?auto_28046 ) ( CLEAR ?auto_28041 ) ( IS-CRATE ?auto_28037 ) ( AVAILABLE ?auto_28043 ) ( AVAILABLE ?auto_28045 ) ( SURFACE-AT ?auto_28037 ?auto_28040 ) ( ON ?auto_28037 ?auto_28042 ) ( CLEAR ?auto_28037 ) ( not ( = ?auto_28037 ?auto_28042 ) ) ( not ( = ?auto_28038 ?auto_28042 ) ) ( not ( = ?auto_28041 ?auto_28042 ) ) ( not ( = ?auto_28039 ?auto_28042 ) ) ( TRUCK-AT ?auto_28044 ?auto_28046 ) )
    :subtasks
    ( ( !DRIVE ?auto_28044 ?auto_28046 ?auto_28040 )
      ( MAKE-2CRATE ?auto_28041 ?auto_28037 ?auto_28038 )
      ( MAKE-1CRATE-VERIFY ?auto_28037 ?auto_28038 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28047 - SURFACE
      ?auto_28048 - SURFACE
      ?auto_28049 - SURFACE
    )
    :vars
    (
      ?auto_28050 - HOIST
      ?auto_28051 - PLACE
      ?auto_28054 - PLACE
      ?auto_28053 - HOIST
      ?auto_28052 - SURFACE
      ?auto_28055 - SURFACE
      ?auto_28056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28050 ?auto_28051 ) ( IS-CRATE ?auto_28049 ) ( not ( = ?auto_28048 ?auto_28049 ) ) ( not ( = ?auto_28047 ?auto_28048 ) ) ( not ( = ?auto_28047 ?auto_28049 ) ) ( not ( = ?auto_28054 ?auto_28051 ) ) ( HOIST-AT ?auto_28053 ?auto_28054 ) ( not ( = ?auto_28050 ?auto_28053 ) ) ( SURFACE-AT ?auto_28049 ?auto_28054 ) ( ON ?auto_28049 ?auto_28052 ) ( CLEAR ?auto_28049 ) ( not ( = ?auto_28048 ?auto_28052 ) ) ( not ( = ?auto_28049 ?auto_28052 ) ) ( not ( = ?auto_28047 ?auto_28052 ) ) ( SURFACE-AT ?auto_28047 ?auto_28051 ) ( CLEAR ?auto_28047 ) ( IS-CRATE ?auto_28048 ) ( AVAILABLE ?auto_28050 ) ( AVAILABLE ?auto_28053 ) ( SURFACE-AT ?auto_28048 ?auto_28054 ) ( ON ?auto_28048 ?auto_28055 ) ( CLEAR ?auto_28048 ) ( not ( = ?auto_28048 ?auto_28055 ) ) ( not ( = ?auto_28049 ?auto_28055 ) ) ( not ( = ?auto_28047 ?auto_28055 ) ) ( not ( = ?auto_28052 ?auto_28055 ) ) ( TRUCK-AT ?auto_28056 ?auto_28051 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28048 ?auto_28049 )
      ( MAKE-2CRATE-VERIFY ?auto_28047 ?auto_28048 ?auto_28049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28076 - SURFACE
      ?auto_28077 - SURFACE
      ?auto_28078 - SURFACE
      ?auto_28075 - SURFACE
    )
    :vars
    (
      ?auto_28079 - HOIST
      ?auto_28080 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28079 ?auto_28080 ) ( SURFACE-AT ?auto_28078 ?auto_28080 ) ( CLEAR ?auto_28078 ) ( LIFTING ?auto_28079 ?auto_28075 ) ( IS-CRATE ?auto_28075 ) ( not ( = ?auto_28078 ?auto_28075 ) ) ( ON ?auto_28077 ?auto_28076 ) ( ON ?auto_28078 ?auto_28077 ) ( not ( = ?auto_28076 ?auto_28077 ) ) ( not ( = ?auto_28076 ?auto_28078 ) ) ( not ( = ?auto_28076 ?auto_28075 ) ) ( not ( = ?auto_28077 ?auto_28078 ) ) ( not ( = ?auto_28077 ?auto_28075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28078 ?auto_28075 )
      ( MAKE-3CRATE-VERIFY ?auto_28076 ?auto_28077 ?auto_28078 ?auto_28075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28093 - SURFACE
      ?auto_28094 - SURFACE
      ?auto_28095 - SURFACE
      ?auto_28092 - SURFACE
    )
    :vars
    (
      ?auto_28098 - HOIST
      ?auto_28097 - PLACE
      ?auto_28096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28098 ?auto_28097 ) ( SURFACE-AT ?auto_28095 ?auto_28097 ) ( CLEAR ?auto_28095 ) ( IS-CRATE ?auto_28092 ) ( not ( = ?auto_28095 ?auto_28092 ) ) ( TRUCK-AT ?auto_28096 ?auto_28097 ) ( AVAILABLE ?auto_28098 ) ( IN ?auto_28092 ?auto_28096 ) ( ON ?auto_28095 ?auto_28094 ) ( not ( = ?auto_28094 ?auto_28095 ) ) ( not ( = ?auto_28094 ?auto_28092 ) ) ( ON ?auto_28094 ?auto_28093 ) ( not ( = ?auto_28093 ?auto_28094 ) ) ( not ( = ?auto_28093 ?auto_28095 ) ) ( not ( = ?auto_28093 ?auto_28092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28094 ?auto_28095 ?auto_28092 )
      ( MAKE-3CRATE-VERIFY ?auto_28093 ?auto_28094 ?auto_28095 ?auto_28092 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28114 - SURFACE
      ?auto_28115 - SURFACE
      ?auto_28116 - SURFACE
      ?auto_28113 - SURFACE
    )
    :vars
    (
      ?auto_28120 - HOIST
      ?auto_28117 - PLACE
      ?auto_28118 - TRUCK
      ?auto_28119 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28120 ?auto_28117 ) ( SURFACE-AT ?auto_28116 ?auto_28117 ) ( CLEAR ?auto_28116 ) ( IS-CRATE ?auto_28113 ) ( not ( = ?auto_28116 ?auto_28113 ) ) ( AVAILABLE ?auto_28120 ) ( IN ?auto_28113 ?auto_28118 ) ( ON ?auto_28116 ?auto_28115 ) ( not ( = ?auto_28115 ?auto_28116 ) ) ( not ( = ?auto_28115 ?auto_28113 ) ) ( TRUCK-AT ?auto_28118 ?auto_28119 ) ( not ( = ?auto_28119 ?auto_28117 ) ) ( ON ?auto_28115 ?auto_28114 ) ( not ( = ?auto_28114 ?auto_28115 ) ) ( not ( = ?auto_28114 ?auto_28116 ) ) ( not ( = ?auto_28114 ?auto_28113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28115 ?auto_28116 ?auto_28113 )
      ( MAKE-3CRATE-VERIFY ?auto_28114 ?auto_28115 ?auto_28116 ?auto_28113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28138 - SURFACE
      ?auto_28139 - SURFACE
      ?auto_28140 - SURFACE
      ?auto_28137 - SURFACE
    )
    :vars
    (
      ?auto_28145 - HOIST
      ?auto_28141 - PLACE
      ?auto_28143 - TRUCK
      ?auto_28144 - PLACE
      ?auto_28142 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28145 ?auto_28141 ) ( SURFACE-AT ?auto_28140 ?auto_28141 ) ( CLEAR ?auto_28140 ) ( IS-CRATE ?auto_28137 ) ( not ( = ?auto_28140 ?auto_28137 ) ) ( AVAILABLE ?auto_28145 ) ( ON ?auto_28140 ?auto_28139 ) ( not ( = ?auto_28139 ?auto_28140 ) ) ( not ( = ?auto_28139 ?auto_28137 ) ) ( TRUCK-AT ?auto_28143 ?auto_28144 ) ( not ( = ?auto_28144 ?auto_28141 ) ) ( HOIST-AT ?auto_28142 ?auto_28144 ) ( LIFTING ?auto_28142 ?auto_28137 ) ( not ( = ?auto_28145 ?auto_28142 ) ) ( ON ?auto_28139 ?auto_28138 ) ( not ( = ?auto_28138 ?auto_28139 ) ) ( not ( = ?auto_28138 ?auto_28140 ) ) ( not ( = ?auto_28138 ?auto_28137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28139 ?auto_28140 ?auto_28137 )
      ( MAKE-3CRATE-VERIFY ?auto_28138 ?auto_28139 ?auto_28140 ?auto_28137 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28165 - SURFACE
      ?auto_28166 - SURFACE
      ?auto_28167 - SURFACE
      ?auto_28164 - SURFACE
    )
    :vars
    (
      ?auto_28171 - HOIST
      ?auto_28169 - PLACE
      ?auto_28170 - TRUCK
      ?auto_28168 - PLACE
      ?auto_28172 - HOIST
      ?auto_28173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28171 ?auto_28169 ) ( SURFACE-AT ?auto_28167 ?auto_28169 ) ( CLEAR ?auto_28167 ) ( IS-CRATE ?auto_28164 ) ( not ( = ?auto_28167 ?auto_28164 ) ) ( AVAILABLE ?auto_28171 ) ( ON ?auto_28167 ?auto_28166 ) ( not ( = ?auto_28166 ?auto_28167 ) ) ( not ( = ?auto_28166 ?auto_28164 ) ) ( TRUCK-AT ?auto_28170 ?auto_28168 ) ( not ( = ?auto_28168 ?auto_28169 ) ) ( HOIST-AT ?auto_28172 ?auto_28168 ) ( not ( = ?auto_28171 ?auto_28172 ) ) ( AVAILABLE ?auto_28172 ) ( SURFACE-AT ?auto_28164 ?auto_28168 ) ( ON ?auto_28164 ?auto_28173 ) ( CLEAR ?auto_28164 ) ( not ( = ?auto_28167 ?auto_28173 ) ) ( not ( = ?auto_28164 ?auto_28173 ) ) ( not ( = ?auto_28166 ?auto_28173 ) ) ( ON ?auto_28166 ?auto_28165 ) ( not ( = ?auto_28165 ?auto_28166 ) ) ( not ( = ?auto_28165 ?auto_28167 ) ) ( not ( = ?auto_28165 ?auto_28164 ) ) ( not ( = ?auto_28165 ?auto_28173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28166 ?auto_28167 ?auto_28164 )
      ( MAKE-3CRATE-VERIFY ?auto_28165 ?auto_28166 ?auto_28167 ?auto_28164 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28193 - SURFACE
      ?auto_28194 - SURFACE
      ?auto_28195 - SURFACE
      ?auto_28192 - SURFACE
    )
    :vars
    (
      ?auto_28199 - HOIST
      ?auto_28198 - PLACE
      ?auto_28196 - PLACE
      ?auto_28197 - HOIST
      ?auto_28201 - SURFACE
      ?auto_28200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28199 ?auto_28198 ) ( SURFACE-AT ?auto_28195 ?auto_28198 ) ( CLEAR ?auto_28195 ) ( IS-CRATE ?auto_28192 ) ( not ( = ?auto_28195 ?auto_28192 ) ) ( AVAILABLE ?auto_28199 ) ( ON ?auto_28195 ?auto_28194 ) ( not ( = ?auto_28194 ?auto_28195 ) ) ( not ( = ?auto_28194 ?auto_28192 ) ) ( not ( = ?auto_28196 ?auto_28198 ) ) ( HOIST-AT ?auto_28197 ?auto_28196 ) ( not ( = ?auto_28199 ?auto_28197 ) ) ( AVAILABLE ?auto_28197 ) ( SURFACE-AT ?auto_28192 ?auto_28196 ) ( ON ?auto_28192 ?auto_28201 ) ( CLEAR ?auto_28192 ) ( not ( = ?auto_28195 ?auto_28201 ) ) ( not ( = ?auto_28192 ?auto_28201 ) ) ( not ( = ?auto_28194 ?auto_28201 ) ) ( TRUCK-AT ?auto_28200 ?auto_28198 ) ( ON ?auto_28194 ?auto_28193 ) ( not ( = ?auto_28193 ?auto_28194 ) ) ( not ( = ?auto_28193 ?auto_28195 ) ) ( not ( = ?auto_28193 ?auto_28192 ) ) ( not ( = ?auto_28193 ?auto_28201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28194 ?auto_28195 ?auto_28192 )
      ( MAKE-3CRATE-VERIFY ?auto_28193 ?auto_28194 ?auto_28195 ?auto_28192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28221 - SURFACE
      ?auto_28222 - SURFACE
      ?auto_28223 - SURFACE
      ?auto_28220 - SURFACE
    )
    :vars
    (
      ?auto_28224 - HOIST
      ?auto_28229 - PLACE
      ?auto_28226 - PLACE
      ?auto_28227 - HOIST
      ?auto_28228 - SURFACE
      ?auto_28225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28224 ?auto_28229 ) ( IS-CRATE ?auto_28220 ) ( not ( = ?auto_28223 ?auto_28220 ) ) ( not ( = ?auto_28222 ?auto_28223 ) ) ( not ( = ?auto_28222 ?auto_28220 ) ) ( not ( = ?auto_28226 ?auto_28229 ) ) ( HOIST-AT ?auto_28227 ?auto_28226 ) ( not ( = ?auto_28224 ?auto_28227 ) ) ( AVAILABLE ?auto_28227 ) ( SURFACE-AT ?auto_28220 ?auto_28226 ) ( ON ?auto_28220 ?auto_28228 ) ( CLEAR ?auto_28220 ) ( not ( = ?auto_28223 ?auto_28228 ) ) ( not ( = ?auto_28220 ?auto_28228 ) ) ( not ( = ?auto_28222 ?auto_28228 ) ) ( TRUCK-AT ?auto_28225 ?auto_28229 ) ( SURFACE-AT ?auto_28222 ?auto_28229 ) ( CLEAR ?auto_28222 ) ( LIFTING ?auto_28224 ?auto_28223 ) ( IS-CRATE ?auto_28223 ) ( ON ?auto_28222 ?auto_28221 ) ( not ( = ?auto_28221 ?auto_28222 ) ) ( not ( = ?auto_28221 ?auto_28223 ) ) ( not ( = ?auto_28221 ?auto_28220 ) ) ( not ( = ?auto_28221 ?auto_28228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28222 ?auto_28223 ?auto_28220 )
      ( MAKE-3CRATE-VERIFY ?auto_28221 ?auto_28222 ?auto_28223 ?auto_28220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28249 - SURFACE
      ?auto_28250 - SURFACE
      ?auto_28251 - SURFACE
      ?auto_28248 - SURFACE
    )
    :vars
    (
      ?auto_28253 - HOIST
      ?auto_28254 - PLACE
      ?auto_28257 - PLACE
      ?auto_28252 - HOIST
      ?auto_28255 - SURFACE
      ?auto_28256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28253 ?auto_28254 ) ( IS-CRATE ?auto_28248 ) ( not ( = ?auto_28251 ?auto_28248 ) ) ( not ( = ?auto_28250 ?auto_28251 ) ) ( not ( = ?auto_28250 ?auto_28248 ) ) ( not ( = ?auto_28257 ?auto_28254 ) ) ( HOIST-AT ?auto_28252 ?auto_28257 ) ( not ( = ?auto_28253 ?auto_28252 ) ) ( AVAILABLE ?auto_28252 ) ( SURFACE-AT ?auto_28248 ?auto_28257 ) ( ON ?auto_28248 ?auto_28255 ) ( CLEAR ?auto_28248 ) ( not ( = ?auto_28251 ?auto_28255 ) ) ( not ( = ?auto_28248 ?auto_28255 ) ) ( not ( = ?auto_28250 ?auto_28255 ) ) ( TRUCK-AT ?auto_28256 ?auto_28254 ) ( SURFACE-AT ?auto_28250 ?auto_28254 ) ( CLEAR ?auto_28250 ) ( IS-CRATE ?auto_28251 ) ( AVAILABLE ?auto_28253 ) ( IN ?auto_28251 ?auto_28256 ) ( ON ?auto_28250 ?auto_28249 ) ( not ( = ?auto_28249 ?auto_28250 ) ) ( not ( = ?auto_28249 ?auto_28251 ) ) ( not ( = ?auto_28249 ?auto_28248 ) ) ( not ( = ?auto_28249 ?auto_28255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28250 ?auto_28251 ?auto_28248 )
      ( MAKE-3CRATE-VERIFY ?auto_28249 ?auto_28250 ?auto_28251 ?auto_28248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28327 - SURFACE
      ?auto_28328 - SURFACE
    )
    :vars
    (
      ?auto_28330 - HOIST
      ?auto_28329 - PLACE
      ?auto_28332 - SURFACE
      ?auto_28334 - PLACE
      ?auto_28331 - HOIST
      ?auto_28335 - SURFACE
      ?auto_28333 - TRUCK
      ?auto_28336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28330 ?auto_28329 ) ( SURFACE-AT ?auto_28327 ?auto_28329 ) ( CLEAR ?auto_28327 ) ( IS-CRATE ?auto_28328 ) ( not ( = ?auto_28327 ?auto_28328 ) ) ( AVAILABLE ?auto_28330 ) ( ON ?auto_28327 ?auto_28332 ) ( not ( = ?auto_28332 ?auto_28327 ) ) ( not ( = ?auto_28332 ?auto_28328 ) ) ( not ( = ?auto_28334 ?auto_28329 ) ) ( HOIST-AT ?auto_28331 ?auto_28334 ) ( not ( = ?auto_28330 ?auto_28331 ) ) ( AVAILABLE ?auto_28331 ) ( SURFACE-AT ?auto_28328 ?auto_28334 ) ( ON ?auto_28328 ?auto_28335 ) ( CLEAR ?auto_28328 ) ( not ( = ?auto_28327 ?auto_28335 ) ) ( not ( = ?auto_28328 ?auto_28335 ) ) ( not ( = ?auto_28332 ?auto_28335 ) ) ( TRUCK-AT ?auto_28333 ?auto_28336 ) ( not ( = ?auto_28336 ?auto_28329 ) ) ( not ( = ?auto_28334 ?auto_28336 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28333 ?auto_28336 ?auto_28329 )
      ( MAKE-1CRATE ?auto_28327 ?auto_28328 )
      ( MAKE-1CRATE-VERIFY ?auto_28327 ?auto_28328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28433 - SURFACE
      ?auto_28434 - SURFACE
    )
    :vars
    (
      ?auto_28439 - HOIST
      ?auto_28435 - PLACE
      ?auto_28440 - SURFACE
      ?auto_28437 - PLACE
      ?auto_28441 - HOIST
      ?auto_28436 - SURFACE
      ?auto_28438 - TRUCK
      ?auto_28442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28439 ?auto_28435 ) ( SURFACE-AT ?auto_28433 ?auto_28435 ) ( CLEAR ?auto_28433 ) ( IS-CRATE ?auto_28434 ) ( not ( = ?auto_28433 ?auto_28434 ) ) ( ON ?auto_28433 ?auto_28440 ) ( not ( = ?auto_28440 ?auto_28433 ) ) ( not ( = ?auto_28440 ?auto_28434 ) ) ( not ( = ?auto_28437 ?auto_28435 ) ) ( HOIST-AT ?auto_28441 ?auto_28437 ) ( not ( = ?auto_28439 ?auto_28441 ) ) ( AVAILABLE ?auto_28441 ) ( SURFACE-AT ?auto_28434 ?auto_28437 ) ( ON ?auto_28434 ?auto_28436 ) ( CLEAR ?auto_28434 ) ( not ( = ?auto_28433 ?auto_28436 ) ) ( not ( = ?auto_28434 ?auto_28436 ) ) ( not ( = ?auto_28440 ?auto_28436 ) ) ( TRUCK-AT ?auto_28438 ?auto_28435 ) ( LIFTING ?auto_28439 ?auto_28442 ) ( IS-CRATE ?auto_28442 ) ( not ( = ?auto_28433 ?auto_28442 ) ) ( not ( = ?auto_28434 ?auto_28442 ) ) ( not ( = ?auto_28440 ?auto_28442 ) ) ( not ( = ?auto_28436 ?auto_28442 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28439 ?auto_28442 ?auto_28438 ?auto_28435 )
      ( MAKE-1CRATE ?auto_28433 ?auto_28434 )
      ( MAKE-1CRATE-VERIFY ?auto_28433 ?auto_28434 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28542 - SURFACE
      ?auto_28543 - SURFACE
      ?auto_28544 - SURFACE
      ?auto_28541 - SURFACE
      ?auto_28545 - SURFACE
    )
    :vars
    (
      ?auto_28547 - HOIST
      ?auto_28546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28547 ?auto_28546 ) ( SURFACE-AT ?auto_28541 ?auto_28546 ) ( CLEAR ?auto_28541 ) ( LIFTING ?auto_28547 ?auto_28545 ) ( IS-CRATE ?auto_28545 ) ( not ( = ?auto_28541 ?auto_28545 ) ) ( ON ?auto_28543 ?auto_28542 ) ( ON ?auto_28544 ?auto_28543 ) ( ON ?auto_28541 ?auto_28544 ) ( not ( = ?auto_28542 ?auto_28543 ) ) ( not ( = ?auto_28542 ?auto_28544 ) ) ( not ( = ?auto_28542 ?auto_28541 ) ) ( not ( = ?auto_28542 ?auto_28545 ) ) ( not ( = ?auto_28543 ?auto_28544 ) ) ( not ( = ?auto_28543 ?auto_28541 ) ) ( not ( = ?auto_28543 ?auto_28545 ) ) ( not ( = ?auto_28544 ?auto_28541 ) ) ( not ( = ?auto_28544 ?auto_28545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28541 ?auto_28545 )
      ( MAKE-4CRATE-VERIFY ?auto_28542 ?auto_28543 ?auto_28544 ?auto_28541 ?auto_28545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28567 - SURFACE
      ?auto_28568 - SURFACE
      ?auto_28569 - SURFACE
      ?auto_28566 - SURFACE
      ?auto_28570 - SURFACE
    )
    :vars
    (
      ?auto_28571 - HOIST
      ?auto_28573 - PLACE
      ?auto_28572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28571 ?auto_28573 ) ( SURFACE-AT ?auto_28566 ?auto_28573 ) ( CLEAR ?auto_28566 ) ( IS-CRATE ?auto_28570 ) ( not ( = ?auto_28566 ?auto_28570 ) ) ( TRUCK-AT ?auto_28572 ?auto_28573 ) ( AVAILABLE ?auto_28571 ) ( IN ?auto_28570 ?auto_28572 ) ( ON ?auto_28566 ?auto_28569 ) ( not ( = ?auto_28569 ?auto_28566 ) ) ( not ( = ?auto_28569 ?auto_28570 ) ) ( ON ?auto_28568 ?auto_28567 ) ( ON ?auto_28569 ?auto_28568 ) ( not ( = ?auto_28567 ?auto_28568 ) ) ( not ( = ?auto_28567 ?auto_28569 ) ) ( not ( = ?auto_28567 ?auto_28566 ) ) ( not ( = ?auto_28567 ?auto_28570 ) ) ( not ( = ?auto_28568 ?auto_28569 ) ) ( not ( = ?auto_28568 ?auto_28566 ) ) ( not ( = ?auto_28568 ?auto_28570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28569 ?auto_28566 ?auto_28570 )
      ( MAKE-4CRATE-VERIFY ?auto_28567 ?auto_28568 ?auto_28569 ?auto_28566 ?auto_28570 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28597 - SURFACE
      ?auto_28598 - SURFACE
      ?auto_28599 - SURFACE
      ?auto_28596 - SURFACE
      ?auto_28600 - SURFACE
    )
    :vars
    (
      ?auto_28603 - HOIST
      ?auto_28601 - PLACE
      ?auto_28604 - TRUCK
      ?auto_28602 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28603 ?auto_28601 ) ( SURFACE-AT ?auto_28596 ?auto_28601 ) ( CLEAR ?auto_28596 ) ( IS-CRATE ?auto_28600 ) ( not ( = ?auto_28596 ?auto_28600 ) ) ( AVAILABLE ?auto_28603 ) ( IN ?auto_28600 ?auto_28604 ) ( ON ?auto_28596 ?auto_28599 ) ( not ( = ?auto_28599 ?auto_28596 ) ) ( not ( = ?auto_28599 ?auto_28600 ) ) ( TRUCK-AT ?auto_28604 ?auto_28602 ) ( not ( = ?auto_28602 ?auto_28601 ) ) ( ON ?auto_28598 ?auto_28597 ) ( ON ?auto_28599 ?auto_28598 ) ( not ( = ?auto_28597 ?auto_28598 ) ) ( not ( = ?auto_28597 ?auto_28599 ) ) ( not ( = ?auto_28597 ?auto_28596 ) ) ( not ( = ?auto_28597 ?auto_28600 ) ) ( not ( = ?auto_28598 ?auto_28599 ) ) ( not ( = ?auto_28598 ?auto_28596 ) ) ( not ( = ?auto_28598 ?auto_28600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28599 ?auto_28596 ?auto_28600 )
      ( MAKE-4CRATE-VERIFY ?auto_28597 ?auto_28598 ?auto_28599 ?auto_28596 ?auto_28600 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28631 - SURFACE
      ?auto_28632 - SURFACE
      ?auto_28633 - SURFACE
      ?auto_28630 - SURFACE
      ?auto_28634 - SURFACE
    )
    :vars
    (
      ?auto_28639 - HOIST
      ?auto_28636 - PLACE
      ?auto_28638 - TRUCK
      ?auto_28637 - PLACE
      ?auto_28635 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28639 ?auto_28636 ) ( SURFACE-AT ?auto_28630 ?auto_28636 ) ( CLEAR ?auto_28630 ) ( IS-CRATE ?auto_28634 ) ( not ( = ?auto_28630 ?auto_28634 ) ) ( AVAILABLE ?auto_28639 ) ( ON ?auto_28630 ?auto_28633 ) ( not ( = ?auto_28633 ?auto_28630 ) ) ( not ( = ?auto_28633 ?auto_28634 ) ) ( TRUCK-AT ?auto_28638 ?auto_28637 ) ( not ( = ?auto_28637 ?auto_28636 ) ) ( HOIST-AT ?auto_28635 ?auto_28637 ) ( LIFTING ?auto_28635 ?auto_28634 ) ( not ( = ?auto_28639 ?auto_28635 ) ) ( ON ?auto_28632 ?auto_28631 ) ( ON ?auto_28633 ?auto_28632 ) ( not ( = ?auto_28631 ?auto_28632 ) ) ( not ( = ?auto_28631 ?auto_28633 ) ) ( not ( = ?auto_28631 ?auto_28630 ) ) ( not ( = ?auto_28631 ?auto_28634 ) ) ( not ( = ?auto_28632 ?auto_28633 ) ) ( not ( = ?auto_28632 ?auto_28630 ) ) ( not ( = ?auto_28632 ?auto_28634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28633 ?auto_28630 ?auto_28634 )
      ( MAKE-4CRATE-VERIFY ?auto_28631 ?auto_28632 ?auto_28633 ?auto_28630 ?auto_28634 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28669 - SURFACE
      ?auto_28670 - SURFACE
      ?auto_28671 - SURFACE
      ?auto_28668 - SURFACE
      ?auto_28672 - SURFACE
    )
    :vars
    (
      ?auto_28674 - HOIST
      ?auto_28677 - PLACE
      ?auto_28675 - TRUCK
      ?auto_28678 - PLACE
      ?auto_28676 - HOIST
      ?auto_28673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28674 ?auto_28677 ) ( SURFACE-AT ?auto_28668 ?auto_28677 ) ( CLEAR ?auto_28668 ) ( IS-CRATE ?auto_28672 ) ( not ( = ?auto_28668 ?auto_28672 ) ) ( AVAILABLE ?auto_28674 ) ( ON ?auto_28668 ?auto_28671 ) ( not ( = ?auto_28671 ?auto_28668 ) ) ( not ( = ?auto_28671 ?auto_28672 ) ) ( TRUCK-AT ?auto_28675 ?auto_28678 ) ( not ( = ?auto_28678 ?auto_28677 ) ) ( HOIST-AT ?auto_28676 ?auto_28678 ) ( not ( = ?auto_28674 ?auto_28676 ) ) ( AVAILABLE ?auto_28676 ) ( SURFACE-AT ?auto_28672 ?auto_28678 ) ( ON ?auto_28672 ?auto_28673 ) ( CLEAR ?auto_28672 ) ( not ( = ?auto_28668 ?auto_28673 ) ) ( not ( = ?auto_28672 ?auto_28673 ) ) ( not ( = ?auto_28671 ?auto_28673 ) ) ( ON ?auto_28670 ?auto_28669 ) ( ON ?auto_28671 ?auto_28670 ) ( not ( = ?auto_28669 ?auto_28670 ) ) ( not ( = ?auto_28669 ?auto_28671 ) ) ( not ( = ?auto_28669 ?auto_28668 ) ) ( not ( = ?auto_28669 ?auto_28672 ) ) ( not ( = ?auto_28669 ?auto_28673 ) ) ( not ( = ?auto_28670 ?auto_28671 ) ) ( not ( = ?auto_28670 ?auto_28668 ) ) ( not ( = ?auto_28670 ?auto_28672 ) ) ( not ( = ?auto_28670 ?auto_28673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28671 ?auto_28668 ?auto_28672 )
      ( MAKE-4CRATE-VERIFY ?auto_28669 ?auto_28670 ?auto_28671 ?auto_28668 ?auto_28672 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28708 - SURFACE
      ?auto_28709 - SURFACE
      ?auto_28710 - SURFACE
      ?auto_28707 - SURFACE
      ?auto_28711 - SURFACE
    )
    :vars
    (
      ?auto_28714 - HOIST
      ?auto_28715 - PLACE
      ?auto_28716 - PLACE
      ?auto_28713 - HOIST
      ?auto_28717 - SURFACE
      ?auto_28712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28714 ?auto_28715 ) ( SURFACE-AT ?auto_28707 ?auto_28715 ) ( CLEAR ?auto_28707 ) ( IS-CRATE ?auto_28711 ) ( not ( = ?auto_28707 ?auto_28711 ) ) ( AVAILABLE ?auto_28714 ) ( ON ?auto_28707 ?auto_28710 ) ( not ( = ?auto_28710 ?auto_28707 ) ) ( not ( = ?auto_28710 ?auto_28711 ) ) ( not ( = ?auto_28716 ?auto_28715 ) ) ( HOIST-AT ?auto_28713 ?auto_28716 ) ( not ( = ?auto_28714 ?auto_28713 ) ) ( AVAILABLE ?auto_28713 ) ( SURFACE-AT ?auto_28711 ?auto_28716 ) ( ON ?auto_28711 ?auto_28717 ) ( CLEAR ?auto_28711 ) ( not ( = ?auto_28707 ?auto_28717 ) ) ( not ( = ?auto_28711 ?auto_28717 ) ) ( not ( = ?auto_28710 ?auto_28717 ) ) ( TRUCK-AT ?auto_28712 ?auto_28715 ) ( ON ?auto_28709 ?auto_28708 ) ( ON ?auto_28710 ?auto_28709 ) ( not ( = ?auto_28708 ?auto_28709 ) ) ( not ( = ?auto_28708 ?auto_28710 ) ) ( not ( = ?auto_28708 ?auto_28707 ) ) ( not ( = ?auto_28708 ?auto_28711 ) ) ( not ( = ?auto_28708 ?auto_28717 ) ) ( not ( = ?auto_28709 ?auto_28710 ) ) ( not ( = ?auto_28709 ?auto_28707 ) ) ( not ( = ?auto_28709 ?auto_28711 ) ) ( not ( = ?auto_28709 ?auto_28717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28710 ?auto_28707 ?auto_28711 )
      ( MAKE-4CRATE-VERIFY ?auto_28708 ?auto_28709 ?auto_28710 ?auto_28707 ?auto_28711 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28747 - SURFACE
      ?auto_28748 - SURFACE
      ?auto_28749 - SURFACE
      ?auto_28746 - SURFACE
      ?auto_28750 - SURFACE
    )
    :vars
    (
      ?auto_28754 - HOIST
      ?auto_28753 - PLACE
      ?auto_28751 - PLACE
      ?auto_28756 - HOIST
      ?auto_28752 - SURFACE
      ?auto_28755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28754 ?auto_28753 ) ( IS-CRATE ?auto_28750 ) ( not ( = ?auto_28746 ?auto_28750 ) ) ( not ( = ?auto_28749 ?auto_28746 ) ) ( not ( = ?auto_28749 ?auto_28750 ) ) ( not ( = ?auto_28751 ?auto_28753 ) ) ( HOIST-AT ?auto_28756 ?auto_28751 ) ( not ( = ?auto_28754 ?auto_28756 ) ) ( AVAILABLE ?auto_28756 ) ( SURFACE-AT ?auto_28750 ?auto_28751 ) ( ON ?auto_28750 ?auto_28752 ) ( CLEAR ?auto_28750 ) ( not ( = ?auto_28746 ?auto_28752 ) ) ( not ( = ?auto_28750 ?auto_28752 ) ) ( not ( = ?auto_28749 ?auto_28752 ) ) ( TRUCK-AT ?auto_28755 ?auto_28753 ) ( SURFACE-AT ?auto_28749 ?auto_28753 ) ( CLEAR ?auto_28749 ) ( LIFTING ?auto_28754 ?auto_28746 ) ( IS-CRATE ?auto_28746 ) ( ON ?auto_28748 ?auto_28747 ) ( ON ?auto_28749 ?auto_28748 ) ( not ( = ?auto_28747 ?auto_28748 ) ) ( not ( = ?auto_28747 ?auto_28749 ) ) ( not ( = ?auto_28747 ?auto_28746 ) ) ( not ( = ?auto_28747 ?auto_28750 ) ) ( not ( = ?auto_28747 ?auto_28752 ) ) ( not ( = ?auto_28748 ?auto_28749 ) ) ( not ( = ?auto_28748 ?auto_28746 ) ) ( not ( = ?auto_28748 ?auto_28750 ) ) ( not ( = ?auto_28748 ?auto_28752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28749 ?auto_28746 ?auto_28750 )
      ( MAKE-4CRATE-VERIFY ?auto_28747 ?auto_28748 ?auto_28749 ?auto_28746 ?auto_28750 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28786 - SURFACE
      ?auto_28787 - SURFACE
      ?auto_28788 - SURFACE
      ?auto_28785 - SURFACE
      ?auto_28789 - SURFACE
    )
    :vars
    (
      ?auto_28791 - HOIST
      ?auto_28790 - PLACE
      ?auto_28792 - PLACE
      ?auto_28794 - HOIST
      ?auto_28795 - SURFACE
      ?auto_28793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28791 ?auto_28790 ) ( IS-CRATE ?auto_28789 ) ( not ( = ?auto_28785 ?auto_28789 ) ) ( not ( = ?auto_28788 ?auto_28785 ) ) ( not ( = ?auto_28788 ?auto_28789 ) ) ( not ( = ?auto_28792 ?auto_28790 ) ) ( HOIST-AT ?auto_28794 ?auto_28792 ) ( not ( = ?auto_28791 ?auto_28794 ) ) ( AVAILABLE ?auto_28794 ) ( SURFACE-AT ?auto_28789 ?auto_28792 ) ( ON ?auto_28789 ?auto_28795 ) ( CLEAR ?auto_28789 ) ( not ( = ?auto_28785 ?auto_28795 ) ) ( not ( = ?auto_28789 ?auto_28795 ) ) ( not ( = ?auto_28788 ?auto_28795 ) ) ( TRUCK-AT ?auto_28793 ?auto_28790 ) ( SURFACE-AT ?auto_28788 ?auto_28790 ) ( CLEAR ?auto_28788 ) ( IS-CRATE ?auto_28785 ) ( AVAILABLE ?auto_28791 ) ( IN ?auto_28785 ?auto_28793 ) ( ON ?auto_28787 ?auto_28786 ) ( ON ?auto_28788 ?auto_28787 ) ( not ( = ?auto_28786 ?auto_28787 ) ) ( not ( = ?auto_28786 ?auto_28788 ) ) ( not ( = ?auto_28786 ?auto_28785 ) ) ( not ( = ?auto_28786 ?auto_28789 ) ) ( not ( = ?auto_28786 ?auto_28795 ) ) ( not ( = ?auto_28787 ?auto_28788 ) ) ( not ( = ?auto_28787 ?auto_28785 ) ) ( not ( = ?auto_28787 ?auto_28789 ) ) ( not ( = ?auto_28787 ?auto_28795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28788 ?auto_28785 ?auto_28789 )
      ( MAKE-4CRATE-VERIFY ?auto_28786 ?auto_28787 ?auto_28788 ?auto_28785 ?auto_28789 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29446 - SURFACE
      ?auto_29447 - SURFACE
      ?auto_29448 - SURFACE
      ?auto_29445 - SURFACE
      ?auto_29449 - SURFACE
      ?auto_29450 - SURFACE
    )
    :vars
    (
      ?auto_29451 - HOIST
      ?auto_29452 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29451 ?auto_29452 ) ( SURFACE-AT ?auto_29449 ?auto_29452 ) ( CLEAR ?auto_29449 ) ( LIFTING ?auto_29451 ?auto_29450 ) ( IS-CRATE ?auto_29450 ) ( not ( = ?auto_29449 ?auto_29450 ) ) ( ON ?auto_29447 ?auto_29446 ) ( ON ?auto_29448 ?auto_29447 ) ( ON ?auto_29445 ?auto_29448 ) ( ON ?auto_29449 ?auto_29445 ) ( not ( = ?auto_29446 ?auto_29447 ) ) ( not ( = ?auto_29446 ?auto_29448 ) ) ( not ( = ?auto_29446 ?auto_29445 ) ) ( not ( = ?auto_29446 ?auto_29449 ) ) ( not ( = ?auto_29446 ?auto_29450 ) ) ( not ( = ?auto_29447 ?auto_29448 ) ) ( not ( = ?auto_29447 ?auto_29445 ) ) ( not ( = ?auto_29447 ?auto_29449 ) ) ( not ( = ?auto_29447 ?auto_29450 ) ) ( not ( = ?auto_29448 ?auto_29445 ) ) ( not ( = ?auto_29448 ?auto_29449 ) ) ( not ( = ?auto_29448 ?auto_29450 ) ) ( not ( = ?auto_29445 ?auto_29449 ) ) ( not ( = ?auto_29445 ?auto_29450 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29449 ?auto_29450 )
      ( MAKE-5CRATE-VERIFY ?auto_29446 ?auto_29447 ?auto_29448 ?auto_29445 ?auto_29449 ?auto_29450 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29480 - SURFACE
      ?auto_29481 - SURFACE
      ?auto_29482 - SURFACE
      ?auto_29479 - SURFACE
      ?auto_29483 - SURFACE
      ?auto_29484 - SURFACE
    )
    :vars
    (
      ?auto_29487 - HOIST
      ?auto_29485 - PLACE
      ?auto_29486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29487 ?auto_29485 ) ( SURFACE-AT ?auto_29483 ?auto_29485 ) ( CLEAR ?auto_29483 ) ( IS-CRATE ?auto_29484 ) ( not ( = ?auto_29483 ?auto_29484 ) ) ( TRUCK-AT ?auto_29486 ?auto_29485 ) ( AVAILABLE ?auto_29487 ) ( IN ?auto_29484 ?auto_29486 ) ( ON ?auto_29483 ?auto_29479 ) ( not ( = ?auto_29479 ?auto_29483 ) ) ( not ( = ?auto_29479 ?auto_29484 ) ) ( ON ?auto_29481 ?auto_29480 ) ( ON ?auto_29482 ?auto_29481 ) ( ON ?auto_29479 ?auto_29482 ) ( not ( = ?auto_29480 ?auto_29481 ) ) ( not ( = ?auto_29480 ?auto_29482 ) ) ( not ( = ?auto_29480 ?auto_29479 ) ) ( not ( = ?auto_29480 ?auto_29483 ) ) ( not ( = ?auto_29480 ?auto_29484 ) ) ( not ( = ?auto_29481 ?auto_29482 ) ) ( not ( = ?auto_29481 ?auto_29479 ) ) ( not ( = ?auto_29481 ?auto_29483 ) ) ( not ( = ?auto_29481 ?auto_29484 ) ) ( not ( = ?auto_29482 ?auto_29479 ) ) ( not ( = ?auto_29482 ?auto_29483 ) ) ( not ( = ?auto_29482 ?auto_29484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29479 ?auto_29483 ?auto_29484 )
      ( MAKE-5CRATE-VERIFY ?auto_29480 ?auto_29481 ?auto_29482 ?auto_29479 ?auto_29483 ?auto_29484 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29520 - SURFACE
      ?auto_29521 - SURFACE
      ?auto_29522 - SURFACE
      ?auto_29519 - SURFACE
      ?auto_29523 - SURFACE
      ?auto_29524 - SURFACE
    )
    :vars
    (
      ?auto_29527 - HOIST
      ?auto_29526 - PLACE
      ?auto_29528 - TRUCK
      ?auto_29525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29527 ?auto_29526 ) ( SURFACE-AT ?auto_29523 ?auto_29526 ) ( CLEAR ?auto_29523 ) ( IS-CRATE ?auto_29524 ) ( not ( = ?auto_29523 ?auto_29524 ) ) ( AVAILABLE ?auto_29527 ) ( IN ?auto_29524 ?auto_29528 ) ( ON ?auto_29523 ?auto_29519 ) ( not ( = ?auto_29519 ?auto_29523 ) ) ( not ( = ?auto_29519 ?auto_29524 ) ) ( TRUCK-AT ?auto_29528 ?auto_29525 ) ( not ( = ?auto_29525 ?auto_29526 ) ) ( ON ?auto_29521 ?auto_29520 ) ( ON ?auto_29522 ?auto_29521 ) ( ON ?auto_29519 ?auto_29522 ) ( not ( = ?auto_29520 ?auto_29521 ) ) ( not ( = ?auto_29520 ?auto_29522 ) ) ( not ( = ?auto_29520 ?auto_29519 ) ) ( not ( = ?auto_29520 ?auto_29523 ) ) ( not ( = ?auto_29520 ?auto_29524 ) ) ( not ( = ?auto_29521 ?auto_29522 ) ) ( not ( = ?auto_29521 ?auto_29519 ) ) ( not ( = ?auto_29521 ?auto_29523 ) ) ( not ( = ?auto_29521 ?auto_29524 ) ) ( not ( = ?auto_29522 ?auto_29519 ) ) ( not ( = ?auto_29522 ?auto_29523 ) ) ( not ( = ?auto_29522 ?auto_29524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29519 ?auto_29523 ?auto_29524 )
      ( MAKE-5CRATE-VERIFY ?auto_29520 ?auto_29521 ?auto_29522 ?auto_29519 ?auto_29523 ?auto_29524 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29565 - SURFACE
      ?auto_29566 - SURFACE
      ?auto_29567 - SURFACE
      ?auto_29564 - SURFACE
      ?auto_29568 - SURFACE
      ?auto_29569 - SURFACE
    )
    :vars
    (
      ?auto_29574 - HOIST
      ?auto_29573 - PLACE
      ?auto_29571 - TRUCK
      ?auto_29570 - PLACE
      ?auto_29572 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29574 ?auto_29573 ) ( SURFACE-AT ?auto_29568 ?auto_29573 ) ( CLEAR ?auto_29568 ) ( IS-CRATE ?auto_29569 ) ( not ( = ?auto_29568 ?auto_29569 ) ) ( AVAILABLE ?auto_29574 ) ( ON ?auto_29568 ?auto_29564 ) ( not ( = ?auto_29564 ?auto_29568 ) ) ( not ( = ?auto_29564 ?auto_29569 ) ) ( TRUCK-AT ?auto_29571 ?auto_29570 ) ( not ( = ?auto_29570 ?auto_29573 ) ) ( HOIST-AT ?auto_29572 ?auto_29570 ) ( LIFTING ?auto_29572 ?auto_29569 ) ( not ( = ?auto_29574 ?auto_29572 ) ) ( ON ?auto_29566 ?auto_29565 ) ( ON ?auto_29567 ?auto_29566 ) ( ON ?auto_29564 ?auto_29567 ) ( not ( = ?auto_29565 ?auto_29566 ) ) ( not ( = ?auto_29565 ?auto_29567 ) ) ( not ( = ?auto_29565 ?auto_29564 ) ) ( not ( = ?auto_29565 ?auto_29568 ) ) ( not ( = ?auto_29565 ?auto_29569 ) ) ( not ( = ?auto_29566 ?auto_29567 ) ) ( not ( = ?auto_29566 ?auto_29564 ) ) ( not ( = ?auto_29566 ?auto_29568 ) ) ( not ( = ?auto_29566 ?auto_29569 ) ) ( not ( = ?auto_29567 ?auto_29564 ) ) ( not ( = ?auto_29567 ?auto_29568 ) ) ( not ( = ?auto_29567 ?auto_29569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29564 ?auto_29568 ?auto_29569 )
      ( MAKE-5CRATE-VERIFY ?auto_29565 ?auto_29566 ?auto_29567 ?auto_29564 ?auto_29568 ?auto_29569 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29615 - SURFACE
      ?auto_29616 - SURFACE
      ?auto_29617 - SURFACE
      ?auto_29614 - SURFACE
      ?auto_29618 - SURFACE
      ?auto_29619 - SURFACE
    )
    :vars
    (
      ?auto_29622 - HOIST
      ?auto_29625 - PLACE
      ?auto_29620 - TRUCK
      ?auto_29623 - PLACE
      ?auto_29621 - HOIST
      ?auto_29624 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29622 ?auto_29625 ) ( SURFACE-AT ?auto_29618 ?auto_29625 ) ( CLEAR ?auto_29618 ) ( IS-CRATE ?auto_29619 ) ( not ( = ?auto_29618 ?auto_29619 ) ) ( AVAILABLE ?auto_29622 ) ( ON ?auto_29618 ?auto_29614 ) ( not ( = ?auto_29614 ?auto_29618 ) ) ( not ( = ?auto_29614 ?auto_29619 ) ) ( TRUCK-AT ?auto_29620 ?auto_29623 ) ( not ( = ?auto_29623 ?auto_29625 ) ) ( HOIST-AT ?auto_29621 ?auto_29623 ) ( not ( = ?auto_29622 ?auto_29621 ) ) ( AVAILABLE ?auto_29621 ) ( SURFACE-AT ?auto_29619 ?auto_29623 ) ( ON ?auto_29619 ?auto_29624 ) ( CLEAR ?auto_29619 ) ( not ( = ?auto_29618 ?auto_29624 ) ) ( not ( = ?auto_29619 ?auto_29624 ) ) ( not ( = ?auto_29614 ?auto_29624 ) ) ( ON ?auto_29616 ?auto_29615 ) ( ON ?auto_29617 ?auto_29616 ) ( ON ?auto_29614 ?auto_29617 ) ( not ( = ?auto_29615 ?auto_29616 ) ) ( not ( = ?auto_29615 ?auto_29617 ) ) ( not ( = ?auto_29615 ?auto_29614 ) ) ( not ( = ?auto_29615 ?auto_29618 ) ) ( not ( = ?auto_29615 ?auto_29619 ) ) ( not ( = ?auto_29615 ?auto_29624 ) ) ( not ( = ?auto_29616 ?auto_29617 ) ) ( not ( = ?auto_29616 ?auto_29614 ) ) ( not ( = ?auto_29616 ?auto_29618 ) ) ( not ( = ?auto_29616 ?auto_29619 ) ) ( not ( = ?auto_29616 ?auto_29624 ) ) ( not ( = ?auto_29617 ?auto_29614 ) ) ( not ( = ?auto_29617 ?auto_29618 ) ) ( not ( = ?auto_29617 ?auto_29619 ) ) ( not ( = ?auto_29617 ?auto_29624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29614 ?auto_29618 ?auto_29619 )
      ( MAKE-5CRATE-VERIFY ?auto_29615 ?auto_29616 ?auto_29617 ?auto_29614 ?auto_29618 ?auto_29619 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29666 - SURFACE
      ?auto_29667 - SURFACE
      ?auto_29668 - SURFACE
      ?auto_29665 - SURFACE
      ?auto_29669 - SURFACE
      ?auto_29670 - SURFACE
    )
    :vars
    (
      ?auto_29674 - HOIST
      ?auto_29676 - PLACE
      ?auto_29673 - PLACE
      ?auto_29672 - HOIST
      ?auto_29675 - SURFACE
      ?auto_29671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29674 ?auto_29676 ) ( SURFACE-AT ?auto_29669 ?auto_29676 ) ( CLEAR ?auto_29669 ) ( IS-CRATE ?auto_29670 ) ( not ( = ?auto_29669 ?auto_29670 ) ) ( AVAILABLE ?auto_29674 ) ( ON ?auto_29669 ?auto_29665 ) ( not ( = ?auto_29665 ?auto_29669 ) ) ( not ( = ?auto_29665 ?auto_29670 ) ) ( not ( = ?auto_29673 ?auto_29676 ) ) ( HOIST-AT ?auto_29672 ?auto_29673 ) ( not ( = ?auto_29674 ?auto_29672 ) ) ( AVAILABLE ?auto_29672 ) ( SURFACE-AT ?auto_29670 ?auto_29673 ) ( ON ?auto_29670 ?auto_29675 ) ( CLEAR ?auto_29670 ) ( not ( = ?auto_29669 ?auto_29675 ) ) ( not ( = ?auto_29670 ?auto_29675 ) ) ( not ( = ?auto_29665 ?auto_29675 ) ) ( TRUCK-AT ?auto_29671 ?auto_29676 ) ( ON ?auto_29667 ?auto_29666 ) ( ON ?auto_29668 ?auto_29667 ) ( ON ?auto_29665 ?auto_29668 ) ( not ( = ?auto_29666 ?auto_29667 ) ) ( not ( = ?auto_29666 ?auto_29668 ) ) ( not ( = ?auto_29666 ?auto_29665 ) ) ( not ( = ?auto_29666 ?auto_29669 ) ) ( not ( = ?auto_29666 ?auto_29670 ) ) ( not ( = ?auto_29666 ?auto_29675 ) ) ( not ( = ?auto_29667 ?auto_29668 ) ) ( not ( = ?auto_29667 ?auto_29665 ) ) ( not ( = ?auto_29667 ?auto_29669 ) ) ( not ( = ?auto_29667 ?auto_29670 ) ) ( not ( = ?auto_29667 ?auto_29675 ) ) ( not ( = ?auto_29668 ?auto_29665 ) ) ( not ( = ?auto_29668 ?auto_29669 ) ) ( not ( = ?auto_29668 ?auto_29670 ) ) ( not ( = ?auto_29668 ?auto_29675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29665 ?auto_29669 ?auto_29670 )
      ( MAKE-5CRATE-VERIFY ?auto_29666 ?auto_29667 ?auto_29668 ?auto_29665 ?auto_29669 ?auto_29670 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29717 - SURFACE
      ?auto_29718 - SURFACE
      ?auto_29719 - SURFACE
      ?auto_29716 - SURFACE
      ?auto_29720 - SURFACE
      ?auto_29721 - SURFACE
    )
    :vars
    (
      ?auto_29723 - HOIST
      ?auto_29725 - PLACE
      ?auto_29722 - PLACE
      ?auto_29726 - HOIST
      ?auto_29727 - SURFACE
      ?auto_29724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29723 ?auto_29725 ) ( IS-CRATE ?auto_29721 ) ( not ( = ?auto_29720 ?auto_29721 ) ) ( not ( = ?auto_29716 ?auto_29720 ) ) ( not ( = ?auto_29716 ?auto_29721 ) ) ( not ( = ?auto_29722 ?auto_29725 ) ) ( HOIST-AT ?auto_29726 ?auto_29722 ) ( not ( = ?auto_29723 ?auto_29726 ) ) ( AVAILABLE ?auto_29726 ) ( SURFACE-AT ?auto_29721 ?auto_29722 ) ( ON ?auto_29721 ?auto_29727 ) ( CLEAR ?auto_29721 ) ( not ( = ?auto_29720 ?auto_29727 ) ) ( not ( = ?auto_29721 ?auto_29727 ) ) ( not ( = ?auto_29716 ?auto_29727 ) ) ( TRUCK-AT ?auto_29724 ?auto_29725 ) ( SURFACE-AT ?auto_29716 ?auto_29725 ) ( CLEAR ?auto_29716 ) ( LIFTING ?auto_29723 ?auto_29720 ) ( IS-CRATE ?auto_29720 ) ( ON ?auto_29718 ?auto_29717 ) ( ON ?auto_29719 ?auto_29718 ) ( ON ?auto_29716 ?auto_29719 ) ( not ( = ?auto_29717 ?auto_29718 ) ) ( not ( = ?auto_29717 ?auto_29719 ) ) ( not ( = ?auto_29717 ?auto_29716 ) ) ( not ( = ?auto_29717 ?auto_29720 ) ) ( not ( = ?auto_29717 ?auto_29721 ) ) ( not ( = ?auto_29717 ?auto_29727 ) ) ( not ( = ?auto_29718 ?auto_29719 ) ) ( not ( = ?auto_29718 ?auto_29716 ) ) ( not ( = ?auto_29718 ?auto_29720 ) ) ( not ( = ?auto_29718 ?auto_29721 ) ) ( not ( = ?auto_29718 ?auto_29727 ) ) ( not ( = ?auto_29719 ?auto_29716 ) ) ( not ( = ?auto_29719 ?auto_29720 ) ) ( not ( = ?auto_29719 ?auto_29721 ) ) ( not ( = ?auto_29719 ?auto_29727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29716 ?auto_29720 ?auto_29721 )
      ( MAKE-5CRATE-VERIFY ?auto_29717 ?auto_29718 ?auto_29719 ?auto_29716 ?auto_29720 ?auto_29721 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29768 - SURFACE
      ?auto_29769 - SURFACE
      ?auto_29770 - SURFACE
      ?auto_29767 - SURFACE
      ?auto_29771 - SURFACE
      ?auto_29772 - SURFACE
    )
    :vars
    (
      ?auto_29778 - HOIST
      ?auto_29775 - PLACE
      ?auto_29773 - PLACE
      ?auto_29774 - HOIST
      ?auto_29777 - SURFACE
      ?auto_29776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29778 ?auto_29775 ) ( IS-CRATE ?auto_29772 ) ( not ( = ?auto_29771 ?auto_29772 ) ) ( not ( = ?auto_29767 ?auto_29771 ) ) ( not ( = ?auto_29767 ?auto_29772 ) ) ( not ( = ?auto_29773 ?auto_29775 ) ) ( HOIST-AT ?auto_29774 ?auto_29773 ) ( not ( = ?auto_29778 ?auto_29774 ) ) ( AVAILABLE ?auto_29774 ) ( SURFACE-AT ?auto_29772 ?auto_29773 ) ( ON ?auto_29772 ?auto_29777 ) ( CLEAR ?auto_29772 ) ( not ( = ?auto_29771 ?auto_29777 ) ) ( not ( = ?auto_29772 ?auto_29777 ) ) ( not ( = ?auto_29767 ?auto_29777 ) ) ( TRUCK-AT ?auto_29776 ?auto_29775 ) ( SURFACE-AT ?auto_29767 ?auto_29775 ) ( CLEAR ?auto_29767 ) ( IS-CRATE ?auto_29771 ) ( AVAILABLE ?auto_29778 ) ( IN ?auto_29771 ?auto_29776 ) ( ON ?auto_29769 ?auto_29768 ) ( ON ?auto_29770 ?auto_29769 ) ( ON ?auto_29767 ?auto_29770 ) ( not ( = ?auto_29768 ?auto_29769 ) ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29768 ?auto_29767 ) ) ( not ( = ?auto_29768 ?auto_29771 ) ) ( not ( = ?auto_29768 ?auto_29772 ) ) ( not ( = ?auto_29768 ?auto_29777 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29767 ) ) ( not ( = ?auto_29769 ?auto_29771 ) ) ( not ( = ?auto_29769 ?auto_29772 ) ) ( not ( = ?auto_29769 ?auto_29777 ) ) ( not ( = ?auto_29770 ?auto_29767 ) ) ( not ( = ?auto_29770 ?auto_29771 ) ) ( not ( = ?auto_29770 ?auto_29772 ) ) ( not ( = ?auto_29770 ?auto_29777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29767 ?auto_29771 ?auto_29772 )
      ( MAKE-5CRATE-VERIFY ?auto_29768 ?auto_29769 ?auto_29770 ?auto_29767 ?auto_29771 ?auto_29772 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_30977 - SURFACE
      ?auto_30978 - SURFACE
      ?auto_30979 - SURFACE
      ?auto_30976 - SURFACE
      ?auto_30980 - SURFACE
      ?auto_30982 - SURFACE
      ?auto_30981 - SURFACE
    )
    :vars
    (
      ?auto_30984 - HOIST
      ?auto_30983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30984 ?auto_30983 ) ( SURFACE-AT ?auto_30982 ?auto_30983 ) ( CLEAR ?auto_30982 ) ( LIFTING ?auto_30984 ?auto_30981 ) ( IS-CRATE ?auto_30981 ) ( not ( = ?auto_30982 ?auto_30981 ) ) ( ON ?auto_30978 ?auto_30977 ) ( ON ?auto_30979 ?auto_30978 ) ( ON ?auto_30976 ?auto_30979 ) ( ON ?auto_30980 ?auto_30976 ) ( ON ?auto_30982 ?auto_30980 ) ( not ( = ?auto_30977 ?auto_30978 ) ) ( not ( = ?auto_30977 ?auto_30979 ) ) ( not ( = ?auto_30977 ?auto_30976 ) ) ( not ( = ?auto_30977 ?auto_30980 ) ) ( not ( = ?auto_30977 ?auto_30982 ) ) ( not ( = ?auto_30977 ?auto_30981 ) ) ( not ( = ?auto_30978 ?auto_30979 ) ) ( not ( = ?auto_30978 ?auto_30976 ) ) ( not ( = ?auto_30978 ?auto_30980 ) ) ( not ( = ?auto_30978 ?auto_30982 ) ) ( not ( = ?auto_30978 ?auto_30981 ) ) ( not ( = ?auto_30979 ?auto_30976 ) ) ( not ( = ?auto_30979 ?auto_30980 ) ) ( not ( = ?auto_30979 ?auto_30982 ) ) ( not ( = ?auto_30979 ?auto_30981 ) ) ( not ( = ?auto_30976 ?auto_30980 ) ) ( not ( = ?auto_30976 ?auto_30982 ) ) ( not ( = ?auto_30976 ?auto_30981 ) ) ( not ( = ?auto_30980 ?auto_30982 ) ) ( not ( = ?auto_30980 ?auto_30981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30982 ?auto_30981 )
      ( MAKE-6CRATE-VERIFY ?auto_30977 ?auto_30978 ?auto_30979 ?auto_30976 ?auto_30980 ?auto_30982 ?auto_30981 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31021 - SURFACE
      ?auto_31022 - SURFACE
      ?auto_31023 - SURFACE
      ?auto_31020 - SURFACE
      ?auto_31024 - SURFACE
      ?auto_31026 - SURFACE
      ?auto_31025 - SURFACE
    )
    :vars
    (
      ?auto_31028 - HOIST
      ?auto_31027 - PLACE
      ?auto_31029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31028 ?auto_31027 ) ( SURFACE-AT ?auto_31026 ?auto_31027 ) ( CLEAR ?auto_31026 ) ( IS-CRATE ?auto_31025 ) ( not ( = ?auto_31026 ?auto_31025 ) ) ( TRUCK-AT ?auto_31029 ?auto_31027 ) ( AVAILABLE ?auto_31028 ) ( IN ?auto_31025 ?auto_31029 ) ( ON ?auto_31026 ?auto_31024 ) ( not ( = ?auto_31024 ?auto_31026 ) ) ( not ( = ?auto_31024 ?auto_31025 ) ) ( ON ?auto_31022 ?auto_31021 ) ( ON ?auto_31023 ?auto_31022 ) ( ON ?auto_31020 ?auto_31023 ) ( ON ?auto_31024 ?auto_31020 ) ( not ( = ?auto_31021 ?auto_31022 ) ) ( not ( = ?auto_31021 ?auto_31023 ) ) ( not ( = ?auto_31021 ?auto_31020 ) ) ( not ( = ?auto_31021 ?auto_31024 ) ) ( not ( = ?auto_31021 ?auto_31026 ) ) ( not ( = ?auto_31021 ?auto_31025 ) ) ( not ( = ?auto_31022 ?auto_31023 ) ) ( not ( = ?auto_31022 ?auto_31020 ) ) ( not ( = ?auto_31022 ?auto_31024 ) ) ( not ( = ?auto_31022 ?auto_31026 ) ) ( not ( = ?auto_31022 ?auto_31025 ) ) ( not ( = ?auto_31023 ?auto_31020 ) ) ( not ( = ?auto_31023 ?auto_31024 ) ) ( not ( = ?auto_31023 ?auto_31026 ) ) ( not ( = ?auto_31023 ?auto_31025 ) ) ( not ( = ?auto_31020 ?auto_31024 ) ) ( not ( = ?auto_31020 ?auto_31026 ) ) ( not ( = ?auto_31020 ?auto_31025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31024 ?auto_31026 ?auto_31025 )
      ( MAKE-6CRATE-VERIFY ?auto_31021 ?auto_31022 ?auto_31023 ?auto_31020 ?auto_31024 ?auto_31026 ?auto_31025 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31072 - SURFACE
      ?auto_31073 - SURFACE
      ?auto_31074 - SURFACE
      ?auto_31071 - SURFACE
      ?auto_31075 - SURFACE
      ?auto_31077 - SURFACE
      ?auto_31076 - SURFACE
    )
    :vars
    (
      ?auto_31079 - HOIST
      ?auto_31080 - PLACE
      ?auto_31078 - TRUCK
      ?auto_31081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31079 ?auto_31080 ) ( SURFACE-AT ?auto_31077 ?auto_31080 ) ( CLEAR ?auto_31077 ) ( IS-CRATE ?auto_31076 ) ( not ( = ?auto_31077 ?auto_31076 ) ) ( AVAILABLE ?auto_31079 ) ( IN ?auto_31076 ?auto_31078 ) ( ON ?auto_31077 ?auto_31075 ) ( not ( = ?auto_31075 ?auto_31077 ) ) ( not ( = ?auto_31075 ?auto_31076 ) ) ( TRUCK-AT ?auto_31078 ?auto_31081 ) ( not ( = ?auto_31081 ?auto_31080 ) ) ( ON ?auto_31073 ?auto_31072 ) ( ON ?auto_31074 ?auto_31073 ) ( ON ?auto_31071 ?auto_31074 ) ( ON ?auto_31075 ?auto_31071 ) ( not ( = ?auto_31072 ?auto_31073 ) ) ( not ( = ?auto_31072 ?auto_31074 ) ) ( not ( = ?auto_31072 ?auto_31071 ) ) ( not ( = ?auto_31072 ?auto_31075 ) ) ( not ( = ?auto_31072 ?auto_31077 ) ) ( not ( = ?auto_31072 ?auto_31076 ) ) ( not ( = ?auto_31073 ?auto_31074 ) ) ( not ( = ?auto_31073 ?auto_31071 ) ) ( not ( = ?auto_31073 ?auto_31075 ) ) ( not ( = ?auto_31073 ?auto_31077 ) ) ( not ( = ?auto_31073 ?auto_31076 ) ) ( not ( = ?auto_31074 ?auto_31071 ) ) ( not ( = ?auto_31074 ?auto_31075 ) ) ( not ( = ?auto_31074 ?auto_31077 ) ) ( not ( = ?auto_31074 ?auto_31076 ) ) ( not ( = ?auto_31071 ?auto_31075 ) ) ( not ( = ?auto_31071 ?auto_31077 ) ) ( not ( = ?auto_31071 ?auto_31076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31075 ?auto_31077 ?auto_31076 )
      ( MAKE-6CRATE-VERIFY ?auto_31072 ?auto_31073 ?auto_31074 ?auto_31071 ?auto_31075 ?auto_31077 ?auto_31076 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31129 - SURFACE
      ?auto_31130 - SURFACE
      ?auto_31131 - SURFACE
      ?auto_31128 - SURFACE
      ?auto_31132 - SURFACE
      ?auto_31134 - SURFACE
      ?auto_31133 - SURFACE
    )
    :vars
    (
      ?auto_31139 - HOIST
      ?auto_31135 - PLACE
      ?auto_31137 - TRUCK
      ?auto_31136 - PLACE
      ?auto_31138 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31139 ?auto_31135 ) ( SURFACE-AT ?auto_31134 ?auto_31135 ) ( CLEAR ?auto_31134 ) ( IS-CRATE ?auto_31133 ) ( not ( = ?auto_31134 ?auto_31133 ) ) ( AVAILABLE ?auto_31139 ) ( ON ?auto_31134 ?auto_31132 ) ( not ( = ?auto_31132 ?auto_31134 ) ) ( not ( = ?auto_31132 ?auto_31133 ) ) ( TRUCK-AT ?auto_31137 ?auto_31136 ) ( not ( = ?auto_31136 ?auto_31135 ) ) ( HOIST-AT ?auto_31138 ?auto_31136 ) ( LIFTING ?auto_31138 ?auto_31133 ) ( not ( = ?auto_31139 ?auto_31138 ) ) ( ON ?auto_31130 ?auto_31129 ) ( ON ?auto_31131 ?auto_31130 ) ( ON ?auto_31128 ?auto_31131 ) ( ON ?auto_31132 ?auto_31128 ) ( not ( = ?auto_31129 ?auto_31130 ) ) ( not ( = ?auto_31129 ?auto_31131 ) ) ( not ( = ?auto_31129 ?auto_31128 ) ) ( not ( = ?auto_31129 ?auto_31132 ) ) ( not ( = ?auto_31129 ?auto_31134 ) ) ( not ( = ?auto_31129 ?auto_31133 ) ) ( not ( = ?auto_31130 ?auto_31131 ) ) ( not ( = ?auto_31130 ?auto_31128 ) ) ( not ( = ?auto_31130 ?auto_31132 ) ) ( not ( = ?auto_31130 ?auto_31134 ) ) ( not ( = ?auto_31130 ?auto_31133 ) ) ( not ( = ?auto_31131 ?auto_31128 ) ) ( not ( = ?auto_31131 ?auto_31132 ) ) ( not ( = ?auto_31131 ?auto_31134 ) ) ( not ( = ?auto_31131 ?auto_31133 ) ) ( not ( = ?auto_31128 ?auto_31132 ) ) ( not ( = ?auto_31128 ?auto_31134 ) ) ( not ( = ?auto_31128 ?auto_31133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31132 ?auto_31134 ?auto_31133 )
      ( MAKE-6CRATE-VERIFY ?auto_31129 ?auto_31130 ?auto_31131 ?auto_31128 ?auto_31132 ?auto_31134 ?auto_31133 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31192 - SURFACE
      ?auto_31193 - SURFACE
      ?auto_31194 - SURFACE
      ?auto_31191 - SURFACE
      ?auto_31195 - SURFACE
      ?auto_31197 - SURFACE
      ?auto_31196 - SURFACE
    )
    :vars
    (
      ?auto_31198 - HOIST
      ?auto_31201 - PLACE
      ?auto_31202 - TRUCK
      ?auto_31199 - PLACE
      ?auto_31200 - HOIST
      ?auto_31203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31198 ?auto_31201 ) ( SURFACE-AT ?auto_31197 ?auto_31201 ) ( CLEAR ?auto_31197 ) ( IS-CRATE ?auto_31196 ) ( not ( = ?auto_31197 ?auto_31196 ) ) ( AVAILABLE ?auto_31198 ) ( ON ?auto_31197 ?auto_31195 ) ( not ( = ?auto_31195 ?auto_31197 ) ) ( not ( = ?auto_31195 ?auto_31196 ) ) ( TRUCK-AT ?auto_31202 ?auto_31199 ) ( not ( = ?auto_31199 ?auto_31201 ) ) ( HOIST-AT ?auto_31200 ?auto_31199 ) ( not ( = ?auto_31198 ?auto_31200 ) ) ( AVAILABLE ?auto_31200 ) ( SURFACE-AT ?auto_31196 ?auto_31199 ) ( ON ?auto_31196 ?auto_31203 ) ( CLEAR ?auto_31196 ) ( not ( = ?auto_31197 ?auto_31203 ) ) ( not ( = ?auto_31196 ?auto_31203 ) ) ( not ( = ?auto_31195 ?auto_31203 ) ) ( ON ?auto_31193 ?auto_31192 ) ( ON ?auto_31194 ?auto_31193 ) ( ON ?auto_31191 ?auto_31194 ) ( ON ?auto_31195 ?auto_31191 ) ( not ( = ?auto_31192 ?auto_31193 ) ) ( not ( = ?auto_31192 ?auto_31194 ) ) ( not ( = ?auto_31192 ?auto_31191 ) ) ( not ( = ?auto_31192 ?auto_31195 ) ) ( not ( = ?auto_31192 ?auto_31197 ) ) ( not ( = ?auto_31192 ?auto_31196 ) ) ( not ( = ?auto_31192 ?auto_31203 ) ) ( not ( = ?auto_31193 ?auto_31194 ) ) ( not ( = ?auto_31193 ?auto_31191 ) ) ( not ( = ?auto_31193 ?auto_31195 ) ) ( not ( = ?auto_31193 ?auto_31197 ) ) ( not ( = ?auto_31193 ?auto_31196 ) ) ( not ( = ?auto_31193 ?auto_31203 ) ) ( not ( = ?auto_31194 ?auto_31191 ) ) ( not ( = ?auto_31194 ?auto_31195 ) ) ( not ( = ?auto_31194 ?auto_31197 ) ) ( not ( = ?auto_31194 ?auto_31196 ) ) ( not ( = ?auto_31194 ?auto_31203 ) ) ( not ( = ?auto_31191 ?auto_31195 ) ) ( not ( = ?auto_31191 ?auto_31197 ) ) ( not ( = ?auto_31191 ?auto_31196 ) ) ( not ( = ?auto_31191 ?auto_31203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31195 ?auto_31197 ?auto_31196 )
      ( MAKE-6CRATE-VERIFY ?auto_31192 ?auto_31193 ?auto_31194 ?auto_31191 ?auto_31195 ?auto_31197 ?auto_31196 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31256 - SURFACE
      ?auto_31257 - SURFACE
      ?auto_31258 - SURFACE
      ?auto_31255 - SURFACE
      ?auto_31259 - SURFACE
      ?auto_31261 - SURFACE
      ?auto_31260 - SURFACE
    )
    :vars
    (
      ?auto_31266 - HOIST
      ?auto_31263 - PLACE
      ?auto_31264 - PLACE
      ?auto_31262 - HOIST
      ?auto_31265 - SURFACE
      ?auto_31267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31266 ?auto_31263 ) ( SURFACE-AT ?auto_31261 ?auto_31263 ) ( CLEAR ?auto_31261 ) ( IS-CRATE ?auto_31260 ) ( not ( = ?auto_31261 ?auto_31260 ) ) ( AVAILABLE ?auto_31266 ) ( ON ?auto_31261 ?auto_31259 ) ( not ( = ?auto_31259 ?auto_31261 ) ) ( not ( = ?auto_31259 ?auto_31260 ) ) ( not ( = ?auto_31264 ?auto_31263 ) ) ( HOIST-AT ?auto_31262 ?auto_31264 ) ( not ( = ?auto_31266 ?auto_31262 ) ) ( AVAILABLE ?auto_31262 ) ( SURFACE-AT ?auto_31260 ?auto_31264 ) ( ON ?auto_31260 ?auto_31265 ) ( CLEAR ?auto_31260 ) ( not ( = ?auto_31261 ?auto_31265 ) ) ( not ( = ?auto_31260 ?auto_31265 ) ) ( not ( = ?auto_31259 ?auto_31265 ) ) ( TRUCK-AT ?auto_31267 ?auto_31263 ) ( ON ?auto_31257 ?auto_31256 ) ( ON ?auto_31258 ?auto_31257 ) ( ON ?auto_31255 ?auto_31258 ) ( ON ?auto_31259 ?auto_31255 ) ( not ( = ?auto_31256 ?auto_31257 ) ) ( not ( = ?auto_31256 ?auto_31258 ) ) ( not ( = ?auto_31256 ?auto_31255 ) ) ( not ( = ?auto_31256 ?auto_31259 ) ) ( not ( = ?auto_31256 ?auto_31261 ) ) ( not ( = ?auto_31256 ?auto_31260 ) ) ( not ( = ?auto_31256 ?auto_31265 ) ) ( not ( = ?auto_31257 ?auto_31258 ) ) ( not ( = ?auto_31257 ?auto_31255 ) ) ( not ( = ?auto_31257 ?auto_31259 ) ) ( not ( = ?auto_31257 ?auto_31261 ) ) ( not ( = ?auto_31257 ?auto_31260 ) ) ( not ( = ?auto_31257 ?auto_31265 ) ) ( not ( = ?auto_31258 ?auto_31255 ) ) ( not ( = ?auto_31258 ?auto_31259 ) ) ( not ( = ?auto_31258 ?auto_31261 ) ) ( not ( = ?auto_31258 ?auto_31260 ) ) ( not ( = ?auto_31258 ?auto_31265 ) ) ( not ( = ?auto_31255 ?auto_31259 ) ) ( not ( = ?auto_31255 ?auto_31261 ) ) ( not ( = ?auto_31255 ?auto_31260 ) ) ( not ( = ?auto_31255 ?auto_31265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31259 ?auto_31261 ?auto_31260 )
      ( MAKE-6CRATE-VERIFY ?auto_31256 ?auto_31257 ?auto_31258 ?auto_31255 ?auto_31259 ?auto_31261 ?auto_31260 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31320 - SURFACE
      ?auto_31321 - SURFACE
      ?auto_31322 - SURFACE
      ?auto_31319 - SURFACE
      ?auto_31323 - SURFACE
      ?auto_31325 - SURFACE
      ?auto_31324 - SURFACE
    )
    :vars
    (
      ?auto_31328 - HOIST
      ?auto_31329 - PLACE
      ?auto_31330 - PLACE
      ?auto_31326 - HOIST
      ?auto_31327 - SURFACE
      ?auto_31331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31328 ?auto_31329 ) ( IS-CRATE ?auto_31324 ) ( not ( = ?auto_31325 ?auto_31324 ) ) ( not ( = ?auto_31323 ?auto_31325 ) ) ( not ( = ?auto_31323 ?auto_31324 ) ) ( not ( = ?auto_31330 ?auto_31329 ) ) ( HOIST-AT ?auto_31326 ?auto_31330 ) ( not ( = ?auto_31328 ?auto_31326 ) ) ( AVAILABLE ?auto_31326 ) ( SURFACE-AT ?auto_31324 ?auto_31330 ) ( ON ?auto_31324 ?auto_31327 ) ( CLEAR ?auto_31324 ) ( not ( = ?auto_31325 ?auto_31327 ) ) ( not ( = ?auto_31324 ?auto_31327 ) ) ( not ( = ?auto_31323 ?auto_31327 ) ) ( TRUCK-AT ?auto_31331 ?auto_31329 ) ( SURFACE-AT ?auto_31323 ?auto_31329 ) ( CLEAR ?auto_31323 ) ( LIFTING ?auto_31328 ?auto_31325 ) ( IS-CRATE ?auto_31325 ) ( ON ?auto_31321 ?auto_31320 ) ( ON ?auto_31322 ?auto_31321 ) ( ON ?auto_31319 ?auto_31322 ) ( ON ?auto_31323 ?auto_31319 ) ( not ( = ?auto_31320 ?auto_31321 ) ) ( not ( = ?auto_31320 ?auto_31322 ) ) ( not ( = ?auto_31320 ?auto_31319 ) ) ( not ( = ?auto_31320 ?auto_31323 ) ) ( not ( = ?auto_31320 ?auto_31325 ) ) ( not ( = ?auto_31320 ?auto_31324 ) ) ( not ( = ?auto_31320 ?auto_31327 ) ) ( not ( = ?auto_31321 ?auto_31322 ) ) ( not ( = ?auto_31321 ?auto_31319 ) ) ( not ( = ?auto_31321 ?auto_31323 ) ) ( not ( = ?auto_31321 ?auto_31325 ) ) ( not ( = ?auto_31321 ?auto_31324 ) ) ( not ( = ?auto_31321 ?auto_31327 ) ) ( not ( = ?auto_31322 ?auto_31319 ) ) ( not ( = ?auto_31322 ?auto_31323 ) ) ( not ( = ?auto_31322 ?auto_31325 ) ) ( not ( = ?auto_31322 ?auto_31324 ) ) ( not ( = ?auto_31322 ?auto_31327 ) ) ( not ( = ?auto_31319 ?auto_31323 ) ) ( not ( = ?auto_31319 ?auto_31325 ) ) ( not ( = ?auto_31319 ?auto_31324 ) ) ( not ( = ?auto_31319 ?auto_31327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31323 ?auto_31325 ?auto_31324 )
      ( MAKE-6CRATE-VERIFY ?auto_31320 ?auto_31321 ?auto_31322 ?auto_31319 ?auto_31323 ?auto_31325 ?auto_31324 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31384 - SURFACE
      ?auto_31385 - SURFACE
      ?auto_31386 - SURFACE
      ?auto_31383 - SURFACE
      ?auto_31387 - SURFACE
      ?auto_31389 - SURFACE
      ?auto_31388 - SURFACE
    )
    :vars
    (
      ?auto_31391 - HOIST
      ?auto_31394 - PLACE
      ?auto_31390 - PLACE
      ?auto_31395 - HOIST
      ?auto_31393 - SURFACE
      ?auto_31392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31391 ?auto_31394 ) ( IS-CRATE ?auto_31388 ) ( not ( = ?auto_31389 ?auto_31388 ) ) ( not ( = ?auto_31387 ?auto_31389 ) ) ( not ( = ?auto_31387 ?auto_31388 ) ) ( not ( = ?auto_31390 ?auto_31394 ) ) ( HOIST-AT ?auto_31395 ?auto_31390 ) ( not ( = ?auto_31391 ?auto_31395 ) ) ( AVAILABLE ?auto_31395 ) ( SURFACE-AT ?auto_31388 ?auto_31390 ) ( ON ?auto_31388 ?auto_31393 ) ( CLEAR ?auto_31388 ) ( not ( = ?auto_31389 ?auto_31393 ) ) ( not ( = ?auto_31388 ?auto_31393 ) ) ( not ( = ?auto_31387 ?auto_31393 ) ) ( TRUCK-AT ?auto_31392 ?auto_31394 ) ( SURFACE-AT ?auto_31387 ?auto_31394 ) ( CLEAR ?auto_31387 ) ( IS-CRATE ?auto_31389 ) ( AVAILABLE ?auto_31391 ) ( IN ?auto_31389 ?auto_31392 ) ( ON ?auto_31385 ?auto_31384 ) ( ON ?auto_31386 ?auto_31385 ) ( ON ?auto_31383 ?auto_31386 ) ( ON ?auto_31387 ?auto_31383 ) ( not ( = ?auto_31384 ?auto_31385 ) ) ( not ( = ?auto_31384 ?auto_31386 ) ) ( not ( = ?auto_31384 ?auto_31383 ) ) ( not ( = ?auto_31384 ?auto_31387 ) ) ( not ( = ?auto_31384 ?auto_31389 ) ) ( not ( = ?auto_31384 ?auto_31388 ) ) ( not ( = ?auto_31384 ?auto_31393 ) ) ( not ( = ?auto_31385 ?auto_31386 ) ) ( not ( = ?auto_31385 ?auto_31383 ) ) ( not ( = ?auto_31385 ?auto_31387 ) ) ( not ( = ?auto_31385 ?auto_31389 ) ) ( not ( = ?auto_31385 ?auto_31388 ) ) ( not ( = ?auto_31385 ?auto_31393 ) ) ( not ( = ?auto_31386 ?auto_31383 ) ) ( not ( = ?auto_31386 ?auto_31387 ) ) ( not ( = ?auto_31386 ?auto_31389 ) ) ( not ( = ?auto_31386 ?auto_31388 ) ) ( not ( = ?auto_31386 ?auto_31393 ) ) ( not ( = ?auto_31383 ?auto_31387 ) ) ( not ( = ?auto_31383 ?auto_31389 ) ) ( not ( = ?auto_31383 ?auto_31388 ) ) ( not ( = ?auto_31383 ?auto_31393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31387 ?auto_31389 ?auto_31388 )
      ( MAKE-6CRATE-VERIFY ?auto_31384 ?auto_31385 ?auto_31386 ?auto_31383 ?auto_31387 ?auto_31389 ?auto_31388 ) )
  )

)

