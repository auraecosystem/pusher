<?php
$subscription_counts = [];
foreach ($pusher->getChannels()->channels as $channel => $v) {
  $subscription_counts[$channel] =
    $pusher->getChannelInfo(
      $channel, ['info' => 'subscription_count']
    )->subscription_count;
}
var_dump($subscription_counts);