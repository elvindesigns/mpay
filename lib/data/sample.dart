List discos = [
  {
    "name": "AEDC",
    "image": "assets/aedc.png",
    "billerid": "335112028255",
    "billername": "Abuja Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "763302866673",
      "postpaid": "254408503663",
    },
  },
  {
    "name": "BEDC",
    "image": "assets/bedc.png",
    "billerid": "902055998427",
    "billername": "Benin Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "986128860184",
      "postpaid": "538478029227",
    },
  },
  {
    "name": "EKEDC",
    "image": "assets/eedc.png",
    "billerid": "557953486318",
    "billername": "Eko Electricity Distribution Company Plc",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "364061411222",
      "postpaid": "355699946017",
    },
  },
  {
    "name": "EEDC",
    "image": "assets/enedc.png",
    "billerid": "721934675980",
    "billername": "Enugu Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "588015790356",
    },
  },
  {
    "name": "IBEDC",
    "image": "assets/ibedc.png",
    "billerid": "201106277941",
    "billername": "Ibadan Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "310241834408",
      "postpaid": "865736217643",
    },
  },
  {
    "name": "IKEJA ELECTRIC",
    "image": "assets/ie.png",
    "billerid": "394020774625",
    "billername": "Ikeja Electric",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "988115621573",
      "postpaid": "259887457197",
    },
  },
  {
    "name": "JEDC",
    "image": "assets/jedc.png",
    "billerid": "165350462144",
    "billername": "Jos Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "595054079394",
      "postpaid": "404158480208",
    },
  },
  {
    "name": "KADUNA ELECTRIC",
    "image": "assets/kedc.png",
    "billerid": "088821483055",
    "billername": "Kaduna Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "738734735337",
      "postpaid": "104887340912",
    },
  },
  {
    "name": "KEDCO",
    "image": "assets/kedco.png",
    "billerid": "695525246862",
    "billername": "Kano Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "965208611599",
      "postpaid": "455909368681",
    },
  },
  {
    "name": "PHCN",
    "image": "assets/phcn.png",
    "billerid": "212693256339",
    "billername": "PHCN Postpaid (ALL ZONES)",
    "customerfield1": "Meter Number",
    "type": {
      // "prepaid": "965208611599",
      "postpaid": "647429884207",
    },
  },
  {
    "name": "PHED",
    "image": "assets/phed.png",
    "billerid": "423225306405",
    "billername": "PHED Postpaid",
    "customerfield1": "Customer Account Number",
    "type": {
      "prepaid": "186535311055",
      "postpaid": "785147545023",
    },
  },
  {
    "name": "YEDC",
    "image": "assets/yedc.png",
    "billerid": "193025467645",
    "billername": "Yola Electricity Distribution Company",
    "customerfield1": "Meter Number",
    "type": {
      "prepaid": "807600319903",
      // "postpaid": "785147545023",
    },
  },
];

List<Map<String, dynamic>> transactionHistory = [
  {
    'name': 'Wallet topup',
    'amount': 15000,
    'type': 'Top Up',
    'income': true,
    'category': 'wallet',
    'date': 'Jun 01, 2024',
  },
  {
    'name': 'DSTV subscription',
    'amount': 1500,
    'type': 'Bill Payment',
    'income': false,
    'category': 'cable',
    'date': 'May 30, 2024',
  },
  {
    'name': 'GOTV subscription',
    'amount': 1000,
    'type': 'Bill Payment',
    'income': false,
    'category': 'cable',
    'date': 'May 28, 2024',
  },
  {
    'name': 'AIRTEL airtime',
    'amount': 500,
    'type': 'Airtime Purchase',
    'income': false,
    'category': 'airtime',
    'date': 'May 25, 2024',
  },
  {
    'name': 'MTN airtime',
    'amount': 300,
    'type': 'Airtime Purchase',
    'income': false,
    'category': 'airtime',
    'date': 'May 23, 2024',
  },
  {
    'name': 'Wallet topup',
    'amount': 2500,
    'type': 'Top Up',
    'income': true,
    'category': 'wallet',
    'date': 'May 20, 2024',
  },
  {
    'name': 'MTN data',
    'amount': 2000,
    'type': 'Data Purchase',
    'income': false,
    'category': 'data',
    'date': 'May 18, 2024',
  },
  {
    'name': 'Airtel data',
    'amount': 1000,
    'type': 'Data Purchase',
    'income': false,
    'category': 'data',
    'date': 'May 15, 2024',
  },
  {
    'name': 'AEDC utility',
    'amount': 5000,
    'type': 'Bill Payment',
    'income': false,
    'category': 'electricity',
    'date': 'May 12, 2024',
  },
  {
    'name': 'MTN airtime',
    'amount': 150,
    'type': 'Airtime Purchase',
    'income': false,
    'category': 'airtime',
    'date': 'May 10, 2024',
  },
];

