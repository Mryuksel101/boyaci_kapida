class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.quantity = 0,
    this.money = 0,
  });

  String title;
  int quantity;
  int money;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/icons/package.png',
      title: 'Minimum Paket',
      quantity: 20,
      money: 250,
    ),
    Category(
      imagePath: 'assets/icons/package.png',
      title: 'Maximum Paket',
      quantity: 50,
      money: 500,
    ),
  ];

  static List<Category> applyCategoryList = <Category>[
    Category(
      imagePath: 'assets/icons/package.png',
      title: 'Usta Olmak İstiyorum',
    ),
    Category(
      imagePath: 'assets/icons/package.png',
      title: 'Teklif Almak İstiyorum',
    ),
  ];
}
