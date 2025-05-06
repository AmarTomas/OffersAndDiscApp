

# Yemen Offers - عروض وتخفيضات اليمن 
An app that gathers the best offers and discounts from Yemeni stores in one place!

---

## 📱 App Screenshots 

| Home Page                                                                                               | Categories                                                                                              | Store Page                                                                                              |
| ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/user-attachments/assets/a4e89f44-7fa4-4ef1-8eef-27363e89ef2a" width="200"> | <img src="https://github.com/user-attachments/assets/81d410b1-a7d6-42ea-a5f2-4c40972757eb" width="200"> | <img src="https://github.com/user-attachments/assets/8ed935c5-aa77-46d3-822a-57cf1b083061" width="200"> |
| Selecte City|| Interactive store page                                                                                  |
| <img src="https://github.com/user-attachments/assets/35d695ec-6b29-4855-ad49-87eea101761d" width="200"> | | <img src="https://github.com/user-attachments/assets/82d90cfd-c0ca-445e-9d9b-fd0461458e5d" width="200"> |
---

##  Key Features 
- **Browse offers by category** (Clothing, Home Appliances, Electronics, etc.). 
- **Interactive store page** with history of previous offers. 
- **Instant notifications** when new offers are added. 
- **Share offers** via social media. 
- **Quick search** for stores or products. 
  
---
## Technology Used
| Technology                                                     | Purpose                                                               |
| -------------------------------------------------------------- | --------------------------------------------------------------------- |
| <span style="color:rgb(17, 176, 228) ;">Flutter</span>         | <span style="color:rgb(17, 176, 228) ;">Front-end development </span> |
| <span style="color:rgba(226, 210, 33, 0.97) ;">Firebase</span> | <span style="color:rgb(226, 210, 33, 0.97) ;">notifications</span>    |
| <span style="color:rgb(42, 155, 193) ;">MySql</span>           | <span style="color:rgb(42, 155, 193) ;">Database </span>              |
| <span style="color:rgb(127, 120, 49) ;">Provider</span>        | <span style="color:rgb(127, 120, 49) ;">State managemnet </span>      |

--- 
## Example Code
#####  Flutter: Display Products on Home Page
### Model 
```dart
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int id;
  String title;
  DateTime startDate;
  DateTime endDate;
  int storeId;
  String urlImage;
  int productUrlImage;

  Product({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.storeId,
    required this.urlImage,
    required this.productUrlImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["Id"],
    title: json["Title"],
    startDate: DateTime.parse(json["StartDate"]),
    endDate: DateTime.parse(json["EndDate"]),
    storeId: json["StoreId"],
    urlImage: json["UrlImage"],
    productUrlImage: json["url_image"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "StartDate": startDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
    "StoreId": storeId,
    "UrlImage": urlImage,
    "url_image": productUrlImage,
  };
}
```
### Provider 
```dart 
class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = false;
  Future<void> fetchData(int cityId, int typeId) async {
    isLoading = true;
    try {
      final url =
          'https://.../GetProdua1ctsByTypd1amaeAndCity?kp=$idAm&type_id=$typeId&cit_id=$cityId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        products = jsonData
            .map((data) => Product.fromJson(data as Map<String, dynamic>))
            .toList(); // Convert each map to a Product object
        notifyListeners();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('Error: ');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
```
### UI
```dart
                  final products = productProvider.products;
                  return GridView.builder(
                      // controller: _scrollController,
                      physics: const ClampingScrollPhysics(),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 0,
                        childAspectRatio:
                            screenWidthFraction / screenHeightFraction,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Images(
                                productId: product.id,
                                name: product.title,
                              );
                            }));
                          },
                          child: SizedBox(
                            height:
                                constraints.maxHeight * screenHeightFraction,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: double.infinity,
                                    child: Card(
                                      color:Colors.white,
                                      margin: const EdgeInsets.only(
                                          right: 4, left: 4),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5.0),
                                            height: isSmallWidth ? 50 : 53,
                                            alignment: Alignment.center,
                                            child: Text(
                                              product.title,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.6),
                                                  fontSize:
                                                      isSmallWidth ? 14 : 14),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // if (!productProvider.isLoading)
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(15)),
                                              child: AspectRatio(
                                                  aspectRatio: 1.0,
                                                  child: CachedNetworkImage(
                                                    alignment: Alignment.topCenter,
                                                    imageUrl: product.urlImage,
                                                    fit: BoxFit.fill,
                                                    errorWidget: (context, url, error) {
                                                      return Image.asset('images/ic_error.png');
                                                    },
                                                    width: MediaQuery.of(context).size.width,
                                                    placeholder: (context, url) {
                                                      return Container( height: 70,width: 70,child: Center(child:  CircularProgressIndicator(
                                                        color: Color(0xFF4272BF),
                                                      )));
                                                    },


                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: isMobile
                                      ? constraints.maxWidth * 0.6
                                      : (isSmallWidth ? 200 : 190),
                                  child: Card(
                                    color:
                                        Colors.white,
                                    margin: const EdgeInsets.all(5),
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 3),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0,
                                                  right: 4.0,
                                                  bottom: 3.0),
                                              child: Image.asset(
                                                'images/card_i.png',
                                                width: 30,
                                                height: 34,
                                                color: Theme.of(context)
                                                    .shadowColor,
                                              ),
                                            ),
                                            Text(
                                              "${product.productUrlImage}",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RotationTransition(
                                              turns: product.endDate.isBefore(
                                                      DateTime.now().toLocal())
                                                  ? const AlwaysStoppedAnimation(
                                                      0)
                                                  : _animation,
                                              child: Icon(
                                                Icons.access_time_rounded,
                                                color: product.endDate.isBefore(
                                                        DateTime.now()
                                                            .toLocal())
                                                    ? Colors.red
                                                    : Colors.green,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Text(
                                                formatDateRange(
                                                  product.startDate,
                                                  product.endDate,
                                                ),
                                                style: TextStyle(
                                                  fontSize:
                                                      isSmallWidth ? 12 : 14,
                                                  color: product.endDate
                                                          .isBefore(
                                                              DateTime.now()
                                                                  .toLocal())
                                                      ? Colors.red
                                                      : Colors.green,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
```




