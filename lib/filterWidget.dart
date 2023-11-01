import 'package:e_commerce/manage_products.dart';
import 'package:e_commerce/services/Categories.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';

import 'googleFonts.dart';

void main() {
  runApp(MyApp());
}


double _minPrice = 0;
double _maxPrice = 100;

TextEditingController _minPriceController = TextEditingController();
TextEditingController _maxPriceController = TextEditingController();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // home: FilterScreen(token: '', id: ''),
     // home: FilterScreen(token: '', id: ''),
    );
  }
}

class FilterOptions {
  late List<String> categories;
  late Map<String, List<String>> subcategories;
  late double minPrice;
  late double maxPrice;
  late List<String> sizes;
  late List<String> brands;
}


class FilterScreen extends StatefulWidget {

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedCategoryIndex = -1;
  int selectedButtonIndex = 0;
  List<String> selectedCategories = [];
  Map<String, List<String>> selectedSubcategories = {};
  FilterOptions selectedFilters = FilterOptions();


  List<String> categories = Categories.categories;
  Map<String, List<String>> subcategories = {
    "Electronics": ["Laptops", "Smartphones", "Tablets"],
    "Clothing": ["Shirts", "Dresses", "Jeans"],
    "Furniture": ["Sofas", "Tables", "Chairs"],
  };

  List<String> filters = [
    "Category",
    "Sub-category",
    "Price Range",
    "Ratings",
    "Discount Range",
  ];

