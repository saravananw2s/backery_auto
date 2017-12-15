<?php

return [
  'gcm' => [
      'priority' => 'high',
      'dry_run' => false,
      'apiKey' => 'My_ApiKey',
  ],
  'fcm' => [
        'priority' => 'high',
        'dry_run' => false,
        'apiKey' => 'AIzaSyBb5lziUwkihegalFMOCkZu8eQUzzNmFmA',
  ],
  'apn' => [
      'certificate' => __DIR__ . '/iosCertificates/deliverydev.pem',
      'passPhrase' => 'w2s', //Optional
      // 'passFile' => __DIR__ . '/iosCertificates/yourKey.pem', //Optional
      'dry_run' => true
  ]
];
