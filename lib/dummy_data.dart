class FavoriteModel {
  String? name;
  String? imageUrl;

  FavoriteModel({
    this.name,
    this.imageUrl,
  });
}

final favoriteData = [
  FavoriteModel(
    name: 'Cheema Supermarket',
    imageUrl:
        'https://images.unsplash.com/photo-1488459716781-31db52582fe9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  FavoriteModel(
    name: 'Grocery Babu',
    imageUrl:
        'https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
  ),
  FavoriteModel(
    name: 'Ligate Supermarket',
    imageUrl:
        'https://images.unsplash.com/photo-1533900298318-6b8da08a523e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  FavoriteModel(
    name: 'Vegetable Market',
    imageUrl:
        'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
  ),
];

final featureProduct = [
  'Lentils',
  'Nadia Chawal',
  'Shan Biryani',
  'Anda Burger'
];

class StoresModel {
  String? name;
  String? imageUrl;
  String? address;

  StoresModel({
    this.name,
    this.imageUrl,
    this.address,
  });
}

final storesData = [
  StoresModel(
    name: 'Taj Mahal Desi Bazaar',
    imageUrl:
        'https://images.unsplash.com/photo-1528698827591-e19ccd7bc23d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
    address: '845 Rockville Pike, Rockville, MD , US, 2 miles away',
  ),
  StoresModel(
    name: 'Desi Bazaar',
    imageUrl:
        'https://images.unsplash.com/photo-1510226621137-6285ff880db6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    address: '845 Rockville Pike, Rockville, MD , US, 3.1 miles away',
  ),
  StoresModel(
    name: 'Pavan Foods',
    imageUrl:
        'https://images.unsplash.com/photo-1516274626895-055a99214f08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    address: '845 Rockville Pike, Rockville, MD , United States',
  ),
  StoresModel(
    name: 'Al-Basit Restaurant',
    imageUrl:
        'https://images.unsplash.com/photo-1564227503787-ad186f508e6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
    address: '845 Rockville Pike, Rockville, MD , United States',
  ),
];

List<String> orderStatus = [
  "Processing",
  "Completed",
  "All orders",
  "Picked up"
];

final storeStatus = ["Featured", 'All', "Meat", 'Flour', 'Rice', 'Vegetables'];

class StoreItems {
  String? imageUrl;
  double? price;
  String? itemName;
  String? weight;

  StoreItems({
    this.imageUrl,
    this.price,
    this.itemName,
    this.weight,
  });
}

final storeItems = [
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1013&q=80',
    price: 5.99,
    itemName: 'Goat Boneless Meat',
    weight: '1 lbs',
  ),
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1591465001609-ded6360ecaab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    price: 0.99,
    itemName: 'Shan Tandoori Masala',
    weight: '50 gms',
  ),
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1566824099147-bef027d3a333?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    price: 10.99,
    itemName: 'Mix Special Masalas',
    weight: '1 lbs',
  ),
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1624935984039-395c058e3944?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    price: 128.99,
    itemName: 'Special Daal Variety',
    weight: '1 lbs',
  ),
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1624935984039-395c058e3944?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    price: 128.99,
    itemName: 'Special Daal Variety',
    weight: '1 lbs',
  ),
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1566824099147-bef027d3a333?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    price: 10.99,
    itemName: 'Mix Special Masalas',
    weight: '1 lbs',
  ),
  StoreItems(
    imageUrl:
        'https://images.unsplash.com/photo-1566824099147-bef027d3a333?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    price: 10.99,
    itemName: 'Mix Special Masalas',
    weight: '1 lbs',
  ),
];

class ProductOptionsModel {
  String? name;
  double? prince;
  ProductOptionsModel({this.name, this.prince});
}

final productOptions = [
  ProductOptionsModel(name: 'Biryani Cut', prince: 12.00),
  ProductOptionsModel(name: 'Karaahi Cut', prince: 12.00),
  ProductOptionsModel(name: 'Option 3', prince: 12.00),
];

final removeItemReasonsList = [
  ProductOptionsModel(name: 'Remove from order'),
  ProductOptionsModel(
    name: 'Contact me',
  ),
  ProductOptionsModel(name: 'Cancel entire order'),
];

final categories_list_item = [
  'Lentils',
  'Spices',
  'Drinks & Beverages',
  'Juices',
  'Lentils',
  'Spices',
  'Drinks & Beverages',
  'Juices'
];

final productDescriptionListTile = [
  "https://hinzcooking.com/wp-content/uploads/2022/03/rooh-afza-drink.jpg",
  "https://th.bing.com/th/id/OIP.6LLdem8OpzQboRmOCV6vxQAAAA?pid=ImgDet&w=202&h=310&c=7"
];