  void onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }



  void onResetFilters() {
    setState(() {
      // Clear the selected categories, subcategories, and other filter options
      selectedCategories.clear();
      selectedSubcategories.clear();
      // Reset the price range
      _minPrice = 0;
      _maxPrice = 100;
      _minPriceController.text = '0';
      _maxPriceController.text = '100';

    });
  }

  void onApplyFilters() {
    selectedFilters.categories = selectedCategories;
    selectedFilters.subcategories = selectedSubcategories;
    selectedFilters.minPrice = _minPrice;
    selectedFilters.maxPrice = _maxPrice;

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ManageProducts(token:  '', id: '',
      selectedcategories: selectedFilters.categories,selectedsubcategories: selectedFilters.subcategories,
      selectedmaxPrice: selectedFilters.minPrice,selectedminPrice: selectedFilters.maxPrice, sortt: "",),));

  }


  Widget buildCategoryScreen() {

    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isChecked = selectedCategories.contains(categories[index]);

          return Container(
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:
                Container(
                  padding: EdgeInsets.all(16),
                  color: isChecked
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.white,
                  child: Text(categories[index]),
                ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (selected) {
                    setState(() {
                      if (selected != null) {  // Ensure selected is not null
                        if (selected) {
                          selectedCategories.add(categories[index]);
                        } else {
                          selectedCategories.remove(categories[index]);
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSubcategoryScreen() {

    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: selectedCategories.length,
        itemBuilder: (context, categoryIndex) {
          final category = selectedCategories[categoryIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Text(category),
              ListView.builder(
                shrinkWrap: true,
                itemCount: subcategories[category]!.length,
                itemBuilder: (context, subcategoryIndex) {
                  final subcategory = subcategories[category]![subcategoryIndex];
                  final isSelected = selectedSubcategories[category]?.contains(subcategory) ?? false;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(subcategory),
                      Checkbox(
                        value: isSelected,
                        onChanged: (selected) {
                          setState(() {
                            if (selected != null) {
                              if (selected) {
                                if (selectedSubcategories[category] == null) {
                                  selectedSubcategories[category] = [];
                                }
                                selectedSubcategories[category]!.add(subcategory);
                              } else {
                                selectedSubcategories[category]?.remove(subcategory);
                              }
                            }
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }


  Widget buildPriceCategoryScreen() {
    return PriceRangeSlider() ;
  }

  Widget buildRatingsScreen() {
    if (selectedCategoryIndex == -1) {
      return Center(
        child: Text("Please select a category first."),
      );
    } else {
      final selectedCategory = categories[selectedCategoryIndex];
      return ListView.builder(
        itemCount: subcategories[selectedCategory]!.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Text(subcategories[selectedCategory]![index]),
          );
        },
      );
    }
  }

  Widget buildScreen() {
    if (selectedCategoryIndex == -1) {
      return Center(
        child: Text("Please select a category first."),
      );
    } else {
      final selectedCategory = categories[selectedCategoryIndex];
      return ListView.builder(
        itemCount: subcategories[selectedCategory]!.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Text(subcategories[selectedCategory]![index]),
          );
        },
      );
    }
  }

  Widget buildDiscountScreen() {
    if (selectedCategoryIndex == -1) {
      return Center(
        child: Text("Please select a category first."),
      );
    } else {
      final selectedCategory = categories[selectedCategoryIndex];
      return ListView.builder(
        itemCount: subcategories[selectedCategory]!.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Text(subcategories[selectedCategory]![index]),
          );
        },
      );
    }
  }



  Widget buildFilterScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return buildCategoryScreen();
      case 1:
        return buildSubcategoryScreen();
      case 2:
        return buildPriceCategoryScreen();
      case 3:
        return buildRatingsScreen();
      case 4:
        return buildDiscountScreen();
      default:
        return Center(
          child: Text("Content for ${filters[selectedIndex]}"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Screen',style: headingMediumStyle,),
        actions: [
          TextButton(
            onPressed: (){
              onResetFilters();
            },
            child: Text('Reset',style: headingSmallStyle,),
          ),
          TextButton(
            onPressed: (){
              onApplyFilters();
            },
            child: Text('Apply',style: headingSmallStyle,),
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Column - Buttons
          Container(
            width: 150,
            child: ListView.builder(
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedButtonIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: index == selectedButtonIndex ? Colors.blue.withOpacity(0.5) : Colors.white,
                    child: Text(filters[index]),
                  ),
                );
              },
            ),
          ),
          // Right Column - Windows
          Expanded(
            child: buildFilterScreen(selectedButtonIndex),
          ),
        ],
      ),
    );
  }
}





void showCategoryScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      // Sample list of categories and subcategories

      return FilterScreen();
    },
  );
}

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {


  @override
  void initState() {
    super.initState();
    _minPriceController.text = '$_minPrice';
    _maxPriceController.text = '$_maxPrice';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 22,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: headingSmallStyle,),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    ' $_minPrice Rs. -',
                    style: captionStyle,
                  ),
                ),
                SizedBox(width: 12,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '$_maxPrice Rs.',
                    style: captionStyle,
                  ),
                ),
              ],),
            RangeSlider(
              values: RangeValues(_minPrice, _maxPrice),
              min: 0,
              max: 100,
              onChanged: (RangeValues newValues) {
                setState(() {
                  _minPrice = newValues.start;
                  _maxPrice = newValues.end;
                  _minPriceController.text = '$_minPrice';
                  _maxPriceController.text = '$_maxPrice';
                });
              },
              divisions: 5,
              labels: RangeLabels('$_minPrice', '$_maxPrice'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: captionStyle,
                    controller: _minPriceController,
                    onChanged: (value) {
                      if (double.tryParse(value) != null) {
                        setState(() {
                          _minPrice = double.parse(value);
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Min Price',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: captionStyle,
                    controller: _maxPriceController,
                    onChanged: (value) {
                      if (double.tryParse(value) != null) {
                        setState(() {
                          _maxPrice = double.parse(value);
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Max Price',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SizeChips extends StatefulWidget {
  @override
  _SizeChipsState createState() => _SizeChipsState();
}

class _SizeChipsState extends State<SizeChips> {
  List<String> selectedSizes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
            Text('Size',style: headingSmallStyle,),
            SizedBox(height: 18,),
            Wrap(
              spacing: 8,
              children: [
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('S'),
                    selected: selectedSizes.contains('S'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSizes.add('S');
                        } else {
                          selectedSizes.remove('S');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('M'),
                    selected: selectedSizes.contains('M'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSizes.add('M');
                        } else {
                          selectedSizes.remove('M');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('L'),
                    selected: selectedSizes.contains('L'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSizes.add('L');
                        } else {
                          selectedSizes.remove('L');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('XL'),
                    selected: selectedSizes.contains('XL'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSizes.add('XL');
                        } else {
                          selectedSizes.remove('XL');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('XXL'),
                    selected: selectedSizes.contains('XXL'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSizes.add('XXL');
                        } else {
                          selectedSizes.remove('XXL');
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Selected Sizes: ${selectedSizes.join(", ")}',style: captionStyle,)
          ],
        ),
      ),
    );
  }
}



class BrandsChips extends StatefulWidget {
  @override
  _BrandsChipsState createState() => _BrandsChipsState();
}

class _BrandsChipsState extends State<BrandsChips> {
  List<String> selectedBrands = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 12,),
          Text('Size',style: headingSmallStyle,),
          SizedBox(height: 18,),
          Padding(padding: EdgeInsets.all(12),
            child: Wrap(
              spacing: 8,
              children: [
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('S'),
                    selected: selectedBrands.contains('S'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedBrands.add('S');
                        } else {
                          selectedBrands.remove('S');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('M'),
                    selected: selectedBrands.contains('M'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedBrands.add('M');
                        } else {
                          selectedBrands.remove('M');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('L'),
                    selected: selectedBrands.contains('L'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedBrands.add('L');
                        } else {
                          selectedBrands.remove('L');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('XL'),
                    selected: selectedBrands.contains('XL'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedBrands.add('XL');
                        } else {
                          selectedBrands.remove('XL');
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child:  FilterChip(
                    label: Text('XXL'),
                    selected: selectedBrands.contains('XXL'),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedBrands.add('XXL');
                        } else {
                          selectedBrands.remove('XXL');
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text('Selected Sizes: ${selectedBrands.join(", ")}',style: captionStyle,)
        ],
      ),
    );
  }
}