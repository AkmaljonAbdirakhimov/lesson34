class Product {
  final String productTitle;
  final String productImage;
  final String productDescription;

  const Product({
    required this.productDescription,
    required this.productImage,
    required this.productTitle,
  });
}

class ProductsManager {
  final List<Product> products = const [
    Product(
      productDescription: "Id dolore deserunt amet ad labore irure enim.",
      productImage:
          "https://www.apple.com/ecc-shared/iphone/cellular/images/meta/iphone__ky2k6x5u6vue_og.png",
      productTitle: "iPhone 15",
    ),
    Product(
      productDescription: "Id dolore deserunt amet ad labore irure enim.",
      productImage:
          "https://www.apple.com/newsroom/images/product/mac/standard/Apple_new-macbookair-wallpaper-screen_11102020_big.jpg.large.jpg",
      productTitle: "Macbook 15",
    ),
    Product(
      productDescription: "Id dolore deserunt amet ad labore irure enim.",
      productImage:
          "https://uzbekcook.files.wordpress.com/2016/02/uzbek-palov.jpg",
      productTitle: "Siz uchun palov",
    ),
  ];
}