List cableProviders = [
  {
    "name": "DSTV",
    "image": "assets/dstvlogo.png",
    "customerfield": "Smart Card Number",
  },
  {
    "name": "GOTV",
    "image": "assets/gotvlogo.png",
    "customerfield": "IUC Number",
  },
  {
    "name": "Startimes",
    "image": "assets/yedc.png",
    "customerfield": "Customer ID",
  },
  {
    "name": "Kwese TV",
    "image": "assets/yedc.png",
    "customerfield": "Account Number",
  },
  {
    "name": "TSTV",
    "image": "assets/yedc.png",
    "customerfield": "Customer ID",
  },
];

List dstvPlans = [
  {'name': 'DSTV Compact', 'amount': 15700},
  {'name': 'DSTV Premium', 'amount': 37000},
  {'name': 'DSTV Confam', 'amount': 9300},
  {'name': 'DSTV Yanga', 'amount': 5100},
];
List gotvPlans = [
  {'name': 'GOTV Supa', 'amount': 9600},
  {'name': 'GOTV max', 'amount': 7200},
  {'name': 'GOTV Jolli', 'amount': 4850},
  {'name': 'GOTV Jinja', 'amount': 3300},
  {'name': 'GOTV Smallie', 'amount': 1575},
];
List startimesPlans = [
  {'name': 'Classic Monthly', 'amount': 4500},
  {'name': 'Basic Monthly', 'amount': 3000},
  {'name': 'Nova Monthly', 'amount': 1500},
  {'name': 'Classic Weekly', 'amount': 1500},
  {'name': 'Basic Weekly', 'amount': 1000},
  {'name': 'Nova Weekly', 'amount': 500},
];
List tstvPlans = [
  {'name': 'TSTV Monthly', 'amount': 3000},
  {'name': 'TSTV 15 days', 'amount': 1500},
  {'name': 'TSTV 10 days', 'amount': 1000},
  {'name': 'TSTV 1 week', 'amount': 750},
  {'name': 'TSTV 3 days', 'amount': 500},
  {'name': 'TSTV 1 days', 'amount': 200},
];

List dataPlans = [
  {'name': '100MB, Daily Plan', 'amount': 100},
  {'name': '200MB, 2-day Plan', 'amount': 200},
  {'name': '1.5GB + 2.4gb youtube night, Daily Plan', 'amount': 350},
  {'name': '2.5GB, 2-day Plan', 'amount': 600},
  {'name': '1GB + 1gb youtube, Weekly Plan', 'amount': 600},
  {'name': '1.5GB, Monthly Plan', 'amount': 1000},
  {'name': '1.5GB + 2.4gb youtube night, Monthly Plan', 'amount': 1000},
];

List<String> nigerianBanks = [
  'Access Bank',
  'Citibank',
  'Ecobank',
  'Fidelity Bank',
  'First Bank of Nigeria',
  'First City Monument Bank (FCMB)',
  'Guaranty Trust Bank (GTBank)',
  'Heritage Bank',
  'Jaiz Bank',
  'Keystone Bank',
  'Polaris Bank',
  'Providus Bank',
  'Stanbic IBTC Bank',
  'Standard Chartered Bank',
  'Sterling Bank',
  'SunTrust Bank',
  'Union Bank',
  'United Bank for Africa (UBA)',
  'Unity Bank',
  'Wema Bank',
  'Zenith Bank',
];
