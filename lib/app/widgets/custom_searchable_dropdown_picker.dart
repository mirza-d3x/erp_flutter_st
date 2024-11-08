import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchableDropdownPicker extends StatefulWidget {
  final String? selectedValue;
  final List<String> items;
  final String placeholder;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onChanged;
  final double width;

  const CustomSearchableDropdownPicker({
    super.key,
    this.selectedValue,
    required this.items,
    this.placeholder = 'Select',
    this.validator,
    this.onChanged,
    this.width = 90,
  });

  @override
  CustomSearchableDropdownPickerState createState() =>
      CustomSearchableDropdownPickerState();
}

class CustomSearchableDropdownPickerState
    extends State<CustomSearchableDropdownPicker> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredItems = [];
  bool _isDropdownOpen = false;
  String? _selectedItem;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _selectedItem = widget.selectedValue;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Detects taps outside the dropdown to close it
          GestureDetector(
            onTap: () {
              _removeOverlay();
              setState(() {
                _isDropdownOpen = false;
              });
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              color: Colors.transparent, // Makes the entire screen tappable
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height,
            width: size.width,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                decoration: BoxDecoration(
                  color: customColors().grey100,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200, // Set a maximum height for the dropdown list
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: _filteredItems.isNotEmpty
                              ? _filteredItems.map((item) {
                                  return ListTile(
                                    title: Text(
                                      item,
                                      style: TextStyle(
                                        color: customColors().grey900,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _selectedItem = item;
                                        _isDropdownOpen = false;
                                        _searchController.clear();
                                      });
                                      _removeOverlay();
                                      if (widget.onChanged != null) {
                                        widget.onChanged!(item);
                                      }
                                    },
                                  );
                                }).toList()
                              : [
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('No items found'),
                                  ),
                                ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Container(
        height: 56,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: customColors().grey300, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedItem ?? widget.placeholder,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
            Icon(
              _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
