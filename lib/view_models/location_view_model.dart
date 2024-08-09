import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:local_grocery/support/service/location_service.dart';

class LocationViewModel extends GetxController {
  Rxn<Position> _location = Rxn<Position>();
  Rxn<String> _address = Rxn<String>();
  Rxn<String> _street = Rxn<String>();
  Rxn<String> _locality = Rxn<String>();
  Rxn<String> _postalCode = Rxn<String>();
  Rxn<String> _country = Rxn<String>();
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  final LocationService _locationService = LocationService();

  /// load view model
  static LocationViewModel load() {
    if (!Get.isRegistered<LocationViewModel>()) {
      return Get.put(
        LocationViewModel(),
      );
    } else {
      final viewModel = Get.find<LocationViewModel>();
      return viewModel;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _getLocation();
  }

  void _getLocation() async {
    isLoading.value = true;
    try {
      _location.value = await _locationService.getLocation();
      if (_location.value != null) {
        await _getAddress(
            _location.value!.latitude, _location.value!.longitude);
      } else {
        errorMessage.value =
            'Location services are disabled or permissions denied.';
      }
    } catch (e) {
      errorMessage.value = 'Failed to get location: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await _locationService.getAddressFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        _address.value =
            "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
        _street.value = place.street ?? '';
        _locality.value = place.locality ?? '';
        _postalCode.value = place.postalCode ?? '';
        _country.value = place.country ?? '';
      } else {
        errorMessage.value = 'No address found for the given coordinates.';
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch address: $e';
    }
  }

  /// getters
  double get latitude => _location.value?.latitude ?? 0.0;
  double get longitude => _location.value?.longitude ?? 0.0;
  String get fullAddress => _address.value ?? '';
  String get street => _street.value ?? '';
  String get locality => _locality.value ?? '';
  String get postalCode => _postalCode.value ?? '';
  String get country => _country.value ?? '';
}
