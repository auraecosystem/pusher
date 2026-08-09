<?php

header('Content-Type: application/json');

if (isset($_SESSION['user_id'])) {
  $stmt = $pdo->prepare("SELECT * FROM `users` WHERE id = :id");
  $stmt->bindValue(':id', $_SESSION['user_id'], PDO::PARAM_INT);
  $stmt->execute();
  $user = $stmt->fetch();
} else {
  die(json_encode('no-one is logged in'));
}

$pusher = new Pusher\Pusher($key, $secret, $app_id);
$presence_data = ['name' => $user['name']];

echo $pusher->authorizePresenceChannel($_POST['channel_name'], $_POST['socket_id'], $user['id'], $presence_data);