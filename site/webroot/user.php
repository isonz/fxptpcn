<?php
//用户信息
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$user = Users::getData($userid);
$address = ReceiverAddress::getInfo($user['receiver_address_id']);
$provinces = Countys::getCountys();

$city = Countys::getName($address['receiver_city']);
$county = Countys::getName($address['receiver_county']);

//var_dump($address);
//var_dump($provinces);
Templates::Assign('provinces', $provinces);
Templates::Assign('city', $city);
Templates::Assign('county', $county);
Templates::Assign('address', $address);
Templates::Assign('user', $user);
Templates::Display('user.html');

