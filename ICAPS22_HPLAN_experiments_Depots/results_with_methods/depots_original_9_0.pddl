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
      ?auto_45855 - SURFACE
      ?auto_45856 - SURFACE
    )
    :vars
    (
      ?auto_45857 - HOIST
      ?auto_45858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45857 ?auto_45858 ) ( SURFACE-AT ?auto_45856 ?auto_45858 ) ( CLEAR ?auto_45856 ) ( LIFTING ?auto_45857 ?auto_45855 ) ( IS-CRATE ?auto_45855 ) ( not ( = ?auto_45855 ?auto_45856 ) ) )
    :subtasks
    ( ( !DROP ?auto_45857 ?auto_45855 ?auto_45856 ?auto_45858 )
      ( MAKE-ON-VERIFY ?auto_45855 ?auto_45856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45859 - SURFACE
      ?auto_45860 - SURFACE
    )
    :vars
    (
      ?auto_45861 - HOIST
      ?auto_45862 - PLACE
      ?auto_45863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45861 ?auto_45862 ) ( SURFACE-AT ?auto_45860 ?auto_45862 ) ( CLEAR ?auto_45860 ) ( IS-CRATE ?auto_45859 ) ( not ( = ?auto_45859 ?auto_45860 ) ) ( TRUCK-AT ?auto_45863 ?auto_45862 ) ( AVAILABLE ?auto_45861 ) ( IN ?auto_45859 ?auto_45863 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45861 ?auto_45859 ?auto_45863 ?auto_45862 )
      ( MAKE-ON ?auto_45859 ?auto_45860 )
      ( MAKE-ON-VERIFY ?auto_45859 ?auto_45860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45864 - SURFACE
      ?auto_45865 - SURFACE
    )
    :vars
    (
      ?auto_45866 - HOIST
      ?auto_45868 - PLACE
      ?auto_45867 - TRUCK
      ?auto_45869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45866 ?auto_45868 ) ( SURFACE-AT ?auto_45865 ?auto_45868 ) ( CLEAR ?auto_45865 ) ( IS-CRATE ?auto_45864 ) ( not ( = ?auto_45864 ?auto_45865 ) ) ( AVAILABLE ?auto_45866 ) ( IN ?auto_45864 ?auto_45867 ) ( TRUCK-AT ?auto_45867 ?auto_45869 ) ( not ( = ?auto_45869 ?auto_45868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45867 ?auto_45869 ?auto_45868 )
      ( MAKE-ON ?auto_45864 ?auto_45865 )
      ( MAKE-ON-VERIFY ?auto_45864 ?auto_45865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45870 - SURFACE
      ?auto_45871 - SURFACE
    )
    :vars
    (
      ?auto_45872 - HOIST
      ?auto_45873 - PLACE
      ?auto_45874 - TRUCK
      ?auto_45875 - PLACE
      ?auto_45876 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45872 ?auto_45873 ) ( SURFACE-AT ?auto_45871 ?auto_45873 ) ( CLEAR ?auto_45871 ) ( IS-CRATE ?auto_45870 ) ( not ( = ?auto_45870 ?auto_45871 ) ) ( AVAILABLE ?auto_45872 ) ( TRUCK-AT ?auto_45874 ?auto_45875 ) ( not ( = ?auto_45875 ?auto_45873 ) ) ( HOIST-AT ?auto_45876 ?auto_45875 ) ( LIFTING ?auto_45876 ?auto_45870 ) ( not ( = ?auto_45872 ?auto_45876 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45876 ?auto_45870 ?auto_45874 ?auto_45875 )
      ( MAKE-ON ?auto_45870 ?auto_45871 )
      ( MAKE-ON-VERIFY ?auto_45870 ?auto_45871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45877 - SURFACE
      ?auto_45878 - SURFACE
    )
    :vars
    (
      ?auto_45879 - HOIST
      ?auto_45882 - PLACE
      ?auto_45883 - TRUCK
      ?auto_45880 - PLACE
      ?auto_45881 - HOIST
      ?auto_45884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45879 ?auto_45882 ) ( SURFACE-AT ?auto_45878 ?auto_45882 ) ( CLEAR ?auto_45878 ) ( IS-CRATE ?auto_45877 ) ( not ( = ?auto_45877 ?auto_45878 ) ) ( AVAILABLE ?auto_45879 ) ( TRUCK-AT ?auto_45883 ?auto_45880 ) ( not ( = ?auto_45880 ?auto_45882 ) ) ( HOIST-AT ?auto_45881 ?auto_45880 ) ( not ( = ?auto_45879 ?auto_45881 ) ) ( AVAILABLE ?auto_45881 ) ( SURFACE-AT ?auto_45877 ?auto_45880 ) ( ON ?auto_45877 ?auto_45884 ) ( CLEAR ?auto_45877 ) ( not ( = ?auto_45877 ?auto_45884 ) ) ( not ( = ?auto_45878 ?auto_45884 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45881 ?auto_45877 ?auto_45884 ?auto_45880 )
      ( MAKE-ON ?auto_45877 ?auto_45878 )
      ( MAKE-ON-VERIFY ?auto_45877 ?auto_45878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45885 - SURFACE
      ?auto_45886 - SURFACE
    )
    :vars
    (
      ?auto_45889 - HOIST
      ?auto_45887 - PLACE
      ?auto_45891 - PLACE
      ?auto_45892 - HOIST
      ?auto_45890 - SURFACE
      ?auto_45888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45889 ?auto_45887 ) ( SURFACE-AT ?auto_45886 ?auto_45887 ) ( CLEAR ?auto_45886 ) ( IS-CRATE ?auto_45885 ) ( not ( = ?auto_45885 ?auto_45886 ) ) ( AVAILABLE ?auto_45889 ) ( not ( = ?auto_45891 ?auto_45887 ) ) ( HOIST-AT ?auto_45892 ?auto_45891 ) ( not ( = ?auto_45889 ?auto_45892 ) ) ( AVAILABLE ?auto_45892 ) ( SURFACE-AT ?auto_45885 ?auto_45891 ) ( ON ?auto_45885 ?auto_45890 ) ( CLEAR ?auto_45885 ) ( not ( = ?auto_45885 ?auto_45890 ) ) ( not ( = ?auto_45886 ?auto_45890 ) ) ( TRUCK-AT ?auto_45888 ?auto_45887 ) )
    :subtasks
    ( ( !DRIVE ?auto_45888 ?auto_45887 ?auto_45891 )
      ( MAKE-ON ?auto_45885 ?auto_45886 )
      ( MAKE-ON-VERIFY ?auto_45885 ?auto_45886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45895 - SURFACE
      ?auto_45896 - SURFACE
    )
    :vars
    (
      ?auto_45897 - HOIST
      ?auto_45898 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45897 ?auto_45898 ) ( SURFACE-AT ?auto_45896 ?auto_45898 ) ( CLEAR ?auto_45896 ) ( LIFTING ?auto_45897 ?auto_45895 ) ( IS-CRATE ?auto_45895 ) ( not ( = ?auto_45895 ?auto_45896 ) ) )
    :subtasks
    ( ( !DROP ?auto_45897 ?auto_45895 ?auto_45896 ?auto_45898 )
      ( MAKE-ON-VERIFY ?auto_45895 ?auto_45896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45899 - SURFACE
      ?auto_45900 - SURFACE
    )
    :vars
    (
      ?auto_45902 - HOIST
      ?auto_45901 - PLACE
      ?auto_45903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45902 ?auto_45901 ) ( SURFACE-AT ?auto_45900 ?auto_45901 ) ( CLEAR ?auto_45900 ) ( IS-CRATE ?auto_45899 ) ( not ( = ?auto_45899 ?auto_45900 ) ) ( TRUCK-AT ?auto_45903 ?auto_45901 ) ( AVAILABLE ?auto_45902 ) ( IN ?auto_45899 ?auto_45903 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45902 ?auto_45899 ?auto_45903 ?auto_45901 )
      ( MAKE-ON ?auto_45899 ?auto_45900 )
      ( MAKE-ON-VERIFY ?auto_45899 ?auto_45900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45904 - SURFACE
      ?auto_45905 - SURFACE
    )
    :vars
    (
      ?auto_45907 - HOIST
      ?auto_45906 - PLACE
      ?auto_45908 - TRUCK
      ?auto_45909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45907 ?auto_45906 ) ( SURFACE-AT ?auto_45905 ?auto_45906 ) ( CLEAR ?auto_45905 ) ( IS-CRATE ?auto_45904 ) ( not ( = ?auto_45904 ?auto_45905 ) ) ( AVAILABLE ?auto_45907 ) ( IN ?auto_45904 ?auto_45908 ) ( TRUCK-AT ?auto_45908 ?auto_45909 ) ( not ( = ?auto_45909 ?auto_45906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45908 ?auto_45909 ?auto_45906 )
      ( MAKE-ON ?auto_45904 ?auto_45905 )
      ( MAKE-ON-VERIFY ?auto_45904 ?auto_45905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45910 - SURFACE
      ?auto_45911 - SURFACE
    )
    :vars
    (
      ?auto_45913 - HOIST
      ?auto_45914 - PLACE
      ?auto_45912 - TRUCK
      ?auto_45915 - PLACE
      ?auto_45916 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45913 ?auto_45914 ) ( SURFACE-AT ?auto_45911 ?auto_45914 ) ( CLEAR ?auto_45911 ) ( IS-CRATE ?auto_45910 ) ( not ( = ?auto_45910 ?auto_45911 ) ) ( AVAILABLE ?auto_45913 ) ( TRUCK-AT ?auto_45912 ?auto_45915 ) ( not ( = ?auto_45915 ?auto_45914 ) ) ( HOIST-AT ?auto_45916 ?auto_45915 ) ( LIFTING ?auto_45916 ?auto_45910 ) ( not ( = ?auto_45913 ?auto_45916 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45916 ?auto_45910 ?auto_45912 ?auto_45915 )
      ( MAKE-ON ?auto_45910 ?auto_45911 )
      ( MAKE-ON-VERIFY ?auto_45910 ?auto_45911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45917 - SURFACE
      ?auto_45918 - SURFACE
    )
    :vars
    (
      ?auto_45920 - HOIST
      ?auto_45921 - PLACE
      ?auto_45922 - TRUCK
      ?auto_45919 - PLACE
      ?auto_45923 - HOIST
      ?auto_45924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45920 ?auto_45921 ) ( SURFACE-AT ?auto_45918 ?auto_45921 ) ( CLEAR ?auto_45918 ) ( IS-CRATE ?auto_45917 ) ( not ( = ?auto_45917 ?auto_45918 ) ) ( AVAILABLE ?auto_45920 ) ( TRUCK-AT ?auto_45922 ?auto_45919 ) ( not ( = ?auto_45919 ?auto_45921 ) ) ( HOIST-AT ?auto_45923 ?auto_45919 ) ( not ( = ?auto_45920 ?auto_45923 ) ) ( AVAILABLE ?auto_45923 ) ( SURFACE-AT ?auto_45917 ?auto_45919 ) ( ON ?auto_45917 ?auto_45924 ) ( CLEAR ?auto_45917 ) ( not ( = ?auto_45917 ?auto_45924 ) ) ( not ( = ?auto_45918 ?auto_45924 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45923 ?auto_45917 ?auto_45924 ?auto_45919 )
      ( MAKE-ON ?auto_45917 ?auto_45918 )
      ( MAKE-ON-VERIFY ?auto_45917 ?auto_45918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45925 - SURFACE
      ?auto_45926 - SURFACE
    )
    :vars
    (
      ?auto_45932 - HOIST
      ?auto_45927 - PLACE
      ?auto_45930 - PLACE
      ?auto_45928 - HOIST
      ?auto_45931 - SURFACE
      ?auto_45929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45932 ?auto_45927 ) ( SURFACE-AT ?auto_45926 ?auto_45927 ) ( CLEAR ?auto_45926 ) ( IS-CRATE ?auto_45925 ) ( not ( = ?auto_45925 ?auto_45926 ) ) ( AVAILABLE ?auto_45932 ) ( not ( = ?auto_45930 ?auto_45927 ) ) ( HOIST-AT ?auto_45928 ?auto_45930 ) ( not ( = ?auto_45932 ?auto_45928 ) ) ( AVAILABLE ?auto_45928 ) ( SURFACE-AT ?auto_45925 ?auto_45930 ) ( ON ?auto_45925 ?auto_45931 ) ( CLEAR ?auto_45925 ) ( not ( = ?auto_45925 ?auto_45931 ) ) ( not ( = ?auto_45926 ?auto_45931 ) ) ( TRUCK-AT ?auto_45929 ?auto_45927 ) )
    :subtasks
    ( ( !DRIVE ?auto_45929 ?auto_45927 ?auto_45930 )
      ( MAKE-ON ?auto_45925 ?auto_45926 )
      ( MAKE-ON-VERIFY ?auto_45925 ?auto_45926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45933 - SURFACE
      ?auto_45934 - SURFACE
    )
    :vars
    (
      ?auto_45940 - HOIST
      ?auto_45935 - PLACE
      ?auto_45939 - PLACE
      ?auto_45937 - HOIST
      ?auto_45938 - SURFACE
      ?auto_45936 - TRUCK
      ?auto_45941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45940 ?auto_45935 ) ( IS-CRATE ?auto_45933 ) ( not ( = ?auto_45933 ?auto_45934 ) ) ( not ( = ?auto_45939 ?auto_45935 ) ) ( HOIST-AT ?auto_45937 ?auto_45939 ) ( not ( = ?auto_45940 ?auto_45937 ) ) ( AVAILABLE ?auto_45937 ) ( SURFACE-AT ?auto_45933 ?auto_45939 ) ( ON ?auto_45933 ?auto_45938 ) ( CLEAR ?auto_45933 ) ( not ( = ?auto_45933 ?auto_45938 ) ) ( not ( = ?auto_45934 ?auto_45938 ) ) ( TRUCK-AT ?auto_45936 ?auto_45935 ) ( SURFACE-AT ?auto_45941 ?auto_45935 ) ( CLEAR ?auto_45941 ) ( LIFTING ?auto_45940 ?auto_45934 ) ( IS-CRATE ?auto_45934 ) ( not ( = ?auto_45933 ?auto_45941 ) ) ( not ( = ?auto_45934 ?auto_45941 ) ) ( not ( = ?auto_45938 ?auto_45941 ) ) )
    :subtasks
    ( ( !DROP ?auto_45940 ?auto_45934 ?auto_45941 ?auto_45935 )
      ( MAKE-ON ?auto_45933 ?auto_45934 )
      ( MAKE-ON-VERIFY ?auto_45933 ?auto_45934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45942 - SURFACE
      ?auto_45943 - SURFACE
    )
    :vars
    (
      ?auto_45949 - HOIST
      ?auto_45945 - PLACE
      ?auto_45947 - PLACE
      ?auto_45946 - HOIST
      ?auto_45944 - SURFACE
      ?auto_45948 - TRUCK
      ?auto_45950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45949 ?auto_45945 ) ( IS-CRATE ?auto_45942 ) ( not ( = ?auto_45942 ?auto_45943 ) ) ( not ( = ?auto_45947 ?auto_45945 ) ) ( HOIST-AT ?auto_45946 ?auto_45947 ) ( not ( = ?auto_45949 ?auto_45946 ) ) ( AVAILABLE ?auto_45946 ) ( SURFACE-AT ?auto_45942 ?auto_45947 ) ( ON ?auto_45942 ?auto_45944 ) ( CLEAR ?auto_45942 ) ( not ( = ?auto_45942 ?auto_45944 ) ) ( not ( = ?auto_45943 ?auto_45944 ) ) ( TRUCK-AT ?auto_45948 ?auto_45945 ) ( SURFACE-AT ?auto_45950 ?auto_45945 ) ( CLEAR ?auto_45950 ) ( IS-CRATE ?auto_45943 ) ( not ( = ?auto_45942 ?auto_45950 ) ) ( not ( = ?auto_45943 ?auto_45950 ) ) ( not ( = ?auto_45944 ?auto_45950 ) ) ( AVAILABLE ?auto_45949 ) ( IN ?auto_45943 ?auto_45948 ) )
    :subtasks
    ( ( !UNLOAD ?auto_45949 ?auto_45943 ?auto_45948 ?auto_45945 )
      ( MAKE-ON ?auto_45942 ?auto_45943 )
      ( MAKE-ON-VERIFY ?auto_45942 ?auto_45943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45951 - SURFACE
      ?auto_45952 - SURFACE
    )
    :vars
    (
      ?auto_45956 - HOIST
      ?auto_45957 - PLACE
      ?auto_45954 - PLACE
      ?auto_45955 - HOIST
      ?auto_45958 - SURFACE
      ?auto_45959 - SURFACE
      ?auto_45953 - TRUCK
      ?auto_45960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45956 ?auto_45957 ) ( IS-CRATE ?auto_45951 ) ( not ( = ?auto_45951 ?auto_45952 ) ) ( not ( = ?auto_45954 ?auto_45957 ) ) ( HOIST-AT ?auto_45955 ?auto_45954 ) ( not ( = ?auto_45956 ?auto_45955 ) ) ( AVAILABLE ?auto_45955 ) ( SURFACE-AT ?auto_45951 ?auto_45954 ) ( ON ?auto_45951 ?auto_45958 ) ( CLEAR ?auto_45951 ) ( not ( = ?auto_45951 ?auto_45958 ) ) ( not ( = ?auto_45952 ?auto_45958 ) ) ( SURFACE-AT ?auto_45959 ?auto_45957 ) ( CLEAR ?auto_45959 ) ( IS-CRATE ?auto_45952 ) ( not ( = ?auto_45951 ?auto_45959 ) ) ( not ( = ?auto_45952 ?auto_45959 ) ) ( not ( = ?auto_45958 ?auto_45959 ) ) ( AVAILABLE ?auto_45956 ) ( IN ?auto_45952 ?auto_45953 ) ( TRUCK-AT ?auto_45953 ?auto_45960 ) ( not ( = ?auto_45960 ?auto_45957 ) ) ( not ( = ?auto_45954 ?auto_45960 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_45953 ?auto_45960 ?auto_45957 )
      ( MAKE-ON ?auto_45951 ?auto_45952 )
      ( MAKE-ON-VERIFY ?auto_45951 ?auto_45952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45961 - SURFACE
      ?auto_45962 - SURFACE
    )
    :vars
    (
      ?auto_45970 - HOIST
      ?auto_45968 - PLACE
      ?auto_45966 - PLACE
      ?auto_45963 - HOIST
      ?auto_45969 - SURFACE
      ?auto_45965 - SURFACE
      ?auto_45964 - TRUCK
      ?auto_45967 - PLACE
      ?auto_45971 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45970 ?auto_45968 ) ( IS-CRATE ?auto_45961 ) ( not ( = ?auto_45961 ?auto_45962 ) ) ( not ( = ?auto_45966 ?auto_45968 ) ) ( HOIST-AT ?auto_45963 ?auto_45966 ) ( not ( = ?auto_45970 ?auto_45963 ) ) ( AVAILABLE ?auto_45963 ) ( SURFACE-AT ?auto_45961 ?auto_45966 ) ( ON ?auto_45961 ?auto_45969 ) ( CLEAR ?auto_45961 ) ( not ( = ?auto_45961 ?auto_45969 ) ) ( not ( = ?auto_45962 ?auto_45969 ) ) ( SURFACE-AT ?auto_45965 ?auto_45968 ) ( CLEAR ?auto_45965 ) ( IS-CRATE ?auto_45962 ) ( not ( = ?auto_45961 ?auto_45965 ) ) ( not ( = ?auto_45962 ?auto_45965 ) ) ( not ( = ?auto_45969 ?auto_45965 ) ) ( AVAILABLE ?auto_45970 ) ( TRUCK-AT ?auto_45964 ?auto_45967 ) ( not ( = ?auto_45967 ?auto_45968 ) ) ( not ( = ?auto_45966 ?auto_45967 ) ) ( HOIST-AT ?auto_45971 ?auto_45967 ) ( LIFTING ?auto_45971 ?auto_45962 ) ( not ( = ?auto_45970 ?auto_45971 ) ) ( not ( = ?auto_45963 ?auto_45971 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45971 ?auto_45962 ?auto_45964 ?auto_45967 )
      ( MAKE-ON ?auto_45961 ?auto_45962 )
      ( MAKE-ON-VERIFY ?auto_45961 ?auto_45962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45972 - SURFACE
      ?auto_45973 - SURFACE
    )
    :vars
    (
      ?auto_45976 - HOIST
      ?auto_45974 - PLACE
      ?auto_45982 - PLACE
      ?auto_45977 - HOIST
      ?auto_45978 - SURFACE
      ?auto_45980 - SURFACE
      ?auto_45981 - TRUCK
      ?auto_45975 - PLACE
      ?auto_45979 - HOIST
      ?auto_45983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45976 ?auto_45974 ) ( IS-CRATE ?auto_45972 ) ( not ( = ?auto_45972 ?auto_45973 ) ) ( not ( = ?auto_45982 ?auto_45974 ) ) ( HOIST-AT ?auto_45977 ?auto_45982 ) ( not ( = ?auto_45976 ?auto_45977 ) ) ( AVAILABLE ?auto_45977 ) ( SURFACE-AT ?auto_45972 ?auto_45982 ) ( ON ?auto_45972 ?auto_45978 ) ( CLEAR ?auto_45972 ) ( not ( = ?auto_45972 ?auto_45978 ) ) ( not ( = ?auto_45973 ?auto_45978 ) ) ( SURFACE-AT ?auto_45980 ?auto_45974 ) ( CLEAR ?auto_45980 ) ( IS-CRATE ?auto_45973 ) ( not ( = ?auto_45972 ?auto_45980 ) ) ( not ( = ?auto_45973 ?auto_45980 ) ) ( not ( = ?auto_45978 ?auto_45980 ) ) ( AVAILABLE ?auto_45976 ) ( TRUCK-AT ?auto_45981 ?auto_45975 ) ( not ( = ?auto_45975 ?auto_45974 ) ) ( not ( = ?auto_45982 ?auto_45975 ) ) ( HOIST-AT ?auto_45979 ?auto_45975 ) ( not ( = ?auto_45976 ?auto_45979 ) ) ( not ( = ?auto_45977 ?auto_45979 ) ) ( AVAILABLE ?auto_45979 ) ( SURFACE-AT ?auto_45973 ?auto_45975 ) ( ON ?auto_45973 ?auto_45983 ) ( CLEAR ?auto_45973 ) ( not ( = ?auto_45972 ?auto_45983 ) ) ( not ( = ?auto_45973 ?auto_45983 ) ) ( not ( = ?auto_45978 ?auto_45983 ) ) ( not ( = ?auto_45980 ?auto_45983 ) ) )
    :subtasks
    ( ( !LIFT ?auto_45979 ?auto_45973 ?auto_45983 ?auto_45975 )
      ( MAKE-ON ?auto_45972 ?auto_45973 )
      ( MAKE-ON-VERIFY ?auto_45972 ?auto_45973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45984 - SURFACE
      ?auto_45985 - SURFACE
    )
    :vars
    (
      ?auto_45993 - HOIST
      ?auto_45994 - PLACE
      ?auto_45987 - PLACE
      ?auto_45986 - HOIST
      ?auto_45995 - SURFACE
      ?auto_45988 - SURFACE
      ?auto_45991 - PLACE
      ?auto_45990 - HOIST
      ?auto_45992 - SURFACE
      ?auto_45989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45993 ?auto_45994 ) ( IS-CRATE ?auto_45984 ) ( not ( = ?auto_45984 ?auto_45985 ) ) ( not ( = ?auto_45987 ?auto_45994 ) ) ( HOIST-AT ?auto_45986 ?auto_45987 ) ( not ( = ?auto_45993 ?auto_45986 ) ) ( AVAILABLE ?auto_45986 ) ( SURFACE-AT ?auto_45984 ?auto_45987 ) ( ON ?auto_45984 ?auto_45995 ) ( CLEAR ?auto_45984 ) ( not ( = ?auto_45984 ?auto_45995 ) ) ( not ( = ?auto_45985 ?auto_45995 ) ) ( SURFACE-AT ?auto_45988 ?auto_45994 ) ( CLEAR ?auto_45988 ) ( IS-CRATE ?auto_45985 ) ( not ( = ?auto_45984 ?auto_45988 ) ) ( not ( = ?auto_45985 ?auto_45988 ) ) ( not ( = ?auto_45995 ?auto_45988 ) ) ( AVAILABLE ?auto_45993 ) ( not ( = ?auto_45991 ?auto_45994 ) ) ( not ( = ?auto_45987 ?auto_45991 ) ) ( HOIST-AT ?auto_45990 ?auto_45991 ) ( not ( = ?auto_45993 ?auto_45990 ) ) ( not ( = ?auto_45986 ?auto_45990 ) ) ( AVAILABLE ?auto_45990 ) ( SURFACE-AT ?auto_45985 ?auto_45991 ) ( ON ?auto_45985 ?auto_45992 ) ( CLEAR ?auto_45985 ) ( not ( = ?auto_45984 ?auto_45992 ) ) ( not ( = ?auto_45985 ?auto_45992 ) ) ( not ( = ?auto_45995 ?auto_45992 ) ) ( not ( = ?auto_45988 ?auto_45992 ) ) ( TRUCK-AT ?auto_45989 ?auto_45994 ) )
    :subtasks
    ( ( !DRIVE ?auto_45989 ?auto_45994 ?auto_45991 )
      ( MAKE-ON ?auto_45984 ?auto_45985 )
      ( MAKE-ON-VERIFY ?auto_45984 ?auto_45985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_45998 - SURFACE
      ?auto_45999 - SURFACE
    )
    :vars
    (
      ?auto_46000 - HOIST
      ?auto_46001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46000 ?auto_46001 ) ( SURFACE-AT ?auto_45999 ?auto_46001 ) ( CLEAR ?auto_45999 ) ( LIFTING ?auto_46000 ?auto_45998 ) ( IS-CRATE ?auto_45998 ) ( not ( = ?auto_45998 ?auto_45999 ) ) )
    :subtasks
    ( ( !DROP ?auto_46000 ?auto_45998 ?auto_45999 ?auto_46001 )
      ( MAKE-ON-VERIFY ?auto_45998 ?auto_45999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46002 - SURFACE
      ?auto_46003 - SURFACE
    )
    :vars
    (
      ?auto_46004 - HOIST
      ?auto_46005 - PLACE
      ?auto_46006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46004 ?auto_46005 ) ( SURFACE-AT ?auto_46003 ?auto_46005 ) ( CLEAR ?auto_46003 ) ( IS-CRATE ?auto_46002 ) ( not ( = ?auto_46002 ?auto_46003 ) ) ( TRUCK-AT ?auto_46006 ?auto_46005 ) ( AVAILABLE ?auto_46004 ) ( IN ?auto_46002 ?auto_46006 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46004 ?auto_46002 ?auto_46006 ?auto_46005 )
      ( MAKE-ON ?auto_46002 ?auto_46003 )
      ( MAKE-ON-VERIFY ?auto_46002 ?auto_46003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46007 - SURFACE
      ?auto_46008 - SURFACE
    )
    :vars
    (
      ?auto_46010 - HOIST
      ?auto_46011 - PLACE
      ?auto_46009 - TRUCK
      ?auto_46012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46010 ?auto_46011 ) ( SURFACE-AT ?auto_46008 ?auto_46011 ) ( CLEAR ?auto_46008 ) ( IS-CRATE ?auto_46007 ) ( not ( = ?auto_46007 ?auto_46008 ) ) ( AVAILABLE ?auto_46010 ) ( IN ?auto_46007 ?auto_46009 ) ( TRUCK-AT ?auto_46009 ?auto_46012 ) ( not ( = ?auto_46012 ?auto_46011 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46009 ?auto_46012 ?auto_46011 )
      ( MAKE-ON ?auto_46007 ?auto_46008 )
      ( MAKE-ON-VERIFY ?auto_46007 ?auto_46008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46013 - SURFACE
      ?auto_46014 - SURFACE
    )
    :vars
    (
      ?auto_46015 - HOIST
      ?auto_46017 - PLACE
      ?auto_46018 - TRUCK
      ?auto_46016 - PLACE
      ?auto_46019 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46015 ?auto_46017 ) ( SURFACE-AT ?auto_46014 ?auto_46017 ) ( CLEAR ?auto_46014 ) ( IS-CRATE ?auto_46013 ) ( not ( = ?auto_46013 ?auto_46014 ) ) ( AVAILABLE ?auto_46015 ) ( TRUCK-AT ?auto_46018 ?auto_46016 ) ( not ( = ?auto_46016 ?auto_46017 ) ) ( HOIST-AT ?auto_46019 ?auto_46016 ) ( LIFTING ?auto_46019 ?auto_46013 ) ( not ( = ?auto_46015 ?auto_46019 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46019 ?auto_46013 ?auto_46018 ?auto_46016 )
      ( MAKE-ON ?auto_46013 ?auto_46014 )
      ( MAKE-ON-VERIFY ?auto_46013 ?auto_46014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46020 - SURFACE
      ?auto_46021 - SURFACE
    )
    :vars
    (
      ?auto_46022 - HOIST
      ?auto_46025 - PLACE
      ?auto_46024 - TRUCK
      ?auto_46026 - PLACE
      ?auto_46023 - HOIST
      ?auto_46027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46022 ?auto_46025 ) ( SURFACE-AT ?auto_46021 ?auto_46025 ) ( CLEAR ?auto_46021 ) ( IS-CRATE ?auto_46020 ) ( not ( = ?auto_46020 ?auto_46021 ) ) ( AVAILABLE ?auto_46022 ) ( TRUCK-AT ?auto_46024 ?auto_46026 ) ( not ( = ?auto_46026 ?auto_46025 ) ) ( HOIST-AT ?auto_46023 ?auto_46026 ) ( not ( = ?auto_46022 ?auto_46023 ) ) ( AVAILABLE ?auto_46023 ) ( SURFACE-AT ?auto_46020 ?auto_46026 ) ( ON ?auto_46020 ?auto_46027 ) ( CLEAR ?auto_46020 ) ( not ( = ?auto_46020 ?auto_46027 ) ) ( not ( = ?auto_46021 ?auto_46027 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46023 ?auto_46020 ?auto_46027 ?auto_46026 )
      ( MAKE-ON ?auto_46020 ?auto_46021 )
      ( MAKE-ON-VERIFY ?auto_46020 ?auto_46021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46028 - SURFACE
      ?auto_46029 - SURFACE
    )
    :vars
    (
      ?auto_46035 - HOIST
      ?auto_46031 - PLACE
      ?auto_46030 - PLACE
      ?auto_46032 - HOIST
      ?auto_46034 - SURFACE
      ?auto_46033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46035 ?auto_46031 ) ( SURFACE-AT ?auto_46029 ?auto_46031 ) ( CLEAR ?auto_46029 ) ( IS-CRATE ?auto_46028 ) ( not ( = ?auto_46028 ?auto_46029 ) ) ( AVAILABLE ?auto_46035 ) ( not ( = ?auto_46030 ?auto_46031 ) ) ( HOIST-AT ?auto_46032 ?auto_46030 ) ( not ( = ?auto_46035 ?auto_46032 ) ) ( AVAILABLE ?auto_46032 ) ( SURFACE-AT ?auto_46028 ?auto_46030 ) ( ON ?auto_46028 ?auto_46034 ) ( CLEAR ?auto_46028 ) ( not ( = ?auto_46028 ?auto_46034 ) ) ( not ( = ?auto_46029 ?auto_46034 ) ) ( TRUCK-AT ?auto_46033 ?auto_46031 ) )
    :subtasks
    ( ( !DRIVE ?auto_46033 ?auto_46031 ?auto_46030 )
      ( MAKE-ON ?auto_46028 ?auto_46029 )
      ( MAKE-ON-VERIFY ?auto_46028 ?auto_46029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46036 - SURFACE
      ?auto_46037 - SURFACE
    )
    :vars
    (
      ?auto_46043 - HOIST
      ?auto_46042 - PLACE
      ?auto_46040 - PLACE
      ?auto_46041 - HOIST
      ?auto_46039 - SURFACE
      ?auto_46038 - TRUCK
      ?auto_46044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46043 ?auto_46042 ) ( IS-CRATE ?auto_46036 ) ( not ( = ?auto_46036 ?auto_46037 ) ) ( not ( = ?auto_46040 ?auto_46042 ) ) ( HOIST-AT ?auto_46041 ?auto_46040 ) ( not ( = ?auto_46043 ?auto_46041 ) ) ( AVAILABLE ?auto_46041 ) ( SURFACE-AT ?auto_46036 ?auto_46040 ) ( ON ?auto_46036 ?auto_46039 ) ( CLEAR ?auto_46036 ) ( not ( = ?auto_46036 ?auto_46039 ) ) ( not ( = ?auto_46037 ?auto_46039 ) ) ( TRUCK-AT ?auto_46038 ?auto_46042 ) ( SURFACE-AT ?auto_46044 ?auto_46042 ) ( CLEAR ?auto_46044 ) ( LIFTING ?auto_46043 ?auto_46037 ) ( IS-CRATE ?auto_46037 ) ( not ( = ?auto_46036 ?auto_46044 ) ) ( not ( = ?auto_46037 ?auto_46044 ) ) ( not ( = ?auto_46039 ?auto_46044 ) ) )
    :subtasks
    ( ( !DROP ?auto_46043 ?auto_46037 ?auto_46044 ?auto_46042 )
      ( MAKE-ON ?auto_46036 ?auto_46037 )
      ( MAKE-ON-VERIFY ?auto_46036 ?auto_46037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46045 - SURFACE
      ?auto_46046 - SURFACE
    )
    :vars
    (
      ?auto_46051 - HOIST
      ?auto_46052 - PLACE
      ?auto_46048 - PLACE
      ?auto_46053 - HOIST
      ?auto_46049 - SURFACE
      ?auto_46050 - TRUCK
      ?auto_46047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46051 ?auto_46052 ) ( IS-CRATE ?auto_46045 ) ( not ( = ?auto_46045 ?auto_46046 ) ) ( not ( = ?auto_46048 ?auto_46052 ) ) ( HOIST-AT ?auto_46053 ?auto_46048 ) ( not ( = ?auto_46051 ?auto_46053 ) ) ( AVAILABLE ?auto_46053 ) ( SURFACE-AT ?auto_46045 ?auto_46048 ) ( ON ?auto_46045 ?auto_46049 ) ( CLEAR ?auto_46045 ) ( not ( = ?auto_46045 ?auto_46049 ) ) ( not ( = ?auto_46046 ?auto_46049 ) ) ( TRUCK-AT ?auto_46050 ?auto_46052 ) ( SURFACE-AT ?auto_46047 ?auto_46052 ) ( CLEAR ?auto_46047 ) ( IS-CRATE ?auto_46046 ) ( not ( = ?auto_46045 ?auto_46047 ) ) ( not ( = ?auto_46046 ?auto_46047 ) ) ( not ( = ?auto_46049 ?auto_46047 ) ) ( AVAILABLE ?auto_46051 ) ( IN ?auto_46046 ?auto_46050 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46051 ?auto_46046 ?auto_46050 ?auto_46052 )
      ( MAKE-ON ?auto_46045 ?auto_46046 )
      ( MAKE-ON-VERIFY ?auto_46045 ?auto_46046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46054 - SURFACE
      ?auto_46055 - SURFACE
    )
    :vars
    (
      ?auto_46056 - HOIST
      ?auto_46057 - PLACE
      ?auto_46060 - PLACE
      ?auto_46062 - HOIST
      ?auto_46061 - SURFACE
      ?auto_46059 - SURFACE
      ?auto_46058 - TRUCK
      ?auto_46063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46056 ?auto_46057 ) ( IS-CRATE ?auto_46054 ) ( not ( = ?auto_46054 ?auto_46055 ) ) ( not ( = ?auto_46060 ?auto_46057 ) ) ( HOIST-AT ?auto_46062 ?auto_46060 ) ( not ( = ?auto_46056 ?auto_46062 ) ) ( AVAILABLE ?auto_46062 ) ( SURFACE-AT ?auto_46054 ?auto_46060 ) ( ON ?auto_46054 ?auto_46061 ) ( CLEAR ?auto_46054 ) ( not ( = ?auto_46054 ?auto_46061 ) ) ( not ( = ?auto_46055 ?auto_46061 ) ) ( SURFACE-AT ?auto_46059 ?auto_46057 ) ( CLEAR ?auto_46059 ) ( IS-CRATE ?auto_46055 ) ( not ( = ?auto_46054 ?auto_46059 ) ) ( not ( = ?auto_46055 ?auto_46059 ) ) ( not ( = ?auto_46061 ?auto_46059 ) ) ( AVAILABLE ?auto_46056 ) ( IN ?auto_46055 ?auto_46058 ) ( TRUCK-AT ?auto_46058 ?auto_46063 ) ( not ( = ?auto_46063 ?auto_46057 ) ) ( not ( = ?auto_46060 ?auto_46063 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46058 ?auto_46063 ?auto_46057 )
      ( MAKE-ON ?auto_46054 ?auto_46055 )
      ( MAKE-ON-VERIFY ?auto_46054 ?auto_46055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46064 - SURFACE
      ?auto_46065 - SURFACE
    )
    :vars
    (
      ?auto_46070 - HOIST
      ?auto_46066 - PLACE
      ?auto_46069 - PLACE
      ?auto_46073 - HOIST
      ?auto_46071 - SURFACE
      ?auto_46068 - SURFACE
      ?auto_46067 - TRUCK
      ?auto_46072 - PLACE
      ?auto_46074 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46070 ?auto_46066 ) ( IS-CRATE ?auto_46064 ) ( not ( = ?auto_46064 ?auto_46065 ) ) ( not ( = ?auto_46069 ?auto_46066 ) ) ( HOIST-AT ?auto_46073 ?auto_46069 ) ( not ( = ?auto_46070 ?auto_46073 ) ) ( AVAILABLE ?auto_46073 ) ( SURFACE-AT ?auto_46064 ?auto_46069 ) ( ON ?auto_46064 ?auto_46071 ) ( CLEAR ?auto_46064 ) ( not ( = ?auto_46064 ?auto_46071 ) ) ( not ( = ?auto_46065 ?auto_46071 ) ) ( SURFACE-AT ?auto_46068 ?auto_46066 ) ( CLEAR ?auto_46068 ) ( IS-CRATE ?auto_46065 ) ( not ( = ?auto_46064 ?auto_46068 ) ) ( not ( = ?auto_46065 ?auto_46068 ) ) ( not ( = ?auto_46071 ?auto_46068 ) ) ( AVAILABLE ?auto_46070 ) ( TRUCK-AT ?auto_46067 ?auto_46072 ) ( not ( = ?auto_46072 ?auto_46066 ) ) ( not ( = ?auto_46069 ?auto_46072 ) ) ( HOIST-AT ?auto_46074 ?auto_46072 ) ( LIFTING ?auto_46074 ?auto_46065 ) ( not ( = ?auto_46070 ?auto_46074 ) ) ( not ( = ?auto_46073 ?auto_46074 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46074 ?auto_46065 ?auto_46067 ?auto_46072 )
      ( MAKE-ON ?auto_46064 ?auto_46065 )
      ( MAKE-ON-VERIFY ?auto_46064 ?auto_46065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46075 - SURFACE
      ?auto_46076 - SURFACE
    )
    :vars
    (
      ?auto_46082 - HOIST
      ?auto_46078 - PLACE
      ?auto_46080 - PLACE
      ?auto_46081 - HOIST
      ?auto_46085 - SURFACE
      ?auto_46079 - SURFACE
      ?auto_46077 - TRUCK
      ?auto_46084 - PLACE
      ?auto_46083 - HOIST
      ?auto_46086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46082 ?auto_46078 ) ( IS-CRATE ?auto_46075 ) ( not ( = ?auto_46075 ?auto_46076 ) ) ( not ( = ?auto_46080 ?auto_46078 ) ) ( HOIST-AT ?auto_46081 ?auto_46080 ) ( not ( = ?auto_46082 ?auto_46081 ) ) ( AVAILABLE ?auto_46081 ) ( SURFACE-AT ?auto_46075 ?auto_46080 ) ( ON ?auto_46075 ?auto_46085 ) ( CLEAR ?auto_46075 ) ( not ( = ?auto_46075 ?auto_46085 ) ) ( not ( = ?auto_46076 ?auto_46085 ) ) ( SURFACE-AT ?auto_46079 ?auto_46078 ) ( CLEAR ?auto_46079 ) ( IS-CRATE ?auto_46076 ) ( not ( = ?auto_46075 ?auto_46079 ) ) ( not ( = ?auto_46076 ?auto_46079 ) ) ( not ( = ?auto_46085 ?auto_46079 ) ) ( AVAILABLE ?auto_46082 ) ( TRUCK-AT ?auto_46077 ?auto_46084 ) ( not ( = ?auto_46084 ?auto_46078 ) ) ( not ( = ?auto_46080 ?auto_46084 ) ) ( HOIST-AT ?auto_46083 ?auto_46084 ) ( not ( = ?auto_46082 ?auto_46083 ) ) ( not ( = ?auto_46081 ?auto_46083 ) ) ( AVAILABLE ?auto_46083 ) ( SURFACE-AT ?auto_46076 ?auto_46084 ) ( ON ?auto_46076 ?auto_46086 ) ( CLEAR ?auto_46076 ) ( not ( = ?auto_46075 ?auto_46086 ) ) ( not ( = ?auto_46076 ?auto_46086 ) ) ( not ( = ?auto_46085 ?auto_46086 ) ) ( not ( = ?auto_46079 ?auto_46086 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46083 ?auto_46076 ?auto_46086 ?auto_46084 )
      ( MAKE-ON ?auto_46075 ?auto_46076 )
      ( MAKE-ON-VERIFY ?auto_46075 ?auto_46076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46087 - SURFACE
      ?auto_46088 - SURFACE
    )
    :vars
    (
      ?auto_46098 - HOIST
      ?auto_46092 - PLACE
      ?auto_46091 - PLACE
      ?auto_46096 - HOIST
      ?auto_46095 - SURFACE
      ?auto_46093 - SURFACE
      ?auto_46097 - PLACE
      ?auto_46089 - HOIST
      ?auto_46090 - SURFACE
      ?auto_46094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46098 ?auto_46092 ) ( IS-CRATE ?auto_46087 ) ( not ( = ?auto_46087 ?auto_46088 ) ) ( not ( = ?auto_46091 ?auto_46092 ) ) ( HOIST-AT ?auto_46096 ?auto_46091 ) ( not ( = ?auto_46098 ?auto_46096 ) ) ( AVAILABLE ?auto_46096 ) ( SURFACE-AT ?auto_46087 ?auto_46091 ) ( ON ?auto_46087 ?auto_46095 ) ( CLEAR ?auto_46087 ) ( not ( = ?auto_46087 ?auto_46095 ) ) ( not ( = ?auto_46088 ?auto_46095 ) ) ( SURFACE-AT ?auto_46093 ?auto_46092 ) ( CLEAR ?auto_46093 ) ( IS-CRATE ?auto_46088 ) ( not ( = ?auto_46087 ?auto_46093 ) ) ( not ( = ?auto_46088 ?auto_46093 ) ) ( not ( = ?auto_46095 ?auto_46093 ) ) ( AVAILABLE ?auto_46098 ) ( not ( = ?auto_46097 ?auto_46092 ) ) ( not ( = ?auto_46091 ?auto_46097 ) ) ( HOIST-AT ?auto_46089 ?auto_46097 ) ( not ( = ?auto_46098 ?auto_46089 ) ) ( not ( = ?auto_46096 ?auto_46089 ) ) ( AVAILABLE ?auto_46089 ) ( SURFACE-AT ?auto_46088 ?auto_46097 ) ( ON ?auto_46088 ?auto_46090 ) ( CLEAR ?auto_46088 ) ( not ( = ?auto_46087 ?auto_46090 ) ) ( not ( = ?auto_46088 ?auto_46090 ) ) ( not ( = ?auto_46095 ?auto_46090 ) ) ( not ( = ?auto_46093 ?auto_46090 ) ) ( TRUCK-AT ?auto_46094 ?auto_46092 ) )
    :subtasks
    ( ( !DRIVE ?auto_46094 ?auto_46092 ?auto_46097 )
      ( MAKE-ON ?auto_46087 ?auto_46088 )
      ( MAKE-ON-VERIFY ?auto_46087 ?auto_46088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46099 - SURFACE
      ?auto_46100 - SURFACE
    )
    :vars
    (
      ?auto_46107 - HOIST
      ?auto_46108 - PLACE
      ?auto_46106 - PLACE
      ?auto_46110 - HOIST
      ?auto_46101 - SURFACE
      ?auto_46103 - SURFACE
      ?auto_46104 - PLACE
      ?auto_46102 - HOIST
      ?auto_46105 - SURFACE
      ?auto_46109 - TRUCK
      ?auto_46111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46107 ?auto_46108 ) ( IS-CRATE ?auto_46099 ) ( not ( = ?auto_46099 ?auto_46100 ) ) ( not ( = ?auto_46106 ?auto_46108 ) ) ( HOIST-AT ?auto_46110 ?auto_46106 ) ( not ( = ?auto_46107 ?auto_46110 ) ) ( AVAILABLE ?auto_46110 ) ( SURFACE-AT ?auto_46099 ?auto_46106 ) ( ON ?auto_46099 ?auto_46101 ) ( CLEAR ?auto_46099 ) ( not ( = ?auto_46099 ?auto_46101 ) ) ( not ( = ?auto_46100 ?auto_46101 ) ) ( IS-CRATE ?auto_46100 ) ( not ( = ?auto_46099 ?auto_46103 ) ) ( not ( = ?auto_46100 ?auto_46103 ) ) ( not ( = ?auto_46101 ?auto_46103 ) ) ( not ( = ?auto_46104 ?auto_46108 ) ) ( not ( = ?auto_46106 ?auto_46104 ) ) ( HOIST-AT ?auto_46102 ?auto_46104 ) ( not ( = ?auto_46107 ?auto_46102 ) ) ( not ( = ?auto_46110 ?auto_46102 ) ) ( AVAILABLE ?auto_46102 ) ( SURFACE-AT ?auto_46100 ?auto_46104 ) ( ON ?auto_46100 ?auto_46105 ) ( CLEAR ?auto_46100 ) ( not ( = ?auto_46099 ?auto_46105 ) ) ( not ( = ?auto_46100 ?auto_46105 ) ) ( not ( = ?auto_46101 ?auto_46105 ) ) ( not ( = ?auto_46103 ?auto_46105 ) ) ( TRUCK-AT ?auto_46109 ?auto_46108 ) ( SURFACE-AT ?auto_46111 ?auto_46108 ) ( CLEAR ?auto_46111 ) ( LIFTING ?auto_46107 ?auto_46103 ) ( IS-CRATE ?auto_46103 ) ( not ( = ?auto_46099 ?auto_46111 ) ) ( not ( = ?auto_46100 ?auto_46111 ) ) ( not ( = ?auto_46101 ?auto_46111 ) ) ( not ( = ?auto_46103 ?auto_46111 ) ) ( not ( = ?auto_46105 ?auto_46111 ) ) )
    :subtasks
    ( ( !DROP ?auto_46107 ?auto_46103 ?auto_46111 ?auto_46108 )
      ( MAKE-ON ?auto_46099 ?auto_46100 )
      ( MAKE-ON-VERIFY ?auto_46099 ?auto_46100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46112 - SURFACE
      ?auto_46113 - SURFACE
    )
    :vars
    (
      ?auto_46121 - HOIST
      ?auto_46115 - PLACE
      ?auto_46122 - PLACE
      ?auto_46117 - HOIST
      ?auto_46124 - SURFACE
      ?auto_46123 - SURFACE
      ?auto_46118 - PLACE
      ?auto_46116 - HOIST
      ?auto_46120 - SURFACE
      ?auto_46119 - TRUCK
      ?auto_46114 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46121 ?auto_46115 ) ( IS-CRATE ?auto_46112 ) ( not ( = ?auto_46112 ?auto_46113 ) ) ( not ( = ?auto_46122 ?auto_46115 ) ) ( HOIST-AT ?auto_46117 ?auto_46122 ) ( not ( = ?auto_46121 ?auto_46117 ) ) ( AVAILABLE ?auto_46117 ) ( SURFACE-AT ?auto_46112 ?auto_46122 ) ( ON ?auto_46112 ?auto_46124 ) ( CLEAR ?auto_46112 ) ( not ( = ?auto_46112 ?auto_46124 ) ) ( not ( = ?auto_46113 ?auto_46124 ) ) ( IS-CRATE ?auto_46113 ) ( not ( = ?auto_46112 ?auto_46123 ) ) ( not ( = ?auto_46113 ?auto_46123 ) ) ( not ( = ?auto_46124 ?auto_46123 ) ) ( not ( = ?auto_46118 ?auto_46115 ) ) ( not ( = ?auto_46122 ?auto_46118 ) ) ( HOIST-AT ?auto_46116 ?auto_46118 ) ( not ( = ?auto_46121 ?auto_46116 ) ) ( not ( = ?auto_46117 ?auto_46116 ) ) ( AVAILABLE ?auto_46116 ) ( SURFACE-AT ?auto_46113 ?auto_46118 ) ( ON ?auto_46113 ?auto_46120 ) ( CLEAR ?auto_46113 ) ( not ( = ?auto_46112 ?auto_46120 ) ) ( not ( = ?auto_46113 ?auto_46120 ) ) ( not ( = ?auto_46124 ?auto_46120 ) ) ( not ( = ?auto_46123 ?auto_46120 ) ) ( TRUCK-AT ?auto_46119 ?auto_46115 ) ( SURFACE-AT ?auto_46114 ?auto_46115 ) ( CLEAR ?auto_46114 ) ( IS-CRATE ?auto_46123 ) ( not ( = ?auto_46112 ?auto_46114 ) ) ( not ( = ?auto_46113 ?auto_46114 ) ) ( not ( = ?auto_46124 ?auto_46114 ) ) ( not ( = ?auto_46123 ?auto_46114 ) ) ( not ( = ?auto_46120 ?auto_46114 ) ) ( AVAILABLE ?auto_46121 ) ( IN ?auto_46123 ?auto_46119 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46121 ?auto_46123 ?auto_46119 ?auto_46115 )
      ( MAKE-ON ?auto_46112 ?auto_46113 )
      ( MAKE-ON-VERIFY ?auto_46112 ?auto_46113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46125 - SURFACE
      ?auto_46126 - SURFACE
    )
    :vars
    (
      ?auto_46129 - HOIST
      ?auto_46131 - PLACE
      ?auto_46136 - PLACE
      ?auto_46128 - HOIST
      ?auto_46137 - SURFACE
      ?auto_46135 - SURFACE
      ?auto_46134 - PLACE
      ?auto_46130 - HOIST
      ?auto_46133 - SURFACE
      ?auto_46127 - SURFACE
      ?auto_46132 - TRUCK
      ?auto_46138 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46129 ?auto_46131 ) ( IS-CRATE ?auto_46125 ) ( not ( = ?auto_46125 ?auto_46126 ) ) ( not ( = ?auto_46136 ?auto_46131 ) ) ( HOIST-AT ?auto_46128 ?auto_46136 ) ( not ( = ?auto_46129 ?auto_46128 ) ) ( AVAILABLE ?auto_46128 ) ( SURFACE-AT ?auto_46125 ?auto_46136 ) ( ON ?auto_46125 ?auto_46137 ) ( CLEAR ?auto_46125 ) ( not ( = ?auto_46125 ?auto_46137 ) ) ( not ( = ?auto_46126 ?auto_46137 ) ) ( IS-CRATE ?auto_46126 ) ( not ( = ?auto_46125 ?auto_46135 ) ) ( not ( = ?auto_46126 ?auto_46135 ) ) ( not ( = ?auto_46137 ?auto_46135 ) ) ( not ( = ?auto_46134 ?auto_46131 ) ) ( not ( = ?auto_46136 ?auto_46134 ) ) ( HOIST-AT ?auto_46130 ?auto_46134 ) ( not ( = ?auto_46129 ?auto_46130 ) ) ( not ( = ?auto_46128 ?auto_46130 ) ) ( AVAILABLE ?auto_46130 ) ( SURFACE-AT ?auto_46126 ?auto_46134 ) ( ON ?auto_46126 ?auto_46133 ) ( CLEAR ?auto_46126 ) ( not ( = ?auto_46125 ?auto_46133 ) ) ( not ( = ?auto_46126 ?auto_46133 ) ) ( not ( = ?auto_46137 ?auto_46133 ) ) ( not ( = ?auto_46135 ?auto_46133 ) ) ( SURFACE-AT ?auto_46127 ?auto_46131 ) ( CLEAR ?auto_46127 ) ( IS-CRATE ?auto_46135 ) ( not ( = ?auto_46125 ?auto_46127 ) ) ( not ( = ?auto_46126 ?auto_46127 ) ) ( not ( = ?auto_46137 ?auto_46127 ) ) ( not ( = ?auto_46135 ?auto_46127 ) ) ( not ( = ?auto_46133 ?auto_46127 ) ) ( AVAILABLE ?auto_46129 ) ( IN ?auto_46135 ?auto_46132 ) ( TRUCK-AT ?auto_46132 ?auto_46138 ) ( not ( = ?auto_46138 ?auto_46131 ) ) ( not ( = ?auto_46136 ?auto_46138 ) ) ( not ( = ?auto_46134 ?auto_46138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46132 ?auto_46138 ?auto_46131 )
      ( MAKE-ON ?auto_46125 ?auto_46126 )
      ( MAKE-ON-VERIFY ?auto_46125 ?auto_46126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46139 - SURFACE
      ?auto_46140 - SURFACE
    )
    :vars
    (
      ?auto_46144 - HOIST
      ?auto_46152 - PLACE
      ?auto_46143 - PLACE
      ?auto_46148 - HOIST
      ?auto_46149 - SURFACE
      ?auto_46147 - SURFACE
      ?auto_46151 - PLACE
      ?auto_46145 - HOIST
      ?auto_46150 - SURFACE
      ?auto_46141 - SURFACE
      ?auto_46142 - TRUCK
      ?auto_46146 - PLACE
      ?auto_46153 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46144 ?auto_46152 ) ( IS-CRATE ?auto_46139 ) ( not ( = ?auto_46139 ?auto_46140 ) ) ( not ( = ?auto_46143 ?auto_46152 ) ) ( HOIST-AT ?auto_46148 ?auto_46143 ) ( not ( = ?auto_46144 ?auto_46148 ) ) ( AVAILABLE ?auto_46148 ) ( SURFACE-AT ?auto_46139 ?auto_46143 ) ( ON ?auto_46139 ?auto_46149 ) ( CLEAR ?auto_46139 ) ( not ( = ?auto_46139 ?auto_46149 ) ) ( not ( = ?auto_46140 ?auto_46149 ) ) ( IS-CRATE ?auto_46140 ) ( not ( = ?auto_46139 ?auto_46147 ) ) ( not ( = ?auto_46140 ?auto_46147 ) ) ( not ( = ?auto_46149 ?auto_46147 ) ) ( not ( = ?auto_46151 ?auto_46152 ) ) ( not ( = ?auto_46143 ?auto_46151 ) ) ( HOIST-AT ?auto_46145 ?auto_46151 ) ( not ( = ?auto_46144 ?auto_46145 ) ) ( not ( = ?auto_46148 ?auto_46145 ) ) ( AVAILABLE ?auto_46145 ) ( SURFACE-AT ?auto_46140 ?auto_46151 ) ( ON ?auto_46140 ?auto_46150 ) ( CLEAR ?auto_46140 ) ( not ( = ?auto_46139 ?auto_46150 ) ) ( not ( = ?auto_46140 ?auto_46150 ) ) ( not ( = ?auto_46149 ?auto_46150 ) ) ( not ( = ?auto_46147 ?auto_46150 ) ) ( SURFACE-AT ?auto_46141 ?auto_46152 ) ( CLEAR ?auto_46141 ) ( IS-CRATE ?auto_46147 ) ( not ( = ?auto_46139 ?auto_46141 ) ) ( not ( = ?auto_46140 ?auto_46141 ) ) ( not ( = ?auto_46149 ?auto_46141 ) ) ( not ( = ?auto_46147 ?auto_46141 ) ) ( not ( = ?auto_46150 ?auto_46141 ) ) ( AVAILABLE ?auto_46144 ) ( TRUCK-AT ?auto_46142 ?auto_46146 ) ( not ( = ?auto_46146 ?auto_46152 ) ) ( not ( = ?auto_46143 ?auto_46146 ) ) ( not ( = ?auto_46151 ?auto_46146 ) ) ( HOIST-AT ?auto_46153 ?auto_46146 ) ( LIFTING ?auto_46153 ?auto_46147 ) ( not ( = ?auto_46144 ?auto_46153 ) ) ( not ( = ?auto_46148 ?auto_46153 ) ) ( not ( = ?auto_46145 ?auto_46153 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46153 ?auto_46147 ?auto_46142 ?auto_46146 )
      ( MAKE-ON ?auto_46139 ?auto_46140 )
      ( MAKE-ON-VERIFY ?auto_46139 ?auto_46140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46154 - SURFACE
      ?auto_46155 - SURFACE
    )
    :vars
    (
      ?auto_46168 - HOIST
      ?auto_46166 - PLACE
      ?auto_46162 - PLACE
      ?auto_46167 - HOIST
      ?auto_46156 - SURFACE
      ?auto_46159 - SURFACE
      ?auto_46157 - PLACE
      ?auto_46161 - HOIST
      ?auto_46163 - SURFACE
      ?auto_46158 - SURFACE
      ?auto_46160 - TRUCK
      ?auto_46165 - PLACE
      ?auto_46164 - HOIST
      ?auto_46169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46168 ?auto_46166 ) ( IS-CRATE ?auto_46154 ) ( not ( = ?auto_46154 ?auto_46155 ) ) ( not ( = ?auto_46162 ?auto_46166 ) ) ( HOIST-AT ?auto_46167 ?auto_46162 ) ( not ( = ?auto_46168 ?auto_46167 ) ) ( AVAILABLE ?auto_46167 ) ( SURFACE-AT ?auto_46154 ?auto_46162 ) ( ON ?auto_46154 ?auto_46156 ) ( CLEAR ?auto_46154 ) ( not ( = ?auto_46154 ?auto_46156 ) ) ( not ( = ?auto_46155 ?auto_46156 ) ) ( IS-CRATE ?auto_46155 ) ( not ( = ?auto_46154 ?auto_46159 ) ) ( not ( = ?auto_46155 ?auto_46159 ) ) ( not ( = ?auto_46156 ?auto_46159 ) ) ( not ( = ?auto_46157 ?auto_46166 ) ) ( not ( = ?auto_46162 ?auto_46157 ) ) ( HOIST-AT ?auto_46161 ?auto_46157 ) ( not ( = ?auto_46168 ?auto_46161 ) ) ( not ( = ?auto_46167 ?auto_46161 ) ) ( AVAILABLE ?auto_46161 ) ( SURFACE-AT ?auto_46155 ?auto_46157 ) ( ON ?auto_46155 ?auto_46163 ) ( CLEAR ?auto_46155 ) ( not ( = ?auto_46154 ?auto_46163 ) ) ( not ( = ?auto_46155 ?auto_46163 ) ) ( not ( = ?auto_46156 ?auto_46163 ) ) ( not ( = ?auto_46159 ?auto_46163 ) ) ( SURFACE-AT ?auto_46158 ?auto_46166 ) ( CLEAR ?auto_46158 ) ( IS-CRATE ?auto_46159 ) ( not ( = ?auto_46154 ?auto_46158 ) ) ( not ( = ?auto_46155 ?auto_46158 ) ) ( not ( = ?auto_46156 ?auto_46158 ) ) ( not ( = ?auto_46159 ?auto_46158 ) ) ( not ( = ?auto_46163 ?auto_46158 ) ) ( AVAILABLE ?auto_46168 ) ( TRUCK-AT ?auto_46160 ?auto_46165 ) ( not ( = ?auto_46165 ?auto_46166 ) ) ( not ( = ?auto_46162 ?auto_46165 ) ) ( not ( = ?auto_46157 ?auto_46165 ) ) ( HOIST-AT ?auto_46164 ?auto_46165 ) ( not ( = ?auto_46168 ?auto_46164 ) ) ( not ( = ?auto_46167 ?auto_46164 ) ) ( not ( = ?auto_46161 ?auto_46164 ) ) ( AVAILABLE ?auto_46164 ) ( SURFACE-AT ?auto_46159 ?auto_46165 ) ( ON ?auto_46159 ?auto_46169 ) ( CLEAR ?auto_46159 ) ( not ( = ?auto_46154 ?auto_46169 ) ) ( not ( = ?auto_46155 ?auto_46169 ) ) ( not ( = ?auto_46156 ?auto_46169 ) ) ( not ( = ?auto_46159 ?auto_46169 ) ) ( not ( = ?auto_46163 ?auto_46169 ) ) ( not ( = ?auto_46158 ?auto_46169 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46164 ?auto_46159 ?auto_46169 ?auto_46165 )
      ( MAKE-ON ?auto_46154 ?auto_46155 )
      ( MAKE-ON-VERIFY ?auto_46154 ?auto_46155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46170 - SURFACE
      ?auto_46171 - SURFACE
    )
    :vars
    (
      ?auto_46178 - HOIST
      ?auto_46184 - PLACE
      ?auto_46173 - PLACE
      ?auto_46181 - HOIST
      ?auto_46183 - SURFACE
      ?auto_46176 - SURFACE
      ?auto_46179 - PLACE
      ?auto_46175 - HOIST
      ?auto_46177 - SURFACE
      ?auto_46180 - SURFACE
      ?auto_46172 - PLACE
      ?auto_46174 - HOIST
      ?auto_46185 - SURFACE
      ?auto_46182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46178 ?auto_46184 ) ( IS-CRATE ?auto_46170 ) ( not ( = ?auto_46170 ?auto_46171 ) ) ( not ( = ?auto_46173 ?auto_46184 ) ) ( HOIST-AT ?auto_46181 ?auto_46173 ) ( not ( = ?auto_46178 ?auto_46181 ) ) ( AVAILABLE ?auto_46181 ) ( SURFACE-AT ?auto_46170 ?auto_46173 ) ( ON ?auto_46170 ?auto_46183 ) ( CLEAR ?auto_46170 ) ( not ( = ?auto_46170 ?auto_46183 ) ) ( not ( = ?auto_46171 ?auto_46183 ) ) ( IS-CRATE ?auto_46171 ) ( not ( = ?auto_46170 ?auto_46176 ) ) ( not ( = ?auto_46171 ?auto_46176 ) ) ( not ( = ?auto_46183 ?auto_46176 ) ) ( not ( = ?auto_46179 ?auto_46184 ) ) ( not ( = ?auto_46173 ?auto_46179 ) ) ( HOIST-AT ?auto_46175 ?auto_46179 ) ( not ( = ?auto_46178 ?auto_46175 ) ) ( not ( = ?auto_46181 ?auto_46175 ) ) ( AVAILABLE ?auto_46175 ) ( SURFACE-AT ?auto_46171 ?auto_46179 ) ( ON ?auto_46171 ?auto_46177 ) ( CLEAR ?auto_46171 ) ( not ( = ?auto_46170 ?auto_46177 ) ) ( not ( = ?auto_46171 ?auto_46177 ) ) ( not ( = ?auto_46183 ?auto_46177 ) ) ( not ( = ?auto_46176 ?auto_46177 ) ) ( SURFACE-AT ?auto_46180 ?auto_46184 ) ( CLEAR ?auto_46180 ) ( IS-CRATE ?auto_46176 ) ( not ( = ?auto_46170 ?auto_46180 ) ) ( not ( = ?auto_46171 ?auto_46180 ) ) ( not ( = ?auto_46183 ?auto_46180 ) ) ( not ( = ?auto_46176 ?auto_46180 ) ) ( not ( = ?auto_46177 ?auto_46180 ) ) ( AVAILABLE ?auto_46178 ) ( not ( = ?auto_46172 ?auto_46184 ) ) ( not ( = ?auto_46173 ?auto_46172 ) ) ( not ( = ?auto_46179 ?auto_46172 ) ) ( HOIST-AT ?auto_46174 ?auto_46172 ) ( not ( = ?auto_46178 ?auto_46174 ) ) ( not ( = ?auto_46181 ?auto_46174 ) ) ( not ( = ?auto_46175 ?auto_46174 ) ) ( AVAILABLE ?auto_46174 ) ( SURFACE-AT ?auto_46176 ?auto_46172 ) ( ON ?auto_46176 ?auto_46185 ) ( CLEAR ?auto_46176 ) ( not ( = ?auto_46170 ?auto_46185 ) ) ( not ( = ?auto_46171 ?auto_46185 ) ) ( not ( = ?auto_46183 ?auto_46185 ) ) ( not ( = ?auto_46176 ?auto_46185 ) ) ( not ( = ?auto_46177 ?auto_46185 ) ) ( not ( = ?auto_46180 ?auto_46185 ) ) ( TRUCK-AT ?auto_46182 ?auto_46184 ) )
    :subtasks
    ( ( !DRIVE ?auto_46182 ?auto_46184 ?auto_46172 )
      ( MAKE-ON ?auto_46170 ?auto_46171 )
      ( MAKE-ON-VERIFY ?auto_46170 ?auto_46171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46188 - SURFACE
      ?auto_46189 - SURFACE
    )
    :vars
    (
      ?auto_46190 - HOIST
      ?auto_46191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46190 ?auto_46191 ) ( SURFACE-AT ?auto_46189 ?auto_46191 ) ( CLEAR ?auto_46189 ) ( LIFTING ?auto_46190 ?auto_46188 ) ( IS-CRATE ?auto_46188 ) ( not ( = ?auto_46188 ?auto_46189 ) ) )
    :subtasks
    ( ( !DROP ?auto_46190 ?auto_46188 ?auto_46189 ?auto_46191 )
      ( MAKE-ON-VERIFY ?auto_46188 ?auto_46189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46192 - SURFACE
      ?auto_46193 - SURFACE
    )
    :vars
    (
      ?auto_46194 - HOIST
      ?auto_46195 - PLACE
      ?auto_46196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46194 ?auto_46195 ) ( SURFACE-AT ?auto_46193 ?auto_46195 ) ( CLEAR ?auto_46193 ) ( IS-CRATE ?auto_46192 ) ( not ( = ?auto_46192 ?auto_46193 ) ) ( TRUCK-AT ?auto_46196 ?auto_46195 ) ( AVAILABLE ?auto_46194 ) ( IN ?auto_46192 ?auto_46196 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46194 ?auto_46192 ?auto_46196 ?auto_46195 )
      ( MAKE-ON ?auto_46192 ?auto_46193 )
      ( MAKE-ON-VERIFY ?auto_46192 ?auto_46193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46197 - SURFACE
      ?auto_46198 - SURFACE
    )
    :vars
    (
      ?auto_46200 - HOIST
      ?auto_46199 - PLACE
      ?auto_46201 - TRUCK
      ?auto_46202 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46200 ?auto_46199 ) ( SURFACE-AT ?auto_46198 ?auto_46199 ) ( CLEAR ?auto_46198 ) ( IS-CRATE ?auto_46197 ) ( not ( = ?auto_46197 ?auto_46198 ) ) ( AVAILABLE ?auto_46200 ) ( IN ?auto_46197 ?auto_46201 ) ( TRUCK-AT ?auto_46201 ?auto_46202 ) ( not ( = ?auto_46202 ?auto_46199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46201 ?auto_46202 ?auto_46199 )
      ( MAKE-ON ?auto_46197 ?auto_46198 )
      ( MAKE-ON-VERIFY ?auto_46197 ?auto_46198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46203 - SURFACE
      ?auto_46204 - SURFACE
    )
    :vars
    (
      ?auto_46205 - HOIST
      ?auto_46207 - PLACE
      ?auto_46206 - TRUCK
      ?auto_46208 - PLACE
      ?auto_46209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46205 ?auto_46207 ) ( SURFACE-AT ?auto_46204 ?auto_46207 ) ( CLEAR ?auto_46204 ) ( IS-CRATE ?auto_46203 ) ( not ( = ?auto_46203 ?auto_46204 ) ) ( AVAILABLE ?auto_46205 ) ( TRUCK-AT ?auto_46206 ?auto_46208 ) ( not ( = ?auto_46208 ?auto_46207 ) ) ( HOIST-AT ?auto_46209 ?auto_46208 ) ( LIFTING ?auto_46209 ?auto_46203 ) ( not ( = ?auto_46205 ?auto_46209 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46209 ?auto_46203 ?auto_46206 ?auto_46208 )
      ( MAKE-ON ?auto_46203 ?auto_46204 )
      ( MAKE-ON-VERIFY ?auto_46203 ?auto_46204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46210 - SURFACE
      ?auto_46211 - SURFACE
    )
    :vars
    (
      ?auto_46214 - HOIST
      ?auto_46212 - PLACE
      ?auto_46213 - TRUCK
      ?auto_46215 - PLACE
      ?auto_46216 - HOIST
      ?auto_46217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46214 ?auto_46212 ) ( SURFACE-AT ?auto_46211 ?auto_46212 ) ( CLEAR ?auto_46211 ) ( IS-CRATE ?auto_46210 ) ( not ( = ?auto_46210 ?auto_46211 ) ) ( AVAILABLE ?auto_46214 ) ( TRUCK-AT ?auto_46213 ?auto_46215 ) ( not ( = ?auto_46215 ?auto_46212 ) ) ( HOIST-AT ?auto_46216 ?auto_46215 ) ( not ( = ?auto_46214 ?auto_46216 ) ) ( AVAILABLE ?auto_46216 ) ( SURFACE-AT ?auto_46210 ?auto_46215 ) ( ON ?auto_46210 ?auto_46217 ) ( CLEAR ?auto_46210 ) ( not ( = ?auto_46210 ?auto_46217 ) ) ( not ( = ?auto_46211 ?auto_46217 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46216 ?auto_46210 ?auto_46217 ?auto_46215 )
      ( MAKE-ON ?auto_46210 ?auto_46211 )
      ( MAKE-ON-VERIFY ?auto_46210 ?auto_46211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46218 - SURFACE
      ?auto_46219 - SURFACE
    )
    :vars
    (
      ?auto_46224 - HOIST
      ?auto_46220 - PLACE
      ?auto_46225 - PLACE
      ?auto_46221 - HOIST
      ?auto_46223 - SURFACE
      ?auto_46222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46224 ?auto_46220 ) ( SURFACE-AT ?auto_46219 ?auto_46220 ) ( CLEAR ?auto_46219 ) ( IS-CRATE ?auto_46218 ) ( not ( = ?auto_46218 ?auto_46219 ) ) ( AVAILABLE ?auto_46224 ) ( not ( = ?auto_46225 ?auto_46220 ) ) ( HOIST-AT ?auto_46221 ?auto_46225 ) ( not ( = ?auto_46224 ?auto_46221 ) ) ( AVAILABLE ?auto_46221 ) ( SURFACE-AT ?auto_46218 ?auto_46225 ) ( ON ?auto_46218 ?auto_46223 ) ( CLEAR ?auto_46218 ) ( not ( = ?auto_46218 ?auto_46223 ) ) ( not ( = ?auto_46219 ?auto_46223 ) ) ( TRUCK-AT ?auto_46222 ?auto_46220 ) )
    :subtasks
    ( ( !DRIVE ?auto_46222 ?auto_46220 ?auto_46225 )
      ( MAKE-ON ?auto_46218 ?auto_46219 )
      ( MAKE-ON-VERIFY ?auto_46218 ?auto_46219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46226 - SURFACE
      ?auto_46227 - SURFACE
    )
    :vars
    (
      ?auto_46229 - HOIST
      ?auto_46228 - PLACE
      ?auto_46233 - PLACE
      ?auto_46231 - HOIST
      ?auto_46232 - SURFACE
      ?auto_46230 - TRUCK
      ?auto_46234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46229 ?auto_46228 ) ( IS-CRATE ?auto_46226 ) ( not ( = ?auto_46226 ?auto_46227 ) ) ( not ( = ?auto_46233 ?auto_46228 ) ) ( HOIST-AT ?auto_46231 ?auto_46233 ) ( not ( = ?auto_46229 ?auto_46231 ) ) ( AVAILABLE ?auto_46231 ) ( SURFACE-AT ?auto_46226 ?auto_46233 ) ( ON ?auto_46226 ?auto_46232 ) ( CLEAR ?auto_46226 ) ( not ( = ?auto_46226 ?auto_46232 ) ) ( not ( = ?auto_46227 ?auto_46232 ) ) ( TRUCK-AT ?auto_46230 ?auto_46228 ) ( SURFACE-AT ?auto_46234 ?auto_46228 ) ( CLEAR ?auto_46234 ) ( LIFTING ?auto_46229 ?auto_46227 ) ( IS-CRATE ?auto_46227 ) ( not ( = ?auto_46226 ?auto_46234 ) ) ( not ( = ?auto_46227 ?auto_46234 ) ) ( not ( = ?auto_46232 ?auto_46234 ) ) )
    :subtasks
    ( ( !DROP ?auto_46229 ?auto_46227 ?auto_46234 ?auto_46228 )
      ( MAKE-ON ?auto_46226 ?auto_46227 )
      ( MAKE-ON-VERIFY ?auto_46226 ?auto_46227 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46235 - SURFACE
      ?auto_46236 - SURFACE
    )
    :vars
    (
      ?auto_46240 - HOIST
      ?auto_46238 - PLACE
      ?auto_46242 - PLACE
      ?auto_46241 - HOIST
      ?auto_46239 - SURFACE
      ?auto_46237 - TRUCK
      ?auto_46243 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46240 ?auto_46238 ) ( IS-CRATE ?auto_46235 ) ( not ( = ?auto_46235 ?auto_46236 ) ) ( not ( = ?auto_46242 ?auto_46238 ) ) ( HOIST-AT ?auto_46241 ?auto_46242 ) ( not ( = ?auto_46240 ?auto_46241 ) ) ( AVAILABLE ?auto_46241 ) ( SURFACE-AT ?auto_46235 ?auto_46242 ) ( ON ?auto_46235 ?auto_46239 ) ( CLEAR ?auto_46235 ) ( not ( = ?auto_46235 ?auto_46239 ) ) ( not ( = ?auto_46236 ?auto_46239 ) ) ( TRUCK-AT ?auto_46237 ?auto_46238 ) ( SURFACE-AT ?auto_46243 ?auto_46238 ) ( CLEAR ?auto_46243 ) ( IS-CRATE ?auto_46236 ) ( not ( = ?auto_46235 ?auto_46243 ) ) ( not ( = ?auto_46236 ?auto_46243 ) ) ( not ( = ?auto_46239 ?auto_46243 ) ) ( AVAILABLE ?auto_46240 ) ( IN ?auto_46236 ?auto_46237 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46240 ?auto_46236 ?auto_46237 ?auto_46238 )
      ( MAKE-ON ?auto_46235 ?auto_46236 )
      ( MAKE-ON-VERIFY ?auto_46235 ?auto_46236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46244 - SURFACE
      ?auto_46245 - SURFACE
    )
    :vars
    (
      ?auto_46249 - HOIST
      ?auto_46252 - PLACE
      ?auto_46248 - PLACE
      ?auto_46246 - HOIST
      ?auto_46250 - SURFACE
      ?auto_46251 - SURFACE
      ?auto_46247 - TRUCK
      ?auto_46253 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46249 ?auto_46252 ) ( IS-CRATE ?auto_46244 ) ( not ( = ?auto_46244 ?auto_46245 ) ) ( not ( = ?auto_46248 ?auto_46252 ) ) ( HOIST-AT ?auto_46246 ?auto_46248 ) ( not ( = ?auto_46249 ?auto_46246 ) ) ( AVAILABLE ?auto_46246 ) ( SURFACE-AT ?auto_46244 ?auto_46248 ) ( ON ?auto_46244 ?auto_46250 ) ( CLEAR ?auto_46244 ) ( not ( = ?auto_46244 ?auto_46250 ) ) ( not ( = ?auto_46245 ?auto_46250 ) ) ( SURFACE-AT ?auto_46251 ?auto_46252 ) ( CLEAR ?auto_46251 ) ( IS-CRATE ?auto_46245 ) ( not ( = ?auto_46244 ?auto_46251 ) ) ( not ( = ?auto_46245 ?auto_46251 ) ) ( not ( = ?auto_46250 ?auto_46251 ) ) ( AVAILABLE ?auto_46249 ) ( IN ?auto_46245 ?auto_46247 ) ( TRUCK-AT ?auto_46247 ?auto_46253 ) ( not ( = ?auto_46253 ?auto_46252 ) ) ( not ( = ?auto_46248 ?auto_46253 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46247 ?auto_46253 ?auto_46252 )
      ( MAKE-ON ?auto_46244 ?auto_46245 )
      ( MAKE-ON-VERIFY ?auto_46244 ?auto_46245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46254 - SURFACE
      ?auto_46255 - SURFACE
    )
    :vars
    (
      ?auto_46259 - HOIST
      ?auto_46263 - PLACE
      ?auto_46260 - PLACE
      ?auto_46261 - HOIST
      ?auto_46256 - SURFACE
      ?auto_46262 - SURFACE
      ?auto_46257 - TRUCK
      ?auto_46258 - PLACE
      ?auto_46264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46259 ?auto_46263 ) ( IS-CRATE ?auto_46254 ) ( not ( = ?auto_46254 ?auto_46255 ) ) ( not ( = ?auto_46260 ?auto_46263 ) ) ( HOIST-AT ?auto_46261 ?auto_46260 ) ( not ( = ?auto_46259 ?auto_46261 ) ) ( AVAILABLE ?auto_46261 ) ( SURFACE-AT ?auto_46254 ?auto_46260 ) ( ON ?auto_46254 ?auto_46256 ) ( CLEAR ?auto_46254 ) ( not ( = ?auto_46254 ?auto_46256 ) ) ( not ( = ?auto_46255 ?auto_46256 ) ) ( SURFACE-AT ?auto_46262 ?auto_46263 ) ( CLEAR ?auto_46262 ) ( IS-CRATE ?auto_46255 ) ( not ( = ?auto_46254 ?auto_46262 ) ) ( not ( = ?auto_46255 ?auto_46262 ) ) ( not ( = ?auto_46256 ?auto_46262 ) ) ( AVAILABLE ?auto_46259 ) ( TRUCK-AT ?auto_46257 ?auto_46258 ) ( not ( = ?auto_46258 ?auto_46263 ) ) ( not ( = ?auto_46260 ?auto_46258 ) ) ( HOIST-AT ?auto_46264 ?auto_46258 ) ( LIFTING ?auto_46264 ?auto_46255 ) ( not ( = ?auto_46259 ?auto_46264 ) ) ( not ( = ?auto_46261 ?auto_46264 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46264 ?auto_46255 ?auto_46257 ?auto_46258 )
      ( MAKE-ON ?auto_46254 ?auto_46255 )
      ( MAKE-ON-VERIFY ?auto_46254 ?auto_46255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46265 - SURFACE
      ?auto_46266 - SURFACE
    )
    :vars
    (
      ?auto_46269 - HOIST
      ?auto_46268 - PLACE
      ?auto_46267 - PLACE
      ?auto_46272 - HOIST
      ?auto_46270 - SURFACE
      ?auto_46275 - SURFACE
      ?auto_46273 - TRUCK
      ?auto_46271 - PLACE
      ?auto_46274 - HOIST
      ?auto_46276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46269 ?auto_46268 ) ( IS-CRATE ?auto_46265 ) ( not ( = ?auto_46265 ?auto_46266 ) ) ( not ( = ?auto_46267 ?auto_46268 ) ) ( HOIST-AT ?auto_46272 ?auto_46267 ) ( not ( = ?auto_46269 ?auto_46272 ) ) ( AVAILABLE ?auto_46272 ) ( SURFACE-AT ?auto_46265 ?auto_46267 ) ( ON ?auto_46265 ?auto_46270 ) ( CLEAR ?auto_46265 ) ( not ( = ?auto_46265 ?auto_46270 ) ) ( not ( = ?auto_46266 ?auto_46270 ) ) ( SURFACE-AT ?auto_46275 ?auto_46268 ) ( CLEAR ?auto_46275 ) ( IS-CRATE ?auto_46266 ) ( not ( = ?auto_46265 ?auto_46275 ) ) ( not ( = ?auto_46266 ?auto_46275 ) ) ( not ( = ?auto_46270 ?auto_46275 ) ) ( AVAILABLE ?auto_46269 ) ( TRUCK-AT ?auto_46273 ?auto_46271 ) ( not ( = ?auto_46271 ?auto_46268 ) ) ( not ( = ?auto_46267 ?auto_46271 ) ) ( HOIST-AT ?auto_46274 ?auto_46271 ) ( not ( = ?auto_46269 ?auto_46274 ) ) ( not ( = ?auto_46272 ?auto_46274 ) ) ( AVAILABLE ?auto_46274 ) ( SURFACE-AT ?auto_46266 ?auto_46271 ) ( ON ?auto_46266 ?auto_46276 ) ( CLEAR ?auto_46266 ) ( not ( = ?auto_46265 ?auto_46276 ) ) ( not ( = ?auto_46266 ?auto_46276 ) ) ( not ( = ?auto_46270 ?auto_46276 ) ) ( not ( = ?auto_46275 ?auto_46276 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46274 ?auto_46266 ?auto_46276 ?auto_46271 )
      ( MAKE-ON ?auto_46265 ?auto_46266 )
      ( MAKE-ON-VERIFY ?auto_46265 ?auto_46266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46277 - SURFACE
      ?auto_46278 - SURFACE
    )
    :vars
    (
      ?auto_46285 - HOIST
      ?auto_46288 - PLACE
      ?auto_46281 - PLACE
      ?auto_46284 - HOIST
      ?auto_46282 - SURFACE
      ?auto_46279 - SURFACE
      ?auto_46287 - PLACE
      ?auto_46280 - HOIST
      ?auto_46283 - SURFACE
      ?auto_46286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46285 ?auto_46288 ) ( IS-CRATE ?auto_46277 ) ( not ( = ?auto_46277 ?auto_46278 ) ) ( not ( = ?auto_46281 ?auto_46288 ) ) ( HOIST-AT ?auto_46284 ?auto_46281 ) ( not ( = ?auto_46285 ?auto_46284 ) ) ( AVAILABLE ?auto_46284 ) ( SURFACE-AT ?auto_46277 ?auto_46281 ) ( ON ?auto_46277 ?auto_46282 ) ( CLEAR ?auto_46277 ) ( not ( = ?auto_46277 ?auto_46282 ) ) ( not ( = ?auto_46278 ?auto_46282 ) ) ( SURFACE-AT ?auto_46279 ?auto_46288 ) ( CLEAR ?auto_46279 ) ( IS-CRATE ?auto_46278 ) ( not ( = ?auto_46277 ?auto_46279 ) ) ( not ( = ?auto_46278 ?auto_46279 ) ) ( not ( = ?auto_46282 ?auto_46279 ) ) ( AVAILABLE ?auto_46285 ) ( not ( = ?auto_46287 ?auto_46288 ) ) ( not ( = ?auto_46281 ?auto_46287 ) ) ( HOIST-AT ?auto_46280 ?auto_46287 ) ( not ( = ?auto_46285 ?auto_46280 ) ) ( not ( = ?auto_46284 ?auto_46280 ) ) ( AVAILABLE ?auto_46280 ) ( SURFACE-AT ?auto_46278 ?auto_46287 ) ( ON ?auto_46278 ?auto_46283 ) ( CLEAR ?auto_46278 ) ( not ( = ?auto_46277 ?auto_46283 ) ) ( not ( = ?auto_46278 ?auto_46283 ) ) ( not ( = ?auto_46282 ?auto_46283 ) ) ( not ( = ?auto_46279 ?auto_46283 ) ) ( TRUCK-AT ?auto_46286 ?auto_46288 ) )
    :subtasks
    ( ( !DRIVE ?auto_46286 ?auto_46288 ?auto_46287 )
      ( MAKE-ON ?auto_46277 ?auto_46278 )
      ( MAKE-ON-VERIFY ?auto_46277 ?auto_46278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46289 - SURFACE
      ?auto_46290 - SURFACE
    )
    :vars
    (
      ?auto_46295 - HOIST
      ?auto_46300 - PLACE
      ?auto_46294 - PLACE
      ?auto_46297 - HOIST
      ?auto_46299 - SURFACE
      ?auto_46293 - SURFACE
      ?auto_46291 - PLACE
      ?auto_46298 - HOIST
      ?auto_46292 - SURFACE
      ?auto_46296 - TRUCK
      ?auto_46301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46295 ?auto_46300 ) ( IS-CRATE ?auto_46289 ) ( not ( = ?auto_46289 ?auto_46290 ) ) ( not ( = ?auto_46294 ?auto_46300 ) ) ( HOIST-AT ?auto_46297 ?auto_46294 ) ( not ( = ?auto_46295 ?auto_46297 ) ) ( AVAILABLE ?auto_46297 ) ( SURFACE-AT ?auto_46289 ?auto_46294 ) ( ON ?auto_46289 ?auto_46299 ) ( CLEAR ?auto_46289 ) ( not ( = ?auto_46289 ?auto_46299 ) ) ( not ( = ?auto_46290 ?auto_46299 ) ) ( IS-CRATE ?auto_46290 ) ( not ( = ?auto_46289 ?auto_46293 ) ) ( not ( = ?auto_46290 ?auto_46293 ) ) ( not ( = ?auto_46299 ?auto_46293 ) ) ( not ( = ?auto_46291 ?auto_46300 ) ) ( not ( = ?auto_46294 ?auto_46291 ) ) ( HOIST-AT ?auto_46298 ?auto_46291 ) ( not ( = ?auto_46295 ?auto_46298 ) ) ( not ( = ?auto_46297 ?auto_46298 ) ) ( AVAILABLE ?auto_46298 ) ( SURFACE-AT ?auto_46290 ?auto_46291 ) ( ON ?auto_46290 ?auto_46292 ) ( CLEAR ?auto_46290 ) ( not ( = ?auto_46289 ?auto_46292 ) ) ( not ( = ?auto_46290 ?auto_46292 ) ) ( not ( = ?auto_46299 ?auto_46292 ) ) ( not ( = ?auto_46293 ?auto_46292 ) ) ( TRUCK-AT ?auto_46296 ?auto_46300 ) ( SURFACE-AT ?auto_46301 ?auto_46300 ) ( CLEAR ?auto_46301 ) ( LIFTING ?auto_46295 ?auto_46293 ) ( IS-CRATE ?auto_46293 ) ( not ( = ?auto_46289 ?auto_46301 ) ) ( not ( = ?auto_46290 ?auto_46301 ) ) ( not ( = ?auto_46299 ?auto_46301 ) ) ( not ( = ?auto_46293 ?auto_46301 ) ) ( not ( = ?auto_46292 ?auto_46301 ) ) )
    :subtasks
    ( ( !DROP ?auto_46295 ?auto_46293 ?auto_46301 ?auto_46300 )
      ( MAKE-ON ?auto_46289 ?auto_46290 )
      ( MAKE-ON-VERIFY ?auto_46289 ?auto_46290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46302 - SURFACE
      ?auto_46303 - SURFACE
    )
    :vars
    (
      ?auto_46309 - HOIST
      ?auto_46312 - PLACE
      ?auto_46305 - PLACE
      ?auto_46307 - HOIST
      ?auto_46304 - SURFACE
      ?auto_46306 - SURFACE
      ?auto_46314 - PLACE
      ?auto_46310 - HOIST
      ?auto_46311 - SURFACE
      ?auto_46313 - TRUCK
      ?auto_46308 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46309 ?auto_46312 ) ( IS-CRATE ?auto_46302 ) ( not ( = ?auto_46302 ?auto_46303 ) ) ( not ( = ?auto_46305 ?auto_46312 ) ) ( HOIST-AT ?auto_46307 ?auto_46305 ) ( not ( = ?auto_46309 ?auto_46307 ) ) ( AVAILABLE ?auto_46307 ) ( SURFACE-AT ?auto_46302 ?auto_46305 ) ( ON ?auto_46302 ?auto_46304 ) ( CLEAR ?auto_46302 ) ( not ( = ?auto_46302 ?auto_46304 ) ) ( not ( = ?auto_46303 ?auto_46304 ) ) ( IS-CRATE ?auto_46303 ) ( not ( = ?auto_46302 ?auto_46306 ) ) ( not ( = ?auto_46303 ?auto_46306 ) ) ( not ( = ?auto_46304 ?auto_46306 ) ) ( not ( = ?auto_46314 ?auto_46312 ) ) ( not ( = ?auto_46305 ?auto_46314 ) ) ( HOIST-AT ?auto_46310 ?auto_46314 ) ( not ( = ?auto_46309 ?auto_46310 ) ) ( not ( = ?auto_46307 ?auto_46310 ) ) ( AVAILABLE ?auto_46310 ) ( SURFACE-AT ?auto_46303 ?auto_46314 ) ( ON ?auto_46303 ?auto_46311 ) ( CLEAR ?auto_46303 ) ( not ( = ?auto_46302 ?auto_46311 ) ) ( not ( = ?auto_46303 ?auto_46311 ) ) ( not ( = ?auto_46304 ?auto_46311 ) ) ( not ( = ?auto_46306 ?auto_46311 ) ) ( TRUCK-AT ?auto_46313 ?auto_46312 ) ( SURFACE-AT ?auto_46308 ?auto_46312 ) ( CLEAR ?auto_46308 ) ( IS-CRATE ?auto_46306 ) ( not ( = ?auto_46302 ?auto_46308 ) ) ( not ( = ?auto_46303 ?auto_46308 ) ) ( not ( = ?auto_46304 ?auto_46308 ) ) ( not ( = ?auto_46306 ?auto_46308 ) ) ( not ( = ?auto_46311 ?auto_46308 ) ) ( AVAILABLE ?auto_46309 ) ( IN ?auto_46306 ?auto_46313 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46309 ?auto_46306 ?auto_46313 ?auto_46312 )
      ( MAKE-ON ?auto_46302 ?auto_46303 )
      ( MAKE-ON-VERIFY ?auto_46302 ?auto_46303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46315 - SURFACE
      ?auto_46316 - SURFACE
    )
    :vars
    (
      ?auto_46326 - HOIST
      ?auto_46321 - PLACE
      ?auto_46320 - PLACE
      ?auto_46319 - HOIST
      ?auto_46327 - SURFACE
      ?auto_46322 - SURFACE
      ?auto_46317 - PLACE
      ?auto_46323 - HOIST
      ?auto_46318 - SURFACE
      ?auto_46325 - SURFACE
      ?auto_46324 - TRUCK
      ?auto_46328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46326 ?auto_46321 ) ( IS-CRATE ?auto_46315 ) ( not ( = ?auto_46315 ?auto_46316 ) ) ( not ( = ?auto_46320 ?auto_46321 ) ) ( HOIST-AT ?auto_46319 ?auto_46320 ) ( not ( = ?auto_46326 ?auto_46319 ) ) ( AVAILABLE ?auto_46319 ) ( SURFACE-AT ?auto_46315 ?auto_46320 ) ( ON ?auto_46315 ?auto_46327 ) ( CLEAR ?auto_46315 ) ( not ( = ?auto_46315 ?auto_46327 ) ) ( not ( = ?auto_46316 ?auto_46327 ) ) ( IS-CRATE ?auto_46316 ) ( not ( = ?auto_46315 ?auto_46322 ) ) ( not ( = ?auto_46316 ?auto_46322 ) ) ( not ( = ?auto_46327 ?auto_46322 ) ) ( not ( = ?auto_46317 ?auto_46321 ) ) ( not ( = ?auto_46320 ?auto_46317 ) ) ( HOIST-AT ?auto_46323 ?auto_46317 ) ( not ( = ?auto_46326 ?auto_46323 ) ) ( not ( = ?auto_46319 ?auto_46323 ) ) ( AVAILABLE ?auto_46323 ) ( SURFACE-AT ?auto_46316 ?auto_46317 ) ( ON ?auto_46316 ?auto_46318 ) ( CLEAR ?auto_46316 ) ( not ( = ?auto_46315 ?auto_46318 ) ) ( not ( = ?auto_46316 ?auto_46318 ) ) ( not ( = ?auto_46327 ?auto_46318 ) ) ( not ( = ?auto_46322 ?auto_46318 ) ) ( SURFACE-AT ?auto_46325 ?auto_46321 ) ( CLEAR ?auto_46325 ) ( IS-CRATE ?auto_46322 ) ( not ( = ?auto_46315 ?auto_46325 ) ) ( not ( = ?auto_46316 ?auto_46325 ) ) ( not ( = ?auto_46327 ?auto_46325 ) ) ( not ( = ?auto_46322 ?auto_46325 ) ) ( not ( = ?auto_46318 ?auto_46325 ) ) ( AVAILABLE ?auto_46326 ) ( IN ?auto_46322 ?auto_46324 ) ( TRUCK-AT ?auto_46324 ?auto_46328 ) ( not ( = ?auto_46328 ?auto_46321 ) ) ( not ( = ?auto_46320 ?auto_46328 ) ) ( not ( = ?auto_46317 ?auto_46328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46324 ?auto_46328 ?auto_46321 )
      ( MAKE-ON ?auto_46315 ?auto_46316 )
      ( MAKE-ON-VERIFY ?auto_46315 ?auto_46316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46329 - SURFACE
      ?auto_46330 - SURFACE
    )
    :vars
    (
      ?auto_46334 - HOIST
      ?auto_46340 - PLACE
      ?auto_46332 - PLACE
      ?auto_46335 - HOIST
      ?auto_46331 - SURFACE
      ?auto_46337 - SURFACE
      ?auto_46333 - PLACE
      ?auto_46336 - HOIST
      ?auto_46342 - SURFACE
      ?auto_46341 - SURFACE
      ?auto_46338 - TRUCK
      ?auto_46339 - PLACE
      ?auto_46343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46334 ?auto_46340 ) ( IS-CRATE ?auto_46329 ) ( not ( = ?auto_46329 ?auto_46330 ) ) ( not ( = ?auto_46332 ?auto_46340 ) ) ( HOIST-AT ?auto_46335 ?auto_46332 ) ( not ( = ?auto_46334 ?auto_46335 ) ) ( AVAILABLE ?auto_46335 ) ( SURFACE-AT ?auto_46329 ?auto_46332 ) ( ON ?auto_46329 ?auto_46331 ) ( CLEAR ?auto_46329 ) ( not ( = ?auto_46329 ?auto_46331 ) ) ( not ( = ?auto_46330 ?auto_46331 ) ) ( IS-CRATE ?auto_46330 ) ( not ( = ?auto_46329 ?auto_46337 ) ) ( not ( = ?auto_46330 ?auto_46337 ) ) ( not ( = ?auto_46331 ?auto_46337 ) ) ( not ( = ?auto_46333 ?auto_46340 ) ) ( not ( = ?auto_46332 ?auto_46333 ) ) ( HOIST-AT ?auto_46336 ?auto_46333 ) ( not ( = ?auto_46334 ?auto_46336 ) ) ( not ( = ?auto_46335 ?auto_46336 ) ) ( AVAILABLE ?auto_46336 ) ( SURFACE-AT ?auto_46330 ?auto_46333 ) ( ON ?auto_46330 ?auto_46342 ) ( CLEAR ?auto_46330 ) ( not ( = ?auto_46329 ?auto_46342 ) ) ( not ( = ?auto_46330 ?auto_46342 ) ) ( not ( = ?auto_46331 ?auto_46342 ) ) ( not ( = ?auto_46337 ?auto_46342 ) ) ( SURFACE-AT ?auto_46341 ?auto_46340 ) ( CLEAR ?auto_46341 ) ( IS-CRATE ?auto_46337 ) ( not ( = ?auto_46329 ?auto_46341 ) ) ( not ( = ?auto_46330 ?auto_46341 ) ) ( not ( = ?auto_46331 ?auto_46341 ) ) ( not ( = ?auto_46337 ?auto_46341 ) ) ( not ( = ?auto_46342 ?auto_46341 ) ) ( AVAILABLE ?auto_46334 ) ( TRUCK-AT ?auto_46338 ?auto_46339 ) ( not ( = ?auto_46339 ?auto_46340 ) ) ( not ( = ?auto_46332 ?auto_46339 ) ) ( not ( = ?auto_46333 ?auto_46339 ) ) ( HOIST-AT ?auto_46343 ?auto_46339 ) ( LIFTING ?auto_46343 ?auto_46337 ) ( not ( = ?auto_46334 ?auto_46343 ) ) ( not ( = ?auto_46335 ?auto_46343 ) ) ( not ( = ?auto_46336 ?auto_46343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46343 ?auto_46337 ?auto_46338 ?auto_46339 )
      ( MAKE-ON ?auto_46329 ?auto_46330 )
      ( MAKE-ON-VERIFY ?auto_46329 ?auto_46330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46344 - SURFACE
      ?auto_46345 - SURFACE
    )
    :vars
    (
      ?auto_46346 - HOIST
      ?auto_46350 - PLACE
      ?auto_46357 - PLACE
      ?auto_46355 - HOIST
      ?auto_46356 - SURFACE
      ?auto_46351 - SURFACE
      ?auto_46349 - PLACE
      ?auto_46354 - HOIST
      ?auto_46347 - SURFACE
      ?auto_46348 - SURFACE
      ?auto_46352 - TRUCK
      ?auto_46353 - PLACE
      ?auto_46358 - HOIST
      ?auto_46359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46346 ?auto_46350 ) ( IS-CRATE ?auto_46344 ) ( not ( = ?auto_46344 ?auto_46345 ) ) ( not ( = ?auto_46357 ?auto_46350 ) ) ( HOIST-AT ?auto_46355 ?auto_46357 ) ( not ( = ?auto_46346 ?auto_46355 ) ) ( AVAILABLE ?auto_46355 ) ( SURFACE-AT ?auto_46344 ?auto_46357 ) ( ON ?auto_46344 ?auto_46356 ) ( CLEAR ?auto_46344 ) ( not ( = ?auto_46344 ?auto_46356 ) ) ( not ( = ?auto_46345 ?auto_46356 ) ) ( IS-CRATE ?auto_46345 ) ( not ( = ?auto_46344 ?auto_46351 ) ) ( not ( = ?auto_46345 ?auto_46351 ) ) ( not ( = ?auto_46356 ?auto_46351 ) ) ( not ( = ?auto_46349 ?auto_46350 ) ) ( not ( = ?auto_46357 ?auto_46349 ) ) ( HOIST-AT ?auto_46354 ?auto_46349 ) ( not ( = ?auto_46346 ?auto_46354 ) ) ( not ( = ?auto_46355 ?auto_46354 ) ) ( AVAILABLE ?auto_46354 ) ( SURFACE-AT ?auto_46345 ?auto_46349 ) ( ON ?auto_46345 ?auto_46347 ) ( CLEAR ?auto_46345 ) ( not ( = ?auto_46344 ?auto_46347 ) ) ( not ( = ?auto_46345 ?auto_46347 ) ) ( not ( = ?auto_46356 ?auto_46347 ) ) ( not ( = ?auto_46351 ?auto_46347 ) ) ( SURFACE-AT ?auto_46348 ?auto_46350 ) ( CLEAR ?auto_46348 ) ( IS-CRATE ?auto_46351 ) ( not ( = ?auto_46344 ?auto_46348 ) ) ( not ( = ?auto_46345 ?auto_46348 ) ) ( not ( = ?auto_46356 ?auto_46348 ) ) ( not ( = ?auto_46351 ?auto_46348 ) ) ( not ( = ?auto_46347 ?auto_46348 ) ) ( AVAILABLE ?auto_46346 ) ( TRUCK-AT ?auto_46352 ?auto_46353 ) ( not ( = ?auto_46353 ?auto_46350 ) ) ( not ( = ?auto_46357 ?auto_46353 ) ) ( not ( = ?auto_46349 ?auto_46353 ) ) ( HOIST-AT ?auto_46358 ?auto_46353 ) ( not ( = ?auto_46346 ?auto_46358 ) ) ( not ( = ?auto_46355 ?auto_46358 ) ) ( not ( = ?auto_46354 ?auto_46358 ) ) ( AVAILABLE ?auto_46358 ) ( SURFACE-AT ?auto_46351 ?auto_46353 ) ( ON ?auto_46351 ?auto_46359 ) ( CLEAR ?auto_46351 ) ( not ( = ?auto_46344 ?auto_46359 ) ) ( not ( = ?auto_46345 ?auto_46359 ) ) ( not ( = ?auto_46356 ?auto_46359 ) ) ( not ( = ?auto_46351 ?auto_46359 ) ) ( not ( = ?auto_46347 ?auto_46359 ) ) ( not ( = ?auto_46348 ?auto_46359 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46358 ?auto_46351 ?auto_46359 ?auto_46353 )
      ( MAKE-ON ?auto_46344 ?auto_46345 )
      ( MAKE-ON-VERIFY ?auto_46344 ?auto_46345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46360 - SURFACE
      ?auto_46361 - SURFACE
    )
    :vars
    (
      ?auto_46368 - HOIST
      ?auto_46372 - PLACE
      ?auto_46370 - PLACE
      ?auto_46363 - HOIST
      ?auto_46374 - SURFACE
      ?auto_46364 - SURFACE
      ?auto_46369 - PLACE
      ?auto_46366 - HOIST
      ?auto_46362 - SURFACE
      ?auto_46371 - SURFACE
      ?auto_46367 - PLACE
      ?auto_46365 - HOIST
      ?auto_46375 - SURFACE
      ?auto_46373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46368 ?auto_46372 ) ( IS-CRATE ?auto_46360 ) ( not ( = ?auto_46360 ?auto_46361 ) ) ( not ( = ?auto_46370 ?auto_46372 ) ) ( HOIST-AT ?auto_46363 ?auto_46370 ) ( not ( = ?auto_46368 ?auto_46363 ) ) ( AVAILABLE ?auto_46363 ) ( SURFACE-AT ?auto_46360 ?auto_46370 ) ( ON ?auto_46360 ?auto_46374 ) ( CLEAR ?auto_46360 ) ( not ( = ?auto_46360 ?auto_46374 ) ) ( not ( = ?auto_46361 ?auto_46374 ) ) ( IS-CRATE ?auto_46361 ) ( not ( = ?auto_46360 ?auto_46364 ) ) ( not ( = ?auto_46361 ?auto_46364 ) ) ( not ( = ?auto_46374 ?auto_46364 ) ) ( not ( = ?auto_46369 ?auto_46372 ) ) ( not ( = ?auto_46370 ?auto_46369 ) ) ( HOIST-AT ?auto_46366 ?auto_46369 ) ( not ( = ?auto_46368 ?auto_46366 ) ) ( not ( = ?auto_46363 ?auto_46366 ) ) ( AVAILABLE ?auto_46366 ) ( SURFACE-AT ?auto_46361 ?auto_46369 ) ( ON ?auto_46361 ?auto_46362 ) ( CLEAR ?auto_46361 ) ( not ( = ?auto_46360 ?auto_46362 ) ) ( not ( = ?auto_46361 ?auto_46362 ) ) ( not ( = ?auto_46374 ?auto_46362 ) ) ( not ( = ?auto_46364 ?auto_46362 ) ) ( SURFACE-AT ?auto_46371 ?auto_46372 ) ( CLEAR ?auto_46371 ) ( IS-CRATE ?auto_46364 ) ( not ( = ?auto_46360 ?auto_46371 ) ) ( not ( = ?auto_46361 ?auto_46371 ) ) ( not ( = ?auto_46374 ?auto_46371 ) ) ( not ( = ?auto_46364 ?auto_46371 ) ) ( not ( = ?auto_46362 ?auto_46371 ) ) ( AVAILABLE ?auto_46368 ) ( not ( = ?auto_46367 ?auto_46372 ) ) ( not ( = ?auto_46370 ?auto_46367 ) ) ( not ( = ?auto_46369 ?auto_46367 ) ) ( HOIST-AT ?auto_46365 ?auto_46367 ) ( not ( = ?auto_46368 ?auto_46365 ) ) ( not ( = ?auto_46363 ?auto_46365 ) ) ( not ( = ?auto_46366 ?auto_46365 ) ) ( AVAILABLE ?auto_46365 ) ( SURFACE-AT ?auto_46364 ?auto_46367 ) ( ON ?auto_46364 ?auto_46375 ) ( CLEAR ?auto_46364 ) ( not ( = ?auto_46360 ?auto_46375 ) ) ( not ( = ?auto_46361 ?auto_46375 ) ) ( not ( = ?auto_46374 ?auto_46375 ) ) ( not ( = ?auto_46364 ?auto_46375 ) ) ( not ( = ?auto_46362 ?auto_46375 ) ) ( not ( = ?auto_46371 ?auto_46375 ) ) ( TRUCK-AT ?auto_46373 ?auto_46372 ) )
    :subtasks
    ( ( !DRIVE ?auto_46373 ?auto_46372 ?auto_46367 )
      ( MAKE-ON ?auto_46360 ?auto_46361 )
      ( MAKE-ON-VERIFY ?auto_46360 ?auto_46361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46376 - SURFACE
      ?auto_46377 - SURFACE
    )
    :vars
    (
      ?auto_46385 - HOIST
      ?auto_46391 - PLACE
      ?auto_46386 - PLACE
      ?auto_46388 - HOIST
      ?auto_46381 - SURFACE
      ?auto_46382 - SURFACE
      ?auto_46383 - PLACE
      ?auto_46384 - HOIST
      ?auto_46379 - SURFACE
      ?auto_46380 - SURFACE
      ?auto_46378 - PLACE
      ?auto_46390 - HOIST
      ?auto_46389 - SURFACE
      ?auto_46387 - TRUCK
      ?auto_46392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46385 ?auto_46391 ) ( IS-CRATE ?auto_46376 ) ( not ( = ?auto_46376 ?auto_46377 ) ) ( not ( = ?auto_46386 ?auto_46391 ) ) ( HOIST-AT ?auto_46388 ?auto_46386 ) ( not ( = ?auto_46385 ?auto_46388 ) ) ( AVAILABLE ?auto_46388 ) ( SURFACE-AT ?auto_46376 ?auto_46386 ) ( ON ?auto_46376 ?auto_46381 ) ( CLEAR ?auto_46376 ) ( not ( = ?auto_46376 ?auto_46381 ) ) ( not ( = ?auto_46377 ?auto_46381 ) ) ( IS-CRATE ?auto_46377 ) ( not ( = ?auto_46376 ?auto_46382 ) ) ( not ( = ?auto_46377 ?auto_46382 ) ) ( not ( = ?auto_46381 ?auto_46382 ) ) ( not ( = ?auto_46383 ?auto_46391 ) ) ( not ( = ?auto_46386 ?auto_46383 ) ) ( HOIST-AT ?auto_46384 ?auto_46383 ) ( not ( = ?auto_46385 ?auto_46384 ) ) ( not ( = ?auto_46388 ?auto_46384 ) ) ( AVAILABLE ?auto_46384 ) ( SURFACE-AT ?auto_46377 ?auto_46383 ) ( ON ?auto_46377 ?auto_46379 ) ( CLEAR ?auto_46377 ) ( not ( = ?auto_46376 ?auto_46379 ) ) ( not ( = ?auto_46377 ?auto_46379 ) ) ( not ( = ?auto_46381 ?auto_46379 ) ) ( not ( = ?auto_46382 ?auto_46379 ) ) ( IS-CRATE ?auto_46382 ) ( not ( = ?auto_46376 ?auto_46380 ) ) ( not ( = ?auto_46377 ?auto_46380 ) ) ( not ( = ?auto_46381 ?auto_46380 ) ) ( not ( = ?auto_46382 ?auto_46380 ) ) ( not ( = ?auto_46379 ?auto_46380 ) ) ( not ( = ?auto_46378 ?auto_46391 ) ) ( not ( = ?auto_46386 ?auto_46378 ) ) ( not ( = ?auto_46383 ?auto_46378 ) ) ( HOIST-AT ?auto_46390 ?auto_46378 ) ( not ( = ?auto_46385 ?auto_46390 ) ) ( not ( = ?auto_46388 ?auto_46390 ) ) ( not ( = ?auto_46384 ?auto_46390 ) ) ( AVAILABLE ?auto_46390 ) ( SURFACE-AT ?auto_46382 ?auto_46378 ) ( ON ?auto_46382 ?auto_46389 ) ( CLEAR ?auto_46382 ) ( not ( = ?auto_46376 ?auto_46389 ) ) ( not ( = ?auto_46377 ?auto_46389 ) ) ( not ( = ?auto_46381 ?auto_46389 ) ) ( not ( = ?auto_46382 ?auto_46389 ) ) ( not ( = ?auto_46379 ?auto_46389 ) ) ( not ( = ?auto_46380 ?auto_46389 ) ) ( TRUCK-AT ?auto_46387 ?auto_46391 ) ( SURFACE-AT ?auto_46392 ?auto_46391 ) ( CLEAR ?auto_46392 ) ( LIFTING ?auto_46385 ?auto_46380 ) ( IS-CRATE ?auto_46380 ) ( not ( = ?auto_46376 ?auto_46392 ) ) ( not ( = ?auto_46377 ?auto_46392 ) ) ( not ( = ?auto_46381 ?auto_46392 ) ) ( not ( = ?auto_46382 ?auto_46392 ) ) ( not ( = ?auto_46379 ?auto_46392 ) ) ( not ( = ?auto_46380 ?auto_46392 ) ) ( not ( = ?auto_46389 ?auto_46392 ) ) )
    :subtasks
    ( ( !DROP ?auto_46385 ?auto_46380 ?auto_46392 ?auto_46391 )
      ( MAKE-ON ?auto_46376 ?auto_46377 )
      ( MAKE-ON-VERIFY ?auto_46376 ?auto_46377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46393 - SURFACE
      ?auto_46394 - SURFACE
    )
    :vars
    (
      ?auto_46400 - HOIST
      ?auto_46406 - PLACE
      ?auto_46403 - PLACE
      ?auto_46407 - HOIST
      ?auto_46401 - SURFACE
      ?auto_46399 - SURFACE
      ?auto_46398 - PLACE
      ?auto_46404 - HOIST
      ?auto_46402 - SURFACE
      ?auto_46396 - SURFACE
      ?auto_46405 - PLACE
      ?auto_46395 - HOIST
      ?auto_46409 - SURFACE
      ?auto_46397 - TRUCK
      ?auto_46408 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46400 ?auto_46406 ) ( IS-CRATE ?auto_46393 ) ( not ( = ?auto_46393 ?auto_46394 ) ) ( not ( = ?auto_46403 ?auto_46406 ) ) ( HOIST-AT ?auto_46407 ?auto_46403 ) ( not ( = ?auto_46400 ?auto_46407 ) ) ( AVAILABLE ?auto_46407 ) ( SURFACE-AT ?auto_46393 ?auto_46403 ) ( ON ?auto_46393 ?auto_46401 ) ( CLEAR ?auto_46393 ) ( not ( = ?auto_46393 ?auto_46401 ) ) ( not ( = ?auto_46394 ?auto_46401 ) ) ( IS-CRATE ?auto_46394 ) ( not ( = ?auto_46393 ?auto_46399 ) ) ( not ( = ?auto_46394 ?auto_46399 ) ) ( not ( = ?auto_46401 ?auto_46399 ) ) ( not ( = ?auto_46398 ?auto_46406 ) ) ( not ( = ?auto_46403 ?auto_46398 ) ) ( HOIST-AT ?auto_46404 ?auto_46398 ) ( not ( = ?auto_46400 ?auto_46404 ) ) ( not ( = ?auto_46407 ?auto_46404 ) ) ( AVAILABLE ?auto_46404 ) ( SURFACE-AT ?auto_46394 ?auto_46398 ) ( ON ?auto_46394 ?auto_46402 ) ( CLEAR ?auto_46394 ) ( not ( = ?auto_46393 ?auto_46402 ) ) ( not ( = ?auto_46394 ?auto_46402 ) ) ( not ( = ?auto_46401 ?auto_46402 ) ) ( not ( = ?auto_46399 ?auto_46402 ) ) ( IS-CRATE ?auto_46399 ) ( not ( = ?auto_46393 ?auto_46396 ) ) ( not ( = ?auto_46394 ?auto_46396 ) ) ( not ( = ?auto_46401 ?auto_46396 ) ) ( not ( = ?auto_46399 ?auto_46396 ) ) ( not ( = ?auto_46402 ?auto_46396 ) ) ( not ( = ?auto_46405 ?auto_46406 ) ) ( not ( = ?auto_46403 ?auto_46405 ) ) ( not ( = ?auto_46398 ?auto_46405 ) ) ( HOIST-AT ?auto_46395 ?auto_46405 ) ( not ( = ?auto_46400 ?auto_46395 ) ) ( not ( = ?auto_46407 ?auto_46395 ) ) ( not ( = ?auto_46404 ?auto_46395 ) ) ( AVAILABLE ?auto_46395 ) ( SURFACE-AT ?auto_46399 ?auto_46405 ) ( ON ?auto_46399 ?auto_46409 ) ( CLEAR ?auto_46399 ) ( not ( = ?auto_46393 ?auto_46409 ) ) ( not ( = ?auto_46394 ?auto_46409 ) ) ( not ( = ?auto_46401 ?auto_46409 ) ) ( not ( = ?auto_46399 ?auto_46409 ) ) ( not ( = ?auto_46402 ?auto_46409 ) ) ( not ( = ?auto_46396 ?auto_46409 ) ) ( TRUCK-AT ?auto_46397 ?auto_46406 ) ( SURFACE-AT ?auto_46408 ?auto_46406 ) ( CLEAR ?auto_46408 ) ( IS-CRATE ?auto_46396 ) ( not ( = ?auto_46393 ?auto_46408 ) ) ( not ( = ?auto_46394 ?auto_46408 ) ) ( not ( = ?auto_46401 ?auto_46408 ) ) ( not ( = ?auto_46399 ?auto_46408 ) ) ( not ( = ?auto_46402 ?auto_46408 ) ) ( not ( = ?auto_46396 ?auto_46408 ) ) ( not ( = ?auto_46409 ?auto_46408 ) ) ( AVAILABLE ?auto_46400 ) ( IN ?auto_46396 ?auto_46397 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46400 ?auto_46396 ?auto_46397 ?auto_46406 )
      ( MAKE-ON ?auto_46393 ?auto_46394 )
      ( MAKE-ON-VERIFY ?auto_46393 ?auto_46394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46410 - SURFACE
      ?auto_46411 - SURFACE
    )
    :vars
    (
      ?auto_46415 - HOIST
      ?auto_46413 - PLACE
      ?auto_46423 - PLACE
      ?auto_46425 - HOIST
      ?auto_46412 - SURFACE
      ?auto_46419 - SURFACE
      ?auto_46426 - PLACE
      ?auto_46422 - HOIST
      ?auto_46418 - SURFACE
      ?auto_46414 - SURFACE
      ?auto_46420 - PLACE
      ?auto_46417 - HOIST
      ?auto_46424 - SURFACE
      ?auto_46416 - SURFACE
      ?auto_46421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46415 ?auto_46413 ) ( IS-CRATE ?auto_46410 ) ( not ( = ?auto_46410 ?auto_46411 ) ) ( not ( = ?auto_46423 ?auto_46413 ) ) ( HOIST-AT ?auto_46425 ?auto_46423 ) ( not ( = ?auto_46415 ?auto_46425 ) ) ( AVAILABLE ?auto_46425 ) ( SURFACE-AT ?auto_46410 ?auto_46423 ) ( ON ?auto_46410 ?auto_46412 ) ( CLEAR ?auto_46410 ) ( not ( = ?auto_46410 ?auto_46412 ) ) ( not ( = ?auto_46411 ?auto_46412 ) ) ( IS-CRATE ?auto_46411 ) ( not ( = ?auto_46410 ?auto_46419 ) ) ( not ( = ?auto_46411 ?auto_46419 ) ) ( not ( = ?auto_46412 ?auto_46419 ) ) ( not ( = ?auto_46426 ?auto_46413 ) ) ( not ( = ?auto_46423 ?auto_46426 ) ) ( HOIST-AT ?auto_46422 ?auto_46426 ) ( not ( = ?auto_46415 ?auto_46422 ) ) ( not ( = ?auto_46425 ?auto_46422 ) ) ( AVAILABLE ?auto_46422 ) ( SURFACE-AT ?auto_46411 ?auto_46426 ) ( ON ?auto_46411 ?auto_46418 ) ( CLEAR ?auto_46411 ) ( not ( = ?auto_46410 ?auto_46418 ) ) ( not ( = ?auto_46411 ?auto_46418 ) ) ( not ( = ?auto_46412 ?auto_46418 ) ) ( not ( = ?auto_46419 ?auto_46418 ) ) ( IS-CRATE ?auto_46419 ) ( not ( = ?auto_46410 ?auto_46414 ) ) ( not ( = ?auto_46411 ?auto_46414 ) ) ( not ( = ?auto_46412 ?auto_46414 ) ) ( not ( = ?auto_46419 ?auto_46414 ) ) ( not ( = ?auto_46418 ?auto_46414 ) ) ( not ( = ?auto_46420 ?auto_46413 ) ) ( not ( = ?auto_46423 ?auto_46420 ) ) ( not ( = ?auto_46426 ?auto_46420 ) ) ( HOIST-AT ?auto_46417 ?auto_46420 ) ( not ( = ?auto_46415 ?auto_46417 ) ) ( not ( = ?auto_46425 ?auto_46417 ) ) ( not ( = ?auto_46422 ?auto_46417 ) ) ( AVAILABLE ?auto_46417 ) ( SURFACE-AT ?auto_46419 ?auto_46420 ) ( ON ?auto_46419 ?auto_46424 ) ( CLEAR ?auto_46419 ) ( not ( = ?auto_46410 ?auto_46424 ) ) ( not ( = ?auto_46411 ?auto_46424 ) ) ( not ( = ?auto_46412 ?auto_46424 ) ) ( not ( = ?auto_46419 ?auto_46424 ) ) ( not ( = ?auto_46418 ?auto_46424 ) ) ( not ( = ?auto_46414 ?auto_46424 ) ) ( SURFACE-AT ?auto_46416 ?auto_46413 ) ( CLEAR ?auto_46416 ) ( IS-CRATE ?auto_46414 ) ( not ( = ?auto_46410 ?auto_46416 ) ) ( not ( = ?auto_46411 ?auto_46416 ) ) ( not ( = ?auto_46412 ?auto_46416 ) ) ( not ( = ?auto_46419 ?auto_46416 ) ) ( not ( = ?auto_46418 ?auto_46416 ) ) ( not ( = ?auto_46414 ?auto_46416 ) ) ( not ( = ?auto_46424 ?auto_46416 ) ) ( AVAILABLE ?auto_46415 ) ( IN ?auto_46414 ?auto_46421 ) ( TRUCK-AT ?auto_46421 ?auto_46423 ) )
    :subtasks
    ( ( !DRIVE ?auto_46421 ?auto_46423 ?auto_46413 )
      ( MAKE-ON ?auto_46410 ?auto_46411 )
      ( MAKE-ON-VERIFY ?auto_46410 ?auto_46411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46427 - SURFACE
      ?auto_46428 - SURFACE
    )
    :vars
    (
      ?auto_46430 - HOIST
      ?auto_46433 - PLACE
      ?auto_46442 - PLACE
      ?auto_46436 - HOIST
      ?auto_46443 - SURFACE
      ?auto_46435 - SURFACE
      ?auto_46437 - PLACE
      ?auto_46434 - HOIST
      ?auto_46429 - SURFACE
      ?auto_46432 - SURFACE
      ?auto_46440 - PLACE
      ?auto_46439 - HOIST
      ?auto_46438 - SURFACE
      ?auto_46441 - SURFACE
      ?auto_46431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46430 ?auto_46433 ) ( IS-CRATE ?auto_46427 ) ( not ( = ?auto_46427 ?auto_46428 ) ) ( not ( = ?auto_46442 ?auto_46433 ) ) ( HOIST-AT ?auto_46436 ?auto_46442 ) ( not ( = ?auto_46430 ?auto_46436 ) ) ( SURFACE-AT ?auto_46427 ?auto_46442 ) ( ON ?auto_46427 ?auto_46443 ) ( CLEAR ?auto_46427 ) ( not ( = ?auto_46427 ?auto_46443 ) ) ( not ( = ?auto_46428 ?auto_46443 ) ) ( IS-CRATE ?auto_46428 ) ( not ( = ?auto_46427 ?auto_46435 ) ) ( not ( = ?auto_46428 ?auto_46435 ) ) ( not ( = ?auto_46443 ?auto_46435 ) ) ( not ( = ?auto_46437 ?auto_46433 ) ) ( not ( = ?auto_46442 ?auto_46437 ) ) ( HOIST-AT ?auto_46434 ?auto_46437 ) ( not ( = ?auto_46430 ?auto_46434 ) ) ( not ( = ?auto_46436 ?auto_46434 ) ) ( AVAILABLE ?auto_46434 ) ( SURFACE-AT ?auto_46428 ?auto_46437 ) ( ON ?auto_46428 ?auto_46429 ) ( CLEAR ?auto_46428 ) ( not ( = ?auto_46427 ?auto_46429 ) ) ( not ( = ?auto_46428 ?auto_46429 ) ) ( not ( = ?auto_46443 ?auto_46429 ) ) ( not ( = ?auto_46435 ?auto_46429 ) ) ( IS-CRATE ?auto_46435 ) ( not ( = ?auto_46427 ?auto_46432 ) ) ( not ( = ?auto_46428 ?auto_46432 ) ) ( not ( = ?auto_46443 ?auto_46432 ) ) ( not ( = ?auto_46435 ?auto_46432 ) ) ( not ( = ?auto_46429 ?auto_46432 ) ) ( not ( = ?auto_46440 ?auto_46433 ) ) ( not ( = ?auto_46442 ?auto_46440 ) ) ( not ( = ?auto_46437 ?auto_46440 ) ) ( HOIST-AT ?auto_46439 ?auto_46440 ) ( not ( = ?auto_46430 ?auto_46439 ) ) ( not ( = ?auto_46436 ?auto_46439 ) ) ( not ( = ?auto_46434 ?auto_46439 ) ) ( AVAILABLE ?auto_46439 ) ( SURFACE-AT ?auto_46435 ?auto_46440 ) ( ON ?auto_46435 ?auto_46438 ) ( CLEAR ?auto_46435 ) ( not ( = ?auto_46427 ?auto_46438 ) ) ( not ( = ?auto_46428 ?auto_46438 ) ) ( not ( = ?auto_46443 ?auto_46438 ) ) ( not ( = ?auto_46435 ?auto_46438 ) ) ( not ( = ?auto_46429 ?auto_46438 ) ) ( not ( = ?auto_46432 ?auto_46438 ) ) ( SURFACE-AT ?auto_46441 ?auto_46433 ) ( CLEAR ?auto_46441 ) ( IS-CRATE ?auto_46432 ) ( not ( = ?auto_46427 ?auto_46441 ) ) ( not ( = ?auto_46428 ?auto_46441 ) ) ( not ( = ?auto_46443 ?auto_46441 ) ) ( not ( = ?auto_46435 ?auto_46441 ) ) ( not ( = ?auto_46429 ?auto_46441 ) ) ( not ( = ?auto_46432 ?auto_46441 ) ) ( not ( = ?auto_46438 ?auto_46441 ) ) ( AVAILABLE ?auto_46430 ) ( TRUCK-AT ?auto_46431 ?auto_46442 ) ( LIFTING ?auto_46436 ?auto_46432 ) )
    :subtasks
    ( ( !LOAD ?auto_46436 ?auto_46432 ?auto_46431 ?auto_46442 )
      ( MAKE-ON ?auto_46427 ?auto_46428 )
      ( MAKE-ON-VERIFY ?auto_46427 ?auto_46428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46444 - SURFACE
      ?auto_46445 - SURFACE
    )
    :vars
    (
      ?auto_46458 - HOIST
      ?auto_46446 - PLACE
      ?auto_46454 - PLACE
      ?auto_46450 - HOIST
      ?auto_46449 - SURFACE
      ?auto_46452 - SURFACE
      ?auto_46451 - PLACE
      ?auto_46448 - HOIST
      ?auto_46453 - SURFACE
      ?auto_46447 - SURFACE
      ?auto_46460 - PLACE
      ?auto_46456 - HOIST
      ?auto_46457 - SURFACE
      ?auto_46455 - SURFACE
      ?auto_46459 - TRUCK
      ?auto_46461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46458 ?auto_46446 ) ( IS-CRATE ?auto_46444 ) ( not ( = ?auto_46444 ?auto_46445 ) ) ( not ( = ?auto_46454 ?auto_46446 ) ) ( HOIST-AT ?auto_46450 ?auto_46454 ) ( not ( = ?auto_46458 ?auto_46450 ) ) ( SURFACE-AT ?auto_46444 ?auto_46454 ) ( ON ?auto_46444 ?auto_46449 ) ( CLEAR ?auto_46444 ) ( not ( = ?auto_46444 ?auto_46449 ) ) ( not ( = ?auto_46445 ?auto_46449 ) ) ( IS-CRATE ?auto_46445 ) ( not ( = ?auto_46444 ?auto_46452 ) ) ( not ( = ?auto_46445 ?auto_46452 ) ) ( not ( = ?auto_46449 ?auto_46452 ) ) ( not ( = ?auto_46451 ?auto_46446 ) ) ( not ( = ?auto_46454 ?auto_46451 ) ) ( HOIST-AT ?auto_46448 ?auto_46451 ) ( not ( = ?auto_46458 ?auto_46448 ) ) ( not ( = ?auto_46450 ?auto_46448 ) ) ( AVAILABLE ?auto_46448 ) ( SURFACE-AT ?auto_46445 ?auto_46451 ) ( ON ?auto_46445 ?auto_46453 ) ( CLEAR ?auto_46445 ) ( not ( = ?auto_46444 ?auto_46453 ) ) ( not ( = ?auto_46445 ?auto_46453 ) ) ( not ( = ?auto_46449 ?auto_46453 ) ) ( not ( = ?auto_46452 ?auto_46453 ) ) ( IS-CRATE ?auto_46452 ) ( not ( = ?auto_46444 ?auto_46447 ) ) ( not ( = ?auto_46445 ?auto_46447 ) ) ( not ( = ?auto_46449 ?auto_46447 ) ) ( not ( = ?auto_46452 ?auto_46447 ) ) ( not ( = ?auto_46453 ?auto_46447 ) ) ( not ( = ?auto_46460 ?auto_46446 ) ) ( not ( = ?auto_46454 ?auto_46460 ) ) ( not ( = ?auto_46451 ?auto_46460 ) ) ( HOIST-AT ?auto_46456 ?auto_46460 ) ( not ( = ?auto_46458 ?auto_46456 ) ) ( not ( = ?auto_46450 ?auto_46456 ) ) ( not ( = ?auto_46448 ?auto_46456 ) ) ( AVAILABLE ?auto_46456 ) ( SURFACE-AT ?auto_46452 ?auto_46460 ) ( ON ?auto_46452 ?auto_46457 ) ( CLEAR ?auto_46452 ) ( not ( = ?auto_46444 ?auto_46457 ) ) ( not ( = ?auto_46445 ?auto_46457 ) ) ( not ( = ?auto_46449 ?auto_46457 ) ) ( not ( = ?auto_46452 ?auto_46457 ) ) ( not ( = ?auto_46453 ?auto_46457 ) ) ( not ( = ?auto_46447 ?auto_46457 ) ) ( SURFACE-AT ?auto_46455 ?auto_46446 ) ( CLEAR ?auto_46455 ) ( IS-CRATE ?auto_46447 ) ( not ( = ?auto_46444 ?auto_46455 ) ) ( not ( = ?auto_46445 ?auto_46455 ) ) ( not ( = ?auto_46449 ?auto_46455 ) ) ( not ( = ?auto_46452 ?auto_46455 ) ) ( not ( = ?auto_46453 ?auto_46455 ) ) ( not ( = ?auto_46447 ?auto_46455 ) ) ( not ( = ?auto_46457 ?auto_46455 ) ) ( AVAILABLE ?auto_46458 ) ( TRUCK-AT ?auto_46459 ?auto_46454 ) ( AVAILABLE ?auto_46450 ) ( SURFACE-AT ?auto_46447 ?auto_46454 ) ( ON ?auto_46447 ?auto_46461 ) ( CLEAR ?auto_46447 ) ( not ( = ?auto_46444 ?auto_46461 ) ) ( not ( = ?auto_46445 ?auto_46461 ) ) ( not ( = ?auto_46449 ?auto_46461 ) ) ( not ( = ?auto_46452 ?auto_46461 ) ) ( not ( = ?auto_46453 ?auto_46461 ) ) ( not ( = ?auto_46447 ?auto_46461 ) ) ( not ( = ?auto_46457 ?auto_46461 ) ) ( not ( = ?auto_46455 ?auto_46461 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46450 ?auto_46447 ?auto_46461 ?auto_46454 )
      ( MAKE-ON ?auto_46444 ?auto_46445 )
      ( MAKE-ON-VERIFY ?auto_46444 ?auto_46445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46462 - SURFACE
      ?auto_46463 - SURFACE
    )
    :vars
    (
      ?auto_46468 - HOIST
      ?auto_46465 - PLACE
      ?auto_46478 - PLACE
      ?auto_46473 - HOIST
      ?auto_46477 - SURFACE
      ?auto_46466 - SURFACE
      ?auto_46471 - PLACE
      ?auto_46474 - HOIST
      ?auto_46475 - SURFACE
      ?auto_46472 - SURFACE
      ?auto_46467 - PLACE
      ?auto_46464 - HOIST
      ?auto_46469 - SURFACE
      ?auto_46470 - SURFACE
      ?auto_46479 - SURFACE
      ?auto_46476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46468 ?auto_46465 ) ( IS-CRATE ?auto_46462 ) ( not ( = ?auto_46462 ?auto_46463 ) ) ( not ( = ?auto_46478 ?auto_46465 ) ) ( HOIST-AT ?auto_46473 ?auto_46478 ) ( not ( = ?auto_46468 ?auto_46473 ) ) ( SURFACE-AT ?auto_46462 ?auto_46478 ) ( ON ?auto_46462 ?auto_46477 ) ( CLEAR ?auto_46462 ) ( not ( = ?auto_46462 ?auto_46477 ) ) ( not ( = ?auto_46463 ?auto_46477 ) ) ( IS-CRATE ?auto_46463 ) ( not ( = ?auto_46462 ?auto_46466 ) ) ( not ( = ?auto_46463 ?auto_46466 ) ) ( not ( = ?auto_46477 ?auto_46466 ) ) ( not ( = ?auto_46471 ?auto_46465 ) ) ( not ( = ?auto_46478 ?auto_46471 ) ) ( HOIST-AT ?auto_46474 ?auto_46471 ) ( not ( = ?auto_46468 ?auto_46474 ) ) ( not ( = ?auto_46473 ?auto_46474 ) ) ( AVAILABLE ?auto_46474 ) ( SURFACE-AT ?auto_46463 ?auto_46471 ) ( ON ?auto_46463 ?auto_46475 ) ( CLEAR ?auto_46463 ) ( not ( = ?auto_46462 ?auto_46475 ) ) ( not ( = ?auto_46463 ?auto_46475 ) ) ( not ( = ?auto_46477 ?auto_46475 ) ) ( not ( = ?auto_46466 ?auto_46475 ) ) ( IS-CRATE ?auto_46466 ) ( not ( = ?auto_46462 ?auto_46472 ) ) ( not ( = ?auto_46463 ?auto_46472 ) ) ( not ( = ?auto_46477 ?auto_46472 ) ) ( not ( = ?auto_46466 ?auto_46472 ) ) ( not ( = ?auto_46475 ?auto_46472 ) ) ( not ( = ?auto_46467 ?auto_46465 ) ) ( not ( = ?auto_46478 ?auto_46467 ) ) ( not ( = ?auto_46471 ?auto_46467 ) ) ( HOIST-AT ?auto_46464 ?auto_46467 ) ( not ( = ?auto_46468 ?auto_46464 ) ) ( not ( = ?auto_46473 ?auto_46464 ) ) ( not ( = ?auto_46474 ?auto_46464 ) ) ( AVAILABLE ?auto_46464 ) ( SURFACE-AT ?auto_46466 ?auto_46467 ) ( ON ?auto_46466 ?auto_46469 ) ( CLEAR ?auto_46466 ) ( not ( = ?auto_46462 ?auto_46469 ) ) ( not ( = ?auto_46463 ?auto_46469 ) ) ( not ( = ?auto_46477 ?auto_46469 ) ) ( not ( = ?auto_46466 ?auto_46469 ) ) ( not ( = ?auto_46475 ?auto_46469 ) ) ( not ( = ?auto_46472 ?auto_46469 ) ) ( SURFACE-AT ?auto_46470 ?auto_46465 ) ( CLEAR ?auto_46470 ) ( IS-CRATE ?auto_46472 ) ( not ( = ?auto_46462 ?auto_46470 ) ) ( not ( = ?auto_46463 ?auto_46470 ) ) ( not ( = ?auto_46477 ?auto_46470 ) ) ( not ( = ?auto_46466 ?auto_46470 ) ) ( not ( = ?auto_46475 ?auto_46470 ) ) ( not ( = ?auto_46472 ?auto_46470 ) ) ( not ( = ?auto_46469 ?auto_46470 ) ) ( AVAILABLE ?auto_46468 ) ( AVAILABLE ?auto_46473 ) ( SURFACE-AT ?auto_46472 ?auto_46478 ) ( ON ?auto_46472 ?auto_46479 ) ( CLEAR ?auto_46472 ) ( not ( = ?auto_46462 ?auto_46479 ) ) ( not ( = ?auto_46463 ?auto_46479 ) ) ( not ( = ?auto_46477 ?auto_46479 ) ) ( not ( = ?auto_46466 ?auto_46479 ) ) ( not ( = ?auto_46475 ?auto_46479 ) ) ( not ( = ?auto_46472 ?auto_46479 ) ) ( not ( = ?auto_46469 ?auto_46479 ) ) ( not ( = ?auto_46470 ?auto_46479 ) ) ( TRUCK-AT ?auto_46476 ?auto_46465 ) )
    :subtasks
    ( ( !DRIVE ?auto_46476 ?auto_46465 ?auto_46478 )
      ( MAKE-ON ?auto_46462 ?auto_46463 )
      ( MAKE-ON-VERIFY ?auto_46462 ?auto_46463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46482 - SURFACE
      ?auto_46483 - SURFACE
    )
    :vars
    (
      ?auto_46484 - HOIST
      ?auto_46485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46484 ?auto_46485 ) ( SURFACE-AT ?auto_46483 ?auto_46485 ) ( CLEAR ?auto_46483 ) ( LIFTING ?auto_46484 ?auto_46482 ) ( IS-CRATE ?auto_46482 ) ( not ( = ?auto_46482 ?auto_46483 ) ) )
    :subtasks
    ( ( !DROP ?auto_46484 ?auto_46482 ?auto_46483 ?auto_46485 )
      ( MAKE-ON-VERIFY ?auto_46482 ?auto_46483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46486 - SURFACE
      ?auto_46487 - SURFACE
    )
    :vars
    (
      ?auto_46489 - HOIST
      ?auto_46488 - PLACE
      ?auto_46490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46489 ?auto_46488 ) ( SURFACE-AT ?auto_46487 ?auto_46488 ) ( CLEAR ?auto_46487 ) ( IS-CRATE ?auto_46486 ) ( not ( = ?auto_46486 ?auto_46487 ) ) ( TRUCK-AT ?auto_46490 ?auto_46488 ) ( AVAILABLE ?auto_46489 ) ( IN ?auto_46486 ?auto_46490 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46489 ?auto_46486 ?auto_46490 ?auto_46488 )
      ( MAKE-ON ?auto_46486 ?auto_46487 )
      ( MAKE-ON-VERIFY ?auto_46486 ?auto_46487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46491 - SURFACE
      ?auto_46492 - SURFACE
    )
    :vars
    (
      ?auto_46493 - HOIST
      ?auto_46494 - PLACE
      ?auto_46495 - TRUCK
      ?auto_46496 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46493 ?auto_46494 ) ( SURFACE-AT ?auto_46492 ?auto_46494 ) ( CLEAR ?auto_46492 ) ( IS-CRATE ?auto_46491 ) ( not ( = ?auto_46491 ?auto_46492 ) ) ( AVAILABLE ?auto_46493 ) ( IN ?auto_46491 ?auto_46495 ) ( TRUCK-AT ?auto_46495 ?auto_46496 ) ( not ( = ?auto_46496 ?auto_46494 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46495 ?auto_46496 ?auto_46494 )
      ( MAKE-ON ?auto_46491 ?auto_46492 )
      ( MAKE-ON-VERIFY ?auto_46491 ?auto_46492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46497 - SURFACE
      ?auto_46498 - SURFACE
    )
    :vars
    (
      ?auto_46501 - HOIST
      ?auto_46500 - PLACE
      ?auto_46502 - TRUCK
      ?auto_46499 - PLACE
      ?auto_46503 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46501 ?auto_46500 ) ( SURFACE-AT ?auto_46498 ?auto_46500 ) ( CLEAR ?auto_46498 ) ( IS-CRATE ?auto_46497 ) ( not ( = ?auto_46497 ?auto_46498 ) ) ( AVAILABLE ?auto_46501 ) ( TRUCK-AT ?auto_46502 ?auto_46499 ) ( not ( = ?auto_46499 ?auto_46500 ) ) ( HOIST-AT ?auto_46503 ?auto_46499 ) ( LIFTING ?auto_46503 ?auto_46497 ) ( not ( = ?auto_46501 ?auto_46503 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46503 ?auto_46497 ?auto_46502 ?auto_46499 )
      ( MAKE-ON ?auto_46497 ?auto_46498 )
      ( MAKE-ON-VERIFY ?auto_46497 ?auto_46498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46504 - SURFACE
      ?auto_46505 - SURFACE
    )
    :vars
    (
      ?auto_46506 - HOIST
      ?auto_46510 - PLACE
      ?auto_46507 - TRUCK
      ?auto_46509 - PLACE
      ?auto_46508 - HOIST
      ?auto_46511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46506 ?auto_46510 ) ( SURFACE-AT ?auto_46505 ?auto_46510 ) ( CLEAR ?auto_46505 ) ( IS-CRATE ?auto_46504 ) ( not ( = ?auto_46504 ?auto_46505 ) ) ( AVAILABLE ?auto_46506 ) ( TRUCK-AT ?auto_46507 ?auto_46509 ) ( not ( = ?auto_46509 ?auto_46510 ) ) ( HOIST-AT ?auto_46508 ?auto_46509 ) ( not ( = ?auto_46506 ?auto_46508 ) ) ( AVAILABLE ?auto_46508 ) ( SURFACE-AT ?auto_46504 ?auto_46509 ) ( ON ?auto_46504 ?auto_46511 ) ( CLEAR ?auto_46504 ) ( not ( = ?auto_46504 ?auto_46511 ) ) ( not ( = ?auto_46505 ?auto_46511 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46508 ?auto_46504 ?auto_46511 ?auto_46509 )
      ( MAKE-ON ?auto_46504 ?auto_46505 )
      ( MAKE-ON-VERIFY ?auto_46504 ?auto_46505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46512 - SURFACE
      ?auto_46513 - SURFACE
    )
    :vars
    (
      ?auto_46514 - HOIST
      ?auto_46518 - PLACE
      ?auto_46519 - PLACE
      ?auto_46515 - HOIST
      ?auto_46517 - SURFACE
      ?auto_46516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46514 ?auto_46518 ) ( SURFACE-AT ?auto_46513 ?auto_46518 ) ( CLEAR ?auto_46513 ) ( IS-CRATE ?auto_46512 ) ( not ( = ?auto_46512 ?auto_46513 ) ) ( AVAILABLE ?auto_46514 ) ( not ( = ?auto_46519 ?auto_46518 ) ) ( HOIST-AT ?auto_46515 ?auto_46519 ) ( not ( = ?auto_46514 ?auto_46515 ) ) ( AVAILABLE ?auto_46515 ) ( SURFACE-AT ?auto_46512 ?auto_46519 ) ( ON ?auto_46512 ?auto_46517 ) ( CLEAR ?auto_46512 ) ( not ( = ?auto_46512 ?auto_46517 ) ) ( not ( = ?auto_46513 ?auto_46517 ) ) ( TRUCK-AT ?auto_46516 ?auto_46518 ) )
    :subtasks
    ( ( !DRIVE ?auto_46516 ?auto_46518 ?auto_46519 )
      ( MAKE-ON ?auto_46512 ?auto_46513 )
      ( MAKE-ON-VERIFY ?auto_46512 ?auto_46513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46520 - SURFACE
      ?auto_46521 - SURFACE
    )
    :vars
    (
      ?auto_46522 - HOIST
      ?auto_46527 - PLACE
      ?auto_46525 - PLACE
      ?auto_46526 - HOIST
      ?auto_46524 - SURFACE
      ?auto_46523 - TRUCK
      ?auto_46528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46522 ?auto_46527 ) ( IS-CRATE ?auto_46520 ) ( not ( = ?auto_46520 ?auto_46521 ) ) ( not ( = ?auto_46525 ?auto_46527 ) ) ( HOIST-AT ?auto_46526 ?auto_46525 ) ( not ( = ?auto_46522 ?auto_46526 ) ) ( AVAILABLE ?auto_46526 ) ( SURFACE-AT ?auto_46520 ?auto_46525 ) ( ON ?auto_46520 ?auto_46524 ) ( CLEAR ?auto_46520 ) ( not ( = ?auto_46520 ?auto_46524 ) ) ( not ( = ?auto_46521 ?auto_46524 ) ) ( TRUCK-AT ?auto_46523 ?auto_46527 ) ( SURFACE-AT ?auto_46528 ?auto_46527 ) ( CLEAR ?auto_46528 ) ( LIFTING ?auto_46522 ?auto_46521 ) ( IS-CRATE ?auto_46521 ) ( not ( = ?auto_46520 ?auto_46528 ) ) ( not ( = ?auto_46521 ?auto_46528 ) ) ( not ( = ?auto_46524 ?auto_46528 ) ) )
    :subtasks
    ( ( !DROP ?auto_46522 ?auto_46521 ?auto_46528 ?auto_46527 )
      ( MAKE-ON ?auto_46520 ?auto_46521 )
      ( MAKE-ON-VERIFY ?auto_46520 ?auto_46521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46529 - SURFACE
      ?auto_46530 - SURFACE
    )
    :vars
    (
      ?auto_46535 - HOIST
      ?auto_46531 - PLACE
      ?auto_46534 - PLACE
      ?auto_46536 - HOIST
      ?auto_46533 - SURFACE
      ?auto_46532 - TRUCK
      ?auto_46537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46535 ?auto_46531 ) ( IS-CRATE ?auto_46529 ) ( not ( = ?auto_46529 ?auto_46530 ) ) ( not ( = ?auto_46534 ?auto_46531 ) ) ( HOIST-AT ?auto_46536 ?auto_46534 ) ( not ( = ?auto_46535 ?auto_46536 ) ) ( AVAILABLE ?auto_46536 ) ( SURFACE-AT ?auto_46529 ?auto_46534 ) ( ON ?auto_46529 ?auto_46533 ) ( CLEAR ?auto_46529 ) ( not ( = ?auto_46529 ?auto_46533 ) ) ( not ( = ?auto_46530 ?auto_46533 ) ) ( TRUCK-AT ?auto_46532 ?auto_46531 ) ( SURFACE-AT ?auto_46537 ?auto_46531 ) ( CLEAR ?auto_46537 ) ( IS-CRATE ?auto_46530 ) ( not ( = ?auto_46529 ?auto_46537 ) ) ( not ( = ?auto_46530 ?auto_46537 ) ) ( not ( = ?auto_46533 ?auto_46537 ) ) ( AVAILABLE ?auto_46535 ) ( IN ?auto_46530 ?auto_46532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46535 ?auto_46530 ?auto_46532 ?auto_46531 )
      ( MAKE-ON ?auto_46529 ?auto_46530 )
      ( MAKE-ON-VERIFY ?auto_46529 ?auto_46530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46538 - SURFACE
      ?auto_46539 - SURFACE
    )
    :vars
    (
      ?auto_46543 - HOIST
      ?auto_46540 - PLACE
      ?auto_46544 - PLACE
      ?auto_46545 - HOIST
      ?auto_46542 - SURFACE
      ?auto_46541 - SURFACE
      ?auto_46546 - TRUCK
      ?auto_46547 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46543 ?auto_46540 ) ( IS-CRATE ?auto_46538 ) ( not ( = ?auto_46538 ?auto_46539 ) ) ( not ( = ?auto_46544 ?auto_46540 ) ) ( HOIST-AT ?auto_46545 ?auto_46544 ) ( not ( = ?auto_46543 ?auto_46545 ) ) ( AVAILABLE ?auto_46545 ) ( SURFACE-AT ?auto_46538 ?auto_46544 ) ( ON ?auto_46538 ?auto_46542 ) ( CLEAR ?auto_46538 ) ( not ( = ?auto_46538 ?auto_46542 ) ) ( not ( = ?auto_46539 ?auto_46542 ) ) ( SURFACE-AT ?auto_46541 ?auto_46540 ) ( CLEAR ?auto_46541 ) ( IS-CRATE ?auto_46539 ) ( not ( = ?auto_46538 ?auto_46541 ) ) ( not ( = ?auto_46539 ?auto_46541 ) ) ( not ( = ?auto_46542 ?auto_46541 ) ) ( AVAILABLE ?auto_46543 ) ( IN ?auto_46539 ?auto_46546 ) ( TRUCK-AT ?auto_46546 ?auto_46547 ) ( not ( = ?auto_46547 ?auto_46540 ) ) ( not ( = ?auto_46544 ?auto_46547 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46546 ?auto_46547 ?auto_46540 )
      ( MAKE-ON ?auto_46538 ?auto_46539 )
      ( MAKE-ON-VERIFY ?auto_46538 ?auto_46539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46548 - SURFACE
      ?auto_46549 - SURFACE
    )
    :vars
    (
      ?auto_46552 - HOIST
      ?auto_46554 - PLACE
      ?auto_46551 - PLACE
      ?auto_46556 - HOIST
      ?auto_46553 - SURFACE
      ?auto_46550 - SURFACE
      ?auto_46555 - TRUCK
      ?auto_46557 - PLACE
      ?auto_46558 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46552 ?auto_46554 ) ( IS-CRATE ?auto_46548 ) ( not ( = ?auto_46548 ?auto_46549 ) ) ( not ( = ?auto_46551 ?auto_46554 ) ) ( HOIST-AT ?auto_46556 ?auto_46551 ) ( not ( = ?auto_46552 ?auto_46556 ) ) ( AVAILABLE ?auto_46556 ) ( SURFACE-AT ?auto_46548 ?auto_46551 ) ( ON ?auto_46548 ?auto_46553 ) ( CLEAR ?auto_46548 ) ( not ( = ?auto_46548 ?auto_46553 ) ) ( not ( = ?auto_46549 ?auto_46553 ) ) ( SURFACE-AT ?auto_46550 ?auto_46554 ) ( CLEAR ?auto_46550 ) ( IS-CRATE ?auto_46549 ) ( not ( = ?auto_46548 ?auto_46550 ) ) ( not ( = ?auto_46549 ?auto_46550 ) ) ( not ( = ?auto_46553 ?auto_46550 ) ) ( AVAILABLE ?auto_46552 ) ( TRUCK-AT ?auto_46555 ?auto_46557 ) ( not ( = ?auto_46557 ?auto_46554 ) ) ( not ( = ?auto_46551 ?auto_46557 ) ) ( HOIST-AT ?auto_46558 ?auto_46557 ) ( LIFTING ?auto_46558 ?auto_46549 ) ( not ( = ?auto_46552 ?auto_46558 ) ) ( not ( = ?auto_46556 ?auto_46558 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46558 ?auto_46549 ?auto_46555 ?auto_46557 )
      ( MAKE-ON ?auto_46548 ?auto_46549 )
      ( MAKE-ON-VERIFY ?auto_46548 ?auto_46549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46559 - SURFACE
      ?auto_46560 - SURFACE
    )
    :vars
    (
      ?auto_46561 - HOIST
      ?auto_46563 - PLACE
      ?auto_46566 - PLACE
      ?auto_46569 - HOIST
      ?auto_46565 - SURFACE
      ?auto_46568 - SURFACE
      ?auto_46567 - TRUCK
      ?auto_46564 - PLACE
      ?auto_46562 - HOIST
      ?auto_46570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46561 ?auto_46563 ) ( IS-CRATE ?auto_46559 ) ( not ( = ?auto_46559 ?auto_46560 ) ) ( not ( = ?auto_46566 ?auto_46563 ) ) ( HOIST-AT ?auto_46569 ?auto_46566 ) ( not ( = ?auto_46561 ?auto_46569 ) ) ( AVAILABLE ?auto_46569 ) ( SURFACE-AT ?auto_46559 ?auto_46566 ) ( ON ?auto_46559 ?auto_46565 ) ( CLEAR ?auto_46559 ) ( not ( = ?auto_46559 ?auto_46565 ) ) ( not ( = ?auto_46560 ?auto_46565 ) ) ( SURFACE-AT ?auto_46568 ?auto_46563 ) ( CLEAR ?auto_46568 ) ( IS-CRATE ?auto_46560 ) ( not ( = ?auto_46559 ?auto_46568 ) ) ( not ( = ?auto_46560 ?auto_46568 ) ) ( not ( = ?auto_46565 ?auto_46568 ) ) ( AVAILABLE ?auto_46561 ) ( TRUCK-AT ?auto_46567 ?auto_46564 ) ( not ( = ?auto_46564 ?auto_46563 ) ) ( not ( = ?auto_46566 ?auto_46564 ) ) ( HOIST-AT ?auto_46562 ?auto_46564 ) ( not ( = ?auto_46561 ?auto_46562 ) ) ( not ( = ?auto_46569 ?auto_46562 ) ) ( AVAILABLE ?auto_46562 ) ( SURFACE-AT ?auto_46560 ?auto_46564 ) ( ON ?auto_46560 ?auto_46570 ) ( CLEAR ?auto_46560 ) ( not ( = ?auto_46559 ?auto_46570 ) ) ( not ( = ?auto_46560 ?auto_46570 ) ) ( not ( = ?auto_46565 ?auto_46570 ) ) ( not ( = ?auto_46568 ?auto_46570 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46562 ?auto_46560 ?auto_46570 ?auto_46564 )
      ( MAKE-ON ?auto_46559 ?auto_46560 )
      ( MAKE-ON-VERIFY ?auto_46559 ?auto_46560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46571 - SURFACE
      ?auto_46572 - SURFACE
    )
    :vars
    (
      ?auto_46581 - HOIST
      ?auto_46578 - PLACE
      ?auto_46575 - PLACE
      ?auto_46576 - HOIST
      ?auto_46582 - SURFACE
      ?auto_46574 - SURFACE
      ?auto_46573 - PLACE
      ?auto_46579 - HOIST
      ?auto_46577 - SURFACE
      ?auto_46580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46581 ?auto_46578 ) ( IS-CRATE ?auto_46571 ) ( not ( = ?auto_46571 ?auto_46572 ) ) ( not ( = ?auto_46575 ?auto_46578 ) ) ( HOIST-AT ?auto_46576 ?auto_46575 ) ( not ( = ?auto_46581 ?auto_46576 ) ) ( AVAILABLE ?auto_46576 ) ( SURFACE-AT ?auto_46571 ?auto_46575 ) ( ON ?auto_46571 ?auto_46582 ) ( CLEAR ?auto_46571 ) ( not ( = ?auto_46571 ?auto_46582 ) ) ( not ( = ?auto_46572 ?auto_46582 ) ) ( SURFACE-AT ?auto_46574 ?auto_46578 ) ( CLEAR ?auto_46574 ) ( IS-CRATE ?auto_46572 ) ( not ( = ?auto_46571 ?auto_46574 ) ) ( not ( = ?auto_46572 ?auto_46574 ) ) ( not ( = ?auto_46582 ?auto_46574 ) ) ( AVAILABLE ?auto_46581 ) ( not ( = ?auto_46573 ?auto_46578 ) ) ( not ( = ?auto_46575 ?auto_46573 ) ) ( HOIST-AT ?auto_46579 ?auto_46573 ) ( not ( = ?auto_46581 ?auto_46579 ) ) ( not ( = ?auto_46576 ?auto_46579 ) ) ( AVAILABLE ?auto_46579 ) ( SURFACE-AT ?auto_46572 ?auto_46573 ) ( ON ?auto_46572 ?auto_46577 ) ( CLEAR ?auto_46572 ) ( not ( = ?auto_46571 ?auto_46577 ) ) ( not ( = ?auto_46572 ?auto_46577 ) ) ( not ( = ?auto_46582 ?auto_46577 ) ) ( not ( = ?auto_46574 ?auto_46577 ) ) ( TRUCK-AT ?auto_46580 ?auto_46578 ) )
    :subtasks
    ( ( !DRIVE ?auto_46580 ?auto_46578 ?auto_46573 )
      ( MAKE-ON ?auto_46571 ?auto_46572 )
      ( MAKE-ON-VERIFY ?auto_46571 ?auto_46572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46583 - SURFACE
      ?auto_46584 - SURFACE
    )
    :vars
    (
      ?auto_46587 - HOIST
      ?auto_46589 - PLACE
      ?auto_46592 - PLACE
      ?auto_46586 - HOIST
      ?auto_46591 - SURFACE
      ?auto_46590 - SURFACE
      ?auto_46588 - PLACE
      ?auto_46593 - HOIST
      ?auto_46585 - SURFACE
      ?auto_46594 - TRUCK
      ?auto_46595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46587 ?auto_46589 ) ( IS-CRATE ?auto_46583 ) ( not ( = ?auto_46583 ?auto_46584 ) ) ( not ( = ?auto_46592 ?auto_46589 ) ) ( HOIST-AT ?auto_46586 ?auto_46592 ) ( not ( = ?auto_46587 ?auto_46586 ) ) ( AVAILABLE ?auto_46586 ) ( SURFACE-AT ?auto_46583 ?auto_46592 ) ( ON ?auto_46583 ?auto_46591 ) ( CLEAR ?auto_46583 ) ( not ( = ?auto_46583 ?auto_46591 ) ) ( not ( = ?auto_46584 ?auto_46591 ) ) ( IS-CRATE ?auto_46584 ) ( not ( = ?auto_46583 ?auto_46590 ) ) ( not ( = ?auto_46584 ?auto_46590 ) ) ( not ( = ?auto_46591 ?auto_46590 ) ) ( not ( = ?auto_46588 ?auto_46589 ) ) ( not ( = ?auto_46592 ?auto_46588 ) ) ( HOIST-AT ?auto_46593 ?auto_46588 ) ( not ( = ?auto_46587 ?auto_46593 ) ) ( not ( = ?auto_46586 ?auto_46593 ) ) ( AVAILABLE ?auto_46593 ) ( SURFACE-AT ?auto_46584 ?auto_46588 ) ( ON ?auto_46584 ?auto_46585 ) ( CLEAR ?auto_46584 ) ( not ( = ?auto_46583 ?auto_46585 ) ) ( not ( = ?auto_46584 ?auto_46585 ) ) ( not ( = ?auto_46591 ?auto_46585 ) ) ( not ( = ?auto_46590 ?auto_46585 ) ) ( TRUCK-AT ?auto_46594 ?auto_46589 ) ( SURFACE-AT ?auto_46595 ?auto_46589 ) ( CLEAR ?auto_46595 ) ( LIFTING ?auto_46587 ?auto_46590 ) ( IS-CRATE ?auto_46590 ) ( not ( = ?auto_46583 ?auto_46595 ) ) ( not ( = ?auto_46584 ?auto_46595 ) ) ( not ( = ?auto_46591 ?auto_46595 ) ) ( not ( = ?auto_46590 ?auto_46595 ) ) ( not ( = ?auto_46585 ?auto_46595 ) ) )
    :subtasks
    ( ( !DROP ?auto_46587 ?auto_46590 ?auto_46595 ?auto_46589 )
      ( MAKE-ON ?auto_46583 ?auto_46584 )
      ( MAKE-ON-VERIFY ?auto_46583 ?auto_46584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46596 - SURFACE
      ?auto_46597 - SURFACE
    )
    :vars
    (
      ?auto_46600 - HOIST
      ?auto_46607 - PLACE
      ?auto_46604 - PLACE
      ?auto_46603 - HOIST
      ?auto_46602 - SURFACE
      ?auto_46605 - SURFACE
      ?auto_46606 - PLACE
      ?auto_46599 - HOIST
      ?auto_46598 - SURFACE
      ?auto_46601 - TRUCK
      ?auto_46608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46600 ?auto_46607 ) ( IS-CRATE ?auto_46596 ) ( not ( = ?auto_46596 ?auto_46597 ) ) ( not ( = ?auto_46604 ?auto_46607 ) ) ( HOIST-AT ?auto_46603 ?auto_46604 ) ( not ( = ?auto_46600 ?auto_46603 ) ) ( AVAILABLE ?auto_46603 ) ( SURFACE-AT ?auto_46596 ?auto_46604 ) ( ON ?auto_46596 ?auto_46602 ) ( CLEAR ?auto_46596 ) ( not ( = ?auto_46596 ?auto_46602 ) ) ( not ( = ?auto_46597 ?auto_46602 ) ) ( IS-CRATE ?auto_46597 ) ( not ( = ?auto_46596 ?auto_46605 ) ) ( not ( = ?auto_46597 ?auto_46605 ) ) ( not ( = ?auto_46602 ?auto_46605 ) ) ( not ( = ?auto_46606 ?auto_46607 ) ) ( not ( = ?auto_46604 ?auto_46606 ) ) ( HOIST-AT ?auto_46599 ?auto_46606 ) ( not ( = ?auto_46600 ?auto_46599 ) ) ( not ( = ?auto_46603 ?auto_46599 ) ) ( AVAILABLE ?auto_46599 ) ( SURFACE-AT ?auto_46597 ?auto_46606 ) ( ON ?auto_46597 ?auto_46598 ) ( CLEAR ?auto_46597 ) ( not ( = ?auto_46596 ?auto_46598 ) ) ( not ( = ?auto_46597 ?auto_46598 ) ) ( not ( = ?auto_46602 ?auto_46598 ) ) ( not ( = ?auto_46605 ?auto_46598 ) ) ( TRUCK-AT ?auto_46601 ?auto_46607 ) ( SURFACE-AT ?auto_46608 ?auto_46607 ) ( CLEAR ?auto_46608 ) ( IS-CRATE ?auto_46605 ) ( not ( = ?auto_46596 ?auto_46608 ) ) ( not ( = ?auto_46597 ?auto_46608 ) ) ( not ( = ?auto_46602 ?auto_46608 ) ) ( not ( = ?auto_46605 ?auto_46608 ) ) ( not ( = ?auto_46598 ?auto_46608 ) ) ( AVAILABLE ?auto_46600 ) ( IN ?auto_46605 ?auto_46601 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46600 ?auto_46605 ?auto_46601 ?auto_46607 )
      ( MAKE-ON ?auto_46596 ?auto_46597 )
      ( MAKE-ON-VERIFY ?auto_46596 ?auto_46597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46609 - SURFACE
      ?auto_46610 - SURFACE
    )
    :vars
    (
      ?auto_46615 - HOIST
      ?auto_46616 - PLACE
      ?auto_46617 - PLACE
      ?auto_46613 - HOIST
      ?auto_46621 - SURFACE
      ?auto_46619 - SURFACE
      ?auto_46612 - PLACE
      ?auto_46611 - HOIST
      ?auto_46620 - SURFACE
      ?auto_46614 - SURFACE
      ?auto_46618 - TRUCK
      ?auto_46622 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46615 ?auto_46616 ) ( IS-CRATE ?auto_46609 ) ( not ( = ?auto_46609 ?auto_46610 ) ) ( not ( = ?auto_46617 ?auto_46616 ) ) ( HOIST-AT ?auto_46613 ?auto_46617 ) ( not ( = ?auto_46615 ?auto_46613 ) ) ( AVAILABLE ?auto_46613 ) ( SURFACE-AT ?auto_46609 ?auto_46617 ) ( ON ?auto_46609 ?auto_46621 ) ( CLEAR ?auto_46609 ) ( not ( = ?auto_46609 ?auto_46621 ) ) ( not ( = ?auto_46610 ?auto_46621 ) ) ( IS-CRATE ?auto_46610 ) ( not ( = ?auto_46609 ?auto_46619 ) ) ( not ( = ?auto_46610 ?auto_46619 ) ) ( not ( = ?auto_46621 ?auto_46619 ) ) ( not ( = ?auto_46612 ?auto_46616 ) ) ( not ( = ?auto_46617 ?auto_46612 ) ) ( HOIST-AT ?auto_46611 ?auto_46612 ) ( not ( = ?auto_46615 ?auto_46611 ) ) ( not ( = ?auto_46613 ?auto_46611 ) ) ( AVAILABLE ?auto_46611 ) ( SURFACE-AT ?auto_46610 ?auto_46612 ) ( ON ?auto_46610 ?auto_46620 ) ( CLEAR ?auto_46610 ) ( not ( = ?auto_46609 ?auto_46620 ) ) ( not ( = ?auto_46610 ?auto_46620 ) ) ( not ( = ?auto_46621 ?auto_46620 ) ) ( not ( = ?auto_46619 ?auto_46620 ) ) ( SURFACE-AT ?auto_46614 ?auto_46616 ) ( CLEAR ?auto_46614 ) ( IS-CRATE ?auto_46619 ) ( not ( = ?auto_46609 ?auto_46614 ) ) ( not ( = ?auto_46610 ?auto_46614 ) ) ( not ( = ?auto_46621 ?auto_46614 ) ) ( not ( = ?auto_46619 ?auto_46614 ) ) ( not ( = ?auto_46620 ?auto_46614 ) ) ( AVAILABLE ?auto_46615 ) ( IN ?auto_46619 ?auto_46618 ) ( TRUCK-AT ?auto_46618 ?auto_46622 ) ( not ( = ?auto_46622 ?auto_46616 ) ) ( not ( = ?auto_46617 ?auto_46622 ) ) ( not ( = ?auto_46612 ?auto_46622 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46618 ?auto_46622 ?auto_46616 )
      ( MAKE-ON ?auto_46609 ?auto_46610 )
      ( MAKE-ON-VERIFY ?auto_46609 ?auto_46610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46623 - SURFACE
      ?auto_46624 - SURFACE
    )
    :vars
    (
      ?auto_46627 - HOIST
      ?auto_46631 - PLACE
      ?auto_46630 - PLACE
      ?auto_46629 - HOIST
      ?auto_46632 - SURFACE
      ?auto_46635 - SURFACE
      ?auto_46626 - PLACE
      ?auto_46628 - HOIST
      ?auto_46634 - SURFACE
      ?auto_46633 - SURFACE
      ?auto_46636 - TRUCK
      ?auto_46625 - PLACE
      ?auto_46637 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46627 ?auto_46631 ) ( IS-CRATE ?auto_46623 ) ( not ( = ?auto_46623 ?auto_46624 ) ) ( not ( = ?auto_46630 ?auto_46631 ) ) ( HOIST-AT ?auto_46629 ?auto_46630 ) ( not ( = ?auto_46627 ?auto_46629 ) ) ( AVAILABLE ?auto_46629 ) ( SURFACE-AT ?auto_46623 ?auto_46630 ) ( ON ?auto_46623 ?auto_46632 ) ( CLEAR ?auto_46623 ) ( not ( = ?auto_46623 ?auto_46632 ) ) ( not ( = ?auto_46624 ?auto_46632 ) ) ( IS-CRATE ?auto_46624 ) ( not ( = ?auto_46623 ?auto_46635 ) ) ( not ( = ?auto_46624 ?auto_46635 ) ) ( not ( = ?auto_46632 ?auto_46635 ) ) ( not ( = ?auto_46626 ?auto_46631 ) ) ( not ( = ?auto_46630 ?auto_46626 ) ) ( HOIST-AT ?auto_46628 ?auto_46626 ) ( not ( = ?auto_46627 ?auto_46628 ) ) ( not ( = ?auto_46629 ?auto_46628 ) ) ( AVAILABLE ?auto_46628 ) ( SURFACE-AT ?auto_46624 ?auto_46626 ) ( ON ?auto_46624 ?auto_46634 ) ( CLEAR ?auto_46624 ) ( not ( = ?auto_46623 ?auto_46634 ) ) ( not ( = ?auto_46624 ?auto_46634 ) ) ( not ( = ?auto_46632 ?auto_46634 ) ) ( not ( = ?auto_46635 ?auto_46634 ) ) ( SURFACE-AT ?auto_46633 ?auto_46631 ) ( CLEAR ?auto_46633 ) ( IS-CRATE ?auto_46635 ) ( not ( = ?auto_46623 ?auto_46633 ) ) ( not ( = ?auto_46624 ?auto_46633 ) ) ( not ( = ?auto_46632 ?auto_46633 ) ) ( not ( = ?auto_46635 ?auto_46633 ) ) ( not ( = ?auto_46634 ?auto_46633 ) ) ( AVAILABLE ?auto_46627 ) ( TRUCK-AT ?auto_46636 ?auto_46625 ) ( not ( = ?auto_46625 ?auto_46631 ) ) ( not ( = ?auto_46630 ?auto_46625 ) ) ( not ( = ?auto_46626 ?auto_46625 ) ) ( HOIST-AT ?auto_46637 ?auto_46625 ) ( LIFTING ?auto_46637 ?auto_46635 ) ( not ( = ?auto_46627 ?auto_46637 ) ) ( not ( = ?auto_46629 ?auto_46637 ) ) ( not ( = ?auto_46628 ?auto_46637 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46637 ?auto_46635 ?auto_46636 ?auto_46625 )
      ( MAKE-ON ?auto_46623 ?auto_46624 )
      ( MAKE-ON-VERIFY ?auto_46623 ?auto_46624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46638 - SURFACE
      ?auto_46639 - SURFACE
    )
    :vars
    (
      ?auto_46650 - HOIST
      ?auto_46651 - PLACE
      ?auto_46648 - PLACE
      ?auto_46649 - HOIST
      ?auto_46647 - SURFACE
      ?auto_46646 - SURFACE
      ?auto_46645 - PLACE
      ?auto_46644 - HOIST
      ?auto_46641 - SURFACE
      ?auto_46642 - SURFACE
      ?auto_46652 - TRUCK
      ?auto_46643 - PLACE
      ?auto_46640 - HOIST
      ?auto_46653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46650 ?auto_46651 ) ( IS-CRATE ?auto_46638 ) ( not ( = ?auto_46638 ?auto_46639 ) ) ( not ( = ?auto_46648 ?auto_46651 ) ) ( HOIST-AT ?auto_46649 ?auto_46648 ) ( not ( = ?auto_46650 ?auto_46649 ) ) ( AVAILABLE ?auto_46649 ) ( SURFACE-AT ?auto_46638 ?auto_46648 ) ( ON ?auto_46638 ?auto_46647 ) ( CLEAR ?auto_46638 ) ( not ( = ?auto_46638 ?auto_46647 ) ) ( not ( = ?auto_46639 ?auto_46647 ) ) ( IS-CRATE ?auto_46639 ) ( not ( = ?auto_46638 ?auto_46646 ) ) ( not ( = ?auto_46639 ?auto_46646 ) ) ( not ( = ?auto_46647 ?auto_46646 ) ) ( not ( = ?auto_46645 ?auto_46651 ) ) ( not ( = ?auto_46648 ?auto_46645 ) ) ( HOIST-AT ?auto_46644 ?auto_46645 ) ( not ( = ?auto_46650 ?auto_46644 ) ) ( not ( = ?auto_46649 ?auto_46644 ) ) ( AVAILABLE ?auto_46644 ) ( SURFACE-AT ?auto_46639 ?auto_46645 ) ( ON ?auto_46639 ?auto_46641 ) ( CLEAR ?auto_46639 ) ( not ( = ?auto_46638 ?auto_46641 ) ) ( not ( = ?auto_46639 ?auto_46641 ) ) ( not ( = ?auto_46647 ?auto_46641 ) ) ( not ( = ?auto_46646 ?auto_46641 ) ) ( SURFACE-AT ?auto_46642 ?auto_46651 ) ( CLEAR ?auto_46642 ) ( IS-CRATE ?auto_46646 ) ( not ( = ?auto_46638 ?auto_46642 ) ) ( not ( = ?auto_46639 ?auto_46642 ) ) ( not ( = ?auto_46647 ?auto_46642 ) ) ( not ( = ?auto_46646 ?auto_46642 ) ) ( not ( = ?auto_46641 ?auto_46642 ) ) ( AVAILABLE ?auto_46650 ) ( TRUCK-AT ?auto_46652 ?auto_46643 ) ( not ( = ?auto_46643 ?auto_46651 ) ) ( not ( = ?auto_46648 ?auto_46643 ) ) ( not ( = ?auto_46645 ?auto_46643 ) ) ( HOIST-AT ?auto_46640 ?auto_46643 ) ( not ( = ?auto_46650 ?auto_46640 ) ) ( not ( = ?auto_46649 ?auto_46640 ) ) ( not ( = ?auto_46644 ?auto_46640 ) ) ( AVAILABLE ?auto_46640 ) ( SURFACE-AT ?auto_46646 ?auto_46643 ) ( ON ?auto_46646 ?auto_46653 ) ( CLEAR ?auto_46646 ) ( not ( = ?auto_46638 ?auto_46653 ) ) ( not ( = ?auto_46639 ?auto_46653 ) ) ( not ( = ?auto_46647 ?auto_46653 ) ) ( not ( = ?auto_46646 ?auto_46653 ) ) ( not ( = ?auto_46641 ?auto_46653 ) ) ( not ( = ?auto_46642 ?auto_46653 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46640 ?auto_46646 ?auto_46653 ?auto_46643 )
      ( MAKE-ON ?auto_46638 ?auto_46639 )
      ( MAKE-ON-VERIFY ?auto_46638 ?auto_46639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46654 - SURFACE
      ?auto_46655 - SURFACE
    )
    :vars
    (
      ?auto_46661 - HOIST
      ?auto_46664 - PLACE
      ?auto_46665 - PLACE
      ?auto_46658 - HOIST
      ?auto_46668 - SURFACE
      ?auto_46669 - SURFACE
      ?auto_46660 - PLACE
      ?auto_46662 - HOIST
      ?auto_46667 - SURFACE
      ?auto_46657 - SURFACE
      ?auto_46663 - PLACE
      ?auto_46666 - HOIST
      ?auto_46656 - SURFACE
      ?auto_46659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46661 ?auto_46664 ) ( IS-CRATE ?auto_46654 ) ( not ( = ?auto_46654 ?auto_46655 ) ) ( not ( = ?auto_46665 ?auto_46664 ) ) ( HOIST-AT ?auto_46658 ?auto_46665 ) ( not ( = ?auto_46661 ?auto_46658 ) ) ( AVAILABLE ?auto_46658 ) ( SURFACE-AT ?auto_46654 ?auto_46665 ) ( ON ?auto_46654 ?auto_46668 ) ( CLEAR ?auto_46654 ) ( not ( = ?auto_46654 ?auto_46668 ) ) ( not ( = ?auto_46655 ?auto_46668 ) ) ( IS-CRATE ?auto_46655 ) ( not ( = ?auto_46654 ?auto_46669 ) ) ( not ( = ?auto_46655 ?auto_46669 ) ) ( not ( = ?auto_46668 ?auto_46669 ) ) ( not ( = ?auto_46660 ?auto_46664 ) ) ( not ( = ?auto_46665 ?auto_46660 ) ) ( HOIST-AT ?auto_46662 ?auto_46660 ) ( not ( = ?auto_46661 ?auto_46662 ) ) ( not ( = ?auto_46658 ?auto_46662 ) ) ( AVAILABLE ?auto_46662 ) ( SURFACE-AT ?auto_46655 ?auto_46660 ) ( ON ?auto_46655 ?auto_46667 ) ( CLEAR ?auto_46655 ) ( not ( = ?auto_46654 ?auto_46667 ) ) ( not ( = ?auto_46655 ?auto_46667 ) ) ( not ( = ?auto_46668 ?auto_46667 ) ) ( not ( = ?auto_46669 ?auto_46667 ) ) ( SURFACE-AT ?auto_46657 ?auto_46664 ) ( CLEAR ?auto_46657 ) ( IS-CRATE ?auto_46669 ) ( not ( = ?auto_46654 ?auto_46657 ) ) ( not ( = ?auto_46655 ?auto_46657 ) ) ( not ( = ?auto_46668 ?auto_46657 ) ) ( not ( = ?auto_46669 ?auto_46657 ) ) ( not ( = ?auto_46667 ?auto_46657 ) ) ( AVAILABLE ?auto_46661 ) ( not ( = ?auto_46663 ?auto_46664 ) ) ( not ( = ?auto_46665 ?auto_46663 ) ) ( not ( = ?auto_46660 ?auto_46663 ) ) ( HOIST-AT ?auto_46666 ?auto_46663 ) ( not ( = ?auto_46661 ?auto_46666 ) ) ( not ( = ?auto_46658 ?auto_46666 ) ) ( not ( = ?auto_46662 ?auto_46666 ) ) ( AVAILABLE ?auto_46666 ) ( SURFACE-AT ?auto_46669 ?auto_46663 ) ( ON ?auto_46669 ?auto_46656 ) ( CLEAR ?auto_46669 ) ( not ( = ?auto_46654 ?auto_46656 ) ) ( not ( = ?auto_46655 ?auto_46656 ) ) ( not ( = ?auto_46668 ?auto_46656 ) ) ( not ( = ?auto_46669 ?auto_46656 ) ) ( not ( = ?auto_46667 ?auto_46656 ) ) ( not ( = ?auto_46657 ?auto_46656 ) ) ( TRUCK-AT ?auto_46659 ?auto_46664 ) )
    :subtasks
    ( ( !DRIVE ?auto_46659 ?auto_46664 ?auto_46663 )
      ( MAKE-ON ?auto_46654 ?auto_46655 )
      ( MAKE-ON-VERIFY ?auto_46654 ?auto_46655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46670 - SURFACE
      ?auto_46671 - SURFACE
    )
    :vars
    (
      ?auto_46675 - HOIST
      ?auto_46683 - PLACE
      ?auto_46676 - PLACE
      ?auto_46680 - HOIST
      ?auto_46674 - SURFACE
      ?auto_46678 - SURFACE
      ?auto_46677 - PLACE
      ?auto_46672 - HOIST
      ?auto_46679 - SURFACE
      ?auto_46673 - SURFACE
      ?auto_46682 - PLACE
      ?auto_46681 - HOIST
      ?auto_46684 - SURFACE
      ?auto_46685 - TRUCK
      ?auto_46686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46675 ?auto_46683 ) ( IS-CRATE ?auto_46670 ) ( not ( = ?auto_46670 ?auto_46671 ) ) ( not ( = ?auto_46676 ?auto_46683 ) ) ( HOIST-AT ?auto_46680 ?auto_46676 ) ( not ( = ?auto_46675 ?auto_46680 ) ) ( AVAILABLE ?auto_46680 ) ( SURFACE-AT ?auto_46670 ?auto_46676 ) ( ON ?auto_46670 ?auto_46674 ) ( CLEAR ?auto_46670 ) ( not ( = ?auto_46670 ?auto_46674 ) ) ( not ( = ?auto_46671 ?auto_46674 ) ) ( IS-CRATE ?auto_46671 ) ( not ( = ?auto_46670 ?auto_46678 ) ) ( not ( = ?auto_46671 ?auto_46678 ) ) ( not ( = ?auto_46674 ?auto_46678 ) ) ( not ( = ?auto_46677 ?auto_46683 ) ) ( not ( = ?auto_46676 ?auto_46677 ) ) ( HOIST-AT ?auto_46672 ?auto_46677 ) ( not ( = ?auto_46675 ?auto_46672 ) ) ( not ( = ?auto_46680 ?auto_46672 ) ) ( AVAILABLE ?auto_46672 ) ( SURFACE-AT ?auto_46671 ?auto_46677 ) ( ON ?auto_46671 ?auto_46679 ) ( CLEAR ?auto_46671 ) ( not ( = ?auto_46670 ?auto_46679 ) ) ( not ( = ?auto_46671 ?auto_46679 ) ) ( not ( = ?auto_46674 ?auto_46679 ) ) ( not ( = ?auto_46678 ?auto_46679 ) ) ( IS-CRATE ?auto_46678 ) ( not ( = ?auto_46670 ?auto_46673 ) ) ( not ( = ?auto_46671 ?auto_46673 ) ) ( not ( = ?auto_46674 ?auto_46673 ) ) ( not ( = ?auto_46678 ?auto_46673 ) ) ( not ( = ?auto_46679 ?auto_46673 ) ) ( not ( = ?auto_46682 ?auto_46683 ) ) ( not ( = ?auto_46676 ?auto_46682 ) ) ( not ( = ?auto_46677 ?auto_46682 ) ) ( HOIST-AT ?auto_46681 ?auto_46682 ) ( not ( = ?auto_46675 ?auto_46681 ) ) ( not ( = ?auto_46680 ?auto_46681 ) ) ( not ( = ?auto_46672 ?auto_46681 ) ) ( AVAILABLE ?auto_46681 ) ( SURFACE-AT ?auto_46678 ?auto_46682 ) ( ON ?auto_46678 ?auto_46684 ) ( CLEAR ?auto_46678 ) ( not ( = ?auto_46670 ?auto_46684 ) ) ( not ( = ?auto_46671 ?auto_46684 ) ) ( not ( = ?auto_46674 ?auto_46684 ) ) ( not ( = ?auto_46678 ?auto_46684 ) ) ( not ( = ?auto_46679 ?auto_46684 ) ) ( not ( = ?auto_46673 ?auto_46684 ) ) ( TRUCK-AT ?auto_46685 ?auto_46683 ) ( SURFACE-AT ?auto_46686 ?auto_46683 ) ( CLEAR ?auto_46686 ) ( LIFTING ?auto_46675 ?auto_46673 ) ( IS-CRATE ?auto_46673 ) ( not ( = ?auto_46670 ?auto_46686 ) ) ( not ( = ?auto_46671 ?auto_46686 ) ) ( not ( = ?auto_46674 ?auto_46686 ) ) ( not ( = ?auto_46678 ?auto_46686 ) ) ( not ( = ?auto_46679 ?auto_46686 ) ) ( not ( = ?auto_46673 ?auto_46686 ) ) ( not ( = ?auto_46684 ?auto_46686 ) ) )
    :subtasks
    ( ( !DROP ?auto_46675 ?auto_46673 ?auto_46686 ?auto_46683 )
      ( MAKE-ON ?auto_46670 ?auto_46671 )
      ( MAKE-ON-VERIFY ?auto_46670 ?auto_46671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46687 - SURFACE
      ?auto_46688 - SURFACE
    )
    :vars
    (
      ?auto_46699 - HOIST
      ?auto_46695 - PLACE
      ?auto_46702 - PLACE
      ?auto_46700 - HOIST
      ?auto_46689 - SURFACE
      ?auto_46694 - SURFACE
      ?auto_46691 - PLACE
      ?auto_46693 - HOIST
      ?auto_46703 - SURFACE
      ?auto_46690 - SURFACE
      ?auto_46698 - PLACE
      ?auto_46701 - HOIST
      ?auto_46692 - SURFACE
      ?auto_46696 - TRUCK
      ?auto_46697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46699 ?auto_46695 ) ( IS-CRATE ?auto_46687 ) ( not ( = ?auto_46687 ?auto_46688 ) ) ( not ( = ?auto_46702 ?auto_46695 ) ) ( HOIST-AT ?auto_46700 ?auto_46702 ) ( not ( = ?auto_46699 ?auto_46700 ) ) ( AVAILABLE ?auto_46700 ) ( SURFACE-AT ?auto_46687 ?auto_46702 ) ( ON ?auto_46687 ?auto_46689 ) ( CLEAR ?auto_46687 ) ( not ( = ?auto_46687 ?auto_46689 ) ) ( not ( = ?auto_46688 ?auto_46689 ) ) ( IS-CRATE ?auto_46688 ) ( not ( = ?auto_46687 ?auto_46694 ) ) ( not ( = ?auto_46688 ?auto_46694 ) ) ( not ( = ?auto_46689 ?auto_46694 ) ) ( not ( = ?auto_46691 ?auto_46695 ) ) ( not ( = ?auto_46702 ?auto_46691 ) ) ( HOIST-AT ?auto_46693 ?auto_46691 ) ( not ( = ?auto_46699 ?auto_46693 ) ) ( not ( = ?auto_46700 ?auto_46693 ) ) ( AVAILABLE ?auto_46693 ) ( SURFACE-AT ?auto_46688 ?auto_46691 ) ( ON ?auto_46688 ?auto_46703 ) ( CLEAR ?auto_46688 ) ( not ( = ?auto_46687 ?auto_46703 ) ) ( not ( = ?auto_46688 ?auto_46703 ) ) ( not ( = ?auto_46689 ?auto_46703 ) ) ( not ( = ?auto_46694 ?auto_46703 ) ) ( IS-CRATE ?auto_46694 ) ( not ( = ?auto_46687 ?auto_46690 ) ) ( not ( = ?auto_46688 ?auto_46690 ) ) ( not ( = ?auto_46689 ?auto_46690 ) ) ( not ( = ?auto_46694 ?auto_46690 ) ) ( not ( = ?auto_46703 ?auto_46690 ) ) ( not ( = ?auto_46698 ?auto_46695 ) ) ( not ( = ?auto_46702 ?auto_46698 ) ) ( not ( = ?auto_46691 ?auto_46698 ) ) ( HOIST-AT ?auto_46701 ?auto_46698 ) ( not ( = ?auto_46699 ?auto_46701 ) ) ( not ( = ?auto_46700 ?auto_46701 ) ) ( not ( = ?auto_46693 ?auto_46701 ) ) ( AVAILABLE ?auto_46701 ) ( SURFACE-AT ?auto_46694 ?auto_46698 ) ( ON ?auto_46694 ?auto_46692 ) ( CLEAR ?auto_46694 ) ( not ( = ?auto_46687 ?auto_46692 ) ) ( not ( = ?auto_46688 ?auto_46692 ) ) ( not ( = ?auto_46689 ?auto_46692 ) ) ( not ( = ?auto_46694 ?auto_46692 ) ) ( not ( = ?auto_46703 ?auto_46692 ) ) ( not ( = ?auto_46690 ?auto_46692 ) ) ( TRUCK-AT ?auto_46696 ?auto_46695 ) ( SURFACE-AT ?auto_46697 ?auto_46695 ) ( CLEAR ?auto_46697 ) ( IS-CRATE ?auto_46690 ) ( not ( = ?auto_46687 ?auto_46697 ) ) ( not ( = ?auto_46688 ?auto_46697 ) ) ( not ( = ?auto_46689 ?auto_46697 ) ) ( not ( = ?auto_46694 ?auto_46697 ) ) ( not ( = ?auto_46703 ?auto_46697 ) ) ( not ( = ?auto_46690 ?auto_46697 ) ) ( not ( = ?auto_46692 ?auto_46697 ) ) ( AVAILABLE ?auto_46699 ) ( IN ?auto_46690 ?auto_46696 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46699 ?auto_46690 ?auto_46696 ?auto_46695 )
      ( MAKE-ON ?auto_46687 ?auto_46688 )
      ( MAKE-ON-VERIFY ?auto_46687 ?auto_46688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46704 - SURFACE
      ?auto_46705 - SURFACE
    )
    :vars
    (
      ?auto_46707 - HOIST
      ?auto_46710 - PLACE
      ?auto_46714 - PLACE
      ?auto_46712 - HOIST
      ?auto_46719 - SURFACE
      ?auto_46709 - SURFACE
      ?auto_46708 - PLACE
      ?auto_46711 - HOIST
      ?auto_46717 - SURFACE
      ?auto_46720 - SURFACE
      ?auto_46718 - PLACE
      ?auto_46715 - HOIST
      ?auto_46706 - SURFACE
      ?auto_46716 - SURFACE
      ?auto_46713 - TRUCK
      ?auto_46721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46707 ?auto_46710 ) ( IS-CRATE ?auto_46704 ) ( not ( = ?auto_46704 ?auto_46705 ) ) ( not ( = ?auto_46714 ?auto_46710 ) ) ( HOIST-AT ?auto_46712 ?auto_46714 ) ( not ( = ?auto_46707 ?auto_46712 ) ) ( AVAILABLE ?auto_46712 ) ( SURFACE-AT ?auto_46704 ?auto_46714 ) ( ON ?auto_46704 ?auto_46719 ) ( CLEAR ?auto_46704 ) ( not ( = ?auto_46704 ?auto_46719 ) ) ( not ( = ?auto_46705 ?auto_46719 ) ) ( IS-CRATE ?auto_46705 ) ( not ( = ?auto_46704 ?auto_46709 ) ) ( not ( = ?auto_46705 ?auto_46709 ) ) ( not ( = ?auto_46719 ?auto_46709 ) ) ( not ( = ?auto_46708 ?auto_46710 ) ) ( not ( = ?auto_46714 ?auto_46708 ) ) ( HOIST-AT ?auto_46711 ?auto_46708 ) ( not ( = ?auto_46707 ?auto_46711 ) ) ( not ( = ?auto_46712 ?auto_46711 ) ) ( AVAILABLE ?auto_46711 ) ( SURFACE-AT ?auto_46705 ?auto_46708 ) ( ON ?auto_46705 ?auto_46717 ) ( CLEAR ?auto_46705 ) ( not ( = ?auto_46704 ?auto_46717 ) ) ( not ( = ?auto_46705 ?auto_46717 ) ) ( not ( = ?auto_46719 ?auto_46717 ) ) ( not ( = ?auto_46709 ?auto_46717 ) ) ( IS-CRATE ?auto_46709 ) ( not ( = ?auto_46704 ?auto_46720 ) ) ( not ( = ?auto_46705 ?auto_46720 ) ) ( not ( = ?auto_46719 ?auto_46720 ) ) ( not ( = ?auto_46709 ?auto_46720 ) ) ( not ( = ?auto_46717 ?auto_46720 ) ) ( not ( = ?auto_46718 ?auto_46710 ) ) ( not ( = ?auto_46714 ?auto_46718 ) ) ( not ( = ?auto_46708 ?auto_46718 ) ) ( HOIST-AT ?auto_46715 ?auto_46718 ) ( not ( = ?auto_46707 ?auto_46715 ) ) ( not ( = ?auto_46712 ?auto_46715 ) ) ( not ( = ?auto_46711 ?auto_46715 ) ) ( AVAILABLE ?auto_46715 ) ( SURFACE-AT ?auto_46709 ?auto_46718 ) ( ON ?auto_46709 ?auto_46706 ) ( CLEAR ?auto_46709 ) ( not ( = ?auto_46704 ?auto_46706 ) ) ( not ( = ?auto_46705 ?auto_46706 ) ) ( not ( = ?auto_46719 ?auto_46706 ) ) ( not ( = ?auto_46709 ?auto_46706 ) ) ( not ( = ?auto_46717 ?auto_46706 ) ) ( not ( = ?auto_46720 ?auto_46706 ) ) ( SURFACE-AT ?auto_46716 ?auto_46710 ) ( CLEAR ?auto_46716 ) ( IS-CRATE ?auto_46720 ) ( not ( = ?auto_46704 ?auto_46716 ) ) ( not ( = ?auto_46705 ?auto_46716 ) ) ( not ( = ?auto_46719 ?auto_46716 ) ) ( not ( = ?auto_46709 ?auto_46716 ) ) ( not ( = ?auto_46717 ?auto_46716 ) ) ( not ( = ?auto_46720 ?auto_46716 ) ) ( not ( = ?auto_46706 ?auto_46716 ) ) ( AVAILABLE ?auto_46707 ) ( IN ?auto_46720 ?auto_46713 ) ( TRUCK-AT ?auto_46713 ?auto_46721 ) ( not ( = ?auto_46721 ?auto_46710 ) ) ( not ( = ?auto_46714 ?auto_46721 ) ) ( not ( = ?auto_46708 ?auto_46721 ) ) ( not ( = ?auto_46718 ?auto_46721 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46713 ?auto_46721 ?auto_46710 )
      ( MAKE-ON ?auto_46704 ?auto_46705 )
      ( MAKE-ON-VERIFY ?auto_46704 ?auto_46705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46722 - SURFACE
      ?auto_46723 - SURFACE
    )
    :vars
    (
      ?auto_46739 - HOIST
      ?auto_46735 - PLACE
      ?auto_46727 - PLACE
      ?auto_46737 - HOIST
      ?auto_46733 - SURFACE
      ?auto_46732 - SURFACE
      ?auto_46728 - PLACE
      ?auto_46738 - HOIST
      ?auto_46734 - SURFACE
      ?auto_46724 - SURFACE
      ?auto_46729 - PLACE
      ?auto_46725 - HOIST
      ?auto_46726 - SURFACE
      ?auto_46731 - SURFACE
      ?auto_46736 - TRUCK
      ?auto_46730 - PLACE
      ?auto_46740 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46739 ?auto_46735 ) ( IS-CRATE ?auto_46722 ) ( not ( = ?auto_46722 ?auto_46723 ) ) ( not ( = ?auto_46727 ?auto_46735 ) ) ( HOIST-AT ?auto_46737 ?auto_46727 ) ( not ( = ?auto_46739 ?auto_46737 ) ) ( AVAILABLE ?auto_46737 ) ( SURFACE-AT ?auto_46722 ?auto_46727 ) ( ON ?auto_46722 ?auto_46733 ) ( CLEAR ?auto_46722 ) ( not ( = ?auto_46722 ?auto_46733 ) ) ( not ( = ?auto_46723 ?auto_46733 ) ) ( IS-CRATE ?auto_46723 ) ( not ( = ?auto_46722 ?auto_46732 ) ) ( not ( = ?auto_46723 ?auto_46732 ) ) ( not ( = ?auto_46733 ?auto_46732 ) ) ( not ( = ?auto_46728 ?auto_46735 ) ) ( not ( = ?auto_46727 ?auto_46728 ) ) ( HOIST-AT ?auto_46738 ?auto_46728 ) ( not ( = ?auto_46739 ?auto_46738 ) ) ( not ( = ?auto_46737 ?auto_46738 ) ) ( AVAILABLE ?auto_46738 ) ( SURFACE-AT ?auto_46723 ?auto_46728 ) ( ON ?auto_46723 ?auto_46734 ) ( CLEAR ?auto_46723 ) ( not ( = ?auto_46722 ?auto_46734 ) ) ( not ( = ?auto_46723 ?auto_46734 ) ) ( not ( = ?auto_46733 ?auto_46734 ) ) ( not ( = ?auto_46732 ?auto_46734 ) ) ( IS-CRATE ?auto_46732 ) ( not ( = ?auto_46722 ?auto_46724 ) ) ( not ( = ?auto_46723 ?auto_46724 ) ) ( not ( = ?auto_46733 ?auto_46724 ) ) ( not ( = ?auto_46732 ?auto_46724 ) ) ( not ( = ?auto_46734 ?auto_46724 ) ) ( not ( = ?auto_46729 ?auto_46735 ) ) ( not ( = ?auto_46727 ?auto_46729 ) ) ( not ( = ?auto_46728 ?auto_46729 ) ) ( HOIST-AT ?auto_46725 ?auto_46729 ) ( not ( = ?auto_46739 ?auto_46725 ) ) ( not ( = ?auto_46737 ?auto_46725 ) ) ( not ( = ?auto_46738 ?auto_46725 ) ) ( AVAILABLE ?auto_46725 ) ( SURFACE-AT ?auto_46732 ?auto_46729 ) ( ON ?auto_46732 ?auto_46726 ) ( CLEAR ?auto_46732 ) ( not ( = ?auto_46722 ?auto_46726 ) ) ( not ( = ?auto_46723 ?auto_46726 ) ) ( not ( = ?auto_46733 ?auto_46726 ) ) ( not ( = ?auto_46732 ?auto_46726 ) ) ( not ( = ?auto_46734 ?auto_46726 ) ) ( not ( = ?auto_46724 ?auto_46726 ) ) ( SURFACE-AT ?auto_46731 ?auto_46735 ) ( CLEAR ?auto_46731 ) ( IS-CRATE ?auto_46724 ) ( not ( = ?auto_46722 ?auto_46731 ) ) ( not ( = ?auto_46723 ?auto_46731 ) ) ( not ( = ?auto_46733 ?auto_46731 ) ) ( not ( = ?auto_46732 ?auto_46731 ) ) ( not ( = ?auto_46734 ?auto_46731 ) ) ( not ( = ?auto_46724 ?auto_46731 ) ) ( not ( = ?auto_46726 ?auto_46731 ) ) ( AVAILABLE ?auto_46739 ) ( TRUCK-AT ?auto_46736 ?auto_46730 ) ( not ( = ?auto_46730 ?auto_46735 ) ) ( not ( = ?auto_46727 ?auto_46730 ) ) ( not ( = ?auto_46728 ?auto_46730 ) ) ( not ( = ?auto_46729 ?auto_46730 ) ) ( HOIST-AT ?auto_46740 ?auto_46730 ) ( LIFTING ?auto_46740 ?auto_46724 ) ( not ( = ?auto_46739 ?auto_46740 ) ) ( not ( = ?auto_46737 ?auto_46740 ) ) ( not ( = ?auto_46738 ?auto_46740 ) ) ( not ( = ?auto_46725 ?auto_46740 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46740 ?auto_46724 ?auto_46736 ?auto_46730 )
      ( MAKE-ON ?auto_46722 ?auto_46723 )
      ( MAKE-ON-VERIFY ?auto_46722 ?auto_46723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46741 - SURFACE
      ?auto_46742 - SURFACE
    )
    :vars
    (
      ?auto_46753 - HOIST
      ?auto_46759 - PLACE
      ?auto_46745 - PLACE
      ?auto_46750 - HOIST
      ?auto_46746 - SURFACE
      ?auto_46758 - SURFACE
      ?auto_46743 - PLACE
      ?auto_46754 - HOIST
      ?auto_46757 - SURFACE
      ?auto_46755 - SURFACE
      ?auto_46756 - PLACE
      ?auto_46748 - HOIST
      ?auto_46752 - SURFACE
      ?auto_46749 - SURFACE
      ?auto_46744 - TRUCK
      ?auto_46751 - PLACE
      ?auto_46747 - HOIST
      ?auto_46760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46753 ?auto_46759 ) ( IS-CRATE ?auto_46741 ) ( not ( = ?auto_46741 ?auto_46742 ) ) ( not ( = ?auto_46745 ?auto_46759 ) ) ( HOIST-AT ?auto_46750 ?auto_46745 ) ( not ( = ?auto_46753 ?auto_46750 ) ) ( AVAILABLE ?auto_46750 ) ( SURFACE-AT ?auto_46741 ?auto_46745 ) ( ON ?auto_46741 ?auto_46746 ) ( CLEAR ?auto_46741 ) ( not ( = ?auto_46741 ?auto_46746 ) ) ( not ( = ?auto_46742 ?auto_46746 ) ) ( IS-CRATE ?auto_46742 ) ( not ( = ?auto_46741 ?auto_46758 ) ) ( not ( = ?auto_46742 ?auto_46758 ) ) ( not ( = ?auto_46746 ?auto_46758 ) ) ( not ( = ?auto_46743 ?auto_46759 ) ) ( not ( = ?auto_46745 ?auto_46743 ) ) ( HOIST-AT ?auto_46754 ?auto_46743 ) ( not ( = ?auto_46753 ?auto_46754 ) ) ( not ( = ?auto_46750 ?auto_46754 ) ) ( AVAILABLE ?auto_46754 ) ( SURFACE-AT ?auto_46742 ?auto_46743 ) ( ON ?auto_46742 ?auto_46757 ) ( CLEAR ?auto_46742 ) ( not ( = ?auto_46741 ?auto_46757 ) ) ( not ( = ?auto_46742 ?auto_46757 ) ) ( not ( = ?auto_46746 ?auto_46757 ) ) ( not ( = ?auto_46758 ?auto_46757 ) ) ( IS-CRATE ?auto_46758 ) ( not ( = ?auto_46741 ?auto_46755 ) ) ( not ( = ?auto_46742 ?auto_46755 ) ) ( not ( = ?auto_46746 ?auto_46755 ) ) ( not ( = ?auto_46758 ?auto_46755 ) ) ( not ( = ?auto_46757 ?auto_46755 ) ) ( not ( = ?auto_46756 ?auto_46759 ) ) ( not ( = ?auto_46745 ?auto_46756 ) ) ( not ( = ?auto_46743 ?auto_46756 ) ) ( HOIST-AT ?auto_46748 ?auto_46756 ) ( not ( = ?auto_46753 ?auto_46748 ) ) ( not ( = ?auto_46750 ?auto_46748 ) ) ( not ( = ?auto_46754 ?auto_46748 ) ) ( AVAILABLE ?auto_46748 ) ( SURFACE-AT ?auto_46758 ?auto_46756 ) ( ON ?auto_46758 ?auto_46752 ) ( CLEAR ?auto_46758 ) ( not ( = ?auto_46741 ?auto_46752 ) ) ( not ( = ?auto_46742 ?auto_46752 ) ) ( not ( = ?auto_46746 ?auto_46752 ) ) ( not ( = ?auto_46758 ?auto_46752 ) ) ( not ( = ?auto_46757 ?auto_46752 ) ) ( not ( = ?auto_46755 ?auto_46752 ) ) ( SURFACE-AT ?auto_46749 ?auto_46759 ) ( CLEAR ?auto_46749 ) ( IS-CRATE ?auto_46755 ) ( not ( = ?auto_46741 ?auto_46749 ) ) ( not ( = ?auto_46742 ?auto_46749 ) ) ( not ( = ?auto_46746 ?auto_46749 ) ) ( not ( = ?auto_46758 ?auto_46749 ) ) ( not ( = ?auto_46757 ?auto_46749 ) ) ( not ( = ?auto_46755 ?auto_46749 ) ) ( not ( = ?auto_46752 ?auto_46749 ) ) ( AVAILABLE ?auto_46753 ) ( TRUCK-AT ?auto_46744 ?auto_46751 ) ( not ( = ?auto_46751 ?auto_46759 ) ) ( not ( = ?auto_46745 ?auto_46751 ) ) ( not ( = ?auto_46743 ?auto_46751 ) ) ( not ( = ?auto_46756 ?auto_46751 ) ) ( HOIST-AT ?auto_46747 ?auto_46751 ) ( not ( = ?auto_46753 ?auto_46747 ) ) ( not ( = ?auto_46750 ?auto_46747 ) ) ( not ( = ?auto_46754 ?auto_46747 ) ) ( not ( = ?auto_46748 ?auto_46747 ) ) ( AVAILABLE ?auto_46747 ) ( SURFACE-AT ?auto_46755 ?auto_46751 ) ( ON ?auto_46755 ?auto_46760 ) ( CLEAR ?auto_46755 ) ( not ( = ?auto_46741 ?auto_46760 ) ) ( not ( = ?auto_46742 ?auto_46760 ) ) ( not ( = ?auto_46746 ?auto_46760 ) ) ( not ( = ?auto_46758 ?auto_46760 ) ) ( not ( = ?auto_46757 ?auto_46760 ) ) ( not ( = ?auto_46755 ?auto_46760 ) ) ( not ( = ?auto_46752 ?auto_46760 ) ) ( not ( = ?auto_46749 ?auto_46760 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46747 ?auto_46755 ?auto_46760 ?auto_46751 )
      ( MAKE-ON ?auto_46741 ?auto_46742 )
      ( MAKE-ON-VERIFY ?auto_46741 ?auto_46742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46761 - SURFACE
      ?auto_46762 - SURFACE
    )
    :vars
    (
      ?auto_46770 - HOIST
      ?auto_46774 - PLACE
      ?auto_46778 - PLACE
      ?auto_46764 - HOIST
      ?auto_46763 - SURFACE
      ?auto_46776 - SURFACE
      ?auto_46767 - PLACE
      ?auto_46780 - HOIST
      ?auto_46773 - SURFACE
      ?auto_46771 - SURFACE
      ?auto_46775 - PLACE
      ?auto_46779 - HOIST
      ?auto_46777 - SURFACE
      ?auto_46769 - SURFACE
      ?auto_46765 - PLACE
      ?auto_46768 - HOIST
      ?auto_46772 - SURFACE
      ?auto_46766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46770 ?auto_46774 ) ( IS-CRATE ?auto_46761 ) ( not ( = ?auto_46761 ?auto_46762 ) ) ( not ( = ?auto_46778 ?auto_46774 ) ) ( HOIST-AT ?auto_46764 ?auto_46778 ) ( not ( = ?auto_46770 ?auto_46764 ) ) ( AVAILABLE ?auto_46764 ) ( SURFACE-AT ?auto_46761 ?auto_46778 ) ( ON ?auto_46761 ?auto_46763 ) ( CLEAR ?auto_46761 ) ( not ( = ?auto_46761 ?auto_46763 ) ) ( not ( = ?auto_46762 ?auto_46763 ) ) ( IS-CRATE ?auto_46762 ) ( not ( = ?auto_46761 ?auto_46776 ) ) ( not ( = ?auto_46762 ?auto_46776 ) ) ( not ( = ?auto_46763 ?auto_46776 ) ) ( not ( = ?auto_46767 ?auto_46774 ) ) ( not ( = ?auto_46778 ?auto_46767 ) ) ( HOIST-AT ?auto_46780 ?auto_46767 ) ( not ( = ?auto_46770 ?auto_46780 ) ) ( not ( = ?auto_46764 ?auto_46780 ) ) ( AVAILABLE ?auto_46780 ) ( SURFACE-AT ?auto_46762 ?auto_46767 ) ( ON ?auto_46762 ?auto_46773 ) ( CLEAR ?auto_46762 ) ( not ( = ?auto_46761 ?auto_46773 ) ) ( not ( = ?auto_46762 ?auto_46773 ) ) ( not ( = ?auto_46763 ?auto_46773 ) ) ( not ( = ?auto_46776 ?auto_46773 ) ) ( IS-CRATE ?auto_46776 ) ( not ( = ?auto_46761 ?auto_46771 ) ) ( not ( = ?auto_46762 ?auto_46771 ) ) ( not ( = ?auto_46763 ?auto_46771 ) ) ( not ( = ?auto_46776 ?auto_46771 ) ) ( not ( = ?auto_46773 ?auto_46771 ) ) ( not ( = ?auto_46775 ?auto_46774 ) ) ( not ( = ?auto_46778 ?auto_46775 ) ) ( not ( = ?auto_46767 ?auto_46775 ) ) ( HOIST-AT ?auto_46779 ?auto_46775 ) ( not ( = ?auto_46770 ?auto_46779 ) ) ( not ( = ?auto_46764 ?auto_46779 ) ) ( not ( = ?auto_46780 ?auto_46779 ) ) ( AVAILABLE ?auto_46779 ) ( SURFACE-AT ?auto_46776 ?auto_46775 ) ( ON ?auto_46776 ?auto_46777 ) ( CLEAR ?auto_46776 ) ( not ( = ?auto_46761 ?auto_46777 ) ) ( not ( = ?auto_46762 ?auto_46777 ) ) ( not ( = ?auto_46763 ?auto_46777 ) ) ( not ( = ?auto_46776 ?auto_46777 ) ) ( not ( = ?auto_46773 ?auto_46777 ) ) ( not ( = ?auto_46771 ?auto_46777 ) ) ( SURFACE-AT ?auto_46769 ?auto_46774 ) ( CLEAR ?auto_46769 ) ( IS-CRATE ?auto_46771 ) ( not ( = ?auto_46761 ?auto_46769 ) ) ( not ( = ?auto_46762 ?auto_46769 ) ) ( not ( = ?auto_46763 ?auto_46769 ) ) ( not ( = ?auto_46776 ?auto_46769 ) ) ( not ( = ?auto_46773 ?auto_46769 ) ) ( not ( = ?auto_46771 ?auto_46769 ) ) ( not ( = ?auto_46777 ?auto_46769 ) ) ( AVAILABLE ?auto_46770 ) ( not ( = ?auto_46765 ?auto_46774 ) ) ( not ( = ?auto_46778 ?auto_46765 ) ) ( not ( = ?auto_46767 ?auto_46765 ) ) ( not ( = ?auto_46775 ?auto_46765 ) ) ( HOIST-AT ?auto_46768 ?auto_46765 ) ( not ( = ?auto_46770 ?auto_46768 ) ) ( not ( = ?auto_46764 ?auto_46768 ) ) ( not ( = ?auto_46780 ?auto_46768 ) ) ( not ( = ?auto_46779 ?auto_46768 ) ) ( AVAILABLE ?auto_46768 ) ( SURFACE-AT ?auto_46771 ?auto_46765 ) ( ON ?auto_46771 ?auto_46772 ) ( CLEAR ?auto_46771 ) ( not ( = ?auto_46761 ?auto_46772 ) ) ( not ( = ?auto_46762 ?auto_46772 ) ) ( not ( = ?auto_46763 ?auto_46772 ) ) ( not ( = ?auto_46776 ?auto_46772 ) ) ( not ( = ?auto_46773 ?auto_46772 ) ) ( not ( = ?auto_46771 ?auto_46772 ) ) ( not ( = ?auto_46777 ?auto_46772 ) ) ( not ( = ?auto_46769 ?auto_46772 ) ) ( TRUCK-AT ?auto_46766 ?auto_46774 ) )
    :subtasks
    ( ( !DRIVE ?auto_46766 ?auto_46774 ?auto_46765 )
      ( MAKE-ON ?auto_46761 ?auto_46762 )
      ( MAKE-ON-VERIFY ?auto_46761 ?auto_46762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46781 - SURFACE
      ?auto_46782 - SURFACE
    )
    :vars
    (
      ?auto_46792 - HOIST
      ?auto_46791 - PLACE
      ?auto_46798 - PLACE
      ?auto_46797 - HOIST
      ?auto_46796 - SURFACE
      ?auto_46785 - SURFACE
      ?auto_46790 - PLACE
      ?auto_46800 - HOIST
      ?auto_46794 - SURFACE
      ?auto_46787 - SURFACE
      ?auto_46783 - PLACE
      ?auto_46799 - HOIST
      ?auto_46788 - SURFACE
      ?auto_46793 - SURFACE
      ?auto_46786 - PLACE
      ?auto_46795 - HOIST
      ?auto_46789 - SURFACE
      ?auto_46784 - TRUCK
      ?auto_46801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46792 ?auto_46791 ) ( IS-CRATE ?auto_46781 ) ( not ( = ?auto_46781 ?auto_46782 ) ) ( not ( = ?auto_46798 ?auto_46791 ) ) ( HOIST-AT ?auto_46797 ?auto_46798 ) ( not ( = ?auto_46792 ?auto_46797 ) ) ( AVAILABLE ?auto_46797 ) ( SURFACE-AT ?auto_46781 ?auto_46798 ) ( ON ?auto_46781 ?auto_46796 ) ( CLEAR ?auto_46781 ) ( not ( = ?auto_46781 ?auto_46796 ) ) ( not ( = ?auto_46782 ?auto_46796 ) ) ( IS-CRATE ?auto_46782 ) ( not ( = ?auto_46781 ?auto_46785 ) ) ( not ( = ?auto_46782 ?auto_46785 ) ) ( not ( = ?auto_46796 ?auto_46785 ) ) ( not ( = ?auto_46790 ?auto_46791 ) ) ( not ( = ?auto_46798 ?auto_46790 ) ) ( HOIST-AT ?auto_46800 ?auto_46790 ) ( not ( = ?auto_46792 ?auto_46800 ) ) ( not ( = ?auto_46797 ?auto_46800 ) ) ( AVAILABLE ?auto_46800 ) ( SURFACE-AT ?auto_46782 ?auto_46790 ) ( ON ?auto_46782 ?auto_46794 ) ( CLEAR ?auto_46782 ) ( not ( = ?auto_46781 ?auto_46794 ) ) ( not ( = ?auto_46782 ?auto_46794 ) ) ( not ( = ?auto_46796 ?auto_46794 ) ) ( not ( = ?auto_46785 ?auto_46794 ) ) ( IS-CRATE ?auto_46785 ) ( not ( = ?auto_46781 ?auto_46787 ) ) ( not ( = ?auto_46782 ?auto_46787 ) ) ( not ( = ?auto_46796 ?auto_46787 ) ) ( not ( = ?auto_46785 ?auto_46787 ) ) ( not ( = ?auto_46794 ?auto_46787 ) ) ( not ( = ?auto_46783 ?auto_46791 ) ) ( not ( = ?auto_46798 ?auto_46783 ) ) ( not ( = ?auto_46790 ?auto_46783 ) ) ( HOIST-AT ?auto_46799 ?auto_46783 ) ( not ( = ?auto_46792 ?auto_46799 ) ) ( not ( = ?auto_46797 ?auto_46799 ) ) ( not ( = ?auto_46800 ?auto_46799 ) ) ( AVAILABLE ?auto_46799 ) ( SURFACE-AT ?auto_46785 ?auto_46783 ) ( ON ?auto_46785 ?auto_46788 ) ( CLEAR ?auto_46785 ) ( not ( = ?auto_46781 ?auto_46788 ) ) ( not ( = ?auto_46782 ?auto_46788 ) ) ( not ( = ?auto_46796 ?auto_46788 ) ) ( not ( = ?auto_46785 ?auto_46788 ) ) ( not ( = ?auto_46794 ?auto_46788 ) ) ( not ( = ?auto_46787 ?auto_46788 ) ) ( IS-CRATE ?auto_46787 ) ( not ( = ?auto_46781 ?auto_46793 ) ) ( not ( = ?auto_46782 ?auto_46793 ) ) ( not ( = ?auto_46796 ?auto_46793 ) ) ( not ( = ?auto_46785 ?auto_46793 ) ) ( not ( = ?auto_46794 ?auto_46793 ) ) ( not ( = ?auto_46787 ?auto_46793 ) ) ( not ( = ?auto_46788 ?auto_46793 ) ) ( not ( = ?auto_46786 ?auto_46791 ) ) ( not ( = ?auto_46798 ?auto_46786 ) ) ( not ( = ?auto_46790 ?auto_46786 ) ) ( not ( = ?auto_46783 ?auto_46786 ) ) ( HOIST-AT ?auto_46795 ?auto_46786 ) ( not ( = ?auto_46792 ?auto_46795 ) ) ( not ( = ?auto_46797 ?auto_46795 ) ) ( not ( = ?auto_46800 ?auto_46795 ) ) ( not ( = ?auto_46799 ?auto_46795 ) ) ( AVAILABLE ?auto_46795 ) ( SURFACE-AT ?auto_46787 ?auto_46786 ) ( ON ?auto_46787 ?auto_46789 ) ( CLEAR ?auto_46787 ) ( not ( = ?auto_46781 ?auto_46789 ) ) ( not ( = ?auto_46782 ?auto_46789 ) ) ( not ( = ?auto_46796 ?auto_46789 ) ) ( not ( = ?auto_46785 ?auto_46789 ) ) ( not ( = ?auto_46794 ?auto_46789 ) ) ( not ( = ?auto_46787 ?auto_46789 ) ) ( not ( = ?auto_46788 ?auto_46789 ) ) ( not ( = ?auto_46793 ?auto_46789 ) ) ( TRUCK-AT ?auto_46784 ?auto_46791 ) ( SURFACE-AT ?auto_46801 ?auto_46791 ) ( CLEAR ?auto_46801 ) ( LIFTING ?auto_46792 ?auto_46793 ) ( IS-CRATE ?auto_46793 ) ( not ( = ?auto_46781 ?auto_46801 ) ) ( not ( = ?auto_46782 ?auto_46801 ) ) ( not ( = ?auto_46796 ?auto_46801 ) ) ( not ( = ?auto_46785 ?auto_46801 ) ) ( not ( = ?auto_46794 ?auto_46801 ) ) ( not ( = ?auto_46787 ?auto_46801 ) ) ( not ( = ?auto_46788 ?auto_46801 ) ) ( not ( = ?auto_46793 ?auto_46801 ) ) ( not ( = ?auto_46789 ?auto_46801 ) ) )
    :subtasks
    ( ( !DROP ?auto_46792 ?auto_46793 ?auto_46801 ?auto_46791 )
      ( MAKE-ON ?auto_46781 ?auto_46782 )
      ( MAKE-ON-VERIFY ?auto_46781 ?auto_46782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46802 - SURFACE
      ?auto_46803 - SURFACE
    )
    :vars
    (
      ?auto_46814 - HOIST
      ?auto_46822 - PLACE
      ?auto_46815 - PLACE
      ?auto_46820 - HOIST
      ?auto_46813 - SURFACE
      ?auto_46804 - SURFACE
      ?auto_46812 - PLACE
      ?auto_46806 - HOIST
      ?auto_46816 - SURFACE
      ?auto_46808 - SURFACE
      ?auto_46821 - PLACE
      ?auto_46807 - HOIST
      ?auto_46809 - SURFACE
      ?auto_46810 - SURFACE
      ?auto_46805 - PLACE
      ?auto_46819 - HOIST
      ?auto_46817 - SURFACE
      ?auto_46811 - TRUCK
      ?auto_46818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46814 ?auto_46822 ) ( IS-CRATE ?auto_46802 ) ( not ( = ?auto_46802 ?auto_46803 ) ) ( not ( = ?auto_46815 ?auto_46822 ) ) ( HOIST-AT ?auto_46820 ?auto_46815 ) ( not ( = ?auto_46814 ?auto_46820 ) ) ( AVAILABLE ?auto_46820 ) ( SURFACE-AT ?auto_46802 ?auto_46815 ) ( ON ?auto_46802 ?auto_46813 ) ( CLEAR ?auto_46802 ) ( not ( = ?auto_46802 ?auto_46813 ) ) ( not ( = ?auto_46803 ?auto_46813 ) ) ( IS-CRATE ?auto_46803 ) ( not ( = ?auto_46802 ?auto_46804 ) ) ( not ( = ?auto_46803 ?auto_46804 ) ) ( not ( = ?auto_46813 ?auto_46804 ) ) ( not ( = ?auto_46812 ?auto_46822 ) ) ( not ( = ?auto_46815 ?auto_46812 ) ) ( HOIST-AT ?auto_46806 ?auto_46812 ) ( not ( = ?auto_46814 ?auto_46806 ) ) ( not ( = ?auto_46820 ?auto_46806 ) ) ( AVAILABLE ?auto_46806 ) ( SURFACE-AT ?auto_46803 ?auto_46812 ) ( ON ?auto_46803 ?auto_46816 ) ( CLEAR ?auto_46803 ) ( not ( = ?auto_46802 ?auto_46816 ) ) ( not ( = ?auto_46803 ?auto_46816 ) ) ( not ( = ?auto_46813 ?auto_46816 ) ) ( not ( = ?auto_46804 ?auto_46816 ) ) ( IS-CRATE ?auto_46804 ) ( not ( = ?auto_46802 ?auto_46808 ) ) ( not ( = ?auto_46803 ?auto_46808 ) ) ( not ( = ?auto_46813 ?auto_46808 ) ) ( not ( = ?auto_46804 ?auto_46808 ) ) ( not ( = ?auto_46816 ?auto_46808 ) ) ( not ( = ?auto_46821 ?auto_46822 ) ) ( not ( = ?auto_46815 ?auto_46821 ) ) ( not ( = ?auto_46812 ?auto_46821 ) ) ( HOIST-AT ?auto_46807 ?auto_46821 ) ( not ( = ?auto_46814 ?auto_46807 ) ) ( not ( = ?auto_46820 ?auto_46807 ) ) ( not ( = ?auto_46806 ?auto_46807 ) ) ( AVAILABLE ?auto_46807 ) ( SURFACE-AT ?auto_46804 ?auto_46821 ) ( ON ?auto_46804 ?auto_46809 ) ( CLEAR ?auto_46804 ) ( not ( = ?auto_46802 ?auto_46809 ) ) ( not ( = ?auto_46803 ?auto_46809 ) ) ( not ( = ?auto_46813 ?auto_46809 ) ) ( not ( = ?auto_46804 ?auto_46809 ) ) ( not ( = ?auto_46816 ?auto_46809 ) ) ( not ( = ?auto_46808 ?auto_46809 ) ) ( IS-CRATE ?auto_46808 ) ( not ( = ?auto_46802 ?auto_46810 ) ) ( not ( = ?auto_46803 ?auto_46810 ) ) ( not ( = ?auto_46813 ?auto_46810 ) ) ( not ( = ?auto_46804 ?auto_46810 ) ) ( not ( = ?auto_46816 ?auto_46810 ) ) ( not ( = ?auto_46808 ?auto_46810 ) ) ( not ( = ?auto_46809 ?auto_46810 ) ) ( not ( = ?auto_46805 ?auto_46822 ) ) ( not ( = ?auto_46815 ?auto_46805 ) ) ( not ( = ?auto_46812 ?auto_46805 ) ) ( not ( = ?auto_46821 ?auto_46805 ) ) ( HOIST-AT ?auto_46819 ?auto_46805 ) ( not ( = ?auto_46814 ?auto_46819 ) ) ( not ( = ?auto_46820 ?auto_46819 ) ) ( not ( = ?auto_46806 ?auto_46819 ) ) ( not ( = ?auto_46807 ?auto_46819 ) ) ( AVAILABLE ?auto_46819 ) ( SURFACE-AT ?auto_46808 ?auto_46805 ) ( ON ?auto_46808 ?auto_46817 ) ( CLEAR ?auto_46808 ) ( not ( = ?auto_46802 ?auto_46817 ) ) ( not ( = ?auto_46803 ?auto_46817 ) ) ( not ( = ?auto_46813 ?auto_46817 ) ) ( not ( = ?auto_46804 ?auto_46817 ) ) ( not ( = ?auto_46816 ?auto_46817 ) ) ( not ( = ?auto_46808 ?auto_46817 ) ) ( not ( = ?auto_46809 ?auto_46817 ) ) ( not ( = ?auto_46810 ?auto_46817 ) ) ( TRUCK-AT ?auto_46811 ?auto_46822 ) ( SURFACE-AT ?auto_46818 ?auto_46822 ) ( CLEAR ?auto_46818 ) ( IS-CRATE ?auto_46810 ) ( not ( = ?auto_46802 ?auto_46818 ) ) ( not ( = ?auto_46803 ?auto_46818 ) ) ( not ( = ?auto_46813 ?auto_46818 ) ) ( not ( = ?auto_46804 ?auto_46818 ) ) ( not ( = ?auto_46816 ?auto_46818 ) ) ( not ( = ?auto_46808 ?auto_46818 ) ) ( not ( = ?auto_46809 ?auto_46818 ) ) ( not ( = ?auto_46810 ?auto_46818 ) ) ( not ( = ?auto_46817 ?auto_46818 ) ) ( AVAILABLE ?auto_46814 ) ( IN ?auto_46810 ?auto_46811 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46814 ?auto_46810 ?auto_46811 ?auto_46822 )
      ( MAKE-ON ?auto_46802 ?auto_46803 )
      ( MAKE-ON-VERIFY ?auto_46802 ?auto_46803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46823 - SURFACE
      ?auto_46824 - SURFACE
    )
    :vars
    (
      ?auto_46829 - HOIST
      ?auto_46831 - PLACE
      ?auto_46826 - PLACE
      ?auto_46841 - HOIST
      ?auto_46836 - SURFACE
      ?auto_46835 - SURFACE
      ?auto_46825 - PLACE
      ?auto_46837 - HOIST
      ?auto_46843 - SURFACE
      ?auto_46834 - SURFACE
      ?auto_46830 - PLACE
      ?auto_46842 - HOIST
      ?auto_46838 - SURFACE
      ?auto_46839 - SURFACE
      ?auto_46833 - PLACE
      ?auto_46832 - HOIST
      ?auto_46827 - SURFACE
      ?auto_46828 - SURFACE
      ?auto_46840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46829 ?auto_46831 ) ( IS-CRATE ?auto_46823 ) ( not ( = ?auto_46823 ?auto_46824 ) ) ( not ( = ?auto_46826 ?auto_46831 ) ) ( HOIST-AT ?auto_46841 ?auto_46826 ) ( not ( = ?auto_46829 ?auto_46841 ) ) ( AVAILABLE ?auto_46841 ) ( SURFACE-AT ?auto_46823 ?auto_46826 ) ( ON ?auto_46823 ?auto_46836 ) ( CLEAR ?auto_46823 ) ( not ( = ?auto_46823 ?auto_46836 ) ) ( not ( = ?auto_46824 ?auto_46836 ) ) ( IS-CRATE ?auto_46824 ) ( not ( = ?auto_46823 ?auto_46835 ) ) ( not ( = ?auto_46824 ?auto_46835 ) ) ( not ( = ?auto_46836 ?auto_46835 ) ) ( not ( = ?auto_46825 ?auto_46831 ) ) ( not ( = ?auto_46826 ?auto_46825 ) ) ( HOIST-AT ?auto_46837 ?auto_46825 ) ( not ( = ?auto_46829 ?auto_46837 ) ) ( not ( = ?auto_46841 ?auto_46837 ) ) ( AVAILABLE ?auto_46837 ) ( SURFACE-AT ?auto_46824 ?auto_46825 ) ( ON ?auto_46824 ?auto_46843 ) ( CLEAR ?auto_46824 ) ( not ( = ?auto_46823 ?auto_46843 ) ) ( not ( = ?auto_46824 ?auto_46843 ) ) ( not ( = ?auto_46836 ?auto_46843 ) ) ( not ( = ?auto_46835 ?auto_46843 ) ) ( IS-CRATE ?auto_46835 ) ( not ( = ?auto_46823 ?auto_46834 ) ) ( not ( = ?auto_46824 ?auto_46834 ) ) ( not ( = ?auto_46836 ?auto_46834 ) ) ( not ( = ?auto_46835 ?auto_46834 ) ) ( not ( = ?auto_46843 ?auto_46834 ) ) ( not ( = ?auto_46830 ?auto_46831 ) ) ( not ( = ?auto_46826 ?auto_46830 ) ) ( not ( = ?auto_46825 ?auto_46830 ) ) ( HOIST-AT ?auto_46842 ?auto_46830 ) ( not ( = ?auto_46829 ?auto_46842 ) ) ( not ( = ?auto_46841 ?auto_46842 ) ) ( not ( = ?auto_46837 ?auto_46842 ) ) ( AVAILABLE ?auto_46842 ) ( SURFACE-AT ?auto_46835 ?auto_46830 ) ( ON ?auto_46835 ?auto_46838 ) ( CLEAR ?auto_46835 ) ( not ( = ?auto_46823 ?auto_46838 ) ) ( not ( = ?auto_46824 ?auto_46838 ) ) ( not ( = ?auto_46836 ?auto_46838 ) ) ( not ( = ?auto_46835 ?auto_46838 ) ) ( not ( = ?auto_46843 ?auto_46838 ) ) ( not ( = ?auto_46834 ?auto_46838 ) ) ( IS-CRATE ?auto_46834 ) ( not ( = ?auto_46823 ?auto_46839 ) ) ( not ( = ?auto_46824 ?auto_46839 ) ) ( not ( = ?auto_46836 ?auto_46839 ) ) ( not ( = ?auto_46835 ?auto_46839 ) ) ( not ( = ?auto_46843 ?auto_46839 ) ) ( not ( = ?auto_46834 ?auto_46839 ) ) ( not ( = ?auto_46838 ?auto_46839 ) ) ( not ( = ?auto_46833 ?auto_46831 ) ) ( not ( = ?auto_46826 ?auto_46833 ) ) ( not ( = ?auto_46825 ?auto_46833 ) ) ( not ( = ?auto_46830 ?auto_46833 ) ) ( HOIST-AT ?auto_46832 ?auto_46833 ) ( not ( = ?auto_46829 ?auto_46832 ) ) ( not ( = ?auto_46841 ?auto_46832 ) ) ( not ( = ?auto_46837 ?auto_46832 ) ) ( not ( = ?auto_46842 ?auto_46832 ) ) ( AVAILABLE ?auto_46832 ) ( SURFACE-AT ?auto_46834 ?auto_46833 ) ( ON ?auto_46834 ?auto_46827 ) ( CLEAR ?auto_46834 ) ( not ( = ?auto_46823 ?auto_46827 ) ) ( not ( = ?auto_46824 ?auto_46827 ) ) ( not ( = ?auto_46836 ?auto_46827 ) ) ( not ( = ?auto_46835 ?auto_46827 ) ) ( not ( = ?auto_46843 ?auto_46827 ) ) ( not ( = ?auto_46834 ?auto_46827 ) ) ( not ( = ?auto_46838 ?auto_46827 ) ) ( not ( = ?auto_46839 ?auto_46827 ) ) ( SURFACE-AT ?auto_46828 ?auto_46831 ) ( CLEAR ?auto_46828 ) ( IS-CRATE ?auto_46839 ) ( not ( = ?auto_46823 ?auto_46828 ) ) ( not ( = ?auto_46824 ?auto_46828 ) ) ( not ( = ?auto_46836 ?auto_46828 ) ) ( not ( = ?auto_46835 ?auto_46828 ) ) ( not ( = ?auto_46843 ?auto_46828 ) ) ( not ( = ?auto_46834 ?auto_46828 ) ) ( not ( = ?auto_46838 ?auto_46828 ) ) ( not ( = ?auto_46839 ?auto_46828 ) ) ( not ( = ?auto_46827 ?auto_46828 ) ) ( AVAILABLE ?auto_46829 ) ( IN ?auto_46839 ?auto_46840 ) ( TRUCK-AT ?auto_46840 ?auto_46825 ) )
    :subtasks
    ( ( !DRIVE ?auto_46840 ?auto_46825 ?auto_46831 )
      ( MAKE-ON ?auto_46823 ?auto_46824 )
      ( MAKE-ON-VERIFY ?auto_46823 ?auto_46824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46844 - SURFACE
      ?auto_46845 - SURFACE
    )
    :vars
    (
      ?auto_46860 - HOIST
      ?auto_46859 - PLACE
      ?auto_46864 - PLACE
      ?auto_46853 - HOIST
      ?auto_46851 - SURFACE
      ?auto_46863 - SURFACE
      ?auto_46850 - PLACE
      ?auto_46846 - HOIST
      ?auto_46856 - SURFACE
      ?auto_46852 - SURFACE
      ?auto_46862 - PLACE
      ?auto_46857 - HOIST
      ?auto_46848 - SURFACE
      ?auto_46855 - SURFACE
      ?auto_46854 - PLACE
      ?auto_46847 - HOIST
      ?auto_46858 - SURFACE
      ?auto_46861 - SURFACE
      ?auto_46849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46860 ?auto_46859 ) ( IS-CRATE ?auto_46844 ) ( not ( = ?auto_46844 ?auto_46845 ) ) ( not ( = ?auto_46864 ?auto_46859 ) ) ( HOIST-AT ?auto_46853 ?auto_46864 ) ( not ( = ?auto_46860 ?auto_46853 ) ) ( AVAILABLE ?auto_46853 ) ( SURFACE-AT ?auto_46844 ?auto_46864 ) ( ON ?auto_46844 ?auto_46851 ) ( CLEAR ?auto_46844 ) ( not ( = ?auto_46844 ?auto_46851 ) ) ( not ( = ?auto_46845 ?auto_46851 ) ) ( IS-CRATE ?auto_46845 ) ( not ( = ?auto_46844 ?auto_46863 ) ) ( not ( = ?auto_46845 ?auto_46863 ) ) ( not ( = ?auto_46851 ?auto_46863 ) ) ( not ( = ?auto_46850 ?auto_46859 ) ) ( not ( = ?auto_46864 ?auto_46850 ) ) ( HOIST-AT ?auto_46846 ?auto_46850 ) ( not ( = ?auto_46860 ?auto_46846 ) ) ( not ( = ?auto_46853 ?auto_46846 ) ) ( SURFACE-AT ?auto_46845 ?auto_46850 ) ( ON ?auto_46845 ?auto_46856 ) ( CLEAR ?auto_46845 ) ( not ( = ?auto_46844 ?auto_46856 ) ) ( not ( = ?auto_46845 ?auto_46856 ) ) ( not ( = ?auto_46851 ?auto_46856 ) ) ( not ( = ?auto_46863 ?auto_46856 ) ) ( IS-CRATE ?auto_46863 ) ( not ( = ?auto_46844 ?auto_46852 ) ) ( not ( = ?auto_46845 ?auto_46852 ) ) ( not ( = ?auto_46851 ?auto_46852 ) ) ( not ( = ?auto_46863 ?auto_46852 ) ) ( not ( = ?auto_46856 ?auto_46852 ) ) ( not ( = ?auto_46862 ?auto_46859 ) ) ( not ( = ?auto_46864 ?auto_46862 ) ) ( not ( = ?auto_46850 ?auto_46862 ) ) ( HOIST-AT ?auto_46857 ?auto_46862 ) ( not ( = ?auto_46860 ?auto_46857 ) ) ( not ( = ?auto_46853 ?auto_46857 ) ) ( not ( = ?auto_46846 ?auto_46857 ) ) ( AVAILABLE ?auto_46857 ) ( SURFACE-AT ?auto_46863 ?auto_46862 ) ( ON ?auto_46863 ?auto_46848 ) ( CLEAR ?auto_46863 ) ( not ( = ?auto_46844 ?auto_46848 ) ) ( not ( = ?auto_46845 ?auto_46848 ) ) ( not ( = ?auto_46851 ?auto_46848 ) ) ( not ( = ?auto_46863 ?auto_46848 ) ) ( not ( = ?auto_46856 ?auto_46848 ) ) ( not ( = ?auto_46852 ?auto_46848 ) ) ( IS-CRATE ?auto_46852 ) ( not ( = ?auto_46844 ?auto_46855 ) ) ( not ( = ?auto_46845 ?auto_46855 ) ) ( not ( = ?auto_46851 ?auto_46855 ) ) ( not ( = ?auto_46863 ?auto_46855 ) ) ( not ( = ?auto_46856 ?auto_46855 ) ) ( not ( = ?auto_46852 ?auto_46855 ) ) ( not ( = ?auto_46848 ?auto_46855 ) ) ( not ( = ?auto_46854 ?auto_46859 ) ) ( not ( = ?auto_46864 ?auto_46854 ) ) ( not ( = ?auto_46850 ?auto_46854 ) ) ( not ( = ?auto_46862 ?auto_46854 ) ) ( HOIST-AT ?auto_46847 ?auto_46854 ) ( not ( = ?auto_46860 ?auto_46847 ) ) ( not ( = ?auto_46853 ?auto_46847 ) ) ( not ( = ?auto_46846 ?auto_46847 ) ) ( not ( = ?auto_46857 ?auto_46847 ) ) ( AVAILABLE ?auto_46847 ) ( SURFACE-AT ?auto_46852 ?auto_46854 ) ( ON ?auto_46852 ?auto_46858 ) ( CLEAR ?auto_46852 ) ( not ( = ?auto_46844 ?auto_46858 ) ) ( not ( = ?auto_46845 ?auto_46858 ) ) ( not ( = ?auto_46851 ?auto_46858 ) ) ( not ( = ?auto_46863 ?auto_46858 ) ) ( not ( = ?auto_46856 ?auto_46858 ) ) ( not ( = ?auto_46852 ?auto_46858 ) ) ( not ( = ?auto_46848 ?auto_46858 ) ) ( not ( = ?auto_46855 ?auto_46858 ) ) ( SURFACE-AT ?auto_46861 ?auto_46859 ) ( CLEAR ?auto_46861 ) ( IS-CRATE ?auto_46855 ) ( not ( = ?auto_46844 ?auto_46861 ) ) ( not ( = ?auto_46845 ?auto_46861 ) ) ( not ( = ?auto_46851 ?auto_46861 ) ) ( not ( = ?auto_46863 ?auto_46861 ) ) ( not ( = ?auto_46856 ?auto_46861 ) ) ( not ( = ?auto_46852 ?auto_46861 ) ) ( not ( = ?auto_46848 ?auto_46861 ) ) ( not ( = ?auto_46855 ?auto_46861 ) ) ( not ( = ?auto_46858 ?auto_46861 ) ) ( AVAILABLE ?auto_46860 ) ( TRUCK-AT ?auto_46849 ?auto_46850 ) ( LIFTING ?auto_46846 ?auto_46855 ) )
    :subtasks
    ( ( !LOAD ?auto_46846 ?auto_46855 ?auto_46849 ?auto_46850 )
      ( MAKE-ON ?auto_46844 ?auto_46845 )
      ( MAKE-ON-VERIFY ?auto_46844 ?auto_46845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46865 - SURFACE
      ?auto_46866 - SURFACE
    )
    :vars
    (
      ?auto_46883 - HOIST
      ?auto_46872 - PLACE
      ?auto_46873 - PLACE
      ?auto_46867 - HOIST
      ?auto_46874 - SURFACE
      ?auto_46878 - SURFACE
      ?auto_46871 - PLACE
      ?auto_46879 - HOIST
      ?auto_46884 - SURFACE
      ?auto_46868 - SURFACE
      ?auto_46877 - PLACE
      ?auto_46881 - HOIST
      ?auto_46869 - SURFACE
      ?auto_46885 - SURFACE
      ?auto_46875 - PLACE
      ?auto_46882 - HOIST
      ?auto_46870 - SURFACE
      ?auto_46876 - SURFACE
      ?auto_46880 - TRUCK
      ?auto_46886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46883 ?auto_46872 ) ( IS-CRATE ?auto_46865 ) ( not ( = ?auto_46865 ?auto_46866 ) ) ( not ( = ?auto_46873 ?auto_46872 ) ) ( HOIST-AT ?auto_46867 ?auto_46873 ) ( not ( = ?auto_46883 ?auto_46867 ) ) ( AVAILABLE ?auto_46867 ) ( SURFACE-AT ?auto_46865 ?auto_46873 ) ( ON ?auto_46865 ?auto_46874 ) ( CLEAR ?auto_46865 ) ( not ( = ?auto_46865 ?auto_46874 ) ) ( not ( = ?auto_46866 ?auto_46874 ) ) ( IS-CRATE ?auto_46866 ) ( not ( = ?auto_46865 ?auto_46878 ) ) ( not ( = ?auto_46866 ?auto_46878 ) ) ( not ( = ?auto_46874 ?auto_46878 ) ) ( not ( = ?auto_46871 ?auto_46872 ) ) ( not ( = ?auto_46873 ?auto_46871 ) ) ( HOIST-AT ?auto_46879 ?auto_46871 ) ( not ( = ?auto_46883 ?auto_46879 ) ) ( not ( = ?auto_46867 ?auto_46879 ) ) ( SURFACE-AT ?auto_46866 ?auto_46871 ) ( ON ?auto_46866 ?auto_46884 ) ( CLEAR ?auto_46866 ) ( not ( = ?auto_46865 ?auto_46884 ) ) ( not ( = ?auto_46866 ?auto_46884 ) ) ( not ( = ?auto_46874 ?auto_46884 ) ) ( not ( = ?auto_46878 ?auto_46884 ) ) ( IS-CRATE ?auto_46878 ) ( not ( = ?auto_46865 ?auto_46868 ) ) ( not ( = ?auto_46866 ?auto_46868 ) ) ( not ( = ?auto_46874 ?auto_46868 ) ) ( not ( = ?auto_46878 ?auto_46868 ) ) ( not ( = ?auto_46884 ?auto_46868 ) ) ( not ( = ?auto_46877 ?auto_46872 ) ) ( not ( = ?auto_46873 ?auto_46877 ) ) ( not ( = ?auto_46871 ?auto_46877 ) ) ( HOIST-AT ?auto_46881 ?auto_46877 ) ( not ( = ?auto_46883 ?auto_46881 ) ) ( not ( = ?auto_46867 ?auto_46881 ) ) ( not ( = ?auto_46879 ?auto_46881 ) ) ( AVAILABLE ?auto_46881 ) ( SURFACE-AT ?auto_46878 ?auto_46877 ) ( ON ?auto_46878 ?auto_46869 ) ( CLEAR ?auto_46878 ) ( not ( = ?auto_46865 ?auto_46869 ) ) ( not ( = ?auto_46866 ?auto_46869 ) ) ( not ( = ?auto_46874 ?auto_46869 ) ) ( not ( = ?auto_46878 ?auto_46869 ) ) ( not ( = ?auto_46884 ?auto_46869 ) ) ( not ( = ?auto_46868 ?auto_46869 ) ) ( IS-CRATE ?auto_46868 ) ( not ( = ?auto_46865 ?auto_46885 ) ) ( not ( = ?auto_46866 ?auto_46885 ) ) ( not ( = ?auto_46874 ?auto_46885 ) ) ( not ( = ?auto_46878 ?auto_46885 ) ) ( not ( = ?auto_46884 ?auto_46885 ) ) ( not ( = ?auto_46868 ?auto_46885 ) ) ( not ( = ?auto_46869 ?auto_46885 ) ) ( not ( = ?auto_46875 ?auto_46872 ) ) ( not ( = ?auto_46873 ?auto_46875 ) ) ( not ( = ?auto_46871 ?auto_46875 ) ) ( not ( = ?auto_46877 ?auto_46875 ) ) ( HOIST-AT ?auto_46882 ?auto_46875 ) ( not ( = ?auto_46883 ?auto_46882 ) ) ( not ( = ?auto_46867 ?auto_46882 ) ) ( not ( = ?auto_46879 ?auto_46882 ) ) ( not ( = ?auto_46881 ?auto_46882 ) ) ( AVAILABLE ?auto_46882 ) ( SURFACE-AT ?auto_46868 ?auto_46875 ) ( ON ?auto_46868 ?auto_46870 ) ( CLEAR ?auto_46868 ) ( not ( = ?auto_46865 ?auto_46870 ) ) ( not ( = ?auto_46866 ?auto_46870 ) ) ( not ( = ?auto_46874 ?auto_46870 ) ) ( not ( = ?auto_46878 ?auto_46870 ) ) ( not ( = ?auto_46884 ?auto_46870 ) ) ( not ( = ?auto_46868 ?auto_46870 ) ) ( not ( = ?auto_46869 ?auto_46870 ) ) ( not ( = ?auto_46885 ?auto_46870 ) ) ( SURFACE-AT ?auto_46876 ?auto_46872 ) ( CLEAR ?auto_46876 ) ( IS-CRATE ?auto_46885 ) ( not ( = ?auto_46865 ?auto_46876 ) ) ( not ( = ?auto_46866 ?auto_46876 ) ) ( not ( = ?auto_46874 ?auto_46876 ) ) ( not ( = ?auto_46878 ?auto_46876 ) ) ( not ( = ?auto_46884 ?auto_46876 ) ) ( not ( = ?auto_46868 ?auto_46876 ) ) ( not ( = ?auto_46869 ?auto_46876 ) ) ( not ( = ?auto_46885 ?auto_46876 ) ) ( not ( = ?auto_46870 ?auto_46876 ) ) ( AVAILABLE ?auto_46883 ) ( TRUCK-AT ?auto_46880 ?auto_46871 ) ( AVAILABLE ?auto_46879 ) ( SURFACE-AT ?auto_46885 ?auto_46871 ) ( ON ?auto_46885 ?auto_46886 ) ( CLEAR ?auto_46885 ) ( not ( = ?auto_46865 ?auto_46886 ) ) ( not ( = ?auto_46866 ?auto_46886 ) ) ( not ( = ?auto_46874 ?auto_46886 ) ) ( not ( = ?auto_46878 ?auto_46886 ) ) ( not ( = ?auto_46884 ?auto_46886 ) ) ( not ( = ?auto_46868 ?auto_46886 ) ) ( not ( = ?auto_46869 ?auto_46886 ) ) ( not ( = ?auto_46885 ?auto_46886 ) ) ( not ( = ?auto_46870 ?auto_46886 ) ) ( not ( = ?auto_46876 ?auto_46886 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46879 ?auto_46885 ?auto_46886 ?auto_46871 )
      ( MAKE-ON ?auto_46865 ?auto_46866 )
      ( MAKE-ON-VERIFY ?auto_46865 ?auto_46866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46887 - SURFACE
      ?auto_46888 - SURFACE
    )
    :vars
    (
      ?auto_46894 - HOIST
      ?auto_46907 - PLACE
      ?auto_46892 - PLACE
      ?auto_46895 - HOIST
      ?auto_46902 - SURFACE
      ?auto_46900 - SURFACE
      ?auto_46908 - PLACE
      ?auto_46903 - HOIST
      ?auto_46906 - SURFACE
      ?auto_46889 - SURFACE
      ?auto_46893 - PLACE
      ?auto_46897 - HOIST
      ?auto_46898 - SURFACE
      ?auto_46896 - SURFACE
      ?auto_46899 - PLACE
      ?auto_46905 - HOIST
      ?auto_46904 - SURFACE
      ?auto_46891 - SURFACE
      ?auto_46901 - SURFACE
      ?auto_46890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46894 ?auto_46907 ) ( IS-CRATE ?auto_46887 ) ( not ( = ?auto_46887 ?auto_46888 ) ) ( not ( = ?auto_46892 ?auto_46907 ) ) ( HOIST-AT ?auto_46895 ?auto_46892 ) ( not ( = ?auto_46894 ?auto_46895 ) ) ( AVAILABLE ?auto_46895 ) ( SURFACE-AT ?auto_46887 ?auto_46892 ) ( ON ?auto_46887 ?auto_46902 ) ( CLEAR ?auto_46887 ) ( not ( = ?auto_46887 ?auto_46902 ) ) ( not ( = ?auto_46888 ?auto_46902 ) ) ( IS-CRATE ?auto_46888 ) ( not ( = ?auto_46887 ?auto_46900 ) ) ( not ( = ?auto_46888 ?auto_46900 ) ) ( not ( = ?auto_46902 ?auto_46900 ) ) ( not ( = ?auto_46908 ?auto_46907 ) ) ( not ( = ?auto_46892 ?auto_46908 ) ) ( HOIST-AT ?auto_46903 ?auto_46908 ) ( not ( = ?auto_46894 ?auto_46903 ) ) ( not ( = ?auto_46895 ?auto_46903 ) ) ( SURFACE-AT ?auto_46888 ?auto_46908 ) ( ON ?auto_46888 ?auto_46906 ) ( CLEAR ?auto_46888 ) ( not ( = ?auto_46887 ?auto_46906 ) ) ( not ( = ?auto_46888 ?auto_46906 ) ) ( not ( = ?auto_46902 ?auto_46906 ) ) ( not ( = ?auto_46900 ?auto_46906 ) ) ( IS-CRATE ?auto_46900 ) ( not ( = ?auto_46887 ?auto_46889 ) ) ( not ( = ?auto_46888 ?auto_46889 ) ) ( not ( = ?auto_46902 ?auto_46889 ) ) ( not ( = ?auto_46900 ?auto_46889 ) ) ( not ( = ?auto_46906 ?auto_46889 ) ) ( not ( = ?auto_46893 ?auto_46907 ) ) ( not ( = ?auto_46892 ?auto_46893 ) ) ( not ( = ?auto_46908 ?auto_46893 ) ) ( HOIST-AT ?auto_46897 ?auto_46893 ) ( not ( = ?auto_46894 ?auto_46897 ) ) ( not ( = ?auto_46895 ?auto_46897 ) ) ( not ( = ?auto_46903 ?auto_46897 ) ) ( AVAILABLE ?auto_46897 ) ( SURFACE-AT ?auto_46900 ?auto_46893 ) ( ON ?auto_46900 ?auto_46898 ) ( CLEAR ?auto_46900 ) ( not ( = ?auto_46887 ?auto_46898 ) ) ( not ( = ?auto_46888 ?auto_46898 ) ) ( not ( = ?auto_46902 ?auto_46898 ) ) ( not ( = ?auto_46900 ?auto_46898 ) ) ( not ( = ?auto_46906 ?auto_46898 ) ) ( not ( = ?auto_46889 ?auto_46898 ) ) ( IS-CRATE ?auto_46889 ) ( not ( = ?auto_46887 ?auto_46896 ) ) ( not ( = ?auto_46888 ?auto_46896 ) ) ( not ( = ?auto_46902 ?auto_46896 ) ) ( not ( = ?auto_46900 ?auto_46896 ) ) ( not ( = ?auto_46906 ?auto_46896 ) ) ( not ( = ?auto_46889 ?auto_46896 ) ) ( not ( = ?auto_46898 ?auto_46896 ) ) ( not ( = ?auto_46899 ?auto_46907 ) ) ( not ( = ?auto_46892 ?auto_46899 ) ) ( not ( = ?auto_46908 ?auto_46899 ) ) ( not ( = ?auto_46893 ?auto_46899 ) ) ( HOIST-AT ?auto_46905 ?auto_46899 ) ( not ( = ?auto_46894 ?auto_46905 ) ) ( not ( = ?auto_46895 ?auto_46905 ) ) ( not ( = ?auto_46903 ?auto_46905 ) ) ( not ( = ?auto_46897 ?auto_46905 ) ) ( AVAILABLE ?auto_46905 ) ( SURFACE-AT ?auto_46889 ?auto_46899 ) ( ON ?auto_46889 ?auto_46904 ) ( CLEAR ?auto_46889 ) ( not ( = ?auto_46887 ?auto_46904 ) ) ( not ( = ?auto_46888 ?auto_46904 ) ) ( not ( = ?auto_46902 ?auto_46904 ) ) ( not ( = ?auto_46900 ?auto_46904 ) ) ( not ( = ?auto_46906 ?auto_46904 ) ) ( not ( = ?auto_46889 ?auto_46904 ) ) ( not ( = ?auto_46898 ?auto_46904 ) ) ( not ( = ?auto_46896 ?auto_46904 ) ) ( SURFACE-AT ?auto_46891 ?auto_46907 ) ( CLEAR ?auto_46891 ) ( IS-CRATE ?auto_46896 ) ( not ( = ?auto_46887 ?auto_46891 ) ) ( not ( = ?auto_46888 ?auto_46891 ) ) ( not ( = ?auto_46902 ?auto_46891 ) ) ( not ( = ?auto_46900 ?auto_46891 ) ) ( not ( = ?auto_46906 ?auto_46891 ) ) ( not ( = ?auto_46889 ?auto_46891 ) ) ( not ( = ?auto_46898 ?auto_46891 ) ) ( not ( = ?auto_46896 ?auto_46891 ) ) ( not ( = ?auto_46904 ?auto_46891 ) ) ( AVAILABLE ?auto_46894 ) ( AVAILABLE ?auto_46903 ) ( SURFACE-AT ?auto_46896 ?auto_46908 ) ( ON ?auto_46896 ?auto_46901 ) ( CLEAR ?auto_46896 ) ( not ( = ?auto_46887 ?auto_46901 ) ) ( not ( = ?auto_46888 ?auto_46901 ) ) ( not ( = ?auto_46902 ?auto_46901 ) ) ( not ( = ?auto_46900 ?auto_46901 ) ) ( not ( = ?auto_46906 ?auto_46901 ) ) ( not ( = ?auto_46889 ?auto_46901 ) ) ( not ( = ?auto_46898 ?auto_46901 ) ) ( not ( = ?auto_46896 ?auto_46901 ) ) ( not ( = ?auto_46904 ?auto_46901 ) ) ( not ( = ?auto_46891 ?auto_46901 ) ) ( TRUCK-AT ?auto_46890 ?auto_46907 ) )
    :subtasks
    ( ( !DRIVE ?auto_46890 ?auto_46907 ?auto_46908 )
      ( MAKE-ON ?auto_46887 ?auto_46888 )
      ( MAKE-ON-VERIFY ?auto_46887 ?auto_46888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46911 - SURFACE
      ?auto_46912 - SURFACE
    )
    :vars
    (
      ?auto_46913 - HOIST
      ?auto_46914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46913 ?auto_46914 ) ( SURFACE-AT ?auto_46912 ?auto_46914 ) ( CLEAR ?auto_46912 ) ( LIFTING ?auto_46913 ?auto_46911 ) ( IS-CRATE ?auto_46911 ) ( not ( = ?auto_46911 ?auto_46912 ) ) )
    :subtasks
    ( ( !DROP ?auto_46913 ?auto_46911 ?auto_46912 ?auto_46914 )
      ( MAKE-ON-VERIFY ?auto_46911 ?auto_46912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46915 - SURFACE
      ?auto_46916 - SURFACE
    )
    :vars
    (
      ?auto_46918 - HOIST
      ?auto_46917 - PLACE
      ?auto_46919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46918 ?auto_46917 ) ( SURFACE-AT ?auto_46916 ?auto_46917 ) ( CLEAR ?auto_46916 ) ( IS-CRATE ?auto_46915 ) ( not ( = ?auto_46915 ?auto_46916 ) ) ( TRUCK-AT ?auto_46919 ?auto_46917 ) ( AVAILABLE ?auto_46918 ) ( IN ?auto_46915 ?auto_46919 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46918 ?auto_46915 ?auto_46919 ?auto_46917 )
      ( MAKE-ON ?auto_46915 ?auto_46916 )
      ( MAKE-ON-VERIFY ?auto_46915 ?auto_46916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46920 - SURFACE
      ?auto_46921 - SURFACE
    )
    :vars
    (
      ?auto_46922 - HOIST
      ?auto_46923 - PLACE
      ?auto_46924 - TRUCK
      ?auto_46925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46922 ?auto_46923 ) ( SURFACE-AT ?auto_46921 ?auto_46923 ) ( CLEAR ?auto_46921 ) ( IS-CRATE ?auto_46920 ) ( not ( = ?auto_46920 ?auto_46921 ) ) ( AVAILABLE ?auto_46922 ) ( IN ?auto_46920 ?auto_46924 ) ( TRUCK-AT ?auto_46924 ?auto_46925 ) ( not ( = ?auto_46925 ?auto_46923 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46924 ?auto_46925 ?auto_46923 )
      ( MAKE-ON ?auto_46920 ?auto_46921 )
      ( MAKE-ON-VERIFY ?auto_46920 ?auto_46921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46926 - SURFACE
      ?auto_46927 - SURFACE
    )
    :vars
    (
      ?auto_46929 - HOIST
      ?auto_46930 - PLACE
      ?auto_46928 - TRUCK
      ?auto_46931 - PLACE
      ?auto_46932 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46929 ?auto_46930 ) ( SURFACE-AT ?auto_46927 ?auto_46930 ) ( CLEAR ?auto_46927 ) ( IS-CRATE ?auto_46926 ) ( not ( = ?auto_46926 ?auto_46927 ) ) ( AVAILABLE ?auto_46929 ) ( TRUCK-AT ?auto_46928 ?auto_46931 ) ( not ( = ?auto_46931 ?auto_46930 ) ) ( HOIST-AT ?auto_46932 ?auto_46931 ) ( LIFTING ?auto_46932 ?auto_46926 ) ( not ( = ?auto_46929 ?auto_46932 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46932 ?auto_46926 ?auto_46928 ?auto_46931 )
      ( MAKE-ON ?auto_46926 ?auto_46927 )
      ( MAKE-ON-VERIFY ?auto_46926 ?auto_46927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46933 - SURFACE
      ?auto_46934 - SURFACE
    )
    :vars
    (
      ?auto_46939 - HOIST
      ?auto_46937 - PLACE
      ?auto_46938 - TRUCK
      ?auto_46936 - PLACE
      ?auto_46935 - HOIST
      ?auto_46940 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46939 ?auto_46937 ) ( SURFACE-AT ?auto_46934 ?auto_46937 ) ( CLEAR ?auto_46934 ) ( IS-CRATE ?auto_46933 ) ( not ( = ?auto_46933 ?auto_46934 ) ) ( AVAILABLE ?auto_46939 ) ( TRUCK-AT ?auto_46938 ?auto_46936 ) ( not ( = ?auto_46936 ?auto_46937 ) ) ( HOIST-AT ?auto_46935 ?auto_46936 ) ( not ( = ?auto_46939 ?auto_46935 ) ) ( AVAILABLE ?auto_46935 ) ( SURFACE-AT ?auto_46933 ?auto_46936 ) ( ON ?auto_46933 ?auto_46940 ) ( CLEAR ?auto_46933 ) ( not ( = ?auto_46933 ?auto_46940 ) ) ( not ( = ?auto_46934 ?auto_46940 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46935 ?auto_46933 ?auto_46940 ?auto_46936 )
      ( MAKE-ON ?auto_46933 ?auto_46934 )
      ( MAKE-ON-VERIFY ?auto_46933 ?auto_46934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46941 - SURFACE
      ?auto_46942 - SURFACE
    )
    :vars
    (
      ?auto_46945 - HOIST
      ?auto_46946 - PLACE
      ?auto_46944 - PLACE
      ?auto_46948 - HOIST
      ?auto_46947 - SURFACE
      ?auto_46943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46945 ?auto_46946 ) ( SURFACE-AT ?auto_46942 ?auto_46946 ) ( CLEAR ?auto_46942 ) ( IS-CRATE ?auto_46941 ) ( not ( = ?auto_46941 ?auto_46942 ) ) ( AVAILABLE ?auto_46945 ) ( not ( = ?auto_46944 ?auto_46946 ) ) ( HOIST-AT ?auto_46948 ?auto_46944 ) ( not ( = ?auto_46945 ?auto_46948 ) ) ( AVAILABLE ?auto_46948 ) ( SURFACE-AT ?auto_46941 ?auto_46944 ) ( ON ?auto_46941 ?auto_46947 ) ( CLEAR ?auto_46941 ) ( not ( = ?auto_46941 ?auto_46947 ) ) ( not ( = ?auto_46942 ?auto_46947 ) ) ( TRUCK-AT ?auto_46943 ?auto_46946 ) )
    :subtasks
    ( ( !DRIVE ?auto_46943 ?auto_46946 ?auto_46944 )
      ( MAKE-ON ?auto_46941 ?auto_46942 )
      ( MAKE-ON-VERIFY ?auto_46941 ?auto_46942 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46949 - SURFACE
      ?auto_46950 - SURFACE
    )
    :vars
    (
      ?auto_46955 - HOIST
      ?auto_46956 - PLACE
      ?auto_46952 - PLACE
      ?auto_46951 - HOIST
      ?auto_46953 - SURFACE
      ?auto_46954 - TRUCK
      ?auto_46957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46955 ?auto_46956 ) ( IS-CRATE ?auto_46949 ) ( not ( = ?auto_46949 ?auto_46950 ) ) ( not ( = ?auto_46952 ?auto_46956 ) ) ( HOIST-AT ?auto_46951 ?auto_46952 ) ( not ( = ?auto_46955 ?auto_46951 ) ) ( AVAILABLE ?auto_46951 ) ( SURFACE-AT ?auto_46949 ?auto_46952 ) ( ON ?auto_46949 ?auto_46953 ) ( CLEAR ?auto_46949 ) ( not ( = ?auto_46949 ?auto_46953 ) ) ( not ( = ?auto_46950 ?auto_46953 ) ) ( TRUCK-AT ?auto_46954 ?auto_46956 ) ( SURFACE-AT ?auto_46957 ?auto_46956 ) ( CLEAR ?auto_46957 ) ( LIFTING ?auto_46955 ?auto_46950 ) ( IS-CRATE ?auto_46950 ) ( not ( = ?auto_46949 ?auto_46957 ) ) ( not ( = ?auto_46950 ?auto_46957 ) ) ( not ( = ?auto_46953 ?auto_46957 ) ) )
    :subtasks
    ( ( !DROP ?auto_46955 ?auto_46950 ?auto_46957 ?auto_46956 )
      ( MAKE-ON ?auto_46949 ?auto_46950 )
      ( MAKE-ON-VERIFY ?auto_46949 ?auto_46950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46958 - SURFACE
      ?auto_46959 - SURFACE
    )
    :vars
    (
      ?auto_46964 - HOIST
      ?auto_46960 - PLACE
      ?auto_46963 - PLACE
      ?auto_46965 - HOIST
      ?auto_46962 - SURFACE
      ?auto_46961 - TRUCK
      ?auto_46966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46964 ?auto_46960 ) ( IS-CRATE ?auto_46958 ) ( not ( = ?auto_46958 ?auto_46959 ) ) ( not ( = ?auto_46963 ?auto_46960 ) ) ( HOIST-AT ?auto_46965 ?auto_46963 ) ( not ( = ?auto_46964 ?auto_46965 ) ) ( AVAILABLE ?auto_46965 ) ( SURFACE-AT ?auto_46958 ?auto_46963 ) ( ON ?auto_46958 ?auto_46962 ) ( CLEAR ?auto_46958 ) ( not ( = ?auto_46958 ?auto_46962 ) ) ( not ( = ?auto_46959 ?auto_46962 ) ) ( TRUCK-AT ?auto_46961 ?auto_46960 ) ( SURFACE-AT ?auto_46966 ?auto_46960 ) ( CLEAR ?auto_46966 ) ( IS-CRATE ?auto_46959 ) ( not ( = ?auto_46958 ?auto_46966 ) ) ( not ( = ?auto_46959 ?auto_46966 ) ) ( not ( = ?auto_46962 ?auto_46966 ) ) ( AVAILABLE ?auto_46964 ) ( IN ?auto_46959 ?auto_46961 ) )
    :subtasks
    ( ( !UNLOAD ?auto_46964 ?auto_46959 ?auto_46961 ?auto_46960 )
      ( MAKE-ON ?auto_46958 ?auto_46959 )
      ( MAKE-ON-VERIFY ?auto_46958 ?auto_46959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46967 - SURFACE
      ?auto_46968 - SURFACE
    )
    :vars
    (
      ?auto_46972 - HOIST
      ?auto_46974 - PLACE
      ?auto_46971 - PLACE
      ?auto_46973 - HOIST
      ?auto_46975 - SURFACE
      ?auto_46969 - SURFACE
      ?auto_46970 - TRUCK
      ?auto_46976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46972 ?auto_46974 ) ( IS-CRATE ?auto_46967 ) ( not ( = ?auto_46967 ?auto_46968 ) ) ( not ( = ?auto_46971 ?auto_46974 ) ) ( HOIST-AT ?auto_46973 ?auto_46971 ) ( not ( = ?auto_46972 ?auto_46973 ) ) ( AVAILABLE ?auto_46973 ) ( SURFACE-AT ?auto_46967 ?auto_46971 ) ( ON ?auto_46967 ?auto_46975 ) ( CLEAR ?auto_46967 ) ( not ( = ?auto_46967 ?auto_46975 ) ) ( not ( = ?auto_46968 ?auto_46975 ) ) ( SURFACE-AT ?auto_46969 ?auto_46974 ) ( CLEAR ?auto_46969 ) ( IS-CRATE ?auto_46968 ) ( not ( = ?auto_46967 ?auto_46969 ) ) ( not ( = ?auto_46968 ?auto_46969 ) ) ( not ( = ?auto_46975 ?auto_46969 ) ) ( AVAILABLE ?auto_46972 ) ( IN ?auto_46968 ?auto_46970 ) ( TRUCK-AT ?auto_46970 ?auto_46976 ) ( not ( = ?auto_46976 ?auto_46974 ) ) ( not ( = ?auto_46971 ?auto_46976 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46970 ?auto_46976 ?auto_46974 )
      ( MAKE-ON ?auto_46967 ?auto_46968 )
      ( MAKE-ON-VERIFY ?auto_46967 ?auto_46968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46977 - SURFACE
      ?auto_46978 - SURFACE
    )
    :vars
    (
      ?auto_46980 - HOIST
      ?auto_46983 - PLACE
      ?auto_46979 - PLACE
      ?auto_46986 - HOIST
      ?auto_46982 - SURFACE
      ?auto_46981 - SURFACE
      ?auto_46985 - TRUCK
      ?auto_46984 - PLACE
      ?auto_46987 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_46980 ?auto_46983 ) ( IS-CRATE ?auto_46977 ) ( not ( = ?auto_46977 ?auto_46978 ) ) ( not ( = ?auto_46979 ?auto_46983 ) ) ( HOIST-AT ?auto_46986 ?auto_46979 ) ( not ( = ?auto_46980 ?auto_46986 ) ) ( AVAILABLE ?auto_46986 ) ( SURFACE-AT ?auto_46977 ?auto_46979 ) ( ON ?auto_46977 ?auto_46982 ) ( CLEAR ?auto_46977 ) ( not ( = ?auto_46977 ?auto_46982 ) ) ( not ( = ?auto_46978 ?auto_46982 ) ) ( SURFACE-AT ?auto_46981 ?auto_46983 ) ( CLEAR ?auto_46981 ) ( IS-CRATE ?auto_46978 ) ( not ( = ?auto_46977 ?auto_46981 ) ) ( not ( = ?auto_46978 ?auto_46981 ) ) ( not ( = ?auto_46982 ?auto_46981 ) ) ( AVAILABLE ?auto_46980 ) ( TRUCK-AT ?auto_46985 ?auto_46984 ) ( not ( = ?auto_46984 ?auto_46983 ) ) ( not ( = ?auto_46979 ?auto_46984 ) ) ( HOIST-AT ?auto_46987 ?auto_46984 ) ( LIFTING ?auto_46987 ?auto_46978 ) ( not ( = ?auto_46980 ?auto_46987 ) ) ( not ( = ?auto_46986 ?auto_46987 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46987 ?auto_46978 ?auto_46985 ?auto_46984 )
      ( MAKE-ON ?auto_46977 ?auto_46978 )
      ( MAKE-ON-VERIFY ?auto_46977 ?auto_46978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46988 - SURFACE
      ?auto_46989 - SURFACE
    )
    :vars
    (
      ?auto_46992 - HOIST
      ?auto_46991 - PLACE
      ?auto_46990 - PLACE
      ?auto_46997 - HOIST
      ?auto_46996 - SURFACE
      ?auto_46998 - SURFACE
      ?auto_46994 - TRUCK
      ?auto_46995 - PLACE
      ?auto_46993 - HOIST
      ?auto_46999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46992 ?auto_46991 ) ( IS-CRATE ?auto_46988 ) ( not ( = ?auto_46988 ?auto_46989 ) ) ( not ( = ?auto_46990 ?auto_46991 ) ) ( HOIST-AT ?auto_46997 ?auto_46990 ) ( not ( = ?auto_46992 ?auto_46997 ) ) ( AVAILABLE ?auto_46997 ) ( SURFACE-AT ?auto_46988 ?auto_46990 ) ( ON ?auto_46988 ?auto_46996 ) ( CLEAR ?auto_46988 ) ( not ( = ?auto_46988 ?auto_46996 ) ) ( not ( = ?auto_46989 ?auto_46996 ) ) ( SURFACE-AT ?auto_46998 ?auto_46991 ) ( CLEAR ?auto_46998 ) ( IS-CRATE ?auto_46989 ) ( not ( = ?auto_46988 ?auto_46998 ) ) ( not ( = ?auto_46989 ?auto_46998 ) ) ( not ( = ?auto_46996 ?auto_46998 ) ) ( AVAILABLE ?auto_46992 ) ( TRUCK-AT ?auto_46994 ?auto_46995 ) ( not ( = ?auto_46995 ?auto_46991 ) ) ( not ( = ?auto_46990 ?auto_46995 ) ) ( HOIST-AT ?auto_46993 ?auto_46995 ) ( not ( = ?auto_46992 ?auto_46993 ) ) ( not ( = ?auto_46997 ?auto_46993 ) ) ( AVAILABLE ?auto_46993 ) ( SURFACE-AT ?auto_46989 ?auto_46995 ) ( ON ?auto_46989 ?auto_46999 ) ( CLEAR ?auto_46989 ) ( not ( = ?auto_46988 ?auto_46999 ) ) ( not ( = ?auto_46989 ?auto_46999 ) ) ( not ( = ?auto_46996 ?auto_46999 ) ) ( not ( = ?auto_46998 ?auto_46999 ) ) )
    :subtasks
    ( ( !LIFT ?auto_46993 ?auto_46989 ?auto_46999 ?auto_46995 )
      ( MAKE-ON ?auto_46988 ?auto_46989 )
      ( MAKE-ON-VERIFY ?auto_46988 ?auto_46989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47000 - SURFACE
      ?auto_47001 - SURFACE
    )
    :vars
    (
      ?auto_47003 - HOIST
      ?auto_47005 - PLACE
      ?auto_47010 - PLACE
      ?auto_47009 - HOIST
      ?auto_47006 - SURFACE
      ?auto_47008 - SURFACE
      ?auto_47004 - PLACE
      ?auto_47011 - HOIST
      ?auto_47007 - SURFACE
      ?auto_47002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47003 ?auto_47005 ) ( IS-CRATE ?auto_47000 ) ( not ( = ?auto_47000 ?auto_47001 ) ) ( not ( = ?auto_47010 ?auto_47005 ) ) ( HOIST-AT ?auto_47009 ?auto_47010 ) ( not ( = ?auto_47003 ?auto_47009 ) ) ( AVAILABLE ?auto_47009 ) ( SURFACE-AT ?auto_47000 ?auto_47010 ) ( ON ?auto_47000 ?auto_47006 ) ( CLEAR ?auto_47000 ) ( not ( = ?auto_47000 ?auto_47006 ) ) ( not ( = ?auto_47001 ?auto_47006 ) ) ( SURFACE-AT ?auto_47008 ?auto_47005 ) ( CLEAR ?auto_47008 ) ( IS-CRATE ?auto_47001 ) ( not ( = ?auto_47000 ?auto_47008 ) ) ( not ( = ?auto_47001 ?auto_47008 ) ) ( not ( = ?auto_47006 ?auto_47008 ) ) ( AVAILABLE ?auto_47003 ) ( not ( = ?auto_47004 ?auto_47005 ) ) ( not ( = ?auto_47010 ?auto_47004 ) ) ( HOIST-AT ?auto_47011 ?auto_47004 ) ( not ( = ?auto_47003 ?auto_47011 ) ) ( not ( = ?auto_47009 ?auto_47011 ) ) ( AVAILABLE ?auto_47011 ) ( SURFACE-AT ?auto_47001 ?auto_47004 ) ( ON ?auto_47001 ?auto_47007 ) ( CLEAR ?auto_47001 ) ( not ( = ?auto_47000 ?auto_47007 ) ) ( not ( = ?auto_47001 ?auto_47007 ) ) ( not ( = ?auto_47006 ?auto_47007 ) ) ( not ( = ?auto_47008 ?auto_47007 ) ) ( TRUCK-AT ?auto_47002 ?auto_47005 ) )
    :subtasks
    ( ( !DRIVE ?auto_47002 ?auto_47005 ?auto_47004 )
      ( MAKE-ON ?auto_47000 ?auto_47001 )
      ( MAKE-ON-VERIFY ?auto_47000 ?auto_47001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47012 - SURFACE
      ?auto_47013 - SURFACE
    )
    :vars
    (
      ?auto_47017 - HOIST
      ?auto_47022 - PLACE
      ?auto_47020 - PLACE
      ?auto_47015 - HOIST
      ?auto_47023 - SURFACE
      ?auto_47021 - SURFACE
      ?auto_47016 - PLACE
      ?auto_47018 - HOIST
      ?auto_47014 - SURFACE
      ?auto_47019 - TRUCK
      ?auto_47024 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47017 ?auto_47022 ) ( IS-CRATE ?auto_47012 ) ( not ( = ?auto_47012 ?auto_47013 ) ) ( not ( = ?auto_47020 ?auto_47022 ) ) ( HOIST-AT ?auto_47015 ?auto_47020 ) ( not ( = ?auto_47017 ?auto_47015 ) ) ( AVAILABLE ?auto_47015 ) ( SURFACE-AT ?auto_47012 ?auto_47020 ) ( ON ?auto_47012 ?auto_47023 ) ( CLEAR ?auto_47012 ) ( not ( = ?auto_47012 ?auto_47023 ) ) ( not ( = ?auto_47013 ?auto_47023 ) ) ( IS-CRATE ?auto_47013 ) ( not ( = ?auto_47012 ?auto_47021 ) ) ( not ( = ?auto_47013 ?auto_47021 ) ) ( not ( = ?auto_47023 ?auto_47021 ) ) ( not ( = ?auto_47016 ?auto_47022 ) ) ( not ( = ?auto_47020 ?auto_47016 ) ) ( HOIST-AT ?auto_47018 ?auto_47016 ) ( not ( = ?auto_47017 ?auto_47018 ) ) ( not ( = ?auto_47015 ?auto_47018 ) ) ( AVAILABLE ?auto_47018 ) ( SURFACE-AT ?auto_47013 ?auto_47016 ) ( ON ?auto_47013 ?auto_47014 ) ( CLEAR ?auto_47013 ) ( not ( = ?auto_47012 ?auto_47014 ) ) ( not ( = ?auto_47013 ?auto_47014 ) ) ( not ( = ?auto_47023 ?auto_47014 ) ) ( not ( = ?auto_47021 ?auto_47014 ) ) ( TRUCK-AT ?auto_47019 ?auto_47022 ) ( SURFACE-AT ?auto_47024 ?auto_47022 ) ( CLEAR ?auto_47024 ) ( LIFTING ?auto_47017 ?auto_47021 ) ( IS-CRATE ?auto_47021 ) ( not ( = ?auto_47012 ?auto_47024 ) ) ( not ( = ?auto_47013 ?auto_47024 ) ) ( not ( = ?auto_47023 ?auto_47024 ) ) ( not ( = ?auto_47021 ?auto_47024 ) ) ( not ( = ?auto_47014 ?auto_47024 ) ) )
    :subtasks
    ( ( !DROP ?auto_47017 ?auto_47021 ?auto_47024 ?auto_47022 )
      ( MAKE-ON ?auto_47012 ?auto_47013 )
      ( MAKE-ON-VERIFY ?auto_47012 ?auto_47013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47025 - SURFACE
      ?auto_47026 - SURFACE
    )
    :vars
    (
      ?auto_47033 - HOIST
      ?auto_47032 - PLACE
      ?auto_47030 - PLACE
      ?auto_47035 - HOIST
      ?auto_47029 - SURFACE
      ?auto_47037 - SURFACE
      ?auto_47027 - PLACE
      ?auto_47034 - HOIST
      ?auto_47036 - SURFACE
      ?auto_47028 - TRUCK
      ?auto_47031 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47033 ?auto_47032 ) ( IS-CRATE ?auto_47025 ) ( not ( = ?auto_47025 ?auto_47026 ) ) ( not ( = ?auto_47030 ?auto_47032 ) ) ( HOIST-AT ?auto_47035 ?auto_47030 ) ( not ( = ?auto_47033 ?auto_47035 ) ) ( AVAILABLE ?auto_47035 ) ( SURFACE-AT ?auto_47025 ?auto_47030 ) ( ON ?auto_47025 ?auto_47029 ) ( CLEAR ?auto_47025 ) ( not ( = ?auto_47025 ?auto_47029 ) ) ( not ( = ?auto_47026 ?auto_47029 ) ) ( IS-CRATE ?auto_47026 ) ( not ( = ?auto_47025 ?auto_47037 ) ) ( not ( = ?auto_47026 ?auto_47037 ) ) ( not ( = ?auto_47029 ?auto_47037 ) ) ( not ( = ?auto_47027 ?auto_47032 ) ) ( not ( = ?auto_47030 ?auto_47027 ) ) ( HOIST-AT ?auto_47034 ?auto_47027 ) ( not ( = ?auto_47033 ?auto_47034 ) ) ( not ( = ?auto_47035 ?auto_47034 ) ) ( AVAILABLE ?auto_47034 ) ( SURFACE-AT ?auto_47026 ?auto_47027 ) ( ON ?auto_47026 ?auto_47036 ) ( CLEAR ?auto_47026 ) ( not ( = ?auto_47025 ?auto_47036 ) ) ( not ( = ?auto_47026 ?auto_47036 ) ) ( not ( = ?auto_47029 ?auto_47036 ) ) ( not ( = ?auto_47037 ?auto_47036 ) ) ( TRUCK-AT ?auto_47028 ?auto_47032 ) ( SURFACE-AT ?auto_47031 ?auto_47032 ) ( CLEAR ?auto_47031 ) ( IS-CRATE ?auto_47037 ) ( not ( = ?auto_47025 ?auto_47031 ) ) ( not ( = ?auto_47026 ?auto_47031 ) ) ( not ( = ?auto_47029 ?auto_47031 ) ) ( not ( = ?auto_47037 ?auto_47031 ) ) ( not ( = ?auto_47036 ?auto_47031 ) ) ( AVAILABLE ?auto_47033 ) ( IN ?auto_47037 ?auto_47028 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47033 ?auto_47037 ?auto_47028 ?auto_47032 )
      ( MAKE-ON ?auto_47025 ?auto_47026 )
      ( MAKE-ON-VERIFY ?auto_47025 ?auto_47026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47038 - SURFACE
      ?auto_47039 - SURFACE
    )
    :vars
    (
      ?auto_47047 - HOIST
      ?auto_47044 - PLACE
      ?auto_47043 - PLACE
      ?auto_47042 - HOIST
      ?auto_47049 - SURFACE
      ?auto_47046 - SURFACE
      ?auto_47041 - PLACE
      ?auto_47045 - HOIST
      ?auto_47040 - SURFACE
      ?auto_47048 - SURFACE
      ?auto_47050 - TRUCK
      ?auto_47051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47047 ?auto_47044 ) ( IS-CRATE ?auto_47038 ) ( not ( = ?auto_47038 ?auto_47039 ) ) ( not ( = ?auto_47043 ?auto_47044 ) ) ( HOIST-AT ?auto_47042 ?auto_47043 ) ( not ( = ?auto_47047 ?auto_47042 ) ) ( AVAILABLE ?auto_47042 ) ( SURFACE-AT ?auto_47038 ?auto_47043 ) ( ON ?auto_47038 ?auto_47049 ) ( CLEAR ?auto_47038 ) ( not ( = ?auto_47038 ?auto_47049 ) ) ( not ( = ?auto_47039 ?auto_47049 ) ) ( IS-CRATE ?auto_47039 ) ( not ( = ?auto_47038 ?auto_47046 ) ) ( not ( = ?auto_47039 ?auto_47046 ) ) ( not ( = ?auto_47049 ?auto_47046 ) ) ( not ( = ?auto_47041 ?auto_47044 ) ) ( not ( = ?auto_47043 ?auto_47041 ) ) ( HOIST-AT ?auto_47045 ?auto_47041 ) ( not ( = ?auto_47047 ?auto_47045 ) ) ( not ( = ?auto_47042 ?auto_47045 ) ) ( AVAILABLE ?auto_47045 ) ( SURFACE-AT ?auto_47039 ?auto_47041 ) ( ON ?auto_47039 ?auto_47040 ) ( CLEAR ?auto_47039 ) ( not ( = ?auto_47038 ?auto_47040 ) ) ( not ( = ?auto_47039 ?auto_47040 ) ) ( not ( = ?auto_47049 ?auto_47040 ) ) ( not ( = ?auto_47046 ?auto_47040 ) ) ( SURFACE-AT ?auto_47048 ?auto_47044 ) ( CLEAR ?auto_47048 ) ( IS-CRATE ?auto_47046 ) ( not ( = ?auto_47038 ?auto_47048 ) ) ( not ( = ?auto_47039 ?auto_47048 ) ) ( not ( = ?auto_47049 ?auto_47048 ) ) ( not ( = ?auto_47046 ?auto_47048 ) ) ( not ( = ?auto_47040 ?auto_47048 ) ) ( AVAILABLE ?auto_47047 ) ( IN ?auto_47046 ?auto_47050 ) ( TRUCK-AT ?auto_47050 ?auto_47051 ) ( not ( = ?auto_47051 ?auto_47044 ) ) ( not ( = ?auto_47043 ?auto_47051 ) ) ( not ( = ?auto_47041 ?auto_47051 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47050 ?auto_47051 ?auto_47044 )
      ( MAKE-ON ?auto_47038 ?auto_47039 )
      ( MAKE-ON-VERIFY ?auto_47038 ?auto_47039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47052 - SURFACE
      ?auto_47053 - SURFACE
    )
    :vars
    (
      ?auto_47064 - HOIST
      ?auto_47055 - PLACE
      ?auto_47058 - PLACE
      ?auto_47056 - HOIST
      ?auto_47057 - SURFACE
      ?auto_47063 - SURFACE
      ?auto_47062 - PLACE
      ?auto_47054 - HOIST
      ?auto_47065 - SURFACE
      ?auto_47060 - SURFACE
      ?auto_47059 - TRUCK
      ?auto_47061 - PLACE
      ?auto_47066 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47064 ?auto_47055 ) ( IS-CRATE ?auto_47052 ) ( not ( = ?auto_47052 ?auto_47053 ) ) ( not ( = ?auto_47058 ?auto_47055 ) ) ( HOIST-AT ?auto_47056 ?auto_47058 ) ( not ( = ?auto_47064 ?auto_47056 ) ) ( AVAILABLE ?auto_47056 ) ( SURFACE-AT ?auto_47052 ?auto_47058 ) ( ON ?auto_47052 ?auto_47057 ) ( CLEAR ?auto_47052 ) ( not ( = ?auto_47052 ?auto_47057 ) ) ( not ( = ?auto_47053 ?auto_47057 ) ) ( IS-CRATE ?auto_47053 ) ( not ( = ?auto_47052 ?auto_47063 ) ) ( not ( = ?auto_47053 ?auto_47063 ) ) ( not ( = ?auto_47057 ?auto_47063 ) ) ( not ( = ?auto_47062 ?auto_47055 ) ) ( not ( = ?auto_47058 ?auto_47062 ) ) ( HOIST-AT ?auto_47054 ?auto_47062 ) ( not ( = ?auto_47064 ?auto_47054 ) ) ( not ( = ?auto_47056 ?auto_47054 ) ) ( AVAILABLE ?auto_47054 ) ( SURFACE-AT ?auto_47053 ?auto_47062 ) ( ON ?auto_47053 ?auto_47065 ) ( CLEAR ?auto_47053 ) ( not ( = ?auto_47052 ?auto_47065 ) ) ( not ( = ?auto_47053 ?auto_47065 ) ) ( not ( = ?auto_47057 ?auto_47065 ) ) ( not ( = ?auto_47063 ?auto_47065 ) ) ( SURFACE-AT ?auto_47060 ?auto_47055 ) ( CLEAR ?auto_47060 ) ( IS-CRATE ?auto_47063 ) ( not ( = ?auto_47052 ?auto_47060 ) ) ( not ( = ?auto_47053 ?auto_47060 ) ) ( not ( = ?auto_47057 ?auto_47060 ) ) ( not ( = ?auto_47063 ?auto_47060 ) ) ( not ( = ?auto_47065 ?auto_47060 ) ) ( AVAILABLE ?auto_47064 ) ( TRUCK-AT ?auto_47059 ?auto_47061 ) ( not ( = ?auto_47061 ?auto_47055 ) ) ( not ( = ?auto_47058 ?auto_47061 ) ) ( not ( = ?auto_47062 ?auto_47061 ) ) ( HOIST-AT ?auto_47066 ?auto_47061 ) ( LIFTING ?auto_47066 ?auto_47063 ) ( not ( = ?auto_47064 ?auto_47066 ) ) ( not ( = ?auto_47056 ?auto_47066 ) ) ( not ( = ?auto_47054 ?auto_47066 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47066 ?auto_47063 ?auto_47059 ?auto_47061 )
      ( MAKE-ON ?auto_47052 ?auto_47053 )
      ( MAKE-ON-VERIFY ?auto_47052 ?auto_47053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47067 - SURFACE
      ?auto_47068 - SURFACE
    )
    :vars
    (
      ?auto_47070 - HOIST
      ?auto_47071 - PLACE
      ?auto_47078 - PLACE
      ?auto_47077 - HOIST
      ?auto_47073 - SURFACE
      ?auto_47072 - SURFACE
      ?auto_47069 - PLACE
      ?auto_47074 - HOIST
      ?auto_47076 - SURFACE
      ?auto_47081 - SURFACE
      ?auto_47075 - TRUCK
      ?auto_47079 - PLACE
      ?auto_47080 - HOIST
      ?auto_47082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47070 ?auto_47071 ) ( IS-CRATE ?auto_47067 ) ( not ( = ?auto_47067 ?auto_47068 ) ) ( not ( = ?auto_47078 ?auto_47071 ) ) ( HOIST-AT ?auto_47077 ?auto_47078 ) ( not ( = ?auto_47070 ?auto_47077 ) ) ( AVAILABLE ?auto_47077 ) ( SURFACE-AT ?auto_47067 ?auto_47078 ) ( ON ?auto_47067 ?auto_47073 ) ( CLEAR ?auto_47067 ) ( not ( = ?auto_47067 ?auto_47073 ) ) ( not ( = ?auto_47068 ?auto_47073 ) ) ( IS-CRATE ?auto_47068 ) ( not ( = ?auto_47067 ?auto_47072 ) ) ( not ( = ?auto_47068 ?auto_47072 ) ) ( not ( = ?auto_47073 ?auto_47072 ) ) ( not ( = ?auto_47069 ?auto_47071 ) ) ( not ( = ?auto_47078 ?auto_47069 ) ) ( HOIST-AT ?auto_47074 ?auto_47069 ) ( not ( = ?auto_47070 ?auto_47074 ) ) ( not ( = ?auto_47077 ?auto_47074 ) ) ( AVAILABLE ?auto_47074 ) ( SURFACE-AT ?auto_47068 ?auto_47069 ) ( ON ?auto_47068 ?auto_47076 ) ( CLEAR ?auto_47068 ) ( not ( = ?auto_47067 ?auto_47076 ) ) ( not ( = ?auto_47068 ?auto_47076 ) ) ( not ( = ?auto_47073 ?auto_47076 ) ) ( not ( = ?auto_47072 ?auto_47076 ) ) ( SURFACE-AT ?auto_47081 ?auto_47071 ) ( CLEAR ?auto_47081 ) ( IS-CRATE ?auto_47072 ) ( not ( = ?auto_47067 ?auto_47081 ) ) ( not ( = ?auto_47068 ?auto_47081 ) ) ( not ( = ?auto_47073 ?auto_47081 ) ) ( not ( = ?auto_47072 ?auto_47081 ) ) ( not ( = ?auto_47076 ?auto_47081 ) ) ( AVAILABLE ?auto_47070 ) ( TRUCK-AT ?auto_47075 ?auto_47079 ) ( not ( = ?auto_47079 ?auto_47071 ) ) ( not ( = ?auto_47078 ?auto_47079 ) ) ( not ( = ?auto_47069 ?auto_47079 ) ) ( HOIST-AT ?auto_47080 ?auto_47079 ) ( not ( = ?auto_47070 ?auto_47080 ) ) ( not ( = ?auto_47077 ?auto_47080 ) ) ( not ( = ?auto_47074 ?auto_47080 ) ) ( AVAILABLE ?auto_47080 ) ( SURFACE-AT ?auto_47072 ?auto_47079 ) ( ON ?auto_47072 ?auto_47082 ) ( CLEAR ?auto_47072 ) ( not ( = ?auto_47067 ?auto_47082 ) ) ( not ( = ?auto_47068 ?auto_47082 ) ) ( not ( = ?auto_47073 ?auto_47082 ) ) ( not ( = ?auto_47072 ?auto_47082 ) ) ( not ( = ?auto_47076 ?auto_47082 ) ) ( not ( = ?auto_47081 ?auto_47082 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47080 ?auto_47072 ?auto_47082 ?auto_47079 )
      ( MAKE-ON ?auto_47067 ?auto_47068 )
      ( MAKE-ON-VERIFY ?auto_47067 ?auto_47068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47083 - SURFACE
      ?auto_47084 - SURFACE
    )
    :vars
    (
      ?auto_47090 - HOIST
      ?auto_47087 - PLACE
      ?auto_47086 - PLACE
      ?auto_47098 - HOIST
      ?auto_47085 - SURFACE
      ?auto_47096 - SURFACE
      ?auto_47094 - PLACE
      ?auto_47088 - HOIST
      ?auto_47097 - SURFACE
      ?auto_47093 - SURFACE
      ?auto_47095 - PLACE
      ?auto_47089 - HOIST
      ?auto_47092 - SURFACE
      ?auto_47091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47090 ?auto_47087 ) ( IS-CRATE ?auto_47083 ) ( not ( = ?auto_47083 ?auto_47084 ) ) ( not ( = ?auto_47086 ?auto_47087 ) ) ( HOIST-AT ?auto_47098 ?auto_47086 ) ( not ( = ?auto_47090 ?auto_47098 ) ) ( AVAILABLE ?auto_47098 ) ( SURFACE-AT ?auto_47083 ?auto_47086 ) ( ON ?auto_47083 ?auto_47085 ) ( CLEAR ?auto_47083 ) ( not ( = ?auto_47083 ?auto_47085 ) ) ( not ( = ?auto_47084 ?auto_47085 ) ) ( IS-CRATE ?auto_47084 ) ( not ( = ?auto_47083 ?auto_47096 ) ) ( not ( = ?auto_47084 ?auto_47096 ) ) ( not ( = ?auto_47085 ?auto_47096 ) ) ( not ( = ?auto_47094 ?auto_47087 ) ) ( not ( = ?auto_47086 ?auto_47094 ) ) ( HOIST-AT ?auto_47088 ?auto_47094 ) ( not ( = ?auto_47090 ?auto_47088 ) ) ( not ( = ?auto_47098 ?auto_47088 ) ) ( AVAILABLE ?auto_47088 ) ( SURFACE-AT ?auto_47084 ?auto_47094 ) ( ON ?auto_47084 ?auto_47097 ) ( CLEAR ?auto_47084 ) ( not ( = ?auto_47083 ?auto_47097 ) ) ( not ( = ?auto_47084 ?auto_47097 ) ) ( not ( = ?auto_47085 ?auto_47097 ) ) ( not ( = ?auto_47096 ?auto_47097 ) ) ( SURFACE-AT ?auto_47093 ?auto_47087 ) ( CLEAR ?auto_47093 ) ( IS-CRATE ?auto_47096 ) ( not ( = ?auto_47083 ?auto_47093 ) ) ( not ( = ?auto_47084 ?auto_47093 ) ) ( not ( = ?auto_47085 ?auto_47093 ) ) ( not ( = ?auto_47096 ?auto_47093 ) ) ( not ( = ?auto_47097 ?auto_47093 ) ) ( AVAILABLE ?auto_47090 ) ( not ( = ?auto_47095 ?auto_47087 ) ) ( not ( = ?auto_47086 ?auto_47095 ) ) ( not ( = ?auto_47094 ?auto_47095 ) ) ( HOIST-AT ?auto_47089 ?auto_47095 ) ( not ( = ?auto_47090 ?auto_47089 ) ) ( not ( = ?auto_47098 ?auto_47089 ) ) ( not ( = ?auto_47088 ?auto_47089 ) ) ( AVAILABLE ?auto_47089 ) ( SURFACE-AT ?auto_47096 ?auto_47095 ) ( ON ?auto_47096 ?auto_47092 ) ( CLEAR ?auto_47096 ) ( not ( = ?auto_47083 ?auto_47092 ) ) ( not ( = ?auto_47084 ?auto_47092 ) ) ( not ( = ?auto_47085 ?auto_47092 ) ) ( not ( = ?auto_47096 ?auto_47092 ) ) ( not ( = ?auto_47097 ?auto_47092 ) ) ( not ( = ?auto_47093 ?auto_47092 ) ) ( TRUCK-AT ?auto_47091 ?auto_47087 ) )
    :subtasks
    ( ( !DRIVE ?auto_47091 ?auto_47087 ?auto_47095 )
      ( MAKE-ON ?auto_47083 ?auto_47084 )
      ( MAKE-ON-VERIFY ?auto_47083 ?auto_47084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47099 - SURFACE
      ?auto_47100 - SURFACE
    )
    :vars
    (
      ?auto_47111 - HOIST
      ?auto_47107 - PLACE
      ?auto_47108 - PLACE
      ?auto_47104 - HOIST
      ?auto_47113 - SURFACE
      ?auto_47105 - SURFACE
      ?auto_47110 - PLACE
      ?auto_47103 - HOIST
      ?auto_47102 - SURFACE
      ?auto_47109 - SURFACE
      ?auto_47112 - PLACE
      ?auto_47114 - HOIST
      ?auto_47101 - SURFACE
      ?auto_47106 - TRUCK
      ?auto_47115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47111 ?auto_47107 ) ( IS-CRATE ?auto_47099 ) ( not ( = ?auto_47099 ?auto_47100 ) ) ( not ( = ?auto_47108 ?auto_47107 ) ) ( HOIST-AT ?auto_47104 ?auto_47108 ) ( not ( = ?auto_47111 ?auto_47104 ) ) ( AVAILABLE ?auto_47104 ) ( SURFACE-AT ?auto_47099 ?auto_47108 ) ( ON ?auto_47099 ?auto_47113 ) ( CLEAR ?auto_47099 ) ( not ( = ?auto_47099 ?auto_47113 ) ) ( not ( = ?auto_47100 ?auto_47113 ) ) ( IS-CRATE ?auto_47100 ) ( not ( = ?auto_47099 ?auto_47105 ) ) ( not ( = ?auto_47100 ?auto_47105 ) ) ( not ( = ?auto_47113 ?auto_47105 ) ) ( not ( = ?auto_47110 ?auto_47107 ) ) ( not ( = ?auto_47108 ?auto_47110 ) ) ( HOIST-AT ?auto_47103 ?auto_47110 ) ( not ( = ?auto_47111 ?auto_47103 ) ) ( not ( = ?auto_47104 ?auto_47103 ) ) ( AVAILABLE ?auto_47103 ) ( SURFACE-AT ?auto_47100 ?auto_47110 ) ( ON ?auto_47100 ?auto_47102 ) ( CLEAR ?auto_47100 ) ( not ( = ?auto_47099 ?auto_47102 ) ) ( not ( = ?auto_47100 ?auto_47102 ) ) ( not ( = ?auto_47113 ?auto_47102 ) ) ( not ( = ?auto_47105 ?auto_47102 ) ) ( IS-CRATE ?auto_47105 ) ( not ( = ?auto_47099 ?auto_47109 ) ) ( not ( = ?auto_47100 ?auto_47109 ) ) ( not ( = ?auto_47113 ?auto_47109 ) ) ( not ( = ?auto_47105 ?auto_47109 ) ) ( not ( = ?auto_47102 ?auto_47109 ) ) ( not ( = ?auto_47112 ?auto_47107 ) ) ( not ( = ?auto_47108 ?auto_47112 ) ) ( not ( = ?auto_47110 ?auto_47112 ) ) ( HOIST-AT ?auto_47114 ?auto_47112 ) ( not ( = ?auto_47111 ?auto_47114 ) ) ( not ( = ?auto_47104 ?auto_47114 ) ) ( not ( = ?auto_47103 ?auto_47114 ) ) ( AVAILABLE ?auto_47114 ) ( SURFACE-AT ?auto_47105 ?auto_47112 ) ( ON ?auto_47105 ?auto_47101 ) ( CLEAR ?auto_47105 ) ( not ( = ?auto_47099 ?auto_47101 ) ) ( not ( = ?auto_47100 ?auto_47101 ) ) ( not ( = ?auto_47113 ?auto_47101 ) ) ( not ( = ?auto_47105 ?auto_47101 ) ) ( not ( = ?auto_47102 ?auto_47101 ) ) ( not ( = ?auto_47109 ?auto_47101 ) ) ( TRUCK-AT ?auto_47106 ?auto_47107 ) ( SURFACE-AT ?auto_47115 ?auto_47107 ) ( CLEAR ?auto_47115 ) ( LIFTING ?auto_47111 ?auto_47109 ) ( IS-CRATE ?auto_47109 ) ( not ( = ?auto_47099 ?auto_47115 ) ) ( not ( = ?auto_47100 ?auto_47115 ) ) ( not ( = ?auto_47113 ?auto_47115 ) ) ( not ( = ?auto_47105 ?auto_47115 ) ) ( not ( = ?auto_47102 ?auto_47115 ) ) ( not ( = ?auto_47109 ?auto_47115 ) ) ( not ( = ?auto_47101 ?auto_47115 ) ) )
    :subtasks
    ( ( !DROP ?auto_47111 ?auto_47109 ?auto_47115 ?auto_47107 )
      ( MAKE-ON ?auto_47099 ?auto_47100 )
      ( MAKE-ON-VERIFY ?auto_47099 ?auto_47100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47116 - SURFACE
      ?auto_47117 - SURFACE
    )
    :vars
    (
      ?auto_47124 - HOIST
      ?auto_47123 - PLACE
      ?auto_47128 - PLACE
      ?auto_47119 - HOIST
      ?auto_47132 - SURFACE
      ?auto_47120 - SURFACE
      ?auto_47127 - PLACE
      ?auto_47131 - HOIST
      ?auto_47118 - SURFACE
      ?auto_47126 - SURFACE
      ?auto_47125 - PLACE
      ?auto_47130 - HOIST
      ?auto_47122 - SURFACE
      ?auto_47129 - TRUCK
      ?auto_47121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47124 ?auto_47123 ) ( IS-CRATE ?auto_47116 ) ( not ( = ?auto_47116 ?auto_47117 ) ) ( not ( = ?auto_47128 ?auto_47123 ) ) ( HOIST-AT ?auto_47119 ?auto_47128 ) ( not ( = ?auto_47124 ?auto_47119 ) ) ( AVAILABLE ?auto_47119 ) ( SURFACE-AT ?auto_47116 ?auto_47128 ) ( ON ?auto_47116 ?auto_47132 ) ( CLEAR ?auto_47116 ) ( not ( = ?auto_47116 ?auto_47132 ) ) ( not ( = ?auto_47117 ?auto_47132 ) ) ( IS-CRATE ?auto_47117 ) ( not ( = ?auto_47116 ?auto_47120 ) ) ( not ( = ?auto_47117 ?auto_47120 ) ) ( not ( = ?auto_47132 ?auto_47120 ) ) ( not ( = ?auto_47127 ?auto_47123 ) ) ( not ( = ?auto_47128 ?auto_47127 ) ) ( HOIST-AT ?auto_47131 ?auto_47127 ) ( not ( = ?auto_47124 ?auto_47131 ) ) ( not ( = ?auto_47119 ?auto_47131 ) ) ( AVAILABLE ?auto_47131 ) ( SURFACE-AT ?auto_47117 ?auto_47127 ) ( ON ?auto_47117 ?auto_47118 ) ( CLEAR ?auto_47117 ) ( not ( = ?auto_47116 ?auto_47118 ) ) ( not ( = ?auto_47117 ?auto_47118 ) ) ( not ( = ?auto_47132 ?auto_47118 ) ) ( not ( = ?auto_47120 ?auto_47118 ) ) ( IS-CRATE ?auto_47120 ) ( not ( = ?auto_47116 ?auto_47126 ) ) ( not ( = ?auto_47117 ?auto_47126 ) ) ( not ( = ?auto_47132 ?auto_47126 ) ) ( not ( = ?auto_47120 ?auto_47126 ) ) ( not ( = ?auto_47118 ?auto_47126 ) ) ( not ( = ?auto_47125 ?auto_47123 ) ) ( not ( = ?auto_47128 ?auto_47125 ) ) ( not ( = ?auto_47127 ?auto_47125 ) ) ( HOIST-AT ?auto_47130 ?auto_47125 ) ( not ( = ?auto_47124 ?auto_47130 ) ) ( not ( = ?auto_47119 ?auto_47130 ) ) ( not ( = ?auto_47131 ?auto_47130 ) ) ( AVAILABLE ?auto_47130 ) ( SURFACE-AT ?auto_47120 ?auto_47125 ) ( ON ?auto_47120 ?auto_47122 ) ( CLEAR ?auto_47120 ) ( not ( = ?auto_47116 ?auto_47122 ) ) ( not ( = ?auto_47117 ?auto_47122 ) ) ( not ( = ?auto_47132 ?auto_47122 ) ) ( not ( = ?auto_47120 ?auto_47122 ) ) ( not ( = ?auto_47118 ?auto_47122 ) ) ( not ( = ?auto_47126 ?auto_47122 ) ) ( TRUCK-AT ?auto_47129 ?auto_47123 ) ( SURFACE-AT ?auto_47121 ?auto_47123 ) ( CLEAR ?auto_47121 ) ( IS-CRATE ?auto_47126 ) ( not ( = ?auto_47116 ?auto_47121 ) ) ( not ( = ?auto_47117 ?auto_47121 ) ) ( not ( = ?auto_47132 ?auto_47121 ) ) ( not ( = ?auto_47120 ?auto_47121 ) ) ( not ( = ?auto_47118 ?auto_47121 ) ) ( not ( = ?auto_47126 ?auto_47121 ) ) ( not ( = ?auto_47122 ?auto_47121 ) ) ( AVAILABLE ?auto_47124 ) ( IN ?auto_47126 ?auto_47129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47124 ?auto_47126 ?auto_47129 ?auto_47123 )
      ( MAKE-ON ?auto_47116 ?auto_47117 )
      ( MAKE-ON-VERIFY ?auto_47116 ?auto_47117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47133 - SURFACE
      ?auto_47134 - SURFACE
    )
    :vars
    (
      ?auto_47142 - HOIST
      ?auto_47138 - PLACE
      ?auto_47148 - PLACE
      ?auto_47147 - HOIST
      ?auto_47145 - SURFACE
      ?auto_47135 - SURFACE
      ?auto_47146 - PLACE
      ?auto_47149 - HOIST
      ?auto_47137 - SURFACE
      ?auto_47143 - SURFACE
      ?auto_47139 - PLACE
      ?auto_47141 - HOIST
      ?auto_47140 - SURFACE
      ?auto_47136 - SURFACE
      ?auto_47144 - TRUCK
      ?auto_47150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47142 ?auto_47138 ) ( IS-CRATE ?auto_47133 ) ( not ( = ?auto_47133 ?auto_47134 ) ) ( not ( = ?auto_47148 ?auto_47138 ) ) ( HOIST-AT ?auto_47147 ?auto_47148 ) ( not ( = ?auto_47142 ?auto_47147 ) ) ( AVAILABLE ?auto_47147 ) ( SURFACE-AT ?auto_47133 ?auto_47148 ) ( ON ?auto_47133 ?auto_47145 ) ( CLEAR ?auto_47133 ) ( not ( = ?auto_47133 ?auto_47145 ) ) ( not ( = ?auto_47134 ?auto_47145 ) ) ( IS-CRATE ?auto_47134 ) ( not ( = ?auto_47133 ?auto_47135 ) ) ( not ( = ?auto_47134 ?auto_47135 ) ) ( not ( = ?auto_47145 ?auto_47135 ) ) ( not ( = ?auto_47146 ?auto_47138 ) ) ( not ( = ?auto_47148 ?auto_47146 ) ) ( HOIST-AT ?auto_47149 ?auto_47146 ) ( not ( = ?auto_47142 ?auto_47149 ) ) ( not ( = ?auto_47147 ?auto_47149 ) ) ( AVAILABLE ?auto_47149 ) ( SURFACE-AT ?auto_47134 ?auto_47146 ) ( ON ?auto_47134 ?auto_47137 ) ( CLEAR ?auto_47134 ) ( not ( = ?auto_47133 ?auto_47137 ) ) ( not ( = ?auto_47134 ?auto_47137 ) ) ( not ( = ?auto_47145 ?auto_47137 ) ) ( not ( = ?auto_47135 ?auto_47137 ) ) ( IS-CRATE ?auto_47135 ) ( not ( = ?auto_47133 ?auto_47143 ) ) ( not ( = ?auto_47134 ?auto_47143 ) ) ( not ( = ?auto_47145 ?auto_47143 ) ) ( not ( = ?auto_47135 ?auto_47143 ) ) ( not ( = ?auto_47137 ?auto_47143 ) ) ( not ( = ?auto_47139 ?auto_47138 ) ) ( not ( = ?auto_47148 ?auto_47139 ) ) ( not ( = ?auto_47146 ?auto_47139 ) ) ( HOIST-AT ?auto_47141 ?auto_47139 ) ( not ( = ?auto_47142 ?auto_47141 ) ) ( not ( = ?auto_47147 ?auto_47141 ) ) ( not ( = ?auto_47149 ?auto_47141 ) ) ( AVAILABLE ?auto_47141 ) ( SURFACE-AT ?auto_47135 ?auto_47139 ) ( ON ?auto_47135 ?auto_47140 ) ( CLEAR ?auto_47135 ) ( not ( = ?auto_47133 ?auto_47140 ) ) ( not ( = ?auto_47134 ?auto_47140 ) ) ( not ( = ?auto_47145 ?auto_47140 ) ) ( not ( = ?auto_47135 ?auto_47140 ) ) ( not ( = ?auto_47137 ?auto_47140 ) ) ( not ( = ?auto_47143 ?auto_47140 ) ) ( SURFACE-AT ?auto_47136 ?auto_47138 ) ( CLEAR ?auto_47136 ) ( IS-CRATE ?auto_47143 ) ( not ( = ?auto_47133 ?auto_47136 ) ) ( not ( = ?auto_47134 ?auto_47136 ) ) ( not ( = ?auto_47145 ?auto_47136 ) ) ( not ( = ?auto_47135 ?auto_47136 ) ) ( not ( = ?auto_47137 ?auto_47136 ) ) ( not ( = ?auto_47143 ?auto_47136 ) ) ( not ( = ?auto_47140 ?auto_47136 ) ) ( AVAILABLE ?auto_47142 ) ( IN ?auto_47143 ?auto_47144 ) ( TRUCK-AT ?auto_47144 ?auto_47150 ) ( not ( = ?auto_47150 ?auto_47138 ) ) ( not ( = ?auto_47148 ?auto_47150 ) ) ( not ( = ?auto_47146 ?auto_47150 ) ) ( not ( = ?auto_47139 ?auto_47150 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47144 ?auto_47150 ?auto_47138 )
      ( MAKE-ON ?auto_47133 ?auto_47134 )
      ( MAKE-ON-VERIFY ?auto_47133 ?auto_47134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47151 - SURFACE
      ?auto_47152 - SURFACE
    )
    :vars
    (
      ?auto_47165 - HOIST
      ?auto_47162 - PLACE
      ?auto_47164 - PLACE
      ?auto_47154 - HOIST
      ?auto_47161 - SURFACE
      ?auto_47168 - SURFACE
      ?auto_47153 - PLACE
      ?auto_47163 - HOIST
      ?auto_47160 - SURFACE
      ?auto_47167 - SURFACE
      ?auto_47155 - PLACE
      ?auto_47166 - HOIST
      ?auto_47158 - SURFACE
      ?auto_47159 - SURFACE
      ?auto_47156 - TRUCK
      ?auto_47157 - PLACE
      ?auto_47169 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47165 ?auto_47162 ) ( IS-CRATE ?auto_47151 ) ( not ( = ?auto_47151 ?auto_47152 ) ) ( not ( = ?auto_47164 ?auto_47162 ) ) ( HOIST-AT ?auto_47154 ?auto_47164 ) ( not ( = ?auto_47165 ?auto_47154 ) ) ( AVAILABLE ?auto_47154 ) ( SURFACE-AT ?auto_47151 ?auto_47164 ) ( ON ?auto_47151 ?auto_47161 ) ( CLEAR ?auto_47151 ) ( not ( = ?auto_47151 ?auto_47161 ) ) ( not ( = ?auto_47152 ?auto_47161 ) ) ( IS-CRATE ?auto_47152 ) ( not ( = ?auto_47151 ?auto_47168 ) ) ( not ( = ?auto_47152 ?auto_47168 ) ) ( not ( = ?auto_47161 ?auto_47168 ) ) ( not ( = ?auto_47153 ?auto_47162 ) ) ( not ( = ?auto_47164 ?auto_47153 ) ) ( HOIST-AT ?auto_47163 ?auto_47153 ) ( not ( = ?auto_47165 ?auto_47163 ) ) ( not ( = ?auto_47154 ?auto_47163 ) ) ( AVAILABLE ?auto_47163 ) ( SURFACE-AT ?auto_47152 ?auto_47153 ) ( ON ?auto_47152 ?auto_47160 ) ( CLEAR ?auto_47152 ) ( not ( = ?auto_47151 ?auto_47160 ) ) ( not ( = ?auto_47152 ?auto_47160 ) ) ( not ( = ?auto_47161 ?auto_47160 ) ) ( not ( = ?auto_47168 ?auto_47160 ) ) ( IS-CRATE ?auto_47168 ) ( not ( = ?auto_47151 ?auto_47167 ) ) ( not ( = ?auto_47152 ?auto_47167 ) ) ( not ( = ?auto_47161 ?auto_47167 ) ) ( not ( = ?auto_47168 ?auto_47167 ) ) ( not ( = ?auto_47160 ?auto_47167 ) ) ( not ( = ?auto_47155 ?auto_47162 ) ) ( not ( = ?auto_47164 ?auto_47155 ) ) ( not ( = ?auto_47153 ?auto_47155 ) ) ( HOIST-AT ?auto_47166 ?auto_47155 ) ( not ( = ?auto_47165 ?auto_47166 ) ) ( not ( = ?auto_47154 ?auto_47166 ) ) ( not ( = ?auto_47163 ?auto_47166 ) ) ( AVAILABLE ?auto_47166 ) ( SURFACE-AT ?auto_47168 ?auto_47155 ) ( ON ?auto_47168 ?auto_47158 ) ( CLEAR ?auto_47168 ) ( not ( = ?auto_47151 ?auto_47158 ) ) ( not ( = ?auto_47152 ?auto_47158 ) ) ( not ( = ?auto_47161 ?auto_47158 ) ) ( not ( = ?auto_47168 ?auto_47158 ) ) ( not ( = ?auto_47160 ?auto_47158 ) ) ( not ( = ?auto_47167 ?auto_47158 ) ) ( SURFACE-AT ?auto_47159 ?auto_47162 ) ( CLEAR ?auto_47159 ) ( IS-CRATE ?auto_47167 ) ( not ( = ?auto_47151 ?auto_47159 ) ) ( not ( = ?auto_47152 ?auto_47159 ) ) ( not ( = ?auto_47161 ?auto_47159 ) ) ( not ( = ?auto_47168 ?auto_47159 ) ) ( not ( = ?auto_47160 ?auto_47159 ) ) ( not ( = ?auto_47167 ?auto_47159 ) ) ( not ( = ?auto_47158 ?auto_47159 ) ) ( AVAILABLE ?auto_47165 ) ( TRUCK-AT ?auto_47156 ?auto_47157 ) ( not ( = ?auto_47157 ?auto_47162 ) ) ( not ( = ?auto_47164 ?auto_47157 ) ) ( not ( = ?auto_47153 ?auto_47157 ) ) ( not ( = ?auto_47155 ?auto_47157 ) ) ( HOIST-AT ?auto_47169 ?auto_47157 ) ( LIFTING ?auto_47169 ?auto_47167 ) ( not ( = ?auto_47165 ?auto_47169 ) ) ( not ( = ?auto_47154 ?auto_47169 ) ) ( not ( = ?auto_47163 ?auto_47169 ) ) ( not ( = ?auto_47166 ?auto_47169 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47169 ?auto_47167 ?auto_47156 ?auto_47157 )
      ( MAKE-ON ?auto_47151 ?auto_47152 )
      ( MAKE-ON-VERIFY ?auto_47151 ?auto_47152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47170 - SURFACE
      ?auto_47171 - SURFACE
    )
    :vars
    (
      ?auto_47173 - HOIST
      ?auto_47185 - PLACE
      ?auto_47184 - PLACE
      ?auto_47188 - HOIST
      ?auto_47176 - SURFACE
      ?auto_47175 - SURFACE
      ?auto_47181 - PLACE
      ?auto_47183 - HOIST
      ?auto_47187 - SURFACE
      ?auto_47182 - SURFACE
      ?auto_47186 - PLACE
      ?auto_47178 - HOIST
      ?auto_47179 - SURFACE
      ?auto_47172 - SURFACE
      ?auto_47174 - TRUCK
      ?auto_47180 - PLACE
      ?auto_47177 - HOIST
      ?auto_47189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47173 ?auto_47185 ) ( IS-CRATE ?auto_47170 ) ( not ( = ?auto_47170 ?auto_47171 ) ) ( not ( = ?auto_47184 ?auto_47185 ) ) ( HOIST-AT ?auto_47188 ?auto_47184 ) ( not ( = ?auto_47173 ?auto_47188 ) ) ( AVAILABLE ?auto_47188 ) ( SURFACE-AT ?auto_47170 ?auto_47184 ) ( ON ?auto_47170 ?auto_47176 ) ( CLEAR ?auto_47170 ) ( not ( = ?auto_47170 ?auto_47176 ) ) ( not ( = ?auto_47171 ?auto_47176 ) ) ( IS-CRATE ?auto_47171 ) ( not ( = ?auto_47170 ?auto_47175 ) ) ( not ( = ?auto_47171 ?auto_47175 ) ) ( not ( = ?auto_47176 ?auto_47175 ) ) ( not ( = ?auto_47181 ?auto_47185 ) ) ( not ( = ?auto_47184 ?auto_47181 ) ) ( HOIST-AT ?auto_47183 ?auto_47181 ) ( not ( = ?auto_47173 ?auto_47183 ) ) ( not ( = ?auto_47188 ?auto_47183 ) ) ( AVAILABLE ?auto_47183 ) ( SURFACE-AT ?auto_47171 ?auto_47181 ) ( ON ?auto_47171 ?auto_47187 ) ( CLEAR ?auto_47171 ) ( not ( = ?auto_47170 ?auto_47187 ) ) ( not ( = ?auto_47171 ?auto_47187 ) ) ( not ( = ?auto_47176 ?auto_47187 ) ) ( not ( = ?auto_47175 ?auto_47187 ) ) ( IS-CRATE ?auto_47175 ) ( not ( = ?auto_47170 ?auto_47182 ) ) ( not ( = ?auto_47171 ?auto_47182 ) ) ( not ( = ?auto_47176 ?auto_47182 ) ) ( not ( = ?auto_47175 ?auto_47182 ) ) ( not ( = ?auto_47187 ?auto_47182 ) ) ( not ( = ?auto_47186 ?auto_47185 ) ) ( not ( = ?auto_47184 ?auto_47186 ) ) ( not ( = ?auto_47181 ?auto_47186 ) ) ( HOIST-AT ?auto_47178 ?auto_47186 ) ( not ( = ?auto_47173 ?auto_47178 ) ) ( not ( = ?auto_47188 ?auto_47178 ) ) ( not ( = ?auto_47183 ?auto_47178 ) ) ( AVAILABLE ?auto_47178 ) ( SURFACE-AT ?auto_47175 ?auto_47186 ) ( ON ?auto_47175 ?auto_47179 ) ( CLEAR ?auto_47175 ) ( not ( = ?auto_47170 ?auto_47179 ) ) ( not ( = ?auto_47171 ?auto_47179 ) ) ( not ( = ?auto_47176 ?auto_47179 ) ) ( not ( = ?auto_47175 ?auto_47179 ) ) ( not ( = ?auto_47187 ?auto_47179 ) ) ( not ( = ?auto_47182 ?auto_47179 ) ) ( SURFACE-AT ?auto_47172 ?auto_47185 ) ( CLEAR ?auto_47172 ) ( IS-CRATE ?auto_47182 ) ( not ( = ?auto_47170 ?auto_47172 ) ) ( not ( = ?auto_47171 ?auto_47172 ) ) ( not ( = ?auto_47176 ?auto_47172 ) ) ( not ( = ?auto_47175 ?auto_47172 ) ) ( not ( = ?auto_47187 ?auto_47172 ) ) ( not ( = ?auto_47182 ?auto_47172 ) ) ( not ( = ?auto_47179 ?auto_47172 ) ) ( AVAILABLE ?auto_47173 ) ( TRUCK-AT ?auto_47174 ?auto_47180 ) ( not ( = ?auto_47180 ?auto_47185 ) ) ( not ( = ?auto_47184 ?auto_47180 ) ) ( not ( = ?auto_47181 ?auto_47180 ) ) ( not ( = ?auto_47186 ?auto_47180 ) ) ( HOIST-AT ?auto_47177 ?auto_47180 ) ( not ( = ?auto_47173 ?auto_47177 ) ) ( not ( = ?auto_47188 ?auto_47177 ) ) ( not ( = ?auto_47183 ?auto_47177 ) ) ( not ( = ?auto_47178 ?auto_47177 ) ) ( AVAILABLE ?auto_47177 ) ( SURFACE-AT ?auto_47182 ?auto_47180 ) ( ON ?auto_47182 ?auto_47189 ) ( CLEAR ?auto_47182 ) ( not ( = ?auto_47170 ?auto_47189 ) ) ( not ( = ?auto_47171 ?auto_47189 ) ) ( not ( = ?auto_47176 ?auto_47189 ) ) ( not ( = ?auto_47175 ?auto_47189 ) ) ( not ( = ?auto_47187 ?auto_47189 ) ) ( not ( = ?auto_47182 ?auto_47189 ) ) ( not ( = ?auto_47179 ?auto_47189 ) ) ( not ( = ?auto_47172 ?auto_47189 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47177 ?auto_47182 ?auto_47189 ?auto_47180 )
      ( MAKE-ON ?auto_47170 ?auto_47171 )
      ( MAKE-ON-VERIFY ?auto_47170 ?auto_47171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47190 - SURFACE
      ?auto_47191 - SURFACE
    )
    :vars
    (
      ?auto_47205 - HOIST
      ?auto_47202 - PLACE
      ?auto_47208 - PLACE
      ?auto_47195 - HOIST
      ?auto_47192 - SURFACE
      ?auto_47194 - SURFACE
      ?auto_47200 - PLACE
      ?auto_47206 - HOIST
      ?auto_47209 - SURFACE
      ?auto_47207 - SURFACE
      ?auto_47193 - PLACE
      ?auto_47203 - HOIST
      ?auto_47198 - SURFACE
      ?auto_47196 - SURFACE
      ?auto_47201 - PLACE
      ?auto_47197 - HOIST
      ?auto_47204 - SURFACE
      ?auto_47199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47205 ?auto_47202 ) ( IS-CRATE ?auto_47190 ) ( not ( = ?auto_47190 ?auto_47191 ) ) ( not ( = ?auto_47208 ?auto_47202 ) ) ( HOIST-AT ?auto_47195 ?auto_47208 ) ( not ( = ?auto_47205 ?auto_47195 ) ) ( AVAILABLE ?auto_47195 ) ( SURFACE-AT ?auto_47190 ?auto_47208 ) ( ON ?auto_47190 ?auto_47192 ) ( CLEAR ?auto_47190 ) ( not ( = ?auto_47190 ?auto_47192 ) ) ( not ( = ?auto_47191 ?auto_47192 ) ) ( IS-CRATE ?auto_47191 ) ( not ( = ?auto_47190 ?auto_47194 ) ) ( not ( = ?auto_47191 ?auto_47194 ) ) ( not ( = ?auto_47192 ?auto_47194 ) ) ( not ( = ?auto_47200 ?auto_47202 ) ) ( not ( = ?auto_47208 ?auto_47200 ) ) ( HOIST-AT ?auto_47206 ?auto_47200 ) ( not ( = ?auto_47205 ?auto_47206 ) ) ( not ( = ?auto_47195 ?auto_47206 ) ) ( AVAILABLE ?auto_47206 ) ( SURFACE-AT ?auto_47191 ?auto_47200 ) ( ON ?auto_47191 ?auto_47209 ) ( CLEAR ?auto_47191 ) ( not ( = ?auto_47190 ?auto_47209 ) ) ( not ( = ?auto_47191 ?auto_47209 ) ) ( not ( = ?auto_47192 ?auto_47209 ) ) ( not ( = ?auto_47194 ?auto_47209 ) ) ( IS-CRATE ?auto_47194 ) ( not ( = ?auto_47190 ?auto_47207 ) ) ( not ( = ?auto_47191 ?auto_47207 ) ) ( not ( = ?auto_47192 ?auto_47207 ) ) ( not ( = ?auto_47194 ?auto_47207 ) ) ( not ( = ?auto_47209 ?auto_47207 ) ) ( not ( = ?auto_47193 ?auto_47202 ) ) ( not ( = ?auto_47208 ?auto_47193 ) ) ( not ( = ?auto_47200 ?auto_47193 ) ) ( HOIST-AT ?auto_47203 ?auto_47193 ) ( not ( = ?auto_47205 ?auto_47203 ) ) ( not ( = ?auto_47195 ?auto_47203 ) ) ( not ( = ?auto_47206 ?auto_47203 ) ) ( AVAILABLE ?auto_47203 ) ( SURFACE-AT ?auto_47194 ?auto_47193 ) ( ON ?auto_47194 ?auto_47198 ) ( CLEAR ?auto_47194 ) ( not ( = ?auto_47190 ?auto_47198 ) ) ( not ( = ?auto_47191 ?auto_47198 ) ) ( not ( = ?auto_47192 ?auto_47198 ) ) ( not ( = ?auto_47194 ?auto_47198 ) ) ( not ( = ?auto_47209 ?auto_47198 ) ) ( not ( = ?auto_47207 ?auto_47198 ) ) ( SURFACE-AT ?auto_47196 ?auto_47202 ) ( CLEAR ?auto_47196 ) ( IS-CRATE ?auto_47207 ) ( not ( = ?auto_47190 ?auto_47196 ) ) ( not ( = ?auto_47191 ?auto_47196 ) ) ( not ( = ?auto_47192 ?auto_47196 ) ) ( not ( = ?auto_47194 ?auto_47196 ) ) ( not ( = ?auto_47209 ?auto_47196 ) ) ( not ( = ?auto_47207 ?auto_47196 ) ) ( not ( = ?auto_47198 ?auto_47196 ) ) ( AVAILABLE ?auto_47205 ) ( not ( = ?auto_47201 ?auto_47202 ) ) ( not ( = ?auto_47208 ?auto_47201 ) ) ( not ( = ?auto_47200 ?auto_47201 ) ) ( not ( = ?auto_47193 ?auto_47201 ) ) ( HOIST-AT ?auto_47197 ?auto_47201 ) ( not ( = ?auto_47205 ?auto_47197 ) ) ( not ( = ?auto_47195 ?auto_47197 ) ) ( not ( = ?auto_47206 ?auto_47197 ) ) ( not ( = ?auto_47203 ?auto_47197 ) ) ( AVAILABLE ?auto_47197 ) ( SURFACE-AT ?auto_47207 ?auto_47201 ) ( ON ?auto_47207 ?auto_47204 ) ( CLEAR ?auto_47207 ) ( not ( = ?auto_47190 ?auto_47204 ) ) ( not ( = ?auto_47191 ?auto_47204 ) ) ( not ( = ?auto_47192 ?auto_47204 ) ) ( not ( = ?auto_47194 ?auto_47204 ) ) ( not ( = ?auto_47209 ?auto_47204 ) ) ( not ( = ?auto_47207 ?auto_47204 ) ) ( not ( = ?auto_47198 ?auto_47204 ) ) ( not ( = ?auto_47196 ?auto_47204 ) ) ( TRUCK-AT ?auto_47199 ?auto_47202 ) )
    :subtasks
    ( ( !DRIVE ?auto_47199 ?auto_47202 ?auto_47201 )
      ( MAKE-ON ?auto_47190 ?auto_47191 )
      ( MAKE-ON-VERIFY ?auto_47190 ?auto_47191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47210 - SURFACE
      ?auto_47211 - SURFACE
    )
    :vars
    (
      ?auto_47220 - HOIST
      ?auto_47225 - PLACE
      ?auto_47226 - PLACE
      ?auto_47218 - HOIST
      ?auto_47213 - SURFACE
      ?auto_47219 - SURFACE
      ?auto_47222 - PLACE
      ?auto_47216 - HOIST
      ?auto_47227 - SURFACE
      ?auto_47221 - SURFACE
      ?auto_47214 - PLACE
      ?auto_47223 - HOIST
      ?auto_47224 - SURFACE
      ?auto_47229 - SURFACE
      ?auto_47217 - PLACE
      ?auto_47212 - HOIST
      ?auto_47228 - SURFACE
      ?auto_47215 - TRUCK
      ?auto_47230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47220 ?auto_47225 ) ( IS-CRATE ?auto_47210 ) ( not ( = ?auto_47210 ?auto_47211 ) ) ( not ( = ?auto_47226 ?auto_47225 ) ) ( HOIST-AT ?auto_47218 ?auto_47226 ) ( not ( = ?auto_47220 ?auto_47218 ) ) ( AVAILABLE ?auto_47218 ) ( SURFACE-AT ?auto_47210 ?auto_47226 ) ( ON ?auto_47210 ?auto_47213 ) ( CLEAR ?auto_47210 ) ( not ( = ?auto_47210 ?auto_47213 ) ) ( not ( = ?auto_47211 ?auto_47213 ) ) ( IS-CRATE ?auto_47211 ) ( not ( = ?auto_47210 ?auto_47219 ) ) ( not ( = ?auto_47211 ?auto_47219 ) ) ( not ( = ?auto_47213 ?auto_47219 ) ) ( not ( = ?auto_47222 ?auto_47225 ) ) ( not ( = ?auto_47226 ?auto_47222 ) ) ( HOIST-AT ?auto_47216 ?auto_47222 ) ( not ( = ?auto_47220 ?auto_47216 ) ) ( not ( = ?auto_47218 ?auto_47216 ) ) ( AVAILABLE ?auto_47216 ) ( SURFACE-AT ?auto_47211 ?auto_47222 ) ( ON ?auto_47211 ?auto_47227 ) ( CLEAR ?auto_47211 ) ( not ( = ?auto_47210 ?auto_47227 ) ) ( not ( = ?auto_47211 ?auto_47227 ) ) ( not ( = ?auto_47213 ?auto_47227 ) ) ( not ( = ?auto_47219 ?auto_47227 ) ) ( IS-CRATE ?auto_47219 ) ( not ( = ?auto_47210 ?auto_47221 ) ) ( not ( = ?auto_47211 ?auto_47221 ) ) ( not ( = ?auto_47213 ?auto_47221 ) ) ( not ( = ?auto_47219 ?auto_47221 ) ) ( not ( = ?auto_47227 ?auto_47221 ) ) ( not ( = ?auto_47214 ?auto_47225 ) ) ( not ( = ?auto_47226 ?auto_47214 ) ) ( not ( = ?auto_47222 ?auto_47214 ) ) ( HOIST-AT ?auto_47223 ?auto_47214 ) ( not ( = ?auto_47220 ?auto_47223 ) ) ( not ( = ?auto_47218 ?auto_47223 ) ) ( not ( = ?auto_47216 ?auto_47223 ) ) ( AVAILABLE ?auto_47223 ) ( SURFACE-AT ?auto_47219 ?auto_47214 ) ( ON ?auto_47219 ?auto_47224 ) ( CLEAR ?auto_47219 ) ( not ( = ?auto_47210 ?auto_47224 ) ) ( not ( = ?auto_47211 ?auto_47224 ) ) ( not ( = ?auto_47213 ?auto_47224 ) ) ( not ( = ?auto_47219 ?auto_47224 ) ) ( not ( = ?auto_47227 ?auto_47224 ) ) ( not ( = ?auto_47221 ?auto_47224 ) ) ( IS-CRATE ?auto_47221 ) ( not ( = ?auto_47210 ?auto_47229 ) ) ( not ( = ?auto_47211 ?auto_47229 ) ) ( not ( = ?auto_47213 ?auto_47229 ) ) ( not ( = ?auto_47219 ?auto_47229 ) ) ( not ( = ?auto_47227 ?auto_47229 ) ) ( not ( = ?auto_47221 ?auto_47229 ) ) ( not ( = ?auto_47224 ?auto_47229 ) ) ( not ( = ?auto_47217 ?auto_47225 ) ) ( not ( = ?auto_47226 ?auto_47217 ) ) ( not ( = ?auto_47222 ?auto_47217 ) ) ( not ( = ?auto_47214 ?auto_47217 ) ) ( HOIST-AT ?auto_47212 ?auto_47217 ) ( not ( = ?auto_47220 ?auto_47212 ) ) ( not ( = ?auto_47218 ?auto_47212 ) ) ( not ( = ?auto_47216 ?auto_47212 ) ) ( not ( = ?auto_47223 ?auto_47212 ) ) ( AVAILABLE ?auto_47212 ) ( SURFACE-AT ?auto_47221 ?auto_47217 ) ( ON ?auto_47221 ?auto_47228 ) ( CLEAR ?auto_47221 ) ( not ( = ?auto_47210 ?auto_47228 ) ) ( not ( = ?auto_47211 ?auto_47228 ) ) ( not ( = ?auto_47213 ?auto_47228 ) ) ( not ( = ?auto_47219 ?auto_47228 ) ) ( not ( = ?auto_47227 ?auto_47228 ) ) ( not ( = ?auto_47221 ?auto_47228 ) ) ( not ( = ?auto_47224 ?auto_47228 ) ) ( not ( = ?auto_47229 ?auto_47228 ) ) ( TRUCK-AT ?auto_47215 ?auto_47225 ) ( SURFACE-AT ?auto_47230 ?auto_47225 ) ( CLEAR ?auto_47230 ) ( LIFTING ?auto_47220 ?auto_47229 ) ( IS-CRATE ?auto_47229 ) ( not ( = ?auto_47210 ?auto_47230 ) ) ( not ( = ?auto_47211 ?auto_47230 ) ) ( not ( = ?auto_47213 ?auto_47230 ) ) ( not ( = ?auto_47219 ?auto_47230 ) ) ( not ( = ?auto_47227 ?auto_47230 ) ) ( not ( = ?auto_47221 ?auto_47230 ) ) ( not ( = ?auto_47224 ?auto_47230 ) ) ( not ( = ?auto_47229 ?auto_47230 ) ) ( not ( = ?auto_47228 ?auto_47230 ) ) )
    :subtasks
    ( ( !DROP ?auto_47220 ?auto_47229 ?auto_47230 ?auto_47225 )
      ( MAKE-ON ?auto_47210 ?auto_47211 )
      ( MAKE-ON-VERIFY ?auto_47210 ?auto_47211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47231 - SURFACE
      ?auto_47232 - SURFACE
    )
    :vars
    (
      ?auto_47233 - HOIST
      ?auto_47248 - PLACE
      ?auto_47235 - PLACE
      ?auto_47241 - HOIST
      ?auto_47246 - SURFACE
      ?auto_47249 - SURFACE
      ?auto_47240 - PLACE
      ?auto_47238 - HOIST
      ?auto_47244 - SURFACE
      ?auto_47234 - SURFACE
      ?auto_47247 - PLACE
      ?auto_47250 - HOIST
      ?auto_47236 - SURFACE
      ?auto_47237 - SURFACE
      ?auto_47239 - PLACE
      ?auto_47242 - HOIST
      ?auto_47251 - SURFACE
      ?auto_47245 - TRUCK
      ?auto_47243 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47233 ?auto_47248 ) ( IS-CRATE ?auto_47231 ) ( not ( = ?auto_47231 ?auto_47232 ) ) ( not ( = ?auto_47235 ?auto_47248 ) ) ( HOIST-AT ?auto_47241 ?auto_47235 ) ( not ( = ?auto_47233 ?auto_47241 ) ) ( AVAILABLE ?auto_47241 ) ( SURFACE-AT ?auto_47231 ?auto_47235 ) ( ON ?auto_47231 ?auto_47246 ) ( CLEAR ?auto_47231 ) ( not ( = ?auto_47231 ?auto_47246 ) ) ( not ( = ?auto_47232 ?auto_47246 ) ) ( IS-CRATE ?auto_47232 ) ( not ( = ?auto_47231 ?auto_47249 ) ) ( not ( = ?auto_47232 ?auto_47249 ) ) ( not ( = ?auto_47246 ?auto_47249 ) ) ( not ( = ?auto_47240 ?auto_47248 ) ) ( not ( = ?auto_47235 ?auto_47240 ) ) ( HOIST-AT ?auto_47238 ?auto_47240 ) ( not ( = ?auto_47233 ?auto_47238 ) ) ( not ( = ?auto_47241 ?auto_47238 ) ) ( AVAILABLE ?auto_47238 ) ( SURFACE-AT ?auto_47232 ?auto_47240 ) ( ON ?auto_47232 ?auto_47244 ) ( CLEAR ?auto_47232 ) ( not ( = ?auto_47231 ?auto_47244 ) ) ( not ( = ?auto_47232 ?auto_47244 ) ) ( not ( = ?auto_47246 ?auto_47244 ) ) ( not ( = ?auto_47249 ?auto_47244 ) ) ( IS-CRATE ?auto_47249 ) ( not ( = ?auto_47231 ?auto_47234 ) ) ( not ( = ?auto_47232 ?auto_47234 ) ) ( not ( = ?auto_47246 ?auto_47234 ) ) ( not ( = ?auto_47249 ?auto_47234 ) ) ( not ( = ?auto_47244 ?auto_47234 ) ) ( not ( = ?auto_47247 ?auto_47248 ) ) ( not ( = ?auto_47235 ?auto_47247 ) ) ( not ( = ?auto_47240 ?auto_47247 ) ) ( HOIST-AT ?auto_47250 ?auto_47247 ) ( not ( = ?auto_47233 ?auto_47250 ) ) ( not ( = ?auto_47241 ?auto_47250 ) ) ( not ( = ?auto_47238 ?auto_47250 ) ) ( AVAILABLE ?auto_47250 ) ( SURFACE-AT ?auto_47249 ?auto_47247 ) ( ON ?auto_47249 ?auto_47236 ) ( CLEAR ?auto_47249 ) ( not ( = ?auto_47231 ?auto_47236 ) ) ( not ( = ?auto_47232 ?auto_47236 ) ) ( not ( = ?auto_47246 ?auto_47236 ) ) ( not ( = ?auto_47249 ?auto_47236 ) ) ( not ( = ?auto_47244 ?auto_47236 ) ) ( not ( = ?auto_47234 ?auto_47236 ) ) ( IS-CRATE ?auto_47234 ) ( not ( = ?auto_47231 ?auto_47237 ) ) ( not ( = ?auto_47232 ?auto_47237 ) ) ( not ( = ?auto_47246 ?auto_47237 ) ) ( not ( = ?auto_47249 ?auto_47237 ) ) ( not ( = ?auto_47244 ?auto_47237 ) ) ( not ( = ?auto_47234 ?auto_47237 ) ) ( not ( = ?auto_47236 ?auto_47237 ) ) ( not ( = ?auto_47239 ?auto_47248 ) ) ( not ( = ?auto_47235 ?auto_47239 ) ) ( not ( = ?auto_47240 ?auto_47239 ) ) ( not ( = ?auto_47247 ?auto_47239 ) ) ( HOIST-AT ?auto_47242 ?auto_47239 ) ( not ( = ?auto_47233 ?auto_47242 ) ) ( not ( = ?auto_47241 ?auto_47242 ) ) ( not ( = ?auto_47238 ?auto_47242 ) ) ( not ( = ?auto_47250 ?auto_47242 ) ) ( AVAILABLE ?auto_47242 ) ( SURFACE-AT ?auto_47234 ?auto_47239 ) ( ON ?auto_47234 ?auto_47251 ) ( CLEAR ?auto_47234 ) ( not ( = ?auto_47231 ?auto_47251 ) ) ( not ( = ?auto_47232 ?auto_47251 ) ) ( not ( = ?auto_47246 ?auto_47251 ) ) ( not ( = ?auto_47249 ?auto_47251 ) ) ( not ( = ?auto_47244 ?auto_47251 ) ) ( not ( = ?auto_47234 ?auto_47251 ) ) ( not ( = ?auto_47236 ?auto_47251 ) ) ( not ( = ?auto_47237 ?auto_47251 ) ) ( TRUCK-AT ?auto_47245 ?auto_47248 ) ( SURFACE-AT ?auto_47243 ?auto_47248 ) ( CLEAR ?auto_47243 ) ( IS-CRATE ?auto_47237 ) ( not ( = ?auto_47231 ?auto_47243 ) ) ( not ( = ?auto_47232 ?auto_47243 ) ) ( not ( = ?auto_47246 ?auto_47243 ) ) ( not ( = ?auto_47249 ?auto_47243 ) ) ( not ( = ?auto_47244 ?auto_47243 ) ) ( not ( = ?auto_47234 ?auto_47243 ) ) ( not ( = ?auto_47236 ?auto_47243 ) ) ( not ( = ?auto_47237 ?auto_47243 ) ) ( not ( = ?auto_47251 ?auto_47243 ) ) ( AVAILABLE ?auto_47233 ) ( IN ?auto_47237 ?auto_47245 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47233 ?auto_47237 ?auto_47245 ?auto_47248 )
      ( MAKE-ON ?auto_47231 ?auto_47232 )
      ( MAKE-ON-VERIFY ?auto_47231 ?auto_47232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47252 - SURFACE
      ?auto_47253 - SURFACE
    )
    :vars
    (
      ?auto_47272 - HOIST
      ?auto_47269 - PLACE
      ?auto_47265 - PLACE
      ?auto_47267 - HOIST
      ?auto_47255 - SURFACE
      ?auto_47258 - SURFACE
      ?auto_47262 - PLACE
      ?auto_47266 - HOIST
      ?auto_47268 - SURFACE
      ?auto_47256 - SURFACE
      ?auto_47270 - PLACE
      ?auto_47259 - HOIST
      ?auto_47264 - SURFACE
      ?auto_47257 - SURFACE
      ?auto_47254 - PLACE
      ?auto_47263 - HOIST
      ?auto_47260 - SURFACE
      ?auto_47261 - SURFACE
      ?auto_47271 - TRUCK
      ?auto_47273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47272 ?auto_47269 ) ( IS-CRATE ?auto_47252 ) ( not ( = ?auto_47252 ?auto_47253 ) ) ( not ( = ?auto_47265 ?auto_47269 ) ) ( HOIST-AT ?auto_47267 ?auto_47265 ) ( not ( = ?auto_47272 ?auto_47267 ) ) ( AVAILABLE ?auto_47267 ) ( SURFACE-AT ?auto_47252 ?auto_47265 ) ( ON ?auto_47252 ?auto_47255 ) ( CLEAR ?auto_47252 ) ( not ( = ?auto_47252 ?auto_47255 ) ) ( not ( = ?auto_47253 ?auto_47255 ) ) ( IS-CRATE ?auto_47253 ) ( not ( = ?auto_47252 ?auto_47258 ) ) ( not ( = ?auto_47253 ?auto_47258 ) ) ( not ( = ?auto_47255 ?auto_47258 ) ) ( not ( = ?auto_47262 ?auto_47269 ) ) ( not ( = ?auto_47265 ?auto_47262 ) ) ( HOIST-AT ?auto_47266 ?auto_47262 ) ( not ( = ?auto_47272 ?auto_47266 ) ) ( not ( = ?auto_47267 ?auto_47266 ) ) ( AVAILABLE ?auto_47266 ) ( SURFACE-AT ?auto_47253 ?auto_47262 ) ( ON ?auto_47253 ?auto_47268 ) ( CLEAR ?auto_47253 ) ( not ( = ?auto_47252 ?auto_47268 ) ) ( not ( = ?auto_47253 ?auto_47268 ) ) ( not ( = ?auto_47255 ?auto_47268 ) ) ( not ( = ?auto_47258 ?auto_47268 ) ) ( IS-CRATE ?auto_47258 ) ( not ( = ?auto_47252 ?auto_47256 ) ) ( not ( = ?auto_47253 ?auto_47256 ) ) ( not ( = ?auto_47255 ?auto_47256 ) ) ( not ( = ?auto_47258 ?auto_47256 ) ) ( not ( = ?auto_47268 ?auto_47256 ) ) ( not ( = ?auto_47270 ?auto_47269 ) ) ( not ( = ?auto_47265 ?auto_47270 ) ) ( not ( = ?auto_47262 ?auto_47270 ) ) ( HOIST-AT ?auto_47259 ?auto_47270 ) ( not ( = ?auto_47272 ?auto_47259 ) ) ( not ( = ?auto_47267 ?auto_47259 ) ) ( not ( = ?auto_47266 ?auto_47259 ) ) ( AVAILABLE ?auto_47259 ) ( SURFACE-AT ?auto_47258 ?auto_47270 ) ( ON ?auto_47258 ?auto_47264 ) ( CLEAR ?auto_47258 ) ( not ( = ?auto_47252 ?auto_47264 ) ) ( not ( = ?auto_47253 ?auto_47264 ) ) ( not ( = ?auto_47255 ?auto_47264 ) ) ( not ( = ?auto_47258 ?auto_47264 ) ) ( not ( = ?auto_47268 ?auto_47264 ) ) ( not ( = ?auto_47256 ?auto_47264 ) ) ( IS-CRATE ?auto_47256 ) ( not ( = ?auto_47252 ?auto_47257 ) ) ( not ( = ?auto_47253 ?auto_47257 ) ) ( not ( = ?auto_47255 ?auto_47257 ) ) ( not ( = ?auto_47258 ?auto_47257 ) ) ( not ( = ?auto_47268 ?auto_47257 ) ) ( not ( = ?auto_47256 ?auto_47257 ) ) ( not ( = ?auto_47264 ?auto_47257 ) ) ( not ( = ?auto_47254 ?auto_47269 ) ) ( not ( = ?auto_47265 ?auto_47254 ) ) ( not ( = ?auto_47262 ?auto_47254 ) ) ( not ( = ?auto_47270 ?auto_47254 ) ) ( HOIST-AT ?auto_47263 ?auto_47254 ) ( not ( = ?auto_47272 ?auto_47263 ) ) ( not ( = ?auto_47267 ?auto_47263 ) ) ( not ( = ?auto_47266 ?auto_47263 ) ) ( not ( = ?auto_47259 ?auto_47263 ) ) ( AVAILABLE ?auto_47263 ) ( SURFACE-AT ?auto_47256 ?auto_47254 ) ( ON ?auto_47256 ?auto_47260 ) ( CLEAR ?auto_47256 ) ( not ( = ?auto_47252 ?auto_47260 ) ) ( not ( = ?auto_47253 ?auto_47260 ) ) ( not ( = ?auto_47255 ?auto_47260 ) ) ( not ( = ?auto_47258 ?auto_47260 ) ) ( not ( = ?auto_47268 ?auto_47260 ) ) ( not ( = ?auto_47256 ?auto_47260 ) ) ( not ( = ?auto_47264 ?auto_47260 ) ) ( not ( = ?auto_47257 ?auto_47260 ) ) ( SURFACE-AT ?auto_47261 ?auto_47269 ) ( CLEAR ?auto_47261 ) ( IS-CRATE ?auto_47257 ) ( not ( = ?auto_47252 ?auto_47261 ) ) ( not ( = ?auto_47253 ?auto_47261 ) ) ( not ( = ?auto_47255 ?auto_47261 ) ) ( not ( = ?auto_47258 ?auto_47261 ) ) ( not ( = ?auto_47268 ?auto_47261 ) ) ( not ( = ?auto_47256 ?auto_47261 ) ) ( not ( = ?auto_47264 ?auto_47261 ) ) ( not ( = ?auto_47257 ?auto_47261 ) ) ( not ( = ?auto_47260 ?auto_47261 ) ) ( AVAILABLE ?auto_47272 ) ( IN ?auto_47257 ?auto_47271 ) ( TRUCK-AT ?auto_47271 ?auto_47273 ) ( not ( = ?auto_47273 ?auto_47269 ) ) ( not ( = ?auto_47265 ?auto_47273 ) ) ( not ( = ?auto_47262 ?auto_47273 ) ) ( not ( = ?auto_47270 ?auto_47273 ) ) ( not ( = ?auto_47254 ?auto_47273 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47271 ?auto_47273 ?auto_47269 )
      ( MAKE-ON ?auto_47252 ?auto_47253 )
      ( MAKE-ON-VERIFY ?auto_47252 ?auto_47253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47274 - SURFACE
      ?auto_47275 - SURFACE
    )
    :vars
    (
      ?auto_47285 - HOIST
      ?auto_47290 - PLACE
      ?auto_47283 - PLACE
      ?auto_47288 - HOIST
      ?auto_47282 - SURFACE
      ?auto_47294 - SURFACE
      ?auto_47287 - PLACE
      ?auto_47293 - HOIST
      ?auto_47277 - SURFACE
      ?auto_47286 - SURFACE
      ?auto_47279 - PLACE
      ?auto_47291 - HOIST
      ?auto_47281 - SURFACE
      ?auto_47292 - SURFACE
      ?auto_47295 - PLACE
      ?auto_47289 - HOIST
      ?auto_47284 - SURFACE
      ?auto_47278 - SURFACE
      ?auto_47280 - TRUCK
      ?auto_47276 - PLACE
      ?auto_47296 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47285 ?auto_47290 ) ( IS-CRATE ?auto_47274 ) ( not ( = ?auto_47274 ?auto_47275 ) ) ( not ( = ?auto_47283 ?auto_47290 ) ) ( HOIST-AT ?auto_47288 ?auto_47283 ) ( not ( = ?auto_47285 ?auto_47288 ) ) ( AVAILABLE ?auto_47288 ) ( SURFACE-AT ?auto_47274 ?auto_47283 ) ( ON ?auto_47274 ?auto_47282 ) ( CLEAR ?auto_47274 ) ( not ( = ?auto_47274 ?auto_47282 ) ) ( not ( = ?auto_47275 ?auto_47282 ) ) ( IS-CRATE ?auto_47275 ) ( not ( = ?auto_47274 ?auto_47294 ) ) ( not ( = ?auto_47275 ?auto_47294 ) ) ( not ( = ?auto_47282 ?auto_47294 ) ) ( not ( = ?auto_47287 ?auto_47290 ) ) ( not ( = ?auto_47283 ?auto_47287 ) ) ( HOIST-AT ?auto_47293 ?auto_47287 ) ( not ( = ?auto_47285 ?auto_47293 ) ) ( not ( = ?auto_47288 ?auto_47293 ) ) ( AVAILABLE ?auto_47293 ) ( SURFACE-AT ?auto_47275 ?auto_47287 ) ( ON ?auto_47275 ?auto_47277 ) ( CLEAR ?auto_47275 ) ( not ( = ?auto_47274 ?auto_47277 ) ) ( not ( = ?auto_47275 ?auto_47277 ) ) ( not ( = ?auto_47282 ?auto_47277 ) ) ( not ( = ?auto_47294 ?auto_47277 ) ) ( IS-CRATE ?auto_47294 ) ( not ( = ?auto_47274 ?auto_47286 ) ) ( not ( = ?auto_47275 ?auto_47286 ) ) ( not ( = ?auto_47282 ?auto_47286 ) ) ( not ( = ?auto_47294 ?auto_47286 ) ) ( not ( = ?auto_47277 ?auto_47286 ) ) ( not ( = ?auto_47279 ?auto_47290 ) ) ( not ( = ?auto_47283 ?auto_47279 ) ) ( not ( = ?auto_47287 ?auto_47279 ) ) ( HOIST-AT ?auto_47291 ?auto_47279 ) ( not ( = ?auto_47285 ?auto_47291 ) ) ( not ( = ?auto_47288 ?auto_47291 ) ) ( not ( = ?auto_47293 ?auto_47291 ) ) ( AVAILABLE ?auto_47291 ) ( SURFACE-AT ?auto_47294 ?auto_47279 ) ( ON ?auto_47294 ?auto_47281 ) ( CLEAR ?auto_47294 ) ( not ( = ?auto_47274 ?auto_47281 ) ) ( not ( = ?auto_47275 ?auto_47281 ) ) ( not ( = ?auto_47282 ?auto_47281 ) ) ( not ( = ?auto_47294 ?auto_47281 ) ) ( not ( = ?auto_47277 ?auto_47281 ) ) ( not ( = ?auto_47286 ?auto_47281 ) ) ( IS-CRATE ?auto_47286 ) ( not ( = ?auto_47274 ?auto_47292 ) ) ( not ( = ?auto_47275 ?auto_47292 ) ) ( not ( = ?auto_47282 ?auto_47292 ) ) ( not ( = ?auto_47294 ?auto_47292 ) ) ( not ( = ?auto_47277 ?auto_47292 ) ) ( not ( = ?auto_47286 ?auto_47292 ) ) ( not ( = ?auto_47281 ?auto_47292 ) ) ( not ( = ?auto_47295 ?auto_47290 ) ) ( not ( = ?auto_47283 ?auto_47295 ) ) ( not ( = ?auto_47287 ?auto_47295 ) ) ( not ( = ?auto_47279 ?auto_47295 ) ) ( HOIST-AT ?auto_47289 ?auto_47295 ) ( not ( = ?auto_47285 ?auto_47289 ) ) ( not ( = ?auto_47288 ?auto_47289 ) ) ( not ( = ?auto_47293 ?auto_47289 ) ) ( not ( = ?auto_47291 ?auto_47289 ) ) ( AVAILABLE ?auto_47289 ) ( SURFACE-AT ?auto_47286 ?auto_47295 ) ( ON ?auto_47286 ?auto_47284 ) ( CLEAR ?auto_47286 ) ( not ( = ?auto_47274 ?auto_47284 ) ) ( not ( = ?auto_47275 ?auto_47284 ) ) ( not ( = ?auto_47282 ?auto_47284 ) ) ( not ( = ?auto_47294 ?auto_47284 ) ) ( not ( = ?auto_47277 ?auto_47284 ) ) ( not ( = ?auto_47286 ?auto_47284 ) ) ( not ( = ?auto_47281 ?auto_47284 ) ) ( not ( = ?auto_47292 ?auto_47284 ) ) ( SURFACE-AT ?auto_47278 ?auto_47290 ) ( CLEAR ?auto_47278 ) ( IS-CRATE ?auto_47292 ) ( not ( = ?auto_47274 ?auto_47278 ) ) ( not ( = ?auto_47275 ?auto_47278 ) ) ( not ( = ?auto_47282 ?auto_47278 ) ) ( not ( = ?auto_47294 ?auto_47278 ) ) ( not ( = ?auto_47277 ?auto_47278 ) ) ( not ( = ?auto_47286 ?auto_47278 ) ) ( not ( = ?auto_47281 ?auto_47278 ) ) ( not ( = ?auto_47292 ?auto_47278 ) ) ( not ( = ?auto_47284 ?auto_47278 ) ) ( AVAILABLE ?auto_47285 ) ( TRUCK-AT ?auto_47280 ?auto_47276 ) ( not ( = ?auto_47276 ?auto_47290 ) ) ( not ( = ?auto_47283 ?auto_47276 ) ) ( not ( = ?auto_47287 ?auto_47276 ) ) ( not ( = ?auto_47279 ?auto_47276 ) ) ( not ( = ?auto_47295 ?auto_47276 ) ) ( HOIST-AT ?auto_47296 ?auto_47276 ) ( LIFTING ?auto_47296 ?auto_47292 ) ( not ( = ?auto_47285 ?auto_47296 ) ) ( not ( = ?auto_47288 ?auto_47296 ) ) ( not ( = ?auto_47293 ?auto_47296 ) ) ( not ( = ?auto_47291 ?auto_47296 ) ) ( not ( = ?auto_47289 ?auto_47296 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47296 ?auto_47292 ?auto_47280 ?auto_47276 )
      ( MAKE-ON ?auto_47274 ?auto_47275 )
      ( MAKE-ON-VERIFY ?auto_47274 ?auto_47275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47297 - SURFACE
      ?auto_47298 - SURFACE
    )
    :vars
    (
      ?auto_47319 - HOIST
      ?auto_47305 - PLACE
      ?auto_47306 - PLACE
      ?auto_47299 - HOIST
      ?auto_47314 - SURFACE
      ?auto_47317 - SURFACE
      ?auto_47310 - PLACE
      ?auto_47313 - HOIST
      ?auto_47307 - SURFACE
      ?auto_47316 - SURFACE
      ?auto_47301 - PLACE
      ?auto_47309 - HOIST
      ?auto_47308 - SURFACE
      ?auto_47302 - SURFACE
      ?auto_47312 - PLACE
      ?auto_47318 - HOIST
      ?auto_47315 - SURFACE
      ?auto_47300 - SURFACE
      ?auto_47303 - TRUCK
      ?auto_47304 - PLACE
      ?auto_47311 - HOIST
      ?auto_47320 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47319 ?auto_47305 ) ( IS-CRATE ?auto_47297 ) ( not ( = ?auto_47297 ?auto_47298 ) ) ( not ( = ?auto_47306 ?auto_47305 ) ) ( HOIST-AT ?auto_47299 ?auto_47306 ) ( not ( = ?auto_47319 ?auto_47299 ) ) ( AVAILABLE ?auto_47299 ) ( SURFACE-AT ?auto_47297 ?auto_47306 ) ( ON ?auto_47297 ?auto_47314 ) ( CLEAR ?auto_47297 ) ( not ( = ?auto_47297 ?auto_47314 ) ) ( not ( = ?auto_47298 ?auto_47314 ) ) ( IS-CRATE ?auto_47298 ) ( not ( = ?auto_47297 ?auto_47317 ) ) ( not ( = ?auto_47298 ?auto_47317 ) ) ( not ( = ?auto_47314 ?auto_47317 ) ) ( not ( = ?auto_47310 ?auto_47305 ) ) ( not ( = ?auto_47306 ?auto_47310 ) ) ( HOIST-AT ?auto_47313 ?auto_47310 ) ( not ( = ?auto_47319 ?auto_47313 ) ) ( not ( = ?auto_47299 ?auto_47313 ) ) ( AVAILABLE ?auto_47313 ) ( SURFACE-AT ?auto_47298 ?auto_47310 ) ( ON ?auto_47298 ?auto_47307 ) ( CLEAR ?auto_47298 ) ( not ( = ?auto_47297 ?auto_47307 ) ) ( not ( = ?auto_47298 ?auto_47307 ) ) ( not ( = ?auto_47314 ?auto_47307 ) ) ( not ( = ?auto_47317 ?auto_47307 ) ) ( IS-CRATE ?auto_47317 ) ( not ( = ?auto_47297 ?auto_47316 ) ) ( not ( = ?auto_47298 ?auto_47316 ) ) ( not ( = ?auto_47314 ?auto_47316 ) ) ( not ( = ?auto_47317 ?auto_47316 ) ) ( not ( = ?auto_47307 ?auto_47316 ) ) ( not ( = ?auto_47301 ?auto_47305 ) ) ( not ( = ?auto_47306 ?auto_47301 ) ) ( not ( = ?auto_47310 ?auto_47301 ) ) ( HOIST-AT ?auto_47309 ?auto_47301 ) ( not ( = ?auto_47319 ?auto_47309 ) ) ( not ( = ?auto_47299 ?auto_47309 ) ) ( not ( = ?auto_47313 ?auto_47309 ) ) ( AVAILABLE ?auto_47309 ) ( SURFACE-AT ?auto_47317 ?auto_47301 ) ( ON ?auto_47317 ?auto_47308 ) ( CLEAR ?auto_47317 ) ( not ( = ?auto_47297 ?auto_47308 ) ) ( not ( = ?auto_47298 ?auto_47308 ) ) ( not ( = ?auto_47314 ?auto_47308 ) ) ( not ( = ?auto_47317 ?auto_47308 ) ) ( not ( = ?auto_47307 ?auto_47308 ) ) ( not ( = ?auto_47316 ?auto_47308 ) ) ( IS-CRATE ?auto_47316 ) ( not ( = ?auto_47297 ?auto_47302 ) ) ( not ( = ?auto_47298 ?auto_47302 ) ) ( not ( = ?auto_47314 ?auto_47302 ) ) ( not ( = ?auto_47317 ?auto_47302 ) ) ( not ( = ?auto_47307 ?auto_47302 ) ) ( not ( = ?auto_47316 ?auto_47302 ) ) ( not ( = ?auto_47308 ?auto_47302 ) ) ( not ( = ?auto_47312 ?auto_47305 ) ) ( not ( = ?auto_47306 ?auto_47312 ) ) ( not ( = ?auto_47310 ?auto_47312 ) ) ( not ( = ?auto_47301 ?auto_47312 ) ) ( HOIST-AT ?auto_47318 ?auto_47312 ) ( not ( = ?auto_47319 ?auto_47318 ) ) ( not ( = ?auto_47299 ?auto_47318 ) ) ( not ( = ?auto_47313 ?auto_47318 ) ) ( not ( = ?auto_47309 ?auto_47318 ) ) ( AVAILABLE ?auto_47318 ) ( SURFACE-AT ?auto_47316 ?auto_47312 ) ( ON ?auto_47316 ?auto_47315 ) ( CLEAR ?auto_47316 ) ( not ( = ?auto_47297 ?auto_47315 ) ) ( not ( = ?auto_47298 ?auto_47315 ) ) ( not ( = ?auto_47314 ?auto_47315 ) ) ( not ( = ?auto_47317 ?auto_47315 ) ) ( not ( = ?auto_47307 ?auto_47315 ) ) ( not ( = ?auto_47316 ?auto_47315 ) ) ( not ( = ?auto_47308 ?auto_47315 ) ) ( not ( = ?auto_47302 ?auto_47315 ) ) ( SURFACE-AT ?auto_47300 ?auto_47305 ) ( CLEAR ?auto_47300 ) ( IS-CRATE ?auto_47302 ) ( not ( = ?auto_47297 ?auto_47300 ) ) ( not ( = ?auto_47298 ?auto_47300 ) ) ( not ( = ?auto_47314 ?auto_47300 ) ) ( not ( = ?auto_47317 ?auto_47300 ) ) ( not ( = ?auto_47307 ?auto_47300 ) ) ( not ( = ?auto_47316 ?auto_47300 ) ) ( not ( = ?auto_47308 ?auto_47300 ) ) ( not ( = ?auto_47302 ?auto_47300 ) ) ( not ( = ?auto_47315 ?auto_47300 ) ) ( AVAILABLE ?auto_47319 ) ( TRUCK-AT ?auto_47303 ?auto_47304 ) ( not ( = ?auto_47304 ?auto_47305 ) ) ( not ( = ?auto_47306 ?auto_47304 ) ) ( not ( = ?auto_47310 ?auto_47304 ) ) ( not ( = ?auto_47301 ?auto_47304 ) ) ( not ( = ?auto_47312 ?auto_47304 ) ) ( HOIST-AT ?auto_47311 ?auto_47304 ) ( not ( = ?auto_47319 ?auto_47311 ) ) ( not ( = ?auto_47299 ?auto_47311 ) ) ( not ( = ?auto_47313 ?auto_47311 ) ) ( not ( = ?auto_47309 ?auto_47311 ) ) ( not ( = ?auto_47318 ?auto_47311 ) ) ( AVAILABLE ?auto_47311 ) ( SURFACE-AT ?auto_47302 ?auto_47304 ) ( ON ?auto_47302 ?auto_47320 ) ( CLEAR ?auto_47302 ) ( not ( = ?auto_47297 ?auto_47320 ) ) ( not ( = ?auto_47298 ?auto_47320 ) ) ( not ( = ?auto_47314 ?auto_47320 ) ) ( not ( = ?auto_47317 ?auto_47320 ) ) ( not ( = ?auto_47307 ?auto_47320 ) ) ( not ( = ?auto_47316 ?auto_47320 ) ) ( not ( = ?auto_47308 ?auto_47320 ) ) ( not ( = ?auto_47302 ?auto_47320 ) ) ( not ( = ?auto_47315 ?auto_47320 ) ) ( not ( = ?auto_47300 ?auto_47320 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47311 ?auto_47302 ?auto_47320 ?auto_47304 )
      ( MAKE-ON ?auto_47297 ?auto_47298 )
      ( MAKE-ON-VERIFY ?auto_47297 ?auto_47298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47321 - SURFACE
      ?auto_47322 - SURFACE
    )
    :vars
    (
      ?auto_47334 - HOIST
      ?auto_47340 - PLACE
      ?auto_47343 - PLACE
      ?auto_47332 - HOIST
      ?auto_47341 - SURFACE
      ?auto_47330 - SURFACE
      ?auto_47337 - PLACE
      ?auto_47323 - HOIST
      ?auto_47331 - SURFACE
      ?auto_47329 - SURFACE
      ?auto_47338 - PLACE
      ?auto_47335 - HOIST
      ?auto_47327 - SURFACE
      ?auto_47326 - SURFACE
      ?auto_47325 - PLACE
      ?auto_47333 - HOIST
      ?auto_47339 - SURFACE
      ?auto_47344 - SURFACE
      ?auto_47336 - PLACE
      ?auto_47328 - HOIST
      ?auto_47342 - SURFACE
      ?auto_47324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47334 ?auto_47340 ) ( IS-CRATE ?auto_47321 ) ( not ( = ?auto_47321 ?auto_47322 ) ) ( not ( = ?auto_47343 ?auto_47340 ) ) ( HOIST-AT ?auto_47332 ?auto_47343 ) ( not ( = ?auto_47334 ?auto_47332 ) ) ( AVAILABLE ?auto_47332 ) ( SURFACE-AT ?auto_47321 ?auto_47343 ) ( ON ?auto_47321 ?auto_47341 ) ( CLEAR ?auto_47321 ) ( not ( = ?auto_47321 ?auto_47341 ) ) ( not ( = ?auto_47322 ?auto_47341 ) ) ( IS-CRATE ?auto_47322 ) ( not ( = ?auto_47321 ?auto_47330 ) ) ( not ( = ?auto_47322 ?auto_47330 ) ) ( not ( = ?auto_47341 ?auto_47330 ) ) ( not ( = ?auto_47337 ?auto_47340 ) ) ( not ( = ?auto_47343 ?auto_47337 ) ) ( HOIST-AT ?auto_47323 ?auto_47337 ) ( not ( = ?auto_47334 ?auto_47323 ) ) ( not ( = ?auto_47332 ?auto_47323 ) ) ( AVAILABLE ?auto_47323 ) ( SURFACE-AT ?auto_47322 ?auto_47337 ) ( ON ?auto_47322 ?auto_47331 ) ( CLEAR ?auto_47322 ) ( not ( = ?auto_47321 ?auto_47331 ) ) ( not ( = ?auto_47322 ?auto_47331 ) ) ( not ( = ?auto_47341 ?auto_47331 ) ) ( not ( = ?auto_47330 ?auto_47331 ) ) ( IS-CRATE ?auto_47330 ) ( not ( = ?auto_47321 ?auto_47329 ) ) ( not ( = ?auto_47322 ?auto_47329 ) ) ( not ( = ?auto_47341 ?auto_47329 ) ) ( not ( = ?auto_47330 ?auto_47329 ) ) ( not ( = ?auto_47331 ?auto_47329 ) ) ( not ( = ?auto_47338 ?auto_47340 ) ) ( not ( = ?auto_47343 ?auto_47338 ) ) ( not ( = ?auto_47337 ?auto_47338 ) ) ( HOIST-AT ?auto_47335 ?auto_47338 ) ( not ( = ?auto_47334 ?auto_47335 ) ) ( not ( = ?auto_47332 ?auto_47335 ) ) ( not ( = ?auto_47323 ?auto_47335 ) ) ( AVAILABLE ?auto_47335 ) ( SURFACE-AT ?auto_47330 ?auto_47338 ) ( ON ?auto_47330 ?auto_47327 ) ( CLEAR ?auto_47330 ) ( not ( = ?auto_47321 ?auto_47327 ) ) ( not ( = ?auto_47322 ?auto_47327 ) ) ( not ( = ?auto_47341 ?auto_47327 ) ) ( not ( = ?auto_47330 ?auto_47327 ) ) ( not ( = ?auto_47331 ?auto_47327 ) ) ( not ( = ?auto_47329 ?auto_47327 ) ) ( IS-CRATE ?auto_47329 ) ( not ( = ?auto_47321 ?auto_47326 ) ) ( not ( = ?auto_47322 ?auto_47326 ) ) ( not ( = ?auto_47341 ?auto_47326 ) ) ( not ( = ?auto_47330 ?auto_47326 ) ) ( not ( = ?auto_47331 ?auto_47326 ) ) ( not ( = ?auto_47329 ?auto_47326 ) ) ( not ( = ?auto_47327 ?auto_47326 ) ) ( not ( = ?auto_47325 ?auto_47340 ) ) ( not ( = ?auto_47343 ?auto_47325 ) ) ( not ( = ?auto_47337 ?auto_47325 ) ) ( not ( = ?auto_47338 ?auto_47325 ) ) ( HOIST-AT ?auto_47333 ?auto_47325 ) ( not ( = ?auto_47334 ?auto_47333 ) ) ( not ( = ?auto_47332 ?auto_47333 ) ) ( not ( = ?auto_47323 ?auto_47333 ) ) ( not ( = ?auto_47335 ?auto_47333 ) ) ( AVAILABLE ?auto_47333 ) ( SURFACE-AT ?auto_47329 ?auto_47325 ) ( ON ?auto_47329 ?auto_47339 ) ( CLEAR ?auto_47329 ) ( not ( = ?auto_47321 ?auto_47339 ) ) ( not ( = ?auto_47322 ?auto_47339 ) ) ( not ( = ?auto_47341 ?auto_47339 ) ) ( not ( = ?auto_47330 ?auto_47339 ) ) ( not ( = ?auto_47331 ?auto_47339 ) ) ( not ( = ?auto_47329 ?auto_47339 ) ) ( not ( = ?auto_47327 ?auto_47339 ) ) ( not ( = ?auto_47326 ?auto_47339 ) ) ( SURFACE-AT ?auto_47344 ?auto_47340 ) ( CLEAR ?auto_47344 ) ( IS-CRATE ?auto_47326 ) ( not ( = ?auto_47321 ?auto_47344 ) ) ( not ( = ?auto_47322 ?auto_47344 ) ) ( not ( = ?auto_47341 ?auto_47344 ) ) ( not ( = ?auto_47330 ?auto_47344 ) ) ( not ( = ?auto_47331 ?auto_47344 ) ) ( not ( = ?auto_47329 ?auto_47344 ) ) ( not ( = ?auto_47327 ?auto_47344 ) ) ( not ( = ?auto_47326 ?auto_47344 ) ) ( not ( = ?auto_47339 ?auto_47344 ) ) ( AVAILABLE ?auto_47334 ) ( not ( = ?auto_47336 ?auto_47340 ) ) ( not ( = ?auto_47343 ?auto_47336 ) ) ( not ( = ?auto_47337 ?auto_47336 ) ) ( not ( = ?auto_47338 ?auto_47336 ) ) ( not ( = ?auto_47325 ?auto_47336 ) ) ( HOIST-AT ?auto_47328 ?auto_47336 ) ( not ( = ?auto_47334 ?auto_47328 ) ) ( not ( = ?auto_47332 ?auto_47328 ) ) ( not ( = ?auto_47323 ?auto_47328 ) ) ( not ( = ?auto_47335 ?auto_47328 ) ) ( not ( = ?auto_47333 ?auto_47328 ) ) ( AVAILABLE ?auto_47328 ) ( SURFACE-AT ?auto_47326 ?auto_47336 ) ( ON ?auto_47326 ?auto_47342 ) ( CLEAR ?auto_47326 ) ( not ( = ?auto_47321 ?auto_47342 ) ) ( not ( = ?auto_47322 ?auto_47342 ) ) ( not ( = ?auto_47341 ?auto_47342 ) ) ( not ( = ?auto_47330 ?auto_47342 ) ) ( not ( = ?auto_47331 ?auto_47342 ) ) ( not ( = ?auto_47329 ?auto_47342 ) ) ( not ( = ?auto_47327 ?auto_47342 ) ) ( not ( = ?auto_47326 ?auto_47342 ) ) ( not ( = ?auto_47339 ?auto_47342 ) ) ( not ( = ?auto_47344 ?auto_47342 ) ) ( TRUCK-AT ?auto_47324 ?auto_47340 ) )
    :subtasks
    ( ( !DRIVE ?auto_47324 ?auto_47340 ?auto_47336 )
      ( MAKE-ON ?auto_47321 ?auto_47322 )
      ( MAKE-ON-VERIFY ?auto_47321 ?auto_47322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47345 - SURFACE
      ?auto_47346 - SURFACE
    )
    :vars
    (
      ?auto_47352 - HOIST
      ?auto_47358 - PLACE
      ?auto_47366 - PLACE
      ?auto_47356 - HOIST
      ?auto_47359 - SURFACE
      ?auto_47364 - SURFACE
      ?auto_47361 - PLACE
      ?auto_47347 - HOIST
      ?auto_47368 - SURFACE
      ?auto_47353 - SURFACE
      ?auto_47365 - PLACE
      ?auto_47350 - HOIST
      ?auto_47362 - SURFACE
      ?auto_47349 - SURFACE
      ?auto_47355 - PLACE
      ?auto_47348 - HOIST
      ?auto_47357 - SURFACE
      ?auto_47367 - SURFACE
      ?auto_47354 - PLACE
      ?auto_47351 - HOIST
      ?auto_47360 - SURFACE
      ?auto_47363 - TRUCK
      ?auto_47369 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47352 ?auto_47358 ) ( IS-CRATE ?auto_47345 ) ( not ( = ?auto_47345 ?auto_47346 ) ) ( not ( = ?auto_47366 ?auto_47358 ) ) ( HOIST-AT ?auto_47356 ?auto_47366 ) ( not ( = ?auto_47352 ?auto_47356 ) ) ( AVAILABLE ?auto_47356 ) ( SURFACE-AT ?auto_47345 ?auto_47366 ) ( ON ?auto_47345 ?auto_47359 ) ( CLEAR ?auto_47345 ) ( not ( = ?auto_47345 ?auto_47359 ) ) ( not ( = ?auto_47346 ?auto_47359 ) ) ( IS-CRATE ?auto_47346 ) ( not ( = ?auto_47345 ?auto_47364 ) ) ( not ( = ?auto_47346 ?auto_47364 ) ) ( not ( = ?auto_47359 ?auto_47364 ) ) ( not ( = ?auto_47361 ?auto_47358 ) ) ( not ( = ?auto_47366 ?auto_47361 ) ) ( HOIST-AT ?auto_47347 ?auto_47361 ) ( not ( = ?auto_47352 ?auto_47347 ) ) ( not ( = ?auto_47356 ?auto_47347 ) ) ( AVAILABLE ?auto_47347 ) ( SURFACE-AT ?auto_47346 ?auto_47361 ) ( ON ?auto_47346 ?auto_47368 ) ( CLEAR ?auto_47346 ) ( not ( = ?auto_47345 ?auto_47368 ) ) ( not ( = ?auto_47346 ?auto_47368 ) ) ( not ( = ?auto_47359 ?auto_47368 ) ) ( not ( = ?auto_47364 ?auto_47368 ) ) ( IS-CRATE ?auto_47364 ) ( not ( = ?auto_47345 ?auto_47353 ) ) ( not ( = ?auto_47346 ?auto_47353 ) ) ( not ( = ?auto_47359 ?auto_47353 ) ) ( not ( = ?auto_47364 ?auto_47353 ) ) ( not ( = ?auto_47368 ?auto_47353 ) ) ( not ( = ?auto_47365 ?auto_47358 ) ) ( not ( = ?auto_47366 ?auto_47365 ) ) ( not ( = ?auto_47361 ?auto_47365 ) ) ( HOIST-AT ?auto_47350 ?auto_47365 ) ( not ( = ?auto_47352 ?auto_47350 ) ) ( not ( = ?auto_47356 ?auto_47350 ) ) ( not ( = ?auto_47347 ?auto_47350 ) ) ( AVAILABLE ?auto_47350 ) ( SURFACE-AT ?auto_47364 ?auto_47365 ) ( ON ?auto_47364 ?auto_47362 ) ( CLEAR ?auto_47364 ) ( not ( = ?auto_47345 ?auto_47362 ) ) ( not ( = ?auto_47346 ?auto_47362 ) ) ( not ( = ?auto_47359 ?auto_47362 ) ) ( not ( = ?auto_47364 ?auto_47362 ) ) ( not ( = ?auto_47368 ?auto_47362 ) ) ( not ( = ?auto_47353 ?auto_47362 ) ) ( IS-CRATE ?auto_47353 ) ( not ( = ?auto_47345 ?auto_47349 ) ) ( not ( = ?auto_47346 ?auto_47349 ) ) ( not ( = ?auto_47359 ?auto_47349 ) ) ( not ( = ?auto_47364 ?auto_47349 ) ) ( not ( = ?auto_47368 ?auto_47349 ) ) ( not ( = ?auto_47353 ?auto_47349 ) ) ( not ( = ?auto_47362 ?auto_47349 ) ) ( not ( = ?auto_47355 ?auto_47358 ) ) ( not ( = ?auto_47366 ?auto_47355 ) ) ( not ( = ?auto_47361 ?auto_47355 ) ) ( not ( = ?auto_47365 ?auto_47355 ) ) ( HOIST-AT ?auto_47348 ?auto_47355 ) ( not ( = ?auto_47352 ?auto_47348 ) ) ( not ( = ?auto_47356 ?auto_47348 ) ) ( not ( = ?auto_47347 ?auto_47348 ) ) ( not ( = ?auto_47350 ?auto_47348 ) ) ( AVAILABLE ?auto_47348 ) ( SURFACE-AT ?auto_47353 ?auto_47355 ) ( ON ?auto_47353 ?auto_47357 ) ( CLEAR ?auto_47353 ) ( not ( = ?auto_47345 ?auto_47357 ) ) ( not ( = ?auto_47346 ?auto_47357 ) ) ( not ( = ?auto_47359 ?auto_47357 ) ) ( not ( = ?auto_47364 ?auto_47357 ) ) ( not ( = ?auto_47368 ?auto_47357 ) ) ( not ( = ?auto_47353 ?auto_47357 ) ) ( not ( = ?auto_47362 ?auto_47357 ) ) ( not ( = ?auto_47349 ?auto_47357 ) ) ( IS-CRATE ?auto_47349 ) ( not ( = ?auto_47345 ?auto_47367 ) ) ( not ( = ?auto_47346 ?auto_47367 ) ) ( not ( = ?auto_47359 ?auto_47367 ) ) ( not ( = ?auto_47364 ?auto_47367 ) ) ( not ( = ?auto_47368 ?auto_47367 ) ) ( not ( = ?auto_47353 ?auto_47367 ) ) ( not ( = ?auto_47362 ?auto_47367 ) ) ( not ( = ?auto_47349 ?auto_47367 ) ) ( not ( = ?auto_47357 ?auto_47367 ) ) ( not ( = ?auto_47354 ?auto_47358 ) ) ( not ( = ?auto_47366 ?auto_47354 ) ) ( not ( = ?auto_47361 ?auto_47354 ) ) ( not ( = ?auto_47365 ?auto_47354 ) ) ( not ( = ?auto_47355 ?auto_47354 ) ) ( HOIST-AT ?auto_47351 ?auto_47354 ) ( not ( = ?auto_47352 ?auto_47351 ) ) ( not ( = ?auto_47356 ?auto_47351 ) ) ( not ( = ?auto_47347 ?auto_47351 ) ) ( not ( = ?auto_47350 ?auto_47351 ) ) ( not ( = ?auto_47348 ?auto_47351 ) ) ( AVAILABLE ?auto_47351 ) ( SURFACE-AT ?auto_47349 ?auto_47354 ) ( ON ?auto_47349 ?auto_47360 ) ( CLEAR ?auto_47349 ) ( not ( = ?auto_47345 ?auto_47360 ) ) ( not ( = ?auto_47346 ?auto_47360 ) ) ( not ( = ?auto_47359 ?auto_47360 ) ) ( not ( = ?auto_47364 ?auto_47360 ) ) ( not ( = ?auto_47368 ?auto_47360 ) ) ( not ( = ?auto_47353 ?auto_47360 ) ) ( not ( = ?auto_47362 ?auto_47360 ) ) ( not ( = ?auto_47349 ?auto_47360 ) ) ( not ( = ?auto_47357 ?auto_47360 ) ) ( not ( = ?auto_47367 ?auto_47360 ) ) ( TRUCK-AT ?auto_47363 ?auto_47358 ) ( SURFACE-AT ?auto_47369 ?auto_47358 ) ( CLEAR ?auto_47369 ) ( LIFTING ?auto_47352 ?auto_47367 ) ( IS-CRATE ?auto_47367 ) ( not ( = ?auto_47345 ?auto_47369 ) ) ( not ( = ?auto_47346 ?auto_47369 ) ) ( not ( = ?auto_47359 ?auto_47369 ) ) ( not ( = ?auto_47364 ?auto_47369 ) ) ( not ( = ?auto_47368 ?auto_47369 ) ) ( not ( = ?auto_47353 ?auto_47369 ) ) ( not ( = ?auto_47362 ?auto_47369 ) ) ( not ( = ?auto_47349 ?auto_47369 ) ) ( not ( = ?auto_47357 ?auto_47369 ) ) ( not ( = ?auto_47367 ?auto_47369 ) ) ( not ( = ?auto_47360 ?auto_47369 ) ) )
    :subtasks
    ( ( !DROP ?auto_47352 ?auto_47367 ?auto_47369 ?auto_47358 )
      ( MAKE-ON ?auto_47345 ?auto_47346 )
      ( MAKE-ON-VERIFY ?auto_47345 ?auto_47346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47370 - SURFACE
      ?auto_47371 - SURFACE
    )
    :vars
    (
      ?auto_47380 - HOIST
      ?auto_47386 - PLACE
      ?auto_47390 - PLACE
      ?auto_47378 - HOIST
      ?auto_47381 - SURFACE
      ?auto_47374 - SURFACE
      ?auto_47391 - PLACE
      ?auto_47385 - HOIST
      ?auto_47383 - SURFACE
      ?auto_47392 - SURFACE
      ?auto_47389 - PLACE
      ?auto_47393 - HOIST
      ?auto_47384 - SURFACE
      ?auto_47382 - SURFACE
      ?auto_47394 - PLACE
      ?auto_47387 - HOIST
      ?auto_47377 - SURFACE
      ?auto_47373 - SURFACE
      ?auto_47379 - PLACE
      ?auto_47388 - HOIST
      ?auto_47376 - SURFACE
      ?auto_47375 - TRUCK
      ?auto_47372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47380 ?auto_47386 ) ( IS-CRATE ?auto_47370 ) ( not ( = ?auto_47370 ?auto_47371 ) ) ( not ( = ?auto_47390 ?auto_47386 ) ) ( HOIST-AT ?auto_47378 ?auto_47390 ) ( not ( = ?auto_47380 ?auto_47378 ) ) ( AVAILABLE ?auto_47378 ) ( SURFACE-AT ?auto_47370 ?auto_47390 ) ( ON ?auto_47370 ?auto_47381 ) ( CLEAR ?auto_47370 ) ( not ( = ?auto_47370 ?auto_47381 ) ) ( not ( = ?auto_47371 ?auto_47381 ) ) ( IS-CRATE ?auto_47371 ) ( not ( = ?auto_47370 ?auto_47374 ) ) ( not ( = ?auto_47371 ?auto_47374 ) ) ( not ( = ?auto_47381 ?auto_47374 ) ) ( not ( = ?auto_47391 ?auto_47386 ) ) ( not ( = ?auto_47390 ?auto_47391 ) ) ( HOIST-AT ?auto_47385 ?auto_47391 ) ( not ( = ?auto_47380 ?auto_47385 ) ) ( not ( = ?auto_47378 ?auto_47385 ) ) ( AVAILABLE ?auto_47385 ) ( SURFACE-AT ?auto_47371 ?auto_47391 ) ( ON ?auto_47371 ?auto_47383 ) ( CLEAR ?auto_47371 ) ( not ( = ?auto_47370 ?auto_47383 ) ) ( not ( = ?auto_47371 ?auto_47383 ) ) ( not ( = ?auto_47381 ?auto_47383 ) ) ( not ( = ?auto_47374 ?auto_47383 ) ) ( IS-CRATE ?auto_47374 ) ( not ( = ?auto_47370 ?auto_47392 ) ) ( not ( = ?auto_47371 ?auto_47392 ) ) ( not ( = ?auto_47381 ?auto_47392 ) ) ( not ( = ?auto_47374 ?auto_47392 ) ) ( not ( = ?auto_47383 ?auto_47392 ) ) ( not ( = ?auto_47389 ?auto_47386 ) ) ( not ( = ?auto_47390 ?auto_47389 ) ) ( not ( = ?auto_47391 ?auto_47389 ) ) ( HOIST-AT ?auto_47393 ?auto_47389 ) ( not ( = ?auto_47380 ?auto_47393 ) ) ( not ( = ?auto_47378 ?auto_47393 ) ) ( not ( = ?auto_47385 ?auto_47393 ) ) ( AVAILABLE ?auto_47393 ) ( SURFACE-AT ?auto_47374 ?auto_47389 ) ( ON ?auto_47374 ?auto_47384 ) ( CLEAR ?auto_47374 ) ( not ( = ?auto_47370 ?auto_47384 ) ) ( not ( = ?auto_47371 ?auto_47384 ) ) ( not ( = ?auto_47381 ?auto_47384 ) ) ( not ( = ?auto_47374 ?auto_47384 ) ) ( not ( = ?auto_47383 ?auto_47384 ) ) ( not ( = ?auto_47392 ?auto_47384 ) ) ( IS-CRATE ?auto_47392 ) ( not ( = ?auto_47370 ?auto_47382 ) ) ( not ( = ?auto_47371 ?auto_47382 ) ) ( not ( = ?auto_47381 ?auto_47382 ) ) ( not ( = ?auto_47374 ?auto_47382 ) ) ( not ( = ?auto_47383 ?auto_47382 ) ) ( not ( = ?auto_47392 ?auto_47382 ) ) ( not ( = ?auto_47384 ?auto_47382 ) ) ( not ( = ?auto_47394 ?auto_47386 ) ) ( not ( = ?auto_47390 ?auto_47394 ) ) ( not ( = ?auto_47391 ?auto_47394 ) ) ( not ( = ?auto_47389 ?auto_47394 ) ) ( HOIST-AT ?auto_47387 ?auto_47394 ) ( not ( = ?auto_47380 ?auto_47387 ) ) ( not ( = ?auto_47378 ?auto_47387 ) ) ( not ( = ?auto_47385 ?auto_47387 ) ) ( not ( = ?auto_47393 ?auto_47387 ) ) ( AVAILABLE ?auto_47387 ) ( SURFACE-AT ?auto_47392 ?auto_47394 ) ( ON ?auto_47392 ?auto_47377 ) ( CLEAR ?auto_47392 ) ( not ( = ?auto_47370 ?auto_47377 ) ) ( not ( = ?auto_47371 ?auto_47377 ) ) ( not ( = ?auto_47381 ?auto_47377 ) ) ( not ( = ?auto_47374 ?auto_47377 ) ) ( not ( = ?auto_47383 ?auto_47377 ) ) ( not ( = ?auto_47392 ?auto_47377 ) ) ( not ( = ?auto_47384 ?auto_47377 ) ) ( not ( = ?auto_47382 ?auto_47377 ) ) ( IS-CRATE ?auto_47382 ) ( not ( = ?auto_47370 ?auto_47373 ) ) ( not ( = ?auto_47371 ?auto_47373 ) ) ( not ( = ?auto_47381 ?auto_47373 ) ) ( not ( = ?auto_47374 ?auto_47373 ) ) ( not ( = ?auto_47383 ?auto_47373 ) ) ( not ( = ?auto_47392 ?auto_47373 ) ) ( not ( = ?auto_47384 ?auto_47373 ) ) ( not ( = ?auto_47382 ?auto_47373 ) ) ( not ( = ?auto_47377 ?auto_47373 ) ) ( not ( = ?auto_47379 ?auto_47386 ) ) ( not ( = ?auto_47390 ?auto_47379 ) ) ( not ( = ?auto_47391 ?auto_47379 ) ) ( not ( = ?auto_47389 ?auto_47379 ) ) ( not ( = ?auto_47394 ?auto_47379 ) ) ( HOIST-AT ?auto_47388 ?auto_47379 ) ( not ( = ?auto_47380 ?auto_47388 ) ) ( not ( = ?auto_47378 ?auto_47388 ) ) ( not ( = ?auto_47385 ?auto_47388 ) ) ( not ( = ?auto_47393 ?auto_47388 ) ) ( not ( = ?auto_47387 ?auto_47388 ) ) ( AVAILABLE ?auto_47388 ) ( SURFACE-AT ?auto_47382 ?auto_47379 ) ( ON ?auto_47382 ?auto_47376 ) ( CLEAR ?auto_47382 ) ( not ( = ?auto_47370 ?auto_47376 ) ) ( not ( = ?auto_47371 ?auto_47376 ) ) ( not ( = ?auto_47381 ?auto_47376 ) ) ( not ( = ?auto_47374 ?auto_47376 ) ) ( not ( = ?auto_47383 ?auto_47376 ) ) ( not ( = ?auto_47392 ?auto_47376 ) ) ( not ( = ?auto_47384 ?auto_47376 ) ) ( not ( = ?auto_47382 ?auto_47376 ) ) ( not ( = ?auto_47377 ?auto_47376 ) ) ( not ( = ?auto_47373 ?auto_47376 ) ) ( TRUCK-AT ?auto_47375 ?auto_47386 ) ( SURFACE-AT ?auto_47372 ?auto_47386 ) ( CLEAR ?auto_47372 ) ( IS-CRATE ?auto_47373 ) ( not ( = ?auto_47370 ?auto_47372 ) ) ( not ( = ?auto_47371 ?auto_47372 ) ) ( not ( = ?auto_47381 ?auto_47372 ) ) ( not ( = ?auto_47374 ?auto_47372 ) ) ( not ( = ?auto_47383 ?auto_47372 ) ) ( not ( = ?auto_47392 ?auto_47372 ) ) ( not ( = ?auto_47384 ?auto_47372 ) ) ( not ( = ?auto_47382 ?auto_47372 ) ) ( not ( = ?auto_47377 ?auto_47372 ) ) ( not ( = ?auto_47373 ?auto_47372 ) ) ( not ( = ?auto_47376 ?auto_47372 ) ) ( AVAILABLE ?auto_47380 ) ( IN ?auto_47373 ?auto_47375 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47380 ?auto_47373 ?auto_47375 ?auto_47386 )
      ( MAKE-ON ?auto_47370 ?auto_47371 )
      ( MAKE-ON-VERIFY ?auto_47370 ?auto_47371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47395 - SURFACE
      ?auto_47396 - SURFACE
    )
    :vars
    (
      ?auto_47416 - HOIST
      ?auto_47415 - PLACE
      ?auto_47402 - PLACE
      ?auto_47419 - HOIST
      ?auto_47408 - SURFACE
      ?auto_47417 - SURFACE
      ?auto_47406 - PLACE
      ?auto_47399 - HOIST
      ?auto_47398 - SURFACE
      ?auto_47400 - SURFACE
      ?auto_47401 - PLACE
      ?auto_47411 - HOIST
      ?auto_47403 - SURFACE
      ?auto_47404 - SURFACE
      ?auto_47412 - PLACE
      ?auto_47413 - HOIST
      ?auto_47418 - SURFACE
      ?auto_47405 - SURFACE
      ?auto_47397 - PLACE
      ?auto_47410 - HOIST
      ?auto_47407 - SURFACE
      ?auto_47409 - SURFACE
      ?auto_47414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47416 ?auto_47415 ) ( IS-CRATE ?auto_47395 ) ( not ( = ?auto_47395 ?auto_47396 ) ) ( not ( = ?auto_47402 ?auto_47415 ) ) ( HOIST-AT ?auto_47419 ?auto_47402 ) ( not ( = ?auto_47416 ?auto_47419 ) ) ( AVAILABLE ?auto_47419 ) ( SURFACE-AT ?auto_47395 ?auto_47402 ) ( ON ?auto_47395 ?auto_47408 ) ( CLEAR ?auto_47395 ) ( not ( = ?auto_47395 ?auto_47408 ) ) ( not ( = ?auto_47396 ?auto_47408 ) ) ( IS-CRATE ?auto_47396 ) ( not ( = ?auto_47395 ?auto_47417 ) ) ( not ( = ?auto_47396 ?auto_47417 ) ) ( not ( = ?auto_47408 ?auto_47417 ) ) ( not ( = ?auto_47406 ?auto_47415 ) ) ( not ( = ?auto_47402 ?auto_47406 ) ) ( HOIST-AT ?auto_47399 ?auto_47406 ) ( not ( = ?auto_47416 ?auto_47399 ) ) ( not ( = ?auto_47419 ?auto_47399 ) ) ( AVAILABLE ?auto_47399 ) ( SURFACE-AT ?auto_47396 ?auto_47406 ) ( ON ?auto_47396 ?auto_47398 ) ( CLEAR ?auto_47396 ) ( not ( = ?auto_47395 ?auto_47398 ) ) ( not ( = ?auto_47396 ?auto_47398 ) ) ( not ( = ?auto_47408 ?auto_47398 ) ) ( not ( = ?auto_47417 ?auto_47398 ) ) ( IS-CRATE ?auto_47417 ) ( not ( = ?auto_47395 ?auto_47400 ) ) ( not ( = ?auto_47396 ?auto_47400 ) ) ( not ( = ?auto_47408 ?auto_47400 ) ) ( not ( = ?auto_47417 ?auto_47400 ) ) ( not ( = ?auto_47398 ?auto_47400 ) ) ( not ( = ?auto_47401 ?auto_47415 ) ) ( not ( = ?auto_47402 ?auto_47401 ) ) ( not ( = ?auto_47406 ?auto_47401 ) ) ( HOIST-AT ?auto_47411 ?auto_47401 ) ( not ( = ?auto_47416 ?auto_47411 ) ) ( not ( = ?auto_47419 ?auto_47411 ) ) ( not ( = ?auto_47399 ?auto_47411 ) ) ( AVAILABLE ?auto_47411 ) ( SURFACE-AT ?auto_47417 ?auto_47401 ) ( ON ?auto_47417 ?auto_47403 ) ( CLEAR ?auto_47417 ) ( not ( = ?auto_47395 ?auto_47403 ) ) ( not ( = ?auto_47396 ?auto_47403 ) ) ( not ( = ?auto_47408 ?auto_47403 ) ) ( not ( = ?auto_47417 ?auto_47403 ) ) ( not ( = ?auto_47398 ?auto_47403 ) ) ( not ( = ?auto_47400 ?auto_47403 ) ) ( IS-CRATE ?auto_47400 ) ( not ( = ?auto_47395 ?auto_47404 ) ) ( not ( = ?auto_47396 ?auto_47404 ) ) ( not ( = ?auto_47408 ?auto_47404 ) ) ( not ( = ?auto_47417 ?auto_47404 ) ) ( not ( = ?auto_47398 ?auto_47404 ) ) ( not ( = ?auto_47400 ?auto_47404 ) ) ( not ( = ?auto_47403 ?auto_47404 ) ) ( not ( = ?auto_47412 ?auto_47415 ) ) ( not ( = ?auto_47402 ?auto_47412 ) ) ( not ( = ?auto_47406 ?auto_47412 ) ) ( not ( = ?auto_47401 ?auto_47412 ) ) ( HOIST-AT ?auto_47413 ?auto_47412 ) ( not ( = ?auto_47416 ?auto_47413 ) ) ( not ( = ?auto_47419 ?auto_47413 ) ) ( not ( = ?auto_47399 ?auto_47413 ) ) ( not ( = ?auto_47411 ?auto_47413 ) ) ( AVAILABLE ?auto_47413 ) ( SURFACE-AT ?auto_47400 ?auto_47412 ) ( ON ?auto_47400 ?auto_47418 ) ( CLEAR ?auto_47400 ) ( not ( = ?auto_47395 ?auto_47418 ) ) ( not ( = ?auto_47396 ?auto_47418 ) ) ( not ( = ?auto_47408 ?auto_47418 ) ) ( not ( = ?auto_47417 ?auto_47418 ) ) ( not ( = ?auto_47398 ?auto_47418 ) ) ( not ( = ?auto_47400 ?auto_47418 ) ) ( not ( = ?auto_47403 ?auto_47418 ) ) ( not ( = ?auto_47404 ?auto_47418 ) ) ( IS-CRATE ?auto_47404 ) ( not ( = ?auto_47395 ?auto_47405 ) ) ( not ( = ?auto_47396 ?auto_47405 ) ) ( not ( = ?auto_47408 ?auto_47405 ) ) ( not ( = ?auto_47417 ?auto_47405 ) ) ( not ( = ?auto_47398 ?auto_47405 ) ) ( not ( = ?auto_47400 ?auto_47405 ) ) ( not ( = ?auto_47403 ?auto_47405 ) ) ( not ( = ?auto_47404 ?auto_47405 ) ) ( not ( = ?auto_47418 ?auto_47405 ) ) ( not ( = ?auto_47397 ?auto_47415 ) ) ( not ( = ?auto_47402 ?auto_47397 ) ) ( not ( = ?auto_47406 ?auto_47397 ) ) ( not ( = ?auto_47401 ?auto_47397 ) ) ( not ( = ?auto_47412 ?auto_47397 ) ) ( HOIST-AT ?auto_47410 ?auto_47397 ) ( not ( = ?auto_47416 ?auto_47410 ) ) ( not ( = ?auto_47419 ?auto_47410 ) ) ( not ( = ?auto_47399 ?auto_47410 ) ) ( not ( = ?auto_47411 ?auto_47410 ) ) ( not ( = ?auto_47413 ?auto_47410 ) ) ( AVAILABLE ?auto_47410 ) ( SURFACE-AT ?auto_47404 ?auto_47397 ) ( ON ?auto_47404 ?auto_47407 ) ( CLEAR ?auto_47404 ) ( not ( = ?auto_47395 ?auto_47407 ) ) ( not ( = ?auto_47396 ?auto_47407 ) ) ( not ( = ?auto_47408 ?auto_47407 ) ) ( not ( = ?auto_47417 ?auto_47407 ) ) ( not ( = ?auto_47398 ?auto_47407 ) ) ( not ( = ?auto_47400 ?auto_47407 ) ) ( not ( = ?auto_47403 ?auto_47407 ) ) ( not ( = ?auto_47404 ?auto_47407 ) ) ( not ( = ?auto_47418 ?auto_47407 ) ) ( not ( = ?auto_47405 ?auto_47407 ) ) ( SURFACE-AT ?auto_47409 ?auto_47415 ) ( CLEAR ?auto_47409 ) ( IS-CRATE ?auto_47405 ) ( not ( = ?auto_47395 ?auto_47409 ) ) ( not ( = ?auto_47396 ?auto_47409 ) ) ( not ( = ?auto_47408 ?auto_47409 ) ) ( not ( = ?auto_47417 ?auto_47409 ) ) ( not ( = ?auto_47398 ?auto_47409 ) ) ( not ( = ?auto_47400 ?auto_47409 ) ) ( not ( = ?auto_47403 ?auto_47409 ) ) ( not ( = ?auto_47404 ?auto_47409 ) ) ( not ( = ?auto_47418 ?auto_47409 ) ) ( not ( = ?auto_47405 ?auto_47409 ) ) ( not ( = ?auto_47407 ?auto_47409 ) ) ( AVAILABLE ?auto_47416 ) ( IN ?auto_47405 ?auto_47414 ) ( TRUCK-AT ?auto_47414 ?auto_47401 ) )
    :subtasks
    ( ( !DRIVE ?auto_47414 ?auto_47401 ?auto_47415 )
      ( MAKE-ON ?auto_47395 ?auto_47396 )
      ( MAKE-ON-VERIFY ?auto_47395 ?auto_47396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47420 - SURFACE
      ?auto_47421 - SURFACE
    )
    :vars
    (
      ?auto_47440 - HOIST
      ?auto_47431 - PLACE
      ?auto_47436 - PLACE
      ?auto_47443 - HOIST
      ?auto_47422 - SURFACE
      ?auto_47441 - SURFACE
      ?auto_47427 - PLACE
      ?auto_47425 - HOIST
      ?auto_47439 - SURFACE
      ?auto_47432 - SURFACE
      ?auto_47423 - PLACE
      ?auto_47433 - HOIST
      ?auto_47424 - SURFACE
      ?auto_47438 - SURFACE
      ?auto_47444 - PLACE
      ?auto_47429 - HOIST
      ?auto_47442 - SURFACE
      ?auto_47435 - SURFACE
      ?auto_47434 - PLACE
      ?auto_47437 - HOIST
      ?auto_47428 - SURFACE
      ?auto_47426 - SURFACE
      ?auto_47430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47440 ?auto_47431 ) ( IS-CRATE ?auto_47420 ) ( not ( = ?auto_47420 ?auto_47421 ) ) ( not ( = ?auto_47436 ?auto_47431 ) ) ( HOIST-AT ?auto_47443 ?auto_47436 ) ( not ( = ?auto_47440 ?auto_47443 ) ) ( AVAILABLE ?auto_47443 ) ( SURFACE-AT ?auto_47420 ?auto_47436 ) ( ON ?auto_47420 ?auto_47422 ) ( CLEAR ?auto_47420 ) ( not ( = ?auto_47420 ?auto_47422 ) ) ( not ( = ?auto_47421 ?auto_47422 ) ) ( IS-CRATE ?auto_47421 ) ( not ( = ?auto_47420 ?auto_47441 ) ) ( not ( = ?auto_47421 ?auto_47441 ) ) ( not ( = ?auto_47422 ?auto_47441 ) ) ( not ( = ?auto_47427 ?auto_47431 ) ) ( not ( = ?auto_47436 ?auto_47427 ) ) ( HOIST-AT ?auto_47425 ?auto_47427 ) ( not ( = ?auto_47440 ?auto_47425 ) ) ( not ( = ?auto_47443 ?auto_47425 ) ) ( AVAILABLE ?auto_47425 ) ( SURFACE-AT ?auto_47421 ?auto_47427 ) ( ON ?auto_47421 ?auto_47439 ) ( CLEAR ?auto_47421 ) ( not ( = ?auto_47420 ?auto_47439 ) ) ( not ( = ?auto_47421 ?auto_47439 ) ) ( not ( = ?auto_47422 ?auto_47439 ) ) ( not ( = ?auto_47441 ?auto_47439 ) ) ( IS-CRATE ?auto_47441 ) ( not ( = ?auto_47420 ?auto_47432 ) ) ( not ( = ?auto_47421 ?auto_47432 ) ) ( not ( = ?auto_47422 ?auto_47432 ) ) ( not ( = ?auto_47441 ?auto_47432 ) ) ( not ( = ?auto_47439 ?auto_47432 ) ) ( not ( = ?auto_47423 ?auto_47431 ) ) ( not ( = ?auto_47436 ?auto_47423 ) ) ( not ( = ?auto_47427 ?auto_47423 ) ) ( HOIST-AT ?auto_47433 ?auto_47423 ) ( not ( = ?auto_47440 ?auto_47433 ) ) ( not ( = ?auto_47443 ?auto_47433 ) ) ( not ( = ?auto_47425 ?auto_47433 ) ) ( SURFACE-AT ?auto_47441 ?auto_47423 ) ( ON ?auto_47441 ?auto_47424 ) ( CLEAR ?auto_47441 ) ( not ( = ?auto_47420 ?auto_47424 ) ) ( not ( = ?auto_47421 ?auto_47424 ) ) ( not ( = ?auto_47422 ?auto_47424 ) ) ( not ( = ?auto_47441 ?auto_47424 ) ) ( not ( = ?auto_47439 ?auto_47424 ) ) ( not ( = ?auto_47432 ?auto_47424 ) ) ( IS-CRATE ?auto_47432 ) ( not ( = ?auto_47420 ?auto_47438 ) ) ( not ( = ?auto_47421 ?auto_47438 ) ) ( not ( = ?auto_47422 ?auto_47438 ) ) ( not ( = ?auto_47441 ?auto_47438 ) ) ( not ( = ?auto_47439 ?auto_47438 ) ) ( not ( = ?auto_47432 ?auto_47438 ) ) ( not ( = ?auto_47424 ?auto_47438 ) ) ( not ( = ?auto_47444 ?auto_47431 ) ) ( not ( = ?auto_47436 ?auto_47444 ) ) ( not ( = ?auto_47427 ?auto_47444 ) ) ( not ( = ?auto_47423 ?auto_47444 ) ) ( HOIST-AT ?auto_47429 ?auto_47444 ) ( not ( = ?auto_47440 ?auto_47429 ) ) ( not ( = ?auto_47443 ?auto_47429 ) ) ( not ( = ?auto_47425 ?auto_47429 ) ) ( not ( = ?auto_47433 ?auto_47429 ) ) ( AVAILABLE ?auto_47429 ) ( SURFACE-AT ?auto_47432 ?auto_47444 ) ( ON ?auto_47432 ?auto_47442 ) ( CLEAR ?auto_47432 ) ( not ( = ?auto_47420 ?auto_47442 ) ) ( not ( = ?auto_47421 ?auto_47442 ) ) ( not ( = ?auto_47422 ?auto_47442 ) ) ( not ( = ?auto_47441 ?auto_47442 ) ) ( not ( = ?auto_47439 ?auto_47442 ) ) ( not ( = ?auto_47432 ?auto_47442 ) ) ( not ( = ?auto_47424 ?auto_47442 ) ) ( not ( = ?auto_47438 ?auto_47442 ) ) ( IS-CRATE ?auto_47438 ) ( not ( = ?auto_47420 ?auto_47435 ) ) ( not ( = ?auto_47421 ?auto_47435 ) ) ( not ( = ?auto_47422 ?auto_47435 ) ) ( not ( = ?auto_47441 ?auto_47435 ) ) ( not ( = ?auto_47439 ?auto_47435 ) ) ( not ( = ?auto_47432 ?auto_47435 ) ) ( not ( = ?auto_47424 ?auto_47435 ) ) ( not ( = ?auto_47438 ?auto_47435 ) ) ( not ( = ?auto_47442 ?auto_47435 ) ) ( not ( = ?auto_47434 ?auto_47431 ) ) ( not ( = ?auto_47436 ?auto_47434 ) ) ( not ( = ?auto_47427 ?auto_47434 ) ) ( not ( = ?auto_47423 ?auto_47434 ) ) ( not ( = ?auto_47444 ?auto_47434 ) ) ( HOIST-AT ?auto_47437 ?auto_47434 ) ( not ( = ?auto_47440 ?auto_47437 ) ) ( not ( = ?auto_47443 ?auto_47437 ) ) ( not ( = ?auto_47425 ?auto_47437 ) ) ( not ( = ?auto_47433 ?auto_47437 ) ) ( not ( = ?auto_47429 ?auto_47437 ) ) ( AVAILABLE ?auto_47437 ) ( SURFACE-AT ?auto_47438 ?auto_47434 ) ( ON ?auto_47438 ?auto_47428 ) ( CLEAR ?auto_47438 ) ( not ( = ?auto_47420 ?auto_47428 ) ) ( not ( = ?auto_47421 ?auto_47428 ) ) ( not ( = ?auto_47422 ?auto_47428 ) ) ( not ( = ?auto_47441 ?auto_47428 ) ) ( not ( = ?auto_47439 ?auto_47428 ) ) ( not ( = ?auto_47432 ?auto_47428 ) ) ( not ( = ?auto_47424 ?auto_47428 ) ) ( not ( = ?auto_47438 ?auto_47428 ) ) ( not ( = ?auto_47442 ?auto_47428 ) ) ( not ( = ?auto_47435 ?auto_47428 ) ) ( SURFACE-AT ?auto_47426 ?auto_47431 ) ( CLEAR ?auto_47426 ) ( IS-CRATE ?auto_47435 ) ( not ( = ?auto_47420 ?auto_47426 ) ) ( not ( = ?auto_47421 ?auto_47426 ) ) ( not ( = ?auto_47422 ?auto_47426 ) ) ( not ( = ?auto_47441 ?auto_47426 ) ) ( not ( = ?auto_47439 ?auto_47426 ) ) ( not ( = ?auto_47432 ?auto_47426 ) ) ( not ( = ?auto_47424 ?auto_47426 ) ) ( not ( = ?auto_47438 ?auto_47426 ) ) ( not ( = ?auto_47442 ?auto_47426 ) ) ( not ( = ?auto_47435 ?auto_47426 ) ) ( not ( = ?auto_47428 ?auto_47426 ) ) ( AVAILABLE ?auto_47440 ) ( TRUCK-AT ?auto_47430 ?auto_47423 ) ( LIFTING ?auto_47433 ?auto_47435 ) )
    :subtasks
    ( ( !LOAD ?auto_47433 ?auto_47435 ?auto_47430 ?auto_47423 )
      ( MAKE-ON ?auto_47420 ?auto_47421 )
      ( MAKE-ON-VERIFY ?auto_47420 ?auto_47421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47445 - SURFACE
      ?auto_47446 - SURFACE
    )
    :vars
    (
      ?auto_47454 - HOIST
      ?auto_47468 - PLACE
      ?auto_47460 - PLACE
      ?auto_47456 - HOIST
      ?auto_47458 - SURFACE
      ?auto_47464 - SURFACE
      ?auto_47451 - PLACE
      ?auto_47461 - HOIST
      ?auto_47465 - SURFACE
      ?auto_47467 - SURFACE
      ?auto_47449 - PLACE
      ?auto_47466 - HOIST
      ?auto_47448 - SURFACE
      ?auto_47459 - SURFACE
      ?auto_47457 - PLACE
      ?auto_47447 - HOIST
      ?auto_47453 - SURFACE
      ?auto_47455 - SURFACE
      ?auto_47463 - PLACE
      ?auto_47452 - HOIST
      ?auto_47469 - SURFACE
      ?auto_47462 - SURFACE
      ?auto_47450 - TRUCK
      ?auto_47470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47454 ?auto_47468 ) ( IS-CRATE ?auto_47445 ) ( not ( = ?auto_47445 ?auto_47446 ) ) ( not ( = ?auto_47460 ?auto_47468 ) ) ( HOIST-AT ?auto_47456 ?auto_47460 ) ( not ( = ?auto_47454 ?auto_47456 ) ) ( AVAILABLE ?auto_47456 ) ( SURFACE-AT ?auto_47445 ?auto_47460 ) ( ON ?auto_47445 ?auto_47458 ) ( CLEAR ?auto_47445 ) ( not ( = ?auto_47445 ?auto_47458 ) ) ( not ( = ?auto_47446 ?auto_47458 ) ) ( IS-CRATE ?auto_47446 ) ( not ( = ?auto_47445 ?auto_47464 ) ) ( not ( = ?auto_47446 ?auto_47464 ) ) ( not ( = ?auto_47458 ?auto_47464 ) ) ( not ( = ?auto_47451 ?auto_47468 ) ) ( not ( = ?auto_47460 ?auto_47451 ) ) ( HOIST-AT ?auto_47461 ?auto_47451 ) ( not ( = ?auto_47454 ?auto_47461 ) ) ( not ( = ?auto_47456 ?auto_47461 ) ) ( AVAILABLE ?auto_47461 ) ( SURFACE-AT ?auto_47446 ?auto_47451 ) ( ON ?auto_47446 ?auto_47465 ) ( CLEAR ?auto_47446 ) ( not ( = ?auto_47445 ?auto_47465 ) ) ( not ( = ?auto_47446 ?auto_47465 ) ) ( not ( = ?auto_47458 ?auto_47465 ) ) ( not ( = ?auto_47464 ?auto_47465 ) ) ( IS-CRATE ?auto_47464 ) ( not ( = ?auto_47445 ?auto_47467 ) ) ( not ( = ?auto_47446 ?auto_47467 ) ) ( not ( = ?auto_47458 ?auto_47467 ) ) ( not ( = ?auto_47464 ?auto_47467 ) ) ( not ( = ?auto_47465 ?auto_47467 ) ) ( not ( = ?auto_47449 ?auto_47468 ) ) ( not ( = ?auto_47460 ?auto_47449 ) ) ( not ( = ?auto_47451 ?auto_47449 ) ) ( HOIST-AT ?auto_47466 ?auto_47449 ) ( not ( = ?auto_47454 ?auto_47466 ) ) ( not ( = ?auto_47456 ?auto_47466 ) ) ( not ( = ?auto_47461 ?auto_47466 ) ) ( SURFACE-AT ?auto_47464 ?auto_47449 ) ( ON ?auto_47464 ?auto_47448 ) ( CLEAR ?auto_47464 ) ( not ( = ?auto_47445 ?auto_47448 ) ) ( not ( = ?auto_47446 ?auto_47448 ) ) ( not ( = ?auto_47458 ?auto_47448 ) ) ( not ( = ?auto_47464 ?auto_47448 ) ) ( not ( = ?auto_47465 ?auto_47448 ) ) ( not ( = ?auto_47467 ?auto_47448 ) ) ( IS-CRATE ?auto_47467 ) ( not ( = ?auto_47445 ?auto_47459 ) ) ( not ( = ?auto_47446 ?auto_47459 ) ) ( not ( = ?auto_47458 ?auto_47459 ) ) ( not ( = ?auto_47464 ?auto_47459 ) ) ( not ( = ?auto_47465 ?auto_47459 ) ) ( not ( = ?auto_47467 ?auto_47459 ) ) ( not ( = ?auto_47448 ?auto_47459 ) ) ( not ( = ?auto_47457 ?auto_47468 ) ) ( not ( = ?auto_47460 ?auto_47457 ) ) ( not ( = ?auto_47451 ?auto_47457 ) ) ( not ( = ?auto_47449 ?auto_47457 ) ) ( HOIST-AT ?auto_47447 ?auto_47457 ) ( not ( = ?auto_47454 ?auto_47447 ) ) ( not ( = ?auto_47456 ?auto_47447 ) ) ( not ( = ?auto_47461 ?auto_47447 ) ) ( not ( = ?auto_47466 ?auto_47447 ) ) ( AVAILABLE ?auto_47447 ) ( SURFACE-AT ?auto_47467 ?auto_47457 ) ( ON ?auto_47467 ?auto_47453 ) ( CLEAR ?auto_47467 ) ( not ( = ?auto_47445 ?auto_47453 ) ) ( not ( = ?auto_47446 ?auto_47453 ) ) ( not ( = ?auto_47458 ?auto_47453 ) ) ( not ( = ?auto_47464 ?auto_47453 ) ) ( not ( = ?auto_47465 ?auto_47453 ) ) ( not ( = ?auto_47467 ?auto_47453 ) ) ( not ( = ?auto_47448 ?auto_47453 ) ) ( not ( = ?auto_47459 ?auto_47453 ) ) ( IS-CRATE ?auto_47459 ) ( not ( = ?auto_47445 ?auto_47455 ) ) ( not ( = ?auto_47446 ?auto_47455 ) ) ( not ( = ?auto_47458 ?auto_47455 ) ) ( not ( = ?auto_47464 ?auto_47455 ) ) ( not ( = ?auto_47465 ?auto_47455 ) ) ( not ( = ?auto_47467 ?auto_47455 ) ) ( not ( = ?auto_47448 ?auto_47455 ) ) ( not ( = ?auto_47459 ?auto_47455 ) ) ( not ( = ?auto_47453 ?auto_47455 ) ) ( not ( = ?auto_47463 ?auto_47468 ) ) ( not ( = ?auto_47460 ?auto_47463 ) ) ( not ( = ?auto_47451 ?auto_47463 ) ) ( not ( = ?auto_47449 ?auto_47463 ) ) ( not ( = ?auto_47457 ?auto_47463 ) ) ( HOIST-AT ?auto_47452 ?auto_47463 ) ( not ( = ?auto_47454 ?auto_47452 ) ) ( not ( = ?auto_47456 ?auto_47452 ) ) ( not ( = ?auto_47461 ?auto_47452 ) ) ( not ( = ?auto_47466 ?auto_47452 ) ) ( not ( = ?auto_47447 ?auto_47452 ) ) ( AVAILABLE ?auto_47452 ) ( SURFACE-AT ?auto_47459 ?auto_47463 ) ( ON ?auto_47459 ?auto_47469 ) ( CLEAR ?auto_47459 ) ( not ( = ?auto_47445 ?auto_47469 ) ) ( not ( = ?auto_47446 ?auto_47469 ) ) ( not ( = ?auto_47458 ?auto_47469 ) ) ( not ( = ?auto_47464 ?auto_47469 ) ) ( not ( = ?auto_47465 ?auto_47469 ) ) ( not ( = ?auto_47467 ?auto_47469 ) ) ( not ( = ?auto_47448 ?auto_47469 ) ) ( not ( = ?auto_47459 ?auto_47469 ) ) ( not ( = ?auto_47453 ?auto_47469 ) ) ( not ( = ?auto_47455 ?auto_47469 ) ) ( SURFACE-AT ?auto_47462 ?auto_47468 ) ( CLEAR ?auto_47462 ) ( IS-CRATE ?auto_47455 ) ( not ( = ?auto_47445 ?auto_47462 ) ) ( not ( = ?auto_47446 ?auto_47462 ) ) ( not ( = ?auto_47458 ?auto_47462 ) ) ( not ( = ?auto_47464 ?auto_47462 ) ) ( not ( = ?auto_47465 ?auto_47462 ) ) ( not ( = ?auto_47467 ?auto_47462 ) ) ( not ( = ?auto_47448 ?auto_47462 ) ) ( not ( = ?auto_47459 ?auto_47462 ) ) ( not ( = ?auto_47453 ?auto_47462 ) ) ( not ( = ?auto_47455 ?auto_47462 ) ) ( not ( = ?auto_47469 ?auto_47462 ) ) ( AVAILABLE ?auto_47454 ) ( TRUCK-AT ?auto_47450 ?auto_47449 ) ( AVAILABLE ?auto_47466 ) ( SURFACE-AT ?auto_47455 ?auto_47449 ) ( ON ?auto_47455 ?auto_47470 ) ( CLEAR ?auto_47455 ) ( not ( = ?auto_47445 ?auto_47470 ) ) ( not ( = ?auto_47446 ?auto_47470 ) ) ( not ( = ?auto_47458 ?auto_47470 ) ) ( not ( = ?auto_47464 ?auto_47470 ) ) ( not ( = ?auto_47465 ?auto_47470 ) ) ( not ( = ?auto_47467 ?auto_47470 ) ) ( not ( = ?auto_47448 ?auto_47470 ) ) ( not ( = ?auto_47459 ?auto_47470 ) ) ( not ( = ?auto_47453 ?auto_47470 ) ) ( not ( = ?auto_47455 ?auto_47470 ) ) ( not ( = ?auto_47469 ?auto_47470 ) ) ( not ( = ?auto_47462 ?auto_47470 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47466 ?auto_47455 ?auto_47470 ?auto_47449 )
      ( MAKE-ON ?auto_47445 ?auto_47446 )
      ( MAKE-ON-VERIFY ?auto_47445 ?auto_47446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47471 - SURFACE
      ?auto_47472 - SURFACE
    )
    :vars
    (
      ?auto_47473 - HOIST
      ?auto_47476 - PLACE
      ?auto_47486 - PLACE
      ?auto_47484 - HOIST
      ?auto_47488 - SURFACE
      ?auto_47482 - SURFACE
      ?auto_47495 - PLACE
      ?auto_47493 - HOIST
      ?auto_47489 - SURFACE
      ?auto_47475 - SURFACE
      ?auto_47474 - PLACE
      ?auto_47490 - HOIST
      ?auto_47494 - SURFACE
      ?auto_47485 - SURFACE
      ?auto_47487 - PLACE
      ?auto_47483 - HOIST
      ?auto_47492 - SURFACE
      ?auto_47478 - SURFACE
      ?auto_47481 - PLACE
      ?auto_47477 - HOIST
      ?auto_47479 - SURFACE
      ?auto_47480 - SURFACE
      ?auto_47491 - SURFACE
      ?auto_47496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47473 ?auto_47476 ) ( IS-CRATE ?auto_47471 ) ( not ( = ?auto_47471 ?auto_47472 ) ) ( not ( = ?auto_47486 ?auto_47476 ) ) ( HOIST-AT ?auto_47484 ?auto_47486 ) ( not ( = ?auto_47473 ?auto_47484 ) ) ( AVAILABLE ?auto_47484 ) ( SURFACE-AT ?auto_47471 ?auto_47486 ) ( ON ?auto_47471 ?auto_47488 ) ( CLEAR ?auto_47471 ) ( not ( = ?auto_47471 ?auto_47488 ) ) ( not ( = ?auto_47472 ?auto_47488 ) ) ( IS-CRATE ?auto_47472 ) ( not ( = ?auto_47471 ?auto_47482 ) ) ( not ( = ?auto_47472 ?auto_47482 ) ) ( not ( = ?auto_47488 ?auto_47482 ) ) ( not ( = ?auto_47495 ?auto_47476 ) ) ( not ( = ?auto_47486 ?auto_47495 ) ) ( HOIST-AT ?auto_47493 ?auto_47495 ) ( not ( = ?auto_47473 ?auto_47493 ) ) ( not ( = ?auto_47484 ?auto_47493 ) ) ( AVAILABLE ?auto_47493 ) ( SURFACE-AT ?auto_47472 ?auto_47495 ) ( ON ?auto_47472 ?auto_47489 ) ( CLEAR ?auto_47472 ) ( not ( = ?auto_47471 ?auto_47489 ) ) ( not ( = ?auto_47472 ?auto_47489 ) ) ( not ( = ?auto_47488 ?auto_47489 ) ) ( not ( = ?auto_47482 ?auto_47489 ) ) ( IS-CRATE ?auto_47482 ) ( not ( = ?auto_47471 ?auto_47475 ) ) ( not ( = ?auto_47472 ?auto_47475 ) ) ( not ( = ?auto_47488 ?auto_47475 ) ) ( not ( = ?auto_47482 ?auto_47475 ) ) ( not ( = ?auto_47489 ?auto_47475 ) ) ( not ( = ?auto_47474 ?auto_47476 ) ) ( not ( = ?auto_47486 ?auto_47474 ) ) ( not ( = ?auto_47495 ?auto_47474 ) ) ( HOIST-AT ?auto_47490 ?auto_47474 ) ( not ( = ?auto_47473 ?auto_47490 ) ) ( not ( = ?auto_47484 ?auto_47490 ) ) ( not ( = ?auto_47493 ?auto_47490 ) ) ( SURFACE-AT ?auto_47482 ?auto_47474 ) ( ON ?auto_47482 ?auto_47494 ) ( CLEAR ?auto_47482 ) ( not ( = ?auto_47471 ?auto_47494 ) ) ( not ( = ?auto_47472 ?auto_47494 ) ) ( not ( = ?auto_47488 ?auto_47494 ) ) ( not ( = ?auto_47482 ?auto_47494 ) ) ( not ( = ?auto_47489 ?auto_47494 ) ) ( not ( = ?auto_47475 ?auto_47494 ) ) ( IS-CRATE ?auto_47475 ) ( not ( = ?auto_47471 ?auto_47485 ) ) ( not ( = ?auto_47472 ?auto_47485 ) ) ( not ( = ?auto_47488 ?auto_47485 ) ) ( not ( = ?auto_47482 ?auto_47485 ) ) ( not ( = ?auto_47489 ?auto_47485 ) ) ( not ( = ?auto_47475 ?auto_47485 ) ) ( not ( = ?auto_47494 ?auto_47485 ) ) ( not ( = ?auto_47487 ?auto_47476 ) ) ( not ( = ?auto_47486 ?auto_47487 ) ) ( not ( = ?auto_47495 ?auto_47487 ) ) ( not ( = ?auto_47474 ?auto_47487 ) ) ( HOIST-AT ?auto_47483 ?auto_47487 ) ( not ( = ?auto_47473 ?auto_47483 ) ) ( not ( = ?auto_47484 ?auto_47483 ) ) ( not ( = ?auto_47493 ?auto_47483 ) ) ( not ( = ?auto_47490 ?auto_47483 ) ) ( AVAILABLE ?auto_47483 ) ( SURFACE-AT ?auto_47475 ?auto_47487 ) ( ON ?auto_47475 ?auto_47492 ) ( CLEAR ?auto_47475 ) ( not ( = ?auto_47471 ?auto_47492 ) ) ( not ( = ?auto_47472 ?auto_47492 ) ) ( not ( = ?auto_47488 ?auto_47492 ) ) ( not ( = ?auto_47482 ?auto_47492 ) ) ( not ( = ?auto_47489 ?auto_47492 ) ) ( not ( = ?auto_47475 ?auto_47492 ) ) ( not ( = ?auto_47494 ?auto_47492 ) ) ( not ( = ?auto_47485 ?auto_47492 ) ) ( IS-CRATE ?auto_47485 ) ( not ( = ?auto_47471 ?auto_47478 ) ) ( not ( = ?auto_47472 ?auto_47478 ) ) ( not ( = ?auto_47488 ?auto_47478 ) ) ( not ( = ?auto_47482 ?auto_47478 ) ) ( not ( = ?auto_47489 ?auto_47478 ) ) ( not ( = ?auto_47475 ?auto_47478 ) ) ( not ( = ?auto_47494 ?auto_47478 ) ) ( not ( = ?auto_47485 ?auto_47478 ) ) ( not ( = ?auto_47492 ?auto_47478 ) ) ( not ( = ?auto_47481 ?auto_47476 ) ) ( not ( = ?auto_47486 ?auto_47481 ) ) ( not ( = ?auto_47495 ?auto_47481 ) ) ( not ( = ?auto_47474 ?auto_47481 ) ) ( not ( = ?auto_47487 ?auto_47481 ) ) ( HOIST-AT ?auto_47477 ?auto_47481 ) ( not ( = ?auto_47473 ?auto_47477 ) ) ( not ( = ?auto_47484 ?auto_47477 ) ) ( not ( = ?auto_47493 ?auto_47477 ) ) ( not ( = ?auto_47490 ?auto_47477 ) ) ( not ( = ?auto_47483 ?auto_47477 ) ) ( AVAILABLE ?auto_47477 ) ( SURFACE-AT ?auto_47485 ?auto_47481 ) ( ON ?auto_47485 ?auto_47479 ) ( CLEAR ?auto_47485 ) ( not ( = ?auto_47471 ?auto_47479 ) ) ( not ( = ?auto_47472 ?auto_47479 ) ) ( not ( = ?auto_47488 ?auto_47479 ) ) ( not ( = ?auto_47482 ?auto_47479 ) ) ( not ( = ?auto_47489 ?auto_47479 ) ) ( not ( = ?auto_47475 ?auto_47479 ) ) ( not ( = ?auto_47494 ?auto_47479 ) ) ( not ( = ?auto_47485 ?auto_47479 ) ) ( not ( = ?auto_47492 ?auto_47479 ) ) ( not ( = ?auto_47478 ?auto_47479 ) ) ( SURFACE-AT ?auto_47480 ?auto_47476 ) ( CLEAR ?auto_47480 ) ( IS-CRATE ?auto_47478 ) ( not ( = ?auto_47471 ?auto_47480 ) ) ( not ( = ?auto_47472 ?auto_47480 ) ) ( not ( = ?auto_47488 ?auto_47480 ) ) ( not ( = ?auto_47482 ?auto_47480 ) ) ( not ( = ?auto_47489 ?auto_47480 ) ) ( not ( = ?auto_47475 ?auto_47480 ) ) ( not ( = ?auto_47494 ?auto_47480 ) ) ( not ( = ?auto_47485 ?auto_47480 ) ) ( not ( = ?auto_47492 ?auto_47480 ) ) ( not ( = ?auto_47478 ?auto_47480 ) ) ( not ( = ?auto_47479 ?auto_47480 ) ) ( AVAILABLE ?auto_47473 ) ( AVAILABLE ?auto_47490 ) ( SURFACE-AT ?auto_47478 ?auto_47474 ) ( ON ?auto_47478 ?auto_47491 ) ( CLEAR ?auto_47478 ) ( not ( = ?auto_47471 ?auto_47491 ) ) ( not ( = ?auto_47472 ?auto_47491 ) ) ( not ( = ?auto_47488 ?auto_47491 ) ) ( not ( = ?auto_47482 ?auto_47491 ) ) ( not ( = ?auto_47489 ?auto_47491 ) ) ( not ( = ?auto_47475 ?auto_47491 ) ) ( not ( = ?auto_47494 ?auto_47491 ) ) ( not ( = ?auto_47485 ?auto_47491 ) ) ( not ( = ?auto_47492 ?auto_47491 ) ) ( not ( = ?auto_47478 ?auto_47491 ) ) ( not ( = ?auto_47479 ?auto_47491 ) ) ( not ( = ?auto_47480 ?auto_47491 ) ) ( TRUCK-AT ?auto_47496 ?auto_47476 ) )
    :subtasks
    ( ( !DRIVE ?auto_47496 ?auto_47476 ?auto_47474 )
      ( MAKE-ON ?auto_47471 ?auto_47472 )
      ( MAKE-ON-VERIFY ?auto_47471 ?auto_47472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47499 - SURFACE
      ?auto_47500 - SURFACE
    )
    :vars
    (
      ?auto_47501 - HOIST
      ?auto_47502 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47501 ?auto_47502 ) ( SURFACE-AT ?auto_47500 ?auto_47502 ) ( CLEAR ?auto_47500 ) ( LIFTING ?auto_47501 ?auto_47499 ) ( IS-CRATE ?auto_47499 ) ( not ( = ?auto_47499 ?auto_47500 ) ) )
    :subtasks
    ( ( !DROP ?auto_47501 ?auto_47499 ?auto_47500 ?auto_47502 )
      ( MAKE-ON-VERIFY ?auto_47499 ?auto_47500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47503 - SURFACE
      ?auto_47504 - SURFACE
    )
    :vars
    (
      ?auto_47506 - HOIST
      ?auto_47505 - PLACE
      ?auto_47507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47506 ?auto_47505 ) ( SURFACE-AT ?auto_47504 ?auto_47505 ) ( CLEAR ?auto_47504 ) ( IS-CRATE ?auto_47503 ) ( not ( = ?auto_47503 ?auto_47504 ) ) ( TRUCK-AT ?auto_47507 ?auto_47505 ) ( AVAILABLE ?auto_47506 ) ( IN ?auto_47503 ?auto_47507 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47506 ?auto_47503 ?auto_47507 ?auto_47505 )
      ( MAKE-ON ?auto_47503 ?auto_47504 )
      ( MAKE-ON-VERIFY ?auto_47503 ?auto_47504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47508 - SURFACE
      ?auto_47509 - SURFACE
    )
    :vars
    (
      ?auto_47510 - HOIST
      ?auto_47512 - PLACE
      ?auto_47511 - TRUCK
      ?auto_47513 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47510 ?auto_47512 ) ( SURFACE-AT ?auto_47509 ?auto_47512 ) ( CLEAR ?auto_47509 ) ( IS-CRATE ?auto_47508 ) ( not ( = ?auto_47508 ?auto_47509 ) ) ( AVAILABLE ?auto_47510 ) ( IN ?auto_47508 ?auto_47511 ) ( TRUCK-AT ?auto_47511 ?auto_47513 ) ( not ( = ?auto_47513 ?auto_47512 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47511 ?auto_47513 ?auto_47512 )
      ( MAKE-ON ?auto_47508 ?auto_47509 )
      ( MAKE-ON-VERIFY ?auto_47508 ?auto_47509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47514 - SURFACE
      ?auto_47515 - SURFACE
    )
    :vars
    (
      ?auto_47516 - HOIST
      ?auto_47519 - PLACE
      ?auto_47518 - TRUCK
      ?auto_47517 - PLACE
      ?auto_47520 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47516 ?auto_47519 ) ( SURFACE-AT ?auto_47515 ?auto_47519 ) ( CLEAR ?auto_47515 ) ( IS-CRATE ?auto_47514 ) ( not ( = ?auto_47514 ?auto_47515 ) ) ( AVAILABLE ?auto_47516 ) ( TRUCK-AT ?auto_47518 ?auto_47517 ) ( not ( = ?auto_47517 ?auto_47519 ) ) ( HOIST-AT ?auto_47520 ?auto_47517 ) ( LIFTING ?auto_47520 ?auto_47514 ) ( not ( = ?auto_47516 ?auto_47520 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47520 ?auto_47514 ?auto_47518 ?auto_47517 )
      ( MAKE-ON ?auto_47514 ?auto_47515 )
      ( MAKE-ON-VERIFY ?auto_47514 ?auto_47515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47521 - SURFACE
      ?auto_47522 - SURFACE
    )
    :vars
    (
      ?auto_47523 - HOIST
      ?auto_47524 - PLACE
      ?auto_47526 - TRUCK
      ?auto_47525 - PLACE
      ?auto_47527 - HOIST
      ?auto_47528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47523 ?auto_47524 ) ( SURFACE-AT ?auto_47522 ?auto_47524 ) ( CLEAR ?auto_47522 ) ( IS-CRATE ?auto_47521 ) ( not ( = ?auto_47521 ?auto_47522 ) ) ( AVAILABLE ?auto_47523 ) ( TRUCK-AT ?auto_47526 ?auto_47525 ) ( not ( = ?auto_47525 ?auto_47524 ) ) ( HOIST-AT ?auto_47527 ?auto_47525 ) ( not ( = ?auto_47523 ?auto_47527 ) ) ( AVAILABLE ?auto_47527 ) ( SURFACE-AT ?auto_47521 ?auto_47525 ) ( ON ?auto_47521 ?auto_47528 ) ( CLEAR ?auto_47521 ) ( not ( = ?auto_47521 ?auto_47528 ) ) ( not ( = ?auto_47522 ?auto_47528 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47527 ?auto_47521 ?auto_47528 ?auto_47525 )
      ( MAKE-ON ?auto_47521 ?auto_47522 )
      ( MAKE-ON-VERIFY ?auto_47521 ?auto_47522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47529 - SURFACE
      ?auto_47530 - SURFACE
    )
    :vars
    (
      ?auto_47532 - HOIST
      ?auto_47536 - PLACE
      ?auto_47535 - PLACE
      ?auto_47533 - HOIST
      ?auto_47531 - SURFACE
      ?auto_47534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47532 ?auto_47536 ) ( SURFACE-AT ?auto_47530 ?auto_47536 ) ( CLEAR ?auto_47530 ) ( IS-CRATE ?auto_47529 ) ( not ( = ?auto_47529 ?auto_47530 ) ) ( AVAILABLE ?auto_47532 ) ( not ( = ?auto_47535 ?auto_47536 ) ) ( HOIST-AT ?auto_47533 ?auto_47535 ) ( not ( = ?auto_47532 ?auto_47533 ) ) ( AVAILABLE ?auto_47533 ) ( SURFACE-AT ?auto_47529 ?auto_47535 ) ( ON ?auto_47529 ?auto_47531 ) ( CLEAR ?auto_47529 ) ( not ( = ?auto_47529 ?auto_47531 ) ) ( not ( = ?auto_47530 ?auto_47531 ) ) ( TRUCK-AT ?auto_47534 ?auto_47536 ) )
    :subtasks
    ( ( !DRIVE ?auto_47534 ?auto_47536 ?auto_47535 )
      ( MAKE-ON ?auto_47529 ?auto_47530 )
      ( MAKE-ON-VERIFY ?auto_47529 ?auto_47530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47537 - SURFACE
      ?auto_47538 - SURFACE
    )
    :vars
    (
      ?auto_47539 - HOIST
      ?auto_47540 - PLACE
      ?auto_47542 - PLACE
      ?auto_47544 - HOIST
      ?auto_47541 - SURFACE
      ?auto_47543 - TRUCK
      ?auto_47545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47539 ?auto_47540 ) ( IS-CRATE ?auto_47537 ) ( not ( = ?auto_47537 ?auto_47538 ) ) ( not ( = ?auto_47542 ?auto_47540 ) ) ( HOIST-AT ?auto_47544 ?auto_47542 ) ( not ( = ?auto_47539 ?auto_47544 ) ) ( AVAILABLE ?auto_47544 ) ( SURFACE-AT ?auto_47537 ?auto_47542 ) ( ON ?auto_47537 ?auto_47541 ) ( CLEAR ?auto_47537 ) ( not ( = ?auto_47537 ?auto_47541 ) ) ( not ( = ?auto_47538 ?auto_47541 ) ) ( TRUCK-AT ?auto_47543 ?auto_47540 ) ( SURFACE-AT ?auto_47545 ?auto_47540 ) ( CLEAR ?auto_47545 ) ( LIFTING ?auto_47539 ?auto_47538 ) ( IS-CRATE ?auto_47538 ) ( not ( = ?auto_47537 ?auto_47545 ) ) ( not ( = ?auto_47538 ?auto_47545 ) ) ( not ( = ?auto_47541 ?auto_47545 ) ) )
    :subtasks
    ( ( !DROP ?auto_47539 ?auto_47538 ?auto_47545 ?auto_47540 )
      ( MAKE-ON ?auto_47537 ?auto_47538 )
      ( MAKE-ON-VERIFY ?auto_47537 ?auto_47538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47546 - SURFACE
      ?auto_47547 - SURFACE
    )
    :vars
    (
      ?auto_47550 - HOIST
      ?auto_47552 - PLACE
      ?auto_47553 - PLACE
      ?auto_47549 - HOIST
      ?auto_47548 - SURFACE
      ?auto_47551 - TRUCK
      ?auto_47554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47550 ?auto_47552 ) ( IS-CRATE ?auto_47546 ) ( not ( = ?auto_47546 ?auto_47547 ) ) ( not ( = ?auto_47553 ?auto_47552 ) ) ( HOIST-AT ?auto_47549 ?auto_47553 ) ( not ( = ?auto_47550 ?auto_47549 ) ) ( AVAILABLE ?auto_47549 ) ( SURFACE-AT ?auto_47546 ?auto_47553 ) ( ON ?auto_47546 ?auto_47548 ) ( CLEAR ?auto_47546 ) ( not ( = ?auto_47546 ?auto_47548 ) ) ( not ( = ?auto_47547 ?auto_47548 ) ) ( TRUCK-AT ?auto_47551 ?auto_47552 ) ( SURFACE-AT ?auto_47554 ?auto_47552 ) ( CLEAR ?auto_47554 ) ( IS-CRATE ?auto_47547 ) ( not ( = ?auto_47546 ?auto_47554 ) ) ( not ( = ?auto_47547 ?auto_47554 ) ) ( not ( = ?auto_47548 ?auto_47554 ) ) ( AVAILABLE ?auto_47550 ) ( IN ?auto_47547 ?auto_47551 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47550 ?auto_47547 ?auto_47551 ?auto_47552 )
      ( MAKE-ON ?auto_47546 ?auto_47547 )
      ( MAKE-ON-VERIFY ?auto_47546 ?auto_47547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47555 - SURFACE
      ?auto_47556 - SURFACE
    )
    :vars
    (
      ?auto_47562 - HOIST
      ?auto_47559 - PLACE
      ?auto_47557 - PLACE
      ?auto_47560 - HOIST
      ?auto_47561 - SURFACE
      ?auto_47563 - SURFACE
      ?auto_47558 - TRUCK
      ?auto_47564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47562 ?auto_47559 ) ( IS-CRATE ?auto_47555 ) ( not ( = ?auto_47555 ?auto_47556 ) ) ( not ( = ?auto_47557 ?auto_47559 ) ) ( HOIST-AT ?auto_47560 ?auto_47557 ) ( not ( = ?auto_47562 ?auto_47560 ) ) ( AVAILABLE ?auto_47560 ) ( SURFACE-AT ?auto_47555 ?auto_47557 ) ( ON ?auto_47555 ?auto_47561 ) ( CLEAR ?auto_47555 ) ( not ( = ?auto_47555 ?auto_47561 ) ) ( not ( = ?auto_47556 ?auto_47561 ) ) ( SURFACE-AT ?auto_47563 ?auto_47559 ) ( CLEAR ?auto_47563 ) ( IS-CRATE ?auto_47556 ) ( not ( = ?auto_47555 ?auto_47563 ) ) ( not ( = ?auto_47556 ?auto_47563 ) ) ( not ( = ?auto_47561 ?auto_47563 ) ) ( AVAILABLE ?auto_47562 ) ( IN ?auto_47556 ?auto_47558 ) ( TRUCK-AT ?auto_47558 ?auto_47564 ) ( not ( = ?auto_47564 ?auto_47559 ) ) ( not ( = ?auto_47557 ?auto_47564 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47558 ?auto_47564 ?auto_47559 )
      ( MAKE-ON ?auto_47555 ?auto_47556 )
      ( MAKE-ON-VERIFY ?auto_47555 ?auto_47556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47565 - SURFACE
      ?auto_47566 - SURFACE
    )
    :vars
    (
      ?auto_47574 - HOIST
      ?auto_47567 - PLACE
      ?auto_47569 - PLACE
      ?auto_47568 - HOIST
      ?auto_47573 - SURFACE
      ?auto_47571 - SURFACE
      ?auto_47572 - TRUCK
      ?auto_47570 - PLACE
      ?auto_47575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47574 ?auto_47567 ) ( IS-CRATE ?auto_47565 ) ( not ( = ?auto_47565 ?auto_47566 ) ) ( not ( = ?auto_47569 ?auto_47567 ) ) ( HOIST-AT ?auto_47568 ?auto_47569 ) ( not ( = ?auto_47574 ?auto_47568 ) ) ( AVAILABLE ?auto_47568 ) ( SURFACE-AT ?auto_47565 ?auto_47569 ) ( ON ?auto_47565 ?auto_47573 ) ( CLEAR ?auto_47565 ) ( not ( = ?auto_47565 ?auto_47573 ) ) ( not ( = ?auto_47566 ?auto_47573 ) ) ( SURFACE-AT ?auto_47571 ?auto_47567 ) ( CLEAR ?auto_47571 ) ( IS-CRATE ?auto_47566 ) ( not ( = ?auto_47565 ?auto_47571 ) ) ( not ( = ?auto_47566 ?auto_47571 ) ) ( not ( = ?auto_47573 ?auto_47571 ) ) ( AVAILABLE ?auto_47574 ) ( TRUCK-AT ?auto_47572 ?auto_47570 ) ( not ( = ?auto_47570 ?auto_47567 ) ) ( not ( = ?auto_47569 ?auto_47570 ) ) ( HOIST-AT ?auto_47575 ?auto_47570 ) ( LIFTING ?auto_47575 ?auto_47566 ) ( not ( = ?auto_47574 ?auto_47575 ) ) ( not ( = ?auto_47568 ?auto_47575 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47575 ?auto_47566 ?auto_47572 ?auto_47570 )
      ( MAKE-ON ?auto_47565 ?auto_47566 )
      ( MAKE-ON-VERIFY ?auto_47565 ?auto_47566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47576 - SURFACE
      ?auto_47577 - SURFACE
    )
    :vars
    (
      ?auto_47582 - HOIST
      ?auto_47584 - PLACE
      ?auto_47581 - PLACE
      ?auto_47578 - HOIST
      ?auto_47585 - SURFACE
      ?auto_47580 - SURFACE
      ?auto_47586 - TRUCK
      ?auto_47579 - PLACE
      ?auto_47583 - HOIST
      ?auto_47587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47582 ?auto_47584 ) ( IS-CRATE ?auto_47576 ) ( not ( = ?auto_47576 ?auto_47577 ) ) ( not ( = ?auto_47581 ?auto_47584 ) ) ( HOIST-AT ?auto_47578 ?auto_47581 ) ( not ( = ?auto_47582 ?auto_47578 ) ) ( AVAILABLE ?auto_47578 ) ( SURFACE-AT ?auto_47576 ?auto_47581 ) ( ON ?auto_47576 ?auto_47585 ) ( CLEAR ?auto_47576 ) ( not ( = ?auto_47576 ?auto_47585 ) ) ( not ( = ?auto_47577 ?auto_47585 ) ) ( SURFACE-AT ?auto_47580 ?auto_47584 ) ( CLEAR ?auto_47580 ) ( IS-CRATE ?auto_47577 ) ( not ( = ?auto_47576 ?auto_47580 ) ) ( not ( = ?auto_47577 ?auto_47580 ) ) ( not ( = ?auto_47585 ?auto_47580 ) ) ( AVAILABLE ?auto_47582 ) ( TRUCK-AT ?auto_47586 ?auto_47579 ) ( not ( = ?auto_47579 ?auto_47584 ) ) ( not ( = ?auto_47581 ?auto_47579 ) ) ( HOIST-AT ?auto_47583 ?auto_47579 ) ( not ( = ?auto_47582 ?auto_47583 ) ) ( not ( = ?auto_47578 ?auto_47583 ) ) ( AVAILABLE ?auto_47583 ) ( SURFACE-AT ?auto_47577 ?auto_47579 ) ( ON ?auto_47577 ?auto_47587 ) ( CLEAR ?auto_47577 ) ( not ( = ?auto_47576 ?auto_47587 ) ) ( not ( = ?auto_47577 ?auto_47587 ) ) ( not ( = ?auto_47585 ?auto_47587 ) ) ( not ( = ?auto_47580 ?auto_47587 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47583 ?auto_47577 ?auto_47587 ?auto_47579 )
      ( MAKE-ON ?auto_47576 ?auto_47577 )
      ( MAKE-ON-VERIFY ?auto_47576 ?auto_47577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47588 - SURFACE
      ?auto_47589 - SURFACE
    )
    :vars
    (
      ?auto_47592 - HOIST
      ?auto_47593 - PLACE
      ?auto_47597 - PLACE
      ?auto_47598 - HOIST
      ?auto_47595 - SURFACE
      ?auto_47596 - SURFACE
      ?auto_47594 - PLACE
      ?auto_47599 - HOIST
      ?auto_47590 - SURFACE
      ?auto_47591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47592 ?auto_47593 ) ( IS-CRATE ?auto_47588 ) ( not ( = ?auto_47588 ?auto_47589 ) ) ( not ( = ?auto_47597 ?auto_47593 ) ) ( HOIST-AT ?auto_47598 ?auto_47597 ) ( not ( = ?auto_47592 ?auto_47598 ) ) ( AVAILABLE ?auto_47598 ) ( SURFACE-AT ?auto_47588 ?auto_47597 ) ( ON ?auto_47588 ?auto_47595 ) ( CLEAR ?auto_47588 ) ( not ( = ?auto_47588 ?auto_47595 ) ) ( not ( = ?auto_47589 ?auto_47595 ) ) ( SURFACE-AT ?auto_47596 ?auto_47593 ) ( CLEAR ?auto_47596 ) ( IS-CRATE ?auto_47589 ) ( not ( = ?auto_47588 ?auto_47596 ) ) ( not ( = ?auto_47589 ?auto_47596 ) ) ( not ( = ?auto_47595 ?auto_47596 ) ) ( AVAILABLE ?auto_47592 ) ( not ( = ?auto_47594 ?auto_47593 ) ) ( not ( = ?auto_47597 ?auto_47594 ) ) ( HOIST-AT ?auto_47599 ?auto_47594 ) ( not ( = ?auto_47592 ?auto_47599 ) ) ( not ( = ?auto_47598 ?auto_47599 ) ) ( AVAILABLE ?auto_47599 ) ( SURFACE-AT ?auto_47589 ?auto_47594 ) ( ON ?auto_47589 ?auto_47590 ) ( CLEAR ?auto_47589 ) ( not ( = ?auto_47588 ?auto_47590 ) ) ( not ( = ?auto_47589 ?auto_47590 ) ) ( not ( = ?auto_47595 ?auto_47590 ) ) ( not ( = ?auto_47596 ?auto_47590 ) ) ( TRUCK-AT ?auto_47591 ?auto_47593 ) )
    :subtasks
    ( ( !DRIVE ?auto_47591 ?auto_47593 ?auto_47594 )
      ( MAKE-ON ?auto_47588 ?auto_47589 )
      ( MAKE-ON-VERIFY ?auto_47588 ?auto_47589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47600 - SURFACE
      ?auto_47601 - SURFACE
    )
    :vars
    (
      ?auto_47605 - HOIST
      ?auto_47602 - PLACE
      ?auto_47607 - PLACE
      ?auto_47608 - HOIST
      ?auto_47603 - SURFACE
      ?auto_47606 - SURFACE
      ?auto_47604 - PLACE
      ?auto_47610 - HOIST
      ?auto_47609 - SURFACE
      ?auto_47611 - TRUCK
      ?auto_47612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47605 ?auto_47602 ) ( IS-CRATE ?auto_47600 ) ( not ( = ?auto_47600 ?auto_47601 ) ) ( not ( = ?auto_47607 ?auto_47602 ) ) ( HOIST-AT ?auto_47608 ?auto_47607 ) ( not ( = ?auto_47605 ?auto_47608 ) ) ( AVAILABLE ?auto_47608 ) ( SURFACE-AT ?auto_47600 ?auto_47607 ) ( ON ?auto_47600 ?auto_47603 ) ( CLEAR ?auto_47600 ) ( not ( = ?auto_47600 ?auto_47603 ) ) ( not ( = ?auto_47601 ?auto_47603 ) ) ( IS-CRATE ?auto_47601 ) ( not ( = ?auto_47600 ?auto_47606 ) ) ( not ( = ?auto_47601 ?auto_47606 ) ) ( not ( = ?auto_47603 ?auto_47606 ) ) ( not ( = ?auto_47604 ?auto_47602 ) ) ( not ( = ?auto_47607 ?auto_47604 ) ) ( HOIST-AT ?auto_47610 ?auto_47604 ) ( not ( = ?auto_47605 ?auto_47610 ) ) ( not ( = ?auto_47608 ?auto_47610 ) ) ( AVAILABLE ?auto_47610 ) ( SURFACE-AT ?auto_47601 ?auto_47604 ) ( ON ?auto_47601 ?auto_47609 ) ( CLEAR ?auto_47601 ) ( not ( = ?auto_47600 ?auto_47609 ) ) ( not ( = ?auto_47601 ?auto_47609 ) ) ( not ( = ?auto_47603 ?auto_47609 ) ) ( not ( = ?auto_47606 ?auto_47609 ) ) ( TRUCK-AT ?auto_47611 ?auto_47602 ) ( SURFACE-AT ?auto_47612 ?auto_47602 ) ( CLEAR ?auto_47612 ) ( LIFTING ?auto_47605 ?auto_47606 ) ( IS-CRATE ?auto_47606 ) ( not ( = ?auto_47600 ?auto_47612 ) ) ( not ( = ?auto_47601 ?auto_47612 ) ) ( not ( = ?auto_47603 ?auto_47612 ) ) ( not ( = ?auto_47606 ?auto_47612 ) ) ( not ( = ?auto_47609 ?auto_47612 ) ) )
    :subtasks
    ( ( !DROP ?auto_47605 ?auto_47606 ?auto_47612 ?auto_47602 )
      ( MAKE-ON ?auto_47600 ?auto_47601 )
      ( MAKE-ON-VERIFY ?auto_47600 ?auto_47601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47613 - SURFACE
      ?auto_47614 - SURFACE
    )
    :vars
    (
      ?auto_47622 - HOIST
      ?auto_47619 - PLACE
      ?auto_47621 - PLACE
      ?auto_47618 - HOIST
      ?auto_47623 - SURFACE
      ?auto_47624 - SURFACE
      ?auto_47620 - PLACE
      ?auto_47625 - HOIST
      ?auto_47616 - SURFACE
      ?auto_47617 - TRUCK
      ?auto_47615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47622 ?auto_47619 ) ( IS-CRATE ?auto_47613 ) ( not ( = ?auto_47613 ?auto_47614 ) ) ( not ( = ?auto_47621 ?auto_47619 ) ) ( HOIST-AT ?auto_47618 ?auto_47621 ) ( not ( = ?auto_47622 ?auto_47618 ) ) ( AVAILABLE ?auto_47618 ) ( SURFACE-AT ?auto_47613 ?auto_47621 ) ( ON ?auto_47613 ?auto_47623 ) ( CLEAR ?auto_47613 ) ( not ( = ?auto_47613 ?auto_47623 ) ) ( not ( = ?auto_47614 ?auto_47623 ) ) ( IS-CRATE ?auto_47614 ) ( not ( = ?auto_47613 ?auto_47624 ) ) ( not ( = ?auto_47614 ?auto_47624 ) ) ( not ( = ?auto_47623 ?auto_47624 ) ) ( not ( = ?auto_47620 ?auto_47619 ) ) ( not ( = ?auto_47621 ?auto_47620 ) ) ( HOIST-AT ?auto_47625 ?auto_47620 ) ( not ( = ?auto_47622 ?auto_47625 ) ) ( not ( = ?auto_47618 ?auto_47625 ) ) ( AVAILABLE ?auto_47625 ) ( SURFACE-AT ?auto_47614 ?auto_47620 ) ( ON ?auto_47614 ?auto_47616 ) ( CLEAR ?auto_47614 ) ( not ( = ?auto_47613 ?auto_47616 ) ) ( not ( = ?auto_47614 ?auto_47616 ) ) ( not ( = ?auto_47623 ?auto_47616 ) ) ( not ( = ?auto_47624 ?auto_47616 ) ) ( TRUCK-AT ?auto_47617 ?auto_47619 ) ( SURFACE-AT ?auto_47615 ?auto_47619 ) ( CLEAR ?auto_47615 ) ( IS-CRATE ?auto_47624 ) ( not ( = ?auto_47613 ?auto_47615 ) ) ( not ( = ?auto_47614 ?auto_47615 ) ) ( not ( = ?auto_47623 ?auto_47615 ) ) ( not ( = ?auto_47624 ?auto_47615 ) ) ( not ( = ?auto_47616 ?auto_47615 ) ) ( AVAILABLE ?auto_47622 ) ( IN ?auto_47624 ?auto_47617 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47622 ?auto_47624 ?auto_47617 ?auto_47619 )
      ( MAKE-ON ?auto_47613 ?auto_47614 )
      ( MAKE-ON-VERIFY ?auto_47613 ?auto_47614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47626 - SURFACE
      ?auto_47627 - SURFACE
    )
    :vars
    (
      ?auto_47635 - HOIST
      ?auto_47632 - PLACE
      ?auto_47631 - PLACE
      ?auto_47628 - HOIST
      ?auto_47637 - SURFACE
      ?auto_47634 - SURFACE
      ?auto_47633 - PLACE
      ?auto_47629 - HOIST
      ?auto_47636 - SURFACE
      ?auto_47638 - SURFACE
      ?auto_47630 - TRUCK
      ?auto_47639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47635 ?auto_47632 ) ( IS-CRATE ?auto_47626 ) ( not ( = ?auto_47626 ?auto_47627 ) ) ( not ( = ?auto_47631 ?auto_47632 ) ) ( HOIST-AT ?auto_47628 ?auto_47631 ) ( not ( = ?auto_47635 ?auto_47628 ) ) ( AVAILABLE ?auto_47628 ) ( SURFACE-AT ?auto_47626 ?auto_47631 ) ( ON ?auto_47626 ?auto_47637 ) ( CLEAR ?auto_47626 ) ( not ( = ?auto_47626 ?auto_47637 ) ) ( not ( = ?auto_47627 ?auto_47637 ) ) ( IS-CRATE ?auto_47627 ) ( not ( = ?auto_47626 ?auto_47634 ) ) ( not ( = ?auto_47627 ?auto_47634 ) ) ( not ( = ?auto_47637 ?auto_47634 ) ) ( not ( = ?auto_47633 ?auto_47632 ) ) ( not ( = ?auto_47631 ?auto_47633 ) ) ( HOIST-AT ?auto_47629 ?auto_47633 ) ( not ( = ?auto_47635 ?auto_47629 ) ) ( not ( = ?auto_47628 ?auto_47629 ) ) ( AVAILABLE ?auto_47629 ) ( SURFACE-AT ?auto_47627 ?auto_47633 ) ( ON ?auto_47627 ?auto_47636 ) ( CLEAR ?auto_47627 ) ( not ( = ?auto_47626 ?auto_47636 ) ) ( not ( = ?auto_47627 ?auto_47636 ) ) ( not ( = ?auto_47637 ?auto_47636 ) ) ( not ( = ?auto_47634 ?auto_47636 ) ) ( SURFACE-AT ?auto_47638 ?auto_47632 ) ( CLEAR ?auto_47638 ) ( IS-CRATE ?auto_47634 ) ( not ( = ?auto_47626 ?auto_47638 ) ) ( not ( = ?auto_47627 ?auto_47638 ) ) ( not ( = ?auto_47637 ?auto_47638 ) ) ( not ( = ?auto_47634 ?auto_47638 ) ) ( not ( = ?auto_47636 ?auto_47638 ) ) ( AVAILABLE ?auto_47635 ) ( IN ?auto_47634 ?auto_47630 ) ( TRUCK-AT ?auto_47630 ?auto_47639 ) ( not ( = ?auto_47639 ?auto_47632 ) ) ( not ( = ?auto_47631 ?auto_47639 ) ) ( not ( = ?auto_47633 ?auto_47639 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47630 ?auto_47639 ?auto_47632 )
      ( MAKE-ON ?auto_47626 ?auto_47627 )
      ( MAKE-ON-VERIFY ?auto_47626 ?auto_47627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47640 - SURFACE
      ?auto_47641 - SURFACE
    )
    :vars
    (
      ?auto_47652 - HOIST
      ?auto_47650 - PLACE
      ?auto_47645 - PLACE
      ?auto_47643 - HOIST
      ?auto_47653 - SURFACE
      ?auto_47642 - SURFACE
      ?auto_47651 - PLACE
      ?auto_47646 - HOIST
      ?auto_47649 - SURFACE
      ?auto_47647 - SURFACE
      ?auto_47644 - TRUCK
      ?auto_47648 - PLACE
      ?auto_47654 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47652 ?auto_47650 ) ( IS-CRATE ?auto_47640 ) ( not ( = ?auto_47640 ?auto_47641 ) ) ( not ( = ?auto_47645 ?auto_47650 ) ) ( HOIST-AT ?auto_47643 ?auto_47645 ) ( not ( = ?auto_47652 ?auto_47643 ) ) ( AVAILABLE ?auto_47643 ) ( SURFACE-AT ?auto_47640 ?auto_47645 ) ( ON ?auto_47640 ?auto_47653 ) ( CLEAR ?auto_47640 ) ( not ( = ?auto_47640 ?auto_47653 ) ) ( not ( = ?auto_47641 ?auto_47653 ) ) ( IS-CRATE ?auto_47641 ) ( not ( = ?auto_47640 ?auto_47642 ) ) ( not ( = ?auto_47641 ?auto_47642 ) ) ( not ( = ?auto_47653 ?auto_47642 ) ) ( not ( = ?auto_47651 ?auto_47650 ) ) ( not ( = ?auto_47645 ?auto_47651 ) ) ( HOIST-AT ?auto_47646 ?auto_47651 ) ( not ( = ?auto_47652 ?auto_47646 ) ) ( not ( = ?auto_47643 ?auto_47646 ) ) ( AVAILABLE ?auto_47646 ) ( SURFACE-AT ?auto_47641 ?auto_47651 ) ( ON ?auto_47641 ?auto_47649 ) ( CLEAR ?auto_47641 ) ( not ( = ?auto_47640 ?auto_47649 ) ) ( not ( = ?auto_47641 ?auto_47649 ) ) ( not ( = ?auto_47653 ?auto_47649 ) ) ( not ( = ?auto_47642 ?auto_47649 ) ) ( SURFACE-AT ?auto_47647 ?auto_47650 ) ( CLEAR ?auto_47647 ) ( IS-CRATE ?auto_47642 ) ( not ( = ?auto_47640 ?auto_47647 ) ) ( not ( = ?auto_47641 ?auto_47647 ) ) ( not ( = ?auto_47653 ?auto_47647 ) ) ( not ( = ?auto_47642 ?auto_47647 ) ) ( not ( = ?auto_47649 ?auto_47647 ) ) ( AVAILABLE ?auto_47652 ) ( TRUCK-AT ?auto_47644 ?auto_47648 ) ( not ( = ?auto_47648 ?auto_47650 ) ) ( not ( = ?auto_47645 ?auto_47648 ) ) ( not ( = ?auto_47651 ?auto_47648 ) ) ( HOIST-AT ?auto_47654 ?auto_47648 ) ( LIFTING ?auto_47654 ?auto_47642 ) ( not ( = ?auto_47652 ?auto_47654 ) ) ( not ( = ?auto_47643 ?auto_47654 ) ) ( not ( = ?auto_47646 ?auto_47654 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47654 ?auto_47642 ?auto_47644 ?auto_47648 )
      ( MAKE-ON ?auto_47640 ?auto_47641 )
      ( MAKE-ON-VERIFY ?auto_47640 ?auto_47641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47655 - SURFACE
      ?auto_47656 - SURFACE
    )
    :vars
    (
      ?auto_47657 - HOIST
      ?auto_47668 - PLACE
      ?auto_47658 - PLACE
      ?auto_47659 - HOIST
      ?auto_47666 - SURFACE
      ?auto_47664 - SURFACE
      ?auto_47661 - PLACE
      ?auto_47669 - HOIST
      ?auto_47663 - SURFACE
      ?auto_47660 - SURFACE
      ?auto_47662 - TRUCK
      ?auto_47667 - PLACE
      ?auto_47665 - HOIST
      ?auto_47670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47657 ?auto_47668 ) ( IS-CRATE ?auto_47655 ) ( not ( = ?auto_47655 ?auto_47656 ) ) ( not ( = ?auto_47658 ?auto_47668 ) ) ( HOIST-AT ?auto_47659 ?auto_47658 ) ( not ( = ?auto_47657 ?auto_47659 ) ) ( AVAILABLE ?auto_47659 ) ( SURFACE-AT ?auto_47655 ?auto_47658 ) ( ON ?auto_47655 ?auto_47666 ) ( CLEAR ?auto_47655 ) ( not ( = ?auto_47655 ?auto_47666 ) ) ( not ( = ?auto_47656 ?auto_47666 ) ) ( IS-CRATE ?auto_47656 ) ( not ( = ?auto_47655 ?auto_47664 ) ) ( not ( = ?auto_47656 ?auto_47664 ) ) ( not ( = ?auto_47666 ?auto_47664 ) ) ( not ( = ?auto_47661 ?auto_47668 ) ) ( not ( = ?auto_47658 ?auto_47661 ) ) ( HOIST-AT ?auto_47669 ?auto_47661 ) ( not ( = ?auto_47657 ?auto_47669 ) ) ( not ( = ?auto_47659 ?auto_47669 ) ) ( AVAILABLE ?auto_47669 ) ( SURFACE-AT ?auto_47656 ?auto_47661 ) ( ON ?auto_47656 ?auto_47663 ) ( CLEAR ?auto_47656 ) ( not ( = ?auto_47655 ?auto_47663 ) ) ( not ( = ?auto_47656 ?auto_47663 ) ) ( not ( = ?auto_47666 ?auto_47663 ) ) ( not ( = ?auto_47664 ?auto_47663 ) ) ( SURFACE-AT ?auto_47660 ?auto_47668 ) ( CLEAR ?auto_47660 ) ( IS-CRATE ?auto_47664 ) ( not ( = ?auto_47655 ?auto_47660 ) ) ( not ( = ?auto_47656 ?auto_47660 ) ) ( not ( = ?auto_47666 ?auto_47660 ) ) ( not ( = ?auto_47664 ?auto_47660 ) ) ( not ( = ?auto_47663 ?auto_47660 ) ) ( AVAILABLE ?auto_47657 ) ( TRUCK-AT ?auto_47662 ?auto_47667 ) ( not ( = ?auto_47667 ?auto_47668 ) ) ( not ( = ?auto_47658 ?auto_47667 ) ) ( not ( = ?auto_47661 ?auto_47667 ) ) ( HOIST-AT ?auto_47665 ?auto_47667 ) ( not ( = ?auto_47657 ?auto_47665 ) ) ( not ( = ?auto_47659 ?auto_47665 ) ) ( not ( = ?auto_47669 ?auto_47665 ) ) ( AVAILABLE ?auto_47665 ) ( SURFACE-AT ?auto_47664 ?auto_47667 ) ( ON ?auto_47664 ?auto_47670 ) ( CLEAR ?auto_47664 ) ( not ( = ?auto_47655 ?auto_47670 ) ) ( not ( = ?auto_47656 ?auto_47670 ) ) ( not ( = ?auto_47666 ?auto_47670 ) ) ( not ( = ?auto_47664 ?auto_47670 ) ) ( not ( = ?auto_47663 ?auto_47670 ) ) ( not ( = ?auto_47660 ?auto_47670 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47665 ?auto_47664 ?auto_47670 ?auto_47667 )
      ( MAKE-ON ?auto_47655 ?auto_47656 )
      ( MAKE-ON-VERIFY ?auto_47655 ?auto_47656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47671 - SURFACE
      ?auto_47672 - SURFACE
    )
    :vars
    (
      ?auto_47679 - HOIST
      ?auto_47673 - PLACE
      ?auto_47680 - PLACE
      ?auto_47681 - HOIST
      ?auto_47682 - SURFACE
      ?auto_47675 - SURFACE
      ?auto_47684 - PLACE
      ?auto_47677 - HOIST
      ?auto_47676 - SURFACE
      ?auto_47686 - SURFACE
      ?auto_47685 - PLACE
      ?auto_47674 - HOIST
      ?auto_47678 - SURFACE
      ?auto_47683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47679 ?auto_47673 ) ( IS-CRATE ?auto_47671 ) ( not ( = ?auto_47671 ?auto_47672 ) ) ( not ( = ?auto_47680 ?auto_47673 ) ) ( HOIST-AT ?auto_47681 ?auto_47680 ) ( not ( = ?auto_47679 ?auto_47681 ) ) ( AVAILABLE ?auto_47681 ) ( SURFACE-AT ?auto_47671 ?auto_47680 ) ( ON ?auto_47671 ?auto_47682 ) ( CLEAR ?auto_47671 ) ( not ( = ?auto_47671 ?auto_47682 ) ) ( not ( = ?auto_47672 ?auto_47682 ) ) ( IS-CRATE ?auto_47672 ) ( not ( = ?auto_47671 ?auto_47675 ) ) ( not ( = ?auto_47672 ?auto_47675 ) ) ( not ( = ?auto_47682 ?auto_47675 ) ) ( not ( = ?auto_47684 ?auto_47673 ) ) ( not ( = ?auto_47680 ?auto_47684 ) ) ( HOIST-AT ?auto_47677 ?auto_47684 ) ( not ( = ?auto_47679 ?auto_47677 ) ) ( not ( = ?auto_47681 ?auto_47677 ) ) ( AVAILABLE ?auto_47677 ) ( SURFACE-AT ?auto_47672 ?auto_47684 ) ( ON ?auto_47672 ?auto_47676 ) ( CLEAR ?auto_47672 ) ( not ( = ?auto_47671 ?auto_47676 ) ) ( not ( = ?auto_47672 ?auto_47676 ) ) ( not ( = ?auto_47682 ?auto_47676 ) ) ( not ( = ?auto_47675 ?auto_47676 ) ) ( SURFACE-AT ?auto_47686 ?auto_47673 ) ( CLEAR ?auto_47686 ) ( IS-CRATE ?auto_47675 ) ( not ( = ?auto_47671 ?auto_47686 ) ) ( not ( = ?auto_47672 ?auto_47686 ) ) ( not ( = ?auto_47682 ?auto_47686 ) ) ( not ( = ?auto_47675 ?auto_47686 ) ) ( not ( = ?auto_47676 ?auto_47686 ) ) ( AVAILABLE ?auto_47679 ) ( not ( = ?auto_47685 ?auto_47673 ) ) ( not ( = ?auto_47680 ?auto_47685 ) ) ( not ( = ?auto_47684 ?auto_47685 ) ) ( HOIST-AT ?auto_47674 ?auto_47685 ) ( not ( = ?auto_47679 ?auto_47674 ) ) ( not ( = ?auto_47681 ?auto_47674 ) ) ( not ( = ?auto_47677 ?auto_47674 ) ) ( AVAILABLE ?auto_47674 ) ( SURFACE-AT ?auto_47675 ?auto_47685 ) ( ON ?auto_47675 ?auto_47678 ) ( CLEAR ?auto_47675 ) ( not ( = ?auto_47671 ?auto_47678 ) ) ( not ( = ?auto_47672 ?auto_47678 ) ) ( not ( = ?auto_47682 ?auto_47678 ) ) ( not ( = ?auto_47675 ?auto_47678 ) ) ( not ( = ?auto_47676 ?auto_47678 ) ) ( not ( = ?auto_47686 ?auto_47678 ) ) ( TRUCK-AT ?auto_47683 ?auto_47673 ) )
    :subtasks
    ( ( !DRIVE ?auto_47683 ?auto_47673 ?auto_47685 )
      ( MAKE-ON ?auto_47671 ?auto_47672 )
      ( MAKE-ON-VERIFY ?auto_47671 ?auto_47672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47687 - SURFACE
      ?auto_47688 - SURFACE
    )
    :vars
    (
      ?auto_47700 - HOIST
      ?auto_47696 - PLACE
      ?auto_47698 - PLACE
      ?auto_47694 - HOIST
      ?auto_47691 - SURFACE
      ?auto_47699 - SURFACE
      ?auto_47701 - PLACE
      ?auto_47690 - HOIST
      ?auto_47702 - SURFACE
      ?auto_47697 - SURFACE
      ?auto_47689 - PLACE
      ?auto_47695 - HOIST
      ?auto_47692 - SURFACE
      ?auto_47693 - TRUCK
      ?auto_47703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47700 ?auto_47696 ) ( IS-CRATE ?auto_47687 ) ( not ( = ?auto_47687 ?auto_47688 ) ) ( not ( = ?auto_47698 ?auto_47696 ) ) ( HOIST-AT ?auto_47694 ?auto_47698 ) ( not ( = ?auto_47700 ?auto_47694 ) ) ( AVAILABLE ?auto_47694 ) ( SURFACE-AT ?auto_47687 ?auto_47698 ) ( ON ?auto_47687 ?auto_47691 ) ( CLEAR ?auto_47687 ) ( not ( = ?auto_47687 ?auto_47691 ) ) ( not ( = ?auto_47688 ?auto_47691 ) ) ( IS-CRATE ?auto_47688 ) ( not ( = ?auto_47687 ?auto_47699 ) ) ( not ( = ?auto_47688 ?auto_47699 ) ) ( not ( = ?auto_47691 ?auto_47699 ) ) ( not ( = ?auto_47701 ?auto_47696 ) ) ( not ( = ?auto_47698 ?auto_47701 ) ) ( HOIST-AT ?auto_47690 ?auto_47701 ) ( not ( = ?auto_47700 ?auto_47690 ) ) ( not ( = ?auto_47694 ?auto_47690 ) ) ( AVAILABLE ?auto_47690 ) ( SURFACE-AT ?auto_47688 ?auto_47701 ) ( ON ?auto_47688 ?auto_47702 ) ( CLEAR ?auto_47688 ) ( not ( = ?auto_47687 ?auto_47702 ) ) ( not ( = ?auto_47688 ?auto_47702 ) ) ( not ( = ?auto_47691 ?auto_47702 ) ) ( not ( = ?auto_47699 ?auto_47702 ) ) ( IS-CRATE ?auto_47699 ) ( not ( = ?auto_47687 ?auto_47697 ) ) ( not ( = ?auto_47688 ?auto_47697 ) ) ( not ( = ?auto_47691 ?auto_47697 ) ) ( not ( = ?auto_47699 ?auto_47697 ) ) ( not ( = ?auto_47702 ?auto_47697 ) ) ( not ( = ?auto_47689 ?auto_47696 ) ) ( not ( = ?auto_47698 ?auto_47689 ) ) ( not ( = ?auto_47701 ?auto_47689 ) ) ( HOIST-AT ?auto_47695 ?auto_47689 ) ( not ( = ?auto_47700 ?auto_47695 ) ) ( not ( = ?auto_47694 ?auto_47695 ) ) ( not ( = ?auto_47690 ?auto_47695 ) ) ( AVAILABLE ?auto_47695 ) ( SURFACE-AT ?auto_47699 ?auto_47689 ) ( ON ?auto_47699 ?auto_47692 ) ( CLEAR ?auto_47699 ) ( not ( = ?auto_47687 ?auto_47692 ) ) ( not ( = ?auto_47688 ?auto_47692 ) ) ( not ( = ?auto_47691 ?auto_47692 ) ) ( not ( = ?auto_47699 ?auto_47692 ) ) ( not ( = ?auto_47702 ?auto_47692 ) ) ( not ( = ?auto_47697 ?auto_47692 ) ) ( TRUCK-AT ?auto_47693 ?auto_47696 ) ( SURFACE-AT ?auto_47703 ?auto_47696 ) ( CLEAR ?auto_47703 ) ( LIFTING ?auto_47700 ?auto_47697 ) ( IS-CRATE ?auto_47697 ) ( not ( = ?auto_47687 ?auto_47703 ) ) ( not ( = ?auto_47688 ?auto_47703 ) ) ( not ( = ?auto_47691 ?auto_47703 ) ) ( not ( = ?auto_47699 ?auto_47703 ) ) ( not ( = ?auto_47702 ?auto_47703 ) ) ( not ( = ?auto_47697 ?auto_47703 ) ) ( not ( = ?auto_47692 ?auto_47703 ) ) )
    :subtasks
    ( ( !DROP ?auto_47700 ?auto_47697 ?auto_47703 ?auto_47696 )
      ( MAKE-ON ?auto_47687 ?auto_47688 )
      ( MAKE-ON-VERIFY ?auto_47687 ?auto_47688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47704 - SURFACE
      ?auto_47705 - SURFACE
    )
    :vars
    (
      ?auto_47714 - HOIST
      ?auto_47707 - PLACE
      ?auto_47717 - PLACE
      ?auto_47708 - HOIST
      ?auto_47719 - SURFACE
      ?auto_47712 - SURFACE
      ?auto_47720 - PLACE
      ?auto_47710 - HOIST
      ?auto_47709 - SURFACE
      ?auto_47713 - SURFACE
      ?auto_47718 - PLACE
      ?auto_47715 - HOIST
      ?auto_47711 - SURFACE
      ?auto_47706 - TRUCK
      ?auto_47716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47714 ?auto_47707 ) ( IS-CRATE ?auto_47704 ) ( not ( = ?auto_47704 ?auto_47705 ) ) ( not ( = ?auto_47717 ?auto_47707 ) ) ( HOIST-AT ?auto_47708 ?auto_47717 ) ( not ( = ?auto_47714 ?auto_47708 ) ) ( AVAILABLE ?auto_47708 ) ( SURFACE-AT ?auto_47704 ?auto_47717 ) ( ON ?auto_47704 ?auto_47719 ) ( CLEAR ?auto_47704 ) ( not ( = ?auto_47704 ?auto_47719 ) ) ( not ( = ?auto_47705 ?auto_47719 ) ) ( IS-CRATE ?auto_47705 ) ( not ( = ?auto_47704 ?auto_47712 ) ) ( not ( = ?auto_47705 ?auto_47712 ) ) ( not ( = ?auto_47719 ?auto_47712 ) ) ( not ( = ?auto_47720 ?auto_47707 ) ) ( not ( = ?auto_47717 ?auto_47720 ) ) ( HOIST-AT ?auto_47710 ?auto_47720 ) ( not ( = ?auto_47714 ?auto_47710 ) ) ( not ( = ?auto_47708 ?auto_47710 ) ) ( AVAILABLE ?auto_47710 ) ( SURFACE-AT ?auto_47705 ?auto_47720 ) ( ON ?auto_47705 ?auto_47709 ) ( CLEAR ?auto_47705 ) ( not ( = ?auto_47704 ?auto_47709 ) ) ( not ( = ?auto_47705 ?auto_47709 ) ) ( not ( = ?auto_47719 ?auto_47709 ) ) ( not ( = ?auto_47712 ?auto_47709 ) ) ( IS-CRATE ?auto_47712 ) ( not ( = ?auto_47704 ?auto_47713 ) ) ( not ( = ?auto_47705 ?auto_47713 ) ) ( not ( = ?auto_47719 ?auto_47713 ) ) ( not ( = ?auto_47712 ?auto_47713 ) ) ( not ( = ?auto_47709 ?auto_47713 ) ) ( not ( = ?auto_47718 ?auto_47707 ) ) ( not ( = ?auto_47717 ?auto_47718 ) ) ( not ( = ?auto_47720 ?auto_47718 ) ) ( HOIST-AT ?auto_47715 ?auto_47718 ) ( not ( = ?auto_47714 ?auto_47715 ) ) ( not ( = ?auto_47708 ?auto_47715 ) ) ( not ( = ?auto_47710 ?auto_47715 ) ) ( AVAILABLE ?auto_47715 ) ( SURFACE-AT ?auto_47712 ?auto_47718 ) ( ON ?auto_47712 ?auto_47711 ) ( CLEAR ?auto_47712 ) ( not ( = ?auto_47704 ?auto_47711 ) ) ( not ( = ?auto_47705 ?auto_47711 ) ) ( not ( = ?auto_47719 ?auto_47711 ) ) ( not ( = ?auto_47712 ?auto_47711 ) ) ( not ( = ?auto_47709 ?auto_47711 ) ) ( not ( = ?auto_47713 ?auto_47711 ) ) ( TRUCK-AT ?auto_47706 ?auto_47707 ) ( SURFACE-AT ?auto_47716 ?auto_47707 ) ( CLEAR ?auto_47716 ) ( IS-CRATE ?auto_47713 ) ( not ( = ?auto_47704 ?auto_47716 ) ) ( not ( = ?auto_47705 ?auto_47716 ) ) ( not ( = ?auto_47719 ?auto_47716 ) ) ( not ( = ?auto_47712 ?auto_47716 ) ) ( not ( = ?auto_47709 ?auto_47716 ) ) ( not ( = ?auto_47713 ?auto_47716 ) ) ( not ( = ?auto_47711 ?auto_47716 ) ) ( AVAILABLE ?auto_47714 ) ( IN ?auto_47713 ?auto_47706 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47714 ?auto_47713 ?auto_47706 ?auto_47707 )
      ( MAKE-ON ?auto_47704 ?auto_47705 )
      ( MAKE-ON-VERIFY ?auto_47704 ?auto_47705 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47721 - SURFACE
      ?auto_47722 - SURFACE
    )
    :vars
    (
      ?auto_47729 - HOIST
      ?auto_47728 - PLACE
      ?auto_47730 - PLACE
      ?auto_47735 - HOIST
      ?auto_47737 - SURFACE
      ?auto_47726 - SURFACE
      ?auto_47731 - PLACE
      ?auto_47727 - HOIST
      ?auto_47734 - SURFACE
      ?auto_47723 - SURFACE
      ?auto_47725 - PLACE
      ?auto_47724 - HOIST
      ?auto_47736 - SURFACE
      ?auto_47732 - SURFACE
      ?auto_47733 - TRUCK
      ?auto_47738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47729 ?auto_47728 ) ( IS-CRATE ?auto_47721 ) ( not ( = ?auto_47721 ?auto_47722 ) ) ( not ( = ?auto_47730 ?auto_47728 ) ) ( HOIST-AT ?auto_47735 ?auto_47730 ) ( not ( = ?auto_47729 ?auto_47735 ) ) ( AVAILABLE ?auto_47735 ) ( SURFACE-AT ?auto_47721 ?auto_47730 ) ( ON ?auto_47721 ?auto_47737 ) ( CLEAR ?auto_47721 ) ( not ( = ?auto_47721 ?auto_47737 ) ) ( not ( = ?auto_47722 ?auto_47737 ) ) ( IS-CRATE ?auto_47722 ) ( not ( = ?auto_47721 ?auto_47726 ) ) ( not ( = ?auto_47722 ?auto_47726 ) ) ( not ( = ?auto_47737 ?auto_47726 ) ) ( not ( = ?auto_47731 ?auto_47728 ) ) ( not ( = ?auto_47730 ?auto_47731 ) ) ( HOIST-AT ?auto_47727 ?auto_47731 ) ( not ( = ?auto_47729 ?auto_47727 ) ) ( not ( = ?auto_47735 ?auto_47727 ) ) ( AVAILABLE ?auto_47727 ) ( SURFACE-AT ?auto_47722 ?auto_47731 ) ( ON ?auto_47722 ?auto_47734 ) ( CLEAR ?auto_47722 ) ( not ( = ?auto_47721 ?auto_47734 ) ) ( not ( = ?auto_47722 ?auto_47734 ) ) ( not ( = ?auto_47737 ?auto_47734 ) ) ( not ( = ?auto_47726 ?auto_47734 ) ) ( IS-CRATE ?auto_47726 ) ( not ( = ?auto_47721 ?auto_47723 ) ) ( not ( = ?auto_47722 ?auto_47723 ) ) ( not ( = ?auto_47737 ?auto_47723 ) ) ( not ( = ?auto_47726 ?auto_47723 ) ) ( not ( = ?auto_47734 ?auto_47723 ) ) ( not ( = ?auto_47725 ?auto_47728 ) ) ( not ( = ?auto_47730 ?auto_47725 ) ) ( not ( = ?auto_47731 ?auto_47725 ) ) ( HOIST-AT ?auto_47724 ?auto_47725 ) ( not ( = ?auto_47729 ?auto_47724 ) ) ( not ( = ?auto_47735 ?auto_47724 ) ) ( not ( = ?auto_47727 ?auto_47724 ) ) ( AVAILABLE ?auto_47724 ) ( SURFACE-AT ?auto_47726 ?auto_47725 ) ( ON ?auto_47726 ?auto_47736 ) ( CLEAR ?auto_47726 ) ( not ( = ?auto_47721 ?auto_47736 ) ) ( not ( = ?auto_47722 ?auto_47736 ) ) ( not ( = ?auto_47737 ?auto_47736 ) ) ( not ( = ?auto_47726 ?auto_47736 ) ) ( not ( = ?auto_47734 ?auto_47736 ) ) ( not ( = ?auto_47723 ?auto_47736 ) ) ( SURFACE-AT ?auto_47732 ?auto_47728 ) ( CLEAR ?auto_47732 ) ( IS-CRATE ?auto_47723 ) ( not ( = ?auto_47721 ?auto_47732 ) ) ( not ( = ?auto_47722 ?auto_47732 ) ) ( not ( = ?auto_47737 ?auto_47732 ) ) ( not ( = ?auto_47726 ?auto_47732 ) ) ( not ( = ?auto_47734 ?auto_47732 ) ) ( not ( = ?auto_47723 ?auto_47732 ) ) ( not ( = ?auto_47736 ?auto_47732 ) ) ( AVAILABLE ?auto_47729 ) ( IN ?auto_47723 ?auto_47733 ) ( TRUCK-AT ?auto_47733 ?auto_47738 ) ( not ( = ?auto_47738 ?auto_47728 ) ) ( not ( = ?auto_47730 ?auto_47738 ) ) ( not ( = ?auto_47731 ?auto_47738 ) ) ( not ( = ?auto_47725 ?auto_47738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47733 ?auto_47738 ?auto_47728 )
      ( MAKE-ON ?auto_47721 ?auto_47722 )
      ( MAKE-ON-VERIFY ?auto_47721 ?auto_47722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47739 - SURFACE
      ?auto_47740 - SURFACE
    )
    :vars
    (
      ?auto_47742 - HOIST
      ?auto_47751 - PLACE
      ?auto_47750 - PLACE
      ?auto_47743 - HOIST
      ?auto_47753 - SURFACE
      ?auto_47741 - SURFACE
      ?auto_47745 - PLACE
      ?auto_47748 - HOIST
      ?auto_47749 - SURFACE
      ?auto_47746 - SURFACE
      ?auto_47755 - PLACE
      ?auto_47754 - HOIST
      ?auto_47752 - SURFACE
      ?auto_47747 - SURFACE
      ?auto_47756 - TRUCK
      ?auto_47744 - PLACE
      ?auto_47757 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47742 ?auto_47751 ) ( IS-CRATE ?auto_47739 ) ( not ( = ?auto_47739 ?auto_47740 ) ) ( not ( = ?auto_47750 ?auto_47751 ) ) ( HOIST-AT ?auto_47743 ?auto_47750 ) ( not ( = ?auto_47742 ?auto_47743 ) ) ( AVAILABLE ?auto_47743 ) ( SURFACE-AT ?auto_47739 ?auto_47750 ) ( ON ?auto_47739 ?auto_47753 ) ( CLEAR ?auto_47739 ) ( not ( = ?auto_47739 ?auto_47753 ) ) ( not ( = ?auto_47740 ?auto_47753 ) ) ( IS-CRATE ?auto_47740 ) ( not ( = ?auto_47739 ?auto_47741 ) ) ( not ( = ?auto_47740 ?auto_47741 ) ) ( not ( = ?auto_47753 ?auto_47741 ) ) ( not ( = ?auto_47745 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47745 ) ) ( HOIST-AT ?auto_47748 ?auto_47745 ) ( not ( = ?auto_47742 ?auto_47748 ) ) ( not ( = ?auto_47743 ?auto_47748 ) ) ( AVAILABLE ?auto_47748 ) ( SURFACE-AT ?auto_47740 ?auto_47745 ) ( ON ?auto_47740 ?auto_47749 ) ( CLEAR ?auto_47740 ) ( not ( = ?auto_47739 ?auto_47749 ) ) ( not ( = ?auto_47740 ?auto_47749 ) ) ( not ( = ?auto_47753 ?auto_47749 ) ) ( not ( = ?auto_47741 ?auto_47749 ) ) ( IS-CRATE ?auto_47741 ) ( not ( = ?auto_47739 ?auto_47746 ) ) ( not ( = ?auto_47740 ?auto_47746 ) ) ( not ( = ?auto_47753 ?auto_47746 ) ) ( not ( = ?auto_47741 ?auto_47746 ) ) ( not ( = ?auto_47749 ?auto_47746 ) ) ( not ( = ?auto_47755 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47755 ) ) ( not ( = ?auto_47745 ?auto_47755 ) ) ( HOIST-AT ?auto_47754 ?auto_47755 ) ( not ( = ?auto_47742 ?auto_47754 ) ) ( not ( = ?auto_47743 ?auto_47754 ) ) ( not ( = ?auto_47748 ?auto_47754 ) ) ( AVAILABLE ?auto_47754 ) ( SURFACE-AT ?auto_47741 ?auto_47755 ) ( ON ?auto_47741 ?auto_47752 ) ( CLEAR ?auto_47741 ) ( not ( = ?auto_47739 ?auto_47752 ) ) ( not ( = ?auto_47740 ?auto_47752 ) ) ( not ( = ?auto_47753 ?auto_47752 ) ) ( not ( = ?auto_47741 ?auto_47752 ) ) ( not ( = ?auto_47749 ?auto_47752 ) ) ( not ( = ?auto_47746 ?auto_47752 ) ) ( SURFACE-AT ?auto_47747 ?auto_47751 ) ( CLEAR ?auto_47747 ) ( IS-CRATE ?auto_47746 ) ( not ( = ?auto_47739 ?auto_47747 ) ) ( not ( = ?auto_47740 ?auto_47747 ) ) ( not ( = ?auto_47753 ?auto_47747 ) ) ( not ( = ?auto_47741 ?auto_47747 ) ) ( not ( = ?auto_47749 ?auto_47747 ) ) ( not ( = ?auto_47746 ?auto_47747 ) ) ( not ( = ?auto_47752 ?auto_47747 ) ) ( AVAILABLE ?auto_47742 ) ( TRUCK-AT ?auto_47756 ?auto_47744 ) ( not ( = ?auto_47744 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47744 ) ) ( not ( = ?auto_47745 ?auto_47744 ) ) ( not ( = ?auto_47755 ?auto_47744 ) ) ( HOIST-AT ?auto_47757 ?auto_47744 ) ( LIFTING ?auto_47757 ?auto_47746 ) ( not ( = ?auto_47742 ?auto_47757 ) ) ( not ( = ?auto_47743 ?auto_47757 ) ) ( not ( = ?auto_47748 ?auto_47757 ) ) ( not ( = ?auto_47754 ?auto_47757 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47757 ?auto_47746 ?auto_47756 ?auto_47744 )
      ( MAKE-ON ?auto_47739 ?auto_47740 )
      ( MAKE-ON-VERIFY ?auto_47739 ?auto_47740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47758 - SURFACE
      ?auto_47759 - SURFACE
    )
    :vars
    (
      ?auto_47774 - HOIST
      ?auto_47764 - PLACE
      ?auto_47769 - PLACE
      ?auto_47772 - HOIST
      ?auto_47770 - SURFACE
      ?auto_47765 - SURFACE
      ?auto_47763 - PLACE
      ?auto_47773 - HOIST
      ?auto_47762 - SURFACE
      ?auto_47775 - SURFACE
      ?auto_47766 - PLACE
      ?auto_47760 - HOIST
      ?auto_47768 - SURFACE
      ?auto_47776 - SURFACE
      ?auto_47761 - TRUCK
      ?auto_47771 - PLACE
      ?auto_47767 - HOIST
      ?auto_47777 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47774 ?auto_47764 ) ( IS-CRATE ?auto_47758 ) ( not ( = ?auto_47758 ?auto_47759 ) ) ( not ( = ?auto_47769 ?auto_47764 ) ) ( HOIST-AT ?auto_47772 ?auto_47769 ) ( not ( = ?auto_47774 ?auto_47772 ) ) ( AVAILABLE ?auto_47772 ) ( SURFACE-AT ?auto_47758 ?auto_47769 ) ( ON ?auto_47758 ?auto_47770 ) ( CLEAR ?auto_47758 ) ( not ( = ?auto_47758 ?auto_47770 ) ) ( not ( = ?auto_47759 ?auto_47770 ) ) ( IS-CRATE ?auto_47759 ) ( not ( = ?auto_47758 ?auto_47765 ) ) ( not ( = ?auto_47759 ?auto_47765 ) ) ( not ( = ?auto_47770 ?auto_47765 ) ) ( not ( = ?auto_47763 ?auto_47764 ) ) ( not ( = ?auto_47769 ?auto_47763 ) ) ( HOIST-AT ?auto_47773 ?auto_47763 ) ( not ( = ?auto_47774 ?auto_47773 ) ) ( not ( = ?auto_47772 ?auto_47773 ) ) ( AVAILABLE ?auto_47773 ) ( SURFACE-AT ?auto_47759 ?auto_47763 ) ( ON ?auto_47759 ?auto_47762 ) ( CLEAR ?auto_47759 ) ( not ( = ?auto_47758 ?auto_47762 ) ) ( not ( = ?auto_47759 ?auto_47762 ) ) ( not ( = ?auto_47770 ?auto_47762 ) ) ( not ( = ?auto_47765 ?auto_47762 ) ) ( IS-CRATE ?auto_47765 ) ( not ( = ?auto_47758 ?auto_47775 ) ) ( not ( = ?auto_47759 ?auto_47775 ) ) ( not ( = ?auto_47770 ?auto_47775 ) ) ( not ( = ?auto_47765 ?auto_47775 ) ) ( not ( = ?auto_47762 ?auto_47775 ) ) ( not ( = ?auto_47766 ?auto_47764 ) ) ( not ( = ?auto_47769 ?auto_47766 ) ) ( not ( = ?auto_47763 ?auto_47766 ) ) ( HOIST-AT ?auto_47760 ?auto_47766 ) ( not ( = ?auto_47774 ?auto_47760 ) ) ( not ( = ?auto_47772 ?auto_47760 ) ) ( not ( = ?auto_47773 ?auto_47760 ) ) ( AVAILABLE ?auto_47760 ) ( SURFACE-AT ?auto_47765 ?auto_47766 ) ( ON ?auto_47765 ?auto_47768 ) ( CLEAR ?auto_47765 ) ( not ( = ?auto_47758 ?auto_47768 ) ) ( not ( = ?auto_47759 ?auto_47768 ) ) ( not ( = ?auto_47770 ?auto_47768 ) ) ( not ( = ?auto_47765 ?auto_47768 ) ) ( not ( = ?auto_47762 ?auto_47768 ) ) ( not ( = ?auto_47775 ?auto_47768 ) ) ( SURFACE-AT ?auto_47776 ?auto_47764 ) ( CLEAR ?auto_47776 ) ( IS-CRATE ?auto_47775 ) ( not ( = ?auto_47758 ?auto_47776 ) ) ( not ( = ?auto_47759 ?auto_47776 ) ) ( not ( = ?auto_47770 ?auto_47776 ) ) ( not ( = ?auto_47765 ?auto_47776 ) ) ( not ( = ?auto_47762 ?auto_47776 ) ) ( not ( = ?auto_47775 ?auto_47776 ) ) ( not ( = ?auto_47768 ?auto_47776 ) ) ( AVAILABLE ?auto_47774 ) ( TRUCK-AT ?auto_47761 ?auto_47771 ) ( not ( = ?auto_47771 ?auto_47764 ) ) ( not ( = ?auto_47769 ?auto_47771 ) ) ( not ( = ?auto_47763 ?auto_47771 ) ) ( not ( = ?auto_47766 ?auto_47771 ) ) ( HOIST-AT ?auto_47767 ?auto_47771 ) ( not ( = ?auto_47774 ?auto_47767 ) ) ( not ( = ?auto_47772 ?auto_47767 ) ) ( not ( = ?auto_47773 ?auto_47767 ) ) ( not ( = ?auto_47760 ?auto_47767 ) ) ( AVAILABLE ?auto_47767 ) ( SURFACE-AT ?auto_47775 ?auto_47771 ) ( ON ?auto_47775 ?auto_47777 ) ( CLEAR ?auto_47775 ) ( not ( = ?auto_47758 ?auto_47777 ) ) ( not ( = ?auto_47759 ?auto_47777 ) ) ( not ( = ?auto_47770 ?auto_47777 ) ) ( not ( = ?auto_47765 ?auto_47777 ) ) ( not ( = ?auto_47762 ?auto_47777 ) ) ( not ( = ?auto_47775 ?auto_47777 ) ) ( not ( = ?auto_47768 ?auto_47777 ) ) ( not ( = ?auto_47776 ?auto_47777 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47767 ?auto_47775 ?auto_47777 ?auto_47771 )
      ( MAKE-ON ?auto_47758 ?auto_47759 )
      ( MAKE-ON-VERIFY ?auto_47758 ?auto_47759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47778 - SURFACE
      ?auto_47779 - SURFACE
    )
    :vars
    (
      ?auto_47783 - HOIST
      ?auto_47794 - PLACE
      ?auto_47795 - PLACE
      ?auto_47788 - HOIST
      ?auto_47789 - SURFACE
      ?auto_47780 - SURFACE
      ?auto_47793 - PLACE
      ?auto_47797 - HOIST
      ?auto_47791 - SURFACE
      ?auto_47784 - SURFACE
      ?auto_47782 - PLACE
      ?auto_47785 - HOIST
      ?auto_47796 - SURFACE
      ?auto_47781 - SURFACE
      ?auto_47786 - PLACE
      ?auto_47790 - HOIST
      ?auto_47787 - SURFACE
      ?auto_47792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47783 ?auto_47794 ) ( IS-CRATE ?auto_47778 ) ( not ( = ?auto_47778 ?auto_47779 ) ) ( not ( = ?auto_47795 ?auto_47794 ) ) ( HOIST-AT ?auto_47788 ?auto_47795 ) ( not ( = ?auto_47783 ?auto_47788 ) ) ( AVAILABLE ?auto_47788 ) ( SURFACE-AT ?auto_47778 ?auto_47795 ) ( ON ?auto_47778 ?auto_47789 ) ( CLEAR ?auto_47778 ) ( not ( = ?auto_47778 ?auto_47789 ) ) ( not ( = ?auto_47779 ?auto_47789 ) ) ( IS-CRATE ?auto_47779 ) ( not ( = ?auto_47778 ?auto_47780 ) ) ( not ( = ?auto_47779 ?auto_47780 ) ) ( not ( = ?auto_47789 ?auto_47780 ) ) ( not ( = ?auto_47793 ?auto_47794 ) ) ( not ( = ?auto_47795 ?auto_47793 ) ) ( HOIST-AT ?auto_47797 ?auto_47793 ) ( not ( = ?auto_47783 ?auto_47797 ) ) ( not ( = ?auto_47788 ?auto_47797 ) ) ( AVAILABLE ?auto_47797 ) ( SURFACE-AT ?auto_47779 ?auto_47793 ) ( ON ?auto_47779 ?auto_47791 ) ( CLEAR ?auto_47779 ) ( not ( = ?auto_47778 ?auto_47791 ) ) ( not ( = ?auto_47779 ?auto_47791 ) ) ( not ( = ?auto_47789 ?auto_47791 ) ) ( not ( = ?auto_47780 ?auto_47791 ) ) ( IS-CRATE ?auto_47780 ) ( not ( = ?auto_47778 ?auto_47784 ) ) ( not ( = ?auto_47779 ?auto_47784 ) ) ( not ( = ?auto_47789 ?auto_47784 ) ) ( not ( = ?auto_47780 ?auto_47784 ) ) ( not ( = ?auto_47791 ?auto_47784 ) ) ( not ( = ?auto_47782 ?auto_47794 ) ) ( not ( = ?auto_47795 ?auto_47782 ) ) ( not ( = ?auto_47793 ?auto_47782 ) ) ( HOIST-AT ?auto_47785 ?auto_47782 ) ( not ( = ?auto_47783 ?auto_47785 ) ) ( not ( = ?auto_47788 ?auto_47785 ) ) ( not ( = ?auto_47797 ?auto_47785 ) ) ( AVAILABLE ?auto_47785 ) ( SURFACE-AT ?auto_47780 ?auto_47782 ) ( ON ?auto_47780 ?auto_47796 ) ( CLEAR ?auto_47780 ) ( not ( = ?auto_47778 ?auto_47796 ) ) ( not ( = ?auto_47779 ?auto_47796 ) ) ( not ( = ?auto_47789 ?auto_47796 ) ) ( not ( = ?auto_47780 ?auto_47796 ) ) ( not ( = ?auto_47791 ?auto_47796 ) ) ( not ( = ?auto_47784 ?auto_47796 ) ) ( SURFACE-AT ?auto_47781 ?auto_47794 ) ( CLEAR ?auto_47781 ) ( IS-CRATE ?auto_47784 ) ( not ( = ?auto_47778 ?auto_47781 ) ) ( not ( = ?auto_47779 ?auto_47781 ) ) ( not ( = ?auto_47789 ?auto_47781 ) ) ( not ( = ?auto_47780 ?auto_47781 ) ) ( not ( = ?auto_47791 ?auto_47781 ) ) ( not ( = ?auto_47784 ?auto_47781 ) ) ( not ( = ?auto_47796 ?auto_47781 ) ) ( AVAILABLE ?auto_47783 ) ( not ( = ?auto_47786 ?auto_47794 ) ) ( not ( = ?auto_47795 ?auto_47786 ) ) ( not ( = ?auto_47793 ?auto_47786 ) ) ( not ( = ?auto_47782 ?auto_47786 ) ) ( HOIST-AT ?auto_47790 ?auto_47786 ) ( not ( = ?auto_47783 ?auto_47790 ) ) ( not ( = ?auto_47788 ?auto_47790 ) ) ( not ( = ?auto_47797 ?auto_47790 ) ) ( not ( = ?auto_47785 ?auto_47790 ) ) ( AVAILABLE ?auto_47790 ) ( SURFACE-AT ?auto_47784 ?auto_47786 ) ( ON ?auto_47784 ?auto_47787 ) ( CLEAR ?auto_47784 ) ( not ( = ?auto_47778 ?auto_47787 ) ) ( not ( = ?auto_47779 ?auto_47787 ) ) ( not ( = ?auto_47789 ?auto_47787 ) ) ( not ( = ?auto_47780 ?auto_47787 ) ) ( not ( = ?auto_47791 ?auto_47787 ) ) ( not ( = ?auto_47784 ?auto_47787 ) ) ( not ( = ?auto_47796 ?auto_47787 ) ) ( not ( = ?auto_47781 ?auto_47787 ) ) ( TRUCK-AT ?auto_47792 ?auto_47794 ) )
    :subtasks
    ( ( !DRIVE ?auto_47792 ?auto_47794 ?auto_47786 )
      ( MAKE-ON ?auto_47778 ?auto_47779 )
      ( MAKE-ON-VERIFY ?auto_47778 ?auto_47779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47798 - SURFACE
      ?auto_47799 - SURFACE
    )
    :vars
    (
      ?auto_47802 - HOIST
      ?auto_47810 - PLACE
      ?auto_47809 - PLACE
      ?auto_47816 - HOIST
      ?auto_47811 - SURFACE
      ?auto_47807 - SURFACE
      ?auto_47803 - PLACE
      ?auto_47813 - HOIST
      ?auto_47817 - SURFACE
      ?auto_47805 - SURFACE
      ?auto_47804 - PLACE
      ?auto_47800 - HOIST
      ?auto_47812 - SURFACE
      ?auto_47808 - SURFACE
      ?auto_47815 - PLACE
      ?auto_47814 - HOIST
      ?auto_47801 - SURFACE
      ?auto_47806 - TRUCK
      ?auto_47818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47802 ?auto_47810 ) ( IS-CRATE ?auto_47798 ) ( not ( = ?auto_47798 ?auto_47799 ) ) ( not ( = ?auto_47809 ?auto_47810 ) ) ( HOIST-AT ?auto_47816 ?auto_47809 ) ( not ( = ?auto_47802 ?auto_47816 ) ) ( AVAILABLE ?auto_47816 ) ( SURFACE-AT ?auto_47798 ?auto_47809 ) ( ON ?auto_47798 ?auto_47811 ) ( CLEAR ?auto_47798 ) ( not ( = ?auto_47798 ?auto_47811 ) ) ( not ( = ?auto_47799 ?auto_47811 ) ) ( IS-CRATE ?auto_47799 ) ( not ( = ?auto_47798 ?auto_47807 ) ) ( not ( = ?auto_47799 ?auto_47807 ) ) ( not ( = ?auto_47811 ?auto_47807 ) ) ( not ( = ?auto_47803 ?auto_47810 ) ) ( not ( = ?auto_47809 ?auto_47803 ) ) ( HOIST-AT ?auto_47813 ?auto_47803 ) ( not ( = ?auto_47802 ?auto_47813 ) ) ( not ( = ?auto_47816 ?auto_47813 ) ) ( AVAILABLE ?auto_47813 ) ( SURFACE-AT ?auto_47799 ?auto_47803 ) ( ON ?auto_47799 ?auto_47817 ) ( CLEAR ?auto_47799 ) ( not ( = ?auto_47798 ?auto_47817 ) ) ( not ( = ?auto_47799 ?auto_47817 ) ) ( not ( = ?auto_47811 ?auto_47817 ) ) ( not ( = ?auto_47807 ?auto_47817 ) ) ( IS-CRATE ?auto_47807 ) ( not ( = ?auto_47798 ?auto_47805 ) ) ( not ( = ?auto_47799 ?auto_47805 ) ) ( not ( = ?auto_47811 ?auto_47805 ) ) ( not ( = ?auto_47807 ?auto_47805 ) ) ( not ( = ?auto_47817 ?auto_47805 ) ) ( not ( = ?auto_47804 ?auto_47810 ) ) ( not ( = ?auto_47809 ?auto_47804 ) ) ( not ( = ?auto_47803 ?auto_47804 ) ) ( HOIST-AT ?auto_47800 ?auto_47804 ) ( not ( = ?auto_47802 ?auto_47800 ) ) ( not ( = ?auto_47816 ?auto_47800 ) ) ( not ( = ?auto_47813 ?auto_47800 ) ) ( AVAILABLE ?auto_47800 ) ( SURFACE-AT ?auto_47807 ?auto_47804 ) ( ON ?auto_47807 ?auto_47812 ) ( CLEAR ?auto_47807 ) ( not ( = ?auto_47798 ?auto_47812 ) ) ( not ( = ?auto_47799 ?auto_47812 ) ) ( not ( = ?auto_47811 ?auto_47812 ) ) ( not ( = ?auto_47807 ?auto_47812 ) ) ( not ( = ?auto_47817 ?auto_47812 ) ) ( not ( = ?auto_47805 ?auto_47812 ) ) ( IS-CRATE ?auto_47805 ) ( not ( = ?auto_47798 ?auto_47808 ) ) ( not ( = ?auto_47799 ?auto_47808 ) ) ( not ( = ?auto_47811 ?auto_47808 ) ) ( not ( = ?auto_47807 ?auto_47808 ) ) ( not ( = ?auto_47817 ?auto_47808 ) ) ( not ( = ?auto_47805 ?auto_47808 ) ) ( not ( = ?auto_47812 ?auto_47808 ) ) ( not ( = ?auto_47815 ?auto_47810 ) ) ( not ( = ?auto_47809 ?auto_47815 ) ) ( not ( = ?auto_47803 ?auto_47815 ) ) ( not ( = ?auto_47804 ?auto_47815 ) ) ( HOIST-AT ?auto_47814 ?auto_47815 ) ( not ( = ?auto_47802 ?auto_47814 ) ) ( not ( = ?auto_47816 ?auto_47814 ) ) ( not ( = ?auto_47813 ?auto_47814 ) ) ( not ( = ?auto_47800 ?auto_47814 ) ) ( AVAILABLE ?auto_47814 ) ( SURFACE-AT ?auto_47805 ?auto_47815 ) ( ON ?auto_47805 ?auto_47801 ) ( CLEAR ?auto_47805 ) ( not ( = ?auto_47798 ?auto_47801 ) ) ( not ( = ?auto_47799 ?auto_47801 ) ) ( not ( = ?auto_47811 ?auto_47801 ) ) ( not ( = ?auto_47807 ?auto_47801 ) ) ( not ( = ?auto_47817 ?auto_47801 ) ) ( not ( = ?auto_47805 ?auto_47801 ) ) ( not ( = ?auto_47812 ?auto_47801 ) ) ( not ( = ?auto_47808 ?auto_47801 ) ) ( TRUCK-AT ?auto_47806 ?auto_47810 ) ( SURFACE-AT ?auto_47818 ?auto_47810 ) ( CLEAR ?auto_47818 ) ( LIFTING ?auto_47802 ?auto_47808 ) ( IS-CRATE ?auto_47808 ) ( not ( = ?auto_47798 ?auto_47818 ) ) ( not ( = ?auto_47799 ?auto_47818 ) ) ( not ( = ?auto_47811 ?auto_47818 ) ) ( not ( = ?auto_47807 ?auto_47818 ) ) ( not ( = ?auto_47817 ?auto_47818 ) ) ( not ( = ?auto_47805 ?auto_47818 ) ) ( not ( = ?auto_47812 ?auto_47818 ) ) ( not ( = ?auto_47808 ?auto_47818 ) ) ( not ( = ?auto_47801 ?auto_47818 ) ) )
    :subtasks
    ( ( !DROP ?auto_47802 ?auto_47808 ?auto_47818 ?auto_47810 )
      ( MAKE-ON ?auto_47798 ?auto_47799 )
      ( MAKE-ON-VERIFY ?auto_47798 ?auto_47799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47819 - SURFACE
      ?auto_47820 - SURFACE
    )
    :vars
    (
      ?auto_47822 - HOIST
      ?auto_47829 - PLACE
      ?auto_47838 - PLACE
      ?auto_47821 - HOIST
      ?auto_47832 - SURFACE
      ?auto_47831 - SURFACE
      ?auto_47826 - PLACE
      ?auto_47830 - HOIST
      ?auto_47839 - SURFACE
      ?auto_47828 - SURFACE
      ?auto_47827 - PLACE
      ?auto_47834 - HOIST
      ?auto_47836 - SURFACE
      ?auto_47833 - SURFACE
      ?auto_47825 - PLACE
      ?auto_47837 - HOIST
      ?auto_47823 - SURFACE
      ?auto_47824 - TRUCK
      ?auto_47835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47822 ?auto_47829 ) ( IS-CRATE ?auto_47819 ) ( not ( = ?auto_47819 ?auto_47820 ) ) ( not ( = ?auto_47838 ?auto_47829 ) ) ( HOIST-AT ?auto_47821 ?auto_47838 ) ( not ( = ?auto_47822 ?auto_47821 ) ) ( AVAILABLE ?auto_47821 ) ( SURFACE-AT ?auto_47819 ?auto_47838 ) ( ON ?auto_47819 ?auto_47832 ) ( CLEAR ?auto_47819 ) ( not ( = ?auto_47819 ?auto_47832 ) ) ( not ( = ?auto_47820 ?auto_47832 ) ) ( IS-CRATE ?auto_47820 ) ( not ( = ?auto_47819 ?auto_47831 ) ) ( not ( = ?auto_47820 ?auto_47831 ) ) ( not ( = ?auto_47832 ?auto_47831 ) ) ( not ( = ?auto_47826 ?auto_47829 ) ) ( not ( = ?auto_47838 ?auto_47826 ) ) ( HOIST-AT ?auto_47830 ?auto_47826 ) ( not ( = ?auto_47822 ?auto_47830 ) ) ( not ( = ?auto_47821 ?auto_47830 ) ) ( AVAILABLE ?auto_47830 ) ( SURFACE-AT ?auto_47820 ?auto_47826 ) ( ON ?auto_47820 ?auto_47839 ) ( CLEAR ?auto_47820 ) ( not ( = ?auto_47819 ?auto_47839 ) ) ( not ( = ?auto_47820 ?auto_47839 ) ) ( not ( = ?auto_47832 ?auto_47839 ) ) ( not ( = ?auto_47831 ?auto_47839 ) ) ( IS-CRATE ?auto_47831 ) ( not ( = ?auto_47819 ?auto_47828 ) ) ( not ( = ?auto_47820 ?auto_47828 ) ) ( not ( = ?auto_47832 ?auto_47828 ) ) ( not ( = ?auto_47831 ?auto_47828 ) ) ( not ( = ?auto_47839 ?auto_47828 ) ) ( not ( = ?auto_47827 ?auto_47829 ) ) ( not ( = ?auto_47838 ?auto_47827 ) ) ( not ( = ?auto_47826 ?auto_47827 ) ) ( HOIST-AT ?auto_47834 ?auto_47827 ) ( not ( = ?auto_47822 ?auto_47834 ) ) ( not ( = ?auto_47821 ?auto_47834 ) ) ( not ( = ?auto_47830 ?auto_47834 ) ) ( AVAILABLE ?auto_47834 ) ( SURFACE-AT ?auto_47831 ?auto_47827 ) ( ON ?auto_47831 ?auto_47836 ) ( CLEAR ?auto_47831 ) ( not ( = ?auto_47819 ?auto_47836 ) ) ( not ( = ?auto_47820 ?auto_47836 ) ) ( not ( = ?auto_47832 ?auto_47836 ) ) ( not ( = ?auto_47831 ?auto_47836 ) ) ( not ( = ?auto_47839 ?auto_47836 ) ) ( not ( = ?auto_47828 ?auto_47836 ) ) ( IS-CRATE ?auto_47828 ) ( not ( = ?auto_47819 ?auto_47833 ) ) ( not ( = ?auto_47820 ?auto_47833 ) ) ( not ( = ?auto_47832 ?auto_47833 ) ) ( not ( = ?auto_47831 ?auto_47833 ) ) ( not ( = ?auto_47839 ?auto_47833 ) ) ( not ( = ?auto_47828 ?auto_47833 ) ) ( not ( = ?auto_47836 ?auto_47833 ) ) ( not ( = ?auto_47825 ?auto_47829 ) ) ( not ( = ?auto_47838 ?auto_47825 ) ) ( not ( = ?auto_47826 ?auto_47825 ) ) ( not ( = ?auto_47827 ?auto_47825 ) ) ( HOIST-AT ?auto_47837 ?auto_47825 ) ( not ( = ?auto_47822 ?auto_47837 ) ) ( not ( = ?auto_47821 ?auto_47837 ) ) ( not ( = ?auto_47830 ?auto_47837 ) ) ( not ( = ?auto_47834 ?auto_47837 ) ) ( AVAILABLE ?auto_47837 ) ( SURFACE-AT ?auto_47828 ?auto_47825 ) ( ON ?auto_47828 ?auto_47823 ) ( CLEAR ?auto_47828 ) ( not ( = ?auto_47819 ?auto_47823 ) ) ( not ( = ?auto_47820 ?auto_47823 ) ) ( not ( = ?auto_47832 ?auto_47823 ) ) ( not ( = ?auto_47831 ?auto_47823 ) ) ( not ( = ?auto_47839 ?auto_47823 ) ) ( not ( = ?auto_47828 ?auto_47823 ) ) ( not ( = ?auto_47836 ?auto_47823 ) ) ( not ( = ?auto_47833 ?auto_47823 ) ) ( TRUCK-AT ?auto_47824 ?auto_47829 ) ( SURFACE-AT ?auto_47835 ?auto_47829 ) ( CLEAR ?auto_47835 ) ( IS-CRATE ?auto_47833 ) ( not ( = ?auto_47819 ?auto_47835 ) ) ( not ( = ?auto_47820 ?auto_47835 ) ) ( not ( = ?auto_47832 ?auto_47835 ) ) ( not ( = ?auto_47831 ?auto_47835 ) ) ( not ( = ?auto_47839 ?auto_47835 ) ) ( not ( = ?auto_47828 ?auto_47835 ) ) ( not ( = ?auto_47836 ?auto_47835 ) ) ( not ( = ?auto_47833 ?auto_47835 ) ) ( not ( = ?auto_47823 ?auto_47835 ) ) ( AVAILABLE ?auto_47822 ) ( IN ?auto_47833 ?auto_47824 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47822 ?auto_47833 ?auto_47824 ?auto_47829 )
      ( MAKE-ON ?auto_47819 ?auto_47820 )
      ( MAKE-ON-VERIFY ?auto_47819 ?auto_47820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47840 - SURFACE
      ?auto_47841 - SURFACE
    )
    :vars
    (
      ?auto_47853 - HOIST
      ?auto_47846 - PLACE
      ?auto_47856 - PLACE
      ?auto_47842 - HOIST
      ?auto_47860 - SURFACE
      ?auto_47844 - SURFACE
      ?auto_47847 - PLACE
      ?auto_47848 - HOIST
      ?auto_47855 - SURFACE
      ?auto_47859 - SURFACE
      ?auto_47851 - PLACE
      ?auto_47852 - HOIST
      ?auto_47849 - SURFACE
      ?auto_47845 - SURFACE
      ?auto_47854 - PLACE
      ?auto_47857 - HOIST
      ?auto_47858 - SURFACE
      ?auto_47843 - SURFACE
      ?auto_47850 - TRUCK
      ?auto_47861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47853 ?auto_47846 ) ( IS-CRATE ?auto_47840 ) ( not ( = ?auto_47840 ?auto_47841 ) ) ( not ( = ?auto_47856 ?auto_47846 ) ) ( HOIST-AT ?auto_47842 ?auto_47856 ) ( not ( = ?auto_47853 ?auto_47842 ) ) ( AVAILABLE ?auto_47842 ) ( SURFACE-AT ?auto_47840 ?auto_47856 ) ( ON ?auto_47840 ?auto_47860 ) ( CLEAR ?auto_47840 ) ( not ( = ?auto_47840 ?auto_47860 ) ) ( not ( = ?auto_47841 ?auto_47860 ) ) ( IS-CRATE ?auto_47841 ) ( not ( = ?auto_47840 ?auto_47844 ) ) ( not ( = ?auto_47841 ?auto_47844 ) ) ( not ( = ?auto_47860 ?auto_47844 ) ) ( not ( = ?auto_47847 ?auto_47846 ) ) ( not ( = ?auto_47856 ?auto_47847 ) ) ( HOIST-AT ?auto_47848 ?auto_47847 ) ( not ( = ?auto_47853 ?auto_47848 ) ) ( not ( = ?auto_47842 ?auto_47848 ) ) ( AVAILABLE ?auto_47848 ) ( SURFACE-AT ?auto_47841 ?auto_47847 ) ( ON ?auto_47841 ?auto_47855 ) ( CLEAR ?auto_47841 ) ( not ( = ?auto_47840 ?auto_47855 ) ) ( not ( = ?auto_47841 ?auto_47855 ) ) ( not ( = ?auto_47860 ?auto_47855 ) ) ( not ( = ?auto_47844 ?auto_47855 ) ) ( IS-CRATE ?auto_47844 ) ( not ( = ?auto_47840 ?auto_47859 ) ) ( not ( = ?auto_47841 ?auto_47859 ) ) ( not ( = ?auto_47860 ?auto_47859 ) ) ( not ( = ?auto_47844 ?auto_47859 ) ) ( not ( = ?auto_47855 ?auto_47859 ) ) ( not ( = ?auto_47851 ?auto_47846 ) ) ( not ( = ?auto_47856 ?auto_47851 ) ) ( not ( = ?auto_47847 ?auto_47851 ) ) ( HOIST-AT ?auto_47852 ?auto_47851 ) ( not ( = ?auto_47853 ?auto_47852 ) ) ( not ( = ?auto_47842 ?auto_47852 ) ) ( not ( = ?auto_47848 ?auto_47852 ) ) ( AVAILABLE ?auto_47852 ) ( SURFACE-AT ?auto_47844 ?auto_47851 ) ( ON ?auto_47844 ?auto_47849 ) ( CLEAR ?auto_47844 ) ( not ( = ?auto_47840 ?auto_47849 ) ) ( not ( = ?auto_47841 ?auto_47849 ) ) ( not ( = ?auto_47860 ?auto_47849 ) ) ( not ( = ?auto_47844 ?auto_47849 ) ) ( not ( = ?auto_47855 ?auto_47849 ) ) ( not ( = ?auto_47859 ?auto_47849 ) ) ( IS-CRATE ?auto_47859 ) ( not ( = ?auto_47840 ?auto_47845 ) ) ( not ( = ?auto_47841 ?auto_47845 ) ) ( not ( = ?auto_47860 ?auto_47845 ) ) ( not ( = ?auto_47844 ?auto_47845 ) ) ( not ( = ?auto_47855 ?auto_47845 ) ) ( not ( = ?auto_47859 ?auto_47845 ) ) ( not ( = ?auto_47849 ?auto_47845 ) ) ( not ( = ?auto_47854 ?auto_47846 ) ) ( not ( = ?auto_47856 ?auto_47854 ) ) ( not ( = ?auto_47847 ?auto_47854 ) ) ( not ( = ?auto_47851 ?auto_47854 ) ) ( HOIST-AT ?auto_47857 ?auto_47854 ) ( not ( = ?auto_47853 ?auto_47857 ) ) ( not ( = ?auto_47842 ?auto_47857 ) ) ( not ( = ?auto_47848 ?auto_47857 ) ) ( not ( = ?auto_47852 ?auto_47857 ) ) ( AVAILABLE ?auto_47857 ) ( SURFACE-AT ?auto_47859 ?auto_47854 ) ( ON ?auto_47859 ?auto_47858 ) ( CLEAR ?auto_47859 ) ( not ( = ?auto_47840 ?auto_47858 ) ) ( not ( = ?auto_47841 ?auto_47858 ) ) ( not ( = ?auto_47860 ?auto_47858 ) ) ( not ( = ?auto_47844 ?auto_47858 ) ) ( not ( = ?auto_47855 ?auto_47858 ) ) ( not ( = ?auto_47859 ?auto_47858 ) ) ( not ( = ?auto_47849 ?auto_47858 ) ) ( not ( = ?auto_47845 ?auto_47858 ) ) ( SURFACE-AT ?auto_47843 ?auto_47846 ) ( CLEAR ?auto_47843 ) ( IS-CRATE ?auto_47845 ) ( not ( = ?auto_47840 ?auto_47843 ) ) ( not ( = ?auto_47841 ?auto_47843 ) ) ( not ( = ?auto_47860 ?auto_47843 ) ) ( not ( = ?auto_47844 ?auto_47843 ) ) ( not ( = ?auto_47855 ?auto_47843 ) ) ( not ( = ?auto_47859 ?auto_47843 ) ) ( not ( = ?auto_47849 ?auto_47843 ) ) ( not ( = ?auto_47845 ?auto_47843 ) ) ( not ( = ?auto_47858 ?auto_47843 ) ) ( AVAILABLE ?auto_47853 ) ( IN ?auto_47845 ?auto_47850 ) ( TRUCK-AT ?auto_47850 ?auto_47861 ) ( not ( = ?auto_47861 ?auto_47846 ) ) ( not ( = ?auto_47856 ?auto_47861 ) ) ( not ( = ?auto_47847 ?auto_47861 ) ) ( not ( = ?auto_47851 ?auto_47861 ) ) ( not ( = ?auto_47854 ?auto_47861 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_47850 ?auto_47861 ?auto_47846 )
      ( MAKE-ON ?auto_47840 ?auto_47841 )
      ( MAKE-ON-VERIFY ?auto_47840 ?auto_47841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47862 - SURFACE
      ?auto_47863 - SURFACE
    )
    :vars
    (
      ?auto_47879 - HOIST
      ?auto_47868 - PLACE
      ?auto_47871 - PLACE
      ?auto_47867 - HOIST
      ?auto_47875 - SURFACE
      ?auto_47880 - SURFACE
      ?auto_47876 - PLACE
      ?auto_47870 - HOIST
      ?auto_47882 - SURFACE
      ?auto_47874 - SURFACE
      ?auto_47873 - PLACE
      ?auto_47877 - HOIST
      ?auto_47864 - SURFACE
      ?auto_47869 - SURFACE
      ?auto_47883 - PLACE
      ?auto_47866 - HOIST
      ?auto_47865 - SURFACE
      ?auto_47878 - SURFACE
      ?auto_47881 - TRUCK
      ?auto_47872 - PLACE
      ?auto_47884 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47879 ?auto_47868 ) ( IS-CRATE ?auto_47862 ) ( not ( = ?auto_47862 ?auto_47863 ) ) ( not ( = ?auto_47871 ?auto_47868 ) ) ( HOIST-AT ?auto_47867 ?auto_47871 ) ( not ( = ?auto_47879 ?auto_47867 ) ) ( AVAILABLE ?auto_47867 ) ( SURFACE-AT ?auto_47862 ?auto_47871 ) ( ON ?auto_47862 ?auto_47875 ) ( CLEAR ?auto_47862 ) ( not ( = ?auto_47862 ?auto_47875 ) ) ( not ( = ?auto_47863 ?auto_47875 ) ) ( IS-CRATE ?auto_47863 ) ( not ( = ?auto_47862 ?auto_47880 ) ) ( not ( = ?auto_47863 ?auto_47880 ) ) ( not ( = ?auto_47875 ?auto_47880 ) ) ( not ( = ?auto_47876 ?auto_47868 ) ) ( not ( = ?auto_47871 ?auto_47876 ) ) ( HOIST-AT ?auto_47870 ?auto_47876 ) ( not ( = ?auto_47879 ?auto_47870 ) ) ( not ( = ?auto_47867 ?auto_47870 ) ) ( AVAILABLE ?auto_47870 ) ( SURFACE-AT ?auto_47863 ?auto_47876 ) ( ON ?auto_47863 ?auto_47882 ) ( CLEAR ?auto_47863 ) ( not ( = ?auto_47862 ?auto_47882 ) ) ( not ( = ?auto_47863 ?auto_47882 ) ) ( not ( = ?auto_47875 ?auto_47882 ) ) ( not ( = ?auto_47880 ?auto_47882 ) ) ( IS-CRATE ?auto_47880 ) ( not ( = ?auto_47862 ?auto_47874 ) ) ( not ( = ?auto_47863 ?auto_47874 ) ) ( not ( = ?auto_47875 ?auto_47874 ) ) ( not ( = ?auto_47880 ?auto_47874 ) ) ( not ( = ?auto_47882 ?auto_47874 ) ) ( not ( = ?auto_47873 ?auto_47868 ) ) ( not ( = ?auto_47871 ?auto_47873 ) ) ( not ( = ?auto_47876 ?auto_47873 ) ) ( HOIST-AT ?auto_47877 ?auto_47873 ) ( not ( = ?auto_47879 ?auto_47877 ) ) ( not ( = ?auto_47867 ?auto_47877 ) ) ( not ( = ?auto_47870 ?auto_47877 ) ) ( AVAILABLE ?auto_47877 ) ( SURFACE-AT ?auto_47880 ?auto_47873 ) ( ON ?auto_47880 ?auto_47864 ) ( CLEAR ?auto_47880 ) ( not ( = ?auto_47862 ?auto_47864 ) ) ( not ( = ?auto_47863 ?auto_47864 ) ) ( not ( = ?auto_47875 ?auto_47864 ) ) ( not ( = ?auto_47880 ?auto_47864 ) ) ( not ( = ?auto_47882 ?auto_47864 ) ) ( not ( = ?auto_47874 ?auto_47864 ) ) ( IS-CRATE ?auto_47874 ) ( not ( = ?auto_47862 ?auto_47869 ) ) ( not ( = ?auto_47863 ?auto_47869 ) ) ( not ( = ?auto_47875 ?auto_47869 ) ) ( not ( = ?auto_47880 ?auto_47869 ) ) ( not ( = ?auto_47882 ?auto_47869 ) ) ( not ( = ?auto_47874 ?auto_47869 ) ) ( not ( = ?auto_47864 ?auto_47869 ) ) ( not ( = ?auto_47883 ?auto_47868 ) ) ( not ( = ?auto_47871 ?auto_47883 ) ) ( not ( = ?auto_47876 ?auto_47883 ) ) ( not ( = ?auto_47873 ?auto_47883 ) ) ( HOIST-AT ?auto_47866 ?auto_47883 ) ( not ( = ?auto_47879 ?auto_47866 ) ) ( not ( = ?auto_47867 ?auto_47866 ) ) ( not ( = ?auto_47870 ?auto_47866 ) ) ( not ( = ?auto_47877 ?auto_47866 ) ) ( AVAILABLE ?auto_47866 ) ( SURFACE-AT ?auto_47874 ?auto_47883 ) ( ON ?auto_47874 ?auto_47865 ) ( CLEAR ?auto_47874 ) ( not ( = ?auto_47862 ?auto_47865 ) ) ( not ( = ?auto_47863 ?auto_47865 ) ) ( not ( = ?auto_47875 ?auto_47865 ) ) ( not ( = ?auto_47880 ?auto_47865 ) ) ( not ( = ?auto_47882 ?auto_47865 ) ) ( not ( = ?auto_47874 ?auto_47865 ) ) ( not ( = ?auto_47864 ?auto_47865 ) ) ( not ( = ?auto_47869 ?auto_47865 ) ) ( SURFACE-AT ?auto_47878 ?auto_47868 ) ( CLEAR ?auto_47878 ) ( IS-CRATE ?auto_47869 ) ( not ( = ?auto_47862 ?auto_47878 ) ) ( not ( = ?auto_47863 ?auto_47878 ) ) ( not ( = ?auto_47875 ?auto_47878 ) ) ( not ( = ?auto_47880 ?auto_47878 ) ) ( not ( = ?auto_47882 ?auto_47878 ) ) ( not ( = ?auto_47874 ?auto_47878 ) ) ( not ( = ?auto_47864 ?auto_47878 ) ) ( not ( = ?auto_47869 ?auto_47878 ) ) ( not ( = ?auto_47865 ?auto_47878 ) ) ( AVAILABLE ?auto_47879 ) ( TRUCK-AT ?auto_47881 ?auto_47872 ) ( not ( = ?auto_47872 ?auto_47868 ) ) ( not ( = ?auto_47871 ?auto_47872 ) ) ( not ( = ?auto_47876 ?auto_47872 ) ) ( not ( = ?auto_47873 ?auto_47872 ) ) ( not ( = ?auto_47883 ?auto_47872 ) ) ( HOIST-AT ?auto_47884 ?auto_47872 ) ( LIFTING ?auto_47884 ?auto_47869 ) ( not ( = ?auto_47879 ?auto_47884 ) ) ( not ( = ?auto_47867 ?auto_47884 ) ) ( not ( = ?auto_47870 ?auto_47884 ) ) ( not ( = ?auto_47877 ?auto_47884 ) ) ( not ( = ?auto_47866 ?auto_47884 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47884 ?auto_47869 ?auto_47881 ?auto_47872 )
      ( MAKE-ON ?auto_47862 ?auto_47863 )
      ( MAKE-ON-VERIFY ?auto_47862 ?auto_47863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47885 - SURFACE
      ?auto_47886 - SURFACE
    )
    :vars
    (
      ?auto_47904 - HOIST
      ?auto_47891 - PLACE
      ?auto_47893 - PLACE
      ?auto_47898 - HOIST
      ?auto_47890 - SURFACE
      ?auto_47901 - SURFACE
      ?auto_47896 - PLACE
      ?auto_47902 - HOIST
      ?auto_47906 - SURFACE
      ?auto_47907 - SURFACE
      ?auto_47895 - PLACE
      ?auto_47894 - HOIST
      ?auto_47892 - SURFACE
      ?auto_47888 - SURFACE
      ?auto_47900 - PLACE
      ?auto_47897 - HOIST
      ?auto_47887 - SURFACE
      ?auto_47905 - SURFACE
      ?auto_47899 - TRUCK
      ?auto_47903 - PLACE
      ?auto_47889 - HOIST
      ?auto_47908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47904 ?auto_47891 ) ( IS-CRATE ?auto_47885 ) ( not ( = ?auto_47885 ?auto_47886 ) ) ( not ( = ?auto_47893 ?auto_47891 ) ) ( HOIST-AT ?auto_47898 ?auto_47893 ) ( not ( = ?auto_47904 ?auto_47898 ) ) ( AVAILABLE ?auto_47898 ) ( SURFACE-AT ?auto_47885 ?auto_47893 ) ( ON ?auto_47885 ?auto_47890 ) ( CLEAR ?auto_47885 ) ( not ( = ?auto_47885 ?auto_47890 ) ) ( not ( = ?auto_47886 ?auto_47890 ) ) ( IS-CRATE ?auto_47886 ) ( not ( = ?auto_47885 ?auto_47901 ) ) ( not ( = ?auto_47886 ?auto_47901 ) ) ( not ( = ?auto_47890 ?auto_47901 ) ) ( not ( = ?auto_47896 ?auto_47891 ) ) ( not ( = ?auto_47893 ?auto_47896 ) ) ( HOIST-AT ?auto_47902 ?auto_47896 ) ( not ( = ?auto_47904 ?auto_47902 ) ) ( not ( = ?auto_47898 ?auto_47902 ) ) ( AVAILABLE ?auto_47902 ) ( SURFACE-AT ?auto_47886 ?auto_47896 ) ( ON ?auto_47886 ?auto_47906 ) ( CLEAR ?auto_47886 ) ( not ( = ?auto_47885 ?auto_47906 ) ) ( not ( = ?auto_47886 ?auto_47906 ) ) ( not ( = ?auto_47890 ?auto_47906 ) ) ( not ( = ?auto_47901 ?auto_47906 ) ) ( IS-CRATE ?auto_47901 ) ( not ( = ?auto_47885 ?auto_47907 ) ) ( not ( = ?auto_47886 ?auto_47907 ) ) ( not ( = ?auto_47890 ?auto_47907 ) ) ( not ( = ?auto_47901 ?auto_47907 ) ) ( not ( = ?auto_47906 ?auto_47907 ) ) ( not ( = ?auto_47895 ?auto_47891 ) ) ( not ( = ?auto_47893 ?auto_47895 ) ) ( not ( = ?auto_47896 ?auto_47895 ) ) ( HOIST-AT ?auto_47894 ?auto_47895 ) ( not ( = ?auto_47904 ?auto_47894 ) ) ( not ( = ?auto_47898 ?auto_47894 ) ) ( not ( = ?auto_47902 ?auto_47894 ) ) ( AVAILABLE ?auto_47894 ) ( SURFACE-AT ?auto_47901 ?auto_47895 ) ( ON ?auto_47901 ?auto_47892 ) ( CLEAR ?auto_47901 ) ( not ( = ?auto_47885 ?auto_47892 ) ) ( not ( = ?auto_47886 ?auto_47892 ) ) ( not ( = ?auto_47890 ?auto_47892 ) ) ( not ( = ?auto_47901 ?auto_47892 ) ) ( not ( = ?auto_47906 ?auto_47892 ) ) ( not ( = ?auto_47907 ?auto_47892 ) ) ( IS-CRATE ?auto_47907 ) ( not ( = ?auto_47885 ?auto_47888 ) ) ( not ( = ?auto_47886 ?auto_47888 ) ) ( not ( = ?auto_47890 ?auto_47888 ) ) ( not ( = ?auto_47901 ?auto_47888 ) ) ( not ( = ?auto_47906 ?auto_47888 ) ) ( not ( = ?auto_47907 ?auto_47888 ) ) ( not ( = ?auto_47892 ?auto_47888 ) ) ( not ( = ?auto_47900 ?auto_47891 ) ) ( not ( = ?auto_47893 ?auto_47900 ) ) ( not ( = ?auto_47896 ?auto_47900 ) ) ( not ( = ?auto_47895 ?auto_47900 ) ) ( HOIST-AT ?auto_47897 ?auto_47900 ) ( not ( = ?auto_47904 ?auto_47897 ) ) ( not ( = ?auto_47898 ?auto_47897 ) ) ( not ( = ?auto_47902 ?auto_47897 ) ) ( not ( = ?auto_47894 ?auto_47897 ) ) ( AVAILABLE ?auto_47897 ) ( SURFACE-AT ?auto_47907 ?auto_47900 ) ( ON ?auto_47907 ?auto_47887 ) ( CLEAR ?auto_47907 ) ( not ( = ?auto_47885 ?auto_47887 ) ) ( not ( = ?auto_47886 ?auto_47887 ) ) ( not ( = ?auto_47890 ?auto_47887 ) ) ( not ( = ?auto_47901 ?auto_47887 ) ) ( not ( = ?auto_47906 ?auto_47887 ) ) ( not ( = ?auto_47907 ?auto_47887 ) ) ( not ( = ?auto_47892 ?auto_47887 ) ) ( not ( = ?auto_47888 ?auto_47887 ) ) ( SURFACE-AT ?auto_47905 ?auto_47891 ) ( CLEAR ?auto_47905 ) ( IS-CRATE ?auto_47888 ) ( not ( = ?auto_47885 ?auto_47905 ) ) ( not ( = ?auto_47886 ?auto_47905 ) ) ( not ( = ?auto_47890 ?auto_47905 ) ) ( not ( = ?auto_47901 ?auto_47905 ) ) ( not ( = ?auto_47906 ?auto_47905 ) ) ( not ( = ?auto_47907 ?auto_47905 ) ) ( not ( = ?auto_47892 ?auto_47905 ) ) ( not ( = ?auto_47888 ?auto_47905 ) ) ( not ( = ?auto_47887 ?auto_47905 ) ) ( AVAILABLE ?auto_47904 ) ( TRUCK-AT ?auto_47899 ?auto_47903 ) ( not ( = ?auto_47903 ?auto_47891 ) ) ( not ( = ?auto_47893 ?auto_47903 ) ) ( not ( = ?auto_47896 ?auto_47903 ) ) ( not ( = ?auto_47895 ?auto_47903 ) ) ( not ( = ?auto_47900 ?auto_47903 ) ) ( HOIST-AT ?auto_47889 ?auto_47903 ) ( not ( = ?auto_47904 ?auto_47889 ) ) ( not ( = ?auto_47898 ?auto_47889 ) ) ( not ( = ?auto_47902 ?auto_47889 ) ) ( not ( = ?auto_47894 ?auto_47889 ) ) ( not ( = ?auto_47897 ?auto_47889 ) ) ( AVAILABLE ?auto_47889 ) ( SURFACE-AT ?auto_47888 ?auto_47903 ) ( ON ?auto_47888 ?auto_47908 ) ( CLEAR ?auto_47888 ) ( not ( = ?auto_47885 ?auto_47908 ) ) ( not ( = ?auto_47886 ?auto_47908 ) ) ( not ( = ?auto_47890 ?auto_47908 ) ) ( not ( = ?auto_47901 ?auto_47908 ) ) ( not ( = ?auto_47906 ?auto_47908 ) ) ( not ( = ?auto_47907 ?auto_47908 ) ) ( not ( = ?auto_47892 ?auto_47908 ) ) ( not ( = ?auto_47888 ?auto_47908 ) ) ( not ( = ?auto_47887 ?auto_47908 ) ) ( not ( = ?auto_47905 ?auto_47908 ) ) )
    :subtasks
    ( ( !LIFT ?auto_47889 ?auto_47888 ?auto_47908 ?auto_47903 )
      ( MAKE-ON ?auto_47885 ?auto_47886 )
      ( MAKE-ON-VERIFY ?auto_47885 ?auto_47886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47909 - SURFACE
      ?auto_47910 - SURFACE
    )
    :vars
    (
      ?auto_47912 - HOIST
      ?auto_47926 - PLACE
      ?auto_47930 - PLACE
      ?auto_47927 - HOIST
      ?auto_47925 - SURFACE
      ?auto_47917 - SURFACE
      ?auto_47922 - PLACE
      ?auto_47918 - HOIST
      ?auto_47920 - SURFACE
      ?auto_47921 - SURFACE
      ?auto_47913 - PLACE
      ?auto_47932 - HOIST
      ?auto_47924 - SURFACE
      ?auto_47928 - SURFACE
      ?auto_47929 - PLACE
      ?auto_47931 - HOIST
      ?auto_47914 - SURFACE
      ?auto_47919 - SURFACE
      ?auto_47911 - PLACE
      ?auto_47916 - HOIST
      ?auto_47915 - SURFACE
      ?auto_47923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47912 ?auto_47926 ) ( IS-CRATE ?auto_47909 ) ( not ( = ?auto_47909 ?auto_47910 ) ) ( not ( = ?auto_47930 ?auto_47926 ) ) ( HOIST-AT ?auto_47927 ?auto_47930 ) ( not ( = ?auto_47912 ?auto_47927 ) ) ( AVAILABLE ?auto_47927 ) ( SURFACE-AT ?auto_47909 ?auto_47930 ) ( ON ?auto_47909 ?auto_47925 ) ( CLEAR ?auto_47909 ) ( not ( = ?auto_47909 ?auto_47925 ) ) ( not ( = ?auto_47910 ?auto_47925 ) ) ( IS-CRATE ?auto_47910 ) ( not ( = ?auto_47909 ?auto_47917 ) ) ( not ( = ?auto_47910 ?auto_47917 ) ) ( not ( = ?auto_47925 ?auto_47917 ) ) ( not ( = ?auto_47922 ?auto_47926 ) ) ( not ( = ?auto_47930 ?auto_47922 ) ) ( HOIST-AT ?auto_47918 ?auto_47922 ) ( not ( = ?auto_47912 ?auto_47918 ) ) ( not ( = ?auto_47927 ?auto_47918 ) ) ( AVAILABLE ?auto_47918 ) ( SURFACE-AT ?auto_47910 ?auto_47922 ) ( ON ?auto_47910 ?auto_47920 ) ( CLEAR ?auto_47910 ) ( not ( = ?auto_47909 ?auto_47920 ) ) ( not ( = ?auto_47910 ?auto_47920 ) ) ( not ( = ?auto_47925 ?auto_47920 ) ) ( not ( = ?auto_47917 ?auto_47920 ) ) ( IS-CRATE ?auto_47917 ) ( not ( = ?auto_47909 ?auto_47921 ) ) ( not ( = ?auto_47910 ?auto_47921 ) ) ( not ( = ?auto_47925 ?auto_47921 ) ) ( not ( = ?auto_47917 ?auto_47921 ) ) ( not ( = ?auto_47920 ?auto_47921 ) ) ( not ( = ?auto_47913 ?auto_47926 ) ) ( not ( = ?auto_47930 ?auto_47913 ) ) ( not ( = ?auto_47922 ?auto_47913 ) ) ( HOIST-AT ?auto_47932 ?auto_47913 ) ( not ( = ?auto_47912 ?auto_47932 ) ) ( not ( = ?auto_47927 ?auto_47932 ) ) ( not ( = ?auto_47918 ?auto_47932 ) ) ( AVAILABLE ?auto_47932 ) ( SURFACE-AT ?auto_47917 ?auto_47913 ) ( ON ?auto_47917 ?auto_47924 ) ( CLEAR ?auto_47917 ) ( not ( = ?auto_47909 ?auto_47924 ) ) ( not ( = ?auto_47910 ?auto_47924 ) ) ( not ( = ?auto_47925 ?auto_47924 ) ) ( not ( = ?auto_47917 ?auto_47924 ) ) ( not ( = ?auto_47920 ?auto_47924 ) ) ( not ( = ?auto_47921 ?auto_47924 ) ) ( IS-CRATE ?auto_47921 ) ( not ( = ?auto_47909 ?auto_47928 ) ) ( not ( = ?auto_47910 ?auto_47928 ) ) ( not ( = ?auto_47925 ?auto_47928 ) ) ( not ( = ?auto_47917 ?auto_47928 ) ) ( not ( = ?auto_47920 ?auto_47928 ) ) ( not ( = ?auto_47921 ?auto_47928 ) ) ( not ( = ?auto_47924 ?auto_47928 ) ) ( not ( = ?auto_47929 ?auto_47926 ) ) ( not ( = ?auto_47930 ?auto_47929 ) ) ( not ( = ?auto_47922 ?auto_47929 ) ) ( not ( = ?auto_47913 ?auto_47929 ) ) ( HOIST-AT ?auto_47931 ?auto_47929 ) ( not ( = ?auto_47912 ?auto_47931 ) ) ( not ( = ?auto_47927 ?auto_47931 ) ) ( not ( = ?auto_47918 ?auto_47931 ) ) ( not ( = ?auto_47932 ?auto_47931 ) ) ( AVAILABLE ?auto_47931 ) ( SURFACE-AT ?auto_47921 ?auto_47929 ) ( ON ?auto_47921 ?auto_47914 ) ( CLEAR ?auto_47921 ) ( not ( = ?auto_47909 ?auto_47914 ) ) ( not ( = ?auto_47910 ?auto_47914 ) ) ( not ( = ?auto_47925 ?auto_47914 ) ) ( not ( = ?auto_47917 ?auto_47914 ) ) ( not ( = ?auto_47920 ?auto_47914 ) ) ( not ( = ?auto_47921 ?auto_47914 ) ) ( not ( = ?auto_47924 ?auto_47914 ) ) ( not ( = ?auto_47928 ?auto_47914 ) ) ( SURFACE-AT ?auto_47919 ?auto_47926 ) ( CLEAR ?auto_47919 ) ( IS-CRATE ?auto_47928 ) ( not ( = ?auto_47909 ?auto_47919 ) ) ( not ( = ?auto_47910 ?auto_47919 ) ) ( not ( = ?auto_47925 ?auto_47919 ) ) ( not ( = ?auto_47917 ?auto_47919 ) ) ( not ( = ?auto_47920 ?auto_47919 ) ) ( not ( = ?auto_47921 ?auto_47919 ) ) ( not ( = ?auto_47924 ?auto_47919 ) ) ( not ( = ?auto_47928 ?auto_47919 ) ) ( not ( = ?auto_47914 ?auto_47919 ) ) ( AVAILABLE ?auto_47912 ) ( not ( = ?auto_47911 ?auto_47926 ) ) ( not ( = ?auto_47930 ?auto_47911 ) ) ( not ( = ?auto_47922 ?auto_47911 ) ) ( not ( = ?auto_47913 ?auto_47911 ) ) ( not ( = ?auto_47929 ?auto_47911 ) ) ( HOIST-AT ?auto_47916 ?auto_47911 ) ( not ( = ?auto_47912 ?auto_47916 ) ) ( not ( = ?auto_47927 ?auto_47916 ) ) ( not ( = ?auto_47918 ?auto_47916 ) ) ( not ( = ?auto_47932 ?auto_47916 ) ) ( not ( = ?auto_47931 ?auto_47916 ) ) ( AVAILABLE ?auto_47916 ) ( SURFACE-AT ?auto_47928 ?auto_47911 ) ( ON ?auto_47928 ?auto_47915 ) ( CLEAR ?auto_47928 ) ( not ( = ?auto_47909 ?auto_47915 ) ) ( not ( = ?auto_47910 ?auto_47915 ) ) ( not ( = ?auto_47925 ?auto_47915 ) ) ( not ( = ?auto_47917 ?auto_47915 ) ) ( not ( = ?auto_47920 ?auto_47915 ) ) ( not ( = ?auto_47921 ?auto_47915 ) ) ( not ( = ?auto_47924 ?auto_47915 ) ) ( not ( = ?auto_47928 ?auto_47915 ) ) ( not ( = ?auto_47914 ?auto_47915 ) ) ( not ( = ?auto_47919 ?auto_47915 ) ) ( TRUCK-AT ?auto_47923 ?auto_47926 ) )
    :subtasks
    ( ( !DRIVE ?auto_47923 ?auto_47926 ?auto_47911 )
      ( MAKE-ON ?auto_47909 ?auto_47910 )
      ( MAKE-ON-VERIFY ?auto_47909 ?auto_47910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47933 - SURFACE
      ?auto_47934 - SURFACE
    )
    :vars
    (
      ?auto_47950 - HOIST
      ?auto_47937 - PLACE
      ?auto_47938 - PLACE
      ?auto_47952 - HOIST
      ?auto_47948 - SURFACE
      ?auto_47944 - SURFACE
      ?auto_47945 - PLACE
      ?auto_47951 - HOIST
      ?auto_47946 - SURFACE
      ?auto_47943 - SURFACE
      ?auto_47936 - PLACE
      ?auto_47955 - HOIST
      ?auto_47942 - SURFACE
      ?auto_47953 - SURFACE
      ?auto_47939 - PLACE
      ?auto_47954 - HOIST
      ?auto_47935 - SURFACE
      ?auto_47956 - SURFACE
      ?auto_47947 - PLACE
      ?auto_47941 - HOIST
      ?auto_47949 - SURFACE
      ?auto_47940 - TRUCK
      ?auto_47957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47950 ?auto_47937 ) ( IS-CRATE ?auto_47933 ) ( not ( = ?auto_47933 ?auto_47934 ) ) ( not ( = ?auto_47938 ?auto_47937 ) ) ( HOIST-AT ?auto_47952 ?auto_47938 ) ( not ( = ?auto_47950 ?auto_47952 ) ) ( AVAILABLE ?auto_47952 ) ( SURFACE-AT ?auto_47933 ?auto_47938 ) ( ON ?auto_47933 ?auto_47948 ) ( CLEAR ?auto_47933 ) ( not ( = ?auto_47933 ?auto_47948 ) ) ( not ( = ?auto_47934 ?auto_47948 ) ) ( IS-CRATE ?auto_47934 ) ( not ( = ?auto_47933 ?auto_47944 ) ) ( not ( = ?auto_47934 ?auto_47944 ) ) ( not ( = ?auto_47948 ?auto_47944 ) ) ( not ( = ?auto_47945 ?auto_47937 ) ) ( not ( = ?auto_47938 ?auto_47945 ) ) ( HOIST-AT ?auto_47951 ?auto_47945 ) ( not ( = ?auto_47950 ?auto_47951 ) ) ( not ( = ?auto_47952 ?auto_47951 ) ) ( AVAILABLE ?auto_47951 ) ( SURFACE-AT ?auto_47934 ?auto_47945 ) ( ON ?auto_47934 ?auto_47946 ) ( CLEAR ?auto_47934 ) ( not ( = ?auto_47933 ?auto_47946 ) ) ( not ( = ?auto_47934 ?auto_47946 ) ) ( not ( = ?auto_47948 ?auto_47946 ) ) ( not ( = ?auto_47944 ?auto_47946 ) ) ( IS-CRATE ?auto_47944 ) ( not ( = ?auto_47933 ?auto_47943 ) ) ( not ( = ?auto_47934 ?auto_47943 ) ) ( not ( = ?auto_47948 ?auto_47943 ) ) ( not ( = ?auto_47944 ?auto_47943 ) ) ( not ( = ?auto_47946 ?auto_47943 ) ) ( not ( = ?auto_47936 ?auto_47937 ) ) ( not ( = ?auto_47938 ?auto_47936 ) ) ( not ( = ?auto_47945 ?auto_47936 ) ) ( HOIST-AT ?auto_47955 ?auto_47936 ) ( not ( = ?auto_47950 ?auto_47955 ) ) ( not ( = ?auto_47952 ?auto_47955 ) ) ( not ( = ?auto_47951 ?auto_47955 ) ) ( AVAILABLE ?auto_47955 ) ( SURFACE-AT ?auto_47944 ?auto_47936 ) ( ON ?auto_47944 ?auto_47942 ) ( CLEAR ?auto_47944 ) ( not ( = ?auto_47933 ?auto_47942 ) ) ( not ( = ?auto_47934 ?auto_47942 ) ) ( not ( = ?auto_47948 ?auto_47942 ) ) ( not ( = ?auto_47944 ?auto_47942 ) ) ( not ( = ?auto_47946 ?auto_47942 ) ) ( not ( = ?auto_47943 ?auto_47942 ) ) ( IS-CRATE ?auto_47943 ) ( not ( = ?auto_47933 ?auto_47953 ) ) ( not ( = ?auto_47934 ?auto_47953 ) ) ( not ( = ?auto_47948 ?auto_47953 ) ) ( not ( = ?auto_47944 ?auto_47953 ) ) ( not ( = ?auto_47946 ?auto_47953 ) ) ( not ( = ?auto_47943 ?auto_47953 ) ) ( not ( = ?auto_47942 ?auto_47953 ) ) ( not ( = ?auto_47939 ?auto_47937 ) ) ( not ( = ?auto_47938 ?auto_47939 ) ) ( not ( = ?auto_47945 ?auto_47939 ) ) ( not ( = ?auto_47936 ?auto_47939 ) ) ( HOIST-AT ?auto_47954 ?auto_47939 ) ( not ( = ?auto_47950 ?auto_47954 ) ) ( not ( = ?auto_47952 ?auto_47954 ) ) ( not ( = ?auto_47951 ?auto_47954 ) ) ( not ( = ?auto_47955 ?auto_47954 ) ) ( AVAILABLE ?auto_47954 ) ( SURFACE-AT ?auto_47943 ?auto_47939 ) ( ON ?auto_47943 ?auto_47935 ) ( CLEAR ?auto_47943 ) ( not ( = ?auto_47933 ?auto_47935 ) ) ( not ( = ?auto_47934 ?auto_47935 ) ) ( not ( = ?auto_47948 ?auto_47935 ) ) ( not ( = ?auto_47944 ?auto_47935 ) ) ( not ( = ?auto_47946 ?auto_47935 ) ) ( not ( = ?auto_47943 ?auto_47935 ) ) ( not ( = ?auto_47942 ?auto_47935 ) ) ( not ( = ?auto_47953 ?auto_47935 ) ) ( IS-CRATE ?auto_47953 ) ( not ( = ?auto_47933 ?auto_47956 ) ) ( not ( = ?auto_47934 ?auto_47956 ) ) ( not ( = ?auto_47948 ?auto_47956 ) ) ( not ( = ?auto_47944 ?auto_47956 ) ) ( not ( = ?auto_47946 ?auto_47956 ) ) ( not ( = ?auto_47943 ?auto_47956 ) ) ( not ( = ?auto_47942 ?auto_47956 ) ) ( not ( = ?auto_47953 ?auto_47956 ) ) ( not ( = ?auto_47935 ?auto_47956 ) ) ( not ( = ?auto_47947 ?auto_47937 ) ) ( not ( = ?auto_47938 ?auto_47947 ) ) ( not ( = ?auto_47945 ?auto_47947 ) ) ( not ( = ?auto_47936 ?auto_47947 ) ) ( not ( = ?auto_47939 ?auto_47947 ) ) ( HOIST-AT ?auto_47941 ?auto_47947 ) ( not ( = ?auto_47950 ?auto_47941 ) ) ( not ( = ?auto_47952 ?auto_47941 ) ) ( not ( = ?auto_47951 ?auto_47941 ) ) ( not ( = ?auto_47955 ?auto_47941 ) ) ( not ( = ?auto_47954 ?auto_47941 ) ) ( AVAILABLE ?auto_47941 ) ( SURFACE-AT ?auto_47953 ?auto_47947 ) ( ON ?auto_47953 ?auto_47949 ) ( CLEAR ?auto_47953 ) ( not ( = ?auto_47933 ?auto_47949 ) ) ( not ( = ?auto_47934 ?auto_47949 ) ) ( not ( = ?auto_47948 ?auto_47949 ) ) ( not ( = ?auto_47944 ?auto_47949 ) ) ( not ( = ?auto_47946 ?auto_47949 ) ) ( not ( = ?auto_47943 ?auto_47949 ) ) ( not ( = ?auto_47942 ?auto_47949 ) ) ( not ( = ?auto_47953 ?auto_47949 ) ) ( not ( = ?auto_47935 ?auto_47949 ) ) ( not ( = ?auto_47956 ?auto_47949 ) ) ( TRUCK-AT ?auto_47940 ?auto_47937 ) ( SURFACE-AT ?auto_47957 ?auto_47937 ) ( CLEAR ?auto_47957 ) ( LIFTING ?auto_47950 ?auto_47956 ) ( IS-CRATE ?auto_47956 ) ( not ( = ?auto_47933 ?auto_47957 ) ) ( not ( = ?auto_47934 ?auto_47957 ) ) ( not ( = ?auto_47948 ?auto_47957 ) ) ( not ( = ?auto_47944 ?auto_47957 ) ) ( not ( = ?auto_47946 ?auto_47957 ) ) ( not ( = ?auto_47943 ?auto_47957 ) ) ( not ( = ?auto_47942 ?auto_47957 ) ) ( not ( = ?auto_47953 ?auto_47957 ) ) ( not ( = ?auto_47935 ?auto_47957 ) ) ( not ( = ?auto_47956 ?auto_47957 ) ) ( not ( = ?auto_47949 ?auto_47957 ) ) )
    :subtasks
    ( ( !DROP ?auto_47950 ?auto_47956 ?auto_47957 ?auto_47937 )
      ( MAKE-ON ?auto_47933 ?auto_47934 )
      ( MAKE-ON-VERIFY ?auto_47933 ?auto_47934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47958 - SURFACE
      ?auto_47959 - SURFACE
    )
    :vars
    (
      ?auto_47963 - HOIST
      ?auto_47973 - PLACE
      ?auto_47971 - PLACE
      ?auto_47969 - HOIST
      ?auto_47977 - SURFACE
      ?auto_47979 - SURFACE
      ?auto_47978 - PLACE
      ?auto_47961 - HOIST
      ?auto_47966 - SURFACE
      ?auto_47972 - SURFACE
      ?auto_47967 - PLACE
      ?auto_47964 - HOIST
      ?auto_47980 - SURFACE
      ?auto_47970 - SURFACE
      ?auto_47968 - PLACE
      ?auto_47960 - HOIST
      ?auto_47962 - SURFACE
      ?auto_47965 - SURFACE
      ?auto_47982 - PLACE
      ?auto_47975 - HOIST
      ?auto_47974 - SURFACE
      ?auto_47981 - TRUCK
      ?auto_47976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47963 ?auto_47973 ) ( IS-CRATE ?auto_47958 ) ( not ( = ?auto_47958 ?auto_47959 ) ) ( not ( = ?auto_47971 ?auto_47973 ) ) ( HOIST-AT ?auto_47969 ?auto_47971 ) ( not ( = ?auto_47963 ?auto_47969 ) ) ( AVAILABLE ?auto_47969 ) ( SURFACE-AT ?auto_47958 ?auto_47971 ) ( ON ?auto_47958 ?auto_47977 ) ( CLEAR ?auto_47958 ) ( not ( = ?auto_47958 ?auto_47977 ) ) ( not ( = ?auto_47959 ?auto_47977 ) ) ( IS-CRATE ?auto_47959 ) ( not ( = ?auto_47958 ?auto_47979 ) ) ( not ( = ?auto_47959 ?auto_47979 ) ) ( not ( = ?auto_47977 ?auto_47979 ) ) ( not ( = ?auto_47978 ?auto_47973 ) ) ( not ( = ?auto_47971 ?auto_47978 ) ) ( HOIST-AT ?auto_47961 ?auto_47978 ) ( not ( = ?auto_47963 ?auto_47961 ) ) ( not ( = ?auto_47969 ?auto_47961 ) ) ( AVAILABLE ?auto_47961 ) ( SURFACE-AT ?auto_47959 ?auto_47978 ) ( ON ?auto_47959 ?auto_47966 ) ( CLEAR ?auto_47959 ) ( not ( = ?auto_47958 ?auto_47966 ) ) ( not ( = ?auto_47959 ?auto_47966 ) ) ( not ( = ?auto_47977 ?auto_47966 ) ) ( not ( = ?auto_47979 ?auto_47966 ) ) ( IS-CRATE ?auto_47979 ) ( not ( = ?auto_47958 ?auto_47972 ) ) ( not ( = ?auto_47959 ?auto_47972 ) ) ( not ( = ?auto_47977 ?auto_47972 ) ) ( not ( = ?auto_47979 ?auto_47972 ) ) ( not ( = ?auto_47966 ?auto_47972 ) ) ( not ( = ?auto_47967 ?auto_47973 ) ) ( not ( = ?auto_47971 ?auto_47967 ) ) ( not ( = ?auto_47978 ?auto_47967 ) ) ( HOIST-AT ?auto_47964 ?auto_47967 ) ( not ( = ?auto_47963 ?auto_47964 ) ) ( not ( = ?auto_47969 ?auto_47964 ) ) ( not ( = ?auto_47961 ?auto_47964 ) ) ( AVAILABLE ?auto_47964 ) ( SURFACE-AT ?auto_47979 ?auto_47967 ) ( ON ?auto_47979 ?auto_47980 ) ( CLEAR ?auto_47979 ) ( not ( = ?auto_47958 ?auto_47980 ) ) ( not ( = ?auto_47959 ?auto_47980 ) ) ( not ( = ?auto_47977 ?auto_47980 ) ) ( not ( = ?auto_47979 ?auto_47980 ) ) ( not ( = ?auto_47966 ?auto_47980 ) ) ( not ( = ?auto_47972 ?auto_47980 ) ) ( IS-CRATE ?auto_47972 ) ( not ( = ?auto_47958 ?auto_47970 ) ) ( not ( = ?auto_47959 ?auto_47970 ) ) ( not ( = ?auto_47977 ?auto_47970 ) ) ( not ( = ?auto_47979 ?auto_47970 ) ) ( not ( = ?auto_47966 ?auto_47970 ) ) ( not ( = ?auto_47972 ?auto_47970 ) ) ( not ( = ?auto_47980 ?auto_47970 ) ) ( not ( = ?auto_47968 ?auto_47973 ) ) ( not ( = ?auto_47971 ?auto_47968 ) ) ( not ( = ?auto_47978 ?auto_47968 ) ) ( not ( = ?auto_47967 ?auto_47968 ) ) ( HOIST-AT ?auto_47960 ?auto_47968 ) ( not ( = ?auto_47963 ?auto_47960 ) ) ( not ( = ?auto_47969 ?auto_47960 ) ) ( not ( = ?auto_47961 ?auto_47960 ) ) ( not ( = ?auto_47964 ?auto_47960 ) ) ( AVAILABLE ?auto_47960 ) ( SURFACE-AT ?auto_47972 ?auto_47968 ) ( ON ?auto_47972 ?auto_47962 ) ( CLEAR ?auto_47972 ) ( not ( = ?auto_47958 ?auto_47962 ) ) ( not ( = ?auto_47959 ?auto_47962 ) ) ( not ( = ?auto_47977 ?auto_47962 ) ) ( not ( = ?auto_47979 ?auto_47962 ) ) ( not ( = ?auto_47966 ?auto_47962 ) ) ( not ( = ?auto_47972 ?auto_47962 ) ) ( not ( = ?auto_47980 ?auto_47962 ) ) ( not ( = ?auto_47970 ?auto_47962 ) ) ( IS-CRATE ?auto_47970 ) ( not ( = ?auto_47958 ?auto_47965 ) ) ( not ( = ?auto_47959 ?auto_47965 ) ) ( not ( = ?auto_47977 ?auto_47965 ) ) ( not ( = ?auto_47979 ?auto_47965 ) ) ( not ( = ?auto_47966 ?auto_47965 ) ) ( not ( = ?auto_47972 ?auto_47965 ) ) ( not ( = ?auto_47980 ?auto_47965 ) ) ( not ( = ?auto_47970 ?auto_47965 ) ) ( not ( = ?auto_47962 ?auto_47965 ) ) ( not ( = ?auto_47982 ?auto_47973 ) ) ( not ( = ?auto_47971 ?auto_47982 ) ) ( not ( = ?auto_47978 ?auto_47982 ) ) ( not ( = ?auto_47967 ?auto_47982 ) ) ( not ( = ?auto_47968 ?auto_47982 ) ) ( HOIST-AT ?auto_47975 ?auto_47982 ) ( not ( = ?auto_47963 ?auto_47975 ) ) ( not ( = ?auto_47969 ?auto_47975 ) ) ( not ( = ?auto_47961 ?auto_47975 ) ) ( not ( = ?auto_47964 ?auto_47975 ) ) ( not ( = ?auto_47960 ?auto_47975 ) ) ( AVAILABLE ?auto_47975 ) ( SURFACE-AT ?auto_47970 ?auto_47982 ) ( ON ?auto_47970 ?auto_47974 ) ( CLEAR ?auto_47970 ) ( not ( = ?auto_47958 ?auto_47974 ) ) ( not ( = ?auto_47959 ?auto_47974 ) ) ( not ( = ?auto_47977 ?auto_47974 ) ) ( not ( = ?auto_47979 ?auto_47974 ) ) ( not ( = ?auto_47966 ?auto_47974 ) ) ( not ( = ?auto_47972 ?auto_47974 ) ) ( not ( = ?auto_47980 ?auto_47974 ) ) ( not ( = ?auto_47970 ?auto_47974 ) ) ( not ( = ?auto_47962 ?auto_47974 ) ) ( not ( = ?auto_47965 ?auto_47974 ) ) ( TRUCK-AT ?auto_47981 ?auto_47973 ) ( SURFACE-AT ?auto_47976 ?auto_47973 ) ( CLEAR ?auto_47976 ) ( IS-CRATE ?auto_47965 ) ( not ( = ?auto_47958 ?auto_47976 ) ) ( not ( = ?auto_47959 ?auto_47976 ) ) ( not ( = ?auto_47977 ?auto_47976 ) ) ( not ( = ?auto_47979 ?auto_47976 ) ) ( not ( = ?auto_47966 ?auto_47976 ) ) ( not ( = ?auto_47972 ?auto_47976 ) ) ( not ( = ?auto_47980 ?auto_47976 ) ) ( not ( = ?auto_47970 ?auto_47976 ) ) ( not ( = ?auto_47962 ?auto_47976 ) ) ( not ( = ?auto_47965 ?auto_47976 ) ) ( not ( = ?auto_47974 ?auto_47976 ) ) ( AVAILABLE ?auto_47963 ) ( IN ?auto_47965 ?auto_47981 ) )
    :subtasks
    ( ( !UNLOAD ?auto_47963 ?auto_47965 ?auto_47981 ?auto_47973 )
      ( MAKE-ON ?auto_47958 ?auto_47959 )
      ( MAKE-ON-VERIFY ?auto_47958 ?auto_47959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_47983 - SURFACE
      ?auto_47984 - SURFACE
    )
    :vars
    (
      ?auto_47999 - HOIST
      ?auto_48006 - PLACE
      ?auto_48005 - PLACE
      ?auto_47992 - HOIST
      ?auto_47994 - SURFACE
      ?auto_48007 - SURFACE
      ?auto_47996 - PLACE
      ?auto_47985 - HOIST
      ?auto_48002 - SURFACE
      ?auto_48001 - SURFACE
      ?auto_48004 - PLACE
      ?auto_47995 - HOIST
      ?auto_47990 - SURFACE
      ?auto_47987 - SURFACE
      ?auto_47991 - PLACE
      ?auto_47988 - HOIST
      ?auto_47986 - SURFACE
      ?auto_47993 - SURFACE
      ?auto_47997 - PLACE
      ?auto_47998 - HOIST
      ?auto_48000 - SURFACE
      ?auto_48003 - SURFACE
      ?auto_47989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47999 ?auto_48006 ) ( IS-CRATE ?auto_47983 ) ( not ( = ?auto_47983 ?auto_47984 ) ) ( not ( = ?auto_48005 ?auto_48006 ) ) ( HOIST-AT ?auto_47992 ?auto_48005 ) ( not ( = ?auto_47999 ?auto_47992 ) ) ( AVAILABLE ?auto_47992 ) ( SURFACE-AT ?auto_47983 ?auto_48005 ) ( ON ?auto_47983 ?auto_47994 ) ( CLEAR ?auto_47983 ) ( not ( = ?auto_47983 ?auto_47994 ) ) ( not ( = ?auto_47984 ?auto_47994 ) ) ( IS-CRATE ?auto_47984 ) ( not ( = ?auto_47983 ?auto_48007 ) ) ( not ( = ?auto_47984 ?auto_48007 ) ) ( not ( = ?auto_47994 ?auto_48007 ) ) ( not ( = ?auto_47996 ?auto_48006 ) ) ( not ( = ?auto_48005 ?auto_47996 ) ) ( HOIST-AT ?auto_47985 ?auto_47996 ) ( not ( = ?auto_47999 ?auto_47985 ) ) ( not ( = ?auto_47992 ?auto_47985 ) ) ( AVAILABLE ?auto_47985 ) ( SURFACE-AT ?auto_47984 ?auto_47996 ) ( ON ?auto_47984 ?auto_48002 ) ( CLEAR ?auto_47984 ) ( not ( = ?auto_47983 ?auto_48002 ) ) ( not ( = ?auto_47984 ?auto_48002 ) ) ( not ( = ?auto_47994 ?auto_48002 ) ) ( not ( = ?auto_48007 ?auto_48002 ) ) ( IS-CRATE ?auto_48007 ) ( not ( = ?auto_47983 ?auto_48001 ) ) ( not ( = ?auto_47984 ?auto_48001 ) ) ( not ( = ?auto_47994 ?auto_48001 ) ) ( not ( = ?auto_48007 ?auto_48001 ) ) ( not ( = ?auto_48002 ?auto_48001 ) ) ( not ( = ?auto_48004 ?auto_48006 ) ) ( not ( = ?auto_48005 ?auto_48004 ) ) ( not ( = ?auto_47996 ?auto_48004 ) ) ( HOIST-AT ?auto_47995 ?auto_48004 ) ( not ( = ?auto_47999 ?auto_47995 ) ) ( not ( = ?auto_47992 ?auto_47995 ) ) ( not ( = ?auto_47985 ?auto_47995 ) ) ( AVAILABLE ?auto_47995 ) ( SURFACE-AT ?auto_48007 ?auto_48004 ) ( ON ?auto_48007 ?auto_47990 ) ( CLEAR ?auto_48007 ) ( not ( = ?auto_47983 ?auto_47990 ) ) ( not ( = ?auto_47984 ?auto_47990 ) ) ( not ( = ?auto_47994 ?auto_47990 ) ) ( not ( = ?auto_48007 ?auto_47990 ) ) ( not ( = ?auto_48002 ?auto_47990 ) ) ( not ( = ?auto_48001 ?auto_47990 ) ) ( IS-CRATE ?auto_48001 ) ( not ( = ?auto_47983 ?auto_47987 ) ) ( not ( = ?auto_47984 ?auto_47987 ) ) ( not ( = ?auto_47994 ?auto_47987 ) ) ( not ( = ?auto_48007 ?auto_47987 ) ) ( not ( = ?auto_48002 ?auto_47987 ) ) ( not ( = ?auto_48001 ?auto_47987 ) ) ( not ( = ?auto_47990 ?auto_47987 ) ) ( not ( = ?auto_47991 ?auto_48006 ) ) ( not ( = ?auto_48005 ?auto_47991 ) ) ( not ( = ?auto_47996 ?auto_47991 ) ) ( not ( = ?auto_48004 ?auto_47991 ) ) ( HOIST-AT ?auto_47988 ?auto_47991 ) ( not ( = ?auto_47999 ?auto_47988 ) ) ( not ( = ?auto_47992 ?auto_47988 ) ) ( not ( = ?auto_47985 ?auto_47988 ) ) ( not ( = ?auto_47995 ?auto_47988 ) ) ( AVAILABLE ?auto_47988 ) ( SURFACE-AT ?auto_48001 ?auto_47991 ) ( ON ?auto_48001 ?auto_47986 ) ( CLEAR ?auto_48001 ) ( not ( = ?auto_47983 ?auto_47986 ) ) ( not ( = ?auto_47984 ?auto_47986 ) ) ( not ( = ?auto_47994 ?auto_47986 ) ) ( not ( = ?auto_48007 ?auto_47986 ) ) ( not ( = ?auto_48002 ?auto_47986 ) ) ( not ( = ?auto_48001 ?auto_47986 ) ) ( not ( = ?auto_47990 ?auto_47986 ) ) ( not ( = ?auto_47987 ?auto_47986 ) ) ( IS-CRATE ?auto_47987 ) ( not ( = ?auto_47983 ?auto_47993 ) ) ( not ( = ?auto_47984 ?auto_47993 ) ) ( not ( = ?auto_47994 ?auto_47993 ) ) ( not ( = ?auto_48007 ?auto_47993 ) ) ( not ( = ?auto_48002 ?auto_47993 ) ) ( not ( = ?auto_48001 ?auto_47993 ) ) ( not ( = ?auto_47990 ?auto_47993 ) ) ( not ( = ?auto_47987 ?auto_47993 ) ) ( not ( = ?auto_47986 ?auto_47993 ) ) ( not ( = ?auto_47997 ?auto_48006 ) ) ( not ( = ?auto_48005 ?auto_47997 ) ) ( not ( = ?auto_47996 ?auto_47997 ) ) ( not ( = ?auto_48004 ?auto_47997 ) ) ( not ( = ?auto_47991 ?auto_47997 ) ) ( HOIST-AT ?auto_47998 ?auto_47997 ) ( not ( = ?auto_47999 ?auto_47998 ) ) ( not ( = ?auto_47992 ?auto_47998 ) ) ( not ( = ?auto_47985 ?auto_47998 ) ) ( not ( = ?auto_47995 ?auto_47998 ) ) ( not ( = ?auto_47988 ?auto_47998 ) ) ( AVAILABLE ?auto_47998 ) ( SURFACE-AT ?auto_47987 ?auto_47997 ) ( ON ?auto_47987 ?auto_48000 ) ( CLEAR ?auto_47987 ) ( not ( = ?auto_47983 ?auto_48000 ) ) ( not ( = ?auto_47984 ?auto_48000 ) ) ( not ( = ?auto_47994 ?auto_48000 ) ) ( not ( = ?auto_48007 ?auto_48000 ) ) ( not ( = ?auto_48002 ?auto_48000 ) ) ( not ( = ?auto_48001 ?auto_48000 ) ) ( not ( = ?auto_47990 ?auto_48000 ) ) ( not ( = ?auto_47987 ?auto_48000 ) ) ( not ( = ?auto_47986 ?auto_48000 ) ) ( not ( = ?auto_47993 ?auto_48000 ) ) ( SURFACE-AT ?auto_48003 ?auto_48006 ) ( CLEAR ?auto_48003 ) ( IS-CRATE ?auto_47993 ) ( not ( = ?auto_47983 ?auto_48003 ) ) ( not ( = ?auto_47984 ?auto_48003 ) ) ( not ( = ?auto_47994 ?auto_48003 ) ) ( not ( = ?auto_48007 ?auto_48003 ) ) ( not ( = ?auto_48002 ?auto_48003 ) ) ( not ( = ?auto_48001 ?auto_48003 ) ) ( not ( = ?auto_47990 ?auto_48003 ) ) ( not ( = ?auto_47987 ?auto_48003 ) ) ( not ( = ?auto_47986 ?auto_48003 ) ) ( not ( = ?auto_47993 ?auto_48003 ) ) ( not ( = ?auto_48000 ?auto_48003 ) ) ( AVAILABLE ?auto_47999 ) ( IN ?auto_47993 ?auto_47989 ) ( TRUCK-AT ?auto_47989 ?auto_48005 ) )
    :subtasks
    ( ( !DRIVE ?auto_47989 ?auto_48005 ?auto_48006 )
      ( MAKE-ON ?auto_47983 ?auto_47984 )
      ( MAKE-ON-VERIFY ?auto_47983 ?auto_47984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48008 - SURFACE
      ?auto_48009 - SURFACE
    )
    :vars
    (
      ?auto_48016 - HOIST
      ?auto_48027 - PLACE
      ?auto_48015 - PLACE
      ?auto_48017 - HOIST
      ?auto_48028 - SURFACE
      ?auto_48032 - SURFACE
      ?auto_48025 - PLACE
      ?auto_48019 - HOIST
      ?auto_48012 - SURFACE
      ?auto_48030 - SURFACE
      ?auto_48014 - PLACE
      ?auto_48029 - HOIST
      ?auto_48024 - SURFACE
      ?auto_48022 - SURFACE
      ?auto_48026 - PLACE
      ?auto_48020 - HOIST
      ?auto_48018 - SURFACE
      ?auto_48023 - SURFACE
      ?auto_48021 - PLACE
      ?auto_48010 - HOIST
      ?auto_48031 - SURFACE
      ?auto_48013 - SURFACE
      ?auto_48011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48016 ?auto_48027 ) ( IS-CRATE ?auto_48008 ) ( not ( = ?auto_48008 ?auto_48009 ) ) ( not ( = ?auto_48015 ?auto_48027 ) ) ( HOIST-AT ?auto_48017 ?auto_48015 ) ( not ( = ?auto_48016 ?auto_48017 ) ) ( SURFACE-AT ?auto_48008 ?auto_48015 ) ( ON ?auto_48008 ?auto_48028 ) ( CLEAR ?auto_48008 ) ( not ( = ?auto_48008 ?auto_48028 ) ) ( not ( = ?auto_48009 ?auto_48028 ) ) ( IS-CRATE ?auto_48009 ) ( not ( = ?auto_48008 ?auto_48032 ) ) ( not ( = ?auto_48009 ?auto_48032 ) ) ( not ( = ?auto_48028 ?auto_48032 ) ) ( not ( = ?auto_48025 ?auto_48027 ) ) ( not ( = ?auto_48015 ?auto_48025 ) ) ( HOIST-AT ?auto_48019 ?auto_48025 ) ( not ( = ?auto_48016 ?auto_48019 ) ) ( not ( = ?auto_48017 ?auto_48019 ) ) ( AVAILABLE ?auto_48019 ) ( SURFACE-AT ?auto_48009 ?auto_48025 ) ( ON ?auto_48009 ?auto_48012 ) ( CLEAR ?auto_48009 ) ( not ( = ?auto_48008 ?auto_48012 ) ) ( not ( = ?auto_48009 ?auto_48012 ) ) ( not ( = ?auto_48028 ?auto_48012 ) ) ( not ( = ?auto_48032 ?auto_48012 ) ) ( IS-CRATE ?auto_48032 ) ( not ( = ?auto_48008 ?auto_48030 ) ) ( not ( = ?auto_48009 ?auto_48030 ) ) ( not ( = ?auto_48028 ?auto_48030 ) ) ( not ( = ?auto_48032 ?auto_48030 ) ) ( not ( = ?auto_48012 ?auto_48030 ) ) ( not ( = ?auto_48014 ?auto_48027 ) ) ( not ( = ?auto_48015 ?auto_48014 ) ) ( not ( = ?auto_48025 ?auto_48014 ) ) ( HOIST-AT ?auto_48029 ?auto_48014 ) ( not ( = ?auto_48016 ?auto_48029 ) ) ( not ( = ?auto_48017 ?auto_48029 ) ) ( not ( = ?auto_48019 ?auto_48029 ) ) ( AVAILABLE ?auto_48029 ) ( SURFACE-AT ?auto_48032 ?auto_48014 ) ( ON ?auto_48032 ?auto_48024 ) ( CLEAR ?auto_48032 ) ( not ( = ?auto_48008 ?auto_48024 ) ) ( not ( = ?auto_48009 ?auto_48024 ) ) ( not ( = ?auto_48028 ?auto_48024 ) ) ( not ( = ?auto_48032 ?auto_48024 ) ) ( not ( = ?auto_48012 ?auto_48024 ) ) ( not ( = ?auto_48030 ?auto_48024 ) ) ( IS-CRATE ?auto_48030 ) ( not ( = ?auto_48008 ?auto_48022 ) ) ( not ( = ?auto_48009 ?auto_48022 ) ) ( not ( = ?auto_48028 ?auto_48022 ) ) ( not ( = ?auto_48032 ?auto_48022 ) ) ( not ( = ?auto_48012 ?auto_48022 ) ) ( not ( = ?auto_48030 ?auto_48022 ) ) ( not ( = ?auto_48024 ?auto_48022 ) ) ( not ( = ?auto_48026 ?auto_48027 ) ) ( not ( = ?auto_48015 ?auto_48026 ) ) ( not ( = ?auto_48025 ?auto_48026 ) ) ( not ( = ?auto_48014 ?auto_48026 ) ) ( HOIST-AT ?auto_48020 ?auto_48026 ) ( not ( = ?auto_48016 ?auto_48020 ) ) ( not ( = ?auto_48017 ?auto_48020 ) ) ( not ( = ?auto_48019 ?auto_48020 ) ) ( not ( = ?auto_48029 ?auto_48020 ) ) ( AVAILABLE ?auto_48020 ) ( SURFACE-AT ?auto_48030 ?auto_48026 ) ( ON ?auto_48030 ?auto_48018 ) ( CLEAR ?auto_48030 ) ( not ( = ?auto_48008 ?auto_48018 ) ) ( not ( = ?auto_48009 ?auto_48018 ) ) ( not ( = ?auto_48028 ?auto_48018 ) ) ( not ( = ?auto_48032 ?auto_48018 ) ) ( not ( = ?auto_48012 ?auto_48018 ) ) ( not ( = ?auto_48030 ?auto_48018 ) ) ( not ( = ?auto_48024 ?auto_48018 ) ) ( not ( = ?auto_48022 ?auto_48018 ) ) ( IS-CRATE ?auto_48022 ) ( not ( = ?auto_48008 ?auto_48023 ) ) ( not ( = ?auto_48009 ?auto_48023 ) ) ( not ( = ?auto_48028 ?auto_48023 ) ) ( not ( = ?auto_48032 ?auto_48023 ) ) ( not ( = ?auto_48012 ?auto_48023 ) ) ( not ( = ?auto_48030 ?auto_48023 ) ) ( not ( = ?auto_48024 ?auto_48023 ) ) ( not ( = ?auto_48022 ?auto_48023 ) ) ( not ( = ?auto_48018 ?auto_48023 ) ) ( not ( = ?auto_48021 ?auto_48027 ) ) ( not ( = ?auto_48015 ?auto_48021 ) ) ( not ( = ?auto_48025 ?auto_48021 ) ) ( not ( = ?auto_48014 ?auto_48021 ) ) ( not ( = ?auto_48026 ?auto_48021 ) ) ( HOIST-AT ?auto_48010 ?auto_48021 ) ( not ( = ?auto_48016 ?auto_48010 ) ) ( not ( = ?auto_48017 ?auto_48010 ) ) ( not ( = ?auto_48019 ?auto_48010 ) ) ( not ( = ?auto_48029 ?auto_48010 ) ) ( not ( = ?auto_48020 ?auto_48010 ) ) ( AVAILABLE ?auto_48010 ) ( SURFACE-AT ?auto_48022 ?auto_48021 ) ( ON ?auto_48022 ?auto_48031 ) ( CLEAR ?auto_48022 ) ( not ( = ?auto_48008 ?auto_48031 ) ) ( not ( = ?auto_48009 ?auto_48031 ) ) ( not ( = ?auto_48028 ?auto_48031 ) ) ( not ( = ?auto_48032 ?auto_48031 ) ) ( not ( = ?auto_48012 ?auto_48031 ) ) ( not ( = ?auto_48030 ?auto_48031 ) ) ( not ( = ?auto_48024 ?auto_48031 ) ) ( not ( = ?auto_48022 ?auto_48031 ) ) ( not ( = ?auto_48018 ?auto_48031 ) ) ( not ( = ?auto_48023 ?auto_48031 ) ) ( SURFACE-AT ?auto_48013 ?auto_48027 ) ( CLEAR ?auto_48013 ) ( IS-CRATE ?auto_48023 ) ( not ( = ?auto_48008 ?auto_48013 ) ) ( not ( = ?auto_48009 ?auto_48013 ) ) ( not ( = ?auto_48028 ?auto_48013 ) ) ( not ( = ?auto_48032 ?auto_48013 ) ) ( not ( = ?auto_48012 ?auto_48013 ) ) ( not ( = ?auto_48030 ?auto_48013 ) ) ( not ( = ?auto_48024 ?auto_48013 ) ) ( not ( = ?auto_48022 ?auto_48013 ) ) ( not ( = ?auto_48018 ?auto_48013 ) ) ( not ( = ?auto_48023 ?auto_48013 ) ) ( not ( = ?auto_48031 ?auto_48013 ) ) ( AVAILABLE ?auto_48016 ) ( TRUCK-AT ?auto_48011 ?auto_48015 ) ( LIFTING ?auto_48017 ?auto_48023 ) )
    :subtasks
    ( ( !LOAD ?auto_48017 ?auto_48023 ?auto_48011 ?auto_48015 )
      ( MAKE-ON ?auto_48008 ?auto_48009 )
      ( MAKE-ON-VERIFY ?auto_48008 ?auto_48009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48033 - SURFACE
      ?auto_48034 - SURFACE
    )
    :vars
    (
      ?auto_48035 - HOIST
      ?auto_48052 - PLACE
      ?auto_48042 - PLACE
      ?auto_48043 - HOIST
      ?auto_48039 - SURFACE
      ?auto_48051 - SURFACE
      ?auto_48037 - PLACE
      ?auto_48040 - HOIST
      ?auto_48044 - SURFACE
      ?auto_48057 - SURFACE
      ?auto_48047 - PLACE
      ?auto_48053 - HOIST
      ?auto_48056 - SURFACE
      ?auto_48048 - SURFACE
      ?auto_48054 - PLACE
      ?auto_48050 - HOIST
      ?auto_48041 - SURFACE
      ?auto_48036 - SURFACE
      ?auto_48049 - PLACE
      ?auto_48055 - HOIST
      ?auto_48038 - SURFACE
      ?auto_48046 - SURFACE
      ?auto_48045 - TRUCK
      ?auto_48058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48035 ?auto_48052 ) ( IS-CRATE ?auto_48033 ) ( not ( = ?auto_48033 ?auto_48034 ) ) ( not ( = ?auto_48042 ?auto_48052 ) ) ( HOIST-AT ?auto_48043 ?auto_48042 ) ( not ( = ?auto_48035 ?auto_48043 ) ) ( SURFACE-AT ?auto_48033 ?auto_48042 ) ( ON ?auto_48033 ?auto_48039 ) ( CLEAR ?auto_48033 ) ( not ( = ?auto_48033 ?auto_48039 ) ) ( not ( = ?auto_48034 ?auto_48039 ) ) ( IS-CRATE ?auto_48034 ) ( not ( = ?auto_48033 ?auto_48051 ) ) ( not ( = ?auto_48034 ?auto_48051 ) ) ( not ( = ?auto_48039 ?auto_48051 ) ) ( not ( = ?auto_48037 ?auto_48052 ) ) ( not ( = ?auto_48042 ?auto_48037 ) ) ( HOIST-AT ?auto_48040 ?auto_48037 ) ( not ( = ?auto_48035 ?auto_48040 ) ) ( not ( = ?auto_48043 ?auto_48040 ) ) ( AVAILABLE ?auto_48040 ) ( SURFACE-AT ?auto_48034 ?auto_48037 ) ( ON ?auto_48034 ?auto_48044 ) ( CLEAR ?auto_48034 ) ( not ( = ?auto_48033 ?auto_48044 ) ) ( not ( = ?auto_48034 ?auto_48044 ) ) ( not ( = ?auto_48039 ?auto_48044 ) ) ( not ( = ?auto_48051 ?auto_48044 ) ) ( IS-CRATE ?auto_48051 ) ( not ( = ?auto_48033 ?auto_48057 ) ) ( not ( = ?auto_48034 ?auto_48057 ) ) ( not ( = ?auto_48039 ?auto_48057 ) ) ( not ( = ?auto_48051 ?auto_48057 ) ) ( not ( = ?auto_48044 ?auto_48057 ) ) ( not ( = ?auto_48047 ?auto_48052 ) ) ( not ( = ?auto_48042 ?auto_48047 ) ) ( not ( = ?auto_48037 ?auto_48047 ) ) ( HOIST-AT ?auto_48053 ?auto_48047 ) ( not ( = ?auto_48035 ?auto_48053 ) ) ( not ( = ?auto_48043 ?auto_48053 ) ) ( not ( = ?auto_48040 ?auto_48053 ) ) ( AVAILABLE ?auto_48053 ) ( SURFACE-AT ?auto_48051 ?auto_48047 ) ( ON ?auto_48051 ?auto_48056 ) ( CLEAR ?auto_48051 ) ( not ( = ?auto_48033 ?auto_48056 ) ) ( not ( = ?auto_48034 ?auto_48056 ) ) ( not ( = ?auto_48039 ?auto_48056 ) ) ( not ( = ?auto_48051 ?auto_48056 ) ) ( not ( = ?auto_48044 ?auto_48056 ) ) ( not ( = ?auto_48057 ?auto_48056 ) ) ( IS-CRATE ?auto_48057 ) ( not ( = ?auto_48033 ?auto_48048 ) ) ( not ( = ?auto_48034 ?auto_48048 ) ) ( not ( = ?auto_48039 ?auto_48048 ) ) ( not ( = ?auto_48051 ?auto_48048 ) ) ( not ( = ?auto_48044 ?auto_48048 ) ) ( not ( = ?auto_48057 ?auto_48048 ) ) ( not ( = ?auto_48056 ?auto_48048 ) ) ( not ( = ?auto_48054 ?auto_48052 ) ) ( not ( = ?auto_48042 ?auto_48054 ) ) ( not ( = ?auto_48037 ?auto_48054 ) ) ( not ( = ?auto_48047 ?auto_48054 ) ) ( HOIST-AT ?auto_48050 ?auto_48054 ) ( not ( = ?auto_48035 ?auto_48050 ) ) ( not ( = ?auto_48043 ?auto_48050 ) ) ( not ( = ?auto_48040 ?auto_48050 ) ) ( not ( = ?auto_48053 ?auto_48050 ) ) ( AVAILABLE ?auto_48050 ) ( SURFACE-AT ?auto_48057 ?auto_48054 ) ( ON ?auto_48057 ?auto_48041 ) ( CLEAR ?auto_48057 ) ( not ( = ?auto_48033 ?auto_48041 ) ) ( not ( = ?auto_48034 ?auto_48041 ) ) ( not ( = ?auto_48039 ?auto_48041 ) ) ( not ( = ?auto_48051 ?auto_48041 ) ) ( not ( = ?auto_48044 ?auto_48041 ) ) ( not ( = ?auto_48057 ?auto_48041 ) ) ( not ( = ?auto_48056 ?auto_48041 ) ) ( not ( = ?auto_48048 ?auto_48041 ) ) ( IS-CRATE ?auto_48048 ) ( not ( = ?auto_48033 ?auto_48036 ) ) ( not ( = ?auto_48034 ?auto_48036 ) ) ( not ( = ?auto_48039 ?auto_48036 ) ) ( not ( = ?auto_48051 ?auto_48036 ) ) ( not ( = ?auto_48044 ?auto_48036 ) ) ( not ( = ?auto_48057 ?auto_48036 ) ) ( not ( = ?auto_48056 ?auto_48036 ) ) ( not ( = ?auto_48048 ?auto_48036 ) ) ( not ( = ?auto_48041 ?auto_48036 ) ) ( not ( = ?auto_48049 ?auto_48052 ) ) ( not ( = ?auto_48042 ?auto_48049 ) ) ( not ( = ?auto_48037 ?auto_48049 ) ) ( not ( = ?auto_48047 ?auto_48049 ) ) ( not ( = ?auto_48054 ?auto_48049 ) ) ( HOIST-AT ?auto_48055 ?auto_48049 ) ( not ( = ?auto_48035 ?auto_48055 ) ) ( not ( = ?auto_48043 ?auto_48055 ) ) ( not ( = ?auto_48040 ?auto_48055 ) ) ( not ( = ?auto_48053 ?auto_48055 ) ) ( not ( = ?auto_48050 ?auto_48055 ) ) ( AVAILABLE ?auto_48055 ) ( SURFACE-AT ?auto_48048 ?auto_48049 ) ( ON ?auto_48048 ?auto_48038 ) ( CLEAR ?auto_48048 ) ( not ( = ?auto_48033 ?auto_48038 ) ) ( not ( = ?auto_48034 ?auto_48038 ) ) ( not ( = ?auto_48039 ?auto_48038 ) ) ( not ( = ?auto_48051 ?auto_48038 ) ) ( not ( = ?auto_48044 ?auto_48038 ) ) ( not ( = ?auto_48057 ?auto_48038 ) ) ( not ( = ?auto_48056 ?auto_48038 ) ) ( not ( = ?auto_48048 ?auto_48038 ) ) ( not ( = ?auto_48041 ?auto_48038 ) ) ( not ( = ?auto_48036 ?auto_48038 ) ) ( SURFACE-AT ?auto_48046 ?auto_48052 ) ( CLEAR ?auto_48046 ) ( IS-CRATE ?auto_48036 ) ( not ( = ?auto_48033 ?auto_48046 ) ) ( not ( = ?auto_48034 ?auto_48046 ) ) ( not ( = ?auto_48039 ?auto_48046 ) ) ( not ( = ?auto_48051 ?auto_48046 ) ) ( not ( = ?auto_48044 ?auto_48046 ) ) ( not ( = ?auto_48057 ?auto_48046 ) ) ( not ( = ?auto_48056 ?auto_48046 ) ) ( not ( = ?auto_48048 ?auto_48046 ) ) ( not ( = ?auto_48041 ?auto_48046 ) ) ( not ( = ?auto_48036 ?auto_48046 ) ) ( not ( = ?auto_48038 ?auto_48046 ) ) ( AVAILABLE ?auto_48035 ) ( TRUCK-AT ?auto_48045 ?auto_48042 ) ( AVAILABLE ?auto_48043 ) ( SURFACE-AT ?auto_48036 ?auto_48042 ) ( ON ?auto_48036 ?auto_48058 ) ( CLEAR ?auto_48036 ) ( not ( = ?auto_48033 ?auto_48058 ) ) ( not ( = ?auto_48034 ?auto_48058 ) ) ( not ( = ?auto_48039 ?auto_48058 ) ) ( not ( = ?auto_48051 ?auto_48058 ) ) ( not ( = ?auto_48044 ?auto_48058 ) ) ( not ( = ?auto_48057 ?auto_48058 ) ) ( not ( = ?auto_48056 ?auto_48058 ) ) ( not ( = ?auto_48048 ?auto_48058 ) ) ( not ( = ?auto_48041 ?auto_48058 ) ) ( not ( = ?auto_48036 ?auto_48058 ) ) ( not ( = ?auto_48038 ?auto_48058 ) ) ( not ( = ?auto_48046 ?auto_48058 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48043 ?auto_48036 ?auto_48058 ?auto_48042 )
      ( MAKE-ON ?auto_48033 ?auto_48034 )
      ( MAKE-ON-VERIFY ?auto_48033 ?auto_48034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48059 - SURFACE
      ?auto_48060 - SURFACE
    )
    :vars
    (
      ?auto_48065 - HOIST
      ?auto_48080 - PLACE
      ?auto_48063 - PLACE
      ?auto_48077 - HOIST
      ?auto_48082 - SURFACE
      ?auto_48068 - SURFACE
      ?auto_48061 - PLACE
      ?auto_48067 - HOIST
      ?auto_48069 - SURFACE
      ?auto_48079 - SURFACE
      ?auto_48076 - PLACE
      ?auto_48081 - HOIST
      ?auto_48078 - SURFACE
      ?auto_48064 - SURFACE
      ?auto_48083 - PLACE
      ?auto_48066 - HOIST
      ?auto_48071 - SURFACE
      ?auto_48072 - SURFACE
      ?auto_48074 - PLACE
      ?auto_48084 - HOIST
      ?auto_48062 - SURFACE
      ?auto_48075 - SURFACE
      ?auto_48073 - SURFACE
      ?auto_48070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48065 ?auto_48080 ) ( IS-CRATE ?auto_48059 ) ( not ( = ?auto_48059 ?auto_48060 ) ) ( not ( = ?auto_48063 ?auto_48080 ) ) ( HOIST-AT ?auto_48077 ?auto_48063 ) ( not ( = ?auto_48065 ?auto_48077 ) ) ( SURFACE-AT ?auto_48059 ?auto_48063 ) ( ON ?auto_48059 ?auto_48082 ) ( CLEAR ?auto_48059 ) ( not ( = ?auto_48059 ?auto_48082 ) ) ( not ( = ?auto_48060 ?auto_48082 ) ) ( IS-CRATE ?auto_48060 ) ( not ( = ?auto_48059 ?auto_48068 ) ) ( not ( = ?auto_48060 ?auto_48068 ) ) ( not ( = ?auto_48082 ?auto_48068 ) ) ( not ( = ?auto_48061 ?auto_48080 ) ) ( not ( = ?auto_48063 ?auto_48061 ) ) ( HOIST-AT ?auto_48067 ?auto_48061 ) ( not ( = ?auto_48065 ?auto_48067 ) ) ( not ( = ?auto_48077 ?auto_48067 ) ) ( AVAILABLE ?auto_48067 ) ( SURFACE-AT ?auto_48060 ?auto_48061 ) ( ON ?auto_48060 ?auto_48069 ) ( CLEAR ?auto_48060 ) ( not ( = ?auto_48059 ?auto_48069 ) ) ( not ( = ?auto_48060 ?auto_48069 ) ) ( not ( = ?auto_48082 ?auto_48069 ) ) ( not ( = ?auto_48068 ?auto_48069 ) ) ( IS-CRATE ?auto_48068 ) ( not ( = ?auto_48059 ?auto_48079 ) ) ( not ( = ?auto_48060 ?auto_48079 ) ) ( not ( = ?auto_48082 ?auto_48079 ) ) ( not ( = ?auto_48068 ?auto_48079 ) ) ( not ( = ?auto_48069 ?auto_48079 ) ) ( not ( = ?auto_48076 ?auto_48080 ) ) ( not ( = ?auto_48063 ?auto_48076 ) ) ( not ( = ?auto_48061 ?auto_48076 ) ) ( HOIST-AT ?auto_48081 ?auto_48076 ) ( not ( = ?auto_48065 ?auto_48081 ) ) ( not ( = ?auto_48077 ?auto_48081 ) ) ( not ( = ?auto_48067 ?auto_48081 ) ) ( AVAILABLE ?auto_48081 ) ( SURFACE-AT ?auto_48068 ?auto_48076 ) ( ON ?auto_48068 ?auto_48078 ) ( CLEAR ?auto_48068 ) ( not ( = ?auto_48059 ?auto_48078 ) ) ( not ( = ?auto_48060 ?auto_48078 ) ) ( not ( = ?auto_48082 ?auto_48078 ) ) ( not ( = ?auto_48068 ?auto_48078 ) ) ( not ( = ?auto_48069 ?auto_48078 ) ) ( not ( = ?auto_48079 ?auto_48078 ) ) ( IS-CRATE ?auto_48079 ) ( not ( = ?auto_48059 ?auto_48064 ) ) ( not ( = ?auto_48060 ?auto_48064 ) ) ( not ( = ?auto_48082 ?auto_48064 ) ) ( not ( = ?auto_48068 ?auto_48064 ) ) ( not ( = ?auto_48069 ?auto_48064 ) ) ( not ( = ?auto_48079 ?auto_48064 ) ) ( not ( = ?auto_48078 ?auto_48064 ) ) ( not ( = ?auto_48083 ?auto_48080 ) ) ( not ( = ?auto_48063 ?auto_48083 ) ) ( not ( = ?auto_48061 ?auto_48083 ) ) ( not ( = ?auto_48076 ?auto_48083 ) ) ( HOIST-AT ?auto_48066 ?auto_48083 ) ( not ( = ?auto_48065 ?auto_48066 ) ) ( not ( = ?auto_48077 ?auto_48066 ) ) ( not ( = ?auto_48067 ?auto_48066 ) ) ( not ( = ?auto_48081 ?auto_48066 ) ) ( AVAILABLE ?auto_48066 ) ( SURFACE-AT ?auto_48079 ?auto_48083 ) ( ON ?auto_48079 ?auto_48071 ) ( CLEAR ?auto_48079 ) ( not ( = ?auto_48059 ?auto_48071 ) ) ( not ( = ?auto_48060 ?auto_48071 ) ) ( not ( = ?auto_48082 ?auto_48071 ) ) ( not ( = ?auto_48068 ?auto_48071 ) ) ( not ( = ?auto_48069 ?auto_48071 ) ) ( not ( = ?auto_48079 ?auto_48071 ) ) ( not ( = ?auto_48078 ?auto_48071 ) ) ( not ( = ?auto_48064 ?auto_48071 ) ) ( IS-CRATE ?auto_48064 ) ( not ( = ?auto_48059 ?auto_48072 ) ) ( not ( = ?auto_48060 ?auto_48072 ) ) ( not ( = ?auto_48082 ?auto_48072 ) ) ( not ( = ?auto_48068 ?auto_48072 ) ) ( not ( = ?auto_48069 ?auto_48072 ) ) ( not ( = ?auto_48079 ?auto_48072 ) ) ( not ( = ?auto_48078 ?auto_48072 ) ) ( not ( = ?auto_48064 ?auto_48072 ) ) ( not ( = ?auto_48071 ?auto_48072 ) ) ( not ( = ?auto_48074 ?auto_48080 ) ) ( not ( = ?auto_48063 ?auto_48074 ) ) ( not ( = ?auto_48061 ?auto_48074 ) ) ( not ( = ?auto_48076 ?auto_48074 ) ) ( not ( = ?auto_48083 ?auto_48074 ) ) ( HOIST-AT ?auto_48084 ?auto_48074 ) ( not ( = ?auto_48065 ?auto_48084 ) ) ( not ( = ?auto_48077 ?auto_48084 ) ) ( not ( = ?auto_48067 ?auto_48084 ) ) ( not ( = ?auto_48081 ?auto_48084 ) ) ( not ( = ?auto_48066 ?auto_48084 ) ) ( AVAILABLE ?auto_48084 ) ( SURFACE-AT ?auto_48064 ?auto_48074 ) ( ON ?auto_48064 ?auto_48062 ) ( CLEAR ?auto_48064 ) ( not ( = ?auto_48059 ?auto_48062 ) ) ( not ( = ?auto_48060 ?auto_48062 ) ) ( not ( = ?auto_48082 ?auto_48062 ) ) ( not ( = ?auto_48068 ?auto_48062 ) ) ( not ( = ?auto_48069 ?auto_48062 ) ) ( not ( = ?auto_48079 ?auto_48062 ) ) ( not ( = ?auto_48078 ?auto_48062 ) ) ( not ( = ?auto_48064 ?auto_48062 ) ) ( not ( = ?auto_48071 ?auto_48062 ) ) ( not ( = ?auto_48072 ?auto_48062 ) ) ( SURFACE-AT ?auto_48075 ?auto_48080 ) ( CLEAR ?auto_48075 ) ( IS-CRATE ?auto_48072 ) ( not ( = ?auto_48059 ?auto_48075 ) ) ( not ( = ?auto_48060 ?auto_48075 ) ) ( not ( = ?auto_48082 ?auto_48075 ) ) ( not ( = ?auto_48068 ?auto_48075 ) ) ( not ( = ?auto_48069 ?auto_48075 ) ) ( not ( = ?auto_48079 ?auto_48075 ) ) ( not ( = ?auto_48078 ?auto_48075 ) ) ( not ( = ?auto_48064 ?auto_48075 ) ) ( not ( = ?auto_48071 ?auto_48075 ) ) ( not ( = ?auto_48072 ?auto_48075 ) ) ( not ( = ?auto_48062 ?auto_48075 ) ) ( AVAILABLE ?auto_48065 ) ( AVAILABLE ?auto_48077 ) ( SURFACE-AT ?auto_48072 ?auto_48063 ) ( ON ?auto_48072 ?auto_48073 ) ( CLEAR ?auto_48072 ) ( not ( = ?auto_48059 ?auto_48073 ) ) ( not ( = ?auto_48060 ?auto_48073 ) ) ( not ( = ?auto_48082 ?auto_48073 ) ) ( not ( = ?auto_48068 ?auto_48073 ) ) ( not ( = ?auto_48069 ?auto_48073 ) ) ( not ( = ?auto_48079 ?auto_48073 ) ) ( not ( = ?auto_48078 ?auto_48073 ) ) ( not ( = ?auto_48064 ?auto_48073 ) ) ( not ( = ?auto_48071 ?auto_48073 ) ) ( not ( = ?auto_48072 ?auto_48073 ) ) ( not ( = ?auto_48062 ?auto_48073 ) ) ( not ( = ?auto_48075 ?auto_48073 ) ) ( TRUCK-AT ?auto_48070 ?auto_48080 ) )
    :subtasks
    ( ( !DRIVE ?auto_48070 ?auto_48080 ?auto_48063 )
      ( MAKE-ON ?auto_48059 ?auto_48060 )
      ( MAKE-ON-VERIFY ?auto_48059 ?auto_48060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48085 - SURFACE
      ?auto_48086 - SURFACE
    )
    :vars
    (
      ?auto_48104 - HOIST
      ?auto_48102 - PLACE
      ?auto_48088 - PLACE
      ?auto_48091 - HOIST
      ?auto_48101 - SURFACE
      ?auto_48105 - SURFACE
      ?auto_48107 - PLACE
      ?auto_48099 - HOIST
      ?auto_48098 - SURFACE
      ?auto_48090 - SURFACE
      ?auto_48109 - PLACE
      ?auto_48089 - HOIST
      ?auto_48097 - SURFACE
      ?auto_48103 - SURFACE
      ?auto_48096 - PLACE
      ?auto_48094 - HOIST
      ?auto_48100 - SURFACE
      ?auto_48093 - SURFACE
      ?auto_48092 - PLACE
      ?auto_48095 - HOIST
      ?auto_48110 - SURFACE
      ?auto_48087 - SURFACE
      ?auto_48108 - SURFACE
      ?auto_48106 - TRUCK
      ?auto_48111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48104 ?auto_48102 ) ( IS-CRATE ?auto_48085 ) ( not ( = ?auto_48085 ?auto_48086 ) ) ( not ( = ?auto_48088 ?auto_48102 ) ) ( HOIST-AT ?auto_48091 ?auto_48088 ) ( not ( = ?auto_48104 ?auto_48091 ) ) ( SURFACE-AT ?auto_48085 ?auto_48088 ) ( ON ?auto_48085 ?auto_48101 ) ( CLEAR ?auto_48085 ) ( not ( = ?auto_48085 ?auto_48101 ) ) ( not ( = ?auto_48086 ?auto_48101 ) ) ( IS-CRATE ?auto_48086 ) ( not ( = ?auto_48085 ?auto_48105 ) ) ( not ( = ?auto_48086 ?auto_48105 ) ) ( not ( = ?auto_48101 ?auto_48105 ) ) ( not ( = ?auto_48107 ?auto_48102 ) ) ( not ( = ?auto_48088 ?auto_48107 ) ) ( HOIST-AT ?auto_48099 ?auto_48107 ) ( not ( = ?auto_48104 ?auto_48099 ) ) ( not ( = ?auto_48091 ?auto_48099 ) ) ( AVAILABLE ?auto_48099 ) ( SURFACE-AT ?auto_48086 ?auto_48107 ) ( ON ?auto_48086 ?auto_48098 ) ( CLEAR ?auto_48086 ) ( not ( = ?auto_48085 ?auto_48098 ) ) ( not ( = ?auto_48086 ?auto_48098 ) ) ( not ( = ?auto_48101 ?auto_48098 ) ) ( not ( = ?auto_48105 ?auto_48098 ) ) ( IS-CRATE ?auto_48105 ) ( not ( = ?auto_48085 ?auto_48090 ) ) ( not ( = ?auto_48086 ?auto_48090 ) ) ( not ( = ?auto_48101 ?auto_48090 ) ) ( not ( = ?auto_48105 ?auto_48090 ) ) ( not ( = ?auto_48098 ?auto_48090 ) ) ( not ( = ?auto_48109 ?auto_48102 ) ) ( not ( = ?auto_48088 ?auto_48109 ) ) ( not ( = ?auto_48107 ?auto_48109 ) ) ( HOIST-AT ?auto_48089 ?auto_48109 ) ( not ( = ?auto_48104 ?auto_48089 ) ) ( not ( = ?auto_48091 ?auto_48089 ) ) ( not ( = ?auto_48099 ?auto_48089 ) ) ( AVAILABLE ?auto_48089 ) ( SURFACE-AT ?auto_48105 ?auto_48109 ) ( ON ?auto_48105 ?auto_48097 ) ( CLEAR ?auto_48105 ) ( not ( = ?auto_48085 ?auto_48097 ) ) ( not ( = ?auto_48086 ?auto_48097 ) ) ( not ( = ?auto_48101 ?auto_48097 ) ) ( not ( = ?auto_48105 ?auto_48097 ) ) ( not ( = ?auto_48098 ?auto_48097 ) ) ( not ( = ?auto_48090 ?auto_48097 ) ) ( IS-CRATE ?auto_48090 ) ( not ( = ?auto_48085 ?auto_48103 ) ) ( not ( = ?auto_48086 ?auto_48103 ) ) ( not ( = ?auto_48101 ?auto_48103 ) ) ( not ( = ?auto_48105 ?auto_48103 ) ) ( not ( = ?auto_48098 ?auto_48103 ) ) ( not ( = ?auto_48090 ?auto_48103 ) ) ( not ( = ?auto_48097 ?auto_48103 ) ) ( not ( = ?auto_48096 ?auto_48102 ) ) ( not ( = ?auto_48088 ?auto_48096 ) ) ( not ( = ?auto_48107 ?auto_48096 ) ) ( not ( = ?auto_48109 ?auto_48096 ) ) ( HOIST-AT ?auto_48094 ?auto_48096 ) ( not ( = ?auto_48104 ?auto_48094 ) ) ( not ( = ?auto_48091 ?auto_48094 ) ) ( not ( = ?auto_48099 ?auto_48094 ) ) ( not ( = ?auto_48089 ?auto_48094 ) ) ( AVAILABLE ?auto_48094 ) ( SURFACE-AT ?auto_48090 ?auto_48096 ) ( ON ?auto_48090 ?auto_48100 ) ( CLEAR ?auto_48090 ) ( not ( = ?auto_48085 ?auto_48100 ) ) ( not ( = ?auto_48086 ?auto_48100 ) ) ( not ( = ?auto_48101 ?auto_48100 ) ) ( not ( = ?auto_48105 ?auto_48100 ) ) ( not ( = ?auto_48098 ?auto_48100 ) ) ( not ( = ?auto_48090 ?auto_48100 ) ) ( not ( = ?auto_48097 ?auto_48100 ) ) ( not ( = ?auto_48103 ?auto_48100 ) ) ( IS-CRATE ?auto_48103 ) ( not ( = ?auto_48085 ?auto_48093 ) ) ( not ( = ?auto_48086 ?auto_48093 ) ) ( not ( = ?auto_48101 ?auto_48093 ) ) ( not ( = ?auto_48105 ?auto_48093 ) ) ( not ( = ?auto_48098 ?auto_48093 ) ) ( not ( = ?auto_48090 ?auto_48093 ) ) ( not ( = ?auto_48097 ?auto_48093 ) ) ( not ( = ?auto_48103 ?auto_48093 ) ) ( not ( = ?auto_48100 ?auto_48093 ) ) ( not ( = ?auto_48092 ?auto_48102 ) ) ( not ( = ?auto_48088 ?auto_48092 ) ) ( not ( = ?auto_48107 ?auto_48092 ) ) ( not ( = ?auto_48109 ?auto_48092 ) ) ( not ( = ?auto_48096 ?auto_48092 ) ) ( HOIST-AT ?auto_48095 ?auto_48092 ) ( not ( = ?auto_48104 ?auto_48095 ) ) ( not ( = ?auto_48091 ?auto_48095 ) ) ( not ( = ?auto_48099 ?auto_48095 ) ) ( not ( = ?auto_48089 ?auto_48095 ) ) ( not ( = ?auto_48094 ?auto_48095 ) ) ( AVAILABLE ?auto_48095 ) ( SURFACE-AT ?auto_48103 ?auto_48092 ) ( ON ?auto_48103 ?auto_48110 ) ( CLEAR ?auto_48103 ) ( not ( = ?auto_48085 ?auto_48110 ) ) ( not ( = ?auto_48086 ?auto_48110 ) ) ( not ( = ?auto_48101 ?auto_48110 ) ) ( not ( = ?auto_48105 ?auto_48110 ) ) ( not ( = ?auto_48098 ?auto_48110 ) ) ( not ( = ?auto_48090 ?auto_48110 ) ) ( not ( = ?auto_48097 ?auto_48110 ) ) ( not ( = ?auto_48103 ?auto_48110 ) ) ( not ( = ?auto_48100 ?auto_48110 ) ) ( not ( = ?auto_48093 ?auto_48110 ) ) ( IS-CRATE ?auto_48093 ) ( not ( = ?auto_48085 ?auto_48087 ) ) ( not ( = ?auto_48086 ?auto_48087 ) ) ( not ( = ?auto_48101 ?auto_48087 ) ) ( not ( = ?auto_48105 ?auto_48087 ) ) ( not ( = ?auto_48098 ?auto_48087 ) ) ( not ( = ?auto_48090 ?auto_48087 ) ) ( not ( = ?auto_48097 ?auto_48087 ) ) ( not ( = ?auto_48103 ?auto_48087 ) ) ( not ( = ?auto_48100 ?auto_48087 ) ) ( not ( = ?auto_48093 ?auto_48087 ) ) ( not ( = ?auto_48110 ?auto_48087 ) ) ( AVAILABLE ?auto_48091 ) ( SURFACE-AT ?auto_48093 ?auto_48088 ) ( ON ?auto_48093 ?auto_48108 ) ( CLEAR ?auto_48093 ) ( not ( = ?auto_48085 ?auto_48108 ) ) ( not ( = ?auto_48086 ?auto_48108 ) ) ( not ( = ?auto_48101 ?auto_48108 ) ) ( not ( = ?auto_48105 ?auto_48108 ) ) ( not ( = ?auto_48098 ?auto_48108 ) ) ( not ( = ?auto_48090 ?auto_48108 ) ) ( not ( = ?auto_48097 ?auto_48108 ) ) ( not ( = ?auto_48103 ?auto_48108 ) ) ( not ( = ?auto_48100 ?auto_48108 ) ) ( not ( = ?auto_48093 ?auto_48108 ) ) ( not ( = ?auto_48110 ?auto_48108 ) ) ( not ( = ?auto_48087 ?auto_48108 ) ) ( TRUCK-AT ?auto_48106 ?auto_48102 ) ( SURFACE-AT ?auto_48111 ?auto_48102 ) ( CLEAR ?auto_48111 ) ( LIFTING ?auto_48104 ?auto_48087 ) ( IS-CRATE ?auto_48087 ) ( not ( = ?auto_48085 ?auto_48111 ) ) ( not ( = ?auto_48086 ?auto_48111 ) ) ( not ( = ?auto_48101 ?auto_48111 ) ) ( not ( = ?auto_48105 ?auto_48111 ) ) ( not ( = ?auto_48098 ?auto_48111 ) ) ( not ( = ?auto_48090 ?auto_48111 ) ) ( not ( = ?auto_48097 ?auto_48111 ) ) ( not ( = ?auto_48103 ?auto_48111 ) ) ( not ( = ?auto_48100 ?auto_48111 ) ) ( not ( = ?auto_48093 ?auto_48111 ) ) ( not ( = ?auto_48110 ?auto_48111 ) ) ( not ( = ?auto_48087 ?auto_48111 ) ) ( not ( = ?auto_48108 ?auto_48111 ) ) )
    :subtasks
    ( ( !DROP ?auto_48104 ?auto_48087 ?auto_48111 ?auto_48102 )
      ( MAKE-ON ?auto_48085 ?auto_48086 )
      ( MAKE-ON-VERIFY ?auto_48085 ?auto_48086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48112 - SURFACE
      ?auto_48113 - SURFACE
    )
    :vars
    (
      ?auto_48133 - HOIST
      ?auto_48118 - PLACE
      ?auto_48130 - PLACE
      ?auto_48129 - HOIST
      ?auto_48131 - SURFACE
      ?auto_48134 - SURFACE
      ?auto_48116 - PLACE
      ?auto_48120 - HOIST
      ?auto_48121 - SURFACE
      ?auto_48128 - SURFACE
      ?auto_48114 - PLACE
      ?auto_48125 - HOIST
      ?auto_48127 - SURFACE
      ?auto_48132 - SURFACE
      ?auto_48124 - PLACE
      ?auto_48123 - HOIST
      ?auto_48122 - SURFACE
      ?auto_48119 - SURFACE
      ?auto_48126 - PLACE
      ?auto_48137 - HOIST
      ?auto_48135 - SURFACE
      ?auto_48138 - SURFACE
      ?auto_48115 - SURFACE
      ?auto_48117 - TRUCK
      ?auto_48136 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48133 ?auto_48118 ) ( IS-CRATE ?auto_48112 ) ( not ( = ?auto_48112 ?auto_48113 ) ) ( not ( = ?auto_48130 ?auto_48118 ) ) ( HOIST-AT ?auto_48129 ?auto_48130 ) ( not ( = ?auto_48133 ?auto_48129 ) ) ( SURFACE-AT ?auto_48112 ?auto_48130 ) ( ON ?auto_48112 ?auto_48131 ) ( CLEAR ?auto_48112 ) ( not ( = ?auto_48112 ?auto_48131 ) ) ( not ( = ?auto_48113 ?auto_48131 ) ) ( IS-CRATE ?auto_48113 ) ( not ( = ?auto_48112 ?auto_48134 ) ) ( not ( = ?auto_48113 ?auto_48134 ) ) ( not ( = ?auto_48131 ?auto_48134 ) ) ( not ( = ?auto_48116 ?auto_48118 ) ) ( not ( = ?auto_48130 ?auto_48116 ) ) ( HOIST-AT ?auto_48120 ?auto_48116 ) ( not ( = ?auto_48133 ?auto_48120 ) ) ( not ( = ?auto_48129 ?auto_48120 ) ) ( AVAILABLE ?auto_48120 ) ( SURFACE-AT ?auto_48113 ?auto_48116 ) ( ON ?auto_48113 ?auto_48121 ) ( CLEAR ?auto_48113 ) ( not ( = ?auto_48112 ?auto_48121 ) ) ( not ( = ?auto_48113 ?auto_48121 ) ) ( not ( = ?auto_48131 ?auto_48121 ) ) ( not ( = ?auto_48134 ?auto_48121 ) ) ( IS-CRATE ?auto_48134 ) ( not ( = ?auto_48112 ?auto_48128 ) ) ( not ( = ?auto_48113 ?auto_48128 ) ) ( not ( = ?auto_48131 ?auto_48128 ) ) ( not ( = ?auto_48134 ?auto_48128 ) ) ( not ( = ?auto_48121 ?auto_48128 ) ) ( not ( = ?auto_48114 ?auto_48118 ) ) ( not ( = ?auto_48130 ?auto_48114 ) ) ( not ( = ?auto_48116 ?auto_48114 ) ) ( HOIST-AT ?auto_48125 ?auto_48114 ) ( not ( = ?auto_48133 ?auto_48125 ) ) ( not ( = ?auto_48129 ?auto_48125 ) ) ( not ( = ?auto_48120 ?auto_48125 ) ) ( AVAILABLE ?auto_48125 ) ( SURFACE-AT ?auto_48134 ?auto_48114 ) ( ON ?auto_48134 ?auto_48127 ) ( CLEAR ?auto_48134 ) ( not ( = ?auto_48112 ?auto_48127 ) ) ( not ( = ?auto_48113 ?auto_48127 ) ) ( not ( = ?auto_48131 ?auto_48127 ) ) ( not ( = ?auto_48134 ?auto_48127 ) ) ( not ( = ?auto_48121 ?auto_48127 ) ) ( not ( = ?auto_48128 ?auto_48127 ) ) ( IS-CRATE ?auto_48128 ) ( not ( = ?auto_48112 ?auto_48132 ) ) ( not ( = ?auto_48113 ?auto_48132 ) ) ( not ( = ?auto_48131 ?auto_48132 ) ) ( not ( = ?auto_48134 ?auto_48132 ) ) ( not ( = ?auto_48121 ?auto_48132 ) ) ( not ( = ?auto_48128 ?auto_48132 ) ) ( not ( = ?auto_48127 ?auto_48132 ) ) ( not ( = ?auto_48124 ?auto_48118 ) ) ( not ( = ?auto_48130 ?auto_48124 ) ) ( not ( = ?auto_48116 ?auto_48124 ) ) ( not ( = ?auto_48114 ?auto_48124 ) ) ( HOIST-AT ?auto_48123 ?auto_48124 ) ( not ( = ?auto_48133 ?auto_48123 ) ) ( not ( = ?auto_48129 ?auto_48123 ) ) ( not ( = ?auto_48120 ?auto_48123 ) ) ( not ( = ?auto_48125 ?auto_48123 ) ) ( AVAILABLE ?auto_48123 ) ( SURFACE-AT ?auto_48128 ?auto_48124 ) ( ON ?auto_48128 ?auto_48122 ) ( CLEAR ?auto_48128 ) ( not ( = ?auto_48112 ?auto_48122 ) ) ( not ( = ?auto_48113 ?auto_48122 ) ) ( not ( = ?auto_48131 ?auto_48122 ) ) ( not ( = ?auto_48134 ?auto_48122 ) ) ( not ( = ?auto_48121 ?auto_48122 ) ) ( not ( = ?auto_48128 ?auto_48122 ) ) ( not ( = ?auto_48127 ?auto_48122 ) ) ( not ( = ?auto_48132 ?auto_48122 ) ) ( IS-CRATE ?auto_48132 ) ( not ( = ?auto_48112 ?auto_48119 ) ) ( not ( = ?auto_48113 ?auto_48119 ) ) ( not ( = ?auto_48131 ?auto_48119 ) ) ( not ( = ?auto_48134 ?auto_48119 ) ) ( not ( = ?auto_48121 ?auto_48119 ) ) ( not ( = ?auto_48128 ?auto_48119 ) ) ( not ( = ?auto_48127 ?auto_48119 ) ) ( not ( = ?auto_48132 ?auto_48119 ) ) ( not ( = ?auto_48122 ?auto_48119 ) ) ( not ( = ?auto_48126 ?auto_48118 ) ) ( not ( = ?auto_48130 ?auto_48126 ) ) ( not ( = ?auto_48116 ?auto_48126 ) ) ( not ( = ?auto_48114 ?auto_48126 ) ) ( not ( = ?auto_48124 ?auto_48126 ) ) ( HOIST-AT ?auto_48137 ?auto_48126 ) ( not ( = ?auto_48133 ?auto_48137 ) ) ( not ( = ?auto_48129 ?auto_48137 ) ) ( not ( = ?auto_48120 ?auto_48137 ) ) ( not ( = ?auto_48125 ?auto_48137 ) ) ( not ( = ?auto_48123 ?auto_48137 ) ) ( AVAILABLE ?auto_48137 ) ( SURFACE-AT ?auto_48132 ?auto_48126 ) ( ON ?auto_48132 ?auto_48135 ) ( CLEAR ?auto_48132 ) ( not ( = ?auto_48112 ?auto_48135 ) ) ( not ( = ?auto_48113 ?auto_48135 ) ) ( not ( = ?auto_48131 ?auto_48135 ) ) ( not ( = ?auto_48134 ?auto_48135 ) ) ( not ( = ?auto_48121 ?auto_48135 ) ) ( not ( = ?auto_48128 ?auto_48135 ) ) ( not ( = ?auto_48127 ?auto_48135 ) ) ( not ( = ?auto_48132 ?auto_48135 ) ) ( not ( = ?auto_48122 ?auto_48135 ) ) ( not ( = ?auto_48119 ?auto_48135 ) ) ( IS-CRATE ?auto_48119 ) ( not ( = ?auto_48112 ?auto_48138 ) ) ( not ( = ?auto_48113 ?auto_48138 ) ) ( not ( = ?auto_48131 ?auto_48138 ) ) ( not ( = ?auto_48134 ?auto_48138 ) ) ( not ( = ?auto_48121 ?auto_48138 ) ) ( not ( = ?auto_48128 ?auto_48138 ) ) ( not ( = ?auto_48127 ?auto_48138 ) ) ( not ( = ?auto_48132 ?auto_48138 ) ) ( not ( = ?auto_48122 ?auto_48138 ) ) ( not ( = ?auto_48119 ?auto_48138 ) ) ( not ( = ?auto_48135 ?auto_48138 ) ) ( AVAILABLE ?auto_48129 ) ( SURFACE-AT ?auto_48119 ?auto_48130 ) ( ON ?auto_48119 ?auto_48115 ) ( CLEAR ?auto_48119 ) ( not ( = ?auto_48112 ?auto_48115 ) ) ( not ( = ?auto_48113 ?auto_48115 ) ) ( not ( = ?auto_48131 ?auto_48115 ) ) ( not ( = ?auto_48134 ?auto_48115 ) ) ( not ( = ?auto_48121 ?auto_48115 ) ) ( not ( = ?auto_48128 ?auto_48115 ) ) ( not ( = ?auto_48127 ?auto_48115 ) ) ( not ( = ?auto_48132 ?auto_48115 ) ) ( not ( = ?auto_48122 ?auto_48115 ) ) ( not ( = ?auto_48119 ?auto_48115 ) ) ( not ( = ?auto_48135 ?auto_48115 ) ) ( not ( = ?auto_48138 ?auto_48115 ) ) ( TRUCK-AT ?auto_48117 ?auto_48118 ) ( SURFACE-AT ?auto_48136 ?auto_48118 ) ( CLEAR ?auto_48136 ) ( IS-CRATE ?auto_48138 ) ( not ( = ?auto_48112 ?auto_48136 ) ) ( not ( = ?auto_48113 ?auto_48136 ) ) ( not ( = ?auto_48131 ?auto_48136 ) ) ( not ( = ?auto_48134 ?auto_48136 ) ) ( not ( = ?auto_48121 ?auto_48136 ) ) ( not ( = ?auto_48128 ?auto_48136 ) ) ( not ( = ?auto_48127 ?auto_48136 ) ) ( not ( = ?auto_48132 ?auto_48136 ) ) ( not ( = ?auto_48122 ?auto_48136 ) ) ( not ( = ?auto_48119 ?auto_48136 ) ) ( not ( = ?auto_48135 ?auto_48136 ) ) ( not ( = ?auto_48138 ?auto_48136 ) ) ( not ( = ?auto_48115 ?auto_48136 ) ) ( AVAILABLE ?auto_48133 ) ( IN ?auto_48138 ?auto_48117 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48133 ?auto_48138 ?auto_48117 ?auto_48118 )
      ( MAKE-ON ?auto_48112 ?auto_48113 )
      ( MAKE-ON-VERIFY ?auto_48112 ?auto_48113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48139 - SURFACE
      ?auto_48140 - SURFACE
    )
    :vars
    (
      ?auto_48158 - HOIST
      ?auto_48163 - PLACE
      ?auto_48155 - PLACE
      ?auto_48162 - HOIST
      ?auto_48156 - SURFACE
      ?auto_48159 - SURFACE
      ?auto_48146 - PLACE
      ?auto_48150 - HOIST
      ?auto_48153 - SURFACE
      ?auto_48145 - SURFACE
      ?auto_48141 - PLACE
      ?auto_48144 - HOIST
      ?auto_48148 - SURFACE
      ?auto_48157 - SURFACE
      ?auto_48142 - PLACE
      ?auto_48143 - HOIST
      ?auto_48164 - SURFACE
      ?auto_48151 - SURFACE
      ?auto_48152 - PLACE
      ?auto_48147 - HOIST
      ?auto_48160 - SURFACE
      ?auto_48154 - SURFACE
      ?auto_48149 - SURFACE
      ?auto_48161 - SURFACE
      ?auto_48165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48158 ?auto_48163 ) ( IS-CRATE ?auto_48139 ) ( not ( = ?auto_48139 ?auto_48140 ) ) ( not ( = ?auto_48155 ?auto_48163 ) ) ( HOIST-AT ?auto_48162 ?auto_48155 ) ( not ( = ?auto_48158 ?auto_48162 ) ) ( SURFACE-AT ?auto_48139 ?auto_48155 ) ( ON ?auto_48139 ?auto_48156 ) ( CLEAR ?auto_48139 ) ( not ( = ?auto_48139 ?auto_48156 ) ) ( not ( = ?auto_48140 ?auto_48156 ) ) ( IS-CRATE ?auto_48140 ) ( not ( = ?auto_48139 ?auto_48159 ) ) ( not ( = ?auto_48140 ?auto_48159 ) ) ( not ( = ?auto_48156 ?auto_48159 ) ) ( not ( = ?auto_48146 ?auto_48163 ) ) ( not ( = ?auto_48155 ?auto_48146 ) ) ( HOIST-AT ?auto_48150 ?auto_48146 ) ( not ( = ?auto_48158 ?auto_48150 ) ) ( not ( = ?auto_48162 ?auto_48150 ) ) ( AVAILABLE ?auto_48150 ) ( SURFACE-AT ?auto_48140 ?auto_48146 ) ( ON ?auto_48140 ?auto_48153 ) ( CLEAR ?auto_48140 ) ( not ( = ?auto_48139 ?auto_48153 ) ) ( not ( = ?auto_48140 ?auto_48153 ) ) ( not ( = ?auto_48156 ?auto_48153 ) ) ( not ( = ?auto_48159 ?auto_48153 ) ) ( IS-CRATE ?auto_48159 ) ( not ( = ?auto_48139 ?auto_48145 ) ) ( not ( = ?auto_48140 ?auto_48145 ) ) ( not ( = ?auto_48156 ?auto_48145 ) ) ( not ( = ?auto_48159 ?auto_48145 ) ) ( not ( = ?auto_48153 ?auto_48145 ) ) ( not ( = ?auto_48141 ?auto_48163 ) ) ( not ( = ?auto_48155 ?auto_48141 ) ) ( not ( = ?auto_48146 ?auto_48141 ) ) ( HOIST-AT ?auto_48144 ?auto_48141 ) ( not ( = ?auto_48158 ?auto_48144 ) ) ( not ( = ?auto_48162 ?auto_48144 ) ) ( not ( = ?auto_48150 ?auto_48144 ) ) ( AVAILABLE ?auto_48144 ) ( SURFACE-AT ?auto_48159 ?auto_48141 ) ( ON ?auto_48159 ?auto_48148 ) ( CLEAR ?auto_48159 ) ( not ( = ?auto_48139 ?auto_48148 ) ) ( not ( = ?auto_48140 ?auto_48148 ) ) ( not ( = ?auto_48156 ?auto_48148 ) ) ( not ( = ?auto_48159 ?auto_48148 ) ) ( not ( = ?auto_48153 ?auto_48148 ) ) ( not ( = ?auto_48145 ?auto_48148 ) ) ( IS-CRATE ?auto_48145 ) ( not ( = ?auto_48139 ?auto_48157 ) ) ( not ( = ?auto_48140 ?auto_48157 ) ) ( not ( = ?auto_48156 ?auto_48157 ) ) ( not ( = ?auto_48159 ?auto_48157 ) ) ( not ( = ?auto_48153 ?auto_48157 ) ) ( not ( = ?auto_48145 ?auto_48157 ) ) ( not ( = ?auto_48148 ?auto_48157 ) ) ( not ( = ?auto_48142 ?auto_48163 ) ) ( not ( = ?auto_48155 ?auto_48142 ) ) ( not ( = ?auto_48146 ?auto_48142 ) ) ( not ( = ?auto_48141 ?auto_48142 ) ) ( HOIST-AT ?auto_48143 ?auto_48142 ) ( not ( = ?auto_48158 ?auto_48143 ) ) ( not ( = ?auto_48162 ?auto_48143 ) ) ( not ( = ?auto_48150 ?auto_48143 ) ) ( not ( = ?auto_48144 ?auto_48143 ) ) ( AVAILABLE ?auto_48143 ) ( SURFACE-AT ?auto_48145 ?auto_48142 ) ( ON ?auto_48145 ?auto_48164 ) ( CLEAR ?auto_48145 ) ( not ( = ?auto_48139 ?auto_48164 ) ) ( not ( = ?auto_48140 ?auto_48164 ) ) ( not ( = ?auto_48156 ?auto_48164 ) ) ( not ( = ?auto_48159 ?auto_48164 ) ) ( not ( = ?auto_48153 ?auto_48164 ) ) ( not ( = ?auto_48145 ?auto_48164 ) ) ( not ( = ?auto_48148 ?auto_48164 ) ) ( not ( = ?auto_48157 ?auto_48164 ) ) ( IS-CRATE ?auto_48157 ) ( not ( = ?auto_48139 ?auto_48151 ) ) ( not ( = ?auto_48140 ?auto_48151 ) ) ( not ( = ?auto_48156 ?auto_48151 ) ) ( not ( = ?auto_48159 ?auto_48151 ) ) ( not ( = ?auto_48153 ?auto_48151 ) ) ( not ( = ?auto_48145 ?auto_48151 ) ) ( not ( = ?auto_48148 ?auto_48151 ) ) ( not ( = ?auto_48157 ?auto_48151 ) ) ( not ( = ?auto_48164 ?auto_48151 ) ) ( not ( = ?auto_48152 ?auto_48163 ) ) ( not ( = ?auto_48155 ?auto_48152 ) ) ( not ( = ?auto_48146 ?auto_48152 ) ) ( not ( = ?auto_48141 ?auto_48152 ) ) ( not ( = ?auto_48142 ?auto_48152 ) ) ( HOIST-AT ?auto_48147 ?auto_48152 ) ( not ( = ?auto_48158 ?auto_48147 ) ) ( not ( = ?auto_48162 ?auto_48147 ) ) ( not ( = ?auto_48150 ?auto_48147 ) ) ( not ( = ?auto_48144 ?auto_48147 ) ) ( not ( = ?auto_48143 ?auto_48147 ) ) ( AVAILABLE ?auto_48147 ) ( SURFACE-AT ?auto_48157 ?auto_48152 ) ( ON ?auto_48157 ?auto_48160 ) ( CLEAR ?auto_48157 ) ( not ( = ?auto_48139 ?auto_48160 ) ) ( not ( = ?auto_48140 ?auto_48160 ) ) ( not ( = ?auto_48156 ?auto_48160 ) ) ( not ( = ?auto_48159 ?auto_48160 ) ) ( not ( = ?auto_48153 ?auto_48160 ) ) ( not ( = ?auto_48145 ?auto_48160 ) ) ( not ( = ?auto_48148 ?auto_48160 ) ) ( not ( = ?auto_48157 ?auto_48160 ) ) ( not ( = ?auto_48164 ?auto_48160 ) ) ( not ( = ?auto_48151 ?auto_48160 ) ) ( IS-CRATE ?auto_48151 ) ( not ( = ?auto_48139 ?auto_48154 ) ) ( not ( = ?auto_48140 ?auto_48154 ) ) ( not ( = ?auto_48156 ?auto_48154 ) ) ( not ( = ?auto_48159 ?auto_48154 ) ) ( not ( = ?auto_48153 ?auto_48154 ) ) ( not ( = ?auto_48145 ?auto_48154 ) ) ( not ( = ?auto_48148 ?auto_48154 ) ) ( not ( = ?auto_48157 ?auto_48154 ) ) ( not ( = ?auto_48164 ?auto_48154 ) ) ( not ( = ?auto_48151 ?auto_48154 ) ) ( not ( = ?auto_48160 ?auto_48154 ) ) ( AVAILABLE ?auto_48162 ) ( SURFACE-AT ?auto_48151 ?auto_48155 ) ( ON ?auto_48151 ?auto_48149 ) ( CLEAR ?auto_48151 ) ( not ( = ?auto_48139 ?auto_48149 ) ) ( not ( = ?auto_48140 ?auto_48149 ) ) ( not ( = ?auto_48156 ?auto_48149 ) ) ( not ( = ?auto_48159 ?auto_48149 ) ) ( not ( = ?auto_48153 ?auto_48149 ) ) ( not ( = ?auto_48145 ?auto_48149 ) ) ( not ( = ?auto_48148 ?auto_48149 ) ) ( not ( = ?auto_48157 ?auto_48149 ) ) ( not ( = ?auto_48164 ?auto_48149 ) ) ( not ( = ?auto_48151 ?auto_48149 ) ) ( not ( = ?auto_48160 ?auto_48149 ) ) ( not ( = ?auto_48154 ?auto_48149 ) ) ( SURFACE-AT ?auto_48161 ?auto_48163 ) ( CLEAR ?auto_48161 ) ( IS-CRATE ?auto_48154 ) ( not ( = ?auto_48139 ?auto_48161 ) ) ( not ( = ?auto_48140 ?auto_48161 ) ) ( not ( = ?auto_48156 ?auto_48161 ) ) ( not ( = ?auto_48159 ?auto_48161 ) ) ( not ( = ?auto_48153 ?auto_48161 ) ) ( not ( = ?auto_48145 ?auto_48161 ) ) ( not ( = ?auto_48148 ?auto_48161 ) ) ( not ( = ?auto_48157 ?auto_48161 ) ) ( not ( = ?auto_48164 ?auto_48161 ) ) ( not ( = ?auto_48151 ?auto_48161 ) ) ( not ( = ?auto_48160 ?auto_48161 ) ) ( not ( = ?auto_48154 ?auto_48161 ) ) ( not ( = ?auto_48149 ?auto_48161 ) ) ( AVAILABLE ?auto_48158 ) ( IN ?auto_48154 ?auto_48165 ) ( TRUCK-AT ?auto_48165 ?auto_48142 ) )
    :subtasks
    ( ( !DRIVE ?auto_48165 ?auto_48142 ?auto_48163 )
      ( MAKE-ON ?auto_48139 ?auto_48140 )
      ( MAKE-ON-VERIFY ?auto_48139 ?auto_48140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48166 - SURFACE
      ?auto_48167 - SURFACE
    )
    :vars
    (
      ?auto_48185 - HOIST
      ?auto_48173 - PLACE
      ?auto_48168 - PLACE
      ?auto_48172 - HOIST
      ?auto_48174 - SURFACE
      ?auto_48186 - SURFACE
      ?auto_48189 - PLACE
      ?auto_48179 - HOIST
      ?auto_48181 - SURFACE
      ?auto_48170 - SURFACE
      ?auto_48175 - PLACE
      ?auto_48182 - HOIST
      ?auto_48176 - SURFACE
      ?auto_48184 - SURFACE
      ?auto_48183 - PLACE
      ?auto_48180 - HOIST
      ?auto_48178 - SURFACE
      ?auto_48192 - SURFACE
      ?auto_48191 - PLACE
      ?auto_48171 - HOIST
      ?auto_48187 - SURFACE
      ?auto_48177 - SURFACE
      ?auto_48190 - SURFACE
      ?auto_48188 - SURFACE
      ?auto_48169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48185 ?auto_48173 ) ( IS-CRATE ?auto_48166 ) ( not ( = ?auto_48166 ?auto_48167 ) ) ( not ( = ?auto_48168 ?auto_48173 ) ) ( HOIST-AT ?auto_48172 ?auto_48168 ) ( not ( = ?auto_48185 ?auto_48172 ) ) ( SURFACE-AT ?auto_48166 ?auto_48168 ) ( ON ?auto_48166 ?auto_48174 ) ( CLEAR ?auto_48166 ) ( not ( = ?auto_48166 ?auto_48174 ) ) ( not ( = ?auto_48167 ?auto_48174 ) ) ( IS-CRATE ?auto_48167 ) ( not ( = ?auto_48166 ?auto_48186 ) ) ( not ( = ?auto_48167 ?auto_48186 ) ) ( not ( = ?auto_48174 ?auto_48186 ) ) ( not ( = ?auto_48189 ?auto_48173 ) ) ( not ( = ?auto_48168 ?auto_48189 ) ) ( HOIST-AT ?auto_48179 ?auto_48189 ) ( not ( = ?auto_48185 ?auto_48179 ) ) ( not ( = ?auto_48172 ?auto_48179 ) ) ( AVAILABLE ?auto_48179 ) ( SURFACE-AT ?auto_48167 ?auto_48189 ) ( ON ?auto_48167 ?auto_48181 ) ( CLEAR ?auto_48167 ) ( not ( = ?auto_48166 ?auto_48181 ) ) ( not ( = ?auto_48167 ?auto_48181 ) ) ( not ( = ?auto_48174 ?auto_48181 ) ) ( not ( = ?auto_48186 ?auto_48181 ) ) ( IS-CRATE ?auto_48186 ) ( not ( = ?auto_48166 ?auto_48170 ) ) ( not ( = ?auto_48167 ?auto_48170 ) ) ( not ( = ?auto_48174 ?auto_48170 ) ) ( not ( = ?auto_48186 ?auto_48170 ) ) ( not ( = ?auto_48181 ?auto_48170 ) ) ( not ( = ?auto_48175 ?auto_48173 ) ) ( not ( = ?auto_48168 ?auto_48175 ) ) ( not ( = ?auto_48189 ?auto_48175 ) ) ( HOIST-AT ?auto_48182 ?auto_48175 ) ( not ( = ?auto_48185 ?auto_48182 ) ) ( not ( = ?auto_48172 ?auto_48182 ) ) ( not ( = ?auto_48179 ?auto_48182 ) ) ( AVAILABLE ?auto_48182 ) ( SURFACE-AT ?auto_48186 ?auto_48175 ) ( ON ?auto_48186 ?auto_48176 ) ( CLEAR ?auto_48186 ) ( not ( = ?auto_48166 ?auto_48176 ) ) ( not ( = ?auto_48167 ?auto_48176 ) ) ( not ( = ?auto_48174 ?auto_48176 ) ) ( not ( = ?auto_48186 ?auto_48176 ) ) ( not ( = ?auto_48181 ?auto_48176 ) ) ( not ( = ?auto_48170 ?auto_48176 ) ) ( IS-CRATE ?auto_48170 ) ( not ( = ?auto_48166 ?auto_48184 ) ) ( not ( = ?auto_48167 ?auto_48184 ) ) ( not ( = ?auto_48174 ?auto_48184 ) ) ( not ( = ?auto_48186 ?auto_48184 ) ) ( not ( = ?auto_48181 ?auto_48184 ) ) ( not ( = ?auto_48170 ?auto_48184 ) ) ( not ( = ?auto_48176 ?auto_48184 ) ) ( not ( = ?auto_48183 ?auto_48173 ) ) ( not ( = ?auto_48168 ?auto_48183 ) ) ( not ( = ?auto_48189 ?auto_48183 ) ) ( not ( = ?auto_48175 ?auto_48183 ) ) ( HOIST-AT ?auto_48180 ?auto_48183 ) ( not ( = ?auto_48185 ?auto_48180 ) ) ( not ( = ?auto_48172 ?auto_48180 ) ) ( not ( = ?auto_48179 ?auto_48180 ) ) ( not ( = ?auto_48182 ?auto_48180 ) ) ( SURFACE-AT ?auto_48170 ?auto_48183 ) ( ON ?auto_48170 ?auto_48178 ) ( CLEAR ?auto_48170 ) ( not ( = ?auto_48166 ?auto_48178 ) ) ( not ( = ?auto_48167 ?auto_48178 ) ) ( not ( = ?auto_48174 ?auto_48178 ) ) ( not ( = ?auto_48186 ?auto_48178 ) ) ( not ( = ?auto_48181 ?auto_48178 ) ) ( not ( = ?auto_48170 ?auto_48178 ) ) ( not ( = ?auto_48176 ?auto_48178 ) ) ( not ( = ?auto_48184 ?auto_48178 ) ) ( IS-CRATE ?auto_48184 ) ( not ( = ?auto_48166 ?auto_48192 ) ) ( not ( = ?auto_48167 ?auto_48192 ) ) ( not ( = ?auto_48174 ?auto_48192 ) ) ( not ( = ?auto_48186 ?auto_48192 ) ) ( not ( = ?auto_48181 ?auto_48192 ) ) ( not ( = ?auto_48170 ?auto_48192 ) ) ( not ( = ?auto_48176 ?auto_48192 ) ) ( not ( = ?auto_48184 ?auto_48192 ) ) ( not ( = ?auto_48178 ?auto_48192 ) ) ( not ( = ?auto_48191 ?auto_48173 ) ) ( not ( = ?auto_48168 ?auto_48191 ) ) ( not ( = ?auto_48189 ?auto_48191 ) ) ( not ( = ?auto_48175 ?auto_48191 ) ) ( not ( = ?auto_48183 ?auto_48191 ) ) ( HOIST-AT ?auto_48171 ?auto_48191 ) ( not ( = ?auto_48185 ?auto_48171 ) ) ( not ( = ?auto_48172 ?auto_48171 ) ) ( not ( = ?auto_48179 ?auto_48171 ) ) ( not ( = ?auto_48182 ?auto_48171 ) ) ( not ( = ?auto_48180 ?auto_48171 ) ) ( AVAILABLE ?auto_48171 ) ( SURFACE-AT ?auto_48184 ?auto_48191 ) ( ON ?auto_48184 ?auto_48187 ) ( CLEAR ?auto_48184 ) ( not ( = ?auto_48166 ?auto_48187 ) ) ( not ( = ?auto_48167 ?auto_48187 ) ) ( not ( = ?auto_48174 ?auto_48187 ) ) ( not ( = ?auto_48186 ?auto_48187 ) ) ( not ( = ?auto_48181 ?auto_48187 ) ) ( not ( = ?auto_48170 ?auto_48187 ) ) ( not ( = ?auto_48176 ?auto_48187 ) ) ( not ( = ?auto_48184 ?auto_48187 ) ) ( not ( = ?auto_48178 ?auto_48187 ) ) ( not ( = ?auto_48192 ?auto_48187 ) ) ( IS-CRATE ?auto_48192 ) ( not ( = ?auto_48166 ?auto_48177 ) ) ( not ( = ?auto_48167 ?auto_48177 ) ) ( not ( = ?auto_48174 ?auto_48177 ) ) ( not ( = ?auto_48186 ?auto_48177 ) ) ( not ( = ?auto_48181 ?auto_48177 ) ) ( not ( = ?auto_48170 ?auto_48177 ) ) ( not ( = ?auto_48176 ?auto_48177 ) ) ( not ( = ?auto_48184 ?auto_48177 ) ) ( not ( = ?auto_48178 ?auto_48177 ) ) ( not ( = ?auto_48192 ?auto_48177 ) ) ( not ( = ?auto_48187 ?auto_48177 ) ) ( AVAILABLE ?auto_48172 ) ( SURFACE-AT ?auto_48192 ?auto_48168 ) ( ON ?auto_48192 ?auto_48190 ) ( CLEAR ?auto_48192 ) ( not ( = ?auto_48166 ?auto_48190 ) ) ( not ( = ?auto_48167 ?auto_48190 ) ) ( not ( = ?auto_48174 ?auto_48190 ) ) ( not ( = ?auto_48186 ?auto_48190 ) ) ( not ( = ?auto_48181 ?auto_48190 ) ) ( not ( = ?auto_48170 ?auto_48190 ) ) ( not ( = ?auto_48176 ?auto_48190 ) ) ( not ( = ?auto_48184 ?auto_48190 ) ) ( not ( = ?auto_48178 ?auto_48190 ) ) ( not ( = ?auto_48192 ?auto_48190 ) ) ( not ( = ?auto_48187 ?auto_48190 ) ) ( not ( = ?auto_48177 ?auto_48190 ) ) ( SURFACE-AT ?auto_48188 ?auto_48173 ) ( CLEAR ?auto_48188 ) ( IS-CRATE ?auto_48177 ) ( not ( = ?auto_48166 ?auto_48188 ) ) ( not ( = ?auto_48167 ?auto_48188 ) ) ( not ( = ?auto_48174 ?auto_48188 ) ) ( not ( = ?auto_48186 ?auto_48188 ) ) ( not ( = ?auto_48181 ?auto_48188 ) ) ( not ( = ?auto_48170 ?auto_48188 ) ) ( not ( = ?auto_48176 ?auto_48188 ) ) ( not ( = ?auto_48184 ?auto_48188 ) ) ( not ( = ?auto_48178 ?auto_48188 ) ) ( not ( = ?auto_48192 ?auto_48188 ) ) ( not ( = ?auto_48187 ?auto_48188 ) ) ( not ( = ?auto_48177 ?auto_48188 ) ) ( not ( = ?auto_48190 ?auto_48188 ) ) ( AVAILABLE ?auto_48185 ) ( TRUCK-AT ?auto_48169 ?auto_48183 ) ( LIFTING ?auto_48180 ?auto_48177 ) )
    :subtasks
    ( ( !LOAD ?auto_48180 ?auto_48177 ?auto_48169 ?auto_48183 )
      ( MAKE-ON ?auto_48166 ?auto_48167 )
      ( MAKE-ON-VERIFY ?auto_48166 ?auto_48167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48193 - SURFACE
      ?auto_48194 - SURFACE
    )
    :vars
    (
      ?auto_48215 - HOIST
      ?auto_48204 - PLACE
      ?auto_48200 - PLACE
      ?auto_48207 - HOIST
      ?auto_48217 - SURFACE
      ?auto_48212 - SURFACE
      ?auto_48214 - PLACE
      ?auto_48206 - HOIST
      ?auto_48208 - SURFACE
      ?auto_48201 - SURFACE
      ?auto_48196 - PLACE
      ?auto_48199 - HOIST
      ?auto_48218 - SURFACE
      ?auto_48202 - SURFACE
      ?auto_48213 - PLACE
      ?auto_48210 - HOIST
      ?auto_48198 - SURFACE
      ?auto_48195 - SURFACE
      ?auto_48197 - PLACE
      ?auto_48209 - HOIST
      ?auto_48216 - SURFACE
      ?auto_48211 - SURFACE
      ?auto_48219 - SURFACE
      ?auto_48203 - SURFACE
      ?auto_48205 - TRUCK
      ?auto_48220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48215 ?auto_48204 ) ( IS-CRATE ?auto_48193 ) ( not ( = ?auto_48193 ?auto_48194 ) ) ( not ( = ?auto_48200 ?auto_48204 ) ) ( HOIST-AT ?auto_48207 ?auto_48200 ) ( not ( = ?auto_48215 ?auto_48207 ) ) ( SURFACE-AT ?auto_48193 ?auto_48200 ) ( ON ?auto_48193 ?auto_48217 ) ( CLEAR ?auto_48193 ) ( not ( = ?auto_48193 ?auto_48217 ) ) ( not ( = ?auto_48194 ?auto_48217 ) ) ( IS-CRATE ?auto_48194 ) ( not ( = ?auto_48193 ?auto_48212 ) ) ( not ( = ?auto_48194 ?auto_48212 ) ) ( not ( = ?auto_48217 ?auto_48212 ) ) ( not ( = ?auto_48214 ?auto_48204 ) ) ( not ( = ?auto_48200 ?auto_48214 ) ) ( HOIST-AT ?auto_48206 ?auto_48214 ) ( not ( = ?auto_48215 ?auto_48206 ) ) ( not ( = ?auto_48207 ?auto_48206 ) ) ( AVAILABLE ?auto_48206 ) ( SURFACE-AT ?auto_48194 ?auto_48214 ) ( ON ?auto_48194 ?auto_48208 ) ( CLEAR ?auto_48194 ) ( not ( = ?auto_48193 ?auto_48208 ) ) ( not ( = ?auto_48194 ?auto_48208 ) ) ( not ( = ?auto_48217 ?auto_48208 ) ) ( not ( = ?auto_48212 ?auto_48208 ) ) ( IS-CRATE ?auto_48212 ) ( not ( = ?auto_48193 ?auto_48201 ) ) ( not ( = ?auto_48194 ?auto_48201 ) ) ( not ( = ?auto_48217 ?auto_48201 ) ) ( not ( = ?auto_48212 ?auto_48201 ) ) ( not ( = ?auto_48208 ?auto_48201 ) ) ( not ( = ?auto_48196 ?auto_48204 ) ) ( not ( = ?auto_48200 ?auto_48196 ) ) ( not ( = ?auto_48214 ?auto_48196 ) ) ( HOIST-AT ?auto_48199 ?auto_48196 ) ( not ( = ?auto_48215 ?auto_48199 ) ) ( not ( = ?auto_48207 ?auto_48199 ) ) ( not ( = ?auto_48206 ?auto_48199 ) ) ( AVAILABLE ?auto_48199 ) ( SURFACE-AT ?auto_48212 ?auto_48196 ) ( ON ?auto_48212 ?auto_48218 ) ( CLEAR ?auto_48212 ) ( not ( = ?auto_48193 ?auto_48218 ) ) ( not ( = ?auto_48194 ?auto_48218 ) ) ( not ( = ?auto_48217 ?auto_48218 ) ) ( not ( = ?auto_48212 ?auto_48218 ) ) ( not ( = ?auto_48208 ?auto_48218 ) ) ( not ( = ?auto_48201 ?auto_48218 ) ) ( IS-CRATE ?auto_48201 ) ( not ( = ?auto_48193 ?auto_48202 ) ) ( not ( = ?auto_48194 ?auto_48202 ) ) ( not ( = ?auto_48217 ?auto_48202 ) ) ( not ( = ?auto_48212 ?auto_48202 ) ) ( not ( = ?auto_48208 ?auto_48202 ) ) ( not ( = ?auto_48201 ?auto_48202 ) ) ( not ( = ?auto_48218 ?auto_48202 ) ) ( not ( = ?auto_48213 ?auto_48204 ) ) ( not ( = ?auto_48200 ?auto_48213 ) ) ( not ( = ?auto_48214 ?auto_48213 ) ) ( not ( = ?auto_48196 ?auto_48213 ) ) ( HOIST-AT ?auto_48210 ?auto_48213 ) ( not ( = ?auto_48215 ?auto_48210 ) ) ( not ( = ?auto_48207 ?auto_48210 ) ) ( not ( = ?auto_48206 ?auto_48210 ) ) ( not ( = ?auto_48199 ?auto_48210 ) ) ( SURFACE-AT ?auto_48201 ?auto_48213 ) ( ON ?auto_48201 ?auto_48198 ) ( CLEAR ?auto_48201 ) ( not ( = ?auto_48193 ?auto_48198 ) ) ( not ( = ?auto_48194 ?auto_48198 ) ) ( not ( = ?auto_48217 ?auto_48198 ) ) ( not ( = ?auto_48212 ?auto_48198 ) ) ( not ( = ?auto_48208 ?auto_48198 ) ) ( not ( = ?auto_48201 ?auto_48198 ) ) ( not ( = ?auto_48218 ?auto_48198 ) ) ( not ( = ?auto_48202 ?auto_48198 ) ) ( IS-CRATE ?auto_48202 ) ( not ( = ?auto_48193 ?auto_48195 ) ) ( not ( = ?auto_48194 ?auto_48195 ) ) ( not ( = ?auto_48217 ?auto_48195 ) ) ( not ( = ?auto_48212 ?auto_48195 ) ) ( not ( = ?auto_48208 ?auto_48195 ) ) ( not ( = ?auto_48201 ?auto_48195 ) ) ( not ( = ?auto_48218 ?auto_48195 ) ) ( not ( = ?auto_48202 ?auto_48195 ) ) ( not ( = ?auto_48198 ?auto_48195 ) ) ( not ( = ?auto_48197 ?auto_48204 ) ) ( not ( = ?auto_48200 ?auto_48197 ) ) ( not ( = ?auto_48214 ?auto_48197 ) ) ( not ( = ?auto_48196 ?auto_48197 ) ) ( not ( = ?auto_48213 ?auto_48197 ) ) ( HOIST-AT ?auto_48209 ?auto_48197 ) ( not ( = ?auto_48215 ?auto_48209 ) ) ( not ( = ?auto_48207 ?auto_48209 ) ) ( not ( = ?auto_48206 ?auto_48209 ) ) ( not ( = ?auto_48199 ?auto_48209 ) ) ( not ( = ?auto_48210 ?auto_48209 ) ) ( AVAILABLE ?auto_48209 ) ( SURFACE-AT ?auto_48202 ?auto_48197 ) ( ON ?auto_48202 ?auto_48216 ) ( CLEAR ?auto_48202 ) ( not ( = ?auto_48193 ?auto_48216 ) ) ( not ( = ?auto_48194 ?auto_48216 ) ) ( not ( = ?auto_48217 ?auto_48216 ) ) ( not ( = ?auto_48212 ?auto_48216 ) ) ( not ( = ?auto_48208 ?auto_48216 ) ) ( not ( = ?auto_48201 ?auto_48216 ) ) ( not ( = ?auto_48218 ?auto_48216 ) ) ( not ( = ?auto_48202 ?auto_48216 ) ) ( not ( = ?auto_48198 ?auto_48216 ) ) ( not ( = ?auto_48195 ?auto_48216 ) ) ( IS-CRATE ?auto_48195 ) ( not ( = ?auto_48193 ?auto_48211 ) ) ( not ( = ?auto_48194 ?auto_48211 ) ) ( not ( = ?auto_48217 ?auto_48211 ) ) ( not ( = ?auto_48212 ?auto_48211 ) ) ( not ( = ?auto_48208 ?auto_48211 ) ) ( not ( = ?auto_48201 ?auto_48211 ) ) ( not ( = ?auto_48218 ?auto_48211 ) ) ( not ( = ?auto_48202 ?auto_48211 ) ) ( not ( = ?auto_48198 ?auto_48211 ) ) ( not ( = ?auto_48195 ?auto_48211 ) ) ( not ( = ?auto_48216 ?auto_48211 ) ) ( AVAILABLE ?auto_48207 ) ( SURFACE-AT ?auto_48195 ?auto_48200 ) ( ON ?auto_48195 ?auto_48219 ) ( CLEAR ?auto_48195 ) ( not ( = ?auto_48193 ?auto_48219 ) ) ( not ( = ?auto_48194 ?auto_48219 ) ) ( not ( = ?auto_48217 ?auto_48219 ) ) ( not ( = ?auto_48212 ?auto_48219 ) ) ( not ( = ?auto_48208 ?auto_48219 ) ) ( not ( = ?auto_48201 ?auto_48219 ) ) ( not ( = ?auto_48218 ?auto_48219 ) ) ( not ( = ?auto_48202 ?auto_48219 ) ) ( not ( = ?auto_48198 ?auto_48219 ) ) ( not ( = ?auto_48195 ?auto_48219 ) ) ( not ( = ?auto_48216 ?auto_48219 ) ) ( not ( = ?auto_48211 ?auto_48219 ) ) ( SURFACE-AT ?auto_48203 ?auto_48204 ) ( CLEAR ?auto_48203 ) ( IS-CRATE ?auto_48211 ) ( not ( = ?auto_48193 ?auto_48203 ) ) ( not ( = ?auto_48194 ?auto_48203 ) ) ( not ( = ?auto_48217 ?auto_48203 ) ) ( not ( = ?auto_48212 ?auto_48203 ) ) ( not ( = ?auto_48208 ?auto_48203 ) ) ( not ( = ?auto_48201 ?auto_48203 ) ) ( not ( = ?auto_48218 ?auto_48203 ) ) ( not ( = ?auto_48202 ?auto_48203 ) ) ( not ( = ?auto_48198 ?auto_48203 ) ) ( not ( = ?auto_48195 ?auto_48203 ) ) ( not ( = ?auto_48216 ?auto_48203 ) ) ( not ( = ?auto_48211 ?auto_48203 ) ) ( not ( = ?auto_48219 ?auto_48203 ) ) ( AVAILABLE ?auto_48215 ) ( TRUCK-AT ?auto_48205 ?auto_48213 ) ( AVAILABLE ?auto_48210 ) ( SURFACE-AT ?auto_48211 ?auto_48213 ) ( ON ?auto_48211 ?auto_48220 ) ( CLEAR ?auto_48211 ) ( not ( = ?auto_48193 ?auto_48220 ) ) ( not ( = ?auto_48194 ?auto_48220 ) ) ( not ( = ?auto_48217 ?auto_48220 ) ) ( not ( = ?auto_48212 ?auto_48220 ) ) ( not ( = ?auto_48208 ?auto_48220 ) ) ( not ( = ?auto_48201 ?auto_48220 ) ) ( not ( = ?auto_48218 ?auto_48220 ) ) ( not ( = ?auto_48202 ?auto_48220 ) ) ( not ( = ?auto_48198 ?auto_48220 ) ) ( not ( = ?auto_48195 ?auto_48220 ) ) ( not ( = ?auto_48216 ?auto_48220 ) ) ( not ( = ?auto_48211 ?auto_48220 ) ) ( not ( = ?auto_48219 ?auto_48220 ) ) ( not ( = ?auto_48203 ?auto_48220 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48210 ?auto_48211 ?auto_48220 ?auto_48213 )
      ( MAKE-ON ?auto_48193 ?auto_48194 )
      ( MAKE-ON-VERIFY ?auto_48193 ?auto_48194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48221 - SURFACE
      ?auto_48222 - SURFACE
    )
    :vars
    (
      ?auto_48226 - HOIST
      ?auto_48232 - PLACE
      ?auto_48236 - PLACE
      ?auto_48233 - HOIST
      ?auto_48228 - SURFACE
      ?auto_48223 - SURFACE
      ?auto_48225 - PLACE
      ?auto_48240 - HOIST
      ?auto_48242 - SURFACE
      ?auto_48230 - SURFACE
      ?auto_48245 - PLACE
      ?auto_48243 - HOIST
      ?auto_48247 - SURFACE
      ?auto_48235 - SURFACE
      ?auto_48224 - PLACE
      ?auto_48229 - HOIST
      ?auto_48234 - SURFACE
      ?auto_48244 - SURFACE
      ?auto_48231 - PLACE
      ?auto_48237 - HOIST
      ?auto_48227 - SURFACE
      ?auto_48248 - SURFACE
      ?auto_48246 - SURFACE
      ?auto_48239 - SURFACE
      ?auto_48241 - SURFACE
      ?auto_48238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48226 ?auto_48232 ) ( IS-CRATE ?auto_48221 ) ( not ( = ?auto_48221 ?auto_48222 ) ) ( not ( = ?auto_48236 ?auto_48232 ) ) ( HOIST-AT ?auto_48233 ?auto_48236 ) ( not ( = ?auto_48226 ?auto_48233 ) ) ( SURFACE-AT ?auto_48221 ?auto_48236 ) ( ON ?auto_48221 ?auto_48228 ) ( CLEAR ?auto_48221 ) ( not ( = ?auto_48221 ?auto_48228 ) ) ( not ( = ?auto_48222 ?auto_48228 ) ) ( IS-CRATE ?auto_48222 ) ( not ( = ?auto_48221 ?auto_48223 ) ) ( not ( = ?auto_48222 ?auto_48223 ) ) ( not ( = ?auto_48228 ?auto_48223 ) ) ( not ( = ?auto_48225 ?auto_48232 ) ) ( not ( = ?auto_48236 ?auto_48225 ) ) ( HOIST-AT ?auto_48240 ?auto_48225 ) ( not ( = ?auto_48226 ?auto_48240 ) ) ( not ( = ?auto_48233 ?auto_48240 ) ) ( AVAILABLE ?auto_48240 ) ( SURFACE-AT ?auto_48222 ?auto_48225 ) ( ON ?auto_48222 ?auto_48242 ) ( CLEAR ?auto_48222 ) ( not ( = ?auto_48221 ?auto_48242 ) ) ( not ( = ?auto_48222 ?auto_48242 ) ) ( not ( = ?auto_48228 ?auto_48242 ) ) ( not ( = ?auto_48223 ?auto_48242 ) ) ( IS-CRATE ?auto_48223 ) ( not ( = ?auto_48221 ?auto_48230 ) ) ( not ( = ?auto_48222 ?auto_48230 ) ) ( not ( = ?auto_48228 ?auto_48230 ) ) ( not ( = ?auto_48223 ?auto_48230 ) ) ( not ( = ?auto_48242 ?auto_48230 ) ) ( not ( = ?auto_48245 ?auto_48232 ) ) ( not ( = ?auto_48236 ?auto_48245 ) ) ( not ( = ?auto_48225 ?auto_48245 ) ) ( HOIST-AT ?auto_48243 ?auto_48245 ) ( not ( = ?auto_48226 ?auto_48243 ) ) ( not ( = ?auto_48233 ?auto_48243 ) ) ( not ( = ?auto_48240 ?auto_48243 ) ) ( AVAILABLE ?auto_48243 ) ( SURFACE-AT ?auto_48223 ?auto_48245 ) ( ON ?auto_48223 ?auto_48247 ) ( CLEAR ?auto_48223 ) ( not ( = ?auto_48221 ?auto_48247 ) ) ( not ( = ?auto_48222 ?auto_48247 ) ) ( not ( = ?auto_48228 ?auto_48247 ) ) ( not ( = ?auto_48223 ?auto_48247 ) ) ( not ( = ?auto_48242 ?auto_48247 ) ) ( not ( = ?auto_48230 ?auto_48247 ) ) ( IS-CRATE ?auto_48230 ) ( not ( = ?auto_48221 ?auto_48235 ) ) ( not ( = ?auto_48222 ?auto_48235 ) ) ( not ( = ?auto_48228 ?auto_48235 ) ) ( not ( = ?auto_48223 ?auto_48235 ) ) ( not ( = ?auto_48242 ?auto_48235 ) ) ( not ( = ?auto_48230 ?auto_48235 ) ) ( not ( = ?auto_48247 ?auto_48235 ) ) ( not ( = ?auto_48224 ?auto_48232 ) ) ( not ( = ?auto_48236 ?auto_48224 ) ) ( not ( = ?auto_48225 ?auto_48224 ) ) ( not ( = ?auto_48245 ?auto_48224 ) ) ( HOIST-AT ?auto_48229 ?auto_48224 ) ( not ( = ?auto_48226 ?auto_48229 ) ) ( not ( = ?auto_48233 ?auto_48229 ) ) ( not ( = ?auto_48240 ?auto_48229 ) ) ( not ( = ?auto_48243 ?auto_48229 ) ) ( SURFACE-AT ?auto_48230 ?auto_48224 ) ( ON ?auto_48230 ?auto_48234 ) ( CLEAR ?auto_48230 ) ( not ( = ?auto_48221 ?auto_48234 ) ) ( not ( = ?auto_48222 ?auto_48234 ) ) ( not ( = ?auto_48228 ?auto_48234 ) ) ( not ( = ?auto_48223 ?auto_48234 ) ) ( not ( = ?auto_48242 ?auto_48234 ) ) ( not ( = ?auto_48230 ?auto_48234 ) ) ( not ( = ?auto_48247 ?auto_48234 ) ) ( not ( = ?auto_48235 ?auto_48234 ) ) ( IS-CRATE ?auto_48235 ) ( not ( = ?auto_48221 ?auto_48244 ) ) ( not ( = ?auto_48222 ?auto_48244 ) ) ( not ( = ?auto_48228 ?auto_48244 ) ) ( not ( = ?auto_48223 ?auto_48244 ) ) ( not ( = ?auto_48242 ?auto_48244 ) ) ( not ( = ?auto_48230 ?auto_48244 ) ) ( not ( = ?auto_48247 ?auto_48244 ) ) ( not ( = ?auto_48235 ?auto_48244 ) ) ( not ( = ?auto_48234 ?auto_48244 ) ) ( not ( = ?auto_48231 ?auto_48232 ) ) ( not ( = ?auto_48236 ?auto_48231 ) ) ( not ( = ?auto_48225 ?auto_48231 ) ) ( not ( = ?auto_48245 ?auto_48231 ) ) ( not ( = ?auto_48224 ?auto_48231 ) ) ( HOIST-AT ?auto_48237 ?auto_48231 ) ( not ( = ?auto_48226 ?auto_48237 ) ) ( not ( = ?auto_48233 ?auto_48237 ) ) ( not ( = ?auto_48240 ?auto_48237 ) ) ( not ( = ?auto_48243 ?auto_48237 ) ) ( not ( = ?auto_48229 ?auto_48237 ) ) ( AVAILABLE ?auto_48237 ) ( SURFACE-AT ?auto_48235 ?auto_48231 ) ( ON ?auto_48235 ?auto_48227 ) ( CLEAR ?auto_48235 ) ( not ( = ?auto_48221 ?auto_48227 ) ) ( not ( = ?auto_48222 ?auto_48227 ) ) ( not ( = ?auto_48228 ?auto_48227 ) ) ( not ( = ?auto_48223 ?auto_48227 ) ) ( not ( = ?auto_48242 ?auto_48227 ) ) ( not ( = ?auto_48230 ?auto_48227 ) ) ( not ( = ?auto_48247 ?auto_48227 ) ) ( not ( = ?auto_48235 ?auto_48227 ) ) ( not ( = ?auto_48234 ?auto_48227 ) ) ( not ( = ?auto_48244 ?auto_48227 ) ) ( IS-CRATE ?auto_48244 ) ( not ( = ?auto_48221 ?auto_48248 ) ) ( not ( = ?auto_48222 ?auto_48248 ) ) ( not ( = ?auto_48228 ?auto_48248 ) ) ( not ( = ?auto_48223 ?auto_48248 ) ) ( not ( = ?auto_48242 ?auto_48248 ) ) ( not ( = ?auto_48230 ?auto_48248 ) ) ( not ( = ?auto_48247 ?auto_48248 ) ) ( not ( = ?auto_48235 ?auto_48248 ) ) ( not ( = ?auto_48234 ?auto_48248 ) ) ( not ( = ?auto_48244 ?auto_48248 ) ) ( not ( = ?auto_48227 ?auto_48248 ) ) ( AVAILABLE ?auto_48233 ) ( SURFACE-AT ?auto_48244 ?auto_48236 ) ( ON ?auto_48244 ?auto_48246 ) ( CLEAR ?auto_48244 ) ( not ( = ?auto_48221 ?auto_48246 ) ) ( not ( = ?auto_48222 ?auto_48246 ) ) ( not ( = ?auto_48228 ?auto_48246 ) ) ( not ( = ?auto_48223 ?auto_48246 ) ) ( not ( = ?auto_48242 ?auto_48246 ) ) ( not ( = ?auto_48230 ?auto_48246 ) ) ( not ( = ?auto_48247 ?auto_48246 ) ) ( not ( = ?auto_48235 ?auto_48246 ) ) ( not ( = ?auto_48234 ?auto_48246 ) ) ( not ( = ?auto_48244 ?auto_48246 ) ) ( not ( = ?auto_48227 ?auto_48246 ) ) ( not ( = ?auto_48248 ?auto_48246 ) ) ( SURFACE-AT ?auto_48239 ?auto_48232 ) ( CLEAR ?auto_48239 ) ( IS-CRATE ?auto_48248 ) ( not ( = ?auto_48221 ?auto_48239 ) ) ( not ( = ?auto_48222 ?auto_48239 ) ) ( not ( = ?auto_48228 ?auto_48239 ) ) ( not ( = ?auto_48223 ?auto_48239 ) ) ( not ( = ?auto_48242 ?auto_48239 ) ) ( not ( = ?auto_48230 ?auto_48239 ) ) ( not ( = ?auto_48247 ?auto_48239 ) ) ( not ( = ?auto_48235 ?auto_48239 ) ) ( not ( = ?auto_48234 ?auto_48239 ) ) ( not ( = ?auto_48244 ?auto_48239 ) ) ( not ( = ?auto_48227 ?auto_48239 ) ) ( not ( = ?auto_48248 ?auto_48239 ) ) ( not ( = ?auto_48246 ?auto_48239 ) ) ( AVAILABLE ?auto_48226 ) ( AVAILABLE ?auto_48229 ) ( SURFACE-AT ?auto_48248 ?auto_48224 ) ( ON ?auto_48248 ?auto_48241 ) ( CLEAR ?auto_48248 ) ( not ( = ?auto_48221 ?auto_48241 ) ) ( not ( = ?auto_48222 ?auto_48241 ) ) ( not ( = ?auto_48228 ?auto_48241 ) ) ( not ( = ?auto_48223 ?auto_48241 ) ) ( not ( = ?auto_48242 ?auto_48241 ) ) ( not ( = ?auto_48230 ?auto_48241 ) ) ( not ( = ?auto_48247 ?auto_48241 ) ) ( not ( = ?auto_48235 ?auto_48241 ) ) ( not ( = ?auto_48234 ?auto_48241 ) ) ( not ( = ?auto_48244 ?auto_48241 ) ) ( not ( = ?auto_48227 ?auto_48241 ) ) ( not ( = ?auto_48248 ?auto_48241 ) ) ( not ( = ?auto_48246 ?auto_48241 ) ) ( not ( = ?auto_48239 ?auto_48241 ) ) ( TRUCK-AT ?auto_48238 ?auto_48232 ) )
    :subtasks
    ( ( !DRIVE ?auto_48238 ?auto_48232 ?auto_48224 )
      ( MAKE-ON ?auto_48221 ?auto_48222 )
      ( MAKE-ON-VERIFY ?auto_48221 ?auto_48222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48251 - SURFACE
      ?auto_48252 - SURFACE
    )
    :vars
    (
      ?auto_48253 - HOIST
      ?auto_48254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48253 ?auto_48254 ) ( SURFACE-AT ?auto_48252 ?auto_48254 ) ( CLEAR ?auto_48252 ) ( LIFTING ?auto_48253 ?auto_48251 ) ( IS-CRATE ?auto_48251 ) ( not ( = ?auto_48251 ?auto_48252 ) ) )
    :subtasks
    ( ( !DROP ?auto_48253 ?auto_48251 ?auto_48252 ?auto_48254 )
      ( MAKE-ON-VERIFY ?auto_48251 ?auto_48252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48255 - SURFACE
      ?auto_48256 - SURFACE
    )
    :vars
    (
      ?auto_48258 - HOIST
      ?auto_48257 - PLACE
      ?auto_48259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48258 ?auto_48257 ) ( SURFACE-AT ?auto_48256 ?auto_48257 ) ( CLEAR ?auto_48256 ) ( IS-CRATE ?auto_48255 ) ( not ( = ?auto_48255 ?auto_48256 ) ) ( TRUCK-AT ?auto_48259 ?auto_48257 ) ( AVAILABLE ?auto_48258 ) ( IN ?auto_48255 ?auto_48259 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48258 ?auto_48255 ?auto_48259 ?auto_48257 )
      ( MAKE-ON ?auto_48255 ?auto_48256 )
      ( MAKE-ON-VERIFY ?auto_48255 ?auto_48256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48260 - SURFACE
      ?auto_48261 - SURFACE
    )
    :vars
    (
      ?auto_48263 - HOIST
      ?auto_48264 - PLACE
      ?auto_48262 - TRUCK
      ?auto_48265 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48263 ?auto_48264 ) ( SURFACE-AT ?auto_48261 ?auto_48264 ) ( CLEAR ?auto_48261 ) ( IS-CRATE ?auto_48260 ) ( not ( = ?auto_48260 ?auto_48261 ) ) ( AVAILABLE ?auto_48263 ) ( IN ?auto_48260 ?auto_48262 ) ( TRUCK-AT ?auto_48262 ?auto_48265 ) ( not ( = ?auto_48265 ?auto_48264 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48262 ?auto_48265 ?auto_48264 )
      ( MAKE-ON ?auto_48260 ?auto_48261 )
      ( MAKE-ON-VERIFY ?auto_48260 ?auto_48261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48266 - SURFACE
      ?auto_48267 - SURFACE
    )
    :vars
    (
      ?auto_48270 - HOIST
      ?auto_48271 - PLACE
      ?auto_48269 - TRUCK
      ?auto_48268 - PLACE
      ?auto_48272 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48270 ?auto_48271 ) ( SURFACE-AT ?auto_48267 ?auto_48271 ) ( CLEAR ?auto_48267 ) ( IS-CRATE ?auto_48266 ) ( not ( = ?auto_48266 ?auto_48267 ) ) ( AVAILABLE ?auto_48270 ) ( TRUCK-AT ?auto_48269 ?auto_48268 ) ( not ( = ?auto_48268 ?auto_48271 ) ) ( HOIST-AT ?auto_48272 ?auto_48268 ) ( LIFTING ?auto_48272 ?auto_48266 ) ( not ( = ?auto_48270 ?auto_48272 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48272 ?auto_48266 ?auto_48269 ?auto_48268 )
      ( MAKE-ON ?auto_48266 ?auto_48267 )
      ( MAKE-ON-VERIFY ?auto_48266 ?auto_48267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48273 - SURFACE
      ?auto_48274 - SURFACE
    )
    :vars
    (
      ?auto_48279 - HOIST
      ?auto_48278 - PLACE
      ?auto_48275 - TRUCK
      ?auto_48277 - PLACE
      ?auto_48276 - HOIST
      ?auto_48280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48279 ?auto_48278 ) ( SURFACE-AT ?auto_48274 ?auto_48278 ) ( CLEAR ?auto_48274 ) ( IS-CRATE ?auto_48273 ) ( not ( = ?auto_48273 ?auto_48274 ) ) ( AVAILABLE ?auto_48279 ) ( TRUCK-AT ?auto_48275 ?auto_48277 ) ( not ( = ?auto_48277 ?auto_48278 ) ) ( HOIST-AT ?auto_48276 ?auto_48277 ) ( not ( = ?auto_48279 ?auto_48276 ) ) ( AVAILABLE ?auto_48276 ) ( SURFACE-AT ?auto_48273 ?auto_48277 ) ( ON ?auto_48273 ?auto_48280 ) ( CLEAR ?auto_48273 ) ( not ( = ?auto_48273 ?auto_48280 ) ) ( not ( = ?auto_48274 ?auto_48280 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48276 ?auto_48273 ?auto_48280 ?auto_48277 )
      ( MAKE-ON ?auto_48273 ?auto_48274 )
      ( MAKE-ON-VERIFY ?auto_48273 ?auto_48274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48281 - SURFACE
      ?auto_48282 - SURFACE
    )
    :vars
    (
      ?auto_48286 - HOIST
      ?auto_48287 - PLACE
      ?auto_48288 - PLACE
      ?auto_48284 - HOIST
      ?auto_48283 - SURFACE
      ?auto_48285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48286 ?auto_48287 ) ( SURFACE-AT ?auto_48282 ?auto_48287 ) ( CLEAR ?auto_48282 ) ( IS-CRATE ?auto_48281 ) ( not ( = ?auto_48281 ?auto_48282 ) ) ( AVAILABLE ?auto_48286 ) ( not ( = ?auto_48288 ?auto_48287 ) ) ( HOIST-AT ?auto_48284 ?auto_48288 ) ( not ( = ?auto_48286 ?auto_48284 ) ) ( AVAILABLE ?auto_48284 ) ( SURFACE-AT ?auto_48281 ?auto_48288 ) ( ON ?auto_48281 ?auto_48283 ) ( CLEAR ?auto_48281 ) ( not ( = ?auto_48281 ?auto_48283 ) ) ( not ( = ?auto_48282 ?auto_48283 ) ) ( TRUCK-AT ?auto_48285 ?auto_48287 ) )
    :subtasks
    ( ( !DRIVE ?auto_48285 ?auto_48287 ?auto_48288 )
      ( MAKE-ON ?auto_48281 ?auto_48282 )
      ( MAKE-ON-VERIFY ?auto_48281 ?auto_48282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48289 - SURFACE
      ?auto_48290 - SURFACE
    )
    :vars
    (
      ?auto_48291 - HOIST
      ?auto_48293 - PLACE
      ?auto_48294 - PLACE
      ?auto_48295 - HOIST
      ?auto_48296 - SURFACE
      ?auto_48292 - TRUCK
      ?auto_48297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48291 ?auto_48293 ) ( IS-CRATE ?auto_48289 ) ( not ( = ?auto_48289 ?auto_48290 ) ) ( not ( = ?auto_48294 ?auto_48293 ) ) ( HOIST-AT ?auto_48295 ?auto_48294 ) ( not ( = ?auto_48291 ?auto_48295 ) ) ( AVAILABLE ?auto_48295 ) ( SURFACE-AT ?auto_48289 ?auto_48294 ) ( ON ?auto_48289 ?auto_48296 ) ( CLEAR ?auto_48289 ) ( not ( = ?auto_48289 ?auto_48296 ) ) ( not ( = ?auto_48290 ?auto_48296 ) ) ( TRUCK-AT ?auto_48292 ?auto_48293 ) ( SURFACE-AT ?auto_48297 ?auto_48293 ) ( CLEAR ?auto_48297 ) ( LIFTING ?auto_48291 ?auto_48290 ) ( IS-CRATE ?auto_48290 ) ( not ( = ?auto_48289 ?auto_48297 ) ) ( not ( = ?auto_48290 ?auto_48297 ) ) ( not ( = ?auto_48296 ?auto_48297 ) ) )
    :subtasks
    ( ( !DROP ?auto_48291 ?auto_48290 ?auto_48297 ?auto_48293 )
      ( MAKE-ON ?auto_48289 ?auto_48290 )
      ( MAKE-ON-VERIFY ?auto_48289 ?auto_48290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48298 - SURFACE
      ?auto_48299 - SURFACE
    )
    :vars
    (
      ?auto_48304 - HOIST
      ?auto_48301 - PLACE
      ?auto_48300 - PLACE
      ?auto_48302 - HOIST
      ?auto_48303 - SURFACE
      ?auto_48306 - TRUCK
      ?auto_48305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48304 ?auto_48301 ) ( IS-CRATE ?auto_48298 ) ( not ( = ?auto_48298 ?auto_48299 ) ) ( not ( = ?auto_48300 ?auto_48301 ) ) ( HOIST-AT ?auto_48302 ?auto_48300 ) ( not ( = ?auto_48304 ?auto_48302 ) ) ( AVAILABLE ?auto_48302 ) ( SURFACE-AT ?auto_48298 ?auto_48300 ) ( ON ?auto_48298 ?auto_48303 ) ( CLEAR ?auto_48298 ) ( not ( = ?auto_48298 ?auto_48303 ) ) ( not ( = ?auto_48299 ?auto_48303 ) ) ( TRUCK-AT ?auto_48306 ?auto_48301 ) ( SURFACE-AT ?auto_48305 ?auto_48301 ) ( CLEAR ?auto_48305 ) ( IS-CRATE ?auto_48299 ) ( not ( = ?auto_48298 ?auto_48305 ) ) ( not ( = ?auto_48299 ?auto_48305 ) ) ( not ( = ?auto_48303 ?auto_48305 ) ) ( AVAILABLE ?auto_48304 ) ( IN ?auto_48299 ?auto_48306 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48304 ?auto_48299 ?auto_48306 ?auto_48301 )
      ( MAKE-ON ?auto_48298 ?auto_48299 )
      ( MAKE-ON-VERIFY ?auto_48298 ?auto_48299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48307 - SURFACE
      ?auto_48308 - SURFACE
    )
    :vars
    (
      ?auto_48311 - HOIST
      ?auto_48314 - PLACE
      ?auto_48312 - PLACE
      ?auto_48309 - HOIST
      ?auto_48310 - SURFACE
      ?auto_48313 - SURFACE
      ?auto_48315 - TRUCK
      ?auto_48316 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48311 ?auto_48314 ) ( IS-CRATE ?auto_48307 ) ( not ( = ?auto_48307 ?auto_48308 ) ) ( not ( = ?auto_48312 ?auto_48314 ) ) ( HOIST-AT ?auto_48309 ?auto_48312 ) ( not ( = ?auto_48311 ?auto_48309 ) ) ( AVAILABLE ?auto_48309 ) ( SURFACE-AT ?auto_48307 ?auto_48312 ) ( ON ?auto_48307 ?auto_48310 ) ( CLEAR ?auto_48307 ) ( not ( = ?auto_48307 ?auto_48310 ) ) ( not ( = ?auto_48308 ?auto_48310 ) ) ( SURFACE-AT ?auto_48313 ?auto_48314 ) ( CLEAR ?auto_48313 ) ( IS-CRATE ?auto_48308 ) ( not ( = ?auto_48307 ?auto_48313 ) ) ( not ( = ?auto_48308 ?auto_48313 ) ) ( not ( = ?auto_48310 ?auto_48313 ) ) ( AVAILABLE ?auto_48311 ) ( IN ?auto_48308 ?auto_48315 ) ( TRUCK-AT ?auto_48315 ?auto_48316 ) ( not ( = ?auto_48316 ?auto_48314 ) ) ( not ( = ?auto_48312 ?auto_48316 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48315 ?auto_48316 ?auto_48314 )
      ( MAKE-ON ?auto_48307 ?auto_48308 )
      ( MAKE-ON-VERIFY ?auto_48307 ?auto_48308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48317 - SURFACE
      ?auto_48318 - SURFACE
    )
    :vars
    (
      ?auto_48321 - HOIST
      ?auto_48324 - PLACE
      ?auto_48322 - PLACE
      ?auto_48325 - HOIST
      ?auto_48320 - SURFACE
      ?auto_48323 - SURFACE
      ?auto_48319 - TRUCK
      ?auto_48326 - PLACE
      ?auto_48327 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48321 ?auto_48324 ) ( IS-CRATE ?auto_48317 ) ( not ( = ?auto_48317 ?auto_48318 ) ) ( not ( = ?auto_48322 ?auto_48324 ) ) ( HOIST-AT ?auto_48325 ?auto_48322 ) ( not ( = ?auto_48321 ?auto_48325 ) ) ( AVAILABLE ?auto_48325 ) ( SURFACE-AT ?auto_48317 ?auto_48322 ) ( ON ?auto_48317 ?auto_48320 ) ( CLEAR ?auto_48317 ) ( not ( = ?auto_48317 ?auto_48320 ) ) ( not ( = ?auto_48318 ?auto_48320 ) ) ( SURFACE-AT ?auto_48323 ?auto_48324 ) ( CLEAR ?auto_48323 ) ( IS-CRATE ?auto_48318 ) ( not ( = ?auto_48317 ?auto_48323 ) ) ( not ( = ?auto_48318 ?auto_48323 ) ) ( not ( = ?auto_48320 ?auto_48323 ) ) ( AVAILABLE ?auto_48321 ) ( TRUCK-AT ?auto_48319 ?auto_48326 ) ( not ( = ?auto_48326 ?auto_48324 ) ) ( not ( = ?auto_48322 ?auto_48326 ) ) ( HOIST-AT ?auto_48327 ?auto_48326 ) ( LIFTING ?auto_48327 ?auto_48318 ) ( not ( = ?auto_48321 ?auto_48327 ) ) ( not ( = ?auto_48325 ?auto_48327 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48327 ?auto_48318 ?auto_48319 ?auto_48326 )
      ( MAKE-ON ?auto_48317 ?auto_48318 )
      ( MAKE-ON-VERIFY ?auto_48317 ?auto_48318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48328 - SURFACE
      ?auto_48329 - SURFACE
    )
    :vars
    (
      ?auto_48331 - HOIST
      ?auto_48336 - PLACE
      ?auto_48333 - PLACE
      ?auto_48332 - HOIST
      ?auto_48337 - SURFACE
      ?auto_48338 - SURFACE
      ?auto_48335 - TRUCK
      ?auto_48330 - PLACE
      ?auto_48334 - HOIST
      ?auto_48339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48331 ?auto_48336 ) ( IS-CRATE ?auto_48328 ) ( not ( = ?auto_48328 ?auto_48329 ) ) ( not ( = ?auto_48333 ?auto_48336 ) ) ( HOIST-AT ?auto_48332 ?auto_48333 ) ( not ( = ?auto_48331 ?auto_48332 ) ) ( AVAILABLE ?auto_48332 ) ( SURFACE-AT ?auto_48328 ?auto_48333 ) ( ON ?auto_48328 ?auto_48337 ) ( CLEAR ?auto_48328 ) ( not ( = ?auto_48328 ?auto_48337 ) ) ( not ( = ?auto_48329 ?auto_48337 ) ) ( SURFACE-AT ?auto_48338 ?auto_48336 ) ( CLEAR ?auto_48338 ) ( IS-CRATE ?auto_48329 ) ( not ( = ?auto_48328 ?auto_48338 ) ) ( not ( = ?auto_48329 ?auto_48338 ) ) ( not ( = ?auto_48337 ?auto_48338 ) ) ( AVAILABLE ?auto_48331 ) ( TRUCK-AT ?auto_48335 ?auto_48330 ) ( not ( = ?auto_48330 ?auto_48336 ) ) ( not ( = ?auto_48333 ?auto_48330 ) ) ( HOIST-AT ?auto_48334 ?auto_48330 ) ( not ( = ?auto_48331 ?auto_48334 ) ) ( not ( = ?auto_48332 ?auto_48334 ) ) ( AVAILABLE ?auto_48334 ) ( SURFACE-AT ?auto_48329 ?auto_48330 ) ( ON ?auto_48329 ?auto_48339 ) ( CLEAR ?auto_48329 ) ( not ( = ?auto_48328 ?auto_48339 ) ) ( not ( = ?auto_48329 ?auto_48339 ) ) ( not ( = ?auto_48337 ?auto_48339 ) ) ( not ( = ?auto_48338 ?auto_48339 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48334 ?auto_48329 ?auto_48339 ?auto_48330 )
      ( MAKE-ON ?auto_48328 ?auto_48329 )
      ( MAKE-ON-VERIFY ?auto_48328 ?auto_48329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48340 - SURFACE
      ?auto_48341 - SURFACE
    )
    :vars
    (
      ?auto_48344 - HOIST
      ?auto_48347 - PLACE
      ?auto_48349 - PLACE
      ?auto_48345 - HOIST
      ?auto_48343 - SURFACE
      ?auto_48346 - SURFACE
      ?auto_48342 - PLACE
      ?auto_48351 - HOIST
      ?auto_48348 - SURFACE
      ?auto_48350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48344 ?auto_48347 ) ( IS-CRATE ?auto_48340 ) ( not ( = ?auto_48340 ?auto_48341 ) ) ( not ( = ?auto_48349 ?auto_48347 ) ) ( HOIST-AT ?auto_48345 ?auto_48349 ) ( not ( = ?auto_48344 ?auto_48345 ) ) ( AVAILABLE ?auto_48345 ) ( SURFACE-AT ?auto_48340 ?auto_48349 ) ( ON ?auto_48340 ?auto_48343 ) ( CLEAR ?auto_48340 ) ( not ( = ?auto_48340 ?auto_48343 ) ) ( not ( = ?auto_48341 ?auto_48343 ) ) ( SURFACE-AT ?auto_48346 ?auto_48347 ) ( CLEAR ?auto_48346 ) ( IS-CRATE ?auto_48341 ) ( not ( = ?auto_48340 ?auto_48346 ) ) ( not ( = ?auto_48341 ?auto_48346 ) ) ( not ( = ?auto_48343 ?auto_48346 ) ) ( AVAILABLE ?auto_48344 ) ( not ( = ?auto_48342 ?auto_48347 ) ) ( not ( = ?auto_48349 ?auto_48342 ) ) ( HOIST-AT ?auto_48351 ?auto_48342 ) ( not ( = ?auto_48344 ?auto_48351 ) ) ( not ( = ?auto_48345 ?auto_48351 ) ) ( AVAILABLE ?auto_48351 ) ( SURFACE-AT ?auto_48341 ?auto_48342 ) ( ON ?auto_48341 ?auto_48348 ) ( CLEAR ?auto_48341 ) ( not ( = ?auto_48340 ?auto_48348 ) ) ( not ( = ?auto_48341 ?auto_48348 ) ) ( not ( = ?auto_48343 ?auto_48348 ) ) ( not ( = ?auto_48346 ?auto_48348 ) ) ( TRUCK-AT ?auto_48350 ?auto_48347 ) )
    :subtasks
    ( ( !DRIVE ?auto_48350 ?auto_48347 ?auto_48342 )
      ( MAKE-ON ?auto_48340 ?auto_48341 )
      ( MAKE-ON-VERIFY ?auto_48340 ?auto_48341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48352 - SURFACE
      ?auto_48353 - SURFACE
    )
    :vars
    (
      ?auto_48359 - HOIST
      ?auto_48355 - PLACE
      ?auto_48358 - PLACE
      ?auto_48357 - HOIST
      ?auto_48360 - SURFACE
      ?auto_48354 - SURFACE
      ?auto_48356 - PLACE
      ?auto_48361 - HOIST
      ?auto_48362 - SURFACE
      ?auto_48363 - TRUCK
      ?auto_48364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48359 ?auto_48355 ) ( IS-CRATE ?auto_48352 ) ( not ( = ?auto_48352 ?auto_48353 ) ) ( not ( = ?auto_48358 ?auto_48355 ) ) ( HOIST-AT ?auto_48357 ?auto_48358 ) ( not ( = ?auto_48359 ?auto_48357 ) ) ( AVAILABLE ?auto_48357 ) ( SURFACE-AT ?auto_48352 ?auto_48358 ) ( ON ?auto_48352 ?auto_48360 ) ( CLEAR ?auto_48352 ) ( not ( = ?auto_48352 ?auto_48360 ) ) ( not ( = ?auto_48353 ?auto_48360 ) ) ( IS-CRATE ?auto_48353 ) ( not ( = ?auto_48352 ?auto_48354 ) ) ( not ( = ?auto_48353 ?auto_48354 ) ) ( not ( = ?auto_48360 ?auto_48354 ) ) ( not ( = ?auto_48356 ?auto_48355 ) ) ( not ( = ?auto_48358 ?auto_48356 ) ) ( HOIST-AT ?auto_48361 ?auto_48356 ) ( not ( = ?auto_48359 ?auto_48361 ) ) ( not ( = ?auto_48357 ?auto_48361 ) ) ( AVAILABLE ?auto_48361 ) ( SURFACE-AT ?auto_48353 ?auto_48356 ) ( ON ?auto_48353 ?auto_48362 ) ( CLEAR ?auto_48353 ) ( not ( = ?auto_48352 ?auto_48362 ) ) ( not ( = ?auto_48353 ?auto_48362 ) ) ( not ( = ?auto_48360 ?auto_48362 ) ) ( not ( = ?auto_48354 ?auto_48362 ) ) ( TRUCK-AT ?auto_48363 ?auto_48355 ) ( SURFACE-AT ?auto_48364 ?auto_48355 ) ( CLEAR ?auto_48364 ) ( LIFTING ?auto_48359 ?auto_48354 ) ( IS-CRATE ?auto_48354 ) ( not ( = ?auto_48352 ?auto_48364 ) ) ( not ( = ?auto_48353 ?auto_48364 ) ) ( not ( = ?auto_48360 ?auto_48364 ) ) ( not ( = ?auto_48354 ?auto_48364 ) ) ( not ( = ?auto_48362 ?auto_48364 ) ) )
    :subtasks
    ( ( !DROP ?auto_48359 ?auto_48354 ?auto_48364 ?auto_48355 )
      ( MAKE-ON ?auto_48352 ?auto_48353 )
      ( MAKE-ON-VERIFY ?auto_48352 ?auto_48353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48365 - SURFACE
      ?auto_48366 - SURFACE
    )
    :vars
    (
      ?auto_48371 - HOIST
      ?auto_48372 - PLACE
      ?auto_48374 - PLACE
      ?auto_48373 - HOIST
      ?auto_48370 - SURFACE
      ?auto_48376 - SURFACE
      ?auto_48367 - PLACE
      ?auto_48368 - HOIST
      ?auto_48375 - SURFACE
      ?auto_48369 - TRUCK
      ?auto_48377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48371 ?auto_48372 ) ( IS-CRATE ?auto_48365 ) ( not ( = ?auto_48365 ?auto_48366 ) ) ( not ( = ?auto_48374 ?auto_48372 ) ) ( HOIST-AT ?auto_48373 ?auto_48374 ) ( not ( = ?auto_48371 ?auto_48373 ) ) ( AVAILABLE ?auto_48373 ) ( SURFACE-AT ?auto_48365 ?auto_48374 ) ( ON ?auto_48365 ?auto_48370 ) ( CLEAR ?auto_48365 ) ( not ( = ?auto_48365 ?auto_48370 ) ) ( not ( = ?auto_48366 ?auto_48370 ) ) ( IS-CRATE ?auto_48366 ) ( not ( = ?auto_48365 ?auto_48376 ) ) ( not ( = ?auto_48366 ?auto_48376 ) ) ( not ( = ?auto_48370 ?auto_48376 ) ) ( not ( = ?auto_48367 ?auto_48372 ) ) ( not ( = ?auto_48374 ?auto_48367 ) ) ( HOIST-AT ?auto_48368 ?auto_48367 ) ( not ( = ?auto_48371 ?auto_48368 ) ) ( not ( = ?auto_48373 ?auto_48368 ) ) ( AVAILABLE ?auto_48368 ) ( SURFACE-AT ?auto_48366 ?auto_48367 ) ( ON ?auto_48366 ?auto_48375 ) ( CLEAR ?auto_48366 ) ( not ( = ?auto_48365 ?auto_48375 ) ) ( not ( = ?auto_48366 ?auto_48375 ) ) ( not ( = ?auto_48370 ?auto_48375 ) ) ( not ( = ?auto_48376 ?auto_48375 ) ) ( TRUCK-AT ?auto_48369 ?auto_48372 ) ( SURFACE-AT ?auto_48377 ?auto_48372 ) ( CLEAR ?auto_48377 ) ( IS-CRATE ?auto_48376 ) ( not ( = ?auto_48365 ?auto_48377 ) ) ( not ( = ?auto_48366 ?auto_48377 ) ) ( not ( = ?auto_48370 ?auto_48377 ) ) ( not ( = ?auto_48376 ?auto_48377 ) ) ( not ( = ?auto_48375 ?auto_48377 ) ) ( AVAILABLE ?auto_48371 ) ( IN ?auto_48376 ?auto_48369 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48371 ?auto_48376 ?auto_48369 ?auto_48372 )
      ( MAKE-ON ?auto_48365 ?auto_48366 )
      ( MAKE-ON-VERIFY ?auto_48365 ?auto_48366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48378 - SURFACE
      ?auto_48379 - SURFACE
    )
    :vars
    (
      ?auto_48384 - HOIST
      ?auto_48390 - PLACE
      ?auto_48388 - PLACE
      ?auto_48386 - HOIST
      ?auto_48385 - SURFACE
      ?auto_48387 - SURFACE
      ?auto_48389 - PLACE
      ?auto_48380 - HOIST
      ?auto_48383 - SURFACE
      ?auto_48382 - SURFACE
      ?auto_48381 - TRUCK
      ?auto_48391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48384 ?auto_48390 ) ( IS-CRATE ?auto_48378 ) ( not ( = ?auto_48378 ?auto_48379 ) ) ( not ( = ?auto_48388 ?auto_48390 ) ) ( HOIST-AT ?auto_48386 ?auto_48388 ) ( not ( = ?auto_48384 ?auto_48386 ) ) ( AVAILABLE ?auto_48386 ) ( SURFACE-AT ?auto_48378 ?auto_48388 ) ( ON ?auto_48378 ?auto_48385 ) ( CLEAR ?auto_48378 ) ( not ( = ?auto_48378 ?auto_48385 ) ) ( not ( = ?auto_48379 ?auto_48385 ) ) ( IS-CRATE ?auto_48379 ) ( not ( = ?auto_48378 ?auto_48387 ) ) ( not ( = ?auto_48379 ?auto_48387 ) ) ( not ( = ?auto_48385 ?auto_48387 ) ) ( not ( = ?auto_48389 ?auto_48390 ) ) ( not ( = ?auto_48388 ?auto_48389 ) ) ( HOIST-AT ?auto_48380 ?auto_48389 ) ( not ( = ?auto_48384 ?auto_48380 ) ) ( not ( = ?auto_48386 ?auto_48380 ) ) ( AVAILABLE ?auto_48380 ) ( SURFACE-AT ?auto_48379 ?auto_48389 ) ( ON ?auto_48379 ?auto_48383 ) ( CLEAR ?auto_48379 ) ( not ( = ?auto_48378 ?auto_48383 ) ) ( not ( = ?auto_48379 ?auto_48383 ) ) ( not ( = ?auto_48385 ?auto_48383 ) ) ( not ( = ?auto_48387 ?auto_48383 ) ) ( SURFACE-AT ?auto_48382 ?auto_48390 ) ( CLEAR ?auto_48382 ) ( IS-CRATE ?auto_48387 ) ( not ( = ?auto_48378 ?auto_48382 ) ) ( not ( = ?auto_48379 ?auto_48382 ) ) ( not ( = ?auto_48385 ?auto_48382 ) ) ( not ( = ?auto_48387 ?auto_48382 ) ) ( not ( = ?auto_48383 ?auto_48382 ) ) ( AVAILABLE ?auto_48384 ) ( IN ?auto_48387 ?auto_48381 ) ( TRUCK-AT ?auto_48381 ?auto_48391 ) ( not ( = ?auto_48391 ?auto_48390 ) ) ( not ( = ?auto_48388 ?auto_48391 ) ) ( not ( = ?auto_48389 ?auto_48391 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48381 ?auto_48391 ?auto_48390 )
      ( MAKE-ON ?auto_48378 ?auto_48379 )
      ( MAKE-ON-VERIFY ?auto_48378 ?auto_48379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48392 - SURFACE
      ?auto_48393 - SURFACE
    )
    :vars
    (
      ?auto_48399 - HOIST
      ?auto_48397 - PLACE
      ?auto_48398 - PLACE
      ?auto_48405 - HOIST
      ?auto_48400 - SURFACE
      ?auto_48401 - SURFACE
      ?auto_48402 - PLACE
      ?auto_48395 - HOIST
      ?auto_48396 - SURFACE
      ?auto_48403 - SURFACE
      ?auto_48394 - TRUCK
      ?auto_48404 - PLACE
      ?auto_48406 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48399 ?auto_48397 ) ( IS-CRATE ?auto_48392 ) ( not ( = ?auto_48392 ?auto_48393 ) ) ( not ( = ?auto_48398 ?auto_48397 ) ) ( HOIST-AT ?auto_48405 ?auto_48398 ) ( not ( = ?auto_48399 ?auto_48405 ) ) ( AVAILABLE ?auto_48405 ) ( SURFACE-AT ?auto_48392 ?auto_48398 ) ( ON ?auto_48392 ?auto_48400 ) ( CLEAR ?auto_48392 ) ( not ( = ?auto_48392 ?auto_48400 ) ) ( not ( = ?auto_48393 ?auto_48400 ) ) ( IS-CRATE ?auto_48393 ) ( not ( = ?auto_48392 ?auto_48401 ) ) ( not ( = ?auto_48393 ?auto_48401 ) ) ( not ( = ?auto_48400 ?auto_48401 ) ) ( not ( = ?auto_48402 ?auto_48397 ) ) ( not ( = ?auto_48398 ?auto_48402 ) ) ( HOIST-AT ?auto_48395 ?auto_48402 ) ( not ( = ?auto_48399 ?auto_48395 ) ) ( not ( = ?auto_48405 ?auto_48395 ) ) ( AVAILABLE ?auto_48395 ) ( SURFACE-AT ?auto_48393 ?auto_48402 ) ( ON ?auto_48393 ?auto_48396 ) ( CLEAR ?auto_48393 ) ( not ( = ?auto_48392 ?auto_48396 ) ) ( not ( = ?auto_48393 ?auto_48396 ) ) ( not ( = ?auto_48400 ?auto_48396 ) ) ( not ( = ?auto_48401 ?auto_48396 ) ) ( SURFACE-AT ?auto_48403 ?auto_48397 ) ( CLEAR ?auto_48403 ) ( IS-CRATE ?auto_48401 ) ( not ( = ?auto_48392 ?auto_48403 ) ) ( not ( = ?auto_48393 ?auto_48403 ) ) ( not ( = ?auto_48400 ?auto_48403 ) ) ( not ( = ?auto_48401 ?auto_48403 ) ) ( not ( = ?auto_48396 ?auto_48403 ) ) ( AVAILABLE ?auto_48399 ) ( TRUCK-AT ?auto_48394 ?auto_48404 ) ( not ( = ?auto_48404 ?auto_48397 ) ) ( not ( = ?auto_48398 ?auto_48404 ) ) ( not ( = ?auto_48402 ?auto_48404 ) ) ( HOIST-AT ?auto_48406 ?auto_48404 ) ( LIFTING ?auto_48406 ?auto_48401 ) ( not ( = ?auto_48399 ?auto_48406 ) ) ( not ( = ?auto_48405 ?auto_48406 ) ) ( not ( = ?auto_48395 ?auto_48406 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48406 ?auto_48401 ?auto_48394 ?auto_48404 )
      ( MAKE-ON ?auto_48392 ?auto_48393 )
      ( MAKE-ON-VERIFY ?auto_48392 ?auto_48393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48407 - SURFACE
      ?auto_48408 - SURFACE
    )
    :vars
    (
      ?auto_48418 - HOIST
      ?auto_48416 - PLACE
      ?auto_48414 - PLACE
      ?auto_48411 - HOIST
      ?auto_48412 - SURFACE
      ?auto_48421 - SURFACE
      ?auto_48413 - PLACE
      ?auto_48417 - HOIST
      ?auto_48420 - SURFACE
      ?auto_48419 - SURFACE
      ?auto_48409 - TRUCK
      ?auto_48415 - PLACE
      ?auto_48410 - HOIST
      ?auto_48422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48418 ?auto_48416 ) ( IS-CRATE ?auto_48407 ) ( not ( = ?auto_48407 ?auto_48408 ) ) ( not ( = ?auto_48414 ?auto_48416 ) ) ( HOIST-AT ?auto_48411 ?auto_48414 ) ( not ( = ?auto_48418 ?auto_48411 ) ) ( AVAILABLE ?auto_48411 ) ( SURFACE-AT ?auto_48407 ?auto_48414 ) ( ON ?auto_48407 ?auto_48412 ) ( CLEAR ?auto_48407 ) ( not ( = ?auto_48407 ?auto_48412 ) ) ( not ( = ?auto_48408 ?auto_48412 ) ) ( IS-CRATE ?auto_48408 ) ( not ( = ?auto_48407 ?auto_48421 ) ) ( not ( = ?auto_48408 ?auto_48421 ) ) ( not ( = ?auto_48412 ?auto_48421 ) ) ( not ( = ?auto_48413 ?auto_48416 ) ) ( not ( = ?auto_48414 ?auto_48413 ) ) ( HOIST-AT ?auto_48417 ?auto_48413 ) ( not ( = ?auto_48418 ?auto_48417 ) ) ( not ( = ?auto_48411 ?auto_48417 ) ) ( AVAILABLE ?auto_48417 ) ( SURFACE-AT ?auto_48408 ?auto_48413 ) ( ON ?auto_48408 ?auto_48420 ) ( CLEAR ?auto_48408 ) ( not ( = ?auto_48407 ?auto_48420 ) ) ( not ( = ?auto_48408 ?auto_48420 ) ) ( not ( = ?auto_48412 ?auto_48420 ) ) ( not ( = ?auto_48421 ?auto_48420 ) ) ( SURFACE-AT ?auto_48419 ?auto_48416 ) ( CLEAR ?auto_48419 ) ( IS-CRATE ?auto_48421 ) ( not ( = ?auto_48407 ?auto_48419 ) ) ( not ( = ?auto_48408 ?auto_48419 ) ) ( not ( = ?auto_48412 ?auto_48419 ) ) ( not ( = ?auto_48421 ?auto_48419 ) ) ( not ( = ?auto_48420 ?auto_48419 ) ) ( AVAILABLE ?auto_48418 ) ( TRUCK-AT ?auto_48409 ?auto_48415 ) ( not ( = ?auto_48415 ?auto_48416 ) ) ( not ( = ?auto_48414 ?auto_48415 ) ) ( not ( = ?auto_48413 ?auto_48415 ) ) ( HOIST-AT ?auto_48410 ?auto_48415 ) ( not ( = ?auto_48418 ?auto_48410 ) ) ( not ( = ?auto_48411 ?auto_48410 ) ) ( not ( = ?auto_48417 ?auto_48410 ) ) ( AVAILABLE ?auto_48410 ) ( SURFACE-AT ?auto_48421 ?auto_48415 ) ( ON ?auto_48421 ?auto_48422 ) ( CLEAR ?auto_48421 ) ( not ( = ?auto_48407 ?auto_48422 ) ) ( not ( = ?auto_48408 ?auto_48422 ) ) ( not ( = ?auto_48412 ?auto_48422 ) ) ( not ( = ?auto_48421 ?auto_48422 ) ) ( not ( = ?auto_48420 ?auto_48422 ) ) ( not ( = ?auto_48419 ?auto_48422 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48410 ?auto_48421 ?auto_48422 ?auto_48415 )
      ( MAKE-ON ?auto_48407 ?auto_48408 )
      ( MAKE-ON-VERIFY ?auto_48407 ?auto_48408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48423 - SURFACE
      ?auto_48424 - SURFACE
    )
    :vars
    (
      ?auto_48435 - HOIST
      ?auto_48428 - PLACE
      ?auto_48433 - PLACE
      ?auto_48434 - HOIST
      ?auto_48425 - SURFACE
      ?auto_48430 - SURFACE
      ?auto_48431 - PLACE
      ?auto_48436 - HOIST
      ?auto_48427 - SURFACE
      ?auto_48432 - SURFACE
      ?auto_48429 - PLACE
      ?auto_48426 - HOIST
      ?auto_48438 - SURFACE
      ?auto_48437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48435 ?auto_48428 ) ( IS-CRATE ?auto_48423 ) ( not ( = ?auto_48423 ?auto_48424 ) ) ( not ( = ?auto_48433 ?auto_48428 ) ) ( HOIST-AT ?auto_48434 ?auto_48433 ) ( not ( = ?auto_48435 ?auto_48434 ) ) ( AVAILABLE ?auto_48434 ) ( SURFACE-AT ?auto_48423 ?auto_48433 ) ( ON ?auto_48423 ?auto_48425 ) ( CLEAR ?auto_48423 ) ( not ( = ?auto_48423 ?auto_48425 ) ) ( not ( = ?auto_48424 ?auto_48425 ) ) ( IS-CRATE ?auto_48424 ) ( not ( = ?auto_48423 ?auto_48430 ) ) ( not ( = ?auto_48424 ?auto_48430 ) ) ( not ( = ?auto_48425 ?auto_48430 ) ) ( not ( = ?auto_48431 ?auto_48428 ) ) ( not ( = ?auto_48433 ?auto_48431 ) ) ( HOIST-AT ?auto_48436 ?auto_48431 ) ( not ( = ?auto_48435 ?auto_48436 ) ) ( not ( = ?auto_48434 ?auto_48436 ) ) ( AVAILABLE ?auto_48436 ) ( SURFACE-AT ?auto_48424 ?auto_48431 ) ( ON ?auto_48424 ?auto_48427 ) ( CLEAR ?auto_48424 ) ( not ( = ?auto_48423 ?auto_48427 ) ) ( not ( = ?auto_48424 ?auto_48427 ) ) ( not ( = ?auto_48425 ?auto_48427 ) ) ( not ( = ?auto_48430 ?auto_48427 ) ) ( SURFACE-AT ?auto_48432 ?auto_48428 ) ( CLEAR ?auto_48432 ) ( IS-CRATE ?auto_48430 ) ( not ( = ?auto_48423 ?auto_48432 ) ) ( not ( = ?auto_48424 ?auto_48432 ) ) ( not ( = ?auto_48425 ?auto_48432 ) ) ( not ( = ?auto_48430 ?auto_48432 ) ) ( not ( = ?auto_48427 ?auto_48432 ) ) ( AVAILABLE ?auto_48435 ) ( not ( = ?auto_48429 ?auto_48428 ) ) ( not ( = ?auto_48433 ?auto_48429 ) ) ( not ( = ?auto_48431 ?auto_48429 ) ) ( HOIST-AT ?auto_48426 ?auto_48429 ) ( not ( = ?auto_48435 ?auto_48426 ) ) ( not ( = ?auto_48434 ?auto_48426 ) ) ( not ( = ?auto_48436 ?auto_48426 ) ) ( AVAILABLE ?auto_48426 ) ( SURFACE-AT ?auto_48430 ?auto_48429 ) ( ON ?auto_48430 ?auto_48438 ) ( CLEAR ?auto_48430 ) ( not ( = ?auto_48423 ?auto_48438 ) ) ( not ( = ?auto_48424 ?auto_48438 ) ) ( not ( = ?auto_48425 ?auto_48438 ) ) ( not ( = ?auto_48430 ?auto_48438 ) ) ( not ( = ?auto_48427 ?auto_48438 ) ) ( not ( = ?auto_48432 ?auto_48438 ) ) ( TRUCK-AT ?auto_48437 ?auto_48428 ) )
    :subtasks
    ( ( !DRIVE ?auto_48437 ?auto_48428 ?auto_48429 )
      ( MAKE-ON ?auto_48423 ?auto_48424 )
      ( MAKE-ON-VERIFY ?auto_48423 ?auto_48424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48439 - SURFACE
      ?auto_48440 - SURFACE
    )
    :vars
    (
      ?auto_48443 - HOIST
      ?auto_48452 - PLACE
      ?auto_48453 - PLACE
      ?auto_48444 - HOIST
      ?auto_48454 - SURFACE
      ?auto_48441 - SURFACE
      ?auto_48447 - PLACE
      ?auto_48450 - HOIST
      ?auto_48448 - SURFACE
      ?auto_48442 - SURFACE
      ?auto_48445 - PLACE
      ?auto_48449 - HOIST
      ?auto_48451 - SURFACE
      ?auto_48446 - TRUCK
      ?auto_48455 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48443 ?auto_48452 ) ( IS-CRATE ?auto_48439 ) ( not ( = ?auto_48439 ?auto_48440 ) ) ( not ( = ?auto_48453 ?auto_48452 ) ) ( HOIST-AT ?auto_48444 ?auto_48453 ) ( not ( = ?auto_48443 ?auto_48444 ) ) ( AVAILABLE ?auto_48444 ) ( SURFACE-AT ?auto_48439 ?auto_48453 ) ( ON ?auto_48439 ?auto_48454 ) ( CLEAR ?auto_48439 ) ( not ( = ?auto_48439 ?auto_48454 ) ) ( not ( = ?auto_48440 ?auto_48454 ) ) ( IS-CRATE ?auto_48440 ) ( not ( = ?auto_48439 ?auto_48441 ) ) ( not ( = ?auto_48440 ?auto_48441 ) ) ( not ( = ?auto_48454 ?auto_48441 ) ) ( not ( = ?auto_48447 ?auto_48452 ) ) ( not ( = ?auto_48453 ?auto_48447 ) ) ( HOIST-AT ?auto_48450 ?auto_48447 ) ( not ( = ?auto_48443 ?auto_48450 ) ) ( not ( = ?auto_48444 ?auto_48450 ) ) ( AVAILABLE ?auto_48450 ) ( SURFACE-AT ?auto_48440 ?auto_48447 ) ( ON ?auto_48440 ?auto_48448 ) ( CLEAR ?auto_48440 ) ( not ( = ?auto_48439 ?auto_48448 ) ) ( not ( = ?auto_48440 ?auto_48448 ) ) ( not ( = ?auto_48454 ?auto_48448 ) ) ( not ( = ?auto_48441 ?auto_48448 ) ) ( IS-CRATE ?auto_48441 ) ( not ( = ?auto_48439 ?auto_48442 ) ) ( not ( = ?auto_48440 ?auto_48442 ) ) ( not ( = ?auto_48454 ?auto_48442 ) ) ( not ( = ?auto_48441 ?auto_48442 ) ) ( not ( = ?auto_48448 ?auto_48442 ) ) ( not ( = ?auto_48445 ?auto_48452 ) ) ( not ( = ?auto_48453 ?auto_48445 ) ) ( not ( = ?auto_48447 ?auto_48445 ) ) ( HOIST-AT ?auto_48449 ?auto_48445 ) ( not ( = ?auto_48443 ?auto_48449 ) ) ( not ( = ?auto_48444 ?auto_48449 ) ) ( not ( = ?auto_48450 ?auto_48449 ) ) ( AVAILABLE ?auto_48449 ) ( SURFACE-AT ?auto_48441 ?auto_48445 ) ( ON ?auto_48441 ?auto_48451 ) ( CLEAR ?auto_48441 ) ( not ( = ?auto_48439 ?auto_48451 ) ) ( not ( = ?auto_48440 ?auto_48451 ) ) ( not ( = ?auto_48454 ?auto_48451 ) ) ( not ( = ?auto_48441 ?auto_48451 ) ) ( not ( = ?auto_48448 ?auto_48451 ) ) ( not ( = ?auto_48442 ?auto_48451 ) ) ( TRUCK-AT ?auto_48446 ?auto_48452 ) ( SURFACE-AT ?auto_48455 ?auto_48452 ) ( CLEAR ?auto_48455 ) ( LIFTING ?auto_48443 ?auto_48442 ) ( IS-CRATE ?auto_48442 ) ( not ( = ?auto_48439 ?auto_48455 ) ) ( not ( = ?auto_48440 ?auto_48455 ) ) ( not ( = ?auto_48454 ?auto_48455 ) ) ( not ( = ?auto_48441 ?auto_48455 ) ) ( not ( = ?auto_48448 ?auto_48455 ) ) ( not ( = ?auto_48442 ?auto_48455 ) ) ( not ( = ?auto_48451 ?auto_48455 ) ) )
    :subtasks
    ( ( !DROP ?auto_48443 ?auto_48442 ?auto_48455 ?auto_48452 )
      ( MAKE-ON ?auto_48439 ?auto_48440 )
      ( MAKE-ON-VERIFY ?auto_48439 ?auto_48440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48456 - SURFACE
      ?auto_48457 - SURFACE
    )
    :vars
    (
      ?auto_48469 - HOIST
      ?auto_48461 - PLACE
      ?auto_48468 - PLACE
      ?auto_48464 - HOIST
      ?auto_48462 - SURFACE
      ?auto_48470 - SURFACE
      ?auto_48465 - PLACE
      ?auto_48471 - HOIST
      ?auto_48459 - SURFACE
      ?auto_48463 - SURFACE
      ?auto_48472 - PLACE
      ?auto_48460 - HOIST
      ?auto_48467 - SURFACE
      ?auto_48458 - TRUCK
      ?auto_48466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48469 ?auto_48461 ) ( IS-CRATE ?auto_48456 ) ( not ( = ?auto_48456 ?auto_48457 ) ) ( not ( = ?auto_48468 ?auto_48461 ) ) ( HOIST-AT ?auto_48464 ?auto_48468 ) ( not ( = ?auto_48469 ?auto_48464 ) ) ( AVAILABLE ?auto_48464 ) ( SURFACE-AT ?auto_48456 ?auto_48468 ) ( ON ?auto_48456 ?auto_48462 ) ( CLEAR ?auto_48456 ) ( not ( = ?auto_48456 ?auto_48462 ) ) ( not ( = ?auto_48457 ?auto_48462 ) ) ( IS-CRATE ?auto_48457 ) ( not ( = ?auto_48456 ?auto_48470 ) ) ( not ( = ?auto_48457 ?auto_48470 ) ) ( not ( = ?auto_48462 ?auto_48470 ) ) ( not ( = ?auto_48465 ?auto_48461 ) ) ( not ( = ?auto_48468 ?auto_48465 ) ) ( HOIST-AT ?auto_48471 ?auto_48465 ) ( not ( = ?auto_48469 ?auto_48471 ) ) ( not ( = ?auto_48464 ?auto_48471 ) ) ( AVAILABLE ?auto_48471 ) ( SURFACE-AT ?auto_48457 ?auto_48465 ) ( ON ?auto_48457 ?auto_48459 ) ( CLEAR ?auto_48457 ) ( not ( = ?auto_48456 ?auto_48459 ) ) ( not ( = ?auto_48457 ?auto_48459 ) ) ( not ( = ?auto_48462 ?auto_48459 ) ) ( not ( = ?auto_48470 ?auto_48459 ) ) ( IS-CRATE ?auto_48470 ) ( not ( = ?auto_48456 ?auto_48463 ) ) ( not ( = ?auto_48457 ?auto_48463 ) ) ( not ( = ?auto_48462 ?auto_48463 ) ) ( not ( = ?auto_48470 ?auto_48463 ) ) ( not ( = ?auto_48459 ?auto_48463 ) ) ( not ( = ?auto_48472 ?auto_48461 ) ) ( not ( = ?auto_48468 ?auto_48472 ) ) ( not ( = ?auto_48465 ?auto_48472 ) ) ( HOIST-AT ?auto_48460 ?auto_48472 ) ( not ( = ?auto_48469 ?auto_48460 ) ) ( not ( = ?auto_48464 ?auto_48460 ) ) ( not ( = ?auto_48471 ?auto_48460 ) ) ( AVAILABLE ?auto_48460 ) ( SURFACE-AT ?auto_48470 ?auto_48472 ) ( ON ?auto_48470 ?auto_48467 ) ( CLEAR ?auto_48470 ) ( not ( = ?auto_48456 ?auto_48467 ) ) ( not ( = ?auto_48457 ?auto_48467 ) ) ( not ( = ?auto_48462 ?auto_48467 ) ) ( not ( = ?auto_48470 ?auto_48467 ) ) ( not ( = ?auto_48459 ?auto_48467 ) ) ( not ( = ?auto_48463 ?auto_48467 ) ) ( TRUCK-AT ?auto_48458 ?auto_48461 ) ( SURFACE-AT ?auto_48466 ?auto_48461 ) ( CLEAR ?auto_48466 ) ( IS-CRATE ?auto_48463 ) ( not ( = ?auto_48456 ?auto_48466 ) ) ( not ( = ?auto_48457 ?auto_48466 ) ) ( not ( = ?auto_48462 ?auto_48466 ) ) ( not ( = ?auto_48470 ?auto_48466 ) ) ( not ( = ?auto_48459 ?auto_48466 ) ) ( not ( = ?auto_48463 ?auto_48466 ) ) ( not ( = ?auto_48467 ?auto_48466 ) ) ( AVAILABLE ?auto_48469 ) ( IN ?auto_48463 ?auto_48458 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48469 ?auto_48463 ?auto_48458 ?auto_48461 )
      ( MAKE-ON ?auto_48456 ?auto_48457 )
      ( MAKE-ON-VERIFY ?auto_48456 ?auto_48457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48473 - SURFACE
      ?auto_48474 - SURFACE
    )
    :vars
    (
      ?auto_48478 - HOIST
      ?auto_48483 - PLACE
      ?auto_48479 - PLACE
      ?auto_48488 - HOIST
      ?auto_48477 - SURFACE
      ?auto_48476 - SURFACE
      ?auto_48480 - PLACE
      ?auto_48484 - HOIST
      ?auto_48475 - SURFACE
      ?auto_48487 - SURFACE
      ?auto_48481 - PLACE
      ?auto_48486 - HOIST
      ?auto_48485 - SURFACE
      ?auto_48489 - SURFACE
      ?auto_48482 - TRUCK
      ?auto_48490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48478 ?auto_48483 ) ( IS-CRATE ?auto_48473 ) ( not ( = ?auto_48473 ?auto_48474 ) ) ( not ( = ?auto_48479 ?auto_48483 ) ) ( HOIST-AT ?auto_48488 ?auto_48479 ) ( not ( = ?auto_48478 ?auto_48488 ) ) ( AVAILABLE ?auto_48488 ) ( SURFACE-AT ?auto_48473 ?auto_48479 ) ( ON ?auto_48473 ?auto_48477 ) ( CLEAR ?auto_48473 ) ( not ( = ?auto_48473 ?auto_48477 ) ) ( not ( = ?auto_48474 ?auto_48477 ) ) ( IS-CRATE ?auto_48474 ) ( not ( = ?auto_48473 ?auto_48476 ) ) ( not ( = ?auto_48474 ?auto_48476 ) ) ( not ( = ?auto_48477 ?auto_48476 ) ) ( not ( = ?auto_48480 ?auto_48483 ) ) ( not ( = ?auto_48479 ?auto_48480 ) ) ( HOIST-AT ?auto_48484 ?auto_48480 ) ( not ( = ?auto_48478 ?auto_48484 ) ) ( not ( = ?auto_48488 ?auto_48484 ) ) ( AVAILABLE ?auto_48484 ) ( SURFACE-AT ?auto_48474 ?auto_48480 ) ( ON ?auto_48474 ?auto_48475 ) ( CLEAR ?auto_48474 ) ( not ( = ?auto_48473 ?auto_48475 ) ) ( not ( = ?auto_48474 ?auto_48475 ) ) ( not ( = ?auto_48477 ?auto_48475 ) ) ( not ( = ?auto_48476 ?auto_48475 ) ) ( IS-CRATE ?auto_48476 ) ( not ( = ?auto_48473 ?auto_48487 ) ) ( not ( = ?auto_48474 ?auto_48487 ) ) ( not ( = ?auto_48477 ?auto_48487 ) ) ( not ( = ?auto_48476 ?auto_48487 ) ) ( not ( = ?auto_48475 ?auto_48487 ) ) ( not ( = ?auto_48481 ?auto_48483 ) ) ( not ( = ?auto_48479 ?auto_48481 ) ) ( not ( = ?auto_48480 ?auto_48481 ) ) ( HOIST-AT ?auto_48486 ?auto_48481 ) ( not ( = ?auto_48478 ?auto_48486 ) ) ( not ( = ?auto_48488 ?auto_48486 ) ) ( not ( = ?auto_48484 ?auto_48486 ) ) ( AVAILABLE ?auto_48486 ) ( SURFACE-AT ?auto_48476 ?auto_48481 ) ( ON ?auto_48476 ?auto_48485 ) ( CLEAR ?auto_48476 ) ( not ( = ?auto_48473 ?auto_48485 ) ) ( not ( = ?auto_48474 ?auto_48485 ) ) ( not ( = ?auto_48477 ?auto_48485 ) ) ( not ( = ?auto_48476 ?auto_48485 ) ) ( not ( = ?auto_48475 ?auto_48485 ) ) ( not ( = ?auto_48487 ?auto_48485 ) ) ( SURFACE-AT ?auto_48489 ?auto_48483 ) ( CLEAR ?auto_48489 ) ( IS-CRATE ?auto_48487 ) ( not ( = ?auto_48473 ?auto_48489 ) ) ( not ( = ?auto_48474 ?auto_48489 ) ) ( not ( = ?auto_48477 ?auto_48489 ) ) ( not ( = ?auto_48476 ?auto_48489 ) ) ( not ( = ?auto_48475 ?auto_48489 ) ) ( not ( = ?auto_48487 ?auto_48489 ) ) ( not ( = ?auto_48485 ?auto_48489 ) ) ( AVAILABLE ?auto_48478 ) ( IN ?auto_48487 ?auto_48482 ) ( TRUCK-AT ?auto_48482 ?auto_48490 ) ( not ( = ?auto_48490 ?auto_48483 ) ) ( not ( = ?auto_48479 ?auto_48490 ) ) ( not ( = ?auto_48480 ?auto_48490 ) ) ( not ( = ?auto_48481 ?auto_48490 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48482 ?auto_48490 ?auto_48483 )
      ( MAKE-ON ?auto_48473 ?auto_48474 )
      ( MAKE-ON-VERIFY ?auto_48473 ?auto_48474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48491 - SURFACE
      ?auto_48492 - SURFACE
    )
    :vars
    (
      ?auto_48504 - HOIST
      ?auto_48506 - PLACE
      ?auto_48495 - PLACE
      ?auto_48497 - HOIST
      ?auto_48501 - SURFACE
      ?auto_48502 - SURFACE
      ?auto_48500 - PLACE
      ?auto_48496 - HOIST
      ?auto_48507 - SURFACE
      ?auto_48494 - SURFACE
      ?auto_48505 - PLACE
      ?auto_48493 - HOIST
      ?auto_48503 - SURFACE
      ?auto_48498 - SURFACE
      ?auto_48499 - TRUCK
      ?auto_48508 - PLACE
      ?auto_48509 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48504 ?auto_48506 ) ( IS-CRATE ?auto_48491 ) ( not ( = ?auto_48491 ?auto_48492 ) ) ( not ( = ?auto_48495 ?auto_48506 ) ) ( HOIST-AT ?auto_48497 ?auto_48495 ) ( not ( = ?auto_48504 ?auto_48497 ) ) ( AVAILABLE ?auto_48497 ) ( SURFACE-AT ?auto_48491 ?auto_48495 ) ( ON ?auto_48491 ?auto_48501 ) ( CLEAR ?auto_48491 ) ( not ( = ?auto_48491 ?auto_48501 ) ) ( not ( = ?auto_48492 ?auto_48501 ) ) ( IS-CRATE ?auto_48492 ) ( not ( = ?auto_48491 ?auto_48502 ) ) ( not ( = ?auto_48492 ?auto_48502 ) ) ( not ( = ?auto_48501 ?auto_48502 ) ) ( not ( = ?auto_48500 ?auto_48506 ) ) ( not ( = ?auto_48495 ?auto_48500 ) ) ( HOIST-AT ?auto_48496 ?auto_48500 ) ( not ( = ?auto_48504 ?auto_48496 ) ) ( not ( = ?auto_48497 ?auto_48496 ) ) ( AVAILABLE ?auto_48496 ) ( SURFACE-AT ?auto_48492 ?auto_48500 ) ( ON ?auto_48492 ?auto_48507 ) ( CLEAR ?auto_48492 ) ( not ( = ?auto_48491 ?auto_48507 ) ) ( not ( = ?auto_48492 ?auto_48507 ) ) ( not ( = ?auto_48501 ?auto_48507 ) ) ( not ( = ?auto_48502 ?auto_48507 ) ) ( IS-CRATE ?auto_48502 ) ( not ( = ?auto_48491 ?auto_48494 ) ) ( not ( = ?auto_48492 ?auto_48494 ) ) ( not ( = ?auto_48501 ?auto_48494 ) ) ( not ( = ?auto_48502 ?auto_48494 ) ) ( not ( = ?auto_48507 ?auto_48494 ) ) ( not ( = ?auto_48505 ?auto_48506 ) ) ( not ( = ?auto_48495 ?auto_48505 ) ) ( not ( = ?auto_48500 ?auto_48505 ) ) ( HOIST-AT ?auto_48493 ?auto_48505 ) ( not ( = ?auto_48504 ?auto_48493 ) ) ( not ( = ?auto_48497 ?auto_48493 ) ) ( not ( = ?auto_48496 ?auto_48493 ) ) ( AVAILABLE ?auto_48493 ) ( SURFACE-AT ?auto_48502 ?auto_48505 ) ( ON ?auto_48502 ?auto_48503 ) ( CLEAR ?auto_48502 ) ( not ( = ?auto_48491 ?auto_48503 ) ) ( not ( = ?auto_48492 ?auto_48503 ) ) ( not ( = ?auto_48501 ?auto_48503 ) ) ( not ( = ?auto_48502 ?auto_48503 ) ) ( not ( = ?auto_48507 ?auto_48503 ) ) ( not ( = ?auto_48494 ?auto_48503 ) ) ( SURFACE-AT ?auto_48498 ?auto_48506 ) ( CLEAR ?auto_48498 ) ( IS-CRATE ?auto_48494 ) ( not ( = ?auto_48491 ?auto_48498 ) ) ( not ( = ?auto_48492 ?auto_48498 ) ) ( not ( = ?auto_48501 ?auto_48498 ) ) ( not ( = ?auto_48502 ?auto_48498 ) ) ( not ( = ?auto_48507 ?auto_48498 ) ) ( not ( = ?auto_48494 ?auto_48498 ) ) ( not ( = ?auto_48503 ?auto_48498 ) ) ( AVAILABLE ?auto_48504 ) ( TRUCK-AT ?auto_48499 ?auto_48508 ) ( not ( = ?auto_48508 ?auto_48506 ) ) ( not ( = ?auto_48495 ?auto_48508 ) ) ( not ( = ?auto_48500 ?auto_48508 ) ) ( not ( = ?auto_48505 ?auto_48508 ) ) ( HOIST-AT ?auto_48509 ?auto_48508 ) ( LIFTING ?auto_48509 ?auto_48494 ) ( not ( = ?auto_48504 ?auto_48509 ) ) ( not ( = ?auto_48497 ?auto_48509 ) ) ( not ( = ?auto_48496 ?auto_48509 ) ) ( not ( = ?auto_48493 ?auto_48509 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48509 ?auto_48494 ?auto_48499 ?auto_48508 )
      ( MAKE-ON ?auto_48491 ?auto_48492 )
      ( MAKE-ON-VERIFY ?auto_48491 ?auto_48492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48510 - SURFACE
      ?auto_48511 - SURFACE
    )
    :vars
    (
      ?auto_48513 - HOIST
      ?auto_48528 - PLACE
      ?auto_48521 - PLACE
      ?auto_48514 - HOIST
      ?auto_48527 - SURFACE
      ?auto_48515 - SURFACE
      ?auto_48522 - PLACE
      ?auto_48516 - HOIST
      ?auto_48525 - SURFACE
      ?auto_48523 - SURFACE
      ?auto_48518 - PLACE
      ?auto_48524 - HOIST
      ?auto_48512 - SURFACE
      ?auto_48519 - SURFACE
      ?auto_48517 - TRUCK
      ?auto_48526 - PLACE
      ?auto_48520 - HOIST
      ?auto_48529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48513 ?auto_48528 ) ( IS-CRATE ?auto_48510 ) ( not ( = ?auto_48510 ?auto_48511 ) ) ( not ( = ?auto_48521 ?auto_48528 ) ) ( HOIST-AT ?auto_48514 ?auto_48521 ) ( not ( = ?auto_48513 ?auto_48514 ) ) ( AVAILABLE ?auto_48514 ) ( SURFACE-AT ?auto_48510 ?auto_48521 ) ( ON ?auto_48510 ?auto_48527 ) ( CLEAR ?auto_48510 ) ( not ( = ?auto_48510 ?auto_48527 ) ) ( not ( = ?auto_48511 ?auto_48527 ) ) ( IS-CRATE ?auto_48511 ) ( not ( = ?auto_48510 ?auto_48515 ) ) ( not ( = ?auto_48511 ?auto_48515 ) ) ( not ( = ?auto_48527 ?auto_48515 ) ) ( not ( = ?auto_48522 ?auto_48528 ) ) ( not ( = ?auto_48521 ?auto_48522 ) ) ( HOIST-AT ?auto_48516 ?auto_48522 ) ( not ( = ?auto_48513 ?auto_48516 ) ) ( not ( = ?auto_48514 ?auto_48516 ) ) ( AVAILABLE ?auto_48516 ) ( SURFACE-AT ?auto_48511 ?auto_48522 ) ( ON ?auto_48511 ?auto_48525 ) ( CLEAR ?auto_48511 ) ( not ( = ?auto_48510 ?auto_48525 ) ) ( not ( = ?auto_48511 ?auto_48525 ) ) ( not ( = ?auto_48527 ?auto_48525 ) ) ( not ( = ?auto_48515 ?auto_48525 ) ) ( IS-CRATE ?auto_48515 ) ( not ( = ?auto_48510 ?auto_48523 ) ) ( not ( = ?auto_48511 ?auto_48523 ) ) ( not ( = ?auto_48527 ?auto_48523 ) ) ( not ( = ?auto_48515 ?auto_48523 ) ) ( not ( = ?auto_48525 ?auto_48523 ) ) ( not ( = ?auto_48518 ?auto_48528 ) ) ( not ( = ?auto_48521 ?auto_48518 ) ) ( not ( = ?auto_48522 ?auto_48518 ) ) ( HOIST-AT ?auto_48524 ?auto_48518 ) ( not ( = ?auto_48513 ?auto_48524 ) ) ( not ( = ?auto_48514 ?auto_48524 ) ) ( not ( = ?auto_48516 ?auto_48524 ) ) ( AVAILABLE ?auto_48524 ) ( SURFACE-AT ?auto_48515 ?auto_48518 ) ( ON ?auto_48515 ?auto_48512 ) ( CLEAR ?auto_48515 ) ( not ( = ?auto_48510 ?auto_48512 ) ) ( not ( = ?auto_48511 ?auto_48512 ) ) ( not ( = ?auto_48527 ?auto_48512 ) ) ( not ( = ?auto_48515 ?auto_48512 ) ) ( not ( = ?auto_48525 ?auto_48512 ) ) ( not ( = ?auto_48523 ?auto_48512 ) ) ( SURFACE-AT ?auto_48519 ?auto_48528 ) ( CLEAR ?auto_48519 ) ( IS-CRATE ?auto_48523 ) ( not ( = ?auto_48510 ?auto_48519 ) ) ( not ( = ?auto_48511 ?auto_48519 ) ) ( not ( = ?auto_48527 ?auto_48519 ) ) ( not ( = ?auto_48515 ?auto_48519 ) ) ( not ( = ?auto_48525 ?auto_48519 ) ) ( not ( = ?auto_48523 ?auto_48519 ) ) ( not ( = ?auto_48512 ?auto_48519 ) ) ( AVAILABLE ?auto_48513 ) ( TRUCK-AT ?auto_48517 ?auto_48526 ) ( not ( = ?auto_48526 ?auto_48528 ) ) ( not ( = ?auto_48521 ?auto_48526 ) ) ( not ( = ?auto_48522 ?auto_48526 ) ) ( not ( = ?auto_48518 ?auto_48526 ) ) ( HOIST-AT ?auto_48520 ?auto_48526 ) ( not ( = ?auto_48513 ?auto_48520 ) ) ( not ( = ?auto_48514 ?auto_48520 ) ) ( not ( = ?auto_48516 ?auto_48520 ) ) ( not ( = ?auto_48524 ?auto_48520 ) ) ( AVAILABLE ?auto_48520 ) ( SURFACE-AT ?auto_48523 ?auto_48526 ) ( ON ?auto_48523 ?auto_48529 ) ( CLEAR ?auto_48523 ) ( not ( = ?auto_48510 ?auto_48529 ) ) ( not ( = ?auto_48511 ?auto_48529 ) ) ( not ( = ?auto_48527 ?auto_48529 ) ) ( not ( = ?auto_48515 ?auto_48529 ) ) ( not ( = ?auto_48525 ?auto_48529 ) ) ( not ( = ?auto_48523 ?auto_48529 ) ) ( not ( = ?auto_48512 ?auto_48529 ) ) ( not ( = ?auto_48519 ?auto_48529 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48520 ?auto_48523 ?auto_48529 ?auto_48526 )
      ( MAKE-ON ?auto_48510 ?auto_48511 )
      ( MAKE-ON-VERIFY ?auto_48510 ?auto_48511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48530 - SURFACE
      ?auto_48531 - SURFACE
    )
    :vars
    (
      ?auto_48544 - HOIST
      ?auto_48537 - PLACE
      ?auto_48533 - PLACE
      ?auto_48543 - HOIST
      ?auto_48536 - SURFACE
      ?auto_48545 - SURFACE
      ?auto_48532 - PLACE
      ?auto_48546 - HOIST
      ?auto_48538 - SURFACE
      ?auto_48541 - SURFACE
      ?auto_48548 - PLACE
      ?auto_48539 - HOIST
      ?auto_48535 - SURFACE
      ?auto_48542 - SURFACE
      ?auto_48547 - PLACE
      ?auto_48540 - HOIST
      ?auto_48549 - SURFACE
      ?auto_48534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48544 ?auto_48537 ) ( IS-CRATE ?auto_48530 ) ( not ( = ?auto_48530 ?auto_48531 ) ) ( not ( = ?auto_48533 ?auto_48537 ) ) ( HOIST-AT ?auto_48543 ?auto_48533 ) ( not ( = ?auto_48544 ?auto_48543 ) ) ( AVAILABLE ?auto_48543 ) ( SURFACE-AT ?auto_48530 ?auto_48533 ) ( ON ?auto_48530 ?auto_48536 ) ( CLEAR ?auto_48530 ) ( not ( = ?auto_48530 ?auto_48536 ) ) ( not ( = ?auto_48531 ?auto_48536 ) ) ( IS-CRATE ?auto_48531 ) ( not ( = ?auto_48530 ?auto_48545 ) ) ( not ( = ?auto_48531 ?auto_48545 ) ) ( not ( = ?auto_48536 ?auto_48545 ) ) ( not ( = ?auto_48532 ?auto_48537 ) ) ( not ( = ?auto_48533 ?auto_48532 ) ) ( HOIST-AT ?auto_48546 ?auto_48532 ) ( not ( = ?auto_48544 ?auto_48546 ) ) ( not ( = ?auto_48543 ?auto_48546 ) ) ( AVAILABLE ?auto_48546 ) ( SURFACE-AT ?auto_48531 ?auto_48532 ) ( ON ?auto_48531 ?auto_48538 ) ( CLEAR ?auto_48531 ) ( not ( = ?auto_48530 ?auto_48538 ) ) ( not ( = ?auto_48531 ?auto_48538 ) ) ( not ( = ?auto_48536 ?auto_48538 ) ) ( not ( = ?auto_48545 ?auto_48538 ) ) ( IS-CRATE ?auto_48545 ) ( not ( = ?auto_48530 ?auto_48541 ) ) ( not ( = ?auto_48531 ?auto_48541 ) ) ( not ( = ?auto_48536 ?auto_48541 ) ) ( not ( = ?auto_48545 ?auto_48541 ) ) ( not ( = ?auto_48538 ?auto_48541 ) ) ( not ( = ?auto_48548 ?auto_48537 ) ) ( not ( = ?auto_48533 ?auto_48548 ) ) ( not ( = ?auto_48532 ?auto_48548 ) ) ( HOIST-AT ?auto_48539 ?auto_48548 ) ( not ( = ?auto_48544 ?auto_48539 ) ) ( not ( = ?auto_48543 ?auto_48539 ) ) ( not ( = ?auto_48546 ?auto_48539 ) ) ( AVAILABLE ?auto_48539 ) ( SURFACE-AT ?auto_48545 ?auto_48548 ) ( ON ?auto_48545 ?auto_48535 ) ( CLEAR ?auto_48545 ) ( not ( = ?auto_48530 ?auto_48535 ) ) ( not ( = ?auto_48531 ?auto_48535 ) ) ( not ( = ?auto_48536 ?auto_48535 ) ) ( not ( = ?auto_48545 ?auto_48535 ) ) ( not ( = ?auto_48538 ?auto_48535 ) ) ( not ( = ?auto_48541 ?auto_48535 ) ) ( SURFACE-AT ?auto_48542 ?auto_48537 ) ( CLEAR ?auto_48542 ) ( IS-CRATE ?auto_48541 ) ( not ( = ?auto_48530 ?auto_48542 ) ) ( not ( = ?auto_48531 ?auto_48542 ) ) ( not ( = ?auto_48536 ?auto_48542 ) ) ( not ( = ?auto_48545 ?auto_48542 ) ) ( not ( = ?auto_48538 ?auto_48542 ) ) ( not ( = ?auto_48541 ?auto_48542 ) ) ( not ( = ?auto_48535 ?auto_48542 ) ) ( AVAILABLE ?auto_48544 ) ( not ( = ?auto_48547 ?auto_48537 ) ) ( not ( = ?auto_48533 ?auto_48547 ) ) ( not ( = ?auto_48532 ?auto_48547 ) ) ( not ( = ?auto_48548 ?auto_48547 ) ) ( HOIST-AT ?auto_48540 ?auto_48547 ) ( not ( = ?auto_48544 ?auto_48540 ) ) ( not ( = ?auto_48543 ?auto_48540 ) ) ( not ( = ?auto_48546 ?auto_48540 ) ) ( not ( = ?auto_48539 ?auto_48540 ) ) ( AVAILABLE ?auto_48540 ) ( SURFACE-AT ?auto_48541 ?auto_48547 ) ( ON ?auto_48541 ?auto_48549 ) ( CLEAR ?auto_48541 ) ( not ( = ?auto_48530 ?auto_48549 ) ) ( not ( = ?auto_48531 ?auto_48549 ) ) ( not ( = ?auto_48536 ?auto_48549 ) ) ( not ( = ?auto_48545 ?auto_48549 ) ) ( not ( = ?auto_48538 ?auto_48549 ) ) ( not ( = ?auto_48541 ?auto_48549 ) ) ( not ( = ?auto_48535 ?auto_48549 ) ) ( not ( = ?auto_48542 ?auto_48549 ) ) ( TRUCK-AT ?auto_48534 ?auto_48537 ) )
    :subtasks
    ( ( !DRIVE ?auto_48534 ?auto_48537 ?auto_48547 )
      ( MAKE-ON ?auto_48530 ?auto_48531 )
      ( MAKE-ON-VERIFY ?auto_48530 ?auto_48531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48550 - SURFACE
      ?auto_48551 - SURFACE
    )
    :vars
    (
      ?auto_48560 - HOIST
      ?auto_48552 - PLACE
      ?auto_48558 - PLACE
      ?auto_48555 - HOIST
      ?auto_48554 - SURFACE
      ?auto_48562 - SURFACE
      ?auto_48553 - PLACE
      ?auto_48568 - HOIST
      ?auto_48557 - SURFACE
      ?auto_48569 - SURFACE
      ?auto_48565 - PLACE
      ?auto_48564 - HOIST
      ?auto_48561 - SURFACE
      ?auto_48556 - SURFACE
      ?auto_48567 - PLACE
      ?auto_48559 - HOIST
      ?auto_48566 - SURFACE
      ?auto_48563 - TRUCK
      ?auto_48570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48560 ?auto_48552 ) ( IS-CRATE ?auto_48550 ) ( not ( = ?auto_48550 ?auto_48551 ) ) ( not ( = ?auto_48558 ?auto_48552 ) ) ( HOIST-AT ?auto_48555 ?auto_48558 ) ( not ( = ?auto_48560 ?auto_48555 ) ) ( AVAILABLE ?auto_48555 ) ( SURFACE-AT ?auto_48550 ?auto_48558 ) ( ON ?auto_48550 ?auto_48554 ) ( CLEAR ?auto_48550 ) ( not ( = ?auto_48550 ?auto_48554 ) ) ( not ( = ?auto_48551 ?auto_48554 ) ) ( IS-CRATE ?auto_48551 ) ( not ( = ?auto_48550 ?auto_48562 ) ) ( not ( = ?auto_48551 ?auto_48562 ) ) ( not ( = ?auto_48554 ?auto_48562 ) ) ( not ( = ?auto_48553 ?auto_48552 ) ) ( not ( = ?auto_48558 ?auto_48553 ) ) ( HOIST-AT ?auto_48568 ?auto_48553 ) ( not ( = ?auto_48560 ?auto_48568 ) ) ( not ( = ?auto_48555 ?auto_48568 ) ) ( AVAILABLE ?auto_48568 ) ( SURFACE-AT ?auto_48551 ?auto_48553 ) ( ON ?auto_48551 ?auto_48557 ) ( CLEAR ?auto_48551 ) ( not ( = ?auto_48550 ?auto_48557 ) ) ( not ( = ?auto_48551 ?auto_48557 ) ) ( not ( = ?auto_48554 ?auto_48557 ) ) ( not ( = ?auto_48562 ?auto_48557 ) ) ( IS-CRATE ?auto_48562 ) ( not ( = ?auto_48550 ?auto_48569 ) ) ( not ( = ?auto_48551 ?auto_48569 ) ) ( not ( = ?auto_48554 ?auto_48569 ) ) ( not ( = ?auto_48562 ?auto_48569 ) ) ( not ( = ?auto_48557 ?auto_48569 ) ) ( not ( = ?auto_48565 ?auto_48552 ) ) ( not ( = ?auto_48558 ?auto_48565 ) ) ( not ( = ?auto_48553 ?auto_48565 ) ) ( HOIST-AT ?auto_48564 ?auto_48565 ) ( not ( = ?auto_48560 ?auto_48564 ) ) ( not ( = ?auto_48555 ?auto_48564 ) ) ( not ( = ?auto_48568 ?auto_48564 ) ) ( AVAILABLE ?auto_48564 ) ( SURFACE-AT ?auto_48562 ?auto_48565 ) ( ON ?auto_48562 ?auto_48561 ) ( CLEAR ?auto_48562 ) ( not ( = ?auto_48550 ?auto_48561 ) ) ( not ( = ?auto_48551 ?auto_48561 ) ) ( not ( = ?auto_48554 ?auto_48561 ) ) ( not ( = ?auto_48562 ?auto_48561 ) ) ( not ( = ?auto_48557 ?auto_48561 ) ) ( not ( = ?auto_48569 ?auto_48561 ) ) ( IS-CRATE ?auto_48569 ) ( not ( = ?auto_48550 ?auto_48556 ) ) ( not ( = ?auto_48551 ?auto_48556 ) ) ( not ( = ?auto_48554 ?auto_48556 ) ) ( not ( = ?auto_48562 ?auto_48556 ) ) ( not ( = ?auto_48557 ?auto_48556 ) ) ( not ( = ?auto_48569 ?auto_48556 ) ) ( not ( = ?auto_48561 ?auto_48556 ) ) ( not ( = ?auto_48567 ?auto_48552 ) ) ( not ( = ?auto_48558 ?auto_48567 ) ) ( not ( = ?auto_48553 ?auto_48567 ) ) ( not ( = ?auto_48565 ?auto_48567 ) ) ( HOIST-AT ?auto_48559 ?auto_48567 ) ( not ( = ?auto_48560 ?auto_48559 ) ) ( not ( = ?auto_48555 ?auto_48559 ) ) ( not ( = ?auto_48568 ?auto_48559 ) ) ( not ( = ?auto_48564 ?auto_48559 ) ) ( AVAILABLE ?auto_48559 ) ( SURFACE-AT ?auto_48569 ?auto_48567 ) ( ON ?auto_48569 ?auto_48566 ) ( CLEAR ?auto_48569 ) ( not ( = ?auto_48550 ?auto_48566 ) ) ( not ( = ?auto_48551 ?auto_48566 ) ) ( not ( = ?auto_48554 ?auto_48566 ) ) ( not ( = ?auto_48562 ?auto_48566 ) ) ( not ( = ?auto_48557 ?auto_48566 ) ) ( not ( = ?auto_48569 ?auto_48566 ) ) ( not ( = ?auto_48561 ?auto_48566 ) ) ( not ( = ?auto_48556 ?auto_48566 ) ) ( TRUCK-AT ?auto_48563 ?auto_48552 ) ( SURFACE-AT ?auto_48570 ?auto_48552 ) ( CLEAR ?auto_48570 ) ( LIFTING ?auto_48560 ?auto_48556 ) ( IS-CRATE ?auto_48556 ) ( not ( = ?auto_48550 ?auto_48570 ) ) ( not ( = ?auto_48551 ?auto_48570 ) ) ( not ( = ?auto_48554 ?auto_48570 ) ) ( not ( = ?auto_48562 ?auto_48570 ) ) ( not ( = ?auto_48557 ?auto_48570 ) ) ( not ( = ?auto_48569 ?auto_48570 ) ) ( not ( = ?auto_48561 ?auto_48570 ) ) ( not ( = ?auto_48556 ?auto_48570 ) ) ( not ( = ?auto_48566 ?auto_48570 ) ) )
    :subtasks
    ( ( !DROP ?auto_48560 ?auto_48556 ?auto_48570 ?auto_48552 )
      ( MAKE-ON ?auto_48550 ?auto_48551 )
      ( MAKE-ON-VERIFY ?auto_48550 ?auto_48551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48571 - SURFACE
      ?auto_48572 - SURFACE
    )
    :vars
    (
      ?auto_48573 - HOIST
      ?auto_48577 - PLACE
      ?auto_48583 - PLACE
      ?auto_48579 - HOIST
      ?auto_48578 - SURFACE
      ?auto_48585 - SURFACE
      ?auto_48584 - PLACE
      ?auto_48576 - HOIST
      ?auto_48581 - SURFACE
      ?auto_48575 - SURFACE
      ?auto_48586 - PLACE
      ?auto_48589 - HOIST
      ?auto_48591 - SURFACE
      ?auto_48580 - SURFACE
      ?auto_48582 - PLACE
      ?auto_48587 - HOIST
      ?auto_48590 - SURFACE
      ?auto_48588 - TRUCK
      ?auto_48574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48573 ?auto_48577 ) ( IS-CRATE ?auto_48571 ) ( not ( = ?auto_48571 ?auto_48572 ) ) ( not ( = ?auto_48583 ?auto_48577 ) ) ( HOIST-AT ?auto_48579 ?auto_48583 ) ( not ( = ?auto_48573 ?auto_48579 ) ) ( AVAILABLE ?auto_48579 ) ( SURFACE-AT ?auto_48571 ?auto_48583 ) ( ON ?auto_48571 ?auto_48578 ) ( CLEAR ?auto_48571 ) ( not ( = ?auto_48571 ?auto_48578 ) ) ( not ( = ?auto_48572 ?auto_48578 ) ) ( IS-CRATE ?auto_48572 ) ( not ( = ?auto_48571 ?auto_48585 ) ) ( not ( = ?auto_48572 ?auto_48585 ) ) ( not ( = ?auto_48578 ?auto_48585 ) ) ( not ( = ?auto_48584 ?auto_48577 ) ) ( not ( = ?auto_48583 ?auto_48584 ) ) ( HOIST-AT ?auto_48576 ?auto_48584 ) ( not ( = ?auto_48573 ?auto_48576 ) ) ( not ( = ?auto_48579 ?auto_48576 ) ) ( AVAILABLE ?auto_48576 ) ( SURFACE-AT ?auto_48572 ?auto_48584 ) ( ON ?auto_48572 ?auto_48581 ) ( CLEAR ?auto_48572 ) ( not ( = ?auto_48571 ?auto_48581 ) ) ( not ( = ?auto_48572 ?auto_48581 ) ) ( not ( = ?auto_48578 ?auto_48581 ) ) ( not ( = ?auto_48585 ?auto_48581 ) ) ( IS-CRATE ?auto_48585 ) ( not ( = ?auto_48571 ?auto_48575 ) ) ( not ( = ?auto_48572 ?auto_48575 ) ) ( not ( = ?auto_48578 ?auto_48575 ) ) ( not ( = ?auto_48585 ?auto_48575 ) ) ( not ( = ?auto_48581 ?auto_48575 ) ) ( not ( = ?auto_48586 ?auto_48577 ) ) ( not ( = ?auto_48583 ?auto_48586 ) ) ( not ( = ?auto_48584 ?auto_48586 ) ) ( HOIST-AT ?auto_48589 ?auto_48586 ) ( not ( = ?auto_48573 ?auto_48589 ) ) ( not ( = ?auto_48579 ?auto_48589 ) ) ( not ( = ?auto_48576 ?auto_48589 ) ) ( AVAILABLE ?auto_48589 ) ( SURFACE-AT ?auto_48585 ?auto_48586 ) ( ON ?auto_48585 ?auto_48591 ) ( CLEAR ?auto_48585 ) ( not ( = ?auto_48571 ?auto_48591 ) ) ( not ( = ?auto_48572 ?auto_48591 ) ) ( not ( = ?auto_48578 ?auto_48591 ) ) ( not ( = ?auto_48585 ?auto_48591 ) ) ( not ( = ?auto_48581 ?auto_48591 ) ) ( not ( = ?auto_48575 ?auto_48591 ) ) ( IS-CRATE ?auto_48575 ) ( not ( = ?auto_48571 ?auto_48580 ) ) ( not ( = ?auto_48572 ?auto_48580 ) ) ( not ( = ?auto_48578 ?auto_48580 ) ) ( not ( = ?auto_48585 ?auto_48580 ) ) ( not ( = ?auto_48581 ?auto_48580 ) ) ( not ( = ?auto_48575 ?auto_48580 ) ) ( not ( = ?auto_48591 ?auto_48580 ) ) ( not ( = ?auto_48582 ?auto_48577 ) ) ( not ( = ?auto_48583 ?auto_48582 ) ) ( not ( = ?auto_48584 ?auto_48582 ) ) ( not ( = ?auto_48586 ?auto_48582 ) ) ( HOIST-AT ?auto_48587 ?auto_48582 ) ( not ( = ?auto_48573 ?auto_48587 ) ) ( not ( = ?auto_48579 ?auto_48587 ) ) ( not ( = ?auto_48576 ?auto_48587 ) ) ( not ( = ?auto_48589 ?auto_48587 ) ) ( AVAILABLE ?auto_48587 ) ( SURFACE-AT ?auto_48575 ?auto_48582 ) ( ON ?auto_48575 ?auto_48590 ) ( CLEAR ?auto_48575 ) ( not ( = ?auto_48571 ?auto_48590 ) ) ( not ( = ?auto_48572 ?auto_48590 ) ) ( not ( = ?auto_48578 ?auto_48590 ) ) ( not ( = ?auto_48585 ?auto_48590 ) ) ( not ( = ?auto_48581 ?auto_48590 ) ) ( not ( = ?auto_48575 ?auto_48590 ) ) ( not ( = ?auto_48591 ?auto_48590 ) ) ( not ( = ?auto_48580 ?auto_48590 ) ) ( TRUCK-AT ?auto_48588 ?auto_48577 ) ( SURFACE-AT ?auto_48574 ?auto_48577 ) ( CLEAR ?auto_48574 ) ( IS-CRATE ?auto_48580 ) ( not ( = ?auto_48571 ?auto_48574 ) ) ( not ( = ?auto_48572 ?auto_48574 ) ) ( not ( = ?auto_48578 ?auto_48574 ) ) ( not ( = ?auto_48585 ?auto_48574 ) ) ( not ( = ?auto_48581 ?auto_48574 ) ) ( not ( = ?auto_48575 ?auto_48574 ) ) ( not ( = ?auto_48591 ?auto_48574 ) ) ( not ( = ?auto_48580 ?auto_48574 ) ) ( not ( = ?auto_48590 ?auto_48574 ) ) ( AVAILABLE ?auto_48573 ) ( IN ?auto_48580 ?auto_48588 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48573 ?auto_48580 ?auto_48588 ?auto_48577 )
      ( MAKE-ON ?auto_48571 ?auto_48572 )
      ( MAKE-ON-VERIFY ?auto_48571 ?auto_48572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48592 - SURFACE
      ?auto_48593 - SURFACE
    )
    :vars
    (
      ?auto_48603 - HOIST
      ?auto_48602 - PLACE
      ?auto_48595 - PLACE
      ?auto_48612 - HOIST
      ?auto_48599 - SURFACE
      ?auto_48609 - SURFACE
      ?auto_48611 - PLACE
      ?auto_48598 - HOIST
      ?auto_48610 - SURFACE
      ?auto_48597 - SURFACE
      ?auto_48600 - PLACE
      ?auto_48605 - HOIST
      ?auto_48607 - SURFACE
      ?auto_48596 - SURFACE
      ?auto_48594 - PLACE
      ?auto_48604 - HOIST
      ?auto_48606 - SURFACE
      ?auto_48601 - SURFACE
      ?auto_48608 - TRUCK
      ?auto_48613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48603 ?auto_48602 ) ( IS-CRATE ?auto_48592 ) ( not ( = ?auto_48592 ?auto_48593 ) ) ( not ( = ?auto_48595 ?auto_48602 ) ) ( HOIST-AT ?auto_48612 ?auto_48595 ) ( not ( = ?auto_48603 ?auto_48612 ) ) ( AVAILABLE ?auto_48612 ) ( SURFACE-AT ?auto_48592 ?auto_48595 ) ( ON ?auto_48592 ?auto_48599 ) ( CLEAR ?auto_48592 ) ( not ( = ?auto_48592 ?auto_48599 ) ) ( not ( = ?auto_48593 ?auto_48599 ) ) ( IS-CRATE ?auto_48593 ) ( not ( = ?auto_48592 ?auto_48609 ) ) ( not ( = ?auto_48593 ?auto_48609 ) ) ( not ( = ?auto_48599 ?auto_48609 ) ) ( not ( = ?auto_48611 ?auto_48602 ) ) ( not ( = ?auto_48595 ?auto_48611 ) ) ( HOIST-AT ?auto_48598 ?auto_48611 ) ( not ( = ?auto_48603 ?auto_48598 ) ) ( not ( = ?auto_48612 ?auto_48598 ) ) ( AVAILABLE ?auto_48598 ) ( SURFACE-AT ?auto_48593 ?auto_48611 ) ( ON ?auto_48593 ?auto_48610 ) ( CLEAR ?auto_48593 ) ( not ( = ?auto_48592 ?auto_48610 ) ) ( not ( = ?auto_48593 ?auto_48610 ) ) ( not ( = ?auto_48599 ?auto_48610 ) ) ( not ( = ?auto_48609 ?auto_48610 ) ) ( IS-CRATE ?auto_48609 ) ( not ( = ?auto_48592 ?auto_48597 ) ) ( not ( = ?auto_48593 ?auto_48597 ) ) ( not ( = ?auto_48599 ?auto_48597 ) ) ( not ( = ?auto_48609 ?auto_48597 ) ) ( not ( = ?auto_48610 ?auto_48597 ) ) ( not ( = ?auto_48600 ?auto_48602 ) ) ( not ( = ?auto_48595 ?auto_48600 ) ) ( not ( = ?auto_48611 ?auto_48600 ) ) ( HOIST-AT ?auto_48605 ?auto_48600 ) ( not ( = ?auto_48603 ?auto_48605 ) ) ( not ( = ?auto_48612 ?auto_48605 ) ) ( not ( = ?auto_48598 ?auto_48605 ) ) ( AVAILABLE ?auto_48605 ) ( SURFACE-AT ?auto_48609 ?auto_48600 ) ( ON ?auto_48609 ?auto_48607 ) ( CLEAR ?auto_48609 ) ( not ( = ?auto_48592 ?auto_48607 ) ) ( not ( = ?auto_48593 ?auto_48607 ) ) ( not ( = ?auto_48599 ?auto_48607 ) ) ( not ( = ?auto_48609 ?auto_48607 ) ) ( not ( = ?auto_48610 ?auto_48607 ) ) ( not ( = ?auto_48597 ?auto_48607 ) ) ( IS-CRATE ?auto_48597 ) ( not ( = ?auto_48592 ?auto_48596 ) ) ( not ( = ?auto_48593 ?auto_48596 ) ) ( not ( = ?auto_48599 ?auto_48596 ) ) ( not ( = ?auto_48609 ?auto_48596 ) ) ( not ( = ?auto_48610 ?auto_48596 ) ) ( not ( = ?auto_48597 ?auto_48596 ) ) ( not ( = ?auto_48607 ?auto_48596 ) ) ( not ( = ?auto_48594 ?auto_48602 ) ) ( not ( = ?auto_48595 ?auto_48594 ) ) ( not ( = ?auto_48611 ?auto_48594 ) ) ( not ( = ?auto_48600 ?auto_48594 ) ) ( HOIST-AT ?auto_48604 ?auto_48594 ) ( not ( = ?auto_48603 ?auto_48604 ) ) ( not ( = ?auto_48612 ?auto_48604 ) ) ( not ( = ?auto_48598 ?auto_48604 ) ) ( not ( = ?auto_48605 ?auto_48604 ) ) ( AVAILABLE ?auto_48604 ) ( SURFACE-AT ?auto_48597 ?auto_48594 ) ( ON ?auto_48597 ?auto_48606 ) ( CLEAR ?auto_48597 ) ( not ( = ?auto_48592 ?auto_48606 ) ) ( not ( = ?auto_48593 ?auto_48606 ) ) ( not ( = ?auto_48599 ?auto_48606 ) ) ( not ( = ?auto_48609 ?auto_48606 ) ) ( not ( = ?auto_48610 ?auto_48606 ) ) ( not ( = ?auto_48597 ?auto_48606 ) ) ( not ( = ?auto_48607 ?auto_48606 ) ) ( not ( = ?auto_48596 ?auto_48606 ) ) ( SURFACE-AT ?auto_48601 ?auto_48602 ) ( CLEAR ?auto_48601 ) ( IS-CRATE ?auto_48596 ) ( not ( = ?auto_48592 ?auto_48601 ) ) ( not ( = ?auto_48593 ?auto_48601 ) ) ( not ( = ?auto_48599 ?auto_48601 ) ) ( not ( = ?auto_48609 ?auto_48601 ) ) ( not ( = ?auto_48610 ?auto_48601 ) ) ( not ( = ?auto_48597 ?auto_48601 ) ) ( not ( = ?auto_48607 ?auto_48601 ) ) ( not ( = ?auto_48596 ?auto_48601 ) ) ( not ( = ?auto_48606 ?auto_48601 ) ) ( AVAILABLE ?auto_48603 ) ( IN ?auto_48596 ?auto_48608 ) ( TRUCK-AT ?auto_48608 ?auto_48613 ) ( not ( = ?auto_48613 ?auto_48602 ) ) ( not ( = ?auto_48595 ?auto_48613 ) ) ( not ( = ?auto_48611 ?auto_48613 ) ) ( not ( = ?auto_48600 ?auto_48613 ) ) ( not ( = ?auto_48594 ?auto_48613 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48608 ?auto_48613 ?auto_48602 )
      ( MAKE-ON ?auto_48592 ?auto_48593 )
      ( MAKE-ON-VERIFY ?auto_48592 ?auto_48593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48614 - SURFACE
      ?auto_48615 - SURFACE
    )
    :vars
    (
      ?auto_48623 - HOIST
      ?auto_48631 - PLACE
      ?auto_48634 - PLACE
      ?auto_48626 - HOIST
      ?auto_48622 - SURFACE
      ?auto_48616 - SURFACE
      ?auto_48625 - PLACE
      ?auto_48620 - HOIST
      ?auto_48619 - SURFACE
      ?auto_48621 - SURFACE
      ?auto_48628 - PLACE
      ?auto_48635 - HOIST
      ?auto_48632 - SURFACE
      ?auto_48630 - SURFACE
      ?auto_48617 - PLACE
      ?auto_48633 - HOIST
      ?auto_48624 - SURFACE
      ?auto_48618 - SURFACE
      ?auto_48627 - TRUCK
      ?auto_48629 - PLACE
      ?auto_48636 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48623 ?auto_48631 ) ( IS-CRATE ?auto_48614 ) ( not ( = ?auto_48614 ?auto_48615 ) ) ( not ( = ?auto_48634 ?auto_48631 ) ) ( HOIST-AT ?auto_48626 ?auto_48634 ) ( not ( = ?auto_48623 ?auto_48626 ) ) ( AVAILABLE ?auto_48626 ) ( SURFACE-AT ?auto_48614 ?auto_48634 ) ( ON ?auto_48614 ?auto_48622 ) ( CLEAR ?auto_48614 ) ( not ( = ?auto_48614 ?auto_48622 ) ) ( not ( = ?auto_48615 ?auto_48622 ) ) ( IS-CRATE ?auto_48615 ) ( not ( = ?auto_48614 ?auto_48616 ) ) ( not ( = ?auto_48615 ?auto_48616 ) ) ( not ( = ?auto_48622 ?auto_48616 ) ) ( not ( = ?auto_48625 ?auto_48631 ) ) ( not ( = ?auto_48634 ?auto_48625 ) ) ( HOIST-AT ?auto_48620 ?auto_48625 ) ( not ( = ?auto_48623 ?auto_48620 ) ) ( not ( = ?auto_48626 ?auto_48620 ) ) ( AVAILABLE ?auto_48620 ) ( SURFACE-AT ?auto_48615 ?auto_48625 ) ( ON ?auto_48615 ?auto_48619 ) ( CLEAR ?auto_48615 ) ( not ( = ?auto_48614 ?auto_48619 ) ) ( not ( = ?auto_48615 ?auto_48619 ) ) ( not ( = ?auto_48622 ?auto_48619 ) ) ( not ( = ?auto_48616 ?auto_48619 ) ) ( IS-CRATE ?auto_48616 ) ( not ( = ?auto_48614 ?auto_48621 ) ) ( not ( = ?auto_48615 ?auto_48621 ) ) ( not ( = ?auto_48622 ?auto_48621 ) ) ( not ( = ?auto_48616 ?auto_48621 ) ) ( not ( = ?auto_48619 ?auto_48621 ) ) ( not ( = ?auto_48628 ?auto_48631 ) ) ( not ( = ?auto_48634 ?auto_48628 ) ) ( not ( = ?auto_48625 ?auto_48628 ) ) ( HOIST-AT ?auto_48635 ?auto_48628 ) ( not ( = ?auto_48623 ?auto_48635 ) ) ( not ( = ?auto_48626 ?auto_48635 ) ) ( not ( = ?auto_48620 ?auto_48635 ) ) ( AVAILABLE ?auto_48635 ) ( SURFACE-AT ?auto_48616 ?auto_48628 ) ( ON ?auto_48616 ?auto_48632 ) ( CLEAR ?auto_48616 ) ( not ( = ?auto_48614 ?auto_48632 ) ) ( not ( = ?auto_48615 ?auto_48632 ) ) ( not ( = ?auto_48622 ?auto_48632 ) ) ( not ( = ?auto_48616 ?auto_48632 ) ) ( not ( = ?auto_48619 ?auto_48632 ) ) ( not ( = ?auto_48621 ?auto_48632 ) ) ( IS-CRATE ?auto_48621 ) ( not ( = ?auto_48614 ?auto_48630 ) ) ( not ( = ?auto_48615 ?auto_48630 ) ) ( not ( = ?auto_48622 ?auto_48630 ) ) ( not ( = ?auto_48616 ?auto_48630 ) ) ( not ( = ?auto_48619 ?auto_48630 ) ) ( not ( = ?auto_48621 ?auto_48630 ) ) ( not ( = ?auto_48632 ?auto_48630 ) ) ( not ( = ?auto_48617 ?auto_48631 ) ) ( not ( = ?auto_48634 ?auto_48617 ) ) ( not ( = ?auto_48625 ?auto_48617 ) ) ( not ( = ?auto_48628 ?auto_48617 ) ) ( HOIST-AT ?auto_48633 ?auto_48617 ) ( not ( = ?auto_48623 ?auto_48633 ) ) ( not ( = ?auto_48626 ?auto_48633 ) ) ( not ( = ?auto_48620 ?auto_48633 ) ) ( not ( = ?auto_48635 ?auto_48633 ) ) ( AVAILABLE ?auto_48633 ) ( SURFACE-AT ?auto_48621 ?auto_48617 ) ( ON ?auto_48621 ?auto_48624 ) ( CLEAR ?auto_48621 ) ( not ( = ?auto_48614 ?auto_48624 ) ) ( not ( = ?auto_48615 ?auto_48624 ) ) ( not ( = ?auto_48622 ?auto_48624 ) ) ( not ( = ?auto_48616 ?auto_48624 ) ) ( not ( = ?auto_48619 ?auto_48624 ) ) ( not ( = ?auto_48621 ?auto_48624 ) ) ( not ( = ?auto_48632 ?auto_48624 ) ) ( not ( = ?auto_48630 ?auto_48624 ) ) ( SURFACE-AT ?auto_48618 ?auto_48631 ) ( CLEAR ?auto_48618 ) ( IS-CRATE ?auto_48630 ) ( not ( = ?auto_48614 ?auto_48618 ) ) ( not ( = ?auto_48615 ?auto_48618 ) ) ( not ( = ?auto_48622 ?auto_48618 ) ) ( not ( = ?auto_48616 ?auto_48618 ) ) ( not ( = ?auto_48619 ?auto_48618 ) ) ( not ( = ?auto_48621 ?auto_48618 ) ) ( not ( = ?auto_48632 ?auto_48618 ) ) ( not ( = ?auto_48630 ?auto_48618 ) ) ( not ( = ?auto_48624 ?auto_48618 ) ) ( AVAILABLE ?auto_48623 ) ( TRUCK-AT ?auto_48627 ?auto_48629 ) ( not ( = ?auto_48629 ?auto_48631 ) ) ( not ( = ?auto_48634 ?auto_48629 ) ) ( not ( = ?auto_48625 ?auto_48629 ) ) ( not ( = ?auto_48628 ?auto_48629 ) ) ( not ( = ?auto_48617 ?auto_48629 ) ) ( HOIST-AT ?auto_48636 ?auto_48629 ) ( LIFTING ?auto_48636 ?auto_48630 ) ( not ( = ?auto_48623 ?auto_48636 ) ) ( not ( = ?auto_48626 ?auto_48636 ) ) ( not ( = ?auto_48620 ?auto_48636 ) ) ( not ( = ?auto_48635 ?auto_48636 ) ) ( not ( = ?auto_48633 ?auto_48636 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48636 ?auto_48630 ?auto_48627 ?auto_48629 )
      ( MAKE-ON ?auto_48614 ?auto_48615 )
      ( MAKE-ON-VERIFY ?auto_48614 ?auto_48615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48637 - SURFACE
      ?auto_48638 - SURFACE
    )
    :vars
    (
      ?auto_48650 - HOIST
      ?auto_48648 - PLACE
      ?auto_48656 - PLACE
      ?auto_48642 - HOIST
      ?auto_48646 - SURFACE
      ?auto_48644 - SURFACE
      ?auto_48652 - PLACE
      ?auto_48645 - HOIST
      ?auto_48655 - SURFACE
      ?auto_48659 - SURFACE
      ?auto_48653 - PLACE
      ?auto_48641 - HOIST
      ?auto_48639 - SURFACE
      ?auto_48649 - SURFACE
      ?auto_48658 - PLACE
      ?auto_48640 - HOIST
      ?auto_48647 - SURFACE
      ?auto_48654 - SURFACE
      ?auto_48657 - TRUCK
      ?auto_48651 - PLACE
      ?auto_48643 - HOIST
      ?auto_48660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48650 ?auto_48648 ) ( IS-CRATE ?auto_48637 ) ( not ( = ?auto_48637 ?auto_48638 ) ) ( not ( = ?auto_48656 ?auto_48648 ) ) ( HOIST-AT ?auto_48642 ?auto_48656 ) ( not ( = ?auto_48650 ?auto_48642 ) ) ( AVAILABLE ?auto_48642 ) ( SURFACE-AT ?auto_48637 ?auto_48656 ) ( ON ?auto_48637 ?auto_48646 ) ( CLEAR ?auto_48637 ) ( not ( = ?auto_48637 ?auto_48646 ) ) ( not ( = ?auto_48638 ?auto_48646 ) ) ( IS-CRATE ?auto_48638 ) ( not ( = ?auto_48637 ?auto_48644 ) ) ( not ( = ?auto_48638 ?auto_48644 ) ) ( not ( = ?auto_48646 ?auto_48644 ) ) ( not ( = ?auto_48652 ?auto_48648 ) ) ( not ( = ?auto_48656 ?auto_48652 ) ) ( HOIST-AT ?auto_48645 ?auto_48652 ) ( not ( = ?auto_48650 ?auto_48645 ) ) ( not ( = ?auto_48642 ?auto_48645 ) ) ( AVAILABLE ?auto_48645 ) ( SURFACE-AT ?auto_48638 ?auto_48652 ) ( ON ?auto_48638 ?auto_48655 ) ( CLEAR ?auto_48638 ) ( not ( = ?auto_48637 ?auto_48655 ) ) ( not ( = ?auto_48638 ?auto_48655 ) ) ( not ( = ?auto_48646 ?auto_48655 ) ) ( not ( = ?auto_48644 ?auto_48655 ) ) ( IS-CRATE ?auto_48644 ) ( not ( = ?auto_48637 ?auto_48659 ) ) ( not ( = ?auto_48638 ?auto_48659 ) ) ( not ( = ?auto_48646 ?auto_48659 ) ) ( not ( = ?auto_48644 ?auto_48659 ) ) ( not ( = ?auto_48655 ?auto_48659 ) ) ( not ( = ?auto_48653 ?auto_48648 ) ) ( not ( = ?auto_48656 ?auto_48653 ) ) ( not ( = ?auto_48652 ?auto_48653 ) ) ( HOIST-AT ?auto_48641 ?auto_48653 ) ( not ( = ?auto_48650 ?auto_48641 ) ) ( not ( = ?auto_48642 ?auto_48641 ) ) ( not ( = ?auto_48645 ?auto_48641 ) ) ( AVAILABLE ?auto_48641 ) ( SURFACE-AT ?auto_48644 ?auto_48653 ) ( ON ?auto_48644 ?auto_48639 ) ( CLEAR ?auto_48644 ) ( not ( = ?auto_48637 ?auto_48639 ) ) ( not ( = ?auto_48638 ?auto_48639 ) ) ( not ( = ?auto_48646 ?auto_48639 ) ) ( not ( = ?auto_48644 ?auto_48639 ) ) ( not ( = ?auto_48655 ?auto_48639 ) ) ( not ( = ?auto_48659 ?auto_48639 ) ) ( IS-CRATE ?auto_48659 ) ( not ( = ?auto_48637 ?auto_48649 ) ) ( not ( = ?auto_48638 ?auto_48649 ) ) ( not ( = ?auto_48646 ?auto_48649 ) ) ( not ( = ?auto_48644 ?auto_48649 ) ) ( not ( = ?auto_48655 ?auto_48649 ) ) ( not ( = ?auto_48659 ?auto_48649 ) ) ( not ( = ?auto_48639 ?auto_48649 ) ) ( not ( = ?auto_48658 ?auto_48648 ) ) ( not ( = ?auto_48656 ?auto_48658 ) ) ( not ( = ?auto_48652 ?auto_48658 ) ) ( not ( = ?auto_48653 ?auto_48658 ) ) ( HOIST-AT ?auto_48640 ?auto_48658 ) ( not ( = ?auto_48650 ?auto_48640 ) ) ( not ( = ?auto_48642 ?auto_48640 ) ) ( not ( = ?auto_48645 ?auto_48640 ) ) ( not ( = ?auto_48641 ?auto_48640 ) ) ( AVAILABLE ?auto_48640 ) ( SURFACE-AT ?auto_48659 ?auto_48658 ) ( ON ?auto_48659 ?auto_48647 ) ( CLEAR ?auto_48659 ) ( not ( = ?auto_48637 ?auto_48647 ) ) ( not ( = ?auto_48638 ?auto_48647 ) ) ( not ( = ?auto_48646 ?auto_48647 ) ) ( not ( = ?auto_48644 ?auto_48647 ) ) ( not ( = ?auto_48655 ?auto_48647 ) ) ( not ( = ?auto_48659 ?auto_48647 ) ) ( not ( = ?auto_48639 ?auto_48647 ) ) ( not ( = ?auto_48649 ?auto_48647 ) ) ( SURFACE-AT ?auto_48654 ?auto_48648 ) ( CLEAR ?auto_48654 ) ( IS-CRATE ?auto_48649 ) ( not ( = ?auto_48637 ?auto_48654 ) ) ( not ( = ?auto_48638 ?auto_48654 ) ) ( not ( = ?auto_48646 ?auto_48654 ) ) ( not ( = ?auto_48644 ?auto_48654 ) ) ( not ( = ?auto_48655 ?auto_48654 ) ) ( not ( = ?auto_48659 ?auto_48654 ) ) ( not ( = ?auto_48639 ?auto_48654 ) ) ( not ( = ?auto_48649 ?auto_48654 ) ) ( not ( = ?auto_48647 ?auto_48654 ) ) ( AVAILABLE ?auto_48650 ) ( TRUCK-AT ?auto_48657 ?auto_48651 ) ( not ( = ?auto_48651 ?auto_48648 ) ) ( not ( = ?auto_48656 ?auto_48651 ) ) ( not ( = ?auto_48652 ?auto_48651 ) ) ( not ( = ?auto_48653 ?auto_48651 ) ) ( not ( = ?auto_48658 ?auto_48651 ) ) ( HOIST-AT ?auto_48643 ?auto_48651 ) ( not ( = ?auto_48650 ?auto_48643 ) ) ( not ( = ?auto_48642 ?auto_48643 ) ) ( not ( = ?auto_48645 ?auto_48643 ) ) ( not ( = ?auto_48641 ?auto_48643 ) ) ( not ( = ?auto_48640 ?auto_48643 ) ) ( AVAILABLE ?auto_48643 ) ( SURFACE-AT ?auto_48649 ?auto_48651 ) ( ON ?auto_48649 ?auto_48660 ) ( CLEAR ?auto_48649 ) ( not ( = ?auto_48637 ?auto_48660 ) ) ( not ( = ?auto_48638 ?auto_48660 ) ) ( not ( = ?auto_48646 ?auto_48660 ) ) ( not ( = ?auto_48644 ?auto_48660 ) ) ( not ( = ?auto_48655 ?auto_48660 ) ) ( not ( = ?auto_48659 ?auto_48660 ) ) ( not ( = ?auto_48639 ?auto_48660 ) ) ( not ( = ?auto_48649 ?auto_48660 ) ) ( not ( = ?auto_48647 ?auto_48660 ) ) ( not ( = ?auto_48654 ?auto_48660 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48643 ?auto_48649 ?auto_48660 ?auto_48651 )
      ( MAKE-ON ?auto_48637 ?auto_48638 )
      ( MAKE-ON-VERIFY ?auto_48637 ?auto_48638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48661 - SURFACE
      ?auto_48662 - SURFACE
    )
    :vars
    (
      ?auto_48683 - HOIST
      ?auto_48670 - PLACE
      ?auto_48666 - PLACE
      ?auto_48669 - HOIST
      ?auto_48667 - SURFACE
      ?auto_48679 - SURFACE
      ?auto_48681 - PLACE
      ?auto_48675 - HOIST
      ?auto_48664 - SURFACE
      ?auto_48677 - SURFACE
      ?auto_48668 - PLACE
      ?auto_48684 - HOIST
      ?auto_48673 - SURFACE
      ?auto_48678 - SURFACE
      ?auto_48676 - PLACE
      ?auto_48682 - HOIST
      ?auto_48672 - SURFACE
      ?auto_48674 - SURFACE
      ?auto_48663 - PLACE
      ?auto_48680 - HOIST
      ?auto_48671 - SURFACE
      ?auto_48665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48683 ?auto_48670 ) ( IS-CRATE ?auto_48661 ) ( not ( = ?auto_48661 ?auto_48662 ) ) ( not ( = ?auto_48666 ?auto_48670 ) ) ( HOIST-AT ?auto_48669 ?auto_48666 ) ( not ( = ?auto_48683 ?auto_48669 ) ) ( AVAILABLE ?auto_48669 ) ( SURFACE-AT ?auto_48661 ?auto_48666 ) ( ON ?auto_48661 ?auto_48667 ) ( CLEAR ?auto_48661 ) ( not ( = ?auto_48661 ?auto_48667 ) ) ( not ( = ?auto_48662 ?auto_48667 ) ) ( IS-CRATE ?auto_48662 ) ( not ( = ?auto_48661 ?auto_48679 ) ) ( not ( = ?auto_48662 ?auto_48679 ) ) ( not ( = ?auto_48667 ?auto_48679 ) ) ( not ( = ?auto_48681 ?auto_48670 ) ) ( not ( = ?auto_48666 ?auto_48681 ) ) ( HOIST-AT ?auto_48675 ?auto_48681 ) ( not ( = ?auto_48683 ?auto_48675 ) ) ( not ( = ?auto_48669 ?auto_48675 ) ) ( AVAILABLE ?auto_48675 ) ( SURFACE-AT ?auto_48662 ?auto_48681 ) ( ON ?auto_48662 ?auto_48664 ) ( CLEAR ?auto_48662 ) ( not ( = ?auto_48661 ?auto_48664 ) ) ( not ( = ?auto_48662 ?auto_48664 ) ) ( not ( = ?auto_48667 ?auto_48664 ) ) ( not ( = ?auto_48679 ?auto_48664 ) ) ( IS-CRATE ?auto_48679 ) ( not ( = ?auto_48661 ?auto_48677 ) ) ( not ( = ?auto_48662 ?auto_48677 ) ) ( not ( = ?auto_48667 ?auto_48677 ) ) ( not ( = ?auto_48679 ?auto_48677 ) ) ( not ( = ?auto_48664 ?auto_48677 ) ) ( not ( = ?auto_48668 ?auto_48670 ) ) ( not ( = ?auto_48666 ?auto_48668 ) ) ( not ( = ?auto_48681 ?auto_48668 ) ) ( HOIST-AT ?auto_48684 ?auto_48668 ) ( not ( = ?auto_48683 ?auto_48684 ) ) ( not ( = ?auto_48669 ?auto_48684 ) ) ( not ( = ?auto_48675 ?auto_48684 ) ) ( AVAILABLE ?auto_48684 ) ( SURFACE-AT ?auto_48679 ?auto_48668 ) ( ON ?auto_48679 ?auto_48673 ) ( CLEAR ?auto_48679 ) ( not ( = ?auto_48661 ?auto_48673 ) ) ( not ( = ?auto_48662 ?auto_48673 ) ) ( not ( = ?auto_48667 ?auto_48673 ) ) ( not ( = ?auto_48679 ?auto_48673 ) ) ( not ( = ?auto_48664 ?auto_48673 ) ) ( not ( = ?auto_48677 ?auto_48673 ) ) ( IS-CRATE ?auto_48677 ) ( not ( = ?auto_48661 ?auto_48678 ) ) ( not ( = ?auto_48662 ?auto_48678 ) ) ( not ( = ?auto_48667 ?auto_48678 ) ) ( not ( = ?auto_48679 ?auto_48678 ) ) ( not ( = ?auto_48664 ?auto_48678 ) ) ( not ( = ?auto_48677 ?auto_48678 ) ) ( not ( = ?auto_48673 ?auto_48678 ) ) ( not ( = ?auto_48676 ?auto_48670 ) ) ( not ( = ?auto_48666 ?auto_48676 ) ) ( not ( = ?auto_48681 ?auto_48676 ) ) ( not ( = ?auto_48668 ?auto_48676 ) ) ( HOIST-AT ?auto_48682 ?auto_48676 ) ( not ( = ?auto_48683 ?auto_48682 ) ) ( not ( = ?auto_48669 ?auto_48682 ) ) ( not ( = ?auto_48675 ?auto_48682 ) ) ( not ( = ?auto_48684 ?auto_48682 ) ) ( AVAILABLE ?auto_48682 ) ( SURFACE-AT ?auto_48677 ?auto_48676 ) ( ON ?auto_48677 ?auto_48672 ) ( CLEAR ?auto_48677 ) ( not ( = ?auto_48661 ?auto_48672 ) ) ( not ( = ?auto_48662 ?auto_48672 ) ) ( not ( = ?auto_48667 ?auto_48672 ) ) ( not ( = ?auto_48679 ?auto_48672 ) ) ( not ( = ?auto_48664 ?auto_48672 ) ) ( not ( = ?auto_48677 ?auto_48672 ) ) ( not ( = ?auto_48673 ?auto_48672 ) ) ( not ( = ?auto_48678 ?auto_48672 ) ) ( SURFACE-AT ?auto_48674 ?auto_48670 ) ( CLEAR ?auto_48674 ) ( IS-CRATE ?auto_48678 ) ( not ( = ?auto_48661 ?auto_48674 ) ) ( not ( = ?auto_48662 ?auto_48674 ) ) ( not ( = ?auto_48667 ?auto_48674 ) ) ( not ( = ?auto_48679 ?auto_48674 ) ) ( not ( = ?auto_48664 ?auto_48674 ) ) ( not ( = ?auto_48677 ?auto_48674 ) ) ( not ( = ?auto_48673 ?auto_48674 ) ) ( not ( = ?auto_48678 ?auto_48674 ) ) ( not ( = ?auto_48672 ?auto_48674 ) ) ( AVAILABLE ?auto_48683 ) ( not ( = ?auto_48663 ?auto_48670 ) ) ( not ( = ?auto_48666 ?auto_48663 ) ) ( not ( = ?auto_48681 ?auto_48663 ) ) ( not ( = ?auto_48668 ?auto_48663 ) ) ( not ( = ?auto_48676 ?auto_48663 ) ) ( HOIST-AT ?auto_48680 ?auto_48663 ) ( not ( = ?auto_48683 ?auto_48680 ) ) ( not ( = ?auto_48669 ?auto_48680 ) ) ( not ( = ?auto_48675 ?auto_48680 ) ) ( not ( = ?auto_48684 ?auto_48680 ) ) ( not ( = ?auto_48682 ?auto_48680 ) ) ( AVAILABLE ?auto_48680 ) ( SURFACE-AT ?auto_48678 ?auto_48663 ) ( ON ?auto_48678 ?auto_48671 ) ( CLEAR ?auto_48678 ) ( not ( = ?auto_48661 ?auto_48671 ) ) ( not ( = ?auto_48662 ?auto_48671 ) ) ( not ( = ?auto_48667 ?auto_48671 ) ) ( not ( = ?auto_48679 ?auto_48671 ) ) ( not ( = ?auto_48664 ?auto_48671 ) ) ( not ( = ?auto_48677 ?auto_48671 ) ) ( not ( = ?auto_48673 ?auto_48671 ) ) ( not ( = ?auto_48678 ?auto_48671 ) ) ( not ( = ?auto_48672 ?auto_48671 ) ) ( not ( = ?auto_48674 ?auto_48671 ) ) ( TRUCK-AT ?auto_48665 ?auto_48670 ) )
    :subtasks
    ( ( !DRIVE ?auto_48665 ?auto_48670 ?auto_48663 )
      ( MAKE-ON ?auto_48661 ?auto_48662 )
      ( MAKE-ON-VERIFY ?auto_48661 ?auto_48662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48685 - SURFACE
      ?auto_48686 - SURFACE
    )
    :vars
    (
      ?auto_48706 - HOIST
      ?auto_48701 - PLACE
      ?auto_48694 - PLACE
      ?auto_48695 - HOIST
      ?auto_48699 - SURFACE
      ?auto_48702 - SURFACE
      ?auto_48704 - PLACE
      ?auto_48689 - HOIST
      ?auto_48700 - SURFACE
      ?auto_48698 - SURFACE
      ?auto_48687 - PLACE
      ?auto_48690 - HOIST
      ?auto_48688 - SURFACE
      ?auto_48707 - SURFACE
      ?auto_48693 - PLACE
      ?auto_48705 - HOIST
      ?auto_48691 - SURFACE
      ?auto_48696 - SURFACE
      ?auto_48697 - PLACE
      ?auto_48703 - HOIST
      ?auto_48708 - SURFACE
      ?auto_48692 - TRUCK
      ?auto_48709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48706 ?auto_48701 ) ( IS-CRATE ?auto_48685 ) ( not ( = ?auto_48685 ?auto_48686 ) ) ( not ( = ?auto_48694 ?auto_48701 ) ) ( HOIST-AT ?auto_48695 ?auto_48694 ) ( not ( = ?auto_48706 ?auto_48695 ) ) ( AVAILABLE ?auto_48695 ) ( SURFACE-AT ?auto_48685 ?auto_48694 ) ( ON ?auto_48685 ?auto_48699 ) ( CLEAR ?auto_48685 ) ( not ( = ?auto_48685 ?auto_48699 ) ) ( not ( = ?auto_48686 ?auto_48699 ) ) ( IS-CRATE ?auto_48686 ) ( not ( = ?auto_48685 ?auto_48702 ) ) ( not ( = ?auto_48686 ?auto_48702 ) ) ( not ( = ?auto_48699 ?auto_48702 ) ) ( not ( = ?auto_48704 ?auto_48701 ) ) ( not ( = ?auto_48694 ?auto_48704 ) ) ( HOIST-AT ?auto_48689 ?auto_48704 ) ( not ( = ?auto_48706 ?auto_48689 ) ) ( not ( = ?auto_48695 ?auto_48689 ) ) ( AVAILABLE ?auto_48689 ) ( SURFACE-AT ?auto_48686 ?auto_48704 ) ( ON ?auto_48686 ?auto_48700 ) ( CLEAR ?auto_48686 ) ( not ( = ?auto_48685 ?auto_48700 ) ) ( not ( = ?auto_48686 ?auto_48700 ) ) ( not ( = ?auto_48699 ?auto_48700 ) ) ( not ( = ?auto_48702 ?auto_48700 ) ) ( IS-CRATE ?auto_48702 ) ( not ( = ?auto_48685 ?auto_48698 ) ) ( not ( = ?auto_48686 ?auto_48698 ) ) ( not ( = ?auto_48699 ?auto_48698 ) ) ( not ( = ?auto_48702 ?auto_48698 ) ) ( not ( = ?auto_48700 ?auto_48698 ) ) ( not ( = ?auto_48687 ?auto_48701 ) ) ( not ( = ?auto_48694 ?auto_48687 ) ) ( not ( = ?auto_48704 ?auto_48687 ) ) ( HOIST-AT ?auto_48690 ?auto_48687 ) ( not ( = ?auto_48706 ?auto_48690 ) ) ( not ( = ?auto_48695 ?auto_48690 ) ) ( not ( = ?auto_48689 ?auto_48690 ) ) ( AVAILABLE ?auto_48690 ) ( SURFACE-AT ?auto_48702 ?auto_48687 ) ( ON ?auto_48702 ?auto_48688 ) ( CLEAR ?auto_48702 ) ( not ( = ?auto_48685 ?auto_48688 ) ) ( not ( = ?auto_48686 ?auto_48688 ) ) ( not ( = ?auto_48699 ?auto_48688 ) ) ( not ( = ?auto_48702 ?auto_48688 ) ) ( not ( = ?auto_48700 ?auto_48688 ) ) ( not ( = ?auto_48698 ?auto_48688 ) ) ( IS-CRATE ?auto_48698 ) ( not ( = ?auto_48685 ?auto_48707 ) ) ( not ( = ?auto_48686 ?auto_48707 ) ) ( not ( = ?auto_48699 ?auto_48707 ) ) ( not ( = ?auto_48702 ?auto_48707 ) ) ( not ( = ?auto_48700 ?auto_48707 ) ) ( not ( = ?auto_48698 ?auto_48707 ) ) ( not ( = ?auto_48688 ?auto_48707 ) ) ( not ( = ?auto_48693 ?auto_48701 ) ) ( not ( = ?auto_48694 ?auto_48693 ) ) ( not ( = ?auto_48704 ?auto_48693 ) ) ( not ( = ?auto_48687 ?auto_48693 ) ) ( HOIST-AT ?auto_48705 ?auto_48693 ) ( not ( = ?auto_48706 ?auto_48705 ) ) ( not ( = ?auto_48695 ?auto_48705 ) ) ( not ( = ?auto_48689 ?auto_48705 ) ) ( not ( = ?auto_48690 ?auto_48705 ) ) ( AVAILABLE ?auto_48705 ) ( SURFACE-AT ?auto_48698 ?auto_48693 ) ( ON ?auto_48698 ?auto_48691 ) ( CLEAR ?auto_48698 ) ( not ( = ?auto_48685 ?auto_48691 ) ) ( not ( = ?auto_48686 ?auto_48691 ) ) ( not ( = ?auto_48699 ?auto_48691 ) ) ( not ( = ?auto_48702 ?auto_48691 ) ) ( not ( = ?auto_48700 ?auto_48691 ) ) ( not ( = ?auto_48698 ?auto_48691 ) ) ( not ( = ?auto_48688 ?auto_48691 ) ) ( not ( = ?auto_48707 ?auto_48691 ) ) ( IS-CRATE ?auto_48707 ) ( not ( = ?auto_48685 ?auto_48696 ) ) ( not ( = ?auto_48686 ?auto_48696 ) ) ( not ( = ?auto_48699 ?auto_48696 ) ) ( not ( = ?auto_48702 ?auto_48696 ) ) ( not ( = ?auto_48700 ?auto_48696 ) ) ( not ( = ?auto_48698 ?auto_48696 ) ) ( not ( = ?auto_48688 ?auto_48696 ) ) ( not ( = ?auto_48707 ?auto_48696 ) ) ( not ( = ?auto_48691 ?auto_48696 ) ) ( not ( = ?auto_48697 ?auto_48701 ) ) ( not ( = ?auto_48694 ?auto_48697 ) ) ( not ( = ?auto_48704 ?auto_48697 ) ) ( not ( = ?auto_48687 ?auto_48697 ) ) ( not ( = ?auto_48693 ?auto_48697 ) ) ( HOIST-AT ?auto_48703 ?auto_48697 ) ( not ( = ?auto_48706 ?auto_48703 ) ) ( not ( = ?auto_48695 ?auto_48703 ) ) ( not ( = ?auto_48689 ?auto_48703 ) ) ( not ( = ?auto_48690 ?auto_48703 ) ) ( not ( = ?auto_48705 ?auto_48703 ) ) ( AVAILABLE ?auto_48703 ) ( SURFACE-AT ?auto_48707 ?auto_48697 ) ( ON ?auto_48707 ?auto_48708 ) ( CLEAR ?auto_48707 ) ( not ( = ?auto_48685 ?auto_48708 ) ) ( not ( = ?auto_48686 ?auto_48708 ) ) ( not ( = ?auto_48699 ?auto_48708 ) ) ( not ( = ?auto_48702 ?auto_48708 ) ) ( not ( = ?auto_48700 ?auto_48708 ) ) ( not ( = ?auto_48698 ?auto_48708 ) ) ( not ( = ?auto_48688 ?auto_48708 ) ) ( not ( = ?auto_48707 ?auto_48708 ) ) ( not ( = ?auto_48691 ?auto_48708 ) ) ( not ( = ?auto_48696 ?auto_48708 ) ) ( TRUCK-AT ?auto_48692 ?auto_48701 ) ( SURFACE-AT ?auto_48709 ?auto_48701 ) ( CLEAR ?auto_48709 ) ( LIFTING ?auto_48706 ?auto_48696 ) ( IS-CRATE ?auto_48696 ) ( not ( = ?auto_48685 ?auto_48709 ) ) ( not ( = ?auto_48686 ?auto_48709 ) ) ( not ( = ?auto_48699 ?auto_48709 ) ) ( not ( = ?auto_48702 ?auto_48709 ) ) ( not ( = ?auto_48700 ?auto_48709 ) ) ( not ( = ?auto_48698 ?auto_48709 ) ) ( not ( = ?auto_48688 ?auto_48709 ) ) ( not ( = ?auto_48707 ?auto_48709 ) ) ( not ( = ?auto_48691 ?auto_48709 ) ) ( not ( = ?auto_48696 ?auto_48709 ) ) ( not ( = ?auto_48708 ?auto_48709 ) ) )
    :subtasks
    ( ( !DROP ?auto_48706 ?auto_48696 ?auto_48709 ?auto_48701 )
      ( MAKE-ON ?auto_48685 ?auto_48686 )
      ( MAKE-ON-VERIFY ?auto_48685 ?auto_48686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48710 - SURFACE
      ?auto_48711 - SURFACE
    )
    :vars
    (
      ?auto_48721 - HOIST
      ?auto_48730 - PLACE
      ?auto_48719 - PLACE
      ?auto_48729 - HOIST
      ?auto_48734 - SURFACE
      ?auto_48715 - SURFACE
      ?auto_48732 - PLACE
      ?auto_48728 - HOIST
      ?auto_48716 - SURFACE
      ?auto_48713 - SURFACE
      ?auto_48714 - PLACE
      ?auto_48727 - HOIST
      ?auto_48724 - SURFACE
      ?auto_48722 - SURFACE
      ?auto_48731 - PLACE
      ?auto_48733 - HOIST
      ?auto_48725 - SURFACE
      ?auto_48718 - SURFACE
      ?auto_48717 - PLACE
      ?auto_48712 - HOIST
      ?auto_48723 - SURFACE
      ?auto_48720 - TRUCK
      ?auto_48726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48721 ?auto_48730 ) ( IS-CRATE ?auto_48710 ) ( not ( = ?auto_48710 ?auto_48711 ) ) ( not ( = ?auto_48719 ?auto_48730 ) ) ( HOIST-AT ?auto_48729 ?auto_48719 ) ( not ( = ?auto_48721 ?auto_48729 ) ) ( AVAILABLE ?auto_48729 ) ( SURFACE-AT ?auto_48710 ?auto_48719 ) ( ON ?auto_48710 ?auto_48734 ) ( CLEAR ?auto_48710 ) ( not ( = ?auto_48710 ?auto_48734 ) ) ( not ( = ?auto_48711 ?auto_48734 ) ) ( IS-CRATE ?auto_48711 ) ( not ( = ?auto_48710 ?auto_48715 ) ) ( not ( = ?auto_48711 ?auto_48715 ) ) ( not ( = ?auto_48734 ?auto_48715 ) ) ( not ( = ?auto_48732 ?auto_48730 ) ) ( not ( = ?auto_48719 ?auto_48732 ) ) ( HOIST-AT ?auto_48728 ?auto_48732 ) ( not ( = ?auto_48721 ?auto_48728 ) ) ( not ( = ?auto_48729 ?auto_48728 ) ) ( AVAILABLE ?auto_48728 ) ( SURFACE-AT ?auto_48711 ?auto_48732 ) ( ON ?auto_48711 ?auto_48716 ) ( CLEAR ?auto_48711 ) ( not ( = ?auto_48710 ?auto_48716 ) ) ( not ( = ?auto_48711 ?auto_48716 ) ) ( not ( = ?auto_48734 ?auto_48716 ) ) ( not ( = ?auto_48715 ?auto_48716 ) ) ( IS-CRATE ?auto_48715 ) ( not ( = ?auto_48710 ?auto_48713 ) ) ( not ( = ?auto_48711 ?auto_48713 ) ) ( not ( = ?auto_48734 ?auto_48713 ) ) ( not ( = ?auto_48715 ?auto_48713 ) ) ( not ( = ?auto_48716 ?auto_48713 ) ) ( not ( = ?auto_48714 ?auto_48730 ) ) ( not ( = ?auto_48719 ?auto_48714 ) ) ( not ( = ?auto_48732 ?auto_48714 ) ) ( HOIST-AT ?auto_48727 ?auto_48714 ) ( not ( = ?auto_48721 ?auto_48727 ) ) ( not ( = ?auto_48729 ?auto_48727 ) ) ( not ( = ?auto_48728 ?auto_48727 ) ) ( AVAILABLE ?auto_48727 ) ( SURFACE-AT ?auto_48715 ?auto_48714 ) ( ON ?auto_48715 ?auto_48724 ) ( CLEAR ?auto_48715 ) ( not ( = ?auto_48710 ?auto_48724 ) ) ( not ( = ?auto_48711 ?auto_48724 ) ) ( not ( = ?auto_48734 ?auto_48724 ) ) ( not ( = ?auto_48715 ?auto_48724 ) ) ( not ( = ?auto_48716 ?auto_48724 ) ) ( not ( = ?auto_48713 ?auto_48724 ) ) ( IS-CRATE ?auto_48713 ) ( not ( = ?auto_48710 ?auto_48722 ) ) ( not ( = ?auto_48711 ?auto_48722 ) ) ( not ( = ?auto_48734 ?auto_48722 ) ) ( not ( = ?auto_48715 ?auto_48722 ) ) ( not ( = ?auto_48716 ?auto_48722 ) ) ( not ( = ?auto_48713 ?auto_48722 ) ) ( not ( = ?auto_48724 ?auto_48722 ) ) ( not ( = ?auto_48731 ?auto_48730 ) ) ( not ( = ?auto_48719 ?auto_48731 ) ) ( not ( = ?auto_48732 ?auto_48731 ) ) ( not ( = ?auto_48714 ?auto_48731 ) ) ( HOIST-AT ?auto_48733 ?auto_48731 ) ( not ( = ?auto_48721 ?auto_48733 ) ) ( not ( = ?auto_48729 ?auto_48733 ) ) ( not ( = ?auto_48728 ?auto_48733 ) ) ( not ( = ?auto_48727 ?auto_48733 ) ) ( AVAILABLE ?auto_48733 ) ( SURFACE-AT ?auto_48713 ?auto_48731 ) ( ON ?auto_48713 ?auto_48725 ) ( CLEAR ?auto_48713 ) ( not ( = ?auto_48710 ?auto_48725 ) ) ( not ( = ?auto_48711 ?auto_48725 ) ) ( not ( = ?auto_48734 ?auto_48725 ) ) ( not ( = ?auto_48715 ?auto_48725 ) ) ( not ( = ?auto_48716 ?auto_48725 ) ) ( not ( = ?auto_48713 ?auto_48725 ) ) ( not ( = ?auto_48724 ?auto_48725 ) ) ( not ( = ?auto_48722 ?auto_48725 ) ) ( IS-CRATE ?auto_48722 ) ( not ( = ?auto_48710 ?auto_48718 ) ) ( not ( = ?auto_48711 ?auto_48718 ) ) ( not ( = ?auto_48734 ?auto_48718 ) ) ( not ( = ?auto_48715 ?auto_48718 ) ) ( not ( = ?auto_48716 ?auto_48718 ) ) ( not ( = ?auto_48713 ?auto_48718 ) ) ( not ( = ?auto_48724 ?auto_48718 ) ) ( not ( = ?auto_48722 ?auto_48718 ) ) ( not ( = ?auto_48725 ?auto_48718 ) ) ( not ( = ?auto_48717 ?auto_48730 ) ) ( not ( = ?auto_48719 ?auto_48717 ) ) ( not ( = ?auto_48732 ?auto_48717 ) ) ( not ( = ?auto_48714 ?auto_48717 ) ) ( not ( = ?auto_48731 ?auto_48717 ) ) ( HOIST-AT ?auto_48712 ?auto_48717 ) ( not ( = ?auto_48721 ?auto_48712 ) ) ( not ( = ?auto_48729 ?auto_48712 ) ) ( not ( = ?auto_48728 ?auto_48712 ) ) ( not ( = ?auto_48727 ?auto_48712 ) ) ( not ( = ?auto_48733 ?auto_48712 ) ) ( AVAILABLE ?auto_48712 ) ( SURFACE-AT ?auto_48722 ?auto_48717 ) ( ON ?auto_48722 ?auto_48723 ) ( CLEAR ?auto_48722 ) ( not ( = ?auto_48710 ?auto_48723 ) ) ( not ( = ?auto_48711 ?auto_48723 ) ) ( not ( = ?auto_48734 ?auto_48723 ) ) ( not ( = ?auto_48715 ?auto_48723 ) ) ( not ( = ?auto_48716 ?auto_48723 ) ) ( not ( = ?auto_48713 ?auto_48723 ) ) ( not ( = ?auto_48724 ?auto_48723 ) ) ( not ( = ?auto_48722 ?auto_48723 ) ) ( not ( = ?auto_48725 ?auto_48723 ) ) ( not ( = ?auto_48718 ?auto_48723 ) ) ( TRUCK-AT ?auto_48720 ?auto_48730 ) ( SURFACE-AT ?auto_48726 ?auto_48730 ) ( CLEAR ?auto_48726 ) ( IS-CRATE ?auto_48718 ) ( not ( = ?auto_48710 ?auto_48726 ) ) ( not ( = ?auto_48711 ?auto_48726 ) ) ( not ( = ?auto_48734 ?auto_48726 ) ) ( not ( = ?auto_48715 ?auto_48726 ) ) ( not ( = ?auto_48716 ?auto_48726 ) ) ( not ( = ?auto_48713 ?auto_48726 ) ) ( not ( = ?auto_48724 ?auto_48726 ) ) ( not ( = ?auto_48722 ?auto_48726 ) ) ( not ( = ?auto_48725 ?auto_48726 ) ) ( not ( = ?auto_48718 ?auto_48726 ) ) ( not ( = ?auto_48723 ?auto_48726 ) ) ( AVAILABLE ?auto_48721 ) ( IN ?auto_48718 ?auto_48720 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48721 ?auto_48718 ?auto_48720 ?auto_48730 )
      ( MAKE-ON ?auto_48710 ?auto_48711 )
      ( MAKE-ON-VERIFY ?auto_48710 ?auto_48711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48735 - SURFACE
      ?auto_48736 - SURFACE
    )
    :vars
    (
      ?auto_48740 - HOIST
      ?auto_48746 - PLACE
      ?auto_48749 - PLACE
      ?auto_48750 - HOIST
      ?auto_48754 - SURFACE
      ?auto_48756 - SURFACE
      ?auto_48751 - PLACE
      ?auto_48743 - HOIST
      ?auto_48737 - SURFACE
      ?auto_48738 - SURFACE
      ?auto_48739 - PLACE
      ?auto_48755 - HOIST
      ?auto_48758 - SURFACE
      ?auto_48741 - SURFACE
      ?auto_48744 - PLACE
      ?auto_48753 - HOIST
      ?auto_48748 - SURFACE
      ?auto_48759 - SURFACE
      ?auto_48742 - PLACE
      ?auto_48745 - HOIST
      ?auto_48747 - SURFACE
      ?auto_48757 - SURFACE
      ?auto_48752 - TRUCK
      ?auto_48760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48740 ?auto_48746 ) ( IS-CRATE ?auto_48735 ) ( not ( = ?auto_48735 ?auto_48736 ) ) ( not ( = ?auto_48749 ?auto_48746 ) ) ( HOIST-AT ?auto_48750 ?auto_48749 ) ( not ( = ?auto_48740 ?auto_48750 ) ) ( AVAILABLE ?auto_48750 ) ( SURFACE-AT ?auto_48735 ?auto_48749 ) ( ON ?auto_48735 ?auto_48754 ) ( CLEAR ?auto_48735 ) ( not ( = ?auto_48735 ?auto_48754 ) ) ( not ( = ?auto_48736 ?auto_48754 ) ) ( IS-CRATE ?auto_48736 ) ( not ( = ?auto_48735 ?auto_48756 ) ) ( not ( = ?auto_48736 ?auto_48756 ) ) ( not ( = ?auto_48754 ?auto_48756 ) ) ( not ( = ?auto_48751 ?auto_48746 ) ) ( not ( = ?auto_48749 ?auto_48751 ) ) ( HOIST-AT ?auto_48743 ?auto_48751 ) ( not ( = ?auto_48740 ?auto_48743 ) ) ( not ( = ?auto_48750 ?auto_48743 ) ) ( AVAILABLE ?auto_48743 ) ( SURFACE-AT ?auto_48736 ?auto_48751 ) ( ON ?auto_48736 ?auto_48737 ) ( CLEAR ?auto_48736 ) ( not ( = ?auto_48735 ?auto_48737 ) ) ( not ( = ?auto_48736 ?auto_48737 ) ) ( not ( = ?auto_48754 ?auto_48737 ) ) ( not ( = ?auto_48756 ?auto_48737 ) ) ( IS-CRATE ?auto_48756 ) ( not ( = ?auto_48735 ?auto_48738 ) ) ( not ( = ?auto_48736 ?auto_48738 ) ) ( not ( = ?auto_48754 ?auto_48738 ) ) ( not ( = ?auto_48756 ?auto_48738 ) ) ( not ( = ?auto_48737 ?auto_48738 ) ) ( not ( = ?auto_48739 ?auto_48746 ) ) ( not ( = ?auto_48749 ?auto_48739 ) ) ( not ( = ?auto_48751 ?auto_48739 ) ) ( HOIST-AT ?auto_48755 ?auto_48739 ) ( not ( = ?auto_48740 ?auto_48755 ) ) ( not ( = ?auto_48750 ?auto_48755 ) ) ( not ( = ?auto_48743 ?auto_48755 ) ) ( AVAILABLE ?auto_48755 ) ( SURFACE-AT ?auto_48756 ?auto_48739 ) ( ON ?auto_48756 ?auto_48758 ) ( CLEAR ?auto_48756 ) ( not ( = ?auto_48735 ?auto_48758 ) ) ( not ( = ?auto_48736 ?auto_48758 ) ) ( not ( = ?auto_48754 ?auto_48758 ) ) ( not ( = ?auto_48756 ?auto_48758 ) ) ( not ( = ?auto_48737 ?auto_48758 ) ) ( not ( = ?auto_48738 ?auto_48758 ) ) ( IS-CRATE ?auto_48738 ) ( not ( = ?auto_48735 ?auto_48741 ) ) ( not ( = ?auto_48736 ?auto_48741 ) ) ( not ( = ?auto_48754 ?auto_48741 ) ) ( not ( = ?auto_48756 ?auto_48741 ) ) ( not ( = ?auto_48737 ?auto_48741 ) ) ( not ( = ?auto_48738 ?auto_48741 ) ) ( not ( = ?auto_48758 ?auto_48741 ) ) ( not ( = ?auto_48744 ?auto_48746 ) ) ( not ( = ?auto_48749 ?auto_48744 ) ) ( not ( = ?auto_48751 ?auto_48744 ) ) ( not ( = ?auto_48739 ?auto_48744 ) ) ( HOIST-AT ?auto_48753 ?auto_48744 ) ( not ( = ?auto_48740 ?auto_48753 ) ) ( not ( = ?auto_48750 ?auto_48753 ) ) ( not ( = ?auto_48743 ?auto_48753 ) ) ( not ( = ?auto_48755 ?auto_48753 ) ) ( AVAILABLE ?auto_48753 ) ( SURFACE-AT ?auto_48738 ?auto_48744 ) ( ON ?auto_48738 ?auto_48748 ) ( CLEAR ?auto_48738 ) ( not ( = ?auto_48735 ?auto_48748 ) ) ( not ( = ?auto_48736 ?auto_48748 ) ) ( not ( = ?auto_48754 ?auto_48748 ) ) ( not ( = ?auto_48756 ?auto_48748 ) ) ( not ( = ?auto_48737 ?auto_48748 ) ) ( not ( = ?auto_48738 ?auto_48748 ) ) ( not ( = ?auto_48758 ?auto_48748 ) ) ( not ( = ?auto_48741 ?auto_48748 ) ) ( IS-CRATE ?auto_48741 ) ( not ( = ?auto_48735 ?auto_48759 ) ) ( not ( = ?auto_48736 ?auto_48759 ) ) ( not ( = ?auto_48754 ?auto_48759 ) ) ( not ( = ?auto_48756 ?auto_48759 ) ) ( not ( = ?auto_48737 ?auto_48759 ) ) ( not ( = ?auto_48738 ?auto_48759 ) ) ( not ( = ?auto_48758 ?auto_48759 ) ) ( not ( = ?auto_48741 ?auto_48759 ) ) ( not ( = ?auto_48748 ?auto_48759 ) ) ( not ( = ?auto_48742 ?auto_48746 ) ) ( not ( = ?auto_48749 ?auto_48742 ) ) ( not ( = ?auto_48751 ?auto_48742 ) ) ( not ( = ?auto_48739 ?auto_48742 ) ) ( not ( = ?auto_48744 ?auto_48742 ) ) ( HOIST-AT ?auto_48745 ?auto_48742 ) ( not ( = ?auto_48740 ?auto_48745 ) ) ( not ( = ?auto_48750 ?auto_48745 ) ) ( not ( = ?auto_48743 ?auto_48745 ) ) ( not ( = ?auto_48755 ?auto_48745 ) ) ( not ( = ?auto_48753 ?auto_48745 ) ) ( AVAILABLE ?auto_48745 ) ( SURFACE-AT ?auto_48741 ?auto_48742 ) ( ON ?auto_48741 ?auto_48747 ) ( CLEAR ?auto_48741 ) ( not ( = ?auto_48735 ?auto_48747 ) ) ( not ( = ?auto_48736 ?auto_48747 ) ) ( not ( = ?auto_48754 ?auto_48747 ) ) ( not ( = ?auto_48756 ?auto_48747 ) ) ( not ( = ?auto_48737 ?auto_48747 ) ) ( not ( = ?auto_48738 ?auto_48747 ) ) ( not ( = ?auto_48758 ?auto_48747 ) ) ( not ( = ?auto_48741 ?auto_48747 ) ) ( not ( = ?auto_48748 ?auto_48747 ) ) ( not ( = ?auto_48759 ?auto_48747 ) ) ( SURFACE-AT ?auto_48757 ?auto_48746 ) ( CLEAR ?auto_48757 ) ( IS-CRATE ?auto_48759 ) ( not ( = ?auto_48735 ?auto_48757 ) ) ( not ( = ?auto_48736 ?auto_48757 ) ) ( not ( = ?auto_48754 ?auto_48757 ) ) ( not ( = ?auto_48756 ?auto_48757 ) ) ( not ( = ?auto_48737 ?auto_48757 ) ) ( not ( = ?auto_48738 ?auto_48757 ) ) ( not ( = ?auto_48758 ?auto_48757 ) ) ( not ( = ?auto_48741 ?auto_48757 ) ) ( not ( = ?auto_48748 ?auto_48757 ) ) ( not ( = ?auto_48759 ?auto_48757 ) ) ( not ( = ?auto_48747 ?auto_48757 ) ) ( AVAILABLE ?auto_48740 ) ( IN ?auto_48759 ?auto_48752 ) ( TRUCK-AT ?auto_48752 ?auto_48760 ) ( not ( = ?auto_48760 ?auto_48746 ) ) ( not ( = ?auto_48749 ?auto_48760 ) ) ( not ( = ?auto_48751 ?auto_48760 ) ) ( not ( = ?auto_48739 ?auto_48760 ) ) ( not ( = ?auto_48744 ?auto_48760 ) ) ( not ( = ?auto_48742 ?auto_48760 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48752 ?auto_48760 ?auto_48746 )
      ( MAKE-ON ?auto_48735 ?auto_48736 )
      ( MAKE-ON-VERIFY ?auto_48735 ?auto_48736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48761 - SURFACE
      ?auto_48762 - SURFACE
    )
    :vars
    (
      ?auto_48765 - HOIST
      ?auto_48773 - PLACE
      ?auto_48780 - PLACE
      ?auto_48770 - HOIST
      ?auto_48783 - SURFACE
      ?auto_48776 - SURFACE
      ?auto_48777 - PLACE
      ?auto_48769 - HOIST
      ?auto_48784 - SURFACE
      ?auto_48779 - SURFACE
      ?auto_48781 - PLACE
      ?auto_48775 - HOIST
      ?auto_48764 - SURFACE
      ?auto_48771 - SURFACE
      ?auto_48778 - PLACE
      ?auto_48782 - HOIST
      ?auto_48774 - SURFACE
      ?auto_48767 - SURFACE
      ?auto_48766 - PLACE
      ?auto_48786 - HOIST
      ?auto_48772 - SURFACE
      ?auto_48763 - SURFACE
      ?auto_48768 - TRUCK
      ?auto_48785 - PLACE
      ?auto_48787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48765 ?auto_48773 ) ( IS-CRATE ?auto_48761 ) ( not ( = ?auto_48761 ?auto_48762 ) ) ( not ( = ?auto_48780 ?auto_48773 ) ) ( HOIST-AT ?auto_48770 ?auto_48780 ) ( not ( = ?auto_48765 ?auto_48770 ) ) ( AVAILABLE ?auto_48770 ) ( SURFACE-AT ?auto_48761 ?auto_48780 ) ( ON ?auto_48761 ?auto_48783 ) ( CLEAR ?auto_48761 ) ( not ( = ?auto_48761 ?auto_48783 ) ) ( not ( = ?auto_48762 ?auto_48783 ) ) ( IS-CRATE ?auto_48762 ) ( not ( = ?auto_48761 ?auto_48776 ) ) ( not ( = ?auto_48762 ?auto_48776 ) ) ( not ( = ?auto_48783 ?auto_48776 ) ) ( not ( = ?auto_48777 ?auto_48773 ) ) ( not ( = ?auto_48780 ?auto_48777 ) ) ( HOIST-AT ?auto_48769 ?auto_48777 ) ( not ( = ?auto_48765 ?auto_48769 ) ) ( not ( = ?auto_48770 ?auto_48769 ) ) ( AVAILABLE ?auto_48769 ) ( SURFACE-AT ?auto_48762 ?auto_48777 ) ( ON ?auto_48762 ?auto_48784 ) ( CLEAR ?auto_48762 ) ( not ( = ?auto_48761 ?auto_48784 ) ) ( not ( = ?auto_48762 ?auto_48784 ) ) ( not ( = ?auto_48783 ?auto_48784 ) ) ( not ( = ?auto_48776 ?auto_48784 ) ) ( IS-CRATE ?auto_48776 ) ( not ( = ?auto_48761 ?auto_48779 ) ) ( not ( = ?auto_48762 ?auto_48779 ) ) ( not ( = ?auto_48783 ?auto_48779 ) ) ( not ( = ?auto_48776 ?auto_48779 ) ) ( not ( = ?auto_48784 ?auto_48779 ) ) ( not ( = ?auto_48781 ?auto_48773 ) ) ( not ( = ?auto_48780 ?auto_48781 ) ) ( not ( = ?auto_48777 ?auto_48781 ) ) ( HOIST-AT ?auto_48775 ?auto_48781 ) ( not ( = ?auto_48765 ?auto_48775 ) ) ( not ( = ?auto_48770 ?auto_48775 ) ) ( not ( = ?auto_48769 ?auto_48775 ) ) ( AVAILABLE ?auto_48775 ) ( SURFACE-AT ?auto_48776 ?auto_48781 ) ( ON ?auto_48776 ?auto_48764 ) ( CLEAR ?auto_48776 ) ( not ( = ?auto_48761 ?auto_48764 ) ) ( not ( = ?auto_48762 ?auto_48764 ) ) ( not ( = ?auto_48783 ?auto_48764 ) ) ( not ( = ?auto_48776 ?auto_48764 ) ) ( not ( = ?auto_48784 ?auto_48764 ) ) ( not ( = ?auto_48779 ?auto_48764 ) ) ( IS-CRATE ?auto_48779 ) ( not ( = ?auto_48761 ?auto_48771 ) ) ( not ( = ?auto_48762 ?auto_48771 ) ) ( not ( = ?auto_48783 ?auto_48771 ) ) ( not ( = ?auto_48776 ?auto_48771 ) ) ( not ( = ?auto_48784 ?auto_48771 ) ) ( not ( = ?auto_48779 ?auto_48771 ) ) ( not ( = ?auto_48764 ?auto_48771 ) ) ( not ( = ?auto_48778 ?auto_48773 ) ) ( not ( = ?auto_48780 ?auto_48778 ) ) ( not ( = ?auto_48777 ?auto_48778 ) ) ( not ( = ?auto_48781 ?auto_48778 ) ) ( HOIST-AT ?auto_48782 ?auto_48778 ) ( not ( = ?auto_48765 ?auto_48782 ) ) ( not ( = ?auto_48770 ?auto_48782 ) ) ( not ( = ?auto_48769 ?auto_48782 ) ) ( not ( = ?auto_48775 ?auto_48782 ) ) ( AVAILABLE ?auto_48782 ) ( SURFACE-AT ?auto_48779 ?auto_48778 ) ( ON ?auto_48779 ?auto_48774 ) ( CLEAR ?auto_48779 ) ( not ( = ?auto_48761 ?auto_48774 ) ) ( not ( = ?auto_48762 ?auto_48774 ) ) ( not ( = ?auto_48783 ?auto_48774 ) ) ( not ( = ?auto_48776 ?auto_48774 ) ) ( not ( = ?auto_48784 ?auto_48774 ) ) ( not ( = ?auto_48779 ?auto_48774 ) ) ( not ( = ?auto_48764 ?auto_48774 ) ) ( not ( = ?auto_48771 ?auto_48774 ) ) ( IS-CRATE ?auto_48771 ) ( not ( = ?auto_48761 ?auto_48767 ) ) ( not ( = ?auto_48762 ?auto_48767 ) ) ( not ( = ?auto_48783 ?auto_48767 ) ) ( not ( = ?auto_48776 ?auto_48767 ) ) ( not ( = ?auto_48784 ?auto_48767 ) ) ( not ( = ?auto_48779 ?auto_48767 ) ) ( not ( = ?auto_48764 ?auto_48767 ) ) ( not ( = ?auto_48771 ?auto_48767 ) ) ( not ( = ?auto_48774 ?auto_48767 ) ) ( not ( = ?auto_48766 ?auto_48773 ) ) ( not ( = ?auto_48780 ?auto_48766 ) ) ( not ( = ?auto_48777 ?auto_48766 ) ) ( not ( = ?auto_48781 ?auto_48766 ) ) ( not ( = ?auto_48778 ?auto_48766 ) ) ( HOIST-AT ?auto_48786 ?auto_48766 ) ( not ( = ?auto_48765 ?auto_48786 ) ) ( not ( = ?auto_48770 ?auto_48786 ) ) ( not ( = ?auto_48769 ?auto_48786 ) ) ( not ( = ?auto_48775 ?auto_48786 ) ) ( not ( = ?auto_48782 ?auto_48786 ) ) ( AVAILABLE ?auto_48786 ) ( SURFACE-AT ?auto_48771 ?auto_48766 ) ( ON ?auto_48771 ?auto_48772 ) ( CLEAR ?auto_48771 ) ( not ( = ?auto_48761 ?auto_48772 ) ) ( not ( = ?auto_48762 ?auto_48772 ) ) ( not ( = ?auto_48783 ?auto_48772 ) ) ( not ( = ?auto_48776 ?auto_48772 ) ) ( not ( = ?auto_48784 ?auto_48772 ) ) ( not ( = ?auto_48779 ?auto_48772 ) ) ( not ( = ?auto_48764 ?auto_48772 ) ) ( not ( = ?auto_48771 ?auto_48772 ) ) ( not ( = ?auto_48774 ?auto_48772 ) ) ( not ( = ?auto_48767 ?auto_48772 ) ) ( SURFACE-AT ?auto_48763 ?auto_48773 ) ( CLEAR ?auto_48763 ) ( IS-CRATE ?auto_48767 ) ( not ( = ?auto_48761 ?auto_48763 ) ) ( not ( = ?auto_48762 ?auto_48763 ) ) ( not ( = ?auto_48783 ?auto_48763 ) ) ( not ( = ?auto_48776 ?auto_48763 ) ) ( not ( = ?auto_48784 ?auto_48763 ) ) ( not ( = ?auto_48779 ?auto_48763 ) ) ( not ( = ?auto_48764 ?auto_48763 ) ) ( not ( = ?auto_48771 ?auto_48763 ) ) ( not ( = ?auto_48774 ?auto_48763 ) ) ( not ( = ?auto_48767 ?auto_48763 ) ) ( not ( = ?auto_48772 ?auto_48763 ) ) ( AVAILABLE ?auto_48765 ) ( TRUCK-AT ?auto_48768 ?auto_48785 ) ( not ( = ?auto_48785 ?auto_48773 ) ) ( not ( = ?auto_48780 ?auto_48785 ) ) ( not ( = ?auto_48777 ?auto_48785 ) ) ( not ( = ?auto_48781 ?auto_48785 ) ) ( not ( = ?auto_48778 ?auto_48785 ) ) ( not ( = ?auto_48766 ?auto_48785 ) ) ( HOIST-AT ?auto_48787 ?auto_48785 ) ( LIFTING ?auto_48787 ?auto_48767 ) ( not ( = ?auto_48765 ?auto_48787 ) ) ( not ( = ?auto_48770 ?auto_48787 ) ) ( not ( = ?auto_48769 ?auto_48787 ) ) ( not ( = ?auto_48775 ?auto_48787 ) ) ( not ( = ?auto_48782 ?auto_48787 ) ) ( not ( = ?auto_48786 ?auto_48787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48787 ?auto_48767 ?auto_48768 ?auto_48785 )
      ( MAKE-ON ?auto_48761 ?auto_48762 )
      ( MAKE-ON-VERIFY ?auto_48761 ?auto_48762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48788 - SURFACE
      ?auto_48789 - SURFACE
    )
    :vars
    (
      ?auto_48805 - HOIST
      ?auto_48809 - PLACE
      ?auto_48795 - PLACE
      ?auto_48804 - HOIST
      ?auto_48798 - SURFACE
      ?auto_48791 - SURFACE
      ?auto_48813 - PLACE
      ?auto_48792 - HOIST
      ?auto_48799 - SURFACE
      ?auto_48790 - SURFACE
      ?auto_48796 - PLACE
      ?auto_48811 - HOIST
      ?auto_48807 - SURFACE
      ?auto_48802 - SURFACE
      ?auto_48801 - PLACE
      ?auto_48797 - HOIST
      ?auto_48810 - SURFACE
      ?auto_48808 - SURFACE
      ?auto_48806 - PLACE
      ?auto_48794 - HOIST
      ?auto_48793 - SURFACE
      ?auto_48812 - SURFACE
      ?auto_48803 - TRUCK
      ?auto_48800 - PLACE
      ?auto_48814 - HOIST
      ?auto_48815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48805 ?auto_48809 ) ( IS-CRATE ?auto_48788 ) ( not ( = ?auto_48788 ?auto_48789 ) ) ( not ( = ?auto_48795 ?auto_48809 ) ) ( HOIST-AT ?auto_48804 ?auto_48795 ) ( not ( = ?auto_48805 ?auto_48804 ) ) ( AVAILABLE ?auto_48804 ) ( SURFACE-AT ?auto_48788 ?auto_48795 ) ( ON ?auto_48788 ?auto_48798 ) ( CLEAR ?auto_48788 ) ( not ( = ?auto_48788 ?auto_48798 ) ) ( not ( = ?auto_48789 ?auto_48798 ) ) ( IS-CRATE ?auto_48789 ) ( not ( = ?auto_48788 ?auto_48791 ) ) ( not ( = ?auto_48789 ?auto_48791 ) ) ( not ( = ?auto_48798 ?auto_48791 ) ) ( not ( = ?auto_48813 ?auto_48809 ) ) ( not ( = ?auto_48795 ?auto_48813 ) ) ( HOIST-AT ?auto_48792 ?auto_48813 ) ( not ( = ?auto_48805 ?auto_48792 ) ) ( not ( = ?auto_48804 ?auto_48792 ) ) ( AVAILABLE ?auto_48792 ) ( SURFACE-AT ?auto_48789 ?auto_48813 ) ( ON ?auto_48789 ?auto_48799 ) ( CLEAR ?auto_48789 ) ( not ( = ?auto_48788 ?auto_48799 ) ) ( not ( = ?auto_48789 ?auto_48799 ) ) ( not ( = ?auto_48798 ?auto_48799 ) ) ( not ( = ?auto_48791 ?auto_48799 ) ) ( IS-CRATE ?auto_48791 ) ( not ( = ?auto_48788 ?auto_48790 ) ) ( not ( = ?auto_48789 ?auto_48790 ) ) ( not ( = ?auto_48798 ?auto_48790 ) ) ( not ( = ?auto_48791 ?auto_48790 ) ) ( not ( = ?auto_48799 ?auto_48790 ) ) ( not ( = ?auto_48796 ?auto_48809 ) ) ( not ( = ?auto_48795 ?auto_48796 ) ) ( not ( = ?auto_48813 ?auto_48796 ) ) ( HOIST-AT ?auto_48811 ?auto_48796 ) ( not ( = ?auto_48805 ?auto_48811 ) ) ( not ( = ?auto_48804 ?auto_48811 ) ) ( not ( = ?auto_48792 ?auto_48811 ) ) ( AVAILABLE ?auto_48811 ) ( SURFACE-AT ?auto_48791 ?auto_48796 ) ( ON ?auto_48791 ?auto_48807 ) ( CLEAR ?auto_48791 ) ( not ( = ?auto_48788 ?auto_48807 ) ) ( not ( = ?auto_48789 ?auto_48807 ) ) ( not ( = ?auto_48798 ?auto_48807 ) ) ( not ( = ?auto_48791 ?auto_48807 ) ) ( not ( = ?auto_48799 ?auto_48807 ) ) ( not ( = ?auto_48790 ?auto_48807 ) ) ( IS-CRATE ?auto_48790 ) ( not ( = ?auto_48788 ?auto_48802 ) ) ( not ( = ?auto_48789 ?auto_48802 ) ) ( not ( = ?auto_48798 ?auto_48802 ) ) ( not ( = ?auto_48791 ?auto_48802 ) ) ( not ( = ?auto_48799 ?auto_48802 ) ) ( not ( = ?auto_48790 ?auto_48802 ) ) ( not ( = ?auto_48807 ?auto_48802 ) ) ( not ( = ?auto_48801 ?auto_48809 ) ) ( not ( = ?auto_48795 ?auto_48801 ) ) ( not ( = ?auto_48813 ?auto_48801 ) ) ( not ( = ?auto_48796 ?auto_48801 ) ) ( HOIST-AT ?auto_48797 ?auto_48801 ) ( not ( = ?auto_48805 ?auto_48797 ) ) ( not ( = ?auto_48804 ?auto_48797 ) ) ( not ( = ?auto_48792 ?auto_48797 ) ) ( not ( = ?auto_48811 ?auto_48797 ) ) ( AVAILABLE ?auto_48797 ) ( SURFACE-AT ?auto_48790 ?auto_48801 ) ( ON ?auto_48790 ?auto_48810 ) ( CLEAR ?auto_48790 ) ( not ( = ?auto_48788 ?auto_48810 ) ) ( not ( = ?auto_48789 ?auto_48810 ) ) ( not ( = ?auto_48798 ?auto_48810 ) ) ( not ( = ?auto_48791 ?auto_48810 ) ) ( not ( = ?auto_48799 ?auto_48810 ) ) ( not ( = ?auto_48790 ?auto_48810 ) ) ( not ( = ?auto_48807 ?auto_48810 ) ) ( not ( = ?auto_48802 ?auto_48810 ) ) ( IS-CRATE ?auto_48802 ) ( not ( = ?auto_48788 ?auto_48808 ) ) ( not ( = ?auto_48789 ?auto_48808 ) ) ( not ( = ?auto_48798 ?auto_48808 ) ) ( not ( = ?auto_48791 ?auto_48808 ) ) ( not ( = ?auto_48799 ?auto_48808 ) ) ( not ( = ?auto_48790 ?auto_48808 ) ) ( not ( = ?auto_48807 ?auto_48808 ) ) ( not ( = ?auto_48802 ?auto_48808 ) ) ( not ( = ?auto_48810 ?auto_48808 ) ) ( not ( = ?auto_48806 ?auto_48809 ) ) ( not ( = ?auto_48795 ?auto_48806 ) ) ( not ( = ?auto_48813 ?auto_48806 ) ) ( not ( = ?auto_48796 ?auto_48806 ) ) ( not ( = ?auto_48801 ?auto_48806 ) ) ( HOIST-AT ?auto_48794 ?auto_48806 ) ( not ( = ?auto_48805 ?auto_48794 ) ) ( not ( = ?auto_48804 ?auto_48794 ) ) ( not ( = ?auto_48792 ?auto_48794 ) ) ( not ( = ?auto_48811 ?auto_48794 ) ) ( not ( = ?auto_48797 ?auto_48794 ) ) ( AVAILABLE ?auto_48794 ) ( SURFACE-AT ?auto_48802 ?auto_48806 ) ( ON ?auto_48802 ?auto_48793 ) ( CLEAR ?auto_48802 ) ( not ( = ?auto_48788 ?auto_48793 ) ) ( not ( = ?auto_48789 ?auto_48793 ) ) ( not ( = ?auto_48798 ?auto_48793 ) ) ( not ( = ?auto_48791 ?auto_48793 ) ) ( not ( = ?auto_48799 ?auto_48793 ) ) ( not ( = ?auto_48790 ?auto_48793 ) ) ( not ( = ?auto_48807 ?auto_48793 ) ) ( not ( = ?auto_48802 ?auto_48793 ) ) ( not ( = ?auto_48810 ?auto_48793 ) ) ( not ( = ?auto_48808 ?auto_48793 ) ) ( SURFACE-AT ?auto_48812 ?auto_48809 ) ( CLEAR ?auto_48812 ) ( IS-CRATE ?auto_48808 ) ( not ( = ?auto_48788 ?auto_48812 ) ) ( not ( = ?auto_48789 ?auto_48812 ) ) ( not ( = ?auto_48798 ?auto_48812 ) ) ( not ( = ?auto_48791 ?auto_48812 ) ) ( not ( = ?auto_48799 ?auto_48812 ) ) ( not ( = ?auto_48790 ?auto_48812 ) ) ( not ( = ?auto_48807 ?auto_48812 ) ) ( not ( = ?auto_48802 ?auto_48812 ) ) ( not ( = ?auto_48810 ?auto_48812 ) ) ( not ( = ?auto_48808 ?auto_48812 ) ) ( not ( = ?auto_48793 ?auto_48812 ) ) ( AVAILABLE ?auto_48805 ) ( TRUCK-AT ?auto_48803 ?auto_48800 ) ( not ( = ?auto_48800 ?auto_48809 ) ) ( not ( = ?auto_48795 ?auto_48800 ) ) ( not ( = ?auto_48813 ?auto_48800 ) ) ( not ( = ?auto_48796 ?auto_48800 ) ) ( not ( = ?auto_48801 ?auto_48800 ) ) ( not ( = ?auto_48806 ?auto_48800 ) ) ( HOIST-AT ?auto_48814 ?auto_48800 ) ( not ( = ?auto_48805 ?auto_48814 ) ) ( not ( = ?auto_48804 ?auto_48814 ) ) ( not ( = ?auto_48792 ?auto_48814 ) ) ( not ( = ?auto_48811 ?auto_48814 ) ) ( not ( = ?auto_48797 ?auto_48814 ) ) ( not ( = ?auto_48794 ?auto_48814 ) ) ( AVAILABLE ?auto_48814 ) ( SURFACE-AT ?auto_48808 ?auto_48800 ) ( ON ?auto_48808 ?auto_48815 ) ( CLEAR ?auto_48808 ) ( not ( = ?auto_48788 ?auto_48815 ) ) ( not ( = ?auto_48789 ?auto_48815 ) ) ( not ( = ?auto_48798 ?auto_48815 ) ) ( not ( = ?auto_48791 ?auto_48815 ) ) ( not ( = ?auto_48799 ?auto_48815 ) ) ( not ( = ?auto_48790 ?auto_48815 ) ) ( not ( = ?auto_48807 ?auto_48815 ) ) ( not ( = ?auto_48802 ?auto_48815 ) ) ( not ( = ?auto_48810 ?auto_48815 ) ) ( not ( = ?auto_48808 ?auto_48815 ) ) ( not ( = ?auto_48793 ?auto_48815 ) ) ( not ( = ?auto_48812 ?auto_48815 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48814 ?auto_48808 ?auto_48815 ?auto_48800 )
      ( MAKE-ON ?auto_48788 ?auto_48789 )
      ( MAKE-ON-VERIFY ?auto_48788 ?auto_48789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48816 - SURFACE
      ?auto_48817 - SURFACE
    )
    :vars
    (
      ?auto_48834 - HOIST
      ?auto_48832 - PLACE
      ?auto_48822 - PLACE
      ?auto_48839 - HOIST
      ?auto_48818 - SURFACE
      ?auto_48819 - SURFACE
      ?auto_48821 - PLACE
      ?auto_48836 - HOIST
      ?auto_48828 - SURFACE
      ?auto_48835 - SURFACE
      ?auto_48840 - PLACE
      ?auto_48842 - HOIST
      ?auto_48823 - SURFACE
      ?auto_48827 - SURFACE
      ?auto_48826 - PLACE
      ?auto_48831 - HOIST
      ?auto_48833 - SURFACE
      ?auto_48825 - SURFACE
      ?auto_48820 - PLACE
      ?auto_48837 - HOIST
      ?auto_48838 - SURFACE
      ?auto_48843 - SURFACE
      ?auto_48829 - PLACE
      ?auto_48824 - HOIST
      ?auto_48841 - SURFACE
      ?auto_48830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48834 ?auto_48832 ) ( IS-CRATE ?auto_48816 ) ( not ( = ?auto_48816 ?auto_48817 ) ) ( not ( = ?auto_48822 ?auto_48832 ) ) ( HOIST-AT ?auto_48839 ?auto_48822 ) ( not ( = ?auto_48834 ?auto_48839 ) ) ( AVAILABLE ?auto_48839 ) ( SURFACE-AT ?auto_48816 ?auto_48822 ) ( ON ?auto_48816 ?auto_48818 ) ( CLEAR ?auto_48816 ) ( not ( = ?auto_48816 ?auto_48818 ) ) ( not ( = ?auto_48817 ?auto_48818 ) ) ( IS-CRATE ?auto_48817 ) ( not ( = ?auto_48816 ?auto_48819 ) ) ( not ( = ?auto_48817 ?auto_48819 ) ) ( not ( = ?auto_48818 ?auto_48819 ) ) ( not ( = ?auto_48821 ?auto_48832 ) ) ( not ( = ?auto_48822 ?auto_48821 ) ) ( HOIST-AT ?auto_48836 ?auto_48821 ) ( not ( = ?auto_48834 ?auto_48836 ) ) ( not ( = ?auto_48839 ?auto_48836 ) ) ( AVAILABLE ?auto_48836 ) ( SURFACE-AT ?auto_48817 ?auto_48821 ) ( ON ?auto_48817 ?auto_48828 ) ( CLEAR ?auto_48817 ) ( not ( = ?auto_48816 ?auto_48828 ) ) ( not ( = ?auto_48817 ?auto_48828 ) ) ( not ( = ?auto_48818 ?auto_48828 ) ) ( not ( = ?auto_48819 ?auto_48828 ) ) ( IS-CRATE ?auto_48819 ) ( not ( = ?auto_48816 ?auto_48835 ) ) ( not ( = ?auto_48817 ?auto_48835 ) ) ( not ( = ?auto_48818 ?auto_48835 ) ) ( not ( = ?auto_48819 ?auto_48835 ) ) ( not ( = ?auto_48828 ?auto_48835 ) ) ( not ( = ?auto_48840 ?auto_48832 ) ) ( not ( = ?auto_48822 ?auto_48840 ) ) ( not ( = ?auto_48821 ?auto_48840 ) ) ( HOIST-AT ?auto_48842 ?auto_48840 ) ( not ( = ?auto_48834 ?auto_48842 ) ) ( not ( = ?auto_48839 ?auto_48842 ) ) ( not ( = ?auto_48836 ?auto_48842 ) ) ( AVAILABLE ?auto_48842 ) ( SURFACE-AT ?auto_48819 ?auto_48840 ) ( ON ?auto_48819 ?auto_48823 ) ( CLEAR ?auto_48819 ) ( not ( = ?auto_48816 ?auto_48823 ) ) ( not ( = ?auto_48817 ?auto_48823 ) ) ( not ( = ?auto_48818 ?auto_48823 ) ) ( not ( = ?auto_48819 ?auto_48823 ) ) ( not ( = ?auto_48828 ?auto_48823 ) ) ( not ( = ?auto_48835 ?auto_48823 ) ) ( IS-CRATE ?auto_48835 ) ( not ( = ?auto_48816 ?auto_48827 ) ) ( not ( = ?auto_48817 ?auto_48827 ) ) ( not ( = ?auto_48818 ?auto_48827 ) ) ( not ( = ?auto_48819 ?auto_48827 ) ) ( not ( = ?auto_48828 ?auto_48827 ) ) ( not ( = ?auto_48835 ?auto_48827 ) ) ( not ( = ?auto_48823 ?auto_48827 ) ) ( not ( = ?auto_48826 ?auto_48832 ) ) ( not ( = ?auto_48822 ?auto_48826 ) ) ( not ( = ?auto_48821 ?auto_48826 ) ) ( not ( = ?auto_48840 ?auto_48826 ) ) ( HOIST-AT ?auto_48831 ?auto_48826 ) ( not ( = ?auto_48834 ?auto_48831 ) ) ( not ( = ?auto_48839 ?auto_48831 ) ) ( not ( = ?auto_48836 ?auto_48831 ) ) ( not ( = ?auto_48842 ?auto_48831 ) ) ( AVAILABLE ?auto_48831 ) ( SURFACE-AT ?auto_48835 ?auto_48826 ) ( ON ?auto_48835 ?auto_48833 ) ( CLEAR ?auto_48835 ) ( not ( = ?auto_48816 ?auto_48833 ) ) ( not ( = ?auto_48817 ?auto_48833 ) ) ( not ( = ?auto_48818 ?auto_48833 ) ) ( not ( = ?auto_48819 ?auto_48833 ) ) ( not ( = ?auto_48828 ?auto_48833 ) ) ( not ( = ?auto_48835 ?auto_48833 ) ) ( not ( = ?auto_48823 ?auto_48833 ) ) ( not ( = ?auto_48827 ?auto_48833 ) ) ( IS-CRATE ?auto_48827 ) ( not ( = ?auto_48816 ?auto_48825 ) ) ( not ( = ?auto_48817 ?auto_48825 ) ) ( not ( = ?auto_48818 ?auto_48825 ) ) ( not ( = ?auto_48819 ?auto_48825 ) ) ( not ( = ?auto_48828 ?auto_48825 ) ) ( not ( = ?auto_48835 ?auto_48825 ) ) ( not ( = ?auto_48823 ?auto_48825 ) ) ( not ( = ?auto_48827 ?auto_48825 ) ) ( not ( = ?auto_48833 ?auto_48825 ) ) ( not ( = ?auto_48820 ?auto_48832 ) ) ( not ( = ?auto_48822 ?auto_48820 ) ) ( not ( = ?auto_48821 ?auto_48820 ) ) ( not ( = ?auto_48840 ?auto_48820 ) ) ( not ( = ?auto_48826 ?auto_48820 ) ) ( HOIST-AT ?auto_48837 ?auto_48820 ) ( not ( = ?auto_48834 ?auto_48837 ) ) ( not ( = ?auto_48839 ?auto_48837 ) ) ( not ( = ?auto_48836 ?auto_48837 ) ) ( not ( = ?auto_48842 ?auto_48837 ) ) ( not ( = ?auto_48831 ?auto_48837 ) ) ( AVAILABLE ?auto_48837 ) ( SURFACE-AT ?auto_48827 ?auto_48820 ) ( ON ?auto_48827 ?auto_48838 ) ( CLEAR ?auto_48827 ) ( not ( = ?auto_48816 ?auto_48838 ) ) ( not ( = ?auto_48817 ?auto_48838 ) ) ( not ( = ?auto_48818 ?auto_48838 ) ) ( not ( = ?auto_48819 ?auto_48838 ) ) ( not ( = ?auto_48828 ?auto_48838 ) ) ( not ( = ?auto_48835 ?auto_48838 ) ) ( not ( = ?auto_48823 ?auto_48838 ) ) ( not ( = ?auto_48827 ?auto_48838 ) ) ( not ( = ?auto_48833 ?auto_48838 ) ) ( not ( = ?auto_48825 ?auto_48838 ) ) ( SURFACE-AT ?auto_48843 ?auto_48832 ) ( CLEAR ?auto_48843 ) ( IS-CRATE ?auto_48825 ) ( not ( = ?auto_48816 ?auto_48843 ) ) ( not ( = ?auto_48817 ?auto_48843 ) ) ( not ( = ?auto_48818 ?auto_48843 ) ) ( not ( = ?auto_48819 ?auto_48843 ) ) ( not ( = ?auto_48828 ?auto_48843 ) ) ( not ( = ?auto_48835 ?auto_48843 ) ) ( not ( = ?auto_48823 ?auto_48843 ) ) ( not ( = ?auto_48827 ?auto_48843 ) ) ( not ( = ?auto_48833 ?auto_48843 ) ) ( not ( = ?auto_48825 ?auto_48843 ) ) ( not ( = ?auto_48838 ?auto_48843 ) ) ( AVAILABLE ?auto_48834 ) ( not ( = ?auto_48829 ?auto_48832 ) ) ( not ( = ?auto_48822 ?auto_48829 ) ) ( not ( = ?auto_48821 ?auto_48829 ) ) ( not ( = ?auto_48840 ?auto_48829 ) ) ( not ( = ?auto_48826 ?auto_48829 ) ) ( not ( = ?auto_48820 ?auto_48829 ) ) ( HOIST-AT ?auto_48824 ?auto_48829 ) ( not ( = ?auto_48834 ?auto_48824 ) ) ( not ( = ?auto_48839 ?auto_48824 ) ) ( not ( = ?auto_48836 ?auto_48824 ) ) ( not ( = ?auto_48842 ?auto_48824 ) ) ( not ( = ?auto_48831 ?auto_48824 ) ) ( not ( = ?auto_48837 ?auto_48824 ) ) ( AVAILABLE ?auto_48824 ) ( SURFACE-AT ?auto_48825 ?auto_48829 ) ( ON ?auto_48825 ?auto_48841 ) ( CLEAR ?auto_48825 ) ( not ( = ?auto_48816 ?auto_48841 ) ) ( not ( = ?auto_48817 ?auto_48841 ) ) ( not ( = ?auto_48818 ?auto_48841 ) ) ( not ( = ?auto_48819 ?auto_48841 ) ) ( not ( = ?auto_48828 ?auto_48841 ) ) ( not ( = ?auto_48835 ?auto_48841 ) ) ( not ( = ?auto_48823 ?auto_48841 ) ) ( not ( = ?auto_48827 ?auto_48841 ) ) ( not ( = ?auto_48833 ?auto_48841 ) ) ( not ( = ?auto_48825 ?auto_48841 ) ) ( not ( = ?auto_48838 ?auto_48841 ) ) ( not ( = ?auto_48843 ?auto_48841 ) ) ( TRUCK-AT ?auto_48830 ?auto_48832 ) )
    :subtasks
    ( ( !DRIVE ?auto_48830 ?auto_48832 ?auto_48829 )
      ( MAKE-ON ?auto_48816 ?auto_48817 )
      ( MAKE-ON-VERIFY ?auto_48816 ?auto_48817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48844 - SURFACE
      ?auto_48845 - SURFACE
    )
    :vars
    (
      ?auto_48868 - HOIST
      ?auto_48849 - PLACE
      ?auto_48854 - PLACE
      ?auto_48850 - HOIST
      ?auto_48857 - SURFACE
      ?auto_48848 - SURFACE
      ?auto_48852 - PLACE
      ?auto_48870 - HOIST
      ?auto_48853 - SURFACE
      ?auto_48869 - SURFACE
      ?auto_48847 - PLACE
      ?auto_48861 - HOIST
      ?auto_48865 - SURFACE
      ?auto_48856 - SURFACE
      ?auto_48860 - PLACE
      ?auto_48863 - HOIST
      ?auto_48846 - SURFACE
      ?auto_48855 - SURFACE
      ?auto_48862 - PLACE
      ?auto_48871 - HOIST
      ?auto_48851 - SURFACE
      ?auto_48866 - SURFACE
      ?auto_48864 - PLACE
      ?auto_48859 - HOIST
      ?auto_48867 - SURFACE
      ?auto_48858 - TRUCK
      ?auto_48872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48868 ?auto_48849 ) ( IS-CRATE ?auto_48844 ) ( not ( = ?auto_48844 ?auto_48845 ) ) ( not ( = ?auto_48854 ?auto_48849 ) ) ( HOIST-AT ?auto_48850 ?auto_48854 ) ( not ( = ?auto_48868 ?auto_48850 ) ) ( AVAILABLE ?auto_48850 ) ( SURFACE-AT ?auto_48844 ?auto_48854 ) ( ON ?auto_48844 ?auto_48857 ) ( CLEAR ?auto_48844 ) ( not ( = ?auto_48844 ?auto_48857 ) ) ( not ( = ?auto_48845 ?auto_48857 ) ) ( IS-CRATE ?auto_48845 ) ( not ( = ?auto_48844 ?auto_48848 ) ) ( not ( = ?auto_48845 ?auto_48848 ) ) ( not ( = ?auto_48857 ?auto_48848 ) ) ( not ( = ?auto_48852 ?auto_48849 ) ) ( not ( = ?auto_48854 ?auto_48852 ) ) ( HOIST-AT ?auto_48870 ?auto_48852 ) ( not ( = ?auto_48868 ?auto_48870 ) ) ( not ( = ?auto_48850 ?auto_48870 ) ) ( AVAILABLE ?auto_48870 ) ( SURFACE-AT ?auto_48845 ?auto_48852 ) ( ON ?auto_48845 ?auto_48853 ) ( CLEAR ?auto_48845 ) ( not ( = ?auto_48844 ?auto_48853 ) ) ( not ( = ?auto_48845 ?auto_48853 ) ) ( not ( = ?auto_48857 ?auto_48853 ) ) ( not ( = ?auto_48848 ?auto_48853 ) ) ( IS-CRATE ?auto_48848 ) ( not ( = ?auto_48844 ?auto_48869 ) ) ( not ( = ?auto_48845 ?auto_48869 ) ) ( not ( = ?auto_48857 ?auto_48869 ) ) ( not ( = ?auto_48848 ?auto_48869 ) ) ( not ( = ?auto_48853 ?auto_48869 ) ) ( not ( = ?auto_48847 ?auto_48849 ) ) ( not ( = ?auto_48854 ?auto_48847 ) ) ( not ( = ?auto_48852 ?auto_48847 ) ) ( HOIST-AT ?auto_48861 ?auto_48847 ) ( not ( = ?auto_48868 ?auto_48861 ) ) ( not ( = ?auto_48850 ?auto_48861 ) ) ( not ( = ?auto_48870 ?auto_48861 ) ) ( AVAILABLE ?auto_48861 ) ( SURFACE-AT ?auto_48848 ?auto_48847 ) ( ON ?auto_48848 ?auto_48865 ) ( CLEAR ?auto_48848 ) ( not ( = ?auto_48844 ?auto_48865 ) ) ( not ( = ?auto_48845 ?auto_48865 ) ) ( not ( = ?auto_48857 ?auto_48865 ) ) ( not ( = ?auto_48848 ?auto_48865 ) ) ( not ( = ?auto_48853 ?auto_48865 ) ) ( not ( = ?auto_48869 ?auto_48865 ) ) ( IS-CRATE ?auto_48869 ) ( not ( = ?auto_48844 ?auto_48856 ) ) ( not ( = ?auto_48845 ?auto_48856 ) ) ( not ( = ?auto_48857 ?auto_48856 ) ) ( not ( = ?auto_48848 ?auto_48856 ) ) ( not ( = ?auto_48853 ?auto_48856 ) ) ( not ( = ?auto_48869 ?auto_48856 ) ) ( not ( = ?auto_48865 ?auto_48856 ) ) ( not ( = ?auto_48860 ?auto_48849 ) ) ( not ( = ?auto_48854 ?auto_48860 ) ) ( not ( = ?auto_48852 ?auto_48860 ) ) ( not ( = ?auto_48847 ?auto_48860 ) ) ( HOIST-AT ?auto_48863 ?auto_48860 ) ( not ( = ?auto_48868 ?auto_48863 ) ) ( not ( = ?auto_48850 ?auto_48863 ) ) ( not ( = ?auto_48870 ?auto_48863 ) ) ( not ( = ?auto_48861 ?auto_48863 ) ) ( AVAILABLE ?auto_48863 ) ( SURFACE-AT ?auto_48869 ?auto_48860 ) ( ON ?auto_48869 ?auto_48846 ) ( CLEAR ?auto_48869 ) ( not ( = ?auto_48844 ?auto_48846 ) ) ( not ( = ?auto_48845 ?auto_48846 ) ) ( not ( = ?auto_48857 ?auto_48846 ) ) ( not ( = ?auto_48848 ?auto_48846 ) ) ( not ( = ?auto_48853 ?auto_48846 ) ) ( not ( = ?auto_48869 ?auto_48846 ) ) ( not ( = ?auto_48865 ?auto_48846 ) ) ( not ( = ?auto_48856 ?auto_48846 ) ) ( IS-CRATE ?auto_48856 ) ( not ( = ?auto_48844 ?auto_48855 ) ) ( not ( = ?auto_48845 ?auto_48855 ) ) ( not ( = ?auto_48857 ?auto_48855 ) ) ( not ( = ?auto_48848 ?auto_48855 ) ) ( not ( = ?auto_48853 ?auto_48855 ) ) ( not ( = ?auto_48869 ?auto_48855 ) ) ( not ( = ?auto_48865 ?auto_48855 ) ) ( not ( = ?auto_48856 ?auto_48855 ) ) ( not ( = ?auto_48846 ?auto_48855 ) ) ( not ( = ?auto_48862 ?auto_48849 ) ) ( not ( = ?auto_48854 ?auto_48862 ) ) ( not ( = ?auto_48852 ?auto_48862 ) ) ( not ( = ?auto_48847 ?auto_48862 ) ) ( not ( = ?auto_48860 ?auto_48862 ) ) ( HOIST-AT ?auto_48871 ?auto_48862 ) ( not ( = ?auto_48868 ?auto_48871 ) ) ( not ( = ?auto_48850 ?auto_48871 ) ) ( not ( = ?auto_48870 ?auto_48871 ) ) ( not ( = ?auto_48861 ?auto_48871 ) ) ( not ( = ?auto_48863 ?auto_48871 ) ) ( AVAILABLE ?auto_48871 ) ( SURFACE-AT ?auto_48856 ?auto_48862 ) ( ON ?auto_48856 ?auto_48851 ) ( CLEAR ?auto_48856 ) ( not ( = ?auto_48844 ?auto_48851 ) ) ( not ( = ?auto_48845 ?auto_48851 ) ) ( not ( = ?auto_48857 ?auto_48851 ) ) ( not ( = ?auto_48848 ?auto_48851 ) ) ( not ( = ?auto_48853 ?auto_48851 ) ) ( not ( = ?auto_48869 ?auto_48851 ) ) ( not ( = ?auto_48865 ?auto_48851 ) ) ( not ( = ?auto_48856 ?auto_48851 ) ) ( not ( = ?auto_48846 ?auto_48851 ) ) ( not ( = ?auto_48855 ?auto_48851 ) ) ( IS-CRATE ?auto_48855 ) ( not ( = ?auto_48844 ?auto_48866 ) ) ( not ( = ?auto_48845 ?auto_48866 ) ) ( not ( = ?auto_48857 ?auto_48866 ) ) ( not ( = ?auto_48848 ?auto_48866 ) ) ( not ( = ?auto_48853 ?auto_48866 ) ) ( not ( = ?auto_48869 ?auto_48866 ) ) ( not ( = ?auto_48865 ?auto_48866 ) ) ( not ( = ?auto_48856 ?auto_48866 ) ) ( not ( = ?auto_48846 ?auto_48866 ) ) ( not ( = ?auto_48855 ?auto_48866 ) ) ( not ( = ?auto_48851 ?auto_48866 ) ) ( not ( = ?auto_48864 ?auto_48849 ) ) ( not ( = ?auto_48854 ?auto_48864 ) ) ( not ( = ?auto_48852 ?auto_48864 ) ) ( not ( = ?auto_48847 ?auto_48864 ) ) ( not ( = ?auto_48860 ?auto_48864 ) ) ( not ( = ?auto_48862 ?auto_48864 ) ) ( HOIST-AT ?auto_48859 ?auto_48864 ) ( not ( = ?auto_48868 ?auto_48859 ) ) ( not ( = ?auto_48850 ?auto_48859 ) ) ( not ( = ?auto_48870 ?auto_48859 ) ) ( not ( = ?auto_48861 ?auto_48859 ) ) ( not ( = ?auto_48863 ?auto_48859 ) ) ( not ( = ?auto_48871 ?auto_48859 ) ) ( AVAILABLE ?auto_48859 ) ( SURFACE-AT ?auto_48855 ?auto_48864 ) ( ON ?auto_48855 ?auto_48867 ) ( CLEAR ?auto_48855 ) ( not ( = ?auto_48844 ?auto_48867 ) ) ( not ( = ?auto_48845 ?auto_48867 ) ) ( not ( = ?auto_48857 ?auto_48867 ) ) ( not ( = ?auto_48848 ?auto_48867 ) ) ( not ( = ?auto_48853 ?auto_48867 ) ) ( not ( = ?auto_48869 ?auto_48867 ) ) ( not ( = ?auto_48865 ?auto_48867 ) ) ( not ( = ?auto_48856 ?auto_48867 ) ) ( not ( = ?auto_48846 ?auto_48867 ) ) ( not ( = ?auto_48855 ?auto_48867 ) ) ( not ( = ?auto_48851 ?auto_48867 ) ) ( not ( = ?auto_48866 ?auto_48867 ) ) ( TRUCK-AT ?auto_48858 ?auto_48849 ) ( SURFACE-AT ?auto_48872 ?auto_48849 ) ( CLEAR ?auto_48872 ) ( LIFTING ?auto_48868 ?auto_48866 ) ( IS-CRATE ?auto_48866 ) ( not ( = ?auto_48844 ?auto_48872 ) ) ( not ( = ?auto_48845 ?auto_48872 ) ) ( not ( = ?auto_48857 ?auto_48872 ) ) ( not ( = ?auto_48848 ?auto_48872 ) ) ( not ( = ?auto_48853 ?auto_48872 ) ) ( not ( = ?auto_48869 ?auto_48872 ) ) ( not ( = ?auto_48865 ?auto_48872 ) ) ( not ( = ?auto_48856 ?auto_48872 ) ) ( not ( = ?auto_48846 ?auto_48872 ) ) ( not ( = ?auto_48855 ?auto_48872 ) ) ( not ( = ?auto_48851 ?auto_48872 ) ) ( not ( = ?auto_48866 ?auto_48872 ) ) ( not ( = ?auto_48867 ?auto_48872 ) ) )
    :subtasks
    ( ( !DROP ?auto_48868 ?auto_48866 ?auto_48872 ?auto_48849 )
      ( MAKE-ON ?auto_48844 ?auto_48845 )
      ( MAKE-ON-VERIFY ?auto_48844 ?auto_48845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48873 - SURFACE
      ?auto_48874 - SURFACE
    )
    :vars
    (
      ?auto_48882 - HOIST
      ?auto_48888 - PLACE
      ?auto_48900 - PLACE
      ?auto_48891 - HOIST
      ?auto_48895 - SURFACE
      ?auto_48899 - SURFACE
      ?auto_48884 - PLACE
      ?auto_48893 - HOIST
      ?auto_48897 - SURFACE
      ?auto_48878 - SURFACE
      ?auto_48890 - PLACE
      ?auto_48883 - HOIST
      ?auto_48879 - SURFACE
      ?auto_48887 - SURFACE
      ?auto_48889 - PLACE
      ?auto_48876 - HOIST
      ?auto_48901 - SURFACE
      ?auto_48898 - SURFACE
      ?auto_48877 - PLACE
      ?auto_48885 - HOIST
      ?auto_48886 - SURFACE
      ?auto_48880 - SURFACE
      ?auto_48875 - PLACE
      ?auto_48896 - HOIST
      ?auto_48881 - SURFACE
      ?auto_48894 - TRUCK
      ?auto_48892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48882 ?auto_48888 ) ( IS-CRATE ?auto_48873 ) ( not ( = ?auto_48873 ?auto_48874 ) ) ( not ( = ?auto_48900 ?auto_48888 ) ) ( HOIST-AT ?auto_48891 ?auto_48900 ) ( not ( = ?auto_48882 ?auto_48891 ) ) ( AVAILABLE ?auto_48891 ) ( SURFACE-AT ?auto_48873 ?auto_48900 ) ( ON ?auto_48873 ?auto_48895 ) ( CLEAR ?auto_48873 ) ( not ( = ?auto_48873 ?auto_48895 ) ) ( not ( = ?auto_48874 ?auto_48895 ) ) ( IS-CRATE ?auto_48874 ) ( not ( = ?auto_48873 ?auto_48899 ) ) ( not ( = ?auto_48874 ?auto_48899 ) ) ( not ( = ?auto_48895 ?auto_48899 ) ) ( not ( = ?auto_48884 ?auto_48888 ) ) ( not ( = ?auto_48900 ?auto_48884 ) ) ( HOIST-AT ?auto_48893 ?auto_48884 ) ( not ( = ?auto_48882 ?auto_48893 ) ) ( not ( = ?auto_48891 ?auto_48893 ) ) ( AVAILABLE ?auto_48893 ) ( SURFACE-AT ?auto_48874 ?auto_48884 ) ( ON ?auto_48874 ?auto_48897 ) ( CLEAR ?auto_48874 ) ( not ( = ?auto_48873 ?auto_48897 ) ) ( not ( = ?auto_48874 ?auto_48897 ) ) ( not ( = ?auto_48895 ?auto_48897 ) ) ( not ( = ?auto_48899 ?auto_48897 ) ) ( IS-CRATE ?auto_48899 ) ( not ( = ?auto_48873 ?auto_48878 ) ) ( not ( = ?auto_48874 ?auto_48878 ) ) ( not ( = ?auto_48895 ?auto_48878 ) ) ( not ( = ?auto_48899 ?auto_48878 ) ) ( not ( = ?auto_48897 ?auto_48878 ) ) ( not ( = ?auto_48890 ?auto_48888 ) ) ( not ( = ?auto_48900 ?auto_48890 ) ) ( not ( = ?auto_48884 ?auto_48890 ) ) ( HOIST-AT ?auto_48883 ?auto_48890 ) ( not ( = ?auto_48882 ?auto_48883 ) ) ( not ( = ?auto_48891 ?auto_48883 ) ) ( not ( = ?auto_48893 ?auto_48883 ) ) ( AVAILABLE ?auto_48883 ) ( SURFACE-AT ?auto_48899 ?auto_48890 ) ( ON ?auto_48899 ?auto_48879 ) ( CLEAR ?auto_48899 ) ( not ( = ?auto_48873 ?auto_48879 ) ) ( not ( = ?auto_48874 ?auto_48879 ) ) ( not ( = ?auto_48895 ?auto_48879 ) ) ( not ( = ?auto_48899 ?auto_48879 ) ) ( not ( = ?auto_48897 ?auto_48879 ) ) ( not ( = ?auto_48878 ?auto_48879 ) ) ( IS-CRATE ?auto_48878 ) ( not ( = ?auto_48873 ?auto_48887 ) ) ( not ( = ?auto_48874 ?auto_48887 ) ) ( not ( = ?auto_48895 ?auto_48887 ) ) ( not ( = ?auto_48899 ?auto_48887 ) ) ( not ( = ?auto_48897 ?auto_48887 ) ) ( not ( = ?auto_48878 ?auto_48887 ) ) ( not ( = ?auto_48879 ?auto_48887 ) ) ( not ( = ?auto_48889 ?auto_48888 ) ) ( not ( = ?auto_48900 ?auto_48889 ) ) ( not ( = ?auto_48884 ?auto_48889 ) ) ( not ( = ?auto_48890 ?auto_48889 ) ) ( HOIST-AT ?auto_48876 ?auto_48889 ) ( not ( = ?auto_48882 ?auto_48876 ) ) ( not ( = ?auto_48891 ?auto_48876 ) ) ( not ( = ?auto_48893 ?auto_48876 ) ) ( not ( = ?auto_48883 ?auto_48876 ) ) ( AVAILABLE ?auto_48876 ) ( SURFACE-AT ?auto_48878 ?auto_48889 ) ( ON ?auto_48878 ?auto_48901 ) ( CLEAR ?auto_48878 ) ( not ( = ?auto_48873 ?auto_48901 ) ) ( not ( = ?auto_48874 ?auto_48901 ) ) ( not ( = ?auto_48895 ?auto_48901 ) ) ( not ( = ?auto_48899 ?auto_48901 ) ) ( not ( = ?auto_48897 ?auto_48901 ) ) ( not ( = ?auto_48878 ?auto_48901 ) ) ( not ( = ?auto_48879 ?auto_48901 ) ) ( not ( = ?auto_48887 ?auto_48901 ) ) ( IS-CRATE ?auto_48887 ) ( not ( = ?auto_48873 ?auto_48898 ) ) ( not ( = ?auto_48874 ?auto_48898 ) ) ( not ( = ?auto_48895 ?auto_48898 ) ) ( not ( = ?auto_48899 ?auto_48898 ) ) ( not ( = ?auto_48897 ?auto_48898 ) ) ( not ( = ?auto_48878 ?auto_48898 ) ) ( not ( = ?auto_48879 ?auto_48898 ) ) ( not ( = ?auto_48887 ?auto_48898 ) ) ( not ( = ?auto_48901 ?auto_48898 ) ) ( not ( = ?auto_48877 ?auto_48888 ) ) ( not ( = ?auto_48900 ?auto_48877 ) ) ( not ( = ?auto_48884 ?auto_48877 ) ) ( not ( = ?auto_48890 ?auto_48877 ) ) ( not ( = ?auto_48889 ?auto_48877 ) ) ( HOIST-AT ?auto_48885 ?auto_48877 ) ( not ( = ?auto_48882 ?auto_48885 ) ) ( not ( = ?auto_48891 ?auto_48885 ) ) ( not ( = ?auto_48893 ?auto_48885 ) ) ( not ( = ?auto_48883 ?auto_48885 ) ) ( not ( = ?auto_48876 ?auto_48885 ) ) ( AVAILABLE ?auto_48885 ) ( SURFACE-AT ?auto_48887 ?auto_48877 ) ( ON ?auto_48887 ?auto_48886 ) ( CLEAR ?auto_48887 ) ( not ( = ?auto_48873 ?auto_48886 ) ) ( not ( = ?auto_48874 ?auto_48886 ) ) ( not ( = ?auto_48895 ?auto_48886 ) ) ( not ( = ?auto_48899 ?auto_48886 ) ) ( not ( = ?auto_48897 ?auto_48886 ) ) ( not ( = ?auto_48878 ?auto_48886 ) ) ( not ( = ?auto_48879 ?auto_48886 ) ) ( not ( = ?auto_48887 ?auto_48886 ) ) ( not ( = ?auto_48901 ?auto_48886 ) ) ( not ( = ?auto_48898 ?auto_48886 ) ) ( IS-CRATE ?auto_48898 ) ( not ( = ?auto_48873 ?auto_48880 ) ) ( not ( = ?auto_48874 ?auto_48880 ) ) ( not ( = ?auto_48895 ?auto_48880 ) ) ( not ( = ?auto_48899 ?auto_48880 ) ) ( not ( = ?auto_48897 ?auto_48880 ) ) ( not ( = ?auto_48878 ?auto_48880 ) ) ( not ( = ?auto_48879 ?auto_48880 ) ) ( not ( = ?auto_48887 ?auto_48880 ) ) ( not ( = ?auto_48901 ?auto_48880 ) ) ( not ( = ?auto_48898 ?auto_48880 ) ) ( not ( = ?auto_48886 ?auto_48880 ) ) ( not ( = ?auto_48875 ?auto_48888 ) ) ( not ( = ?auto_48900 ?auto_48875 ) ) ( not ( = ?auto_48884 ?auto_48875 ) ) ( not ( = ?auto_48890 ?auto_48875 ) ) ( not ( = ?auto_48889 ?auto_48875 ) ) ( not ( = ?auto_48877 ?auto_48875 ) ) ( HOIST-AT ?auto_48896 ?auto_48875 ) ( not ( = ?auto_48882 ?auto_48896 ) ) ( not ( = ?auto_48891 ?auto_48896 ) ) ( not ( = ?auto_48893 ?auto_48896 ) ) ( not ( = ?auto_48883 ?auto_48896 ) ) ( not ( = ?auto_48876 ?auto_48896 ) ) ( not ( = ?auto_48885 ?auto_48896 ) ) ( AVAILABLE ?auto_48896 ) ( SURFACE-AT ?auto_48898 ?auto_48875 ) ( ON ?auto_48898 ?auto_48881 ) ( CLEAR ?auto_48898 ) ( not ( = ?auto_48873 ?auto_48881 ) ) ( not ( = ?auto_48874 ?auto_48881 ) ) ( not ( = ?auto_48895 ?auto_48881 ) ) ( not ( = ?auto_48899 ?auto_48881 ) ) ( not ( = ?auto_48897 ?auto_48881 ) ) ( not ( = ?auto_48878 ?auto_48881 ) ) ( not ( = ?auto_48879 ?auto_48881 ) ) ( not ( = ?auto_48887 ?auto_48881 ) ) ( not ( = ?auto_48901 ?auto_48881 ) ) ( not ( = ?auto_48898 ?auto_48881 ) ) ( not ( = ?auto_48886 ?auto_48881 ) ) ( not ( = ?auto_48880 ?auto_48881 ) ) ( TRUCK-AT ?auto_48894 ?auto_48888 ) ( SURFACE-AT ?auto_48892 ?auto_48888 ) ( CLEAR ?auto_48892 ) ( IS-CRATE ?auto_48880 ) ( not ( = ?auto_48873 ?auto_48892 ) ) ( not ( = ?auto_48874 ?auto_48892 ) ) ( not ( = ?auto_48895 ?auto_48892 ) ) ( not ( = ?auto_48899 ?auto_48892 ) ) ( not ( = ?auto_48897 ?auto_48892 ) ) ( not ( = ?auto_48878 ?auto_48892 ) ) ( not ( = ?auto_48879 ?auto_48892 ) ) ( not ( = ?auto_48887 ?auto_48892 ) ) ( not ( = ?auto_48901 ?auto_48892 ) ) ( not ( = ?auto_48898 ?auto_48892 ) ) ( not ( = ?auto_48886 ?auto_48892 ) ) ( not ( = ?auto_48880 ?auto_48892 ) ) ( not ( = ?auto_48881 ?auto_48892 ) ) ( AVAILABLE ?auto_48882 ) ( IN ?auto_48880 ?auto_48894 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48882 ?auto_48880 ?auto_48894 ?auto_48888 )
      ( MAKE-ON ?auto_48873 ?auto_48874 )
      ( MAKE-ON-VERIFY ?auto_48873 ?auto_48874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48902 - SURFACE
      ?auto_48903 - SURFACE
    )
    :vars
    (
      ?auto_48928 - HOIST
      ?auto_48909 - PLACE
      ?auto_48912 - PLACE
      ?auto_48915 - HOIST
      ?auto_48919 - SURFACE
      ?auto_48911 - SURFACE
      ?auto_48910 - PLACE
      ?auto_48917 - HOIST
      ?auto_48921 - SURFACE
      ?auto_48925 - SURFACE
      ?auto_48922 - PLACE
      ?auto_48924 - HOIST
      ?auto_48923 - SURFACE
      ?auto_48926 - SURFACE
      ?auto_48930 - PLACE
      ?auto_48906 - HOIST
      ?auto_48913 - SURFACE
      ?auto_48914 - SURFACE
      ?auto_48908 - PLACE
      ?auto_48904 - HOIST
      ?auto_48907 - SURFACE
      ?auto_48927 - SURFACE
      ?auto_48929 - PLACE
      ?auto_48920 - HOIST
      ?auto_48905 - SURFACE
      ?auto_48916 - SURFACE
      ?auto_48918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48928 ?auto_48909 ) ( IS-CRATE ?auto_48902 ) ( not ( = ?auto_48902 ?auto_48903 ) ) ( not ( = ?auto_48912 ?auto_48909 ) ) ( HOIST-AT ?auto_48915 ?auto_48912 ) ( not ( = ?auto_48928 ?auto_48915 ) ) ( AVAILABLE ?auto_48915 ) ( SURFACE-AT ?auto_48902 ?auto_48912 ) ( ON ?auto_48902 ?auto_48919 ) ( CLEAR ?auto_48902 ) ( not ( = ?auto_48902 ?auto_48919 ) ) ( not ( = ?auto_48903 ?auto_48919 ) ) ( IS-CRATE ?auto_48903 ) ( not ( = ?auto_48902 ?auto_48911 ) ) ( not ( = ?auto_48903 ?auto_48911 ) ) ( not ( = ?auto_48919 ?auto_48911 ) ) ( not ( = ?auto_48910 ?auto_48909 ) ) ( not ( = ?auto_48912 ?auto_48910 ) ) ( HOIST-AT ?auto_48917 ?auto_48910 ) ( not ( = ?auto_48928 ?auto_48917 ) ) ( not ( = ?auto_48915 ?auto_48917 ) ) ( AVAILABLE ?auto_48917 ) ( SURFACE-AT ?auto_48903 ?auto_48910 ) ( ON ?auto_48903 ?auto_48921 ) ( CLEAR ?auto_48903 ) ( not ( = ?auto_48902 ?auto_48921 ) ) ( not ( = ?auto_48903 ?auto_48921 ) ) ( not ( = ?auto_48919 ?auto_48921 ) ) ( not ( = ?auto_48911 ?auto_48921 ) ) ( IS-CRATE ?auto_48911 ) ( not ( = ?auto_48902 ?auto_48925 ) ) ( not ( = ?auto_48903 ?auto_48925 ) ) ( not ( = ?auto_48919 ?auto_48925 ) ) ( not ( = ?auto_48911 ?auto_48925 ) ) ( not ( = ?auto_48921 ?auto_48925 ) ) ( not ( = ?auto_48922 ?auto_48909 ) ) ( not ( = ?auto_48912 ?auto_48922 ) ) ( not ( = ?auto_48910 ?auto_48922 ) ) ( HOIST-AT ?auto_48924 ?auto_48922 ) ( not ( = ?auto_48928 ?auto_48924 ) ) ( not ( = ?auto_48915 ?auto_48924 ) ) ( not ( = ?auto_48917 ?auto_48924 ) ) ( AVAILABLE ?auto_48924 ) ( SURFACE-AT ?auto_48911 ?auto_48922 ) ( ON ?auto_48911 ?auto_48923 ) ( CLEAR ?auto_48911 ) ( not ( = ?auto_48902 ?auto_48923 ) ) ( not ( = ?auto_48903 ?auto_48923 ) ) ( not ( = ?auto_48919 ?auto_48923 ) ) ( not ( = ?auto_48911 ?auto_48923 ) ) ( not ( = ?auto_48921 ?auto_48923 ) ) ( not ( = ?auto_48925 ?auto_48923 ) ) ( IS-CRATE ?auto_48925 ) ( not ( = ?auto_48902 ?auto_48926 ) ) ( not ( = ?auto_48903 ?auto_48926 ) ) ( not ( = ?auto_48919 ?auto_48926 ) ) ( not ( = ?auto_48911 ?auto_48926 ) ) ( not ( = ?auto_48921 ?auto_48926 ) ) ( not ( = ?auto_48925 ?auto_48926 ) ) ( not ( = ?auto_48923 ?auto_48926 ) ) ( not ( = ?auto_48930 ?auto_48909 ) ) ( not ( = ?auto_48912 ?auto_48930 ) ) ( not ( = ?auto_48910 ?auto_48930 ) ) ( not ( = ?auto_48922 ?auto_48930 ) ) ( HOIST-AT ?auto_48906 ?auto_48930 ) ( not ( = ?auto_48928 ?auto_48906 ) ) ( not ( = ?auto_48915 ?auto_48906 ) ) ( not ( = ?auto_48917 ?auto_48906 ) ) ( not ( = ?auto_48924 ?auto_48906 ) ) ( AVAILABLE ?auto_48906 ) ( SURFACE-AT ?auto_48925 ?auto_48930 ) ( ON ?auto_48925 ?auto_48913 ) ( CLEAR ?auto_48925 ) ( not ( = ?auto_48902 ?auto_48913 ) ) ( not ( = ?auto_48903 ?auto_48913 ) ) ( not ( = ?auto_48919 ?auto_48913 ) ) ( not ( = ?auto_48911 ?auto_48913 ) ) ( not ( = ?auto_48921 ?auto_48913 ) ) ( not ( = ?auto_48925 ?auto_48913 ) ) ( not ( = ?auto_48923 ?auto_48913 ) ) ( not ( = ?auto_48926 ?auto_48913 ) ) ( IS-CRATE ?auto_48926 ) ( not ( = ?auto_48902 ?auto_48914 ) ) ( not ( = ?auto_48903 ?auto_48914 ) ) ( not ( = ?auto_48919 ?auto_48914 ) ) ( not ( = ?auto_48911 ?auto_48914 ) ) ( not ( = ?auto_48921 ?auto_48914 ) ) ( not ( = ?auto_48925 ?auto_48914 ) ) ( not ( = ?auto_48923 ?auto_48914 ) ) ( not ( = ?auto_48926 ?auto_48914 ) ) ( not ( = ?auto_48913 ?auto_48914 ) ) ( not ( = ?auto_48908 ?auto_48909 ) ) ( not ( = ?auto_48912 ?auto_48908 ) ) ( not ( = ?auto_48910 ?auto_48908 ) ) ( not ( = ?auto_48922 ?auto_48908 ) ) ( not ( = ?auto_48930 ?auto_48908 ) ) ( HOIST-AT ?auto_48904 ?auto_48908 ) ( not ( = ?auto_48928 ?auto_48904 ) ) ( not ( = ?auto_48915 ?auto_48904 ) ) ( not ( = ?auto_48917 ?auto_48904 ) ) ( not ( = ?auto_48924 ?auto_48904 ) ) ( not ( = ?auto_48906 ?auto_48904 ) ) ( AVAILABLE ?auto_48904 ) ( SURFACE-AT ?auto_48926 ?auto_48908 ) ( ON ?auto_48926 ?auto_48907 ) ( CLEAR ?auto_48926 ) ( not ( = ?auto_48902 ?auto_48907 ) ) ( not ( = ?auto_48903 ?auto_48907 ) ) ( not ( = ?auto_48919 ?auto_48907 ) ) ( not ( = ?auto_48911 ?auto_48907 ) ) ( not ( = ?auto_48921 ?auto_48907 ) ) ( not ( = ?auto_48925 ?auto_48907 ) ) ( not ( = ?auto_48923 ?auto_48907 ) ) ( not ( = ?auto_48926 ?auto_48907 ) ) ( not ( = ?auto_48913 ?auto_48907 ) ) ( not ( = ?auto_48914 ?auto_48907 ) ) ( IS-CRATE ?auto_48914 ) ( not ( = ?auto_48902 ?auto_48927 ) ) ( not ( = ?auto_48903 ?auto_48927 ) ) ( not ( = ?auto_48919 ?auto_48927 ) ) ( not ( = ?auto_48911 ?auto_48927 ) ) ( not ( = ?auto_48921 ?auto_48927 ) ) ( not ( = ?auto_48925 ?auto_48927 ) ) ( not ( = ?auto_48923 ?auto_48927 ) ) ( not ( = ?auto_48926 ?auto_48927 ) ) ( not ( = ?auto_48913 ?auto_48927 ) ) ( not ( = ?auto_48914 ?auto_48927 ) ) ( not ( = ?auto_48907 ?auto_48927 ) ) ( not ( = ?auto_48929 ?auto_48909 ) ) ( not ( = ?auto_48912 ?auto_48929 ) ) ( not ( = ?auto_48910 ?auto_48929 ) ) ( not ( = ?auto_48922 ?auto_48929 ) ) ( not ( = ?auto_48930 ?auto_48929 ) ) ( not ( = ?auto_48908 ?auto_48929 ) ) ( HOIST-AT ?auto_48920 ?auto_48929 ) ( not ( = ?auto_48928 ?auto_48920 ) ) ( not ( = ?auto_48915 ?auto_48920 ) ) ( not ( = ?auto_48917 ?auto_48920 ) ) ( not ( = ?auto_48924 ?auto_48920 ) ) ( not ( = ?auto_48906 ?auto_48920 ) ) ( not ( = ?auto_48904 ?auto_48920 ) ) ( AVAILABLE ?auto_48920 ) ( SURFACE-AT ?auto_48914 ?auto_48929 ) ( ON ?auto_48914 ?auto_48905 ) ( CLEAR ?auto_48914 ) ( not ( = ?auto_48902 ?auto_48905 ) ) ( not ( = ?auto_48903 ?auto_48905 ) ) ( not ( = ?auto_48919 ?auto_48905 ) ) ( not ( = ?auto_48911 ?auto_48905 ) ) ( not ( = ?auto_48921 ?auto_48905 ) ) ( not ( = ?auto_48925 ?auto_48905 ) ) ( not ( = ?auto_48923 ?auto_48905 ) ) ( not ( = ?auto_48926 ?auto_48905 ) ) ( not ( = ?auto_48913 ?auto_48905 ) ) ( not ( = ?auto_48914 ?auto_48905 ) ) ( not ( = ?auto_48907 ?auto_48905 ) ) ( not ( = ?auto_48927 ?auto_48905 ) ) ( SURFACE-AT ?auto_48916 ?auto_48909 ) ( CLEAR ?auto_48916 ) ( IS-CRATE ?auto_48927 ) ( not ( = ?auto_48902 ?auto_48916 ) ) ( not ( = ?auto_48903 ?auto_48916 ) ) ( not ( = ?auto_48919 ?auto_48916 ) ) ( not ( = ?auto_48911 ?auto_48916 ) ) ( not ( = ?auto_48921 ?auto_48916 ) ) ( not ( = ?auto_48925 ?auto_48916 ) ) ( not ( = ?auto_48923 ?auto_48916 ) ) ( not ( = ?auto_48926 ?auto_48916 ) ) ( not ( = ?auto_48913 ?auto_48916 ) ) ( not ( = ?auto_48914 ?auto_48916 ) ) ( not ( = ?auto_48907 ?auto_48916 ) ) ( not ( = ?auto_48927 ?auto_48916 ) ) ( not ( = ?auto_48905 ?auto_48916 ) ) ( AVAILABLE ?auto_48928 ) ( IN ?auto_48927 ?auto_48918 ) ( TRUCK-AT ?auto_48918 ?auto_48910 ) )
    :subtasks
    ( ( !DRIVE ?auto_48918 ?auto_48910 ?auto_48909 )
      ( MAKE-ON ?auto_48902 ?auto_48903 )
      ( MAKE-ON-VERIFY ?auto_48902 ?auto_48903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48931 - SURFACE
      ?auto_48932 - SURFACE
    )
    :vars
    (
      ?auto_48950 - HOIST
      ?auto_48954 - PLACE
      ?auto_48956 - PLACE
      ?auto_48955 - HOIST
      ?auto_48942 - SURFACE
      ?auto_48939 - SURFACE
      ?auto_48959 - PLACE
      ?auto_48947 - HOIST
      ?auto_48940 - SURFACE
      ?auto_48943 - SURFACE
      ?auto_48936 - PLACE
      ?auto_48933 - HOIST
      ?auto_48941 - SURFACE
      ?auto_48946 - SURFACE
      ?auto_48952 - PLACE
      ?auto_48945 - HOIST
      ?auto_48938 - SURFACE
      ?auto_48948 - SURFACE
      ?auto_48949 - PLACE
      ?auto_48944 - HOIST
      ?auto_48953 - SURFACE
      ?auto_48935 - SURFACE
      ?auto_48951 - PLACE
      ?auto_48934 - HOIST
      ?auto_48957 - SURFACE
      ?auto_48937 - SURFACE
      ?auto_48958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48950 ?auto_48954 ) ( IS-CRATE ?auto_48931 ) ( not ( = ?auto_48931 ?auto_48932 ) ) ( not ( = ?auto_48956 ?auto_48954 ) ) ( HOIST-AT ?auto_48955 ?auto_48956 ) ( not ( = ?auto_48950 ?auto_48955 ) ) ( AVAILABLE ?auto_48955 ) ( SURFACE-AT ?auto_48931 ?auto_48956 ) ( ON ?auto_48931 ?auto_48942 ) ( CLEAR ?auto_48931 ) ( not ( = ?auto_48931 ?auto_48942 ) ) ( not ( = ?auto_48932 ?auto_48942 ) ) ( IS-CRATE ?auto_48932 ) ( not ( = ?auto_48931 ?auto_48939 ) ) ( not ( = ?auto_48932 ?auto_48939 ) ) ( not ( = ?auto_48942 ?auto_48939 ) ) ( not ( = ?auto_48959 ?auto_48954 ) ) ( not ( = ?auto_48956 ?auto_48959 ) ) ( HOIST-AT ?auto_48947 ?auto_48959 ) ( not ( = ?auto_48950 ?auto_48947 ) ) ( not ( = ?auto_48955 ?auto_48947 ) ) ( SURFACE-AT ?auto_48932 ?auto_48959 ) ( ON ?auto_48932 ?auto_48940 ) ( CLEAR ?auto_48932 ) ( not ( = ?auto_48931 ?auto_48940 ) ) ( not ( = ?auto_48932 ?auto_48940 ) ) ( not ( = ?auto_48942 ?auto_48940 ) ) ( not ( = ?auto_48939 ?auto_48940 ) ) ( IS-CRATE ?auto_48939 ) ( not ( = ?auto_48931 ?auto_48943 ) ) ( not ( = ?auto_48932 ?auto_48943 ) ) ( not ( = ?auto_48942 ?auto_48943 ) ) ( not ( = ?auto_48939 ?auto_48943 ) ) ( not ( = ?auto_48940 ?auto_48943 ) ) ( not ( = ?auto_48936 ?auto_48954 ) ) ( not ( = ?auto_48956 ?auto_48936 ) ) ( not ( = ?auto_48959 ?auto_48936 ) ) ( HOIST-AT ?auto_48933 ?auto_48936 ) ( not ( = ?auto_48950 ?auto_48933 ) ) ( not ( = ?auto_48955 ?auto_48933 ) ) ( not ( = ?auto_48947 ?auto_48933 ) ) ( AVAILABLE ?auto_48933 ) ( SURFACE-AT ?auto_48939 ?auto_48936 ) ( ON ?auto_48939 ?auto_48941 ) ( CLEAR ?auto_48939 ) ( not ( = ?auto_48931 ?auto_48941 ) ) ( not ( = ?auto_48932 ?auto_48941 ) ) ( not ( = ?auto_48942 ?auto_48941 ) ) ( not ( = ?auto_48939 ?auto_48941 ) ) ( not ( = ?auto_48940 ?auto_48941 ) ) ( not ( = ?auto_48943 ?auto_48941 ) ) ( IS-CRATE ?auto_48943 ) ( not ( = ?auto_48931 ?auto_48946 ) ) ( not ( = ?auto_48932 ?auto_48946 ) ) ( not ( = ?auto_48942 ?auto_48946 ) ) ( not ( = ?auto_48939 ?auto_48946 ) ) ( not ( = ?auto_48940 ?auto_48946 ) ) ( not ( = ?auto_48943 ?auto_48946 ) ) ( not ( = ?auto_48941 ?auto_48946 ) ) ( not ( = ?auto_48952 ?auto_48954 ) ) ( not ( = ?auto_48956 ?auto_48952 ) ) ( not ( = ?auto_48959 ?auto_48952 ) ) ( not ( = ?auto_48936 ?auto_48952 ) ) ( HOIST-AT ?auto_48945 ?auto_48952 ) ( not ( = ?auto_48950 ?auto_48945 ) ) ( not ( = ?auto_48955 ?auto_48945 ) ) ( not ( = ?auto_48947 ?auto_48945 ) ) ( not ( = ?auto_48933 ?auto_48945 ) ) ( AVAILABLE ?auto_48945 ) ( SURFACE-AT ?auto_48943 ?auto_48952 ) ( ON ?auto_48943 ?auto_48938 ) ( CLEAR ?auto_48943 ) ( not ( = ?auto_48931 ?auto_48938 ) ) ( not ( = ?auto_48932 ?auto_48938 ) ) ( not ( = ?auto_48942 ?auto_48938 ) ) ( not ( = ?auto_48939 ?auto_48938 ) ) ( not ( = ?auto_48940 ?auto_48938 ) ) ( not ( = ?auto_48943 ?auto_48938 ) ) ( not ( = ?auto_48941 ?auto_48938 ) ) ( not ( = ?auto_48946 ?auto_48938 ) ) ( IS-CRATE ?auto_48946 ) ( not ( = ?auto_48931 ?auto_48948 ) ) ( not ( = ?auto_48932 ?auto_48948 ) ) ( not ( = ?auto_48942 ?auto_48948 ) ) ( not ( = ?auto_48939 ?auto_48948 ) ) ( not ( = ?auto_48940 ?auto_48948 ) ) ( not ( = ?auto_48943 ?auto_48948 ) ) ( not ( = ?auto_48941 ?auto_48948 ) ) ( not ( = ?auto_48946 ?auto_48948 ) ) ( not ( = ?auto_48938 ?auto_48948 ) ) ( not ( = ?auto_48949 ?auto_48954 ) ) ( not ( = ?auto_48956 ?auto_48949 ) ) ( not ( = ?auto_48959 ?auto_48949 ) ) ( not ( = ?auto_48936 ?auto_48949 ) ) ( not ( = ?auto_48952 ?auto_48949 ) ) ( HOIST-AT ?auto_48944 ?auto_48949 ) ( not ( = ?auto_48950 ?auto_48944 ) ) ( not ( = ?auto_48955 ?auto_48944 ) ) ( not ( = ?auto_48947 ?auto_48944 ) ) ( not ( = ?auto_48933 ?auto_48944 ) ) ( not ( = ?auto_48945 ?auto_48944 ) ) ( AVAILABLE ?auto_48944 ) ( SURFACE-AT ?auto_48946 ?auto_48949 ) ( ON ?auto_48946 ?auto_48953 ) ( CLEAR ?auto_48946 ) ( not ( = ?auto_48931 ?auto_48953 ) ) ( not ( = ?auto_48932 ?auto_48953 ) ) ( not ( = ?auto_48942 ?auto_48953 ) ) ( not ( = ?auto_48939 ?auto_48953 ) ) ( not ( = ?auto_48940 ?auto_48953 ) ) ( not ( = ?auto_48943 ?auto_48953 ) ) ( not ( = ?auto_48941 ?auto_48953 ) ) ( not ( = ?auto_48946 ?auto_48953 ) ) ( not ( = ?auto_48938 ?auto_48953 ) ) ( not ( = ?auto_48948 ?auto_48953 ) ) ( IS-CRATE ?auto_48948 ) ( not ( = ?auto_48931 ?auto_48935 ) ) ( not ( = ?auto_48932 ?auto_48935 ) ) ( not ( = ?auto_48942 ?auto_48935 ) ) ( not ( = ?auto_48939 ?auto_48935 ) ) ( not ( = ?auto_48940 ?auto_48935 ) ) ( not ( = ?auto_48943 ?auto_48935 ) ) ( not ( = ?auto_48941 ?auto_48935 ) ) ( not ( = ?auto_48946 ?auto_48935 ) ) ( not ( = ?auto_48938 ?auto_48935 ) ) ( not ( = ?auto_48948 ?auto_48935 ) ) ( not ( = ?auto_48953 ?auto_48935 ) ) ( not ( = ?auto_48951 ?auto_48954 ) ) ( not ( = ?auto_48956 ?auto_48951 ) ) ( not ( = ?auto_48959 ?auto_48951 ) ) ( not ( = ?auto_48936 ?auto_48951 ) ) ( not ( = ?auto_48952 ?auto_48951 ) ) ( not ( = ?auto_48949 ?auto_48951 ) ) ( HOIST-AT ?auto_48934 ?auto_48951 ) ( not ( = ?auto_48950 ?auto_48934 ) ) ( not ( = ?auto_48955 ?auto_48934 ) ) ( not ( = ?auto_48947 ?auto_48934 ) ) ( not ( = ?auto_48933 ?auto_48934 ) ) ( not ( = ?auto_48945 ?auto_48934 ) ) ( not ( = ?auto_48944 ?auto_48934 ) ) ( AVAILABLE ?auto_48934 ) ( SURFACE-AT ?auto_48948 ?auto_48951 ) ( ON ?auto_48948 ?auto_48957 ) ( CLEAR ?auto_48948 ) ( not ( = ?auto_48931 ?auto_48957 ) ) ( not ( = ?auto_48932 ?auto_48957 ) ) ( not ( = ?auto_48942 ?auto_48957 ) ) ( not ( = ?auto_48939 ?auto_48957 ) ) ( not ( = ?auto_48940 ?auto_48957 ) ) ( not ( = ?auto_48943 ?auto_48957 ) ) ( not ( = ?auto_48941 ?auto_48957 ) ) ( not ( = ?auto_48946 ?auto_48957 ) ) ( not ( = ?auto_48938 ?auto_48957 ) ) ( not ( = ?auto_48948 ?auto_48957 ) ) ( not ( = ?auto_48953 ?auto_48957 ) ) ( not ( = ?auto_48935 ?auto_48957 ) ) ( SURFACE-AT ?auto_48937 ?auto_48954 ) ( CLEAR ?auto_48937 ) ( IS-CRATE ?auto_48935 ) ( not ( = ?auto_48931 ?auto_48937 ) ) ( not ( = ?auto_48932 ?auto_48937 ) ) ( not ( = ?auto_48942 ?auto_48937 ) ) ( not ( = ?auto_48939 ?auto_48937 ) ) ( not ( = ?auto_48940 ?auto_48937 ) ) ( not ( = ?auto_48943 ?auto_48937 ) ) ( not ( = ?auto_48941 ?auto_48937 ) ) ( not ( = ?auto_48946 ?auto_48937 ) ) ( not ( = ?auto_48938 ?auto_48937 ) ) ( not ( = ?auto_48948 ?auto_48937 ) ) ( not ( = ?auto_48953 ?auto_48937 ) ) ( not ( = ?auto_48935 ?auto_48937 ) ) ( not ( = ?auto_48957 ?auto_48937 ) ) ( AVAILABLE ?auto_48950 ) ( TRUCK-AT ?auto_48958 ?auto_48959 ) ( LIFTING ?auto_48947 ?auto_48935 ) )
    :subtasks
    ( ( !LOAD ?auto_48947 ?auto_48935 ?auto_48958 ?auto_48959 )
      ( MAKE-ON ?auto_48931 ?auto_48932 )
      ( MAKE-ON-VERIFY ?auto_48931 ?auto_48932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48960 - SURFACE
      ?auto_48961 - SURFACE
    )
    :vars
    (
      ?auto_48982 - HOIST
      ?auto_48986 - PLACE
      ?auto_48980 - PLACE
      ?auto_48987 - HOIST
      ?auto_48970 - SURFACE
      ?auto_48971 - SURFACE
      ?auto_48979 - PLACE
      ?auto_48964 - HOIST
      ?auto_48976 - SURFACE
      ?auto_48962 - SURFACE
      ?auto_48967 - PLACE
      ?auto_48975 - HOIST
      ?auto_48972 - SURFACE
      ?auto_48963 - SURFACE
      ?auto_48984 - PLACE
      ?auto_48969 - HOIST
      ?auto_48966 - SURFACE
      ?auto_48988 - SURFACE
      ?auto_48981 - PLACE
      ?auto_48973 - HOIST
      ?auto_48985 - SURFACE
      ?auto_48968 - SURFACE
      ?auto_48983 - PLACE
      ?auto_48965 - HOIST
      ?auto_48977 - SURFACE
      ?auto_48974 - SURFACE
      ?auto_48978 - TRUCK
      ?auto_48989 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48982 ?auto_48986 ) ( IS-CRATE ?auto_48960 ) ( not ( = ?auto_48960 ?auto_48961 ) ) ( not ( = ?auto_48980 ?auto_48986 ) ) ( HOIST-AT ?auto_48987 ?auto_48980 ) ( not ( = ?auto_48982 ?auto_48987 ) ) ( AVAILABLE ?auto_48987 ) ( SURFACE-AT ?auto_48960 ?auto_48980 ) ( ON ?auto_48960 ?auto_48970 ) ( CLEAR ?auto_48960 ) ( not ( = ?auto_48960 ?auto_48970 ) ) ( not ( = ?auto_48961 ?auto_48970 ) ) ( IS-CRATE ?auto_48961 ) ( not ( = ?auto_48960 ?auto_48971 ) ) ( not ( = ?auto_48961 ?auto_48971 ) ) ( not ( = ?auto_48970 ?auto_48971 ) ) ( not ( = ?auto_48979 ?auto_48986 ) ) ( not ( = ?auto_48980 ?auto_48979 ) ) ( HOIST-AT ?auto_48964 ?auto_48979 ) ( not ( = ?auto_48982 ?auto_48964 ) ) ( not ( = ?auto_48987 ?auto_48964 ) ) ( SURFACE-AT ?auto_48961 ?auto_48979 ) ( ON ?auto_48961 ?auto_48976 ) ( CLEAR ?auto_48961 ) ( not ( = ?auto_48960 ?auto_48976 ) ) ( not ( = ?auto_48961 ?auto_48976 ) ) ( not ( = ?auto_48970 ?auto_48976 ) ) ( not ( = ?auto_48971 ?auto_48976 ) ) ( IS-CRATE ?auto_48971 ) ( not ( = ?auto_48960 ?auto_48962 ) ) ( not ( = ?auto_48961 ?auto_48962 ) ) ( not ( = ?auto_48970 ?auto_48962 ) ) ( not ( = ?auto_48971 ?auto_48962 ) ) ( not ( = ?auto_48976 ?auto_48962 ) ) ( not ( = ?auto_48967 ?auto_48986 ) ) ( not ( = ?auto_48980 ?auto_48967 ) ) ( not ( = ?auto_48979 ?auto_48967 ) ) ( HOIST-AT ?auto_48975 ?auto_48967 ) ( not ( = ?auto_48982 ?auto_48975 ) ) ( not ( = ?auto_48987 ?auto_48975 ) ) ( not ( = ?auto_48964 ?auto_48975 ) ) ( AVAILABLE ?auto_48975 ) ( SURFACE-AT ?auto_48971 ?auto_48967 ) ( ON ?auto_48971 ?auto_48972 ) ( CLEAR ?auto_48971 ) ( not ( = ?auto_48960 ?auto_48972 ) ) ( not ( = ?auto_48961 ?auto_48972 ) ) ( not ( = ?auto_48970 ?auto_48972 ) ) ( not ( = ?auto_48971 ?auto_48972 ) ) ( not ( = ?auto_48976 ?auto_48972 ) ) ( not ( = ?auto_48962 ?auto_48972 ) ) ( IS-CRATE ?auto_48962 ) ( not ( = ?auto_48960 ?auto_48963 ) ) ( not ( = ?auto_48961 ?auto_48963 ) ) ( not ( = ?auto_48970 ?auto_48963 ) ) ( not ( = ?auto_48971 ?auto_48963 ) ) ( not ( = ?auto_48976 ?auto_48963 ) ) ( not ( = ?auto_48962 ?auto_48963 ) ) ( not ( = ?auto_48972 ?auto_48963 ) ) ( not ( = ?auto_48984 ?auto_48986 ) ) ( not ( = ?auto_48980 ?auto_48984 ) ) ( not ( = ?auto_48979 ?auto_48984 ) ) ( not ( = ?auto_48967 ?auto_48984 ) ) ( HOIST-AT ?auto_48969 ?auto_48984 ) ( not ( = ?auto_48982 ?auto_48969 ) ) ( not ( = ?auto_48987 ?auto_48969 ) ) ( not ( = ?auto_48964 ?auto_48969 ) ) ( not ( = ?auto_48975 ?auto_48969 ) ) ( AVAILABLE ?auto_48969 ) ( SURFACE-AT ?auto_48962 ?auto_48984 ) ( ON ?auto_48962 ?auto_48966 ) ( CLEAR ?auto_48962 ) ( not ( = ?auto_48960 ?auto_48966 ) ) ( not ( = ?auto_48961 ?auto_48966 ) ) ( not ( = ?auto_48970 ?auto_48966 ) ) ( not ( = ?auto_48971 ?auto_48966 ) ) ( not ( = ?auto_48976 ?auto_48966 ) ) ( not ( = ?auto_48962 ?auto_48966 ) ) ( not ( = ?auto_48972 ?auto_48966 ) ) ( not ( = ?auto_48963 ?auto_48966 ) ) ( IS-CRATE ?auto_48963 ) ( not ( = ?auto_48960 ?auto_48988 ) ) ( not ( = ?auto_48961 ?auto_48988 ) ) ( not ( = ?auto_48970 ?auto_48988 ) ) ( not ( = ?auto_48971 ?auto_48988 ) ) ( not ( = ?auto_48976 ?auto_48988 ) ) ( not ( = ?auto_48962 ?auto_48988 ) ) ( not ( = ?auto_48972 ?auto_48988 ) ) ( not ( = ?auto_48963 ?auto_48988 ) ) ( not ( = ?auto_48966 ?auto_48988 ) ) ( not ( = ?auto_48981 ?auto_48986 ) ) ( not ( = ?auto_48980 ?auto_48981 ) ) ( not ( = ?auto_48979 ?auto_48981 ) ) ( not ( = ?auto_48967 ?auto_48981 ) ) ( not ( = ?auto_48984 ?auto_48981 ) ) ( HOIST-AT ?auto_48973 ?auto_48981 ) ( not ( = ?auto_48982 ?auto_48973 ) ) ( not ( = ?auto_48987 ?auto_48973 ) ) ( not ( = ?auto_48964 ?auto_48973 ) ) ( not ( = ?auto_48975 ?auto_48973 ) ) ( not ( = ?auto_48969 ?auto_48973 ) ) ( AVAILABLE ?auto_48973 ) ( SURFACE-AT ?auto_48963 ?auto_48981 ) ( ON ?auto_48963 ?auto_48985 ) ( CLEAR ?auto_48963 ) ( not ( = ?auto_48960 ?auto_48985 ) ) ( not ( = ?auto_48961 ?auto_48985 ) ) ( not ( = ?auto_48970 ?auto_48985 ) ) ( not ( = ?auto_48971 ?auto_48985 ) ) ( not ( = ?auto_48976 ?auto_48985 ) ) ( not ( = ?auto_48962 ?auto_48985 ) ) ( not ( = ?auto_48972 ?auto_48985 ) ) ( not ( = ?auto_48963 ?auto_48985 ) ) ( not ( = ?auto_48966 ?auto_48985 ) ) ( not ( = ?auto_48988 ?auto_48985 ) ) ( IS-CRATE ?auto_48988 ) ( not ( = ?auto_48960 ?auto_48968 ) ) ( not ( = ?auto_48961 ?auto_48968 ) ) ( not ( = ?auto_48970 ?auto_48968 ) ) ( not ( = ?auto_48971 ?auto_48968 ) ) ( not ( = ?auto_48976 ?auto_48968 ) ) ( not ( = ?auto_48962 ?auto_48968 ) ) ( not ( = ?auto_48972 ?auto_48968 ) ) ( not ( = ?auto_48963 ?auto_48968 ) ) ( not ( = ?auto_48966 ?auto_48968 ) ) ( not ( = ?auto_48988 ?auto_48968 ) ) ( not ( = ?auto_48985 ?auto_48968 ) ) ( not ( = ?auto_48983 ?auto_48986 ) ) ( not ( = ?auto_48980 ?auto_48983 ) ) ( not ( = ?auto_48979 ?auto_48983 ) ) ( not ( = ?auto_48967 ?auto_48983 ) ) ( not ( = ?auto_48984 ?auto_48983 ) ) ( not ( = ?auto_48981 ?auto_48983 ) ) ( HOIST-AT ?auto_48965 ?auto_48983 ) ( not ( = ?auto_48982 ?auto_48965 ) ) ( not ( = ?auto_48987 ?auto_48965 ) ) ( not ( = ?auto_48964 ?auto_48965 ) ) ( not ( = ?auto_48975 ?auto_48965 ) ) ( not ( = ?auto_48969 ?auto_48965 ) ) ( not ( = ?auto_48973 ?auto_48965 ) ) ( AVAILABLE ?auto_48965 ) ( SURFACE-AT ?auto_48988 ?auto_48983 ) ( ON ?auto_48988 ?auto_48977 ) ( CLEAR ?auto_48988 ) ( not ( = ?auto_48960 ?auto_48977 ) ) ( not ( = ?auto_48961 ?auto_48977 ) ) ( not ( = ?auto_48970 ?auto_48977 ) ) ( not ( = ?auto_48971 ?auto_48977 ) ) ( not ( = ?auto_48976 ?auto_48977 ) ) ( not ( = ?auto_48962 ?auto_48977 ) ) ( not ( = ?auto_48972 ?auto_48977 ) ) ( not ( = ?auto_48963 ?auto_48977 ) ) ( not ( = ?auto_48966 ?auto_48977 ) ) ( not ( = ?auto_48988 ?auto_48977 ) ) ( not ( = ?auto_48985 ?auto_48977 ) ) ( not ( = ?auto_48968 ?auto_48977 ) ) ( SURFACE-AT ?auto_48974 ?auto_48986 ) ( CLEAR ?auto_48974 ) ( IS-CRATE ?auto_48968 ) ( not ( = ?auto_48960 ?auto_48974 ) ) ( not ( = ?auto_48961 ?auto_48974 ) ) ( not ( = ?auto_48970 ?auto_48974 ) ) ( not ( = ?auto_48971 ?auto_48974 ) ) ( not ( = ?auto_48976 ?auto_48974 ) ) ( not ( = ?auto_48962 ?auto_48974 ) ) ( not ( = ?auto_48972 ?auto_48974 ) ) ( not ( = ?auto_48963 ?auto_48974 ) ) ( not ( = ?auto_48966 ?auto_48974 ) ) ( not ( = ?auto_48988 ?auto_48974 ) ) ( not ( = ?auto_48985 ?auto_48974 ) ) ( not ( = ?auto_48968 ?auto_48974 ) ) ( not ( = ?auto_48977 ?auto_48974 ) ) ( AVAILABLE ?auto_48982 ) ( TRUCK-AT ?auto_48978 ?auto_48979 ) ( AVAILABLE ?auto_48964 ) ( SURFACE-AT ?auto_48968 ?auto_48979 ) ( ON ?auto_48968 ?auto_48989 ) ( CLEAR ?auto_48968 ) ( not ( = ?auto_48960 ?auto_48989 ) ) ( not ( = ?auto_48961 ?auto_48989 ) ) ( not ( = ?auto_48970 ?auto_48989 ) ) ( not ( = ?auto_48971 ?auto_48989 ) ) ( not ( = ?auto_48976 ?auto_48989 ) ) ( not ( = ?auto_48962 ?auto_48989 ) ) ( not ( = ?auto_48972 ?auto_48989 ) ) ( not ( = ?auto_48963 ?auto_48989 ) ) ( not ( = ?auto_48966 ?auto_48989 ) ) ( not ( = ?auto_48988 ?auto_48989 ) ) ( not ( = ?auto_48985 ?auto_48989 ) ) ( not ( = ?auto_48968 ?auto_48989 ) ) ( not ( = ?auto_48977 ?auto_48989 ) ) ( not ( = ?auto_48974 ?auto_48989 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48964 ?auto_48968 ?auto_48989 ?auto_48979 )
      ( MAKE-ON ?auto_48960 ?auto_48961 )
      ( MAKE-ON-VERIFY ?auto_48960 ?auto_48961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48990 - SURFACE
      ?auto_48991 - SURFACE
    )
    :vars
    (
      ?auto_48994 - HOIST
      ?auto_49011 - PLACE
      ?auto_49009 - PLACE
      ?auto_49012 - HOIST
      ?auto_49015 - SURFACE
      ?auto_49000 - SURFACE
      ?auto_49008 - PLACE
      ?auto_48999 - HOIST
      ?auto_48996 - SURFACE
      ?auto_49016 - SURFACE
      ?auto_49004 - PLACE
      ?auto_49005 - HOIST
      ?auto_48995 - SURFACE
      ?auto_49018 - SURFACE
      ?auto_48992 - PLACE
      ?auto_49003 - HOIST
      ?auto_49017 - SURFACE
      ?auto_49013 - SURFACE
      ?auto_49010 - PLACE
      ?auto_49014 - HOIST
      ?auto_49006 - SURFACE
      ?auto_48997 - SURFACE
      ?auto_48993 - PLACE
      ?auto_49002 - HOIST
      ?auto_48998 - SURFACE
      ?auto_49001 - SURFACE
      ?auto_49019 - SURFACE
      ?auto_49007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48994 ?auto_49011 ) ( IS-CRATE ?auto_48990 ) ( not ( = ?auto_48990 ?auto_48991 ) ) ( not ( = ?auto_49009 ?auto_49011 ) ) ( HOIST-AT ?auto_49012 ?auto_49009 ) ( not ( = ?auto_48994 ?auto_49012 ) ) ( AVAILABLE ?auto_49012 ) ( SURFACE-AT ?auto_48990 ?auto_49009 ) ( ON ?auto_48990 ?auto_49015 ) ( CLEAR ?auto_48990 ) ( not ( = ?auto_48990 ?auto_49015 ) ) ( not ( = ?auto_48991 ?auto_49015 ) ) ( IS-CRATE ?auto_48991 ) ( not ( = ?auto_48990 ?auto_49000 ) ) ( not ( = ?auto_48991 ?auto_49000 ) ) ( not ( = ?auto_49015 ?auto_49000 ) ) ( not ( = ?auto_49008 ?auto_49011 ) ) ( not ( = ?auto_49009 ?auto_49008 ) ) ( HOIST-AT ?auto_48999 ?auto_49008 ) ( not ( = ?auto_48994 ?auto_48999 ) ) ( not ( = ?auto_49012 ?auto_48999 ) ) ( SURFACE-AT ?auto_48991 ?auto_49008 ) ( ON ?auto_48991 ?auto_48996 ) ( CLEAR ?auto_48991 ) ( not ( = ?auto_48990 ?auto_48996 ) ) ( not ( = ?auto_48991 ?auto_48996 ) ) ( not ( = ?auto_49015 ?auto_48996 ) ) ( not ( = ?auto_49000 ?auto_48996 ) ) ( IS-CRATE ?auto_49000 ) ( not ( = ?auto_48990 ?auto_49016 ) ) ( not ( = ?auto_48991 ?auto_49016 ) ) ( not ( = ?auto_49015 ?auto_49016 ) ) ( not ( = ?auto_49000 ?auto_49016 ) ) ( not ( = ?auto_48996 ?auto_49016 ) ) ( not ( = ?auto_49004 ?auto_49011 ) ) ( not ( = ?auto_49009 ?auto_49004 ) ) ( not ( = ?auto_49008 ?auto_49004 ) ) ( HOIST-AT ?auto_49005 ?auto_49004 ) ( not ( = ?auto_48994 ?auto_49005 ) ) ( not ( = ?auto_49012 ?auto_49005 ) ) ( not ( = ?auto_48999 ?auto_49005 ) ) ( AVAILABLE ?auto_49005 ) ( SURFACE-AT ?auto_49000 ?auto_49004 ) ( ON ?auto_49000 ?auto_48995 ) ( CLEAR ?auto_49000 ) ( not ( = ?auto_48990 ?auto_48995 ) ) ( not ( = ?auto_48991 ?auto_48995 ) ) ( not ( = ?auto_49015 ?auto_48995 ) ) ( not ( = ?auto_49000 ?auto_48995 ) ) ( not ( = ?auto_48996 ?auto_48995 ) ) ( not ( = ?auto_49016 ?auto_48995 ) ) ( IS-CRATE ?auto_49016 ) ( not ( = ?auto_48990 ?auto_49018 ) ) ( not ( = ?auto_48991 ?auto_49018 ) ) ( not ( = ?auto_49015 ?auto_49018 ) ) ( not ( = ?auto_49000 ?auto_49018 ) ) ( not ( = ?auto_48996 ?auto_49018 ) ) ( not ( = ?auto_49016 ?auto_49018 ) ) ( not ( = ?auto_48995 ?auto_49018 ) ) ( not ( = ?auto_48992 ?auto_49011 ) ) ( not ( = ?auto_49009 ?auto_48992 ) ) ( not ( = ?auto_49008 ?auto_48992 ) ) ( not ( = ?auto_49004 ?auto_48992 ) ) ( HOIST-AT ?auto_49003 ?auto_48992 ) ( not ( = ?auto_48994 ?auto_49003 ) ) ( not ( = ?auto_49012 ?auto_49003 ) ) ( not ( = ?auto_48999 ?auto_49003 ) ) ( not ( = ?auto_49005 ?auto_49003 ) ) ( AVAILABLE ?auto_49003 ) ( SURFACE-AT ?auto_49016 ?auto_48992 ) ( ON ?auto_49016 ?auto_49017 ) ( CLEAR ?auto_49016 ) ( not ( = ?auto_48990 ?auto_49017 ) ) ( not ( = ?auto_48991 ?auto_49017 ) ) ( not ( = ?auto_49015 ?auto_49017 ) ) ( not ( = ?auto_49000 ?auto_49017 ) ) ( not ( = ?auto_48996 ?auto_49017 ) ) ( not ( = ?auto_49016 ?auto_49017 ) ) ( not ( = ?auto_48995 ?auto_49017 ) ) ( not ( = ?auto_49018 ?auto_49017 ) ) ( IS-CRATE ?auto_49018 ) ( not ( = ?auto_48990 ?auto_49013 ) ) ( not ( = ?auto_48991 ?auto_49013 ) ) ( not ( = ?auto_49015 ?auto_49013 ) ) ( not ( = ?auto_49000 ?auto_49013 ) ) ( not ( = ?auto_48996 ?auto_49013 ) ) ( not ( = ?auto_49016 ?auto_49013 ) ) ( not ( = ?auto_48995 ?auto_49013 ) ) ( not ( = ?auto_49018 ?auto_49013 ) ) ( not ( = ?auto_49017 ?auto_49013 ) ) ( not ( = ?auto_49010 ?auto_49011 ) ) ( not ( = ?auto_49009 ?auto_49010 ) ) ( not ( = ?auto_49008 ?auto_49010 ) ) ( not ( = ?auto_49004 ?auto_49010 ) ) ( not ( = ?auto_48992 ?auto_49010 ) ) ( HOIST-AT ?auto_49014 ?auto_49010 ) ( not ( = ?auto_48994 ?auto_49014 ) ) ( not ( = ?auto_49012 ?auto_49014 ) ) ( not ( = ?auto_48999 ?auto_49014 ) ) ( not ( = ?auto_49005 ?auto_49014 ) ) ( not ( = ?auto_49003 ?auto_49014 ) ) ( AVAILABLE ?auto_49014 ) ( SURFACE-AT ?auto_49018 ?auto_49010 ) ( ON ?auto_49018 ?auto_49006 ) ( CLEAR ?auto_49018 ) ( not ( = ?auto_48990 ?auto_49006 ) ) ( not ( = ?auto_48991 ?auto_49006 ) ) ( not ( = ?auto_49015 ?auto_49006 ) ) ( not ( = ?auto_49000 ?auto_49006 ) ) ( not ( = ?auto_48996 ?auto_49006 ) ) ( not ( = ?auto_49016 ?auto_49006 ) ) ( not ( = ?auto_48995 ?auto_49006 ) ) ( not ( = ?auto_49018 ?auto_49006 ) ) ( not ( = ?auto_49017 ?auto_49006 ) ) ( not ( = ?auto_49013 ?auto_49006 ) ) ( IS-CRATE ?auto_49013 ) ( not ( = ?auto_48990 ?auto_48997 ) ) ( not ( = ?auto_48991 ?auto_48997 ) ) ( not ( = ?auto_49015 ?auto_48997 ) ) ( not ( = ?auto_49000 ?auto_48997 ) ) ( not ( = ?auto_48996 ?auto_48997 ) ) ( not ( = ?auto_49016 ?auto_48997 ) ) ( not ( = ?auto_48995 ?auto_48997 ) ) ( not ( = ?auto_49018 ?auto_48997 ) ) ( not ( = ?auto_49017 ?auto_48997 ) ) ( not ( = ?auto_49013 ?auto_48997 ) ) ( not ( = ?auto_49006 ?auto_48997 ) ) ( not ( = ?auto_48993 ?auto_49011 ) ) ( not ( = ?auto_49009 ?auto_48993 ) ) ( not ( = ?auto_49008 ?auto_48993 ) ) ( not ( = ?auto_49004 ?auto_48993 ) ) ( not ( = ?auto_48992 ?auto_48993 ) ) ( not ( = ?auto_49010 ?auto_48993 ) ) ( HOIST-AT ?auto_49002 ?auto_48993 ) ( not ( = ?auto_48994 ?auto_49002 ) ) ( not ( = ?auto_49012 ?auto_49002 ) ) ( not ( = ?auto_48999 ?auto_49002 ) ) ( not ( = ?auto_49005 ?auto_49002 ) ) ( not ( = ?auto_49003 ?auto_49002 ) ) ( not ( = ?auto_49014 ?auto_49002 ) ) ( AVAILABLE ?auto_49002 ) ( SURFACE-AT ?auto_49013 ?auto_48993 ) ( ON ?auto_49013 ?auto_48998 ) ( CLEAR ?auto_49013 ) ( not ( = ?auto_48990 ?auto_48998 ) ) ( not ( = ?auto_48991 ?auto_48998 ) ) ( not ( = ?auto_49015 ?auto_48998 ) ) ( not ( = ?auto_49000 ?auto_48998 ) ) ( not ( = ?auto_48996 ?auto_48998 ) ) ( not ( = ?auto_49016 ?auto_48998 ) ) ( not ( = ?auto_48995 ?auto_48998 ) ) ( not ( = ?auto_49018 ?auto_48998 ) ) ( not ( = ?auto_49017 ?auto_48998 ) ) ( not ( = ?auto_49013 ?auto_48998 ) ) ( not ( = ?auto_49006 ?auto_48998 ) ) ( not ( = ?auto_48997 ?auto_48998 ) ) ( SURFACE-AT ?auto_49001 ?auto_49011 ) ( CLEAR ?auto_49001 ) ( IS-CRATE ?auto_48997 ) ( not ( = ?auto_48990 ?auto_49001 ) ) ( not ( = ?auto_48991 ?auto_49001 ) ) ( not ( = ?auto_49015 ?auto_49001 ) ) ( not ( = ?auto_49000 ?auto_49001 ) ) ( not ( = ?auto_48996 ?auto_49001 ) ) ( not ( = ?auto_49016 ?auto_49001 ) ) ( not ( = ?auto_48995 ?auto_49001 ) ) ( not ( = ?auto_49018 ?auto_49001 ) ) ( not ( = ?auto_49017 ?auto_49001 ) ) ( not ( = ?auto_49013 ?auto_49001 ) ) ( not ( = ?auto_49006 ?auto_49001 ) ) ( not ( = ?auto_48997 ?auto_49001 ) ) ( not ( = ?auto_48998 ?auto_49001 ) ) ( AVAILABLE ?auto_48994 ) ( AVAILABLE ?auto_48999 ) ( SURFACE-AT ?auto_48997 ?auto_49008 ) ( ON ?auto_48997 ?auto_49019 ) ( CLEAR ?auto_48997 ) ( not ( = ?auto_48990 ?auto_49019 ) ) ( not ( = ?auto_48991 ?auto_49019 ) ) ( not ( = ?auto_49015 ?auto_49019 ) ) ( not ( = ?auto_49000 ?auto_49019 ) ) ( not ( = ?auto_48996 ?auto_49019 ) ) ( not ( = ?auto_49016 ?auto_49019 ) ) ( not ( = ?auto_48995 ?auto_49019 ) ) ( not ( = ?auto_49018 ?auto_49019 ) ) ( not ( = ?auto_49017 ?auto_49019 ) ) ( not ( = ?auto_49013 ?auto_49019 ) ) ( not ( = ?auto_49006 ?auto_49019 ) ) ( not ( = ?auto_48997 ?auto_49019 ) ) ( not ( = ?auto_48998 ?auto_49019 ) ) ( not ( = ?auto_49001 ?auto_49019 ) ) ( TRUCK-AT ?auto_49007 ?auto_49011 ) )
    :subtasks
    ( ( !DRIVE ?auto_49007 ?auto_49011 ?auto_49008 )
      ( MAKE-ON ?auto_48990 ?auto_48991 )
      ( MAKE-ON-VERIFY ?auto_48990 ?auto_48991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49020 - SURFACE
      ?auto_49021 - SURFACE
    )
    :vars
    (
      ?auto_49037 - HOIST
      ?auto_49032 - PLACE
      ?auto_49028 - PLACE
      ?auto_49040 - HOIST
      ?auto_49024 - SURFACE
      ?auto_49045 - SURFACE
      ?auto_49022 - PLACE
      ?auto_49047 - HOIST
      ?auto_49034 - SURFACE
      ?auto_49025 - SURFACE
      ?auto_49048 - PLACE
      ?auto_49035 - HOIST
      ?auto_49039 - SURFACE
      ?auto_49027 - SURFACE
      ?auto_49030 - PLACE
      ?auto_49044 - HOIST
      ?auto_49029 - SURFACE
      ?auto_49041 - SURFACE
      ?auto_49026 - PLACE
      ?auto_49042 - HOIST
      ?auto_49031 - SURFACE
      ?auto_49036 - SURFACE
      ?auto_49046 - PLACE
      ?auto_49049 - HOIST
      ?auto_49038 - SURFACE
      ?auto_49033 - SURFACE
      ?auto_49023 - SURFACE
      ?auto_49043 - TRUCK
      ?auto_49050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49037 ?auto_49032 ) ( IS-CRATE ?auto_49020 ) ( not ( = ?auto_49020 ?auto_49021 ) ) ( not ( = ?auto_49028 ?auto_49032 ) ) ( HOIST-AT ?auto_49040 ?auto_49028 ) ( not ( = ?auto_49037 ?auto_49040 ) ) ( AVAILABLE ?auto_49040 ) ( SURFACE-AT ?auto_49020 ?auto_49028 ) ( ON ?auto_49020 ?auto_49024 ) ( CLEAR ?auto_49020 ) ( not ( = ?auto_49020 ?auto_49024 ) ) ( not ( = ?auto_49021 ?auto_49024 ) ) ( IS-CRATE ?auto_49021 ) ( not ( = ?auto_49020 ?auto_49045 ) ) ( not ( = ?auto_49021 ?auto_49045 ) ) ( not ( = ?auto_49024 ?auto_49045 ) ) ( not ( = ?auto_49022 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49022 ) ) ( HOIST-AT ?auto_49047 ?auto_49022 ) ( not ( = ?auto_49037 ?auto_49047 ) ) ( not ( = ?auto_49040 ?auto_49047 ) ) ( SURFACE-AT ?auto_49021 ?auto_49022 ) ( ON ?auto_49021 ?auto_49034 ) ( CLEAR ?auto_49021 ) ( not ( = ?auto_49020 ?auto_49034 ) ) ( not ( = ?auto_49021 ?auto_49034 ) ) ( not ( = ?auto_49024 ?auto_49034 ) ) ( not ( = ?auto_49045 ?auto_49034 ) ) ( IS-CRATE ?auto_49045 ) ( not ( = ?auto_49020 ?auto_49025 ) ) ( not ( = ?auto_49021 ?auto_49025 ) ) ( not ( = ?auto_49024 ?auto_49025 ) ) ( not ( = ?auto_49045 ?auto_49025 ) ) ( not ( = ?auto_49034 ?auto_49025 ) ) ( not ( = ?auto_49048 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49048 ) ) ( not ( = ?auto_49022 ?auto_49048 ) ) ( HOIST-AT ?auto_49035 ?auto_49048 ) ( not ( = ?auto_49037 ?auto_49035 ) ) ( not ( = ?auto_49040 ?auto_49035 ) ) ( not ( = ?auto_49047 ?auto_49035 ) ) ( AVAILABLE ?auto_49035 ) ( SURFACE-AT ?auto_49045 ?auto_49048 ) ( ON ?auto_49045 ?auto_49039 ) ( CLEAR ?auto_49045 ) ( not ( = ?auto_49020 ?auto_49039 ) ) ( not ( = ?auto_49021 ?auto_49039 ) ) ( not ( = ?auto_49024 ?auto_49039 ) ) ( not ( = ?auto_49045 ?auto_49039 ) ) ( not ( = ?auto_49034 ?auto_49039 ) ) ( not ( = ?auto_49025 ?auto_49039 ) ) ( IS-CRATE ?auto_49025 ) ( not ( = ?auto_49020 ?auto_49027 ) ) ( not ( = ?auto_49021 ?auto_49027 ) ) ( not ( = ?auto_49024 ?auto_49027 ) ) ( not ( = ?auto_49045 ?auto_49027 ) ) ( not ( = ?auto_49034 ?auto_49027 ) ) ( not ( = ?auto_49025 ?auto_49027 ) ) ( not ( = ?auto_49039 ?auto_49027 ) ) ( not ( = ?auto_49030 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49030 ) ) ( not ( = ?auto_49022 ?auto_49030 ) ) ( not ( = ?auto_49048 ?auto_49030 ) ) ( HOIST-AT ?auto_49044 ?auto_49030 ) ( not ( = ?auto_49037 ?auto_49044 ) ) ( not ( = ?auto_49040 ?auto_49044 ) ) ( not ( = ?auto_49047 ?auto_49044 ) ) ( not ( = ?auto_49035 ?auto_49044 ) ) ( AVAILABLE ?auto_49044 ) ( SURFACE-AT ?auto_49025 ?auto_49030 ) ( ON ?auto_49025 ?auto_49029 ) ( CLEAR ?auto_49025 ) ( not ( = ?auto_49020 ?auto_49029 ) ) ( not ( = ?auto_49021 ?auto_49029 ) ) ( not ( = ?auto_49024 ?auto_49029 ) ) ( not ( = ?auto_49045 ?auto_49029 ) ) ( not ( = ?auto_49034 ?auto_49029 ) ) ( not ( = ?auto_49025 ?auto_49029 ) ) ( not ( = ?auto_49039 ?auto_49029 ) ) ( not ( = ?auto_49027 ?auto_49029 ) ) ( IS-CRATE ?auto_49027 ) ( not ( = ?auto_49020 ?auto_49041 ) ) ( not ( = ?auto_49021 ?auto_49041 ) ) ( not ( = ?auto_49024 ?auto_49041 ) ) ( not ( = ?auto_49045 ?auto_49041 ) ) ( not ( = ?auto_49034 ?auto_49041 ) ) ( not ( = ?auto_49025 ?auto_49041 ) ) ( not ( = ?auto_49039 ?auto_49041 ) ) ( not ( = ?auto_49027 ?auto_49041 ) ) ( not ( = ?auto_49029 ?auto_49041 ) ) ( not ( = ?auto_49026 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49026 ) ) ( not ( = ?auto_49022 ?auto_49026 ) ) ( not ( = ?auto_49048 ?auto_49026 ) ) ( not ( = ?auto_49030 ?auto_49026 ) ) ( HOIST-AT ?auto_49042 ?auto_49026 ) ( not ( = ?auto_49037 ?auto_49042 ) ) ( not ( = ?auto_49040 ?auto_49042 ) ) ( not ( = ?auto_49047 ?auto_49042 ) ) ( not ( = ?auto_49035 ?auto_49042 ) ) ( not ( = ?auto_49044 ?auto_49042 ) ) ( AVAILABLE ?auto_49042 ) ( SURFACE-AT ?auto_49027 ?auto_49026 ) ( ON ?auto_49027 ?auto_49031 ) ( CLEAR ?auto_49027 ) ( not ( = ?auto_49020 ?auto_49031 ) ) ( not ( = ?auto_49021 ?auto_49031 ) ) ( not ( = ?auto_49024 ?auto_49031 ) ) ( not ( = ?auto_49045 ?auto_49031 ) ) ( not ( = ?auto_49034 ?auto_49031 ) ) ( not ( = ?auto_49025 ?auto_49031 ) ) ( not ( = ?auto_49039 ?auto_49031 ) ) ( not ( = ?auto_49027 ?auto_49031 ) ) ( not ( = ?auto_49029 ?auto_49031 ) ) ( not ( = ?auto_49041 ?auto_49031 ) ) ( IS-CRATE ?auto_49041 ) ( not ( = ?auto_49020 ?auto_49036 ) ) ( not ( = ?auto_49021 ?auto_49036 ) ) ( not ( = ?auto_49024 ?auto_49036 ) ) ( not ( = ?auto_49045 ?auto_49036 ) ) ( not ( = ?auto_49034 ?auto_49036 ) ) ( not ( = ?auto_49025 ?auto_49036 ) ) ( not ( = ?auto_49039 ?auto_49036 ) ) ( not ( = ?auto_49027 ?auto_49036 ) ) ( not ( = ?auto_49029 ?auto_49036 ) ) ( not ( = ?auto_49041 ?auto_49036 ) ) ( not ( = ?auto_49031 ?auto_49036 ) ) ( not ( = ?auto_49046 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49046 ) ) ( not ( = ?auto_49022 ?auto_49046 ) ) ( not ( = ?auto_49048 ?auto_49046 ) ) ( not ( = ?auto_49030 ?auto_49046 ) ) ( not ( = ?auto_49026 ?auto_49046 ) ) ( HOIST-AT ?auto_49049 ?auto_49046 ) ( not ( = ?auto_49037 ?auto_49049 ) ) ( not ( = ?auto_49040 ?auto_49049 ) ) ( not ( = ?auto_49047 ?auto_49049 ) ) ( not ( = ?auto_49035 ?auto_49049 ) ) ( not ( = ?auto_49044 ?auto_49049 ) ) ( not ( = ?auto_49042 ?auto_49049 ) ) ( AVAILABLE ?auto_49049 ) ( SURFACE-AT ?auto_49041 ?auto_49046 ) ( ON ?auto_49041 ?auto_49038 ) ( CLEAR ?auto_49041 ) ( not ( = ?auto_49020 ?auto_49038 ) ) ( not ( = ?auto_49021 ?auto_49038 ) ) ( not ( = ?auto_49024 ?auto_49038 ) ) ( not ( = ?auto_49045 ?auto_49038 ) ) ( not ( = ?auto_49034 ?auto_49038 ) ) ( not ( = ?auto_49025 ?auto_49038 ) ) ( not ( = ?auto_49039 ?auto_49038 ) ) ( not ( = ?auto_49027 ?auto_49038 ) ) ( not ( = ?auto_49029 ?auto_49038 ) ) ( not ( = ?auto_49041 ?auto_49038 ) ) ( not ( = ?auto_49031 ?auto_49038 ) ) ( not ( = ?auto_49036 ?auto_49038 ) ) ( IS-CRATE ?auto_49036 ) ( not ( = ?auto_49020 ?auto_49033 ) ) ( not ( = ?auto_49021 ?auto_49033 ) ) ( not ( = ?auto_49024 ?auto_49033 ) ) ( not ( = ?auto_49045 ?auto_49033 ) ) ( not ( = ?auto_49034 ?auto_49033 ) ) ( not ( = ?auto_49025 ?auto_49033 ) ) ( not ( = ?auto_49039 ?auto_49033 ) ) ( not ( = ?auto_49027 ?auto_49033 ) ) ( not ( = ?auto_49029 ?auto_49033 ) ) ( not ( = ?auto_49041 ?auto_49033 ) ) ( not ( = ?auto_49031 ?auto_49033 ) ) ( not ( = ?auto_49036 ?auto_49033 ) ) ( not ( = ?auto_49038 ?auto_49033 ) ) ( AVAILABLE ?auto_49047 ) ( SURFACE-AT ?auto_49036 ?auto_49022 ) ( ON ?auto_49036 ?auto_49023 ) ( CLEAR ?auto_49036 ) ( not ( = ?auto_49020 ?auto_49023 ) ) ( not ( = ?auto_49021 ?auto_49023 ) ) ( not ( = ?auto_49024 ?auto_49023 ) ) ( not ( = ?auto_49045 ?auto_49023 ) ) ( not ( = ?auto_49034 ?auto_49023 ) ) ( not ( = ?auto_49025 ?auto_49023 ) ) ( not ( = ?auto_49039 ?auto_49023 ) ) ( not ( = ?auto_49027 ?auto_49023 ) ) ( not ( = ?auto_49029 ?auto_49023 ) ) ( not ( = ?auto_49041 ?auto_49023 ) ) ( not ( = ?auto_49031 ?auto_49023 ) ) ( not ( = ?auto_49036 ?auto_49023 ) ) ( not ( = ?auto_49038 ?auto_49023 ) ) ( not ( = ?auto_49033 ?auto_49023 ) ) ( TRUCK-AT ?auto_49043 ?auto_49032 ) ( SURFACE-AT ?auto_49050 ?auto_49032 ) ( CLEAR ?auto_49050 ) ( LIFTING ?auto_49037 ?auto_49033 ) ( IS-CRATE ?auto_49033 ) ( not ( = ?auto_49020 ?auto_49050 ) ) ( not ( = ?auto_49021 ?auto_49050 ) ) ( not ( = ?auto_49024 ?auto_49050 ) ) ( not ( = ?auto_49045 ?auto_49050 ) ) ( not ( = ?auto_49034 ?auto_49050 ) ) ( not ( = ?auto_49025 ?auto_49050 ) ) ( not ( = ?auto_49039 ?auto_49050 ) ) ( not ( = ?auto_49027 ?auto_49050 ) ) ( not ( = ?auto_49029 ?auto_49050 ) ) ( not ( = ?auto_49041 ?auto_49050 ) ) ( not ( = ?auto_49031 ?auto_49050 ) ) ( not ( = ?auto_49036 ?auto_49050 ) ) ( not ( = ?auto_49038 ?auto_49050 ) ) ( not ( = ?auto_49033 ?auto_49050 ) ) ( not ( = ?auto_49023 ?auto_49050 ) ) )
    :subtasks
    ( ( !DROP ?auto_49037 ?auto_49033 ?auto_49050 ?auto_49032 )
      ( MAKE-ON ?auto_49020 ?auto_49021 )
      ( MAKE-ON-VERIFY ?auto_49020 ?auto_49021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49051 - SURFACE
      ?auto_49052 - SURFACE
    )
    :vars
    (
      ?auto_49059 - HOIST
      ?auto_49078 - PLACE
      ?auto_49074 - PLACE
      ?auto_49064 - HOIST
      ?auto_49076 - SURFACE
      ?auto_49056 - SURFACE
      ?auto_49060 - PLACE
      ?auto_49053 - HOIST
      ?auto_49062 - SURFACE
      ?auto_49061 - SURFACE
      ?auto_49057 - PLACE
      ?auto_49070 - HOIST
      ?auto_49054 - SURFACE
      ?auto_49075 - SURFACE
      ?auto_49072 - PLACE
      ?auto_49068 - HOIST
      ?auto_49063 - SURFACE
      ?auto_49065 - SURFACE
      ?auto_49080 - PLACE
      ?auto_49066 - HOIST
      ?auto_49079 - SURFACE
      ?auto_49073 - SURFACE
      ?auto_49069 - PLACE
      ?auto_49058 - HOIST
      ?auto_49055 - SURFACE
      ?auto_49071 - SURFACE
      ?auto_49077 - SURFACE
      ?auto_49067 - TRUCK
      ?auto_49081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49059 ?auto_49078 ) ( IS-CRATE ?auto_49051 ) ( not ( = ?auto_49051 ?auto_49052 ) ) ( not ( = ?auto_49074 ?auto_49078 ) ) ( HOIST-AT ?auto_49064 ?auto_49074 ) ( not ( = ?auto_49059 ?auto_49064 ) ) ( AVAILABLE ?auto_49064 ) ( SURFACE-AT ?auto_49051 ?auto_49074 ) ( ON ?auto_49051 ?auto_49076 ) ( CLEAR ?auto_49051 ) ( not ( = ?auto_49051 ?auto_49076 ) ) ( not ( = ?auto_49052 ?auto_49076 ) ) ( IS-CRATE ?auto_49052 ) ( not ( = ?auto_49051 ?auto_49056 ) ) ( not ( = ?auto_49052 ?auto_49056 ) ) ( not ( = ?auto_49076 ?auto_49056 ) ) ( not ( = ?auto_49060 ?auto_49078 ) ) ( not ( = ?auto_49074 ?auto_49060 ) ) ( HOIST-AT ?auto_49053 ?auto_49060 ) ( not ( = ?auto_49059 ?auto_49053 ) ) ( not ( = ?auto_49064 ?auto_49053 ) ) ( SURFACE-AT ?auto_49052 ?auto_49060 ) ( ON ?auto_49052 ?auto_49062 ) ( CLEAR ?auto_49052 ) ( not ( = ?auto_49051 ?auto_49062 ) ) ( not ( = ?auto_49052 ?auto_49062 ) ) ( not ( = ?auto_49076 ?auto_49062 ) ) ( not ( = ?auto_49056 ?auto_49062 ) ) ( IS-CRATE ?auto_49056 ) ( not ( = ?auto_49051 ?auto_49061 ) ) ( not ( = ?auto_49052 ?auto_49061 ) ) ( not ( = ?auto_49076 ?auto_49061 ) ) ( not ( = ?auto_49056 ?auto_49061 ) ) ( not ( = ?auto_49062 ?auto_49061 ) ) ( not ( = ?auto_49057 ?auto_49078 ) ) ( not ( = ?auto_49074 ?auto_49057 ) ) ( not ( = ?auto_49060 ?auto_49057 ) ) ( HOIST-AT ?auto_49070 ?auto_49057 ) ( not ( = ?auto_49059 ?auto_49070 ) ) ( not ( = ?auto_49064 ?auto_49070 ) ) ( not ( = ?auto_49053 ?auto_49070 ) ) ( AVAILABLE ?auto_49070 ) ( SURFACE-AT ?auto_49056 ?auto_49057 ) ( ON ?auto_49056 ?auto_49054 ) ( CLEAR ?auto_49056 ) ( not ( = ?auto_49051 ?auto_49054 ) ) ( not ( = ?auto_49052 ?auto_49054 ) ) ( not ( = ?auto_49076 ?auto_49054 ) ) ( not ( = ?auto_49056 ?auto_49054 ) ) ( not ( = ?auto_49062 ?auto_49054 ) ) ( not ( = ?auto_49061 ?auto_49054 ) ) ( IS-CRATE ?auto_49061 ) ( not ( = ?auto_49051 ?auto_49075 ) ) ( not ( = ?auto_49052 ?auto_49075 ) ) ( not ( = ?auto_49076 ?auto_49075 ) ) ( not ( = ?auto_49056 ?auto_49075 ) ) ( not ( = ?auto_49062 ?auto_49075 ) ) ( not ( = ?auto_49061 ?auto_49075 ) ) ( not ( = ?auto_49054 ?auto_49075 ) ) ( not ( = ?auto_49072 ?auto_49078 ) ) ( not ( = ?auto_49074 ?auto_49072 ) ) ( not ( = ?auto_49060 ?auto_49072 ) ) ( not ( = ?auto_49057 ?auto_49072 ) ) ( HOIST-AT ?auto_49068 ?auto_49072 ) ( not ( = ?auto_49059 ?auto_49068 ) ) ( not ( = ?auto_49064 ?auto_49068 ) ) ( not ( = ?auto_49053 ?auto_49068 ) ) ( not ( = ?auto_49070 ?auto_49068 ) ) ( AVAILABLE ?auto_49068 ) ( SURFACE-AT ?auto_49061 ?auto_49072 ) ( ON ?auto_49061 ?auto_49063 ) ( CLEAR ?auto_49061 ) ( not ( = ?auto_49051 ?auto_49063 ) ) ( not ( = ?auto_49052 ?auto_49063 ) ) ( not ( = ?auto_49076 ?auto_49063 ) ) ( not ( = ?auto_49056 ?auto_49063 ) ) ( not ( = ?auto_49062 ?auto_49063 ) ) ( not ( = ?auto_49061 ?auto_49063 ) ) ( not ( = ?auto_49054 ?auto_49063 ) ) ( not ( = ?auto_49075 ?auto_49063 ) ) ( IS-CRATE ?auto_49075 ) ( not ( = ?auto_49051 ?auto_49065 ) ) ( not ( = ?auto_49052 ?auto_49065 ) ) ( not ( = ?auto_49076 ?auto_49065 ) ) ( not ( = ?auto_49056 ?auto_49065 ) ) ( not ( = ?auto_49062 ?auto_49065 ) ) ( not ( = ?auto_49061 ?auto_49065 ) ) ( not ( = ?auto_49054 ?auto_49065 ) ) ( not ( = ?auto_49075 ?auto_49065 ) ) ( not ( = ?auto_49063 ?auto_49065 ) ) ( not ( = ?auto_49080 ?auto_49078 ) ) ( not ( = ?auto_49074 ?auto_49080 ) ) ( not ( = ?auto_49060 ?auto_49080 ) ) ( not ( = ?auto_49057 ?auto_49080 ) ) ( not ( = ?auto_49072 ?auto_49080 ) ) ( HOIST-AT ?auto_49066 ?auto_49080 ) ( not ( = ?auto_49059 ?auto_49066 ) ) ( not ( = ?auto_49064 ?auto_49066 ) ) ( not ( = ?auto_49053 ?auto_49066 ) ) ( not ( = ?auto_49070 ?auto_49066 ) ) ( not ( = ?auto_49068 ?auto_49066 ) ) ( AVAILABLE ?auto_49066 ) ( SURFACE-AT ?auto_49075 ?auto_49080 ) ( ON ?auto_49075 ?auto_49079 ) ( CLEAR ?auto_49075 ) ( not ( = ?auto_49051 ?auto_49079 ) ) ( not ( = ?auto_49052 ?auto_49079 ) ) ( not ( = ?auto_49076 ?auto_49079 ) ) ( not ( = ?auto_49056 ?auto_49079 ) ) ( not ( = ?auto_49062 ?auto_49079 ) ) ( not ( = ?auto_49061 ?auto_49079 ) ) ( not ( = ?auto_49054 ?auto_49079 ) ) ( not ( = ?auto_49075 ?auto_49079 ) ) ( not ( = ?auto_49063 ?auto_49079 ) ) ( not ( = ?auto_49065 ?auto_49079 ) ) ( IS-CRATE ?auto_49065 ) ( not ( = ?auto_49051 ?auto_49073 ) ) ( not ( = ?auto_49052 ?auto_49073 ) ) ( not ( = ?auto_49076 ?auto_49073 ) ) ( not ( = ?auto_49056 ?auto_49073 ) ) ( not ( = ?auto_49062 ?auto_49073 ) ) ( not ( = ?auto_49061 ?auto_49073 ) ) ( not ( = ?auto_49054 ?auto_49073 ) ) ( not ( = ?auto_49075 ?auto_49073 ) ) ( not ( = ?auto_49063 ?auto_49073 ) ) ( not ( = ?auto_49065 ?auto_49073 ) ) ( not ( = ?auto_49079 ?auto_49073 ) ) ( not ( = ?auto_49069 ?auto_49078 ) ) ( not ( = ?auto_49074 ?auto_49069 ) ) ( not ( = ?auto_49060 ?auto_49069 ) ) ( not ( = ?auto_49057 ?auto_49069 ) ) ( not ( = ?auto_49072 ?auto_49069 ) ) ( not ( = ?auto_49080 ?auto_49069 ) ) ( HOIST-AT ?auto_49058 ?auto_49069 ) ( not ( = ?auto_49059 ?auto_49058 ) ) ( not ( = ?auto_49064 ?auto_49058 ) ) ( not ( = ?auto_49053 ?auto_49058 ) ) ( not ( = ?auto_49070 ?auto_49058 ) ) ( not ( = ?auto_49068 ?auto_49058 ) ) ( not ( = ?auto_49066 ?auto_49058 ) ) ( AVAILABLE ?auto_49058 ) ( SURFACE-AT ?auto_49065 ?auto_49069 ) ( ON ?auto_49065 ?auto_49055 ) ( CLEAR ?auto_49065 ) ( not ( = ?auto_49051 ?auto_49055 ) ) ( not ( = ?auto_49052 ?auto_49055 ) ) ( not ( = ?auto_49076 ?auto_49055 ) ) ( not ( = ?auto_49056 ?auto_49055 ) ) ( not ( = ?auto_49062 ?auto_49055 ) ) ( not ( = ?auto_49061 ?auto_49055 ) ) ( not ( = ?auto_49054 ?auto_49055 ) ) ( not ( = ?auto_49075 ?auto_49055 ) ) ( not ( = ?auto_49063 ?auto_49055 ) ) ( not ( = ?auto_49065 ?auto_49055 ) ) ( not ( = ?auto_49079 ?auto_49055 ) ) ( not ( = ?auto_49073 ?auto_49055 ) ) ( IS-CRATE ?auto_49073 ) ( not ( = ?auto_49051 ?auto_49071 ) ) ( not ( = ?auto_49052 ?auto_49071 ) ) ( not ( = ?auto_49076 ?auto_49071 ) ) ( not ( = ?auto_49056 ?auto_49071 ) ) ( not ( = ?auto_49062 ?auto_49071 ) ) ( not ( = ?auto_49061 ?auto_49071 ) ) ( not ( = ?auto_49054 ?auto_49071 ) ) ( not ( = ?auto_49075 ?auto_49071 ) ) ( not ( = ?auto_49063 ?auto_49071 ) ) ( not ( = ?auto_49065 ?auto_49071 ) ) ( not ( = ?auto_49079 ?auto_49071 ) ) ( not ( = ?auto_49073 ?auto_49071 ) ) ( not ( = ?auto_49055 ?auto_49071 ) ) ( AVAILABLE ?auto_49053 ) ( SURFACE-AT ?auto_49073 ?auto_49060 ) ( ON ?auto_49073 ?auto_49077 ) ( CLEAR ?auto_49073 ) ( not ( = ?auto_49051 ?auto_49077 ) ) ( not ( = ?auto_49052 ?auto_49077 ) ) ( not ( = ?auto_49076 ?auto_49077 ) ) ( not ( = ?auto_49056 ?auto_49077 ) ) ( not ( = ?auto_49062 ?auto_49077 ) ) ( not ( = ?auto_49061 ?auto_49077 ) ) ( not ( = ?auto_49054 ?auto_49077 ) ) ( not ( = ?auto_49075 ?auto_49077 ) ) ( not ( = ?auto_49063 ?auto_49077 ) ) ( not ( = ?auto_49065 ?auto_49077 ) ) ( not ( = ?auto_49079 ?auto_49077 ) ) ( not ( = ?auto_49073 ?auto_49077 ) ) ( not ( = ?auto_49055 ?auto_49077 ) ) ( not ( = ?auto_49071 ?auto_49077 ) ) ( TRUCK-AT ?auto_49067 ?auto_49078 ) ( SURFACE-AT ?auto_49081 ?auto_49078 ) ( CLEAR ?auto_49081 ) ( IS-CRATE ?auto_49071 ) ( not ( = ?auto_49051 ?auto_49081 ) ) ( not ( = ?auto_49052 ?auto_49081 ) ) ( not ( = ?auto_49076 ?auto_49081 ) ) ( not ( = ?auto_49056 ?auto_49081 ) ) ( not ( = ?auto_49062 ?auto_49081 ) ) ( not ( = ?auto_49061 ?auto_49081 ) ) ( not ( = ?auto_49054 ?auto_49081 ) ) ( not ( = ?auto_49075 ?auto_49081 ) ) ( not ( = ?auto_49063 ?auto_49081 ) ) ( not ( = ?auto_49065 ?auto_49081 ) ) ( not ( = ?auto_49079 ?auto_49081 ) ) ( not ( = ?auto_49073 ?auto_49081 ) ) ( not ( = ?auto_49055 ?auto_49081 ) ) ( not ( = ?auto_49071 ?auto_49081 ) ) ( not ( = ?auto_49077 ?auto_49081 ) ) ( AVAILABLE ?auto_49059 ) ( IN ?auto_49071 ?auto_49067 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49059 ?auto_49071 ?auto_49067 ?auto_49078 )
      ( MAKE-ON ?auto_49051 ?auto_49052 )
      ( MAKE-ON-VERIFY ?auto_49051 ?auto_49052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49082 - SURFACE
      ?auto_49083 - SURFACE
    )
    :vars
    (
      ?auto_49095 - HOIST
      ?auto_49092 - PLACE
      ?auto_49107 - PLACE
      ?auto_49085 - HOIST
      ?auto_49101 - SURFACE
      ?auto_49099 - SURFACE
      ?auto_49088 - PLACE
      ?auto_49091 - HOIST
      ?auto_49089 - SURFACE
      ?auto_49096 - SURFACE
      ?auto_49112 - PLACE
      ?auto_49103 - HOIST
      ?auto_49084 - SURFACE
      ?auto_49108 - SURFACE
      ?auto_49105 - PLACE
      ?auto_49109 - HOIST
      ?auto_49098 - SURFACE
      ?auto_49086 - SURFACE
      ?auto_49094 - PLACE
      ?auto_49110 - HOIST
      ?auto_49090 - SURFACE
      ?auto_49106 - SURFACE
      ?auto_49102 - PLACE
      ?auto_49100 - HOIST
      ?auto_49087 - SURFACE
      ?auto_49104 - SURFACE
      ?auto_49093 - SURFACE
      ?auto_49097 - SURFACE
      ?auto_49111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49095 ?auto_49092 ) ( IS-CRATE ?auto_49082 ) ( not ( = ?auto_49082 ?auto_49083 ) ) ( not ( = ?auto_49107 ?auto_49092 ) ) ( HOIST-AT ?auto_49085 ?auto_49107 ) ( not ( = ?auto_49095 ?auto_49085 ) ) ( AVAILABLE ?auto_49085 ) ( SURFACE-AT ?auto_49082 ?auto_49107 ) ( ON ?auto_49082 ?auto_49101 ) ( CLEAR ?auto_49082 ) ( not ( = ?auto_49082 ?auto_49101 ) ) ( not ( = ?auto_49083 ?auto_49101 ) ) ( IS-CRATE ?auto_49083 ) ( not ( = ?auto_49082 ?auto_49099 ) ) ( not ( = ?auto_49083 ?auto_49099 ) ) ( not ( = ?auto_49101 ?auto_49099 ) ) ( not ( = ?auto_49088 ?auto_49092 ) ) ( not ( = ?auto_49107 ?auto_49088 ) ) ( HOIST-AT ?auto_49091 ?auto_49088 ) ( not ( = ?auto_49095 ?auto_49091 ) ) ( not ( = ?auto_49085 ?auto_49091 ) ) ( SURFACE-AT ?auto_49083 ?auto_49088 ) ( ON ?auto_49083 ?auto_49089 ) ( CLEAR ?auto_49083 ) ( not ( = ?auto_49082 ?auto_49089 ) ) ( not ( = ?auto_49083 ?auto_49089 ) ) ( not ( = ?auto_49101 ?auto_49089 ) ) ( not ( = ?auto_49099 ?auto_49089 ) ) ( IS-CRATE ?auto_49099 ) ( not ( = ?auto_49082 ?auto_49096 ) ) ( not ( = ?auto_49083 ?auto_49096 ) ) ( not ( = ?auto_49101 ?auto_49096 ) ) ( not ( = ?auto_49099 ?auto_49096 ) ) ( not ( = ?auto_49089 ?auto_49096 ) ) ( not ( = ?auto_49112 ?auto_49092 ) ) ( not ( = ?auto_49107 ?auto_49112 ) ) ( not ( = ?auto_49088 ?auto_49112 ) ) ( HOIST-AT ?auto_49103 ?auto_49112 ) ( not ( = ?auto_49095 ?auto_49103 ) ) ( not ( = ?auto_49085 ?auto_49103 ) ) ( not ( = ?auto_49091 ?auto_49103 ) ) ( AVAILABLE ?auto_49103 ) ( SURFACE-AT ?auto_49099 ?auto_49112 ) ( ON ?auto_49099 ?auto_49084 ) ( CLEAR ?auto_49099 ) ( not ( = ?auto_49082 ?auto_49084 ) ) ( not ( = ?auto_49083 ?auto_49084 ) ) ( not ( = ?auto_49101 ?auto_49084 ) ) ( not ( = ?auto_49099 ?auto_49084 ) ) ( not ( = ?auto_49089 ?auto_49084 ) ) ( not ( = ?auto_49096 ?auto_49084 ) ) ( IS-CRATE ?auto_49096 ) ( not ( = ?auto_49082 ?auto_49108 ) ) ( not ( = ?auto_49083 ?auto_49108 ) ) ( not ( = ?auto_49101 ?auto_49108 ) ) ( not ( = ?auto_49099 ?auto_49108 ) ) ( not ( = ?auto_49089 ?auto_49108 ) ) ( not ( = ?auto_49096 ?auto_49108 ) ) ( not ( = ?auto_49084 ?auto_49108 ) ) ( not ( = ?auto_49105 ?auto_49092 ) ) ( not ( = ?auto_49107 ?auto_49105 ) ) ( not ( = ?auto_49088 ?auto_49105 ) ) ( not ( = ?auto_49112 ?auto_49105 ) ) ( HOIST-AT ?auto_49109 ?auto_49105 ) ( not ( = ?auto_49095 ?auto_49109 ) ) ( not ( = ?auto_49085 ?auto_49109 ) ) ( not ( = ?auto_49091 ?auto_49109 ) ) ( not ( = ?auto_49103 ?auto_49109 ) ) ( AVAILABLE ?auto_49109 ) ( SURFACE-AT ?auto_49096 ?auto_49105 ) ( ON ?auto_49096 ?auto_49098 ) ( CLEAR ?auto_49096 ) ( not ( = ?auto_49082 ?auto_49098 ) ) ( not ( = ?auto_49083 ?auto_49098 ) ) ( not ( = ?auto_49101 ?auto_49098 ) ) ( not ( = ?auto_49099 ?auto_49098 ) ) ( not ( = ?auto_49089 ?auto_49098 ) ) ( not ( = ?auto_49096 ?auto_49098 ) ) ( not ( = ?auto_49084 ?auto_49098 ) ) ( not ( = ?auto_49108 ?auto_49098 ) ) ( IS-CRATE ?auto_49108 ) ( not ( = ?auto_49082 ?auto_49086 ) ) ( not ( = ?auto_49083 ?auto_49086 ) ) ( not ( = ?auto_49101 ?auto_49086 ) ) ( not ( = ?auto_49099 ?auto_49086 ) ) ( not ( = ?auto_49089 ?auto_49086 ) ) ( not ( = ?auto_49096 ?auto_49086 ) ) ( not ( = ?auto_49084 ?auto_49086 ) ) ( not ( = ?auto_49108 ?auto_49086 ) ) ( not ( = ?auto_49098 ?auto_49086 ) ) ( not ( = ?auto_49094 ?auto_49092 ) ) ( not ( = ?auto_49107 ?auto_49094 ) ) ( not ( = ?auto_49088 ?auto_49094 ) ) ( not ( = ?auto_49112 ?auto_49094 ) ) ( not ( = ?auto_49105 ?auto_49094 ) ) ( HOIST-AT ?auto_49110 ?auto_49094 ) ( not ( = ?auto_49095 ?auto_49110 ) ) ( not ( = ?auto_49085 ?auto_49110 ) ) ( not ( = ?auto_49091 ?auto_49110 ) ) ( not ( = ?auto_49103 ?auto_49110 ) ) ( not ( = ?auto_49109 ?auto_49110 ) ) ( AVAILABLE ?auto_49110 ) ( SURFACE-AT ?auto_49108 ?auto_49094 ) ( ON ?auto_49108 ?auto_49090 ) ( CLEAR ?auto_49108 ) ( not ( = ?auto_49082 ?auto_49090 ) ) ( not ( = ?auto_49083 ?auto_49090 ) ) ( not ( = ?auto_49101 ?auto_49090 ) ) ( not ( = ?auto_49099 ?auto_49090 ) ) ( not ( = ?auto_49089 ?auto_49090 ) ) ( not ( = ?auto_49096 ?auto_49090 ) ) ( not ( = ?auto_49084 ?auto_49090 ) ) ( not ( = ?auto_49108 ?auto_49090 ) ) ( not ( = ?auto_49098 ?auto_49090 ) ) ( not ( = ?auto_49086 ?auto_49090 ) ) ( IS-CRATE ?auto_49086 ) ( not ( = ?auto_49082 ?auto_49106 ) ) ( not ( = ?auto_49083 ?auto_49106 ) ) ( not ( = ?auto_49101 ?auto_49106 ) ) ( not ( = ?auto_49099 ?auto_49106 ) ) ( not ( = ?auto_49089 ?auto_49106 ) ) ( not ( = ?auto_49096 ?auto_49106 ) ) ( not ( = ?auto_49084 ?auto_49106 ) ) ( not ( = ?auto_49108 ?auto_49106 ) ) ( not ( = ?auto_49098 ?auto_49106 ) ) ( not ( = ?auto_49086 ?auto_49106 ) ) ( not ( = ?auto_49090 ?auto_49106 ) ) ( not ( = ?auto_49102 ?auto_49092 ) ) ( not ( = ?auto_49107 ?auto_49102 ) ) ( not ( = ?auto_49088 ?auto_49102 ) ) ( not ( = ?auto_49112 ?auto_49102 ) ) ( not ( = ?auto_49105 ?auto_49102 ) ) ( not ( = ?auto_49094 ?auto_49102 ) ) ( HOIST-AT ?auto_49100 ?auto_49102 ) ( not ( = ?auto_49095 ?auto_49100 ) ) ( not ( = ?auto_49085 ?auto_49100 ) ) ( not ( = ?auto_49091 ?auto_49100 ) ) ( not ( = ?auto_49103 ?auto_49100 ) ) ( not ( = ?auto_49109 ?auto_49100 ) ) ( not ( = ?auto_49110 ?auto_49100 ) ) ( AVAILABLE ?auto_49100 ) ( SURFACE-AT ?auto_49086 ?auto_49102 ) ( ON ?auto_49086 ?auto_49087 ) ( CLEAR ?auto_49086 ) ( not ( = ?auto_49082 ?auto_49087 ) ) ( not ( = ?auto_49083 ?auto_49087 ) ) ( not ( = ?auto_49101 ?auto_49087 ) ) ( not ( = ?auto_49099 ?auto_49087 ) ) ( not ( = ?auto_49089 ?auto_49087 ) ) ( not ( = ?auto_49096 ?auto_49087 ) ) ( not ( = ?auto_49084 ?auto_49087 ) ) ( not ( = ?auto_49108 ?auto_49087 ) ) ( not ( = ?auto_49098 ?auto_49087 ) ) ( not ( = ?auto_49086 ?auto_49087 ) ) ( not ( = ?auto_49090 ?auto_49087 ) ) ( not ( = ?auto_49106 ?auto_49087 ) ) ( IS-CRATE ?auto_49106 ) ( not ( = ?auto_49082 ?auto_49104 ) ) ( not ( = ?auto_49083 ?auto_49104 ) ) ( not ( = ?auto_49101 ?auto_49104 ) ) ( not ( = ?auto_49099 ?auto_49104 ) ) ( not ( = ?auto_49089 ?auto_49104 ) ) ( not ( = ?auto_49096 ?auto_49104 ) ) ( not ( = ?auto_49084 ?auto_49104 ) ) ( not ( = ?auto_49108 ?auto_49104 ) ) ( not ( = ?auto_49098 ?auto_49104 ) ) ( not ( = ?auto_49086 ?auto_49104 ) ) ( not ( = ?auto_49090 ?auto_49104 ) ) ( not ( = ?auto_49106 ?auto_49104 ) ) ( not ( = ?auto_49087 ?auto_49104 ) ) ( AVAILABLE ?auto_49091 ) ( SURFACE-AT ?auto_49106 ?auto_49088 ) ( ON ?auto_49106 ?auto_49093 ) ( CLEAR ?auto_49106 ) ( not ( = ?auto_49082 ?auto_49093 ) ) ( not ( = ?auto_49083 ?auto_49093 ) ) ( not ( = ?auto_49101 ?auto_49093 ) ) ( not ( = ?auto_49099 ?auto_49093 ) ) ( not ( = ?auto_49089 ?auto_49093 ) ) ( not ( = ?auto_49096 ?auto_49093 ) ) ( not ( = ?auto_49084 ?auto_49093 ) ) ( not ( = ?auto_49108 ?auto_49093 ) ) ( not ( = ?auto_49098 ?auto_49093 ) ) ( not ( = ?auto_49086 ?auto_49093 ) ) ( not ( = ?auto_49090 ?auto_49093 ) ) ( not ( = ?auto_49106 ?auto_49093 ) ) ( not ( = ?auto_49087 ?auto_49093 ) ) ( not ( = ?auto_49104 ?auto_49093 ) ) ( SURFACE-AT ?auto_49097 ?auto_49092 ) ( CLEAR ?auto_49097 ) ( IS-CRATE ?auto_49104 ) ( not ( = ?auto_49082 ?auto_49097 ) ) ( not ( = ?auto_49083 ?auto_49097 ) ) ( not ( = ?auto_49101 ?auto_49097 ) ) ( not ( = ?auto_49099 ?auto_49097 ) ) ( not ( = ?auto_49089 ?auto_49097 ) ) ( not ( = ?auto_49096 ?auto_49097 ) ) ( not ( = ?auto_49084 ?auto_49097 ) ) ( not ( = ?auto_49108 ?auto_49097 ) ) ( not ( = ?auto_49098 ?auto_49097 ) ) ( not ( = ?auto_49086 ?auto_49097 ) ) ( not ( = ?auto_49090 ?auto_49097 ) ) ( not ( = ?auto_49106 ?auto_49097 ) ) ( not ( = ?auto_49087 ?auto_49097 ) ) ( not ( = ?auto_49104 ?auto_49097 ) ) ( not ( = ?auto_49093 ?auto_49097 ) ) ( AVAILABLE ?auto_49095 ) ( IN ?auto_49104 ?auto_49111 ) ( TRUCK-AT ?auto_49111 ?auto_49094 ) )
    :subtasks
    ( ( !DRIVE ?auto_49111 ?auto_49094 ?auto_49092 )
      ( MAKE-ON ?auto_49082 ?auto_49083 )
      ( MAKE-ON-VERIFY ?auto_49082 ?auto_49083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49113 - SURFACE
      ?auto_49114 - SURFACE
    )
    :vars
    (
      ?auto_49141 - HOIST
      ?auto_49142 - PLACE
      ?auto_49116 - PLACE
      ?auto_49138 - HOIST
      ?auto_49121 - SURFACE
      ?auto_49133 - SURFACE
      ?auto_49140 - PLACE
      ?auto_49136 - HOIST
      ?auto_49135 - SURFACE
      ?auto_49122 - SURFACE
      ?auto_49132 - PLACE
      ?auto_49124 - HOIST
      ?auto_49143 - SURFACE
      ?auto_49130 - SURFACE
      ?auto_49127 - PLACE
      ?auto_49131 - HOIST
      ?auto_49119 - SURFACE
      ?auto_49137 - SURFACE
      ?auto_49120 - PLACE
      ?auto_49123 - HOIST
      ?auto_49134 - SURFACE
      ?auto_49126 - SURFACE
      ?auto_49125 - PLACE
      ?auto_49117 - HOIST
      ?auto_49139 - SURFACE
      ?auto_49115 - SURFACE
      ?auto_49128 - SURFACE
      ?auto_49129 - SURFACE
      ?auto_49118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49141 ?auto_49142 ) ( IS-CRATE ?auto_49113 ) ( not ( = ?auto_49113 ?auto_49114 ) ) ( not ( = ?auto_49116 ?auto_49142 ) ) ( HOIST-AT ?auto_49138 ?auto_49116 ) ( not ( = ?auto_49141 ?auto_49138 ) ) ( AVAILABLE ?auto_49138 ) ( SURFACE-AT ?auto_49113 ?auto_49116 ) ( ON ?auto_49113 ?auto_49121 ) ( CLEAR ?auto_49113 ) ( not ( = ?auto_49113 ?auto_49121 ) ) ( not ( = ?auto_49114 ?auto_49121 ) ) ( IS-CRATE ?auto_49114 ) ( not ( = ?auto_49113 ?auto_49133 ) ) ( not ( = ?auto_49114 ?auto_49133 ) ) ( not ( = ?auto_49121 ?auto_49133 ) ) ( not ( = ?auto_49140 ?auto_49142 ) ) ( not ( = ?auto_49116 ?auto_49140 ) ) ( HOIST-AT ?auto_49136 ?auto_49140 ) ( not ( = ?auto_49141 ?auto_49136 ) ) ( not ( = ?auto_49138 ?auto_49136 ) ) ( SURFACE-AT ?auto_49114 ?auto_49140 ) ( ON ?auto_49114 ?auto_49135 ) ( CLEAR ?auto_49114 ) ( not ( = ?auto_49113 ?auto_49135 ) ) ( not ( = ?auto_49114 ?auto_49135 ) ) ( not ( = ?auto_49121 ?auto_49135 ) ) ( not ( = ?auto_49133 ?auto_49135 ) ) ( IS-CRATE ?auto_49133 ) ( not ( = ?auto_49113 ?auto_49122 ) ) ( not ( = ?auto_49114 ?auto_49122 ) ) ( not ( = ?auto_49121 ?auto_49122 ) ) ( not ( = ?auto_49133 ?auto_49122 ) ) ( not ( = ?auto_49135 ?auto_49122 ) ) ( not ( = ?auto_49132 ?auto_49142 ) ) ( not ( = ?auto_49116 ?auto_49132 ) ) ( not ( = ?auto_49140 ?auto_49132 ) ) ( HOIST-AT ?auto_49124 ?auto_49132 ) ( not ( = ?auto_49141 ?auto_49124 ) ) ( not ( = ?auto_49138 ?auto_49124 ) ) ( not ( = ?auto_49136 ?auto_49124 ) ) ( AVAILABLE ?auto_49124 ) ( SURFACE-AT ?auto_49133 ?auto_49132 ) ( ON ?auto_49133 ?auto_49143 ) ( CLEAR ?auto_49133 ) ( not ( = ?auto_49113 ?auto_49143 ) ) ( not ( = ?auto_49114 ?auto_49143 ) ) ( not ( = ?auto_49121 ?auto_49143 ) ) ( not ( = ?auto_49133 ?auto_49143 ) ) ( not ( = ?auto_49135 ?auto_49143 ) ) ( not ( = ?auto_49122 ?auto_49143 ) ) ( IS-CRATE ?auto_49122 ) ( not ( = ?auto_49113 ?auto_49130 ) ) ( not ( = ?auto_49114 ?auto_49130 ) ) ( not ( = ?auto_49121 ?auto_49130 ) ) ( not ( = ?auto_49133 ?auto_49130 ) ) ( not ( = ?auto_49135 ?auto_49130 ) ) ( not ( = ?auto_49122 ?auto_49130 ) ) ( not ( = ?auto_49143 ?auto_49130 ) ) ( not ( = ?auto_49127 ?auto_49142 ) ) ( not ( = ?auto_49116 ?auto_49127 ) ) ( not ( = ?auto_49140 ?auto_49127 ) ) ( not ( = ?auto_49132 ?auto_49127 ) ) ( HOIST-AT ?auto_49131 ?auto_49127 ) ( not ( = ?auto_49141 ?auto_49131 ) ) ( not ( = ?auto_49138 ?auto_49131 ) ) ( not ( = ?auto_49136 ?auto_49131 ) ) ( not ( = ?auto_49124 ?auto_49131 ) ) ( AVAILABLE ?auto_49131 ) ( SURFACE-AT ?auto_49122 ?auto_49127 ) ( ON ?auto_49122 ?auto_49119 ) ( CLEAR ?auto_49122 ) ( not ( = ?auto_49113 ?auto_49119 ) ) ( not ( = ?auto_49114 ?auto_49119 ) ) ( not ( = ?auto_49121 ?auto_49119 ) ) ( not ( = ?auto_49133 ?auto_49119 ) ) ( not ( = ?auto_49135 ?auto_49119 ) ) ( not ( = ?auto_49122 ?auto_49119 ) ) ( not ( = ?auto_49143 ?auto_49119 ) ) ( not ( = ?auto_49130 ?auto_49119 ) ) ( IS-CRATE ?auto_49130 ) ( not ( = ?auto_49113 ?auto_49137 ) ) ( not ( = ?auto_49114 ?auto_49137 ) ) ( not ( = ?auto_49121 ?auto_49137 ) ) ( not ( = ?auto_49133 ?auto_49137 ) ) ( not ( = ?auto_49135 ?auto_49137 ) ) ( not ( = ?auto_49122 ?auto_49137 ) ) ( not ( = ?auto_49143 ?auto_49137 ) ) ( not ( = ?auto_49130 ?auto_49137 ) ) ( not ( = ?auto_49119 ?auto_49137 ) ) ( not ( = ?auto_49120 ?auto_49142 ) ) ( not ( = ?auto_49116 ?auto_49120 ) ) ( not ( = ?auto_49140 ?auto_49120 ) ) ( not ( = ?auto_49132 ?auto_49120 ) ) ( not ( = ?auto_49127 ?auto_49120 ) ) ( HOIST-AT ?auto_49123 ?auto_49120 ) ( not ( = ?auto_49141 ?auto_49123 ) ) ( not ( = ?auto_49138 ?auto_49123 ) ) ( not ( = ?auto_49136 ?auto_49123 ) ) ( not ( = ?auto_49124 ?auto_49123 ) ) ( not ( = ?auto_49131 ?auto_49123 ) ) ( SURFACE-AT ?auto_49130 ?auto_49120 ) ( ON ?auto_49130 ?auto_49134 ) ( CLEAR ?auto_49130 ) ( not ( = ?auto_49113 ?auto_49134 ) ) ( not ( = ?auto_49114 ?auto_49134 ) ) ( not ( = ?auto_49121 ?auto_49134 ) ) ( not ( = ?auto_49133 ?auto_49134 ) ) ( not ( = ?auto_49135 ?auto_49134 ) ) ( not ( = ?auto_49122 ?auto_49134 ) ) ( not ( = ?auto_49143 ?auto_49134 ) ) ( not ( = ?auto_49130 ?auto_49134 ) ) ( not ( = ?auto_49119 ?auto_49134 ) ) ( not ( = ?auto_49137 ?auto_49134 ) ) ( IS-CRATE ?auto_49137 ) ( not ( = ?auto_49113 ?auto_49126 ) ) ( not ( = ?auto_49114 ?auto_49126 ) ) ( not ( = ?auto_49121 ?auto_49126 ) ) ( not ( = ?auto_49133 ?auto_49126 ) ) ( not ( = ?auto_49135 ?auto_49126 ) ) ( not ( = ?auto_49122 ?auto_49126 ) ) ( not ( = ?auto_49143 ?auto_49126 ) ) ( not ( = ?auto_49130 ?auto_49126 ) ) ( not ( = ?auto_49119 ?auto_49126 ) ) ( not ( = ?auto_49137 ?auto_49126 ) ) ( not ( = ?auto_49134 ?auto_49126 ) ) ( not ( = ?auto_49125 ?auto_49142 ) ) ( not ( = ?auto_49116 ?auto_49125 ) ) ( not ( = ?auto_49140 ?auto_49125 ) ) ( not ( = ?auto_49132 ?auto_49125 ) ) ( not ( = ?auto_49127 ?auto_49125 ) ) ( not ( = ?auto_49120 ?auto_49125 ) ) ( HOIST-AT ?auto_49117 ?auto_49125 ) ( not ( = ?auto_49141 ?auto_49117 ) ) ( not ( = ?auto_49138 ?auto_49117 ) ) ( not ( = ?auto_49136 ?auto_49117 ) ) ( not ( = ?auto_49124 ?auto_49117 ) ) ( not ( = ?auto_49131 ?auto_49117 ) ) ( not ( = ?auto_49123 ?auto_49117 ) ) ( AVAILABLE ?auto_49117 ) ( SURFACE-AT ?auto_49137 ?auto_49125 ) ( ON ?auto_49137 ?auto_49139 ) ( CLEAR ?auto_49137 ) ( not ( = ?auto_49113 ?auto_49139 ) ) ( not ( = ?auto_49114 ?auto_49139 ) ) ( not ( = ?auto_49121 ?auto_49139 ) ) ( not ( = ?auto_49133 ?auto_49139 ) ) ( not ( = ?auto_49135 ?auto_49139 ) ) ( not ( = ?auto_49122 ?auto_49139 ) ) ( not ( = ?auto_49143 ?auto_49139 ) ) ( not ( = ?auto_49130 ?auto_49139 ) ) ( not ( = ?auto_49119 ?auto_49139 ) ) ( not ( = ?auto_49137 ?auto_49139 ) ) ( not ( = ?auto_49134 ?auto_49139 ) ) ( not ( = ?auto_49126 ?auto_49139 ) ) ( IS-CRATE ?auto_49126 ) ( not ( = ?auto_49113 ?auto_49115 ) ) ( not ( = ?auto_49114 ?auto_49115 ) ) ( not ( = ?auto_49121 ?auto_49115 ) ) ( not ( = ?auto_49133 ?auto_49115 ) ) ( not ( = ?auto_49135 ?auto_49115 ) ) ( not ( = ?auto_49122 ?auto_49115 ) ) ( not ( = ?auto_49143 ?auto_49115 ) ) ( not ( = ?auto_49130 ?auto_49115 ) ) ( not ( = ?auto_49119 ?auto_49115 ) ) ( not ( = ?auto_49137 ?auto_49115 ) ) ( not ( = ?auto_49134 ?auto_49115 ) ) ( not ( = ?auto_49126 ?auto_49115 ) ) ( not ( = ?auto_49139 ?auto_49115 ) ) ( AVAILABLE ?auto_49136 ) ( SURFACE-AT ?auto_49126 ?auto_49140 ) ( ON ?auto_49126 ?auto_49128 ) ( CLEAR ?auto_49126 ) ( not ( = ?auto_49113 ?auto_49128 ) ) ( not ( = ?auto_49114 ?auto_49128 ) ) ( not ( = ?auto_49121 ?auto_49128 ) ) ( not ( = ?auto_49133 ?auto_49128 ) ) ( not ( = ?auto_49135 ?auto_49128 ) ) ( not ( = ?auto_49122 ?auto_49128 ) ) ( not ( = ?auto_49143 ?auto_49128 ) ) ( not ( = ?auto_49130 ?auto_49128 ) ) ( not ( = ?auto_49119 ?auto_49128 ) ) ( not ( = ?auto_49137 ?auto_49128 ) ) ( not ( = ?auto_49134 ?auto_49128 ) ) ( not ( = ?auto_49126 ?auto_49128 ) ) ( not ( = ?auto_49139 ?auto_49128 ) ) ( not ( = ?auto_49115 ?auto_49128 ) ) ( SURFACE-AT ?auto_49129 ?auto_49142 ) ( CLEAR ?auto_49129 ) ( IS-CRATE ?auto_49115 ) ( not ( = ?auto_49113 ?auto_49129 ) ) ( not ( = ?auto_49114 ?auto_49129 ) ) ( not ( = ?auto_49121 ?auto_49129 ) ) ( not ( = ?auto_49133 ?auto_49129 ) ) ( not ( = ?auto_49135 ?auto_49129 ) ) ( not ( = ?auto_49122 ?auto_49129 ) ) ( not ( = ?auto_49143 ?auto_49129 ) ) ( not ( = ?auto_49130 ?auto_49129 ) ) ( not ( = ?auto_49119 ?auto_49129 ) ) ( not ( = ?auto_49137 ?auto_49129 ) ) ( not ( = ?auto_49134 ?auto_49129 ) ) ( not ( = ?auto_49126 ?auto_49129 ) ) ( not ( = ?auto_49139 ?auto_49129 ) ) ( not ( = ?auto_49115 ?auto_49129 ) ) ( not ( = ?auto_49128 ?auto_49129 ) ) ( AVAILABLE ?auto_49141 ) ( TRUCK-AT ?auto_49118 ?auto_49120 ) ( LIFTING ?auto_49123 ?auto_49115 ) )
    :subtasks
    ( ( !LOAD ?auto_49123 ?auto_49115 ?auto_49118 ?auto_49120 )
      ( MAKE-ON ?auto_49113 ?auto_49114 )
      ( MAKE-ON-VERIFY ?auto_49113 ?auto_49114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49144 - SURFACE
      ?auto_49145 - SURFACE
    )
    :vars
    (
      ?auto_49147 - HOIST
      ?auto_49146 - PLACE
      ?auto_49151 - PLACE
      ?auto_49155 - HOIST
      ?auto_49153 - SURFACE
      ?auto_49158 - SURFACE
      ?auto_49149 - PLACE
      ?auto_49161 - HOIST
      ?auto_49160 - SURFACE
      ?auto_49170 - SURFACE
      ?auto_49157 - PLACE
      ?auto_49165 - HOIST
      ?auto_49154 - SURFACE
      ?auto_49163 - SURFACE
      ?auto_49168 - PLACE
      ?auto_49156 - HOIST
      ?auto_49171 - SURFACE
      ?auto_49162 - SURFACE
      ?auto_49152 - PLACE
      ?auto_49164 - HOIST
      ?auto_49159 - SURFACE
      ?auto_49167 - SURFACE
      ?auto_49166 - PLACE
      ?auto_49150 - HOIST
      ?auto_49148 - SURFACE
      ?auto_49173 - SURFACE
      ?auto_49169 - SURFACE
      ?auto_49174 - SURFACE
      ?auto_49172 - TRUCK
      ?auto_49175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49147 ?auto_49146 ) ( IS-CRATE ?auto_49144 ) ( not ( = ?auto_49144 ?auto_49145 ) ) ( not ( = ?auto_49151 ?auto_49146 ) ) ( HOIST-AT ?auto_49155 ?auto_49151 ) ( not ( = ?auto_49147 ?auto_49155 ) ) ( AVAILABLE ?auto_49155 ) ( SURFACE-AT ?auto_49144 ?auto_49151 ) ( ON ?auto_49144 ?auto_49153 ) ( CLEAR ?auto_49144 ) ( not ( = ?auto_49144 ?auto_49153 ) ) ( not ( = ?auto_49145 ?auto_49153 ) ) ( IS-CRATE ?auto_49145 ) ( not ( = ?auto_49144 ?auto_49158 ) ) ( not ( = ?auto_49145 ?auto_49158 ) ) ( not ( = ?auto_49153 ?auto_49158 ) ) ( not ( = ?auto_49149 ?auto_49146 ) ) ( not ( = ?auto_49151 ?auto_49149 ) ) ( HOIST-AT ?auto_49161 ?auto_49149 ) ( not ( = ?auto_49147 ?auto_49161 ) ) ( not ( = ?auto_49155 ?auto_49161 ) ) ( SURFACE-AT ?auto_49145 ?auto_49149 ) ( ON ?auto_49145 ?auto_49160 ) ( CLEAR ?auto_49145 ) ( not ( = ?auto_49144 ?auto_49160 ) ) ( not ( = ?auto_49145 ?auto_49160 ) ) ( not ( = ?auto_49153 ?auto_49160 ) ) ( not ( = ?auto_49158 ?auto_49160 ) ) ( IS-CRATE ?auto_49158 ) ( not ( = ?auto_49144 ?auto_49170 ) ) ( not ( = ?auto_49145 ?auto_49170 ) ) ( not ( = ?auto_49153 ?auto_49170 ) ) ( not ( = ?auto_49158 ?auto_49170 ) ) ( not ( = ?auto_49160 ?auto_49170 ) ) ( not ( = ?auto_49157 ?auto_49146 ) ) ( not ( = ?auto_49151 ?auto_49157 ) ) ( not ( = ?auto_49149 ?auto_49157 ) ) ( HOIST-AT ?auto_49165 ?auto_49157 ) ( not ( = ?auto_49147 ?auto_49165 ) ) ( not ( = ?auto_49155 ?auto_49165 ) ) ( not ( = ?auto_49161 ?auto_49165 ) ) ( AVAILABLE ?auto_49165 ) ( SURFACE-AT ?auto_49158 ?auto_49157 ) ( ON ?auto_49158 ?auto_49154 ) ( CLEAR ?auto_49158 ) ( not ( = ?auto_49144 ?auto_49154 ) ) ( not ( = ?auto_49145 ?auto_49154 ) ) ( not ( = ?auto_49153 ?auto_49154 ) ) ( not ( = ?auto_49158 ?auto_49154 ) ) ( not ( = ?auto_49160 ?auto_49154 ) ) ( not ( = ?auto_49170 ?auto_49154 ) ) ( IS-CRATE ?auto_49170 ) ( not ( = ?auto_49144 ?auto_49163 ) ) ( not ( = ?auto_49145 ?auto_49163 ) ) ( not ( = ?auto_49153 ?auto_49163 ) ) ( not ( = ?auto_49158 ?auto_49163 ) ) ( not ( = ?auto_49160 ?auto_49163 ) ) ( not ( = ?auto_49170 ?auto_49163 ) ) ( not ( = ?auto_49154 ?auto_49163 ) ) ( not ( = ?auto_49168 ?auto_49146 ) ) ( not ( = ?auto_49151 ?auto_49168 ) ) ( not ( = ?auto_49149 ?auto_49168 ) ) ( not ( = ?auto_49157 ?auto_49168 ) ) ( HOIST-AT ?auto_49156 ?auto_49168 ) ( not ( = ?auto_49147 ?auto_49156 ) ) ( not ( = ?auto_49155 ?auto_49156 ) ) ( not ( = ?auto_49161 ?auto_49156 ) ) ( not ( = ?auto_49165 ?auto_49156 ) ) ( AVAILABLE ?auto_49156 ) ( SURFACE-AT ?auto_49170 ?auto_49168 ) ( ON ?auto_49170 ?auto_49171 ) ( CLEAR ?auto_49170 ) ( not ( = ?auto_49144 ?auto_49171 ) ) ( not ( = ?auto_49145 ?auto_49171 ) ) ( not ( = ?auto_49153 ?auto_49171 ) ) ( not ( = ?auto_49158 ?auto_49171 ) ) ( not ( = ?auto_49160 ?auto_49171 ) ) ( not ( = ?auto_49170 ?auto_49171 ) ) ( not ( = ?auto_49154 ?auto_49171 ) ) ( not ( = ?auto_49163 ?auto_49171 ) ) ( IS-CRATE ?auto_49163 ) ( not ( = ?auto_49144 ?auto_49162 ) ) ( not ( = ?auto_49145 ?auto_49162 ) ) ( not ( = ?auto_49153 ?auto_49162 ) ) ( not ( = ?auto_49158 ?auto_49162 ) ) ( not ( = ?auto_49160 ?auto_49162 ) ) ( not ( = ?auto_49170 ?auto_49162 ) ) ( not ( = ?auto_49154 ?auto_49162 ) ) ( not ( = ?auto_49163 ?auto_49162 ) ) ( not ( = ?auto_49171 ?auto_49162 ) ) ( not ( = ?auto_49152 ?auto_49146 ) ) ( not ( = ?auto_49151 ?auto_49152 ) ) ( not ( = ?auto_49149 ?auto_49152 ) ) ( not ( = ?auto_49157 ?auto_49152 ) ) ( not ( = ?auto_49168 ?auto_49152 ) ) ( HOIST-AT ?auto_49164 ?auto_49152 ) ( not ( = ?auto_49147 ?auto_49164 ) ) ( not ( = ?auto_49155 ?auto_49164 ) ) ( not ( = ?auto_49161 ?auto_49164 ) ) ( not ( = ?auto_49165 ?auto_49164 ) ) ( not ( = ?auto_49156 ?auto_49164 ) ) ( SURFACE-AT ?auto_49163 ?auto_49152 ) ( ON ?auto_49163 ?auto_49159 ) ( CLEAR ?auto_49163 ) ( not ( = ?auto_49144 ?auto_49159 ) ) ( not ( = ?auto_49145 ?auto_49159 ) ) ( not ( = ?auto_49153 ?auto_49159 ) ) ( not ( = ?auto_49158 ?auto_49159 ) ) ( not ( = ?auto_49160 ?auto_49159 ) ) ( not ( = ?auto_49170 ?auto_49159 ) ) ( not ( = ?auto_49154 ?auto_49159 ) ) ( not ( = ?auto_49163 ?auto_49159 ) ) ( not ( = ?auto_49171 ?auto_49159 ) ) ( not ( = ?auto_49162 ?auto_49159 ) ) ( IS-CRATE ?auto_49162 ) ( not ( = ?auto_49144 ?auto_49167 ) ) ( not ( = ?auto_49145 ?auto_49167 ) ) ( not ( = ?auto_49153 ?auto_49167 ) ) ( not ( = ?auto_49158 ?auto_49167 ) ) ( not ( = ?auto_49160 ?auto_49167 ) ) ( not ( = ?auto_49170 ?auto_49167 ) ) ( not ( = ?auto_49154 ?auto_49167 ) ) ( not ( = ?auto_49163 ?auto_49167 ) ) ( not ( = ?auto_49171 ?auto_49167 ) ) ( not ( = ?auto_49162 ?auto_49167 ) ) ( not ( = ?auto_49159 ?auto_49167 ) ) ( not ( = ?auto_49166 ?auto_49146 ) ) ( not ( = ?auto_49151 ?auto_49166 ) ) ( not ( = ?auto_49149 ?auto_49166 ) ) ( not ( = ?auto_49157 ?auto_49166 ) ) ( not ( = ?auto_49168 ?auto_49166 ) ) ( not ( = ?auto_49152 ?auto_49166 ) ) ( HOIST-AT ?auto_49150 ?auto_49166 ) ( not ( = ?auto_49147 ?auto_49150 ) ) ( not ( = ?auto_49155 ?auto_49150 ) ) ( not ( = ?auto_49161 ?auto_49150 ) ) ( not ( = ?auto_49165 ?auto_49150 ) ) ( not ( = ?auto_49156 ?auto_49150 ) ) ( not ( = ?auto_49164 ?auto_49150 ) ) ( AVAILABLE ?auto_49150 ) ( SURFACE-AT ?auto_49162 ?auto_49166 ) ( ON ?auto_49162 ?auto_49148 ) ( CLEAR ?auto_49162 ) ( not ( = ?auto_49144 ?auto_49148 ) ) ( not ( = ?auto_49145 ?auto_49148 ) ) ( not ( = ?auto_49153 ?auto_49148 ) ) ( not ( = ?auto_49158 ?auto_49148 ) ) ( not ( = ?auto_49160 ?auto_49148 ) ) ( not ( = ?auto_49170 ?auto_49148 ) ) ( not ( = ?auto_49154 ?auto_49148 ) ) ( not ( = ?auto_49163 ?auto_49148 ) ) ( not ( = ?auto_49171 ?auto_49148 ) ) ( not ( = ?auto_49162 ?auto_49148 ) ) ( not ( = ?auto_49159 ?auto_49148 ) ) ( not ( = ?auto_49167 ?auto_49148 ) ) ( IS-CRATE ?auto_49167 ) ( not ( = ?auto_49144 ?auto_49173 ) ) ( not ( = ?auto_49145 ?auto_49173 ) ) ( not ( = ?auto_49153 ?auto_49173 ) ) ( not ( = ?auto_49158 ?auto_49173 ) ) ( not ( = ?auto_49160 ?auto_49173 ) ) ( not ( = ?auto_49170 ?auto_49173 ) ) ( not ( = ?auto_49154 ?auto_49173 ) ) ( not ( = ?auto_49163 ?auto_49173 ) ) ( not ( = ?auto_49171 ?auto_49173 ) ) ( not ( = ?auto_49162 ?auto_49173 ) ) ( not ( = ?auto_49159 ?auto_49173 ) ) ( not ( = ?auto_49167 ?auto_49173 ) ) ( not ( = ?auto_49148 ?auto_49173 ) ) ( AVAILABLE ?auto_49161 ) ( SURFACE-AT ?auto_49167 ?auto_49149 ) ( ON ?auto_49167 ?auto_49169 ) ( CLEAR ?auto_49167 ) ( not ( = ?auto_49144 ?auto_49169 ) ) ( not ( = ?auto_49145 ?auto_49169 ) ) ( not ( = ?auto_49153 ?auto_49169 ) ) ( not ( = ?auto_49158 ?auto_49169 ) ) ( not ( = ?auto_49160 ?auto_49169 ) ) ( not ( = ?auto_49170 ?auto_49169 ) ) ( not ( = ?auto_49154 ?auto_49169 ) ) ( not ( = ?auto_49163 ?auto_49169 ) ) ( not ( = ?auto_49171 ?auto_49169 ) ) ( not ( = ?auto_49162 ?auto_49169 ) ) ( not ( = ?auto_49159 ?auto_49169 ) ) ( not ( = ?auto_49167 ?auto_49169 ) ) ( not ( = ?auto_49148 ?auto_49169 ) ) ( not ( = ?auto_49173 ?auto_49169 ) ) ( SURFACE-AT ?auto_49174 ?auto_49146 ) ( CLEAR ?auto_49174 ) ( IS-CRATE ?auto_49173 ) ( not ( = ?auto_49144 ?auto_49174 ) ) ( not ( = ?auto_49145 ?auto_49174 ) ) ( not ( = ?auto_49153 ?auto_49174 ) ) ( not ( = ?auto_49158 ?auto_49174 ) ) ( not ( = ?auto_49160 ?auto_49174 ) ) ( not ( = ?auto_49170 ?auto_49174 ) ) ( not ( = ?auto_49154 ?auto_49174 ) ) ( not ( = ?auto_49163 ?auto_49174 ) ) ( not ( = ?auto_49171 ?auto_49174 ) ) ( not ( = ?auto_49162 ?auto_49174 ) ) ( not ( = ?auto_49159 ?auto_49174 ) ) ( not ( = ?auto_49167 ?auto_49174 ) ) ( not ( = ?auto_49148 ?auto_49174 ) ) ( not ( = ?auto_49173 ?auto_49174 ) ) ( not ( = ?auto_49169 ?auto_49174 ) ) ( AVAILABLE ?auto_49147 ) ( TRUCK-AT ?auto_49172 ?auto_49152 ) ( AVAILABLE ?auto_49164 ) ( SURFACE-AT ?auto_49173 ?auto_49152 ) ( ON ?auto_49173 ?auto_49175 ) ( CLEAR ?auto_49173 ) ( not ( = ?auto_49144 ?auto_49175 ) ) ( not ( = ?auto_49145 ?auto_49175 ) ) ( not ( = ?auto_49153 ?auto_49175 ) ) ( not ( = ?auto_49158 ?auto_49175 ) ) ( not ( = ?auto_49160 ?auto_49175 ) ) ( not ( = ?auto_49170 ?auto_49175 ) ) ( not ( = ?auto_49154 ?auto_49175 ) ) ( not ( = ?auto_49163 ?auto_49175 ) ) ( not ( = ?auto_49171 ?auto_49175 ) ) ( not ( = ?auto_49162 ?auto_49175 ) ) ( not ( = ?auto_49159 ?auto_49175 ) ) ( not ( = ?auto_49167 ?auto_49175 ) ) ( not ( = ?auto_49148 ?auto_49175 ) ) ( not ( = ?auto_49173 ?auto_49175 ) ) ( not ( = ?auto_49169 ?auto_49175 ) ) ( not ( = ?auto_49174 ?auto_49175 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49164 ?auto_49173 ?auto_49175 ?auto_49152 )
      ( MAKE-ON ?auto_49144 ?auto_49145 )
      ( MAKE-ON-VERIFY ?auto_49144 ?auto_49145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49176 - SURFACE
      ?auto_49177 - SURFACE
    )
    :vars
    (
      ?auto_49187 - HOIST
      ?auto_49186 - PLACE
      ?auto_49191 - PLACE
      ?auto_49181 - HOIST
      ?auto_49193 - SURFACE
      ?auto_49180 - SURFACE
      ?auto_49189 - PLACE
      ?auto_49185 - HOIST
      ?auto_49205 - SURFACE
      ?auto_49196 - SURFACE
      ?auto_49195 - PLACE
      ?auto_49179 - HOIST
      ?auto_49182 - SURFACE
      ?auto_49203 - SURFACE
      ?auto_49183 - PLACE
      ?auto_49192 - HOIST
      ?auto_49197 - SURFACE
      ?auto_49202 - SURFACE
      ?auto_49206 - PLACE
      ?auto_49204 - HOIST
      ?auto_49194 - SURFACE
      ?auto_49184 - SURFACE
      ?auto_49178 - PLACE
      ?auto_49190 - HOIST
      ?auto_49188 - SURFACE
      ?auto_49199 - SURFACE
      ?auto_49201 - SURFACE
      ?auto_49200 - SURFACE
      ?auto_49207 - SURFACE
      ?auto_49198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49187 ?auto_49186 ) ( IS-CRATE ?auto_49176 ) ( not ( = ?auto_49176 ?auto_49177 ) ) ( not ( = ?auto_49191 ?auto_49186 ) ) ( HOIST-AT ?auto_49181 ?auto_49191 ) ( not ( = ?auto_49187 ?auto_49181 ) ) ( AVAILABLE ?auto_49181 ) ( SURFACE-AT ?auto_49176 ?auto_49191 ) ( ON ?auto_49176 ?auto_49193 ) ( CLEAR ?auto_49176 ) ( not ( = ?auto_49176 ?auto_49193 ) ) ( not ( = ?auto_49177 ?auto_49193 ) ) ( IS-CRATE ?auto_49177 ) ( not ( = ?auto_49176 ?auto_49180 ) ) ( not ( = ?auto_49177 ?auto_49180 ) ) ( not ( = ?auto_49193 ?auto_49180 ) ) ( not ( = ?auto_49189 ?auto_49186 ) ) ( not ( = ?auto_49191 ?auto_49189 ) ) ( HOIST-AT ?auto_49185 ?auto_49189 ) ( not ( = ?auto_49187 ?auto_49185 ) ) ( not ( = ?auto_49181 ?auto_49185 ) ) ( SURFACE-AT ?auto_49177 ?auto_49189 ) ( ON ?auto_49177 ?auto_49205 ) ( CLEAR ?auto_49177 ) ( not ( = ?auto_49176 ?auto_49205 ) ) ( not ( = ?auto_49177 ?auto_49205 ) ) ( not ( = ?auto_49193 ?auto_49205 ) ) ( not ( = ?auto_49180 ?auto_49205 ) ) ( IS-CRATE ?auto_49180 ) ( not ( = ?auto_49176 ?auto_49196 ) ) ( not ( = ?auto_49177 ?auto_49196 ) ) ( not ( = ?auto_49193 ?auto_49196 ) ) ( not ( = ?auto_49180 ?auto_49196 ) ) ( not ( = ?auto_49205 ?auto_49196 ) ) ( not ( = ?auto_49195 ?auto_49186 ) ) ( not ( = ?auto_49191 ?auto_49195 ) ) ( not ( = ?auto_49189 ?auto_49195 ) ) ( HOIST-AT ?auto_49179 ?auto_49195 ) ( not ( = ?auto_49187 ?auto_49179 ) ) ( not ( = ?auto_49181 ?auto_49179 ) ) ( not ( = ?auto_49185 ?auto_49179 ) ) ( AVAILABLE ?auto_49179 ) ( SURFACE-AT ?auto_49180 ?auto_49195 ) ( ON ?auto_49180 ?auto_49182 ) ( CLEAR ?auto_49180 ) ( not ( = ?auto_49176 ?auto_49182 ) ) ( not ( = ?auto_49177 ?auto_49182 ) ) ( not ( = ?auto_49193 ?auto_49182 ) ) ( not ( = ?auto_49180 ?auto_49182 ) ) ( not ( = ?auto_49205 ?auto_49182 ) ) ( not ( = ?auto_49196 ?auto_49182 ) ) ( IS-CRATE ?auto_49196 ) ( not ( = ?auto_49176 ?auto_49203 ) ) ( not ( = ?auto_49177 ?auto_49203 ) ) ( not ( = ?auto_49193 ?auto_49203 ) ) ( not ( = ?auto_49180 ?auto_49203 ) ) ( not ( = ?auto_49205 ?auto_49203 ) ) ( not ( = ?auto_49196 ?auto_49203 ) ) ( not ( = ?auto_49182 ?auto_49203 ) ) ( not ( = ?auto_49183 ?auto_49186 ) ) ( not ( = ?auto_49191 ?auto_49183 ) ) ( not ( = ?auto_49189 ?auto_49183 ) ) ( not ( = ?auto_49195 ?auto_49183 ) ) ( HOIST-AT ?auto_49192 ?auto_49183 ) ( not ( = ?auto_49187 ?auto_49192 ) ) ( not ( = ?auto_49181 ?auto_49192 ) ) ( not ( = ?auto_49185 ?auto_49192 ) ) ( not ( = ?auto_49179 ?auto_49192 ) ) ( AVAILABLE ?auto_49192 ) ( SURFACE-AT ?auto_49196 ?auto_49183 ) ( ON ?auto_49196 ?auto_49197 ) ( CLEAR ?auto_49196 ) ( not ( = ?auto_49176 ?auto_49197 ) ) ( not ( = ?auto_49177 ?auto_49197 ) ) ( not ( = ?auto_49193 ?auto_49197 ) ) ( not ( = ?auto_49180 ?auto_49197 ) ) ( not ( = ?auto_49205 ?auto_49197 ) ) ( not ( = ?auto_49196 ?auto_49197 ) ) ( not ( = ?auto_49182 ?auto_49197 ) ) ( not ( = ?auto_49203 ?auto_49197 ) ) ( IS-CRATE ?auto_49203 ) ( not ( = ?auto_49176 ?auto_49202 ) ) ( not ( = ?auto_49177 ?auto_49202 ) ) ( not ( = ?auto_49193 ?auto_49202 ) ) ( not ( = ?auto_49180 ?auto_49202 ) ) ( not ( = ?auto_49205 ?auto_49202 ) ) ( not ( = ?auto_49196 ?auto_49202 ) ) ( not ( = ?auto_49182 ?auto_49202 ) ) ( not ( = ?auto_49203 ?auto_49202 ) ) ( not ( = ?auto_49197 ?auto_49202 ) ) ( not ( = ?auto_49206 ?auto_49186 ) ) ( not ( = ?auto_49191 ?auto_49206 ) ) ( not ( = ?auto_49189 ?auto_49206 ) ) ( not ( = ?auto_49195 ?auto_49206 ) ) ( not ( = ?auto_49183 ?auto_49206 ) ) ( HOIST-AT ?auto_49204 ?auto_49206 ) ( not ( = ?auto_49187 ?auto_49204 ) ) ( not ( = ?auto_49181 ?auto_49204 ) ) ( not ( = ?auto_49185 ?auto_49204 ) ) ( not ( = ?auto_49179 ?auto_49204 ) ) ( not ( = ?auto_49192 ?auto_49204 ) ) ( SURFACE-AT ?auto_49203 ?auto_49206 ) ( ON ?auto_49203 ?auto_49194 ) ( CLEAR ?auto_49203 ) ( not ( = ?auto_49176 ?auto_49194 ) ) ( not ( = ?auto_49177 ?auto_49194 ) ) ( not ( = ?auto_49193 ?auto_49194 ) ) ( not ( = ?auto_49180 ?auto_49194 ) ) ( not ( = ?auto_49205 ?auto_49194 ) ) ( not ( = ?auto_49196 ?auto_49194 ) ) ( not ( = ?auto_49182 ?auto_49194 ) ) ( not ( = ?auto_49203 ?auto_49194 ) ) ( not ( = ?auto_49197 ?auto_49194 ) ) ( not ( = ?auto_49202 ?auto_49194 ) ) ( IS-CRATE ?auto_49202 ) ( not ( = ?auto_49176 ?auto_49184 ) ) ( not ( = ?auto_49177 ?auto_49184 ) ) ( not ( = ?auto_49193 ?auto_49184 ) ) ( not ( = ?auto_49180 ?auto_49184 ) ) ( not ( = ?auto_49205 ?auto_49184 ) ) ( not ( = ?auto_49196 ?auto_49184 ) ) ( not ( = ?auto_49182 ?auto_49184 ) ) ( not ( = ?auto_49203 ?auto_49184 ) ) ( not ( = ?auto_49197 ?auto_49184 ) ) ( not ( = ?auto_49202 ?auto_49184 ) ) ( not ( = ?auto_49194 ?auto_49184 ) ) ( not ( = ?auto_49178 ?auto_49186 ) ) ( not ( = ?auto_49191 ?auto_49178 ) ) ( not ( = ?auto_49189 ?auto_49178 ) ) ( not ( = ?auto_49195 ?auto_49178 ) ) ( not ( = ?auto_49183 ?auto_49178 ) ) ( not ( = ?auto_49206 ?auto_49178 ) ) ( HOIST-AT ?auto_49190 ?auto_49178 ) ( not ( = ?auto_49187 ?auto_49190 ) ) ( not ( = ?auto_49181 ?auto_49190 ) ) ( not ( = ?auto_49185 ?auto_49190 ) ) ( not ( = ?auto_49179 ?auto_49190 ) ) ( not ( = ?auto_49192 ?auto_49190 ) ) ( not ( = ?auto_49204 ?auto_49190 ) ) ( AVAILABLE ?auto_49190 ) ( SURFACE-AT ?auto_49202 ?auto_49178 ) ( ON ?auto_49202 ?auto_49188 ) ( CLEAR ?auto_49202 ) ( not ( = ?auto_49176 ?auto_49188 ) ) ( not ( = ?auto_49177 ?auto_49188 ) ) ( not ( = ?auto_49193 ?auto_49188 ) ) ( not ( = ?auto_49180 ?auto_49188 ) ) ( not ( = ?auto_49205 ?auto_49188 ) ) ( not ( = ?auto_49196 ?auto_49188 ) ) ( not ( = ?auto_49182 ?auto_49188 ) ) ( not ( = ?auto_49203 ?auto_49188 ) ) ( not ( = ?auto_49197 ?auto_49188 ) ) ( not ( = ?auto_49202 ?auto_49188 ) ) ( not ( = ?auto_49194 ?auto_49188 ) ) ( not ( = ?auto_49184 ?auto_49188 ) ) ( IS-CRATE ?auto_49184 ) ( not ( = ?auto_49176 ?auto_49199 ) ) ( not ( = ?auto_49177 ?auto_49199 ) ) ( not ( = ?auto_49193 ?auto_49199 ) ) ( not ( = ?auto_49180 ?auto_49199 ) ) ( not ( = ?auto_49205 ?auto_49199 ) ) ( not ( = ?auto_49196 ?auto_49199 ) ) ( not ( = ?auto_49182 ?auto_49199 ) ) ( not ( = ?auto_49203 ?auto_49199 ) ) ( not ( = ?auto_49197 ?auto_49199 ) ) ( not ( = ?auto_49202 ?auto_49199 ) ) ( not ( = ?auto_49194 ?auto_49199 ) ) ( not ( = ?auto_49184 ?auto_49199 ) ) ( not ( = ?auto_49188 ?auto_49199 ) ) ( AVAILABLE ?auto_49185 ) ( SURFACE-AT ?auto_49184 ?auto_49189 ) ( ON ?auto_49184 ?auto_49201 ) ( CLEAR ?auto_49184 ) ( not ( = ?auto_49176 ?auto_49201 ) ) ( not ( = ?auto_49177 ?auto_49201 ) ) ( not ( = ?auto_49193 ?auto_49201 ) ) ( not ( = ?auto_49180 ?auto_49201 ) ) ( not ( = ?auto_49205 ?auto_49201 ) ) ( not ( = ?auto_49196 ?auto_49201 ) ) ( not ( = ?auto_49182 ?auto_49201 ) ) ( not ( = ?auto_49203 ?auto_49201 ) ) ( not ( = ?auto_49197 ?auto_49201 ) ) ( not ( = ?auto_49202 ?auto_49201 ) ) ( not ( = ?auto_49194 ?auto_49201 ) ) ( not ( = ?auto_49184 ?auto_49201 ) ) ( not ( = ?auto_49188 ?auto_49201 ) ) ( not ( = ?auto_49199 ?auto_49201 ) ) ( SURFACE-AT ?auto_49200 ?auto_49186 ) ( CLEAR ?auto_49200 ) ( IS-CRATE ?auto_49199 ) ( not ( = ?auto_49176 ?auto_49200 ) ) ( not ( = ?auto_49177 ?auto_49200 ) ) ( not ( = ?auto_49193 ?auto_49200 ) ) ( not ( = ?auto_49180 ?auto_49200 ) ) ( not ( = ?auto_49205 ?auto_49200 ) ) ( not ( = ?auto_49196 ?auto_49200 ) ) ( not ( = ?auto_49182 ?auto_49200 ) ) ( not ( = ?auto_49203 ?auto_49200 ) ) ( not ( = ?auto_49197 ?auto_49200 ) ) ( not ( = ?auto_49202 ?auto_49200 ) ) ( not ( = ?auto_49194 ?auto_49200 ) ) ( not ( = ?auto_49184 ?auto_49200 ) ) ( not ( = ?auto_49188 ?auto_49200 ) ) ( not ( = ?auto_49199 ?auto_49200 ) ) ( not ( = ?auto_49201 ?auto_49200 ) ) ( AVAILABLE ?auto_49187 ) ( AVAILABLE ?auto_49204 ) ( SURFACE-AT ?auto_49199 ?auto_49206 ) ( ON ?auto_49199 ?auto_49207 ) ( CLEAR ?auto_49199 ) ( not ( = ?auto_49176 ?auto_49207 ) ) ( not ( = ?auto_49177 ?auto_49207 ) ) ( not ( = ?auto_49193 ?auto_49207 ) ) ( not ( = ?auto_49180 ?auto_49207 ) ) ( not ( = ?auto_49205 ?auto_49207 ) ) ( not ( = ?auto_49196 ?auto_49207 ) ) ( not ( = ?auto_49182 ?auto_49207 ) ) ( not ( = ?auto_49203 ?auto_49207 ) ) ( not ( = ?auto_49197 ?auto_49207 ) ) ( not ( = ?auto_49202 ?auto_49207 ) ) ( not ( = ?auto_49194 ?auto_49207 ) ) ( not ( = ?auto_49184 ?auto_49207 ) ) ( not ( = ?auto_49188 ?auto_49207 ) ) ( not ( = ?auto_49199 ?auto_49207 ) ) ( not ( = ?auto_49201 ?auto_49207 ) ) ( not ( = ?auto_49200 ?auto_49207 ) ) ( TRUCK-AT ?auto_49198 ?auto_49186 ) )
    :subtasks
    ( ( !DRIVE ?auto_49198 ?auto_49186 ?auto_49206 )
      ( MAKE-ON ?auto_49176 ?auto_49177 )
      ( MAKE-ON-VERIFY ?auto_49176 ?auto_49177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49210 - SURFACE
      ?auto_49211 - SURFACE
    )
    :vars
    (
      ?auto_49212 - HOIST
      ?auto_49213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49212 ?auto_49213 ) ( SURFACE-AT ?auto_49211 ?auto_49213 ) ( CLEAR ?auto_49211 ) ( LIFTING ?auto_49212 ?auto_49210 ) ( IS-CRATE ?auto_49210 ) ( not ( = ?auto_49210 ?auto_49211 ) ) )
    :subtasks
    ( ( !DROP ?auto_49212 ?auto_49210 ?auto_49211 ?auto_49213 )
      ( MAKE-ON-VERIFY ?auto_49210 ?auto_49211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49214 - SURFACE
      ?auto_49215 - SURFACE
    )
    :vars
    (
      ?auto_49217 - HOIST
      ?auto_49216 - PLACE
      ?auto_49218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49217 ?auto_49216 ) ( SURFACE-AT ?auto_49215 ?auto_49216 ) ( CLEAR ?auto_49215 ) ( IS-CRATE ?auto_49214 ) ( not ( = ?auto_49214 ?auto_49215 ) ) ( TRUCK-AT ?auto_49218 ?auto_49216 ) ( AVAILABLE ?auto_49217 ) ( IN ?auto_49214 ?auto_49218 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49217 ?auto_49214 ?auto_49218 ?auto_49216 )
      ( MAKE-ON ?auto_49214 ?auto_49215 )
      ( MAKE-ON-VERIFY ?auto_49214 ?auto_49215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49219 - SURFACE
      ?auto_49220 - SURFACE
    )
    :vars
    (
      ?auto_49221 - HOIST
      ?auto_49223 - PLACE
      ?auto_49222 - TRUCK
      ?auto_49224 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49221 ?auto_49223 ) ( SURFACE-AT ?auto_49220 ?auto_49223 ) ( CLEAR ?auto_49220 ) ( IS-CRATE ?auto_49219 ) ( not ( = ?auto_49219 ?auto_49220 ) ) ( AVAILABLE ?auto_49221 ) ( IN ?auto_49219 ?auto_49222 ) ( TRUCK-AT ?auto_49222 ?auto_49224 ) ( not ( = ?auto_49224 ?auto_49223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49222 ?auto_49224 ?auto_49223 )
      ( MAKE-ON ?auto_49219 ?auto_49220 )
      ( MAKE-ON-VERIFY ?auto_49219 ?auto_49220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49225 - SURFACE
      ?auto_49226 - SURFACE
    )
    :vars
    (
      ?auto_49227 - HOIST
      ?auto_49230 - PLACE
      ?auto_49228 - TRUCK
      ?auto_49229 - PLACE
      ?auto_49231 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49227 ?auto_49230 ) ( SURFACE-AT ?auto_49226 ?auto_49230 ) ( CLEAR ?auto_49226 ) ( IS-CRATE ?auto_49225 ) ( not ( = ?auto_49225 ?auto_49226 ) ) ( AVAILABLE ?auto_49227 ) ( TRUCK-AT ?auto_49228 ?auto_49229 ) ( not ( = ?auto_49229 ?auto_49230 ) ) ( HOIST-AT ?auto_49231 ?auto_49229 ) ( LIFTING ?auto_49231 ?auto_49225 ) ( not ( = ?auto_49227 ?auto_49231 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49231 ?auto_49225 ?auto_49228 ?auto_49229 )
      ( MAKE-ON ?auto_49225 ?auto_49226 )
      ( MAKE-ON-VERIFY ?auto_49225 ?auto_49226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49232 - SURFACE
      ?auto_49233 - SURFACE
    )
    :vars
    (
      ?auto_49234 - HOIST
      ?auto_49238 - PLACE
      ?auto_49236 - TRUCK
      ?auto_49235 - PLACE
      ?auto_49237 - HOIST
      ?auto_49239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49234 ?auto_49238 ) ( SURFACE-AT ?auto_49233 ?auto_49238 ) ( CLEAR ?auto_49233 ) ( IS-CRATE ?auto_49232 ) ( not ( = ?auto_49232 ?auto_49233 ) ) ( AVAILABLE ?auto_49234 ) ( TRUCK-AT ?auto_49236 ?auto_49235 ) ( not ( = ?auto_49235 ?auto_49238 ) ) ( HOIST-AT ?auto_49237 ?auto_49235 ) ( not ( = ?auto_49234 ?auto_49237 ) ) ( AVAILABLE ?auto_49237 ) ( SURFACE-AT ?auto_49232 ?auto_49235 ) ( ON ?auto_49232 ?auto_49239 ) ( CLEAR ?auto_49232 ) ( not ( = ?auto_49232 ?auto_49239 ) ) ( not ( = ?auto_49233 ?auto_49239 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49237 ?auto_49232 ?auto_49239 ?auto_49235 )
      ( MAKE-ON ?auto_49232 ?auto_49233 )
      ( MAKE-ON-VERIFY ?auto_49232 ?auto_49233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49240 - SURFACE
      ?auto_49241 - SURFACE
    )
    :vars
    (
      ?auto_49243 - HOIST
      ?auto_49246 - PLACE
      ?auto_49247 - PLACE
      ?auto_49242 - HOIST
      ?auto_49244 - SURFACE
      ?auto_49245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49243 ?auto_49246 ) ( SURFACE-AT ?auto_49241 ?auto_49246 ) ( CLEAR ?auto_49241 ) ( IS-CRATE ?auto_49240 ) ( not ( = ?auto_49240 ?auto_49241 ) ) ( AVAILABLE ?auto_49243 ) ( not ( = ?auto_49247 ?auto_49246 ) ) ( HOIST-AT ?auto_49242 ?auto_49247 ) ( not ( = ?auto_49243 ?auto_49242 ) ) ( AVAILABLE ?auto_49242 ) ( SURFACE-AT ?auto_49240 ?auto_49247 ) ( ON ?auto_49240 ?auto_49244 ) ( CLEAR ?auto_49240 ) ( not ( = ?auto_49240 ?auto_49244 ) ) ( not ( = ?auto_49241 ?auto_49244 ) ) ( TRUCK-AT ?auto_49245 ?auto_49246 ) )
    :subtasks
    ( ( !DRIVE ?auto_49245 ?auto_49246 ?auto_49247 )
      ( MAKE-ON ?auto_49240 ?auto_49241 )
      ( MAKE-ON-VERIFY ?auto_49240 ?auto_49241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49248 - SURFACE
      ?auto_49249 - SURFACE
    )
    :vars
    (
      ?auto_49254 - HOIST
      ?auto_49252 - PLACE
      ?auto_49253 - PLACE
      ?auto_49255 - HOIST
      ?auto_49250 - SURFACE
      ?auto_49251 - TRUCK
      ?auto_49256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49254 ?auto_49252 ) ( IS-CRATE ?auto_49248 ) ( not ( = ?auto_49248 ?auto_49249 ) ) ( not ( = ?auto_49253 ?auto_49252 ) ) ( HOIST-AT ?auto_49255 ?auto_49253 ) ( not ( = ?auto_49254 ?auto_49255 ) ) ( AVAILABLE ?auto_49255 ) ( SURFACE-AT ?auto_49248 ?auto_49253 ) ( ON ?auto_49248 ?auto_49250 ) ( CLEAR ?auto_49248 ) ( not ( = ?auto_49248 ?auto_49250 ) ) ( not ( = ?auto_49249 ?auto_49250 ) ) ( TRUCK-AT ?auto_49251 ?auto_49252 ) ( SURFACE-AT ?auto_49256 ?auto_49252 ) ( CLEAR ?auto_49256 ) ( LIFTING ?auto_49254 ?auto_49249 ) ( IS-CRATE ?auto_49249 ) ( not ( = ?auto_49248 ?auto_49256 ) ) ( not ( = ?auto_49249 ?auto_49256 ) ) ( not ( = ?auto_49250 ?auto_49256 ) ) )
    :subtasks
    ( ( !DROP ?auto_49254 ?auto_49249 ?auto_49256 ?auto_49252 )
      ( MAKE-ON ?auto_49248 ?auto_49249 )
      ( MAKE-ON-VERIFY ?auto_49248 ?auto_49249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49257 - SURFACE
      ?auto_49258 - SURFACE
    )
    :vars
    (
      ?auto_49262 - HOIST
      ?auto_49259 - PLACE
      ?auto_49263 - PLACE
      ?auto_49261 - HOIST
      ?auto_49264 - SURFACE
      ?auto_49260 - TRUCK
      ?auto_49265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49262 ?auto_49259 ) ( IS-CRATE ?auto_49257 ) ( not ( = ?auto_49257 ?auto_49258 ) ) ( not ( = ?auto_49263 ?auto_49259 ) ) ( HOIST-AT ?auto_49261 ?auto_49263 ) ( not ( = ?auto_49262 ?auto_49261 ) ) ( AVAILABLE ?auto_49261 ) ( SURFACE-AT ?auto_49257 ?auto_49263 ) ( ON ?auto_49257 ?auto_49264 ) ( CLEAR ?auto_49257 ) ( not ( = ?auto_49257 ?auto_49264 ) ) ( not ( = ?auto_49258 ?auto_49264 ) ) ( TRUCK-AT ?auto_49260 ?auto_49259 ) ( SURFACE-AT ?auto_49265 ?auto_49259 ) ( CLEAR ?auto_49265 ) ( IS-CRATE ?auto_49258 ) ( not ( = ?auto_49257 ?auto_49265 ) ) ( not ( = ?auto_49258 ?auto_49265 ) ) ( not ( = ?auto_49264 ?auto_49265 ) ) ( AVAILABLE ?auto_49262 ) ( IN ?auto_49258 ?auto_49260 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49262 ?auto_49258 ?auto_49260 ?auto_49259 )
      ( MAKE-ON ?auto_49257 ?auto_49258 )
      ( MAKE-ON-VERIFY ?auto_49257 ?auto_49258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49266 - SURFACE
      ?auto_49267 - SURFACE
    )
    :vars
    (
      ?auto_49268 - HOIST
      ?auto_49271 - PLACE
      ?auto_49269 - PLACE
      ?auto_49270 - HOIST
      ?auto_49273 - SURFACE
      ?auto_49274 - SURFACE
      ?auto_49272 - TRUCK
      ?auto_49275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49268 ?auto_49271 ) ( IS-CRATE ?auto_49266 ) ( not ( = ?auto_49266 ?auto_49267 ) ) ( not ( = ?auto_49269 ?auto_49271 ) ) ( HOIST-AT ?auto_49270 ?auto_49269 ) ( not ( = ?auto_49268 ?auto_49270 ) ) ( AVAILABLE ?auto_49270 ) ( SURFACE-AT ?auto_49266 ?auto_49269 ) ( ON ?auto_49266 ?auto_49273 ) ( CLEAR ?auto_49266 ) ( not ( = ?auto_49266 ?auto_49273 ) ) ( not ( = ?auto_49267 ?auto_49273 ) ) ( SURFACE-AT ?auto_49274 ?auto_49271 ) ( CLEAR ?auto_49274 ) ( IS-CRATE ?auto_49267 ) ( not ( = ?auto_49266 ?auto_49274 ) ) ( not ( = ?auto_49267 ?auto_49274 ) ) ( not ( = ?auto_49273 ?auto_49274 ) ) ( AVAILABLE ?auto_49268 ) ( IN ?auto_49267 ?auto_49272 ) ( TRUCK-AT ?auto_49272 ?auto_49275 ) ( not ( = ?auto_49275 ?auto_49271 ) ) ( not ( = ?auto_49269 ?auto_49275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49272 ?auto_49275 ?auto_49271 )
      ( MAKE-ON ?auto_49266 ?auto_49267 )
      ( MAKE-ON-VERIFY ?auto_49266 ?auto_49267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49276 - SURFACE
      ?auto_49277 - SURFACE
    )
    :vars
    (
      ?auto_49285 - HOIST
      ?auto_49281 - PLACE
      ?auto_49279 - PLACE
      ?auto_49280 - HOIST
      ?auto_49283 - SURFACE
      ?auto_49278 - SURFACE
      ?auto_49282 - TRUCK
      ?auto_49284 - PLACE
      ?auto_49286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49285 ?auto_49281 ) ( IS-CRATE ?auto_49276 ) ( not ( = ?auto_49276 ?auto_49277 ) ) ( not ( = ?auto_49279 ?auto_49281 ) ) ( HOIST-AT ?auto_49280 ?auto_49279 ) ( not ( = ?auto_49285 ?auto_49280 ) ) ( AVAILABLE ?auto_49280 ) ( SURFACE-AT ?auto_49276 ?auto_49279 ) ( ON ?auto_49276 ?auto_49283 ) ( CLEAR ?auto_49276 ) ( not ( = ?auto_49276 ?auto_49283 ) ) ( not ( = ?auto_49277 ?auto_49283 ) ) ( SURFACE-AT ?auto_49278 ?auto_49281 ) ( CLEAR ?auto_49278 ) ( IS-CRATE ?auto_49277 ) ( not ( = ?auto_49276 ?auto_49278 ) ) ( not ( = ?auto_49277 ?auto_49278 ) ) ( not ( = ?auto_49283 ?auto_49278 ) ) ( AVAILABLE ?auto_49285 ) ( TRUCK-AT ?auto_49282 ?auto_49284 ) ( not ( = ?auto_49284 ?auto_49281 ) ) ( not ( = ?auto_49279 ?auto_49284 ) ) ( HOIST-AT ?auto_49286 ?auto_49284 ) ( LIFTING ?auto_49286 ?auto_49277 ) ( not ( = ?auto_49285 ?auto_49286 ) ) ( not ( = ?auto_49280 ?auto_49286 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49286 ?auto_49277 ?auto_49282 ?auto_49284 )
      ( MAKE-ON ?auto_49276 ?auto_49277 )
      ( MAKE-ON-VERIFY ?auto_49276 ?auto_49277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49287 - SURFACE
      ?auto_49288 - SURFACE
    )
    :vars
    (
      ?auto_49291 - HOIST
      ?auto_49290 - PLACE
      ?auto_49295 - PLACE
      ?auto_49292 - HOIST
      ?auto_49293 - SURFACE
      ?auto_49297 - SURFACE
      ?auto_49294 - TRUCK
      ?auto_49289 - PLACE
      ?auto_49296 - HOIST
      ?auto_49298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49291 ?auto_49290 ) ( IS-CRATE ?auto_49287 ) ( not ( = ?auto_49287 ?auto_49288 ) ) ( not ( = ?auto_49295 ?auto_49290 ) ) ( HOIST-AT ?auto_49292 ?auto_49295 ) ( not ( = ?auto_49291 ?auto_49292 ) ) ( AVAILABLE ?auto_49292 ) ( SURFACE-AT ?auto_49287 ?auto_49295 ) ( ON ?auto_49287 ?auto_49293 ) ( CLEAR ?auto_49287 ) ( not ( = ?auto_49287 ?auto_49293 ) ) ( not ( = ?auto_49288 ?auto_49293 ) ) ( SURFACE-AT ?auto_49297 ?auto_49290 ) ( CLEAR ?auto_49297 ) ( IS-CRATE ?auto_49288 ) ( not ( = ?auto_49287 ?auto_49297 ) ) ( not ( = ?auto_49288 ?auto_49297 ) ) ( not ( = ?auto_49293 ?auto_49297 ) ) ( AVAILABLE ?auto_49291 ) ( TRUCK-AT ?auto_49294 ?auto_49289 ) ( not ( = ?auto_49289 ?auto_49290 ) ) ( not ( = ?auto_49295 ?auto_49289 ) ) ( HOIST-AT ?auto_49296 ?auto_49289 ) ( not ( = ?auto_49291 ?auto_49296 ) ) ( not ( = ?auto_49292 ?auto_49296 ) ) ( AVAILABLE ?auto_49296 ) ( SURFACE-AT ?auto_49288 ?auto_49289 ) ( ON ?auto_49288 ?auto_49298 ) ( CLEAR ?auto_49288 ) ( not ( = ?auto_49287 ?auto_49298 ) ) ( not ( = ?auto_49288 ?auto_49298 ) ) ( not ( = ?auto_49293 ?auto_49298 ) ) ( not ( = ?auto_49297 ?auto_49298 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49296 ?auto_49288 ?auto_49298 ?auto_49289 )
      ( MAKE-ON ?auto_49287 ?auto_49288 )
      ( MAKE-ON-VERIFY ?auto_49287 ?auto_49288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49299 - SURFACE
      ?auto_49300 - SURFACE
    )
    :vars
    (
      ?auto_49308 - HOIST
      ?auto_49306 - PLACE
      ?auto_49309 - PLACE
      ?auto_49303 - HOIST
      ?auto_49301 - SURFACE
      ?auto_49305 - SURFACE
      ?auto_49304 - PLACE
      ?auto_49307 - HOIST
      ?auto_49310 - SURFACE
      ?auto_49302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49308 ?auto_49306 ) ( IS-CRATE ?auto_49299 ) ( not ( = ?auto_49299 ?auto_49300 ) ) ( not ( = ?auto_49309 ?auto_49306 ) ) ( HOIST-AT ?auto_49303 ?auto_49309 ) ( not ( = ?auto_49308 ?auto_49303 ) ) ( AVAILABLE ?auto_49303 ) ( SURFACE-AT ?auto_49299 ?auto_49309 ) ( ON ?auto_49299 ?auto_49301 ) ( CLEAR ?auto_49299 ) ( not ( = ?auto_49299 ?auto_49301 ) ) ( not ( = ?auto_49300 ?auto_49301 ) ) ( SURFACE-AT ?auto_49305 ?auto_49306 ) ( CLEAR ?auto_49305 ) ( IS-CRATE ?auto_49300 ) ( not ( = ?auto_49299 ?auto_49305 ) ) ( not ( = ?auto_49300 ?auto_49305 ) ) ( not ( = ?auto_49301 ?auto_49305 ) ) ( AVAILABLE ?auto_49308 ) ( not ( = ?auto_49304 ?auto_49306 ) ) ( not ( = ?auto_49309 ?auto_49304 ) ) ( HOIST-AT ?auto_49307 ?auto_49304 ) ( not ( = ?auto_49308 ?auto_49307 ) ) ( not ( = ?auto_49303 ?auto_49307 ) ) ( AVAILABLE ?auto_49307 ) ( SURFACE-AT ?auto_49300 ?auto_49304 ) ( ON ?auto_49300 ?auto_49310 ) ( CLEAR ?auto_49300 ) ( not ( = ?auto_49299 ?auto_49310 ) ) ( not ( = ?auto_49300 ?auto_49310 ) ) ( not ( = ?auto_49301 ?auto_49310 ) ) ( not ( = ?auto_49305 ?auto_49310 ) ) ( TRUCK-AT ?auto_49302 ?auto_49306 ) )
    :subtasks
    ( ( !DRIVE ?auto_49302 ?auto_49306 ?auto_49304 )
      ( MAKE-ON ?auto_49299 ?auto_49300 )
      ( MAKE-ON-VERIFY ?auto_49299 ?auto_49300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49311 - SURFACE
      ?auto_49312 - SURFACE
    )
    :vars
    (
      ?auto_49317 - HOIST
      ?auto_49314 - PLACE
      ?auto_49322 - PLACE
      ?auto_49318 - HOIST
      ?auto_49315 - SURFACE
      ?auto_49313 - SURFACE
      ?auto_49316 - PLACE
      ?auto_49321 - HOIST
      ?auto_49320 - SURFACE
      ?auto_49319 - TRUCK
      ?auto_49323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49317 ?auto_49314 ) ( IS-CRATE ?auto_49311 ) ( not ( = ?auto_49311 ?auto_49312 ) ) ( not ( = ?auto_49322 ?auto_49314 ) ) ( HOIST-AT ?auto_49318 ?auto_49322 ) ( not ( = ?auto_49317 ?auto_49318 ) ) ( AVAILABLE ?auto_49318 ) ( SURFACE-AT ?auto_49311 ?auto_49322 ) ( ON ?auto_49311 ?auto_49315 ) ( CLEAR ?auto_49311 ) ( not ( = ?auto_49311 ?auto_49315 ) ) ( not ( = ?auto_49312 ?auto_49315 ) ) ( IS-CRATE ?auto_49312 ) ( not ( = ?auto_49311 ?auto_49313 ) ) ( not ( = ?auto_49312 ?auto_49313 ) ) ( not ( = ?auto_49315 ?auto_49313 ) ) ( not ( = ?auto_49316 ?auto_49314 ) ) ( not ( = ?auto_49322 ?auto_49316 ) ) ( HOIST-AT ?auto_49321 ?auto_49316 ) ( not ( = ?auto_49317 ?auto_49321 ) ) ( not ( = ?auto_49318 ?auto_49321 ) ) ( AVAILABLE ?auto_49321 ) ( SURFACE-AT ?auto_49312 ?auto_49316 ) ( ON ?auto_49312 ?auto_49320 ) ( CLEAR ?auto_49312 ) ( not ( = ?auto_49311 ?auto_49320 ) ) ( not ( = ?auto_49312 ?auto_49320 ) ) ( not ( = ?auto_49315 ?auto_49320 ) ) ( not ( = ?auto_49313 ?auto_49320 ) ) ( TRUCK-AT ?auto_49319 ?auto_49314 ) ( SURFACE-AT ?auto_49323 ?auto_49314 ) ( CLEAR ?auto_49323 ) ( LIFTING ?auto_49317 ?auto_49313 ) ( IS-CRATE ?auto_49313 ) ( not ( = ?auto_49311 ?auto_49323 ) ) ( not ( = ?auto_49312 ?auto_49323 ) ) ( not ( = ?auto_49315 ?auto_49323 ) ) ( not ( = ?auto_49313 ?auto_49323 ) ) ( not ( = ?auto_49320 ?auto_49323 ) ) )
    :subtasks
    ( ( !DROP ?auto_49317 ?auto_49313 ?auto_49323 ?auto_49314 )
      ( MAKE-ON ?auto_49311 ?auto_49312 )
      ( MAKE-ON-VERIFY ?auto_49311 ?auto_49312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49324 - SURFACE
      ?auto_49325 - SURFACE
    )
    :vars
    (
      ?auto_49333 - HOIST
      ?auto_49331 - PLACE
      ?auto_49328 - PLACE
      ?auto_49330 - HOIST
      ?auto_49326 - SURFACE
      ?auto_49335 - SURFACE
      ?auto_49332 - PLACE
      ?auto_49334 - HOIST
      ?auto_49327 - SURFACE
      ?auto_49329 - TRUCK
      ?auto_49336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49333 ?auto_49331 ) ( IS-CRATE ?auto_49324 ) ( not ( = ?auto_49324 ?auto_49325 ) ) ( not ( = ?auto_49328 ?auto_49331 ) ) ( HOIST-AT ?auto_49330 ?auto_49328 ) ( not ( = ?auto_49333 ?auto_49330 ) ) ( AVAILABLE ?auto_49330 ) ( SURFACE-AT ?auto_49324 ?auto_49328 ) ( ON ?auto_49324 ?auto_49326 ) ( CLEAR ?auto_49324 ) ( not ( = ?auto_49324 ?auto_49326 ) ) ( not ( = ?auto_49325 ?auto_49326 ) ) ( IS-CRATE ?auto_49325 ) ( not ( = ?auto_49324 ?auto_49335 ) ) ( not ( = ?auto_49325 ?auto_49335 ) ) ( not ( = ?auto_49326 ?auto_49335 ) ) ( not ( = ?auto_49332 ?auto_49331 ) ) ( not ( = ?auto_49328 ?auto_49332 ) ) ( HOIST-AT ?auto_49334 ?auto_49332 ) ( not ( = ?auto_49333 ?auto_49334 ) ) ( not ( = ?auto_49330 ?auto_49334 ) ) ( AVAILABLE ?auto_49334 ) ( SURFACE-AT ?auto_49325 ?auto_49332 ) ( ON ?auto_49325 ?auto_49327 ) ( CLEAR ?auto_49325 ) ( not ( = ?auto_49324 ?auto_49327 ) ) ( not ( = ?auto_49325 ?auto_49327 ) ) ( not ( = ?auto_49326 ?auto_49327 ) ) ( not ( = ?auto_49335 ?auto_49327 ) ) ( TRUCK-AT ?auto_49329 ?auto_49331 ) ( SURFACE-AT ?auto_49336 ?auto_49331 ) ( CLEAR ?auto_49336 ) ( IS-CRATE ?auto_49335 ) ( not ( = ?auto_49324 ?auto_49336 ) ) ( not ( = ?auto_49325 ?auto_49336 ) ) ( not ( = ?auto_49326 ?auto_49336 ) ) ( not ( = ?auto_49335 ?auto_49336 ) ) ( not ( = ?auto_49327 ?auto_49336 ) ) ( AVAILABLE ?auto_49333 ) ( IN ?auto_49335 ?auto_49329 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49333 ?auto_49335 ?auto_49329 ?auto_49331 )
      ( MAKE-ON ?auto_49324 ?auto_49325 )
      ( MAKE-ON-VERIFY ?auto_49324 ?auto_49325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49337 - SURFACE
      ?auto_49338 - SURFACE
    )
    :vars
    (
      ?auto_49348 - HOIST
      ?auto_49340 - PLACE
      ?auto_49339 - PLACE
      ?auto_49343 - HOIST
      ?auto_49349 - SURFACE
      ?auto_49347 - SURFACE
      ?auto_49346 - PLACE
      ?auto_49345 - HOIST
      ?auto_49342 - SURFACE
      ?auto_49344 - SURFACE
      ?auto_49341 - TRUCK
      ?auto_49350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49348 ?auto_49340 ) ( IS-CRATE ?auto_49337 ) ( not ( = ?auto_49337 ?auto_49338 ) ) ( not ( = ?auto_49339 ?auto_49340 ) ) ( HOIST-AT ?auto_49343 ?auto_49339 ) ( not ( = ?auto_49348 ?auto_49343 ) ) ( AVAILABLE ?auto_49343 ) ( SURFACE-AT ?auto_49337 ?auto_49339 ) ( ON ?auto_49337 ?auto_49349 ) ( CLEAR ?auto_49337 ) ( not ( = ?auto_49337 ?auto_49349 ) ) ( not ( = ?auto_49338 ?auto_49349 ) ) ( IS-CRATE ?auto_49338 ) ( not ( = ?auto_49337 ?auto_49347 ) ) ( not ( = ?auto_49338 ?auto_49347 ) ) ( not ( = ?auto_49349 ?auto_49347 ) ) ( not ( = ?auto_49346 ?auto_49340 ) ) ( not ( = ?auto_49339 ?auto_49346 ) ) ( HOIST-AT ?auto_49345 ?auto_49346 ) ( not ( = ?auto_49348 ?auto_49345 ) ) ( not ( = ?auto_49343 ?auto_49345 ) ) ( AVAILABLE ?auto_49345 ) ( SURFACE-AT ?auto_49338 ?auto_49346 ) ( ON ?auto_49338 ?auto_49342 ) ( CLEAR ?auto_49338 ) ( not ( = ?auto_49337 ?auto_49342 ) ) ( not ( = ?auto_49338 ?auto_49342 ) ) ( not ( = ?auto_49349 ?auto_49342 ) ) ( not ( = ?auto_49347 ?auto_49342 ) ) ( SURFACE-AT ?auto_49344 ?auto_49340 ) ( CLEAR ?auto_49344 ) ( IS-CRATE ?auto_49347 ) ( not ( = ?auto_49337 ?auto_49344 ) ) ( not ( = ?auto_49338 ?auto_49344 ) ) ( not ( = ?auto_49349 ?auto_49344 ) ) ( not ( = ?auto_49347 ?auto_49344 ) ) ( not ( = ?auto_49342 ?auto_49344 ) ) ( AVAILABLE ?auto_49348 ) ( IN ?auto_49347 ?auto_49341 ) ( TRUCK-AT ?auto_49341 ?auto_49350 ) ( not ( = ?auto_49350 ?auto_49340 ) ) ( not ( = ?auto_49339 ?auto_49350 ) ) ( not ( = ?auto_49346 ?auto_49350 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49341 ?auto_49350 ?auto_49340 )
      ( MAKE-ON ?auto_49337 ?auto_49338 )
      ( MAKE-ON-VERIFY ?auto_49337 ?auto_49338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49351 - SURFACE
      ?auto_49352 - SURFACE
    )
    :vars
    (
      ?auto_49361 - HOIST
      ?auto_49353 - PLACE
      ?auto_49354 - PLACE
      ?auto_49358 - HOIST
      ?auto_49356 - SURFACE
      ?auto_49357 - SURFACE
      ?auto_49360 - PLACE
      ?auto_49363 - HOIST
      ?auto_49355 - SURFACE
      ?auto_49359 - SURFACE
      ?auto_49362 - TRUCK
      ?auto_49364 - PLACE
      ?auto_49365 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49361 ?auto_49353 ) ( IS-CRATE ?auto_49351 ) ( not ( = ?auto_49351 ?auto_49352 ) ) ( not ( = ?auto_49354 ?auto_49353 ) ) ( HOIST-AT ?auto_49358 ?auto_49354 ) ( not ( = ?auto_49361 ?auto_49358 ) ) ( AVAILABLE ?auto_49358 ) ( SURFACE-AT ?auto_49351 ?auto_49354 ) ( ON ?auto_49351 ?auto_49356 ) ( CLEAR ?auto_49351 ) ( not ( = ?auto_49351 ?auto_49356 ) ) ( not ( = ?auto_49352 ?auto_49356 ) ) ( IS-CRATE ?auto_49352 ) ( not ( = ?auto_49351 ?auto_49357 ) ) ( not ( = ?auto_49352 ?auto_49357 ) ) ( not ( = ?auto_49356 ?auto_49357 ) ) ( not ( = ?auto_49360 ?auto_49353 ) ) ( not ( = ?auto_49354 ?auto_49360 ) ) ( HOIST-AT ?auto_49363 ?auto_49360 ) ( not ( = ?auto_49361 ?auto_49363 ) ) ( not ( = ?auto_49358 ?auto_49363 ) ) ( AVAILABLE ?auto_49363 ) ( SURFACE-AT ?auto_49352 ?auto_49360 ) ( ON ?auto_49352 ?auto_49355 ) ( CLEAR ?auto_49352 ) ( not ( = ?auto_49351 ?auto_49355 ) ) ( not ( = ?auto_49352 ?auto_49355 ) ) ( not ( = ?auto_49356 ?auto_49355 ) ) ( not ( = ?auto_49357 ?auto_49355 ) ) ( SURFACE-AT ?auto_49359 ?auto_49353 ) ( CLEAR ?auto_49359 ) ( IS-CRATE ?auto_49357 ) ( not ( = ?auto_49351 ?auto_49359 ) ) ( not ( = ?auto_49352 ?auto_49359 ) ) ( not ( = ?auto_49356 ?auto_49359 ) ) ( not ( = ?auto_49357 ?auto_49359 ) ) ( not ( = ?auto_49355 ?auto_49359 ) ) ( AVAILABLE ?auto_49361 ) ( TRUCK-AT ?auto_49362 ?auto_49364 ) ( not ( = ?auto_49364 ?auto_49353 ) ) ( not ( = ?auto_49354 ?auto_49364 ) ) ( not ( = ?auto_49360 ?auto_49364 ) ) ( HOIST-AT ?auto_49365 ?auto_49364 ) ( LIFTING ?auto_49365 ?auto_49357 ) ( not ( = ?auto_49361 ?auto_49365 ) ) ( not ( = ?auto_49358 ?auto_49365 ) ) ( not ( = ?auto_49363 ?auto_49365 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49365 ?auto_49357 ?auto_49362 ?auto_49364 )
      ( MAKE-ON ?auto_49351 ?auto_49352 )
      ( MAKE-ON-VERIFY ?auto_49351 ?auto_49352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49366 - SURFACE
      ?auto_49367 - SURFACE
    )
    :vars
    (
      ?auto_49379 - HOIST
      ?auto_49369 - PLACE
      ?auto_49374 - PLACE
      ?auto_49380 - HOIST
      ?auto_49373 - SURFACE
      ?auto_49371 - SURFACE
      ?auto_49370 - PLACE
      ?auto_49372 - HOIST
      ?auto_49376 - SURFACE
      ?auto_49378 - SURFACE
      ?auto_49375 - TRUCK
      ?auto_49368 - PLACE
      ?auto_49377 - HOIST
      ?auto_49381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49379 ?auto_49369 ) ( IS-CRATE ?auto_49366 ) ( not ( = ?auto_49366 ?auto_49367 ) ) ( not ( = ?auto_49374 ?auto_49369 ) ) ( HOIST-AT ?auto_49380 ?auto_49374 ) ( not ( = ?auto_49379 ?auto_49380 ) ) ( AVAILABLE ?auto_49380 ) ( SURFACE-AT ?auto_49366 ?auto_49374 ) ( ON ?auto_49366 ?auto_49373 ) ( CLEAR ?auto_49366 ) ( not ( = ?auto_49366 ?auto_49373 ) ) ( not ( = ?auto_49367 ?auto_49373 ) ) ( IS-CRATE ?auto_49367 ) ( not ( = ?auto_49366 ?auto_49371 ) ) ( not ( = ?auto_49367 ?auto_49371 ) ) ( not ( = ?auto_49373 ?auto_49371 ) ) ( not ( = ?auto_49370 ?auto_49369 ) ) ( not ( = ?auto_49374 ?auto_49370 ) ) ( HOIST-AT ?auto_49372 ?auto_49370 ) ( not ( = ?auto_49379 ?auto_49372 ) ) ( not ( = ?auto_49380 ?auto_49372 ) ) ( AVAILABLE ?auto_49372 ) ( SURFACE-AT ?auto_49367 ?auto_49370 ) ( ON ?auto_49367 ?auto_49376 ) ( CLEAR ?auto_49367 ) ( not ( = ?auto_49366 ?auto_49376 ) ) ( not ( = ?auto_49367 ?auto_49376 ) ) ( not ( = ?auto_49373 ?auto_49376 ) ) ( not ( = ?auto_49371 ?auto_49376 ) ) ( SURFACE-AT ?auto_49378 ?auto_49369 ) ( CLEAR ?auto_49378 ) ( IS-CRATE ?auto_49371 ) ( not ( = ?auto_49366 ?auto_49378 ) ) ( not ( = ?auto_49367 ?auto_49378 ) ) ( not ( = ?auto_49373 ?auto_49378 ) ) ( not ( = ?auto_49371 ?auto_49378 ) ) ( not ( = ?auto_49376 ?auto_49378 ) ) ( AVAILABLE ?auto_49379 ) ( TRUCK-AT ?auto_49375 ?auto_49368 ) ( not ( = ?auto_49368 ?auto_49369 ) ) ( not ( = ?auto_49374 ?auto_49368 ) ) ( not ( = ?auto_49370 ?auto_49368 ) ) ( HOIST-AT ?auto_49377 ?auto_49368 ) ( not ( = ?auto_49379 ?auto_49377 ) ) ( not ( = ?auto_49380 ?auto_49377 ) ) ( not ( = ?auto_49372 ?auto_49377 ) ) ( AVAILABLE ?auto_49377 ) ( SURFACE-AT ?auto_49371 ?auto_49368 ) ( ON ?auto_49371 ?auto_49381 ) ( CLEAR ?auto_49371 ) ( not ( = ?auto_49366 ?auto_49381 ) ) ( not ( = ?auto_49367 ?auto_49381 ) ) ( not ( = ?auto_49373 ?auto_49381 ) ) ( not ( = ?auto_49371 ?auto_49381 ) ) ( not ( = ?auto_49376 ?auto_49381 ) ) ( not ( = ?auto_49378 ?auto_49381 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49377 ?auto_49371 ?auto_49381 ?auto_49368 )
      ( MAKE-ON ?auto_49366 ?auto_49367 )
      ( MAKE-ON-VERIFY ?auto_49366 ?auto_49367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49382 - SURFACE
      ?auto_49383 - SURFACE
    )
    :vars
    (
      ?auto_49392 - HOIST
      ?auto_49390 - PLACE
      ?auto_49386 - PLACE
      ?auto_49387 - HOIST
      ?auto_49391 - SURFACE
      ?auto_49394 - SURFACE
      ?auto_49389 - PLACE
      ?auto_49384 - HOIST
      ?auto_49395 - SURFACE
      ?auto_49393 - SURFACE
      ?auto_49396 - PLACE
      ?auto_49388 - HOIST
      ?auto_49397 - SURFACE
      ?auto_49385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49392 ?auto_49390 ) ( IS-CRATE ?auto_49382 ) ( not ( = ?auto_49382 ?auto_49383 ) ) ( not ( = ?auto_49386 ?auto_49390 ) ) ( HOIST-AT ?auto_49387 ?auto_49386 ) ( not ( = ?auto_49392 ?auto_49387 ) ) ( AVAILABLE ?auto_49387 ) ( SURFACE-AT ?auto_49382 ?auto_49386 ) ( ON ?auto_49382 ?auto_49391 ) ( CLEAR ?auto_49382 ) ( not ( = ?auto_49382 ?auto_49391 ) ) ( not ( = ?auto_49383 ?auto_49391 ) ) ( IS-CRATE ?auto_49383 ) ( not ( = ?auto_49382 ?auto_49394 ) ) ( not ( = ?auto_49383 ?auto_49394 ) ) ( not ( = ?auto_49391 ?auto_49394 ) ) ( not ( = ?auto_49389 ?auto_49390 ) ) ( not ( = ?auto_49386 ?auto_49389 ) ) ( HOIST-AT ?auto_49384 ?auto_49389 ) ( not ( = ?auto_49392 ?auto_49384 ) ) ( not ( = ?auto_49387 ?auto_49384 ) ) ( AVAILABLE ?auto_49384 ) ( SURFACE-AT ?auto_49383 ?auto_49389 ) ( ON ?auto_49383 ?auto_49395 ) ( CLEAR ?auto_49383 ) ( not ( = ?auto_49382 ?auto_49395 ) ) ( not ( = ?auto_49383 ?auto_49395 ) ) ( not ( = ?auto_49391 ?auto_49395 ) ) ( not ( = ?auto_49394 ?auto_49395 ) ) ( SURFACE-AT ?auto_49393 ?auto_49390 ) ( CLEAR ?auto_49393 ) ( IS-CRATE ?auto_49394 ) ( not ( = ?auto_49382 ?auto_49393 ) ) ( not ( = ?auto_49383 ?auto_49393 ) ) ( not ( = ?auto_49391 ?auto_49393 ) ) ( not ( = ?auto_49394 ?auto_49393 ) ) ( not ( = ?auto_49395 ?auto_49393 ) ) ( AVAILABLE ?auto_49392 ) ( not ( = ?auto_49396 ?auto_49390 ) ) ( not ( = ?auto_49386 ?auto_49396 ) ) ( not ( = ?auto_49389 ?auto_49396 ) ) ( HOIST-AT ?auto_49388 ?auto_49396 ) ( not ( = ?auto_49392 ?auto_49388 ) ) ( not ( = ?auto_49387 ?auto_49388 ) ) ( not ( = ?auto_49384 ?auto_49388 ) ) ( AVAILABLE ?auto_49388 ) ( SURFACE-AT ?auto_49394 ?auto_49396 ) ( ON ?auto_49394 ?auto_49397 ) ( CLEAR ?auto_49394 ) ( not ( = ?auto_49382 ?auto_49397 ) ) ( not ( = ?auto_49383 ?auto_49397 ) ) ( not ( = ?auto_49391 ?auto_49397 ) ) ( not ( = ?auto_49394 ?auto_49397 ) ) ( not ( = ?auto_49395 ?auto_49397 ) ) ( not ( = ?auto_49393 ?auto_49397 ) ) ( TRUCK-AT ?auto_49385 ?auto_49390 ) )
    :subtasks
    ( ( !DRIVE ?auto_49385 ?auto_49390 ?auto_49396 )
      ( MAKE-ON ?auto_49382 ?auto_49383 )
      ( MAKE-ON-VERIFY ?auto_49382 ?auto_49383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49398 - SURFACE
      ?auto_49399 - SURFACE
    )
    :vars
    (
      ?auto_49412 - HOIST
      ?auto_49406 - PLACE
      ?auto_49407 - PLACE
      ?auto_49411 - HOIST
      ?auto_49401 - SURFACE
      ?auto_49402 - SURFACE
      ?auto_49400 - PLACE
      ?auto_49413 - HOIST
      ?auto_49409 - SURFACE
      ?auto_49403 - SURFACE
      ?auto_49405 - PLACE
      ?auto_49404 - HOIST
      ?auto_49410 - SURFACE
      ?auto_49408 - TRUCK
      ?auto_49414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49412 ?auto_49406 ) ( IS-CRATE ?auto_49398 ) ( not ( = ?auto_49398 ?auto_49399 ) ) ( not ( = ?auto_49407 ?auto_49406 ) ) ( HOIST-AT ?auto_49411 ?auto_49407 ) ( not ( = ?auto_49412 ?auto_49411 ) ) ( AVAILABLE ?auto_49411 ) ( SURFACE-AT ?auto_49398 ?auto_49407 ) ( ON ?auto_49398 ?auto_49401 ) ( CLEAR ?auto_49398 ) ( not ( = ?auto_49398 ?auto_49401 ) ) ( not ( = ?auto_49399 ?auto_49401 ) ) ( IS-CRATE ?auto_49399 ) ( not ( = ?auto_49398 ?auto_49402 ) ) ( not ( = ?auto_49399 ?auto_49402 ) ) ( not ( = ?auto_49401 ?auto_49402 ) ) ( not ( = ?auto_49400 ?auto_49406 ) ) ( not ( = ?auto_49407 ?auto_49400 ) ) ( HOIST-AT ?auto_49413 ?auto_49400 ) ( not ( = ?auto_49412 ?auto_49413 ) ) ( not ( = ?auto_49411 ?auto_49413 ) ) ( AVAILABLE ?auto_49413 ) ( SURFACE-AT ?auto_49399 ?auto_49400 ) ( ON ?auto_49399 ?auto_49409 ) ( CLEAR ?auto_49399 ) ( not ( = ?auto_49398 ?auto_49409 ) ) ( not ( = ?auto_49399 ?auto_49409 ) ) ( not ( = ?auto_49401 ?auto_49409 ) ) ( not ( = ?auto_49402 ?auto_49409 ) ) ( IS-CRATE ?auto_49402 ) ( not ( = ?auto_49398 ?auto_49403 ) ) ( not ( = ?auto_49399 ?auto_49403 ) ) ( not ( = ?auto_49401 ?auto_49403 ) ) ( not ( = ?auto_49402 ?auto_49403 ) ) ( not ( = ?auto_49409 ?auto_49403 ) ) ( not ( = ?auto_49405 ?auto_49406 ) ) ( not ( = ?auto_49407 ?auto_49405 ) ) ( not ( = ?auto_49400 ?auto_49405 ) ) ( HOIST-AT ?auto_49404 ?auto_49405 ) ( not ( = ?auto_49412 ?auto_49404 ) ) ( not ( = ?auto_49411 ?auto_49404 ) ) ( not ( = ?auto_49413 ?auto_49404 ) ) ( AVAILABLE ?auto_49404 ) ( SURFACE-AT ?auto_49402 ?auto_49405 ) ( ON ?auto_49402 ?auto_49410 ) ( CLEAR ?auto_49402 ) ( not ( = ?auto_49398 ?auto_49410 ) ) ( not ( = ?auto_49399 ?auto_49410 ) ) ( not ( = ?auto_49401 ?auto_49410 ) ) ( not ( = ?auto_49402 ?auto_49410 ) ) ( not ( = ?auto_49409 ?auto_49410 ) ) ( not ( = ?auto_49403 ?auto_49410 ) ) ( TRUCK-AT ?auto_49408 ?auto_49406 ) ( SURFACE-AT ?auto_49414 ?auto_49406 ) ( CLEAR ?auto_49414 ) ( LIFTING ?auto_49412 ?auto_49403 ) ( IS-CRATE ?auto_49403 ) ( not ( = ?auto_49398 ?auto_49414 ) ) ( not ( = ?auto_49399 ?auto_49414 ) ) ( not ( = ?auto_49401 ?auto_49414 ) ) ( not ( = ?auto_49402 ?auto_49414 ) ) ( not ( = ?auto_49409 ?auto_49414 ) ) ( not ( = ?auto_49403 ?auto_49414 ) ) ( not ( = ?auto_49410 ?auto_49414 ) ) )
    :subtasks
    ( ( !DROP ?auto_49412 ?auto_49403 ?auto_49414 ?auto_49406 )
      ( MAKE-ON ?auto_49398 ?auto_49399 )
      ( MAKE-ON-VERIFY ?auto_49398 ?auto_49399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49415 - SURFACE
      ?auto_49416 - SURFACE
    )
    :vars
    (
      ?auto_49417 - HOIST
      ?auto_49430 - PLACE
      ?auto_49425 - PLACE
      ?auto_49420 - HOIST
      ?auto_49428 - SURFACE
      ?auto_49421 - SURFACE
      ?auto_49422 - PLACE
      ?auto_49427 - HOIST
      ?auto_49423 - SURFACE
      ?auto_49429 - SURFACE
      ?auto_49426 - PLACE
      ?auto_49424 - HOIST
      ?auto_49418 - SURFACE
      ?auto_49419 - TRUCK
      ?auto_49431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49417 ?auto_49430 ) ( IS-CRATE ?auto_49415 ) ( not ( = ?auto_49415 ?auto_49416 ) ) ( not ( = ?auto_49425 ?auto_49430 ) ) ( HOIST-AT ?auto_49420 ?auto_49425 ) ( not ( = ?auto_49417 ?auto_49420 ) ) ( AVAILABLE ?auto_49420 ) ( SURFACE-AT ?auto_49415 ?auto_49425 ) ( ON ?auto_49415 ?auto_49428 ) ( CLEAR ?auto_49415 ) ( not ( = ?auto_49415 ?auto_49428 ) ) ( not ( = ?auto_49416 ?auto_49428 ) ) ( IS-CRATE ?auto_49416 ) ( not ( = ?auto_49415 ?auto_49421 ) ) ( not ( = ?auto_49416 ?auto_49421 ) ) ( not ( = ?auto_49428 ?auto_49421 ) ) ( not ( = ?auto_49422 ?auto_49430 ) ) ( not ( = ?auto_49425 ?auto_49422 ) ) ( HOIST-AT ?auto_49427 ?auto_49422 ) ( not ( = ?auto_49417 ?auto_49427 ) ) ( not ( = ?auto_49420 ?auto_49427 ) ) ( AVAILABLE ?auto_49427 ) ( SURFACE-AT ?auto_49416 ?auto_49422 ) ( ON ?auto_49416 ?auto_49423 ) ( CLEAR ?auto_49416 ) ( not ( = ?auto_49415 ?auto_49423 ) ) ( not ( = ?auto_49416 ?auto_49423 ) ) ( not ( = ?auto_49428 ?auto_49423 ) ) ( not ( = ?auto_49421 ?auto_49423 ) ) ( IS-CRATE ?auto_49421 ) ( not ( = ?auto_49415 ?auto_49429 ) ) ( not ( = ?auto_49416 ?auto_49429 ) ) ( not ( = ?auto_49428 ?auto_49429 ) ) ( not ( = ?auto_49421 ?auto_49429 ) ) ( not ( = ?auto_49423 ?auto_49429 ) ) ( not ( = ?auto_49426 ?auto_49430 ) ) ( not ( = ?auto_49425 ?auto_49426 ) ) ( not ( = ?auto_49422 ?auto_49426 ) ) ( HOIST-AT ?auto_49424 ?auto_49426 ) ( not ( = ?auto_49417 ?auto_49424 ) ) ( not ( = ?auto_49420 ?auto_49424 ) ) ( not ( = ?auto_49427 ?auto_49424 ) ) ( AVAILABLE ?auto_49424 ) ( SURFACE-AT ?auto_49421 ?auto_49426 ) ( ON ?auto_49421 ?auto_49418 ) ( CLEAR ?auto_49421 ) ( not ( = ?auto_49415 ?auto_49418 ) ) ( not ( = ?auto_49416 ?auto_49418 ) ) ( not ( = ?auto_49428 ?auto_49418 ) ) ( not ( = ?auto_49421 ?auto_49418 ) ) ( not ( = ?auto_49423 ?auto_49418 ) ) ( not ( = ?auto_49429 ?auto_49418 ) ) ( TRUCK-AT ?auto_49419 ?auto_49430 ) ( SURFACE-AT ?auto_49431 ?auto_49430 ) ( CLEAR ?auto_49431 ) ( IS-CRATE ?auto_49429 ) ( not ( = ?auto_49415 ?auto_49431 ) ) ( not ( = ?auto_49416 ?auto_49431 ) ) ( not ( = ?auto_49428 ?auto_49431 ) ) ( not ( = ?auto_49421 ?auto_49431 ) ) ( not ( = ?auto_49423 ?auto_49431 ) ) ( not ( = ?auto_49429 ?auto_49431 ) ) ( not ( = ?auto_49418 ?auto_49431 ) ) ( AVAILABLE ?auto_49417 ) ( IN ?auto_49429 ?auto_49419 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49417 ?auto_49429 ?auto_49419 ?auto_49430 )
      ( MAKE-ON ?auto_49415 ?auto_49416 )
      ( MAKE-ON-VERIFY ?auto_49415 ?auto_49416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49432 - SURFACE
      ?auto_49433 - SURFACE
    )
    :vars
    (
      ?auto_49443 - HOIST
      ?auto_49435 - PLACE
      ?auto_49448 - PLACE
      ?auto_49444 - HOIST
      ?auto_49441 - SURFACE
      ?auto_49436 - SURFACE
      ?auto_49446 - PLACE
      ?auto_49438 - HOIST
      ?auto_49447 - SURFACE
      ?auto_49437 - SURFACE
      ?auto_49434 - PLACE
      ?auto_49439 - HOIST
      ?auto_49440 - SURFACE
      ?auto_49442 - SURFACE
      ?auto_49445 - TRUCK
      ?auto_49449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49443 ?auto_49435 ) ( IS-CRATE ?auto_49432 ) ( not ( = ?auto_49432 ?auto_49433 ) ) ( not ( = ?auto_49448 ?auto_49435 ) ) ( HOIST-AT ?auto_49444 ?auto_49448 ) ( not ( = ?auto_49443 ?auto_49444 ) ) ( AVAILABLE ?auto_49444 ) ( SURFACE-AT ?auto_49432 ?auto_49448 ) ( ON ?auto_49432 ?auto_49441 ) ( CLEAR ?auto_49432 ) ( not ( = ?auto_49432 ?auto_49441 ) ) ( not ( = ?auto_49433 ?auto_49441 ) ) ( IS-CRATE ?auto_49433 ) ( not ( = ?auto_49432 ?auto_49436 ) ) ( not ( = ?auto_49433 ?auto_49436 ) ) ( not ( = ?auto_49441 ?auto_49436 ) ) ( not ( = ?auto_49446 ?auto_49435 ) ) ( not ( = ?auto_49448 ?auto_49446 ) ) ( HOIST-AT ?auto_49438 ?auto_49446 ) ( not ( = ?auto_49443 ?auto_49438 ) ) ( not ( = ?auto_49444 ?auto_49438 ) ) ( AVAILABLE ?auto_49438 ) ( SURFACE-AT ?auto_49433 ?auto_49446 ) ( ON ?auto_49433 ?auto_49447 ) ( CLEAR ?auto_49433 ) ( not ( = ?auto_49432 ?auto_49447 ) ) ( not ( = ?auto_49433 ?auto_49447 ) ) ( not ( = ?auto_49441 ?auto_49447 ) ) ( not ( = ?auto_49436 ?auto_49447 ) ) ( IS-CRATE ?auto_49436 ) ( not ( = ?auto_49432 ?auto_49437 ) ) ( not ( = ?auto_49433 ?auto_49437 ) ) ( not ( = ?auto_49441 ?auto_49437 ) ) ( not ( = ?auto_49436 ?auto_49437 ) ) ( not ( = ?auto_49447 ?auto_49437 ) ) ( not ( = ?auto_49434 ?auto_49435 ) ) ( not ( = ?auto_49448 ?auto_49434 ) ) ( not ( = ?auto_49446 ?auto_49434 ) ) ( HOIST-AT ?auto_49439 ?auto_49434 ) ( not ( = ?auto_49443 ?auto_49439 ) ) ( not ( = ?auto_49444 ?auto_49439 ) ) ( not ( = ?auto_49438 ?auto_49439 ) ) ( AVAILABLE ?auto_49439 ) ( SURFACE-AT ?auto_49436 ?auto_49434 ) ( ON ?auto_49436 ?auto_49440 ) ( CLEAR ?auto_49436 ) ( not ( = ?auto_49432 ?auto_49440 ) ) ( not ( = ?auto_49433 ?auto_49440 ) ) ( not ( = ?auto_49441 ?auto_49440 ) ) ( not ( = ?auto_49436 ?auto_49440 ) ) ( not ( = ?auto_49447 ?auto_49440 ) ) ( not ( = ?auto_49437 ?auto_49440 ) ) ( SURFACE-AT ?auto_49442 ?auto_49435 ) ( CLEAR ?auto_49442 ) ( IS-CRATE ?auto_49437 ) ( not ( = ?auto_49432 ?auto_49442 ) ) ( not ( = ?auto_49433 ?auto_49442 ) ) ( not ( = ?auto_49441 ?auto_49442 ) ) ( not ( = ?auto_49436 ?auto_49442 ) ) ( not ( = ?auto_49447 ?auto_49442 ) ) ( not ( = ?auto_49437 ?auto_49442 ) ) ( not ( = ?auto_49440 ?auto_49442 ) ) ( AVAILABLE ?auto_49443 ) ( IN ?auto_49437 ?auto_49445 ) ( TRUCK-AT ?auto_49445 ?auto_49449 ) ( not ( = ?auto_49449 ?auto_49435 ) ) ( not ( = ?auto_49448 ?auto_49449 ) ) ( not ( = ?auto_49446 ?auto_49449 ) ) ( not ( = ?auto_49434 ?auto_49449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49445 ?auto_49449 ?auto_49435 )
      ( MAKE-ON ?auto_49432 ?auto_49433 )
      ( MAKE-ON-VERIFY ?auto_49432 ?auto_49433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49450 - SURFACE
      ?auto_49451 - SURFACE
    )
    :vars
    (
      ?auto_49455 - HOIST
      ?auto_49461 - PLACE
      ?auto_49457 - PLACE
      ?auto_49462 - HOIST
      ?auto_49458 - SURFACE
      ?auto_49460 - SURFACE
      ?auto_49453 - PLACE
      ?auto_49454 - HOIST
      ?auto_49456 - SURFACE
      ?auto_49463 - SURFACE
      ?auto_49466 - PLACE
      ?auto_49459 - HOIST
      ?auto_49464 - SURFACE
      ?auto_49465 - SURFACE
      ?auto_49452 - TRUCK
      ?auto_49467 - PLACE
      ?auto_49468 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49455 ?auto_49461 ) ( IS-CRATE ?auto_49450 ) ( not ( = ?auto_49450 ?auto_49451 ) ) ( not ( = ?auto_49457 ?auto_49461 ) ) ( HOIST-AT ?auto_49462 ?auto_49457 ) ( not ( = ?auto_49455 ?auto_49462 ) ) ( AVAILABLE ?auto_49462 ) ( SURFACE-AT ?auto_49450 ?auto_49457 ) ( ON ?auto_49450 ?auto_49458 ) ( CLEAR ?auto_49450 ) ( not ( = ?auto_49450 ?auto_49458 ) ) ( not ( = ?auto_49451 ?auto_49458 ) ) ( IS-CRATE ?auto_49451 ) ( not ( = ?auto_49450 ?auto_49460 ) ) ( not ( = ?auto_49451 ?auto_49460 ) ) ( not ( = ?auto_49458 ?auto_49460 ) ) ( not ( = ?auto_49453 ?auto_49461 ) ) ( not ( = ?auto_49457 ?auto_49453 ) ) ( HOIST-AT ?auto_49454 ?auto_49453 ) ( not ( = ?auto_49455 ?auto_49454 ) ) ( not ( = ?auto_49462 ?auto_49454 ) ) ( AVAILABLE ?auto_49454 ) ( SURFACE-AT ?auto_49451 ?auto_49453 ) ( ON ?auto_49451 ?auto_49456 ) ( CLEAR ?auto_49451 ) ( not ( = ?auto_49450 ?auto_49456 ) ) ( not ( = ?auto_49451 ?auto_49456 ) ) ( not ( = ?auto_49458 ?auto_49456 ) ) ( not ( = ?auto_49460 ?auto_49456 ) ) ( IS-CRATE ?auto_49460 ) ( not ( = ?auto_49450 ?auto_49463 ) ) ( not ( = ?auto_49451 ?auto_49463 ) ) ( not ( = ?auto_49458 ?auto_49463 ) ) ( not ( = ?auto_49460 ?auto_49463 ) ) ( not ( = ?auto_49456 ?auto_49463 ) ) ( not ( = ?auto_49466 ?auto_49461 ) ) ( not ( = ?auto_49457 ?auto_49466 ) ) ( not ( = ?auto_49453 ?auto_49466 ) ) ( HOIST-AT ?auto_49459 ?auto_49466 ) ( not ( = ?auto_49455 ?auto_49459 ) ) ( not ( = ?auto_49462 ?auto_49459 ) ) ( not ( = ?auto_49454 ?auto_49459 ) ) ( AVAILABLE ?auto_49459 ) ( SURFACE-AT ?auto_49460 ?auto_49466 ) ( ON ?auto_49460 ?auto_49464 ) ( CLEAR ?auto_49460 ) ( not ( = ?auto_49450 ?auto_49464 ) ) ( not ( = ?auto_49451 ?auto_49464 ) ) ( not ( = ?auto_49458 ?auto_49464 ) ) ( not ( = ?auto_49460 ?auto_49464 ) ) ( not ( = ?auto_49456 ?auto_49464 ) ) ( not ( = ?auto_49463 ?auto_49464 ) ) ( SURFACE-AT ?auto_49465 ?auto_49461 ) ( CLEAR ?auto_49465 ) ( IS-CRATE ?auto_49463 ) ( not ( = ?auto_49450 ?auto_49465 ) ) ( not ( = ?auto_49451 ?auto_49465 ) ) ( not ( = ?auto_49458 ?auto_49465 ) ) ( not ( = ?auto_49460 ?auto_49465 ) ) ( not ( = ?auto_49456 ?auto_49465 ) ) ( not ( = ?auto_49463 ?auto_49465 ) ) ( not ( = ?auto_49464 ?auto_49465 ) ) ( AVAILABLE ?auto_49455 ) ( TRUCK-AT ?auto_49452 ?auto_49467 ) ( not ( = ?auto_49467 ?auto_49461 ) ) ( not ( = ?auto_49457 ?auto_49467 ) ) ( not ( = ?auto_49453 ?auto_49467 ) ) ( not ( = ?auto_49466 ?auto_49467 ) ) ( HOIST-AT ?auto_49468 ?auto_49467 ) ( LIFTING ?auto_49468 ?auto_49463 ) ( not ( = ?auto_49455 ?auto_49468 ) ) ( not ( = ?auto_49462 ?auto_49468 ) ) ( not ( = ?auto_49454 ?auto_49468 ) ) ( not ( = ?auto_49459 ?auto_49468 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49468 ?auto_49463 ?auto_49452 ?auto_49467 )
      ( MAKE-ON ?auto_49450 ?auto_49451 )
      ( MAKE-ON-VERIFY ?auto_49450 ?auto_49451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49469 - SURFACE
      ?auto_49470 - SURFACE
    )
    :vars
    (
      ?auto_49475 - HOIST
      ?auto_49472 - PLACE
      ?auto_49476 - PLACE
      ?auto_49473 - HOIST
      ?auto_49477 - SURFACE
      ?auto_49485 - SURFACE
      ?auto_49480 - PLACE
      ?auto_49478 - HOIST
      ?auto_49487 - SURFACE
      ?auto_49471 - SURFACE
      ?auto_49483 - PLACE
      ?auto_49479 - HOIST
      ?auto_49474 - SURFACE
      ?auto_49486 - SURFACE
      ?auto_49482 - TRUCK
      ?auto_49484 - PLACE
      ?auto_49481 - HOIST
      ?auto_49488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49475 ?auto_49472 ) ( IS-CRATE ?auto_49469 ) ( not ( = ?auto_49469 ?auto_49470 ) ) ( not ( = ?auto_49476 ?auto_49472 ) ) ( HOIST-AT ?auto_49473 ?auto_49476 ) ( not ( = ?auto_49475 ?auto_49473 ) ) ( AVAILABLE ?auto_49473 ) ( SURFACE-AT ?auto_49469 ?auto_49476 ) ( ON ?auto_49469 ?auto_49477 ) ( CLEAR ?auto_49469 ) ( not ( = ?auto_49469 ?auto_49477 ) ) ( not ( = ?auto_49470 ?auto_49477 ) ) ( IS-CRATE ?auto_49470 ) ( not ( = ?auto_49469 ?auto_49485 ) ) ( not ( = ?auto_49470 ?auto_49485 ) ) ( not ( = ?auto_49477 ?auto_49485 ) ) ( not ( = ?auto_49480 ?auto_49472 ) ) ( not ( = ?auto_49476 ?auto_49480 ) ) ( HOIST-AT ?auto_49478 ?auto_49480 ) ( not ( = ?auto_49475 ?auto_49478 ) ) ( not ( = ?auto_49473 ?auto_49478 ) ) ( AVAILABLE ?auto_49478 ) ( SURFACE-AT ?auto_49470 ?auto_49480 ) ( ON ?auto_49470 ?auto_49487 ) ( CLEAR ?auto_49470 ) ( not ( = ?auto_49469 ?auto_49487 ) ) ( not ( = ?auto_49470 ?auto_49487 ) ) ( not ( = ?auto_49477 ?auto_49487 ) ) ( not ( = ?auto_49485 ?auto_49487 ) ) ( IS-CRATE ?auto_49485 ) ( not ( = ?auto_49469 ?auto_49471 ) ) ( not ( = ?auto_49470 ?auto_49471 ) ) ( not ( = ?auto_49477 ?auto_49471 ) ) ( not ( = ?auto_49485 ?auto_49471 ) ) ( not ( = ?auto_49487 ?auto_49471 ) ) ( not ( = ?auto_49483 ?auto_49472 ) ) ( not ( = ?auto_49476 ?auto_49483 ) ) ( not ( = ?auto_49480 ?auto_49483 ) ) ( HOIST-AT ?auto_49479 ?auto_49483 ) ( not ( = ?auto_49475 ?auto_49479 ) ) ( not ( = ?auto_49473 ?auto_49479 ) ) ( not ( = ?auto_49478 ?auto_49479 ) ) ( AVAILABLE ?auto_49479 ) ( SURFACE-AT ?auto_49485 ?auto_49483 ) ( ON ?auto_49485 ?auto_49474 ) ( CLEAR ?auto_49485 ) ( not ( = ?auto_49469 ?auto_49474 ) ) ( not ( = ?auto_49470 ?auto_49474 ) ) ( not ( = ?auto_49477 ?auto_49474 ) ) ( not ( = ?auto_49485 ?auto_49474 ) ) ( not ( = ?auto_49487 ?auto_49474 ) ) ( not ( = ?auto_49471 ?auto_49474 ) ) ( SURFACE-AT ?auto_49486 ?auto_49472 ) ( CLEAR ?auto_49486 ) ( IS-CRATE ?auto_49471 ) ( not ( = ?auto_49469 ?auto_49486 ) ) ( not ( = ?auto_49470 ?auto_49486 ) ) ( not ( = ?auto_49477 ?auto_49486 ) ) ( not ( = ?auto_49485 ?auto_49486 ) ) ( not ( = ?auto_49487 ?auto_49486 ) ) ( not ( = ?auto_49471 ?auto_49486 ) ) ( not ( = ?auto_49474 ?auto_49486 ) ) ( AVAILABLE ?auto_49475 ) ( TRUCK-AT ?auto_49482 ?auto_49484 ) ( not ( = ?auto_49484 ?auto_49472 ) ) ( not ( = ?auto_49476 ?auto_49484 ) ) ( not ( = ?auto_49480 ?auto_49484 ) ) ( not ( = ?auto_49483 ?auto_49484 ) ) ( HOIST-AT ?auto_49481 ?auto_49484 ) ( not ( = ?auto_49475 ?auto_49481 ) ) ( not ( = ?auto_49473 ?auto_49481 ) ) ( not ( = ?auto_49478 ?auto_49481 ) ) ( not ( = ?auto_49479 ?auto_49481 ) ) ( AVAILABLE ?auto_49481 ) ( SURFACE-AT ?auto_49471 ?auto_49484 ) ( ON ?auto_49471 ?auto_49488 ) ( CLEAR ?auto_49471 ) ( not ( = ?auto_49469 ?auto_49488 ) ) ( not ( = ?auto_49470 ?auto_49488 ) ) ( not ( = ?auto_49477 ?auto_49488 ) ) ( not ( = ?auto_49485 ?auto_49488 ) ) ( not ( = ?auto_49487 ?auto_49488 ) ) ( not ( = ?auto_49471 ?auto_49488 ) ) ( not ( = ?auto_49474 ?auto_49488 ) ) ( not ( = ?auto_49486 ?auto_49488 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49481 ?auto_49471 ?auto_49488 ?auto_49484 )
      ( MAKE-ON ?auto_49469 ?auto_49470 )
      ( MAKE-ON-VERIFY ?auto_49469 ?auto_49470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49489 - SURFACE
      ?auto_49490 - SURFACE
    )
    :vars
    (
      ?auto_49491 - HOIST
      ?auto_49497 - PLACE
      ?auto_49500 - PLACE
      ?auto_49502 - HOIST
      ?auto_49507 - SURFACE
      ?auto_49506 - SURFACE
      ?auto_49495 - PLACE
      ?auto_49501 - HOIST
      ?auto_49496 - SURFACE
      ?auto_49499 - SURFACE
      ?auto_49503 - PLACE
      ?auto_49494 - HOIST
      ?auto_49498 - SURFACE
      ?auto_49492 - SURFACE
      ?auto_49493 - PLACE
      ?auto_49504 - HOIST
      ?auto_49508 - SURFACE
      ?auto_49505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49491 ?auto_49497 ) ( IS-CRATE ?auto_49489 ) ( not ( = ?auto_49489 ?auto_49490 ) ) ( not ( = ?auto_49500 ?auto_49497 ) ) ( HOIST-AT ?auto_49502 ?auto_49500 ) ( not ( = ?auto_49491 ?auto_49502 ) ) ( AVAILABLE ?auto_49502 ) ( SURFACE-AT ?auto_49489 ?auto_49500 ) ( ON ?auto_49489 ?auto_49507 ) ( CLEAR ?auto_49489 ) ( not ( = ?auto_49489 ?auto_49507 ) ) ( not ( = ?auto_49490 ?auto_49507 ) ) ( IS-CRATE ?auto_49490 ) ( not ( = ?auto_49489 ?auto_49506 ) ) ( not ( = ?auto_49490 ?auto_49506 ) ) ( not ( = ?auto_49507 ?auto_49506 ) ) ( not ( = ?auto_49495 ?auto_49497 ) ) ( not ( = ?auto_49500 ?auto_49495 ) ) ( HOIST-AT ?auto_49501 ?auto_49495 ) ( not ( = ?auto_49491 ?auto_49501 ) ) ( not ( = ?auto_49502 ?auto_49501 ) ) ( AVAILABLE ?auto_49501 ) ( SURFACE-AT ?auto_49490 ?auto_49495 ) ( ON ?auto_49490 ?auto_49496 ) ( CLEAR ?auto_49490 ) ( not ( = ?auto_49489 ?auto_49496 ) ) ( not ( = ?auto_49490 ?auto_49496 ) ) ( not ( = ?auto_49507 ?auto_49496 ) ) ( not ( = ?auto_49506 ?auto_49496 ) ) ( IS-CRATE ?auto_49506 ) ( not ( = ?auto_49489 ?auto_49499 ) ) ( not ( = ?auto_49490 ?auto_49499 ) ) ( not ( = ?auto_49507 ?auto_49499 ) ) ( not ( = ?auto_49506 ?auto_49499 ) ) ( not ( = ?auto_49496 ?auto_49499 ) ) ( not ( = ?auto_49503 ?auto_49497 ) ) ( not ( = ?auto_49500 ?auto_49503 ) ) ( not ( = ?auto_49495 ?auto_49503 ) ) ( HOIST-AT ?auto_49494 ?auto_49503 ) ( not ( = ?auto_49491 ?auto_49494 ) ) ( not ( = ?auto_49502 ?auto_49494 ) ) ( not ( = ?auto_49501 ?auto_49494 ) ) ( AVAILABLE ?auto_49494 ) ( SURFACE-AT ?auto_49506 ?auto_49503 ) ( ON ?auto_49506 ?auto_49498 ) ( CLEAR ?auto_49506 ) ( not ( = ?auto_49489 ?auto_49498 ) ) ( not ( = ?auto_49490 ?auto_49498 ) ) ( not ( = ?auto_49507 ?auto_49498 ) ) ( not ( = ?auto_49506 ?auto_49498 ) ) ( not ( = ?auto_49496 ?auto_49498 ) ) ( not ( = ?auto_49499 ?auto_49498 ) ) ( SURFACE-AT ?auto_49492 ?auto_49497 ) ( CLEAR ?auto_49492 ) ( IS-CRATE ?auto_49499 ) ( not ( = ?auto_49489 ?auto_49492 ) ) ( not ( = ?auto_49490 ?auto_49492 ) ) ( not ( = ?auto_49507 ?auto_49492 ) ) ( not ( = ?auto_49506 ?auto_49492 ) ) ( not ( = ?auto_49496 ?auto_49492 ) ) ( not ( = ?auto_49499 ?auto_49492 ) ) ( not ( = ?auto_49498 ?auto_49492 ) ) ( AVAILABLE ?auto_49491 ) ( not ( = ?auto_49493 ?auto_49497 ) ) ( not ( = ?auto_49500 ?auto_49493 ) ) ( not ( = ?auto_49495 ?auto_49493 ) ) ( not ( = ?auto_49503 ?auto_49493 ) ) ( HOIST-AT ?auto_49504 ?auto_49493 ) ( not ( = ?auto_49491 ?auto_49504 ) ) ( not ( = ?auto_49502 ?auto_49504 ) ) ( not ( = ?auto_49501 ?auto_49504 ) ) ( not ( = ?auto_49494 ?auto_49504 ) ) ( AVAILABLE ?auto_49504 ) ( SURFACE-AT ?auto_49499 ?auto_49493 ) ( ON ?auto_49499 ?auto_49508 ) ( CLEAR ?auto_49499 ) ( not ( = ?auto_49489 ?auto_49508 ) ) ( not ( = ?auto_49490 ?auto_49508 ) ) ( not ( = ?auto_49507 ?auto_49508 ) ) ( not ( = ?auto_49506 ?auto_49508 ) ) ( not ( = ?auto_49496 ?auto_49508 ) ) ( not ( = ?auto_49499 ?auto_49508 ) ) ( not ( = ?auto_49498 ?auto_49508 ) ) ( not ( = ?auto_49492 ?auto_49508 ) ) ( TRUCK-AT ?auto_49505 ?auto_49497 ) )
    :subtasks
    ( ( !DRIVE ?auto_49505 ?auto_49497 ?auto_49493 )
      ( MAKE-ON ?auto_49489 ?auto_49490 )
      ( MAKE-ON-VERIFY ?auto_49489 ?auto_49490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49509 - SURFACE
      ?auto_49510 - SURFACE
    )
    :vars
    (
      ?auto_49518 - HOIST
      ?auto_49512 - PLACE
      ?auto_49528 - PLACE
      ?auto_49520 - HOIST
      ?auto_49524 - SURFACE
      ?auto_49526 - SURFACE
      ?auto_49511 - PLACE
      ?auto_49515 - HOIST
      ?auto_49513 - SURFACE
      ?auto_49519 - SURFACE
      ?auto_49522 - PLACE
      ?auto_49516 - HOIST
      ?auto_49521 - SURFACE
      ?auto_49517 - SURFACE
      ?auto_49514 - PLACE
      ?auto_49523 - HOIST
      ?auto_49525 - SURFACE
      ?auto_49527 - TRUCK
      ?auto_49529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49518 ?auto_49512 ) ( IS-CRATE ?auto_49509 ) ( not ( = ?auto_49509 ?auto_49510 ) ) ( not ( = ?auto_49528 ?auto_49512 ) ) ( HOIST-AT ?auto_49520 ?auto_49528 ) ( not ( = ?auto_49518 ?auto_49520 ) ) ( AVAILABLE ?auto_49520 ) ( SURFACE-AT ?auto_49509 ?auto_49528 ) ( ON ?auto_49509 ?auto_49524 ) ( CLEAR ?auto_49509 ) ( not ( = ?auto_49509 ?auto_49524 ) ) ( not ( = ?auto_49510 ?auto_49524 ) ) ( IS-CRATE ?auto_49510 ) ( not ( = ?auto_49509 ?auto_49526 ) ) ( not ( = ?auto_49510 ?auto_49526 ) ) ( not ( = ?auto_49524 ?auto_49526 ) ) ( not ( = ?auto_49511 ?auto_49512 ) ) ( not ( = ?auto_49528 ?auto_49511 ) ) ( HOIST-AT ?auto_49515 ?auto_49511 ) ( not ( = ?auto_49518 ?auto_49515 ) ) ( not ( = ?auto_49520 ?auto_49515 ) ) ( AVAILABLE ?auto_49515 ) ( SURFACE-AT ?auto_49510 ?auto_49511 ) ( ON ?auto_49510 ?auto_49513 ) ( CLEAR ?auto_49510 ) ( not ( = ?auto_49509 ?auto_49513 ) ) ( not ( = ?auto_49510 ?auto_49513 ) ) ( not ( = ?auto_49524 ?auto_49513 ) ) ( not ( = ?auto_49526 ?auto_49513 ) ) ( IS-CRATE ?auto_49526 ) ( not ( = ?auto_49509 ?auto_49519 ) ) ( not ( = ?auto_49510 ?auto_49519 ) ) ( not ( = ?auto_49524 ?auto_49519 ) ) ( not ( = ?auto_49526 ?auto_49519 ) ) ( not ( = ?auto_49513 ?auto_49519 ) ) ( not ( = ?auto_49522 ?auto_49512 ) ) ( not ( = ?auto_49528 ?auto_49522 ) ) ( not ( = ?auto_49511 ?auto_49522 ) ) ( HOIST-AT ?auto_49516 ?auto_49522 ) ( not ( = ?auto_49518 ?auto_49516 ) ) ( not ( = ?auto_49520 ?auto_49516 ) ) ( not ( = ?auto_49515 ?auto_49516 ) ) ( AVAILABLE ?auto_49516 ) ( SURFACE-AT ?auto_49526 ?auto_49522 ) ( ON ?auto_49526 ?auto_49521 ) ( CLEAR ?auto_49526 ) ( not ( = ?auto_49509 ?auto_49521 ) ) ( not ( = ?auto_49510 ?auto_49521 ) ) ( not ( = ?auto_49524 ?auto_49521 ) ) ( not ( = ?auto_49526 ?auto_49521 ) ) ( not ( = ?auto_49513 ?auto_49521 ) ) ( not ( = ?auto_49519 ?auto_49521 ) ) ( IS-CRATE ?auto_49519 ) ( not ( = ?auto_49509 ?auto_49517 ) ) ( not ( = ?auto_49510 ?auto_49517 ) ) ( not ( = ?auto_49524 ?auto_49517 ) ) ( not ( = ?auto_49526 ?auto_49517 ) ) ( not ( = ?auto_49513 ?auto_49517 ) ) ( not ( = ?auto_49519 ?auto_49517 ) ) ( not ( = ?auto_49521 ?auto_49517 ) ) ( not ( = ?auto_49514 ?auto_49512 ) ) ( not ( = ?auto_49528 ?auto_49514 ) ) ( not ( = ?auto_49511 ?auto_49514 ) ) ( not ( = ?auto_49522 ?auto_49514 ) ) ( HOIST-AT ?auto_49523 ?auto_49514 ) ( not ( = ?auto_49518 ?auto_49523 ) ) ( not ( = ?auto_49520 ?auto_49523 ) ) ( not ( = ?auto_49515 ?auto_49523 ) ) ( not ( = ?auto_49516 ?auto_49523 ) ) ( AVAILABLE ?auto_49523 ) ( SURFACE-AT ?auto_49519 ?auto_49514 ) ( ON ?auto_49519 ?auto_49525 ) ( CLEAR ?auto_49519 ) ( not ( = ?auto_49509 ?auto_49525 ) ) ( not ( = ?auto_49510 ?auto_49525 ) ) ( not ( = ?auto_49524 ?auto_49525 ) ) ( not ( = ?auto_49526 ?auto_49525 ) ) ( not ( = ?auto_49513 ?auto_49525 ) ) ( not ( = ?auto_49519 ?auto_49525 ) ) ( not ( = ?auto_49521 ?auto_49525 ) ) ( not ( = ?auto_49517 ?auto_49525 ) ) ( TRUCK-AT ?auto_49527 ?auto_49512 ) ( SURFACE-AT ?auto_49529 ?auto_49512 ) ( CLEAR ?auto_49529 ) ( LIFTING ?auto_49518 ?auto_49517 ) ( IS-CRATE ?auto_49517 ) ( not ( = ?auto_49509 ?auto_49529 ) ) ( not ( = ?auto_49510 ?auto_49529 ) ) ( not ( = ?auto_49524 ?auto_49529 ) ) ( not ( = ?auto_49526 ?auto_49529 ) ) ( not ( = ?auto_49513 ?auto_49529 ) ) ( not ( = ?auto_49519 ?auto_49529 ) ) ( not ( = ?auto_49521 ?auto_49529 ) ) ( not ( = ?auto_49517 ?auto_49529 ) ) ( not ( = ?auto_49525 ?auto_49529 ) ) )
    :subtasks
    ( ( !DROP ?auto_49518 ?auto_49517 ?auto_49529 ?auto_49512 )
      ( MAKE-ON ?auto_49509 ?auto_49510 )
      ( MAKE-ON-VERIFY ?auto_49509 ?auto_49510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49530 - SURFACE
      ?auto_49531 - SURFACE
    )
    :vars
    (
      ?auto_49537 - HOIST
      ?auto_49533 - PLACE
      ?auto_49547 - PLACE
      ?auto_49546 - HOIST
      ?auto_49536 - SURFACE
      ?auto_49535 - SURFACE
      ?auto_49550 - PLACE
      ?auto_49541 - HOIST
      ?auto_49539 - SURFACE
      ?auto_49549 - SURFACE
      ?auto_49538 - PLACE
      ?auto_49542 - HOIST
      ?auto_49543 - SURFACE
      ?auto_49534 - SURFACE
      ?auto_49540 - PLACE
      ?auto_49544 - HOIST
      ?auto_49545 - SURFACE
      ?auto_49532 - TRUCK
      ?auto_49548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49537 ?auto_49533 ) ( IS-CRATE ?auto_49530 ) ( not ( = ?auto_49530 ?auto_49531 ) ) ( not ( = ?auto_49547 ?auto_49533 ) ) ( HOIST-AT ?auto_49546 ?auto_49547 ) ( not ( = ?auto_49537 ?auto_49546 ) ) ( AVAILABLE ?auto_49546 ) ( SURFACE-AT ?auto_49530 ?auto_49547 ) ( ON ?auto_49530 ?auto_49536 ) ( CLEAR ?auto_49530 ) ( not ( = ?auto_49530 ?auto_49536 ) ) ( not ( = ?auto_49531 ?auto_49536 ) ) ( IS-CRATE ?auto_49531 ) ( not ( = ?auto_49530 ?auto_49535 ) ) ( not ( = ?auto_49531 ?auto_49535 ) ) ( not ( = ?auto_49536 ?auto_49535 ) ) ( not ( = ?auto_49550 ?auto_49533 ) ) ( not ( = ?auto_49547 ?auto_49550 ) ) ( HOIST-AT ?auto_49541 ?auto_49550 ) ( not ( = ?auto_49537 ?auto_49541 ) ) ( not ( = ?auto_49546 ?auto_49541 ) ) ( AVAILABLE ?auto_49541 ) ( SURFACE-AT ?auto_49531 ?auto_49550 ) ( ON ?auto_49531 ?auto_49539 ) ( CLEAR ?auto_49531 ) ( not ( = ?auto_49530 ?auto_49539 ) ) ( not ( = ?auto_49531 ?auto_49539 ) ) ( not ( = ?auto_49536 ?auto_49539 ) ) ( not ( = ?auto_49535 ?auto_49539 ) ) ( IS-CRATE ?auto_49535 ) ( not ( = ?auto_49530 ?auto_49549 ) ) ( not ( = ?auto_49531 ?auto_49549 ) ) ( not ( = ?auto_49536 ?auto_49549 ) ) ( not ( = ?auto_49535 ?auto_49549 ) ) ( not ( = ?auto_49539 ?auto_49549 ) ) ( not ( = ?auto_49538 ?auto_49533 ) ) ( not ( = ?auto_49547 ?auto_49538 ) ) ( not ( = ?auto_49550 ?auto_49538 ) ) ( HOIST-AT ?auto_49542 ?auto_49538 ) ( not ( = ?auto_49537 ?auto_49542 ) ) ( not ( = ?auto_49546 ?auto_49542 ) ) ( not ( = ?auto_49541 ?auto_49542 ) ) ( AVAILABLE ?auto_49542 ) ( SURFACE-AT ?auto_49535 ?auto_49538 ) ( ON ?auto_49535 ?auto_49543 ) ( CLEAR ?auto_49535 ) ( not ( = ?auto_49530 ?auto_49543 ) ) ( not ( = ?auto_49531 ?auto_49543 ) ) ( not ( = ?auto_49536 ?auto_49543 ) ) ( not ( = ?auto_49535 ?auto_49543 ) ) ( not ( = ?auto_49539 ?auto_49543 ) ) ( not ( = ?auto_49549 ?auto_49543 ) ) ( IS-CRATE ?auto_49549 ) ( not ( = ?auto_49530 ?auto_49534 ) ) ( not ( = ?auto_49531 ?auto_49534 ) ) ( not ( = ?auto_49536 ?auto_49534 ) ) ( not ( = ?auto_49535 ?auto_49534 ) ) ( not ( = ?auto_49539 ?auto_49534 ) ) ( not ( = ?auto_49549 ?auto_49534 ) ) ( not ( = ?auto_49543 ?auto_49534 ) ) ( not ( = ?auto_49540 ?auto_49533 ) ) ( not ( = ?auto_49547 ?auto_49540 ) ) ( not ( = ?auto_49550 ?auto_49540 ) ) ( not ( = ?auto_49538 ?auto_49540 ) ) ( HOIST-AT ?auto_49544 ?auto_49540 ) ( not ( = ?auto_49537 ?auto_49544 ) ) ( not ( = ?auto_49546 ?auto_49544 ) ) ( not ( = ?auto_49541 ?auto_49544 ) ) ( not ( = ?auto_49542 ?auto_49544 ) ) ( AVAILABLE ?auto_49544 ) ( SURFACE-AT ?auto_49549 ?auto_49540 ) ( ON ?auto_49549 ?auto_49545 ) ( CLEAR ?auto_49549 ) ( not ( = ?auto_49530 ?auto_49545 ) ) ( not ( = ?auto_49531 ?auto_49545 ) ) ( not ( = ?auto_49536 ?auto_49545 ) ) ( not ( = ?auto_49535 ?auto_49545 ) ) ( not ( = ?auto_49539 ?auto_49545 ) ) ( not ( = ?auto_49549 ?auto_49545 ) ) ( not ( = ?auto_49543 ?auto_49545 ) ) ( not ( = ?auto_49534 ?auto_49545 ) ) ( TRUCK-AT ?auto_49532 ?auto_49533 ) ( SURFACE-AT ?auto_49548 ?auto_49533 ) ( CLEAR ?auto_49548 ) ( IS-CRATE ?auto_49534 ) ( not ( = ?auto_49530 ?auto_49548 ) ) ( not ( = ?auto_49531 ?auto_49548 ) ) ( not ( = ?auto_49536 ?auto_49548 ) ) ( not ( = ?auto_49535 ?auto_49548 ) ) ( not ( = ?auto_49539 ?auto_49548 ) ) ( not ( = ?auto_49549 ?auto_49548 ) ) ( not ( = ?auto_49543 ?auto_49548 ) ) ( not ( = ?auto_49534 ?auto_49548 ) ) ( not ( = ?auto_49545 ?auto_49548 ) ) ( AVAILABLE ?auto_49537 ) ( IN ?auto_49534 ?auto_49532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49537 ?auto_49534 ?auto_49532 ?auto_49533 )
      ( MAKE-ON ?auto_49530 ?auto_49531 )
      ( MAKE-ON-VERIFY ?auto_49530 ?auto_49531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49551 - SURFACE
      ?auto_49552 - SURFACE
    )
    :vars
    (
      ?auto_49555 - HOIST
      ?auto_49562 - PLACE
      ?auto_49568 - PLACE
      ?auto_49565 - HOIST
      ?auto_49563 - SURFACE
      ?auto_49553 - SURFACE
      ?auto_49567 - PLACE
      ?auto_49557 - HOIST
      ?auto_49554 - SURFACE
      ?auto_49566 - SURFACE
      ?auto_49560 - PLACE
      ?auto_49556 - HOIST
      ?auto_49571 - SURFACE
      ?auto_49558 - SURFACE
      ?auto_49570 - PLACE
      ?auto_49569 - HOIST
      ?auto_49561 - SURFACE
      ?auto_49559 - SURFACE
      ?auto_49564 - TRUCK
      ?auto_49572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49555 ?auto_49562 ) ( IS-CRATE ?auto_49551 ) ( not ( = ?auto_49551 ?auto_49552 ) ) ( not ( = ?auto_49568 ?auto_49562 ) ) ( HOIST-AT ?auto_49565 ?auto_49568 ) ( not ( = ?auto_49555 ?auto_49565 ) ) ( AVAILABLE ?auto_49565 ) ( SURFACE-AT ?auto_49551 ?auto_49568 ) ( ON ?auto_49551 ?auto_49563 ) ( CLEAR ?auto_49551 ) ( not ( = ?auto_49551 ?auto_49563 ) ) ( not ( = ?auto_49552 ?auto_49563 ) ) ( IS-CRATE ?auto_49552 ) ( not ( = ?auto_49551 ?auto_49553 ) ) ( not ( = ?auto_49552 ?auto_49553 ) ) ( not ( = ?auto_49563 ?auto_49553 ) ) ( not ( = ?auto_49567 ?auto_49562 ) ) ( not ( = ?auto_49568 ?auto_49567 ) ) ( HOIST-AT ?auto_49557 ?auto_49567 ) ( not ( = ?auto_49555 ?auto_49557 ) ) ( not ( = ?auto_49565 ?auto_49557 ) ) ( AVAILABLE ?auto_49557 ) ( SURFACE-AT ?auto_49552 ?auto_49567 ) ( ON ?auto_49552 ?auto_49554 ) ( CLEAR ?auto_49552 ) ( not ( = ?auto_49551 ?auto_49554 ) ) ( not ( = ?auto_49552 ?auto_49554 ) ) ( not ( = ?auto_49563 ?auto_49554 ) ) ( not ( = ?auto_49553 ?auto_49554 ) ) ( IS-CRATE ?auto_49553 ) ( not ( = ?auto_49551 ?auto_49566 ) ) ( not ( = ?auto_49552 ?auto_49566 ) ) ( not ( = ?auto_49563 ?auto_49566 ) ) ( not ( = ?auto_49553 ?auto_49566 ) ) ( not ( = ?auto_49554 ?auto_49566 ) ) ( not ( = ?auto_49560 ?auto_49562 ) ) ( not ( = ?auto_49568 ?auto_49560 ) ) ( not ( = ?auto_49567 ?auto_49560 ) ) ( HOIST-AT ?auto_49556 ?auto_49560 ) ( not ( = ?auto_49555 ?auto_49556 ) ) ( not ( = ?auto_49565 ?auto_49556 ) ) ( not ( = ?auto_49557 ?auto_49556 ) ) ( AVAILABLE ?auto_49556 ) ( SURFACE-AT ?auto_49553 ?auto_49560 ) ( ON ?auto_49553 ?auto_49571 ) ( CLEAR ?auto_49553 ) ( not ( = ?auto_49551 ?auto_49571 ) ) ( not ( = ?auto_49552 ?auto_49571 ) ) ( not ( = ?auto_49563 ?auto_49571 ) ) ( not ( = ?auto_49553 ?auto_49571 ) ) ( not ( = ?auto_49554 ?auto_49571 ) ) ( not ( = ?auto_49566 ?auto_49571 ) ) ( IS-CRATE ?auto_49566 ) ( not ( = ?auto_49551 ?auto_49558 ) ) ( not ( = ?auto_49552 ?auto_49558 ) ) ( not ( = ?auto_49563 ?auto_49558 ) ) ( not ( = ?auto_49553 ?auto_49558 ) ) ( not ( = ?auto_49554 ?auto_49558 ) ) ( not ( = ?auto_49566 ?auto_49558 ) ) ( not ( = ?auto_49571 ?auto_49558 ) ) ( not ( = ?auto_49570 ?auto_49562 ) ) ( not ( = ?auto_49568 ?auto_49570 ) ) ( not ( = ?auto_49567 ?auto_49570 ) ) ( not ( = ?auto_49560 ?auto_49570 ) ) ( HOIST-AT ?auto_49569 ?auto_49570 ) ( not ( = ?auto_49555 ?auto_49569 ) ) ( not ( = ?auto_49565 ?auto_49569 ) ) ( not ( = ?auto_49557 ?auto_49569 ) ) ( not ( = ?auto_49556 ?auto_49569 ) ) ( AVAILABLE ?auto_49569 ) ( SURFACE-AT ?auto_49566 ?auto_49570 ) ( ON ?auto_49566 ?auto_49561 ) ( CLEAR ?auto_49566 ) ( not ( = ?auto_49551 ?auto_49561 ) ) ( not ( = ?auto_49552 ?auto_49561 ) ) ( not ( = ?auto_49563 ?auto_49561 ) ) ( not ( = ?auto_49553 ?auto_49561 ) ) ( not ( = ?auto_49554 ?auto_49561 ) ) ( not ( = ?auto_49566 ?auto_49561 ) ) ( not ( = ?auto_49571 ?auto_49561 ) ) ( not ( = ?auto_49558 ?auto_49561 ) ) ( SURFACE-AT ?auto_49559 ?auto_49562 ) ( CLEAR ?auto_49559 ) ( IS-CRATE ?auto_49558 ) ( not ( = ?auto_49551 ?auto_49559 ) ) ( not ( = ?auto_49552 ?auto_49559 ) ) ( not ( = ?auto_49563 ?auto_49559 ) ) ( not ( = ?auto_49553 ?auto_49559 ) ) ( not ( = ?auto_49554 ?auto_49559 ) ) ( not ( = ?auto_49566 ?auto_49559 ) ) ( not ( = ?auto_49571 ?auto_49559 ) ) ( not ( = ?auto_49558 ?auto_49559 ) ) ( not ( = ?auto_49561 ?auto_49559 ) ) ( AVAILABLE ?auto_49555 ) ( IN ?auto_49558 ?auto_49564 ) ( TRUCK-AT ?auto_49564 ?auto_49572 ) ( not ( = ?auto_49572 ?auto_49562 ) ) ( not ( = ?auto_49568 ?auto_49572 ) ) ( not ( = ?auto_49567 ?auto_49572 ) ) ( not ( = ?auto_49560 ?auto_49572 ) ) ( not ( = ?auto_49570 ?auto_49572 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49564 ?auto_49572 ?auto_49562 )
      ( MAKE-ON ?auto_49551 ?auto_49552 )
      ( MAKE-ON-VERIFY ?auto_49551 ?auto_49552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49573 - SURFACE
      ?auto_49574 - SURFACE
    )
    :vars
    (
      ?auto_49587 - HOIST
      ?auto_49594 - PLACE
      ?auto_49578 - PLACE
      ?auto_49585 - HOIST
      ?auto_49576 - SURFACE
      ?auto_49577 - SURFACE
      ?auto_49590 - PLACE
      ?auto_49582 - HOIST
      ?auto_49579 - SURFACE
      ?auto_49589 - SURFACE
      ?auto_49584 - PLACE
      ?auto_49583 - HOIST
      ?auto_49581 - SURFACE
      ?auto_49575 - SURFACE
      ?auto_49580 - PLACE
      ?auto_49586 - HOIST
      ?auto_49588 - SURFACE
      ?auto_49591 - SURFACE
      ?auto_49593 - TRUCK
      ?auto_49592 - PLACE
      ?auto_49595 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49587 ?auto_49594 ) ( IS-CRATE ?auto_49573 ) ( not ( = ?auto_49573 ?auto_49574 ) ) ( not ( = ?auto_49578 ?auto_49594 ) ) ( HOIST-AT ?auto_49585 ?auto_49578 ) ( not ( = ?auto_49587 ?auto_49585 ) ) ( AVAILABLE ?auto_49585 ) ( SURFACE-AT ?auto_49573 ?auto_49578 ) ( ON ?auto_49573 ?auto_49576 ) ( CLEAR ?auto_49573 ) ( not ( = ?auto_49573 ?auto_49576 ) ) ( not ( = ?auto_49574 ?auto_49576 ) ) ( IS-CRATE ?auto_49574 ) ( not ( = ?auto_49573 ?auto_49577 ) ) ( not ( = ?auto_49574 ?auto_49577 ) ) ( not ( = ?auto_49576 ?auto_49577 ) ) ( not ( = ?auto_49590 ?auto_49594 ) ) ( not ( = ?auto_49578 ?auto_49590 ) ) ( HOIST-AT ?auto_49582 ?auto_49590 ) ( not ( = ?auto_49587 ?auto_49582 ) ) ( not ( = ?auto_49585 ?auto_49582 ) ) ( AVAILABLE ?auto_49582 ) ( SURFACE-AT ?auto_49574 ?auto_49590 ) ( ON ?auto_49574 ?auto_49579 ) ( CLEAR ?auto_49574 ) ( not ( = ?auto_49573 ?auto_49579 ) ) ( not ( = ?auto_49574 ?auto_49579 ) ) ( not ( = ?auto_49576 ?auto_49579 ) ) ( not ( = ?auto_49577 ?auto_49579 ) ) ( IS-CRATE ?auto_49577 ) ( not ( = ?auto_49573 ?auto_49589 ) ) ( not ( = ?auto_49574 ?auto_49589 ) ) ( not ( = ?auto_49576 ?auto_49589 ) ) ( not ( = ?auto_49577 ?auto_49589 ) ) ( not ( = ?auto_49579 ?auto_49589 ) ) ( not ( = ?auto_49584 ?auto_49594 ) ) ( not ( = ?auto_49578 ?auto_49584 ) ) ( not ( = ?auto_49590 ?auto_49584 ) ) ( HOIST-AT ?auto_49583 ?auto_49584 ) ( not ( = ?auto_49587 ?auto_49583 ) ) ( not ( = ?auto_49585 ?auto_49583 ) ) ( not ( = ?auto_49582 ?auto_49583 ) ) ( AVAILABLE ?auto_49583 ) ( SURFACE-AT ?auto_49577 ?auto_49584 ) ( ON ?auto_49577 ?auto_49581 ) ( CLEAR ?auto_49577 ) ( not ( = ?auto_49573 ?auto_49581 ) ) ( not ( = ?auto_49574 ?auto_49581 ) ) ( not ( = ?auto_49576 ?auto_49581 ) ) ( not ( = ?auto_49577 ?auto_49581 ) ) ( not ( = ?auto_49579 ?auto_49581 ) ) ( not ( = ?auto_49589 ?auto_49581 ) ) ( IS-CRATE ?auto_49589 ) ( not ( = ?auto_49573 ?auto_49575 ) ) ( not ( = ?auto_49574 ?auto_49575 ) ) ( not ( = ?auto_49576 ?auto_49575 ) ) ( not ( = ?auto_49577 ?auto_49575 ) ) ( not ( = ?auto_49579 ?auto_49575 ) ) ( not ( = ?auto_49589 ?auto_49575 ) ) ( not ( = ?auto_49581 ?auto_49575 ) ) ( not ( = ?auto_49580 ?auto_49594 ) ) ( not ( = ?auto_49578 ?auto_49580 ) ) ( not ( = ?auto_49590 ?auto_49580 ) ) ( not ( = ?auto_49584 ?auto_49580 ) ) ( HOIST-AT ?auto_49586 ?auto_49580 ) ( not ( = ?auto_49587 ?auto_49586 ) ) ( not ( = ?auto_49585 ?auto_49586 ) ) ( not ( = ?auto_49582 ?auto_49586 ) ) ( not ( = ?auto_49583 ?auto_49586 ) ) ( AVAILABLE ?auto_49586 ) ( SURFACE-AT ?auto_49589 ?auto_49580 ) ( ON ?auto_49589 ?auto_49588 ) ( CLEAR ?auto_49589 ) ( not ( = ?auto_49573 ?auto_49588 ) ) ( not ( = ?auto_49574 ?auto_49588 ) ) ( not ( = ?auto_49576 ?auto_49588 ) ) ( not ( = ?auto_49577 ?auto_49588 ) ) ( not ( = ?auto_49579 ?auto_49588 ) ) ( not ( = ?auto_49589 ?auto_49588 ) ) ( not ( = ?auto_49581 ?auto_49588 ) ) ( not ( = ?auto_49575 ?auto_49588 ) ) ( SURFACE-AT ?auto_49591 ?auto_49594 ) ( CLEAR ?auto_49591 ) ( IS-CRATE ?auto_49575 ) ( not ( = ?auto_49573 ?auto_49591 ) ) ( not ( = ?auto_49574 ?auto_49591 ) ) ( not ( = ?auto_49576 ?auto_49591 ) ) ( not ( = ?auto_49577 ?auto_49591 ) ) ( not ( = ?auto_49579 ?auto_49591 ) ) ( not ( = ?auto_49589 ?auto_49591 ) ) ( not ( = ?auto_49581 ?auto_49591 ) ) ( not ( = ?auto_49575 ?auto_49591 ) ) ( not ( = ?auto_49588 ?auto_49591 ) ) ( AVAILABLE ?auto_49587 ) ( TRUCK-AT ?auto_49593 ?auto_49592 ) ( not ( = ?auto_49592 ?auto_49594 ) ) ( not ( = ?auto_49578 ?auto_49592 ) ) ( not ( = ?auto_49590 ?auto_49592 ) ) ( not ( = ?auto_49584 ?auto_49592 ) ) ( not ( = ?auto_49580 ?auto_49592 ) ) ( HOIST-AT ?auto_49595 ?auto_49592 ) ( LIFTING ?auto_49595 ?auto_49575 ) ( not ( = ?auto_49587 ?auto_49595 ) ) ( not ( = ?auto_49585 ?auto_49595 ) ) ( not ( = ?auto_49582 ?auto_49595 ) ) ( not ( = ?auto_49583 ?auto_49595 ) ) ( not ( = ?auto_49586 ?auto_49595 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49595 ?auto_49575 ?auto_49593 ?auto_49592 )
      ( MAKE-ON ?auto_49573 ?auto_49574 )
      ( MAKE-ON-VERIFY ?auto_49573 ?auto_49574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49596 - SURFACE
      ?auto_49597 - SURFACE
    )
    :vars
    (
      ?auto_49616 - HOIST
      ?auto_49607 - PLACE
      ?auto_49618 - PLACE
      ?auto_49600 - HOIST
      ?auto_49605 - SURFACE
      ?auto_49617 - SURFACE
      ?auto_49611 - PLACE
      ?auto_49613 - HOIST
      ?auto_49599 - SURFACE
      ?auto_49612 - SURFACE
      ?auto_49615 - PLACE
      ?auto_49609 - HOIST
      ?auto_49608 - SURFACE
      ?auto_49603 - SURFACE
      ?auto_49606 - PLACE
      ?auto_49604 - HOIST
      ?auto_49614 - SURFACE
      ?auto_49602 - SURFACE
      ?auto_49601 - TRUCK
      ?auto_49598 - PLACE
      ?auto_49610 - HOIST
      ?auto_49619 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49616 ?auto_49607 ) ( IS-CRATE ?auto_49596 ) ( not ( = ?auto_49596 ?auto_49597 ) ) ( not ( = ?auto_49618 ?auto_49607 ) ) ( HOIST-AT ?auto_49600 ?auto_49618 ) ( not ( = ?auto_49616 ?auto_49600 ) ) ( AVAILABLE ?auto_49600 ) ( SURFACE-AT ?auto_49596 ?auto_49618 ) ( ON ?auto_49596 ?auto_49605 ) ( CLEAR ?auto_49596 ) ( not ( = ?auto_49596 ?auto_49605 ) ) ( not ( = ?auto_49597 ?auto_49605 ) ) ( IS-CRATE ?auto_49597 ) ( not ( = ?auto_49596 ?auto_49617 ) ) ( not ( = ?auto_49597 ?auto_49617 ) ) ( not ( = ?auto_49605 ?auto_49617 ) ) ( not ( = ?auto_49611 ?auto_49607 ) ) ( not ( = ?auto_49618 ?auto_49611 ) ) ( HOIST-AT ?auto_49613 ?auto_49611 ) ( not ( = ?auto_49616 ?auto_49613 ) ) ( not ( = ?auto_49600 ?auto_49613 ) ) ( AVAILABLE ?auto_49613 ) ( SURFACE-AT ?auto_49597 ?auto_49611 ) ( ON ?auto_49597 ?auto_49599 ) ( CLEAR ?auto_49597 ) ( not ( = ?auto_49596 ?auto_49599 ) ) ( not ( = ?auto_49597 ?auto_49599 ) ) ( not ( = ?auto_49605 ?auto_49599 ) ) ( not ( = ?auto_49617 ?auto_49599 ) ) ( IS-CRATE ?auto_49617 ) ( not ( = ?auto_49596 ?auto_49612 ) ) ( not ( = ?auto_49597 ?auto_49612 ) ) ( not ( = ?auto_49605 ?auto_49612 ) ) ( not ( = ?auto_49617 ?auto_49612 ) ) ( not ( = ?auto_49599 ?auto_49612 ) ) ( not ( = ?auto_49615 ?auto_49607 ) ) ( not ( = ?auto_49618 ?auto_49615 ) ) ( not ( = ?auto_49611 ?auto_49615 ) ) ( HOIST-AT ?auto_49609 ?auto_49615 ) ( not ( = ?auto_49616 ?auto_49609 ) ) ( not ( = ?auto_49600 ?auto_49609 ) ) ( not ( = ?auto_49613 ?auto_49609 ) ) ( AVAILABLE ?auto_49609 ) ( SURFACE-AT ?auto_49617 ?auto_49615 ) ( ON ?auto_49617 ?auto_49608 ) ( CLEAR ?auto_49617 ) ( not ( = ?auto_49596 ?auto_49608 ) ) ( not ( = ?auto_49597 ?auto_49608 ) ) ( not ( = ?auto_49605 ?auto_49608 ) ) ( not ( = ?auto_49617 ?auto_49608 ) ) ( not ( = ?auto_49599 ?auto_49608 ) ) ( not ( = ?auto_49612 ?auto_49608 ) ) ( IS-CRATE ?auto_49612 ) ( not ( = ?auto_49596 ?auto_49603 ) ) ( not ( = ?auto_49597 ?auto_49603 ) ) ( not ( = ?auto_49605 ?auto_49603 ) ) ( not ( = ?auto_49617 ?auto_49603 ) ) ( not ( = ?auto_49599 ?auto_49603 ) ) ( not ( = ?auto_49612 ?auto_49603 ) ) ( not ( = ?auto_49608 ?auto_49603 ) ) ( not ( = ?auto_49606 ?auto_49607 ) ) ( not ( = ?auto_49618 ?auto_49606 ) ) ( not ( = ?auto_49611 ?auto_49606 ) ) ( not ( = ?auto_49615 ?auto_49606 ) ) ( HOIST-AT ?auto_49604 ?auto_49606 ) ( not ( = ?auto_49616 ?auto_49604 ) ) ( not ( = ?auto_49600 ?auto_49604 ) ) ( not ( = ?auto_49613 ?auto_49604 ) ) ( not ( = ?auto_49609 ?auto_49604 ) ) ( AVAILABLE ?auto_49604 ) ( SURFACE-AT ?auto_49612 ?auto_49606 ) ( ON ?auto_49612 ?auto_49614 ) ( CLEAR ?auto_49612 ) ( not ( = ?auto_49596 ?auto_49614 ) ) ( not ( = ?auto_49597 ?auto_49614 ) ) ( not ( = ?auto_49605 ?auto_49614 ) ) ( not ( = ?auto_49617 ?auto_49614 ) ) ( not ( = ?auto_49599 ?auto_49614 ) ) ( not ( = ?auto_49612 ?auto_49614 ) ) ( not ( = ?auto_49608 ?auto_49614 ) ) ( not ( = ?auto_49603 ?auto_49614 ) ) ( SURFACE-AT ?auto_49602 ?auto_49607 ) ( CLEAR ?auto_49602 ) ( IS-CRATE ?auto_49603 ) ( not ( = ?auto_49596 ?auto_49602 ) ) ( not ( = ?auto_49597 ?auto_49602 ) ) ( not ( = ?auto_49605 ?auto_49602 ) ) ( not ( = ?auto_49617 ?auto_49602 ) ) ( not ( = ?auto_49599 ?auto_49602 ) ) ( not ( = ?auto_49612 ?auto_49602 ) ) ( not ( = ?auto_49608 ?auto_49602 ) ) ( not ( = ?auto_49603 ?auto_49602 ) ) ( not ( = ?auto_49614 ?auto_49602 ) ) ( AVAILABLE ?auto_49616 ) ( TRUCK-AT ?auto_49601 ?auto_49598 ) ( not ( = ?auto_49598 ?auto_49607 ) ) ( not ( = ?auto_49618 ?auto_49598 ) ) ( not ( = ?auto_49611 ?auto_49598 ) ) ( not ( = ?auto_49615 ?auto_49598 ) ) ( not ( = ?auto_49606 ?auto_49598 ) ) ( HOIST-AT ?auto_49610 ?auto_49598 ) ( not ( = ?auto_49616 ?auto_49610 ) ) ( not ( = ?auto_49600 ?auto_49610 ) ) ( not ( = ?auto_49613 ?auto_49610 ) ) ( not ( = ?auto_49609 ?auto_49610 ) ) ( not ( = ?auto_49604 ?auto_49610 ) ) ( AVAILABLE ?auto_49610 ) ( SURFACE-AT ?auto_49603 ?auto_49598 ) ( ON ?auto_49603 ?auto_49619 ) ( CLEAR ?auto_49603 ) ( not ( = ?auto_49596 ?auto_49619 ) ) ( not ( = ?auto_49597 ?auto_49619 ) ) ( not ( = ?auto_49605 ?auto_49619 ) ) ( not ( = ?auto_49617 ?auto_49619 ) ) ( not ( = ?auto_49599 ?auto_49619 ) ) ( not ( = ?auto_49612 ?auto_49619 ) ) ( not ( = ?auto_49608 ?auto_49619 ) ) ( not ( = ?auto_49603 ?auto_49619 ) ) ( not ( = ?auto_49614 ?auto_49619 ) ) ( not ( = ?auto_49602 ?auto_49619 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49610 ?auto_49603 ?auto_49619 ?auto_49598 )
      ( MAKE-ON ?auto_49596 ?auto_49597 )
      ( MAKE-ON-VERIFY ?auto_49596 ?auto_49597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49620 - SURFACE
      ?auto_49621 - SURFACE
    )
    :vars
    (
      ?auto_49628 - HOIST
      ?auto_49637 - PLACE
      ?auto_49633 - PLACE
      ?auto_49623 - HOIST
      ?auto_49624 - SURFACE
      ?auto_49632 - SURFACE
      ?auto_49622 - PLACE
      ?auto_49627 - HOIST
      ?auto_49634 - SURFACE
      ?auto_49625 - SURFACE
      ?auto_49630 - PLACE
      ?auto_49635 - HOIST
      ?auto_49642 - SURFACE
      ?auto_49643 - SURFACE
      ?auto_49640 - PLACE
      ?auto_49626 - HOIST
      ?auto_49631 - SURFACE
      ?auto_49629 - SURFACE
      ?auto_49641 - PLACE
      ?auto_49638 - HOIST
      ?auto_49639 - SURFACE
      ?auto_49636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49628 ?auto_49637 ) ( IS-CRATE ?auto_49620 ) ( not ( = ?auto_49620 ?auto_49621 ) ) ( not ( = ?auto_49633 ?auto_49637 ) ) ( HOIST-AT ?auto_49623 ?auto_49633 ) ( not ( = ?auto_49628 ?auto_49623 ) ) ( AVAILABLE ?auto_49623 ) ( SURFACE-AT ?auto_49620 ?auto_49633 ) ( ON ?auto_49620 ?auto_49624 ) ( CLEAR ?auto_49620 ) ( not ( = ?auto_49620 ?auto_49624 ) ) ( not ( = ?auto_49621 ?auto_49624 ) ) ( IS-CRATE ?auto_49621 ) ( not ( = ?auto_49620 ?auto_49632 ) ) ( not ( = ?auto_49621 ?auto_49632 ) ) ( not ( = ?auto_49624 ?auto_49632 ) ) ( not ( = ?auto_49622 ?auto_49637 ) ) ( not ( = ?auto_49633 ?auto_49622 ) ) ( HOIST-AT ?auto_49627 ?auto_49622 ) ( not ( = ?auto_49628 ?auto_49627 ) ) ( not ( = ?auto_49623 ?auto_49627 ) ) ( AVAILABLE ?auto_49627 ) ( SURFACE-AT ?auto_49621 ?auto_49622 ) ( ON ?auto_49621 ?auto_49634 ) ( CLEAR ?auto_49621 ) ( not ( = ?auto_49620 ?auto_49634 ) ) ( not ( = ?auto_49621 ?auto_49634 ) ) ( not ( = ?auto_49624 ?auto_49634 ) ) ( not ( = ?auto_49632 ?auto_49634 ) ) ( IS-CRATE ?auto_49632 ) ( not ( = ?auto_49620 ?auto_49625 ) ) ( not ( = ?auto_49621 ?auto_49625 ) ) ( not ( = ?auto_49624 ?auto_49625 ) ) ( not ( = ?auto_49632 ?auto_49625 ) ) ( not ( = ?auto_49634 ?auto_49625 ) ) ( not ( = ?auto_49630 ?auto_49637 ) ) ( not ( = ?auto_49633 ?auto_49630 ) ) ( not ( = ?auto_49622 ?auto_49630 ) ) ( HOIST-AT ?auto_49635 ?auto_49630 ) ( not ( = ?auto_49628 ?auto_49635 ) ) ( not ( = ?auto_49623 ?auto_49635 ) ) ( not ( = ?auto_49627 ?auto_49635 ) ) ( AVAILABLE ?auto_49635 ) ( SURFACE-AT ?auto_49632 ?auto_49630 ) ( ON ?auto_49632 ?auto_49642 ) ( CLEAR ?auto_49632 ) ( not ( = ?auto_49620 ?auto_49642 ) ) ( not ( = ?auto_49621 ?auto_49642 ) ) ( not ( = ?auto_49624 ?auto_49642 ) ) ( not ( = ?auto_49632 ?auto_49642 ) ) ( not ( = ?auto_49634 ?auto_49642 ) ) ( not ( = ?auto_49625 ?auto_49642 ) ) ( IS-CRATE ?auto_49625 ) ( not ( = ?auto_49620 ?auto_49643 ) ) ( not ( = ?auto_49621 ?auto_49643 ) ) ( not ( = ?auto_49624 ?auto_49643 ) ) ( not ( = ?auto_49632 ?auto_49643 ) ) ( not ( = ?auto_49634 ?auto_49643 ) ) ( not ( = ?auto_49625 ?auto_49643 ) ) ( not ( = ?auto_49642 ?auto_49643 ) ) ( not ( = ?auto_49640 ?auto_49637 ) ) ( not ( = ?auto_49633 ?auto_49640 ) ) ( not ( = ?auto_49622 ?auto_49640 ) ) ( not ( = ?auto_49630 ?auto_49640 ) ) ( HOIST-AT ?auto_49626 ?auto_49640 ) ( not ( = ?auto_49628 ?auto_49626 ) ) ( not ( = ?auto_49623 ?auto_49626 ) ) ( not ( = ?auto_49627 ?auto_49626 ) ) ( not ( = ?auto_49635 ?auto_49626 ) ) ( AVAILABLE ?auto_49626 ) ( SURFACE-AT ?auto_49625 ?auto_49640 ) ( ON ?auto_49625 ?auto_49631 ) ( CLEAR ?auto_49625 ) ( not ( = ?auto_49620 ?auto_49631 ) ) ( not ( = ?auto_49621 ?auto_49631 ) ) ( not ( = ?auto_49624 ?auto_49631 ) ) ( not ( = ?auto_49632 ?auto_49631 ) ) ( not ( = ?auto_49634 ?auto_49631 ) ) ( not ( = ?auto_49625 ?auto_49631 ) ) ( not ( = ?auto_49642 ?auto_49631 ) ) ( not ( = ?auto_49643 ?auto_49631 ) ) ( SURFACE-AT ?auto_49629 ?auto_49637 ) ( CLEAR ?auto_49629 ) ( IS-CRATE ?auto_49643 ) ( not ( = ?auto_49620 ?auto_49629 ) ) ( not ( = ?auto_49621 ?auto_49629 ) ) ( not ( = ?auto_49624 ?auto_49629 ) ) ( not ( = ?auto_49632 ?auto_49629 ) ) ( not ( = ?auto_49634 ?auto_49629 ) ) ( not ( = ?auto_49625 ?auto_49629 ) ) ( not ( = ?auto_49642 ?auto_49629 ) ) ( not ( = ?auto_49643 ?auto_49629 ) ) ( not ( = ?auto_49631 ?auto_49629 ) ) ( AVAILABLE ?auto_49628 ) ( not ( = ?auto_49641 ?auto_49637 ) ) ( not ( = ?auto_49633 ?auto_49641 ) ) ( not ( = ?auto_49622 ?auto_49641 ) ) ( not ( = ?auto_49630 ?auto_49641 ) ) ( not ( = ?auto_49640 ?auto_49641 ) ) ( HOIST-AT ?auto_49638 ?auto_49641 ) ( not ( = ?auto_49628 ?auto_49638 ) ) ( not ( = ?auto_49623 ?auto_49638 ) ) ( not ( = ?auto_49627 ?auto_49638 ) ) ( not ( = ?auto_49635 ?auto_49638 ) ) ( not ( = ?auto_49626 ?auto_49638 ) ) ( AVAILABLE ?auto_49638 ) ( SURFACE-AT ?auto_49643 ?auto_49641 ) ( ON ?auto_49643 ?auto_49639 ) ( CLEAR ?auto_49643 ) ( not ( = ?auto_49620 ?auto_49639 ) ) ( not ( = ?auto_49621 ?auto_49639 ) ) ( not ( = ?auto_49624 ?auto_49639 ) ) ( not ( = ?auto_49632 ?auto_49639 ) ) ( not ( = ?auto_49634 ?auto_49639 ) ) ( not ( = ?auto_49625 ?auto_49639 ) ) ( not ( = ?auto_49642 ?auto_49639 ) ) ( not ( = ?auto_49643 ?auto_49639 ) ) ( not ( = ?auto_49631 ?auto_49639 ) ) ( not ( = ?auto_49629 ?auto_49639 ) ) ( TRUCK-AT ?auto_49636 ?auto_49637 ) )
    :subtasks
    ( ( !DRIVE ?auto_49636 ?auto_49637 ?auto_49641 )
      ( MAKE-ON ?auto_49620 ?auto_49621 )
      ( MAKE-ON-VERIFY ?auto_49620 ?auto_49621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49644 - SURFACE
      ?auto_49645 - SURFACE
    )
    :vars
    (
      ?auto_49656 - HOIST
      ?auto_49651 - PLACE
      ?auto_49657 - PLACE
      ?auto_49661 - HOIST
      ?auto_49649 - SURFACE
      ?auto_49655 - SURFACE
      ?auto_49658 - PLACE
      ?auto_49648 - HOIST
      ?auto_49652 - SURFACE
      ?auto_49647 - SURFACE
      ?auto_49650 - PLACE
      ?auto_49654 - HOIST
      ?auto_49667 - SURFACE
      ?auto_49653 - SURFACE
      ?auto_49665 - PLACE
      ?auto_49660 - HOIST
      ?auto_49646 - SURFACE
      ?auto_49662 - SURFACE
      ?auto_49666 - PLACE
      ?auto_49663 - HOIST
      ?auto_49664 - SURFACE
      ?auto_49659 - TRUCK
      ?auto_49668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49656 ?auto_49651 ) ( IS-CRATE ?auto_49644 ) ( not ( = ?auto_49644 ?auto_49645 ) ) ( not ( = ?auto_49657 ?auto_49651 ) ) ( HOIST-AT ?auto_49661 ?auto_49657 ) ( not ( = ?auto_49656 ?auto_49661 ) ) ( AVAILABLE ?auto_49661 ) ( SURFACE-AT ?auto_49644 ?auto_49657 ) ( ON ?auto_49644 ?auto_49649 ) ( CLEAR ?auto_49644 ) ( not ( = ?auto_49644 ?auto_49649 ) ) ( not ( = ?auto_49645 ?auto_49649 ) ) ( IS-CRATE ?auto_49645 ) ( not ( = ?auto_49644 ?auto_49655 ) ) ( not ( = ?auto_49645 ?auto_49655 ) ) ( not ( = ?auto_49649 ?auto_49655 ) ) ( not ( = ?auto_49658 ?auto_49651 ) ) ( not ( = ?auto_49657 ?auto_49658 ) ) ( HOIST-AT ?auto_49648 ?auto_49658 ) ( not ( = ?auto_49656 ?auto_49648 ) ) ( not ( = ?auto_49661 ?auto_49648 ) ) ( AVAILABLE ?auto_49648 ) ( SURFACE-AT ?auto_49645 ?auto_49658 ) ( ON ?auto_49645 ?auto_49652 ) ( CLEAR ?auto_49645 ) ( not ( = ?auto_49644 ?auto_49652 ) ) ( not ( = ?auto_49645 ?auto_49652 ) ) ( not ( = ?auto_49649 ?auto_49652 ) ) ( not ( = ?auto_49655 ?auto_49652 ) ) ( IS-CRATE ?auto_49655 ) ( not ( = ?auto_49644 ?auto_49647 ) ) ( not ( = ?auto_49645 ?auto_49647 ) ) ( not ( = ?auto_49649 ?auto_49647 ) ) ( not ( = ?auto_49655 ?auto_49647 ) ) ( not ( = ?auto_49652 ?auto_49647 ) ) ( not ( = ?auto_49650 ?auto_49651 ) ) ( not ( = ?auto_49657 ?auto_49650 ) ) ( not ( = ?auto_49658 ?auto_49650 ) ) ( HOIST-AT ?auto_49654 ?auto_49650 ) ( not ( = ?auto_49656 ?auto_49654 ) ) ( not ( = ?auto_49661 ?auto_49654 ) ) ( not ( = ?auto_49648 ?auto_49654 ) ) ( AVAILABLE ?auto_49654 ) ( SURFACE-AT ?auto_49655 ?auto_49650 ) ( ON ?auto_49655 ?auto_49667 ) ( CLEAR ?auto_49655 ) ( not ( = ?auto_49644 ?auto_49667 ) ) ( not ( = ?auto_49645 ?auto_49667 ) ) ( not ( = ?auto_49649 ?auto_49667 ) ) ( not ( = ?auto_49655 ?auto_49667 ) ) ( not ( = ?auto_49652 ?auto_49667 ) ) ( not ( = ?auto_49647 ?auto_49667 ) ) ( IS-CRATE ?auto_49647 ) ( not ( = ?auto_49644 ?auto_49653 ) ) ( not ( = ?auto_49645 ?auto_49653 ) ) ( not ( = ?auto_49649 ?auto_49653 ) ) ( not ( = ?auto_49655 ?auto_49653 ) ) ( not ( = ?auto_49652 ?auto_49653 ) ) ( not ( = ?auto_49647 ?auto_49653 ) ) ( not ( = ?auto_49667 ?auto_49653 ) ) ( not ( = ?auto_49665 ?auto_49651 ) ) ( not ( = ?auto_49657 ?auto_49665 ) ) ( not ( = ?auto_49658 ?auto_49665 ) ) ( not ( = ?auto_49650 ?auto_49665 ) ) ( HOIST-AT ?auto_49660 ?auto_49665 ) ( not ( = ?auto_49656 ?auto_49660 ) ) ( not ( = ?auto_49661 ?auto_49660 ) ) ( not ( = ?auto_49648 ?auto_49660 ) ) ( not ( = ?auto_49654 ?auto_49660 ) ) ( AVAILABLE ?auto_49660 ) ( SURFACE-AT ?auto_49647 ?auto_49665 ) ( ON ?auto_49647 ?auto_49646 ) ( CLEAR ?auto_49647 ) ( not ( = ?auto_49644 ?auto_49646 ) ) ( not ( = ?auto_49645 ?auto_49646 ) ) ( not ( = ?auto_49649 ?auto_49646 ) ) ( not ( = ?auto_49655 ?auto_49646 ) ) ( not ( = ?auto_49652 ?auto_49646 ) ) ( not ( = ?auto_49647 ?auto_49646 ) ) ( not ( = ?auto_49667 ?auto_49646 ) ) ( not ( = ?auto_49653 ?auto_49646 ) ) ( IS-CRATE ?auto_49653 ) ( not ( = ?auto_49644 ?auto_49662 ) ) ( not ( = ?auto_49645 ?auto_49662 ) ) ( not ( = ?auto_49649 ?auto_49662 ) ) ( not ( = ?auto_49655 ?auto_49662 ) ) ( not ( = ?auto_49652 ?auto_49662 ) ) ( not ( = ?auto_49647 ?auto_49662 ) ) ( not ( = ?auto_49667 ?auto_49662 ) ) ( not ( = ?auto_49653 ?auto_49662 ) ) ( not ( = ?auto_49646 ?auto_49662 ) ) ( not ( = ?auto_49666 ?auto_49651 ) ) ( not ( = ?auto_49657 ?auto_49666 ) ) ( not ( = ?auto_49658 ?auto_49666 ) ) ( not ( = ?auto_49650 ?auto_49666 ) ) ( not ( = ?auto_49665 ?auto_49666 ) ) ( HOIST-AT ?auto_49663 ?auto_49666 ) ( not ( = ?auto_49656 ?auto_49663 ) ) ( not ( = ?auto_49661 ?auto_49663 ) ) ( not ( = ?auto_49648 ?auto_49663 ) ) ( not ( = ?auto_49654 ?auto_49663 ) ) ( not ( = ?auto_49660 ?auto_49663 ) ) ( AVAILABLE ?auto_49663 ) ( SURFACE-AT ?auto_49653 ?auto_49666 ) ( ON ?auto_49653 ?auto_49664 ) ( CLEAR ?auto_49653 ) ( not ( = ?auto_49644 ?auto_49664 ) ) ( not ( = ?auto_49645 ?auto_49664 ) ) ( not ( = ?auto_49649 ?auto_49664 ) ) ( not ( = ?auto_49655 ?auto_49664 ) ) ( not ( = ?auto_49652 ?auto_49664 ) ) ( not ( = ?auto_49647 ?auto_49664 ) ) ( not ( = ?auto_49667 ?auto_49664 ) ) ( not ( = ?auto_49653 ?auto_49664 ) ) ( not ( = ?auto_49646 ?auto_49664 ) ) ( not ( = ?auto_49662 ?auto_49664 ) ) ( TRUCK-AT ?auto_49659 ?auto_49651 ) ( SURFACE-AT ?auto_49668 ?auto_49651 ) ( CLEAR ?auto_49668 ) ( LIFTING ?auto_49656 ?auto_49662 ) ( IS-CRATE ?auto_49662 ) ( not ( = ?auto_49644 ?auto_49668 ) ) ( not ( = ?auto_49645 ?auto_49668 ) ) ( not ( = ?auto_49649 ?auto_49668 ) ) ( not ( = ?auto_49655 ?auto_49668 ) ) ( not ( = ?auto_49652 ?auto_49668 ) ) ( not ( = ?auto_49647 ?auto_49668 ) ) ( not ( = ?auto_49667 ?auto_49668 ) ) ( not ( = ?auto_49653 ?auto_49668 ) ) ( not ( = ?auto_49646 ?auto_49668 ) ) ( not ( = ?auto_49662 ?auto_49668 ) ) ( not ( = ?auto_49664 ?auto_49668 ) ) )
    :subtasks
    ( ( !DROP ?auto_49656 ?auto_49662 ?auto_49668 ?auto_49651 )
      ( MAKE-ON ?auto_49644 ?auto_49645 )
      ( MAKE-ON-VERIFY ?auto_49644 ?auto_49645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49669 - SURFACE
      ?auto_49670 - SURFACE
    )
    :vars
    (
      ?auto_49678 - HOIST
      ?auto_49692 - PLACE
      ?auto_49682 - PLACE
      ?auto_49680 - HOIST
      ?auto_49684 - SURFACE
      ?auto_49679 - SURFACE
      ?auto_49693 - PLACE
      ?auto_49686 - HOIST
      ?auto_49688 - SURFACE
      ?auto_49675 - SURFACE
      ?auto_49676 - PLACE
      ?auto_49685 - HOIST
      ?auto_49690 - SURFACE
      ?auto_49691 - SURFACE
      ?auto_49671 - PLACE
      ?auto_49687 - HOIST
      ?auto_49681 - SURFACE
      ?auto_49674 - SURFACE
      ?auto_49689 - PLACE
      ?auto_49673 - HOIST
      ?auto_49672 - SURFACE
      ?auto_49677 - TRUCK
      ?auto_49683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49678 ?auto_49692 ) ( IS-CRATE ?auto_49669 ) ( not ( = ?auto_49669 ?auto_49670 ) ) ( not ( = ?auto_49682 ?auto_49692 ) ) ( HOIST-AT ?auto_49680 ?auto_49682 ) ( not ( = ?auto_49678 ?auto_49680 ) ) ( AVAILABLE ?auto_49680 ) ( SURFACE-AT ?auto_49669 ?auto_49682 ) ( ON ?auto_49669 ?auto_49684 ) ( CLEAR ?auto_49669 ) ( not ( = ?auto_49669 ?auto_49684 ) ) ( not ( = ?auto_49670 ?auto_49684 ) ) ( IS-CRATE ?auto_49670 ) ( not ( = ?auto_49669 ?auto_49679 ) ) ( not ( = ?auto_49670 ?auto_49679 ) ) ( not ( = ?auto_49684 ?auto_49679 ) ) ( not ( = ?auto_49693 ?auto_49692 ) ) ( not ( = ?auto_49682 ?auto_49693 ) ) ( HOIST-AT ?auto_49686 ?auto_49693 ) ( not ( = ?auto_49678 ?auto_49686 ) ) ( not ( = ?auto_49680 ?auto_49686 ) ) ( AVAILABLE ?auto_49686 ) ( SURFACE-AT ?auto_49670 ?auto_49693 ) ( ON ?auto_49670 ?auto_49688 ) ( CLEAR ?auto_49670 ) ( not ( = ?auto_49669 ?auto_49688 ) ) ( not ( = ?auto_49670 ?auto_49688 ) ) ( not ( = ?auto_49684 ?auto_49688 ) ) ( not ( = ?auto_49679 ?auto_49688 ) ) ( IS-CRATE ?auto_49679 ) ( not ( = ?auto_49669 ?auto_49675 ) ) ( not ( = ?auto_49670 ?auto_49675 ) ) ( not ( = ?auto_49684 ?auto_49675 ) ) ( not ( = ?auto_49679 ?auto_49675 ) ) ( not ( = ?auto_49688 ?auto_49675 ) ) ( not ( = ?auto_49676 ?auto_49692 ) ) ( not ( = ?auto_49682 ?auto_49676 ) ) ( not ( = ?auto_49693 ?auto_49676 ) ) ( HOIST-AT ?auto_49685 ?auto_49676 ) ( not ( = ?auto_49678 ?auto_49685 ) ) ( not ( = ?auto_49680 ?auto_49685 ) ) ( not ( = ?auto_49686 ?auto_49685 ) ) ( AVAILABLE ?auto_49685 ) ( SURFACE-AT ?auto_49679 ?auto_49676 ) ( ON ?auto_49679 ?auto_49690 ) ( CLEAR ?auto_49679 ) ( not ( = ?auto_49669 ?auto_49690 ) ) ( not ( = ?auto_49670 ?auto_49690 ) ) ( not ( = ?auto_49684 ?auto_49690 ) ) ( not ( = ?auto_49679 ?auto_49690 ) ) ( not ( = ?auto_49688 ?auto_49690 ) ) ( not ( = ?auto_49675 ?auto_49690 ) ) ( IS-CRATE ?auto_49675 ) ( not ( = ?auto_49669 ?auto_49691 ) ) ( not ( = ?auto_49670 ?auto_49691 ) ) ( not ( = ?auto_49684 ?auto_49691 ) ) ( not ( = ?auto_49679 ?auto_49691 ) ) ( not ( = ?auto_49688 ?auto_49691 ) ) ( not ( = ?auto_49675 ?auto_49691 ) ) ( not ( = ?auto_49690 ?auto_49691 ) ) ( not ( = ?auto_49671 ?auto_49692 ) ) ( not ( = ?auto_49682 ?auto_49671 ) ) ( not ( = ?auto_49693 ?auto_49671 ) ) ( not ( = ?auto_49676 ?auto_49671 ) ) ( HOIST-AT ?auto_49687 ?auto_49671 ) ( not ( = ?auto_49678 ?auto_49687 ) ) ( not ( = ?auto_49680 ?auto_49687 ) ) ( not ( = ?auto_49686 ?auto_49687 ) ) ( not ( = ?auto_49685 ?auto_49687 ) ) ( AVAILABLE ?auto_49687 ) ( SURFACE-AT ?auto_49675 ?auto_49671 ) ( ON ?auto_49675 ?auto_49681 ) ( CLEAR ?auto_49675 ) ( not ( = ?auto_49669 ?auto_49681 ) ) ( not ( = ?auto_49670 ?auto_49681 ) ) ( not ( = ?auto_49684 ?auto_49681 ) ) ( not ( = ?auto_49679 ?auto_49681 ) ) ( not ( = ?auto_49688 ?auto_49681 ) ) ( not ( = ?auto_49675 ?auto_49681 ) ) ( not ( = ?auto_49690 ?auto_49681 ) ) ( not ( = ?auto_49691 ?auto_49681 ) ) ( IS-CRATE ?auto_49691 ) ( not ( = ?auto_49669 ?auto_49674 ) ) ( not ( = ?auto_49670 ?auto_49674 ) ) ( not ( = ?auto_49684 ?auto_49674 ) ) ( not ( = ?auto_49679 ?auto_49674 ) ) ( not ( = ?auto_49688 ?auto_49674 ) ) ( not ( = ?auto_49675 ?auto_49674 ) ) ( not ( = ?auto_49690 ?auto_49674 ) ) ( not ( = ?auto_49691 ?auto_49674 ) ) ( not ( = ?auto_49681 ?auto_49674 ) ) ( not ( = ?auto_49689 ?auto_49692 ) ) ( not ( = ?auto_49682 ?auto_49689 ) ) ( not ( = ?auto_49693 ?auto_49689 ) ) ( not ( = ?auto_49676 ?auto_49689 ) ) ( not ( = ?auto_49671 ?auto_49689 ) ) ( HOIST-AT ?auto_49673 ?auto_49689 ) ( not ( = ?auto_49678 ?auto_49673 ) ) ( not ( = ?auto_49680 ?auto_49673 ) ) ( not ( = ?auto_49686 ?auto_49673 ) ) ( not ( = ?auto_49685 ?auto_49673 ) ) ( not ( = ?auto_49687 ?auto_49673 ) ) ( AVAILABLE ?auto_49673 ) ( SURFACE-AT ?auto_49691 ?auto_49689 ) ( ON ?auto_49691 ?auto_49672 ) ( CLEAR ?auto_49691 ) ( not ( = ?auto_49669 ?auto_49672 ) ) ( not ( = ?auto_49670 ?auto_49672 ) ) ( not ( = ?auto_49684 ?auto_49672 ) ) ( not ( = ?auto_49679 ?auto_49672 ) ) ( not ( = ?auto_49688 ?auto_49672 ) ) ( not ( = ?auto_49675 ?auto_49672 ) ) ( not ( = ?auto_49690 ?auto_49672 ) ) ( not ( = ?auto_49691 ?auto_49672 ) ) ( not ( = ?auto_49681 ?auto_49672 ) ) ( not ( = ?auto_49674 ?auto_49672 ) ) ( TRUCK-AT ?auto_49677 ?auto_49692 ) ( SURFACE-AT ?auto_49683 ?auto_49692 ) ( CLEAR ?auto_49683 ) ( IS-CRATE ?auto_49674 ) ( not ( = ?auto_49669 ?auto_49683 ) ) ( not ( = ?auto_49670 ?auto_49683 ) ) ( not ( = ?auto_49684 ?auto_49683 ) ) ( not ( = ?auto_49679 ?auto_49683 ) ) ( not ( = ?auto_49688 ?auto_49683 ) ) ( not ( = ?auto_49675 ?auto_49683 ) ) ( not ( = ?auto_49690 ?auto_49683 ) ) ( not ( = ?auto_49691 ?auto_49683 ) ) ( not ( = ?auto_49681 ?auto_49683 ) ) ( not ( = ?auto_49674 ?auto_49683 ) ) ( not ( = ?auto_49672 ?auto_49683 ) ) ( AVAILABLE ?auto_49678 ) ( IN ?auto_49674 ?auto_49677 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49678 ?auto_49674 ?auto_49677 ?auto_49692 )
      ( MAKE-ON ?auto_49669 ?auto_49670 )
      ( MAKE-ON-VERIFY ?auto_49669 ?auto_49670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49694 - SURFACE
      ?auto_49695 - SURFACE
    )
    :vars
    (
      ?auto_49707 - HOIST
      ?auto_49712 - PLACE
      ?auto_49708 - PLACE
      ?auto_49699 - HOIST
      ?auto_49706 - SURFACE
      ?auto_49709 - SURFACE
      ?auto_49713 - PLACE
      ?auto_49714 - HOIST
      ?auto_49705 - SURFACE
      ?auto_49698 - SURFACE
      ?auto_49696 - PLACE
      ?auto_49716 - HOIST
      ?auto_49710 - SURFACE
      ?auto_49711 - SURFACE
      ?auto_49702 - PLACE
      ?auto_49703 - HOIST
      ?auto_49701 - SURFACE
      ?auto_49715 - SURFACE
      ?auto_49704 - PLACE
      ?auto_49700 - HOIST
      ?auto_49697 - SURFACE
      ?auto_49717 - SURFACE
      ?auto_49718 - TRUCK
      ?auto_49719 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49707 ?auto_49712 ) ( IS-CRATE ?auto_49694 ) ( not ( = ?auto_49694 ?auto_49695 ) ) ( not ( = ?auto_49708 ?auto_49712 ) ) ( HOIST-AT ?auto_49699 ?auto_49708 ) ( not ( = ?auto_49707 ?auto_49699 ) ) ( AVAILABLE ?auto_49699 ) ( SURFACE-AT ?auto_49694 ?auto_49708 ) ( ON ?auto_49694 ?auto_49706 ) ( CLEAR ?auto_49694 ) ( not ( = ?auto_49694 ?auto_49706 ) ) ( not ( = ?auto_49695 ?auto_49706 ) ) ( IS-CRATE ?auto_49695 ) ( not ( = ?auto_49694 ?auto_49709 ) ) ( not ( = ?auto_49695 ?auto_49709 ) ) ( not ( = ?auto_49706 ?auto_49709 ) ) ( not ( = ?auto_49713 ?auto_49712 ) ) ( not ( = ?auto_49708 ?auto_49713 ) ) ( HOIST-AT ?auto_49714 ?auto_49713 ) ( not ( = ?auto_49707 ?auto_49714 ) ) ( not ( = ?auto_49699 ?auto_49714 ) ) ( AVAILABLE ?auto_49714 ) ( SURFACE-AT ?auto_49695 ?auto_49713 ) ( ON ?auto_49695 ?auto_49705 ) ( CLEAR ?auto_49695 ) ( not ( = ?auto_49694 ?auto_49705 ) ) ( not ( = ?auto_49695 ?auto_49705 ) ) ( not ( = ?auto_49706 ?auto_49705 ) ) ( not ( = ?auto_49709 ?auto_49705 ) ) ( IS-CRATE ?auto_49709 ) ( not ( = ?auto_49694 ?auto_49698 ) ) ( not ( = ?auto_49695 ?auto_49698 ) ) ( not ( = ?auto_49706 ?auto_49698 ) ) ( not ( = ?auto_49709 ?auto_49698 ) ) ( not ( = ?auto_49705 ?auto_49698 ) ) ( not ( = ?auto_49696 ?auto_49712 ) ) ( not ( = ?auto_49708 ?auto_49696 ) ) ( not ( = ?auto_49713 ?auto_49696 ) ) ( HOIST-AT ?auto_49716 ?auto_49696 ) ( not ( = ?auto_49707 ?auto_49716 ) ) ( not ( = ?auto_49699 ?auto_49716 ) ) ( not ( = ?auto_49714 ?auto_49716 ) ) ( AVAILABLE ?auto_49716 ) ( SURFACE-AT ?auto_49709 ?auto_49696 ) ( ON ?auto_49709 ?auto_49710 ) ( CLEAR ?auto_49709 ) ( not ( = ?auto_49694 ?auto_49710 ) ) ( not ( = ?auto_49695 ?auto_49710 ) ) ( not ( = ?auto_49706 ?auto_49710 ) ) ( not ( = ?auto_49709 ?auto_49710 ) ) ( not ( = ?auto_49705 ?auto_49710 ) ) ( not ( = ?auto_49698 ?auto_49710 ) ) ( IS-CRATE ?auto_49698 ) ( not ( = ?auto_49694 ?auto_49711 ) ) ( not ( = ?auto_49695 ?auto_49711 ) ) ( not ( = ?auto_49706 ?auto_49711 ) ) ( not ( = ?auto_49709 ?auto_49711 ) ) ( not ( = ?auto_49705 ?auto_49711 ) ) ( not ( = ?auto_49698 ?auto_49711 ) ) ( not ( = ?auto_49710 ?auto_49711 ) ) ( not ( = ?auto_49702 ?auto_49712 ) ) ( not ( = ?auto_49708 ?auto_49702 ) ) ( not ( = ?auto_49713 ?auto_49702 ) ) ( not ( = ?auto_49696 ?auto_49702 ) ) ( HOIST-AT ?auto_49703 ?auto_49702 ) ( not ( = ?auto_49707 ?auto_49703 ) ) ( not ( = ?auto_49699 ?auto_49703 ) ) ( not ( = ?auto_49714 ?auto_49703 ) ) ( not ( = ?auto_49716 ?auto_49703 ) ) ( AVAILABLE ?auto_49703 ) ( SURFACE-AT ?auto_49698 ?auto_49702 ) ( ON ?auto_49698 ?auto_49701 ) ( CLEAR ?auto_49698 ) ( not ( = ?auto_49694 ?auto_49701 ) ) ( not ( = ?auto_49695 ?auto_49701 ) ) ( not ( = ?auto_49706 ?auto_49701 ) ) ( not ( = ?auto_49709 ?auto_49701 ) ) ( not ( = ?auto_49705 ?auto_49701 ) ) ( not ( = ?auto_49698 ?auto_49701 ) ) ( not ( = ?auto_49710 ?auto_49701 ) ) ( not ( = ?auto_49711 ?auto_49701 ) ) ( IS-CRATE ?auto_49711 ) ( not ( = ?auto_49694 ?auto_49715 ) ) ( not ( = ?auto_49695 ?auto_49715 ) ) ( not ( = ?auto_49706 ?auto_49715 ) ) ( not ( = ?auto_49709 ?auto_49715 ) ) ( not ( = ?auto_49705 ?auto_49715 ) ) ( not ( = ?auto_49698 ?auto_49715 ) ) ( not ( = ?auto_49710 ?auto_49715 ) ) ( not ( = ?auto_49711 ?auto_49715 ) ) ( not ( = ?auto_49701 ?auto_49715 ) ) ( not ( = ?auto_49704 ?auto_49712 ) ) ( not ( = ?auto_49708 ?auto_49704 ) ) ( not ( = ?auto_49713 ?auto_49704 ) ) ( not ( = ?auto_49696 ?auto_49704 ) ) ( not ( = ?auto_49702 ?auto_49704 ) ) ( HOIST-AT ?auto_49700 ?auto_49704 ) ( not ( = ?auto_49707 ?auto_49700 ) ) ( not ( = ?auto_49699 ?auto_49700 ) ) ( not ( = ?auto_49714 ?auto_49700 ) ) ( not ( = ?auto_49716 ?auto_49700 ) ) ( not ( = ?auto_49703 ?auto_49700 ) ) ( AVAILABLE ?auto_49700 ) ( SURFACE-AT ?auto_49711 ?auto_49704 ) ( ON ?auto_49711 ?auto_49697 ) ( CLEAR ?auto_49711 ) ( not ( = ?auto_49694 ?auto_49697 ) ) ( not ( = ?auto_49695 ?auto_49697 ) ) ( not ( = ?auto_49706 ?auto_49697 ) ) ( not ( = ?auto_49709 ?auto_49697 ) ) ( not ( = ?auto_49705 ?auto_49697 ) ) ( not ( = ?auto_49698 ?auto_49697 ) ) ( not ( = ?auto_49710 ?auto_49697 ) ) ( not ( = ?auto_49711 ?auto_49697 ) ) ( not ( = ?auto_49701 ?auto_49697 ) ) ( not ( = ?auto_49715 ?auto_49697 ) ) ( SURFACE-AT ?auto_49717 ?auto_49712 ) ( CLEAR ?auto_49717 ) ( IS-CRATE ?auto_49715 ) ( not ( = ?auto_49694 ?auto_49717 ) ) ( not ( = ?auto_49695 ?auto_49717 ) ) ( not ( = ?auto_49706 ?auto_49717 ) ) ( not ( = ?auto_49709 ?auto_49717 ) ) ( not ( = ?auto_49705 ?auto_49717 ) ) ( not ( = ?auto_49698 ?auto_49717 ) ) ( not ( = ?auto_49710 ?auto_49717 ) ) ( not ( = ?auto_49711 ?auto_49717 ) ) ( not ( = ?auto_49701 ?auto_49717 ) ) ( not ( = ?auto_49715 ?auto_49717 ) ) ( not ( = ?auto_49697 ?auto_49717 ) ) ( AVAILABLE ?auto_49707 ) ( IN ?auto_49715 ?auto_49718 ) ( TRUCK-AT ?auto_49718 ?auto_49719 ) ( not ( = ?auto_49719 ?auto_49712 ) ) ( not ( = ?auto_49708 ?auto_49719 ) ) ( not ( = ?auto_49713 ?auto_49719 ) ) ( not ( = ?auto_49696 ?auto_49719 ) ) ( not ( = ?auto_49702 ?auto_49719 ) ) ( not ( = ?auto_49704 ?auto_49719 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49718 ?auto_49719 ?auto_49712 )
      ( MAKE-ON ?auto_49694 ?auto_49695 )
      ( MAKE-ON-VERIFY ?auto_49694 ?auto_49695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49720 - SURFACE
      ?auto_49721 - SURFACE
    )
    :vars
    (
      ?auto_49733 - HOIST
      ?auto_49741 - PLACE
      ?auto_49739 - PLACE
      ?auto_49725 - HOIST
      ?auto_49731 - SURFACE
      ?auto_49729 - SURFACE
      ?auto_49742 - PLACE
      ?auto_49734 - HOIST
      ?auto_49732 - SURFACE
      ?auto_49740 - SURFACE
      ?auto_49743 - PLACE
      ?auto_49722 - HOIST
      ?auto_49736 - SURFACE
      ?auto_49727 - SURFACE
      ?auto_49728 - PLACE
      ?auto_49737 - HOIST
      ?auto_49724 - SURFACE
      ?auto_49735 - SURFACE
      ?auto_49745 - PLACE
      ?auto_49730 - HOIST
      ?auto_49738 - SURFACE
      ?auto_49723 - SURFACE
      ?auto_49726 - TRUCK
      ?auto_49744 - PLACE
      ?auto_49746 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49733 ?auto_49741 ) ( IS-CRATE ?auto_49720 ) ( not ( = ?auto_49720 ?auto_49721 ) ) ( not ( = ?auto_49739 ?auto_49741 ) ) ( HOIST-AT ?auto_49725 ?auto_49739 ) ( not ( = ?auto_49733 ?auto_49725 ) ) ( AVAILABLE ?auto_49725 ) ( SURFACE-AT ?auto_49720 ?auto_49739 ) ( ON ?auto_49720 ?auto_49731 ) ( CLEAR ?auto_49720 ) ( not ( = ?auto_49720 ?auto_49731 ) ) ( not ( = ?auto_49721 ?auto_49731 ) ) ( IS-CRATE ?auto_49721 ) ( not ( = ?auto_49720 ?auto_49729 ) ) ( not ( = ?auto_49721 ?auto_49729 ) ) ( not ( = ?auto_49731 ?auto_49729 ) ) ( not ( = ?auto_49742 ?auto_49741 ) ) ( not ( = ?auto_49739 ?auto_49742 ) ) ( HOIST-AT ?auto_49734 ?auto_49742 ) ( not ( = ?auto_49733 ?auto_49734 ) ) ( not ( = ?auto_49725 ?auto_49734 ) ) ( AVAILABLE ?auto_49734 ) ( SURFACE-AT ?auto_49721 ?auto_49742 ) ( ON ?auto_49721 ?auto_49732 ) ( CLEAR ?auto_49721 ) ( not ( = ?auto_49720 ?auto_49732 ) ) ( not ( = ?auto_49721 ?auto_49732 ) ) ( not ( = ?auto_49731 ?auto_49732 ) ) ( not ( = ?auto_49729 ?auto_49732 ) ) ( IS-CRATE ?auto_49729 ) ( not ( = ?auto_49720 ?auto_49740 ) ) ( not ( = ?auto_49721 ?auto_49740 ) ) ( not ( = ?auto_49731 ?auto_49740 ) ) ( not ( = ?auto_49729 ?auto_49740 ) ) ( not ( = ?auto_49732 ?auto_49740 ) ) ( not ( = ?auto_49743 ?auto_49741 ) ) ( not ( = ?auto_49739 ?auto_49743 ) ) ( not ( = ?auto_49742 ?auto_49743 ) ) ( HOIST-AT ?auto_49722 ?auto_49743 ) ( not ( = ?auto_49733 ?auto_49722 ) ) ( not ( = ?auto_49725 ?auto_49722 ) ) ( not ( = ?auto_49734 ?auto_49722 ) ) ( AVAILABLE ?auto_49722 ) ( SURFACE-AT ?auto_49729 ?auto_49743 ) ( ON ?auto_49729 ?auto_49736 ) ( CLEAR ?auto_49729 ) ( not ( = ?auto_49720 ?auto_49736 ) ) ( not ( = ?auto_49721 ?auto_49736 ) ) ( not ( = ?auto_49731 ?auto_49736 ) ) ( not ( = ?auto_49729 ?auto_49736 ) ) ( not ( = ?auto_49732 ?auto_49736 ) ) ( not ( = ?auto_49740 ?auto_49736 ) ) ( IS-CRATE ?auto_49740 ) ( not ( = ?auto_49720 ?auto_49727 ) ) ( not ( = ?auto_49721 ?auto_49727 ) ) ( not ( = ?auto_49731 ?auto_49727 ) ) ( not ( = ?auto_49729 ?auto_49727 ) ) ( not ( = ?auto_49732 ?auto_49727 ) ) ( not ( = ?auto_49740 ?auto_49727 ) ) ( not ( = ?auto_49736 ?auto_49727 ) ) ( not ( = ?auto_49728 ?auto_49741 ) ) ( not ( = ?auto_49739 ?auto_49728 ) ) ( not ( = ?auto_49742 ?auto_49728 ) ) ( not ( = ?auto_49743 ?auto_49728 ) ) ( HOIST-AT ?auto_49737 ?auto_49728 ) ( not ( = ?auto_49733 ?auto_49737 ) ) ( not ( = ?auto_49725 ?auto_49737 ) ) ( not ( = ?auto_49734 ?auto_49737 ) ) ( not ( = ?auto_49722 ?auto_49737 ) ) ( AVAILABLE ?auto_49737 ) ( SURFACE-AT ?auto_49740 ?auto_49728 ) ( ON ?auto_49740 ?auto_49724 ) ( CLEAR ?auto_49740 ) ( not ( = ?auto_49720 ?auto_49724 ) ) ( not ( = ?auto_49721 ?auto_49724 ) ) ( not ( = ?auto_49731 ?auto_49724 ) ) ( not ( = ?auto_49729 ?auto_49724 ) ) ( not ( = ?auto_49732 ?auto_49724 ) ) ( not ( = ?auto_49740 ?auto_49724 ) ) ( not ( = ?auto_49736 ?auto_49724 ) ) ( not ( = ?auto_49727 ?auto_49724 ) ) ( IS-CRATE ?auto_49727 ) ( not ( = ?auto_49720 ?auto_49735 ) ) ( not ( = ?auto_49721 ?auto_49735 ) ) ( not ( = ?auto_49731 ?auto_49735 ) ) ( not ( = ?auto_49729 ?auto_49735 ) ) ( not ( = ?auto_49732 ?auto_49735 ) ) ( not ( = ?auto_49740 ?auto_49735 ) ) ( not ( = ?auto_49736 ?auto_49735 ) ) ( not ( = ?auto_49727 ?auto_49735 ) ) ( not ( = ?auto_49724 ?auto_49735 ) ) ( not ( = ?auto_49745 ?auto_49741 ) ) ( not ( = ?auto_49739 ?auto_49745 ) ) ( not ( = ?auto_49742 ?auto_49745 ) ) ( not ( = ?auto_49743 ?auto_49745 ) ) ( not ( = ?auto_49728 ?auto_49745 ) ) ( HOIST-AT ?auto_49730 ?auto_49745 ) ( not ( = ?auto_49733 ?auto_49730 ) ) ( not ( = ?auto_49725 ?auto_49730 ) ) ( not ( = ?auto_49734 ?auto_49730 ) ) ( not ( = ?auto_49722 ?auto_49730 ) ) ( not ( = ?auto_49737 ?auto_49730 ) ) ( AVAILABLE ?auto_49730 ) ( SURFACE-AT ?auto_49727 ?auto_49745 ) ( ON ?auto_49727 ?auto_49738 ) ( CLEAR ?auto_49727 ) ( not ( = ?auto_49720 ?auto_49738 ) ) ( not ( = ?auto_49721 ?auto_49738 ) ) ( not ( = ?auto_49731 ?auto_49738 ) ) ( not ( = ?auto_49729 ?auto_49738 ) ) ( not ( = ?auto_49732 ?auto_49738 ) ) ( not ( = ?auto_49740 ?auto_49738 ) ) ( not ( = ?auto_49736 ?auto_49738 ) ) ( not ( = ?auto_49727 ?auto_49738 ) ) ( not ( = ?auto_49724 ?auto_49738 ) ) ( not ( = ?auto_49735 ?auto_49738 ) ) ( SURFACE-AT ?auto_49723 ?auto_49741 ) ( CLEAR ?auto_49723 ) ( IS-CRATE ?auto_49735 ) ( not ( = ?auto_49720 ?auto_49723 ) ) ( not ( = ?auto_49721 ?auto_49723 ) ) ( not ( = ?auto_49731 ?auto_49723 ) ) ( not ( = ?auto_49729 ?auto_49723 ) ) ( not ( = ?auto_49732 ?auto_49723 ) ) ( not ( = ?auto_49740 ?auto_49723 ) ) ( not ( = ?auto_49736 ?auto_49723 ) ) ( not ( = ?auto_49727 ?auto_49723 ) ) ( not ( = ?auto_49724 ?auto_49723 ) ) ( not ( = ?auto_49735 ?auto_49723 ) ) ( not ( = ?auto_49738 ?auto_49723 ) ) ( AVAILABLE ?auto_49733 ) ( TRUCK-AT ?auto_49726 ?auto_49744 ) ( not ( = ?auto_49744 ?auto_49741 ) ) ( not ( = ?auto_49739 ?auto_49744 ) ) ( not ( = ?auto_49742 ?auto_49744 ) ) ( not ( = ?auto_49743 ?auto_49744 ) ) ( not ( = ?auto_49728 ?auto_49744 ) ) ( not ( = ?auto_49745 ?auto_49744 ) ) ( HOIST-AT ?auto_49746 ?auto_49744 ) ( LIFTING ?auto_49746 ?auto_49735 ) ( not ( = ?auto_49733 ?auto_49746 ) ) ( not ( = ?auto_49725 ?auto_49746 ) ) ( not ( = ?auto_49734 ?auto_49746 ) ) ( not ( = ?auto_49722 ?auto_49746 ) ) ( not ( = ?auto_49737 ?auto_49746 ) ) ( not ( = ?auto_49730 ?auto_49746 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49746 ?auto_49735 ?auto_49726 ?auto_49744 )
      ( MAKE-ON ?auto_49720 ?auto_49721 )
      ( MAKE-ON-VERIFY ?auto_49720 ?auto_49721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49747 - SURFACE
      ?auto_49748 - SURFACE
    )
    :vars
    (
      ?auto_49769 - HOIST
      ?auto_49756 - PLACE
      ?auto_49754 - PLACE
      ?auto_49765 - HOIST
      ?auto_49752 - SURFACE
      ?auto_49763 - SURFACE
      ?auto_49757 - PLACE
      ?auto_49770 - HOIST
      ?auto_49768 - SURFACE
      ?auto_49755 - SURFACE
      ?auto_49758 - PLACE
      ?auto_49771 - HOIST
      ?auto_49772 - SURFACE
      ?auto_49762 - SURFACE
      ?auto_49750 - PLACE
      ?auto_49760 - HOIST
      ?auto_49764 - SURFACE
      ?auto_49751 - SURFACE
      ?auto_49753 - PLACE
      ?auto_49761 - HOIST
      ?auto_49749 - SURFACE
      ?auto_49766 - SURFACE
      ?auto_49767 - TRUCK
      ?auto_49759 - PLACE
      ?auto_49773 - HOIST
      ?auto_49774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49769 ?auto_49756 ) ( IS-CRATE ?auto_49747 ) ( not ( = ?auto_49747 ?auto_49748 ) ) ( not ( = ?auto_49754 ?auto_49756 ) ) ( HOIST-AT ?auto_49765 ?auto_49754 ) ( not ( = ?auto_49769 ?auto_49765 ) ) ( AVAILABLE ?auto_49765 ) ( SURFACE-AT ?auto_49747 ?auto_49754 ) ( ON ?auto_49747 ?auto_49752 ) ( CLEAR ?auto_49747 ) ( not ( = ?auto_49747 ?auto_49752 ) ) ( not ( = ?auto_49748 ?auto_49752 ) ) ( IS-CRATE ?auto_49748 ) ( not ( = ?auto_49747 ?auto_49763 ) ) ( not ( = ?auto_49748 ?auto_49763 ) ) ( not ( = ?auto_49752 ?auto_49763 ) ) ( not ( = ?auto_49757 ?auto_49756 ) ) ( not ( = ?auto_49754 ?auto_49757 ) ) ( HOIST-AT ?auto_49770 ?auto_49757 ) ( not ( = ?auto_49769 ?auto_49770 ) ) ( not ( = ?auto_49765 ?auto_49770 ) ) ( AVAILABLE ?auto_49770 ) ( SURFACE-AT ?auto_49748 ?auto_49757 ) ( ON ?auto_49748 ?auto_49768 ) ( CLEAR ?auto_49748 ) ( not ( = ?auto_49747 ?auto_49768 ) ) ( not ( = ?auto_49748 ?auto_49768 ) ) ( not ( = ?auto_49752 ?auto_49768 ) ) ( not ( = ?auto_49763 ?auto_49768 ) ) ( IS-CRATE ?auto_49763 ) ( not ( = ?auto_49747 ?auto_49755 ) ) ( not ( = ?auto_49748 ?auto_49755 ) ) ( not ( = ?auto_49752 ?auto_49755 ) ) ( not ( = ?auto_49763 ?auto_49755 ) ) ( not ( = ?auto_49768 ?auto_49755 ) ) ( not ( = ?auto_49758 ?auto_49756 ) ) ( not ( = ?auto_49754 ?auto_49758 ) ) ( not ( = ?auto_49757 ?auto_49758 ) ) ( HOIST-AT ?auto_49771 ?auto_49758 ) ( not ( = ?auto_49769 ?auto_49771 ) ) ( not ( = ?auto_49765 ?auto_49771 ) ) ( not ( = ?auto_49770 ?auto_49771 ) ) ( AVAILABLE ?auto_49771 ) ( SURFACE-AT ?auto_49763 ?auto_49758 ) ( ON ?auto_49763 ?auto_49772 ) ( CLEAR ?auto_49763 ) ( not ( = ?auto_49747 ?auto_49772 ) ) ( not ( = ?auto_49748 ?auto_49772 ) ) ( not ( = ?auto_49752 ?auto_49772 ) ) ( not ( = ?auto_49763 ?auto_49772 ) ) ( not ( = ?auto_49768 ?auto_49772 ) ) ( not ( = ?auto_49755 ?auto_49772 ) ) ( IS-CRATE ?auto_49755 ) ( not ( = ?auto_49747 ?auto_49762 ) ) ( not ( = ?auto_49748 ?auto_49762 ) ) ( not ( = ?auto_49752 ?auto_49762 ) ) ( not ( = ?auto_49763 ?auto_49762 ) ) ( not ( = ?auto_49768 ?auto_49762 ) ) ( not ( = ?auto_49755 ?auto_49762 ) ) ( not ( = ?auto_49772 ?auto_49762 ) ) ( not ( = ?auto_49750 ?auto_49756 ) ) ( not ( = ?auto_49754 ?auto_49750 ) ) ( not ( = ?auto_49757 ?auto_49750 ) ) ( not ( = ?auto_49758 ?auto_49750 ) ) ( HOIST-AT ?auto_49760 ?auto_49750 ) ( not ( = ?auto_49769 ?auto_49760 ) ) ( not ( = ?auto_49765 ?auto_49760 ) ) ( not ( = ?auto_49770 ?auto_49760 ) ) ( not ( = ?auto_49771 ?auto_49760 ) ) ( AVAILABLE ?auto_49760 ) ( SURFACE-AT ?auto_49755 ?auto_49750 ) ( ON ?auto_49755 ?auto_49764 ) ( CLEAR ?auto_49755 ) ( not ( = ?auto_49747 ?auto_49764 ) ) ( not ( = ?auto_49748 ?auto_49764 ) ) ( not ( = ?auto_49752 ?auto_49764 ) ) ( not ( = ?auto_49763 ?auto_49764 ) ) ( not ( = ?auto_49768 ?auto_49764 ) ) ( not ( = ?auto_49755 ?auto_49764 ) ) ( not ( = ?auto_49772 ?auto_49764 ) ) ( not ( = ?auto_49762 ?auto_49764 ) ) ( IS-CRATE ?auto_49762 ) ( not ( = ?auto_49747 ?auto_49751 ) ) ( not ( = ?auto_49748 ?auto_49751 ) ) ( not ( = ?auto_49752 ?auto_49751 ) ) ( not ( = ?auto_49763 ?auto_49751 ) ) ( not ( = ?auto_49768 ?auto_49751 ) ) ( not ( = ?auto_49755 ?auto_49751 ) ) ( not ( = ?auto_49772 ?auto_49751 ) ) ( not ( = ?auto_49762 ?auto_49751 ) ) ( not ( = ?auto_49764 ?auto_49751 ) ) ( not ( = ?auto_49753 ?auto_49756 ) ) ( not ( = ?auto_49754 ?auto_49753 ) ) ( not ( = ?auto_49757 ?auto_49753 ) ) ( not ( = ?auto_49758 ?auto_49753 ) ) ( not ( = ?auto_49750 ?auto_49753 ) ) ( HOIST-AT ?auto_49761 ?auto_49753 ) ( not ( = ?auto_49769 ?auto_49761 ) ) ( not ( = ?auto_49765 ?auto_49761 ) ) ( not ( = ?auto_49770 ?auto_49761 ) ) ( not ( = ?auto_49771 ?auto_49761 ) ) ( not ( = ?auto_49760 ?auto_49761 ) ) ( AVAILABLE ?auto_49761 ) ( SURFACE-AT ?auto_49762 ?auto_49753 ) ( ON ?auto_49762 ?auto_49749 ) ( CLEAR ?auto_49762 ) ( not ( = ?auto_49747 ?auto_49749 ) ) ( not ( = ?auto_49748 ?auto_49749 ) ) ( not ( = ?auto_49752 ?auto_49749 ) ) ( not ( = ?auto_49763 ?auto_49749 ) ) ( not ( = ?auto_49768 ?auto_49749 ) ) ( not ( = ?auto_49755 ?auto_49749 ) ) ( not ( = ?auto_49772 ?auto_49749 ) ) ( not ( = ?auto_49762 ?auto_49749 ) ) ( not ( = ?auto_49764 ?auto_49749 ) ) ( not ( = ?auto_49751 ?auto_49749 ) ) ( SURFACE-AT ?auto_49766 ?auto_49756 ) ( CLEAR ?auto_49766 ) ( IS-CRATE ?auto_49751 ) ( not ( = ?auto_49747 ?auto_49766 ) ) ( not ( = ?auto_49748 ?auto_49766 ) ) ( not ( = ?auto_49752 ?auto_49766 ) ) ( not ( = ?auto_49763 ?auto_49766 ) ) ( not ( = ?auto_49768 ?auto_49766 ) ) ( not ( = ?auto_49755 ?auto_49766 ) ) ( not ( = ?auto_49772 ?auto_49766 ) ) ( not ( = ?auto_49762 ?auto_49766 ) ) ( not ( = ?auto_49764 ?auto_49766 ) ) ( not ( = ?auto_49751 ?auto_49766 ) ) ( not ( = ?auto_49749 ?auto_49766 ) ) ( AVAILABLE ?auto_49769 ) ( TRUCK-AT ?auto_49767 ?auto_49759 ) ( not ( = ?auto_49759 ?auto_49756 ) ) ( not ( = ?auto_49754 ?auto_49759 ) ) ( not ( = ?auto_49757 ?auto_49759 ) ) ( not ( = ?auto_49758 ?auto_49759 ) ) ( not ( = ?auto_49750 ?auto_49759 ) ) ( not ( = ?auto_49753 ?auto_49759 ) ) ( HOIST-AT ?auto_49773 ?auto_49759 ) ( not ( = ?auto_49769 ?auto_49773 ) ) ( not ( = ?auto_49765 ?auto_49773 ) ) ( not ( = ?auto_49770 ?auto_49773 ) ) ( not ( = ?auto_49771 ?auto_49773 ) ) ( not ( = ?auto_49760 ?auto_49773 ) ) ( not ( = ?auto_49761 ?auto_49773 ) ) ( AVAILABLE ?auto_49773 ) ( SURFACE-AT ?auto_49751 ?auto_49759 ) ( ON ?auto_49751 ?auto_49774 ) ( CLEAR ?auto_49751 ) ( not ( = ?auto_49747 ?auto_49774 ) ) ( not ( = ?auto_49748 ?auto_49774 ) ) ( not ( = ?auto_49752 ?auto_49774 ) ) ( not ( = ?auto_49763 ?auto_49774 ) ) ( not ( = ?auto_49768 ?auto_49774 ) ) ( not ( = ?auto_49755 ?auto_49774 ) ) ( not ( = ?auto_49772 ?auto_49774 ) ) ( not ( = ?auto_49762 ?auto_49774 ) ) ( not ( = ?auto_49764 ?auto_49774 ) ) ( not ( = ?auto_49751 ?auto_49774 ) ) ( not ( = ?auto_49749 ?auto_49774 ) ) ( not ( = ?auto_49766 ?auto_49774 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49773 ?auto_49751 ?auto_49774 ?auto_49759 )
      ( MAKE-ON ?auto_49747 ?auto_49748 )
      ( MAKE-ON-VERIFY ?auto_49747 ?auto_49748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49775 - SURFACE
      ?auto_49776 - SURFACE
    )
    :vars
    (
      ?auto_49801 - HOIST
      ?auto_49792 - PLACE
      ?auto_49781 - PLACE
      ?auto_49784 - HOIST
      ?auto_49797 - SURFACE
      ?auto_49798 - SURFACE
      ?auto_49779 - PLACE
      ?auto_49793 - HOIST
      ?auto_49800 - SURFACE
      ?auto_49799 - SURFACE
      ?auto_49789 - PLACE
      ?auto_49794 - HOIST
      ?auto_49782 - SURFACE
      ?auto_49791 - SURFACE
      ?auto_49780 - PLACE
      ?auto_49785 - HOIST
      ?auto_49787 - SURFACE
      ?auto_49795 - SURFACE
      ?auto_49796 - PLACE
      ?auto_49786 - HOIST
      ?auto_49788 - SURFACE
      ?auto_49777 - SURFACE
      ?auto_49790 - PLACE
      ?auto_49778 - HOIST
      ?auto_49802 - SURFACE
      ?auto_49783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49801 ?auto_49792 ) ( IS-CRATE ?auto_49775 ) ( not ( = ?auto_49775 ?auto_49776 ) ) ( not ( = ?auto_49781 ?auto_49792 ) ) ( HOIST-AT ?auto_49784 ?auto_49781 ) ( not ( = ?auto_49801 ?auto_49784 ) ) ( AVAILABLE ?auto_49784 ) ( SURFACE-AT ?auto_49775 ?auto_49781 ) ( ON ?auto_49775 ?auto_49797 ) ( CLEAR ?auto_49775 ) ( not ( = ?auto_49775 ?auto_49797 ) ) ( not ( = ?auto_49776 ?auto_49797 ) ) ( IS-CRATE ?auto_49776 ) ( not ( = ?auto_49775 ?auto_49798 ) ) ( not ( = ?auto_49776 ?auto_49798 ) ) ( not ( = ?auto_49797 ?auto_49798 ) ) ( not ( = ?auto_49779 ?auto_49792 ) ) ( not ( = ?auto_49781 ?auto_49779 ) ) ( HOIST-AT ?auto_49793 ?auto_49779 ) ( not ( = ?auto_49801 ?auto_49793 ) ) ( not ( = ?auto_49784 ?auto_49793 ) ) ( AVAILABLE ?auto_49793 ) ( SURFACE-AT ?auto_49776 ?auto_49779 ) ( ON ?auto_49776 ?auto_49800 ) ( CLEAR ?auto_49776 ) ( not ( = ?auto_49775 ?auto_49800 ) ) ( not ( = ?auto_49776 ?auto_49800 ) ) ( not ( = ?auto_49797 ?auto_49800 ) ) ( not ( = ?auto_49798 ?auto_49800 ) ) ( IS-CRATE ?auto_49798 ) ( not ( = ?auto_49775 ?auto_49799 ) ) ( not ( = ?auto_49776 ?auto_49799 ) ) ( not ( = ?auto_49797 ?auto_49799 ) ) ( not ( = ?auto_49798 ?auto_49799 ) ) ( not ( = ?auto_49800 ?auto_49799 ) ) ( not ( = ?auto_49789 ?auto_49792 ) ) ( not ( = ?auto_49781 ?auto_49789 ) ) ( not ( = ?auto_49779 ?auto_49789 ) ) ( HOIST-AT ?auto_49794 ?auto_49789 ) ( not ( = ?auto_49801 ?auto_49794 ) ) ( not ( = ?auto_49784 ?auto_49794 ) ) ( not ( = ?auto_49793 ?auto_49794 ) ) ( AVAILABLE ?auto_49794 ) ( SURFACE-AT ?auto_49798 ?auto_49789 ) ( ON ?auto_49798 ?auto_49782 ) ( CLEAR ?auto_49798 ) ( not ( = ?auto_49775 ?auto_49782 ) ) ( not ( = ?auto_49776 ?auto_49782 ) ) ( not ( = ?auto_49797 ?auto_49782 ) ) ( not ( = ?auto_49798 ?auto_49782 ) ) ( not ( = ?auto_49800 ?auto_49782 ) ) ( not ( = ?auto_49799 ?auto_49782 ) ) ( IS-CRATE ?auto_49799 ) ( not ( = ?auto_49775 ?auto_49791 ) ) ( not ( = ?auto_49776 ?auto_49791 ) ) ( not ( = ?auto_49797 ?auto_49791 ) ) ( not ( = ?auto_49798 ?auto_49791 ) ) ( not ( = ?auto_49800 ?auto_49791 ) ) ( not ( = ?auto_49799 ?auto_49791 ) ) ( not ( = ?auto_49782 ?auto_49791 ) ) ( not ( = ?auto_49780 ?auto_49792 ) ) ( not ( = ?auto_49781 ?auto_49780 ) ) ( not ( = ?auto_49779 ?auto_49780 ) ) ( not ( = ?auto_49789 ?auto_49780 ) ) ( HOIST-AT ?auto_49785 ?auto_49780 ) ( not ( = ?auto_49801 ?auto_49785 ) ) ( not ( = ?auto_49784 ?auto_49785 ) ) ( not ( = ?auto_49793 ?auto_49785 ) ) ( not ( = ?auto_49794 ?auto_49785 ) ) ( AVAILABLE ?auto_49785 ) ( SURFACE-AT ?auto_49799 ?auto_49780 ) ( ON ?auto_49799 ?auto_49787 ) ( CLEAR ?auto_49799 ) ( not ( = ?auto_49775 ?auto_49787 ) ) ( not ( = ?auto_49776 ?auto_49787 ) ) ( not ( = ?auto_49797 ?auto_49787 ) ) ( not ( = ?auto_49798 ?auto_49787 ) ) ( not ( = ?auto_49800 ?auto_49787 ) ) ( not ( = ?auto_49799 ?auto_49787 ) ) ( not ( = ?auto_49782 ?auto_49787 ) ) ( not ( = ?auto_49791 ?auto_49787 ) ) ( IS-CRATE ?auto_49791 ) ( not ( = ?auto_49775 ?auto_49795 ) ) ( not ( = ?auto_49776 ?auto_49795 ) ) ( not ( = ?auto_49797 ?auto_49795 ) ) ( not ( = ?auto_49798 ?auto_49795 ) ) ( not ( = ?auto_49800 ?auto_49795 ) ) ( not ( = ?auto_49799 ?auto_49795 ) ) ( not ( = ?auto_49782 ?auto_49795 ) ) ( not ( = ?auto_49791 ?auto_49795 ) ) ( not ( = ?auto_49787 ?auto_49795 ) ) ( not ( = ?auto_49796 ?auto_49792 ) ) ( not ( = ?auto_49781 ?auto_49796 ) ) ( not ( = ?auto_49779 ?auto_49796 ) ) ( not ( = ?auto_49789 ?auto_49796 ) ) ( not ( = ?auto_49780 ?auto_49796 ) ) ( HOIST-AT ?auto_49786 ?auto_49796 ) ( not ( = ?auto_49801 ?auto_49786 ) ) ( not ( = ?auto_49784 ?auto_49786 ) ) ( not ( = ?auto_49793 ?auto_49786 ) ) ( not ( = ?auto_49794 ?auto_49786 ) ) ( not ( = ?auto_49785 ?auto_49786 ) ) ( AVAILABLE ?auto_49786 ) ( SURFACE-AT ?auto_49791 ?auto_49796 ) ( ON ?auto_49791 ?auto_49788 ) ( CLEAR ?auto_49791 ) ( not ( = ?auto_49775 ?auto_49788 ) ) ( not ( = ?auto_49776 ?auto_49788 ) ) ( not ( = ?auto_49797 ?auto_49788 ) ) ( not ( = ?auto_49798 ?auto_49788 ) ) ( not ( = ?auto_49800 ?auto_49788 ) ) ( not ( = ?auto_49799 ?auto_49788 ) ) ( not ( = ?auto_49782 ?auto_49788 ) ) ( not ( = ?auto_49791 ?auto_49788 ) ) ( not ( = ?auto_49787 ?auto_49788 ) ) ( not ( = ?auto_49795 ?auto_49788 ) ) ( SURFACE-AT ?auto_49777 ?auto_49792 ) ( CLEAR ?auto_49777 ) ( IS-CRATE ?auto_49795 ) ( not ( = ?auto_49775 ?auto_49777 ) ) ( not ( = ?auto_49776 ?auto_49777 ) ) ( not ( = ?auto_49797 ?auto_49777 ) ) ( not ( = ?auto_49798 ?auto_49777 ) ) ( not ( = ?auto_49800 ?auto_49777 ) ) ( not ( = ?auto_49799 ?auto_49777 ) ) ( not ( = ?auto_49782 ?auto_49777 ) ) ( not ( = ?auto_49791 ?auto_49777 ) ) ( not ( = ?auto_49787 ?auto_49777 ) ) ( not ( = ?auto_49795 ?auto_49777 ) ) ( not ( = ?auto_49788 ?auto_49777 ) ) ( AVAILABLE ?auto_49801 ) ( not ( = ?auto_49790 ?auto_49792 ) ) ( not ( = ?auto_49781 ?auto_49790 ) ) ( not ( = ?auto_49779 ?auto_49790 ) ) ( not ( = ?auto_49789 ?auto_49790 ) ) ( not ( = ?auto_49780 ?auto_49790 ) ) ( not ( = ?auto_49796 ?auto_49790 ) ) ( HOIST-AT ?auto_49778 ?auto_49790 ) ( not ( = ?auto_49801 ?auto_49778 ) ) ( not ( = ?auto_49784 ?auto_49778 ) ) ( not ( = ?auto_49793 ?auto_49778 ) ) ( not ( = ?auto_49794 ?auto_49778 ) ) ( not ( = ?auto_49785 ?auto_49778 ) ) ( not ( = ?auto_49786 ?auto_49778 ) ) ( AVAILABLE ?auto_49778 ) ( SURFACE-AT ?auto_49795 ?auto_49790 ) ( ON ?auto_49795 ?auto_49802 ) ( CLEAR ?auto_49795 ) ( not ( = ?auto_49775 ?auto_49802 ) ) ( not ( = ?auto_49776 ?auto_49802 ) ) ( not ( = ?auto_49797 ?auto_49802 ) ) ( not ( = ?auto_49798 ?auto_49802 ) ) ( not ( = ?auto_49800 ?auto_49802 ) ) ( not ( = ?auto_49799 ?auto_49802 ) ) ( not ( = ?auto_49782 ?auto_49802 ) ) ( not ( = ?auto_49791 ?auto_49802 ) ) ( not ( = ?auto_49787 ?auto_49802 ) ) ( not ( = ?auto_49795 ?auto_49802 ) ) ( not ( = ?auto_49788 ?auto_49802 ) ) ( not ( = ?auto_49777 ?auto_49802 ) ) ( TRUCK-AT ?auto_49783 ?auto_49792 ) )
    :subtasks
    ( ( !DRIVE ?auto_49783 ?auto_49792 ?auto_49790 )
      ( MAKE-ON ?auto_49775 ?auto_49776 )
      ( MAKE-ON-VERIFY ?auto_49775 ?auto_49776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49803 - SURFACE
      ?auto_49804 - SURFACE
    )
    :vars
    (
      ?auto_49818 - HOIST
      ?auto_49808 - PLACE
      ?auto_49811 - PLACE
      ?auto_49812 - HOIST
      ?auto_49828 - SURFACE
      ?auto_49829 - SURFACE
      ?auto_49805 - PLACE
      ?auto_49824 - HOIST
      ?auto_49823 - SURFACE
      ?auto_49830 - SURFACE
      ?auto_49815 - PLACE
      ?auto_49825 - HOIST
      ?auto_49821 - SURFACE
      ?auto_49807 - SURFACE
      ?auto_49810 - PLACE
      ?auto_49817 - HOIST
      ?auto_49809 - SURFACE
      ?auto_49826 - SURFACE
      ?auto_49827 - PLACE
      ?auto_49813 - HOIST
      ?auto_49820 - SURFACE
      ?auto_49814 - SURFACE
      ?auto_49819 - PLACE
      ?auto_49806 - HOIST
      ?auto_49822 - SURFACE
      ?auto_49816 - TRUCK
      ?auto_49831 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49818 ?auto_49808 ) ( IS-CRATE ?auto_49803 ) ( not ( = ?auto_49803 ?auto_49804 ) ) ( not ( = ?auto_49811 ?auto_49808 ) ) ( HOIST-AT ?auto_49812 ?auto_49811 ) ( not ( = ?auto_49818 ?auto_49812 ) ) ( AVAILABLE ?auto_49812 ) ( SURFACE-AT ?auto_49803 ?auto_49811 ) ( ON ?auto_49803 ?auto_49828 ) ( CLEAR ?auto_49803 ) ( not ( = ?auto_49803 ?auto_49828 ) ) ( not ( = ?auto_49804 ?auto_49828 ) ) ( IS-CRATE ?auto_49804 ) ( not ( = ?auto_49803 ?auto_49829 ) ) ( not ( = ?auto_49804 ?auto_49829 ) ) ( not ( = ?auto_49828 ?auto_49829 ) ) ( not ( = ?auto_49805 ?auto_49808 ) ) ( not ( = ?auto_49811 ?auto_49805 ) ) ( HOIST-AT ?auto_49824 ?auto_49805 ) ( not ( = ?auto_49818 ?auto_49824 ) ) ( not ( = ?auto_49812 ?auto_49824 ) ) ( AVAILABLE ?auto_49824 ) ( SURFACE-AT ?auto_49804 ?auto_49805 ) ( ON ?auto_49804 ?auto_49823 ) ( CLEAR ?auto_49804 ) ( not ( = ?auto_49803 ?auto_49823 ) ) ( not ( = ?auto_49804 ?auto_49823 ) ) ( not ( = ?auto_49828 ?auto_49823 ) ) ( not ( = ?auto_49829 ?auto_49823 ) ) ( IS-CRATE ?auto_49829 ) ( not ( = ?auto_49803 ?auto_49830 ) ) ( not ( = ?auto_49804 ?auto_49830 ) ) ( not ( = ?auto_49828 ?auto_49830 ) ) ( not ( = ?auto_49829 ?auto_49830 ) ) ( not ( = ?auto_49823 ?auto_49830 ) ) ( not ( = ?auto_49815 ?auto_49808 ) ) ( not ( = ?auto_49811 ?auto_49815 ) ) ( not ( = ?auto_49805 ?auto_49815 ) ) ( HOIST-AT ?auto_49825 ?auto_49815 ) ( not ( = ?auto_49818 ?auto_49825 ) ) ( not ( = ?auto_49812 ?auto_49825 ) ) ( not ( = ?auto_49824 ?auto_49825 ) ) ( AVAILABLE ?auto_49825 ) ( SURFACE-AT ?auto_49829 ?auto_49815 ) ( ON ?auto_49829 ?auto_49821 ) ( CLEAR ?auto_49829 ) ( not ( = ?auto_49803 ?auto_49821 ) ) ( not ( = ?auto_49804 ?auto_49821 ) ) ( not ( = ?auto_49828 ?auto_49821 ) ) ( not ( = ?auto_49829 ?auto_49821 ) ) ( not ( = ?auto_49823 ?auto_49821 ) ) ( not ( = ?auto_49830 ?auto_49821 ) ) ( IS-CRATE ?auto_49830 ) ( not ( = ?auto_49803 ?auto_49807 ) ) ( not ( = ?auto_49804 ?auto_49807 ) ) ( not ( = ?auto_49828 ?auto_49807 ) ) ( not ( = ?auto_49829 ?auto_49807 ) ) ( not ( = ?auto_49823 ?auto_49807 ) ) ( not ( = ?auto_49830 ?auto_49807 ) ) ( not ( = ?auto_49821 ?auto_49807 ) ) ( not ( = ?auto_49810 ?auto_49808 ) ) ( not ( = ?auto_49811 ?auto_49810 ) ) ( not ( = ?auto_49805 ?auto_49810 ) ) ( not ( = ?auto_49815 ?auto_49810 ) ) ( HOIST-AT ?auto_49817 ?auto_49810 ) ( not ( = ?auto_49818 ?auto_49817 ) ) ( not ( = ?auto_49812 ?auto_49817 ) ) ( not ( = ?auto_49824 ?auto_49817 ) ) ( not ( = ?auto_49825 ?auto_49817 ) ) ( AVAILABLE ?auto_49817 ) ( SURFACE-AT ?auto_49830 ?auto_49810 ) ( ON ?auto_49830 ?auto_49809 ) ( CLEAR ?auto_49830 ) ( not ( = ?auto_49803 ?auto_49809 ) ) ( not ( = ?auto_49804 ?auto_49809 ) ) ( not ( = ?auto_49828 ?auto_49809 ) ) ( not ( = ?auto_49829 ?auto_49809 ) ) ( not ( = ?auto_49823 ?auto_49809 ) ) ( not ( = ?auto_49830 ?auto_49809 ) ) ( not ( = ?auto_49821 ?auto_49809 ) ) ( not ( = ?auto_49807 ?auto_49809 ) ) ( IS-CRATE ?auto_49807 ) ( not ( = ?auto_49803 ?auto_49826 ) ) ( not ( = ?auto_49804 ?auto_49826 ) ) ( not ( = ?auto_49828 ?auto_49826 ) ) ( not ( = ?auto_49829 ?auto_49826 ) ) ( not ( = ?auto_49823 ?auto_49826 ) ) ( not ( = ?auto_49830 ?auto_49826 ) ) ( not ( = ?auto_49821 ?auto_49826 ) ) ( not ( = ?auto_49807 ?auto_49826 ) ) ( not ( = ?auto_49809 ?auto_49826 ) ) ( not ( = ?auto_49827 ?auto_49808 ) ) ( not ( = ?auto_49811 ?auto_49827 ) ) ( not ( = ?auto_49805 ?auto_49827 ) ) ( not ( = ?auto_49815 ?auto_49827 ) ) ( not ( = ?auto_49810 ?auto_49827 ) ) ( HOIST-AT ?auto_49813 ?auto_49827 ) ( not ( = ?auto_49818 ?auto_49813 ) ) ( not ( = ?auto_49812 ?auto_49813 ) ) ( not ( = ?auto_49824 ?auto_49813 ) ) ( not ( = ?auto_49825 ?auto_49813 ) ) ( not ( = ?auto_49817 ?auto_49813 ) ) ( AVAILABLE ?auto_49813 ) ( SURFACE-AT ?auto_49807 ?auto_49827 ) ( ON ?auto_49807 ?auto_49820 ) ( CLEAR ?auto_49807 ) ( not ( = ?auto_49803 ?auto_49820 ) ) ( not ( = ?auto_49804 ?auto_49820 ) ) ( not ( = ?auto_49828 ?auto_49820 ) ) ( not ( = ?auto_49829 ?auto_49820 ) ) ( not ( = ?auto_49823 ?auto_49820 ) ) ( not ( = ?auto_49830 ?auto_49820 ) ) ( not ( = ?auto_49821 ?auto_49820 ) ) ( not ( = ?auto_49807 ?auto_49820 ) ) ( not ( = ?auto_49809 ?auto_49820 ) ) ( not ( = ?auto_49826 ?auto_49820 ) ) ( IS-CRATE ?auto_49826 ) ( not ( = ?auto_49803 ?auto_49814 ) ) ( not ( = ?auto_49804 ?auto_49814 ) ) ( not ( = ?auto_49828 ?auto_49814 ) ) ( not ( = ?auto_49829 ?auto_49814 ) ) ( not ( = ?auto_49823 ?auto_49814 ) ) ( not ( = ?auto_49830 ?auto_49814 ) ) ( not ( = ?auto_49821 ?auto_49814 ) ) ( not ( = ?auto_49807 ?auto_49814 ) ) ( not ( = ?auto_49809 ?auto_49814 ) ) ( not ( = ?auto_49826 ?auto_49814 ) ) ( not ( = ?auto_49820 ?auto_49814 ) ) ( not ( = ?auto_49819 ?auto_49808 ) ) ( not ( = ?auto_49811 ?auto_49819 ) ) ( not ( = ?auto_49805 ?auto_49819 ) ) ( not ( = ?auto_49815 ?auto_49819 ) ) ( not ( = ?auto_49810 ?auto_49819 ) ) ( not ( = ?auto_49827 ?auto_49819 ) ) ( HOIST-AT ?auto_49806 ?auto_49819 ) ( not ( = ?auto_49818 ?auto_49806 ) ) ( not ( = ?auto_49812 ?auto_49806 ) ) ( not ( = ?auto_49824 ?auto_49806 ) ) ( not ( = ?auto_49825 ?auto_49806 ) ) ( not ( = ?auto_49817 ?auto_49806 ) ) ( not ( = ?auto_49813 ?auto_49806 ) ) ( AVAILABLE ?auto_49806 ) ( SURFACE-AT ?auto_49826 ?auto_49819 ) ( ON ?auto_49826 ?auto_49822 ) ( CLEAR ?auto_49826 ) ( not ( = ?auto_49803 ?auto_49822 ) ) ( not ( = ?auto_49804 ?auto_49822 ) ) ( not ( = ?auto_49828 ?auto_49822 ) ) ( not ( = ?auto_49829 ?auto_49822 ) ) ( not ( = ?auto_49823 ?auto_49822 ) ) ( not ( = ?auto_49830 ?auto_49822 ) ) ( not ( = ?auto_49821 ?auto_49822 ) ) ( not ( = ?auto_49807 ?auto_49822 ) ) ( not ( = ?auto_49809 ?auto_49822 ) ) ( not ( = ?auto_49826 ?auto_49822 ) ) ( not ( = ?auto_49820 ?auto_49822 ) ) ( not ( = ?auto_49814 ?auto_49822 ) ) ( TRUCK-AT ?auto_49816 ?auto_49808 ) ( SURFACE-AT ?auto_49831 ?auto_49808 ) ( CLEAR ?auto_49831 ) ( LIFTING ?auto_49818 ?auto_49814 ) ( IS-CRATE ?auto_49814 ) ( not ( = ?auto_49803 ?auto_49831 ) ) ( not ( = ?auto_49804 ?auto_49831 ) ) ( not ( = ?auto_49828 ?auto_49831 ) ) ( not ( = ?auto_49829 ?auto_49831 ) ) ( not ( = ?auto_49823 ?auto_49831 ) ) ( not ( = ?auto_49830 ?auto_49831 ) ) ( not ( = ?auto_49821 ?auto_49831 ) ) ( not ( = ?auto_49807 ?auto_49831 ) ) ( not ( = ?auto_49809 ?auto_49831 ) ) ( not ( = ?auto_49826 ?auto_49831 ) ) ( not ( = ?auto_49820 ?auto_49831 ) ) ( not ( = ?auto_49814 ?auto_49831 ) ) ( not ( = ?auto_49822 ?auto_49831 ) ) )
    :subtasks
    ( ( !DROP ?auto_49818 ?auto_49814 ?auto_49831 ?auto_49808 )
      ( MAKE-ON ?auto_49803 ?auto_49804 )
      ( MAKE-ON-VERIFY ?auto_49803 ?auto_49804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49832 - SURFACE
      ?auto_49833 - SURFACE
    )
    :vars
    (
      ?auto_49851 - HOIST
      ?auto_49842 - PLACE
      ?auto_49838 - PLACE
      ?auto_49852 - HOIST
      ?auto_49839 - SURFACE
      ?auto_49847 - SURFACE
      ?auto_49860 - PLACE
      ?auto_49858 - HOIST
      ?auto_49857 - SURFACE
      ?auto_49848 - SURFACE
      ?auto_49841 - PLACE
      ?auto_49837 - HOIST
      ?auto_49855 - SURFACE
      ?auto_49854 - SURFACE
      ?auto_49840 - PLACE
      ?auto_49849 - HOIST
      ?auto_49845 - SURFACE
      ?auto_49836 - SURFACE
      ?auto_49835 - PLACE
      ?auto_49859 - HOIST
      ?auto_49834 - SURFACE
      ?auto_49853 - SURFACE
      ?auto_49843 - PLACE
      ?auto_49844 - HOIST
      ?auto_49856 - SURFACE
      ?auto_49850 - TRUCK
      ?auto_49846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49851 ?auto_49842 ) ( IS-CRATE ?auto_49832 ) ( not ( = ?auto_49832 ?auto_49833 ) ) ( not ( = ?auto_49838 ?auto_49842 ) ) ( HOIST-AT ?auto_49852 ?auto_49838 ) ( not ( = ?auto_49851 ?auto_49852 ) ) ( AVAILABLE ?auto_49852 ) ( SURFACE-AT ?auto_49832 ?auto_49838 ) ( ON ?auto_49832 ?auto_49839 ) ( CLEAR ?auto_49832 ) ( not ( = ?auto_49832 ?auto_49839 ) ) ( not ( = ?auto_49833 ?auto_49839 ) ) ( IS-CRATE ?auto_49833 ) ( not ( = ?auto_49832 ?auto_49847 ) ) ( not ( = ?auto_49833 ?auto_49847 ) ) ( not ( = ?auto_49839 ?auto_49847 ) ) ( not ( = ?auto_49860 ?auto_49842 ) ) ( not ( = ?auto_49838 ?auto_49860 ) ) ( HOIST-AT ?auto_49858 ?auto_49860 ) ( not ( = ?auto_49851 ?auto_49858 ) ) ( not ( = ?auto_49852 ?auto_49858 ) ) ( AVAILABLE ?auto_49858 ) ( SURFACE-AT ?auto_49833 ?auto_49860 ) ( ON ?auto_49833 ?auto_49857 ) ( CLEAR ?auto_49833 ) ( not ( = ?auto_49832 ?auto_49857 ) ) ( not ( = ?auto_49833 ?auto_49857 ) ) ( not ( = ?auto_49839 ?auto_49857 ) ) ( not ( = ?auto_49847 ?auto_49857 ) ) ( IS-CRATE ?auto_49847 ) ( not ( = ?auto_49832 ?auto_49848 ) ) ( not ( = ?auto_49833 ?auto_49848 ) ) ( not ( = ?auto_49839 ?auto_49848 ) ) ( not ( = ?auto_49847 ?auto_49848 ) ) ( not ( = ?auto_49857 ?auto_49848 ) ) ( not ( = ?auto_49841 ?auto_49842 ) ) ( not ( = ?auto_49838 ?auto_49841 ) ) ( not ( = ?auto_49860 ?auto_49841 ) ) ( HOIST-AT ?auto_49837 ?auto_49841 ) ( not ( = ?auto_49851 ?auto_49837 ) ) ( not ( = ?auto_49852 ?auto_49837 ) ) ( not ( = ?auto_49858 ?auto_49837 ) ) ( AVAILABLE ?auto_49837 ) ( SURFACE-AT ?auto_49847 ?auto_49841 ) ( ON ?auto_49847 ?auto_49855 ) ( CLEAR ?auto_49847 ) ( not ( = ?auto_49832 ?auto_49855 ) ) ( not ( = ?auto_49833 ?auto_49855 ) ) ( not ( = ?auto_49839 ?auto_49855 ) ) ( not ( = ?auto_49847 ?auto_49855 ) ) ( not ( = ?auto_49857 ?auto_49855 ) ) ( not ( = ?auto_49848 ?auto_49855 ) ) ( IS-CRATE ?auto_49848 ) ( not ( = ?auto_49832 ?auto_49854 ) ) ( not ( = ?auto_49833 ?auto_49854 ) ) ( not ( = ?auto_49839 ?auto_49854 ) ) ( not ( = ?auto_49847 ?auto_49854 ) ) ( not ( = ?auto_49857 ?auto_49854 ) ) ( not ( = ?auto_49848 ?auto_49854 ) ) ( not ( = ?auto_49855 ?auto_49854 ) ) ( not ( = ?auto_49840 ?auto_49842 ) ) ( not ( = ?auto_49838 ?auto_49840 ) ) ( not ( = ?auto_49860 ?auto_49840 ) ) ( not ( = ?auto_49841 ?auto_49840 ) ) ( HOIST-AT ?auto_49849 ?auto_49840 ) ( not ( = ?auto_49851 ?auto_49849 ) ) ( not ( = ?auto_49852 ?auto_49849 ) ) ( not ( = ?auto_49858 ?auto_49849 ) ) ( not ( = ?auto_49837 ?auto_49849 ) ) ( AVAILABLE ?auto_49849 ) ( SURFACE-AT ?auto_49848 ?auto_49840 ) ( ON ?auto_49848 ?auto_49845 ) ( CLEAR ?auto_49848 ) ( not ( = ?auto_49832 ?auto_49845 ) ) ( not ( = ?auto_49833 ?auto_49845 ) ) ( not ( = ?auto_49839 ?auto_49845 ) ) ( not ( = ?auto_49847 ?auto_49845 ) ) ( not ( = ?auto_49857 ?auto_49845 ) ) ( not ( = ?auto_49848 ?auto_49845 ) ) ( not ( = ?auto_49855 ?auto_49845 ) ) ( not ( = ?auto_49854 ?auto_49845 ) ) ( IS-CRATE ?auto_49854 ) ( not ( = ?auto_49832 ?auto_49836 ) ) ( not ( = ?auto_49833 ?auto_49836 ) ) ( not ( = ?auto_49839 ?auto_49836 ) ) ( not ( = ?auto_49847 ?auto_49836 ) ) ( not ( = ?auto_49857 ?auto_49836 ) ) ( not ( = ?auto_49848 ?auto_49836 ) ) ( not ( = ?auto_49855 ?auto_49836 ) ) ( not ( = ?auto_49854 ?auto_49836 ) ) ( not ( = ?auto_49845 ?auto_49836 ) ) ( not ( = ?auto_49835 ?auto_49842 ) ) ( not ( = ?auto_49838 ?auto_49835 ) ) ( not ( = ?auto_49860 ?auto_49835 ) ) ( not ( = ?auto_49841 ?auto_49835 ) ) ( not ( = ?auto_49840 ?auto_49835 ) ) ( HOIST-AT ?auto_49859 ?auto_49835 ) ( not ( = ?auto_49851 ?auto_49859 ) ) ( not ( = ?auto_49852 ?auto_49859 ) ) ( not ( = ?auto_49858 ?auto_49859 ) ) ( not ( = ?auto_49837 ?auto_49859 ) ) ( not ( = ?auto_49849 ?auto_49859 ) ) ( AVAILABLE ?auto_49859 ) ( SURFACE-AT ?auto_49854 ?auto_49835 ) ( ON ?auto_49854 ?auto_49834 ) ( CLEAR ?auto_49854 ) ( not ( = ?auto_49832 ?auto_49834 ) ) ( not ( = ?auto_49833 ?auto_49834 ) ) ( not ( = ?auto_49839 ?auto_49834 ) ) ( not ( = ?auto_49847 ?auto_49834 ) ) ( not ( = ?auto_49857 ?auto_49834 ) ) ( not ( = ?auto_49848 ?auto_49834 ) ) ( not ( = ?auto_49855 ?auto_49834 ) ) ( not ( = ?auto_49854 ?auto_49834 ) ) ( not ( = ?auto_49845 ?auto_49834 ) ) ( not ( = ?auto_49836 ?auto_49834 ) ) ( IS-CRATE ?auto_49836 ) ( not ( = ?auto_49832 ?auto_49853 ) ) ( not ( = ?auto_49833 ?auto_49853 ) ) ( not ( = ?auto_49839 ?auto_49853 ) ) ( not ( = ?auto_49847 ?auto_49853 ) ) ( not ( = ?auto_49857 ?auto_49853 ) ) ( not ( = ?auto_49848 ?auto_49853 ) ) ( not ( = ?auto_49855 ?auto_49853 ) ) ( not ( = ?auto_49854 ?auto_49853 ) ) ( not ( = ?auto_49845 ?auto_49853 ) ) ( not ( = ?auto_49836 ?auto_49853 ) ) ( not ( = ?auto_49834 ?auto_49853 ) ) ( not ( = ?auto_49843 ?auto_49842 ) ) ( not ( = ?auto_49838 ?auto_49843 ) ) ( not ( = ?auto_49860 ?auto_49843 ) ) ( not ( = ?auto_49841 ?auto_49843 ) ) ( not ( = ?auto_49840 ?auto_49843 ) ) ( not ( = ?auto_49835 ?auto_49843 ) ) ( HOIST-AT ?auto_49844 ?auto_49843 ) ( not ( = ?auto_49851 ?auto_49844 ) ) ( not ( = ?auto_49852 ?auto_49844 ) ) ( not ( = ?auto_49858 ?auto_49844 ) ) ( not ( = ?auto_49837 ?auto_49844 ) ) ( not ( = ?auto_49849 ?auto_49844 ) ) ( not ( = ?auto_49859 ?auto_49844 ) ) ( AVAILABLE ?auto_49844 ) ( SURFACE-AT ?auto_49836 ?auto_49843 ) ( ON ?auto_49836 ?auto_49856 ) ( CLEAR ?auto_49836 ) ( not ( = ?auto_49832 ?auto_49856 ) ) ( not ( = ?auto_49833 ?auto_49856 ) ) ( not ( = ?auto_49839 ?auto_49856 ) ) ( not ( = ?auto_49847 ?auto_49856 ) ) ( not ( = ?auto_49857 ?auto_49856 ) ) ( not ( = ?auto_49848 ?auto_49856 ) ) ( not ( = ?auto_49855 ?auto_49856 ) ) ( not ( = ?auto_49854 ?auto_49856 ) ) ( not ( = ?auto_49845 ?auto_49856 ) ) ( not ( = ?auto_49836 ?auto_49856 ) ) ( not ( = ?auto_49834 ?auto_49856 ) ) ( not ( = ?auto_49853 ?auto_49856 ) ) ( TRUCK-AT ?auto_49850 ?auto_49842 ) ( SURFACE-AT ?auto_49846 ?auto_49842 ) ( CLEAR ?auto_49846 ) ( IS-CRATE ?auto_49853 ) ( not ( = ?auto_49832 ?auto_49846 ) ) ( not ( = ?auto_49833 ?auto_49846 ) ) ( not ( = ?auto_49839 ?auto_49846 ) ) ( not ( = ?auto_49847 ?auto_49846 ) ) ( not ( = ?auto_49857 ?auto_49846 ) ) ( not ( = ?auto_49848 ?auto_49846 ) ) ( not ( = ?auto_49855 ?auto_49846 ) ) ( not ( = ?auto_49854 ?auto_49846 ) ) ( not ( = ?auto_49845 ?auto_49846 ) ) ( not ( = ?auto_49836 ?auto_49846 ) ) ( not ( = ?auto_49834 ?auto_49846 ) ) ( not ( = ?auto_49853 ?auto_49846 ) ) ( not ( = ?auto_49856 ?auto_49846 ) ) ( AVAILABLE ?auto_49851 ) ( IN ?auto_49853 ?auto_49850 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49851 ?auto_49853 ?auto_49850 ?auto_49842 )
      ( MAKE-ON ?auto_49832 ?auto_49833 )
      ( MAKE-ON-VERIFY ?auto_49832 ?auto_49833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49861 - SURFACE
      ?auto_49862 - SURFACE
    )
    :vars
    (
      ?auto_49875 - HOIST
      ?auto_49883 - PLACE
      ?auto_49882 - PLACE
      ?auto_49876 - HOIST
      ?auto_49886 - SURFACE
      ?auto_49865 - SURFACE
      ?auto_49872 - PLACE
      ?auto_49870 - HOIST
      ?auto_49873 - SURFACE
      ?auto_49889 - SURFACE
      ?auto_49887 - PLACE
      ?auto_49884 - HOIST
      ?auto_49879 - SURFACE
      ?auto_49878 - SURFACE
      ?auto_49868 - PLACE
      ?auto_49881 - HOIST
      ?auto_49866 - SURFACE
      ?auto_49869 - SURFACE
      ?auto_49867 - PLACE
      ?auto_49871 - HOIST
      ?auto_49888 - SURFACE
      ?auto_49877 - SURFACE
      ?auto_49863 - PLACE
      ?auto_49864 - HOIST
      ?auto_49880 - SURFACE
      ?auto_49885 - SURFACE
      ?auto_49874 - TRUCK
      ?auto_49890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49875 ?auto_49883 ) ( IS-CRATE ?auto_49861 ) ( not ( = ?auto_49861 ?auto_49862 ) ) ( not ( = ?auto_49882 ?auto_49883 ) ) ( HOIST-AT ?auto_49876 ?auto_49882 ) ( not ( = ?auto_49875 ?auto_49876 ) ) ( AVAILABLE ?auto_49876 ) ( SURFACE-AT ?auto_49861 ?auto_49882 ) ( ON ?auto_49861 ?auto_49886 ) ( CLEAR ?auto_49861 ) ( not ( = ?auto_49861 ?auto_49886 ) ) ( not ( = ?auto_49862 ?auto_49886 ) ) ( IS-CRATE ?auto_49862 ) ( not ( = ?auto_49861 ?auto_49865 ) ) ( not ( = ?auto_49862 ?auto_49865 ) ) ( not ( = ?auto_49886 ?auto_49865 ) ) ( not ( = ?auto_49872 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49872 ) ) ( HOIST-AT ?auto_49870 ?auto_49872 ) ( not ( = ?auto_49875 ?auto_49870 ) ) ( not ( = ?auto_49876 ?auto_49870 ) ) ( AVAILABLE ?auto_49870 ) ( SURFACE-AT ?auto_49862 ?auto_49872 ) ( ON ?auto_49862 ?auto_49873 ) ( CLEAR ?auto_49862 ) ( not ( = ?auto_49861 ?auto_49873 ) ) ( not ( = ?auto_49862 ?auto_49873 ) ) ( not ( = ?auto_49886 ?auto_49873 ) ) ( not ( = ?auto_49865 ?auto_49873 ) ) ( IS-CRATE ?auto_49865 ) ( not ( = ?auto_49861 ?auto_49889 ) ) ( not ( = ?auto_49862 ?auto_49889 ) ) ( not ( = ?auto_49886 ?auto_49889 ) ) ( not ( = ?auto_49865 ?auto_49889 ) ) ( not ( = ?auto_49873 ?auto_49889 ) ) ( not ( = ?auto_49887 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49887 ) ) ( not ( = ?auto_49872 ?auto_49887 ) ) ( HOIST-AT ?auto_49884 ?auto_49887 ) ( not ( = ?auto_49875 ?auto_49884 ) ) ( not ( = ?auto_49876 ?auto_49884 ) ) ( not ( = ?auto_49870 ?auto_49884 ) ) ( AVAILABLE ?auto_49884 ) ( SURFACE-AT ?auto_49865 ?auto_49887 ) ( ON ?auto_49865 ?auto_49879 ) ( CLEAR ?auto_49865 ) ( not ( = ?auto_49861 ?auto_49879 ) ) ( not ( = ?auto_49862 ?auto_49879 ) ) ( not ( = ?auto_49886 ?auto_49879 ) ) ( not ( = ?auto_49865 ?auto_49879 ) ) ( not ( = ?auto_49873 ?auto_49879 ) ) ( not ( = ?auto_49889 ?auto_49879 ) ) ( IS-CRATE ?auto_49889 ) ( not ( = ?auto_49861 ?auto_49878 ) ) ( not ( = ?auto_49862 ?auto_49878 ) ) ( not ( = ?auto_49886 ?auto_49878 ) ) ( not ( = ?auto_49865 ?auto_49878 ) ) ( not ( = ?auto_49873 ?auto_49878 ) ) ( not ( = ?auto_49889 ?auto_49878 ) ) ( not ( = ?auto_49879 ?auto_49878 ) ) ( not ( = ?auto_49868 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49868 ) ) ( not ( = ?auto_49872 ?auto_49868 ) ) ( not ( = ?auto_49887 ?auto_49868 ) ) ( HOIST-AT ?auto_49881 ?auto_49868 ) ( not ( = ?auto_49875 ?auto_49881 ) ) ( not ( = ?auto_49876 ?auto_49881 ) ) ( not ( = ?auto_49870 ?auto_49881 ) ) ( not ( = ?auto_49884 ?auto_49881 ) ) ( AVAILABLE ?auto_49881 ) ( SURFACE-AT ?auto_49889 ?auto_49868 ) ( ON ?auto_49889 ?auto_49866 ) ( CLEAR ?auto_49889 ) ( not ( = ?auto_49861 ?auto_49866 ) ) ( not ( = ?auto_49862 ?auto_49866 ) ) ( not ( = ?auto_49886 ?auto_49866 ) ) ( not ( = ?auto_49865 ?auto_49866 ) ) ( not ( = ?auto_49873 ?auto_49866 ) ) ( not ( = ?auto_49889 ?auto_49866 ) ) ( not ( = ?auto_49879 ?auto_49866 ) ) ( not ( = ?auto_49878 ?auto_49866 ) ) ( IS-CRATE ?auto_49878 ) ( not ( = ?auto_49861 ?auto_49869 ) ) ( not ( = ?auto_49862 ?auto_49869 ) ) ( not ( = ?auto_49886 ?auto_49869 ) ) ( not ( = ?auto_49865 ?auto_49869 ) ) ( not ( = ?auto_49873 ?auto_49869 ) ) ( not ( = ?auto_49889 ?auto_49869 ) ) ( not ( = ?auto_49879 ?auto_49869 ) ) ( not ( = ?auto_49878 ?auto_49869 ) ) ( not ( = ?auto_49866 ?auto_49869 ) ) ( not ( = ?auto_49867 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49867 ) ) ( not ( = ?auto_49872 ?auto_49867 ) ) ( not ( = ?auto_49887 ?auto_49867 ) ) ( not ( = ?auto_49868 ?auto_49867 ) ) ( HOIST-AT ?auto_49871 ?auto_49867 ) ( not ( = ?auto_49875 ?auto_49871 ) ) ( not ( = ?auto_49876 ?auto_49871 ) ) ( not ( = ?auto_49870 ?auto_49871 ) ) ( not ( = ?auto_49884 ?auto_49871 ) ) ( not ( = ?auto_49881 ?auto_49871 ) ) ( AVAILABLE ?auto_49871 ) ( SURFACE-AT ?auto_49878 ?auto_49867 ) ( ON ?auto_49878 ?auto_49888 ) ( CLEAR ?auto_49878 ) ( not ( = ?auto_49861 ?auto_49888 ) ) ( not ( = ?auto_49862 ?auto_49888 ) ) ( not ( = ?auto_49886 ?auto_49888 ) ) ( not ( = ?auto_49865 ?auto_49888 ) ) ( not ( = ?auto_49873 ?auto_49888 ) ) ( not ( = ?auto_49889 ?auto_49888 ) ) ( not ( = ?auto_49879 ?auto_49888 ) ) ( not ( = ?auto_49878 ?auto_49888 ) ) ( not ( = ?auto_49866 ?auto_49888 ) ) ( not ( = ?auto_49869 ?auto_49888 ) ) ( IS-CRATE ?auto_49869 ) ( not ( = ?auto_49861 ?auto_49877 ) ) ( not ( = ?auto_49862 ?auto_49877 ) ) ( not ( = ?auto_49886 ?auto_49877 ) ) ( not ( = ?auto_49865 ?auto_49877 ) ) ( not ( = ?auto_49873 ?auto_49877 ) ) ( not ( = ?auto_49889 ?auto_49877 ) ) ( not ( = ?auto_49879 ?auto_49877 ) ) ( not ( = ?auto_49878 ?auto_49877 ) ) ( not ( = ?auto_49866 ?auto_49877 ) ) ( not ( = ?auto_49869 ?auto_49877 ) ) ( not ( = ?auto_49888 ?auto_49877 ) ) ( not ( = ?auto_49863 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49863 ) ) ( not ( = ?auto_49872 ?auto_49863 ) ) ( not ( = ?auto_49887 ?auto_49863 ) ) ( not ( = ?auto_49868 ?auto_49863 ) ) ( not ( = ?auto_49867 ?auto_49863 ) ) ( HOIST-AT ?auto_49864 ?auto_49863 ) ( not ( = ?auto_49875 ?auto_49864 ) ) ( not ( = ?auto_49876 ?auto_49864 ) ) ( not ( = ?auto_49870 ?auto_49864 ) ) ( not ( = ?auto_49884 ?auto_49864 ) ) ( not ( = ?auto_49881 ?auto_49864 ) ) ( not ( = ?auto_49871 ?auto_49864 ) ) ( AVAILABLE ?auto_49864 ) ( SURFACE-AT ?auto_49869 ?auto_49863 ) ( ON ?auto_49869 ?auto_49880 ) ( CLEAR ?auto_49869 ) ( not ( = ?auto_49861 ?auto_49880 ) ) ( not ( = ?auto_49862 ?auto_49880 ) ) ( not ( = ?auto_49886 ?auto_49880 ) ) ( not ( = ?auto_49865 ?auto_49880 ) ) ( not ( = ?auto_49873 ?auto_49880 ) ) ( not ( = ?auto_49889 ?auto_49880 ) ) ( not ( = ?auto_49879 ?auto_49880 ) ) ( not ( = ?auto_49878 ?auto_49880 ) ) ( not ( = ?auto_49866 ?auto_49880 ) ) ( not ( = ?auto_49869 ?auto_49880 ) ) ( not ( = ?auto_49888 ?auto_49880 ) ) ( not ( = ?auto_49877 ?auto_49880 ) ) ( SURFACE-AT ?auto_49885 ?auto_49883 ) ( CLEAR ?auto_49885 ) ( IS-CRATE ?auto_49877 ) ( not ( = ?auto_49861 ?auto_49885 ) ) ( not ( = ?auto_49862 ?auto_49885 ) ) ( not ( = ?auto_49886 ?auto_49885 ) ) ( not ( = ?auto_49865 ?auto_49885 ) ) ( not ( = ?auto_49873 ?auto_49885 ) ) ( not ( = ?auto_49889 ?auto_49885 ) ) ( not ( = ?auto_49879 ?auto_49885 ) ) ( not ( = ?auto_49878 ?auto_49885 ) ) ( not ( = ?auto_49866 ?auto_49885 ) ) ( not ( = ?auto_49869 ?auto_49885 ) ) ( not ( = ?auto_49888 ?auto_49885 ) ) ( not ( = ?auto_49877 ?auto_49885 ) ) ( not ( = ?auto_49880 ?auto_49885 ) ) ( AVAILABLE ?auto_49875 ) ( IN ?auto_49877 ?auto_49874 ) ( TRUCK-AT ?auto_49874 ?auto_49890 ) ( not ( = ?auto_49890 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49890 ) ) ( not ( = ?auto_49872 ?auto_49890 ) ) ( not ( = ?auto_49887 ?auto_49890 ) ) ( not ( = ?auto_49868 ?auto_49890 ) ) ( not ( = ?auto_49867 ?auto_49890 ) ) ( not ( = ?auto_49863 ?auto_49890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49874 ?auto_49890 ?auto_49883 )
      ( MAKE-ON ?auto_49861 ?auto_49862 )
      ( MAKE-ON-VERIFY ?auto_49861 ?auto_49862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49891 - SURFACE
      ?auto_49892 - SURFACE
    )
    :vars
    (
      ?auto_49915 - HOIST
      ?auto_49908 - PLACE
      ?auto_49905 - PLACE
      ?auto_49912 - HOIST
      ?auto_49893 - SURFACE
      ?auto_49914 - SURFACE
      ?auto_49913 - PLACE
      ?auto_49903 - HOIST
      ?auto_49906 - SURFACE
      ?auto_49895 - SURFACE
      ?auto_49900 - PLACE
      ?auto_49899 - HOIST
      ?auto_49898 - SURFACE
      ?auto_49902 - SURFACE
      ?auto_49909 - PLACE
      ?auto_49904 - HOIST
      ?auto_49916 - SURFACE
      ?auto_49920 - SURFACE
      ?auto_49907 - PLACE
      ?auto_49911 - HOIST
      ?auto_49896 - SURFACE
      ?auto_49919 - SURFACE
      ?auto_49897 - PLACE
      ?auto_49917 - HOIST
      ?auto_49894 - SURFACE
      ?auto_49901 - SURFACE
      ?auto_49910 - TRUCK
      ?auto_49918 - PLACE
      ?auto_49921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49915 ?auto_49908 ) ( IS-CRATE ?auto_49891 ) ( not ( = ?auto_49891 ?auto_49892 ) ) ( not ( = ?auto_49905 ?auto_49908 ) ) ( HOIST-AT ?auto_49912 ?auto_49905 ) ( not ( = ?auto_49915 ?auto_49912 ) ) ( AVAILABLE ?auto_49912 ) ( SURFACE-AT ?auto_49891 ?auto_49905 ) ( ON ?auto_49891 ?auto_49893 ) ( CLEAR ?auto_49891 ) ( not ( = ?auto_49891 ?auto_49893 ) ) ( not ( = ?auto_49892 ?auto_49893 ) ) ( IS-CRATE ?auto_49892 ) ( not ( = ?auto_49891 ?auto_49914 ) ) ( not ( = ?auto_49892 ?auto_49914 ) ) ( not ( = ?auto_49893 ?auto_49914 ) ) ( not ( = ?auto_49913 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49913 ) ) ( HOIST-AT ?auto_49903 ?auto_49913 ) ( not ( = ?auto_49915 ?auto_49903 ) ) ( not ( = ?auto_49912 ?auto_49903 ) ) ( AVAILABLE ?auto_49903 ) ( SURFACE-AT ?auto_49892 ?auto_49913 ) ( ON ?auto_49892 ?auto_49906 ) ( CLEAR ?auto_49892 ) ( not ( = ?auto_49891 ?auto_49906 ) ) ( not ( = ?auto_49892 ?auto_49906 ) ) ( not ( = ?auto_49893 ?auto_49906 ) ) ( not ( = ?auto_49914 ?auto_49906 ) ) ( IS-CRATE ?auto_49914 ) ( not ( = ?auto_49891 ?auto_49895 ) ) ( not ( = ?auto_49892 ?auto_49895 ) ) ( not ( = ?auto_49893 ?auto_49895 ) ) ( not ( = ?auto_49914 ?auto_49895 ) ) ( not ( = ?auto_49906 ?auto_49895 ) ) ( not ( = ?auto_49900 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49900 ) ) ( not ( = ?auto_49913 ?auto_49900 ) ) ( HOIST-AT ?auto_49899 ?auto_49900 ) ( not ( = ?auto_49915 ?auto_49899 ) ) ( not ( = ?auto_49912 ?auto_49899 ) ) ( not ( = ?auto_49903 ?auto_49899 ) ) ( AVAILABLE ?auto_49899 ) ( SURFACE-AT ?auto_49914 ?auto_49900 ) ( ON ?auto_49914 ?auto_49898 ) ( CLEAR ?auto_49914 ) ( not ( = ?auto_49891 ?auto_49898 ) ) ( not ( = ?auto_49892 ?auto_49898 ) ) ( not ( = ?auto_49893 ?auto_49898 ) ) ( not ( = ?auto_49914 ?auto_49898 ) ) ( not ( = ?auto_49906 ?auto_49898 ) ) ( not ( = ?auto_49895 ?auto_49898 ) ) ( IS-CRATE ?auto_49895 ) ( not ( = ?auto_49891 ?auto_49902 ) ) ( not ( = ?auto_49892 ?auto_49902 ) ) ( not ( = ?auto_49893 ?auto_49902 ) ) ( not ( = ?auto_49914 ?auto_49902 ) ) ( not ( = ?auto_49906 ?auto_49902 ) ) ( not ( = ?auto_49895 ?auto_49902 ) ) ( not ( = ?auto_49898 ?auto_49902 ) ) ( not ( = ?auto_49909 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49909 ) ) ( not ( = ?auto_49913 ?auto_49909 ) ) ( not ( = ?auto_49900 ?auto_49909 ) ) ( HOIST-AT ?auto_49904 ?auto_49909 ) ( not ( = ?auto_49915 ?auto_49904 ) ) ( not ( = ?auto_49912 ?auto_49904 ) ) ( not ( = ?auto_49903 ?auto_49904 ) ) ( not ( = ?auto_49899 ?auto_49904 ) ) ( AVAILABLE ?auto_49904 ) ( SURFACE-AT ?auto_49895 ?auto_49909 ) ( ON ?auto_49895 ?auto_49916 ) ( CLEAR ?auto_49895 ) ( not ( = ?auto_49891 ?auto_49916 ) ) ( not ( = ?auto_49892 ?auto_49916 ) ) ( not ( = ?auto_49893 ?auto_49916 ) ) ( not ( = ?auto_49914 ?auto_49916 ) ) ( not ( = ?auto_49906 ?auto_49916 ) ) ( not ( = ?auto_49895 ?auto_49916 ) ) ( not ( = ?auto_49898 ?auto_49916 ) ) ( not ( = ?auto_49902 ?auto_49916 ) ) ( IS-CRATE ?auto_49902 ) ( not ( = ?auto_49891 ?auto_49920 ) ) ( not ( = ?auto_49892 ?auto_49920 ) ) ( not ( = ?auto_49893 ?auto_49920 ) ) ( not ( = ?auto_49914 ?auto_49920 ) ) ( not ( = ?auto_49906 ?auto_49920 ) ) ( not ( = ?auto_49895 ?auto_49920 ) ) ( not ( = ?auto_49898 ?auto_49920 ) ) ( not ( = ?auto_49902 ?auto_49920 ) ) ( not ( = ?auto_49916 ?auto_49920 ) ) ( not ( = ?auto_49907 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49907 ) ) ( not ( = ?auto_49913 ?auto_49907 ) ) ( not ( = ?auto_49900 ?auto_49907 ) ) ( not ( = ?auto_49909 ?auto_49907 ) ) ( HOIST-AT ?auto_49911 ?auto_49907 ) ( not ( = ?auto_49915 ?auto_49911 ) ) ( not ( = ?auto_49912 ?auto_49911 ) ) ( not ( = ?auto_49903 ?auto_49911 ) ) ( not ( = ?auto_49899 ?auto_49911 ) ) ( not ( = ?auto_49904 ?auto_49911 ) ) ( AVAILABLE ?auto_49911 ) ( SURFACE-AT ?auto_49902 ?auto_49907 ) ( ON ?auto_49902 ?auto_49896 ) ( CLEAR ?auto_49902 ) ( not ( = ?auto_49891 ?auto_49896 ) ) ( not ( = ?auto_49892 ?auto_49896 ) ) ( not ( = ?auto_49893 ?auto_49896 ) ) ( not ( = ?auto_49914 ?auto_49896 ) ) ( not ( = ?auto_49906 ?auto_49896 ) ) ( not ( = ?auto_49895 ?auto_49896 ) ) ( not ( = ?auto_49898 ?auto_49896 ) ) ( not ( = ?auto_49902 ?auto_49896 ) ) ( not ( = ?auto_49916 ?auto_49896 ) ) ( not ( = ?auto_49920 ?auto_49896 ) ) ( IS-CRATE ?auto_49920 ) ( not ( = ?auto_49891 ?auto_49919 ) ) ( not ( = ?auto_49892 ?auto_49919 ) ) ( not ( = ?auto_49893 ?auto_49919 ) ) ( not ( = ?auto_49914 ?auto_49919 ) ) ( not ( = ?auto_49906 ?auto_49919 ) ) ( not ( = ?auto_49895 ?auto_49919 ) ) ( not ( = ?auto_49898 ?auto_49919 ) ) ( not ( = ?auto_49902 ?auto_49919 ) ) ( not ( = ?auto_49916 ?auto_49919 ) ) ( not ( = ?auto_49920 ?auto_49919 ) ) ( not ( = ?auto_49896 ?auto_49919 ) ) ( not ( = ?auto_49897 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49897 ) ) ( not ( = ?auto_49913 ?auto_49897 ) ) ( not ( = ?auto_49900 ?auto_49897 ) ) ( not ( = ?auto_49909 ?auto_49897 ) ) ( not ( = ?auto_49907 ?auto_49897 ) ) ( HOIST-AT ?auto_49917 ?auto_49897 ) ( not ( = ?auto_49915 ?auto_49917 ) ) ( not ( = ?auto_49912 ?auto_49917 ) ) ( not ( = ?auto_49903 ?auto_49917 ) ) ( not ( = ?auto_49899 ?auto_49917 ) ) ( not ( = ?auto_49904 ?auto_49917 ) ) ( not ( = ?auto_49911 ?auto_49917 ) ) ( AVAILABLE ?auto_49917 ) ( SURFACE-AT ?auto_49920 ?auto_49897 ) ( ON ?auto_49920 ?auto_49894 ) ( CLEAR ?auto_49920 ) ( not ( = ?auto_49891 ?auto_49894 ) ) ( not ( = ?auto_49892 ?auto_49894 ) ) ( not ( = ?auto_49893 ?auto_49894 ) ) ( not ( = ?auto_49914 ?auto_49894 ) ) ( not ( = ?auto_49906 ?auto_49894 ) ) ( not ( = ?auto_49895 ?auto_49894 ) ) ( not ( = ?auto_49898 ?auto_49894 ) ) ( not ( = ?auto_49902 ?auto_49894 ) ) ( not ( = ?auto_49916 ?auto_49894 ) ) ( not ( = ?auto_49920 ?auto_49894 ) ) ( not ( = ?auto_49896 ?auto_49894 ) ) ( not ( = ?auto_49919 ?auto_49894 ) ) ( SURFACE-AT ?auto_49901 ?auto_49908 ) ( CLEAR ?auto_49901 ) ( IS-CRATE ?auto_49919 ) ( not ( = ?auto_49891 ?auto_49901 ) ) ( not ( = ?auto_49892 ?auto_49901 ) ) ( not ( = ?auto_49893 ?auto_49901 ) ) ( not ( = ?auto_49914 ?auto_49901 ) ) ( not ( = ?auto_49906 ?auto_49901 ) ) ( not ( = ?auto_49895 ?auto_49901 ) ) ( not ( = ?auto_49898 ?auto_49901 ) ) ( not ( = ?auto_49902 ?auto_49901 ) ) ( not ( = ?auto_49916 ?auto_49901 ) ) ( not ( = ?auto_49920 ?auto_49901 ) ) ( not ( = ?auto_49896 ?auto_49901 ) ) ( not ( = ?auto_49919 ?auto_49901 ) ) ( not ( = ?auto_49894 ?auto_49901 ) ) ( AVAILABLE ?auto_49915 ) ( TRUCK-AT ?auto_49910 ?auto_49918 ) ( not ( = ?auto_49918 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49918 ) ) ( not ( = ?auto_49913 ?auto_49918 ) ) ( not ( = ?auto_49900 ?auto_49918 ) ) ( not ( = ?auto_49909 ?auto_49918 ) ) ( not ( = ?auto_49907 ?auto_49918 ) ) ( not ( = ?auto_49897 ?auto_49918 ) ) ( HOIST-AT ?auto_49921 ?auto_49918 ) ( LIFTING ?auto_49921 ?auto_49919 ) ( not ( = ?auto_49915 ?auto_49921 ) ) ( not ( = ?auto_49912 ?auto_49921 ) ) ( not ( = ?auto_49903 ?auto_49921 ) ) ( not ( = ?auto_49899 ?auto_49921 ) ) ( not ( = ?auto_49904 ?auto_49921 ) ) ( not ( = ?auto_49911 ?auto_49921 ) ) ( not ( = ?auto_49917 ?auto_49921 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49921 ?auto_49919 ?auto_49910 ?auto_49918 )
      ( MAKE-ON ?auto_49891 ?auto_49892 )
      ( MAKE-ON-VERIFY ?auto_49891 ?auto_49892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49922 - SURFACE
      ?auto_49923 - SURFACE
    )
    :vars
    (
      ?auto_49950 - HOIST
      ?auto_49951 - PLACE
      ?auto_49936 - PLACE
      ?auto_49947 - HOIST
      ?auto_49928 - SURFACE
      ?auto_49949 - SURFACE
      ?auto_49948 - PLACE
      ?auto_49924 - HOIST
      ?auto_49931 - SURFACE
      ?auto_49927 - SURFACE
      ?auto_49929 - PLACE
      ?auto_49932 - HOIST
      ?auto_49925 - SURFACE
      ?auto_49937 - SURFACE
      ?auto_49944 - PLACE
      ?auto_49930 - HOIST
      ?auto_49943 - SURFACE
      ?auto_49942 - SURFACE
      ?auto_49952 - PLACE
      ?auto_49946 - HOIST
      ?auto_49938 - SURFACE
      ?auto_49941 - SURFACE
      ?auto_49935 - PLACE
      ?auto_49939 - HOIST
      ?auto_49934 - SURFACE
      ?auto_49933 - SURFACE
      ?auto_49945 - TRUCK
      ?auto_49940 - PLACE
      ?auto_49926 - HOIST
      ?auto_49953 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49950 ?auto_49951 ) ( IS-CRATE ?auto_49922 ) ( not ( = ?auto_49922 ?auto_49923 ) ) ( not ( = ?auto_49936 ?auto_49951 ) ) ( HOIST-AT ?auto_49947 ?auto_49936 ) ( not ( = ?auto_49950 ?auto_49947 ) ) ( AVAILABLE ?auto_49947 ) ( SURFACE-AT ?auto_49922 ?auto_49936 ) ( ON ?auto_49922 ?auto_49928 ) ( CLEAR ?auto_49922 ) ( not ( = ?auto_49922 ?auto_49928 ) ) ( not ( = ?auto_49923 ?auto_49928 ) ) ( IS-CRATE ?auto_49923 ) ( not ( = ?auto_49922 ?auto_49949 ) ) ( not ( = ?auto_49923 ?auto_49949 ) ) ( not ( = ?auto_49928 ?auto_49949 ) ) ( not ( = ?auto_49948 ?auto_49951 ) ) ( not ( = ?auto_49936 ?auto_49948 ) ) ( HOIST-AT ?auto_49924 ?auto_49948 ) ( not ( = ?auto_49950 ?auto_49924 ) ) ( not ( = ?auto_49947 ?auto_49924 ) ) ( AVAILABLE ?auto_49924 ) ( SURFACE-AT ?auto_49923 ?auto_49948 ) ( ON ?auto_49923 ?auto_49931 ) ( CLEAR ?auto_49923 ) ( not ( = ?auto_49922 ?auto_49931 ) ) ( not ( = ?auto_49923 ?auto_49931 ) ) ( not ( = ?auto_49928 ?auto_49931 ) ) ( not ( = ?auto_49949 ?auto_49931 ) ) ( IS-CRATE ?auto_49949 ) ( not ( = ?auto_49922 ?auto_49927 ) ) ( not ( = ?auto_49923 ?auto_49927 ) ) ( not ( = ?auto_49928 ?auto_49927 ) ) ( not ( = ?auto_49949 ?auto_49927 ) ) ( not ( = ?auto_49931 ?auto_49927 ) ) ( not ( = ?auto_49929 ?auto_49951 ) ) ( not ( = ?auto_49936 ?auto_49929 ) ) ( not ( = ?auto_49948 ?auto_49929 ) ) ( HOIST-AT ?auto_49932 ?auto_49929 ) ( not ( = ?auto_49950 ?auto_49932 ) ) ( not ( = ?auto_49947 ?auto_49932 ) ) ( not ( = ?auto_49924 ?auto_49932 ) ) ( AVAILABLE ?auto_49932 ) ( SURFACE-AT ?auto_49949 ?auto_49929 ) ( ON ?auto_49949 ?auto_49925 ) ( CLEAR ?auto_49949 ) ( not ( = ?auto_49922 ?auto_49925 ) ) ( not ( = ?auto_49923 ?auto_49925 ) ) ( not ( = ?auto_49928 ?auto_49925 ) ) ( not ( = ?auto_49949 ?auto_49925 ) ) ( not ( = ?auto_49931 ?auto_49925 ) ) ( not ( = ?auto_49927 ?auto_49925 ) ) ( IS-CRATE ?auto_49927 ) ( not ( = ?auto_49922 ?auto_49937 ) ) ( not ( = ?auto_49923 ?auto_49937 ) ) ( not ( = ?auto_49928 ?auto_49937 ) ) ( not ( = ?auto_49949 ?auto_49937 ) ) ( not ( = ?auto_49931 ?auto_49937 ) ) ( not ( = ?auto_49927 ?auto_49937 ) ) ( not ( = ?auto_49925 ?auto_49937 ) ) ( not ( = ?auto_49944 ?auto_49951 ) ) ( not ( = ?auto_49936 ?auto_49944 ) ) ( not ( = ?auto_49948 ?auto_49944 ) ) ( not ( = ?auto_49929 ?auto_49944 ) ) ( HOIST-AT ?auto_49930 ?auto_49944 ) ( not ( = ?auto_49950 ?auto_49930 ) ) ( not ( = ?auto_49947 ?auto_49930 ) ) ( not ( = ?auto_49924 ?auto_49930 ) ) ( not ( = ?auto_49932 ?auto_49930 ) ) ( AVAILABLE ?auto_49930 ) ( SURFACE-AT ?auto_49927 ?auto_49944 ) ( ON ?auto_49927 ?auto_49943 ) ( CLEAR ?auto_49927 ) ( not ( = ?auto_49922 ?auto_49943 ) ) ( not ( = ?auto_49923 ?auto_49943 ) ) ( not ( = ?auto_49928 ?auto_49943 ) ) ( not ( = ?auto_49949 ?auto_49943 ) ) ( not ( = ?auto_49931 ?auto_49943 ) ) ( not ( = ?auto_49927 ?auto_49943 ) ) ( not ( = ?auto_49925 ?auto_49943 ) ) ( not ( = ?auto_49937 ?auto_49943 ) ) ( IS-CRATE ?auto_49937 ) ( not ( = ?auto_49922 ?auto_49942 ) ) ( not ( = ?auto_49923 ?auto_49942 ) ) ( not ( = ?auto_49928 ?auto_49942 ) ) ( not ( = ?auto_49949 ?auto_49942 ) ) ( not ( = ?auto_49931 ?auto_49942 ) ) ( not ( = ?auto_49927 ?auto_49942 ) ) ( not ( = ?auto_49925 ?auto_49942 ) ) ( not ( = ?auto_49937 ?auto_49942 ) ) ( not ( = ?auto_49943 ?auto_49942 ) ) ( not ( = ?auto_49952 ?auto_49951 ) ) ( not ( = ?auto_49936 ?auto_49952 ) ) ( not ( = ?auto_49948 ?auto_49952 ) ) ( not ( = ?auto_49929 ?auto_49952 ) ) ( not ( = ?auto_49944 ?auto_49952 ) ) ( HOIST-AT ?auto_49946 ?auto_49952 ) ( not ( = ?auto_49950 ?auto_49946 ) ) ( not ( = ?auto_49947 ?auto_49946 ) ) ( not ( = ?auto_49924 ?auto_49946 ) ) ( not ( = ?auto_49932 ?auto_49946 ) ) ( not ( = ?auto_49930 ?auto_49946 ) ) ( AVAILABLE ?auto_49946 ) ( SURFACE-AT ?auto_49937 ?auto_49952 ) ( ON ?auto_49937 ?auto_49938 ) ( CLEAR ?auto_49937 ) ( not ( = ?auto_49922 ?auto_49938 ) ) ( not ( = ?auto_49923 ?auto_49938 ) ) ( not ( = ?auto_49928 ?auto_49938 ) ) ( not ( = ?auto_49949 ?auto_49938 ) ) ( not ( = ?auto_49931 ?auto_49938 ) ) ( not ( = ?auto_49927 ?auto_49938 ) ) ( not ( = ?auto_49925 ?auto_49938 ) ) ( not ( = ?auto_49937 ?auto_49938 ) ) ( not ( = ?auto_49943 ?auto_49938 ) ) ( not ( = ?auto_49942 ?auto_49938 ) ) ( IS-CRATE ?auto_49942 ) ( not ( = ?auto_49922 ?auto_49941 ) ) ( not ( = ?auto_49923 ?auto_49941 ) ) ( not ( = ?auto_49928 ?auto_49941 ) ) ( not ( = ?auto_49949 ?auto_49941 ) ) ( not ( = ?auto_49931 ?auto_49941 ) ) ( not ( = ?auto_49927 ?auto_49941 ) ) ( not ( = ?auto_49925 ?auto_49941 ) ) ( not ( = ?auto_49937 ?auto_49941 ) ) ( not ( = ?auto_49943 ?auto_49941 ) ) ( not ( = ?auto_49942 ?auto_49941 ) ) ( not ( = ?auto_49938 ?auto_49941 ) ) ( not ( = ?auto_49935 ?auto_49951 ) ) ( not ( = ?auto_49936 ?auto_49935 ) ) ( not ( = ?auto_49948 ?auto_49935 ) ) ( not ( = ?auto_49929 ?auto_49935 ) ) ( not ( = ?auto_49944 ?auto_49935 ) ) ( not ( = ?auto_49952 ?auto_49935 ) ) ( HOIST-AT ?auto_49939 ?auto_49935 ) ( not ( = ?auto_49950 ?auto_49939 ) ) ( not ( = ?auto_49947 ?auto_49939 ) ) ( not ( = ?auto_49924 ?auto_49939 ) ) ( not ( = ?auto_49932 ?auto_49939 ) ) ( not ( = ?auto_49930 ?auto_49939 ) ) ( not ( = ?auto_49946 ?auto_49939 ) ) ( AVAILABLE ?auto_49939 ) ( SURFACE-AT ?auto_49942 ?auto_49935 ) ( ON ?auto_49942 ?auto_49934 ) ( CLEAR ?auto_49942 ) ( not ( = ?auto_49922 ?auto_49934 ) ) ( not ( = ?auto_49923 ?auto_49934 ) ) ( not ( = ?auto_49928 ?auto_49934 ) ) ( not ( = ?auto_49949 ?auto_49934 ) ) ( not ( = ?auto_49931 ?auto_49934 ) ) ( not ( = ?auto_49927 ?auto_49934 ) ) ( not ( = ?auto_49925 ?auto_49934 ) ) ( not ( = ?auto_49937 ?auto_49934 ) ) ( not ( = ?auto_49943 ?auto_49934 ) ) ( not ( = ?auto_49942 ?auto_49934 ) ) ( not ( = ?auto_49938 ?auto_49934 ) ) ( not ( = ?auto_49941 ?auto_49934 ) ) ( SURFACE-AT ?auto_49933 ?auto_49951 ) ( CLEAR ?auto_49933 ) ( IS-CRATE ?auto_49941 ) ( not ( = ?auto_49922 ?auto_49933 ) ) ( not ( = ?auto_49923 ?auto_49933 ) ) ( not ( = ?auto_49928 ?auto_49933 ) ) ( not ( = ?auto_49949 ?auto_49933 ) ) ( not ( = ?auto_49931 ?auto_49933 ) ) ( not ( = ?auto_49927 ?auto_49933 ) ) ( not ( = ?auto_49925 ?auto_49933 ) ) ( not ( = ?auto_49937 ?auto_49933 ) ) ( not ( = ?auto_49943 ?auto_49933 ) ) ( not ( = ?auto_49942 ?auto_49933 ) ) ( not ( = ?auto_49938 ?auto_49933 ) ) ( not ( = ?auto_49941 ?auto_49933 ) ) ( not ( = ?auto_49934 ?auto_49933 ) ) ( AVAILABLE ?auto_49950 ) ( TRUCK-AT ?auto_49945 ?auto_49940 ) ( not ( = ?auto_49940 ?auto_49951 ) ) ( not ( = ?auto_49936 ?auto_49940 ) ) ( not ( = ?auto_49948 ?auto_49940 ) ) ( not ( = ?auto_49929 ?auto_49940 ) ) ( not ( = ?auto_49944 ?auto_49940 ) ) ( not ( = ?auto_49952 ?auto_49940 ) ) ( not ( = ?auto_49935 ?auto_49940 ) ) ( HOIST-AT ?auto_49926 ?auto_49940 ) ( not ( = ?auto_49950 ?auto_49926 ) ) ( not ( = ?auto_49947 ?auto_49926 ) ) ( not ( = ?auto_49924 ?auto_49926 ) ) ( not ( = ?auto_49932 ?auto_49926 ) ) ( not ( = ?auto_49930 ?auto_49926 ) ) ( not ( = ?auto_49946 ?auto_49926 ) ) ( not ( = ?auto_49939 ?auto_49926 ) ) ( AVAILABLE ?auto_49926 ) ( SURFACE-AT ?auto_49941 ?auto_49940 ) ( ON ?auto_49941 ?auto_49953 ) ( CLEAR ?auto_49941 ) ( not ( = ?auto_49922 ?auto_49953 ) ) ( not ( = ?auto_49923 ?auto_49953 ) ) ( not ( = ?auto_49928 ?auto_49953 ) ) ( not ( = ?auto_49949 ?auto_49953 ) ) ( not ( = ?auto_49931 ?auto_49953 ) ) ( not ( = ?auto_49927 ?auto_49953 ) ) ( not ( = ?auto_49925 ?auto_49953 ) ) ( not ( = ?auto_49937 ?auto_49953 ) ) ( not ( = ?auto_49943 ?auto_49953 ) ) ( not ( = ?auto_49942 ?auto_49953 ) ) ( not ( = ?auto_49938 ?auto_49953 ) ) ( not ( = ?auto_49941 ?auto_49953 ) ) ( not ( = ?auto_49934 ?auto_49953 ) ) ( not ( = ?auto_49933 ?auto_49953 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49926 ?auto_49941 ?auto_49953 ?auto_49940 )
      ( MAKE-ON ?auto_49922 ?auto_49923 )
      ( MAKE-ON-VERIFY ?auto_49922 ?auto_49923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49954 - SURFACE
      ?auto_49955 - SURFACE
    )
    :vars
    (
      ?auto_49967 - HOIST
      ?auto_49968 - PLACE
      ?auto_49982 - PLACE
      ?auto_49970 - HOIST
      ?auto_49957 - SURFACE
      ?auto_49965 - SURFACE
      ?auto_49966 - PLACE
      ?auto_49960 - HOIST
      ?auto_49984 - SURFACE
      ?auto_49983 - SURFACE
      ?auto_49985 - PLACE
      ?auto_49956 - HOIST
      ?auto_49959 - SURFACE
      ?auto_49958 - SURFACE
      ?auto_49975 - PLACE
      ?auto_49979 - HOIST
      ?auto_49974 - SURFACE
      ?auto_49973 - SURFACE
      ?auto_49969 - PLACE
      ?auto_49977 - HOIST
      ?auto_49963 - SURFACE
      ?auto_49972 - SURFACE
      ?auto_49962 - PLACE
      ?auto_49978 - HOIST
      ?auto_49964 - SURFACE
      ?auto_49981 - SURFACE
      ?auto_49971 - PLACE
      ?auto_49980 - HOIST
      ?auto_49961 - SURFACE
      ?auto_49976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49967 ?auto_49968 ) ( IS-CRATE ?auto_49954 ) ( not ( = ?auto_49954 ?auto_49955 ) ) ( not ( = ?auto_49982 ?auto_49968 ) ) ( HOIST-AT ?auto_49970 ?auto_49982 ) ( not ( = ?auto_49967 ?auto_49970 ) ) ( AVAILABLE ?auto_49970 ) ( SURFACE-AT ?auto_49954 ?auto_49982 ) ( ON ?auto_49954 ?auto_49957 ) ( CLEAR ?auto_49954 ) ( not ( = ?auto_49954 ?auto_49957 ) ) ( not ( = ?auto_49955 ?auto_49957 ) ) ( IS-CRATE ?auto_49955 ) ( not ( = ?auto_49954 ?auto_49965 ) ) ( not ( = ?auto_49955 ?auto_49965 ) ) ( not ( = ?auto_49957 ?auto_49965 ) ) ( not ( = ?auto_49966 ?auto_49968 ) ) ( not ( = ?auto_49982 ?auto_49966 ) ) ( HOIST-AT ?auto_49960 ?auto_49966 ) ( not ( = ?auto_49967 ?auto_49960 ) ) ( not ( = ?auto_49970 ?auto_49960 ) ) ( AVAILABLE ?auto_49960 ) ( SURFACE-AT ?auto_49955 ?auto_49966 ) ( ON ?auto_49955 ?auto_49984 ) ( CLEAR ?auto_49955 ) ( not ( = ?auto_49954 ?auto_49984 ) ) ( not ( = ?auto_49955 ?auto_49984 ) ) ( not ( = ?auto_49957 ?auto_49984 ) ) ( not ( = ?auto_49965 ?auto_49984 ) ) ( IS-CRATE ?auto_49965 ) ( not ( = ?auto_49954 ?auto_49983 ) ) ( not ( = ?auto_49955 ?auto_49983 ) ) ( not ( = ?auto_49957 ?auto_49983 ) ) ( not ( = ?auto_49965 ?auto_49983 ) ) ( not ( = ?auto_49984 ?auto_49983 ) ) ( not ( = ?auto_49985 ?auto_49968 ) ) ( not ( = ?auto_49982 ?auto_49985 ) ) ( not ( = ?auto_49966 ?auto_49985 ) ) ( HOIST-AT ?auto_49956 ?auto_49985 ) ( not ( = ?auto_49967 ?auto_49956 ) ) ( not ( = ?auto_49970 ?auto_49956 ) ) ( not ( = ?auto_49960 ?auto_49956 ) ) ( AVAILABLE ?auto_49956 ) ( SURFACE-AT ?auto_49965 ?auto_49985 ) ( ON ?auto_49965 ?auto_49959 ) ( CLEAR ?auto_49965 ) ( not ( = ?auto_49954 ?auto_49959 ) ) ( not ( = ?auto_49955 ?auto_49959 ) ) ( not ( = ?auto_49957 ?auto_49959 ) ) ( not ( = ?auto_49965 ?auto_49959 ) ) ( not ( = ?auto_49984 ?auto_49959 ) ) ( not ( = ?auto_49983 ?auto_49959 ) ) ( IS-CRATE ?auto_49983 ) ( not ( = ?auto_49954 ?auto_49958 ) ) ( not ( = ?auto_49955 ?auto_49958 ) ) ( not ( = ?auto_49957 ?auto_49958 ) ) ( not ( = ?auto_49965 ?auto_49958 ) ) ( not ( = ?auto_49984 ?auto_49958 ) ) ( not ( = ?auto_49983 ?auto_49958 ) ) ( not ( = ?auto_49959 ?auto_49958 ) ) ( not ( = ?auto_49975 ?auto_49968 ) ) ( not ( = ?auto_49982 ?auto_49975 ) ) ( not ( = ?auto_49966 ?auto_49975 ) ) ( not ( = ?auto_49985 ?auto_49975 ) ) ( HOIST-AT ?auto_49979 ?auto_49975 ) ( not ( = ?auto_49967 ?auto_49979 ) ) ( not ( = ?auto_49970 ?auto_49979 ) ) ( not ( = ?auto_49960 ?auto_49979 ) ) ( not ( = ?auto_49956 ?auto_49979 ) ) ( AVAILABLE ?auto_49979 ) ( SURFACE-AT ?auto_49983 ?auto_49975 ) ( ON ?auto_49983 ?auto_49974 ) ( CLEAR ?auto_49983 ) ( not ( = ?auto_49954 ?auto_49974 ) ) ( not ( = ?auto_49955 ?auto_49974 ) ) ( not ( = ?auto_49957 ?auto_49974 ) ) ( not ( = ?auto_49965 ?auto_49974 ) ) ( not ( = ?auto_49984 ?auto_49974 ) ) ( not ( = ?auto_49983 ?auto_49974 ) ) ( not ( = ?auto_49959 ?auto_49974 ) ) ( not ( = ?auto_49958 ?auto_49974 ) ) ( IS-CRATE ?auto_49958 ) ( not ( = ?auto_49954 ?auto_49973 ) ) ( not ( = ?auto_49955 ?auto_49973 ) ) ( not ( = ?auto_49957 ?auto_49973 ) ) ( not ( = ?auto_49965 ?auto_49973 ) ) ( not ( = ?auto_49984 ?auto_49973 ) ) ( not ( = ?auto_49983 ?auto_49973 ) ) ( not ( = ?auto_49959 ?auto_49973 ) ) ( not ( = ?auto_49958 ?auto_49973 ) ) ( not ( = ?auto_49974 ?auto_49973 ) ) ( not ( = ?auto_49969 ?auto_49968 ) ) ( not ( = ?auto_49982 ?auto_49969 ) ) ( not ( = ?auto_49966 ?auto_49969 ) ) ( not ( = ?auto_49985 ?auto_49969 ) ) ( not ( = ?auto_49975 ?auto_49969 ) ) ( HOIST-AT ?auto_49977 ?auto_49969 ) ( not ( = ?auto_49967 ?auto_49977 ) ) ( not ( = ?auto_49970 ?auto_49977 ) ) ( not ( = ?auto_49960 ?auto_49977 ) ) ( not ( = ?auto_49956 ?auto_49977 ) ) ( not ( = ?auto_49979 ?auto_49977 ) ) ( AVAILABLE ?auto_49977 ) ( SURFACE-AT ?auto_49958 ?auto_49969 ) ( ON ?auto_49958 ?auto_49963 ) ( CLEAR ?auto_49958 ) ( not ( = ?auto_49954 ?auto_49963 ) ) ( not ( = ?auto_49955 ?auto_49963 ) ) ( not ( = ?auto_49957 ?auto_49963 ) ) ( not ( = ?auto_49965 ?auto_49963 ) ) ( not ( = ?auto_49984 ?auto_49963 ) ) ( not ( = ?auto_49983 ?auto_49963 ) ) ( not ( = ?auto_49959 ?auto_49963 ) ) ( not ( = ?auto_49958 ?auto_49963 ) ) ( not ( = ?auto_49974 ?auto_49963 ) ) ( not ( = ?auto_49973 ?auto_49963 ) ) ( IS-CRATE ?auto_49973 ) ( not ( = ?auto_49954 ?auto_49972 ) ) ( not ( = ?auto_49955 ?auto_49972 ) ) ( not ( = ?auto_49957 ?auto_49972 ) ) ( not ( = ?auto_49965 ?auto_49972 ) ) ( not ( = ?auto_49984 ?auto_49972 ) ) ( not ( = ?auto_49983 ?auto_49972 ) ) ( not ( = ?auto_49959 ?auto_49972 ) ) ( not ( = ?auto_49958 ?auto_49972 ) ) ( not ( = ?auto_49974 ?auto_49972 ) ) ( not ( = ?auto_49973 ?auto_49972 ) ) ( not ( = ?auto_49963 ?auto_49972 ) ) ( not ( = ?auto_49962 ?auto_49968 ) ) ( not ( = ?auto_49982 ?auto_49962 ) ) ( not ( = ?auto_49966 ?auto_49962 ) ) ( not ( = ?auto_49985 ?auto_49962 ) ) ( not ( = ?auto_49975 ?auto_49962 ) ) ( not ( = ?auto_49969 ?auto_49962 ) ) ( HOIST-AT ?auto_49978 ?auto_49962 ) ( not ( = ?auto_49967 ?auto_49978 ) ) ( not ( = ?auto_49970 ?auto_49978 ) ) ( not ( = ?auto_49960 ?auto_49978 ) ) ( not ( = ?auto_49956 ?auto_49978 ) ) ( not ( = ?auto_49979 ?auto_49978 ) ) ( not ( = ?auto_49977 ?auto_49978 ) ) ( AVAILABLE ?auto_49978 ) ( SURFACE-AT ?auto_49973 ?auto_49962 ) ( ON ?auto_49973 ?auto_49964 ) ( CLEAR ?auto_49973 ) ( not ( = ?auto_49954 ?auto_49964 ) ) ( not ( = ?auto_49955 ?auto_49964 ) ) ( not ( = ?auto_49957 ?auto_49964 ) ) ( not ( = ?auto_49965 ?auto_49964 ) ) ( not ( = ?auto_49984 ?auto_49964 ) ) ( not ( = ?auto_49983 ?auto_49964 ) ) ( not ( = ?auto_49959 ?auto_49964 ) ) ( not ( = ?auto_49958 ?auto_49964 ) ) ( not ( = ?auto_49974 ?auto_49964 ) ) ( not ( = ?auto_49973 ?auto_49964 ) ) ( not ( = ?auto_49963 ?auto_49964 ) ) ( not ( = ?auto_49972 ?auto_49964 ) ) ( SURFACE-AT ?auto_49981 ?auto_49968 ) ( CLEAR ?auto_49981 ) ( IS-CRATE ?auto_49972 ) ( not ( = ?auto_49954 ?auto_49981 ) ) ( not ( = ?auto_49955 ?auto_49981 ) ) ( not ( = ?auto_49957 ?auto_49981 ) ) ( not ( = ?auto_49965 ?auto_49981 ) ) ( not ( = ?auto_49984 ?auto_49981 ) ) ( not ( = ?auto_49983 ?auto_49981 ) ) ( not ( = ?auto_49959 ?auto_49981 ) ) ( not ( = ?auto_49958 ?auto_49981 ) ) ( not ( = ?auto_49974 ?auto_49981 ) ) ( not ( = ?auto_49973 ?auto_49981 ) ) ( not ( = ?auto_49963 ?auto_49981 ) ) ( not ( = ?auto_49972 ?auto_49981 ) ) ( not ( = ?auto_49964 ?auto_49981 ) ) ( AVAILABLE ?auto_49967 ) ( not ( = ?auto_49971 ?auto_49968 ) ) ( not ( = ?auto_49982 ?auto_49971 ) ) ( not ( = ?auto_49966 ?auto_49971 ) ) ( not ( = ?auto_49985 ?auto_49971 ) ) ( not ( = ?auto_49975 ?auto_49971 ) ) ( not ( = ?auto_49969 ?auto_49971 ) ) ( not ( = ?auto_49962 ?auto_49971 ) ) ( HOIST-AT ?auto_49980 ?auto_49971 ) ( not ( = ?auto_49967 ?auto_49980 ) ) ( not ( = ?auto_49970 ?auto_49980 ) ) ( not ( = ?auto_49960 ?auto_49980 ) ) ( not ( = ?auto_49956 ?auto_49980 ) ) ( not ( = ?auto_49979 ?auto_49980 ) ) ( not ( = ?auto_49977 ?auto_49980 ) ) ( not ( = ?auto_49978 ?auto_49980 ) ) ( AVAILABLE ?auto_49980 ) ( SURFACE-AT ?auto_49972 ?auto_49971 ) ( ON ?auto_49972 ?auto_49961 ) ( CLEAR ?auto_49972 ) ( not ( = ?auto_49954 ?auto_49961 ) ) ( not ( = ?auto_49955 ?auto_49961 ) ) ( not ( = ?auto_49957 ?auto_49961 ) ) ( not ( = ?auto_49965 ?auto_49961 ) ) ( not ( = ?auto_49984 ?auto_49961 ) ) ( not ( = ?auto_49983 ?auto_49961 ) ) ( not ( = ?auto_49959 ?auto_49961 ) ) ( not ( = ?auto_49958 ?auto_49961 ) ) ( not ( = ?auto_49974 ?auto_49961 ) ) ( not ( = ?auto_49973 ?auto_49961 ) ) ( not ( = ?auto_49963 ?auto_49961 ) ) ( not ( = ?auto_49972 ?auto_49961 ) ) ( not ( = ?auto_49964 ?auto_49961 ) ) ( not ( = ?auto_49981 ?auto_49961 ) ) ( TRUCK-AT ?auto_49976 ?auto_49968 ) )
    :subtasks
    ( ( !DRIVE ?auto_49976 ?auto_49968 ?auto_49971 )
      ( MAKE-ON ?auto_49954 ?auto_49955 )
      ( MAKE-ON-VERIFY ?auto_49954 ?auto_49955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49986 - SURFACE
      ?auto_49987 - SURFACE
    )
    :vars
    (
      ?auto_49995 - HOIST
      ?auto_50011 - PLACE
      ?auto_50015 - PLACE
      ?auto_50000 - HOIST
      ?auto_49997 - SURFACE
      ?auto_50004 - SURFACE
      ?auto_50012 - PLACE
      ?auto_49998 - HOIST
      ?auto_50017 - SURFACE
      ?auto_50016 - SURFACE
      ?auto_49996 - PLACE
      ?auto_49999 - HOIST
      ?auto_50009 - SURFACE
      ?auto_50007 - SURFACE
      ?auto_50002 - PLACE
      ?auto_49991 - HOIST
      ?auto_50001 - SURFACE
      ?auto_49989 - SURFACE
      ?auto_50005 - PLACE
      ?auto_49988 - HOIST
      ?auto_50010 - SURFACE
      ?auto_49990 - SURFACE
      ?auto_50008 - PLACE
      ?auto_49993 - HOIST
      ?auto_49994 - SURFACE
      ?auto_50014 - SURFACE
      ?auto_49992 - PLACE
      ?auto_50013 - HOIST
      ?auto_50006 - SURFACE
      ?auto_50003 - TRUCK
      ?auto_50018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49995 ?auto_50011 ) ( IS-CRATE ?auto_49986 ) ( not ( = ?auto_49986 ?auto_49987 ) ) ( not ( = ?auto_50015 ?auto_50011 ) ) ( HOIST-AT ?auto_50000 ?auto_50015 ) ( not ( = ?auto_49995 ?auto_50000 ) ) ( AVAILABLE ?auto_50000 ) ( SURFACE-AT ?auto_49986 ?auto_50015 ) ( ON ?auto_49986 ?auto_49997 ) ( CLEAR ?auto_49986 ) ( not ( = ?auto_49986 ?auto_49997 ) ) ( not ( = ?auto_49987 ?auto_49997 ) ) ( IS-CRATE ?auto_49987 ) ( not ( = ?auto_49986 ?auto_50004 ) ) ( not ( = ?auto_49987 ?auto_50004 ) ) ( not ( = ?auto_49997 ?auto_50004 ) ) ( not ( = ?auto_50012 ?auto_50011 ) ) ( not ( = ?auto_50015 ?auto_50012 ) ) ( HOIST-AT ?auto_49998 ?auto_50012 ) ( not ( = ?auto_49995 ?auto_49998 ) ) ( not ( = ?auto_50000 ?auto_49998 ) ) ( AVAILABLE ?auto_49998 ) ( SURFACE-AT ?auto_49987 ?auto_50012 ) ( ON ?auto_49987 ?auto_50017 ) ( CLEAR ?auto_49987 ) ( not ( = ?auto_49986 ?auto_50017 ) ) ( not ( = ?auto_49987 ?auto_50017 ) ) ( not ( = ?auto_49997 ?auto_50017 ) ) ( not ( = ?auto_50004 ?auto_50017 ) ) ( IS-CRATE ?auto_50004 ) ( not ( = ?auto_49986 ?auto_50016 ) ) ( not ( = ?auto_49987 ?auto_50016 ) ) ( not ( = ?auto_49997 ?auto_50016 ) ) ( not ( = ?auto_50004 ?auto_50016 ) ) ( not ( = ?auto_50017 ?auto_50016 ) ) ( not ( = ?auto_49996 ?auto_50011 ) ) ( not ( = ?auto_50015 ?auto_49996 ) ) ( not ( = ?auto_50012 ?auto_49996 ) ) ( HOIST-AT ?auto_49999 ?auto_49996 ) ( not ( = ?auto_49995 ?auto_49999 ) ) ( not ( = ?auto_50000 ?auto_49999 ) ) ( not ( = ?auto_49998 ?auto_49999 ) ) ( AVAILABLE ?auto_49999 ) ( SURFACE-AT ?auto_50004 ?auto_49996 ) ( ON ?auto_50004 ?auto_50009 ) ( CLEAR ?auto_50004 ) ( not ( = ?auto_49986 ?auto_50009 ) ) ( not ( = ?auto_49987 ?auto_50009 ) ) ( not ( = ?auto_49997 ?auto_50009 ) ) ( not ( = ?auto_50004 ?auto_50009 ) ) ( not ( = ?auto_50017 ?auto_50009 ) ) ( not ( = ?auto_50016 ?auto_50009 ) ) ( IS-CRATE ?auto_50016 ) ( not ( = ?auto_49986 ?auto_50007 ) ) ( not ( = ?auto_49987 ?auto_50007 ) ) ( not ( = ?auto_49997 ?auto_50007 ) ) ( not ( = ?auto_50004 ?auto_50007 ) ) ( not ( = ?auto_50017 ?auto_50007 ) ) ( not ( = ?auto_50016 ?auto_50007 ) ) ( not ( = ?auto_50009 ?auto_50007 ) ) ( not ( = ?auto_50002 ?auto_50011 ) ) ( not ( = ?auto_50015 ?auto_50002 ) ) ( not ( = ?auto_50012 ?auto_50002 ) ) ( not ( = ?auto_49996 ?auto_50002 ) ) ( HOIST-AT ?auto_49991 ?auto_50002 ) ( not ( = ?auto_49995 ?auto_49991 ) ) ( not ( = ?auto_50000 ?auto_49991 ) ) ( not ( = ?auto_49998 ?auto_49991 ) ) ( not ( = ?auto_49999 ?auto_49991 ) ) ( AVAILABLE ?auto_49991 ) ( SURFACE-AT ?auto_50016 ?auto_50002 ) ( ON ?auto_50016 ?auto_50001 ) ( CLEAR ?auto_50016 ) ( not ( = ?auto_49986 ?auto_50001 ) ) ( not ( = ?auto_49987 ?auto_50001 ) ) ( not ( = ?auto_49997 ?auto_50001 ) ) ( not ( = ?auto_50004 ?auto_50001 ) ) ( not ( = ?auto_50017 ?auto_50001 ) ) ( not ( = ?auto_50016 ?auto_50001 ) ) ( not ( = ?auto_50009 ?auto_50001 ) ) ( not ( = ?auto_50007 ?auto_50001 ) ) ( IS-CRATE ?auto_50007 ) ( not ( = ?auto_49986 ?auto_49989 ) ) ( not ( = ?auto_49987 ?auto_49989 ) ) ( not ( = ?auto_49997 ?auto_49989 ) ) ( not ( = ?auto_50004 ?auto_49989 ) ) ( not ( = ?auto_50017 ?auto_49989 ) ) ( not ( = ?auto_50016 ?auto_49989 ) ) ( not ( = ?auto_50009 ?auto_49989 ) ) ( not ( = ?auto_50007 ?auto_49989 ) ) ( not ( = ?auto_50001 ?auto_49989 ) ) ( not ( = ?auto_50005 ?auto_50011 ) ) ( not ( = ?auto_50015 ?auto_50005 ) ) ( not ( = ?auto_50012 ?auto_50005 ) ) ( not ( = ?auto_49996 ?auto_50005 ) ) ( not ( = ?auto_50002 ?auto_50005 ) ) ( HOIST-AT ?auto_49988 ?auto_50005 ) ( not ( = ?auto_49995 ?auto_49988 ) ) ( not ( = ?auto_50000 ?auto_49988 ) ) ( not ( = ?auto_49998 ?auto_49988 ) ) ( not ( = ?auto_49999 ?auto_49988 ) ) ( not ( = ?auto_49991 ?auto_49988 ) ) ( AVAILABLE ?auto_49988 ) ( SURFACE-AT ?auto_50007 ?auto_50005 ) ( ON ?auto_50007 ?auto_50010 ) ( CLEAR ?auto_50007 ) ( not ( = ?auto_49986 ?auto_50010 ) ) ( not ( = ?auto_49987 ?auto_50010 ) ) ( not ( = ?auto_49997 ?auto_50010 ) ) ( not ( = ?auto_50004 ?auto_50010 ) ) ( not ( = ?auto_50017 ?auto_50010 ) ) ( not ( = ?auto_50016 ?auto_50010 ) ) ( not ( = ?auto_50009 ?auto_50010 ) ) ( not ( = ?auto_50007 ?auto_50010 ) ) ( not ( = ?auto_50001 ?auto_50010 ) ) ( not ( = ?auto_49989 ?auto_50010 ) ) ( IS-CRATE ?auto_49989 ) ( not ( = ?auto_49986 ?auto_49990 ) ) ( not ( = ?auto_49987 ?auto_49990 ) ) ( not ( = ?auto_49997 ?auto_49990 ) ) ( not ( = ?auto_50004 ?auto_49990 ) ) ( not ( = ?auto_50017 ?auto_49990 ) ) ( not ( = ?auto_50016 ?auto_49990 ) ) ( not ( = ?auto_50009 ?auto_49990 ) ) ( not ( = ?auto_50007 ?auto_49990 ) ) ( not ( = ?auto_50001 ?auto_49990 ) ) ( not ( = ?auto_49989 ?auto_49990 ) ) ( not ( = ?auto_50010 ?auto_49990 ) ) ( not ( = ?auto_50008 ?auto_50011 ) ) ( not ( = ?auto_50015 ?auto_50008 ) ) ( not ( = ?auto_50012 ?auto_50008 ) ) ( not ( = ?auto_49996 ?auto_50008 ) ) ( not ( = ?auto_50002 ?auto_50008 ) ) ( not ( = ?auto_50005 ?auto_50008 ) ) ( HOIST-AT ?auto_49993 ?auto_50008 ) ( not ( = ?auto_49995 ?auto_49993 ) ) ( not ( = ?auto_50000 ?auto_49993 ) ) ( not ( = ?auto_49998 ?auto_49993 ) ) ( not ( = ?auto_49999 ?auto_49993 ) ) ( not ( = ?auto_49991 ?auto_49993 ) ) ( not ( = ?auto_49988 ?auto_49993 ) ) ( AVAILABLE ?auto_49993 ) ( SURFACE-AT ?auto_49989 ?auto_50008 ) ( ON ?auto_49989 ?auto_49994 ) ( CLEAR ?auto_49989 ) ( not ( = ?auto_49986 ?auto_49994 ) ) ( not ( = ?auto_49987 ?auto_49994 ) ) ( not ( = ?auto_49997 ?auto_49994 ) ) ( not ( = ?auto_50004 ?auto_49994 ) ) ( not ( = ?auto_50017 ?auto_49994 ) ) ( not ( = ?auto_50016 ?auto_49994 ) ) ( not ( = ?auto_50009 ?auto_49994 ) ) ( not ( = ?auto_50007 ?auto_49994 ) ) ( not ( = ?auto_50001 ?auto_49994 ) ) ( not ( = ?auto_49989 ?auto_49994 ) ) ( not ( = ?auto_50010 ?auto_49994 ) ) ( not ( = ?auto_49990 ?auto_49994 ) ) ( IS-CRATE ?auto_49990 ) ( not ( = ?auto_49986 ?auto_50014 ) ) ( not ( = ?auto_49987 ?auto_50014 ) ) ( not ( = ?auto_49997 ?auto_50014 ) ) ( not ( = ?auto_50004 ?auto_50014 ) ) ( not ( = ?auto_50017 ?auto_50014 ) ) ( not ( = ?auto_50016 ?auto_50014 ) ) ( not ( = ?auto_50009 ?auto_50014 ) ) ( not ( = ?auto_50007 ?auto_50014 ) ) ( not ( = ?auto_50001 ?auto_50014 ) ) ( not ( = ?auto_49989 ?auto_50014 ) ) ( not ( = ?auto_50010 ?auto_50014 ) ) ( not ( = ?auto_49990 ?auto_50014 ) ) ( not ( = ?auto_49994 ?auto_50014 ) ) ( not ( = ?auto_49992 ?auto_50011 ) ) ( not ( = ?auto_50015 ?auto_49992 ) ) ( not ( = ?auto_50012 ?auto_49992 ) ) ( not ( = ?auto_49996 ?auto_49992 ) ) ( not ( = ?auto_50002 ?auto_49992 ) ) ( not ( = ?auto_50005 ?auto_49992 ) ) ( not ( = ?auto_50008 ?auto_49992 ) ) ( HOIST-AT ?auto_50013 ?auto_49992 ) ( not ( = ?auto_49995 ?auto_50013 ) ) ( not ( = ?auto_50000 ?auto_50013 ) ) ( not ( = ?auto_49998 ?auto_50013 ) ) ( not ( = ?auto_49999 ?auto_50013 ) ) ( not ( = ?auto_49991 ?auto_50013 ) ) ( not ( = ?auto_49988 ?auto_50013 ) ) ( not ( = ?auto_49993 ?auto_50013 ) ) ( AVAILABLE ?auto_50013 ) ( SURFACE-AT ?auto_49990 ?auto_49992 ) ( ON ?auto_49990 ?auto_50006 ) ( CLEAR ?auto_49990 ) ( not ( = ?auto_49986 ?auto_50006 ) ) ( not ( = ?auto_49987 ?auto_50006 ) ) ( not ( = ?auto_49997 ?auto_50006 ) ) ( not ( = ?auto_50004 ?auto_50006 ) ) ( not ( = ?auto_50017 ?auto_50006 ) ) ( not ( = ?auto_50016 ?auto_50006 ) ) ( not ( = ?auto_50009 ?auto_50006 ) ) ( not ( = ?auto_50007 ?auto_50006 ) ) ( not ( = ?auto_50001 ?auto_50006 ) ) ( not ( = ?auto_49989 ?auto_50006 ) ) ( not ( = ?auto_50010 ?auto_50006 ) ) ( not ( = ?auto_49990 ?auto_50006 ) ) ( not ( = ?auto_49994 ?auto_50006 ) ) ( not ( = ?auto_50014 ?auto_50006 ) ) ( TRUCK-AT ?auto_50003 ?auto_50011 ) ( SURFACE-AT ?auto_50018 ?auto_50011 ) ( CLEAR ?auto_50018 ) ( LIFTING ?auto_49995 ?auto_50014 ) ( IS-CRATE ?auto_50014 ) ( not ( = ?auto_49986 ?auto_50018 ) ) ( not ( = ?auto_49987 ?auto_50018 ) ) ( not ( = ?auto_49997 ?auto_50018 ) ) ( not ( = ?auto_50004 ?auto_50018 ) ) ( not ( = ?auto_50017 ?auto_50018 ) ) ( not ( = ?auto_50016 ?auto_50018 ) ) ( not ( = ?auto_50009 ?auto_50018 ) ) ( not ( = ?auto_50007 ?auto_50018 ) ) ( not ( = ?auto_50001 ?auto_50018 ) ) ( not ( = ?auto_49989 ?auto_50018 ) ) ( not ( = ?auto_50010 ?auto_50018 ) ) ( not ( = ?auto_49990 ?auto_50018 ) ) ( not ( = ?auto_49994 ?auto_50018 ) ) ( not ( = ?auto_50014 ?auto_50018 ) ) ( not ( = ?auto_50006 ?auto_50018 ) ) )
    :subtasks
    ( ( !DROP ?auto_49995 ?auto_50014 ?auto_50018 ?auto_50011 )
      ( MAKE-ON ?auto_49986 ?auto_49987 )
      ( MAKE-ON-VERIFY ?auto_49986 ?auto_49987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50019 - SURFACE
      ?auto_50020 - SURFACE
    )
    :vars
    (
      ?auto_50042 - HOIST
      ?auto_50021 - PLACE
      ?auto_50039 - PLACE
      ?auto_50035 - HOIST
      ?auto_50047 - SURFACE
      ?auto_50025 - SURFACE
      ?auto_50036 - PLACE
      ?auto_50046 - HOIST
      ?auto_50041 - SURFACE
      ?auto_50040 - SURFACE
      ?auto_50024 - PLACE
      ?auto_50023 - HOIST
      ?auto_50030 - SURFACE
      ?auto_50028 - SURFACE
      ?auto_50049 - PLACE
      ?auto_50034 - HOIST
      ?auto_50022 - SURFACE
      ?auto_50045 - SURFACE
      ?auto_50026 - PLACE
      ?auto_50033 - HOIST
      ?auto_50031 - SURFACE
      ?auto_50044 - SURFACE
      ?auto_50029 - PLACE
      ?auto_50043 - HOIST
      ?auto_50050 - SURFACE
      ?auto_50038 - SURFACE
      ?auto_50048 - PLACE
      ?auto_50037 - HOIST
      ?auto_50027 - SURFACE
      ?auto_50032 - TRUCK
      ?auto_50051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50042 ?auto_50021 ) ( IS-CRATE ?auto_50019 ) ( not ( = ?auto_50019 ?auto_50020 ) ) ( not ( = ?auto_50039 ?auto_50021 ) ) ( HOIST-AT ?auto_50035 ?auto_50039 ) ( not ( = ?auto_50042 ?auto_50035 ) ) ( AVAILABLE ?auto_50035 ) ( SURFACE-AT ?auto_50019 ?auto_50039 ) ( ON ?auto_50019 ?auto_50047 ) ( CLEAR ?auto_50019 ) ( not ( = ?auto_50019 ?auto_50047 ) ) ( not ( = ?auto_50020 ?auto_50047 ) ) ( IS-CRATE ?auto_50020 ) ( not ( = ?auto_50019 ?auto_50025 ) ) ( not ( = ?auto_50020 ?auto_50025 ) ) ( not ( = ?auto_50047 ?auto_50025 ) ) ( not ( = ?auto_50036 ?auto_50021 ) ) ( not ( = ?auto_50039 ?auto_50036 ) ) ( HOIST-AT ?auto_50046 ?auto_50036 ) ( not ( = ?auto_50042 ?auto_50046 ) ) ( not ( = ?auto_50035 ?auto_50046 ) ) ( AVAILABLE ?auto_50046 ) ( SURFACE-AT ?auto_50020 ?auto_50036 ) ( ON ?auto_50020 ?auto_50041 ) ( CLEAR ?auto_50020 ) ( not ( = ?auto_50019 ?auto_50041 ) ) ( not ( = ?auto_50020 ?auto_50041 ) ) ( not ( = ?auto_50047 ?auto_50041 ) ) ( not ( = ?auto_50025 ?auto_50041 ) ) ( IS-CRATE ?auto_50025 ) ( not ( = ?auto_50019 ?auto_50040 ) ) ( not ( = ?auto_50020 ?auto_50040 ) ) ( not ( = ?auto_50047 ?auto_50040 ) ) ( not ( = ?auto_50025 ?auto_50040 ) ) ( not ( = ?auto_50041 ?auto_50040 ) ) ( not ( = ?auto_50024 ?auto_50021 ) ) ( not ( = ?auto_50039 ?auto_50024 ) ) ( not ( = ?auto_50036 ?auto_50024 ) ) ( HOIST-AT ?auto_50023 ?auto_50024 ) ( not ( = ?auto_50042 ?auto_50023 ) ) ( not ( = ?auto_50035 ?auto_50023 ) ) ( not ( = ?auto_50046 ?auto_50023 ) ) ( AVAILABLE ?auto_50023 ) ( SURFACE-AT ?auto_50025 ?auto_50024 ) ( ON ?auto_50025 ?auto_50030 ) ( CLEAR ?auto_50025 ) ( not ( = ?auto_50019 ?auto_50030 ) ) ( not ( = ?auto_50020 ?auto_50030 ) ) ( not ( = ?auto_50047 ?auto_50030 ) ) ( not ( = ?auto_50025 ?auto_50030 ) ) ( not ( = ?auto_50041 ?auto_50030 ) ) ( not ( = ?auto_50040 ?auto_50030 ) ) ( IS-CRATE ?auto_50040 ) ( not ( = ?auto_50019 ?auto_50028 ) ) ( not ( = ?auto_50020 ?auto_50028 ) ) ( not ( = ?auto_50047 ?auto_50028 ) ) ( not ( = ?auto_50025 ?auto_50028 ) ) ( not ( = ?auto_50041 ?auto_50028 ) ) ( not ( = ?auto_50040 ?auto_50028 ) ) ( not ( = ?auto_50030 ?auto_50028 ) ) ( not ( = ?auto_50049 ?auto_50021 ) ) ( not ( = ?auto_50039 ?auto_50049 ) ) ( not ( = ?auto_50036 ?auto_50049 ) ) ( not ( = ?auto_50024 ?auto_50049 ) ) ( HOIST-AT ?auto_50034 ?auto_50049 ) ( not ( = ?auto_50042 ?auto_50034 ) ) ( not ( = ?auto_50035 ?auto_50034 ) ) ( not ( = ?auto_50046 ?auto_50034 ) ) ( not ( = ?auto_50023 ?auto_50034 ) ) ( AVAILABLE ?auto_50034 ) ( SURFACE-AT ?auto_50040 ?auto_50049 ) ( ON ?auto_50040 ?auto_50022 ) ( CLEAR ?auto_50040 ) ( not ( = ?auto_50019 ?auto_50022 ) ) ( not ( = ?auto_50020 ?auto_50022 ) ) ( not ( = ?auto_50047 ?auto_50022 ) ) ( not ( = ?auto_50025 ?auto_50022 ) ) ( not ( = ?auto_50041 ?auto_50022 ) ) ( not ( = ?auto_50040 ?auto_50022 ) ) ( not ( = ?auto_50030 ?auto_50022 ) ) ( not ( = ?auto_50028 ?auto_50022 ) ) ( IS-CRATE ?auto_50028 ) ( not ( = ?auto_50019 ?auto_50045 ) ) ( not ( = ?auto_50020 ?auto_50045 ) ) ( not ( = ?auto_50047 ?auto_50045 ) ) ( not ( = ?auto_50025 ?auto_50045 ) ) ( not ( = ?auto_50041 ?auto_50045 ) ) ( not ( = ?auto_50040 ?auto_50045 ) ) ( not ( = ?auto_50030 ?auto_50045 ) ) ( not ( = ?auto_50028 ?auto_50045 ) ) ( not ( = ?auto_50022 ?auto_50045 ) ) ( not ( = ?auto_50026 ?auto_50021 ) ) ( not ( = ?auto_50039 ?auto_50026 ) ) ( not ( = ?auto_50036 ?auto_50026 ) ) ( not ( = ?auto_50024 ?auto_50026 ) ) ( not ( = ?auto_50049 ?auto_50026 ) ) ( HOIST-AT ?auto_50033 ?auto_50026 ) ( not ( = ?auto_50042 ?auto_50033 ) ) ( not ( = ?auto_50035 ?auto_50033 ) ) ( not ( = ?auto_50046 ?auto_50033 ) ) ( not ( = ?auto_50023 ?auto_50033 ) ) ( not ( = ?auto_50034 ?auto_50033 ) ) ( AVAILABLE ?auto_50033 ) ( SURFACE-AT ?auto_50028 ?auto_50026 ) ( ON ?auto_50028 ?auto_50031 ) ( CLEAR ?auto_50028 ) ( not ( = ?auto_50019 ?auto_50031 ) ) ( not ( = ?auto_50020 ?auto_50031 ) ) ( not ( = ?auto_50047 ?auto_50031 ) ) ( not ( = ?auto_50025 ?auto_50031 ) ) ( not ( = ?auto_50041 ?auto_50031 ) ) ( not ( = ?auto_50040 ?auto_50031 ) ) ( not ( = ?auto_50030 ?auto_50031 ) ) ( not ( = ?auto_50028 ?auto_50031 ) ) ( not ( = ?auto_50022 ?auto_50031 ) ) ( not ( = ?auto_50045 ?auto_50031 ) ) ( IS-CRATE ?auto_50045 ) ( not ( = ?auto_50019 ?auto_50044 ) ) ( not ( = ?auto_50020 ?auto_50044 ) ) ( not ( = ?auto_50047 ?auto_50044 ) ) ( not ( = ?auto_50025 ?auto_50044 ) ) ( not ( = ?auto_50041 ?auto_50044 ) ) ( not ( = ?auto_50040 ?auto_50044 ) ) ( not ( = ?auto_50030 ?auto_50044 ) ) ( not ( = ?auto_50028 ?auto_50044 ) ) ( not ( = ?auto_50022 ?auto_50044 ) ) ( not ( = ?auto_50045 ?auto_50044 ) ) ( not ( = ?auto_50031 ?auto_50044 ) ) ( not ( = ?auto_50029 ?auto_50021 ) ) ( not ( = ?auto_50039 ?auto_50029 ) ) ( not ( = ?auto_50036 ?auto_50029 ) ) ( not ( = ?auto_50024 ?auto_50029 ) ) ( not ( = ?auto_50049 ?auto_50029 ) ) ( not ( = ?auto_50026 ?auto_50029 ) ) ( HOIST-AT ?auto_50043 ?auto_50029 ) ( not ( = ?auto_50042 ?auto_50043 ) ) ( not ( = ?auto_50035 ?auto_50043 ) ) ( not ( = ?auto_50046 ?auto_50043 ) ) ( not ( = ?auto_50023 ?auto_50043 ) ) ( not ( = ?auto_50034 ?auto_50043 ) ) ( not ( = ?auto_50033 ?auto_50043 ) ) ( AVAILABLE ?auto_50043 ) ( SURFACE-AT ?auto_50045 ?auto_50029 ) ( ON ?auto_50045 ?auto_50050 ) ( CLEAR ?auto_50045 ) ( not ( = ?auto_50019 ?auto_50050 ) ) ( not ( = ?auto_50020 ?auto_50050 ) ) ( not ( = ?auto_50047 ?auto_50050 ) ) ( not ( = ?auto_50025 ?auto_50050 ) ) ( not ( = ?auto_50041 ?auto_50050 ) ) ( not ( = ?auto_50040 ?auto_50050 ) ) ( not ( = ?auto_50030 ?auto_50050 ) ) ( not ( = ?auto_50028 ?auto_50050 ) ) ( not ( = ?auto_50022 ?auto_50050 ) ) ( not ( = ?auto_50045 ?auto_50050 ) ) ( not ( = ?auto_50031 ?auto_50050 ) ) ( not ( = ?auto_50044 ?auto_50050 ) ) ( IS-CRATE ?auto_50044 ) ( not ( = ?auto_50019 ?auto_50038 ) ) ( not ( = ?auto_50020 ?auto_50038 ) ) ( not ( = ?auto_50047 ?auto_50038 ) ) ( not ( = ?auto_50025 ?auto_50038 ) ) ( not ( = ?auto_50041 ?auto_50038 ) ) ( not ( = ?auto_50040 ?auto_50038 ) ) ( not ( = ?auto_50030 ?auto_50038 ) ) ( not ( = ?auto_50028 ?auto_50038 ) ) ( not ( = ?auto_50022 ?auto_50038 ) ) ( not ( = ?auto_50045 ?auto_50038 ) ) ( not ( = ?auto_50031 ?auto_50038 ) ) ( not ( = ?auto_50044 ?auto_50038 ) ) ( not ( = ?auto_50050 ?auto_50038 ) ) ( not ( = ?auto_50048 ?auto_50021 ) ) ( not ( = ?auto_50039 ?auto_50048 ) ) ( not ( = ?auto_50036 ?auto_50048 ) ) ( not ( = ?auto_50024 ?auto_50048 ) ) ( not ( = ?auto_50049 ?auto_50048 ) ) ( not ( = ?auto_50026 ?auto_50048 ) ) ( not ( = ?auto_50029 ?auto_50048 ) ) ( HOIST-AT ?auto_50037 ?auto_50048 ) ( not ( = ?auto_50042 ?auto_50037 ) ) ( not ( = ?auto_50035 ?auto_50037 ) ) ( not ( = ?auto_50046 ?auto_50037 ) ) ( not ( = ?auto_50023 ?auto_50037 ) ) ( not ( = ?auto_50034 ?auto_50037 ) ) ( not ( = ?auto_50033 ?auto_50037 ) ) ( not ( = ?auto_50043 ?auto_50037 ) ) ( AVAILABLE ?auto_50037 ) ( SURFACE-AT ?auto_50044 ?auto_50048 ) ( ON ?auto_50044 ?auto_50027 ) ( CLEAR ?auto_50044 ) ( not ( = ?auto_50019 ?auto_50027 ) ) ( not ( = ?auto_50020 ?auto_50027 ) ) ( not ( = ?auto_50047 ?auto_50027 ) ) ( not ( = ?auto_50025 ?auto_50027 ) ) ( not ( = ?auto_50041 ?auto_50027 ) ) ( not ( = ?auto_50040 ?auto_50027 ) ) ( not ( = ?auto_50030 ?auto_50027 ) ) ( not ( = ?auto_50028 ?auto_50027 ) ) ( not ( = ?auto_50022 ?auto_50027 ) ) ( not ( = ?auto_50045 ?auto_50027 ) ) ( not ( = ?auto_50031 ?auto_50027 ) ) ( not ( = ?auto_50044 ?auto_50027 ) ) ( not ( = ?auto_50050 ?auto_50027 ) ) ( not ( = ?auto_50038 ?auto_50027 ) ) ( TRUCK-AT ?auto_50032 ?auto_50021 ) ( SURFACE-AT ?auto_50051 ?auto_50021 ) ( CLEAR ?auto_50051 ) ( IS-CRATE ?auto_50038 ) ( not ( = ?auto_50019 ?auto_50051 ) ) ( not ( = ?auto_50020 ?auto_50051 ) ) ( not ( = ?auto_50047 ?auto_50051 ) ) ( not ( = ?auto_50025 ?auto_50051 ) ) ( not ( = ?auto_50041 ?auto_50051 ) ) ( not ( = ?auto_50040 ?auto_50051 ) ) ( not ( = ?auto_50030 ?auto_50051 ) ) ( not ( = ?auto_50028 ?auto_50051 ) ) ( not ( = ?auto_50022 ?auto_50051 ) ) ( not ( = ?auto_50045 ?auto_50051 ) ) ( not ( = ?auto_50031 ?auto_50051 ) ) ( not ( = ?auto_50044 ?auto_50051 ) ) ( not ( = ?auto_50050 ?auto_50051 ) ) ( not ( = ?auto_50038 ?auto_50051 ) ) ( not ( = ?auto_50027 ?auto_50051 ) ) ( AVAILABLE ?auto_50042 ) ( IN ?auto_50038 ?auto_50032 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50042 ?auto_50038 ?auto_50032 ?auto_50021 )
      ( MAKE-ON ?auto_50019 ?auto_50020 )
      ( MAKE-ON-VERIFY ?auto_50019 ?auto_50020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50052 - SURFACE
      ?auto_50053 - SURFACE
    )
    :vars
    (
      ?auto_50079 - HOIST
      ?auto_50057 - PLACE
      ?auto_50076 - PLACE
      ?auto_50083 - HOIST
      ?auto_50058 - SURFACE
      ?auto_50084 - SURFACE
      ?auto_50081 - PLACE
      ?auto_50062 - HOIST
      ?auto_50078 - SURFACE
      ?auto_50077 - SURFACE
      ?auto_50066 - PLACE
      ?auto_50056 - HOIST
      ?auto_50060 - SURFACE
      ?auto_50055 - SURFACE
      ?auto_50064 - PLACE
      ?auto_50082 - HOIST
      ?auto_50061 - SURFACE
      ?auto_50065 - SURFACE
      ?auto_50068 - PLACE
      ?auto_50054 - HOIST
      ?auto_50067 - SURFACE
      ?auto_50073 - SURFACE
      ?auto_50070 - PLACE
      ?auto_50080 - HOIST
      ?auto_50071 - SURFACE
      ?auto_50075 - SURFACE
      ?auto_50063 - PLACE
      ?auto_50074 - HOIST
      ?auto_50069 - SURFACE
      ?auto_50072 - SURFACE
      ?auto_50059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50079 ?auto_50057 ) ( IS-CRATE ?auto_50052 ) ( not ( = ?auto_50052 ?auto_50053 ) ) ( not ( = ?auto_50076 ?auto_50057 ) ) ( HOIST-AT ?auto_50083 ?auto_50076 ) ( not ( = ?auto_50079 ?auto_50083 ) ) ( AVAILABLE ?auto_50083 ) ( SURFACE-AT ?auto_50052 ?auto_50076 ) ( ON ?auto_50052 ?auto_50058 ) ( CLEAR ?auto_50052 ) ( not ( = ?auto_50052 ?auto_50058 ) ) ( not ( = ?auto_50053 ?auto_50058 ) ) ( IS-CRATE ?auto_50053 ) ( not ( = ?auto_50052 ?auto_50084 ) ) ( not ( = ?auto_50053 ?auto_50084 ) ) ( not ( = ?auto_50058 ?auto_50084 ) ) ( not ( = ?auto_50081 ?auto_50057 ) ) ( not ( = ?auto_50076 ?auto_50081 ) ) ( HOIST-AT ?auto_50062 ?auto_50081 ) ( not ( = ?auto_50079 ?auto_50062 ) ) ( not ( = ?auto_50083 ?auto_50062 ) ) ( AVAILABLE ?auto_50062 ) ( SURFACE-AT ?auto_50053 ?auto_50081 ) ( ON ?auto_50053 ?auto_50078 ) ( CLEAR ?auto_50053 ) ( not ( = ?auto_50052 ?auto_50078 ) ) ( not ( = ?auto_50053 ?auto_50078 ) ) ( not ( = ?auto_50058 ?auto_50078 ) ) ( not ( = ?auto_50084 ?auto_50078 ) ) ( IS-CRATE ?auto_50084 ) ( not ( = ?auto_50052 ?auto_50077 ) ) ( not ( = ?auto_50053 ?auto_50077 ) ) ( not ( = ?auto_50058 ?auto_50077 ) ) ( not ( = ?auto_50084 ?auto_50077 ) ) ( not ( = ?auto_50078 ?auto_50077 ) ) ( not ( = ?auto_50066 ?auto_50057 ) ) ( not ( = ?auto_50076 ?auto_50066 ) ) ( not ( = ?auto_50081 ?auto_50066 ) ) ( HOIST-AT ?auto_50056 ?auto_50066 ) ( not ( = ?auto_50079 ?auto_50056 ) ) ( not ( = ?auto_50083 ?auto_50056 ) ) ( not ( = ?auto_50062 ?auto_50056 ) ) ( AVAILABLE ?auto_50056 ) ( SURFACE-AT ?auto_50084 ?auto_50066 ) ( ON ?auto_50084 ?auto_50060 ) ( CLEAR ?auto_50084 ) ( not ( = ?auto_50052 ?auto_50060 ) ) ( not ( = ?auto_50053 ?auto_50060 ) ) ( not ( = ?auto_50058 ?auto_50060 ) ) ( not ( = ?auto_50084 ?auto_50060 ) ) ( not ( = ?auto_50078 ?auto_50060 ) ) ( not ( = ?auto_50077 ?auto_50060 ) ) ( IS-CRATE ?auto_50077 ) ( not ( = ?auto_50052 ?auto_50055 ) ) ( not ( = ?auto_50053 ?auto_50055 ) ) ( not ( = ?auto_50058 ?auto_50055 ) ) ( not ( = ?auto_50084 ?auto_50055 ) ) ( not ( = ?auto_50078 ?auto_50055 ) ) ( not ( = ?auto_50077 ?auto_50055 ) ) ( not ( = ?auto_50060 ?auto_50055 ) ) ( not ( = ?auto_50064 ?auto_50057 ) ) ( not ( = ?auto_50076 ?auto_50064 ) ) ( not ( = ?auto_50081 ?auto_50064 ) ) ( not ( = ?auto_50066 ?auto_50064 ) ) ( HOIST-AT ?auto_50082 ?auto_50064 ) ( not ( = ?auto_50079 ?auto_50082 ) ) ( not ( = ?auto_50083 ?auto_50082 ) ) ( not ( = ?auto_50062 ?auto_50082 ) ) ( not ( = ?auto_50056 ?auto_50082 ) ) ( AVAILABLE ?auto_50082 ) ( SURFACE-AT ?auto_50077 ?auto_50064 ) ( ON ?auto_50077 ?auto_50061 ) ( CLEAR ?auto_50077 ) ( not ( = ?auto_50052 ?auto_50061 ) ) ( not ( = ?auto_50053 ?auto_50061 ) ) ( not ( = ?auto_50058 ?auto_50061 ) ) ( not ( = ?auto_50084 ?auto_50061 ) ) ( not ( = ?auto_50078 ?auto_50061 ) ) ( not ( = ?auto_50077 ?auto_50061 ) ) ( not ( = ?auto_50060 ?auto_50061 ) ) ( not ( = ?auto_50055 ?auto_50061 ) ) ( IS-CRATE ?auto_50055 ) ( not ( = ?auto_50052 ?auto_50065 ) ) ( not ( = ?auto_50053 ?auto_50065 ) ) ( not ( = ?auto_50058 ?auto_50065 ) ) ( not ( = ?auto_50084 ?auto_50065 ) ) ( not ( = ?auto_50078 ?auto_50065 ) ) ( not ( = ?auto_50077 ?auto_50065 ) ) ( not ( = ?auto_50060 ?auto_50065 ) ) ( not ( = ?auto_50055 ?auto_50065 ) ) ( not ( = ?auto_50061 ?auto_50065 ) ) ( not ( = ?auto_50068 ?auto_50057 ) ) ( not ( = ?auto_50076 ?auto_50068 ) ) ( not ( = ?auto_50081 ?auto_50068 ) ) ( not ( = ?auto_50066 ?auto_50068 ) ) ( not ( = ?auto_50064 ?auto_50068 ) ) ( HOIST-AT ?auto_50054 ?auto_50068 ) ( not ( = ?auto_50079 ?auto_50054 ) ) ( not ( = ?auto_50083 ?auto_50054 ) ) ( not ( = ?auto_50062 ?auto_50054 ) ) ( not ( = ?auto_50056 ?auto_50054 ) ) ( not ( = ?auto_50082 ?auto_50054 ) ) ( AVAILABLE ?auto_50054 ) ( SURFACE-AT ?auto_50055 ?auto_50068 ) ( ON ?auto_50055 ?auto_50067 ) ( CLEAR ?auto_50055 ) ( not ( = ?auto_50052 ?auto_50067 ) ) ( not ( = ?auto_50053 ?auto_50067 ) ) ( not ( = ?auto_50058 ?auto_50067 ) ) ( not ( = ?auto_50084 ?auto_50067 ) ) ( not ( = ?auto_50078 ?auto_50067 ) ) ( not ( = ?auto_50077 ?auto_50067 ) ) ( not ( = ?auto_50060 ?auto_50067 ) ) ( not ( = ?auto_50055 ?auto_50067 ) ) ( not ( = ?auto_50061 ?auto_50067 ) ) ( not ( = ?auto_50065 ?auto_50067 ) ) ( IS-CRATE ?auto_50065 ) ( not ( = ?auto_50052 ?auto_50073 ) ) ( not ( = ?auto_50053 ?auto_50073 ) ) ( not ( = ?auto_50058 ?auto_50073 ) ) ( not ( = ?auto_50084 ?auto_50073 ) ) ( not ( = ?auto_50078 ?auto_50073 ) ) ( not ( = ?auto_50077 ?auto_50073 ) ) ( not ( = ?auto_50060 ?auto_50073 ) ) ( not ( = ?auto_50055 ?auto_50073 ) ) ( not ( = ?auto_50061 ?auto_50073 ) ) ( not ( = ?auto_50065 ?auto_50073 ) ) ( not ( = ?auto_50067 ?auto_50073 ) ) ( not ( = ?auto_50070 ?auto_50057 ) ) ( not ( = ?auto_50076 ?auto_50070 ) ) ( not ( = ?auto_50081 ?auto_50070 ) ) ( not ( = ?auto_50066 ?auto_50070 ) ) ( not ( = ?auto_50064 ?auto_50070 ) ) ( not ( = ?auto_50068 ?auto_50070 ) ) ( HOIST-AT ?auto_50080 ?auto_50070 ) ( not ( = ?auto_50079 ?auto_50080 ) ) ( not ( = ?auto_50083 ?auto_50080 ) ) ( not ( = ?auto_50062 ?auto_50080 ) ) ( not ( = ?auto_50056 ?auto_50080 ) ) ( not ( = ?auto_50082 ?auto_50080 ) ) ( not ( = ?auto_50054 ?auto_50080 ) ) ( AVAILABLE ?auto_50080 ) ( SURFACE-AT ?auto_50065 ?auto_50070 ) ( ON ?auto_50065 ?auto_50071 ) ( CLEAR ?auto_50065 ) ( not ( = ?auto_50052 ?auto_50071 ) ) ( not ( = ?auto_50053 ?auto_50071 ) ) ( not ( = ?auto_50058 ?auto_50071 ) ) ( not ( = ?auto_50084 ?auto_50071 ) ) ( not ( = ?auto_50078 ?auto_50071 ) ) ( not ( = ?auto_50077 ?auto_50071 ) ) ( not ( = ?auto_50060 ?auto_50071 ) ) ( not ( = ?auto_50055 ?auto_50071 ) ) ( not ( = ?auto_50061 ?auto_50071 ) ) ( not ( = ?auto_50065 ?auto_50071 ) ) ( not ( = ?auto_50067 ?auto_50071 ) ) ( not ( = ?auto_50073 ?auto_50071 ) ) ( IS-CRATE ?auto_50073 ) ( not ( = ?auto_50052 ?auto_50075 ) ) ( not ( = ?auto_50053 ?auto_50075 ) ) ( not ( = ?auto_50058 ?auto_50075 ) ) ( not ( = ?auto_50084 ?auto_50075 ) ) ( not ( = ?auto_50078 ?auto_50075 ) ) ( not ( = ?auto_50077 ?auto_50075 ) ) ( not ( = ?auto_50060 ?auto_50075 ) ) ( not ( = ?auto_50055 ?auto_50075 ) ) ( not ( = ?auto_50061 ?auto_50075 ) ) ( not ( = ?auto_50065 ?auto_50075 ) ) ( not ( = ?auto_50067 ?auto_50075 ) ) ( not ( = ?auto_50073 ?auto_50075 ) ) ( not ( = ?auto_50071 ?auto_50075 ) ) ( not ( = ?auto_50063 ?auto_50057 ) ) ( not ( = ?auto_50076 ?auto_50063 ) ) ( not ( = ?auto_50081 ?auto_50063 ) ) ( not ( = ?auto_50066 ?auto_50063 ) ) ( not ( = ?auto_50064 ?auto_50063 ) ) ( not ( = ?auto_50068 ?auto_50063 ) ) ( not ( = ?auto_50070 ?auto_50063 ) ) ( HOIST-AT ?auto_50074 ?auto_50063 ) ( not ( = ?auto_50079 ?auto_50074 ) ) ( not ( = ?auto_50083 ?auto_50074 ) ) ( not ( = ?auto_50062 ?auto_50074 ) ) ( not ( = ?auto_50056 ?auto_50074 ) ) ( not ( = ?auto_50082 ?auto_50074 ) ) ( not ( = ?auto_50054 ?auto_50074 ) ) ( not ( = ?auto_50080 ?auto_50074 ) ) ( AVAILABLE ?auto_50074 ) ( SURFACE-AT ?auto_50073 ?auto_50063 ) ( ON ?auto_50073 ?auto_50069 ) ( CLEAR ?auto_50073 ) ( not ( = ?auto_50052 ?auto_50069 ) ) ( not ( = ?auto_50053 ?auto_50069 ) ) ( not ( = ?auto_50058 ?auto_50069 ) ) ( not ( = ?auto_50084 ?auto_50069 ) ) ( not ( = ?auto_50078 ?auto_50069 ) ) ( not ( = ?auto_50077 ?auto_50069 ) ) ( not ( = ?auto_50060 ?auto_50069 ) ) ( not ( = ?auto_50055 ?auto_50069 ) ) ( not ( = ?auto_50061 ?auto_50069 ) ) ( not ( = ?auto_50065 ?auto_50069 ) ) ( not ( = ?auto_50067 ?auto_50069 ) ) ( not ( = ?auto_50073 ?auto_50069 ) ) ( not ( = ?auto_50071 ?auto_50069 ) ) ( not ( = ?auto_50075 ?auto_50069 ) ) ( SURFACE-AT ?auto_50072 ?auto_50057 ) ( CLEAR ?auto_50072 ) ( IS-CRATE ?auto_50075 ) ( not ( = ?auto_50052 ?auto_50072 ) ) ( not ( = ?auto_50053 ?auto_50072 ) ) ( not ( = ?auto_50058 ?auto_50072 ) ) ( not ( = ?auto_50084 ?auto_50072 ) ) ( not ( = ?auto_50078 ?auto_50072 ) ) ( not ( = ?auto_50077 ?auto_50072 ) ) ( not ( = ?auto_50060 ?auto_50072 ) ) ( not ( = ?auto_50055 ?auto_50072 ) ) ( not ( = ?auto_50061 ?auto_50072 ) ) ( not ( = ?auto_50065 ?auto_50072 ) ) ( not ( = ?auto_50067 ?auto_50072 ) ) ( not ( = ?auto_50073 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50072 ) ) ( not ( = ?auto_50075 ?auto_50072 ) ) ( not ( = ?auto_50069 ?auto_50072 ) ) ( AVAILABLE ?auto_50079 ) ( IN ?auto_50075 ?auto_50059 ) ( TRUCK-AT ?auto_50059 ?auto_50066 ) )
    :subtasks
    ( ( !DRIVE ?auto_50059 ?auto_50066 ?auto_50057 )
      ( MAKE-ON ?auto_50052 ?auto_50053 )
      ( MAKE-ON-VERIFY ?auto_50052 ?auto_50053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50085 - SURFACE
      ?auto_50086 - SURFACE
    )
    :vars
    (
      ?auto_50098 - HOIST
      ?auto_50111 - PLACE
      ?auto_50096 - PLACE
      ?auto_50102 - HOIST
      ?auto_50112 - SURFACE
      ?auto_50103 - SURFACE
      ?auto_50100 - PLACE
      ?auto_50113 - HOIST
      ?auto_50097 - SURFACE
      ?auto_50088 - SURFACE
      ?auto_50116 - PLACE
      ?auto_50109 - HOIST
      ?auto_50106 - SURFACE
      ?auto_50110 - SURFACE
      ?auto_50115 - PLACE
      ?auto_50101 - HOIST
      ?auto_50108 - SURFACE
      ?auto_50104 - SURFACE
      ?auto_50117 - PLACE
      ?auto_50114 - HOIST
      ?auto_50089 - SURFACE
      ?auto_50093 - SURFACE
      ?auto_50087 - PLACE
      ?auto_50099 - HOIST
      ?auto_50092 - SURFACE
      ?auto_50095 - SURFACE
      ?auto_50090 - PLACE
      ?auto_50094 - HOIST
      ?auto_50105 - SURFACE
      ?auto_50091 - SURFACE
      ?auto_50107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50098 ?auto_50111 ) ( IS-CRATE ?auto_50085 ) ( not ( = ?auto_50085 ?auto_50086 ) ) ( not ( = ?auto_50096 ?auto_50111 ) ) ( HOIST-AT ?auto_50102 ?auto_50096 ) ( not ( = ?auto_50098 ?auto_50102 ) ) ( AVAILABLE ?auto_50102 ) ( SURFACE-AT ?auto_50085 ?auto_50096 ) ( ON ?auto_50085 ?auto_50112 ) ( CLEAR ?auto_50085 ) ( not ( = ?auto_50085 ?auto_50112 ) ) ( not ( = ?auto_50086 ?auto_50112 ) ) ( IS-CRATE ?auto_50086 ) ( not ( = ?auto_50085 ?auto_50103 ) ) ( not ( = ?auto_50086 ?auto_50103 ) ) ( not ( = ?auto_50112 ?auto_50103 ) ) ( not ( = ?auto_50100 ?auto_50111 ) ) ( not ( = ?auto_50096 ?auto_50100 ) ) ( HOIST-AT ?auto_50113 ?auto_50100 ) ( not ( = ?auto_50098 ?auto_50113 ) ) ( not ( = ?auto_50102 ?auto_50113 ) ) ( AVAILABLE ?auto_50113 ) ( SURFACE-AT ?auto_50086 ?auto_50100 ) ( ON ?auto_50086 ?auto_50097 ) ( CLEAR ?auto_50086 ) ( not ( = ?auto_50085 ?auto_50097 ) ) ( not ( = ?auto_50086 ?auto_50097 ) ) ( not ( = ?auto_50112 ?auto_50097 ) ) ( not ( = ?auto_50103 ?auto_50097 ) ) ( IS-CRATE ?auto_50103 ) ( not ( = ?auto_50085 ?auto_50088 ) ) ( not ( = ?auto_50086 ?auto_50088 ) ) ( not ( = ?auto_50112 ?auto_50088 ) ) ( not ( = ?auto_50103 ?auto_50088 ) ) ( not ( = ?auto_50097 ?auto_50088 ) ) ( not ( = ?auto_50116 ?auto_50111 ) ) ( not ( = ?auto_50096 ?auto_50116 ) ) ( not ( = ?auto_50100 ?auto_50116 ) ) ( HOIST-AT ?auto_50109 ?auto_50116 ) ( not ( = ?auto_50098 ?auto_50109 ) ) ( not ( = ?auto_50102 ?auto_50109 ) ) ( not ( = ?auto_50113 ?auto_50109 ) ) ( SURFACE-AT ?auto_50103 ?auto_50116 ) ( ON ?auto_50103 ?auto_50106 ) ( CLEAR ?auto_50103 ) ( not ( = ?auto_50085 ?auto_50106 ) ) ( not ( = ?auto_50086 ?auto_50106 ) ) ( not ( = ?auto_50112 ?auto_50106 ) ) ( not ( = ?auto_50103 ?auto_50106 ) ) ( not ( = ?auto_50097 ?auto_50106 ) ) ( not ( = ?auto_50088 ?auto_50106 ) ) ( IS-CRATE ?auto_50088 ) ( not ( = ?auto_50085 ?auto_50110 ) ) ( not ( = ?auto_50086 ?auto_50110 ) ) ( not ( = ?auto_50112 ?auto_50110 ) ) ( not ( = ?auto_50103 ?auto_50110 ) ) ( not ( = ?auto_50097 ?auto_50110 ) ) ( not ( = ?auto_50088 ?auto_50110 ) ) ( not ( = ?auto_50106 ?auto_50110 ) ) ( not ( = ?auto_50115 ?auto_50111 ) ) ( not ( = ?auto_50096 ?auto_50115 ) ) ( not ( = ?auto_50100 ?auto_50115 ) ) ( not ( = ?auto_50116 ?auto_50115 ) ) ( HOIST-AT ?auto_50101 ?auto_50115 ) ( not ( = ?auto_50098 ?auto_50101 ) ) ( not ( = ?auto_50102 ?auto_50101 ) ) ( not ( = ?auto_50113 ?auto_50101 ) ) ( not ( = ?auto_50109 ?auto_50101 ) ) ( AVAILABLE ?auto_50101 ) ( SURFACE-AT ?auto_50088 ?auto_50115 ) ( ON ?auto_50088 ?auto_50108 ) ( CLEAR ?auto_50088 ) ( not ( = ?auto_50085 ?auto_50108 ) ) ( not ( = ?auto_50086 ?auto_50108 ) ) ( not ( = ?auto_50112 ?auto_50108 ) ) ( not ( = ?auto_50103 ?auto_50108 ) ) ( not ( = ?auto_50097 ?auto_50108 ) ) ( not ( = ?auto_50088 ?auto_50108 ) ) ( not ( = ?auto_50106 ?auto_50108 ) ) ( not ( = ?auto_50110 ?auto_50108 ) ) ( IS-CRATE ?auto_50110 ) ( not ( = ?auto_50085 ?auto_50104 ) ) ( not ( = ?auto_50086 ?auto_50104 ) ) ( not ( = ?auto_50112 ?auto_50104 ) ) ( not ( = ?auto_50103 ?auto_50104 ) ) ( not ( = ?auto_50097 ?auto_50104 ) ) ( not ( = ?auto_50088 ?auto_50104 ) ) ( not ( = ?auto_50106 ?auto_50104 ) ) ( not ( = ?auto_50110 ?auto_50104 ) ) ( not ( = ?auto_50108 ?auto_50104 ) ) ( not ( = ?auto_50117 ?auto_50111 ) ) ( not ( = ?auto_50096 ?auto_50117 ) ) ( not ( = ?auto_50100 ?auto_50117 ) ) ( not ( = ?auto_50116 ?auto_50117 ) ) ( not ( = ?auto_50115 ?auto_50117 ) ) ( HOIST-AT ?auto_50114 ?auto_50117 ) ( not ( = ?auto_50098 ?auto_50114 ) ) ( not ( = ?auto_50102 ?auto_50114 ) ) ( not ( = ?auto_50113 ?auto_50114 ) ) ( not ( = ?auto_50109 ?auto_50114 ) ) ( not ( = ?auto_50101 ?auto_50114 ) ) ( AVAILABLE ?auto_50114 ) ( SURFACE-AT ?auto_50110 ?auto_50117 ) ( ON ?auto_50110 ?auto_50089 ) ( CLEAR ?auto_50110 ) ( not ( = ?auto_50085 ?auto_50089 ) ) ( not ( = ?auto_50086 ?auto_50089 ) ) ( not ( = ?auto_50112 ?auto_50089 ) ) ( not ( = ?auto_50103 ?auto_50089 ) ) ( not ( = ?auto_50097 ?auto_50089 ) ) ( not ( = ?auto_50088 ?auto_50089 ) ) ( not ( = ?auto_50106 ?auto_50089 ) ) ( not ( = ?auto_50110 ?auto_50089 ) ) ( not ( = ?auto_50108 ?auto_50089 ) ) ( not ( = ?auto_50104 ?auto_50089 ) ) ( IS-CRATE ?auto_50104 ) ( not ( = ?auto_50085 ?auto_50093 ) ) ( not ( = ?auto_50086 ?auto_50093 ) ) ( not ( = ?auto_50112 ?auto_50093 ) ) ( not ( = ?auto_50103 ?auto_50093 ) ) ( not ( = ?auto_50097 ?auto_50093 ) ) ( not ( = ?auto_50088 ?auto_50093 ) ) ( not ( = ?auto_50106 ?auto_50093 ) ) ( not ( = ?auto_50110 ?auto_50093 ) ) ( not ( = ?auto_50108 ?auto_50093 ) ) ( not ( = ?auto_50104 ?auto_50093 ) ) ( not ( = ?auto_50089 ?auto_50093 ) ) ( not ( = ?auto_50087 ?auto_50111 ) ) ( not ( = ?auto_50096 ?auto_50087 ) ) ( not ( = ?auto_50100 ?auto_50087 ) ) ( not ( = ?auto_50116 ?auto_50087 ) ) ( not ( = ?auto_50115 ?auto_50087 ) ) ( not ( = ?auto_50117 ?auto_50087 ) ) ( HOIST-AT ?auto_50099 ?auto_50087 ) ( not ( = ?auto_50098 ?auto_50099 ) ) ( not ( = ?auto_50102 ?auto_50099 ) ) ( not ( = ?auto_50113 ?auto_50099 ) ) ( not ( = ?auto_50109 ?auto_50099 ) ) ( not ( = ?auto_50101 ?auto_50099 ) ) ( not ( = ?auto_50114 ?auto_50099 ) ) ( AVAILABLE ?auto_50099 ) ( SURFACE-AT ?auto_50104 ?auto_50087 ) ( ON ?auto_50104 ?auto_50092 ) ( CLEAR ?auto_50104 ) ( not ( = ?auto_50085 ?auto_50092 ) ) ( not ( = ?auto_50086 ?auto_50092 ) ) ( not ( = ?auto_50112 ?auto_50092 ) ) ( not ( = ?auto_50103 ?auto_50092 ) ) ( not ( = ?auto_50097 ?auto_50092 ) ) ( not ( = ?auto_50088 ?auto_50092 ) ) ( not ( = ?auto_50106 ?auto_50092 ) ) ( not ( = ?auto_50110 ?auto_50092 ) ) ( not ( = ?auto_50108 ?auto_50092 ) ) ( not ( = ?auto_50104 ?auto_50092 ) ) ( not ( = ?auto_50089 ?auto_50092 ) ) ( not ( = ?auto_50093 ?auto_50092 ) ) ( IS-CRATE ?auto_50093 ) ( not ( = ?auto_50085 ?auto_50095 ) ) ( not ( = ?auto_50086 ?auto_50095 ) ) ( not ( = ?auto_50112 ?auto_50095 ) ) ( not ( = ?auto_50103 ?auto_50095 ) ) ( not ( = ?auto_50097 ?auto_50095 ) ) ( not ( = ?auto_50088 ?auto_50095 ) ) ( not ( = ?auto_50106 ?auto_50095 ) ) ( not ( = ?auto_50110 ?auto_50095 ) ) ( not ( = ?auto_50108 ?auto_50095 ) ) ( not ( = ?auto_50104 ?auto_50095 ) ) ( not ( = ?auto_50089 ?auto_50095 ) ) ( not ( = ?auto_50093 ?auto_50095 ) ) ( not ( = ?auto_50092 ?auto_50095 ) ) ( not ( = ?auto_50090 ?auto_50111 ) ) ( not ( = ?auto_50096 ?auto_50090 ) ) ( not ( = ?auto_50100 ?auto_50090 ) ) ( not ( = ?auto_50116 ?auto_50090 ) ) ( not ( = ?auto_50115 ?auto_50090 ) ) ( not ( = ?auto_50117 ?auto_50090 ) ) ( not ( = ?auto_50087 ?auto_50090 ) ) ( HOIST-AT ?auto_50094 ?auto_50090 ) ( not ( = ?auto_50098 ?auto_50094 ) ) ( not ( = ?auto_50102 ?auto_50094 ) ) ( not ( = ?auto_50113 ?auto_50094 ) ) ( not ( = ?auto_50109 ?auto_50094 ) ) ( not ( = ?auto_50101 ?auto_50094 ) ) ( not ( = ?auto_50114 ?auto_50094 ) ) ( not ( = ?auto_50099 ?auto_50094 ) ) ( AVAILABLE ?auto_50094 ) ( SURFACE-AT ?auto_50093 ?auto_50090 ) ( ON ?auto_50093 ?auto_50105 ) ( CLEAR ?auto_50093 ) ( not ( = ?auto_50085 ?auto_50105 ) ) ( not ( = ?auto_50086 ?auto_50105 ) ) ( not ( = ?auto_50112 ?auto_50105 ) ) ( not ( = ?auto_50103 ?auto_50105 ) ) ( not ( = ?auto_50097 ?auto_50105 ) ) ( not ( = ?auto_50088 ?auto_50105 ) ) ( not ( = ?auto_50106 ?auto_50105 ) ) ( not ( = ?auto_50110 ?auto_50105 ) ) ( not ( = ?auto_50108 ?auto_50105 ) ) ( not ( = ?auto_50104 ?auto_50105 ) ) ( not ( = ?auto_50089 ?auto_50105 ) ) ( not ( = ?auto_50093 ?auto_50105 ) ) ( not ( = ?auto_50092 ?auto_50105 ) ) ( not ( = ?auto_50095 ?auto_50105 ) ) ( SURFACE-AT ?auto_50091 ?auto_50111 ) ( CLEAR ?auto_50091 ) ( IS-CRATE ?auto_50095 ) ( not ( = ?auto_50085 ?auto_50091 ) ) ( not ( = ?auto_50086 ?auto_50091 ) ) ( not ( = ?auto_50112 ?auto_50091 ) ) ( not ( = ?auto_50103 ?auto_50091 ) ) ( not ( = ?auto_50097 ?auto_50091 ) ) ( not ( = ?auto_50088 ?auto_50091 ) ) ( not ( = ?auto_50106 ?auto_50091 ) ) ( not ( = ?auto_50110 ?auto_50091 ) ) ( not ( = ?auto_50108 ?auto_50091 ) ) ( not ( = ?auto_50104 ?auto_50091 ) ) ( not ( = ?auto_50089 ?auto_50091 ) ) ( not ( = ?auto_50093 ?auto_50091 ) ) ( not ( = ?auto_50092 ?auto_50091 ) ) ( not ( = ?auto_50095 ?auto_50091 ) ) ( not ( = ?auto_50105 ?auto_50091 ) ) ( AVAILABLE ?auto_50098 ) ( TRUCK-AT ?auto_50107 ?auto_50116 ) ( LIFTING ?auto_50109 ?auto_50095 ) )
    :subtasks
    ( ( !LOAD ?auto_50109 ?auto_50095 ?auto_50107 ?auto_50116 )
      ( MAKE-ON ?auto_50085 ?auto_50086 )
      ( MAKE-ON-VERIFY ?auto_50085 ?auto_50086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50118 - SURFACE
      ?auto_50119 - SURFACE
    )
    :vars
    (
      ?auto_50142 - HOIST
      ?auto_50123 - PLACE
      ?auto_50140 - PLACE
      ?auto_50138 - HOIST
      ?auto_50120 - SURFACE
      ?auto_50131 - SURFACE
      ?auto_50144 - PLACE
      ?auto_50124 - HOIST
      ?auto_50141 - SURFACE
      ?auto_50126 - SURFACE
      ?auto_50128 - PLACE
      ?auto_50137 - HOIST
      ?auto_50134 - SURFACE
      ?auto_50130 - SURFACE
      ?auto_50121 - PLACE
      ?auto_50150 - HOIST
      ?auto_50136 - SURFACE
      ?auto_50132 - SURFACE
      ?auto_50129 - PLACE
      ?auto_50122 - HOIST
      ?auto_50148 - SURFACE
      ?auto_50127 - SURFACE
      ?auto_50149 - PLACE
      ?auto_50143 - HOIST
      ?auto_50125 - SURFACE
      ?auto_50139 - SURFACE
      ?auto_50147 - PLACE
      ?auto_50145 - HOIST
      ?auto_50133 - SURFACE
      ?auto_50146 - SURFACE
      ?auto_50135 - TRUCK
      ?auto_50151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50142 ?auto_50123 ) ( IS-CRATE ?auto_50118 ) ( not ( = ?auto_50118 ?auto_50119 ) ) ( not ( = ?auto_50140 ?auto_50123 ) ) ( HOIST-AT ?auto_50138 ?auto_50140 ) ( not ( = ?auto_50142 ?auto_50138 ) ) ( AVAILABLE ?auto_50138 ) ( SURFACE-AT ?auto_50118 ?auto_50140 ) ( ON ?auto_50118 ?auto_50120 ) ( CLEAR ?auto_50118 ) ( not ( = ?auto_50118 ?auto_50120 ) ) ( not ( = ?auto_50119 ?auto_50120 ) ) ( IS-CRATE ?auto_50119 ) ( not ( = ?auto_50118 ?auto_50131 ) ) ( not ( = ?auto_50119 ?auto_50131 ) ) ( not ( = ?auto_50120 ?auto_50131 ) ) ( not ( = ?auto_50144 ?auto_50123 ) ) ( not ( = ?auto_50140 ?auto_50144 ) ) ( HOIST-AT ?auto_50124 ?auto_50144 ) ( not ( = ?auto_50142 ?auto_50124 ) ) ( not ( = ?auto_50138 ?auto_50124 ) ) ( AVAILABLE ?auto_50124 ) ( SURFACE-AT ?auto_50119 ?auto_50144 ) ( ON ?auto_50119 ?auto_50141 ) ( CLEAR ?auto_50119 ) ( not ( = ?auto_50118 ?auto_50141 ) ) ( not ( = ?auto_50119 ?auto_50141 ) ) ( not ( = ?auto_50120 ?auto_50141 ) ) ( not ( = ?auto_50131 ?auto_50141 ) ) ( IS-CRATE ?auto_50131 ) ( not ( = ?auto_50118 ?auto_50126 ) ) ( not ( = ?auto_50119 ?auto_50126 ) ) ( not ( = ?auto_50120 ?auto_50126 ) ) ( not ( = ?auto_50131 ?auto_50126 ) ) ( not ( = ?auto_50141 ?auto_50126 ) ) ( not ( = ?auto_50128 ?auto_50123 ) ) ( not ( = ?auto_50140 ?auto_50128 ) ) ( not ( = ?auto_50144 ?auto_50128 ) ) ( HOIST-AT ?auto_50137 ?auto_50128 ) ( not ( = ?auto_50142 ?auto_50137 ) ) ( not ( = ?auto_50138 ?auto_50137 ) ) ( not ( = ?auto_50124 ?auto_50137 ) ) ( SURFACE-AT ?auto_50131 ?auto_50128 ) ( ON ?auto_50131 ?auto_50134 ) ( CLEAR ?auto_50131 ) ( not ( = ?auto_50118 ?auto_50134 ) ) ( not ( = ?auto_50119 ?auto_50134 ) ) ( not ( = ?auto_50120 ?auto_50134 ) ) ( not ( = ?auto_50131 ?auto_50134 ) ) ( not ( = ?auto_50141 ?auto_50134 ) ) ( not ( = ?auto_50126 ?auto_50134 ) ) ( IS-CRATE ?auto_50126 ) ( not ( = ?auto_50118 ?auto_50130 ) ) ( not ( = ?auto_50119 ?auto_50130 ) ) ( not ( = ?auto_50120 ?auto_50130 ) ) ( not ( = ?auto_50131 ?auto_50130 ) ) ( not ( = ?auto_50141 ?auto_50130 ) ) ( not ( = ?auto_50126 ?auto_50130 ) ) ( not ( = ?auto_50134 ?auto_50130 ) ) ( not ( = ?auto_50121 ?auto_50123 ) ) ( not ( = ?auto_50140 ?auto_50121 ) ) ( not ( = ?auto_50144 ?auto_50121 ) ) ( not ( = ?auto_50128 ?auto_50121 ) ) ( HOIST-AT ?auto_50150 ?auto_50121 ) ( not ( = ?auto_50142 ?auto_50150 ) ) ( not ( = ?auto_50138 ?auto_50150 ) ) ( not ( = ?auto_50124 ?auto_50150 ) ) ( not ( = ?auto_50137 ?auto_50150 ) ) ( AVAILABLE ?auto_50150 ) ( SURFACE-AT ?auto_50126 ?auto_50121 ) ( ON ?auto_50126 ?auto_50136 ) ( CLEAR ?auto_50126 ) ( not ( = ?auto_50118 ?auto_50136 ) ) ( not ( = ?auto_50119 ?auto_50136 ) ) ( not ( = ?auto_50120 ?auto_50136 ) ) ( not ( = ?auto_50131 ?auto_50136 ) ) ( not ( = ?auto_50141 ?auto_50136 ) ) ( not ( = ?auto_50126 ?auto_50136 ) ) ( not ( = ?auto_50134 ?auto_50136 ) ) ( not ( = ?auto_50130 ?auto_50136 ) ) ( IS-CRATE ?auto_50130 ) ( not ( = ?auto_50118 ?auto_50132 ) ) ( not ( = ?auto_50119 ?auto_50132 ) ) ( not ( = ?auto_50120 ?auto_50132 ) ) ( not ( = ?auto_50131 ?auto_50132 ) ) ( not ( = ?auto_50141 ?auto_50132 ) ) ( not ( = ?auto_50126 ?auto_50132 ) ) ( not ( = ?auto_50134 ?auto_50132 ) ) ( not ( = ?auto_50130 ?auto_50132 ) ) ( not ( = ?auto_50136 ?auto_50132 ) ) ( not ( = ?auto_50129 ?auto_50123 ) ) ( not ( = ?auto_50140 ?auto_50129 ) ) ( not ( = ?auto_50144 ?auto_50129 ) ) ( not ( = ?auto_50128 ?auto_50129 ) ) ( not ( = ?auto_50121 ?auto_50129 ) ) ( HOIST-AT ?auto_50122 ?auto_50129 ) ( not ( = ?auto_50142 ?auto_50122 ) ) ( not ( = ?auto_50138 ?auto_50122 ) ) ( not ( = ?auto_50124 ?auto_50122 ) ) ( not ( = ?auto_50137 ?auto_50122 ) ) ( not ( = ?auto_50150 ?auto_50122 ) ) ( AVAILABLE ?auto_50122 ) ( SURFACE-AT ?auto_50130 ?auto_50129 ) ( ON ?auto_50130 ?auto_50148 ) ( CLEAR ?auto_50130 ) ( not ( = ?auto_50118 ?auto_50148 ) ) ( not ( = ?auto_50119 ?auto_50148 ) ) ( not ( = ?auto_50120 ?auto_50148 ) ) ( not ( = ?auto_50131 ?auto_50148 ) ) ( not ( = ?auto_50141 ?auto_50148 ) ) ( not ( = ?auto_50126 ?auto_50148 ) ) ( not ( = ?auto_50134 ?auto_50148 ) ) ( not ( = ?auto_50130 ?auto_50148 ) ) ( not ( = ?auto_50136 ?auto_50148 ) ) ( not ( = ?auto_50132 ?auto_50148 ) ) ( IS-CRATE ?auto_50132 ) ( not ( = ?auto_50118 ?auto_50127 ) ) ( not ( = ?auto_50119 ?auto_50127 ) ) ( not ( = ?auto_50120 ?auto_50127 ) ) ( not ( = ?auto_50131 ?auto_50127 ) ) ( not ( = ?auto_50141 ?auto_50127 ) ) ( not ( = ?auto_50126 ?auto_50127 ) ) ( not ( = ?auto_50134 ?auto_50127 ) ) ( not ( = ?auto_50130 ?auto_50127 ) ) ( not ( = ?auto_50136 ?auto_50127 ) ) ( not ( = ?auto_50132 ?auto_50127 ) ) ( not ( = ?auto_50148 ?auto_50127 ) ) ( not ( = ?auto_50149 ?auto_50123 ) ) ( not ( = ?auto_50140 ?auto_50149 ) ) ( not ( = ?auto_50144 ?auto_50149 ) ) ( not ( = ?auto_50128 ?auto_50149 ) ) ( not ( = ?auto_50121 ?auto_50149 ) ) ( not ( = ?auto_50129 ?auto_50149 ) ) ( HOIST-AT ?auto_50143 ?auto_50149 ) ( not ( = ?auto_50142 ?auto_50143 ) ) ( not ( = ?auto_50138 ?auto_50143 ) ) ( not ( = ?auto_50124 ?auto_50143 ) ) ( not ( = ?auto_50137 ?auto_50143 ) ) ( not ( = ?auto_50150 ?auto_50143 ) ) ( not ( = ?auto_50122 ?auto_50143 ) ) ( AVAILABLE ?auto_50143 ) ( SURFACE-AT ?auto_50132 ?auto_50149 ) ( ON ?auto_50132 ?auto_50125 ) ( CLEAR ?auto_50132 ) ( not ( = ?auto_50118 ?auto_50125 ) ) ( not ( = ?auto_50119 ?auto_50125 ) ) ( not ( = ?auto_50120 ?auto_50125 ) ) ( not ( = ?auto_50131 ?auto_50125 ) ) ( not ( = ?auto_50141 ?auto_50125 ) ) ( not ( = ?auto_50126 ?auto_50125 ) ) ( not ( = ?auto_50134 ?auto_50125 ) ) ( not ( = ?auto_50130 ?auto_50125 ) ) ( not ( = ?auto_50136 ?auto_50125 ) ) ( not ( = ?auto_50132 ?auto_50125 ) ) ( not ( = ?auto_50148 ?auto_50125 ) ) ( not ( = ?auto_50127 ?auto_50125 ) ) ( IS-CRATE ?auto_50127 ) ( not ( = ?auto_50118 ?auto_50139 ) ) ( not ( = ?auto_50119 ?auto_50139 ) ) ( not ( = ?auto_50120 ?auto_50139 ) ) ( not ( = ?auto_50131 ?auto_50139 ) ) ( not ( = ?auto_50141 ?auto_50139 ) ) ( not ( = ?auto_50126 ?auto_50139 ) ) ( not ( = ?auto_50134 ?auto_50139 ) ) ( not ( = ?auto_50130 ?auto_50139 ) ) ( not ( = ?auto_50136 ?auto_50139 ) ) ( not ( = ?auto_50132 ?auto_50139 ) ) ( not ( = ?auto_50148 ?auto_50139 ) ) ( not ( = ?auto_50127 ?auto_50139 ) ) ( not ( = ?auto_50125 ?auto_50139 ) ) ( not ( = ?auto_50147 ?auto_50123 ) ) ( not ( = ?auto_50140 ?auto_50147 ) ) ( not ( = ?auto_50144 ?auto_50147 ) ) ( not ( = ?auto_50128 ?auto_50147 ) ) ( not ( = ?auto_50121 ?auto_50147 ) ) ( not ( = ?auto_50129 ?auto_50147 ) ) ( not ( = ?auto_50149 ?auto_50147 ) ) ( HOIST-AT ?auto_50145 ?auto_50147 ) ( not ( = ?auto_50142 ?auto_50145 ) ) ( not ( = ?auto_50138 ?auto_50145 ) ) ( not ( = ?auto_50124 ?auto_50145 ) ) ( not ( = ?auto_50137 ?auto_50145 ) ) ( not ( = ?auto_50150 ?auto_50145 ) ) ( not ( = ?auto_50122 ?auto_50145 ) ) ( not ( = ?auto_50143 ?auto_50145 ) ) ( AVAILABLE ?auto_50145 ) ( SURFACE-AT ?auto_50127 ?auto_50147 ) ( ON ?auto_50127 ?auto_50133 ) ( CLEAR ?auto_50127 ) ( not ( = ?auto_50118 ?auto_50133 ) ) ( not ( = ?auto_50119 ?auto_50133 ) ) ( not ( = ?auto_50120 ?auto_50133 ) ) ( not ( = ?auto_50131 ?auto_50133 ) ) ( not ( = ?auto_50141 ?auto_50133 ) ) ( not ( = ?auto_50126 ?auto_50133 ) ) ( not ( = ?auto_50134 ?auto_50133 ) ) ( not ( = ?auto_50130 ?auto_50133 ) ) ( not ( = ?auto_50136 ?auto_50133 ) ) ( not ( = ?auto_50132 ?auto_50133 ) ) ( not ( = ?auto_50148 ?auto_50133 ) ) ( not ( = ?auto_50127 ?auto_50133 ) ) ( not ( = ?auto_50125 ?auto_50133 ) ) ( not ( = ?auto_50139 ?auto_50133 ) ) ( SURFACE-AT ?auto_50146 ?auto_50123 ) ( CLEAR ?auto_50146 ) ( IS-CRATE ?auto_50139 ) ( not ( = ?auto_50118 ?auto_50146 ) ) ( not ( = ?auto_50119 ?auto_50146 ) ) ( not ( = ?auto_50120 ?auto_50146 ) ) ( not ( = ?auto_50131 ?auto_50146 ) ) ( not ( = ?auto_50141 ?auto_50146 ) ) ( not ( = ?auto_50126 ?auto_50146 ) ) ( not ( = ?auto_50134 ?auto_50146 ) ) ( not ( = ?auto_50130 ?auto_50146 ) ) ( not ( = ?auto_50136 ?auto_50146 ) ) ( not ( = ?auto_50132 ?auto_50146 ) ) ( not ( = ?auto_50148 ?auto_50146 ) ) ( not ( = ?auto_50127 ?auto_50146 ) ) ( not ( = ?auto_50125 ?auto_50146 ) ) ( not ( = ?auto_50139 ?auto_50146 ) ) ( not ( = ?auto_50133 ?auto_50146 ) ) ( AVAILABLE ?auto_50142 ) ( TRUCK-AT ?auto_50135 ?auto_50128 ) ( AVAILABLE ?auto_50137 ) ( SURFACE-AT ?auto_50139 ?auto_50128 ) ( ON ?auto_50139 ?auto_50151 ) ( CLEAR ?auto_50139 ) ( not ( = ?auto_50118 ?auto_50151 ) ) ( not ( = ?auto_50119 ?auto_50151 ) ) ( not ( = ?auto_50120 ?auto_50151 ) ) ( not ( = ?auto_50131 ?auto_50151 ) ) ( not ( = ?auto_50141 ?auto_50151 ) ) ( not ( = ?auto_50126 ?auto_50151 ) ) ( not ( = ?auto_50134 ?auto_50151 ) ) ( not ( = ?auto_50130 ?auto_50151 ) ) ( not ( = ?auto_50136 ?auto_50151 ) ) ( not ( = ?auto_50132 ?auto_50151 ) ) ( not ( = ?auto_50148 ?auto_50151 ) ) ( not ( = ?auto_50127 ?auto_50151 ) ) ( not ( = ?auto_50125 ?auto_50151 ) ) ( not ( = ?auto_50139 ?auto_50151 ) ) ( not ( = ?auto_50133 ?auto_50151 ) ) ( not ( = ?auto_50146 ?auto_50151 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50137 ?auto_50139 ?auto_50151 ?auto_50128 )
      ( MAKE-ON ?auto_50118 ?auto_50119 )
      ( MAKE-ON-VERIFY ?auto_50118 ?auto_50119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50152 - SURFACE
      ?auto_50153 - SURFACE
    )
    :vars
    (
      ?auto_50163 - HOIST
      ?auto_50154 - PLACE
      ?auto_50161 - PLACE
      ?auto_50184 - HOIST
      ?auto_50165 - SURFACE
      ?auto_50169 - SURFACE
      ?auto_50170 - PLACE
      ?auto_50160 - HOIST
      ?auto_50162 - SURFACE
      ?auto_50180 - SURFACE
      ?auto_50158 - PLACE
      ?auto_50183 - HOIST
      ?auto_50179 - SURFACE
      ?auto_50166 - SURFACE
      ?auto_50156 - PLACE
      ?auto_50176 - HOIST
      ?auto_50182 - SURFACE
      ?auto_50178 - SURFACE
      ?auto_50157 - PLACE
      ?auto_50155 - HOIST
      ?auto_50174 - SURFACE
      ?auto_50167 - SURFACE
      ?auto_50175 - PLACE
      ?auto_50177 - HOIST
      ?auto_50159 - SURFACE
      ?auto_50185 - SURFACE
      ?auto_50173 - PLACE
      ?auto_50171 - HOIST
      ?auto_50168 - SURFACE
      ?auto_50172 - SURFACE
      ?auto_50181 - SURFACE
      ?auto_50164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50163 ?auto_50154 ) ( IS-CRATE ?auto_50152 ) ( not ( = ?auto_50152 ?auto_50153 ) ) ( not ( = ?auto_50161 ?auto_50154 ) ) ( HOIST-AT ?auto_50184 ?auto_50161 ) ( not ( = ?auto_50163 ?auto_50184 ) ) ( AVAILABLE ?auto_50184 ) ( SURFACE-AT ?auto_50152 ?auto_50161 ) ( ON ?auto_50152 ?auto_50165 ) ( CLEAR ?auto_50152 ) ( not ( = ?auto_50152 ?auto_50165 ) ) ( not ( = ?auto_50153 ?auto_50165 ) ) ( IS-CRATE ?auto_50153 ) ( not ( = ?auto_50152 ?auto_50169 ) ) ( not ( = ?auto_50153 ?auto_50169 ) ) ( not ( = ?auto_50165 ?auto_50169 ) ) ( not ( = ?auto_50170 ?auto_50154 ) ) ( not ( = ?auto_50161 ?auto_50170 ) ) ( HOIST-AT ?auto_50160 ?auto_50170 ) ( not ( = ?auto_50163 ?auto_50160 ) ) ( not ( = ?auto_50184 ?auto_50160 ) ) ( AVAILABLE ?auto_50160 ) ( SURFACE-AT ?auto_50153 ?auto_50170 ) ( ON ?auto_50153 ?auto_50162 ) ( CLEAR ?auto_50153 ) ( not ( = ?auto_50152 ?auto_50162 ) ) ( not ( = ?auto_50153 ?auto_50162 ) ) ( not ( = ?auto_50165 ?auto_50162 ) ) ( not ( = ?auto_50169 ?auto_50162 ) ) ( IS-CRATE ?auto_50169 ) ( not ( = ?auto_50152 ?auto_50180 ) ) ( not ( = ?auto_50153 ?auto_50180 ) ) ( not ( = ?auto_50165 ?auto_50180 ) ) ( not ( = ?auto_50169 ?auto_50180 ) ) ( not ( = ?auto_50162 ?auto_50180 ) ) ( not ( = ?auto_50158 ?auto_50154 ) ) ( not ( = ?auto_50161 ?auto_50158 ) ) ( not ( = ?auto_50170 ?auto_50158 ) ) ( HOIST-AT ?auto_50183 ?auto_50158 ) ( not ( = ?auto_50163 ?auto_50183 ) ) ( not ( = ?auto_50184 ?auto_50183 ) ) ( not ( = ?auto_50160 ?auto_50183 ) ) ( SURFACE-AT ?auto_50169 ?auto_50158 ) ( ON ?auto_50169 ?auto_50179 ) ( CLEAR ?auto_50169 ) ( not ( = ?auto_50152 ?auto_50179 ) ) ( not ( = ?auto_50153 ?auto_50179 ) ) ( not ( = ?auto_50165 ?auto_50179 ) ) ( not ( = ?auto_50169 ?auto_50179 ) ) ( not ( = ?auto_50162 ?auto_50179 ) ) ( not ( = ?auto_50180 ?auto_50179 ) ) ( IS-CRATE ?auto_50180 ) ( not ( = ?auto_50152 ?auto_50166 ) ) ( not ( = ?auto_50153 ?auto_50166 ) ) ( not ( = ?auto_50165 ?auto_50166 ) ) ( not ( = ?auto_50169 ?auto_50166 ) ) ( not ( = ?auto_50162 ?auto_50166 ) ) ( not ( = ?auto_50180 ?auto_50166 ) ) ( not ( = ?auto_50179 ?auto_50166 ) ) ( not ( = ?auto_50156 ?auto_50154 ) ) ( not ( = ?auto_50161 ?auto_50156 ) ) ( not ( = ?auto_50170 ?auto_50156 ) ) ( not ( = ?auto_50158 ?auto_50156 ) ) ( HOIST-AT ?auto_50176 ?auto_50156 ) ( not ( = ?auto_50163 ?auto_50176 ) ) ( not ( = ?auto_50184 ?auto_50176 ) ) ( not ( = ?auto_50160 ?auto_50176 ) ) ( not ( = ?auto_50183 ?auto_50176 ) ) ( AVAILABLE ?auto_50176 ) ( SURFACE-AT ?auto_50180 ?auto_50156 ) ( ON ?auto_50180 ?auto_50182 ) ( CLEAR ?auto_50180 ) ( not ( = ?auto_50152 ?auto_50182 ) ) ( not ( = ?auto_50153 ?auto_50182 ) ) ( not ( = ?auto_50165 ?auto_50182 ) ) ( not ( = ?auto_50169 ?auto_50182 ) ) ( not ( = ?auto_50162 ?auto_50182 ) ) ( not ( = ?auto_50180 ?auto_50182 ) ) ( not ( = ?auto_50179 ?auto_50182 ) ) ( not ( = ?auto_50166 ?auto_50182 ) ) ( IS-CRATE ?auto_50166 ) ( not ( = ?auto_50152 ?auto_50178 ) ) ( not ( = ?auto_50153 ?auto_50178 ) ) ( not ( = ?auto_50165 ?auto_50178 ) ) ( not ( = ?auto_50169 ?auto_50178 ) ) ( not ( = ?auto_50162 ?auto_50178 ) ) ( not ( = ?auto_50180 ?auto_50178 ) ) ( not ( = ?auto_50179 ?auto_50178 ) ) ( not ( = ?auto_50166 ?auto_50178 ) ) ( not ( = ?auto_50182 ?auto_50178 ) ) ( not ( = ?auto_50157 ?auto_50154 ) ) ( not ( = ?auto_50161 ?auto_50157 ) ) ( not ( = ?auto_50170 ?auto_50157 ) ) ( not ( = ?auto_50158 ?auto_50157 ) ) ( not ( = ?auto_50156 ?auto_50157 ) ) ( HOIST-AT ?auto_50155 ?auto_50157 ) ( not ( = ?auto_50163 ?auto_50155 ) ) ( not ( = ?auto_50184 ?auto_50155 ) ) ( not ( = ?auto_50160 ?auto_50155 ) ) ( not ( = ?auto_50183 ?auto_50155 ) ) ( not ( = ?auto_50176 ?auto_50155 ) ) ( AVAILABLE ?auto_50155 ) ( SURFACE-AT ?auto_50166 ?auto_50157 ) ( ON ?auto_50166 ?auto_50174 ) ( CLEAR ?auto_50166 ) ( not ( = ?auto_50152 ?auto_50174 ) ) ( not ( = ?auto_50153 ?auto_50174 ) ) ( not ( = ?auto_50165 ?auto_50174 ) ) ( not ( = ?auto_50169 ?auto_50174 ) ) ( not ( = ?auto_50162 ?auto_50174 ) ) ( not ( = ?auto_50180 ?auto_50174 ) ) ( not ( = ?auto_50179 ?auto_50174 ) ) ( not ( = ?auto_50166 ?auto_50174 ) ) ( not ( = ?auto_50182 ?auto_50174 ) ) ( not ( = ?auto_50178 ?auto_50174 ) ) ( IS-CRATE ?auto_50178 ) ( not ( = ?auto_50152 ?auto_50167 ) ) ( not ( = ?auto_50153 ?auto_50167 ) ) ( not ( = ?auto_50165 ?auto_50167 ) ) ( not ( = ?auto_50169 ?auto_50167 ) ) ( not ( = ?auto_50162 ?auto_50167 ) ) ( not ( = ?auto_50180 ?auto_50167 ) ) ( not ( = ?auto_50179 ?auto_50167 ) ) ( not ( = ?auto_50166 ?auto_50167 ) ) ( not ( = ?auto_50182 ?auto_50167 ) ) ( not ( = ?auto_50178 ?auto_50167 ) ) ( not ( = ?auto_50174 ?auto_50167 ) ) ( not ( = ?auto_50175 ?auto_50154 ) ) ( not ( = ?auto_50161 ?auto_50175 ) ) ( not ( = ?auto_50170 ?auto_50175 ) ) ( not ( = ?auto_50158 ?auto_50175 ) ) ( not ( = ?auto_50156 ?auto_50175 ) ) ( not ( = ?auto_50157 ?auto_50175 ) ) ( HOIST-AT ?auto_50177 ?auto_50175 ) ( not ( = ?auto_50163 ?auto_50177 ) ) ( not ( = ?auto_50184 ?auto_50177 ) ) ( not ( = ?auto_50160 ?auto_50177 ) ) ( not ( = ?auto_50183 ?auto_50177 ) ) ( not ( = ?auto_50176 ?auto_50177 ) ) ( not ( = ?auto_50155 ?auto_50177 ) ) ( AVAILABLE ?auto_50177 ) ( SURFACE-AT ?auto_50178 ?auto_50175 ) ( ON ?auto_50178 ?auto_50159 ) ( CLEAR ?auto_50178 ) ( not ( = ?auto_50152 ?auto_50159 ) ) ( not ( = ?auto_50153 ?auto_50159 ) ) ( not ( = ?auto_50165 ?auto_50159 ) ) ( not ( = ?auto_50169 ?auto_50159 ) ) ( not ( = ?auto_50162 ?auto_50159 ) ) ( not ( = ?auto_50180 ?auto_50159 ) ) ( not ( = ?auto_50179 ?auto_50159 ) ) ( not ( = ?auto_50166 ?auto_50159 ) ) ( not ( = ?auto_50182 ?auto_50159 ) ) ( not ( = ?auto_50178 ?auto_50159 ) ) ( not ( = ?auto_50174 ?auto_50159 ) ) ( not ( = ?auto_50167 ?auto_50159 ) ) ( IS-CRATE ?auto_50167 ) ( not ( = ?auto_50152 ?auto_50185 ) ) ( not ( = ?auto_50153 ?auto_50185 ) ) ( not ( = ?auto_50165 ?auto_50185 ) ) ( not ( = ?auto_50169 ?auto_50185 ) ) ( not ( = ?auto_50162 ?auto_50185 ) ) ( not ( = ?auto_50180 ?auto_50185 ) ) ( not ( = ?auto_50179 ?auto_50185 ) ) ( not ( = ?auto_50166 ?auto_50185 ) ) ( not ( = ?auto_50182 ?auto_50185 ) ) ( not ( = ?auto_50178 ?auto_50185 ) ) ( not ( = ?auto_50174 ?auto_50185 ) ) ( not ( = ?auto_50167 ?auto_50185 ) ) ( not ( = ?auto_50159 ?auto_50185 ) ) ( not ( = ?auto_50173 ?auto_50154 ) ) ( not ( = ?auto_50161 ?auto_50173 ) ) ( not ( = ?auto_50170 ?auto_50173 ) ) ( not ( = ?auto_50158 ?auto_50173 ) ) ( not ( = ?auto_50156 ?auto_50173 ) ) ( not ( = ?auto_50157 ?auto_50173 ) ) ( not ( = ?auto_50175 ?auto_50173 ) ) ( HOIST-AT ?auto_50171 ?auto_50173 ) ( not ( = ?auto_50163 ?auto_50171 ) ) ( not ( = ?auto_50184 ?auto_50171 ) ) ( not ( = ?auto_50160 ?auto_50171 ) ) ( not ( = ?auto_50183 ?auto_50171 ) ) ( not ( = ?auto_50176 ?auto_50171 ) ) ( not ( = ?auto_50155 ?auto_50171 ) ) ( not ( = ?auto_50177 ?auto_50171 ) ) ( AVAILABLE ?auto_50171 ) ( SURFACE-AT ?auto_50167 ?auto_50173 ) ( ON ?auto_50167 ?auto_50168 ) ( CLEAR ?auto_50167 ) ( not ( = ?auto_50152 ?auto_50168 ) ) ( not ( = ?auto_50153 ?auto_50168 ) ) ( not ( = ?auto_50165 ?auto_50168 ) ) ( not ( = ?auto_50169 ?auto_50168 ) ) ( not ( = ?auto_50162 ?auto_50168 ) ) ( not ( = ?auto_50180 ?auto_50168 ) ) ( not ( = ?auto_50179 ?auto_50168 ) ) ( not ( = ?auto_50166 ?auto_50168 ) ) ( not ( = ?auto_50182 ?auto_50168 ) ) ( not ( = ?auto_50178 ?auto_50168 ) ) ( not ( = ?auto_50174 ?auto_50168 ) ) ( not ( = ?auto_50167 ?auto_50168 ) ) ( not ( = ?auto_50159 ?auto_50168 ) ) ( not ( = ?auto_50185 ?auto_50168 ) ) ( SURFACE-AT ?auto_50172 ?auto_50154 ) ( CLEAR ?auto_50172 ) ( IS-CRATE ?auto_50185 ) ( not ( = ?auto_50152 ?auto_50172 ) ) ( not ( = ?auto_50153 ?auto_50172 ) ) ( not ( = ?auto_50165 ?auto_50172 ) ) ( not ( = ?auto_50169 ?auto_50172 ) ) ( not ( = ?auto_50162 ?auto_50172 ) ) ( not ( = ?auto_50180 ?auto_50172 ) ) ( not ( = ?auto_50179 ?auto_50172 ) ) ( not ( = ?auto_50166 ?auto_50172 ) ) ( not ( = ?auto_50182 ?auto_50172 ) ) ( not ( = ?auto_50178 ?auto_50172 ) ) ( not ( = ?auto_50174 ?auto_50172 ) ) ( not ( = ?auto_50167 ?auto_50172 ) ) ( not ( = ?auto_50159 ?auto_50172 ) ) ( not ( = ?auto_50185 ?auto_50172 ) ) ( not ( = ?auto_50168 ?auto_50172 ) ) ( AVAILABLE ?auto_50163 ) ( AVAILABLE ?auto_50183 ) ( SURFACE-AT ?auto_50185 ?auto_50158 ) ( ON ?auto_50185 ?auto_50181 ) ( CLEAR ?auto_50185 ) ( not ( = ?auto_50152 ?auto_50181 ) ) ( not ( = ?auto_50153 ?auto_50181 ) ) ( not ( = ?auto_50165 ?auto_50181 ) ) ( not ( = ?auto_50169 ?auto_50181 ) ) ( not ( = ?auto_50162 ?auto_50181 ) ) ( not ( = ?auto_50180 ?auto_50181 ) ) ( not ( = ?auto_50179 ?auto_50181 ) ) ( not ( = ?auto_50166 ?auto_50181 ) ) ( not ( = ?auto_50182 ?auto_50181 ) ) ( not ( = ?auto_50178 ?auto_50181 ) ) ( not ( = ?auto_50174 ?auto_50181 ) ) ( not ( = ?auto_50167 ?auto_50181 ) ) ( not ( = ?auto_50159 ?auto_50181 ) ) ( not ( = ?auto_50185 ?auto_50181 ) ) ( not ( = ?auto_50168 ?auto_50181 ) ) ( not ( = ?auto_50172 ?auto_50181 ) ) ( TRUCK-AT ?auto_50164 ?auto_50154 ) )
    :subtasks
    ( ( !DRIVE ?auto_50164 ?auto_50154 ?auto_50158 )
      ( MAKE-ON ?auto_50152 ?auto_50153 )
      ( MAKE-ON-VERIFY ?auto_50152 ?auto_50153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50186 - SURFACE
      ?auto_50187 - SURFACE
    )
    :vars
    (
      ?auto_50219 - HOIST
      ?auto_50197 - PLACE
      ?auto_50194 - PLACE
      ?auto_50204 - HOIST
      ?auto_50216 - SURFACE
      ?auto_50213 - SURFACE
      ?auto_50206 - PLACE
      ?auto_50200 - HOIST
      ?auto_50201 - SURFACE
      ?auto_50191 - SURFACE
      ?auto_50198 - PLACE
      ?auto_50203 - HOIST
      ?auto_50190 - SURFACE
      ?auto_50214 - SURFACE
      ?auto_50192 - PLACE
      ?auto_50212 - HOIST
      ?auto_50202 - SURFACE
      ?auto_50199 - SURFACE
      ?auto_50218 - PLACE
      ?auto_50196 - HOIST
      ?auto_50210 - SURFACE
      ?auto_50193 - SURFACE
      ?auto_50211 - PLACE
      ?auto_50205 - HOIST
      ?auto_50217 - SURFACE
      ?auto_50189 - SURFACE
      ?auto_50209 - PLACE
      ?auto_50207 - HOIST
      ?auto_50215 - SURFACE
      ?auto_50208 - SURFACE
      ?auto_50188 - SURFACE
      ?auto_50195 - TRUCK
      ?auto_50220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50219 ?auto_50197 ) ( IS-CRATE ?auto_50186 ) ( not ( = ?auto_50186 ?auto_50187 ) ) ( not ( = ?auto_50194 ?auto_50197 ) ) ( HOIST-AT ?auto_50204 ?auto_50194 ) ( not ( = ?auto_50219 ?auto_50204 ) ) ( AVAILABLE ?auto_50204 ) ( SURFACE-AT ?auto_50186 ?auto_50194 ) ( ON ?auto_50186 ?auto_50216 ) ( CLEAR ?auto_50186 ) ( not ( = ?auto_50186 ?auto_50216 ) ) ( not ( = ?auto_50187 ?auto_50216 ) ) ( IS-CRATE ?auto_50187 ) ( not ( = ?auto_50186 ?auto_50213 ) ) ( not ( = ?auto_50187 ?auto_50213 ) ) ( not ( = ?auto_50216 ?auto_50213 ) ) ( not ( = ?auto_50206 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50206 ) ) ( HOIST-AT ?auto_50200 ?auto_50206 ) ( not ( = ?auto_50219 ?auto_50200 ) ) ( not ( = ?auto_50204 ?auto_50200 ) ) ( AVAILABLE ?auto_50200 ) ( SURFACE-AT ?auto_50187 ?auto_50206 ) ( ON ?auto_50187 ?auto_50201 ) ( CLEAR ?auto_50187 ) ( not ( = ?auto_50186 ?auto_50201 ) ) ( not ( = ?auto_50187 ?auto_50201 ) ) ( not ( = ?auto_50216 ?auto_50201 ) ) ( not ( = ?auto_50213 ?auto_50201 ) ) ( IS-CRATE ?auto_50213 ) ( not ( = ?auto_50186 ?auto_50191 ) ) ( not ( = ?auto_50187 ?auto_50191 ) ) ( not ( = ?auto_50216 ?auto_50191 ) ) ( not ( = ?auto_50213 ?auto_50191 ) ) ( not ( = ?auto_50201 ?auto_50191 ) ) ( not ( = ?auto_50198 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50198 ) ) ( not ( = ?auto_50206 ?auto_50198 ) ) ( HOIST-AT ?auto_50203 ?auto_50198 ) ( not ( = ?auto_50219 ?auto_50203 ) ) ( not ( = ?auto_50204 ?auto_50203 ) ) ( not ( = ?auto_50200 ?auto_50203 ) ) ( SURFACE-AT ?auto_50213 ?auto_50198 ) ( ON ?auto_50213 ?auto_50190 ) ( CLEAR ?auto_50213 ) ( not ( = ?auto_50186 ?auto_50190 ) ) ( not ( = ?auto_50187 ?auto_50190 ) ) ( not ( = ?auto_50216 ?auto_50190 ) ) ( not ( = ?auto_50213 ?auto_50190 ) ) ( not ( = ?auto_50201 ?auto_50190 ) ) ( not ( = ?auto_50191 ?auto_50190 ) ) ( IS-CRATE ?auto_50191 ) ( not ( = ?auto_50186 ?auto_50214 ) ) ( not ( = ?auto_50187 ?auto_50214 ) ) ( not ( = ?auto_50216 ?auto_50214 ) ) ( not ( = ?auto_50213 ?auto_50214 ) ) ( not ( = ?auto_50201 ?auto_50214 ) ) ( not ( = ?auto_50191 ?auto_50214 ) ) ( not ( = ?auto_50190 ?auto_50214 ) ) ( not ( = ?auto_50192 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50192 ) ) ( not ( = ?auto_50206 ?auto_50192 ) ) ( not ( = ?auto_50198 ?auto_50192 ) ) ( HOIST-AT ?auto_50212 ?auto_50192 ) ( not ( = ?auto_50219 ?auto_50212 ) ) ( not ( = ?auto_50204 ?auto_50212 ) ) ( not ( = ?auto_50200 ?auto_50212 ) ) ( not ( = ?auto_50203 ?auto_50212 ) ) ( AVAILABLE ?auto_50212 ) ( SURFACE-AT ?auto_50191 ?auto_50192 ) ( ON ?auto_50191 ?auto_50202 ) ( CLEAR ?auto_50191 ) ( not ( = ?auto_50186 ?auto_50202 ) ) ( not ( = ?auto_50187 ?auto_50202 ) ) ( not ( = ?auto_50216 ?auto_50202 ) ) ( not ( = ?auto_50213 ?auto_50202 ) ) ( not ( = ?auto_50201 ?auto_50202 ) ) ( not ( = ?auto_50191 ?auto_50202 ) ) ( not ( = ?auto_50190 ?auto_50202 ) ) ( not ( = ?auto_50214 ?auto_50202 ) ) ( IS-CRATE ?auto_50214 ) ( not ( = ?auto_50186 ?auto_50199 ) ) ( not ( = ?auto_50187 ?auto_50199 ) ) ( not ( = ?auto_50216 ?auto_50199 ) ) ( not ( = ?auto_50213 ?auto_50199 ) ) ( not ( = ?auto_50201 ?auto_50199 ) ) ( not ( = ?auto_50191 ?auto_50199 ) ) ( not ( = ?auto_50190 ?auto_50199 ) ) ( not ( = ?auto_50214 ?auto_50199 ) ) ( not ( = ?auto_50202 ?auto_50199 ) ) ( not ( = ?auto_50218 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50218 ) ) ( not ( = ?auto_50206 ?auto_50218 ) ) ( not ( = ?auto_50198 ?auto_50218 ) ) ( not ( = ?auto_50192 ?auto_50218 ) ) ( HOIST-AT ?auto_50196 ?auto_50218 ) ( not ( = ?auto_50219 ?auto_50196 ) ) ( not ( = ?auto_50204 ?auto_50196 ) ) ( not ( = ?auto_50200 ?auto_50196 ) ) ( not ( = ?auto_50203 ?auto_50196 ) ) ( not ( = ?auto_50212 ?auto_50196 ) ) ( AVAILABLE ?auto_50196 ) ( SURFACE-AT ?auto_50214 ?auto_50218 ) ( ON ?auto_50214 ?auto_50210 ) ( CLEAR ?auto_50214 ) ( not ( = ?auto_50186 ?auto_50210 ) ) ( not ( = ?auto_50187 ?auto_50210 ) ) ( not ( = ?auto_50216 ?auto_50210 ) ) ( not ( = ?auto_50213 ?auto_50210 ) ) ( not ( = ?auto_50201 ?auto_50210 ) ) ( not ( = ?auto_50191 ?auto_50210 ) ) ( not ( = ?auto_50190 ?auto_50210 ) ) ( not ( = ?auto_50214 ?auto_50210 ) ) ( not ( = ?auto_50202 ?auto_50210 ) ) ( not ( = ?auto_50199 ?auto_50210 ) ) ( IS-CRATE ?auto_50199 ) ( not ( = ?auto_50186 ?auto_50193 ) ) ( not ( = ?auto_50187 ?auto_50193 ) ) ( not ( = ?auto_50216 ?auto_50193 ) ) ( not ( = ?auto_50213 ?auto_50193 ) ) ( not ( = ?auto_50201 ?auto_50193 ) ) ( not ( = ?auto_50191 ?auto_50193 ) ) ( not ( = ?auto_50190 ?auto_50193 ) ) ( not ( = ?auto_50214 ?auto_50193 ) ) ( not ( = ?auto_50202 ?auto_50193 ) ) ( not ( = ?auto_50199 ?auto_50193 ) ) ( not ( = ?auto_50210 ?auto_50193 ) ) ( not ( = ?auto_50211 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50211 ) ) ( not ( = ?auto_50206 ?auto_50211 ) ) ( not ( = ?auto_50198 ?auto_50211 ) ) ( not ( = ?auto_50192 ?auto_50211 ) ) ( not ( = ?auto_50218 ?auto_50211 ) ) ( HOIST-AT ?auto_50205 ?auto_50211 ) ( not ( = ?auto_50219 ?auto_50205 ) ) ( not ( = ?auto_50204 ?auto_50205 ) ) ( not ( = ?auto_50200 ?auto_50205 ) ) ( not ( = ?auto_50203 ?auto_50205 ) ) ( not ( = ?auto_50212 ?auto_50205 ) ) ( not ( = ?auto_50196 ?auto_50205 ) ) ( AVAILABLE ?auto_50205 ) ( SURFACE-AT ?auto_50199 ?auto_50211 ) ( ON ?auto_50199 ?auto_50217 ) ( CLEAR ?auto_50199 ) ( not ( = ?auto_50186 ?auto_50217 ) ) ( not ( = ?auto_50187 ?auto_50217 ) ) ( not ( = ?auto_50216 ?auto_50217 ) ) ( not ( = ?auto_50213 ?auto_50217 ) ) ( not ( = ?auto_50201 ?auto_50217 ) ) ( not ( = ?auto_50191 ?auto_50217 ) ) ( not ( = ?auto_50190 ?auto_50217 ) ) ( not ( = ?auto_50214 ?auto_50217 ) ) ( not ( = ?auto_50202 ?auto_50217 ) ) ( not ( = ?auto_50199 ?auto_50217 ) ) ( not ( = ?auto_50210 ?auto_50217 ) ) ( not ( = ?auto_50193 ?auto_50217 ) ) ( IS-CRATE ?auto_50193 ) ( not ( = ?auto_50186 ?auto_50189 ) ) ( not ( = ?auto_50187 ?auto_50189 ) ) ( not ( = ?auto_50216 ?auto_50189 ) ) ( not ( = ?auto_50213 ?auto_50189 ) ) ( not ( = ?auto_50201 ?auto_50189 ) ) ( not ( = ?auto_50191 ?auto_50189 ) ) ( not ( = ?auto_50190 ?auto_50189 ) ) ( not ( = ?auto_50214 ?auto_50189 ) ) ( not ( = ?auto_50202 ?auto_50189 ) ) ( not ( = ?auto_50199 ?auto_50189 ) ) ( not ( = ?auto_50210 ?auto_50189 ) ) ( not ( = ?auto_50193 ?auto_50189 ) ) ( not ( = ?auto_50217 ?auto_50189 ) ) ( not ( = ?auto_50209 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50209 ) ) ( not ( = ?auto_50206 ?auto_50209 ) ) ( not ( = ?auto_50198 ?auto_50209 ) ) ( not ( = ?auto_50192 ?auto_50209 ) ) ( not ( = ?auto_50218 ?auto_50209 ) ) ( not ( = ?auto_50211 ?auto_50209 ) ) ( HOIST-AT ?auto_50207 ?auto_50209 ) ( not ( = ?auto_50219 ?auto_50207 ) ) ( not ( = ?auto_50204 ?auto_50207 ) ) ( not ( = ?auto_50200 ?auto_50207 ) ) ( not ( = ?auto_50203 ?auto_50207 ) ) ( not ( = ?auto_50212 ?auto_50207 ) ) ( not ( = ?auto_50196 ?auto_50207 ) ) ( not ( = ?auto_50205 ?auto_50207 ) ) ( AVAILABLE ?auto_50207 ) ( SURFACE-AT ?auto_50193 ?auto_50209 ) ( ON ?auto_50193 ?auto_50215 ) ( CLEAR ?auto_50193 ) ( not ( = ?auto_50186 ?auto_50215 ) ) ( not ( = ?auto_50187 ?auto_50215 ) ) ( not ( = ?auto_50216 ?auto_50215 ) ) ( not ( = ?auto_50213 ?auto_50215 ) ) ( not ( = ?auto_50201 ?auto_50215 ) ) ( not ( = ?auto_50191 ?auto_50215 ) ) ( not ( = ?auto_50190 ?auto_50215 ) ) ( not ( = ?auto_50214 ?auto_50215 ) ) ( not ( = ?auto_50202 ?auto_50215 ) ) ( not ( = ?auto_50199 ?auto_50215 ) ) ( not ( = ?auto_50210 ?auto_50215 ) ) ( not ( = ?auto_50193 ?auto_50215 ) ) ( not ( = ?auto_50217 ?auto_50215 ) ) ( not ( = ?auto_50189 ?auto_50215 ) ) ( IS-CRATE ?auto_50189 ) ( not ( = ?auto_50186 ?auto_50208 ) ) ( not ( = ?auto_50187 ?auto_50208 ) ) ( not ( = ?auto_50216 ?auto_50208 ) ) ( not ( = ?auto_50213 ?auto_50208 ) ) ( not ( = ?auto_50201 ?auto_50208 ) ) ( not ( = ?auto_50191 ?auto_50208 ) ) ( not ( = ?auto_50190 ?auto_50208 ) ) ( not ( = ?auto_50214 ?auto_50208 ) ) ( not ( = ?auto_50202 ?auto_50208 ) ) ( not ( = ?auto_50199 ?auto_50208 ) ) ( not ( = ?auto_50210 ?auto_50208 ) ) ( not ( = ?auto_50193 ?auto_50208 ) ) ( not ( = ?auto_50217 ?auto_50208 ) ) ( not ( = ?auto_50189 ?auto_50208 ) ) ( not ( = ?auto_50215 ?auto_50208 ) ) ( AVAILABLE ?auto_50203 ) ( SURFACE-AT ?auto_50189 ?auto_50198 ) ( ON ?auto_50189 ?auto_50188 ) ( CLEAR ?auto_50189 ) ( not ( = ?auto_50186 ?auto_50188 ) ) ( not ( = ?auto_50187 ?auto_50188 ) ) ( not ( = ?auto_50216 ?auto_50188 ) ) ( not ( = ?auto_50213 ?auto_50188 ) ) ( not ( = ?auto_50201 ?auto_50188 ) ) ( not ( = ?auto_50191 ?auto_50188 ) ) ( not ( = ?auto_50190 ?auto_50188 ) ) ( not ( = ?auto_50214 ?auto_50188 ) ) ( not ( = ?auto_50202 ?auto_50188 ) ) ( not ( = ?auto_50199 ?auto_50188 ) ) ( not ( = ?auto_50210 ?auto_50188 ) ) ( not ( = ?auto_50193 ?auto_50188 ) ) ( not ( = ?auto_50217 ?auto_50188 ) ) ( not ( = ?auto_50189 ?auto_50188 ) ) ( not ( = ?auto_50215 ?auto_50188 ) ) ( not ( = ?auto_50208 ?auto_50188 ) ) ( TRUCK-AT ?auto_50195 ?auto_50197 ) ( SURFACE-AT ?auto_50220 ?auto_50197 ) ( CLEAR ?auto_50220 ) ( LIFTING ?auto_50219 ?auto_50208 ) ( IS-CRATE ?auto_50208 ) ( not ( = ?auto_50186 ?auto_50220 ) ) ( not ( = ?auto_50187 ?auto_50220 ) ) ( not ( = ?auto_50216 ?auto_50220 ) ) ( not ( = ?auto_50213 ?auto_50220 ) ) ( not ( = ?auto_50201 ?auto_50220 ) ) ( not ( = ?auto_50191 ?auto_50220 ) ) ( not ( = ?auto_50190 ?auto_50220 ) ) ( not ( = ?auto_50214 ?auto_50220 ) ) ( not ( = ?auto_50202 ?auto_50220 ) ) ( not ( = ?auto_50199 ?auto_50220 ) ) ( not ( = ?auto_50210 ?auto_50220 ) ) ( not ( = ?auto_50193 ?auto_50220 ) ) ( not ( = ?auto_50217 ?auto_50220 ) ) ( not ( = ?auto_50189 ?auto_50220 ) ) ( not ( = ?auto_50215 ?auto_50220 ) ) ( not ( = ?auto_50208 ?auto_50220 ) ) ( not ( = ?auto_50188 ?auto_50220 ) ) )
    :subtasks
    ( ( !DROP ?auto_50219 ?auto_50208 ?auto_50220 ?auto_50197 )
      ( MAKE-ON ?auto_50186 ?auto_50187 )
      ( MAKE-ON-VERIFY ?auto_50186 ?auto_50187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50221 - SURFACE
      ?auto_50222 - SURFACE
    )
    :vars
    (
      ?auto_50226 - HOIST
      ?auto_50241 - PLACE
      ?auto_50254 - PLACE
      ?auto_50224 - HOIST
      ?auto_50231 - SURFACE
      ?auto_50235 - SURFACE
      ?auto_50227 - PLACE
      ?auto_50244 - HOIST
      ?auto_50243 - SURFACE
      ?auto_50236 - SURFACE
      ?auto_50238 - PLACE
      ?auto_50253 - HOIST
      ?auto_50242 - SURFACE
      ?auto_50229 - SURFACE
      ?auto_50255 - PLACE
      ?auto_50234 - HOIST
      ?auto_50245 - SURFACE
      ?auto_50240 - SURFACE
      ?auto_50233 - PLACE
      ?auto_50247 - HOIST
      ?auto_50252 - SURFACE
      ?auto_50237 - SURFACE
      ?auto_50225 - PLACE
      ?auto_50223 - HOIST
      ?auto_50232 - SURFACE
      ?auto_50239 - SURFACE
      ?auto_50251 - PLACE
      ?auto_50228 - HOIST
      ?auto_50230 - SURFACE
      ?auto_50250 - SURFACE
      ?auto_50248 - SURFACE
      ?auto_50246 - TRUCK
      ?auto_50249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50226 ?auto_50241 ) ( IS-CRATE ?auto_50221 ) ( not ( = ?auto_50221 ?auto_50222 ) ) ( not ( = ?auto_50254 ?auto_50241 ) ) ( HOIST-AT ?auto_50224 ?auto_50254 ) ( not ( = ?auto_50226 ?auto_50224 ) ) ( AVAILABLE ?auto_50224 ) ( SURFACE-AT ?auto_50221 ?auto_50254 ) ( ON ?auto_50221 ?auto_50231 ) ( CLEAR ?auto_50221 ) ( not ( = ?auto_50221 ?auto_50231 ) ) ( not ( = ?auto_50222 ?auto_50231 ) ) ( IS-CRATE ?auto_50222 ) ( not ( = ?auto_50221 ?auto_50235 ) ) ( not ( = ?auto_50222 ?auto_50235 ) ) ( not ( = ?auto_50231 ?auto_50235 ) ) ( not ( = ?auto_50227 ?auto_50241 ) ) ( not ( = ?auto_50254 ?auto_50227 ) ) ( HOIST-AT ?auto_50244 ?auto_50227 ) ( not ( = ?auto_50226 ?auto_50244 ) ) ( not ( = ?auto_50224 ?auto_50244 ) ) ( AVAILABLE ?auto_50244 ) ( SURFACE-AT ?auto_50222 ?auto_50227 ) ( ON ?auto_50222 ?auto_50243 ) ( CLEAR ?auto_50222 ) ( not ( = ?auto_50221 ?auto_50243 ) ) ( not ( = ?auto_50222 ?auto_50243 ) ) ( not ( = ?auto_50231 ?auto_50243 ) ) ( not ( = ?auto_50235 ?auto_50243 ) ) ( IS-CRATE ?auto_50235 ) ( not ( = ?auto_50221 ?auto_50236 ) ) ( not ( = ?auto_50222 ?auto_50236 ) ) ( not ( = ?auto_50231 ?auto_50236 ) ) ( not ( = ?auto_50235 ?auto_50236 ) ) ( not ( = ?auto_50243 ?auto_50236 ) ) ( not ( = ?auto_50238 ?auto_50241 ) ) ( not ( = ?auto_50254 ?auto_50238 ) ) ( not ( = ?auto_50227 ?auto_50238 ) ) ( HOIST-AT ?auto_50253 ?auto_50238 ) ( not ( = ?auto_50226 ?auto_50253 ) ) ( not ( = ?auto_50224 ?auto_50253 ) ) ( not ( = ?auto_50244 ?auto_50253 ) ) ( SURFACE-AT ?auto_50235 ?auto_50238 ) ( ON ?auto_50235 ?auto_50242 ) ( CLEAR ?auto_50235 ) ( not ( = ?auto_50221 ?auto_50242 ) ) ( not ( = ?auto_50222 ?auto_50242 ) ) ( not ( = ?auto_50231 ?auto_50242 ) ) ( not ( = ?auto_50235 ?auto_50242 ) ) ( not ( = ?auto_50243 ?auto_50242 ) ) ( not ( = ?auto_50236 ?auto_50242 ) ) ( IS-CRATE ?auto_50236 ) ( not ( = ?auto_50221 ?auto_50229 ) ) ( not ( = ?auto_50222 ?auto_50229 ) ) ( not ( = ?auto_50231 ?auto_50229 ) ) ( not ( = ?auto_50235 ?auto_50229 ) ) ( not ( = ?auto_50243 ?auto_50229 ) ) ( not ( = ?auto_50236 ?auto_50229 ) ) ( not ( = ?auto_50242 ?auto_50229 ) ) ( not ( = ?auto_50255 ?auto_50241 ) ) ( not ( = ?auto_50254 ?auto_50255 ) ) ( not ( = ?auto_50227 ?auto_50255 ) ) ( not ( = ?auto_50238 ?auto_50255 ) ) ( HOIST-AT ?auto_50234 ?auto_50255 ) ( not ( = ?auto_50226 ?auto_50234 ) ) ( not ( = ?auto_50224 ?auto_50234 ) ) ( not ( = ?auto_50244 ?auto_50234 ) ) ( not ( = ?auto_50253 ?auto_50234 ) ) ( AVAILABLE ?auto_50234 ) ( SURFACE-AT ?auto_50236 ?auto_50255 ) ( ON ?auto_50236 ?auto_50245 ) ( CLEAR ?auto_50236 ) ( not ( = ?auto_50221 ?auto_50245 ) ) ( not ( = ?auto_50222 ?auto_50245 ) ) ( not ( = ?auto_50231 ?auto_50245 ) ) ( not ( = ?auto_50235 ?auto_50245 ) ) ( not ( = ?auto_50243 ?auto_50245 ) ) ( not ( = ?auto_50236 ?auto_50245 ) ) ( not ( = ?auto_50242 ?auto_50245 ) ) ( not ( = ?auto_50229 ?auto_50245 ) ) ( IS-CRATE ?auto_50229 ) ( not ( = ?auto_50221 ?auto_50240 ) ) ( not ( = ?auto_50222 ?auto_50240 ) ) ( not ( = ?auto_50231 ?auto_50240 ) ) ( not ( = ?auto_50235 ?auto_50240 ) ) ( not ( = ?auto_50243 ?auto_50240 ) ) ( not ( = ?auto_50236 ?auto_50240 ) ) ( not ( = ?auto_50242 ?auto_50240 ) ) ( not ( = ?auto_50229 ?auto_50240 ) ) ( not ( = ?auto_50245 ?auto_50240 ) ) ( not ( = ?auto_50233 ?auto_50241 ) ) ( not ( = ?auto_50254 ?auto_50233 ) ) ( not ( = ?auto_50227 ?auto_50233 ) ) ( not ( = ?auto_50238 ?auto_50233 ) ) ( not ( = ?auto_50255 ?auto_50233 ) ) ( HOIST-AT ?auto_50247 ?auto_50233 ) ( not ( = ?auto_50226 ?auto_50247 ) ) ( not ( = ?auto_50224 ?auto_50247 ) ) ( not ( = ?auto_50244 ?auto_50247 ) ) ( not ( = ?auto_50253 ?auto_50247 ) ) ( not ( = ?auto_50234 ?auto_50247 ) ) ( AVAILABLE ?auto_50247 ) ( SURFACE-AT ?auto_50229 ?auto_50233 ) ( ON ?auto_50229 ?auto_50252 ) ( CLEAR ?auto_50229 ) ( not ( = ?auto_50221 ?auto_50252 ) ) ( not ( = ?auto_50222 ?auto_50252 ) ) ( not ( = ?auto_50231 ?auto_50252 ) ) ( not ( = ?auto_50235 ?auto_50252 ) ) ( not ( = ?auto_50243 ?auto_50252 ) ) ( not ( = ?auto_50236 ?auto_50252 ) ) ( not ( = ?auto_50242 ?auto_50252 ) ) ( not ( = ?auto_50229 ?auto_50252 ) ) ( not ( = ?auto_50245 ?auto_50252 ) ) ( not ( = ?auto_50240 ?auto_50252 ) ) ( IS-CRATE ?auto_50240 ) ( not ( = ?auto_50221 ?auto_50237 ) ) ( not ( = ?auto_50222 ?auto_50237 ) ) ( not ( = ?auto_50231 ?auto_50237 ) ) ( not ( = ?auto_50235 ?auto_50237 ) ) ( not ( = ?auto_50243 ?auto_50237 ) ) ( not ( = ?auto_50236 ?auto_50237 ) ) ( not ( = ?auto_50242 ?auto_50237 ) ) ( not ( = ?auto_50229 ?auto_50237 ) ) ( not ( = ?auto_50245 ?auto_50237 ) ) ( not ( = ?auto_50240 ?auto_50237 ) ) ( not ( = ?auto_50252 ?auto_50237 ) ) ( not ( = ?auto_50225 ?auto_50241 ) ) ( not ( = ?auto_50254 ?auto_50225 ) ) ( not ( = ?auto_50227 ?auto_50225 ) ) ( not ( = ?auto_50238 ?auto_50225 ) ) ( not ( = ?auto_50255 ?auto_50225 ) ) ( not ( = ?auto_50233 ?auto_50225 ) ) ( HOIST-AT ?auto_50223 ?auto_50225 ) ( not ( = ?auto_50226 ?auto_50223 ) ) ( not ( = ?auto_50224 ?auto_50223 ) ) ( not ( = ?auto_50244 ?auto_50223 ) ) ( not ( = ?auto_50253 ?auto_50223 ) ) ( not ( = ?auto_50234 ?auto_50223 ) ) ( not ( = ?auto_50247 ?auto_50223 ) ) ( AVAILABLE ?auto_50223 ) ( SURFACE-AT ?auto_50240 ?auto_50225 ) ( ON ?auto_50240 ?auto_50232 ) ( CLEAR ?auto_50240 ) ( not ( = ?auto_50221 ?auto_50232 ) ) ( not ( = ?auto_50222 ?auto_50232 ) ) ( not ( = ?auto_50231 ?auto_50232 ) ) ( not ( = ?auto_50235 ?auto_50232 ) ) ( not ( = ?auto_50243 ?auto_50232 ) ) ( not ( = ?auto_50236 ?auto_50232 ) ) ( not ( = ?auto_50242 ?auto_50232 ) ) ( not ( = ?auto_50229 ?auto_50232 ) ) ( not ( = ?auto_50245 ?auto_50232 ) ) ( not ( = ?auto_50240 ?auto_50232 ) ) ( not ( = ?auto_50252 ?auto_50232 ) ) ( not ( = ?auto_50237 ?auto_50232 ) ) ( IS-CRATE ?auto_50237 ) ( not ( = ?auto_50221 ?auto_50239 ) ) ( not ( = ?auto_50222 ?auto_50239 ) ) ( not ( = ?auto_50231 ?auto_50239 ) ) ( not ( = ?auto_50235 ?auto_50239 ) ) ( not ( = ?auto_50243 ?auto_50239 ) ) ( not ( = ?auto_50236 ?auto_50239 ) ) ( not ( = ?auto_50242 ?auto_50239 ) ) ( not ( = ?auto_50229 ?auto_50239 ) ) ( not ( = ?auto_50245 ?auto_50239 ) ) ( not ( = ?auto_50240 ?auto_50239 ) ) ( not ( = ?auto_50252 ?auto_50239 ) ) ( not ( = ?auto_50237 ?auto_50239 ) ) ( not ( = ?auto_50232 ?auto_50239 ) ) ( not ( = ?auto_50251 ?auto_50241 ) ) ( not ( = ?auto_50254 ?auto_50251 ) ) ( not ( = ?auto_50227 ?auto_50251 ) ) ( not ( = ?auto_50238 ?auto_50251 ) ) ( not ( = ?auto_50255 ?auto_50251 ) ) ( not ( = ?auto_50233 ?auto_50251 ) ) ( not ( = ?auto_50225 ?auto_50251 ) ) ( HOIST-AT ?auto_50228 ?auto_50251 ) ( not ( = ?auto_50226 ?auto_50228 ) ) ( not ( = ?auto_50224 ?auto_50228 ) ) ( not ( = ?auto_50244 ?auto_50228 ) ) ( not ( = ?auto_50253 ?auto_50228 ) ) ( not ( = ?auto_50234 ?auto_50228 ) ) ( not ( = ?auto_50247 ?auto_50228 ) ) ( not ( = ?auto_50223 ?auto_50228 ) ) ( AVAILABLE ?auto_50228 ) ( SURFACE-AT ?auto_50237 ?auto_50251 ) ( ON ?auto_50237 ?auto_50230 ) ( CLEAR ?auto_50237 ) ( not ( = ?auto_50221 ?auto_50230 ) ) ( not ( = ?auto_50222 ?auto_50230 ) ) ( not ( = ?auto_50231 ?auto_50230 ) ) ( not ( = ?auto_50235 ?auto_50230 ) ) ( not ( = ?auto_50243 ?auto_50230 ) ) ( not ( = ?auto_50236 ?auto_50230 ) ) ( not ( = ?auto_50242 ?auto_50230 ) ) ( not ( = ?auto_50229 ?auto_50230 ) ) ( not ( = ?auto_50245 ?auto_50230 ) ) ( not ( = ?auto_50240 ?auto_50230 ) ) ( not ( = ?auto_50252 ?auto_50230 ) ) ( not ( = ?auto_50237 ?auto_50230 ) ) ( not ( = ?auto_50232 ?auto_50230 ) ) ( not ( = ?auto_50239 ?auto_50230 ) ) ( IS-CRATE ?auto_50239 ) ( not ( = ?auto_50221 ?auto_50250 ) ) ( not ( = ?auto_50222 ?auto_50250 ) ) ( not ( = ?auto_50231 ?auto_50250 ) ) ( not ( = ?auto_50235 ?auto_50250 ) ) ( not ( = ?auto_50243 ?auto_50250 ) ) ( not ( = ?auto_50236 ?auto_50250 ) ) ( not ( = ?auto_50242 ?auto_50250 ) ) ( not ( = ?auto_50229 ?auto_50250 ) ) ( not ( = ?auto_50245 ?auto_50250 ) ) ( not ( = ?auto_50240 ?auto_50250 ) ) ( not ( = ?auto_50252 ?auto_50250 ) ) ( not ( = ?auto_50237 ?auto_50250 ) ) ( not ( = ?auto_50232 ?auto_50250 ) ) ( not ( = ?auto_50239 ?auto_50250 ) ) ( not ( = ?auto_50230 ?auto_50250 ) ) ( AVAILABLE ?auto_50253 ) ( SURFACE-AT ?auto_50239 ?auto_50238 ) ( ON ?auto_50239 ?auto_50248 ) ( CLEAR ?auto_50239 ) ( not ( = ?auto_50221 ?auto_50248 ) ) ( not ( = ?auto_50222 ?auto_50248 ) ) ( not ( = ?auto_50231 ?auto_50248 ) ) ( not ( = ?auto_50235 ?auto_50248 ) ) ( not ( = ?auto_50243 ?auto_50248 ) ) ( not ( = ?auto_50236 ?auto_50248 ) ) ( not ( = ?auto_50242 ?auto_50248 ) ) ( not ( = ?auto_50229 ?auto_50248 ) ) ( not ( = ?auto_50245 ?auto_50248 ) ) ( not ( = ?auto_50240 ?auto_50248 ) ) ( not ( = ?auto_50252 ?auto_50248 ) ) ( not ( = ?auto_50237 ?auto_50248 ) ) ( not ( = ?auto_50232 ?auto_50248 ) ) ( not ( = ?auto_50239 ?auto_50248 ) ) ( not ( = ?auto_50230 ?auto_50248 ) ) ( not ( = ?auto_50250 ?auto_50248 ) ) ( TRUCK-AT ?auto_50246 ?auto_50241 ) ( SURFACE-AT ?auto_50249 ?auto_50241 ) ( CLEAR ?auto_50249 ) ( IS-CRATE ?auto_50250 ) ( not ( = ?auto_50221 ?auto_50249 ) ) ( not ( = ?auto_50222 ?auto_50249 ) ) ( not ( = ?auto_50231 ?auto_50249 ) ) ( not ( = ?auto_50235 ?auto_50249 ) ) ( not ( = ?auto_50243 ?auto_50249 ) ) ( not ( = ?auto_50236 ?auto_50249 ) ) ( not ( = ?auto_50242 ?auto_50249 ) ) ( not ( = ?auto_50229 ?auto_50249 ) ) ( not ( = ?auto_50245 ?auto_50249 ) ) ( not ( = ?auto_50240 ?auto_50249 ) ) ( not ( = ?auto_50252 ?auto_50249 ) ) ( not ( = ?auto_50237 ?auto_50249 ) ) ( not ( = ?auto_50232 ?auto_50249 ) ) ( not ( = ?auto_50239 ?auto_50249 ) ) ( not ( = ?auto_50230 ?auto_50249 ) ) ( not ( = ?auto_50250 ?auto_50249 ) ) ( not ( = ?auto_50248 ?auto_50249 ) ) ( AVAILABLE ?auto_50226 ) ( IN ?auto_50250 ?auto_50246 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50226 ?auto_50250 ?auto_50246 ?auto_50241 )
      ( MAKE-ON ?auto_50221 ?auto_50222 )
      ( MAKE-ON-VERIFY ?auto_50221 ?auto_50222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50256 - SURFACE
      ?auto_50257 - SURFACE
    )
    :vars
    (
      ?auto_50260 - HOIST
      ?auto_50280 - PLACE
      ?auto_50269 - PLACE
      ?auto_50258 - HOIST
      ?auto_50287 - SURFACE
      ?auto_50263 - SURFACE
      ?auto_50267 - PLACE
      ?auto_50283 - HOIST
      ?auto_50282 - SURFACE
      ?auto_50288 - SURFACE
      ?auto_50285 - PLACE
      ?auto_50276 - HOIST
      ?auto_50281 - SURFACE
      ?auto_50264 - SURFACE
      ?auto_50265 - PLACE
      ?auto_50262 - HOIST
      ?auto_50284 - SURFACE
      ?auto_50279 - SURFACE
      ?auto_50268 - PLACE
      ?auto_50270 - HOIST
      ?auto_50275 - SURFACE
      ?auto_50290 - SURFACE
      ?auto_50261 - PLACE
      ?auto_50289 - HOIST
      ?auto_50266 - SURFACE
      ?auto_50278 - SURFACE
      ?auto_50274 - PLACE
      ?auto_50259 - HOIST
      ?auto_50286 - SURFACE
      ?auto_50273 - SURFACE
      ?auto_50271 - SURFACE
      ?auto_50272 - SURFACE
      ?auto_50277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50260 ?auto_50280 ) ( IS-CRATE ?auto_50256 ) ( not ( = ?auto_50256 ?auto_50257 ) ) ( not ( = ?auto_50269 ?auto_50280 ) ) ( HOIST-AT ?auto_50258 ?auto_50269 ) ( not ( = ?auto_50260 ?auto_50258 ) ) ( AVAILABLE ?auto_50258 ) ( SURFACE-AT ?auto_50256 ?auto_50269 ) ( ON ?auto_50256 ?auto_50287 ) ( CLEAR ?auto_50256 ) ( not ( = ?auto_50256 ?auto_50287 ) ) ( not ( = ?auto_50257 ?auto_50287 ) ) ( IS-CRATE ?auto_50257 ) ( not ( = ?auto_50256 ?auto_50263 ) ) ( not ( = ?auto_50257 ?auto_50263 ) ) ( not ( = ?auto_50287 ?auto_50263 ) ) ( not ( = ?auto_50267 ?auto_50280 ) ) ( not ( = ?auto_50269 ?auto_50267 ) ) ( HOIST-AT ?auto_50283 ?auto_50267 ) ( not ( = ?auto_50260 ?auto_50283 ) ) ( not ( = ?auto_50258 ?auto_50283 ) ) ( AVAILABLE ?auto_50283 ) ( SURFACE-AT ?auto_50257 ?auto_50267 ) ( ON ?auto_50257 ?auto_50282 ) ( CLEAR ?auto_50257 ) ( not ( = ?auto_50256 ?auto_50282 ) ) ( not ( = ?auto_50257 ?auto_50282 ) ) ( not ( = ?auto_50287 ?auto_50282 ) ) ( not ( = ?auto_50263 ?auto_50282 ) ) ( IS-CRATE ?auto_50263 ) ( not ( = ?auto_50256 ?auto_50288 ) ) ( not ( = ?auto_50257 ?auto_50288 ) ) ( not ( = ?auto_50287 ?auto_50288 ) ) ( not ( = ?auto_50263 ?auto_50288 ) ) ( not ( = ?auto_50282 ?auto_50288 ) ) ( not ( = ?auto_50285 ?auto_50280 ) ) ( not ( = ?auto_50269 ?auto_50285 ) ) ( not ( = ?auto_50267 ?auto_50285 ) ) ( HOIST-AT ?auto_50276 ?auto_50285 ) ( not ( = ?auto_50260 ?auto_50276 ) ) ( not ( = ?auto_50258 ?auto_50276 ) ) ( not ( = ?auto_50283 ?auto_50276 ) ) ( SURFACE-AT ?auto_50263 ?auto_50285 ) ( ON ?auto_50263 ?auto_50281 ) ( CLEAR ?auto_50263 ) ( not ( = ?auto_50256 ?auto_50281 ) ) ( not ( = ?auto_50257 ?auto_50281 ) ) ( not ( = ?auto_50287 ?auto_50281 ) ) ( not ( = ?auto_50263 ?auto_50281 ) ) ( not ( = ?auto_50282 ?auto_50281 ) ) ( not ( = ?auto_50288 ?auto_50281 ) ) ( IS-CRATE ?auto_50288 ) ( not ( = ?auto_50256 ?auto_50264 ) ) ( not ( = ?auto_50257 ?auto_50264 ) ) ( not ( = ?auto_50287 ?auto_50264 ) ) ( not ( = ?auto_50263 ?auto_50264 ) ) ( not ( = ?auto_50282 ?auto_50264 ) ) ( not ( = ?auto_50288 ?auto_50264 ) ) ( not ( = ?auto_50281 ?auto_50264 ) ) ( not ( = ?auto_50265 ?auto_50280 ) ) ( not ( = ?auto_50269 ?auto_50265 ) ) ( not ( = ?auto_50267 ?auto_50265 ) ) ( not ( = ?auto_50285 ?auto_50265 ) ) ( HOIST-AT ?auto_50262 ?auto_50265 ) ( not ( = ?auto_50260 ?auto_50262 ) ) ( not ( = ?auto_50258 ?auto_50262 ) ) ( not ( = ?auto_50283 ?auto_50262 ) ) ( not ( = ?auto_50276 ?auto_50262 ) ) ( AVAILABLE ?auto_50262 ) ( SURFACE-AT ?auto_50288 ?auto_50265 ) ( ON ?auto_50288 ?auto_50284 ) ( CLEAR ?auto_50288 ) ( not ( = ?auto_50256 ?auto_50284 ) ) ( not ( = ?auto_50257 ?auto_50284 ) ) ( not ( = ?auto_50287 ?auto_50284 ) ) ( not ( = ?auto_50263 ?auto_50284 ) ) ( not ( = ?auto_50282 ?auto_50284 ) ) ( not ( = ?auto_50288 ?auto_50284 ) ) ( not ( = ?auto_50281 ?auto_50284 ) ) ( not ( = ?auto_50264 ?auto_50284 ) ) ( IS-CRATE ?auto_50264 ) ( not ( = ?auto_50256 ?auto_50279 ) ) ( not ( = ?auto_50257 ?auto_50279 ) ) ( not ( = ?auto_50287 ?auto_50279 ) ) ( not ( = ?auto_50263 ?auto_50279 ) ) ( not ( = ?auto_50282 ?auto_50279 ) ) ( not ( = ?auto_50288 ?auto_50279 ) ) ( not ( = ?auto_50281 ?auto_50279 ) ) ( not ( = ?auto_50264 ?auto_50279 ) ) ( not ( = ?auto_50284 ?auto_50279 ) ) ( not ( = ?auto_50268 ?auto_50280 ) ) ( not ( = ?auto_50269 ?auto_50268 ) ) ( not ( = ?auto_50267 ?auto_50268 ) ) ( not ( = ?auto_50285 ?auto_50268 ) ) ( not ( = ?auto_50265 ?auto_50268 ) ) ( HOIST-AT ?auto_50270 ?auto_50268 ) ( not ( = ?auto_50260 ?auto_50270 ) ) ( not ( = ?auto_50258 ?auto_50270 ) ) ( not ( = ?auto_50283 ?auto_50270 ) ) ( not ( = ?auto_50276 ?auto_50270 ) ) ( not ( = ?auto_50262 ?auto_50270 ) ) ( AVAILABLE ?auto_50270 ) ( SURFACE-AT ?auto_50264 ?auto_50268 ) ( ON ?auto_50264 ?auto_50275 ) ( CLEAR ?auto_50264 ) ( not ( = ?auto_50256 ?auto_50275 ) ) ( not ( = ?auto_50257 ?auto_50275 ) ) ( not ( = ?auto_50287 ?auto_50275 ) ) ( not ( = ?auto_50263 ?auto_50275 ) ) ( not ( = ?auto_50282 ?auto_50275 ) ) ( not ( = ?auto_50288 ?auto_50275 ) ) ( not ( = ?auto_50281 ?auto_50275 ) ) ( not ( = ?auto_50264 ?auto_50275 ) ) ( not ( = ?auto_50284 ?auto_50275 ) ) ( not ( = ?auto_50279 ?auto_50275 ) ) ( IS-CRATE ?auto_50279 ) ( not ( = ?auto_50256 ?auto_50290 ) ) ( not ( = ?auto_50257 ?auto_50290 ) ) ( not ( = ?auto_50287 ?auto_50290 ) ) ( not ( = ?auto_50263 ?auto_50290 ) ) ( not ( = ?auto_50282 ?auto_50290 ) ) ( not ( = ?auto_50288 ?auto_50290 ) ) ( not ( = ?auto_50281 ?auto_50290 ) ) ( not ( = ?auto_50264 ?auto_50290 ) ) ( not ( = ?auto_50284 ?auto_50290 ) ) ( not ( = ?auto_50279 ?auto_50290 ) ) ( not ( = ?auto_50275 ?auto_50290 ) ) ( not ( = ?auto_50261 ?auto_50280 ) ) ( not ( = ?auto_50269 ?auto_50261 ) ) ( not ( = ?auto_50267 ?auto_50261 ) ) ( not ( = ?auto_50285 ?auto_50261 ) ) ( not ( = ?auto_50265 ?auto_50261 ) ) ( not ( = ?auto_50268 ?auto_50261 ) ) ( HOIST-AT ?auto_50289 ?auto_50261 ) ( not ( = ?auto_50260 ?auto_50289 ) ) ( not ( = ?auto_50258 ?auto_50289 ) ) ( not ( = ?auto_50283 ?auto_50289 ) ) ( not ( = ?auto_50276 ?auto_50289 ) ) ( not ( = ?auto_50262 ?auto_50289 ) ) ( not ( = ?auto_50270 ?auto_50289 ) ) ( AVAILABLE ?auto_50289 ) ( SURFACE-AT ?auto_50279 ?auto_50261 ) ( ON ?auto_50279 ?auto_50266 ) ( CLEAR ?auto_50279 ) ( not ( = ?auto_50256 ?auto_50266 ) ) ( not ( = ?auto_50257 ?auto_50266 ) ) ( not ( = ?auto_50287 ?auto_50266 ) ) ( not ( = ?auto_50263 ?auto_50266 ) ) ( not ( = ?auto_50282 ?auto_50266 ) ) ( not ( = ?auto_50288 ?auto_50266 ) ) ( not ( = ?auto_50281 ?auto_50266 ) ) ( not ( = ?auto_50264 ?auto_50266 ) ) ( not ( = ?auto_50284 ?auto_50266 ) ) ( not ( = ?auto_50279 ?auto_50266 ) ) ( not ( = ?auto_50275 ?auto_50266 ) ) ( not ( = ?auto_50290 ?auto_50266 ) ) ( IS-CRATE ?auto_50290 ) ( not ( = ?auto_50256 ?auto_50278 ) ) ( not ( = ?auto_50257 ?auto_50278 ) ) ( not ( = ?auto_50287 ?auto_50278 ) ) ( not ( = ?auto_50263 ?auto_50278 ) ) ( not ( = ?auto_50282 ?auto_50278 ) ) ( not ( = ?auto_50288 ?auto_50278 ) ) ( not ( = ?auto_50281 ?auto_50278 ) ) ( not ( = ?auto_50264 ?auto_50278 ) ) ( not ( = ?auto_50284 ?auto_50278 ) ) ( not ( = ?auto_50279 ?auto_50278 ) ) ( not ( = ?auto_50275 ?auto_50278 ) ) ( not ( = ?auto_50290 ?auto_50278 ) ) ( not ( = ?auto_50266 ?auto_50278 ) ) ( not ( = ?auto_50274 ?auto_50280 ) ) ( not ( = ?auto_50269 ?auto_50274 ) ) ( not ( = ?auto_50267 ?auto_50274 ) ) ( not ( = ?auto_50285 ?auto_50274 ) ) ( not ( = ?auto_50265 ?auto_50274 ) ) ( not ( = ?auto_50268 ?auto_50274 ) ) ( not ( = ?auto_50261 ?auto_50274 ) ) ( HOIST-AT ?auto_50259 ?auto_50274 ) ( not ( = ?auto_50260 ?auto_50259 ) ) ( not ( = ?auto_50258 ?auto_50259 ) ) ( not ( = ?auto_50283 ?auto_50259 ) ) ( not ( = ?auto_50276 ?auto_50259 ) ) ( not ( = ?auto_50262 ?auto_50259 ) ) ( not ( = ?auto_50270 ?auto_50259 ) ) ( not ( = ?auto_50289 ?auto_50259 ) ) ( AVAILABLE ?auto_50259 ) ( SURFACE-AT ?auto_50290 ?auto_50274 ) ( ON ?auto_50290 ?auto_50286 ) ( CLEAR ?auto_50290 ) ( not ( = ?auto_50256 ?auto_50286 ) ) ( not ( = ?auto_50257 ?auto_50286 ) ) ( not ( = ?auto_50287 ?auto_50286 ) ) ( not ( = ?auto_50263 ?auto_50286 ) ) ( not ( = ?auto_50282 ?auto_50286 ) ) ( not ( = ?auto_50288 ?auto_50286 ) ) ( not ( = ?auto_50281 ?auto_50286 ) ) ( not ( = ?auto_50264 ?auto_50286 ) ) ( not ( = ?auto_50284 ?auto_50286 ) ) ( not ( = ?auto_50279 ?auto_50286 ) ) ( not ( = ?auto_50275 ?auto_50286 ) ) ( not ( = ?auto_50290 ?auto_50286 ) ) ( not ( = ?auto_50266 ?auto_50286 ) ) ( not ( = ?auto_50278 ?auto_50286 ) ) ( IS-CRATE ?auto_50278 ) ( not ( = ?auto_50256 ?auto_50273 ) ) ( not ( = ?auto_50257 ?auto_50273 ) ) ( not ( = ?auto_50287 ?auto_50273 ) ) ( not ( = ?auto_50263 ?auto_50273 ) ) ( not ( = ?auto_50282 ?auto_50273 ) ) ( not ( = ?auto_50288 ?auto_50273 ) ) ( not ( = ?auto_50281 ?auto_50273 ) ) ( not ( = ?auto_50264 ?auto_50273 ) ) ( not ( = ?auto_50284 ?auto_50273 ) ) ( not ( = ?auto_50279 ?auto_50273 ) ) ( not ( = ?auto_50275 ?auto_50273 ) ) ( not ( = ?auto_50290 ?auto_50273 ) ) ( not ( = ?auto_50266 ?auto_50273 ) ) ( not ( = ?auto_50278 ?auto_50273 ) ) ( not ( = ?auto_50286 ?auto_50273 ) ) ( AVAILABLE ?auto_50276 ) ( SURFACE-AT ?auto_50278 ?auto_50285 ) ( ON ?auto_50278 ?auto_50271 ) ( CLEAR ?auto_50278 ) ( not ( = ?auto_50256 ?auto_50271 ) ) ( not ( = ?auto_50257 ?auto_50271 ) ) ( not ( = ?auto_50287 ?auto_50271 ) ) ( not ( = ?auto_50263 ?auto_50271 ) ) ( not ( = ?auto_50282 ?auto_50271 ) ) ( not ( = ?auto_50288 ?auto_50271 ) ) ( not ( = ?auto_50281 ?auto_50271 ) ) ( not ( = ?auto_50264 ?auto_50271 ) ) ( not ( = ?auto_50284 ?auto_50271 ) ) ( not ( = ?auto_50279 ?auto_50271 ) ) ( not ( = ?auto_50275 ?auto_50271 ) ) ( not ( = ?auto_50290 ?auto_50271 ) ) ( not ( = ?auto_50266 ?auto_50271 ) ) ( not ( = ?auto_50278 ?auto_50271 ) ) ( not ( = ?auto_50286 ?auto_50271 ) ) ( not ( = ?auto_50273 ?auto_50271 ) ) ( SURFACE-AT ?auto_50272 ?auto_50280 ) ( CLEAR ?auto_50272 ) ( IS-CRATE ?auto_50273 ) ( not ( = ?auto_50256 ?auto_50272 ) ) ( not ( = ?auto_50257 ?auto_50272 ) ) ( not ( = ?auto_50287 ?auto_50272 ) ) ( not ( = ?auto_50263 ?auto_50272 ) ) ( not ( = ?auto_50282 ?auto_50272 ) ) ( not ( = ?auto_50288 ?auto_50272 ) ) ( not ( = ?auto_50281 ?auto_50272 ) ) ( not ( = ?auto_50264 ?auto_50272 ) ) ( not ( = ?auto_50284 ?auto_50272 ) ) ( not ( = ?auto_50279 ?auto_50272 ) ) ( not ( = ?auto_50275 ?auto_50272 ) ) ( not ( = ?auto_50290 ?auto_50272 ) ) ( not ( = ?auto_50266 ?auto_50272 ) ) ( not ( = ?auto_50278 ?auto_50272 ) ) ( not ( = ?auto_50286 ?auto_50272 ) ) ( not ( = ?auto_50273 ?auto_50272 ) ) ( not ( = ?auto_50271 ?auto_50272 ) ) ( AVAILABLE ?auto_50260 ) ( IN ?auto_50273 ?auto_50277 ) ( TRUCK-AT ?auto_50277 ?auto_50261 ) )
    :subtasks
    ( ( !DRIVE ?auto_50277 ?auto_50261 ?auto_50280 )
      ( MAKE-ON ?auto_50256 ?auto_50257 )
      ( MAKE-ON-VERIFY ?auto_50256 ?auto_50257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50291 - SURFACE
      ?auto_50292 - SURFACE
    )
    :vars
    (
      ?auto_50315 - HOIST
      ?auto_50299 - PLACE
      ?auto_50297 - PLACE
      ?auto_50309 - HOIST
      ?auto_50304 - SURFACE
      ?auto_50313 - SURFACE
      ?auto_50322 - PLACE
      ?auto_50302 - HOIST
      ?auto_50301 - SURFACE
      ?auto_50293 - SURFACE
      ?auto_50306 - PLACE
      ?auto_50307 - HOIST
      ?auto_50325 - SURFACE
      ?auto_50324 - SURFACE
      ?auto_50318 - PLACE
      ?auto_50296 - HOIST
      ?auto_50305 - SURFACE
      ?auto_50317 - SURFACE
      ?auto_50310 - PLACE
      ?auto_50312 - HOIST
      ?auto_50294 - SURFACE
      ?auto_50319 - SURFACE
      ?auto_50321 - PLACE
      ?auto_50298 - HOIST
      ?auto_50320 - SURFACE
      ?auto_50316 - SURFACE
      ?auto_50295 - PLACE
      ?auto_50314 - HOIST
      ?auto_50303 - SURFACE
      ?auto_50300 - SURFACE
      ?auto_50311 - SURFACE
      ?auto_50323 - SURFACE
      ?auto_50308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50315 ?auto_50299 ) ( IS-CRATE ?auto_50291 ) ( not ( = ?auto_50291 ?auto_50292 ) ) ( not ( = ?auto_50297 ?auto_50299 ) ) ( HOIST-AT ?auto_50309 ?auto_50297 ) ( not ( = ?auto_50315 ?auto_50309 ) ) ( AVAILABLE ?auto_50309 ) ( SURFACE-AT ?auto_50291 ?auto_50297 ) ( ON ?auto_50291 ?auto_50304 ) ( CLEAR ?auto_50291 ) ( not ( = ?auto_50291 ?auto_50304 ) ) ( not ( = ?auto_50292 ?auto_50304 ) ) ( IS-CRATE ?auto_50292 ) ( not ( = ?auto_50291 ?auto_50313 ) ) ( not ( = ?auto_50292 ?auto_50313 ) ) ( not ( = ?auto_50304 ?auto_50313 ) ) ( not ( = ?auto_50322 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50322 ) ) ( HOIST-AT ?auto_50302 ?auto_50322 ) ( not ( = ?auto_50315 ?auto_50302 ) ) ( not ( = ?auto_50309 ?auto_50302 ) ) ( AVAILABLE ?auto_50302 ) ( SURFACE-AT ?auto_50292 ?auto_50322 ) ( ON ?auto_50292 ?auto_50301 ) ( CLEAR ?auto_50292 ) ( not ( = ?auto_50291 ?auto_50301 ) ) ( not ( = ?auto_50292 ?auto_50301 ) ) ( not ( = ?auto_50304 ?auto_50301 ) ) ( not ( = ?auto_50313 ?auto_50301 ) ) ( IS-CRATE ?auto_50313 ) ( not ( = ?auto_50291 ?auto_50293 ) ) ( not ( = ?auto_50292 ?auto_50293 ) ) ( not ( = ?auto_50304 ?auto_50293 ) ) ( not ( = ?auto_50313 ?auto_50293 ) ) ( not ( = ?auto_50301 ?auto_50293 ) ) ( not ( = ?auto_50306 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50306 ) ) ( not ( = ?auto_50322 ?auto_50306 ) ) ( HOIST-AT ?auto_50307 ?auto_50306 ) ( not ( = ?auto_50315 ?auto_50307 ) ) ( not ( = ?auto_50309 ?auto_50307 ) ) ( not ( = ?auto_50302 ?auto_50307 ) ) ( SURFACE-AT ?auto_50313 ?auto_50306 ) ( ON ?auto_50313 ?auto_50325 ) ( CLEAR ?auto_50313 ) ( not ( = ?auto_50291 ?auto_50325 ) ) ( not ( = ?auto_50292 ?auto_50325 ) ) ( not ( = ?auto_50304 ?auto_50325 ) ) ( not ( = ?auto_50313 ?auto_50325 ) ) ( not ( = ?auto_50301 ?auto_50325 ) ) ( not ( = ?auto_50293 ?auto_50325 ) ) ( IS-CRATE ?auto_50293 ) ( not ( = ?auto_50291 ?auto_50324 ) ) ( not ( = ?auto_50292 ?auto_50324 ) ) ( not ( = ?auto_50304 ?auto_50324 ) ) ( not ( = ?auto_50313 ?auto_50324 ) ) ( not ( = ?auto_50301 ?auto_50324 ) ) ( not ( = ?auto_50293 ?auto_50324 ) ) ( not ( = ?auto_50325 ?auto_50324 ) ) ( not ( = ?auto_50318 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50318 ) ) ( not ( = ?auto_50322 ?auto_50318 ) ) ( not ( = ?auto_50306 ?auto_50318 ) ) ( HOIST-AT ?auto_50296 ?auto_50318 ) ( not ( = ?auto_50315 ?auto_50296 ) ) ( not ( = ?auto_50309 ?auto_50296 ) ) ( not ( = ?auto_50302 ?auto_50296 ) ) ( not ( = ?auto_50307 ?auto_50296 ) ) ( AVAILABLE ?auto_50296 ) ( SURFACE-AT ?auto_50293 ?auto_50318 ) ( ON ?auto_50293 ?auto_50305 ) ( CLEAR ?auto_50293 ) ( not ( = ?auto_50291 ?auto_50305 ) ) ( not ( = ?auto_50292 ?auto_50305 ) ) ( not ( = ?auto_50304 ?auto_50305 ) ) ( not ( = ?auto_50313 ?auto_50305 ) ) ( not ( = ?auto_50301 ?auto_50305 ) ) ( not ( = ?auto_50293 ?auto_50305 ) ) ( not ( = ?auto_50325 ?auto_50305 ) ) ( not ( = ?auto_50324 ?auto_50305 ) ) ( IS-CRATE ?auto_50324 ) ( not ( = ?auto_50291 ?auto_50317 ) ) ( not ( = ?auto_50292 ?auto_50317 ) ) ( not ( = ?auto_50304 ?auto_50317 ) ) ( not ( = ?auto_50313 ?auto_50317 ) ) ( not ( = ?auto_50301 ?auto_50317 ) ) ( not ( = ?auto_50293 ?auto_50317 ) ) ( not ( = ?auto_50325 ?auto_50317 ) ) ( not ( = ?auto_50324 ?auto_50317 ) ) ( not ( = ?auto_50305 ?auto_50317 ) ) ( not ( = ?auto_50310 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50310 ) ) ( not ( = ?auto_50322 ?auto_50310 ) ) ( not ( = ?auto_50306 ?auto_50310 ) ) ( not ( = ?auto_50318 ?auto_50310 ) ) ( HOIST-AT ?auto_50312 ?auto_50310 ) ( not ( = ?auto_50315 ?auto_50312 ) ) ( not ( = ?auto_50309 ?auto_50312 ) ) ( not ( = ?auto_50302 ?auto_50312 ) ) ( not ( = ?auto_50307 ?auto_50312 ) ) ( not ( = ?auto_50296 ?auto_50312 ) ) ( AVAILABLE ?auto_50312 ) ( SURFACE-AT ?auto_50324 ?auto_50310 ) ( ON ?auto_50324 ?auto_50294 ) ( CLEAR ?auto_50324 ) ( not ( = ?auto_50291 ?auto_50294 ) ) ( not ( = ?auto_50292 ?auto_50294 ) ) ( not ( = ?auto_50304 ?auto_50294 ) ) ( not ( = ?auto_50313 ?auto_50294 ) ) ( not ( = ?auto_50301 ?auto_50294 ) ) ( not ( = ?auto_50293 ?auto_50294 ) ) ( not ( = ?auto_50325 ?auto_50294 ) ) ( not ( = ?auto_50324 ?auto_50294 ) ) ( not ( = ?auto_50305 ?auto_50294 ) ) ( not ( = ?auto_50317 ?auto_50294 ) ) ( IS-CRATE ?auto_50317 ) ( not ( = ?auto_50291 ?auto_50319 ) ) ( not ( = ?auto_50292 ?auto_50319 ) ) ( not ( = ?auto_50304 ?auto_50319 ) ) ( not ( = ?auto_50313 ?auto_50319 ) ) ( not ( = ?auto_50301 ?auto_50319 ) ) ( not ( = ?auto_50293 ?auto_50319 ) ) ( not ( = ?auto_50325 ?auto_50319 ) ) ( not ( = ?auto_50324 ?auto_50319 ) ) ( not ( = ?auto_50305 ?auto_50319 ) ) ( not ( = ?auto_50317 ?auto_50319 ) ) ( not ( = ?auto_50294 ?auto_50319 ) ) ( not ( = ?auto_50321 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50321 ) ) ( not ( = ?auto_50322 ?auto_50321 ) ) ( not ( = ?auto_50306 ?auto_50321 ) ) ( not ( = ?auto_50318 ?auto_50321 ) ) ( not ( = ?auto_50310 ?auto_50321 ) ) ( HOIST-AT ?auto_50298 ?auto_50321 ) ( not ( = ?auto_50315 ?auto_50298 ) ) ( not ( = ?auto_50309 ?auto_50298 ) ) ( not ( = ?auto_50302 ?auto_50298 ) ) ( not ( = ?auto_50307 ?auto_50298 ) ) ( not ( = ?auto_50296 ?auto_50298 ) ) ( not ( = ?auto_50312 ?auto_50298 ) ) ( SURFACE-AT ?auto_50317 ?auto_50321 ) ( ON ?auto_50317 ?auto_50320 ) ( CLEAR ?auto_50317 ) ( not ( = ?auto_50291 ?auto_50320 ) ) ( not ( = ?auto_50292 ?auto_50320 ) ) ( not ( = ?auto_50304 ?auto_50320 ) ) ( not ( = ?auto_50313 ?auto_50320 ) ) ( not ( = ?auto_50301 ?auto_50320 ) ) ( not ( = ?auto_50293 ?auto_50320 ) ) ( not ( = ?auto_50325 ?auto_50320 ) ) ( not ( = ?auto_50324 ?auto_50320 ) ) ( not ( = ?auto_50305 ?auto_50320 ) ) ( not ( = ?auto_50317 ?auto_50320 ) ) ( not ( = ?auto_50294 ?auto_50320 ) ) ( not ( = ?auto_50319 ?auto_50320 ) ) ( IS-CRATE ?auto_50319 ) ( not ( = ?auto_50291 ?auto_50316 ) ) ( not ( = ?auto_50292 ?auto_50316 ) ) ( not ( = ?auto_50304 ?auto_50316 ) ) ( not ( = ?auto_50313 ?auto_50316 ) ) ( not ( = ?auto_50301 ?auto_50316 ) ) ( not ( = ?auto_50293 ?auto_50316 ) ) ( not ( = ?auto_50325 ?auto_50316 ) ) ( not ( = ?auto_50324 ?auto_50316 ) ) ( not ( = ?auto_50305 ?auto_50316 ) ) ( not ( = ?auto_50317 ?auto_50316 ) ) ( not ( = ?auto_50294 ?auto_50316 ) ) ( not ( = ?auto_50319 ?auto_50316 ) ) ( not ( = ?auto_50320 ?auto_50316 ) ) ( not ( = ?auto_50295 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50295 ) ) ( not ( = ?auto_50322 ?auto_50295 ) ) ( not ( = ?auto_50306 ?auto_50295 ) ) ( not ( = ?auto_50318 ?auto_50295 ) ) ( not ( = ?auto_50310 ?auto_50295 ) ) ( not ( = ?auto_50321 ?auto_50295 ) ) ( HOIST-AT ?auto_50314 ?auto_50295 ) ( not ( = ?auto_50315 ?auto_50314 ) ) ( not ( = ?auto_50309 ?auto_50314 ) ) ( not ( = ?auto_50302 ?auto_50314 ) ) ( not ( = ?auto_50307 ?auto_50314 ) ) ( not ( = ?auto_50296 ?auto_50314 ) ) ( not ( = ?auto_50312 ?auto_50314 ) ) ( not ( = ?auto_50298 ?auto_50314 ) ) ( AVAILABLE ?auto_50314 ) ( SURFACE-AT ?auto_50319 ?auto_50295 ) ( ON ?auto_50319 ?auto_50303 ) ( CLEAR ?auto_50319 ) ( not ( = ?auto_50291 ?auto_50303 ) ) ( not ( = ?auto_50292 ?auto_50303 ) ) ( not ( = ?auto_50304 ?auto_50303 ) ) ( not ( = ?auto_50313 ?auto_50303 ) ) ( not ( = ?auto_50301 ?auto_50303 ) ) ( not ( = ?auto_50293 ?auto_50303 ) ) ( not ( = ?auto_50325 ?auto_50303 ) ) ( not ( = ?auto_50324 ?auto_50303 ) ) ( not ( = ?auto_50305 ?auto_50303 ) ) ( not ( = ?auto_50317 ?auto_50303 ) ) ( not ( = ?auto_50294 ?auto_50303 ) ) ( not ( = ?auto_50319 ?auto_50303 ) ) ( not ( = ?auto_50320 ?auto_50303 ) ) ( not ( = ?auto_50316 ?auto_50303 ) ) ( IS-CRATE ?auto_50316 ) ( not ( = ?auto_50291 ?auto_50300 ) ) ( not ( = ?auto_50292 ?auto_50300 ) ) ( not ( = ?auto_50304 ?auto_50300 ) ) ( not ( = ?auto_50313 ?auto_50300 ) ) ( not ( = ?auto_50301 ?auto_50300 ) ) ( not ( = ?auto_50293 ?auto_50300 ) ) ( not ( = ?auto_50325 ?auto_50300 ) ) ( not ( = ?auto_50324 ?auto_50300 ) ) ( not ( = ?auto_50305 ?auto_50300 ) ) ( not ( = ?auto_50317 ?auto_50300 ) ) ( not ( = ?auto_50294 ?auto_50300 ) ) ( not ( = ?auto_50319 ?auto_50300 ) ) ( not ( = ?auto_50320 ?auto_50300 ) ) ( not ( = ?auto_50316 ?auto_50300 ) ) ( not ( = ?auto_50303 ?auto_50300 ) ) ( AVAILABLE ?auto_50307 ) ( SURFACE-AT ?auto_50316 ?auto_50306 ) ( ON ?auto_50316 ?auto_50311 ) ( CLEAR ?auto_50316 ) ( not ( = ?auto_50291 ?auto_50311 ) ) ( not ( = ?auto_50292 ?auto_50311 ) ) ( not ( = ?auto_50304 ?auto_50311 ) ) ( not ( = ?auto_50313 ?auto_50311 ) ) ( not ( = ?auto_50301 ?auto_50311 ) ) ( not ( = ?auto_50293 ?auto_50311 ) ) ( not ( = ?auto_50325 ?auto_50311 ) ) ( not ( = ?auto_50324 ?auto_50311 ) ) ( not ( = ?auto_50305 ?auto_50311 ) ) ( not ( = ?auto_50317 ?auto_50311 ) ) ( not ( = ?auto_50294 ?auto_50311 ) ) ( not ( = ?auto_50319 ?auto_50311 ) ) ( not ( = ?auto_50320 ?auto_50311 ) ) ( not ( = ?auto_50316 ?auto_50311 ) ) ( not ( = ?auto_50303 ?auto_50311 ) ) ( not ( = ?auto_50300 ?auto_50311 ) ) ( SURFACE-AT ?auto_50323 ?auto_50299 ) ( CLEAR ?auto_50323 ) ( IS-CRATE ?auto_50300 ) ( not ( = ?auto_50291 ?auto_50323 ) ) ( not ( = ?auto_50292 ?auto_50323 ) ) ( not ( = ?auto_50304 ?auto_50323 ) ) ( not ( = ?auto_50313 ?auto_50323 ) ) ( not ( = ?auto_50301 ?auto_50323 ) ) ( not ( = ?auto_50293 ?auto_50323 ) ) ( not ( = ?auto_50325 ?auto_50323 ) ) ( not ( = ?auto_50324 ?auto_50323 ) ) ( not ( = ?auto_50305 ?auto_50323 ) ) ( not ( = ?auto_50317 ?auto_50323 ) ) ( not ( = ?auto_50294 ?auto_50323 ) ) ( not ( = ?auto_50319 ?auto_50323 ) ) ( not ( = ?auto_50320 ?auto_50323 ) ) ( not ( = ?auto_50316 ?auto_50323 ) ) ( not ( = ?auto_50303 ?auto_50323 ) ) ( not ( = ?auto_50300 ?auto_50323 ) ) ( not ( = ?auto_50311 ?auto_50323 ) ) ( AVAILABLE ?auto_50315 ) ( TRUCK-AT ?auto_50308 ?auto_50321 ) ( LIFTING ?auto_50298 ?auto_50300 ) )
    :subtasks
    ( ( !LOAD ?auto_50298 ?auto_50300 ?auto_50308 ?auto_50321 )
      ( MAKE-ON ?auto_50291 ?auto_50292 )
      ( MAKE-ON-VERIFY ?auto_50291 ?auto_50292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50326 - SURFACE
      ?auto_50327 - SURFACE
    )
    :vars
    (
      ?auto_50345 - HOIST
      ?auto_50359 - PLACE
      ?auto_50355 - PLACE
      ?auto_50339 - HOIST
      ?auto_50357 - SURFACE
      ?auto_50343 - SURFACE
      ?auto_50336 - PLACE
      ?auto_50349 - HOIST
      ?auto_50360 - SURFACE
      ?auto_50356 - SURFACE
      ?auto_50354 - PLACE
      ?auto_50347 - HOIST
      ?auto_50330 - SURFACE
      ?auto_50331 - SURFACE
      ?auto_50329 - PLACE
      ?auto_50351 - HOIST
      ?auto_50350 - SURFACE
      ?auto_50332 - SURFACE
      ?auto_50340 - PLACE
      ?auto_50342 - HOIST
      ?auto_50328 - SURFACE
      ?auto_50333 - SURFACE
      ?auto_50335 - PLACE
      ?auto_50353 - HOIST
      ?auto_50334 - SURFACE
      ?auto_50338 - SURFACE
      ?auto_50348 - PLACE
      ?auto_50344 - HOIST
      ?auto_50358 - SURFACE
      ?auto_50352 - SURFACE
      ?auto_50341 - SURFACE
      ?auto_50337 - SURFACE
      ?auto_50346 - TRUCK
      ?auto_50361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50345 ?auto_50359 ) ( IS-CRATE ?auto_50326 ) ( not ( = ?auto_50326 ?auto_50327 ) ) ( not ( = ?auto_50355 ?auto_50359 ) ) ( HOIST-AT ?auto_50339 ?auto_50355 ) ( not ( = ?auto_50345 ?auto_50339 ) ) ( AVAILABLE ?auto_50339 ) ( SURFACE-AT ?auto_50326 ?auto_50355 ) ( ON ?auto_50326 ?auto_50357 ) ( CLEAR ?auto_50326 ) ( not ( = ?auto_50326 ?auto_50357 ) ) ( not ( = ?auto_50327 ?auto_50357 ) ) ( IS-CRATE ?auto_50327 ) ( not ( = ?auto_50326 ?auto_50343 ) ) ( not ( = ?auto_50327 ?auto_50343 ) ) ( not ( = ?auto_50357 ?auto_50343 ) ) ( not ( = ?auto_50336 ?auto_50359 ) ) ( not ( = ?auto_50355 ?auto_50336 ) ) ( HOIST-AT ?auto_50349 ?auto_50336 ) ( not ( = ?auto_50345 ?auto_50349 ) ) ( not ( = ?auto_50339 ?auto_50349 ) ) ( AVAILABLE ?auto_50349 ) ( SURFACE-AT ?auto_50327 ?auto_50336 ) ( ON ?auto_50327 ?auto_50360 ) ( CLEAR ?auto_50327 ) ( not ( = ?auto_50326 ?auto_50360 ) ) ( not ( = ?auto_50327 ?auto_50360 ) ) ( not ( = ?auto_50357 ?auto_50360 ) ) ( not ( = ?auto_50343 ?auto_50360 ) ) ( IS-CRATE ?auto_50343 ) ( not ( = ?auto_50326 ?auto_50356 ) ) ( not ( = ?auto_50327 ?auto_50356 ) ) ( not ( = ?auto_50357 ?auto_50356 ) ) ( not ( = ?auto_50343 ?auto_50356 ) ) ( not ( = ?auto_50360 ?auto_50356 ) ) ( not ( = ?auto_50354 ?auto_50359 ) ) ( not ( = ?auto_50355 ?auto_50354 ) ) ( not ( = ?auto_50336 ?auto_50354 ) ) ( HOIST-AT ?auto_50347 ?auto_50354 ) ( not ( = ?auto_50345 ?auto_50347 ) ) ( not ( = ?auto_50339 ?auto_50347 ) ) ( not ( = ?auto_50349 ?auto_50347 ) ) ( SURFACE-AT ?auto_50343 ?auto_50354 ) ( ON ?auto_50343 ?auto_50330 ) ( CLEAR ?auto_50343 ) ( not ( = ?auto_50326 ?auto_50330 ) ) ( not ( = ?auto_50327 ?auto_50330 ) ) ( not ( = ?auto_50357 ?auto_50330 ) ) ( not ( = ?auto_50343 ?auto_50330 ) ) ( not ( = ?auto_50360 ?auto_50330 ) ) ( not ( = ?auto_50356 ?auto_50330 ) ) ( IS-CRATE ?auto_50356 ) ( not ( = ?auto_50326 ?auto_50331 ) ) ( not ( = ?auto_50327 ?auto_50331 ) ) ( not ( = ?auto_50357 ?auto_50331 ) ) ( not ( = ?auto_50343 ?auto_50331 ) ) ( not ( = ?auto_50360 ?auto_50331 ) ) ( not ( = ?auto_50356 ?auto_50331 ) ) ( not ( = ?auto_50330 ?auto_50331 ) ) ( not ( = ?auto_50329 ?auto_50359 ) ) ( not ( = ?auto_50355 ?auto_50329 ) ) ( not ( = ?auto_50336 ?auto_50329 ) ) ( not ( = ?auto_50354 ?auto_50329 ) ) ( HOIST-AT ?auto_50351 ?auto_50329 ) ( not ( = ?auto_50345 ?auto_50351 ) ) ( not ( = ?auto_50339 ?auto_50351 ) ) ( not ( = ?auto_50349 ?auto_50351 ) ) ( not ( = ?auto_50347 ?auto_50351 ) ) ( AVAILABLE ?auto_50351 ) ( SURFACE-AT ?auto_50356 ?auto_50329 ) ( ON ?auto_50356 ?auto_50350 ) ( CLEAR ?auto_50356 ) ( not ( = ?auto_50326 ?auto_50350 ) ) ( not ( = ?auto_50327 ?auto_50350 ) ) ( not ( = ?auto_50357 ?auto_50350 ) ) ( not ( = ?auto_50343 ?auto_50350 ) ) ( not ( = ?auto_50360 ?auto_50350 ) ) ( not ( = ?auto_50356 ?auto_50350 ) ) ( not ( = ?auto_50330 ?auto_50350 ) ) ( not ( = ?auto_50331 ?auto_50350 ) ) ( IS-CRATE ?auto_50331 ) ( not ( = ?auto_50326 ?auto_50332 ) ) ( not ( = ?auto_50327 ?auto_50332 ) ) ( not ( = ?auto_50357 ?auto_50332 ) ) ( not ( = ?auto_50343 ?auto_50332 ) ) ( not ( = ?auto_50360 ?auto_50332 ) ) ( not ( = ?auto_50356 ?auto_50332 ) ) ( not ( = ?auto_50330 ?auto_50332 ) ) ( not ( = ?auto_50331 ?auto_50332 ) ) ( not ( = ?auto_50350 ?auto_50332 ) ) ( not ( = ?auto_50340 ?auto_50359 ) ) ( not ( = ?auto_50355 ?auto_50340 ) ) ( not ( = ?auto_50336 ?auto_50340 ) ) ( not ( = ?auto_50354 ?auto_50340 ) ) ( not ( = ?auto_50329 ?auto_50340 ) ) ( HOIST-AT ?auto_50342 ?auto_50340 ) ( not ( = ?auto_50345 ?auto_50342 ) ) ( not ( = ?auto_50339 ?auto_50342 ) ) ( not ( = ?auto_50349 ?auto_50342 ) ) ( not ( = ?auto_50347 ?auto_50342 ) ) ( not ( = ?auto_50351 ?auto_50342 ) ) ( AVAILABLE ?auto_50342 ) ( SURFACE-AT ?auto_50331 ?auto_50340 ) ( ON ?auto_50331 ?auto_50328 ) ( CLEAR ?auto_50331 ) ( not ( = ?auto_50326 ?auto_50328 ) ) ( not ( = ?auto_50327 ?auto_50328 ) ) ( not ( = ?auto_50357 ?auto_50328 ) ) ( not ( = ?auto_50343 ?auto_50328 ) ) ( not ( = ?auto_50360 ?auto_50328 ) ) ( not ( = ?auto_50356 ?auto_50328 ) ) ( not ( = ?auto_50330 ?auto_50328 ) ) ( not ( = ?auto_50331 ?auto_50328 ) ) ( not ( = ?auto_50350 ?auto_50328 ) ) ( not ( = ?auto_50332 ?auto_50328 ) ) ( IS-CRATE ?auto_50332 ) ( not ( = ?auto_50326 ?auto_50333 ) ) ( not ( = ?auto_50327 ?auto_50333 ) ) ( not ( = ?auto_50357 ?auto_50333 ) ) ( not ( = ?auto_50343 ?auto_50333 ) ) ( not ( = ?auto_50360 ?auto_50333 ) ) ( not ( = ?auto_50356 ?auto_50333 ) ) ( not ( = ?auto_50330 ?auto_50333 ) ) ( not ( = ?auto_50331 ?auto_50333 ) ) ( not ( = ?auto_50350 ?auto_50333 ) ) ( not ( = ?auto_50332 ?auto_50333 ) ) ( not ( = ?auto_50328 ?auto_50333 ) ) ( not ( = ?auto_50335 ?auto_50359 ) ) ( not ( = ?auto_50355 ?auto_50335 ) ) ( not ( = ?auto_50336 ?auto_50335 ) ) ( not ( = ?auto_50354 ?auto_50335 ) ) ( not ( = ?auto_50329 ?auto_50335 ) ) ( not ( = ?auto_50340 ?auto_50335 ) ) ( HOIST-AT ?auto_50353 ?auto_50335 ) ( not ( = ?auto_50345 ?auto_50353 ) ) ( not ( = ?auto_50339 ?auto_50353 ) ) ( not ( = ?auto_50349 ?auto_50353 ) ) ( not ( = ?auto_50347 ?auto_50353 ) ) ( not ( = ?auto_50351 ?auto_50353 ) ) ( not ( = ?auto_50342 ?auto_50353 ) ) ( SURFACE-AT ?auto_50332 ?auto_50335 ) ( ON ?auto_50332 ?auto_50334 ) ( CLEAR ?auto_50332 ) ( not ( = ?auto_50326 ?auto_50334 ) ) ( not ( = ?auto_50327 ?auto_50334 ) ) ( not ( = ?auto_50357 ?auto_50334 ) ) ( not ( = ?auto_50343 ?auto_50334 ) ) ( not ( = ?auto_50360 ?auto_50334 ) ) ( not ( = ?auto_50356 ?auto_50334 ) ) ( not ( = ?auto_50330 ?auto_50334 ) ) ( not ( = ?auto_50331 ?auto_50334 ) ) ( not ( = ?auto_50350 ?auto_50334 ) ) ( not ( = ?auto_50332 ?auto_50334 ) ) ( not ( = ?auto_50328 ?auto_50334 ) ) ( not ( = ?auto_50333 ?auto_50334 ) ) ( IS-CRATE ?auto_50333 ) ( not ( = ?auto_50326 ?auto_50338 ) ) ( not ( = ?auto_50327 ?auto_50338 ) ) ( not ( = ?auto_50357 ?auto_50338 ) ) ( not ( = ?auto_50343 ?auto_50338 ) ) ( not ( = ?auto_50360 ?auto_50338 ) ) ( not ( = ?auto_50356 ?auto_50338 ) ) ( not ( = ?auto_50330 ?auto_50338 ) ) ( not ( = ?auto_50331 ?auto_50338 ) ) ( not ( = ?auto_50350 ?auto_50338 ) ) ( not ( = ?auto_50332 ?auto_50338 ) ) ( not ( = ?auto_50328 ?auto_50338 ) ) ( not ( = ?auto_50333 ?auto_50338 ) ) ( not ( = ?auto_50334 ?auto_50338 ) ) ( not ( = ?auto_50348 ?auto_50359 ) ) ( not ( = ?auto_50355 ?auto_50348 ) ) ( not ( = ?auto_50336 ?auto_50348 ) ) ( not ( = ?auto_50354 ?auto_50348 ) ) ( not ( = ?auto_50329 ?auto_50348 ) ) ( not ( = ?auto_50340 ?auto_50348 ) ) ( not ( = ?auto_50335 ?auto_50348 ) ) ( HOIST-AT ?auto_50344 ?auto_50348 ) ( not ( = ?auto_50345 ?auto_50344 ) ) ( not ( = ?auto_50339 ?auto_50344 ) ) ( not ( = ?auto_50349 ?auto_50344 ) ) ( not ( = ?auto_50347 ?auto_50344 ) ) ( not ( = ?auto_50351 ?auto_50344 ) ) ( not ( = ?auto_50342 ?auto_50344 ) ) ( not ( = ?auto_50353 ?auto_50344 ) ) ( AVAILABLE ?auto_50344 ) ( SURFACE-AT ?auto_50333 ?auto_50348 ) ( ON ?auto_50333 ?auto_50358 ) ( CLEAR ?auto_50333 ) ( not ( = ?auto_50326 ?auto_50358 ) ) ( not ( = ?auto_50327 ?auto_50358 ) ) ( not ( = ?auto_50357 ?auto_50358 ) ) ( not ( = ?auto_50343 ?auto_50358 ) ) ( not ( = ?auto_50360 ?auto_50358 ) ) ( not ( = ?auto_50356 ?auto_50358 ) ) ( not ( = ?auto_50330 ?auto_50358 ) ) ( not ( = ?auto_50331 ?auto_50358 ) ) ( not ( = ?auto_50350 ?auto_50358 ) ) ( not ( = ?auto_50332 ?auto_50358 ) ) ( not ( = ?auto_50328 ?auto_50358 ) ) ( not ( = ?auto_50333 ?auto_50358 ) ) ( not ( = ?auto_50334 ?auto_50358 ) ) ( not ( = ?auto_50338 ?auto_50358 ) ) ( IS-CRATE ?auto_50338 ) ( not ( = ?auto_50326 ?auto_50352 ) ) ( not ( = ?auto_50327 ?auto_50352 ) ) ( not ( = ?auto_50357 ?auto_50352 ) ) ( not ( = ?auto_50343 ?auto_50352 ) ) ( not ( = ?auto_50360 ?auto_50352 ) ) ( not ( = ?auto_50356 ?auto_50352 ) ) ( not ( = ?auto_50330 ?auto_50352 ) ) ( not ( = ?auto_50331 ?auto_50352 ) ) ( not ( = ?auto_50350 ?auto_50352 ) ) ( not ( = ?auto_50332 ?auto_50352 ) ) ( not ( = ?auto_50328 ?auto_50352 ) ) ( not ( = ?auto_50333 ?auto_50352 ) ) ( not ( = ?auto_50334 ?auto_50352 ) ) ( not ( = ?auto_50338 ?auto_50352 ) ) ( not ( = ?auto_50358 ?auto_50352 ) ) ( AVAILABLE ?auto_50347 ) ( SURFACE-AT ?auto_50338 ?auto_50354 ) ( ON ?auto_50338 ?auto_50341 ) ( CLEAR ?auto_50338 ) ( not ( = ?auto_50326 ?auto_50341 ) ) ( not ( = ?auto_50327 ?auto_50341 ) ) ( not ( = ?auto_50357 ?auto_50341 ) ) ( not ( = ?auto_50343 ?auto_50341 ) ) ( not ( = ?auto_50360 ?auto_50341 ) ) ( not ( = ?auto_50356 ?auto_50341 ) ) ( not ( = ?auto_50330 ?auto_50341 ) ) ( not ( = ?auto_50331 ?auto_50341 ) ) ( not ( = ?auto_50350 ?auto_50341 ) ) ( not ( = ?auto_50332 ?auto_50341 ) ) ( not ( = ?auto_50328 ?auto_50341 ) ) ( not ( = ?auto_50333 ?auto_50341 ) ) ( not ( = ?auto_50334 ?auto_50341 ) ) ( not ( = ?auto_50338 ?auto_50341 ) ) ( not ( = ?auto_50358 ?auto_50341 ) ) ( not ( = ?auto_50352 ?auto_50341 ) ) ( SURFACE-AT ?auto_50337 ?auto_50359 ) ( CLEAR ?auto_50337 ) ( IS-CRATE ?auto_50352 ) ( not ( = ?auto_50326 ?auto_50337 ) ) ( not ( = ?auto_50327 ?auto_50337 ) ) ( not ( = ?auto_50357 ?auto_50337 ) ) ( not ( = ?auto_50343 ?auto_50337 ) ) ( not ( = ?auto_50360 ?auto_50337 ) ) ( not ( = ?auto_50356 ?auto_50337 ) ) ( not ( = ?auto_50330 ?auto_50337 ) ) ( not ( = ?auto_50331 ?auto_50337 ) ) ( not ( = ?auto_50350 ?auto_50337 ) ) ( not ( = ?auto_50332 ?auto_50337 ) ) ( not ( = ?auto_50328 ?auto_50337 ) ) ( not ( = ?auto_50333 ?auto_50337 ) ) ( not ( = ?auto_50334 ?auto_50337 ) ) ( not ( = ?auto_50338 ?auto_50337 ) ) ( not ( = ?auto_50358 ?auto_50337 ) ) ( not ( = ?auto_50352 ?auto_50337 ) ) ( not ( = ?auto_50341 ?auto_50337 ) ) ( AVAILABLE ?auto_50345 ) ( TRUCK-AT ?auto_50346 ?auto_50335 ) ( AVAILABLE ?auto_50353 ) ( SURFACE-AT ?auto_50352 ?auto_50335 ) ( ON ?auto_50352 ?auto_50361 ) ( CLEAR ?auto_50352 ) ( not ( = ?auto_50326 ?auto_50361 ) ) ( not ( = ?auto_50327 ?auto_50361 ) ) ( not ( = ?auto_50357 ?auto_50361 ) ) ( not ( = ?auto_50343 ?auto_50361 ) ) ( not ( = ?auto_50360 ?auto_50361 ) ) ( not ( = ?auto_50356 ?auto_50361 ) ) ( not ( = ?auto_50330 ?auto_50361 ) ) ( not ( = ?auto_50331 ?auto_50361 ) ) ( not ( = ?auto_50350 ?auto_50361 ) ) ( not ( = ?auto_50332 ?auto_50361 ) ) ( not ( = ?auto_50328 ?auto_50361 ) ) ( not ( = ?auto_50333 ?auto_50361 ) ) ( not ( = ?auto_50334 ?auto_50361 ) ) ( not ( = ?auto_50338 ?auto_50361 ) ) ( not ( = ?auto_50358 ?auto_50361 ) ) ( not ( = ?auto_50352 ?auto_50361 ) ) ( not ( = ?auto_50341 ?auto_50361 ) ) ( not ( = ?auto_50337 ?auto_50361 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50353 ?auto_50352 ?auto_50361 ?auto_50335 )
      ( MAKE-ON ?auto_50326 ?auto_50327 )
      ( MAKE-ON-VERIFY ?auto_50326 ?auto_50327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50362 - SURFACE
      ?auto_50363 - SURFACE
    )
    :vars
    (
      ?auto_50385 - HOIST
      ?auto_50387 - PLACE
      ?auto_50379 - PLACE
      ?auto_50374 - HOIST
      ?auto_50381 - SURFACE
      ?auto_50372 - SURFACE
      ?auto_50396 - PLACE
      ?auto_50369 - HOIST
      ?auto_50365 - SURFACE
      ?auto_50380 - SURFACE
      ?auto_50390 - PLACE
      ?auto_50364 - HOIST
      ?auto_50367 - SURFACE
      ?auto_50366 - SURFACE
      ?auto_50375 - PLACE
      ?auto_50383 - HOIST
      ?auto_50371 - SURFACE
      ?auto_50376 - SURFACE
      ?auto_50394 - PLACE
      ?auto_50368 - HOIST
      ?auto_50397 - SURFACE
      ?auto_50392 - SURFACE
      ?auto_50393 - PLACE
      ?auto_50389 - HOIST
      ?auto_50373 - SURFACE
      ?auto_50378 - SURFACE
      ?auto_50370 - PLACE
      ?auto_50384 - HOIST
      ?auto_50382 - SURFACE
      ?auto_50388 - SURFACE
      ?auto_50377 - SURFACE
      ?auto_50391 - SURFACE
      ?auto_50395 - SURFACE
      ?auto_50386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50385 ?auto_50387 ) ( IS-CRATE ?auto_50362 ) ( not ( = ?auto_50362 ?auto_50363 ) ) ( not ( = ?auto_50379 ?auto_50387 ) ) ( HOIST-AT ?auto_50374 ?auto_50379 ) ( not ( = ?auto_50385 ?auto_50374 ) ) ( AVAILABLE ?auto_50374 ) ( SURFACE-AT ?auto_50362 ?auto_50379 ) ( ON ?auto_50362 ?auto_50381 ) ( CLEAR ?auto_50362 ) ( not ( = ?auto_50362 ?auto_50381 ) ) ( not ( = ?auto_50363 ?auto_50381 ) ) ( IS-CRATE ?auto_50363 ) ( not ( = ?auto_50362 ?auto_50372 ) ) ( not ( = ?auto_50363 ?auto_50372 ) ) ( not ( = ?auto_50381 ?auto_50372 ) ) ( not ( = ?auto_50396 ?auto_50387 ) ) ( not ( = ?auto_50379 ?auto_50396 ) ) ( HOIST-AT ?auto_50369 ?auto_50396 ) ( not ( = ?auto_50385 ?auto_50369 ) ) ( not ( = ?auto_50374 ?auto_50369 ) ) ( AVAILABLE ?auto_50369 ) ( SURFACE-AT ?auto_50363 ?auto_50396 ) ( ON ?auto_50363 ?auto_50365 ) ( CLEAR ?auto_50363 ) ( not ( = ?auto_50362 ?auto_50365 ) ) ( not ( = ?auto_50363 ?auto_50365 ) ) ( not ( = ?auto_50381 ?auto_50365 ) ) ( not ( = ?auto_50372 ?auto_50365 ) ) ( IS-CRATE ?auto_50372 ) ( not ( = ?auto_50362 ?auto_50380 ) ) ( not ( = ?auto_50363 ?auto_50380 ) ) ( not ( = ?auto_50381 ?auto_50380 ) ) ( not ( = ?auto_50372 ?auto_50380 ) ) ( not ( = ?auto_50365 ?auto_50380 ) ) ( not ( = ?auto_50390 ?auto_50387 ) ) ( not ( = ?auto_50379 ?auto_50390 ) ) ( not ( = ?auto_50396 ?auto_50390 ) ) ( HOIST-AT ?auto_50364 ?auto_50390 ) ( not ( = ?auto_50385 ?auto_50364 ) ) ( not ( = ?auto_50374 ?auto_50364 ) ) ( not ( = ?auto_50369 ?auto_50364 ) ) ( SURFACE-AT ?auto_50372 ?auto_50390 ) ( ON ?auto_50372 ?auto_50367 ) ( CLEAR ?auto_50372 ) ( not ( = ?auto_50362 ?auto_50367 ) ) ( not ( = ?auto_50363 ?auto_50367 ) ) ( not ( = ?auto_50381 ?auto_50367 ) ) ( not ( = ?auto_50372 ?auto_50367 ) ) ( not ( = ?auto_50365 ?auto_50367 ) ) ( not ( = ?auto_50380 ?auto_50367 ) ) ( IS-CRATE ?auto_50380 ) ( not ( = ?auto_50362 ?auto_50366 ) ) ( not ( = ?auto_50363 ?auto_50366 ) ) ( not ( = ?auto_50381 ?auto_50366 ) ) ( not ( = ?auto_50372 ?auto_50366 ) ) ( not ( = ?auto_50365 ?auto_50366 ) ) ( not ( = ?auto_50380 ?auto_50366 ) ) ( not ( = ?auto_50367 ?auto_50366 ) ) ( not ( = ?auto_50375 ?auto_50387 ) ) ( not ( = ?auto_50379 ?auto_50375 ) ) ( not ( = ?auto_50396 ?auto_50375 ) ) ( not ( = ?auto_50390 ?auto_50375 ) ) ( HOIST-AT ?auto_50383 ?auto_50375 ) ( not ( = ?auto_50385 ?auto_50383 ) ) ( not ( = ?auto_50374 ?auto_50383 ) ) ( not ( = ?auto_50369 ?auto_50383 ) ) ( not ( = ?auto_50364 ?auto_50383 ) ) ( AVAILABLE ?auto_50383 ) ( SURFACE-AT ?auto_50380 ?auto_50375 ) ( ON ?auto_50380 ?auto_50371 ) ( CLEAR ?auto_50380 ) ( not ( = ?auto_50362 ?auto_50371 ) ) ( not ( = ?auto_50363 ?auto_50371 ) ) ( not ( = ?auto_50381 ?auto_50371 ) ) ( not ( = ?auto_50372 ?auto_50371 ) ) ( not ( = ?auto_50365 ?auto_50371 ) ) ( not ( = ?auto_50380 ?auto_50371 ) ) ( not ( = ?auto_50367 ?auto_50371 ) ) ( not ( = ?auto_50366 ?auto_50371 ) ) ( IS-CRATE ?auto_50366 ) ( not ( = ?auto_50362 ?auto_50376 ) ) ( not ( = ?auto_50363 ?auto_50376 ) ) ( not ( = ?auto_50381 ?auto_50376 ) ) ( not ( = ?auto_50372 ?auto_50376 ) ) ( not ( = ?auto_50365 ?auto_50376 ) ) ( not ( = ?auto_50380 ?auto_50376 ) ) ( not ( = ?auto_50367 ?auto_50376 ) ) ( not ( = ?auto_50366 ?auto_50376 ) ) ( not ( = ?auto_50371 ?auto_50376 ) ) ( not ( = ?auto_50394 ?auto_50387 ) ) ( not ( = ?auto_50379 ?auto_50394 ) ) ( not ( = ?auto_50396 ?auto_50394 ) ) ( not ( = ?auto_50390 ?auto_50394 ) ) ( not ( = ?auto_50375 ?auto_50394 ) ) ( HOIST-AT ?auto_50368 ?auto_50394 ) ( not ( = ?auto_50385 ?auto_50368 ) ) ( not ( = ?auto_50374 ?auto_50368 ) ) ( not ( = ?auto_50369 ?auto_50368 ) ) ( not ( = ?auto_50364 ?auto_50368 ) ) ( not ( = ?auto_50383 ?auto_50368 ) ) ( AVAILABLE ?auto_50368 ) ( SURFACE-AT ?auto_50366 ?auto_50394 ) ( ON ?auto_50366 ?auto_50397 ) ( CLEAR ?auto_50366 ) ( not ( = ?auto_50362 ?auto_50397 ) ) ( not ( = ?auto_50363 ?auto_50397 ) ) ( not ( = ?auto_50381 ?auto_50397 ) ) ( not ( = ?auto_50372 ?auto_50397 ) ) ( not ( = ?auto_50365 ?auto_50397 ) ) ( not ( = ?auto_50380 ?auto_50397 ) ) ( not ( = ?auto_50367 ?auto_50397 ) ) ( not ( = ?auto_50366 ?auto_50397 ) ) ( not ( = ?auto_50371 ?auto_50397 ) ) ( not ( = ?auto_50376 ?auto_50397 ) ) ( IS-CRATE ?auto_50376 ) ( not ( = ?auto_50362 ?auto_50392 ) ) ( not ( = ?auto_50363 ?auto_50392 ) ) ( not ( = ?auto_50381 ?auto_50392 ) ) ( not ( = ?auto_50372 ?auto_50392 ) ) ( not ( = ?auto_50365 ?auto_50392 ) ) ( not ( = ?auto_50380 ?auto_50392 ) ) ( not ( = ?auto_50367 ?auto_50392 ) ) ( not ( = ?auto_50366 ?auto_50392 ) ) ( not ( = ?auto_50371 ?auto_50392 ) ) ( not ( = ?auto_50376 ?auto_50392 ) ) ( not ( = ?auto_50397 ?auto_50392 ) ) ( not ( = ?auto_50393 ?auto_50387 ) ) ( not ( = ?auto_50379 ?auto_50393 ) ) ( not ( = ?auto_50396 ?auto_50393 ) ) ( not ( = ?auto_50390 ?auto_50393 ) ) ( not ( = ?auto_50375 ?auto_50393 ) ) ( not ( = ?auto_50394 ?auto_50393 ) ) ( HOIST-AT ?auto_50389 ?auto_50393 ) ( not ( = ?auto_50385 ?auto_50389 ) ) ( not ( = ?auto_50374 ?auto_50389 ) ) ( not ( = ?auto_50369 ?auto_50389 ) ) ( not ( = ?auto_50364 ?auto_50389 ) ) ( not ( = ?auto_50383 ?auto_50389 ) ) ( not ( = ?auto_50368 ?auto_50389 ) ) ( SURFACE-AT ?auto_50376 ?auto_50393 ) ( ON ?auto_50376 ?auto_50373 ) ( CLEAR ?auto_50376 ) ( not ( = ?auto_50362 ?auto_50373 ) ) ( not ( = ?auto_50363 ?auto_50373 ) ) ( not ( = ?auto_50381 ?auto_50373 ) ) ( not ( = ?auto_50372 ?auto_50373 ) ) ( not ( = ?auto_50365 ?auto_50373 ) ) ( not ( = ?auto_50380 ?auto_50373 ) ) ( not ( = ?auto_50367 ?auto_50373 ) ) ( not ( = ?auto_50366 ?auto_50373 ) ) ( not ( = ?auto_50371 ?auto_50373 ) ) ( not ( = ?auto_50376 ?auto_50373 ) ) ( not ( = ?auto_50397 ?auto_50373 ) ) ( not ( = ?auto_50392 ?auto_50373 ) ) ( IS-CRATE ?auto_50392 ) ( not ( = ?auto_50362 ?auto_50378 ) ) ( not ( = ?auto_50363 ?auto_50378 ) ) ( not ( = ?auto_50381 ?auto_50378 ) ) ( not ( = ?auto_50372 ?auto_50378 ) ) ( not ( = ?auto_50365 ?auto_50378 ) ) ( not ( = ?auto_50380 ?auto_50378 ) ) ( not ( = ?auto_50367 ?auto_50378 ) ) ( not ( = ?auto_50366 ?auto_50378 ) ) ( not ( = ?auto_50371 ?auto_50378 ) ) ( not ( = ?auto_50376 ?auto_50378 ) ) ( not ( = ?auto_50397 ?auto_50378 ) ) ( not ( = ?auto_50392 ?auto_50378 ) ) ( not ( = ?auto_50373 ?auto_50378 ) ) ( not ( = ?auto_50370 ?auto_50387 ) ) ( not ( = ?auto_50379 ?auto_50370 ) ) ( not ( = ?auto_50396 ?auto_50370 ) ) ( not ( = ?auto_50390 ?auto_50370 ) ) ( not ( = ?auto_50375 ?auto_50370 ) ) ( not ( = ?auto_50394 ?auto_50370 ) ) ( not ( = ?auto_50393 ?auto_50370 ) ) ( HOIST-AT ?auto_50384 ?auto_50370 ) ( not ( = ?auto_50385 ?auto_50384 ) ) ( not ( = ?auto_50374 ?auto_50384 ) ) ( not ( = ?auto_50369 ?auto_50384 ) ) ( not ( = ?auto_50364 ?auto_50384 ) ) ( not ( = ?auto_50383 ?auto_50384 ) ) ( not ( = ?auto_50368 ?auto_50384 ) ) ( not ( = ?auto_50389 ?auto_50384 ) ) ( AVAILABLE ?auto_50384 ) ( SURFACE-AT ?auto_50392 ?auto_50370 ) ( ON ?auto_50392 ?auto_50382 ) ( CLEAR ?auto_50392 ) ( not ( = ?auto_50362 ?auto_50382 ) ) ( not ( = ?auto_50363 ?auto_50382 ) ) ( not ( = ?auto_50381 ?auto_50382 ) ) ( not ( = ?auto_50372 ?auto_50382 ) ) ( not ( = ?auto_50365 ?auto_50382 ) ) ( not ( = ?auto_50380 ?auto_50382 ) ) ( not ( = ?auto_50367 ?auto_50382 ) ) ( not ( = ?auto_50366 ?auto_50382 ) ) ( not ( = ?auto_50371 ?auto_50382 ) ) ( not ( = ?auto_50376 ?auto_50382 ) ) ( not ( = ?auto_50397 ?auto_50382 ) ) ( not ( = ?auto_50392 ?auto_50382 ) ) ( not ( = ?auto_50373 ?auto_50382 ) ) ( not ( = ?auto_50378 ?auto_50382 ) ) ( IS-CRATE ?auto_50378 ) ( not ( = ?auto_50362 ?auto_50388 ) ) ( not ( = ?auto_50363 ?auto_50388 ) ) ( not ( = ?auto_50381 ?auto_50388 ) ) ( not ( = ?auto_50372 ?auto_50388 ) ) ( not ( = ?auto_50365 ?auto_50388 ) ) ( not ( = ?auto_50380 ?auto_50388 ) ) ( not ( = ?auto_50367 ?auto_50388 ) ) ( not ( = ?auto_50366 ?auto_50388 ) ) ( not ( = ?auto_50371 ?auto_50388 ) ) ( not ( = ?auto_50376 ?auto_50388 ) ) ( not ( = ?auto_50397 ?auto_50388 ) ) ( not ( = ?auto_50392 ?auto_50388 ) ) ( not ( = ?auto_50373 ?auto_50388 ) ) ( not ( = ?auto_50378 ?auto_50388 ) ) ( not ( = ?auto_50382 ?auto_50388 ) ) ( AVAILABLE ?auto_50364 ) ( SURFACE-AT ?auto_50378 ?auto_50390 ) ( ON ?auto_50378 ?auto_50377 ) ( CLEAR ?auto_50378 ) ( not ( = ?auto_50362 ?auto_50377 ) ) ( not ( = ?auto_50363 ?auto_50377 ) ) ( not ( = ?auto_50381 ?auto_50377 ) ) ( not ( = ?auto_50372 ?auto_50377 ) ) ( not ( = ?auto_50365 ?auto_50377 ) ) ( not ( = ?auto_50380 ?auto_50377 ) ) ( not ( = ?auto_50367 ?auto_50377 ) ) ( not ( = ?auto_50366 ?auto_50377 ) ) ( not ( = ?auto_50371 ?auto_50377 ) ) ( not ( = ?auto_50376 ?auto_50377 ) ) ( not ( = ?auto_50397 ?auto_50377 ) ) ( not ( = ?auto_50392 ?auto_50377 ) ) ( not ( = ?auto_50373 ?auto_50377 ) ) ( not ( = ?auto_50378 ?auto_50377 ) ) ( not ( = ?auto_50382 ?auto_50377 ) ) ( not ( = ?auto_50388 ?auto_50377 ) ) ( SURFACE-AT ?auto_50391 ?auto_50387 ) ( CLEAR ?auto_50391 ) ( IS-CRATE ?auto_50388 ) ( not ( = ?auto_50362 ?auto_50391 ) ) ( not ( = ?auto_50363 ?auto_50391 ) ) ( not ( = ?auto_50381 ?auto_50391 ) ) ( not ( = ?auto_50372 ?auto_50391 ) ) ( not ( = ?auto_50365 ?auto_50391 ) ) ( not ( = ?auto_50380 ?auto_50391 ) ) ( not ( = ?auto_50367 ?auto_50391 ) ) ( not ( = ?auto_50366 ?auto_50391 ) ) ( not ( = ?auto_50371 ?auto_50391 ) ) ( not ( = ?auto_50376 ?auto_50391 ) ) ( not ( = ?auto_50397 ?auto_50391 ) ) ( not ( = ?auto_50392 ?auto_50391 ) ) ( not ( = ?auto_50373 ?auto_50391 ) ) ( not ( = ?auto_50378 ?auto_50391 ) ) ( not ( = ?auto_50382 ?auto_50391 ) ) ( not ( = ?auto_50388 ?auto_50391 ) ) ( not ( = ?auto_50377 ?auto_50391 ) ) ( AVAILABLE ?auto_50385 ) ( AVAILABLE ?auto_50389 ) ( SURFACE-AT ?auto_50388 ?auto_50393 ) ( ON ?auto_50388 ?auto_50395 ) ( CLEAR ?auto_50388 ) ( not ( = ?auto_50362 ?auto_50395 ) ) ( not ( = ?auto_50363 ?auto_50395 ) ) ( not ( = ?auto_50381 ?auto_50395 ) ) ( not ( = ?auto_50372 ?auto_50395 ) ) ( not ( = ?auto_50365 ?auto_50395 ) ) ( not ( = ?auto_50380 ?auto_50395 ) ) ( not ( = ?auto_50367 ?auto_50395 ) ) ( not ( = ?auto_50366 ?auto_50395 ) ) ( not ( = ?auto_50371 ?auto_50395 ) ) ( not ( = ?auto_50376 ?auto_50395 ) ) ( not ( = ?auto_50397 ?auto_50395 ) ) ( not ( = ?auto_50392 ?auto_50395 ) ) ( not ( = ?auto_50373 ?auto_50395 ) ) ( not ( = ?auto_50378 ?auto_50395 ) ) ( not ( = ?auto_50382 ?auto_50395 ) ) ( not ( = ?auto_50388 ?auto_50395 ) ) ( not ( = ?auto_50377 ?auto_50395 ) ) ( not ( = ?auto_50391 ?auto_50395 ) ) ( TRUCK-AT ?auto_50386 ?auto_50387 ) )
    :subtasks
    ( ( !DRIVE ?auto_50386 ?auto_50387 ?auto_50393 )
      ( MAKE-ON ?auto_50362 ?auto_50363 )
      ( MAKE-ON-VERIFY ?auto_50362 ?auto_50363 ) )
  )

)

