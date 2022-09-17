( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1224 - OBJ
      ?auto_1223 - LOCATION
    )
    :vars
    (
      ?auto_1225 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1225 ?auto_1223 ) ( IN-TRUCK ?auto_1224 ?auto_1225 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1224 ?auto_1225 ?auto_1223 )
      ( DELIVER-1PKG-VERIFY ?auto_1224 ?auto_1223 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1236 - OBJ
      ?auto_1235 - LOCATION
    )
    :vars
    (
      ?auto_1237 - TRUCK
      ?auto_1238 - LOCATION
      ?auto_1239 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1236 ?auto_1237 ) ( TRUCK-AT ?auto_1237 ?auto_1238 ) ( IN-CITY ?auto_1238 ?auto_1239 ) ( IN-CITY ?auto_1235 ?auto_1239 ) ( not ( = ?auto_1235 ?auto_1238 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1237 ?auto_1238 ?auto_1235 ?auto_1239 )
      ( DELIVER-1PKG ?auto_1236 ?auto_1235 )
      ( DELIVER-1PKG-VERIFY ?auto_1236 ?auto_1235 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1254 - OBJ
      ?auto_1253 - LOCATION
    )
    :vars
    (
      ?auto_1257 - TRUCK
      ?auto_1255 - LOCATION
      ?auto_1256 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1257 ?auto_1255 ) ( IN-CITY ?auto_1255 ?auto_1256 ) ( IN-CITY ?auto_1253 ?auto_1256 ) ( not ( = ?auto_1253 ?auto_1255 ) ) ( OBJ-AT ?auto_1254 ?auto_1255 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1254 ?auto_1257 ?auto_1255 )
      ( DELIVER-1PKG ?auto_1254 ?auto_1253 )
      ( DELIVER-1PKG-VERIFY ?auto_1254 ?auto_1253 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1272 - OBJ
      ?auto_1271 - LOCATION
    )
    :vars
    (
      ?auto_1275 - LOCATION
      ?auto_1274 - CITY
      ?auto_1273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1275 ?auto_1274 ) ( IN-CITY ?auto_1271 ?auto_1274 ) ( not ( = ?auto_1271 ?auto_1275 ) ) ( OBJ-AT ?auto_1272 ?auto_1275 ) ( TRUCK-AT ?auto_1273 ?auto_1271 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1273 ?auto_1271 ?auto_1275 ?auto_1274 )
      ( DELIVER-1PKG ?auto_1272 ?auto_1271 )
      ( DELIVER-1PKG-VERIFY ?auto_1272 ?auto_1271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1332 - OBJ
      ?auto_1333 - OBJ
      ?auto_1331 - LOCATION
    )
    :vars
    (
      ?auto_1334 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1333 ?auto_1332 ) ) ( TRUCK-AT ?auto_1334 ?auto_1331 ) ( IN-TRUCK ?auto_1333 ?auto_1334 ) ( OBJ-AT ?auto_1332 ?auto_1331 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1333 ?auto_1331 )
      ( DELIVER-2PKG-VERIFY ?auto_1332 ?auto_1333 ?auto_1331 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1336 - OBJ
      ?auto_1337 - OBJ
      ?auto_1335 - LOCATION
    )
    :vars
    (
      ?auto_1338 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1337 ?auto_1336 ) ) ( TRUCK-AT ?auto_1338 ?auto_1335 ) ( IN-TRUCK ?auto_1336 ?auto_1338 ) ( OBJ-AT ?auto_1337 ?auto_1335 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1336 ?auto_1335 )
      ( DELIVER-2PKG-VERIFY ?auto_1336 ?auto_1337 ?auto_1335 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1384 - OBJ
      ?auto_1385 - OBJ
      ?auto_1383 - LOCATION
    )
    :vars
    (
      ?auto_1387 - TRUCK
      ?auto_1388 - LOCATION
      ?auto_1386 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1385 ?auto_1384 ) ) ( IN-TRUCK ?auto_1385 ?auto_1387 ) ( TRUCK-AT ?auto_1387 ?auto_1388 ) ( IN-CITY ?auto_1388 ?auto_1386 ) ( IN-CITY ?auto_1383 ?auto_1386 ) ( not ( = ?auto_1383 ?auto_1388 ) ) ( OBJ-AT ?auto_1384 ?auto_1383 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1385 ?auto_1383 )
      ( DELIVER-2PKG-VERIFY ?auto_1384 ?auto_1385 ?auto_1383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1390 - OBJ
      ?auto_1391 - OBJ
      ?auto_1389 - LOCATION
    )
    :vars
    (
      ?auto_1394 - TRUCK
      ?auto_1393 - LOCATION
      ?auto_1392 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1391 ?auto_1390 ) ) ( IN-TRUCK ?auto_1390 ?auto_1394 ) ( TRUCK-AT ?auto_1394 ?auto_1393 ) ( IN-CITY ?auto_1393 ?auto_1392 ) ( IN-CITY ?auto_1389 ?auto_1392 ) ( not ( = ?auto_1389 ?auto_1393 ) ) ( OBJ-AT ?auto_1391 ?auto_1389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1391 ?auto_1390 ?auto_1389 )
      ( DELIVER-2PKG-VERIFY ?auto_1390 ?auto_1391 ?auto_1389 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1453 - OBJ
      ?auto_1452 - LOCATION
    )
    :vars
    (
      ?auto_1454 - OBJ
      ?auto_1457 - TRUCK
      ?auto_1456 - LOCATION
      ?auto_1455 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1453 ?auto_1454 ) ) ( TRUCK-AT ?auto_1457 ?auto_1456 ) ( IN-CITY ?auto_1456 ?auto_1455 ) ( IN-CITY ?auto_1452 ?auto_1455 ) ( not ( = ?auto_1452 ?auto_1456 ) ) ( OBJ-AT ?auto_1454 ?auto_1452 ) ( OBJ-AT ?auto_1453 ?auto_1456 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1453 ?auto_1457 ?auto_1456 )
      ( DELIVER-2PKG ?auto_1454 ?auto_1453 ?auto_1452 )
      ( DELIVER-1PKG-VERIFY ?auto_1453 ?auto_1452 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1459 - OBJ
      ?auto_1460 - OBJ
      ?auto_1458 - LOCATION
    )
    :vars
    (
      ?auto_1463 - TRUCK
      ?auto_1461 - LOCATION
      ?auto_1462 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1460 ?auto_1459 ) ) ( TRUCK-AT ?auto_1463 ?auto_1461 ) ( IN-CITY ?auto_1461 ?auto_1462 ) ( IN-CITY ?auto_1458 ?auto_1462 ) ( not ( = ?auto_1458 ?auto_1461 ) ) ( OBJ-AT ?auto_1459 ?auto_1458 ) ( OBJ-AT ?auto_1460 ?auto_1461 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1460 ?auto_1458 )
      ( DELIVER-2PKG-VERIFY ?auto_1459 ?auto_1460 ?auto_1458 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1465 - OBJ
      ?auto_1466 - OBJ
      ?auto_1464 - LOCATION
    )
    :vars
    (
      ?auto_1467 - TRUCK
      ?auto_1468 - LOCATION
      ?auto_1469 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_1466 ?auto_1465 ) ) ( TRUCK-AT ?auto_1467 ?auto_1468 ) ( IN-CITY ?auto_1468 ?auto_1469 ) ( IN-CITY ?auto_1464 ?auto_1469 ) ( not ( = ?auto_1464 ?auto_1468 ) ) ( OBJ-AT ?auto_1466 ?auto_1464 ) ( OBJ-AT ?auto_1465 ?auto_1468 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1466 ?auto_1465 ?auto_1464 )
      ( DELIVER-2PKG-VERIFY ?auto_1465 ?auto_1466 ?auto_1464 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1528 - OBJ
      ?auto_1527 - LOCATION
    )
    :vars
    (
      ?auto_1532 - OBJ
      ?auto_1530 - LOCATION
      ?auto_1531 - CITY
      ?auto_1529 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1528 ?auto_1532 ) ) ( IN-CITY ?auto_1530 ?auto_1531 ) ( IN-CITY ?auto_1527 ?auto_1531 ) ( not ( = ?auto_1527 ?auto_1530 ) ) ( OBJ-AT ?auto_1532 ?auto_1527 ) ( OBJ-AT ?auto_1528 ?auto_1530 ) ( TRUCK-AT ?auto_1529 ?auto_1527 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1529 ?auto_1527 ?auto_1530 ?auto_1531 )
      ( DELIVER-2PKG ?auto_1532 ?auto_1528 ?auto_1527 )
      ( DELIVER-1PKG-VERIFY ?auto_1528 ?auto_1527 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1534 - OBJ
      ?auto_1535 - OBJ
      ?auto_1533 - LOCATION
    )
    :vars
    (
      ?auto_1537 - LOCATION
      ?auto_1538 - CITY
      ?auto_1536 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1535 ?auto_1534 ) ) ( IN-CITY ?auto_1537 ?auto_1538 ) ( IN-CITY ?auto_1533 ?auto_1538 ) ( not ( = ?auto_1533 ?auto_1537 ) ) ( OBJ-AT ?auto_1534 ?auto_1533 ) ( OBJ-AT ?auto_1535 ?auto_1537 ) ( TRUCK-AT ?auto_1536 ?auto_1533 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1535 ?auto_1533 )
      ( DELIVER-2PKG-VERIFY ?auto_1534 ?auto_1535 ?auto_1533 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1540 - OBJ
      ?auto_1541 - OBJ
      ?auto_1539 - LOCATION
    )
    :vars
    (
      ?auto_1544 - LOCATION
      ?auto_1543 - CITY
      ?auto_1542 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1541 ?auto_1540 ) ) ( IN-CITY ?auto_1544 ?auto_1543 ) ( IN-CITY ?auto_1539 ?auto_1543 ) ( not ( = ?auto_1539 ?auto_1544 ) ) ( OBJ-AT ?auto_1541 ?auto_1539 ) ( OBJ-AT ?auto_1540 ?auto_1544 ) ( TRUCK-AT ?auto_1542 ?auto_1539 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1541 ?auto_1540 ?auto_1539 )
      ( DELIVER-2PKG-VERIFY ?auto_1540 ?auto_1541 ?auto_1539 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1603 - OBJ
      ?auto_1602 - LOCATION
    )
    :vars
    (
      ?auto_1607 - OBJ
      ?auto_1606 - LOCATION
      ?auto_1605 - CITY
      ?auto_1604 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1603 ?auto_1607 ) ) ( IN-CITY ?auto_1606 ?auto_1605 ) ( IN-CITY ?auto_1602 ?auto_1605 ) ( not ( = ?auto_1602 ?auto_1606 ) ) ( OBJ-AT ?auto_1603 ?auto_1606 ) ( TRUCK-AT ?auto_1604 ?auto_1602 ) ( IN-TRUCK ?auto_1607 ?auto_1604 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1607 ?auto_1602 )
      ( DELIVER-2PKG ?auto_1607 ?auto_1603 ?auto_1602 )
      ( DELIVER-1PKG-VERIFY ?auto_1603 ?auto_1602 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1609 - OBJ
      ?auto_1610 - OBJ
      ?auto_1608 - LOCATION
    )
    :vars
    (
      ?auto_1613 - LOCATION
      ?auto_1612 - CITY
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1610 ?auto_1609 ) ) ( IN-CITY ?auto_1613 ?auto_1612 ) ( IN-CITY ?auto_1608 ?auto_1612 ) ( not ( = ?auto_1608 ?auto_1613 ) ) ( OBJ-AT ?auto_1610 ?auto_1613 ) ( TRUCK-AT ?auto_1611 ?auto_1608 ) ( IN-TRUCK ?auto_1609 ?auto_1611 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1610 ?auto_1608 )
      ( DELIVER-2PKG-VERIFY ?auto_1609 ?auto_1610 ?auto_1608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1615 - OBJ
      ?auto_1616 - OBJ
      ?auto_1614 - LOCATION
    )
    :vars
    (
      ?auto_1619 - LOCATION
      ?auto_1618 - CITY
      ?auto_1617 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_1616 ?auto_1615 ) ) ( IN-CITY ?auto_1619 ?auto_1618 ) ( IN-CITY ?auto_1614 ?auto_1618 ) ( not ( = ?auto_1614 ?auto_1619 ) ) ( OBJ-AT ?auto_1615 ?auto_1619 ) ( TRUCK-AT ?auto_1617 ?auto_1614 ) ( IN-TRUCK ?auto_1616 ?auto_1617 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1616 ?auto_1615 ?auto_1614 )
      ( DELIVER-2PKG-VERIFY ?auto_1615 ?auto_1616 ?auto_1614 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1678 - OBJ
      ?auto_1677 - LOCATION
    )
    :vars
    (
      ?auto_1680 - OBJ
      ?auto_1682 - LOCATION
      ?auto_1681 - CITY
      ?auto_1679 - TRUCK
      ?auto_1683 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1678 ?auto_1680 ) ) ( IN-CITY ?auto_1682 ?auto_1681 ) ( IN-CITY ?auto_1677 ?auto_1681 ) ( not ( = ?auto_1677 ?auto_1682 ) ) ( OBJ-AT ?auto_1678 ?auto_1682 ) ( IN-TRUCK ?auto_1680 ?auto_1679 ) ( TRUCK-AT ?auto_1679 ?auto_1683 ) ( IN-CITY ?auto_1683 ?auto_1681 ) ( not ( = ?auto_1677 ?auto_1683 ) ) ( not ( = ?auto_1682 ?auto_1683 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1679 ?auto_1683 ?auto_1677 ?auto_1681 )
      ( DELIVER-2PKG ?auto_1680 ?auto_1678 ?auto_1677 )
      ( DELIVER-1PKG-VERIFY ?auto_1678 ?auto_1677 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1685 - OBJ
      ?auto_1686 - OBJ
      ?auto_1684 - LOCATION
    )
    :vars
    (
      ?auto_1690 - LOCATION
      ?auto_1688 - CITY
      ?auto_1687 - TRUCK
      ?auto_1689 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1686 ?auto_1685 ) ) ( IN-CITY ?auto_1690 ?auto_1688 ) ( IN-CITY ?auto_1684 ?auto_1688 ) ( not ( = ?auto_1684 ?auto_1690 ) ) ( OBJ-AT ?auto_1686 ?auto_1690 ) ( IN-TRUCK ?auto_1685 ?auto_1687 ) ( TRUCK-AT ?auto_1687 ?auto_1689 ) ( IN-CITY ?auto_1689 ?auto_1688 ) ( not ( = ?auto_1684 ?auto_1689 ) ) ( not ( = ?auto_1690 ?auto_1689 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1686 ?auto_1684 )
      ( DELIVER-2PKG-VERIFY ?auto_1685 ?auto_1686 ?auto_1684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1692 - OBJ
      ?auto_1693 - OBJ
      ?auto_1691 - LOCATION
    )
    :vars
    (
      ?auto_1694 - LOCATION
      ?auto_1697 - CITY
      ?auto_1696 - TRUCK
      ?auto_1695 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1693 ?auto_1692 ) ) ( IN-CITY ?auto_1694 ?auto_1697 ) ( IN-CITY ?auto_1691 ?auto_1697 ) ( not ( = ?auto_1691 ?auto_1694 ) ) ( OBJ-AT ?auto_1692 ?auto_1694 ) ( IN-TRUCK ?auto_1693 ?auto_1696 ) ( TRUCK-AT ?auto_1696 ?auto_1695 ) ( IN-CITY ?auto_1695 ?auto_1697 ) ( not ( = ?auto_1691 ?auto_1695 ) ) ( not ( = ?auto_1694 ?auto_1695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1693 ?auto_1692 ?auto_1691 )
      ( DELIVER-2PKG-VERIFY ?auto_1692 ?auto_1693 ?auto_1691 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1764 - OBJ
      ?auto_1763 - LOCATION
    )
    :vars
    (
      ?auto_1769 - OBJ
      ?auto_1765 - LOCATION
      ?auto_1768 - CITY
      ?auto_1767 - TRUCK
      ?auto_1766 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1764 ?auto_1769 ) ) ( IN-CITY ?auto_1765 ?auto_1768 ) ( IN-CITY ?auto_1763 ?auto_1768 ) ( not ( = ?auto_1763 ?auto_1765 ) ) ( OBJ-AT ?auto_1764 ?auto_1765 ) ( TRUCK-AT ?auto_1767 ?auto_1766 ) ( IN-CITY ?auto_1766 ?auto_1768 ) ( not ( = ?auto_1763 ?auto_1766 ) ) ( not ( = ?auto_1765 ?auto_1766 ) ) ( OBJ-AT ?auto_1769 ?auto_1766 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1769 ?auto_1767 ?auto_1766 )
      ( DELIVER-2PKG ?auto_1769 ?auto_1764 ?auto_1763 )
      ( DELIVER-1PKG-VERIFY ?auto_1764 ?auto_1763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1771 - OBJ
      ?auto_1772 - OBJ
      ?auto_1770 - LOCATION
    )
    :vars
    (
      ?auto_1776 - LOCATION
      ?auto_1775 - CITY
      ?auto_1773 - TRUCK
      ?auto_1774 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1772 ?auto_1771 ) ) ( IN-CITY ?auto_1776 ?auto_1775 ) ( IN-CITY ?auto_1770 ?auto_1775 ) ( not ( = ?auto_1770 ?auto_1776 ) ) ( OBJ-AT ?auto_1772 ?auto_1776 ) ( TRUCK-AT ?auto_1773 ?auto_1774 ) ( IN-CITY ?auto_1774 ?auto_1775 ) ( not ( = ?auto_1770 ?auto_1774 ) ) ( not ( = ?auto_1776 ?auto_1774 ) ) ( OBJ-AT ?auto_1771 ?auto_1774 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1772 ?auto_1770 )
      ( DELIVER-2PKG-VERIFY ?auto_1771 ?auto_1772 ?auto_1770 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1778 - OBJ
      ?auto_1779 - OBJ
      ?auto_1777 - LOCATION
    )
    :vars
    (
      ?auto_1782 - LOCATION
      ?auto_1781 - CITY
      ?auto_1780 - TRUCK
      ?auto_1783 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_1779 ?auto_1778 ) ) ( IN-CITY ?auto_1782 ?auto_1781 ) ( IN-CITY ?auto_1777 ?auto_1781 ) ( not ( = ?auto_1777 ?auto_1782 ) ) ( OBJ-AT ?auto_1778 ?auto_1782 ) ( TRUCK-AT ?auto_1780 ?auto_1783 ) ( IN-CITY ?auto_1783 ?auto_1781 ) ( not ( = ?auto_1777 ?auto_1783 ) ) ( not ( = ?auto_1782 ?auto_1783 ) ) ( OBJ-AT ?auto_1779 ?auto_1783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1779 ?auto_1778 ?auto_1777 )
      ( DELIVER-2PKG-VERIFY ?auto_1778 ?auto_1779 ?auto_1777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2038 - OBJ
      ?auto_2039 - OBJ
      ?auto_2040 - OBJ
      ?auto_2037 - LOCATION
    )
    :vars
    (
      ?auto_2041 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2039 ?auto_2038 ) ) ( not ( = ?auto_2040 ?auto_2038 ) ) ( not ( = ?auto_2040 ?auto_2039 ) ) ( TRUCK-AT ?auto_2041 ?auto_2037 ) ( IN-TRUCK ?auto_2040 ?auto_2041 ) ( OBJ-AT ?auto_2038 ?auto_2037 ) ( OBJ-AT ?auto_2039 ?auto_2037 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2040 ?auto_2037 )
      ( DELIVER-3PKG-VERIFY ?auto_2038 ?auto_2039 ?auto_2040 ?auto_2037 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2048 - OBJ
      ?auto_2049 - OBJ
      ?auto_2050 - OBJ
      ?auto_2047 - LOCATION
    )
    :vars
    (
      ?auto_2051 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2049 ?auto_2048 ) ) ( not ( = ?auto_2050 ?auto_2048 ) ) ( not ( = ?auto_2050 ?auto_2049 ) ) ( TRUCK-AT ?auto_2051 ?auto_2047 ) ( IN-TRUCK ?auto_2049 ?auto_2051 ) ( OBJ-AT ?auto_2048 ?auto_2047 ) ( OBJ-AT ?auto_2050 ?auto_2047 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2049 ?auto_2047 )
      ( DELIVER-3PKG-VERIFY ?auto_2048 ?auto_2049 ?auto_2050 ?auto_2047 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2086 - OBJ
      ?auto_2087 - OBJ
      ?auto_2088 - OBJ
      ?auto_2085 - LOCATION
    )
    :vars
    (
      ?auto_2089 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2087 ?auto_2086 ) ) ( not ( = ?auto_2088 ?auto_2086 ) ) ( not ( = ?auto_2088 ?auto_2087 ) ) ( TRUCK-AT ?auto_2089 ?auto_2085 ) ( IN-TRUCK ?auto_2086 ?auto_2089 ) ( OBJ-AT ?auto_2087 ?auto_2085 ) ( OBJ-AT ?auto_2088 ?auto_2085 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2086 ?auto_2085 )
      ( DELIVER-3PKG-VERIFY ?auto_2086 ?auto_2087 ?auto_2088 ?auto_2085 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2162 - OBJ
      ?auto_2163 - OBJ
      ?auto_2164 - OBJ
      ?auto_2161 - LOCATION
    )
    :vars
    (
      ?auto_2166 - TRUCK
      ?auto_2165 - LOCATION
      ?auto_2167 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2163 ?auto_2162 ) ) ( not ( = ?auto_2164 ?auto_2162 ) ) ( not ( = ?auto_2164 ?auto_2163 ) ) ( IN-TRUCK ?auto_2164 ?auto_2166 ) ( TRUCK-AT ?auto_2166 ?auto_2165 ) ( IN-CITY ?auto_2165 ?auto_2167 ) ( IN-CITY ?auto_2161 ?auto_2167 ) ( not ( = ?auto_2161 ?auto_2165 ) ) ( OBJ-AT ?auto_2162 ?auto_2161 ) ( OBJ-AT ?auto_2163 ?auto_2161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2162 ?auto_2164 ?auto_2161 )
      ( DELIVER-3PKG-VERIFY ?auto_2162 ?auto_2163 ?auto_2164 ?auto_2161 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2176 - OBJ
      ?auto_2177 - OBJ
      ?auto_2178 - OBJ
      ?auto_2175 - LOCATION
    )
    :vars
    (
      ?auto_2180 - TRUCK
      ?auto_2179 - LOCATION
      ?auto_2181 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2177 ?auto_2176 ) ) ( not ( = ?auto_2178 ?auto_2176 ) ) ( not ( = ?auto_2178 ?auto_2177 ) ) ( IN-TRUCK ?auto_2177 ?auto_2180 ) ( TRUCK-AT ?auto_2180 ?auto_2179 ) ( IN-CITY ?auto_2179 ?auto_2181 ) ( IN-CITY ?auto_2175 ?auto_2181 ) ( not ( = ?auto_2175 ?auto_2179 ) ) ( OBJ-AT ?auto_2176 ?auto_2175 ) ( OBJ-AT ?auto_2178 ?auto_2175 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2176 ?auto_2177 ?auto_2175 )
      ( DELIVER-3PKG-VERIFY ?auto_2176 ?auto_2177 ?auto_2178 ?auto_2175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2229 - OBJ
      ?auto_2230 - OBJ
      ?auto_2231 - OBJ
      ?auto_2228 - LOCATION
    )
    :vars
    (
      ?auto_2233 - TRUCK
      ?auto_2232 - LOCATION
      ?auto_2234 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2230 ?auto_2229 ) ) ( not ( = ?auto_2231 ?auto_2229 ) ) ( not ( = ?auto_2231 ?auto_2230 ) ) ( IN-TRUCK ?auto_2229 ?auto_2233 ) ( TRUCK-AT ?auto_2233 ?auto_2232 ) ( IN-CITY ?auto_2232 ?auto_2234 ) ( IN-CITY ?auto_2228 ?auto_2234 ) ( not ( = ?auto_2228 ?auto_2232 ) ) ( OBJ-AT ?auto_2230 ?auto_2228 ) ( OBJ-AT ?auto_2231 ?auto_2228 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2230 ?auto_2229 ?auto_2228 )
      ( DELIVER-3PKG-VERIFY ?auto_2229 ?auto_2230 ?auto_2231 ?auto_2228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2324 - OBJ
      ?auto_2325 - OBJ
      ?auto_2326 - OBJ
      ?auto_2323 - LOCATION
    )
    :vars
    (
      ?auto_2329 - TRUCK
      ?auto_2328 - LOCATION
      ?auto_2327 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2325 ?auto_2324 ) ) ( not ( = ?auto_2326 ?auto_2324 ) ) ( not ( = ?auto_2326 ?auto_2325 ) ) ( TRUCK-AT ?auto_2329 ?auto_2328 ) ( IN-CITY ?auto_2328 ?auto_2327 ) ( IN-CITY ?auto_2323 ?auto_2327 ) ( not ( = ?auto_2323 ?auto_2328 ) ) ( OBJ-AT ?auto_2324 ?auto_2323 ) ( OBJ-AT ?auto_2326 ?auto_2328 ) ( OBJ-AT ?auto_2325 ?auto_2323 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2324 ?auto_2326 ?auto_2323 )
      ( DELIVER-3PKG-VERIFY ?auto_2324 ?auto_2325 ?auto_2326 ?auto_2323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2338 - OBJ
      ?auto_2339 - OBJ
      ?auto_2340 - OBJ
      ?auto_2337 - LOCATION
    )
    :vars
    (
      ?auto_2343 - TRUCK
      ?auto_2342 - LOCATION
      ?auto_2341 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2339 ?auto_2338 ) ) ( not ( = ?auto_2340 ?auto_2338 ) ) ( not ( = ?auto_2340 ?auto_2339 ) ) ( TRUCK-AT ?auto_2343 ?auto_2342 ) ( IN-CITY ?auto_2342 ?auto_2341 ) ( IN-CITY ?auto_2337 ?auto_2341 ) ( not ( = ?auto_2337 ?auto_2342 ) ) ( OBJ-AT ?auto_2338 ?auto_2337 ) ( OBJ-AT ?auto_2339 ?auto_2342 ) ( OBJ-AT ?auto_2340 ?auto_2337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2338 ?auto_2339 ?auto_2337 )
      ( DELIVER-3PKG-VERIFY ?auto_2338 ?auto_2339 ?auto_2340 ?auto_2337 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2391 - OBJ
      ?auto_2392 - OBJ
      ?auto_2393 - OBJ
      ?auto_2390 - LOCATION
    )
    :vars
    (
      ?auto_2396 - TRUCK
      ?auto_2395 - LOCATION
      ?auto_2394 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2392 ?auto_2391 ) ) ( not ( = ?auto_2393 ?auto_2391 ) ) ( not ( = ?auto_2393 ?auto_2392 ) ) ( TRUCK-AT ?auto_2396 ?auto_2395 ) ( IN-CITY ?auto_2395 ?auto_2394 ) ( IN-CITY ?auto_2390 ?auto_2394 ) ( not ( = ?auto_2390 ?auto_2395 ) ) ( OBJ-AT ?auto_2392 ?auto_2390 ) ( OBJ-AT ?auto_2391 ?auto_2395 ) ( OBJ-AT ?auto_2393 ?auto_2390 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2392 ?auto_2391 ?auto_2390 )
      ( DELIVER-3PKG-VERIFY ?auto_2391 ?auto_2392 ?auto_2393 ?auto_2390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2486 - OBJ
      ?auto_2487 - OBJ
      ?auto_2488 - OBJ
      ?auto_2485 - LOCATION
    )
    :vars
    (
      ?auto_2491 - LOCATION
      ?auto_2489 - CITY
      ?auto_2490 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2487 ?auto_2486 ) ) ( not ( = ?auto_2488 ?auto_2486 ) ) ( not ( = ?auto_2488 ?auto_2487 ) ) ( IN-CITY ?auto_2491 ?auto_2489 ) ( IN-CITY ?auto_2485 ?auto_2489 ) ( not ( = ?auto_2485 ?auto_2491 ) ) ( OBJ-AT ?auto_2486 ?auto_2485 ) ( OBJ-AT ?auto_2488 ?auto_2491 ) ( TRUCK-AT ?auto_2490 ?auto_2485 ) ( OBJ-AT ?auto_2487 ?auto_2485 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2486 ?auto_2488 ?auto_2485 )
      ( DELIVER-3PKG-VERIFY ?auto_2486 ?auto_2487 ?auto_2488 ?auto_2485 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2500 - OBJ
      ?auto_2501 - OBJ
      ?auto_2502 - OBJ
      ?auto_2499 - LOCATION
    )
    :vars
    (
      ?auto_2505 - LOCATION
      ?auto_2503 - CITY
      ?auto_2504 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2501 ?auto_2500 ) ) ( not ( = ?auto_2502 ?auto_2500 ) ) ( not ( = ?auto_2502 ?auto_2501 ) ) ( IN-CITY ?auto_2505 ?auto_2503 ) ( IN-CITY ?auto_2499 ?auto_2503 ) ( not ( = ?auto_2499 ?auto_2505 ) ) ( OBJ-AT ?auto_2500 ?auto_2499 ) ( OBJ-AT ?auto_2501 ?auto_2505 ) ( TRUCK-AT ?auto_2504 ?auto_2499 ) ( OBJ-AT ?auto_2502 ?auto_2499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2500 ?auto_2501 ?auto_2499 )
      ( DELIVER-3PKG-VERIFY ?auto_2500 ?auto_2501 ?auto_2502 ?auto_2499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2553 - OBJ
      ?auto_2554 - OBJ
      ?auto_2555 - OBJ
      ?auto_2552 - LOCATION
    )
    :vars
    (
      ?auto_2558 - LOCATION
      ?auto_2556 - CITY
      ?auto_2557 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2554 ?auto_2553 ) ) ( not ( = ?auto_2555 ?auto_2553 ) ) ( not ( = ?auto_2555 ?auto_2554 ) ) ( IN-CITY ?auto_2558 ?auto_2556 ) ( IN-CITY ?auto_2552 ?auto_2556 ) ( not ( = ?auto_2552 ?auto_2558 ) ) ( OBJ-AT ?auto_2554 ?auto_2552 ) ( OBJ-AT ?auto_2553 ?auto_2558 ) ( TRUCK-AT ?auto_2557 ?auto_2552 ) ( OBJ-AT ?auto_2555 ?auto_2552 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2554 ?auto_2553 ?auto_2552 )
      ( DELIVER-3PKG-VERIFY ?auto_2553 ?auto_2554 ?auto_2555 ?auto_2552 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2779 - OBJ
      ?auto_2778 - LOCATION
    )
    :vars
    (
      ?auto_2782 - OBJ
      ?auto_2781 - LOCATION
      ?auto_2780 - CITY
      ?auto_2783 - TRUCK
      ?auto_2784 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2779 ?auto_2782 ) ) ( IN-CITY ?auto_2781 ?auto_2780 ) ( IN-CITY ?auto_2778 ?auto_2780 ) ( not ( = ?auto_2778 ?auto_2781 ) ) ( OBJ-AT ?auto_2782 ?auto_2778 ) ( OBJ-AT ?auto_2779 ?auto_2781 ) ( TRUCK-AT ?auto_2783 ?auto_2784 ) ( IN-CITY ?auto_2784 ?auto_2780 ) ( not ( = ?auto_2778 ?auto_2784 ) ) ( not ( = ?auto_2781 ?auto_2784 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2783 ?auto_2784 ?auto_2778 ?auto_2780 )
      ( DELIVER-2PKG ?auto_2782 ?auto_2779 ?auto_2778 )
      ( DELIVER-1PKG-VERIFY ?auto_2779 ?auto_2778 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2786 - OBJ
      ?auto_2787 - OBJ
      ?auto_2785 - LOCATION
    )
    :vars
    (
      ?auto_2789 - LOCATION
      ?auto_2790 - CITY
      ?auto_2788 - TRUCK
      ?auto_2791 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2787 ?auto_2786 ) ) ( IN-CITY ?auto_2789 ?auto_2790 ) ( IN-CITY ?auto_2785 ?auto_2790 ) ( not ( = ?auto_2785 ?auto_2789 ) ) ( OBJ-AT ?auto_2786 ?auto_2785 ) ( OBJ-AT ?auto_2787 ?auto_2789 ) ( TRUCK-AT ?auto_2788 ?auto_2791 ) ( IN-CITY ?auto_2791 ?auto_2790 ) ( not ( = ?auto_2785 ?auto_2791 ) ) ( not ( = ?auto_2789 ?auto_2791 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2787 ?auto_2785 )
      ( DELIVER-2PKG-VERIFY ?auto_2786 ?auto_2787 ?auto_2785 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2801 - OBJ
      ?auto_2802 - OBJ
      ?auto_2800 - LOCATION
    )
    :vars
    (
      ?auto_2804 - LOCATION
      ?auto_2805 - CITY
      ?auto_2803 - TRUCK
      ?auto_2806 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2802 ?auto_2801 ) ) ( IN-CITY ?auto_2804 ?auto_2805 ) ( IN-CITY ?auto_2800 ?auto_2805 ) ( not ( = ?auto_2800 ?auto_2804 ) ) ( OBJ-AT ?auto_2802 ?auto_2800 ) ( OBJ-AT ?auto_2801 ?auto_2804 ) ( TRUCK-AT ?auto_2803 ?auto_2806 ) ( IN-CITY ?auto_2806 ?auto_2805 ) ( not ( = ?auto_2800 ?auto_2806 ) ) ( not ( = ?auto_2804 ?auto_2806 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2802 ?auto_2801 ?auto_2800 )
      ( DELIVER-2PKG-VERIFY ?auto_2801 ?auto_2802 ?auto_2800 ) )
  )

)

