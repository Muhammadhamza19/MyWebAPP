import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return null
      return null;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return null
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, return null
      return null;
    }

    // Permissions are granted, get the current position
    return await Geolocator.getCurrentPosition();
  }

  Future<List<Placemark>> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      return await placemarkFromCoordinates(latitude, longitude);
    } catch (e) {
      print('Error fetching address: $e');
      return [];
    }
  }
}
