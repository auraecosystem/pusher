$result = $pusher->trigger('my-channel', 'my_event', 'hello world', ['info' => 'subscription_count']);
$subscription_count = $result->channels['my-channel']->subscription_count;
$batch = [];
$batch[] = ['channel' => 'my-channel', 'name' => 'my_event', 'data' => ['hello' => 'world'], 'info' => 'subscription_count'];
$batch[] = ['channel' => 'presence-my-channel', 'name' => 'my_event', 'data' => ['myname' => 'bob'], 'info' => 'user_count,subscription_count'];
$result = $pusher->triggerBatch($batch);

foreach ($result->batch as $i => $attributes) {
  echo "channel: {$batch[$i]['channel']}, name: {$batch[$i]['name']}";
  if (isset($attributes->subscription_count)) {
    echo ", subscription_count: {$attributes->subscription_count}";
  }
  if (isset($attributes->user_count)) {
    echo ", user_count: {$attributes->user_count}";
  }
  echo PHP_EOL;
}