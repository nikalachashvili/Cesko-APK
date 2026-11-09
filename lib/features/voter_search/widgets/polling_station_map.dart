import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/features/voter_search/models/polling_station.dart';

/// Static (non-interactive, so it doesn't fight the page scroll)
/// OpenStreetMap preview with a pin on the polling station.
class PollingStationMap extends StatelessWidget {
  const PollingStationMap({super.key, required this.station});

  final PollingStation station;

  @override
  Widget build(BuildContext context) {
    final point = LatLng(station.latitude, station.longitude);

    return Semantics(
      image: true,
      label: 'საარჩევნო უბნის მდებარეობა რუკაზე',
      child: ExcludeSemantics(
        child: AspectRatio(
          aspectRatio: 1.15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: point,
                initialZoom: 15,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.none,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.voters',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: point,
                      width: 44,
                      height: 44,
                      alignment: Alignment.topCenter,
                      child: const Icon(
                        Icons.location_on,
                        color: AppColors.green,
                        size: 44,
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: ColoredBox(
                    color: Color(0xCCFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Text(
                        '© OpenStreetMap',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
