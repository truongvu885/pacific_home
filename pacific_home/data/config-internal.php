<?php
return [
  'database' => [
    'host' => 'pacific-home-db',
    'port' => '',
    'charset' => NULL,
    'dbname' => 'espocrm',
    'user' => 'espocrm',
    'password' => '12345678',
    'platform' => 'Mysql'
  ],
  'smtpPassword' => NULL,
  'logger' => [
    'path' => 'data/logs/espo.log',
    'level' => 'WARNING',
    'rotation' => true,
    'maxFileNumber' => 30,
    'printTrace' => false,
    'databaseHandler' => false,
    'sql' => false,
    'sqlFailed' => false
  ],
  'restrictedMode' => false,
  'cleanupAppLog' => true,
  'cleanupAppLogPeriod' => '30 days',
  'webSocketMessager' => 'ZeroMQ',
  'clientSecurityHeadersDisabled' => false,
  'clientCspDisabled' => false,
  'clientCspScriptSourceList' => [
    0 => 'https://maps.googleapis.com'
  ],
  'adminUpgradeDisabled' => false,
  'isInstalled' => true,
  'microtimeInternal' => 1764829386.848458,
  'cryptKey' => '1b93322387c118901cde60c01c0afed2',
  'hashSecretKey' => '06737ddb2e754479daff80a1b8a19e1e',
  'defaultPermissions' => [
    'user' => 'www-data',
    'group' => 'www-data'
  ],
  'actualDatabaseType' => 'mysql',
  'actualDatabaseVersion' => '9.1.0',
  'instanceId' => 'b0a56487-df95-4eaf-94fe-368880811b3b',
  
  // Calio Configuration
    'calioEnabled' => true,
    'calioApiUrl' => 'https://api.calio.vn/v1',
    'calioApiKey' => 'your-calio-api-key-here',
    'calioWebhookSecret' => 'your-webhook-secret-here',
    
    // Calio Features
    'calioAutoCreateCall' => true,
    'calioRecordCalls' => true,
    'calioShowCallHistory' => true,
    
    // Calio UI Settings
    'calioShowDialPad' => true,
    'calioShowInListView' => true,
    'calioShowInDetailView' => true,
];
